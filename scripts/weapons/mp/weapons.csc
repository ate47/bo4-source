#using scripts\weapons\weapons.csc;
#using scripts\core_common\system_shared.csc;

#namespace weapons;

// Namespace weapons/weapons
// Params 0, eflags: 0x2
// Checksum 0x1e138a19, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"weapons", &__init__, undefined, undefined);
}

// Namespace weapons/weapons
// Params 0, eflags: 0x0
// Checksum 0x3dc2904e, Offset: 0xc0
// Size: 0x14
function __init__() {
    init_shared();
}

