// Atian COD Tools GSC decompiler test
#include script_30a4b3e6d6d5e540;
#include script_48f7c4ab73137f8;
#include scripts/zm_common/zm_powerups.gsc;
#include scripts/zm_common/zm_spawner.gsc;
#include scripts/zm_common/zm_perks.gsc;
#include scripts/zm_common/zm_laststand.gsc;
#include scripts/zm_common/zm_devgui.gsc;
#include scripts/zm_common/zm.gsc;
#include scripts/zm/archetype/archetype_zod_companion_interface.gsc;
#include scripts/core_common/ai/systems/shared.gsc;
#include scripts/core_common/ai/systems/gib.gsc;
#include scripts/core_common/ai/systems/destructible_character.gsc;
#include scripts/core_common/ai/systems/debug.gsc;
#include scripts/core_common/ai/systems/blackboard.gsc;
#include scripts/core_common/ai/systems/behavior_tree_utility.gsc;
#include scripts/core_common/ai/systems/animation_state_machine_utility.gsc;
#include scripts/core_common/ai/systems/animation_state_machine_mocomp.gsc;
#include scripts/core_common/ai/systems/ai_squads.gsc;
#include scripts/core_common/ai/systems/ai_interface.gsc;
#include scripts/core_common/ai/systems/ai_blackboard.gsc;
#include scripts/core_common/ai/zombie_death.gsc;
#include scripts/core_common/ai/archetype_utility.gsc;
#include scripts/core_common/ai/archetype_mocomps_utility.gsc;
#include scripts/core_common/ai/archetype_locomotion_utility.gsc;
#include script_3819e7a1427df6d2;
#include scripts/core_common/ai/archetype_cover_utility.gsc;
#include scripts/core_common/values_shared.gsc;
#include scripts/core_common/flag_shared.gsc;
#include scripts/core_common/array_shared.gsc;
#include scripts/core_common/animation_shared.gsc;
#include scripts/core_common/spawner_shared.gsc;
#include scripts/core_common/math_shared.gsc;
#include scripts/core_common/laststand_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;
#include scripts/core_common/ai_shared.gsc;

#namespace archetype_zod_companion;

// Namespace archetype_zod_companion/archetype_zod_companion
// Params 0, eflags: 0x2
// Checksum 0xe7f5d01a, Offset: 0x6a0
// Size: 0xd4
function autoexec main() {
    clientfield::register("allplayers", "being_robot_revived", 1, 1, "int");
    spawner::add_archetype_spawn_function(#"zod_companion", &zodcompanionbehavior::archetypezodcompanionblackboardinit);
    spawner::add_archetype_spawn_function(#"zod_companion", &zodcompanionserverutils::zodcompanionsoldierspawnsetup);
    zodcompanioninterface::registerzodcompanioninterfaceattributes();
    zodcompanionbehavior::registerbehaviorscriptfunctions();
    /#
        zm_devgui::function_c7dd7a17("MOD_PROJECTIVLE_SPLASH");
    #/
}

#namespace zodcompanionbehavior;

// Namespace zodcompanionbehavior/archetype_zod_companion
// Params 0, eflags: 0x1 linked
// Checksum 0x56f982b8, Offset: 0x780
// Size: 0x664
function registerbehaviorscriptfunctions() {
    /#
        assert(isscriptfunctionptr(&zodcompaniontacticalwalkactionstart));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("zodCompanionTacticalWalkActionStart", &zodcompaniontacticalwalkactionstart);
    /#
        assert(isscriptfunctionptr(&zodcompanionabletoshootcondition));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("zodCompanionAbleToShoot", &zodcompanionabletoshootcondition);
    /#
        assert(isscriptfunctionptr(&zodcompanionshouldtacticalwalk));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("zodCompanionShouldTacticalWalk", &zodcompanionshouldtacticalwalk);
    /#
        assert(isscriptfunctionptr(&zodcompanionmovement));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("zodCompanionMovement", &zodcompanionmovement);
    /#
        assert(isscriptfunctionptr(&zodcompaniondelaymovement));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("zodCompanionDelayMovement", &zodcompaniondelaymovement);
    /#
        assert(isscriptfunctionptr(&zodcompanionsetdesiredstancetostand));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("zodCompanionSetDesiredStanceToStand", &zodcompanionsetdesiredstancetostand);
    /#
        assert(isscriptfunctionptr(&zodcompanionfinishedsprinttransition));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("zodCompanionFinishedSprintTransition", &zodcompanionfinishedsprinttransition);
    /#
        assert(isscriptfunctionptr(&zodcompanionsprinttransitioning));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("zodCompanionSprintTransitioning", &zodcompanionsprinttransitioning);
    /#
        assert(isscriptfunctionptr(&zodcompanionkeepscurrentmovementmode));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("zodCompanionKeepsCurrentMovementMode", &zodcompanionkeepscurrentmovementmode);
    /#
        assert(isscriptfunctionptr(&zodcompanioncanjuke));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("zodCompanionCanJuke", &zodcompanioncanjuke);
    /#
        assert(isscriptfunctionptr(&zodcompanioncanpreemptivejuke));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("zodCompanionCanPreemptiveJuke", &zodcompanioncanpreemptivejuke);
    /#
        assert(isscriptfunctionptr(&zodcompanionjukeinitialize));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("zodCompanionJukeInitialize", &zodcompanionjukeinitialize);
    /#
        assert(isscriptfunctionptr(&zodcompanionpreemptivejuketerminate));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("zodCompanionPreemptiveJukeTerminate", &zodcompanionpreemptivejuketerminate);
    /#
        assert(isscriptfunctionptr(&zodcompaniontargetservice));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("zodCompanionTargetService", &zodcompaniontargetservice);
    /#
        assert(isscriptfunctionptr(&zodcompaniontryreacquireservice));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("zodCompanionTryReacquireService", &zodcompaniontryreacquireservice);
    /#
        assert(isscriptfunctionptr(&manage_companion_movement));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("manage_companion_movement", &manage_companion_movement);
    /#
        assert(isscriptfunctionptr(&zodcompanioncollisionservice));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("zodCompanionCollisionService", &zodcompanioncollisionservice);
}

// Namespace zodcompanionbehavior/archetype_zod_companion
// Params 5, eflags: 0x4
// Checksum 0x94b82d0c, Offset: 0xdf0
// Size: 0x74
function private mocompignorepainfaceenemyinit(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    entity.blockingpain = 1;
    entity orientmode("face enemy");
    entity animmode("pos deltas");
}

// Namespace zodcompanionbehavior/archetype_zod_companion
// Params 5, eflags: 0x4
// Checksum 0xd6b21f9d, Offset: 0xe70
// Size: 0x3a
function private mocompignorepainfaceenemyterminate(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    entity.blockingpain = 0;
}

// Namespace zodcompanionbehavior/archetype_zod_companion
// Params 0, eflags: 0x5 linked
// Checksum 0xe5729b85, Offset: 0xeb8
// Size: 0x74
function private archetypezodcompanionblackboardinit() {
    entity = self;
    entity.pushable = 1;
    blackboard::createblackboardforentity(entity);
    ai::createinterfaceforentity(entity);
    self setblackboardattribute("_locomotion_speed", "locomotion_speed_sprint");
}

// Namespace zodcompanionbehavior/archetype_zod_companion
// Params 1, eflags: 0x5 linked
// Checksum 0xb72be6ca, Offset: 0xf38
// Size: 0x44
function private zodcompaniondelaymovement(entity) {
    entity pathmode("move delayed", 0, randomfloatrange(1, 2));
}

// Namespace zodcompanionbehavior/archetype_zod_companion
// Params 1, eflags: 0x5 linked
// Checksum 0xbccf21ed, Offset: 0xf88
// Size: 0x5c
function private zodcompanionmovement(entity) {
    if (entity getblackboardattribute("_stance") != "stand") {
        entity setblackboardattribute("_desired_stance", "stand");
    }
}

// Namespace zodcompanionbehavior/archetype_zod_companion
// Params 1, eflags: 0x1 linked
// Checksum 0xfbeb460d, Offset: 0xff0
// Size: 0x13e
function zodcompanioncanjuke(entity) {
    if (!(isdefined(entity.steppedoutofcover) && entity.steppedoutofcover) && aiutility::canjuke(entity)) {
        jukeevents = blackboard::getblackboardevents("robot_juke");
        tooclosejukedistancesqr = 57600;
        foreach (event in jukeevents) {
            if (event.data.entity != entity && distance2dsquared(entity.origin, event.data.origin) <= tooclosejukedistancesqr) {
                return 0;
            }
        }
        return 1;
    }
    return 0;
}

// Namespace zodcompanionbehavior/archetype_zod_companion
// Params 1, eflags: 0x1 linked
// Checksum 0xf0495875, Offset: 0x1138
// Size: 0x2d6
function zodcompanioncanpreemptivejuke(entity) {
    if (!isdefined(entity.enemy) || !isplayer(entity.enemy)) {
        return 0;
    }
    if (entity getblackboardattribute("_stance") == "crouch") {
        return 0;
    }
    if (!entity.shouldpreemptivejuke) {
        return 0;
    }
    if (isdefined(entity.nextpreemptivejuke) && entity.nextpreemptivejuke > gettime()) {
        return 0;
    }
    if (entity.enemy playerads() < entity.nextpreemptivejukeads) {
        return 0;
    }
    if (distancesquared(entity.origin, entity.enemy.origin) < 360000) {
        angledifference = absangleclamp180(entity.angles[1] - entity.enemy.angles[1]);
        /#
            record3dtext(angledifference, entity.origin + vectorscale((0, 0, 1), 5), (0, 1, 0), "<unknown string>");
        #/
        if (angledifference > 135) {
            enemyangles = entity.enemy getgunangles();
            toenemy = entity.enemy.origin - entity.origin;
            forward = anglestoforward(enemyangles);
            dotproduct = abs(vectordot(vectornormalize(toenemy), forward));
            /#
                record3dtext(acos(dotproduct), entity.origin + vectorscale((0, 0, 1), 10), (0, 1, 0), "<unknown string>");
            #/
            if (dotproduct > 0.9848) {
                return zodcompanioncanjuke(entity);
            }
        }
    }
    return 0;
}

// Namespace zodcompanionbehavior/archetype_zod_companion
// Params 1, eflags: 0x5 linked
// Checksum 0xcb0399bb, Offset: 0x1418
// Size: 0xb0
function private _isvalidplayer(player) {
    if (!isdefined(player) || !isalive(player) || !isplayer(player) || player.sessionstate == "spectator" || player.sessionstate == "intermission" || player laststand::player_is_in_laststand() || player.ignoreme) {
        return 0;
    }
    return 1;
}

// Namespace zodcompanionbehavior/archetype_zod_companion
// Params 2, eflags: 0x5 linked
// Checksum 0x4e5c9249, Offset: 0x14d0
// Size: 0x124
function private _findclosest(entity, entities) {
    closest = spawnstruct();
    if (entities.size > 0) {
        closest.entity = entities[0];
        closest.distancesquared = distancesquared(entity.origin, closest.entity.origin);
        for (index = 1; index < entities.size; index++) {
            distancesquared = distancesquared(entity.origin, entities[index].origin);
            if (distancesquared < closest.distancesquared) {
                closest.distancesquared = distancesquared;
                closest.entity = entities[index];
            }
        }
    }
    return closest;
}

// Namespace zodcompanionbehavior/archetype_zod_companion
// Params 1, eflags: 0x5 linked
// Checksum 0x9808c86c, Offset: 0x1600
// Size: 0x3c6
function private zodcompaniontargetservice(entity) {
    if (zodcompanionabletoshootcondition(entity)) {
        return 0;
    }
    if (isdefined(entity.ignoreall) && entity.ignoreall) {
        return 0;
    }
    aienemies = [];
    playerenemies = [];
    ai = getaiarray();
    players = getplayers();
    positiononnavmesh = getclosestpointonnavmesh(entity.origin, 200);
    if (!isdefined(positiononnavmesh)) {
        return;
    }
    foreach (index, value in ai) {
        if (value.team != entity.team && isactor(value) && !isdefined(entity.favoriteenemy)) {
            enemypositiononnavmesh = getclosestpointonnavmesh(value.origin, 200);
            if (isdefined(enemypositiononnavmesh) && entity findpath(positiononnavmesh, enemypositiononnavmesh, 1, 0)) {
                aienemies[aienemies.size] = value;
            }
        }
    }
    foreach (value in players) {
        if (_isvalidplayer(value)) {
            enemypositiononnavmesh = getclosestpointonnavmesh(value.origin, 200);
            if (isdefined(enemypositiononnavmesh) && entity findpath(positiononnavmesh, enemypositiononnavmesh, 1, 0)) {
                playerenemies[playerenemies.size] = value;
            }
        }
    }
    closestplayer = _findclosest(entity, playerenemies);
    closestai = _findclosest(entity, aienemies);
    if (!isdefined(closestplayer.entity) && !isdefined(closestai.entity)) {
        return;
    } else if (!isdefined(closestai.entity)) {
        entity.favoriteenemy = closestplayer.entity;
    } else if (!isdefined(closestplayer.entity)) {
        entity.favoriteenemy = closestai.entity;
    } else if (closestai.distancesquared < closestplayer.distancesquared) {
        entity.favoriteenemy = closestai.entity;
    } else {
        entity.favoriteenemy = closestplayer.entity;
    }
}

// Namespace zodcompanionbehavior/archetype_zod_companion
// Params 1, eflags: 0x5 linked
// Checksum 0xa81c1f87, Offset: 0x19d0
// Size: 0x2c
function private zodcompaniontacticalwalkactionstart(entity) {
    entity orientmode("face enemy");
}

// Namespace zodcompanionbehavior/archetype_zod_companion
// Params 1, eflags: 0x5 linked
// Checksum 0x2dc39ed3, Offset: 0x1a08
// Size: 0x4e
function private zodcompanionabletoshootcondition(entity) {
    return entity.weapon.name != level.weaponnone.name && !gibserverutils::isgibbed(entity, 16);
}

// Namespace zodcompanionbehavior/archetype_zod_companion
// Params 1, eflags: 0x5 linked
// Checksum 0x91799850, Offset: 0x1a60
// Size: 0x2e
function private zodcompanionshouldtacticalwalk(entity) {
    if (!entity haspath()) {
        return 0;
    }
    return 1;
}

// Namespace zodcompanionbehavior/archetype_zod_companion
// Params 1, eflags: 0x5 linked
// Checksum 0xa1a87bce, Offset: 0x1a98
// Size: 0x9c
function private zodcompanionjukeinitialize(entity) {
    aiutility::choosejukedirection(entity);
    entity clearpath();
    jukeinfo = spawnstruct();
    jukeinfo.origin = entity.origin;
    jukeinfo.entity = entity;
    blackboard::addblackboardevent("robot_juke", jukeinfo, 2000);
}

// Namespace zodcompanionbehavior/archetype_zod_companion
// Params 1, eflags: 0x5 linked
// Checksum 0x297fe407, Offset: 0x1b40
// Size: 0x5e
function private zodcompanionpreemptivejuketerminate(entity) {
    entity.nextpreemptivejuke = gettime() + randomintrange(4000, 6000);
    entity.nextpreemptivejukeads = randomfloatrange(0.5, 0.95);
}

// Namespace zodcompanionbehavior/archetype_zod_companion
// Params 1, eflags: 0x5 linked
// Checksum 0x6333dd31, Offset: 0x1ba8
// Size: 0x2da
function private zodcompaniontryreacquireservice(entity) {
    if (!isdefined(entity.reacquire_state)) {
        entity.reacquire_state = 0;
    }
    if (!isdefined(entity.enemy)) {
        entity.reacquire_state = 0;
        return 0;
    }
    if (entity haspath()) {
        return 0;
    }
    if (!zodcompanionabletoshootcondition(entity)) {
        return 0;
    }
    if (entity cansee(entity.enemy) && entity canshootenemy()) {
        entity.reacquire_state = 0;
        return 0;
    }
    dirtoenemy = vectornormalize(entity.enemy.origin - entity.origin);
    forward = anglestoforward(entity.angles);
    if (vectordot(dirtoenemy, forward) < 0.5) {
        entity.reacquire_state = 0;
        return 0;
    }
    switch (entity.reacquire_state) {
    case 0:
    case 1:
    case 2:
        step_size = 32 + entity.reacquire_state * 32;
        reacquirepos = entity reacquirestep(step_size);
        break;
    case 4:
        if (!entity cansee(entity.enemy) || !entity canshootenemy()) {
            entity flagenemyunattackable();
        }
        break;
    default:
        if (entity.reacquire_state > 15) {
            entity.reacquire_state = 0;
            return 0;
        }
        break;
    }
    if (isvec(reacquirepos)) {
        entity function_a57c34b7(reacquirepos);
        return 1;
    }
    entity.reacquire_state++;
    return 0;
}

// Namespace zodcompanionbehavior/archetype_zod_companion
// Params 1, eflags: 0x5 linked
// Checksum 0x5171d024, Offset: 0x1e90
// Size: 0x774
function private manage_companion_movement(entity) {
    self endon(#"death");
    if (isdefined(level.var_1a612d42) && level.var_1a612d42.eligible_leader) {
        self.leader = level.var_1a612d42;
    }
    if (!isdefined(entity.var_5f694f04)) {
        entity.var_5f694f04 = 0;
    }
    if (entity.ai.bulletsinclip < entity.weapon.clipsize) {
        entity.ai.bulletsinclip = entity.weapon.clipsize;
    }
    if (entity.reviving_a_player === 1) {
        return;
    }
    if (entity.time_expired === 1) {
        return;
    }
    if (entity.var_8dc43281 === 1 || entity.teleporting === 1) {
        return;
    }
    if (isdefined(entity.leader) && entity.leader.teleporting === 1) {
        entity thread function_818f64d1(entity.leader.teleport_location);
        return;
    }
    if (entity.var_7e56b71c === 1) {
        return;
    }
    if (isdefined(entity.leader) && entity.leader.is_flung === 1) {
        entity thread function_d5390a05(entity.leader.var_a76eba5b);
    }
    foreach (player in level.players) {
        if (player laststand::player_is_in_laststand() && entity.reviving_a_player === 0 && player.revivetrigger.beingrevived !== 1) {
            time = gettime();
            if (distancesquared(entity.origin, player.origin) <= 1024 * 1024 && time >= entity.var_5f694f04) {
                entity.reviving_a_player = 1;
                entity zod_companion_revive_player(player);
                return;
            }
        }
    }
    if (!isdefined(entity.var_f4fb31fe)) {
        entity.var_f4fb31fe = gettime();
    }
    if (gettime() >= entity.var_f4fb31fe && isdefined(level.active_powerups) && level.active_powerups.size > 0) {
        if (!isdefined(entity.var_345d40)) {
            entity.var_345d40 = 0;
        }
        foreach (powerup in level.active_powerups) {
            if (isdefined(powerup)) {
                if (isinarray(entity.var_2f03f56a, powerup.powerup_name)) {
                    dist = distancesquared(entity.origin, powerup.origin);
                    if (dist <= 147456 && randomint(100) < 50 + 10 * entity.var_345d40) {
                        entity setgoal(powerup.origin, 1);
                        entity.var_f4fb31fe = gettime() + randomintrange(2500, 3500);
                        entity.next_move_time = gettime() + randomintrange(2500, 3500);
                        entity.var_345d40 = 0;
                        return;
                    }
                    entity.var_345d40 = entity.var_345d40 + 1;
                }
            }
        }
        entity.var_f4fb31fe = gettime() + randomintrange(333, 666);
    }
    follow_radius_squared = 256 * 256;
    if (isdefined(entity.leader)) {
        entity.companion_anchor_point = entity.leader.origin;
    }
    if (isdefined(entity.pathgoalpos)) {
        dist_check_start_point = entity.pathgoalpos;
    } else {
        dist_check_start_point = entity.origin;
    }
    if (isdefined(entity.enemy) && isdefined(entity.enemy.archetype) && entity.enemy.archetype == "parasite") {
        height_difference = abs(entity.origin[2] - entity.enemy.origin[2]);
        var_3b91e18 = 1.5 * height_difference * 1.5 * height_difference;
        if (distancesquared(dist_check_start_point, entity.enemy.origin) < var_3b91e18) {
            entity pick_new_movement_point();
        }
    }
    if (distancesquared(dist_check_start_point, entity.companion_anchor_point) > follow_radius_squared || distancesquared(dist_check_start_point, entity.companion_anchor_point) < 4096) {
        entity pick_new_movement_point();
    }
    if (gettime() >= entity.next_move_time) {
        entity pick_new_movement_point();
    }
}

// Namespace zodcompanionbehavior/archetype_zod_companion
// Params 1, eflags: 0x5 linked
// Checksum 0x6ceba6f6, Offset: 0x2610
// Size: 0x1ae
function private zodcompanioncollisionservice(entity) {
    if (isdefined(entity.dontpushtime)) {
        if (gettime() < entity.dontpushtime) {
            return 1;
        }
    }
    var_26cddecd = 0;
    zombies = getaiteamarray(level.zombie_team);
    foreach (zombie in zombies) {
        if (zombie == entity) {
            continue;
        }
        dist_sq = distancesquared(entity.origin, zombie.origin);
        if (dist_sq < 14400) {
            if (isdefined(zombie.cant_move) && zombie.cant_move) {
                zombie thread function_d0371e1e();
                var_26cddecd = 1;
            }
        }
    }
    if (var_26cddecd) {
        entity collidewithactors(0);
        entity.dontpushtime = gettime() + 2000;
        return 1;
    }
    entity collidewithactors(1);
    return 0;
}

// Namespace zodcompanionbehavior/archetype_zod_companion
// Params 0, eflags: 0x5 linked
// Checksum 0xfe4fa8ce, Offset: 0x27c8
// Size: 0x4c
function private function_d0371e1e() {
    self endon(#"death");
    self collidewithactors(0);
    wait(2);
    self collidewithactors(1);
}

// Namespace zodcompanionbehavior/archetype_zod_companion
// Params 2, eflags: 0x4
// Checksum 0x50bf03ab, Offset: 0x2820
// Size: 0x120
function private function_a2ba1ce8(target_entity, max_distance) {
    entity = self;
    target_location = target_entity.origin;
    if (distancesquared(entity.origin, target_location) > max_distance * max_distance) {
        return 0;
    }
    path = entity calcapproximatepathtoposition(target_location);
    segmentlength = 0;
    for (index = 1; index < path.size; index++) {
        currentseglength = distance(path[index - 1], path[index]);
        if (currentseglength + segmentlength > max_distance) {
            return 0;
        }
        segmentlength = segmentlength + currentseglength;
    }
    return 1;
}

// Namespace zodcompanionbehavior/archetype_zod_companion
// Params 1, eflags: 0x5 linked
// Checksum 0x7874d8c3, Offset: 0x2948
// Size: 0x72
function private function_818f64d1(var_d2a1361a) {
    self endon(#"death");
    self.var_8dc43281 = 1;
    self setgoal(var_d2a1361a, 1);
    self waittill(#"goal");
    wait(1);
    self.var_8dc43281 = 0;
}

// Namespace zodcompanionbehavior/archetype_zod_companion
// Params 1, eflags: 0x5 linked
// Checksum 0xba0604d2, Offset: 0x29c8
// Size: 0xc2
function private function_d5390a05(var_33d955f9) {
    self endon(#"death");
    self.var_7e56b71c = 1;
    var_cf5caf08 = getnodearray("flinger_traversal", "script_noteworthy");
    var_b2546f7 = arraygetclosest(var_33d955f9, var_cf5caf08);
    self setgoal(var_b2546f7.origin, 1);
    self waittill(#"goal");
    wait(1);
    self.var_7e56b71c = 0;
}

// Namespace zodcompanionbehavior/archetype_zod_companion
// Params 0, eflags: 0x5 linked
// Checksum 0xbf815030, Offset: 0x2a98
// Size: 0x1d6
function private pick_new_movement_point() {
    queryresult = positionquery_source_navigation(self.companion_anchor_point, 96, 256, 256, 20, self);
    if (queryresult.data.size) {
        if (isdefined(self.enemy) && isdefined(self.enemy.archetype) && self.enemy.archetype == "parasite") {
            array::filter(queryresult.data, 0, &function_bc4cbfe, self.enemy);
        }
    }
    if (queryresult.data.size) {
        point = queryresult.data[randomint(queryresult.data.size)];
        pathsuccess = self findpath(self.origin, point.origin, 1, 0);
        if (pathsuccess) {
            self.companion_destination = point.origin;
        } else {
            self.next_move_time = gettime() + randomintrange(500, 1500);
            return;
        }
    }
    self setgoal(self.companion_destination, 1);
    self.next_move_time = gettime() + randomintrange(20000, 30000);
}

// Namespace zodcompanionbehavior/archetype_zod_companion
// Params 1, eflags: 0x5 linked
// Checksum 0x7660d0c3, Offset: 0x2c78
// Size: 0xa8
function private function_bc4cbfe(parasite) {
    point = self;
    height_difference = abs(point.origin[2] - parasite.origin[2]);
    var_3b91e18 = 1.5 * height_difference * 1.5 * height_difference;
    return distancesquared(point.origin, parasite.origin) > var_3b91e18;
}

// Namespace zodcompanionbehavior/archetype_zod_companion
// Params 1, eflags: 0x5 linked
// Checksum 0x2397fc60, Offset: 0x2d28
// Size: 0x6c
function private zodcompanionsetdesiredstancetostand(behaviortreeentity) {
    currentstance = behaviortreeentity getblackboardattribute("_stance");
    if (currentstance == "crouch") {
        behaviortreeentity setblackboardattribute("_desired_stance", "stand");
    }
}

// Namespace zodcompanionbehavior/archetype_zod_companion
// Params 1, eflags: 0x1 linked
// Checksum 0x5b47f018, Offset: 0x2da0
// Size: 0x4f4
function zod_companion_revive_player(player) {
    self endon(#"death", #"revive_terminated", #"end_game");
    if (!(isdefined(self.reviving_a_player) && self.reviving_a_player)) {
        self.reviving_a_player = 1;
    }
    player.being_revived_by_robot = 0;
    self thread zod_companion_monitor_revive_attempt(player);
    self val::set(#"zod_companion", "ignoreall", 1);
    queryresult = positionquery_source_navigation(player.origin, 64, 96, 48, 18, self);
    if (queryresult.data.size) {
        point = queryresult.data[randomint(queryresult.data.size)];
        self.companion_destination = point.origin;
    }
    self setgoal(self.companion_destination, 1);
    self waittill(#"goal");
    level.var_ee623e8 = 1;
    player.revivetrigger.beingrevived = 1;
    player.being_revived_by_robot = 1;
    vector = vectornormalize(player.origin - self.origin);
    angles = vectortoangles(vector);
    self teleport(self.origin, angles);
    if (isdefined(self.var_69bfb00a)) {
        self [[ self.var_69bfb00a ]](angles);
    } else {
        self thread animation::play("ai_robot_base_stn_exposed_revive", self, angles, 1.5);
    }
    wait(0.67);
    player clientfield::set("being_robot_revived", 1);
    player thread laststand::revive_hud_show_n_fade(#"hash_3346a327a4a83f8", 3, undefined);
    self waittill(#"robot_revive_complete");
    if (level.players.size == 1 && level flag::get("solo_game")) {
        self.var_5f694f04 = gettime() + 10000;
    } else {
        self.var_5f694f04 = gettime() + 5000;
    }
    if (isdefined(level.a_revive_success_perk_func)) {
        foreach (func in level.a_revive_success_perk_func) {
            self [[ func ]]();
        }
    }
    level.var_ff482f76 zm_laststand_client::close(player);
    level.var_1c957023 self_revive_visuals::close(player);
    player thread zm_laststand::revive_success(self, 0);
    player notify(#"stop_revive_trigger");
    level.var_ee623e8 = 0;
    players = getplayers();
    if (players.size == 1 && level flag::get("solo_game") && isdefined(player.waiting_to_revive) && player.waiting_to_revive) {
        level.solo_game_free_player_quickrevive = 1;
        player thread zm_perks::function_a7ae070c(#"specialty_quickrevive");
    }
    self zod_companion_revive_cleanup(player);
}

// Namespace zodcompanionbehavior/archetype_zod_companion
// Params 1, eflags: 0x1 linked
// Checksum 0x1aa125fb, Offset: 0x32a0
// Size: 0x106
function zod_companion_monitor_revive_attempt(player) {
    self endon(#"death", #"revive_terminated");
    while (1) {
        if (!isdefined(player)) {
            self zod_companion_revive_cleanup(player);
        }
        if (isdefined(player.revivetrigger) && player.revivetrigger.beingrevived === 1 && player.being_revived_by_robot !== 1) {
            self zod_companion_revive_cleanup(player);
        }
        if (!(isdefined(player laststand::player_is_in_laststand()) && player laststand::player_is_in_laststand())) {
            self zod_companion_revive_cleanup(player);
        }
        waitframe(1);
    }
}

// Namespace zodcompanionbehavior/archetype_zod_companion
// Params 1, eflags: 0x1 linked
// Checksum 0x96cd6226, Offset: 0x33b0
// Size: 0x9e
function zod_companion_revive_cleanup(player) {
    self val::reset(#"zod_companion", "ignoreall");
    self.reviving_a_player = 0;
    if (isdefined(player)) {
        if (player.being_revived_by_robot == 1) {
            player.being_revived_by_robot = 0;
        }
        player clientfield::set("being_robot_revived", 0);
    }
    self notify(#"revive_terminated");
}

// Namespace zodcompanionbehavior/archetype_zod_companion
// Params 1, eflags: 0x5 linked
// Checksum 0x9e6fa6ff, Offset: 0x3458
// Size: 0xd4
function private zodcompanionfinishedsprinttransition(behaviortreeentity) {
    behaviortreeentity.sprint_transition_happening = 0;
    if (behaviortreeentity getblackboardattribute("_locomotion_speed") == "locomotion_speed_walk") {
        behaviortreeentity ai::set_behavior_attribute("sprint", 1);
        behaviortreeentity setblackboardattribute("_locomotion_speed", "locomotion_speed_sprint");
    } else {
        behaviortreeentity ai::set_behavior_attribute("sprint", 0);
        behaviortreeentity setblackboardattribute("_locomotion_speed", "locomotion_speed_walk");
    }
}

// Namespace zodcompanionbehavior/archetype_zod_companion
// Params 1, eflags: 0x5 linked
// Checksum 0x9671a3ae, Offset: 0x3538
// Size: 0xea
function private zodcompanionkeepscurrentmovementmode(behaviortreeentity) {
    var_202e5b5c = 262144;
    var_c351bd17 = 147456;
    dist = distancesquared(behaviortreeentity.origin, behaviortreeentity.companion_anchor_point);
    if (dist > var_202e5b5c && behaviortreeentity getblackboardattribute("_locomotion_speed") == "locomotion_speed_walk") {
        return 0;
    }
    if (dist < var_c351bd17 && behaviortreeentity getblackboardattribute("_locomotion_speed") == "locomotion_speed_sprint") {
        return 0;
    }
    return 1;
}

// Namespace zodcompanionbehavior/archetype_zod_companion
// Params 1, eflags: 0x5 linked
// Checksum 0x552791, Offset: 0x3630
// Size: 0x28
function private zodcompanionsprinttransitioning(behaviortreeentity) {
    if (behaviortreeentity.sprint_transition_happening === 1) {
        return 1;
    }
    return 0;
}

#namespace zodcompanionserverutils;

// Namespace zodcompanionserverutils/archetype_zod_companion
// Params 4, eflags: 0x5 linked
// Checksum 0xb08679d8, Offset: 0x3660
// Size: 0x134
function private _trygibbinghead(entity, damage, hitloc, isexplosive) {
    if (isexplosive && randomfloatrange(0, 1) <= 0.5) {
        gibserverutils::gibhead(entity);
    } else if (isinarray(array("head", "neck", "helmet"), hitloc) && randomfloatrange(0, 1) <= 1) {
        gibserverutils::gibhead(entity);
    } else if (entity.health - damage <= 0 && randomfloatrange(0, 1) <= 0.25) {
        gibserverutils::gibhead(entity);
    }
}

// Namespace zodcompanionserverutils/archetype_zod_companion
// Params 4, eflags: 0x5 linked
// Checksum 0x513735b1, Offset: 0x37a0
// Size: 0x26c
function private _trygibbinglimb(entity, damage, hitloc, isexplosive) {
    if (gibserverutils::isgibbed(entity, 32) || gibserverutils::isgibbed(entity, 16)) {
        return;
    }
    if (isexplosive && randomfloatrange(0, 1) <= 0.25) {
        if (entity.health - damage <= 0 && entity.allowdeath && math::cointoss()) {
            gibserverutils::gibrightarm(entity);
        } else {
            gibserverutils::gibleftarm(entity);
        }
    } else if (isinarray(array("left_hand", "left_arm_lower", "left_arm_upper"), hitloc)) {
        gibserverutils::gibleftarm(entity);
    } else if (entity.health - damage <= 0 && entity.allowdeath && isinarray(array("right_hand", "right_arm_lower", "right_arm_upper"), hitloc)) {
        gibserverutils::gibrightarm(entity);
    } else if (entity.health - damage <= 0 && entity.allowdeath && randomfloatrange(0, 1) <= 0.25) {
        if (math::cointoss()) {
            gibserverutils::gibleftarm(entity);
        } else {
            gibserverutils::gibrightarm(entity);
        }
    }
}

// Namespace zodcompanionserverutils/archetype_zod_companion
// Params 5, eflags: 0x5 linked
// Checksum 0xfe9b2502, Offset: 0x3a18
// Size: 0x364
function private _trygibbinglegs(entity, damage, hitloc, isexplosive, attacker = entity) {
    cangiblegs = entity.health - damage <= 0 && entity.allowdeath;
    cangiblegs = cangiblegs || (entity.health - damage) / entity.maxhealth <= 0.25 && distancesquared(entity.origin, attacker.origin) <= 360000 && entity.allowdeath;
    if (entity.health - damage <= 0 && entity.allowdeath && isexplosive && randomfloatrange(0, 1) <= 0.5) {
        gibserverutils::giblegs(entity);
        entity startragdoll();
    } else if (cangiblegs && isinarray(array("left_leg_upper", "left_leg_lower", "left_foot"), hitloc) && randomfloatrange(0, 1) <= 1) {
        if (entity.health - damage > 0) {
            entity.becomecrawler = 1;
        }
        gibserverutils::gibleftleg(entity);
    } else if (cangiblegs && isinarray(array("right_leg_upper", "right_leg_lower", "right_foot"), hitloc) && randomfloatrange(0, 1) <= 1) {
        if (entity.health - damage > 0) {
            entity.becomecrawler = 1;
        }
        gibserverutils::gibrightleg(entity);
    } else if (entity.health - damage <= 0 && entity.allowdeath && randomfloatrange(0, 1) <= 0.25) {
        if (math::cointoss()) {
            gibserverutils::gibleftleg(entity);
        } else {
            gibserverutils::gibrightleg(entity);
        }
    }
}

// Namespace zodcompanionserverutils/archetype_zod_companion
// Params 12, eflags: 0x5 linked
// Checksum 0x4d7211be, Offset: 0x3d88
// Size: 0x180
function private zodcompaniongibdamageoverride(inflictor, attacker, damage, flags, meansofdeath, weapon, point, dir, hitloc, offsettime, boneindex, modelindex) {
    entity = self;
    if ((entity.health - damage) / entity.maxhealth > 0.75) {
        return damage;
    }
    gibserverutils::togglespawngibs(entity, 1);
    isexplosive = isinarray(array("MOD_GRENADE", "MOD_GRENADE_SPLASH", "MOD_PROJECTILE", "MOD_PROJECTIVLE_SPLASH", "MOD_EXPLOSIVE"), meansofdeath);
    _trygibbinghead(entity, damage, hitloc, isexplosive);
    _trygibbinglimb(entity, damage, hitloc, isexplosive);
    _trygibbinglegs(entity, damage, hitloc, isexplosive, attacker);
    return damage;
}

// Namespace zodcompanionserverutils/archetype_zod_companion
// Params 12, eflags: 0x4
// Checksum 0xf134845a, Offset: 0x3f10
// Size: 0x218
function private zodcompaniondestructdeathoverride(inflictor, attacker, damage, flags, meansofdeath, weapon, point, dir, hitloc, offsettime, boneindex, modelindex) {
    entity = self;
    if (entity.health - damage <= 0) {
        destructserverutils::togglespawngibs(entity, 1);
        piececount = destructserverutils::getpiececount(entity);
        possiblepieces = [];
        for (index = 1; index <= piececount; index++) {
            if (!destructserverutils::isdestructed(entity, index) && randomfloatrange(0, 1) <= 0.2) {
                possiblepieces[possiblepieces.size] = index;
            }
        }
        gibbedpieces = 0;
        for (index = 0; index < possiblepieces.size && possiblepieces.size > 1 && gibbedpieces < 2; index++) {
            randompiece = randomintrange(0, possiblepieces.size - 1);
            if (!destructserverutils::isdestructed(entity, possiblepieces[randompiece])) {
                destructserverutils::destructpiece(entity, possiblepieces[randompiece]);
                gibbedpieces++;
            }
        }
    }
    return damage;
}

// Namespace zodcompanionserverutils/archetype_zod_companion
// Params 12, eflags: 0x5 linked
// Checksum 0xa5698f08, Offset: 0x4130
// Size: 0xd2
function private zodcompaniondamageoverride(inflictor, attacker, damage, flags, meansofdeath, weapon, point, dir, hitloc, offsettime, boneindex, modelindex) {
    entity = self;
    if (hitloc == "helmet" || hitloc == "head" || hitloc == "neck") {
        damage = int(damage * 0.5);
    }
    return damage;
}

// Namespace zodcompanionserverutils/archetype_zod_companion
// Params 1, eflags: 0x4
// Checksum 0xebd44101, Offset: 0x4210
// Size: 0x78
function private findclosestnavmeshpositiontoenemy(enemy) {
    enemypositiononnavmesh = undefined;
    for (tolerancelevel = 1; tolerancelevel <= 4; tolerancelevel++) {
        enemypositiononnavmesh = getclosestpointonnavmesh(enemy.origin, 200 * tolerancelevel);
        if (isdefined(enemypositiononnavmesh)) {
            break;
        }
    }
    return enemypositiononnavmesh;
}

// Namespace zodcompanionserverutils/archetype_zod_companion
// Params 0, eflags: 0x5 linked
// Checksum 0x30ce70e8, Offset: 0x4290
// Size: 0x234
function private zodcompanionsoldierspawnsetup() {
    entity = self;
    entity.combatmode = "cover";
    entity.fullhealth = entity.health;
    entity.controllevel = 0;
    entity.steppedoutofcover = 0;
    entity.startingweapon = entity.weapon;
    entity.jukedistance = 90;
    entity.jukemaxdistance = 600;
    entity.entityradius = 15;
    entity.base_accuracy = entity.accuracy;
    entity.highlyawareradius = 256;
    entity.treatallcoversasgeneric = 1;
    entity.onlycroucharrivals = 1;
    entity.nextpreemptivejukeads = randomfloatrange(0.5, 0.95);
    entity.shouldpreemptivejuke = math::cointoss();
    entity.reviving_a_player = 0;
    aiutility::addaioverridedamagecallback(entity, &destructserverutils::handledamage);
    aiutility::addaioverridedamagecallback(entity, &zodcompaniondamageoverride);
    aiutility::addaioverridedamagecallback(entity, &zodcompaniongibdamageoverride);
    entity.companion_anchor_point = entity.origin;
    entity.next_move_time = gettime();
    entity.allow_zombie_to_target_ai = 1;
    entity val::set(#"zod_companion", "ignoreme", 1);
    entity thread zodcompanionutility::function_dbd6fcc6();
    entity thread zodcompanionutility::manage_companion();
}

#namespace zodcompanionutility;

// Namespace zodcompanionutility/archetype_zod_companion
// Params 0, eflags: 0x1 linked
// Checksum 0x508ee58f, Offset: 0x44d0
// Size: 0x70
function manage_companion() {
    self endon(#"death");
    while (1) {
        if (!self.reviving_a_player) {
            if (!isdefined(self.leader) || !self.leader.eligible_leader) {
                self define_new_leader();
            }
        }
        wait(0.5);
    }
}

// Namespace zodcompanionutility/archetype_zod_companion
// Params 0, eflags: 0x1 linked
// Checksum 0x76773905, Offset: 0x4548
// Size: 0x9e
function function_dbd6fcc6() {
    self.var_2f03f56a = [];
    self.var_2f03f56a[0] = "double_points";
    self.var_2f03f56a[1] = "fire_sale";
    self.var_2f03f56a[2] = "insta_kill";
    self.var_2f03f56a[3] = "nuke";
    self.var_2f03f56a[4] = "full_ammo";
    self.var_2f03f56a[5] = "insta_kill_ug";
}

// Namespace zodcompanionutility/archetype_zod_companion
// Params 0, eflags: 0x1 linked
// Checksum 0x9586c574, Offset: 0x45f0
// Size: 0x346
function define_new_leader() {
    if (isdefined(level.var_1a612d42) && level.var_1a612d42.eligible_leader) {
        self.leader = level.var_1a612d42;
    } else {
        a_potential_leaders = get_potential_leaders(self);
        closest_leader = undefined;
        closest_distance = 1000000;
        if (a_potential_leaders.size == 0) {
            self.leader = undefined;
        } else if (getdvarint(#"hash_6d35b5921943876a", 1)) {
            playerpositions = [];
            foreach (potential_leader in a_potential_leaders) {
                if (!isdefined(playerpositions)) {
                    playerpositions = [];
                } else if (!isarray(playerpositions)) {
                    playerpositions = array(playerpositions);
                }
                playerpositions[playerpositions.size] = potential_leader.origin;
            }
            pathdata = generatenavmeshpath(self.origin, playerpositions, self);
            if (isdefined(pathdata) && pathdata.status === "succeeded") {
                goalpos = pathdata.pathpoints[pathdata.pathpoints.size - 1];
                foreach (potential_leader in a_potential_leaders) {
                    if (distancesquared(potential_leader.origin, goalpos) < 16 * 16) {
                        self.leader = potential_leader;
                        break;
                    }
                }
            }
        } else {
            foreach (potential_leader in a_potential_leaders) {
                dist = pathdistance(self.origin, potential_leader.origin);
                if (isdefined(dist) && dist < closest_distance) {
                    closest_distance = dist;
                    self.leader = potential_leader;
                }
            }
        }
    }
}

// Namespace zodcompanionutility/archetype_zod_companion
// Params 1, eflags: 0x1 linked
// Checksum 0xfa613527, Offset: 0x4940
// Size: 0x102
function get_potential_leaders(companion) {
    a_potential_leaders = [];
    foreach (player in level.players) {
        if (!isdefined(player.eligible_leader)) {
            player.eligible_leader = 1;
        }
        if (isdefined(player.eligible_leader) && player.eligible_leader && companion findpath(companion.origin, player.origin)) {
            a_potential_leaders[a_potential_leaders.size] = player;
        }
    }
    return a_potential_leaders;
}

