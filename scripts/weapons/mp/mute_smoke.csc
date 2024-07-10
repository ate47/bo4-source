#using scripts\weapons\mute_smoke.csc;
#using scripts\core_common\system_shared.csc;

#namespace mute_smoke;

// Namespace mute_smoke/mute_smoke
// Params 0, eflags: 0x2
// Checksum 0xffd81b72, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"mute_smoke", &__init__, undefined, undefined);
}

// Namespace mute_smoke/mute_smoke
// Params 0, eflags: 0x1 linked
// Checksum 0xe53ee743, Offset: 0xc0
// Size: 0x14
function __init__() {
    init_shared();
}

