#using scripts\core_common\flag_shared;
#using scripts\core_common\laststand_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\trials\zm_trial_disable_perks;
#using scripts\zm_common\trials\zm_trial_randomize_perks;
#using scripts\zm_common\zm_bgb;
#using scripts\zm_common\zm_perks;
#using scripts\zm_common\zm_utility;

#namespace zm_bgb_perk_up;

// Namespace zm_bgb_perk_up/zm_bgb_perk_up
// Params 0, eflags: 0x2
// Checksum 0xbee2f20c, Offset: 0xd0
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"zm_bgb_perk_up", &__init__, undefined, #"bgb" );
}

// Namespace zm_bgb_perk_up/zm_bgb_perk_up
// Params 0
// Checksum 0x82699e77, Offset: 0x120
// Size: 0x74
function __init__()
{
    if ( !( isdefined( level.bgb_in_use ) && level.bgb_in_use ) )
    {
        return;
    }
    
    bgb::register( #"zm_bgb_perk_up", "activated", 1, undefined, undefined, &validation, &activation );
}

// Namespace zm_bgb_perk_up/zm_bgb_perk_up
// Params 0
// Checksum 0x959e9a0, Offset: 0x1a0
// Size: 0x76, Type: bool
function validation()
{
    if ( isdefined( self.var_b773066d ) && self.var_b773066d )
    {
        return false;
    }
    
    if ( zm_trial_disable_perks::is_active() || zm_trial_randomize_perks::is_active() )
    {
        return false;
    }
    
    if ( self zm_perks::function_80cb4982() )
    {
        return false;
    }
    
    return true;
}

// Namespace zm_bgb_perk_up/zm_bgb_perk_up
// Params 0
// Checksum 0xd91da015, Offset: 0x220
// Size: 0xda
function activation()
{
    self endon( #"fake_death", #"death", #"player_downed" );
    
    if ( !self laststand::player_is_in_laststand() && self.sessionstate != "spectator" )
    {
        self thread function_183a26f5();
        
        for ( i = 0; i < 4 ; i++ )
        {
            var_16c042b8 = self zm_perks::function_b2cba45a();
            
            if ( isdefined( var_16c042b8 ) )
            {
                self.var_b773066d = 1;
                continue;
            }
            
            return;
        }
    }
}

// Namespace zm_bgb_perk_up/zm_bgb_perk_up
// Params 0
// Checksum 0x2fa8920e, Offset: 0x308
// Size: 0x6a
function function_183a26f5()
{
    self notify( #"hash_46621c50b1ffc556" );
    self endon( #"hash_46621c50b1ffc556" );
    self waittill( #"fake_death", #"player_downed", #"death" );
    
    if ( isdefined( self ) )
    {
        self.var_b773066d = undefined;
    }
}

