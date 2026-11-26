using System.Collections.Generic;
using TaleWorlds.Core;
using TaleWorlds.Engine;
using TaleWorlds.Library;
using TaleWorlds.MountAndBlade;

namespace BalkanMod.Missions
{
    /// <summary>
    /// Musketenknall beim Schuss und Ladegeräusch kurz danach, für alle Feuerwaffen der Mod (Ids balkan_*,
    /// Waffenklasse Armbrust). Die Klänge stehen in ModuleData/module_sounds.xml, die Dateien in ModuleSounds/.
    /// Den Armbrustklang des Spiels spielt die Waffe weiterhin leise mit; Rauch und Animationen brauchen gepackte
    /// Assets aus dem Modding Kit.
    /// </summary>
    public class FirearmSoundBehavior : MissionLogic
    {
        /// <summary>Sekunden zwischen Schuss und Beginn des Ladegeräuschs.</summary>
        private const float ReloadSoundDelay = 0.8f;

        private static readonly string[] MusketFireSounds = { "balkan_musket_fire1", "balkan_musket_fire2", "balkan_musket_fire3" };

        private readonly List<(Agent Agent, float Time)> _pendingReloads = new List<(Agent, float)>();
        private int[] _musketFireIds;
        private int _pistolFireId = -1;
        private int _reloadId = -1;

        public override void AfterStart()
        {
            base.AfterStart();
            _musketFireIds = new int[MusketFireSounds.Length];
            for (var i = 0; i < MusketFireSounds.Length; i++)
            {
                _musketFireIds[i] = SoundEvent.GetEventIdFromString(MusketFireSounds[i]);
            }

            _pistolFireId = SoundEvent.GetEventIdFromString("balkan_pistol_fire");
            _reloadId = SoundEvent.GetEventIdFromString("balkan_musket_reload");
        }

        public override void OnAgentShootMissile(Agent shooterAgent, EquipmentIndex weaponIndex, Vec3 position, Vec3 velocity,
            Mat3 orientation, bool hasRigidBody, int forcedMissileIndex)
        {
            base.OnAgentShootMissile(shooterAgent, weaponIndex, position, velocity, orientation, hasRigidBody, forcedMissileIndex);

            if (shooterAgent == null || weaponIndex < EquipmentIndex.WeaponItemBeginSlot || weaponIndex >= EquipmentIndex.NumAllWeaponSlots)
            {
                return;
            }

            var item = shooterAgent.Equipment[weaponIndex].Item;
            if (item == null || !item.StringId.StartsWith("balkan_") || item.Type != ItemObject.ItemTypeEnum.Crossbow)
            {
                return;
            }

            var isPistol = item.StringId.Contains("pistol");
            var fireId = isPistol ? _pistolFireId : _musketFireIds[MBRandom.RandomInt(_musketFireIds.Length)];
            Play(fireId, position, shooterAgent);

            if (!isPistol)
            {
                _pendingReloads.Add((shooterAgent, Mission.CurrentTime + ReloadSoundDelay));
            }
        }

        public override void OnMissionTick(float dt)
        {
            base.OnMissionTick(dt);
            if (_pendingReloads.Count == 0)
            {
                return;
            }

            var now = Mission.CurrentTime;
            for (var i = _pendingReloads.Count - 1; i >= 0; i--)
            {
                var (agent, time) = _pendingReloads[i];
                if (time > now)
                {
                    continue;
                }

                _pendingReloads.RemoveAt(i);
                if (agent != null && agent.IsActive())
                {
                    Play(_reloadId, agent.Position, agent);
                }
            }
        }

        private void Play(int soundId, Vec3 position, Agent agent)
        {
            if (soundId < 0)
            {
                return;
            }

            Mission.MakeSound(soundId, position, false, true, agent.Index, -1);
        }
    }
}
