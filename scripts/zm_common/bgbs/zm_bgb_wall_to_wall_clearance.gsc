// Atian COD Tools GSC decompiler test
#include scripts/zm_common/zm_weapons.gsc;
#include scripts/zm_common/zm_wallbuy.gsc;
#include scripts/zm_common/zm_customgame.gsc;
#include scripts/zm_common/zm_bgb.gsc;
#include scripts/core_common/system_shared.gsc;

#namespace zm_bgb_wall_to_wall_clearance;

// Namespace zm_bgb_wall_to_wall_clearance/zm_bgb_wall_to_wall_clearance
// Params 0, eflags: 0x2
// Checksum 0x4d2fd287, Offset: 0xa0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_bgb_wall_to_wall_clearance", &__init__, undefined, "bgb");
}

// Namespace zm_bgb_wall_to_wall_clearance/zm_bgb_wall_to_wall_clearance
// Params 0, eflags: 0x1 linked
// Checksum 0xdf5d1e69, Offset: 0xe8
// Size: 0x84
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_wall_to_wall_clearance", "time", 30, &enable, &disable, &validation, undefined);
}

// Namespace zm_bgb_wall_to_wall_clearance/zm_bgb_wall_to_wall_clearance
// Params 0, eflags: 0x1 linked
// Checksum 0xc2738ffe, Offset: 0x178
// Size: 0x64
function enable() {
    zm_wallbuy::function_c047c228(&function_84832f40);
    zm_wallbuy::function_33023da5(&function_84832f40);
    zm_wallbuy::function_48f914bd(&override_ammo_cost);
}

// Namespace zm_bgb_wall_to_wall_clearance/zm_bgb_wall_to_wall_clearance
// Params 0, eflags: 0x1 linked
// Checksum 0xb73cab53, Offset: 0x1e8
// Size: 0x64
function disable() {
    zm_wallbuy::function_a6889c(&function_84832f40);
    zm_wallbuy::function_782e8955(&function_84832f40);
    zm_wallbuy::function_99911dae(&override_ammo_cost);
}

// Namespace zm_bgb_wall_to_wall_clearance/zm_bgb_wall_to_wall_clearance
// Params 0, eflags: 0x1 linked
// Checksum 0x41034431, Offset: 0x258
// Size: 0x2e
function validation() {
    if (!zm_custom::function_901b751c(#"zmwallbuysenabled")) {
        return 0;
    }
    return 1;
}

// Namespace zm_bgb_wall_to_wall_clearance/zm_bgb_wall_to_wall_clearance
// Params 2, eflags: 0x1 linked
// Checksum 0x3f0f46fb, Offset: 0x290
// Size: 0x18
function function_84832f40(w_wallbuy, var_2b6f3563) {
    return 10;
}

// Namespace zm_bgb_wall_to_wall_clearance/zm_bgb_wall_to_wall_clearance
// Params 2, eflags: 0x1 linked
// Checksum 0xcbf163d0, Offset: 0x2b0
// Size: 0x3e
function override_ammo_cost(w_wallbuy, stub) {
    if (self zm_weapons::has_upgrade(w_wallbuy)) {
        return 500;
    } else {
        return 10;
    }
}

