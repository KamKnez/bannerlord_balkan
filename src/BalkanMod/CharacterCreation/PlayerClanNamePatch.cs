using System.Linq;
using HarmonyLib;
using Helpers;
using TaleWorlds.CampaignSystem;
using TaleWorlds.Core;
using TaleWorlds.Localization;

namespace BalkanMod.CharacterCreation
{
    /// <summary>
    /// Familienname der eigenen Figur: Das Spiel schlägt für die Kultur "vlandia" (bei uns die Kroaten) fest
    /// "dey Corvand" vor, statt aus der Namensliste der Kultur zu wählen. Hier kommt der Vorschlag auch für sie aus
    /// der Liste (data/namen/, Abschnitt [familien]), möglichst ein Name, den noch kein Clan trägt.
    /// </summary>
    public static class PlayerClanNamePatch
    {
        public static void Apply(Harmony harmony)
        {
            var target = AccessTools.Method(typeof(FactionHelper), nameof(FactionHelper.GenerateClanNameforPlayer));
            if (target != null)
            {
                harmony.Patch(target, postfix: new HarmonyMethod(AccessTools.Method(typeof(PlayerClanNamePatch), nameof(Postfix))));
            }
        }

        private static void Postfix(ref TextObject __result)
        {
            var culture = CharacterObject.PlayerCharacter?.Culture;
            var names = culture?.ClanNameList;
            if (culture == null || culture.StringId != "vlandia" || names == null || names.Count == 0)
            {
                return;
            }

            var unused = names.Where(n => !Clan.All.Any(c => c.Name != null && c.Name.HasSameValue(n))).ToList();
            var pool = unused.Count > 0 ? unused : names.ToList();
            __result = pool[MBRandom.RandomInt(pool.Count)].CopyTextObject();
        }
    }
}
