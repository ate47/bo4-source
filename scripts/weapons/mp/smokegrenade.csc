#using scripts\core_common\system_shared;
#using scripts\weapons\smokegrenade;

#namespace smokegrenade;

// Namespace smokegrenade/smokegrenade
// Params 0, eflags: 0x2
// Checksum 0x30719b64, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"smokegrenade", &__init__, undefined, undefined );
}

// Namespace smokegrenade/smokegrenade
// Params 0
// Checksum 0x3fe4f5ef, Offset: 0xc0
// Size: 0x14
function __init__()
{
    init_shared();
}

