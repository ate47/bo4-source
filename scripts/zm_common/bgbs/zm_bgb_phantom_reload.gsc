#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_bgb;
#using scripts\core_common\math_shared;
#using scripts\core_common\system_shared;

#namespace zm_bgb_phantom_reload;

// Namespace zm_bgb_phantom_reload/zm_bgb_phantom_reload
// Params 0, eflags: 0x2
// Checksum 0x38fd5258, Offset: 0x98
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_bgb_phantom_reload", &__init__, undefined, "bgb");
}

// Namespace zm_bgb_phantom_reload/zm_bgb_phantom_reload
// Params 0, eflags: 0x1 linked
// Checksum 0xf3880be9, Offset: 0xe0
// Size: 0x74
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_phantom_reload", "time", 240, &enable, &disable, undefined, undefined);
}

// Namespace zm_bgb_phantom_reload/zm_bgb_phantom_reload
// Params 0, eflags: 0x1 linked
// Checksum 0x3e8b484, Offset: 0x160
// Size: 0x1c
function enable() {
    self thread function_44514728();
}

// Namespace zm_bgb_phantom_reload/zm_bgb_phantom_reload
// Params 0, eflags: 0x1 linked
// Checksum 0xdb3da149, Offset: 0x188
// Size: 0x16
function disable() {
    self notify(#"hash_1980fe24a98adbe4");
}

// Namespace zm_bgb_phantom_reload/zm_bgb_phantom_reload
// Params 0, eflags: 0x1 linked
// Checksum 0x20c66831, Offset: 0x1a8
// Size: 0xd6
function function_44514728() {
    self endon(#"hash_1980fe24a98adbe4");
    while (true) {
        self waittill(#"reload_start");
        w_current = self getcurrentweapon();
        if (w_current.isabilityweapon) {
            continue;
        }
        if (math::cointoss(30)) {
            n_clip_size = w_current.clipsize;
            self setweaponammoclip(w_current, n_clip_size);
        }
        self waittill(#"reload");
    }
}

