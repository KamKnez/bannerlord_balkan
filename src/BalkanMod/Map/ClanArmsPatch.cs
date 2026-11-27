using System.Reflection;
using HarmonyLib;
using TaleWorlds.CampaignSystem;

namespace BalkanMod.Map
{
    /// <summary>
    /// Clans mit historischem Wappen (data/reiche/*.toml, [clan.wappen]) behalten ihre eigenen Farben.
    /// Sonst färbt Clan.UpdateBannerColorsAccordingToKingdom jedes Clanwappen in die Farben des Reichs um.
    /// Die Methode fehlt in den Referenz-Bibliotheken zum Bauen, deshalb wird sie zur Laufzeit gesucht;
    /// gibt es sie nicht, bleibt der Patch einfach aus.
    /// </summary>
    [HarmonyPatch]
    internal static class ClanArmsPatch
    {
        private static MethodBase TargetMethod() => AccessTools.Method(typeof(Clan), "UpdateBannerColorsAccordingToKingdom");

        private static bool Prepare() => TargetMethod() != null;

        private static bool Prefix(Clan __instance) => !BalkanClanArms.Ids.Contains(__instance.StringId);
    }
}
