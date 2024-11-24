#using scripts\core_common\system_shared;
#using scripts\weapons\bouncingbetty;

#namespace bouncingbetty;

// Namespace bouncingbetty/bouncingbetty
// Params 0, eflags: 0x2
// Checksum 0x56ab7bcf, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"bouncingbetty", &__init__, undefined, undefined);
}

// Namespace bouncingbetty/bouncingbetty
// Params 0, eflags: 0x1 linked
// Checksum 0xa674ee01, Offset: 0xc0
// Size: 0x22
function __init__() {
    init_shared();
    level.trackbouncingbettiesonowner = 1;
}

