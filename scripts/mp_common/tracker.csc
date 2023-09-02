// Atian COD Tools GSC decompiler test
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\scene_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\tracker_shared.csc;

#namespace tracker;

// Namespace tracker/tracker
// Params 0, eflags: 0x2
// Checksum 0x821be203, Offset: 0x98
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"tracker", &__init__, undefined, undefined);
}

// Namespace tracker/tracker
// Params 0, eflags: 0x1 linked
// Checksum 0x652833c8, Offset: 0xe0
// Size: 0x14
function __init__() {
    init_shared();
}

