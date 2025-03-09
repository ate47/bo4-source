#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_bgb;

#namespace zm_bgb_whos_keeping_score;

// Namespace zm_bgb_whos_keeping_score/zm_bgb_whos_keeping_score
// Params 0, eflags: 0x2
// Checksum 0xf6c9b66, Offset: 0x98
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_whos_keeping_score", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_whos_keeping_score/zm_bgb_whos_keeping_score
// Params 0, eflags: 0x0
// Checksum 0x5ae20387, Offset: 0xe8
// Size: 0x74
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_whos_keeping_score", "activated", 1, undefined, undefined, &validation, &activation);
}

// Namespace zm_bgb_whos_keeping_score/zm_bgb_whos_keeping_score
// Params 0, eflags: 0x0
// Checksum 0x4a1b88e5, Offset: 0x168
// Size: 0x24
function activation() {
    self thread bgb::function_c6cd71d5("double_points", undefined, 96);
}

// Namespace zm_bgb_whos_keeping_score/zm_bgb_whos_keeping_score
// Params 0, eflags: 0x0
// Checksum 0x5c0daa89, Offset: 0x198
// Size: 0x1a
function validation() {
    return self bgb::function_9d8118f5();
}

