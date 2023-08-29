// Atian COD Tools GSC decompiler test
#include scripts/mp_common/draft.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/scene_shared.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;
#include scripts/core_common/array_shared.gsc;

#namespace mp_jungle2_alt_scripted;

// Namespace mp_jungle2_alt_scripted/mp_jungle2_alt_scripted
// Params 0, eflags: 0x2
// Checksum 0x2e3fb66e, Offset: 0x100
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"mp_jungle2_scripted", &__init__, &__main__, undefined);
}

// Namespace mp_jungle2_alt_scripted/mp_jungle2_alt_scripted
// Params 0, eflags: 0x0
// Checksum 0x45d14ca6, Offset: 0x150
// Size: 0x54
function __init__() {
    clientfield::register("scriptmover", "spawn_flavor_napalm_rumble", 1, 1, "counter");
    callback::on_game_playing(&on_game_playing);
}

// Namespace mp_jungle2_alt_scripted/mp_jungle2_alt_scripted
// Params 0, eflags: 0x0
// Checksum 0x4c186b5, Offset: 0x1b0
// Size: 0x2c
function __main__() {
    /#
        init_devgui();
    #/
    function_2cdcf5c3();
}

// Namespace mp_jungle2_alt_scripted/mp_jungle2_alt_scripted
// Params 0, eflags: 0x0
// Checksum 0x8ea36e26, Offset: 0x1e8
// Size: 0x178
function on_game_playing() {
    array::delete_all(getentarray("sun_block", "targetname"));
    if (!getdvarint(#"hash_14f8907ba73d8e4f", 1)) {
        return;
    }
    wait(getdvarfloat(#"hash_68cf1e8e429452b0", 0));
    if (util::isfirstround()) {
        level thread scene::add_scene_func(#"p8_fxanim_mp_jun_napalm_drop_bundle", &function_69a9563e, "Shot 2");
        level thread scene::play(#"p8_fxanim_mp_jun_napalm_drop_bundle", "Shot 2");
        foreach (scene in level.var_38bda94) {
            level thread scene::play(scene);
        }
    }
}

// Namespace mp_jungle2_alt_scripted/mp_jungle2_alt_scripted
// Params 0, eflags: 0x0
// Checksum 0x753cecb6, Offset: 0x368
// Size: 0x220
function function_2cdcf5c3() {
    if (!getdvarint(#"hash_14f8907ba73d8e4f", 1)) {
        return;
    }
    level.var_38bda94 = array(#"p8_fxanim_mp_seaside_parrots_orange_flock_01_bundle", #"p8_fxanim_mp_seaside_parrots_orange_flock_02_bundle", #"p8_fxanim_mp_seaside_parrots_scarlet_flock_01_bundle", #"p8_fxanim_mp_seaside_parrots_scarlet_flock_02_bundle", #"p8_fxanim_mp_seaside_parrots_yellow_flock_01_bundle", #"p8_fxanim_mp_seaside_parrots_yellow_flock_02_bundle");
    if (util::isfirstround()) {
        foreach (scene in level.var_38bda94) {
            level thread scene::init(scene);
        }
        while (!draft::function_d255fb3e()) {
            waitframe(1);
        }
        level thread scene::play(#"p8_fxanim_mp_jun_napalm_drop_bundle", "Shot 1");
        return;
    }
    level thread scene::skipto_end(#"p8_fxanim_mp_jun_napalm_drop_bundle");
    foreach (scene in level.var_38bda94) {
        level thread scene::skipto_end(scene);
    }
}

// Namespace mp_jungle2_alt_scripted/mp_jungle2_alt_scripted
// Params 1, eflags: 0x0
// Checksum 0xaf219409, Offset: 0x590
// Size: 0xa8
function function_69a9563e(a_ents) {
    while (isdefined(a_ents[#"prop 1"])) {
        a_ents[#"prop 1"] waittill(#"napalm_rumble", #"death");
        if (isdefined(a_ents[#"prop 1"])) {
            a_ents[#"prop 1"] clientfield::increment("spawn_flavor_napalm_rumble");
        }
    }
}

// Namespace mp_jungle2_alt_scripted/mp_jungle2_alt_scripted
// Params 0, eflags: 0x0
// Checksum 0x12e8ed39, Offset: 0x640
// Size: 0x9c
function init_devgui() {
    /#
        mapname = util::get_map_name();
        adddebugcommand("<unknown string>" + mapname + "<unknown string>");
        adddebugcommand("<unknown string>" + mapname + "<unknown string>");
        adddebugcommand("<unknown string>" + mapname + "<unknown string>");
    #/
}

