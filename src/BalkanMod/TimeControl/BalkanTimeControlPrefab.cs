using System.Collections.Generic;
using Bannerlord.UIExtenderEx.Attributes;
using Bannerlord.UIExtenderEx.Prefabs2;

namespace BalkanMod.TimeControl
{
    /// <summary>
    /// Zwei weitere Knöpfe in der Zeitsteuerung unten auf der Karte (SandBox/GUI/Prefabs/Map/MapBar.xml,
    /// Widget "CenterPanel"), gleich rechts neben Pause, Abspielen und Vorspulen: drei Pfeile für die erste,
    /// vier Pfeile für die zweite Stufe. Datenquelle ist MapTimeControlVM, erweitert durch BalkanTimeControlMixin.
    ///
    /// Damit alle fünf Knöpfe in den Rahmen passen, rücken Pause, Abspielen und Vorspulen etwas nach links
    /// (BalkanTimeControlShift*). Die neuen Knöpfe liegen innerhalb der Fläche der Zeitsteuerung und bekommen
    /// dadurch Mausklicks (außerhalb davon gingen nur die Tasten 4 und 5).
    /// Lage im Rahmen (Breite 430): Abstand vom rechten Rand, wie in MapBar.xml mit PositionXOffset.
    /// </summary>
    [PrefabExtension("MapBar", "descendant::MapCurrentTimeVisualWidget[@Id='CenterPanel']/Children/ButtonWidget[@Id='PauseButton']")]
    internal class BalkanTimeControlPrefab : PrefabExtensionInsertPatch
    {
        // Als Geschwister hinter dem Pause-Knopf, also innerhalb der Zeitsteuerung. Kein Rahmen-Widget darum,
        // weil es sonst über Pause, Abspielen und Vorspulen läge und deren Klicks abfinge.
        public override InsertType Type => InsertType.Append;

        [PrefabExtensionText]
        public string Xml => Button("1", 3, -53);

        internal static string ButtonXml(string n, int arrows, int offsetX) => Button(n, arrows, offsetX);

        /// <summary>Knopf aus <paramref name="arrows"/> überlappenden Abspiel-Pfeilen des Spiels.</summary>
        private static string Button(string n, int arrows, int offsetX)
        {
            const int arrowWidth = 14;
            const int step = 8;
            var width = arrowWidth + (arrows - 1) * step;
            var children = "";
            for (var i = 0; i < arrows; i++)
            {
                children += "<BrushWidget DoNotAcceptEvents=\"true\" WidthSizePolicy=\"Fixed\" HeightSizePolicy=\"Fixed\" SuggestedWidth=\""
                    + arrowWidth + "\" SuggestedHeight=\"20\" HorizontalAlignment=\"Left\" VerticalAlignment=\"Center\" PositionXOffset=\""
                    + (i * step) + "\" Brush=\"MapBarPlayButton\" />";
            }

            return "<ButtonWidget Id=\"BalkanFastForward" + n + "Button\" DoNotPassEventsToChildren=\"true\" UpdateChildrenStates=\"true\""
                + " WidthSizePolicy=\"Fixed\" HeightSizePolicy=\"Fixed\" SuggestedWidth=\"" + width + "\" SuggestedHeight=\"24\""
                + " HorizontalAlignment=\"Right\" VerticalAlignment=\"Bottom\" PositionXOffset=\"" + offsetX + "\" PositionYOffset=\"-13\""
                + " IsSelected=\"@IsBalkanFast" + n + "Active\" Command.Click=\"ExecuteBalkanFast" + n + "\">"
                + "<Children>" + children
                + "<HintWidget DataSource=\"{BalkanFast" + n + "Hint}\" WidthSizePolicy=\"StretchToParent\" HeightSizePolicy=\"StretchToParent\""
                + " Command.HoverBegin=\"ExecuteBeginHint\" Command.HoverEnd=\"ExecuteEndHint\" IsDisabled=\"true\" />"
                + "</Children></ButtonWidget>";
        }
    }

    /// <summary>Der Knopf mit vier Pfeilen, ebenfalls hinter dem Pause-Knopf.</summary>
    [PrefabExtension("MapBar", "descendant::MapCurrentTimeVisualWidget[@Id='CenterPanel']/Children/ButtonWidget[@Id='PauseButton']")]
    internal class BalkanTimeControlPrefab2 : PrefabExtensionInsertPatch
    {
        public override InsertType Type => InsertType.Append;

        [PrefabExtensionText]
        public string Xml => BalkanTimeControlPrefab.ButtonXml("2", 4, -12);
    }

    /// <summary>Vorspulen rückt nach links, damit rechts Platz für die zwei neuen Knöpfe ist.</summary>
    [PrefabExtension("MapBar", "descendant::ButtonWidget[@Id='FastForwardButton']")]
    internal class BalkanTimeControlShiftFastForward : PrefabExtensionSetAttributePatch
    {
        public override List<Attribute> Attributes => new List<Attribute> { new Attribute("PositionXOffset", "-87") };
    }

    /// <summary>Abspielen rückt nach links.</summary>
    [PrefabExtension("MapBar", "descendant::ButtonWidget[@Id='PlayButton']")]
    internal class BalkanTimeControlShiftPlay : PrefabExtensionSetAttributePatch
    {
        public override List<Attribute> Attributes => new List<Attribute> { new Attribute("PositionXOffset", "-120") };
    }

    /// <summary>Pause rückt nach links.</summary>
    [PrefabExtension("MapBar", "descendant::ButtonWidget[@Id='PauseButton']")]
    internal class BalkanTimeControlShiftPause : PrefabExtensionSetAttributePatch
    {
        public override List<Attribute> Attributes => new List<Attribute> { new Attribute("PositionXOffset", "-145") };
    }
}
