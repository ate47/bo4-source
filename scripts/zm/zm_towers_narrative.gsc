#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_unitrigger;
#using scripts\core_common\util_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\trigger_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\struct;

#namespace zm_towers_narrative;

// Namespace zm_towers_narrative/zm_towers_narrative
// Params 0, eflags: 0x1 linked
// Checksum 0x1a2bbead, Offset: 0x4e8
// Size: 0x594
function init() {
    level flag::init(#"hash_64e187377acec152");
    level flag::init(#"hash_61f2d2e8517e7f57");
    level flag::init(#"hash_407e0345ce2708de");
    level flag::init(#"hash_3eea1302aae8fea1");
    level flag::init(#"hash_3bdb012f2eaac96");
    level flag::init(#"hash_506f1fac74cfdd86");
    level flag::init(#"hash_4ea18d3d5847ab0c");
    level flag::init(#"hash_aab8ed14df98649");
    level flag::init(#"hash_3af375942a1c2785");
    level flag::init(#"hash_7b6594521dfb7bb1");
    level flag::init(#"hash_3e90f82a2802b3");
    level flag::init(#"hash_26c9e53e0e558572");
    level flag::init(#"hash_4863d7214aa660e2");
    level flag::init(#"hash_5ee1f3505b34a52d");
    if (!zm_utility::is_ee_enabled()) {
        hidemiscmodels("mdl_narrative_ix");
        hidemiscmodels("mdl_narrative_ink");
        hidemiscmodels("mdl_narrative_egg");
    }
    mdl_frame = getent("narsho", "targetname");
    mdl_frame hide();
    a_s_scrolls = struct::get_array(#"hash_4ff4d74fc1ff150d");
    array::thread_all(a_s_scrolls, &function_58c9a8b3, 1);
    a_s_skulls = struct::get_array(#"hash_70b8946b02777c1d");
    array::thread_all(a_s_skulls, &function_58c9a8b3);
    level thread function_c2e32573("narrative_whispers", array(#"hash_609c2bdb6def129f", #"hash_4af81ddd4ad3f4d1", #"hash_23a8e8f61c4fc32c", #"hash_7f6bf79b60f1e8d4"), 1, #"hash_46aec984fab973b8", #"hash_46ddcfa7b8081e89", 1.5);
    level thread function_c2e32573("narrative_warning", array(#"hash_5c9150da16c41e10", #"hash_66dd1564ba1e9474", #"hash_4489363f604b439c", #"hash_4e2811c0bd19be20", #"hash_7101f8d31ad66888"), 1);
    level thread function_a38e222b();
    level thread function_831dcf3e();
    level thread function_7c66ee1b();
    level thread function_1d63d95a();
    level thread function_e0f3a28d();
    level thread function_bf573b44();
    level thread acid_trap_think();
    level thread function_81c8a125();
    level thread function_a533efc0();
    level thread function_cb2c487d();
    level thread scepter_think();
    if (zm_utility::is_ee_enabled()) {
        var_9ce1269a = getent("mdl_narrative_lead", "targetname");
        var_9ce1269a clientfield::set("" + #"hash_2407f687f7d24a83", 1);
    }
    level thread function_b315d709();
}

// Namespace zm_towers_narrative/zm_towers_narrative
// Params 1, eflags: 0x1 linked
// Checksum 0x43e467d9, Offset: 0xa88
// Size: 0x124
function function_58c9a8b3(var_c1146e81 = 0) {
    level endon(#"end_game");
    if (!zm_utility::is_ee_enabled()) {
        if (var_c1146e81) {
            hidemiscmodels(self.target);
        }
        self struct::delete();
        return;
    }
    e_player = self zm_unitrigger::function_fac87205(&function_77467f4d);
    if (var_c1146e81) {
        hidemiscmodels(self.target);
    }
    if (isdefined(self.var_b35b6be6)) {
    }
    if (isdefined(self.script_notify)) {
        level notify(self.script_notify, {#e_player:e_player, #v_origin:self.origin});
    }
    self struct::delete();
}

// Namespace zm_towers_narrative/zm_towers_narrative
// Params 1, eflags: 0x1 linked
// Checksum 0x60c2d1b1, Offset: 0xbb8
// Size: 0x86
function function_77467f4d(e_player) {
    var_5168e40f = e_player zm_utility::is_player_looking_at(self.stub.related_parent.origin, 0.99, 0);
    var_2d08c5b3 = level flag::get(#"hash_64e187377acec152");
    return !var_2d08c5b3 && var_5168e40f;
}

// Namespace zm_towers_narrative/zm_towers_narrative
// Params 6, eflags: 0x1 linked
// Checksum 0x75b01a04, Offset: 0xc48
// Size: 0x298
function function_c2e32573(str_notify, a_str_vo, var_4bb99e1c = 1, var_763c80f1, var_109c646f, var_e688ce8f = 0) {
    level endon(#"end_game");
    if (!zm_utility::is_ee_enabled()) {
        return;
    }
    if (!isdefined(a_str_vo)) {
        a_str_vo = [];
    } else if (!isarray(a_str_vo)) {
        a_str_vo = array(a_str_vo);
    }
    foreach (str_vo in a_str_vo) {
        s_waitresult = level waittill(str_notify);
        level flag::set(#"hash_64e187377acec152");
        v_origin = s_waitresult.v_origin;
        if (isdefined(var_763c80f1)) {
            playsoundatposition(var_763c80f1, v_origin);
            wait 1.5;
        }
        if (var_4bb99e1c) {
            playsoundatposition(str_vo, v_origin);
        } else {
            foreach (e_player in level.players) {
                e_player playsoundtoplayer(str_vo, e_player);
            }
        }
        function_d24a0f09(str_vo, var_e688ce8f);
        if (isdefined(var_109c646f)) {
            playsoundatposition(var_109c646f, v_origin);
        }
        level flag::clear(#"hash_64e187377acec152");
    }
}

// Namespace zm_towers_narrative/zm_towers_narrative
// Params 2, eflags: 0x1 linked
// Checksum 0xca2002c0, Offset: 0xee8
// Size: 0x7e
function function_d24a0f09(str_vo, var_e688ce8f = 0) {
    n_duration = soundgetplaybacktime(str_vo);
    n_duration = float(n_duration) / 1000;
    n_duration -= var_e688ce8f;
    if (n_duration > 0) {
        wait n_duration;
    }
}

// Namespace zm_towers_narrative/zm_towers_narrative
// Params 0, eflags: 0x1 linked
// Checksum 0xbcfcf9e, Offset: 0xf70
// Size: 0x5b6
function function_a38e222b() {
    level endon(#"end_game");
    if (!zm_utility::is_ee_enabled()) {
        return;
    }
    for (i = 0; i < 4; i++) {
        waitresult = level waittill(#"narrative_explore");
        level flag::set(#"hash_64e187377acec152");
        var_e25ba3b3 = spawn("script_origin", waitresult.v_origin);
        var_e25ba3b3 playsound(#"hash_d4b330503498b0f");
        var_e25ba3b3 playloopsound(#"hash_1da1dccdd4a06b31");
        wait 2;
        switch (i) {
        case 0:
            a_str_vo = array(#"hash_4e3fb2f478282bfd", #"hash_4e3fb1f478282a4a", #"hash_29468385390c3a5", #"hash_4e3faff4782826e4", #"hash_29462385390b973");
            break;
        case 1:
            a_str_vo = array(#"hash_68fa60075be1fd59", #"hash_5838015b257fcbb8", #"hash_68fa5e075be1f9f3", #"hash_5838035b257fcf1e", #"hash_68fa64075be20425", #"hash_5838055b257fd284", #"hash_68fa62075be200bf", #"hash_5838075b257fd5ea", #"hash_68fa68075be20af1", #"hash_5837f95b257fbe20", #"hash_436b0f8120fe7fe2", #"hash_66f5d6e0b826d9cb", #"hash_436b0d8120fe7c7c");
            break;
        case 2:
            a_str_vo = array(#"hash_4170147034d51e4c", #"hash_4769619b76b935b9", #"hash_4170167034d521b2", #"hash_47695f9b76b93253", #"hash_4170107034d51780", #"hash_4769659b76b93c85", #"hash_4170127034d51ae6", #"hash_4769639b76b9391f", #"hash_41701c7034d52be4", #"hash_4769699b76b94351", #"hash_1146642abcb5f7cb", #"hash_1146632abcb5f618", #"hash_6943aa9c6250957", #"hash_1146652abcb5f97e", #"hash_69438a9c62505f1", #"hash_69437a9c625043e", #"hash_69436a9c625028b");
            break;
        case 3:
            a_str_vo = array(#"hash_56a6dd4f9ee2ba10", #"hash_56a6de4f9ee2bbc3", #"hash_56a6df4f9ee2bd76", #"hash_56a6e04f9ee2bf29");
            break;
        }
        for (a = 0; a < a_str_vo.size; a++) {
            var_d34b6d2b = function_b116e882(i, a, 1);
            if (isdefined(var_d34b6d2b)) {
                playsoundatposition(var_d34b6d2b, waitresult.v_origin);
            }
            playsoundatposition(a_str_vo[a], waitresult.v_origin);
            function_d24a0f09(a_str_vo[a]);
            var_d34b6d2b = function_b116e882(i, a, 0);
            if (isdefined(var_d34b6d2b)) {
                playsoundatposition(var_d34b6d2b, waitresult.v_origin);
            }
            function_cfb5afb3(i, a);
        }
        var_e25ba3b3 stoploopsound();
        var_e25ba3b3 playsound(#"hash_4242c92643cc6775");
        waitframe(1);
        var_e25ba3b3 delete();
        level flag::clear(#"hash_64e187377acec152");
    }
}

// Namespace zm_towers_narrative/zm_towers_narrative
// Params 2, eflags: 0x1 linked
// Checksum 0x836f7b92, Offset: 0x1530
// Size: 0xda
function function_cfb5afb3(var_237f80b0, var_54bb7f87) {
    n_waittime = undefined;
    switch (var_237f80b0) {
    case 2:
        if (var_54bb7f87 == 9) {
            n_waittime = 0.35;
        }
        if (var_54bb7f87 == 10) {
            n_waittime = 2.23;
        }
        if (var_54bb7f87 == 13) {
            n_waittime = 0.54;
        }
        if (var_54bb7f87 == 14) {
            n_waittime = 5.8;
        }
        if (var_54bb7f87 == 15) {
            n_waittime = 1.6;
        }
        break;
    }
    if (isdefined(n_waittime)) {
        wait n_waittime;
        return;
    }
    waitframe(1);
}

// Namespace zm_towers_narrative/zm_towers_narrative
// Params 3, eflags: 0x1 linked
// Checksum 0x412050a, Offset: 0x1618
// Size: 0x1ee
function function_b116e882(var_237f80b0, var_54bb7f87, var_5876458) {
    var_d34b6d2b = undefined;
    if (var_5876458) {
        switch (var_237f80b0) {
        case 0:
            if (var_54bb7f87 == 0) {
                var_d34b6d2b = #"hash_1ac8c014caa1f64d";
            }
            if (var_54bb7f87 == 1) {
                var_d34b6d2b = #"hash_4e8555d4b9f67fb5";
            }
            if (var_54bb7f87 == 3) {
                var_d34b6d2b = #"hash_4e8552d4b9f67a9c";
            }
            if (var_54bb7f87 == 4) {
                var_d34b6d2b = #"hash_4e8553d4b9f67c4f";
            }
            break;
        case 2:
            if (var_54bb7f87 == 9) {
                var_d34b6d2b = #"hash_70155a583c7b3ae2";
            }
            if (var_54bb7f87 == 11) {
                var_d34b6d2b = #"hash_701559583c7b392f";
            }
            if (var_54bb7f87 == 12) {
                var_d34b6d2b = #"hash_701558583c7b377c";
            }
            if (var_54bb7f87 == 13) {
                var_d34b6d2b = #"hash_701557583c7b35c9";
            }
            if (var_54bb7f87 == 14) {
                var_d34b6d2b = #"hash_701556583c7b3416";
            }
            break;
        case 3:
            if (var_54bb7f87 == 2) {
                var_d34b6d2b = #"hash_481d86c03825cd82";
            }
            break;
        }
    } else {
        switch (var_237f80b0) {
        default:
            var_d34b6d2b = undefined;
            break;
        }
    }
    return var_d34b6d2b;
}

// Namespace zm_towers_narrative/zm_towers_narrative
// Params 0, eflags: 0x1 linked
// Checksum 0xb0b6b1c, Offset: 0x1810
// Size: 0x34c
function function_831dcf3e() {
    level endon(#"end_game");
    var_8a88c4c8 = getent("mdl_narrative_dirt", "targetname");
    a_t_braziers = getentarray("t_narrative_hoop", "targetname");
    if (!zm_utility::is_ee_enabled()) {
        var_8a88c4c8 delete();
    } else {
        level.var_75fb83c = 0;
        level.var_3d8b20c0 = a_t_braziers.size;
        foreach (t_brazier in a_t_braziers) {
            t_brazier flag::init(#"hash_6e4b1162d4626a6e");
            t_brazier thread function_51f7da68();
        }
        level flag::wait_till(#"hash_61f2d2e8517e7f57");
        callback::on_connect(&function_da2c37fc);
        array::thread_all(level.players, &function_da2c37fc);
        level flag::wait_till(#"hash_407e0345ce2708de");
        callback::remove_on_connect(&function_da2c37fc);
    }
    foreach (t_brazier in a_t_braziers) {
        mdl_fx = getent(t_brazier.target, "targetname");
        if (zm_utility::is_ee_enabled()) {
            mdl_fx clientfield::set("" + #"hash_5afda864f8b64f5c", 0);
        }
        mdl_fx delete();
        t_brazier delete();
    }
    vol_pedestal = getent("vol_narrative_smash", "targetname");
    vol_pedestal delete();
}

// Namespace zm_towers_narrative/zm_towers_narrative
// Params 0, eflags: 0x1 linked
// Checksum 0x627d4094, Offset: 0x1b68
// Size: 0x2a4
function function_51f7da68() {
    self notify("1a5e7df7e5c92d42");
    self endon("1a5e7df7e5c92d42");
    level endon(#"end_game");
    self endon(#"death");
    mdl_fx = getent(self.target, "targetname");
    if (self flag::get(#"hash_6e4b1162d4626a6e")) {
        mdl_fx clientfield::set("" + #"hash_5afda864f8b64f5c", 0);
        self flag::clear(#"hash_6e4b1162d4626a6e");
    }
    while (true) {
        s_waitresult = level waittill(#"hash_3042a9bf2f57ea0a");
        v_origin = s_waitresult.var_814c9389;
        if (istouching(v_origin, self)) {
            break;
        }
    }
    var_d34eaa6e = level.var_75fb83c + 1;
    if (var_d34eaa6e == self.script_int) {
        level.var_75fb83c = var_d34eaa6e;
        self flag::set(#"hash_6e4b1162d4626a6e");
        mdl_fx clientfield::set("" + #"hash_5afda864f8b64f5c", 1);
        if (level.var_75fb83c >= level.var_3d8b20c0) {
            level flag::set(#"hash_61f2d2e8517e7f57");
        }
        return;
    }
    level.var_75fb83c = 0;
    a_t_braziers = getentarray("t_narrative_hoop", "targetname");
    arrayremovevalue(a_t_braziers, self);
    array::thread_all(a_t_braziers, &function_51f7da68);
    self thread function_51f7da68();
}

// Namespace zm_towers_narrative/zm_towers_narrative
// Params 0, eflags: 0x1 linked
// Checksum 0x4f23f18c, Offset: 0x1e18
// Size: 0x11a
function function_da2c37fc() {
    self notify("49bddca4a088db84");
    self endon("49bddca4a088db84");
    level endon(#"end_game", #"hash_407e0345ce2708de");
    self endon(#"disconnect");
    vol_pedestal = getent("vol_narrative_smash", "targetname");
    while (true) {
        for (e_storm = self.e_storm; !isdefined(e_storm); e_storm = self.e_storm) {
            waitframe(1);
        }
        if (e_storm istouching(vol_pedestal)) {
            self thread function_2160d544();
            level flag::set(#"hash_407e0345ce2708de");
            break;
        }
        waitframe(1);
    }
}

// Namespace zm_towers_narrative/zm_towers_narrative
// Params 0, eflags: 0x1 linked
// Checksum 0xfbb11084, Offset: 0x1f40
// Size: 0xec
function function_2160d544() {
    level endon(#"end_game");
    var_8a88c4c8 = getent("mdl_narrative_dirt", "targetname");
    var_8a88c4c8 clientfield::set("" + #"hash_2407f687f7d24a83", 1);
    self function_964ec142();
    if (!level flag::get(#"hash_3eea1302aae8fea1")) {
        var_8a88c4c8 clientfield::set("" + #"hash_2407f687f7d24a83", 0);
    }
}

// Namespace zm_towers_narrative/zm_towers_narrative
// Params 0, eflags: 0x1 linked
// Checksum 0x4f29d76b, Offset: 0x2038
// Size: 0x1b4
function function_964ec142() {
    level endon(#"end_game");
    self endon(#"death", #"weapon_change");
    vol_cipher = getent("vol_narrative_dirt", "targetname");
    while (true) {
        self waittill(#"weapon_melee");
        if (self getcurrentweapon() == level.hero_weapon[#"hammer"][2]) {
            v_origin = self getweaponmuzzlepoint();
            v_dir = self getweaponforwarddir();
            v_end = v_origin + vectorscale(v_dir, 20000);
            a_trace = beamtrace(v_origin, v_end, 0, self);
            v_hit = a_trace[#"position"];
            if (isdefined(v_hit) && istouching(v_hit, vol_cipher)) {
                level flag::set(#"hash_3eea1302aae8fea1");
                break;
            }
        }
    }
}

// Namespace zm_towers_narrative/zm_towers_narrative
// Params 0, eflags: 0x1 linked
// Checksum 0xd79ddcbf, Offset: 0x21f8
// Size: 0x1cc
function function_7c66ee1b() {
    level endon(#"end_game");
    var_8a88c4c8 = getent("mdl_narrative_flop", "targetname");
    s_loc = struct::get(#"hash_41008b60aedc6f40");
    s_hand = struct::get(#"hash_723303fe45c13f65");
    if (!zm_utility::is_ee_enabled()) {
        var_8a88c4c8 delete();
        s_loc struct::delete();
        scene::add_scene_func(s_hand.var_450f5117, &function_f3c29d33, "init");
        s_hand struct::delete();
        return;
    }
    s_loc zm_unitrigger::function_fac87205(&function_bc24a9ea);
    level thread scene::play(s_hand.var_450f5117);
    s_loc struct::delete();
    s_hand struct::delete();
    var_8a88c4c8 clientfield::set("" + #"hash_2407f687f7d24a83", 1);
}

// Namespace zm_towers_narrative/zm_towers_narrative
// Params 1, eflags: 0x1 linked
// Checksum 0xafe1b52e, Offset: 0x23d0
// Size: 0x8c
function function_f3c29d33(a_ents) {
    level scene::remove_scene_func(self.scriptbundlename, &function_f3c29d33, "init");
    self scene::stop();
    mdl_hand = a_ents[#"prop 1"];
    mdl_hand delete();
}

// Namespace zm_towers_narrative/zm_towers_narrative
// Params 1, eflags: 0x1 linked
// Checksum 0xeb33d078, Offset: 0x2468
// Size: 0xc8
function function_bc24a9ea(e_player) {
    s_hand = struct::get(#"hash_723303fe45c13f65");
    str_stance = e_player getstance();
    var_39b20ef6 = e_player zm_utility::is_player_looking_at(s_hand.origin, 0.99, 0);
    var_4e28e4e2 = str_stance == "crouch" || str_stance == "prone";
    return var_39b20ef6 && var_4e28e4e2;
}

// Namespace zm_towers_narrative/zm_towers_narrative
// Params 0, eflags: 0x1 linked
// Checksum 0x1832fee5, Offset: 0x2538
// Size: 0x1d4
function function_1d63d95a() {
    level endon(#"end_game");
    var_8a88c4c8 = getent("mdl_narrative_crawl", "targetname");
    if (!zm_utility::is_ee_enabled()) {
        var_8a88c4c8 delete();
        return;
    }
    while (true) {
        level flag::wait_till("special_round");
        level thread function_1614d162();
        level thread function_ce1c5cac();
        level flag::wait_till_any(array(#"hash_3bdb012f2eaac96", #"hash_506f1fac74cfdd86"));
        if (level flag::get(#"hash_3bdb012f2eaac96")) {
            break;
        }
        level flag::clear(#"hash_506f1fac74cfdd86");
    }
    t_trigger = getent("t_narrative_crawl", "targetname");
    t_trigger delete();
    var_8a88c4c8 clientfield::set("" + #"hash_2407f687f7d24a83", 1);
}

// Namespace zm_towers_narrative/zm_towers_narrative
// Params 0, eflags: 0x1 linked
// Checksum 0x1fb1c5f6, Offset: 0x2718
// Size: 0x64
function function_1614d162() {
    level endon(#"end_game", #"hash_506f1fac74cfdd86");
    trigger::wait_till("t_narrative_crawl");
    level flag::set(#"hash_3bdb012f2eaac96");
}

// Namespace zm_towers_narrative/zm_towers_narrative
// Params 0, eflags: 0x1 linked
// Checksum 0x3e632c72, Offset: 0x2788
// Size: 0x64
function function_ce1c5cac() {
    level endon(#"end_game", #"hash_3bdb012f2eaac96");
    level flag::wait_till_clear("special_round");
    level flag::set(#"hash_506f1fac74cfdd86");
}

// Namespace zm_towers_narrative/zm_towers_narrative
// Params 0, eflags: 0x1 linked
// Checksum 0x3e055f10, Offset: 0x27f8
// Size: 0x14c
function function_e0f3a28d() {
    level endon(#"end_game");
    var_8a88c4c8 = getent("mdl_narrative_soak", "targetname");
    var_86e77481 = getentarray("t_narrative_soak", "targetname");
    if (!zm_utility::is_ee_enabled()) {
        var_8a88c4c8 delete();
    } else {
        level.var_c51a5ce0 = 0;
        level.var_98d9a07c = var_86e77481.size;
        array::thread_all(var_86e77481, &function_341bdf82);
        level flag::wait_till(#"hash_4ea18d3d5847ab0c");
        var_8a88c4c8 clientfield::set("" + #"hash_2407f687f7d24a83", 1);
    }
    array::delete_all(var_86e77481);
}

// Namespace zm_towers_narrative/zm_towers_narrative
// Params 0, eflags: 0x1 linked
// Checksum 0x4ea9719e, Offset: 0x2950
// Size: 0x1dc
function function_341bdf82() {
    self notify("45a4563ed2519f47");
    self endon("45a4563ed2519f47");
    level endon(#"end_game");
    self endon(#"death");
    while (true) {
        s_waitresult = self waittill(#"damage");
        w_weapon = s_waitresult.weapon;
        v_origin = s_waitresult.position;
        if (istouching(v_origin, self) && zm_utility::is_frag_grenade(w_weapon)) {
            break;
        }
    }
    var_8bcd06a0 = level.var_c51a5ce0 + 1;
    if (var_8bcd06a0 == self.script_int) {
        level.var_c51a5ce0 = var_8bcd06a0;
        if (level.var_c51a5ce0 >= level.var_98d9a07c) {
            level flag::set(#"hash_4ea18d3d5847ab0c");
        }
        return;
    }
    level.var_c51a5ce0 = 0;
    var_86e77481 = getentarray("t_narrative_soak", "targetname");
    arrayremovevalue(var_86e77481, self);
    array::thread_all(var_86e77481, &function_341bdf82);
    self thread function_341bdf82();
}

// Namespace zm_towers_narrative/zm_towers_narrative
// Params 0, eflags: 0x1 linked
// Checksum 0xaae7ceb4, Offset: 0x2b38
// Size: 0x194
function function_bf573b44() {
    level endon(#"end_game");
    var_8a88c4c8 = getent("mdl_narrative_payback", "targetname");
    a_vol_statues = getentarray("vol_narrative_payback", "targetname");
    if (!zm_utility::is_ee_enabled()) {
        var_8a88c4c8 delete();
    } else {
        level.var_1a87adb6 = 0;
        level.var_4cc66ca4 = a_vol_statues.size;
        callback::on_connect(&function_ca4e26c3);
        array::thread_all(level.players, &function_ca4e26c3);
        level flag::wait_till(#"hash_aab8ed14df98649");
        callback::remove_on_connect(&function_ca4e26c3);
        var_8a88c4c8 clientfield::set("" + #"hash_2407f687f7d24a83", 1);
    }
    array::delete_all(a_vol_statues);
}

// Namespace zm_towers_narrative/zm_towers_narrative
// Params 0, eflags: 0x1 linked
// Checksum 0x56099f6c, Offset: 0x2cd8
// Size: 0x35a
function function_ca4e26c3() {
    self notify("45c9a4f55b11e032");
    self endon("45c9a4f55b11e032");
    level endon(#"end_game", #"hash_aab8ed14df98649");
    self endon(#"disconnect");
    a_w_pistols = array(level.hero_weapon[#"sword_pistol"][0].dualwieldweapon, level.hero_weapon[#"sword_pistol"][1].dualwieldweapon, level.hero_weapon[#"sword_pistol"][2].dualwieldweapon);
    while (true) {
        s_waitresult = self waittill(#"weapon_fired");
        w_weapon = s_waitresult.weapon;
        if (isdefined(w_weapon) && isinarray(a_w_pistols, w_weapon)) {
            v_origin = self getweaponmuzzlepoint();
            v_dir = self getweaponforwarddir();
            n_range = level.hero_weapon_stats[#"sword_pistol"][#"hash_579056d441d637d"];
            v_end = v_origin + vectorscale(v_dir, n_range);
            a_trace = beamtrace(v_origin, v_end, 0, self);
            v_hit = a_trace[#"position"];
            if (isdefined(v_hit)) {
                a_vol_statues = getentarray("vol_narrative_payback", "targetname");
                foreach (vol_statue in a_vol_statues) {
                    if (istouching(v_hit, vol_statue)) {
                        var_1044cdc7 = level.var_1a87adb6 + 1;
                        if (var_1044cdc7 == vol_statue.script_int) {
                            level.var_1a87adb6 = var_1044cdc7;
                            if (level.var_1a87adb6 >= level.var_4cc66ca4) {
                                level flag::set(#"hash_aab8ed14df98649");
                            }
                        } else {
                            level.var_1a87adb6 = 0;
                        }
                        break;
                    }
                }
            }
        }
    }
}

// Namespace zm_towers_narrative/zm_towers_narrative
// Params 0, eflags: 0x1 linked
// Checksum 0x60f238c, Offset: 0x3040
// Size: 0x210
function acid_trap_think() {
    level endon(#"end_game");
    var_8a88c4c8 = getent("mdl_narrative_burn", "targetname");
    if (!zm_utility::is_ee_enabled()) {
        var_8a88c4c8 delete();
        return;
    }
    scene::add_scene_func(#"p8_fxanim_zm_towers_trap_acid_02_bundle", &function_89add587, "play");
    var_74331c2 = level.var_482bcfef;
    var_4d42c97f = arraygetclosest(var_8a88c4c8.origin, var_74331c2);
    var_4d42c97f thread function_e6f26f04();
    var_4d42c97f thread function_ffc6c45f();
    while (true) {
        level flag::wait_till_all(array(#"hash_3e90f82a2802b3", #"hash_26c9e53e0e558572"));
        var_8a88c4c8 clientfield::set("" + #"hash_2407f687f7d24a83", 1);
        level flag::wait_till_clear_any(array(#"hash_3e90f82a2802b3", #"hash_26c9e53e0e558572"));
        var_8a88c4c8 clientfield::set("" + #"hash_2407f687f7d24a83", 0);
    }
}

// Namespace zm_towers_narrative/zm_towers_narrative
// Params 1, eflags: 0x1 linked
// Checksum 0x8f805727, Offset: 0x3258
// Size: 0x104
function function_89add587(a_ents) {
    var_8a88c4c8 = getent("mdl_narrative_burn", "targetname");
    a_s_scenes = struct::get_array(self.scriptbundlename, "scriptbundlename");
    s_closest = arraygetclosest(var_8a88c4c8.origin, a_s_scenes);
    if (s_closest == self) {
        level scene::remove_scene_func(self.scriptbundlename, &function_89add587, "play");
        var_110cafc1 = a_ents[#"prop 1"];
        var_8a88c4c8 linkto(var_110cafc1, var_8a88c4c8.var_ab585079);
    }
}

// Namespace zm_towers_narrative/zm_towers_narrative
// Params 0, eflags: 0x1 linked
// Checksum 0xab2ee7d3, Offset: 0x3368
// Size: 0x110
function function_e6f26f04() {
    level endon(#"end_game");
    self endon(#"death");
    str_id = self.script_string;
    while (true) {
        var_33f252eb = level waittill(#"trap_activate");
        if (var_33f252eb === self) {
            level flag::set(#"hash_3e90f82a2802b3");
            s_waitresult = level waittill(#"traps_cooldown");
            str_off = s_waitresult.var_be3f58a;
            if (str_off === str_id) {
                level flag::clear(#"hash_3e90f82a2802b3");
            }
        }
    }
}

// Namespace zm_towers_narrative/zm_towers_narrative
// Params 0, eflags: 0x1 linked
// Checksum 0xaaeca792, Offset: 0x3480
// Size: 0x148
function function_ffc6c45f() {
    level endon(#"end_game");
    self endon(#"death");
    while (true) {
        wait 1;
        var_89a92e6f = 0;
        foreach (e_player in level.players) {
            if (zm_utility::is_player_valid(e_player, 0, 0) && e_player istouching(self)) {
                var_89a92e6f = 1;
                break;
            }
        }
        if (var_89a92e6f) {
            level flag::set(#"hash_26c9e53e0e558572");
            continue;
        }
        level flag::clear(#"hash_26c9e53e0e558572");
    }
}

// Namespace zm_towers_narrative/zm_towers_narrative
// Params 0, eflags: 0x1 linked
// Checksum 0xa844a5f6, Offset: 0x35d0
// Size: 0x22c
function function_81c8a125() {
    level endon(#"end_game");
    var_8a88c4c8 = getent("mdl_narrative_destiny", "targetname");
    a_t_shields = getentarray("t_narrative_destiny", "targetname");
    if (!zm_utility::is_ee_enabled()) {
        var_8a88c4c8 delete();
    } else {
        var_8b789c96 = 0;
        var_63e5fc38 = a_t_shields.size;
        while (true) {
            t_shield = trigger::wait_till("t_narrative_destiny");
            if (var_8b789c96 != t_shield.script_int) {
                var_7ef1d61 = var_8b789c96 + 1;
                if (var_7ef1d61 == t_shield.script_int) {
                    var_8b789c96 = var_7ef1d61;
                    if (var_8b789c96 >= var_63e5fc38) {
                        break;
                    }
                    continue;
                }
                var_8b789c96 = 0;
            }
        }
        mdl_shield = getent("mdl_narrative_bash", "targetname");
        mdl_shield movex(-2, 0.5);
        mdl_shield rotatepitch(15, 0.5);
        var_8a88c4c8 clientfield::set("" + #"hash_2407f687f7d24a83", 1);
    }
    array::delete_all(a_t_shields);
}

// Namespace zm_towers_narrative/zm_towers_narrative
// Params 0, eflags: 0x1 linked
// Checksum 0x41dee0d, Offset: 0x3808
// Size: 0x10c
function function_a533efc0() {
    level endon(#"end_game");
    var_8a88c4c8 = getent("mdl_narrative_slash", "targetname");
    if (!zm_utility::is_ee_enabled()) {
        var_8a88c4c8 delete();
        return;
    }
    callback::on_ai_killed(&function_d6357bd4);
    level flag::wait_till(#"hash_7b6594521dfb7bb1");
    callback::remove_on_ai_killed(&function_d6357bd4);
    var_8a88c4c8 clientfield::set("" + #"hash_2407f687f7d24a83", 1);
}

// Namespace zm_towers_narrative/zm_towers_narrative
// Params 1, eflags: 0x1 linked
// Checksum 0x90ae0862, Offset: 0x3920
// Size: 0x15c
function function_d6357bd4(s_params) {
    level endon(#"end_game");
    e_player = s_params.eattacker;
    str_mod = s_params.smeansofdeath;
    var_10280e3c = getent("e_challenge_center_stage", "targetname");
    if (self.archetype == #"blight_father" && isdefined(self.var_2c2980d3) && self.var_2c2980d3 && self istouching(var_10280e3c) && isplayer(e_player) && e_player istouching(var_10280e3c) && str_mod === "MOD_UNKNOWN" && isdefined(e_player.var_a70d2cfe) && e_player.var_a70d2cfe) {
        level flag::set(#"hash_7b6594521dfb7bb1");
    }
}

// Namespace zm_towers_narrative/zm_towers_narrative
// Params 0, eflags: 0x1 linked
// Checksum 0xdc0fb91a, Offset: 0x3a88
// Size: 0x318
function function_cb2c487d() {
    level endon(#"end_game");
    var_8a88c4c8 = getent("mdl_narrative_death", "targetname");
    vol_grate = getent("vol_narrative_death", "targetname");
    if (!zm_utility::is_ee_enabled()) {
        var_8a88c4c8 delete();
        vol_grate delete();
        return;
    }
    level flag::wait_till(#"hash_1dedcdbd1e528077");
    s_trap = level.var_abf198ff[3];
    var_9f02e39c = s_trap.var_1171b93e[0];
    var_f9b9263d = 0;
    while (true) {
        while (!(isdefined(var_9f02e39c.var_94de9684) && var_9f02e39c.var_94de9684)) {
            waitframe(1);
        }
        while (var_9f02e39c.var_94de9684) {
            b_show = 0;
            foreach (e_player in level.players) {
                if (zm_utility::is_player_valid(e_player, 0, 0) && isdefined(e_player.var_eb319d10) && e_player.var_eb319d10 && e_player istouching(vol_grate)) {
                    b_show = 1;
                    break;
                }
            }
            if (b_show) {
                if (!var_f9b9263d) {
                    var_f9b9263d = 1;
                    var_8a88c4c8 clientfield::set("" + #"hash_2407f687f7d24a83", 1);
                }
            } else if (var_f9b9263d) {
                var_f9b9263d = 0;
                var_8a88c4c8 clientfield::set("" + #"hash_2407f687f7d24a83", 0);
            }
            waitframe(1);
        }
        if (var_f9b9263d) {
            var_f9b9263d = 0;
            var_8a88c4c8 clientfield::set("" + #"hash_2407f687f7d24a83", 0);
        }
    }
}

// Namespace zm_towers_narrative/zm_towers_narrative
// Params 0, eflags: 0x1 linked
// Checksum 0x7c83c1f0, Offset: 0x3da8
// Size: 0x174
function scepter_think() {
    level endon(#"end_game");
    if (zm_utility::is_ee_enabled()) {
        callback::on_connect(&function_cab1990a);
        array::thread_all(level.players, &function_cab1990a);
        level flag::wait_till(#"hash_4863d7214aa660e2");
        callback::remove_on_connect(&function_cab1990a);
        var_656fdc6c = getent("nardel", "targetname");
        var_656fdc6c delete();
        mdl_frame = getent("narsho", "targetname");
        mdl_frame show();
    }
    vol_roof = getent("vol_narrative_wipe", "targetname");
    vol_roof delete();
}

// Namespace zm_towers_narrative/zm_towers_narrative
// Params 0, eflags: 0x1 linked
// Checksum 0x85bbd781, Offset: 0x3f28
// Size: 0x23e
function function_cab1990a() {
    self notify("68d0201c4315e715");
    self endon("68d0201c4315e715");
    level endon(#"end_game", #"hash_4863d7214aa660e2");
    self endon(#"disconnect");
    vol_roof = getent("vol_narrative_wipe", "targetname");
    while (true) {
        while (!(isdefined(self.var_1de56cc8) && self.var_1de56cc8)) {
            waitframe(1);
        }
        b_tracking = 0;
        while (isdefined(self.var_1de56cc8) && self.var_1de56cc8) {
            v_origin = self getweaponmuzzlepoint();
            v_dir = self getweaponforwarddir();
            a_trace = beamtrace(v_origin, v_origin + v_dir * 20000, 1, self);
            v_hit = a_trace[#"position"];
            if (isdefined(v_hit) && istouching(v_hit, vol_roof)) {
                if (!b_tracking) {
                    b_tracking = 1;
                    n_start_time = gettime();
                }
                n_current_time = gettime();
                n_time_passed = n_current_time - n_start_time;
                n_time_passed = float(n_time_passed) / 1000;
                if (n_time_passed >= 6) {
                    level flag::set(#"hash_4863d7214aa660e2");
                    return;
                }
            } else {
                b_tracking = 0;
            }
            waitframe(1);
        }
    }
}

// Namespace zm_towers_narrative/zm_towers_narrative
// Params 0, eflags: 0x1 linked
// Checksum 0x480a893b, Offset: 0x4170
// Size: 0x43c
function function_b315d709() {
    level.s_remus = spawnstruct();
    level.s_remus.var_12b6c455 = 1;
    level.s_remus.a_objects = [];
    level.s_remus.a_objects[1] = getent("t_narrative_25", "targetname");
    level.s_remus.a_objects[2] = getent("mdl_note_2", "targetname");
    level.s_remus.a_objects[3] = getent("mdl_blade_traps", "targetname");
    level.s_remus.a_objects[4] = getent("mdl_tattle_tale", "targetname");
    level.s_remus.a_objects[5] = struct::get("s_note_wall_1");
    level.s_remus.a_objects[6] = struct::get("s_note_wall_2");
    level.s_remus.a_objects[7] = struct::get("s_note_wall_3");
    level.s_remus.a_objects[8] = struct::get("s_note_wall_4");
    level.s_remus.a_objects[9] = struct::get("s_note_serpent");
    level.s_remus.a_objects[10] = struct::get("s_note_blood");
    level.s_remus.a_objects[11] = struct::get("s_note_steel");
    level.s_remus.a_objects[12] = struct::get("s_note_observe");
    level.s_remus.a_objects[13] = struct::get("s_note_reveal");
    level.s_remus.a_objects[14] = getent("reveal_blocker", "targetname");
    if (!zm_utility::is_ee_enabled()) {
        for (i = 2; i < 14; i++) {
            e_object = level.s_remus.a_objects[i];
            if (isentity(e_object)) {
                e_object delete();
            }
        }
        level.s_remus.a_objects = undefined;
        return;
    }
    level.s_remus.a_objects[2] hide();
    level.s_remus.a_objects[3] hide();
    level.s_remus.a_objects[4] hide();
    level thread function_98d6ce32();
}

// Namespace zm_towers_narrative/zm_towers_narrative
// Params 0, eflags: 0x1 linked
// Checksum 0xbd5bf489, Offset: 0x45b8
// Size: 0x4b2
function function_98d6ce32() {
    trigger::wait_till("t_narrative_25", "targetname");
    function_801b77c0();
    trigger::wait_till("t_rempar_2", "targetname");
    function_801b77c0();
    trigger::wait_till("bladrem", "targetname");
    function_801b77c0();
    trigger::wait_till("remled", "targetname");
    function_2cb83322(#"hash_1404102ec1359017", #"hash_71fcbb6090ff031e");
    function_2cb83322(#"hash_1736e8c7a79a7db8", #"hash_2251bd5cecd3ebdb");
    function_2cb83322(#"hash_642834b4c1587ac9", #"hash_6b02638730f2f88c");
    function_2cb83322(#"hash_4ccddcb7cba5b2d2", #"hash_2897f70604cc0fb6");
    level.var_b2b15659 = 1;
    s_remus = level.s_remus.a_objects[level.s_remus.var_12b6c455];
    playsoundatposition(#"hash_2897f80604cc1169", s_remus.origin);
    function_d24a0f09(#"hash_2897f80604cc1169");
    playsoundatposition(#"hash_2897f50604cc0c50", s_remus.origin);
    function_d24a0f09(#"hash_2897f50604cc0c50");
    level.var_b2b15659 = 0;
    function_d6e81c01(#"hash_4832047b1941ace1", #"hash_3501eab062d8e553");
    function_d6e81c01(#"hash_2ee2e728ad3b547e", #"hash_4aca0608bf4fa64e");
    function_d6e81c01(#"hash_48477035102bb86f", #"hash_38bae751fa353d99");
    function_d6e81c01(#"hash_49fb781467abd24c", #"hash_634818c98eff6728");
    var_2cff1c1e = getent("mdl_massage_wall", "targetname");
    var_2cff1c1e clientfield::set("" + #"hash_2407f687f7d24a83", 1);
    level.s_remus.var_12b6c455++;
    level.s_remus.a_objects[level.s_remus.var_12b6c455] zm_unitrigger::function_fac87205("");
    level.s_remus.var_12b6c455++;
    level.var_b2b15659 = 1;
    s_skull = struct::get("s_remvox");
    playsoundatposition(#"hash_46233f5f75541000", s_skull.origin);
    function_d24a0f09(#"hash_46233f5f75541000");
    mdl_wall = level.s_remus.a_objects[level.s_remus.var_12b6c455];
    mdl_wall scene::play(#"p8_fxanim_zm_towers_wall_2_bundle", mdl_wall);
    level.var_b2b15659 = 0;
}

// Namespace zm_towers_narrative/zm_towers_narrative
// Params 0, eflags: 0x1 linked
// Checksum 0x6be4c38c, Offset: 0x4a78
// Size: 0x4c
function function_801b77c0() {
    level.s_remus.var_12b6c455++;
    level.s_remus.a_objects[level.s_remus.var_12b6c455] show();
}

// Namespace zm_towers_narrative/zm_towers_narrative
// Params 2, eflags: 0x1 linked
// Checksum 0xfe4c542a, Offset: 0x4ad0
// Size: 0x18a
function function_2cb83322(var_1600546f, var_759598cf) {
    level.s_remus.var_12b6c455++;
    s_crying = level.s_remus.a_objects[level.s_remus.var_12b6c455];
    var_9185084 = spawn("script_origin", s_crying.origin);
    level thread function_415b58b1(var_1600546f, s_crying, var_9185084);
    s_crying zm_unitrigger::function_fac87205("");
    level notify(#"quit_crying");
    var_9185084 stopsounds();
    playsoundatposition(#"hash_70d9fd993e01154d", s_crying.origin);
    wait 0.75;
    level.var_b2b15659 = 1;
    playsoundatposition(var_759598cf, s_crying.origin);
    function_d24a0f09(var_759598cf);
    var_9185084 delete();
    level.var_b2b15659 = 0;
}

// Namespace zm_towers_narrative/zm_towers_narrative
// Params 3, eflags: 0x1 linked
// Checksum 0x7048a09a, Offset: 0x4c68
// Size: 0x6e
function function_415b58b1(var_1600546f, s_crying, var_9185084) {
    level endon(#"game_end", #"quit_crying");
    while (true) {
        var_9185084 playsound(var_1600546f);
        wait 12;
    }
}

// Namespace zm_towers_narrative/zm_towers_narrative
// Params 2, eflags: 0x1 linked
// Checksum 0x1c623421, Offset: 0x4ce0
// Size: 0x192
function function_d6e81c01(var_cc9813c7, var_e504825e) {
    level.var_b2b15659 = 1;
    playsoundatposition(var_cc9813c7, level.s_remus.a_objects[level.s_remus.var_12b6c455].origin);
    function_d24a0f09(var_cc9813c7);
    level.var_b2b15659 = 0;
    level.s_remus.var_12b6c455++;
    e_activator = level.s_remus.a_objects[level.s_remus.var_12b6c455] zm_unitrigger::function_fac87205("");
    e_activator playsoundtoplayer(#"hash_cfcdb12c4cc0476", e_activator);
    wait 4;
    if (isdefined(var_e504825e)) {
        level.var_b2b15659 = 1;
        playsoundatposition(var_e504825e, level.s_remus.a_objects[level.s_remus.var_12b6c455].origin);
        function_d24a0f09(var_e504825e);
        level.var_b2b15659 = 0;
    }
}

