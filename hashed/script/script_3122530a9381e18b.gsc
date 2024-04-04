// Atian COD Tools GSC decompiler test
#using script_724752ab26bff81b;
#using script_174ce72cc0f850;
#using scripts\zm\zm_white_main_quest.gsc;
#using scripts\zm\zm_hms_util.gsc;
#using scripts\zm\zm_white_special_rounds.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_ui_inventory.gsc;
#using scripts\zm_common\zm_item_pickup.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_ca03bbb4;

// Namespace namespace_ca03bbb4/namespace_ca03bbb4
// Params 0, eflags: 0x1 linked
// Checksum 0x6a52aa4c, Offset: 0x408
// Size: 0x8c
function preload() {
    namespace_bd74bbd2::register(#"sc_mk2v", 20000, "sc_mk2v", &function_a66f0de2, &function_17f3e9e2);
    clientfield::register("scriptmover", "" + #"hash_7b37fadc13d402a3", 20000, 1, "int");
}

// Namespace namespace_ca03bbb4/namespace_ca03bbb4
// Params 0, eflags: 0x1 linked
// Checksum 0x6eb1922, Offset: 0x4a0
// Size: 0x9c
function init() {
    level.var_9eccff99 = spawnstruct();
    level.var_9eccff99.var_10630268 = getweapon("ray_gun_mk2v");
    level.var_9eccff99.var_d58b0729 = getweapon("ray_gun_mk2v_upgraded");
    level.var_9eccff99.n_step = 0;
    callback::on_disconnect(&on_disconnect);
}

// Namespace namespace_ca03bbb4/namespace_ca03bbb4
// Params 0, eflags: 0x0
// Checksum 0x2f0cf2f6, Offset: 0x548
// Size: 0x4c
function function_1c530e2d() {
    /#
        level endon(#"game_ended");
        level waittill(#"open_sesame");
        zm_white_special_rounds::function_6acd363d(1);
    #/
}

// Namespace namespace_ca03bbb4/namespace_ca03bbb4
// Params 1, eflags: 0x5 linked
// Checksum 0xc2a0237a, Offset: 0x5a0
// Size: 0x40
function private function_18a1849f(e_player) {
    if (!isdefined(level.var_9eccff99.e_player)) {
        return false;
    }
    return e_player === level.var_9eccff99.e_player;
}

// Namespace namespace_ca03bbb4/namespace_ca03bbb4
// Params 1, eflags: 0x5 linked
// Checksum 0xebcb8668, Offset: 0x5e8
// Size: 0xf4
function private function_f6048ee(e_player) {
    if (isdefined(e_player)) {
        if (!isdefined(level.var_9eccff99.e_player)) {
            if (isdefined(e_player.var_9c20e2c9)) {
                self sethintstring(#"hash_744b68f010abb05");
            } else {
                self sethintstring(#"hash_12346bdab086516e");
            }
        } else if (level.var_9eccff99.e_player == e_player) {
            self sethintstring(#"hash_74fc96e8d58ff646");
        } else {
            self sethintstring(#"hash_2054e8fdb6521566");
        }
        return true;
    }
    return false;
}

// Namespace namespace_ca03bbb4/namespace_ca03bbb4
// Params 1, eflags: 0x5 linked
// Checksum 0x8f64345f, Offset: 0x6e8
// Size: 0x76
function private function_5b4f9f76(e_player) {
    var_2fff5cb5 = level.var_9eccff99.e_player === e_player;
    var_24441d81 = !isdefined(level.var_9eccff99.e_player) && !isdefined(e_player.var_9c20e2c9);
    return var_2fff5cb5 || var_24441d81;
}

// Namespace namespace_ca03bbb4/namespace_ca03bbb4
// Params 1, eflags: 0x4
// Checksum 0x5df31beb, Offset: 0x768
// Size: 0x4c
function private function_a8e75297(w_weapon) {
    return isdefined(w_weapon) && (w_weapon == level.var_9eccff99.var_10630268 || w_weapon == level.var_9eccff99.var_d58b0729);
}

// Namespace namespace_ca03bbb4/namespace_ca03bbb4
// Params 0, eflags: 0x1 linked
// Checksum 0x9c89994a, Offset: 0x7c0
// Size: 0x14
function start_quest() {
    start_step_1();
}

// Namespace namespace_ca03bbb4/namespace_ca03bbb4
// Params 0, eflags: 0x5 linked
// Checksum 0xdaf39163, Offset: 0x7e0
// Size: 0x21a
function private start_step_1() {
    level thread function_cbeb9a33();
    if (!isdefined(level.var_9eccff99.s_start)) {
        level.var_9eccff99.s_start = zm_hms_util::function_4e7f5b2e("mk2v_start");
    }
    level.var_9eccff99.var_fead3ae9 = util::spawn_model("p8_zm_whi_fuse_pickup_fluid_yellow_half", level.var_9eccff99.s_start.origin, level.var_9eccff99.s_start.angles);
    e_panel = getent(level.var_9eccff99.s_start.target, "targetname");
    if (isdefined(e_panel)) {
        e_panel setcandamage(1);
        e_panel val::set("quest_mk2v", "allowDeath", 0);
        e_panel thread function_1129876d();
        exploder::exploder("fxexp_quest_raygun_m2_v_stage_1" + level.var_9eccff99.s_start.exploder_id);
    } else {
        s_unitrigger = level.var_9eccff99.var_fead3ae9 zm_item_pickup::create_item_pickup(&function_9d66ea6f, &function_f6048ee, &function_5b4f9f76);
        zm_unitrigger::unitrigger_force_per_player_triggers(s_unitrigger);
    }
    level.var_9eccff99.n_step = 1;
}

// Namespace namespace_ca03bbb4/namespace_ca03bbb4
// Params 0, eflags: 0x5 linked
// Checksum 0x9d989930, Offset: 0xa08
// Size: 0xd4
function private function_1129876d() {
    self endon(#"death");
    pixbeginevent(#"hash_31bd17db0dd4297d");
    while (true) {
        s_notify = self waittill(#"damage");
        if (s_notify zm_hms_util::function_69320b44("zm_aat_kill_o_watt")) {
            self function_d41d20b1();
            break;
        }
    }
    pixendevent();
    self delete();
}

// Namespace namespace_ca03bbb4/namespace_ca03bbb4
// Params 0, eflags: 0x5 linked
// Checksum 0xa71ef497, Offset: 0xae8
// Size: 0x114
function private function_d41d20b1() {
    v_force = anglestoforward(self.angles);
    v_force = v_force * 0.2;
    createdynentandlaunch(self.dyn, self.origin, self.angles, self.origin, v_force);
    exploder::stop_exploder("fxexp_quest_raygun_m2_v_stage_1" + level.var_9eccff99.s_start.exploder_id);
    s_unitrigger = level.var_9eccff99.var_fead3ae9 zm_item_pickup::create_item_pickup(&function_9d66ea6f, &function_f6048ee, &function_5b4f9f76);
    zm_unitrigger::unitrigger_force_per_player_triggers(s_unitrigger);
}

// Namespace namespace_ca03bbb4/namespace_ca03bbb4
// Params 2, eflags: 0x5 linked
// Checksum 0xb099eecb, Offset: 0xc08
// Size: 0x144
function private function_9d66ea6f(e_item, e_player) {
    /#
        if (getdvarint(#"hash_7919e37cd5d57659", 0)) {
            iprintlnbold(e_player.name + "<unknown string>");
            println(e_player.name + "<unknown string>");
        }
    #/
    level.var_9eccff99.e_player = e_player;
    namespace_a01a2431::function_605e5c25(e_player);
    e_player.var_9c20e2c9 = 1;
    e_player playsound("evt_canister_pickup");
    zm_ui_inventory::function_7df6bb60("zm_white_ww_mod_phase", 0, e_player);
    zm_ui_inventory::function_7df6bb60("zm_white_ww_mk2v_ammo", 1, e_player);
    e_player thread function_130ea633();
    start_step_2();
}

// Namespace namespace_ca03bbb4/namespace_ca03bbb4
// Params 0, eflags: 0x1 linked
// Checksum 0x80b52965, Offset: 0xd58
// Size: 0x7c
function function_130ea633() {
    if (zm_utility::is_classic()) {
        self zm_vo::vo_stop();
        self zm_hms_util::function_51b752a9("vox_ww_v_ammo_pickup");
        if (!zm_white_main_quest::function_6cebbce1()) {
            self zm_audio::do_player_or_npc_playvox("vox_ww_v_elec_hint_rush_0", 1);
        }
    }
}

// Namespace namespace_ca03bbb4/namespace_ca03bbb4
// Params 0, eflags: 0x5 linked
// Checksum 0x40ae0443, Offset: 0xde0
// Size: 0xea
function private start_step_2() {
    if (zm_white_main_quest::function_6cebbce1()) {
        /#
            iprintlnbold("<unknown string>");
        #/
    }
    while (zm_white_main_quest::function_6cebbce1()) {
        wait(3);
    }
    var_685c8f1e = struct::get_array("mk2v_pole_target");
    level.var_9eccff99.var_685c8f1e = array::randomize(var_685c8f1e);
    level.var_9eccff99.var_f8f50111 = 0;
    level.var_9eccff99.var_685c8f1e[0] function_22b5323d();
    level.var_9eccff99.n_step = 2;
}

// Namespace namespace_ca03bbb4/namespace_ca03bbb4
// Params 0, eflags: 0x5 linked
// Checksum 0x23f622c4, Offset: 0xed8
// Size: 0xc2
function private function_22b5323d() {
    exploder::exploder("fxexp_quest_raygun_m2_v_stage_3_xtra_hint_" + self.exploder_id);
    t_damage = spawn("trigger_damage_new", self.origin - (0, 0, 12), 1048576 | 2097152 | 8388608, 24, 24);
    t_damage.var_504994c2 = 0;
    t_damage.s_target = self;
    t_damage thread function_27766b0b();
    self.t_damage = t_damage;
}

// Namespace namespace_ca03bbb4/namespace_ca03bbb4
// Params 0, eflags: 0x5 linked
// Checksum 0xffff0cf7, Offset: 0xfa8
// Size: 0x114
function private function_27766b0b() {
    self endon(#"death");
    pixbeginevent(#"hash_1d99091c9b9308d1");
    while (true) {
        s_notify = self waittill(#"damage");
        self playsound("evt_insulator_hit");
        if (s_notify zm_hms_util::function_69320b44("zm_aat_kill_o_watt")) {
            self.var_504994c2++;
            if (self.var_504994c2 >= 3) {
                self.s_target function_6d765bb3();
                break;
            }
        }
    }
    pixendevent();
    self delete();
}

// Namespace namespace_ca03bbb4/namespace_ca03bbb4
// Params 0, eflags: 0x5 linked
// Checksum 0xd93b6642, Offset: 0x10c8
// Size: 0x18c
function private function_6d765bb3() {
    exploder::stop_exploder("fxexp_quest_raygun_m2_v_stage_3_xtra_hint_" + self.exploder_id);
    exploder::exploder("fxexp_quest_raygun_m2_v_stage_4_complete_" + self.exploder_id);
    level.var_9eccff99.var_f8f50111++;
    if (level.var_9eccff99.var_f8f50111 == level.var_9eccff99.var_685c8f1e.size) {
        /#
            if (getdvarint(#"hash_7919e37cd5d57659", 0)) {
                iprintlnbold(level.var_9eccff99.e_player.name + "<unknown string>");
                println(level.var_9eccff99.e_player.name + "<unknown string>");
            }
        #/
        start_step_3();
        level notify(#"hash_141539da9edb11ab");
        return;
    }
    level.var_9eccff99.var_685c8f1e[level.var_9eccff99.var_f8f50111] function_22b5323d();
}

// Namespace namespace_ca03bbb4/namespace_ca03bbb4
// Params 0, eflags: 0x1 linked
// Checksum 0x60dc2412, Offset: 0x1260
// Size: 0x100
function cleanup_step_2() {
    foreach (var_5c805707 in level.var_9eccff99.var_685c8f1e) {
        exploder::stop_exploder("fxexp_quest_raygun_m2_v_stage_3_xtra_hint_" + var_5c805707.exploder_id);
        exploder::stop_exploder("fxexp_quest_raygun_m2_v_stage_4_complete_" + var_5c805707.exploder_id);
        if (isdefined(var_5c805707.t_damage)) {
            var_5c805707.t_damage delete();
        }
    }
    level notify(#"hash_141539da9edb11ab");
}

// Namespace namespace_ca03bbb4/namespace_ca03bbb4
// Params 0, eflags: 0x5 linked
// Checksum 0xb4ba0e56, Offset: 0x1368
// Size: 0xa2
function private start_step_3() {
    s_gen = struct::get("mk2v_gen");
    s_gen zm_unitrigger::create("", 96);
    s_gen thread function_195e54c();
    exploder::exploder("fxexp_quest_raygun_m2_v_stage_5_active");
    exploder::exploder("fxexp_quest_raygun_m2_v_stage_6_active");
    level.var_9eccff99.n_step = 3;
}

// Namespace namespace_ca03bbb4/namespace_ca03bbb4
// Params 0, eflags: 0x5 linked
// Checksum 0x3d25d16b, Offset: 0x1418
// Size: 0x14c
function private function_195e54c() {
    self endon(#"death", #"stop_think");
    while (true) {
        s_notify = self waittill(#"trigger_activated");
        playsoundatposition("evt_rgun_frame_putback", (553, -134, 1));
        if (function_18a1849f(level.var_9eccff99.e_player)) {
            level.var_9eccff99.var_fead3ae9 = util::spawn_model("p8_zm_whi_fuse_pickup_fluid_yellow_half", self.origin, self.angles);
            level.var_9eccff99.var_fead3ae9.in_zone = "zone_culdesac_yellow";
            namespace_bd74bbd2::start(#"sc_mk2v");
            level notify(#"hash_2df7109d3c756d8e");
            zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
            break;
        }
    }
}

// Namespace namespace_ca03bbb4/namespace_ca03bbb4
// Params 0, eflags: 0x5 linked
// Checksum 0x55e08517, Offset: 0x1570
// Size: 0x110
function private function_a66f0de2() {
    namespace_bd74bbd2::end(#"sc_mk2v");
    s_unitrigger = level.var_9eccff99.var_fead3ae9 zm_item_pickup::create_item_pickup(&function_e90f6026, &function_f6048ee, &function_5b4f9f76);
    zm_unitrigger::unitrigger_force_per_player_triggers(s_unitrigger);
    level.var_9eccff99.var_fead3ae9 setmodel("p8_zm_whi_fuse_pickup_fluid_yellow");
    level.var_9eccff99.var_fead3ae9 clientfield::set("" + #"hash_7b37fadc13d402a3", 1);
    level notify(#"hash_b8dfde4a4e85cd2");
}

// Namespace namespace_ca03bbb4/namespace_ca03bbb4
// Params 2, eflags: 0x5 linked
// Checksum 0xdccde73, Offset: 0x1688
// Size: 0x10c
function private function_e90f6026(e_item, e_player) {
    /#
        if (getdvarint(#"hash_7919e37cd5d57659", 0)) {
            iprintlnbold(e_player.name + "<unknown string>");
            println(e_player.name + "<unknown string>");
        }
    #/
    zm_ui_inventory::function_7df6bb60("zm_white_ww_mk2v_ammo", 2, e_player);
    e_player.var_f7694097 = 0;
    e_player thread function_9d800221();
    e_player playsound("evt_rgun_frame_pickup");
    function_e09a7418();
    start_step_4();
}

// Namespace namespace_ca03bbb4/namespace_ca03bbb4
// Params 0, eflags: 0x1 linked
// Checksum 0xeffcac7f, Offset: 0x17a0
// Size: 0x94
function function_9d800221() {
    if (zm_utility::is_classic()) {
        zm_hms_util::function_29fe9a5d();
        self zm_vo::vo_stop();
        self zm_hms_util::function_51b752a9("vox_ww_v_pickup");
        if (!zm_white_main_quest::function_6cebbce1()) {
            self zm_audio::do_player_or_npc_playvox("vox_ww_v_pickup_rush_1", 1);
        }
    }
}

// Namespace namespace_ca03bbb4/namespace_ca03bbb4
// Params 0, eflags: 0x1 linked
// Checksum 0xc69cd4d6, Offset: 0x1840
// Size: 0x44
function function_e09a7418() {
    exploder::stop_exploder("fxexp_quest_raygun_m2_v_stage_5_active");
    exploder::stop_exploder("fxexp_quest_raygun_m2_v_stage_6_active");
    cleanup_step_2();
}

// Namespace namespace_ca03bbb4/namespace_ca03bbb4
// Params 0, eflags: 0x1 linked
// Checksum 0xe48674a5, Offset: 0x1890
// Size: 0x74
function function_17f3e9e2() {
    s_unitrigger = level.var_9eccff99.var_fead3ae9 zm_unitrigger::create(&function_7015dc35);
    zm_unitrigger::unitrigger_force_per_player_triggers(s_unitrigger);
    level.var_9eccff99.var_fead3ae9 thread function_2ac1278b();
}

// Namespace namespace_ca03bbb4/namespace_ca03bbb4
// Params 1, eflags: 0x5 linked
// Checksum 0xe4b3869b, Offset: 0x1910
// Size: 0x84
function private function_7015dc35(e_player) {
    if (isdefined(e_player)) {
        if (level.var_9eccff99.e_player === e_player) {
            self sethintstring(#"hash_14eae7c162ebb8d2");
        } else {
            self sethintstring(#"hash_2054e8fdb6521566");
        }
        return true;
    }
    return false;
}

// Namespace namespace_ca03bbb4/namespace_ca03bbb4
// Params 0, eflags: 0x5 linked
// Checksum 0xd3de05e1, Offset: 0x19a0
// Size: 0xac
function private function_2ac1278b() {
    self endon(#"death");
    while (true) {
        s_notify = self waittill(#"trigger_activated");
        e_player = s_notify.e_who;
        if (function_18a1849f(e_player)) {
            namespace_bd74bbd2::start(#"sc_mk2v");
            zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
            break;
        }
    }
}

// Namespace namespace_ca03bbb4/namespace_ca03bbb4
// Params 0, eflags: 0x1 linked
// Checksum 0x49a69dd, Offset: 0x1a58
// Size: 0xc4
function cleanup_step_3() {
    function_e09a7418();
    if (isdefined(level.var_9eccff99.var_fead3ae9)) {
        namespace_bd74bbd2::end(#"sc_mk2v");
        level.var_9eccff99.var_fead3ae9 delete();
        return;
    }
    s_gen = struct::get("mk2v_gen");
    s_gen notify(#"stop_think");
    zm_unitrigger::unregister_unitrigger(s_gen.s_unitrigger);
}

// Namespace namespace_ca03bbb4/namespace_ca03bbb4
// Params 0, eflags: 0x5 linked
// Checksum 0x6f919564, Offset: 0x1b28
// Size: 0x3a
function private start_step_4() {
    level.var_9eccff99.e_player thread function_cba90c3c();
    level.var_9eccff99.n_step = 4;
}

// Namespace namespace_ca03bbb4/namespace_ca03bbb4
// Params 0, eflags: 0x5 linked
// Checksum 0x2135d3a1, Offset: 0x1b70
// Size: 0x4c
function private function_cba90c3c() {
    self endon(#"death");
    self waittill(#"hash_13f3f231b45420ef");
    self thread function_62ac32b9();
    complete_quest();
}

// Namespace namespace_ca03bbb4/namespace_ca03bbb4
// Params 0, eflags: 0x1 linked
// Checksum 0x2d4330bb, Offset: 0x1bc8
// Size: 0x94
function function_62ac32b9() {
    if (zm_utility::is_classic()) {
        zm_hms_util::function_29fe9a5d();
        self zm_vo::vo_stop();
        self zm_hms_util::function_51b752a9("vox_ww_v_craft");
        if (!zm_white_main_quest::function_6cebbce1()) {
            self zm_audio::do_player_or_npc_playvox("vox_ww_v_craft_rush_1", 1);
        }
    }
}

// Namespace namespace_ca03bbb4/namespace_ca03bbb4
// Params 0, eflags: 0x5 linked
// Checksum 0x4c752305, Offset: 0x1c68
// Size: 0xc2
function private complete_quest() {
    /#
        if (getdvarint(#"hash_7919e37cd5d57659", 0)) {
            iprintlnbold(level.var_9eccff99.e_player.name + "<unknown string>");
            println(level.var_9eccff99.e_player.name + "<unknown string>");
        }
    #/
    level.var_9eccff99.e_player = undefined;
    level.var_9eccff99.n_step = 5;
}

// Namespace namespace_ca03bbb4/namespace_ca03bbb4
// Params 0, eflags: 0x5 linked
// Checksum 0x32b0dd06, Offset: 0x1d38
// Size: 0x34
function private on_disconnect() {
    if (function_18a1849f(self)) {
        restart_quest();
    }
}

// Namespace namespace_ca03bbb4/namespace_ca03bbb4
// Params 1, eflags: 0x5 linked
// Checksum 0x7e18a215, Offset: 0x1d78
// Size: 0xd4
function private restart_quest(var_e19b7aed = 1) {
    switch (level.var_9eccff99.n_step) {
    case 1:
        var_e19b7aed = 0;
        break;
    case 2:
        cleanup_step_2();
        break;
    case 3:
        cleanup_step_3();
        break;
    }
    level.var_9eccff99.e_player = undefined;
    if (var_e19b7aed) {
        start_step_1();
    }
}

// Namespace namespace_ca03bbb4/namespace_ca03bbb4
// Params 0, eflags: 0x1 linked
// Checksum 0x3c353ed8, Offset: 0x1e58
// Size: 0xf4
function function_cbeb9a33() {
    level waittill(#"insanity_mode_triggered");
    exploder::stop_exploder("fxexp_quest_raygun_m2_v_stage_1" + level.var_9eccff99.s_start.exploder_id);
    if (isdefined(level.var_9eccff99.var_fead3ae9) && isdefined(level.var_9eccff99.var_fead3ae9.s_unitrigger)) {
        zm_unitrigger::unregister_unitrigger(level.var_9eccff99.var_fead3ae9.s_unitrigger);
        level.var_9eccff99.var_fead3ae9 delete();
    }
    restart_quest(0);
}

