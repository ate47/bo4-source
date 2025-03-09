#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\mp_common\draft;
#using scripts\mp_common\util;

#namespace mp_casino_scripted;

// Namespace mp_casino_scripted/mp_casino_scripted
// Params 0, eflags: 0x2
// Checksum 0xb435817a, Offset: 0x148
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"mp_casino_scripted", &__init__, &__main__, undefined);
}

// Namespace mp_casino_scripted/mp_casino_scripted
// Params 0, eflags: 0x0
// Checksum 0x35439ebf, Offset: 0x198
// Size: 0x24
function __init__() {
    callback::on_game_playing(&on_game_playing);
}

// Namespace mp_casino_scripted/mp_casino_scripted
// Params 0, eflags: 0x0
// Checksum 0x9b024fd6, Offset: 0x1c8
// Size: 0x2c
function __main__() {
    /#
        init_devgui();
    #/
    function_2cdcf5c3();
}

// Namespace mp_casino_scripted/mp_casino_scripted
// Params 0, eflags: 0x0
// Checksum 0x8022030c, Offset: 0x200
// Size: 0x13e
function on_game_playing() {
    array::delete_all(getentarray("sun_block", "targetname"));
    if (util::function_94a3be2()) {
        return;
    }
    wait getdvarfloat(#"hash_68cf1e8e429452b0", 0);
    if (util::isfirstround()) {
        array::run_all(getentarray("spawn_flavor_veh", "script_noteworthy"), &show);
        level thread scene::skipto_end("p8_fxanim_mp_cas_swat_driveup_bundle");
        level util::delay(getdvarfloat(#"hash_187afb4d5f703a4a", 0.2), undefined, &scene::play, "p8_fxanim_mp_cas_helicopter_flyover_bundle", "Shot 2");
        return;
    }
}

// Namespace mp_casino_scripted/mp_casino_scripted
// Params 0, eflags: 0x0
// Checksum 0x4e067427, Offset: 0x348
// Size: 0xce
function function_2cdcf5c3() {
    if (util::function_94a3be2()) {
        return;
    }
    if (util::isfirstround()) {
        array::run_all(getentarray("spawn_flavor_veh", "script_noteworthy"), &hide);
        while (!draft::function_d255fb3e()) {
            waitframe(1);
        }
        level thread scene::play("p8_fxanim_mp_cas_helicopter_flyover_bundle", "Shot 1");
        level thread scene::play("p8_fxanim_mp_cas_swat_driveup_bundle");
        return;
    }
}

/#

    // Namespace mp_casino_scripted/mp_casino_scripted
    // Params 0, eflags: 0x0
    // Checksum 0x557a4519, Offset: 0x420
    // Size: 0x9c
    function init_devgui() {
        mapname = util::get_map_name();
        adddebugcommand("<dev string:x38>" + mapname + "<dev string:x48>");
        adddebugcommand("<dev string:x38>" + mapname + "<dev string:x87>");
        adddebugcommand("<dev string:x38>" + mapname + "<dev string:xc6>");
    }

#/
