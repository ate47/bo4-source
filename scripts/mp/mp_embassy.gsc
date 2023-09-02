// Atian COD Tools GSC decompiler test
#using scripts\core_common\doors_shared.gsc;
#using scripts\mp_common\load.gsc;
#using scripts\mp_common\draft.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\compass.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace mp_embassy;

// Namespace mp_embassy/level_init
// Params 1, eflags: 0x40
// Checksum 0x10f5d66f, Offset: 0x1b8
// Size: 0xfc
function event_handler[level_init] main(eventstruct) {
    clientfield::register("scriptmover", "spawn_flavor_apc_explosion", 1, 1, "counter");
    load::main();
    compass::setupminimap("");
    level.cleandepositpoints = array((1663, -2262, 11.25), (-506, -3186, 14), (3888, -32, 39), (71, -1169, 14), (3398, -2146, 7));
    level.var_f3e25805 = &function_c3c859e1;
    level thread function_34fc666e();
}

// Namespace mp_embassy/mp_embassy
// Params 0, eflags: 0x1 linked
// Checksum 0xf20670f1, Offset: 0x2c0
// Size: 0x19c
function function_34fc666e() {
    level endon(#"game_ended");
    if (util::isfirstround() && getgametypesetting(#"hash_5e5bd42399148b51") && draft::is_draft_this_round()) {
        while (!draft::function_d255fb3e()) {
            waitframe(1);
        }
        level thread scene::play(#"hash_127ce0c6d4b4f2aa");
        level thread scene::play(#"hash_127cdfc6d4b4f0f7");
        return;
    }
    var_a79220ea = getent("spawn_flavor_apc_explode", "targetname");
    var_a79220ea setmodel("veh_t8_mil_apc_macv_dead_no_turret_no_armor_mp_grey");
    scene::skipto_end(#"hash_ebe25ca358c0cba");
    level flag::wait_till("first_player_spawned");
    array::delete_all(getentarray("sun_block", "targetname"));
    exploder::exploder("fxexp_embassy_aftermath");
}

// Namespace mp_embassy/mp_embassy
// Params 0, eflags: 0x1 linked
// Checksum 0xb11b092e, Offset: 0x468
// Size: 0x19e
function function_c3c859e1() {
    array::delete_all(getentarray("sun_block", "targetname"));
    scene::stop(#"hash_127ce0c6d4b4f2aa", 1);
    scene::stop(#"hash_127cdfc6d4b4f0f7", 1);
    if (util::isfirstround() && getgametypesetting(#"hash_5e5bd42399148b51")) {
        exploder::exploder("fxexp_embassy_explosion");
        level util::delay(4, "game_ended", &scene::play, #"hash_ebe25ca358c0cba");
        level thread scene::play(#"hash_1971c36184b14ef8");
        var_a79220ea = getent("spawn_flavor_apc_explode", "targetname");
        var_a79220ea setmodel("veh_t8_mil_apc_macv_dead_no_turret_no_armor_mp_grey");
        var_a79220ea clientfield::increment("spawn_flavor_apc_explosion");
        return;
    }
}

