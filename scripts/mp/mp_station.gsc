#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\compass;
#using scripts\core_common\doors_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\util_shared;
#using scripts\mp_common\draft;
#using scripts\mp_common\load;
#using scripts\mp_common\util;

#namespace mp_station;

// Namespace mp_station/level_init
// Params 1, eflags: 0x40
// Checksum 0x99a722fb, Offset: 0x118
// Size: 0xcc
function event_handler[level_init] main(eventstruct) {
    load::main();
    compass::setupminimap("");
    level.cleandepositpoints = array((-144, -1706, 176), (-2652, 782, -23), (1496, -624, 200), (-1518, -1132, -16), (1992, 496, 32));
    callback::on_game_playing(&on_game_playing);
    level thread function_2cdcf5c3();
}

// Namespace mp_station/mp_station
// Params 0, eflags: 0x1 linked
// Checksum 0xfcdee257, Offset: 0x1f0
// Size: 0x5c
function function_2cdcf5c3() {
    if (util::isfirstround()) {
        while (!draft::function_d255fb3e()) {
            waitframe(1);
        }
        level thread scene::play("p8_fxanim_sta_helicopter_flyover_bundle", "Shot 1");
    }
}

// Namespace mp_station/mp_station
// Params 0, eflags: 0x1 linked
// Checksum 0xc08e2942, Offset: 0x258
// Size: 0x224
function on_game_playing() {
    array::delete_all(getentarray("sun_block", "targetname"));
    wait getdvarfloat(#"hash_205d729c5c415715", 0.3);
    scene::add_scene_func(#"hash_32e1d63da1ac27c1", &function_8efe95d4, "play");
    scene::add_scene_func(#"hash_415d5821c256de56", &function_8efe95d4, "play");
    if (util::isfirstround()) {
        level util::delay(getdvarfloat(#"hash_187afb4d5f703a4a", 0.2), undefined, &scene::play, "p8_fxanim_sta_helicopter_flyover_bundle", "Shot 2");
        level util::delay(getdvarfloat(#"hash_395638c05b097129", 0.2), undefined, &scene::play, #"hash_32e1d63da1ac27c1");
        level util::delay(getdvarfloat(#"hash_395638c05b097129", 0.2), undefined, &scene::play, #"hash_415d5821c256de56");
        return;
    }
    level scene::skipto_end(#"hash_32e1d63da1ac27c1");
    level scene::skipto_end(#"hash_415d5821c256de56");
}

// Namespace mp_station/mp_station
// Params 1, eflags: 0x1 linked
// Checksum 0x6565ee48, Offset: 0x488
// Size: 0x4c
function function_8efe95d4(a_ents) {
    if (isdefined(a_ents)) {
        array::wait_any(a_ents, "death");
        array::delete_all(a_ents);
    }
}

