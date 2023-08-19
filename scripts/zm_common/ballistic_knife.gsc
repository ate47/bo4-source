// Atian COD Tools GSC decompiler test
#include scripts/zm_common/zm_player.gsc;
#include scripts/zm_common/zm_laststand.gsc;
#include scripts/zm_common/zm.gsc;
#include scripts/weapons/weaponobjects.gsc;
#include scripts/weapons/ballistic_knife.gsc;
#include scripts/core_common/array_shared.gsc;
#include scripts/core_common/laststand_shared.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;
#include scripts/core_common/struct.gsc;

#namespace ballistic_knife;

// Namespace ballistic_knife/ballistic_knife
// Params 0, eflags: 0x2
// Checksum 0xd54b450d, Offset: 0xc0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"ballistic_knife", &__init__, undefined, undefined);
}

// Namespace ballistic_knife/ballistic_knife
// Params 0, eflags: 0x1 linked
// Checksum 0xf29a06f1, Offset: 0x108
// Size: 0x14
function __init__() {
    init_shared();
}

