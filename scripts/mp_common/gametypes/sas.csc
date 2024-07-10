#using scripts\core_common\struct.csc;

#namespace sas;

// Namespace sas/gametype_init
// Params 1, eflags: 0x40
// Checksum 0xe6f1299, Offset: 0x70
// Size: 0x1a
function event_handler[gametype_init] main(eventstruct) {
    level.var_207a1c9a = 1;
}

