#using scripts\mp\mp_madagascar_sound.gsc;
#using scripts\mp\mp_madagascar_fx.gsc;
#using scripts\mp_common\util.gsc;
#using scripts\mp_common\load.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\compass.gsc;

#namespace mp_madagascar;

// Namespace mp_madagascar/level_init
// Params 1, eflags: 0x40
// Checksum 0x78b0a8b3, Offset: 0x148
// Size: 0x11c
function event_handler[level_init] main(eventstruct) {
    mp_madagascar_fx::main();
    mp_madagascar_sound::main();
    setdvar(#"hash_3910a4196fe6b62e", 0);
    load::main();
    compass::setupminimap("");
    level.cleandepositpoints = array((1628.25, -356.25, 16), (1635, 2070, 187), (-1884.25, -156.75, -86.5), (463.25, 386.25, 196));
    callback::on_game_playing(&on_game_playing);
    level thread function_2cdcf5c3();
}

// Namespace mp_madagascar/mp_madagascar
// Params 0, eflags: 0x1 linked
// Checksum 0xf7de3094, Offset: 0x270
// Size: 0x3c
function function_2cdcf5c3() {
    if (util::isfirstround()) {
        level thread scene::play("p8_fxanim_mp_mad_lemurs_01_bundle", "idle");
    }
}

// Namespace mp_madagascar/mp_madagascar
// Params 0, eflags: 0x1 linked
// Checksum 0x94a76a88, Offset: 0x2b8
// Size: 0x154
function on_game_playing() {
    array::delete_all(getentarray("sun_block", "targetname"));
    level flag::wait_till("first_player_spawned");
    wait(getdvarfloat(#"hash_205d729c5c415715", 0));
    if (util::isfirstround()) {
        level thread scene::play("p8_fxanim_mp_mad_lemurs_01_bundle", "run");
        level thread scene::play("p8_fxanim_mp_mad_heli_aid_bundle");
        util::delay(7, undefined, &scene::stop, "p8_fxanim_mp_mad_lemurs_01_bundle", 1);
        util::delay(12, undefined, &scene::stop, "p8_fxanim_mp_mad_heli_aid_bundle", 1);
    }
}

