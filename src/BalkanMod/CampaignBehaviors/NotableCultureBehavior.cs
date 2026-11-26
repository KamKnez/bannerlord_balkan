using TaleWorlds.CampaignSystem;
using TaleWorlds.CampaignSystem.Settlements;
using TaleWorlds.Localization;

namespace BalkanMod.CampaignBehaviors
{
    /// <summary>
    /// Gibt den Notabeln (Dorfvorsteher, Grundherren, Handwerker, Händler, Bandenführer) die Kultur ihrer Siedlung.
    ///
    /// Das Spiel erzeugt Notabeln aus den Vorlagen der Siedlungskultur. Die neuen Kulturen der Mod
    /// (z. B. Ragusaner, Venezianer, Serben) übernehmen diese Vorlagen von ihrer Vorlage-Kultur, und die Notabeln
    /// bekommen dadurch deren Kultur (z. B. Imperium). Weil Rekruten und Namen aus der Kultur des Notabeln kommen,
    /// gäbe es sonst imperiale Rekruten und Namen in Ragusa. Hier wird das nach dem Erzeugen der Welt, beim Laden
    /// und einmal am Tag (für neu hinzukommende Notabeln) korrigiert: Kultur setzen, Namen neu würfeln und die
    /// angebotenen Rekruten leeren, damit das Spiel sie aus der richtigen Kultur neu füllt.
    /// </summary>
    public class NotableCultureBehavior : CampaignBehaviorBase
    {
        public override void RegisterEvents()
        {
            CampaignEvents.OnNewGameCreatedPartialFollowUpEndEvent.AddNonSerializedListener(this, _ => FixAllNotables());
            CampaignEvents.OnGameLoadedEvent.AddNonSerializedListener(this, _ => FixAllNotables());
            CampaignEvents.DailyTickEvent.AddNonSerializedListener(this, FixAllNotables);
        }

        public override void SyncData(IDataStore dataStore)
        {
        }

        private static void FixAllNotables()
        {
            foreach (var settlement in Settlement.All)
            {
                var culture = settlement.Culture;
                if (culture == null || !(settlement.IsVillage || settlement.IsTown || settlement.IsCastle))
                {
                    continue;
                }

                foreach (var notable in settlement.Notables)
                {
                    if (notable == null || notable == Hero.MainHero || notable.Culture == culture)
                    {
                        continue;
                    }

                    notable.Culture = culture;
                    NameGenerator.Current.GenerateHeroNameAndHeroFullName(notable, out TextObject firstName, out TextObject fullName, false);
                    notable.SetName(fullName, firstName);

                    var volunteers = notable.VolunteerTypes;
                    if (volunteers != null)
                    {
                        for (var i = 0; i < volunteers.Length; i++)
                        {
                            volunteers[i] = null;
                        }
                    }
                }
            }
        }
    }
}
