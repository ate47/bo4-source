#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\struct;

#namespace zm_hero_weapon;

// Namespace zm_hero_weapon/zm_hero_weapon
// Params 0, eflags: 0x2
// Checksum 0x77b3c25d, Offset: 0x128
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_hero_weapons", &__init__, undefined, undefined);
}

// Namespace zm_hero_weapon/zm_hero_weapon
// Params 0, eflags: 0x1 linked
// Checksum 0x4ccb3e15, Offset: 0x170
// Size: 0x11c
function __init__() {
    clientfield::register("clientuimodel", "zmhud.weaponLevel", 1, 2, "int", undefined, 0, 0);
    clientfield::register("clientuimodel", "zmhud.weaponProgression", 1, 5, "float", undefined, 0, 0);
    clientfield::register("clientuimodel", "zmhud.swordEnergy", 1, 7, "float", undefined, 0, 0);
    clientfield::register("clientuimodel", "zmhud.swordState", 1, 4, "int", undefined, 0, 0);
    clientfield::register("clientuimodel", "zmhud.swordChargeUpdate", 1, 1, "counter", undefined, 0, 0);
}

