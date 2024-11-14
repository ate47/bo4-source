#using scripts\core_common\struct;
#using scripts\core_common\util_shared;
#using scripts\core_common\clientfield_shared;

#namespace tracker;

// Namespace tracker/tracker_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x5f665aa7, Offset: 0xb8
// Size: 0x14
function init_shared() {
    registerclientfields();
}

// Namespace tracker/tracker_shared
// Params 0, eflags: 0x5 linked
// Checksum 0x3dfb760d, Offset: 0xd8
// Size: 0x3c
function private registerclientfields() {
    clientfield::register("clientuimodel", "huditems.isExposedOnMinimap", 1, 1, "int", undefined, 0, 0);
}

