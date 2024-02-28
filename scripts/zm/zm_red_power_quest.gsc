// Atian COD Tools GSC decompiler test
#using scripts\zm\zm_red_util.gsc;
#using scripts\zm\zm_red.gsc;
#using scripts\zm\perk\zm_perk_electric_cherry.gsc;
#using script_4d00889cf8c807d5;
#using scripts\zm_common\bgbs\zm_bgb_anywhere_but_here.gsc;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm_common\zm_utility_zstandard.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\zm_common\zm_transformation.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_round_spawning.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_customgame.gsc;
#using scripts\zm_common\zm_cleanup_mgr.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\core_common\ai\zombie_death.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\ai\systems\gib.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace zm_red_power_quest;

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xf9119396, Offset: 0x8d8
// Size: 0x5f4
function init() {
    clientfield::register("actor", "" + #"zombie_breakout", 16000, 1, "counter");
    clientfield::register("actor", "" + #"zombie_delete", 16000, 1, "counter");
    clientfield::register("actor", "" + #"hash_6d5686b05e69fcb0", 16000, 1, "counter");
    clientfield::register("actor", "" + #"pegasus_beam", 16000, 2, "int");
    if (!zm_utility::is_trials()) {
        clientfield::register("scriptmover", "" + #"hash_440ca00839d907a8", -17000, 1, "int");
    }
    clientfield::register("scriptmover", "" + #"hash_2a586a321116326c", 16000, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_3ec0452110ea5621", 16000, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_5da65e20d966c63f", 16000, 1, "counter");
    clientfield::register("scriptmover", "" + #"artifact_glow", 16000, 1, "int");
    clientfield::register("scriptmover", "" + #"perseus_teleport", 16000, 1, "counter");
    clientfield::register("scriptmover", "" + #"pegasus_teleport", 16000, 1, "int");
    clientfield::register("scriptmover", "" + #"pegasus_ambient", 16000, 1, "int");
    clientfield::register("vehicle", "" + #"hash_5da65e20d966c63f", 16000, 1, "counter");
    clientfield::register("vehicle", "" + #"hash_463ff879b8d656bb", 16000, 1, "int");
    clientfield::register("vehicle", "" + #"perseus_energy", 16000, 1, "int");
    clientfield::register("world", "" + #"amphi_blood", 16000, 1, "int");
    level.var_2f2b78fb = spawnstruct();
    level.var_5cc61d5f = 0;
    level.var_19819980 = 0;
    array::run_all(getentarray("event_ground_before", "targetname"), &connectpaths);
    array::run_all(getentarray("mdl_power_quest_aftermath_2", "targetname"), &notsolid);
    array::run_all(getentarray("mdl_power_quest_aftermath_2", "targetname"), &hide);
    array::run_all(getentarray("mdl_power_quest_aftermath", "targetname"), &notsolid);
    array::run_all(getentarray("mdl_power_quest_aftermath", "targetname"), &hide);
    level.var_b0ccfa4c = array("c_t8_zmb_dlc2_zombie_male_body4_skin2_fb", "c_t8_zmb_dlc2_zombie_male_body3_skin2_fb", "c_t8_zmb_dlc2_zombie_male_body4_fb", "c_t8_zmb_dlc2_zombie_male_body1_skin2_fb", "c_t8_zmb_dlc2_zombie_male_body3_fb", "c_t8_zmb_dlc2_zombie_female_body3_skin2_fb", "c_t8_zmb_dlc2_zombie_female_body1_fb", "c_t8_zmb_dlc2_zombie_female_body2_skin2_fb");
    level thread function_bda82828();
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x92fc15bb, Offset: 0xed8
// Size: 0xd76
function function_bda82828() {
    level endon(#"end_game", #"hash_420b070435236eab");
    level flag::wait_till("all_players_spawned");
    if (zm_custom::function_901b751c(#"zmpowerstate") == 2) {
        hide_skeletons();
        function_e059d0e1();
        return;
    } else if (zm_custom::function_901b751c(#"zmpowerstate") == 0 || zm_custom::function_901b751c("zmMinibossState") == 2 || zm_custom::function_901b751c("zmEnhancedState") == 2) {
        hide_skeletons();
        callback::remove_on_connect(&function_8efba1b4);
        var_3e910f73 = getent("mdl_power_bullet", "targetname");
        if (isdefined(var_3e910f73)) {
            var_3e910f73 delete();
        }
        mdl_blocker = getent("mdl_power_blocker", "targetname");
        if (isdefined(mdl_blocker)) {
            mdl_blocker delete();
        }
        exploder::stop_exploder("Fxexp_barrier_amph");
        return;
    }
    if (zm_utility::is_standard()) {
        function_77dd379a();
        return;
    }
    var_71da3f5a = getentarray("mdl_power_skeleton", "targetname");
    foreach (mdl_skel in var_71da3f5a) {
        mdl_clip = getent(mdl_skel.target, "targetname");
        mdl_clip notsolid();
    }
    callback::on_connect(&function_8efba1b4);
    array::thread_all(getplayers(), &function_8efba1b4);
    var_3e910f73 = getent("mdl_power_bullet", "targetname");
    var_3e910f73.origin = var_3e910f73.origin + (0, 0, 2048);
    var_3e910f73 thread zm_red_util::barrier_impact();
    var_4ec3364d = getent("perseus_amphitheater_clip", "targetname");
    var_4ec3364d notsolid();
    level clientfield::set("" + #"amphi_blood", 1);
    a_n_sections = [];
    level.var_2f2b78fb.var_9400690b = [];
    level.var_2f2b78fb.var_5bf6d1df = 0;
    level.var_9400690b = [];
    a_s_audience = struct::get_array(#"hash_76796d914e70fc43");
    foreach (s_audience in a_s_audience) {
        var_b6b01674 = s_audience function_e9f93d33();
        var_b6b01674 thread function_aab4eb23();
        level.var_9400690b[level.var_9400690b.size] = var_b6b01674;
    }
    level.var_26450f62 = [];
    a_s_chaos = struct::get_array(#"hash_2cb6fcd3ae46aec0");
    foreach (s_audience in a_s_chaos) {
        var_b6b01674 = s_audience function_ba40fcf4();
        var_b6b01674 thread function_aab4eb23();
        level.var_26450f62[level.var_26450f62.size] = var_b6b01674;
    }
    callback::on_ai_killed(&function_75c83fbf);
    level flag::wait_till("begin_spawning");
    level.var_ffb89532 = level.zones[#"zone_amphitheater_house"].a_loc_types[#"zombie_location"];
    level.zones[#"zone_amphitheater_house"].a_loc_types[#"zombie_location"] = [];
    mdl_sentinel_artifact = getent("mdl_sentinel_artifact", "targetname");
    mdl_sentinel_artifact clientfield::set("" + #"artifact_glow", 1);
    mdl_sentinel_artifact playloopsound(#"hash_5c7e9911ac98f633");
    s_loc = struct::get(#"hash_3dbe0b62fa014608");
    s_loc zm_unitrigger::create(&function_969cb6b2);
    s_loc thread function_b3d827f();
    level thread function_3ff7750a();
    level flag::wait_till(#"hash_dc34ebe02d09532");
    level thread function_95d6655b();
    level thread function_be9bce83();
    level flag::set(#"hash_70efff113b745513");
    if (zm_utility::is_trials()) {
        level.check_for_valid_spawn_near_team_callback = &function_d1435bda;
    }
    zm_unitrigger::unregister_unitrigger(s_loc.s_unitrigger);
    s_loc.s_unitrigger = undefined;
    s_loc struct::delete();
    zm_powerups::function_74b8ec6b(#"nuke");
    var_3e910f73.origin = var_3e910f73.origin - (0, 0, 2048);
    var_4ec3364d solid();
    var_4ec3364d thread zm_red_util::barrier_impact();
    exploder::exploder("Fxexp_barrier_amph");
    if (function_71ac80d2()) {
        level zm_utility::function_fdb0368(2, #"round_one");
        level flag::set("pause_round_timeout");
        level flag::set("hold_round_end");
        wait(0.1);
        foreach (ai in getaiteamarray(level.zombie_team)) {
            if (isdefined(ai)) {
                ai thread despawn_zombie();
            }
        }
        level flag::wait_till("spawn_zombies");
        level flag::clear("spawn_zombies");
    } else {
        level thread function_63102269();
    }
    level thread perseus_amphitheater();
    level flag::wait_till(#"perseus_exits");
    level thread function_d8db57f6();
    level flag::wait_till(#"spartoi_dead");
    wait(4);
    zm_trial::function_ae725d63();
    level thread function_aa54541d();
    level thread function_30da273d();
    level thread function_a5b8e88f();
    level flag::wait_till(#"pegasus_rescue");
    wait(1);
    function_e059d0e1();
    level flag::clear(#"hash_70efff113b745513");
    wait(4);
    if (zm_utility::is_trials()) {
        level.check_for_valid_spawn_near_team_callback = undefined;
    }
    level flag::set("spawn_zombies");
    level flag::clear("pause_round_timeout");
    level flag::clear("hold_round_end");
    function_350204ca(#"hash_4c0b3f3f8e394cbc");
    wait(1);
    foreach (player in util::get_active_players()) {
        player thread zm_vo::vo_say(#"hash_33e1e5be84d42bba", 0, 1, 9999, 1, 1, 1);
    }
    vol_amphitheater = getent("vol_power_quest_kill_zone", "targetname");
    if (isdefined(vol_amphitheater)) {
        vol_amphitheater delete();
    }
    level.zones[#"zone_amphitheater_house"].a_loc_types[#"zombie_location"] = level.var_ffb89532;
    level.zones[#"zone_amphitheater"].is_spawning_allowed = 1;
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 2, eflags: 0x5 linked
// Checksum 0xf07102ac, Offset: 0x1c58
// Size: 0x60
function private function_d1435bda(player, var_feed7374) {
    var_1de1f14d = struct::get_array("s_trials_power_quest_player_spawns");
    n_ent_num = player getentitynumber();
    return var_1de1f14d[n_ent_num];
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x58a01871, Offset: 0x1cc0
// Size: 0xe8
function hide_skeletons() {
    var_71da3f5a = getentarray("mdl_power_skeleton", "targetname");
    foreach (mdl_skel in var_71da3f5a) {
        mdl_skel ghost();
        mdl_clip = getent(mdl_skel.target, "targetname");
        mdl_clip delete();
    }
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x81fad292, Offset: 0x1db0
// Size: 0x5f4
function function_77dd379a() {
    level endon(#"end_game");
    var_71da3f5a = getentarray("mdl_power_skeleton", "targetname");
    foreach (mdl_skel in var_71da3f5a) {
        mdl_skel ghost();
        mdl_clip = getent(mdl_skel.target, "targetname");
        mdl_clip ghost();
    }
    var_3cd87194 = getentarray("mdl_power_blocker_glyph", "targetname");
    foreach (var_6eb21a54 in var_3cd87194) {
        var_6eb21a54 hide();
    }
    var_3e910f73 = getent("mdl_power_bullet", "targetname");
    var_3e910f73.origin = var_3e910f73.origin + (0, 0, 2048);
    mdl_blocker = getent("mdl_power_blocker", "targetname");
    mdl_blocker delete();
    hide_skeletons();
    level.var_2f2b78fb.var_9400690b = [];
    level.var_2f2b78fb.var_5bf6d1df = 0;
    level.var_9400690b = [];
    a_s_audience = struct::get_array(#"hash_76796d914e70fc43");
    foreach (s_audience in a_s_audience) {
        var_b6b01674 = s_audience function_e9f93d33();
        level.var_9400690b[level.var_9400690b.size] = var_b6b01674;
    }
    level.var_26450f62 = [];
    a_s_chaos = struct::get_array(#"hash_2cb6fcd3ae46aec0");
    foreach (s_audience in a_s_chaos) {
        var_b6b01674 = s_audience function_ba40fcf4();
        level.var_26450f62[level.var_26450f62.size] = var_b6b01674;
    }
    level waittill(#"hash_20632257a91d251a");
    wait(25);
    zm_powerups::function_74b8ec6b(#"nuke");
    level.var_2f2b78fb.var_5579012f = 80;
    level.var_2f2b78fb.var_30c1e68b = 25;
    level thread function_ee7ebb1a();
    level waittill(#"hash_7a04a7fb98fa4e4d");
    wait(0.75);
    level flag::clear("spawn_zombies");
    level thread lui::screen_flash(0.2, 1, 0.5, 1, "white");
    wait(0.2);
    level.var_9400690b = array::remove_undefined(level.var_9400690b);
    foreach (var_b6b01674 in level.var_9400690b) {
        if (isdefined(var_b6b01674.mdl_chaos)) {
            var_b6b01674.mdl_chaos delete();
        }
        var_b6b01674 delete();
    }
    function_e059d0e1();
    level flag::set("spawn_zombies");
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x67eabc9f, Offset: 0x23b0
// Size: 0x180
function function_ee7ebb1a() {
    level endon(#"game_ended", #"hash_7a04a7fb98fa4e4d");
    a_mdl_zombies = array::randomize(level.var_9400690b);
    foreach (mdl_zombie in a_mdl_zombies) {
        if (isdefined(mdl_zombie) && !(isdefined(level.var_a286b947) && level.var_a286b947)) {
            function_3c2c7054();
            while (getaiteamarray("axis").size >= 25) {
                wait(0.1);
            }
            mdl_zombie thread zm_red::function_a4e2970b(1);
            level.var_19819980++;
            wait(randomfloatrange(2 / getplayers().size, 5 / getplayers().size));
        }
    }
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x34698f3, Offset: 0x2538
// Size: 0xd4
function function_3ff7750a() {
    level endon(#"hash_70efff113b745513");
    while (1) {
        var_a5e3ee12 = trigger::wait_till("trigger_amph_entrance");
        if (isplayer(var_a5e3ee12.who)) {
            player = var_a5e3ee12.who;
            break;
        }
    }
    if (!level flag::get(#"hash_6c92a415bd4bb739")) {
        player zm_vo::function_a2bd5a0c(#"hash_5f91baafb561a09d", 0, 1, 9999, 1);
    }
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x439d240a, Offset: 0x2618
// Size: 0x84
function despawn_zombie() {
    self endon(#"death");
    self clientfield::increment("" + #"zombie_delete");
    self thread ai::stun();
    wait(1);
    if (isdefined(self)) {
        self thread zm_red_util::cleanup_zombie();
    }
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x9c4c130f, Offset: 0x26a8
// Size: 0xd24
function function_e059d0e1() {
    hidemiscmodels("event_stands_zombies");
    level clientfield::set("" + #"amphi_blood", 0);
    exploder::exploder("exp_lgt_power_event");
    array::run_all(getentarray("event_ground_before", "targetname"), &delete);
    array::run_all(getentarray("mdl_power_quest_aftermath_2", "targetname"), &solid);
    array::run_all(getentarray("mdl_power_quest_aftermath_2", "targetname"), &show);
    array::run_all(getentarray("mdl_power_quest_aftermath_2", "targetname"), &connectpaths);
    a_mdl_statues = getentarray("mdl_power_holder", "targetname");
    mdl_clip = getent("mdl_power_holder_clip", "targetname");
    if (isdefined(a_mdl_statues)) {
        array::delete_all(a_mdl_statues);
    }
    if (isdefined(mdl_clip)) {
        mdl_clip delete();
    }
    mdl_sentinel_artifact = getent("mdl_sentinel_artifact", "targetname");
    if (isdefined(mdl_sentinel_artifact)) {
        mdl_sentinel_artifact clientfield::set("" + #"hash_2a586a321116326c", 1);
        mdl_sentinel_artifact playloopsound(#"hash_e2c71c7dece38ee");
    }
    var_a6c6bf68 = getentarray("event_collision_move", "targetname");
    a_s_nudge = struct::get_array(#"hash_5bc8479768b4a60e");
    if (isdefined(var_a6c6bf68) && isdefined(a_s_nudge)) {
        foreach (vol in var_a6c6bf68) {
            foreach (player in getplayers()) {
                if (player istouching(vol) && !(isdefined(player.var_e17ca454) && player.var_e17ca454)) {
                    player.var_e17ca454 = 1;
                    s_nudge = arraygetclosest(player.origin, a_s_nudge);
                    arrayremovevalue(a_s_nudge, s_nudge);
                    player setorigin(s_nudge.origin);
                }
            }
        }
    }
    if (isdefined(a_s_nudge)) {
        foreach (s_nudge in a_s_nudge) {
            if (isdefined(s_nudge)) {
                s_nudge struct::delete();
            }
        }
    }
    if (isdefined(var_a6c6bf68)) {
        foreach (ai_zombie in getaiteamarray(level.zombie_team)) {
            foreach (vol in var_a6c6bf68) {
                if (ai_zombie istouching(vol) && !zm_utility::is_magic_bullet_shield_enabled(ai_zombie)) {
                    ai_zombie kill();
                }
            }
        }
        foreach (vol in var_a6c6bf68) {
            vol delete();
        }
    }
    wait(0.1);
    foreach (player in getplayers()) {
        player.var_e17ca454 = undefined;
    }
    a_mdl_power_quest_aftermath = getentarray("mdl_power_quest_aftermath", "targetname");
    foreach (mdl_power_quest_aftermath in a_mdl_power_quest_aftermath) {
        if (isdefined(mdl_power_quest_aftermath) && !(isdefined(mdl_power_quest_aftermath.is_in_place) && mdl_power_quest_aftermath.is_in_place)) {
            mdl_power_quest_aftermath.is_in_place = 1;
            mdl_power_quest_aftermath show();
            mdl_power_quest_aftermath solid();
            mdl_power_quest_aftermath disconnectpaths();
        }
    }
    zm_powerups::function_41cedb05(#"nuke");
    wait(3);
    vol_no_powerups = getent("vol_power_quest_no_powerups", "script_noteworthy");
    if (isdefined(vol_no_powerups)) {
        if (isdefined(level.var_5fa2f970)) {
            arrayremovevalue(level.var_5fa2f970, vol_no_powerups);
        }
        vol_no_powerups delete();
    }
    if (isdefined(mdl_sentinel_artifact)) {
        s_move = struct::get(mdl_sentinel_artifact.target);
    }
    if (isdefined(s_move) && isdefined(mdl_sentinel_artifact)) {
        mdl_sentinel_artifact moveto(s_move.origin, 3);
        mdl_sentinel_artifact rotateto(s_move.angles, 3);
        mdl_sentinel_artifact playsound(#"hash_75b9c9ad6ebe8af2");
    }
    wait(2);
    level flag::set("power_on");
    if (isdefined(mdl_sentinel_artifact)) {
        mdl_sentinel_artifact clientfield::set("" + #"hash_3ec0452110ea5621", 1);
        wait(2);
        mdl_sentinel_artifact clientfield::set("" + #"hash_2a586a321116326c", 0);
        mdl_sentinel_artifact clientfield::set("" + #"hash_3ec0452110ea5621", 0);
        mdl_sentinel_artifact clientfield::increment("" + #"hash_5da65e20d966c63f");
        wait(1);
        mdl_sentinel_artifact playsound(#"hash_5de064f33e9e49b8");
        v_origin = mdl_sentinel_artifact.origin;
        level thread function_ae259e17(v_origin);
        if (!level flag::get(#"hash_420b070435236eab")) {
            mdl_sentinel_artifact delete();
        } else {
            mdl_sentinel_artifact hide();
        }
    }
    if (isdefined(s_move)) {
        s_move struct::delete();
    }
    playsoundatposition(#"hash_3d8fef5997663b17", (0, 0, 0));
    s_reward = struct::get(#"hash_3b2d60a79515031a");
    if (isdefined(s_reward)) {
        v_origin = s_reward.origin;
        s_reward struct::delete();
        level thread zm_powerups::specific_powerup_drop("full_ammo", v_origin, undefined, undefined, undefined, 0, 1);
    }
    callback::remove_on_connect(&function_8efba1b4);
    var_3e910f73 = getent("mdl_power_bullet", "targetname");
    if (isdefined(var_3e910f73)) {
        var_3e910f73 delete();
    }
    mdl_blocker = getent("mdl_power_blocker", "targetname");
    if (isdefined(mdl_blocker)) {
        mdl_blocker delete();
    }
    exploder::stop_exploder("Fxexp_barrier_amph");
    s_center = struct::get(#"hash_4ede0d513d23996b");
    if (isdefined(s_center)) {
        s_center struct::delete();
    }
    level flag::clear(#"hash_dc34ebe02d09532");
    if (isdefined(level.var_2f2b78fb)) {
        level.var_2f2b78fb struct::delete();
    }
    level flag::set(#"hash_3dba794053dea40e");
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xd0b41a7d, Offset: 0x33d8
// Size: 0x154
function function_95d6655b() {
    level endon(#"hash_4d8091aa6a26d815");
    var_168ccd6b = getent("vol_power_quest_kill_zone", "targetname");
    level.zones[#"zone_amphitheater"].is_spawning_allowed = 0;
    wait(2);
    while (1) {
        foreach (ai_zombie in getaiteamarray(level.zombie_team)) {
            if (!(isdefined(ai_zombie.var_ae4569d5) && ai_zombie.var_ae4569d5) && ai_zombie istouching(var_168ccd6b) && isdefined(ai_zombie)) {
                ai_zombie thread despawn_zombie();
            }
        }
        wait(0.1);
    }
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x2191a8d3, Offset: 0x3538
// Size: 0x314
function function_be9bce83() {
    level flag::wait_till(#"hash_dc34ebe02d09532");
    var_1679e8e = function_22230e37();
    foreach (ai_zombie in getaiteamarray(level.zombie_team)) {
        foreach (player in var_1679e8e) {
            if (isdefined(player.var_fd141207) && player.var_fd141207) {
                ai_zombie setignoreent(player, 1);
            }
        }
    }
    callback::on_ai_spawned(&function_1b3428bf);
    level flag::wait_till(#"hash_3dba794053dea40e");
    callback::remove_on_ai_spawned(&function_1b3428bf);
    foreach (player in getplayers()) {
        player.var_fd141207 = undefined;
    }
    wait(0.5);
    foreach (ai_zombie in getaiteamarray(level.zombie_team)) {
        foreach (player in getplayers()) {
            ai_zombie setignoreent(player, 0);
        }
    }
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xa746c7d9, Offset: 0x3858
// Size: 0xd8
function function_1b3428bf() {
    self endon(#"death");
    if (isdefined(self.var_ae4569d5) && self.var_ae4569d5) {
        return;
    }
    foreach (player in getplayers()) {
        if (isdefined(player.var_fd141207) && player.var_fd141207) {
            self setignoreent(player, 1);
        }
    }
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xf7242fa7, Offset: 0x3938
// Size: 0x6a
function function_71ac80d2() {
    var_1679e8e = function_22230e37();
    var_f64e8455 = getplayers();
    if (isdefined(var_1679e8e) && isdefined(var_f64e8455)) {
        if (var_1679e8e.size === var_f64e8455.size) {
            return 1;
        }
    }
    return 0;
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x663e23e3, Offset: 0x39b0
// Size: 0x14c
function function_63102269() {
    level endon(#"hash_4d8091aa6a26d815");
    while (1) {
        var_1679e8e = function_22230e37();
        var_f64e8455 = getplayers();
        if (isdefined(var_1679e8e) && isdefined(var_f64e8455)) {
            if (var_1679e8e.size === var_f64e8455.size) {
                level zm_utility::function_fdb0368(2, #"round_one");
                level flag::set("pause_round_timeout");
                level flag::set("hold_round_end");
                function_a7bdf314();
                level flag::wait_till("spawn_zombies");
                level flag::clear("spawn_zombies");
                break;
            }
        }
        wait(0.5);
    }
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xe797ebe0, Offset: 0x3b08
// Size: 0x25e
function function_a7bdf314() {
    foreach (ai in getaiteamarray(level.zombie_team)) {
        if (isalive(ai) && !(isdefined(ai.var_d45ca662) && ai.var_d45ca662) && !(isdefined(ai.marked_for_death) && ai.marked_for_death) && !(isdefined(ai.var_ae4569d5) && ai.var_ae4569d5)) {
            if (ai.var_6f84b820 === #"basic" || ai.var_6f84b820 === #"popcorn") {
                if (zm_utility::is_magic_bullet_shield_enabled(ai)) {
                    ai util::stop_magic_bullet_shield();
                }
                ai.allowdeath = 1;
                ai.no_powerups = 1;
                ai.deathpoints_already_given = 1;
                ai.marked_for_death = 1;
                ai clientfield::increment("" + #"zombie_delete");
                wait(0.1);
                if (isdefined(ai)) {
                    ai thread despawn_zombie();
                }
            } else {
                ai clientfield::increment("" + #"zombie_delete");
                wait(0.1);
                if (isdefined(ai)) {
                    ai thread despawn_zombie();
                }
            }
        }
        waitframe(1);
    }
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x2b635ad9, Offset: 0x3d70
// Size: 0x2dc
function perseus_amphitheater() {
    s_scene = struct::get("tag_align_red_amphitheatre");
    mdl_perseus = getent("perseus_amphitheater", "targetname");
    mdl_perseus hide();
    s_scene thread scene::play(#"aib_vign_cust_zm_red_amp_perseus_intro", mdl_perseus);
    wait(0.1);
    mdl_perseus show();
    level.musicsystemoverride = 1;
    music::setmusicstate("poweron_event_start");
    waitframe(1);
    mdl_perseus clientfield::increment("" + #"perseus_teleport");
    wait(1.5);
    mdl_perseus playsound(#"hash_7e17c0850b86d621");
    mdl_perseus playloopsound(#"hash_4572307d016259a6");
    exploder::exploder("Fxexp_barrier_amph_perseus");
    level waittill(#"summon");
    for (i = 0; i < 3; i++) {
        vh_trail = spawner::simple_spawn_single("perseus_trail");
        if (isdefined(vh_trail)) {
            vh_trail thread function_a8f1dc6b(getvehiclenode("perseus_trail_" + i, "targetname"));
        }
        wait(0.1);
    }
    wait(2.5);
    level flag::set(#"perseus_exits");
    mdl_perseus stoploopsound();
    mdl_perseus playsound(#"hash_4917791296076e1d");
    wait(4);
    exploder::stop_exploder("Fxexp_barrier_amph_perseus");
    var_4ec3364d = getent("perseus_amphitheater_clip", "targetname");
    if (isdefined(var_4ec3364d)) {
        var_4ec3364d delete();
    }
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x52073228, Offset: 0x4058
// Size: 0xc4
function function_a8f1dc6b(nd_start) {
    self endon(#"death");
    self clientfield::set("" + #"perseus_energy", 1);
    self vehicle::get_on_and_go_path(nd_start);
    self clientfield::set("" + #"perseus_energy", 0);
    self playsound(#"hash_7c51534a91103a32");
    self delete();
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x1935efd2, Offset: 0x4128
// Size: 0x198
function function_e9f93d33() {
    str_model = level.var_b0ccfa4c[randomint(level.var_b0ccfa4c.size)];
    mdl_zombie = util::spawn_model(str_model, self.origin, self.angles);
    mdl_zombie.target = self.target;
    mdl_zombie.var_e259ad71 = self.var_e259ad71;
    mdl_zombie.mdl_chaos = array::get_all_closest(mdl_zombie.origin, getentarray("chaos_crust", "targetname"))[0];
    mdl_zombie.sp_model = getent(str_model, "targetname");
    if (isdefined(mdl_zombie.mdl_chaos)) {
        mdl_zombie.mdl_chaos setscale(0.8);
    }
    mdl_zombie.str_scene = function_efcd5d38();
    wait(0.1);
    if (isdefined(mdl_zombie.str_scene)) {
        mdl_zombie thread scene::play(mdl_zombie.str_scene, "init", mdl_zombie);
    }
    return mdl_zombie;
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xe21b29a0, Offset: 0x42c8
// Size: 0x180
function function_ba40fcf4() {
    str_model = level.var_b0ccfa4c[randomint(level.var_b0ccfa4c.size)];
    mdl_zombie = util::spawn_model(str_model, self.origin, self.angles);
    mdl_zombie.target = self.target;
    mdl_zombie.mdl_chaos = array::get_all_closest(mdl_zombie.origin, getentarray("chaos_crust", "targetname"))[0];
    mdl_zombie.sp_model = getent(str_model, "targetname");
    if (isdefined(mdl_zombie.mdl_chaos)) {
        mdl_zombie.mdl_chaos setscale(0.8);
    }
    mdl_zombie.str_scene = function_efcd5d38();
    wait(0.1);
    if (isdefined(mdl_zombie.str_scene)) {
        mdl_zombie thread scene::play(mdl_zombie.str_scene, "init", mdl_zombie);
    }
    return mdl_zombie;
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xbf34490d, Offset: 0x4450
// Size: 0x7a
function function_efcd5d38() {
    a_str_scenes = [];
    for (i = 1; i < 10; i++) {
        a_str_scenes[a_str_scenes.size] = "aib_vign_cust_zm_red_amp_zmb_brk_out_0" + i;
    }
    a_str_scenes[a_str_scenes.size] = "aib_vign_cust_zm_red_amp_zmb_brk_out_10";
    return array::random(a_str_scenes);
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x4e5dd873, Offset: 0x44d8
// Size: 0x14c
function function_aab4eb23() {
    level endon(#"hash_dc34ebe02d09532");
    self endon(#"death");
    self val::set(#"dormant_takedamage", "takedamage", 1);
    self.health = 99999999;
    while (1) {
        s_waitresult = undefined;
        s_waitresult = self waittill(#"damage");
        e_attacker = s_waitresult.attacker;
        if (isplayer(e_attacker) && zm_utility::is_player_valid(e_attacker, 0, 0, 0)) {
            var_168ccd6b = getent("vol_power_quest_kill_zone", "targetname");
            if (e_attacker istouching(var_168ccd6b)) {
                break;
            }
        }
    }
    level flag::set(#"hash_dc34ebe02d09532");
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x9d087a09, Offset: 0x4630
// Size: 0x19c
function function_b3d827f() {
    level endon(#"end_game", #"hash_dc34ebe02d09532");
    s_result = undefined;
    s_result = self waittill(#"trigger_activated");
    e_player = s_result.e_who;
    if (zm_utility::is_player_valid(e_player)) {
        level flag::set(#"hash_6c92a415bd4bb739");
        mdl_sentinel_artifact = getent("mdl_sentinel_artifact", "targetname");
        mdl_sentinel_artifact clientfield::set("" + #"artifact_glow", 0);
        mdl_sentinel_artifact stoploopsound();
        mdl_sentinel_artifact playsound(#"hash_331b62b49768f70");
        if (e_player zm_audio::can_speak()) {
            e_player thread zm_vo::function_a2bd5a0c(#"hash_497fcbdaee283347", 0.5, 1, 10000, 0);
        }
    }
    level flag::set(#"hash_dc34ebe02d09532");
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x34590242, Offset: 0x47d8
// Size: 0x1ea
function function_969cb6b2(e_player) {
    mdl_sentinel_artifact = getent("mdl_sentinel_artifact", "targetname");
    if (isdefined(mdl_sentinel_artifact)) {
        var_39b20ef6 = e_player zm_utility::is_player_looking_at(mdl_sentinel_artifact.origin + (0, 0, -16), 0.95 + -0.15);
        b_is_valid = zm_utility::is_player_valid(e_player, 0, 0);
        b_disable = 0;
        var_3a6fab91 = zm_round_spawning::function_f6cd912d(1);
        if (isdefined(var_3a6fab91)) {
            var_f40360e8 = var_3a6fab91.n_round;
            b_disable = var_f40360e8 === level.round_number;
        }
        if (level flag::get(#"hash_6c92a415bd4bb739")) {
            b_disable = 1;
        }
        if (!b_disable && b_is_valid) {
            str_prompt = zm_utility::function_d6046228(#"hash_65fb48b6dbf04c10", #"hash_2e613e6f3511ecbc");
            self sethintstringforplayer(e_player, str_prompt);
            return 1;
        } else {
            self sethintstringforplayer(e_player, "");
            return 0;
        }
    }
    return 0;
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xe96f8538, Offset: 0x49d0
// Size: 0x1b0
function function_8efba1b4() {
    self notify("3bb67145bc189b04");
    self endon("3bb67145bc189b04");
    level endon(#"end_game", #"hash_3dba794053dea40e");
    self endon(#"disconnect");
    if (level flag::get(#"hash_3dba794053dea40e")) {
        return;
    }
    mdl_blocker = getent("mdl_power_blocker", "targetname");
    mdl_blocker endon(#"death");
    mdl_blocker setinvisibletoplayer(self);
    level flag::wait_till(#"hash_dc34ebe02d09532");
    vol_amphitheater = getent("vol_power_quest_kill_zone", "targetname");
    while (1) {
        while (!self istouching(vol_amphitheater)) {
            waitframe(1);
        }
        mdl_blocker setvisibletoplayer(self);
        while (self istouching(vol_amphitheater)) {
            waitframe(1);
        }
        mdl_blocker setinvisibletoplayer(self);
    }
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xd36bdb6d, Offset: 0x4b88
// Size: 0x170
function function_aa54541d() {
    level endon(#"end_game", #"hash_4d8091aa6a26d815");
    while (1) {
        wait(0.5);
        a_ai_zombies = level.ai[#"axis"];
        if (isdefined(a_ai_zombies) && isarray(a_ai_zombies) && a_ai_zombies.size > level.zombie_ai_limit) {
            foreach (ai_zombie in a_ai_zombies) {
                if (ai_zombie.archetype == #"zombie" && !(isdefined(ai_zombie.var_ae4569d5) && ai_zombie.var_ae4569d5) && !zm_utility::is_magic_bullet_shield_enabled(ai_zombie)) {
                    ai_zombie kill();
                    break;
                }
            }
        }
    }
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xf046557c, Offset: 0x4d00
// Size: 0x25a
function function_30da273d() {
    self notify("bf7bc278661b0a8");
    self endon("bf7bc278661b0a8");
    level endon(#"end_game", #"hash_4d8091aa6a26d815", #"hash_420b070435236eab");
    a_players = getplayers();
    if (isdefined(a_players)) {
        switch (a_players.size) {
        case 4:
            level.var_7cea7fa8 = array(2, 0.25, 0.1, 0.05);
            break;
        case 3:
            level.var_7cea7fa8 = array(2, 0.4, 0.2, 0.1);
            break;
        case 2:
            level.var_7cea7fa8 = array(2, 0.5, 0.35, 0.2);
            break;
        case 1:
            level.var_7cea7fa8 = array(2, 1.25, 0.8, 0.35);
            break;
        }
    }
    level.n_index = 0;
    while (level.var_19819980 < 4) {
        wait(1);
    }
    level.n_index = 1;
    while (level.var_19819980 < 7) {
        wait(1);
    }
    level.n_index = 2;
    while (level.var_19819980 < 10) {
        wait(1);
    }
    level.n_index = 3;
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xbe8f2f7c, Offset: 0x4f68
// Size: 0x464
function function_a5b8e88f(var_ddab7294 = 0) {
    self notify("392ebc6b9cec5b9");
    self endon("392ebc6b9cec5b9");
    level endon(#"end_game", #"hash_420b070435236eab");
    level.var_ac6d10d4 = 1;
    level.var_2f2b78fb.var_5579012f = 80;
    level.var_2f2b78fb.var_30c1e68b = 25;
    a_mdl_zombies = array::randomize(level.var_9400690b);
    if (var_ddab7294) {
        level.var_19819980 = 0;
        level thread function_30da273d();
        level waittilltimeout(8, #"hash_2f976f64c9301e7f");
        foreach (mdl_zombie in a_mdl_zombies) {
            mdl_zombie show();
            mdl_zombie.var_a7cbb3cb = undefined;
            if (isdefined(mdl_zombie.mdl_chaos)) {
                mdl_zombie.mdl_chaos show();
            }
        }
        zm_trial::function_ae725d63();
    }
    foreach (mdl_zombie in a_mdl_zombies) {
        if (zm_utility::is_trials() && level flag::get("round_reset")) {
            return;
        }
        if (isdefined(mdl_zombie)) {
            function_3c2c7054();
            while (getaiteamarray("axis").size >= 32) {
                wait(0.1);
            }
            mdl_zombie thread zm_red::function_a4e2970b(1);
            level.var_19819980++;
            wait(level.var_7cea7fa8[level.n_index]);
        }
    }
    function_350204ca(#"hash_4f27038870dd43b0");
    wait(6);
    level.var_ac6d10d4 = undefined;
    zm_trial::function_ae725d63();
    level thread function_1e9b5c67();
    level thread pegasus_intro();
    level thread function_56c68db();
    level flag::wait_till(#"pegasus_rescue");
    wait(0.5);
    level function_9ead836c();
    foreach (mdl_zombie in level.var_26450f62) {
        if (isdefined(mdl_zombie)) {
            mdl_zombie delete();
        }
    }
    wait(1);
    level flag::set(#"hash_4d8091aa6a26d815");
    level flag::set(#"flag_skeleton_set_intro");
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 0, eflags: 0x5 linked
// Checksum 0x9004f88b, Offset: 0x53d8
// Size: 0x296
function private function_9ead836c() {
    var_4b9821e4 = 0;
    level thread lui::screen_flash(1, 1, 0.5, 1, "white");
    a_ai_zombies = getaiteamarray(level.zombie_team);
    foreach (ai in a_ai_zombies) {
        if (isalive(ai) && isdefined(ai.var_ae4569d5) && ai.var_ae4569d5 && !(isdefined(ai.var_d45ca662) && ai.var_d45ca662) && !(isdefined(ai.marked_for_death) && ai.marked_for_death)) {
            if (zm_utility::is_magic_bullet_shield_enabled(ai)) {
                ai util::stop_magic_bullet_shield();
            }
            ai.allowdeath = 1;
            ai.no_powerups = 1;
            ai.deathpoints_already_given = 1;
            ai.marked_for_death = 1;
            if ((ai.var_6f84b820 === #"basic" || ai.var_6f84b820 === #"enhanced") && var_4b9821e4 < 6) {
                var_4b9821e4++;
                ai thread zombie_death::flame_death_fx();
                if (!(isdefined(ai.no_gib) && ai.no_gib)) {
                    ai zombie_utility::zombie_head_gib();
                }
            }
            ai dodamage(ai.health + 666, ai.origin);
        }
        waitframe(1);
    }
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x5c5ef43d, Offset: 0x5678
// Size: 0x3a4
function pegasus_intro() {
    mdl_cloud = getent("pegasus_cloud", "targetname");
    mdl_pegasus  = util::spawn_model("c_t8_zmb_dlc2_pegasus_fb", mdl_cloud.origin + vectorscale((0, 0, -1), 285), mdl_cloud.angles);
    mdl_pegasus .linkto = util::spawn_model("tag_origin", mdl_pegasus .origin, mdl_pegasus .angles);
    scene::add_scene_func("aib_zm_red_vign_peg_inair_flapattack_01", &function_4b198b8f, "play");
    mdl_pegasus .linkto thread scene::play("aib_zm_red_vign_peg_inair_flapattack_01", "start", mdl_pegasus );
    level.mdl_pegasus  = mdl_pegasus ;
    level.mdl_pegasus  setteam(#"allies");
    wait(0.1);
    level flag::set(#"pegasus_entry");
    level.musicsystemoverride = 0;
    level thread zm_audio::sndmusicsystem_playstate("poweron_event_complete", zm_utility::is_trials());
    level thread function_350204ca(#"hash_62be5a478a16c968");
    playsoundatposition(#"hash_2642ecae6103f09b", mdl_pegasus .origin);
    mdl_pegasus  clientfield::increment("" + #"register_pegasus");
    mdl_pegasus  clientfield::set("" + #"pegasus_teleport", 1);
    level flag::set(#"pegasus_ready");
    wait(0.5);
    level thread function_c4f5840a();
    wait(8);
    level flag::set(#"pegasus_rescue");
    mdl_pegasus  playrumbleonentity("zm_red_pegasus_clear_rumble");
    playsoundatposition(#"hash_737ff3246a85fd0e", mdl_pegasus .origin);
    level flag::wait_till(#"hash_4d8091aa6a26d815");
    if (isdefined(mdl_pegasus .linkto)) {
        mdl_pegasus .linkto delete();
    }
    mdl_pegasus  pegasus_exit();
    level flag::set(#"pegasus_exited");
    if (isdefined(mdl_pegasus )) {
        mdl_pegasus  delete();
    }
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x7c9edd4, Offset: 0x5a28
// Size: 0x12c
function pegasus_exit() {
    nd_entry = getvehiclenode("pegasus_exit_start", "targetname");
    var_b56bded7 = undefined;
    while (!isdefined(var_b56bded7)) {
        var_b56bded7 = spawner::simple_spawn_single("cam_vehicle");
        waitframe(1);
    }
    var_b56bded7 setteam(#"allies");
    var_b56bded7.origin = nd_entry.origin;
    var_b56bded7.angles = nd_entry.angles;
    self linkto(var_b56bded7);
    var_b56bded7 thread scene::play("aib_zm_red_vign_peg_inair_flight_cycle_01", "loop", self);
    var_b56bded7 vehicle::get_on_and_go_path(nd_entry);
    var_b56bded7 delete();
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xb7c8449e, Offset: 0x5b60
// Size: 0x7c
function function_4b198b8f(a_ents) {
    mdl_pegasus  = a_ents[#"prop 1"];
    if (isdefined(mdl_pegasus )) {
        mdl_pegasus  setteam(#"allies");
        mdl_pegasus  thread scene::play("aib_zm_red_vign_peg_inair_flapattack_01", "loop", mdl_pegasus );
    }
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x1b4ca79e, Offset: 0x5be8
// Size: 0x224
function function_1e9b5c67() {
    mdl_cloud = getent("pegasus_cloud", "targetname");
    mdl_cloud clientfield::set("" + #"electric_storm", 1);
    mdl_cloud clientfield::increment("" + #"register_pegasus");
    wait(1);
    level flag::wait_till(#"pegasus_entry");
    wait(2);
    foreach (ai_zombie in getaiteamarray(level.zombie_team)) {
        if (isdefined(ai_zombie.var_ae4569d5) && ai_zombie.var_ae4569d5) {
            ai_zombie zombie_utility::set_zombie_run_cycle("walk");
        }
    }
    s_poi = struct::get("s_poi_amphitheater");
    s_poi zm_utility::create_zombie_point_of_interest(800, 32, 10000);
    level flag::wait_till(#"hash_4d8091aa6a26d815");
    s_poi zm_utility::deactivate_zombie_point_of_interest();
    mdl_cloud clientfield::set("" + #"electric_storm", 0);
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 1, eflags: 0x0
// Checksum 0x73319eca, Offset: 0x5e18
// Size: 0x174
function function_31a4a4d9(a_players) {
    level endon(#"pegasus_ready");
    while (1) {
        for (i = 0; i < a_players.size; i++) {
            if (zm_utility::is_player_valid(a_players[i])) {
                a_players[i].a_targets = a_players[i] function_763444ff();
                for (j = 0; j < 5; j++) {
                    if (isdefined(a_players[i]) && isdefined(a_players[i].a_targets) && isalive(a_players[i].a_targets[j])) {
                        self thread function_208a0da4(a_players[i].a_targets[j]);
                    }
                }
                wait(randomfloatrange(0.25, 0.5));
            }
        }
        wait(0.5);
    }
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xc84f52ad, Offset: 0x5f98
// Size: 0xb0
function function_c4f5840a() {
    level endon(#"pegasus_rescue");
    while (1) {
        level.mdl_pegasus  waittill(#"pegasus_clap");
        level.mdl_pegasus  function_c0e19f04();
        level.mdl_pegasus  thread function_75162692(level.var_b26291ed, 3);
        level.mdl_pegasus  thread function_75162692(level.var_bc021123, 3);
    }
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 2, eflags: 0x1 linked
// Checksum 0xa6a28efc, Offset: 0x6050
// Size: 0x8e
function function_75162692(a_ai_zombies, n_limit) {
    if (isdefined(a_ai_zombies) && a_ai_zombies.size) {
        for (i = 0; i < n_limit; i++) {
            if (isalive(a_ai_zombies[i])) {
                level.mdl_pegasus  thread function_208a0da4(a_ai_zombies[i]);
            }
        }
    }
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xdb505594, Offset: 0x60e8
// Size: 0x23e
function function_c0e19f04() {
    level.var_b26291ed = [];
    level.var_bc021123 = [];
    a_ai_zombies = getaiteamarray(level.zombie_team);
    foreach (ai_zombie in a_ai_zombies) {
        if (isalive(ai_zombie) && isdefined(ai_zombie.var_ae4569d5) && ai_zombie.var_ae4569d5 && !(isdefined(ai_zombie.var_45bfef99) && ai_zombie.var_45bfef99)) {
            n_dot = self math::get_dot_right(ai_zombie.origin);
            if (n_dot > 0) {
                if (!isdefined(level.var_b26291ed)) {
                    level.var_b26291ed = [];
                } else if (!isarray(level.var_b26291ed)) {
                    level.var_b26291ed = array(level.var_b26291ed);
                }
                level.var_b26291ed[level.var_b26291ed.size] = ai_zombie;
            } else {
                if (!isdefined(level.var_bc021123)) {
                    level.var_bc021123 = [];
                } else if (!isarray(level.var_bc021123)) {
                    level.var_bc021123 = array(level.var_bc021123);
                }
                level.var_bc021123[level.var_bc021123.size] = ai_zombie;
            }
        }
    }
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x88333e5d, Offset: 0x6330
// Size: 0x16c
function function_208a0da4(ai_zombie) {
    ai_zombie endon(#"death");
    if (isdefined(ai_zombie.aat_turned) && ai_zombie.aat_turned || isdefined(ai_zombie.var_c6aafbdb) && ai_zombie.var_c6aafbdb) {
        return;
    }
    if (isalive(ai_zombie) && !(isdefined(ai_zombie.var_45bfef99) && ai_zombie.var_45bfef99)) {
        ai_zombie.var_45bfef99 = 1;
        n_dot = self math::get_dot_right(ai_zombie.origin);
        if (n_dot > 0) {
            ai_zombie clientfield::set("" + #"pegasus_beam", 2);
        } else {
            ai_zombie clientfield::set("" + #"pegasus_beam", 1);
        }
        ai_zombie thread pegasus_victim();
    }
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x6d53a85, Offset: 0x64a8
// Size: 0x124
function pegasus_victim() {
    self endon(#"death");
    self ai::stun();
    self thread zm_perk_electric_cherry::electric_cherry_death_fx();
    self clientfield::set("tesla_shock_eyes_fx", 1);
    if (self.archetype == #"zombie") {
        bhtnactionstartevent(self, "electrocute");
    }
    wait(0.5);
    self ai::clear_stun();
    self clientfield::set("tesla_shock_eyes_fx", 0);
    if (!zm_utility::is_magic_bullet_shield_enabled(self)) {
        gibserverutils::annihilate(self);
        self kill();
    }
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xf78f5000, Offset: 0x65d8
// Size: 0x118
function function_56c68db() {
    level endon(#"pegasus_rescue");
    level flag::wait_till(#"pegasus_entry");
    a_mdl_zombies = array::randomize(level.var_26450f62);
    foreach (mdl_zombie in a_mdl_zombies) {
        if (isdefined(mdl_zombie)) {
            while (getaiteamarray("axis").size >= 32) {
                wait(0.1);
            }
            mdl_zombie thread zm_red::function_a4e2970b(1);
            wait(0.1);
        }
    }
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x608a69c0, Offset: 0x66f8
// Size: 0x192
function function_763444ff() {
    self endon(#"death");
    a_ai_zombies = array::get_all_closest(self.origin, getaispeciesarray(level.zombie_team, "all"), undefined, 4, 500);
    var_45a4e11d = [];
    foreach (ai_zombie in a_ai_zombies) {
        if (isdefined(ai_zombie.var_ae4569d5) && ai_zombie.var_ae4569d5) {
            if (!isdefined(var_45a4e11d)) {
                var_45a4e11d = [];
            } else if (!isarray(var_45a4e11d)) {
                var_45a4e11d = array(var_45a4e11d);
            }
            var_45a4e11d[var_45a4e11d.size] = ai_zombie;
        }
    }
    var_45a4e11d = array::get_all_closest(self.origin, getaispeciesarray(level.zombie_team, "all"), undefined, 4, 500);
    return var_45a4e11d;
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x3ecbfb5d, Offset: 0x6898
// Size: 0x102
function function_22230e37() {
    vol_amphitheater = getent("vol_power_quest_kill_zone", "targetname");
    a_players = getplayers();
    var_1679e8e = [];
    foreach (player in a_players) {
        if (isdefined(vol_amphitheater) && player istouching(vol_amphitheater)) {
            var_1679e8e[var_1679e8e.size] = player;
            player.var_fd141207 = 1;
        }
    }
    return var_1679e8e;
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x987ee09e, Offset: 0x69a8
// Size: 0xb6
function function_3c2c7054() {
    level endon(#"end_game");
    while (1) {
        foreach (e_player in util::get_active_players()) {
            if (zm_utility::is_player_valid(e_player, 0, 0)) {
                return;
            }
        }
        waitframe(1);
    }
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 2, eflags: 0x0
// Checksum 0xbfb5bda1, Offset: 0x6a68
// Size: 0xb2
function function_4fe65f31(n_zombies, n_timeout) {
    level endon(#"end_game");
    n_start_time = gettime();
    while (1) {
        if (getaiteamarray(level.zombie_team).size <= n_zombies) {
            return;
        } else {
            n_time_passed = float(gettime() - n_start_time) / 1000;
            if (n_time_passed >= n_timeout) {
                return;
            }
        }
        waitframe(1);
    }
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 3, eflags: 0x0
// Checksum 0xb4abe1f5, Offset: 0x6b28
// Size: 0x2e4
function function_72d7e85b(var_1c6bf395, var_29826eea, n_timeout) {
    level endon(#"end_game");
    if (!isdefined(var_1c6bf395)) {
        var_1c6bf395 = [];
    } else if (!isarray(var_1c6bf395)) {
        var_1c6bf395 = array(var_1c6bf395);
    }
    if (!isdefined(var_29826eea)) {
        var_29826eea = [];
    } else if (!isarray(var_29826eea)) {
        var_29826eea = array(var_29826eea);
    }
    foreach (n_section in var_1c6bf395) {
        level thread function_b8848794(n_section);
    }
    foreach (n_section in var_29826eea) {
        if (isinarray(level.var_2f2b78fb.var_a651e043, n_section)) {
            arrayremovevalue(var_29826eea, n_section);
        }
    }
    if (var_29826eea.size > 0) {
        n_start_time = gettime();
        while (1) {
            foreach (n_section in var_29826eea) {
                if (isinarray(level.var_2f2b78fb.var_a651e043, n_section)) {
                    arrayremovevalue(var_29826eea, n_section);
                }
            }
            n_time_passed = float(gettime() - n_start_time) / 1000;
            if (var_29826eea.size == 0 || n_time_passed >= n_timeout) {
                break;
            }
            waitframe(1);
        }
    }
    function_3c2c7054();
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 2, eflags: 0x1 linked
// Checksum 0x6710c696, Offset: 0x6e18
// Size: 0x10c
function function_b8848794(n_section, n_delay = 0.5) {
    if (!isdefined(n_section)) {
        return;
    }
    level endon(#"end_game");
    a_mdl_zombies = array::randomize(level.var_2f2b78fb.var_9400690b[n_section]);
    foreach (mdl_zombie in a_mdl_zombies) {
        if (isdefined(mdl_zombie)) {
            mdl_zombie thread zm_red::function_a4e2970b(1);
            if (n_delay > 0) {
                wait(0.5);
            }
        }
    }
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 3, eflags: 0x0
// Checksum 0x19b49cdf, Offset: 0x6f30
// Size: 0x300
function reinforcements_think(str_spawns, var_f153be86 = 0, var_a294702 = 0) {
    level endon(#"end_game", #"hash_a3780ca3fcd7d5f", #"hash_4d8091aa6a26d815");
    a_s_spawns = struct::get_array(str_spawns);
    a_s_options = array::randomize(a_s_spawns);
    while (1) {
        if (getaiteamarray(level.zombie_team).size < level.zombie_ai_limit) {
            b_spartoi = math::cointoss(25);
            if (!var_a294702) {
                b_spartoi = 0;
            }
            while (1) {
                if (a_s_options.size == 0) {
                    a_s_options = array::randomize(a_s_spawns);
                }
                if (b_spartoi) {
                    ai_zombie = zombie_skeleton_util::function_1ea880bd(1, a_s_options[0]);
                } else {
                    ai_zombie = zombie_utility::spawn_zombie(array::random(level.zombie_spawners), undefined, a_s_options[0]);
                }
                if (isdefined(ai_zombie)) {
                    break;
                }
                waitframe(1);
            }
            arrayremoveindex(a_s_options, 0);
            if (!b_spartoi) {
                zm_transform::function_5db4f2f5(ai_zombie);
            }
            ai_zombie.var_126d7bef = 1;
            ai_zombie.ignore_round_spawn_failsafe = 1;
            ai_zombie.b_ignore_cleanup = 1;
            ai_zombie.ignore_enemy_count = 1;
            ai_zombie.no_powerups = 1;
            ai_zombie.var_12745932 = 1;
            ai_zombie.var_ae4569d5 = 1;
            if (var_f153be86) {
                ai_zombie.maxhealth = ai_zombie.maxhealth * 2;
                ai_zombie.health = ai_zombie.health * 2;
            }
            ai_zombie thread function_2a80a9cc();
        }
        n_random_wait = randomfloatrange(level.var_2f2b78fb.var_92cdd7d9, level.var_2f2b78fb.var_a7a8788a);
        wait(n_random_wait);
    }
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 2, eflags: 0x1 linked
// Checksum 0x7362d332, Offset: 0x7238
// Size: 0x13c
function function_2a80a9cc(b_run = 0, b_sprint = 0) {
    self endon(#"death");
    waitframe(1);
    self.completed_emerging_into_playable_area = 1;
    self notify(#"completed_emerging_into_playable_area");
    if (level flag::get(#"pegasus_entry")) {
        return;
    }
    if (math::cointoss(level.var_2f2b78fb.var_5579012f) || b_run || b_sprint) {
        self.var_f6fe2733 = 1;
        if (math::cointoss(level.var_2f2b78fb.var_30c1e68b) || b_sprint) {
            self zombie_utility::set_zombie_run_cycle("sprint");
        } else {
            self zombie_utility::set_zombie_run_cycle("run");
        }
    }
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x92d89872, Offset: 0x7380
// Size: 0xc4
function function_75c83fbf(s_params) {
    e_attacker = s_params.eattacker;
    if (isplayer(e_attacker) && isdefined(self.var_ae4569d5) && self.var_ae4569d5) {
        if (zombie_utility::function_6403cf83(#"zombie_powerup_double_points_on", #"allies")) {
            n_points = 20;
        } else {
            n_points = 10;
        }
        e_attacker thread zm_score::add_to_player_score(n_points, 1, "");
    }
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x98b63dfa, Offset: 0x7450
// Size: 0x3c4
function function_d8db57f6() {
    level endon(#"end_game", #"hash_420b070435236eab", #"hash_4d8091aa6a26d815");
    var_71da3f5a = getentarray("mdl_power_skeleton", "targetname");
    array::run_all(var_71da3f5a, &show);
    foreach (var_3e9d57b3 in var_71da3f5a) {
        v_origin = var_3e9d57b3.origin;
        v_angles = var_3e9d57b3.angles;
        a_info = zm_utility::function_b0eeaada(v_origin + vectorscale((0, 0, 1), 64));
        if (isdefined(a_info) && isdefined(a_info[#"point"])) {
            v_origin = a_info[#"point"];
        }
        s_spawn = struct::spawn(v_origin, v_angles);
        while (1) {
            var_862206ea = zombie_skeleton_util::function_1ea880bd(1, s_spawn, level.round_number);
            if (isdefined(var_862206ea)) {
                break;
            }
            waitframe(1);
        }
        var_862206ea thread function_f95a14a0();
        mdl_clip = getent(var_3e9d57b3.target, "targetname");
        s_spawn struct::delete();
        if (zm_utility::is_trials()) {
            mdl_clip thread zm_red::function_19a28e98();
            var_3e9d57b3 thread zm_red::function_19a28e98();
        } else {
            mdl_clip delete();
            var_3e9d57b3 delete();
        }
        n_random_wait = randomfloatrange(0.1, 0.5);
        wait(n_random_wait);
    }
    wait(3);
    function_350204ca(#"hash_6e38772014019f10");
    level flag::wait_till(#"spartoi_resurrect");
    var_1679e8e = function_22230e37();
    if (isdefined(var_1679e8e)) {
        player = array::random(var_1679e8e);
        if (zm_utility::is_player_valid(player)) {
            player zm_vo::function_a2bd5a0c(#"hash_5c714f3566f4c4", 0.5, 1, 9999, 1);
        }
    }
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xbd98271d, Offset: 0x7820
// Size: 0x39c
function function_f95a14a0() {
    self endon(#"death");
    self thread spartoi_death();
    s_scene = array::get_all_closest(self.origin, struct::get_array("s_spartoi_spawnpt"))[0];
    self.e_linkto = util::spawn_model("tag_origin", self.origin, self.angles);
    if (isdefined(self.e_linkto)) {
        self linkto(self.e_linkto);
    }
    self ghost();
    self notsolid();
    self val::set(#"hash_65edbe063d05f17b", "ignoreall", 1);
    self.var_126d7bef = 1;
    self.ignore_round_spawn_failsafe = 1;
    self.b_ignore_cleanup = 1;
    self.ignore_enemy_count = 1;
    self.no_powerups = 1;
    self.var_ae4569d5 = 1;
    self solid();
    waitframe(1);
    if (isdefined(self.e_linkto)) {
        self.e_linkto.angles = s_scene.angles;
    }
    var_704f0f40 = #"p8_fxanim_zm_red_spartoi_rise_no_helm_bundle";
    switch (self.var_9fde8624) {
    case #"hash_fd7b9665529dd42":
        var_704f0f40 = #"hash_21cc4ecb5263f2fd";
        break;
    case #"skeleton_spear":
        var_704f0f40 = #"p8_fxanim_zm_red_spartoi_rise_spear_no_helm_bundle";
        break;
    case #"hash_1520c8987a671df0":
        var_704f0f40 = #"p8_fxanim_zm_red_spartoi_rise_spear_bundle";
        break;
    }
    s_scene.angles = (s_scene.angles[0], s_scene.angles[1] + 90, s_scene.angles[2]);
    s_scene scene::play(var_704f0f40);
    self show();
    if (isdefined(self.e_linkto)) {
        self.e_linkto delete();
    }
    self val::reset(#"hash_65edbe063d05f17b", "ignoreall");
    if (zm_utility::is_trials()) {
        s_scene thread zm_red::function_19a28e98();
    } else {
        s_scene struct::delete();
    }
    self waittill(#"hash_782dbc5eec90f62f");
    level flag::set(#"spartoi_resurrect");
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xb955a1ed, Offset: 0x7bc8
// Size: 0xb4
function spartoi_death() {
    self waittill(#"death");
    if (level flag::get("round_reset") && !level flag::get(#"spartoi_dead")) {
        level thread function_1f25fb54();
        return;
    }
    level.var_5cc61d5f++;
    if (level.var_5cc61d5f > 2) {
        level flag::set(#"spartoi_dead");
    }
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x11594525, Offset: 0x7c88
// Size: 0x11c
function function_1f25fb54() {
    self notify("425f8e7d1e805a1b");
    self endon("425f8e7d1e805a1b");
    level.var_5cc61d5f = 0;
    var_71da3f5a = getentarray("mdl_power_skeleton", "targetname");
    array::run_all(var_71da3f5a, &show);
    zm_trial::function_ae725d63(0);
    foreach (var_3e9d57b3 in var_71da3f5a) {
        var_3e9d57b3 show();
    }
    wait(8);
    level thread function_d8db57f6();
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 1, eflags: 0x0
// Checksum 0xd82342ab, Offset: 0x7db0
// Size: 0xd4
function registerpromenade_chillout_props_traversal(a_ents) {
    mdl_pegasus  = a_ents[#"prop 1"];
    if (!isdefined(mdl_pegasus )) {
        return;
    }
    mdl_pegasus  setteam(#"allies");
    mdl_pegasus  clientfield::increment("" + #"register_pegasus");
    mdl_pegasus  thread function_342bd17b();
    level waittill(#"hash_28fd121552fe5ef3");
    level flag::set(#"pegasus_rescue");
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xb9c4ce3, Offset: 0x7e90
// Size: 0x4a0
function function_342bd17b() {
    self endon(#"death");
    s_center = struct::get(#"hash_4ede0d513d23996b");
    v_center = s_center.origin;
    while (1) {
        self waittill(#"zombie_melee");
        level notify(#"hash_a3780ca3fcd7d5f");
        var_5f1a008f = [];
        var_e87293a = [];
        foreach (ai_zombie in getaiteamarray(level.zombie_team)) {
            n_dot = self math::get_dot_right(ai_zombie.origin);
            if (n_dot > 0) {
                if (!isdefined(var_5f1a008f)) {
                    var_5f1a008f = [];
                } else if (!isarray(var_5f1a008f)) {
                    var_5f1a008f = array(var_5f1a008f);
                }
                var_5f1a008f[var_5f1a008f.size] = ai_zombie;
            } else {
                if (!isdefined(var_e87293a)) {
                    var_e87293a = [];
                } else if (!isarray(var_e87293a)) {
                    var_e87293a = array(var_e87293a);
                }
                var_e87293a[var_e87293a.size] = ai_zombie;
            }
        }
        var_e87293a = arraysortclosest(var_e87293a, v_center, 5);
        var_5f1a008f = arraysortclosest(var_5f1a008f, v_center, 5);
        var_d5d04666 = [];
        foreach (ai_zombie in var_5f1a008f) {
            if (!isdefined(var_d5d04666)) {
                var_d5d04666 = [];
            } else if (!isarray(var_d5d04666)) {
                var_d5d04666 = array(var_d5d04666);
            }
            var_d5d04666[var_d5d04666.size] = array(ai_zombie, #"right");
        }
        foreach (ai_zombie in var_e87293a) {
            if (!isdefined(var_d5d04666)) {
                var_d5d04666 = [];
            } else if (!isarray(var_d5d04666)) {
                var_d5d04666 = array(var_d5d04666);
            }
            var_d5d04666[var_d5d04666.size] = array(ai_zombie, #"left");
        }
        var_d5d04666 = array::randomize(var_d5d04666);
        foreach (i, a_info in var_d5d04666) {
            ai_zombie = a_info[0];
            str_side = a_info[1];
            if (!isdefined(ai_zombie)) {
                continue;
            }
            ai_zombie thread pegasus_strike(str_side);
            if (i < var_d5d04666.size) {
                waitframe(2);
            }
        }
    }
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xb9df9456, Offset: 0x8338
// Size: 0xf4
function pegasus_strike(str_side) {
    self endon(#"death");
    if (zm_utility::is_magic_bullet_shield_enabled(self)) {
        return;
    }
    if (str_side == #"right") {
        self clientfield::increment("" + #"hash_1bdce857fd614cef");
    } else {
        self clientfield::increment("" + #"hash_2856f87ecdfaf62");
    }
    waitframe(1);
    if (zm_utility::is_magic_bullet_shield_enabled(self)) {
        return;
    }
    gibserverutils::annihilate(self);
    self kill();
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xc8c76189, Offset: 0x8438
// Size: 0xec
function function_ae259e17(v_origin) {
    var_ea4f0ca0 = spawner::simple_spawn_single("sp_power_quest_energy_trails");
    var_fc16302e = spawner::simple_spawn_single("sp_power_quest_energy_trails");
    var_86ea9611 = getvehiclenode("nd_power_quest_energy_trail_1", "targetname");
    var_f2d66de7 = getvehiclenode("nd_power_quest_energy_trail_2", "targetname");
    var_86ea9611.origin = v_origin;
    var_f2d66de7.origin = v_origin;
    var_ea4f0ca0 thread function_1984219e(var_86ea9611);
    var_fc16302e thread function_1984219e(var_f2d66de7);
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xd1b2c9f8, Offset: 0x8530
// Size: 0xc4
function function_1984219e(nd_start) {
    self endon(#"death");
    self clientfield::set("" + #"hash_463ff879b8d656bb", 1);
    self vehicle::get_on_and_go_path(nd_start);
    self clientfield::set("" + #"hash_463ff879b8d656bb", 0);
    self playsound(#"hash_3fc47e14a55e5bbc");
    self delete();
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x377b91bc, Offset: 0x8600
// Size: 0x8c
function function_350204ca(str_vo) {
    var_1679e8e = function_22230e37();
    if (isdefined(var_1679e8e)) {
        player = array::random(var_1679e8e);
        if (zm_utility::is_player_valid(player)) {
            player zm_vo::function_a2bd5a0c(str_vo, 0, 1, 9999, 1);
        }
    }
}

// Namespace zm_red_power_quest/zm_red_power_quest
// Params 0, eflags: 0x0
// Checksum 0x9d04c3dd, Offset: 0x8698
// Size: 0x2c4
function devgui_complete() {
    /#
        level flag::set(#"hash_dc34ebe02d09532");
        level flag::set(#"hash_3dba794053dea40e");
        level flag::set(#"perseus_exits");
        level flag::set(#"spartoi_dead");
        level flag::set(#"pegasus_rescue");
        level flag::set(#"hash_4d8091aa6a26d815");
        level flag::set(#"flag_skeleton_set_intro");
        var_71da3f5a = getentarray("aib_vign_cust_zm_red_amp_zmb_brk_out_10", "electrocute");
        foreach (var_3e9d57b3 in var_71da3f5a) {
            if (isdefined(var_3e9d57b3)) {
                var_3e9d57b3 delete();
            }
        }
        foreach (mdl_zombie in level.var_26450f62) {
            if (isdefined(mdl_zombie)) {
                mdl_zombie delete();
            }
        }
        level flag::set(#"perseus_exits");
        level flag::set(#"spartoi_dead");
        level flag::wait_till("<unknown string>");
        level flag::wait_till("<unknown string>");
        level flag::set(#"hash_420b070435236eab");
        function_e059d0e1();
    #/
}

