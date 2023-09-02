// Atian COD Tools GSC decompiler test
#using scripts\core_common\clientfield_shared.csc;

#namespace namespace_7d8e6ec3;

// Namespace namespace_7d8e6ec3/namespace_7d8e6ec3
// Params 0, eflags: 0x1 linked
// Checksum 0x6ef171a, Offset: 0x88
// Size: 0x14
function preload() {
    init_clientfields();
}

// Namespace namespace_7d8e6ec3/namespace_7d8e6ec3
// Params 0, eflags: 0x1 linked
// Checksum 0xde59fe20, Offset: 0xa8
// Size: 0x5c
function init_clientfields() {
    clientfield::register("toplayer", "" + #"hash_33c373888aa78dc2", 20000, 1, "counter", &function_e67464c1, 0, 0);
}

// Namespace namespace_7d8e6ec3/namespace_7d8e6ec3
// Params 7, eflags: 0x1 linked
// Checksum 0x881b2d84, Offset: 0x110
// Size: 0x6c
function function_e67464c1(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self playrumbleonentity(localclientnum, #"hash_38a12b73c9342fd9");
    }
}

