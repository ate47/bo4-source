// Atian COD Tools GSC decompiler test
#using scripts\core_common\system_shared.csc;
#using scripts\killstreaks\remotemissile_shared.csc;

#namespace remotemissile;

// Namespace remotemissile/remotemissile
// Params 0, eflags: 0x2
// Checksum 0xfa23f5c8, Offset: 0x78
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"remotemissile", &__init__, undefined, #"killstreaks");
}

// Namespace remotemissile/remotemissile
// Params 0, eflags: 0x1 linked
// Checksum 0x656b5eb6, Offset: 0xc8
// Size: 0x14
function __init__() {
    init_shared();
}

