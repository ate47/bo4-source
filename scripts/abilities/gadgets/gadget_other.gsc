#using scripts\abilities\ability_player;
#using scripts\core_common\system_shared;

#namespace gadget_other;

// Namespace gadget_other/gadget_other
// Params 0, eflags: 0x2
// Checksum 0x44efea1f, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"gadget_other", &__init__, undefined, undefined );
}

// Namespace gadget_other/gadget_other
// Params 0
// Checksum 0x61339f15, Offset: 0xc0
// Size: 0x44
function __init__()
{
    ability_player::register_gadget_is_inuse_callbacks( 1, &gadget_other_is_inuse );
    ability_player::register_gadget_is_flickering_callbacks( 1, &gadget_other_is_flickering );
}

// Namespace gadget_other/gadget_other
// Params 1
// Checksum 0x894702ba, Offset: 0x110
// Size: 0x22
function gadget_other_is_inuse( slot )
{
    return self gadgetisactive( slot );
}

// Namespace gadget_other/gadget_other
// Params 1
// Checksum 0xc0117db2, Offset: 0x140
// Size: 0x22
function gadget_other_is_flickering( slot )
{
    return self gadgetflickering( slot );
}

/#

    // Namespace gadget_other/gadget_other
    // Params 3
    // Checksum 0x905e104e, Offset: 0x170
    // Size: 0xbc, Type: dev
    function set_gadget_other_status( weapon, status, time )
    {
        timestr = "<dev string:x38>";
        
        if ( isdefined( time ) )
        {
            timestr = "<dev string:x3b>" + "<dev string:x40>" + time;
        }
        
        if ( getdvarint( #"scr_cpower_debug_prints", 0 ) > 0 )
        {
            self iprintlnbold( "<dev string:x4b>" + weapon.name + "<dev string:x5b>" + status + timestr );
        }
    }

#/
