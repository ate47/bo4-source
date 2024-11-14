#using scripts\core_common\flag_shared;
#using scripts\zm_common\zm_stats;
#using scripts\zm_common\zm_round_logic;
#using scripts\zm_common\gametypes\zm_gametype;
#using scripts\core_common\math_shared;
#using scripts\core_common\struct;

#namespace ztcm;

// Namespace ztcm/gametype_init
// Params 1, eflags: 0x40
// Checksum 0xc3c5ca36, Offset: 0xc0
// Size: 0xdc
function event_handler[gametype_init] main(eventstruct) {
    zm_gametype::main();
    level.onprecachegametype = &onprecachegametype;
    level.onstartgametype = &onstartgametype;
    level._game_module_custom_spawn_init_func = &zm_gametype::custom_spawn_init_func;
    level._game_module_stat_update_func = &zm_stats::survival_classic_custom_stat_update;
    level._round_start_func = &zm_round_logic::round_start;
    if (!level flag::exists(#"ztcm")) {
        level flag::init(#"ztcm", 1);
    }
}

// Namespace ztcm/ztcm
// Params 0, eflags: 0x0
// Checksum 0xb38914a1, Offset: 0x1a8
// Size: 0x1e
function onprecachegametype() {
    level.canplayersuicide = &zm_gametype::canplayersuicide;
}

// Namespace ztcm/ztcm
// Params 0, eflags: 0x0
// Checksum 0x53f3ceb2, Offset: 0x1d0
// Size: 0x154
function onstartgametype() {
    level.spawnmins = (0, 0, 0);
    level.spawnmaxs = (0, 0, 0);
    structs = struct::get_array("player_respawn_point", "targetname");
    foreach (struct in structs) {
        level.spawnmins = math::expand_mins(level.spawnmins, struct.origin);
        level.spawnmaxs = math::expand_maxs(level.spawnmaxs, struct.origin);
    }
    level.mapcenter = math::find_box_center(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
}

