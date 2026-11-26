using System;
using System.Collections.Generic;
using System.Linq;
using BalkanMod.Settings;
using BalkanMod.TimeControl;
using TaleWorlds.CampaignSystem;
using TaleWorlds.CampaignSystem.Actions;
using TaleWorlds.CampaignSystem.CampaignBehaviors;
using TaleWorlds.Library;
using TaleWorlds.Localization;

namespace BalkanMod.Story
{
    /// <summary>
    /// „Zwischen den Kriegen“: Die Ereignisse aus data/ereignisse.toml treten zu ihrem Datum ein (Krieg, Frieden,
    /// Bündnis zwischen den Reichen) und werden in einem Fenster erzählt. Jedes Ereignis nur einmal pro Kampagne
    /// (steht im Spielstand). Abschaltbar im MCM-Menü; ein abgeschaltetes Ereignis wird auch später nicht nachgeholt.
    /// </summary>
    public class HistoricalEventsBehavior : CampaignBehaviorBase
    {
        private const int DaysInYear = 84;

        private List<string> _done = new List<string>();

        /// <summary>false bei Spielständen von vor dieser Version: vergangene Ereignisse dann still überspringen.</summary>
        private bool _started;

        public override void RegisterEvents()
        {
            CampaignEvents.OnNewGameCreatedEvent.AddNonSerializedListener(this, _ =>
            {
                _started = true;
                Check();
            });
            CampaignEvents.DailyTickEvent.AddNonSerializedListener(this, Check);
        }

        public override void SyncData(IDataStore dataStore)
        {
            dataStore.SyncData("balkan_events_done", ref _done);
            dataStore.SyncData("balkan_events_started", ref _started);
            if (_done == null)
            {
                _done = new List<string>();
            }
        }

        private void Check()
        {
            var now = CampaignTime.Now.ToDays;
            var silent = !_started;
            _started = true;
            foreach (var e in BalkanEventTable.Events)
            {
                if (_done.Contains(e.Id))
                {
                    continue;
                }

                var due = (double)(e.Year - CampaignYearPatch.YearOffset) * DaysInYear + (e.Day - 1);
                if (now < due)
                {
                    continue;
                }

                _done.Add(e.Id);
                if (!silent && (BalkanSettings.Instance?.HistoricalEvents ?? true))
                {
                    Fire(e);
                }
            }
        }

        private static void Fire(BalkanEvent e)
        {
            var applied = false;
            foreach (var (kind, id1, id2) in e.Actions)
            {
                try
                {
                    applied |= Apply(kind, Find(id1), Find(id2));
                }
                catch (Exception ex)
                {
                    Debug.Print($"[BalkanMod] Ereignis {e.Id}: {kind} {id1}/{id2} fehlgeschlagen: {ex.Message}");
                }
            }

            if (applied)
            {
                InformationManager.ShowInquiry(new InquiryData(new TextObject(e.Title).ToString(), new TextObject(e.Text).ToString(),
                    true, false, new TextObject("{=balkan_ok}Continue").ToString(), "", null, null), true);
            }
        }

        private static Kingdom Find(string id)
        {
            return Kingdom.All.FirstOrDefault(k => k.StringId == id && !k.IsEliminated);
        }

        private static bool Apply(string kind, Kingdom a, Kingdom b)
        {
            if (a == null || b == null)
            {
                return false;
            }

            var atWar = FactionManager.IsAtWarAgainstFaction(a, b);
            switch (kind)
            {
                case "krieg":
                    if (atWar)
                    {
                        return false;
                    }

                    DeclareWarAction.ApplyByDefault(a, b);
                    return true;
                case "frieden":
                    if (!atWar)
                    {
                        return false;
                    }

                    MakePeaceAction.Apply(a, b);
                    return true;
                case "buendnis":
                    var alliances = Campaign.Current.GetCampaignBehavior<IAllianceCampaignBehavior>();
                    if (alliances == null || atWar || alliances.IsAllyWithKingdom(a, b))
                    {
                        return false;
                    }

                    alliances.StartAlliance(a, b);
                    return true;
                default:
                    return false;
            }
        }
    }
}
