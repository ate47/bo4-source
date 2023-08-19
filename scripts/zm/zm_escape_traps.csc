// Atian COD Tools GSC decompiler test
#include scripts/zm_common/zm_utility.csc;
#include scripts/core_common/postfx_shared.csc;
#include scripts/core_common/clientfield_shared.csc;
#include scripts/core_common/system_shared.csc;
#include scripts/core_common/audio_shared.csc;
#include scripts/core_common/util_shared.csc;
#include scripts/core_common/struct.csc;

#namespace zm_escape_traps;

// Namespace zm_escape_traps/zm_escape_traps
// Params 0, eflags: 0x2
// Checksum 0xe7d0c6a3, Offset: 0x1f0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_escape_traps", &__init__, undefined, undefined);
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 0, eflags: 0x1 linked
// Checksum 0x9d67ae71, Offset: 0x238
// Size: 0x422
function __init__() {
    clientfield::register("actor", "fan_trap_blood_fx", 1, 1, "int", &fan_trap_blood_fx, 0, 0);
    clientfield::register("toplayer", "rumble_fan_trap", 1, 1, "int", &rumble_fan_trap, 0, 0);
    clientfield::register("actor", "acid_trap_death_fx", 1, 1, "int", &acid_trap_death_fx, 0, 0);
    clientfield::register("scriptmover", "acid_trap_fx", 1, 1, "int", &acid_trap_fx, 0, 0);
    clientfield::register("actor", "spinning_trap_blood_fx", 1, 1, "int", &spinning_trap_blood_fx, 0, 0);
    clientfield::register("actor", "spinning_trap_eye_fx", 1, 1, "int", &spinning_trap_eye_fx, 0, 0);
    clientfield::register("toplayer", "rumble_spinning_trap", 1, 1, "int", &rumble_spinning_trap, 0, 0);
    clientfield::register("toplayer", "player_acid_trap_post_fx", 1, 1, "int", &player_acid_trap_post_fx, 0, 0);
    level._effect[#"animscript_gib_fx"] = #"zombie/fx_blood_torso_explo_zmb";
    level._effect[#"fan_blood"] = #"hash_45d61db7f0d94744";
    level._effect[#"fan_blood_head"] = #"hash_21e59a64eb02516a";
    level._effect[#"acid_spray"] = #"hash_3a65c86ea64668f5";
    level._effect[#"acid_spray_death"] = #"hash_78c487ac760f594c";
    level._effect[#"hash_294b19c300d1b482"] = #"hash_45008cc138e3bba3";
    level._effect[#"hash_4391e5c4b43c63c9"] = #"hash_215c779c48fd6856";
    level._effect[#"hash_5647f8e593893bce"] = #"hash_4d61168f93739083";
    level._effect[#"zombie_eye_trail"] = #"hash_526060b70ce93d7e";
    level._effect[#"spinning_blood"] = #"hash_358533e8293f131d";
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 7, eflags: 0x1 linked
// Checksum 0xf133933f, Offset: 0x668
// Size: 0x14e
function fan_trap_blood_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 1) {
        if (randomint(100) > 50) {
            self.n_fan_trap_blood_fx = util::playfxontag(localclientnum, level._effect[#"fan_blood_head"], self, "J_Neck");
        } else {
            self.n_fan_trap_blood_fx = util::playfxontag(localclientnum, level._effect[#"fan_blood"], self, "j_spinelower");
        }
        playsound(localclientnum, #"hash_5840ac12dd5f08cd", self.origin);
    } else if (isdefined(self.n_fan_trap_blood_fx)) {
        stopfx(localclientnum, self.n_fan_trap_blood_fx);
        self.n_fan_trap_blood_fx = undefined;
    }
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 7, eflags: 0x1 linked
// Checksum 0x78fe4287, Offset: 0x7c0
// Size: 0xde
function rumble_fan_trap(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    self endon(#"death");
    if (newval == 1) {
        self endon(#"hash_583695c3e21830e7");
        while (1) {
            if (isinarray(getlocalplayers(), self)) {
                self playrumbleonentity(localclientnum, "damage_light");
            }
            wait(0.25);
        }
    } else {
        self notify(#"hash_583695c3e21830e7");
    }
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 7, eflags: 0x1 linked
// Checksum 0x9399307d, Offset: 0x8a8
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

// Namespace zm_escape_traps/zm_escape_traps
// Params 7, eflags: 0x1 linked
// Checksum 0x9d2f1810, Offset: 0xa60
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

// Namespace zm_escape_traps/zm_escape_traps
// Params 7, eflags: 0x1 linked
// Checksum 0xd0024089, Offset: 0xb58
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
        self thread postfx::playpostfxbundle(#"pstfx_zm_acid_dmg");
        self.var_b1409d8f = playfxoncamera(localclientnum, level._effect[#"hash_4391e5c4b43c63c9"]);
        self playrenderoverridebundle(#"hash_6efc465a2da0373a");
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

// Namespace zm_escape_traps/zm_escape_traps
// Params 1, eflags: 0x1 linked
// Checksum 0x61f1e63a, Offset: 0xd68
// Size: 0x13c
function function_17956e93(localclientnum) {
    self endoncallback(&function_502136a5, #"death");
    self waittill(#"player_acid_trap_post_fx_complete");
    if (isdefined(self)) {
        self postfx::exitpostfxbundle(#"pstfx_zm_acid_dmg");
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
        self stoprenderoverridebundle(#"hash_6efc465a2da0373a");
    }
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 1, eflags: 0x1 linked
// Checksum 0xb5cf8eb8, Offset: 0xeb0
// Size: 0x144
function function_502136a5(str_notify) {
    if (isdefined(self)) {
        localclientnum = self getlocalclientnumber();
        if (self postfx::function_556665f2(#"pstfx_zm_acid_dmg")) {
            self postfx::exitpostfxbundle(#"pstfx_zm_acid_dmg");
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
        self stoprenderoverridebundle(#"hash_6efc465a2da0373a");
    }
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 7, eflags: 0x1 linked
// Checksum 0x32c0a7b0, Offset: 0x1000
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

// Namespace zm_escape_traps/zm_escape_traps
// Params 7, eflags: 0x1 linked
// Checksum 0x8b7427c7, Offset: 0x1120
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

// Namespace zm_escape_traps/zm_escape_traps
// Params 7, eflags: 0x1 linked
// Checksum 0xe309b0b6, Offset: 0x11e8
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

