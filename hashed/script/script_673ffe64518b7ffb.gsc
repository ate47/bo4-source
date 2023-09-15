// Atian COD Tools GSC decompiler test
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace namespace_f2502da8;

// Namespace namespace_f2502da8/namespace_f2502da8
// Params 0, eflags: 0x1 linked
// Checksum 0x4f45d32e, Offset: 0xa8
// Size: 0x32
function init_fx() {
    level._effect[#"hash_46085f7d2bcd82c5"] = #"hash_404575a78667befd";
}

// Namespace namespace_f2502da8/namespace_f2502da8
// Params 0, eflags: 0x1 linked
// Checksum 0x9021423f, Offset: 0xe8
// Size: 0xb4
function init_clientfields() {
    clientfield::register("scriptmover", "" + #"hash_144c7c2895ed95c", 1, 1, "int", &function_a3874ae0, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_48f1f50c412d80c7", 1, 1, "counter", &function_1fe913e0, 0, 0);
}

// Namespace namespace_f2502da8/namespace_f2502da8
// Params 7, eflags: 0x1 linked
// Checksum 0x54e823f7, Offset: 0x1a8
// Size: 0xaa
function function_a3874ae0(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self.n_fx_id)) {
        killfx(localclientnum, self.n_fx_id);
    }
    if (newval) {
        self.n_fx_id = util::playfxontag(localclientnum, level._effect[#"hash_46085f7d2bcd82c5"], self, "tag_origin");
    }
}

// Namespace namespace_f2502da8/namespace_f2502da8
// Params 7, eflags: 0x1 linked
// Checksum 0x5c62dede, Offset: 0x260
// Size: 0x64
function function_1fe913e0(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self playrumbleonentity(localclientnum, #"zm_escape_catwalk_door");
}

