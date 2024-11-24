#using scripts\core_common\callbacks_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_powerups;
#using scripts\zm_common\zm_trial;
#using scripts\zm_common\zm_trial_util;
#using scripts\zm_common\zm_utility;

#namespace zm_trial_board_everything;

// Namespace zm_trial_board_everything/zm_trial_board_everything
// Params 0, eflags: 0x2
// Checksum 0xd9770d87, Offset: 0xb0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_trial_board_everything", &__init__, undefined, undefined);
}

// Namespace zm_trial_board_everything/zm_trial_board_everything
// Params 0, eflags: 0x0
// Checksum 0x515dc094, Offset: 0xf8
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"board_everything", &on_begin, &on_end);
}

// Namespace zm_trial_board_everything/zm_trial_board_everything
// Params 0, eflags: 0x4
// Checksum 0x38e136f4, Offset: 0x160
// Size: 0x34
function private on_begin() {
    zm_powerups::function_74b8ec6b("carpenter");
    level thread function_4172344e();
}

// Namespace zm_trial_board_everything/zm_trial_board_everything
// Params 1, eflags: 0x4
// Checksum 0xfd858bda, Offset: 0x1a0
// Size: 0x8c
function private on_end(round_reset) {
    if (!round_reset && level.var_3de460b1 < level.var_70135c38) {
        zm_trial::fail(#"hash_e0fa688fb248886");
    }
    level.var_3de460b1 = undefined;
    level.var_70135c38 = undefined;
    zm_trial_util::function_f3dbeda7();
    zm_powerups::function_41cedb05("carpenter");
}

// Namespace zm_trial_board_everything/zm_trial_board_everything
// Params 0, eflags: 0x0
// Checksum 0xedfa5980, Offset: 0x238
// Size: 0x17a
function function_4172344e() {
    level endon(#"hash_7646638df88a3656");
    while (true) {
        level.var_70135c38 = level.exterior_goals.size;
        level.var_3de460b1 = 0;
        foreach (s_barrier in level.exterior_goals) {
            if (zm_utility::all_chunks_intact(s_barrier, s_barrier.barrier_chunks) || zm_utility::no_valid_repairable_boards(s_barrier, s_barrier.barrier_chunks)) {
                level.var_3de460b1++;
            }
        }
        zm_trial_util::function_2976fa44(level.var_70135c38);
        zm_trial_util::function_dace284(level.var_3de460b1, 1);
        s_waitresult = level waittill(#"zombie_board_tear", #"board_repaired", #"carpenter_finished");
    }
}

