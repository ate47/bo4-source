// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_57873b62;

// Namespace namespace_57873b62/namespace_8125d942
// Params 0, eflags: 0x1 linked
// Checksum 0x5f7e4a52, Offset: 0x8a8
// Size: 0x1e0
function init() {
    getent("yoshi_doshi", "targetname") hide();
    init_clientfields();
    if (zm_utility::is_ee_enabled()) {
        init_flags();
        function_b11c26c9();
        level thread function_ea0460f4();
        level thread function_d3a41243();
        level thread function_59ecbee4();
        level thread function_8a44027();
        level thread function_7b89f32a();
        level thread function_558936ed();
        level thread function_678d6318();
        level thread function_a425bf07();
    } else {
        function_904b119();
        foreach (var_255658de in getentarray("leeloo_blue", "targetname")) {
            var_255658de delete();
        }
    }
}

// Namespace namespace_57873b62/namespace_8125d942
// Params 0, eflags: 0x1 linked
// Checksum 0xc87da794, Offset: 0xa90
// Size: 0x44
function init_clientfields() {
    clientfield::register("scriptmover", "" + #"morse_star", 1, 1, "int");
}

// Namespace namespace_57873b62/namespace_8125d942
// Params 0, eflags: 0x1 linked
// Checksum 0x2595729d, Offset: 0xae0
// Size: 0x24
function init_flags() {
    level flag::init(#"phonograph_playing");
}

// Namespace namespace_57873b62/namespace_8125d942
// Params 0, eflags: 0x1 linked
// Checksum 0x3cf8620c, Offset: 0xb10
// Size: 0xfc
function function_904b119() {
    hidemiscmodels("freerangeanimalcrackers");
    getent("bloody_sight", "targetname") hide();
    getent("life_preserver_catch", "targetname") hide();
    getent("life_preserver_catch" + "_l", "targetname") hide();
    getent("life_preserver_catch" + "_r", "targetname") hide();
}

// Namespace namespace_57873b62/namespace_8125d942
// Params 0, eflags: 0x1 linked
// Checksum 0x77efc285, Offset: 0xc18
// Size: 0x2da
function function_a425bf07() {
    s_doll = struct::get(#"creepy_friend");
    s_trigger_loc = struct::get(s_doll.target);
    mdl_doll = util::spawn_model(#"hash_249386b68e19b345", s_doll.origin, s_doll.angles);
    s_unitrigger = s_trigger_loc zm_unitrigger::create(undefined, 32);
    s_trigger_loc waittill(#"trigger_activated");
    mdl_doll thread function_e7fd1a33();
    var_2c8f1222 = array(#"hash_49744335f38f8111", #"hash_1fceaa1fb6e9fcac", #"hash_49744235f38f7f5e", #"hash_49744135f38f7dab", #"hash_1fceab1fb6e9fe5f", #"hash_1fceac1fb6ea0012", #"hash_1fcead1fb6ea01c5", #"hash_49744035f38f7bf8", #"hash_1fcea61fb6e9f5e0", #"hash_1fcea71fb6e9f793", #"hash_49744735f38f87dd", #"hash_49744635f38f862a", #"hash_49744535f38f8477", #"hash_1fcea81fb6e9f946", #"hash_1fcea91fb6e9faf9", #"hash_49744435f38f82c4", #"hash_49743b35f38f7379", #"hash_1fceb21fb6ea0a44", #"hash_49743a35f38f71c6", #"hash_1fceb31fb6ea0bf7");
    while (1) {
        for (i = 0; i < var_2c8f1222.size; i++) {
            b_played = mdl_doll zm_vo::vo_say(var_2c8f1222[i]);
            if (!(isdefined(b_played) && b_played)) {
                i--;
            }
            wait(0.25);
            s_trigger_loc waittill(#"trigger_activated");
        }
    }
}

// Namespace namespace_57873b62/namespace_8125d942
// Params 0, eflags: 0x1 linked
// Checksum 0xc32b4796, Offset: 0xf00
// Size: 0x258
function function_e7fd1a33() {
    self endon(#"death");
    var_f21d9eb3 = int(self.origin[0] - 12);
    n_max_x = int(self.origin[0] + 12);
    while (isdefined(self)) {
        wait(randomintrange(15, 30));
        while (1) {
            b_move = 1;
            players = util::get_active_players();
            foreach (player in players) {
                if (!isdefined(player)) {
                    continue;
                }
                if (player util::is_looking_at(self.origin)) {
                    b_move = 0;
                    break;
                }
                waitframe(1);
            }
            if (b_move) {
                break;
            }
            wait(1);
        }
        n_rotate = randomintrange(160, 200);
        n_x_move = randomintrange(var_f21d9eb3, n_max_x);
        self rotateto((self.angles[0], n_rotate, self.angles[2]), 0.25);
        self moveto((n_x_move, self.origin[1], self.origin[2]), 0.25);
    }
}

// Namespace namespace_57873b62/namespace_8125d942
// Params 0, eflags: 0x1 linked
// Checksum 0x340857b9, Offset: 0x1160
// Size: 0x284
function function_7b89f32a() {
    var_ff4b3a13 = getent("clottedcreamtea", "targetname");
    if (!isdefined(var_ff4b3a13)) {
        return;
    }
    var_ff4b3a13 val::set(#"painting_cipher", "takedamage", 1);
    var_ff4b3a13 val::set(#"painting_cipher", "allowdeath", 0);
    w_weapon = getweapon(#"bowie_knife");
    n_attacks = 0;
    while (n_attacks < 9) {
        s_result = undefined;
        s_result = var_ff4b3a13 waittill(#"damage");
        if (s_result.mod === #"mod_melee") {
            n_attacks++;
        }
    }
    s_loc = struct::get(#"clottedcreamtea");
    v_offset = vectorscale((0, 0, -1), 32);
    var_55e11aa9 = util::spawn_model("tag_origin", var_ff4b3a13.origin + v_offset, var_ff4b3a13.angles);
    var_ff4b3a13 linkto(var_55e11aa9);
    v_offset = (0, 20, 24);
    var_55e11aa9 moveto(s_loc.origin + v_offset, 1.5, 1.5);
    var_55e11aa9 rotatepitch(138, 1.5, 1.5);
    var_55e11aa9 waittill(#"movedone");
    var_55e11aa9 delete();
    var_ff4b3a13 disconnectpaths();
}

// Namespace namespace_57873b62/namespace_8125d942
// Params 0, eflags: 0x1 linked
// Checksum 0x1663f92e, Offset: 0x13f0
// Size: 0x54
function function_8a44027() {
    scene::add_scene_func(#"p8_fxanim_gp_raven_idle_standing_bundle", &function_c3a5f1fe);
    scene::play(#"p8_fxanim_gp_raven_idle_standing_bundle");
}

// Namespace namespace_57873b62/namespace_8125d942
// Params 1, eflags: 0x1 linked
// Checksum 0x579c49ce, Offset: 0x1450
// Size: 0x204
function function_c3a5f1fe(a_ents) {
    e_raven = a_ents[getfirstarraykey(a_ents)];
    e_raven val::set(#"raven_cipher", "takedamage", 1);
    e_raven val::set(#"raven_cipher", "allowdeath", 0);
    w_weapon = getweapon(#"ww_tricannon_earth_t8");
    var_eb115bf1 = getweapon(#"ww_tricannon_earth_t8_upgraded");
    while (1) {
        s_result = undefined;
        s_result = e_raven waittill(#"damage");
        if (s_result.weapon === w_weapon || s_result.weapon === var_eb115bf1) {
            if (isalive(s_result.attacker) && isplayer(s_result.attacker)) {
                s_result.attacker util::show_hit_marker(1);
                break;
            }
        }
    }
    mdl_book = getent("pages_of_words", "targetname");
    mdl_book setmodel(#"hash_6a0ad79cfc79892d");
    e_raven delete();
}

// Namespace namespace_57873b62/namespace_8125d942
// Params 0, eflags: 0x1 linked
// Checksum 0x10316c11, Offset: 0x1660
// Size: 0x1b0
function function_59ecbee4() {
    level waittill(#"water_initialized");
    level thread function_240b713f();
    var_5c608f55 = getent("yoshi_doshi", "targetname");
    while (1) {
        b_show = 0;
        if (!(isdefined(level.var_7f5f5e6b) && level.var_7f5f5e6b)) {
            foreach (player in util::get_players()) {
                if (isdefined(player.var_6afa034c) && isdefined(player.var_d6fe2916) && player.var_d6fe2916) {
                    if (distancesquared(player.var_6afa034c.origin, var_5c608f55.origin) < 57600) {
                        b_show = 1;
                        break;
                    }
                }
            }
        }
        if (b_show) {
            var_5c608f55 show();
        } else {
            var_5c608f55 hide();
        }
        wait(0.5);
    }
}

// Namespace namespace_57873b62/namespace_8125d942
// Params 0, eflags: 0x1 linked
// Checksum 0x72d7e820, Offset: 0x1818
// Size: 0x58
function function_240b713f() {
    while (1) {
        if (level.e_clip_water_fore.origin[2] < 600) {
            level.var_7f5f5e6b = 1;
        } else {
            level.var_7f5f5e6b = 0;
        }
        wait(0.5);
    }
}

// Namespace namespace_57873b62/namespace_8125d942
// Params 0, eflags: 0x1 linked
// Checksum 0x1e59305a, Offset: 0x1878
// Size: 0x174
function function_d3a41243() {
    t_damage = spawn("trigger_damage", struct::get(#"macaroni_boom").origin, 0, 6, 6);
    w_sticky = getweapon(#"eq_acid_bomb");
    while (1) {
        s_result = undefined;
        s_result = t_damage waittill(#"damage");
        if (s_result.weapon === w_sticky) {
            mdl_fx = util::spawn_model("tag_origin", struct::get(#"macaroni_puddle").origin);
            mdl_fx linkto(level.e_sway);
            mdl_fx clientfield::set("" + #"morse_star", 1);
            break;
        }
    }
}

// Namespace namespace_57873b62/namespace_8125d942
// Params 0, eflags: 0x1 linked
// Checksum 0x991b3f9e, Offset: 0x19f8
// Size: 0x5b8
function function_ea0460f4() {
    var_314c1b5a = [];
    var_314c1b5a[0] = array("vox_ee_diary_first_disc_0", "vox_ee_diary_first_disc_1", "vox_ee_diary_first_disc_2");
    var_314c1b5a[1] = array("vox_ee_prima_materia_alis_0", "vox_ee_prima_materia_alis_1");
    var_314c1b5a[2] = array("vox_ee_artifact_alis_0");
    var_314c1b5a[3] = array("vox_ee_sent_trial_alis_0", "vox_ee_sent_trial_alis_1");
    var_314c1b5a[4] = array("vox_ee_obsession_alis_0");
    var_314c1b5a[5] = array("vox_ee_order_alis_0");
    var_314c1b5a[6] = array("vox_ee_diary_order_leader_dlea_0");
    var_314c1b5a[7] = array("vox_ee_diary_brun_dieg_plr_3_0", "vox_ee_diary_brun_dieg_plr_2_1", "vox_ee_diary_brun_dieg_plr_3_2", "vox_ee_diary_brun_dieg_plr_2_3", "vox_ee_diary_brun_dieg_plr_3_4", "vox_ee_diary_brun_dieg_plr_2_5", "vox_ee_diary_brun_dieg_plr_3_6", "vox_ee_diary_brun_dieg_plr_2_7", "vox_ee_diary_brun_dieg_plr_3_8", "vox_ee_diary_brun_dieg_plr_2_9", "vox_ee_diary_brun_dieg_plr_3_10", "vox_ee_diary_brun_dieg_plr_2_11", "vox_ee_diary_brun_dieg_plr_3_12", "vox_ee_diary_brun_dieg_plr_2_13", "vox_ee_diary_brun_dieg_plr_3_14", "vox_ee_diary_brun_dieg_plr_2_15", "vox_ee_diary_brun_dieg_plr_3_16", "vox_ee_diary_brun_dieg_plr_2_17", "vox_ee_diary_brun_dieg_plr_3_18", "vox_ee_diary_brun_dieg_plr_2_19", "vox_ee_diary_brun_dieg_plr_3_20", "vox_ee_diary_brun_dieg_plr_2_21");
    var_314c1b5a[8] = array("vox_ee_diary_scar_shaw_plr_4_0", "vox_ee_diary_scar_shaw_plr_1_1", "vox_ee_diary_scar_shaw_plr_4_2", "vox_ee_diary_scar_shaw_plr_1_3", "vox_ee_diary_scar_shaw_plr_4_4", "vox_ee_diary_scar_shaw_plr_1_5", "vox_ee_diary_scar_shaw_plr_4_6", "vox_ee_diary_scar_shaw_plr_1_7", "vox_ee_diary_scar_shaw_plr_4_8", "vox_ee_diary_scar_shaw_plr_1_9", "vox_ee_diary_scar_shaw_plr_4_10", "vox_ee_diary_scar_shaw_plr_1_11", "vox_ee_diary_scar_shaw_plr_4_12", "vox_ee_diary_scar_shaw_plr_1_13", "vox_ee_diary_scar_shaw_plr_4_14", "vox_ee_diary_scar_shaw_plr_1_15", "vox_ee_diary_scar_shaw_plr_4_16", "vox_ee_diary_scar_shaw_plr_1_17");
    var_b90f3bf3 = getentarray("leeloo_blue", "targetname");
    var_18a4ffb4 = [];
    for (i = 0; i < var_b90f3bf3.size; i++) {
        foreach (var_255658de in var_b90f3bf3) {
            if (i == var_255658de.script_int) {
                var_18a4ffb4[i] = var_255658de;
                continue;
            }
        }
    }
    var_b90f3bf3 = undefined;
    foreach (var_255658de in var_18a4ffb4) {
        s_unitrigger = var_255658de zm_unitrigger::create();
        zm_unitrigger::function_89380dda(s_unitrigger);
        if (isdefined(var_255658de.target)) {
            s_trigger_loc = struct::get(var_255658de.target);
            zm_unitrigger::function_47625e58(s_unitrigger, s_trigger_loc.origin);
        }
        var_255658de thread function_aba430c2(s_unitrigger);
        var_255658de val::set(#"phono_roll", "takedamage", 1);
        var_255658de val::set(#"phono_roll", "allowdeath", 0);
    }
    a_s_phonographs = struct::get_array(#"hash_44ff0c493e2791eb");
    foreach (s_phonograph in a_s_phonographs) {
        s_unitrigger = s_phonograph zm_unitrigger::create();
        s_phonograph thread function_63c3fd24(var_314c1b5a);
        if (isdefined(s_phonograph.target)) {
            s_trigger_loc = struct::get(s_phonograph.target);
            zm_unitrigger::function_47625e58(s_unitrigger, s_trigger_loc.origin);
        }
    }
}

// Namespace namespace_57873b62/namespace_8125d942
// Params 1, eflags: 0x1 linked
// Checksum 0xae1d83fb, Offset: 0x1fb8
// Size: 0xd4
function function_aba430c2(s_unitrigger) {
    while (isdefined(self)) {
        s_result = undefined;
        s_result = self waittill(#"trigger_activated");
        e_player = s_result.e_who;
        if (isdefined(e_player) && !isdefined(e_player.var_68c35930)) {
            e_player playsound(#"hash_7e0e4a1fb470d18f");
            e_player.var_68c35930 = self;
            self hide();
            zm_unitrigger::unregister_unitrigger(s_unitrigger);
            break;
        }
    }
}

// Namespace namespace_57873b62/namespace_8125d942
// Params 1, eflags: 0x1 linked
// Checksum 0x7a5fa4d2, Offset: 0x2098
// Size: 0x390
function function_63c3fd24(var_314c1b5a) {
    while (1) {
        s_result = undefined;
        s_result = self waittill(#"trigger_activated");
        e_player = s_result.e_who;
        if (isdefined(e_player)) {
            if (isdefined(e_player.var_68c35930) && !isdefined(self.var_68c35930)) {
                self.var_68c35930 = e_player.var_68c35930;
                self.var_68c35930.origin = self.origin;
                self.var_68c35930.angles = self.angles;
                self.var_68c35930 show();
                self.var_68c35930 playsound(#"hash_343bf66b64f5830e");
                e_player.var_68c35930 = undefined;
            }
            if (!isdefined(self.var_68c35930) || level flag::get(#"phonograph_playing")) {
                continue;
            }
            self.var_68c35930 thread function_64834acd();
            level flag::set(#"phonograph_playing");
            self.var_68c35930 notify(#"hash_2b02b5a5a9af36e0");
            self.var_68c35930 notify(#"hash_44144f80f295a13f");
            self.var_68c35930 playsound(#"hash_7c91fa775c8a0134");
            if (self.var_68c35930.script_int == 0) {
                self.var_68c35930 playloopsound(#"hash_3d52d57aceee74ce");
            } else if (self.var_68c35930.script_int == 7) {
                self.var_68c35930 playloopsound(#"hash_5b492b8c8a8bb4d8");
            } else if (self.var_68c35930.script_int == 8) {
                self.var_68c35930 playloopsound(#"hash_704a9f09fe3a48c2");
            } else {
                self.var_68c35930 playloopsound(#"hash_2367dae4a69a4294");
            }
            wait(1);
            self.var_68c35930 zm_vo::function_cf1e151c(var_314c1b5a[self.var_68c35930.script_int]);
            level flag::clear(#"phonograph_playing");
            self.var_68c35930 notify(#"hash_53eb32eaa511640c");
            self.var_68c35930 stoploopsound();
            self.var_68c35930 playsound(#"hash_376eaa517cd09530");
            self.var_68c35930 thread function_ad05f6f3();
        }
    }
}

// Namespace namespace_57873b62/namespace_8125d942
// Params 0, eflags: 0x1 linked
// Checksum 0x97239017, Offset: 0x2430
// Size: 0x66
function function_64834acd() {
    self notify("5029a7add8d29938");
    self endon("5029a7add8d29938");
    self endon(#"death");
    while (1) {
        self function_21a979f7();
        self waittill(#"hash_44144f80f295a13f");
    }
}

// Namespace namespace_57873b62/namespace_8125d942
// Params 0, eflags: 0x1 linked
// Checksum 0x2c276fdb, Offset: 0x24a0
// Size: 0x9e
function function_21a979f7() {
    self endon(#"hash_53eb32eaa511640c");
    while (1) {
        if (self.angles[0] < 360) {
            self.angles = self.angles + vectorscale((1, 0, 0), 360);
        }
        self rotatepitch((self.angles[0] + 180) * -1, 2);
        self waittill(#"rotatedone");
    }
}

// Namespace namespace_57873b62/namespace_8125d942
// Params 0, eflags: 0x1 linked
// Checksum 0xda1802a7, Offset: 0x2548
// Size: 0xb4
function function_ad05f6f3() {
    self notify(#"hash_2b02b5a5a9af36e0");
    self endon(#"hash_2b02b5a5a9af36e0");
    while (isdefined(self)) {
        s_result = undefined;
        s_result = self waittill(#"damage");
        if (isplayer(s_result.attacker)) {
            break;
        }
    }
    playsoundatposition(#"hash_2cf59d6222de4f6f", self.origin);
    self delete();
}

// Namespace namespace_57873b62/namespace_8125d942
// Params 0, eflags: 0x1 linked
// Checksum 0x3891c72e, Offset: 0x2608
// Size: 0xa94
function function_558936ed() {
    s_flag = struct::get(#"spin_cycle");
    t_flag = spawn("trigger_damage", s_flag.origin - vectorscale((0, 0, 1), 10), 0, 12, 10);
    mdl_flag = util::spawn_model(#"hash_2ce772d39f43cc44" + "a", s_flag.origin, s_flag.angles);
    mdl_flag setscale(0.18);
    mdl_flag function_7c9ab1ea(t_flag, "b");
    mdl_flag function_7c9ab1ea(t_flag, "c");
    mdl_flag function_7c9ab1ea(t_flag, "d");
    mdl_flag function_7c9ab1ea(t_flag, "e");
    mdl_flag function_7c9ab1ea(t_flag, "f");
    mdl_flag function_7c9ab1ea(t_flag, "g");
    mdl_flag function_7c9ab1ea(t_flag, "h");
    mdl_flag function_7c9ab1ea(t_flag, "i");
    mdl_flag function_7c9ab1ea(t_flag, "i");
    mdl_flag function_7c9ab1ea(t_flag, "h");
    mdl_flag function_7c9ab1ea(t_flag, "j");
    mdl_flag function_7c9ab1ea(t_flag, "d");
    mdl_flag function_7c9ab1ea(t_flag, "k");
    mdl_flag function_7c9ab1ea(t_flag, "h");
    mdl_flag function_7c9ab1ea(t_flag, "l");
    mdl_flag function_7c9ab1ea(t_flag, "b");
    mdl_flag function_7c9ab1ea(t_flag, "e");
    mdl_flag function_7c9ab1ea(t_flag, "i");
    mdl_flag function_7c9ab1ea(t_flag, "j");
    mdl_flag function_7c9ab1ea(t_flag, "d");
    mdl_flag function_7c9ab1ea(t_flag, "b");
    mdl_flag function_7c9ab1ea(t_flag, "m");
    mdl_flag function_7c9ab1ea(t_flag, "f");
    mdl_flag function_7c9ab1ea(t_flag, "d");
    mdl_flag function_7c9ab1ea(t_flag, "h");
    mdl_flag function_7c9ab1ea(t_flag, "a");
    mdl_flag function_7c9ab1ea(t_flag, "b");
    mdl_flag function_7c9ab1ea(t_flag, "c");
    mdl_flag function_7c9ab1ea(t_flag, "e");
    mdl_flag function_7c9ab1ea(t_flag, "d");
    mdl_flag function_7c9ab1ea(t_flag, "k");
    mdl_flag function_7c9ab1ea(t_flag, "n");
    mdl_flag function_7c9ab1ea(t_flag, "e");
    mdl_flag function_7c9ab1ea(t_flag, "m");
    mdl_flag function_7c9ab1ea(t_flag, "d");
    mdl_flag function_7c9ab1ea(t_flag, "o");
    mdl_flag function_7c9ab1ea(t_flag, "b");
    mdl_flag function_7c9ab1ea(t_flag, "e");
    mdl_flag function_7c9ab1ea(t_flag, "g");
    mdl_flag function_7c9ab1ea(t_flag, "n");
    mdl_flag function_7c9ab1ea(t_flag, "b");
    mdl_flag function_7c9ab1ea(t_flag, "i");
    mdl_flag function_7c9ab1ea(t_flag, "h");
    mdl_flag function_7c9ab1ea(t_flag, "p");
    mdl_flag function_7c9ab1ea(t_flag, "q");
    mdl_flag function_7c9ab1ea(t_flag, "h");
    mdl_flag function_7c9ab1ea(t_flag, "a");
    mdl_flag function_7c9ab1ea(t_flag, "b");
    mdl_flag function_7c9ab1ea(t_flag, "c");
    mdl_flag function_7c9ab1ea(t_flag, "e");
    mdl_flag function_7c9ab1ea(t_flag, "h");
    mdl_flag function_7c9ab1ea(t_flag, "d");
    mdl_flag function_7c9ab1ea(t_flag, "c");
    mdl_flag function_7c9ab1ea(t_flag, "e");
    mdl_flag function_7c9ab1ea(t_flag, "p");
    mdl_flag function_7c9ab1ea(t_flag, "h");
    mdl_flag function_7c9ab1ea(t_flag, "j");
    mdl_flag function_7c9ab1ea(t_flag, "d");
    mdl_flag function_7c9ab1ea(t_flag, "b");
    mdl_flag function_7c9ab1ea(t_flag, "r");
    mdl_flag function_7c9ab1ea(t_flag, "h");
    mdl_flag function_7c9ab1ea(t_flag, "s");
    mdl_flag function_7c9ab1ea(t_flag, "n");
    mdl_flag function_7c9ab1ea(t_flag, "q");
    mdl_flag function_7c9ab1ea(t_flag, "b");
    mdl_flag function_7c9ab1ea(t_flag, "m");
    mdl_flag function_7c9ab1ea(t_flag, "d");
    mdl_flag function_7c9ab1ea(t_flag, "n");
    mdl_flag function_7c9ab1ea(t_flag, "i");
    mdl_flag function_7c9ab1ea(t_flag, "i");
    mdl_flag function_7c9ab1ea(t_flag, "t");
    mdl_flag function_7c9ab1ea(t_flag, "f");
    mdl_flag function_7c9ab1ea(t_flag, "e");
    mdl_flag function_7c9ab1ea(t_flag, "q");
    mdl_flag function_7c9ab1ea(t_flag, "k");
    mdl_flag function_7c9ab1ea(t_flag, "h");
    mdl_flag function_7c9ab1ea(t_flag, "j");
    mdl_flag function_7c9ab1ea(t_flag);
}

// Namespace namespace_57873b62/namespace_8125d942
// Params 2, eflags: 0x1 linked
// Checksum 0xe36c2e04, Offset: 0x30a8
// Size: 0x1d2
function function_7c9ab1ea(t_flag, var_f96aafd8) {
    while (1) {
        s_result = undefined;
        s_result = t_flag waittill(#"trigger");
        if (isdefined(s_result.activator) && isplayer(s_result.activator)) {
            self rotateroll(360, 0.25);
            self waittill(#"rotatedone");
            if (!isdefined(var_f96aafd8)) {
                self delete();
                break;
            }
            self setmodel(#"hash_2ce772d39f43cc44" + var_f96aafd8);
            self setscale(0.18);
            self.angles = (0, self.angles[1], self.angles[2]);
            self hide();
            waitframe(1);
            self show();
            self rotateroll(360, 0.5);
            self waittill(#"rotatedone");
            self.angles = (0, self.angles[1], self.angles[2]);
            break;
        }
    }
}

// Namespace namespace_57873b62/namespace_8125d942
// Params 0, eflags: 0x1 linked
// Checksum 0xc3ace64c, Offset: 0x3288
// Size: 0x1d4
function function_b11c26c9() {
    e_sway = getent("skybox_water", "targetname");
    e_homunculus = getent("life_preserver_catch", "targetname");
    var_21bb918c = getent("life_preserver_catch" + "_l", "targetname");
    var_c8279d50 = getent("life_preserver_catch" + "_r", "targetname");
    e_homunculus setscale(5);
    var_21bb918c setscale(1.75);
    var_c8279d50 setscale(1.75);
    e_homunculus linkto(e_sway);
    var_21bb918c linkto(e_sway);
    var_c8279d50 linkto(e_sway);
    e_homunculus ghost();
    var_21bb918c ghost();
    var_c8279d50 ghost();
    level thread function_c867ac0a(e_homunculus, var_21bb918c, var_c8279d50);
}

// Namespace namespace_57873b62/namespace_8125d942
// Params 3, eflags: 0x1 linked
// Checksum 0xbe7defae, Offset: 0x3468
// Size: 0x2c0
function function_e1a452f5(e_homunculus, var_21bb918c, var_c8279d50) {
    level endon(#"hash_6aec924aa525b354");
    e_homunculus setinvisibletoplayer(self);
    var_21bb918c setinvisibletoplayer(self);
    var_c8279d50 setinvisibletoplayer(self);
    while (1) {
        t_vis = trigger::wait_till("trigger_life_preserver", "targetname", self);
        player = t_vis.who;
        if (isalive(player)) {
            weapon = player getcurrentweapon();
            if (player === self && isdefined(weapon) && player adsbuttonpressed() && util::getweaponclass(weapon) === #"weapon_sniper") {
                wait(0.2);
                if (isalive(player)) {
                    level notify(#"hash_57175159706ca9bf");
                    e_homunculus setvisibletoplayer(player);
                    var_21bb918c setvisibletoplayer(player);
                    var_c8279d50 setvisibletoplayer(player);
                    do {
                        wait(0.25);
                    } while(isalive(player) && player adsbuttonpressed() && player istouching(t_vis) && player util::is_looking_at(e_homunculus));
                    if (isalive(player)) {
                        e_homunculus setinvisibletoplayer(player);
                        var_21bb918c setinvisibletoplayer(player);
                        var_c8279d50 setinvisibletoplayer(player);
                    }
                }
            }
        }
        wait(0.2);
    }
}

// Namespace namespace_57873b62/namespace_8125d942
// Params 3, eflags: 0x1 linked
// Checksum 0xc3aecf2d, Offset: 0x3730
// Size: 0x106c
function function_c867ac0a(e_homunculus, var_21bb918c, var_c8279d50) {
    level waittill(#"power_on");
    trigger::wait_till("trigger_life_preserver");
    e_homunculus thread scene::play(#"aib_t8_zm_zod_homunculus_idle_01", e_homunculus);
    e_homunculus show();
    var_21bb918c show();
    var_c8279d50 show();
    foreach (player in util::get_players()) {
        player thread function_e1a452f5(e_homunculus, var_21bb918c, var_c8279d50);
    }
    callback::on_connect(&function_e1a452f5, undefined, e_homunculus, var_21bb918c, var_c8279d50);
    level waittill(#"hash_57175159706ca9bf");
    e_homunculus sethighdetail(1);
    var_21bb918c sethighdetail(1);
    var_c8279d50 sethighdetail(1);
    var_21bb918c.var_55e11aa9 = util::spawn_model("tag_origin", var_21bb918c.origin);
    var_c8279d50.var_55e11aa9 = util::spawn_model("tag_origin", var_c8279d50.origin);
    var_21bb918c.var_55e11aa9 linkto(level.e_sway);
    var_c8279d50.var_55e11aa9 linkto(level.e_sway);
    a_angles = function_a7ae2066();
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"start");
    wait(1);
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"y");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"o");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"u");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"space");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"h");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"a");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"v");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"e");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"space");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"q");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"u");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"e");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"s");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"t");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"i");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"o");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"n");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"s");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"space");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"o");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"f");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"space");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"y");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"o");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"u");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"r");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"space");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"f");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"a");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"m");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"i");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"l");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"y");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"s");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"space");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"h");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"i");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"s");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"t");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"o");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"r");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"y");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"space");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"y");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"o");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"u");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"space");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"m");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"a");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"y");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"space");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"n");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"o");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"t");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"space");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"l");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"i");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"k");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"e");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"space");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"w");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"h");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"e");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"r");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"e");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"space");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"t");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"h");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"e");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"space");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"a");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"n");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"s");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"w");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"e");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"r");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"s");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"space");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"l");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"e");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"a");
    function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, #"d");
    callback::remove_on_connect(&function_e1a452f5);
    level notify(#"hash_6aec924aa525b354");
    var_21bb918c.var_55e11aa9 delete();
    var_c8279d50.var_55e11aa9 delete();
    var_21bb918c delete();
    var_c8279d50 delete();
    e_homunculus scene::stop(#"aib_t8_zm_zod_homunculus_idle_01", 1);
    if (isdefined(e_homunculus)) {
        e_homunculus delete();
    }
}

// Namespace namespace_57873b62/namespace_8125d942
// Params 4, eflags: 0x1 linked
// Checksum 0x625a2182, Offset: 0x47a8
// Size: 0x164
function function_dc92e2d4(a_angles, var_21bb918c, var_c8279d50, str_letter) {
    var_21bb918c unlink();
    var_c8279d50 unlink();
    var_21bb918c rotateto(a_angles[#"left"][str_letter], 0.5);
    var_c8279d50 rotateto(a_angles[#"right"][str_letter], 0.5);
    var_c8279d50 waittill(#"rotatedone");
    var_21bb918c.origin = var_21bb918c.var_55e11aa9.origin;
    var_c8279d50.origin = var_c8279d50.var_55e11aa9.origin;
    var_21bb918c linkto(level.e_sway);
    var_c8279d50 linkto(level.e_sway);
    wait(1.25);
}

// Namespace namespace_57873b62/namespace_8125d942
// Params 0, eflags: 0x1 linked
// Checksum 0xb999511b, Offset: 0x4918
// Size: 0x5a6
function function_a7ae2066() {
    var_b1e4b9a0 = [];
    var_75d1ad4a = [];
    var_b1e4b9a0[#"start"] = vectorscale((0, 1, 0), 270);
    var_75d1ad4a[#"start"] = vectorscale((1, 1, 0), 90);
    var_b1e4b9a0[#"space"] = (135, 90, 0);
    var_75d1ad4a[#"space"] = (135, 270, 0);
    var_b1e4b9a0[#"y"] = (45, 270, 0);
    var_75d1ad4a[#"y"] = vectorscale((1, 1, 0), 90);
    var_b1e4b9a0[#"o"] = (90, 270, 0);
    var_75d1ad4a[#"o"] = (45, 270, 0);
    var_b1e4b9a0[#"u"] = (45, 270, 0);
    var_75d1ad4a[#"u"] = (45, 90, 0);
    var_b1e4b9a0[#"h"] = (90, 270, 0);
    var_75d1ad4a[#"h"] = (135, 270, 0);
    var_b1e4b9a0[#"a"] = (135, 270, 0);
    var_75d1ad4a[#"a"] = (180, 90, 0);
    var_b1e4b9a0[#"v"] = vectorscale((0, 1, 0), 270);
    var_75d1ad4a[#"v"] = (135, 90, 0);
    var_b1e4b9a0[#"e"] = (180, 270, 0);
    var_75d1ad4a[#"e"] = (45, 90, 0);
    var_b1e4b9a0[#"q"] = (90, 270, 0);
    var_75d1ad4a[#"q"] = (45, 90, 0);
    var_b1e4b9a0[#"s"] = (90, 270, 0);
    var_75d1ad4a[#"s"] = (135, 90, 0);
    var_b1e4b9a0[#"t"] = (45, 270, 0);
    var_75d1ad4a[#"t"] = vectorscale((0, 1, 0), 90);
    var_b1e4b9a0[#"i"] = (45, 270, 0);
    var_75d1ad4a[#"i"] = (135, 270, 0);
    var_b1e4b9a0[#"n"] = (135, 270, 0);
    var_75d1ad4a[#"n"] = (135, 90, 0);
    var_b1e4b9a0[#"f"] = (180, 270, 0);
    var_75d1ad4a[#"f"] = vectorscale((1, 1, 0), 90);
    var_b1e4b9a0[#"r"] = (90, 270, 0);
    var_75d1ad4a[#"r"] = vectorscale((1, 1, 0), 90);
    var_b1e4b9a0[#"m"] = (135, 270, 0);
    var_75d1ad4a[#"m"] = vectorscale((1, 1, 0), 90);
    var_b1e4b9a0[#"l"] = (135, 270, 0);
    var_75d1ad4a[#"l"] = (45, 90, 0);
    var_b1e4b9a0[#"k"] = (135, 270, 0);
    var_75d1ad4a[#"k"] = vectorscale((0, 1, 0), 90);
    var_b1e4b9a0[#"w"] = (45, 90, 0);
    var_75d1ad4a[#"w"] = vectorscale((1, 1, 0), 90);
    var_b1e4b9a0[#"d"] = vectorscale((0, 1, 0), 270);
    var_75d1ad4a[#"d"] = (180, 90, 0);
    a_return = [];
    a_return[#"left"] = var_b1e4b9a0;
    a_return[#"right"] = var_75d1ad4a;
    return a_return;
}

// Namespace namespace_57873b62/namespace_8125d942
// Params 0, eflags: 0x1 linked
// Checksum 0x9f2255e5, Offset: 0x4ec8
// Size: 0xe5c
function function_678d6318() {
    s_trigger_loc = struct::get(#"hash_2ca9b43546a096e3");
    s_unitrigger = s_trigger_loc zm_unitrigger::create(undefined, (180, 180, 64), &zm_unitrigger::function_69168e61, 0, 1);
    while (1) {
        s_result = undefined;
        s_result = s_trigger_loc waittill(#"trigger_activated");
        player = s_result.e_who;
        if (isalive(player) && isplayer(player)) {
            if (isdefined(player.e_storm) && isdefined(s_unitrigger.trigger)) {
                if (player.e_storm istouching(s_unitrigger.trigger)) {
                    break;
                }
            }
        }
        wait(0.25);
    }
    var_8940de41 = function_7199779e();
    var_ff439c7c = struct::get_array(#"hash_12938a97ea1a6c1");
    var_ba1a70ec = struct::get_array(#"hash_12935a97ea1a1a8");
    var_cf41d641 = struct::get_array(#"hash_12936a97ea1a35b");
    level thread function_f64a749c(var_ff439c7c, var_8940de41, #"r");
    level thread function_f64a749c(var_ba1a70ec, var_8940de41, #"u");
    level thread function_f64a749c(var_cf41d641, var_8940de41, #"n");
    function_bef7f017(s_trigger_loc);
    level thread function_f64a749c(var_ff439c7c, var_8940de41, #"n");
    level thread function_f64a749c(var_ba1a70ec, var_8940de41, #"i");
    level thread function_f64a749c(var_cf41d641, var_8940de41, #"n");
    function_bef7f017(s_trigger_loc);
    level thread function_f64a749c(var_ff439c7c, var_8940de41, #"g");
    level thread function_f64a749c(var_ba1a70ec, var_8940de41, #"space");
    level thread function_f64a749c(var_cf41d641, var_8940de41, #"f");
    function_bef7f017(s_trigger_loc);
    level thread function_f64a749c(var_ff439c7c, var_8940de41, #"r");
    level thread function_f64a749c(var_ba1a70ec, var_8940de41, #"o");
    level thread function_f64a749c(var_cf41d641, var_8940de41, #"m");
    function_bef7f017(s_trigger_loc);
    level thread function_f64a749c(var_ff439c7c, var_8940de41, #"space");
    level thread function_f64a749c(var_ba1a70ec, var_8940de41, #"y");
    level thread function_f64a749c(var_cf41d641, var_8940de41, #"o");
    function_bef7f017(s_trigger_loc);
    level thread function_f64a749c(var_ff439c7c, var_8940de41, #"u");
    level thread function_f64a749c(var_ba1a70ec, var_8940de41, #"r");
    level thread function_f64a749c(var_cf41d641, var_8940de41, #"space");
    function_bef7f017(s_trigger_loc);
    level thread function_f64a749c(var_ff439c7c, var_8940de41, #"f");
    level thread function_f64a749c(var_ba1a70ec, var_8940de41, #"o");
    level thread function_f64a749c(var_cf41d641, var_8940de41, #"r");
    function_bef7f017(s_trigger_loc);
    level thread function_f64a749c(var_ff439c7c, var_8940de41, #"m");
    level thread function_f64a749c(var_ba1a70ec, var_8940de41, #"e");
    level thread function_f64a749c(var_cf41d641, var_8940de41, #"r");
    function_bef7f017(s_trigger_loc);
    level thread function_f64a749c(var_ff439c7c, var_8940de41, #"space");
    level thread function_f64a749c(var_ba1a70ec, var_8940de41, #"l");
    level thread function_f64a749c(var_cf41d641, var_8940de41, #"i");
    function_bef7f017(s_trigger_loc);
    level thread function_f64a749c(var_ff439c7c, var_8940de41, #"f");
    level thread function_f64a749c(var_ba1a70ec, var_8940de41, #"e");
    level thread function_f64a749c(var_cf41d641, var_8940de41, #"space");
    function_bef7f017(s_trigger_loc);
    level thread function_f64a749c(var_ff439c7c, var_8940de41, #"d");
    level thread function_f64a749c(var_ba1a70ec, var_8940de41, #"o");
    level thread function_f64a749c(var_cf41d641, var_8940de41, #"e");
    function_bef7f017(s_trigger_loc);
    level thread function_f64a749c(var_ff439c7c, var_8940de41, #"s");
    level thread function_f64a749c(var_ba1a70ec, var_8940de41, #"space");
    level thread function_f64a749c(var_cf41d641, var_8940de41, #"n");
    function_bef7f017(s_trigger_loc);
    level thread function_f64a749c(var_ff439c7c, var_8940de41, #"o");
    level thread function_f64a749c(var_ba1a70ec, var_8940de41, #"t");
    level thread function_f64a749c(var_cf41d641, var_8940de41, #"space");
    function_bef7f017(s_trigger_loc);
    level thread function_f64a749c(var_ff439c7c, var_8940de41, #"e");
    level thread function_f64a749c(var_ba1a70ec, var_8940de41, #"r");
    level thread function_f64a749c(var_cf41d641, var_8940de41, #"a");
    function_bef7f017(s_trigger_loc);
    level thread function_f64a749c(var_ff439c7c, var_8940de41, #"s");
    level thread function_f64a749c(var_ba1a70ec, var_8940de41, #"e");
    level thread function_f64a749c(var_cf41d641, var_8940de41, #"space");
    function_bef7f017(s_trigger_loc);
    level thread function_f64a749c(var_ff439c7c, var_8940de41, #"t");
    level thread function_f64a749c(var_ba1a70ec, var_8940de41, #"h");
    level thread function_f64a749c(var_cf41d641, var_8940de41, #"e");
    function_bef7f017(s_trigger_loc);
    level thread function_f64a749c(var_ff439c7c, var_8940de41, #"space");
    level thread function_f64a749c(var_ba1a70ec, var_8940de41, #"s");
    level thread function_f64a749c(var_cf41d641, var_8940de41, #"i");
    function_bef7f017(s_trigger_loc);
    level thread function_f64a749c(var_ff439c7c, var_8940de41, #"n");
    level thread function_f64a749c(var_ba1a70ec, var_8940de41, #"s");
    level thread function_f64a749c(var_cf41d641, var_8940de41, #"space");
    function_bef7f017(s_trigger_loc);
    level thread function_f64a749c(var_ff439c7c, var_8940de41, #"o");
    level thread function_f64a749c(var_ba1a70ec, var_8940de41, #"f");
    level thread function_f64a749c(var_cf41d641, var_8940de41, #"space");
    function_bef7f017(s_trigger_loc);
    level thread function_f64a749c(var_ff439c7c, var_8940de41, #"y");
    level thread function_f64a749c(var_ba1a70ec, var_8940de41, #"o");
    level thread function_f64a749c(var_cf41d641, var_8940de41, #"u");
    function_bef7f017(s_trigger_loc);
    level thread function_f64a749c(var_ff439c7c, var_8940de41, #"r");
    level thread function_f64a749c(var_ba1a70ec, var_8940de41, #"space");
    level thread function_f64a749c(var_cf41d641, var_8940de41, #"p");
    function_bef7f017(s_trigger_loc);
    level thread function_f64a749c(var_ff439c7c, var_8940de41, #"a");
    level thread function_f64a749c(var_ba1a70ec, var_8940de41, #"s");
    level thread function_f64a749c(var_cf41d641, var_8940de41, #"t");
    function_bef7f017(s_trigger_loc);
    zm_unitrigger::unregister_unitrigger(s_unitrigger);
}

// Namespace namespace_57873b62/namespace_8125d942
// Params 1, eflags: 0x1 linked
// Checksum 0x2ed56c3d, Offset: 0x5d30
// Size: 0x234
function function_bef7f017(s_trigger_loc) {
    var_cefd4edd = undefined;
    while (1) {
        a_players = util::get_active_players();
        b_reset = 1;
        n_current_time = gettime();
        foreach (player in a_players) {
            if (isalive(player) && isdefined(s_trigger_loc.s_unitrigger) && isdefined(s_trigger_loc.s_unitrigger.trigger)) {
                if (player istouching(s_trigger_loc.s_unitrigger.trigger)) {
                    b_reset = 0;
                    var_cefd4edd = undefined;
                    break;
                } else {
                    waitframe(1);
                }
            }
        }
        if (b_reset) {
            if (!isdefined(var_cefd4edd)) {
                var_cefd4edd = gettime();
            }
            if (n_current_time > var_cefd4edd + 1500) {
                level notify(#"hash_20b6d10f9de5d13a");
                foreach (player in util::get_active_players()) {
                    player playrumbleonentity(#"hash_2c759068c6a8567d");
                }
                break;
            }
        }
        wait(0.5);
    }
    s_trigger_loc waittill(#"trigger_activated");
}

// Namespace namespace_57873b62/namespace_8125d942
// Params 3, eflags: 0x1 linked
// Checksum 0x9d0f79a4, Offset: 0x5f70
// Size: 0xc0
function function_f64a749c(var_6fc696ed, var_8940de41, str_letter) {
    foreach (struct in var_6fc696ed) {
        n_value = var_8940de41[str_letter][struct.script_int - 1];
        if (n_value) {
            struct thread function_24d85b68();
        }
    }
}

// Namespace namespace_57873b62/namespace_8125d942
// Params 0, eflags: 0x1 linked
// Checksum 0xa28eae84, Offset: 0x6038
// Size: 0x12c
function function_24d85b68() {
    level endon(#"hash_20b6d10f9de5d13a");
    while (1) {
        a_players = util::get_active_players();
        b_rumble = 0;
        foreach (player in a_players) {
            if (player.origin[2] < 750 && distancesquared(player.origin, self.origin) < 169) {
                player playrumbleonentity(#"hash_2c759068c6a8567d");
            }
            waitframe(1);
        }
        wait(0.2);
    }
}

// Namespace namespace_57873b62/namespace_8125d942
// Params 0, eflags: 0x1 linked
// Checksum 0x180fd400, Offset: 0x6170
// Size: 0x476
function function_7199779e() {
    a_letters = [];
    a_letters[#"space"] = array(0, 0, 0, 0, 0, 0);
    a_letters[#"r"] = array(1, 0, 1, 1, 1, 0);
    a_letters[#"u"] = array(1, 0, 0, 0, 1, 1);
    a_letters[#"n"] = array(1, 1, 0, 1, 1, 0);
    a_letters[#"i"] = array(0, 1, 1, 0, 0, 0);
    a_letters[#"g"] = array(1, 1, 1, 1, 0, 0);
    a_letters[#"f"] = array(1, 1, 1, 0, 0, 0);
    a_letters[#"o"] = array(1, 0, 0, 1, 1, 0);
    a_letters[#"m"] = array(1, 1, 0, 0, 1, 0);
    a_letters[#"y"] = array(1, 1, 0, 1, 1, 1);
    a_letters[#"e"] = array(1, 0, 0, 1, 0, 0);
    a_letters[#"l"] = array(1, 0, 1, 0, 1, 0);
    a_letters[#"d"] = array(1, 1, 0, 1, 0, 0);
    a_letters[#"s"] = array(0, 1, 1, 0, 1, 0);
    a_letters[#"n"] = array(1, 1, 0, 1, 1, 0);
    a_letters[#"t"] = array(0, 1, 1, 1, 1, 0);
    a_letters[#"a"] = array(1, 0, 0, 0, 0, 0);
    a_letters[#"h"] = array(1, 0, 1, 1, 0, 0);
    a_letters[#"p"] = array(1, 1, 1, 0, 1, 0);
    return a_letters;
}

