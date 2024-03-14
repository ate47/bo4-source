// Atian COD Tools GSC decompiler test
#using script_7c62f55ce3a557ff;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_customgame.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_1063645;

// Namespace namespace_1063645/namespace_fdf9d496
// Params 0, eflags: 0x1 linked
// Checksum 0xca5ef457, Offset: 0x298
// Size: 0x84
function init_clientfields() {
    clientfield::register("scriptmover", "" + #"hash_3e57db9b106dff0a", 1, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_4ccf2ce25e0dc836", 1, 1, "int");
}

// Namespace namespace_1063645/namespace_fdf9d496
// Params 0, eflags: 0x1 linked
// Checksum 0x40a60f52, Offset: 0x328
// Size: 0x272
function function_fb0bd6b9() {
    if (zm_utility::is_standard()) {
        return;
    }
    if (zm_utility::is_ee_enabled() || zm_utility::is_trials()) {
        level.var_d8e7f0cf[0] = array(1, 1, 5);
        level.var_d8e7f0cf[1] = array(8, 7, 2);
        level.var_d8e7f0cf[2] = array(6, 6, 6);
    }
    level flag::init(#"hash_6429ffd7bef6f720");
    level flag::init(#"hash_7ebd1255a2e91e3e");
    level flag::init(#"hash_795bde5570f8b67c");
    var_5554a9f4 = getent("nixie_door_trigger", "targetname");
    var_5554a9f4 thread _goodlighting_hangar_a();
    var_679f0ee5 = struct::get_array("nixie_tubes", "script_noteworthy");
    foreach (s_tube in var_679f0ee5) {
        mdl_tube = util::spawn_model(#"p8_zm_esc_nixie_tubes", s_tube.origin, s_tube.angles);
        mdl_tube.script_noteworthy = "blast_attack_interactables";
        mdl_tube.script_string = "mdl_nixie_tubes";
        s_tube.mdl_tube = mdl_tube;
    }
}

// Namespace namespace_1063645/namespace_fdf9d496
// Params 0, eflags: 0x1 linked
// Checksum 0x4da3e117, Offset: 0x5a8
// Size: 0x464
function _goodlighting_hangar_a() {
    self sethintstring(#"hash_2f5a14e8bf175422");
    self.var_c6613c99 = 0;
    level flag::wait_till(#"hash_7039457b1cc827de");
    if (function_8b1a219a()) {
        self sethintstring(#"hash_749f3ae6e6a73762");
    } else {
        self sethintstring(#"hash_7b303154f29d09c6");
    }
    self waittill(#"trigger");
    mdl_lock = getent("masterkey_lock_3", "targetname");
    if (isdefined(mdl_lock)) {
        mdl_lock delete();
    }
    playsoundatposition(#"hash_b0382b7432f8232", self.origin);
    mdl_door_left = getent("nixie_door_left", "targetname");
    mdl_door_right = getent("nixie_door_right", "targetname");
    mdl_door_left notsolid();
    mdl_door_right notsolid();
    mdl_door_left rotateyaw(-94, 1, 0.2, 0.2);
    mdl_door_right rotateyaw(195, 1, 0.2, 0.2);
    level thread function_152c339e();
    self delete();
    level flag::set(#"hash_6429ffd7bef6f720");
    level thread function_89f2ec87();
    wait(1);
    mdl_door_left rotateyaw(8, 1, 0.2, 0.2);
    mdl_door_right rotateyaw(-10, 1, 0.2, 0.2);
    wait(1);
    mdl_door_left rotateyaw(-5, 1, 0.2, 0.2);
    mdl_door_right rotateyaw(7, 1, 0.2, 0.2);
    wait(1);
    mdl_door_left rotateyaw(3, 1, 0.2, 0.2);
    mdl_door_right rotateyaw(-5, 1, 0.2, 0.2);
    wait(1);
    mdl_door_left rotateyaw(-2, 1, 0.2, 0.2);
    mdl_door_right rotateyaw(3, 1, 0.2, 0.2);
}

// Namespace namespace_1063645/namespace_fdf9d496
// Params 0, eflags: 0x1 linked
// Checksum 0xaf4d805d, Offset: 0xa18
// Size: 0x12c
function function_89f2ec87() {
    while (true) {
        a_mdl_tubes = getentarray("mdl_nixie_tubes", "script_string");
        foreach (mdl_tube in a_mdl_tubes) {
            mdl_tube thread function_e5c8fd1d();
        }
        level waittill(#"hash_dfac532bccdb293");
        function_97f8efcd();
        level thread function_ca5612ce(a_mdl_tubes);
        level flag::wait_till_clear(#"hash_7ebd1255a2e91e3e");
        function_172e72fa();
        level notify(#"hash_59db65b924f851e4");
    }
}

// Namespace namespace_1063645/namespace_fdf9d496
// Params 0, eflags: 0x1 linked
// Checksum 0x4e1e7b31, Offset: 0xb50
// Size: 0x70
function function_e5c8fd1d() {
    level endon(#"hash_7ebd1255a2e91e3e");
    self waittill(#"blast_attack");
    self thread clientfield::set("" + #"hash_4ccf2ce25e0dc836", 1);
    level notify(#"hash_dfac532bccdb293");
}

// Namespace namespace_1063645/namespace_fdf9d496
// Params 0, eflags: 0x1 linked
// Checksum 0x22a99c7, Offset: 0xbc8
// Size: 0x1c8
function function_97f8efcd() {
    var_120c4733 = struct::get_array("nixie_tubes", "script_noteworthy");
    foreach (s_tube in var_120c4733) {
        mdl_tube = s_tube.mdl_tube;
        mdl_tube setmodel(#"p8_zm_esc_nixie_tubes_on");
        s_tube thread function_ba25a76f(0.75);
        if (s_tube.targetname == "nixie_tube_2") {
            s_tube thread function_d6ae109c(1);
        }
        s_target = struct::get(s_tube.target);
        var_68c9a993 = util::spawn_model(#"p8_zm_esc_nixie_tubes", s_target.origin, s_target.angles);
        s_tube.mdl_tube.var_68c9a993 = var_68c9a993;
        var_68c9a993 ghost();
        var_68c9a993 notsolid();
    }
    wait(0.75);
}

// Namespace namespace_1063645/namespace_fdf9d496
// Params 1, eflags: 0x1 linked
// Checksum 0x9ef6a012, Offset: 0xd98
// Size: 0x148
function function_ca5612ce(a_mdl_tubes) {
    level endon(#"hash_59db65b924f851e4", #"hash_795bde5570f8b67c");
    level flag::set(#"hash_7ebd1255a2e91e3e");
    wait(25);
    level flag::wait_till_clear(#"hash_795bde5570f8b67c");
    level flag::clear(#"hash_7ebd1255a2e91e3e");
    var_3c04def5 = array::random(a_mdl_tubes);
    e_closest_player = arraygetclosest(var_3c04def5.origin, level.players);
    if (isalive(e_closest_player)) {
        e_closest_player thread zm_audio::create_and_play_dialog(#"negative_resp", #"generic");
    }
    level notify(#"hash_59db65b924f851e4");
}

// Namespace namespace_1063645/namespace_fdf9d496
// Params 0, eflags: 0x1 linked
// Checksum 0x9948cc46, Offset: 0xee8
// Size: 0x1d8
function function_172e72fa() {
    var_120c4733 = struct::get_array("nixie_tubes", "script_noteworthy");
    foreach (s_tube in var_120c4733) {
        s_tube.script_int = 0;
        mdl_tube = s_tube.mdl_tube;
        mdl_tube setmodel(#"p8_zm_esc_nixie_tubes");
        for (i = 0; i < 10; i++) {
            mdl_tube hidepart("tag_nixie_" + i);
        }
        mdl_tube thread clientfield::set("" + #"hash_4ccf2ce25e0dc836", 0);
        mdl_tube showpart("tag_nixie_off");
        if (s_tube.targetname == "nixie_tube_2") {
            s_tube thread function_d6ae109c(0);
        }
        if (isdefined(s_tube.mdl_tube.var_68c9a993)) {
            s_tube.mdl_tube.var_68c9a993 delete();
        }
    }
}

// Namespace namespace_1063645/namespace_fdf9d496
// Params 2, eflags: 0x1 linked
// Checksum 0xbd1bd441, Offset: 0x10c8
// Size: 0x21e
function function_ba25a76f(n_max_time, var_62002857 = 0) {
    mdl_tube = self.mdl_tube;
    mdl_tube hidepart("tag_nixie_off");
    n_start_time = gettime();
    n_total_time = 0;
    var_cddd0f11 = self.script_int;
    while (n_total_time < n_max_time) {
        for (n_part = randomint(10); n_part == var_cddd0f11; n_part = randomint(10)) {
        }
        mdl_tube showpart("tag_nixie_" + n_part);
        if (isdefined(var_cddd0f11)) {
            mdl_tube hidepart("tag_nixie_" + var_cddd0f11);
        }
        mdl_tube playsound(#"hash_12da80f02ef99473");
        var_cddd0f11 = n_part;
        wait(0.1);
        n_current_time = gettime();
        n_total_time = (n_current_time - n_start_time) / 1000;
    }
    for (i = 1; i < 10; i++) {
        mdl_tube hidepart("tag_nixie_" + i);
    }
    mdl_tube showpart("tag_nixie_" + var_62002857);
    mdl_tube playsound(#"hash_12da80f02ef99473");
    self.script_int = 0;
}

// Namespace namespace_1063645/namespace_fdf9d496
// Params 1, eflags: 0x1 linked
// Checksum 0x2bae6e75, Offset: 0x12f0
// Size: 0xfc
function function_d6ae109c(b_turn_on) {
    if (b_turn_on) {
        self.e_sound = spawn("script_origin", self.origin);
        playsoundatposition(#"hash_5870f3024077503", self.origin);
        self.e_sound playloopsound(#"hash_589f33024097b46");
        return;
    }
    if (isdefined(self.e_sound)) {
        playsoundatposition(#"hash_6c0f63cd38c393e7", self.origin);
        self.e_sound stoploopsound();
        wait(0.5);
        self.e_sound delete();
    }
}

// Namespace namespace_1063645/namespace_fdf9d496
// Params 0, eflags: 0x1 linked
// Checksum 0xb06c9935, Offset: 0x13f8
// Size: 0x12c
function function_152c339e() {
    var_18b64c03 = struct::get("nixie_tube_2");
    var_18b64c03.unitrigger_stub = var_18b64c03 zm_unitrigger::create(&function_bad2e505, (128, 64, 96), &function_290d172d);
    var_18b64c03.unitrigger_stub.cursor_hint = "HINT_NOICON";
    var_18b64c03.unitrigger_stub.targetname = var_18b64c03.script_string;
    var_18b64c03.unitrigger_stub.s_tube = var_18b64c03;
    v_pos = var_18b64c03.origin + anglestoright(var_18b64c03.angles) * 24;
    var_18b64c03.unitrigger_stub.origin = v_pos;
    zm_unitrigger::unitrigger_force_per_player_triggers(var_18b64c03.unitrigger_stub, 1);
}

// Namespace namespace_1063645/namespace_fdf9d496
// Params 1, eflags: 0x1 linked
// Checksum 0x3cadfd5f, Offset: 0x1530
// Size: 0x150
function function_bad2e505(player) {
    if (level flag::get(#"hash_7ebd1255a2e91e3e") && !level flag::get(#"hash_795bde5570f8b67c")) {
        self setvisibletoplayer(player);
        switch (self.targetname) {
        case #"nixie_tube_trigger_1":
            self sethintstring(#"");
            break;
        case #"nixie_tube_trigger_2":
            self sethintstring(#"");
            break;
        case #"nixie_tube_trigger_3":
            self sethintstring(#"");
            break;
        }
        return 1;
    }
    self setinvisibletoplayer(player);
    return 0;
}

// Namespace namespace_1063645/namespace_fdf9d496
// Params 0, eflags: 0x1 linked
// Checksum 0xe90df998, Offset: 0x1688
// Size: 0x31e
function function_290d172d() {
    function_dae4ab9b(self, 0.05);
    a_s_tubes = struct::get_array("nixie_tubes", "script_noteworthy");
    while (true) {
        s_result = undefined;
        s_result = self waittill(#"trigger");
        a_s_tubes = struct::get_array("nixie_tubes", "script_noteworthy");
        foreach (s_tube in a_s_tubes) {
            var_dc40fc85 = s_tube.mdl_tube sightconetrace(s_result.activator getweaponmuzzlepoint(), s_result.activator, s_result.activator getweaponforwarddir(), 15);
            if (isdefined(s_tube.mdl_tube.var_68c9a993)) {
                var_6c48173b = s_tube.mdl_tube.var_68c9a993 sightconetrace(s_result.activator getweaponmuzzlepoint(), s_result.activator, s_result.activator getweaponforwarddir(), 20);
            }
            if (isdefined(var_dc40fc85) && var_dc40fc85 || isdefined(var_6c48173b) && var_6c48173b) {
                s_tube.mdl_tube hidepart("tag_nixie_" + s_tube.script_int);
                s_tube.script_int = (s_tube.script_int + 1) % 10;
                s_tube.mdl_tube showpart("tag_nixie_" + s_tube.script_int);
                s_tube.mdl_tube playsound(#"hash_1aead9e7cdebe7d2");
                break;
            }
        }
        if (zm_utility::is_ee_enabled() || zm_utility::is_trials()) {
            level thread function_bbca669b(s_result.activator);
        }
        waitframe(1);
    }
}

// Namespace namespace_1063645/namespace_fdf9d496
// Params 1, eflags: 0x1 linked
// Checksum 0xd7352ff2, Offset: 0x19b0
// Size: 0x74
function function_bbca669b(e_activator) {
    level notify(#"hash_2f586f8df1e6596d");
    level endon(#"hash_2f586f8df1e6596d", #"hash_59db65b924f851e4", #"hash_f787bd652d7a4b");
    wait(2);
    level thread function_c1cc29be(e_activator);
}

// Namespace namespace_1063645/namespace_fdf9d496
// Params 1, eflags: 0x1 linked
// Checksum 0xac90620d, Offset: 0x1a30
// Size: 0x5b4
function function_c1cc29be(e_activator) {
    level endon(#"hash_59db65b924f851e4");
    level notify(#"hash_f787bd652d7a4b");
    var_4f5b63ea = struct::get("nixie_tube_1");
    var_83aecc80 = struct::get("nixie_tube_2");
    var_31a8a875 = struct::get("nixie_tube_3");
    var_8171dd3a = var_4f5b63ea.script_int;
    var_8dfff656 = var_83aecc80.script_int;
    var_44e1e41b = var_31a8a875.script_int;
    var_bbcf512c = 0;
    var_954ac27a = 0;
    if (var_8171dd3a == var_4f5b63ea.var_825e7054 && var_8dfff656 == var_83aecc80.var_825e7054 && var_44e1e41b == var_31a8a875.var_825e7054) {
        var_bbcf512c = 1;
    } else {
        for (i = 0; i < level.var_d8e7f0cf.size; i++) {
            if (var_8171dd3a == level.var_d8e7f0cf[i][0] && var_8dfff656 == level.var_d8e7f0cf[i][1] && var_44e1e41b == level.var_d8e7f0cf[i][2]) {
                if (var_8171dd3a == 9 && var_8dfff656 == 3 && var_44e1e41b == 5 && isdefined(level.var_461a9705) && level.var_461a9705) {
                    var_954ac27a = 0;
                    continue;
                }
                if (var_8171dd3a == 6 && var_8dfff656 == 6 && var_44e1e41b == 6 && isdefined(level.var_19fe84f5) && level.var_19fe84f5) {
                    var_954ac27a = 1;
                    var_b402acf2 = 1;
                    continue;
                }
                var_954ac27a = 1;
            }
        }
    }
    if (var_954ac27a || var_bbcf512c && !level flag::get(#"hash_ed90925c898d1b0")) {
        var_3f6f6d2c = 1;
    }
    if (isdefined(var_3f6f6d2c) && var_3f6f6d2c) {
        level flag::set(#"hash_795bde5570f8b67c");
        if (isalive(e_activator) && !(isdefined(var_b402acf2) && var_b402acf2)) {
            e_activator thread zm_audio::create_and_play_dialog(#"success_resp", #"generic");
        }
        var_4f5b63ea thread function_4b17c9f6(1.5);
        var_83aecc80 thread function_4b17c9f6(1.5);
        var_31a8a875 thread function_4b17c9f6(1.5);
        wait(1.5 + 0.25);
        var_62002857 = 0;
        if (var_954ac27a) {
            str_code = "" + var_8171dd3a + var_8dfff656 + var_44e1e41b;
            level thread function_a5d20d9b(str_code);
            if (str_code == "115" && !(isdefined(level.var_4f8596bf) && level.var_4f8596bf)) {
                var_62002857 = 6;
            }
        }
        var_4f5b63ea function_ba25a76f(0.75, var_62002857);
        var_83aecc80 function_ba25a76f(0.75, var_62002857);
        var_31a8a875 function_ba25a76f(0.75, var_62002857);
        wait(2);
        if (var_bbcf512c && level flag::exists(#"hash_ed90925c898d1b0") && !level flag::get(#"hash_ed90925c898d1b0")) {
            level flag::set(#"hash_ed90925c898d1b0");
        }
        level flag::clear(#"hash_795bde5570f8b67c");
        level flag::clear(#"hash_7ebd1255a2e91e3e");
    }
}

// Namespace namespace_1063645/namespace_fdf9d496
// Params 1, eflags: 0x1 linked
// Checksum 0x4ad3cf4e, Offset: 0x1ff0
// Size: 0xda
function function_a5d20d9b(str_code) {
    level notify(#"hash_1ba800da972b0558", {#str_code:str_code});
    switch (str_code) {
    case #"115":
        level thread music_ee();
        break;
    case #"872":
        level thread function_f2f53f97();
        break;
    case #"666":
        level thread function_15aa00e7();
        break;
    default:
        break;
    }
}

// Namespace namespace_1063645/namespace_fdf9d496
// Params 0, eflags: 0x1 linked
// Checksum 0x50883539, Offset: 0x20d8
// Size: 0x6c
function music_ee() {
    if (isdefined(level.var_4f8596bf) && level.var_4f8596bf) {
        return;
    }
    level.var_4f8596bf = 1;
    level thread zm_audio::sndmusicsystem_stopandflush();
    waitframe(1);
    level thread zm_audio::sndmusicsystem_playstate("ee_song");
}

// Namespace namespace_1063645/namespace_fdf9d496
// Params 0, eflags: 0x5 linked
// Checksum 0xba05ca97, Offset: 0x2150
// Size: 0x204
function private function_f2f53f97() {
    if (isdefined(level.var_461a9705) && level.var_461a9705) {
        return;
    }
    level.var_461a9705 = 1;
    s_spawn_location = struct::get("nixie_tube_zombie_blood_start");
    var_9c0bf2db = util::spawn_model(s_spawn_location.model, s_spawn_location.origin, s_spawn_location.angles);
    var_9c0bf2db clientfield::set("" + #"hash_3e57db9b106dff0a", 1);
    for (s_target = struct::get(s_spawn_location.target); isdefined(s_target); s_target = struct::get(s_target.target)) {
        n_time = distance(var_9c0bf2db.origin, s_target.origin) / 300;
        var_9c0bf2db moveto(s_target.origin, n_time);
        var_9c0bf2db waittill(#"movedone");
    }
    e_powerup = zm_powerups::specific_powerup_drop("zombie_blood", var_9c0bf2db.origin - vectorscale((0, 0, 1), 40));
    var_9c0bf2db delete();
    level thread function_25aaae40();
    e_powerup thread function_f50cec70();
}

// Namespace namespace_1063645/namespace_fdf9d496
// Params 0, eflags: 0x5 linked
// Checksum 0x5aae5cf8, Offset: 0x2360
// Size: 0x26
function private function_25aaae40() {
    level waittill(#"between_round_over");
    level.var_461a9705 = undefined;
}

// Namespace namespace_1063645/namespace_fdf9d496
// Params 0, eflags: 0x5 linked
// Checksum 0xf7703b25, Offset: 0x2390
// Size: 0x146
function private function_15aa00e7() {
    var_43b4f0a = struct::get("nixie_tube_2");
    playsoundatposition(#"hash_1588095b858588d", var_43b4f0a.origin);
    if (!(isdefined(level.var_19fe84f5) && level.var_19fe84f5)) {
        if (zm_zonemgr::get_players_in_zone("zone_citadel_stairs") > 0) {
            level.var_19fe84f5 = zombie_brutus_util::attempt_brutus_spawn(1, "zone_citadel_stairs");
            return;
        }
        if (zm_zonemgr::get_players_in_zone("zone_citadel_basement") > 0) {
            level.var_19fe84f5 = zombie_brutus_util::attempt_brutus_spawn(1, "zone_citadel_basement");
            return;
        }
        if (zm_zonemgr::get_players_in_zone("zone_citadel") > 0) {
            level.var_19fe84f5 = zombie_brutus_util::attempt_brutus_spawn(1, "zone_citadel");
        }
    }
}

// Namespace namespace_1063645/namespace_fdf9d496
// Params 0, eflags: 0x5 linked
// Checksum 0x63d810c3, Offset: 0x24e0
// Size: 0xec
function private function_f50cec70() {
    if (!isdefined(level.var_988ed695)) {
        level.var_988ed695 = 0;
    }
    s_result = undefined;
    s_result = self waittill(#"powerup_timedout", #"powerup_grabbed");
    if (s_result._notify !== "powerup_grabbed" || level.var_988ed695 > 2) {
        return;
    }
    level.var_988ed695++;
    zm_vo::function_3c173d37(s_result.e_grabber.origin, 512);
    s_result.e_grabber zm_vo::function_a2bd5a0c(#"hash_6ae96725c891addc", 0, 1, 9999);
}

// Namespace namespace_1063645/namespace_fdf9d496
// Params 1, eflags: 0x1 linked
// Checksum 0x64818ce0, Offset: 0x25d8
// Size: 0x1ec
function function_4b17c9f6(n_max_time) {
    mdl_tube = self.mdl_tube;
    n_start_time = gettime();
    n_total_time = 0;
    var_cddd0f11 = undefined;
    b_hidden = 1;
    var_9229dbba = randomfloat(0.2);
    wait(var_9229dbba);
    n_current_time = gettime();
    for (n_total_time = (n_current_time - n_start_time) / 1000; n_total_time < n_max_time; n_total_time = (n_current_time - n_start_time) / 1000) {
        if (b_hidden) {
            mdl_tube hidepart("tag_nixie_" + self.script_int);
            mdl_tube showpart("tag_nixie_off");
            b_hidden = 0;
        } else {
            mdl_tube showpart("tag_nixie_" + self.script_int);
            mdl_tube hidepart("tag_nixie_off");
            b_hidden = 1;
            mdl_tube playsound(#"hash_12da80f02ef99473");
        }
        wait(0.1);
        n_current_time = gettime();
    }
    mdl_tube showpart("tag_nixie_" + self.script_int);
    mdl_tube hidepart("tag_nixie_off");
}

// Namespace namespace_1063645/namespace_fdf9d496
// Params 0, eflags: 0x0
// Checksum 0x58a2fb37, Offset: 0x27d0
// Size: 0x11e
function function_a23db4d2() {
    mdl_tube = self.mdl_tube;
    for (i = 0; i < 10; i++) {
        mdl_tube hidepart("tag_nixie_" + i);
    }
    mdl_tube hidepart("tag_nixie_off");
    for (i = 0; i <= self.script_int; i++) {
        if (i > 0) {
            mdl_tube hidepart("tag_nixie_" + i - 1);
        }
        mdl_tube showpart("tag_nixie_" + i);
        mdl_tube playsound(#"hash_12da80f02ef99473");
        wait(0.1);
    }
}

// Namespace namespace_1063645/namespace_fdf9d496
// Params 3, eflags: 0x1 linked
// Checksum 0x3c5f07e7, Offset: 0x28f8
// Size: 0x186
function function_aac7105a(var_8171dd3a, var_8dfff656, var_44e1e41b) {
    var_f5c4e913 = 1;
    if (var_8171dd3a == 0 || var_8dfff656 == 0 || var_44e1e41b == 0) {
        var_f5c4e913 = 0;
    }
    if (var_8171dd3a == 0 && var_8dfff656 == 0 && var_44e1e41b == 0) {
        var_f5c4e913 = 0;
    }
    if (var_8171dd3a == 6 && var_8dfff656 == 6 && var_44e1e41b == 6) {
        var_f5c4e913 = 0;
    }
    if (var_8171dd3a == 7 && var_8dfff656 == 7 && var_44e1e41b == 7) {
        var_f5c4e913 = 0;
    }
    for (i = 0; i < level.var_d8e7f0cf.size; i++) {
        if (var_8171dd3a == level.var_d8e7f0cf[i][0] && var_8dfff656 == level.var_d8e7f0cf[i][1] && var_44e1e41b == level.var_d8e7f0cf[i][2]) {
            var_f5c4e913 = 0;
            break;
        }
    }
    return var_f5c4e913;
}

