#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_talisman.gsc;
#using scripts\zm_common\util.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_talisman_perk_reducecost_4;

// Namespace zm_talisman_perk_reducecost_4/zm_talisman_perk_reducecost_4
// Params 0, eflags: 0x2
// Checksum 0x16f19bb5, Offset: 0xd0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_talisman_perk_reducecost_4", &__init__, undefined, undefined);
}

// Namespace zm_talisman_perk_reducecost_4/zm_talisman_perk_reducecost_4
// Params 0, eflags: 0x1 linked
// Checksum 0xd7806d4a, Offset: 0x118
// Size: 0x2c
function __init__() {
    zm_talisman::register_talisman("talisman_perk_reducecost_4", &activate_talisman);
}

// Namespace zm_talisman_perk_reducecost_4/zm_talisman_perk_reducecost_4
// Params 0, eflags: 0x1 linked
// Checksum 0xee3737b, Offset: 0x150
// Size: 0x12
function activate_talisman() {
    self.talisman_perk_reducecost_4 = 1000;
}

