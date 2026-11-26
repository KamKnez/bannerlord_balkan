using System.Collections.Generic;
using System.Linq;
using BalkanMod.Settings;
using TaleWorlds.CampaignSystem;
using TaleWorlds.CampaignSystem.Actions;
using TaleWorlds.CampaignSystem.Party;
using TaleWorlds.CampaignSystem.Settlements;
using TaleWorlds.Core;
using TaleWorlds.Library;
using TaleWorlds.Localization;
using TaleWorlds.ObjectSystem;

namespace BalkanMod.Story
{
    /// <summary>
    /// Geführter Aufstieg: Nach der Charaktererstellung (erste Stunde auf der Karte) wählt man eine Startgeschichte,
    /// die zur Kultur der Figur passt (data/aufstieg.toml), oder das freie Spiel. Die Geschichte setzt Ort, Truppen,
    /// Gold und Beziehung und startet den Auftrag <see cref="BalkanRiseQuest"/>. Nur in der Sandbox, einmal pro
    /// Kampagne, abschaltbar im MCM-Menü.
    /// </summary>
    public class GuidedRiseBehavior : CampaignBehaviorBase
    {
        /// <summary>Ältere Kampagnen (geladene Spielstände) bekommen keine Startwahl mehr.</summary>
        private const double MaxCampaignAgeDays = 2;

        private bool _offered;

        public override void RegisterEvents()
        {
            CampaignEvents.HourlyTickEvent.AddNonSerializedListener(this, OnHourlyTick);
        }

        public override void SyncData(IDataStore dataStore)
        {
            dataStore.SyncData("balkan_rise_offered", ref _offered);
        }

        private void OnHourlyTick()
        {
            if (_offered || MobileParty.MainParty == null || Hero.MainHero == null || !Hero.MainHero.IsAlive)
            {
                return;
            }

            _offered = true;
            var campaign = Campaign.Current;
            var age = CampaignTime.Now.ToDays - campaign.Models.CampaignTimeModel.CampaignStartTime.ToDays;
            if (!(BalkanSettings.Instance?.GuidedRise ?? true) || age > MaxCampaignAgeDays
                || campaign.GetType().FullName?.StartsWith("StoryMode") == true)
            {
                return;
            }

            var culture = Hero.MainHero.Culture?.StringId;
            var starts = BalkanRiseTable.Starts.Where(s => s.Cultures.Contains(culture) && Settlement.Find(s.Settlement) != null).ToList();
            if (starts.Count == 0)
            {
                return;
            }

            var elements = starts
                .Select(s => new InquiryElement(s, new TextObject(s.Name).ToString(), null, true,
                    new TextObject(s.Text) + "\n\n" + BalkanRiseQuest.GoalText(s)))
                .ToList();
            elements.Add(new InquiryElement(null, new TextObject("{=balkan_rise_free}Free play").ToString(), null, true,
                new TextObject("{=balkan_rise_free_hint}No story and no goal. You start where the game puts you.").ToString()));

            MBInformationManager.ShowMultiSelectionInquiry(new MultiSelectionInquiryData(
                new TextObject("{=balkan_rise_choose}How does your story begin?").ToString(),
                new TextObject("{=balkan_rise_choose_text}Choose a start. Once you have reached its goal, the game is yours to play freely.").ToString(),
                elements, false, 1, 1, new TextObject("{=balkan_ok}Continue").ToString(), "",
                chosen => Begin(chosen.FirstOrDefault()?.Identifier as BalkanRiseStart), null), true);
        }

        private static void Begin(BalkanRiseStart start)
        {
            if (start == null)
            {
                return;
            }

            var settlement = Settlement.Find(start.Settlement);
            var party = MobileParty.MainParty;
            party.Position = settlement.GatePosition;
            party.SetMoveModeHold();

            var culture = Hero.MainHero.Culture?.StringId;
            foreach (var (troopCulture, troopId, count) in start.Troops)
            {
                var troop = troopCulture == culture ? MBObjectManager.Instance.GetObject<CharacterObject>(troopId) : null;
                if (troop != null)
                {
                    party.MemberRoster.AddToCounts(troop, count);
                }
            }

            foreach (var (outfitCulture, troopId) in start.Outfit)
            {
                var troop = outfitCulture == culture ? MBObjectManager.Instance.GetObject<CharacterObject>(troopId) : null;
                if (troop?.FirstBattleEquipment != null)
                {
                    Hero.MainHero.BattleEquipment.FillFrom(troop.FirstBattleEquipment);
                }
            }

            if (start.Gold > 0)
            {
                GiveGoldAction.ApplyBetweenCharacters(null, Hero.MainHero, start.Gold, true);
            }
            else if (start.Gold < 0)
            {
                // Arme Anfänge: Gold abziehen, aber nicht unter null.
                var take = System.Math.Min(-start.Gold, Hero.MainHero.Gold);
                if (take > 0)
                {
                    GiveGoldAction.ApplyBetweenCharacters(Hero.MainHero, null, take, true);
                }
            }

            var kingdom = Kingdom.All.FirstOrDefault(k => k.StringId == start.Kingdom);
            var ruler = kingdom?.Leader;
            if (ruler != null && start.Relation != 0)
            {
                ChangeRelationAction.ApplyPlayerRelation(ruler, start.Relation, false);
            }

            var giver = start.GiverIsNotable ? settlement.Notables.FirstOrDefault() ?? settlement.OwnerClan?.Leader : ruler;
            new BalkanRiseQuest(start.Id, giver ?? ruler).StartQuest();

            InformationManager.ShowInquiry(new InquiryData(new TextObject(start.Name).ToString(),
                new TextObject(start.Text) + "\n\n" + BalkanRiseQuest.GoalText(start),
                true, false, new TextObject("{=balkan_ok}Continue").ToString(), "", null, null), true);
        }
    }
}
