#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_stats;
#using scripts\zm_common\zm_talisman;
#using scripts\zm_common\util;
#using scripts\core_common\util_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\struct;

#namespace zm_talisman_permanent_heroweap_armor;

// Namespace zm_talisman_permanent_heroweap_armor/zm_talisman_permanent_heroweap_armor
// Params 0, eflags: 0x2
// Checksum 0x7e6c5732, Offset: 0xd8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_talisman_permanent_heroweap_armor", &__init__, undefined, undefined);
}

// Namespace zm_talisman_permanent_heroweap_armor/zm_talisman_permanent_heroweap_armor
// Params 0, eflags: 0x1 linked
// Checksum 0xb8a0a5c, Offset: 0x120
// Size: 0x2c
function __init__() {
    zm_talisman::register_talisman("talisman_permanent_heroweap_armor", &activate_talisman);
}

// Namespace zm_talisman_permanent_heroweap_armor/zm_talisman_permanent_heroweap_armor
// Params 0, eflags: 0x1 linked
// Checksum 0x1b67f77, Offset: 0x158
// Size: 0x12
function activate_talisman() {
    self.var_bacee63b = 1;
}

