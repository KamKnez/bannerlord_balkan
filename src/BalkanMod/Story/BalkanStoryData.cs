namespace BalkanMod.Story
{
    /// <summary>Ein historisches Ereignis aus data/ereignisse.toml (Tabelle: <see cref="BalkanEventTable"/>).</summary>
    internal sealed class BalkanEvent
    {
        public BalkanEvent(string id, int year, int day, string title, string text, (string Kind, string Kingdom1, string Kingdom2)[] actions)
        {
            Id = id;
            Year = year;
            Day = day;
            Title = title;
            Text = text;
            Actions = actions;
        }

        public string Id { get; }

        /// <summary>Jahr in der Zählung der Mod (1700 = Spielbeginn).</summary>
        public int Year { get; }

        /// <summary>Tag im Jahr, 1 bis 84.</summary>
        public int Day { get; }

        public string Title { get; }

        public string Text { get; }

        /// <summary>krieg, frieden oder buendnis zwischen zwei Königreichen (Ids im Spiel).</summary>
        public (string Kind, string Kingdom1, string Kingdom2)[] Actions { get; }
    }

    /// <summary>Eine Startgeschichte des geführten Aufstiegs aus data/aufstieg.toml (<see cref="BalkanRiseTable"/>).</summary>
    internal sealed class BalkanRiseStart
    {
        public BalkanRiseStart(string id, string[] cultures, string settlement, string kingdom, bool giverIsNotable, int relation,
            int gold, string goal, int goalCount, int rewardGold, int rewardRenown, string name, string text, string goalText,
            string successText, (string Culture, string Troop, int Count)[] troops, (string Culture, string Troop)[] outfit)
        {
            Id = id;
            Cultures = cultures;
            Settlement = settlement;
            Kingdom = kingdom;
            GiverIsNotable = giverIsNotable;
            Relation = relation;
            Gold = gold;
            Goal = goal;
            GoalCount = goalCount;
            RewardGold = rewardGold;
            RewardRenown = rewardRenown;
            Name = name;
            Text = text;
            GoalText = goalText;
            SuccessText = successText;
            Troops = troops;
            Outfit = outfit;
        }

        public string Id { get; }
        public string[] Cultures { get; }
        public string Settlement { get; }
        public string Kingdom { get; }
        public bool GiverIsNotable { get; }
        public int Relation { get; }
        public int Gold { get; }
        public string Goal { get; }
        public int GoalCount { get; }
        public int RewardGold { get; }
        public int RewardRenown { get; }
        public string Name { get; }
        public string Text { get; }
        public string GoalText { get; }
        public string SuccessText { get; }
        public (string Culture, string Troop, int Count)[] Troops { get; }

        /// <summary>Je Kultur die Truppe, deren Kampfausrüstung die Figur zu Beginn bekommt (leer: Ausrüstung bleibt).</summary>
        public (string Culture, string Troop)[] Outfit { get; }
    }
}
