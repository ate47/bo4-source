// Atian COD Tools GSC decompiler test
#using scripts\zm\zm_mansion_util.gsc;
#using scripts\zm\zm_mansion_pap_quest.gsc;
#using scripts\zm\ai\zm_ai_nosferatu.gsc;
#using script_387eab232fe22983;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm_common\zm_ui_inventory.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_transformation.gsc;
#using scripts\zm_common\zm_sq.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_characters.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm\ai\zm_ai_bat.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_customgame.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_b6ca3ccc;

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x1 linked
// Checksum 0x3953a79c, Offset: 0x628
// Size: 0x2bc
function init() {
    clientfield::register("scriptmover", "" + #"falling_leaves", 8000, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_34321e7ca580e772", 8000, 1, "int");
    clientfield::register("scriptmover", "" + #"stick_fire", 8000, 2, "int");
    clientfield::register("scriptmover", "" + #"stone_rise", 8000, 1, "counter");
    clientfield::register("toplayer", "" + #"player_dragged", 8000, 1, "int");
    clientfield::register("toplayer", "" + #"hash_4be98315796ad666", 8000, 1, "int");
    clientfield::register("allplayers", "" + #"sacrifice_player", 8000, 1, "int");
    clientfield::register("allplayers", "" + #"hash_30aa04edc476253f", 8000, 1, "int");
    register_steps();
    init_flags();
    function_c6e2a4fd();
    if (zm_utility::is_ee_enabled()) {
        if (zm_custom::function_901b751c(#"hash_3c5363541b97ca3e") && zm_custom::function_901b751c(#"zmpapenabled") != 2) {
            level thread start_stick_man();
            level thread function_2c554640();
        }
    }
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x1 linked
// Checksum 0x725a58bc, Offset: 0x8f0
// Size: 0xcc
function function_c6e2a4fd() {
    level.var_d70578ff = [];
    level.player_out_of_playable_area_override = &function_8b12e689;
    mdl_stone = getent("health_stone", "targetname");
    mdl_stone setinvisibletoall();
    mdl_stone.v_start_org = mdl_stone.origin;
    var_fe0f27ef = getentarray("living_tree", "targetname");
    array::thread_all(var_fe0f27ef, &function_7c9b48a9);
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x1 linked
// Checksum 0x5b087673, Offset: 0x9c8
// Size: 0x1e4
function init_flags() {
    level flag::init(#"portrait_found");
    level flag::init(#"stick_done");
    level flag::init(#"stick_ready");
    level flag::init(#"stick_drag");
    level flag::init(#"stick_rise");
    level flag::init(#"stick_hide");
    level flag::init(#"hash_7ffc33bb45377f5e");
    level flag::init(#"stone_visible");
    level flag::init(#"cemetery_defend");
    level flag::init(#"hash_684b700932f4018f");
    level flag::init(#"hash_6100d5ec10bed5cc");
    level flag::init(#"hash_12f4b41ff140e181");
    level flag::init(#"hash_6a70f9021505a71e");
    level flag::init(#"cemetery_done");
    level flag::init(#"cemetery_open");
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x1 linked
// Checksum 0x364f0987, Offset: 0xbb8
// Size: 0x44
function start_stick_man() {
    level flag::wait_till(#"open_pap");
    zm_sq::start(#"hash_578d0d7709a00e6e");
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x1 linked
// Checksum 0xcfc214b3, Offset: 0xc08
// Size: 0x124
function register_steps() {
    zm_sq::register(#"hash_578d0d7709a00e6e", #"step_1", #"hash_6e38611b5382ee7f", &init_step_1, &cleanup_step_1);
    zm_sq::register(#"hash_578d0d7709a00e6e", #"step_2", #"hash_6e38621b5382f032", &init_step_2, &cleanup_step_2);
    zm_sq::register(#"hash_578d0d7709a00e6e", #"step_3", #"hash_6e38631b5382f1e5", &init_step_3, &cleanup_step_3);
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 1, eflags: 0x1 linked
// Checksum 0xd3c7674e, Offset: 0xd38
// Size: 0x17c
function init_step_1(var_a276c861) {
    mdl_stone = getent("gazing_stone_cellar", "targetname");
    var_47323b73 = mdl_stone zm_unitrigger::create(undefined, 64, &function_55b79f54);
    var_47323b73.str_loc = "greenhouse";
    var_47323b73.var_f0e6c7a2 = mdl_stone;
    if (!var_47323b73.var_f0e6c7a2 flag::exists(#"flag_gazing_stone_in_use")) {
        var_47323b73.var_f0e6c7a2 flag::init(#"flag_gazing_stone_in_use");
    }
    if (!var_a276c861) {
        level flag::wait_till(#"gazed_greenhouse");
        level zm_ui_inventory::function_7df6bb60(#"hash_7b00694a8b213123", 1);
        exploder::exploder("fxexp_leaves_fall_dead");
        level thread init_sticks();
        level flag::wait_till(#"stick_done");
    }
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 2, eflags: 0x1 linked
// Checksum 0xdade489e, Offset: 0xec0
// Size: 0x28c
function cleanup_step_1(var_a276c861, var_19e802fa) {
    level flag::set(#"gazed_greenhouse");
    level flag::set(#"stick_done");
    e_bush = getent("burning_man_shrub", "targetname");
    if (isdefined(e_bush)) {
        e_bush delete();
    }
    if (var_a276c861 || var_19e802fa) {
        level notify(#"hash_425e8c53dcecb85d");
        s_scene = struct::get(#"p8_fxanim_zm_man_wm_01_bundle", "scriptbundlename");
        s_scene thread scene::play("Shot 1");
        var_fe0f27ef = getentarray("living_tree", "targetname");
        foreach (var_3303f46 in var_fe0f27ef) {
            var_3303f46 clientfield::set("" + #"hash_34321e7ca580e772", 0);
            var_3303f46 clientfield::set("" + #"falling_leaves", 1);
            if (isdefined(var_3303f46.var_8be24fed)) {
                var_3303f46.var_8be24fed delete();
            }
        }
        array::run_all(getentarray("stick_man_stick", "script_noteworthy"), &delete);
        hidemiscmodels("misc_sticks");
    }
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x1 linked
// Checksum 0x9dbf78f1, Offset: 0x1158
// Size: 0x198
function function_55b79f54() {
    while (true) {
        waitresult = self waittill(#"trigger");
        player = waitresult.activator;
        if (!isalive(player) || !zm_utility::can_use(player) || isdefined(player.var_d049df11) && player.var_d049df11 || distancesquared(groundtrace(player.origin, player.origin + (0, 0, -128), 0, player)[#"position"], player.origin) > 16) {
            continue;
        }
        level thread mansion_pap::function_9e7129d2(player, self.stub.var_f0e6c7a2, 15, "stick");
        player thread mansion_util::function_58dfa337(15);
        player thread mansion_util::function_a113df82(18);
        level flag::set(#"gazed_greenhouse");
    }
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x1 linked
// Checksum 0xf3a59301, Offset: 0x12f8
// Size: 0x16c
function init_sticks() {
    var_e036b66c = getentarray("stick_man_stick", "script_noteworthy");
    foreach (var_1f23d8cf in var_e036b66c) {
        var_1f23d8cf.s_form = struct::get(var_1f23d8cf.target);
        var_1f23d8cf.s_fall = struct::get(var_1f23d8cf.targetname);
        var_1f23d8cf thread function_e8f819b0();
    }
    level.var_94975706 = 0;
    level waittill(#"hash_68c10418963ac1fc");
    array::run_all(getentarray("stick_man_stick", "script_noteworthy"), &delete);
    hidemiscmodels("misc_sticks");
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x1 linked
// Checksum 0xf62c2e90, Offset: 0x1470
// Size: 0x1da
function function_e8f819b0() {
    level endon(#"stick_done");
    self.health = 99999;
    self val::set("stick", "takedamage", 1);
    self solid();
    while (true) {
        s_notify = self waittill(#"damage");
        self.health = self.health + s_notify.amount;
        if (isplayer(s_notify.attacker)) {
            self stoploopsound();
            self hide();
            str_scene = "p8_fxanim_zm_man_wm_stick_0" + self.script_int + "_bundle";
            s_scene = struct::get(str_scene, "scriptbundlename");
            s_scene scene::play("Shot 1");
            s_target = struct::get(self.target);
            var_47323b73 = s_target zm_unitrigger::create(undefined, (92, 92, 100), &function_ff1dea25);
            var_47323b73.var_1f23d8cf = self;
            break;
        }
    }
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x1 linked
// Checksum 0xa6af9c4b, Offset: 0x1658
// Size: 0xb8
function function_ff1dea25() {
    level endon(#"cemetery_done");
    while (true) {
        waitresult = self waittill(#"trigger");
        player = waitresult.activator;
        if (!zm_utility::can_use(player)) {
            continue;
        }
        level thread function_1ca135cf(self.stub.var_1f23d8cf.script_int);
        zm_unitrigger::unregister_unitrigger(self.stub);
    }
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 1, eflags: 0x1 linked
// Checksum 0x93e9824e, Offset: 0x1718
// Size: 0x1a4
function function_1ca135cf(n_int) {
    level.var_94975706++;
    if (level.var_94975706 >= 5) {
        level flag::set(#"stick_done");
    }
    str_scene = "p8_fxanim_zm_man_wm_stick_0" + n_int + "_bundle";
    scene::add_scene_func(str_scene, &function_4b15ba35, "Shot 2");
    s_scene = struct::get(str_scene, "scriptbundlename");
    s_scene scene::play("Shot 2");
    if (level.var_94975706 == 1) {
        e_bush = getent("burning_man_shrub", "targetname");
        e_bush clientfield::set("" + #"stick_fire", 1);
        wait(1);
        e_bush clientfield::set("" + #"stick_fire", 0);
        waitframe(1);
        e_bush delete();
    }
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 1, eflags: 0x1 linked
// Checksum 0xf1386e2c, Offset: 0x18c8
// Size: 0x8c
function function_4b15ba35(a_ents) {
    level endon(#"hash_7ffc33bb45377f5e");
    level waittill(#"hash_68c10418963ac1fc", #"hash_425e8c53dcecb85d");
    if (isdefined(a_ents[#"prop 1"])) {
        a_ents[#"prop 1"] delete();
    }
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x1 linked
// Checksum 0xfa0e54d7, Offset: 0x1960
// Size: 0x19c
function function_7c9b48a9() {
    level endon(#"stick_done");
    level flag::wait_till(#"all_players_spawned");
    self clientfield::set("" + #"hash_34321e7ca580e772", 1);
    level flag::wait_till(#"gazed_greenhouse");
    self.var_8be24fed = spawn("trigger_radius_new", self.origin, 0, 641);
    self.var_8be24fed endon(#"death");
    if (isdefined(self.script_noteworthy) && self.script_noteworthy == "entrance_left_t") {
        self function_f2071006();
    } else {
        self.var_8be24fed waittill(#"trigger");
    }
    self clientfield::set("" + #"hash_34321e7ca580e772", 0);
    self clientfield::set("" + #"falling_leaves", 1);
    self.var_8be24fed delete();
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x1 linked
// Checksum 0xaa1fa6ce, Offset: 0x1b08
// Size: 0xce
function function_f2071006() {
    self.var_8be24fed endon(#"death");
    while (true) {
        s_result = self.var_8be24fed waittill(#"trigger");
        if (s_result.activator util::is_looking_at(self, 0.61, 1)) {
            return;
        }
        if (distance2dsquared(s_result.activator.origin, self.origin) <= 242064) {
            return;
        }
    }
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 1, eflags: 0x1 linked
// Checksum 0xef4e0f5d, Offset: 0x1be0
// Size: 0x184
function init_step_2(var_a276c861) {
    level zm_ui_inventory::function_7df6bb60(#"hash_7b006a4a8b2132d6", 1);
    if (!var_a276c861) {
        callback::on_disconnect(&function_44a7951d);
        callback::on_player_killed(&function_44a7951d);
        callback::on_laststand(&function_44a7951d);
        profilestart();
        level function_2345b68a();
        profilestop();
        level thread function_d8ca90b7();
        level flag::wait_till(#"stick_rise");
    }
    level zm_ui_inventory::function_7df6bb60(#"hash_7b006b4a8b213489", 1);
    if (!var_a276c861) {
        level thread function_9e01297e();
        level thread stick_guide();
        level thread function_6f6fef08();
        level flag::wait_till(#"stone_visible");
    }
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 2, eflags: 0x1 linked
// Checksum 0x9f73e9ba, Offset: 0x1d70
// Size: 0x1dc
function cleanup_step_2(var_5ea5c94d, ended_early) {
    level flag::set(#"stick_rise");
    level flag::set(#"stone_visible");
    if (isdefined(level.var_ead1145a)) {
        level.var_ead1145a setvisibletoall();
    }
    if (isdefined(level.e_guide) && isdefined(level.e_guide.mdl_head)) {
        if (isdefined(level.e_guide.var_c176969a)) {
            level.e_guide.var_c176969a scene::stop();
            level.e_guide.var_c176969a delete();
        }
        level.e_guide scene::stop();
        level.e_guide.mdl_head delete();
        level.e_guide delete();
    }
    if (var_5ea5c94d || ended_early) {
        level thread function_6f6fef08();
    }
    if (!var_5ea5c94d) {
        callback::remove_on_disconnect(&function_44a7951d);
        callback::remove_on_player_killed(&function_44a7951d);
        callback::remove_on_laststand(&function_44a7951d);
    }
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x5 linked
// Checksum 0xcbe6f55e, Offset: 0x1f58
// Size: 0x3fc
function private function_2345b68a() {
    foreach (mdl_pic in level.var_d70578ff) {
        if (isdefined(mdl_pic.s_trig.s_unitrigger)) {
            level thread zm_unitrigger::unregister_unitrigger(mdl_pic.s_trig.s_unitrigger);
        }
        mdl_pic.mdl_bd setmodel(mdl_pic.var_3916fb8b);
    }
    var_6adbf325 = getent("pic_gypsy", "targetname");
    var_1b2ca394 = getent("pic_brigadier", "targetname");
    var_3c9ce3a9 = getent("pic_butler", "targetname");
    var_36ebb951 = getent("pic_gunslinger", "targetname");
    level.var_ead1145a = function_8a51807c();
    level.var_ead1145a thread function_4aa24b78();
    level.var_ead1145a thread function_c5c7d880();
    switch (level.var_ead1145a.str_name) {
    case #"pic_gypsy":
        s_loc = var_6adbf325.s_loc;
        s_trig = struct::get(s_loc.target);
        mdl_pic = var_6adbf325;
        break;
    case #"pic_brigadier":
        s_loc = var_1b2ca394.s_loc;
        s_trig = struct::get(s_loc.target);
        mdl_pic = var_1b2ca394;
        break;
    case #"pic_butler":
        s_loc = var_3c9ce3a9.s_loc;
        s_trig = struct::get(s_loc.target);
        mdl_pic = var_3c9ce3a9;
        break;
    case #"pic_gunslinger":
        s_loc = var_36ebb951.s_loc;
        s_trig = struct::get(s_loc.target);
        mdl_pic = var_36ebb951;
        break;
    }
    level.var_ead1145a.var_d62b4d4 = s_loc;
    mdl_pic.mdl_bd setmodel(#"p8_zm_headstone_engraving_1912");
    level.var_76c1632f = s_trig zm_unitrigger::create(undefined, (64, 64, 100), &function_6ae66179);
    level.var_76c1632f.var_d62b4d4 = s_loc;
    /#
        sphere(s_loc.origin + (0, 0, 60), 24, (0, 1, 1), 1, 0, 16, 10000);
    #/
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x5 linked
// Checksum 0x30448702, Offset: 0x2360
// Size: 0xd4
function private function_44a7951d() {
    if (self === level.var_ead1145a) {
        self notify(#"hash_1544918b5f670dae");
        self setvisibletoall();
        if (isdefined(self.e_linkto)) {
            self.e_linkto delete();
        }
        if (isdefined(level.var_76c1632f)) {
            level zm_unitrigger::unregister_unitrigger(level.var_76c1632f);
            level.var_76c1632f = undefined;
        }
        self thread function_a0a113c9("death");
        level thread function_36d70cbd();
    }
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x5 linked
// Checksum 0x4d72e0c6, Offset: 0x2440
// Size: 0xa4
function private function_4aa24b78() {
    self notify("5a517bbed613c3ee");
    self endon("5a517bbed613c3ee");
    level endon(#"stone_visible");
    self endon(#"player_downed", #"death", #"hash_1544918b5f670dae");
    if (self === level.var_ead1145a) {
        self waittill(#"_zombie_game_over");
        self thread function_a0a113c9("death");
    }
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x5 linked
// Checksum 0xc5659002, Offset: 0x24f0
// Size: 0x4cc
function private function_36d70cbd() {
    self notify("2c7398c281ee6695");
    self endon("2c7398c281ee6695");
    level endon(#"stone_visible");
    if (level flag::get(#"stick_drag")) {
        level flag::clear(#"stick_drag");
    }
    if (isdefined(level.e_stick_fire)) {
        if (level.e_stick_fire clientfield::get("" + #"stick_fire")) {
            level.e_stick_fire clientfield::set("" + #"stick_fire", 0);
        }
        level.e_stick_fire delete();
        level.e_stick_fire = undefined;
    }
    level.var_ead1145a = undefined;
    level function_2345b68a();
    mdl_stone = getent("health_stone", "targetname");
    if (mdl_stone.origin !== mdl_stone.v_start_org) {
        mdl_stone.origin = mdl_stone.v_start_org;
    }
    if (level flag::get(#"hash_7ffc33bb45377f5e")) {
        level flag::clear(#"hash_7ffc33bb45377f5e");
    }
    if (isdefined(level.var_d2ff3b06)) {
        zm_unitrigger::unregister_unitrigger(level.var_d2ff3b06);
        level.var_d2ff3b06 = undefined;
    }
    if (isdefined(level.var_e34d55ef) && isdefined(level.var_e34d55ef.var_71c444c7)) {
        level.var_e34d55ef setmodel(level.var_e34d55ef.var_71c444c7);
    }
    s_scene = struct::get(#"p8_fxanim_zm_man_wm_01_bundle", "scriptbundlename");
    if (isdefined(s_scene)) {
        s_scene thread scene::play("Shot 1");
    }
    if (level flag::get(#"stick_rise")) {
        level flag::clear(#"stick_rise");
        if (level flag::get(#"stick_hide")) {
            level flag::clear(#"stick_hide");
        }
        level zm_ui_inventory::function_7df6bb60(#"hash_7b006b4a8b213489", 0);
        level thread function_d8ca90b7();
        if (isdefined(level.e_guide) && isdefined(level.e_guide.mdl_head)) {
            if (isdefined(level.e_guide.var_c176969a)) {
                level.e_guide.var_c176969a scene::stop();
                level.e_guide.var_c176969a delete();
            }
            level.e_guide scene::stop();
            level.e_guide.mdl_head delete();
            level.e_guide delete();
        }
        level flag::wait_till(#"stick_rise");
        level zm_ui_inventory::function_7df6bb60(#"hash_7b006b4a8b213489", 1);
        level thread function_9e01297e();
        level thread stick_guide();
        return;
    }
    level thread function_d8ca90b7();
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x5 linked
// Checksum 0x1b746967, Offset: 0x29c8
// Size: 0x166
function private function_8a51807c() {
    level flag::wait_till(#"all_players_spawned");
    player = undefined;
    a_players = getplayers();
    if (a_players.size > 1) {
        var_5eb47b1d = util::get_active_players();
        player = array::random(var_5eb47b1d);
    }
    if (!isdefined(player)) {
        player = a_players[0];
    }
    switch (player.characterindex) {
    case 9:
        player.str_name = "pic_gypsy";
        break;
    case 10:
        player.str_name = "pic_brigadier";
        break;
    case 11:
        player.str_name = "pic_gunslinger";
        break;
    case 12:
        player.str_name = "pic_butler";
        break;
    }
    return player;
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x5 linked
// Checksum 0xbdea5eb6, Offset: 0x2b38
// Size: 0x1e8
function private function_d8ca90b7() {
    level endon(#"stick_drag");
    level.var_ead1145a endon(#"disconnect", #"hash_1544918b5f670dae");
    level flag::wait_till(#"hash_7ffc33bb45377f5e");
    while (true) {
        level flag::wait_till(#"stick_ready");
        s_loc = struct::get("stick_drag_loc");
        a_e_drag = getentarray("entity_drag", "targetname");
        e_drag = array::get_all_closest(s_loc.origin, a_e_drag)[0];
        if (isdefined(e_drag) && distance(e_drag.origin, s_loc.origin) <= s_loc.radius) {
            var_7a7793c6 = struct::get("wicker_fire_pos", "targetname");
            level.e_stick_fire = util::spawn_model("tag_origin", var_7a7793c6.origin);
            util::wait_network_frame();
            if (isdefined(level.e_stick_fire)) {
                level.e_stick_fire thread function_959fcbff(level.var_ead1145a);
                return;
            }
        }
        wait(1);
    }
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 1, eflags: 0x5 linked
// Checksum 0x908eeb, Offset: 0x2d28
// Size: 0xba4
function private function_959fcbff(player) {
    player endon(#"disconnect");
    level flag::set(#"stick_drag");
    self clientfield::set("" + #"stick_fire", 2);
    if (isdefined(level.var_d2ff3b06)) {
        zm_unitrigger::unregister_unitrigger(level.var_d2ff3b06);
        level.var_d2ff3b06 = undefined;
    }
    wait(2);
    level.var_e34d55ef setmodel(#"p8_zm_man_dead_tree_branches_burned");
    if (player zm_characters::is_character(array(#"hash_5ebf024e1559c04a"))) {
        player thread function_3ce20299();
    } else {
        player thread function_eabb32ca();
    }
    player val::set(#"hash_3c30825a658c87fd", "show_hud", 0);
    player playsound(#"hash_64796b1ee9c1a0df");
    player clientfield::set_to_player("" + #"hash_4be98315796ad666", 1);
    player thread lui::screen_fade_out(0.9, (0.8, 0.24, 0.15));
    if (isdefined(level.var_9661fac0)) {
        level.var_9661fac0 = undefined;
        var_3add8e25 = struct::get("s_stick_scene", "targetname");
        var_3add8e25 scene::stop(level.var_9661fac0);
    }
    if (!isdefined(player.e_linkto)) {
        player.e_linkto = util::spawn_model("tag_origin", player.origin, player.angles);
        player playerlinkto(player.e_linkto, "tag_origin", 0, 0, 0, 0, 0);
    }
    player.e_linkto clientfield::set("" + #"hash_69b312bcaae6308b", 1);
    player clientfield::set("" + #"hash_30aa04edc476253f", 1);
    player.e_linkto movez(-80, 1.5);
    wait(0.375);
    a_players = getplayers();
    arrayremovevalue(a_players, player);
    foreach (e_player in a_players) {
        player setinvisibletoplayer(e_player, 1);
    }
    player thread function_25a79bc1();
    player.e_linkto waittilltimeout(1.5 - 0.375, #"movedone");
    player.e_linkto clientfield::set("" + #"hash_69b312bcaae6308b", 0);
    player clientfield::set("" + #"hash_30aa04edc476253f", 0);
    s_pos = struct::get("wm_ht_pos", "targetname");
    player.e_linkto.origin = s_pos.origin;
    player setorigin(player.e_linkto.origin);
    player.e_linkto.angles = s_pos.angles;
    player setplayerangles(player.e_linkto.angles);
    player thread function_3b71b7a7();
    self clientfield::set("" + #"stick_fire", 0);
    self delete();
    level flag::clear(#"stick_drag");
    s_pos = struct::get("wm_ht_pos", "targetname");
    s_end_pos = struct::get(s_pos.target, "targetname");
    if (!isdefined(player.e_linkto)) {
        player.e_linkto = util::spawn_model("tag_origin", player.origin, player.angles);
        player playerlinkto(player.e_linkto, "tag_origin", 0, 0, 0, 0, 0);
    }
    exploder::exploder("exp_lgt_hell_tunnel");
    player thread lui::screen_fade_in(1, (0.8, 0.24, 0.15));
    player.e_linkto moveto(s_end_pos.origin, 3);
    player.e_linkto rotateroll(120, 3);
    player thread function_e84d4271();
    wait(2);
    player thread lui::screen_fade_out(1, (0.8, 0.24, 0.15));
    level waittilltimeout(10, #"hash_132b5b79b9aeaf9e");
    player notify(#"tunnel_complete");
    level flag::set(#"stick_rise");
    if (!isdefined(player.e_linkto)) {
        player.e_linkto = util::spawn_model("tag_origin", player.origin, player.angles);
        player playerlinkto(player.e_linkto, "tag_origin", 0, 0, 0, 0, 0);
    }
    s_rise = struct::get(player.var_d62b4d4.target);
    player clientfield::set_to_player("" + #"hash_4be98315796ad666", 0);
    player clientfield::set_to_player("" + #"player_dragged", 1);
    player.var_7ebdb2c9 = 1;
    player.e_linkto.origin = s_rise.origin + (0, 0, -32);
    player.e_linkto.angles = s_rise.angles;
    player thread lui::screen_fade_in(1.35, (0.8, 0.24, 0.15));
    player.e_linkto moveto(s_rise.origin, 1.5);
    player.e_linkto waittilltimeout(1.5, #"movedone");
    player unlink();
    player.e_linkto delete();
    player.var_d62b4d4 struct::delete();
    player val::reset(#"hash_3c30825a658c87fd", "show_hud");
    player.var_fd49b4a9 = undefined;
    player.var_f22c83f5 = undefined;
    player val::reset("stick_man", "takedamage");
    player val::reset("stick_man", "ignoreme");
    player enableweapons();
    player allowcrouch(1);
    player allowprone(1);
    level flag::clear(#"stick_ready");
    level flag::set(#"stick_hide");
    exploder::stop_exploder("exp_lgt_hell_tunnel");
    player thread function_614e461();
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x5 linked
// Checksum 0xf5c3b1cc, Offset: 0x38d8
// Size: 0xe0
function private function_3b71b7a7() {
    self endon(#"disconnect");
    self setvisibletoall();
    wait(0.25);
    a_players = getplayers();
    arrayremovevalue(a_players, self);
    foreach (e_player in a_players) {
        self setinvisibletoplayer(e_player, 1);
    }
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x5 linked
// Checksum 0xe02bc902, Offset: 0x39c0
// Size: 0x154
function private function_25a79bc1() {
    level endon(#"stone_visible");
    self endon(#"player_downed", #"death", #"hash_1544918b5f670dae");
    while (true) {
        self waittill(#"fasttravel_over", #"hash_3e4335abc3d58a0b", #"hash_55489b8cb6c75352");
        if (self !== level.var_ead1145a) {
            return;
        }
        a_players = getplayers();
        arrayremovevalue(a_players, self);
        foreach (e_player in a_players) {
            self setinvisibletoplayer(e_player, 1);
        }
    }
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x5 linked
// Checksum 0xe10b3bcc, Offset: 0x3b20
// Size: 0xa0
function private function_3ce20299() {
    self endon(#"death");
    self zm_vo::vo_say(#"hash_39bc8bd7eaa531d5", 1.5, 1, 9999, 1, 1, 1);
    self zm_vo::vo_say(#"hash_7f6178afe0059ebf", 0, 1, 9999, 1, 1, 1);
    level notify(#"hash_132b5b79b9aeaf9e");
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x5 linked
// Checksum 0x365a2ac7, Offset: 0x3bc8
// Size: 0xa8
function private function_eabb32ca() {
    self endon(#"death");
    n_char_index = self zm_characters::function_d35e4c92();
    self.var_aa24164d = #"hash_74d6f512c6c0b04c" + self.characterindex + "_0";
    self zm_vo::vo_say(self.var_aa24164d, 1.5, 1, 9999, 1, 1, 1);
    level notify(#"hash_132b5b79b9aeaf9e");
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x5 linked
// Checksum 0xb30b56ec, Offset: 0x3c78
// Size: 0x228
function private function_9e01297e() {
    var_7e2d2356 = getent("stick_guide", "targetname");
    while (!isdefined(level.e_guide)) {
        level.e_guide = util::spawn_model("c_t8_zmb_dlc1_catherine_ghost_body", var_7e2d2356.origin, var_7e2d2356.angles);
        waitframe(1);
    }
    level.e_guide.mdl_head = util::spawn_model("c_t8_zmb_dlc1_catherine_ghost_head", level.e_guide.origin, level.e_guide.angles);
    level.e_guide.mdl_head linkto(level.e_guide);
    level.e_guide clientfield::set("" + #"ghost_trail", 1);
    level.e_guide playsound(#"hash_4826261b01f96036");
    level.e_guide playloopsound(#"hash_298631572be3dd79");
    a_players = getplayers();
    arrayremovevalue(a_players, level.var_ead1145a);
    foreach (e_player in a_players) {
        e_player thread function_e7144c05();
    }
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x5 linked
// Checksum 0x20485fbb, Offset: 0x3ea8
// Size: 0xa6
function private function_e7144c05() {
    self endon(#"disconnect");
    level.e_guide endon(#"death");
    level.e_guide.mdl_head endon(#"death");
    while (true) {
        level.e_guide setinvisibletoplayer(self, 1);
        level.e_guide.mdl_head setinvisibletoplayer(self, 1);
        waitframe(1);
    }
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x5 linked
// Checksum 0xfd2eff24, Offset: 0x3f58
// Size: 0x58
function private function_e84d4271() {
    self endon(#"disconnect", #"tunnel_complete");
    while (true) {
        self playrumbleonentity("hell_tube_rumble");
        wait(0.3);
    }
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x5 linked
// Checksum 0xce7d2c46, Offset: 0x3fb8
// Size: 0x144
function private function_614e461() {
    self endon(#"death");
    self zm_vo::function_a2bd5a0c(#"hash_56b2b832af39a128", 0, 1, 9999, 1, 1);
    var_6a01d8dc = self zm_characters::function_d35e4c92();
    if (var_6a01d8dc != 12) {
        self zm_vo::function_a2bd5a0c(#"hash_13b42abbc5ae2147", 0, 1, 9999, 1, 1);
        return;
    }
    self zm_vo::vo_say(#"hash_68607f486f39f53f", 0, 1, 9999, 1, 1);
    self zm_vo::vo_say(#"hash_68607e486f39f38c", 0, 1, 9999, 1, 1);
    self zm_vo::vo_say(#"hash_686081486f39f8a5", 0, 1, 9999, 1, 1);
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x1 linked
// Checksum 0xe4dc593f, Offset: 0x4108
// Size: 0x140
function function_c5c7d880() {
    self notify("64ee7cc964e8a25e");
    self endon("64ee7cc964e8a25e");
    level endon(#"end_game");
    level endoncallback(&function_707f7801, #"stone_visible");
    self endoncallback(&function_707f7801, #"death");
    self.var_54cb40e6 = 1;
    while (true) {
        s_notify = self waittill(#"hash_1fe68a6b935c321d");
        if (zm_utility::is_player_valid(s_notify.reviver)) {
            s_notify.reviver zm_audio::create_and_play_dialog(#"plr_ghost", #"revive", undefined, 1);
            wait(randomintrange(20, 20 * 3));
        }
    }
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 1, eflags: 0x1 linked
// Checksum 0x725e7941, Offset: 0x4250
// Size: 0x2e
function function_707f7801(_hash) {
    if (isdefined(level.var_ead1145a)) {
        level.var_ead1145a.var_54cb40e6 = 0;
    }
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x5 linked
// Checksum 0x9aa92af, Offset: 0x4288
// Size: 0x28c
function private stick_guide() {
    level endon(#"stone_visible");
    level.var_ead1145a endon(#"disconnect");
    level.e_guide endon(#"death");
    level flag::wait_till(#"stick_hide");
    player = level.var_ead1145a;
    s_loc = array::random(struct::get_array("stick_guide_loc"));
    /#
        sphere(s_loc.origin, 100, (1, 1, 1), 1, 0, 16, 10000);
    #/
    while (distancesquared(player.origin, s_loc.origin) >= s_loc.radius * s_loc.radius) {
        waitframe(1);
    }
    nd_start = getvehiclenode(s_loc.target, "targetname");
    level.e_guide thread mansion_pap::function_c9c7a593();
    var_3387e30b = level.e_guide getlinkedent();
    if (isdefined(var_3387e30b)) {
        level.e_guide unlink();
        var_3387e30b delete();
    }
    level.e_guide moveto(s_loc.origin, 0.05);
    level.e_guide rotateto(s_loc.angles, 0.05);
    level.e_guide waittill(#"movedone");
    level.e_guide thread lead_player(nd_start, player);
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x1 linked
// Checksum 0x89f65a6f, Offset: 0x4520
// Size: 0x1bc
function function_6f6fef08() {
    level endon(#"cemetery_open");
    level flag::wait_till(#"stone_visible");
    mdl_stone = getent("health_stone", "targetname");
    mdl_stone setvisibletoall();
    mdl_stone clientfield::set("" + #"force_stream_model", 1);
    util::wait_network_frame();
    mdl_stone playsound(#"hash_7a3af4224e706aa8");
    mdl_stone clientfield::increment("" + #"stone_rise", 1);
    mdl_stone movez(5, 2);
    mdl_stone waittill(#"movedone");
    var_47323b73 = mdl_stone zm_unitrigger::create(undefined, 96);
    var_47323b73.mdl_stone = mdl_stone;
    var_47323b73.v_start = mdl_stone.angles;
    mdl_stone thread function_31e641f5();
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x1 linked
// Checksum 0xab67cc94, Offset: 0x46e8
// Size: 0x4d4
function function_31e641f5() {
    level endon(#"cemetery_open");
    while (true) {
        self waittill(#"trigger_activated");
        b_using = 1;
        n_time = 0;
        self thread mansion_util::function_6a523c8c();
        self playsound(#"hash_2e899e1ff9bec306");
        while (n_time < 3) {
            foreach (player in getplayers()) {
                if (!player usebuttonpressed() || !zm_utility::can_use(player) || !isdefined(self.s_unitrigger) || !isdefined(self.s_unitrigger.trigger) || !player istouching(self.s_unitrigger.trigger)) {
                    b_using = 0;
                    n_time = 0;
                    break;
                }
            }
            if (b_using == 0) {
                self notify(#"stop_wobble");
                self.angles = self.s_unitrigger.v_start;
                self clientfield::set("" + #"stone_glow", 0);
                self playsound(#"hash_6a0e3c65b9af1217");
                break;
            }
            self clientfield::set("" + #"stone_glow", 1);
            wait(0.1);
            n_time = n_time + 0.1;
        }
        if (b_using == 1) {
            self playsound(#"hash_41620678756defa6");
            break;
        }
        wait(0.1);
    }
    array::run_all(util::get_active_players(), &clientfield::increment_to_player, "" + #"mansion_mq_rumble", 1);
    exploder::exploder("fxexp_barrier_gameplay_cemetery");
    level thread mansion_util::function_f1c106b("loc3", 1);
    self clientfield::set("" + #"stone_soul", 1);
    self playloopsound(#"hash_1e42374c33473899");
    s_dest = struct::get(self.target);
    self rotateto(s_dest.angles, 3);
    self moveto(s_dest.origin, 3);
    self waittill(#"movedone");
    self clientfield::set("" + #"stone_pickup", 1);
    level thread function_e3eb2cfd();
    self.var_4c4f2b6 = self.angles;
    self thread mansion_util::function_da5cd631((0, 180, 0));
    wait(1);
    level flag::set(#"cemetery_defend");
    level thread zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x1 linked
// Checksum 0xc0f924aa, Offset: 0x4bc8
// Size: 0x186
function function_e3eb2cfd() {
    level endon(#"cemetery_open");
    level flag::wait_till(#"cemetery_done");
    wait(2);
    mdl_stone = getent("health_stone", "targetname");
    mdl_stone notify(#"stop_spin");
    mdl_stone stoploopsound();
    mdl_stone playsound(#"hash_3eaae008a56e81e8");
    wait(0.5);
    mdl_stone rotateto(mdl_stone.v_start_angles, 2);
    mdl_stone moveto(mdl_stone.v_start_origin, 3);
    mdl_stone waittill(#"movedone");
    mdl_stone clientfield::set("" + #"stone_soul", 0);
    var_47323b73 = mdl_stone zm_unitrigger::create(undefined, 96, &function_c9ebaa3);
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x1 linked
// Checksum 0xbdf5c1c2, Offset: 0x4d58
// Size: 0xb0
function function_c9ebaa3() {
    while (true) {
        waitresult = self waittill(#"trigger");
        player = waitresult.activator;
        if (!zm_utility::can_use(player)) {
            continue;
        }
        player thread mansion_util::function_f15c4657();
        level thread function_78a99a79();
        level thread zm_unitrigger::unregister_unitrigger(self.stub);
    }
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x1 linked
// Checksum 0x8433bbdf, Offset: 0x4e10
// Size: 0x10c
function function_78a99a79() {
    mdl_stone = getent("health_stone", "targetname");
    if (isdefined(mdl_stone)) {
        v_loc = mdl_stone.origin + (0, 0, 32);
        mdl_stone clientfield::set("" + #"stone_pickup", 1);
        mdl_stone playsound(#"hash_1d9380a0645b1e31");
        mdl_stone thread util::delayed_delete(1);
        level thread zm_powerups::specific_powerup_drop(#"full_ammo", v_loc);
    }
    level flag::set(#"cemetery_open");
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x1 linked
// Checksum 0x17a0d119, Offset: 0x4f28
// Size: 0x150
function function_6ae66179() {
    level endon(#"cemetery_done");
    while (!level flag::get(#"portrait_found")) {
        waitresult = self waittill(#"trigger");
        player = waitresult.activator;
        if (!zm_utility::can_use(player)) {
            continue;
        }
        if (player != level.var_ead1145a) {
            continue;
        }
        player thread zm_vo::function_a2bd5a0c(#"hash_7b5ae04f082da5a6", 0, 1);
        player thread function_50955e48();
        player thread function_d14e2180(self.stub.var_d62b4d4);
        level thread zm_unitrigger::unregister_unitrigger(self.stub);
        level flag::set(#"portrait_found");
    }
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x1 linked
// Checksum 0x614ef992, Offset: 0x5080
// Size: 0x1cc
function function_50955e48() {
    self endon(#"player_downed", #"death", #"hash_1544918b5f670dae");
    var_4e7ea1ce = 0;
    s_scene = struct::get(#"p8_fxanim_zm_man_wm_01_bundle", "scriptbundlename");
    while (!var_4e7ea1ce) {
        n_dist_sq = distance2dsquared(self.origin, s_scene.origin);
        if (n_dist_sq <= 38416) {
            var_4e7ea1ce = 1;
        }
        waitframe(1);
    }
    scene::remove_scene_func(#"p8_fxanim_zm_man_wm_01_bundle", &function_599edfb8, "Shot 2");
    scene::add_scene_func(#"p8_fxanim_zm_man_wm_01_bundle", &function_599edfb8, "Shot 2");
    s_scene scene::play("Shot 2");
    self thread function_79ad31a0();
    level flag::set(#"hash_7ffc33bb45377f5e");
    self thread zm_vo::function_a2bd5a0c("vox_wicker_comp_react", 0, 1, 9999, 1, 0, 0);
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 1, eflags: 0x1 linked
// Checksum 0xd2bb4d80, Offset: 0x5258
// Size: 0x78
function function_599edfb8(a_ents) {
    level.var_e34d55ef = a_ents[#"prop 1"];
    level.var_e34d55ef.var_71c444c7 = a_ents[#"prop 1"].model;
    wait(0.2);
    level notify(#"hash_68c10418963ac1fc");
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 1, eflags: 0x5 linked
// Checksum 0x994e671a, Offset: 0x52d8
// Size: 0x124
function private function_d14e2180(var_d62b4d4) {
    self endoncallback(&function_a0a113c9, #"player_downed", #"death");
    level endon(#"cemetery_done");
    self.var_d62b4d4 = var_d62b4d4;
    self clientfield::set("" + #"sacrifice_player", 1);
    level flag::wait_till_timeout(120, #"stick_drag");
    if (!level flag::get(#"stick_drag")) {
        self thread function_44a7951d();
        return;
    }
    self clientfield::set("" + #"sacrifice_player", 0);
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 1, eflags: 0x5 linked
// Checksum 0x82eb5b88, Offset: 0x5408
// Size: 0xce
function private function_a0a113c9(str_notify) {
    if (!isdefined(self)) {
        return;
    }
    if (self clientfield::get("" + #"sacrifice_player")) {
        self clientfield::set("" + #"sacrifice_player", 0);
    }
    if (self clientfield::get_to_player("" + #"player_dragged")) {
        self clientfield::set_to_player("" + #"player_dragged", 0);
        self.var_7ebdb2c9 = undefined;
    }
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x5 linked
// Checksum 0x6b156504, Offset: 0x54e0
// Size: 0x7e
function private function_79ad31a0() {
    s_scene = struct::get(#"p8_fxanim_zm_man_wm_01_bundle", "scriptbundlename");
    if (!isdefined(level.var_d2ff3b06)) {
        level.var_d2ff3b06 = s_scene zm_unitrigger::create(undefined, (96, 96, 100), &trigger_stick_man);
    }
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x1 linked
// Checksum 0xaf1955, Offset: 0x5568
// Size: 0xe8
function trigger_stick_man() {
    level endon(#"cemetery_done");
    level.var_ead1145a endon(#"disconnect");
    while (true) {
        waitresult = self waittill(#"trigger");
        player = waitresult.activator;
        if (!zm_utility::can_use(player)) {
            continue;
        }
        if (player != level.var_ead1145a) {
            continue;
        }
        if (isdefined(player.var_fd49b4a9) && player.var_fd49b4a9) {
            continue;
        }
        player thread player_stuck();
    }
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x5 linked
// Checksum 0x63f170cf, Offset: 0x5658
// Size: 0x254
function private player_stuck() {
    self endon(#"disconnect");
    self val::set(#"hash_3c30825a658c87fd", "show_hud", 0);
    self.var_fd49b4a9 = 1;
    self.var_f22c83f5 = 1;
    self val::set("stick_man", "takedamage", 0);
    self val::set("stick_man", "ignoreme", 1);
    self disableweapons();
    self allowcrouch(0);
    self allowprone(0);
    if (self.str_name === "pic_gypsy") {
        level.var_9661fac0 = #"scene_zm_mansn_wm_fem_fullsequence";
        var_cab90298 = #"hash_3475f0b9b2ad7422";
    } else {
        level.var_9661fac0 = #"scene_zm_mansn_wm_male_fullsequence";
        var_cab90298 = #"hash_54f8a53a5930ed55";
    }
    var_3add8e25 = struct::get("s_stick_scene", "targetname");
    var_3add8e25 thread scene::play(level.var_9661fac0, self);
    s_result = self waittilltimeout(getanimlength(var_cab90298), #"hash_1544918b5f670dae");
    if (s_result._notify === #"hash_1544918b5f670dae") {
        b_watcher = 0;
    } else {
        b_watcher = 1;
    }
    level flag::set(#"stick_ready");
    self thread function_21f38255(b_watcher);
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 1, eflags: 0x5 linked
// Checksum 0x37b92485, Offset: 0x58b8
// Size: 0x1bc
function private function_21f38255(b_watcher) {
    level endon(#"stick_drag");
    self endon(#"disconnect");
    if (b_watcher) {
        self function_be4a0b7a(10);
    }
    var_3add8e25 = struct::get("s_stick_scene", "targetname");
    self thread function_1e60e7d2();
    var_3add8e25 scene::play(level.var_9661fac0, "Release");
    level.var_9661fac0 = undefined;
    self val::reset(#"hash_3c30825a658c87fd", "show_hud");
    self.var_fd49b4a9 = undefined;
    self.var_f22c83f5 = undefined;
    self val::reset("stick_man", "takedamage");
    self val::reset("stick_man", "ignoreme");
    self enableweapons();
    self allowcrouch(1);
    self allowprone(1);
    level flag::clear(#"stick_ready");
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x5 linked
// Checksum 0xca3262d5, Offset: 0x5a80
// Size: 0x17a
function private function_1e60e7d2() {
    level endon(#"end_game", #"intermission");
    self endon(#"death");
    if (!(isdefined(level.var_f1028094[#"hash_21903abfb2fb71dd"]) && level.var_f1028094[#"hash_21903abfb2fb71dd"]) && isalive(self)) {
        level.var_f1028094[#"hash_21903abfb2fb71dd"] = 1;
        var_e04d003f = zm_characters::function_d35e4c92();
        str_vo = "vox_generic_responses_negative_plr_" + var_e04d003f + "_" + randomint(9);
        self zm_vo::vo_say(str_vo, 0, 1, 1000);
        wait(randomintrange(30, 30 * 3));
        level.var_f1028094[#"hash_21903abfb2fb71dd"] = 0;
    }
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 1, eflags: 0x5 linked
// Checksum 0x4834de47, Offset: 0x5c08
// Size: 0xbc
function private function_be4a0b7a(n_timeout) {
    level endon(#"stick_drag");
    self endon(#"disconnect", #"hash_1544918b5f670dae");
    n_start_time = gettime();
    for (n_total_time = 0; !self util::stance_button_held() && n_total_time < n_timeout; n_total_time = (n_current_time - n_start_time) / 1000) {
        waitframe(1);
        n_current_time = gettime();
    }
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 2, eflags: 0x1 linked
// Checksum 0x99fb3b7e, Offset: 0x5cd0
// Size: 0x5cc
function lead_player(nd_start, player) {
    level endon(#"stone_visible");
    self endon(#"death");
    player endon(#"disconnect");
    player thread function_45cfa31(self);
    self.var_c176969a = spawner::simple_spawn_single(getent("veh_power_on_projectile", "targetname"));
    self.var_c176969a.team = #"allies";
    self.var_c176969a.var_6353e3f1 = 1;
    self.var_c176969a setspeed(7);
    self.var_c176969a.origin = nd_start.origin;
    self.var_c176969a.angles = nd_start.angles;
    self linkto(self.var_c176969a);
    self thread mansion_pap::function_900b7dca(getallvehiclenodes(), 0, player);
    self.var_c176969a vehicle::get_on_and_go_path(nd_start);
    self.var_c176969a waittill(#"reached_end_node");
    self unlink();
    var_dafa2b89 = util::spawn_model("tag_origin", self.var_c176969a.origin, self.var_c176969a.angles);
    self linkto(var_dafa2b89);
    self.var_c176969a thread scene::stop();
    self thread scene::stop();
    var_dafa2b89 thread scene::play(#"aib_vign_zm_mnsn_ghost_idle_01", self);
    self thread scene::play(#"aib_vign_zm_mnsn_ghost_idle_01", self.mdl_head);
    var_dafa2b89 rotateyaw(180, 1.5);
    var_dafa2b89 waittill(#"rotatedone");
    mdl_stone = getent("health_stone", "targetname");
    mdl_stone clientfield::set("" + #"force_stream_model", 1);
    var_dafa2b89 moveto(mdl_stone.origin + (0, 0, 8), 1);
    var_dafa2b89 waittill(#"movedone");
    self ghost();
    self.mdl_head ghost();
    var_dafa2b89 clientfield::set("" + #"stick_fire", 1);
    wait(1);
    var_dafa2b89 thread scene::stop();
    self thread scene::stop();
    playsoundatposition(#"hash_72a28324d62874cc", self.origin);
    self clientfield::set("" + #"stick_fire", 0);
    mdl_stone setvisibletoplayer(player);
    mdl_stone playsound(#"hash_7a3af4224e706aa8");
    mdl_stone clientfield::increment("" + #"stone_rise", 1);
    mdl_stone movez(5, 2);
    mdl_stone waittill(#"movedone");
    var_47323b73 = mdl_stone zm_unitrigger::create(undefined, (64, 64, 100), &function_48aadc5d);
    var_47323b73.e_guide = self;
    var_47323b73.e_guide.mdl_head = self.mdl_head;
    waitframe(1);
    var_dafa2b89 delete();
    self.var_c176969a delete();
    self.mdl_head delete();
    self delete();
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 1, eflags: 0x1 linked
// Checksum 0x394c6a27, Offset: 0x62a8
// Size: 0x34c
function function_45cfa31(mdl_ghost) {
    level endon(#"end_game", #"intermission");
    self endon(#"death", #"disconnect");
    mdl_ghost endon(#"death");
    n_character_index = self zm_characters::function_d35e4c92();
    switch (n_character_index) {
    case 10:
        var_1f92304d = #"hash_741e29cc775db83e";
        var_1616bdce = #"hash_6bdc47828f660dbb";
        var_8954c16e = #"hash_16fcfe9abf1617bc";
        var_80192cb1 = #"hash_762bdec6a06169a5";
        break;
    case 12:
        var_1f92304d = #"hash_6bec691584ea685f";
        var_1616bdce = #"hash_261ab4742c24d198";
        var_8954c16e = #"hash_4d56b3f9f5d80d5f";
        var_80192cb1 = #"hash_6c4f7d192847d762";
        break;
    case 11:
        var_1f92304d = #"hash_2ff0b0abb26e1dcc";
        var_1616bdce = #"hash_542f688a23fb4faa";
        var_8954c16e = #"hash_d0ee848487e6e89";
        var_80192cb1 = #"hash_7228b71e32509514";
        break;
    case 9:
        var_1f92304d = #"hash_5d5042a83172ac71";
        var_1616bdce = #"hash_5df4633a4e23f150";
        var_8954c16e = #"hash_52a4d5c9366fd9ab";
        var_80192cb1 = #"hash_2a80120b6197a78e";
        break;
    }
    self zm_vo::vo_say(var_1f92304d, 0, 1, 9999, 1, 1, 1);
    self zm_vo::vo_say(var_1616bdce, 0, 1, 9999, 1, 1, 1);
    level waittill(#"hash_10a51d6f30d3daf8");
    self zm_vo::vo_say(var_8954c16e, 0, 1, 9999, 1, 1, 1);
    while (!mdl_ghost zm_zonemgr::entity_in_zone("zone_cemetery_graveyard", 0) && !mdl_ghost zm_zonemgr::entity_in_zone("zone_cemetery_mausoleum", 0)) {
        wait(1);
    }
    wait(1.5);
    self zm_vo::vo_say(var_80192cb1, 0, 1, 9999, 1, 1, 1);
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x1 linked
// Checksum 0x1bb41119, Offset: 0x6600
// Size: 0x1d0
function function_48aadc5d() {
    level endon(#"cemetery_open");
    level.var_ead1145a endon(#"disconnect");
    while (true) {
        waitresult = self waittill(#"trigger");
        player = waitresult.activator;
        if (!zm_utility::can_use(player)) {
            continue;
        }
        if (player != level.var_ead1145a) {
            continue;
        }
        player setvisibletoall();
        if (player clientfield::get_to_player("" + #"player_dragged")) {
            player clientfield::set_to_player("" + #"player_dragged", 0);
            player.var_7ebdb2c9 = undefined;
        }
        player thread function_aad579ef();
        player playsound(#"hash_40fdafd4806ca427");
        level flag::set(#"stone_visible");
        playsoundatposition(#"hash_571ef9dff083fec7", self.origin);
        level thread zm_unitrigger::unregister_unitrigger(self.stub);
    }
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x5 linked
// Checksum 0x4f0207f9, Offset: 0x67d8
// Size: 0x14e
function private function_aad579ef() {
    self endon(#"death");
    self zm_vo::function_a2bd5a0c(#"hash_4790127983f61eff", 0, 1, 9999);
    if (getplayers().size > 1) {
        foreach (e_player in getplayers()) {
            if (e_player != self && e_player util::is_player_looking_at(self geteye())) {
                var_4653950 = e_player zm_audio::create_and_play_dialog(#"plr_ghost", #"revive", undefined, 1);
                if (isdefined(var_4653950) && var_4653950) {
                    return;
                }
            }
        }
    }
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 1, eflags: 0x0
// Checksum 0x3a5e96c6, Offset: 0x6930
// Size: 0xa0
function function_9bd05071(player) {
    self endon(#"reached_end_node");
    player endon(#"disconnect");
    while (true) {
        self setspeed(7);
        self waittill(#"reached_node");
        self setspeed(0);
        self mansion_util::waittill_player_nearby(player, 0);
    }
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 1, eflags: 0x1 linked
// Checksum 0x449cde95, Offset: 0x69d8
// Size: 0xa4
function init_step_3(var_a276c861) {
    level zm_ui_inventory::function_7df6bb60(#"hash_7b00744a8b2143d4", 1);
    level thread cemetery_defend();
    level thread function_97ea199a();
    level thread function_f3668a9();
    if (!var_a276c861) {
        level flag::wait_till(#"cemetery_open");
    }
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 2, eflags: 0x1 linked
// Checksum 0xcd4c886, Offset: 0x6a88
// Size: 0x1ce
function cleanup_step_3(var_5ea5c94d, ended_early) {
    level flag::set(#"cemetery_open");
    level flag::set(#"cemetery_defend");
    level flag::set(#"cemetery_done");
    level notify(#"hash_3c7945247db32d89");
    s_relic = struct::get("relic_cemetery");
    mdl_relic = util::spawn_model(#"p8_zm_man_druid_door_stone_square", s_relic.origin, s_relic.angles);
    util::wait_network_frame();
    if (isdefined(mdl_relic)) {
        mdl_relic.targetname = s_relic.targetname;
        mdl_relic clientfield::set("" + #"stone_glow", 1);
    }
    mdl_stone = getent("health_stone", "targetname");
    if (isdefined(mdl_stone)) {
        mdl_stone delete();
    }
    if (isdefined(level.var_d2ff3b06)) {
        zm_unitrigger::unregister_unitrigger(level.var_d2ff3b06);
        level.var_d2ff3b06 = undefined;
    }
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x1 linked
// Checksum 0x38447bbe, Offset: 0x6c60
// Size: 0x19c
function cemetery_defend() {
    level endon(#"cemetery_open");
    level flag::wait_till(#"cemetery_defend");
    level thread mansion_util::function_bb613572(function_9ca03a70("spawn_location"), #"cemetery_done");
    level.var_84b2907f = &function_cd4923;
    level thread function_cdacc87c();
    level thread wave_1();
    level flag::wait_till(#"hash_684b700932f4018f");
    level thread wave_2();
    level flag::wait_till(#"hash_6100d5ec10bed5cc");
    level thread wave_3();
    level flag::wait_till(#"hash_12f4b41ff140e181");
    level thread wave_4();
    level flag::wait_till(#"hash_6a70f9021505a71e");
    level thread function_8f5a048e();
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x1 linked
// Checksum 0xd98bc73c, Offset: 0x6e08
// Size: 0x10c
function function_cdacc87c() {
    level endon(#"end_game");
    a_players = util::get_active_players();
    e_player_random = array::random(a_players);
    if (isdefined(e_player_random)) {
        e_player_random zm_vo::function_a2bd5a0c(#"hash_16869727f81b98d0", 0, 1, 9999);
    }
    level flag::wait_till(#"hash_6a70f9021505a71e");
    a_players = util::get_active_players();
    e_player_random = array::random(a_players);
    if (isdefined(e_player_random)) {
        e_player_random zm_vo::function_a2bd5a0c(#"hash_637b438e59b6efa2", 0, 1, 9999);
    }
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x1 linked
// Checksum 0x1a749d13, Offset: 0x6f20
// Size: 0x27c
function wave_1() {
    switch (getplayers().size) {
    case 1:
        n_num = 10;
        n_current = 8;
        break;
    case 2:
        n_num = 16;
        n_current = 10;
        break;
    case 3:
        n_num = 22;
        n_current = 14;
        break;
    case 4:
        n_num = 28;
        n_current = 16;
        break;
    }
    a_s_locs = function_9ca03a70();
    level.var_ba177d48 = 0;
    x = 0;
    level flag::set(#"hash_29b12646045186fa");
    for (i = 0; i < n_num; i++) {
        function_9c6147b1();
        while (level.var_ba177d48 >= n_current) {
            waitframe(1);
        }
        ai_bat = bat::function_2e37549f(1, a_s_locs[x], 20);
        if (isdefined(ai_bat)) {
            level.var_ba177d48++;
            x++;
            ai_bat.no_powerups = 1;
            ai_bat zm_score::function_acaab828();
            ai_bat callback::function_d8abfc3d(#"on_ai_killed", &function_c9775ddf);
        }
        if (x == a_s_locs.size) {
            x = 0;
        }
        wait(randomfloatrange(0.2, 0.5));
    }
    level flag::clear(#"hash_29b12646045186fa");
    level thread function_2bffa0a5();
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 1, eflags: 0x1 linked
// Checksum 0xcb481ada, Offset: 0x71a8
// Size: 0x18
function function_c9775ddf(params) {
    level.var_ba177d48--;
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x1 linked
// Checksum 0x18937f5, Offset: 0x71c8
// Size: 0x5c
function function_2bffa0a5() {
    level endon(#"cemetery_done");
    while (level.var_ba177d48 > 3) {
        wait(1);
    }
    level flag::set(#"hash_684b700932f4018f");
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x1 linked
// Checksum 0xa8316a16, Offset: 0x7230
// Size: 0x374
function wave_2() {
    switch (getplayers().size) {
    case 1:
        n_num = 12;
        n_active = 5;
        break;
    case 2:
        n_num = 18;
        n_active = 7;
        break;
    case 3:
        n_num = 25;
        n_active = 10;
        break;
    case 4:
        n_num = 32;
        n_active = 12;
        break;
    }
    a_s_locs = function_9ca03a70("nosferatu_location");
    level.var_3c6f81fe = 0;
    x = 0;
    var_9f9ebbe8 = 0;
    for (i = 0; i < n_num; i++) {
        while (level.var_3c6f81fe >= n_active) {
            level flag::clear(#"hash_29b12646045186fa");
            waitframe(1);
        }
        level flag::set(#"hash_29b12646045186fa");
        function_9c6147b1();
        if (randomint(100) > 65 && var_9f9ebbe8 < getplayers().size * 2) {
            b_crimson = 1;
            var_9f9ebbe8++;
        } else {
            b_crimson = 0;
        }
        ai_nos = zm_ai_nosferatu::function_74f25f8a(1, a_s_locs[x], b_crimson);
        if (isdefined(ai_nos)) {
            level.var_3c6f81fe++;
            x++;
            ai_nos.no_powerups = 1;
            ai_nos zm_score::function_acaab828();
            ai_nos callback::function_d8abfc3d(#"on_ai_killed", &function_d1027329);
            level flag::clear(#"hash_29b12646045186fa");
            ai_nos waittilltimeout(5 - getplayers().size, #"death");
            level flag::set(#"hash_29b12646045186fa");
        } else {
            i--;
            wait(1);
        }
        if (x == a_s_locs.size) {
            x = 0;
        }
    }
    level flag::clear(#"hash_29b12646045186fa");
    level thread function_93b1a1a4();
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 1, eflags: 0x1 linked
// Checksum 0x4158a0a2, Offset: 0x75b0
// Size: 0x18
function function_d1027329(params) {
    level.var_3c6f81fe--;
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x1 linked
// Checksum 0xab59ed46, Offset: 0x75d0
// Size: 0x74
function function_93b1a1a4() {
    level endon(#"cemetery_done");
    while (level.var_3c6f81fe > 3 + getplayers().size) {
        wait(1);
    }
    level flag::set(#"hash_6100d5ec10bed5cc");
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x1 linked
// Checksum 0xc9ddc075, Offset: 0x7650
// Size: 0x224
function wave_3() {
    a_s_locs = function_9ca03a70();
    level.var_50b2aa84 = 0;
    x = 0;
    switch (getplayers().size) {
    case 1:
        n_num = 4;
        break;
    case 2:
        n_num = 6;
        break;
    case 3:
        n_num = 8;
        break;
    case 4:
        n_num = 10;
        break;
    }
    level flag::set(#"hash_29b12646045186fa");
    for (i = 0; i < n_num; i++) {
        function_9c6147b1();
        ai_bat = bat::function_2e37549f(1, a_s_locs[x], 20);
        if (isdefined(ai_bat)) {
            level.var_50b2aa84++;
            x++;
            ai_bat.no_powerups = 1;
            ai_bat zm_score::function_acaab828();
            ai_bat callback::function_d8abfc3d(#"on_ai_killed", &function_10aefe00);
        }
        if (x == a_s_locs.size) {
            x = 0;
        }
        wait(0.25);
    }
    level flag::clear(#"hash_29b12646045186fa");
    level thread function_b77d225a();
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 1, eflags: 0x1 linked
// Checksum 0xb712d2c8, Offset: 0x7880
// Size: 0x18
function function_10aefe00(params) {
    level.var_50b2aa84--;
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x1 linked
// Checksum 0x19f2810e, Offset: 0x78a0
// Size: 0x5c
function function_b77d225a() {
    level endon(#"cemetery_done");
    while (level.var_50b2aa84 > 4) {
        wait(1);
    }
    level flag::set(#"hash_12f4b41ff140e181");
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x1 linked
// Checksum 0x5945e0eb, Offset: 0x7908
// Size: 0x43c
function wave_4() {
    a_s_locs = function_9ca03a70();
    for (i = 0; i < a_s_locs.size; i++) {
        function_9c6147b1();
        ai_bat = bat::function_2e37549f(1, a_s_locs[i], 20);
        if (isdefined(ai_bat)) {
            ai_bat.no_powerups = 1;
            ai_bat zm_score::function_acaab828();
        }
        wait(0.25);
    }
    n_players = getplayers().size;
    switch (n_players) {
    case 1:
        n_total = 3;
        n_active = 2;
        break;
    case 2:
        n_total = 5;
        n_active = 2;
        break;
    case 3:
        n_total = 6;
        n_active = 3;
        break;
    case 4:
        n_total = 7;
        n_active = 4;
        break;
    }
    var_4275b4d6 = function_9ca03a70("werewolf_location");
    var_c3e7058b = [];
    level.var_a908db33 = 0;
    for (i = 0; i < n_total; i++) {
        if (!var_c3e7058b.size) {
            var_c3e7058b = arraycopy(array::randomize(var_4275b4d6));
        }
        s_loc = array::pop(var_c3e7058b, undefined, 0);
        while (level.var_a908db33 >= n_active) {
            level flag::clear(#"hash_29b12646045186fa");
            waitframe(1);
        }
        level flag::set(#"hash_29b12646045186fa");
        function_9c6147b1();
        ai_werewolf = zombie_werewolf_util::function_47a88a0c(1, undefined, 1, s_loc, 20);
        if (isdefined(ai_werewolf)) {
            level.var_a908db33++;
            ai_werewolf callback::function_d8abfc3d(#"on_ai_killed", &function_1736030d);
            ai_werewolf.var_126d7bef = 1;
            ai_werewolf.ignore_round_spawn_failsafe = 1;
            ai_werewolf.ignore_enemy_count = 1;
            ai_werewolf.b_ignore_cleanup = 1;
            ai_werewolf.no_powerups = 1;
            ai_werewolf zm_score::function_acaab828();
            level flag::clear(#"hash_29b12646045186fa");
            ai_werewolf waittilltimeout(6 - n_players / 2, #"death");
            level flag::set(#"hash_29b12646045186fa");
            continue;
        }
        i--;
        wait(1);
    }
    level flag::clear(#"hash_29b12646045186fa");
    level thread function_2268f8e8();
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 1, eflags: 0x1 linked
// Checksum 0x171e75d6, Offset: 0x7d50
// Size: 0x18
function function_1736030d(params) {
    level.var_a908db33--;
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x1 linked
// Checksum 0x4fbb06fb, Offset: 0x7d70
// Size: 0x54
function function_2268f8e8() {
    level endon(#"cemetery_done");
    while (level.var_a908db33) {
        wait(1);
    }
    level flag::set(#"hash_6a70f9021505a71e");
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x1 linked
// Checksum 0xf363b056, Offset: 0x7dd0
// Size: 0xce
function function_8f5a048e() {
    level endon(#"cemetery_open");
    level flag::wait_till_all(array(#"hash_684b700932f4018f", #"hash_6100d5ec10bed5cc", #"hash_12f4b41ff140e181", #"hash_6a70f9021505a71e"));
    level thread zm_utility::function_9ad5aeb1(0, 1, 0, 1, 0);
    level flag::set(#"cemetery_done");
    level.var_84b2907f = undefined;
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 1, eflags: 0x1 linked
// Checksum 0x6e912eb4, Offset: 0x7ea8
// Size: 0xc8
function function_cd4923(ai) {
    if (isalive(ai)) {
        ai.no_powerups = 1;
        ai zm_score::function_acaab828();
        ai waittill(#"death");
        if (!level flag::get(#"hash_684b700932f4018f") && isdefined(level.var_ba177d48)) {
            level.var_ba177d48--;
            return;
        }
        if (isdefined(level.var_50b2aa84)) {
            level.var_50b2aa84--;
        }
    }
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 1, eflags: 0x1 linked
// Checksum 0xed049110, Offset: 0x7f78
// Size: 0x1f2
function function_9ca03a70(str_script_noteworthy = "bat_location") {
    a_s_spawns = struct::get_array(str_script_noteworthy, "script_noteworthy");
    if (str_script_noteworthy == "spawn_location") {
        a_s_spawns = arraycombine(a_s_spawns, struct::get_array("riser_location", "script_noteworthy"), 0, 0);
    }
    foreach (s_loc in a_s_spawns) {
        if (str_script_noteworthy == "spawn_location") {
            if (s_loc.targetname !== "cemetery_graveyard_spawns" && s_loc.targetname !== "mausoleum_spawns" && s_loc.targetname !== "cemetery_path_right_spawns" && s_loc.targetname !== "cemetery_path_left_spawns") {
                arrayremovevalue(a_s_spawns, s_loc, 1);
            }
            continue;
        }
        if (s_loc.targetname !== "cemetery_graveyard_spawns" && s_loc.targetname !== "mausoleum_spawns") {
            arrayremovevalue(a_s_spawns, s_loc, 1);
        }
    }
    return array::remove_undefined(a_s_spawns);
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 1, eflags: 0x1 linked
// Checksum 0x5890d288, Offset: 0x8178
// Size: 0x5c
function function_9c6147b1(n_max = 24) {
    while (getaiteamarray(level.zombie_team).size > int(n_max)) {
        wait(0.1);
    }
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x1 linked
// Checksum 0x9de39252, Offset: 0x81e0
// Size: 0x6c
function function_f3668a9() {
    level flag::wait_till(#"cemetery_done");
    wait(15);
    level flag::set(#"spawn_zombies");
    level flag::set(#"zombie_drop_powerups");
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x1 linked
// Checksum 0x4a09e80f, Offset: 0x8258
// Size: 0x15c
function function_97ea199a() {
    level flag::wait_till(#"cemetery_defend");
    level flag::set(#"disable_fast_travel");
    level clientfield::set("fasttravel_exploder", 0);
    mansion_util::function_45ac4bb8();
    level flag::clear(#"spawn_zombies");
    level flag::clear(#"zombie_drop_powerups");
    level flag::wait_till(#"cemetery_open");
    level flag::clear(#"disable_fast_travel");
    level clientfield::set("fasttravel_exploder", 1);
    mansion_util::function_5904a8e1();
    exploder::stop_exploder("fxexp_barrier_gameplay_cemetery");
    level thread mansion_util::function_f1c106b("loc3", 0);
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x1 linked
// Checksum 0xa73697e9, Offset: 0x83c0
// Size: 0x446
function function_2c554640() {
    level flag::wait_till(#"all_players_spawned");
    a_s_locs = array::randomize(struct::get_array("portrait_loc"));
    var_6adbf325 = getent("pic_gypsy", "targetname");
    var_1b2ca394 = getent("pic_brigadier", "targetname");
    var_3c9ce3a9 = getent("pic_butler", "targetname");
    var_36ebb951 = getent("pic_gunslinger", "targetname");
    var_6adbf325.var_3916fb8b = #"p8_zm_headstone_engraving_1950";
    var_1b2ca394.var_3916fb8b = #"p8_zm_headstone_engraving_1918";
    var_3c9ce3a9.var_3916fb8b = #"p8_zm_headstone_engraving_1927";
    var_36ebb951.var_3916fb8b = #"p8_zm_headstone_engraving_1945";
    level.var_d70578ff = array(var_6adbf325, var_1b2ca394, var_3c9ce3a9, var_36ebb951);
    for (i = 0; i < level.var_d70578ff.size; i++) {
        level.var_d70578ff[i].origin = a_s_locs[i].origin;
        level.var_d70578ff[i].angles = a_s_locs[i].angles;
        level.var_d70578ff[i].s_loc = a_s_locs[i];
        level.var_d70578ff[i] setscale(a_s_locs[i].modelscale);
        level.var_d70578ff[i].s_trig = struct::get(a_s_locs[i].target);
        level.var_d70578ff[i].s_trig.n_character_index = level.var_d70578ff[i].character_index;
        level.var_d70578ff[i].s_trig zm_unitrigger::create(undefined, (64, 64, 100), &turn_to_zombie_damage_);
        level.var_d70578ff[i].mdl_bd = util::spawn_model(level.var_d70578ff[i].var_3916fb8b, a_s_locs[i].origin + anglestoup(level.var_d70578ff[i].angles) * -19, a_s_locs[i].angles);
        level.var_d70578ff[i].mdl_bd setscale(0.55);
        var_fbd8294c = util::spawn_model(#"p8_zm_headstone_engraving_died", a_s_locs[i].origin + anglestoup(level.var_d70578ff[i].angles) * -12, a_s_locs[i].angles);
        var_fbd8294c setscale(0.55);
    }
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x1 linked
// Checksum 0x33d9b32a, Offset: 0x8810
// Size: 0xe8
function turn_to_zombie_damage_() {
    level endon(#"gazed_greenhouse");
    while (true) {
        s_result = self waittill(#"trigger");
        if (!zm_utility::can_use(s_result.activator) || s_result.activator.characterindex != self.stub.related_parent.n_character_index) {
            continue;
        }
        s_result.activator thread zm_vo::function_a2bd5a0c(#"hash_60e7bd8c8ced676f", 0, 1);
        level thread zm_unitrigger::unregister_unitrigger(self.stub);
    }
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 0, eflags: 0x1 linked
// Checksum 0x130e8680, Offset: 0x8900
// Size: 0x22
function function_8b12e689() {
    if (isdefined(self.var_fd49b4a9) && self.var_fd49b4a9) {
        return 0;
    }
    return undefined;
}

// Namespace namespace_b6ca3ccc/namespace_a4331a6e
// Params 1, eflags: 0x0
// Checksum 0xbd8e6677, Offset: 0x8930
// Size: 0x100
function function_e7b2b2eb(a_s_valid_respawn_points) {
    var_e9b059c7 = [];
    foreach (s_respawn_point in a_s_valid_respawn_points) {
        if (s_respawn_point.script_noteworthy == "zone_cemetery_graveyard" || s_respawn_point.script_noteworthy == "zone_cemetery_crypt") {
            if (!isdefined(var_e9b059c7)) {
                var_e9b059c7 = [];
            } else if (!isarray(var_e9b059c7)) {
                var_e9b059c7 = array(var_e9b059c7);
            }
            var_e9b059c7[var_e9b059c7.size] = s_respawn_point;
        }
    }
    return var_e9b059c7;
}

