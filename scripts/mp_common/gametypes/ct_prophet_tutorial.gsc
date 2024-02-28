// Atian COD Tools GSC decompiler test
#using scripts\weapons\mp\seeker_mine.gsc;
#using scripts\mp_common\player\player_loadout.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using scripts\mp_common\gametypes\globallogic_audio.gsc;
#using scripts\mp_common\gametypes\ct_vo.gsc;
#using scripts\mp_common\gametypes\ct_utils.gsc;
#using scripts\mp_common\gametypes\ct_gadgets.gsc;
#using scripts\mp_common\gametypes\ct_bots.gsc;
#using scripts\killstreaks\mp\swat_team.gsc;
#using scripts\killstreaks\mp\dart.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\killstreaks\killstreak_detect.gsc;
#using scripts\killstreaks\helicopter_shared.gsc;
#using scripts\core_common\vehicles\seeker_mine.gsc;
#using scripts\core_common\vehicle_ai_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\player\player_role.gsc;
#using scripts\core_common\perks.gsc;
#using scripts\core_common\flagsys_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\bots\bot_util.gsc;
#using scripts\core_common\bots\bot_action.gsc;
#using scripts\core_common\bots\bot.gsc;
#using script_57491143f0b931b5;

#namespace ct_prophet_tutorial;

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 0, eflags: 0x0
// Checksum 0x5a405ea1, Offset: 0x13e8
// Size: 0xba
function init() {
    killstreak_detect::init_shared();
    level.var_ae120f18 = array("vox_tvoi_tutor_prop_start_0");
    /#
        level thread function_324c6d8c();
    #/
    level thread ct_utils::function_6b71f442();
    level flag::init("tut_seeker3_button_pressed");
    level flag::init("fin2_enemy_chopper_destroyed");
    level.var_c8f47cbe = 3;
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 0, eflags: 0x0
// Checksum 0x647be0be, Offset: 0x14b0
// Size: 0x284
function function_c9ff0dce() {
    if (self.team == #"allies") {
        self thread ct_utils::function_8f04870f();
        self thread function_74efec9a();
    } else {
        if (isdefined(level.var_8ca3c62)) {
            switch (level.var_8ca3c62) {
            case 1:
                self.var_cf18d244 = 1;
                self thread function_58c62280(0, 1);
                self.bot.var_b2b8f0b6 = 500;
                self.bot.var_e8c941d6 = 1000;
                level.var_8c62f9f2 = self;
                self thread ct_utils::ai_stationary();
                break;
            case 3:
            case 4:
                self player_role::set(level.select_character);
                self thread function_383a4355();
                break;
            case 6:
                self thread function_58c62280(1, 1);
            case 7:
                self thread function_58c62280(0, 1);
                break;
            case 8:
                self thread function_d910a202();
                break;
            case 9:
                if (isdefined(level.var_f2a87955) && level.var_f2a87955) {
                    level.var_1de2df3c = self;
                    level.var_f2a87955 = 0;
                }
                self thread function_63b62665();
                break;
            default:
                self thread function_58c62280(0, 0);
                break;
            }
        }
        self thread ct_utils::function_5149c890(1, 1);
    }
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 11, eflags: 0x0
// Checksum 0x673bd80c, Offset: 0x1740
// Size: 0x60
function callback_player_damage(e_inflictor, e_attacker, n_damage, n_dflags, str_means_of_death, weapon, v_point, v_dir, str_hit_loc, n_psoffsettime, var_8b69d5cf) {
    return n_damage;
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 9, eflags: 0x0
// Checksum 0x8017881b, Offset: 0x17a8
// Size: 0x28a
function function_72ba0df6(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration) {
    if (self.team == #"axis") {
        if (isdefined(level.var_8ca3c62)) {
            if (level.var_8ca3c62 == 9) {
                if (isdefined(level.var_4572ae40) && isdefined(self.var_e37e98ba) && self.var_e37e98ba) {
                    level.var_4572ae40--;
                    self.var_e37e98ba = 0;
                }
            }
        }
        self.isinuse = 0;
    } else if (!isbot(self)) {
        if (isdefined(self.var_cd23c362)) {
            function_1eaaceab(self.var_cd23c362);
            if (self.var_cd23c362.size > 0) {
                foreach (e_seeker in self.var_cd23c362) {
                    e_seeker vehicle_ai::set_state("death");
                }
            }
        }
        if (isdefined(level.var_8ca3c62)) {
            switch (level.var_8ca3c62) {
            case 8:
                self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_prop_wine_plyr_dead"));
                break;
            case 9:
                level notify(#"tutorial_goto_end");
                if (!level flag::get("fin2_enemy_chopper_destroyed")) {
                    self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_prop_score_plyr_dead"));
                }
                break;
            }
        }
    }
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 0, eflags: 0x0
// Checksum 0x81b231e7, Offset: 0x1a40
// Size: 0x53c
function function_9b9525e9() {
    level endon(#"combattraining_logic_finished");
    level.var_e6db911d = 1;
    level.allowspecialistdialog = 0;
    do {
        e_player = ct_utils::get_player();
        waitframe(1);
    } while(!isalive(e_player));
    e_player.overrideplayerdamage = &overridedamage_player;
    e_player perks::perk_setperk(#"specialty_showenemyvehicles");
    level thread ct_utils::function_9ab507a9("colbounds_prophet_all", "colbounds_prophet_all_on", "colbounds_prophet_all_off", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("colbounds_prophet_seeker1_start", "colbounds_prophet_seeker1_start_on", "colbounds_prophet_seeker1_start_off", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("colbounds_prophet_seeker2_start", "colbounds_prophet_seeker2_start_on", "colbounds_prophet_seeker2_start_off", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("colbounds_prophet_seeker1_nobacktrack", "colbounds_prophet_seeker1_nobacktrack_on", "colbounds_prophet_seeker1_nobacktrack_off", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("colbounds_prophet_seeker3", "colbounds_prophet_seeker3_on", "colbounds_prophet_seeker3_off", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("colbounds_seeker3_noclimbs", "colbounds_seeker3_noclimbs_on", "colbounds_seeker3_noclimbs_off", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("colbounds_tempest1_nobacktrack", "colbounds_tempest1_nobacktrack_on", "colbounds_tempest1_nobacktrack_off", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("colbounds_tempest1_done", "colbounds_tempest1_done_on", "colbounds_tempest1_done_off", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("colbounds_tempest2_nobacktrack", "colbounds_tempest2_nobacktrack_on", "colbounds_tempest2_nobacktrack_off", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("colbounds_tempest2_window", "colbounds_tempest2_window_on", "colbounds_tempest2_window_off", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("colbounds_fin2_nobacktrack", "colbounds_fin2_nobacktrack_on", "colbounds_fin2_nobacktrack_off", undefined, 1, 0);
    waitframe(1);
    level notify(#"colbounds_prophet_all_on");
    level notify(#"colbounds_prophet_seeker1_start_on");
    level notify(#"colbounds_prophet_seeker2_start_on");
    level notify(#"colbounds_seeker3_noclimbs_on");
    level notify(#"colbounds_tempest1_nobacktrack_on");
    level notify(#"colbounds_tempest1_done_on");
    level notify(#"colbounds_tempest2_window_on");
    e_player function_ede7a778();
    e_player function_1690f8ca();
    e_player function_969b78e1();
    e_player function_8868dc7c();
    waitframe(1);
    e_player function_7536db69();
    waitframe(1);
    e_player function_67483f8c();
    e_player function_235b259b();
    e_player function_c7bb6e59();
    ct_utils::function_9aca2fa0("ct_endgame");
    e_player ct_utils::function_61c3d59c(#"hash_6cf10fe813765772", undefined, undefined, 1);
    e_player ct_vo::function_831e0584(array("vox_tvoi_tutor_prop_end_0", "vox_tvoi_tutor_prop_end_1"));
    /#
        while (isdefined(level.var_94d65b52) && level.var_94d65b52) {
            waitframe(1);
        }
    #/
    level.var_8fce01d = 0;
    ct_utils::onboarding_complete();
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 0, eflags: 0x0
// Checksum 0xc28abde4, Offset: 0x1f88
// Size: 0x4bc
function function_ede7a778() {
    level endon(#"combattraining_logic_finished");
    level.var_8ca3c62 = 1;
    ct_utils::function_e9ab1003(undefined);
    level.var_44961e6f = level.var_9d47488.tunables.var_9abfd5cf;
    level.var_9d47488.tunables.var_9abfd5cf = 10000;
    e_player = self;
    self ct_vo::function_3ca1b77d();
    level.var_e72728b8 = array(#"eq_seeker_mine", #"shock_rifle");
    self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_prop_start_1"));
    self thread ct_vo::function_261ed63c("vox_tvoi_tutor_prop_slide_2_nag", 30, 20);
    self thread ct_utils::function_61c3d59c(#"hash_15262616ac3924f0");
    self ct_utils::tutorial_goto("s_prophet_seeker1_goto");
    level notify(#"hash_60e26e14a51c5211");
    level notify(#"colbounds_prophet_seeker1_nobacktrack_on");
    self ct_vo::function_831e0584(array("vox_tvoi_tutor_prop_seeker_mine_2"));
    level.var_72c3ea74 = struct::get_array("s_prophet_soldier_loc_1", "targetname");
    level.var_da5432a2 = 0;
    level thread ct_bots::activate_bots(level.var_72c3ea74.size, #"axis");
    waitframe(1);
    self allowmelee(0);
    do {
        self thread ct_utils::function_61c3d59c(#"hash_7657f4c839045d4");
        self thread function_25bdd976();
        self thread ct_vo::function_261ed63c("vox_tvoi_tutor_prop_seeker_mine_nag", 7, 15);
        self waittill(#"hash_225857690f87699b");
        self thread ct_utils::function_61c3d59c(#"hash_62b1eebe8dd5d654");
        level notify(#"hash_60e26e14a51c5211");
        waitframe(1);
        self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_prop_seeker_mine_0 "));
        level thread ct_utils::function_c2a10fc();
        var_d7cff8ac = self function_2cf40ddd();
    } while(!(isdefined(var_d7cff8ac) && var_d7cff8ac));
    self waittill(#"seeker_discharge");
    level notify(#"hash_7fb05a5bbcb14d6b");
    level.e_seeker_mine.overridevehicledamage = &function_8259415c;
    self function_222141a5();
    self allowmelee(1);
    self thread function_723d853a();
    ct_utils::function_d00e0eeb();
    level notify(#"hash_60e26e14a51c5211");
    level.var_9d47488.tunables.var_9abfd5cf = level.var_44961e6f;
    if (isalive(level.e_seeker_mine)) {
        level.e_seeker_mine vehicle_ai::set_state("death");
    }
    ct_utils::function_c2a10fc();
    self ct_utils::function_6ad0c151();
    wait(0.5);
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 0, eflags: 0x0
// Checksum 0xe1fcec5f, Offset: 0x2450
// Size: 0x194
function function_2cf40ddd() {
    level endon(#"combattraining_logic_finished");
    while (!isdefined(level.e_seeker_mine)) {
        waitframe(1);
    }
    var_7cd7e8f3 = getent("trig_prophet_seeker1", "targetname");
    var_572adc8 = getent("trig_seeker_wrong_way", "targetname");
    do {
        waitframe(1);
    } while(isalive(level.e_seeker_mine) && !level.e_seeker_mine istouching(var_572adc8) && !level.e_seeker_mine istouching(var_7cd7e8f3));
    if (isalive(level.e_seeker_mine)) {
        if (level.e_seeker_mine istouching(var_7cd7e8f3)) {
            level notify(#"colbounds_prophet_seeker1_start_off");
            return 1;
        } else {
            level.e_seeker_mine vehicle_ai::set_state("death");
            while (isalive(level.e_seeker_mine)) {
                waitframe(1);
            }
            return 0;
        }
    } else {
        return 0;
    }
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 0, eflags: 0x0
// Checksum 0x1c7189c2, Offset: 0x25f0
// Size: 0x124
function function_723d853a() {
    level endon(#"combattraining_logic_finished");
    self thread ct_vo::function_261ed63c("vox_tvoi_tutor_prop_seeker_follow_nag", 10, 10);
    trig = getent("trig_prophet_seeker1", "targetname");
    while (!self istouching(trig)) {
        waitframe(1);
    }
    level notify(#"hash_60e26e14a51c5211");
    level.var_8c62f9f2 endon(#"death");
    self thread ct_utils::function_61c3d59c(#"hash_1b32bd34be1e3f53", undefined);
    self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_prop_enemy_stun"));
    waitframe(1);
    self thread ct_vo::function_261ed63c("vox_tvoi_tutor_prop_enemy_stun_nag");
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 0, eflags: 0x0
// Checksum 0xe6fa5d08, Offset: 0x2720
// Size: 0x5cc
function function_1690f8ca() {
    level endon(#"combattraining_logic_finished");
    level.var_8ca3c62 = 2;
    ct_utils::function_e9ab1003(undefined);
    self ct_vo::function_831e0584(array("vox_tvoi_tutor_prop_seeker_enemy_dead_0", "vox_tvoi_tutor_prop_seeker_enemy_dead_1"));
    self thread ct_vo::function_261ed63c("vox_tvoi_tutor_prop_slide_2_nag");
    ct_utils::function_93c86846(undefined, "s_prophet_seeker_obj_2", array(#"eq_seeker_mine", #"shock_rifle"), 0, undefined, 64);
    level notify(#"hash_60e26e14a51c5211");
    ct_utils::function_e9ab1003(undefined);
    level notify(#"colbounds_prophet_seeker1_start_on");
    self thread ct_utils::function_a3f8ddfa("colbounds_prophet_seeker2_start");
    level.var_72c3ea74 = struct::get_array("s_prophet_soldier_loc_2", "targetname");
    level.var_da5432a2 = 0;
    level thread ct_bots::activate_bots(level.var_72c3ea74.size, #"axis");
    self val::set(#"hash_40d296a404d374dd", "ignoreme", 1);
    self ct_vo::function_831e0584(array("vox_tvoi_tutor_prop_distract_enemy_0"));
    var_4bf2090e = 0;
    trig_tut_seeker2_deploy = getent("trig_tut_seeker2_deploy", "targetname");
    level.var_e72728b8 = array(#"shock_rifle");
    self thread ct_utils::function_61c3d59c(#"hash_72a3ecaa4a8465c0", array("vox_tvoi_tutor_prop_distract_enemy_1"));
    do {
        self ct_utils::function_6ad0c151();
        self thread function_25bdd976();
        self thread ct_vo::function_261ed63c("vox_tvoi_tutor_prop_distract_enemy_nag", 7, 15);
        self waittill(#"hash_225857690f87699b");
        level notify(#"hash_60e26e14a51c5211");
        level.var_e72728b8 = array(#"eq_seeker_mine", #"shock_rifle");
        self thread function_bd01a19b();
        wait(0.5);
        if (isalive(level.e_seeker_mine) && level.e_seeker_mine istouching(trig_tut_seeker2_deploy)) {
            var_4bf2090e = 1;
        } else if (isalive(level.e_seeker_mine)) {
            level.e_seeker_mine vehicle_ai::set_state("death");
        }
    } while(!var_4bf2090e);
    ct_utils::function_c2a10fc();
    while (isalive(level.e_seeker_mine) && !(isdefined(level.e_seeker_mine.var_74dc37fc) && level.e_seeker_mine.var_74dc37fc)) {
        waitframe(1);
    }
    level notify(#"hash_7711f0aa30443b10");
    self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_prop_throw_seeker"));
    self thread ct_utils::function_61c3d59c(#"hash_1bf4eaaf5d2ecee1", undefined);
    self val::reset(#"hash_40d296a404d374dd", "ignoreme");
    self thread function_222141a5();
    self thread ct_vo::function_261ed63c("vox_tvoi_tutor_prop_shoot_enemy_nag", 10, 15);
    ct_utils::function_d00e0eeb();
    level notify(#"hash_60e26e14a51c5211");
    ct_utils::function_c2a10fc();
    waitframe(1);
    self ct_utils::function_6ad0c151();
    level notify(#"hash_4c9c5fbc89779e64");
    self ct_vo::function_831e0584(array("vox_tvoi_tutor_prop_enemy_seeker_0"));
    wait(0.1);
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 0, eflags: 0x0
// Checksum 0x49c2169, Offset: 0x2cf8
// Size: 0x7e
function function_bd01a19b() {
    level endon(#"combattraining_logic_finished");
    while (!isalive(level.e_seeker_mine)) {
        waitframe(1);
    }
    level.e_seeker_mine endon(#"death");
    self waittill(#"seeker_discharge");
    level.e_seeker_mine.var_74dc37fc = 1;
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 1, eflags: 0x0
// Checksum 0x693fab5c, Offset: 0x2d80
// Size: 0x384
function function_7c64c8be(s_start_loc) {
    self endon(#"death");
    self.bot.var_b2b8f0b6 = 500;
    self.bot.var_e8c941d6 = 1000;
    self val::set(#"enemy_bot", "ignoreall", 1);
    self ct_utils::function_9fe3c3f4();
    self ct_utils::give_weapon(#"ar_accurate_t8", 1);
    self thread ct_utils::function_96dda082();
    if (isdefined(s_start_loc.script_noteworthy) && s_start_loc.script_noteworthy == #"seeker_target") {
        level.var_bc8c7099 = struct::get(#"seeker_target", "script_noteworthy");
        var_d6456ed5 = 0;
    } else {
        var_d6456ed5 = 1;
    }
    s_target = struct::get(s_start_loc.target, "targetname");
    var_adf33a9e = util::spawn_model("tag_origin", s_target.origin, s_target.angles);
    var_adf33a9e function_2baad8fc();
    var_adf33a9e.team = #"allies";
    self setentitytarget(var_adf33a9e);
    self thread function_df8f80c4(var_adf33a9e);
    level waittill(#"hash_7711f0aa30443b10");
    self notify(#"hash_624290b3f2248336");
    var_adf33a9e delete();
    wait(randomfloatrange(0.1, 0.75));
    self val::reset(#"enemy_bot", "ignoreall");
    if (isalive(level.e_seeker_mine)) {
        self ct_bots::function_911f9e8f(level.e_seeker_mine, 0.7);
        n_wait = randomfloatrange(1.5, 3);
        level.e_seeker_mine waittilltimeout(n_wait, #"death");
    }
    var_c688c774 = struct::get_array("s_tut_seeker2_battle_path", "targetname");
    s_tut_seeker2_battle_path = arraygetclosest(self.origin, var_c688c774);
    self thread ct_utils::function_1e7b75f2(s_tut_seeker2_battle_path);
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 0, eflags: 0x0
// Checksum 0x3e8cbb98, Offset: 0x3110
// Size: 0x29c
function function_969b78e1() {
    level endoncallback(&function_a5ead78e, #"combattraining_logic_finished");
    level.var_8ca3c62 = 3;
    ct_utils::function_e9ab1003(undefined);
    level notify(#"colbounds_prophet_seeker2_start_off");
    self ct_utils::function_6ad0c151();
    self thread ct_vo::function_261ed63c("vox_tvoi_tutor_prop_slide_2_nag", 7, 15);
    ct_utils::function_93c86846(undefined, "s_prophet_seeker3_goto", array(#"eq_seeker_mine", #"shock_rifle"), 0, undefined, 35);
    level notify(#"hash_60e26e14a51c5211");
    level notify(#"colbounds_prophet_seeker3_on");
    ct_utils::function_e9ab1003(undefined);
    function_7065027f();
    self val::reset(#"hash_40d296a404d374dd", "ignoreme");
    while (!isalive(level.var_924c5b44)) {
        waitframe(1);
    }
    level.e_seeker_mine = undefined;
    wait(0.1);
    self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_prop_enemy_seeker_1"));
    level.var_91a1cd89 = 1;
    level.var_8fce01d = 1;
    self function_8b563364(1);
    self ct_vo::function_831e0584(array("vox_tvoi_tutor_prop_remove_dart_1"));
    do {
        b_success = self function_8b563364();
    } while(!(isdefined(b_success) && b_success));
    self setlowready(0);
    level.var_8fce01d = 0;
    ct_utils::function_c2a10fc();
    wait(0.5);
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 1, eflags: 0x0
// Checksum 0xab80f273, Offset: 0x33b8
// Size: 0x1a
function function_a5ead78e(_hash) {
    level.var_8fce01d = 0;
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 1, eflags: 0x0
// Checksum 0xadb12589, Offset: 0x33e0
// Size: 0x600
function function_8b563364(var_8f2a3132 = 0) {
    level endon(#"combattraining_logic_finished");
    level.var_31a4679 = struct::get("s_enemy_seeker_loc_1", "targetname");
    var_64e764ed = getweapon(#"eq_seeker_mine");
    level.var_924c5b44 takeallweapons();
    waitframe(1);
    bare_hands = getweapon(#"bare_hands");
    level.var_924c5b44 giveweapon(bare_hands);
    while (!level.var_924c5b44 hasweapon(bare_hands)) {
        waitframe(1);
    }
    level.var_924c5b44 giveweapon(var_64e764ed);
    while (!level.var_924c5b44 hasweapon(var_64e764ed)) {
        waitframe(1);
    }
    gadget_health_regen = getweapon(#"gadget_health_regen");
    level.var_924c5b44 giveweapon(gadget_health_regen);
    while (!level.var_924c5b44 hasweapon(gadget_health_regen)) {
        waitframe(1);
    }
    shock_rifle = getweapon(#"shock_rifle");
    level.var_924c5b44 giveweapon(shock_rifle);
    while (!level.var_924c5b44 hasweapon(shock_rifle)) {
        waitframe(1);
    }
    waitframe(1);
    do {
        n_slot = level.var_924c5b44 gadgetgetslot(var_64e764ed);
        level.var_924c5b44 gadgetpowerset(n_slot, 100);
        level.var_924c5b44 bot_action::function_ee2eaccc(n_slot);
        while (!isalive(level.e_seeker_mine)) {
            waitframe(1);
        }
        if (var_8f2a3132) {
            var_76d6a4df = level.var_9d47488.tunables.var_170c494e;
            var_6eaff3ec = level.e_seeker_mine.settings.var_e0c78652;
            var_8cebe88e = level.var_9d47488.tunables.var_b9cf9139;
            level.e_seeker_mine.settings.var_e0c78652 = 1000000;
            level.var_9d47488.tunables.var_170c494e = 1000000;
            level.var_9d47488.tunables.var_b9cf9139 = 1000000;
        } else {
            var_a4ffa394 = self gamepadusedlast() ? #"hash_3d13389ee2095bf" : #"hash_60940c2522225649";
            self thread ct_utils::function_61c3d59c(var_a4ffa394, undefined);
        }
        var_2633e13b = self function_50999af5();
        self setlowready(0);
    } while(!(isdefined(var_2633e13b) && var_2633e13b));
    waitframe(1);
    if (!(isdefined(var_8f2a3132) && var_8f2a3132)) {
        util::waittill_any_ents_two(level.var_924c5b44, "seeker_discharge_stopped", self, "seekermine_minigame_complete");
        if (self.var_dda9b735.state == 1) {
            return 1;
        }
        self thread ct_utils::function_c2a10fc();
        var_72bbe2b0 = self gamepadusedlast() ? #"hash_36aa5bc9601b470e" : #"hash_3b73ae98e19d3d9e";
        self thread ct_utils::function_61c3d59c(var_72bbe2b0, undefined);
        self ct_vo::function_831e0584(array("vox_tvoi_tutor_prop_remove_dart_fail"));
        return 0;
    } else {
        self function_c1ddd9e7();
        if (isalive(level.e_seeker_mine)) {
            level.e_seeker_mine.settings.var_e0c78652 = var_6eaff3ec;
        }
        level.var_9d47488.tunables.var_170c494e = var_76d6a4df;
        level.var_9d47488.tunables.var_b9cf9139 = var_8cebe88e;
        return 1;
    }
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 1, eflags: 0x0
// Checksum 0xceb8872b, Offset: 0x39e8
// Size: 0xb2
function function_50999af5(n_timeout = 30) {
    level endon(#"combattraining_logic_finished");
    self thread function_70bb5ca7();
    n_starttime = gettime();
    do {
        n_time_passed = (gettime() - n_starttime) / 1000;
        waitframe(1);
    } while(isalive(level.e_seeker_mine) && !(isdefined(self.var_1564f6c) && self.var_1564f6c));
    return self.var_1564f6c;
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 0, eflags: 0x0
// Checksum 0xf6775d7d, Offset: 0x3aa8
// Size: 0x6e
function function_70bb5ca7() {
    level endon(#"combattraining_logic_finished");
    level.e_seeker_mine endon(#"death");
    self.var_1564f6c = 0;
    level.var_924c5b44 waittill(#"seeker_discharge");
    self.var_1564f6c = 1;
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 0, eflags: 0x0
// Checksum 0x50f968c0, Offset: 0x3b20
// Size: 0x214
function function_c1ddd9e7() {
    level endoncallback(&function_ab099b85, #"combattraining_logic_finished");
    var_c2a31444 = self gamepadusedlast() ? #"hash_19823bb31bcf0522" : #"hash_6a5f7a1ee19f5882";
    self thread ct_utils::function_61c3d59c(var_c2a31444, undefined);
    self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_prop_remove_dart_0"));
    while (!level.var_9d47488.prompt seeker_mine_prompt::is_open(self)) {
        waitframe(1);
    }
    setslowmotion(0.5, 0.05, 0.1);
    if (isalive(level.e_seeker_mine)) {
        level.e_seeker_mine setentitypaused(1);
    }
    self thread function_68fd3863();
    level flag::wait_till("tut_seeker3_button_pressed");
    if (isalive(level.e_seeker_mine)) {
        level.e_seeker_mine setentitypaused(0);
    }
    setslowmotion(0.05, 1, 0.1);
    self ct_utils::function_c2a10fc();
    level thread function_ab099b85(#"completed");
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 1, eflags: 0x0
// Checksum 0x9bb93c53, Offset: 0x3d40
// Size: 0x7c
function function_ab099b85(_hash) {
    e_player = ct_utils::get_player();
    var_6976202f = hash("square_button_paused" + "_off");
    str_color = "red_paused";
    setpauseworld(0);
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 0, eflags: 0x0
// Checksum 0x1062e52e, Offset: 0x3dc8
// Size: 0x74
function function_68fd3863() {
    level endon(#"combattraining_logic_finished");
    level flag::clear("tut_seeker3_button_pressed");
    while (!self usebuttonpressed()) {
        waitframe(1);
    }
    level flag::set("tut_seeker3_button_pressed");
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 0, eflags: 0x0
// Checksum 0x1b4582ee, Offset: 0x3e48
// Size: 0xbc
function function_7065027f() {
    level.var_7cab580 = ct_utils::get_roleindex(#"prt_mp_technomancer");
    level.select_character = ct_utils::get_roleindex(#"prt_mp_technomancer");
    level.var_72c3ea74 = struct::get_array("s_prophet_enemy_spawn_loc", "targetname");
    level.var_da5432a2 = 0;
    level thread ct_bots::activate_bots(level.var_72c3ea74.size, #"axis");
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 0, eflags: 0x0
// Checksum 0x68155dee, Offset: 0x3f10
// Size: 0x1a8
function function_8868dc7c() {
    level endoncallback(&function_799be48a, #"combattraining_finished");
    level.var_8ca3c62 = 4;
    ct_utils::function_e9ab1003(undefined);
    self ct_vo::function_831e0584(array("vox_tvoi_tutor_prop_enemy_seeker_shoot_0"));
    if (!isalive(level.var_924c5b44)) {
        function_7065027f();
    }
    level.var_8fce01d = 1;
    while (1) {
        function_64d067e7("s_enemy_seeker_loc_2");
        if (isdefined(level.var_e0532484) && level.var_e0532484) {
            level.var_e0532484 = 0;
            break;
        }
        self thread ct_utils::function_61c3d59c(#"hash_25893a1f4fc8cb50", undefined);
        self ct_vo::function_831e0584(array("vox_tvoi_tutor_prop_enemy_seeker_fail_nag"));
    }
    self ct_utils::function_6ad0c151();
    level notify(#"hash_56227775188dc01");
    ct_utils::function_c2a10fc();
    level.var_8fce01d = 0;
    wait(1);
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 1, eflags: 0x0
// Checksum 0x9b13801c, Offset: 0x40c0
// Size: 0x1a
function function_799be48a(_hash) {
    level.var_8fce01d = 0;
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 1, eflags: 0x0
// Checksum 0x2ad07314, Offset: 0x40e8
// Size: 0x1fe
function function_64d067e7(var_e3dee394) {
    level endon(#"combattraining_logic_finished");
    e_player = getplayers()[0];
    level.var_31a4679 = struct::get(var_e3dee394, "targetname");
    level.var_91a1cd89 = 1;
    level.var_924c5b44 loadout::give_loadout(#"axis", 0);
    n_slot = level.var_924c5b44 gadgetgetslot(getweapon(#"eq_seeker_mine"));
    level.var_924c5b44 bot_action::function_ee2eaccc(n_slot);
    e_player thread ct_utils::function_61c3d59c(#"hash_6dce5987ff1f2c59", undefined);
    self thread function_222141a5();
    e_player thread ct_vo::function_831e0584(array("vox_tvoi_tutor_prop_enemy_seeker_shoot_1"));
    while (!isalive(level.e_seeker_mine)) {
        waitframe(1);
    }
    level.e_seeker_mine clientfield::set("enemyvehicle", 1);
    while (1) {
        if (!isalive(level.e_seeker_mine)) {
            break;
        }
        if (isdefined(level.var_e0532484) && level.var_e0532484) {
            break;
        }
        waitframe(1);
    }
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 0, eflags: 0x0
// Checksum 0x85d3c9d0, Offset: 0x42f0
// Size: 0x590
function function_7536db69() {
    level endon(#"combattraining_logic_finished");
    level.var_8ca3c62 = 6;
    level.var_72c3ea74 = struct::get_array("s_prophet_tempest_soldier_loc_1", "targetname");
    level.var_da5432a2 = 0;
    level thread ct_bots::activate_bots(level.var_72c3ea74.size, #"axis");
    var_18483335 = level.var_a5ff950.var_3ee2edfa;
    level.var_a5ff950.var_3ee2edfa = 10000;
    level notify(#"colbounds_tempest1_nobacktrack_off");
    level notify(#"colbounds_seeker3_noclimbs_off");
    self ct_vo::function_831e0584(array("vox_tvoi_tutor_prop_tempest_0"));
    self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_prop_tempest_1"));
    self thread ct_vo::function_261ed63c("vox_tvoi_tutor_prop_slide_2_nag", 7, 15);
    ct_utils::function_e0d36a2c(undefined, "s_tempest1_goto", array(#"eq_seeker_mine", #"shock_rifle"), 0, undefined, 64);
    level notify(#"hash_60e26e14a51c5211");
    level notify(#"colbounds_tempest1_nobacktrack_on");
    self ct_vo::function_831e0584(array("vox_tvoi_tutor_prop_one_enemy_0", "vox_tvoi_tutor_prop_one_enemy_1"));
    self thread ct_vo::function_261ed63c("vox_tvoi_tutor_prop_one_enemy_nag");
    var_83c760a3 = self gamepadusedlast() ? #"hash_ddfc98dd869c791" : #"hash_1050c60b070c0477";
    self thread ct_utils::function_61c3d59c(var_83c760a3, undefined);
    level.var_e72728b8 = array(#"eq_seeker_mine");
    var_539244d1 = getweapon(#"shock_rifle");
    self thread function_5b350d94();
    do {
        waitframe(1);
        wpn_current = self getcurrentweapon();
    } while(wpn_current != var_539244d1);
    level notify(#"hash_60e26e14a51c5211");
    waitframe(1);
    self thread ct_utils::function_61c3d59c(#"hash_bf201c60ee31917");
    self thread ct_vo::function_261ed63c("vox_tvoi_tutor_prop_one_enemy_nag", 15, 25);
    while (1) {
        if (level.var_90de2af7.lastattackweapon === var_539244d1) {
            break;
        }
        waitframe(1);
    }
    level notify(#"hash_60e26e14a51c5211");
    waitframe(1);
    self thread ct_utils::function_c2a10fc();
    level.var_e72728b8 = array(#"eq_seeker_mine", #"shock_rifle");
    level.var_90de2af7 thread function_9f045dd9();
    self ct_vo::function_831e0584(array("vox_tvoi_tutor_prop_one_enemy_stun_0", "vox_tvoi_tutor_prop_one_enemy_stun_1", "vox_tvoi_tutor_prop_one_enemy_stun_2"));
    self thread function_b512a9bf(2);
    wait(0.5);
    self switchtoweapon(getweapon(#"shock_rifle"));
    self thread ct_vo::function_261ed63c("vox_tvoi_tutor_prop_one_enemy_stun_nag");
    self thread ct_utils::function_61c3d59c(#"hash_3c6c0533fb27028f", undefined);
    level.var_90de2af7 waittill(#"death");
    level.var_a5ff950.var_3ee2edfa = var_18483335;
    level notify(#"hash_60e26e14a51c5211");
    level notify(#"hash_358a76ad1437866d");
    wait(0.1);
    level notify(#"hash_4c9c5fbc89779e64");
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 0, eflags: 0x0
// Checksum 0x2f1b4724, Offset: 0x4888
// Size: 0xbe
function function_9f045dd9() {
    level endon(#"combattraining_logic_finished");
    self endon(#"death");
    level endoncallback(&function_95124f8f, #"hash_201ed7f5ca609dd3");
    self thread function_c61566f4();
    var_ccc662bf = 0.5;
    while (!(isdefined(level.var_4bdbb7de) && level.var_4bdbb7de)) {
        level.var_90de2af7 setnormalhealth(var_ccc662bf);
        waitframe(1);
    }
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 0, eflags: 0x0
// Checksum 0x89badc68, Offset: 0x4950
// Size: 0xbe
function function_c61566f4() {
    level.var_4bdbb7de = 0;
    wait(0.1);
    while (!(isdefined(level.var_4bdbb7de) && level.var_4bdbb7de)) {
        s_notify = undefined;
        s_notify = self waittill(#"damage");
        if (s_notify.weapon == getweapon(#"shock_rifle") && s_notify.mod == "MOD_IMPACT") {
            level.var_4bdbb7de = 1;
        }
    }
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 0, eflags: 0x0
// Checksum 0xd04ad53b, Offset: 0x4a18
// Size: 0x3c
function function_95124f8f() {
    if (isalive(level.var_90de2af7)) {
        util::stop_magic_bullet_shield(level.var_90de2af7);
    }
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 2, eflags: 0x0
// Checksum 0x662ddc1d, Offset: 0x4a60
// Size: 0x196
function function_5b350d94(var_43d50d89 = 1, var_463b195d = 1) {
    level notify(#"hash_358a76ad1437866d");
    waitframe(1);
    level endon(#"combattraining_logic_finished", #"hash_358a76ad1437866d");
    var_539244d1 = getweapon(#"shock_rifle");
    n_clipsize = self getweaponammoclipsize(var_539244d1);
    n_slot = self gadgetgetslot(var_539244d1);
    while (1) {
        if (!isinarray(level.var_e72728b8, #"shock_rifle")) {
            if (isdefined(var_43d50d89) && var_43d50d89) {
                self gadgetpowerset(n_slot, 100);
                self setweaponammofuel(var_539244d1, 100);
            }
            if (isdefined(var_463b195d) && var_463b195d) {
                self setweaponammoclip(var_539244d1, n_clipsize);
            }
        }
        waitframe(1);
    }
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 0, eflags: 0x0
// Checksum 0x84a641b0, Offset: 0x4c00
// Size: 0x49c
function function_67483f8c() {
    level endon(#"combattraining_logic_finished");
    level.var_8ca3c62 = 7;
    level notify(#"colbounds_tempest1_done_off");
    self ct_vo::function_831e0584(array("vox_tvoi_tutor_prop_enemy_seeker_first"));
    self thread ct_vo::function_261ed63c("vox_tvoi_tutor_prop_slide_2_nag", 7, 10);
    ct_utils::function_93c86846(undefined, "s_prophet_tempest_battle_1_loc", array(#"eq_seeker_mine", #"shock_rifle"), 0, undefined, 25);
    level notify(#"hash_60e26e14a51c5211");
    level.var_72c3ea74 = struct::get_array("s_tempest2_enemy", "targetname");
    level.var_da5432a2 = 0;
    level thread ct_bots::activate_bots(level.var_72c3ea74.size, #"axis");
    self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_prop_tempest_chain_0", "vox_tvoi_tutor_prop_tempest_chain_1"));
    i = 3;
    while (i <= 7) {
        str_loc = "s_prophet_tempest_battle_" + i + "_loc";
        self thread ct_vo::function_261ed63c("vox_tvoi_tutor_prop_slide_2_nag", 20, 20);
        ct_utils::function_93c86846(undefined, str_loc, array(#"eq_seeker_mine", #"shock_rifle"), 0, undefined, 25);
        level notify(#"hash_60e26e14a51c5211");
        waitframe(1);
        i = i + 2;
    }
    level notify(#"colbounds_tempest2_nobacktrack_on");
    ct_utils::function_e9ab1003(undefined);
    level.var_e72728b8 = array(#"eq_seeker_mine");
    self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_prop_chain_group_0", "vox_tvoi_tutor_prop_chain_group_1"));
    var_539244d1 = getweapon(#"shock_rifle");
    self function_b512a9bf(2);
    self thread ct_vo::function_261ed63c("vox_tvoi_tutor_prop_one_enemy_nag");
    var_8c3d9081 = self gamepadusedlast() ? #"hash_ddfc98dd869c791" : #"hash_1050c60b070c0477";
    self thread ct_utils::function_61c3d59c(var_8c3d9081, undefined);
    do {
        waitframe(1);
        wpn_current = self getcurrentweapon();
    } while(wpn_current != var_539244d1);
    level notify(#"hash_60e26e14a51c5211");
    waitframe(1);
    self thread function_5398e045();
    ct_utils::function_d00e0eeb();
    level notify(#"hash_60e26e14a51c5211");
    self ct_utils::function_c2a10fc();
    self ct_vo::function_3ca1b77d(1);
    self ct_vo::function_831e0584(array("vox_tvoi_tutor_prop_final_event"));
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 0, eflags: 0x0
// Checksum 0xddce9875, Offset: 0x50a8
// Size: 0x18c
function function_5398e045() {
    level endon(#"combattraining_logic_finished");
    self thread ct_utils::function_61c3d59c(#"hash_688a06c304d569e5", undefined);
    self thread ct_vo::function_261ed63c("vox_tvoi_tutor_prop_chain_group_nag", 15, 15);
    self thread ct_vo::function_625a37f9("vox_tvoi_tutor_prop_chain_group_stun_nag", "tempest2_enemy_zapped", 1);
    level waittill(#"tempest2_enemy_zapped");
    level notify(#"hash_60e26e14a51c5211");
    waitframe(1);
    self thread ct_utils::function_61c3d59c(#"hash_5a15cd7ce4d7ba35", undefined);
    wait(1);
    self thread function_8bbca25b();
    s_notify = undefined;
    s_notify = level waittill(#"tempest2_enemy_killed", #"hash_7cc7c12d2396a9e", #"hash_6af26ccf744145f0");
    if (s_notify._notify !== "tempest2_enemy_killed") {
        self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_prop_chain_group_stun"));
    }
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 0, eflags: 0x0
// Checksum 0x4bf6317f, Offset: 0x5240
// Size: 0xf8
function function_8bbca25b() {
    level endon(#"combattraining_logic_finished");
    self endon(#"death");
    var_8db96f30 = soundgetplaybacktime("vox_tvoi_tutor_prop_chain_group_stun_nag") / 1000 + 7;
    n_start_time = gettime();
    do {
        waitframe(1);
        n_time_passed = (gettime() - n_start_time) / 1000;
    } while(!self attackbuttonpressed() && n_time_passed < var_8db96f30);
    if (n_time_passed >= var_8db96f30) {
        level notify(#"hash_6af26ccf744145f0");
    } else {
        wait(0.5);
        level notify(#"hash_7cc7c12d2396a9e");
    }
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 1, eflags: 0x0
// Checksum 0x36cb7f8, Offset: 0x5340
// Size: 0x2e0
function function_c4546e73(s_start_loc) {
    self endoncallback(&function_3b67dc84, #"death");
    self val::set(#"enemy_bot", "ignoreall", 1);
    self.bot.var_b2b8f0b6 = 500;
    self.bot.var_e8c941d6 = 1000;
    self ct_utils::function_9fe3c3f4();
    self ct_utils::give_weapon(#"ar_accurate_t8", 1);
    self thread ct_utils::function_5b59f3b7(s_start_loc.origin, s_start_loc.angles, 32, 1, 1);
    self thread ct_utils::function_96dda082();
    a_s_target = struct::get_array("s_tempest2_enemy_shootat", "targetname");
    s_target = array::random(a_s_target);
    var_adf33a9e = util::spawn_model("tag_origin", s_target.origin, s_target.angles);
    var_adf33a9e function_2baad8fc();
    var_adf33a9e.team = #"allies";
    self setentitytarget(var_adf33a9e);
    self thread function_df8f80c4(var_adf33a9e);
    s_notify = undefined;
    s_notify = self waittill(#"damage");
    self notify(#"hash_624290b3f2248336");
    level notify(#"tempest2_enemy_zapped");
    var_adf33a9e delete();
    wait(randomfloatrange(0.75, 1.75));
    self val::reset(#"enemy_bot", "ignoreall");
    self thread function_b559b2a5();
    s_notify = undefined;
    s_notify = self waittill(#"shock_end");
    level notify(#"hash_3638801d24dda821");
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 1, eflags: 0x0
// Checksum 0x190aa67e, Offset: 0x5628
// Size: 0x20
function function_3b67dc84(_hash) {
    level notify(#"tempest2_enemy_killed");
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 0, eflags: 0x0
// Checksum 0xb7d39ac7, Offset: 0x5650
// Size: 0x66
function function_b559b2a5() {
    level endon(#"combattraining_logic_finished");
    self endon(#"death");
    while (1) {
        self setgoal(self.origin, 1, 1);
        waitframe(1);
    }
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 0, eflags: 0x0
// Checksum 0xbf5e033a, Offset: 0x56c0
// Size: 0x614
function function_235b259b() {
    level.var_8ca3c62 = 8;
    ct_utils::function_9e33850b();
    self thread ct_vo::function_261ed63c("vox_tvoi_tutor_prop_slide_2_nag", 7, 10);
    ct_utils::function_93c86846(undefined, "s_prophet_tut_fin1_goto", array(#"eq_seeker_mine", #"shock_rifle"), 0, undefined, 36);
    level notify(#"hash_60e26e14a51c5211");
    ct_utils::function_e9ab1003(undefined);
    self ct_vo::function_3ca1b77d();
    self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_prop_wine_cellar_start"));
    wait(5.5);
    self function_b512a9bf(0);
    self thread function_222141a5();
    a_str_spawns = array("s_tut_fin1_wave1_enemy_a", "s_tut_fin1_wave1_enemy_b");
    str_spawns = array::random(a_str_spawns);
    var_31879d4d = [];
    var_31879d4d[#"s_tut_fin1_wave1_enemy_a"] = "s_tut_fin1_respawn_a";
    var_31879d4d[#"s_tut_fin1_wave1_enemy_b"] = "s_tut_fin1_respawn_b";
    var_31879d4d[#"s_tut_fin1_wave2_enemy"] = "s_tut_fin1_respawn_wave_2";
    var_fd96aacc = var_31879d4d[str_spawns];
    level.var_3f7591c4 = 0;
    level.var_72c3ea74 = struct::get_array(str_spawns, "targetname");
    level.var_da5432a2 = 0;
    level thread ct_bots::activate_bots(level.var_72c3ea74.size, #"axis");
    level.var_c271b8e0 = level.var_72c3ea74.size;
    level.var_e72728b8 = [];
    self thread function_25bdd976(0, 0);
    self thread function_f4ca14fb();
    self thread ct_vo::function_625a37f9("vox_tvoi_tutor_prop_wine_chain_success", "enemy_tempest_chained", 1, 0);
    level waittill(#"hash_5d67cd17870cf7b6");
    level.var_3f7591c4 = 1;
    ct_utils::function_9aca2fa0("ct_action2");
    level notify(#"hash_60e26e14a51c5211");
    waitframe(1);
    self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_prop_wine_enemy_locate"));
    self thread ct_utils::function_61c3d59c(undefined, undefined, "dynobj_KillEnemies");
    self thread ct_utils::function_80bf685b(level.var_c271b8e0);
    ct_utils::function_e9ab1003(var_fd96aacc);
    self ct_utils::function_d00e0eeb();
    ct_utils::function_9aca2fa0("ct_action");
    self thread ct_utils::function_c2a10fc();
    self ct_vo::function_831e0584(array("vox_tvoi_tutor_prop_wine_comp_0"));
    level.var_3f7591c4 = 0;
    str_spawns = "s_tut_fin1_wave2_enemy";
    var_fd96aacc = var_31879d4d[str_spawns];
    level.var_72c3ea74 = struct::get_array(str_spawns, "targetname");
    level.var_da5432a2 = 0;
    level thread ct_bots::activate_bots(level.var_72c3ea74.size, #"axis");
    level.var_c271b8e0 = level.var_72c3ea74.size;
    ct_utils::function_9aca2fa0("ct_action2");
    self thread function_f4ca14fb(1);
    level waittill(#"hash_5d67cd17870cf7b6");
    level.var_3f7591c4 = 1;
    level notify(#"hash_60e26e14a51c5211");
    waitframe(1);
    self thread ct_utils::function_61c3d59c(undefined, undefined, "dynobj_KillEnemies");
    self thread ct_utils::function_80bf685b(level.var_c271b8e0);
    ct_utils::function_e9ab1003(var_fd96aacc);
    self ct_utils::function_d00e0eeb();
    ct_utils::function_9aca2fa0("ct_action");
    self thread ct_utils::function_c2a10fc();
    wait(1);
    self ct_vo::function_3ca1b77d();
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 1, eflags: 0x0
// Checksum 0x7899df48, Offset: 0x5ce0
// Size: 0x22a
function function_f4ca14fb(var_a8183c4a = 0) {
    level endon(#"combattraining_logic_finished", #"hash_5d67cd17870cf7b6");
    while (1) {
        self thread ct_vo::function_261ed63c("vox_tvoi_tutor_prop_wine_seeker_deploy_nag", 10, 15);
        if (!(isdefined(var_a8183c4a) && var_a8183c4a)) {
            self thread ct_utils::function_61c3d59c(#"hash_3c3e43ddca2a93c0");
        } else {
            self thread ct_utils::function_61c3d59c(#"hash_86143de86596436");
        }
        while (!isalive(level.e_seeker_mine)) {
            waitframe(1);
        }
        level.e_seeker_mine.overridevehicledamage = &function_8259415c;
        level notify(#"hash_60e26e14a51c5211");
        self thread ct_utils::function_61c3d59c(#"hash_67782885ac8e210c");
        waitframe(1);
        self ct_vo::function_3ca1b77d();
        self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_prop_wine_seeker_follow_nag"));
        if (!(isdefined(level.var_3f7591c4) && level.var_3f7591c4)) {
            self thread ct_vo::function_261ed63c("vox_tvoi_tutor_prop_wine_seeker_follow_nag", 15, 15, "vo_nag_follow_seeker_end");
        }
        while (isalive(level.e_seeker_mine)) {
            waitframe(1);
        }
        level notify(#"vo_nag_follow_seeker_end");
        level notify(#"hash_60e26e14a51c5211");
        waitframe(1);
    }
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 0, eflags: 0x0
// Checksum 0x6ac52d17, Offset: 0x5f18
// Size: 0xc4
function function_d910a202() {
    self endon(#"death");
    s_loc = level.var_72c3ea74[level.var_da5432a2];
    level.var_da5432a2++;
    if (level.var_da5432a2 >= level.var_72c3ea74.size) {
        level.var_da5432a2 = 0;
    }
    self setorigin(s_loc.origin);
    self setplayerangles(s_loc.angles);
    self thread function_aae68385(s_loc);
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 1, eflags: 0x0
// Checksum 0x95c6d95, Offset: 0x5fe8
// Size: 0x228
function function_aae68385(s_loc) {
    level endon(#"combattraining_logic_finished");
    self endon(#"death");
    e_player = ct_utils::get_player();
    self.bot.var_b2b8f0b6 = 500;
    self.bot.var_e8c941d6 = 1000;
    self thread function_4938210c(s_loc);
    if (isdefined(s_loc.target)) {
        self thread ct_utils::function_1e7b75f2(s_loc);
    } else {
        self thread ct_utils::function_5b59f3b7(s_loc.origin, s_loc.angles, 32, 0, 0, 1);
    }
    self thread function_80ad1ef6();
    var_bfb8f3ce = 0;
    while (!var_bfb8f3ce) {
        wait(randomfloatrange(0.1, 0.3));
        if (isalive(e_player)) {
            var_9b1a9f00 = distance2d(self.origin, e_player.origin);
            var_7caea647 = e_player cansee(self);
            var_bfb8f3ce = var_7caea647 || var_9b1a9f00 <= 350 && e_player ct_utils::is_facing(self, 0.7, 1);
        }
    }
    e_player notify(#"hash_5d67cd17870cf7b6");
    level notify(#"hash_5d67cd17870cf7b6");
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 1, eflags: 0x0
// Checksum 0xc8701f71, Offset: 0x6218
// Size: 0x17c
function function_4938210c(s_loc) {
    level endon(#"combattraining_logic_finished");
    self endon(#"death");
    self flagsys::wait_till(#"loadout_given");
    self takeallweapons();
    waitframe(1);
    if (!isdefined(s_loc.var_b4efaca)) {
        var_6906fd0d = array(#"ar_accurate_t8", #"smg_standard_t8", #"shotgun_pump_t8");
        var_f40fdd35 = array::random(var_6906fd0d);
    } else {
        var_f40fdd35 = s_loc.var_b4efaca;
    }
    wpn = getweapon(var_f40fdd35);
    self giveweapon(wpn);
    while (!self hasweapon(wpn)) {
        waitframe(1);
    }
    self switchtoweaponimmediate(wpn, 1);
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 0, eflags: 0x0
// Checksum 0xb4af59e9, Offset: 0x63a0
// Size: 0x12c
function function_80ad1ef6() {
    level endon(#"combattraining_logic_finished");
    var_539244d1 = getweapon(#"shock_rifle");
    s_notify = undefined;
    s_notify = self waittill(#"damage");
    if (s_notify.weapon === var_539244d1 && s_notify.mod == "MOD_UNKNOWN") {
        level notify(#"enemy_tempest_chained");
    }
    while (isalive(self)) {
        waitframe(1);
    }
    if (isdefined(level.var_c271b8e0)) {
        e_player = ct_utils::get_player();
        level.var_c271b8e0--;
        e_player thread ct_utils::function_80bf685b(level.var_c271b8e0);
    }
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 0, eflags: 0x0
// Checksum 0x9a10e613, Offset: 0x64d8
// Size: 0x32a
function function_c7bb6e59() {
    level.var_8ca3c62 = 9;
    wait(1);
    level flag::clear("fin2_enemy_chopper_destroyed");
    self function_fd9e1b7d();
    ct_utils::function_e9ab1003(undefined);
    self thread function_222141a5();
    level.var_e72728b8 = [];
    self thread function_25bdd976(0, 0);
    level notify(#"colbounds_fin2_nobacktrack_on");
    self ct_vo::function_831e0584(array("vox_tvoi_tutor_prop_wine_comp_1"));
    self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_prop_wine_comp_2", "vox_tvoi_tutor_prop_wine_comp_3", "vox_tvoi_tutor_prop_wine_comp_4"));
    self thread function_c448a1e0();
    self thread function_f99e791d();
    ct_utils::function_9aca2fa0("ct_action2");
    self thread function_f868e3e2();
    level flag::wait_till("fin2_enemy_chopper_destroyed");
    level notify(#"hash_1c966d2b46abb009");
    level notify(#"hash_73522d92576b145b");
    level notify(#"hash_60e26e14a51c5211");
    self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_prop_score_hit"));
    a_e_enemies = self ct_bots::function_dde6edbd();
    if (a_e_enemies.size > 0) {
        foreach (e_enemy in a_e_enemies) {
            e_enemy notify(#"hash_658257c9e391c92c");
            waitframe(1);
            e_enemy thread ct_utils::function_4caeacf6();
        }
        self thread ct_utils::function_61c3d59c(#"hash_687bdb31f0e63e65");
        self ct_utils::function_d00e0eeb();
    }
    self ct_utils::function_c2a10fc();
    level.var_8ca3c62 = 10;
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 0, eflags: 0x0
// Checksum 0x384257c6, Offset: 0x6810
// Size: 0xbe
function function_fd9e1b7d() {
    level endon(#"combattraining_logic_finished");
    level.var_3d80a2a5 = 0;
    self childthread ct_vo::function_261ed63c("vox_tvoi_tutor_prop_slide_2_nag", 7, 10);
    ct_utils::function_93c86846(undefined, "s_prophet_tut_fin2_goto", array(#"eq_seeker_mine", #"shock_rifle"), 0, undefined, 128);
    level notify(#"hash_60e26e14a51c5211");
    level.var_3d80a2a5 = 1;
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 0, eflags: 0x0
// Checksum 0xe45b28bb, Offset: 0x68d8
// Size: 0x11e
function function_c448a1e0() {
    level endon(#"combattraining_logic_finished", #"hash_140ca7004aa8dc4b", #"fin2_enemy_chopper_destroyed");
    self endon(#"death");
    while (!level flag::get("fin2_enemy_chopper_destroyed")) {
        if (!(isdefined(level.var_51ff7a58) && level.var_51ff7a58)) {
            self thread ct_utils::function_e96cc63f(4, "s_tut_fin2_enemy", 1, 2, 3, 1, "fin2_enemy_bot");
            self waittill(#"hash_78aff79640650d11");
            level notify(#"hash_3ce5abc259d8b041");
            ct_utils::function_49e0c5bc();
        }
        self waittill(#"dart_done");
    }
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 0, eflags: 0x0
// Checksum 0x8dc97f58, Offset: 0x6a00
// Size: 0x12c
function function_63b62665() {
    level endon(#"combattraining_logic_finished");
    var_33ae7665 = self.targetname;
    level.var_e4db2e78 = level.var_a76a5221[var_33ae7665];
    if (!isdefined(level.var_b6e6a025[var_33ae7665]) || level.var_b6e6a025[var_33ae7665] >= level.var_e4db2e78.size) {
        level.var_b6e6a025[var_33ae7665] = 0;
    }
    s_loc = level.var_e4db2e78[level.var_b6e6a025[var_33ae7665]];
    self.script_int = level.var_b6e6a025[var_33ae7665];
    level.var_b6e6a025[var_33ae7665]++;
    self ct_utils::function_61d750d4(s_loc.origin, s_loc.angles);
    self thread function_d6addc3b(s_loc);
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 1, eflags: 0x0
// Checksum 0x3f718ea2, Offset: 0x6b38
// Size: 0x11c
function function_d6addc3b(s_loc) {
    self.bot.var_b2b8f0b6 = 150;
    self.bot.var_e8c941d6 = 300;
    if (!isdefined(s_loc.var_b4efaca)) {
        var_6906fd0d = array(#"ar_accurate_t8", #"smg_standard_t8", #"shotgun_pump_t8");
        var_f40fdd35 = array::random(var_6906fd0d);
    } else {
        var_f40fdd35 = s_loc.var_b4efaca;
    }
    self thread ct_utils::give_weapon(var_f40fdd35, 1);
    if (!isdefined(s_loc.target)) {
        self thread ct_utils::function_4caeacf6();
    } else {
        self thread ct_utils::function_1e7b75f2(s_loc);
    }
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 0, eflags: 0x0
// Checksum 0xf48181f8, Offset: 0x6c60
// Size: 0x174
function function_2b6f2238() {
    self thread function_222141a5();
    a_e_enemies = self ct_bots::function_dde6edbd();
    self ct_utils::function_7a739ee3(a_e_enemies, "s_fin2_player_respawn");
    if (!level flag::get("fin2_enemy_chopper_destroyed")) {
        if (isdefined(level.var_51ff7a58) && level.var_51ff7a58) {
            level thread ct_utils::function_e44c5b8e(#"dart", 0, 1);
        } else if (isdefined(level.var_3d80a2a5) && level.var_3d80a2a5) {
            self thread ct_utils::function_61c3d59c(undefined, undefined, "dynobj_EarnDart");
            self thread ct_utils::function_80bf685b(0);
            level.var_d1f07c87 = 0;
            level thread ct_utils::function_e44c5b8e(#"dart", 10, 1);
            self thread function_c448a1e0();
        }
    }
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 2, eflags: 0x0
// Checksum 0x633127c1, Offset: 0x6de0
// Size: 0x268
function function_cc50d201(var_14a220fc = 4, var_e01def33 = 1) {
    level endon(#"combattraining_logic_finished", #"hash_ca983e29a84fac8");
    self endon(#"death");
    level.var_14a220fc = var_14a220fc;
    while (!level flag::get("fin2_enemy_chopper_destroyed")) {
        a_e_enemies = self ct_bots::function_dde6edbd();
        level.var_4572ae40 = 0;
        var_2496c4c = [];
        foreach (e_enemy in a_e_enemies) {
            if (!(isdefined(e_enemy.var_e37e98ba) && e_enemy.var_e37e98ba)) {
                var_2496c4c[var_2496c4c.size] = e_enemy;
            } else {
                level.var_4572ae40++;
            }
        }
        if (level.var_4572ae40 < level.var_14a220fc) {
            var_cf637c27 = level.var_14a220fc - level.var_4572ae40;
            if (var_cf637c27 > 0) {
                if (var_cf637c27 > var_2496c4c.size) {
                    var_cf637c27 = var_2496c4c.size;
                }
                var_2496c4c = arraysortclosest(var_2496c4c, self.origin);
                for (i = 0; i < var_cf637c27; i++) {
                    e_enemy = var_2496c4c[i];
                    if (isalive(e_enemy)) {
                        e_enemy.var_e37e98ba = 1;
                        e_enemy thread ct_utils::function_4caeacf6();
                    }
                }
            }
        }
        wait(var_e01def33);
    }
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 0, eflags: 0x0
// Checksum 0x5cd76e7b, Offset: 0x7050
// Size: 0xb0
function function_9fb49c9e() {
    e_player = ct_utils::get_player();
    a_e_enemies = self ct_bots::function_dde6edbd();
    foreach (e_enemy in a_e_enemies) {
        e_enemy thread ct_utils::function_4caeacf6();
    }
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 1, eflags: 0x0
// Checksum 0xbad96f90, Offset: 0x7108
// Size: 0x62
function function_e5964493(e_seeker_mine) {
    level endon(#"combattraining_logic_finished");
    while (1) {
        if (!isalive(e_seeker_mine)) {
            break;
        }
        if (e_seeker_mine.var_a5b686b6 > 0) {
            break;
        }
        waitframe(1);
    }
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 0, eflags: 0x0
// Checksum 0x3b5afa98, Offset: 0x7178
// Size: 0x1ac
function function_147ce591() {
    level endon(#"combattraining_logic_finished");
    self endon(#"death");
    s_loc = level.var_72c3ea74[level.var_da5432a2];
    level.var_da5432a2++;
    if (level.var_da5432a2 >= level.var_72c3ea74.size) {
        level.var_da5432a2 = 0;
    }
    self setorigin(s_loc.origin);
    self setplayerangles(s_loc.angles);
    self thread ct_utils::function_5b59f3b7(s_loc.origin, s_loc.angles, 64);
    self util::magic_bullet_shield();
    while (1) {
        e_player = getplayers()[0];
        n_dist = distance(self.origin, e_player.origin);
        if (n_dist < 650) {
            break;
        }
        waitframe(1);
    }
    level notify(#"hash_13d7bd4f91706731");
    self util::stop_magic_bullet_shield();
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 0, eflags: 0x0
// Checksum 0x7c3c8a91, Offset: 0x7330
// Size: 0x164
function function_1d1403a() {
    self endon(#"death");
    s_loc = level.var_72c3ea74[level.var_da5432a2];
    level.var_da5432a2++;
    if (level.var_da5432a2 >= level.var_72c3ea74.size) {
        level.var_da5432a2 = 0;
    }
    self ct_utils::function_61d750d4(s_loc.origin, s_loc.angles);
    self thread ct_utils::function_5b59f3b7(s_loc.origin, s_loc.angles, 64);
    self util::magic_bullet_shield();
    self val::set(#"ai_seeker", "ignoreall", 1);
    level waittill(#"hash_7711f0aa30443b10");
    self util::stop_magic_bullet_shield();
    self val::reset(#"ai_seeker", "ignoreall");
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 0, eflags: 0x0
// Checksum 0xbdf0ce8, Offset: 0x74a0
// Size: 0x16c
function function_383a4355() {
    self endon(#"death");
    s_loc = level.var_72c3ea74[level.var_da5432a2];
    level.var_da5432a2++;
    if (level.var_da5432a2 >= level.var_72c3ea74.size) {
        level.var_da5432a2 = 0;
    }
    self setorigin(s_loc.origin);
    self setplayerangles(s_loc.angles);
    self val::set(#"enemy_prophet", "ignoreall", 1);
    self thread ct_utils::function_5b59f3b7(s_loc.origin, s_loc.angles, 32, 1, 1, 1);
    level.var_924c5b44 = self;
    level waittill(#"hash_56227775188dc01");
    self dodamage(self.health + 100, self.origin);
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 0, eflags: 0x0
// Checksum 0x7efeb220, Offset: 0x7618
// Size: 0x11a
function function_d6e37caf() {
    self endon(#"death");
    s_loc = level.var_72c3ea74[level.var_da5432a2];
    level.var_da5432a2++;
    if (level.var_da5432a2 >= level.var_72c3ea74.size) {
        level.var_da5432a2 = 0;
    }
    self setorigin(s_loc.origin);
    self setplayerangles(s_loc.angles);
    self thread ct_utils::function_5b59f3b7(s_loc.origin, s_loc.angles, 64);
    self val::set(#"enemy_tempest", "ignoreall", 1);
    level.var_90de2af7 = self;
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 0, eflags: 0x0
// Checksum 0x48a9eae5, Offset: 0x7740
// Size: 0x10c
function dailydaily() {
    self endon(#"death");
    s_loc = level.var_72c3ea74[level.var_da5432a2];
    level.var_da5432a2++;
    if (level.var_da5432a2 >= level.var_72c3ea74.size) {
        level.var_da5432a2 = 0;
    }
    self setorigin(s_loc.origin);
    self setplayerangles(s_loc.angles);
    self thread ct_utils::function_5b59f3b7(s_loc.origin, s_loc.angles, 64);
    self val::set(#"enemy_tempest", "ignoreall", 1);
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 3, eflags: 0x0
// Checksum 0x19221c11, Offset: 0x7858
// Size: 0x100
function function_df8f80c4(e_target, n_wait_min = 0.1, n_wait_max = 0.5) {
    level endon(#"combattraining_logic_finished");
    self endon(#"death", #"hash_624290b3f2248336");
    while (1) {
        if (isdefined(e_target)) {
            var_add3ed29 = {#aimpoint:e_target.origin};
            self bot_action::aim_at_target(var_add3ed29);
        }
        self bottapbutton(0);
        wait(randomfloatrange(n_wait_min, n_wait_max));
    }
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 2, eflags: 0x0
// Checksum 0xf2373561, Offset: 0x7960
// Size: 0x272
function function_58c62280(b_keyline, var_2f3964e3) {
    self endon(#"death");
    s_loc = level.var_72c3ea74[level.var_da5432a2];
    level.var_da5432a2++;
    if (level.var_da5432a2 >= level.var_72c3ea74.size) {
        level.var_da5432a2 = 0;
    }
    self ct_utils::function_61d750d4(s_loc);
    self thread ct_utils::function_5b59f3b7(s_loc.origin, s_loc.angles, 32);
    if (isdefined(var_2f3964e3) && var_2f3964e3) {
        self val::set(#"enemy_bot", "ignoreall");
    }
    wait(0.2);
    if (isdefined(b_keyline) && b_keyline) {
        self clientfield::set("enemy_keyline_render", 1);
    }
    switch (level.var_8ca3c62) {
    case 1:
        level waittill(#"hash_7fb05a5bbcb14d6b");
        self val::reset(#"enemy_bot", "ignoreall");
        self thread ct_utils::function_5b59f3b7(self.origin, self.angles, 200);
        break;
    case 2:
        self thread function_7c64c8be(s_loc);
        break;
    case 3:
        level.var_924c5b44 = self;
        break;
    case 6:
        level.var_90de2af7 = self;
        break;
    case 7:
        self thread function_c4546e73(s_loc);
        break;
    default:
        break;
    }
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 0, eflags: 0x0
// Checksum 0x980cfe85, Offset: 0x7be0
// Size: 0x1bc
function function_f868e3e2() {
    level notify(#"hash_73522d92576b145b");
    level endon(#"combattraining_logic_finished", #"hash_73522d92576b145b", #"fin2_enemy_chopper_destroyed");
    s_spawn = struct::get("s_chopper_spawn", "targetname");
    level.vh_enemy_chopper = spawnvehicle(#"veh_t8_helicopter_gunship_mp", s_spawn.origin, s_spawn.angles, "vh_enemy_chopper");
    level.vh_enemy_chopper setteam(#"axis");
    level.vh_enemy_chopper setrotorspeed(1);
    level.vh_enemy_chopper.overridevehicledamage = &function_b274b737;
    level.vh_enemy_chopper.defaultweapon = getweapon(#"cobra_20mm_comlink");
    level.vh_enemy_chopper makesentient();
    level.vh_enemy_chopper val::set("fin2_ignore", "ignoreall", 1);
    level.vh_enemy_chopper thread function_db1ee4ed(s_spawn);
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 1, eflags: 0x0
// Checksum 0xc297325d, Offset: 0x7da8
// Size: 0x242
function function_db1ee4ed(s_loc) {
    level endon(#"combattraining_logic_finished");
    self endon(#"death");
    e_player = ct_utils::get_player();
    self helicopter::heli_reset();
    self notify(#"stop hover");
    n_speed = 30;
    n_accel = 15;
    var_7cab7ee2 = 20;
    var_bebc0c3a = 30;
    self setspeed(n_speed, n_accel);
    while (isdefined(s_loc.target)) {
        if (!isdefined(s_loc.var_32bac158)) {
            s_loc.var_32bac158 = 0;
        }
        self helicopter::set_goal_pos(s_loc.origin, s_loc.var_32bac158);
        self waittill(#"goal");
        if (isdefined(s_loc.var_32bac158) && s_loc.var_32bac158) {
            var_5d7abed6 = randomintrange(var_7cab7ee2, var_bebc0c3a);
            self thread helicopter::heli_hover();
            self thread function_2ff5e6da(e_player);
            wait(var_5d7abed6);
            self notify(#"hash_621b2a7a6d43cf6c");
        }
        a_s_loc = struct::get_array(s_loc.target, "targetname");
        if (a_s_loc.size > 1) {
            s_loc = array::random(a_s_loc);
        } else {
            s_loc = a_s_loc[0];
        }
    }
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 2, eflags: 0x0
// Checksum 0xcd36b892, Offset: 0x7ff8
// Size: 0x26e
function function_2ff5e6da(e_target, var_847fac28 = 2) {
    level endon(#"combattraining_logic_finished");
    self endon(#"death", #"hash_621b2a7a6d43cf6c");
    if (!isdefined(e_target)) {
        e_target = ct_utils::get_player();
    }
    e_target endon(#"death");
    self.primarytarget = e_target;
    self vehlookat(e_target);
    weaponshoottime = self.defaultweapon.firetime;
    self setvehweapon(self.defaultweapon);
    while (isalive(e_target)) {
        if (self cansee(e_target)) {
            for (i = 0; i < level.heli_turretclipsize / 2; i++) {
                v_offset = function_17786807(192);
                self turretsettarget(0, self.primarytarget, v_offset);
                var_ff52e201 = self ct_utils::is_facing(self.primarytarget, 0.6, 1);
                self setvehweapon(self.defaultweapon);
                if (isdefined(self.primarytarget)) {
                    self turretsettarget(0, self.primarytarget, v_offset);
                    minigun = self fireweapon(0, self.primarytarget);
                } else {
                    minigun = self fireweapon();
                }
                if (i < level.heli_turretclipsize - 1) {
                    wait(weaponshoottime);
                }
            }
        }
        wait(var_847fac28);
    }
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 1, eflags: 0x0
// Checksum 0x11427a60, Offset: 0x8270
// Size: 0x7c
function function_17786807(n_spread = 256) {
    return (randomfloatrange(n_spread * -1, n_spread), randomfloatrange(n_spread * -1, n_spread), randomfloatrange(n_spread * -1, n_spread));
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 15, eflags: 0x0
// Checksum 0x660c3020, Offset: 0x82f8
// Size: 0x12e
function function_b274b737(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal) {
    e_player = ct_utils::get_player();
    wpn_dart = getweapon(#"dart");
    if (weapon === wpn_dart) {
        e_player.dartbda = 3;
        level flag::set("fin2_enemy_chopper_destroyed");
        self thread function_2c254de9();
        return (level.vh_enemy_chopper.health * 2);
    } else {
        return 0;
    }
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 1, eflags: 0x0
// Checksum 0xcbaf04f8, Offset: 0x8430
// Size: 0x5c
function function_2c254de9(var_6e9e34cc = 2) {
    wait(var_6e9e34cc);
    self thread helicopter::function_e1058a3e();
    wait(0.1);
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 11, eflags: 0x0
// Checksum 0xe4127297, Offset: 0x8498
// Size: 0x12a
function overridedamage_player(e_inflictor, e_attacker, n_damage, n_dflags, str_means_of_death, weapon, v_point, v_dir, str_hit_loc, n_psoffsettime, var_8b69d5cf) {
    if (isdefined(self.var_300958a7)) {
        var_d0621c54 = self [[ self.var_300958a7 ]](e_inflictor, e_attacker, n_damage, n_dflags, str_means_of_death, weapon, v_point, v_dir, str_hit_loc, n_psoffsettime, var_8b69d5cf);
    } else {
        var_d0621c54 = n_damage;
    }
    if (isdefined(level.var_8ca3c62) && level.var_8ca3c62 == 9) {
        var_754eb193 = int(var_d0621c54 * 0.25);
    } else {
        var_754eb193 = int(var_d0621c54 / 2);
    }
    return var_754eb193;
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 1, eflags: 0x0
// Checksum 0xb78def9a, Offset: 0x85d0
// Size: 0xbc
function function_b512a9bf(n_slot) {
    var_dee68e3f = [];
    var_dee68e3f[0] = #"eq_seeker_mine";
    var_dee68e3f[2] = #"shock_rifle";
    str_gadget = var_dee68e3f[n_slot];
    if (isinarray(level.var_e72728b8, str_gadget)) {
        arrayremovevalue(level.var_e72728b8, str_gadget);
    }
    self ct_gadgets::function_be6376db(n_slot);
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 1, eflags: 0x0
// Checksum 0xc6a0d01b, Offset: 0x8698
// Size: 0x2ce
function function_9bf1e805(e_player) {
    level endon(#"combattraining_logic_finished");
    self endon(#"death");
    if (e_player.team === #"axis") {
        if (isdefined(level.var_31a4679)) {
            var_d4abfbec = ct_utils::get_player();
            v_to_player = var_d4abfbec.origin - level.var_31a4679.origin;
            ex_elevator_overlight_indicator_ = vectortoangles(v_to_player);
            playfx("player/fx8_plyr_spawn_distortion", level.var_31a4679.origin, anglestoforward(ex_elevator_overlight_indicator_), anglestoup(ex_elevator_overlight_indicator_));
            self.origin = level.var_31a4679.origin;
            self.angles = level.var_31a4679.angles;
        }
    } else {
        e_player.e_seeker_mine = self;
        if (!isdefined(e_player.var_cd23c362)) {
            e_player.var_cd23c362 = [];
        }
        e_player.var_cd23c362[e_player.var_cd23c362.size] = self;
    }
    self.overridevehiclekilled = &function_45b5da97;
    level.var_e0532484 = 0;
    level.e_seeker_mine = self;
    if (isdefined(level.var_8ca3c62)) {
        switch (level.var_8ca3c62) {
        case 1:
            level.e_seeker_mine thread function_a4036130();
            break;
        }
    }
    e_player notify(#"hash_225857690f87699b");
    while (1) {
        if (isdefined(level.var_394c5463) && level.var_394c5463) {
            if (self.var_a5b686b6 > 0) {
                break;
            }
            n_dist = distance(self.origin, level.var_a62b1ae0.origin);
            if (n_dist <= 350) {
                break;
            }
        }
        waitframe(1);
    }
    level.var_394c5463 = 0;
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 0, eflags: 0x0
// Checksum 0x5d621e46, Offset: 0x8970
// Size: 0x7a
function function_a4036130() {
    level endon(#"combattraining_logic_finished");
    self endon(#"death");
    self.var_e19bcce0 = 1;
    self.settings.var_efc15586 = 10000;
    self.settings.var_e0c78652 = 10000;
    self.settings.var_7fa25761 = 10000;
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 15, eflags: 0x0
// Checksum 0x1356809a, Offset: 0x89f8
// Size: 0xa6
function function_8259415c(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal) {
    if (eattacker.team == #"allies") {
        return 0;
    } else {
        return idamage;
    }
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 8, eflags: 0x0
// Checksum 0x8ab8e59a, Offset: 0x8aa8
// Size: 0x8c
function function_45b5da97(einflictor, eattacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime) {
    if (isplayer(einflictor)) {
        level.var_e0532484 = 1;
        self vehicle_ai::set_state("death");
    }
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 0, eflags: 0x0
// Checksum 0xcdbce81a, Offset: 0x8b40
// Size: 0x294
function function_f99e791d() {
    level endon(#"combattraining_logic_finished");
    level.forceusekillstreak = 0;
    ct_utils::function_e44c5b8e(#"dart", 10, 1);
    callback::on_player_killed_with_params(&function_980638c8);
    do {
        if (!(isdefined(level.var_51ff7a58) && level.var_51ff7a58)) {
            level.var_d1f07c87 = 0;
            level.var_58360a73 = 0;
            self thread ct_utils::function_61c3d59c(undefined, undefined, "dynobj_EarnDart");
            self thread ct_utils::function_80bf685b(0);
            self thread ct_vo::function_261ed63c("vox_tvoi_tutor_prop_score_nag", 20, 20);
            self waittill(#"hash_78aff79640650d11");
            self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_prop_score_earn"));
            level.var_51ff7a58 = 1;
        }
        var_92efd918 = self gamepadusedlast() ? #"hash_1188ebb7df5ffca" : #"hash_65f8372f2ae484ca";
        self thread ct_utils::function_61c3d59c(var_92efd918);
        self function_cf621509();
        self function_6ccd49e4();
        self notify(#"dart_done");
        wait(1);
        if (!level flag::get("fin2_enemy_chopper_destroyed") && isalive(self)) {
            ct_utils::function_e44c5b8e(#"dart", 0, 1);
        }
    } while(!level flag::get("fin2_enemy_chopper_destroyed"));
    callback::remove_on_player_killed_with_params(&function_980638c8);
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 0, eflags: 0x0
// Checksum 0x7243d94f, Offset: 0x8de0
// Size: 0xd4
function function_cf621509() {
    level endon(#"combattraining_logic_finished");
    self endon(#"death");
    wpn_dart = getweapon(#"dart");
    do {
        waitframe(1);
        wpn_current = self getcurrentweapon();
        var_9683b25c = wpn_current == wpn_dart;
    } while(!(isdefined(var_9683b25c) && var_9683b25c));
    self thread ct_utils::function_61c3d59c(#"hash_4a88f14d58b70cb6");
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 0, eflags: 0x0
// Checksum 0xab6bcc79, Offset: 0x8ec0
// Size: 0x3fe
function function_6ccd49e4() {
    level endon(#"combattraining_logic_finished", #"hash_34edff5a65a947f1");
    var_3ad4f71e = 90000;
    while (!self attackbuttonpressed()) {
        waitframe(1);
    }
    while (self attackbuttonpressed()) {
        waitframe(1);
    }
    n_start_time = gettime();
    do {
        waitframe(1);
        n_time_passed = (gettime() - n_start_time) / 1000;
        level.e_dart = function_1df31de();
    } while(!isalive(level.e_dart) && n_time_passed <= 2);
    if (isalive(level.e_dart)) {
        if (isalive(level.vh_enemy_chopper)) {
            self thread ct_utils::function_61c3d59c(#"hash_e4a210f32d3e913");
        }
        level thread function_ccc86e88();
        self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_prop_score_active"));
        level.var_7e23f400 = 1;
        do {
            var_b3d2497a = level.e_dart.origin;
            if (isalive(level.vh_enemy_chopper)) {
                n_dist_sq = distancesquared(var_b3d2497a, level.vh_enemy_chopper.origin);
                if (n_dist_sq <= var_3ad4f71e) {
                    self.dartbda = 3;
                    level.e_dart.var_fa2475ae = 1;
                    level.e_dart thread dart::leave_dart();
                }
            }
            waitframe(1);
            var_3c89eb27 = isalive(level.e_dart);
        } while(!(isdefined(level.var_ccf58387) && level.var_ccf58387) && isalive(level.e_dart) && !(isdefined(level.e_dart.var_fa2475ae) && level.e_dart.var_fa2475ae));
        var_334e3d03 = var_b3d2497a - self.origin;
        var_87215549 = vectortoangles(var_334e3d03);
        self setplayerangles(var_87215549);
        if (!level flag::get("fin2_enemy_chopper_destroyed")) {
            self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_prop_score_miss"));
        }
        self ct_utils::function_c2a10fc();
        wait(1);
        if (isdefined(level.e_dart)) {
            level.e_dart delete();
            waitframe(1);
        }
    }
    level.var_7e23f400 = 0;
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 0, eflags: 0x0
// Checksum 0x86a5b6e6, Offset: 0x92c8
// Size: 0xb2
function function_1df31de() {
    level.var_61bbfbd6 = getentarray("dart", "killstreaktype");
    foreach (e_dart in level.var_61bbfbd6) {
        if (isalive(e_dart)) {
            return e_dart;
        }
    }
    return undefined;
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 0, eflags: 0x0
// Checksum 0x334816b, Offset: 0x9388
// Size: 0x52
function function_ccc86e88() {
    level.var_ccf58387 = 0;
    util::waittill_any_ents(level.e_dart, "death", level.e_dart, "veh_collision");
    level.var_ccf58387 = 1;
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 1, eflags: 0x0
// Checksum 0x1ed1890c, Offset: 0x93e8
// Size: 0x284
function function_980638c8(params) {
    level endon(#"fin2_enemy_chopper_destroyed");
    eattacker = params.eattacker;
    weapon = params.weapon;
    if (isplayer(eattacker) && !(isdefined(level.var_51ff7a58) && level.var_51ff7a58)) {
        level notify(#"hash_1dc7d838ff48073d");
        level notify(#"hash_60e26e14a51c5211");
        cost = killstreaks::get_killstreak_momentum_cost(eattacker, #"dart");
        var_23efb519 = level.var_dd8875fe;
        level.var_595e41ee = 50;
        event = #"ekia";
        eventindex = level.scoreinfo[event][#"row"];
        eattacker globallogic_score::giveplayermomentumnotification(level.var_595e41ee, #"hash_480234a872bd64ac", undefined, 0, weapon, 0, eventindex, event, undefined);
        level.var_d1f07c87++;
        if (!eattacker ct_utils::function_a7540094()) {
            eattacker thread ct_utils::function_61c3d59c(undefined, undefined, "dynobj_EarnDart");
        }
        var_a3f2cb34 = level.var_595e41ee * level.var_d1f07c87;
        eattacker thread ct_utils::function_80bf685b(var_a3f2cb34);
        if (!(isdefined(level.var_58360a73) && level.var_58360a73) && level.var_d1f07c87 * level.var_595e41ee >= cost / 2) {
            level.var_58360a73 = 1;
            level thread ct_vo::function_831e0584(array("vox_tvoi_tutor_prop_score_half"));
        }
    }
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 4, eflags: 0x0
// Checksum 0xfc1fdda1, Offset: 0x9678
// Size: 0x244
function function_25bdd976(var_ccd0840c = 1, var_a4339f5b = 1, str_nag, var_23cfda = 0) {
    level notify(#"hash_10578d7b6f8afb23");
    level endon(#"hash_10578d7b6f8afb23", #"combattraining_logic_finished");
    var_71c0232b = 0;
    do {
        while (isalive(level.e_seeker_mine)) {
            if (!isinarray(level.var_e72728b8, #"eq_seeker_mine")) {
                array::add(level.var_e72728b8, #"eq_seeker_mine", 0);
            }
            waitframe(1);
        }
        arrayremovevalue(level.var_e72728b8, #"eq_seeker_mine");
        if (isdefined(var_ccd0840c) && var_ccd0840c) {
            self thread function_b512a9bf(0);
        }
        if (isdefined(str_nag) && (!var_71c0232b || var_23cfda)) {
            var_71c0232b = 1;
            self thread ct_vo::function_261ed63c(str_nag, 20, 20, "nag_give_player_one_seeker_end");
        }
        self waittill(#"hash_225857690f87699b");
        level notify(#"nag_give_player_one_seeker_end");
        array::add(level.var_e72728b8, #"eq_seeker_mine", 0);
        while (!isalive(level.e_seeker_mine)) {
            waitframe(1);
        }
    } while(!(isdefined(var_a4339f5b) && var_a4339f5b));
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 0, eflags: 0x0
// Checksum 0x6078a2c0, Offset: 0x98c8
// Size: 0x19c
function function_74efec9a() {
    level endon(#"combattraining_logic_finished");
    self endon(#"death");
    ct_utils::function_fdfeb384();
    if (isdefined(level.var_8ca3c62)) {
        switch (level.var_8ca3c62) {
        case 1:
            if (isalive(level.var_8c62f9f2)) {
                self thread function_222141a5();
            }
            break;
        case 2:
            self thread function_222141a5();
            break;
        case 7:
            self switchtoweapon(getweapon(#"shock_rifle"));
            break;
        case 8:
            self thread function_222141a5();
            break;
        case 9:
            self thread function_2b6f2238();
            break;
        }
    }
    self perks::perk_setperk(#"specialty_showenemyvehicles");
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 1, eflags: 0x0
// Checksum 0x789548f3, Offset: 0x9a70
// Size: 0x34
function function_222141a5(var_58d9f1c6 = 1) {
    self ct_bots::function_fd2d220e();
}

// Namespace ct_prophet_tutorial/ct_prophet_tutorial
// Params 0, eflags: 0x0
// Checksum 0xfa3ee61a, Offset: 0x9ab0
// Size: 0x370
function function_324c6d8c() {
    /#
        level endon(#"combattraining_logic_finished");
        sessionmode = currentsessionmode();
        setdvar(#"hash_42113ca5668d7812", "vox_tvoi_tutor_prop_seeker_enemy_dead_0");
        if (sessionmode != 4) {
            adddebugcommand("ignoreme");
            adddebugcommand("nag_give_player_one_seeker_end");
            adddebugcommand("<unknown string>");
            adddebugcommand("<unknown string>");
            adddebugcommand("<unknown string>");
            adddebugcommand("<unknown string>");
            adddebugcommand("<unknown string>");
            adddebugcommand("<unknown string>");
        }
        while (1) {
            wait(0.25);
            cmd = getdvarstring(#"hash_42113ca5668d7812", "vox_tvoi_tutor_prop_seeker_enemy_dead_0");
            if (cmd == "vox_tvoi_tutor_prop_seeker_enemy_dead_0") {
                continue;
            }
            e_player = level.players[0];
            switch (cmd) {
            case #"hash_3438e777b263d2c2":
                level.var_94d65b52 = 0;
                break;
            case #"hash_617cd243f40d3ae8":
                level.var_94d65b52 = 1;
                break;
            case #"kill_player":
                e_player dodamage(1000, e_player.origin);
                break;
            case #"kill_seeker":
                if (isalive(level.e_seeker_mine)) {
                    level.e_seeker_mine dodamage(1000, level.e_seeker_mine.origin);
                }
                break;
            case #"restart_tutorial":
                level notify(#"combattraining_logic_finished", {#success:1});
                break;
            case #"hash_71b971bd91ce117a":
                e_player function_ede7a778();
                break;
            case #"hash_71b96fbd91ce0e14":
                e_player function_969b78e1();
                break;
            case #"hash_78981e17bb8d3a9d":
                e_player function_7536db69();
                break;
            }
            setdvar(#"hash_42113ca5668d7812", "vox_tvoi_tutor_prop_seeker_enemy_dead_0");
        }
    #/
}

