// Atian COD Tools GSC decompiler test
#include scripts/zm_common/util.gsc;
#include scripts/weapons/weaponobjects.gsc;
#include scripts/core_common/weapons_shared.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/flagsys_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;
#include scripts/core_common/struct.gsc;

#namespace weaponobjects;

// Namespace weaponobjects/weaponobjects
// Params 0, eflags: 0x2
// Checksum 0xfd51a06f, Offset: 0xb0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"weaponobjects", &__init__, undefined, undefined);
}

// Namespace weaponobjects/weaponobjects
// Params 0, eflags: 0x1 linked
// Checksum 0x25998e16, Offset: 0xf8
// Size: 0x14
function __init__() {
    init_shared();
}

