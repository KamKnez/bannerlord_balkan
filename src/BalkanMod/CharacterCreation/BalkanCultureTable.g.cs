// Erzeugt von tools/gen_content.py aus data/kulturen/. Nicht von Hand ändern.
using System.Collections.Generic;

namespace BalkanMod.CharacterCreation
{
    internal static class BalkanCultureTable
    {
        /// <summary>Kultur-Id der wählbaren Kulturen: Vorlage-Kultur des Spiels und Kulturbild.</summary>
        public static readonly Dictionary<string, (string Template, string Image)> Cultures =
            new Dictionary<string, (string Template, string Image)>
        {
            { "aserai", ("aserai", "battania") },
            { "germans", ("vlandia", "vlandia") },
            { "vlandia", ("vlandia", "vlandia") },
            { "ragusa", ("empire", "empire") },
            { "serbs", ("sturgia", "sturgia") },
            { "turks", ("aserai", "aserai") },
            { "hungarians", ("vlandia", "khuzait") },
            { "venice", ("empire", "empire") },
        };
    }
}
