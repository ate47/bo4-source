#using scripts\core_common\util_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\clientfield_shared;

#namespace mp_austria_scripted;

// Namespace mp_austria_scripted/mp_austria_scripted
// Params 0, eflags: 0x2
// Checksum 0x176e9314, Offset: 0xf8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"mp_austria_scripted", &__init__, undefined, undefined);
}

// Namespace mp_austria_scripted/mp_austria_scripted
// Params 0, eflags: 0x1 linked
// Checksum 0xcf84f9a0, Offset: 0x140
// Size: 0xc2
function __init__() {
    clientfield::register("world", "flip_skybox", 8000, 1, "int", &flip_skybox, 0, 0);
    clientfield::register("scriptmover", "zombie_has_eyes", 1, 1, "int", &zombie_eyes_clientfield_cb, 0, 0);
    level._effect[#"hash_61fce653578d7f82"] = #"zm_ai/fx8_zombie_eye_glow_orange";
}

// Namespace mp_austria_scripted/mp_austria_scripted
// Params 7, eflags: 0x1 linked
// Checksum 0x1254edd2, Offset: 0x210
// Size: 0x6c
function flip_skybox(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        setdvar(#"r_skytransition", 1);
    }
}

// Namespace mp_austria_scripted/mp_austria_scripted
// Params 7, eflags: 0x1 linked
// Checksum 0xd3e3bb25, Offset: 0x288
// Size: 0x12a
function zombie_eyes_clientfield_cb(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self.var_ea20345f)) {
        self stoprenderoverridebundle(self.var_ea20345f, "j_head");
    }
    if (isdefined(self.var_3231a850)) {
        stopfx(localclientnum, self.var_3231a850);
        self.var_3231a850 = undefined;
    }
    if (newval) {
        self.var_ea20345f = "rob_zm_eyes_red";
        var_d40cd873 = "eye_glow";
        self playrenderoverridebundle(self.var_ea20345f, "j_head");
        self.var_3231a850 = util::playfxontag(localclientnum, level._effect[#"hash_61fce653578d7f82"], self, "j_eyeball_le");
    }
}

