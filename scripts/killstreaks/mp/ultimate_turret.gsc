#using scripts\core_common\player\player_stats;
#using scripts\core_common\system_shared;
#using scripts\killstreaks\ultimate_turret_shared;
#using scripts\mp_common\gametypes\battlechatter;
#using scripts\mp_common\gametypes\globallogic_audio;

#namespace ultimate_turret;

// Namespace ultimate_turret/ultimate_turret
// Params 0, eflags: 0x2
// Checksum 0xe343f3b, Offset: 0xb0
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"ultimate_turret", &__init__, undefined, #"killstreaks" );
}

// Namespace ultimate_turret/ultimate_turret
// Params 0
// Checksum 0x2d25cfe9, Offset: 0x100
// Size: 0x4c
function __init__()
{
    level.var_729a0937 = &function_4b645b3f;
    level.var_bbc796bf = &turret_destroyed;
    init_shared();
}

// Namespace ultimate_turret/ultimate_turret
// Params 1
// Checksum 0x7e90efae, Offset: 0x158
// Size: 0x2c
function function_4b645b3f( killstreaktype )
{
    self globallogic_audio::play_taacom_dialog( "timeout", killstreaktype );
}

// Namespace ultimate_turret/ultimate_turret
// Params 2
// Checksum 0x5d80bd50, Offset: 0x190
// Size: 0x6e
function turret_destroyed( attacker, weapon )
{
    profilestart();
    
    if ( isdefined( attacker ) )
    {
        attacker battlechatter::function_dd6a6012( "ultimate_turret", weapon );
        attacker stats::function_e24eec31( weapon, #"hash_3f3d8a93c372c67d", 1 );
    }
    
    profilestop();
}

