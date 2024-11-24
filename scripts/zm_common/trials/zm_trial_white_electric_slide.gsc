#using scripts\core_common\flag_shared;
#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_trial;
#using scripts\zm_common\zm_trial_util;
#using scripts\zm_common\zm_utility;

#namespace zm_trial_white_electric_slide;

// Namespace zm_trial_white_electric_slide/zm_trial_white_electric_slide
// Params 0, eflags: 0x2
// Checksum 0xce56fded, Offset: 0x90
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_trial_white_electric_slide", &__init__, undefined, undefined);
}

// Namespace zm_trial_white_electric_slide/zm_trial_white_electric_slide
// Params 0, eflags: 0x1 linked
// Checksum 0x5e748e1, Offset: 0xd8
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"electric_slide", &on_begin, &on_end);
}

// Namespace zm_trial_white_electric_slide/zm_trial_white_electric_slide
// Params 4, eflags: 0x5 linked
// Checksum 0xd7998fec, Offset: 0x140
// Size: 0x1d0
function private on_begin(var_b7088c5b, var_5bf91a8, var_d9f1b8f9, var_fc678144) {
    switch (getplayers().size) {
    case 1:
        level.var_795dfe46 = zm_trial::function_5769f26a(var_b7088c5b);
        break;
    case 2:
        level.var_795dfe46 = zm_trial::function_5769f26a(var_5bf91a8);
        break;
    case 3:
        level.var_795dfe46 = zm_trial::function_5769f26a(var_d9f1b8f9);
        break;
    case 4:
        level.var_795dfe46 = zm_trial::function_5769f26a(var_fc678144);
        break;
    }
    foreach (player in getplayers()) {
        player.var_795dfe46 = 0;
        player zm_trial_util::function_c2cd0cba(level.var_795dfe46);
        player zm_trial_util::function_2190356a(player.var_795dfe46);
        player thread function_729edb5f();
    }
}

// Namespace zm_trial_white_electric_slide/zm_trial_white_electric_slide
// Params 1, eflags: 0x5 linked
// Checksum 0x89a6d9e1, Offset: 0x318
// Size: 0x1a2
function private on_end(round_reset) {
    if (!round_reset) {
        var_696c3b4 = [];
        foreach (player in getplayers()) {
            if (player.var_795dfe46 < level.var_795dfe46) {
                if (!isdefined(var_696c3b4)) {
                    var_696c3b4 = [];
                } else if (!isarray(var_696c3b4)) {
                    var_696c3b4 = array(var_696c3b4);
                }
                var_696c3b4[var_696c3b4.size] = player;
            }
        }
        if (var_696c3b4.size) {
            zm_trial::fail(#"hash_5a354b422e429f71", var_696c3b4);
        }
    }
    foreach (player in getplayers()) {
        player zm_trial_util::function_f3aacffb();
    }
    level.var_795dfe46 = undefined;
}

// Namespace zm_trial_white_electric_slide/zm_trial_white_electric_slide
// Params 0, eflags: 0x5 linked
// Checksum 0xd593e8c9, Offset: 0x4c8
// Size: 0xd0
function private function_729edb5f() {
    level endon(#"hash_7646638df88a3656");
    while (self.var_795dfe46 < level.var_795dfe46) {
        self waittill(#"hash_15541419dbbe7e1a");
        self.var_795dfe46++;
        if (self.var_795dfe46 < level.var_795dfe46) {
            self zm_trial_util::function_c2cd0cba(level.var_795dfe46);
            self zm_trial_util::function_2190356a(self.var_795dfe46);
        }
        if (self.var_795dfe46 == level.var_795dfe46) {
            self zm_trial_util::function_63060af4(1);
        }
    }
}

