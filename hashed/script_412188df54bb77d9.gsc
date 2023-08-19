// Atian COD Tools GSC decompiler test
#include scripts/zm_common/zm_utility.csc;
#include scripts/core_common/postfx_shared.csc;
#include scripts/core_common/clientfield_shared.csc;
#include scripts/core_common/system_shared.csc;
#include scripts/core_common/audio_shared.csc;
#include scripts/core_common/util_shared.csc;

#namespace namespace_87b5173f;

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 0, eflags: 0x1 linked
// Checksum 0x3ca9e79a, Offset: 0x200
// Size: 0x3f2
function init() {
    clientfield::register("actor", "shower_trap_death_fx", 1, 1, "int", &acid_trap_death_fx, 0, 0);
    clientfield::register("scriptmover", "shower_trap_fx", 1, 1, "int", &acid_trap_fx, 0, 0);
    clientfield::register("toplayer", "player_shower_trap_post_fx", 18000, 1, "int", &player_acid_trap_post_fx, 0, 0);
    clientfield::register("toplayer", "player_fire_trap_post_fx", 18000, 1, "int", &player_fire_trap_post_fx, 0, 0);
    clientfield::register("scriptmover", "fire_trap_fx", 1, 1, "int", &fire_trap_fx, 0, 0);
    clientfield::register("actor", "spinning_trap_blood_fx", 1, 1, "int", &spinning_trap_blood_fx, 0, 0);
    clientfield::register("actor", "spinning_trap_eye_fx", 1, 1, "int", &spinning_trap_eye_fx, 0, 0);
    clientfield::register("toplayer", "rumble_spinning_trap", 1, 1, "int", &rumble_spinning_trap, 0, 0);
    level._effect[#"animscript_gib_fx"] = #"zombie/fx_blood_torso_explo_zmb";
    level._effect[#"acid_spray"] = #"hash_424786ecbc7f5672";
    level._effect[#"acid_spray_death"] = #"hash_48d74d13d0c569c";
    level._effect[#"hash_294b19c300d1b482"] = #"hash_29ac72c5aa5398bc";
    level._effect[#"hash_4391e5c4b43c63c9"] = #"hash_709cca7d0048aa72";
    level._effect[#"hash_5647f8e593893bce"] = #"hash_69af1783a31b44f7";
    level._effect[#"zombie_eye_trail"] = #"hash_526060b70ce93d7e";
    level._effect[#"spinning_blood"] = #"hash_358533e8293f131d";
    level._effect[#"hash_44ccd33973542202"] = #"hash_5fdb13b4843bc710";
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 7, eflags: 0x1 linked
// Checksum 0xf780b5e3, Offset: 0x600
// Size: 0x1ac
function acid_trap_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 1) {
        if (isdefined(self.var_91180673)) {
            self.var_91180673 delete();
        }
        playsound(localclientnum, #"hash_68f3e5dbc3422363", self.origin);
        audio::playloopat("zmb_trap_acid_loop", self.origin);
        self.var_91180673 = util::playfxontag(localclientnum, level._effect[#"acid_spray"], self, "tag_origin");
    } else {
        playsound(localclientnum, #"hash_4da8231bc8767676", self.origin);
        audio::stoploopat("zmb_trap_acid_loop", self.origin);
        if (isdefined(self.var_91180673)) {
            stopfx(localclientnum, self.var_91180673);
            self.var_91180673 = undefined;
        }
        playfx(localclientnum, level._effect[#"acid_spray_death"], self.origin);
    }
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 7, eflags: 0x1 linked
// Checksum 0x4e802f2a, Offset: 0x7b8
// Size: 0xee
function acid_trap_death_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 1) {
        self.n_acid_trap_death_fx = util::playfxontag(localclientnum, level._effect[#"hash_294b19c300d1b482"], self, "tag_stowed_back");
        playsound(localclientnum, #"hash_4d4c9f8ad239b61f", self.origin);
    } else if (isdefined(self.n_acid_trap_death_fx)) {
        stopfx(localclientnum, self.n_acid_trap_death_fx);
        self.n_acid_trap_death_fx = undefined;
    }
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 7, eflags: 0x1 linked
// Checksum 0xa83babbc, Offset: 0x8b0
// Size: 0x206
function player_acid_trap_post_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 1) {
        if (isdemoplaying() && demoisanyfreemovecamera()) {
            return;
        }
        if (self != function_5c10bd79(localclientnum)) {
            return;
        }
        self notify(#"player_acid_trap_post_fx_complete");
        self.var_431ddde9 = self playloopsound(#"hash_341a3fa00975f232");
        self thread function_17956e93(localclientnum);
        self thread postfx::playpostfxbundle(#"hash_98397d99cb3a03");
        self.var_b1409d8f = playfxoncamera(localclientnum, level._effect[#"hash_4391e5c4b43c63c9"]);
        self playrenderoverridebundle(#"hash_216f6c4ece79a4b8");
        if (self zm_utility::function_f8796df3(localclientnum)) {
            self.var_7a7fac87 = playviewmodelfx(localclientnum, level._effect[#"hash_5647f8e593893bce"], "j_wrist_ri");
        }
    } else {
        self notify(#"player_acid_trap_post_fx_complete");
        if (isdefined(self.var_431ddde9)) {
            self stoploopsound(self.var_431ddde9);
            self.var_431ddde9 = undefined;
        }
    }
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 1, eflags: 0x1 linked
// Checksum 0x89250d26, Offset: 0xac0
// Size: 0x13c
function function_17956e93(localclientnum) {
    self endoncallback(&function_502136a5, #"death");
    self waittill(#"player_acid_trap_post_fx_complete");
    if (isdefined(self)) {
        self postfx::exitpostfxbundle(#"hash_98397d99cb3a03");
        if (isdefined(localclientnum) && isdefined(self.var_b1409d8f)) {
            stopfx(localclientnum, self.var_b1409d8f);
            self.var_b1409d8f = undefined;
        }
        if (isdefined(localclientnum) && isdefined(self.var_7a7fac87)) {
            stopfx(localclientnum, self.var_7a7fac87);
            self.var_7a7fac87 = undefined;
        }
        if (isdefined(self.var_431ddde9)) {
            self stoploopsound(self.var_431ddde9);
            self.var_431ddde9 = undefined;
        }
        self stoprenderoverridebundle(#"hash_216f6c4ece79a4b8");
    }
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 1, eflags: 0x1 linked
// Checksum 0x15d3eae5, Offset: 0xc08
// Size: 0x144
function function_502136a5(str_notify) {
    if (isdefined(self)) {
        localclientnum = self getlocalclientnumber();
        if (self postfx::function_556665f2(#"hash_98397d99cb3a03")) {
            self postfx::exitpostfxbundle(#"hash_98397d99cb3a03");
        }
        if (isdefined(self.var_431ddde9)) {
            self stoploopsound(self.var_431ddde9);
            self.var_431ddde9 = undefined;
        }
        if (isdefined(localclientnum) && isdefined(self.var_b1409d8f)) {
            stopfx(localclientnum, self.var_b1409d8f);
            self.var_b1409d8f = undefined;
        }
        if (isdefined(localclientnum) && isdefined(self.var_7a7fac87)) {
            stopfx(localclientnum, self.var_7a7fac87);
            self.var_7a7fac87 = undefined;
        }
        self stoprenderoverridebundle(#"hash_216f6c4ece79a4b8");
    }
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 7, eflags: 0x1 linked
// Checksum 0xc623b751, Offset: 0xd58
// Size: 0x176
function fire_trap_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 1) {
        if (isdefined(self.var_91180673)) {
            self.var_91180673 delete();
        }
        playsound(localclientnum, #"hash_370460eab1a33ee6", self.origin);
        audio::playloopat("wpn_fire_trap_loop", self.origin);
        self.var_91180673 = util::playfxontag(localclientnum, level._effect[#"hash_44ccd33973542202"], self, "tag_origin");
    } else {
        playsound(localclientnum, #"hash_5d8ec72f0838594e", self.origin);
        audio::stoploopat("wpn_fire_trap_loop", self.origin);
        if (isdefined(self.var_91180673)) {
            stopfx(localclientnum, self.var_91180673);
            self.var_91180673 = undefined;
        }
    }
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 7, eflags: 0x1 linked
// Checksum 0x5b1afb06, Offset: 0xed8
// Size: 0xfe
function player_fire_trap_post_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 1) {
        if (isdemoplaying() && demoisanyfreemovecamera()) {
            return;
        }
        if (self != function_5c10bd79(localclientnum)) {
            return;
        }
        self notify(#"player_fire_trap_post_fx_complete");
        self thread function_33da4ab(localclientnum);
        self thread postfx::playpostfxbundle(#"pstfx_zm_fire_blue_trap");
    } else {
        self notify(#"player_fire_trap_post_fx_complete");
    }
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 1, eflags: 0x1 linked
// Checksum 0x25d11a1d, Offset: 0xfe0
// Size: 0x6c
function function_33da4ab(localclientnum) {
    self endoncallback(&function_3204a9f, #"death");
    self waittill(#"player_fire_trap_post_fx_complete");
    if (isdefined(self)) {
        self postfx::exitpostfxbundle(#"pstfx_zm_fire_blue_trap");
    }
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 1, eflags: 0x1 linked
// Checksum 0x67c7a1a8, Offset: 0x1058
// Size: 0x74
function function_3204a9f(str_notify) {
    if (isdefined(self)) {
        localclientnum = self getlocalclientnumber();
        if (self postfx::function_556665f2(#"pstfx_zm_fire_blue_trap")) {
            self postfx::exitpostfxbundle(#"pstfx_zm_fire_blue_trap");
        }
    }
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 7, eflags: 0x1 linked
// Checksum 0x2721f6af, Offset: 0x10d8
// Size: 0x114
function spinning_trap_blood_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (isdefined(self.n_spinning_trap_blood_fx)) {
        stopfx(localclientnum, self.n_spinning_trap_blood_fx);
        self.n_spinning_trap_blood_fx = undefined;
    }
    if (newval == 1) {
        var_1f694afe = "j_spinelower";
        if (self.archetype == #"zombie_dog") {
            var_1f694afe = "j_spine1";
        }
        self.n_spinning_trap_blood_fx = util::playfxontag(localclientnum, level._effect[#"spinning_blood"], self, var_1f694afe);
        playsound(localclientnum, #"hash_5840ac12dd5f08cd", self.origin);
    }
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 7, eflags: 0x1 linked
// Checksum 0x7c00637, Offset: 0x11f8
// Size: 0xba
function spinning_trap_eye_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (isdefined(self.n_spinning_trap_eye_fx)) {
        stopfx(localclientnum, self.n_spinning_trap_eye_fx);
        self.n_spinning_trap_eye_fx = undefined;
    }
    if (newval == 1) {
        self.n_spinning_trap_eye_fx = util::playfxontag(localclientnum, level._effect[#"zombie_eye_trail"], self, "tag_eye");
    }
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 7, eflags: 0x1 linked
// Checksum 0xc0f336ae, Offset: 0x12c0
// Size: 0xde
function rumble_spinning_trap(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    self endon(#"death");
    if (newval == 1) {
        self endon(#"hash_6fb55d3438a8d5fa");
        while (1) {
            if (isinarray(getlocalplayers(), self)) {
                self playrumbleonentity(localclientnum, "damage_light");
            }
            wait(0.25);
        }
    } else {
        self notify(#"hash_6fb55d3438a8d5fa");
    }
}

