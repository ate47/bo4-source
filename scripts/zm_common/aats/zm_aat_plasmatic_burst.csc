#using scripts\zm_common\zm_utility.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\aat_shared.csc;

#namespace zm_aat_plasmatic_burst;

// Namespace zm_aat_plasmatic_burst/zm_aat_plasmatic_burst
// Params 0, eflags: 0x2
// Checksum 0x13886fd8, Offset: 0x1b0
// Size: 0x34
function autoexec __init__system__() {
    system::register("zm_aat_plasmatic_burst", &__init__, undefined, undefined);
}

// Namespace zm_aat_plasmatic_burst/zm_aat_plasmatic_burst
// Params 0, eflags: 0x1 linked
// Checksum 0x9333b00f, Offset: 0x1f0
// Size: 0x1ba
function __init__() {
    if (!(isdefined(level.aat_in_use) && level.aat_in_use)) {
        return;
    }
    aat::register("zm_aat_plasmatic_burst", #"hash_164d02d599d1fa8f", "t7_icon_zm_aat_blast_furnace");
    clientfield::register("actor", "zm_aat_plasmatic_burst" + "_explosion", 1, 1, "counter", &zm_aat_plasmatic_burst_explosion, 0, 0);
    clientfield::register("vehicle", "zm_aat_plasmatic_burst" + "_explosion", 1, 1, "counter", &zm_aat_plasmatic_burst_explosion, 0, 0);
    clientfield::register("actor", "zm_aat_plasmatic_burst" + "_burn", 1, 1, "int", &function_7abfa551, 0, 0);
    clientfield::register("vehicle", "zm_aat_plasmatic_burst" + "_burn", 1, 1, "int", &function_a98c42a3, 0, 0);
    level._effect[#"zm_aat_plasmatic_burst"] = "zm_weapons/fx8_aat_plasmatic_burst_torso";
}

// Namespace zm_aat_plasmatic_burst/zm_aat_plasmatic_burst
// Params 7, eflags: 0x1 linked
// Checksum 0xca47698b, Offset: 0x3b8
// Size: 0xdc
function zm_aat_plasmatic_burst_explosion(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self)) {
        str_fx_tag = self zm_utility::function_467efa7b(1);
        if (!isdefined(str_fx_tag)) {
            str_fx_tag = "tag_origin";
        }
        self playsound(localclientnum, #"hash_6990e5a39e894c04");
        util::playfxontag(localclientnum, level._effect[#"zm_aat_plasmatic_burst"], self, str_fx_tag);
    }
}

// Namespace zm_aat_plasmatic_burst/zm_aat_plasmatic_burst
// Params 7, eflags: 0x1 linked
// Checksum 0xa7022cbf, Offset: 0x4a0
// Size: 0xbc
function function_7abfa551(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        str_tag = "j_spine4";
        v_tag = self gettagorigin(str_tag);
        if (!isdefined(v_tag)) {
            str_tag = "tag_origin";
        }
        self function_c36aebed(localclientnum, str_tag);
        return;
    }
    self function_b4d21494(localclientnum);
}

// Namespace zm_aat_plasmatic_burst/zm_aat_plasmatic_burst
// Params 7, eflags: 0x1 linked
// Checksum 0xd5aeabe4, Offset: 0x568
// Size: 0xbc
function function_a98c42a3(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        str_tag = "tag_body";
        v_tag = self gettagorigin(str_tag);
        if (!isdefined(v_tag)) {
            str_tag = "tag_origin";
        }
        self function_c36aebed(localclientnum, str_tag);
        return;
    }
    self function_b4d21494(localclientnum);
}

// Namespace zm_aat_plasmatic_burst/zm_aat_plasmatic_burst
// Params 2, eflags: 0x1 linked
// Checksum 0xae1b8713, Offset: 0x630
// Size: 0x9a
function function_c36aebed(localclientnum, tag) {
    self.var_def62862 = util::playfxontag(localclientnum, "zm_weapons/fx8_aat_plasmatic_burst_torso_fire", self, tag);
    self.var_4a87444e = util::playfxontag(localclientnum, "zm_weapons/fx8_aat_plasmatic_burst_head", self, "j_head");
    if (!isdefined(self.var_fa3f8eb7)) {
        self.var_fa3f8eb7 = self playloopsound(#"hash_645b60f29309dc9b");
    }
}

// Namespace zm_aat_plasmatic_burst/zm_aat_plasmatic_burst
// Params 1, eflags: 0x1 linked
// Checksum 0x448eaf86, Offset: 0x6d8
// Size: 0x84
function function_b4d21494(localclientnum) {
    if (isdefined(self.var_fa3f8eb7)) {
        self stoploopsound(self.var_fa3f8eb7);
    }
    if (isdefined(self.var_def62862)) {
        stopfx(localclientnum, self.var_def62862);
    }
    if (isdefined(self.var_4a87444e)) {
        stopfx(localclientnum, self.var_4a87444e);
    }
}

