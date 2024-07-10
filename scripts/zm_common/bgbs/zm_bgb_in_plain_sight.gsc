#using scripts\zm_common\zm_bgb.gsc;
#using scripts\core_common\visionset_mgr_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace zm_bgb_in_plain_sight;

// Namespace zm_bgb_in_plain_sight/zm_bgb_in_plain_sight
// Params 0, eflags: 0x2
// Checksum 0xd0f0c244, Offset: 0xe0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_in_plain_sight", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_in_plain_sight/zm_bgb_in_plain_sight
// Params 0, eflags: 0x1 linked
// Checksum 0x7b751cae, Offset: 0x130
// Size: 0x174
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_in_plain_sight", "activated", 1, undefined, undefined, undefined, &activation);
    bgb::function_72469efe(#"zm_bgb_in_plain_sight", 1);
    bgb::function_8a5d8cfb(#"zm_bgb_in_plain_sight", 1);
    bgb::function_57eb02e(#"zm_bgb_in_plain_sight");
    if (!isdefined(level.vsmgr_prio_visionset_zm_bgb_in_plain_sight)) {
        level.vsmgr_prio_visionset_zm_bgb_in_plain_sight = 110;
    }
    visionset_mgr::register_info("visionset", "zm_bgb_in_plain_sight", 1, level.vsmgr_prio_visionset_zm_bgb_in_plain_sight, 31, 1, &visionset_mgr::ramp_in_out_thread_per_player, 0);
    clientfield::register("toplayer", "" + #"hash_321b58d22755af74", 1, 1, "int");
}

// Namespace zm_bgb_in_plain_sight/zm_bgb_in_plain_sight
// Params 0, eflags: 0x0
// Checksum 0xfaa993e8, Offset: 0x2b0
// Size: 0x42
function validation() {
    if (self bgb::get_active() || isdefined(self.var_800f306a) && self.var_800f306a) {
        return false;
    }
    return true;
}

// Namespace zm_bgb_in_plain_sight/zm_bgb_in_plain_sight
// Params 0, eflags: 0x1 linked
// Checksum 0xb0bdac6c, Offset: 0x300
// Size: 0x1ae
function activation() {
    self endon(#"disconnect");
    self val::set(#"hash_69d303dd5e34b7b7", "ignoreme");
    self.bgb_in_plain_sight_active = 1;
    self playsound(#"zmb_bgb_plainsight_start");
    self thread bgb::run_timer(10);
    self clientfield::set_to_player("" + #"hash_321b58d22755af74", 1);
    ret = self waittilltimeout(9.5, #"bgb_about_to_take_on_bled_out", #"end_game", #"bgb_update", #"disconnect", #"scene_igc_shot_started");
    self playsound(#"zmb_bgb_plainsight_end");
    self clientfield::set_to_player("" + #"hash_321b58d22755af74", 0);
    self val::reset(#"hash_69d303dd5e34b7b7", "ignoreme");
    self.bgb_in_plain_sight_active = undefined;
}

