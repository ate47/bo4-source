#using scripts\core_common\flag_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\zm_bgb;
#using scripts\zm_common\zm_utility;

#namespace zm_bgb_shopping_free;

// Namespace zm_bgb_shopping_free/zm_bgb_shopping_free
// Params 0, eflags: 0x2
// Checksum 0xf9926f0c, Offset: 0xa0
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"zm_bgb_shopping_free", &__init__, undefined, #"bgb" );
}

// Namespace zm_bgb_shopping_free/zm_bgb_shopping_free
// Params 0
// Checksum 0x38554e38, Offset: 0xf0
// Size: 0x74
function __init__()
{
    if ( !( isdefined( level.bgb_in_use ) && level.bgb_in_use ) )
    {
        return;
    }
    
    bgb::register( #"zm_bgb_shopping_free", "time", 60, &enable, &disable, undefined, undefined );
}

// Namespace zm_bgb_shopping_free/zm_bgb_shopping_free
// Params 0
// Checksum 0x4ab8615b, Offset: 0x170
// Size: 0x38
function enable()
{
    self endon( #"disconnect", #"bled_out", #"bgb_update" );
}

// Namespace zm_bgb_shopping_free/zm_bgb_shopping_free
// Params 0
// Checksum 0x80f724d1, Offset: 0x1b0
// Size: 0x4
function disable()
{
    
}

