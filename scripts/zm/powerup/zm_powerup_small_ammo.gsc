// Atian COD Tools GSC decompiler test
#include scripts/zm_common/trials/zm_trial_reset_loadout.gsc;
#include scripts/zm_common/zm_weapons.gsc;
#include scripts/zm_common/zm_utility.gsc;
#include scripts/zm_common/zm_spawner.gsc;
#include scripts/zm_common/zm_score.gsc;
#include scripts/zm_common/zm_powerups.gsc;
#include scripts/zm_common/zm_placeable_mine.gsc;
#include scripts/zm_common/zm_loadout.gsc;
#include scripts/core_common/ai/zombie_death.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/laststand_shared.gsc;
#include scripts/core_common/hud_util_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;
#include scripts/core_common/struct.gsc;

#namespace zm_powerup_small_ammo;

// Namespace zm_powerup_small_ammo/zm_powerup_small_ammo
// Params 0, eflags: 0x2
// Checksum 0x36b3b568, Offset: 0x120
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_powerup_small_ammo", &__init__, undefined, undefined);
}

// Namespace zm_powerup_small_ammo/zm_powerup_small_ammo
// Params 0, eflags: 0x1 linked
// Checksum 0xbb4fbc6e, Offset: 0x168
// Size: 0x84
function __init__() {
    zm_powerups::register_powerup("small_ammo", &function_81558cdf);
    if (zm_powerups::function_cc33adc8()) {
        zm_powerups::add_zombie_powerup("small_ammo", "p7_zm_power_up_max_ammo", #"hash_69256172c78db147", &zm_powerups::func_should_never_drop, 1, 0, 0);
    }
}

// Namespace zm_powerup_small_ammo/zm_powerup_small_ammo
// Params 1, eflags: 0x1 linked
// Checksum 0x9006c652, Offset: 0x1f8
// Size: 0x6c
function function_81558cdf(player) {
    if (zm_powerups::function_cfd04802(#"small_ammo")) {
        level thread function_d7d24283(self, player);
    } else {
        level thread function_8be02874(self, player);
    }
}

// Namespace zm_powerup_small_ammo/zm_powerup_small_ammo
// Params 2, eflags: 0x1 linked
// Checksum 0xe58394fc, Offset: 0x270
// Size: 0x74
function function_d7d24283(e_powerup, player) {
    if (isdefined(level.check_player_is_ready_for_ammo)) {
        if ([[ level.check_player_is_ready_for_ammo ]](player) == 0) {
            return;
        }
    }
    function_ae7afb91(player);
    player playsoundtoplayer(#"zmb_full_ammo", player);
}

// Namespace zm_powerup_small_ammo/zm_powerup_small_ammo
// Params 2, eflags: 0x1 linked
// Checksum 0xc04a1e8f, Offset: 0x2f0
// Size: 0x12c
function function_8be02874(drop_item, player) {
    players = getplayers(player.team);
    if (isdefined(level.var_73345bfd)) {
        players = [[ level.var_73345bfd ]](player);
    }
    level notify(#"hash_41ccd6a10f7370cc");
    foreach (player in players) {
        if (isdefined(level.check_player_is_ready_for_ammo)) {
            jumpiffalse([[ level.check_player_is_ready_for_ammo ]](player) == 0) LOC_000000e4;
        } else {
        LOC_000000e4:
            function_ae7afb91(player);
        }
    }
    level thread function_71bf1101(drop_item, player.team);
}

// Namespace zm_powerup_small_ammo/zm_powerup_small_ammo
// Params 1, eflags: 0x1 linked
// Checksum 0x51269df6, Offset: 0x428
// Size: 0x1e0
function function_ae7afb91(player) {
    a_w_weapons = player getweaponslist(0);
    player.var_655c0753 = undefined;
    player notify(#"zmb_small_ammo");
    player zm_placeable_mine::disable_all_prompts_for_player();
    foreach (w_weapon in a_w_weapons) {
        if (zm_loadout::is_lethal_grenade(w_weapon) || zm_loadout::is_offhand_weapon(w_weapon)) {
            continue;
        }
        if (isdefined(level.zombie_include_equipment) && isdefined(level.zombie_include_equipment[w_weapon]) && !(isdefined(level.zombie_equipment[w_weapon].refill_max_ammo) && level.zombie_equipment[w_weapon].refill_max_ammo)) {
            continue;
        }
        if (isdefined(level.zombie_weapons_no_max_ammo) && isdefined(level.zombie_weapons_no_max_ammo[w_weapon.name])) {
            continue;
        }
        if (zm_loadout::is_hero_weapon(w_weapon)) {
            continue;
        }
        if (player hasweapon(w_weapon)) {
            player function_7374e868(w_weapon);
        }
    }
}

// Namespace zm_powerup_small_ammo/zm_powerup_small_ammo
// Params 2, eflags: 0x1 linked
// Checksum 0xaf2e4378, Offset: 0x610
// Size: 0x5c
function function_71bf1101(drop_item, player_team) {
    players = getplayers(player_team);
    players[0] playsoundtoteam("zmb_full_ammo", player_team);
}

// Namespace zm_powerup_small_ammo/zm_powerup_small_ammo
// Params 1, eflags: 0x1 linked
// Checksum 0xe7021237, Offset: 0x678
// Size: 0x206
function function_7374e868(weapon) {
    var_cd9d17e0 = 0;
    if (!zm_loadout::is_offhand_weapon(weapon) || weapon.isriotshield) {
        weapon = self zm_weapons::get_weapon_with_attachments(weapon);
        if (isdefined(weapon)) {
            var_cb48c3c9 = weapon.maxammo;
            var_ef0714fa = weapon.startammo;
            n_clip_size = weapon.clipsize;
            var_5916b9ab = 0;
            if (weapon.dualwieldweapon != level.weaponnone) {
                var_5916b9ab = weapon.dualwieldweapon.clipsize;
            }
            var_b8624c26 = self getammocount(weapon);
            if (self hasperk(#"specialty_extraammo")) {
                n_ammo_max = var_cb48c3c9;
            } else {
                n_ammo_max = var_ef0714fa;
            }
            if (weapon.isdualwield) {
                n_ammo_max = n_ammo_max * 2;
            }
            if (var_b8624c26 >= n_ammo_max + n_clip_size + var_5916b9ab) {
                var_cd9d17e0 = 0;
            } else {
                var_cd9d17e0 = 1;
            }
        }
    } else if (self zm_weapons::has_weapon_or_upgrade(weapon)) {
        if (self getammocount(weapon) < weapon.maxammo) {
            var_cd9d17e0 = 1;
        }
    }
    if (var_cd9d17e0) {
        self give_clip_of_ammo(weapon);
        return 1;
    }
    if (!var_cd9d17e0) {
        return 0;
    }
}

// Namespace zm_powerup_small_ammo/zm_powerup_small_ammo
// Params 1, eflags: 0x1 linked
// Checksum 0x831a9706, Offset: 0x888
// Size: 0x214
function give_clip_of_ammo(w_weapon) {
    if (zm_loadout::function_2ff6913(w_weapon)) {
        return;
    }
    if (!self hasweapon(w_weapon)) {
        return;
    }
    self notify(#"hash_64f02bb4452a4bd7");
    if (zm_trial_reset_loadout::is_active(1)) {
        self function_7f7c1226(w_weapon);
        return;
    }
    n_clip = 0;
    var_98f6dae8 = self getweaponammoclip(w_weapon);
    n_pool = 0;
    var_df670713 = self getammocount(w_weapon);
    if (self hasperk(#"specialty_extraammo")) {
        n_pool = w_weapon.maxammo;
    } else {
        n_pool = w_weapon.startammo;
    }
    if (weaponhasattachment(w_weapon, "uber") && w_weapon.statname == #"smg_capacity_t8" || isdefined(w_weapon.isriotshield) && w_weapon.isriotshield) {
        n_clip = w_weapon.clipsize / 4;
    } else {
        n_clip = w_weapon.clipsize;
    }
    n_stock = int(min(n_pool, var_df670713 - var_98f6dae8 + n_clip));
    self setweaponammostock(w_weapon, n_stock);
}

// Namespace zm_powerup_small_ammo/zm_powerup_small_ammo
// Params 1, eflags: 0x5 linked
// Checksum 0xaec6aa3b, Offset: 0xaa8
// Size: 0xbc
function private function_7f7c1226(weapon) {
    waittillframeend();
    if (weaponhasattachment(weapon, "uber") && weapon.statname == #"smg_capacity_t8" || isdefined(weapon.isriotshield) && weapon.isriotshield) {
        n_stock = weapon.clipsize / 4;
    } else {
        n_stock = 0;
    }
    self setweaponammostock(weapon, n_stock);
}

