// Atian COD Tools GSC decompiler test
#include scripts/zm_common/zm.gsc;
#include script_698dd790cdc4965f;
#include scripts/zm_common/zm_loadout.gsc;
#include scripts/zm_common/zm_trial_util.gsc;
#include scripts/zm_common/zm_trial.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;

#namespace namespace_e01afe67;

// Namespace namespace_e01afe67/namespace_e01afe67
// Params 0, eflags: 0x2
// Checksum 0xae7c0c7c, Offset: 0xa0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_993ee8bedbddc19", &__init__, undefined, undefined);
}

// Namespace namespace_e01afe67/namespace_e01afe67
// Params 0, eflags: 0x1 linked
// Checksum 0x53595dcd, Offset: 0xe8
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"hash_27897abffa9137fc", &on_begin, &on_end);
}

// Namespace namespace_e01afe67/namespace_e01afe67
// Params 0, eflags: 0x5 linked
// Checksum 0x2ad713fb, Offset: 0x150
// Size: 0x35c
function private on_begin() {
    zm::register_actor_damage_callback(&height_check);
    callback::on_ai_spawned(&on_ai_spawned);
    level.var_8c018a0e = 1;
    weapon_names = array(#"hero_chakram_lv1", #"hero_chakram_lv2", #"hero_chakram_lv3", #"hero_chakram_lh_lv1", #"hero_chakram_lh_lv2", #"hero_chakram_lh_lv3", #"hero_hammer_lv1", #"hero_hammer_lv2", #"hero_hammer_lv3", #"hero_katana_t8_lv1", #"hero_katana_t8_lv2", #"hero_katana_t8_lv3", #"hero_scepter_lv1", #"hero_scepter_lv2", #"hero_scepter_lv3", #"hero_sword_pistol_lv1", #"hero_sword_pistol_lv2", #"hero_sword_pistol_lv3", #"hero_sword_pistol_lh_lv1", #"hero_sword_pistol_lh_lv2", #"hero_sword_pistol_lh_lv3");
    level.var_3e2ac3b6 = [];
    foreach (weapon_name in weapon_names) {
        weapon = getweapon(weapon_name);
        if (isdefined(weapon) && weapon != level.weaponnone) {
            level.var_3e2ac3b6[weapon.name] = weapon;
        }
    }
    foreach (player in getplayers()) {
        player function_6a8979c9();
        player callback::function_33f0ddd3(&function_33f0ddd3);
        player zm_trial_util::function_9bf8e274();
    }
    level zm_trial::function_44200d07(1);
}

// Namespace namespace_e01afe67/namespace_e01afe67
// Params 1, eflags: 0x5 linked
// Checksum 0x67a2ced, Offset: 0x4b8
// Size: 0x224
function private on_end(round_reset) {
    callback::remove_on_ai_spawned(&on_ai_spawned);
    level.var_8c018a0e = undefined;
    if (isinarray(level.actor_damage_callbacks, &height_check)) {
        arrayremovevalue(level.actor_damage_callbacks, &height_check, 0);
    }
    foreach (player in getplayers()) {
        player callback::function_824d206(&function_33f0ddd3);
        foreach (weapon in player getweaponslist(1)) {
            player unlockweapon(weapon);
            if (weapon.isdualwield && weapon.dualwieldweapon != level.weaponnone) {
                player unlockweapon(weapon.dualwieldweapon);
            }
        }
        player zm_trial_util::function_73ff0096();
    }
    level.var_3e2ac3b6 = undefined;
    level zm_trial::function_44200d07(0);
}

// Namespace namespace_e01afe67/namespace_e01afe67
// Params 0, eflags: 0x0
// Checksum 0x113e9ca, Offset: 0x6e8
// Size: 0x32
function is_active() {
    challenge = zm_trial::function_a36e8c38(#"hash_27897abffa9137fc");
    return isdefined(challenge);
}

// Namespace namespace_e01afe67/namespace_e01afe67
// Params c, eflags: 0x5 linked
// Checksum 0xc80e936d, Offset: 0x728
// Size: 0xbc
function private height_check(inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype) {
    if (isdefined(attacker.origin) && isdefined(self.origin) && attacker.origin[2] > self.origin[2] + 40) {
        return damage;
    } else {
        return 0;
    }
}

// Namespace namespace_e01afe67/namespace_e01afe67
// Params 0, eflags: 0x5 linked
// Checksum 0xe2e2dfd9, Offset: 0x7f0
// Size: 0x1e
function private on_ai_spawned() {
    self.ignore_nuke = 1;
    self.no_gib = 1;
}

// Namespace namespace_e01afe67/namespace_e01afe67
// Params 1, eflags: 0x5 linked
// Checksum 0x19ebd0d1, Offset: 0x818
// Size: 0x24
function private function_33f0ddd3(eventstruct) {
    self function_6a8979c9();
}

// Namespace namespace_e01afe67/namespace_e01afe67
// Params 0, eflags: 0x5 linked
// Checksum 0x739397b6, Offset: 0x848
// Size: 0x1e0
function private function_6a8979c9() {
    /#
        assert(isdefined(level.var_3e2ac3b6));
    #/
    foreach (weapon in self getweaponslist(1)) {
        if (zm_loadout::is_hero_weapon(weapon) || isdefined(weapon.isriotshield) && weapon.isriotshield) {
            self function_28602a03(weapon);
        } else if (!namespace_83dc3729::is_active() || !isarray(level.var_af806901) || !isdefined(level.var_af806901[weapon.name])) {
            self unlockweapon(weapon);
        }
        if (weapon.isdualwield && weapon.dualwieldweapon != level.weaponnone) {
            if (self function_635f9c02(weapon)) {
                self function_28602a03(weapon.dualwieldweapon);
            } else {
                self unlockweapon(weapon.dualwieldweapon);
            }
        }
    }
}

