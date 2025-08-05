#using scripts\core_common\callbacks_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\zm_loadout;
#using scripts\zm_common\zm_trial;
#using scripts\zm_common\zm_trial_util;

#namespace zm_orange_trial_shoot_from_water;

// Namespace zm_orange_trial_shoot_from_water/zm_orange_trial_shoot_from_water
// Params 0, eflags: 0x2
// Checksum 0x8476ed18, Offset: 0xe8
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zm_orange_trial_shoot_from_water", &__init__, undefined, undefined );
}

// Namespace zm_orange_trial_shoot_from_water/zm_orange_trial_shoot_from_water
// Params 0
// Checksum 0x4f80b1bf, Offset: 0x130
// Size: 0x5c
function __init__()
{
    if ( !zm_trial::is_trial_mode() )
    {
        return;
    }
    
    zm_trial::register_challenge( #"shoot_from_water", &on_begin, &on_end );
}

// Namespace zm_orange_trial_shoot_from_water/zm_orange_trial_shoot_from_water
// Params 0, eflags: 0x4
// Checksum 0x176e1326, Offset: 0x198
// Size: 0xc8
function private on_begin()
{
    str_targetname = "trials_shoot_from_water";
    callback::function_33f0ddd3( &function_33f0ddd3 );
    level zm_trial::function_25ee130( 1 );
    
    foreach ( player in getplayers() )
    {
        player thread function_9e0e99e1();
    }
}

// Namespace zm_orange_trial_shoot_from_water/zm_orange_trial_shoot_from_water
// Params 1, eflags: 0x4
// Checksum 0x426c24ed, Offset: 0x268
// Size: 0xe2
function private on_end( round_reset )
{
    callback::function_824d206( &function_33f0ddd3 );
    level zm_trial::function_25ee130( 0 );
    
    foreach ( player in getplayers() )
    {
        player thread zm_trial_util::function_dc0859e();
        player thread zm_trial_util::function_73ff0096();
    }
    
    level.var_7f31a12d = undefined;
}

// Namespace zm_orange_trial_shoot_from_water/zm_orange_trial_shoot_from_water
// Params 0, eflags: 0x4
// Checksum 0xf2983a14, Offset: 0x358
// Size: 0x2f2
function private function_9e0e99e1()
{
    self endon( #"disconnect" );
    level endon( #"hash_7646638df88a3656" );
    var_407eb07 = 0;
    
    while ( true )
    {
        var_f2b6fe6e = 0;
        
        if ( self.b_in_water === 1 )
        {
            var_f2b6fe6e = 1;
        }
        
        if ( var_f2b6fe6e && var_407eb07 )
        {
            foreach ( weapon in self getweaponslist( 1 ) )
            {
                self unlockweapon( weapon );
                
                if ( weapon.isdualwield && weapon.dualwieldweapon != level.weaponnone )
                {
                    self unlockweapon( weapon.dualwieldweapon );
                }
            }
            
            self zm_trial_util::function_dc0859e();
            var_407eb07 = 0;
        }
        else if ( !var_f2b6fe6e && !var_407eb07 )
        {
            self zm_trial_util::function_bf710271();
            
            foreach ( weapon in self getweaponslist( 1 ) )
            {
                if ( zm_loadout::function_2ff6913( weapon ) == 1 )
                {
                    self unlockweapon( weapon );
                    
                    if ( weapon.isdualwield && weapon.dualwieldweapon != level.weaponnone )
                    {
                        self unlockweapon( weapon.dualwieldweapon );
                    }
                    
                    continue;
                }
                
                self lockweapon( weapon );
                
                if ( weapon.isdualwield && weapon.dualwieldweapon != level.weaponnone )
                {
                    self lockweapon( weapon.dualwieldweapon, 1, 1 );
                }
            }
            
            var_407eb07 = 1;
        }
        
        waitframe( 1 );
    }
}

// Namespace zm_orange_trial_shoot_from_water/zm_orange_trial_shoot_from_water
// Params 1, eflags: 0x4
// Checksum 0xe43d1d6e, Offset: 0x658
// Size: 0x1e0
function private function_33f0ddd3( s_event )
{
    if ( s_event.event === "give_weapon" || s_event.event === "give_weapon_alt" || s_event.event == "give_weapon_dual" )
    {
        var_f2b6fe6e = 0;
        
        if ( self.b_in_water === 1 )
        {
            var_f2b6fe6e = 1;
            return;
        }
        
        if ( !var_f2b6fe6e )
        {
            foreach ( weapon in self getweaponslist( 1 ) )
            {
                if ( zm_loadout::function_2ff6913( weapon ) == 1 )
                {
                    self unlockweapon( weapon );
                    
                    if ( weapon.isdualwield && weapon.dualwieldweapon != level.weaponnone )
                    {
                        self unlockweapon( weapon.dualwieldweapon );
                    }
                    
                    continue;
                }
                
                self lockweapon( weapon );
                
                if ( weapon.isdualwield && weapon.dualwieldweapon != level.weaponnone )
                {
                    self lockweapon( weapon.dualwieldweapon, 1, 1 );
                }
            }
        }
    }
}

