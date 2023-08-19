// Atian COD Tools GSC decompiler test
#include scripts/weapons/bouncingbetty.csc;
#include scripts/core_common/system_shared.csc;

#namespace bouncingbetty;

// Namespace bouncingbetty/bouncingbetty
// Params 0, eflags: 0x2
// Checksum 0x282ce923, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"bouncingbetty", &__init__, undefined, undefined);
}

// Namespace bouncingbetty/bouncingbetty
// Params 0, eflags: 0x1 linked
// Checksum 0xb065d309, Offset: 0xc0
// Size: 0x14
function __init__() {
    init_shared();
}

