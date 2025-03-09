#using scripts\core_common\array_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\util;
#using scripts\zm_common\zm_stats;
#using scripts\zm_common\zm_talisman;
#using scripts\zm_common\zm_utility;

#namespace zm_talisman_special_xp_rate;

// Namespace zm_talisman_special_xp_rate/zm_talisman_special_xp_rate
// Params 0, eflags: 0x2
// Checksum 0x2792db4e, Offset: 0xd0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_talisman_special_xp_rate", &__init__, undefined, undefined);
}

// Namespace zm_talisman_special_xp_rate/zm_talisman_special_xp_rate
// Params 0, eflags: 0x0
// Checksum 0x4e9b0460, Offset: 0x118
// Size: 0x2c
function __init__() {
    zm_talisman::register_talisman("talisman_special_xp_rate", &activate_talisman);
}

// Namespace zm_talisman_special_xp_rate/zm_talisman_special_xp_rate
// Params 0, eflags: 0x0
// Checksum 0x759e608c, Offset: 0x150
// Size: 0x12
function activate_talisman() {
    self.talisman_special_xp_rate = 1.3;
}

