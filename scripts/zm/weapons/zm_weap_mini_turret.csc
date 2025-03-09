#using scripts\core_common\clientfield_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\visionset_mgr_shared;

#namespace mini_turret;

// Namespace mini_turret/zm_weap_mini_turret
// Params 0, eflags: 0x2
// Checksum 0x3b139115, Offset: 0xc0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"mini_turret", &__init__, undefined, undefined);
}

// Namespace mini_turret/zm_weap_mini_turret
// Params 0, eflags: 0x0
// Checksum 0x77787389, Offset: 0x108
// Size: 0x4c
function __init__() {
    clientfield::register("vehicle", "mini_turret_open", 1, 1, "int", &turret_open, 0, 0);
}

// Namespace mini_turret/zm_weap_mini_turret
// Params 7, eflags: 0x0
// Checksum 0x6a5c26b6, Offset: 0x160
// Size: 0xbc
function turret_open(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (!newval) {
        return;
    }
    self util::waittill_dobj(localclientnum);
    if (isdefined(self)) {
        self useanimtree("generic");
        self setanimrestart(#"o_turret_mini_deploy", 1, 0, 1);
    }
}

