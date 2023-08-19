// Atian COD Tools GSC decompiler test
#include scripts/core_common/struct.csc;

#namespace zgrief;

// Namespace zgrief/gametype_init
// Params 1, eflags: 0x40
// Checksum 0xd2ee872e, Offset: 0x70
// Size: 0x5c
function event<gametype_init> main(eventstruct) {
    level._zombie_gamemodeprecache = &onprecachegametype;
    level._zombie_gamemodemain = &onstartgametype;
    /#
        println("<unknown string>");
    #/
}

// Namespace zgrief/zgrief
// Params 0, eflags: 0x0
// Checksum 0x57adf8a3, Offset: 0xd8
// Size: 0x24
function onprecachegametype() {
    /#
        println("<unknown string>");
    #/
}

// Namespace zgrief/zgrief
// Params 0, eflags: 0x0
// Checksum 0xec81b674, Offset: 0x108
// Size: 0x24
function onstartgametype() {
    /#
        println("<unknown string>");
    #/
}

