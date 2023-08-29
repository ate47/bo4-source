// Atian COD Tools GSC decompiler test
#include scripts/zm/zm_lightning_chain.gsc;
#include scripts/zm_common/zm_utility.gsc;
#include scripts/zm_common/zm.gsc;
#include scripts/core_common/callbacks_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;
#include scripts/core_common/ai_shared.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/ai/systems/gib.gsc;

#namespace zm_weap_tesla_sniper_t8;

// Namespace zm_weap_tesla_sniper_t8/zm_weap_tesla_sniper_t8
// Params 0, eflags: 0x2
// Checksum 0x80e015a6, Offset: 0x148
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"tesla_sniper", &__init__, undefined, undefined);
}

// Namespace zm_weap_tesla_sniper_t8/zm_weap_tesla_sniper_t8
// Params 0, eflags: 0x1 linked
// Checksum 0x905d2d4a, Offset: 0x190
// Size: 0x33c
function __init__() {
    level.w_tesla_sniper_t8 = getweapon(#"ww_tesla_sniper_t8");
    level.w_tesla_sniper_upgraded_t8 = getweapon(#"ww_tesla_sniper_upgraded_t8");
    level.var_79959866 = spawnstruct();
    level.var_79959866.base = spawnstruct();
    level.var_79959866.upgraded = spawnstruct();
    level.var_79959866.base.var_38cd3d0e = lightning_chain::create_lightning_chain_params(10, 11, 256);
    level.var_79959866.base.var_38cd3d0e.head_gib_chance = 0;
    level.var_79959866.base.var_38cd3d0e.network_death_choke = 4;
    level.var_79959866.base.var_38cd3d0e.should_kill_enemies = 0;
    level.var_79959866.base.var_38cd3d0e.no_fx = 1;
    level.var_79959866.base.var_38cd3d0e.clientside_fx = 0;
    level.var_79959866.base.var_38cd3d0e.str_mod = "MOD_ELECTROCUTED";
    level.var_79959866.base.var_38cd3d0e.n_damage_max = 20000;
    level.var_79959866.base.var_38cd3d0e.var_a9255d36 = #"hash_1003dc8cc0b680f2";
    level.var_79959866.upgraded.var_38cd3d0e = lightning_chain::create_lightning_chain_params();
    zm::function_84d343d(#"ww_tesla_sniper_t8", &function_5ff12a45);
    zm::function_84d343d(#"ww_tesla_sniper_upgraded_t8", &function_5ff12a45);
    callback::on_weapon_change(&on_weapon_change);
    clientfield::register("toplayer", "" + #"hash_3aad9502fc3b54f2", 24000, 1, "int");
    clientfield::register("actor", "zm_weapons/fx8_ww_tesla_sniper_impact_lg", 24000, 1, "counter");
}

// Namespace zm_weap_tesla_sniper_t8/zm_weap_tesla_sniper_t8
// Params 12, eflags: 0x1 linked
// Checksum 0xa4305665, Offset: 0x4d8
// Size: 0xee
function function_5ff12a45(inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype) {
    b_result = self function_fd1a163d(attacker, damage, meansofdeath, weapon, shitloc);
    if (!b_result) {
        b_result = self function_de59b16a(attacker, meansofdeath, level.var_79959866.base.var_38cd3d0e, weapon);
    }
    if (!b_result) {
        return damage;
    } else {
        return 1;
    }
}

// Namespace zm_weap_tesla_sniper_t8/zm_weap_tesla_sniper_t8
// Params 1, eflags: 0x1 linked
// Checksum 0x551e8e66, Offset: 0x5d0
// Size: 0xa4
function on_weapon_change(s_params) {
    if (function_b7a6f208(s_params.weapon)) {
        self clientfield::set_to_player("" + #"hash_3aad9502fc3b54f2", 1);
    } else if (function_b7a6f208(s_params.last_weapon)) {
        self clientfield::set_to_player("" + #"hash_3aad9502fc3b54f2", 0);
    }
}

// Namespace zm_weap_tesla_sniper_t8/zm_weap_tesla_sniper_t8
// Params 4, eflags: 0x1 linked
// Checksum 0xf18e4bdd, Offset: 0x680
// Size: 0xa4
function function_de59b16a(e_source, str_mod, var_8e05c280, weapon) {
    if (isplayer(e_source) && str_mod == "MOD_RIFLE_BULLET" && !self ai::is_stunned()) {
        e_source.tesla_enemies_hit = 1;
        self thread function_9f86f360(e_source, 3, 128);
        return 1;
    }
    return 0;
}

// Namespace zm_weap_tesla_sniper_t8/zm_weap_tesla_sniper_t8
// Params 5, eflags: 0x1 linked
// Checksum 0xda1109df, Offset: 0x730
// Size: 0x1ac
function function_fd1a163d(e_source, damage, meansofdeath, weapon, shitloc) {
    if (isplayer(e_source) && (weapon == level.w_tesla_sniper_t8 || weapon == level.w_tesla_sniper_upgraded_t8) && self.archetype === #"zombie" && zm_utility::is_headshot(weapon, shitloc, meansofdeath, 1) && damage >= self.health && !self ai::is_stunned()) {
        self clientfield::increment("zm_weapons/fx8_ww_tesla_sniper_impact_lg");
        self clientfield::set("zm_aat_kill_o_watt" + "_zap", 1);
        if (self.no_gib !== 1) {
            gibserverutils::gibhead(self);
        }
        self ai::stun();
        self thread function_487ae8a7(e_source, meansofdeath, weapon, shitloc);
        level thread function_e0525d4e(self, e_source, meansofdeath, weapon, shitloc);
        return 1;
    }
    return 0;
}

// Namespace zm_weap_tesla_sniper_t8/zm_weap_tesla_sniper_t8
// Params 5, eflags: 0x1 linked
// Checksum 0x5a077e4b, Offset: 0x8e8
// Size: 0x21e
function function_e0525d4e(var_6a3758f2, e_source, meansofdeath, weapon, shitloc) {
    level endon(#"end_game");
    a_zombies = getaiteamarray(level.zombie_team);
    arrayremovevalue(a_zombies, var_6a3758f2);
    a_zombies = arraysortclosest(a_zombies, var_6a3758f2 getcentroid(), 10, 0, 256);
    foreach (zombie in a_zombies) {
        zombie clientfield::set("zm_aat_kill_o_watt" + "_zap", 1);
        zombie ai::stun();
    }
    wait(0.5);
    var_bf7a56c5 = int(ceil(a_zombies.size / 3));
    for (i = 0; i < a_zombies.size; i++) {
        if (i % var_bf7a56c5 == 0) {
            wait(1.5 / 3);
        }
        if (isdefined(a_zombies[i])) {
            a_zombies[i] function_4764da22(e_source, meansofdeath, weapon, undefined);
        }
    }
}

// Namespace zm_weap_tesla_sniper_t8/zm_weap_tesla_sniper_t8
// Params 4, eflags: 0x1 linked
// Checksum 0x22e3ab25, Offset: 0xb10
// Size: 0x8c
function function_4764da22(e_source, meansofdeath, weapon, shitloc) {
    if (isdefined(self)) {
        self dodamage(self.maxhealth + 666, self.origin, e_source, undefined, shitloc, meansofdeath, 0, weapon);
        if (self.no_gib !== 1) {
            gibserverutils::annihilate(self);
        }
    }
}

// Namespace zm_weap_tesla_sniper_t8/zm_weap_tesla_sniper_t8
// Params 4, eflags: 0x1 linked
// Checksum 0xe1cf433f, Offset: 0xba8
// Size: 0x8c
function function_487ae8a7(e_source, meansofdeath, weapon, shitloc) {
    self endon(#"death");
    level endon(#"end_game");
    wait(randomfloatrange(3.5, 4));
    if (isdefined(self)) {
        self function_4764da22(e_source, meansofdeath, weapon, shitloc);
    }
}

// Namespace zm_weap_tesla_sniper_t8/zm_weap_tesla_sniper_t8
// Params 1, eflags: 0x1 linked
// Checksum 0x56814cad, Offset: 0xc40
// Size: 0x3c
function function_b7a6f208(w_weapon) {
    return isdefined(w_weapon) && (w_weapon == level.w_tesla_sniper_t8 || w_weapon == level.w_tesla_sniper_upgraded_t8);
}

// Namespace zm_weap_tesla_sniper_t8/zm_weap_tesla_sniper_t8
// Params 3, eflags: 0x1 linked
// Checksum 0x15667e71, Offset: 0xc88
// Size: 0x140
function function_9f86f360(e_player, var_3e8e91cb, n_range) {
    if (isdefined(self.spawn_time) && gettime() == self.spawn_time) {
        waitframe(1);
    }
    if (isdefined(self)) {
        self clientfield::increment("zm_aat_kill_o_watt" + "_explosion", 1);
    }
    a_zombies = getaiteamarray(level.zombie_team);
    a_zombies = arraysortclosest(a_zombies, self getcentroid(), var_3e8e91cb, 0, n_range);
    foreach (e_zombie in a_zombies) {
        e_zombie function_bd5b7309(e_player, self);
    }
}

// Namespace zm_weap_tesla_sniper_t8/zm_weap_tesla_sniper_t8
// Params 2, eflags: 0x1 linked
// Checksum 0xb496dc1, Offset: 0xdd0
// Size: 0x154
function function_bd5b7309(player, var_fb0999c0) {
    if (!isalive(self)) {
        return;
    }
    if (isdefined(level.aat[#"zm_aat_kill_o_watt"].immune_result_indirect[self.archetype]) && level.aat[#"zm_aat_kill_o_watt"].immune_result_indirect[self.archetype]) {
        return;
    }
    if (self == var_fb0999c0 && isdefined(level.aat[#"zm_aat_kill_o_watt"].immune_result_direct[self.archetype]) && level.aat[#"zm_aat_kill_o_watt"].immune_result_direct[self.archetype]) {
        return;
    }
    if (self ai::is_stunned() || isdefined(self.var_81879441) && self.var_81879441) {
        return;
    }
    self.var_81879441 = 1;
    self thread function_5253f1fb(player);
}

// Namespace zm_weap_tesla_sniper_t8/zm_weap_tesla_sniper_t8
// Params 1, eflags: 0x1 linked
// Checksum 0xcbfa9544, Offset: 0xf30
// Size: 0xbc
function function_5253f1fb(player) {
    self endon(#"death");
    self clientfield::set("zm_aat_kill_o_watt" + "_zap", 1);
    self lightning_chain::arc_damage_ent(player, 2, level.var_79959866.base.var_38cd3d0e);
    wait(randomfloatrange(3.5, 4));
    self thread function_80fa8760();
}

// Namespace zm_weap_tesla_sniper_t8/zm_weap_tesla_sniper_t8
// Params 0, eflags: 0x1 linked
// Checksum 0x9e531dc7, Offset: 0xff8
// Size: 0x5e
function function_80fa8760() {
    if (isdefined(self.var_81879441) && self.var_81879441) {
        self.var_81879441 = undefined;
        self clientfield::set("zm_aat_kill_o_watt" + "_zap", 0);
        self notify(#"hash_1003dc8cc0b680f2");
    }
}

