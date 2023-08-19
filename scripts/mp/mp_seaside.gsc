// Atian COD Tools GSC decompiler test
#include scripts/mp_common/gametypes/globallogic_spawn.gsc;
#include scripts/mp/mp_seaside_sound.gsc;
#include scripts/mp/mp_seaside_fx.gsc;
#include scripts/mp_common/util.gsc;
#include scripts/mp_common/load.gsc;
#include scripts/mp_common/draft.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/scene_shared.gsc;
#include scripts/core_common/compass.gsc;
#include scripts/core_common/clientfield_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;
#include scripts/core_common/array_shared.gsc;
#include scripts/core_common/struct.gsc;

#namespace mp_seaside;

// Namespace mp_seaside/level_init
// Params 1, eflags: 0x40
// Checksum 0xc9feaf01, Offset: 0x158
// Size: 0x2fc
function event<level_init> main(eventstruct) {
    precache();
    level.var_7fd6bd44 = 1800;
    callback::on_game_playing(&on_game_playing);
    clientfield::register("world", "remove_blood_decals", 1, 1, "int");
    clientfield::register("vehicle", "hide_tank_rob", 1, 1, "int");
    mp_seaside_fx::main();
    mp_seaside_sound::main();
    /#
        init_devgui();
    #/
    load::main();
    compass::setupminimap("");
    level.cleandepositpoints = array((0, -1016, 711), (1120, 288, 712), (-499, -2437, 776), (-745, -1165, 776), (775, -2820, 725));
    var_8751af93 = struct::get("spawn_flavor_tanks", "targetname");
    if (isdefined(var_8751af93) && isdefined(var_8751af93.scene_ents)) {
        var_8751af93.scene_ents[#"hash_5c059d1418878ba4"] clientfield::set("hide_tank_rob", 1);
        var_8751af93.scene_ents[#"hash_5c05a014188790bd"] clientfield::set("hide_tank_rob", 1);
        var_8751af93.scene_ents[#"hash_5c059f1418878f0a"] clientfield::set("hide_tank_rob", 1);
        var_8751af93.scene_ents[#"hash_5c059d1418878ba4"] notsolid();
        var_8751af93.scene_ents[#"hash_5c05a014188790bd"] notsolid();
        var_8751af93.scene_ents[#"hash_5c059f1418878f0a"] notsolid();
    }
}

// Namespace mp_seaside/mp_seaside
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x460
// Size: 0x4
function precache() {
    
}

// Namespace mp_seaside/mp_seaside
// Params 0, eflags: 0x1 linked
// Checksum 0xcfd6b011, Offset: 0x470
// Size: 0x11c
function on_game_playing() {
    array::delete_all(getentarray("sun_block", "targetname"));
    wait(getdvarfloat(#"hash_205d729c5c415715", 0));
    if (util::isfirstround()) {
        if (!(isdefined(level.var_2a0adaaa) && level.var_2a0adaaa)) {
            level clientfield::set("remove_blood_decals", 1);
        }
        level thread scene::play(#"hash_572bcdc91f4f9a96");
        if (getdvarint(#"hash_1ee1f013d124a26a", 1)) {
            level thread scene::play(#"hash_3d50b9f32e7f67b", "Shot 2");
        }
    }
}

// Namespace mp_seaside/mp_seaside
// Params 0, eflags: 0x0
// Checksum 0xf3de13a3, Offset: 0x598
// Size: 0x12c
function function_2cdcf5c3() {
    if (util::function_94a3be2()) {
        return;
    } else if (util::isfirstround()) {
        level scene::init(#"hash_572bcdc91f4f9a96");
        if (getdvarint(#"hash_1ee1f013d124a26a", 1)) {
            while (!draft::function_d255fb3e()) {
                waitframe(1);
            }
            level thread scene::play(#"hash_3d50b9f32e7f67b", "Shot 1");
        }
        return;
    }
    level scene::skipto_end(#"hash_572bcdc91f4f9a96");
    if (getdvarint(#"hash_1ee1f013d124a26a", 1)) {
        level scene::skipto_end(#"hash_3d50b9f32e7f67b");
    }
}

// Namespace mp_seaside/mp_seaside
// Params 0, eflags: 0x0
// Checksum 0x11e77e44, Offset: 0x6d0
// Size: 0x74
function init_devgui() {
    /#
        mapname = util::get_map_name();
        adddebugcommand("<unknown string>" + mapname + "<unknown string>");
        adddebugcommand("<unknown string>" + mapname + "<unknown string>");
    #/
}

