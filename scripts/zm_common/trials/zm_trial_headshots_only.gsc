#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\zm_common\zm_traps.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace zm_trial_headshots_only;

// Namespace zm_trial_headshots_only/zm_trial_headshots_only
// Params 0, eflags: 0x2
// Checksum 0x37451d23, Offset: 0xd8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_trial_headshots_only", &__init__, undefined, undefined);
}

// Namespace zm_trial_headshots_only/zm_trial_headshots_only
// Params 0, eflags: 0x1 linked
// Checksum 0x86cfe75a, Offset: 0x120
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"headshots_only", &on_begin, &on_end);
}

// Namespace zm_trial_headshots_only/zm_trial_headshots_only
// Params 1, eflags: 0x5 linked
// Checksum 0xc9143673, Offset: 0x188
// Size: 0x20c
function private on_begin(weapon_name) {
    level.var_153e9058 = 1;
    level.var_fe2bb2ac = 1;
    zm_traps::function_6966417b();
    foreach (player in getplayers()) {
        foreach (var_5a1e3e5b in level.hero_weapon) {
            foreach (w_hero in var_5a1e3e5b) {
                player lockweapon(w_hero, 1, 1);
            }
        }
        player zm_trial_util::function_9bf8e274();
        player zm_trial_util::function_dc9ab223(1);
    }
    callback::function_33f0ddd3(&function_33f0ddd3);
    level zm_trial::function_44200d07(1);
    level zm_trial::function_cd75b690(1);
}

// Namespace zm_trial_headshots_only/zm_trial_headshots_only
// Params 1, eflags: 0x5 linked
// Checksum 0x729da5a0, Offset: 0x3a0
// Size: 0x2a4
function private on_end(round_reset) {
    level.var_153e9058 = 0;
    level.var_fe2bb2ac = 0;
    zm_traps::function_9d0c9706();
    foreach (player in getplayers()) {
        foreach (var_5a1e3e5b in level.hero_weapon) {
            foreach (w_hero in var_5a1e3e5b) {
                player unlockweapon(w_hero);
            }
        }
        player zm_trial_util::function_73ff0096();
        foreach (w_equip in level.zombie_weapons) {
            if (w_equip.weapon_classname === "equipment") {
                player unlockweapon(w_equip.weapon);
            }
        }
        player zm_trial_util::function_dc9ab223(0);
    }
    callback::function_824d206(&function_33f0ddd3);
    level zm_trial::function_44200d07(0);
    level zm_trial::function_cd75b690(0);
}

// Namespace zm_trial_headshots_only/zm_trial_headshots_only
// Params 0, eflags: 0x1 linked
// Checksum 0x15525366, Offset: 0x650
// Size: 0x32
function is_active() {
    challenge = zm_trial::function_a36e8c38(#"headshots_only");
    return isdefined(challenge);
}

// Namespace zm_trial_headshots_only/zm_trial_headshots_only
// Params 1, eflags: 0x5 linked
// Checksum 0x46a8b16e, Offset: 0x690
// Size: 0x6c
function private function_33f0ddd3(s_event) {
    if (s_event.event === "give_weapon") {
        if (zm_loadout::function_59b0ef71("lethal_grenade", s_event.weapon)) {
            self lockweapon(s_event.weapon, 1, 1);
        }
    }
}

