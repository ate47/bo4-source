// Atian COD Tools GSC decompiler test
#include scripts/mp_common/gametypes/ct_core.csc;
#include scripts/core_common/struct.csc;
#include scripts/core_common/clientfield_shared.csc;
#include script_4196ba3abca31535;

#namespace ct_seraph;

// Namespace ct_seraph/gametype_init
// Params 1, eflags: 0x40
// Checksum 0xa4c1d915, Offset: 0x118
// Size: 0x10a
function event<gametype_init> main(eventstruct) {
    ct_core::function_46e95cc7();
    ct_core::function_fa03fc55();
    level.hardpoint_bar = luielembar_ct::register("hardpoint_bar");
    clientfield::register("world", "spawn_vase", 1, 1, "counter", &function_649c09ac, 0, 0);
    clientfield::register("clientuimodel", "hudItems.spawnSelectHidePrompt", 1, 1, "int", undefined, 0, 0);
    level.progress_bar = luielembar_ct::register("progress_bar");
    level.var_e3049e92 = 1;
    level.var_7b05c4b5 = 0;
}

// Namespace ct_seraph/ct_seraph
// Params 7, eflags: 0x0
// Checksum 0xe8f8570b, Offset: 0x230
// Size: 0xe6
function function_649c09ac(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval != oldval && newval) {
        wait(1);
        s_loc = struct::get("s_vase_loc", "targetname");
        v_angles = (0, 0, 0);
        v_velocity = (0, 0, 0);
        dynent = createdynentandlaunch(localclientnum, #"hash_6ecc99dcfe1ebd56", s_loc.origin, v_angles, (0, 0, 0), v_velocity);
    }
}

