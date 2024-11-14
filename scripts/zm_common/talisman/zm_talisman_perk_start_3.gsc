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

#namespace zm_talisman_perk_start_3;

// Namespace zm_talisman_perk_start_3/zm_talisman_perk_start_3
// Params 0, eflags: 0x2
// Checksum 0xb61551c, Offset: 0xd0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_talisman_perk_start_3", &__init__, undefined, undefined);
}

// Namespace zm_talisman_perk_start_3/zm_talisman_perk_start_3
// Params 0, eflags: 0x1 linked
// Checksum 0x7e04f7c7, Offset: 0x118
// Size: 0x2c
function __init__() {
    zm_talisman::register_talisman("talisman_perk_start_3", &activate_talisman);
}

// Namespace zm_talisman_perk_start_3/zm_talisman_perk_start_3
// Params 0, eflags: 0x1 linked
// Checksum 0x5eaa4e7, Offset: 0x150
// Size: 0x46
function activate_talisman() {
    if (isdefined(self.var_c27f1e90) && zm_custom::function_d9f0defb(self.var_c27f1e90[2])) {
        self.talisman_perk_start_3 = 1;
    }
}

