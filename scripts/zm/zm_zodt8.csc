// Atian COD Tools GSC decompiler test
#using scripts\zm\weapons\zm_weap_riotshield.csc;
#using script_54a67b7ed7b385e6;
#using scripts\zm\zm_zodt8_tutorial.csc;
#using script_5504fe574aed77a8;
#using scripts\zm\zm_zodt8_sentinel_trial.csc;
#using scripts\zm\zm_zodt8_pap_quest.csc;
#using script_2a907fffc74a075d;
#using scripts\zm\zm_zodt8_eye.csc;
#using scripts\zm\zm_zodt8_sound.csc;
#using scripts\zm\powerup\zm_powerup_free_perk.csc;
#using scripts\zm\zm_zodt8_gamemodes.csc;
#using scripts\zm_common\zm_characters.csc;
#using scripts\zm_common\zm_weapons.csc;
#using scripts\zm_common\zm_utility.csc;
#using scripts\zm_common\zm_pack_a_punch.csc;
#using scripts\zm_common\zm_fasttravel.csc;
#using scripts\zm_common\zm_audio_sq.csc;
#using scripts\zm_common\zm.csc;
#using scripts\zm_common\load.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\scene_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\audio_shared.csc;

#namespace zm_zodt8;

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x2
// Checksum 0x7119845e, Offset: 0x640
// Size: 0x32
function autoexec opt_in() {
    level.aat_in_use = 1;
    level.bgb_in_use = 1;
    level.clientfieldaicheck = 1;
}

// Namespace zm_zodt8/level_init
// Params 1, eflags: 0x40
// Checksum 0xfd01dcbd, Offset: 0x680
// Size: 0x864
function event_handler[level_init] main(eventstruct) {
    clientfield::register("clientuimodel", "player_lives", 1, 2, "int", undefined, 0, 0);
    clientfield::register("vehicle", "pap_projectile_fx", 1, 1, "int", &pap_projectile_fx, 0, 0);
    clientfield::register("vehicle", "pap_projectile_end_fx", 1, 1, "counter", &pap_projectile_end_fx, 0, 0);
    clientfield::register("world", "narrative_trigger", 1, 1, "int", &function_94a217a5, 0, 0);
    clientfield::register("world", "sfx_waterdrain_fore", 1, 1, "int", &sfx_waterdrain_fore, 0, 0);
    clientfield::register("world", "sfx_waterdrain_aft", 1, 1, "int", &sfx_waterdrain_aft, 0, 0);
    clientfield::register("world", "" + #"hash_2994a957c49bf321", 1, 1, "int", &function_f31c22d6, 0, 0);
    clientfield::register("world", "" + #"hash_7e91637e80ad93", 1, 1, "int", &function_1e917f6a, 0, 0);
    clientfield::register("world", "" + #"hash_16cc25b3f87f06ad", 1, 1, "int", &function_53da552d, 0, 0);
    clientfield::register("world", "" + #"hash_7f2f74f05d1f1b75", 1, 2, "int", &function_5b0384a, 0, 0);
    clientfield::register("scriptmover", "tilt", 1, 1, "int", &tilt, 0, 0);
    clientfield::register("scriptmover", "change_wave_water_height", 1, 1, "int", &change_wave_water_height, 0, 0);
    clientfield::register("scriptmover", "update_wave_water_height", 1, 1, "counter", &update_wave_water_height, 0, 0);
    clientfield::register("scriptmover", "activate_sentinel_artifact", 1, 2, "int", &sentinel_artifact_activated, 0, 0);
    clientfield::register("scriptmover", "ocean_water", 1, 1, "int", &function_b7fc06b2, 0, 0);
    clientfield::register("toplayer", "water_splashies", 1, 1, "counter", &water_splashies, 0, 0);
    clientfield::register("toplayer", "water_drippies", 1, 1, "int", &water_drippies, 0, 0);
    clientfield::register("actor", "sndActorUnderwater", 1, 1, "int", &sndactorunderwater, 0, 1);
    setdvar(#"player_shallowwaterwadescale", 1);
    setdvar(#"player_waistwaterwadescale", 1);
    setdvar(#"player_deepwaterwadescale", 1);
    level._effect[#"headshot"] = #"zombie/fx_bul_flesh_head_fatal_zmb";
    level._effect[#"headshot_nochunks"] = #"zombie/fx_bul_flesh_head_nochunks_zmb";
    level._effect[#"bloodspurt"] = #"zombie/fx_bul_flesh_neck_spurt_zmb";
    level._effect[#"animscript_gib_fx"] = #"zombie/fx_blood_torso_explo_zmb";
    level._effect[#"animscript_gibtrail_fx"] = #"blood/fx_blood_gib_limb_trail";
    level._effect[#"pap_projectile"] = #"hash_6009053e911b946a";
    level._effect[#"pap_projectile_end"] = #"hash_6c0eb029adb5f6c6";
    level.var_24cb6ae8 = findvolumedecalindexarray("cargo_hold_water_puddles");
    level.var_ec4c3b67 = findvolumedecalindexarray("engine_room_water_puddles");
    level.var_59d3631c = #"hash_129339f4a4da8ea2";
    level.var_d0ab70a2 = #"gamedata/weapons/zm/zm_zodt8_weapons.csv";
    zodt8_pap_quest::init();
    zodt8_sentinel::init();
    namespace_4a807bff::init();
    namespace_b45e3f05::init();
    namespace_57873b62::init();
    zm_audio_sq::init();
    load::main();
    init_water();
    init_flags();
    zm_zodt8_sound::main();
    level thread setup_personality_character_exerts();
    callback::on_localplayer_spawned(&on_localplayer_spawned);
}

// Namespace zm_zodt8/zm_zodt8
// Params 1, eflags: 0x1 linked
// Checksum 0x85b54e1f, Offset: 0xef0
// Size: 0xdc
function on_localplayer_spawned(localclientnum) {
    e_localplayer = function_5c10bd79(localclientnum);
    e_localplayer function_24f8e5f9();
    var_630fc8b = e_localplayer isplayerswimmingunderwater();
    e_localplayer function_33eae096(localclientnum, var_630fc8b);
    if (function_65b9eb0f(localclientnum)) {
        e_localplayer thread function_2dca9b5b(localclientnum, var_630fc8b);
        return;
    }
    e_localplayer thread function_efae9657(localclientnum, var_630fc8b);
}

// Namespace zm_zodt8/zm_zodt8
// Params 2, eflags: 0x1 linked
// Checksum 0xc498bd49, Offset: 0xfd8
// Size: 0xf4
function function_2dca9b5b(localclientnum, var_630fc8b) {
    level endon(#"game_ended");
    self endoncallback(&function_853e8354, #"death");
    b_underwater = var_630fc8b;
    while (isalive(self)) {
        if (self isplayerswimmingunderwater()) {
            if (!b_underwater) {
                self function_33eae096(localclientnum, 1);
                b_underwater = 1;
            }
        } else if (b_underwater) {
            self function_33eae096(localclientnum, 0);
            b_underwater = 0;
        }
        waitframe(1);
    }
}

// Namespace zm_zodt8/zm_zodt8
// Params 2, eflags: 0x1 linked
// Checksum 0x625f15df, Offset: 0x10d8
// Size: 0x230
function function_efae9657(localclientnum, var_630fc8b) {
    self notify("505c3419935f4f3e");
    self endon("505c3419935f4f3e");
    level endon(#"game_ended");
    self endoncallback(&function_853e8354, #"death");
    b_underwater = var_630fc8b;
    if (isalive(self)) {
        var_8eeea2b6 = postfx::function_556665f2(#"hash_5249b3ef8b2f1988");
        if (b_underwater) {
            setpbgactivebank(localclientnum, 2);
            if (!var_8eeea2b6) {
                self thread postfx::playpostfxbundle(#"hash_5249b3ef8b2f1988");
            }
        } else {
            if (self clientfield::get_to_player("" + #"boiler_fx")) {
                setpbgactivebank(localclientnum, 4);
            } else {
                setpbgactivebank(localclientnum, 1);
            }
            if (var_8eeea2b6) {
                self thread postfx::stoppostfxbundle(#"hash_5249b3ef8b2f1988");
            }
        }
    }
    while (isalive(self)) {
        if (b_underwater) {
            self waittill(#"underwater_end");
            self function_33eae096(localclientnum, 0);
            b_underwater = 0;
            continue;
        }
        self waittill(#"underwater_begin");
        self function_33eae096(localclientnum, 1);
        b_underwater = 1;
    }
}

// Namespace zm_zodt8/zm_zodt8
// Params 2, eflags: 0x1 linked
// Checksum 0x6cb745b7, Offset: 0x1310
// Size: 0x14c
function function_33eae096(localclientnum, b_underwater) {
    if (b_underwater) {
        setpbgactivebank(localclientnum, 2);
        self thread postfx::playpostfxbundle(#"hash_5249b3ef8b2f1988");
        setsoundcontext("water_global", "under");
        self thread function_3353845b(localclientnum);
        return;
    }
    self notify(#"hash_32c7af154e6c4ded");
    if (self clientfield::get_to_player("" + #"boiler_fx")) {
        setpbgactivebank(localclientnum, 4);
    } else {
        setpbgactivebank(localclientnum, 1);
    }
    self thread postfx::stoppostfxbundle(#"hash_5249b3ef8b2f1988");
    setsoundcontext("water_global", "over");
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0x4848ac47, Offset: 0x1468
// Size: 0x292
function function_24f8e5f9() {
    self.var_655d9e4b = 0;
    self.var_25e6f383 = 0;
    self.var_e95193b8 = [];
    self.var_e95193b8[0] = array(#"hash_505479d5e2f48a6", #"hash_505489d5e2f4a59", #"hash_505459d5e2f4540", #"hash_505469d5e2f46f3", #"hash_5054b9d5e2f4f72", #"hash_5054c9d5e2f5125", #"hash_505499d5e2f4c0c", #"hash_5054a9d5e2f4dbf", #"hash_5054f9d5e2f563e", #"hash_505509d5e2f57f1", #"hash_3744cc670a5b706b");
    self.var_e95193b8[1] = array(#"hash_3ecc851af829fe68", #"hash_3ecc861af82a001b", #"hash_3ecc871af82a01ce", #"hash_3ecc881af82a0381", #"hash_3ecc891af82a0534", #"hash_3ecc8a1af82a06e7", #"hash_3ecc8b1af82a089a", #"hash_3ecc8c1af82a0a4d", #"hash_3ecc7d1af829f0d0", #"hash_3ecc7e1af829f283", #"hash_5f880ad3af5e4911");
    self.var_e95193b8[2] = array(#"hash_5edf278d3c3f5192", #"hash_5edf288d3c3f5345", #"hash_5edf258d3c3f4e2c", #"hash_5edf268d3c3f4fdf", #"hash_5edf238d3c3f4ac6", #"hash_5edf248d3c3f4c79", #"hash_5edf218d3c3f4760", #"hash_5edf228d3c3f4913", #"hash_5edf2f8d3c3f5f2a", #"hash_5edf308d3c3f60dd", #"hash_74855cfd5f9acfcf");
}

// Namespace zm_zodt8/zm_zodt8
// Params 1, eflags: 0x1 linked
// Checksum 0xee635593, Offset: 0x1708
// Size: 0x174
function function_3353845b(localclientnum) {
    level endon(#"game_ended");
    self endoncallback(&function_853e8354, #"death");
    self endon(#"hash_32c7af154e6c4ded");
    n_waittime = 5;
    var_d82f94cd = int(180 * 1000);
    n_chance = 3;
    if (self.var_25e6f383 > 10) {
        return;
    }
    while (true) {
        wait(n_waittime);
        if (n_chance >= randomint(100)) {
            if (self.var_655d9e4b === 0 || gettime() - var_d82f94cd >= self.var_655d9e4b) {
                self playsound(localclientnum, self.var_e95193b8[randomintrangeinclusive(0, 2)][self.var_25e6f383]);
                self.var_655d9e4b = gettime();
                self.var_25e6f383++;
                if (self.var_25e6f383 > 10) {
                    return;
                }
            }
        }
    }
}

// Namespace zm_zodt8/zm_zodt8
// Params 1, eflags: 0x1 linked
// Checksum 0x621dd113, Offset: 0x1888
// Size: 0x2c
function function_853e8354(str_notify) {
    self thread postfx::stoppostfxbundle(#"hash_5249b3ef8b2f1988");
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0xff34ad4e, Offset: 0x18c0
// Size: 0x24
function init_flags() {
    level flag::init(#"hash_13dc8f128d50bada");
}

// Namespace zm_zodt8/zm_zodt8
// Params 7, eflags: 0x1 linked
// Checksum 0x4f2bf3ca, Offset: 0x18f0
// Size: 0x16a
function function_5b0384a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    switch (newval) {
    case 0:
        level scene::stop(#"p8_fxanim_zm_zod_cargo_hold_net_bundle", 1);
        level scene::delete_scene_spawned_ents(localclientnum, #"p8_fxanim_zm_zod_cargo_hold_net_bundle");
        break;
    case 1:
        level thread scene::init(#"p8_fxanim_zm_zod_cargo_hold_net_bundle");
        break;
    case 2:
        level thread scene::play(#"p8_fxanim_zm_zod_cargo_hold_net_bundle", "Shot 2");
        break;
    case 3:
        level thread scene::play(#"p8_fxanim_zm_zod_cargo_hold_net_bundle", "Shot 3");
        break;
    }
}

// Namespace zm_zodt8/zm_zodt8
// Params 7, eflags: 0x1 linked
// Checksum 0x945ef126, Offset: 0x1a68
// Size: 0x9c
function function_53da552d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    var_a1b31107 = #"hash_d3b7cb6eb2177fb";
    ww_base = getweapon(#"ww_tricannon_t8");
    addzombieboxweapon(ww_base, var_a1b31107, 0);
}

// Namespace zm_zodt8/zm_zodt8
// Params 7, eflags: 0x1 linked
// Checksum 0x5c363ee6, Offset: 0x1b10
// Size: 0x84
function function_94a217a5(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        function_a5777754(localclientnum, "bunk_room");
        return;
    }
    function_73b1f242(localclientnum, "bunk_room");
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0xf53a68f5, Offset: 0x1ba0
// Size: 0x74
function init_water() {
    setdvar(#"phys_buoyancy", 1);
    setdvar(#"hash_7016ead6b3c7a246", 1);
    elmids("e_wave_water_mid", 3);
}

// Namespace zm_zodt8/zm_zodt8
// Params 7, eflags: 0x1 linked
// Checksum 0xe17c01fe, Offset: 0x1c20
// Size: 0x138
function function_f31c22d6(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejum) {
    if (newval) {
        foreach (index in level.var_24cb6ae8) {
            hidevolumedecal(index);
        }
        return;
    }
    foreach (index in level.var_24cb6ae8) {
        unhidevolumedecal(index);
    }
}

// Namespace zm_zodt8/zm_zodt8
// Params 7, eflags: 0x1 linked
// Checksum 0x85e4869f, Offset: 0x1d60
// Size: 0x138
function function_1e917f6a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejum) {
    if (newval) {
        foreach (index in level.var_ec4c3b67) {
            hidevolumedecal(index);
        }
        return;
    }
    foreach (index in level.var_ec4c3b67) {
        unhidevolumedecal(index);
    }
}

// Namespace zm_zodt8/zm_zodt8
// Params 7, eflags: 0x1 linked
// Checksum 0xca9ea6f9, Offset: 0x1ea0
// Size: 0x17c
function update_wave_water_height(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejum) {
    player = function_5c10bd79(localclientnum);
    player endon(#"death");
    player util::waittill_dobj(localclientnum);
    if (!self flag::exists("update_water")) {
        self flag::init("update_water");
    }
    if (self flag::get("update_water")) {
        self thread update_wave_water(localclientnum);
        return;
    }
    var_b965688c = function_67b634e6(self.origin);
    setwavewaterheight(var_b965688c, self.origin[2]);
    elmids(var_b965688c, self.angles[2] * -1);
}

// Namespace zm_zodt8/zm_zodt8
// Params 7, eflags: 0x1 linked
// Checksum 0xff167e3e, Offset: 0x2028
// Size: 0x18c
function change_wave_water_height(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejum) {
    level endon(#"demo_jump");
    if (newval) {
        if (!self flag::exists("update_water")) {
            self flag::init("update_water");
        }
        self flag::set("update_water");
        if (!self flag::exists("water_drained")) {
            self flag::init("water_drained");
        }
        self update_wave_water(localclientnum);
        if (!self flag::get("water_drained")) {
            self flag::set("water_drained");
        } else {
            self flag::clear("water_drained");
        }
        return;
    }
    self flag::clear("update_water");
}

// Namespace zm_zodt8/zm_zodt8
// Params 1, eflags: 0x1 linked
// Checksum 0x16ab2ebe, Offset: 0x21c0
// Size: 0x13c
function update_wave_water(localclientnum) {
    self notify("318e077d5d5c0461");
    self endon("318e077d5d5c0461");
    level endon(#"end_game");
    var_b965688c = function_67b634e6(self.origin);
    if (!self flag::get("water_drained")) {
        function_c1129a39(var_b965688c, (0, 0, -1), 30);
    }
    while (isdefined(self) && self flag::get("update_water")) {
        setwavewaterheight(var_b965688c, self.origin[2]);
        elmids(var_b965688c, self.angles[2] * -1);
        waitframe(1);
    }
    function_c1129a39(var_b965688c, (0, 0, 0), 0);
}

// Namespace zm_zodt8/zm_zodt8
// Params 7, eflags: 0x1 linked
// Checksum 0xa1000cc6, Offset: 0x2308
// Size: 0x1a4
function tilt(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self notify("17ae9b8c780a6d06");
    self endon("17ae9b8c780a6d06");
    if (newval) {
        while (isdefined(self) && isdefined(self.angles)) {
            self set_gravity(5);
            n_pitch = self.angles[0];
            n_yaw = self.angles[1];
            n_roll = self.angles[2];
            function_bc159e32(localclientnum, n_pitch);
            function_ca443a8f(localclientnum, -1 * n_roll);
            function_1862912(localclientnum, -1 * n_yaw);
            waitframe(1);
        }
    }
    setdvar(#"phys_gravity_dir", (0, 0, 1));
    function_bc159e32(localclientnum, 0);
    function_ca443a8f(localclientnum, 0);
    function_1862912(localclientnum, 0);
}

// Namespace zm_zodt8/zm_zodt8
// Params 1, eflags: 0x1 linked
// Checksum 0x414ed166, Offset: 0x24b8
// Size: 0x104
function set_gravity(n_wait) {
    if (!isdefined(level.var_566ca3af)) {
        level.var_566ca3af = n_wait;
    }
    if (level.var_566ca3af >= n_wait) {
        if (level flag::get(#"hash_13dc8f128d50bada")) {
            return;
        }
        inversion = 1;
        if (level clientfield::get("newtonian_negation")) {
            inversion = -1;
        }
        if (isdefined(self) && isdefined(self.angles)) {
            function_a1c09ed(-800 * inversion * anglestoup(self.angles));
        }
        level.var_566ca3af = 0;
        return;
    }
    level.var_566ca3af++;
}

// Namespace zm_zodt8/zm_zodt8
// Params 7, eflags: 0x1 linked
// Checksum 0xc0a2d7bf, Offset: 0x25c8
// Size: 0xc4
function sfx_waterdrain_fore(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    a_origin = (-5, -5176, 574);
    str_notify = "change_water_height_fore";
    str_suffix = "_fore";
    if (newval) {
        function_46a22d9e(str_suffix, str_notify, a_origin);
        return;
    }
    function_f1d5b30a(str_suffix, str_notify, a_origin);
}

// Namespace zm_zodt8/zm_zodt8
// Params 7, eflags: 0x1 linked
// Checksum 0x7b2351b9, Offset: 0x2698
// Size: 0xbc
function sfx_waterdrain_aft(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    a_origin = (0, 1145, 136);
    str_notify = "change_water_height_aft";
    str_suffix = "_aft";
    if (newval) {
        function_46a22d9e(str_suffix, str_notify, a_origin);
        return;
    }
    function_f1d5b30a(str_suffix, str_notify, a_origin);
}

// Namespace zm_zodt8/zm_zodt8
// Params 3, eflags: 0x1 linked
// Checksum 0xc546a4de, Offset: 0x2760
// Size: 0x6c
function function_46a22d9e(str_suffix, str_notify, a_origin) {
    level notify(str_notify);
    playsound(0, "zmb_waterdrain_quad_start" + str_suffix, a_origin);
    audio::playloopat("zmb_waterdrain_quad_lp" + str_suffix, a_origin);
}

// Namespace zm_zodt8/zm_zodt8
// Params 3, eflags: 0x1 linked
// Checksum 0x2e4e70ff, Offset: 0x27d8
// Size: 0x6c
function function_f1d5b30a(str_suffix, str_notify, a_origin) {
    level notify(str_notify);
    playsound(0, "zmb_waterdrain_quad_end" + str_suffix, a_origin);
    audio::stoploopat("zmb_waterdrain_quad_lp" + str_suffix, a_origin);
}

// Namespace zm_zodt8/zm_zodt8
// Params 7, eflags: 0x1 linked
// Checksum 0x4962e904, Offset: 0x2850
// Size: 0x134
function pap_projectile_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        if (!isdefined(self.var_4b7a5b1b)) {
            self.var_4b7a5b1b = util::playfxontag(localclientnum, level._effect[#"pap_projectile"], self, "tag_origin");
        }
        if (!isdefined(self.var_353ff2a)) {
            self.var_353ff2a = self playloopsound(#"hash_2ac2bbbfef2face4");
        }
        return;
    }
    if (newval == 0) {
        if (isdefined(self.var_4b7a5b1b)) {
            stopfx(localclientnum, self.var_4b7a5b1b);
        }
        if (isdefined(self.var_353ff2a)) {
            self stoploopsound(self.var_353ff2a);
        }
    }
}

// Namespace zm_zodt8/zm_zodt8
// Params 7, eflags: 0x1 linked
// Checksum 0x5dfaf644, Offset: 0x2990
// Size: 0x84
function pap_projectile_end_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        util::playfxontag(localclientnum, level._effect[#"pap_projectile_end"], self, "tag_origin");
    }
}

// Namespace zm_zodt8/zm_zodt8
// Params 7, eflags: 0x1 linked
// Checksum 0xfce2da2c, Offset: 0x2a20
// Size: 0x2ec
function sentinel_artifact_activated(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self endon(#"death");
    if (newval == 1) {
        self.fx = util::playfxontag(localclientnum, level._effect[#"sentinel_aura"], self, "tag_fx_x_pos");
        self playrenderoverridebundle(#"hash_1589a47f2fdc6c67");
        self.sfx_id = self playloopsound(#"hash_66df9cab2c64f968");
        return;
    }
    if (newval == 2) {
        if (isdefined(self.sfx_id)) {
            self stoploopsound(self.sfx_id);
        }
        self playsound(localclientnum, #"hash_75b9c9ad6ebe8af2");
        self stoprenderoverridebundle(#"hash_1589a47f2fdc6c67");
        if (isdefined(self.fx)) {
            stopfx(localclientnum, self.fx);
            self.fx = undefined;
        }
        util::playfxontag(localclientnum, level._effect[#"sentinel_activate"], self, "tag_fx_x_pos");
        while (isdefined(self) && self.model !== #"hash_2c0078538e398b4f") {
            waitframe(1);
        }
        self.fx = util::playfxontag(localclientnum, level._effect[#"sentinel_glow"], self, "tag_fx_x_pos");
        waitframe(1);
        self playrenderoverridebundle(#"hash_111d3e86bf2007e4");
        return;
    }
    if (isdefined(self.fx)) {
        stopfx(localclientnum, self.fx);
        self.fx = undefined;
    }
    self playsound(localclientnum, #"hash_5de064f33e9e49b8");
    self playsound(localclientnum, #"hash_3d8fef5997663b17");
}

// Namespace zm_zodt8/zm_zodt8
// Params 7, eflags: 0x1 linked
// Checksum 0x117b6112, Offset: 0x2d18
// Size: 0x94
function sndactorunderwater(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        self setsoundentcontext("water", "under");
        return;
    }
    self setsoundentcontext("water", "over");
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0xd3b63179, Offset: 0x2db8
// Size: 0x288
function setup_personality_character_exerts() {
    level.exert_sounds[1][#"playerbreathinsound"] = "vox_plr_1_exert_sniper_hold";
    level.exert_sounds[2][#"playerbreathinsound"] = "vox_plr_2_exert_sniper_hold";
    level.exert_sounds[3][#"playerbreathinsound"] = "vox_plr_3_exert_sniper_hold";
    level.exert_sounds[4][#"playerbreathinsound"] = "vox_plr_4_exert_sniper_hold";
    level.exert_sounds[1][#"playerbreathoutsound"] = "vox_plr_1_exert_sniper_exhale";
    level.exert_sounds[2][#"playerbreathoutsound"] = "vox_plr_2_exert_sniper_exhale";
    level.exert_sounds[3][#"playerbreathoutsound"] = "vox_plr_3_exert_sniper_exhale";
    level.exert_sounds[4][#"playerbreathoutsound"] = "vox_plr_4_exert_sniper_exhale";
    level.exert_sounds[1][#"playerbreathgaspsound"] = "vox_plr_1_exert_sniper_gasp";
    level.exert_sounds[2][#"playerbreathgaspsound"] = "vox_plr_2_exert_sniper_gasp";
    level.exert_sounds[3][#"playerbreathgaspsound"] = "vox_plr_3_exert_sniper_gasp";
    level.exert_sounds[4][#"playerbreathgaspsound"] = "vox_plr_4_exert_sniper_gasp";
    level.exert_sounds[1][#"meleeswipesoundplayer"] = "vox_plr_1_exert_punch_give";
    level.exert_sounds[2][#"meleeswipesoundplayer"] = "vox_plr_2_exert_punch_give";
    level.exert_sounds[3][#"meleeswipesoundplayer"] = "vox_plr_3_exert_punch_give";
    level.exert_sounds[4][#"meleeswipesoundplayer"] = "vox_plr_4_exert_punch_give";
}

// Namespace zm_zodt8/zm_zodt8
// Params 7, eflags: 0x1 linked
// Checksum 0x870693b8, Offset: 0x3048
// Size: 0x11c
function function_b7fc06b2(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    function_17e1650c(4);
    wait(25);
    var_17623425 = 4;
    n_time = 0;
    var_1713b028 = (4 - 1) / (45 - 25) / 1;
    while (var_17623425 > 1) {
        n_time += 1;
        var_17623425 -= var_1713b028;
        function_17e1650c(var_17623425);
        wait(1);
    }
    function_17e1650c(1);
}

// Namespace zm_zodt8/zm_zodt8
// Params 7, eflags: 0x1 linked
// Checksum 0xc4bb793b, Offset: 0x3170
// Size: 0x5c
function water_splashies(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self postfx::playpostfxbundle(#"hash_50d5d465e2b9b355");
}

// Namespace zm_zodt8/zm_zodt8
// Params 7, eflags: 0x1 linked
// Checksum 0xe4566a83, Offset: 0x31d8
// Size: 0x8c
function water_drippies(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self postfx::playpostfxbundle(#"pstfx_sprite_rain_loop_sparse");
        return;
    }
    self postfx::stoppostfxbundle(#"pstfx_sprite_rain_loop_sparse");
}

