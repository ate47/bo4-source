// Atian COD Tools GSC decompiler test
#include scripts/weapons/weapons.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;

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
    self thread function_8fc56001();
}

// Namespace explosive_bolt/explosive_bolt
// Params 0, eflags: 0x1 linked
// Checksum 0x8ffce5a9, Offset: 0x128
// Size: 0x160
function function_8fc56001() {
    self endon(#"death");
    self endon(#"disconnect");
    self notify(#"hash_3aa5708c34c0df49");
    self endon(#"hash_3aa5708c34c0df49");
    var_a009765b = getweapon(#"explosive_bolt");
    for (;;) {
        waitresult = undefined;
        waitresult = self waittill(#"grenade_fire");
        grenade = waitresult.projectile;
        weapon = waitresult.weapon;
        if (grenade util::ishacked()) {
            continue;
        }
        if (weapon == var_a009765b) {
            grenade.ownerweaponatlaunch = self.currentweapon;
            grenade.owneradsatlaunch = self playerads() == 1 ? 1 : 0;
            grenade thread weapons::check_stuck_to_player(1, 0, weapon);
        }
    }
}

