// Atian COD Tools GSC decompiler test
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\zm_common\callbacks.gsc;
#using scripts\zm\zm_lightning_chain.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\aat_shared.gsc;

#namespace zm_aat_kill_o_watt;

// Namespace zm_aat_kill_o_watt/zm_aat_kill_o_watt
// Params 0, eflags: 0x2
// Checksum 0xb314b895, Offset: 0x128
// Size: 0x3c
function autoexec __init__system__() {
    system::register("zm_aat_kill_o_watt", &__init__, undefined, #"aat");
}

// Namespace zm_aat_kill_o_watt/zm_aat_kill_o_watt
// Params 0, eflags: 0x1 linked
// Checksum 0xf1329342, Offset: 0x170
// Size: 0x26c
function __init__() {
    if (!(isdefined(level.aat_in_use) && level.aat_in_use)) {
        return;
    }
    aat::register("zm_aat_kill_o_watt", 0.33, 0, 30, 5, 1, &result, "t7_hud_zm_aat_deadwire", "wpn_aat_dead_wire_plr", undefined, 3);
    clientfield::register("actor", "zm_aat_kill_o_watt" + "_explosion", 1, 1, "counter");
    clientfield::register("vehicle", "zm_aat_kill_o_watt" + "_explosion", 1, 1, "counter");
    clientfield::register("actor", "zm_aat_kill_o_watt" + "_zap", 1, 1, "int");
    clientfield::register("vehicle", "zm_aat_kill_o_watt" + "_zap", 1, 1, "int");
    level.var_7fe61e7a = lightning_chain::create_lightning_chain_params(6, 7, 160);
    level.var_7fe61e7a.head_gib_chance = 0;
    level.var_7fe61e7a.network_death_choke = 4;
    level.var_7fe61e7a.should_kill_enemies = 0;
    level.var_7fe61e7a.challenge_stat_name = #"zombie_hunter_kill_o_watt";
    level.var_7fe61e7a.no_fx = 1;
    level.var_7fe61e7a.clientside_fx = 0;
    level.var_7fe61e7a.str_mod = "MOD_AAT";
    level.var_7fe61e7a.n_damage_max = 20000;
    level.var_7fe61e7a.var_a9255d36 = #"hash_1003dc8cc0b680f2";
    callback::function_4b58e5ab(&function_439d6573);
}

// Namespace zm_aat_kill_o_watt/zm_aat_kill_o_watt
// Params 4, eflags: 0x1 linked
// Checksum 0xef8d2d17, Offset: 0x3e8
// Size: 0x9c
function result(death, attacker, mod, weapon) {
    if (!isdefined(zombie_utility::function_d2dfacfd(#"tesla_head_gib_chance"))) {
        zombie_utility::set_zombie_var(#"tesla_head_gib_chance", 50);
    }
    level.var_7fe61e7a.weapon = weapon;
    self thread function_1d0f645d(attacker);
}

// Namespace zm_aat_kill_o_watt/zm_aat_kill_o_watt
// Params 1, eflags: 0x1 linked
// Checksum 0xc97e3935, Offset: 0x490
// Size: 0x130
function function_1d0f645d(player) {
    if (isdefined(self.spawn_time) && gettime() == self.spawn_time) {
        waitframe(1);
    }
    if (isdefined(self)) {
        self clientfield::increment("zm_aat_kill_o_watt" + "_explosion", 1);
    }
    a_zombies = getaiteamarray(level.zombie_team);
    a_zombies = arraysortclosest(a_zombies, self getcentroid(), 6, 0, 160);
    foreach (e_zombie in a_zombies) {
        e_zombie function_3c98a3f4(player, self);
    }
}

// Namespace zm_aat_kill_o_watt/zm_aat_kill_o_watt
// Params 2, eflags: 0x1 linked
// Checksum 0x32ff1105, Offset: 0x5c8
// Size: 0x154
function function_3c98a3f4(player, var_fb0999c0) {
    if (!isalive(self)) {
        return;
    }
    if (isdefined(level.aat[#"zm_aat_kill_o_watt"].immune_result_indirect[self.archetype]) && level.aat[#"zm_aat_kill_o_watt"].immune_result_indirect[self.archetype]) {
        return;
    }
    if (self == var_fb0999c0 && isdefined(level.aat[#"zm_aat_kill_o_watt"].immune_result_direct[self.archetype]) && level.aat[#"zm_aat_kill_o_watt"].immune_result_direct[self.archetype]) {
        return;
    }
    if (self ai::is_stunned() || isdefined(self.var_661d1e79) && self.var_661d1e79) {
        return;
    }
    self.var_661d1e79 = 1;
    self thread function_fbd6ea47(player);
}

// Namespace zm_aat_kill_o_watt/zm_aat_kill_o_watt
// Params 1, eflags: 0x1 linked
// Checksum 0x2eff0815, Offset: 0x728
// Size: 0x8c
function function_fbd6ea47(player) {
    self endon(#"death");
    self clientfield::set("zm_aat_kill_o_watt" + "_zap", 1);
    self lightning_chain::arc_damage_ent(player, 2, level.var_7fe61e7a);
    wait(6);
    self thread function_439d6573();
}

// Namespace zm_aat_kill_o_watt/zm_aat_kill_o_watt
// Params 0, eflags: 0x1 linked
// Checksum 0xbaf18d3d, Offset: 0x7c0
// Size: 0x5e
function function_439d6573() {
    if (isdefined(self.var_661d1e79) && self.var_661d1e79) {
        self.var_661d1e79 = 0;
        self clientfield::set("zm_aat_kill_o_watt" + "_zap", 0);
        self notify(#"hash_1003dc8cc0b680f2");
    }
}

