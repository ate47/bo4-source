// Atian COD Tools GSC decompiler test
#using scripts\zm\perk\zm_perk_mod_additionalprimaryweapon.gsc;
#using scripts\zm\zm_hms_util.gsc;
#using script_5f9141e04e4e94a2;
#using scripts\zm\zm_white_main_quest.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_white_util;

// Namespace zm_white_util/zm_white_util
// Params 0, eflags: 0x1 linked
// Checksum 0xb3682777, Offset: 0x398
// Size: 0x52c
function init() {
    level.var_d2ed4be7 = array(#"zombie", #"mannequin");
    callback::on_spawned(&function_ea6a4006);
    level.var_5dd0d3ff = spawn("script_origin", (0, 0, 0));
    level.var_5dd0d3ff.name = "rush";
    level.var_5dd0d3ff.isspeaking = 0;
    level.var_5dd0d3ff.var_5b6ebfd0 = 0;
    level.var_8200dc81 = spawn("script_origin", (0, 0, 0));
    level.var_8200dc81.name = "ncom";
    level.var_8200dc81.isspeaking = 0;
    level.var_8200dc81.var_5b6ebfd0 = 0;
    level.var_170ea961 = getent("atlas_ct", "targetname");
    level.var_170ea961.name = "mcca";
    level.var_170ea961.isspeaking = 0;
    level.var_170ea961.var_5b6ebfd0 = 0;
    level.a_w_ray_guns = [];
    level.a_w_ray_guns[0] = getweapon("ray_gun");
    level.a_w_ray_guns[1] = getweapon("ray_gun_upgraded");
    level.a_w_ray_guns[2] = getweapon("ray_gun_mk2");
    level.a_w_ray_guns[3] = getweapon("ray_gun_mk2_upgraded");
    level.a_w_ray_guns[4] = getweapon("ray_gun_mk2v");
    level.a_w_ray_guns[5] = getweapon("ray_gun_mk2v_upgraded");
    level.a_w_ray_guns[6] = getweapon("ray_gun_mk2x");
    level.a_w_ray_guns[7] = getweapon("ray_gun_mk2x_dw");
    level.a_w_ray_guns[8] = getweapon("ray_gun_mk2y");
    level.a_w_ray_guns[9] = getweapon("ray_gun_mk2y_upgraded");
    level.a_w_ray_guns[10] = getweapon("ray_gun_mk2z");
    level.a_w_ray_guns[11] = getweapon("ray_gun_mk2z_upgraded");
    level.var_65b6264d = array(level.a_w_ray_guns[0], level.a_w_ray_guns[1], level.a_w_ray_guns[2], level.a_w_ray_guns[3]);
    level.var_584a3e61 = array(level.a_w_ray_guns[4], level.a_w_ray_guns[5], level.a_w_ray_guns[6], level.a_w_ray_guns[7], level.a_w_ray_guns[8], level.a_w_ray_guns[9], level.a_w_ray_guns[10], level.a_w_ray_guns[11]);
    zm_perk_mod_additionalprimaryweapon::function_69f490a(level.var_584a3e61);
    level.var_ee565b3f = &function_8a4b7d4a;
    level.var_bb2323e4 = &function_afbd7223;
    level flag::init(#"hash_595f26b382ef7867");
    level flag::init(#"hash_3a183a144032bbf3");
    callback::on_ai_spawned(&on_ai_spawned);
}

// Namespace zm_white_util/zm_white_util
// Params 0, eflags: 0x1 linked
// Checksum 0xf244589d, Offset: 0x8d0
// Size: 0x1a4
function function_ea6a4006() {
    self zm_audio::function_6191af93(#"surrounded", #"self", #"oh", #"shit", 100);
    self zm_audio::function_6191af93(#"magicbox", #"homunculus", #"magicbox", #"monkey", 100);
    self zm_audio::function_6191af93(#"kill", #"homunculus", #"kill", #"monkey", 100);
    self zm_audio::function_6191af93(#"kill", #"ray_gun_mk2", #"kill", #"raygun_mk2", 100);
    self zm_audio::function_87714659(&function_e08cd7b, #"roundstart", #"special");
}

// Namespace zm_white_util/zm_white_util
// Params 2, eflags: 0x1 linked
// Checksum 0xe21e4ed2, Offset: 0xa80
// Size: 0x3e
function function_e08cd7b(category, subcategory) {
    if (level flag::get("mee_round")) {
        return true;
    }
    return false;
}

// Namespace zm_white_util/zm_white_util
// Params 1, eflags: 0x1 linked
// Checksum 0xb460e73c, Offset: 0xac8
// Size: 0x3a8
function function_5d7d0c85(var_2753f06a) {
    wait(1);
    b_played = 0;
    a_players = arraycopy(level.players);
    if (!isdefined(level.host)) {
        return 0;
    }
    var_5316ea7d = level.host zm_vo::function_82f9bc9f();
    if (a_players.size == 1) {
        e_player = a_players[0];
        if (var_2753f06a == 0) {
            str_suffix = #"vox_solo_game_start_" + var_5316ea7d;
        } else {
            str_suffix = #"vox_solo_end_round" + var_2753f06a + "_" + var_5316ea7d;
        }
        b_played = e_player zm_vo::function_a2bd5a0c(str_suffix, 0, 1);
    } else {
        arrayremovevalue(a_players, level.host);
        if (var_2753f06a == 0) {
            level.host zm_hms_util::function_51b752a9(#"hash_4c0be2bb6d0c80b0" + var_5316ea7d);
            var_d1e952c4 = zm_hms_util::function_3815943c(a_players);
            if (isdefined(var_d1e952c4)) {
                if (var_d1e952c4 zm_vo::function_82f9bc9f() === "rich") {
                    var_d1e952c4 zm_hms_util::function_51b752a9(#"hash_4c0be2bb6d0c80b0" + var_5316ea7d, 5);
                } else {
                    var_d1e952c4 zm_hms_util::function_51b752a9(#"hash_4c0be2bb6d0c80b0" + var_5316ea7d);
                }
            }
            if (var_5316ea7d === "take" && var_d1e952c4 zm_vo::function_82f9bc9f() === "demp") {
                foreach (player in a_players) {
                    if (player zm_vo::function_82f9bc9f() === "rich") {
                        player zm_hms_util::function_51b752a9(#"hash_4c0be2bb6d0c80b0" + var_5316ea7d, 7);
                    }
                }
            }
        } else {
            level.host zm_hms_util::function_51b752a9(#"hash_71bde3a512edb440" + var_2753f06a + "_" + var_5316ea7d);
            var_d1e952c4 = zm_hms_util::function_3815943c(a_players);
            if (isdefined(var_d1e952c4)) {
                var_d1e952c4 zm_hms_util::function_51b752a9(#"hash_71bde3a512edb440" + var_2753f06a + "_" + var_5316ea7d);
            }
        }
        b_played = 1;
    }
    return b_played;
}

// Namespace zm_white_util/zm_white_util
// Params 4, eflags: 0x0
// Checksum 0xa42c6973, Offset: 0xe78
// Size: 0x7c
function function_733a6ab7(e_player, var_50a85511, e_computer, var_21fd1ca8) {
    level endon(#"end_game");
    e_player zm_hms_util::function_51b752a9(var_50a85511);
    wait(1);
    e_computer thread zm_hms_util::function_6a0d675d(var_21fd1ca8, -1, 1);
}

// Namespace zm_white_util/zm_white_util
// Params 3, eflags: 0x0
// Checksum 0x1ee8d918, Offset: 0xf00
// Size: 0xc4
function function_c2cc8e(e_player, var_50a85511, var_21fd1ca8) {
    level endon(#"end_game");
    self endon(#"death", #"player_down", #"disconnect");
    zm_hms_util::function_3c173d37();
    e_player zm_hms_util::function_51b752a9(var_50a85511);
    zm_hms_util::function_3c173d37();
    e_player zm_audio::do_player_or_npc_playvox(var_21fd1ca8, 1);
}

// Namespace zm_white_util/zm_white_util
// Params 1, eflags: 0x1 linked
// Checksum 0x4877608c, Offset: 0xfd0
// Size: 0x94
function function_491673da(var_21fd1ca8) {
    if (isdefined(level.var_3c9cfd6f) && level.var_3c9cfd6f) {
        return;
    }
    level endon(#"end_game");
    self endon(#"death", #"player_down", #"disconnect");
    self zm_audio::do_player_or_npc_playvox(var_21fd1ca8, 1);
}

// Namespace zm_white_util/zm_white_util
// Params 4, eflags: 0x0
// Checksum 0x35040289, Offset: 0x1070
// Size: 0x64
function function_31e7b76f(n_delay, e_computer, var_21fd1ca8, str_cancel) {
    level endon(#"end_game", str_cancel);
    wait(n_delay);
    e_computer thread zm_hms_util::function_6a0d675d(var_21fd1ca8, 0, 1);
}

// Namespace zm_white_util/zm_white_util
// Params 1, eflags: 0x1 linked
// Checksum 0x3c1dd56c, Offset: 0x10e0
// Size: 0x90
function function_ec34b5ee(alias) {
    if (!isdefined(alias)) {
        return;
    }
    if (!isdefined(level.var_e356155f)) {
        level.var_e356155f = 0;
    }
    if (level.var_e356155f == 0) {
        level.var_e356155f = 1;
        level function_2389bb7a(alias);
        level.var_e356155f = 0;
        level notify(#"hash_62d5ef9902abf374");
    }
}

// Namespace zm_white_util/zm_white_util
// Params 1, eflags: 0x1 linked
// Checksum 0xc5470e0e, Offset: 0x1178
// Size: 0xfe
function function_2389bb7a(str_sound) {
    n_wait = float(soundgetplaybacktime(str_sound)) / 1000;
    n_wait = max(n_wait - 0.5, 0.1);
    foreach (player in level.players) {
        player playsoundtoplayer(str_sound, player);
    }
    wait(n_wait);
}

// Namespace zm_white_util/zm_white_util
// Params 0, eflags: 0x1 linked
// Checksum 0xe3405a21, Offset: 0x1280
// Size: 0x1d0
function function_f4a39bc4() {
    level thread function_f2fa71ce();
    function_364cd8c0("apd_lockdown");
    zm_zonemgr::enable_zone("zone_bunker_apd");
    zm_zonemgr::enable_zone("zone_culdesac_green");
    zm_zonemgr::enable_zone("zone_culdesac_yellow");
    zm_zonemgr::enable_zone("zone_angled_house");
    level thread function_612918d9("bunker_door_storage_blocker");
    level thread function_612918d9("bunker_door_solitary_blocker");
    level thread function_bf25aeb1("bunker_door_solitary_lockdown");
    level thread function_bf25aeb1("bunker_door_storage_lockdown");
    level thread function_bf25aeb1("bunker_door_electric");
    a_e_lockdown_doors = getentarray("lockdown_door", "targetname");
    foreach (e_lockdown_door in a_e_lockdown_doors) {
        e_lockdown_door function_46ed91c6();
    }
}

// Namespace zm_white_util/zm_white_util
// Params 0, eflags: 0x0
// Checksum 0x3a5251d4, Offset: 0x1458
// Size: 0x3e
function function_e95d25() {
    /#
        while (true) {
            level waittill(#"open_sesame");
            function_f4a39bc4();
            wait(1);
        }
    #/
}

// Namespace zm_white_util/zm_white_util
// Params 1, eflags: 0x1 linked
// Checksum 0x9e6af25b, Offset: 0x14a0
// Size: 0xc8
function function_6f635c39(str) {
    assert(isdefined(str), "<unknown string>");
    a_doors = getentarray(str, "script_string");
    foreach (door in a_doors) {
        door function_20681be5();
    }
}

// Namespace zm_white_util/zm_white_util
// Params 0, eflags: 0x5 linked
// Checksum 0x5f3b2094, Offset: 0x1570
// Size: 0x196
function private function_20681be5() {
    if (self.b_open == 0) {
        return false;
    }
    destpos = self.origin - (0, 0, self.var_3de056e7);
    self moveto(destpos, 0.5, 0.05, 0.05);
    self playsound(#"evt_bunker_door_interior_close");
    e_collision = getent(self.linkname, "linkto");
    e_collision disconnectpaths();
    if (isdefined(self.var_61e10b48) && isdefined(self.var_d42d6fdf)) {
        level.zones[hash(self.var_61e10b48)].adjacent_zones[hash(self.var_d42d6fdf)].is_connected = 0;
        level.zones[hash(self.var_d42d6fdf)].adjacent_zones[hash(self.var_61e10b48)].is_connected = 0;
    }
    self.b_open = 0;
    return true;
}

// Namespace zm_white_util/zm_white_util
// Params 1, eflags: 0x1 linked
// Checksum 0x7e148be5, Offset: 0x1710
// Size: 0xc8
function function_364cd8c0(str) {
    assert(isdefined(str), "<unknown string>");
    a_doors = getentarray(str, "script_string");
    foreach (door in a_doors) {
        door function_46ed91c6();
    }
}

// Namespace zm_white_util/zm_white_util
// Params 0, eflags: 0x5 linked
// Checksum 0xf1d27132, Offset: 0x17e0
// Size: 0x196
function private function_46ed91c6() {
    if (self.b_open == 1) {
        return false;
    }
    destpos = self.origin + (0, 0, self.var_3de056e7);
    self moveto(destpos, 0.5, 0.05, 0.05);
    self playsound(#"evt_bunker_door_interior_open");
    e_collision = getent(self.linkname, "linkto");
    e_collision disconnectpaths();
    if (isdefined(self.var_61e10b48) && isdefined(self.var_d42d6fdf)) {
        level.zones[hash(self.var_61e10b48)].adjacent_zones[hash(self.var_d42d6fdf)].is_connected = 1;
        level.zones[hash(self.var_d42d6fdf)].adjacent_zones[hash(self.var_61e10b48)].is_connected = 1;
    }
    self.b_open = 1;
    return true;
}

// Namespace zm_white_util/zm_white_util
// Params 1, eflags: 0x1 linked
// Checksum 0xa880a0a1, Offset: 0x1980
// Size: 0xe8
function function_612918d9(str) {
    assert(isdefined(str), "<unknown string>");
    a_e_blockers = getentarray(str, "targetname");
    foreach (e_blocker in a_e_blockers) {
        e_blocker notsolid();
        e_blocker delete();
    }
}

// Namespace zm_white_util/zm_white_util
// Params 1, eflags: 0x1 linked
// Checksum 0x7830f2c0, Offset: 0x1a70
// Size: 0x110
function function_ca4ee4d1(str) {
    assert(isdefined(str), "<unknown string>");
    a_s_bunker_doors = struct::get_array(str, "targetname");
    foreach (s_bunker_door in a_s_bunker_doors) {
        assert(isdefined(s_bunker_door.init_anim), "<unknown string>");
        s_bunker_door thread scene::play(s_bunker_door.init_anim);
    }
}

// Namespace zm_white_util/zm_white_util
// Params 1, eflags: 0x1 linked
// Checksum 0x2c94b672, Offset: 0x1b88
// Size: 0x110
function function_bf25aeb1(str) {
    assert(isdefined(str), "<unknown string>");
    a_s_bunker_doors = struct::get_array(str, "script_noteworthy");
    foreach (s_bunker_door in a_s_bunker_doors) {
        assert(isdefined(s_bunker_door.open_anim), "<unknown string>");
        s_bunker_door thread scene::play(s_bunker_door.open_anim);
    }
}

// Namespace zm_white_util/zm_white_util
// Params 0, eflags: 0x1 linked
// Checksum 0x7a12a113, Offset: 0x1ca0
// Size: 0x1b6
function function_f2fa71ce() {
    e_door = getent("apd_lockdown", "targetname");
    e_col = getent(e_door.target, "targetname");
    if (!e_door.b_open) {
        e_door rotateto(e_door.angles + (0, -90, 0), 1, 0.1, 0.2);
        e_col notsolid();
        e_col connectpaths();
        if (isdefined(e_door.var_61e10b48) && isdefined(e_door.var_d42d6fdf)) {
            level.zones[hash(e_door.var_61e10b48)].adjacent_zones[hash(e_door.var_d42d6fdf)].is_connected = 1;
            level.zones[hash(e_door.var_d42d6fdf)].adjacent_zones[hash(e_door.var_61e10b48)].is_connected = 1;
        }
        e_door.b_open = 1;
    }
}

// Namespace zm_white_util/zm_white_util
// Params 0, eflags: 0x1 linked
// Checksum 0xc38b146a, Offset: 0x1e60
// Size: 0x1b2
function function_985c08e7() {
    e_door = getent("apd_lockdown", "targetname");
    e_col = getent(e_door.target, "targetname");
    if (e_door.b_open) {
        e_door rotateto(e_door.angles + (0, -90, 0), 1, 0.1, 0.2);
        e_col solid();
        e_col disconnectpaths();
        if (isdefined(e_door.var_61e10b48) && isdefined(e_door.var_d42d6fdf)) {
            level.zones[hash(e_door.var_61e10b48)].adjacent_zones[hash(e_door.var_d42d6fdf)].is_connected = 0;
            level.zones[hash(e_door.var_d42d6fdf)].adjacent_zones[hash(e_door.var_61e10b48)].is_connected = 0;
        }
        e_door.b_open = 0;
    }
}

// Namespace zm_white_util/zm_white_util
// Params 1, eflags: 0x0
// Checksum 0x679e1b60, Offset: 0x2020
// Size: 0x46
function function_85edbfb9(w_weapon) {
    return isdefined(w_weapon) && (w_weapon == level.a_w_ray_guns[2] || w_weapon == level.a_w_ray_guns[3]);
}

// Namespace zm_white_util/zm_white_util
// Params 1, eflags: 0x0
// Checksum 0xbe1f22cc, Offset: 0x2070
// Size: 0x4c
function function_1526eabf(e_player) {
    return isplayer(e_player) && e_player zm_weapons::has_weapon_or_upgrade(level.a_w_ray_guns[2]);
}

// Namespace zm_white_util/zm_white_util
// Params 0, eflags: 0x1 linked
// Checksum 0x47fc0e07, Offset: 0x20c8
// Size: 0x84
function function_d7c9337c() {
    if (self hasweapon(level.a_w_ray_guns[2])) {
        return level.a_w_ray_guns[2];
    }
    var_6febd6e0 = zm_weapons::get_upgrade_weapon(level.a_w_ray_guns[2]);
    if (self hasweapon(var_6febd6e0)) {
        return var_6febd6e0;
    }
}

// Namespace zm_white_util/zm_white_util
// Params 0, eflags: 0x0
// Checksum 0x14ad043d, Offset: 0x2158
// Size: 0x44
function take_ray_gun_mk2() {
    w_ray_gun_mk2 = self function_d7c9337c();
    if (isdefined(w_ray_gun_mk2)) {
        self zm_weapons::weapon_take(w_ray_gun_mk2);
    }
}

// Namespace zm_white_util/zm_white_util
// Params 0, eflags: 0x5 linked
// Checksum 0xe084865a, Offset: 0x21a8
// Size: 0x32
function private on_ai_spawned() {
    if (self.archetype === #"zombie") {
        self.var_8b59c468 = &function_ae18909c;
    }
}

// Namespace zm_white_util/zm_white_util
// Params 0, eflags: 0x5 linked
// Checksum 0x2970e590, Offset: 0x21e8
// Size: 0xa6
function private function_ae18909c() {
    b_success = 0;
    if (level flag::get(#"hash_595f26b382ef7867")) {
        b_success = self zm_white_main_quest::function_8033b54();
    }
    if (!b_success && level flag::get(#"hash_3a183a144032bbf3")) {
        b_success = self namespace_825eac6b::function_33d9b1f8();
    }
    if (!b_success) {
        self.var_8b59c468 = undefined;
    }
}

// Namespace zm_white_util/zm_white_util
// Params 1, eflags: 0x1 linked
// Checksum 0x50b61fe6, Offset: 0x2298
// Size: 0x2a
function is_ray_gun(w_weapon) {
    return isinarray(level.a_w_ray_guns, w_weapon);
}

// Namespace zm_white_util/zm_white_util
// Params 1, eflags: 0x1 linked
// Checksum 0xaf5bff39, Offset: 0x22d0
// Size: 0x2a
function function_c654e39a(w_weapon) {
    return isinarray(level.var_584a3e61, w_weapon);
}

// Namespace zm_white_util/zm_white_util
// Params 0, eflags: 0x1 linked
// Checksum 0xec3e7b91, Offset: 0x2308
// Size: 0x1c
function has_ray_gun() {
    return isdefined(self function_c7274071());
}

// Namespace zm_white_util/zm_white_util
// Params 0, eflags: 0x1 linked
// Checksum 0xc62b21fe, Offset: 0x2330
// Size: 0x88
function function_c7274071() {
    foreach (w_ray_gun in level.a_w_ray_guns) {
        if (self hasweapon(w_ray_gun)) {
            return w_ray_gun;
        }
    }
}

// Namespace zm_white_util/zm_white_util
// Params 1, eflags: 0x1 linked
// Checksum 0x3dd16b1e, Offset: 0x23c8
// Size: 0x19a
function function_358da2a7(e_player) {
    if (level flag::get("enable_countermeasure_5") && self.stub.related_parent.var_4f84520b === 0) {
        w_give = self.stub.related_parent.w_pickup;
        w_take = e_player function_c7274071();
        if (isdefined(w_take)) {
            if (w_take == w_give) {
                self sethintstring(zm_utility::function_d6046228(#"hash_1ee18bf56df7a29b", #"hash_39d6b1ad0b94f111"));
            } else {
                self sethintstring(zm_utility::function_d6046228(#"hash_172253c9314825fc", #"hash_71016e43b6fe0570"), w_give.displayname, w_take.displayname);
            }
        } else {
            self sethintstring(zm_utility::function_d6046228(#"hash_314a7588b45256eb", #"hash_6831cfd35264e1"), w_give.displayname);
        }
        return 1;
    }
    return 0;
}

// Namespace zm_white_util/zm_white_util
// Params 0, eflags: 0x1 linked
// Checksum 0xf78fda33, Offset: 0x2570
// Size: 0x144
function function_d1ca61a7() {
    self endon(#"death");
    w_give = self.w_pickup;
    s_waitresult = self waittill(#"trigger_activated");
    e_player = s_waitresult.e_who;
    w_take = e_player function_c7274071();
    b_give_weapon = 1;
    if (isdefined(w_take)) {
        if (w_take == w_give) {
            e_player zm_weapons::function_7c5dd4bd(w_give);
            b_give_weapon = 0;
        } else {
            e_player zm_weapons::weapon_take(w_take);
        }
    }
    if (b_give_weapon) {
        e_player zm_weapons::weapon_give(w_give, 1);
    }
    self.var_4f84520b = 1;
    zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
    self hide();
}

// Namespace zm_white_util/zm_white_util
// Params 1, eflags: 0x1 linked
// Checksum 0x80aafa6d, Offset: 0x26c0
// Size: 0xb8
function function_8a4b7d4a(weapon) {
    if (isinarray(level.var_65b6264d, weapon)) {
        foreach (var_edd21c9a in level.var_65b6264d) {
            if (self hasweapon(var_edd21c9a, 1)) {
                return var_edd21c9a;
            }
        }
    }
}

// Namespace zm_white_util/zm_white_util
// Params 2, eflags: 0x1 linked
// Checksum 0x52d2336b, Offset: 0x2780
// Size: 0x298
function function_afbd7223(oldweapondata, newweapondata) {
    w_current = oldweapondata[#"weapon"];
    var_2153c223 = newweapondata[#"weapon"];
    if (isinarray(level.var_65b6264d, w_current) && isinarray(level.var_65b6264d, var_2153c223)) {
        weapondata = [];
        var_8500c3b7 = array(level.a_w_ray_guns[3], level.a_w_ray_guns[1], level.a_w_ray_guns[2], level.a_w_ray_guns[0]);
        foreach (var_9fbd6e74 in var_8500c3b7) {
            if (w_current == var_9fbd6e74 || var_2153c223 == var_9fbd6e74) {
                weapondata[#"weapon"] = var_9fbd6e74;
                break;
            }
        }
        var_a0bd414d = weapondata[#"weapon"];
        weapondata[#"clip"] = int(min(newweapondata[#"clip"] + oldweapondata[#"clip"], var_a0bd414d.clipsize));
        weapondata[#"stock"] = int(min(newweapondata[#"stock"] + oldweapondata[#"stock"], var_a0bd414d.maxammo));
        return weapondata;
    }
}

// Namespace zm_white_util/zm_white_util
// Params 1, eflags: 0x1 linked
// Checksum 0x614f142e, Offset: 0x2a20
// Size: 0x168
function function_c05cc102(s_params) {
    self endon(#"death");
    if (!zm_utility::function_850e7499(s_params.weapon)) {
        return;
    }
    s_waitresult = s_params.projectile waittill(#"projectile_impact_explode", #"explode", #"death");
    if (isdefined(s_params.projectile) && s_waitresult._notify == "death") {
        level notify(#"hash_3042a9bf2f57ea0a", {#attacker:self, #var_814c9389:s_params.projectile.origin});
        return;
    }
    if (s_waitresult._notify == "projectile_impact_explode") {
        level notify(#"hash_3042a9bf2f57ea0a", {#attacker:self, #var_814c9389:s_waitresult.position});
    }
}

