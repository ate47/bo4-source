#using scripts\core_common\system_shared;
#using scripts\weapons\shockrifle;

#namespace shockrifle;

// Namespace shockrifle/shockrifle
// Params 0, eflags: 0x2
// Checksum 0x5188b1ab, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"shockrifle", &__init__, undefined, undefined);
}

// Namespace shockrifle/shockrifle
// Params 0, eflags: 0x0
// Checksum 0x7bef3c44, Offset: 0xc0
// Size: 0x14
function __init__() {
    init_shared();
}

