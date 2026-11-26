using System;
using System.Collections.Generic;
using System.IO;
using System.Xml;
using TaleWorlds.CampaignSystem;
using TaleWorlds.CampaignSystem.Roster;
using TaleWorlds.CampaignSystem.Settlements;
using TaleWorlds.Core;
using TaleWorlds.Library;
using TaleWorlds.ObjectSystem;

namespace BalkanMod.CampaignBehaviors
{
    /// <summary>
    /// Passt die Läden der Städte mit Balkan-Kultur an (Einstellungen in data/handel.toml, erzeugt als
    /// ModuleData/balkan_handel.xml):
    /// - Feuerwaffen und Munition liegen immer in einer kleinen Menge aus.
    /// - Einmal pro Woche kommen einige fehlende Stücke aus dem Sortiment der Kultur dazu (die Ausrüstung ihrer
    ///   Truppen), begrenzt durch den Wohlstand der Stadt.
    /// - Unpassende Calradia-Ware (Armbrüste, Ritterhelme, Bögen außerhalb der Osmanen und Bosniaken usw.) wird
    ///   einmal am Tag aus dem Laden genommen. Das betrifft nur das Lager der Stadt, nie Spieler oder Truppen.
    /// Fehlt die Datei oder ist sie fehlerhaft, tut das Verhalten nichts.
    /// </summary>
    public class BalkanMarketBehavior : CampaignBehaviorBase
    {
        private sealed class Shop
        {
            public bool Bows;
            public readonly List<string> Items = new List<string>();
            public readonly HashSet<string> ItemSet = new HashSet<string>();
        }

        private readonly Dictionary<string, Shop> _shops = new Dictionary<string, Shop>();
        private readonly List<(string Id, int Amount)> _always = new List<(string, int)>();
        private readonly List<(float Prosperity, int MaxTier)> _tierLimits = new List<(float, int)>();
        private readonly HashSet<string> _removeTypes = new HashSet<string>();
        private readonly List<string> _removePatterns = new List<string>();
        private readonly HashSet<string> _removeIds = new HashSet<string>();
        private int _perWeek = 6;
        private bool _loaded;

        public override void RegisterEvents()
        {
            CampaignEvents.OnNewGameCreatedPartialFollowUpEndEvent.AddNonSerializedListener(this, _ => FullUpdate());
            CampaignEvents.OnGameLoadedEvent.AddNonSerializedListener(this, _ => FullUpdate());
            CampaignEvents.DailyTickEvent.AddNonSerializedListener(this, () => Run(RemoveUnfitting));
            CampaignEvents.WeeklyTickEvent.AddNonSerializedListener(this, () => Run(Restock));
        }

        public override void SyncData(IDataStore dataStore)
        {
        }

        private void FullUpdate()
        {
            Run(RemoveUnfitting);
            Run(Restock);
        }

        private void Run(Action<Settlement, Shop> action)
        {
            if (!EnsureLoaded())
            {
                return;
            }

            foreach (var settlement in Settlement.All)
            {
                try
                {
                    if (settlement == null || !settlement.IsTown || settlement.Culture == null || settlement.ItemRoster == null)
                    {
                        continue;
                    }

                    if (_shops.TryGetValue(settlement.Culture.StringId, out var shop))
                    {
                        action(settlement, shop);
                    }
                }
                catch (Exception e)
                {
                    Debug.Print("[BalkanMod] Laden " + settlement?.StringId + ": " + e.Message);
                }
            }
        }

        private bool IsUnfitting(ItemObject item, Shop shop)
        {
            var id = item.StringId;
            if (id == null || id.StartsWith("balkan_", StringComparison.Ordinal) || shop.ItemSet.Contains(id))
            {
                return false;
            }

            var type = item.Type;
            if (_removeTypes.Contains(type.ToString()))
            {
                return true;
            }

            if (!shop.Bows && (type == ItemObject.ItemTypeEnum.Bow || type == ItemObject.ItemTypeEnum.Arrows))
            {
                return true;
            }

            if (_removeIds.Contains(id))
            {
                return true;
            }

            foreach (var pattern in _removePatterns)
            {
                if (id.IndexOf(pattern, StringComparison.Ordinal) >= 0)
                {
                    return true;
                }
            }

            return false;
        }

        private void RemoveUnfitting(Settlement settlement, Shop shop)
        {
            var roster = settlement.ItemRoster;
            var remove = new List<(ItemObject Item, int Amount)>();
            for (var i = 0; i < roster.Count; i++)
            {
                var element = roster.GetElementCopyAtIndex(i);
                var item = element.EquipmentElement.Item;
                if (item != null && element.Amount > 0 && IsUnfitting(item, shop))
                {
                    remove.Add((item, element.Amount));
                }
            }

            foreach (var (item, amount) in remove)
            {
                roster.AddToCounts(item, -amount);
            }
        }

        private int MaxTier(Settlement settlement)
        {
            var prosperity = settlement.Town != null ? settlement.Town.Prosperity : 0f;
            var maxTier = 3;
            foreach (var (limit, tier) in _tierLimits)
            {
                if (prosperity >= limit)
                {
                    maxTier = tier;
                }
            }

            return maxTier;
        }

        private void Restock(Settlement settlement, Shop shop)
        {
            var roster = settlement.ItemRoster;
            foreach (var (id, amount) in _always)
            {
                var item = MBObjectManager.Instance.GetObject<ItemObject>(id);
                if (item == null)
                {
                    continue;
                }

                var missing = amount - roster.GetItemNumber(item);
                if (missing > 0)
                {
                    roster.AddToCounts(item, missing);
                }
            }

            var maxTier = MaxTier(settlement);
            var candidates = new List<ItemObject>();
            foreach (var id in shop.Items)
            {
                var item = MBObjectManager.Instance.GetObject<ItemObject>(id);
                if (item != null && (int)item.Tier + 1 <= maxTier && roster.GetItemNumber(item) <= 0)
                {
                    candidates.Add(item);
                }
            }

            for (var n = 0; n < _perWeek && candidates.Count > 0; n++)
            {
                var index = MBRandom.RandomInt(candidates.Count);
                roster.AddToCounts(candidates[index], 1);
                candidates.RemoveAt(index);
            }
        }

        private bool EnsureLoaded()
        {
            if (_loaded)
            {
                return _shops.Count > 0;
            }

            _loaded = true;
            try
            {
                // .../Modules/BalkanMod/bin/Win64_Shipping_Client/BalkanMod.dll -> .../Modules/BalkanMod/
                var binDir = Path.GetDirectoryName(typeof(BalkanMarketBehavior).Assembly.Location);
                var moduleDir = Path.GetFullPath(Path.Combine(binDir ?? ".", "..", ".."));
                var path = Path.Combine(moduleDir, "ModuleData", "balkan_handel.xml");
                if (!File.Exists(path))
                {
                    Debug.Print("[BalkanMod] Handelsdatei fehlt: " + path);
                    return false;
                }

                var doc = new XmlDocument();
                doc.Load(path);
                var root = doc.DocumentElement;
                if (root == null)
                {
                    return false;
                }

                if (int.TryParse(root.GetAttribute("per_week"), out var perWeek))
                {
                    _perWeek = perWeek;
                }

                foreach (XmlNode node in root.ChildNodes)
                {
                    if (!(node is XmlElement el))
                    {
                        continue;
                    }

                    switch (el.Name)
                    {
                        case "TierLimit":
                            if (float.TryParse(el.GetAttribute("prosperity"), System.Globalization.NumberStyles.Float,
                                    System.Globalization.CultureInfo.InvariantCulture, out var p)
                                && int.TryParse(el.GetAttribute("max_tier"), out var t))
                            {
                                _tierLimits.Add((p, t));
                            }

                            break;
                        case "Always":
                            if (int.TryParse(el.GetAttribute("amount"), out var amount))
                            {
                                _always.Add((el.GetAttribute("id"), amount));
                            }

                            break;
                        case "RemoveType":
                            _removeTypes.Add(el.GetAttribute("value"));
                            break;
                        case "RemovePattern":
                            _removePatterns.Add(el.GetAttribute("value"));
                            break;
                        case "RemoveId":
                            _removeIds.Add(el.GetAttribute("value"));
                            break;
                        case "Shop":
                            var shop = new Shop { Bows = el.GetAttribute("bows") == "true" };
                            foreach (XmlNode child in el.ChildNodes)
                            {
                                if (child is XmlElement itemEl && itemEl.Name == "Item")
                                {
                                    var id = itemEl.GetAttribute("id");
                                    if (shop.ItemSet.Add(id))
                                    {
                                        shop.Items.Add(id);
                                    }
                                }
                            }

                            _shops[el.GetAttribute("culture")] = shop;
                            break;
                    }
                }

                _tierLimits.Sort((a, b) => a.Prosperity.CompareTo(b.Prosperity));
            }
            catch (Exception e)
            {
                Debug.Print("[BalkanMod] Handelsdatei nicht lesbar: " + e.Message);
                _shops.Clear();
            }

            return _shops.Count > 0;
        }
    }
}
