// Atian COD Tools GSC decompiler test
#include scripts/weapons/riotshield.csc;
#include scripts/core_common/system_shared.csc;

#namespace riotshield;

// Namespace riotshield/riotshield
// Params 0, eflags: 0x2
// Checksum 0xb1530980, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"riotshield", &__init__, undefined, undefined);
}

// Namespace riotshield/riotshield
// Params 0, eflags: 0x1 linked
// Checksum 0x6617e761, Offset: 0xc0
// Size: 0x14
function __init__() {
    init_shared();
}

