#using scripts\core_common\struct;

#namespace zgrief;

// Namespace zgrief/gametype_init
// Params 1, eflags: 0x40
// Checksum 0xd2ee872e, Offset: 0x70
// Size: 0x5c
function event_handler[gametype_init] main( eventstruct )
{
    level._zombie_gamemodeprecache = &onprecachegametype;
    level._zombie_gamemodemain = &onstartgametype;
    println( "<dev string:x38>" );
}

// Namespace zgrief/zgrief
// Params 0
// Checksum 0x57adf8a3, Offset: 0xd8
// Size: 0x24
function onprecachegametype()
{
    println( "<dev string:x54>" );
}

// Namespace zgrief/zgrief
// Params 0
// Checksum 0xec81b674, Offset: 0x108
// Size: 0x24
function onstartgametype()
{
    println( "<dev string:x74>" );
}

