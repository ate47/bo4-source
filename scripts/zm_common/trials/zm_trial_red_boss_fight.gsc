#using scripts\zm\zm_red_fasttravel;
#using scripts\zm\zm_red_boss_battle;
#using scripts\zm_common\zm_trial;
#using scripts\zm_common\zm_aoe;
#using scripts\core_common\lui_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;

#namespace zm_trial_red_boss_fight;

// Namespace zm_trial_red_boss_fight/zm_trial_red_boss_fight
// Params 0, eflags: 0x2
// Checksum 0xef1e7bbf, Offset: 0xd8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_trial_red_boss_fight", &__init__, undefined, undefined);
}

// Namespace zm_trial_red_boss_fight/zm_trial_red_boss_fight
// Params 0, eflags: 0x1 linked
// Checksum 0xa1b3ec4b, Offset: 0x120
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"red_boss_fight", &on_begin, &on_end);
}

// Namespace zm_trial_red_boss_fight/zm_trial_red_boss_fight
// Params 0, eflags: 0x5 linked
// Checksum 0xd5ac9f1f, Offset: 0x188
// Size: 0x3c
function private on_begin() {
    if (!isdefined(level.var_27a02034)) {
        level.var_27a02034 = 0;
    }
    level thread start_boss_fight();
}

// Namespace zm_trial_red_boss_fight/zm_trial_red_boss_fight
// Params 1, eflags: 0x5 linked
// Checksum 0xde95d40f, Offset: 0x1d0
// Size: 0x9c
function private on_end(round_reset) {
    if (round_reset) {
        level.var_27a02034 = 1;
        zm_aoe::function_3690781e();
    } else {
        level.check_for_valid_spawn_near_team_callback = level.var_5b175281;
        level.var_5b175281 = undefined;
    }
    level flag::clear(#"infinite_round_spawning");
    level flag::clear(#"pause_round_timeout");
}

// Namespace zm_trial_red_boss_fight/zm_trial_red_boss_fight
// Params 0, eflags: 0x5 linked
// Checksum 0x2c924659, Offset: 0x278
// Size: 0x1f0
function private start_boss_fight() {
    level endon(#"end_game", #"hash_7646638df88a3656");
    /#
        level flag::set("<dev string:x38>");
        level flag::set(#"pap_quest_completed");
        level flag::set(#"zm_red_fasttravel_open");
    #/
    level.var_5b175281 = level.check_for_valid_spawn_near_team_callback;
    level.check_for_valid_spawn_near_team_callback = &function_7d23aaf2;
    if (level.var_27a02034) {
        red_boss_battle::function_dfaf17c8();
        level thread red_boss_battle::function_3a2efd4e(0, 0, 0);
    } else {
        wait 12;
        level lui::screen_fade_out(1);
        level thread red_boss_battle::function_3a2efd4e(0, 0, 1);
        wait 0.5;
        level thread lui::screen_fade_in(1);
    }
    level flag::wait_till(#"boss_battle_complete");
    level flag::clear(#"infinite_round_spawning");
    level flag::clear(#"pause_round_timeout");
    level.zombie_total = 0;
    wait 5;
    level notify(#"kill_round_wait");
}

// Namespace zm_trial_red_boss_fight/zm_trial_red_boss_fight
// Params 2, eflags: 0x1 linked
// Checksum 0x83b01a1d, Offset: 0x470
// Size: 0x60
function function_7d23aaf2(player, var_feed7374) {
    var_62b2df56 = struct::get_array("s_boss_arena_teleport");
    n_ent_num = player getentitynumber();
    return var_62b2df56[n_ent_num];
}

