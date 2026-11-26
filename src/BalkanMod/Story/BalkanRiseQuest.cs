using System.Linq;
using TaleWorlds.CampaignSystem;
using TaleWorlds.CampaignSystem.Actions;
using TaleWorlds.CampaignSystem.Party;
using TaleWorlds.Library;
using TaleWorlds.Localization;
using TaleWorlds.SaveSystem;

namespace BalkanMod.Story
{
    /// <summary>
    /// Auftrag im Tagebuch für den geführten Aufstieg: Das Ziel der gewählten Startgeschichte (data/aufstieg.toml).
    /// Ist es erreicht, gibt es die Belohnung, und das Spiel ist frei. Ohne Zeitlimit.
    /// </summary>
    public class BalkanRiseQuest : QuestBase
    {
        [SaveableField(1)]
        private readonly string _startId;

        public BalkanRiseQuest(string startId, Hero questGiver)
            : base("balkan_rise_" + startId, questGiver, CampaignTime.Never, 0)
        {
            _startId = startId;
        }

        private BalkanRiseStart Start => BalkanRiseTable.Starts.FirstOrDefault(s => s.Id == _startId);

        public override TextObject Title => Start != null ? new TextObject(Start.Name) : new TextObject("{=balkan_rise_title}Rise");

        public override bool IsRemainingTimeHidden => true;

        protected override void SetDialogs()
        {
        }

        protected override void InitializeQuestOnGameLoad()
        {
        }

        protected override void OnStartQuest()
        {
            var start = Start;
            if (start != null)
            {
                AddLog(GoalText(start));
            }
        }

        protected override void DailyTick()
        {
            var start = Start;
            if (start == null || !IsGoalReached(start))
            {
                return;
            }

            var success = new TextObject(start.SuccessText);
            AddLog(success);
            if (start.RewardGold > 0)
            {
                GiveGoldAction.ApplyBetweenCharacters(null, Hero.MainHero, start.RewardGold);
            }

            if (start.RewardRenown > 0)
            {
                GainRenownAction.Apply(Hero.MainHero, start.RewardRenown);
            }

            CompleteQuestWithSuccess();
            InformationManager.ShowInquiry(new InquiryData(Title.ToString(), success.ToString(), true, false,
                new TextObject("{=balkan_ok}Continue").ToString(), "", null, null), true);
        }

        internal static TextObject GoalText(BalkanRiseStart start)
        {
            return new TextObject(start.GoalText).SetTextVariable("COUNT", start.GoalCount);
        }

        private static bool IsGoalReached(BalkanRiseStart start)
        {
            var clan = Clan.PlayerClan;
            if (clan == null)
            {
                return false;
            }

            var inKingdom = clan.Kingdom != null && clan.Kingdom.StringId == start.Kingdom && !clan.IsUnderMercenaryService;
            switch (start.Goal)
            {
                case "vasall":
                    return inKingdom;
                case "burg":
                    return inKingdom && clan.Settlements.Any(s => s.IsCastle);
                case "trupp":
                    return MobileParty.MainParty != null && MobileParty.MainParty.MemberRoster.TotalManCount >= start.GoalCount;
                default:
                    return false;
            }
        }
    }

    /// <summary>Macht den Auftrag speicherbar. Die Basis-Id muss unter allen Mods eindeutig sein.</summary>
    public class BalkanSaveDefiner : SaveableTypeDefiner
    {
        public BalkanSaveDefiner()
            : base(1_700_250_000)
        {
        }

        protected override void DefineClassTypes()
        {
            AddClassDefinition(typeof(BalkanRiseQuest), 1);
        }
    }
}
