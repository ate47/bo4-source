#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_bgb;
#using scripts\zm_common\zm_player;
#using scripts\zm_common\zm_powerups;

#namespace zm_bgb_extra_credit;

// Namespace zm_bgb_extra_credit/zm_bgb_extra_credit
// Params 0, eflags: 0x2
// Checksum 0x1f391117, Offset: 0xb0
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"zm_bgb_extra_credit", &__init__, undefined, #"bgb" );
}

// Namespace zm_bgb_extra_credit/zm_bgb_extra_credit
// Params 0
// Checksum 0x9d869b9, Offset: 0x100
// Size: 0x74
function __init__()
{
    if ( !( isdefined( level.bgb_in_use ) && level.bgb_in_use ) )
    {
        return;
    }
    
    bgb::register( #"zm_bgb_extra_credit", "activated", 1, undefined, undefined, &validation, &activation );
}

// Namespace zm_bgb_extra_credit/zm_bgb_extra_credit
// Params 0
// Checksum 0x3345d61f, Offset: 0x180
// Size: 0x44
function activation()
{
    powerup_origin = self bgb::get_player_dropped_powerup_origin();
    self thread function_22f934e6( powerup_origin, 96 );
}

// Namespace zm_bgb_extra_credit/zm_bgb_extra_credit
// Params 2
// Checksum 0xe173578c, Offset: 0x1d0
// Size: 0xb6
function function_22f934e6( origin, var_22a4c702 )
{
    self endon( #"disconnect", #"bled_out" );
    e_powerup = zm_powerups::specific_powerup_drop( "bonus_points_player", origin, undefined, 0.1, undefined, undefined, 1, 1, 1, 1 );
    
    if ( isdefined( level.var_5a2df97b ) )
    {
        e_powerup thread [[ level.var_5a2df97b ]]();
    }
    
    e_powerup.bonus_points_powerup_override = &function_19e7d278;
}

// Namespace zm_bgb_extra_credit/zm_bgb_extra_credit
// Params 1
// Checksum 0xbcaee8d0, Offset: 0x290
// Size: 0x10
function function_19e7d278( player )
{
    return 1250;
}

// Namespace zm_bgb_extra_credit/zm_bgb_extra_credit
// Params 0
// Checksum 0x2c9529c2, Offset: 0x2a8
// Size: 0x1a
function validation()
{
    return self bgb::function_9d8118f5();
}

