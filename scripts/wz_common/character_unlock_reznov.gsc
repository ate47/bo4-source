#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\mp_common\gametypes\globallogic;
#using scripts\mp_common\item_world;
#using scripts\mp_common\teams\teams;
#using scripts\wz_common\character_unlock;
#using scripts\wz_common\character_unlock_fixup;
#using scripts\wz_common\character_unlock_reznov_fixup;

#namespace character_unlock_reznov;

// Namespace character_unlock_reznov/character_unlock_reznov
// Params 0, eflags: 0x2
// Checksum 0xd3c07610, Offset: 0xb8
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"character_unlock_reznov", &__init__, undefined, #"character_unlock_reznov_fixup" );
}

// Namespace character_unlock_reznov/character_unlock_reznov
// Params 0
// Checksum 0xafd5a732, Offset: 0x108
// Size: 0x34
function __init__()
{
    character_unlock_fixup::function_90ee7a97( #"reznov_unlock", &function_2613aeec );
}

// Namespace character_unlock_reznov/character_unlock_reznov
// Params 1
// Checksum 0xa06bcf3a, Offset: 0x148
// Size: 0xac
function function_2613aeec( enabled )
{
    if ( enabled )
    {
        callback::on_player_killed( &on_player_killed );
        callback::add_callback( #"hash_48bcdfea6f43fecb", &function_1c4b5097 );
        callback::add_callback( #"on_team_eliminated", &function_4ac25840 );
        level thread function_4f4cf89e();
    }
}

// Namespace character_unlock_reznov/character_unlock_reznov
// Params 0
// Checksum 0x4db9f6ed, Offset: 0x200
// Size: 0x13a
function function_4f4cf89e()
{
    item_world::function_4de3ca98();
    var_daed388 = function_91b29d2a( #"cu21_spawn" );
    
    if ( !isdefined( var_daed388[ 0 ] ) )
    {
        return;
    }
    
    var_daed388 = array::randomize( var_daed388 );
    var_8a9122c8 = var_daed388[ 0 ];
    var_5901fe7f = 0;
    
    for ( x = 1; x < var_daed388.size ; x++ )
    {
        if ( isdefined( var_5901fe7f ) && var_5901fe7f )
        {
            item_world::consume_item( var_daed388[ x ] );
            continue;
        }
        
        if ( distance2d( var_daed388[ x ].origin, var_8a9122c8.origin ) < 500 )
        {
            item_world::consume_item( var_daed388[ x ] );
            continue;
        }
        
        var_5901fe7f = 1;
    }
}

// Namespace character_unlock_reznov/character_unlock_reznov
// Params 0
// Checksum 0xdada5109, Offset: 0x348
// Size: 0x1c4
function on_player_killed()
{
    if ( !isdefined( self.laststandparams ) )
    {
        return;
    }
    
    attacker = self.laststandparams.attacker;
    
    if ( !isplayer( attacker ) )
    {
        return;
    }
    
    if ( !attacker util::isenemyteam( self.team ) )
    {
        return;
    }
    
    weapon = self.laststandparams.sweapon;
    
    if ( !weapon.isprimary )
    {
        return;
    }
    
    attacker_origin = self.laststandparams.attackerorigin;
    victim_origin = self.laststandparams.victimorigin;
    
    if ( !isdefined( attacker_origin ) || !isdefined( victim_origin ) )
    {
        return;
    }
    
    if ( !attacker character_unlock::function_f0406288( #"reznov_unlock" ) )
    {
        return;
    }
    
    dist_to_target_sq = distancesquared( attacker_origin, victim_origin );
    
    if ( dist_to_target_sq < 7800 * 7800 )
    {
        return;
    }
    
    if ( !isdefined( attacker.var_ec8d7cbc ) )
    {
        attacker.var_ec8d7cbc = 0;
    }
    
    attacker.var_ec8d7cbc++;
    
    if ( attacker.var_ec8d7cbc == 1 )
    {
        attacker character_unlock::function_c8beca5e( #"reznov_unlock", #"hash_1cd3eb5d2d22f647", 1 );
    }
}

// Namespace character_unlock_reznov/character_unlock_reznov
// Params 1
// Checksum 0x91567650, Offset: 0x518
// Size: 0xdc
function function_1c4b5097( item )
{
    itementry = item.itementry;
    
    if ( isdefined( itementry ) && itementry.name === #"cu21_item" )
    {
        var_c503939b = globallogic::function_e9e52d05();
        
        if ( var_c503939b <= function_c816ea5b() )
        {
            if ( self character_unlock::function_f0406288( #"reznov_unlock" ) )
            {
                self character_unlock::function_c8beca5e( #"reznov_unlock", #"hash_1cd3ec5d2d22f7fa", 1 );
            }
        }
    }
}

// Namespace character_unlock_reznov/character_unlock_reznov
// Params 1
// Checksum 0xbfaaef94, Offset: 0x600
// Size: 0x1e2
function function_4ac25840( dead_team )
{
    if ( isdefined( level.var_34983012 ) && level.var_34983012 )
    {
        return;
    }
    
    var_c503939b = globallogic::function_e9e52d05();
    
    if ( var_c503939b <= function_c816ea5b() )
    {
        foreach ( team in level.teams )
        {
            if ( teams::function_9dd75dad( team ) && !teams::is_all_dead( team ) )
            {
                players = getplayers( team );
                
                foreach ( player in players )
                {
                    if ( player character_unlock::function_f0406288( #"reznov_unlock" ) )
                    {
                        player character_unlock::function_c8beca5e( #"reznov_unlock", #"hash_1cd3ec5d2d22f7fa", 1 );
                    }
                }
            }
        }
        
        level.var_34983012 = 1;
    }
}

// Namespace character_unlock_reznov/character_unlock_reznov
// Params 0, eflags: 0x4
// Checksum 0x11e82b78, Offset: 0x7f0
// Size: 0x80
function private function_c816ea5b()
{
    maxteamplayers = isdefined( getgametypesetting( #"maxteamplayers" ) ) ? getgametypesetting( #"maxteamplayers" ) : 1;
    
    switch ( maxteamplayers )
    {
        case 1:
            return 5;
        case 2:
            return 3;
        case 4:
        default:
            return 2;
        case 5:
            return 2;
    }
}

