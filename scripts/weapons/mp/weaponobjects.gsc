#using script_6b221588ece2c4aa;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flagsys_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\weapons_shared;
#using scripts\mp_common\util;
#using scripts\weapons\weaponobjects;

#namespace weaponobjects;

// Namespace weaponobjects/weaponobjects
// Params 0, eflags: 0x2
// Checksum 0x75601a95, Offset: 0xb8
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"weaponobjects", &__init__, undefined, undefined );
}

// Namespace weaponobjects/weaponobjects
// Params 0
// Checksum 0x950cd938, Offset: 0x100
// Size: 0x34
function __init__()
{
    init_shared();
    callback::on_start_gametype( &start_gametype );
}

// Namespace weaponobjects/weaponobjects
// Params 0
// Checksum 0xeb4a9e27, Offset: 0x140
// Size: 0x44
function start_gametype()
{
    callback::on_connect( &on_player_connect );
    callback::on_spawned( &on_player_spawned );
}

// Namespace weaponobjects/weaponobjects
// Params 0
// Checksum 0x80f724d1, Offset: 0x190
// Size: 0x4
function on_player_spawned()
{
    
}

