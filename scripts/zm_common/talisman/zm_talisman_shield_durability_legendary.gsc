#using scripts\core_common\array_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\util;
#using scripts\zm_common\zm_stats;
#using scripts\zm_common\zm_talisman;
#using scripts\zm_common\zm_utility;

#namespace zm_talisman_shield_durability_legendary;

// Namespace zm_talisman_shield_durability_legendary/zm_talisman_shield_durability_legendary
// Params 0, eflags: 0x2
// Checksum 0x674d945f, Offset: 0xd8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_talisman_shield_durability_legendary", &__init__, undefined, undefined);
}

// Namespace zm_talisman_shield_durability_legendary/zm_talisman_shield_durability_legendary
// Params 0, eflags: 0x1 linked
// Checksum 0x9fa9fcf3, Offset: 0x120
// Size: 0x2c
function __init__() {
    zm_talisman::register_talisman("talisman_shield_durability_legendary", &activate_talisman);
}

// Namespace zm_talisman_shield_durability_legendary/zm_talisman_shield_durability_legendary
// Params 0, eflags: 0x1 linked
// Checksum 0x211392b1, Offset: 0x158
// Size: 0x12
function activate_talisman() {
    self.var_9c2026aa = 0.33;
}

