// Atian COD Tools GSC decompiler test
#using scripts\mp\mp_gridlock_sound.gsc;
#using scripts\mp\mp_gridlock_fx.gsc;
#using scripts\mp_common\load.gsc;
#using scripts\mp_common\gametypes\globallogic_spawn.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\compass.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace mp_gridlock;

// Namespace mp_gridlock/level_init
// Params 1, eflags: 0x40
// Checksum 0xa03b3233, Offset: 0x118
// Size: 0x174
function event_handler[level_init] main(eventstruct) {
    callback::on_game_playing(&on_game_playing);
    mp_gridlock_fx::main();
    mp_gridlock_sound::main();
    load::main();
    compass::setupminimap("");
    level.cleandepositpoints = array((138.5, -58.5, 60), (1904.5, 921.75, 8), (75, 1152, 0), (-1465.5, -1271, 8), (-106, -1500, 8));
    spawncollision("collision_clip_wall_128x128x10", "collider", (-957, -1170, 104), (0, 180, 0));
    spawncollision("collision_clip_wall_128x128x10", "collider", (-957, -1170, -24), (0, 180, 0));
    function_2cdcf5c3();
}

// Namespace mp_gridlock/mp_gridlock
// Params 0, eflags: 0x1 linked
// Checksum 0xc5d678cb, Offset: 0x298
// Size: 0x84
function on_game_playing() {
    array::delete_all(getentarray("sun_block", "targetname"));
    wait(getdvarfloat(#"hash_205d729c5c415715", 0.3));
    if (util::isfirstround()) {
        exploder::exploder("fxexp_tanker_explosion");
    }
}

// Namespace mp_gridlock/mp_gridlock
// Params 0, eflags: 0x1 linked
// Checksum 0xff49ff0a, Offset: 0x328
// Size: 0x2c
function function_2cdcf5c3() {
    if (!util::isfirstround()) {
        exploder::stop_exploder("fxexp_tanker_explosion");
    }
}

// Namespace mp_gridlock/mp_gridlock
// Params 0, eflags: 0x0
// Checksum 0xb889379, Offset: 0x360
// Size: 0x74
function init_devgui() {
    /#
        mapname = util::get_map_name();
        adddebugcommand("<unknown string>" + mapname + "<unknown string>");
        adddebugcommand("<unknown string>" + mapname + "<unknown string>");
    #/
}

