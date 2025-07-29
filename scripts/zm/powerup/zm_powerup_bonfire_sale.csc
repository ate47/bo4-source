#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_powerups;

#namespace zm_powerup_bonfire_sale;

// Namespace zm_powerup_bonfire_sale/zm_powerup_bonfire_sale
// Params 0, eflags: 0x2
// Checksum 0xccd42947, Offset: 0xa8
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zm_powerup_bonfire_sale", &__init__, undefined, undefined );
}

// Namespace zm_powerup_bonfire_sale/zm_powerup_bonfire_sale
// Params 0
// Checksum 0xbd945e3f, Offset: 0xf0
// Size: 0x4c
function __init__()
{
    zm_powerups::include_zombie_powerup( "bonfire_sale" );
    
    if ( zm_powerups::function_cc33adc8() )
    {
        zm_powerups::add_zombie_powerup( "bonfire_sale", "powerup_bon_fire" );
    }
}

