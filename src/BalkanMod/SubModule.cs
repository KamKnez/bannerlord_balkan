using BalkanMod.CampaignModels;
using Bannerlord.UIExtenderEx;
using HarmonyLib;
using TaleWorlds.CampaignSystem;
using TaleWorlds.Core;
using TaleWorlds.Library;
using TaleWorlds.Localization;
using TaleWorlds.MountAndBlade;

namespace BalkanMod
{
    /// <summary>
    /// Einstiegspunkt der Mod. Zeigt im Hauptmenü eine kurze Meldung,
    /// damit man beim Testen sieht, dass die Mod geladen wurde, und meldet die Spielmodelle der Mod an.
    /// </summary>
    public class SubModule : MBSubModuleBase
    {
        private bool _loadedMessageShown;
        private UIExtender _uiExtender;

        protected override void OnSubModuleLoad()
        {
            base.OnSubModuleLoad();

            // Zusätzliche Zeitraffer-Knöpfe auf der Karte (TimeControl/)
            new Harmony("BalkanMod").PatchAll(typeof(SubModule).Assembly);
            _uiExtender = UIExtender.Create("BalkanMod");
            _uiExtender.Register(typeof(SubModule).Assembly);
            _uiExtender.Enable();
        }

        protected override void OnBeforeInitialModuleScreenSetAsRoot()
        {
            base.OnBeforeInitialModuleScreenSetAsRoot();

            if (_loadedMessageShown)
            {
                return;
            }

            _loadedMessageShown = true;
            var text = new TextObject("{=balkanmod_loaded}Balkan mod loaded.");
            InformationManager.DisplayMessage(new InformationMessage(text.ToString()));
        }

        protected override void OnGameStart(Game game, IGameStarter gameStarterObject)
        {
            base.OnGameStart(game, gameStarterObject);

            if (game.GameType is Campaign && gameStarterObject is CampaignGameStarter campaignStarter)
            {
                // Reisegeschwindigkeit auf der Karte (Faktoren im MCM-Menü)
                campaignStarter.AddModel(new BalkanPartySpeedModel());
            }
        }
    }
}
