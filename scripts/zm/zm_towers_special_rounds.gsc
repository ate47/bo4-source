#using scripts\zm\zm_towers_util;
#using scripts\zm\zm_towers_side_quests;
#using scripts\zm\zm_towers;
#using scripts\zm_common\util\ai_tiger_util;
#using scripts\zm_common\util\ai_gladiator_util;
#using scripts\core_common\ai\zombie_utility;
#using scripts\zm_common\zm_zonemgr;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_round_logic;
#using scripts\zm_common\zm_round_spawning;
#using scripts\zm_common\zm_powerups;
#using scripts\zm_common\zm_laststand;
#using scripts\zm_common\zm_customgame;
#using scripts\zm_common\zm_audio;
#using scripts\core_common\values_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\spawner_shared;
#using scripts\core_common\status_effects\status_effect_util;
#using scripts\core_common\scene_shared;
#using scripts\core_common\struct;
#using scripts\core_common\math_shared;
#using scripts\core_common\fx_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\ai_shared;

#namespace zm_towers_special_rounds;

// Namespace zm_towers_special_rounds/zm_towers_special_rounds
// Params 0, eflags: 0x1 linked
// Checksum 0x36ae591b, Offset: 0x360
// Size: 0x4cc
function init() {
    level.var_3f8640e8 = 0;
    level.var_f8ae1232 = 0;
    level.var_fcde6b4 = &function_d838227c;
    level.var_14961f90 = &function_e4b73b34;
    level.var_2783a5a7 = getentarray("special_round_gate", "targetname");
    var_72a846ab = getent("arena_gate_east", "targetname");
    var_b21a763b = getent("arena_gate_west", "targetname");
    var_9a4626f1 = getent("arena_gate_east_clip", "targetname");
    var_3dcd92b2 = getent("arena_gate_west_clip", "targetname");
    var_9a4626f1 linkto(var_72a846ab);
    var_3dcd92b2 linkto(var_b21a763b);
    array::add(level.var_2783a5a7, var_72a846ab, 0);
    array::add(level.var_2783a5a7, var_b21a763b, 0);
    function_23873006("tiger_spawn_0", 4);
    function_23873006("obelisk_tiger_0", 4);
    level waittill(#"all_players_spawned");
    level flag::init(#"hash_1baa9fb772fb9175");
    if (zm_utility::is_trials()) {
        zm_round_spawning::function_df803678(&function_71c7c70b);
        zm_round_spawning::function_cc103b38(#"tiger", 6);
        zm_round_spawning::function_376e51ef(#"catalyst", 7);
        zm_round_spawning::function_cc103b38(#"gladiator_marauder", 8);
        zm_round_spawning::function_cc103b38(#"gladiator_destroyer", 10);
        zm_round_spawning::function_cc103b38(#"blight_father", 15);
        zm_round_spawning::function_b4a8f95a(#"gladiator_marauder", 9, &function_66d172e9, &function_1e895d4, &registerpathing_units_, &zombie_gladiator_util::function_5d0001ad);
        return;
    }
    if (!zm_utility::is_standard()) {
        level thread start_drummers();
        zm_round_spawning::function_df803678(&function_71c7c70b);
        zm_round_spawning::function_cc103b38(#"tiger", 6);
        zm_round_spawning::function_376e51ef(#"catalyst", 7);
        zm_round_spawning::function_cc103b38(#"gladiator_marauder", 8);
        zm_round_spawning::function_cc103b38(#"gladiator_destroyer", 10);
        zm_round_spawning::function_cc103b38(#"blight_father", 15);
        zm_round_spawning::function_b4a8f95a(#"tiger", 9, &function_f63225b8, &function_9a74f284, &function_a5dc8595, &zombie_tiger_util::function_ffa01525);
    }
}

// Namespace zm_towers_special_rounds/zm_towers_special_rounds
// Params 2, eflags: 0x1 linked
// Checksum 0x27463b54, Offset: 0x838
// Size: 0xa6
function function_23873006(str_prefix, n_count) {
    for (i = 1; i <= n_count; i++) {
        var_d9b71c6d = getent(str_prefix + i, "targetname");
        if (isdefined(var_d9b71c6d)) {
            var_d9b71c6d.script_vector = (0, 0, 45);
            array::add(level.var_2783a5a7, var_d9b71c6d, 0);
        }
    }
}

// Namespace zm_towers_special_rounds/zm_towers_special_rounds
// Params 0, eflags: 0x1 linked
// Checksum 0x6acb02c3, Offset: 0x8e8
// Size: 0x22
function function_d838227c() {
    return function_15652808(#"tiger");
}

// Namespace zm_towers_special_rounds/zm_towers_special_rounds
// Params 0, eflags: 0x1 linked
// Checksum 0x2c73982d, Offset: 0x918
// Size: 0x22
function function_e4b73b34() {
    return function_15652808(#"gladiator");
}

// Namespace zm_towers_special_rounds/zm_towers_special_rounds
// Params 1, eflags: 0x1 linked
// Checksum 0xc19d4b92, Offset: 0x948
// Size: 0x384
function function_15652808(str_archetype) {
    str_script_noteworthy = "tiger_location";
    if (str_archetype == #"gladiator") {
        str_script_noteworthy = "gladiator_location";
    }
    if (!level flag::get("special_round")) {
        if (isdefined(level.zm_loc_types[str_script_noteworthy]) && level.zm_loc_types[str_script_noteworthy].size) {
            return array::random(level.zm_loc_types[str_script_noteworthy]);
        }
        return;
    }
    e_target_player = zm_utility::function_372a1e12();
    while (!isdefined(e_target_player)) {
        e_target_player = zm_utility::function_372a1e12();
        waitframe(1);
    }
    e_target_player.hunted_by++;
    str_zone = e_target_player zm_zonemgr::get_player_zone();
    var_73d7ced0 = struct::get_array("special_round_location", "script_noteworthy");
    if (isinarray(level.var_d4061661, str_zone)) {
        var_73d7ced0 = array::randomize(var_73d7ced0);
        foreach (s_spawn in var_73d7ced0) {
            if (!(isdefined(s_spawn.b_cooldown) && s_spawn.b_cooldown)) {
                s_spawn.b_cooldown = 1;
                s_spawn thread function_288a0226();
                return s_spawn;
            }
        }
    }
    var_d4725977 = level.zm_loc_types[str_script_noteworthy];
    if (isdefined(var_d4725977) && var_d4725977.size > 0) {
        var_d4725977 = arraysortclosest(var_d4725977, e_target_player.origin);
        foreach (s_spawn in var_d4725977) {
            if (!(isdefined(s_spawn.b_cooldown) && s_spawn.b_cooldown)) {
                s_spawn.b_cooldown = 1;
                s_spawn thread function_288a0226();
                return s_spawn;
            }
        }
        var_3bc84e2 = arraycombine(var_73d7ced0, var_d4725977, 0, 0);
        return arraygetclosest(e_target_player.origin, var_3bc84e2);
    }
    return arraygetclosest(e_target_player.origin, var_73d7ced0);
}

// Namespace zm_towers_special_rounds/zm_towers_special_rounds
// Params 0, eflags: 0x1 linked
// Checksum 0x45b754fb, Offset: 0xcd8
// Size: 0x16
function function_288a0226() {
    wait 10;
    self.b_cooldown = 0;
}

// Namespace zm_towers_special_rounds/zm_towers_special_rounds
// Params 1, eflags: 0x1 linked
// Checksum 0xc5159693, Offset: 0xcf8
// Size: 0xdc
function function_461a99a5(s_spot) {
    self endon(#"death");
    if (s_spot.script_noteworthy === "special_round_location") {
        self.completed_emerging_into_playable_area = 1;
        self notify(#"completed_emerging_into_playable_area");
    } else {
        self waittill(#"completed_emerging_into_playable_area");
    }
    if (self.archetype == #"tiger") {
        self ai::set_behavior_attribute("sprint", 1);
        return;
    }
    self ai::set_behavior_attribute("run", 1);
}

// Namespace zm_towers_special_rounds/zm_towers_special_rounds
// Params 0, eflags: 0x1 linked
// Checksum 0xac582ba5, Offset: 0xde0
// Size: 0x2c
function function_f63225b8() {
    level notify(#"hash_21672c4f6ccf13d0");
    level thread function_93eab559();
}

// Namespace zm_towers_special_rounds/zm_towers_special_rounds
// Params 1, eflags: 0x1 linked
// Checksum 0x47637068, Offset: 0xe18
// Size: 0x1cc
function function_9a74f284(var_d25bbdd5) {
    if (var_d25bbdd5) {
        level.var_3f8640e8++;
        for (var_f40360e8 = math::clamp(level.round_number + randomintrange(3, 5), 9, 255); isinarray(level.var_865ea9f, var_f40360e8); var_f40360e8++) {
        }
        println("<dev string:x38>" + var_f40360e8);
        if (zm_utility::is_standard()) {
            zm_round_spawning::function_b4a8f95a(#"tiger", var_f40360e8, &function_f63225b8, &function_9a74f284, &function_a5dc8595, &zombie_tiger_util::function_ffa01525);
        } else {
            zm_round_spawning::function_b4a8f95a(#"gladiator_destroyer", var_f40360e8, &function_66d172e9, &function_93b3cc13, &function_f8ae1232, &zombie_gladiator_util::function_5d0001ad);
        }
    }
    level notify(#"hash_7b9245ff51f3d4f7");
    level function_417990b9();
    level thread function_39a9e7ce();
}

// Namespace zm_towers_special_rounds/zm_towers_special_rounds
// Params 0, eflags: 0x1 linked
// Checksum 0xcf6d9370, Offset: 0xff0
// Size: 0x92
function function_a5dc8595() {
    players = getplayers();
    if (level.var_3f8640e8 <= 1) {
        n_max = players.size * 5;
    } else {
        n_max = players.size * 7;
    }
    return int(n_max * (isdefined(level.var_71bc2e8f) ? level.var_71bc2e8f : 1));
}

// Namespace zm_towers_special_rounds/zm_towers_special_rounds
// Params 0, eflags: 0x1 linked
// Checksum 0xbdb5aaab, Offset: 0x1090
// Size: 0x2c
function function_66d172e9() {
    level notify(#"hash_21672c4f6ccf13d0");
    level thread function_93eab559();
}

// Namespace zm_towers_special_rounds/zm_towers_special_rounds
// Params 1, eflags: 0x1 linked
// Checksum 0x86996390, Offset: 0x10c8
// Size: 0x1e4
function function_93b3cc13(var_d25bbdd5) {
    if (var_d25bbdd5) {
        level.var_f8ae1232++;
        for (var_f40360e8 = level.round_number + randomintrange(3, 5); isinarray(level.var_865ea9f, var_f40360e8); var_f40360e8++) {
        }
        println("<dev string:x38>" + var_f40360e8);
        if (level.var_f8ae1232 > 1) {
            zm_round_spawning::function_b4a8f95a(array(#"gladiator_marauder", #"gladiator_destroyer", #"tiger"), var_f40360e8, &function_66d172e9, &function_93b3cc13, &function_f8ae1232, &zombie_gladiator_util::function_5d0001ad);
        } else {
            zm_round_spawning::function_b4a8f95a(#"gladiator_marauder", var_f40360e8, &function_66d172e9, &function_93b3cc13, &function_f8ae1232, &zombie_gladiator_util::function_5d0001ad);
        }
    }
    level notify(#"hash_7b9245ff51f3d4f7");
    level function_417990b9();
    level thread function_39a9e7ce();
}

// Namespace zm_towers_special_rounds/zm_towers_special_rounds
// Params 1, eflags: 0x1 linked
// Checksum 0xbb7ce051, Offset: 0x12b8
// Size: 0x64
function function_1e895d4(var_d25bbdd5) {
    if (var_d25bbdd5) {
        level.var_f8ae1232++;
    }
    level notify(#"hash_7b9245ff51f3d4f7");
    level function_417990b9();
    level thread function_39a9e7ce();
}

// Namespace zm_towers_special_rounds/zm_towers_special_rounds
// Params 0, eflags: 0x1 linked
// Checksum 0x1dba7c19, Offset: 0x1328
// Size: 0x5e
function function_f8ae1232() {
    players = getplayers();
    if (level.var_f8ae1232 < 1) {
        n_max = players.size * 2;
    } else {
        n_max = players.size * 4;
    }
    return n_max;
}

// Namespace zm_towers_special_rounds/zm_towers_special_rounds
// Params 0, eflags: 0x1 linked
// Checksum 0x68d3d488, Offset: 0x1390
// Size: 0x8
function registerpathing_units_() {
    return 12;
}

// Namespace zm_towers_special_rounds/zm_towers_special_rounds
// Params 1, eflags: 0x1 linked
// Checksum 0x1395891e, Offset: 0x13a0
// Size: 0x40c
function function_93eab559(var_b45e3d90 = 0) {
    if (level flag::get(#"hash_1baa9fb772fb9175")) {
        return;
    }
    level flag::set(#"hash_1baa9fb772fb9175");
    level exploder::exploder("fx8_exp_blaze_vista");
    callback::on_ai_killed(&function_ec08dc3a);
    relaxteleportoutterminate = 1;
    if (var_b45e3d90) {
        relaxteleportoutterminate = 2;
        exploder::exploder("exp_special_storm");
    }
    foreach (player in level.players) {
        player clientfield::set("special_round_camera", relaxteleportoutterminate);
    }
    exploder::exploder("exp_lgt_special_round");
    if (!var_b45e3d90) {
        level clientfield::set("special_round_smoke", 1);
    }
    foreach (e_gate in level.var_2783a5a7) {
        v_amount = vectorscale(e_gate.script_vector, 1);
        e_gate moveto(e_gate.origin + v_amount, 1);
        if (isdefined(e_gate.targetname) && (e_gate.targetname == "arena_gate_east" || e_gate.targetname == "arena_gate_west")) {
            e_gate playsound(#"hash_1259041350e5f60d");
            continue;
        }
        e_gate playsound(#"hash_75a2099e8df5a448");
    }
    var_4ad6b8c9 = struct::get_array("special_round_smoke");
    foreach (s_loc in var_4ad6b8c9) {
        s_loc.var_7c5f8ec1 = util::spawn_model("tag_origin", s_loc.origin);
        s_loc.var_7c5f8ec1 thread function_85324f75(var_b45e3d90);
    }
    zm_towers_util::function_afd37143(#"special_round_start");
    if (level flag::get(#"hash_6205682540170b8")) {
        level thread zm_towers_side_quests::function_5d0d1807();
    }
}

// Namespace zm_towers_special_rounds/zm_towers_special_rounds
// Params 0, eflags: 0x1 linked
// Checksum 0xa77dc789, Offset: 0x17b8
// Size: 0x70
function start_drummers() {
    level endon(#"end_game");
    while (true) {
        level waittill(#"hash_37b8eeaed85f1b4c");
        wait 0.06;
        level scene::play("special_round_drummers", "targetname");
    }
}

// Namespace zm_towers_special_rounds/zm_towers_special_rounds
// Params 1, eflags: 0x1 linked
// Checksum 0xbe777ef0, Offset: 0x1830
// Size: 0x3c4
function function_417990b9(var_b45e3d90 = 0) {
    if (!level flag::get(#"hash_1baa9fb772fb9175")) {
        return;
    }
    level flag::clear(#"hash_1baa9fb772fb9175");
    exploder::exploder_stop("fx8_exp_blaze_vista");
    callback::remove_on_ai_killed(&function_ec08dc3a);
    foreach (player in level.players) {
        player clientfield::set("special_round_camera", 0);
    }
    if (var_b45e3d90) {
        exploder::exploder_stop("exp_special_storm");
    }
    var_4ad6b8c9 = struct::get_array("special_round_smoke");
    exploder::stop_exploder("exp_lgt_special_round");
    foreach (e_gate in level.var_2783a5a7) {
        if (isdefined(e_gate.script_vector)) {
            v_amount = vectorscale(e_gate.script_vector, -1);
            e_gate moveto(e_gate.origin + v_amount, 1);
            if (isdefined(e_gate.targetname) && (e_gate.targetname == "arena_gate_east" || e_gate.targetname == "arena_gate_west")) {
                e_gate playsound(#"hash_35413bdf3d48cfa7");
                continue;
            }
            e_gate playsound(#"hash_40e8e3be1a559184");
        }
    }
    foreach (s_loc in var_4ad6b8c9) {
        if (isdefined(s_loc.var_7c5f8ec1)) {
            s_loc.var_7c5f8ec1 delete();
        }
    }
    if (!var_b45e3d90) {
        level clientfield::set("special_round_smoke", 0);
    }
    level scene::stop("special_round_drummers", "targetname");
    level scene::init("special_round_drummers", "targetname");
}

// Namespace zm_towers_special_rounds/zm_towers_special_rounds
// Params 1, eflags: 0x1 linked
// Checksum 0x553184b2, Offset: 0x1c00
// Size: 0x2c
function function_ec08dc3a(s_params) {
    level exploder::exploder("fx8_exp_blaze_kill");
}

// Namespace zm_towers_special_rounds/zm_towers_special_rounds
// Params 1, eflags: 0x1 linked
// Checksum 0x843cf1b9, Offset: 0x1c38
// Size: 0x29a
function function_85324f75(var_8657f7ff = 0) {
    level endoncallback(&function_3cba3938, #"kill_special_round_fog", #"end_game");
    self endon(#"death");
    if (!var_8657f7ff) {
        var_7a79774b = getstatuseffect("dot_corrosive_catalyst");
    }
    if (level.start_round == level.round_number) {
        wait 5;
    }
    while (true) {
        trigger_midpoint = self.origin + (0, 0, 72);
        foreach (player in level.players) {
            if (isalive(player) && distancesquared(player.origin, self.origin) <= 128 * 128 && (abs(player.origin[2] - trigger_midpoint[2]) <= 36 || abs(player geteye()[2] - trigger_midpoint[2]) <= 36)) {
                if (!var_8657f7ff) {
                    player status_effect::status_effect_apply(var_7a79774b, undefined, self, 1);
                }
                if (!(isdefined(player.var_b9b1038f) && player.var_b9b1038f)) {
                    player.var_b9b1038f = 1;
                    player.var_7b2f6755 = 1;
                    player thread function_618c268f(self);
                }
            }
        }
        waitframe(1);
    }
}

// Namespace zm_towers_special_rounds/zm_towers_special_rounds
// Params 1, eflags: 0x5 linked
// Checksum 0x95841f1a, Offset: 0x1ee0
// Size: 0x9a
function private function_3cba3938(var_c34665fc) {
    if (var_c34665fc == "kill_special_round_fog") {
        foreach (e_player in getplayers()) {
            e_player.var_7b2f6755 = undefined;
            e_player.var_b9b1038f = undefined;
        }
    }
}

// Namespace zm_towers_special_rounds/zm_towers_special_rounds
// Params 1, eflags: 0x1 linked
// Checksum 0x6d92a0a3, Offset: 0x1f88
// Size: 0x13a
function function_618c268f(e_source) {
    self endon(#"disconnect");
    var_c1538db = e_source.origin;
    self dodamage(25, var_c1538db);
    var_60bb2505 = getent("vol_spawn_area", "targetname");
    vol_opposite_tunnel = getent("vol_opposite_tunnel", "targetname");
    n_delay = 0.666;
    if (self istouching(var_60bb2505) || self istouching(vol_opposite_tunnel)) {
        n_delay = 0.1;
    }
    wait n_delay;
    self.var_b9b1038f = undefined;
    if (distancesquared(self.origin, var_c1538db) > 128 * 128) {
        self.var_7b2f6755 = undefined;
    }
}

// Namespace zm_towers_special_rounds/zm_towers_special_rounds
// Params 1, eflags: 0x1 linked
// Checksum 0x4f246980, Offset: 0x20d0
// Size: 0x44
function function_71c7c70b(var_c1ff0b19) {
    level thread zm_powerups::specific_powerup_drop("full_ammo", self.origin, undefined, undefined, undefined, undefined, undefined, undefined, undefined, 1);
}

// Namespace zm_towers_special_rounds/zm_towers_special_rounds
// Params 0, eflags: 0x1 linked
// Checksum 0x70bd072d, Offset: 0x2120
// Size: 0x160
function function_39a9e7ce() {
    var_629da31e = zm_custom::function_901b751c(#"zmlaststandduration");
    wait 1.5;
    level notify(#"kill_special_round_fog");
    var_60bb2505 = getent("vol_spawn_area", "targetname");
    vol_opposite_tunnel = getent("vol_opposite_tunnel", "targetname");
    foreach (e_player in util::get_active_players()) {
        if (e_player istouching(var_60bb2505) || e_player istouching(vol_opposite_tunnel)) {
            e_player zm_laststand::instakill_player();
        }
    }
}

