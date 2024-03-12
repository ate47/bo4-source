// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_utility.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace namespace_a35b43eb;

// Namespace namespace_a35b43eb/zm_mansion_traps_firegates
// Params 0, eflags: 0x2
// Checksum 0x655b57c4, Offset: 0xd8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_18d1bdf8dbbfec6c", &__init__, undefined, undefined);
}

// Namespace namespace_a35b43eb/zm_mansion_traps_firegates
// Params 0, eflags: 0x1 linked
// Checksum 0x33b0c313, Offset: 0x120
// Size: 0x72
function __init__() {
    init_clientfields();
    level._effect[#"trap_light_green"] = #"hash_3b61ca07c83b7171";
    level._effect[#"trap_light_red"] = #"hash_7534672c207c08ed";
}

// Namespace namespace_a35b43eb/zm_mansion_traps_firegates
// Params 0, eflags: 0x1 linked
// Checksum 0xce093a33, Offset: 0x1a0
// Size: 0xb4
function init_clientfields() {
    clientfield::register("scriptmover", "" + #"trap_light", 8000, 2, "int", &function_1d5b8b9f, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_17df66ef5f71c0de", 8000, 2, "int", &function_b3f0f5cd, 0, 0);
}

// Namespace namespace_a35b43eb/zm_mansion_traps_firegates
// Params 7, eflags: 0x1 linked
// Checksum 0x798220c8, Offset: 0x260
// Size: 0x142
function function_1d5b8b9f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (isdefined(self.var_d476c975)) {
        stopfx(localclientnum, self.var_d476c975);
        self.var_d476c975 = undefined;
    }
    if (isdefined(self.var_16c041ae)) {
        stopfx(localclientnum, self.var_16c041ae);
        self.var_16c041ae = undefined;
    }
    if (newval == 1) {
        self.var_d476c975 = util::playfxontag(localclientnum, level._effect[#"trap_light_green"], self, "light_fx_tag");
        return;
    }
    if (newval == 2) {
        self.var_16c041ae = util::playfxontag(localclientnum, level._effect[#"trap_light_red"], self, "light_fx_tag");
    }
}

// Namespace namespace_a35b43eb/zm_mansion_traps_firegates
// Params 7, eflags: 0x1 linked
// Checksum 0xf9fbd3b4, Offset: 0x3b0
// Size: 0x212
function function_b3f0f5cd(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (isdefined(self.var_fca46d00)) {
        stopfx(localclientnum, self.var_fca46d00);
        self.var_fca46d00 = undefined;
        stopfx(localclientnum, self.var_f7653c4b);
        self.var_f7653c4b = undefined;
    }
    if (isdefined(self.var_7504a327)) {
        stopfx(localclientnum, self.var_7504a327);
        self.var_7504a327 = undefined;
        stopfx(localclientnum, self.var_5a0ff99d);
        self.var_5a0ff99d = undefined;
    }
    if (newval == 1) {
        self.var_fca46d00 = util::playfxontag(localclientnum, level._effect[#"trap_light_green"], self, "j_light_lt");
        self.var_f7653c4b = util::playfxontag(localclientnum, level._effect[#"trap_light_green"], self, "j_light_rt");
        return;
    }
    if (newval == 2) {
        self.var_7504a327 = util::playfxontag(localclientnum, level._effect[#"trap_light_red"], self, "j_light_lt");
        self.var_5a0ff99d = util::playfxontag(localclientnum, level._effect[#"trap_light_red"], self, "j_light_rt");
    }
}

