using Bannerlord.UIExtenderEx.Attributes;
using Bannerlord.UIExtenderEx.Prefabs2;

namespace BalkanMod.TimeControl
{
    /// <summary>
    /// Zwei Knöpfe über der rechten Seite der Zeitsteuerung unten auf der Karte (SandBox/GUI/Prefabs/Map/MapBar.xml,
    /// Widget "CenterPanel"). Datenquelle ist dort MapTimeControlVM, erweitert durch BalkanTimeControlMixin.
    /// Weil die Knöpfe Kinder der Zeitsteuerung sind, verschwinden sie mit ihr (z. B. in Menüs ohne Zeitsteuerung).
    /// </summary>
    [PrefabExtension("MapBar", "descendant::MapCurrentTimeVisualWidget[@Id='CenterPanel']/Children")]
    internal class BalkanTimeControlPrefab : PrefabExtensionInsertPatch
    {
        public override InsertType Type => InsertType.Child;

        [PrefabExtensionText]
        public string Xml => @"
<Widget Id=""BalkanFastForwardPanel"" WidthSizePolicy=""CoverChildren"" HeightSizePolicy=""CoverChildren"" HorizontalAlignment=""Right"" VerticalAlignment=""Top"" PositionXOffset=""-40"" PositionYOffset=""-30"" Sprite=""BlankWhiteSquare_9"" Color=""#000000AA"">
  <Children>
    <ListPanel WidthSizePolicy=""CoverChildren"" HeightSizePolicy=""CoverChildren"" MarginLeft=""4"" MarginRight=""4"" StackLayout.LayoutMethod=""HorizontalLeftToRight"">
      <Children>
        " + Button("1") + @"
        " + Button("2") + @"
      </Children>
    </ListPanel>
  </Children>
</Widget>";

        private static string Button(string n)
        {
            return @"
<ButtonWidget Id=""BalkanFastForward" + n + @"Button"" WidthSizePolicy=""Fixed"" HeightSizePolicy=""Fixed"" SuggestedWidth=""46"" SuggestedHeight=""26"" Command.Click=""ExecuteBalkanFast" + n + @""">
  <Children>
    <TextWidget DoNotAcceptEvents=""true"" WidthSizePolicy=""StretchToParent"" HeightSizePolicy=""StretchToParent"" Brush=""MapTextBrushGal"" Brush.FontSize=""18"" Brush.TextHorizontalAlignment=""Center"" Brush.TextVerticalAlignment=""Center"" Text=""@BalkanFast" + n + @"Text"" IsHidden=""@IsBalkanFast" + n + @"Active"" />
    <TextWidget DoNotAcceptEvents=""true"" WidthSizePolicy=""StretchToParent"" HeightSizePolicy=""StretchToParent"" Brush=""MapTextBrushGal"" Brush.FontSize=""18"" Brush.FontColor=""#F4C430FF"" Brush.TextHorizontalAlignment=""Center"" Brush.TextVerticalAlignment=""Center"" Text=""@BalkanFast" + n + @"Text"" IsVisible=""@IsBalkanFast" + n + @"Active"" />
    <HintWidget DataSource=""{BalkanFast" + n + @"Hint}"" WidthSizePolicy=""StretchToParent"" HeightSizePolicy=""StretchToParent"" Command.HoverBegin=""ExecuteBeginHint"" Command.HoverEnd=""ExecuteEndHint"" IsDisabled=""true"" />
  </Children>
</ButtonWidget>";
        }
    }
}
