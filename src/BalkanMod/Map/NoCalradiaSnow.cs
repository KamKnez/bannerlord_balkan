using System.Reflection;
using HarmonyLib;
using TaleWorlds.CampaignSystem;
using TaleWorlds.Engine;

namespace BalkanMod.Map
{
    /// <summary>
    /// Die Balkankarte braucht den Baustein MapSnowAndRainDefiner (ohne ihn stürzt eine neue Kampagne ab, weil das
    /// Wetterraster fehlt). Sein Bild ist aber Calradias Schneekarte: Auf der Balkankarte färbt sie Boden und Bäume
    /// weiß, und Schnee läge dort, wo er in Calradia liegt. Das Bild wird deshalb nicht an die Szene gegeben.
    /// </summary>
    [HarmonyPatch(typeof(Scene), nameof(Scene.SetDynamicSnowTexture))]
    internal static class NoCalradiaSnowTexture
    {
        private static bool Prefix()
        {
            return Campaign.Current == null;
        }
    }

    /// <summary>Kein Schnee aus Calradias Karte im Spielablauf (Tempo, Schlachtfelder); der Regen bleibt.</summary>
    [HarmonyPatch]
    internal static class NoCalradiaSnowData
    {
        private static MethodBase TargetMethod()
        {
            return AccessTools.Method(AccessTools.TypeByName("SandBox.MapScene"), "SetSnowAndRainDataWithDimension");
        }

        private static bool Prepare()
        {
            return TargetMethod() != null;
        }

        private static void Postfix(object __instance)
        {
            if (AccessTools.Field(__instance.GetType(), "_snowAndRainData")?.GetValue(__instance) is byte[] data)
            {
                for (var i = 0; i < data.Length; i += 2)
                {
                    data[i] = 0;
                }
            }
        }
    }
}
