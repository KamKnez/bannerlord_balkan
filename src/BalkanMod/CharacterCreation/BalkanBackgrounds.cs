using System.Reflection;
using System.Runtime.CompilerServices;
using HarmonyLib;
using TaleWorlds.CampaignSystem.CharacterCreationContent;
using TaleWorlds.Localization;

namespace BalkanMod.CharacterCreation
{
    /// <summary>
    /// Eigene Lebensläufe: Die Eltern-Optionen der Charaktererstellung gehören der Vorlage-Kultur (Kroaten, Deutsche und
    /// Ungarn teilen sich die Optionen Vlandias). Wird eine Option für die gewählte Kultur angezeigt, bekommt sie Titel
    /// und Text aus data/lebenslaeufe/ (<see cref="BalkanBackgroundTable"/>). Fähigkeiten und Ausrüstung bleiben.
    /// </summary>
    public static class BalkanBackgrounds
    {
        private static readonly FieldInfo TextField = AccessTools.Field(typeof(NarrativeMenuOption), nameof(NarrativeMenuOption.Text));
        private static readonly FieldInfo DescriptionField =
            AccessTools.Field(typeof(NarrativeMenuOption), nameof(NarrativeMenuOption.DescriptionText));

        /// <summary>Texte des Spiels je Option, damit sie bei einem Kulturwechsel zurückkommen.</summary>
        private static readonly ConditionalWeakTable<NarrativeMenuOption, TextObject[]> Originals =
            new ConditionalWeakTable<NarrativeMenuOption, TextObject[]>();

        public static void Apply(Harmony harmony)
        {
            var target = AccessTools.Method(typeof(NarrativeMenuOption), nameof(NarrativeMenuOption.OnCondition));
            if (target == null || TextField == null || DescriptionField == null)
            {
                return;
            }

            harmony.Patch(target, postfix: new HarmonyMethod(AccessTools.Method(typeof(BalkanBackgrounds), nameof(OnConditionPostfix))));
        }

        /// <summary>Läuft, wenn das Spiel die Optionen der aktuellen Stufe zusammenstellt, also vor der Anzeige.</summary>
        private static void OnConditionPostfix(NarrativeMenuOption __instance, CharacterCreationManager characterCreationManager, bool __result)
        {
            if (!__result)
            {
                return;
            }

            var culture = characterCreationManager?.CharacterCreationContent?.SelectedCulture?.StringId;
            var original = Originals.GetValue(__instance, o => new[] { o.Text, o.DescriptionText });
            if (culture != null && BalkanBackgroundTable.Options.TryGetValue((culture, __instance.StringId), out var texts))
            {
                SetTexts(__instance, new TextObject(texts.Title), new TextObject(texts.Text));
            }
            else
            {
                SetTexts(__instance, original[0], original[1]);
            }
        }

        private static void SetTexts(NarrativeMenuOption option, TextObject title, TextObject text)
        {
            TextField.SetValue(option, title);
            DescriptionField.SetValue(option, text);
        }
    }
}
