#using scripts\core_common\clientfield_shared;
#using scripts\core_common\util_shared;

#namespace zm_orange_ee_dynamite;

// Namespace zm_orange_ee_dynamite/zm_orange_ee_dynamite
// Params 0, eflags: 0x1 linked
// Checksum 0xbf37cfdc, Offset: 0xd8
// Size: 0x1ac
function init() {
    level._effect[#"hash_281c546a716f0d89"] = #"hash_29df8e00a5429cf0";
    level._effect[#"dynamite_explosion"] = #"hash_eb0cf9b1e7697fb";
    level._effect[#"hash_463a8d75b304b3d5"] = #"hash_e52765b1b6a1c81";
    clientfield::register("scriptmover", "" + #"dynamite_explosion_fx", 24000, 1, "counter", &play_dynamite_explosion_fx, 0, 0);
    clientfield::register("actor", "" + #"hash_6adfdd12c9656e1c", 24000, 1, "int", &function_ee32b1b8, 0, 0);
    clientfield::register("actor", "" + #"hash_147a734966a62e10", 24000, 1, "counter", &function_baf2de8d, 0, 0);
    forcestreamxmodel("p8_zm_ora_dynamite_barrier_destroyed");
}

// Namespace zm_orange_ee_dynamite/zm_orange_ee_dynamite
// Params 7, eflags: 0x1 linked
// Checksum 0xfdfc0a2c, Offset: 0x290
// Size: 0x8c
function play_dynamite_explosion_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    playfx(localclientnum, level._effect[#"dynamite_explosion"], self.origin, anglestoright(self.angles));
}

// Namespace zm_orange_ee_dynamite/zm_orange_ee_dynamite
// Params 7, eflags: 0x1 linked
// Checksum 0x47b14ba1, Offset: 0x328
// Size: 0xba
function function_ee32b1b8(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self.var_31d7361d)) {
        stopfx(localclientnum, self.var_31d7361d);
        self.var_31d7361d = undefined;
    }
    if (newval > 0) {
        self.var_31d7361d = util::playfxontag(localclientnum, level._effect[#"hash_281c546a716f0d89"], self, "j_spine4");
    }
}

// Namespace zm_orange_ee_dynamite/zm_orange_ee_dynamite
// Params 7, eflags: 0x1 linked
// Checksum 0xb1af7db, Offset: 0x3f0
// Size: 0x74
function function_baf2de8d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    util::playfxontag(localclientnum, level._effect[#"hash_463a8d75b304b3d5"], self, "j_spine4");
}

