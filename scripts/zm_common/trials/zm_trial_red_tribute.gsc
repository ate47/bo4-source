#using script_14af1fd264ffe8cc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace zm_trial_red_tribute;

// Namespace zm_trial_red_tribute/zm_trial_red_tribute
// Params 0, eflags: 0x2
// Checksum 0xe238cb33, Offset: 0xc8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_trial_red_tribute", &__init__, undefined, undefined);
}

// Namespace zm_trial_red_tribute/zm_trial_red_tribute
// Params 0, eflags: 0x1 linked
// Checksum 0x5923cc, Offset: 0x110
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"red_tribute", &on_begin, &on_end);
}

// Namespace zm_trial_red_tribute/zm_trial_red_tribute
// Params 0, eflags: 0x5 linked
// Checksum 0x20a007ba, Offset: 0x178
// Size: 0xec
function private on_begin() {
    foreach (player in getplayers()) {
        player thread function_29bcf2f8();
    }
    callback::on_ai_spawned(&on_ai_spawned);
    callback::on_ai_killed(&on_ai_killed);
    level.var_ddd04c77 = 0;
    level thread function_6fa5c86();
}

// Namespace zm_trial_red_tribute/zm_trial_red_tribute
// Params 1, eflags: 0x5 linked
// Checksum 0x1786b205, Offset: 0x270
// Size: 0x1ec
function private on_end(round_reset) {
    if (!round_reset) {
        var_ef7fbb73 = [];
        foreach (player in getplayers()) {
            if (!player.var_bfc22435) {
                if (!isdefined(var_ef7fbb73)) {
                    var_ef7fbb73 = [];
                } else if (!isarray(var_ef7fbb73)) {
                    var_ef7fbb73 = array(var_ef7fbb73);
                }
                var_ef7fbb73[var_ef7fbb73.size] = player;
            }
        }
        if (var_ef7fbb73.size) {
            zm_trial::fail(undefined, var_ef7fbb73);
        }
    }
    foreach (player in getplayers()) {
        player.var_bfc22435 = undefined;
        player zm_trial_util::function_f3aacffb();
    }
    level flag::clear("infinite_round_spawning");
    level.var_ddd04c77 = undefined;
    callback::remove_on_ai_spawned(&on_ai_spawned);
    callback::remove_on_ai_killed(&on_ai_killed);
}

// Namespace zm_trial_red_tribute/zm_trial_red_tribute
// Params 0, eflags: 0x5 linked
// Checksum 0x751a87de, Offset: 0x468
// Size: 0x23a
function private function_29bcf2f8() {
    self endon(#"disconnect");
    level endon(#"hash_7646638df88a3656");
    self.var_bfc22435 = 0;
    if (isdefined(self.var_7a281a7e)) {
        self.var_7a281a7e.b_timeout = 1;
    }
    if (isarray(level.var_d1c9bbc4)) {
        arrayremovevalue(level.var_d1c9bbc4, undefined);
        foreach (var_8c04c69e in level.var_d1c9bbc4) {
            var_8c04c69e.b_timeout = 1;
        }
    }
    self notify(#"challenge_reward_timeout");
    self notify(#"spew_reward_picked_up");
    if (isdefined(self.s_tribute_bowl) && isdefined(self.s_tribute_bowl.var_9d32404)) {
        self.s_tribute_bowl.var_9d32404 clientfield::set("" + #"hash_21f5fab6a3d22093", 0);
    }
    self namespace_f8f28e08::set_tribute(0);
    self namespace_f8f28e08::function_ae2c0ba5();
    self zm_trial_util::function_63060af4(0);
    while (true) {
        s_waitresult = self waittill(#"hash_24326081081c2468");
        if (s_waitresult.var_9e09931e === 4) {
            self.var_bfc22435 = 1;
            self zm_trial_util::function_63060af4(1);
            return;
        }
    }
}

// Namespace zm_trial_red_tribute/zm_trial_red_tribute
// Params 0, eflags: 0x5 linked
// Checksum 0x58e1a5e3, Offset: 0x6b0
// Size: 0x128
function private function_6fa5c86() {
    level endon(#"hash_7646638df88a3656");
    level flag::set("infinite_round_spawning");
    while (true) {
        var_84579c01 = 1;
        foreach (player in getplayers()) {
            if (isalive(player) && !(isdefined(player.var_bfc22435) && player.var_bfc22435)) {
                var_84579c01 = 0;
                break;
            }
        }
        if (var_84579c01) {
            level flag::clear("infinite_round_spawning");
            return;
        }
        wait 1;
    }
}

// Namespace zm_trial_red_tribute/zm_trial_red_tribute
// Params 0, eflags: 0x1 linked
// Checksum 0x799e343d, Offset: 0x7e0
// Size: 0x1c
function on_ai_spawned() {
    self thread track_spawns();
}

// Namespace zm_trial_red_tribute/zm_trial_red_tribute
// Params 0, eflags: 0x5 linked
// Checksum 0xd641d94, Offset: 0x808
// Size: 0x84
function private track_spawns() {
    self endon(#"death");
    level endon(#"hash_7646638df88a3656");
    wait 1;
    if (!(isdefined(self.var_12745932) && self.var_12745932)) {
        level.var_ddd04c77++;
        if (level.var_ddd04c77 >= level.var_38b15968) {
            self zm_score::function_acaab828(1);
        }
    }
}

// Namespace zm_trial_red_tribute/zm_trial_red_tribute
// Params 1, eflags: 0x1 linked
// Checksum 0xab61fe27, Offset: 0x898
// Size: 0x30
function on_ai_killed(params) {
    if (isdefined(self.var_c39323b5) && self.var_c39323b5) {
        level.var_ddd04c77--;
    }
}

// Namespace zm_trial_red_tribute/zm_trial_red_tribute
// Params 0, eflags: 0x1 linked
// Checksum 0x2fe25f04, Offset: 0x8d0
// Size: 0x32
function is_active() {
    s_challenge = zm_trial::function_a36e8c38(#"red_tribute");
    return isdefined(s_challenge);
}

