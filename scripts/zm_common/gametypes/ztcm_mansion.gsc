#using scripts\core_common\math_shared;
#using scripts\core_common\struct;
#using scripts\zm_common\gametypes\zm_gametype;
#using scripts\zm_common\gametypes\ztcm;
#using scripts\zm_common\zm_round_logic;
#using scripts\zm_common\zm_stats;

#namespace ztcm_mansion;

// Namespace ztcm_mansion/gametype_init
// Params 1, eflags: 0x40
// Checksum 0x5991173, Offset: 0x98
// Size: 0x24
function event_handler[gametype_init] main(eventstruct) {
    ztcm::main(eventstruct);
}

