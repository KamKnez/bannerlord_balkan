using System.Collections.Generic;
using HarmonyLib;
using TaleWorlds.CampaignSystem;
using TaleWorlds.CampaignSystem.CharacterCreationContent;
using TaleWorlds.Library;
using TaleWorlds.ObjectSystem;

namespace BalkanMod.CharacterCreation
{
    /// <summary>
    /// Charaktererstellung: Zur Wahl stehen genau die acht Kulturen der Mod (Tabelle aus data/kulturen/),
    /// die Kulturen Calradias fallen weg. Die Erzählmenüs (Eltern, Kindheit usw.) und ihre Ausrüstung sind im
    /// Spiel je Kultur fest verdrahtet; neue Kulturen nutzen dafür ihre Vorlage (siehe <see cref="CultureTemplateScope"/>).
    /// </summary>
    public class BalkanCharacterCreationBehavior : CampaignBehaviorBase, ICharacterCreationContentHandler
    {
        /// <summary>Nach den Inhalten des Spiels (Sandbox) und des Story-Modus (900).</summary>
        private const int HandlerPriority = 1000;

        public override void RegisterEvents()
        {
            CampaignEvents.OnCharacterCreationInitializedEvent.AddNonSerializedListener(this, OnCharacterCreationInitialized);
        }

        public override void SyncData(IDataStore dataStore)
        {
        }

        private void OnCharacterCreationInitialized(CharacterCreationManager manager)
        {
            manager.RegisterCharacterCreationContentHandler(this, HandlerPriority);
        }

        void ICharacterCreationContentHandler.InitializeContent(CharacterCreationManager manager)
        {
        }

        void ICharacterCreationContentHandler.AfterInitializeContent(CharacterCreationManager manager)
        {
            var content = manager.CharacterCreationContent;
            var cultures = AccessTools.Field(typeof(CharacterCreationContent), "_characterCreationCultures")
                ?.GetValue(content) as Dictionary<CultureObject, KeyValuePair<int, int>>;
            if (cultures == null)
            {
                Debug.Print("[BalkanMod] Charaktererstellung: Kulturliste nicht gefunden, bleibt unverändert.");
                return;
            }

            var old = new Dictionary<string, KeyValuePair<int, int>>();
            foreach (var entry in cultures)
            {
                old[entry.Key.StringId] = entry.Value;
            }

            var fallback = new KeyValuePair<int, int>(content.FocusToAdd, content.SkillLevelToAdd);
            var selected = new List<(CultureObject Culture, KeyValuePair<int, int> Bonus)>();
            foreach (var row in BalkanCultureTable.Cultures)
            {
                var culture = MBObjectManager.Instance.GetObject<CultureObject>(row.Key);
                if (culture == null)
                {
                    continue;
                }

                if (!old.TryGetValue(row.Key, out var bonus) && !old.TryGetValue(row.Value.Template, out bonus))
                {
                    bonus = fallback;
                }

                selected.Add((culture, bonus));
            }

            if (selected.Count == 0)
            {
                return;
            }

            cultures.Clear();
            foreach (var (culture, bonus) in selected)
            {
                cultures[culture] = bonus;
            }

            if (content.SelectedCulture == null || !cultures.ContainsKey(content.SelectedCulture))
            {
                content.SetSelectedCulture(selected[0].Culture, manager);
            }
        }

        void ICharacterCreationContentHandler.OnStageCompleted(CharacterCreationStageBase stage)
        {
        }

        void ICharacterCreationContentHandler.OnCharacterCreationFinalize(CharacterCreationManager manager)
        {
        }
    }
}
