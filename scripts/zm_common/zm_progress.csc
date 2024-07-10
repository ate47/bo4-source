#using script_3a2fac1479c56997;
#using scripts\zm_common\zm_utility.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace zm_progress;

// Namespace zm_progress/zm_progress
// Params 0, eflags: 0x2
// Checksum 0xb0c73883, Offset: 0xb0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_progress", &__init__, undefined, undefined);
}

// Namespace zm_progress/zm_progress
// Params 0, eflags: 0x1 linked
// Checksum 0xfcc13c3, Offset: 0xf8
// Size: 0x1c
function __init__() {
    zm_build_progress::register("zm_build_progress");
}

