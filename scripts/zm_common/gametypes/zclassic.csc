// Atian COD Tools GSC decompiler test
#using scripts\core_common\struct.csc;

#namespace zclassic;

// Namespace zclassic/gametype_init
// Params 1, eflags: 0x40
// Checksum 0xd25ecac5, Offset: 0x70
// Size: 0x5c
function event_handler[gametype_init] main(eventstruct) {
    level._zombie_gamemodeprecache = &onprecachegametype;
    level._zombie_gamemodemain = &onstartgametype;
    /#
        println("<unknown string>");
    #/
}

// Namespace zclassic/zclassic
// Params 0, eflags: 0x1 linked
// Checksum 0xba7e0427, Offset: 0xd8
// Size: 0x24
function onprecachegametype() {
    /#
        println("<unknown string>");
    #/
}

// Namespace zclassic/zclassic
// Params 0, eflags: 0x1 linked
// Checksum 0x8a8910eb, Offset: 0x108
// Size: 0x24
function onstartgametype() {
    /#
        println("<unknown string>");
    #/
}

