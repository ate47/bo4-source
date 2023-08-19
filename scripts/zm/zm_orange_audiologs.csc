// Atian COD Tools GSC decompiler test
#include scripts/core_common/util_shared.csc;
#include scripts/core_common/clientfield_shared.csc;

#namespace zm_orange_audiologs;

// Namespace zm_orange_audiologs/zm_orange_audiologs
// Params 0, eflags: 0x1 linked
// Checksum 0xd37c4039, Offset: 0xa0
// Size: 0x84
function preload() {
    level._effect[#"sam_orb"] = #"hash_445f04139d92c61b";
    clientfield::register("scriptmover", "" + #"hash_4a18e1ea1950215d", 24000, 1, "int", &function_db7a9c9d, 0, 0);
}

// Namespace zm_orange_audiologs/zm_orange_audiologs
// Params 7, eflags: 0x1 linked
// Checksum 0x69b5261f, Offset: 0x130
// Size: 0xb4
function function_db7a9c9d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval > 0) {
        self.var_af793e2d = util::playfxontag(localclientnum, level._effect[#"sam_orb"], self, "tag_origin");
    } else if (isdefined(self.var_af793e2d)) {
        stopfx(localclientnum, self.var_af793e2d);
    }
}

