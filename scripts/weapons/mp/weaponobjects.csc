// Atian COD Tools GSC decompiler test
#using scripts\weapons\weaponobjects.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\struct.csc;

#namespace weaponobjects;

// Namespace weaponobjects/weaponobjects
// Params 0, eflags: 0x2
// Checksum 0x5872329d, Offset: 0x128
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"weaponobjects", &__init__, undefined, undefined);
}

// Namespace weaponobjects/weaponobjects
// Params 0, eflags: 0x0
// Checksum 0xf62dd5aa, Offset: 0x170
// Size: 0x84
function __init__() {
    init_shared(sessionmodeiscampaigngame() ? #"rob_sonar_set_friendlyequip_cp" : #"rob_sonar_set_friendlyequip_mp", #"rob_sonar_set_enemyequip");
    level setupscriptmovercompassicons();
    level setupmissilecompassicons();
}

// Namespace weaponobjects/weaponobjects
// Params 0, eflags: 0x0
// Checksum 0x2ee9978, Offset: 0x200
// Size: 0x112
function setupscriptmovercompassicons() {
    if (!isdefined(level.scriptmovercompassicons)) {
        level.scriptmovercompassicons = [];
    }
    level.scriptmovercompassicons[#"wpn_t7_turret_emp_core"] = "compass_empcore_white";
    level.scriptmovercompassicons[#"t6_wpn_turret_ads_world"] = "compass_guardian_white";
    level.scriptmovercompassicons[#"veh_t7_drone_uav_enemy_vista"] = "compass_uav";
    level.scriptmovercompassicons[#"veh_t7_mil_vtol_fighter_mp"] = "compass_lightningstrike";
    level.scriptmovercompassicons[#"veh_t7_drone_rolling_thunder"] = "compass_lodestar";
    level.scriptmovercompassicons[#"veh_t7_drone_srv_blimp"] = "t7_hud_minimap_hatr";
}

// Namespace weaponobjects/weaponobjects
// Params 0, eflags: 0x0
// Checksum 0x1b5cbcd0, Offset: 0x320
// Size: 0x7a
function setupmissilecompassicons() {
    if (!isdefined(level.missilecompassicons)) {
        level.missilecompassicons = [];
    }
    if (isdefined(getweapon(#"drone_strike"))) {
        level.missilecompassicons[getweapon(#"drone_strike")] = "compass_lodestar";
    }
}

