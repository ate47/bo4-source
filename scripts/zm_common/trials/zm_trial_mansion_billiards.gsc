#using scripts\zm_common\bgbs\zm_bgb_newtonian_negation;
#using scripts\zm_common\zm_bgb_pack;
#using scripts\zm_common\zm_bgb;
#using scripts\zm_common\zm_trial_util;
#using scripts\zm_common\zm_trial;
#using scripts\core_common\flag_shared;
#using scripts\core_common\system_shared;

#namespace zm_trial_mansion_billiards;

// Namespace zm_trial_mansion_billiards/zm_trial_mansion_billiards
// Params 0, eflags: 0x2
// Checksum 0xb40910a, Offset: 0xa0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_trial_mansion_billiards", &__init__, undefined, undefined);
}

// Namespace zm_trial_mansion_billiards/zm_trial_mansion_billiards
// Params 0, eflags: 0x1 linked
// Checksum 0x2d12d7de, Offset: 0xe8
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"mansion_billiards", &on_begin, &on_end);
}

// Namespace zm_trial_mansion_billiards/zm_trial_mansion_billiards
// Params 0, eflags: 0x5 linked
// Checksum 0x44092883, Offset: 0x150
// Size: 0x1c
function private on_begin() {
    level thread function_b7bc0616();
}

// Namespace zm_trial_mansion_billiards/zm_trial_mansion_billiards
// Params 1, eflags: 0x5 linked
// Checksum 0x60519e41, Offset: 0x178
// Size: 0x7c
function private on_end(round_reset) {
    zm_trial_util::function_f3dbeda7();
    if (!round_reset && !level flag::get(#"hash_4207012c64662b4d")) {
        zm_trial::fail(#"hash_2c061f4e3509c0f4");
    }
    enable_newtonian_negation();
}

// Namespace zm_trial_mansion_billiards/zm_trial_mansion_billiards
// Params 0, eflags: 0x5 linked
// Checksum 0x2ea5ae66, Offset: 0x200
// Size: 0x9c
function private function_b7bc0616() {
    level endon(#"hash_7646638df88a3656", #"end_game");
    zm_trial_util::function_7d32b7d0(0);
    function_f5ad51bd();
    level flag::wait_till(#"hash_4207012c64662b4d");
    waitframe(1);
    zm_trial_util::function_7d32b7d0(1);
    enable_newtonian_negation();
}

// Namespace zm_trial_mansion_billiards/zm_trial_mansion_billiards
// Params 0, eflags: 0x5 linked
// Checksum 0xf46d3f03, Offset: 0x2a8
// Size: 0xfc
function private function_f5ad51bd() {
    foreach (player in getplayers()) {
        if (player bgb::is_enabled(#"zm_bgb_newtonian_negation")) {
            player.var_30ee603f = 1;
            player.var_4b0fb2fb = 1;
        }
        player bgb_pack::function_59004002(#"zm_bgb_newtonian_negation", 1);
    }
    level.var_6bbb45f9 = 1;
    zm_bgb_newtonian_negation::function_8622e664(0);
}

// Namespace zm_trial_mansion_billiards/zm_trial_mansion_billiards
// Params 0, eflags: 0x5 linked
// Checksum 0xc10baf82, Offset: 0x3b0
// Size: 0xe2
function private enable_newtonian_negation() {
    foreach (player in getplayers()) {
        if (isdefined(player.var_30ee603f) && player.var_30ee603f) {
            zm_bgb_newtonian_negation::function_8622e664(1);
            player.var_30ee603f = undefined;
            player.var_4b0fb2fb = undefined;
        }
        player bgb_pack::function_59004002(#"zm_bgb_newtonian_negation", 0);
    }
    level.var_6bbb45f9 = undefined;
}

