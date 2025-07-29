#using scripts\core_common\callbacks_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\mp_common\item_world_fixup;
#using scripts\wz_common\character_unlock;
#using scripts\wz_common\character_unlock_firebreak_fixup;
#using scripts\wz_common\character_unlock_fixup;

#namespace character_unlock_firebreak;

// Namespace character_unlock_firebreak/character_unlock_firebreak
// Params 0, eflags: 0x2
// Checksum 0x6d974134, Offset: 0xa0
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"character_unlock_firebreak", &__init__, undefined, #"character_unlock_firebreak_fixup" );
}

// Namespace character_unlock_firebreak/character_unlock_firebreak
// Params 0
// Checksum 0xcc779b6d, Offset: 0xf0
// Size: 0x34
function __init__()
{
    character_unlock_fixup::function_90ee7a97( #"firebreak_unlock", &function_2613aeec );
}

// Namespace character_unlock_firebreak/character_unlock_firebreak
// Params 1
// Checksum 0x4d567ee5, Offset: 0x130
// Size: 0xec
function function_2613aeec( enabled )
{
    if ( enabled )
    {
        callback::on_player_killed( &on_player_killed );
        
        if ( isdefined( getgametypesetting( #"hash_17f17e92c2654659" ) ) && getgametypesetting( #"hash_17f17e92c2654659" ) )
        {
            item_world_fixup::function_e70fa91c( #"wz_escape_supply_stash_parent", #"supply_stash_cu06", 1 );
            return;
        }
        
        item_world_fixup::function_e70fa91c( #"supply_stash_parent_dlc1", #"supply_stash_cu06", 6 );
    }
}

// Namespace character_unlock_firebreak/character_unlock_firebreak
// Params 0
// Checksum 0x848e638a, Offset: 0x228
// Size: 0x224
function on_player_killed()
{
    params = self.var_a1d415ee;
    
    if ( !isdefined( params ) )
    {
        if ( !isdefined( self.laststandparams ) || isdefined( self.laststandparams.bledout ) && self.laststandparams.bledout )
        {
            return;
        }
        
        params = self.laststandparams;
    }
    
    attacker = params.attacker;
    weapon = params.sweapon;
    
    if ( !isplayer( attacker ) || !isdefined( weapon ) )
    {
        return;
    }
    
    if ( !attacker util::isenemyteam( self.team ) )
    {
        return;
    }
    
    if ( !attacker character_unlock::function_f0406288( #"firebreak_unlock" ) )
    {
        return;
    }
    
    if ( !isdefined( attacker.var_8edd57b6 ) )
    {
        attacker.var_8edd57b6 = 0;
    }
    
    if ( weapon.name === #"eq_molotov" || weapon.name === #"molotov_fire" || weapon.name === #"wraith_fire_fire" || weapon.name === #"eq_wraith_fire" || weapon.name === #"hero_flamethrower" )
    {
        attacker.var_8edd57b6++;
    }
    
    if ( attacker.var_8edd57b6 == 1 )
    {
        attacker character_unlock::function_c8beca5e( #"firebreak_unlock", #"hash_48b3b84fe88578f2", 1 );
    }
}

