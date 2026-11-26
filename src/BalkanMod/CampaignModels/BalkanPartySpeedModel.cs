using BalkanMod.Settings;
using TaleWorlds.CampaignSystem;
using TaleWorlds.CampaignSystem.ComponentInterfaces;
using TaleWorlds.CampaignSystem.Party;
using TaleWorlds.Localization;

namespace BalkanMod.CampaignModels
{
    /// <summary>
    /// Legt sich über das bisherige Geschwindigkeitsmodell (BaseModel) und multipliziert die Reisegeschwindigkeit
    /// auf der Kampagnenkarte mit den Faktoren aus den MCM-Einstellungen. Alles andere bleibt beim Spiel
    /// oder bei Mods, die vor uns geladen werden.
    /// </summary>
    public class BalkanPartySpeedModel : PartySpeedModel
    {
        private static readonly TextObject AllPartiesText = new TextObject("{=balkan_speed_all}Balkan 1700: travel speed");
        private static readonly TextObject PlayerText = new TextObject("{=balkan_speed_player}Balkan 1700: your travel speed");

        public override float BaseSpeed => BaseModel.BaseSpeed;

        public override float MinimumSpeed => BaseModel.MinimumSpeed;

        public override ExplainedNumber CalculateBaseSpeed(MobileParty party, bool includeDescriptions = false,
            int additionalTroopOnFootCount = 0, int additionalTroopOnHorseCount = 0)
        {
            return BaseModel.CalculateBaseSpeed(party, includeDescriptions, additionalTroopOnFootCount, additionalTroopOnHorseCount);
        }

        public override ExplainedNumber CalculateFinalSpeed(MobileParty mobileParty, ExplainedNumber finalSpeed)
        {
            var result = BaseModel.CalculateFinalSpeed(mobileParty, finalSpeed);
            var settings = BalkanSettings.Instance;
            if (settings == null)
            {
                return result;
            }

            AddFactor(ref result, settings.AllPartiesSpeedFactor, AllPartiesText);
            if (mobileParty != null && mobileParty.IsMainParty)
            {
                AddFactor(ref result, settings.PlayerSpeedFactor, PlayerText);
            }

            return result;
        }

        public override int GetSkeletalCrewCount(MobileParty party)
        {
            return BaseModel.GetSkeletalCrewCount(party);
        }

        /// <summary>
        /// Multipliziert das Ergebnis mit factor. ExplainedNumber rechnet (Grundwert + Zuschläge) * (1 + Summe der Faktoren).
        /// Ein Zuschlag wird also noch mit den Faktoren des Spiels (Wald, Nacht, Schnee, Herde ...) multipliziert. Damit am
        /// Ende genau factor herauskommt, teilen wir den Zuschlag vorher durch (1 + Summe der Faktoren).
        /// Beispiel 2,0x im Wald (-30 %): vorher ergab das nur 1,7x, jetzt 2,0x.
        /// </summary>
        private static void AddFactor(ref ExplainedNumber number, float factor, TextObject text)
        {
            if (factor <= 0f || factor == 1f)
            {
                return;
            }

            var before = number.ResultNumber;
            if (before <= 0f)
            {
                return;
            }

            var multiplier = 1f + number.SumOfFactors;
            if (multiplier <= 0.01f)
            {
                return;
            }

            number.Add(before * (factor - 1f) / multiplier, text, null);
        }
    }
}
