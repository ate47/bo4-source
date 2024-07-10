#using scripts\zm_common\zm_bgb.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_bgb_immolation_liquidation;

// Namespace zm_bgb_immolation_liquidation/zm_bgb_immolation_liquidation
// Params 0, eflags: 0x2
// Checksum 0x1e108d55, Offset: 0x98
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_immolation_liquidation", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_immolation_liquidation/zm_bgb_immolation_liquidation
// Params 0, eflags: 0x1 linked
// Checksum 0x81bffed4, Offset: 0xe8
// Size: 0x74
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_immolation_liquidation", "activated", 1, undefined, undefined, &function_1efaba5e, &activation);
}

// Namespace zm_bgb_immolation_liquidation/zm_bgb_immolation_liquidation
// Params 0, eflags: 0x1 linked
// Checksum 0x8a58b5d4, Offset: 0x168
// Size: 0x24
function activation() {
    self thread bgb::function_c6cd71d5("fire_sale", undefined, 96);
}

// Namespace zm_bgb_immolation_liquidation/zm_bgb_immolation_liquidation
// Params 0, eflags: 0x1 linked
// Checksum 0xb9cfc586, Offset: 0x198
// Size: 0x72
function function_1efaba5e() {
    if (zombie_utility::get_zombie_var(#"zombie_powerup_fire_sale_on") === 1 || isdefined(level.disable_firesale_drop) && level.disable_firesale_drop || !self bgb::function_9d8118f5()) {
        return false;
    }
    return true;
}

