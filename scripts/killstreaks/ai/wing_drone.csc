#using scripts\core_common\clientfield_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\vehicle_shared;

#namespace wing_drone;

// Namespace wing_drone/wing_drone
// Params 0, eflags: 0x2
// Checksum 0x4c82afd9, Offset: 0xd0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"wing_drone", &__init__, undefined, undefined);
}

// Namespace wing_drone/wing_drone
// Params 0, eflags: 0x0
// Checksum 0x2b7c457f, Offset: 0x118
// Size: 0x64
function __init__() {
    if (!isdefined(level.var_c23a525e)) {
        level.var_c23a525e = {};
        clientfield::register("vehicle", "wing_drone_reload", 1, 1, "int", &reload, 0, 0);
    }
}

// Namespace wing_drone/wing_drone
// Params 7, eflags: 0x0
// Checksum 0x4386b093, Offset: 0x188
// Size: 0x8c
function reload(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self function_d309e55a("tag_turret_control_animate", 0);
        return;
    }
    self function_d309e55a("tag_turret_control_animate", 1);
}

