#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_bgb;
#using scripts\zm_common\zm_stats;

#namespace zm_bgb_aftertaste;

// Namespace zm_bgb_aftertaste/zm_bgb_aftertaste
// Params 0, eflags: 0x2
// Checksum 0x9c448f6a, Offset: 0x88
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"zm_bgb_aftertaste", &__init__, undefined, #"bgb" );
}

// Namespace zm_bgb_aftertaste/zm_bgb_aftertaste
// Params 0
// Checksum 0x190bd021, Offset: 0xd8
// Size: 0xbc
function __init__()
{
    if ( !( isdefined( level.bgb_in_use ) && level.bgb_in_use ) )
    {
        return;
    }
    
    bgb::register( #"zm_bgb_aftertaste", "event", &event, undefined, undefined, undefined );
    bgb::register_lost_perk_override( #"zm_bgb_aftertaste", &lost_perk_override, 0 );
    bgb::function_1fee6b3( #"zm_bgb_aftertaste", 3 );
}

// Namespace zm_bgb_aftertaste/zm_bgb_aftertaste
// Params 3
// Checksum 0x6d299f9e, Offset: 0x1a0
// Size: 0x8a
function lost_perk_override( perk, var_a83ac70f = undefined, var_6c1b825d = undefined )
{
    if ( isdefined( var_a83ac70f ) && isdefined( var_6c1b825d ) && var_a83ac70f == var_6c1b825d )
    {
        var_a83ac70f zm_stats::increment_challenge_stat( #"hash_19d6a97f1553f96f" );
        return 1;
    }
    
    return 0;
}

// Namespace zm_bgb_aftertaste/zm_bgb_aftertaste
// Params 0
// Checksum 0xd4aca51c, Offset: 0x238
// Size: 0x84
function event()
{
    self endon( #"disconnect", #"bled_out", #"bgb_update" );
    self thread bgb::run_timer( 300 );
    self waittilltimeout( 300, #"player_revived" );
    self bgb::do_one_shot_use( 1 );
}

