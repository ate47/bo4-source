// Atian COD Tools GSC decompiler test
#using scripts\core_common\ai\systems\gib.gsc;
#using scripts\zm\zm_lightning_chain.gsc;
#using scripts\zm_common\trials\zm_trial_headshots_only.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_bgb.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace zm_bgb_pop_shocks;

// Namespace zm_bgb_pop_shocks/zm_bgb_pop_shocks
// Params 0, eflags: 0x2
// Checksum 0x7f21295e, Offset: 0xe8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_pop_shocks", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_pop_shocks/zm_bgb_pop_shocks
// Params 0, eflags: 0x1 linked
// Checksum 0xc87d4dc8, Offset: 0x138
// Size: 0xec
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_pop_shocks", "event", &event, undefined, undefined, undefined);
    bgb::register_actor_damage_override(#"zm_bgb_pop_shocks", &actor_damage_override);
    bgb::register_vehicle_damage_override(#"zm_bgb_pop_shocks", &vehicle_damage_override);
    bgb::function_1fee6b3(#"zm_bgb_pop_shocks", 31);
}

// Namespace zm_bgb_pop_shocks/zm_bgb_pop_shocks
// Params 0, eflags: 0x1 linked
// Checksum 0xc75a02f5, Offset: 0x230
// Size: 0x60
function event() {
    self endon(#"disconnect", #"death", #"bgb_update");
    self.var_727695ba = 5;
    while (self.var_727695ba > 0) {
        wait(0.1);
    }
}

// Namespace zm_bgb_pop_shocks/zm_bgb_pop_shocks
// Params 12, eflags: 0x1 linked
// Checksum 0xb760c441, Offset: 0x298
// Size: 0xd0
function actor_damage_override(inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype) {
    if (meansofdeath === "MOD_MELEE" && !zm_trial_headshots_only::is_active() && !zm_loadout::is_hero_weapon(weapon) && weapon != level.weaponnone) {
        attacker function_40383770(self);
    }
    return damage;
}

// Namespace zm_bgb_pop_shocks/zm_bgb_pop_shocks
// Params 15, eflags: 0x1 linked
// Checksum 0x9671f601, Offset: 0x370
// Size: 0xc8
function vehicle_damage_override(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal) {
    if (smeansofdeath === "MOD_MELEE" && !zm_loadout::is_hero_weapon(weapon)) {
        eattacker function_40383770(self);
    }
    return idamage;
}

// Namespace zm_bgb_pop_shocks/zm_bgb_pop_shocks
// Params 1, eflags: 0x1 linked
// Checksum 0x96dcae, Offset: 0x440
// Size: 0x1a8
function function_40383770(target) {
    if (isdefined(self.beastmode) && self.beastmode) {
        return;
    }
    self bgb::do_one_shot_use();
    self.var_727695ba = self.var_727695ba - 1;
    self bgb::set_timer(self.var_727695ba, 5);
    self playsound(#"zmb_bgb_popshocks_impact");
    zombie_list = getaiteamarray(level.zombie_team);
    foreach (ai in zombie_list) {
        if (!isdefined(ai) || !isalive(ai)) {
            continue;
        }
        test_origin = ai getcentroid();
        dist_sq = distancesquared(target.origin, test_origin);
        if (dist_sq < 16384) {
            self thread electrocute_actor(ai);
        }
    }
}

// Namespace zm_bgb_pop_shocks/zm_bgb_pop_shocks
// Params 1, eflags: 0x1 linked
// Checksum 0x554ade41, Offset: 0x5f0
// Size: 0x15a
function electrocute_actor(ai) {
    self endon(#"disconnect");
    if (!isdefined(ai) || !isalive(ai)) {
        return;
    }
    if (!isdefined(ai.var_6f84b820)) {
        return;
    }
    bhtnactionstartevent(ai, "electrocute");
    ai notify(#"bhtn_action_notify", {#action:"electrocute"});
    if (!isdefined(self.tesla_enemies_hit)) {
        self.tesla_enemies_hit = 1;
    }
    create_lightning_params();
    ai.tesla_death = 0;
    ai thread arc_damage_init(self);
    switch (ai.var_6f84b820) {
    case #"popcorn":
    case #"basic":
    case #"enhanced":
        ai thread tesla_death(self);
        return;
    }
}

// Namespace zm_bgb_pop_shocks/zm_bgb_pop_shocks
// Params 0, eflags: 0x1 linked
// Checksum 0x16c74e98, Offset: 0x758
// Size: 0x62
function create_lightning_params() {
    level.zm_bgb_pop_shocks_lightning_params = lightning_chain::create_lightning_chain_params(5);
    level.zm_bgb_pop_shocks_lightning_params.head_gib_chance = 100;
    level.zm_bgb_pop_shocks_lightning_params.network_death_choke = 4;
    level.zm_bgb_pop_shocks_lightning_params.should_kill_enemies = 0;
}

// Namespace zm_bgb_pop_shocks/zm_bgb_pop_shocks
// Params 1, eflags: 0x1 linked
// Checksum 0xee100cc6, Offset: 0x7c8
// Size: 0x5c
function arc_damage_init(player) {
    player endon(#"disconnect");
    if (self ai::is_stunned()) {
        return;
    }
    self lightning_chain::arc_damage_ent(player, 1, level.zm_bgb_pop_shocks_lightning_params);
}

// Namespace zm_bgb_pop_shocks/zm_bgb_pop_shocks
// Params 1, eflags: 0x1 linked
// Checksum 0x8c53c5d7, Offset: 0x830
// Size: 0x1c4
function tesla_death(player) {
    self endon(#"death");
    player endon(#"disconnect");
    self thread function_f724a242(1);
    wait(2);
    player zm_stats::increment_challenge_stat(#"hash_133575f669ffc55c");
    foreach (weapon in player getweaponslist()) {
        if (weapon.statname == #"bowie_knife") {
            player stats::function_e24eec31(weapon, #"hash_657e22dcdd18da77", 1);
            player stats::inc_stat(#"item_stats", weapon.name, #"hash_657e22dcdd18da77", #"statvalue", 1);
        }
    }
    self dodamage(self.health + 1, self.origin, player, undefined, undefined, "MOD_ELECTROCUTED", 0, level.weapondefault);
}

// Namespace zm_bgb_pop_shocks/zm_bgb_pop_shocks
// Params 1, eflags: 0x1 linked
// Checksum 0x8c171e23, Offset: 0xa00
// Size: 0x144
function function_f724a242(random_gibs) {
    self waittill(#"death");
    if (isdefined(self) && isactor(self)) {
        if (!random_gibs || randomint(100) < 50) {
            gibserverutils::gibhead(self);
        }
        if (!random_gibs || randomint(100) < 50) {
            gibserverutils::gibleftarm(self);
        }
        if (!random_gibs || randomint(100) < 50) {
            gibserverutils::gibrightarm(self);
        }
        if (!random_gibs || randomint(100) < 50) {
            gibserverutils::giblegs(self);
        }
    }
}

