#using scripts\core_common\flag_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\zm_bgb;
#using scripts\zm_common\zm_laststand;
#using scripts\zm_common\zm_perks;
#using scripts\zm_common\zm_powerups;
#using scripts\zm_common\zm_stats;
#using scripts\zm_common\zm_utility;

#namespace zm_bgb_phoenix_up;

// Namespace zm_bgb_phoenix_up/zm_bgb_phoenix_up
// Params 0, eflags: 0x2
// Checksum 0x2aa8148a, Offset: 0xc8
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"zm_bgb_phoenix_up", &__init__, undefined, #"bgb" );
}

// Namespace zm_bgb_phoenix_up/zm_bgb_phoenix_up
// Params 0
// Checksum 0xa010f53e, Offset: 0x118
// Size: 0xac
function __init__()
{
    if ( !( isdefined( level.bgb_in_use ) && level.bgb_in_use ) )
    {
        return;
    }
    
    bgb::register( #"zm_bgb_phoenix_up", "activated", 1, undefined, undefined, &validation, &activation );
    bgb::register_lost_perk_override( #"zm_bgb_phoenix_up", &lost_perk_override, 1 );
}

// Namespace zm_bgb_phoenix_up/zm_bgb_phoenix_up
// Params 0
// Checksum 0x32764bf1, Offset: 0x1d0
// Size: 0x10a, Type: bool
function validation()
{
    players = level.players;
    
    foreach ( player in players )
    {
        if ( isdefined( player.var_bdeb0f02 ) && player.var_bdeb0f02 )
        {
            return false;
        }
        
        if ( isdefined( level.var_7d8a0369 ) && self [[ level.var_7d8a0369 ]]( player, 1, 1 ) )
        {
            return true;
        }
        
        if ( self zm_laststand::can_revive( player, 1, 1 ) )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace zm_bgb_phoenix_up/zm_bgb_phoenix_up
// Params 0
// Checksum 0xa55bc942, Offset: 0x2e8
// Size: 0x170
function activation()
{
    playsoundatposition( #"zmb_bgb_phoenix_activate", ( 0, 0, 0 ) );
    players = level.players;
    
    foreach ( player in players )
    {
        can_revive = 0;
        
        if ( isdefined( level.var_7d8a0369 ) && self [[ level.var_7d8a0369 ]]( player, 1, 1 ) )
        {
            can_revive = 1;
        }
        else if ( self zm_laststand::can_revive( player, 1, 1 ) )
        {
            can_revive = 1;
        }
        
        if ( can_revive )
        {
            player thread bgb::bgb_revive_watcher();
            player zm_laststand::auto_revive( self );
            self zm_stats::increment_challenge_stat( #"gum_gobbler_phoenix_up" );
        }
    }
}

// Namespace zm_bgb_phoenix_up/zm_bgb_phoenix_up
// Params 3
// Checksum 0x5c8421bc, Offset: 0x460
// Size: 0x66, Type: bool
function lost_perk_override( perk, var_a83ac70f = undefined, var_6c1b825d = undefined )
{
    self thread zm_perks::function_b2dfd295( perk, &bgb::function_bd839f2c );
    return false;
}

