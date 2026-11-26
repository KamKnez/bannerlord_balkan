using System.Globalization;
using Bannerlord.UIExtenderEx.Attributes;
using Bannerlord.UIExtenderEx.ViewModels;
using TaleWorlds.CampaignSystem.ViewModelCollection.Map.MapBar;
using TaleWorlds.Core.ViewModelCollection.Information;
using TaleWorlds.InputSystem;
using TaleWorlds.Library;
using TaleWorlds.Localization;

namespace BalkanMod.TimeControl
{
    /// <summary>
    /// Erweitert die Zeitsteuerung unten auf der Karte um zwei Knöpfe (Daten für BalkanTimeControlPrefab).
    /// OnRefresh läuft nach jedem MapTimeControlVM.Tick, also jeden Frame auf der Karte.
    /// </summary>
    [ViewModelMixin("Tick")]
    public class BalkanTimeControlMixin : BaseViewModelMixin<MapTimeControlVM>
    {
        private bool _isBalkanFast1Active;
        private bool _isBalkanFast2Active;
        private string _balkanFast1Text = "";
        private string _balkanFast2Text = "";
        private HintViewModel _balkanFast1Hint;
        private HintViewModel _balkanFast2Hint;
        private float _shown1 = -1f;
        private float _shown2 = -1f;

        public BalkanTimeControlMixin(MapTimeControlVM vm) : base(vm)
        {
            RefreshTexts();
        }

        [DataSourceProperty]
        public bool IsBalkanFast1Active
        {
            get => _isBalkanFast1Active;
            set
            {
                if (value != _isBalkanFast1Active)
                {
                    _isBalkanFast1Active = value;
                    OnPropertyChangedWithValue(value, nameof(IsBalkanFast1Active));
                }
            }
        }

        [DataSourceProperty]
        public bool IsBalkanFast2Active
        {
            get => _isBalkanFast2Active;
            set
            {
                if (value != _isBalkanFast2Active)
                {
                    _isBalkanFast2Active = value;
                    OnPropertyChangedWithValue(value, nameof(IsBalkanFast2Active));
                }
            }
        }

        [DataSourceProperty]
        public string BalkanFast1Text
        {
            get => _balkanFast1Text;
            set
            {
                if (value != _balkanFast1Text)
                {
                    _balkanFast1Text = value;
                    OnPropertyChangedWithValue(value, nameof(BalkanFast1Text));
                }
            }
        }

        [DataSourceProperty]
        public string BalkanFast2Text
        {
            get => _balkanFast2Text;
            set
            {
                if (value != _balkanFast2Text)
                {
                    _balkanFast2Text = value;
                    OnPropertyChangedWithValue(value, nameof(BalkanFast2Text));
                }
            }
        }

        [DataSourceProperty]
        public HintViewModel BalkanFast1Hint
        {
            get => _balkanFast1Hint;
            set
            {
                if (value != _balkanFast1Hint)
                {
                    _balkanFast1Hint = value;
                    OnPropertyChangedWithValue(value, nameof(BalkanFast1Hint));
                }
            }
        }

        [DataSourceProperty]
        public HintViewModel BalkanFast2Hint
        {
            get => _balkanFast2Hint;
            set
            {
                if (value != _balkanFast2Hint)
                {
                    _balkanFast2Hint = value;
                    OnPropertyChangedWithValue(value, nameof(BalkanFast2Hint));
                }
            }
        }

        [DataSourceMethod]
        public void ExecuteBalkanFast1()
        {
            BalkanTimeSpeed.Activate(ViewModel, 1);
            UpdateState();
        }

        [DataSourceMethod]
        public void ExecuteBalkanFast2()
        {
            BalkanTimeSpeed.Activate(ViewModel, 2);
            UpdateState();
        }

        public override void OnRefresh()
        {
            base.OnRefresh();

            // Tasten 4 und 5 (nur auf der Karte, nicht in Enzyklopädie oder Menüs)
            if (CanUseHotkeys())
            {
                if (Input.IsKeyPressed(InputKey.D4))
                {
                    ExecuteBalkanFast1();
                }
                else if (Input.IsKeyPressed(InputKey.D5))
                {
                    ExecuteBalkanFast2();
                }
            }

            BalkanTimeSpeed.Tick();
            UpdateState();
        }

        private bool CanUseHotkeys()
        {
            var vm = ViewModel;
            return vm.IsInMap
                && vm.IsCenterPanelEnabled
                && !vm.IsEncyclopediaOpen
                && !vm.IsEscapeMenuOpened
                && !vm.IsInCampaignOptions
                && !vm.IsInArmyManagement
                && !vm.IsInTownManagement
                && !vm.IsInRecruitment;
        }

        private void UpdateState()
        {
            IsBalkanFast1Active = BalkanTimeSpeed.ActiveLevel == 1;
            IsBalkanFast2Active = BalkanTimeSpeed.ActiveLevel == 2;

            // Faktoren können sich im MCM-Menü ändern
            if (BalkanTimeSpeed.MultiplierFor(1) != _shown1 || BalkanTimeSpeed.MultiplierFor(2) != _shown2)
            {
                RefreshTexts();
            }
        }

        private void RefreshTexts()
        {
            _shown1 = BalkanTimeSpeed.MultiplierFor(1);
            _shown2 = BalkanTimeSpeed.MultiplierFor(2);
            BalkanFast1Text = Format(_shown1);
            BalkanFast2Text = Format(_shown2);
            BalkanFast1Hint = new HintViewModel(HintText(_shown1, "4"));
            BalkanFast2Hint = new HintViewModel(HintText(_shown2, "5"));
        }

        private static string Format(float factor)
        {
            return factor.ToString("0.#", CultureInfo.InvariantCulture) + "x";
        }

        private static TextObject HintText(float factor, string key)
        {
            var text = new TextObject("{=balkan_time_fast_hint}Fast forward {FACTOR} (key {KEY})");
            text.SetTextVariable("FACTOR", Format(factor));
            text.SetTextVariable("KEY", key);
            return text;
        }
    }
}
