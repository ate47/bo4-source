// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_challenges.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace zm_perk_mod_electric_cherry;

// Namespace zm_perk_mod_electric_cherry/zm_perk_mod_electric_cherry
// Params 0, eflags: 0x2
// Checksum 0x745f7b76, Offset: 0x158
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_perk_mod_electric_cherry", &__init__, undefined, undefined);
}

// Namespace zm_perk_mod_electric_cherry/zm_perk_mod_electric_cherry
// Params 0, eflags: 0x1 linked
// Checksum 0xb0c3de43, Offset: 0x1a0
// Size: 0x14
function __init__() {
    function_82ad2d27();
}

// Namespace zm_perk_mod_electric_cherry/zm_perk_mod_electric_cherry
// Params 0, eflags: 0x1 linked
// Checksum 0xe850ed6d, Offset: 0x1c0
// Size: 0xd4
function function_82ad2d27() {
    zm_perks::register_perk_mod_basic_info(#"specialty_mod_electriccherry", "mod_electric_cherry", #"perk_electric_cherry", #"specialty_electriccherry", 4000);
    zm_perks::register_perk_threads(#"specialty_mod_electriccherry", &function_4b44aa37, &function_cfba6046, &function_b107ce52);
    zm_perks::register_actor_damage_override(#"specialty_mod_electriccherry", &function_f6515ba2);
}

// Namespace zm_perk_mod_electric_cherry/zm_perk_mod_electric_cherry
// Params 0, eflags: 0x1 linked
// Checksum 0x81929265, Offset: 0x2a0
// Size: 0xec
function electric_cherry_death_fx() {
    self endon(#"death");
    if (!(isdefined(self.head_gibbed) && self.head_gibbed)) {
        if (isvehicle(self)) {
            self clientfield::set("tesla_shock_eyes_fx_veh", 1);
        } else {
            self clientfield::set("tesla_shock_eyes_fx", 1);
        }
        return;
    }
    if (isvehicle(self)) {
        self clientfield::set("tesla_death_fx_veh", 1);
        return;
    }
    self clientfield::set("tesla_death_fx", 1);
}

// Namespace zm_perk_mod_electric_cherry/zm_perk_mod_electric_cherry
// Params 0, eflags: 0x1 linked
// Checksum 0xf4461248, Offset: 0x398
// Size: 0xdc
function electric_cherry_shock_fx() {
    self endon(#"death");
    if (isvehicle(self)) {
        self clientfield::set("tesla_shock_eyes_fx_veh", 1);
    } else {
        self clientfield::set("tesla_shock_eyes_fx", 1);
    }
    self waittill(#"stun_fx_end");
    if (isvehicle(self)) {
        self clientfield::set("tesla_shock_eyes_fx_veh", 0);
        return;
    }
    self clientfield::set("tesla_shock_eyes_fx", 0);
}

// Namespace zm_perk_mod_electric_cherry/zm_perk_mod_electric_cherry
// Params 0, eflags: 0x1 linked
// Checksum 0x3792eb6d, Offset: 0x480
// Size: 0x10e
function electric_cherry_stun() {
    self endon(#"death");
    self notify(#"stun_zombie");
    self endon(#"stun_zombie");
    if (self.health <= 0) {
        /#
            iprintln("<unknown string>");
        #/
        return;
    }
    self ai::stun();
    self val::set(#"electric_cherry_stun", "ignoreall", 1);
    wait(4);
    if (isdefined(self)) {
        self ai::clear_stun();
        self val::reset(#"electric_cherry_stun", "ignoreall");
        self notify(#"stun_fx_end");
    }
}

// Namespace zm_perk_mod_electric_cherry/zm_perk_mod_electric_cherry
// Params 0, eflags: 0x1 linked
// Checksum 0x547b102a, Offset: 0x598
// Size: 0x13a
function electric_cherry_reload_attack() {
    self endon(#"death", #"specialty_mod_electriccherry" + "_take");
    self.consecutive_electric_cherry_attacks = 0;
    self.var_c25a91ee = 0;
    if (!isdefined(self.var_dbaad7dd)) {
        self.var_dbaad7dd = 10;
    }
    self function_4debd1a8();
    while (true) {
        s_results = self waittill(#"reload_start");
        w_current = self getcurrentweapon();
        n_clip_current = self getweaponammoclip(w_current);
        n_clip_max = w_current.clipsize;
        self thread check_for_reload_complete(w_current, n_clip_current, n_clip_max);
        if (isdefined(self)) {
            self notify(#"hash_54480fc7f7e6f243");
        }
    }
}

// Namespace zm_perk_mod_electric_cherry/zm_perk_mod_electric_cherry
// Params 3, eflags: 0x1 linked
// Checksum 0x1464b2fc, Offset: 0x6e0
// Size: 0xd4
function check_for_reload_complete(weapon, n_clip_current, n_clip_max) {
    self endon(#"death", #"specialty_mod_electriccherry" + "_take", "player_lost_weapon_" + weapon.name);
    while (true) {
        self waittill(#"reload");
        current_weapon = self getcurrentweapon();
        if (current_weapon == weapon && !weapon.isabilityweapon) {
            self thread function_97a7641d(weapon, n_clip_current, n_clip_max);
            break;
        }
    }
}

// Namespace zm_perk_mod_electric_cherry/zm_perk_mod_electric_cherry
// Params 12, eflags: 0x1 linked
// Checksum 0x4fd35a39, Offset: 0x7c0
// Size: 0x1fe
function function_f6515ba2(inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype) {
    if (meansofdeath == "MOD_MELEE" && attacker.var_dbaad7dd > 0) {
        if (!attacker.var_c25a91ee) {
            attacker thread function_81622feb();
        }
        var_5a8c565a = damage * 3;
        if (self.archetype === #"zombie" || self.archetype === #"catalyst") {
            self thread electric_cherry_death_fx();
            /#
                attacker zm_challenges::debug_print("<unknown string>");
            #/
            attacker zm_stats::increment_challenge_stat(#"perk_electric_cherry_kills");
            return self.health;
        } else if (self.health <= var_5a8c565a) {
            self thread electric_cherry_death_fx();
            /#
                attacker zm_challenges::debug_print("<unknown string>");
            #/
            attacker zm_stats::increment_challenge_stat(#"perk_electric_cherry_kills");
            return var_5a8c565a;
        } else {
            self thread electric_cherry_stun();
            self thread electric_cherry_shock_fx();
            return var_5a8c565a;
        }
    }
    return damage;
}

// Namespace zm_perk_mod_electric_cherry/zm_perk_mod_electric_cherry
// Params 3, eflags: 0x1 linked
// Checksum 0xa07f3206, Offset: 0x9c8
// Size: 0x8c
function function_97a7641d(w_current, n_clip_current, n_clip_max) {
    n_fraction = n_clip_current / n_clip_max;
    if (n_fraction == 0) {
        n_time = 10;
    } else {
        n_time = 10 - n_fraction * 10;
    }
    if (n_time < 2) {
        return;
    }
    self thread function_a2ba8a6c(n_time);
}

// Namespace zm_perk_mod_electric_cherry/zm_perk_mod_electric_cherry
// Params 1, eflags: 0x1 linked
// Checksum 0x695b6288, Offset: 0xa60
// Size: 0x3c
function function_a2ba8a6c(n_time) {
    if (self.var_dbaad7dd < n_time) {
        self.var_dbaad7dd = n_time;
        self function_4debd1a8();
    }
}

// Namespace zm_perk_mod_electric_cherry/zm_perk_mod_electric_cherry
// Params 0, eflags: 0x1 linked
// Checksum 0x8246d225, Offset: 0xaa8
// Size: 0x94
function function_4debd1a8() {
    self zm_perks::function_c8c7bc5(3, self.var_dbaad7dd > 0, #"perk_electric_cherry");
    n_counter = math::clamp(self.var_dbaad7dd, 0, 10);
    n_counter /= 10;
    self zm_perks::function_13880aa5(3, n_counter, #"perk_electric_cherry");
}

// Namespace zm_perk_mod_electric_cherry/zm_perk_mod_electric_cherry
// Params 0, eflags: 0x1 linked
// Checksum 0x74fb91b4, Offset: 0xb48
// Size: 0xec
function function_81622feb() {
    self notify(#"hash_2e9b55fc4344af57");
    self endon(#"disconnect", #"hash_2e9b55fc4344af57");
    self thread function_857ced89();
    wait(self.var_dbaad7dd);
    self playsoundtoplayer(#"hash_ea37a7d6cf6bfb3", self);
    self notify(#"hash_5435513976a87bce");
    self.var_c25a91ee = 0;
    self zm_perks::function_c8c7bc5(3, 0, #"perk_electric_cherry");
    self.var_dbaad7dd = 0;
    self zm_perks::function_13880aa5(3, 0, #"perk_electric_cherry");
}

// Namespace zm_perk_mod_electric_cherry/zm_perk_mod_electric_cherry
// Params 0, eflags: 0x1 linked
// Checksum 0x1adc3ef5, Offset: 0xc40
// Size: 0x44
function function_4b44aa37() {
    self zm_perks::function_f0ac059f(3, 1, #"perk_electric_cherry");
    self thread electric_cherry_reload_attack();
}

// Namespace zm_perk_mod_electric_cherry/zm_perk_mod_electric_cherry
// Params 0, eflags: 0x1 linked
// Checksum 0xf74d5fe7, Offset: 0xc90
// Size: 0x190
function function_857ced89() {
    self endon(#"disconnect", #"hash_1549266f638bd78f", #"hash_5435513976a87bce", #"hash_2e9b55fc4344af57");
    self.var_c25a91ee = 1;
    self playsoundtoplayer(#"hash_2283cbfbc6b9e736", self);
    var_9ade76c0 = self.var_dbaad7dd;
    n_time_left = var_9ade76c0;
    var_8b3ae2d6 = var_9ade76c0 / 10;
    self zm_perks::function_13880aa5(3, var_8b3ae2d6, #"perk_electric_cherry");
    while (true) {
        wait(0.1);
        n_time_left -= 0.1;
        n_time_left = math::clamp(n_time_left, 0, var_9ade76c0);
        n_percentage = n_time_left / var_9ade76c0;
        n_percentage *= var_8b3ae2d6;
        n_percentage = math::clamp(n_percentage, 0.02, var_9ade76c0);
        self zm_perks::function_13880aa5(3, n_percentage, #"perk_electric_cherry");
    }
}

// Namespace zm_perk_mod_electric_cherry/zm_perk_mod_electric_cherry
// Params 0, eflags: 0x1 linked
// Checksum 0xca13cd5c, Offset: 0xe28
// Size: 0x64
function function_b107ce52() {
    if (!isdefined(self.var_dbaad7dd)) {
        self.var_dbaad7dd = 0;
    }
    self function_a2ba8a6c(10);
    if (isdefined(self.var_c25a91ee) && self.var_c25a91ee) {
        self thread function_81622feb();
    }
}

// Namespace zm_perk_mod_electric_cherry/zm_perk_mod_electric_cherry
// Params 4, eflags: 0x1 linked
// Checksum 0x44f40a33, Offset: 0xe98
// Size: 0xc4
function function_cfba6046(b_pause, str_perk, str_result, n_slot) {
    self notify(#"specialty_mod_electriccherry" + "_take");
    self.var_c25a91ee = undefined;
    self zm_perks::function_c8c7bc5(3, 0, #"perk_electric_cherry");
    self zm_perks::function_f0ac059f(3, 0, #"perk_electric_cherry");
    self zm_perks::function_13880aa5(3, 0, #"perk_electric_cherry");
}

