// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_customgame.gsc;
#using scripts\zm_common\zm_bgb.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_bgb_wall_power;

// Namespace zm_bgb_wall_power/zm_bgb_wall_power
// Params 0, eflags: 0x2
// Checksum 0x60ad3fb9, Offset: 0x90
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_wall_power", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_wall_power/zm_bgb_wall_power
// Params 0, eflags: 0x1 linked
// Checksum 0xaf74b1a5, Offset: 0xe0
// Size: 0x6c
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_wall_power", "event", &event, undefined, undefined, &validation);
}

// Namespace zm_bgb_wall_power/zm_bgb_wall_power
// Params 0, eflags: 0x1 linked
// Checksum 0x7dd4f796, Offset: 0x158
// Size: 0x94
function event() {
    self endon(#"disconnect", #"bgb_update");
    self waittill(#"zm_bgb_wall_power_used");
    self playsoundtoplayer(#"zmb_bgb_wall_power", self);
    self zm_stats::increment_challenge_stat(#"gum_gobbler_wall_power");
    self bgb::do_one_shot_use();
}

// Namespace zm_bgb_wall_power/zm_bgb_wall_power
// Params 0, eflags: 0x1 linked
// Checksum 0x617eb3d2, Offset: 0x1f8
// Size: 0x2e
function validation() {
    if (!zm_custom::function_901b751c(#"zmwallbuysenabled")) {
        return false;
    }
    return true;
}

