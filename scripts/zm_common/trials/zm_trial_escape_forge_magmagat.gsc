// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace namespace_6c76c1da;

// Namespace namespace_6c76c1da/zm_trial_escape_forge_magmagat
// Params 0, eflags: 0x2
// Checksum 0xa5e1122e, Offset: 0x98
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_trial_escape_forge_magmagat", &__init__, undefined, undefined);
}

// Namespace namespace_6c76c1da/zm_trial_escape_forge_magmagat
// Params 0, eflags: 0x1 linked
// Checksum 0x8d3c4e98, Offset: 0xe0
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"forge_magmagat", &on_begin, &on_end);
}

// Namespace namespace_6c76c1da/zm_trial_escape_forge_magmagat
// Params 0, eflags: 0x5 linked
// Checksum 0xd6a8d76b, Offset: 0x148
// Size: 0x24
function private on_begin() {
    level.var_e60b8c3a = undefined;
    level thread function_a543a954();
}

// Namespace namespace_6c76c1da/zm_trial_escape_forge_magmagat
// Params 1, eflags: 0x5 linked
// Checksum 0xe9e23ec0, Offset: 0x178
// Size: 0x76
function private on_end(round_reset) {
    zm_trial_util::function_f3dbeda7();
    if (!round_reset && !(isdefined(level.var_e60b8c3a) && level.var_e60b8c3a)) {
        zm_trial::fail(#"hash_12f3fd15a168901");
    }
    level.var_e60b8c3a = undefined;
}

// Namespace namespace_6c76c1da/zm_trial_escape_forge_magmagat
// Params 0, eflags: 0x5 linked
// Checksum 0x6d8b50c2, Offset: 0x1f8
// Size: 0x6c
function private function_a543a954() {
    level endon(#"hash_7646638df88a3656");
    level waittill(#"hash_5dc448a84a24492", #"magma_forge_completed");
    level.var_e60b8c3a = 1;
    zm_trial_util::function_7d32b7d0(1);
}

