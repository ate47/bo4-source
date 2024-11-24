#using scripts\core_common\clientfield_shared;
#using scripts\core_common\system_shared;

#namespace lead_drone;

// Namespace lead_drone/lead_drone
// Params 0, eflags: 0x2
// Checksum 0xd56918c0, Offset: 0xc0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"lead_drone", &__init__, undefined, undefined);
}

// Namespace lead_drone/lead_drone
// Params 0, eflags: 0x1 linked
// Checksum 0xa3814471, Offset: 0x108
// Size: 0x4c
function __init__() {
    clientfield::register("vehicle", "lead_drone_reload", 1, 1, "int", &reload, 0, 0);
}

// Namespace lead_drone/lead_drone
// Params 7, eflags: 0x1 linked
// Checksum 0xbe08bc0d, Offset: 0x160
// Size: 0x8c
function reload(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self function_d309e55a("tag_gun_deploy_control_animate", 0);
        return;
    }
    self function_d309e55a("tag_gun_deploy_control_animate", 1);
}

