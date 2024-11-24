#using scripts\core_common\exploder_shared;
#using scripts\core_common\util_shared;
#using scripts\mp_common\item_world;
#using scripts\mp_common\load;
#using scripts\wz\wz_escape_ffotd;
#using scripts\wz_common\wz_nixie_tubes;

#namespace wz_escape;

// Namespace wz_escape/level_init
// Params 1, eflags: 0x40
// Checksum 0xd9b1c720, Offset: 0xb8
// Size: 0x1e4
function event_handler[level_init] main(eventstruct) {
    setsaveddvar(#"enable_global_wind", 1);
    setsaveddvar(#"wind_global_vector", "88 0 0");
    setsaveddvar(#"wind_global_low_altitude", 0);
    setsaveddvar(#"wind_global_hi_altitude", 10000);
    setsaveddvar(#"wind_global_low_strength_percent", 100);
    load::main();
    setdvar(#"cg_aggressivecullradius", 100);
    setdvar(#"hash_53f625ed150e7700", 12000);
    if (isdefined(getgametypesetting(#"hash_26f00de198472b81")) && getgametypesetting(#"hash_26f00de198472b81")) {
        setdvar(#"hash_53f625ed150e7700", 6000);
    }
    util::waitforclient(0);
    level.sensor_dart_radius = 1200;
    level thread function_e656c6cb();
}

// Namespace wz_escape/wz_escape
// Params 0, eflags: 0x1 linked
// Checksum 0xab20ed31, Offset: 0x2a8
// Size: 0x2c
function function_e656c6cb() {
    item_world::function_4de3ca98();
    exploder::exploder("fxexp_portal_idle");
}

