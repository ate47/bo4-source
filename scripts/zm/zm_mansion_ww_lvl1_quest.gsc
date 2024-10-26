#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_customgame.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\flag_shared.gsc;

#namespace ww_lvl1_quest;

// Namespace ww_lvl1_quest/zm_mansion_ww_lvl1_quest
// Params 0, eflags: 0x2
// Checksum 0xb04072d9, Offset: 0x1c8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"ww_lvl1_quest", &__init__, &__main__, undefined);
}

// Namespace ww_lvl1_quest/zm_mansion_ww_lvl1_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x218
// Size: 0x4
function __init__() {
    
}

// Namespace ww_lvl1_quest/zm_mansion_ww_lvl1_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x9237d419, Offset: 0x228
// Size: 0x8c
function __main__() {
    if (zm_custom::function_901b751c(#"zmwonderweaponisenabled")) {
        level thread function_716f2019();
        return;
    }
    e_clip = getent("ww_case_clip", "targetname");
    if (isdefined(e_clip)) {
        e_clip delete();
    }
}

// Namespace ww_lvl1_quest/zm_mansion_ww_lvl1_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x38523e2e, Offset: 0x2c0
// Size: 0x1fc
function function_716f2019() {
    level flag::wait_till_any(array(#"power_on1", #"hash_2daf5bdda85cc660"));
    level flag::init(#"hash_7305c7f343dd8850");
    level flag::init(#"hash_51efb8481233c40d");
    level flag::init(#"hash_727b0a70b6f41db2");
    level flag::init(#"hash_6c453062178e1617");
    level flag::init(#"hash_4c1f880bcc6be2d0");
    level flag::init(#"hash_65224b2f37fb9446");
    level.s_ww_lock = struct::get("s_wonder_weapon_loc", "targetname");
    level.s_ww_lock zm_unitrigger::create(&function_7706457d, 46, &function_7310e1e0);
    level thread function_5d870c2c();
    level thread function_2325482e();
    init_case_locks();
    array::thread_all(level.var_79f3b34b, &init_lock);
    level thread function_8476e19();
    zm_weapons::function_603af7a8(level.var_f086136b);
}

// Namespace ww_lvl1_quest/zm_mansion_ww_lvl1_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xf9a31fd, Offset: 0x4c8
// Size: 0x5c
function function_5d870c2c() {
    scene::add_scene_func(#"p8_fxanim_zm_man_cryptex_case_bundle", &function_20d38ac0, "init");
    scene::init(#"p8_fxanim_zm_man_cryptex_case_bundle");
}

// Namespace ww_lvl1_quest/zm_mansion_ww_lvl1_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xfca42825, Offset: 0x530
// Size: 0x4c
function function_20d38ac0(a_ents) {
    var_955a6e11 = a_ents[#"prop 1"];
    if (isdefined(var_955a6e11)) {
        var_955a6e11 function_53e45f4e();
    }
}

// Namespace ww_lvl1_quest/zm_mansion_ww_lvl1_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x26cd0cbe, Offset: 0x588
// Size: 0x244
function function_53e45f4e() {
    level endon(#"ww_case_completed");
    self endon(#"death");
    var_8618ad82 = 1250 * 1250;
    while (true) {
        foreach (e_player in getplayers()) {
            if (distance2dsquared(e_player.origin, self.origin) <= var_8618ad82) {
                b_in_range = 1;
                break;
            }
        }
        if (isdefined(b_in_range) && b_in_range && !(isdefined(self clientfield::get("" + #"force_stream_model")) && self clientfield::get("" + #"force_stream_model"))) {
            self clientfield::set("" + #"force_stream_model", 1);
        } else if (!isdefined(b_in_range) && isdefined(self clientfield::get("" + #"force_stream_model")) && self clientfield::get("" + #"force_stream_model")) {
            self clientfield::set("" + #"force_stream_model", 0);
        }
        b_in_range = undefined;
        wait 2;
    }
}

// Namespace ww_lvl1_quest/zm_mansion_ww_lvl1_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xa2084780, Offset: 0x7d8
// Size: 0x15e
function init_case_locks() {
    a_s_locks = struct::get_array("ww_case_lock");
    foreach (s_lock in a_s_locks) {
        mdl_lock = util::spawn_model(s_lock.model, s_lock.origin, s_lock.angles);
        mdl_lock.script_int = s_lock.script_int;
        if (!isdefined(level.var_79f3b34b)) {
            level.var_79f3b34b = [];
        } else if (!isarray(level.var_79f3b34b)) {
            level.var_79f3b34b = array(level.var_79f3b34b);
        }
        level.var_79f3b34b[level.var_79f3b34b.size] = mdl_lock;
    }
}

// Namespace ww_lvl1_quest/zm_mansion_ww_lvl1_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xf0faaa95, Offset: 0x940
// Size: 0x208
function function_7706457d(e_player) {
    if (!level flag::get(#"hash_4c1f880bcc6be2d0")) {
        foreach (e_lock in level.var_79f3b34b) {
            if (zombie_utility::is_player_valid(e_player) && e_player function_8b4cc6ae(e_lock.origin, 10, 1, e_lock)) {
                str_prompt = zm_utility::function_d6046228(#"hash_170f427c6f774cc6", #"hash_182213d7353c3062");
                self sethintstringforplayer(e_player, str_prompt);
                return true;
            }
        }
        if (zombie_utility::is_player_valid(e_player) && e_player function_8b4cc6ae(level.s_ww_lock.origin, 50, 0)) {
            str_prompt = zm_utility::function_d6046228(#"hash_74088228890cabc3", #"hash_4428bea407adb029");
            self sethintstringforplayer(e_player, str_prompt);
            return true;
        }
    }
    self sethintstringforplayer(e_player, "");
    return true;
}

// Namespace ww_lvl1_quest/zm_mansion_ww_lvl1_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x8f5c2df7, Offset: 0xb50
// Size: 0x1cc
function function_7310e1e0() {
    level endon(#"ww_case_completed");
    while (true) {
        waitresult = self waittill(#"trigger");
        e_player = waitresult.activator;
        if (!level flag::get(#"hash_4c1f880bcc6be2d0")) {
            foreach (e_lock in level.var_79f3b34b) {
                if (zombie_utility::is_player_valid(e_player) && e_player function_8b4cc6ae(e_lock.origin, 10, 1, e_lock) && !(isdefined(self.var_86dbb82b) && self.var_86dbb82b)) {
                    e_lock lock_rotate();
                    break;
                }
            }
            if (zombie_utility::is_player_valid(e_player) && e_player function_8b4cc6ae(level.s_ww_lock.origin, 50, 0)) {
                level notify(#"hash_7ed0b257f8849c85");
            }
        }
    }
}

// Namespace ww_lvl1_quest/zm_mansion_ww_lvl1_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xc6f046de, Offset: 0xd28
// Size: 0xc6
function lock_rotate() {
    self endon(#"death", #"destroyed");
    self.var_86dbb82b = 1;
    self rotateroll(-90, 0.5);
    self playsound(#"hash_1902d49433a38eba");
    self notify(#"rotate_lock");
    self waittill(#"rotatedone");
    self playsound(#"hash_41879bbde78fcc85");
    self.var_86dbb82b = 0;
}

// Namespace ww_lvl1_quest/zm_mansion_ww_lvl1_quest
// Params 4, eflags: 0x1 linked
// Checksum 0xc48f6e2, Offset: 0xdf8
// Size: 0xac
function function_8b4cc6ae(origin, arc_angle_degrees = 90, do_trace, e_ignore) {
    arc_angle_degrees = absangleclamp360(arc_angle_degrees);
    dot = cos(arc_angle_degrees * 0.5);
    if (self util::is_player_looking_at(origin, dot, do_trace, e_ignore)) {
        return 1;
    }
    return 0;
}

// Namespace ww_lvl1_quest/zm_mansion_ww_lvl1_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x958d9aaf, Offset: 0xeb0
// Size: 0x1bc
function function_2325482e() {
    mdl_weapon = util::spawn_model(level.s_ww_lock.model, level.s_ww_lock.origin, level.s_ww_lock.angles);
    var_cb31d9aa = getent("trigger_lookat_ww_case", "targetname");
    var_cb31d9aa thread function_7e7626b5();
    level flag::wait_till(#"hash_65224b2f37fb9446");
    level notify(#"ww_case_completed");
    if (isdefined(var_cb31d9aa)) {
        var_cb31d9aa delete();
    }
    level thread zm_unitrigger::unregister_unitrigger(level.s_ww_lock.s_unitrigger);
    scene::play(#"p8_fxanim_zm_man_cryptex_case_bundle");
    level.s_ww_lock zm_unitrigger::create(&function_9ffdf1be, 64, &function_f4f7650b);
    level flag::wait_till("ww_obtained");
    level thread zm_unitrigger::unregister_unitrigger(level.s_ww_lock.s_unitrigger);
    mdl_weapon delete();
}

// Namespace ww_lvl1_quest/zm_mansion_ww_lvl1_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xe204b7e4, Offset: 0x1078
// Size: 0xc6
function function_7e7626b5() {
    self endon(#"death");
    level endon(#"ww_case_completed");
    while (true) {
        s_waitresult = self waittill(#"trigger");
        player = s_waitresult.activator;
        if (zombie_utility::is_player_valid(player)) {
            player thread zm_vo::function_a2bd5a0c(#"hash_28aa1fc068bb2e3b", 1);
            self delete();
        }
        wait 1;
    }
}

// Namespace ww_lvl1_quest/zm_mansion_ww_lvl1_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xac6263f1, Offset: 0x1148
// Size: 0xc2
function function_9ffdf1be(e_player) {
    if (!zm_utility::can_use(e_player, 1)) {
        return 0;
    }
    if (e_player zm_weapons::has_weapon_or_upgrade(level.var_f086136b) || e_player zm_weapons::has_weapon_or_upgrade(level.var_6fe89212) || e_player zm_weapons::has_weapon_or_upgrade(level.var_7b9ca97a)) {
        return 0;
    }
    self sethintstring(#"hash_660652361297f2ab");
    return 1;
}

// Namespace ww_lvl1_quest/zm_mansion_ww_lvl1_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x8504bc93, Offset: 0x1218
// Size: 0xe0
function function_f4f7650b() {
    level endon(#"ww_obtained");
    while (true) {
        waitresult = self waittill(#"trigger");
        e_player = waitresult.activator;
        if (zm_utility::can_use(e_player, 1)) {
            e_player zm_weapons::weapon_give(level.var_f086136b);
            e_player thread zm_vo::function_a2bd5a0c(#"hash_74ba2bf90063e6c6", 1);
            level flag::set("ww_obtained");
        }
    }
}

// Namespace ww_lvl1_quest/zm_mansion_ww_lvl1_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x6c99b0b, Offset: 0x1300
// Size: 0x1b4
function init_lock() {
    level endon(#"ww_case_completed");
    switch (self.script_int) {
    case 0:
        var_1e30344b = #"hash_7305c7f343dd8850";
        break;
    case 1:
        var_1e30344b = #"hash_51efb8481233c40d";
        break;
    case 2:
        var_1e30344b = #"hash_727b0a70b6f41db2";
        break;
    case 3:
        var_1e30344b = #"hash_6c453062178e1617";
        break;
    }
    a_n_solutions = array(0, 1, 2, 3);
    n_solution = array::random(a_n_solutions);
    arrayremovevalue(a_n_solutions, n_solution);
    self.n_solution = n_solution;
    self thread function_175e4696(var_1e30344b);
    self thread function_4e833729();
    var_3aadd17 = array::random(a_n_solutions);
    self thread scramble_lock(var_3aadd17);
}

// Namespace ww_lvl1_quest/zm_mansion_ww_lvl1_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xe522fcf1, Offset: 0x14c0
// Size: 0xee
function scramble_lock(var_3aadd17) {
    for (i = 0; i < var_3aadd17; i++) {
        self notify(#"rotate_lock");
        self playsound(#"hash_559df0c493fb2378");
        self rotateroll(-90, 0.5);
        self waittill(#"rotatedone");
        self stopsound(#"hash_559df0c493fb2378");
        self playsound(#"hash_1a44db892b73701b");
    }
    level notify("ww_lock_scrambled_" + self.script_int);
}

// Namespace ww_lvl1_quest/zm_mansion_ww_lvl1_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x486ca92b, Offset: 0x15b8
// Size: 0x120
function function_175e4696(var_1e30344b) {
    level endon(#"ww_case_completed");
    self.n_rotation = 0;
    while (true) {
        self waittill(#"rotate_lock");
        self.n_rotation += 1;
        if (self.n_rotation == 4) {
            self.n_rotation = 0;
        }
        if (self.n_rotation == self.n_solution && !level flag::get(var_1e30344b)) {
            level flag::set(var_1e30344b);
            continue;
        }
        if (self.n_rotation != self.n_solution && level flag::get(var_1e30344b)) {
            level flag::clear(var_1e30344b);
        }
    }
}

// Namespace ww_lvl1_quest/zm_mansion_ww_lvl1_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x7b0878e4, Offset: 0x16e0
// Size: 0x1c8
function function_8476e19() {
    level endon(#"ww_case_completed");
    while (true) {
        level waittill(#"hash_7ed0b257f8849c85");
        level flag::set(#"hash_4c1f880bcc6be2d0");
        if (flag::get_all(array(#"hash_7305c7f343dd8850", #"hash_51efb8481233c40d", #"hash_727b0a70b6f41db2", #"hash_6c453062178e1617"))) {
            level flag::set(#"hash_65224b2f37fb9446");
            continue;
        }
        foreach (e_lock in level.var_79f3b34b) {
            e_lock thread scramble_lock(randomintrangeinclusive(1, 4));
        }
        level util::waittill_multiple("ww_lock_scrambled_0", "ww_lock_scrambled_1", "ww_lock_scrambled_2", "ww_lock_scrambled_3");
        level flag::clear(#"hash_4c1f880bcc6be2d0");
    }
}

// Namespace ww_lvl1_quest/zm_mansion_ww_lvl1_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x11c8218f, Offset: 0x18b0
// Size: 0x12c
function function_4e833729() {
    a_s_symbols = struct::get_array("ww_lock_solution_" + self.script_int);
    foreach (s_symbol in a_s_symbols) {
        if (s_symbol.script_int == self.n_solution) {
            mdl_symbol = util::spawn_model(s_symbol.model, s_symbol.origin, s_symbol.angles);
        }
    }
    level flag::wait_till(#"hash_65224b2f37fb9446");
    if (isdefined(mdl_symbol)) {
        mdl_symbol delete();
    }
}

