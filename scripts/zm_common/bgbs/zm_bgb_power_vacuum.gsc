#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_bgb;

#namespace zm_bgb_power_vacuum;

// Namespace zm_bgb_power_vacuum/zm_bgb_power_vacuum
// Params 0, eflags: 0x2
// Checksum 0xd54ac305, Offset: 0x80
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_power_vacuum", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_power_vacuum/zm_bgb_power_vacuum
// Params 0, eflags: 0x0
// Checksum 0x7904064a, Offset: 0xd0
// Size: 0x74
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_power_vacuum", "time", 300, &enable, &disable, undefined);
}

// Namespace zm_bgb_power_vacuum/zm_bgb_power_vacuum
// Params 0, eflags: 0x0
// Checksum 0xb43bcb8e, Offset: 0x150
// Size: 0x8e
function enable() {
    self endon(#"disconnect", #"bled_out", #"bgb_update");
    level.powerup_drop_count = 0;
    while (true) {
        level waittill(#"powerup_dropped");
        self bgb::do_one_shot_use();
        level.powerup_drop_count = 0;
    }
}

// Namespace zm_bgb_power_vacuum/zm_bgb_power_vacuum
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0x1e8
// Size: 0x4
function disable() {
    
}

