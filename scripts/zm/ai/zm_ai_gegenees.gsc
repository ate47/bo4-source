// Atian COD Tools GSC decompiler test
#include scripts/zm/ai/zm_ai_gegenees_interface.gsc;
#include scripts/zm_common/trials/zm_trial_force_archetypes.gsc;
#include scripts/zm_common/trials/zm_trial_special_enemy.gsc;
#include scripts/zm_common/ai/zm_ai_utility.gsc;
#include scripts/zm_common/zm_zonemgr.gsc;
#include scripts/zm_common/zm_utility.gsc;
#include scripts/zm_common/zm_spawner.gsc;
#include scripts/zm_common/zm_powerups.gsc;
#include scripts/zm_common/zm_devgui.gsc;
#include scripts/zm_common/zm_behavior.gsc;
#include scripts/zm_common/zm_audio.gsc;
#include scripts/core_common/ai/zombie_utility.gsc;
#include scripts/core_common/ai/zombie.gsc;
#include scripts/core_common/ai/systems/gib.gsc;
#include scripts/core_common/ai/systems/destructible_character.gsc;
#include script_2c5daa95f8fec03c;
#include scripts/core_common/ai/systems/blackboard.gsc;
#include scripts/core_common/ai/systems/behavior_tree_utility.gsc;
#include scripts/core_common/ai/systems/animation_state_machine_utility.gsc;
#include scripts/core_common/ai/systems/animation_state_machine_notetracks.gsc;
#include scripts/core_common/ai/systems/animation_state_machine_mocomp.gsc;
#include scripts/core_common/ai/systems/ai_interface.gsc;
#include scripts/core_common/ai/systems/ai_blackboard.gsc;
#include script_3819e7a1427df6d2;
#include scripts/core_common/values_shared.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/status_effects/status_effect_util.gsc;
#include scripts/core_common/spawner_shared.gsc;
#include scripts/core_common/math_shared.gsc;
#include scripts/core_common/flag_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;
#include scripts/core_common/array_shared.gsc;
#include scripts/core_common/ai_shared.gsc;
#include scripts/core_common/aat_shared.gsc;

#namespace zm_ai_gegenees;

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 0, eflags: 0x2
// Checksum 0x3dc794fa, Offset: 0x628
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_ai_gegenees", &__init__, &__main__, undefined);
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 0, eflags: 0x1 linked
// Checksum 0x971b73c, Offset: 0x678
// Size: 0x324
function __init__() {
    spawner::add_archetype_spawn_function(#"gegenees", &function_aad04bcc);
    registerbehaviorscriptfunctions();
    zm_ai_gegenees_interface::registergegeneesinterfaceattributes();
    spawner::add_archetype_spawn_function(#"gegenees", &supplypodtank);
    clientfield::register("actor", "gegenees_shield_blast_effect", 16000, 1, "counter");
    clientfield::register("actor", "gegenees_shield_guard_effect", 16000, 1, "int");
    clientfield::register("actor", "gegenees_spear_tip_effect", 16000, 1, "int");
    clientfield::register("actor", "gegenees_spear_tip_tell_effect", 16000, 1, "int");
    clientfield::register("toplayer", "gegenees_damage_cf", 16000, 1, "counter");
    clientfield::register("scriptmover", "gegenees_spear_miss_cf", 16000, 1, "counter");
    clientfield::register("actor", "gegenees_helmet_explosion_cf", 16000, 1, "int");
    level thread aat::register_immunity("zm_aat_brain_decay", #"gegenees", 1, 1, 1);
    level thread aat::register_immunity("zm_aat_frostbite", #"gegenees", 1, 1, 1);
    level thread aat::register_immunity("zm_aat_kill_o_watt", #"gegenees", 1, 1, 1);
    level thread aat::register_immunity("zm_aat_plasmatic_burst", #"gegenees", 1, 1, 1);
    /#
        if (isarchetypeloaded(#"gegenees")) {
            level thread function_c03e8d05();
        }
        spawner::add_archetype_spawn_function(#"gegenees", &zombie_utility::updateanimationrate);
    #/
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 0, eflags: 0x1 linked
// Checksum 0xa9753a27, Offset: 0x9a8
// Size: 0x6c
function __main__() {
    level.var_8c5f46f1 = [];
    for (i = 0; i < 8; i++) {
        level.var_8c5f46f1[level.var_8c5f46f1.size] = spawn("script_model", (0, 0, 0));
    }
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 0, eflags: 0x1 linked
// Checksum 0x6097ac9, Offset: 0xa20
// Size: 0x4a
function function_aad04bcc() {
    blackboard::createblackboardforentity(self);
    ai::createinterfaceforentity(self);
    self.___archetypeonanimscriptedcallback = &function_a6dba7fd;
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 1, eflags: 0x5 linked
// Checksum 0xe5d4344b, Offset: 0xa78
// Size: 0x2c
function private function_a6dba7fd(entity) {
    entity.__blackboard = undefined;
    entity function_aad04bcc();
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 0, eflags: 0x1 linked
// Checksum 0x8820018f, Offset: 0xab0
// Size: 0x91c
function registerbehaviorscriptfunctions() {
    /#
        assert(isscriptfunctionptr(&gegeneestargetservice));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"gegeneestargetservice", &gegeneestargetservice, 1);
    /#
        assert(isscriptfunctionptr(&function_d5d3aa77));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2bc0d801acaee9a4", &function_d5d3aa77);
    /#
        assert(isscriptfunctionptr(&function_4334cc3b));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4053e75ff0301438", &function_4334cc3b);
    /#
        assert(isscriptfunctionptr(&function_a953d80d));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1075ab617f39c601", &function_a953d80d);
    /#
        assert(isscriptfunctionptr(&function_7f34a57c));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1e595daa404c5a3d", &function_7f34a57c);
    /#
        assert(isscriptfunctionptr(&function_75db4aba));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7e22610d7293179e", &function_75db4aba);
    /#
        assert(isscriptfunctionptr(&function_d344063a));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1d6949a6c9ec0081", &function_d344063a);
    /#
        assert(isscriptfunctionptr(&function_e0b648bb));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7f89573df60550e1", &function_e0b648bb);
    /#
        assert(isscriptfunctionptr(&function_3133f922));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6f4458058e881523", &function_3133f922);
    /#
        assert(isscriptfunctionptr(&function_d82de95f));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_16cf6fd0904e492f", &function_d82de95f);
    /#
        assert(isscriptfunctionptr(&function_564b9cf5));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_74ab5c3ab4cbfdda", &function_564b9cf5);
    /#
        assert(isscriptfunctionptr(&function_7505908b));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_572453d6d6540a73", &function_7505908b);
    /#
        assert(isscriptfunctionptr(&function_9175e656));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1f9cdbd55afb3860", &function_9175e656);
    /#
        assert(isscriptfunctionptr(&function_c81af561));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2c97edb3312da9c6", &function_c81af561);
    /#
        assert(isscriptfunctionptr(&function_47fdaf31));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_471802b111fa1af0", &function_47fdaf31);
    /#
        assert(isscriptfunctionptr(&gegeneesstunstart));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"gegeneesstunstart", &gegeneesstunstart);
    /#
        assert(isscriptfunctionptr(&function_3839537e));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_3246ea8d9722e46e", &function_3839537e);
    /#
        assert(!isdefined(&function_2301c0a7) || isscriptfunctionptr(&function_2301c0a7));
    #/
    /#
        assert(!isdefined(&function_c2155e05) || isscriptfunctionptr(&function_c2155e05));
    #/
    /#
        assert(!isdefined(&function_15502a5) || isscriptfunctionptr(&function_15502a5));
    #/
    behaviortreenetworkutility::registerbehaviortreeaction(#"hash_49454f4516c40e65", &function_2301c0a7, &function_c2155e05, &function_15502a5);
    animationstatenetwork::registeranimationmocomp("mocomp_gegenees_shield", &function_d645d2ec, &function_f6bb8a07, &function_64c4573);
    animationstatenetwork::registernotetrackhandlerfunction("gegenees_melee", &function_c3c86ec1);
    animationstatenetwork::registernotetrackhandlerfunction("geg_throw_spear", &function_7fe60e9e);
    animationstatenetwork::registernotetrackhandlerfunction("geg_grab_spear", &function_4d6e95b6);
    animationstatenetwork::registernotetrackhandlerfunction("gegenees_weapon_drop", &function_43104218);
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 2, eflags: 0x5 linked
// Checksum 0xcb5e3093, Offset: 0x13d8
// Size: 0xe4
function private function_d4f5b993(entity, eventname) {
    if (!isdefined(entity.favoriteenemy)) {
        return 0;
    }
    var_b3a11ca1 = blackboard::getblackboardevents(eventname);
    if (isdefined(var_b3a11ca1) && var_b3a11ca1.size) {
        foreach (var_8d7c592b in var_b3a11ca1) {
            if (var_8d7c592b.data.favoriteenemy === entity.favoriteenemy) {
                return 0;
            }
        }
    }
    return 1;
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 3, eflags: 0x5 linked
// Checksum 0xf79fc5b2, Offset: 0x14c8
// Size: 0xf8
function private function_697a9b7f(entity, minrange, maxrange) {
    if (!isdefined(entity.favoriteenemy)) {
        return 0;
    }
    if (isdefined(entity.var_b491d096)) {
        return 0;
    }
    if (!isdefined(minrange)) {
        minrange = 200;
    }
    if (!isdefined(maxrange)) {
        maxrange = 1000;
    }
    withinrange = distancesquared(entity.origin, entity.favoriteenemy.origin) <= maxrange * maxrange;
    withinrange = withinrange && distancesquared(entity.origin, entity.favoriteenemy.origin) >= minrange * minrange;
    return withinrange;
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 1, eflags: 0x5 linked
// Checksum 0x9f722305, Offset: 0x15c8
// Size: 0x9a
function private function_180db9a7(entity) {
    if (!isdefined(entity.favoriteenemy)) {
        return 0;
    }
    if (isdefined(entity.var_b491d096)) {
        return 0;
    }
    can_see = bullettracepassed(entity.origin + vectorscale((0, 0, 1), 36), entity.favoriteenemy.origin + vectorscale((0, 0, 1), 36), 0, undefined);
    return can_see;
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 1, eflags: 0x5 linked
// Checksum 0xe1740985, Offset: 0x1670
// Size: 0x10e
function private function_4b8e0aab(entity) {
    if (!isdefined(entity.favoriteenemy)) {
        return 0;
    }
    if (isdefined(entity.var_b491d096)) {
        return 0;
    }
    can_see = 0;
    trace = physicstrace(entity.origin + vectorscale((0, 0, 1), 48), entity.favoriteenemy.origin + vectorscale((0, 0, 1), 36), (-16, -16, -12), (16, 16, 12), entity);
    if (trace[#"fraction"] == 1 || trace[#"entity"] === entity.favoriteenemy) {
        can_see = 1;
    }
    return can_see;
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 1, eflags: 0x1 linked
// Checksum 0x456845d6, Offset: 0x1788
// Size: 0x68
function function_7f34a57c(entity) {
    if (function_697a9b7f(entity) && function_4b8e0aab(entity) && function_d4f5b993(entity, "geg_spear_attack")) {
        return 1;
    }
    return 0;
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 1, eflags: 0x1 linked
// Checksum 0x3e70d155, Offset: 0x17f8
// Size: 0x4e4
function function_7fe60e9e(entity) {
    var_d86ae1c4 = spawnstruct();
    var_d86ae1c4.favoriteenemy = entity.favoriteenemy;
    blackboard::addblackboardevent("geg_spear_attack", var_d86ae1c4, randomintrange(8500, 10000));
    if (!isactor(entity) || !isdefined(entity.favoriteenemy)) {
        return;
    }
    targetpos = entity.favoriteenemy.origin;
    launchpos = entity gettagorigin("tag_inhand");
    var_ad804014 = 5;
    if (distancesquared(targetpos, entity.origin) > 250 * 250) {
        velocity = entity.favoriteenemy getvelocity();
        targetpos = targetpos + velocity * 0.5;
        var_a76a363d = math::randomsign() * randomint(var_ad804014);
        var_9b241db1 = math::randomsign() * randomint(var_ad804014);
        targetpos = targetpos + (var_a76a363d, var_9b241db1, 0);
        speed = length(velocity);
        if (speed > 0) {
            var_7ee6937e = vectornormalize((targetpos[0], targetpos[1], 0) - (launchpos[0], launchpos[1], 0));
            dot = vectordot(-1 * var_7ee6937e, velocity / speed);
            if (dot >= 0.8) {
                targetpos = targetpos + var_7ee6937e * dot * speed * 0.5;
            }
        }
    }
    targetpos = targetpos + vectorscale((0, 0, 1), 36);
    var_872c6826 = vectortoangles(targetpos - launchpos);
    angles = function_cc68801f(launchpos, targetpos, 1110, getdvarfloat(#"bg_lowgravity", 0));
    if (isdefined(angles) && angles[#"lowangle"] > 0) {
        dir = anglestoforward((-1 * angles[#"lowangle"], var_872c6826[1], var_872c6826[2]));
    } else {
        dir = anglestoforward(var_872c6826);
    }
    velocity = dir * 1110;
    var_1a3b2274 = "gegenees_spear_projectile";
    if (isdefined(entity.var_e946c8e8) && entity.var_e946c8e8) {
        var_1a3b2274 = "gegenees_golden_spear_projectile";
    }
    var_ed782d5 = getweapon(var_1a3b2274);
    var_a137cb9f = entity gettagorigin("tag_inhand");
    var_eb549b4f = entity.favoriteenemy.origin;
    projectile = magicbullet(var_ed782d5, var_a137cb9f, var_eb549b4f, entity, entity.favoriteenemy);
    projectile thread function_7d162bd0(projectile, entity);
    entity function_59e9f77b();
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 1, eflags: 0x4
// Checksum 0xfa1a3262, Offset: 0x1ce8
// Size: 0x56
function private function_61d12301(projectile) {
    projectile endon(#"death");
    result = undefined;
    result = projectile waittill(#"damage");
    projectile.isdamaged = 1;
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 1, eflags: 0x4
// Checksum 0x9c6c6747, Offset: 0x1d48
// Size: 0x38
function private watch_for_death(projectile) {
    projectile waittill(#"death");
    waittillframeend();
    projectile notify(#"spear_death");
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 0, eflags: 0x5 linked
// Checksum 0x8dafb75c, Offset: 0x1d88
// Size: 0x9e
function private function_a1fce938() {
    foreach (var_b12a43cc in level.var_8c5f46f1) {
        if (!(isdefined(var_b12a43cc.in_use) && var_b12a43cc.in_use)) {
            var_b12a43cc.in_use = 1;
            return var_b12a43cc;
        }
    }
    return undefined;
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 0, eflags: 0x5 linked
// Checksum 0x6802a51b, Offset: 0x1e30
// Size: 0x138
function private function_7e633e59() {
    zombies = getaiteamarray(level.zombie_team);
    var_86bf21bc = self.origin;
    foreach (zombie in zombies) {
        if (!isalive(zombie)) {
            continue;
        }
        if (zombie.archetype === #"gegenees") {
            continue;
        }
        dist_sq = distancesquared(var_86bf21bc, zombie.origin);
        if (dist_sq < 10000) {
            zombie thread zombie_utility::setup_zombie_knockdown(var_86bf21bc);
            util::wait_network_frame();
        }
    }
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 2, eflags: 0x5 linked
// Checksum 0x3d15fdf5, Offset: 0x1f70
// Size: 0x19c
function private function_7d162bd0(projectile, entity) {
    projectile endon(#"spear_death");
    result = undefined;
    result = projectile waittill(#"projectile_impact_player", #"death");
    if (result._notify != "projectile_impact_player") {
        var_b12a43cc = function_a1fce938();
        if (isdefined(var_b12a43cc)) {
            if (isdefined(projectile.origin)) {
                projectile thread function_7e633e59();
                var_b12a43cc.origin = projectile.origin;
            } else if (isdefined(entity) && isdefined(entity.favoriteenemy)) {
                var_b12a43cc.origin = entity.favoriteenemy.origin;
            }
            util::wait_network_frame();
            var_b12a43cc clientfield::increment("gegenees_spear_miss_cf");
            wait(0.25);
            var_b12a43cc.in_use = 0;
        }
    } else if (isdefined(result.player)) {
        result.player clientfield::increment_to_player("gegenees_damage_cf");
    }
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 1, eflags: 0x5 linked
// Checksum 0x4a322dd0, Offset: 0x2118
// Size: 0x24
function private function_4d6e95b6(entity) {
    entity function_d06af584();
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 1, eflags: 0x5 linked
// Checksum 0xd2e09726, Offset: 0x2148
// Size: 0x84
function private function_43104218(entity) {
    destructserverutils::function_9885f550(entity, "left_hand", "tag_weapon_left");
    destructserverutils::function_9885f550(entity, "right_hand", "tag_weapon_right");
    destructserverutils::function_9885f550(entity, "right_arm_upper", "tag_inhand");
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 1, eflags: 0x5 linked
// Checksum 0xcd50153a, Offset: 0x21d8
// Size: 0xca
function private function_e0b648bb(entity) {
    if (isdefined(entity.var_d7e69143) && entity.var_d7e69143) {
        if (isdefined(entity.zombie_poi) && isdefined(entity.zombie_poi[1])) {
            dist_sq = distancesquared(entity.origin, entity.zombie_poi[1].origin);
            melee_dist_sq = zombiebehavior::function_997f1224(entity);
            if (dist_sq < melee_dist_sq) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 1, eflags: 0x5 linked
// Checksum 0x19947bf2, Offset: 0x22b0
// Size: 0x34
function private function_d344063a(entity) {
    if (isdefined(entity.var_d64b7af0) && entity.var_d64b7af0) {
        return 1;
    }
    return 0;
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 1, eflags: 0x5 linked
// Checksum 0x792a9775, Offset: 0x22f0
// Size: 0x1a
function private function_47fdaf31(entity) {
    entity.var_d64b7af0 = 0;
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 1, eflags: 0x5 linked
// Checksum 0xd3df58c0, Offset: 0x2318
// Size: 0x3c
function private gegeneesstunstart(entity) {
    entity function_d06af584();
    zm_behavior::zombiestunstart(entity);
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 1, eflags: 0x5 linked
// Checksum 0x7ae309fc, Offset: 0x2360
// Size: 0x7c
function private function_3839537e(entity) {
    if (!isdefined(entity.zombie_poi)) {
        return;
    }
    poi_ent = entity.zombie_poi[1];
    if (isdefined(poi_ent.damagearea)) {
        poi_ent.damagearea delete();
    }
    poi_ent delete();
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 1, eflags: 0x5 linked
// Checksum 0x8f127cd4, Offset: 0x23e8
// Size: 0x100
function private function_75db4aba(entity) {
    /#
        if (isdefined(entity.var_89b5e1e) && entity.var_89b5e1e) {
            return 1;
        }
    #/
    var_98c55679 = 0;
    var_a4017acd = 0.1 * entity.maxhealth;
    if (isdefined(entity.shielddamage)) {
        if (entity.shielddamage > var_a4017acd) {
            var_98c55679 = 1;
        }
    }
    if (!var_98c55679) {
        return 0;
    }
    if (function_697a9b7f(entity, 300, 1200) && function_180db9a7(entity) && function_d4f5b993(entity, "geg_shield_attack")) {
        return 1;
    }
    return 0;
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 1, eflags: 0x5 linked
// Checksum 0xb86fdfb7, Offset: 0x24f0
// Size: 0x32
function private function_3133f922(entity) {
    entity.var_7b0667d9 = 1;
    entity.locked_enemy = entity.favoriteenemy;
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 1, eflags: 0x5 linked
// Checksum 0x2daa7c75, Offset: 0x2530
// Size: 0x286
function private function_d82de95f(entity) {
    var_d7c9d429 = spawnstruct();
    var_d7c9d429.favoriteenemy = entity.locked_enemy;
    blackboard::addblackboardevent("geg_shield_attack", var_d7c9d429, randomintrange(2000, 3000));
    entity notify(#"gegenees_shield_blast");
    entity clientfield::increment("gegenees_shield_blast_effect");
    if (isdefined(entity.locked_enemy)) {
        hit_enemy = 1;
        blast_origin = entity gettagorigin("j_gegenees_shield");
        forward_angles = anglestoforward(entity.angles);
        if (isdefined(blast_origin) && isdefined(forward_angles)) {
            end_pos = blast_origin + forward_angles * 1200;
            test_origin = entity.locked_enemy getcentroid();
            radial_origin = pointonsegmentnearesttopoint(blast_origin, end_pos, test_origin);
            var_caf24228 = distancesquared(test_origin, radial_origin);
            if (var_caf24228 > 4096) {
                hit_enemy = 0;
            }
            hit_enemy = bullettracepassed(blast_origin, test_origin, 0, undefined);
            if (hit_enemy) {
                entity.locked_enemy status_effect::status_effect_apply(getstatuseffect(#"hash_706608d269d2fefc"), undefined, entity, undefined, 2000);
                entity.locked_enemy thread function_60164697();
                entity.locked_enemy clientfield::increment_to_player("gegenees_damage_cf");
            }
        }
    }
    entity.shielddamage = 0;
    entity.locked_enemy = undefined;
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 0, eflags: 0x5 linked
// Checksum 0x4a234442, Offset: 0x27c0
// Size: 0x76
function private function_60164697() {
    self endon(#"death", #"disconnect");
    time = gettime() + 2000;
    while (1) {
        if (gettime() > time) {
            break;
        }
        self playrumbleonentity("damage_heavy");
        waitframe(1);
    }
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 1, eflags: 0x5 linked
// Checksum 0x35c1a9eb, Offset: 0x2840
// Size: 0x1a
function private function_564b9cf5(entity) {
    entity.var_7b0667d9 = 0;
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 2, eflags: 0x5 linked
// Checksum 0xea062710, Offset: 0x2868
// Size: 0xf0
function private function_2301c0a7(entity, asmstatename) {
    entity.track_enemy = 1;
    entity.var_1ec6ea5d = gettime() + int(entity ai::function_9139c839().var_3422adfd * 1000);
    entity.var_292d3a3b = gettime() + int(entity ai::function_9139c839().var_5d9f2696 * 1000);
    entity clientfield::set("gegenees_shield_guard_effect", 1);
    /#
        entity.var_89b5e1e = 0;
    #/
    animationstatenetworkutility::requeststate(entity, asmstatename);
    return 5;
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 2, eflags: 0x5 linked
// Checksum 0x8b1677da, Offset: 0x2960
// Size: 0x90
function private function_c2155e05(entity, asmstatename) {
    if (isdefined(entity.track_enemy) && entity.track_enemy) {
        if (isdefined(entity.var_292d3a3b)) {
            if (gettime() > entity.var_292d3a3b) {
                entity.track_enemy = 0;
            }
        }
    }
    if (isdefined(entity.var_1ec6ea5d)) {
        if (gettime() < entity.var_1ec6ea5d) {
            return 5;
        }
    }
    return 4;
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 2, eflags: 0x5 linked
// Checksum 0x70b3b612, Offset: 0x29f8
// Size: 0x38
function private function_15502a5(entity, asmstatename) {
    entity clientfield::set("gegenees_shield_guard_effect", 0);
    return 4;
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 1, eflags: 0x5 linked
// Checksum 0x5f22889f, Offset: 0x2a38
// Size: 0x5e
function private function_7505908b(entity) {
    entity.var_7b0667d9 = 1;
    entity clientfield::set("gegenees_spear_tip_tell_effect", 1);
    entity.tell_fx = 1;
    entity.tell_off = gettime() + 250;
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 1, eflags: 0x5 linked
// Checksum 0xdb01f801, Offset: 0x2aa0
// Size: 0x6c
function private function_9175e656(entity) {
    if (isdefined(entity.tell_fx) && entity.tell_fx) {
        if (gettime() > entity.tell_off) {
            entity.tell_fx = 0;
            entity clientfield::set("gegenees_spear_tip_tell_effect", 0);
        }
    }
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 1, eflags: 0x5 linked
// Checksum 0xb1a29b80, Offset: 0x2b18
// Size: 0x1a
function private function_c81af561(entity) {
    entity.var_7b0667d9 = 0;
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 1, eflags: 0x5 linked
// Checksum 0x76df42df, Offset: 0x2b40
// Size: 0x3aa
function private gegeneestargetservice(entity) {
    if (isdefined(entity.ignoreall) && entity.ignoreall) {
        return 0;
    }
    /#
        if (isdefined(entity.ispuppet) && entity.ispuppet) {
            return 0;
        }
    #/
    /#
        if (isdefined(entity.devgui_stop_move) && entity.devgui_stop_move) {
            entity setgoal(entity.origin);
            return 0;
        }
    #/
    entity.zombie_poi = entity zm_utility::get_zombie_point_of_interest(entity.origin);
    entity zombie_utility::run_ignore_player_handler();
    entity.favoriteenemy = entity.var_93a62fe;
    entity.var_d7e69143 = 0;
    if (isdefined(entity.zombie_poi) && isdefined(entity.zombie_poi[1])) {
        var_eee191fa = 1;
        if (isdefined(entity.zombie_poi[1].var_8305fd51)) {
            if (entity.zombie_poi[1].var_8305fd51 == #"thunderstorm" || entity.zombie_poi[1].var_8305fd51 == #"charon_pool") {
                var_eee191fa = 0;
                entity.zombie_poi = undefined;
            }
        }
        if (var_eee191fa) {
            entity.var_d7e69143 = 1;
            entity.var_b491d096 = entity.zombie_poi[1];
            goalpos = entity.zombie_poi[0];
            return entity zm_utility::function_64259898(goalpos);
        }
    }
    if (!isdefined(entity.favoriteenemy) || zm_behavior::zombieshouldmoveawaycondition(entity)) {
        zone = zm_utility::get_current_zone();
        if (isdefined(zone)) {
            wait_locations = level.zones[zone].a_loc_types[#"wait_location"];
            if (isdefined(wait_locations) && wait_locations.size > 0) {
                return zm_utility::function_64259898(wait_locations[0].origin);
            }
        }
        entity setgoal(entity.origin);
        return 0;
    }
    /#
        if (entity.favoriteenemy isnotarget()) {
            entity setgoal(entity.origin);
            return 0;
        }
    #/
    goalent = entity.favoriteenemy;
    if (isplayer(goalent)) {
        goalent = zm_ai_utility::function_a2e8fd7b(entity, entity.favoriteenemy);
    }
    return entity zm_utility::function_64259898(goalent.origin);
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 1, eflags: 0x5 linked
// Checksum 0x99b6f250, Offset: 0x2ef8
// Size: 0xd4
function private function_d5d3aa77(entity) {
    enemy = entity.favoriteenemy;
    if (isdefined(enemy) && isalive(enemy)) {
        dist_sq = distancesquared(entity.origin, enemy.origin);
        if (dist_sq > 302500) {
            entity setblackboardattribute("_locomotion_speed", "locomotion_speed_run");
        }
        if (dist_sq < 202500) {
            entity setblackboardattribute("_locomotion_speed", "locomotion_speed_walk");
        }
    }
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 1, eflags: 0x5 linked
// Checksum 0xda2b721a, Offset: 0x2fd8
// Size: 0x64
function private function_4334cc3b(entity) {
    if (self.var_c63e2811 > gettime()) {
        self setblackboardattribute("_gegenees_shield", "shield_up");
    } else {
        self setblackboardattribute("_gegenees_shield", "shield_down");
    }
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 1, eflags: 0x5 linked
// Checksum 0x6ef45336, Offset: 0x3048
// Size: 0x12a
function private function_a953d80d(entity) {
    enemies = getaiarchetypearray(#"zombie");
    enemies = arraycombine(enemies, getaiarchetypearray(#"catalyst"), 0, 0);
    enemies = array::filter(enemies, 0, &function_3d752709, entity);
    foreach (enemy in enemies) {
        enemy zombie_utility::setup_zombie_knockdown(entity);
        enemy.knockdown_type = "knockdown_shoved";
    }
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 2, eflags: 0x5 linked
// Checksum 0xdaaeca5d, Offset: 0x3180
// Size: 0x1a8
function private function_3d752709(enemy, target) {
    if (isdefined(enemy.knockdown) && enemy.knockdown) {
        return 0;
    }
    if (gibserverutils::isgibbed(enemy, 384)) {
        return 0;
    }
    if (distancesquared(enemy.origin, target.origin) > self ai::function_9139c839().var_ef908ac8 * self ai::function_9139c839().var_ef908ac8) {
        return 0;
    }
    facingvec = anglestoforward(target.angles);
    enemyvec = enemy.origin - target.origin;
    var_3e3c8075 = (enemyvec[0], enemyvec[1], 0);
    var_c2ee8451 = (facingvec[0], facingvec[1], 0);
    var_3e3c8075 = vectornormalize(var_3e3c8075);
    var_c2ee8451 = vectornormalize(var_c2ee8451);
    var_34e02165 = vectordot(var_c2ee8451, var_3e3c8075);
    if (var_34e02165 < 0) {
        return 0;
    }
    return 1;
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 5, eflags: 0x1 linked
// Checksum 0x9bba916f, Offset: 0x3330
// Size: 0xc4
function function_d645d2ec(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    if (isdefined(entity.locked_enemy)) {
        to_enemy = entity.locked_enemy.origin - entity.origin;
        angles_to_enemy = vectortoangles(to_enemy);
        entity orientmode("face angle", angles_to_enemy);
    } else {
        entity orientmode("face current");
    }
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 5, eflags: 0x1 linked
// Checksum 0x73163fb2, Offset: 0x3400
// Size: 0xe4
function function_f6bb8a07(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    if (isdefined(entity.track_enemy) && entity.track_enemy) {
        if (isdefined(entity.locked_enemy)) {
            to_enemy = entity.locked_enemy.origin - entity.origin;
            angles_to_enemy = vectortoangles(to_enemy);
            entity orientmode("face angle", angles_to_enemy);
        }
        return;
    }
    entity orientmode("face current");
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 5, eflags: 0x1 linked
// Checksum 0x6fbd2400, Offset: 0x34f0
// Size: 0x4c
function function_64c4573(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    entity orientmode("face default");
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 1, eflags: 0x5 linked
// Checksum 0x7cf130ae, Offset: 0x3548
// Size: 0x13a
function private function_c3c86ec1(entity) {
    hitent = entity melee();
    /#
        record3dtext("zombie_drop_powerups", self.origin, (1, 0, 0), "<unknown string>", entity);
    #/
    if (isdefined(hitent) && isplayer(hitent)) {
        entity function_376a5549(hitent);
        hitent clientfield::increment_to_player("gegenees_damage_cf");
    }
    if (isdefined(entity.var_d7e69143) && entity.var_d7e69143) {
        if (isdefined(entity.zombie_poi) && isdefined(entity.zombie_poi[1])) {
            entity.zombie_poi[1] notify(#"hash_90cfd38343f41f2");
        }
        entity.var_d7e69143 = 0;
    }
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 1, eflags: 0x5 linked
// Checksum 0xa583a576, Offset: 0x3690
// Size: 0xa4
function private function_376a5549(enemy) {
    forward = anglestoforward(self.angles);
    velocity = enemy getvelocity();
    push_strength = 500;
    push_strength = 200 + randomint(push_strength - 200);
    enemy setvelocity(velocity + forward * push_strength);
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 0, eflags: 0x5 linked
// Checksum 0x1a0c36f3, Offset: 0x3740
// Size: 0x276
function private supplypodtank() {
    self.var_126d7bef = 1;
    self.ignore_nuke = 1;
    if (!(isdefined(level.var_a2831281) && level.var_a2831281) && !zm_trial_special_enemy::is_active() && !zm_trial_force_archetypes::function_ff2a74e7(#"blight_father") && !(isdefined(level.var_f300b600) && level.var_f300b600)) {
        self.ignore_enemy_count = 1;
    }
    self.instakill_func = &zm_powerups::function_16c2586a;
    self.cant_move_cb = &zombiebehavior::function_79fe956f;
    self.closest_player_override = &zm_utility::function_c52e1749;
    self setblackboardattribute("_gegenees_shield", "shield_down");
    self setblackboardattribute("_locomotion_speed", "locomotion_speed_walk");
    self.zombie_move_speed = "walk";
    self collidewithactors(1);
    self.ignorepathenemyfightdist = 1;
    level thread zm_spawner::zombie_death_event(self);
    self.deathfunction = &zm_spawner::zombie_death_animscript;
    self thread zm_audio::zmbaivox_notifyconvert();
    self thread zm_audio::play_ambient_zombie_vocals();
    aiutility::addaioverridedamagecallback(self, &function_ca5688e3);
    self callback::on_ai_killed(&function_a231dd3b);
    target_set(self);
    self function_3f8833df();
    self.var_cc7959e1 = 1;
    self.var_a9716e54 = 0;
    self.var_c63e2811 = 0;
    self.var_68139d12 = 1;
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 0, eflags: 0x5 linked
// Checksum 0x6f58cdb2, Offset: 0x39c0
// Size: 0x94
function private function_3f8833df() {
    self attach("c_t8_zmb_dlc2_gegenees_shield", "tag_weapon_left");
    self attach("c_t8_zmb_dlc2_gegenees_sword", "tag_weapon_right");
    self attach("c_t8_zmb_dlc2_gegenees_helmet1", "j_head");
    self function_d06af584();
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 0, eflags: 0x1 linked
// Checksum 0xfa0d7768, Offset: 0x3a60
// Size: 0x9e
function function_59e9f77b() {
    if (isdefined(self.var_cc7959e1) && self.var_cc7959e1) {
        self clientfield::set("gegenees_spear_tip_effect", 0);
        var_1a3b2274 = "c_t8_zmb_dlc2_gegenees_spear";
        if (isdefined(self.var_e946c8e8) && self.var_e946c8e8) {
            var_1a3b2274 = "c_t8_zmb_dlc2_gegenees_spear_golden";
        }
        self detach(var_1a3b2274, "tag_inhand");
        self.var_cc7959e1 = 0;
    }
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 0, eflags: 0x1 linked
// Checksum 0xbe4bd0ab, Offset: 0x3b08
// Size: 0xa4
function function_d06af584() {
    if (!(isdefined(self.var_cc7959e1) && self.var_cc7959e1)) {
        var_1a3b2274 = "c_t8_zmb_dlc2_gegenees_spear";
        if (isdefined(self.var_e946c8e8) && self.var_e946c8e8) {
            var_1a3b2274 = "c_t8_zmb_dlc2_gegenees_spear_golden";
        }
        self attach(var_1a3b2274, "tag_inhand");
        self.var_cc7959e1 = 1;
        self clientfield::set("gegenees_spear_tip_effect", 1);
    }
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 12, eflags: 0x5 linked
// Checksum 0x20fa68a8, Offset: 0x3bb8
// Size: 0x568
function private function_ca5688e3(inflictor, attacker, damage, idflags, meansofdeath, weapon, point, dir, hitloc, offsettime, boneindex, modelindex) {
    if (isdefined(boneindex)) {
        bonename = getpartname(self, boneindex);
        if (bonename === "j_gegenees_shield") {
            if (isdefined(dir)) {
                playfx("impacts/fx8_bul_impact_metal_sm", point, dir * -1);
                if (isdefined(point)) {
                    playsoundatposition(#"hash_72db6f3f0e602a33", point);
                }
            }
            return 0;
        }
    }
    var_786d7e06 = zm_ai_utility::function_422fdfd4(self, attacker, weapon, boneindex, hitloc, point);
    var_dd54fdb1 = var_786d7e06.var_84ed9a13;
    var_88e794fb = var_786d7e06.registerzombie_bgb_used_reinforce;
    adjusted_damage = int(damage * var_786d7e06.damage_scale);
    if (isdefined(var_dd54fdb1)) {
        if (isdefined(var_dd54fdb1.var_8223b0cf) && var_dd54fdb1.var_8223b0cf > 0) {
            adjusted_damage = int(damage * var_786d7e06.damage_scale * var_dd54fdb1.var_8223b0cf);
        }
        if (var_88e794fb) {
            namespace_81245006::function_ef87b7e8(var_dd54fdb1, adjusted_damage);
            /#
                if (getdvarint(#"scr_weakpoint_debug", 0) > 0) {
                    iprintlnbold("<unknown string>" + var_dd54fdb1.health);
                }
            #/
            if (namespace_81245006::function_f29756fe(var_dd54fdb1) === 3) {
                /#
                    if (getdvarint(#"scr_weakpoint_debug", 0) > 0) {
                        iprintlnbold("<unknown string>");
                    }
                #/
                self destructserverutils::handledamage(inflictor, attacker, damage, idflags, meansofdeath, weapon, point, dir, hitloc, offsettime, boneindex, modelindex);
                if (var_dd54fdb1.hitloc === "helmet") {
                    var_465efe42 = namespace_81245006::function_37e3f011(self, "j_head", 2);
                    namespace_81245006::function_6c64ebd3(var_465efe42, 1);
                    self.var_d64b7af0 = 1;
                    if (self isattached("c_t8_zmb_dlc2_gegenees_helmet1", "j_head")) {
                        self detach("c_t8_zmb_dlc2_gegenees_helmet1", "j_head");
                    }
                    self clientfield::set("gegenees_helmet_explosion_cf", 1);
                }
                if (isdefined(var_dd54fdb1.var_641ce20e) && var_dd54fdb1.var_641ce20e) {
                    namespace_81245006::function_6742b846(self, var_dd54fdb1);
                }
            }
            if (var_dd54fdb1.type === #"armor") {
                attacker util::show_hit_marker(!isalive(self));
                if (isdefined(dir)) {
                    playfx("impacts/fx8_bul_impact_metal_sm", point, dir * -1);
                }
                return 0;
            } else if (isdefined(var_dd54fdb1.activebydefault) && var_dd54fdb1.activebydefault) {
                if (isdefined(dir)) {
                    playfx("zm_ai/fx8_gegenees_weakpoint_impact", point, dir * -1);
                }
            }
        }
    }
    if (!isdefined(self.shielddamage)) {
        self.shielddamage = adjusted_damage;
    } else {
        self.shielddamage = self.shielddamage + adjusted_damage;
    }
    self.var_a9716e54 = self.var_a9716e54 + adjusted_damage;
    if (self.var_a9716e54 >= 500) {
        self.var_a9716e54 = 0;
        self function_9a05389e();
    }
    return adjusted_damage;
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 1, eflags: 0x5 linked
// Checksum 0x15057bbf, Offset: 0x4128
// Size: 0x288
function private function_a231dd3b(s_params) {
    if (self.archetype != #"gegenees") {
        return;
    }
    if (!self zm_zonemgr::entity_in_active_zone()) {
        return;
    }
    n_time = gettime() / 1000;
    if (!isdefined(level.var_51c8013a)) {
        level.var_51c8013a = 0;
    }
    dt = n_time - level.var_51c8013a;
    if (dt < 180) {
        return;
    }
    self val::set(#"gegenees_death", "takedamage", 0);
    if (level flag::get("zombie_drop_powerups") && !zm_utility::is_standard() && !(isdefined(self.no_powerups) && self.no_powerups)) {
        var_67a1b262 = 1;
        if (isdefined(level.var_aebef29d)) {
            dt = n_time - level.var_aebef29d;
            if (dt < 360) {
                var_67a1b262 = 0;
            }
        }
        self.var_d0686fde = [];
        self.var_d0686fde[self.var_d0686fde.size] = #"fire_sale";
        self.var_d0686fde[self.var_d0686fde.size] = #"nuke";
        if (var_67a1b262) {
            self.var_d0686fde[self.var_d0686fde.size] = #"full_ammo";
            self.var_d0686fde[self.var_d0686fde.size] = #"full_ammo";
        }
        level.var_51c8013a = n_time;
        self.no_powerups = 1;
        level thread zm_powerups::specific_powerup_drop(self.var_d0686fde, self.origin, undefined, undefined, undefined, undefined, undefined, undefined, 0, 1);
    }
    if (!isplayer(s_params.eattacker)) {
        return;
    }
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 0, eflags: 0x1 linked
// Checksum 0x3a3499e1, Offset: 0x43b8
// Size: 0x16
function function_9a05389e() {
    self.var_c63e2811 = gettime() + 4000;
}

// Namespace zm_ai_gegenees/zm_ai_gegenees
// Params 0, eflags: 0x4
// Checksum 0x9651e635, Offset: 0x43d8
// Size: 0x278
function private function_c03e8d05() {
    /#
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        while (1) {
            waitframe(1);
            string = getdvarstring(#"hash_6e55ca7eb0bc5180", "<unknown string>");
            cmd = strtok(string, "<unknown string>");
            gegenees = getaiarchetypearray(#"gegenees");
            if (cmd.size > 0) {
                switch (cmd[0]) {
                case #"spawn":
                    zm_devgui::spawn_archetype("<unknown string>");
                    break;
                case #"kill":
                    zm_devgui::kill_archetype(#"gegenees");
                    break;
                case #"shield_attack":
                    if (isdefined(gegenees[0])) {
                        gegenees[0].var_89b5e1e = 1;
                    }
                    break;
                case #"stop_move":
                    if (isdefined(gegenees[0])) {
                        if (!isdefined(gegenees[0].devgui_stop_move)) {
                            gegenees[0].devgui_stop_move = 1;
                        } else {
                            gegenees[0].devgui_stop_move = !gegenees[0].devgui_stop_move;
                        }
                    }
                    break;
                default:
                    break;
                }
            }
            setdvar(#"hash_6e55ca7eb0bc5180", "<unknown string>");
        }
    #/
}

