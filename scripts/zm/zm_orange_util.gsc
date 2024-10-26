#using scripts\zm\zm_hms_util.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_round_logic.gsc;
#using scripts\zm_common\zm_characters.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace zm_orange_util;

// Namespace zm_orange_util/zm_orange_util
// Params 0, eflags: 0x1 linked
// Checksum 0x8cabb19c, Offset: 0x220
// Size: 0x3c4
function init() {
    level.var_45b0f2f3 = &function_e43bea18;
    level.var_210f9911 = &function_e162fac3;
    level.var_8c164439 = [];
    level.var_8c164439[#"hash_1242b7914448ebc7"] = #"hash_3708586aed65f7b7";
    level.var_1c53964e = spawn("script_origin", (0, 0, 0));
    level.var_1c53964e.name = "plr_7";
    level.var_1c53964e.isspeaking = 0;
    level.var_1c53964e.var_5b6ebfd0 = 0;
    level.var_60b08c24 = spawn("script_origin", (0, 0, 0));
    level.var_60b08c24.name = "apot";
    level.var_60b08c24.isspeaking = 0;
    level.var_60b08c24.var_5b6ebfd0 = 0;
    level flag::init(#"hash_73e5e9787832fc70");
    level flag::init(#"hash_c38f82bacfe540c");
    level flag::init(#"hash_42f42c8c6a56a111");
    level flag::init(#"hash_6d9b683b3abbb981");
    level.a_w_wonder = array(getweapon("ray_gun"), getweapon("ray_gun_upgraded"), getweapon("ray_gun_mk2"), getweapon("ray_gun_mk2_upgraded"), getweapon("tundragun"), getweapon("tundragun_upgraded"), getweapon("thundergun"), getweapon("thundergun_upgraded"), getweapon("ww_tesla_sniper_t8"), getweapon("ww_tesla_sniper_upgraded_t8"));
    level.a_w_ray_guns = array(getweapon("ray_gun"), getweapon("ray_gun_upgraded"), getweapon("ray_gun_mk2"), getweapon("ray_gun_mk2_upgraded"));
    level.var_ee565b3f = &function_8a4b7d4a;
    level.var_bb2323e4 = &function_afbd7223;
    level.custom_magic_box_selection_logic = &custom_magic_box_selection_logic;
    level.var_2f57e2d2 = &function_2f57e2d2;
    callback::on_connect(&on_connect);
}

// Namespace zm_orange_util/zm_orange_util
// Params 1, eflags: 0x1 linked
// Checksum 0x91c7c994, Offset: 0x5f0
// Size: 0x2d0
function function_583cad13(var_2753f06a) {
    wait 1;
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
        if (var_2753f06a == 0 && var_5316ea7d == "stuh" && !(isdefined(level.var_3c9cfd6f) && level.var_3c9cfd6f)) {
            e_player zm_audio::do_player_or_npc_playvox(#"hash_55a4b3824ac230a1", 1);
        }
    } else {
        arrayremovevalue(a_players, level.host);
        if (var_2753f06a == 0) {
            level.host function_51b752a9(#"hash_4c0be2bb6d0c80b0" + var_5316ea7d);
            var_d1e952c4 = zm_hms_util::function_3815943c(a_players);
            if (isdefined(var_d1e952c4)) {
                var_d1e952c4 function_51b752a9(#"hash_4c0be2bb6d0c80b0" + var_5316ea7d);
            }
        } else {
            level.host function_51b752a9(#"hash_71bde3a512edb440" + var_2753f06a + "_" + var_5316ea7d);
            var_d1e952c4 = zm_hms_util::function_3815943c(a_players);
            if (isdefined(var_d1e952c4)) {
                var_d1e952c4 function_51b752a9(#"hash_71bde3a512edb440" + var_2753f06a + "_" + var_5316ea7d);
            }
        }
        b_played = 1;
    }
    return b_played;
}

// Namespace zm_orange_util/zm_orange_util
// Params 0, eflags: 0x5 linked
// Checksum 0xd0c6333a, Offset: 0x8c8
// Size: 0x4e
function private function_3e0d878f() {
    self endon(#"death");
    level flag::wait_till(#"hash_142bf0da77232815");
    self.var_631a26f0 = level.var_fee8e90b;
}

// Namespace zm_orange_util/zm_orange_util
// Params 1, eflags: 0x1 linked
// Checksum 0x3812066a, Offset: 0x920
// Size: 0x12a
function function_af205e69(table) {
    index = 0;
    for (row = tablelookuprow(table, index); isdefined(row); row = tablelookuprow(table, index)) {
        category = zm_audio::checkstringvalid(row[0]);
        subcategory = zm_audio::checkstringvalid(row[1]);
        if (!isdefined(level.var_fee8e90b)) {
            level.var_fee8e90b = [];
        }
        if (!isdefined(level.var_fee8e90b[category])) {
            level.var_fee8e90b[category] = [];
        }
        level.var_fee8e90b[category][subcategory] = &function_8123b826;
        index++;
    }
}

// Namespace zm_orange_util/zm_orange_util
// Params 0, eflags: 0x5 linked
// Checksum 0x44537bb5, Offset: 0xa58
// Size: 0x2ac
function private on_connect() {
    level endon(#"end_game");
    self endon(#"disconnect");
    if (self zm_characters::is_character(array(#"hash_447b3c77b73aa2a9"))) {
        self thread function_3e0d878f();
        self thread function_2e565334();
    }
    self zm_audio::function_6191af93(#"surrounded", #"self", #"oh", #"shit", 100);
    self zm_audio::function_6191af93(#"general", #"crawl_spawn", #"general", #"crawl_seen", 100);
    self zm_audio::function_6191af93(#"magicbox", #"homunculus", #"magicbox", #"monkey", 100);
    self zm_audio::function_6191af93(#"kill", #"homunculus", #"kill", #"monkey", 100);
    self zm_audio::function_87714659(&function_e08cd7b, #"roundstart", #"special");
    level flag::wait_till(#"hash_621d31a87bd6d05b");
    self zm_audio::function_6191af93(#"kill", #"music_box", #"post_kill", #"music_box", 100);
}

// Namespace zm_orange_util/zm_orange_util
// Params 0, eflags: 0x1 linked
// Checksum 0x698889bf, Offset: 0xd10
// Size: 0xda
function function_2e565334() {
    level endon(#"end_game");
    self endon(#"disconnect");
    while (true) {
        if (zm_vo::is_player_speaking(self) && self.str_vo_being_spoken === #"hash_1242b7914448ebc7") {
            while (!isdefined(self.var_4377124)) {
                wait 0.1;
            }
            wait 1;
            if (!(isdefined(level.var_3c9cfd6f) && level.var_3c9cfd6f)) {
                self zm_audio::do_player_or_npc_playvox(#"hash_3708596aed65f96a", 1);
            }
            continue;
        }
        wait 1;
    }
}

// Namespace zm_orange_util/zm_orange_util
// Params 2, eflags: 0x1 linked
// Checksum 0x66f984ac, Offset: 0xdf8
// Size: 0x3e
function function_e08cd7b(category, subcategory) {
    if (level flag::get("trinket_round")) {
        return true;
    }
    return false;
}

// Namespace zm_orange_util/zm_orange_util
// Params 2, eflags: 0x1 linked
// Checksum 0x779401cb, Offset: 0xe40
// Size: 0xe8
function function_8123b826(str_category, var_39acfdda) {
    zm_audio::play_vo_internal(self.str_vo_being_spoken, undefined);
    if (isdefined(self.var_fbbeefe6) && isdefined(level.sndplayervox[str_category]) && isdefined(level.sndplayervox[str_category][var_39acfdda])) {
        vox = level.sndplayervox[str_category][var_39acfdda];
        str_alias = vox.suffix + "_plr_5_" + self.var_fbbeefe6;
        if (soundexists(str_alias)) {
            zm_audio::play_vo_internal(str_alias, self);
        }
    }
    return true;
}

// Namespace zm_orange_util/zm_orange_util
// Params 4, eflags: 0x1 linked
// Checksum 0xd0d1c77e, Offset: 0xf30
// Size: 0x322
function function_51b752a9(str_alias, n_variant = int(-1), b_wait_if_busy = 0, var_a97d4e32 = 0) {
    if (isdefined(level.var_3c9cfd6f) && level.var_3c9cfd6f || !isdefined(self)) {
        return;
    }
    level endon(#"game_ended");
    self endon(#"player_downed", #"death", #"disconnect");
    if (!zm_utility::is_player_valid(self)) {
        return;
    }
    if (var_a97d4e32) {
        self.last_vo_played_time = 0;
    }
    n_index = zm_characters::function_dc232a80();
    if (n_variant < 0) {
        if (n_index === 17) {
            a_variants = function_ab3ed097(str_alias + "_plr_17");
            if (a_variants.size > 0) {
                n_variant = array::random(a_variants);
                return self function_51b752a9(str_alias, n_variant, b_wait_if_busy, var_a97d4e32);
            }
        } else {
            return self zm_vo::function_a2bd5a0c(str_alias, 0, b_wait_if_busy);
        }
        return;
    }
    str_vo_alias = str_alias + "_plr_" + n_index + "_" + n_variant;
    if (b_wait_if_busy) {
        self notify(#"hash_7efd5bdf8133ff7b");
        self endon(#"hash_7efd5bdf8133ff7b");
        var_215d4efb = b_wait_if_busy == 2 ? 1 : 0;
        while (!zm_audio::can_speak(self.toself, var_215d4efb)) {
            waitframe(1);
            waittillframeend();
        }
    }
    if (!zm_audio::can_speak(self.toself)) {
        return 0;
    }
    self zm_audio::do_player_or_npc_playvox(str_vo_alias);
    if (n_index === 17) {
        str_vo_alias = str_alias + "_plr_5_" + n_variant;
        if (soundexists(str_vo_alias)) {
            self.var_5b6ebfd0 = 1;
            self zm_audio::play_vo_internal(str_vo_alias, self);
            self zm_vo::vo_clear();
        }
    }
    return 1;
}

// Namespace zm_orange_util/zm_orange_util
// Params 1, eflags: 0x1 linked
// Checksum 0xb16a8c61, Offset: 0x1260
// Size: 0xc6
function function_ab3ed097(aliasprefix) {
    a_variants = [];
    for (i = 0; i < 20; i++) {
        str_alias = aliasprefix + "_" + i;
        if (soundexists(str_alias)) {
            if (!isdefined(a_variants)) {
                a_variants = [];
            } else if (!isarray(a_variants)) {
                a_variants = array(a_variants);
            }
            a_variants[a_variants.size] = i;
        }
    }
    return a_variants;
}

// Namespace zm_orange_util/zm_orange_util
// Params 4, eflags: 0x1 linked
// Checksum 0x85bd1051, Offset: 0x1330
// Size: 0xc4
function function_fd24e47f(str_alias, n_variant = int(-1), b_wait_if_busy = 0, var_a97d4e32 = 0) {
    level endon(#"game_ended");
    player = zm_hms_util::function_3815943c();
    if (isdefined(player)) {
        player function_51b752a9(str_alias, n_variant, b_wait_if_busy, var_a97d4e32);
    }
}

// Namespace zm_orange_util/zm_orange_util
// Params 6, eflags: 0x1 linked
// Checksum 0xde4e9afd, Offset: 0x1400
// Size: 0x1c8
function function_865209df(category, flag, delay = 2, var_ba54b77d = -1, n_range = 800, var_618a04 = 0) {
    subcategory = #"react";
    self endon(#"death", #"dynamited");
    b_flag = level flag::get(flag);
    if (b_flag) {
        return;
    }
    if (isstring(delay)) {
        self waittill(delay);
    } else if (delay > 0) {
        wait delay;
    }
    player_vo = function_bf1b121a(var_ba54b77d, n_range, var_618a04);
    b_flag = level flag::get(flag);
    if (isdefined(player_vo) && !b_flag) {
        result = 1 === player_vo zm_audio::create_and_play_dialog(category, subcategory, undefined, 0);
    }
    if (result === 1) {
        level flag::set(flag);
    }
    return result;
}

// Namespace zm_orange_util/zm_orange_util
// Params 3, eflags: 0x5 linked
// Checksum 0x7e93b1a4, Offset: 0x15d0
// Size: 0x222
function private function_bf1b121a(timeout, n_range, var_618a04) {
    __timeout__ = timeout;
    var_a51f2d59 = gettime();
    do {
        var_6f868336 = arraysort(level.activeplayers, self.origin, 1, level.activeplayers.size, n_range);
        foreach (player in var_6f868336) {
            if (!player zm_audio::can_speak(1) || isdefined(level.var_b625a184) && level.var_b625a184) {
                continue;
            }
            if (isstruct(self) || var_618a04) {
                if (player util::is_looking_at(self, 0.65, 1)) {
                    return player;
                }
                continue;
            }
            if (isentity(self)) {
                if (self sightconetrace(player getplayercamerapos(), player, anglestoforward(player.angles)) > 0.3) {
                    return player;
                }
            }
        }
        waitframe(5);
    } while (!(__timeout__ >= 0 && __timeout__ - float(gettime() - var_a51f2d59) / 1000 <= 0));
}

// Namespace zm_orange_util/zm_orange_util
// Params 1, eflags: 0x1 linked
// Checksum 0x83d56fb7, Offset: 0x1800
// Size: 0xd6
function function_e43bea18(var_11975e15) {
    str_weapon = undefined;
    switch (var_11975e15) {
    case #"snowball_upgraded":
    case #"snowball":
    case #"snowball_yellow_upgraded":
    case #"snowball_yellow":
        str_weapon = #"snowball";
        break;
    case #"hash_a2556a2905fd952":
        str_weapon = #"matryoshka";
        break;
    case #"music_box":
        str_weapon = #"music_box";
        break;
    }
    return str_weapon;
}

// Namespace zm_orange_util/zm_orange_util
// Params 2, eflags: 0x1 linked
// Checksum 0xb10e273b, Offset: 0x18e0
// Size: 0xf8
function function_e162fac3(weapon, str_vo_line) {
    if (weapon === getweapon(#"ww_tesla_sniper_t8")) {
        return #"tempest";
    } else if (weapon === getweapon(#"thundergun")) {
        return #"thundergun";
    } else if (weapon === getweapon(#"tundragun")) {
        return #"tundragun";
    } else if (weapon === getweapon(#"hash_7a42b57be462143f")) {
        return #"matryoshka";
    }
    return str_vo_line;
}

// Namespace zm_orange_util/zm_orange_util
// Params 4, eflags: 0x0
// Checksum 0x46bf7284, Offset: 0x19e0
// Size: 0x5c
function function_cda40569(n_delay, str_alias, n_variant, str_endon) {
    level endon(str_endon);
    wait n_delay;
    level.pablo_npc thread zm_hms_util::function_6a0d675d(str_alias, n_variant, 0, 1);
}

// Namespace zm_orange_util/zm_orange_util
// Params 0, eflags: 0x0
// Checksum 0x311ccfae, Offset: 0x1a48
// Size: 0x14c
function docks_power() {
    level endon(#"end_game");
    level waittill(#"start_of_round");
    var_833bb1c7 = getentarray("use_elec_switch", "targetname");
    foreach (trig in var_833bb1c7) {
        if (trig.script_int === 1) {
            power_trig = trig;
            break;
        }
    }
    if (isdefined(power_trig)) {
        waitresult = power_trig waittill(#"trigger");
        user = waitresult.activator;
        user thread function_51b752a9(#"vox_power_switch_1_activate");
    }
}

// Namespace zm_orange_util/zm_orange_util
// Params 0, eflags: 0x1 linked
// Checksum 0xc07fb1e1, Offset: 0x1ba0
// Size: 0x1aa
function function_3d6809e9() {
    level endon(#"end_game");
    n_round = zm_round_logic::get_round_number();
    zm_utility::function_fdb0368(3);
    level.var_b2b15659 = 1;
    while (true) {
        level waittill(#"end_of_round");
        wait 5;
        if (level.var_1c53964e zm_audio::can_speak()) {
            break;
        }
    }
    level.var_1c53964e zm_hms_util::function_6a0d675d(#"hash_58f39ce928f3a523", -1, 0, 1);
    function_fd24e47f(#"hash_58f39ce928f3a523");
    while (true) {
        level waittill(#"end_of_round");
        wait 5;
        if (level.var_1c53964e zm_audio::can_speak()) {
            break;
        }
    }
    level.var_1c53964e zm_hms_util::function_6a0d675d(#"vox_round_end_2_nikolai", -1, 0, 1);
    function_fd24e47f("vox_round_end_2_nikolai", -1, 0, 0);
    level.var_b2b15659 = 0;
}

// Namespace zm_orange_util/zm_orange_util
// Params 1, eflags: 0x1 linked
// Checksum 0x3e4efeaa, Offset: 0x1d58
// Size: 0x110
function function_8a7521db(str) {
    assert(isdefined(str), "<dev string:x38>");
    var_58c9b9cc = struct::get_array(str, "targetname");
    foreach (var_3bb6cef5 in var_58c9b9cc) {
        assert(isdefined(var_3bb6cef5.open_anim), "<dev string:x63>");
        var_3bb6cef5 thread scene::play(var_3bb6cef5.open_anim);
    }
}

// Namespace zm_orange_util/zm_orange_util
// Params 2, eflags: 0x1 linked
// Checksum 0xd81854a7, Offset: 0x1e70
// Size: 0x12a
function function_fe8ee9f0(var_b36eb2ad, var_7f70dbec = 1) {
    if (isdefined(var_7f70dbec) && var_7f70dbec) {
        if (isdefined(var_b36eb2ad) && (var_b36eb2ad == level.w_snowball || var_b36eb2ad == level.w_snowball_upgraded || var_b36eb2ad == level.w_snowball_yellow || var_b36eb2ad == level.w_snowball_yellow_upgraded || var_b36eb2ad == level.w_tundragun || var_b36eb2ad == level.w_tundragun_upgraded)) {
            return 1;
        }
        return 0;
    }
    if (isdefined(var_b36eb2ad) && (var_b36eb2ad == level.w_snowball || var_b36eb2ad == level.w_snowball_upgraded || var_b36eb2ad == level.w_snowball_yellow || var_b36eb2ad == level.w_snowball_yellow_upgraded)) {
        return 1;
    }
    return 0;
}

// Namespace zm_orange_util/zm_orange_util
// Params 0, eflags: 0x1 linked
// Checksum 0x4b805186, Offset: 0x1fa8
// Size: 0x88
function function_60403468() {
    foreach (w_wonder in level.a_w_wonder) {
        if (self hasweapon(w_wonder)) {
            return w_wonder;
        }
    }
}

// Namespace zm_orange_util/zm_orange_util
// Params 0, eflags: 0x1 linked
// Checksum 0x992eee45, Offset: 0x2040
// Size: 0x1c
function function_3d581a6() {
    return isdefined(self function_60403468());
}

// Namespace zm_orange_util/zm_orange_util
// Params 1, eflags: 0x1 linked
// Checksum 0xa5be386c, Offset: 0x2068
// Size: 0x2a
function is_wonder_weapon(w_weapon) {
    return isinarray(level.a_w_wonder, w_weapon);
}

// Namespace zm_orange_util/zm_orange_util
// Params 2, eflags: 0x1 linked
// Checksum 0xd30ff51f, Offset: 0x20a0
// Size: 0x74
function function_5cd05b9(w_weapon_1, w_weapon_2) {
    w_base_1 = zm_weapons::get_base_weapon(w_weapon_1);
    w_base_2 = zm_weapons::get_base_weapon(w_weapon_2);
    return isdefined(w_base_1) && isdefined(w_base_2) && w_base_1 == w_base_2;
}

// Namespace zm_orange_util/zm_orange_util
// Params 1, eflags: 0x1 linked
// Checksum 0xbb4fb400, Offset: 0x2120
// Size: 0x1a8
function function_adb657dd(e_player) {
    w_give = self.stub.related_parent.w_pickup;
    w_take = e_player function_60403468();
    if (isdefined(w_take)) {
        if (function_5cd05b9(w_take, w_give)) {
            self sethintstring(zm_utility::function_d6046228(#"hash_1ee18bf56df7a29b", #"hash_39d6b1ad0b94f111"));
        } else {
            self sethintstring(zm_utility::function_d6046228(#"hash_172253c9314825fc", #"hash_71016e43b6fe0570"), w_give.displayname, w_take.displayname);
        }
    } else if (e_player.currentweapon.isheroweapon === 1 || e_player.currentweapon.name === #"zhield_riot_dw") {
        return false;
    } else {
        self sethintstring(zm_utility::function_d6046228(#"hash_314a7588b45256eb", #"hash_6831cfd35264e1"), w_give.displayname);
    }
    return true;
}

// Namespace zm_orange_util/zm_orange_util
// Params 0, eflags: 0x1 linked
// Checksum 0x518a4198, Offset: 0x22d0
// Size: 0x15c
function function_c3d56ed8() {
    self endon(#"death");
    w_give = self.w_pickup;
    s_waitresult = self waittill(#"trigger_activated");
    e_player = s_waitresult.e_who;
    w_take = e_player function_60403468();
    b_give_weapon = 1;
    if (isdefined(w_take)) {
        if (function_5cd05b9(w_take, w_give)) {
            e_player zm_weapons::function_7c5dd4bd(w_take);
            b_give_weapon = 0;
        } else {
            e_player zm_weapons::weapon_take(w_take);
        }
    }
    if (b_give_weapon) {
        e_player zm_weapons::weapon_give(w_give, 1);
    }
    zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
    if (isdefined(self.func_cleanup)) {
        level thread [[ self.func_cleanup ]](e_player, b_give_weapon);
    }
    self delete();
}

// Namespace zm_orange_util/zm_orange_util
// Params 2, eflags: 0x1 linked
// Checksum 0xb4a4e7c3, Offset: 0x2438
// Size: 0x6c
function start_zombies_collision_manager(w_pickup, func_cleanup) {
    self.w_pickup = w_pickup;
    self.func_cleanup = func_cleanup;
    self zm_unitrigger::create(&function_adb657dd, 96);
    self thread function_c3d56ed8();
}

// Namespace zm_orange_util/zm_orange_util
// Params 2, eflags: 0x1 linked
// Checksum 0xb2a5f51f, Offset: 0x24b0
// Size: 0x50
function custom_magic_box_selection_logic(w_weapon, e_player) {
    if (is_wonder_weapon(w_weapon) && e_player function_3d581a6()) {
        return false;
    }
    return true;
}

// Namespace zm_orange_util/zm_orange_util
// Params 1, eflags: 0x1 linked
// Checksum 0xed0076a1, Offset: 0x2508
// Size: 0x80
function function_2f57e2d2(e_player) {
    var_5f6b2789 = self.stub.trigger_target;
    if (var_5f6b2789.weapon_out === 1 && is_wonder_weapon(var_5f6b2789.zbarrier.weapon) && e_player function_3d581a6()) {
        return false;
    }
    return true;
}

// Namespace zm_orange_util/zm_orange_util
// Params 1, eflags: 0x1 linked
// Checksum 0xe73a49, Offset: 0x2590
// Size: 0xb8
function function_8a4b7d4a(weapon) {
    if (isinarray(level.a_w_ray_guns, weapon)) {
        foreach (w_ray_gun in level.a_w_ray_guns) {
            if (self hasweapon(w_ray_gun, 1)) {
                return w_ray_gun;
            }
        }
    }
}

// Namespace zm_orange_util/zm_orange_util
// Params 2, eflags: 0x1 linked
// Checksum 0xd221dc7, Offset: 0x2650
// Size: 0x298
function function_afbd7223(oldweapondata, newweapondata) {
    w_current = oldweapondata[#"weapon"];
    var_2153c223 = newweapondata[#"weapon"];
    if (isinarray(level.var_65b6264d, w_current) && isinarray(level.var_65b6264d, var_2153c223)) {
        weapondata = [];
        a_w_test = array(level.a_w_ray_guns[3], level.a_w_ray_guns[1], level.a_w_ray_guns[2], level.a_w_ray_guns[0]);
        foreach (w_test in a_w_test) {
            if (w_current == w_test || var_2153c223 == w_test) {
                weapondata[#"weapon"] = w_test;
                break;
            }
        }
        var_a0bd414d = weapondata[#"weapon"];
        weapondata[#"clip"] = int(min(newweapondata[#"clip"] + oldweapondata[#"clip"], var_a0bd414d.clipsize));
        weapondata[#"stock"] = int(min(newweapondata[#"stock"] + oldweapondata[#"stock"], var_a0bd414d.maxammo));
        return weapondata;
    }
}

