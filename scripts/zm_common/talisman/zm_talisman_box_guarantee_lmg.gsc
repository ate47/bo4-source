// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_talisman.gsc;
#using scripts\zm_common\util.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_talisman_box_guarantee_lmg;

// Namespace zm_talisman_box_guarantee_lmg/zm_talisman_box_guarantee_lmg
// Params 0, eflags: 0x2
// Checksum 0x34450df, Offset: 0xd8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_talisman_box_guarantee_lmg", &__init__, undefined, undefined);
}

// Namespace zm_talisman_box_guarantee_lmg/zm_talisman_box_guarantee_lmg
// Params 0, eflags: 0x1 linked
// Checksum 0x41bae602, Offset: 0x120
// Size: 0x2c
function __init__() {
    zm_talisman::register_talisman("talisman_box_guarantee_lmg", &activate_talisman);
}

// Namespace zm_talisman_box_guarantee_lmg/zm_talisman_box_guarantee_lmg
// Params 0, eflags: 0x1 linked
// Checksum 0xc94702dd, Offset: 0x158
// Size: 0x26
function activate_talisman() {
    self.var_afb3ba4e = &function_8d50b46a;
    self.var_c21099c0 = 1;
}

// Namespace zm_talisman_box_guarantee_lmg/zm_talisman_box_guarantee_lmg
// Params 1, eflags: 0x1 linked
// Checksum 0xf5a05b0f, Offset: 0x188
// Size: 0xfa
function function_8d50b46a(a_keys) {
    a_valid = array();
    foreach (w_key in a_keys) {
        if (w_key.weapclass == "mg") {
            array::add(a_valid, w_key);
        }
    }
    if (a_valid.size == 0) {
        a_valid = a_keys;
    }
    a_valid = array::randomize(a_valid);
    self.var_afb3ba4e = undefined;
    self.var_c21099c0 = undefined;
    return a_valid;
}

