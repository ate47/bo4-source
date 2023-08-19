// Atian COD Tools GSC decompiler test
#include script_24c32478acf44108;
#include scripts/zm_common/zm_utility.gsc;
#include scripts/core_common/ai/zombie_death.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/math_shared.gsc;
#include scripts/core_common/ai_shared.gsc;

#namespace zm_attachments;

// Namespace zm_attachments/zm_attachments
// Params 0, eflags: 0x2
// Checksum 0xf9c9d52, Offset: 0xc0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_attachments", &__init__, undefined, undefined);
}

// Namespace zm_attachments/zm_attachments
// Params 0, eflags: 0x1 linked
// Checksum 0x2a0df459, Offset: 0x108
// Size: 0xbc
function __init__() {
    namespace_9ff9f642::register_burn(#"hash_72a155025f3da562", 100, 3);
    namespace_9ff9f642::register_slowdown(#"hash_1c9af7bb427952d", 0.85, 1);
    namespace_9ff9f642::register_slowdown(#"hash_1d07249a2211a81d", 0.9, 1);
    namespace_9ff9f642::register_slowdown(#"hash_721bfbe781c0d680", 0.95, 1);
}

// Namespace zm_attachments/zm_attachments
// Params 12, eflags: 0x1 linked
// Checksum 0x6e973e11, Offset: 0x1d0
// Size: 0x1a6
function actor_damage_override(inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype) {
    if (isplayer(attacker) && isdefined(weapon) && meansofdeath !== "MOD_UNKNOWN") {
        if (weaponhasattachment(weapon, "uber")) {
            switch (weapon.rootweapon.name) {
            case #"lmg_standard_t8_upgraded":
            case #"lmg_standard_t8":
                self function_9f8d8c38();
                break;
            case #"shotgun_pump_t8_upgraded":
            case #"shotgun_pump_t8":
                if (meansofdeath !== "MOD_BURNED") {
                    damage = self dragons_breath(attacker, damage, weapon);
                }
                break;
            case #"shotgun_semiauto_t8":
            case #"shotgun_semiauto_t8_upgraded":
                self function_82bca1c7(attacker);
                break;
            }
        }
    }
    return damage;
}

// Namespace zm_attachments/zm_attachments
// Params 0, eflags: 0x1 linked
// Checksum 0x286b9764, Offset: 0x380
// Size: 0xe4
function function_9f8d8c38() {
    if (isdefined(self.var_6f84b820)) {
        switch (self.var_6f84b820) {
        case #"popcorn":
        case #"basic":
        case #"enhanced":
            var_3e5502b5 = #"hash_1c9af7bb427952d";
            break;
        case #"heavy":
            var_3e5502b5 = #"hash_1d07249a2211a81d";
            break;
        case #"miniboss":
            var_3e5502b5 = #"hash_721bfbe781c0d680";
            break;
        }
        if (isdefined(var_3e5502b5)) {
            self thread namespace_9ff9f642::slowdown(var_3e5502b5);
        }
    }
}

// Namespace zm_attachments/zm_attachments
// Params 3, eflags: 0x1 linked
// Checksum 0x3142bd5, Offset: 0x470
// Size: 0x1cc
function dragons_breath(e_attacker, n_damage, weapon) {
    if (!isdefined(self.var_f6291271)) {
        self.var_f6291271 = [];
    } else if (!isarray(self.var_f6291271)) {
        self.var_f6291271 = array(self.var_f6291271);
    }
    if (isinarray(self.var_f6291271, e_attacker)) {
        if (self.archetype === #"zombie" && n_damage > self.health) {
            self.var_b364c165 = 1;
        }
        return n_damage;
    }
    if (!isdefined(self.var_f6291271)) {
        self.var_f6291271 = [];
    } else if (!isarray(self.var_f6291271)) {
        self.var_f6291271 = array(self.var_f6291271);
    }
    self.var_f6291271[self.var_f6291271.size] = e_attacker;
    self thread function_ddda26e(e_attacker);
    if (self.archetype === #"zombie") {
        n_damage = n_damage + 100;
        if (n_damage < self.health) {
            self namespace_9ff9f642::burn(#"hash_72a155025f3da562", e_attacker, weapon);
        } else {
            self.var_b364c165 = 1;
        }
    } else {
        n_damage = n_damage + 200;
    }
    return n_damage;
}

// Namespace zm_attachments/zm_attachments
// Params 1, eflags: 0x5 linked
// Checksum 0x25d04c42, Offset: 0x648
// Size: 0x44
function private function_ddda26e(e_attacker) {
    self endon(#"death");
    waitframe(5);
    arrayremovevalue(self.var_f6291271, e_attacker);
}

// Namespace zm_attachments/zm_attachments
// Params 1, eflags: 0x1 linked
// Checksum 0x4c2bc472, Offset: 0x698
// Size: 0xc4
function function_82bca1c7(e_attacker) {
    if (e_attacker playerads() == 1) {
        if ((self.var_6f84b820 === #"basic" || self.var_6f84b820 === #"enhanced") && math::cointoss(10) && distancesquared(self.origin, e_attacker.origin) < 40000) {
            self ai::stun(2);
        }
    }
}

