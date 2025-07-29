#using scripts\core_common\serverfield_shared;
#using scripts\core_common\system_shared;

#namespace status_effect_suppress;

// Namespace status_effect_suppress/status_effect_suppress
// Params 0, eflags: 0x2
// Checksum 0x4cffc69f, Offset: 0xa0
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"status_effect_suppress", &__init__, undefined, undefined );
}

// Namespace status_effect_suppress/status_effect_suppress
// Params 0
// Checksum 0x34aaac84, Offset: 0xe8
// Size: 0x2c
function __init__()
{
    serverfield::register( "status_effect_suppress_field", 1, 5, "int" );
}

