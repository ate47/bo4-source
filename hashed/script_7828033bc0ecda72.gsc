// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_7499819f;

// Namespace namespace_7499819f/namespace_7499819f
// Params 0, eflags: 0x2
// Checksum 0x22cd055b, Offset: 0x88
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_3887e77731340f48", &__init__, undefined, undefined);
}

// Namespace namespace_7499819f/namespace_7499819f
// Params 0, eflags: 0x0
// Checksum 0x34ceb065, Offset: 0xd0
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"hash_b143bd998abdd27", &on_begin, &on_end);
}

// Namespace namespace_7499819f/namespace_7499819f
// Params 0, eflags: 0x4
// Checksum 0xea4628d0, Offset: 0x138
// Size: 0x90
function private on_begin() {
    foreach (player in getplayers()) {
        player callback::on_laststand(&on_player_laststand);
    }
}

// Namespace namespace_7499819f/namespace_7499819f
// Params 1, eflags: 0x4
// Checksum 0x9457520a, Offset: 0x1d0
// Size: 0x98
function private on_end(round_reset) {
    foreach (player in getplayers()) {
        player callback::remove_on_laststand(&on_player_laststand);
    }
}

// Namespace namespace_7499819f/namespace_7499819f
// Params 0, eflags: 0x4
// Checksum 0xc66497eb, Offset: 0x270
// Size: 0x4c
function private on_player_laststand() {
    var_57807cdc = [];
    array::add(var_57807cdc, self, 0);
    zm_trial::fail(#"hash_272fae998263208b", var_57807cdc);
}

