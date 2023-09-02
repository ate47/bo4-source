// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_fasttravel.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace zm_red_fasttravel;

// Namespace zm_red_fasttravel/zm_red_fasttravel
// Params 0, eflags: 0x1 linked
// Checksum 0xd13f28c7, Offset: 0x180
// Size: 0x37a
function init() {
    clientfield::register("toplayer", "column_to_park", 16000, 2, "int", &function_ec7e76a8, 0, 0);
    clientfield::register("toplayer", "column_to_fountain", 16000, 2, "int", &function_ec7e76a8, 0, 0);
    clientfield::register("toplayer", "fountain_to_park", 16000, 2, "int", &function_ec7e76a8, 0, 0);
    clientfield::register("toplayer", "fountain_to_column", 16000, 2, "int", &function_ec7e76a8, 0, 0);
    clientfield::register("toplayer", "park_to_column", 16000, 2, "int", &function_ec7e76a8, 0, 0);
    clientfield::register("toplayer", "park_to_fountain", 16000, 2, "int", &function_ec7e76a8, 0, 0);
    clientfield::register("allplayers", "" + #"hash_52693a3ba1bbc7ea", 16000, 1, "counter", &override_fasttravel_end_fx, 0, 0);
    clientfield::register("world", "" + #"hash_761511e09cb8324e", 16000, 1, "int", &function_e968fd4f, 0, 0);
    clientfield::register("scriptmover", "" + #"forcestream_crafted_item", 16000, 1, "int", &forcestream_crafted_item, 0, 0);
    level._effect[#"hash_7844498a1d0272cf"] = #"hash_36a8758df9221bce";
    level._effect[#"hash_1485000e3492adb9"] = #"hash_240783e54de51f0";
    level._effect[#"hash_359655df3976b4e0"] = #"hash_4df6f1dbc41bc9c3";
    level._effect[#"override_fasttravel_end_fx"] = #"hash_50655ac7dc942305";
}

// Namespace zm_red_fasttravel/zm_red_fasttravel
// Params 0, eflags: 0x1 linked
// Checksum 0xa58a0807, Offset: 0x508
// Size: 0x284
function main() {
    num = getdvarint(#"splitscreen_playercount", 0);
    if (num < 1) {
        num = 1;
    }
    for (localclientnum = 0; localclientnum < num; localclientnum++) {
        util::waitforclient(localclientnum);
    }
    if (!isdefined(level.var_3958c9ff)) {
        level.var_3958c9ff = [];
    } else if (!isarray(level.var_3958c9ff)) {
        level.var_3958c9ff = array(level.var_3958c9ff);
    }
    var_3958c9ff = struct::get_array("fasttravel_trigger");
    a_e_players = getlocalplayers();
    foreach (var_de3a312c in var_3958c9ff) {
        level.var_3958c9ff[var_de3a312c.script_string] = var_de3a312c;
        if (!isdefined(var_de3a312c.var_1b5be828)) {
            var_de3a312c.var_1b5be828 = [];
        } else if (!isarray(var_de3a312c.var_1b5be828)) {
            var_de3a312c.var_1b5be828 = array(var_de3a312c.var_1b5be828);
        }
        for (i = 0; i < a_e_players.size; i++) {
            var_de3a312c.var_1b5be828[i] = util::spawn_model(i, "tag_origin", var_de3a312c.origin + vectorscale((0, 0, -1), 16), var_de3a312c.angles);
        }
    }
}

// Namespace zm_red_fasttravel/zm_red_fasttravel
// Params 7, eflags: 0x1 linked
// Checksum 0x7881f22d, Offset: 0x798
// Size: 0x2aa
function function_ec7e76a8(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    while (!isdefined(level.var_3958c9ff)) {
        waitframe(1);
    }
    var_1b5be828 = level.var_3958c9ff[fieldname].var_1b5be828[localclientnum];
    if (!isdefined(var_1b5be828)) {
        return;
    }
    if (isdefined(var_1b5be828.var_b3673abf)) {
        var_1b5be828 stoploopsound(var_1b5be828.var_b3673abf);
    }
    if (isdefined(var_1b5be828.n_fx_id)) {
        deletefx(localclientnum, var_1b5be828.n_fx_id);
        var_1b5be828.n_fx_id = undefined;
    }
    switch (newval) {
    case 0:
        var_1b5be828.n_fx_id = util::playfxontag(localclientnum, level._effect[#"hash_359655df3976b4e0"], var_1b5be828, "tag_origin");
        break;
    case 1:
        var_1b5be828.n_fx_id = util::playfxontag(localclientnum, level._effect[#"hash_7844498a1d0272cf"], var_1b5be828, "tag_origin");
        var_1b5be828.var_b3673abf = var_1b5be828 playloopsound(#"hash_67c353461c5e3f2c");
        var_1b5be828 playsound(localclientnum, #"hash_2cc8c6c1b8e764b9");
        break;
    case 2:
        var_1b5be828.n_fx_id = util::playfxontag(localclientnum, level._effect[#"hash_1485000e3492adb9"], var_1b5be828, "tag_origin");
        var_1b5be828.var_b3673abf = var_1b5be828 playloopsound(#"hash_27fed7313de44e58");
        var_1b5be828 playsound(localclientnum, #"hash_3cf81bf9f70bc77d");
        break;
    }
}

// Namespace zm_red_fasttravel/zm_red_fasttravel
// Params 7, eflags: 0x1 linked
// Checksum 0x6ce5eb9c, Offset: 0xa50
// Size: 0x64
function override_fasttravel_end_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self thread zm_fasttravel::play_fasttravel_end_fx(localclientnum, "override_fasttravel_end_fx");
    }
}

// Namespace zm_red_fasttravel/zm_red_fasttravel
// Params 7, eflags: 0x1 linked
// Checksum 0x1700de58, Offset: 0xac0
// Size: 0x8c
function function_e968fd4f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        forcestreamxmodel(#"p8_wz_foliage_tree_oak_md");
    } else {
        stopforcestreamingxmodel(#"p8_wz_foliage_tree_oak_md");
    }
}

// Namespace zm_red_fasttravel/zm_red_fasttravel
// Params 7, eflags: 0x1 linked
// Checksum 0x7a299aa6, Offset: 0xb58
// Size: 0x7c
function forcestream_crafted_item(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        forcestreamxmodel(self.model);
    } else {
        stopforcestreamingxmodel(self.model);
    }
}

