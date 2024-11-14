#using scripts\zm_common\zm_stats;
#using scripts\zm_common\zm_round_logic;
#using scripts\zm_common\gametypes\zm_gametype;
#using scripts\core_common\struct;
#using scripts\core_common\math_shared;

#namespace ztutorial;

// Namespace ztutorial/gametype_init
// Params 1, eflags: 0x40
// Checksum 0xa32a24c8, Offset: 0xb8
// Size: 0xbe
function event_handler[gametype_init] main(eventstruct) {
    zm_gametype::main();
    level.disableclassselection = 1;
    level.onprecachegametype = &onprecachegametype;
    level.onstartgametype = &onstartgametype;
    level.callbackplayerlaststand = &function_1b27b9d0;
    level._game_module_custom_spawn_init_func = &zm_gametype::custom_spawn_init_func;
    level._game_module_stat_update_func = &zm_stats::survival_classic_custom_stat_update;
    level._round_start_func = &zm_round_logic::round_start;
}

// Namespace ztutorial/ztutorial
// Params 0, eflags: 0x0
// Checksum 0x31de652, Offset: 0x180
// Size: 0x1e
function onprecachegametype() {
    level.canplayersuicide = &zm_gametype::canplayersuicide;
}

// Namespace ztutorial/ztutorial
// Params 0, eflags: 0x0
// Checksum 0xfc2ec3d8, Offset: 0x1a8
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

// Namespace ztutorial/ztutorial
// Params 9, eflags: 0x0
// Checksum 0x281c8424, Offset: 0x308
// Size: 0x4c
function function_1b27b9d0(einflictor, eattacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, delayoverride) {
    
}

