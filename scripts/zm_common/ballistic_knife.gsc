#using scripts\zm_common\zm_player;
#using scripts\zm_common\zm_laststand;
#using scripts\zm_common\zm;
#using scripts\weapons\weaponobjects;
#using scripts\weapons\ballistic_knife;
#using scripts\core_common\array_shared;
#using scripts\core_common\laststand_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\struct;

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

