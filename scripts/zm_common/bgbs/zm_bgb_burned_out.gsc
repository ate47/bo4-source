#using scripts\core_common\array_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\zm_bgb;
#using scripts\zm_common\zm_stats;
#using scripts\zm_common\zm_utility;

#namespace zm_bgb_burned_out;

// Namespace zm_bgb_burned_out/zm_bgb_burned_out
// Params 0, eflags: 0x2
// Checksum 0xaf93a916, Offset: 0x148
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"zm_bgb_burned_out", &__init__, undefined, #"bgb" );
}

// Namespace zm_bgb_burned_out/zm_bgb_burned_out
// Params 0
// Checksum 0x4c1dbf2b, Offset: 0x198
// Size: 0x164
function __init__()
{
    if ( !( isdefined( level.bgb_in_use ) && level.bgb_in_use ) )
    {
        return;
    }
    
    bgb::register( #"zm_bgb_burned_out", "event", &event, undefined, undefined, undefined );
    clientfield::register( "toplayer", "zm_bgb_burned_out" + "_1p" + "toplayer", 1, 1, "counter" );
    clientfield::register( "allplayers", "zm_bgb_burned_out" + "_3p" + "_allplayers", 1, 1, "counter" );
    clientfield::register( "actor", "zm_bgb_burned_out" + "_fire_torso" + "_actor", 1, 1, "counter" );
    clientfield::register( "vehicle", "zm_bgb_burned_out" + "_fire_torso" + "_vehicle", 1, 1, "counter" );
}

// Namespace zm_bgb_burned_out/zm_bgb_burned_out
// Params 0
// Checksum 0xf73b4fc2, Offset: 0x308
// Size: 0x180
function event()
{
    self endon( #"disconnect", #"bgb_update" );
    limit_count = 0;
    self thread bgb::set_timer( 3, 3 );
    
    for ( ;; )
    {
        waitresult = self waittill( #"damage", #"damage_armor" );
        type = waitresult.mod;
        attacker = waitresult.attacker;
        
        if ( "MOD_MELEE" != type || !isai( attacker ) )
        {
            continue;
        }
        
        self thread result();
        self playsound( #"zmb_bgb_powerup_burnedout" );
        limit_count++;
        self thread bgb::set_timer( 3 - limit_count, 3 );
        self bgb::do_one_shot_use();
        
        if ( 3 <= limit_count )
        {
            return;
        }
        
        wait 1.5;
    }
}

// Namespace zm_bgb_burned_out/zm_bgb_burned_out
// Params 0
// Checksum 0x22f8524d, Offset: 0x490
// Size: 0x3c6
function result()
{
    self clientfield::increment_to_player( "zm_bgb_burned_out" + "_1p" + "toplayer" );
    self clientfield::increment( "zm_bgb_burned_out" + "_3p" + "_allplayers" );
    zombies = array::get_all_closest( self.origin, getaiteamarray( level.zombie_team ), undefined, undefined, 128 );
    
    if ( !isdefined( zombies ) )
    {
        return;
    }
    
    dist_sq = 128 * 128;
    zombies_burned_out = [];
    
    for ( i = 0; i < zombies.size ; i++ )
    {
        if ( zombies[ i ].zm_ai_category !== #"basic" && zombies[ i ].zm_ai_category !== #"popcorn" && zombies[ i ].zm_ai_category !== #"enhanced" )
        {
            continue;
        }
        
        if ( isdefined( zombies[ i ].ignore_nuke ) && zombies[ i ].ignore_nuke )
        {
            continue;
        }
        
        if ( isdefined( zombies[ i ].marked_for_death ) && zombies[ i ].marked_for_death )
        {
            continue;
        }
        
        if ( zm_utility::is_magic_bullet_shield_enabled( zombies[ i ] ) )
        {
            continue;
        }
        
        zombies[ i ].marked_for_death = 1;
        
        if ( !isalive( zombies[ i ] ) )
        {
            continue;
        }
        
        if ( isvehicle( zombies[ i ] ) )
        {
            zombies[ i ] clientfield::increment( "zm_bgb_burned_out" + "_fire_torso" + "_vehicle" );
        }
        else
        {
            zombies[ i ] clientfield::increment( "zm_bgb_burned_out" + "_fire_torso" + "_actor" );
        }
        
        zombies_burned_out[ zombies_burned_out.size ] = zombies[ i ];
    }
    
    for ( i = 0; i < zombies_burned_out.size ; i++ )
    {
        util::wait_network_frame();
        
        if ( !isdefined( zombies_burned_out[ i ] ) )
        {
            continue;
        }
        
        if ( zm_utility::is_magic_bullet_shield_enabled( zombies_burned_out[ i ] ) )
        {
            continue;
        }
        
        zombies_burned_out[ i ] dodamage( zombies_burned_out[ i ].health + 666, zombies_burned_out[ i ].origin, self, undefined, undefined, "MOD_BURNED", 0, level.weapondefault );
        
        if ( isdefined( self ) )
        {
            self zm_stats::increment_challenge_stat( #"gum_gobbler_burned_out" );
        }
    }
}

