using BalkanMod.CampaignBehaviors;
using BalkanMod.CampaignModels;
using BalkanMod.CharacterCreation;
using BalkanMod.Missions;
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
        private Harmony _harmony;

        protected override void OnSubModuleLoad()
        {
            base.OnSubModuleLoad();

            // Zusätzliche Zeitraffer-Knöpfe auf der Karte (TimeControl/)
            _harmony = new Harmony("BalkanMod");
            _harmony.PatchAll(typeof(SubModule).Assembly);
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
            // Charaktererstellung mit den Kulturen der Mod; erst hier, weil StoryMode.dll jetzt geladen ist
            CultureTemplateScope.Apply(_harmony);
            var text = new TextObject("{=balkanmod_loaded}Balkan mod loaded.");
            InformationManager.DisplayMessage(new InformationMessage(text.ToString()));
        }

        public override void OnMissionBehaviorInitialize(Mission mission)
        {
            base.OnMissionBehaviorInitialize(mission);

            // Musketenknall und Ladegeräusch für die Feuerwaffen der Mod
            mission.AddMissionBehavior(new FirearmSoundBehavior());
        }

        protected override void OnGameStart(Game game, IGameStarter gameStarterObject)
        {
            base.OnGameStart(game, gameStarterObject);

            if (game.GameType is Campaign && gameStarterObject is CampaignGameStarter campaignStarter)
            {
                // Reisegeschwindigkeit auf der Karte (Faktoren im MCM-Menü)
                campaignStarter.AddModel(new BalkanPartySpeedModel());
                // Arkebuse, Pistole und Munition für die Spielfigur zu Beginn
                campaignStarter.AddBehavior(new StartingFirearmsBehavior());
                // Notabeln bekommen die Kultur ihrer Siedlung (Rekruten und Namen passend zur Kultur)
                campaignStarter.AddBehavior(new NotableCultureBehavior());
                // Läden der Balkan-Städte: Feuerwaffen und Kulturausrüstung rein, unpassende Calradia-Ware raus
                campaignStarter.AddBehavior(new BalkanMarketBehavior());
                // Bei der Charaktererstellung nur die acht Kulturen der Mod
                campaignStarter.AddBehavior(new BalkanCharacterCreationBehavior());
            }
        }
    }
}
