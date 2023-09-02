// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_trial_force_archetypes;

// Namespace zm_trial_force_archetypes/zm_trial_force_archetypes
// Params 0, eflags: 0x2
// Checksum 0xdce73886, Offset: 0x80
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_trial_force_archetypes", &__init__, undefined, undefined);
}

// Namespace zm_trial_force_archetypes/zm_trial_force_archetypes
// Params 0, eflags: 0x1 linked
// Checksum 0x80d17ff8, Offset: 0xc8
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"force_archetypes", &on_begin, &on_end);
}

// Namespace zm_trial_force_archetypes/zm_trial_force_archetypes
// Params 4, eflags: 0x5 linked
// Checksum 0x2a92b1fd, Offset: 0x130
// Size: 0xe6
function private on_begin(var_34259a50, var_1d00ec07, var_10cad39b, var_f9ab255c) {
    archetypes = array::remove_undefined(array(var_34259a50, var_1d00ec07, var_10cad39b, var_f9ab255c), 0);
    self.var_c54c0d81 = [];
    foreach (archetype in archetypes) {
        self.var_c54c0d81[archetype] = 1;
    }
}

// Namespace zm_trial_force_archetypes/zm_trial_force_archetypes
// Params 1, eflags: 0x5 linked
// Checksum 0x6f532b18, Offset: 0x220
// Size: 0x16
function private on_end(round_reset) {
    self.var_c54c0d81 = undefined;
}

// Namespace zm_trial_force_archetypes/zm_trial_force_archetypes
// Params 1, eflags: 0x1 linked
// Checksum 0x11d91de, Offset: 0x240
// Size: 0x56
function function_ff2a74e7(archetype) {
    challenge = zm_trial::function_a36e8c38(#"force_archetypes");
    if (!isdefined(challenge)) {
        return 0;
    }
    return isdefined(challenge.var_c54c0d81[archetype]);
}

