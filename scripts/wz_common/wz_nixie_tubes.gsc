#using script_cb32d07c95e5628;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\flagsys_shared;
#using scripts\core_common\player\player_stats;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\values_shared;
#using scripts\mp_common\item_world;

#namespace wz_nixie_tubes;

// Namespace wz_nixie_tubes/wz_nixie_tubes
// Params 0, eflags: 0x2
// Checksum 0xca54cb01, Offset: 0xe0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"wz_nixie_tubes", &__init__, undefined, undefined);
}

// Namespace wz_nixie_tubes/wz_nixie_tubes
// Params 0, eflags: 0x0
// Checksum 0xa84bafd6, Offset: 0x128
// Size: 0x124
function __init__() {
    level.var_f64d56a1 = (isdefined(getgametypesetting(#"hash_11b79ec2ffb886c8")) ? getgametypesetting(#"hash_11b79ec2ffb886c8") : 0) || (isdefined(getgametypesetting(#"hash_697d65a68cc6c6f1")) ? getgametypesetting(#"hash_697d65a68cc6c6f1") : 0);
    nixie_tube_cage = getdynent("nixie_tube_cage");
    if (!(isdefined(level.var_f64d56a1) && level.var_f64d56a1)) {
        if (isdefined(nixie_tube_cage)) {
            setdynentstate(nixie_tube_cage, 3);
        }
    }
    level thread function_5f309cfb();
}

// Namespace wz_nixie_tubes/wz_nixie_tubes
// Params 0, eflags: 0x0
// Checksum 0x321744c, Offset: 0x258
// Size: 0x8c
function function_5f309cfb() {
    level flagsys::wait_till(#"hash_507a4486c4a79f1d");
    waitframe(1);
    nixie_tube_cage = getdynent("nixie_tube_cage");
    if (!(isdefined(level.var_f64d56a1) && level.var_f64d56a1)) {
        if (isdefined(nixie_tube_cage)) {
            setdynentstate(nixie_tube_cage, 3);
        }
    }
}

