#using scripts\core_common\ai_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\bots\bot;
#using scripts\core_common\bots\bot_action;
#using scripts\core_common\bots\bot_position;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\gameobjects_shared;
#using scripts\core_common\laststand_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;

#namespace zm_bot_position;

// Namespace zm_bot_position/zm_bot_position
// Params 0, eflags: 0x2
// Checksum 0x5d749675, Offset: 0xc8
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zm_bot_position", &__init__, undefined, undefined );
}

// Namespace zm_bot_position/zm_bot_position
// Params 0
// Checksum 0xac67fbe3, Offset: 0x110
// Size: 0x154
function __init__()
{
    bot_position::function_e9e03d6f( #"zombie_in_combat", &zombie_in_combat );
    bot_position::function_e9e03d6f( #"hash_7cf5d8ae94c74382", &function_6300517d );
    bot_position::function_e9e03d6f( #"hash_26e050bc0c121f1b", &function_a3d8f155 );
    bot_position::function_e9e03d6f( #"zombie_interact", &zombie_interact );
    bot_position::function_e9e03d6f( #"zombie_weapon_upgrade", &zombie_weapon_upgrade );
    bot_position::function_aa8c6854( #"zombie_interact", &function_a0b3c01e );
    bot_position::function_aa8c6854( #"zombie_weapon_upgrade", &function_957ba503 );
}

// Namespace zm_bot_position/zm_bot_position
// Params 2
// Checksum 0xd51d8be1, Offset: 0x270
// Size: 0x3a
function zombie_in_combat( params, tacbundle )
{
    if ( !isdefined( self.enemy ) )
    {
        return 0;
    }
    
    return bot_position::function_d0cf287b( params, tacbundle );
}

// Namespace zm_bot_position/zm_bot_position
// Params 2
// Checksum 0x7e45f191, Offset: 0x2b8
// Size: 0x3a
function function_6300517d( params, tacbundle )
{
    if ( isdefined( self.enemy ) )
    {
        return 0;
    }
    
    return bot_position::function_d0cf287b( params, tacbundle );
}

// Namespace zm_bot_position/zm_bot_position
// Params 2
// Checksum 0x546fd46f, Offset: 0x300
// Size: 0x188, Type: bool
function function_a3d8f155( params, tacbundle )
{
    allies = [];
    
    foreach ( player in getplayers() )
    {
        if ( player == self )
        {
            continue;
        }
        
        if ( !isalive( player ) || isdefined( player.revivetrigger ) )
        {
            continue;
        }
        
        if ( !isdefined( player.sessionstate ) || player.sessionstate != "playing" || self.team != player.team )
        {
            continue;
        }
        
        allies[ allies.size ] = player;
    }
    
    if ( allies.size <= 0 )
    {
        return false;
    }
    
    closestally = arraygetclosest( self.origin, allies );
    self bot_position::set_position( closestally.origin );
    return true;
}

// Namespace zm_bot_position/zm_bot_position
// Params 2
// Checksum 0xc1a86cb5, Offset: 0x490
// Size: 0x4a
function zombie_interact( params, tacbundle )
{
    if ( !self bot::function_43a720c7() )
    {
        return 0;
    }
    
    return bot_position::function_d0cf287b( params, tacbundle );
}

// Namespace zm_bot_position/zm_bot_position
// Params 2
// Checksum 0xaa9a7cb2, Offset: 0x4e8
// Size: 0x4a
function zombie_weapon_upgrade( params, tacbundle )
{
    if ( !self bot::function_914feddd() )
    {
        return 0;
    }
    
    return bot_position::function_d0cf287b( params, tacbundle );
}

// Namespace zm_bot_position/zm_bot_position
// Params 0
// Checksum 0x45d1de10, Offset: 0x540
// Size: 0x102
function function_a0b3c01e()
{
    if ( !self bot::function_43a720c7() )
    {
        return undefined;
    }
    
    pathfindingradius = self getpathfindingradius();
    interact = self bot::get_interact();
    
    if ( isentity( interact ) )
    {
        return self bot::function_f0c35734( interact );
    }
    
    if ( isdefined( interact.trigger_stub ) )
    {
        return self bot::function_52947b70( interact.trigger_stub );
    }
    else if ( isdefined( interact.unitrigger_stub ) )
    {
        return self bot::function_52947b70( interact.unitrigger_stub );
    }
    
    return self bot::function_52947b70( interact );
}

// Namespace zm_bot_position/zm_bot_position
// Params 0
// Checksum 0xa6a5e8d9, Offset: 0x650
// Size: 0x5a
function function_957ba503()
{
    if ( !self bot::function_914feddd() )
    {
        return undefined;
    }
    
    upgrade = self bot::get_interact();
    return self bot::function_52947b70( upgrade.trigger_stub );
}

