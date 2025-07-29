#using scripts\core_common\system_shared;

#namespace teamset;

// Namespace teamset/teamset
// Params 0, eflags: 0x2
// Checksum 0x34b177dc, Offset: 0x70
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"teamset_seals", &__init__, undefined, undefined );
}

// Namespace teamset/teamset
// Params 0
// Checksum 0x6553c85d, Offset: 0xb8
// Size: 0x36
function __init__()
{
    level.allies_team = #"allies";
    level.axis_team = #"axis";
}

