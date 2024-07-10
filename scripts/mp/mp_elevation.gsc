#using scripts\mp\mp_elevation_sound.gsc;
#using scripts\mp\mp_elevation_fx.gsc;
#using scripts\mp_common\draft.gsc;
#using scripts\mp_common\util.gsc;
#using scripts\mp_common\load.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\mp_common\gametypes\globallogic_spawn.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\compass.gsc;

#namespace mp_elevation;

// Namespace mp_elevation/level_init
// Params 1, eflags: 0x40
// Checksum 0x296baf2b, Offset: 0x160
// Size: 0x18c
function event_handler[level_init] main(eventstruct) {
    level.var_cfec596d = -500;
    level.var_39b27fbe = -3500;
    level.var_8db9ea19 = 5500;
    level.var_c6129172 = -1500;
    level.var_ae8d87c7 = -2500;
    level.var_98c93497 = -1500;
    level.var_31be45ec = -2500;
    level.var_8ac94558 = 3200;
    level.uav_z_offset = 3200;
    mp_elevation_fx::main();
    mp_elevation_sound::main();
    load::main();
    compass::setupminimap("");
    level.cleandepositpoints = array((-763.75, -687.75, 7), (365, 1355, 264), (550, 164, 169), (-160, 268, 34.5), (622.75, -1206.75, 151));
    callback::on_game_playing(&on_game_playing);
    level thread function_2cdcf5c3();
}

// Namespace mp_elevation/mp_elevation
// Params 0, eflags: 0x1 linked
// Checksum 0x6e366fdc, Offset: 0x2f8
// Size: 0xbc
function function_2cdcf5c3() {
    if (util::isfirstround()) {
        while (!draft::function_d255fb3e()) {
            waitframe(1);
        }
        exploder::exploder("fxexp_mist_gust");
        exploder::exploder("fxexp_snow_gust");
        level thread scene::play(#"p8_fxanim_mp_ele_tree_gust_01_bundle", "shot 1");
        level thread scene::play(#"p8_fxanim_mp_ele_tree_gust_02_bundle", "shot 1");
    }
}

// Namespace mp_elevation/mp_elevation
// Params 0, eflags: 0x1 linked
// Checksum 0x777883b3, Offset: 0x3c0
// Size: 0x14c
function on_game_playing() {
    array::delete_all(getentarray("sun_block", "targetname"));
    level flag::wait_till("first_player_spawned");
    wait(getdvarfloat(#"hash_205d729c5c415715", 0));
    level util::delay(1.5, undefined, &function_fb047aa8);
    level util::delay(1.5, undefined, &stop_exploders);
    level thread scene::play(#"p8_fxanim_mp_ele_tree_gust_01_bundle", "shot 2");
    level thread scene::play(#"p8_fxanim_mp_ele_tree_gust_02_bundle", "shot 2");
    level thread scene::play(#"p8_fxanim_mp_ele_flower_pots_gust_bundle");
}

// Namespace mp_elevation/mp_elevation
// Params 0, eflags: 0x1 linked
// Checksum 0x9a98f2a9, Offset: 0x518
// Size: 0x1c
function function_fb047aa8() {
    exploder::exploder("fxexp_heli_exp");
}

// Namespace mp_elevation/mp_elevation
// Params 0, eflags: 0x1 linked
// Checksum 0x8f0cb42e, Offset: 0x540
// Size: 0x34
function stop_exploders() {
    exploder::stop_exploder("fxexp_mist_gust");
    exploder::stop_exploder("fxexp_snow_gust");
}

