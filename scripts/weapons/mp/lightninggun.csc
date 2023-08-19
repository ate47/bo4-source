// Atian COD Tools GSC decompiler test
#include scripts/weapons/lightninggun.csc;
#include scripts/core_common/system_shared.csc;

#namespace lightninggun;

// Namespace lightninggun/lightninggun
// Params 0, eflags: 0x2
// Checksum 0xbc751c4e, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"lightninggun", &__init__, undefined, undefined);
}

// Namespace lightninggun/lightninggun
// Params 0, eflags: 0x1 linked
// Checksum 0x395329ca, Offset: 0xc0
// Size: 0x14
function __init__() {
    init_shared();
}

