// Atian COD Tools GSC decompiler test
#using script_624a704d0f6bf28d;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\struct.csc;

#namespace zm_orange_mq_soapstone;

// Namespace zm_orange_mq_soapstone/zm_orange_mq_soapstone
// Params 0, eflags: 0x1 linked
// Checksum 0x13cd30d3, Offset: 0xc8
// Size: 0x74
function preload() {
    level._effect[#"soapstone_cold"] = #"hash_75215ea3c21f31d3";
    level._effect[#"soapstone_hot"] = #"hash_7cdf08df557a9b3f";
    init_clientfields();
}

// Namespace zm_orange_mq_soapstone/zm_orange_mq_soapstone
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0x148
// Size: 0x4
function main() {
    
}

// Namespace zm_orange_mq_soapstone/zm_orange_mq_soapstone
// Params 0, eflags: 0x1 linked
// Checksum 0xdc24cf5e, Offset: 0x158
// Size: 0x4c
function init_clientfields() {
    clientfield::register("scriptmover", "soapstone_start_fx", 24000, 2, "int", &soapstone_fx, 0, 0);
}

// Namespace zm_orange_mq_soapstone/zm_orange_mq_soapstone
// Params 7, eflags: 0x1 linked
// Checksum 0x768d3fe5, Offset: 0x1b0
// Size: 0x10a
function soapstone_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (isdefined(self.fx_glow)) {
        stopfx(localclientnum, self.fx_glow);
        self.fx_glow = undefined;
    }
    if (newval == 1) {
        self.fx_glow = util::playfxontag(localclientnum, level._effect[#"soapstone_cold"], self, "tag_origin");
        return;
    }
    if (newval == 2) {
        self.fx_glow = util::playfxontag(localclientnum, level._effect[#"soapstone_hot"], self, "tag_origin");
    }
}

