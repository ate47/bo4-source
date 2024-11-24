#using scripts\core_common\clientfield_shared;
#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_bgb;

#namespace zm_bgb_respin_cycle;

// Namespace zm_bgb_respin_cycle/zm_bgb_respin_cycle
// Params 0, eflags: 0x2
// Checksum 0x3ec9afce, Offset: 0xe8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_respin_cycle", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_respin_cycle/zm_bgb_respin_cycle
// Params 0, eflags: 0x1 linked
// Checksum 0x66197883, Offset: 0x138
// Size: 0xb2
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_respin_cycle", "activated");
    clientfield::register("zbarrier", "zm_bgb_respin_cycle", 1, 1, "counter", &function_d1018763, 0, 0);
    level._effect["zm_bgb_respin_cycle"] = "zombie/fx_bgb_respin_cycle_box_flash_zmb";
}

// Namespace zm_bgb_respin_cycle/zm_bgb_respin_cycle
// Params 7, eflags: 0x1 linked
// Checksum 0x663d63ab, Offset: 0x1f8
// Size: 0x9c
function function_d1018763(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    playfx(localclientnum, level._effect["zm_bgb_respin_cycle"], self.origin, anglestoforward(self.angles), anglestoup(self.angles));
}

