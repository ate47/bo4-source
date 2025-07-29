#using scripts\core_common\math_shared;
#using scripts\core_common\struct;
#using scripts\zm_common\gametypes\zm_gametype;
#using scripts\zm_common\gametypes\ztcm;
#using scripts\zm_common\zm_round_logic;
#using scripts\zm_common\zm_stats;

#namespace ztcm_escape;

// Namespace ztcm_escape/gametype_init
// Params 1, eflags: 0x40
// Checksum 0x1a468aaa, Offset: 0x98
// Size: 0x24
function event_handler[gametype_init] main( eventstruct )
{
    ztcm::main( eventstruct );
}

