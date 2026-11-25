using TaleWorlds.Library;
using TaleWorlds.Localization;
using TaleWorlds.MountAndBlade;

namespace BalkanMod
{
    /// <summary>
    /// Einstiegspunkt der Mod. Zeigt im Hauptmenü eine kurze Meldung,
    /// damit man beim Testen sieht, dass die Mod geladen wurde.
    /// </summary>
    public class SubModule : MBSubModuleBase
    {
        private bool _loadedMessageShown;

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
    }
}
