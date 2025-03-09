#using scripts\core_common\util_shared;
#using scripts\zm_common\zm_sq_modules;

#namespace namespace_a01a2431;

// Namespace namespace_a01a2431/namespace_a01a2431
// Params 0, eflags: 0x0
// Checksum 0x5a3cb8f7, Offset: 0xc8
// Size: 0x204
function preload() {
    level._effect[#"hash_445a09d57b925de2"] = #"hash_59977c4c851916e0";
    level._effect[#"hash_22616c5de5b8bbf4"] = #"hash_1a06427eff8dfe13";
    zm_sq_modules::function_d8383812(#"sc_ww_screen1", 20000, "sc_ww_screen1", 400, level._effect[#"hash_445a09d57b925de2"], level._effect[#"hash_22616c5de5b8bbf4"], undefined, undefined, 1);
    zm_sq_modules::function_d8383812(#"sc_ww_screen2", 20000, "sc_ww_screen2", 400, level._effect[#"hash_445a09d57b925de2"], level._effect[#"hash_22616c5de5b8bbf4"], undefined, undefined, 1);
    zm_sq_modules::function_d8383812(#"sc_ww_screen3", 20000, "sc_ww_screen3", 400, level._effect[#"hash_445a09d57b925de2"], level._effect[#"hash_22616c5de5b8bbf4"], undefined, undefined, 1);
    zm_sq_modules::function_d8383812(#"sc_ww_screen4", 20000, "sc_ww_screen4", 400, level._effect[#"hash_445a09d57b925de2"], level._effect[#"hash_22616c5de5b8bbf4"], undefined, undefined, 1);
}

// Namespace namespace_a01a2431/namespace_a01a2431
// Params 7, eflags: 0x0
// Checksum 0xd04f460c, Offset: 0x2d8
// Size: 0xbc
function soul_release(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval) {
        util::playfxontag(localclientnum, level._effect[#"hash_445a09d57b925de2"], self, "tag_origin");
        return;
    }
    util::playfxontag(localclientnum, level._effect[#"hash_22616c5de5b8bbf4"], self, "tag_origin");
}

