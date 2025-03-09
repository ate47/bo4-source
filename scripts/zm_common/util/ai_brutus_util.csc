#using scripts\core_common\ai\archetype_brutus;
#using scripts\core_common\ai_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\zm\ai\zm_ai_brutus;

#namespace zombie_brutus_util;

// Namespace zombie_brutus_util/ai_brutus_util
// Params 0, eflags: 0x2
// Checksum 0xc892978, Offset: 0xd8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zombie_brutus_util", &__init__, undefined, undefined);
}

// Namespace zombie_brutus_util/ai_brutus_util
// Params 0, eflags: 0x0
// Checksum 0x4305c72, Offset: 0x120
// Size: 0x4c
function __init__() {
    clientfield::register("actor", "brutus_lock_down", 1, 1, "int", &function_6f198c81, 0, 0);
}

// Namespace zombie_brutus_util/ai_brutus_util
// Params 7, eflags: 0x0
// Checksum 0xeb380bad, Offset: 0x178
// Size: 0xbc
function function_6f198c81(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (bwasdemojump) {
        return;
    }
    if (bnewent) {
        println("<dev string:x38>");
    }
    if (binitialsnap) {
        println("<dev string:x47>");
    }
    playrumbleonposition(localclientnum, "explosion_generic", self.origin);
}

