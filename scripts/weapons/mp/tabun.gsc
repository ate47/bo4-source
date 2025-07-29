#using scripts\core_common\system_shared;
#using scripts\weapons\tabun;

#namespace tabun;

// Namespace tabun/tabun
// Params 0, eflags: 0x2
// Checksum 0x9d8cff92, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"tabun", &__init__, undefined, undefined );
}

// Namespace tabun/tabun
// Params 0
// Checksum 0xadb15c82, Offset: 0xc0
// Size: 0x14
function __init__()
{
    init_shared();
}

