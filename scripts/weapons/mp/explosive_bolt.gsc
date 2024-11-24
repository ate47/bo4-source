#using scripts\core_common\callbacks_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\weapons\weapons;

#namespace explosive_bolt;

// Namespace explosive_bolt/explosive_bolt
// Params 0, eflags: 0x2
// Checksum 0x321ba86e, Offset: 0x88
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"explosive_bolt", &__init__, undefined, undefined);
}

// Namespace explosive_bolt/explosive_bolt
// Params 0, eflags: 0x1 linked
// Checksum 0xe292d4ca, Offset: 0xd0
// Size: 0x24
function __init__() {
    callback::on_spawned(&on_player_spawned);
}

// Namespace explosive_bolt/explosive_bolt
// Params 0, eflags: 0x1 linked
// Checksum 0x360d7726, Offset: 0x100
// Size: 0x1c
function on_player_spawned() {
    self thread begin_other_grenade_tracking();
}

// Namespace explosive_bolt/explosive_bolt
// Params 0, eflags: 0x1 linked
// Checksum 0x8ffce5a9, Offset: 0x128
// Size: 0x160
function begin_other_grenade_tracking() {
    self endon(#"death");
    self endon(#"disconnect");
    self notify(#"bolttrackingstart");
    self endon(#"bolttrackingstart");
    weapon_bolt = getweapon(#"explosive_bolt");
    for (;;) {
        waitresult = self waittill(#"grenade_fire");
        grenade = waitresult.projectile;
        weapon = waitresult.weapon;
        if (grenade util::ishacked()) {
            continue;
        }
        if (weapon == weapon_bolt) {
            grenade.ownerweaponatlaunch = self.currentweapon;
            grenade.owneradsatlaunch = self playerads() == 1 ? 1 : 0;
            grenade thread weapons::check_stuck_to_player(1, 0, weapon);
        }
    }
}

