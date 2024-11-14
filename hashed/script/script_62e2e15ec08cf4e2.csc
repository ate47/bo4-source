#using scripts\core_common\scene_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\struct;

#namespace namespace_87e11242;

// Namespace namespace_87e11242/namespace_87e11242
// Params 0, eflags: 0x2
// Checksum 0x40397edf, Offset: 0x130
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_3ee2bcf1f7dc56c8", &init, undefined, undefined);
}

// Namespace namespace_87e11242/namespace_87e11242
// Params 0, eflags: 0x1 linked
// Checksum 0x362a9190, Offset: 0x178
// Size: 0xa4
function init() {
    init_fx();
    init_clientfields();
    level.var_4a2723a3 = struct::get("server_scene", "script_noteworthy");
    level.var_faee939b = struct::get_array("aat_dmg_fx", "targetname");
    level.var_1d6643ed = 0;
    array::sort_by_script_int(level.var_faee939b, 1);
}

// Namespace namespace_87e11242/namespace_87e11242
// Params 0, eflags: 0x1 linked
// Checksum 0x6db12a52, Offset: 0x228
// Size: 0x92
function init_fx() {
    level._effect[#"server_spark_fx"] = #"hash_620a92bcd2225e0f";
    level._effect[#"hash_170e9793dab7aa5b"] = #"hash_14eb4b8e52dfe0bb";
    level._effect[#"hash_78b4a1a435fd8bf7"] = #"hash_62f9570a97e8f893";
}

// Namespace namespace_87e11242/namespace_87e11242
// Params 0, eflags: 0x1 linked
// Checksum 0x67adb172, Offset: 0x2c8
// Size: 0x164
function init_clientfields() {
    clientfield::register("world", "" + #"hash_31a98ee76e835504", 1, 1, "int", &function_eae1fc85, 0, 0);
    clientfield::register("world", "" + #"hash_3284b0cf34bfe44e", 1, 1, "int", &function_85c61737, 0, 0);
    clientfield::register("world", "" + #"hash_b143d97bf92fc66", 1, 1, "counter", &function_e322771e, 0, 0);
    clientfield::register("world", "" + #"hash_28f972533bb468fd", 1, 1, "int", &function_d20d32f2, 0, 0);
}

// Namespace namespace_87e11242/namespace_87e11242
// Params 7, eflags: 0x1 linked
// Checksum 0x95d18667, Offset: 0x438
// Size: 0xe4
function function_eae1fc85(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    s_fix_server_spark_fx = struct::get("fix_server_spark_fx", "targetname");
    if (newval == 1) {
        level.var_6171ce61 = playfx(localclientnum, level._effect[#"server_spark_fx"], s_fix_server_spark_fx.origin);
        return;
    }
    if (isdefined(level.var_6171ce61)) {
        deletefx(localclientnum, level.var_6171ce61);
    }
}

// Namespace namespace_87e11242/namespace_87e11242
// Params 7, eflags: 0x1 linked
// Checksum 0xa3540d02, Offset: 0x528
// Size: 0x9c
function function_85c61737(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        level.var_4a2723a3 scene::play("state_no_power");
        return;
    }
    if (isdefined(level.var_be3c5a78)) {
        deletefx(localclientnum, level.var_be3c5a78);
    }
}

// Namespace namespace_87e11242/namespace_87e11242
// Params 7, eflags: 0x1 linked
// Checksum 0xdb3efca6, Offset: 0x5d0
// Size: 0x90
function function_e322771e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    str_index = "" + level.var_1d6643ed;
    level.var_4a2723a3 scene::play("state_" + level.var_1d6643ed);
    level.var_1d6643ed++;
}

// Namespace namespace_87e11242/namespace_87e11242
// Params 7, eflags: 0x1 linked
// Checksum 0x6400f78, Offset: 0x668
// Size: 0x5c
function function_d20d32f2(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    level.var_4a2723a3 scene::play("state_15");
}

