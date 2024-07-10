#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\ai\archetype_tiger_interface.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\ai\systems\gib.gsc;
#using scripts\core_common\ai\systems\blackboard.gsc;
#using scripts\core_common\ai\systems\behavior_tree_utility.gsc;
#using scripts\core_common\ai\systems\behavior_state_machine.gsc;
#using scripts\core_common\ai\systems\animation_state_machine_utility.gsc;
#using scripts\core_common\ai\systems\animation_state_machine_notetracks.gsc;
#using scripts\core_common\ai\systems\animation_state_machine_mocomp.gsc;
#using scripts\core_common\ai\systems\ai_interface.gsc;

#namespace tigerbehavior;

// Namespace tigerbehavior
// Method(s) 2 Total 2
class class_c40841ac {

    var adjustmentstarted;
    var var_425c4c8b;

    // Namespace class_c40841ac/archetype_tiger
    // Params 0, eflags: 0x9 linked
    // Checksum 0x3a3aeb3f, Offset: 0x2cd0
    // Size: 0x1a
    constructor() {
        adjustmentstarted = 0;
        var_425c4c8b = 1;
    }

}

// Namespace tigerbehavior/archetype_tiger
// Params 0, eflags: 0x2
// Checksum 0xa84ab852, Offset: 0x390
// Size: 0xa7c
function autoexec registerbehaviorscriptfunctions() {
    spawner::add_archetype_spawn_function(#"tiger", &function_1637910a);
    assert(isscriptfunctionptr(&tigertargetservice));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"tigertargetservice", &tigertargetservice);
    assert(isscriptfunctionptr(&tigershouldmelee));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"tigershouldmelee", &tigershouldmelee);
    assert(isscriptfunctionptr(&tigershouldmelee));
    behaviorstatemachine::registerbsmscriptapiinternal(#"tigershouldmelee", &tigershouldmelee);
    assert(isscriptfunctionptr(&function_6dc4602d));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_761781d8d1315760", &function_6dc4602d);
    assert(isscriptfunctionptr(&function_6dc4602d));
    behaviorstatemachine::registerbsmscriptapiinternal(#"hash_761781d8d1315760", &function_6dc4602d);
    assert(isscriptfunctionptr(&function_36b5df8c));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_121b237a33ad1e99", &function_36b5df8c);
    assert(isscriptfunctionptr(&function_36b5df8c));
    behaviorstatemachine::registerbsmscriptapiinternal(#"hash_121b237a33ad1e99", &function_36b5df8c);
    assert(isscriptfunctionptr(&function_fdde7116));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6263cd4f7b34692e", &function_fdde7116);
    assert(isscriptfunctionptr(&function_fdde7116));
    behaviorstatemachine::registerbsmscriptapiinternal(#"hash_6263cd4f7b34692e", &function_fdde7116);
    assert(isscriptfunctionptr(&function_66063225));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4068cafe20c75854", &function_66063225);
    assert(isscriptfunctionptr(&function_66063225));
    behaviorstatemachine::registerbsmscriptapiinternal(#"hash_4068cafe20c75854", &function_66063225);
    assert(!isdefined(&function_e0f73303) || isscriptfunctionptr(&function_e0f73303));
    assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
    assert(!isdefined(&function_351bcb1b) || isscriptfunctionptr(&function_351bcb1b));
    behaviortreenetworkutility::registerbehaviortreeaction(#"hash_374d5c1343974286", &function_e0f73303, undefined, &function_351bcb1b);
    assert(!isdefined(&function_37e8c141) || isscriptfunctionptr(&function_37e8c141));
    assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
    assert(!isdefined(&function_4c2b7bad) || isscriptfunctionptr(&function_4c2b7bad));
    behaviortreenetworkutility::registerbehaviortreeaction(#"hash_2e58caee41c5d7a1", &function_37e8c141, undefined, &function_4c2b7bad);
    assert(!isdefined(&function_d65e3f15) || isscriptfunctionptr(&function_d65e3f15));
    assert(!isdefined(&p8_usa_farm_tools_hoe_lod2_s1_geo_rigid_bs_7cqeqf2k2nw2binsrm67nqzdzf) || isscriptfunctionptr(&p8_usa_farm_tools_hoe_lod2_s1_geo_rigid_bs_7cqeqf2k2nw2binsrm67nqzdzf));
    assert(!isdefined(&function_4fc73b37) || isscriptfunctionptr(&function_4fc73b37));
    behaviortreenetworkutility::registerbehaviortreeaction(#"hash_167c243dad6945a8", &function_d65e3f15, &p8_usa_farm_tools_hoe_lod2_s1_geo_rigid_bs_7cqeqf2k2nw2binsrm67nqzdzf, &function_4fc73b37);
    assert(isscriptfunctionptr(&function_40b8200d));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6d3bf729ded27272", &function_40b8200d);
    assert(isscriptfunctionptr(&function_1055f5e7));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_595b57a789c88ad7", &function_1055f5e7);
    animationstatenetwork::registeranimationmocomp("mocomp_tiger_pounce", &function_a4f5b046, &function_2e8439bf, &function_7467b3c0);
    animationstatenetwork::registeranimationmocomp("mocomp_tiger_melee", &function_5543b423, &function_345c8845, &function_933e34b9);
    animationstatenetwork::registeranimationmocomp("mocomp_tiger_run_melee", &function_c0d6be15, &function_dc8e2d7d, undefined);
    animationstatenetwork::registernotetrackhandlerfunction("tiger_melee_left", &function_8ad0c889);
    animationstatenetwork::registernotetrackhandlerfunction("tiger_melee_right", &function_33958f06);
    animationstatenetwork::registernotetrackhandlerfunction("tiger_pounce", &function_5ee65256);
    tigerinterface::registertigerinterfaceattributes();
    /#
        if (isarchetypeloaded(#"tiger")) {
            level thread function_1e4eb5f0();
        }
    #/
}

// Namespace tigerbehavior/archetype_tiger
// Params 0, eflags: 0x1 linked
// Checksum 0xa4991587, Offset: 0xe18
// Size: 0xc4
function function_1637910a() {
    blackboard::createblackboardforentity(self);
    ai::createinterfaceforentity(self);
    self.___archetypeonanimscriptedcallback = &function_e235da7d;
    blackboard::registerblackboardattribute(self, "_should_run", "walk", &bb_getshouldrunstatus);
    blackboard::registerblackboardattribute(self, "_should_howl", "dont_howl", &bb_getshouldhowlstatus);
    self function_8747b993();
}

// Namespace tigerbehavior/archetype_tiger
// Params 0, eflags: 0x1 linked
// Checksum 0x98e53de4, Offset: 0xee8
// Size: 0x16
function function_8747b993() {
    self.var_86152978 = gettime() + 15000;
}

// Namespace tigerbehavior/archetype_tiger
// Params 1, eflags: 0x5 linked
// Checksum 0xcb33ab9c, Offset: 0xf08
// Size: 0x2c
function private function_e235da7d(entity) {
    entity.__blackboard = undefined;
    entity function_1637910a();
}

// Namespace tigerbehavior/archetype_tiger
// Params 0, eflags: 0x1 linked
// Checksum 0x7500bc9e, Offset: 0xf40
// Size: 0x92
function bb_getshouldrunstatus() {
    /#
        if (isdefined(self.ispuppet) && self.ispuppet) {
            return "<dev string:x38>";
        }
    #/
    if (isdefined(self.hasseenfavoriteenemy) && self.hasseenfavoriteenemy || ai::hasaiattribute(self, "sprint") && ai::getaiattribute(self, "sprint")) {
        return "run";
    }
    return "walk";
}

// Namespace tigerbehavior/archetype_tiger
// Params 0, eflags: 0x1 linked
// Checksum 0xa75ff859, Offset: 0xfe0
// Size: 0xc2
function bb_getshouldhowlstatus() {
    if (self ai::has_behavior_attribute("howl_chance") && isdefined(self.hasseenfavoriteenemy) && self.hasseenfavoriteenemy) {
        if (!isdefined(self.shouldhowl)) {
            chance = self ai::get_behavior_attribute("howl_chance");
            self.shouldhowl = randomfloat(1) <= chance;
        }
        if (self.shouldhowl) {
            return "howl";
        } else {
            return "dont_howl";
        }
    }
    return "dont_howl";
}

// Namespace tigerbehavior/archetype_tiger
// Params 1, eflags: 0x1 linked
// Checksum 0xd0638e7d, Offset: 0x10b0
// Size: 0x40
function getyaw(org) {
    angles = vectortoangles(org - self.origin);
    return angles[1];
}

// Namespace tigerbehavior/archetype_tiger
// Params 0, eflags: 0x1 linked
// Checksum 0x7cf9b2aa, Offset: 0x10f8
// Size: 0x92
function absyawtoenemy() {
    assert(isdefined(self.enemy));
    yaw = self.angles[1] - getyaw(self.enemy.origin);
    yaw = angleclamp180(yaw);
    if (yaw < 0) {
        yaw = -1 * yaw;
    }
    return yaw;
}

// Namespace tigerbehavior/archetype_tiger
// Params 0, eflags: 0x1 linked
// Checksum 0xc84557cc, Offset: 0x1198
// Size: 0x212
function need_to_run() {
    run_dist_squared = self ai::get_behavior_attribute("min_run_dist") * self ai::get_behavior_attribute("min_run_dist");
    run_yaw = 20;
    run_pitch = 30;
    run_height = 64;
    if (self.health < self.maxhealth) {
        return true;
    }
    if (!isdefined(self.enemy) || !isalive(self.enemy)) {
        return false;
    }
    if (!self cansee(self.enemy)) {
        return false;
    }
    dist = distancesquared(self.origin, self.enemy.origin);
    if (dist > run_dist_squared) {
        return false;
    }
    height = self.origin[2] - self.enemy.origin[2];
    if (abs(height) > run_height) {
        return false;
    }
    yaw = self absyawtoenemy();
    if (yaw > run_yaw) {
        return false;
    }
    pitch = angleclamp180(vectortoangles(self.origin - self.enemy.origin)[0]);
    if (abs(pitch) > run_pitch) {
        return false;
    }
    return true;
}

// Namespace tigerbehavior/archetype_tiger
// Params 2, eflags: 0x5 linked
// Checksum 0x5b23945a, Offset: 0x13b8
// Size: 0x1e4
function private is_target_valid(tiger, target) {
    if (!isdefined(target)) {
        return 0;
    }
    if (!isalive(target)) {
        return 0;
    }
    if (!(tiger.team == #"allies")) {
        if (!isplayer(target) && sessionmodeiszombiesgame()) {
            return 0;
        }
        if (isdefined(target.is_zombie) && target.is_zombie == 1) {
            return 0;
        }
    }
    if (isplayer(target) && target.sessionstate == "spectator") {
        return 0;
    }
    if (isplayer(target) && target.sessionstate == "intermission") {
        return 0;
    }
    if (isdefined(self.intermission) && self.intermission) {
        return 0;
    }
    if (isdefined(target.ignoreme) && target.ignoreme) {
        return 0;
    }
    if (target isnotarget()) {
        return 0;
    }
    if (tiger.team === target.team) {
        return 0;
    }
    if (isplayer(target) && isdefined(level.is_player_valid_override)) {
        return [[ level.is_player_valid_override ]](target);
    }
    return 1;
}

// Namespace tigerbehavior/archetype_tiger
// Params 1, eflags: 0x5 linked
// Checksum 0x4132b27b, Offset: 0x15a8
// Size: 0x258
function private get_favorite_enemy(tiger) {
    var_7c746996 = [];
    if (sessionmodeiszombiesgame()) {
        if (self.team == #"allies") {
            var_7c746996 = getaiteamarray(level.zombie_team);
        } else {
            var_7c746996 = getplayers();
        }
    } else {
        var_7c746996 = arraycombine(getplayers(), getaiarray(), 0, 0);
    }
    least_hunted = var_7c746996[0];
    closest_target_dist_squared = undefined;
    for (i = 0; i < var_7c746996.size; i++) {
        if (!isdefined(var_7c746996[i].hunted_by)) {
            var_7c746996[i].hunted_by = 0;
        }
        if (!is_target_valid(tiger, var_7c746996[i])) {
            continue;
        }
        if (!is_target_valid(tiger, least_hunted)) {
            least_hunted = var_7c746996[i];
        }
        dist_squared = distancesquared(tiger.origin, var_7c746996[i].origin);
        if (var_7c746996[i].hunted_by <= least_hunted.hunted_by && (!isdefined(closest_target_dist_squared) || dist_squared < closest_target_dist_squared)) {
            least_hunted = var_7c746996[i];
            closest_target_dist_squared = dist_squared;
        }
    }
    if (!is_target_valid(tiger, least_hunted)) {
        return undefined;
    }
    least_hunted.hunted_by += 1;
    return least_hunted;
}

// Namespace tigerbehavior/archetype_tiger
// Params 0, eflags: 0x1 linked
// Checksum 0x6509db1, Offset: 0x1808
// Size: 0x2e
function get_last_valid_position() {
    if (isplayer(self)) {
        return self.last_valid_position;
    }
    return self.origin;
}

// Namespace tigerbehavior/archetype_tiger
// Params 1, eflags: 0x1 linked
// Checksum 0xab6c933b, Offset: 0x1840
// Size: 0x23a
function get_locomotion_target(behaviortreeentity) {
    last_valid_position = behaviortreeentity.favoriteenemy get_last_valid_position();
    if (!isdefined(last_valid_position)) {
        return undefined;
    }
    locomotion_target = last_valid_position;
    if (ai::has_behavior_attribute("spacing_value")) {
        spacing_near_dist = ai::get_behavior_attribute("spacing_near_dist");
        spacing_far_dist = ai::get_behavior_attribute("spacing_far_dist");
        spacing_horz_dist = ai::get_behavior_attribute("spacing_horz_dist");
        spacing_value = ai::get_behavior_attribute("spacing_value");
        to_enemy = behaviortreeentity.favoriteenemy.origin - behaviortreeentity.origin;
        perp = vectornormalize((to_enemy[1] * -1, to_enemy[0], 0));
        offset = perp * spacing_horz_dist * spacing_value;
        spacing_dist = math::clamp(length(to_enemy), spacing_near_dist, spacing_far_dist);
        lerp_amount = math::clamp((spacing_dist - spacing_near_dist) / (spacing_far_dist - spacing_near_dist), 0, 1);
        desired_point = last_valid_position + offset * lerp_amount;
        desired_point = getclosestpointonnavmesh(desired_point, spacing_horz_dist * 1.2, 16);
        if (isdefined(desired_point)) {
            locomotion_target = desired_point;
        }
    }
    return locomotion_target;
}

// Namespace tigerbehavior/archetype_tiger
// Params 1, eflags: 0x1 linked
// Checksum 0xa31addfd, Offset: 0x1a88
// Size: 0x3ea
function tigertargetservice(behaviortreeentity) {
    if (isdefined(level.intermission) && level.intermission) {
        behaviortreeentity clearpath();
        return;
    }
    /#
        if (isdefined(behaviortreeentity.ispuppet) && behaviortreeentity.ispuppet) {
            return;
        }
    #/
    if (behaviortreeentity.ignoreall || behaviortreeentity.pacifist || isdefined(behaviortreeentity.favoriteenemy) && !is_target_valid(behaviortreeentity, behaviortreeentity.favoriteenemy)) {
        if (isdefined(behaviortreeentity.favoriteenemy) && isdefined(behaviortreeentity.favoriteenemy.hunted_by) && behaviortreeentity.favoriteenemy.hunted_by > 0) {
            behaviortreeentity.favoriteenemy.hunted_by--;
        }
        behaviortreeentity.favoriteenemy = undefined;
        behaviortreeentity.hasseenfavoriteenemy = 0;
        behaviortreeentity setblackboardattribute("_seen_enemy", "hasnt_seen");
        if (!behaviortreeentity.ignoreall) {
            behaviortreeentity setgoal(behaviortreeentity.origin);
        }
        return;
    }
    if ((!sessionmodeiszombiesgame() || behaviortreeentity.team == #"allies") && !is_target_valid(behaviortreeentity, behaviortreeentity.favoriteenemy)) {
        behaviortreeentity.favoriteenemy = get_favorite_enemy(behaviortreeentity);
    }
    if (!(isdefined(behaviortreeentity.hasseenfavoriteenemy) && behaviortreeentity.hasseenfavoriteenemy)) {
        if (isdefined(behaviortreeentity.favoriteenemy) && behaviortreeentity need_to_run()) {
            behaviortreeentity.hasseenfavoriteenemy = 1;
            behaviortreeentity setblackboardattribute("_seen_enemy", "has_seen");
        }
    }
    if (isdefined(behaviortreeentity.favoriteenemy)) {
        if (isdefined(level.enemy_location_override_func)) {
            goalpos = [[ level.enemy_location_override_func ]](behaviortreeentity, behaviortreeentity.favoriteenemy);
            if (isdefined(goalpos)) {
                behaviortreeentity setgoal(goalpos);
                return;
            }
        }
        locomotion_target = get_locomotion_target(behaviortreeentity);
        if (isdefined(locomotion_target)) {
            repathdist = 16;
            if (!isdefined(behaviortreeentity.lasttargetposition) || distancesquared(behaviortreeentity.lasttargetposition, locomotion_target) > repathdist * repathdist || !behaviortreeentity haspath()) {
                navmesh_point = getclosestpointonnavmesh(locomotion_target, 128, 54);
                if (isdefined(navmesh_point)) {
                    behaviortreeentity function_a57c34b7(navmesh_point);
                    behaviortreeentity.lasttargetposition = locomotion_target;
                }
            }
        }
    }
}

// Namespace tigerbehavior/archetype_tiger
// Params 1, eflags: 0x1 linked
// Checksum 0x793dd5f8, Offset: 0x1e80
// Size: 0x13a
function function_8de56915(melee_range) {
    if (self.ignoreall || !is_target_valid(self, self.favoriteenemy)) {
        return false;
    }
    if (distancesquared(self.origin, self.favoriteenemy.origin) > melee_range) {
        return false;
    }
    z_diff = abs(self.origin[2] - self.favoriteenemy.origin[2]);
    if (z_diff > 42) {
        return false;
    }
    yawtoenemy = angleclamp180(self.angles[1] - vectortoangles(self.favoriteenemy.origin - self.origin)[1]);
    if (abs(yawtoenemy) > 60) {
        return false;
    }
    return true;
}

// Namespace tigerbehavior/archetype_tiger
// Params 1, eflags: 0x1 linked
// Checksum 0xf570f91e, Offset: 0x1fc8
// Size: 0x36
function tigershouldmelee(behaviortreeentity) {
    if (!behaviortreeentity function_8de56915(102 * 102)) {
        return false;
    }
    return true;
}

// Namespace tigerbehavior/archetype_tiger
// Params 1, eflags: 0x1 linked
// Checksum 0xe14d246b, Offset: 0x2008
// Size: 0x126
function function_6dc4602d(behaviortreeentity) {
    if (!behaviortreeentity function_8de56915(180 * 180)) {
        return false;
    }
    if (!behaviortreeentity cansee(behaviortreeentity.favoriteenemy)) {
        return false;
    }
    if (distancesquared(behaviortreeentity.origin, behaviortreeentity.favoriteenemy.origin) < 40 * 40) {
        return true;
    }
    if (!tracepassedonnavmesh(behaviortreeentity.origin, isdefined(behaviortreeentity.favoriteenemy.last_valid_position) ? behaviortreeentity.favoriteenemy.last_valid_position : behaviortreeentity.favoriteenemy.origin, behaviortreeentity.favoriteenemy getpathfindingradius())) {
        return false;
    }
    return true;
}

// Namespace tigerbehavior/archetype_tiger
// Params 1, eflags: 0x1 linked
// Checksum 0xad725e24, Offset: 0x2138
// Size: 0x1bc
function function_36b5df8c(behaviortreeentity) {
    if (behaviortreeentity.ignoreall || !is_target_valid(behaviortreeentity, behaviortreeentity.favoriteenemy)) {
        return false;
    }
    if (gettime() <= self.var_86152978) {
        return false;
    }
    enemydistsq = distancesquared(behaviortreeentity.origin, behaviortreeentity.favoriteenemy.origin);
    if (enemydistsq < 128 * 128) {
        return false;
    }
    offset = behaviortreeentity.favoriteenemy.origin - vectornormalize(behaviortreeentity.favoriteenemy.origin - behaviortreeentity.origin) * 36;
    if (enemydistsq < 256 * 256) {
        if (behaviortreeentity maymovetopoint(offset, 1, 1)) {
            yawtoenemy = angleclamp180(behaviortreeentity.angles[1] - vectortoangles(behaviortreeentity.favoriteenemy.origin - behaviortreeentity.origin)[1]);
            if (abs(yawtoenemy) <= 80) {
                return true;
            }
        }
    }
    return false;
}

// Namespace tigerbehavior/archetype_tiger
// Params 1, eflags: 0x1 linked
// Checksum 0x1dcbb088, Offset: 0x2300
// Size: 0x24
function function_fdde7116(behaviortreeentity) {
    return bb_getshouldrunstatus() == "walk";
}

// Namespace tigerbehavior/archetype_tiger
// Params 1, eflags: 0x1 linked
// Checksum 0xbfd39178, Offset: 0x2330
// Size: 0x4c
function function_66063225(behaviortreeentity) {
    if (isdefined(behaviortreeentity.aat_turned) && behaviortreeentity.aat_turned) {
        return true;
    }
    return bb_getshouldrunstatus() == "run";
}

// Namespace tigerbehavior/archetype_tiger
// Params 0, eflags: 0x1 linked
// Checksum 0xfc196f7d, Offset: 0x2388
// Size: 0x16e
function use_low_attack() {
    if (!isdefined(self.enemy) || !isplayer(self.enemy)) {
        return false;
    }
    height_diff = self.enemy.origin[2] - self.origin[2];
    low_enough = 30;
    if (height_diff < low_enough && self.enemy getstance() == "prone") {
        return true;
    }
    melee_origin = (self.origin[0], self.origin[1], self.origin[2] + 65);
    enemy_origin = (self.enemy.origin[0], self.enemy.origin[1], self.enemy.origin[2] + 32);
    if (!bullettracepassed(melee_origin, enemy_origin, 0, self)) {
        return true;
    }
    return false;
}

// Namespace tigerbehavior/archetype_tiger
// Params 2, eflags: 0x1 linked
// Checksum 0x799fed2e, Offset: 0x2500
// Size: 0xb8
function function_e0f73303(behaviortreeentity, asmstatename) {
    behaviortreeentity pathmode("dont move", 1);
    context = "high";
    if (behaviortreeentity use_low_attack()) {
        context = "low";
    }
    behaviortreeentity setblackboardattribute("_context", context);
    behaviortreeentity.meleetype = "normal";
    animationstatenetworkutility::requeststate(behaviortreeentity, asmstatename);
    return 5;
}

// Namespace tigerbehavior/archetype_tiger
// Params 2, eflags: 0x1 linked
// Checksum 0x5b64e65f, Offset: 0x25c0
// Size: 0x62
function function_351bcb1b(behaviortreeentity, asmstatename) {
    behaviortreeentity setblackboardattribute("_context", undefined);
    behaviortreeentity pathmode("move allowed");
    behaviortreeentity.meleetype = undefined;
    return 4;
}

// Namespace tigerbehavior/archetype_tiger
// Params 2, eflags: 0x1 linked
// Checksum 0xceb88ced, Offset: 0x2630
// Size: 0xa8
function function_37e8c141(behaviortreeentity, asmstatename) {
    behaviortreeentity pathmode("dont move", 1);
    context = "high";
    if (behaviortreeentity use_low_attack()) {
        context = "low";
    }
    behaviortreeentity setblackboardattribute("_context", context);
    animationstatenetworkutility::requeststate(behaviortreeentity, asmstatename);
    return 5;
}

// Namespace tigerbehavior/archetype_tiger
// Params 2, eflags: 0x1 linked
// Checksum 0x152d4c73, Offset: 0x26e0
// Size: 0x58
function function_4c2b7bad(behaviortreeentity, asmstatename) {
    behaviortreeentity setblackboardattribute("_context", undefined);
    behaviortreeentity pathmode("move allowed");
    return 4;
}

// Namespace tigerbehavior/archetype_tiger
// Params 2, eflags: 0x5 linked
// Checksum 0xe79ec5b2, Offset: 0x2740
// Size: 0x56
function private function_d65e3f15(entity, asmstatename) {
    animationstatenetworkutility::requeststate(entity, asmstatename);
    function_40b8200d(entity);
    entity.hit_ent = 0;
    return 5;
}

// Namespace tigerbehavior/archetype_tiger
// Params 2, eflags: 0x5 linked
// Checksum 0x556a9cd9, Offset: 0x27a0
// Size: 0x2b8
function private p8_usa_farm_tools_hoe_lod2_s1_geo_rigid_bs_7cqeqf2k2nw2binsrm67nqzdzf(entity, asmstatename) {
    if (entity asmgetstatus() == "asm_status_complete") {
        return 4;
    }
    if (entity.hit_ent || !isdefined(entity.favoriteenemy) || !(isdefined(entity.var_47c91780) && entity.var_47c91780)) {
        return 5;
    }
    if (function_ef12c1d9(entity)) {
        /#
            record3dtext("<dev string:x3e>", self.origin, (1, 0, 0), "<dev string:x4e>", entity);
        #/
        entity.hit_ent = 1;
        return 5;
    }
    eye_pos = entity util::get_eye();
    enemy_eye_pos = entity.favoriteenemy util::get_eye();
    if (distancesquared(eye_pos, enemy_eye_pos) > entity.meleeweapon.aimeleerange * entity.meleeweapon.aimeleerange) {
        return 5;
    }
    trace = physicstrace(eye_pos, enemy_eye_pos, (-15, -15, -15), (15, 15, 15), self);
    if (trace[#"fraction"] < 1) {
        hit_ent = trace[#"entity"];
    }
    entity.hit_ent = isdefined(hit_ent);
    if (isdefined(hit_ent)) {
        hit_ent dodamage(100, hit_ent.origin, entity);
        hit_ent notify(#"hash_53620e40c7e139b9");
    }
    if (isdefined(level.var_d0febd99)) {
        entity [[ level.var_d0febd99 ]]("tiger_melee_left", hit_ent);
    }
    if (isdefined(level.var_19e8a451)) {
        entity [[ level.var_19e8a451 ]](entity.favoriteenemy, entity.hit_ent);
    }
    return 5;
}

// Namespace tigerbehavior/archetype_tiger
// Params 2, eflags: 0x5 linked
// Checksum 0x3c8d3b57, Offset: 0x2a60
// Size: 0x80
function private function_4fc73b37(entity, asmstatename) {
    function_1055f5e7(entity);
    entity.hit_ent = undefined;
    entity.var_cc94acec = 0;
    entity.var_b11272e3 = 0;
    entity.var_aaeee932 = undefined;
    entity.var_4dc477c = 1;
    entity thread function_39fd9a43();
    return 4;
}

// Namespace tigerbehavior/archetype_tiger
// Params 0, eflags: 0x5 linked
// Checksum 0xd162efb2, Offset: 0x2ae8
// Size: 0x42
function private function_39fd9a43() {
    self notify("55a4d4707a42299b");
    self endon("55a4d4707a42299b");
    self endon(#"death");
    wait(4);
    self.var_4dc477c = 0;
}

// Namespace tigerbehavior/archetype_tiger
// Params 1, eflags: 0x1 linked
// Checksum 0xd57a285e, Offset: 0x2b38
// Size: 0x4c
function function_40b8200d(entity) {
    entity.var_fabc1520 = 1;
    self function_8747b993();
    entity pathmode("dont move", 1);
}

// Namespace tigerbehavior/archetype_tiger
// Params 1, eflags: 0x1 linked
// Checksum 0x31d70612, Offset: 0x2b90
// Size: 0x4c
function function_1055f5e7(entity) {
    entity.var_fabc1520 = 0;
    self function_8747b993();
    entity pathmode("move allowed");
}

// Namespace tigerbehavior/archetype_tiger
// Params 4, eflags: 0x1 linked
// Checksum 0xe91caccb, Offset: 0x2be8
// Size: 0x44
function function_c0b7f4ce(entity, attribute, oldvalue, value) {
    entity setblackboardattribute("_low_gravity", value);
}

// Namespace tigerbehavior/archetype_tiger
// Params 2, eflags: 0x1 linked
// Checksum 0xa5274d3e, Offset: 0x2c38
// Size: 0x8c
function function_1b7345aa(tiger, entity) {
    forward = anglestoforward(tiger.angles);
    to_enemy = vectornormalize(entity.origin - tiger.origin);
    return vectordot(forward, to_enemy) >= 0.966;
}

// Namespace tigerbehavior/archetype_tiger
// Params 5, eflags: 0x1 linked
// Checksum 0x58b8c2c6, Offset: 0x2d98
// Size: 0x3d4
function function_a4f5b046(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    entity animmode("gravity", 1);
    entity orientmode("face angle", entity.angles[1]);
    entity.blockingpain = 1;
    entity.var_5dd07a80 = 1;
    entity.var_c2986b66 = 1;
    entity.usegoalanimweight = 1;
    entity pathmode("dont move");
    entity collidewithactors(0);
    entity.var_47c91780 = 0;
    entity.var_b736fc8b = 1;
    entity.var_ce44ec9f = getnotetracktimes(mocompanim, "start_trace")[0];
    entity.minigun_killstreak_minigun_inbound = getnotetracktimes(mocompanim, "stop_trace")[0];
    if (isdefined(entity.enemy)) {
        dirtoenemy = vectornormalize(entity.enemy.origin - entity.origin);
        entity forceteleport(entity.origin, vectortoangles(dirtoenemy));
    }
    if (!isdefined(self.meleeinfo)) {
        self.meleeinfo = new class_c40841ac();
        self.meleeinfo.var_9bfa8497 = entity.origin;
        self.meleeinfo.var_98bc84b7 = getnotetracktimes(mocompanim, "start_procedural")[0];
        self.meleeinfo.var_6392c3a2 = getnotetracktimes(mocompanim, "stop_procedural")[0];
        var_2401d30a = getnotetracktimes(mocompanim, "stop_procedural_distance_check")[0];
        var_e397f54c = getmovedelta(mocompanim, 0, isdefined(var_2401d30a) ? var_2401d30a : 1, entity);
        self.meleeinfo.var_cb28f380 = entity localtoworldcoords(var_e397f54c);
        /#
            movedelta = getmovedelta(mocompanim, 0, 1, entity);
            animendpos = entity localtoworldcoords(movedelta);
            distance = distance(entity.origin, animendpos);
            recordcircle(animendpos, 3, (0, 1, 0), "<dev string:x57>");
            record3dtext("<dev string:x60>" + distance, animendpos, (0, 1, 0), "<dev string:x57>");
        #/
    }
}

// Namespace tigerbehavior/archetype_tiger
// Params 5, eflags: 0x1 linked
// Checksum 0x2f4a36b5, Offset: 0x3178
// Size: 0xa3c
function function_2e8439bf(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    assert(isdefined(self.meleeinfo));
    currentanimtime = entity getanimtime(mocompanim);
    if (currentanimtime >= self.var_ce44ec9f && currentanimtime <= self.minigun_killstreak_minigun_inbound) {
        self.var_47c91780 = 1;
    } else {
        self.var_47c91780 = 0;
    }
    if (isdefined(self.enemy) && !self.meleeinfo.adjustmentstarted && self.meleeinfo.var_425c4c8b && currentanimtime >= self.meleeinfo.var_98bc84b7) {
        predictedenemypos = entity.enemy.origin;
        if (isplayer(entity.enemy)) {
            velocity = entity.enemy getvelocity();
            if (length(velocity) >= 0) {
                predictedenemypos += vectorscale(velocity, 0.25);
            }
        }
        var_83fd29ee = vectornormalize(predictedenemypos - entity.origin);
        var_1efb2395 = predictedenemypos - var_83fd29ee * entity getpathfindingradius();
        self.meleeinfo.adjustedendpos = var_1efb2395;
        var_776ddabf = distancesquared(self.meleeinfo.var_cb28f380, self.meleeinfo.adjustedendpos);
        var_65cbfb52 = distancesquared(self.meleeinfo.var_9bfa8497, self.meleeinfo.adjustedendpos);
        if (var_776ddabf <= 35 * 35) {
            /#
                record3dtext("<dev string:x63>", entity.origin + (0, 0, 60), (1, 0, 0), "<dev string:x57>");
            #/
            self.meleeinfo.var_425c4c8b = 0;
        } else if (var_65cbfb52 <= 200 * 200) {
            /#
                record3dtext("<dev string:x70>", entity.origin + (0, 0, 60), (1, 0, 0), "<dev string:x57>");
            #/
            self.meleeinfo.var_425c4c8b = 0;
        } else if (var_65cbfb52 >= 400 * 400) {
            /#
                record3dtext("<dev string:x7e>", entity.origin + (0, 0, 60), (1, 0, 0), "<dev string:x57>");
            #/
            self.meleeinfo.var_425c4c8b = 0;
        }
        if (self.meleeinfo.var_425c4c8b) {
            var_776ddabf = distancesquared(self.meleeinfo.var_cb28f380, self.meleeinfo.adjustedendpos);
            myforward = anglestoforward(self.angles);
            var_1c3641f2 = (entity.enemy.origin[0], entity.enemy.origin[1], entity.origin[2]);
            dirtoenemy = vectornormalize(var_1c3641f2 - entity.origin);
            zdiff = self.meleeinfo.var_cb28f380[2] - entity.enemy.origin[2];
            withinzrange = abs(zdiff) <= 30;
            withinfov = vectordot(myforward, dirtoenemy) > cos(30);
            var_7948b2f3 = withinzrange && withinfov;
            isvisible = bullettracepassed(entity.origin, entity.enemy.origin, 0, self);
            var_425c4c8b = isvisible && var_7948b2f3;
            /#
                reasons = "<dev string:x8c>" + isvisible + "<dev string:x93>" + withinzrange + "<dev string:x99>" + withinfov;
                if (var_425c4c8b) {
                    record3dtext(reasons, entity.origin + (0, 0, 60), (0, 1, 0), "<dev string:x57>");
                } else {
                    record3dtext(reasons, entity.origin + (0, 0, 60), (1, 0, 0), "<dev string:x57>");
                }
            #/
            if (var_425c4c8b) {
                var_90c3cdd2 = length(self.meleeinfo.adjustedendpos - self.meleeinfo.var_cb28f380);
                timestep = function_60d95f53();
                animlength = getanimlength(mocompanim) * 1000;
                starttime = self.meleeinfo.var_98bc84b7 * animlength;
                stoptime = self.meleeinfo.var_6392c3a2 * animlength;
                starttime = floor(starttime / timestep);
                stoptime = floor(stoptime / timestep);
                adjustduration = stoptime - starttime;
                self.meleeinfo.var_10b8b6d1 = vectornormalize(self.meleeinfo.adjustedendpos - self.meleeinfo.var_cb28f380);
                self.meleeinfo.var_8b9a15a6 = var_90c3cdd2 / adjustduration;
                self.meleeinfo.var_425c4c8b = 1;
                self.meleeinfo.adjustmentstarted = 1;
                self allowpitchangle(0);
                self clearpitchorient();
            } else {
                self.meleeinfo.var_425c4c8b = 0;
            }
        }
    }
    if (self.meleeinfo.adjustmentstarted && currentanimtime <= self.meleeinfo.var_6392c3a2) {
        assert(isdefined(self.meleeinfo.var_10b8b6d1) && isdefined(self.meleeinfo.var_8b9a15a6));
        /#
            recordsphere(self.meleeinfo.var_cb28f380, 3, (0, 1, 0), "<dev string:x57>");
            recordsphere(self.meleeinfo.adjustedendpos, 3, (0, 0, 1), "<dev string:x57>");
        #/
        adjustedorigin = entity.origin + entity.meleeinfo.var_10b8b6d1 * self.meleeinfo.var_8b9a15a6;
    }
    if (isdefined(entity.favoriteenemy) && distancesquared(entity.favoriteenemy.origin, entity.origin) <= 64 * 64 && function_1b7345aa(entity, entity.favoriteenemy)) {
        entity animmode("angle deltas");
        return;
    }
    entity animmode("gravity");
    if (isdefined(adjustedorigin)) {
        entity forceteleport(adjustedorigin);
    }
}

// Namespace tigerbehavior/archetype_tiger
// Params 5, eflags: 0x1 linked
// Checksum 0x7ae6da2b, Offset: 0x3bc0
// Size: 0x104
function function_7467b3c0(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    entity.blockingpain = 0;
    entity.var_5dd07a80 = undefined;
    entity.var_c2986b66 = undefined;
    entity.usegoalanimweight = 0;
    entity pathmode("move allowed");
    entity orientmode("face default");
    entity collidewithactors(1);
    entity.var_b736fc8b = 0;
    entity.meleeinfo = undefined;
    entity allowpitchangle(1);
    entity setpitchorient();
}

// Namespace tigerbehavior/archetype_tiger
// Params 5, eflags: 0x1 linked
// Checksum 0x9493c441, Offset: 0x3cd0
// Size: 0x5a
function function_5543b423(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    entity orientmode("face enemy");
    entity.melee_notetrack = 0;
}

// Namespace tigerbehavior/archetype_tiger
// Params 5, eflags: 0x1 linked
// Checksum 0xafd8f274, Offset: 0x3d38
// Size: 0x12c
function function_345c8845(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    if (isdefined(entity.melee_notetrack) && entity.melee_notetrack) {
        entity orientmode("face current");
        entity.melee_notetrack = 0;
    }
    if (isdefined(entity.favoriteenemy)) {
        if (distancesquared(entity.favoriteenemy.origin, entity.origin) <= 64 * 64 && function_1b7345aa(entity, entity.favoriteenemy)) {
            entity animmode("angle deltas");
            return;
        }
        entity animmode("normal");
    }
}

// Namespace tigerbehavior/archetype_tiger
// Params 5, eflags: 0x1 linked
// Checksum 0xf3dde92, Offset: 0x3e70
// Size: 0x4c
function function_933e34b9(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    entity orientmode("face default");
}

// Namespace tigerbehavior/archetype_tiger
// Params 5, eflags: 0x1 linked
// Checksum 0x67e9d5d8, Offset: 0x3ec8
// Size: 0xc4
function function_c0d6be15(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    if (isdefined(entity.favoriteenemy)) {
        to_enemy = entity.favoriteenemy.origin - entity.origin;
        angles_to_enemy = vectortoangles(to_enemy);
        entity orientmode("face angle", angles_to_enemy);
        return;
    }
    entity orientmode("face enemy");
}

// Namespace tigerbehavior/archetype_tiger
// Params 5, eflags: 0x1 linked
// Checksum 0xf8f31387, Offset: 0x3f98
// Size: 0x144
function function_dc8e2d7d(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    if (isdefined(entity.favoriteenemy)) {
        to_enemy = entity.favoriteenemy.origin - entity.origin;
        angles_to_enemy = vectortoangles(to_enemy);
        entity orientmode("face angle", angles_to_enemy);
        if (distancesquared(entity.favoriteenemy.origin, entity.origin) <= 64 * 64 && function_1b7345aa(entity, entity.favoriteenemy)) {
            entity animmode("angle deltas");
            return;
        }
        entity animmode("zonly_physics");
    }
}

// Namespace tigerbehavior/archetype_tiger
// Params 1, eflags: 0x1 linked
// Checksum 0xae4398b0, Offset: 0x40e8
// Size: 0x394
function function_ef12c1d9(entity) {
    if (isdefined(entity.aat_turned) && entity.aat_turned) {
        if (isdefined(entity.favoriteenemy) && !isplayer(entity.favoriteenemy)) {
            if (isdefined(entity.var_16d0eb06) && (isdefined(entity.favoriteenemy.var_6d23c054) && entity.favoriteenemy.var_6d23c054 || isdefined(entity.favoriteenemy.var_7672fb41) && entity.favoriteenemy.var_7672fb41)) {
                if (isdefined(entity.var_443d78cc)) {
                    e_attacker = entity.var_443d78cc;
                } else {
                    e_attacker = entity;
                }
                entity.favoriteenemy dodamage(entity.var_16d0eb06, entity.origin, e_attacker);
                if (!isalive(entity.favoriteenemy)) {
                    gibserverutils::gibhead(entity.favoriteenemy);
                    entity.favoriteenemy zombie_utility::gib_random_parts();
                    entity.favoriteenemy.var_7105092c = 1;
                    entity.favoriteenemy.var_39ebb8cc = entity;
                    entity.n_aat_turned_zombie_kills++;
                }
            } else if ((isdefined(entity.favoriteenemy.var_6d23c054) && entity.favoriteenemy.var_6d23c054 || isdefined(entity.favoriteenemy.var_7672fb41) && entity.favoriteenemy.var_7672fb41) && isdefined(entity.favoriteenemy.allowdeath) && entity.favoriteenemy.allowdeath) {
                if (isdefined(entity.var_443d78cc)) {
                    e_attacker = entity.var_443d78cc;
                } else {
                    e_attacker = entity;
                }
                gibserverutils::gibhead(entity.favoriteenemy);
                entity.favoriteenemy zombie_utility::gib_random_parts();
                entity.favoriteenemy.var_7105092c = 1;
                entity.favoriteenemy.var_39ebb8cc = entity;
                entity.favoriteenemy kill(entity.favoriteenemy.origin, e_attacker, e_attacker, undefined, undefined, 1);
                entity.n_aat_turned_zombie_kills++;
            } else if (isdefined(entity.favoriteenemy.canbetargetedbyturnedzombies) && entity.favoriteenemy.canbetargetedbyturnedzombies) {
                entity melee();
            }
        }
        return true;
    }
    return false;
}

// Namespace tigerbehavior/archetype_tiger
// Params 1, eflags: 0x1 linked
// Checksum 0x7b96233c, Offset: 0x4488
// Size: 0x34
function function_8ad0c889(entity) {
    entity.var_d6c43d9b = "tiger_melee_left";
    function_16bc9556(entity);
}

// Namespace tigerbehavior/archetype_tiger
// Params 1, eflags: 0x1 linked
// Checksum 0x6fec1a56, Offset: 0x44c8
// Size: 0x34
function function_33958f06(entity) {
    entity.var_d6c43d9b = "tiger_melee_right";
    function_16bc9556(entity);
}

// Namespace tigerbehavior/archetype_tiger
// Params 1, eflags: 0x1 linked
// Checksum 0xae7623a9, Offset: 0x4508
// Size: 0x10a
function function_16bc9556(entity) {
    if (function_ef12c1d9(entity)) {
        /#
            record3dtext("<dev string:xa1>", self.origin, (1, 0, 0), "<dev string:x4e>", entity);
        #/
    } else {
        hitent = entity melee();
        entity.melee_notetrack = 1;
        /#
            record3dtext("<dev string:xb0>", self.origin, (1, 0, 0), "<dev string:x4e>", entity);
        #/
        if (isdefined(entity.meleetype) && entity.meleetype == "normal") {
            if (!isdefined(hitent)) {
                entity.var_d96b3fd4 = 1;
            }
        }
    }
    return hitent;
}

// Namespace tigerbehavior/archetype_tiger
// Params 1, eflags: 0x1 linked
// Checksum 0xf6f92b7f, Offset: 0x4620
// Size: 0x1cc
function function_5ee65256(entity) {
    if (function_ef12c1d9(entity)) {
        /#
            record3dtext("<dev string:x3e>", self.origin, (1, 0, 0), "<dev string:x4e>", entity);
        #/
        return;
    }
    eye_pos = entity util::get_eye();
    enemy_eye_pos = entity util::get_eye();
    trace = physicstrace(eye_pos, enemy_eye_pos, (-15, -15, -15), (15, 15, 15), self);
    if (trace[#"fraction"] < 1) {
        hit_ent = trace[#"entity"];
    }
    hit = isdefined(hit_ent);
    if (isdefined(hit_ent)) {
        hit_ent dodamage(150, hit_ent.origin, entity);
        hit_ent notify(#"hash_53620e40c7e139b9");
    }
    if (isdefined(level.var_d0febd99)) {
        entity [[ level.var_d0febd99 ]]("tiger_melee_left", hit_ent);
    }
    if (isdefined(level.var_19e8a451)) {
        entity [[ level.var_19e8a451 ]](entity.favoriteenemy, hit);
    }
}

// Namespace tigerbehavior/archetype_tiger
// Params 1, eflags: 0x0
// Checksum 0x41208534, Offset: 0x47f8
// Size: 0x1a
function function_19e8a451(func) {
    level.var_19e8a451 = func;
}

// Namespace tigerbehavior/archetype_tiger
// Params 0, eflags: 0x1 linked
// Checksum 0x1d7f496d, Offset: 0x4820
// Size: 0x8e
function function_b708cfe7() {
    if (isdefined(self.favoriteenemy)) {
        predictedpos = self lastknownpos(self.favoriteenemy);
        if (isdefined(predictedpos)) {
            turnyaw = absangleclamp360(self.angles[1] - vectortoangles(predictedpos - self.origin)[1]);
            return turnyaw;
        }
    }
    return undefined;
}

/#

    // Namespace tigerbehavior/archetype_tiger
    // Params 0, eflags: 0x4
    // Checksum 0x997a7b12, Offset: 0x48b8
    // Size: 0xc0
    function private function_21c73eb5() {
        enemies = getaiarchetypearray(#"tiger");
        foreach (enemy in enemies) {
            if (isalive(enemy)) {
                enemy kill();
            }
        }
    }

    // Namespace tigerbehavior/archetype_tiger
    // Params 0, eflags: 0x4
    // Checksum 0xc19fd21c, Offset: 0x4980
    // Size: 0xb6
    function private function_88b22921() {
        enemies = getaiarchetypearray(#"tiger");
        foreach (enemy in enemies) {
            if (isalive(enemy)) {
                enemy.var_86152978 = gettime();
            }
        }
    }

    // Namespace tigerbehavior/archetype_tiger
    // Params 0, eflags: 0x4
    // Checksum 0xd0e54d7b, Offset: 0x4a40
    // Size: 0x1c8
    function private function_1e4eb5f0() {
        adddebugcommand("<dev string:xb8>");
        adddebugcommand("<dev string:xf9>");
        adddebugcommand("<dev string:x13c>");
        while (true) {
            waitframe(1);
            string = getdvarstring(#"hash_3b467d1615c469f8", "<dev string:x60>");
            cmd = strtok(string, "<dev string:x185>");
            if (cmd.size > 0) {
                switch (cmd[0]) {
                case #"spawn":
                    zm_devgui::spawn_archetype("<dev string:x189>");
                    break;
                case #"kill":
                    function_21c73eb5();
                    break;
                case #"pounce":
                    function_88b22921();
                    break;
                default:
                    if (isdefined(level.var_3d89b095)) {
                        [[ level.var_3d89b095 ]](cmd);
                    }
                    break;
                }
            }
            setdvar(#"hash_3b467d1615c469f8", "<dev string:x60>");
        }
    }

#/
