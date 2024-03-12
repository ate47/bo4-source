// Atian COD Tools GSC decompiler test
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace namespace_6036de69;

// Namespace namespace_6036de69/namespace_6036de69
// Params 0, eflags: 0x1 linked
// Checksum 0xb04c3281, Offset: 0x130
// Size: 0x144
function init() {
    clientfield::register("scriptmover", "gear_box_spark", 24000, 1, "int", &gear_box_spark_fx, 0, 0);
    clientfield::register("scriptmover", "flinger_impact_wood", 24000, 1, "int", &flinger_impact_wood_fx, 0, 0);
    clientfield::register("clientuimodel", "ZMInventoryPersonal.heat_pack", 1, 1, "int", undefined, 0, 0);
    level._effect[#"hash_5bea6497d336bbf"] = #"hash_299249c1ff22e1c2";
    level._effect[#"flinger_impact_wood"] = #"hash_7677e82b27eada6f";
    forcestreamxmodel("p8_zm_ora_crate_wood_01_tall_open_lid_dmg");
}

// Namespace namespace_6036de69/namespace_6036de69
// Params 7, eflags: 0x1 linked
// Checksum 0x40270e23, Offset: 0x280
// Size: 0xbe
function gear_box_spark_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self.var_91180673 = util::playfxontag(localclientnum, level._effect[#"hash_5bea6497d336bbf"], self, "tag_generator");
        return;
    }
    if (isdefined(self.var_91180673)) {
        stopfx(localclientnum, self.var_91180673);
        self.var_91180673 = undefined;
    }
}

// Namespace namespace_6036de69/namespace_6036de69
// Params 7, eflags: 0x1 linked
// Checksum 0xccfe278c, Offset: 0x348
// Size: 0x82
function flinger_impact_wood_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self.var_91180673 = util::playfxontag(localclientnum, level._effect[#"flinger_impact_wood"], self, "tag_origin");
    }
}

