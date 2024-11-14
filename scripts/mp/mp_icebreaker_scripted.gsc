#using scripts\mp_common\draft;
#using scripts\core_common\util_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\array_shared;

#namespace mp_icebreaker_scripted;

// Namespace mp_icebreaker_scripted/mp_icebreaker_scripted
// Params 0, eflags: 0x2
// Checksum 0x4c6336af, Offset: 0xd0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"mp_icebreaker_scripted", &__init__, &__main__, undefined);
}

// Namespace mp_icebreaker_scripted/mp_icebreaker_scripted
// Params 0, eflags: 0x1 linked
// Checksum 0xa789ddb0, Offset: 0x120
// Size: 0x24
function __init__() {
    callback::on_game_playing(&on_game_playing);
}

// Namespace mp_icebreaker_scripted/mp_icebreaker_scripted
// Params 0, eflags: 0x1 linked
// Checksum 0xcd6a277c, Offset: 0x150
// Size: 0x2c
function __main__() {
    /#
        init_devgui();
    #/
    function_2cdcf5c3();
}

// Namespace mp_icebreaker_scripted/mp_icebreaker_scripted
// Params 0, eflags: 0x1 linked
// Checksum 0xc3db7607, Offset: 0x188
// Size: 0x116
function on_game_playing() {
    array::delete_all(getentarray("sun_block", "targetname"));
    if (!getdvarint(#"hash_14f8907ba73d8e4f", 1)) {
        return;
    }
    wait getdvarfloat(#"hash_68cf1e8e429452b0", 0);
    if (util::isfirstround()) {
        level thread scene::play(#"p8_fxanim_mp_icebreaker_ice_shelf_bundle", "Shot 2");
        level scene::play(#"p8_fxanim_mp_icebreaker_container_drop_bundle", "Shot 2");
        level thread scene::play(#"p8_fxanim_mp_icebreaker_container_drop_bundle", "Shot 3");
        return;
    }
}

// Namespace mp_icebreaker_scripted/mp_icebreaker_scripted
// Params 0, eflags: 0x1 linked
// Checksum 0x176acc79, Offset: 0x2a8
// Size: 0x124
function function_2cdcf5c3() {
    if (!getdvarint(#"hash_14f8907ba73d8e4f", 1)) {
        return;
    }
    if (util::isfirstround()) {
        while (!draft::function_d255fb3e()) {
            waitframe(1);
        }
        wait getdvarfloat(#"hash_142927c6a6db817c", 0);
        level thread scene::play(#"p8_fxanim_mp_icebreaker_container_drop_bundle", "Shot 1");
        level thread scene::play(#"p8_fxanim_mp_icebreaker_ice_shelf_bundle", "Shot 1");
        return;
    }
    level thread scene::skipto_end(#"p8_fxanim_mp_icebreaker_container_drop_bundle");
    level thread scene::skipto_end(#"p8_fxanim_mp_icebreaker_ice_shelf_bundle");
}

/#

    // Namespace mp_icebreaker_scripted/mp_icebreaker_scripted
    // Params 0, eflags: 0x0
    // Checksum 0xc5807161, Offset: 0x3d8
    // Size: 0x9c
    function init_devgui() {
        mapname = util::get_map_name();
        adddebugcommand("<dev string:x38>" + mapname + "<dev string:x48>");
        adddebugcommand("<dev string:x38>" + mapname + "<dev string:x87>");
        adddebugcommand("<dev string:x38>" + mapname + "<dev string:xc6>");
    }

#/
