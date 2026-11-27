using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using HarmonyLib;
using TaleWorlds.CampaignSystem;
using TaleWorlds.CampaignSystem.CharacterCreationContent;
using TaleWorlds.ObjectSystem;

namespace BalkanMod.CharacterCreation
{
    /// <summary>
    /// Die Erzählmenüs der Charaktererstellung fragen die gewählte Kultur fest ab (z. B. Elternoptionen nur für
    /// "sturgia") und bauen daraus die Namen der Ausrüstungsvorlagen. Für eine neue Kultur der Mod gäbe es damit
    /// keine Optionen. Solange eine dieser Methoden läuft, gilt darum die Vorlage-Kultur (Serben: Sturgia usw.):
    /// Kultur-Ids und Kulturen in den Argumenten werden ersetzt, die gewählte Kultur wird kurz getauscht.
    /// Wird erst im Hauptmenü angewendet (<see cref="Apply"/>), wenn auch StoryMode.dll geladen ist.
    /// </summary>
    public static class CultureTemplateScope
    {
        private static readonly string[] TargetTypes =
        {
            "TaleWorlds.CampaignSystem.CampaignBehaviors.CharacterCreationCampaignBehavior",
            "StoryMode.GameComponents.CampaignBehaviors.StoryModeCharacterCreationCampaignBehavior",
        };

        /// <summary>Kulturbilder der Charaktererstellung (siehe <see cref="ImagePrefix"/>).</summary>
        private const string WidgetType =
            "TaleWorlds.MountAndBlade.GauntletUI.Widgets.CharacterCreation.Culture.CharacterCreationCultureVisualBrushWidget";

        private const string CultureStageType =
            "TaleWorlds.CampaignSystem.ViewModelCollection.CharacterCreation.CharacterCreationCultureStageVM";

        private static readonly MethodInfo SelectedCultureSetter =
            AccessTools.PropertySetter(typeof(CharacterCreationContent), nameof(CharacterCreationContent.SelectedCulture));

        public static void Apply(Harmony harmony)
        {
            if (SelectedCultureSetter == null)
            {
                return;
            }

            var prefix = new HarmonyMethod(AccessTools.Method(typeof(CultureTemplateScope), nameof(Prefix)));
            var postfix = new HarmonyMethod(AccessTools.Method(typeof(CultureTemplateScope), nameof(Postfix)));
            foreach (var method in TargetMethods())
            {
                harmony.Patch(method, prefix, postfix);
            }

            // Die Kulturauswahl sortiert fest nach den sechs Kulturen des Spiels (Single(...)) und stürzt ab, wenn
            // eine davon fehlt. Die Reihenfolge der Mod kommt aus data/kulturen/, das Sortieren entfällt.
            var sort = AccessTools.Method(AccessTools.TypeByName(CultureStageType), "SortCultureList");
            if (sort != null)
            {
                harmony.Patch(sort, new HarmonyMethod(AccessTools.Method(typeof(CultureTemplateScope), nameof(SkipSort))));
            }

            var widget = AccessTools.TypeByName(WidgetType);
            var setter = widget == null ? null : AccessTools.PropertySetter(widget, "CurrentCultureId");
            if (setter != null)
            {
                harmony.Patch(setter, new HarmonyMethod(AccessTools.Method(typeof(CultureTemplateScope), nameof(ImagePrefix))));
            }
        }

        private static bool SkipSort()
        {
            return false;
        }

        private static IEnumerable<MethodBase> TargetMethods()
        {
            foreach (var typeName in TargetTypes)
            {
                var type = AccessTools.TypeByName(typeName);
                if (type == null)
                {
                    continue;
                }

                foreach (var method in AccessTools.GetDeclaredMethods(type))
                {
                    if (method.IsAbstract || method.ContainsGenericParameters)
                    {
                        continue;
                    }

                    var name = method.Name;
                    if (name.EndsWith("OnCondition", StringComparison.Ordinal)
                        || name.EndsWith("EquipmentId", StringComparison.Ordinal)
                        || name.EndsWith("NarrativeMenuCharacterArgs", StringComparison.Ordinal))
                    {
                        yield return method;
                    }
                }
            }
        }

        private static void Prefix(object[] __args, out CultureObject __state)
        {
            __state = null;
            for (var i = 0; i < __args.Length; i++)
            {
                switch (__args[i])
                {
                    case string id when TryGetTemplateId(id, out var templateId):
                        __args[i] = templateId;
                        break;
                    case CultureObject culture when TryGetTemplate(culture, out var template):
                        __args[i] = template;
                        break;
                    case CharacterCreationManager manager when __state == null:
                        var content = manager.CharacterCreationContent;
                        var selected = content?.SelectedCulture;
                        if (selected != null && TryGetTemplate(selected, out var selectedTemplate))
                        {
                            __state = selected;
                            SelectedCultureSetter.Invoke(content, new object[] { selectedTemplate });
                        }

                        break;
                }
            }
        }

        private static void Postfix(object[] __args, CultureObject __state)
        {
            if (__state == null)
            {
                return;
            }

            var manager = __args.OfType<CharacterCreationManager>().FirstOrDefault();
            if (manager?.CharacterCreationContent != null)
            {
                SelectedCultureSetter.Invoke(manager.CharacterCreationContent, new object[] { __state });
            }
        }

        /// <summary>
        /// Das Spiel wählt das Kulturbild über die Kultur-Id. Neue Kulturen haben keins, und die Bosniaken
        /// (Kultur "aserai") sollen nicht das Kamelbild bekommen. Die Tabelle (data/kulturen/*.toml, Feld bild)
        /// ordnet jeder Kultur eines der Bilder des Spiels zu.
        /// </summary>
        private static void ImagePrefix(ref string value)
        {
            if (value != null && BalkanCultureTable.Cultures.TryGetValue(value, out var row))
            {
                value = row.Image;
            }
        }

        private static bool TryGetTemplateId(string cultureId, out string templateId)
        {
            templateId = null;
            if (BalkanCultureTable.Cultures.TryGetValue(cultureId, out var row) && row.Template != cultureId)
            {
                templateId = row.Template;
                return true;
            }

            return false;
        }

        private static bool TryGetTemplate(CultureObject culture, out CultureObject template)
        {
            template = null;
            if (!TryGetTemplateId(culture.StringId, out var templateId))
            {
                return false;
            }

            template = MBObjectManager.Instance.GetObject<CultureObject>(templateId);
            return template != null;
        }
    }
}
