#using scripts\zm_common\zm_trial_util;
#using scripts\zm_common\zm_trial;
#using scripts\core_common\system_shared;

#namespace zm_trial_white_mobile_plan;

// Namespace zm_trial_white_mobile_plan/zm_trial_white_mobile_plan
// Params 0, eflags: 0x2
// Checksum 0x7e4b9b3d, Offset: 0x80
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_trial_white_mobile_plan", &__init__, undefined, undefined);
}

// Namespace zm_trial_white_mobile_plan/zm_trial_white_mobile_plan
// Params 0, eflags: 0x1 linked
// Checksum 0x82db74a1, Offset: 0xc8
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"mobile_plan", &on_begin, &on_end);
}

// Namespace zm_trial_white_mobile_plan/zm_trial_white_mobile_plan
// Params 1, eflags: 0x5 linked
// Checksum 0x8ce822b5, Offset: 0x130
// Size: 0x4c
function private on_begin(var_ff22cb62) {
    self.var_ff22cb62 = zm_trial::function_5769f26a(var_ff22cb62);
    self.var_6a7521e3 = 0;
    self thread function_53627246();
}

// Namespace zm_trial_white_mobile_plan/zm_trial_white_mobile_plan
// Params 1, eflags: 0x5 linked
// Checksum 0x37885646, Offset: 0x188
// Size: 0xc4
function private on_end(round_reset) {
    zm_trial_util::function_f3dbeda7();
    foreach (s_portal in level.a_s_portals) {
        s_portal.var_5b12474a = undefined;
    }
    if (!round_reset) {
        if (self.var_6a7521e3 < self.var_ff22cb62) {
            zm_trial::fail(#"hash_6a1df2dbfb66a948");
        }
    }
}

// Namespace zm_trial_white_mobile_plan/zm_trial_white_mobile_plan
// Params 0, eflags: 0x5 linked
// Checksum 0x4b0c130e, Offset: 0x258
// Size: 0x12c
function private function_53627246() {
    level endon(#"hash_7646638df88a3656", #"end_game");
    zm_trial_util::function_2976fa44(self.var_ff22cb62);
    zm_trial_util::function_dace284(self.var_6a7521e3);
    while (true) {
        s_waitresult = level waittill(#"portal_used");
        if (!(isdefined(s_waitresult.s_portal.var_5b12474a) && s_waitresult.s_portal.var_5b12474a)) {
            s_waitresult.s_portal.var_5b12474a = 1;
            self.var_6a7521e3++;
            zm_trial_util::function_dace284(self.var_6a7521e3);
        }
        if (self.var_6a7521e3 == self.var_ff22cb62) {
            zm_trial_util::function_7d32b7d0(1);
            break;
        }
    }
}

