#using scripts\core_common\callbacks_shared;
#using scripts\core_common\system_shared;
#using scripts\zm_common\trials\zm_trial_disable_hero_weapons;
#using scripts\zm_common\zm_trial;
#using scripts\zm_common\zm_trial_util;

#namespace zm_trial_disable_upgraded_weapons;

// Namespace zm_trial_disable_upgraded_weapons/zm_trial_disable_upgraded_weapons
// Params 0, eflags: 0x2
// Checksum 0x7e665a82, Offset: 0x90
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zm_trial_disable_upgraded_weapons", &__init__, undefined, undefined );
}

// Namespace zm_trial_disable_upgraded_weapons/zm_trial_disable_upgraded_weapons
// Params 0
// Checksum 0x9cdb43c6, Offset: 0xd8
// Size: 0x5c
function __init__()
{
    if ( !zm_trial::is_trial_mode() )
    {
        return;
    }
    
    zm_trial::register_challenge( #"disable_upgraded_weapons", &on_begin, &on_end );
}

// Namespace zm_trial_disable_upgraded_weapons/zm_trial_disable_upgraded_weapons
// Params 0, eflags: 0x4
// Checksum 0xe66a79a2, Offset: 0x140
// Size: 0x1c4
function private on_begin()
{
    assert( isdefined( level.zombie_weapons_upgraded ) );
    level.var_af806901 = [];
    
    foreach ( upgraded_weapon in getarraykeys( level.zombie_weapons_upgraded ) )
    {
        level.var_af806901[ upgraded_weapon.name ] = upgraded_weapon;
    }
    
    foreach ( player in getplayers() )
    {
        player function_6a8979c9();
        player callback::function_33f0ddd3( &function_33f0ddd3 );
        player zm_trial_util::function_7dbb1712( 1 );
        player callback::on_weapon_change( &zm_trial_util::function_79518194 );
    }
    
    zm_trial_util::function_eea26e56();
    level zm_trial::function_8e2a923( 1 );
}

// Namespace zm_trial_disable_upgraded_weapons/zm_trial_disable_upgraded_weapons
// Params 1, eflags: 0x4
// Checksum 0x7fb58799, Offset: 0x310
// Size: 0x1dc
function private on_end( round_reset )
{
    foreach ( player in getplayers() )
    {
        player callback::function_824d206( &function_33f0ddd3 );
        player callback::remove_on_weapon_change( &zm_trial_util::function_79518194 );
        
        foreach ( weapon in player getweaponslist( 1 ) )
        {
            player unlockweapon( weapon );
            
            if ( weapon.isdualwield && weapon.dualwieldweapon != level.weaponnone )
            {
                player unlockweapon( weapon.dualwieldweapon );
            }
        }
        
        player zm_trial_util::function_7dbb1712( 1 );
    }
    
    level.var_af806901 = undefined;
    zm_trial_util::function_ef1fce77();
    level zm_trial::function_8e2a923( 0 );
}

// Namespace zm_trial_disable_upgraded_weapons/zm_trial_disable_upgraded_weapons
// Params 0
// Checksum 0xf8e59557, Offset: 0x4f8
// Size: 0x32, Type: bool
function is_active()
{
    challenge = zm_trial::function_a36e8c38( #"disable_upgraded_weapons" );
    return isdefined( challenge );
}

// Namespace zm_trial_disable_upgraded_weapons/zm_trial_disable_upgraded_weapons
// Params 1, eflags: 0x4
// Checksum 0x45195f85, Offset: 0x538
// Size: 0x24
function private function_33f0ddd3( eventstruct )
{
    self function_6a8979c9();
}

// Namespace zm_trial_disable_upgraded_weapons/zm_trial_disable_upgraded_weapons
// Params 0, eflags: 0x4
// Checksum 0xb57119c5, Offset: 0x568
// Size: 0x1c0
function private function_6a8979c9()
{
    assert( isdefined( level.var_af806901 ) );
    
    foreach ( weapon in self getweaponslist( 1 ) )
    {
        if ( isdefined( level.var_af806901[ weapon.name ] ) )
        {
            self lockweapon( weapon );
        }
        else if ( !zm_trial_disable_hero_weapons::is_active() || !isarray( level.var_3e2ac3b6 ) || !isdefined( level.var_3e2ac3b6[ weapon.name ] ) )
        {
            self unlockweapon( weapon );
        }
        
        if ( weapon.isdualwield && weapon.dualwieldweapon != level.weaponnone )
        {
            if ( self isweaponlocked( weapon ) )
            {
                self lockweapon( weapon.dualwieldweapon );
                continue;
            }
            
            self unlockweapon( weapon.dualwieldweapon );
        }
    }
}

