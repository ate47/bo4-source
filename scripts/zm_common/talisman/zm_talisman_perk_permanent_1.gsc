#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_stats;
#using scripts\zm_common\zm_talisman;
#using scripts\zm_common\util;
#using scripts\core_common\util_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\struct;

#namespace zm_talisman_perk_permanent_1;

// Namespace zm_talisman_perk_permanent_1/zm_talisman_perk_permanent_1
// Params 0, eflags: 0x2
// Checksum 0xec61a6d3, Offset: 0xd0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_talisman_perk_permanent_1", &__init__, undefined, undefined);
}

// Namespace zm_talisman_perk_permanent_1/zm_talisman_perk_permanent_1
// Params 0, eflags: 0x1 linked
// Checksum 0x44116b40, Offset: 0x118
// Size: 0x2c
function __init__() {
    zm_talisman::register_talisman("talisman_perk_permanent_1", &activate_talisman);
}

// Namespace zm_talisman_perk_permanent_1/zm_talisman_perk_permanent_1
// Params 0, eflags: 0x1 linked
// Checksum 0x7824db4c, Offset: 0x150
// Size: 0x12
function activate_talisman() {
    self.talisman_perk_permanent = 1;
}

