// Atian COD Tools GSC decompiler test
#include scripts/core_common/ai/archetype_brutus.csc;
#include scripts/zm/ai/zm_ai_brutus.csc;
#include scripts/core_common/clientfield_shared.csc;
#include scripts/core_common/system_shared.csc;
#include scripts/core_common/struct.csc;
#include scripts/core_common/array_shared.csc;
#include scripts/core_common/ai_shared.csc;

#namespace zombie_brutus_util;

// Namespace zombie_brutus_util/namespace_f623d0ec
// Params 0, eflags: 0x2
// Checksum 0xc892978, Offset: 0xd8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zombie_brutus_util", &__init__, undefined, undefined);
}

// Namespace zombie_brutus_util/namespace_f623d0ec
// Params 0, eflags: 0x1 linked
// Checksum 0x4305c72, Offset: 0x120
// Size: 0x4c
function __init__() {
    clientfield::register("actor", "brutus_lock_down", 1, 1, "int", &function_6f198c81, 0, 0);
}

// Namespace zombie_brutus_util/namespace_f623d0ec
// Params 7, eflags: 0x1 linked
// Checksum 0xeb380bad, Offset: 0x178
// Size: 0xbc
function function_6f198c81(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (bwasdemojump) {
        return;
    }
    if (bnewent) {
        /#
            println("<unknown string>");
        #/
    }
    if (binitialsnap) {
        /#
            println("<unknown string>");
        #/
    }
    playrumbleonposition(localclientnum, "explosion_generic", self.origin);
}
