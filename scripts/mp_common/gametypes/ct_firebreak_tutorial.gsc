// Atian COD Tools GSC decompiler test
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using scripts\mp_common\gametypes\ct_vo.gsc;
#using scripts\mp_common\gametypes\ct_utils.gsc;
#using scripts\mp_common\gametypes\ct_gadgets.gsc;
#using scripts\mp_common\gametypes\ct_bots.gsc;
#using scripts\core_common\bots\bot_stance.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\abilities\gadgets\gadget_radiation_field.gsc;
#using script_20a30e3aaa7368c9;

#namespace ct_firebreak_tutorial;

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0x85f51094, Offset: 0x1338
// Size: 0xf2
function init() {
    level.var_ae120f18 = array("vox_tvoi_tutor_fire_start_0", "vox_tvoi_tutor_fire_start_1");
    level.progress_bar = luielembar_ct::register("progress_bar");
    /#
        level thread function_41dcd216();
    #/
    level flag::init("fin2_killstreak_used");
    level flag::init("fin2_killstreak_earned");
    level.var_eea9be19 = 150;
    level.var_c8f47cbe = 3;
    level thread ct_utils::function_6b71f442();
    level.var_c8f47cbe = 3;
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 1, eflags: 0x0
// Checksum 0x229d505a, Offset: 0x1438
// Size: 0x34
function function_222141a5(var_58d9f1c6 = 1) {
    self ct_bots::function_fd2d220e();
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0x1b873690, Offset: 0x1478
// Size: 0x76
function setup() {
    level.a_ai_targets = [];
    level clientfield::set("area_arrows_specialist", 4);
    level.var_f1ab3e1 = 0;
    level.var_2179866f = 0;
    level.var_f304b8cb = 0;
    level.var_29324553 = 0;
    level.var_86b67c3f = 1;
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 1, eflags: 0x0
// Checksum 0x139866ad, Offset: 0x14f8
// Size: 0x24
function function_8cea4f8f(e_player) {
    e_player function_c9ff0dce();
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0xf0ae1805, Offset: 0x1528
// Size: 0x80c
function function_c9ff0dce() {
    self ct_utils::player_reset();
    if (self.team == #"axis") {
        self.oobdisabled = 1;
        if (isdefined(level.var_8ca3c62)) {
            if (level.var_8ca3c62 == 1) {
                level.var_aae2a361 = 1;
                self thread function_7175d1b1();
            } else if (level.var_8ca3c62 == 2) {
                level.var_aae2a361 = 1;
                self thread function_9d2afacf();
            } else if (level.var_8ca3c62 == 3) {
                level.var_aae2a361 = 0;
                self thread function_da1637ef();
            } else if (level.var_8ca3c62 == 5) {
                level.var_aae2a361 = 1;
                self thread function_70aa8633();
            } else if (level.var_8ca3c62 == 6) {
                level.var_aae2a361 = 1;
                self thread function_12c35e8c();
            } else if (level.var_8ca3c62 == 7) {
                level.var_aae2a361 = 1;
                switch (level.var_b7fa636e) {
                case #"tut_fin1_fight1":
                    self.bot.var_b2b8f0b6 = 700;
                    self.bot.var_e8c941d6 = 1200;
                    self thread function_32739e2();
                    break;
                case #"tut_fin1_fight2":
                    self.bot.var_b2b8f0b6 = 350;
                    self.bot.var_e8c941d6 = 500;
                    self thread function_e5272e23();
                    break;
                case #"tut_fin1_fight3":
                    self.bot.var_b2b8f0b6 = 300;
                    self.bot.var_e8c941d6 = 500;
                    self thread function_2d28530();
                    break;
                case #"tut_fin1_fight4":
                    self.bot.var_b2b8f0b6 = 200;
                    self.bot.var_e8c941d6 = 400;
                    self thread function_56e61719();
                    break;
                case #"tut_fin1_fight5":
                    self.bot.var_b2b8f0b6 = 200;
                    self.bot.var_e8c941d6 = 500;
                    self thread function_42e85cab();
                    break;
                }
            } else if (level.var_8ca3c62 == 8) {
                level.var_aae2a361 = 0;
                if (!(level flag::exists("fin2_killstreak_used") || !level flag::get("fin2_killstreak_used"))) {
                    self.bot.var_b2b8f0b6 = 400;
                    self.bot.var_e8c941d6 = 800;
                } else {
                    self.bot.var_b2b8f0b6 = 750;
                    self.bot.var_e8c941d6 = 1500;
                }
                self thread function_63b62665();
            }
        }
        if (isdefined(level.var_aae2a361) && level.var_aae2a361) {
            self thread ct_utils::function_8963dae3();
        }
        self thread function_95da118b();
        self thread ct_utils::function_5149c890(1, 1);
    } else if (!isbot(self)) {
        if (isdefined(level.var_8ca3c62)) {
            level.var_86b67c3f = 1;
            self thread function_bc354cb8();
            if (level.var_8ca3c62 == 1) {
                self thread ct_utils::function_61d750d4("s_tut_purifier_1_respawn");
            } else if (level.var_8ca3c62 == 2) {
                self thread ct_utils::function_61d750d4("s_tut_purifier_2_respawn");
            } else if (level.var_8ca3c62 == 3) {
                self thread ct_utils::function_61d750d4("s_tut_purifier_3_respawn");
            } else if (level.var_8ca3c62 == 4) {
                if (isdefined(level.var_6b1fd2c5) && level.var_6b1fd2c5) {
                    self thread ct_utils::function_61d750d4("s_tut_rad_1_respawn");
                } else {
                    self thread ct_utils::function_61d750d4("s_tut_rad_1_respawn_before_goto");
                }
            } else if (level.var_8ca3c62 == 5) {
                self thread ct_utils::function_61d750d4("s_tut_rad_2_respawn");
            } else if (level.var_8ca3c62 == 6) {
                self thread ct_utils::function_61d750d4("s_tut_rad_3_respawn");
            } else if (level.var_8ca3c62 == 7) {
                if (isdefined(level.var_b7fa636e)) {
                    switch (level.var_b7fa636e) {
                    case #"tut_fin1_fight1":
                        self thread ct_utils::function_61d750d4("s_tut_fin1_fight1_respawn");
                        break;
                    case #"tut_fin1_fight2":
                        self thread ct_utils::function_61d750d4("s_tut_fin1_fight2_respawn");
                        break;
                    case #"tut_fin1_fight3":
                        self thread ct_utils::function_61d750d4("s_tut_fin1_fight3_respawn");
                        break;
                    case #"tut_fin1_fight4":
                        self thread ct_utils::function_61d750d4("s_tut_fin1_fight4_respawn");
                        break;
                    case #"tut_fin1_fight5":
                        self thread ct_utils::function_61d750d4("s_tut_fin1_fight5_respawn");
                        break;
                    }
                } else {
                    self thread ct_utils::function_61d750d4("s_tut_fin1_fight1_respawn");
                }
                waitframe(1);
                self thread function_222141a5();
            } else if (level.var_8ca3c62 == 8) {
                self thread ct_utils::function_61d750d4("s_tut_fin2_fight_respawn");
                waitframe(1);
                self thread function_222141a5();
            }
        }
    }
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0x985c6b4e, Offset: 0x1d40
// Size: 0x9a
function function_bc354cb8() {
    level endon(#"combattraining_logic_finished");
    self endon(#"death");
    ct_utils::function_fdfeb384();
    while (self.overrideplayerdamage !== &gadget_radiation_field::player_damage_override) {
        waitframe(1);
    }
    self.var_19103054 = &gadget_radiation_field::player_damage_override;
    self.overrideplayerdamage = &overridedamage_player;
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0xa03350c1, Offset: 0x1de8
// Size: 0x5e
function function_4ff8f31a() {
    level endon(#"combattraining_logic_finished");
    self waittill(#"loadout_given");
    self ct_bots::function_26d45f32(1, 1);
    self notify(#"hash_548a0a9b43e471c8");
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 1, eflags: 0x0
// Checksum 0x6ed63f2b, Offset: 0x1e50
// Size: 0xac
function function_95da118b(str_weapon = #"ar_accurate_t8") {
    level endon(#"combattraining_logic_finished");
    self endon(#"death");
    waitframe(1);
    wpn_default = getweapon(str_weapon);
    self giveweapon(wpn_default);
    self switchtoweapon(wpn_default, 1);
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 11, eflags: 0x0
// Checksum 0x182b2bc6, Offset: 0x1f08
// Size: 0x102
function overridedamage_player(e_inflictor, e_attacker, n_damage, n_dflags, str_means_of_death, weapon, v_point, v_dir, str_hit_loc, n_psoffsettime, var_8b69d5cf) {
    if (isdefined(self.var_19103054)) {
        var_d0621c54 = self [[ self.var_19103054 ]](e_inflictor, e_attacker, n_damage, n_dflags, str_means_of_death, weapon, v_point, v_dir, str_hit_loc, n_psoffsettime, var_8b69d5cf);
    } else {
        var_d0621c54 = n_damage;
    }
    var_754eb193 = int(var_d0621c54 / 2);
    if (isdefined(self.var_99b2032f) && self.var_99b2032f) {
        var_754eb193 = 0;
    }
    return var_754eb193;
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 9, eflags: 0x0
// Checksum 0x7ff7d516, Offset: 0x2018
// Size: 0x280
function function_72ba0df6(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration) {
    if (isbot(self)) {
        self val::reset(#"tut_ignoreall", "ignoreall");
        self ct_bots::function_43df30a8();
        self.prevstate = undefined;
        self.var_ef59b90 = undefined;
        if (isdefined(level.var_8ca3c62)) {
            if (level.var_8ca3c62 == 2) {
                level notify(#"hash_136965b5364389ff");
            } else if (level.var_8ca3c62 == 3) {
                if (isdefined(level.var_fa6ae384)) {
                    level.var_fa6ae384++;
                }
                var_dbb92bad = 8 - level.var_fa6ae384;
                ct_utils::get_player() ct_utils::function_80bf685b(var_dbb92bad);
            } else if (level.var_8ca3c62 == 5) {
                level notify(#"vo_on_rad2_kill");
            } else if (level.var_8ca3c62 == 7 && isdefined(level.var_d599bf0b) && level.var_d599bf0b) {
                if (isdefined(level.var_81896611)) {
                    level.var_81896611++;
                }
                if (isdefined(level.n_enemy_count)) {
                    level.n_enemy_count--;
                }
            } else if (level.var_8ca3c62 == 8) {
                if (isdefined(level.var_4572ae40) && isdefined(self.var_e37e98ba) && self.var_e37e98ba) {
                    level.var_4572ae40--;
                    self.var_e37e98ba = 0;
                }
            }
        }
    } else if (isdefined(level.var_8ca3c62)) {
        if (level.var_8ca3c62 == 7) {
        }
    }
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0x2772beb0, Offset: 0x22a0
// Size: 0x61c
function function_9b9525e9() {
    level endoncallback(&function_c84bc48, #"combattraining_logic_finished");
    level.var_1fa132d3 = 0;
    level.var_e6db911d = 1;
    level.var_6a0c3e3e = 1;
    a_s_loc = struct::get_array("s_reactor_core_multi_enemies", "targetname");
    foreach (s_loc in a_s_loc) {
        s_loc.e_occupant = undefined;
    }
    e_player = ct_utils::get_player();
    e_player thread function_bc354cb8();
    level thread ct_utils::function_9ab507a9("colbounds_tut_all", "colbounds_tut_all_on", "colbounds_tut_all_of", 0, 1, 0);
    level thread ct_utils::function_9ab507a9("colbounds_tut_puf_1", "colbounds_tut_puf_1_on", "colbounds_tut_puf_1_off", 0, 1, 0);
    level thread ct_utils::function_9ab507a9("colbounds_tut_puf_1_front", "colbounds_tut_puf_1_front_on", "colbounds_tut_puf_1_front_off", 0, 1, 0);
    level thread ct_utils::function_9ab507a9("colbounds_tut_puf_2_start", "colbounds_tut_puf_2_start_on", "colbounds_tut_puf_2_start_off", 0, 1, 0);
    level thread ct_utils::function_9ab507a9("colbounds_tut_puf_2_end", "colbounds_tut_puf_2_end_on", "colbounds_tut_puf_2_end_off", 0, 1, 0);
    level thread ct_utils::function_9ab507a9("colbounds_tut_puf_3_end", "colbounds_tut_puf_3_end_on", "colbounds_tut_puf_3_end_off", 0, 1, 0);
    level thread ct_utils::function_9ab507a9("colbounds_tut_rad_1_noback", "colbounds_tut_rad_1_noback_on", "colbounds_tut_rad_1_noback_off", 0, 1, 0);
    level thread ct_utils::function_9ab507a9("colbounds_tut_rad_1_end", "colbounds_tut_rad_1_end_on", "colbounds_tut_rad_1_end_off", 0, 1, 0);
    level thread ct_utils::function_9ab507a9("colbounds_tut_bridge", "colbounds_tut_bridge_on", "colbounds_tut_bridge_off", 0, 1, 0);
    level thread ct_utils::function_9ab507a9("colbounds_tut_fin1_fight1_start", "colbounds_tut_fin1_fights_start_on", "colbounds_tut_fin1_fight1_start_off", 0, 1, 0);
    level thread ct_utils::function_9ab507a9("colbounds_tut_fin1_fight2_start", "colbounds_tut_fin1_fights_start_on", "colbounds_tut_fin1_fight2_start_off", 0, 1, 0);
    level thread ct_utils::function_9ab507a9("colbounds_tut_fin1_fight3_start", "colbounds_tut_fin1_fights_start_on", "colbounds_tut_fin1_fight3_start_off", 0, 1, 0);
    level thread ct_utils::function_9ab507a9("colbounds_tut_fin1_fight5_start", "colbounds_tut_fin1_fights_start_on", "colbounds_tut_fin1_fight5_start_off", 0, 1, 0);
    level notify(#"colbounds_tut_all_on");
    level notify(#"colbounds_tut_fin1_fights_start_on");
    level notify(#"colbounds_tut_puf_1_front_on");
    level.var_e72728b8 = array(#"hero_flamethrower", #"gadget_radiation_field");
    e_player function_d0815f2e();
    e_player function_de43fab3();
    e_player function_951ce866();
    level notify(#"hash_6822294416b67f95");
    e_player function_feee3d4f();
    e_player function_eca698c0();
    e_player function_fcc23983();
    e_player function_235b259b();
    e_player function_c7bb6e59();
    ct_utils::function_9aca2fa0("ct_endgame");
    e_player setnormalhealth(1);
    e_player ct_vo::function_3ca1b77d();
    e_player.var_99b2032f = 1;
    wait(1);
    e_player ct_utils::function_c2a10fc();
    e_player ct_vo::function_831e0584(array("vox_tvoi_tutor_fire_end_0", "vox_tvoi_tutor_fire_end_1"));
    e_player = ct_utils::get_player();
    e_player thread function_6487b2c7();
    ct_utils::onboarding_complete();
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 1, eflags: 0x0
// Checksum 0xc1f9215f, Offset: 0x28c8
// Size: 0x3c
function function_c84bc48(_hash) {
    e_player = ct_utils::get_player();
    e_player thread function_6487b2c7();
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0xed5aded7, Offset: 0x2910
// Size: 0x448
function function_d0815f2e() {
    level endon(#"combattraining_logic_finished", #"tut_stop");
    /#
        if (level flag::get("colbounds_tut_fin1_fight5_start_off") && level.var_e3146bce !== "stand") {
            return;
        }
    #/
    level.var_8ca3c62 = 1;
    self ct_bots::function_26d45f32(1, 1);
    level.var_e72728b8 = array(#"hero_flamethrower", #"gadget_radiation_field");
    self thread ct_vo::function_261ed63c("vox_tvoi_tutor_fire_slide_2_nag", 30, 20);
    self thread ct_utils::function_61c3d59c(#"hash_15262616ac3924f0");
    self ct_utils::tutorial_goto("s_tut_purifier_1_goto");
    level notify(#"hash_60e26e14a51c5211");
    level.var_e72728b8 = array(#"gadget_radiation_field");
    ct_utils::function_e9ab1003(undefined);
    self thread function_2969ccb4();
    self thread ct_gadgets::function_761e1977();
    level notify(#"colbounds_tut_puf_1_on");
    level notify(#"colbounds_tut_puf_1_front_on");
    self ct_vo::function_3ca1b77d();
    var_22feb79f = self gamepadusedlast() ? #"hash_3557e6f234c8594b" : #"hash_35bff554b9fd5865";
    self thread ct_utils::function_61c3d59c(var_22feb79f, undefined);
    self function_b512a9bf(2);
    var_43b8f3ab = getweapon(#"hero_flamethrower");
    do {
        waitframe(1);
        wpn_current = self getcurrentweapon();
    } while(wpn_current != var_43b8f3ab);
    self thread ct_utils::function_c2a10fc();
    function_b3977527(1, 1, 1, 1, "bot_puf_1", 1);
    self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_fire_slide_4_0"));
    self thread ct_vo::function_261ed63c("vox_tvoi_tutor_fire_slide_4_nag", 30, 20);
    self thread function_1ba28169(#"hash_4012b43bf3458a7", undefined, 2);
    level notify(#"hash_4c9c5fbc89779e64");
    ct_utils::function_654280be();
    level notify(#"hash_60e26e14a51c5211");
    ct_utils::function_c2a10fc();
    self notify(#"hash_3fe1dc3fe28515f3");
    self ct_utils::function_6ad0c151();
    self ct_vo::function_831e0584(array("vox_tvoi_tutor_fire_slide_5_0"));
    level notify(#"colbounds_tut_puf_1_front_off");
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0x2066f9b, Offset: 0x2d60
// Size: 0x12e
function function_7175d1b1() {
    level endon(#"combattraining_logic_finished");
    s_loc = struct::get("s_tut_purifier_1_target", "targetname");
    v_loc = getclosestpointonnavmesh(s_loc.origin, 48);
    self ct_utils::function_61d750d4(v_loc, s_loc.angles);
    self val::set(#"tut_ignoreall", "ignoreall", 1);
    do {
        str_stance = self getstance();
        waitframe(1);
    } while(str_stance !== "stand");
    self thread function_29b75dd8();
    level.a_ai_targets[level.a_ai_targets.size] = self;
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0xd05f4b8f, Offset: 0x2e98
// Size: 0x84
function function_29b75dd8() {
    level endon(#"combattraining_logic_finished");
    self endon(#"death");
    self thread ct_utils::function_b733ae0d(1);
    self thread ct_utils::function_84181d75(1, self.origin);
    self thread ct_utils::function_1746776e();
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0xc7aa30d9, Offset: 0x2f28
// Size: 0x224
function function_de43fab3() {
    level endon(#"combattraining_logic_finished", #"tut_stop");
    /#
        if (level flag::get("colbounds_tut_fin1_fight5_start_off") && level.var_e3146bce !== "damage") {
            return;
        }
    #/
    level.var_8ca3c62 = 2;
    self setnormalhealth(1);
    level notify(#"colbounds_tut_puf_2_start_on");
    level notify(#"colbounds_tut_puf_2_end_on");
    self thread function_cbb4f624();
    self thread ct_vo::function_261ed63c("vox_tvoi_tutor_fire_slide_2_nag", 45);
    self thread ct_utils::function_61c3d59c(#"hash_15262616ac3924f0");
    self ct_utils::tutorial_goto("s_tut_purifier_2_goto");
    level notify(#"hash_60e26e14a51c5211");
    self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_fire_slide_5_1"));
    level.var_5a834cd7 = 0;
    do {
        self allowmelee(0);
        self function_78cc1a53();
    } while(!(isdefined(level.var_b4f8a043) && level.var_b4f8a043));
    level notify(#"hash_60e26e14a51c5211");
    level notify(#"hash_7c324a7f1c29c44");
    self notify(#"hash_3fe1dc3fe28515f3");
    ct_utils::function_c2a10fc();
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0xb7938dae, Offset: 0x3158
// Size: 0x290
function function_78cc1a53() {
    level endon(#"combattraining_logic_finished");
    self endoncallback(&function_344aee09, #"death");
    level.var_b4f8a043 = 0;
    while (isdefined(level.var_29324553) && level.var_29324553 || !(isdefined(level.var_86b67c3f) && level.var_86b67c3f)) {
        waitframe(1);
    }
    if (!(isdefined(level.var_4635cc45) && level.var_4635cc45)) {
        level.var_4635cc45 = 1;
    } else {
        self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_fire_slide_5_1"));
    }
    self thread function_179a49d1();
    self thread function_b512a9bf(2);
    self allowmelee(0);
    if (isdefined(level.var_380f6142) && level.var_380f6142) {
        self switchtoweapon(getweapon(#"hero_flamethrower"));
    }
    self thread ct_vo::function_261ed63c("vox_tvoi_tutor_fire_slide_5_nag", 45, 30);
    self notify(#"hash_3fe1dc3fe28515f3");
    waitframe(1);
    self thread function_1ba28169(#"hash_3c5ed5229eb6809", undefined, 2, 0.1);
    if (isdefined(level.var_5a834cd7) && level.var_5a834cd7) {
        self thread function_cbb4f624();
    }
    level.var_5a834cd7 = 1;
    ct_utils::function_d00e0eeb();
    level.var_b4f8a043 = 1;
    level notify(#"hash_5170a3fc92d0b83");
    level notify(#"hash_60e26e14a51c5211");
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0x4557f362, Offset: 0x33f0
// Size: 0xa8
function function_179a49d1() {
    level endon(#"combattraining_logic_finished");
    self endon(#"death");
    var_43b8f3ab = getweapon(#"hero_flamethrower");
    do {
        waitframe(1);
        wpn_current = self getcurrentweapon();
    } while(wpn_current != var_43b8f3ab);
    level notify(#"colbounds_tut_puf_2_start_off");
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0x1e4734b, Offset: 0x34a0
// Size: 0xe6
function function_cbb4f624() {
    level endon(#"combattraining_logic_finished");
    level.var_1fa132d3 = 0;
    level.var_e4db2e78 = struct::get_array("s_tut_purifier_2_target", "targetname");
    level.var_e4db2e78 = array::sort_by_script_int(level.var_e4db2e78, 1);
    self thread function_d50f326c();
    for (i = 0; i < level.var_e4db2e78.size; i++) {
        ct_bots::activate_bots(1, #"axis", "bot_tut_puf2");
        wait(0.25);
    }
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0x67350750, Offset: 0x3590
// Size: 0xb6
function function_9d2afacf() {
    level endon(#"combattraining_logic_finished");
    s_loc = level.var_e4db2e78[level.var_1fa132d3];
    self.script_int = level.var_1fa132d3;
    level.var_1fa132d3++;
    self ct_utils::function_61d750d4(s_loc.origin, s_loc.angles);
    self thread function_63777d5d(s_loc);
    level.a_ai_targets[level.a_ai_targets.size] = self;
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 1, eflags: 0x0
// Checksum 0x9d531b00, Offset: 0x3650
// Size: 0xc8
function function_63777d5d(s_start) {
    level endon(#"combattraining_logic_finished");
    self endon(#"death");
    self thread ct_utils::function_5b59f3b7(s_start.origin, s_start.angles, 32, 0, 1, 0);
    self waittill(#"damage", #"bot_chase_state");
    self.prevstate = 3;
    self.var_ef59b90 = 3;
    level notify(#"hash_64e6e07be63b8d87");
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0x5983a60d, Offset: 0x3720
// Size: 0x160
function function_d50f326c() {
    level notify(#"hash_5170a3fc92d0b83");
    waitframe(1);
    level endon(#"combattraining_logic_finished", #"hash_5170a3fc92d0b83");
    self endon(#"death");
    level waittill(#"hash_64e6e07be63b8d87");
    wait(5);
    a_e_bots = self ct_bots::function_dde6edbd();
    a_e_bots = array::sort_by_script_int(a_e_bots, 1);
    foreach (e_bot in a_e_bots) {
        if (isalive(e_bot)) {
            e_bot.prevstate = 3;
            e_bot.var_ef59b90 = 3;
        }
        wait(randomfloatrange(1.5, 2));
    }
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0x70a746db, Offset: 0x3888
// Size: 0x268
function function_951ce866() {
    level endon(#"combattraining_logic_finished", #"tut_stop");
    /#
        if (level flag::get("colbounds_tut_fin1_fight5_start_off") && level.var_e3146bce !== "vox_tvoi_tutor_fire_core_dmg") {
            return;
        }
    #/
    level.var_8ca3c62 = 3;
    self setnormalhealth(1);
    self thread ct_gadgets::function_761e1977();
    level notify(#"colbounds_tut_puf_2_end_off");
    level notify(#"colbounds_tut_puf_3_end_on");
    self ct_vo::function_831e0584(array("vox_tvoi_tutor_fire_slide_5_kill_0"));
    self thread ct_vo::function_261ed63c("vox_tvoi_tutor_fire_slide_2_nag", 45);
    self thread ct_utils::function_61c3d59c(#"hash_15262616ac3924f0");
    self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_fire_slide_5_kill_1"));
    self ct_utils::tutorial_goto("s_tut_purifier_3_goto");
    level notify(#"hash_60e26e14a51c5211");
    self ct_vo::function_3ca1b77d();
    level.var_78be0c60 = 0;
    do {
        self allowmelee(0);
        self function_f5f15107();
    } while(!(isdefined(level.var_acc68fdf) && level.var_acc68fdf));
    self notify(#"hash_3fe1dc3fe28515f3");
    ct_utils::function_c2a10fc();
    self ct_utils::function_c2a10fc();
    wait(1);
    level notify(#"colbounds_tut_puf_3_end_off");
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0xe42960e2, Offset: 0x3af8
// Size: 0x506
function function_f5f15107() {
    level endon(#"combattraining_logic_finished");
    self endoncallback(&function_344aee09, #"death", #"hash_33333dd0736c30a1");
    level.var_acc68fdf = 0;
    while (isdefined(level.var_29324553) && level.var_29324553 || !(isdefined(level.var_86b67c3f) && level.var_86b67c3f)) {
        waitframe(1);
    }
    var_43b8f3ab = getweapon(#"hero_flamethrower");
    self thread function_b512a9bf(2);
    self allowmelee(0);
    if (isdefined(level.var_78be0c60) && level.var_78be0c60) {
        self switchtoweapon(var_43b8f3ab);
        self setweaponammoclip(var_43b8f3ab, 50);
    }
    wpn_current = self getcurrentweapon();
    if (wpn_current !== var_43b8f3ab) {
        var_ba75e424 = self gamepadusedlast() ? #"hash_3557e6f234c8594b" : #"hash_35bff554b9fd5865";
        self thread ct_utils::function_61c3d59c(var_ba75e424);
    }
    self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_fire_slide_5_kill_2"));
    ct_utils::function_9aca2fa0("ct_action2");
    n_start_time = gettime();
    do {
        wpn_current = self getcurrentweapon();
        waitframe(1);
    } while(wpn_current !== var_43b8f3ab);
    self setweaponammoclip(var_43b8f3ab, 50);
    level notify(#"hash_6822294416b67f95");
    self thread function_6bc15e29();
    level.var_fa6ae384 = 0;
    level.var_1fa132d3 = 0;
    level.var_e4db2e78 = struct::get_array("s_tut_purifier_3_target", "targetname");
    level.var_e4db2e78 = array::sort_by_script_int(level.var_e4db2e78, 1);
    wait(1);
    self ct_utils::function_61c3d59c("", undefined, "dynobj_KillWithPurifier");
    ct_utils::get_player() ct_utils::function_80bf685b(8);
    level.var_cea08ae7 = 0;
    ct_bots::activate_bots(1, #"axis");
    ct_utils::function_654280be();
    ct_bots::activate_bots(1, #"axis");
    wait(1);
    ct_utils::function_654280be();
    function_b3977527(2, 0);
    ct_utils::function_654280be();
    self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_fire_jungle_halfway"));
    wait(1);
    ct_bots::activate_bots(1, #"axis");
    ct_utils::function_654280be();
    function_b3977527(1, 0);
    wait(1);
    function_b3977527(2, 0);
    ct_utils::function_654280be();
    level.var_cea08ae7 = 1;
    ct_utils::function_9aca2fa0("ct_action");
    wait(1);
    level.var_a617bef4 = 1;
    level.var_acc68fdf = 1;
    self notify(#"hash_2189212647bbe100");
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0x9199f6f3, Offset: 0x4008
// Size: 0x1f2
function function_6bc15e29() {
    level endon(#"combattraining_logic_finished");
    self notify(#"hash_2189212647bbe100");
    self endoncallback(&function_5ba71388, #"death", #"hash_2189212647bbe100");
    var_43b8f3ab = getweapon(#"hero_flamethrower");
    var_76968823 = getweapon(#"gadget_health_regen");
    var_46ccfe18 = getweapon(#"bare_hands_ct");
    do {
        self gadgetpowerset(2, 99);
        wpn_current = self getcurrentweapon();
        n_ammo = self getweaponammoclip(var_43b8f3ab);
        var_fa32f88a = self getweaponammofuel(var_43b8f3ab);
        if (n_ammo == 0 || wpn_current == var_46ccfe18) {
            a_bots = self ct_bots::function_dde6edbd();
            if (a_bots.size > 0 || !(isdefined(level.var_cea08ae7) && level.var_cea08ae7)) {
                self notify(#"hash_33333dd0736c30a1");
                return;
            }
        }
        waitframe(1);
    } while(n_ammo > 0);
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 1, eflags: 0x0
// Checksum 0x107d81a5, Offset: 0x4208
// Size: 0x2c
function function_5ba71388(_hash) {
    /#
        iprintlnbold("s_tut_fin1_fight1_goto");
    #/
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0xc57a63ee, Offset: 0x4240
// Size: 0x156
function function_da1637ef() {
    level endon(#"combattraining_logic_finished");
    if (!isdefined(level.var_1fa132d3) || level.var_1fa132d3 >= level.var_e4db2e78.size) {
        level.var_1fa132d3 = 0;
    }
    s_loc = level.var_e4db2e78[level.var_1fa132d3];
    self.var_c1ee2be7 = level.var_1fa132d3;
    level.var_1fa132d3++;
    self ct_utils::function_61d750d4(s_loc.origin, s_loc.angles);
    self thread function_b973c685(s_loc);
    waitframe(1);
    var_ee63c007 = getweapon(#"smg_standard_t8");
    self giveweapon(var_ee63c007);
    self switchtoweapon(var_ee63c007, 1);
    level.a_ai_targets[level.a_ai_targets.size] = self;
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 1, eflags: 0x0
// Checksum 0x8e89e721, Offset: 0x43a0
// Size: 0x1e2
function function_b973c685(s_loc) {
    level endon(#"combattraining_logic_finished");
    self endon(#"death");
    self.ignoreall = 0;
    self.bot.var_b2b8f0b6 = 2000;
    self.bot.var_e8c941d6 = 4000;
    if (self.var_c1ee2be7 < 4) {
        self.var_ef59b90 = 3;
        self.prevstate = 3;
    } else if (isdefined(s_loc.target)) {
        s_dest = struct::get(s_loc.target, "targetname");
        self thread ct_utils::function_5b59f3b7(s_dest.origin, s_dest.angles, 32, s_dest.var_6d155b92, undefined, 0);
        if (isdefined(s_dest.var_afea05c4)) {
            self thread ct_utils::function_32e977f(ct_utils::get_player(), s_dest.var_afea05c4);
        }
    }
    util::waittill_any_ents(level, "tut_purifier_3_target_alert", self, "damage", self, "bot_chase_state");
    level notify(#"tut_purifier_3_target_alert");
    if (!isdefined(s_dest) || !(isdefined(s_dest.var_6d155b92) && s_dest.var_6d155b92)) {
        self.var_ef59b90 = 3;
        self.prevstate = 3;
    }
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0x73c607fa, Offset: 0x4590
// Size: 0x16c
function function_feee3d4f() {
    level endon(#"combattraining_logic_finished", #"tut_stop");
    level.var_8ca3c62 = 4;
    self setnormalhealth(1);
    level notify(#"hash_479ebf389694847e");
    level notify(#"hash_24ddc9c4596243ed");
    level notify(#"colbounds_tut_rad_1_end_on");
    level.var_e72728b8 = array(#"hero_flamethrower", #"gadget_radiation_field");
    self ct_utils::function_6ad0c151();
    self allowmelee(0);
    self function_1b16f4e();
    do {
        self function_1bdf6fc7();
    } while(!(isdefined(level.var_a19a97d6) && level.var_a19a97d6));
    self ct_utils::function_c2a10fc();
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0x59415b83, Offset: 0x4708
// Size: 0x1cc
function function_1b16f4e() {
    level endon(#"combattraining_logic_finished");
    level.var_6b1fd2c5 = 0;
    if (isdefined(self.allowdeath) && self.allowdeath) {
        level thread util::magic_bullet_shield(self);
    }
    while (isdefined(level.var_29324553) && level.var_29324553 || !(isdefined(level.var_86b67c3f) && level.var_86b67c3f)) {
        waitframe(1);
    }
    self thread ct_vo::function_261ed63c("vox_tvoi_tutor_fire_slide_2_nag", 30, 20);
    self thread ct_utils::function_61c3d59c(#"hash_15262616ac3924f0", array("vox_tvoi_tutor_fire_slide_6_0"));
    self ct_utils::tutorial_goto("s_tut_before_rad_1_goto_a", undefined, 48);
    self ct_utils::tutorial_goto("s_tut_rad_1_goto", undefined, 48);
    level.var_6b1fd2c5 = 1;
    level notify(#"hash_60e26e14a51c5211");
    level notify(#"colbounds_tut_rad_1_noback_on");
    waitframe(1);
    self ct_vo::function_3ca1b77d();
    self ct_vo::function_831e0584(array("vox_tvoi_tutor_fire_slide_7_0", "vox_tvoi_tutor_fire_slide_7_1"));
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0xe30c0535, Offset: 0x48e0
// Size: 0x3da
function function_1bdf6fc7() {
    level endon(#"combattraining_logic_finished");
    self endoncallback(&function_344aee09, #"death");
    level.var_a19a97d6 = 0;
    if (isdefined(self.allowdeath) && self.allowdeath) {
        level thread util::magic_bullet_shield(self);
    }
    while (isdefined(level.var_29324553) && level.var_29324553 || !(isdefined(level.var_86b67c3f) && level.var_86b67c3f)) {
        waitframe(1);
    }
    self ct_utils::function_6ad0c151();
    level.var_e72728b8 = array(#"hero_flamethrower");
    self thread function_b512a9bf(0);
    var_6b55373b = getweapon(#"gadget_radiation_field");
    n_slot = self gadgetgetslot(var_6b55373b);
    self thread ct_utils::function_61c3d59c(#"hash_787416c9e1a64d15");
    self thread ct_vo::function_261ed63c("vox_tvoi_tutor_fire_core_activate_fail", 7, 10);
    do {
        var_969d3344 = self gadgetisactive(n_slot);
        waitframe(1);
    } while(!(isdefined(var_969d3344) && var_969d3344));
    level notify(#"hash_60e26e14a51c5211");
    self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_fire_core_button_hold"));
    var_af24b2c1 = 0;
    do {
        s_notify = undefined;
        s_notify = self waittill(#"hash_251bbd6b8ba2fdfe", #"hash_4aaf6d6479e7cf20");
        if (s_notify._notify == #"hash_4aaf6d6479e7cf20") {
            self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_fire_core_button_rele"));
            self thread ct_utils::function_329f9ba6(#"hash_5e4e9959d2d94c69", 2, "green", 1);
        } else if (s_notify._notify == #"hash_251bbd6b8ba2fdfe") {
            var_af24b2c1 = 1;
        }
    } while(!var_af24b2c1);
    self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_fire_core_red_zone", "vox_tvoi_tutor_fire_core_max"));
    self thread ct_utils::function_61c3d59c(#"hash_a6ed66603c69f47");
    self waittill(#"hash_4aaf6d6479e7cf20");
    self ct_utils::function_c2a10fc();
    level thread util::stop_magic_bullet_shield(self);
    self ct_vo::function_3ca1b77d();
    level.var_a19a97d6 = 1;
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0xf11e0e3b, Offset: 0x4cc8
// Size: 0xac
function function_eca698c0() {
    level endon(#"combattraining_logic_finished", #"tut_stop");
    level.var_8ca3c62 = 5;
    level notify(#"hash_479ebf389694847e");
    level notify(#"hash_24ddc9c4596243ed");
    level notify(#"colbounds_tut_rad_1_end_off");
    self allowmelee(0);
    self function_819e7863();
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0x7a396b38, Offset: 0x4d80
// Size: 0x25e
function function_819e7863() {
    level endon(#"combattraining_logic_finished");
    level.var_b43c22e4 = 0;
    level.var_e72728b8 = array(#"hero_flamethrower");
    self ct_utils::function_6ad0c151();
    self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_fire_core_enemy2_1"));
    self ct_utils::function_61c3d59c(#"hash_a1ce6c56f0715b");
    self thread ct_vo::function_625a37f9("vox_tvoi_tutor_fire_core_self_cook", "vo_on_self_burn", 1, 1, 0);
    self thread ct_vo::function_625a37f9("vox_tvoi_tutor_fire_core_dmg", "vo_on_shot_while_rc", 1, 1, 0);
    var_eda3f1a7 = array("vox_tvoi_tutor_fire_core_enemy1_kill", "vox_tvoi_tutor_fire_core_enemy2_kill");
    self thread ct_vo::function_625a37f9(var_eda3f1a7, "vo_on_rad2_kill", 0, 0, 0.25, 1, 1, 0);
    self thread function_2e0dee4d();
    level.a_s_targets = struct::get_array("s_tut_rad_2_target", "targetname");
    level.var_c1ee2be7 = 0;
    function_b3977527(2, 0, 0, 1, "bot_tut_reactorcore_2", 0);
    ct_utils::function_d00e0eeb();
    self ct_utils::function_c2a10fc();
    self ct_vo::function_3ca1b77d(1);
    level notify(#"hash_4c2e751dd9e2bb57");
    level notify(#"hash_364cd924c426f239");
    level.var_b43c22e4 = 1;
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0x1325f7e0, Offset: 0x4fe8
// Size: 0xe4
function function_2e0dee4d() {
    level endon(#"combattraining_logic_finished", #"hash_364cd924c426f239");
    var_6b55373b = getweapon(#"gadget_radiation_field");
    while (!(isdefined(level.var_b43c22e4) && level.var_b43c22e4)) {
        s_notify = undefined;
        s_notify = self waittill(#"damage");
        if (s_notify.weapon === var_6b55373b) {
            level notify(#"vo_on_self_burn");
        } else {
            level notify(#"vo_on_shot_while_rc");
        }
    }
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0xea183604, Offset: 0x50d8
// Size: 0xc6
function function_70aa8633() {
    level endon(#"combattraining_logic_finished");
    s_loc = level.a_s_targets[level.var_c1ee2be7];
    level.var_c1ee2be7++;
    if (level.var_c1ee2be7 >= level.a_s_targets.size) {
        level.var_c1ee2be7 = 0;
    }
    self ct_utils::function_61d750d4(s_loc.origin, s_loc.angles);
    self thread function_cdb43167(s_loc);
    level.a_ai_targets[level.a_ai_targets.size] = self;
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 1, eflags: 0x0
// Checksum 0x799851d1, Offset: 0x51a8
// Size: 0x8c
function function_cdb43167(s_loc) {
    level endon(#"combattraining_logic_finished");
    s_dest = struct::get(s_loc.target, "targetname");
    self thread ct_utils::function_5b59f3b7(s_dest.origin, s_dest.angles, 32, 1, 1, 0);
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0x92b8c957, Offset: 0x5240
// Size: 0x254
function function_fcc23983() {
    level endon(#"combattraining_logic_finished", #"tut_stop");
    level.var_8ca3c62 = 6;
    self setnormalhealth(1);
    level notify(#"colbounds_tut_rad_1_noback_on");
    level notify(#"hash_479ebf389694847e");
    level notify(#"hash_24ddc9c4596243ed");
    level notify(#"colbounds_tut_rad_1_end_off");
    level.var_e72728b8 = array(#"hero_flamethrower");
    self ct_utils::function_6ad0c151();
    self allowmelee(0);
    self thread ct_utils::function_61c3d59c(#"hash_6d60f08a91a9afb5", array("vox_tvoi_tutor_fire_slide_10_1", "vox_tvoi_tutor_fire_slide_10_3"));
    level.a_s_targets = struct::get_array("s_tut_rad_3_target", "targetname");
    level.var_c1ee2be7 = 0;
    self thread ct_vo::function_625a37f9("vox_tvoi_tutor_fire_slide_10_2", "tut_reactorecore_3_enemy_damage", 1, 0, 0.25, 0, 0, 0);
    function_b3977527(3, 1, 1, 1, "bot_tut_reactorcore_3", 0);
    ct_utils::function_d00e0eeb();
    self thread ct_utils::function_c2a10fc();
    self ct_vo::function_3ca1b77d();
    self ct_vo::function_831e0584(array("vox_tvoi_tutor_fire_slide_11_0", "vox_tvoi_tutor_fire_slide_11_1"));
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0x2caf688a, Offset: 0x54a0
// Size: 0xc6
function function_12c35e8c() {
    level endon(#"combattraining_logic_finished");
    s_loc = level.a_s_targets[level.var_c1ee2be7];
    level.var_c1ee2be7++;
    if (level.var_c1ee2be7 >= level.a_s_targets.size) {
        level.var_c1ee2be7 = 0;
    }
    self ct_utils::function_61d750d4(s_loc.origin, s_loc.angles);
    self thread function_6672b593(s_loc);
    level.a_ai_targets[level.a_ai_targets.size] = self;
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 1, eflags: 0x0
// Checksum 0x28dd688f, Offset: 0x5570
// Size: 0x140
function function_6672b593(s_loc) {
    level endon(#"combattraining_logic_finished");
    self endoncallback(&function_c0bccc48, #"death");
    s_dest = s_loc;
    self val::set("tut_ignoreall", "ignoreall", 1);
    self ct_utils::function_5b59f3b7(self.origin, self.angles, 16, 1, 1);
    self thread ct_utils::function_b733ae0d(1, 0, 1);
    if (isdefined(s_loc.var_48dd881a) && s_loc.var_48dd881a == "crouch") {
        self bot_stance::crouch();
    }
    self waittill(#"damage");
    level notify(#"tut_reactorecore_3_enemy_damage");
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 1, eflags: 0x0
// Checksum 0xbb249384, Offset: 0x56b8
// Size: 0x28
function function_c0bccc48(_hash) {
    wait(1);
    level notify(#"hash_3453155c4f1a0fe0");
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0x42173a94, Offset: 0x56e8
// Size: 0x1ae
function function_235b259b() {
    level endoncallback(&function_e73b7704, #"combattraining_logic_finished", #"tut_stop");
    level.var_8ca3c62 = 7;
    level.var_b7fa636e = "tut_fin1_fight1";
    self setnormalhealth(1);
    level.var_e72728b8 = [];
    self ct_vo::function_3ca1b77d(1);
    level notify(#"colbounds_tut_bridge_on");
    self allowmelee(1);
    do {
        self tut_fin1_fight1();
    } while(!(isdefined(level.var_59767ce4) && level.var_59767ce4));
    do {
        self tut_fin1_fight2();
    } while(!(isdefined(level.var_59767ce4) && level.var_59767ce4));
    do {
        self tut_fin1_fight3();
    } while(!(isdefined(level.var_59767ce4) && level.var_59767ce4));
    do {
        self tut_fin1_fight5();
    } while(!(isdefined(level.var_59767ce4) && level.var_59767ce4));
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 1, eflags: 0x0
// Checksum 0x7467bbe, Offset: 0x58a0
// Size: 0xc
function function_e73b7704(_hash) {
    
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0x87327dd7, Offset: 0x58b8
// Size: 0x2fa
function tut_fin1_fight1() {
    level endon(#"combattraining_logic_finished");
    self endoncallback(&function_344aee09, #"death");
    level.var_b7fa636e = "tut_fin1_fight1";
    level.var_59767ce4 = 0;
    while (isdefined(level.var_29324553) && level.var_29324553 || !(isdefined(level.var_86b67c3f) && level.var_86b67c3f)) {
        waitframe(1);
    }
    self thread function_1fe2e258();
    level notify(#"colbounds_tut_rad_1_noback_on");
    self thread ct_vo::function_261ed63c("vox_tvoi_tutor_fire_slide_2_nag", 30, 20);
    self thread ct_utils::function_61c3d59c(#"hash_15262616ac3924f0");
    self ct_utils::tutorial_goto("s_tut_fin1_fight1_goto", undefined, 48);
    level notify(#"hash_60e26e14a51c5211");
    level notify(#"colbounds_tut_fin1_fight1_start_off");
    self thread ct_utils::function_61c3d59c(#"hash_4de0598fc21dc701", array("vox_tvoi_tutor_fire_archway_attack"));
    ct_utils::function_9aca2fa0("ct_action2");
    level.var_1fa132d3 = 0;
    level.var_e4db2e78 = struct::get_array("s_tut_fin1_fight1_target", "targetname");
    level.var_e4db2e78 = array::sort_by_script_int(level.var_e4db2e78, 1);
    for (i = 0; i < 5; i++) {
        function_b3977527(1, 1, 1, 1, "bot_fin_fight1_target");
        wait(2);
    }
    ct_utils::function_d00e0eeb();
    for (i = 0; i < 5; i++) {
        function_b3977527(1, 1, 1, 1, "bot_fin_fight1_target");
        wait(2);
    }
    ct_utils::function_d00e0eeb();
    self ct_utils::function_c2a10fc();
    level.var_59767ce4 = 1;
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0x1e25ff1b, Offset: 0x5bc0
// Size: 0xde
function function_32739e2() {
    level endon(#"combattraining_logic_finished");
    s_loc = level.var_e4db2e78[level.var_1fa132d3];
    self.script_int = level.var_1fa132d3;
    level.var_1fa132d3++;
    if (level.var_1fa132d3 >= level.var_e4db2e78.size) {
        level.var_1fa132d3 = 0;
    }
    self ct_utils::function_61d750d4(s_loc.origin, s_loc.angles);
    self thread function_6de61bc0(s_loc);
    level.a_ai_targets[level.a_ai_targets.size] = self;
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 1, eflags: 0x0
// Checksum 0xc214d93d, Offset: 0x5ca8
// Size: 0xe4
function function_6de61bc0(s_loc) {
    level endon(#"combattraining_logic_finished");
    self endon(#"death");
    a_s_dest = struct::get_array(s_loc.target, "targetname");
    s_dest = array::random(a_s_dest);
    self thread ct_utils::function_5b59f3b7(s_dest.origin, s_dest.angles, 32, 0, 0, 1);
    self waittill(#"goal");
    self ct_utils::function_4caeacf6();
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0x8860e138, Offset: 0x5d98
// Size: 0x29e
function tut_fin1_fight2() {
    level endon(#"combattraining_logic_finished");
    self endoncallback(&function_344aee09, #"death");
    level.var_b7fa636e = "tut_fin1_fight2";
    level.var_59767ce4 = 0;
    while (isdefined(level.var_29324553) && level.var_29324553 || !(isdefined(level.var_86b67c3f) && level.var_86b67c3f)) {
        waitframe(1);
    }
    self thread function_1fe2e258();
    self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_fire_final_move_nag"));
    self thread ct_vo::function_261ed63c("vox_tvoi_tutor_fire_slide_2_nag", 30, 20);
    self thread ct_utils::function_61c3d59c(#"hash_15262616ac3924f0");
    self ct_utils::tutorial_goto("s_tut_fin1_fight2_goto", undefined, 48);
    level notify(#"hash_60e26e14a51c5211");
    self ct_vo::function_3ca1b77d();
    level notify(#"colbounds_tut_fin1_fight2_start_off");
    self thread ct_utils::function_61c3d59c(#"hash_4de0568fc21dc1e8", array("vox_tvoi_tutor_fire_bridge_battle"));
    level.var_1fa132d3 = 0;
    level.var_e4db2e78 = struct::get_array("s_tut_fin1_fight2_target", "targetname");
    level.var_e4db2e78 = array::sort_by_script_int(level.var_e4db2e78, 1);
    function_b3977527(level.var_e4db2e78.size, 1, 1, 1, "bot_fin_fight2_target");
    ct_utils::function_d00e0eeb();
    self ct_utils::function_c2a10fc();
    level notify(#"colbounds_tut_fin1_fight3_start_off");
    level.var_59767ce4 = 1;
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0xdb84a247, Offset: 0x6040
// Size: 0xde
function function_e5272e23() {
    level endon(#"combattraining_logic_finished");
    s_loc = level.var_e4db2e78[level.var_1fa132d3];
    self.script_int = level.var_1fa132d3;
    level.var_1fa132d3++;
    if (level.var_1fa132d3 >= level.var_e4db2e78.size) {
        level.var_1fa132d3 = 0;
    }
    self ct_utils::function_61d750d4(s_loc.origin, s_loc.angles);
    self thread function_ea12b1f9(s_loc);
    level.a_ai_targets[level.a_ai_targets.size] = self;
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 1, eflags: 0x0
// Checksum 0x50796725, Offset: 0x6128
// Size: 0x12e
function function_ea12b1f9(s_loc) {
    level endon(#"combattraining_logic_finished");
    self endon(#"death");
    if (isdefined(s_loc.target)) {
        a_s_dest = struct::get_array(s_loc.target, "targetname");
        s_dest = array::random(a_s_dest);
    } else {
        s_dest = s_loc;
    }
    self thread ct_utils::function_5b59f3b7(s_dest.origin, s_dest.angles, 32, 1, 0, 1);
    self thread ct_utils::function_96dda082();
    while (1) {
        self setgoal(self.origin, 1, 1);
        waitframe(1);
    }
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0x145fd7f0, Offset: 0x6260
// Size: 0x28a
function tut_fin1_fight3() {
    level endon(#"combattraining_logic_finished");
    self endoncallback(&function_344aee09, #"death");
    level.var_b7fa636e = "tut_fin1_fight3";
    level.var_59767ce4 = 0;
    while (isdefined(level.var_29324553) && level.var_29324553 || !(isdefined(level.var_86b67c3f) && level.var_86b67c3f)) {
        waitframe(1);
    }
    self thread function_1fe2e258();
    self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_fire_final_move_nag"));
    self thread ct_vo::function_261ed63c("vox_tvoi_tutor_fire_slide_2_nag", 30, 20);
    self thread ct_utils::function_61c3d59c(#"hash_15262616ac3924f0");
    self ct_utils::tutorial_goto("s_tut_fin1_fight3_goto", undefined, 48);
    level notify(#"hash_60e26e14a51c5211");
    self ct_vo::function_3ca1b77d();
    level notify(#"colbounds_tut_fin1_fight3_start_off");
    self thread ct_utils::function_61c3d59c(#"hash_4de0578fc21dc39b", array("vox_tvoi_tutor_fire_rc_thru_wall"));
    level.var_1fa132d3 = 0;
    level.var_e4db2e78 = struct::get_array("s_tut_fin1_fight3_target", "targetname");
    level.var_e4db2e78 = array::sort_by_script_int(level.var_e4db2e78, 1);
    function_b3977527(level.var_e4db2e78.size, 1, 1, 1, "bot_fin_fight3_target");
    ct_utils::function_d00e0eeb();
    self ct_utils::function_c2a10fc();
    level.var_59767ce4 = 1;
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0xbb8c4cc7, Offset: 0x64f8
// Size: 0xde
function function_2d28530() {
    level endon(#"combattraining_logic_finished");
    s_loc = level.var_e4db2e78[level.var_1fa132d3];
    self.script_int = level.var_1fa132d3;
    level.var_1fa132d3++;
    if (level.var_1fa132d3 >= level.var_e4db2e78.size) {
        level.var_1fa132d3 = 0;
    }
    self ct_utils::function_61d750d4(s_loc.origin, s_loc.angles);
    self thread function_b4a84da3(s_loc);
    level.a_ai_targets[level.a_ai_targets.size] = self;
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 1, eflags: 0x0
// Checksum 0x6b202338, Offset: 0x65e0
// Size: 0x12e
function function_b4a84da3(s_loc) {
    level endon(#"combattraining_logic_finished");
    self endon(#"death");
    if (isdefined(s_loc.target)) {
        a_s_dest = struct::get_array(s_loc.target, "targetname");
        s_dest = array::random(a_s_dest);
    } else {
        s_dest = s_loc;
    }
    self thread ct_utils::function_5b59f3b7(s_dest.origin, s_dest.angles, 32, 1, 0, 1);
    self thread ct_utils::function_96dda082();
    while (1) {
        self setgoal(self.origin, 1, 1);
        waitframe(1);
    }
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0x35397a9d, Offset: 0x6718
// Size: 0x22a
function tut_fin1_fight4() {
    level endon(#"combattraining_logic_finished");
    self endoncallback(&function_344aee09, #"death");
    level.var_b7fa636e = "tut_fin1_fight4";
    level.var_59767ce4 = 0;
    while (isdefined(level.var_29324553) && level.var_29324553 || !(isdefined(level.var_86b67c3f) && level.var_86b67c3f)) {
        waitframe(1);
    }
    self thread function_1fe2e258();
    self thread ct_utils::function_61c3d59c(#"hash_1351dc46cb34a091", array("vox_tvoi_tutor_fire_final_move_nag"));
    trigger::wait_till("trig_firebreak_tut_fin1_fight4_start", "targetname");
    self ct_vo::function_3ca1b77d();
    self thread ct_utils::function_61c3d59c(#"hash_4de05c8fc21dcc1a", array("vox_tvoi_tutor_fire_room_clear"));
    level.var_1fa132d3 = 0;
    level.var_e4db2e78 = struct::get_array("s_tut_fin1_fight4_target", "targetname");
    level.var_e4db2e78 = array::sort_by_script_int(level.var_e4db2e78, 1);
    function_b3977527(level.var_e4db2e78.size, 1, 1, 1, "bot_fin_fight4_target");
    ct_utils::function_d00e0eeb();
    self ct_utils::function_c2a10fc();
    level.var_59767ce4 = 1;
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0x54cb0d49, Offset: 0x6950
// Size: 0xde
function function_56e61719() {
    level endon(#"combattraining_logic_finished");
    s_loc = level.var_e4db2e78[level.var_1fa132d3];
    self.script_int = level.var_1fa132d3;
    level.var_1fa132d3++;
    if (level.var_1fa132d3 >= level.var_e4db2e78.size) {
        level.var_1fa132d3 = 0;
    }
    self ct_utils::function_61d750d4(s_loc.origin, s_loc.angles);
    self thread function_11c76a66(s_loc);
    level.a_ai_targets[level.a_ai_targets.size] = self;
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 1, eflags: 0x0
// Checksum 0xb1ffb399, Offset: 0x6a38
// Size: 0x12e
function function_11c76a66(s_loc) {
    level endon(#"combattraining_logic_finished");
    self endon(#"death");
    if (isdefined(s_loc.target)) {
        a_s_dest = struct::get_array(s_loc.target, "targetname");
        s_dest = array::random(a_s_dest);
    } else {
        s_dest = s_loc;
    }
    self thread ct_utils::function_5b59f3b7(s_dest.origin, s_dest.angles, 32, 1, 0, 1);
    self thread ct_utils::function_96dda082();
    while (1) {
        self setgoal(self.origin, 1, 1);
        waitframe(1);
    }
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0xea4dea4, Offset: 0x6b70
// Size: 0x2fa
function tut_fin1_fight5() {
    level endon(#"combattraining_logic_finished");
    self endoncallback(&function_344aee09, #"death");
    level.var_b7fa636e = "tut_fin1_fight5";
    level.var_59767ce4 = 0;
    while (isdefined(level.var_29324553) && level.var_29324553 || !(isdefined(level.var_86b67c3f) && level.var_86b67c3f)) {
        waitframe(1);
    }
    self thread function_1fe2e258();
    level notify(#"colbounds_tut_fin1_fight5_start_off");
    self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_fire_final_move_nag"));
    self thread ct_vo::function_261ed63c("vox_tvoi_tutor_fire_slide_2_nag", 30, 20);
    self thread ct_utils::function_61c3d59c(#"hash_15262616ac3924f0");
    self ct_utils::tutorial_goto("s_tut_fin1_fight5_goto", undefined, 48);
    level notify(#"hash_60e26e14a51c5211");
    waitframe(1);
    self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_fire_final_hut"));
    self thread ct_utils::function_61c3d59c(#"hash_4de05d8fc21dcdcd");
    level.var_1fa132d3 = 0;
    level.var_e4db2e78 = struct::get_array("s_tut_fin1_fight5_target", "targetname");
    level.var_e4db2e78 = array::sort_by_script_int(level.var_e4db2e78, 1);
    function_b3977527(level.var_e4db2e78.size, 1, 1, 1, "bot_fin_fight5_target");
    ct_utils::function_d00e0eeb();
    do {
        waitframe(1);
        var_dd903b38 = self gadgetisactive(0);
    } while(var_dd903b38 && isalive(self));
    wait(1);
    ct_utils::function_9aca2fa0("ct_action");
    self ct_utils::function_c2a10fc();
    level.var_59767ce4 = 1;
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0x5f304aea, Offset: 0x6e78
// Size: 0xde
function function_42e85cab() {
    level endon(#"combattraining_logic_finished");
    s_loc = level.var_e4db2e78[level.var_1fa132d3];
    self.script_int = level.var_1fa132d3;
    level.var_1fa132d3++;
    if (level.var_1fa132d3 >= level.var_e4db2e78.size) {
        level.var_1fa132d3 = 0;
    }
    self ct_utils::function_61d750d4(s_loc.origin, s_loc.angles);
    self thread function_11c76a66(s_loc);
    level.a_ai_targets[level.a_ai_targets.size] = self;
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 1, eflags: 0x0
// Checksum 0x1036a5fe, Offset: 0x6f60
// Size: 0x12c
function function_bb81bf93(s_loc) {
    level endon(#"combattraining_logic_finished");
    self endon(#"death");
    if (isdefined(s_loc.target)) {
        self.b_stationary = 0;
        a_s_dest = struct::get_array(s_loc.target, "targetname");
        if (a_s_dest.size > 1) {
            s_dest = array::random(a_s_dest);
        } else {
            s_dest = a_s_dest[0];
        }
    } else {
        self.b_stationary = 1;
        s_dest = s_loc;
    }
    self thread ct_utils::function_5b59f3b7(s_dest.origin, s_dest.angles, 64, self.b_stationary, 0, 0);
    self thread ct_utils::function_96dda082();
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0x74e771e7, Offset: 0x7098
// Size: 0x1d4
function function_c7bb6e59() {
    level endon(#"combattraining_logic_finished");
    level.var_8ca3c62 = 8;
    level notify(#"colbounds_tut_windows_block_on");
    level.var_e72728b8 = array(#"hero_flamethrower", #"gadget_radiation_field");
    self gadgetdeactivate(0, getweapon(#"gadget_radiation_field"));
    self gadgetpowerset(0, 0);
    ct_utils::function_9e33850b();
    self ct_vo::function_3ca1b77d(1);
    do {
        self function_774b8cc2();
    } while(!(isdefined(level.var_d3640607) && level.var_d3640607));
    self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_fire_final_hut_secure_3"));
    level.var_e72728b8 = [];
    do {
        self allowmelee(1);
        self function_d0f4d458();
    } while(!(isdefined(level.var_fe3f4aa0) && level.var_fe3f4aa0));
    self ct_vo::function_3ca1b77d(1);
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0x2eb4cf4f, Offset: 0x7278
// Size: 0x9a
function function_774b8cc2() {
    level endon(#"combattraining_logic_finished");
    self endoncallback(&function_344aee09, #"death");
    level.var_d3640607 = 0;
    self ct_vo::function_831e0584(array("vox_tvoi_tutor_fire_final_hut_secure_0", "vox_tvoi_tutor_fire_final_hut_secure_1", "vox_tvoi_tutor_fire_final_hut_secure_2"));
    level.var_d3640607 = 1;
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0x5c3b5f62, Offset: 0x7320
// Size: 0x35e
function function_d0f4d458() {
    level endon(#"combattraining_logic_finished");
    self endoncallback(&function_344aee09, #"death");
    level.var_fe3f4aa0 = 0;
    while (isdefined(level.var_29324553) && level.var_29324553 || !(isdefined(level.var_86b67c3f) && level.var_86b67c3f)) {
        waitframe(1);
    }
    self thread function_1fe2e258();
    ct_utils::function_9aca2fa0("ct_action2");
    self thread function_bfebe12d();
    if (!level flag::get("fin2_killstreak_earned")) {
        self thread ct_utils::function_61c3d59c(undefined, undefined, "dynobj_EarnStrafeRun");
        self thread ct_utils::function_80bf685b(0);
        self thread ct_vo::function_261ed63c("vox_tvoi_tutor_fire_score_nag", 20, 20);
    }
    n_enemy_count = 4;
    n_dist_min = 1200;
    n_dist_max = 1900;
    var_65c9209b = 2;
    var_e01def33 = 4;
    self thread ct_utils::surround_spawn(n_enemy_count, n_dist_min, n_dist_max, var_65c9209b, var_e01def33);
    self thread function_bc2aaee0();
    level flag::wait_till("fin2_killstreak_used");
    self ct_utils::function_c2a10fc();
    self thread ct_utils::countdown_timer(30, "fin2_timer_done");
    wait(0.1);
    self thread ct_utils::function_61c3d59c(#"hash_41159f797a914d3a", undefined, undefined);
    level waittill(#"fin2_timer_done");
    level notify(#"hash_1c966d2b46abb009");
    a_e_enemies = self ct_bots::function_dde6edbd();
    foreach (e_enemy in a_e_enemies) {
        e_enemy kill();
        wait(randomfloatrange(0.2, 1));
    }
    level.var_fe3f4aa0 = 1;
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0x2e7ee12c, Offset: 0x7688
// Size: 0x104
function function_bc2aaee0() {
    level endon(#"combattraining_logic_finished");
    self endon(#"death");
    while (!(isdefined(level.var_51ff7a58) && level.var_51ff7a58)) {
        waitframe(1);
    }
    level notify(#"hash_1c966d2b46abb009");
    wait(1);
    n_enemy_count = 10;
    n_dist_min = 1600;
    n_dist_max = 1900;
    var_65c9209b = 2;
    var_e01def33 = 3;
    self thread function_cc50d201();
    self thread ct_utils::surround_spawn(n_enemy_count, n_dist_min, n_dist_max, var_65c9209b, var_e01def33);
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0x90fbb0de, Offset: 0x7798
// Size: 0x230
function function_cc50d201() {
    level endon(#"combattraining_logic_finished", #"hash_ca983e29a84fac8");
    self endon(#"death");
    level.var_14a220fc = 8;
    level.var_4572ae40 = 0;
    while (!(isdefined(level.var_fe3f4aa0) && level.var_fe3f4aa0)) {
        if (level.var_4572ae40 < level.var_14a220fc) {
            var_cf637c27 = level.var_14a220fc - level.var_4572ae40;
            a_e_enemies = self ct_bots::function_dde6edbd();
            a_e_enemies = arraysortclosest(a_e_enemies, self.origin);
            var_2496c4c = [];
            foreach (e_enemy in a_e_enemies) {
                if (!(isdefined(e_enemy.var_e37e98ba) && e_enemy.var_e37e98ba)) {
                    var_2496c4c[var_2496c4c.size] = e_enemy;
                }
            }
            if (var_cf637c27 > var_2496c4c.size) {
                var_cf637c27 = var_2496c4c.size;
            }
            for (i = 0; i < var_cf637c27; i++) {
                e_enemy = var_2496c4c[i];
                if (isalive(e_enemy)) {
                    e_enemy.var_e37e98ba = 1;
                    e_enemy thread ct_utils::function_4caeacf6();
                    level.var_4572ae40++;
                }
            }
        }
        wait(0.5);
    }
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0x6c450dfd, Offset: 0x79d0
// Size: 0x2a4
function function_bfebe12d() {
    level endon(#"combattraining_logic_finished");
    self endoncallback(&function_e178ad70, #"death");
    level.var_51ff7a58 = 0;
    level flag::clear("fin2_killstreak_used");
    if (!level flag::get("fin2_killstreak_earned")) {
        ct_utils::function_e44c5b8e(#"straferun", 10, 1);
        level.var_d1f07c87 = 0;
        level.var_58360a73 = 0;
        waitframe(1);
        callback::on_player_killed_with_params(&function_78986232);
        self waittill(#"hash_3c0def159f71e194");
        level flag::set("fin2_killstreak_earned");
    } else {
        ct_utils::function_e44c5b8e(#"straferun", 0, 1);
    }
    level.var_51ff7a58 = 1;
    self ct_utils::function_1bb93418();
    wait(1);
    var_7cfb8d51 = self gamepadusedlast() ? #"hash_67a58d84d0f91968" : #"hash_4f0b2e3958c55f94";
    self thread ct_utils::function_61c3d59c(var_7cfb8d51, array("vox_tvoi_tutor_fire_score_earned_0", "vox_tvoi_tutor_fire_score_earned_1"));
    s_notify = undefined;
    s_notify = self waittill(#"killstreak_used");
    self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_fire_score_activate"));
    self thread function_c513c2a2();
    level notify(#"hash_60e26e14a51c5211");
    level flag::set("fin2_killstreak_used");
    function_e178ad70(#"hash_1e9ac26db38673e4");
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 1, eflags: 0x0
// Checksum 0x8db85c9, Offset: 0x7c80
// Size: 0x2c
function function_e178ad70(_hash) {
    callback::remove_on_player_killed_with_params(&function_78986232);
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0xa51b38dc, Offset: 0x7cb8
// Size: 0x1dc
function function_c513c2a2() {
    level notify(#"hash_3b2c18b6fb8ce809");
    level endon(#"combattraining_logic_finished", #"hash_3b2c18b6fb8ce809");
    self endon(#"death");
    do {
        level.var_10d6ef1e = getentarray("strafePlane", "targetname", 1);
        waitframe(1);
    } while(!isdefined(level.var_10d6ef1e) || level.var_10d6ef1e.size == 0);
    level.var_e1a1f65c = level.var_10d6ef1e[0];
    /#
        iprintlnbold("vox_tvoi_tutor_fire_score_earned_1");
    #/
    var_b82f5433 = array("vox_tvoi_tutor_fire_score_strafe_0", "vox_tvoi_tutor_fire_score_strafe_1");
    self thread ct_vo::function_625a37f9(var_b82f5433, "strafe_start", 1, 1, 1);
    while (!(isdefined(level.var_fe3f4aa0) && level.var_fe3f4aa0)) {
        waitresult = undefined;
        waitresult = level.var_e1a1f65c waittill(#"noteworthy");
        noteworthy = waitresult.noteworthy;
        noteworthynode = waitresult.noteworthy_node;
        if (noteworthy == "strafe_start") {
            level notify(#"strafe_start");
        }
    }
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 1, eflags: 0x0
// Checksum 0xa9eb514c, Offset: 0x7ea0
// Size: 0x24c
function function_78986232(params) {
    level endon(#"combattraining_logic_finished");
    eattacker = params.eattacker;
    weapon = params.weapon;
    if (isplayer(eattacker) && !(isdefined(level.var_51ff7a58) && level.var_51ff7a58)) {
        cost = killstreaks::get_killstreak_momentum_cost(eattacker, #"straferun");
        var_23efb519 = 13;
        var_595e41ee = 100;
        event = #"ekia";
        eventindex = level.scoreinfo[event][#"row"];
        eattacker globallogic_score::giveplayermomentumnotification(var_595e41ee, #"hash_480234a872bd64ac", undefined, 0, weapon, 0, eventindex, event, undefined);
        level.var_d1f07c87++;
        if (!eattacker ct_utils::function_a7540094()) {
            eattacker thread ct_utils::function_61c3d59c(undefined, undefined, "dynobj_KillToEarnSWAT");
        }
        var_a3f2cb34 = var_595e41ee * level.var_d1f07c87;
        eattacker thread ct_utils::function_80bf685b(var_a3f2cb34);
        if (!(isdefined(level.var_58360a73) && level.var_58360a73) && level.var_d1f07c87 * var_595e41ee >= cost / 2) {
            level.var_58360a73 = 1;
            level thread ct_vo::function_831e0584(array("vox_tvoi_tutor_fire_score_halfway"));
        }
    }
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0x7b54e7bb, Offset: 0x80f8
// Size: 0xd6
function function_63b62665() {
    level endon(#"combattraining_logic_finished");
    if (level.var_1fa132d3 >= level.var_e4db2e78.size) {
        level.var_1fa132d3 = 0;
    }
    s_loc = level.var_e4db2e78[level.var_1fa132d3];
    self.script_int = level.var_1fa132d3;
    level.var_1fa132d3++;
    self ct_utils::function_61d750d4(s_loc.origin, s_loc.angles);
    self thread function_d6addc3b(s_loc);
    level.a_ai_targets[level.a_ai_targets.size] = self;
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 1, eflags: 0x0
// Checksum 0x201bdb42, Offset: 0x81d8
// Size: 0xdc
function function_d6addc3b(s_loc) {
    level endon(#"combattraining_logic_finished");
    self endoncallback(&function_60668bf7, #"death");
    if (!level flag::get("fin2_killstreak_used")) {
        wait(1);
        self thread ct_utils::function_4caeacf6();
    } else {
        self thread ct_utils::function_5b59f3b7(s_loc.origin, s_loc.angles, 32, 0, 0, 1);
    }
    self thread function_6dcf47f6();
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 1, eflags: 0x0
// Checksum 0x2c7c5f02, Offset: 0x82c0
// Size: 0x20
function function_60668bf7(_hash) {
    level notify(#"hash_60e26e14a51c5211");
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0x6f7a0ab5, Offset: 0x82e8
// Size: 0x120
function function_6dcf47f6() {
    level endon(#"combattraining_logic_finished");
    self endon(#"death");
    e_player = ct_utils::get_player();
    e_player endon(#"death");
    var_93024c01 = 190 * 190;
    while (1) {
        if (isdefined(level.var_e1a1f65c)) {
            n_dist_sq = distance2dsquared(self.origin, level.var_e1a1f65c.origin);
            if (n_dist_sq <= var_93024c01) {
                self ct_utils::magic_explosion(self.origin);
            }
        }
        wait(randomfloatrange(0.1, 0.3));
    }
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0x98eaeffb, Offset: 0x8410
// Size: 0xbc
function function_1fe2e258() {
    level endon(#"combattraining_logic_finished");
    self endoncallback(&function_3b6be7bd, #"death");
    if (!(isdefined(self.var_7ca576f0) && self.var_7ca576f0)) {
        level.var_e72728b8 = [];
        self.var_7ca576f0 = 1;
        self thread function_b512a9bf(2);
        self thread function_b512a9bf(0);
        self thread function_222141a5();
    }
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 1, eflags: 0x0
// Checksum 0xbc799389, Offset: 0x84d8
// Size: 0x16
function function_3b6be7bd(_hash) {
    self.var_7ca576f0 = 0;
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 6, eflags: 0x0
// Checksum 0x7ff666b6, Offset: 0x84f8
// Size: 0x190
function function_b3977527(n_count, b_keyline = 1, var_3aad7172 = 0, var_2960f558 = 1, str_targetname, var_216e25ba = 0) {
    level endon(#"combattraining_logic_finished");
    if (var_2960f558) {
        level.a_ai_targets = [];
    }
    level.var_aae2a361 = b_keyline && var_3aad7172;
    level thread ct_bots::activate_bots(n_count, #"axis", str_targetname, var_216e25ba);
    while (level.a_ai_targets.size < n_count) {
        waitframe(1);
    }
    if (!(isdefined(var_3aad7172) && var_3aad7172)) {
        if (b_keyline) {
            foreach (ai_target in level.a_ai_targets) {
                ai_target thread ct_utils::function_8963dae3();
            }
        }
    }
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 4, eflags: 0x0
// Checksum 0xa426fa28, Offset: 0x8690
// Size: 0xdc
function function_1ba28169(str_objective, a_str_vo, var_f54b52b3, var_8eb9348c = 5) {
    level endoncallback(&function_986f117c, #"hash_3fe1dc3fe28515f3", #"combattraining_logic_finished");
    self endoncallback(&function_986f117c, #"death", #"hash_3fe1dc3fe28515f3");
    self ct_utils::function_61c3d59c(str_objective, a_str_vo);
    wait(var_8eb9348c);
    self childthread function_9f1d8637(var_f54b52b3);
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 1, eflags: 0x0
// Checksum 0x8111b569, Offset: 0x8778
// Size: 0x3a
function function_986f117c(_hash) {
    e_player = ct_utils::get_player();
    if (isdefined(e_player)) {
        e_player.var_dbe8fddf = 0;
    }
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 1, eflags: 0x0
// Checksum 0xa347c355, Offset: 0x87c0
// Size: 0x1be
function function_9f1d8637(var_f54b52b3) {
    self endon(#"hash_639559ceed491430");
    level endon(#"combattraining_logic_finished");
    a_str_objective = [];
    a_str_objective[2] = self gamepadusedlast() ? #"hash_3557e6f234c8594b" : #"hash_35bff554b9fd5865";
    a_str_objective[0] = #"hash_1415d0b5ec85168b";
    var_3a6cd253 = [];
    var_3a6cd253[2] = "purifier_depleted";
    var_3a6cd253[0] = "reactor_core_depleted";
    while (1) {
        if (!self util::gadget_is_in_use(var_f54b52b3)) {
            if (!(isdefined(self.var_dbe8fddf) && self.var_dbe8fddf)) {
                self notify(var_3a6cd253[var_f54b52b3]);
                self.var_dbe8fddf = 1;
                self.var_141125f2 = self.var_c5598268;
                self ct_utils::function_61c3d59c(a_str_objective[var_f54b52b3]);
            }
        } else if (isdefined(self.var_dbe8fddf) && self.var_dbe8fddf) {
            self.var_dbe8fddf = 0;
            if (isdefined(self.var_141125f2)) {
                self ct_utils::function_61c3d59c(self.var_141125f2);
                self.var_141125f2 = undefined;
            } else {
                self ct_utils::function_1bb93418();
            }
        }
        waitframe(1);
    }
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 1, eflags: 0x0
// Checksum 0x2433f193, Offset: 0x8988
// Size: 0xb4
function function_b512a9bf(n_slot) {
    level endon(#"combattraining_logic_finished");
    var_dee68e3f = [];
    var_dee68e3f[2] = #"hero_flamethrower";
    var_dee68e3f[0] = #"gadget_radiation_field";
    str_gadget = var_dee68e3f[n_slot];
    if (isdefined(level.var_e72728b8)) {
        arrayremovevalue(level.var_e72728b8, str_gadget);
    }
    self ct_gadgets::function_be6376db(n_slot);
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 1, eflags: 0x0
// Checksum 0xec280c39, Offset: 0x8a48
// Size: 0x636
function function_344aee09(_hash) {
    level endon(#"combattraining_logic_finished");
    if (!(isdefined(level.var_29324553) && level.var_29324553)) {
        level.var_29324553 = 1;
        level notify(#"hash_4daf98b666a39c1d");
        level.var_86b67c3f = 0;
        e_player = ct_utils::get_player();
        util::stop_magic_bullet_shield(e_player);
        level notify(#"hash_582be86269c7fecc");
        level notify(#"hash_4c9c5fbc89779e64");
        level notify(#"hash_3ce5abc259d8b041");
        level notify(#"hash_360fb35e8476aec5");
        level notify(#"hash_269c201d6122a737");
        level notify(#"hash_3fe1dc3fe28515f3");
        level notify(#"tutorial_goto_end");
        level notify(#"hash_60e26e14a51c5211");
        level notify(#"hash_4c2e751dd9e2bb57");
        level notify(#"hash_2d2294060e47449f");
        level notify(#"hash_6ebe7e4ea0726f0b");
        waitframe(1);
        e_player thread ct_utils::function_1bb93418();
        str_hint = undefined;
        if (_hash == #"death") {
            if (level.var_8ca3c62 === 2) {
                level.var_380f6142 = 1;
                e_player thread ct_vo::function_831e0584(array("vox_tvoi_tutor_fire_slide_5_fail"));
            } else if (level.var_8ca3c62 === 3) {
                level.var_78be0c60 = 1;
                e_player thread ct_vo::function_831e0584(array("vox_tvoi_tutor_fire_slide_5_fail"));
            } else if (level.var_8ca3c62 === 7) {
                e_player thread ct_vo::function_831e0584(array("vox_tvoi_tutor_fire_final_player_dead"));
            } else if (level.var_8ca3c62 == 8) {
                if (!(isdefined(level.var_51ff7a58) && level.var_51ff7a58)) {
                    e_player thread ct_vo::function_831e0584(array("vox_tvoi_tutor_fire_score_player_dead"));
                } else {
                    e_player thread function_6487b2c7();
                    e_player ct_vo::function_831e0584(array("vox_tvoi_tutor_fire_score_fail"));
                }
            }
            wait(1);
            e_player thread lui::screen_fade_out(0.75);
            e_player thread ct_utils::function_49e0c5bc();
            n_wait = 0.5;
        } else {
            n_wait = 1;
            if (_hash == #"hash_33333dd0736c30a1") {
                level.var_78be0c60 = 1;
                e_player ct_vo::function_c72e58c1(#"failed");
                e_player thread ct_vo::function_831e0584(array("vox_tvoi_tutor_fire_gas_gauge_00"));
                setslowmotion(1, 0.1, 0.5);
                e_player ct_utils::function_a61ebb46(function_8b1a219a() ? #"hash_5168ae1a4907adb6" : #"hash_6d618a9f705ba66");
                setslowmotion(0.1, 1, 0.25);
                str_respawn = "s_tut_purifier_3_respawn";
                n_wait = 0.1;
            }
            e_player thread ct_utils::function_79957328(undefined, str_respawn);
            level waittill(#"hash_603de7ab282bcda9");
            e_player thread ct_utils::function_49e0c5bc(1);
            e_player ct_vo::function_3ca1b77d(1);
            var_3069da18 = 1;
        }
        e_player thread ct_utils::function_49e0c5bc(1);
        e_player thread ct_utils::clear_killstreaks();
        wait(n_wait);
        if (isdefined(var_3069da18) && var_3069da18) {
            e_player setnormalhealth(1);
        } else {
            while (!(isdefined(level.var_86b67c3f) && level.var_86b67c3f)) {
                waitframe(1);
            }
            if (isdefined(str_hint)) {
                e_player ct_utils::function_a61ebb46(str_hint);
            }
            level lui::screen_fade_in(0.75);
        }
        level.var_86b67c3f = 1;
        level.var_29324553 = 0;
    }
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0x2cd1f531, Offset: 0x9088
// Size: 0x5c
function function_6487b2c7() {
    if (isdefined(level.var_e1a1f65c)) {
        level.var_e1a1f65c.leavenexttime = 1;
        level.var_e1a1f65c notify(#"noteworthy", {#noteworthy:"strafe_leave"});
    }
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 2, eflags: 0x0
// Checksum 0x6123476e, Offset: 0x90f0
// Size: 0x1a6
function function_2969ccb4(var_43d50d89 = 1, var_463b195d = 1) {
    level notify(#"hash_6822294416b67f95");
    waitframe(1);
    level endon(#"combattraining_logic_finished", #"hash_6822294416b67f95");
    var_43b8f3ab = getweapon(#"hero_flamethrower");
    var_5b505b10 = self getweaponammoclipsize(var_43b8f3ab);
    n_slot = self gadgetgetslot(var_43b8f3ab);
    while (1) {
        if (isdefined(level.var_e72728b8)) {
            if (!isinarray(level.var_e72728b8, #"hero_flamethrower")) {
                if (isdefined(var_43d50d89) && var_43d50d89) {
                    self gadgetpowerset(n_slot, 100);
                    self setweaponammofuel(var_43b8f3ab, 100);
                }
                if (isdefined(var_463b195d) && var_463b195d) {
                    self setweaponammoclip(var_43b8f3ab, var_5b505b10);
                }
            }
        }
        waitframe(1);
    }
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0xe9d7ce0b, Offset: 0x92a0
// Size: 0x510
function function_41dcd216() {
    /#
        sessionmode = currentsessionmode();
        setdvar(#"hash_5b3b4d1a60845a9b", "<unknown string>");
        level flag::init("colbounds_tut_fin1_fight5_start_off");
        if (sessionmode != 4) {
            adddebugcommand("<unknown string>");
            adddebugcommand("<unknown string>");
            adddebugcommand("<unknown string>");
            adddebugcommand("<unknown string>");
            adddebugcommand("<unknown string>");
            adddebugcommand("<unknown string>");
            adddebugcommand("<unknown string>");
            adddebugcommand("<unknown string>");
        }
        while (1) {
            wait(0.25);
            cmd = getdvarstring(#"hash_5b3b4d1a60845a9b", "<unknown string>");
            if (cmd == "<unknown string>") {
                continue;
            }
            e_player = level.players[0];
            switch (cmd) {
            case #"kill_player":
                e_player dodamage(1000, e_player.origin);
                break;
            case #"lowready_on":
                e_player setlowready(1);
                break;
            case #"lowready_off":
                e_player setlowready(0);
                break;
            case #"restart_tutorial":
                level notify(#"combattraining_logic_finished", {#success:1});
                break;
            case #"hash_5db424be8b8d04a8":
                e_player thread ct_utils::function_329f9ba6(#"hash_6d1f5359302a862c", 10, "<unknown string>", 2, 1);
                break;
            case #"hash_3ca93ce413cad85a":
                a_str_vo = array("<unknown string>", "<unknown string>");
                e_player thread function_7d10f455(a_str_vo);
                break;
            case #"hash_3cad24e413ce9869":
                a_str_vo = array("<unknown string>", "<unknown string>");
                e_player thread function_7d10f455(a_str_vo);
                break;
            case #"hash_3ca93be413cad6a7":
                a_str_vo = array("<unknown string>", "<unknown string>");
                e_player thread function_7d10f455(a_str_vo);
                break;
            case #"hash_3cad21e413ce9350":
                a_str_vo = array("<unknown string>", "<unknown string>");
                e_player thread function_7d10f455(a_str_vo);
                break;
            case #"hash_60bb5681fede555f":
                self ct_vo::function_831e0584(array("<unknown string>", "<unknown string>"));
                break;
            case #"hash_60bb5781fede5712":
                self thread ct_vo::function_831e0584(array("<unknown string>", "<unknown string>"));
                break;
            case #"hash_60bb5881fede58c5":
                e_player function_53e140e6();
                break;
            }
            setdvar(#"hash_5b3b4d1a60845a9b", "<unknown string>");
        }
    #/
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 2, eflags: 0x0
// Checksum 0xd47dcee9, Offset: 0x97b8
// Size: 0x7c
function function_7d10f455(a_str_vo, var_c782ff9c) {
    /#
        e_player = ct_utils::get_player();
        e_player thread ct_vo::function_831e0584(a_str_vo);
        e_player ct_vo::function_3ca1b77d(var_c782ff9c);
        iprintlnbold("<unknown string>");
    #/
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0x7a153b13, Offset: 0x9840
// Size: 0x1b0
function function_53e140e6() {
    /#
        level endon(#"combattraining_logic_finished");
        level.var_e72728b8 = [];
        level notify(#"hash_60e26e14a51c5211");
        self thread ct_vo::function_831e0584(array("<unknown string>"));
        self thread ct_utils::function_61c3d59c(#"hash_787416c9e1a64d15");
        var_af24b2c1 = 0;
        do {
            s_notify = undefined;
            s_notify = self waittill(#"hash_251bbd6b8ba2fdfe", #"hash_4aaf6d6479e7cf20");
            if (s_notify._notify == #"hash_4aaf6d6479e7cf20") {
                self ct_vo::function_831e0584(array("<unknown string>"));
            } else if (s_notify._notify == #"hash_251bbd6b8ba2fdfe") {
                var_af24b2c1 = 1;
            }
        } while(!var_af24b2c1);
        self thread ct_vo::function_831e0584(array("<unknown string>", "<unknown string>"));
        self thread ct_utils::function_61c3d59c(#"hash_a6ed66603c69f47");
        self waittill(#"hash_4aaf6d6479e7cf20");
        wait(10);
    #/
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 2, eflags: 0x0
// Checksum 0xac944644, Offset: 0x99f8
// Size: 0x84
function function_5a0f5bcb(str_tut, var_6bf7e923) {
    /#
        level flag::set("colbounds_tut_fin1_fight5_start_off");
        level.var_e3146bce = str_tut;
        self function_d74a7e31();
        waitframe(1);
        self [[ var_6bf7e923 ]]();
        level flag::clear("colbounds_tut_fin1_fight5_start_off");
    #/
}

// Namespace ct_firebreak_tutorial/ct_firebreak_tutorial
// Params 0, eflags: 0x0
// Checksum 0x467ff675, Offset: 0x9a88
// Size: 0xb4
function function_d74a7e31() {
    /#
        level.var_8ca3c62 = 0;
        self ct_utils::function_8b7a2fdd();
        self ct_utils::function_a7d0e0f3();
        self ct_utils::function_1bb93418();
        level notify(#"hash_4c9c5fbc89779e64");
        level notify(#"tutorial_goto_end");
        level notify(#"tut_stop");
        ct_bots::deactivate_bots();
    #/
}

