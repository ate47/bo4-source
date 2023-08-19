// Atian COD Tools GSC decompiler test
#include scripts/zm_common/zm_utility.gsc;
#include scripts/zm_common/zm_score.gsc;
#include scripts/zm_common/zm_trial_util.gsc;
#include scripts/zm_common/zm_trial.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/laststand_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;

#namespace namespace_6c76c1da;

// Namespace namespace_6c76c1da/namespace_6c76c1da
// Params 0, eflags: 0x2
// Checksum 0x93f6291e, Offset: 0xc8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_442b60ca31422a3c", &__init__, undefined, undefined);
}

// Namespace namespace_6c76c1da/namespace_6c76c1da
// Params 0, eflags: 0x1 linked
// Checksum 0xfab70c91, Offset: 0x110
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"hash_5124770c13a75bab", &on_begin, &on_end);
}

// Namespace namespace_6c76c1da/namespace_6c76c1da
// Params 3, eflags: 0x5 linked
// Checksum 0x7d95d6c0, Offset: 0x178
// Size: 0x160
function private on_begin(var_93fc795f, var_a7c52900, var_c8a36f90) {
    var_a7c52900 = zm_trial::function_5769f26a(var_a7c52900);
    level.var_1c8f9eba = var_c8a36f90;
    wait(6);
    foreach (player in getplayers()) {
        if (isdefined(var_c8a36f90)) {
            switch (var_c8a36f90) {
            case #"prone_random":
                player thread function_9c988cd8(var_93fc795f, var_a7c52900, 1);
                break;
            case #"crouch":
                player thread function_9c988cd8(var_93fc795f, var_a7c52900, 0);
                break;
            }
        } else {
            player thread movement_watcher(var_93fc795f, var_a7c52900);
        }
    }
}

// Namespace namespace_6c76c1da/namespace_6c76c1da
// Params 1, eflags: 0x5 linked
// Checksum 0xe99a207b, Offset: 0x2e0
// Size: 0x16
function private on_end(round_reset) {
    level.var_1c8f9eba = undefined;
}

// Namespace namespace_6c76c1da/namespace_6c76c1da
// Params 0, eflags: 0x0
// Checksum 0x2fa39afd, Offset: 0x300
// Size: 0x32
function is_active() {
    challenge = zm_trial::function_a36e8c38(#"hash_5124770c13a75bab");
    return isdefined(challenge);
}

// Namespace namespace_6c76c1da/namespace_6c76c1da
// Params 2, eflags: 0x5 linked
// Checksum 0xbff286ed, Offset: 0x340
// Size: 0x136
function private movement_watcher(var_93fc795f, var_98de1f93) {
    self endon(#"disconnect");
    level endon(#"hash_7646638df88a3656");
    while (1) {
        var_197c85d1 = self getvelocity();
        var_9b7f7d9b = length(var_197c85d1);
        if (isalive(self) && !self laststand::player_is_in_laststand() && !self issprinting()) {
            self function_6b13a114(var_93fc795f, var_98de1f93);
            if (var_9b7f7d9b == 0) {
                n_wait_time = 0.25;
            } else {
                n_wait_time = max(0.5, var_9b7f7d9b / 190);
            }
            wait(n_wait_time);
        }
        waitframe(1);
    }
}

// Namespace namespace_6c76c1da/namespace_6c76c1da
// Params 2, eflags: 0x5 linked
// Checksum 0x90959189, Offset: 0x480
// Size: 0x94
function private function_6b13a114(var_93fc795f, var_a7c52900) {
    self playsoundtoplayer(#"hash_6df374d848ba6a60", self);
    if (var_93fc795f === "health") {
        self dodamage(var_a7c52900, self.origin);
    } else if (var_93fc795f === "points") {
        self zm_score::minus_to_player_score(var_a7c52900, 1);
    }
}

// Namespace namespace_6c76c1da/namespace_6c76c1da
// Params 0, eflags: 0x5 linked
// Checksum 0xcb7b6dab, Offset: 0x520
// Size: 0x14a
function private function_26f124d8() {
    if (!isdefined(level.var_1c8f9eba)) {
        return 1;
    }
    switch (level.var_1c8f9eba) {
    case #"ads":
        var_389b3ef1 = self playerads();
        if (self adsbuttonpressed() && var_389b3ef1 > 0) {
            return 1;
        }
        return 0;
    case #"jump":
        if (self zm_utility::is_jumping()) {
            return 1;
        }
        return 0;
    case #"slide":
        if (self issliding()) {
            return 1;
        }
        return 0;
    case #"crouch":
        if (self getstance() === "crouch") {
            return 1;
        }
        return 0;
    case #"prone_random":
    case #"prone":
        if (self getstance() === "prone") {
            return 1;
        }
        return 0;
    case #"movement":
    default:
        v_velocity = self getvelocity();
        if (length(v_velocity) != 0) {
            return 1;
        }
        return 0;
    }
}

// Namespace namespace_6c76c1da/namespace_6c76c1da
// Params 3, eflags: 0x5 linked
// Checksum 0x7bc4c4ed, Offset: 0x700
// Size: 0x10a
function private function_9c988cd8(var_93fc795f, var_98de1f93, var_e898f976 = 0) {
    self endon(#"disconnect");
    level endon(#"hash_7646638df88a3656");
    if (!var_e898f976) {
        wait(12);
    }
    while (1) {
        if (var_e898f976) {
            wait(randomfloatrange(10, 25));
        } else {
            waitframe(1);
        }
        while (isalive(self) && !self laststand::player_is_in_laststand() && !self function_26f124d8()) {
            self function_6b13a114(var_93fc795f, var_98de1f93);
            wait(1);
        }
    }
}

