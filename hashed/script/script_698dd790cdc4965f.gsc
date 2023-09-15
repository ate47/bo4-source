// Atian COD Tools GSC decompiler test
#using script_35d3717bf2cbee8f;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_83dc3729;

// Namespace namespace_83dc3729/namespace_83dc3729
// Params 0, eflags: 0x2
// Checksum 0x7e665a82, Offset: 0x90
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_491590ee8fe06753", &__init__, undefined, undefined);
}

// Namespace namespace_83dc3729/namespace_83dc3729
// Params 0, eflags: 0x1 linked
// Checksum 0x9cdb43c6, Offset: 0xd8
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"hash_7dd35595d2a7953a", &on_begin, &on_end);
}

// Namespace namespace_83dc3729/namespace_83dc3729
// Params 0, eflags: 0x5 linked
// Checksum 0xe66a79a2, Offset: 0x140
// Size: 0x1c4
function private on_begin() {
    /#
        assert(isdefined(level.zombie_weapons_upgraded));
    #/
    level.var_af806901 = [];
    foreach (upgraded_weapon in getarraykeys(level.zombie_weapons_upgraded)) {
        level.var_af806901[upgraded_weapon.name] = upgraded_weapon;
    }
    foreach (player in getplayers()) {
        player function_6a8979c9();
        player callback::function_33f0ddd3(&function_33f0ddd3);
        player zm_trial_util::function_7dbb1712(1);
        player callback::on_weapon_change(&zm_trial_util::function_79518194);
    }
    zm_trial_util::function_eea26e56();
    level zm_trial::function_8e2a923(1);
}

// Namespace namespace_83dc3729/namespace_83dc3729
// Params 1, eflags: 0x5 linked
// Checksum 0x7fb58799, Offset: 0x310
// Size: 0x1dc
function private on_end(round_reset) {
    foreach (player in getplayers()) {
        player callback::function_824d206(&function_33f0ddd3);
        player callback::remove_on_weapon_change(&zm_trial_util::function_79518194);
        foreach (weapon in player getweaponslist(1)) {
            player unlockweapon(weapon);
            if (weapon.isdualwield && weapon.dualwieldweapon != level.weaponnone) {
                player unlockweapon(weapon.dualwieldweapon);
            }
        }
        player zm_trial_util::function_7dbb1712(1);
    }
    level.var_af806901 = undefined;
    zm_trial_util::function_ef1fce77();
    level zm_trial::function_8e2a923(0);
}

// Namespace namespace_83dc3729/namespace_83dc3729
// Params 0, eflags: 0x1 linked
// Checksum 0xf8e59557, Offset: 0x4f8
// Size: 0x32
function is_active() {
    challenge = zm_trial::function_a36e8c38(#"hash_7dd35595d2a7953a");
    return isdefined(challenge);
}

// Namespace namespace_83dc3729/namespace_83dc3729
// Params 1, eflags: 0x5 linked
// Checksum 0x45195f85, Offset: 0x538
// Size: 0x24
function private function_33f0ddd3(eventstruct) {
    self function_6a8979c9();
}

// Namespace namespace_83dc3729/namespace_83dc3729
// Params 0, eflags: 0x5 linked
// Checksum 0xb57119c5, Offset: 0x568
// Size: 0x1c0
function private function_6a8979c9() {
    /#
        assert(isdefined(level.var_af806901));
    #/
    foreach (weapon in self getweaponslist(1)) {
        if (isdefined(level.var_af806901[weapon.name])) {
            self function_28602a03(weapon);
        } else if (!namespace_fc5170d1::is_active() || !isarray(level.var_3e2ac3b6) || !isdefined(level.var_3e2ac3b6[weapon.name])) {
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

