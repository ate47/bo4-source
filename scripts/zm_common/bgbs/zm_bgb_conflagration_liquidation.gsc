// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_bgb.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\flag_shared.gsc;

#namespace zm_bgb_conflagration_liquidation;

// Namespace zm_bgb_conflagration_liquidation/zm_bgb_conflagration_liquidation
// Params 0, eflags: 0x2
// Checksum 0xe6068022, Offset: 0xb8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_conflagration_liquidation", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_conflagration_liquidation/zm_bgb_conflagration_liquidation
// Params 0, eflags: 0x1 linked
// Checksum 0xa8982b72, Offset: 0x108
// Size: 0x74
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_conflagration_liquidation", "activated", 1, undefined, undefined, &function_fe4e9412, &activation);
}

// Namespace zm_bgb_conflagration_liquidation/zm_bgb_conflagration_liquidation
// Params 0, eflags: 0x1 linked
// Checksum 0x7f7822a7, Offset: 0x188
// Size: 0x24
function activation() {
    self thread bgb::function_c6cd71d5("bonfire_sale", undefined, 96);
}

// Namespace zm_bgb_conflagration_liquidation/zm_bgb_conflagration_liquidation
// Params 0, eflags: 0x1 linked
// Checksum 0x76b5cbbe, Offset: 0x1b8
// Size: 0x9a
function function_fe4e9412() {
    if (!level flag::get("pap_machine_active") || zombie_utility::function_d2dfacfd(#"zombie_powerup_bonfire_sale_on") === 1 || isdefined(level.var_56cb3d3a) && level.var_56cb3d3a || !self bgb::function_9d8118f5()) {
        return 0;
    }
    return 1;
}

