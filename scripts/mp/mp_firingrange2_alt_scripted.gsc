#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\mp_common\draft;

#namespace mp_firingrange2_alt_scripted;

// Namespace mp_firingrange2_alt_scripted/mp_firingrange2_alt_scripted
// Params 0, eflags: 0x2
// Checksum 0x1c935634, Offset: 0xc8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"mp_firingrange2_alt_scripted", &__init__, &__main__, undefined);
}

// Namespace mp_firingrange2_alt_scripted/mp_firingrange2_alt_scripted
// Params 0, eflags: 0x1 linked
// Checksum 0x60a82057, Offset: 0x118
// Size: 0x24
function __init__() {
    callback::on_game_playing(&on_game_playing);
}

// Namespace mp_firingrange2_alt_scripted/mp_firingrange2_alt_scripted
// Params 0, eflags: 0x1 linked
// Checksum 0xdec49f0a, Offset: 0x148
// Size: 0x2c
function __main__() {
    /#
        init_devgui();
    #/
    function_2cdcf5c3();
}

// Namespace mp_firingrange2_alt_scripted/mp_firingrange2_alt_scripted
// Params 0, eflags: 0x1 linked
// Checksum 0x5d89e816, Offset: 0x180
// Size: 0x94
function on_game_playing() {
    array::delete_all(getentarray("sun_block", "targetname"));
    wait getdvarfloat(#"hash_68cf1e8e429452b0", 0);
    if (util::isfirstround()) {
        level thread scene::play(#"p8_fxanim_mp_fir_flyover_bundle", "Shot 2");
    }
}

// Namespace mp_firingrange2_alt_scripted/mp_firingrange2_alt_scripted
// Params 0, eflags: 0x1 linked
// Checksum 0x25cb11a4, Offset: 0x220
// Size: 0xb4
function function_2cdcf5c3() {
    if (!getdvarint(#"hash_14f8907ba73d8e4f", 1)) {
        return;
    }
    if (util::isfirstround()) {
        while (!draft::function_d255fb3e()) {
            waitframe(1);
        }
        level thread scene::play(#"p8_fxanim_mp_fir_flyover_bundle", "Shot 1");
        return;
    }
    level scene::skipto_end(#"p8_fxanim_mp_fir_flyover_bundle");
}

/#

    // Namespace mp_firingrange2_alt_scripted/mp_firingrange2_alt_scripted
    // Params 0, eflags: 0x0
    // Checksum 0x6a46a7ae, Offset: 0x2e0
    // Size: 0x9c
    function init_devgui() {
        mapname = util::get_map_name();
        adddebugcommand("<dev string:x38>" + mapname + "<dev string:x48>");
        adddebugcommand("<dev string:x38>" + mapname + "<dev string:x87>");
        adddebugcommand("<dev string:x38>" + mapname + "<dev string:xc6>");
    }

#/
