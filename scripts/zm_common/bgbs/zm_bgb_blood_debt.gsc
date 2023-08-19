// Atian COD Tools GSC decompiler test
#include scripts/zm_common/zm_utility.gsc;
#include scripts/zm_common/zm_score.gsc;
#include scripts/zm_common/zm_player.gsc;
#include scripts/zm_common/zm_bgb.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/array_shared.gsc;

#namespace zm_bgb_blood_debt;

// Namespace zm_bgb_blood_debt/zm_bgb_blood_debt
// Params 0, eflags: 0x2
// Checksum 0x3dfa1235, Offset: 0xa0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_blood_debt", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_blood_debt/zm_bgb_blood_debt
// Params 0, eflags: 0x1 linked
// Checksum 0x674b0ee8, Offset: 0xf0
// Size: 0x94
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_blood_debt", "time", 60, &enable, &disable, undefined, undefined);
    zm_player::register_player_damage_callback(&function_4b163259);
}

// Namespace zm_bgb_blood_debt/zm_bgb_blood_debt
// Params 0, eflags: 0x1 linked
// Checksum 0xbce77de8, Offset: 0x190
// Size: 0xa6
function enable() {
    self endon(#"disconnect", #"bled_out", #"bgb_update");
    if (zm_utility::is_standard()) {
        self.var_d3df5e76 = array(2000);
    } else {
        self.var_d3df5e76 = array(50, 100, 250, 500);
    }
    self.var_7ad1482b = 1;
}

// Namespace zm_bgb_blood_debt/zm_bgb_blood_debt
// Params 0, eflags: 0x1 linked
// Checksum 0x448d6d6e, Offset: 0x240
// Size: 0x16
function disable() {
    self.var_d3df5e76 = undefined;
    self.var_7ad1482b = undefined;
}

// Namespace zm_bgb_blood_debt/zm_bgb_blood_debt
// Params 10, eflags: 0x1 linked
// Checksum 0x1c0afc22, Offset: 0x260
// Size: 0x196
function function_4b163259(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime) {
    if (bgb::is_enabled(#"zm_bgb_blood_debt") && !(isdefined(self.var_dad8bef6) && self.var_dad8bef6)) {
        if (idamage > 0) {
            if (self.var_d3df5e76.size > 1) {
                n_cost = self.var_d3df5e76[0];
            } else {
                n_cost = self.var_d3df5e76[0] * self.var_7ad1482b;
                self.var_7ad1482b++;
            }
            if (self zm_score::can_player_purchase(n_cost, 1)) {
                self function_c5d307a1(n_cost);
                return 0;
            } else {
                n_cost = zm_score::function_ffc2d0bc();
                if (n_cost == 0) {
                    n_damage = idamage;
                } else {
                    self function_c5d307a1(n_cost);
                    n_damage = 0;
                }
                self bgb::take();
                return n_damage;
            }
        }
    }
    return -1;
}

// Namespace zm_bgb_blood_debt/zm_bgb_blood_debt
// Params 1, eflags: 0x1 linked
// Checksum 0x2c2f73c4, Offset: 0x400
// Size: 0x5a
function function_c5d307a1(n_cost) {
    self zm_score::minus_to_player_score(n_cost, 1);
    if (self.var_d3df5e76.size > 1) {
        self.var_d3df5e76 = array::remove_index(self.var_d3df5e76, 0);
    }
}

