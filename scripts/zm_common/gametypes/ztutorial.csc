#namespace ztutorial;

// Namespace ztutorial/gametype_init
// Params 1, eflags: 0x40
// Checksum 0x11f08041, Offset: 0x68
// Size: 0x3e
function event_handler[gametype_init] main( eventstruct )
{
    level._zombie_gamemodeprecache = &onprecachegametype;
    level._zombie_gamemodemain = &onstartgametype;
}

// Namespace ztutorial/ztutorial
// Params 0
// Checksum 0x5e079cc4, Offset: 0xb0
// Size: 0x24
function onprecachegametype()
{
    println( "<dev string:x38>" );
}

// Namespace ztutorial/ztutorial
// Params 0
// Checksum 0x56fe903a, Offset: 0xe0
// Size: 0x24
function onstartgametype()
{
    println( "<dev string:x5b>" );
}

