using BalkanMod.Settings;
using TaleWorlds.CampaignSystem;
using TaleWorlds.CampaignSystem.ViewModelCollection.Map.MapBar;

namespace BalkanMod.TimeControl
{
    /// <summary>
    /// Zwei zusätzliche Zeitraffer-Stufen auf der Kampagnenkarte.
    /// Das Spiel spult mit Campaign.SpeedUpMultiplier vor (Grundspiel 4x). Solange eine unserer Stufen aktiv ist,
    /// setzen wir diesen Wert höher; sobald der Spieler pausiert, normal spielt oder den Vorspulknopf des Spiels
    /// nimmt, kommt wieder der Wert des Spiels.
    /// </summary>
    internal static class BalkanTimeSpeed
    {
        /// <summary>Vorspulfaktor vor unserer Stufe (Grundspiel 4x), wird beim Beenden wiederhergestellt.</summary>
        private static float _previousMultiplier = 4f;

        /// <summary>Spielinterner Wert für "Vorspulen" in MapTimeControlVM.ExecuteTimeControlChange.</summary>
        private const int VanillaFastForwardSpeed = 2;

        /// <summary>0 = keine eigene Stufe aktiv, sonst 1 oder 2.</summary>
        public static int ActiveLevel { get; private set; }

        /// <summary>true, während wir selbst die Zeitsteuerung des Spiels aufrufen (dann nicht zurücksetzen).</summary>
        public static bool IsChangingOwnSpeed { get; private set; }

        public static float MultiplierFor(int level)
        {
            var settings = BalkanSettings.Instance;
            if (level == 1)
            {
                return settings?.FastForwardLevel1 ?? 8f;
            }

            return settings?.FastForwardLevel2 ?? 16f;
        }

        public static void Activate(MapTimeControlVM timeControl, int level)
        {
            var campaign = Campaign.Current;
            if (campaign == null || campaign.TimeControlModeLock)
            {
                return;
            }

            // Erst das normale Vorspulen des Spiels auslösen (kümmert sich um Armeen, Warten in Siedlungen usw.),
            // dann den Faktor erhöhen.
            IsChangingOwnSpeed = true;
            try
            {
                timeControl.ExecuteTimeControlChange(VanillaFastForwardSpeed);
            }
            finally
            {
                IsChangingOwnSpeed = false;
            }

            if (!IsFastForward(campaign.TimeControlMode))
            {
                return;
            }

            if (ActiveLevel == 0)
            {
                _previousMultiplier = campaign.SpeedUpMultiplier;
            }

            ActiveLevel = level;
            campaign.SpeedUpMultiplier = MultiplierFor(level);
        }

        public static void Deactivate()
        {
            if (ActiveLevel == 0)
            {
                return;
            }

            ActiveLevel = 0;
            var campaign = Campaign.Current;
            if (campaign != null)
            {
                campaign.SpeedUpMultiplier = _previousMultiplier;
            }
        }

        /// <summary>Beim Laden oder Beenden eines Spiels: keine Stufe aktiv, Faktor des Spiels gilt wieder.</summary>
        public static void Reset()
        {
            ActiveLevel = 0;
            IsChangingOwnSpeed = false;
            _previousMultiplier = 4f;
        }

        /// <summary>Jeden Frame: Stufe beenden, wenn nicht mehr vorgespult wird, sonst den Faktor halten.</summary>
        public static void Tick()
        {
            var campaign = Campaign.Current;
            if (campaign == null)
            {
                ActiveLevel = 0;
                return;
            }

            if (ActiveLevel == 0)
            {
                return;
            }

            if (!IsFastForward(campaign.TimeControlMode))
            {
                Deactivate();
                return;
            }

            campaign.SpeedUpMultiplier = MultiplierFor(ActiveLevel);
        }

        private static bool IsFastForward(CampaignTimeControlMode mode)
        {
            return mode == CampaignTimeControlMode.StoppableFastForward
                || mode == CampaignTimeControlMode.UnstoppableFastForward
                || mode == CampaignTimeControlMode.UnstoppableFastForwardForPartyWaitTime;
        }
    }
}
