#using scripts\core_common\util_shared;
#using scripts\core_common\exploder_shared;
#using scripts\zm_common\zm_unitrigger;
#using scripts\zm_common\zm_perks;
#using scripts\core_common\scene_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\struct;
#using scripts\core_common\clientfield_shared;

#namespace zm_white_lighting;

// Namespace zm_white_lighting/zm_white_lighting
// Params 0, eflags: 0x2
// Checksum 0x976dec1d, Offset: 0x118
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_white_lighting", &init, undefined, undefined);
}

// Namespace zm_white_lighting/zm_white_lighting
// Params 0, eflags: 0x1 linked
// Checksum 0x132eb3f5, Offset: 0x160
// Size: 0x74
function init() {
    level thread function_3d4e24ea();
    level flag::init("start_exploder");
    level flag::init("stop_exploder");
    level thread function_2bdf9f35();
}

// Namespace zm_white_lighting/zm_white_lighting
// Params 0, eflags: 0x1 linked
// Checksum 0xc93828d, Offset: 0x1e0
// Size: 0x24
function function_2bdf9f35() {
    level thread function_c51c8e3("start_exploder");
}

// Namespace zm_white_lighting/zm_white_lighting
// Params 0, eflags: 0x1 linked
// Checksum 0x78ec8b89, Offset: 0x210
// Size: 0x32
function function_3d4e24ea() {
    level._effect[#"hash_5ee980374efab771"] = #"hash_964810cc067cb78";
}

// Namespace zm_white_lighting/zm_white_lighting
// Params 1, eflags: 0x1 linked
// Checksum 0xdfcc6880, Offset: 0x250
// Size: 0xdc
function function_c51c8e3(var_edf4d25) {
    self flag::wait_till(var_edf4d25);
    if (var_edf4d25 == "start_exploder") {
        exp_lgt_start();
        var_27a8909d = "stop_exploder";
    } else if (var_edf4d25 == "stop_exploder") {
        function_40dfe103();
        var_27a8909d = "start_exploder";
    }
    self flag::clear("start_exploder");
    self flag::clear("stop_exploder");
    self function_c51c8e3(var_27a8909d);
}

// Namespace zm_white_lighting/zm_white_lighting
// Params 0, eflags: 0x1 linked
// Checksum 0xcab15698, Offset: 0x338
// Size: 0x4c
function exp_lgt_start() {
    iprintlnbold("Start Exploder!");
    exploder::exploder("exploder_test");
    exploder::exploder("fxexp_disco_lgt");
}

// Namespace zm_white_lighting/zm_white_lighting
// Params 0, eflags: 0x1 linked
// Checksum 0x83b42895, Offset: 0x390
// Size: 0x4c
function function_40dfe103() {
    iprintlnbold("Stop Exploder!");
    exploder::stop_exploder("exploder_test");
    exploder::stop_exploder("fxexp_disco_lgt");
}

// Namespace zm_white_lighting/zm_white_lighting
// Params 0, eflags: 0x0
// Checksum 0xfa96bcbc, Offset: 0x3e8
// Size: 0x56
function function_829b14de() {
    while (true) {
        self movez(100, 5);
        wait 5;
        self movez(-100, 5);
        wait 5;
    }
}

