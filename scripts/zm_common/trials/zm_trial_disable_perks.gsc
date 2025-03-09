#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\player\player_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\weapons_shared;
#using scripts\zm_common\zm_perks;
#using scripts\zm_common\zm_trial;
#using scripts\zm_common\zm_trial_util;

#namespace zm_trial_disable_perks;

// Namespace zm_trial_disable_perks/zm_trial_disable_perks
// Params 0, eflags: 0x2
// Checksum 0xa1e45001, Offset: 0xb8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_trial_disable_perks", &__init__, undefined, undefined);
}

// Namespace zm_trial_disable_perks/zm_trial_disable_perks
// Params 0, eflags: 0x0
// Checksum 0x24906419, Offset: 0x100
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"disable_perks", &on_begin, &on_end);
}

// Namespace zm_trial_disable_perks/zm_trial_disable_perks
// Params 0, eflags: 0x4
// Checksum 0xd0582fb9, Offset: 0x168
// Size: 0x154
function private on_begin() {
    level zm_trial::function_2b3a3307(1);
    assert(isdefined(level.var_b8be892e));
    foreach (player in getplayers()) {
        player function_f0b698a7();
        if (!isdefined(player.var_7864a0f6)) {
            player.var_7864a0f6 = player zm_trial_util::function_3f8a4145(0);
            player function_85611c27();
        }
    }
    callback::on_revived(&function_776fbeaf);
    callback::on_laststand(&function_551412f6);
    zm_trial_util::function_8036c103();
}

// Namespace zm_trial_disable_perks/zm_trial_disable_perks
// Params 1, eflags: 0x4
// Checksum 0x651e1de7, Offset: 0x2c8
// Size: 0x14c
function private on_end(round_reset) {
    level zm_trial::function_2b3a3307(0);
    if (!round_reset) {
        foreach (player in getplayers()) {
            assert(isdefined(player.var_7864a0f6));
            player zm_trial_util::function_d37a769(player.var_7864a0f6);
            player function_2c0ae6d1();
            player.var_7864a0f6 = undefined;
        }
    }
    callback::remove_on_revived(&function_776fbeaf);
    callback::remove_on_laststand(&function_551412f6);
    zm_trial_util::function_302c6014();
}

// Namespace zm_trial_disable_perks/zm_trial_disable_perks
// Params 1, eflags: 0x0
// Checksum 0x5b76304d, Offset: 0x420
// Size: 0x7a
function is_active(var_34f09024 = 0) {
    if (var_34f09024 && zm_trial::function_48736df9(#"disable_perks")) {
        return true;
    }
    challenge = zm_trial::function_a36e8c38(#"disable_perks");
    return isdefined(challenge);
}

// Namespace zm_trial_disable_perks/zm_trial_disable_perks
// Params 1, eflags: 0x0
// Checksum 0xbe2c7cd1, Offset: 0x4a8
// Size: 0x1a2
function lose_perk(perk) {
    if (!is_active()) {
        return false;
    }
    slot = self zm_perks::function_c1efcc57(perk);
    if (slot != -1 && isdefined(self.var_7864a0f6) && isdefined(self.var_7864a0f6.var_149ec45c[slot]) && self.var_7864a0f6.var_149ec45c[slot] && !self zm_perks::function_e56d8ef4(perk)) {
        arrayremovevalue(self.var_cd5d9345, perk, 0);
        self.var_7864a0f6.var_149ec45c[slot] = 0;
        if (!isdefined(self.var_7864a0f6.var_6fdc9c9c)) {
            self.var_7864a0f6.var_6fdc9c9c = [];
        } else if (!isarray(self.var_7864a0f6.var_6fdc9c9c)) {
            self.var_7864a0f6.var_6fdc9c9c = array(self.var_7864a0f6.var_6fdc9c9c);
        }
        self.var_7864a0f6.var_6fdc9c9c[self.var_7864a0f6.var_6fdc9c9c.size] = slot;
        return true;
    }
    return false;
}

// Namespace zm_trial_disable_perks/zm_trial_disable_perks
// Params 1, eflags: 0x0
// Checksum 0xfea16ea2, Offset: 0x658
// Size: 0x112
function function_776fbeaf(s_params) {
    if (isdefined(self.var_fbc66a96) && self.var_fbc66a96 && isdefined(self.var_7864a0f6) && isarray(self.var_7864a0f6.var_149ec45c) && isarray(self.var_7864a0f6.var_6fdc9c9c)) {
        foreach (var_224c0c9c in self.var_7864a0f6.var_6fdc9c9c) {
            self.var_7864a0f6.var_149ec45c[var_224c0c9c] = 1;
        }
        self.var_7864a0f6.var_6fdc9c9c = undefined;
    }
}

// Namespace zm_trial_disable_perks/zm_trial_disable_perks
// Params 0, eflags: 0x0
// Checksum 0x47bd913, Offset: 0x778
// Size: 0x3e
function function_551412f6() {
    if (isdefined(self.var_7864a0f6)) {
        self.var_7864a0f6.var_724d826b = undefined;
        self.var_7864a0f6.var_8dee79a9 = undefined;
        self.var_7864a0f6.var_d3f0257d = undefined;
    }
}

// Namespace zm_trial_disable_perks/zm_trial_disable_perks
// Params 0, eflags: 0x4
// Checksum 0xd0ae527a, Offset: 0x7c0
// Size: 0x3a
function private function_f0b698a7() {
    self player::generate_weapon_data();
    self.var_4a17c2cb = self._generated_weapons;
    self._generated_current_weapon = undefined;
    self._generated_weapons = undefined;
}

// Namespace zm_trial_disable_perks/zm_trial_disable_perks
// Params 0, eflags: 0x4
// Checksum 0x99e3999d, Offset: 0x808
// Size: 0xc4
function private function_85611c27() {
    if (isdefined(self.var_7864a0f6.additional_primary_weapon)) {
        foreach (weapondata in self.var_4a17c2cb) {
            weapon = weapondata[#"weapon"];
            if (weapon === self.var_7864a0f6.additional_primary_weapon) {
                self.var_7864a0f6.var_dd9bd473 = weapondata;
                return;
            }
        }
    }
}

// Namespace zm_trial_disable_perks/zm_trial_disable_perks
// Params 0, eflags: 0x4
// Checksum 0xd6ae20d7, Offset: 0x8d8
// Size: 0x15e
function private function_2c0ae6d1() {
    assert(isdefined(self.var_4a17c2cb));
    var_4493e3e1 = isarray(self.var_7864a0f6.var_724d826b) && isinarray(self.var_7864a0f6.var_724d826b, #"specialty_additionalprimaryweapon");
    if ((var_4493e3e1 || isinarray(self.var_466b927f, #"specialty_additionalprimaryweapon")) && isdefined(self.var_7864a0f6.additional_primary_weapon) && isdefined(self.var_7864a0f6.var_dd9bd473) && !self hasweapon(self.var_7864a0f6.additional_primary_weapon)) {
        self player::weapondata_give(self.var_7864a0f6.var_dd9bd473);
        self zm_trial_util::function_7f999aa0(self.var_7864a0f6);
    }
    self.var_4a17c2cb = undefined;
}

