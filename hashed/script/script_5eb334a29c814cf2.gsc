// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace namespace_ca8676a3;

// Namespace namespace_ca8676a3/namespace_ca8676a3
// Params 0, eflags: 0x2
// Checksum 0x4041b5ee, Offset: 0x110
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"hash_217942543a3e669b", &__init__, &__main__, undefined);
}

// Namespace namespace_ca8676a3/namespace_ca8676a3
// Params 0, eflags: 0x1 linked
// Checksum 0xd32c139b, Offset: 0x160
// Size: 0x7e
function __init__() {
    spawner::add_archetype_spawn_function(#"zod_companion", &function_10c92445);
    zm::function_84d343d(#"hash_680d9169c5e72bdc", &function_f1be5640);
    level.var_af29d768 = &function_80bc397d;
}

// Namespace namespace_ca8676a3/namespace_ca8676a3
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x1e8
// Size: 0x4
function __main__() {
    
}

// Namespace namespace_ca8676a3/namespace_ca8676a3
// Params 0, eflags: 0x5 linked
// Checksum 0x957bdda7, Offset: 0x1f8
// Size: 0x9c
function private function_10c92445() {
    self.ignore_nuke = 1;
    self.ignore_all_poi = 1;
    self.instakill_func = &zm_powerups::function_16c2586a;
    self.var_69bfb00a = &function_188e5077;
    self.var_594b7855 = 1;
    if (isdefined(level.var_777acf92)) {
        self thread function_65ed0370(level.var_777acf92.origin, level.var_777acf92.angles);
    }
}

// Namespace namespace_ca8676a3/namespace_ca8676a3
// Params 1, eflags: 0x5 linked
// Checksum 0xcbe69eda, Offset: 0x2a0
// Size: 0x34
function private function_188e5077(angles) {
    self thread animation::play("ai_t8_zm_mannequin_ally_stn_exposed_revive", self, angles, 1);
}

// Namespace namespace_ca8676a3/namespace_ca8676a3
// Params 2, eflags: 0x1 linked
// Checksum 0x7adc5e21, Offset: 0x2e0
// Size: 0x84
function function_65ed0370(origin, angles) {
    self endon(#"death");
    self forceteleport(origin, angles);
    self orientmode("face default");
    self animation::play("ai_t8_zm_mannequin_ally_intro");
}

// Namespace namespace_ca8676a3/namespace_ca8676a3
// Params 12, eflags: 0x1 linked
// Checksum 0x36dc1b6a, Offset: 0x370
// Size: 0x1c6
function function_f1be5640(inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype) {
    n_base_damage = self.maxhealth;
    if (isdefined(meansofdeath) && meansofdeath != "MOD_MELEE") {
        n_base_damage /= 4;
    }
    var_7e0e6341 = self ai::function_9139c839();
    if (isdefined(var_7e0e6341)) {
        var_b1c1c5cf = var_7e0e6341.damagescale;
        if (var_b1c1c5cf > 0 && var_b1c1c5cf < 1) {
            var_64cc5e50 = 1 / var_b1c1c5cf;
            n_base_damage *= var_64cc5e50;
        }
    }
    if (isdefined(self.var_6f84b820)) {
        switch (self.var_6f84b820) {
        case #"heavy":
            n_base_damage *= 0.2;
            break;
        case #"miniboss":
            n_base_damage *= 0.1;
            break;
        case #"boss":
            n_base_damage *= 0.05;
            break;
        default:
            break;
        }
    }
    return n_base_damage;
}

// Namespace namespace_ca8676a3/namespace_ca8676a3
// Params 0, eflags: 0x5 linked
// Checksum 0x5d9fd1d6, Offset: 0x540
// Size: 0x9c
function private function_80bc397d() {
    var_8f538918 = getaiarchetypearray(#"zod_companion");
    if (var_8f538918.size == 0 && (level.players.size == 1 || isdefined(self.var_20f86af4) && self.var_20f86af4)) {
        self thread zm_laststand::wait_and_revive();
        return;
    }
    self thread zm_laststand::function_3699b145();
}

