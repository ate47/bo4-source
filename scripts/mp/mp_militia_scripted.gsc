// Atian COD Tools GSC decompiler test
#include scripts/mp_common/draft.gsc;
#include scripts/core_common/exploder_shared.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/scene_shared.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;
#include scripts/core_common/array_shared.gsc;

#namespace mp_militia_scripted;

// Namespace mp_militia_scripted/mp_militia_scripted
// Params 0, eflags: 0x2
// Checksum 0x27246085, Offset: 0xe0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"mp_militia_scripted", &__init__, &__main__, undefined);
}

// Namespace mp_militia_scripted/mp_militia_scripted
// Params 0, eflags: 0x1 linked
// Checksum 0xeb0763b8, Offset: 0x130
// Size: 0x24
function __init__() {
    callback::on_game_playing(&on_game_playing);
}

// Namespace mp_militia_scripted/mp_militia_scripted
// Params 0, eflags: 0x1 linked
// Checksum 0x1507912e, Offset: 0x160
// Size: 0x2c
function __main__() {
    /#
        init_devgui();
    #/
    function_2cdcf5c3();
}

// Namespace mp_militia_scripted/mp_militia_scripted
// Params 0, eflags: 0x1 linked
// Checksum 0x9c09c0a9, Offset: 0x198
// Size: 0x94
function on_game_playing() {
    array::delete_all(getentarray("sun_block", "targetname"));
    wait(getdvarfloat(#"hash_68cf1e8e429452b0", 0));
    if (util::isfirstround()) {
        level thread scene::play(#"hash_49234464e6c43e3d", "Shot 2");
    }
}

// Namespace mp_militia_scripted/mp_militia_scripted
// Params 0, eflags: 0x1 linked
// Checksum 0x446820dc, Offset: 0x238
// Size: 0x9c
function function_2cdcf5c3() {
    if (util::isfirstround()) {
        while (!draft::function_d255fb3e()) {
            waitframe(1);
        }
        level thread scene::play(#"hash_49234464e6c43e3d", "Shot 1");
        return;
    }
    level scene::skipto_end(#"hash_49234464e6c43e3d");
    exploder::exploder("fxexp_fires");
}

// Namespace mp_militia_scripted/mp_militia_scripted
// Params 0, eflags: 0x0
// Checksum 0x97ec261, Offset: 0x2e0
// Size: 0x9c
function init_devgui() {
    /#
        mapname = util::get_map_name();
        adddebugcommand("<unknown string>" + mapname + "<unknown string>");
        adddebugcommand("<unknown string>" + mapname + "<unknown string>");
        adddebugcommand("<unknown string>" + mapname + "<unknown string>");
    #/
}

