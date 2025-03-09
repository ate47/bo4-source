#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\struct;
#using scripts\core_common\trigger_shared;
#using scripts\core_common\util_shared;
#using scripts\zm\zm_towers_shield;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_powerups;
#using scripts\zm_common\zm_unitrigger;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_zonemgr;

#namespace zm_towers_side_quests;

// Namespace zm_towers_side_quests/zm_towers_side_quests
// Params 0, eflags: 0x0
// Checksum 0x76f7d142, Offset: 0x2c8
// Size: 0x2a4
function init() {
    level flag::init(#"hash_26c0c05d0a3e382f");
    level flag::init(#"pyre_lit");
    level flag::init(#"hash_6205682540170b8");
    level._effect[#"hash_3ecc995bb97331ac"] = #"hash_37631c88b85a74ec";
    level.var_c1549bc8 = spawnstruct();
    level.var_c1549bc8.var_25f5a473 = struct::get_array("s_pyre");
    foreach (s_stub in level.var_c1549bc8.var_25f5a473) {
        mdl = getent(s_stub.target, "targetname");
        mdl hide();
    }
    if (!zm_utility::is_ee_enabled()) {
        return;
    }
    level.var_c1549bc8.var_3e762bf6 = 0;
    level.var_c1549bc8.var_f06465e0 = getent("t_pyre_on", "targetname");
    level.var_c1549bc8.var_a1d1197d = 0;
    callback::on_connect(&function_4ff8ad95);
    callback::on_ai_killed(&function_aee836e9);
    level thread function_125dfe69();
    level thread function_fb74fc5f();
    level thread function_1e32e900();
    level thread arena_rock();
    level thread function_1eddbf9e();
}

// Namespace zm_towers_side_quests/zm_towers_side_quests
// Params 0, eflags: 0x0
// Checksum 0xa3c592a5, Offset: 0x578
// Size: 0xac
function function_4ff8ad95() {
    self endon(#"disconnect");
    while (!isdefined(level.var_c1549bc8.var_a1d1197d)) {
        waitframe(1);
    }
    if (level.var_c1549bc8.var_a1d1197d < 3) {
        level.var_c1549bc8.var_f06465e0 setinvisibletoplayer(self);
    }
    self flag::init(#"hash_381b60178f34f12");
    self thread function_def71ac3();
}

// Namespace zm_towers_side_quests/zm_towers_side_quests
// Params 0, eflags: 0x0
// Checksum 0xb7da5fb0, Offset: 0x630
// Size: 0x50
function function_aee836e9() {
    str_zone = zm_zonemgr::get_zone_from_position(self.origin);
    if (str_zone === "zone_zeus_basement") {
        level notify(#"bloodbath_kill");
    }
}

// Namespace zm_towers_side_quests/zm_towers_side_quests
// Params 0, eflags: 0x0
// Checksum 0x662759b2, Offset: 0x688
// Size: 0xc0
function function_125dfe69() {
    level endon(#"end_game", #"hash_26c0c05d0a3e382f");
    while (true) {
        level waittill(#"bloodbath_kill");
        level.var_c1549bc8.var_3e762bf6++;
        if (level.var_c1549bc8.var_3e762bf6 >= 831) {
            level flag::set(#"hash_26c0c05d0a3e382f");
            callback::remove_on_ai_killed(&function_aee836e9);
        }
    }
}

// Namespace zm_towers_side_quests/zm_towers_side_quests
// Params 0, eflags: 0x0
// Checksum 0xc431673, Offset: 0x750
// Size: 0x52c
function function_fb74fc5f() {
    level.var_c1549bc8.var_37676611 = [];
    if (!isdefined(level.var_c1549bc8.var_37676611)) {
        level.var_c1549bc8.var_37676611 = [];
    } else if (!isarray(level.var_c1549bc8.var_37676611)) {
        level.var_c1549bc8.var_37676611 = array(level.var_c1549bc8.var_37676611);
    }
    level.var_c1549bc8.var_37676611[level.var_c1549bc8.var_37676611.size] = getent("mdl_toothpick", "targetname");
    if (!isdefined(level.var_c1549bc8.var_37676611)) {
        level.var_c1549bc8.var_37676611 = [];
    } else if (!isarray(level.var_c1549bc8.var_37676611)) {
        level.var_c1549bc8.var_37676611 = array(level.var_c1549bc8.var_37676611);
    }
    level.var_c1549bc8.var_37676611[level.var_c1549bc8.var_37676611.size] = getent("mdl_feathers", "targetname");
    if (!isdefined(level.var_c1549bc8.var_37676611)) {
        level.var_c1549bc8.var_37676611 = [];
    } else if (!isarray(level.var_c1549bc8.var_37676611)) {
        level.var_c1549bc8.var_37676611 = array(level.var_c1549bc8.var_37676611);
    }
    level.var_c1549bc8.var_37676611[level.var_c1549bc8.var_37676611.size] = getent("mdl_tankard", "targetname");
    foreach (mdl in level.var_c1549bc8.var_37676611) {
        level flag::init(mdl.model + "_picked_up");
        level flag::init(mdl.model + "_placed");
        mdl thread function_6cfb44f0();
    }
    array::thread_all(level.var_c1549bc8.var_25f5a473, &function_3a6ce932);
    level flag::wait_till("all_players_spawned");
    while (level.var_c1549bc8.var_a1d1197d < 3) {
        waitframe(1);
    }
    playsoundatposition(#"hash_7f8f5a20e4b87aac", (0, 0, 0));
    while (true) {
        s_waitresult = level waittill(#"hash_3042a9bf2f57ea0a");
        v_origin = s_waitresult.var_814c9389;
        if (isplayer(s_waitresult.attacker)) {
            str_player_zone = s_waitresult.attacker.zone_name;
        }
        if (istouching(v_origin, level.var_c1549bc8.var_f06465e0) && str_player_zone === "zone_zeus_top_floor") {
            break;
        }
    }
    /#
        printtoprightln("<dev string:x38>");
    #/
    level flag::set(#"pyre_lit");
    exploder::exploder("exp_blue_fire");
    level function_ad85b216();
}

// Namespace zm_towers_side_quests/zm_towers_side_quests
// Params 0, eflags: 0x0
// Checksum 0x41006490, Offset: 0xc88
// Size: 0x9c
function function_6cfb44f0() {
    level endon(#"end_game");
    self zm_unitrigger::function_fac87205(&function_77df7138);
    level flag::set(self.model + "_picked_up");
    self playsound(#"hash_3b838b7d3c19fd0a");
    self delete();
}

// Namespace zm_towers_side_quests/zm_towers_side_quests
// Params 1, eflags: 0x0
// Checksum 0xc20916c, Offset: 0xd30
// Size: 0xfe
function function_77df7138(e_player) {
    if (!isdefined(e_player) || !isdefined(self) || !isdefined(self.stub) || !isdefined(self.stub.related_parent) || !isdefined(self.stub.related_parent.origin)) {
        return false;
    }
    var_5168e40f = e_player zm_utility::is_player_looking_at(self.stub.related_parent.origin, 0.96, 0);
    b_have = level flag::get(self.stub.related_parent.model + "_picked_up");
    return var_5168e40f && !b_have;
}

// Namespace zm_towers_side_quests/zm_towers_side_quests
// Params 0, eflags: 0x0
// Checksum 0xfdbf9998, Offset: 0xe38
// Size: 0xd8
function function_3a6ce932() {
    level endon(#"end_game");
    zm_unitrigger::function_fac87205(&function_135e7d64);
    e_target = getent(self.target, "targetname");
    e_target show();
    e_target playsound(#"hash_27013ebd10f7b8c3");
    level flag::set(e_target.model + "_placed");
    level.var_c1549bc8.var_a1d1197d++;
}

// Namespace zm_towers_side_quests/zm_towers_side_quests
// Params 1, eflags: 0x0
// Checksum 0x2287be62, Offset: 0xf18
// Size: 0x136
function function_135e7d64(e_player) {
    s_parent = self.stub.related_parent;
    mdl_stub = getent(s_parent.target, "targetname");
    b_have = level flag::get(mdl_stub.model + "_picked_up");
    b_placed = level flag::get(mdl_stub.model + "_placed");
    var_5168e40f = e_player zm_utility::is_player_looking_at(s_parent.origin, 0.96, 0);
    return isdefined(b_have) && b_have && isdefined(var_5168e40f) && var_5168e40f && isdefined(b_placed) && !b_placed;
}

// Namespace zm_towers_side_quests/zm_towers_side_quests
// Params 0, eflags: 0x0
// Checksum 0xe78b939d, Offset: 0x1058
// Size: 0x172
function function_ad85b216() {
    if (getdvarint(#"zm_debug_ee", 0)) {
        var_10cba649 = 1;
    } else {
        var_10cba649 = 7;
    }
    level.var_c1549bc8.var_782576f8 = level.round_number + var_10cba649;
    while (level.round_number < level.var_c1549bc8.var_782576f8) {
        level waittill(#"end_of_round");
    }
    playsoundatposition("zmb_ee_brewing_done", (0, 0, 0));
    s_loc = struct::get("s_perk_drop");
    for (perk = zm_powerups::specific_powerup_drop("free_perk", s_loc.origin, #"allies", undefined, undefined, 1, 1); !isdefined(perk); perk = zm_powerups::specific_powerup_drop("free_perk", s_loc.origin, #"allies", undefined, undefined, 1, 1)) {
        waitframe(1);
    }
}

// Namespace zm_towers_side_quests/zm_towers_side_quests
// Params 0, eflags: 0x0
// Checksum 0x6952f7a3, Offset: 0x11d8
// Size: 0x7c
function function_1e32e900() {
    callback::on_connect(&function_e1a7f79c);
    array::thread_all(level.players, &function_e1a7f79c);
    level thread function_4b01369a();
    level thread function_51817689();
}

// Namespace zm_towers_side_quests/zm_towers_side_quests
// Params 0, eflags: 0x0
// Checksum 0x96aa71c2, Offset: 0x1260
// Size: 0x1d4
function function_e1a7f79c() {
    self notify("2c01316cfc198070");
    self endon("2c01316cfc198070");
    level endon(#"end_game");
    self endon(#"disconnect");
    self flag::init(#"hash_481ca29c700e04dd");
    self flag::init(#"hash_6db6c5251c9721d6");
    self flag::init(#"hash_69c9295a1129268f");
    self flag::init(#"hash_23e1b3b7f7f46cb8");
    self flag::init(#"hash_6757075afacfc1b4");
    self.var_ea819a71 = [];
    self thread function_a0cf9801();
    self thread function_acbff22d();
    self flag::wait_till_all(array(#"hash_481ca29c700e04dd", #"hash_6db6c5251c9721d6", #"hash_69c9295a1129268f"));
    self flag::wait_till(#"hash_23e1b3b7f7f46cb8");
    self flag::set(#"hash_6757075afacfc1b4");
    self playsoundtoplayer(#"hash_3f4d4c01f45d3fa6", self);
}

// Namespace zm_towers_side_quests/zm_towers_side_quests
// Params 0, eflags: 0x0
// Checksum 0xf4878c36, Offset: 0x1440
// Size: 0x7c
function function_a0cf9801() {
    self notify("6b57f941604a9c43");
    self endon("6b57f941604a9c43");
    level endon(#"end_game");
    self endon(#"disconnect");
    self waittill(#"hash_731c84be18ae9fa3");
    self flag::set(#"hash_6db6c5251c9721d6");
}

// Namespace zm_towers_side_quests/zm_towers_side_quests
// Params 0, eflags: 0x0
// Checksum 0x253236b8, Offset: 0x14c8
// Size: 0x7c
function function_acbff22d() {
    self notify("4058048e430c1831");
    self endon("4058048e430c1831");
    level endon(#"end_game");
    self endon(#"disconnect");
    self waittill(#"hazard_hit");
    self flag::set(#"hash_69c9295a1129268f");
}

// Namespace zm_towers_side_quests/zm_towers_side_quests
// Params 0, eflags: 0x0
// Checksum 0xa9148121, Offset: 0x1550
// Size: 0xb0
function function_4b01369a() {
    level endon(#"end_game");
    while (true) {
        s_waitresult = level waittill(#"trap_activated");
        t_trap = s_waitresult.trap;
        str_triggers = t_trap.var_a1aa5fa1;
        if (isdefined(str_triggers)) {
            array::thread_all(level.players, &function_294c9ea7, str_triggers);
        }
    }
}

// Namespace zm_towers_side_quests/zm_towers_side_quests
// Params 1, eflags: 0x0
// Checksum 0x56a28e, Offset: 0x1608
// Size: 0x13c
function function_294c9ea7(str_triggers) {
    level endon(#"end_game", #"cauldron_rotate_complete");
    self endon(#"disconnect");
    if (self flag::get(#"hash_481ca29c700e04dd")) {
        return;
    }
    t_entrance = trigger::wait_till(str_triggers, "targetname", self);
    while (true) {
        t_exit = trigger::wait_till(str_triggers, "targetname", self);
        if (t_exit != t_entrance && !(isdefined(self.var_62b59590) && self.var_62b59590) && zm_utility::is_player_valid(self, 0, 0)) {
            self flag::set(#"hash_481ca29c700e04dd");
            break;
        }
    }
}

// Namespace zm_towers_side_quests/zm_towers_side_quests
// Params 0, eflags: 0x0
// Checksum 0xb0f8f179, Offset: 0x1750
// Size: 0x388
function function_51817689() {
    level endon(#"end_game");
    while (true) {
        s_waitresult = level waittill(#"trap_kill");
        ai_victim = s_waitresult.e_victim;
        e_trap = s_waitresult.e_trap;
        e_player = e_trap.activated_by_player;
        if (isplayer(e_player) && isactor(ai_victim)) {
            str_archetype = ai_victim.archetype;
            var_1e137cec = ai_victim.subarchetype;
            switch (str_archetype) {
            case #"zombie":
                if (!isdefined(e_player.var_ea819a71)) {
                    e_player.var_ea819a71 = [];
                } else if (!isarray(e_player.var_ea819a71)) {
                    e_player.var_ea819a71 = array(e_player.var_ea819a71);
                }
                if (!isinarray(e_player.var_ea819a71, str_archetype)) {
                    e_player.var_ea819a71[e_player.var_ea819a71.size] = str_archetype;
                }
                break;
            case #"tiger":
                if (!isdefined(e_player.var_ea819a71)) {
                    e_player.var_ea819a71 = [];
                } else if (!isarray(e_player.var_ea819a71)) {
                    e_player.var_ea819a71 = array(e_player.var_ea819a71);
                }
                if (!isinarray(e_player.var_ea819a71, str_archetype)) {
                    e_player.var_ea819a71[e_player.var_ea819a71.size] = str_archetype;
                }
                break;
            case #"catalyst":
                if (!isdefined(e_player.var_ea819a71)) {
                    e_player.var_ea819a71 = [];
                } else if (!isarray(e_player.var_ea819a71)) {
                    e_player.var_ea819a71 = array(e_player.var_ea819a71);
                }
                if (!isinarray(e_player.var_ea819a71, var_1e137cec)) {
                    e_player.var_ea819a71[e_player.var_ea819a71.size] = var_1e137cec;
                }
                break;
            }
            if (e_player.var_ea819a71.size >= 6) {
                e_player flag::set(#"hash_23e1b3b7f7f46cb8");
            }
        }
    }
}

// Namespace zm_towers_side_quests/zm_towers_side_quests
// Params 0, eflags: 0x0
// Checksum 0xd51149b6, Offset: 0x1ae0
// Size: 0x14c
function arena_rock() {
    level endon(#"end_game");
    level.var_c1549bc8.var_7d942960 = 0;
    level function_5ca13573();
    callback::on_ai_killed(&function_4670ef4d);
    level function_c846dfc3();
    callback::remove_on_ai_killed(&function_4670ef4d);
    var_c2b730ca = getent("viking_salute", "targetname");
    var_c2b730ca thread function_3ce07a2b();
    level waittill(#"21_guns");
    level flag::set(#"hash_6205682540170b8");
    level clientfield::set("" + #"hash_39e6b14b9e5b0f3d", 1);
}

// Namespace zm_towers_side_quests/zm_towers_side_quests
// Params 0, eflags: 0x0
// Checksum 0xff821eb6, Offset: 0x1c38
// Size: 0xf2
function function_5ca13573() {
    level endon(#"end_game");
    var_bbd88248 = getent("firestorm_detector", "targetname");
    while (true) {
        var_6aa0de02 = var_bbd88248 waittill(#"damage");
        if (!level flag::get("special_round")) {
            continue;
        }
        if (namespace_52d8d460::function_a57b8fca(var_6aa0de02.weapon, 0)) {
            var_6aa0de02.attacker playsoundtoplayer("zmb_ee_gtr_sting_1", var_6aa0de02.attacker);
            return;
        }
    }
}

// Namespace zm_towers_side_quests/zm_towers_side_quests
// Params 0, eflags: 0x0
// Checksum 0x966919c9, Offset: 0x1d38
// Size: 0x11c
function function_4670ef4d() {
    if (!(isdefined(isplayer(self.attacker)) && isplayer(self.attacker))) {
        return;
    }
    e_attacker = self.attacker;
    if (!isinarray(e_attacker.aat, #"zm_aat_kill_o_watt")) {
        return;
    }
    if (self.damagelocation === "helmet" || self.damagelocation === "head" || self.damagelocation === "neck") {
        level notify(#"hash_5a1a76d189cf6925");
        level.var_c1549bc8.var_7d942960++;
        self playsound("zmb_ee_gtr_sting_" + level.var_c1549bc8.var_7d942960);
    }
}

// Namespace zm_towers_side_quests/zm_towers_side_quests
// Params 0, eflags: 0x0
// Checksum 0x4f41779f, Offset: 0x1e60
// Size: 0x5e
function function_c846dfc3() {
    level endon(#"end_game");
    while (true) {
        level waittill(#"hash_5a1a76d189cf6925");
        if (level.var_c1549bc8.var_7d942960 >= 8) {
            return;
        }
    }
}

// Namespace zm_towers_side_quests/zm_towers_side_quests
// Params 0, eflags: 0x0
// Checksum 0xa723caf2, Offset: 0x1ec8
// Size: 0x11c
function function_3ce07a2b() {
    level endon(#"game_end", #"21_guns");
    while (true) {
        s_waitresult = self waittill(#"damage");
        e_attacker = s_waitresult.attacker;
        if (!isplayer(e_attacker)) {
            continue;
        }
        if (namespace_52d8d460::function_a57b8fca(s_waitresult.weapon, 0) && e_attacker.var_c9d375dc.b_charged) {
            str_player_zone = s_waitresult.attacker.zone_name;
            if (str_player_zone == "zone_odin_top_floor") {
                e_attacker thread function_2ea36422();
                level notify(#"21_guns");
            }
        }
    }
}

// Namespace zm_towers_side_quests/zm_towers_side_quests
// Params 0, eflags: 0x0
// Checksum 0xf685ddbf, Offset: 0x1ff0
// Size: 0x64
function function_2ea36422() {
    self endon(#"disconnect");
    for (i = 1; i > 8; i++) {
        self playsound("zmb_ee_gtr_sting_" + i);
        wait 2;
    }
}

// Namespace zm_towers_side_quests/zm_towers_side_quests
// Params 0, eflags: 0x0
// Checksum 0x8a299c6d, Offset: 0x2060
// Size: 0x258
function function_5d0d1807() {
    a_mdl_fire = getentarray("elevated_flames", "targetname");
    level thread scene::init("special_rounds_scene_alt", "targetname");
    foreach (model in a_mdl_fire) {
        model clientfield::set("" + #"hash_5afda864f8b64f5c", 1);
    }
    level waittill(#"hash_7b9245ff51f3d4f7");
    a_scenes = struct::get_array("special_rounds_scene_alt", "targetname");
    foreach (s_scene in a_scenes) {
        playfx(level._effect[#"hash_3ecc995bb97331ac"], s_scene.origin);
        s_scene scene::stop(1);
    }
    foreach (model in a_mdl_fire) {
        model clientfield::set("" + #"hash_5afda864f8b64f5c", 0);
    }
}

// Namespace zm_towers_side_quests/zm_towers_side_quests
// Params 0, eflags: 0x0
// Checksum 0x9edcb7f6, Offset: 0x22c0
// Size: 0xdc
function function_1eddbf9e() {
    level endon(#"end_game", #"hash_205c15aeab8e14c4");
    var_c265cd7f = 0;
    while (true) {
        s_result = level waittill(#"hash_46267aa0f17a3c00");
        if (isdefined(s_result.var_8571ab76) && s_result.var_8571ab76) {
            var_c265cd7f++;
            if (var_c265cd7f == level.players.size) {
                level thread function_c74f4cf4();
            }
            continue;
        }
        var_c265cd7f--;
        level notify(#"hash_5bc627cff03bad5");
    }
}

// Namespace zm_towers_side_quests/zm_towers_side_quests
// Params 0, eflags: 0x0
// Checksum 0x22782e73, Offset: 0x23a8
// Size: 0xba
function function_c74f4cf4() {
    level endon(#"end_game", #"hash_5bc627cff03bad5");
    var_22fbe1cc = 0;
    while (true) {
        level waittill(#"end_of_round");
        var_22fbe1cc++;
        if (var_22fbe1cc >= 7) {
            level notify(#"hash_205c15aeab8e14c4");
            level thread zm_audio::sndmusicsystem_stopandflush();
            waitframe(1);
            level thread zm_audio::sndmusicsystem_playstate("ee_song_2");
            return;
        }
    }
}

// Namespace zm_towers_side_quests/zm_towers_side_quests
// Params 0, eflags: 0x0
// Checksum 0x38ae2860, Offset: 0x2470
// Size: 0x114
function function_def71ac3() {
    self endon(#"disconnect");
    level endon(#"hash_205c15aeab8e14c4");
    while (true) {
        self waittill(#"hash_29bd5874900989d6");
        if (self.var_b3122c84 == #"hash_4a67009994e6a476" && !(isdefined(self.var_a4ab5d88) && self.var_a4ab5d88)) {
            self.var_a4ab5d88 = 1;
            level notify(#"hash_46267aa0f17a3c00", {#var_8571ab76:1});
            continue;
        }
        if (isdefined(self.var_a4ab5d88) && self.var_a4ab5d88) {
            self.var_a4ab5d88 = 0;
            level notify(#"hash_46267aa0f17a3c00", {#var_8571ab76:0});
        }
    }
}

