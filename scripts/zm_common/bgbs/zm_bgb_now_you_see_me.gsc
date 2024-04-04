// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_bgb.gsc;
#using scripts\core_common\visionset_mgr_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace zm_bgb_now_you_see_me;

// Namespace zm_bgb_now_you_see_me/zm_bgb_now_you_see_me
// Params 0, eflags: 0x2
// Checksum 0x1fb0d2a5, Offset: 0xd8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_now_you_see_me", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_now_you_see_me/zm_bgb_now_you_see_me
// Params 0, eflags: 0x1 linked
// Checksum 0xd35b1b05, Offset: 0x128
// Size: 0x14c
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_now_you_see_me", "activated", 1, undefined, undefined, undefined, &activation);
    bgb::function_57eb02e(#"zm_bgb_now_you_see_me");
    bgb::function_1fee6b3(#"zm_bgb_now_you_see_me", 19);
    if (!isdefined(level.vsmgr_prio_visionset_zm_bgb_now_you_see_me)) {
        level.vsmgr_prio_visionset_zm_bgb_now_you_see_me = 111;
    }
    visionset_mgr::register_info("visionset", "zm_bgb_now_you_see_me", 1, level.vsmgr_prio_visionset_zm_bgb_now_you_see_me, 31, 1, &visionset_mgr::ramp_in_out_thread_per_player, 0);
    clientfield::register("toplayer", "" + #"hash_18be2b4b3936ee1f", 1, 1, "int");
}

// Namespace zm_bgb_now_you_see_me/zm_bgb_now_you_see_me
// Params 0, eflags: 0x0
// Checksum 0xa94a66af, Offset: 0x280
// Size: 0x36
function validation() {
    return !(isdefined(self bgb::get_active()) && self bgb::get_active());
}

// Namespace zm_bgb_now_you_see_me/zm_bgb_now_you_see_me
// Params 0, eflags: 0x1 linked
// Checksum 0x2f7cebe3, Offset: 0x2c0
// Size: 0x17e
function activation() {
    self endon(#"disconnect");
    self.b_is_designated_target = 1;
    self thread bgb::run_timer(15);
    self playsound(#"zmb_bgb_nysm_start");
    self clientfield::set_to_player("" + #"hash_18be2b4b3936ee1f", 1);
    ret = self waittilltimeout(14.5, #"bgb_about_to_take_on_bled_out", #"end_game", #"bgb_update", #"disconnect");
    self playsound(#"zmb_bgb_nysm_end");
    if ("timeout" != ret._notify) {
        visionset_mgr::deactivate("visionset", "zm_bgb_now_you_see_me", self);
    }
    self clientfield::set_to_player("" + #"hash_18be2b4b3936ee1f", 0);
    self.b_is_designated_target = 0;
}

