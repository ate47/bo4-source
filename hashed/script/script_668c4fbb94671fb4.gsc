#using script_46cea9e5d4ef9e21;
#using scripts\core_common\ai\systems\gib;
#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\ai_shared;
#using scripts\core_common\animation_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\laststand_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\values_shared;
#using scripts\core_common\vehicle_shared;
#using scripts\zm\weapons\zm_weap_spectral_shield;
#using scripts\zm\zm_escape_paschal;
#using scripts\zm\zm_escape_util;
#using scripts\zm_common\ai\zm_ai_utility;
#using scripts\zm_common\bgbs\zm_bgb_anywhere_but_here;
#using scripts\zm_common\util\ai_brutus_util;
#using scripts\zm_common\zm;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_characters;
#using scripts\zm_common\zm_cleanup_mgr;
#using scripts\zm_common\zm_customgame;
#using scripts\zm_common\zm_devgui;
#using scripts\zm_common\zm_equipment;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_vo;
#using scripts\zm_common\zm_zonemgr;

#namespace namespace_a9aa9d72;

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x2
// Checksum 0x30652922, Offset: 0x968
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_3478ed13fc9440e6", &__init__, undefined, undefined);
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x1 linked
// Checksum 0xc5be85b7, Offset: 0x9b0
// Size: 0x78c
function __init__() {
    n_bits = getminbitcountfornum(3);
    clientfield::register("scriptmover", "" + #"hash_632f7bc0b1a15f71", 1, n_bits, "int");
    clientfield::register("scriptmover", "" + #"hash_4614e4fa180c79af", 1, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_53586aa63ca15286", 1, 1, "int");
    clientfield::register("actor", "" + #"hash_65da20412fcaf97e", 1, 2, "int");
    clientfield::register("scriptmover", "" + #"hash_65da20412fcaf97e", 1, 2, "int");
    clientfield::register("toplayer", "" + #"hash_7d4d423d8dabbee3", 1, getminbitcountfornum(10), "int");
    clientfield::register("toplayer", "" + #"hash_46bc4b451b7419bb", 1, getminbitcountfornum(3), "int");
    clientfield::register("toplayer", "" + #"hash_49fecafe0b5d6da4", 1, 2, "counter");
    clientfield::register("vehicle", "" + #"hash_584f13d0c8662647", 1, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_584f13d0c8662647", 1, 1, "int");
    clientfield::register("vehicle", "" + #"hash_22ffb9cf999f16c0", 1, 1, "counter");
    clientfield::register("scriptmover", "" + #"hash_22ffb9cf999f16c0", 1, 1, "counter");
    clientfield::register("scriptmover", "" + #"hash_a51ae59006ab41b", 1, getminbitcountfornum(4), "int");
    clientfield::register("scriptmover", "" + #"hash_64f2dd36b17bf17", 1, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_119729072e708651", 1, 1, "int");
    clientfield::register("actor", "" + #"hash_3e506d7aedac6ae0", 1, getminbitcountfornum(10), "int");
    clientfield::register("actor", "" + #"hash_34562274d7e875a4", 1, getminbitcountfornum(10), "int");
    clientfield::register("scriptmover", "" + #"hash_504d26c38b96651c", 1, getminbitcountfornum(10), "int");
    clientfield::register("vehicle", "" + #"hash_504d26c38b96651c", 1, getminbitcountfornum(10), "int");
    clientfield::register("scriptmover", "" + #"hash_7dc9331ef45ed81f", 1, getminbitcountfornum(10), "int");
    clientfield::register("scriptmover", "" + #"hash_7dc9341ef45ed9d2", 1, getminbitcountfornum(10), "int");
    clientfield::register("scriptmover", "" + #"hash_7dc9351ef45edb85", 1, getminbitcountfornum(10), "int");
    clientfield::register("actor", "" + #"hash_7a8eab5597b25400", 1, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_28a1a80b64f97e05", 1, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_7f7790ca43a7fffe", 1, 1, "int");
    clientfield::register("world", "" + #"hash_437bd1912fc36607", 9000, 1, "int");
    if (zm_utility::is_ee_enabled()) {
        /#
            level thread function_96ac2d88();
        #/
    }
    level thread function_b247e756();
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0x987b8428, Offset: 0x1148
// Size: 0x34
function private function_b247e756() {
    level waittill(#"all_players_spawned");
    hidemiscmodels("rt_gh_sanim");
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x1 linked
// Checksum 0xecaa841f, Offset: 0x1188
// Size: 0x3a0
function function_307fdd13(var_a276c861) {
    if (var_a276c861) {
        var_328baab5 = struct::get_array("pa_po_pos", "targetname");
        foreach (s_portal_pos in var_328baab5) {
            var_aa11c23c = util::spawn_model("tag_origin", s_portal_pos.origin, s_portal_pos.angles);
            var_aa11c23c.script_string = s_portal_pos.script_string;
            level thread paschal::function_e998f810("tag_socket_a");
            level thread paschal::function_e998f810("tag_socket_c");
            level thread paschal::function_e998f810("tag_socket_d");
            level thread paschal::function_e998f810("tag_socket_e");
            level thread paschal::function_e998f810("tag_socket_g");
            var_aa11c23c clientfield::set("" + #"hash_632f7bc0b1a15f71", 2);
            exploder::exploder("fxexp_script_l_d");
            exploder::exploder("fxexp_script_l_c");
            exploder::exploder("fxexp_script_l_n_i");
            exploder::exploder("fxexp_script_l_s");
            exploder::exploder("fxexp_script_l_p_p");
            var_aa11c23c clientfield::set("" + #"hash_53586aa63ca15286", 1);
            waitframe(1);
            var_aa11c23c clientfield::set("" + #"hash_53586aa63ca15286", 0);
        }
        return;
    }
    zm::register_actor_damage_callback(&function_1d42763a);
    level clientfield::set("" + #"hash_437bd1912fc36607", 1);
    level.var_85cc9fcc = array("docks", "cellblock", "new_industries", "showers", "power_plant");
    level function_486ef0f6();
    level clientfield::set("" + #"hash_437bd1912fc36607", 0);
    level notify(#"hash_29b90ce9aa921f78");
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0x2b9adebe, Offset: 0x1530
// Size: 0xaa0
function private function_486ef0f6() {
    level endon(#"game_ended", #"hash_54eae43edf7f08cd");
    if (!isdefined(level.var_bbc27d0e)) {
        var_c26c0a90 = struct::get("k_fx_pos", "targetname");
        level.var_bbc27d0e = util::spawn_model(#"hash_4c06bc763e373f0f", var_c26c0a90.origin, var_c26c0a90.angles);
    }
    var_a9b19429 = 0;
    while (level.var_85cc9fcc.size > 0) {
        if (!(isdefined(level.var_d486e9c4) && level.var_d486e9c4)) {
            if (var_a9b19429) {
                level.var_bbc27d0e thread paschal::function_9e723e9(3, 1);
            }
            level.var_bbc27d0e thread function_a9277243();
            level.var_bbc27d0e thread scene::play("p8_fxanim_zm_esc_book_zombie_shuffle_bundle", "Shot 2", level.var_bbc27d0e);
            level.var_bbc27d0e clientfield::set("" + #"hash_4614e4fa180c79af", 1);
            level.var_bbc27d0e waittill(#"hash_1f3cf68a268a10f1");
            level.var_bbc27d0e clientfield::set("" + #"hash_4614e4fa180c79af", 0);
            level.var_bbc27d0e thread scene::play("p8_fxanim_zm_esc_book_zombie_shuffle_bundle", "Shot 1", level.var_bbc27d0e);
        }
        var_aa11c23c = function_9f38c4a2();
        var_aa11c23c clientfield::set("" + #"hash_632f7bc0b1a15f71", 1);
        switch (var_aa11c23c.script_string) {
        case #"docks":
            str_hint_text = #"hash_4213dc004145588f";
            break;
        case #"cellblock":
            str_hint_text = #"hash_70fa5ff9f448bc96";
            break;
        case #"new_industries":
            str_hint_text = #"hash_786af67b8225aaf4";
            break;
        case #"showers":
            str_hint_text = #"hash_8a1754e2c346504";
            break;
        case #"power_plant":
            str_hint_text = #"hash_7806b6b51cd2aed2";
            break;
        }
        if (!(isdefined(level.var_d486e9c4) && level.var_d486e9c4)) {
            level.var_99b333e1 = level function_23fa3cae();
            var_4894fd91 = "" + level.var_99b333e1[0] + level.var_99b333e1[1] + level.var_99b333e1[2];
            level thread function_c5319ebe();
            callback::on_connect(&function_c5319ebe);
            level thread function_5b7bbc40();
            while (true) {
                s_result = level waittill(#"hash_1ba800da972b0558");
                if (s_result.str_code == var_4894fd91) {
                    arrayremovevalue(level.var_d8e7f0cf, level.var_99b333e1);
                    level thread function_b3df3f03();
                    break;
                }
            }
        }
        var_aa11c23c thread paschal::function_9e723e9();
        level thread function_9b1d9d6a();
        var_aa11c23c clientfield::set("" + #"hash_53586aa63ca15286", 1);
        if (!(isdefined(level.var_d486e9c4) && level.var_d486e9c4)) {
            var_aa11c23c thread function_d3aa5310();
            s_result = var_aa11c23c waittill(#"portal_timeout", #"blast_attack");
            if (s_result._notify == #"portal_timeout") {
                var_aa11c23c clientfield::set("" + #"hash_632f7bc0b1a15f71", 0);
                var_aa11c23c delete();
                var_a9b19429 = 1;
                continue;
            }
        } else {
            level.var_d486e9c4 = undefined;
            waitframe(1);
        }
        var_a9b19429 = 1;
        var_aa11c23c clientfield::set("" + #"hash_53586aa63ca15286", 0);
        s_beam = struct::get("s_p_s1_lh_r_light");
        s_beam.mdl_beam clientfield::set("" + #"hash_1f572bbcdde55d9d", 0);
        switch (var_aa11c23c.script_string) {
        case #"docks":
            var_aa11c23c.var_be009f9c = "tag_socket_g";
            var_81c75ce3 = "fxexp_script_l_d";
            var_aa11c23c thread function_b264ca4d();
            break;
        case #"cellblock":
            var_aa11c23c.var_be009f9c = "tag_socket_e";
            var_81c75ce3 = "fxexp_script_l_c";
            var_aa11c23c thread function_2b37242f();
            break;
        case #"new_industries":
            var_aa11c23c.var_be009f9c = "tag_socket_c";
            var_81c75ce3 = "fxexp_script_l_n_i";
            var_aa11c23c thread function_cdc8090a();
            break;
        case #"showers":
            var_aa11c23c.var_be009f9c = "tag_socket_d";
            var_81c75ce3 = "fxexp_script_l_s";
            var_aa11c23c thread function_b80b6749();
            break;
        case #"power_plant":
            var_aa11c23c.var_be009f9c = "tag_socket_a";
            var_81c75ce3 = "fxexp_script_l_p_p";
            var_aa11c23c thread function_c11e25eb();
            break;
        }
        /#
            var_aa11c23c thread function_283daa98();
        #/
        s_result = var_aa11c23c waittill(#"hash_300e9fed7925cd69");
        if (isdefined(s_result.b_success) && s_result.b_success) {
            var_aa11c23c clientfield::set("" + #"hash_632f7bc0b1a15f71", 2);
            exploder::exploder(var_81c75ce3);
            foreach (e_player in util::get_active_players()) {
                e_player clientfield::increment_to_player("" + #"hero_katana_vigor_postfx");
                e_player playrumbleonentity("damage_heavy");
            }
        } else {
            var_aa11c23c clientfield::set("" + #"hash_632f7bc0b1a15f71", 0);
            var_aa11c23c delete();
            if (!(isdefined(s_result.var_d0af61fc) && s_result.var_d0af61fc)) {
                level waittill(#"between_round_over");
            }
            continue;
        }
        arrayremovevalue(level.var_85cc9fcc, var_aa11c23c.script_string);
    }
    level.var_bbc27d0e thread paschal::function_9e723e9();
    var_c699e2b5 = struct::get("s_p_s2_ins");
    while (level.var_dd650b0e.size < 6) {
        var_c699e2b5.s_unitrigger_stub waittill(#"hash_4c6ab2a4a99f9539");
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0xd402fd08, Offset: 0x1fd8
// Size: 0x186
function private function_9f38c4a2() {
    if (isdefined(level.var_daaf0e5d) && isinarray(level.var_85cc9fcc, level.var_daaf0e5d)) {
        var_ce57a284 = level.var_daaf0e5d;
        level.var_daaf0e5d = undefined;
    } else {
        var_ce57a284 = array::random(level.var_85cc9fcc);
    }
    var_328baab5 = struct::get_array("pa_po_pos", "targetname");
    foreach (s_portal_pos in var_328baab5) {
        if (s_portal_pos.script_string === var_ce57a284) {
            var_aa11c23c = util::spawn_model("tag_origin", s_portal_pos.origin, s_portal_pos.angles);
            var_aa11c23c.script_string = s_portal_pos.script_string;
            var_aa11c23c.script_noteworthy = "blast_attack_interactables";
            break;
        }
    }
    return var_aa11c23c;
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0xb04c9a52, Offset: 0x2168
// Size: 0x2c2
function private function_23fa3cae() {
    var_8171dd3a = randomint(10);
    var_8dfff656 = randomint(10);
    for (var_44e1e41b = randomint(10); !namespace_1063645::function_aac7105a(var_8171dd3a, var_8dfff656, var_44e1e41b); var_44e1e41b = randomint(10)) {
        var_8171dd3a = randomint(10);
        var_8dfff656 = randomint(10);
    }
    if (!isdefined(level.var_d8e7f0cf)) {
        level.var_d8e7f0cf = [];
    } else if (!isarray(level.var_d8e7f0cf)) {
        level.var_d8e7f0cf = array(level.var_d8e7f0cf);
    }
    if (!isinarray(level.var_d8e7f0cf, array(var_8171dd3a, var_8dfff656, var_44e1e41b))) {
        level.var_d8e7f0cf[level.var_d8e7f0cf.size] = array(var_8171dd3a, var_8dfff656, var_44e1e41b);
    }
    var_679f0ee5 = struct::get_array("nixie_tubes", "script_noteworthy");
    foreach (var_18b64c03 in var_679f0ee5) {
        switch (var_18b64c03.script_string) {
        case #"nixie_tube_trigger_1":
            n_code = var_8171dd3a;
            break;
        case #"nixie_tube_trigger_2":
            n_code = var_8dfff656;
            break;
        case #"nixie_tube_trigger_3":
            n_code = var_44e1e41b;
            break;
        }
    }
    return array(var_8171dd3a, var_8dfff656, var_44e1e41b);
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0xaf9282e4, Offset: 0x2438
// Size: 0x1ce
function private function_c5319ebe() {
    level.var_bbc27d0e clientfield::set("" + #"hash_7dc9331ef45ed81f", 0);
    level.var_bbc27d0e clientfield::set("" + #"hash_7dc9341ef45ed9d2", 0);
    level.var_bbc27d0e clientfield::set("" + #"hash_7dc9351ef45edb85", 0);
    for (i = 0; i < level.var_99b333e1.size; i++) {
        switch (i) {
        case 0:
            var_5a557bfb = "" + #"hash_7dc9331ef45ed81f";
            break;
        case 1:
            var_5a557bfb = "" + #"hash_7dc9341ef45ed9d2";
            break;
        case 2:
            var_5a557bfb = "" + #"hash_7dc9351ef45edb85";
            break;
        }
        if (level.var_99b333e1[i] == 0) {
            level.var_bbc27d0e clientfield::set(var_5a557bfb, 10);
            continue;
        }
        level.var_bbc27d0e clientfield::set(var_5a557bfb, level.var_99b333e1[i]);
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0x58ef992c, Offset: 0x2610
// Size: 0xb4
function private function_b3df3f03() {
    callback::remove_on_connect(&function_c5319ebe);
    level.var_bbc27d0e clientfield::set("" + #"hash_7dc9331ef45ed81f", 0);
    level.var_bbc27d0e clientfield::set("" + #"hash_7dc9341ef45ed9d2", 0);
    level.var_bbc27d0e clientfield::set("" + #"hash_7dc9351ef45edb85", 0);
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0x1aa75c1d, Offset: 0x26d0
// Size: 0x148
function private function_5b7bbc40() {
    foreach (e_player in util::get_players()) {
        w_current = e_player getcurrentweapon();
        if (w_current == level.var_4e845c84 || w_current == level.var_58e17ce3) {
            if (e_player adsbuttonpressed()) {
                e_player clientfield::set("" + #"hash_184a34e85c29399f", 0);
                util::wait_network_frame();
                e_player clientfield::set("" + #"hash_184a34e85c29399f", 1);
            }
        }
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0x4daeaf7e, Offset: 0x2820
// Size: 0x66
function private function_d3aa5310() {
    self endon(#"death", #"hash_300e9fed7925cd69", #"blast_attack");
    wait 180;
    level waittill(#"between_round_over");
    self notify(#"portal_timeout");
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0xa8eeee67, Offset: 0x2890
// Size: 0x626
function private function_b264ca4d() {
    self endoncallback(&function_5711b0c2, #"death", #"hash_300e9fed7925cd69");
    b_success = undefined;
    level.var_5deac933 = [];
    var_3df8381d = level function_5dc786f7();
    var_6433d2a2 = getent("m_c_ra", "targetname");
    var_6433d2a2 thread function_333c93f3(var_3df8381d);
    level waittill(#"hash_3ffb8bc647b5d06b");
    var_6e25652d = getvehiclenode("gh_b_st_node", "targetname");
    level.var_ddea3ebd = vehicle::spawn(undefined, "gh_tb", #"hash_741d76f17830f464", var_6e25652d.origin, var_6e25652d.angles);
    level.var_ddea3ebd thread function_c2f5fca4(var_6e25652d);
    array::thread_all(util::get_players(), &function_29d29761, level.var_ddea3ebd, #"hash_115ac6d40d4cc85b");
    self thread function_c3923440();
    level waittill(#"hash_361c36fab747c7f0");
    var_4f11e61a = struct::get("gh_d_pos", "targetname");
    level.var_ddea3ebd notify(#"stop_path");
    level.var_ddea3ebd vehicle::detach_path();
    level.var_ddea3ebd clientfield::set("" + #"hash_504d26c38b96651c", 0);
    level.var_ddea3ebd clientfield::increment("" + #"hash_22ffb9cf999f16c0");
    waitframe(1);
    level.var_ddea3ebd delete();
    wait 0.5;
    level.var_a33f961e = util::spawn_model(var_4f11e61a.model, var_4f11e61a.origin, var_4f11e61a.angles);
    level.var_a33f961e clientfield::set("" + #"hash_504d26c38b96651c", 1);
    level.var_a33f961e clientfield::set("" + #"hash_584f13d0c8662647", 1);
    waitframe(1);
    level.var_a33f961e clientfield::increment("" + #"hash_22ffb9cf999f16c0");
    level.var_a33f961e playsound(#"hash_2cd9134632e7f398");
    level.var_a33f961e playloopsound(#"hash_5ca999a30dd19c01");
    var_b9526d6f = struct::get("gh_b_pos", "targetname");
    level.var_aca3d5e = spawn("trigger_radius_new", var_b9526d6f.origin, (512 | 2) + 8, var_b9526d6f.radius);
    while (true) {
        s_result = level.var_aca3d5e waittill(#"trigger");
        if (s_result.activator == level.var_558993a0) {
            callback::remove_on_ai_killed(&function_744712bc);
            level.var_558993a0 notify(#"hash_71716a8e79096aee");
            if (isdefined(level.var_558993a0.t_interact)) {
                level.var_558993a0.t_interact delete();
            }
            var_7df17d61 = level.var_558993a0.origin;
            level.var_558993a0 delete();
            break;
        }
    }
    level.var_aca3d5e delete();
    level.var_a33f961e thread function_dbb17bef(var_4f11e61a);
    var_9c502e92 = 1;
    if (isdefined(var_9c502e92) && var_9c502e92) {
        self thread function_56e41aa6(var_7df17d61);
        level thread function_ac1d7a0e(#"hash_7d360b71501ba662");
    }
    self thread function_5711b0c2();
    self notify(#"hash_300e9fed7925cd69", {#b_success:var_9c502e92});
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x5 linked
// Checksum 0x5cad5a44, Offset: 0x2ec0
// Size: 0x1ac
function private function_5711b0c2(var_c34665fc) {
    callback::remove_on_ai_killed(&function_744712bc);
    if (isdefined(level.var_66a47b57)) {
        level.var_66a47b57 delete();
    }
    if (isdefined(level.var_558993a0)) {
        if (isdefined(level.var_558993a0.t_interact)) {
            level.var_558993a0.t_interact delete();
        }
        level.var_558993a0 delete();
    }
    if (isdefined(level.var_ddea3ebd)) {
        level.var_ddea3ebd delete();
    }
    if (isdefined(level.a_t_codes)) {
        while (level.a_t_codes.size) {
            t_code = level.a_t_codes[0];
            t_code delete();
            arrayremovevalue(level.a_t_codes, t_code);
        }
        level.a_t_codes = undefined;
    }
    if (isdefined(level.var_a33f961e)) {
        level.var_a33f961e delete();
    }
    if (isdefined(level.var_aca3d5e)) {
        level.var_aca3d5e delete();
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x5 linked
// Checksum 0x7e056a27, Offset: 0x3078
// Size: 0xfe
function private function_c2f5fca4(var_6e25652d) {
    self endon(#"death", #"stop_path");
    waitframe(1);
    self clientfield::increment("" + #"hash_22ffb9cf999f16c0");
    self clientfield::set("" + #"hash_584f13d0c8662647", 1);
    self clientfield::set("" + #"hash_504d26c38b96651c", 1);
    while (true) {
        self vehicle::get_on_and_go_path(var_6e25652d);
        self vehicle::detach_path();
        waitframe(1);
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0x291a7dac, Offset: 0x3180
// Size: 0x324
function private function_5dc786f7() {
    var_304cc83e = randomint(10);
    var_a31c3d78 = randomint(10);
    var_17a14b0b = randomint(10);
    var_3df8381d = var_304cc83e + var_a31c3d78 + var_17a14b0b;
    level.a_t_codes = [];
    var_991213f6 = struct::get_array("m_c_pos", "targetname");
    foreach (var_844fa02e in var_991213f6) {
        t_code = spawn("trigger_radius_new", var_844fa02e.origin, 0, var_844fa02e.radius, 96);
        t_code.script_noteworthy = var_844fa02e.script_noteworthy;
        t_code.targetname = var_844fa02e.targetname;
        t_code.s_lookat = struct::get(var_844fa02e.target, "targetname");
        if (!isdefined(level.a_t_codes)) {
            level.a_t_codes = [];
        } else if (!isarray(level.a_t_codes)) {
            level.a_t_codes = array(level.a_t_codes);
        }
        if (!isinarray(level.a_t_codes, t_code)) {
            level.a_t_codes[level.a_t_codes.size] = t_code;
        }
        switch (var_844fa02e.script_noteworthy) {
        case #"gondola_platform":
            t_code.n_code = var_17a14b0b;
            t_code.n_expl = 2;
            break;
        case #"catwalk":
            t_code.n_code = var_304cc83e;
            t_code.n_expl = 0;
            break;
        case #"model_industries":
            t_code.n_code = var_a31c3d78;
            t_code.n_expl = 1;
            break;
        }
        t_code thread function_45862f35();
    }
    return var_3df8381d;
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0xef46a09e, Offset: 0x34b0
// Size: 0xee
function private function_45862f35() {
    level endon(#"hash_3ffb8bc647b5d06b");
    self endon(#"death");
    while (true) {
        s_result = self waittill(#"trigger");
        if (isplayer(s_result.activator) && !(isdefined(s_result.activator.var_f0096e2c) && s_result.activator.var_f0096e2c)) {
            s_result.activator.var_f0096e2c = 1;
            self thread function_76e46dd1(s_result.activator);
        }
        waitframe(1);
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x5 linked
// Checksum 0x3577334, Offset: 0x35a8
// Size: 0x3a2
function private function_76e46dd1(e_player) {
    level endon(#"hash_3ffb8bc647b5d06b");
    e_player endon(#"death");
    self endon(#"death");
    while (e_player istouching(self)) {
        w_current = e_player getcurrentweapon();
        if ((w_current == level.var_4e845c84 || w_current == level.var_58e17ce3) && e_player util::is_looking_at(self.s_lookat.origin)) {
            e_player thread function_bb88526(self.n_code);
            if (!isdefined(level.var_5deac933)) {
                level.var_5deac933 = [];
            } else if (!isarray(level.var_5deac933)) {
                level.var_5deac933 = array(level.var_5deac933);
            }
            if (!isinarray(level.var_5deac933, self)) {
                level.var_5deac933[level.var_5deac933.size] = self;
            }
            e_player clientfield::set_to_player("" + #"hash_46bc4b451b7419bb", self.n_expl + 1);
            if (level.var_5deac933.size >= 3) {
                level notify(#"hash_31bf59ee8be67433");
            }
            n_start_time = gettime();
            for (n_total_time = 0; n_total_time < 8 && e_player istouching(self) && (w_current == level.var_4e845c84 || w_current == level.var_58e17ce3) && e_player util::is_looking_at(self.s_lookat.origin); n_total_time = (n_current_time - n_start_time) / 1000) {
                wait 0.1;
                w_current = e_player getcurrentweapon();
                n_current_time = gettime();
            }
            e_player clientfield::set_to_player("" + #"hash_46bc4b451b7419bb", 0);
            if (e_player clientfield::get_to_player("" + #"hash_7d4d423d8dabbee3")) {
                e_player clientfield::set_to_player("" + #"hash_7d4d423d8dabbee3", 0);
            }
        }
        wait 1.6;
    }
    e_player.var_f0096e2c = undefined;
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x5 linked
// Checksum 0x5425721f, Offset: 0x3958
// Size: 0x74
function private function_bb88526(n_num) {
    if (n_num == 0) {
        self clientfield::set_to_player("" + #"hash_7d4d423d8dabbee3", 10);
        return;
    }
    self clientfield::set_to_player("" + #"hash_7d4d423d8dabbee3", n_num);
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x5 linked
// Checksum 0x2df00809, Offset: 0x39d8
// Size: 0x8f6
function private function_333c93f3(var_3df8381d) {
    level.var_66a47b57 = spawn("trigger_radius_use", self.origin, 0, 48);
    level.var_66a47b57 triggerignoreteam();
    level.var_66a47b57 sethintstring(#"");
    level.var_66a47b57 setcursorhint("HINT_NOICON");
    level.var_66a47b57.is_visible = 1;
    level.var_66a47b57 endon(#"death");
    var_ae5529ba = undefined;
    var_9b830416 = 0;
    var_af097de7 = [];
    var_77d58f80 = [];
    var_3ad399df = #"code_dot";
    var_ca1854a9 = #"code_dash";
    if (var_3df8381d == 30) {
        var_ae5529ba = 3;
        var_af097de7 = array(var_3ad399df, var_3ad399df, var_3ad399df, var_ca1854a9, var_ca1854a9);
    } else if (var_3df8381d >= 20) {
        var_ae5529ba = 2;
        var_af097de7 = array(var_3ad399df, var_3ad399df, var_ca1854a9, var_ca1854a9, var_ca1854a9);
    } else if (var_3df8381d >= 10) {
        var_ae5529ba = 1;
        var_af097de7 = array(var_3ad399df, var_ca1854a9, var_ca1854a9, var_ca1854a9, var_ca1854a9);
    }
    switch (var_3df8381d) {
    case 1:
    case 11:
    case 21:
        var_9b830416 = 1;
        var_77d58f80 = array(var_3ad399df, var_ca1854a9, var_ca1854a9, var_ca1854a9, var_ca1854a9);
        break;
    case 2:
    case 12:
    case 22:
        var_9b830416 = 2;
        var_77d58f80 = array(var_3ad399df, var_3ad399df, var_ca1854a9, var_ca1854a9, var_ca1854a9);
        break;
    case 3:
    case 13:
    case 23:
        var_9b830416 = 3;
        var_77d58f80 = array(var_3ad399df, var_3ad399df, var_3ad399df, var_ca1854a9, var_ca1854a9);
        break;
    case 4:
    case 14:
    case 24:
        var_9b830416 = 4;
        var_77d58f80 = array(var_3ad399df, var_3ad399df, var_3ad399df, var_3ad399df, var_ca1854a9);
        break;
    case 5:
    case 15:
    case 25:
        var_9b830416 = 5;
        var_77d58f80 = array(var_3ad399df, var_3ad399df, var_3ad399df, var_3ad399df, var_3ad399df);
        break;
    case 6:
    case 16:
    case 26:
        var_9b830416 = 6;
        var_77d58f80 = array(var_ca1854a9, var_3ad399df, var_3ad399df, var_3ad399df, var_3ad399df);
        break;
    case 7:
    case 17:
    case 27:
        var_9b830416 = 7;
        var_77d58f80 = array(var_ca1854a9, var_ca1854a9, var_3ad399df, var_3ad399df, var_3ad399df);
        break;
    case 8:
    case 18:
    case 28:
        var_9b830416 = 8;
        var_77d58f80 = array(var_ca1854a9, var_ca1854a9, var_ca1854a9, var_3ad399df, var_3ad399df);
        break;
    case 9:
    case 19:
    case 29:
        var_9b830416 = 9;
        var_77d58f80 = array(var_ca1854a9, var_ca1854a9, var_ca1854a9, var_ca1854a9, var_3ad399df);
        break;
    case 0:
    case 10:
    case 20:
    case 30:
        var_9b830416 = 0;
        var_77d58f80 = array(var_ca1854a9, var_ca1854a9, var_ca1854a9, var_ca1854a9, var_ca1854a9);
        break;
    default:
        break;
    }
    var_fda79bf3 = 0;
    while (true) {
        s_result = level.var_66a47b57 waittill(#"trigger");
        e_player = s_result.activator;
        level.var_66a47b57 setinvisibletoall();
        level.var_66a47b57.is_visible = 0;
        if (!isplayer(e_player)) {
            level.var_66a47b57 setvisibletoall();
            level.var_66a47b57.is_visible = 1;
            continue;
        }
        if (!(isdefined(var_fda79bf3) && var_fda79bf3)) {
            level.var_66a47b57 thread function_b87b2393();
            var_fda79bf3 = 1;
        }
        if (isdefined(var_ae5529ba) && var_ae5529ba > 0) {
            var_49e994d2 = e_player function_bfe4e5a9(var_af097de7, var_ae5529ba);
            if (!(isdefined(var_49e994d2) && var_49e994d2)) {
                if (isdefined(e_player)) {
                    e_player playlocalsound(#"hash_28d80c177e66c724");
                }
                level.var_66a47b57 setvisibletoall();
                level.var_66a47b57.is_visible = 1;
                continue;
            }
        }
        if (isplayer(e_player)) {
            var_5830315f = e_player function_bfe4e5a9(var_77d58f80, var_9b830416);
            if (isdefined(var_5830315f) && var_5830315f) {
                playsoundatposition(#"zmb_lightning_l", level.var_66a47b57.origin);
                level notify(#"hash_3ffb8bc647b5d06b");
                e_player thread zm_audio::create_and_play_dialog(#"success_resp", #"generic");
                level.var_66a47b57 delete();
                return;
            } else if (isdefined(e_player)) {
                e_player playlocalsound(#"hash_28d80c177e66c724");
            }
        }
        level.var_66a47b57 setvisibletoall();
        level.var_66a47b57.is_visible = 1;
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0x29e08c6c, Offset: 0x42d8
// Size: 0xb8
function private function_b87b2393() {
    self endon(#"death");
    level endon(#"hash_3ffb8bc647b5d06b");
    level waittill(#"end_of_round");
    while (isdefined(level.var_66a47b57) && !(isdefined(level.var_66a47b57.is_visible) && level.var_66a47b57.is_visible)) {
        waitframe(1);
    }
    level notify(#"hash_1a286cacd101f4eb", {#b_success:0});
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 2, eflags: 0x5 linked
// Checksum 0xcdf41212, Offset: 0x4398
// Size: 0x31e
function private function_bfe4e5a9(var_5faf08a9, n_entry) {
    self.var_da61dab6 = 1;
    self thread function_b8dc82a8();
    mdl_radio = getent("m_c_ra", "targetname");
    if (isdefined(level.var_bf412074) && level.var_bf412074) {
        self thread function_bb88526(n_entry);
        wait 6;
        if (isdefined(self)) {
            self clientfield::set_to_player("" + #"hash_7d4d423d8dabbee3", 0);
        }
        return true;
    } else {
        for (i = 0; i < var_5faf08a9.size; i++) {
            var_6dcb990a = var_5faf08a9[i];
            while (isdefined(self) && !self usebuttonpressed() && isdefined(self.var_da61dab6) && self.var_da61dab6) {
                waitframe(1);
            }
            n_start_time = gettime();
            mdl_radio thread scene::play(#"p8_zm_esc_kmc_bundle", "DOWN", mdl_radio);
            mdl_radio clientfield::set("" + #"hash_7f7790ca43a7fffe", 1);
            while (isdefined(self) && self usebuttonpressed() && isdefined(self.var_da61dab6) && self.var_da61dab6) {
                waitframe(1);
            }
            mdl_radio thread scene::play(#"p8_zm_esc_kmc_bundle", "UP", mdl_radio);
            mdl_radio clientfield::set("" + #"hash_7f7790ca43a7fffe", 0);
            if (!isdefined(self) || !(isdefined(self.var_da61dab6) && self.var_da61dab6)) {
                return false;
            }
            offset_con = gettime();
            n_total_time = (offset_con - n_start_time) / 1000;
            if (n_total_time <= 1.25) {
                var_751473a9 = #"code_dot";
            } else {
                var_751473a9 = #"code_dash";
            }
            if (var_751473a9 !== var_6dcb990a) {
                return false;
            }
        }
    }
    return true;
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0x5b3e40e6, Offset: 0x46c0
// Size: 0x76
function private function_b8dc82a8() {
    self endon(#"death");
    level.var_66a47b57 endon(#"death");
    while (distance2d(self.origin, level.var_66a47b57.origin) <= 64) {
        waitframe(1);
    }
    self.var_da61dab6 = undefined;
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x4
// Checksum 0x5353b269, Offset: 0x4740
// Size: 0x156
function private function_bb47b90d(var_dcd55ef2) {
    self endon(#"death", #"hash_fdbf10dbf063a82");
    var_25d70459 = var_dcd55ef2;
    for (s_next_pos = struct::get(var_dcd55ef2.target, "targetname"); true; s_next_pos = var_dcd55ef2) {
        n_dist = distance(s_next_pos.origin, var_25d70459.origin);
        n_time_travel = n_dist / 45;
        self moveto(s_next_pos.origin, n_time_travel);
        self rotateto(s_next_pos.angles, n_time_travel);
        wait n_time_travel;
        var_25d70459 = s_next_pos;
        if (isdefined(var_25d70459.target)) {
            s_next_pos = struct::get(var_25d70459.target, "targetname");
            continue;
        }
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0xf31c8b1, Offset: 0x48a0
// Size: 0x298
function private function_c3923440() {
    self endon(#"death", #"hash_300e9fed7925cd69");
    callback::on_ai_killed(&function_744712bc);
    s_result = level waittill(#"hash_4e2f6e88e9985f10");
    if (!isdefined(level.var_558993a0) || s_result.ai_ghost !== level.var_558993a0) {
        self notify(#"hash_300e9fed7925cd69", {#b_success:0, #var_d0af61fc:1});
    }
    level.var_558993a0 endon(#"death");
    self thread function_3e62ca0b(level.var_558993a0);
    level.var_558993a0 thread function_1db8a8b2("in_gh_pa");
    level.var_558993a0 waittill(#"blast_attack");
    level.var_558993a0 notify(#"hash_585dd04498227242");
    level.var_558993a0 setgoal(level.var_558993a0.origin);
    level.var_558993a0 clientfield::set("" + #"hash_65da20412fcaf97e", 0);
    level.var_558993a0 thread function_768e71d5();
    level.var_558993a0 waittill(#"hash_17de7292d988f537");
    level.var_558993a0.var_2ef9b50a = 1;
    level.var_558993a0 thread function_4e69659c();
    var_5e7c3fee = getent("pa_do_vol", "targetname");
    while (!level.var_558993a0 istouching(var_5e7c3fee)) {
        wait 1;
    }
    level notify(#"hash_361c36fab747c7f0");
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x1 linked
// Checksum 0x18c65afc, Offset: 0x4b40
// Size: 0x2dc
function function_744712bc(s_params) {
    if (!isdefined(level.var_558993a0) && isplayer(s_params.eattacker) && (self zm_zonemgr::entity_in_zone("zone_infirmary") || self zm_zonemgr::entity_in_zone("zone_infirmary_roof"))) {
        v_teleport_position = self.origin + (0, 0, 5);
        level.var_558993a0 = zombie_utility::spawn_zombie(getent("g_zombie_spawner", "targetname"), "gh_bm");
        while (!isdefined(level.var_558993a0)) {
            waitframe(1);
            level.var_558993a0 = zombie_utility::spawn_zombie(getent("g_zombie_spawner", "targetname"), "gh_bm");
        }
        level.var_558993a0 function_e128a8d4();
        level.var_558993a0 forceteleport(v_teleport_position, self.angles, 1, 1);
        level.var_558993a0.script_noteworthy = "blast_attack_interactables";
        level.var_558993a0 thread function_a51841a(s_params.eattacker, #"hash_fd8e78c22906fc1");
        level.var_558993a0 thread function_ff88f6aa(v_teleport_position);
        waitframe(1);
        level notify(#"hash_4e2f6e88e9985f10", {#ai_ghost:level.var_558993a0});
        return;
    }
    if (isdefined(level.var_558993a0) && isplayer(s_params.eattacker) && distance2d(self.origin, level.var_558993a0.origin) < 600 && isdefined(level.var_558993a0.var_2ef9b50a) && level.var_558993a0.var_2ef9b50a) {
        self thread function_b952c1b(level.var_558993a0);
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0x5e78a428, Offset: 0x4e28
// Size: 0x8a
function private function_e5801a77() {
    self endon(#"death", #"hash_71716a8e79096aee");
    self.var_7fbed236 = 0;
    while (true) {
        s_result = self waittill(#"hash_7b36770a2988e5d1");
        self.var_7fbed236 += 15;
        self notify(#"hash_2499fc5cec93bec8");
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0x91d65c17, Offset: 0x4ec0
// Size: 0x180
function private function_4e69659c() {
    self endon(#"death", #"hash_71716a8e79096aee");
    self thread function_e5801a77();
    while (true) {
        while (self.var_7fbed236 > 0) {
            self.goalradius = 128;
            if (isalive(self.e_activator)) {
                self thread function_23d7198d(self.e_activator);
                self setgoal(self.e_activator);
            } else {
                self setgoal(self.origin);
            }
            wait 0.25;
            self.var_7fbed236 = math::clamp(self.var_7fbed236 - 0.25, 0, 300);
        }
        self setgoal(self.origin);
        self playsound(#"hash_2d161f5686b2700a");
        s_result = self waittill(#"hash_2499fc5cec93bec8");
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x5 linked
// Checksum 0x37f98a0a, Offset: 0x5048
// Size: 0x15c
function private function_23d7198d(e_player) {
    if (self zm_utility::function_ab9a9770() && !e_player zm_utility::function_ab9a9770()) {
        n_distance = distance(self.origin, e_player.origin);
        if (n_distance > 128 && !(isdefined(self.b_teleported) && self.b_teleported)) {
            self thread function_54e0f89(e_player);
        }
    }
    if (self zm_utility::function_ab9a9770() && e_player zm_utility::function_ab9a9770()) {
        if (isdefined(self.t_interact) && !(isdefined(e_player.var_c0a4d6b1) && e_player.var_c0a4d6b1)) {
            e_player.var_c0a4d6b1 = 1;
            self.t_interact setinvisibletoplayer(e_player);
            self thread function_524c833(e_player);
        }
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x5 linked
// Checksum 0x31c3a97d, Offset: 0x51b0
// Size: 0x8e
function private function_524c833(e_player) {
    self endon(#"death");
    e_player endon(#"death");
    while (self zm_utility::function_ab9a9770() && e_player zm_utility::function_ab9a9770()) {
        wait 0.2;
    }
    self.t_interact setvisibletoplayer(e_player);
    e_player.var_c0a4d6b1 = undefined;
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x5 linked
// Checksum 0xbd5a3051, Offset: 0x5248
// Size: 0xda
function private function_54e0f89(e_player) {
    self endon(#"death");
    v_dir = vectornormalize(e_player.origin - self.origin);
    v_pos = e_player.origin + v_dir * 40;
    v_pos = getclosestpointonnavmesh(v_pos, 128, 16);
    if (isdefined(v_pos)) {
        self.b_teleported = 1;
        self forceteleport(v_pos);
        wait 5;
        self.b_teleported = undefined;
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x5 linked
// Checksum 0x7d3d42a6, Offset: 0x5330
// Size: 0x17c
function private function_dbb17bef(var_25d70459) {
    self endon(#"death");
    s_next_pos = struct::get(var_25d70459.target, "targetname");
    n_dist = distance(s_next_pos.origin, var_25d70459.origin);
    n_time_travel = n_dist / 45;
    self moveto(s_next_pos.origin, n_time_travel);
    self rotateto(s_next_pos.angles, n_time_travel);
    wait n_time_travel;
    self stoploopsound();
    self clientfield::increment("" + #"hash_22ffb9cf999f16c0");
    self clientfield::set("" + #"hash_584f13d0c8662647", 0);
    self clientfield::set("" + #"hash_504d26c38b96651c", 0);
    waitframe(1);
    self delete();
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0xd7f71ae2, Offset: 0x54b8
// Size: 0x466
function private function_2b37242f() {
    self endoncallback(&function_e1137e13, #"death", #"hash_300e9fed7925cd69");
    b_success = undefined;
    self thread function_6c1f6b4e();
    level waittill(#"hash_4e2f6e88e9985f10");
    waitframe(1);
    level.var_7b71cdb7 waittill(#"blast_attack");
    level.var_7b71cdb7 notify(#"hash_71716a8e79096aee");
    self thread function_4c8b4a87();
    if (isdefined(level.var_7b71cdb7.t_interact)) {
        level.var_7b71cdb7.t_interact delete();
    }
    a_s_firewalls = struct::get_array("cellblocks_barrier_fx", "targetname");
    self thread function_cd0d0123(a_s_firewalls, "fxexp_flame_wall_door_glow_shower_cellblock");
    level thread function_2c4516ae("cellblock_start_door");
    self thread function_19df5c43();
    level.var_7b71cdb7 thread function_7de21668();
    level.var_7b71cdb7 val::reset(#"ai_ghost", "ignoreme");
    level.var_7b71cdb7 val::reset(#"ai_ghost", "allowdeath");
    level.var_7b71cdb7 setcandamage(1);
    level.var_7b71cdb7 solid();
    if (!(isdefined(zm_ai_utility::is_zombie_target(level.var_7b71cdb7)) && zm_ai_utility::is_zombie_target(level.var_7b71cdb7))) {
        zm_ai_utility::make_zombie_target(level.var_7b71cdb7);
    }
    level.var_7b71cdb7 thread function_67a6f551();
    s_result = level.var_7b71cdb7 waittill(#"death", #"hash_6f435cd868870904");
    if (s_result._notify == #"hash_6f435cd868870904") {
        var_9c502e92 = 1;
    } else {
        v_pos = undefined;
        if (isdefined(level.var_7b71cdb7)) {
            v_pos = level.var_7b71cdb7.origin;
        }
        level thread function_4219d0d8(v_pos);
    }
    if (isdefined(level.var_7b71cdb7)) {
        if (isdefined(zm_ai_utility::is_zombie_target(level.var_7b71cdb7)) && zm_ai_utility::is_zombie_target(level.var_7b71cdb7)) {
            zm_ai_utility::remove_zombie_target(level.var_7b71cdb7);
        }
        var_7df17d61 = level.var_7b71cdb7.origin;
    }
    self thread function_e1137e13();
    if (isdefined(var_9c502e92) && var_9c502e92) {
        self thread function_56e41aa6(var_7df17d61);
        level thread function_ac1d7a0e(#"hash_368df266f54ec3b1");
    }
    self notify(#"hash_300e9fed7925cd69", {#b_success:var_9c502e92});
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x5 linked
// Checksum 0x4b22c6c0, Offset: 0x5928
// Size: 0x9c
function private function_e1137e13(var_c34665fc) {
    callback::remove_on_ai_killed(&function_59945272);
    if (isdefined(level.var_7b71cdb7)) {
        level.var_7b71cdb7 delete();
    }
    hidemiscmodels("rt_gh_sanim");
    exploder::stop_exploder("fxexp_riot_ghoul");
    exploder::stop_exploder("fxexp_riot_ghoul2");
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0x195607ce, Offset: 0x59d0
// Size: 0x56
function private function_4c8b4a87() {
    var_39633c28 = zombie_utility::get_current_zombie_count();
    if (var_39633c28 + level.zombie_total < 4) {
        level.zombie_total += 5;
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0x99822f3, Offset: 0x5a30
// Size: 0x10c
function private function_19df5c43() {
    level util::clientnotify("sndriot");
    showmiscmodels("rt_gh_sanim");
    exploder::exploder("fxexp_riot_ghoul");
    exploder::exploder("fxexp_riot_ghoul2");
    self thread function_9ee74e2c();
    self waittill(#"death", #"hash_300e9fed7925cd69");
    level util::clientnotify("sndriot");
    hidemiscmodels("rt_gh_sanim");
    exploder::stop_exploder("fxexp_riot_ghoul");
    exploder::stop_exploder("fxexp_riot_ghoul2");
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x1 linked
// Checksum 0x159bb975, Offset: 0x5b48
// Size: 0xb4
function function_9ee74e2c() {
    self endon(#"death", #"hash_300e9fed7925cd69");
    while (true) {
        var_fe655381 = zm_zonemgr::get_players_in_zone("zone_cellblock_east", 1);
        if (var_fe655381.size > 0) {
            e_player = array::random(var_fe655381);
            level thread function_629fa2c8(#"hash_72bb7bc935d4da67", e_player);
            return;
        }
        wait 1;
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0x636c5ad2, Offset: 0x5c08
// Size: 0xf8
function private function_67a6f551() {
    self endon(#"death");
    var_9cdf5d68 = 10;
    while (isalive(self)) {
        s_result = self waittill(#"damage");
        n_percent = self.health / 961;
        n_blood = int(n_percent * 10);
        if (n_blood != var_9cdf5d68) {
            self clientfield::set("" + #"hash_3e506d7aedac6ae0", n_blood);
            var_9cdf5d68 = n_blood;
        }
        self function_1b049b47();
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0x4bb00c40, Offset: 0x5d08
// Size: 0xf4
function private function_1b049b47() {
    self endon(#"death");
    self setcandamage(0);
    var_a94e126 = 0;
    is_visible = 1;
    while (var_a94e126 < 7) {
        if (isdefined(is_visible) && is_visible) {
            self ghost();
            is_visible = 0;
        } else {
            self show();
            is_visible = 1;
        }
        var_a94e126++;
        wait 0.1;
    }
    self show();
    self setcandamage(1);
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 12, eflags: 0x1 linked
// Checksum 0x87746c12, Offset: 0x5e08
// Size: 0x98
function function_1d42763a(einflictor, eattacker, idamage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype) {
    if (self === level.var_7b71cdb7 && isplayer(eattacker)) {
        return 0;
    }
    return -1;
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0x9112ea91, Offset: 0x5ea8
// Size: 0x1de
function private function_7de21668() {
    self endon(#"death");
    self.goalradius = 64;
    var_397f8272 = struct::get_array("cellblocks_final_path", "script_noteworthy");
    var_25d70459 = arraygetclosest(self.origin, var_397f8272);
    s_next_pos = struct::get(var_25d70459.target, "targetname");
    self setgoal(var_25d70459.origin);
    self waittill(#"goal");
    while (isdefined(s_next_pos)) {
        self setgoal(s_next_pos.origin);
        self waittill(#"goal");
        if (s_next_pos.script_string === "smoke") {
            s_next_pos thread function_e5b11574();
        } else if (s_next_pos.script_string === "brutus_sp") {
            level thread function_b88f57f9();
        }
        var_25d70459 = s_next_pos;
        if (isdefined(var_25d70459.target)) {
            s_next_pos = struct::get(var_25d70459.target, "targetname");
            continue;
        }
        s_next_pos = undefined;
    }
    self notify(#"hash_6f435cd868870904");
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0x528b14f7, Offset: 0x6090
// Size: 0x1cc
function private function_b88f57f9() {
    s_brutus_location = struct::get("cel_bru_pos", "targetname");
    var_a9c0254c = struct::get(s_brutus_location.target, "targetname");
    if (level.brutus_count + 1 <= level.brutus_max_count) {
        ai_brutus = zombie_utility::spawn_zombie(level.var_d668eae7[0]);
        if (isalive(ai_brutus)) {
            ai_brutus endon(#"death");
            ai_brutus zombie_brutus_util::brutus_spawn(undefined, undefined, undefined, undefined, undefined);
            ai_brutus forceteleport(s_brutus_location.origin, s_brutus_location.angles);
            ai_brutus playsound(#"zmb_ai_brutus_spawn_2d");
            ai_brutus val::set(#"ai_brutus", "ignoreall", 1);
            ai_brutus setgoal(var_a9c0254c.origin);
            ai_brutus waittill(#"goal");
            ai_brutus val::reset(#"ai_brutus", "ignoreall");
        }
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0x6b4177b2, Offset: 0x6268
// Size: 0x13c
function private function_e5b11574() {
    if (math::cointoss()) {
        v_target_pos = (self.origin[0] + randomfloat(256), self.origin[1] + randomfloat(256), self.origin[2]);
        v_target_pos = getclosestpointonnavmesh(v_target_pos, 256, 16);
        if (isdefined(v_target_pos)) {
            mdl_pos = util::spawn_model("tag_origin", v_target_pos + (0, 0, 32));
            e_grenade = mdl_pos magicgrenadetype(getweapon(#"willy_pete"), v_target_pos, (0, 0, 0), 0.4);
            waitframe(1);
            mdl_pos delete();
        }
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x1 linked
// Checksum 0x6b868a02, Offset: 0x63b0
// Size: 0x168
function function_ae8a20de() {
    self endon(#"death", #"hash_6f435cd868870904");
    while (true) {
        var_d8036031 = getaiteamarray(level.zombie_team).size;
        if (var_d8036031 >= function_5b5301c9()) {
            waitframe(1);
            continue;
        }
        str_zone = zm_zonemgr::get_zone_from_position(self.origin);
        str_next_zone = function_9e55b467(str_zone);
        function_eee2ccd4(str_next_zone);
        function_eee2ccd4(str_next_zone);
        if (str_next_zone === "zone_start") {
            function_eee2ccd4(str_next_zone);
        } else if (str_zone === "zone_start") {
            function_eee2ccd4("zone_library");
        }
        wait randomfloatrange(2.9, 6.1);
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x1 linked
// Checksum 0xb302bcd1, Offset: 0x6520
// Size: 0xbe
function function_5b5301c9() {
    switch (util::get_active_players().size) {
    case 1:
        n_zombies_max = 21;
        break;
    case 2:
        n_zombies_max = 22;
        break;
    case 3:
        n_zombies_max = 23;
        break;
    default:
        n_zombies_max = 26;
        break;
    }
    return n_zombies_max;
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x4
// Checksum 0xe3d22561, Offset: 0x65e8
// Size: 0x1c0
function private function_1eab6e39() {
    self endon(#"death", #"hash_6f435cd868870904");
    self thread function_7c71661a();
    while (true) {
        str_zone = zm_zonemgr::get_zone_from_position(self.origin);
        var_3cd5bf76 = 0;
        if (str_zone != "zone_cellblock_entrance") {
            a_e_zombies = getaiteamarray(level.zombie_team);
            foreach (e_zombie in a_e_zombies) {
                if (isalive(e_zombie) && isdefined(e_zombie.zone_name) && e_zombie.zone_name == str_zone) {
                    var_3cd5bf76++;
                }
            }
            if (!level function_7edf3657(var_3cd5bf76)) {
                str_next_zone = function_9e55b467(str_zone);
                level thread function_eee2ccd4(str_next_zone);
            }
        }
        wait randomfloatrange(3, 5);
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0x600fc400, Offset: 0x67b0
// Size: 0x228
function private function_7c71661a() {
    self endon(#"death", #"hash_6f435cd868870904");
    level thread function_eee2ccd4("zone_cellblock_entrance");
    var_d4c2136c = 0;
    var_fe69e6bb = 0;
    var_adf35a34 = 0;
    var_70edc3d5 = 0;
    var_629eec30 = 0;
    while (!var_629eec30) {
        str_zone = zm_zonemgr::get_zone_from_position(self.origin);
        if (str_zone == "zone_cellblock_east" && !var_d4c2136c) {
            var_d4c2136c = 1;
            level thread function_eee2ccd4("zone_library");
        } else if (str_zone == "zone_cellblock_entrance" && !var_fe69e6bb) {
            var_fe69e6bb = 1;
            level thread function_eee2ccd4("zone_library");
        } else if (str_zone == "zone_start" && !var_adf35a34) {
            var_adf35a34 = 1;
            level thread function_eee2ccd4("zone_cellblock_west");
        } else if (str_zone == "zone_library" && !var_70edc3d5) {
            var_70edc3d5 = 1;
            level thread function_eee2ccd4("zone_broadway_floor_2");
        } else if (str_zone == "zone_cellblock_west" && !var_629eec30) {
            var_629eec30 = 1;
            level thread function_eee2ccd4("zone_cellblock_west_warden");
        }
        wait 1;
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x5 linked
// Checksum 0x5c47a6a0, Offset: 0x69e0
// Size: 0xbe
function private function_7edf3657(var_3cd5bf76) {
    switch (util::get_players().size) {
    case 1:
        n_threshold = 3;
        break;
    case 2:
        n_threshold = 4;
        break;
    case 3:
        n_threshold = 5;
        break;
    case 4:
        n_threshold = 6;
        break;
    }
    if (var_3cd5bf76 >= n_threshold) {
        return 1;
    }
    return 0;
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x5 linked
// Checksum 0x12badd87, Offset: 0x6aa8
// Size: 0x186
function private function_9e55b467(str_zone) {
    str_next_zone = "zone_cafeteria";
    if (!isdefined(str_zone)) {
        return str_next_zone;
    }
    switch (str_zone) {
    case #"zone_cafeteria_end":
        str_next_zone = "zone_cellblock_east";
        break;
    case #"zone_cafeteria":
        str_next_zone = "zone_cellblock_entrance";
        break;
    case #"zone_cellblock_east":
        str_next_zone = "zone_start";
        break;
    case #"zone_cellblock_entrance":
        str_next_zone = "zone_library";
        break;
    case #"zone_start":
        str_next_zone = "zone_cellblock_west";
        break;
    case #"zone_library":
        str_next_zone = "zone_broadway_floor_2";
        break;
    case #"zone_cellblock_west":
        str_next_zone = "zone_cellblock_west_barber";
        break;
    case #"zone_broadway_floor_2":
        str_next_zone = "zone_cellblock_west_warden";
        break;
    case #"zone_cellblock_west_barber":
        str_next_zone = "zone_sally_port";
        break;
    case #"zone_cellblock_west_warden":
        str_next_zone = "zone_sally_port";
        break;
    }
    return str_next_zone;
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x5 linked
// Checksum 0x61a48072, Offset: 0x6c38
// Size: 0x234
function private function_eee2ccd4(str_zone) {
    var_7d53907e = getnode(str_zone, "targetname");
    var_f3f7c164 = struct::get_array(var_7d53907e.target);
    var_5ab4bb90 = [];
    foreach (s_spawner in var_f3f7c164) {
        if (s_spawner.script_noteworthy != "dog_location" && s_spawner.script_noteworthy != "brutus_location" && s_spawner.script_noteworthy != "wait_location") {
            if (!isdefined(var_5ab4bb90)) {
                var_5ab4bb90 = [];
            } else if (!isarray(var_5ab4bb90)) {
                var_5ab4bb90 = array(var_5ab4bb90);
            }
            var_5ab4bb90[var_5ab4bb90.size] = s_spawner;
        }
    }
    var_8f2dfb2c = function_8f06b9dc();
    for (i = 0; i < var_8f2dfb2c; i++) {
        s_spawn_location = array::random(var_5ab4bb90);
        e_enemy = undefined;
        while (!isdefined(e_enemy)) {
            e_enemy = zombie_utility::spawn_zombie(level.zombie_spawners[0], undefined, s_spawn_location);
            waitframe(1);
        }
        e_enemy thread zm_escape_util::function_24d3ec02(undefined, 1);
        waitframe(1);
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x1 linked
// Checksum 0x3c45227f, Offset: 0x6e78
// Size: 0x9e
function function_8f06b9dc() {
    switch (util::get_players().size) {
    case 1:
        n_zombies = 3;
        break;
    case 2:
        n_zombies = 4;
        break;
    case 3:
        n_zombies = 5;
        break;
    case 4:
        n_zombies = 6;
        break;
    }
    return n_zombies;
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0x434dda80, Offset: 0x6f20
// Size: 0x1cc
function private function_6c1f6b4e() {
    self endon(#"death", #"hash_300e9fed7925cd69");
    callback::on_ai_killed(&function_59945272);
    s_result = level waittill(#"hash_4e2f6e88e9985f10");
    if (!isdefined(level.var_7b71cdb7) || s_result.ai_ghost !== level.var_7b71cdb7) {
        self notify(#"hash_300e9fed7925cd69", {#b_success:0, #var_d0af61fc:1});
    }
    level.var_7b71cdb7 endon(#"death");
    self thread function_3e62ca0b(level.var_7b71cdb7);
    level.var_7b71cdb7 thread function_1db8a8b2("ce_gh_pa");
    level.var_7b71cdb7 waittill(#"blast_attack");
    level.var_7b71cdb7 notify(#"hash_585dd04498227242");
    level.var_7b71cdb7.b_is_visible = 1;
    level.var_7b71cdb7 clientfield::set("" + #"hash_65da20412fcaf97e", 0);
    level.var_7b71cdb7 thread function_ae8a20de();
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x1 linked
// Checksum 0x1080857b, Offset: 0x70f8
// Size: 0x258
function function_59945272(s_params) {
    if (!isdefined(level.var_7b71cdb7) && isplayer(s_params.eattacker) && (self zm_zonemgr::entity_in_zone("zone_cafeteria") || self zm_zonemgr::entity_in_zone("zone_cafeteria_end"))) {
        callback::remove_on_ai_killed(&function_59945272);
        v_teleport_position = self.origin + (0, 0, 5);
        level.var_7b71cdb7 = zombie_utility::spawn_zombie(getent("g_rob_zombie_spawner", "targetname"), "cb_gh");
        while (!isdefined(level.var_7b71cdb7)) {
            waitframe(1);
            level.var_7b71cdb7 = zombie_utility::spawn_zombie(getent("g_rob_zombie_spawner", "targetname"), "cb_gh");
        }
        level.var_7b71cdb7 function_e128a8d4(0);
        level.var_7b71cdb7.var_238b3806 = 1;
        level.var_7b71cdb7 forceteleport(v_teleport_position, self.angles, 1, 1);
        level.var_7b71cdb7.script_noteworthy = "blast_attack_interactables";
        level.var_7b71cdb7 thread function_a51841a(s_params.eattacker, #"hash_2ea20c8cd81b5464");
        level.var_7b71cdb7 thread function_ff88f6aa(v_teleport_position);
        level notify(#"hash_4e2f6e88e9985f10", {#ai_ghost:level.var_7b71cdb7});
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x5 linked
// Checksum 0xea2fa14c, Offset: 0x7358
// Size: 0x11c
function private function_4219d0d8(v_pos) {
    foreach (e_player in util::get_active_players()) {
        if (isdefined(v_pos) && e_player zm_utility::is_player_looking_at(v_pos + (0, 0, 32))) {
            level thread function_629fa2c8(#"ghost_disappears", e_player);
        }
        waitframe(1);
    }
    e_player = array::random(util::get_active_players());
    level thread function_629fa2c8(#"ghost_disappears", e_player);
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0xd6af3afe, Offset: 0x7480
// Size: 0x56e
function private function_cdc8090a() {
    self endoncallback(&function_4b6d9f06, #"death", #"hash_300e9fed7925cd69");
    b_success = undefined;
    self thread function_d2bf4eeb();
    level waittill(#"hash_4e2f6e88e9985f10");
    waitframe(1);
    level.var_acc853e7 waittill(#"hash_585dd04498227242");
    self thread function_729b2218(level.var_acc853e7);
    s_result = self waittilltimeout(6, #"hash_754ca63bdd999035");
    if (s_result._notify == "timeout") {
        self notify(#"hash_141c4fe73e47836f");
    }
    level.var_acc853e7 thread function_3c3c455c();
    level.var_acc853e7 thread function_3f90c49f();
    level.var_acc853e7 waittill(#"hash_57648a286155c924");
    array::thread_all(util::get_players(), &function_2992f8fe, level.var_acc853e7, #"hash_7cf90fc327de893e");
    level thread function_2c4516ae("door_model_west_side_exterior_to_new_industries");
    level.var_acc853e7 thread function_a50552d1();
    level.var_acc853e7 waittill(#"hash_42d705f0ff5334bb");
    level zm_audio::function_6191af93(#"trap_activate", #"zm_spinning_trap", "", "");
    level zm_audio::function_6191af93(#"spin_trap", #"hook", "", "");
    level.var_acc853e7 ai::set_behavior_attribute("run", 0);
    if (level.var_acc853e7 clientfield::get("" + #"hash_65da20412fcaf97e")) {
        level.var_acc853e7 clientfield::set("" + #"hash_65da20412fcaf97e", 0);
    }
    level scene::add_scene_func(#"aib_vign_zm_mob_spoon_ghost_stab", &function_e78de01b, "init");
    level thread scene::init(#"aib_vign_zm_mob_spoon_ghost_stab");
    level.var_acc853e7 thread function_7f71a2b2(self);
    var_e4f517f0 = getentarray("zm_spinning_trap", "script_noteworthy");
    array::thread_all(var_e4f517f0, &function_f8da844f, self);
    s_result = level.var_acc853e7 waittill(#"death", #"hash_436fe34b5e12d99a");
    var_7df17d61 = level.var_acc853e7.origin;
    if (s_result._notify == "death") {
        var_9c502e92 = 1;
        level thread scene::stop(#"aib_vign_zm_mob_spoon_ghost_stab");
    } else {
        self waittilltimeout(9, #"hash_17cc254c45796829");
        e_player = array::random(util::get_active_players());
        level thread function_629fa2c8(#"hash_7ab135537c096a5a", e_player);
    }
    level thread function_4b6d9f06();
    if (isdefined(var_9c502e92) && var_9c502e92) {
        self thread function_56e41aa6(var_7df17d61);
        level thread function_ac1d7a0e(#"hash_53aafd7783e33981");
    }
    self notify(#"hash_300e9fed7925cd69", {#b_success:var_9c502e92});
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 2, eflags: 0x1 linked
// Checksum 0x17f693f2, Offset: 0x79f8
// Size: 0x1aa
function function_2992f8fe(e_ghost, var_5b9ba5a5) {
    e_ghost endon(#"death", #"ghost_seen");
    self endon(#"disconnect");
    wait 1.6;
    while (true) {
        var_da2705ac = self zm_utility::is_player_looking_at(e_ghost getcentroid());
        var_8924ba8b = self clientfield::get("" + #"hash_184a34e85c29399f");
        var_383e18aa = isdefined(level.var_acc853e7.var_c95261d) && level.var_acc853e7.var_c95261d;
        if (var_da2705ac && (var_8924ba8b || var_383e18aa)) {
            if (!(isdefined(level.var_9cb7c32e) && level.var_9cb7c32e)) {
                level.var_9cb7c32e = 1;
                level function_629fa2c8(#"hash_57e9c23bed1bd753", self);
                wait 0.5;
            }
            level thread function_629fa2c8(var_5b9ba5a5, self);
            e_ghost notify(#"ghost_seen");
        }
        waitframe(1);
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x5 linked
// Checksum 0xfc650a0f, Offset: 0x7bb0
// Size: 0xe4
function private function_729b2218(ai_ghost) {
    self endon(#"death", #"hash_300e9fed7925cd69", #"hash_141c4fe73e47836f");
    foreach (e_player in util::get_active_players()) {
        if (e_player util::is_looking_at(ai_ghost getcentroid())) {
            self notify(#"hash_754ca63bdd999035");
            return;
        }
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0x1260bd80, Offset: 0x7ca0
// Size: 0x20c
function private function_d2bf4eeb() {
    self endon(#"death", #"hash_300e9fed7925cd69");
    callback::on_ai_killed(&function_995231f6);
    s_result = level waittill(#"hash_4e2f6e88e9985f10");
    if (!isdefined(level.var_acc853e7) || s_result.ai_ghost !== level.var_acc853e7) {
        self notify(#"hash_300e9fed7925cd69", {#b_success:0, #var_d0af61fc:1});
    }
    level.var_acc853e7 endon(#"death");
    self thread function_3e62ca0b(level.var_acc853e7);
    level.var_acc853e7 thread function_1db8a8b2("ni_gh_pa");
    level.var_acc853e7 waittill(#"blast_attack");
    level.var_acc853e7 notify(#"hash_585dd04498227242");
    level.var_acc853e7 setgoal(level.var_acc853e7.origin);
    level.var_acc853e7 clientfield::set("" + #"hash_65da20412fcaf97e", 0);
    level.var_acc853e7.var_c95261d = 1;
    level.var_68fa1bc = level.var_acc853e7;
    level.var_acc853e7 solid();
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x1 linked
// Checksum 0xa2c41f99, Offset: 0x7eb8
// Size: 0x258
function function_995231f6(s_params) {
    if (!isdefined(level.var_acc853e7) && isplayer(s_params.eattacker) && (self zm_zonemgr::entity_in_zone("zone_library") || self zm_zonemgr::entity_in_zone("zone_start"))) {
        callback::remove_on_ai_killed(&function_995231f6);
        v_teleport_position = self.origin + (0, 0, 5);
        level.var_acc853e7 = zombie_utility::spawn_zombie(getent("g_rob_zombie_spawner", "targetname"), "ni_gh");
        while (!isdefined(level.var_acc853e7)) {
            waitframe(1);
            level.var_acc853e7 = zombie_utility::spawn_zombie(getent("g_rob_zombie_spawner", "targetname"), "ni_gh");
        }
        level.var_acc853e7 function_e128a8d4(0);
        level.var_acc853e7 forceteleport(v_teleport_position, self.angles, 1, 1);
        level.var_acc853e7.script_noteworthy = "blast_attack_interactables";
        level.var_acc853e7 thread function_a51841a(s_params.eattacker, #"hash_1d191ca6765471c6");
        level.var_acc853e7 thread function_ff88f6aa(v_teleport_position);
        level.var_acc853e7.var_238b3806 = 1;
        level notify(#"hash_4e2f6e88e9985f10", {#ai_ghost:level.var_acc853e7});
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0x9e6f5826, Offset: 0x8118
// Size: 0x374
function private function_3f90c49f() {
    self endon(#"death");
    var_14a84ac9 = struct::get_array("ni_sp_pos", "targetname");
    v_pos = undefined;
    var_14a84ac9 = array::randomize(var_14a84ac9);
    while (!isdefined(v_pos)) {
        foreach (var_24f2b6cf in var_14a84ac9) {
            v_pos = getclosestpointonnavmesh(var_24f2b6cf.origin, 128, 16);
            v_angles = var_24f2b6cf.angles;
            if (isdefined(v_pos)) {
                path_success = self findpath(self.origin, v_pos, 1, 0);
                if (path_success) {
                    break;
                } else {
                    /#
                        iprintln("<dev string:x38>" + var_24f2b6cf.origin);
                    #/
                }
                continue;
            }
            /#
                iprintln("<dev string:x5f>" + var_24f2b6cf.origin);
            #/
        }
    }
    level.var_9e23e046 = util::spawn_model(#"wpn_t8_zm_spoon_world", v_pos, v_angles);
    self.goalradius = 64;
    while (distance2d(self.origin, v_pos) > 80) {
        self setgoal(v_pos);
        self waittilltimeout(6, #"goal");
    }
    self notify(#"hash_57648a286155c924");
    self scene::play(#"aib_vign_zm_mob_ghost_spoon_pickup", self);
    if (isdefined(level.var_9e23e046)) {
        level.var_9e23e046 delete();
    }
    self.mdl_spoon = util::spawn_model(#"wpn_t8_zm_spoon_world", self gettagorigin("tag_weapon_right"), self gettagangles("tag_weapon_right"));
    self.mdl_spoon linkto(self, "tag_weapon_right");
    self.mdl_spoon clientfield::set("" + #"hash_28a1a80b64f97e05", 1);
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0xaa652ef9, Offset: 0x8498
// Size: 0x1d8
function private function_3c3c455c() {
    self endon(#"death", #"hash_3cef5405e0643505", #"hash_436fe34b5e12d99a");
    self thread function_685fffc4();
    wait 11;
    level.var_acc853e7.var_c95261d = undefined;
    level.var_68fa1bc = undefined;
    level.var_acc853e7 notsolid();
    level.var_acc853e7 clientfield::set("" + #"hash_65da20412fcaf97e", 2);
    while (true) {
        level.var_acc853e7 waittill(#"blast_attack");
        level.var_acc853e7.var_c95261d = 1;
        level.var_68fa1bc = level.var_acc853e7;
        level.var_acc853e7 solid();
        level.var_acc853e7 clientfield::set("" + #"hash_65da20412fcaf97e", 0);
        wait 11;
        level.var_acc853e7.var_c95261d = undefined;
        level.var_68fa1bc = undefined;
        level.var_acc853e7 notsolid();
        level.var_acc853e7 clientfield::set("" + #"hash_65da20412fcaf97e", 2);
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x1 linked
// Checksum 0xff033d3d, Offset: 0x8678
// Size: 0xae
function function_ae0bae8() {
    var_9636ee0 = 61;
    switch (util::get_players().size) {
    case 1:
        var_9636ee0 = 30.5;
        break;
    case 2:
        var_9636ee0 = 42.7;
        break;
    case 3:
        var_9636ee0 = 48.8;
        break;
    case 4:
        break;
    }
    return var_9636ee0;
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0xf14d1e4b, Offset: 0x8730
// Size: 0x2fc
function private function_685fffc4() {
    self endon(#"death", #"hash_42d705f0ff5334bb");
    var_9636ee0 = function_ae0bae8();
    var_31adaadb = 0;
    var_e5b1f8d7 = undefined;
    var_49154180 = 10;
    while (var_31adaadb <= var_9636ee0) {
        if (isdefined(self.var_c95261d) && self.var_c95261d && isdefined(self.var_5bf7575e) && self.var_5bf7575e) {
            var_31adaadb++;
        }
        var_36f8baa8 = (var_9636ee0 - var_31adaadb) / var_9636ee0;
        var_b25755cf = int(var_36f8baa8 * 10);
        if (var_b25755cf != var_49154180) {
            self clientfield::set("" + #"hash_3e506d7aedac6ae0", var_b25755cf);
            var_49154180 = var_b25755cf;
        }
        /#
            if (var_36f8baa8 == 0.25 || var_36f8baa8 == 0.5 || var_36f8baa8 == 0.75 && var_e5b1f8d7 !== var_36f8baa8) {
                var_e5b1f8d7 = var_36f8baa8;
                iprintlnbold("<dev string:x80>" + var_36f8baa8);
            }
        #/
        wait 1;
    }
    level.var_acc853e7 notify(#"hash_3cef5405e0643505");
    level.var_acc853e7 playsound(#"zmb_sq_souls_release");
    waitframe(1);
    if (level.var_acc853e7 clientfield::get("" + #"hash_65da20412fcaf97e")) {
        level.var_acc853e7 clientfield::set("" + #"hash_65da20412fcaf97e", 0);
    }
    /#
        iprintlnbold("<dev string:x9d>");
    #/
    level.var_acc853e7.var_c95261d = undefined;
    level.var_68fa1bc = undefined;
    level.var_acc853e7.var_238b3806 = undefined;
    level.var_acc853e7 notsolid();
    level.var_acc853e7 ai::set_behavior_attribute("run", 1);
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0x5ede7d5f, Offset: 0x8a38
// Size: 0xee
function private function_a50552d1() {
    self endon(#"death");
    var_38da48af = struct::get("ni_gh_fi", "targetname");
    var_38da48af.origin = (7888, 11072, 320);
    self.goalradius = 64;
    while (distance2d(self.origin, var_38da48af.origin) > 92) {
        self setgoal(var_38da48af.origin);
        self waittilltimeout(30, #"goal");
    }
    self notify(#"hash_42d705f0ff5334bb");
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x5 linked
// Checksum 0x869f8978, Offset: 0x8b30
// Size: 0x1b0
function private function_7f71a2b2(var_aa11c23c) {
    self endon(#"death");
    var_aa11c23c endon(#"hash_300e9fed7925cd69");
    var_48bbb849 = struct::get("gh_vi_pos", "targetname");
    self.goalradius = 24;
    while (distance2d(self.origin, var_48bbb849.origin) > self.goalradius) {
        self setgoal(var_48bbb849.origin, 1);
        self waittilltimeout(15, #"goal");
    }
    self notify(#"hash_436fe34b5e12d99a");
    waitframe(1);
    if (isalive(level.var_acc853e7) && level.var_acc853e7 clientfield::get("" + #"hash_65da20412fcaf97e")) {
        level.var_acc853e7 clientfield::set("" + #"hash_65da20412fcaf97e", 0);
    }
    level scene::play(#"aib_vign_zm_mob_spoon_ghost_stab");
    var_aa11c23c notify(#"hash_17cc254c45796829");
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x5 linked
// Checksum 0xd1c7f23a, Offset: 0x8ce8
// Size: 0x1e0
function private function_f8da844f(var_aa11c23c) {
    level.var_acc853e7 endon(#"death");
    var_aa11c23c endon(#"hash_300e9fed7925cd69");
    while (true) {
        s_result = self waittill(#"trigger");
        if (isdefined(self._trap_in_use) && self._trap_in_use && s_result.activator === level.var_acc853e7 && !(isdefined(level.var_acc853e7.var_238b3806) && level.var_acc853e7.var_238b3806)) {
            wait 1.6;
            level.var_acc853e7 val::reset(#"ai_ghost", "allowdeath");
            level.var_acc853e7 setcandamage(1);
            level.var_acc853e7 clientfield::set("" + #"hash_7a8eab5597b25400", 1);
            playsoundatposition("zmb_spoon_ghost_annihilate", level.var_acc853e7.origin);
            gibserverutils::annihilate(level.var_acc853e7);
            level.var_acc853e7 dodamage(level.var_acc853e7.health + 1000, self.origin, undefined, self);
        }
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x5 linked
// Checksum 0xcce3fb5, Offset: 0x8ed0
// Size: 0x174
function private function_4b6d9f06(var_c34665fc) {
    callback::remove_on_ai_killed(&function_995231f6);
    if (isdefined(level.var_acc853e7)) {
        if (isdefined(level.var_acc853e7.mdl_spoon)) {
            level.var_acc853e7.mdl_spoon clientfield::set("" + #"hash_28a1a80b64f97e05", 0);
            level.var_acc853e7.mdl_spoon delete();
        }
        level.var_acc853e7 delete();
    }
    if (isdefined(level.var_9488f62c)) {
        level.var_9488f62c delete();
    }
    if (isdefined(level.var_9e23e046)) {
        level.var_9e23e046 delete();
    }
    level zm_audio::function_e1666976(#"trap_activate", #"zm_spinning_trap");
    level zm_audio::function_e1666976(#"spin_trap", #"hook");
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x1 linked
// Checksum 0x9c12c5ee, Offset: 0x9050
// Size: 0x42
function function_e78de01b(a_ents) {
    if (isdefined(a_ents[#"ni_gh_vi"])) {
        level.var_9488f62c = a_ents[#"ni_gh_vi"];
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0x9f3ae4b, Offset: 0x90a0
// Size: 0x816
function private function_b80b6749() {
    self endoncallback(&function_549f1fcd, #"death", #"hash_300e9fed7925cd69");
    b_success = undefined;
    var_aa851834 = undefined;
    a_str_zones = array("cellblock_shower");
    while (!(isdefined(var_aa851834) && var_aa851834)) {
        foreach (e_player in util::get_players()) {
            if (isdefined(e_player zm_zonemgr::is_player_in_zone(a_str_zones)) && e_player zm_zonemgr::is_player_in_zone(a_str_zones)) {
                var_aa851834 = 1;
                break;
            }
        }
        waitframe(1);
    }
    s_scene = struct::get("sh_b_scene", "targetname");
    scene::remove_scene_func(s_scene.scriptbundlename, &function_fdfca800, "init");
    s_scene scene::add_scene_func(s_scene.scriptbundlename, &function_fdfca800, "init");
    s_scene scene::init(#"aib_vign_zm_mob_banjo_ghost");
    wait 5;
    level thread function_629fa2c8(#"hash_1e0663f4102106fa", level.var_9d950ce5.e_activator);
    level.var_9d950ce5 waittill(#"hash_17de7292d988f537");
    level.var_9d950ce5.t_interact setinvisibletoall();
    level.var_4dad7caf clientfield::set("" + #"hash_504d26c38b96651c", 9);
    /#
        iprintlnbold("<dev string:xc1>");
    #/
    exploder::exploder("fxexp_shower_ambient_ground_fog");
    a_s_firewalls = struct::get_array("sh_ba_fx", "targetname");
    self thread function_cd0d0123(a_s_firewalls, "fxexp_flame_wall_door_glow_shower");
    level flag::clear(#"hash_107c5504e3325022");
    s_scene thread scene::play(#"aib_vign_zm_mob_banjo_ghost", "shot_of");
    wait 2;
    if (util::get_players().size == 1) {
        self thread function_3854c592();
    }
    level.var_9d950ce5.t_interact setvisibletoall();
    level.var_9d950ce5.e_activator = undefined;
    level.var_9d950ce5 waittill(#"hash_17de7292d988f537");
    level.var_9d950ce5.t_interact setinvisibletoall();
    self thread function_580723de(0, level.var_9d950ce5.e_activator);
    level thread function_629fa2c8(#"hash_46252c9e0b200ae6", level.var_9d950ce5.e_activator);
    self thread function_b1aeb165(s_scene);
    self thread function_33701563();
    s_result = self waittill(#"hash_4636f041ae52f0fa", #"hash_7953672ffc47be3");
    if (s_result._notify == #"hash_4636f041ae52f0fa" || !isalive(level.var_9d950ce5.e_activator)) {
        s_scene thread scene::play(#"aib_vign_zm_mob_banjo_ghost", "shot_out");
        var_c74251a4 = scene::function_8582657c(#"aib_vign_zm_mob_banjo_ghost", "shot_out");
        wait var_c74251a4;
    } else {
        /#
            iprintlnbold("<dev string:xe1>");
        #/
        foreach (e_player in util::get_active_players()) {
            e_player clientfield::increment_to_player("" + #"hero_katana_vigor_postfx");
            e_player playsoundtoplayer(#"hash_3f03a6b2d8cfc1b9", e_player);
        }
        if (isdefined(level.var_9d950ce5.t_interact)) {
            level.var_9d950ce5.t_interact setvisibletoplayer(level.var_9d950ce5.e_activator);
            level.var_9d950ce5 waittill(#"hash_17de7292d988f537");
        }
        self thread function_580723de(1);
        var_7df17d61 = level.var_9d950ce5.origin;
        s_scene thread scene::play(#"aib_vign_zm_mob_banjo_ghost", "shot_out");
        var_c74251a4 = scene::function_8582657c(#"aib_vign_zm_mob_banjo_ghost", "shot_out");
        wait var_c74251a4;
        var_9c502e92 = 1;
    }
    exploder::stop_exploder("fxexp_shower_ambient_ground_fog");
    if (isdefined(var_9c502e92) && var_9c502e92) {
        self thread function_56e41aa6(var_7df17d61);
        level thread function_ac1d7a0e(#"hash_51300ea0974da947", level.var_9d950ce5.e_activator);
    }
    self thread function_549f1fcd();
    self notify(#"hash_300e9fed7925cd69", {#b_success:var_9c502e92});
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x1 linked
// Checksum 0xa0aafe70, Offset: 0x98c0
// Size: 0xc4
function function_fdfca800(a_ents) {
    if (isdefined(a_ents[#"gh_sh"])) {
        level.var_9d950ce5 = a_ents[#"gh_sh"];
        level.var_9d950ce5 thread function_768e71d5();
    }
    if (isdefined(a_ents[#"gh_ba"])) {
        level.var_4dad7caf = a_ents[#"gh_ba"];
        level.var_4dad7caf clientfield::set("" + #"hash_504d26c38b96651c", 10);
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x5 linked
// Checksum 0x442f400f, Offset: 0x9990
// Size: 0x228
function private function_b1aeb165(s_scene) {
    self endon(#"death", #"hash_300e9fed7925cd69", #"hash_4636f041ae52f0fa", #"hash_7953672ffc47be3");
    s_scene thread scene::play(#"aib_vign_zm_mob_banjo_ghost", "shot_wa");
    while (true) {
        level.var_9d950ce5.t_interact setvisibletoplayer(level.var_9d950ce5.e_activator);
        self thread function_aa26a9be(level.var_9d950ce5.e_activator);
        level.var_9d950ce5 waittill(#"hash_17de7292d988f537");
        self thread function_580723de(1);
        level.var_9d950ce5.e_activator notify(#"hash_c5c509724d92ec4");
        s_scene thread scene::play(#"aib_vign_zm_mob_banjo_ghost", "shot_of");
        level.var_9d950ce5.t_interact setvisibletoall();
        level.var_9d950ce5.e_activator = undefined;
        level.var_9d950ce5 waittill(#"hash_17de7292d988f537");
        level.var_9d950ce5.t_interact setinvisibletoall();
        self thread function_580723de(0, level.var_9d950ce5.e_activator);
        s_scene thread scene::play(#"aib_vign_zm_mob_banjo_ghost", "shot_wa");
        wait 2;
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x5 linked
// Checksum 0x17f80fe7, Offset: 0x9bc0
// Size: 0xee
function private function_549f1fcd(var_c34665fc) {
    level flag::set(#"hash_107c5504e3325022");
    if (isdefined(level.var_9d950ce5)) {
        if (isdefined(level.var_9d950ce5.t_interact)) {
            level.var_9d950ce5.t_interact delete();
        }
        level.var_9d950ce5 delete();
    }
    if (isdefined(level.var_4dad7caf)) {
        level.var_4dad7caf delete();
    }
    if (isdefined(level.var_7c9cd6ae)) {
        level.var_7c9cd6ae delete();
    }
    self notify(#"hash_7953672ffc47be3");
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x5 linked
// Checksum 0x272893d0, Offset: 0x9cb8
// Size: 0xe8
function private function_aa26a9be(e_player) {
    e_player endon(#"death", #"hash_c5c509724d92ec4");
    self endon(#"death", #"hash_300e9fed7925cd69", #"hash_4636f041ae52f0fa", #"hash_7953672ffc47be3");
    self thread function_58808acb(e_player);
    wait 60;
    while (isalive(e_player)) {
        e_player dodamage(10, e_player.origin);
        wait 1;
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x1 linked
// Checksum 0x9e03d740, Offset: 0x9da8
// Size: 0xdc
function function_58808acb(e_player) {
    e_player endon(#"hash_c5c509724d92ec4");
    self endon(#"death", #"hash_300e9fed7925cd69", #"hash_7953672ffc47be3");
    e_player waittill(#"death", #"player_downed");
    self notify(#"hash_4636f041ae52f0fa");
    e_speaker = zm_utility::get_closest_player(e_player.origin);
    level thread function_629fa2c8(#"hash_26aa170c4122be2b", e_speaker);
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0x494bb8bd, Offset: 0x9e90
// Size: 0x272
function private function_33701563() {
    self endon(#"death", #"hash_300e9fed7925cd69");
    var_64aaa12a = struct::get_array("showers_kill_pos", "targetname");
    callback::on_ai_killed(&function_c8d4b885);
    level.var_b1060d52 = 0;
    while (true) {
        inventory_picku = array::random(var_64aaa12a);
        var_81de1755 = util::spawn_model("tag_origin", inventory_picku.origin, inventory_picku.angles);
        self thread function_6bb299fa();
        self thread function_613cf0a7(var_81de1755);
        var_d61ccd7e = randomfloatrange(16, 29);
        s_result = self waittilltimeout(var_d61ccd7e, #"hash_4636f041ae52f0fa", #"hash_7953672ffc47be3");
        var_81de1755 playsound(#"hash_6f41c19432e2559a");
        var_81de1755 clientfield::set("" + #"hash_a51ae59006ab41b", 0);
        var_81de1755 delete();
        level.var_3f1b1c67 delete();
        if (s_result._notify == #"hash_7953672ffc47be3" || s_result._notify == #"hash_4636f041ae52f0fa") {
            callback::remove_on_ai_killed(&function_c8d4b885);
            level.var_b1060d52 = undefined;
            return;
        }
        self notify(#"hash_60f9171b687c9d06");
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x5 linked
// Checksum 0x7ed3f326, Offset: 0xa110
// Size: 0x424
function private function_613cf0a7(var_81de1755) {
    self endon(#"death", #"hash_60f9171b687c9d06", #"hash_4636f041ae52f0fa", #"hash_300e9fed7925cd69");
    level.var_3f1b1c67 = spawn("trigger_radius_new", var_81de1755.origin, (512 | 1) + 2, 80, 64);
    var_81de1755 clientfield::set("" + #"hash_a51ae59006ab41b", 1);
    while (isdefined(var_81de1755)) {
        var_db30ff9a = 0;
        foreach (e_player in util::get_active_players()) {
            if (e_player istouching(level.var_3f1b1c67)) {
                var_db30ff9a++;
            }
        }
        switch (var_db30ff9a) {
        case 0:
            if (var_81de1755 clientfield::get("" + #"hash_a51ae59006ab41b") !== 1) {
                var_81de1755 clientfield::set("" + #"hash_a51ae59006ab41b", 1);
                level.var_3f1b1c67.maxs = (80, 80, 64);
            }
            break;
        case 1:
            if (var_81de1755 clientfield::get("" + #"hash_a51ae59006ab41b") !== 2) {
                var_81de1755 clientfield::set("" + #"hash_a51ae59006ab41b", 2);
                level.var_3f1b1c67.maxs = (98, 98, 64);
            }
            break;
        case 2:
            if (var_81de1755 clientfield::get("" + #"hash_a51ae59006ab41b") !== 3) {
                var_81de1755 clientfield::set("" + #"hash_a51ae59006ab41b", 3);
                level.var_3f1b1c67.maxs = (112, 112, 64);
            }
            break;
        case 3:
        case 4:
            if (var_81de1755 clientfield::get("" + #"hash_a51ae59006ab41b") !== 4) {
                var_81de1755 clientfield::set("" + #"hash_a51ae59006ab41b", 4);
                level.var_3f1b1c67.maxs = (128, 128, 64);
            }
            break;
        }
        waitframe(1);
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0xfa2325d9, Offset: 0xa540
// Size: 0x224
function private function_6bb299fa() {
    self endon(#"death", #"hash_60f9171b687c9d06", #"hash_4636f041ae52f0fa", #"hash_300e9fed7925cd69");
    var_9cdf5d68 = 2;
    var_202d423f = function_841bb7a7();
    while (level.var_b1060d52 < var_202d423f) {
        n_percent = level.var_b1060d52 / 29;
        n_blood = int(10 - n_percent * 10);
        if (n_blood != var_9cdf5d68 && n_blood < 9) {
            if (isdefined(level.var_4dad7caf)) {
                level.var_4dad7caf clientfield::set("" + #"hash_504d26c38b96651c", n_blood);
            }
            var_9cdf5d68 = n_blood;
            if (isdefined(level.var_7c9cd6ae)) {
                level.var_7c9cd6ae clientfield::set("" + #"hash_504d26c38b96651c", n_blood);
            }
        }
        wait 0.2;
    }
    self notify(#"hash_7953672ffc47be3");
    if (isdefined(level.var_4dad7caf)) {
        level.var_4dad7caf clientfield::set("" + #"hash_504d26c38b96651c", 1);
    }
    if (isdefined(level.var_7c9cd6ae)) {
        level.var_7c9cd6ae clientfield::set("" + #"hash_504d26c38b96651c", 1);
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x1 linked
// Checksum 0xe74b874, Offset: 0xa770
// Size: 0xba
function function_841bb7a7() {
    var_550d6907 = 0;
    foreach (player in util::get_active_players()) {
        if (player zm_zonemgr::is_player_in_zone("cellblock_shower")) {
            var_550d6907++;
        }
    }
    var_202d423f = 29 * var_550d6907;
    return var_202d423f;
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x1 linked
// Checksum 0x7f9f76f2, Offset: 0xa838
// Size: 0x100
function function_c8d4b885(s_params) {
    if (isplayer(s_params.eattacker) && isdefined(level.var_3f1b1c67) && s_params.eattacker istouching(level.var_3f1b1c67)) {
        if (isdefined(level.var_9d950ce5) && isdefined(level.var_9d950ce5.e_activator) && isdefined(level.var_3f1b1c67) && level.var_9d950ce5.e_activator istouching(level.var_3f1b1c67)) {
            self thread function_b952c1b(level.var_9d950ce5.e_activator, "tag_weapon_right");
            level.var_b1060d52++;
        }
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 2, eflags: 0x5 linked
// Checksum 0x670d7aeb, Offset: 0xa940
// Size: 0x20c
function private function_580723de(var_1bb50dab = 1, e_player) {
    self endon(#"death", #"hash_60f9171b687c9d06", #"hash_4636f041ae52f0fa", #"hash_300e9fed7925cd69");
    if (var_1bb50dab) {
        if (isdefined(level.var_7c9cd6ae)) {
            level.var_7c9cd6ae unlink();
            level.var_7c9cd6ae delete();
        }
        if (isdefined(level.var_4dad7caf)) {
            level.var_4dad7caf show();
        }
        return;
    }
    if (isdefined(level.var_4dad7caf)) {
        level.var_4dad7caf ghost();
    }
    if (isdefined(e_player)) {
        level.var_7c9cd6ae = util::spawn_model(#"hash_122bc018037432b0", e_player gettagorigin("tag_stowed_back"), e_player gettagangles("tag_stowed_back"));
        level.var_7c9cd6ae linkto(e_player, "tag_stowed_back", (30, -2, -5), (0, 90, -90));
        level.var_7c9cd6ae clientfield::set("" + #"hash_504d26c38b96651c", 10);
        level.var_7c9cd6ae setinvisibletoplayer(e_player);
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0x7e7b416c, Offset: 0xab58
// Size: 0x1ce
function private function_3854c592() {
    var_bdf9e3c2 = "cellblock_shower";
    a_str_active_zones = zm_cleanup::get_adjacencies_to_zone(var_bdf9e3c2);
    arrayremovevalue(a_str_active_zones, var_bdf9e3c2);
    zone_shower = level.zones[var_bdf9e3c2];
    a_str_zones = arraycopy(a_str_active_zones);
    foreach (str_zones in a_str_zones) {
        if (zone_shower.adjacent_zones[str_zones].is_connected) {
            zone_shower.adjacent_zones[str_zones].is_connected = 0;
            continue;
        }
        arrayremovevalue(a_str_active_zones, str_zones);
    }
    self waittill(#"death", #"hash_300e9fed7925cd69");
    foreach (str_zones in a_str_active_zones) {
        zone_shower.adjacent_zones[str_zones].is_connected = 1;
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0x2497c935, Offset: 0xad30
// Size: 0x4d6
function private function_c11e25eb() {
    self endoncallback(&function_bc57a72c, #"death", #"hash_300e9fed7925cd69");
    b_success = undefined;
    var_4c18a58 = undefined;
    a_str_zones = array("zone_powerhouse");
    while (!(isdefined(var_4c18a58) && var_4c18a58)) {
        foreach (e_player in util::get_players()) {
            if (isdefined(e_player zm_zonemgr::is_player_in_zone(a_str_zones)) && e_player zm_zonemgr::is_player_in_zone(a_str_zones)) {
                var_4c18a58 = 1;
                break;
            }
        }
        waitframe(1);
    }
    self thread function_fb553d70();
    self function_adf8de89(e_player);
    var_58774a5e = struct::get("ph_gen_pos", "targetname");
    self thread function_eab368cb(var_58774a5e);
    self waittill(#"hash_47037a033334904");
    playsoundatposition(#"hash_7a1782a9382ccd72", var_58774a5e.origin);
    self thread function_718e6106();
    var_7ed2d43 = self waittill(#"hash_2877e7dda4d090c8");
    e_generator = getent("b64_si_gen", "script_noteworthy");
    e_generator setmodel(#"p8_fxanim_zm_esc_generator_lrg_on_mod");
    e_generator thread scene::play(e_generator.bundle, "ON", e_generator);
    playsoundatposition(#"hash_5a77a78c82aebb7", e_generator.origin);
    exploder::exploder("lgtexp_building64_power_on");
    if (!(isdefined(var_7ed2d43.b_success) && var_7ed2d43.b_success)) {
        self notify(#"hash_300e9fed7925cd69", {#b_success:b_success});
        self thread function_bc57a72c();
        return;
    }
    self thread function_1fb1907c();
    s_result = self waittill(#"punchcard_pickup");
    level thread function_629fa2c8(#"hash_57a7dd2d1b78a952", s_result.activator);
    self thread function_ca9ddf1b();
    self waittill(#"hash_1548855706869d2f");
    self thread function_34e153c7();
    self thread function_bd132295();
    var_9c502e92 = self function_cadaca27();
    self notify(#"hash_3e30564346f7cd94");
    var_7df17d61 = level.var_8eec9430.origin;
    self thread function_bc57a72c();
    if (isdefined(var_9c502e92) && var_9c502e92) {
        self thread function_56e41aa6(var_7df17d61);
        level thread function_ac1d7a0e(#"hash_34aad6dd5eebdb0b", e_player);
    }
    self notify(#"hash_300e9fed7925cd69", {#b_success:var_9c502e92});
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x5 linked
// Checksum 0xbc1ba09e, Offset: 0xb210
// Size: 0x174
function private function_adf8de89(e_player) {
    self endon(#"death", #"hash_300e9fed7925cd69");
    if (!isdefined(level.var_8eec9430)) {
        var_bc84fb2a = struct::get("ph_gh_sp", "targetname");
        level.var_8eec9430 = zombie_utility::spawn_zombie(getent("g_zombie_spawner", "targetname"), "ph_gh", var_bc84fb2a);
        while (!isdefined(level.var_8eec9430)) {
            waitframe(1);
            level.var_8eec9430 = zombie_utility::spawn_zombie(getent("g_zombie_spawner", "targetname"), "ph_gh", var_bc84fb2a);
        }
    }
    level.var_8eec9430 function_e128a8d4();
    level.var_8eec9430 thread function_a51841a(e_player, #"hash_4c753651e8079572");
    self thread function_dc369dee("ph_gh_pa");
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x5 linked
// Checksum 0x9dde26a7, Offset: 0xb390
// Size: 0x762
function private function_dc369dee(var_b51b4b08) {
    level.var_8eec9430 endon(#"death", #"hash_585dd04498227242");
    self endon(#"death", #"hash_300e9fed7925cd69");
    level.var_8eec9430.goalradius = 16;
    var_3741f4b0 = struct::get_array(var_b51b4b08, "script_noteworthy");
    level.var_8eec9430 waittilltimeout(20, #"goal");
    var_922f086e = 1;
    s_next_pos = array::random(var_3741f4b0);
    level.var_ed42611e = [];
    while (!(isdefined(level.var_8eec9430.var_ecdd7879) && level.var_8eec9430.var_ecdd7879)) {
        level.var_8eec9430 setgoal(s_next_pos.origin);
        level.var_8eec9430 waittilltimeout(20, #"goal");
        if (isdefined(level.var_8eec9430.b_visible) && level.var_8eec9430.b_visible && isinarray(level.var_62f48651, s_next_pos.script_int)) {
            mdl_lever = getent("flicker_" + s_next_pos.script_int + 1, "targetname");
            mdl_lever scene::play(#"aib_vign_zm_mob_power_ghost_opperate_success", array(level.var_8eec9430, mdl_lever));
            if (!isdefined(level.var_ed42611e)) {
                level.var_ed42611e = [];
            } else if (!isarray(level.var_ed42611e)) {
                level.var_ed42611e = array(level.var_ed42611e);
            }
            if (!isinarray(level.var_ed42611e, mdl_lever)) {
                level.var_ed42611e[level.var_ed42611e.size] = mdl_lever;
            }
            arrayremovevalue(level.var_62f48651, s_next_pos.script_int);
            level.var_8eec9430 notify(#"hash_6f38117315565110", {#b_success:1});
            self thread function_3b4d7656(s_next_pos.script_int);
        } else {
            mdl_lever = getent("flicker_" + s_next_pos.script_int + 1, "targetname");
            mdl_lever scene::play(#"aib_vign_zm_mob_power_ghost_opperate_fail", level.var_8eec9430);
            if (!isinarray(level.var_ed42611e, mdl_lever)) {
                if (isdefined(level.var_8eec9430.b_visible) && level.var_8eec9430.b_visible && isinarray(level.var_62f48651, s_next_pos.script_int)) {
                    mdl_lever = getent("flicker_" + s_next_pos.script_int + 1, "targetname");
                    mdl_lever scene::play(#"aib_vign_zm_mob_power_ghost_opperate_success", array(level.var_8eec9430, mdl_lever));
                    if (!isdefined(level.var_ed42611e)) {
                        level.var_ed42611e = [];
                    } else if (!isarray(level.var_ed42611e)) {
                        level.var_ed42611e = array(level.var_ed42611e);
                    }
                    if (!isinarray(level.var_ed42611e, mdl_lever)) {
                        level.var_ed42611e[level.var_ed42611e.size] = mdl_lever;
                    }
                    arrayremovevalue(level.var_62f48651, s_next_pos.script_int);
                    level.var_8eec9430 notify(#"hash_6f38117315565110", {#b_success:1});
                    self thread function_3b4d7656(s_next_pos.script_int);
                } else if (isdefined(level.var_8eec9430.b_visible) && level.var_8eec9430.b_visible) {
                    level.var_8eec9430 notify(#"hash_6f38117315565110", {#b_success:0});
                }
            }
        }
        wait 1;
        var_25d70459 = s_next_pos;
        if (var_922f086e && isdefined(var_25d70459.target)) {
            s_next_pos = struct::get(var_25d70459.target, "targetname");
            continue;
        }
        if (var_922f086e && !isdefined(var_25d70459.target)) {
            var_922f086e = 0;
            s_next_pos = struct::get(var_25d70459.targetname, "target");
            continue;
        }
        if (!var_922f086e && var_25d70459.script_int != 0) {
            s_next_pos = struct::get(var_25d70459.targetname, "target");
            continue;
        }
        if (!var_922f086e && var_25d70459.script_int == 0) {
            var_922f086e = 1;
            s_next_pos = struct::get(var_25d70459.target, "targetname");
        }
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0x4991854a, Offset: 0xbb00
// Size: 0x5d4
function private function_34e153c7() {
    exploder::exploder("lgtexp_comm_monitors_on");
    var_3ab52107 = array(0, 1, 2, 3, 4, 5);
    var_3ab52107 = array::randomize(var_3ab52107);
    level.var_72ea8db7 = [];
    for (i = 0; i < 6; i++) {
        if (!isdefined(level.var_72ea8db7)) {
            level.var_72ea8db7 = [];
        } else if (!isarray(level.var_72ea8db7)) {
            level.var_72ea8db7 = array(level.var_72ea8db7);
        }
        level.var_72ea8db7[level.var_72ea8db7.size] = var_3ab52107[i];
    }
    var_3ab52107 = array::randomize(var_3ab52107);
    level.var_e2279748 = [];
    for (i = 0; i < 6; i++) {
        if (!isdefined(level.var_e2279748)) {
            level.var_e2279748 = [];
        } else if (!isarray(level.var_e2279748)) {
            level.var_e2279748 = array(level.var_e2279748);
        }
        level.var_e2279748[level.var_e2279748.size] = var_3ab52107[i];
    }
    level.var_62f48651 = [];
    for (i = 0; i < level.var_30e1cfa.size; i++) {
        n_result = level.var_e2279748[level.var_30e1cfa[i]];
        if (!isdefined(level.var_62f48651)) {
            level.var_62f48651 = [];
        } else if (!isarray(level.var_62f48651)) {
            level.var_62f48651 = array(level.var_62f48651);
        }
        level.var_62f48651[level.var_62f48651.size] = n_result;
    }
    level.var_6df70f90 = getentarray("jcc_01", "targetname");
    foreach (mdl_monitor in level.var_6df70f90) {
        var_aa794395 = mdl_monitor.origin + anglestoforward(mdl_monitor.angles) * -15;
        mdl_monitor.t_interact = spawn("trigger_radius_use", var_aa794395, 0, 64, 64);
        mdl_monitor.t_interact sethintstring(#"");
        mdl_monitor.t_interact setcursorhint("HINT_NOICON");
        mdl_monitor.t_interact triggerignoreteam();
        mdl_monitor thread function_a9c796c9(1);
        mdl_monitor thread function_3f41df11(self);
    }
    self waittill(#"death", #"hash_300e9fed7925cd69");
    foreach (mdl_monitor in level.var_6df70f90) {
        mdl_monitor setmodel(#"p8_zm_esc_comm_monitor_sml_01_screen_off");
        mdl_monitor.t_interact delete();
        mdl_monitor thread function_a9c796c9(0);
    }
    var_e1b1210d = getent("md_te_mi", "targetname");
    var_e1b1210d setmodel(#"hash_75a106abbb5f5fa1");
    var_e1b1210d playsound(#"hash_4bf7a429b9e473");
    var_e1b1210d stoploopsound();
    exploder::stop_exploder("lgtexp_comm_monitors_on");
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x1 linked
// Checksum 0x9c11b3f, Offset: 0xc0e0
// Size: 0xbc
function function_a9c796c9(var_ad361c37) {
    self endon(#"death");
    wait randomfloatrange(0, 0.4);
    if (var_ad361c37) {
        self playsound(#"hash_36db3f0a61c9a48f");
        self playloopsound(#"hash_36df3b0a61cd869a");
        return;
    }
    self stoploopsound();
    self playsound(#"hash_4bf7a429b9e473");
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x5 linked
// Checksum 0xceed00bc, Offset: 0xc1a8
// Size: 0x254
function private function_3f41df11(var_aa11c23c) {
    var_aa11c23c endon(#"death", #"hash_300e9fed7925cd69");
    var_fda10a91 = array(#"hash_7b807c00f606fd42", #"hash_7b807b00f606fb8f", #"hash_7b807a00f606f9dc", #"hash_7b807900f606f829", #"hash_7b807800f606f676", #"hash_7b807700f606f4c3", #"hash_7b807600f606f310", #"hash_7b808500f6070c8d", #"hash_7b808400f6070ada", #"hash_7b7cf700f603e56c", #"hash_7b7cf800f603e71f", #"hash_7b7cf900f603e8d2");
    n_ph = level.var_72ea8db7[self.script_int];
    var_d7fe6e89 = var_fda10a91[n_ph];
    var_888f63a1 = level.var_e2279748[n_ph] + 6;
    var_6695748c = var_fda10a91[var_888f63a1];
    self setmodel(var_d7fe6e89);
    var_a9ef48ba = var_6695748c;
    while (isdefined(self.t_interact)) {
        s_result = self.t_interact waittill(#"trigger");
        if (isplayer(s_result.activator)) {
            self setmodel(var_a9ef48ba);
            self playsound(#"hash_552ae6616a45cb98");
            if (var_a9ef48ba == var_6695748c) {
                var_a9ef48ba = var_d7fe6e89;
            } else {
                var_a9ef48ba = var_6695748c;
            }
        }
        wait 0.15;
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0x425456b0, Offset: 0xc408
// Size: 0x1ca
function private function_cadaca27() {
    self endon(#"death", #"hash_300e9fed7925cd69");
    level.var_8eec9430 endon(#"death");
    level.var_8eec9430.script_noteworthy = "blast_attack_interactables";
    while (!(isdefined(level.var_8eec9430.var_ecdd7879) && level.var_8eec9430.var_ecdd7879)) {
        level.var_8eec9430 waittill(#"blast_attack");
        level.var_8eec9430 clientfield::set("" + #"hash_65da20412fcaf97e", 0);
        level.var_8eec9430.b_visible = 1;
        s_result = level.var_8eec9430 waittill(#"hash_6f38117315565110");
        level.var_8eec9430 clientfield::set("" + #"hash_65da20412fcaf97e", 2);
        level.var_8eec9430.b_visible = undefined;
        if (!(isdefined(s_result.b_success) && s_result.b_success)) {
            level.var_8eec9430.var_ecdd7879 = 1;
            return false;
        }
        if (level.var_62f48651.size <= 0) {
            level.var_8eec9430.var_ecdd7879 = 1;
            return true;
        }
    }
    return false;
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x1 linked
// Checksum 0x76d210f0, Offset: 0xc5e0
// Size: 0x244
function function_3b4d7656(n_num) {
    level.var_8eec9430 endon(#"death", #"hash_585dd04498227242");
    self endon(#"death", #"hash_300e9fed7925cd69");
    switch (n_num) {
    case 0:
        mdl_panel = getent("ph_p_1", "script_noteworthy");
        break;
    case 1:
        mdl_panel = getent("ph_p_1", "script_noteworthy");
        break;
    case 2:
        mdl_panel = getent("ph_p_1", "script_noteworthy");
        break;
    case 3:
        mdl_panel = getent("ph_p_1", "script_noteworthy");
        break;
    case 4:
        mdl_panel = getent("ph_p_1", "script_noteworthy");
        break;
    case 5:
        mdl_panel = getent("ph_p_1", "script_noteworthy");
        break;
    }
    mdl_panel thread scene::play(mdl_panel.bundle, "GREEN", mdl_panel);
    mdl_panel playsound(#"hash_30d4c7c667c80123");
    wait 3;
    mdl_panel thread scene::play(mdl_panel.bundle, "RESET", mdl_panel);
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x5 linked
// Checksum 0xde76303c, Offset: 0xc830
// Size: 0x2d6
function private function_eab368cb(s_interact) {
    self endon(#"death", #"hash_300e9fed7925cd69");
    e_generator = getent("b64_si_gen", "script_noteworthy");
    e_generator setmodel(#"p8_fxanim_zm_esc_generator_lrg_mod");
    e_generator thread scene::play(e_generator.bundle, "OFF", e_generator);
    s_interact.var_b31fa41a = util::spawn_model("tag_origin", s_interact.origin, s_interact.angles);
    s_interact.var_b31fa41a clientfield::set("" + #"hash_64f2dd36b17bf17", 1);
    s_interact.t_interact = spawn("trigger_radius_use", s_interact.origin, 0, 128, 64);
    s_interact.t_interact sethintstring(#"");
    s_interact.t_interact setcursorhint("HINT_NOICON");
    s_interact.t_interact triggerignoreteam();
    s_interact.t_interact setvisibletoall();
    while (true) {
        s_result = s_interact.t_interact waittill(#"trigger");
        if (isplayer(s_result.activator)) {
            s_interact.e_activator = s_result.activator;
            break;
        }
    }
    s_interact.t_interact delete();
    s_interact.var_b31fa41a clientfield::set("" + #"hash_64f2dd36b17bf17", 0);
    s_interact.var_b31fa41a delete();
    exploder::stop_exploder("lgtexp_building64_power_on");
    self notify(#"hash_47037a033334904");
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0x788e5174, Offset: 0xcb10
// Size: 0x5c0
function private function_718e6106() {
    self endon(#"death", #"hash_300e9fed7925cd69");
    b_success = undefined;
    if (!isdefined(level.var_6ab72806)) {
        level.var_6ab72806 = 5;
    }
    if (!isdefined(level.var_f7febee4)) {
        level function_18b599e0();
    }
    b_success = self function_dc164d78();
    self notify(#"hash_3e30564346f7cd94");
    self notify(#"hash_2877e7dda4d090c8", {#b_success:b_success});
    if (isdefined(b_success) && b_success) {
        level.var_f7febee4 = array::randomize(level.var_f7febee4);
        level.var_30e1cfa = array(level.var_f7febee4[0].script_int, level.var_f7febee4[1].script_int, level.var_f7febee4[2].script_int);
        var_abad41d = [];
        foreach (var_7b2c16b1 in level.var_f7febee4) {
            if (isinarray(level.var_30e1cfa, var_7b2c16b1.script_int)) {
                if (!isdefined(var_abad41d)) {
                    var_abad41d = [];
                } else if (!isarray(var_abad41d)) {
                    var_abad41d = array(var_abad41d);
                }
                if (!isinarray(var_abad41d, var_7b2c16b1.mdl_light)) {
                    var_abad41d[var_abad41d.size] = var_7b2c16b1.mdl_light;
                }
                var_7b2c16b1.mdl_light setmodel(#"p8_zm_zod_light_bulb_01_on");
                var_7b2c16b1.mdl_light clientfield::set("" + #"hash_119729072e708651", 1);
                continue;
            }
            var_7b2c16b1.mdl_light setmodel(#"p8_zm_zod_light_bulb_01_off");
            var_7b2c16b1.mdl_light clientfield::set("" + #"hash_119729072e708651", 0);
        }
        wait 6;
        var_a94e126 = 0;
        var_47df32b8 = 1;
        while (var_a94e126 < 7) {
            foreach (mdl_light in var_abad41d) {
                if (isdefined(var_47df32b8) && var_47df32b8) {
                    mdl_light setmodel(#"p8_zm_zod_light_bulb_01_off");
                    var_7b2c16b1.mdl_light clientfield::set("" + #"hash_119729072e708651", 0);
                    var_47df32b8 = 0;
                    continue;
                }
                mdl_light setmodel(#"p8_zm_zod_light_bulb_01_on");
                var_7b2c16b1.mdl_light clientfield::set("" + #"hash_119729072e708651", 1);
                var_47df32b8 = 1;
            }
            var_a94e126++;
            wait 0.2;
        }
    }
    level.var_89231fe9 = undefined;
    level.var_84fbe7bc = undefined;
    if (isdefined(level.var_f7febee4)) {
        foreach (var_7b2c16b1 in level.var_f7febee4) {
            if (isdefined(var_7b2c16b1.mdl_light)) {
                var_7b2c16b1.mdl_light setmodel(#"p8_zm_zod_light_bulb_01_off");
                var_7b2c16b1.mdl_light clientfield::set("" + #"hash_119729072e708651", 0);
            }
            if (isdefined(var_7b2c16b1.t_interact)) {
                var_7b2c16b1.t_interact setinvisibletoall();
            }
        }
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x1 linked
// Checksum 0x1843b25b, Offset: 0xd0d8
// Size: 0x326
function function_18b599e0() {
    level.var_f7febee4 = struct::get_array("64_sm_pos", "targetname");
    foreach (var_7b2c16b1 in level.var_f7febee4) {
        var_7b2c16b1.mdl_symbol = util::spawn_model(var_7b2c16b1.model, var_7b2c16b1.origin, var_7b2c16b1.angles);
        var_7b2c16b1.mdl_light = getent(var_7b2c16b1.target, "targetname");
        var_7b2c16b1.t_interact = spawn("trigger_radius_use", var_7b2c16b1.origin, 0, 64, 64);
        var_7b2c16b1.t_interact sethintstring(#"");
        var_7b2c16b1.t_interact setcursorhint("HINT_NOICON");
        var_7b2c16b1.t_interact triggerignoreteam();
        var_7b2c16b1.t_interact setinvisibletoall();
    }
    level.var_b530c85c = [];
    var_dcb38ed6 = struct::get_array("ph_sm_pos", "targetname");
    foreach (var_85151c86 in var_dcb38ed6) {
        mdl_symbol = util::spawn_model(var_85151c86.model, var_85151c86.origin, var_85151c86.angles);
        if (!isdefined(level.var_b530c85c)) {
            level.var_b530c85c = [];
        } else if (!isarray(level.var_b530c85c)) {
            level.var_b530c85c = array(level.var_b530c85c);
        }
        if (!isinarray(level.var_b530c85c, mdl_symbol)) {
            level.var_b530c85c[level.var_b530c85c.size] = mdl_symbol;
        }
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0x10bbbfcc, Offset: 0xd408
// Size: 0x648
function private function_dc164d78() {
    self endon(#"death", #"hash_300e9fed7925cd69");
    level.var_84fbe7bc = function_1b0a3e6e();
    var_56eace20 = 1;
    b_trace_passed = 0;
    n_start_time = gettime();
    for (n_total_time = 0; !(isdefined(b_trace_passed) && b_trace_passed) & n_total_time < 6.1; n_total_time = (n_current_time - n_start_time) / 1000) {
        foreach (e_player in util::get_players()) {
            if (isdefined(level.var_84fbe7bc[0].mdl_symbol sightconetrace(e_player geteye(), e_player, vectornormalize(e_player getplayerangles()), 30)) && level.var_84fbe7bc[0].mdl_symbol sightconetrace(e_player geteye(), e_player, vectornormalize(e_player getplayerangles()), 30)) {
                b_trace_passed = 1;
                break;
            }
        }
        waitframe(1);
        n_current_time = gettime();
    }
    self thread function_bd132295();
    while (var_56eace20 <= level.var_6ab72806) {
        for (i = 0; i < var_56eace20; i++) {
            level.var_84fbe7bc[i].mdl_light setmodel(#"p8_zm_zod_light_bulb_01_on");
            level.var_84fbe7bc[i].mdl_light clientfield::set("" + #"hash_119729072e708651", 1);
            wait 3.9;
            level.var_84fbe7bc[i].mdl_light setmodel(#"p8_zm_zod_light_bulb_01_off");
            level.var_84fbe7bc[i].mdl_light clientfield::set("" + #"hash_119729072e708651", 0);
            if (var_56eace20 > 1) {
                wait 1.3;
            }
        }
        foreach (var_7b2c16b1 in level.var_f7febee4) {
            var_7b2c16b1.t_interact setvisibletoall();
        }
        level.var_89231fe9 = 0;
        array::thread_all(level.var_f7febee4, &function_81650808, self, var_56eace20);
        s_result = self waittilltimeout(30, #"hash_34486fb413da1672");
        foreach (var_7b2c16b1 in level.var_f7febee4) {
            var_7b2c16b1.t_interact setinvisibletoall();
        }
        if (!(isdefined(s_result.b_success) && s_result.b_success)) {
            if (isdefined(s_result.e_player)) {
                s_result.e_player playlocalsound(#"hash_1588095b858588d");
            }
            return false;
        }
        foreach (var_7b2c16b1 in level.var_f7febee4) {
            if (isdefined(var_7b2c16b1.mdl_light)) {
                var_7b2c16b1.mdl_light setmodel(#"p8_zm_zod_light_bulb_01_off");
                var_7b2c16b1.mdl_light clientfield::set("" + #"hash_119729072e708651", 0);
            }
        }
        var_56eace20++;
        level.var_84fbe7bc = function_1b0a3e6e();
    }
    playsoundatposition(#"hash_2218138040c6b2ff", (0, 0, 0));
    return true;
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 2, eflags: 0x5 linked
// Checksum 0xd0c58854, Offset: 0xda58
// Size: 0x1f8
function private function_81650808(var_aa11c23c, var_56eace20) {
    var_aa11c23c endon(#"death", #"hash_300e9fed7925cd69", #"hash_34486fb413da1672");
    while (level.var_89231fe9 < var_56eace20) {
        s_result = self.t_interact waittill(#"trigger");
        self.mdl_light setmodel(#"p8_zm_zod_light_bulb_01_on");
        self.mdl_light clientfield::set("" + #"hash_119729072e708651", 1);
        wait 1;
        self.mdl_light setmodel(#"p8_zm_zod_light_bulb_01_off");
        self.mdl_light clientfield::set("" + #"hash_119729072e708651", 0);
        wait 1;
        if (self !== level.var_84fbe7bc[level.var_89231fe9]) {
            var_aa11c23c notify(#"hash_34486fb413da1672", {#b_success:0, #e_player:s_result.activator});
        }
        level.var_89231fe9++;
    }
    var_aa11c23c notify(#"hash_34486fb413da1672", {#b_success:1, #e_player:s_result.activator});
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0x8d63bc3d, Offset: 0xdc58
// Size: 0x16a
function private function_1b0a3e6e() {
    var_84fbe7bc = [];
    var_f3b29ae8 = undefined;
    for (i = 0; i < level.var_6ab72806; i++) {
        s_pos[i] = array::random(level.var_f7febee4);
        if (i >= 2 && s_pos[i] == var_f3b29ae8 && s_pos[i] == s_pos[i - 2]) {
            while (s_pos[i] === var_f3b29ae8) {
                s_pos[i] = array::random(level.var_f7febee4);
            }
        }
        if (!isdefined(var_84fbe7bc)) {
            var_84fbe7bc = [];
        } else if (!isarray(var_84fbe7bc)) {
            var_84fbe7bc = array(var_84fbe7bc);
        }
        var_84fbe7bc[var_84fbe7bc.size] = s_pos[i];
        var_f3b29ae8 = s_pos[i];
    }
    return var_84fbe7bc;
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x5 linked
// Checksum 0x54b3b7db, Offset: 0xddd0
// Size: 0x40c
function private function_bc57a72c(var_c34665fc) {
    if (isdefined(level.var_ed42611e) && level.var_ed42611e.size) {
        foreach (var_7cc5799f in level.var_ed42611e) {
            if (!isdefined(var_7cc5799f)) {
                continue;
            }
            var_7cc5799f scene::stop(#"aib_vign_zm_mob_power_ghost_opperate_success");
            var_7cc5799f animation::stop();
            waitframe(1);
            if (isdefined(var_7cc5799f)) {
                var_7cc5799f thread scene::init(#"aib_vign_zm_mob_power_ghost_opperate_success", array(level.var_8eec9430, var_7cc5799f));
            }
        }
        level.var_ed42611e = undefined;
    }
    if (isdefined(level.var_8eec9430)) {
        level.var_8eec9430 notify(#"hash_585dd04498227242");
        level.var_8eec9430 delete();
    }
    var_58774a5e = struct::get("ph_gen_pos", "targetname");
    if (isdefined(var_58774a5e.t_interact)) {
        var_58774a5e.t_interact delete();
    }
    if (isdefined(var_58774a5e.var_b31fa41a)) {
        var_58774a5e.var_b31fa41a delete();
    }
    level.var_89231fe9 = undefined;
    level.var_84fbe7bc = undefined;
    if (isdefined(level.var_f7febee4)) {
        foreach (var_7b2c16b1 in level.var_f7febee4) {
            if (isdefined(var_7b2c16b1.mdl_light)) {
                var_7b2c16b1.mdl_light setmodel(#"p8_zm_zod_light_bulb_01_off");
                var_7b2c16b1.mdl_light clientfield::set("" + #"hash_119729072e708651", 0);
            }
            if (isdefined(var_7b2c16b1.t_interact)) {
                var_7b2c16b1.t_interact setinvisibletoall();
            }
        }
    }
    var_78fda516 = struct::get("ph_pc_pos", "targetname");
    if (isdefined(var_78fda516.var_11e3fffb)) {
        var_78fda516.var_11e3fffb delete();
    }
    if (isdefined(var_78fda516.t_interact)) {
        var_78fda516.t_interact delete();
    }
    var_e1b1210d = getent("md_te_mi", "targetname");
    if (isdefined(var_e1b1210d)) {
        var_e1b1210d setmodel(#"hash_75a106abbb5f5fa1");
        if (isdefined(var_e1b1210d.t_interact)) {
            var_e1b1210d.t_interact delete();
        }
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0x6037bef3, Offset: 0xe1e8
// Size: 0x22e
function private function_1fb1907c() {
    self endon(#"death", #"hash_300e9fed7925cd69");
    var_78fda516 = struct::get("ph_pc_pos", "targetname");
    var_78fda516.var_11e3fffb = util::spawn_model(var_78fda516.model, var_78fda516.origin, var_78fda516.angles);
    var_78fda516.var_11e3fffb playsound(#"hash_13aeee936e183bc7");
    var_78fda516.t_interact = spawn("trigger_radius_use", var_78fda516.origin, 0, 64, 64);
    var_78fda516.t_interact sethintstring(#"");
    var_78fda516.t_interact setcursorhint("HINT_NOICON");
    var_78fda516.t_interact triggerignoreteam();
    while (true) {
        s_result = var_78fda516.t_interact waittill(#"trigger");
        if (isplayer(s_result.activator)) {
            s_result.activator playsound(#"hash_5cc174edb720191c");
            var_78fda516.var_11e3fffb delete();
            break;
        }
    }
    self notify(#"punchcard_pickup", {#activator:s_result.activator});
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0x11bef12a, Offset: 0xe420
// Size: 0x228
function private function_ca9ddf1b() {
    self endon(#"death", #"hash_300e9fed7925cd69");
    var_e1b1210d = getent("md_te_mi", "targetname");
    var_aa794395 = var_e1b1210d.origin + anglestoforward(var_e1b1210d.angles) * -15 + (0, 0, 5);
    var_e1b1210d.t_interact = spawn("trigger_radius_use", var_aa794395, 0, 64, 64);
    var_e1b1210d.t_interact sethintstring(#"");
    var_e1b1210d.t_interact setcursorhint("HINT_NOICON");
    var_e1b1210d.t_interact triggerignoreteam();
    while (isdefined(var_e1b1210d.t_interact)) {
        s_result = var_e1b1210d.t_interact waittill(#"trigger");
        if (isplayer(s_result.activator)) {
            var_e1b1210d setmodel(#"hash_1cfe304d7d3199a5");
            var_e1b1210d playsound(#"hash_2ebc34552a47c16f");
            var_e1b1210d playloopsound(#"hash_2ebf30552a49f07a");
            self notify(#"hash_1548855706869d2f");
            var_e1b1210d.t_interact delete();
        }
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0x39b79080, Offset: 0xe650
// Size: 0x210
function private function_fb553d70() {
    level scene::add_scene_func(#"p8_fxanim_zm_escape_pigeon_standing_01", &function_23467a20, "play");
    level scene::add_scene_func(#"p8_fxanim_zm_escape_pigeon_standing_02", &function_23467a20, "play");
    level scene::add_scene_func(#"p8_fxanim_zm_escape_pigeon_standing_03", &function_23467a20, "play");
    level scene::add_scene_func(#"p8_fxanim_zm_escape_pigeon_standing_04", &function_23467a20, "play");
    a_s_pigeons = struct::get_array("ph_gh_pi", "targetname");
    foreach (s_pigeon in a_s_pigeons) {
        s_pigeon thread scene::play();
    }
    self waittill(#"death", #"hash_300e9fed7925cd69");
    foreach (s_pigeon in a_s_pigeons) {
        s_pigeon thread scene::stop();
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x1 linked
// Checksum 0x78b4977, Offset: 0xe868
// Size: 0xd8
function function_23467a20(a_ents) {
    foreach (e_ent in a_ents) {
        e_ent clientfield::set("" + #"hash_504d26c38b96651c", 1);
        e_ent clientfield::set("" + #"hash_65da20412fcaf97e", 1);
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0x5469ae97, Offset: 0xe948
// Size: 0xe2
function private function_bd132295() {
    self endon(#"death", #"hash_300e9fed7925cd69", #"hash_3e30564346f7cd94");
    if (util::get_players().size == 1) {
        return;
    }
    while (true) {
        wait randomfloatrange(3, 15);
        if (zombie_utility::get_current_zombie_count() < zombie_utility::get_zombie_var(#"zombie_max_ai")) {
            ai_dog = zombie_utility::spawn_zombie(level.dog_spawners[0]);
        }
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 2, eflags: 0x5 linked
// Checksum 0x79a6ba94, Offset: 0xea38
// Size: 0x314
function private function_629fa2c8(var_5b9ba5a5, e_player) {
    level endon(#"hash_11fb44a7b531b27d", #"hash_54eae43edf7f08cd");
    if (!isalive(e_player)) {
        e_player = array::random(util::get_active_players());
    }
    switch (var_5b9ba5a5) {
    case #"hash_57e9c23bed1bd753":
        str_vo_line = #"hash_e6dbc38573eb591";
        break;
    case #"ghost_disappears":
        str_vo_line = #"hash_75dd4d3a12f7a4ff";
        break;
    case #"hash_2ea20c8cd81b5464":
        str_vo_line = #"hash_2db7e999104e9d85";
        break;
    case #"hash_72bb7bc935d4da67":
        str_vo_line = #"hash_7908358765812286";
        break;
    case #"hash_fd8e78c22906fc1":
        str_vo_line = #"hash_5f84ae79adca64b4";
        break;
    case #"hash_115ac6d40d4cc85b":
        str_vo_line = #"hash_459548ac9c477e2e";
        break;
    case #"hash_1d191ca6765471c6":
        str_vo_line = #"hash_58698646dc41b7cc";
        break;
    case #"hash_7cf90fc327de893e":
        str_vo_line = #"hash_346283ac47189915";
        break;
    case #"hash_7ab135537c096a5a":
        str_vo_line = #"hash_4de71ac9ed523e0f";
        break;
    case #"hash_4c753651e8079572":
        str_vo_line = #"hash_6a36332b44f8f69";
        break;
    case #"hash_487ac9fba78b1604":
        str_vo_line = #"hash_6aa237e9482e5cd2";
        break;
    case #"hash_57a7dd2d1b78a952":
        str_vo_line = #"hash_449831e8d03243ab";
        break;
    case #"hash_1e0663f4102106fa":
        str_vo_line = #"hash_21d36ad9aebdc862";
        break;
    case #"hash_46252c9e0b200ae6":
        str_vo_line = #"hash_420cd62afa5f7e5f";
        break;
    case #"hash_26aa170c4122be2b":
        str_vo_line = #"hash_7cf068b4ca0db57b";
        break;
    }
    e_player zm_vo::function_a2bd5a0c(str_vo_line, 0, 1, 9999, 0, 0, 1);
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 2, eflags: 0x5 linked
// Checksum 0x8f3664cd, Offset: 0xed58
// Size: 0x42a
function private function_ac1d7a0e(var_5b9ba5a5, e_player) {
    level endon(#"hash_11fb44a7b531b27d", #"hash_54eae43edf7f08cd");
    if (!isalive(e_player)) {
        e_player = array::random(util::get_active_players());
    }
    e_richtofen = paschal::function_b1203924();
    var_2c5c52cb = e_player zm_characters::function_d35e4c92() - 5;
    switch (var_5b9ba5a5) {
    case #"hash_368df266f54ec3b1":
        str_vo_line = #"hash_49abe33ce5251a4b";
        var_6d4b089d = #"hash_4a5baedb3bc6ec08";
        var_566e10e3 = #"hash_49abe53ce5251db1";
        break;
    case #"hash_7d360b71501ba662":
        str_vo_line = #"hash_647c6e21cc49b3cc";
        var_6d4b089d = #"hash_1ec507e435e1a4bd";
        var_566e10e3 = #"hash_647c7021cc49b732";
        break;
    case #"hash_53aafd7783e33981":
        str_vo_line = #"hash_6fb17b666e2addfb";
        var_6d4b089d = #"hash_5cfddff273a7cf98";
        var_566e10e3 = #"hash_6fb17d666e2ae161";
        break;
    case #"hash_34aad6dd5eebdb0b":
        str_vo_line = #"hash_da5ecd0d4841b4a";
        var_6d4b089d = #"hash_4b6f538c82ce10eb";
        var_566e10e3 = #"hash_da5ead0d48417e4";
        break;
    case #"hash_51300ea0974da947":
        str_vo_line = #"hash_3563aeaee897cb95";
        var_6d4b089d = #"hash_54fabdc91a5724b2";
        var_566e10e3 = #"hash_3563acaee897c82f";
        break;
    case #"hash_334295910a49036e":
        str_vo_line = #"hash_780ebb7a9f39cdc8";
        var_6d4b089d = #"hash_69a626c29083fc71";
        var_566e10e3 = #"hash_780ebd7a9f39d12e";
        break;
    }
    for (b_said = undefined; !(isdefined(b_said) && b_said); b_said = e_player zm_vo::function_a2bd5a0c(str_vo_line, 0, 1, 9999)) {
        zm_vo::function_3c173d37(e_player.origin, 512);
    }
    if (!isdefined(e_richtofen) || !isalive(e_richtofen) || !(isdefined(e_richtofen.var_59dde2f6) && e_richtofen.var_59dde2f6)) {
        return;
    }
    e_richtofen zm_vo::vo_stop();
    b_say = e_richtofen zm_vo::vo_say(var_6d4b089d, 0, 1, 9999, 1, 1, 1);
    for (var_350e5be3 = undefined; !(isdefined(var_350e5be3) && var_350e5be3) && isalive(e_richtofen); var_350e5be3 = e_richtofen zm_vo::function_a2bd5a0c(var_566e10e3, 0, 1, 9999)) {
        zm_vo::function_3c173d37(e_richtofen.origin, 512);
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 2, eflags: 0x5 linked
// Checksum 0x481c7c99, Offset: 0xf190
// Size: 0x142
function private function_29d29761(e_ghost, var_5b9ba5a5) {
    e_ghost endon(#"death", #"ghost_seen");
    self endon(#"disconnect");
    while (true) {
        if (self zm_utility::is_player_looking_at(e_ghost getcentroid()) && self clientfield::get("" + #"hash_184a34e85c29399f")) {
            if (!(isdefined(level.var_9cb7c32e) && level.var_9cb7c32e)) {
                level.var_9cb7c32e = 1;
                level function_629fa2c8(#"hash_57e9c23bed1bd753", self);
                wait 0.5;
            }
            level thread function_629fa2c8(var_5b9ba5a5, self);
            e_ghost notify(#"ghost_seen");
        }
        waitframe(1);
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0x4836c428, Offset: 0xf2e0
// Size: 0x128
function private function_a9277243() {
    self endon(#"death");
    self.t_interact = spawn("trigger_radius_use", self.origin, 0, 94, 64);
    self.t_interact sethintstring(#"");
    self.t_interact setcursorhint("HINT_NOICON");
    self.t_interact triggerignoreteam();
    while (isdefined(self.t_interact)) {
        s_result = self.t_interact waittill(#"trigger");
        if (isplayer(s_result.activator)) {
            self notify(#"hash_1f3cf68a268a10f1");
            self.t_interact delete();
        }
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x5 linked
// Checksum 0x5f12a279, Offset: 0xf410
// Size: 0x174
function private function_e128a8d4(var_982513ee = 1) {
    if (!var_982513ee) {
        self clientfield::set("" + #"hash_3e506d7aedac6ae0", 10);
    }
    self setteam(util::get_enemy_team(level.zombie_team));
    self.health = 961;
    self val::set(#"ai_ghost", "ignoreme", 1);
    self val::set(#"ai_ghost", "ignoreall", 1);
    self val::set(#"ai_ghost", "allowdeath", 0);
    self setcandamage(0);
    self.b_ignore_cleanup = 1;
    self.var_77858b62 = &function_1cda4094;
    self.disable_flame_fx = 1;
    self notsolid();
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x5 linked
// Checksum 0x41bfe1d0, Offset: 0xf590
// Size: 0xbe
function private function_3e62ca0b(ai_ghost) {
    self endon(#"death", #"hash_300e9fed7925cd69");
    ai_ghost endon(#"death", #"blast_attack", #"hash_585dd04498227242");
    wait 90;
    level waittill(#"between_round_over");
    self notify(#"hash_300e9fed7925cd69", {#b_success:0, #var_d0af61fc:1});
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 2, eflags: 0x5 linked
// Checksum 0x6d99aad4, Offset: 0xf658
// Size: 0x7c
function private function_a51841a(e_attacker, var_5b9ba5a5) {
    self clientfield::set("" + #"hash_65da20412fcaf97e", 1);
    array::thread_all(util::get_players(), &function_29d29761, self, var_5b9ba5a5);
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x5 linked
// Checksum 0x82313abc, Offset: 0xf6e0
// Size: 0x1da
function private function_1db8a8b2(var_b51b4b08) {
    self endon(#"death", #"hash_585dd04498227242");
    var_3741f4b0 = struct::get_array(var_b51b4b08, "script_noteworthy");
    var_25d70459 = arraygetclosest(self.origin, var_3741f4b0);
    s_next_pos = struct::get(var_25d70459.target, "targetname");
    self.goalradius = 64;
    v_pos = getclosestpointonnavmesh(var_25d70459.origin, 128, 16);
    assert(isdefined(v_pos), "<dev string:xfa>" + var_25d70459.origin);
    wait 2.9;
    self setgoal(v_pos);
    self waittilltimeout(20, #"goal");
    while (true) {
        self setgoal(s_next_pos.origin);
        self waittilltimeout(20, #"goal");
        var_25d70459 = s_next_pos;
        if (isdefined(var_25d70459.target)) {
            s_next_pos = struct::get(var_25d70459.target, "targetname");
        }
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0x86517c00, Offset: 0xf8c8
// Size: 0x1e8
function private function_768e71d5() {
    self endon(#"death", #"hash_71716a8e79096aee");
    self.t_interact = spawn("trigger_radius_use", self.origin + anglestoforward(self.angles) * 15 + (0, 0, 5), 0, 64, 64);
    self.t_interact enablelinkto();
    self.t_interact linkto(self);
    self.t_interact sethintstring(#"");
    self.t_interact setcursorhint("HINT_NOICON");
    self.t_interact triggerignoreteam();
    self.t_interact setvisibletoall();
    self.t_interact endon(#"death");
    while (true) {
        s_result = self.t_interact waittill(#"trigger");
        if (isplayer(s_result.activator)) {
            self notify(#"hash_17de7292d988f537");
            self.e_activator = s_result.activator;
            self playsound(#"hash_3ebf00b76f5438f8");
        }
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 2, eflags: 0x5 linked
// Checksum 0x1696c63, Offset: 0xfab8
// Size: 0x1fc
function private function_cd0d0123(a_s_firewalls, str_exploder) {
    var_d3c21d73 = (0, 0, 48);
    level zm_bgb_anywhere_but_here::function_886fce8f(0);
    foreach (s_firewall in a_s_firewalls) {
        s_firewall.var_3cefdbf5 = util::spawn_model("collision_player_wall_128x128x10", s_firewall.origin + var_d3c21d73, s_firewall.angles);
        s_firewall.var_3cefdbf5 ghost();
    }
    if (isdefined(str_exploder)) {
        exploder::exploder(str_exploder);
    }
    self waittill(#"death", #"hash_300e9fed7925cd69");
    if (isdefined(str_exploder)) {
        exploder::stop_exploder(str_exploder);
    }
    foreach (s_firewall in a_s_firewalls) {
        if (isdefined(s_firewall.var_3cefdbf5)) {
            s_firewall.var_3cefdbf5 delete();
        }
    }
    level zm_bgb_anywhere_but_here::function_886fce8f(1);
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x1 linked
// Checksum 0x42b02350, Offset: 0xfcc0
// Size: 0x316
function function_1cda4094(e_player) {
    self notify(#"hash_3f91506396266ee6");
    self endon(#"hash_3f91506396266ee6");
    e_player endon(#"disconnect");
    if (!isalive(self) || isdefined(self.var_5bf7575e) && self.var_5bf7575e || isdefined(self.aat_turned) && self.aat_turned || !(isdefined(self.var_c95261d) && self.var_c95261d)) {
        return;
    }
    self.var_5bf7575e = 1;
    self ai::stun();
    self.instakill_func = &function_6472c628;
    if (!self clientfield::get("" + #"hash_1b02e77fdbc51a4d")) {
        var_21c1ba1 = e_player getentitynumber();
        self clientfield::set("" + #"hash_1b02e77fdbc51a4d", var_21c1ba1 + 1);
        e_player clientfield::set("" + #"hash_1efc6bf68f09d02c", 2);
    }
    while (e_player.var_f1b20bef === self && isalive(self) && isdefined(self.var_c95261d) && self.var_c95261d) {
        waitframe(1);
    }
    var_d64818ae = e_player clientfield::get("" + #"hash_1efc6bf68f09d02c");
    if (e_player attackbuttonpressed() && var_d64818ae === 2) {
        e_player clientfield::set("" + #"hash_1efc6bf68f09d02c", 1);
    }
    if (isalive(self)) {
        if (self clientfield::get("" + #"hash_1b02e77fdbc51a4d")) {
            self clientfield::set("" + #"hash_1b02e77fdbc51a4d", 0);
        }
        self.var_5bf7575e = 0;
        self ai::clear_stun();
        self.instakill_func = undefined;
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 3, eflags: 0x5 linked
// Checksum 0xdcba3c19, Offset: 0xffe0
// Size: 0x6e
function private function_6472c628(e_player, mod, shitloc) {
    w_current = e_player getcurrentweapon();
    if (w_current === level.var_d7e67022 || w_current === level.var_637136f3) {
        return true;
    }
    return false;
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 2, eflags: 0x5 linked
// Checksum 0xa870adb4, Offset: 0x10058
// Size: 0x31c
function private function_b952c1b(var_4bdd091b, str_tag = "j_spinelower") {
    var_4bdd091b endon(#"death", #"hash_71716a8e79096aee");
    v_pos = self getcentroid();
    var_88f24b00 = util::spawn_model("tag_origin", v_pos + (0, 0, 12), self.angles);
    var_88f24b00 clientfield::set("" + #"hash_7a8b6df890ccc630", 1);
    var_88f24b00 playsound(#"zmb_sq_souls_release");
    n_dist = distance(var_88f24b00.origin, var_4bdd091b gettagorigin(str_tag));
    n_move_time = n_dist / 800;
    n_dist_sq = distance2dsquared(var_88f24b00.origin, var_4bdd091b gettagorigin(str_tag));
    n_start_time = gettime();
    n_total_time = 0;
    while (n_dist_sq > 576 && isalive(var_4bdd091b)) {
        var_88f24b00 moveto(var_4bdd091b gettagorigin(str_tag), n_move_time);
        wait 0.1;
        if (isalive(var_4bdd091b)) {
            n_current_time = gettime();
            n_total_time = (n_current_time - n_start_time) / 1000;
            n_move_time = var_4bdd091b zm_weap_spectral_shield::function_f40aa0ef(var_88f24b00, n_total_time);
            if (n_move_time == 0) {
                break;
            }
            n_dist_sq = distance2dsquared(var_88f24b00.origin, var_4bdd091b geteye());
        }
    }
    var_4bdd091b playsound(#"zmb_sq_souls_impact");
    var_88f24b00 clientfield::set("" + #"hash_7a8b6df890ccc630", 0);
    wait 0.5;
    var_4bdd091b notify(#"hash_7b36770a2988e5d1");
    var_88f24b00 delete();
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x5 linked
// Checksum 0x99859f41, Offset: 0x10380
// Size: 0x19e
function private function_56e41aa6(var_7df17d61) {
    var_be009f9c = self.var_be009f9c;
    if (!isdefined(var_7df17d61)) {
        return 0;
    }
    var_b212834c = getclosestpointonnavmesh(var_7df17d61, 128, 16);
    if (isdefined(var_b212834c)) {
        var_7df17d61 = var_b212834c;
        var_b212834c = groundtrace(var_7df17d61 + (0, 0, 100), var_7df17d61 + (0, 0, -1000), 0, undefined, 0)[#"position"];
        if (isdefined(var_b212834c)) {
            var_7df17d61 = var_b212834c;
        }
    }
    b_success = level function_252499a3(var_7df17d61);
    if (b_success) {
        if (!isdefined(level.var_659daf1d)) {
            level.var_659daf1d = [];
        } else if (!isarray(level.var_659daf1d)) {
            level.var_659daf1d = array(level.var_659daf1d);
        }
        if (!isinarray(level.var_659daf1d, var_be009f9c)) {
            level.var_659daf1d[level.var_659daf1d.size] = var_be009f9c;
        }
    }
    return b_success;
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x5 linked
// Checksum 0xabe74262, Offset: 0x10528
// Size: 0x226
function private function_252499a3(v_pos) {
    mdl_orb = util::spawn_model(#"p8_zm_esc_orb_red_small", v_pos + (0, 0, 5));
    mdl_orb setscale(4);
    mdl_orb playsound(#"hash_748c338212771d3");
    mdl_orb.t_interact = spawn("trigger_radius_use", v_pos + (0, 0, 20), 0, 64, 64);
    mdl_orb.t_interact sethintstring(#"");
    mdl_orb.t_interact setcursorhint("HINT_NOICON");
    mdl_orb.t_interact triggerignoreteam();
    while (isdefined(mdl_orb)) {
        s_result = mdl_orb.t_interact waittill(#"trigger");
        if (isplayer(s_result.activator)) {
            playsoundatposition(#"hash_6aa220e65103f345", mdl_orb.origin);
            mdl_orb.t_interact delete();
            mdl_orb delete();
            s_result.activator thread zm_audio::create_and_play_dialog(#"generic", #"response_positive");
            return 1;
        }
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x5 linked
// Checksum 0x81346929, Offset: 0x10758
// Size: 0x122
function private function_2c4516ae(str_door_name) {
    a_e_zombie_doors = getentarray(str_door_name, "target");
    foreach (zombie_door in a_e_zombie_doors) {
        if (isdefined(zombie_door.b_opened) && zombie_door.b_opened) {
            continue;
        }
        zombie_door notify(#"trigger", {#activator:zombie_door, #is_forced:1});
        zombie_door.script_flag_wait = undefined;
        zombie_door notify(#"power_on");
        zombie_door.b_opened = 1;
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 1, eflags: 0x5 linked
// Checksum 0x14e294a9, Offset: 0x10888
// Size: 0x98
function private function_ff88f6aa(v_teleport_position) {
    self endon(#"blast_attack", #"death");
    while (true) {
        str_zone = zm_zonemgr::get_zone_from_position(self.origin);
        if (!isdefined(str_zone)) {
            self forceteleport(v_teleport_position, self.angles, 1, 1);
        }
        wait 1;
    }
}

// Namespace namespace_a9aa9d72/namespace_a9aa9d72
// Params 0, eflags: 0x5 linked
// Checksum 0x29815292, Offset: 0x10928
// Size: 0x2c2
function private function_9b1d9d6a() {
    var_2d52f9db = struct::get("p_l_exp");
    var_fe4d15a4 = var_2d52f9db.scene_ents[#"prop 1"];
    var_2287bf7c = [];
    foreach (e_player in util::get_players()) {
        if (isalive(e_player) && var_fe4d15a4 sightconetrace(e_player getweaponmuzzlepoint(), e_player, e_player getweaponforwarddir(), 70)) {
            if (!isdefined(var_2287bf7c)) {
                var_2287bf7c = [];
            } else if (!isarray(var_2287bf7c)) {
                var_2287bf7c = array(var_2287bf7c);
            }
            var_2287bf7c[var_2287bf7c.size] = e_player;
        }
        waitframe(1);
    }
    if (var_2287bf7c.size > 0) {
        var_2287bf7c = array::randomize(var_2287bf7c);
        foreach (e_player in var_2287bf7c) {
            if (e_player zm_audio::can_speak()) {
                str_alias = #"hash_2240a0ede7e89d42" + e_player zm_characters::function_d35e4c92();
                var_db4208eb = zm_audio::get_valid_lines(str_alias);
                var_346ed7cd = 5 - level.var_85cc9fcc.size;
                str_alias = var_db4208eb[var_346ed7cd];
                zm_vo::function_3c173d37(e_player.origin, 512);
                e_player thread zm_vo::vo_say(str_alias, 0, 0, 9999);
                return;
            }
        }
    }
}

/#

    // Namespace namespace_a9aa9d72/namespace_a9aa9d72
    // Params 0, eflags: 0x0
    // Checksum 0x7cb541f6, Offset: 0x10bf8
    // Size: 0x1bc
    function function_96ac2d88() {
        if (!getdvarint(#"zm_debug_ee", 0)) {
            return;
        }
        zm_devgui::add_custom_devgui_callback(&function_2d0990d7);
        adddebugcommand("<dev string:x125>");
        adddebugcommand("<dev string:x196>");
        adddebugcommand("<dev string:x219>");
        adddebugcommand("<dev string:x292>");
        adddebugcommand("<dev string:x307>");
        adddebugcommand("<dev string:x384>");
        adddebugcommand("<dev string:x3f1>");
        adddebugcommand("<dev string:x470>");
        adddebugcommand("<dev string:x4e5>");
        adddebugcommand("<dev string:x556>");
        adddebugcommand("<dev string:x5cf>");
        adddebugcommand("<dev string:x645>");
        adddebugcommand("<dev string:x6c1>");
        adddebugcommand("<dev string:x733>");
        adddebugcommand("<dev string:x79f>");
    }

    // Namespace namespace_a9aa9d72/namespace_a9aa9d72
    // Params 1, eflags: 0x0
    // Checksum 0x4056601e, Offset: 0x10dc0
    // Size: 0x2ea
    function function_2d0990d7(cmd) {
        switch (cmd) {
        case #"hash_77f372679d07a739":
            level.var_daaf0e5d = "<dev string:x80b>";
            break;
        case #"hash_439f7c3b2be3e69e":
            level.var_daaf0e5d = "<dev string:x813>";
            break;
        case #"hash_4c0666160f60f30c":
            level.var_daaf0e5d = "<dev string:x824>";
            break;
        case #"hash_18772c2e191751b2":
            level.var_daaf0e5d = "<dev string:x830>";
            break;
        case #"hash_476f76510ea19e0a":
            level.var_daaf0e5d = "<dev string:x83a>";
            break;
        case #"hash_7993d72e5b3831ee":
            level.var_d486e9c4 = 1;
            level.var_daaf0e5d = "<dev string:x80b>";
            break;
        case #"hash_619ec063638bb2df":
            level.var_d486e9c4 = 1;
            level.var_daaf0e5d = "<dev string:x813>";
            break;
        case #"hash_63836a8684b4a3db":
            level.var_d486e9c4 = 1;
            level.var_daaf0e5d = "<dev string:x824>";
            break;
        case #"hash_6efe06e0e34fcda1":
            level.var_d486e9c4 = 1;
            level.var_daaf0e5d = "<dev string:x830>";
            break;
        case #"hash_55764ba6b85e2f4d":
            level.var_d486e9c4 = 1;
            level.var_daaf0e5d = "<dev string:x83a>";
            break;
        case #"hash_18be8ae474605ed0":
            level notify(#"hash_1a286cacd101f4eb", {#b_success:0});
            break;
        case #"hash_58ae202f026c337":
            level notify(#"hash_1a286cacd101f4eb", {#b_success:1});
            break;
        case #"hash_6499ce5666508b":
            level.var_bf412074 = 1;
            break;
        case #"hash_70db80c9c71f4e66":
            level.var_6ab72806 = 1;
            break;
        case #"hash_70db7ec9c71f4b00":
            level.var_6ab72806 = 3;
            break;
        }
    }

    // Namespace namespace_a9aa9d72/namespace_a9aa9d72
    // Params 0, eflags: 0x4
    // Checksum 0x799904c, Offset: 0x110b8
    // Size: 0xbe
    function private function_283daa98() {
        self endon(#"death", #"hash_300e9fed7925cd69");
        s_result = level waittill(#"hash_1a286cacd101f4eb");
        if (isdefined(s_result.b_success) && s_result.b_success) {
            self notify(#"hash_300e9fed7925cd69", {#b_success:1});
            return;
        }
        self notify(#"hash_300e9fed7925cd69", {#b_success:0});
    }

#/
