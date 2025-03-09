#using scripts\core_common\array_shared;
#using scripts\core_common\beam_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\postfx_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\zm_utility;

#namespace zm_weap_spear_shield;

// Namespace zm_weap_spear_shield/zm_weap_spear_shield
// Params 0, eflags: 0x2
// Checksum 0x58b3eae8, Offset: 0xa8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_weap_spear_shield", &__init__, &__main__, undefined);
}

// Namespace zm_weap_spear_shield/zm_weap_spear_shield
// Params 0, eflags: 0x0
// Checksum 0x56d9d7bd, Offset: 0xf8
// Size: 0x7e
function __init__() {
    level.var_96059a93 = getweapon(#"zhield_zpear_dw");
    level.var_85ed93f4 = getweapon(#"zhield_zpear_lh");
    level.var_ce3aa8a8 = getweapon(#"zhield_zpear_turret");
}

// Namespace zm_weap_spear_shield/zm_weap_spear_shield
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0x180
// Size: 0x4
function __main__() {
    
}

