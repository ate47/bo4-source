#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_bgb;

#namespace zm_bgb_blood_debt;

// Namespace zm_bgb_blood_debt/zm_bgb_blood_debt
// Params 0, eflags: 0x2
// Checksum 0x329851b1, Offset: 0x80
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"zm_bgb_blood_debt", &__init__, undefined, #"bgb" );
}

// Namespace zm_bgb_blood_debt/zm_bgb_blood_debt
// Params 0
// Checksum 0x163aee0b, Offset: 0xd0
// Size: 0x4c
function __init__()
{
    if ( !( isdefined( level.bgb_in_use ) && level.bgb_in_use ) )
    {
        return;
    }
    
    bgb::register( #"zm_bgb_blood_debt", "time" );
}

