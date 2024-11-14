#using scripts\zm_common\zm_weapons;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_stats;
#using scripts\zm_common\zm_talisman;
#using scripts\zm_common\util;
#using scripts\core_common\util_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\struct;

#namespace zm_talisman_box_guarantee_box_only;

// Namespace zm_talisman_box_guarantee_box_only/zm_talisman_box_guarantee_box_only
// Params 0, eflags: 0x2
// Checksum 0xcfbde237, Offset: 0x110
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_talisman_box_guarantee_box_only", &__init__, undefined, undefined);
}

// Namespace zm_talisman_box_guarantee_box_only/zm_talisman_box_guarantee_box_only
// Params 0, eflags: 0x1 linked
// Checksum 0x2028f879, Offset: 0x158
// Size: 0x2c
function __init__() {
    zm_talisman::register_talisman("talisman_box_guarantee_box_only", &activate_talisman);
}

// Namespace zm_talisman_box_guarantee_box_only/zm_talisman_box_guarantee_box_only
// Params 0, eflags: 0x1 linked
// Checksum 0xb20d7ece, Offset: 0x190
// Size: 0x26
function activate_talisman() {
    self.var_afb3ba4e = &function_543a48f0;
    self.var_c21099c0 = 1;
}

// Namespace zm_talisman_box_guarantee_box_only/zm_talisman_box_guarantee_box_only
// Params 1, eflags: 0x1 linked
// Checksum 0x27e8ace1, Offset: 0x1c0
// Size: 0x1ea
function function_543a48f0(a_keys) {
    a_wallbuys = array();
    a_valid = array();
    var_52fb84b5 = [];
    var_52fb84b5 = struct::get_array("weapon_upgrade", "targetname");
    var_52fb84b5 = arraycombine(var_52fb84b5, struct::get_array("buildable_wallbuy", "targetname"), 1, 0);
    for (i = 0; i < var_52fb84b5.size; i++) {
        w_wallbuy = getweapon(var_52fb84b5[i].zombie_weapon_upgrade);
        array::add(a_wallbuys, w_wallbuy);
    }
    foreach (w_key in a_keys) {
        if (!zm_weapons::is_wonder_weapon(w_key)) {
            array::add(a_valid, w_key);
        }
    }
    a_keys = array::exclude(a_valid, a_wallbuys);
    a_keys = array::randomize(a_keys);
    self.var_afb3ba4e = undefined;
    self.var_c21099c0 = undefined;
    return a_keys;
}

