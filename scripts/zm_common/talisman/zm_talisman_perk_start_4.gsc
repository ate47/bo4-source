#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_stats;
#using scripts\zm_common\zm_talisman;
#using scripts\zm_common\zm_customgame;
#using scripts\zm_common\util;
#using scripts\core_common\util_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\struct;

#namespace zm_talisman_perk_start_4;

// Namespace zm_talisman_perk_start_4/zm_talisman_perk_start_4
// Params 0, eflags: 0x2
// Checksum 0xf0444153, Offset: 0xd0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_talisman_perk_start_4", &__init__, undefined, undefined);
}

// Namespace zm_talisman_perk_start_4/zm_talisman_perk_start_4
// Params 0, eflags: 0x1 linked
// Checksum 0x3c2305d0, Offset: 0x118
// Size: 0x2c
function __init__() {
    zm_talisman::register_talisman("talisman_perk_start_4", &activate_talisman);
}

// Namespace zm_talisman_perk_start_4/zm_talisman_perk_start_4
// Params 0, eflags: 0x1 linked
// Checksum 0xcd6bf75e, Offset: 0x150
// Size: 0x46
function activate_talisman() {
    if (isdefined(self.var_c27f1e90) && zm_custom::function_d9f0defb(self.var_c27f1e90[3])) {
        self.talisman_perk_start_4 = 1;
    }
}

