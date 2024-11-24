#using scripts\core_common\clientfield_shared;
#using scripts\core_common\postfx_shared;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;

#namespace namespace_b99141ed;

// Namespace namespace_b99141ed/namespace_5d2bf155
// Params 0, eflags: 0x1 linked
// Checksum 0x7ab361f6, Offset: 0xb8
// Size: 0x5c
function init_clientfields() {
    clientfield::register("toplayer", "" + #"hash_275c4e6783b917f8", 1, 1, "int", &function_9997d53a, 0, 0);
}

// Namespace namespace_b99141ed/namespace_5d2bf155
// Params 7, eflags: 0x1 linked
// Checksum 0xa9bf4e2c, Offset: 0x120
// Size: 0x8c
function function_9997d53a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval) {
        self playrumblelooponentity(localclientnum, "zm_escape_fast_travel");
        return;
    }
    self stoprumble(localclientnum, "zm_escape_fast_travel");
}

