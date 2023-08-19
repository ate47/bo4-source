// Atian COD Tools GSC decompiler test
#include scripts/mp_common/gametypes/globallogic_spawn.gsc;
#include scripts/mp/mp_frenetic_sound.gsc;
#include scripts/mp/mp_frenetic_fx.gsc;
#include scripts/mp_common/load.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/struct.gsc;
#include scripts/core_common/scene_shared.gsc;
#include scripts/core_common/exploder_shared.gsc;
#include scripts/core_common/compass.gsc;
#include scripts/core_common/callbacks_shared.gsc;
#include scripts/core_common/array_shared.gsc;

#namespace mp_frenetic;

// Namespace mp_frenetic/level_init
// Params 1, eflags: 0x40
// Checksum 0x97a0ff1f, Offset: 0x230
// Size: 0x19c
function event<level_init> main(eventstruct) {
    level.var_cfec596d = 828;
    level.var_39b27fbe = -3294;
    level.var_8db9ea19 = 4500;
    level.var_c6129172 = 585;
    level.var_ae8d87c7 = -3316;
    level.var_98c93497 = 585;
    level.var_31be45ec = -3316;
    level.uav_z_offset = 800;
    callback::on_game_playing(&on_game_playing);
    mp_frenetic_fx::main();
    mp_frenetic_sound::main();
    load::main();
    compass::setupminimap("");
    level.cleandepositpoints = array((235.75, 1731.25, 190.5), (249.75, -1743.25, 190.5), (2128, 0, 65), (-128, -704, 191), (936, 552, 193));
    level thread function_309ff24f();
    level thread function_2cdcf5c3();
}

// Namespace mp_frenetic/mp_frenetic
// Params 0, eflags: 0x1 linked
// Checksum 0x7b8448c, Offset: 0x3d8
// Size: 0x76
function function_309ff24f() {
    var_e4a890f8 = getentarray("rotate_model", "targetname");
    if (isdefined(var_e4a890f8)) {
        for (i = 0; i < var_e4a890f8.size; i++) {
            var_e4a890f8[i] thread rotate();
        }
    }
}

// Namespace mp_frenetic/mp_frenetic
// Params 0, eflags: 0x1 linked
// Checksum 0x3c8312af, Offset: 0x458
// Size: 0xe2
function rotate() {
    if (!isdefined(self.speed)) {
        self.speed = 0.5;
    }
    while (1) {
        if (self.script_noteworthy == "z") {
            self rotateyaw(360, self.speed);
        } else if (self.script_noteworthy == "x") {
            self rotateroll(360, self.speed);
        } else if (self.script_noteworthy == "y") {
            self rotatepitch(360, self.speed);
        }
        wait(self.speed - 0.1);
    }
}

// Namespace mp_frenetic/mp_frenetic
// Params 0, eflags: 0x1 linked
// Checksum 0x33b973ab, Offset: 0x548
// Size: 0x20c
function on_game_playing() {
    array::delete_all(getentarray("sun_block", "targetname"));
    wait(getdvarfloat(#"hash_205d729c5c415715", 0.5));
    if (util::isfirstround()) {
        level scene::add_scene_func(#"hash_16dc1766fc34ff0b", &function_dd64960c, "play");
        level thread scene::play(#"hash_5438c10f67365687");
        level thread scene::play(#"hash_afda7c01698afa5");
        level thread scene::play(#"hash_4e0b457de7a522e2");
        level thread scene::play(#"hash_7051e29faa930b3");
        level thread scene::play(#"hash_623d98e8f3bc2913");
        level thread scene::play(#"hash_6f27f62956c4c8ec");
        level thread scene::play(#"hash_f73e7a7f9951585");
        level thread scene::play(#"hash_461d1f80df3fcf9");
        level thread scene::play(#"hash_16dc1766fc34ff0b");
        return;
    }
    exploder::stop_exploder("fxexp_wind_gust_fast");
    exploder::stop_exploder("fxexp_wind_gust");
    exploder::exploder("fxexp_wind_constant");
}

// Namespace mp_frenetic/mp_frenetic
// Params 1, eflags: 0x1 linked
// Checksum 0x4258386, Offset: 0x760
// Size: 0xcc
function function_dd64960c(a_ents) {
    if (isdefined(a_ents[#"prop 1"])) {
        var_7425591a = a_ents[#"prop 1"] gettagorigin("tarp_06_jnt") + vectorscale((0, 0, -1), 8);
        a_ents[#"prop 1"] waittill(#"hash_7b96690bce0dcf30", #"death");
        physicsexplosionsphere(var_7425591a, 1024, 1, 1);
    }
}

// Namespace mp_frenetic/mp_frenetic
// Params 0, eflags: 0x1 linked
// Checksum 0xa6cea347, Offset: 0x838
// Size: 0x2cc
function function_2cdcf5c3() {
    if (util::isfirstround()) {
        level thread scene::init(#"hash_16dc1766fc34ff0b");
        level thread scene::init(#"hash_5438c10f67365687");
        level thread scene::init(#"hash_afda7c01698afa5");
        level thread scene::init(#"hash_4e0b457de7a522e2");
        level thread scene::init(#"hash_7051e29faa930b3");
        level thread scene::init(#"hash_623d98e8f3bc2913");
        level thread scene::init(#"hash_6f27f62956c4c8ec");
        level thread scene::init(#"hash_f73e7a7f9951585");
        return;
    }
    array::thread_all(struct::get_array("p8_fxanim_mp_frenetic_solar_panels_bundle", "scriptbundlename"), &scene::play, #"hash_45b34c2c136a96d6");
    array::thread_all(struct::get_array("p8_fxanim_mp_frenetic_solar_panels_delay_01_bundle", "scriptbundlename"), &scene::play, #"hash_2666ce13045666f4");
    array::thread_all(struct::get_array("p8_fxanim_mp_frenetic_solar_panels_delay_02_bundle", "scriptbundlename"), &scene::play, #"hash_6b147234262da2b1");
    array::thread_all(struct::get_array("p8_fxanim_mp_frenetic_solar_panels_delay_03_bundle", "scriptbundlename"), &scene::play, #"hash_10ba615ce8a42fa");
    level thread scene::skipto_end(#"hash_623d98e8f3bc2913", undefined, undefined, 1);
    level thread scene::skipto_end(#"hash_6f27f62956c4c8ec", undefined, undefined, 1);
    level thread scene::skipto_end(#"hash_f73e7a7f9951585", undefined, undefined, 1);
}

