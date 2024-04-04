// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm\perk\zm_perk_wolf_protector.gsc;
#using scripts\zm\ai\zm_ai_dog.gsc;
#using scripts\core_common\ai\systems\gib.gsc;
#using scripts\core_common\ai\systems\behavior_tree_utility.gsc;
#using scripts\core_common\ai\systems\animation_state_machine_notetracks.gsc;
#using scripts\core_common\ai\systems\animation_state_machine_mocomp.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using script_3819e7a1427df6d2;
#using scripts\core_common\ai\archetype_utility.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace zm_ai_wolf_ally;

// Namespace zm_ai_wolf_ally
// Method(s) 2 Total 2
class class_b382833a {

    // Namespace class_b382833a/zm_ai_wolf_ally
    // Params 0, eflags: 0x9 linked
    // Checksum 0x4b76996c, Offset: 0x2198
    // Size: 0x1a
    __constructor() {
        self.adjustmentstarted = 0;
        self.var_425c4c8b = 1;
    }

    // Namespace class_b382833a/zm_ai_wolf_ally
    // Params 0, eflags: 0x91 linked class_linked
    // Checksum 0x80f724d1, Offset: 0x21c0
    // Size: 0x4
    __destructor() {
        
    }

}

// Namespace zm_ai_wolf_ally/zm_ai_wolf_ally
// Params 0, eflags: 0x2
// Checksum 0xab4ec432, Offset: 0x1b0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_ai_wolf_ally", &__init__, &__main__, undefined);
}

// Namespace zm_ai_wolf_ally/zm_ai_wolf_ally
// Params 0, eflags: 0x1 linked
// Checksum 0x882d267e, Offset: 0x200
// Size: 0x3ec
function __init__() {
    spawner::add_archetype_spawn_function(#"zombie_dog", &function_7728abc3);
    /#
        assert(isscriptfunctionptr(&function_ba0f4046));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_618060e9f5751d51", &function_ba0f4046);
    /#
        assert(isscriptfunctionptr(&function_4e970354));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_147f534982ab5107", &function_4e970354);
    /#
        assert(isscriptfunctionptr(&function_87660c12));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_495c48ce4f6ff5d5", &function_87660c12);
    /#
        assert(isscriptfunctionptr(&function_14a8c157));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_37e69fc4aa586d70", &function_14a8c157);
    /#
        assert(isscriptfunctionptr(&function_af59b7a5));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_27d92cd57ceec9c5", &function_af59b7a5, 2);
    /#
        assert(isscriptfunctionptr(&function_dba8e076));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4a484f874e45e3a2", &function_dba8e076, 1);
    /#
        assert(isscriptfunctionptr(&function_3e4b2405));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2ecf1cdbc4b0917c", &function_3e4b2405, 1);
    animationstatenetwork::registernotetrackhandlerfunction("wolf_ally_melee", &function_f7c7a416);
    animationstatenetwork::registeranimationmocomp("mocomp_zm_wolf_ally_charge_melee", &function_26fcd34f, &function_e023eac9, &function_643e9ba3);
    /#
        zm_devgui::function_c7dd7a17("<unknown string>", "<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
    #/
}

// Namespace zm_ai_wolf_ally/zm_ai_wolf_ally
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x5f8
// Size: 0x4
function __main__() {
    
}

// Namespace zm_ai_wolf_ally/zm_ai_wolf_ally
// Params 0, eflags: 0x5 linked
// Checksum 0xfa6e0874, Offset: 0x608
// Size: 0x104
function private function_7728abc3() {
    if (isdefined(self.var_9fde8624) && self.var_9fde8624 == #"zombie_wolf_ally") {
        aiutility::addaioverridedamagecallback(self, &function_462df450);
        self allowpitchangle(1);
        self setpitchorient();
        self.ignore_nuke = 1;
        self.ignore_all_poi = 1;
        self.instakill_func = &zm_powerups::function_16c2586a;
        self.var_84f9cc2e = 0;
        self.var_1dddf9ab = &function_18da2db6;
        self.var_951e8469 = 0;
        self.next_move_time = 0;
        self.var_594b7855 = 1;
        /#
            self thread function_6ca1cd82();
        #/
    }
}

// Namespace zm_ai_wolf_ally/zm_ai_wolf_ally
// Params 4, eflags: 0x4
// Checksum 0xfcc5c3a3, Offset: 0x718
// Size: 0x250
function private function_6ca1cd82(entity, player, duration, color) {
    self endon(#"death");
    while (true) {
        waitframe(1);
        enabled = getdvarint(#"hash_41b3d8e4a16a265e", 0);
        if (enabled) {
            var_bf50a54d = self getcentroid();
            player_owner = function_f00b611e();
            if (isdefined(player_owner)) {
                player_centroid = player_owner getcentroid();
                color = (1, 0, 0);
                if (gettime() > self.var_84f9cc2e) {
                    color = (0, 1, 0);
                }
                /#
                    line(player_centroid, var_bf50a54d, color);
                    sphere(var_bf50a54d, 2, color, 1, 0, 4, 1);
                    distance = distance(player_centroid, var_bf50a54d);
                    print3d(var_bf50a54d + vectorscale((0, 0, 1), 30), "<unknown string>" + distance, color, 1, 1, 1);
                #/
                locomotion_target = zm_ai_dog::get_locomotion_target(self);
                if (isdefined(locomotion_target)) {
                    /#
                        line(locomotion_target, var_bf50a54d, (1, 1, 0));
                    #/
                    continue;
                }
                if (isdefined(self.favoriteenemy)) {
                    /#
                        line(self.favoriteenemy getcentroid(), var_bf50a54d, (1, 1, 0));
                    #/
                }
            }
        }
    }
}

// Namespace zm_ai_wolf_ally/zm_ai_wolf_ally
// Params 12, eflags: 0x5 linked
// Checksum 0x902f6697, Offset: 0x970
// Size: 0x66
function private function_462df450(inflictor, attacker, damage, flags, meansofdamage, weapon, point, dir, hitloc, offsettime, boneindex, modelindex) {
    return false;
}

// Namespace zm_ai_wolf_ally/zm_ai_wolf_ally
// Params 2, eflags: 0x5 linked
// Checksum 0xff7de26e, Offset: 0x9e0
// Size: 0xe6
function private function_bd0a9007(entity, target) {
    result = 1;
    if (!zm_ai_dog::is_target_valid(entity, target) || !(isdefined(target.completed_emerging_into_playable_area) && target.completed_emerging_into_playable_area) || isdefined(target.in_gravity_trap) && target.in_gravity_trap || isdefined(target.var_105c6f35) && target.var_105c6f35 || isdefined(target.archetype) && target.archetype == #"dust_ball") {
        result = 0;
    }
    return result;
}

// Namespace zm_ai_wolf_ally/zm_ai_wolf_ally
// Params 2, eflags: 0x5 linked
// Checksum 0x3d2f9788, Offset: 0xad0
// Size: 0x102
function private function_e0b49b0b(left, right) {
    if (isdefined(left.var_15da7e3f) && !isdefined(right.var_15da7e3f)) {
        return true;
    } else if (!isdefined(left.var_15da7e3f) && isdefined(right.var_15da7e3f)) {
        return false;
    }
    if (isdefined(left.var_15da7e3f) && isdefined(right.var_15da7e3f) && left.var_15da7e3f > right.var_15da7e3f) {
        return true;
    }
    if (isdefined(left.var_eadd94e6) && isdefined(right.var_eadd94e6) && left.var_eadd94e6 > right.var_eadd94e6) {
        return true;
    }
    return false;
}

// Namespace zm_ai_wolf_ally/zm_ai_wolf_ally
// Params 1, eflags: 0x5 linked
// Checksum 0x3ccc07b0, Offset: 0xbe0
// Size: 0x28a
function private get_favorite_enemy(entity) {
    targets = [];
    targets = getaiteamarray(level.zombie_team);
    valid_targets = [];
    for (i = 0; i < targets.size; i++) {
        if (isdefined(targets[i].var_6f84b820) && targets[i].var_6f84b820 == #"boss") {
            continue;
        }
        player_owner = function_f00b611e();
        if (isdefined(player_owner)) {
            var_53a7e303 = distancesquared(player_owner.origin, targets[i].origin);
            height_difference = abs(player_owner.origin[2] - targets[i].origin[2]);
            if (var_53a7e303 > 202500 || height_difference > 180) {
                continue;
            }
        }
        if (!function_bd0a9007(entity, targets[i])) {
            continue;
        }
        if (isdefined(targets[i].var_15da7e3f) && gettime() < targets[i].var_15da7e3f + 1000) {
            continue;
        }
        targets[i].var_eadd94e6 = distancesquared(entity.origin, targets[i].origin);
        valid_targets[valid_targets.size] = targets[i];
    }
    if (valid_targets.size > 0) {
        if (valid_targets.size > 1) {
            array::bubble_sort(valid_targets, &function_e0b49b0b);
        }
        return valid_targets[valid_targets.size - 1];
    }
    return undefined;
}

// Namespace zm_ai_wolf_ally/zm_ai_wolf_ally
// Params 1, eflags: 0x5 linked
// Checksum 0xb44184d5, Offset: 0xe78
// Size: 0x634
function private function_af59b7a5(entity) {
    player_owner = function_f00b611e();
    if (!isdefined(player_owner)) {
        return;
    }
    if (isdefined(entity.favoriteenemy) && !function_bd0a9007(entity, entity.favoriteenemy)) {
        entity.favoriteenemy = undefined;
    }
    if (!isdefined(entity.favoriteenemy) || isdefined(entity.favoriteenemy.var_15da7e3f)) {
        entity.favoriteenemy = get_favorite_enemy(entity);
    }
    if (gettime() > entity.var_84f9cc2e && isdefined(entity.favoriteenemy) && isalive(entity.favoriteenemy)) {
        if (isdefined(level.enemy_location_override_func)) {
            goalpos = [[ level.enemy_location_override_func ]](entity, entity.favoriteenemy);
            if (isdefined(goalpos)) {
                entity setgoal(goalpos);
                return;
            }
        }
        locomotion_target = zm_ai_dog::get_locomotion_target(entity);
        if (isdefined(locomotion_target) && (!isdefined(entity.lasttargetposition) || distancesquared(entity.lasttargetposition, locomotion_target) > 16 * 16 || !entity haspath())) {
            path = generatenavmeshpath(entity.origin, locomotion_target, entity);
            if (isdefined(path) && isdefined(path.pathdistance) && isdefined(player_owner) && path.pathdistance > 3000) {
                player_owner.var_772b4ad2 = int(5) + 1;
            } else if (!isdefined(path) || !isdefined(path.pathpoints) || path.pathpoints.size == 0) {
                entity.favoriteenemy.var_15da7e3f = gettime();
            } else {
                entity.lasttargetposition = locomotion_target;
                entity.favoriteenemy.var_15da7e3f = undefined;
                entity setgoal(locomotion_target);
            }
        }
        return;
    }
    if (isdefined(player_owner.last_valid_position)) {
        var_3050773c = distance2d(entity.origin, player_owner.last_valid_position);
        var_7f215628 = abs(entity.origin[2] - player_owner.last_valid_position[2]);
        var_b270b65e = 450 / 2;
        if (var_7f215628 > 200 || var_3050773c > 300 || var_3050773c > var_b270b65e && !entity isingoal(entity.origin)) {
            entity.var_951e8469 = 0;
            if (!isdefined(player_owner.var_15da7e3f) || gettime() > player_owner.var_15da7e3f + 300) {
                path = generatenavmeshpath(entity.origin, player_owner.last_valid_position, entity);
                if (isdefined(path) && isdefined(path.pathdistance) && isdefined(player_owner) && path.pathdistance > 3000) {
                    player_owner.var_772b4ad2 = int(5) + 1;
                } else if (!isdefined(path) || !isdefined(path.pathpoints) || path.pathpoints.size == 0) {
                    player_owner.var_15da7e3f = gettime();
                    if (!isdefined(player_owner.var_772b4ad2)) {
                        player_owner.var_772b4ad2 = 0;
                    }
                    player_owner.var_772b4ad2 = player_owner.var_772b4ad2 + 1;
                } else {
                    player_owner.var_15da7e3f = undefined;
                    player_owner.var_772b4ad2 = undefined;
                    entity setgoal(player_owner.last_valid_position);
                }
            }
            return;
        }
        if (var_3050773c <= 300 && entity.var_951e8469 < 1.5) {
            player_owner.var_15da7e3f = undefined;
            entity.var_951e8469 = entity.var_951e8469 + float(function_60d95f53()) / 1000;
            entity setgoal(entity.origin);
            return;
        }
        if (gettime() > entity.next_move_time) {
            entity pick_new_movement_point();
        }
    }
}

// Namespace zm_ai_wolf_ally/zm_ai_wolf_ally
// Params 1, eflags: 0x5 linked
// Checksum 0x7af2f05a, Offset: 0x14b8
// Size: 0x96
function private function_dba8e076(entity) {
    player_owner = function_f00b611e();
    if (!isdefined(player_owner)) {
        players = getplayers();
        if (players.size > 0) {
            entity.var_93a62fe = arraygetclosest(entity.origin, players);
            return;
        }
        entity.var_93a62fe = undefined;
    }
}

// Namespace zm_ai_wolf_ally/zm_ai_wolf_ally
// Params 1, eflags: 0x5 linked
// Checksum 0x4b14f764, Offset: 0x1558
// Size: 0x268
function private function_3e4b2405(entity) {
    goalinfo = entity function_4794d6a3();
    isatgoal = isdefined(goalinfo.isatgoal) && goalinfo.isatgoal;
    if (!isatgoal) {
        zombies = getaiteamarray(level.zombie_team);
        zombies = arraysortclosest(zombies, entity.origin, undefined, 0, entity getpathfindingradius() + 25);
        var_31a419e0 = [];
        foreach (zombie in zombies) {
            if (zombie.var_6f84b820 === #"basic" || zombie.var_6f84b820 === #"popcorn") {
                if (!isdefined(var_31a419e0)) {
                    var_31a419e0 = [];
                } else if (!isarray(var_31a419e0)) {
                    var_31a419e0 = array(var_31a419e0);
                }
                var_31a419e0[var_31a419e0.size] = zombie;
            }
        }
        foreach (zombie in var_31a419e0) {
            if (isdefined(entity.favoriteenemy) && entity.favoriteenemy == zombie) {
                continue;
            }
            zombie zombie_utility::setup_zombie_knockdown(entity);
        }
    }
}

// Namespace zm_ai_wolf_ally/zm_ai_wolf_ally
// Params 0, eflags: 0x5 linked
// Checksum 0xbc827d0b, Offset: 0x17c8
// Size: 0x4a
function private function_f00b611e() {
    result = undefined;
    if (isdefined(self.player_owner)) {
        result = self.player_owner;
    } else if (isdefined(self.var_93a62fe)) {
        result = self.var_93a62fe;
    }
    return result;
}

// Namespace zm_ai_wolf_ally/zm_ai_wolf_ally
// Params 0, eflags: 0x5 linked
// Checksum 0xb78c9711, Offset: 0x1820
// Size: 0xaa
function private function_18da2db6() {
    result = "walk";
    player_owner = function_f00b611e();
    if (function_804dd716(self) && isdefined(self.favoriteenemy) || isdefined(player_owner) && distance2dsquared(self.origin, player_owner.origin) > 250000) {
        result = "run";
    }
    return result;
}

// Namespace zm_ai_wolf_ally/zm_ai_wolf_ally
// Params 1, eflags: 0x5 linked
// Checksum 0x3e7aa94, Offset: 0x18d8
// Size: 0x1c
function private function_804dd716(entity) {
    return gettime() > entity.var_84f9cc2e;
}

// Namespace zm_ai_wolf_ally/zm_ai_wolf_ally
// Params 1, eflags: 0x5 linked
// Checksum 0xe427273, Offset: 0x1900
// Size: 0x128
function private function_ba0f4046(entity) {
    result = 0;
    if (gettime() > entity.var_84f9cc2e && !(isdefined(entity.ignoreall) && entity.ignoreall) && !(isdefined(level.intermission) && level.intermission) && function_bd0a9007(entity, entity.favoriteenemy)) {
        var_7e0e6341 = entity ai::function_9139c839();
        distance_sq = distancesquared(entity.origin, entity.favoriteenemy.origin);
        if (isdefined(var_7e0e6341) && distance_sq <= var_7e0e6341.normalmeleedist * var_7e0e6341.normalmeleedist) {
            result = 1;
        }
    }
    return result;
}

// Namespace zm_ai_wolf_ally/zm_ai_wolf_ally
// Params 1, eflags: 0x5 linked
// Checksum 0xb5371596, Offset: 0x1a30
// Size: 0x47c
function private function_f7c7a416(entity) {
    entity.melee_cooldown = gettime() + getdvarfloat(#"scr_zombiemeleecooldown", 1) * 1000;
    if (isdefined(entity.enemy) && !(isdefined(entity.marked_for_death) && entity.marked_for_death) && !(isdefined(entity.enemy.ignoreme) && entity.enemy.ignoreme)) {
        hit_enemy = entity melee();
        if (isdefined(hit_enemy)) {
            if (isalive(hit_enemy) && isdefined(hit_enemy.maxhealth)) {
                var_743a2772 = entity function_f00b611e();
                n_base_damage = hit_enemy.maxhealth;
                var_7e0e6341 = hit_enemy ai::function_9139c839();
                if (isdefined(var_7e0e6341) && isdefined(var_7e0e6341.damagescale)) {
                    var_b1c1c5cf = var_7e0e6341.damagescale;
                    if (var_b1c1c5cf > 0 && var_b1c1c5cf < 1) {
                        var_64cc5e50 = 1 / var_b1c1c5cf;
                        n_base_damage = n_base_damage * var_64cc5e50;
                    }
                }
                if (isdefined(hit_enemy.var_6f84b820)) {
                    switch (hit_enemy.var_6f84b820) {
                    case #"heavy":
                        n_base_damage = n_base_damage * 0.2;
                        break;
                    case #"miniboss":
                        n_base_damage = n_base_damage * 0.1;
                        break;
                    case #"boss":
                        n_base_damage = n_base_damage * 0.05;
                        break;
                    default:
                        break;
                    }
                }
                hit_enemy dodamage(n_base_damage, entity.origin, var_743a2772, entity, undefined, "MOD_MELEE", 0, level.weapondefault);
                if (!isalive(hit_enemy)) {
                    if (randomfloat(1) <= 0.8) {
                        hit_enemy zombie_utility::gib_random_part();
                    }
                    force = vectornormalize((hit_enemy.origin - entity.origin) * (1, 1, 0));
                    if (isdefined(entity.meleeinfo)) {
                        force = anglestoforward(entity.angles * (0, 1, 0));
                    }
                    if (force != (0, 0, 1) && force != (0, 0, -1)) {
                        side = vectorcross(force, (0, 0, 1));
                        force = rotatepointaroundaxis(force, side, randomfloatrange(0, 75));
                        force = force * randomfloatrange(30, 85);
                    }
                    hit_enemy startragdoll();
                    hit_enemy launchragdoll(force);
                }
            }
            self.var_84f9cc2e = gettime() + 500;
        }
        entity callback::callback(#"on_ai_melee");
    }
}

// Namespace zm_ai_wolf_ally/zm_ai_wolf_ally
// Params 0, eflags: 0x5 linked
// Checksum 0x292208a4, Offset: 0x1eb8
// Size: 0x19e
function private pick_new_movement_point() {
    anchor_point = self.origin;
    player_owner = function_f00b611e();
    if (isdefined(player_owner)) {
        anchor_point = player_owner.origin;
    }
    queryresult = positionquery_source_navigation(anchor_point, 96, 256, 128, 20, self);
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
    if (isdefined(self.companion_destination)) {
        self setgoal(self.companion_destination);
    }
    self.next_move_time = gettime() + randomintrange(3000, 8000);
}

// Namespace zm_ai_wolf_ally/zm_ai_wolf_ally
// Params 1, eflags: 0x5 linked
// Checksum 0xcd3a711b, Offset: 0x2060
// Size: 0x7c
function private function_4e970354(entity) {
    result = 0;
    player_owner = function_f00b611e();
    if (isdefined(player_owner) && isdefined(player_owner.var_772b4ad2) && player_owner.var_772b4ad2 * 300 >= 1500) {
        result = 1;
    }
    return result;
}

// Namespace zm_ai_wolf_ally/zm_ai_wolf_ally
// Params 1, eflags: 0x5 linked
// Checksum 0x8287c38c, Offset: 0x20e8
// Size: 0xa6
function private function_87660c12(entity) {
    player_owner = function_f00b611e();
    if (isdefined(player_owner)) {
        spawn_location = player_owner zm_perk_wolf_protector::function_562ade9e();
        if (isdefined(spawn_location)) {
            entity forceteleport(spawn_location);
            entity setgoal(entity.origin);
        }
    }
    player_owner.var_15da7e3f = undefined;
    player_owner.var_772b4ad2 = undefined;
    return 5;
}

// Namespace zm_ai_wolf_ally/zm_ai_wolf_ally
// Params 1, eflags: 0x1 linked
// Checksum 0xb10a34ec, Offset: 0x2260
// Size: 0x2ea
function function_14a8c157(entity) {
    if (isdefined(entity.enemy) && gettime() > entity.var_84f9cc2e) {
        if (!btapi_shouldchargemelee(entity)) {
            return false;
        }
        predictedenemypos = entity.enemy.origin;
        distancesq = distancesquared(entity.origin, entity.enemy.origin);
        var_7e0e6341 = entity ai::function_9139c839();
        if (isdefined(var_7e0e6341) && distancesq < var_7e0e6341.normalmeleedist * var_7e0e6341.normalmeleedist) {
            return false;
        }
        if (isplayer(entity.enemy) && distancesq >= 100 * 100) {
            if (entity.enemy issprinting()) {
                enemyvelocity = vectornormalize(entity.enemy getvelocity());
                var_7a61ad67 = vectornormalize(entity getvelocity());
                if (vectordot(var_7a61ad67, enemyvelocity) > cos(20)) {
                    /#
                        record3dtext("<unknown string>", entity.origin + vectorscale((0, 0, 1), 60), (1, 0, 0), "<unknown string>");
                    #/
                    return false;
                }
            }
        }
        if (abs(entity.origin[2] - entity.enemy.origin[2]) > 64) {
            return false;
        }
        if (!entity cansee(entity.enemy)) {
            return false;
        }
        if (!tracepassedonnavmesh(entity.origin, entity.enemy.origin, entity getpathfindingradius())) {
            return false;
        }
        return true;
    }
    return false;
}

// Namespace zm_ai_wolf_ally/zm_ai_wolf_ally
// Params 5, eflags: 0x1 linked
// Checksum 0x57534057, Offset: 0x2558
// Size: 0x45c
function function_26fcd34f(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    /#
        record3dtext("<unknown string>", entity.origin + vectorscale((0, 0, 1), 60), (1, 0, 0), "<unknown string>");
    #/
    entity animmode("gravity", 1);
    entity orientmode("face angle", entity.angles[1]);
    entity.usegoalanimweight = 1;
    entity pathmode("dont move");
    entity collidewithactors(0);
    entity.pushable = 0;
    entity pushplayer(0);
    if (isdefined(entity.enemy)) {
        dirtoenemy = vectornormalize(entity.enemy.origin - entity.origin);
        entity forceteleport(entity.origin, vectortoangles(dirtoenemy));
    }
    if (!isdefined(entity.meleeinfo)) {
        entity.meleeinfo = new class_b382833a();
        entity.meleeinfo.var_9bfa8497 = entity.origin;
        entity.meleeinfo.var_98bc84b7 = getnotetracktimes(mocompanim, "start_adjust")[0];
        entity.meleeinfo.var_6392c3a2 = getnotetracktimes(mocompanim, "end_adjust")[0];
        var_e397f54c = getmovedelta(mocompanim, 0, 1, entity);
        if (isdefined(entity.enemy)) {
            entity.meleeinfo.var_cb28f380 = entity.enemy.origin;
            enemy_distance = distance(entity.origin, entity.enemy.origin);
            /#
                recordcircle(entity.enemy.origin, 8, (1, 0, 0), "<unknown string>");
            #/
        } else {
            entity.meleeinfo.var_cb28f380 = entity localtoworldcoords(var_e397f54c);
        }
        /#
            movedelta = getmovedelta(mocompanim, 0, 1, entity);
            animendpos = entity localtoworldcoords(movedelta);
            distance = distance(entity.origin, animendpos);
            recordcircle(entity.meleeinfo.var_9bfa8497, 8, (0, 1, 0), "<unknown string>");
            recordcircle(animendpos, 8, (0, 1, 0), "<unknown string>");
            record3dtext("<unknown string>" + distance, animendpos, (0, 1, 0), "<unknown string>");
        #/
    }
}

// Namespace zm_ai_wolf_ally/zm_ai_wolf_ally
// Params 5, eflags: 0x1 linked
// Checksum 0xed8a56c1, Offset: 0x29c0
// Size: 0xd4c
function function_e023eac9(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    /#
        assert(isdefined(entity.meleeinfo));
    #/
    currentanimtime = entity getanimtime(mocompanim);
    offset = (1, 1, 1);
    if (isdefined(entity.enemy) && !entity.meleeinfo.adjustmentstarted && entity.meleeinfo.var_425c4c8b && currentanimtime >= entity.meleeinfo.var_98bc84b7) {
        predictedenemypos = entity.enemy.origin;
        velocity = entity.enemy getvelocity();
        if (length(velocity) > 0) {
            animlength = getanimlength(mocompanim) * 1000;
            var_16c6aa5b = entity.meleeinfo.var_6392c3a2 * animlength - entity.meleeinfo.var_98bc84b7 * animlength;
            var_b1145e11 = vectorscale(velocity, var_16c6aa5b / 1000);
            predictedenemypos = predictedenemypos + var_b1145e11;
        }
        entity.meleeinfo.adjustedendpos = predictedenemypos;
        /#
            recordsphere(entity.meleeinfo.var_cb28f380 + offset, 2, (1, 0, 1), "<unknown string>");
            recordsphere(entity.meleeinfo.adjustedendpos + offset, 4, (1, 0, 1), "<unknown string>");
            recordline(entity.meleeinfo.var_cb28f380 + offset, entity.meleeinfo.adjustedendpos + offset, (1, 0, 1), "<unknown string>");
        #/
        var_283a081d = distance(entity.meleeinfo.var_9bfa8497, entity.meleeinfo.var_cb28f380);
        var_cf699df5 = distancesquared(entity.meleeinfo.var_9bfa8497, entity.meleeinfo.var_cb28f380);
        var_5eef8d2d = distance(entity.meleeinfo.var_cb28f380, entity.meleeinfo.adjustedendpos);
        var_776ddabf = distancesquared(entity.meleeinfo.var_cb28f380, entity.meleeinfo.adjustedendpos);
        var_62670629 = distance(entity.meleeinfo.var_9bfa8497, entity.meleeinfo.adjustedendpos);
        var_65cbfb52 = distancesquared(entity.meleeinfo.var_9bfa8497, entity.meleeinfo.adjustedendpos);
        var_201660e6 = tracepassedonnavmesh(entity.meleeinfo.var_9bfa8497, entity.meleeinfo.adjustedendpos, entity getpathfindingradius());
        traceresult = bullettrace(entity.origin, entity.meleeinfo.adjustedendpos + vectorscale((0, 0, 1), 30), 0, entity);
        isvisible = traceresult[#"fraction"] == 1;
        var_535d098c = 0;
        if (isdefined(traceresult[#"hitloc"]) && traceresult[#"hitloc"] == "riotshield") {
            var_cc075bd0 = vectornormalize(entity.origin - entity.meleeinfo.adjustedendpos);
            entity.meleeinfo.adjustedendpos = entity.meleeinfo.adjustedendpos + vectorscale(var_cc075bd0, 50);
            var_535d098c = 1;
        }
        if (!var_201660e6) {
            /#
                record3dtext("<unknown string>", entity.origin + vectorscale((0, 0, 1), 60), (1, 0, 0), "<unknown string>");
            #/
            entity.meleeinfo.var_425c4c8b = 0;
        } else if (var_cf699df5 > var_65cbfb52 && var_776ddabf >= 0) {
            /#
                record3dtext("<unknown string>", entity.origin + vectorscale((0, 0, 1), 60), (1, 0, 0), "<unknown string>");
            #/
            entity.meleeinfo.var_425c4c8b = 0;
        } else if (var_65cbfb52 >= 300 * 300) {
            /#
                record3dtext("<unknown string>", entity.origin + vectorscale((0, 0, 1), 60), (1, 0, 0), "<unknown string>");
            #/
            entity.meleeinfo.var_425c4c8b = 0;
        }
        if (var_535d098c) {
            /#
                record3dtext("<unknown string>", entity.origin + vectorscale((0, 0, 1), 60), (1, 0, 0), "<unknown string>");
            #/
            entity.meleeinfo.var_425c4c8b = 1;
        }
        if (entity.meleeinfo.var_425c4c8b) {
            var_776ddabf = distancesquared(entity.meleeinfo.var_cb28f380, entity.meleeinfo.adjustedendpos);
            myforward = anglestoforward(entity.angles);
            var_1c3641f2 = (entity.enemy.origin[0], entity.enemy.origin[1], entity.origin[2]);
            dirtoenemy = vectornormalize(var_1c3641f2 - entity.origin);
            zdiff = entity.meleeinfo.var_cb28f380[2] - entity.enemy.origin[2];
            withinzrange = abs(zdiff) <= 45;
            withinfov = vectordot(myforward, dirtoenemy) > cos(30);
            var_7948b2f3 = withinzrange && withinfov;
            var_425c4c8b = (isvisible || var_535d098c) && var_7948b2f3;
            /#
                reasons = "<unknown string>" + isvisible + "<unknown string>" + withinzrange + "<unknown string>" + withinfov;
                if (var_425c4c8b) {
                    record3dtext(reasons, entity.origin + vectorscale((0, 0, 1), 60), (0, 1, 0), "<unknown string>");
                } else {
                    record3dtext(reasons, entity.origin + vectorscale((0, 0, 1), 60), (1, 0, 0), "<unknown string>");
                }
            #/
            if (var_425c4c8b) {
                var_90c3cdd2 = length(entity.meleeinfo.adjustedendpos - entity.meleeinfo.var_cb28f380);
                timestep = function_60d95f53();
                animlength = getanimlength(mocompanim) * 1000;
                starttime = entity.meleeinfo.var_98bc84b7 * animlength;
                stoptime = entity.meleeinfo.var_6392c3a2 * animlength;
                starttime = floor(starttime / timestep);
                stoptime = floor(stoptime / timestep);
                adjustduration = stoptime - starttime;
                entity.meleeinfo.var_10b8b6d1 = vectornormalize(entity.meleeinfo.adjustedendpos - entity.meleeinfo.var_cb28f380);
                entity.meleeinfo.var_8b9a15a6 = var_90c3cdd2 / adjustduration;
                entity.meleeinfo.var_425c4c8b = 1;
                entity.meleeinfo.adjustmentstarted = 1;
            } else {
                entity.meleeinfo.var_425c4c8b = 0;
            }
        }
    }
    if (entity.meleeinfo.adjustmentstarted && currentanimtime <= entity.meleeinfo.var_6392c3a2) {
        /#
            assert(isdefined(entity.meleeinfo.var_10b8b6d1) && isdefined(entity.meleeinfo.var_8b9a15a6));
        #/
        adjustedorigin = entity.origin + entity.meleeinfo.var_10b8b6d1 * entity.meleeinfo.var_8b9a15a6;
        /#
            recordsphere(entity.meleeinfo.var_cb28f380, 3, (0, 1, 0), "<unknown string>");
            recordsphere(adjustedorigin + offset, 1, (0, 0, 1), "<unknown string>");
            recordline(entity.origin + offset, adjustedorigin + offset, (0, 0, 1), "<unknown string>");
        #/
        entity forceteleport(adjustedorigin);
    }
}

// Namespace zm_ai_wolf_ally/zm_ai_wolf_ally
// Params 5, eflags: 0x1 linked
// Checksum 0xf8284498, Offset: 0x3718
// Size: 0xbe
function function_643e9ba3(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    entity.usegoalanimweight = 0;
    entity pathmode("move allowed");
    entity orientmode("face default");
    entity collidewithactors(1);
    entity pushplayer(1);
    entity.pushable = 1;
    entity.meleeinfo = undefined;
}

