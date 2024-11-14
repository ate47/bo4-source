#using scripts\zm_common\zm_bgb;
#using scripts\core_common\visionset_mgr_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\postfx_shared;
#using scripts\core_common\clientfield_shared;

#namespace zm_bgb_in_plain_sight;

// Namespace zm_bgb_in_plain_sight/zm_bgb_in_plain_sight
// Params 0, eflags: 0x2
// Checksum 0x618c8b23, Offset: 0xc8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_in_plain_sight", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_in_plain_sight/zm_bgb_in_plain_sight
// Params 0, eflags: 0x1 linked
// Checksum 0x930ce5f5, Offset: 0x118
// Size: 0xcc
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_in_plain_sight", "activated");
    visionset_mgr::register_visionset_info("zm_bgb_in_plain_sight", 1, 31, undefined, "zm_bgb_in_plain_sight");
    clientfield::register("toplayer", "" + #"hash_321b58d22755af74", 1, 1, "int", &function_8b05d1ce, 0, 0);
}

// Namespace zm_bgb_in_plain_sight/zm_bgb_in_plain_sight
// Params 7, eflags: 0x1 linked
// Checksum 0xebe32fc8, Offset: 0x1f0
// Size: 0x144
function function_8b05d1ce(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 1) {
        self thread postfx::playpostfxbundle(#"hash_1e8cc5b28385a579");
        if (!isdefined(self.var_6fc0e881)) {
            self playsound(localclientnum, #"hash_766f7e280a750ba8");
            self.var_6fc0e881 = self playloopsound(#"hash_38ea108cd6442868");
        }
        return;
    }
    self postfx::stoppostfxbundle(#"hash_1e8cc5b28385a579");
    if (isdefined(self.var_6fc0e881)) {
        self playsound(localclientnum, #"hash_5d65ef28d3f9dc1d");
        self stoploopsound(self.var_6fc0e881);
    }
}

