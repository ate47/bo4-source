// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_aoe.gsc;
#using scripts\zm_common\ai\zm_ai_utility.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\ai\systems\gib.gsc;
#using script_2c5daa95f8fec03c;
#using scripts\core_common\ai\systems\blackboard.gsc;
#using scripts\core_common\ai\systems\behavior_tree_utility.gsc;
#using scripts\core_common\ai\systems\animation_state_machine_utility.gsc;
#using scripts\core_common\ai\systems\animation_state_machine_notetracks.gsc;
#using scripts\core_common\ai\systems\ai_interface.gsc;
#using scripts\core_common\ai\systems\ai_blackboard.gsc;
#using scripts\core_common\ai\archetype_elephant.gsc;
#using script_3819e7a1427df6d2;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\aat_shared.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace zm_ai_elephant;

// Namespace zm_ai_elephant/zm_ai_elephant
// Params 0, eflags: 0x2
// Checksum 0x1b7f4a85, Offset: 0x308
// Size: 0x44
function autoexec main() {
    registerbehaviorscriptfunctions();
    spawner::add_archetype_spawn_function(#"elephant", &function_4c731a08);
}

// Namespace zm_ai_elephant/zm_ai_elephant
// Params 0, eflags: 0x5 linked
// Checksum 0x4be8a720, Offset: 0x358
// Size: 0xa4
function private registerbehaviorscriptfunctions() {
    animation::add_global_notetrack_handler("arrow_throw", &function_aef0aaa4, 0);
    animation::add_global_notetrack_handler("spear_unhide", &function_882f233, 0);
    animation::add_global_notetrack_handler("spear_hide", &function_e41280fd, 0);
    animation::add_global_notetrack_handler("start_gib", &function_dae74ff5, 0);
}

// Namespace zm_ai_elephant/zm_ai_elephant
// Params 0, eflags: 0x5 linked
// Checksum 0xb22e7f1a, Offset: 0x408
// Size: 0x19c
function private function_4c731a08() {
    if (!(isdefined(level.var_c8d8fe54) && level.var_c8d8fe54)) {
        level thread aat::register_immunity("zm_aat_brain_decay", #"elephant", 1, 0, 0);
        level thread aat::register_immunity("zm_aat_frostbite", #"elephant", 1, 0, 0);
        level thread aat::register_immunity("zm_aat_kill_o_watt", #"elephant", 1, 0, 0);
        level thread aat::register_immunity("zm_aat_plasmatic_burst", #"elephant", 1, 0, 0);
        level.var_c8d8fe54 = 1;
    }
    self.ai.var_502d9d0d = &function_502d9d0d;
    self.var_126d7bef = 1;
    self.b_ignore_cleanup = 1;
    aiutility::addaioverridedamagecallback(self, &function_6b086058);
    self.ai.var_64eb729e = &function_9b64dc73;
    level.var_b394f92f = &function_767db9a1;
    function_deb99302();
}

// Namespace zm_ai_elephant/zm_ai_elephant
// Params 0, eflags: 0x5 linked
// Checksum 0x11cd8a05, Offset: 0x5b0
// Size: 0x6e
function private function_deb99302() {
    if (isdefined(level.var_a92449fa)) {
        return;
    }
    level.var_a92449fa = struct::get_array("spear_throw_pos", "targetname");
    level.var_5feff7d0 = &function_848ff0cc;
    level.var_6efc944c = &function_ad0f2b39;
}

// Namespace zm_ai_elephant/zm_ai_elephant
// Params 5, eflags: 0x5 linked
// Checksum 0xecbcf4ae, Offset: 0x628
// Size: 0x7a
function private function_767db9a1(attacker, weapon, boneindex, hitloc, point) {
    var_786d7e06 = zm_ai_utility::function_422fdfd4(self, attacker, weapon, boneindex, hitloc, point);
    damage_scale = var_786d7e06.damage_scale;
    return damage_scale;
}

// Namespace zm_ai_elephant/zm_ai_elephant
// Params 1, eflags: 0x1 linked
// Checksum 0x1fc87a64, Offset: 0x6b0
// Size: 0x32
function function_ad0f2b39(aoe) {
    if (isdefined(aoe.userdata)) {
        aoe.userdata.inuse = 0;
    }
}

// Namespace zm_ai_elephant/zm_ai_elephant
// Params 2, eflags: 0x5 linked
// Checksum 0xc1c7236d, Offset: 0x6f0
// Size: 0x1a6
function private function_848ff0cc(elephant, rider) {
    if (isdefined(level.var_a92449fa)) {
        validstructs = [];
        foreach (struct in level.var_a92449fa) {
            if (!isdefined(struct.inuse) || !struct.inuse) {
                distsq = distancesquared(elephant.origin, struct.origin);
                if (distsq > 200 * 200) {
                    if (util::within_fov(rider.origin + (0, 0, -40), rider.angles, struct.origin, cos(70))) {
                        array::add(validstructs, struct);
                    }
                }
            }
        }
        if (validstructs.size) {
            struct = array::random(validstructs);
            struct.inuse = 1;
            return struct;
        }
    }
    return undefined;
}

// Namespace zm_ai_elephant/zm_ai_elephant
// Params 2, eflags: 0x5 linked
// Checksum 0xf0a40cb8, Offset: 0x8a0
// Size: 0x9a
function private function_9b64dc73(enemies, entity) {
    foreach (enemy in enemies) {
        enemy zombie_utility::setup_zombie_knockdown(entity);
        enemy.knockdown_type = "knockdown_stun";
    }
}

// Namespace zm_ai_elephant/zm_ai_elephant
// Params 2, eflags: 0x5 linked
// Checksum 0x2cada206, Offset: 0x948
// Size: 0x34
function private function_502d9d0d(entity, projectile) {
    projectile thread function_d13a21cb(entity, projectile);
}

// Namespace zm_ai_elephant/zm_ai_elephant
// Params 0, eflags: 0x5 linked
// Checksum 0x80f724d1, Offset: 0x988
// Size: 0x4
function private function_dae74ff5() {
    
}

// Namespace zm_ai_elephant/zm_ai_elephant
// Params 0, eflags: 0x5 linked
// Checksum 0xfbfd9cf9, Offset: 0x998
// Size: 0x4e
function private function_e41280fd() {
    if (isdefined(self.var_c8ec4813) && self.var_c8ec4813) {
        self detach("p7_shr_weapon_spear_lrg", "tag_weapon_right");
        self.var_c8ec4813 = 0;
    }
}

// Namespace zm_ai_elephant/zm_ai_elephant
// Params 0, eflags: 0x5 linked
// Checksum 0x2e06b869, Offset: 0x9f0
// Size: 0x52
function private function_882f233() {
    if (isdefined(self.var_c8ec4813) && !self.var_c8ec4813) {
        self attach("p7_shr_weapon_spear_lrg", "tag_weapon_right");
        self.var_c8ec4813 = 1;
    }
}

// Namespace zm_ai_elephant/zm_ai_elephant
// Params 0, eflags: 0x5 linked
// Checksum 0x25df1028, Offset: 0xa50
// Size: 0x26e
function private function_aef0aaa4() {
    assert(isdefined(self.ai.var_ed782d5));
    forwarddir = anglestoforward(self.angles);
    var_a137cb9f = self gettagorigin("tag_weapon_right");
    if (isdefined(self.ai.var_c3f91959)) {
        var_eb549b4f = self.ai.var_c3f91959.origin;
        projectile = magicbullet(self.ai.var_ed782d5, var_a137cb9f, var_eb549b4f, self.ai.elephant);
    } else if (isdefined(self.ai.elephant.favoriteenemy)) {
        var_eb549b4f = self.ai.elephant.favoriteenemy.origin;
        projectile = magicbullet(self.ai.var_ed782d5, var_a137cb9f, var_eb549b4f, self.ai.elephant, self.ai.elephant.favoriteenemy);
    } else {
        return;
    }
    var_e15d8b1f = 2;
    if (self.ai.elephant.ai.var_112ec817 == #"hash_8e170ae91588f20") {
        var_e15d8b1f = 3;
    }
    projectile thread function_7d162bd0(projectile, var_e15d8b1f, self.ai.var_c3f91959);
    projectile thread function_61d12301(projectile);
    projectile thread watch_for_death(projectile);
    if (self.var_c8ec4813) {
        self detach("p7_shr_weapon_spear_lrg", "tag_weapon_right");
        self.var_c8ec4813 = 0;
    }
}

// Namespace zm_ai_elephant/zm_ai_elephant
// Params 3, eflags: 0x0
// Checksum 0x7828f1e7, Offset: 0xcc8
// Size: 0x1aa
function function_7b10e526(index, multival, target) {
    normal = vectornormalize(target.origin - self.origin);
    pitch = randomfloatrange(15, 30);
    var_a978e158 = randomfloatrange(-10, 10);
    yaw = -180 + 360 / multival * index + var_a978e158;
    angles = (pitch * -1, yaw, 0);
    dir = anglestoforward(angles);
    c = vectorcross(normal, dir);
    f = vectorcross(c, normal);
    theta = 90 - pitch;
    dir = normal * cos(theta) + f * sin(theta);
    dir = vectornormalize(dir);
    return dir;
}

// Namespace zm_ai_elephant/zm_ai_elephant
// Params 2, eflags: 0x5 linked
// Checksum 0xf573475b, Offset: 0xe80
// Size: 0x2c4
function private function_d13a21cb(entity, projectile) {
    projectile endon(#"death");
    landpos = entity.var_f6ea2286;
    if (!isdefined(landpos)) {
        landpos = entity.favoriteenemy.origin;
    }
    projectile clientfield::set("towers_boss_head_proj_explosion_fx_cf", 1);
    enemyorigin = landpos;
    physicsexplosionsphere(projectile.origin, 1000, 300, 400);
    /#
        recordsphere(enemyorigin, 15, (0, 0, 0), "<unknown string>");
    #/
    for (i = 0; i < 5; i++) {
        randomdistance = randomintrange(120, 360);
        var_a978e158 = randomfloatrange(-10, 10);
        yaw = -180 + 72 * i + var_a978e158;
        angles = (0, yaw, 0);
        dir = anglestoforward(angles) * randomdistance;
        var_c6b637a5 = landpos + dir;
        /#
            recordsphere(var_c6b637a5, 15, (1, 0.5, 0), "<unknown string>");
        #/
        launchvelocity = vectornormalize(var_c6b637a5 - projectile.origin) * 1400;
        grenade = entity magicmissile(entity.ai.var_a05929e4, projectile.origin, launchvelocity);
        grenade thread function_7d162bd0(grenade);
    }
    projectile clientfield::set("towers_boss_head_proj_fx_cf", 0);
    wait(0.1);
    projectile delete();
}

// Namespace zm_ai_elephant/zm_ai_elephant
// Params 3, eflags: 0x5 linked
// Checksum 0xe06ad053, Offset: 0x1150
// Size: 0x33c
function private function_7d162bd0(projectile, var_e15d8b1f, var_c3f91959) {
    projectile endon(#"spear_death");
    result = projectile waittill(#"projectile_impact_explode");
    if (!(isdefined(projectile.isdamaged) && projectile.isdamaged)) {
        if (isdefined(result.position)) {
            id = 1;
            var_f34f8a95 = "zm_aoe_spear";
            if (isdefined(var_e15d8b1f)) {
                id = var_e15d8b1f;
                switch (var_e15d8b1f) {
                case 2:
                    var_f34f8a95 = "zm_aoe_spear_small";
                    break;
                case 3:
                    var_f34f8a95 = "zm_aoe_spear_big";
                    break;
                }
            }
            if (isdefined(function_9cc082d2(result.position, 30))) {
                if (isdefined(var_c3f91959)) {
                    aoe = zm_aoe::function_371b4147(id, var_f34f8a95, groundtrace(result.position + (0, 0, 8), result.position + (0, 0, -100000), 0, projectile)[#"position"], var_c3f91959);
                } else {
                    aoe = zm_aoe::function_371b4147(id, var_f34f8a95, groundtrace(result.position + (0, 0, 8), result.position + (0, 0, -100000), 0, projectile)[#"position"]);
                }
            }
            zombiesarray = getaiarchetypearray(#"zombie");
            zombiesarray = arraycombine(zombiesarray, getaiarchetypearray(#"catalyst"), 0, 0);
            zombiesarray = arraycombine(zombiesarray, getaiarchetypearray(#"tiger"), 0, 0);
            zombiesarray = array::filter(zombiesarray, 0, &function_5ae551a6, projectile);
            function_9b64dc73(zombiesarray, projectile);
            physicsexplosionsphere(result.position, 200, 100, 2);
        }
    }
}

// Namespace zm_ai_elephant/zm_ai_elephant
// Params 2, eflags: 0x5 linked
// Checksum 0x3357d78, Offset: 0x1498
// Size: 0xa0
function private function_5ae551a6(enemy, projectile) {
    if (isdefined(enemy.knockdown) && enemy.knockdown) {
        return false;
    }
    if (!isdefined(projectile)) {
        return false;
    }
    if (gibserverutils::isgibbed(enemy, 384)) {
        return false;
    }
    if (distancesquared(enemy.origin, projectile.origin) > 250 * 250) {
        return false;
    }
    return true;
}

// Namespace zm_ai_elephant/zm_ai_elephant
// Params 1, eflags: 0x5 linked
// Checksum 0x6be63d9c, Offset: 0x1540
// Size: 0x56
function private function_61d12301(projectile) {
    projectile endon(#"death");
    result = projectile waittill(#"damage");
    projectile.isdamaged = 1;
}

// Namespace zm_ai_elephant/zm_ai_elephant
// Params 1, eflags: 0x5 linked
// Checksum 0xf66ddf5f, Offset: 0x15a0
// Size: 0x38
function private watch_for_death(projectile) {
    projectile waittill(#"death");
    waittillframeend();
    projectile notify(#"spear_death");
}

// Namespace zm_ai_elephant/zm_ai_elephant
// Params 12, eflags: 0x1 linked
// Checksum 0xf1ce7708, Offset: 0x15e0
// Size: 0x528
function function_6b086058(inflictor, attacker, damage, idflags, meansofdeath, weapon, point, dir, hitloc, offsettime, boneindex, modelindex) {
    if (isdefined(attacker) && attacker.team === self.team) {
        return 0;
    }
    if (isdefined(attacker) && !isplayer(attacker)) {
        return 0;
    }
    self.var_265cb589 = 1;
    var_88cb1bf9 = archetypeelephant::function_498f147(self, point, boneindex);
    if (!isdefined(var_88cb1bf9)) {
        if (isdefined(dir)) {
            playfx("maps/zm_towers/fx8_boss_dmg_flesh", point, dir * -1);
        }
        attacker playhitmarker(undefined, 1, undefined, 0);
        var_786d7e06 = zm_ai_utility::function_422fdfd4(self, attacker, weapon, boneindex);
        return (damage * var_786d7e06.damage_scale);
    }
    if (self.ai.var_112ec817 == #"hash_8e173ae91589439") {
        var_dd54fdb1 = namespace_81245006::function_37e3f011(self, "tag_carriage_ws_le");
        if (isdefined(var_dd54fdb1) && namespace_81245006::function_f29756fe(var_dd54fdb1) === 1) {
            var_786d7e06 = zm_ai_utility::function_422fdfd4(self, attacker, weapon, var_88cb1bf9, undefined, undefined, var_dd54fdb1);
            damage = damage * var_786d7e06.damage_scale;
            archetypeelephant::function_e864f0da(self, damage, attacker, point, dir, var_88cb1bf9);
            return 0;
        }
        attacker playhitmarker(undefined, 1, undefined, 0);
        var_786d7e06 = zm_ai_utility::function_422fdfd4(self, attacker, weapon, boneindex);
        return (damage * var_786d7e06.damage_scale);
    } else if (self.ai.var_112ec817 == #"hash_8e170ae91588f20") {
        var_dd54fdb1 = namespace_81245006::function_37e3f011(self, "tag_head_ws");
        if (isdefined(var_dd54fdb1) && namespace_81245006::function_f29756fe(var_dd54fdb1) === 1) {
            if (attacker hasperk(#"specialty_mod_awareness")) {
                damage = damage * 1.1;
                damage = int(damage);
            }
            attacker playhitmarker(undefined, 5, undefined, 1, 0);
            var_786d7e06 = zm_ai_utility::function_422fdfd4(self, attacker, weapon, var_88cb1bf9, undefined, undefined, var_dd54fdb1);
            damage = damage * var_786d7e06.damage_scale;
            namespace_81245006::function_ef87b7e8(var_dd54fdb1, damage);
            playfx("maps/zm_towers/fx8_boss_dmg_weakspot_organ", point, dir * -1);
            /#
                iprintlnbold("<unknown string>" + var_dd54fdb1.health);
            #/
            if (namespace_81245006::function_f29756fe(var_dd54fdb1) === 3) {
                /#
                    iprintlnbold("<unknown string>");
                #/
            }
            return 0;
        }
        attacker playhitmarker(undefined, 1, undefined, 0);
        var_786d7e06 = zm_ai_utility::function_422fdfd4(self, attacker, weapon, boneindex);
        return (damage * var_786d7e06.damage_scale);
    }
    attacker playhitmarker(undefined, 1, undefined, 0);
    var_786d7e06 = zm_ai_utility::function_422fdfd4(self, attacker, weapon, boneindex);
    return damage * var_786d7e06.damage_scale;
}

