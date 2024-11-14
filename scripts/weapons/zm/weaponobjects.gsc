#using scripts\zm_common\util;
#using scripts\weapons\weaponobjects;
#using scripts\core_common\weapons_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\flagsys_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\struct;

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

