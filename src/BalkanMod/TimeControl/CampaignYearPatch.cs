using System;
using HarmonyLib;
using TaleWorlds.CampaignSystem;

namespace BalkanMod.TimeControl
{
    /// <summary>
    /// Zeigt Daten in den Jahren der Mod an: Das Spiel beginnt intern im Jahr 1084, angezeigt wird 1700.
    /// Nur die Anzeige ändert sich (Kalender auf der Karte, Enzyklopädie und alle anderen Stellen, die
    /// <see cref="CampaignTime.ToString"/> nutzen). Die Spiellogik rechnet weiter mit den internen Jahren.
    /// </summary>
    [HarmonyPatch(typeof(CampaignTime), nameof(CampaignTime.ToString))]
    public static class CampaignYearPatch
    {
        /// <summary>Spielbeginn 1084 im Spiel entspricht 1700 in der Mod.</summary>
        public const int YearOffset = 1700 - 1084;

        public static void Postfix(CampaignTime __instance, ref string __result)
        {
            if (string.IsNullOrEmpty(__result))
            {
                return;
            }

            var year = __instance.GetYear.ToString();
            var index = __result.LastIndexOf(year, StringComparison.Ordinal);
            if (index < 0)
            {
                return;
            }

            __result = __result.Substring(0, index) + (__instance.GetYear + YearOffset) + __result.Substring(index + year.Length);
        }
    }
}
