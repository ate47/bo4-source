// Atian COD Tools GSC decompiler test
#include scripts/zm_common/zm_bgb.csc;
#include scripts/core_common/visionset_mgr_shared.csc;
#include scripts/core_common/system_shared.csc;
#include scripts/core_common/postfx_shared.csc;
#include scripts/core_common/clientfield_shared.csc;

#namespace zm_bgb_now_you_see_me;

// Namespace zm_bgb_now_you_see_me/zm_bgb_now_you_see_me
// Params 0, eflags: 0x2
// Checksum 0x4b930fcd, Offset: 0xe0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_now_you_see_me", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_now_you_see_me/zm_bgb_now_you_see_me
// Params 0, eflags: 0x1 linked
// Checksum 0xce84462c, Offset: 0x130
// Size: 0xcc
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_now_you_see_me", "activated");
    visionset_mgr::register_visionset_info("zm_bgb_now_you_see_me", 1, 31, undefined, "zm_bgb_in_plain_sight");
    clientfield::register("toplayer", "" + #"hash_18be2b4b3936ee1f", 1, 1, "int", &function_387d8f36, 0, 0);
}

// Namespace zm_bgb_now_you_see_me/zm_bgb_now_you_see_me
// Params 7, eflags: 0x1 linked
// Checksum 0xcaa07518, Offset: 0x208
// Size: 0x13c
function function_387d8f36(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 1) {
        self thread postfx::playpostfxbundle(#"hash_129cb5a3537b76f4");
        if (!isdefined(self.var_ab7bde88)) {
            self playsound(localclientnum, #"hash_7b2800dd9e263794");
            self.var_ab7bde88 = self playloopsound(#"hash_3045ef348e47e6b4");
        }
    } else {
        self postfx::stoppostfxbundle(#"hash_129cb5a3537b76f4");
        if (isdefined(self.var_ab7bde88)) {
            self stoploopsound(self.var_ab7bde88);
            self playsound(localclientnum, #"hash_15703d934c79add1");
        }
    }
}

