// Atian COD Tools GSC decompiler test
#include scripts/weapons/bouncingbetty.csc;
#include scripts/core_common/system_shared.csc;

#namespace bouncingbetty;

// Namespace bouncingbetty/zm_weap_bouncingbetty
// Params 0, eflags: 0x2
// Checksum 0x3facd997, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"bouncingbetty", &__init__, undefined, undefined);
}

// Namespace bouncingbetty/zm_weap_bouncingbetty
// Params 0, eflags: 0x0
// Checksum 0xfdce78cc, Offset: 0xc0
// Size: 0x14
function __init__() {
    init_shared();
}

