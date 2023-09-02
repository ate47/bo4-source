// Atian COD Tools GSC decompiler test
#using scripts\mp_common\draft.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace mp_morocco_scripted;

// Namespace mp_morocco_scripted/mp_morocco_scripted
// Params 0, eflags: 0x2
// Checksum 0x5c3c36f5, Offset: 0xc8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"mp_morocco_scripted", &__init__, &__main__, undefined);
}

// Namespace mp_morocco_scripted/mp_morocco_scripted
// Params 0, eflags: 0x1 linked
// Checksum 0xbac692d1, Offset: 0x118
// Size: 0x24
function __init__() {
    callback::on_game_playing(&on_game_playing);
}

// Namespace mp_morocco_scripted/mp_morocco_scripted
// Params 0, eflags: 0x1 linked
// Checksum 0x751afec4, Offset: 0x148
// Size: 0x2c
function __main__() {
    /#
        init_devgui();
    #/
    function_2cdcf5c3();
}

// Namespace mp_morocco_scripted/mp_morocco_scripted
// Params 0, eflags: 0x1 linked
// Checksum 0xd3aa0884, Offset: 0x180
// Size: 0x94
function on_game_playing() {
    array::delete_all(getentarray("sun_block", "targetname"));
    wait(getdvarfloat(#"hash_68cf1e8e429452b0", 0));
    if (util::isfirstround()) {
        level thread scene::play(#"p8_fxanim_mp_morocco_air_drop_bundle", "Shot 2");
    }
}

// Namespace mp_morocco_scripted/mp_morocco_scripted
// Params 0, eflags: 0x1 linked
// Checksum 0xcaa7bdd4, Offset: 0x220
// Size: 0x84
function function_2cdcf5c3() {
    if (util::isfirstround()) {
        while (!draft::function_d255fb3e()) {
            waitframe(1);
        }
        level thread scene::play(#"p8_fxanim_mp_morocco_air_drop_bundle", "Shot 1");
        return;
    }
    level scene::skipto_end(#"p8_fxanim_mp_morocco_air_drop_bundle");
}

// Namespace mp_morocco_scripted/mp_morocco_scripted
// Params 0, eflags: 0x0
// Checksum 0xa214bf72, Offset: 0x2b0
// Size: 0x9c
function init_devgui() {
    /#
        mapname = util::get_map_name();
        adddebugcommand("<unknown string>" + mapname + "<unknown string>");
        adddebugcommand("<unknown string>" + mapname + "<unknown string>");
        adddebugcommand("<unknown string>" + mapname + "<unknown string>");
    #/
}

