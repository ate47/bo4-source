// Atian COD Tools GSC decompiler test
#include script_1f0e83e43bf9c3b9;
#include scripts/core_common/ai/archetype_nosferatu.gsc;
#include scripts/zm_common/zm_customgame.gsc;
#include scripts/zm_common/zm_cleanup_mgr.gsc;
#include scripts/zm/powerup/zm_powerup_nuke.gsc;
#include scripts/zm_common/ai/zm_ai_utility.gsc;
#include scripts/zm_common/zm_round_spawning.gsc;
#include scripts/zm_common/zm_utility.gsc;
#include scripts/zm_common/zm_unitrigger.gsc;
#include scripts/zm_common/zm_transformation.gsc;
#include scripts/zm_common/zm_spawner.gsc;
#include scripts/zm_common/zm_score.gsc;
#include scripts/zm_common/zm_powerups.gsc;
#include scripts/zm_common/zm_pack_a_punch_util.gsc;
#include scripts/zm_common/zm_pack_a_punch.gsc;
#include scripts/zm_common/zm_loadout.gsc;
#include scripts/zm_common/zm_hero_weapon.gsc;
#include scripts/zm_common/zm_devgui.gsc;
#include scripts/zm_common/zm_behavior.gsc;
#include scripts/zm_common/zm_audio.gsc;
#include scripts/core_common/values_shared.gsc;
#include scripts/core_common/struct.gsc;
#include scripts/core_common/status_effects/status_effect_util.gsc;
#include scripts/core_common/ai/systems/behavior_state_machine.gsc;
#include scripts/core_common/ai/zombie.gsc;
#include scripts/core_common/ai/zombie_utility.gsc;
#include scripts/core_common/ai/systems/destructible_character.gsc;
#include scripts/core_common/ai/systems/ai_interface.gsc;
#include scripts/core_common/ai/archetype_mocomps_utility.gsc;
#include scripts/core_common/ai/systems/gib.gsc;
#include scripts/core_common/ai/systems/debug.gsc;
#include scripts/core_common/ai/systems/ai_blackboard.gsc;
#include scripts/core_common/ai/systems/blackboard.gsc;
#include scripts/core_common/ai/systems/behavior_tree_utility.gsc;
#include scripts/core_common/ai/archetype_locomotion_utility.gsc;
#include script_3819e7a1427df6d2;
#include scripts/core_common/ai/archetype_utility.gsc;
#include scripts/core_common/ai/systems/animation_state_machine_mocomp.gsc;
#include scripts/core_common/ai/systems/animation_state_machine_utility.gsc;
#include scripts/core_common/ai/systems/animation_state_machine_notetracks.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/trigger_shared.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/spawner_shared.gsc;
#include scripts/core_common/scene_shared.gsc;
#include scripts/core_common/flagsys_shared.gsc;
#include scripts/core_common/flag_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;
#include scripts/core_common/array_shared.gsc;
#include scripts/core_common/ai_shared.gsc;
#include scripts/core_common/aat_shared.gsc;

#namespace zm_ai_nosferatu;

// Namespace zm_ai_nosferatu/zm_ai_nosferatu
// Params 0, eflags: 0x2
// Checksum 0xb7237b8b, Offset: 0x410
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_ai_nosferatu", &__init__, &__main__, undefined);
}

// Namespace zm_ai_nosferatu/zm_ai_nosferatu
// Params 0, eflags: 0x1 linked
// Checksum 0xff33d7c0, Offset: 0x460
// Size: 0x33c
function __init__() {
    registerbehaviorscriptfunctions();
    init();
    level.nosferatu_spawn_func = &function_6502a84d;
    spawner::add_archetype_spawn_function(#"nosferatu", &function_c12f7b53);
    zm_cleanup::function_cdf5a512(#"nosferatu", &function_4c71848e);
    callback::on_player_damage(&function_8dc028ba);
    clientfield::register("toplayer", "nosferatu_damage_fx", 8000, 1, "counter");
    clientfield::register("actor", "nosferatu_spawn_fx", 8000, 1, "counter");
    clientfield::register("actor", "nfrtu_silver_hit_fx", 8000, 1, "counter");
    clientfield::register("actor", "summon_nfrtu", 8000, 1, "int");
    clientfield::register("actor", "nfrtu_move_dash", 8000, 1, "int");
    zm_score::function_e5d6e6dd(#"nosferatu", 60);
    zm_score::function_e5d6e6dd(#"crimson_nosferatu", 80);
    zm_round_spawning::register_archetype(#"nosferatu", &function_cf877849, &round_spawn, &function_74f25f8a, 25);
    zm_round_spawning::register_archetype(#"crimson_nosferatu", &function_97f1f86e, &function_a8a8c2fb, undefined, 100);
    zm_round_spawning::function_306ce518(#"crimson_nosferatu", &function_57abef39);
    level.var_243137e = getentarray("zombie_nosferatu_spawner", "script_noteworthy");
    level.var_13bc407f = getentarray("zombie_crimson_nosferatu_spawner", "script_noteworthy");
    /#
        zm_devgui::function_c7dd7a17("<unknown string>");
    #/
}

// Namespace zm_ai_nosferatu/zm_ai_nosferatu
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x7a8
// Size: 0x4
function __main__() {
    
}

// Namespace zm_ai_nosferatu/zm_ai_nosferatu
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x7b8
// Size: 0x4
function init() {
    
}

// Namespace zm_ai_nosferatu/zm_ai_nosferatu
// Params 0, eflags: 0x5 linked
// Checksum 0x3ebfe253, Offset: 0x7c8
// Size: 0x3f4
function private registerbehaviorscriptfunctions() {
    /#
        assert(isscriptfunctionptr(&function_7d874447));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_3a6e15c62c2e1958", &function_7d874447);
    /#
        assert(isscriptfunctionptr(&function_7fef620b));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_258bd98449804a29", &function_7fef620b);
    /#
        assert(isscriptfunctionptr(&function_82785646));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_50f7728355042178", &function_82785646);
    /#
        assert(isscriptfunctionptr(&nosferatustunstart));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"nosferatustunstart", &nosferatustunstart);
    /#
        assert(isscriptfunctionptr(&nosferatushouldstun));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"nosferatushouldstun", &nosferatushouldstun);
    /#
        assert(isscriptfunctionptr(&function_81c78981));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"hash_3a2582998db5774b", &function_81c78981);
    /#
        assert(isscriptfunctionptr(&function_475a698c));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"hash_3c518f78c393482e", &function_475a698c);
    /#
        assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
    #/
    /#
        assert(!isdefined(&function_344a0412) || isscriptfunctionptr(&function_344a0412));
    #/
    /#
        assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
    #/
    behaviortreenetworkutility::registerbehaviortreeaction(#"hash_4a2ea3c9e174122a", undefined, &function_344a0412, undefined);
    animationstatenetwork::registernotetrackhandlerfunction("summon_nfrtu", &function_76d6482e);
}

// Namespace zm_ai_nosferatu/zm_ai_nosferatu
// Params 1, eflags: 0x1 linked
// Checksum 0x2392a03b, Offset: 0xbc8
// Size: 0x48
function nosferatushouldstun(entity) {
    if (zm_behavior::zombieshouldstun(entity) && function_e060c994(entity)) {
        return 1;
    }
    return 0;
}

// Namespace zm_ai_nosferatu/zm_ai_nosferatu
// Params 1, eflags: 0x5 linked
// Checksum 0x8f581bb9, Offset: 0xc18
// Size: 0xbc
function private function_e060c994(entity) {
    var_7a69f7e9 = blackboard::getblackboardevents("nfrtu_stun");
    if (isdefined(var_7a69f7e9) && var_7a69f7e9.size) {
        foreach (event in var_7a69f7e9) {
            if (event.nosferatu === entity) {
                return 0;
            }
        }
    }
    return 1;
}

// Namespace zm_ai_nosferatu/zm_ai_nosferatu
// Params 1, eflags: 0x1 linked
// Checksum 0x30020034, Offset: 0xce0
// Size: 0x84
function nosferatustunstart(entity) {
    zm_behavior::zombiestunstart(entity);
    var_268f1415 = spawnstruct();
    var_268f1415.nosferatu = entity;
    blackboard::addblackboardevent("nfrtu_stun", var_268f1415, randomintrange(10000, 12000));
}

// Namespace zm_ai_nosferatu/zm_ai_nosferatu
// Params 2, eflags: 0x5 linked
// Checksum 0x34b7a55d, Offset: 0xd70
// Size: 0x38
function private function_344a0412(entity, asmstatename) {
    if (entity ai::is_stunned()) {
        return 5;
    }
    return 4;
}

// Namespace zm_ai_nosferatu/zm_ai_nosferatu
// Params 1, eflags: 0x1 linked
// Checksum 0x73f566a0, Offset: 0xdb0
// Size: 0x30
function function_81c78981(entity) {
    entity clientfield::set("nfrtu_move_dash", 1);
    return 1;
}

// Namespace zm_ai_nosferatu/zm_ai_nosferatu
// Params 1, eflags: 0x1 linked
// Checksum 0x1b2cee8a, Offset: 0xde8
// Size: 0x30
function function_475a698c(entity) {
    entity clientfield::set("nfrtu_move_dash", 0);
    return 1;
}

// Namespace zm_ai_nosferatu/zm_ai_nosferatu
// Params 0, eflags: 0x5 linked
// Checksum 0x26770570, Offset: 0xe20
// Size: 0x2d4
function private function_c12f7b53() {
    self.zombie_move_speed = "sprint";
    self setblackboardattribute("_locomotion_speed", "locomotion_speed_sprint");
    self.completed_emerging_into_playable_area = 1;
    self.ignorepathenemyfightdist = 1;
    var_eb297ead = zm_ai_utility::function_8d44707e(0);
    var_eb297ead = var_eb297ead * (isdefined(level.var_1eb98fb1) ? level.var_1eb98fb1 : 1);
    self.health = int(var_eb297ead);
    self.maxhealth = int(var_eb297ead);
    self.is_zombie = 1;
    self.var_fad2bca9 = 1;
    self.var_ccb2e201 = 0;
    if (self.var_9fde8624 === #"crimson_nosferatu") {
        self.var_dd6fe31f = 1;
        self.var_f46fbf3f = 1;
        self.var_126d7bef = 1;
        self.instakill_func = &zm_powerups::function_16c2586a;
        self zm_powerup_nuke::function_9a79647b(0.5);
    } else {
        self.var_2f68be48 = 1;
    }
    self.ai.var_9465ce93 = gettime() + randomintrange(4500, 5500);
    aiutility::addaioverridedamagecallback(self, &function_a13721f);
    self callback::function_d8abfc3d(#"on_ai_killed", &function_8a2cb5ed);
    self zm_score::function_82732ced();
    self thread zm_audio::play_ambient_zombie_vocals();
    self thread zm_audio::zmbaivox_notifyconvert();
    self.var_b467f3a1 = &function_201862b;
    self.deathfunction = &zm_spawner::zombie_death_animscript;
    level thread zm_spawner::zombie_death_event(self);
    self.var_2e5407fc = gettime() + int(self ai::function_9139c839().var_e61d73b0 * 1000);
    /#
        self thread function_cd801084();
    #/
}

// Namespace zm_ai_nosferatu/zm_ai_nosferatu
// Params 1, eflags: 0x5 linked
// Checksum 0x91740224, Offset: 0x1100
// Size: 0x17c
function private function_8a2cb5ed(params) {
    if (self.archetype === #"nosferatu") {
        attackerdistance = 0;
        isexplosive = 0;
        iscloseexplosive = 0;
        if (isdefined(params.eattacker) && isdefined(params.smeansofdeath) && isdefined(params.einflictor)) {
            attackerdistance = distancesquared(params.eattacker.origin, self.origin);
            isexplosive = isinarray(array("MOD_CRUSH", "MOD_GRENADE", "MOD_GRENADE_SPLASH", "MOD_PROJECTILE", "MOD_PROJECTILE_SPLASH", "MOD_EXPLOSIVE"), params.smeansofdeath);
            iscloseexplosive = distancesquared(params.einflictor.origin, self.origin) <= 300 * 300;
            if (isexplosive && iscloseexplosive) {
                gibserverutils::annihilate(self);
            }
        }
    }
}

// Namespace zm_ai_nosferatu/zm_ai_nosferatu
// Params 12, eflags: 0x5 linked
// Checksum 0xe0dd5dfd, Offset: 0x1288
// Size: 0x128
function private function_a13721f(inflictor, attacker, damage, idflags, meansofdeath, weapon, point, dir, hitloc, offsettime, boneindex, modelindex) {
    if (isdefined(attacker) && self === attacker) {
        damage = 0;
    }
    if (isdefined(attacker) && isplayer(attacker) && isdefined(weapon) && attacker zm_utility::function_aa45670f(weapon, 0)) {
        if (gettime() >= self.ai.var_9465ce93) {
            self.ai.var_9465ce93 = gettime() + randomintrange(4500, 5500);
            self clientfield::increment("nfrtu_silver_hit_fx");
        }
    }
    return damage;
}

// Namespace zm_ai_nosferatu/zm_ai_nosferatu
// Params 0, eflags: 0x4
// Checksum 0x761650b3, Offset: 0x13b8
// Size: 0x3a
function private function_cd801084() {
    self endon(#"death");
    while (1) {
        if (isdefined(self.pathgoalpos)) {
            /#
            #/
        }
        waitframe(1);
    }
}

// Namespace zm_ai_nosferatu/zm_ai_nosferatu
// Params 0, eflags: 0x5 linked
// Checksum 0x6a652b0e, Offset: 0x1400
// Size: 0x24
function private function_2b35beda() {
    self clientfield::increment_to_player("nosferatu_damage_fx");
}

// Namespace zm_ai_nosferatu/zm_ai_nosferatu
// Params 0, eflags: 0x5 linked
// Checksum 0x969d8643, Offset: 0x1430
// Size: 0x12
function private function_c59b482e() {
    self.health = self.maxhealth;
}

// Namespace zm_ai_nosferatu/zm_ai_nosferatu
// Params 1, eflags: 0x5 linked
// Checksum 0xea8cf80b, Offset: 0x1450
// Size: 0x4c
function private function_c9a2941c(notifyhash) {
    if (isdefined(self) && isdefined(self.heal)) {
        self val::reset(#"nosferatu", "health_regen");
    }
}

// Namespace zm_ai_nosferatu/zm_ai_nosferatu
// Params 0, eflags: 0x5 linked
// Checksum 0xf18d478e, Offset: 0x14a8
// Size: 0xc6
function private function_e05b2c36() {
    self notify("1aeb0156174acfac");
    self endon("1aeb0156174acfac");
    self endoncallback(&function_c9a2941c, #"death");
    self.b_nosferatu_damage_fx = 1;
    self val::set(#"nosferatu", "health_regen", 0);
    wait(self.var_cd35302f);
    self val::reset(#"nosferatu", "health_regen");
    waitframe(5);
    self.var_cd35302f = undefined;
    self.b_nosferatu_damage_fx = 0;
}

// Namespace zm_ai_nosferatu/zm_ai_nosferatu
// Params 1, eflags: 0x1 linked
// Checksum 0x1ebf3910, Offset: 0x1578
// Size: 0x13c
function function_8dc028ba(s_params) {
    attacker = s_params.eattacker;
    if (isdefined(attacker) && isdefined(attacker.archetype) && attacker.archetype == #"nosferatu" && s_params.idamage > 0) {
        self function_2b35beda();
        attacker function_c59b482e();
        if (zm_custom::function_901b751c(#"zmhealthregenrate") == 2 && zm_custom::function_901b751c(#"zmhealthregendelay") == 1) {
            self.var_cd35302f = attacker ai::function_9139c839().var_52a41524 + 1.1;
            self thread function_e05b2c36();
        }
    }
}

// Namespace zm_ai_nosferatu/zm_ai_nosferatu
// Params 1, eflags: 0x1 linked
// Checksum 0xe0b388ab, Offset: 0x16c0
// Size: 0x10a
function function_cf877849(var_dbce0c44) {
    if (isdefined(level.var_5e45f817) && level.var_5e45f817) {
        return 0;
    }
    var_f1f220b9 = 1;
    if (level.round_number >= 15) {
        var_f1f220b9 = 3;
    } else if (level.round_number >= 10) {
        var_f1f220b9 = 2;
    }
    var_a87aeae6 = 30;
    var_a1737466 = randomfloatrange(0.02, 0.03);
    n_spawn = max(var_f1f220b9, int(level.zombie_total * var_a1737466));
    return min(var_a87aeae6, n_spawn);
}

// Namespace zm_ai_nosferatu/zm_ai_nosferatu
// Params 1, eflags: 0x1 linked
// Checksum 0xca9a9a4b, Offset: 0x17d8
// Size: 0x9a
function function_57abef39(n_round_number) {
    level endon(#"end_game");
    while (1) {
        level waittill(#"hash_5d3012139f083ccb");
        if (zm_round_spawning::function_d0db51fc(#"crimson_nosferatu")) {
            level.var_da92f51a = level.round_number + function_21a3a673(2, 3);
        }
    }
}

// Namespace zm_ai_nosferatu/zm_ai_nosferatu
// Params 1, eflags: 0x1 linked
// Checksum 0x93c38741, Offset: 0x1880
// Size: 0xca
function function_97f1f86e(var_dbce0c44) {
    if (isdefined(level.var_da92f51a) && level.round_number < level.var_da92f51a || isdefined(level.var_5e45f817) && level.var_5e45f817) {
        return 0;
    }
    var_a87aeae6 = 20;
    var_a1737466 = randomfloatrange(0.01, 0.02);
    return min(var_a87aeae6, int(level.zombie_total * var_a1737466));
}

// Namespace zm_ai_nosferatu/zm_ai_nosferatu
// Params 0, eflags: 0x1 linked
// Checksum 0x625efdac, Offset: 0x1958
// Size: 0x3c
function round_spawn() {
    ai = function_74f25f8a();
    if (isdefined(ai)) {
        level.zombie_total--;
        return 1;
    }
    return 0;
}

// Namespace zm_ai_nosferatu/zm_ai_nosferatu
// Params 0, eflags: 0x1 linked
// Checksum 0x741192af, Offset: 0x19a0
// Size: 0x44
function function_a8a8c2fb() {
    ai = function_74f25f8a(0, undefined, 1);
    if (isdefined(ai)) {
        level.zombie_total--;
        return 1;
    }
    return 0;
}

// Namespace zm_ai_nosferatu/zm_ai_nosferatu
// Params 4, eflags: 0x1 linked
// Checksum 0x8a68dceb, Offset: 0x19f0
// Size: 0x248
function function_74f25f8a(b_force_spawn = 0, var_eb3a8721, b_crimson = 0, round_number) {
    if (!b_force_spawn && !function_1c0cad2c()) {
        return undefined;
    }
    players = getplayers();
    if (isdefined(var_eb3a8721)) {
        s_spawn_loc = var_eb3a8721;
    } else if (isdefined(level.nosferatu_spawn_func)) {
        s_spawn_loc = [[ level.nosferatu_spawn_func ]]();
    } else if (level.zm_loc_types[#"nosferatu_location"].size > 0) {
        s_spawn_loc = array::random(level.zm_loc_types[#"nosferatu_location"]);
    }
    if (!isdefined(s_spawn_loc)) {
        return undefined;
    }
    if (b_crimson) {
        e_spawner = level.var_13bc407f[0];
    } else {
        e_spawner = level.var_243137e[0];
    }
    ai = zombie_utility::spawn_zombie(e_spawner, undefined, undefined, round_number);
    if (isdefined(ai)) {
        ai.check_point_in_enabled_zone = &zm_utility::check_point_in_playable_area;
        ai thread zombie_utility::round_spawn_failsafe();
        ai forceteleport(s_spawn_loc.origin, s_spawn_loc.angles);
        if (isdefined(level.var_ae4acb3f)) {
            ai thread [[ level.var_ae4acb3f ]](s_spawn_loc);
        }
        var_46d2ec35 = get_favorite_enemy();
        if (isdefined(var_46d2ec35)) {
            ai.favoriteenemy = var_46d2ec35;
            ai.favoriteenemy.hunted_by++;
        }
    }
    return ai;
}

// Namespace zm_ai_nosferatu/zm_ai_nosferatu
// Params 0, eflags: 0x1 linked
// Checksum 0x12d61dc9, Offset: 0x1c40
// Size: 0x9a
function function_1c0cad2c() {
    var_e02fe4cb = function_853b43e8();
    var_72385dbc = function_fc977dee();
    if (isdefined(level.var_5e45f817) && level.var_5e45f817 || var_e02fe4cb >= var_72385dbc || !level flag::get("spawn_zombies")) {
        return 0;
    }
    return 1;
}

// Namespace zm_ai_nosferatu/zm_ai_nosferatu
// Params 0, eflags: 0x1 linked
// Checksum 0x55e8d8a, Offset: 0x1ce8
// Size: 0x8a
function function_fc977dee() {
    switch (getplayers().size) {
    case 1:
        return 3;
        break;
    case 2:
        return 5;
        break;
    case 3:
        return 7;
        break;
    case 4:
        return 10;
        break;
    }
}

// Namespace zm_ai_nosferatu/zm_ai_nosferatu
// Params 0, eflags: 0x1 linked
// Checksum 0xf48cfe03, Offset: 0x1d80
// Size: 0xbc
function function_853b43e8() {
    var_219a33e2 = getaiarchetypearray(#"nosferatu");
    var_e02fe4cb = var_219a33e2.size;
    foreach (ai_nosferatu in var_219a33e2) {
        if (!isalive(ai_nosferatu)) {
            var_e02fe4cb--;
        }
    }
    return var_e02fe4cb;
}

// Namespace zm_ai_nosferatu/zm_ai_nosferatu
// Params 1, eflags: 0x1 linked
// Checksum 0xed303618, Offset: 0x1e48
// Size: 0x22a
function function_6502a84d(entity) {
    if (isdefined(level.zm_loc_types[#"nosferatu_location"]) && level.zm_loc_types[#"nosferatu_location"].size >= 1) {
        a_locs = array::randomize(level.zm_loc_types[#"nosferatu_location"]);
    }
    if (!isdefined(a_locs) || a_locs.size == 0) {
        return;
    }
    if (isdefined(entity) && isdefined(entity.favoriteenemy) && zm_utility::is_player_valid(entity.favoriteenemy)) {
        var_46d2ec35 = entity.favoriteenemy;
    } else {
        var_46d2ec35 = get_favorite_enemy();
    }
    if (!isdefined(var_46d2ec35) || !isalive(var_46d2ec35)) {
        return array::random(a_locs);
    }
    var_3ca1175 = 3600 * 3600;
    for (i = 0; i < a_locs.size; i++) {
        if (isdefined(level.var_445185e3) && level.var_445185e3 == a_locs[i]) {
            continue;
        }
        n_dist_squared = distancesquared(a_locs[i].origin, var_46d2ec35.origin);
        if (n_dist_squared < var_3ca1175) {
            level.var_445185e3 = a_locs[i];
            return a_locs[i];
        }
    }
    return arraygetclosest(var_46d2ec35.origin, a_locs);
}

// Namespace zm_ai_nosferatu/zm_ai_nosferatu
// Params 0, eflags: 0x1 linked
// Checksum 0x92c46259, Offset: 0x2080
// Size: 0x138
function get_favorite_enemy() {
    var_8637c743 = getplayers();
    e_least_hunted = var_8637c743[0];
    for (i = 0; i < var_8637c743.size; i++) {
        if (!isdefined(var_8637c743[i].hunted_by)) {
            var_8637c743[i].hunted_by = 0;
        }
        if (!zm_utility::is_player_valid(var_8637c743[i])) {
            continue;
        }
        if (!zm_utility::is_player_valid(e_least_hunted)) {
            e_least_hunted = var_8637c743[i];
        }
        if (var_8637c743[i].hunted_by < e_least_hunted.hunted_by) {
            e_least_hunted = var_8637c743[i];
        }
    }
    if (!zm_utility::is_player_valid(e_least_hunted)) {
        return undefined;
    } else {
        e_least_hunted.hunted_by = e_least_hunted.hunted_by + 1;
        return e_least_hunted;
    }
}

// Namespace zm_ai_nosferatu/zm_ai_nosferatu
// Params 0, eflags: 0x1 linked
// Checksum 0x87c944a8, Offset: 0x21c0
// Size: 0x308
function function_4c71848e() {
    self endon(#"death");
    a_s_spawn_locs = level.zm_loc_types[#"nosferatu_location"];
    if (isarray(a_s_spawn_locs)) {
        i = 0;
        while (i < a_s_spawn_locs.size) {
            if (isdefined(a_s_spawn_locs[i].scriptbundlename)) {
                arrayremoveindex(a_s_spawn_locs, i);
            } else {
                i++;
            }
        }
        if (a_s_spawn_locs.size < 1) {
            self.b_ignore_cleanup = 1;
            return 1;
        }
    } else {
        self.b_ignore_cleanup = 1;
        return 1;
    }
    if (zm_utility::is_standard() && level flag::exists("started_defend_area") && level flag::get("started_defend_area")) {
        self.b_ignore_cleanup = 1;
        return 1;
    }
    var_31f7011a = arraycopy(getplayers());
    var_31f7011a = arraysortclosest(var_31f7011a, self.origin);
    i = 0;
    var_b2aa54a9 = a_s_spawn_locs[0];
    var_56feeec4 = distancesquared(var_31f7011a[0].origin, var_b2aa54a9.origin);
    foreach (var_d7eff26a in a_s_spawn_locs) {
        if (!zm_utility::is_player_valid(var_31f7011a[i])) {
            i++;
            if (i >= var_31f7011a.size) {
                i = 0;
                util::wait_network_frame();
            }
        } else {
            var_e8ab126e = distancesquared(var_31f7011a[i].origin, var_d7eff26a.origin);
            if (var_e8ab126e < var_56feeec4) {
                var_56feeec4 = var_e8ab126e;
                var_b2aa54a9 = var_d7eff26a;
            }
        }
    }
    self zm_ai_utility::function_a8dc3363(var_b2aa54a9);
    return 1;
}

// Namespace zm_ai_nosferatu/zm_ai_nosferatu
// Params 1, eflags: 0x5 linked
// Checksum 0xfa0f86e2, Offset: 0x24d0
// Size: 0x17e
function private function_82785646(entity) {
    if (isdefined(level.var_5e45f817) && level.var_5e45f817) {
        return 0;
    }
    if (!isdefined(self.var_9fde8624) || self.var_9fde8624 != #"crimson_nosferatu") {
        return 0;
    }
    if (entity.health / entity.maxhealth > entity ai::function_9139c839().var_23f04a87 / 100) {
        return 0;
    }
    if (isdefined(entity.var_85480576) && entity.var_85480576) {
        return 0;
    }
    if (entity.var_2e5407fc > gettime()) {
        return 0;
    }
    if (!(isdefined(level.var_9dc5ff5d) && level.var_9dc5ff5d) && zombie_utility::get_current_zombie_count() >= level.zombie_ai_limit) {
        return 0;
    }
    if (!function_c16e1ca1(entity)) {
        return 0;
    }
    if (function_21a3a673(0, 100) < entity ai::function_9139c839().var_3b66f582) {
        return 1;
    }
    return 0;
}

// Namespace zm_ai_nosferatu/zm_ai_nosferatu
// Params 1, eflags: 0x5 linked
// Checksum 0xb8206cbc, Offset: 0x2658
// Size: 0x82
function private function_c16e1ca1(entity) {
    if (!isdefined(entity.enemy)) {
        return 0;
    }
    if (entity.var_9fde8624 !== #"crimson_nosferatu") {
        return 0;
    }
    var_847b3ac1 = blackboard::getblackboardevents("nfrtu_summon");
    if (isdefined(var_847b3ac1) && var_847b3ac1.size) {
        return 0;
    }
    return 1;
}

// Namespace zm_ai_nosferatu/zm_ai_nosferatu
// Params 1, eflags: 0x5 linked
// Checksum 0x7e2229e8, Offset: 0x26e8
// Size: 0xbc
function private function_7d874447(entity) {
    var_e47d78cb = spawnstruct();
    blackboard::addblackboardevent("nfrtu_summon", var_e47d78cb, randomintrange(50000, 100000));
    entity.var_2e5407fc = gettime() + int(entity ai::function_9139c839().var_e61d73b0 * 1000);
    entity clientfield::set("summon_nfrtu", 1);
}

// Namespace zm_ai_nosferatu/zm_ai_nosferatu
// Params 1, eflags: 0x5 linked
// Checksum 0xb251ee58, Offset: 0x27b0
// Size: 0x6c
function private function_7fef620b(entity) {
    entity.var_2e5407fc = gettime() + int(entity ai::function_9139c839().var_e61d73b0 * 1000);
    entity clientfield::set("summon_nfrtu", 0);
}

// Namespace zm_ai_nosferatu/zm_ai_nosferatu
// Params 1, eflags: 0x5 linked
// Checksum 0xd325f755, Offset: 0x2828
// Size: 0x3d4
function private function_76d6482e(entity) {
    if (isdefined(level.zm_loc_types[#"nosferatu_location"]) && level.zm_loc_types[#"nosferatu_location"].size >= 1) {
        a_locs = array::randomize(level.zm_loc_types[#"nosferatu_location"]);
    }
    if (!isdefined(a_locs)) {
        return;
    }
    var_c9528359 = int(max(0, min(3, level.zombie_ai_limit - zombie_utility::get_current_zombie_count())));
    var_4a07738f = entity getpathfindingradius() + 25;
    queryresult = positionquery_source_navigation(entity.origin, var_4a07738f, 300, 64, 25, entity);
    if (queryresult.data.size == 0) {
        /#
            iprintlnbold("<unknown string>");
        #/
        return;
    }
    if (!var_c9528359) {
        a_ai_zombies = getaiarchetypearray(#"zombie");
        foreach (e_player in util::get_active_players(#"allies")) {
            var_77696b51 = array::get_all_closest(e_player.origin, a_ai_zombies, undefined, undefined, 640);
            a_ai_zombies = array::exclude(a_ai_zombies, var_77696b51);
        }
        var_c9528359 = int(max(0, min(3, a_ai_zombies.size)));
        /#
            iprintln("<unknown string>" + var_c9528359 + "<unknown string>");
        #/
        for (i = 0; i < var_c9528359; i++) {
            a_ai_zombies[i] thread zm_cleanup::cleanup_zombie();
        }
    }
    if (var_c9528359) {
        /#
            iprintln("<unknown string>" + var_c9528359 + "<unknown string>");
        #/
        entity thread function_13b48cdd(var_c9528359, queryresult);
    } else {
        /#
            if (var_c9528359 == 0) {
                iprintlnbold("<unknown string>");
            }
        #/
    }
}

// Namespace zm_ai_nosferatu/zm_ai_nosferatu
// Params 2, eflags: 0x1 linked
// Checksum 0x29dd7e64, Offset: 0x2c08
// Size: 0x1ac
function function_13b48cdd(var_c9528359, queryresult) {
    self endon(#"death");
    point_index = 0;
    while (var_c9528359 > 0) {
        var_18f8f237 = 5;
        point = queryresult.data[point_index];
        point_index++;
        if (isdefined(point)) {
            do {
                ai = function_74f25f8a(1, undefined);
                var_18f8f237--;
                waitframe(1);
            } while(!isdefined(ai) && var_18f8f237);
        }
        /#
            if (!var_18f8f237 && !isdefined(ai)) {
                iprintlnbold("<unknown string>");
            }
        #/
        if (isdefined(ai) && isdefined(point)) {
            ai thread function_b2a2b29e();
            ai.favoriteenemy = zm_utility::get_closest_valid_player(ai.origin, []);
            point thread nosferatu_spawn_fx(ai, {#angles:self.angles, #origin:point.origin});
            wait(0.2);
        }
        var_c9528359--;
        waitframe(1);
    }
}

// Namespace zm_ai_nosferatu/zm_ai_nosferatu
// Params 0, eflags: 0x1 linked
// Checksum 0xc9a10c4c, Offset: 0x2dc0
// Size: 0x6e
function function_b2a2b29e() {
    self endon(#"death");
    self.var_126d7bef = 1;
    self.ignore_round_spawn_failsafe = 1;
    self.ignore_enemy_count = 1;
    self.b_ignore_cleanup = 1;
    self waittill(#"completed_emerging_into_playable_area");
    self.no_powerups = 1;
}

// Namespace zm_ai_nosferatu/zm_ai_nosferatu
// Params 2, eflags: 0x1 linked
// Checksum 0x9c1a448d, Offset: 0x2e38
// Size: 0x278
function nosferatu_spawn_fx(ai, ent) {
    ai endon(#"death");
    ai val::set(#"nosferatu_spawn", "allowdeath", 0);
    ai setfreecameralockonallowed(0);
    wait(1.5);
    earthquake(0.5, 0.75, ent.origin, 1000);
    if (isdefined(ai.favoriteenemy)) {
        angle = vectortoangles(ai.favoriteenemy.origin - ent.origin);
        angles = (ai.angles[0], angle[1], ai.angles[2]);
    } else {
        angles = ent.angles;
    }
    ai dontinterpolate();
    ai forceteleport(ent.origin, angles);
    ai clientfield::increment("nosferatu_spawn_fx");
    /#
        assert(isdefined(ai), "<unknown string>");
    #/
    /#
        assert(isalive(ai), "<unknown string>");
    #/
    ai val::reset(#"nosferatu_spawn", "allowdeath");
    wait(0.1);
    ai show();
    ai setfreecameralockonallowed(1);
    ai val::reset(#"nosferatu_spawn", "ignoreme");
    ai notify(#"visible");
}

// Namespace zm_ai_nosferatu/zm_ai_nosferatu
// Params 1, eflags: 0x1 linked
// Checksum 0x379b472b, Offset: 0x30b8
// Size: 0x212
function function_201862b(eventstruct) {
    notify_string = eventstruct.action;
    switch (notify_string) {
    case #"death":
        if (isdefined(self.bgb_tone_death) && self.bgb_tone_death) {
            level thread zm_audio::zmbaivox_playvox(self, "death_whimsy", 1, 4);
        } else {
            level thread zm_audio::zmbaivox_playvox(self, notify_string, 1, 4);
        }
        break;
    case #"pain":
        level thread zm_audio::zmbaivox_playvox(self, notify_string, 1, 3);
        break;
    case #"scream":
        level thread zm_audio::zmbaivox_playvox(self, notify_string, 1, 3, 1);
        break;
    case #"leap":
    case #"attack_melee":
    case #"attack_bite":
        level thread zm_audio::zmbaivox_playvox(self, notify_string, 1, 2, 1);
        break;
    case #"sprint":
    case #"ambient":
        level thread zm_audio::zmbaivox_playvox(self, notify_string, 0, 1);
        break;
    default:
        level thread zm_audio::zmbaivox_playvox(self, notify_string, 0, 2);
        break;
    }
}

