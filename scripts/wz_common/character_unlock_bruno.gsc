#using script_71e26f08f03b7a7a;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\wz_common\character_unlock;
#using scripts\wz_common\character_unlock_fixup;

#namespace character_unlock_bruno;

// Namespace character_unlock_bruno/character_unlock_bruno
// Params 0, eflags: 0x2
// Checksum 0x5e0b52a6, Offset: 0xc0
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"character_unlock_bruno", &__init__, undefined, #"character_unlock_bruno_fixup" );
}

// Namespace character_unlock_bruno/character_unlock_bruno
// Params 0
// Checksum 0x1b2b97f0, Offset: 0x110
// Size: 0x34
function __init__()
{
    character_unlock_fixup::function_90ee7a97( #"bruno_unlock", &function_2613aeec );
}

// Namespace character_unlock_bruno/character_unlock_bruno
// Params 1
// Checksum 0xcbb8e06b, Offset: 0x150
// Size: 0x5c
function function_2613aeec( enabled )
{
    if ( enabled )
    {
        callback::on_downed( &on_player_downed );
        character_unlock::function_d2294476( #"supply_drop_stash_cu11", 3, 4 );
    }
}

// Namespace character_unlock_bruno/character_unlock_bruno
// Params 0
// Checksum 0x2f486ad2, Offset: 0x1b8
// Size: 0xfc
function on_player_downed()
{
    if ( isdefined( self.laststandparams ) )
    {
        attacker = self.laststandparams.attacker;
        
        if ( !isplayer( attacker ) )
        {
            return;
        }
        
        if ( self.laststandparams.smeansofdeath != "MOD_MELEE" && self.laststandparams.smeansofdeath != "MOD_MELEE_WEAPON_BUTT" )
        {
            return;
        }
        
        if ( !attacker util::isenemyteam( self.team ) )
        {
            return;
        }
        
        if ( !attacker character_unlock::function_f0406288( #"bruno_unlock" ) )
        {
            return;
        }
        
        attacker character_unlock::function_c8beca5e( #"bruno_unlock", #"hash_21c5510d64c20b71", 1 );
    }
}

