// Atian COD Tools GSC decompiler test
#using scripts\zm\zm_orange_trials.gsc;
#using script_37752a01e45812b8;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_bgb_pack.gsc;
#using scripts\zm_common\zm_bgb.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\core_common\player\player_shared.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\abilities\ability_util.gsc;

#namespace zm_orange_water;

// Namespace zm_orange_water/zm_orange_water
// Params 0, eflags: 0x1 linked
// Checksum 0x455ab1b3, Offset: 0x250
// Size: 0x44
function init() {
    init_clientfields();
    zm_player::register_slowdown(#"hash_2f87c75c463e66c3", 0.7, 0.1);
}

// Namespace zm_orange_water/zm_orange_water
// Params 0, eflags: 0x1 linked
// Checksum 0xf604e32d, Offset: 0x2a0
// Size: 0x144
function init_clientfields() {
    clientfield::register("allplayers", "" + #"hash_55543319943057f1", 24000, 1, "int");
    clientfield::register("toplayer", "" + #"hash_5160727729fd57a2", 24000, 1, "int");
    clientfield::register("toplayer", "" + #"hash_13f1aaee7ebf9986", 24000, 2, "int");
    clientfield::register("toplayer", "" + #"hash_603fc9d210bdbc4d", 24000, 1, "int");
    clientfield::register("toplayer", "" + #"hash_67340426cd141891", 24000, 2, "int");
}

// Namespace zm_orange_water/zm_orange_water
// Params 0, eflags: 0x1 linked
// Checksum 0x8968fac3, Offset: 0x3f0
// Size: 0xf4
function main() {
    level.a_e_water = getentarray("e_water", "targetname");
    level.a_s_float_path = struct::get_array("s_float_path", "script_noteworthy");
    level flag::init(#"hash_69a9d00e65ee6c40");
    level flag::init(#"hash_17b882aed4431728");
    level.var_b0a3611a = 0.5;
    level thread zombie_coast_adjust_percent();
    level.zombie_init_done = &zombie_check_riser;
    callback::on_spawned(&function_99ca73e1);
}

// Namespace zm_orange_water/zm_orange_water
// Params 0, eflags: 0x1 linked
// Checksum 0x66525809, Offset: 0x4f0
// Size: 0xb6
function zombie_coast_adjust_percent() {
    level endon(#"end_game");
    while (1) {
        level waittill(#"between_round_over");
        level waittill(#"between_round_over");
        if (level.var_b0a3611a > 0.1) {
            level.var_b0a3611a = level.var_b0a3611a - 0.05;
            if (level.var_b0a3611a <= 0.1) {
                level.var_b0a3611a = 0.1;
                break;
            }
        }
    }
}

// Namespace zm_orange_water/zm_orange_water
// Params 0, eflags: 0x1 linked
// Checksum 0x214e599f, Offset: 0x5b0
// Size: 0x74
function zombie_check_riser() {
    self endon(#"death");
    if (self.in_the_ground === 1) {
        self waittill(#"risen");
    }
    if (!level flag::get(#"hash_17b882aed4431728")) {
        self thread zombie_water_out();
    }
}

// Namespace zm_orange_water/zm_orange_water
// Params 0, eflags: 0x1 linked
// Checksum 0xb5897de0, Offset: 0x630
// Size: 0xbc
function zombie_water_out() {
    self endon(#"death");
    while (1) {
        foreach (e_water in level.a_e_water) {
            if (self istouching(e_water)) {
                self zombie_entered_water();
                return;
            }
        }
        waitframe(1);
    }
}

// Namespace zm_orange_water/zm_orange_water
// Params 0, eflags: 0x1 linked
// Checksum 0x9f8cf239, Offset: 0x6f8
// Size: 0x54
function zombie_entered_water() {
    self endon(#"death");
    self.b_in_water = 1;
    self zombie_water_move_slow();
    self thread zombie_water_in();
}

// Namespace zm_orange_water/zm_orange_water
// Params 0, eflags: 0x1 linked
// Checksum 0xf4c145b3, Offset: 0x758
// Size: 0xc2
function zombie_water_move_slow() {
    switch (self.zombie_move_speed) {
    case #"walk":
        break;
    case #"run":
        self thread zombie_utility::set_zombie_run_cycle("walk");
        break;
    case #"sprint":
        self thread zombie_utility::set_zombie_run_cycle("run");
        break;
    case #"super_sprint":
        self thread zombie_utility::set_zombie_run_cycle("sprint");
        break;
    }
}

// Namespace zm_orange_water/zm_orange_water
// Params 0, eflags: 0x1 linked
// Checksum 0x2cb8b30c, Offset: 0x828
// Size: 0xfc
function zombie_water_in() {
    self endon(#"death");
    while (1) {
        self.b_in_water = 0;
        foreach (e_water in level.a_e_water) {
            if (self istouching(e_water)) {
                self.b_in_water = 1;
                if (!isdefined(self.var_3f789444)) {
                    self thread function_4c6f90cd();
                }
            }
            if (!self.b_in_water) {
                self zombie_exited_water();
                return;
            }
        }
        waitframe(1);
    }
}

// Namespace zm_orange_water/zm_orange_water
// Params 0, eflags: 0x1 linked
// Checksum 0xfcd00e9e, Offset: 0x930
// Size: 0xbe
function function_4c6f90cd() {
    self endon(#"death");
    if (isdefined(self.ignore_water_damage) && self.ignore_water_damage) {
        return;
    }
    self.var_3f789444 = 1;
    wait(2);
    if (self.var_3f789444 === 1) {
        var_baafc291 = level.zombie_health * level.var_b0a3611a;
        if (self.health <= var_baafc291) {
            self.water_damage = 1;
            self dodamage(var_baafc291, self.origin);
        }
        self.var_3f789444 = undefined;
    }
}

// Namespace zm_orange_water/zm_orange_water
// Params 0, eflags: 0x1 linked
// Checksum 0xce326795, Offset: 0x9f8
// Size: 0x54
function zombie_exited_water() {
    self endon(#"death");
    self.b_in_water = 0;
    self.var_3f789444 = undefined;
    self zombie_water_move_normal();
    self thread zombie_water_out();
}

// Namespace zm_orange_water/zm_orange_water
// Params 0, eflags: 0x1 linked
// Checksum 0x5ae222b3, Offset: 0xa58
// Size: 0xba
function zombie_water_move_normal() {
    switch (self.zombie_move_speed) {
    case #"walk":
        self thread zombie_utility::set_zombie_run_cycle("run");
        break;
    case #"run":
        self thread zombie_utility::set_zombie_run_cycle("sprint");
        break;
    case #"sprint":
        self thread zombie_utility::set_zombie_run_cycle("super_sprint");
        break;
    case #"super_sprint":
        break;
    }
}

// Namespace zm_orange_water/zm_orange_water
// Params 0, eflags: 0x1 linked
// Checksum 0xf6e3a9c5, Offset: 0xb20
// Size: 0x44
function function_99ca73e1() {
    /#
        if (getdvarint(#"hash_60464f7ad910bd1a", 0)) {
            return;
        }
    #/
    self thread function_ea0c7ed8();
}

// Namespace zm_orange_water/zm_orange_water
// Params 0, eflags: 0x1 linked
// Checksum 0x8f108788, Offset: 0xb70
// Size: 0x128
function function_ea0c7ed8() {
    self notify("4c2bcc084cb1ca9b");
    self endon("4c2bcc084cb1ca9b");
    level endon(#"end_game", #"freeze_mode");
    self endon(#"death", #"player_frozen");
    while (1) {
        foreach (e_water in level.a_e_water) {
            if (self istouching(e_water) && !self laststand::player_is_in_laststand()) {
                self function_b52931e7();
                return;
            }
        }
        wait(0.1);
    }
}

// Namespace zm_orange_water/zm_orange_water
// Params 0, eflags: 0x1 linked
// Checksum 0x94e977b5, Offset: 0xca0
// Size: 0x1e4
function function_b52931e7() {
    level endon(#"end_game");
    self endon(#"death", #"player_frozen");
    self.b_in_water = 1;
    self notify(#"hash_42fcb8fa7aec0734");
    if (!level flag::get(#"hash_69a9d00e65ee6c40")) {
        self thread function_26a271e6();
        self thread function_6577cacc();
        if (self.var_2e6aa97d === 1) {
            self clientfield::set_to_player("" + #"hash_13f1aaee7ebf9986", 2);
            if (isdefined(self.var_cdce7ec) && self.var_cdce7ec) {
                self allowsprint(0);
            }
        } else {
            self clientfield::set_to_player("" + #"hash_13f1aaee7ebf9986", 1);
            self allowsprint(0);
            if (self issliding()) {
                self setstance("crouch");
            }
            self allowslide(0);
        }
    } else {
        self thread function_121f8a53();
    }
    self thread function_4ab00cab();
}

// Namespace zm_orange_water/zm_orange_water
// Params 0, eflags: 0x1 linked
// Checksum 0x2134f699, Offset: 0xe90
// Size: 0x5c
function function_26a271e6() {
    self endon(#"death", #"hash_668824b34b3076bc");
    wait(5);
    self thread zm_audio::create_and_play_dialog(#"freeze", #"exert");
}

// Namespace zm_orange_water/zm_orange_water
// Params 0, eflags: 0x1 linked
// Checksum 0x6fe319dc, Offset: 0xef8
// Size: 0xfe
function function_4ab00cab() {
    level endon(#"end_game");
    self endon(#"death", #"player_frozen");
    while (1) {
        wait(0.1);
        foreach (e_water in level.a_e_water) {
            if (!self istouching(e_water) || self laststand::player_is_in_laststand()) {
                self thread function_6cf1cc01();
                return;
            }
        }
    }
}

// Namespace zm_orange_water/zm_orange_water
// Params 0, eflags: 0x1 linked
// Checksum 0x232ac3f0, Offset: 0x1000
// Size: 0x134
function function_6cf1cc01() {
    level endon(#"end_game");
    self endon(#"death", #"player_frozen");
    self.b_in_water = 0;
    self notify(#"hash_668824b34b3076bc");
    if (!level flag::get(#"hell_on_earth") && !level flag::get(#"hash_198bc172b5af7f25")) {
        self allowsprint(1);
        self allowslide(1);
        self thread function_d2dd1f2b();
        self clientfield::set_to_player("" + #"hash_13f1aaee7ebf9986", 0);
    }
    self thread function_ea0c7ed8();
}

// Namespace zm_orange_water/zm_orange_water
// Params 0, eflags: 0x1 linked
// Checksum 0x59e3ee54, Offset: 0x1140
// Size: 0x19c
function function_6577cacc() {
    level endon(#"end_game");
    self endon(#"death", #"hash_668824b34b3076bc");
    if (!isdefined(self.var_36a93d1)) {
        self.var_36a93d1 = 0;
    }
    while (1) {
        wait(1);
        self.var_36a93d1++;
        if (self.var_2e6aa97d === 1) {
            var_24e0e73d = 30;
        } else {
            var_24e0e73d = 15;
        }
        if (self.var_36a93d1 >= int(var_24e0e73d * 0.5)) {
            self thread zm_audio::create_and_play_dialog(#"freeze", #"start");
        }
        if (self.var_36a93d1 >= var_24e0e73d) {
            waitframe(1);
            if (self zm_zonemgr::get_player_zone() === "underwater_tunnel") {
                self thread function_34e1762b();
            } else {
                self thread water_player_freeze();
                self thread zm_audio::create_and_play_dialog(#"freeze", #"frozen");
            }
            self.var_36a93d1 = 0;
            return;
        }
    }
}

// Namespace zm_orange_water/zm_orange_water
// Params 0, eflags: 0x1 linked
// Checksum 0x931274cd, Offset: 0x12e8
// Size: 0x76
function function_121f8a53() {
    level endon(#"end_game");
    self endon(#"death", #"hash_668824b34b3076bc");
    while (1) {
        self dodamage(20, self.origin);
        wait(1);
    }
}

// Namespace zm_orange_water/zm_orange_water
// Params 0, eflags: 0x1 linked
// Checksum 0x2ad387e7, Offset: 0x1368
// Size: 0x9c
function function_d2dd1f2b() {
    level endon(#"end_game");
    self endon(#"death", #"hash_42fcb8fa7aec0734");
    if (!isdefined(self.var_36a93d1) || self.var_36a93d1 == 0) {
        return;
    }
    while (1) {
        wait(1);
        self.var_36a93d1--;
        if (self.var_36a93d1 <= 0) {
            self.var_36a93d1 = 0;
            return;
        }
    }
}

// Namespace zm_orange_water/zm_orange_water
// Params 0, eflags: 0x1 linked
// Checksum 0xd43cb4cb, Offset: 0x1410
// Size: 0x364
function water_player_freeze() {
    self endoncallback(&function_c64292f, #"death");
    self.var_7dc2d507 = 1;
    self notify(#"player_frozen");
    self namespace_565e073b::function_3931c78();
    self function_bad6907c();
    self clientfield::set("" + #"hash_55543319943057f1", 1);
    self clientfield::set_to_player("" + #"hash_5160727729fd57a2", 1);
    t_ice = spawn("trigger_damage", self.origin, 0, 15, 72);
    t_ice enablelinkto();
    t_ice linkto(self);
    self.t_ice = t_ice;
    self thread function_872ec0b2(t_ice);
    if (isbot(self)) {
        self thread function_8eb7b0f7();
    } else {
        self thread function_6cadbaff();
    }
    if (self.var_d844486 !== 1) {
        self thread zm_equipment::show_hint_text(#"hash_4b6950ec49c7e04c", 3);
        self.var_d844486 = 1;
    }
    self waittill(#"hash_53bfad7081c69dee");
    self playsound(#"hash_2f8c9575cb36a298");
    self.var_7dc2d507 = 0;
    self function_46c3bbf7();
    self clientfield::set("" + #"hash_55543319943057f1", 0);
    self clientfield::set_to_player("" + #"hash_5160727729fd57a2", 0);
    self clientfield::set_to_player("" + #"hash_603fc9d210bdbc4d", 1);
    waitframe(2);
    self clientfield::set_to_player("" + #"hash_603fc9d210bdbc4d", 0);
    if (isdefined(t_ice)) {
        t_ice delete();
        self.t_ice = undefined;
    }
    self clientfield::set_to_player("" + #"hash_13f1aaee7ebf9986", 0);
    waitframe(2);
    self thread function_ea0c7ed8();
}

// Namespace zm_orange_water/zm_orange_water
// Params 1, eflags: 0x1 linked
// Checksum 0x1fcb061a, Offset: 0x1780
// Size: 0x74
function function_c64292f(str_notify) {
    if (isdefined(self) && isdefined(self.t_ice)) {
        self.t_ice delete();
        self.t_ice = undefined;
    }
    if (isdefined(self) && isdefined(self.e_tag)) {
        self.e_tag delete();
    }
}

// Namespace zm_orange_water/zm_orange_water
// Params 0, eflags: 0x1 linked
// Checksum 0x9bd02fc2, Offset: 0x1800
// Size: 0x444
function function_bad6907c() {
    self endoncallback(&function_26234f4c, #"disconnect");
    if (self isusingoffhand()) {
        self forceoffhandend();
    }
    self disableoffhandspecial();
    self disableoffhandweapons();
    self allowmelee(0);
    w_current = self getcurrentweapon();
    if (zm_loadout::is_placeable_mine(w_current) || zm_equipment::is_equipment(w_current) || ability_util::is_weapon_gadget(w_current) || ability_util::is_hero_weapon(w_current)) {
        var_2e07b8ff = self getweaponslistprimaries();
        if (isdefined(var_2e07b8ff) && var_2e07b8ff.size > 0) {
            self switchtoweapon(var_2e07b8ff[0], 1);
            var_5a7831c4 = 0;
            while (!var_5a7831c4) {
                waitframe(1);
                w_current = self getcurrentweapon();
                if (w_current == var_2e07b8ff[0]) {
                    var_5a7831c4 = 1;
                }
            }
        }
    }
    foreach (weapon in self getweaponslist(1)) {
        self function_28602a03(weapon, 1, 0);
        if (weapon.dualwieldweapon != level.weaponnone) {
            self function_28602a03(weapon.dualwieldweapon, 1, 0);
        }
    }
    self.e_tag = util::spawn_model("tag_origin", self.origin, self.angles);
    self playerlinktoabsolute(self.e_tag, "tag_origin");
    self allowjump(0);
    self allowsprint(0);
    self player::allow_stance_change(0);
    self allowads(0);
    self thread function_67981637();
    self bgb::suspend_weapon_cycling();
    self disableweaponcycling();
    self bgb_pack::function_ac9cb612(1);
    self.var_be3224e6 = 1;
    if (isdefined(level.var_526d919)) {
        w_current = self getcurrentweapon();
        if (isdefined(level.var_526d919[w_current.name])) {
            self allowmelee(1);
        } else {
            self allowmelee(0);
        }
    } else {
        self allowmelee(1);
    }
}

// Namespace zm_orange_water/zm_orange_water
// Params 0, eflags: 0x1 linked
// Checksum 0xc0f6c02c, Offset: 0x1c50
// Size: 0x56
function function_67981637() {
    self endon(#"death");
    while (self.var_7dc2d507) {
        self shellshock(#"slowview", 1.1);
        wait(1);
    }
}

// Namespace zm_orange_water/zm_orange_water
// Params 0, eflags: 0x1 linked
// Checksum 0x1bccd4a, Offset: 0x1cb0
// Size: 0x244
function function_46c3bbf7() {
    self endoncallback(&function_26234f4c, #"disconnect");
    if (zm_utility::is_trials()) {
        self zm_orange_trials::function_b4bd25ef();
    } else {
        self enableoffhandspecial();
        self enableoffhandweapons();
        foreach (weapon in self getweaponslist(1)) {
            self unlockweapon(weapon);
            if (weapon.dualwieldweapon != level.weaponnone) {
                self unlockweapon(weapon.dualwieldweapon);
            }
        }
    }
    self bgb_pack::function_ac9cb612(0);
    self.var_be3224e6 = 0;
    self bgb::resume_weapon_cycling();
    self enableweaponcycling();
    self stopshellshock();
    self allowjump(1);
    self allowsprint(1);
    self player::allow_stance_change(1);
    self allowads(1);
    self unlink();
    if (isdefined(self.e_tag)) {
        self.e_tag delete();
    }
}

// Namespace zm_orange_water/zm_orange_water
// Params 1, eflags: 0x1 linked
// Checksum 0xd2f546f5, Offset: 0x1f00
// Size: 0x3c
function function_26234f4c(str_notify) {
    if (isdefined(self) && isdefined(self.e_tag)) {
        self.e_tag delete();
    }
}

// Namespace zm_orange_water/zm_orange_water
// Params 1, eflags: 0x1 linked
// Checksum 0x47142a5e, Offset: 0x1f48
// Size: 0x92
function function_872ec0b2(t_ice) {
    self endon(#"death", #"hash_53bfad7081c69dee");
    while (1) {
        s_notify = undefined;
        s_notify = t_ice waittill(#"damage");
        if (s_notify.attacker === self) {
            continue;
        } else {
            self notify(#"hash_53bfad7081c69dee");
        }
    }
}

// Namespace zm_orange_water/zm_orange_water
// Params 0, eflags: 0x1 linked
// Checksum 0x2addec94, Offset: 0x1fe8
// Size: 0x266
function function_6cadbaff() {
    self endon(#"death", #"hash_53bfad7081c69dee");
    if (level flag::get(#"break_freeze_faster")) {
        self waittill(#"weapon_melee", #"weapon_melee_power");
        self playrumbleonentity("damage_heavy");
        self clientfield::set_to_player("" + #"hash_67340426cd141891", 0);
        self notify(#"hash_53bfad7081c69dee");
    } else {
        self waittill(#"weapon_melee", #"weapon_melee_power");
        self playrumbleonentity("damage_light");
        self clientfield::set_to_player("" + #"hash_67340426cd141891", 2);
        self playsound(#"hash_1a3cd046cb0b437f");
        self waittill(#"weapon_melee", #"weapon_melee_power");
        self playrumbleonentity("damage_light");
        self clientfield::set_to_player("" + #"hash_67340426cd141891", 1);
        self playsound(#"hash_1a3cd146cb0b4532");
        self waittill(#"weapon_melee", #"weapon_melee_power");
        self playrumbleonentity("damage_heavy");
        self clientfield::set_to_player("" + #"hash_67340426cd141891", 0);
        self notify(#"hash_53bfad7081c69dee");
    }
}

// Namespace zm_orange_water/zm_orange_water
// Params 0, eflags: 0x1 linked
// Checksum 0xb4ecf619, Offset: 0x2258
// Size: 0xd6
function function_8eb7b0f7() {
    self endon(#"death", #"hash_53bfad7081c69dee");
    if (level flag::get(#"break_freeze_faster")) {
        wait(3);
        self clientfield::set_to_player("" + #"hash_67340426cd141891", 0);
        self notify(#"hash_53bfad7081c69dee");
    } else {
        wait(5);
        self clientfield::set_to_player("" + #"hash_67340426cd141891", 0);
        self notify(#"hash_53bfad7081c69dee");
    }
}

// Namespace zm_orange_water/zm_orange_water
// Params 0, eflags: 0x0
// Checksum 0x1f15eb2f, Offset: 0x2338
// Size: 0x54
function function_142c254b() {
    self.var_1ed2984a = 1;
    self dodamage(50, self.origin, undefined, undefined, undefined, "MOD_BURNED");
    self thread function_e8485ac0();
}

// Namespace zm_orange_water/zm_orange_water
// Params 0, eflags: 0x1 linked
// Checksum 0x2ac56261, Offset: 0x2398
// Size: 0x68
function function_e8485ac0() {
    self endon(#"death");
    n_counter = 0;
    while (1) {
        wait(0.1);
        n_counter = n_counter + 0.1;
        if (n_counter >= 1) {
            self.var_1ed2984a = 0;
            return;
        }
    }
}

// Namespace zm_orange_water/zm_orange_water
// Params 0, eflags: 0x1 linked
// Checksum 0x96b35092, Offset: 0x2408
// Size: 0x2fc
function function_34e1762b() {
    self endoncallback(&function_f0339fd, #"death");
    self.var_7dc2d507 = 1;
    self notify(#"player_frozen");
    self function_e22d95bc();
    self clientfield::set("" + #"hash_55543319943057f1", 1);
    self clientfield::set_to_player("" + #"hash_5160727729fd57a2", 1);
    self function_615d3be0();
    self function_d793c8ff();
    self function_bad6907c();
    t_ice = spawn("trigger_damage", self.origin, 0, 15, 72);
    t_ice enablelinkto();
    t_ice linkto(self);
    self.t_ice = t_ice;
    self thread function_872ec0b2(t_ice);
    self thread function_6cadbaff();
    self waittill(#"hash_53bfad7081c69dee");
    self.var_7dc2d507 = 0;
    self function_46c3bbf7();
    self clientfield::set("" + #"hash_55543319943057f1", 0);
    self clientfield::set_to_player("" + #"hash_5160727729fd57a2", 0);
    self clientfield::set_to_player("" + #"hash_603fc9d210bdbc4d", 1);
    waitframe(2);
    self clientfield::set_to_player("" + #"hash_603fc9d210bdbc4d", 0);
    if (isdefined(t_ice)) {
        t_ice delete();
        self.t_ice = undefined;
    }
    self clientfield::set_to_player("" + #"hash_13f1aaee7ebf9986", 0);
    waitframe(2);
    self thread function_ea0c7ed8();
}

// Namespace zm_orange_water/zm_orange_water
// Params 1, eflags: 0x1 linked
// Checksum 0x1c912a2f, Offset: 0x2710
// Size: 0x74
function function_f0339fd(str_notify) {
    if (isdefined(self) && isdefined(self.t_ice)) {
        self.t_ice delete();
        self.t_ice = undefined;
    }
    if (isdefined(self) && isdefined(self.e_tag)) {
        self.e_tag delete();
    }
}

// Namespace zm_orange_water/zm_orange_water
// Params 0, eflags: 0x1 linked
// Checksum 0x869ee3b8, Offset: 0x2790
// Size: 0x194
function function_e22d95bc() {
    self endoncallback(&function_26234f4c, #"disconnect");
    self val::set(#"fasttravel", "freezecontrols", 1);
    self val::set(#"fasttravel", "ignoreme", 1);
    if (!self laststand::player_is_in_laststand()) {
        str_stance = self getstance();
        switch (str_stance) {
        case #"crouch":
            self setstance("stand");
            wait(0.2);
            break;
        case #"prone":
            self setstance("stand");
            wait(1);
            break;
        }
    }
    self.e_tag = util::spawn_model("tag_origin", self.origin, self.angles);
    self playerlinktoabsolute(self.e_tag, "tag_origin");
}

// Namespace zm_orange_water/zm_orange_water
// Params 0, eflags: 0x1 linked
// Checksum 0xd747103, Offset: 0x2930
// Size: 0xec
function function_d793c8ff() {
    self endoncallback(&function_d92c3acf, #"disconnect");
    self val::set(#"fasttravel", "freezecontrols", 0);
    self val::set(#"fasttravel", "takedamage", 1);
    self val::set(#"fasttravel", "ignoreme", 0);
    self unlink();
    if (isdefined(self.e_tag)) {
        self.e_tag delete();
    }
}

// Namespace zm_orange_water/zm_orange_water
// Params 1, eflags: 0x1 linked
// Checksum 0xf1a23345, Offset: 0x2a28
// Size: 0x3c
function function_d92c3acf(str_notify) {
    if (isdefined(self) && isdefined(self.e_tag)) {
        self.e_tag delete();
    }
}

// Namespace zm_orange_water/zm_orange_water
// Params 0, eflags: 0x1 linked
// Checksum 0x39ddde8a, Offset: 0x2a70
// Size: 0x108
function function_615d3be0() {
    level endon(#"end_game");
    a_s_float_path = array::get_all_closest(self.origin, level.a_s_float_path);
    var_98698d94 = a_s_float_path[0];
    while (1) {
        var_7c1bf084 = self function_e2d41c8d(var_98698d94);
        self.e_tag moveto(var_98698d94.origin, var_7c1bf084);
        self.e_tag waittill(#"movedone");
        if (isdefined(var_98698d94.target)) {
            var_98698d94 = struct::get(var_98698d94.target, "targetname");
        } else {
            return;
        }
    }
}

// Namespace zm_orange_water/zm_orange_water
// Params 1, eflags: 0x1 linked
// Checksum 0xf7c15682, Offset: 0x2b80
// Size: 0x58
function function_e2d41c8d(s_start) {
    var_96e16c65 = distance(self.origin, s_start.origin);
    var_7ddd94c0 = var_96e16c65 / 100;
    return 0.5 * var_7ddd94c0;
}

// Namespace zm_orange_water/zm_orange_water
// Params 1, eflags: 0x0
// Checksum 0x2cf50a01, Offset: 0x2be0
// Size: 0xc8
function water_debug_hud_elem_thread(player) {
    /#
        player endon(#"death");
        self thread update_hud_elem(player);
        while (1) {
            if (isdefined(player.b_in_water)) {
                self setvalue(player.b_in_water);
                println("<unknown string>" + player getentitynumber() + "<unknown string>");
            }
            player waittill(#"update_frost_state");
        }
    #/
}

// Namespace zm_orange_water/zm_orange_water
// Params 1, eflags: 0x0
// Checksum 0xe59ce9c8, Offset: 0x2cb0
// Size: 0x4c
function update_hud_elem(player) {
    /#
        player endon(#"death");
        while (1) {
            wait(0.1);
            player notify(#"update_frost_state");
        }
    #/
}

