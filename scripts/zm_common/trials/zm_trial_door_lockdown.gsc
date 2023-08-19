// Atian COD Tools GSC decompiler test
#include scripts/core_common/ai/zombie_utility.gsc;
#include scripts/zm_common/zm_utility.gsc;
#include scripts/zm_common/zm_trial_util.gsc;
#include scripts/zm_common/zm_trial.gsc;
#include scripts/zm_common/zm_blockers.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/struct.gsc;
#include scripts/core_common/values_shared.gsc;
#include scripts/core_common/flag_shared.gsc;
#include scripts/core_common/array_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;
#include scripts/core_common/system_shared.gsc;

#namespace zm_trial_door_lockdown;

// Namespace zm_trial_door_lockdown/zm_trial_door_lockdown
// Params 0, eflags: 0x2
// Checksum 0x3a373ae6, Offset: 0x140
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_trial_door_lockdown", &__init__, undefined, undefined);
}

// Namespace zm_trial_door_lockdown/zm_trial_door_lockdown
// Params 0, eflags: 0x0
// Checksum 0xb95e9afc, Offset: 0x188
// Size: 0x9c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    clientfield::register("scriptmover", "" + #"zm_trial_door_lockdown", 16000, 1, "int");
    zm_trial::register_challenge(#"door_lockdown", &on_begin, &on_end);
}

// Namespace zm_trial_door_lockdown/zm_trial_door_lockdown
// Params 0, eflags: 0x4
// Checksum 0x7fd88030, Offset: 0x230
// Size: 0xcc
function private on_begin() {
    function_58fc4e38(8);
    level flag::set(#"disable_fast_travel");
    var_57ba058f = getentarray("gondola_call_trigger", "targetname");
    var_9ce0aba1 = getentarray("gondola_move_trigger", "targetname");
    array::run_all(var_57ba058f, &setinvisibletoall);
    array::run_all(var_9ce0aba1, &setinvisibletoall);
}

// Namespace zm_trial_door_lockdown/zm_trial_door_lockdown
// Params 1, eflags: 0x4
// Checksum 0xbbda85b5, Offset: 0x308
// Size: 0xcc
function private on_end(round_reset) {
    level flag::clear(#"disable_fast_travel");
    var_57ba058f = getentarray("gondola_call_trigger", "targetname");
    var_9ce0aba1 = getentarray("gondola_move_trigger", "targetname");
    array::run_all(var_57ba058f, &setvisibletoall);
    array::run_all(var_9ce0aba1, &setvisibletoall);
    function_92f23ef0();
}

// Namespace zm_trial_door_lockdown/zm_trial_door_lockdown
// Params 0, eflags: 0x0
// Checksum 0x5b00f1b1, Offset: 0x3e0
// Size: 0x32
function is_active() {
    s_challenge = zm_trial::function_a36e8c38(#"door_lockdown");
    return isdefined(s_challenge);
}

// Namespace zm_trial_door_lockdown/zm_trial_door_lockdown
// Params 1, eflags: 0x0
// Checksum 0x9a4938d3, Offset: 0x420
// Size: 0x190
function function_58fc4e38(n_delay = 0) {
    level endon(#"hash_7646638df88a3656");
    wait(n_delay);
    a_s_blockers = struct::get_array("trials_door_lockdown_clip");
    foreach (s_blocker in a_s_blockers) {
        if (!isdefined(s_blocker.mdl_blocker)) {
            s_blocker.mdl_blocker = util::spawn_model(isdefined(s_blocker.model) ? s_blocker.model : #"collision_player_wall_128x128x10", s_blocker.origin, s_blocker.angles);
        }
        s_blocker.mdl_blocker ghost();
        util::wait_network_frame();
        s_blocker.mdl_blocker clientfield::set("" + #"zm_trial_door_lockdown", 1);
    }
}

// Namespace zm_trial_door_lockdown/zm_trial_door_lockdown
// Params 1, eflags: 0x0
// Checksum 0x6cac6f61, Offset: 0x5b8
// Size: 0x128
function function_92f23ef0(n_delay = 0) {
    level endon(#"hash_7646638df88a3656");
    wait(n_delay);
    a_s_blockers = struct::get_array("trials_door_lockdown_clip");
    foreach (s_blocker in a_s_blockers) {
        if (isdefined(s_blocker.mdl_blocker)) {
            s_blocker.mdl_blocker clientfield::set("" + #"zm_trial_door_lockdown", 0);
            util::wait_network_frame();
            s_blocker.mdl_blocker delete();
        }
    }
}

