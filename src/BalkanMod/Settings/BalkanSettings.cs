using MCM.Abstractions.Attributes;
using MCM.Abstractions.Attributes.v2;
using MCM.Abstractions.Base.Global;

namespace BalkanMod.Settings
{
    /// <summary>
    /// Einstellungen der Mod im Mod Configuration Menu (MCM).
    /// Im Spiel: Optionen → Mod-Optionen → Balkan 1700.
    /// </summary>
    public class BalkanSettings : AttributeGlobalSettings<BalkanSettings>
    {
        public override string Id => "BalkanMod";

        public override string DisplayName => "{=balkan_settings_name}Balkan 1700";

        public override string FolderName => "BalkanMod";

        public override string FormatType => "json2";

        [SettingPropertyFloatingInteger("{=balkan_settings_speed_all}Travel speed of all parties", 0.5f, 4f, "0.00x",
            Order = 0, RequireRestart = false,
            HintText = "{=balkan_settings_speed_all_hint}Multiplies the map speed of every party: lords, caravans, bandits and you. 1.00x is the speed of the base game.")]
        [SettingPropertyGroup("{=balkan_settings_group_map}Campaign map", GroupOrder = 0)]
        public float AllPartiesSpeedFactor { get; set; } = 1f;

        [SettingPropertyFloatingInteger("{=balkan_settings_speed_player}Extra travel speed of your party", 0.5f, 4f, "0.00x",
            Order = 1, RequireRestart = false,
            HintText = "{=balkan_settings_speed_player_hint}Applied on top of the speed of all parties, only for your own party.")]
        [SettingPropertyGroup("{=balkan_settings_group_map}Campaign map", GroupOrder = 0)]
        public float PlayerSpeedFactor { get; set; } = 1f;

        [SettingPropertyFloatingInteger("{=balkan_settings_fast1}First extra fast forward button", 5f, 32f, "0x",
            Order = 0, RequireRestart = false,
            HintText = "{=balkan_settings_fast1_hint}Time speed of the first extra button next to the time controls at the bottom of the map (key 4). The fast forward of the base game is 4x.")]
        [SettingPropertyGroup("{=balkan_settings_group_time}Time controls", GroupOrder = 1)]
        public float FastForwardLevel1 { get; set; } = 8f;

        [SettingPropertyFloatingInteger("{=balkan_settings_fast2}Second extra fast forward button", 5f, 64f, "0x",
            Order = 1, RequireRestart = false,
            HintText = "{=balkan_settings_fast2_hint}Time speed of the second extra button (key 5).")]
        [SettingPropertyGroup("{=balkan_settings_group_time}Time controls", GroupOrder = 1)]
        public float FastForwardLevel2 { get; set; } = 16f;
    }
}
