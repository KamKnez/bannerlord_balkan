// Erzeugt von tools/gen_content.py aus data/ereignisse.toml. Nicht von Hand ändern.
namespace BalkanMod.Story
{
    internal static class BalkanEventTable
    {
        public static readonly BalkanEvent[] Events =
        new[]
        {
            new BalkanEvent("karlowitz_1699", 1700, 1, "{=balkan_event_karlowitz_1699}The Peace of Karlowitz", "{=balkan_event_karlowitz_1699_text}At Karlowitz the Sultan has made peace with the Emperor and with Venice. Slavonia and Lika are Habsburg again, Venice keeps its conquests in Dalmatia. The borders are fixed along the Una, the Sava and the Dinaric hills, but no one on the frontier believes the peace will last.",
                new (string Kind, string Kingdom1, string Kingdom2)[] { ("frieden", "aserai", "vlandia"), ("frieden", "aserai", "empire_w") }),
            new BalkanEvent("venedig_krieg_1714", 1714, 80, "{=balkan_event_venedig_krieg_1714}The Sultan declares war on Venice", "{=balkan_event_venedig_krieg_1714_text}The Porte wants Morea back. Grand Vizier Silahdar Ali Pasha has declared war on the Republic, and the frontier begs of Bosnia are already gathering their men against Dalmatia.",
                new (string Kind, string Kingdom1, string Kingdom2)[] { ("krieg", "aserai", "empire_w") }),
            new BalkanEvent("habsburg_krieg_1716", 1716, 28, "{=balkan_event_habsburg_krieg_1716}The Emperor joins the war", "{=balkan_event_habsburg_krieg_1716_text}Emperor Charles VI has renewed his alliance with Venice. Prince Eugene of Savoy gathers the imperial army at Peterwardein, and along the whole Military Frontier the Grenzer take up their muskets.",
                new (string Kind, string Kingdom1, string Kingdom2)[] { ("buendnis", "vlandia", "empire_w"), ("krieg", "vlandia", "aserai") }),
            new BalkanEvent("passarowitz_1718", 1718, 45, "{=balkan_event_passarowitz_1718}The Peace of Passarowitz", "{=balkan_event_passarowitz_1718_text}At Passarowitz the Emperor, Venice and the Sultan have made peace. The Emperor wins Belgrade and the Banat, Venice loses Morea but keeps its gains in Dalmatia. The frontier falls quiet again, for now.",
                new (string Kind, string Kingdom1, string Kingdom2)[] { ("frieden", "vlandia", "aserai"), ("frieden", "empire_w", "aserai") }),
        };
    }
}
