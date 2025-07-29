#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_loadout;
#using scripts\zm_common\zm_trial;
#using scripts\zm_common\zm_trial_util;

#namespace zm_trial_full_loadout;

// Namespace zm_trial_full_loadout/zm_trial_full_loadout
// Params 0, eflags: 0x2
// Checksum 0x4b01ef78, Offset: 0x88
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zm_trial_full_loadout", &__init__, undefined, undefined );
}

// Namespace zm_trial_full_loadout/zm_trial_full_loadout
// Params 0
// Checksum 0xb1e184b7, Offset: 0xd0
// Size: 0x5c
function __init__()
{
    if ( !zm_trial::is_trial_mode() )
    {
        return;
    }
    
    zm_trial::register_challenge( #"full_loadout", &on_begin, &on_end );
}

// Namespace zm_trial_full_loadout/zm_trial_full_loadout
// Params 0, eflags: 0x4
// Checksum 0x1a2233c6, Offset: 0x138
// Size: 0x80
function private on_begin()
{
    foreach ( player in getplayers() )
    {
        player thread monitor_loadout();
    }
}

// Namespace zm_trial_full_loadout/zm_trial_full_loadout
// Params 1, eflags: 0x4
// Checksum 0x9e506d36, Offset: 0x1c0
// Size: 0x19a
function private on_end( round_reset )
{
    if ( !round_reset )
    {
        var_696c3b4 = [];
        
        foreach ( player in getplayers() )
        {
            if ( !player.var_53531c80 )
            {
                if ( !isdefined( var_696c3b4 ) )
                {
                    var_696c3b4 = [];
                }
                else if ( !isarray( var_696c3b4 ) )
                {
                    var_696c3b4 = array( var_696c3b4 );
                }
                
                var_696c3b4[ var_696c3b4.size ] = player;
            }
        }
        
        if ( var_696c3b4.size )
        {
            zm_trial::fail( #"hash_6a7d01641de1f5c3", var_696c3b4 );
        }
    }
    
    foreach ( player in getplayers() )
    {
        player zm_trial_util::function_f3aacffb();
        player.var_53531c80 = undefined;
    }
}

// Namespace zm_trial_full_loadout/zm_trial_full_loadout
// Params 0, eflags: 0x4
// Checksum 0x57784878, Offset: 0x368
// Size: 0x266
function private monitor_loadout()
{
    self endon( #"disconnect" );
    level endon( #"hash_7646638df88a3656", #"end_game" );
    self.var_53531c80 = 0;
    self zm_trial_util::function_63060af4( 0 );
    
    while ( true )
    {
        a_weapons = self getweaponslistprimaries();
        weapon_equipment = self zm_loadout::get_player_lethal_grenade();
        
        if ( !isdefined( a_weapons ) )
        {
            a_weapons = [];
        }
        else if ( !isarray( a_weapons ) )
        {
            a_weapons = array( a_weapons );
        }
        
        a_weapons[ a_weapons.size ] = weapon_equipment;
        var_94020d2 = 1;
        
        foreach ( weapon in a_weapons )
        {
            n_clip_size = self getweaponammoclipsize( weapon );
            var_2cf11630 = self getweaponammoclip( weapon );
            var_45193587 = self getweaponammostock( weapon );
            n_stock_size = min( weapon.maxammo, weapon.startammo );
            
            if ( var_2cf11630 < n_clip_size || var_45193587 < n_stock_size )
            {
                var_94020d2 = 0;
                break;
            }
        }
        
        if ( self.var_53531c80 != var_94020d2 )
        {
            self.var_53531c80 = var_94020d2;
            self zm_trial_util::function_63060af4( self.var_53531c80 );
        }
        
        waitframe( 1 );
    }
}

