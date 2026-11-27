// Erzeugt von tools/gen_content.py aus data/aufstieg.toml. Nicht von Hand ändern.
namespace BalkanMod.Story
{
    internal static class BalkanRiseTable
    {
        public static readonly BalkanRiseStart[] Starts =
        new[]
        {
            new BalkanRiseStart("grenzer", new[] { "vlandia", "serbs" }, "town_V6", "vlandia", false, 10, 300,
                "vasall", 0, 2000, 50,
                "{=balkan_rise_grenzer}Grenzer of the Military Frontier", "{=balkan_rise_grenzer_text}Your family holds land on the Military Frontier, free of serfdom in return for service. You have reported to the Generalate in Karlovac with a few men from your village. The general has promised you a captaincy if you prove yourself in the Emperor's service.", "{=balkan_rise_grenzer_goal}Become a captain of the Military Frontier: serve the Habsburgs until they take you in as a vassal.", "{=balkan_rise_grenzer_success}The Generalate has made you a captain of the Military Frontier. From now on your path is your own.",
                new (string Culture, string Troop, int Count)[] { ("vlandia", "balkan_hr_haramija", 4), ("vlandia", "balkan_hr_peasant", 3), ("serbs", "balkan_sr_shooter", 4), ("serbs", "balkan_sr_peasant", 3) },
                new (string Culture, string Troop)[] {  }),
            new BalkanRiseStart("kapetan", new[] { "aserai" }, "town_A6", "aserai", false, 10, 300,
                "burg", 0, 2000, 50,
                "{=balkan_rise_kapetan}From a house of frontier begs", "{=balkan_rise_kapetan_text}Your family has served the captaincies of the Krajina for generations. With a few azaps from your father's village you have come to Banja Luka. The beylerbey needs men who can hold a fortress against the Germans, and he does not care whose child you are.", "{=balkan_rise_kapetan_goal}Become kapetan of a border fortress: hold a castle of your own as a member of the Ottoman realm.", "{=balkan_rise_kapetan_success}A fortress of the frontier is yours, and men call you kapetan. From now on your path is your own.",
                new (string Culture, string Troop, int Count)[] { ("aserai", "balkan_bs_azap", 4), ("aserai", "balkan_bs_peasant", 3) },
                new (string Culture, string Troop)[] {  }),
            new BalkanRiseStart("hajduk", new[] { "serbs", "vlandia" }, "castle_village_A2_2", "aserai", true, -10, 150,
                "trupp", 40, 1000, 50,
                "{=balkan_rise_hajduk}Hajduk in the hills", "{=balkan_rise_hajduk_text}The subaşı's men burned your house over a debt your father never owed. You took to the forests above the Ibar with a handful of friends. The villagers bring you bread and news, and the pasha has put a price on your head.", "{=balkan_rise_hajduk_goal}Build your own band: lead at least {COUNT} men.", "{=balkan_rise_hajduk_success}Your band is known from the Ibar to the sea, and the songs already speak of you. From now on your path is your own.",
                new (string Culture, string Troop, int Count)[] { ("serbs", "balkan_sr_shooter", 3), ("serbs", "balkan_sr_peasant", 3), ("vlandia", "balkan_hr_haramija", 3), ("vlandia", "balkan_hr_peasant", 3) },
                new (string Culture, string Troop)[] {  }),
            new BalkanRiseStart("bauer", new[] { "vlandia", "serbs" }, "castle_village_V1_1", "vlandia", true, 0, -800,
                "stufe", 3, 1500, 50,
                "{=balkan_rise_bauer}Peasant on the Sava", "{=balkan_rise_bauer_text}You were born in Županja, a village of the Military Frontier on the Sava. Across the river lies Ottoman Bosnia, and every evening you can see the smoke of its watch fires. Your family owns a hut, a field and the duty to take up arms whenever the drum sounds. The harvest has failed, the tax collector came anyway, and you have decided that life must hold more than ploughing and waiting for the next raid. Two lads from the village are coming with you.", "{=balkan_rise_bauer_goal}Become an officer of the Grenzer: serve the Habsburgs, as a mercenary or a vassal, and raise your clan to tier {COUNT}.", "{=balkan_rise_bauer_success}The men of the Brod regiment now salute you as an officer. From a hut in Županja to an officer's sash, you have come a long way. From now on your path is your own.",
                new (string Culture, string Troop, int Count)[] { ("vlandia", "balkan_hr_peasant", 2), ("serbs", "balkan_sr_peasant", 2) },
                new (string Culture, string Troop)[] { ("vlandia", "balkan_hr_peasant"), ("serbs", "balkan_sr_peasant") }),
        };
    }
}
