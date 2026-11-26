using HarmonyLib;
using TaleWorlds.CampaignSystem;
using TaleWorlds.CampaignSystem.ViewModelCollection.Map.MapBar;

namespace BalkanMod.TimeControl
{
    /// <summary>
    /// Wählt der Spieler Pause, Play oder das Vorspulen des Spiels (Knopf oder Taste), endet unsere Stufe.
    /// </summary>
    [HarmonyPatch(typeof(MapTimeControlVM), "ExecuteTimeControlChange")]
    internal static class ExecuteTimeControlChangePatch
    {
        private static void Prefix()
        {
            if (!BalkanTimeSpeed.IsChangingOwnSpeed)
            {
                BalkanTimeSpeed.Deactivate();
            }
        }
    }

    [HarmonyPatch(typeof(Campaign), "SetTimeSpeed")]
    internal static class SetTimeSpeedPatch
    {
        private static void Prefix()
        {
            if (!BalkanTimeSpeed.IsChangingOwnSpeed)
            {
                BalkanTimeSpeed.Deactivate();
            }
        }
    }
}
