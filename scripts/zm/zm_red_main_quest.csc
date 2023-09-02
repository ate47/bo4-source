// Atian COD Tools GSC decompiler test
#using script_70ab01a7690ea256;
#using scripts\zm_common\zm.csc;
#using scripts\zm\zm_red_ww_quests.csc;
#using scripts\zm_common\zm_blockers.csc;
#using scripts\zm_common\zm_utility.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\beam_shared.csc;
#using scripts\core_common\audio_shared.csc;
#using scripts\core_common\array_shared.csc;

#namespace zm_red_main_quest;

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x6a0e5ae5, Offset: 0x2b8
// Size: 0x1f02
function init() {
    var_7551dff2 = getminbitcountfornum(4);
    var_b7863a03 = getminbitcountfornum(3);
    clientfield::register("allplayers", "" + #"hash_72bd7a6af2ba1c5e", 16000, 1, "int", &function_d087b08c, 0, 1);
    clientfield::register("allplayers", "" + #"hash_4a149c9daff159cd", 16000, 1, "int", &function_d02ccc7c, 0, 1);
    clientfield::register("toplayer", "" + #"hash_7343b1cdab1f31c5", 16000, 1, "counter", &function_3d3614aa, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_2a17f2993036fab4", 16000, 1, "counter", &function_6a9e68bf, 0, 0);
    clientfield::register("scriptmover", "" + #"rune_fire", 16000, 1, "int", &function_659d8180, 0, 0);
    clientfield::register("scriptmover", "" + #"monument_eyes", 16000, var_7551dff2, "int", &monument_eyes, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_78fa79d021d86cb6", 16000, 1, "int", &function_27f4136d, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_4f90c0f4c5bc1c42", 16000, 1, "int", &function_31d064c0, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_784f06b253332f8f", 16000, 1, "counter", &function_148f3698, 0, 0);
    clientfield::register("toplayer", "" + #"hash_491027931a3fc18f", 16000, 1, "int", &function_efc5ca9d, 0, 0);
    clientfield::register("world", "" + #"hash_682b7b65432b7746", 16000, var_b7863a03, "int", &function_fb3b37f4, 0, 0);
    clientfield::register("toplayer", "" + #"hash_214549d33d068451", 16000, 1, "counter", &function_405ead09, 0, 0);
    clientfield::register("world", "" + #"hash_51858e923e750c33", 16000, 2, "int", &function_8d3c45d8, 0, 0);
    clientfield::register("world", "" + #"hash_2b05d4c6217bac22", 16000, 2, "int", &function_e8ce5b81, 0, 0);
    clientfield::register("world", "" + #"hash_3836d3a94cf05642", 16000, 2, "int", &function_5dbd965d, 0, 0);
    clientfield::register("world", "" + #"hash_53e684a319647b40", 16000, 2, "int", &function_89251662, 0, 0);
    clientfield::register("world", "" + #"hash_70e157c389c1c02f", 16000, 1, "int", &function_4e17725a, 0, 0);
    clientfield::register("world", "" + #"hash_4f59799617fef9c7", 16000, 1, "int", &function_ab5633d2, 0, 0);
    clientfield::register("world", "" + #"hash_31a10d565ae05ddb", 16000, 2, "int", &function_1935c66a, 0, 0);
    clientfield::register("world", "" + #"hash_1c97c11fb59eb4bf", 16000, 2, "int", &function_dee06e64, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_797e7381ba62ff8a", 16000, 1, "counter", &function_d7aac18b, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_30660c47aae060a9", 16000, 1, "int", &function_138c09b6, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_22acf133b0aa208a", 16000, 1, "int", &function_9dbc7c12, 0, 0);
    clientfield::register("world", "" + #"hash_530e1caa1a8c81d2", 16000, 1, "counter", &function_613a43b6, 0, 0);
    clientfield::register("toplayer", "" + #"hash_11480c2b11f0c92f", 16000, 1, "counter", &function_b1017eda, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_6d76e4b7a31537af", 16000, 1, "int", &function_ddf8e6d7, 0, 0);
    clientfield::register("world", "" + #"hash_4d77ba61cd7f3eb7", 16000, 1, "counter", &function_81289c69, 0, 0);
    clientfield::register("world", "" + #"hash_43972920fa314daa", 16000, 2, "int", &function_73a5ca1a, 0, 0);
    clientfield::register("toplayer", "" + #"hash_25cfe5e9786d97e7", 16000, 1, "int", &function_4d61e8ab, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_125706eb7b363924", 16000, 1, "int", &function_c6c41fb1, 0, 0);
    clientfield::register("vehicle", "" + #"hash_7fc7f7b5958831d4", 16000, 1, "int", &function_ad6b5484, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_431f319e4b8fe9db", 16000, 1, "int", &function_f3c6c429, 0, 0);
    clientfield::register("world", "" + #"hash_158233cdc645bef6", 16000, 1, "int", &function_6fd9deaa, 0, 0);
    clientfield::register("toplayer", "" + #"hash_492a33037a532fe0", 16000, 1, "counter", &function_6d38ea52, 0, 0);
    clientfield::register("toplayer", "" + #"hash_4aeb7fcdd8302eaa", 16000, 1, "int", &function_70e5b4bd, 0, 0);
    clientfield::register("toplayer", "" + #"hash_7a99ff005314c5fc", 16000, 1, "int", &function_f648d45a, 0, 0);
    clientfield::register("toplayer", "" + #"hash_7f85dc0ce20a6f2c", 16000, 1, "int", &function_40cc4833, 0, 0);
    clientfield::register("toplayer", "" + #"hash_4e3e66f200f76f34", 16000, 1, "int", &function_83c7dece, 0, 0);
    clientfield::register("toplayer", "" + #"hash_565ca9982285f23e", 16000, 1, "int", &function_530c191c, 0, 0);
    clientfield::register("actor", "" + #"hash_415416bf220de94", 16000, 1, "int", &function_cb766634, 0, 0);
    clientfield::register("actor", "" + #"hash_3e2b1092de25c2dd", 16000, 1, "int", &function_3e4aa1cc, 0, 0);
    clientfield::register("actor", "" + #"hash_24b5302c2f39ebc2", 16000, 1, "int", &function_fac1b5c7, 0, 0);
    clientfield::register("actor", "" + #"hash_6a8479b5a5b359a7", 16000, 1, "int", &function_106dc737, 0, 0);
    clientfield::register("actor", "" + #"hash_4feb66128e57d092", 16000, 1, "int", &function_343099ca, 0, 0);
    clientfield::register("actor", "" + #"hash_7552d5567ab25417", 16000, 1, "int", &function_c5443282, 0, 0);
    clientfield::register("actor", "" + #"hash_4e1b58f05f69a65a", 16000, 1, "int", &function_f39e44d7, 0, 0);
    clientfield::register("actor", "" + #"hash_5a6761fe764bdccf", 16000, 1, "int", &function_6bd8c915, 0, 0);
    var_ff76a259 = getminbitcountfornum(5);
    clientfield::register("world", "" + #"hash_74aaba5c17a71e0d", 16000, var_ff76a259, "int", &function_af9f249c, 0, 0);
    clientfield::register("world", "" + #"hash_7e49e921c4dd052f", 16000, var_ff76a259, "int", &function_704042f5, 0, 0);
    clientfield::register("world", "" + #"hash_9d4aab5c25b93ff", 16000, var_ff76a259, "int", &function_a1833637, 0, 0);
    clientfield::register("world", "" + #"hash_58e58259618537e7", 16000, var_ff76a259, "int", &function_52659f14, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_155f8a4473c5849f", 16000, 1, "int", &function_3b28f66e, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_4400550c9847a1c5", 16000, 1, "int", &function_dc8d97eb, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_1f0dd5bf6862e335", 16000, 1, "int", &function_71c2f197, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_ab97fcf2b12187d", 16000, 1, "int", &function_4f14ca28, 0, 0);
    clientfield::register("world", "" + #"hash_d80665c22fafd1e", 16000, 1, "int", &function_141a55a4, 0, 0);
    var_995dd8bf = getminbitcountfornum(9);
    clientfield::register("world", "" + #"play_fanfare", 16000, var_995dd8bf, "int", &play_fanfare, 0, 0);
    clientfield::register("scriptmover", "" + #"blood_teleport", 16000, 1, "counter", &blood_teleport, 0, 0);
    clientfield::register("allplayers", "" + #"hash_67b317587e795ec2", 16000, 1, "int", &function_bb7443e, 0, 0);
    clientfield::register("allplayers", "" + #"hash_10275bcd47e53936", 16000, 1, "int", &function_f5ec271e, 0, 0);
    clientfield::register("toplayer", "" + #"hash_49068d48a9eb7b89", 16000, 2, "int", &function_9b5699b4, 0, 0);
    clientfield::register("world", "" + #"hash_51e28147388ee3d8", 16000, 1, "int", &function_59ea1144, 0, 0);
    clientfield::register("world", "" + #"hash_16e27bea0cc1b56b", 16000, 1, "int", &function_806b16b7, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_297c800c6e18f746", 16000, 1, "int", &function_995ba4d9, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_26ddf1f70bd1f67a", 16000, 1, "int", &function_efb8d988, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_508fc6409c815104", 16000, 1, "counter", &function_842fb5d0, 0, 0);
    clientfield::register("world", "" + #"cleanse_portal", 16000, 1, "int", &cleanse_portal, 0, 0);
    clientfield::register("world", "" + #"narrative_room", 16000, 1, "int", &narrative_room, 0, 0);
    level._effect[#"hash_7209746af2213da9"] = #"hash_528248a4206b00af";
    level._effect[#"hash_7210806af22770bb"] = #"hash_527b5ca4206503fd";
    level._effect[#"hash_48f9a29daf00294a"] = #"hash_752bfcf80c9da234";
    level._effect[#"hash_48f3969daefba938"] = #"hash_7531e8f80ca1ebe6";
    level._effect[#"hash_2a17f2993036fab4"] = #"hash_6638fd8cf4876df";
    level._effect[#"rune_fire"] = #"hash_7504bcf503817eb2";
    level._effect[#"hash_784f06b253332f8f"] = #"hash_7d24820ee5231fef";
    level._effect[#"hash_797e7381ba62ff8a"] = #"hash_795ee7d89d6f10d2";
    level._effect[#"hash_30660c47aae060a9"] = #"zm_ai/fx8_elec_bolt";
    level._effect[#"hash_22acf133b0aa208a"] = #"hash_4d09e042a77cfba3";
    level._effect[#"hash_530e1caa1a8c81d2"] = #"hash_4bbfe2d612f8393d";
    level._effect[#"hash_6d76e4b7a31537af"] = #"hash_2b71a6c9f08cfe3b";
    level._effect[#"hash_4d77ba61cd7f3eb7"] = #"hash_25c4a39b373bfc67";
    level._effect[#"hash_7fc7f7b5958831d4"] = #"hash_520fd2427c5fcea3";
    level._effect[#"hash_431f319e4b8fe9db"] = #"hash_37bc7da216893b77";
    level._effect[#"hash_415416bf220de94"] = #"hash_7b7ba0ac0755a064";
    level._effect[#"hash_3e2b1092de25c2dd"] = #"hash_318aaa12f9dc7fd4";
    level._effect[#"hash_24b5302c2f39ebc2"] = #"hash_569b6effe4db6f54";
    level._effect[#"hash_6a8479b5a5b359a7"] = #"hash_513bda1b67490064";
    level._effect[#"hash_4feb66128e57d092"] = #"hash_194fead3457d21f5";
    level._effect[#"hash_7552d5567ab25417"] = #"hash_17e9105690c8500d";
    level._effect[#"hash_4e1b58f05f69a65a"] = #"hash_7e9736ee8b5ec443";
    level._effect[#"hash_5a6761fe764bdccf"] = #"hash_72d74d75e679897b";
    level._effect[#"hash_579a1ad0a61119fc"] = #"hash_150e82f10596be24";
    level._effect[#"hash_257185644d8c28b0"] = #"hash_31c3c5542f095358";
    level._effect[#"hash_79910e1d73c43922"] = #"hash_39c7de58cd57bf14";
    level._effect[#"hash_3d71b8c8036f8a4e"] = #"hash_7e78428dbf4099a8";
    level._effect[#"hash_2b1f96b3ed3451d2"] = #"hash_7519a614333f0ab5";
    level._effect[#"hash_1caa39c10fd546be"] = #"hash_3a840f89285e77e9";
    level._effect[#"hash_151f6238e261520a"] = #"hash_2c5e782929758203";
    level._effect[#"hash_5c18b169297a5116"] = #"hash_698145b245c1bff";
    level._effect[#"play_fanfare"] = #"maps/zm_towers/fx8_crowd_reward_flower_exp";
    level._effect[#"blood_teleport"] = #"hash_570e356dcecf7c0f";
    level._effect[#"hash_51e28147388ee3d8"] = #"hash_1ce96a401d67fe8f";
    level._effect[#"hash_297c800c6e18f746"] = #"hash_34fb31ef6c57f845";
    level._effect[#"hash_44330c38e995c437"] = #"hash_5ff2bd993dcf28d3";
    level._effect[#"hash_76947a7b04c592a6"] = #"hash_567c5a1dcc540804";
    level._effect[#"cleanse_portal"] = #"hash_47156cf8a794bef0";
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x4283e5f, Offset: 0x21c8
// Size: 0x64
function function_8d3c45d8(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    function_70f269cd(localclientnum, newval, #"oil");
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0xe7a6091c, Offset: 0x2238
// Size: 0x64
function function_e8ce5b81(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    function_70f269cd(localclientnum, newval, #"reflect");
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x77675b21, Offset: 0x22a8
// Size: 0x64
function function_5dbd965d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    function_70f269cd(localclientnum, newval, #"split_prophecy");
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0xfaba6ff9, Offset: 0x2318
// Size: 0x64
function function_89251662(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    function_70f269cd(localclientnum, newval, #"split_light");
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x99a4a2ed, Offset: 0x2388
// Size: 0x64
function function_4e17725a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    function_70f269cd(localclientnum, newval, #"prophecy");
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0xbd3d768e, Offset: 0x23f8
// Size: 0x64
function function_ab5633d2(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    function_70f269cd(localclientnum, newval, #"light");
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x6e616509, Offset: 0x2468
// Size: 0x64
function function_1935c66a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    function_70f269cd(localclientnum, newval, #"play");
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0xd94336ad, Offset: 0x24d8
// Size: 0x64
function function_dee06e64(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    function_70f269cd(localclientnum, newval, #"blood");
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 3, eflags: 0x1 linked
// Checksum 0xc5b251f4, Offset: 0x2548
// Size: 0x352
function function_70f269cd(localclientnum, newval, str_step) {
    switch (str_step) {
    case #"oil":
        a_s_points = function_cc7e9fc3(#"hash_219b4f20890b177b");
        break;
    case #"reflect":
        a_s_points = function_cc7e9fc3(#"hash_6ae79ecdde61ddea", #"hash_219b4f20890b177b");
        break;
    case #"split_prophecy":
        a_s_points = function_cc7e9fc3(#"hash_64f85050330547ca", #"hash_6ae79ecdde61ddea");
        break;
    case #"split_light":
        a_s_points = function_cc7e9fc3(#"hash_218b3395cd5cfd78", #"hash_6ae79ecdde61ddea");
        break;
    case #"prophecy":
        a_s_points = function_cc7e9fc3(#"hash_215626beb36c1b07", #"hash_64f85050330547ca");
        break;
    case #"light":
        a_s_points = function_cc7e9fc3(#"hash_20ba31ada21bdeaf", #"hash_218b3395cd5cfd78");
        break;
    case #"play":
        a_s_points = function_cc7e9fc3(#"hash_30d4d7a6ef033383");
        break;
    case #"blood":
        a_s_points = function_cc7e9fc3(#"hash_196c59af72f28307", #"hash_30d4d7a6ef033383");
        break;
    }
    switch (newval) {
    case 0:
        function_ed4ed5e(localclientnum, str_step);
        break;
    case 1:
        function_77072f95(localclientnum, str_step, a_s_points);
        break;
    case 2:
        if (str_step == #"blood") {
            s_final = struct::get(#"hash_74c74fa352fbfa70");
            a_s_points[a_s_points.size - 1] = s_final;
        }
        function_c6f495b3(localclientnum, str_step, a_s_points);
        break;
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 2, eflags: 0x1 linked
// Checksum 0x85f9de72, Offset: 0x28a8
// Size: 0x98
function function_cc7e9fc3(registerscr_cpower_debug_prints_manager, var_4309a155) {
    a_s_beam = struct::get_array(registerscr_cpower_debug_prints_manager);
    a_s_beam = array::sort_by_script_int(a_s_beam, 1);
    if (isdefined(var_4309a155)) {
        s_start = function_640e138d(var_4309a155);
        array::push_front(a_s_beam, s_start);
    }
    return a_s_beam;
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xdd2b5dd2, Offset: 0x2948
// Size: 0x60
function function_640e138d(str_targetname) {
    a_s_beam = struct::get_array(str_targetname);
    a_s_beam = array::sort_by_script_int(a_s_beam, 1);
    return a_s_beam[a_s_beam.size - 1];
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 3, eflags: 0x1 linked
// Checksum 0xaf8e4244, Offset: 0x29b0
// Size: 0x2e4
function function_77072f95(localclientnum, str_step, a_s_points) {
    if (!isdefined(level.var_b20dd024)) {
        level.var_b20dd024 = [];
    }
    if (isdefined(level.var_b20dd024[str_step])) {
        return;
    }
    foreach (i, s_point in a_s_points) {
        s_start = s_point;
        s_end = a_s_points[i + 1];
        if (!isdefined(s_end)) {
            break;
        }
        if (isdefined(s_end.target)) {
            s_end = struct::get(s_end.target);
        }
        v_start_origin = s_start.origin;
        var_e64db026 = s_end.origin;
        v_start_angles = vectortoangles(v_start_origin - var_e64db026);
        v_end_angles = vectortoangles(var_e64db026 - v_start_origin);
        var_360148 = util::spawn_model(localclientnum, #"tag_origin", v_start_origin, v_start_angles);
        var_b5d35012 = util::spawn_model(localclientnum, #"tag_origin", var_e64db026, v_end_angles);
        level beam::launch(var_360148, "tag_origin", var_b5d35012, "tag_origin", "beam8_zm_red_mirror_light", 1);
        if (!isdefined(level.var_b20dd024[str_step])) {
            level.var_b20dd024[str_step] = [];
        } else if (!isarray(level.var_b20dd024[str_step])) {
            level.var_b20dd024[str_step] = array(level.var_b20dd024[str_step]);
        }
        level.var_b20dd024[str_step][level.var_b20dd024[str_step].size] = array(var_360148, var_b5d35012);
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 3, eflags: 0x1 linked
// Checksum 0xd2eb97c, Offset: 0x2ca0
// Size: 0x196
function function_c6f495b3(localclientnum, str_step, a_s_points) {
    function_77072f95(localclientnum, str_step, a_s_points);
    var_9c2546ae = level.var_b20dd024[str_step];
    s_start = a_s_points[a_s_points.size - 2];
    s_end = a_s_points[a_s_points.size - 1];
    var_95bce808 = var_9c2546ae[var_9c2546ae.size - 1];
    var_360148 = var_95bce808[0];
    var_b5d35012 = var_95bce808[1];
    v_start_origin = s_start.origin;
    var_e64db026 = s_end.origin;
    var_360148.origin = v_start_origin;
    var_b5d35012.origin = var_e64db026;
    v_start_angles = vectortoangles(v_start_origin - var_e64db026);
    v_end_angles = vectortoangles(var_e64db026 - v_start_origin);
    var_360148.angles = v_start_angles;
    var_b5d35012.angles = v_end_angles;
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 2, eflags: 0x1 linked
// Checksum 0xbf096912, Offset: 0x2e40
// Size: 0x148
function function_ed4ed5e(localclientnum, str_step) {
    if (!isdefined(level.var_b20dd024)) {
        return;
    }
    a_beams = level.var_b20dd024[str_step];
    if (isdefined(a_beams)) {
        foreach (var_95bce808 in a_beams) {
            var_360148 = var_95bce808[0];
            var_b5d35012 = var_95bce808[1];
            level beam::kill(var_360148, "tag_origin", var_b5d35012, "tag_origin", "beam8_zm_red_mirror_light");
            var_360148 delete();
            var_b5d35012 delete();
        }
        level.var_b20dd024[str_step] = undefined;
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x8da730c5, Offset: 0x2f90
// Size: 0x112
function function_659d8180(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        v_forward = anglestoforward(self.angles);
        v_up = anglestoup(self.angles);
        playfx(localclientnum, level._effect[#"rune_fire"], self.origin, v_forward, v_up);
        self playsound(localclientnum, #"hash_5b3374cdce8e1865");
        self.sfx_id = self playloopsound(#"hash_2b3e9902ba3d0282");
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x25df5133, Offset: 0x30b0
// Size: 0x166
function function_31d064c0(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        if (!isdefined(self.var_105309c)) {
            self.var_105309c = util::playfxontag(localclientnum, level._effect[#"perseus_energy"], self, "tag_origin");
        }
        if (!isdefined(self.var_1cfdd45e)) {
            self playsound(localclientnum, #"hash_10f7dee939554f61");
            self.var_1cfdd45e = self playloopsound(#"hash_474d2ea03ea86530");
        }
    } else {
        if (isdefined(self.var_105309c)) {
            stopfx(localclientnum, self.var_105309c);
            self.var_105309c = undefined;
        }
        if (isdefined(self.var_1cfdd45e)) {
            self stoploopsound(self.var_1cfdd45e);
            self.var_1cfdd45e = undefined;
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x8e560646, Offset: 0x3220
// Size: 0x1fe
function function_d087b08c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        if (!isdefined(self.var_e4bbc6ac)) {
            if (zm_utility::function_f8796df3(localclientnum)) {
                if (viewmodelhastag(localclientnum, "tag_flash")) {
                    self.var_e4bbc6ac = playviewmodelfx(localclientnum, level._effect[#"hash_7209746af2213da9"], "tag_flash");
                }
            } else {
                self.var_e4bbc6ac = util::playfxontag(localclientnum, level._effect[#"hash_7210806af22770bb"], self, "tag_flash");
            }
        }
        if (!isdefined(self.var_eb8d44ea)) {
            self playsound(localclientnum, #"hash_aed5c123abb41e");
            self.var_eb8d44ea = self playloopsound(#"hash_581b3b27da3ead87");
        }
    } else {
        if (isdefined(self.var_e4bbc6ac)) {
            deletefx(localclientnum, self.var_e4bbc6ac);
            self.var_e4bbc6ac = undefined;
        }
        if (isdefined(self.var_eb8d44ea)) {
            self playsound(localclientnum, #"hash_5ab27086e5a04d18");
            self stoploopsound(self.var_eb8d44ea);
            self.var_eb8d44ea = undefined;
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0xb96653b1, Offset: 0x3428
// Size: 0x1fe
function function_d02ccc7c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        if (!isdefined(self.var_f5e35678)) {
            if (zm_utility::function_f8796df3(localclientnum)) {
                if (viewmodelhastag(localclientnum, "tag_flash")) {
                    self.var_f5e35678 = playviewmodelfx(localclientnum, level._effect[#"hash_48f9a29daf00294a"], "tag_flash");
                }
            } else {
                self.var_f5e35678 = util::playfxontag(localclientnum, level._effect[#"hash_48f3969daefba938"], self, "tag_flash");
            }
        }
        if (!isdefined(self.var_d8fc8527)) {
            self playsound(localclientnum, #"hash_3c19e72698ac95d0");
            self.var_d8fc8527 = self playloopsound(#"hash_24af8554667c6b49");
        }
    } else {
        if (isdefined(self.var_f5e35678)) {
            deletefx(localclientnum, self.var_f5e35678);
            self.var_f5e35678 = undefined;
        }
        if (isdefined(self.var_d8fc8527)) {
            self playsound(localclientnum, #"hash_5bcd3088193f642e");
            self stoploopsound(self.var_d8fc8527);
            self.var_d8fc8527 = undefined;
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0xb94ea77e, Offset: 0x3630
// Size: 0x64
function function_3d3614aa(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self playrumbleonentity(localclientnum, #"hash_230077451d7197c1");
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x15965299, Offset: 0x36a0
// Size: 0x74
function function_6a9e68bf(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    util::playfxontag(localclientnum, level._effect[#"hash_2a17f2993036fab4"], self, "tag_origin");
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x102067a9, Offset: 0x3720
// Size: 0xc4
function function_d7aac18b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    n_fx = playfx(localclientnum, level._effect[#"hash_797e7381ba62ff8a"], self.origin);
    playsound(localclientnum, #"hash_3bf3dbe329c0568b", self.origin);
    wait(0.1);
    stopfx(localclientnum, n_fx);
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x7a90d711, Offset: 0x37f0
// Size: 0xbe
function function_138c09b6(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval) {
        self.n_fx = util::playfxontag(localclientnum, level._effect[#"hash_30660c47aae060a9"], self, "tag_origin");
    } else if (isdefined(self.n_fx)) {
        stopfx(localclientnum, self.n_fx);
        self.n_fx = undefined;
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0xce5fb2a6, Offset: 0x38b8
// Size: 0x12e
function function_9dbc7c12(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval) {
        self.n_fx = util::playfxontag(localclientnum, level._effect[#"hash_22acf133b0aa208a"], self, "tag_origin");
        if (!isdefined(self.n_sfx)) {
            self.n_sfx = self playloopsound(#"hash_895096b873c07a7");
        }
    } else {
        if (isdefined(self.n_fx)) {
            stopfx(localclientnum, self.n_fx);
            self.n_fx = undefined;
        }
        if (isdefined(self.n_sfx)) {
            self stoploopsound(self.n_sfx);
            self.n_sfx = undefined;
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x1c96948, Offset: 0x39f0
// Size: 0xd4
function function_613a43b6(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    s_fx = struct::get(#"hash_1ccb47ff147a81f4");
    playfx(localclientnum, level._effect[#"hash_530e1caa1a8c81d2"], s_fx.origin, anglestoforward(s_fx.angles), anglestoup(s_fx.angles));
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0xe34f1fda, Offset: 0x3ad0
// Size: 0x64
function function_b1017eda(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    self playrumbleonentity(localclientnum, #"hash_112f9d14b803778e");
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0xde46c10a, Offset: 0x3b40
// Size: 0xe0
function function_fb3b37f4(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        a_n_decals = findvolumedecalindexarray("oil_trail_" + newval);
        foreach (n_index in a_n_decals) {
            hidevolumedecal(n_index);
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x8d63c5cd, Offset: 0x3c28
// Size: 0x64
function function_405ead09(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    self playrumbleonentity(localclientnum, #"zm_red_skylight_rumble");
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x49beb3c7, Offset: 0x3c98
// Size: 0x174
function monument_eyes(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 0) {
        self stoprenderoverridebundle(#"hash_1e7d0ce25eb2b583");
        if (isdefined(self.n_sfx)) {
            self.n_sfx = undefined;
            self playsound(localclientnum, #"hash_266abe875511476f");
        }
    } else {
        e_player = getentbynum(localclientnum, newval - 1);
        e_player_local = function_5c10bd79(localclientnum);
        if (!isdefined(e_player) || e_player !== e_player_local) {
            return;
        }
        self playrenderoverridebundle(#"hash_1e7d0ce25eb2b583");
        if (!isdefined(self.n_sfx)) {
            self.n_sfx = 1;
            self playsound(localclientnum, #"hash_2b9cdcb1738afacb");
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x61ab2bc3, Offset: 0x3e18
// Size: 0x166
function function_efc5ca9d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, wasdemojump) {
    if (function_65b9eb0f(localclientnum)) {
        return;
    }
    if (newval == 1) {
        self postfx::playpostfxbundle(#"hash_94349498b041929");
        if (!isdefined(self.var_7fae5704)) {
            self playsound(localclientnum, #"hash_246b0331273b8963");
            self.var_7fae5704 = self playloopsound(#"hash_190de0e3d0106035");
        }
    } else {
        self postfx::stoppostfxbundle(#"hash_94349498b041929");
        if (isdefined(self.var_7fae5704)) {
            self playsound(localclientnum, #"hash_53ce051a5ea76c76");
            self stoploopsound(self.var_7fae5704);
            self.var_7fae5704 = undefined;
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x2fb61c67, Offset: 0x3f88
// Size: 0x8c
function function_27f4136d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval) {
        self playrenderoverridebundle(#"hash_7ba1b67ed61ae142");
    } else {
        self stoprenderoverridebundle(#"hash_7ba1b67ed61ae142");
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x4795d0ca, Offset: 0x4020
// Size: 0xa4
function function_148f3698(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, wasdemojump) {
    self.var_abbe7dc9 = util::playfxontag(localclientnum, level._effect[#"hash_784f06b253332f8f"], self, "tag_origin");
    playsound(localclientnum, #"hash_4dc90b0a7990f309", self.origin);
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x678bae75, Offset: 0x40d0
// Size: 0xbe
function function_ddf8e6d7(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval) {
        self.n_fx = util::playfxontag(localclientnum, level._effect[#"hash_6d76e4b7a31537af"], self, "tag_origin");
    } else if (isdefined(self.n_fx)) {
        stopfx(localclientnum, self.n_fx);
        self.n_fx = undefined;
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x53788786, Offset: 0x4198
// Size: 0xd4
function function_81289c69(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    s_fx = struct::get(#"hash_16d7f49b344088ee");
    playfx(localclientnum, level._effect[#"hash_4d77ba61cd7f3eb7"], s_fx.origin, anglestoforward(s_fx.angles), anglestoup(s_fx.angles));
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0xa3dc9f64, Offset: 0x4278
// Size: 0x53c
function function_73a5ca1a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (!isdefined(level.var_94068374)) {
        level.var_94068374 = util::spawn_model(localclientnum, #"tag_origin");
        level.var_94068374.arsenalteleportoutstart = level.var_94068374 playloopsound(#"hash_289b15dba7547241");
    }
    if (!isdefined(level.var_656f903a)) {
        level.var_656f903a = util::spawn_model(localclientnum, #"tag_origin");
        level.var_656f903a.arsenalteleportoutstart = level.var_656f903a playloopsound(#"hash_289b15dba7547241");
    }
    var_360148 = level.var_94068374;
    var_b5d35012 = level.var_656f903a;
    switch (newval) {
    case 0:
        level.var_534f1bad = undefined;
        level beam::kill(var_360148, "tag_origin", var_b5d35012, "tag_origin", "beam8_zm_red_ra_ray");
        if (isdefined(var_360148.arsenalteleportoutstart)) {
            var_360148 playsound(localclientnum, #"hash_7aeea3d29c1624a");
            var_360148 stoploopsound(var_360148.arsenalteleportoutstart);
        }
        if (isdefined(var_b5d35012.arsenalteleportoutstart)) {
            var_b5d35012 stoploopsound(var_b5d35012.arsenalteleportoutstart);
        }
        if (isdefined(var_b5d35012.var_85c90678)) {
            var_b5d35012 stoploopsound(var_b5d35012.var_85c90678);
            var_b5d35012.var_85c90678 = undefined;
        }
        var_360148 delete();
        var_b5d35012 delete();
    case 1:
        if (isdefined(var_b5d35012.var_85c90678)) {
            var_b5d35012 stoploopsound(var_b5d35012.var_85c90678);
            var_b5d35012.var_85c90678 = undefined;
        }
        s_end = struct::get(#"hash_120883658590601c");
        break;
    case 2:
        if (!isdefined(var_b5d35012.var_85c90678)) {
            var_b5d35012.var_85c90678 = var_b5d35012 playloopsound(#"hash_11855496f2ae0456");
        }
        s_end = struct::get(#"hash_7e325197a32f4394");
        break;
    case 3:
        if (!isdefined(var_b5d35012.var_85c90678)) {
            var_b5d35012.var_85c90678 = var_b5d35012 playloopsound(#"hash_11855496f2ae0456");
        }
        s_end = struct::get(#"hash_394e0d84e8666511");
        break;
    }
    s_start = struct::get(#"hash_28652987572c5885");
    v_start_origin = s_start.origin;
    var_e64db026 = s_end.origin;
    v_start_angles = vectortoangles(v_start_origin - var_e64db026);
    v_end_angles = vectortoangles(var_e64db026 - v_start_origin);
    var_360148.origin = v_start_origin;
    var_360148.angles = v_start_angles;
    var_b5d35012.origin = var_e64db026;
    var_b5d35012.angles = v_end_angles;
    if (!(isdefined(level.var_534f1bad) && level.var_534f1bad)) {
        level.var_534f1bad = 1;
        level beam::launch(var_360148, "tag_origin", var_b5d35012, "tag_origin", "beam8_zm_red_ra_ray", 1);
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x372c4d3a, Offset: 0x47c0
// Size: 0x10c
function function_4d61e8ab(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self postfx::playpostfxbundle(#"pstfx_zm_hellhole");
        self postfx::playpostfxbundle(#"pstfx_gaussian_blur");
        self playrumblelooponentity(localclientnum, "damage_heavy");
    } else {
        self postfx::stoppostfxbundle(#"pstfx_zm_hellhole");
        self postfx::stoppostfxbundle(#"pstfx_gaussian_blur");
        self stoprumble(localclientnum, "damage_heavy");
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x947cd80e, Offset: 0x48d8
// Size: 0x8c
function function_c6c41fb1(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self playrenderoverridebundle(#"hash_5b016c114ead2591");
    } else {
        self stoprenderoverridebundle(#"hash_5b016c114ead2591");
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0xbce40d40, Offset: 0x4970
// Size: 0xce
function function_ad6b5484(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        if (!isdefined(self.var_c4c53839)) {
            self.var_c4c53839 = util::playfxontag(localclientnum, level._effect[#"hash_7fc7f7b5958831d4"], self, "tag_origin");
        }
    } else if (isdefined(self.var_c4c53839)) {
        stopfx(localclientnum, self.var_c4c53839);
        self.var_c4c53839 = undefined;
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0xc1b0588f, Offset: 0x4a48
// Size: 0x74
function function_f3c6c429(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    util::playfxontag(localclientnum, level._effect[#"hash_431f319e4b8fe9db"], self, "tag_origin");
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x7c126707, Offset: 0x4ac8
// Size: 0x2dc
function function_6fd9deaa(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    e_player = function_5c10bd79(localclientnum);
    if (newval) {
        s_start = struct::get(#"hash_6873469a7f41e2af");
        s_end = struct::get(#"hash_258b38a5968b7b5a");
        v_start_origin = s_start.origin;
        var_e64db026 = s_end.origin;
        v_start_angles = vectortoangles(var_e64db026 - v_start_origin);
        var_360148 = util::spawn_model(localclientnum, #"tag_origin", v_start_origin, v_start_angles);
        var_b5d35012 = util::spawn_model(localclientnum, #"tag_origin", var_e64db026);
        var_360148 playsound(localclientnum, #"hash_3765e25049981166");
        var_360148.sfx_id = var_360148 playloopsound(#"hash_170aa1970243fc4a");
        e_player.var_636aecd9 = var_360148;
        e_player.var_2667ae26 = var_b5d35012;
        level beam::launch(var_360148, "tag_origin", var_b5d35012, "tag_origin", "beam8_zm_red_ra_ray_bath", 1);
    } else {
        var_360148 = e_player.var_636aecd9;
        var_b5d35012 = e_player.var_2667ae26;
        if (!isdefined(var_360148) || !isdefined(var_b5d35012)) {
            return;
        }
        var_360148 playsound(localclientnum, #"hash_3126b098b980b5a3");
        level beam::kill(var_360148, "tag_origin", var_b5d35012, "tag_origin", "beam8_zm_red_ra_ray_bath");
        var_360148 delete();
        var_b5d35012 delete();
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0xa81f0d7d, Offset: 0x4db0
// Size: 0x3b4
function function_6d38ea52(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    level endon(#"end_game");
    self endon(#"disconnect");
    s_center = struct::get(#"hash_258b38a5968b7b5a");
    v_center = s_center.origin;
    mdl_rumble = util::spawn_model(localclientnum, #"tag_origin", v_center);
    var_90b58ce = 0;
    var_5f70b16e = 0;
    var_1a66f701 = 0;
    n_start_time = gettime();
    while (1) {
        waitframe(1);
        n_current_time = gettime();
        n_time_passed = float(n_current_time - n_start_time) / 1000;
        n_percent = n_time_passed / 10;
        n_earthquake = 0.25 * n_percent;
        if (n_earthquake > 0.01) {
            earthquake(localclientnum, n_earthquake, 0.016, v_center, 2048);
        }
        if (n_percent >= 0.66 && !var_1a66f701) {
            var_1a66f701 = 1;
            mdl_rumble playrumblelooponentity(localclientnum, #"hash_7549b81fb3f26c47");
            mdl_rumble stoprumble(localclientnum, #"hash_2578b3deb6dd485a");
        } else if (n_percent >= 0.33 && !var_5f70b16e) {
            var_5f70b16e = 1;
            mdl_rumble playrumblelooponentity(localclientnum, #"hash_2578b3deb6dd485a");
            mdl_rumble stoprumble(localclientnum, #"hash_753c961fb3e7a825");
        } else if (!var_90b58ce) {
            var_90b58ce = 1;
            mdl_rumble playrumblelooponentity(localclientnum, #"hash_753c961fb3e7a825");
        }
        if (n_percent >= 1) {
            break;
        }
    }
    mdl_rumble stoprumble(localclientnum, #"hash_7549b81fb3f26c47");
    mdl_rumble stoprumble(localclientnum, #"hash_2578b3deb6dd485a");
    mdl_rumble stoprumble(localclientnum, #"hash_753c961fb3e7a825");
    mdl_rumble delete();
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0xbab7fe49, Offset: 0x5170
// Size: 0x146
function function_70e5b4bd(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self postfx::playpostfxbundle(#"hash_2f87fbd2e3e9dda");
        if (!isdefined(self.var_b3673abf)) {
            self playsound(localclientnum, #"hash_4cde391232649006");
            self.var_b3673abf = self playloopsound(#"hash_6d36c32b83f1376a");
        }
    } else {
        self postfx::stoppostfxbundle(#"hash_2f87fbd2e3e9dda");
        if (isdefined(self.var_b3673abf)) {
            self playsound(localclientnum, #"hash_47f89ff10ff89743");
            self stoploopsound(self.var_b3673abf);
            self.var_b3673abf = undefined;
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0xecd9163f, Offset: 0x52c0
// Size: 0x146
function function_f648d45a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self postfx::playpostfxbundle(#"hash_61f8641fde4dd9ca");
        if (!isdefined(self.var_b3673abf)) {
            self playsound(localclientnum, #"hash_4cde391232649006");
            self.var_b3673abf = self playloopsound(#"hash_6d36c32b83f1376a");
        }
    } else {
        self postfx::stoppostfxbundle(#"hash_61f8641fde4dd9ca");
        if (isdefined(self.var_b3673abf)) {
            self playsound(localclientnum, #"hash_47f89ff10ff89743");
            self stoploopsound(self.var_b3673abf);
            self.var_b3673abf = undefined;
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x819b8487, Offset: 0x5410
// Size: 0x146
function function_40cc4833(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self postfx::playpostfxbundle(#"hash_39e179f1497e8a2f");
        if (!isdefined(self.var_b3673abf)) {
            self playsound(localclientnum, #"hash_4cde391232649006");
            self.var_b3673abf = self playloopsound(#"hash_6d36c32b83f1376a");
        }
    } else {
        self postfx::stoppostfxbundle(#"hash_39e179f1497e8a2f");
        if (isdefined(self.var_b3673abf)) {
            self playsound(localclientnum, #"hash_47f89ff10ff89743");
            self stoploopsound(self.var_b3673abf);
            self.var_b3673abf = undefined;
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x6e1c8396, Offset: 0x5560
// Size: 0x146
function function_83c7dece(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self postfx::playpostfxbundle(#"hash_5d1d9f246fa51331");
        if (!isdefined(self.var_b3673abf)) {
            self playsound(localclientnum, #"hash_4cde391232649006");
            self.var_b3673abf = self playloopsound(#"hash_6d36c32b83f1376a");
        }
    } else {
        self postfx::stoppostfxbundle(#"hash_5d1d9f246fa51331");
        if (isdefined(self.var_b3673abf)) {
            self playsound(localclientnum, #"hash_47f89ff10ff89743");
            self stoploopsound(self.var_b3673abf);
            self.var_b3673abf = undefined;
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0xb866d1a4, Offset: 0x56b0
// Size: 0xee
function function_530c191c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self postfx::playpostfxbundle(#"hash_2caf3cb56ac5fd8f");
        if (!isdefined(self.var_b3673abf)) {
            self.var_b3673abf = self playloopsound(#"hash_4e916bea4aecf6ed");
        }
    } else {
        self postfx::stoppostfxbundle(#"hash_2caf3cb56ac5fd8f");
        if (isdefined(self.var_b3673abf)) {
            self stoploopsound(self.var_b3673abf);
            self.var_b3673abf = undefined;
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x5772277e, Offset: 0x57a8
// Size: 0x7c
function function_cb766634(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    str_fx = level._effect[#"hash_415416bf220de94"];
    self function_95d76b40(localclientnum, newval, str_fx);
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x9218b016, Offset: 0x5830
// Size: 0x7c
function function_3e4aa1cc(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    str_fx = level._effect[#"hash_3e2b1092de25c2dd"];
    self function_95d76b40(localclientnum, newval, str_fx);
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x4b006f65, Offset: 0x58b8
// Size: 0x7c
function function_fac1b5c7(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    str_fx = level._effect[#"hash_24b5302c2f39ebc2"];
    self function_95d76b40(localclientnum, newval, str_fx);
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0xb8493d4b, Offset: 0x5940
// Size: 0x7c
function function_106dc737(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    str_fx = level._effect[#"hash_6a8479b5a5b359a7"];
    self function_95d76b40(localclientnum, newval, str_fx);
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x474176fc, Offset: 0x59c8
// Size: 0x7c
function function_343099ca(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    str_fx = level._effect[#"hash_4feb66128e57d092"];
    self function_95d76b40(localclientnum, newval, str_fx);
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x6056e57b, Offset: 0x5a50
// Size: 0x7c
function function_c5443282(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    str_fx = level._effect[#"hash_7552d5567ab25417"];
    self function_95d76b40(localclientnum, newval, str_fx);
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x10d55a99, Offset: 0x5ad8
// Size: 0x7c
function function_f39e44d7(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    str_fx = level._effect[#"hash_4e1b58f05f69a65a"];
    self function_95d76b40(localclientnum, newval, str_fx);
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x90d23abf, Offset: 0x5b60
// Size: 0x7c
function function_6bd8c915(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    str_fx = level._effect[#"hash_5a6761fe764bdccf"];
    self function_95d76b40(localclientnum, newval, str_fx);
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 3, eflags: 0x1 linked
// Checksum 0x8e8cfce7, Offset: 0x5be8
// Size: 0xc6
function function_95d76b40(localclientnum, newval, str_fx) {
    if (newval) {
        if (!isdefined(self.var_31b927aa)) {
            self playsound(localclientnum, #"hash_3c0dc8688620ea73");
            self.var_31b927aa = util::playfxontag(localclientnum, str_fx, self, "j_spine4");
        }
    } else if (isdefined(self.var_31b927aa)) {
        stopfx(localclientnum, self.var_31b927aa);
        self.var_31b927aa = undefined;
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x1e05f915, Offset: 0x5cb8
// Size: 0x64
function function_af9f249c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    function_b750bd91(localclientnum, newval, #"death");
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0xeab514c4, Offset: 0x5d28
// Size: 0x64
function function_704042f5(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    function_b750bd91(localclientnum, newval, #"earth");
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x5ba3d214, Offset: 0x5d98
// Size: 0x64
function function_a1833637(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    function_b750bd91(localclientnum, newval, #"air");
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0xc47dacb1, Offset: 0x5e08
// Size: 0x64
function function_52659f14(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    function_b750bd91(localclientnum, newval, #"light");
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 3, eflags: 0x1 linked
// Checksum 0xa901589e, Offset: 0x5e78
// Size: 0x65e
function function_b750bd91(localclientnum, newval, str_ww) {
    if (!isdefined(level.var_6ca19725)) {
        level.var_6ca19725 = [];
    }
    n_fx = level.var_6ca19725[str_ww];
    if (!isdefined(level.var_39ab105d)) {
        level.var_39ab105d = [];
    }
    var_740e1e0e = level.var_39ab105d[str_ww];
    var_408c2f30 = "";
    var_f5257d20 = "";
    if (newval <= 0) {
        if (isdefined(n_fx)) {
            stopfx(localclientnum, n_fx);
            level.var_6ca19725[str_ww] = undefined;
        }
        if (isdefined(var_740e1e0e)) {
            if (isdefined(var_740e1e0e.var_f5257d20)) {
                var_740e1e0e playsound(localclientnum, var_740e1e0e.var_f5257d20);
            }
            var_740e1e0e delete();
            level.var_39ab105d[str_ww] = undefined;
        }
    } else if (!isdefined(n_fx) && !isdefined(var_740e1e0e)) {
        if (newval == 1) {
            switch (str_ww) {
            case #"death":
                s_pos = struct::get(#"hash_11302005e130b7eb");
                str_fx = level._effect[#"hash_579a1ad0a61119fc"];
                break;
            case #"earth":
                s_pos = struct::get(#"hash_2b292979020933aa");
                str_fx = level._effect[#"hash_79910e1d73c43922"];
                break;
            case #"air":
                s_pos = struct::get(#"hash_286a392e24892dee");
                str_fx = level._effect[#"hash_2b1f96b3ed3451d2"];
                break;
            case #"light":
                s_pos = struct::get(#"hash_5ae30fa5823821ee");
                str_fx = level._effect[#"hash_151f6238e261520a"];
                break;
            }
            var_408c2f30 = #"hash_5c827c8b5d6786d0";
            var_f5257d20 = #"hash_4e0f49a6de027614";
            var_88dfc0c9 = 0.37;
        } else {
            switch (newval) {
            case 2:
                s_pos = struct::get(#"hash_2038ad2a6cbb9188");
                break;
            case 3:
                s_pos = struct::get(#"hash_2038b02a6cbb96a1");
                break;
            case 4:
                s_pos = struct::get(#"hash_2038af2a6cbb94ee");
                break;
            case 5:
                s_pos = struct::get(#"hash_2038b22a6cbb9a07");
                break;
            }
            switch (str_ww) {
            case #"death":
                str_fx = level._effect[#"hash_257185644d8c28b0"];
                break;
            case #"earth":
                str_fx = level._effect[#"hash_3d71b8c8036f8a4e"];
                break;
            case #"air":
                str_fx = level._effect[#"hash_1caa39c10fd546be"];
                break;
            case #"light":
                str_fx = level._effect[#"hash_5c18b169297a5116"];
                break;
            }
            var_408c2f30 = #"hash_57f7a8a10722c251";
            var_f5257d20 = #"hash_0";
            var_88dfc0c9 = 0.75;
        }
        n_fx = playfx(localclientnum, str_fx, s_pos.origin, anglestoforward(s_pos.angles), anglestoup(s_pos.angles));
        var_cfc545ad = function_985f4598(str_ww);
        var_740e1e0e = util::spawn_model(localclientnum, var_cfc545ad, s_pos.origin);
        var_740e1e0e setscale(var_88dfc0c9);
        var_740e1e0e thread zm_red_ww_quests::function_58806d4f(localclientnum, undefined, 1);
        var_740e1e0e playsound(localclientnum, var_408c2f30);
        var_740e1e0e.var_b3673abf = var_740e1e0e playloopsound(#"hash_bd407bab72c8280");
        var_740e1e0e.var_f5257d20 = var_f5257d20;
        level.var_6ca19725[str_ww] = n_fx;
        level.var_39ab105d[str_ww] = var_740e1e0e;
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x7d0fbbac, Offset: 0x64e0
// Size: 0xc6
function function_985f4598(str_ww) {
    switch (str_ww) {
    case #"death":
        var_cfc545ad = #"p8_zm_red_rune_circle_charron";
        break;
    case #"earth":
        var_cfc545ad = #"p8_zm_red_rune_circle_gaia";
        break;
    case #"air":
        var_cfc545ad = #"p8_zm_red_rune_circle_ouranos";
        break;
    case #"light":
        var_cfc545ad = #"hash_31a411dafa5678e2";
        break;
    }
    return var_cfc545ad;
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0xd84527d4, Offset: 0x65b0
// Size: 0x64
function function_3b28f66e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self function_67b43987(localclientnum, newval, #"death");
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x15a7138e, Offset: 0x6620
// Size: 0x64
function function_dc8d97eb(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self function_67b43987(localclientnum, newval, #"earth");
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x72a208a6, Offset: 0x6690
// Size: 0x64
function function_71c2f197(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self function_67b43987(localclientnum, newval, #"air");
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x378b6169, Offset: 0x6700
// Size: 0x64
function function_4f14ca28(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self function_67b43987(localclientnum, newval, #"light");
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 3, eflags: 0x1 linked
// Checksum 0xc600b55b, Offset: 0x6770
// Size: 0x2ae
function function_67b43987(localclientnum, newval, str_ww) {
    if (newval) {
        switch (str_ww) {
        case #"death":
            str_fx = level._effect[#"hash_257185644d8c28b0"];
            break;
        case #"earth":
            str_fx = level._effect[#"hash_3d71b8c8036f8a4e"];
            break;
        case #"air":
            str_fx = level._effect[#"hash_1caa39c10fd546be"];
            break;
        case #"light":
            str_fx = level._effect[#"hash_5c18b169297a5116"];
            break;
        }
        var_cfc545ad = function_985f4598(str_ww);
        if (!isdefined(self.var_31b927aa)) {
            self.var_31b927aa = util::playfxontag(localclientnum, str_fx, self, "tag_origin");
        }
        if (!isdefined(self.var_2ebd37a3)) {
            var_2ebd37a3 = util::spawn_model(localclientnum, var_cfc545ad, self.origin);
            var_2ebd37a3 setscale(0.75);
            var_2ebd37a3 linkto(self);
            var_2ebd37a3 playsound(localclientnum, #"hash_a4627a5894c615a");
            var_2ebd37a3.var_b3673abf = var_2ebd37a3 playloopsound(#"hash_bd407bab72c8280");
            var_2ebd37a3 thread zm_red_ww_quests::function_58806d4f(localclientnum, undefined, 1);
            self.var_2ebd37a3 = var_2ebd37a3;
        }
    } else {
        if (isdefined(self.var_31b927aa)) {
            stopfx(localclientnum, self.var_31b927aa);
            self.var_31b927aa = undefined;
        }
        if (isdefined(self.var_2ebd37a3)) {
            self.var_2ebd37a3 delete();
            self.var_2ebd37a3 = undefined;
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0xf7a70f6, Offset: 0x6a28
// Size: 0x346
function function_141a55a4(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    a_s_glyphs = struct::get_array(#"hash_61ba778e4f6ae3e");
    if (newval) {
        foreach (s_glyph in a_s_glyphs) {
            if (!isdefined(s_glyph.var_3cd87194)) {
                var_3cd87194 = [];
                for (i = 0; i < 2; i++) {
                    var_6eb21a54 = util::spawn_model(localclientnum, #"p8_zm_power_door_symbol_01", s_glyph.origin);
                    if (i == 0) {
                        var_6eb21a54.angles = s_glyph.angles;
                    } else {
                        var_6eb21a54.angles = s_glyph.angles + vectorscale((0, 1, 0), 180);
                    }
                    var_6eb21a54 zm_blockers::power_door_ambient_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump);
                    if (!isdefined(var_3cd87194)) {
                        var_3cd87194 = [];
                    } else if (!isarray(var_3cd87194)) {
                        var_3cd87194 = array(var_3cd87194);
                    }
                    var_3cd87194[var_3cd87194.size] = var_6eb21a54;
                }
                s_glyph.var_3cd87194 = var_3cd87194;
            }
        }
    } else {
        foreach (s_glyph in a_s_glyphs) {
            if (isdefined(s_glyph.var_3cd87194)) {
                foreach (var_6eb21a54 in s_glyph.var_3cd87194) {
                    var_6eb21a54 zm_blockers::power_door_ambient_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump);
                    var_6eb21a54 delete();
                }
                s_glyph.var_3cd87194 = undefined;
            }
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x68b7d2c5, Offset: 0x6d78
// Size: 0x54
function play_fanfare(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    function_d482f96b(localclientnum, newval);
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 2, eflags: 0x1 linked
// Checksum 0x51b41c7, Offset: 0x6dd8
// Size: 0x378
function function_d482f96b(localclientnum, newval) {
    function_180e26e2();
    b_random = 1;
    b_immediate = 1;
    var_1a458c97 = 1;
    switch (newval) {
    case 0:
        var_54b5dd3f = #"center";
        break;
    case 1:
        var_54b5dd3f = #"center";
        b_immediate = 0;
        break;
    case 2:
        var_54b5dd3f = #"center";
        b_immediate = 0;
        var_1a458c97 = 0;
        break;
    case 3:
        var_54b5dd3f = #"close";
        break;
    case 4:
        var_54b5dd3f = #"close";
        b_immediate = 0;
        break;
    case 5:
        var_54b5dd3f = #"close";
        b_immediate = 0;
        var_1a458c97 = 0;
        break;
    case 6:
        var_54b5dd3f = #"far";
        break;
    case 7:
        var_54b5dd3f = #"far";
        b_immediate = 0;
        break;
    case 8:
        var_54b5dd3f = #"far";
        b_immediate = 0;
        var_1a458c97 = 0;
        break;
    case 9:
        var_54b5dd3f = #"all";
        b_random = 0;
        b_immediate = 0;
        break;
    }
    a_s_fanfare = level.var_bbe677e8[var_54b5dd3f];
    if (b_random) {
        a_s_fanfare = array::randomize(a_s_fanfare);
    } else {
        a_s_fanfare = array::sort_by_script_int(a_s_fanfare, math::cointoss());
    }
    foreach (s_fanfare in a_s_fanfare) {
        playfx(localclientnum, level._effect[#"play_fanfare"], s_fanfare.origin);
        playsound(localclientnum, #"hash_3ee7d77f646a378d", s_fanfare.origin);
        if (!b_immediate) {
            n_wait = 1;
            if (var_1a458c97) {
                n_wait = 0.5;
            }
            wait(n_wait);
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xe3d7d25f, Offset: 0x7158
// Size: 0x380
function function_180e26e2() {
    if (isdefined(level.var_bf987634) && level.var_bf987634) {
        return;
    }
    level.var_bf987634 = 1;
    level.var_bbe677e8[#"center"] = [];
    level.var_bbe677e8[#"close"] = [];
    level.var_bbe677e8[#"far"] = [];
    level.var_bbe677e8[#"all"] = [];
    a_s_pos = struct::get_array(#"hash_7c9fecc7da908461");
    foreach (s_pos in a_s_pos) {
        str_type = s_pos.script_noteworthy;
        switch (str_type) {
        case #"center":
            str_array = #"center";
            break;
        case #"close":
            str_array = #"close";
            break;
        case #"far":
            str_array = #"far";
            break;
        }
        if (!isdefined(level.var_bbe677e8[str_array])) {
            level.var_bbe677e8[str_array] = [];
        } else if (!isarray(level.var_bbe677e8[str_array])) {
            level.var_bbe677e8[str_array] = array(level.var_bbe677e8[str_array]);
        }
        level.var_bbe677e8[str_array][level.var_bbe677e8[str_array].size] = s_pos;
        if (str_type != "center") {
            if (!isdefined(level.var_bbe677e8[#"all"])) {
                level.var_bbe677e8[#"all"] = [];
            } else if (!isarray(level.var_bbe677e8[#"all"])) {
                level.var_bbe677e8[#"all"] = array(level.var_bbe677e8[#"all"]);
            }
            level.var_bbe677e8[#"all"][level.var_bbe677e8[#"all"].size] = s_pos;
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0xd1df8580, Offset: 0x74e0
// Size: 0xa4
function blood_teleport(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    playfx(localclientnum, level._effect[#"blood_teleport"], self.origin, anglestoforward(self.angles), anglestoup(self.angles));
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x44d16699, Offset: 0x7590
// Size: 0x13a
function function_bb7443e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self.var_74b9b03b = 1;
    } else {
        self.var_74b9b03b = undefined;
    }
    maxclients = getmaxlocalclients();
    for (localclientnum = 0; localclientnum < maxclients; localclientnum++) {
        if (isdefined(function_5c10bd79(localclientnum))) {
            foreach (e_player in getplayers(localclientnum)) {
                e_player zm::function_92f0c63(localclientnum);
            }
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x190e0c7a, Offset: 0x76d8
// Size: 0x124
function function_f5ec271e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self thread function_19dea648(localclientnum);
    } else {
        foreach (e_player in getplayers(localclientnum)) {
            if (e_player postfx::function_556665f2(#"pstfx_fsblur")) {
                e_player postfx::exitpostfxbundle(#"pstfx_fsblur");
                e_player notify(#"stop_blur_postfx");
            }
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x8953db76, Offset: 0x7808
// Size: 0x198
function function_19dea648(localclientnum) {
    self endon(#"death");
    if (self getlocalclientnumber() === localclientnum) {
        if (!isdemoplaying() && !namespace_a6aea2c6::is_active(#"silent_film")) {
            if (!util::is_mature() || !util::function_fa1da5cb()) {
                self thread postfx::playpostfxbundle(#"pstfx_fsblur");
                a_e_players = getlocalplayers();
                foreach (e_player in a_e_players) {
                    if (!e_player util::function_50ed1561(localclientnum)) {
                        e_player thread zm_utility::function_bb54a31f(localclientnum, #"pstfx_fsblur", #"stop_blur_postfx");
                    }
                }
            }
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x1e39f3f4, Offset: 0x79a8
// Size: 0xac
function function_9b5699b4(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        audio::snd_set_snapshot("zmb_red_midigc_duck_all");
    } else if (newval == 2) {
        audio::snd_set_snapshot("zmb_red_midigc_duck_igc");
    } else {
        audio::snd_set_snapshot("default");
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x1ea43ff7, Offset: 0x7a60
// Size: 0x12c
function function_59ea1144(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    s_omphalos = struct::get(#"hash_2ea39900a13a8305");
    if (newval) {
        if (!isdefined(s_omphalos.var_2f2435ec)) {
            s_omphalos.var_2f2435ec = playfx(localclientnum, level._effect[#"hash_51e28147388ee3d8"], s_omphalos.origin, anglestoforward(s_omphalos.angles), anglestoup(s_omphalos.angles));
        }
    } else if (isdefined(s_omphalos.var_2f2435ec)) {
        stopfx(localclientnum, s_omphalos.var_2f2435ec);
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0xd2661e57, Offset: 0x7b98
// Size: 0x1a0
function function_806b16b7(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    s_omphalos = struct::get(#"hash_2ea39900a13a8305");
    if (!isdefined(s_omphalos.mdl_rumble)) {
        s_omphalos.mdl_rumble = util::spawn_model(localclientnum, #"tag_origin", s_omphalos.origin, s_omphalos.angles);
    }
    s_omphalos.mdl_rumble stoprumble(localclientnum, #"zm_red_omphalos_rumble");
    if (newval) {
        s_omphalos.mdl_rumble playrumblelooponentity(localclientnum, #"zm_red_omphalos_rumble");
        s_omphalos.mdl_rumble.var_b3673abf = s_omphalos.mdl_rumble playloopsound(#"hash_6e30f1761b6645a4");
        s_omphalos thread function_5b807116(localclientnum);
    } else {
        s_omphalos.mdl_rumble delete();
        s_omphalos notify(#"hash_7e024090b699d99f");
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x37b98548, Offset: 0x7d40
// Size: 0x176
function function_5b807116(localclientnum) {
    self notify("41f2ff915f63437b");
    self endon("41f2ff915f63437b");
    level endon(#"end_game");
    self endon(#"death", #"hash_7e024090b699d99f");
    while (1) {
        e_player = function_5c10bd79(localclientnum);
        if (isplayer(e_player)) {
            n_dist = distance2dsquared(self.origin, e_player.origin);
            if (n_dist <= 512 * 512) {
                n_percent = 1 - n_dist / 512 * 512;
                n_earthquake = 0.15 * n_percent;
                if (n_earthquake > 0.01) {
                    earthquake(localclientnum, n_earthquake, 0.016, e_player.origin, 1024);
                }
            }
        }
        waitframe(1);
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x1abe1e28, Offset: 0x7ec0
// Size: 0xce
function function_995ba4d9(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        if (!isdefined(self.var_5ff65ab4)) {
            self.var_5ff65ab4 = playfx(localclientnum, level._effect[#"hash_297c800c6e18f746"], self.origin);
        }
    } else if (isdefined(self.var_5ff65ab4)) {
        stopfx(localclientnum, self.var_5ff65ab4);
        self.var_5ff65ab4 = undefined;
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0xbbdfbd58, Offset: 0x7f98
// Size: 0x6e
function function_efb8d988(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self thread function_83a7c416(localclientnum);
    } else {
        level.var_656b74db = 1;
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xe14b5fb5, Offset: 0x8010
// Size: 0x236
function function_83a7c416(localclientnum) {
    self notify("4cde9c02a6d66818");
    self endon("4cde9c02a6d66818");
    level endon(#"end_game");
    s_fx = struct::get(#"hash_3ad02ac72362ec5c");
    b_swap = 0;
    var_43997e53 = 2;
    while (!(isdefined(level.var_656b74db) && level.var_656b74db)) {
        n_offset = randomfloatrange(128 * -1, 128);
        v_fx = s_fx.origin + (n_offset, n_offset, 0);
        mdl_fx = util::spawn_model(localclientnum, #"tag_origin", v_fx);
        str_tag = "j_wingulna_le";
        if (b_swap) {
            str_tag = "j_wingulna_ri";
        }
        b_swap = !b_swap;
        if (isdefined(self)) {
            level beam::launch(self, str_tag, mdl_fx, "tag_origin", "beam8_zm_red_peg_lightning_strike", 1);
            if (var_43997e53 >= 2) {
                self playsound(localclientnum, #"hash_61c057ffadb7a5af");
                var_43997e53 = 0;
            }
            self thread function_9631e11c(mdl_fx, str_tag);
            n_random_wait = randomfloatrange(0.1, 0.25);
            wait(n_random_wait);
            var_43997e53 = var_43997e53 + n_random_wait;
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 2, eflags: 0x1 linked
// Checksum 0xbef6f578, Offset: 0x8250
// Size: 0x8c
function function_9631e11c(mdl_fx, str_tag) {
    n_random_wait = randomfloatrange(1, 2);
    wait(n_random_wait);
    if (isdefined(self)) {
        level beam::kill(self, str_tag, mdl_fx, "tag_origin", "beam8_zm_red_peg_lightning_strike");
    }
    mdl_fx delete();
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x3b03bf3c, Offset: 0x82e8
// Size: 0x14c
function function_842fb5d0(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self endon(#"death");
    util::playfxontag(localclientnum, level._effect[#"hash_44330c38e995c437"], self, "link_p8_zm_red_ballista");
    playsound(localclientnum, #"hash_39c2296cc1b913b9", self gettagorigin("link_p8_zm_red_ballista"));
    wait(1);
    util::playfxontag(localclientnum, level._effect[#"hash_76947a7b04c592a6"], self, "link_p8_zm_red_ballista_arrow_whole");
    playsound(localclientnum, #"hash_39c2296cc1b913b9", self gettagorigin("link_p8_zm_red_ballista_arrow_whole"));
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x3938f35c, Offset: 0x8440
// Size: 0x18c
function cleanse_portal(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    s_fx = struct::get(#"hash_2ea39900a13a8305");
    if (newval) {
        if (!isdefined(s_fx.var_8928e499)) {
            s_fx.var_8928e499 = playfx(localclientnum, level._effect[#"cleanse_portal"], s_fx.origin, anglestoforward(s_fx.angles), anglestoup(s_fx.angles));
        }
        audio::playloopat(#"hash_6ebedb6190c4ee87", s_fx.origin);
    } else {
        if (isdefined(s_fx.var_8928e499)) {
            stopfx(localclientnum, s_fx.var_8928e499);
            s_fx.var_8928e499 = undefined;
        }
        audio::stoploopat(#"hash_6ebedb6190c4ee87", s_fx.origin);
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0xffffdfed, Offset: 0x85d8
// Size: 0x84
function narrative_room(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        function_a5777754(localclientnum, "visgroup_portico");
    } else {
        function_73b1f242(localclientnum, "visgroup_portico");
    }
}

