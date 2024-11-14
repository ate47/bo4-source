#using scripts\core_common\util_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\clientfield_shared;

#namespace decoygrenade;

// Namespace decoygrenade/decoy_grenade
// Params 0, eflags: 0x2
// Checksum 0xeb7ee462, Offset: 0xb0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"decoygrenade", &__init__, undefined, undefined);
}

// Namespace decoygrenade/decoy_grenade
// Params 0, eflags: 0x0
// Checksum 0x8f3d22f3, Offset: 0xf8
// Size: 0x4c
function __init__() {
    clientfield::register("missile", "decoy_grenade_footsteps", 1, 1, "int", &function_52b6cd8b, 0, 0);
}

// Namespace decoygrenade/decoy_grenade
// Params 7, eflags: 0x0
// Checksum 0x1253dca7, Offset: 0x150
// Size: 0x74
function function_52b6cd8b(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump) {
    if (newvalue == 1 && newvalue !== oldvalue) {
        self monitor_footsteps(localclientnum);
    }
}

// Namespace decoygrenade/decoy_grenade
// Params 1, eflags: 0x0
// Checksum 0xabe72f71, Offset: 0x1d0
// Size: 0x60
function monitor_footsteps(localclientnum) {
    while (clientfield::get("decoy_grenade_footsteps") === 1) {
        self playsound(localclientnum, #"hash_4990634cec4a1aff");
        wait 0.23;
    }
}

