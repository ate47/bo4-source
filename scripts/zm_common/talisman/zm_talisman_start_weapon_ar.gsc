#using scripts\core_common\array_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\util;
#using scripts\zm_common\zm_customgame;
#using scripts\zm_common\zm_stats;
#using scripts\zm_common\zm_talisman;
#using scripts\zm_common\zm_utility;

#namespace zm_talisman_start_weapon_ar;

// Namespace zm_talisman_start_weapon_ar/zm_talisman_start_weapon_ar
// Params 0, eflags: 0x2
// Checksum 0xf1bab6ab, Offset: 0xd8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_talisman_start_weapon_ar", &__init__, undefined, undefined);
}

// Namespace zm_talisman_start_weapon_ar/zm_talisman_start_weapon_ar
// Params 0, eflags: 0x0
// Checksum 0xa799d0c2, Offset: 0x120
// Size: 0x7c
function __init__() {
    if (!zm_custom::function_901b751c(#"zmweaponsar") || !zm_custom::function_901b751c(#"zmstartingweaponenabled")) {
        return;
    }
    zm_talisman::register_talisman("talisman_start_weapon_ar", &activate_talisman);
}

// Namespace zm_talisman_start_weapon_ar/zm_talisman_start_weapon_ar
// Params 0, eflags: 0x0
// Checksum 0x83b382c2, Offset: 0x1a8
// Size: 0x1a
function activate_talisman() {
    self.talisman_weapon_start = #"ar_modular_t8";
}

