// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_utility.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\scene_shared.csc;
#using scripts\core_common\renderoverridebundle.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\audio_shared.csc;
#using scripts\core_common\animation_shared.csc;

#namespace namespace_82497b8a;

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 0, eflags: 0x2
// Checksum 0xf50e6cf3, Offset: 0x520
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"mansion_ww", &__init__, undefined, undefined);
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 0, eflags: 0x1 linked
// Checksum 0xf229a58c, Offset: 0x568
// Size: 0x584
function __init__() {
    clientfield::register("scriptmover", "" + #"hash_64f62d9a3170948e", 1, 1, "int", &shrink_globe, 0, 0);
    clientfield::register("actor", "" + #"hash_6848ec3d200d443b", 1, 1, "int", &shrink_zombie, 0, 0);
    clientfield::register("vehicle", "" + #"hash_6848ec3d200d443b", 1, 1, "int", &shrink_zombie, 0, 0);
    clientfield::register("actor", "" + #"hash_6f59675863e19a50", 1, 1, "int", &function_d8cf1bd7, 0, 0);
    clientfield::register("vehicle", "" + #"hash_6f59675863e19a50", 1, 1, "int", &function_d8cf1bd7, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_32156a79f13e8c37", 1, 1, "int", &function_751c64a4, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_30c86f39ae8ea002", 1, 1, "int", &function_7fe3e4c8, 0, 0);
    clientfield::register("actor", "" + #"hash_1dd40649a6474f30", 1, 1, "int", &function_1af615a9, 0, 0);
    clientfield::register("vehicle", "" + #"hash_1dd40649a6474f30", 1, 1, "int", &function_1af615a9, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_12b19992ccb300e7", 1, 1, "int", &function_ac54fdec, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_54fdcf7f8eb5449e", 1, 1, "int", &function_176a239f, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_69b312bcaae6308b", 1, 1, "int", &function_68a87cde, 0, 0);
    clientfield::register("actor", "" + #"hash_2ff818c8cb4c17ba", 1, 1, "int", &function_332e7c58, 0, 0);
    clientfield::register("vehicle", "" + #"hash_2ff818c8cb4c17ba", 1, 1, "int", &function_3b7e3b9, 0, 0);
    clientfield::register("actor", "" + #"hash_3bedaaea2c17af23", 1, 1, "int", &function_dd9a8d7c, 0, 0);
    clientfield::register("vehicle", "" + #"hash_3bedaaea2c17af23", 1, 1, "int", &function_51595e12, 0, 0);
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 7, eflags: 0x1 linked
// Checksum 0x278f518b, Offset: 0xaf8
// Size: 0x1cc
function shrink_globe(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    v_up = vectorscale((1, 0, 0), 360);
    v_forward = vectorscale((0, 0, 1), 360);
    if (newval == 1) {
        self.fx_globe = playfx(localclientnum, "zm_weapons/fx8_www_shrink_globe", self.origin, v_forward, v_up);
        if (!isdefined(self.var_66db8b1a)) {
            self playsound(localclientnum, #"hash_fe927ec8b31e2d");
            self.var_66db8b1a = self playloopsound(#"hash_57b1409fb6e001f3");
        }
        return;
    }
    if (isdefined(self.fx_globe)) {
        stopfx(localclientnum, self.fx_globe);
        self.fx_globe = undefined;
    }
    playfx(localclientnum, "zm_weapons/fx8_www_shrink_globe_death", self.origin, v_forward, v_up);
    if (isdefined(self.var_66db8b1a)) {
        self stoploopsound(self.var_66db8b1a);
        self.var_66db8b1a = undefined;
        self playsound(localclientnum, #"hash_12c7ff63913e6a34");
    }
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 7, eflags: 0x1 linked
// Checksum 0x3c18894, Offset: 0xcd0
// Size: 0x5c
function shrink_zombie(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self thread function_847080fa(localclientnum);
    }
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 1, eflags: 0x1 linked
// Checksum 0x7ab55644, Offset: 0xd38
// Size: 0x294
function function_847080fa(localclientnum) {
    e_model = util::spawn_anim_model(localclientnum, self.model, self.origin, self.angles);
    if (!isdefined(e_model)) {
        return;
    }
    self.var_d8b9c4bf = 1;
    if (isdefined(self.head)) {
        e_model attach(self.head, "J_Head");
    }
    playsound(localclientnum, #"hash_1b7646cdadf52c4d", self.origin + vectorscale((0, 0, 1), 35));
    switch (self.archetype) {
    case #"zombie":
        var_99d5ab4f = #"aib_t8_zm_zombie_base_dth_shrink_ww_wkud";
        break;
    case #"nosferatu":
        var_99d5ab4f = #"aib_t8_zm_nfrtu_dth_shrink_ww_wkud";
        break;
    case #"bat":
        var_99d5ab4f = #"aib_t8_zm_bat_dth_shrink_ww_wkud";
        break;
    }
    if (isdefined(var_99d5ab4f)) {
        e_model thread scene::play(var_99d5ab4f, e_model);
    }
    var_1f698175 = 1;
    for (var_cf6d072d = 0.02; var_1f698175 > 0.1; var_cf6d072d = var_cf6d072d * 1.00433) {
        waitframe(1);
        var_1f698175 = var_1f698175 - var_cf6d072d;
        if (var_1f698175 > 0) {
            e_model setscale(var_1f698175);
        }
    }
    playsound(localclientnum, #"hash_6abe8c2d3548831c", e_model.origin + vectorscale((0, 0, 1), 35));
    playfx(localclientnum, "zm_weapons/fx8_www_shrink_enemy_death", e_model.origin + vectorscale((0, 0, 1), 35));
    e_model delete();
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 7, eflags: 0x1 linked
// Checksum 0x438669c6, Offset: 0xfd8
// Size: 0xa2
function function_d8cf1bd7(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self.var_121a6632)) {
        stopfx(localclientnum, self.var_121a6632);
        self.var_121a6632 = undefined;
    }
    if (newval) {
        self.var_121a6632 = util::playfxontag(localclientnum, "zm_weapons/fx8_www_shrink_enemy_torso", self, "j_spine4");
    }
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 7, eflags: 0x1 linked
// Checksum 0x103e7dc1, Offset: 0x1088
// Size: 0x1f4
function function_751c64a4(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    v_up = vectorscale((1, 0, 0), 360);
    v_forward = vectorscale((0, 0, 1), 360);
    if (!isdefined(self.sound_origin)) {
        self.sound_origin = self.origin + vectorscale((0, 0, 1), 50);
    }
    if (newval == 1) {
        self.registerplayer_lift_clipbamfupdate = playfx(localclientnum, "zm_weapons/fx8_www_dazed_vortex", self.origin, v_forward, v_up);
        playsound(localclientnum, #"hash_65790bfd14f9d80e", self.sound_origin);
        audio::playloopat(#"hash_23133277b3364bd2", self.sound_origin);
        return;
    }
    if (isdefined(self.registerplayer_lift_clipbamfupdate)) {
        stopfx(localclientnum, self.registerplayer_lift_clipbamfupdate);
        self.registerplayer_lift_clipbamfupdate = undefined;
    }
    v_origin = self.origin;
    playsound(localclientnum, #"hash_1bb8f665af965ffb", self.sound_origin);
    audio::stoploopat(#"hash_23133277b3364bd2", self.sound_origin);
    wait(1);
    playfx(localclientnum, "zm_weapons/fx8_www_dazed_vortex_end", v_origin, v_forward, v_up);
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 7, eflags: 0x1 linked
// Checksum 0xec2cc353, Offset: 0x1288
// Size: 0xae
function function_7fe3e4c8(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self.var_22166a07 = util::playfxontag(localclientnum, "zm_weapons/fx8_www_dazed_bubble_trail", self, "tag_eye");
        return;
    }
    if (isdefined(self.var_22166a07)) {
        stopfx(localclientnum, self.var_22166a07);
        self.var_22166a07 = undefined;
    }
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 7, eflags: 0x1 linked
// Checksum 0xccb8f904, Offset: 0x1340
// Size: 0xfe
function function_1af615a9(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        sound_origin = self gettagorigin("j_head");
        playsound(localclientnum, #"hash_483ba5ccc74b82ae", sound_origin);
        self.var_3403f7a9 = util::playfxontag(localclientnum, "zm_weapons/fx8_www_dazed_enemy_glow_eye", self, "j_head");
        return;
    }
    if (isdefined(self.var_3403f7a9)) {
        stopfx(localclientnum, self.var_3403f7a9);
        self.var_3403f7a9 = undefined;
    }
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 7, eflags: 0x1 linked
// Checksum 0xd84e198b, Offset: 0x1448
// Size: 0x1ae
function function_ac54fdec(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        v_up = vectorscale((1, 0, 0), 360);
        v_forward = vectorscale((0, 0, 1), 360);
        self.fx_tornado = playfx(localclientnum, "zm_weapons/fx8_www_spin_tornado", self.origin, v_forward, v_up);
        if (!isdefined(self.sound_origin)) {
            self.sound_origin = self.origin + vectorscale((0, 0, 1), 50);
            playsound(localclientnum, #"hash_2d629f848398a470", self.sound_origin);
            audio::playloopat(#"hash_5a6410f04ce4b3a0", self.sound_origin);
        }
        return;
    }
    if (isdefined(self.sound_origin)) {
        playsound(localclientnum, #"hash_49211352d3711451", self.sound_origin);
        audio::stoploopat(#"hash_5a6410f04ce4b3a0", self.sound_origin);
    }
    if (isdefined(self.fx_tornado)) {
        stopfx(localclientnum, self.fx_tornado);
        self.fx_tornado = undefined;
    }
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 7, eflags: 0x1 linked
// Checksum 0xfab3a711, Offset: 0x1600
// Size: 0x1e4
function function_176a239f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        self.var_b875cdb1 = util::playfxontag(localclientnum, "zm_weapons/fx8_www_drag_portal", self, "tag_origin");
        if (!isdefined(self.sound_origin)) {
            self.sound_origin = self.origin + vectorscale((0, 0, 1), 50);
            playsound(localclientnum, #"hash_457eb103eafefe25", self.sound_origin);
            audio::playloopat(#"hash_31a9e607641ce8eb", self.sound_origin);
            self thread function_872ccd5b(#"hash_31a9e607641ce8eb", #"hash_3ab7968f3d5362bc");
        }
        return;
    }
    if (isdefined(self.sound_origin)) {
        self notify(#"hash_d35390d5b5c613b");
        playsound(localclientnum, #"hash_3ab7968f3d5362bc", self.sound_origin);
        audio::stoploopat(#"hash_31a9e607641ce8eb", self.sound_origin);
    }
    if (isdefined(self.var_b875cdb1)) {
        killfx(localclientnum, self.var_b875cdb1);
        self.var_b875cdb1 = undefined;
    }
    util::playfxontag(localclientnum, "zm_weapons/fx8_www_drag_portal_end", self, "tag_origin");
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 2, eflags: 0x1 linked
// Checksum 0x8c32fa82, Offset: 0x17f0
// Size: 0x84
function function_872ccd5b(var_ff3c5ccc, var_fc01b069) {
    self endon(#"hash_d35390d5b5c613b");
    a_origin = self.sound_origin;
    self waittill(#"death");
    playsound(0, var_fc01b069, a_origin);
    audio::stoploopat(var_ff3c5ccc, a_origin);
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 7, eflags: 0x1 linked
// Checksum 0x56ca364b, Offset: 0x1880
// Size: 0xa2
function function_68a87cde(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self.var_39a7e416)) {
        stopfx(localclientnum, self.var_39a7e416);
        self.var_39a7e416 = undefined;
    }
    if (newval) {
        self.var_39a7e416 = util::playfxontag(localclientnum, "zm_weapons/fx8_www_drag_ash_trail", self, "tag_origin");
    }
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 7, eflags: 0x1 linked
// Checksum 0x47141094, Offset: 0x1930
// Size: 0x64
function function_332e7c58(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self thread function_9fe38370(localclientnum, newval, "j_spine4");
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 7, eflags: 0x1 linked
// Checksum 0xa3600ce3, Offset: 0x19a0
// Size: 0x64
function function_3b7e3b9(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self thread function_9fe38370(localclientnum, newval, "tag_chest_ws");
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 3, eflags: 0x1 linked
// Checksum 0xd4e5bb55, Offset: 0x1a10
// Size: 0xf4
function function_9fe38370(localclientnum, newval, str_tag) {
    if (isdefined(self.var_4b8417f6)) {
        stopfx(localclientnum, self.var_4b8417f6);
        self.var_4b8417f6 = undefined;
    }
    if (newval) {
        self.var_4b8417f6 = util::playfxontag(localclientnum, "zm_weapons/fx8_www_drag_enemy_torso", self, str_tag);
        if (self.archetype === #"zombie" || self.archetype === #"nosferatu") {
            self thread function_84884488(localclientnum);
        }
        self playsound(localclientnum, #"hash_71ccbe40ffaafe22");
    }
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 1, eflags: 0x1 linked
// Checksum 0xc162b4d4, Offset: 0x1b10
// Size: 0x33c
function function_84884488(localclientnum) {
    self endon(#"death");
    self zm_utility::good_barricade_damaged(localclientnum);
    wait(0.7);
    self playrenderoverridebundle(#"hash_429426f01ad84c8b");
    wait(0.7);
    if (self.archetype === #"zombie" || self.archetype === #"catalyst" || self.archetype === #"nosferatu") {
        if (!isdefined(level.var_4fea6622)) {
            level.var_4fea6622 = 0;
        }
        self thread function_30c6d85();
        util::playfxontag(localclientnum, "zm_weapons/fx8_www_drag_enemy_ember_torso", self, "j_spine4");
        util::playfxontag(localclientnum, "zm_weapons/fx8_www_drag_enemy_ember_waist", self, "j_spinelower");
        util::playfxontag(localclientnum, "zm_weapons/fx8_www_drag_enemy_ember_head", self, "j_head");
        if (level.var_4fea6622 < 9) {
            util::playfxontag(localclientnum, "zm_weapons/fx8_www_drag_enemy_ember_arm_left", self, "j_elbow_le");
            util::playfxontag(localclientnum, "zm_weapons/fx8_www_drag_enemy_ember_arm_right", self, "j_elbow_ri");
            util::playfxontag(localclientnum, "zm_weapons/fx8_www_drag_enemy_ember_hip_left", self, "j_hip_le");
            util::playfxontag(localclientnum, "zm_weapons/fx8_www_drag_enemy_ember_hip_right", self, "j_hip_ri");
            util::playfxontag(localclientnum, "zm_weapons/fx8_www_drag_enemy_ember_leg_left", self, "j_knee_le");
            util::playfxontag(localclientnum, "zm_weapons/fx8_www_drag_enemy_ember_leg_right", self, "j_knee_ri");
            return;
        }
        if (level.var_4fea6622 < 17) {
            if (math::cointoss()) {
                util::playfxontag(localclientnum, "zm_weapons/fx8_www_drag_enemy_ember_arm_left", self, "j_elbow_le");
            } else {
                util::playfxontag(localclientnum, "zm_weapons/fx8_www_drag_enemy_ember_arm_right", self, "j_elbow_ri");
            }
            if (math::cointoss()) {
                util::playfxontag(localclientnum, "zm_weapons/fx8_www_drag_enemy_ember_hip_left", self, "j_hip_le");
                return;
            }
            util::playfxontag(localclientnum, "zm_weapons/fx8_www_drag_enemy_ember_hip_right", self, "j_hip_ri");
        }
    }
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 0, eflags: 0x1 linked
// Checksum 0x5d8dae43, Offset: 0x1e58
// Size: 0x94
function function_30c6d85() {
    level.var_4fea6622++;
    /#
        iprintlnbold("<unknown string>" + level.var_4fea6622);
    #/
    self waittilltimeout(1.2, #"death");
    level.var_4fea6622--;
    /#
        iprintlnbold("<unknown string>" + level.var_4fea6622);
    #/
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 7, eflags: 0x1 linked
// Checksum 0xb244000, Offset: 0x1ef8
// Size: 0x64
function function_dd9a8d7c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self thread function_df636944(localclientnum, newval, "j_spine4");
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 7, eflags: 0x1 linked
// Checksum 0x51031dfd, Offset: 0x1f68
// Size: 0x64
function function_51595e12(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self thread function_df636944(localclientnum, newval, "tag_chest_ws");
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 3, eflags: 0x1 linked
// Checksum 0x9cc045b4, Offset: 0x1fd8
// Size: 0x3c
function function_df636944(localclientnum, newval, str_tag) {
    util::playfxontag(localclientnum, "zm_weapons/fx8_www_drag_enemy_death", self, str_tag);
}

