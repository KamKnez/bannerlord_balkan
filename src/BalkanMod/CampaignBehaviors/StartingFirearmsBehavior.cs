using System;
using System.Reflection;
using TaleWorlds.CampaignSystem;
using TaleWorlds.CampaignSystem.Party;
using TaleWorlds.Core;
using TaleWorlds.Library;
using TaleWorlds.Localization;
using TaleWorlds.ObjectSystem;

namespace BalkanMod.CampaignBehaviors
{
    /// <summary>
    /// Legt der Spielfigur einmal pro Kampagne eine Arkebuse, eine Pistole und Munition ins Inventar,
    /// damit man die Feuerwaffen sofort ausprobieren kann (data/waffen.toml).
    /// Die Arkebuse verlangt keinen Armbrust-Wert, ist also für jede neue Figur benutzbar.
    ///
    /// Die Waffen kommen nicht direkt bei der Charaktererstellung, sondern beim ersten Stundentakt auf der Karte:
    /// Im Story-Modus leert das Spiel am Ende des Tutorials das Inventar, deshalb warten wir dort, bis das
    /// Tutorial abgeschlossen ist. Ob die Waffen schon vergeben wurden, steht im Spielstand. Spielstände ohne
    /// diesen Eintrag (älter als diese Version) bekommen die Waffen beim ersten Laden ebenfalls einmal.
    /// </summary>
    public class StartingFirearmsBehavior : CampaignBehaviorBase
    {
        private static readonly (string Id, int Count)[] StartItems =
        {
            ("balkan_arquebus", 1),
            ("balkan_musket_balls", 2),
            ("balkan_pistol", 1),
            ("balkan_pistol_balls", 2),
        };

        private bool _given;

        public override void RegisterEvents()
        {
            CampaignEvents.HourlyTickEvent.AddNonSerializedListener(this, OnHourlyTick);
        }

        public override void SyncData(IDataStore dataStore)
        {
            dataStore.SyncData("balkan_start_firearms_given", ref _given);
        }

        private void OnHourlyTick()
        {
            if (_given)
            {
                return;
            }

            var party = MobileParty.MainParty;
            if (party == null || Hero.MainHero == null || !Hero.MainHero.IsAlive || IsStoryModeTutorialRunning())
            {
                return;
            }

            _given = true;
            foreach (var (id, count) in StartItems)
            {
                var item = MBObjectManager.Instance.GetObject<ItemObject>(id);
                if (item != null)
                {
                    party.ItemRoster.AddToCounts(item, count);
                }
            }

            var text = new TextObject("{=balkan_start_firearms}An arquebus, a pistol and ammunition are in your inventory.");
            InformationManager.DisplayMessage(new InformationMessage(text.ToString()));
        }

        /// <summary>
        /// Story-Modus: StoryModeManager.Current.MainStoryLine.TutorialPhase (IsCompleted, IsSkipped), per Reflection,
        /// damit die Mod nicht von StoryMode.dll abhängt. In der Sandbox gibt es keinen StoryModeManager.
        /// </summary>
        private static bool IsStoryModeTutorialRunning()
        {
            try
            {
                var managerType = Type.GetType("StoryMode.StoryModeManager, StoryMode", false);
                var manager = managerType?.GetProperty("Current", BindingFlags.Public | BindingFlags.Static)?.GetValue(null);
                if (manager == null)
                {
                    return false;
                }

                var storyLine = manager.GetType().GetProperty("MainStoryLine")?.GetValue(manager);
                var tutorial = storyLine?.GetType().GetProperty("TutorialPhase")?.GetValue(storyLine);
                if (tutorial == null)
                {
                    return false;
                }

                var completed = tutorial.GetType().GetProperty("IsCompleted")?.GetValue(tutorial);
                var skipped = tutorial.GetType().GetProperty("IsSkipped")?.GetValue(tutorial);
                return !(completed is true) && !(skipped is true);
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}
