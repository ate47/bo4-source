#using scripts\zm\zm_hms_util.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_item_pickup.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\core_common\status_effects\status_effect_util.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\flagsys_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_cc08081f;

// Namespace namespace_cc08081f/namespace_cc08081f
// Params 0, eflags: 0x1 linked
// Checksum 0xec44b9a, Offset: 0x3b0
// Size: 0xac
function init() {
    level flag::init(#"hash_398e4b1e72edb4ee");
    if (zm_utility::is_ee_enabled()) {
        level thread function_f0e98e5f();
        level thread function_ac06ab3a();
        level thread function_9e497c58();
        level thread function_f339b159();
        level thread function_d38b59bb();
    }
}

// Namespace namespace_cc08081f/namespace_cc08081f
// Params 0, eflags: 0x1 linked
// Checksum 0x5fcb4735, Offset: 0x468
// Size: 0x1ec
function function_f339b159() {
    level.var_389d1b12 = 0;
    level.var_5a599dbf = struct::get_array("punch_card_trigger", "targetname");
    foreach (s_punch_card in level.var_5a599dbf) {
        s_punch_card.is_collected = 0;
        s_punch_card.var_453ce50f = getent(s_punch_card.target, "targetname");
        s_unitrigger = s_punch_card zm_unitrigger::create("", 64);
        s_punch_card thread function_c7d4845();
    }
    level.var_b53764f7 = 0;
    level.var_af224340 = getent("punch_card_screen", "targetname");
    level.var_af224340 hide();
    level thread function_19daa1b1();
    level flag::init(#"hash_7b2be1fafb5f35c7");
    level.var_da4b53f8 = getent("punch_card_anim", "targetname");
    level.var_da4b53f8 hide();
}

// Namespace namespace_cc08081f/namespace_cc08081f
// Params 0, eflags: 0x1 linked
// Checksum 0x1931d415, Offset: 0x660
// Size: 0x104
function function_c7d4845() {
    while (!self.is_collected) {
        s_waitresult = self waittill(#"trigger_activated");
        e_who = s_waitresult.e_who;
        e_who playsound("evt_punch_card_pickup");
        if (math::cointoss()) {
            e_who thread zm_audio::create_and_play_dialog(#"component_pickup", #"generic");
        }
        level.var_389d1b12 += 1;
        self.is_collected = 1;
        self.var_453ce50f delete();
    }
    zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
}

// Namespace namespace_cc08081f/namespace_cc08081f
// Params 0, eflags: 0x1 linked
// Checksum 0xaba2be94, Offset: 0x770
// Size: 0x120
function function_445e3d3d() {
    while (true) {
        s_waitresult = self waittill(#"trigger_activated");
        e_who = s_waitresult.e_who;
        if (level.var_b53764f7 < level.var_389d1b12) {
            level.var_da4b53f8 function_7a70f281();
            wait 3;
            level.var_b53764f7 += 1;
            /#
                iprintlnbold("<dev string:x38>" + level.var_b53764f7);
            #/
            zm_hms_util::function_e308175e(#"hash_6b6fadebd260d209" + level.var_b53764f7 + "_sfx", self.origin);
            /#
                iprintlnbold("<dev string:x4e>");
            #/
        }
    }
}

// Namespace namespace_cc08081f/namespace_cc08081f
// Params 0, eflags: 0x1 linked
// Checksum 0x7129eecb, Offset: 0x898
// Size: 0xa4
function function_19daa1b1() {
    level flag::wait_till("power_on1");
    level.var_af224340 show();
    var_acb5313f = struct::get("punch_card_computer_trigger", "targetname");
    s_unitrigger = var_acb5313f zm_unitrigger::create("", 64);
    var_acb5313f thread function_445e3d3d();
}

// Namespace namespace_cc08081f/namespace_cc08081f
// Params 0, eflags: 0x1 linked
// Checksum 0x5cf27c20, Offset: 0x948
// Size: 0x144
function function_7a70f281() {
    self show();
    v_starting_origin = self.origin;
    var_5287d229 = self.angles;
    v_forward = anglestoforward(self.angles);
    wait 0.5;
    self playsound("evt_punch_card_insert");
    self moveto(self.origin + v_forward * -14, 3);
    wait 1;
    level flag::set(#"hash_7b2be1fafb5f35c7");
    self waittill(#"movedone");
    self hide();
    self.origin = v_starting_origin;
    self.angles = var_5287d229;
    level flag::clear(#"hash_7b2be1fafb5f35c7");
}

// Namespace namespace_cc08081f/namespace_cc08081f
// Params 0, eflags: 0x1 linked
// Checksum 0x4b918c1c, Offset: 0xa98
// Size: 0x26c
function function_9e497c58() {
    var_96fdae0e = struct::get_array("hail_base", "targetname");
    level.var_bcc5a3a8 = [];
    foreach (var_f711229a in var_96fdae0e) {
        var_f711229a.var_8dd6242b = randomintrange(0, 5);
        var_f711229a.var_8ace5ace = randomintrange(0, 5);
        while (var_f711229a.var_8dd6242b == var_f711229a.var_8ace5ace) {
            var_f711229a.var_8ace5ace = randomintrange(0, 5);
        }
        var_f711229a.is_active = 0;
        var_f711229a.is_complete = 0;
        var_f711229a.scene = struct::get(var_f711229a.target, "targetname");
        var_f711229a.var_808cd5ad = var_f711229a.var_8ace5ace;
        var_f711229a.scene scene::play("idle_off_" + var_f711229a.var_8ace5ace);
        var_f711229a.scene flagsys::wait_till(#"scene_ents_ready");
        var_f711229a.scene_entity = var_f711229a.scene.scene_ents[#"prop 1"];
        var_f711229a.scene.var_eb397f67 = var_f711229a.scene_entity gettagorigin("tag_tuner_knob");
        level.var_96fdae0e[var_f711229a.script_int] = var_f711229a;
    }
    level function_a7f8aee6();
}

// Namespace namespace_cc08081f/namespace_cc08081f
// Params 0, eflags: 0x1 linked
// Checksum 0xb8991d2e, Offset: 0xd10
// Size: 0x146
function function_a7f8aee6() {
    for (i = 0; i < level.var_96fdae0e.size; i++) {
        level.var_96fdae0e[i].is_active = 1;
        level.var_96fdae0e[i].scene scene::play("idle_on_" + string(level.var_96fdae0e[i].var_8ace5ace));
        s_unitrigger = level.var_96fdae0e[i] zm_unitrigger::create("", 96);
        level.var_96fdae0e[i] thread function_22393009();
        while (!level.var_96fdae0e[i].is_complete) {
            wait 1;
        }
        /#
            iprintlnbold("<dev string:x6e>" + i);
        #/
    }
}

// Namespace namespace_cc08081f/namespace_cc08081f
// Params 0, eflags: 0x1 linked
// Checksum 0xaf66e64b, Offset: 0xe60
// Size: 0x20c
function function_22393009() {
    while (self.is_active && !self.is_complete) {
        var_2dc7965c = self.var_8ace5ace;
        s_waitresult = self waittill(#"trigger_activated");
        e_who = s_waitresult.e_who;
        b_using = 1;
        var_ee23f17d = 1;
        if (self.var_8ace5ace == 5) {
            var_ee23f17d = 0;
        }
        var_5f67ea2f = 0;
        if (e_who function_626095c1(self.scene)) {
            if (self.var_8ace5ace > 0) {
                self.var_8ace5ace -= 1;
                self.scene thread scene::play("backward_to_" + string(self.var_8ace5ace));
            }
        } else if (self.var_8ace5ace < 5) {
            self.var_8ace5ace += 1;
            self.scene thread scene::play("forward_to_" + string(self.var_8ace5ace));
        }
        self.scene.var_a64d570 = self.var_8ace5ace;
        if (self.var_8ace5ace === self.var_8dd6242b) {
            self.is_complete = 1;
        }
    }
    zm_hms_util::function_e308175e(#"hash_418aee32f9446941" + self.script_int + 1 + "_sfx", self.origin);
}

// Namespace namespace_cc08081f/namespace_cc08081f
// Params 1, eflags: 0x1 linked
// Checksum 0xdccec05b, Offset: 0x1078
// Size: 0x126
function function_626095c1(object) {
    v_origin = object.origin;
    if (isdefined(object.var_eb397f67)) {
        v_origin = object.var_eb397f67;
    }
    v_delta = vectornormalize(self geteye() - v_origin);
    v_view = anglestoforward(self getplayerangles());
    v_cross = vectorcross(v_view, v_delta);
    var_35b81369 = vectordot(v_cross, anglestoup(object.angles));
    if (var_35b81369 >= 0) {
        return 1;
    }
    return 0;
}

// Namespace namespace_cc08081f/namespace_cc08081f
// Params 0, eflags: 0x1 linked
// Checksum 0xadd96b09, Offset: 0x11a8
// Size: 0x1f0
function function_f0e98e5f() {
    level.var_65d94f2 = struct::get_array(#"hash_508091eba85fdf0a");
    foreach (var_9b5d57b6 in level.var_65d94f2) {
        var_9b5d57b6 function_488e39dc();
    }
    level.var_cb8f67c9 = struct::get_array(#"hash_550885c44d3cde5e");
    foreach (var_9b5d57b6 in level.var_cb8f67c9) {
        var_9b5d57b6 function_4306cc3f();
    }
    level.var_6db2e9b7 = struct::get_array(#"hash_2a97322faea2f000");
    foreach (var_506f913 in level.var_6db2e9b7) {
        var_506f913 function_462cd7c0();
    }
}

// Namespace namespace_cc08081f/namespace_cc08081f
// Params 0, eflags: 0x1 linked
// Checksum 0x80967388, Offset: 0x13a0
// Size: 0x1c
function function_4306cc3f() {
    self thread function_938d4207();
}

// Namespace namespace_cc08081f/namespace_cc08081f
// Params 0, eflags: 0x1 linked
// Checksum 0xe47e25a1, Offset: 0x13c8
// Size: 0x64
function function_488e39dc() {
    self.unitrigger_stub = self zm_unitrigger::create("", (32, 32, 32));
    self thread function_6ef57d1f();
    zm_unitrigger::function_89380dda(self.unitrigger_stub, 1);
}

// Namespace namespace_cc08081f/namespace_cc08081f
// Params 0, eflags: 0x1 linked
// Checksum 0x791cebd7, Offset: 0x1438
// Size: 0xac
function function_462cd7c0() {
    self.device = getent(self.target, "targetname");
    self.unitrigger_stub = self zm_unitrigger::create("", (32, 32, 32));
    self thread function_b4dbbdd1();
    zm_unitrigger::function_89380dda(self.unitrigger_stub, 1);
    self.device function_74174ce1("screen_off");
}

// Namespace namespace_cc08081f/namespace_cc08081f
// Params 0, eflags: 0x1 linked
// Checksum 0x3054779b, Offset: 0x14f0
// Size: 0xc4
function function_938d4207() {
    self endon(#"death");
    level endon(#"insanity_mode_triggered");
    pixbeginevent(#"hash_12312acd8fd62f9e");
    e_trigger = getent(self.target, "targetname");
    s_result = e_trigger waittill(#"damage");
    self thread function_8c80503();
    pixendevent();
}

// Namespace namespace_cc08081f/namespace_cc08081f
// Params 0, eflags: 0x1 linked
// Checksum 0xe730f632, Offset: 0x15c0
// Size: 0x6c
function function_6ef57d1f() {
    self endon(#"death");
    level endon(#"insanity_mode_triggered");
    s_notify = self waittill(#"trigger_activated");
    self.stub.related_parent thread function_8c80503();
}

// Namespace namespace_cc08081f/namespace_cc08081f
// Params 0, eflags: 0x1 linked
// Checksum 0x3ac83375, Offset: 0x1638
// Size: 0x84
function function_b4dbbdd1() {
    self endon(#"death");
    level endon(#"insanity_mode_triggered");
    s_notify = self waittill(#"trigger_activated");
    self thread uin_kls_counteruavdefeated();
    self.device function_74174ce1("screen_on");
}

// Namespace namespace_cc08081f/namespace_cc08081f
// Params 0, eflags: 0x1 linked
// Checksum 0x9b69adf9, Offset: 0x16c8
// Size: 0xbe
function function_8c80503() {
    if (isdefined(self.unitrigger_stub)) {
        zm_unitrigger::unregister_unitrigger(self.unitrigger_stub);
    }
    self thread function_d4c6dc0d();
    wait 2;
    zm_hms_util::function_e308175e(#"hash_2d0c86fd62ab3853" + self.var_614bfc5c + 1 + "_sfx", self.origin);
    /#
        iprintlnbold("<dev string:x87>" + self.var_614bfc5c);
    #/
    self.var_b21e0263 = 0;
}

// Namespace namespace_cc08081f/namespace_cc08081f
// Params 0, eflags: 0x1 linked
// Checksum 0x28dcd7bb, Offset: 0x1790
// Size: 0x154
function function_d4c6dc0d() {
    self.var_b21e0263 = 1;
    var_df4e73a7 = getentarray(self.target2, "targetname");
    var_df4e73a7[0] playsound(#"hash_3cca3c060dacc7de");
    var_df4e73a7[0] playloopsound(#"hash_14cf26f9ee5a9962");
    while (self.var_b21e0263 && var_df4e73a7.size > 0) {
        var_df4e73a7[0] rotatepitch(45, 1);
        wait 0.1;
        var_df4e73a7[1] rotatepitch(60, 1);
        wait 0.9;
    }
    var_df4e73a7[0] stoploopsound(0.5);
    playsoundatposition(#"hash_1f7edbf8f3a60766", self.origin);
}

// Namespace namespace_cc08081f/namespace_cc08081f
// Params 0, eflags: 0x1 linked
// Checksum 0xe6f1b50d, Offset: 0x18f0
// Size: 0x6c
function uin_kls_counteruavdefeated() {
    zm_hms_util::function_e308175e(#"hash_d065c4529d709fe" + self.var_614bfc5c + 1 + "_sfx", self.origin);
    /#
        iprintlnbold("<dev string:xa1>" + self.var_614bfc5c);
    #/
}

// Namespace namespace_cc08081f/namespace_cc08081f
// Params 0, eflags: 0x1 linked
// Checksum 0x30b89bd5, Offset: 0x1968
// Size: 0x3dc
function function_ac06ab3a() {
    level.var_ea514bc4 = [];
    var_1c8e90b4 = array(#"hash_6fce75e5c4fe6210");
    var_ab6a16ff = array(#"hash_172aa60779a37741");
    var_e6c1fe70 = array(#"hash_511e79ef416368e2");
    var_51ba7b4a = array(#"hash_1a1854072d6b2453");
    var_68e586cf = array(#"hash_39204e32adbe7694");
    level.var_ea514bc4[0] = {#var_8a821e1e:0, #in_inventory:0, #vo_line:var_1c8e90b4};
    level.var_ea514bc4[1] = {#var_8a821e1e:1, #in_inventory:0, #vo_line:var_ab6a16ff};
    level.var_ea514bc4[2] = {#var_8a821e1e:2, #in_inventory:0, #vo_line:var_e6c1fe70, #var_46db68fd:1};
    level.var_ea514bc4[3] = {#var_8a821e1e:3, #in_inventory:0, #vo_line:var_51ba7b4a};
    level.var_ea514bc4[4] = {#var_8a821e1e:4, #in_inventory:0, #vo_line:var_68e586cf};
    level.var_804a56e3 = 0;
    level.var_ba07f1de = zm_hms_util::function_bffcedde("white_audio_reel", "targetname", "script_int");
    foreach (var_2e2b46e8 in level.var_ba07f1de) {
        var_2e2b46e8 zm_item_pickup::item_pickup_init(&function_1792ae3, 1);
    }
    level.var_e046b238 = struct::get(#"hash_5201d44a6f57e32a");
    level.var_94b00cff = spawn("script_model", level.var_e046b238.origin);
    s_unitrigger = level.var_e046b238 zm_unitrigger::create(&function_6fb01110, 64, &function_aa07edab);
    s_unitrigger thread function_8352562a();
}

// Namespace namespace_cc08081f/namespace_cc08081f
// Params 1, eflags: 0x1 linked
// Checksum 0xfe2f824e, Offset: 0x1d50
// Size: 0xc8
function function_1792ae3(e_item) {
    s_reel = level.var_ea514bc4[level.var_804a56e3];
    if (isdefined(s_reel)) {
        s_reel.in_inventory = 1;
        if (math::cointoss()) {
            self thread zm_audio::create_and_play_dialog(#"component_pickup", #"generic");
        }
        if (isdefined(e_item)) {
            e_item playsound(#"hash_760800881cd94dd1");
        }
        function_de798ee4();
        level.var_804a56e3++;
    }
}

// Namespace namespace_cc08081f/namespace_cc08081f
// Params 1, eflags: 0x1 linked
// Checksum 0x8332659f, Offset: 0x1e20
// Size: 0x98
function function_6fb01110(player) {
    if (self.stub.in_use === 1) {
        return false;
    }
    if (!isdefined(level.var_19e44f3d)) {
        return false;
    }
    if (function_8b1a219a()) {
        self sethintstring(#"hash_4a6b20a71fb9496b");
    } else {
        self sethintstring(#"hash_68d7ac4aedcba8f5");
    }
    return true;
}

// Namespace namespace_cc08081f/namespace_cc08081f
// Params 0, eflags: 0x1 linked
// Checksum 0x6f552ecd, Offset: 0x1ec0
// Size: 0x50
function function_aa07edab() {
    self endon(#"death");
    while (true) {
        self waittill(#"trigger");
        self.stub notify(#"play_audio");
    }
}

// Namespace namespace_cc08081f/namespace_cc08081f
// Params 0, eflags: 0x1 linked
// Checksum 0xac79d226, Offset: 0x1f18
// Size: 0x2ac
function function_8352562a() {
    self endon(#"death");
    var_e578920c = 0;
    while (true) {
        self waittill(#"play_audio");
        exploder::exploder("fxexp_script_projector_off");
        exploder::exploder("fxexp_script_projector_on");
        level.var_94b00cff playsound(#"hash_7f70f5f71963f7f2");
        if (isdefined(level.var_19e44f3d)) {
            s_reel = level.var_19e44f3d;
            self.in_use = 1;
            s_reel.in_inventory = 0;
            function_de798ee4();
            level.var_94b00cff playsound(#"hash_50cae5e74f332b7c");
            if (s_reel.var_46db68fd === 1) {
                level.var_94b00cff playloopsound(#"hash_1e451b58f18190b4");
            } else {
                level.var_94b00cff playloopsound(#"hash_48cebe2e9cc70ddc");
            }
            wait 2;
            zm_hms_util::function_52c3fe8d(s_reel.vo_line, level.var_94b00cff.origin);
            /#
                iprintlnbold("<dev string:xbc>" + s_reel.var_8a821e1e + "<dev string:xda>");
            #/
            var_e578920c++;
            level.var_94b00cff stoploopsound();
            level.var_94b00cff playsound(#"hash_1f5fc24563134758");
            exploder::stop_exploder("fxexp_script_projector_on");
            exploder::stop_exploder("fxexp_script_projector_off");
            if (var_e578920c < 6) {
                self.in_use = 0;
                continue;
            }
            wait 0.1;
            break;
        }
    }
    zm_unitrigger::unregister_unitrigger(self);
}

// Namespace namespace_cc08081f/namespace_cc08081f
// Params 0, eflags: 0x1 linked
// Checksum 0xbcd694e8, Offset: 0x21d0
// Size: 0x70
function function_de798ee4() {
    level.var_19e44f3d = undefined;
    for (i = 0; i < level.var_ea514bc4.size; i++) {
        if (level.var_ea514bc4[i].in_inventory) {
            level.var_19e44f3d = level.var_ea514bc4[i];
            break;
        }
    }
}

// Namespace namespace_cc08081f/namespace_cc08081f
// Params 0, eflags: 0x1 linked
// Checksum 0x39773e5, Offset: 0x2248
// Size: 0x94
function function_d38b59bb() {
    level waittill(#"pap_power_ready");
    ee_av_tv = struct::get("ee_av_tv", "targetname");
    s_unitrigger = ee_av_tv zm_unitrigger::create("", 64, &function_82c13fa8);
    s_unitrigger thread function_6b2499f9();
}

// Namespace namespace_cc08081f/namespace_cc08081f
// Params 0, eflags: 0x1 linked
// Checksum 0x3cb70593, Offset: 0x22e8
// Size: 0x50
function function_82c13fa8() {
    self endon(#"death");
    while (true) {
        self waittill(#"trigger");
        self.stub notify(#"play_audio");
    }
}

// Namespace namespace_cc08081f/namespace_cc08081f
// Params 0, eflags: 0x1 linked
// Checksum 0x7ba9b199, Offset: 0x2340
// Size: 0x194
function function_6b2499f9() {
    self endon(#"death");
    a_variants = [];
    for (i = 0; i < 15; i++) {
        if (!isdefined(a_variants)) {
            a_variants = [];
        } else if (!isarray(a_variants)) {
            a_variants = array(a_variants);
        }
        a_variants[a_variants.size] = i;
    }
    n_index = 0;
    while (n_index < a_variants.size) {
        self waittill(#"play_audio");
        foreach (player in getplayers()) {
            zm_hms_util::function_e308175e("vox_tv_message_avog_" + a_variants[n_index], self.origin, player);
        }
        n_index++;
        level waittill(#"zombie_total_set");
    }
    zm_unitrigger::unregister_unitrigger(self);
}

// Namespace namespace_cc08081f/namespace_cc08081f
// Params 0, eflags: 0x1 linked
// Checksum 0x1f63a08, Offset: 0x24e0
// Size: 0x154
function function_a0b040d4() {
    level endon(#"hash_48039f3a4c1a3248");
    level.var_215e60c4 = struct::get(#"hash_17790fb78d228f05", "targetname");
    s_unitrigger = level.var_215e60c4 zm_unitrigger::create(&function_c9271718, 64, &function_ee32c750);
    s_unitrigger thread function_4bda6193();
    level waittill(#"hash_398e4b1e72edb4ee");
    vol = getent("vol_soul_lounge", "targetname");
    exploder::exploder("fxexp_elec_lounge");
    vol thread function_cf1b4a16();
    wait 60;
    level flag::clear(#"hash_398e4b1e72edb4ee");
    exploder::stop_exploder("fxexp_elec_lounge");
}

// Namespace namespace_cc08081f/namespace_cc08081f
// Params 1, eflags: 0x1 linked
// Checksum 0xb5c20a0c, Offset: 0x2640
// Size: 0x108
function function_c9271718(player) {
    if (level.var_215e60c4.in_use === 1) {
        return false;
    }
    if (level.var_215e60c4.is_on === 1) {
        if (function_8b1a219a()) {
            self sethintstring(#"hash_5da008b5fb1b3d");
        } else {
            self sethintstring(#"hash_57516d7d358e63df");
        }
    } else if (function_8b1a219a()) {
        self sethintstring(#"hash_5678e908d228814e");
    } else {
        self sethintstring(#"hash_7dca7ee995ad3d4a");
    }
    return true;
}

// Namespace namespace_cc08081f/namespace_cc08081f
// Params 0, eflags: 0x1 linked
// Checksum 0x197f876f, Offset: 0x2750
// Size: 0x70
function function_ee32c750() {
    self endon(#"death");
    while (true) {
        self waittill(#"trigger");
        self playsound(#"hash_342cdac10639915e");
        self.stub notify(#"play_audio");
    }
}

// Namespace namespace_cc08081f/namespace_cc08081f
// Params 0, eflags: 0x1 linked
// Checksum 0x90effb45, Offset: 0x27c8
// Size: 0x2c6
function function_93040a5d() {
    self setcandamage(1);
    self val::set("quest_mee", "allowDeath", 0);
    var_28999578 = array::randomize(array(0, 1, 2, 3, 4, 5, 6, 7, 8));
    var_4854a91b = "vox_tedd_melee_tedd_";
    self endon(#"death");
    level.var_5da5aff4 = 0;
    while (!level.var_5da5aff4) {
        b_player_damaged = 0;
        waitresult = self waittill(#"damage");
        b_player_damaged = waitresult function_ce7e594b();
        if (!b_player_damaged || isdefined(level.var_215e60c4.in_use) && level.var_215e60c4.in_use) {
            wait 1;
            continue;
        }
        level.var_215e60c4.in_use = 1;
        if (var_28999578.size > 0) {
            alias = var_4854a91b + var_28999578[0];
            arrayremoveindex(var_28999578, 0);
        } else {
            alias = "vox_tedd_melee_final_tedd_0";
            level.var_5da5aff4 = 1;
        }
        foreach (player in getplayers()) {
            zm_hms_util::function_e308175e(alias, level.var_215e60c4.origin, player);
            if (level.var_5da5aff4) {
                level flag::set(#"hash_398e4b1e72edb4ee");
            }
        }
        wait 2;
        level.var_215e60c4.in_use = 0;
    }
}

// Namespace namespace_cc08081f/namespace_cc08081f
// Params 0, eflags: 0x1 linked
// Checksum 0x68776c81, Offset: 0x2a98
// Size: 0xa6
function function_ce7e594b() {
    foreach (player in level.players) {
        if (isplayer(self.attacker) && !isbot(self.attacker)) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_cc08081f/namespace_cc08081f
// Params 0, eflags: 0x1 linked
// Checksum 0xaf5a1479, Offset: 0x2b48
// Size: 0x142
function function_cf1b4a16() {
    shock_status_effect = getstatuseffect(#"hash_320c81d91eb89d73");
    while (level flag::get(#"hash_398e4b1e72edb4ee")) {
        foreach (player in getplayers()) {
            if (player istouching(self)) {
                player playrumbleonentity("damage_heavy");
                player playsound(#"hash_5af2a9d11f007b9");
                player status_effect::status_effect_apply(shock_status_effect, undefined, self, 1);
            }
        }
        wait 1;
    }
}

// Namespace namespace_cc08081f/namespace_cc08081f
// Params 0, eflags: 0x1 linked
// Checksum 0xee4c0f21, Offset: 0x2c98
// Size: 0x384
function function_4bda6193() {
    self endon(#"death");
    level.var_215e60c4.in_use = 0;
    a_variants = [];
    for (i = 0; i < 26; i++) {
        if (!isdefined(a_variants)) {
            a_variants = [];
        } else if (!isarray(a_variants)) {
            a_variants = array(a_variants);
        }
        a_variants[a_variants.size] = i;
    }
    a_variants = array::randomize(a_variants);
    n_index = 0;
    while (true) {
        self waittill(#"play_audio");
        if (isdefined(level.var_215e60c4.in_use) && !level.var_215e60c4.in_use) {
            level.var_215e60c4.in_use = 1;
            if (!(isdefined(level.var_215e60c4.is_on) && level.var_215e60c4.is_on)) {
                exploder::exploder("fxexp_script_bus_driver_on");
                wait 1;
                level.var_215e60c4.is_on = 1;
                foreach (player in getplayers()) {
                    zm_hms_util::function_e308175e("vox_tedd_interact_first_tedd_0", level.var_215e60c4.origin, player);
                }
                level.var_215e60c4.body = getent("ee_tedd", "targetname");
                level.var_215e60c4.body thread function_93040a5d();
            } else {
                foreach (player in getplayers()) {
                    zm_hms_util::function_e308175e("vox_tedd_interact_tedd_" + a_variants[n_index], level.var_215e60c4.origin, player);
                }
                n_index++;
                if (n_index >= a_variants.size) {
                    n_index = 0;
                    a_variants = array::randomize(a_variants);
                }
            }
            wait 2;
            level.var_215e60c4.in_use = 0;
            continue;
        }
        wait 1;
    }
}

// Namespace namespace_cc08081f/namespace_cc08081f
// Params 0, eflags: 0x1 linked
// Checksum 0x5220abb1, Offset: 0x3028
// Size: 0x84
function function_35e95fba() {
    self hidepart("tag_screen_off");
    self hidepart("tag_screen_on_play");
    self hidepart("tag_screen_on_noise");
    self hidepart("tag_screen_on_tone");
}

// Namespace namespace_cc08081f/namespace_cc08081f
// Params 1, eflags: 0x1 linked
// Checksum 0x2033272a, Offset: 0x30b8
// Size: 0x1c2
function function_74174ce1(str_state) {
    switch (str_state) {
    case #"screen_off":
        self function_35e95fba();
        self showpart("tag_screen_on_play");
        break;
    case #"screen_on":
        self function_35e95fba();
        self showpart("tag_screen_on_noise");
        wait 30;
        self hidepart("tag_screen_on_noise");
        self showpart("tag_screen_on_tone");
        wait 30;
        self hidepart("tag_screen_on_tone");
        self showpart("tag_screen_off");
        break;
    case #"screen_on_noise":
        self function_35e95fba();
        self showpart("tag_screen_on_noise");
        break;
    case #"screen_on_tone":
        self function_35e95fba();
        self showpart("tag_screen_on_tone");
        break;
    }
}

