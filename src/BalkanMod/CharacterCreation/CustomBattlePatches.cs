using System.Collections.Generic;
using System.Linq;
using HarmonyLib;
using TaleWorlds.Core;
using TaleWorlds.ObjectSystem;

namespace BalkanMod.CharacterCreation
{
    /// <summary>
    /// Gefecht (Custom Battle): Zur Wahl stehen die acht Kulturen der Mod statt der sechs Calradias, und die
    /// Truppenauswahl zeigt nur Truppen der Mod (Ids balkan_*). Sonst stünden bei Kroaten (Kultur "vlandia") und
    /// Bosniaken ("aserai") auch die Armbrustschützen und Bogenschützen des Spiels in der Liste.
    /// Die Custom-Battle-DLL gehört zu einem eigenen Modul, darum über Namen und erst im Hauptmenü angewendet.
    /// </summary>
    public static class CustomBattlePatches
    {
        private const string DataType = "TaleWorlds.MountAndBlade.CustomBattle.CustomBattle.CustomBattleData";
        private const string CompositionType = "TaleWorlds.MountAndBlade.CustomBattle.ArmyCompositionGroupVM";
        private const string TroopPrefix = "balkan_";

        public static void Apply(Harmony harmony)
        {
            var data = AccessTools.TypeByName(DataType);
            var factions = data == null ? null : AccessTools.PropertyGetter(data, "Factions");
            if (factions != null)
            {
                harmony.Patch(factions, postfix: new HarmonyMethod(AccessTools.Method(typeof(CustomBattlePatches), nameof(FactionsPostfix))));
            }

            var composition = AccessTools.TypeByName(CompositionType);
            var constructor = composition == null ? null : AccessTools.GetDeclaredConstructors(composition).FirstOrDefault();
            if (constructor != null)
            {
                harmony.Patch(constructor, postfix: new HarmonyMethod(AccessTools.Method(typeof(CustomBattlePatches), nameof(CompositionPostfix))));
            }
        }

        private static void FactionsPostfix(ref IEnumerable<BasicCultureObject> __result)
        {
            var cultures = BalkanCultureTable.Cultures.Keys
                .Select(id => MBObjectManager.Instance.GetObject<BasicCultureObject>(id))
                .Where(c => c != null)
                .ToList();
            if (cultures.Count > 0)
            {
                __result = cultures;
            }
        }

        private static void CompositionPostfix(object __instance)
        {
            var troops = AccessTools.Field(__instance.GetType(), "_allCharacterObjects")?.GetValue(__instance) as List<BasicCharacterObject>;
            if (troops == null || !troops.Any(t => t.StringId.StartsWith(TroopPrefix)))
            {
                return;
            }

            troops.RemoveAll(t => !t.StringId.StartsWith(TroopPrefix));
        }
    }
}
