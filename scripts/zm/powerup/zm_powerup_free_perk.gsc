#using scripts\core_common\ai\zombie_death;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\laststand_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\zm_blockers;
#using scripts\zm_common\zm_perks;
#using scripts\zm_common\zm_powerups;
#using scripts\zm_common\zm_score;
#using scripts\zm_common\zm_spawner;
#using scripts\zm_common\zm_stats;
#using scripts\zm_common\zm_utility;

#namespace zm_powerup_free_perk;

// Namespace zm_powerup_free_perk/zm_powerup_free_perk
// Params 0, eflags: 0x2
// Checksum 0x90c812fd, Offset: 0xf0
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zm_powerup_free_perk", &__init__, undefined, undefined );
}

// Namespace zm_powerup_free_perk/zm_powerup_free_perk
// Params 0
// Checksum 0xcf08cc46, Offset: 0x138
// Size: 0x9c
function __init__()
{
    zm_powerups::register_powerup( "free_perk", &grab_free_perk );
    
    if ( zm_powerups::function_cc33adc8() )
    {
        str_model = zm_powerups::function_bcfcc27e();
        zm_powerups::add_zombie_powerup( "free_perk", str_model, #"zombie_powerup_free_perk", &zm_powerups::func_should_never_drop, 0, 0, 0 );
    }
}

// Namespace zm_powerup_free_perk/zm_powerup_free_perk
// Params 1
// Checksum 0xc8f141cc, Offset: 0x1e0
// Size: 0xc2
function grab_free_perk( var_a3878cd )
{
    foreach ( e_player in getplayers() )
    {
        if ( !e_player laststand::player_is_in_laststand() && e_player.sessionstate != "spectator" )
        {
            var_16c042b8 = e_player zm_perks::function_b2cba45a();
        }
    }
}

