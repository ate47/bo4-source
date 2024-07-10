#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\ai\systems\gib.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace zm_perk_dying_wish;

// Namespace zm_perk_dying_wish/zm_perk_dying_wish
// Params 0, eflags: 0x2
// Checksum 0x8c455f1f, Offset: 0x1b8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_perk_dying_wish", &__init__, &__main__, undefined);
}

// Namespace zm_perk_dying_wish/zm_perk_dying_wish
// Params 0, eflags: 0x1 linked
// Checksum 0x72bdf971, Offset: 0x208
// Size: 0x14
function __init__() {
    enable_dying_wish_perk_for_level();
}

// Namespace zm_perk_dying_wish/zm_perk_dying_wish
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x228
// Size: 0x4
function __main__() {
    
}

// Namespace zm_perk_dying_wish/zm_perk_dying_wish
// Params 0, eflags: 0x1 linked
// Checksum 0xde0053d4, Offset: 0x238
// Size: 0x29c
function enable_dying_wish_perk_for_level() {
    if (function_8b1a219a()) {
        zm_perks::register_perk_basic_info(#"specialty_berserker", #"perk_dying_wish", 4000, #"hash_4f7614bf7bd645c8", getweapon("zombie_perk_bottle_dying_wish"), getweapon("zombie_perk_totem_dying_wish"), #"zmperksdyingwish");
    } else {
        zm_perks::register_perk_basic_info(#"specialty_berserker", #"perk_dying_wish", 4000, #"zombie/perk_dying_wish", getweapon("zombie_perk_bottle_dying_wish"), getweapon("zombie_perk_totem_dying_wish"), #"zmperksdyingwish");
    }
    zm_perks::register_perk_precache_func(#"specialty_berserker", &function_aa1c61e);
    zm_perks::register_perk_clientfields(#"specialty_berserker", &function_bee10d1f, &function_dbf100ee);
    zm_perks::register_perk_machine(#"specialty_berserker", &function_32b9bac, &function_536f842f);
    zm_perks::register_perk_host_migration_params(#"specialty_berserker", "p7_zm_vending_nuke", "divetonuke_light");
    zm_perks::register_perk_threads(#"specialty_berserker", &function_2aefd3c4, &function_f3862b9b, &reset_cooldown);
    zm_player::function_a827358a(&function_a102936);
    zm_perks::register_actor_damage_override(#"specialty_berserker", &function_ab41c8ab);
}

// Namespace zm_perk_dying_wish/zm_perk_dying_wish
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x4e0
// Size: 0x4
function function_536f842f() {
    
}

// Namespace zm_perk_dying_wish/zm_perk_dying_wish
// Params 0, eflags: 0x1 linked
// Checksum 0x6e03a58, Offset: 0x4f0
// Size: 0x10e
function function_aa1c61e() {
    if (isdefined(level.var_d1c19f4e)) {
        [[ level.var_d1c19f4e ]]();
        return;
    }
    level._effect[#"divetonuke_light"] = #"hash_2225287695ddf9c9";
    level.machine_assets[#"specialty_berserker"] = spawnstruct();
    level.machine_assets[#"specialty_berserker"].weapon = getweapon("zombie_perk_bottle_dying_wish");
    level.machine_assets[#"specialty_berserker"].off_model = "p7_zm_vending_nuke";
    level.machine_assets[#"specialty_berserker"].on_model = "p7_zm_vending_nuke";
}

// Namespace zm_perk_dying_wish/zm_perk_dying_wish
// Params 0, eflags: 0x1 linked
// Checksum 0x6abb156, Offset: 0x608
// Size: 0x44
function function_bee10d1f() {
    clientfield::register("allplayers", "" + #"hash_10f459edea6b3eb", 1, 1, "int");
}

// Namespace zm_perk_dying_wish/zm_perk_dying_wish
// Params 1, eflags: 0x1 linked
// Checksum 0x4b15037c, Offset: 0x658
// Size: 0xc
function function_dbf100ee(state) {
    
}

// Namespace zm_perk_dying_wish/zm_perk_dying_wish
// Params 4, eflags: 0x1 linked
// Checksum 0x7a9b208b, Offset: 0x670
// Size: 0xb6
function function_32b9bac(use_trigger, perk_machine, bump_trigger, collision) {
    use_trigger.script_sound = "mus_perks_phd_jingle";
    use_trigger.script_string = "divetonuke_perk";
    use_trigger.script_label = "mus_perks_phd_sting";
    use_trigger.target = "vending_divetonuke";
    perk_machine.script_string = "divetonuke_perk";
    perk_machine.targetname = "vending_divetonuke";
    if (isdefined(bump_trigger)) {
        bump_trigger.script_string = "divetonuke_perk";
    }
}

// Namespace zm_perk_dying_wish/zm_perk_dying_wish
// Params 0, eflags: 0x0
// Checksum 0x30624a35, Offset: 0x730
// Size: 0x32
function function_d1c19f4e() {
    level._effect[#"divetonuke_light"] = #"hash_2225287695ddf9c9";
}

// Namespace zm_perk_dying_wish/zm_perk_dying_wish
// Params 0, eflags: 0x1 linked
// Checksum 0xd1bde0c6, Offset: 0x770
// Size: 0xd2
function function_2aefd3c4() {
    self.var_95df0a1b = zm_perks::function_c1efcc57(#"specialty_berserker");
    if (isdefined(self.var_a4630f64) && self.var_a4630f64 && isdefined(self.var_95df0a1b)) {
        self zm_perks::function_2ac7579(self.var_95df0a1b, 2, #"perk_dying_wish");
    }
    if (!isdefined(self.var_a4630f64)) {
        self.var_a4630f64 = 0;
    }
    if (!isdefined(self.var_30d7498d)) {
        self.var_30d7498d = 1;
    }
    if (!isdefined(self.var_740ffad6)) {
        self.var_740ffad6 = 540;
    }
}

// Namespace zm_perk_dying_wish/zm_perk_dying_wish
// Params 4, eflags: 0x1 linked
// Checksum 0x62a23b45, Offset: 0x850
// Size: 0xd6
function function_f3862b9b(b_pause, str_perk, str_result, n_slot) {
    self notify(#"specialty_berserker" + "_take");
    if (isdefined(self.var_eb319d10) && self.var_eb319d10) {
        self function_2ca96414();
    }
    assert(isdefined(self.var_95df0a1b), "<dev string:x38>");
    if (isdefined(self.var_95df0a1b)) {
        self zm_perks::function_13880aa5(self.var_95df0a1b, 0, #"perk_dying_wish");
        self.var_95df0a1b = undefined;
    }
}

// Namespace zm_perk_dying_wish/zm_perk_dying_wish
// Params 10, eflags: 0x1 linked
// Checksum 0x503a9531, Offset: 0x930
// Size: 0xf0
function function_a102936(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime) {
    if (self hasperk(#"specialty_berserker")) {
        if (idamage >= self.health && !self.var_a4630f64 && self.var_eb319d10 !== 1) {
            self thread function_d752a094();
            return (self.health - 1);
        } else if (isdefined(self.var_eb319d10) && self.var_eb319d10) {
            return 0;
        }
    }
    return -1;
}

// Namespace zm_perk_dying_wish/zm_perk_dying_wish
// Params 1, eflags: 0x1 linked
// Checksum 0x67c1a3c6, Offset: 0xa28
// Size: 0x178
function function_eeb3bf92(var_1483b30b) {
    level endon(#"round_reset");
    self endon(#"disconnect", #"specialty_berserker" + "_take");
    n_time_left = var_1483b30b;
    self zm_perks::function_13880aa5(self.var_95df0a1b, 1, #"perk_dying_wish");
    while (n_time_left > 0) {
        wait(0.1);
        n_time_left -= 0.1;
        n_time_left = math::clamp(n_time_left, 0, var_1483b30b);
        n_percentage = n_time_left / var_1483b30b;
        n_percentage = math::clamp(n_percentage, 0.02, var_1483b30b);
        if (self hasperk(#"specialty_berserker") && isdefined(self.var_95df0a1b)) {
            self zm_perks::function_13880aa5(self.var_95df0a1b, n_percentage, #"perk_dying_wish");
        }
    }
}

// Namespace zm_perk_dying_wish/zm_perk_dying_wish
// Params 0, eflags: 0x1 linked
// Checksum 0x14dddf20, Offset: 0xba8
// Size: 0x17e
function function_d752a094() {
    self endon(#"disconnect", #"specialty_berserker" + "_take");
    self val::set(#"dying_wish", "takedamage", 0);
    self val::set(#"dying_wish", "health_regen", 0);
    self.var_eb319d10 = 1;
    self zm_perks::function_f0ac059f(self.var_95df0a1b, self.var_eb319d10, #"perk_dying_wish");
    self thread function_eeb3bf92(10);
    self clientfield::set("" + #"hash_10f459edea6b3eb", 1);
    self waittilltimeout(10, #"fake_death", #"scene_igc_shot_started");
    self function_2ca96414();
    if (self hasperk(#"specialty_mod_berserker")) {
        self.health = self.var_66cb03ad;
    }
}

// Namespace zm_perk_dying_wish/zm_perk_dying_wish
// Params 0, eflags: 0x1 linked
// Checksum 0x165e3e7b, Offset: 0xd30
// Size: 0x104
function function_2ca96414() {
    self val::reset(#"dying_wish", "takedamage");
    self val::reset(#"dying_wish", "health_regen");
    self.var_eb319d10 = undefined;
    self zm_perks::function_f0ac059f(self.var_95df0a1b, self.var_eb319d10, #"perk_dying_wish");
    self thread function_d2bbaa76(self.var_740ffad6);
    self.var_30d7498d++;
    self.var_740ffad6 += 60 * self.var_30d7498d;
    self clientfield::set("" + #"hash_10f459edea6b3eb", 0);
}

// Namespace zm_perk_dying_wish/zm_perk_dying_wish
// Params 12, eflags: 0x1 linked
// Checksum 0x76d01a40, Offset: 0xe40
// Size: 0x18e
function function_ab41c8ab(inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype) {
    if (isdefined(attacker.var_eb319d10) && attacker.var_eb319d10 && meansofdeath === "MOD_MELEE") {
        damage *= 6;
        if (!isdefined(self.var_6f84b820)) {
            return damage;
        }
        switch (self.var_6f84b820) {
        case #"popcorn":
        case #"basic":
        case #"enhanced":
            self zombie_utility::gib_random_parts();
            gibserverutils::annihilate(self);
            damage = self.health;
            break;
        case #"heavy":
        case #"miniboss":
        case #"boss":
            damage += 7000;
            break;
        }
    }
    return damage;
}

// Namespace zm_perk_dying_wish/zm_perk_dying_wish
// Params 1, eflags: 0x1 linked
// Checksum 0xb8692f0, Offset: 0xfd8
// Size: 0xcc
function function_d2bbaa76(var_85dcb56c) {
    self endon(#"hash_ed7c0dc0ca165df", #"disconnect");
    self.var_a4630f64 = 1;
    if (self hasperk(#"specialty_berserker") && isdefined(self.var_95df0a1b)) {
        self zm_perks::function_2ac7579(self.var_95df0a1b, 2, #"perk_dying_wish");
    }
    self thread function_7d72c6f9(var_85dcb56c);
    wait(var_85dcb56c);
    self thread reset_cooldown();
}

// Namespace zm_perk_dying_wish/zm_perk_dying_wish
// Params 1, eflags: 0x1 linked
// Checksum 0x8ad13f34, Offset: 0x10b0
// Size: 0x160
function function_7d72c6f9(var_85dcb56c) {
    self endon(#"disconnect", #"hash_ed7c0dc0ca165df");
    self.var_3e48c35a = var_85dcb56c;
    self zm_perks::function_13880aa5(self.var_95df0a1b, 0, #"perk_dying_wish");
    while (true) {
        wait(0.1);
        self.var_3e48c35a -= 0.1;
        self.var_3e48c35a = math::clamp(self.var_3e48c35a, 0, var_85dcb56c);
        n_percentage = 1 - self.var_3e48c35a / var_85dcb56c;
        n_percentage = math::clamp(n_percentage, 0.02, var_85dcb56c);
        if (self hasperk(#"specialty_berserker") && isdefined(self.var_95df0a1b)) {
            self zm_perks::function_13880aa5(self.var_95df0a1b, n_percentage, #"perk_dying_wish");
        }
    }
}

// Namespace zm_perk_dying_wish/zm_perk_dying_wish
// Params 0, eflags: 0x1 linked
// Checksum 0x569244f1, Offset: 0x1218
// Size: 0xdc
function reset_cooldown() {
    self notify(#"hash_ed7c0dc0ca165df");
    self.var_a4630f64 = 0;
    if (self hasperk(#"specialty_berserker")) {
        assert(isdefined(self.var_95df0a1b), "<dev string:x38>");
        if (isdefined(self.var_95df0a1b)) {
            self zm_perks::function_2ac7579(self.var_95df0a1b, 1, #"perk_dying_wish");
            self zm_perks::function_13880aa5(self.var_95df0a1b, 1, #"perk_dying_wish");
        }
    }
}

