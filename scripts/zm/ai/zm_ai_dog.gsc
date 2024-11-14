#using scripts\zm_common\zm_utility;
#using scripts\zm\ai\zm_ai_dog_interface;
#using scripts\core_common\system_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\ai_shared;
#using scripts\core_common\ai\archetype_mocomps_utility;
#using scripts\core_common\spawner_shared;
#using scripts\core_common\ai\systems\ai_interface;
#using scripts\core_common\ai\systems\blackboard;
#using scripts\core_common\ai\systems\behavior_tree_utility;
#using scripts\core_common\ai\archetype_utility;
#using scripts\core_common\ai\systems\animation_state_machine_notetracks;
#using scripts\core_common\ai\systems\animation_state_machine_utility;

#namespace zm_ai_dog;

// Namespace zm_ai_dog/zm_ai_dog
// Params 0, eflags: 0x2
// Checksum 0xd62b0529, Offset: 0x1d0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_ai_dog", &__init__, undefined, undefined);
}

// Namespace zm_ai_dog/zm_ai_dog
// Params 0, eflags: 0x1 linked
// Checksum 0x7382c7b3, Offset: 0x218
// Size: 0x44
function __init__() {
    registerbehaviorscriptfunctions();
    spawner::add_archetype_spawn_function(#"zombie_dog", &function_b9d56970);
}

// Namespace zm_ai_dog/zm_ai_dog
// Params 0, eflags: 0x1 linked
// Checksum 0x9ef0372b, Offset: 0x268
// Size: 0x5a
function function_b9d56970() {
    self.var_93a62fe = zm_utility::get_closest_valid_player(self.origin, undefined, 1);
    self.closest_player_override = &zm_utility::function_c52e1749;
    self.var_ef1ed308 = &function_ea61b64a;
}

// Namespace zm_ai_dog/zm_ai_dog
// Params 0, eflags: 0x1 linked
// Checksum 0xe15eb97d, Offset: 0x2d0
// Size: 0x36c
function registerbehaviorscriptfunctions() {
    spawner::add_archetype_spawn_function(#"zombie_dog", &archetypezombiedogblackboardinit);
    assert(isscriptfunctionptr(&zombiedogtargetservice));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombiedogtargetservice", &zombiedogtargetservice, 1);
    assert(isscriptfunctionptr(&function_5e50d260));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_29b43f0d0b6bd4e2", &function_5e50d260, 2);
    assert(isscriptfunctionptr(&zombiedogshouldmelee));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombiedogshouldmelee", &zombiedogshouldmelee);
    assert(isscriptfunctionptr(&zombiedogshouldwalk));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombiedogshouldwalk", &zombiedogshouldwalk);
    assert(isscriptfunctionptr(&zombiedogshouldrun));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombiedogshouldrun", &zombiedogshouldrun);
    assert(!isdefined(&zombiedogmeleeaction) || isscriptfunctionptr(&zombiedogmeleeaction));
    assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
    assert(!isdefined(&zombiedogmeleeactionterminate) || isscriptfunctionptr(&zombiedogmeleeactionterminate));
    behaviortreenetworkutility::registerbehaviortreeaction("zombieDogMeleeAction", &zombiedogmeleeaction, undefined, &zombiedogmeleeactionterminate);
    zm_ai_dog_interface::registerzombiedoginterfaceattributes();
}

// Namespace zm_ai_dog/zm_ai_dog
// Params 0, eflags: 0x1 linked
// Checksum 0x806d8c78, Offset: 0x648
// Size: 0x56
function archetypezombiedogblackboardinit() {
    blackboard::createblackboardforentity(self);
    ai::createinterfaceforentity(self);
    self.___archetypeonanimscriptedcallback = &archetypezombiedogonanimscriptedcallback;
    self.kill_on_wine_coccon = 1;
}

// Namespace zm_ai_dog/zm_ai_dog
// Params 1, eflags: 0x5 linked
// Checksum 0xf1b87445, Offset: 0x6a8
// Size: 0x2c
function private archetypezombiedogonanimscriptedcallback(entity) {
    entity.__blackboard = undefined;
    entity archetypezombiedogblackboardinit();
}

// Namespace zm_ai_dog/zm_ai_dog
// Params 0, eflags: 0x1 linked
// Checksum 0xdaf15ea2, Offset: 0x6e0
// Size: 0xb2
function bb_getshouldrunstatus() {
    if (isdefined(self.var_1dddf9ab)) {
        return self [[ self.var_1dddf9ab ]]();
    }
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

// Namespace zm_ai_dog/zm_ai_dog
// Params 0, eflags: 0x1 linked
// Checksum 0xc0022994, Offset: 0x7a0
// Size: 0xc2
function bb_getshouldhowlstatus() {
    if (self ai::has_behavior_attribute("howl_chance") && isdefined(self.hasseenfavoriteenemy) && self.hasseenfavoriteenemy) {
        if (!isdefined(self.shouldhowl)) {
            chance = self ai::get_behavior_attribute("howl_chance");
            self.shouldhowl = randomfloat(1) <= chance;
        }
        return (self.shouldhowl ? "howl" : "dont_howl");
    }
    return "dont_howl";
}

// Namespace zm_ai_dog/zm_ai_dog
// Params 1, eflags: 0x1 linked
// Checksum 0xecfc8509, Offset: 0x870
// Size: 0x40
function getyaw(org) {
    angles = vectortoangles(org - self.origin);
    return angles[1];
}

// Namespace zm_ai_dog/zm_ai_dog
// Params 0, eflags: 0x1 linked
// Checksum 0x277ea56d, Offset: 0x8b8
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

// Namespace zm_ai_dog/zm_ai_dog
// Params 0, eflags: 0x1 linked
// Checksum 0x90e0064a, Offset: 0x958
// Size: 0x22a
function need_to_run() {
    run_dist_squared = self ai::get_behavior_attribute("min_run_dist") * self ai::get_behavior_attribute("min_run_dist");
    run_yaw = 20;
    run_pitch = 30;
    run_height = 64;
    if (level.dog_round_count > 1) {
        return true;
    }
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

// Namespace zm_ai_dog/zm_ai_dog
// Params 2, eflags: 0x1 linked
// Checksum 0xa2247111, Offset: 0xb90
// Size: 0x224
function is_target_valid(dog, target) {
    if (!isdefined(target)) {
        return 0;
    }
    if (!isalive(target)) {
        return 0;
    }
    if (!(dog.team == #"allies")) {
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
    if (dog.team == target.team) {
        return 0;
    }
    if (isplayer(target) && isdefined(level.var_6f6cc58)) {
        if (!dog [[ level.var_6f6cc58 ]](target)) {
            return 0;
        }
    }
    if (isplayer(target) && isdefined(level.is_player_valid_override)) {
        return [[ level.is_player_valid_override ]](target);
    }
    return 1;
}

// Namespace zm_ai_dog/zm_ai_dog
// Params 1, eflags: 0x5 linked
// Checksum 0xe7708b1, Offset: 0xdc0
// Size: 0x258
function private get_favorite_enemy(dog) {
    dog_targets = [];
    if (sessionmodeiszombiesgame()) {
        if (self.team == #"allies") {
            dog_targets = getaiteamarray(level.zombie_team);
        } else {
            dog_targets = getplayers();
        }
    } else {
        dog_targets = arraycombine(getplayers(), getaiarray(), 0, 0);
    }
    least_hunted = dog_targets[0];
    closest_target_dist_squared = undefined;
    for (i = 0; i < dog_targets.size; i++) {
        if (!isdefined(dog_targets[i].hunted_by)) {
            dog_targets[i].hunted_by = 0;
        }
        if (!is_target_valid(dog, dog_targets[i])) {
            continue;
        }
        if (!is_target_valid(dog, least_hunted)) {
            least_hunted = dog_targets[i];
        }
        dist_squared = distancesquared(dog.origin, dog_targets[i].origin);
        if (dog_targets[i].hunted_by <= least_hunted.hunted_by && (!isdefined(closest_target_dist_squared) || dist_squared < closest_target_dist_squared)) {
            least_hunted = dog_targets[i];
            closest_target_dist_squared = dist_squared;
        }
    }
    if (!is_target_valid(dog, least_hunted)) {
        return undefined;
    }
    least_hunted.hunted_by += 1;
    return least_hunted;
}

// Namespace zm_ai_dog/zm_ai_dog
// Params 0, eflags: 0x1 linked
// Checksum 0xac75b24e, Offset: 0x1020
// Size: 0x2e
function get_last_valid_position() {
    if (isplayer(self)) {
        return self.last_valid_position;
    }
    return self.origin;
}

// Namespace zm_ai_dog/zm_ai_dog
// Params 1, eflags: 0x1 linked
// Checksum 0x92101d93, Offset: 0x1058
// Size: 0x252
function get_locomotion_target(behaviortreeentity) {
    if (!isdefined(behaviortreeentity.favoriteenemy)) {
        return undefined;
    }
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

// Namespace zm_ai_dog/zm_ai_dog
// Params 1, eflags: 0x1 linked
// Checksum 0xb83b961f, Offset: 0x12b8
// Size: 0x3ba
function zombiedogtargetservice(behaviortreeentity) {
    if (isdefined(level.intermission) && level.intermission) {
        behaviortreeentity clearpath();
        return;
    }
    /#
        if (isdefined(behaviortreeentity.ispuppet) && behaviortreeentity.ispuppet) {
            return;
        }
    #/
    if (behaviortreeentity ai::has_behavior_attribute("patrol") && behaviortreeentity ai::get_behavior_attribute("patrol")) {
        return;
    }
    if (!is_target_valid(behaviortreeentity, behaviortreeentity.favoriteenemy)) {
        if (isdefined(behaviortreeentity.favoriteenemy)) {
            function_ea61b64a(behaviortreeentity);
            behaviortreeentity.hasseenfavoriteenemy = 0;
        }
        behaviortreeentity.favoriteenemy = get_favorite_enemy(behaviortreeentity);
    }
    if (behaviortreeentity.ignoreall || behaviortreeentity.pacifist || !is_target_valid(behaviortreeentity, behaviortreeentity.favoriteenemy)) {
        if (is_target_valid(behaviortreeentity, behaviortreeentity.favoriteenemy)) {
            if (isdefined(level.var_d22435d9)) {
                [[ level.var_d22435d9 ]](behaviortreeentity);
            }
        } else {
            if (isdefined(behaviortreeentity function_4794d6a3().overridegoalpos)) {
                behaviortreeentity function_d4c687c9();
            }
            if (isdefined(level.no_target_override)) {
                [[ level.no_target_override ]](behaviortreeentity);
                return;
            }
            behaviortreeentity setgoal(behaviortreeentity.origin);
            return;
        }
    }
    if (!(isdefined(behaviortreeentity.hasseenfavoriteenemy) && behaviortreeentity.hasseenfavoriteenemy)) {
        if (isdefined(behaviortreeentity.favoriteenemy) && behaviortreeentity need_to_run()) {
            behaviortreeentity.hasseenfavoriteenemy = 1;
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
                behaviortreeentity function_a57c34b7(locomotion_target);
                behaviortreeentity.lasttargetposition = locomotion_target;
            }
        }
    }
}

// Namespace zm_ai_dog/zm_ai_dog
// Params 1, eflags: 0x1 linked
// Checksum 0xf6e5e89c, Offset: 0x1680
// Size: 0xe0
function zombiedogshouldmelee(behaviortreeentity) {
    if (behaviortreeentity.ignoreall || !is_target_valid(behaviortreeentity, behaviortreeentity.favoriteenemy)) {
        return false;
    }
    if (!(isdefined(level.intermission) && level.intermission)) {
        meleedist = 72;
        if (distancesquared(behaviortreeentity.origin, behaviortreeentity.favoriteenemy.origin) < meleedist * meleedist && behaviortreeentity cansee(behaviortreeentity.favoriteenemy)) {
            return true;
        }
    }
    return false;
}

// Namespace zm_ai_dog/zm_ai_dog
// Params 1, eflags: 0x1 linked
// Checksum 0xf59b4a2b, Offset: 0x1768
// Size: 0x24
function zombiedogshouldwalk(behaviortreeentity) {
    return bb_getshouldrunstatus() == "walk";
}

// Namespace zm_ai_dog/zm_ai_dog
// Params 1, eflags: 0x1 linked
// Checksum 0xd18b7365, Offset: 0x1798
// Size: 0x24
function zombiedogshouldrun(behaviortreeentity) {
    return bb_getshouldrunstatus() == "run";
}

// Namespace zm_ai_dog/zm_ai_dog
// Params 0, eflags: 0x1 linked
// Checksum 0x77103d18, Offset: 0x17c8
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

// Namespace zm_ai_dog/zm_ai_dog
// Params 2, eflags: 0x1 linked
// Checksum 0xba65696c, Offset: 0x1940
// Size: 0xa0
function zombiedogmeleeaction(behaviortreeentity, asmstatename) {
    behaviortreeentity clearpath();
    context = "high";
    if (behaviortreeentity use_low_attack()) {
        context = "low";
    }
    behaviortreeentity setblackboardattribute("_context", context);
    animationstatenetworkutility::requeststate(behaviortreeentity, asmstatename);
    return 5;
}

// Namespace zm_ai_dog/zm_ai_dog
// Params 2, eflags: 0x1 linked
// Checksum 0x62e32d85, Offset: 0x19e8
// Size: 0x38
function zombiedogmeleeactionterminate(behaviortreeentity, asmstatename) {
    behaviortreeentity setblackboardattribute("_context", undefined);
    return 4;
}

// Namespace zm_ai_dog/zm_ai_dog
// Params 4, eflags: 0x1 linked
// Checksum 0x9104d1e8, Offset: 0x1a28
// Size: 0x44
function zombiedoggravity(entity, attribute, oldvalue, value) {
    entity setblackboardattribute("_low_gravity", value);
}

// Namespace zm_ai_dog/zm_ai_dog
// Params 1, eflags: 0x1 linked
// Checksum 0xeb4b4754, Offset: 0x1a78
// Size: 0x18a
function function_5e50d260(dog) {
    if (!isdefined(dog.favoriteenemy) || !zm_utility::is_player_valid(dog.favoriteenemy)) {
        return;
    }
    if (!isdefined(dog.var_93a62fe) || dog.favoriteenemy == dog.var_93a62fe) {
        return;
    }
    if (!(isdefined(dog.var_2eda3fd0) && dog.var_2eda3fd0)) {
        dog.var_90957231 = dog zm_utility::approximate_path_dist(dog.favoriteenemy);
        dog.var_2eda3fd0 = 1;
        return;
    }
    new_target_dist = dog zm_utility::approximate_path_dist(dog.var_93a62fe);
    if (isdefined(dog.var_90957231)) {
        if (isdefined(new_target_dist) && dog.var_90957231 - new_target_dist > 200) {
            dog function_e856134(dog, dog.var_93a62fe);
        }
    } else if (isdefined(new_target_dist)) {
        dog function_e856134(dog, dog.var_93a62fe);
    }
    dog.var_2eda3fd0 = 0;
}

// Namespace zm_ai_dog/zm_ai_dog
// Params 2, eflags: 0x1 linked
// Checksum 0x5f184b77, Offset: 0x1c10
// Size: 0x70
function function_e856134(dog, new_target) {
    function_ea61b64a(dog);
    if (!isdefined(new_target.hunted_by)) {
        new_target.hunted_by = 0;
    }
    dog.favoriteenemy = new_target;
    dog.favoriteenemy.hunted_by++;
}

// Namespace zm_ai_dog/zm_ai_dog
// Params 1, eflags: 0x1 linked
// Checksum 0x255ea3f4, Offset: 0x1c88
// Size: 0x72
function function_ea61b64a(dog) {
    if (isdefined(dog.favoriteenemy) && isdefined(dog.favoriteenemy.hunted_by) && dog.favoriteenemy.hunted_by > 0) {
        dog.favoriteenemy.hunted_by--;
    }
    dog.favoriteenemy = undefined;
}

