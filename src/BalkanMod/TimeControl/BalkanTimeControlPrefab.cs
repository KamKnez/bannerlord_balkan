using Bannerlord.UIExtenderEx.Attributes;
using Bannerlord.UIExtenderEx.Prefabs2;

namespace BalkanMod.TimeControl
{
    /// <summary>
    /// Zwei Knöpfe über der rechten Seite der Zeitsteuerung unten auf der Karte (SandBox/GUI/Prefabs/Map/MapBar.xml,
    /// Widget "CenterPanel"). Datenquelle ist MapTimeControlVM, erweitert durch BalkanTimeControlMixin.
    ///
    /// Die Knöpfe stehen als Geschwister direkt hinter der Zeitsteuerung im bildschirmfüllenden Fenster und nicht
    /// mehr in ihr: Als Kinder lagen sie außerhalb der Fläche der Zeitsteuerung und bekamen deshalb keine Mausklicks,
    /// nur die Tasten 4 und 5 gingen. Sichtbar sind sie nur, solange die Zeitsteuerung aktiv ist.
    /// </summary>
    [PrefabExtension("MapBar", "descendant::MapCurrentTimeVisualWidget[@Id='CenterPanel']")]
    internal class BalkanTimeControlPrefab : PrefabExtensionInsertPatch
    {
        public override InsertType Type => InsertType.Append;

        [PrefabExtensionText]
        public string Xml => @"
<Widget Id=""BalkanFastForwardPanel"" DataSource=""{MapTimeControl}"" IsVisible=""@IsCenterPanelEnabled"" WidthSizePolicy=""CoverChildren"" HeightSizePolicy=""CoverChildren"" HorizontalAlignment=""Center"" VerticalAlignment=""Bottom"" PositionXOffset=""125"" MarginBottom=""63"" Sprite=""BlankWhiteSquare_9"" Color=""#000000AA"">
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
