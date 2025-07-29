#using scripts\core_common\ai\systems\gib;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\player\player_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\callbacks;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_hero_weapon;
#using scripts\zm_common\zm_loadout;
#using scripts\zm_common\zm_net;
#using scripts\zm_common\zm_score;
#using scripts\zm_common\zm_utility;

#namespace zm_armor;

// Namespace zm_armor/zm_armor
// Params 0, eflags: 0x2
// Checksum 0x612beaed, Offset: 0xd8
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zm_armor", &__init__, undefined, undefined );
}

// Namespace zm_armor/zm_armor
// Params 0
// Checksum 0x2c64099d, Offset: 0x120
// Size: 0x24
function __init__()
{
    callback::on_connect( &on_connect );
}

// Namespace zm_armor/zm_armor
// Params 0
// Checksum 0x812b01da, Offset: 0x150
// Size: 0x1c
function on_connect()
{
    self thread function_49f4b6ee();
}

// Namespace zm_armor/zm_armor
// Params 2
// Checksum 0x3286ef6e, Offset: 0x178
// Size: 0xa6
function register( var_7c8fcded, is_permanent = 1 )
{
    if ( !isdefined( level.var_9555ebfb ) )
    {
        level.var_9555ebfb = [];
    }
    else if ( !isarray( level.var_9555ebfb ) )
    {
        level.var_9555ebfb = array( level.var_9555ebfb );
    }
    
    level.var_9555ebfb[ var_7c8fcded ] = is_permanent;
}

// Namespace zm_armor/zm_armor
// Params 0
// Checksum 0xa84b8bb8, Offset: 0x228
// Size: 0x136
function function_49f4b6ee()
{
    self.var_9555ebfb = [];
    a_keys = getarraykeys( level.var_9555ebfb );
    
    foreach ( key in a_keys )
    {
        if ( level.var_9555ebfb[ key ] )
        {
            self.var_9555ebfb[ key ] = 0;
        }
    }
    
    foreach ( key in a_keys )
    {
        if ( !level.var_9555ebfb[ key ] )
        {
            self.var_9555ebfb[ key ] = 0;
        }
    }
}

// Namespace zm_armor/zm_armor
// Params 4
// Checksum 0xd4ae85d9, Offset: 0x368
// Size: 0x13e
function add( var_7c8fcded, var_3ed63752, var_28066539, var_df7ee5d1 = #"hash_2082da6662372184" )
{
    var_4812bba2 = 0;
    
    if ( isdefined( var_28066539 ) )
    {
        var_d7de78d3 = var_28066539 - self get( var_7c8fcded );
        
        if ( var_3ed63752 <= var_d7de78d3 )
        {
            self.armor += var_3ed63752;
            var_4812bba2 = var_3ed63752;
        }
        else
        {
            self.armor += var_d7de78d3;
            var_4812bba2 = var_d7de78d3;
        }
    }
    else
    {
        self.armor += var_3ed63752;
        var_4812bba2 = var_3ed63752;
    }
    
    if ( var_4812bba2 > 0 )
    {
        self playsound( var_df7ee5d1 );
    }
    
    var_4812bba2 += self get( var_7c8fcded );
    self.var_9555ebfb[ var_7c8fcded ] = var_4812bba2;
}

// Namespace zm_armor/zm_armor
// Params 2
// Checksum 0xdeacff90, Offset: 0x4b0
// Size: 0x1de
function remove( var_7c8fcded, var_2cd89ceb = 0 )
{
    if ( isdefined( self.var_9555ebfb[ var_7c8fcded ] ) && self.var_9555ebfb[ var_7c8fcded ] > 0 )
    {
        if ( var_2cd89ceb )
        {
            self.armor -= self.var_9555ebfb[ var_7c8fcded ];
            a_keys = getarraykeys( level.var_9555ebfb );
            var_d42adc5 = 0;
            
            foreach ( key in a_keys )
            {
                if ( key !== var_7c8fcded && ( level.var_9555ebfb[ key ] || isdefined( self.var_bacee63b ) && self.var_bacee63b && key == #"hero_weapon_armor" ) )
                {
                    var_d42adc5 += get( key );
                }
            }
            
            var_d42adc5 = min( var_d42adc5, 100 );
            self.armor = int( max( var_d42adc5, self.armor ) );
        }
        
        self.var_9555ebfb[ var_7c8fcded ] = 0;
    }
}

// Namespace zm_armor/zm_armor
// Params 1
// Checksum 0xc77d5107, Offset: 0x698
// Size: 0x30
function get( var_7c8fcded )
{
    if ( isdefined( self.var_9555ebfb[ var_7c8fcded ] ) )
    {
        return self.var_9555ebfb[ var_7c8fcded ];
    }
    
    return 0;
}

// Namespace zm_armor/zm_armor
// Params 3
// Checksum 0x637fce26, Offset: 0x6d0
// Size: 0x312
function damage( n_damage, mod_type, e_attacker )
{
    if ( self.armor <= 0 )
    {
        return n_damage;
    }
    
    var_ee47fd1b = int( self.armor * 2 );
    a_keys = getarraykeys( self.var_9555ebfb );
    
    if ( n_damage > var_ee47fd1b )
    {
        foreach ( key in a_keys )
        {
            self remove( key, 1 );
        }
        
        self.armor = 0;
        self playsound( #"hash_2817ca3f96127e62" );
        return ( n_damage - var_ee47fd1b );
    }
    
    if ( n_damage > 0 )
    {
        var_ee47fd1b = int( max( 1, n_damage / 2 ) );
    }
    else
    {
        var_ee47fd1b = 0;
    }
    
    self.armor -= var_ee47fd1b;
    var_c5aebd9f = 0;
    
    for ( n_index = 0; var_c5aebd9f < var_ee47fd1b && n_index < a_keys.size ; n_index++ )
    {
        str_armor = a_keys[ n_index ];
        var_2a0d4230 = self get( str_armor );
        
        if ( var_2a0d4230 > var_ee47fd1b )
        {
            var_34ada56f = var_2a0d4230 - var_ee47fd1b - var_c5aebd9f;
            self.var_9555ebfb[ str_armor ] = var_34ada56f;
            var_c5aebd9f += var_ee47fd1b;
            n_index++;
            continue;
        }
        
        if ( var_2a0d4230 > 0 )
        {
            var_c5aebd9f += var_2a0d4230;
            self remove( str_armor );
            
            if ( self.armor <= 0 )
            {
                self playsound( #"hash_2817ca3f96127e62" );
            }
            
            n_index++;
            continue;
        }
    }
    
    self notify( #"damage_armor", { #mod:mod_type, #attacker:e_attacker } );
    return 0;
}

