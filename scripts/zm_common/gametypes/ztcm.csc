#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\struct.csc;

#namespace ztcm;

// Namespace ztcm/gametype_init
// Params 1, eflags: 0x40
// Checksum 0xbd011b61, Offset: 0x78
// Size: 0xa4
function event_handler[gametype_init] main(eventstruct) {
    level._zombie_gamemodeprecache = &onprecachegametype;
    level._zombie_gamemodemain = &onstartgametype;
    if (!level flag::exists(#"ztcm")) {
        level flag::init(#"ztcm", 1);
    }
    println("<dev string:x38>");
}

// Namespace ztcm/ztcm
// Params 0, eflags: 0x0
// Checksum 0xd8aadcda, Offset: 0x128
// Size: 0x24
function onprecachegametype() {
    println("<dev string:x52>");
}

// Namespace ztcm/ztcm
// Params 0, eflags: 0x0
// Checksum 0xf1f56cd5, Offset: 0x158
// Size: 0x24
function onstartgametype() {
    println("<dev string:x70>");
}

