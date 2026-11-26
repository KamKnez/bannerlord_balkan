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
                new (string Culture, string Troop, int Count)[] { ("vlandia", "balkan_hr_haramija", 4), ("vlandia", "balkan_hr_peasant", 3), ("serbs", "balkan_sr_shooter", 4), ("serbs", "balkan_sr_peasant", 3) }),
            new BalkanRiseStart("kapetan", new[] { "aserai" }, "town_A6", "aserai", false, 10, 300,
                "burg", 0, 2000, 50,
                "{=balkan_rise_kapetan}From a house of frontier begs", "{=balkan_rise_kapetan_text}Your family has served the captaincies of the Krajina for generations. With a few azaps from your father's village you have come to Banja Luka. The beylerbey needs men who can hold a fortress against the Germans, and he does not care whose child you are.", "{=balkan_rise_kapetan_goal}Become kapetan of a border fortress: hold a castle of your own as a member of the Ottoman realm.", "{=balkan_rise_kapetan_success}A fortress of the frontier is yours, and men call you kapetan. From now on your path is your own.",
                new (string Culture, string Troop, int Count)[] { ("aserai", "balkan_bs_azap", 4), ("aserai", "balkan_bs_peasant", 3) }),
            new BalkanRiseStart("hajduk", new[] { "serbs", "vlandia" }, "village_A3_3", "aserai", true, -10, 150,
                "trupp", 40, 1000, 50,
                "{=balkan_rise_hajduk}Hajduk in the hills", "{=balkan_rise_hajduk_text}The subaşı's men burned your house over a debt your father never owed. You took to the forests above the Drina with a handful of friends. The villagers bring you bread and news, and the pasha has put a price on your head.", "{=balkan_rise_hajduk_goal}Build your own band: lead at least {COUNT} men.", "{=balkan_rise_hajduk_success}Your band is known from the Drina to the sea, and the songs already speak of you. From now on your path is your own.",
                new (string Culture, string Troop, int Count)[] { ("serbs", "balkan_sr_shooter", 3), ("serbs", "balkan_sr_peasant", 3), ("vlandia", "balkan_hr_haramija", 3), ("vlandia", "balkan_hr_peasant", 3) }),
        };
    }
}
