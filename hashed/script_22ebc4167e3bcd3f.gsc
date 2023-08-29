// Atian COD Tools GSC decompiler test
#include scripts/zm/weapons/zm_weap_tomahawk.gsc;
#include script_36222395658446f5;
#include scripts/zm/zm_escape_vo_hooks.gsc;
#include scripts/zm/zm_escape_util.gsc;
#include scripts/zm/zm_escape_pebble.gsc;
#include script_46cea9e5d4ef9e21;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/trigger_shared.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/struct.gsc;
#include scripts/core_common/scene_shared.gsc;
#include scripts/core_common/gestures.gsc;
#include scripts/core_common/flag_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;
#include scripts/core_common/array_shared.gsc;
#include scripts/zm_common/zm_loadout.gsc;
#include scripts/zm_common/zm_utility.gsc;
#include scripts/zm_common/zm_unitrigger.gsc;
#include scripts/zm_common/zm_sq.gsc;
#include scripts/zm_common/zm_score.gsc;
#include scripts/zm_common/zm_powerups.gsc;
#include scripts/zm_common/zm_melee_weapon.gsc;
#include scripts/zm_common/zm_items.gsc;
#include scripts/zm_common/zm_devgui.gsc;
#include scripts/zm_common/zm_customgame.gsc;
#include scripts/zm_common/zm_crafting.gsc;
#include scripts/zm_common/zm_bgb.gsc;
#include scripts/zm_common/zm_audio.gsc;

#namespace namespace_9d58c1cd;

// Namespace namespace_9d58c1cd/namespace_9d58c1cd
// Params 0, eflags: 0x1 linked
// Checksum 0xbb7c8bc6, Offset: 0x3b0
// Size: 0x124
function init_clientfields() {
    clientfield::register("world", "p_w_o_num_01", 1, getminbitcountfornum(10), "int");
    clientfield::register("world", "p_w_o_num_02", 1, getminbitcountfornum(10), "int");
    clientfield::register("world", "p_w_o_num_03", 1, getminbitcountfornum(10), "int");
    clientfield::register("toplayer", "sp_ar_pi", 1, 1, "int");
    clientfield::register("scriptmover", "elevator_rumble", 1, 1, "counter");
}

// Namespace namespace_9d58c1cd/namespace_9d58c1cd
// Params 0, eflags: 0x1 linked
// Checksum 0x3be1886e, Offset: 0x4e0
// Size: 0x19c
function main() {
    if (zm_utility::is_standard()) {
        var_da5e0bea = getent("crane_shock_box", "script_string");
        var_da5e0bea thread zm_escape_util::function_ad6125f0();
        return;
    }
    level flag::init(#"hash_ed90925c898d1b0");
    level flag::init(#"hash_dd62a8822ea4a38");
    level flag::init(#"hash_2444d210a1dd0dd");
    level flag::init(#"hash_6f71660057a5952f");
    level flag::init(#"hash_66f358c0066d77d8");
    init_steps();
    if (zm_utility::is_ee_enabled() || zm_utility::is_trials()) {
        zm_sq::start(#"spoon_quest", 1);
        /#
            level thread function_a860e46e();
        #/
    }
    level thread setup_docks_crane();
    level thread crane_shock_box();
}

// Namespace namespace_9d58c1cd/namespace_9d58c1cd
// Params 0, eflags: 0x1 linked
// Checksum 0xac5f1a00, Offset: 0x688
// Size: 0x64
function init_steps() {
    zm_sq::register(#"spoon_quest", #"1", #"spoon_quest_step_1", &step_1, &step_1_cleanup);
}

// Namespace namespace_9d58c1cd/namespace_9d58c1cd
// Params 1, eflags: 0x1 linked
// Checksum 0xfed47f58, Offset: 0x6f8
// Size: 0xb6
function step_1(var_a276c861) {
    level flag::wait_till("start_zombie_round_logic");
    level thread function_3fcb1e5e();
    level thread function_1c5d2f2();
    var_b09af3eb = "" + #"spoon_quest_step_1" + "_";
    level waittill(var_b09af3eb + "completed", var_b09af3eb + "skipped_over", var_b09af3eb + "ended_early");
}

// Namespace namespace_9d58c1cd/namespace_9d58c1cd
// Params 2, eflags: 0x1 linked
// Checksum 0x459d7295, Offset: 0x7b8
// Size: 0x14
function step_1_cleanup(var_a276c861, var_19e802fa) {
    
}

// Namespace namespace_9d58c1cd/namespace_9d58c1cd
// Params 0, eflags: 0x1 linked
// Checksum 0x6888e1ef, Offset: 0x7d8
// Size: 0xfc
function function_6b107487() {
    level flag::set(#"hash_ed90925c898d1b0");
    self thread scene::play("Shot 1");
    wait(1);
    var_e690c4cd = self.scene_ents[#"prop 1"];
    var_e690c4cd thread function_5ae9d41e();
    level thread zm_escape_vo_hooks::function_c179111e();
    self thread scene::play("Shot 2");
    wait(getanimlength(#"hash_591fb71679a08ed8"));
    level flag::set(#"hash_dd62a8822ea4a38");
}

// Namespace namespace_9d58c1cd/namespace_9d58c1cd
// Params 0, eflags: 0x5 linked
// Checksum 0xe8555d30, Offset: 0x8e0
// Size: 0x5c
function private function_5ae9d41e() {
    self clientfield::increment("elevator_rumble");
    level waittill(#"hash_231c2abba527e2e4");
    self clientfield::increment("elevator_rumble");
}

// Namespace namespace_9d58c1cd/namespace_9d58c1cd
// Params 0, eflags: 0x1 linked
// Checksum 0x385919e, Offset: 0x948
// Size: 0x360
function function_3fcb1e5e() {
    var_8171dd3a = randomint(10);
    var_8dfff656 = randomint(10);
    var_44e1e41b = randomint(10);
    while (!namespace_1063645::function_aac7105a(var_8171dd3a, var_8dfff656, var_44e1e41b)) {
        var_8171dd3a = randomint(10);
        var_8dfff656 = randomint(10);
        var_44e1e41b = randomint(10);
    }
    var_679f0ee5 = struct::get_array("nixie_tubes", "script_noteworthy");
    foreach (var_18b64c03 in var_679f0ee5) {
        switch (var_18b64c03.script_string) {
        case #"nixie_tube_trigger_1":
            var_18b64c03.var_825e7054 = var_8171dd3a;
            var_18b64c03.str_hint_string = #"hash_0";
            var_f6cdf98c = "n_c_w_p_01";
            var_49d93843 = #"hash_30683ab79a855d68";
            str_clientfield_name = "p_w_o_num_01";
            break;
        case #"nixie_tube_trigger_2":
            var_18b64c03.var_825e7054 = var_8dfff656;
            var_18b64c03.str_hint_string = #"hash_0";
            var_f6cdf98c = "n_c_w_p_02";
            var_49d93843 = #"hash_30683db79a856281";
            str_clientfield_name = "p_w_o_num_02";
            break;
        case #"nixie_tube_trigger_3":
            var_18b64c03.var_825e7054 = var_44e1e41b;
            var_18b64c03.str_hint_string = #"hash_0";
            var_f6cdf98c = "n_c_w_p_03";
            var_49d93843 = #"hash_30683cb79a8560ce";
            str_clientfield_name = "p_w_o_num_03";
            break;
        }
        s_paper = struct::get(var_f6cdf98c);
        s_paper.script_int = var_18b64c03.var_825e7054;
        if (s_paper.script_int == 0) {
            level clientfield::set(str_clientfield_name, 10);
        } else {
            level clientfield::set(str_clientfield_name, s_paper.script_int);
        }
    }
}

// Namespace namespace_9d58c1cd/namespace_9d58c1cd
// Params 0, eflags: 0x1 linked
// Checksum 0x81e0c1ef, Offset: 0xcb0
// Size: 0xac
function function_1c5d2f2() {
    level flag::wait_till(#"hash_ed90925c898d1b0");
    var_83aecc80 = struct::get("nixie_tube_2");
    playsoundatposition(#"hash_59db059ae5cc54c2", var_83aecc80.origin);
    var_e0ed1d92 = struct::get("citadel_elevator");
    var_e0ed1d92 thread function_6b107487();
}

// Namespace namespace_9d58c1cd/namespace_9d58c1cd
// Params 0, eflags: 0x1 linked
// Checksum 0x68614eec, Offset: 0xd68
// Size: 0x184
function setup_docks_crane() {
    level flag::wait_till("start_zombie_round_logic");
    var_217fca51 = struct::get("docks_crane");
    scene::add_scene_func(var_217fca51.scriptbundlename, &function_32fbad12, "Shot 2");
    var_4e8f9a1c = var_217fca51.scene_ents[#"skeleton_arm"];
    var_4e8f9a1c ghost();
    var_965869c9 = var_217fca51.scene_ents[#"crane"];
    var_965869c9 hidepart("jnt_skeleton", "p8_fxanim_zm_esc_crane_mod", 1);
    var_965869c9.targetname = "docks_crane_link";
    level.var_965869c9 = var_965869c9;
    level flag::wait_till(#"hash_dd62a8822ea4a38");
    var_965869c9 showpart("jnt_skeleton", "p8_fxanim_zm_esc_crane_mod", 1);
    var_4e8f9a1c show();
}

// Namespace namespace_9d58c1cd/namespace_9d58c1cd
// Params 0, eflags: 0x1 linked
// Checksum 0xf8fcf3aa, Offset: 0xef8
// Size: 0x2ea
function crane_shock_box() {
    var_da5e0bea = getent("crane_shock_box", "script_string");
    var_217fca51 = struct::get("docks_crane");
    while (1) {
        var_da5e0bea waittill(#"hash_7e1d78666f0be68b");
        if (level flag::get(#"hash_2444d210a1dd0dd")) {
            continue;
        }
        level flag::set(#"hash_2444d210a1dd0dd");
        wait(1.6);
        var_217fca51 thread scene::play("Shot 2");
        n_anim_length = getanimlength(#"hash_3fbc33140c093c0d");
        n_anim_length = n_anim_length - 3.9;
        wait(n_anim_length);
        level flag::set(#"hash_6f71660057a5952f");
        if (!level flag::get(#"hash_66f358c0066d77d8") && level flag::get(#"hash_dd62a8822ea4a38")) {
            foreach (e_player in level.activeplayers) {
                if (!isdefined(e_player)) {
                    continue;
                }
                e_player thread function_1c670b79(var_217fca51);
            }
        }
        wait(10);
        level notify(#"hash_2fd493c2a926e006");
        level flag::clear(#"hash_6f71660057a5952f");
        var_da5e0bea.var_8dfa1155 = 1;
        var_da5e0bea notify(#"turn_off");
        var_217fca51 thread scene::play("Shot 1");
        n_anim_length = getanimlength(#"hash_923a7a2394d952d");
        wait(n_anim_length);
        level flag::clear(#"hash_2444d210a1dd0dd");
        var_da5e0bea.var_8dfa1155 = undefined;
    }
}

// Namespace namespace_9d58c1cd/namespace_9d58c1cd
// Params 1, eflags: 0x1 linked
// Checksum 0xadac2911, Offset: 0x11f0
// Size: 0x132
function function_1c670b79(var_217fca51) {
    self endon(#"death", #"disconnect");
    level endon(#"hash_2fd493c2a926e006", #"hash_66f358c0066d77d8");
    while (1) {
        s_result = undefined;
        s_result = self waittill(#"throwing_tomahawk");
        e_tomahawk = s_result.e_grenade;
        if (!isdefined(e_tomahawk)) {
            return;
        }
        while (isdefined(e_tomahawk) && !level flag::get(#"hash_66f358c0066d77d8")) {
            var_47c6201 = getent("cr_sk_hit", "targetname");
            if (e_tomahawk istouching(var_47c6201)) {
                level thread function_6ff33a91(var_217fca51);
            }
            waitframe(1);
        }
    }
}

// Namespace namespace_9d58c1cd/namespace_9d58c1cd
// Params 1, eflags: 0x1 linked
// Checksum 0xaa53e3b2, Offset: 0x1330
// Size: 0xf4
function function_6ff33a91(var_217fca51) {
    level notify(#"hash_4302325b2fe2d5d8");
    level endon(#"hash_4302325b2fe2d5d8");
    level flag::set(#"hash_66f358c0066d77d8");
    var_217fca51 thread scene::play("Shot 3");
    n_anim_length = getanimlength(#"hash_2bf732b76b5383ba");
    wait(n_anim_length);
    var_6b6eb535 = var_217fca51.scene_ents[#"skeleton_arm"];
    var_6b6eb535 hide();
    function_ac52c6f1();
}

// Namespace namespace_9d58c1cd/namespace_9d58c1cd
// Params 0, eflags: 0x5 linked
// Checksum 0x5c9f8672, Offset: 0x1430
// Size: 0x12c
function private function_ac52c6f1() {
    foreach (e_player in level.activeplayers) {
        e_player clientfield::set_to_player("sp_ar_pi", 1);
    }
    var_d1ce6de8 = struct::get("t_sp_pi");
    var_d1ce6de8.s_unitrigger_stub = var_d1ce6de8 zm_unitrigger::create(&function_88cbb4b3, var_d1ce6de8.radius, &function_c5e0a9a4);
    zm_unitrigger::unitrigger_force_per_player_triggers(var_d1ce6de8.s_unitrigger_stub, 1);
    callback::on_spawned(&function_b6cda2d6);
}

// Namespace namespace_9d58c1cd/namespace_9d58c1cd
// Params 1, eflags: 0x1 linked
// Checksum 0x3ba500ee, Offset: 0x1568
// Size: 0x192
function function_88cbb4b3(player) {
    if (player hasweapon(getweapon(#"spoon_alcatraz")) || player hasweapon(getweapon(#"spork_alcatraz")) || player flag::get(#"hash_6b33efdeedf241f") || isdefined(player.var_6b910e38) && player.var_6b910e38) {
        self sethintstring("");
        return 0;
    } else if (zm_loadout::is_hero_weapon(player getcurrentweapon())) {
        self sethintstring("");
        return 0;
    } else {
        if (function_8b1a219a()) {
            self sethintstring(#"hash_22b0dee6b3f9865b");
        } else {
            self sethintstring(#"hash_51ad91916b4b0de5");
        }
        return 1;
    }
}

// Namespace namespace_9d58c1cd/namespace_9d58c1cd
// Params 0, eflags: 0x1 linked
// Checksum 0xac2c55f, Offset: 0x1708
// Size: 0x156
function function_c5e0a9a4() {
    while (1) {
        s_result = undefined;
        s_result = self waittill(#"trigger");
        e_player = s_result.activator;
        if (!e_player hasweapon(getweapon(#"spoon_alcatraz")) && !e_player hasweapon(getweapon(#"spork_alcatraz"))) {
            if (!isdefined(e_player.var_1c4683c4)) {
                e_player.var_1c4683c4 = e_player.slot_weapons[#"melee_weapon"];
            }
            e_player clientfield::set_to_player("sp_ar_pi", 0);
            e_player thread function_eebe4e13();
            level flag::set(#"spoon_quest_completed");
        }
        waitframe(1);
    }
}

// Namespace namespace_9d58c1cd/namespace_9d58c1cd
// Params 0, eflags: 0x5 linked
// Checksum 0x38edcb82, Offset: 0x1868
// Size: 0x4e
function private function_eebe4e13() {
    self endon(#"disconnect");
    self.var_6b910e38 = 1;
    self zm_melee_weapon::award_melee_weapon(#"spoon_alcatraz");
    self.var_6b910e38 = undefined;
}

// Namespace namespace_9d58c1cd/namespace_9d58c1cd
// Params 0, eflags: 0x1 linked
// Checksum 0x989d498a, Offset: 0x18c0
// Size: 0xe4
function function_b6cda2d6() {
    if (!self hasweapon(getweapon(#"spoon_alcatraz")) && !self hasweapon(getweapon(#"spork_alcatraz")) && level flag::get(#"hash_66f358c0066d77d8") && !self flag::get(#"hash_6b33efdeedf241f")) {
        self clientfield::set_to_player("sp_ar_pi", 1);
    }
}

// Namespace namespace_9d58c1cd/namespace_9d58c1cd
// Params 1, eflags: 0x1 linked
// Checksum 0xe1ce050b, Offset: 0x19b0
// Size: 0x64e
function function_32fbad12(a_ents) {
    if (level flag::get(#"hash_dd62a8822ea4a38") && !level flag::get(#"hash_66f358c0066d77d8")) {
        level.var_965869c9 showpart("jnt_skeleton", "p8_fxanim_zm_esc_crane_mod", 1);
        return;
    }
    var_965869c9 = a_ents[#"crane"];
    level.var_965869c9 hidepart("jnt_skeleton", "p8_fxanim_zm_esc_crane_mod", 1);
    if (isdefined(level.var_a29d2d8) && level.var_a29d2d8 hasweapon(getweapon(#"tomahawk_t8_upgraded")) && level.var_a29d2d8 flag::get(#"hash_d41f651bb868608") && !level.var_a29d2d8 flag::get(#"hash_465b23ced2029d95")) {
        var_d147b93a = #"p8_zm_esc_rock_small_blue";
        var_3f2fddcb = 1.2;
        v_origin = var_965869c9 gettagorigin("tag_net_3") + (-15, -10, -15);
        v_angles = (324, 135, 72);
    } else {
        n_chance = randomint(100);
        if ((n_chance < 4 || isdefined(level.var_38e38e53) && level.var_38e38e53) && !isdefined(level.var_5c14fe03) && zm_custom::function_901b751c(#"zmpowerupsactive")) {
            var_9c61673a = array("double_points", "full_ammo", "insta_kill");
            if (!zm_custom::function_901b751c("zmPowerupDouble")) {
                arrayremovevalue(var_9c61673a, "double_points");
            }
            if (!zm_custom::function_901b751c("zmPowerupMaxAmmo")) {
                arrayremovevalue(var_9c61673a, "full_ammo");
            }
            if (!zm_custom::function_901b751c("zmPowerupInstakill")) {
                arrayremovevalue(var_9c61673a, "insta_kill");
            }
            if (var_9c61673a.size > 0) {
                level.var_38e38e53 = undefined;
                var_fdc7d6b5 = var_9c61673a[randomint(var_9c61673a.size)];
                v_origin = var_965869c9 gettagorigin("tag_net_3");
                level thread function_6098c5c(var_fdc7d6b5, v_origin, var_965869c9);
            }
        } else if (n_chance >= 4 && n_chance < 20 || isdefined(level.var_18d2e3aa) && level.var_18d2e3aa) {
            level.var_18d2e3aa = undefined;
            var_d147b93a = #"p8_zm_vending_three_gun_sign";
            v_origin = var_965869c9 gettagorigin("tag_net_3") + (-15, -10, -13);
            v_angles = (324, 135, 72);
        } else if (n_chance >= 70 || isdefined(level.var_64f95ac4) && level.var_64f95ac4) {
            level.var_64f95ac4 = undefined;
            var_d147b93a = #"p7_tire_rubber_worn_wet";
            if (level flag::get(#"hash_dd62a8822ea4a38")) {
                v_origin = var_965869c9 gettagorigin("tag_net_3") + vectorscale((1, 0, -1), 10);
                v_angles = vectorscale((1, 0, 0), 324);
            } else {
                v_origin = var_965869c9 gettagorigin("tag_net_3") + (0, -5, -12);
                v_angles = vectorscale((1, 0, 0), 300);
            }
        }
    }
    if (isdefined(var_d147b93a)) {
        var_30e2502e = util::spawn_model(var_d147b93a, v_origin, v_angles);
        if (isdefined(var_3f2fddcb)) {
            level.var_ca0f81c1 = var_30e2502e;
            var_30e2502e setscale(var_3f2fddcb);
            var_3f2fddcb = undefined;
        }
        var_30e2502e linkto(var_965869c9, "tag_net_3");
        level flag::wait_till_clear(#"hash_2444d210a1dd0dd");
        if (isdefined(var_30e2502e)) {
            var_30e2502e delete();
        }
        level.var_ca0f81c1 = undefined;
    }
}

// Namespace namespace_9d58c1cd/namespace_9d58c1cd
// Params 1, eflags: 0x0
// Checksum 0x164a7ec7, Offset: 0x2008
// Size: 0x254
function function_4afd150e(a_ents) {
    if (level flag::get(#"hash_dd62a8822ea4a38") && !level flag::get(#"hash_66f358c0066d77d8")) {
        return;
    }
    var_ef78f209 = randomint(100);
    var_965869c9 = a_ents[#"crane"];
    if (var_ef78f209 < 34) {
        var_d147b93a = #"p7_tire_rubber_worn_wet";
        if (level flag::get(#"hash_dd62a8822ea4a38")) {
            v_origin = var_965869c9 gettagorigin("tag_net_3") + vectorscale((1, 0, -1), 10);
            v_angles = vectorscale((1, 0, 0), 324);
        } else {
            v_origin = var_965869c9 gettagorigin("tag_net_3") + (0, -5, -12);
            v_angles = vectorscale((1, 0, 0), 300);
        }
    } else if (var_ef78f209 > 67) {
        var_d147b93a = #"p8_zm_vending_three_gun_sign";
        v_origin = var_965869c9 gettagorigin("tag_net_3") + (-15, -10, -15);
        v_angles = (324, 135, 72);
    }
    if (isdefined(var_d147b93a)) {
        var_30e2502e = util::spawn_model(var_d147b93a, v_origin, v_angles);
        var_30e2502e linkto(var_965869c9, "tag_net_3");
        level flag::wait_till_clear(#"hash_2444d210a1dd0dd");
        var_30e2502e delete();
    }
}

// Namespace namespace_9d58c1cd/namespace_9d58c1cd
// Params 3, eflags: 0x1 linked
// Checksum 0xa74a608d, Offset: 0x2268
// Size: 0x242
function function_6098c5c(var_fdc7d6b5, v_origin, var_965869c9) {
    str_model_name = level.zombie_powerups[var_fdc7d6b5].model_name;
    level.var_5c14fe03 = util::spawn_model(str_model_name, v_origin);
    level.var_5c14fe03.str_powerup = var_fdc7d6b5;
    level.var_5c14fe03 clientfield::set("powerup_fx", 1);
    level.var_5c14fe03 linkto(var_965869c9, "tag_net_3");
    level.var_5c14fe03 thread pebble::function_468c20be();
    level.var_5c14fe03 thread function_d0bb3c35();
    foreach (e_player in level.activeplayers) {
        e_player thread function_5753ae89();
    }
    callback::on_connect(&function_5753ae89);
    if (!isdefined(level.a_tomahawk_pickup_funcs)) {
        level.a_tomahawk_pickup_funcs = [];
    } else if (!isarray(level.a_tomahawk_pickup_funcs)) {
        level.a_tomahawk_pickup_funcs = array(level.a_tomahawk_pickup_funcs);
    }
    if (!isinarray(level.a_tomahawk_pickup_funcs, &function_48e7a1d7)) {
        level.a_tomahawk_pickup_funcs[level.a_tomahawk_pickup_funcs.size] = &function_48e7a1d7;
    }
}

// Namespace namespace_9d58c1cd/namespace_9d58c1cd
// Params 0, eflags: 0x1 linked
// Checksum 0xf7e1c865, Offset: 0x24b8
// Size: 0xfc
function function_d0bb3c35() {
    self endon(#"death", #"hash_4ecfa36be208fd5f");
    n_wait_time = 25;
    if (isdefined(level.var_977f68ea)) {
        n_time = [[ level.var_977f68ea ]](self);
        if (n_time == 0) {
            return;
        }
        n_wait_time = n_time;
    }
    if (bgb::is_team_enabled(#"zm_bgb_temporal_gift")) {
        n_wait_time = n_wait_time + 30;
    }
    wait(n_wait_time);
    self zm_powerups::hide_and_show(&zm_powerups::function_e3f30b, &zm_powerups::powerup_show);
    self delete();
}

// Namespace namespace_9d58c1cd/namespace_9d58c1cd
// Params 0, eflags: 0x1 linked
// Checksum 0x9653ac27, Offset: 0x25c0
// Size: 0x12e
function function_5753ae89() {
    self endon(#"disconnect");
    level.var_5c14fe03 endoncallback(&function_2084efc3, #"death", #"hash_4ecfa36be208fd5f");
    while (1) {
        s_result = undefined;
        s_result = self waittill(#"throwing_tomahawk");
        e_tomahawk = s_result.e_grenade;
        while (isdefined(e_tomahawk)) {
            if (distancesquared(e_tomahawk.origin, level.var_5c14fe03.origin) < 10000) {
                level.var_5c14fe03.var_3d3748c4 = 1;
                level.var_5c14fe03.var_d86e9c27 = e_tomahawk.owner;
                level.var_5c14fe03 notify(#"hash_4ecfa36be208fd5f");
                break;
            }
            waitframe(1);
        }
    }
}

// Namespace namespace_9d58c1cd/namespace_9d58c1cd
// Params 1, eflags: 0x1 linked
// Checksum 0x2d5e1ac7, Offset: 0x26f8
// Size: 0x2c
function function_2084efc3(str_notify) {
    callback::remove_on_connect(&function_5753ae89);
}

// Namespace namespace_9d58c1cd/namespace_9d58c1cd
// Params 2, eflags: 0x1 linked
// Checksum 0x2541ab14, Offset: 0x2730
// Size: 0x18a
function function_48e7a1d7(e_grenade, n_grenade_charge_power) {
    self endon(#"disconnect");
    if (!isdefined(level.var_5c14fe03)) {
        return 0;
    }
    if (isdefined(level.var_5c14fe03.var_3d3748c4) && level.var_5c14fe03.var_3d3748c4 && level.var_5c14fe03.var_d86e9c27 == self) {
        level.var_5c14fe03 ghost();
        var_6e6ec518 = zm_weap_tomahawk::tomahawk_spawn(e_grenade.origin);
        var_6e6ec518.n_grenade_charge_power = n_grenade_charge_power;
        var_9c0bf2db = util::spawn_model(level.var_5c14fe03.model, e_grenade.origin);
        var_9c0bf2db.str_powerup = level.var_5c14fe03.str_powerup;
        var_9c0bf2db linkto(var_6e6ec518);
        self thread zm_weap_tomahawk::tomahawk_return_player(var_6e6ec518, undefined, 800);
        self thread function_be995f48(var_6e6ec518, var_9c0bf2db);
        return 1;
    } else {
        return 0;
    }
}

// Namespace namespace_9d58c1cd/namespace_9d58c1cd
// Params 2, eflags: 0x1 linked
// Checksum 0x6c5ae905, Offset: 0x28c8
// Size: 0xc4
function function_be995f48(var_6e6ec518, var_9c0bf2db) {
    self endon(#"disconnect");
    while (isdefined(var_6e6ec518)) {
        waitframe(1);
    }
    str_powerup = var_9c0bf2db.str_powerup;
    var_9c0bf2db delete();
    level.var_5c14fe03 delete();
    arrayremovevalue(level.a_tomahawk_pickup_funcs, &function_48e7a1d7);
    zm_powerups::specific_powerup_drop(str_powerup, self.origin);
}

// Namespace namespace_9d58c1cd/namespace_9d58c1cd
// Params 0, eflags: 0x0
// Checksum 0x9a367df0, Offset: 0x2998
// Size: 0xfc
function function_a860e46e() {
    /#
        if (!getdvarint(#"zm_debug_ee", 0)) {
            return;
        }
        zm_devgui::add_custom_devgui_callback(&function_97be15e3);
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
    #/
}

// Namespace namespace_9d58c1cd/namespace_9d58c1cd
// Params 1, eflags: 0x0
// Checksum 0x1f1c3425, Offset: 0x2aa0
// Size: 0x252
function function_97be15e3(cmd) {
    /#
        switch (cmd) {
        case #"hash_42dce9e99181c0bc":
            function_7101d54f();
            break;
        case #"hash_22d60bf8b1f181a7":
            level flag::set(#"hash_ed90925c898d1b0");
            break;
        case #"hash_32e9365d47a4194":
            level flag::set(#"hash_ed90925c898d1b0");
            level flag::set(#"hash_66f358c0066d77d8");
            function_ac52c6f1();
            break;
        case #"hash_6959afd9d36f38b8":
            if (zm_utility::is_ee_enabled()) {
                var_4f5b63ea = struct::get("<unknown string>");
                var_83aecc80 = struct::get("<unknown string>");
                var_31a8a875 = struct::get("<unknown string>");
                var_1390c563 = var_4f5b63ea.var_825e7054;
                var_9393456a = var_83aecc80.var_825e7054;
                var_bdd399ea = var_31a8a875.var_825e7054;
                iprintln("<unknown string>" + var_1390c563 + var_9393456a + var_bdd399ea);
            }
            break;
        case #"hash_6f5ba9c8e47bde8b":
            level.var_38e38e53 = 1;
            break;
        case #"hash_7ed9eae4551e92d3":
            level.var_18d2e3aa = 1;
            break;
        case #"hash_6a0c48ca2516a0a3":
            level.var_64f95ac4 = 1;
            break;
        }
    #/
}

// Namespace namespace_9d58c1cd/namespace_9d58c1cd
// Params 0, eflags: 0x0
// Checksum 0xe87f8261, Offset: 0x2d00
// Size: 0xd4
function function_7101d54f() {
    /#
        w_component = zm_crafting::get_component(#"hash_1e5657f6a6f09389");
        foreach (e_player in level.activeplayers) {
            e_player zm_crafting::function_3e29352d(w_component);
        }
        level flag::set(#"hash_7039457b1cc827de");
    #/
}

