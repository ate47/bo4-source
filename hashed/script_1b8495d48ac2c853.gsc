// Atian COD Tools GSC decompiler test
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_ba52581a;

// Namespace namespace_ba52581a/namespace_ba52581a
// Params 0, eflags: 0x2
// Checksum 0xe1c9ab16, Offset: 0x98
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_14819f0ef5a24379", &__init__, undefined, undefined);
}

// Namespace namespace_ba52581a/namespace_ba52581a
// Params 0, eflags: 0x1 linked
// Checksum 0x93f35d1e, Offset: 0xe0
// Size: 0x14
function __init__() {
    init_clientfields();
}

// Namespace namespace_ba52581a/namespace_ba52581a
// Params 0, eflags: 0x1 linked
// Checksum 0x564ea0c2, Offset: 0x100
// Size: 0x5c
function init_clientfields() {
    clientfield::register("toplayer", "" + #"hash_7eefa4acee4c1d55", 1, 1, "counter", &function_f90464da, 0, 0);
}

// Namespace namespace_ba52581a/namespace_ba52581a
// Params 7, eflags: 0x1 linked
// Checksum 0xf0db7e, Offset: 0x168
// Size: 0xfc
function function_f90464da(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self endon(#"death");
    if (newval) {
        if (isdefined(self)) {
            self playrumbleonentity(localclientnum, #"hash_38a12b73c9342fd9");
        }
        wait(0.3);
        if (isdefined(self)) {
            self playrumbleonentity(localclientnum, #"hash_38a12b73c9342fd9");
        }
        wait(0.3);
        if (isdefined(self)) {
            self playrumbleonentity(localclientnum, #"hash_38a12b73c9342fd9");
        }
    }
}

