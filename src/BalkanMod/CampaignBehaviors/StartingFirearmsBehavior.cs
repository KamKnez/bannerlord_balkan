using TaleWorlds.CampaignSystem;
using TaleWorlds.CampaignSystem.Party;
using TaleWorlds.Core;
using TaleWorlds.Library;
using TaleWorlds.Localization;
using TaleWorlds.ObjectSystem;

namespace BalkanMod.CampaignBehaviors
{
    /// <summary>
    /// Legt der Spielfigur am Ende der Charaktererstellung eine Muskete, eine Pistole und Munition ins Inventar,
    /// damit man die Feuerwaffen sofort ausprobieren kann (data/waffen.toml).
    /// </summary>
    public class StartingFirearmsBehavior : CampaignBehaviorBase
    {
        private static readonly (string Id, int Count)[] StartItems =
        {
            ("balkan_musket", 1),
            ("balkan_musket_balls", 2),
            ("balkan_pistol", 1),
            ("balkan_pistol_balls", 2),
        };

        public override void RegisterEvents()
        {
            CampaignEvents.OnCharacterCreationIsOverEvent.AddNonSerializedListener(this, _ => GiveStartingFirearms());
        }

        public override void SyncData(IDataStore dataStore)
        {
        }

        private static void GiveStartingFirearms()
        {
            var party = MobileParty.MainParty;
            if (party == null)
            {
                return;
            }

            foreach (var (id, count) in StartItems)
            {
                var item = MBObjectManager.Instance.GetObject<ItemObject>(id);
                if (item != null)
                {
                    party.ItemRoster.AddToCounts(item, count);
                }
            }

            var text = new TextObject("{=balkan_start_firearms}A musket, a pistol and ammunition are in your inventory.");
            InformationManager.DisplayMessage(new InformationMessage(text.ToString()));
        }
    }
}
