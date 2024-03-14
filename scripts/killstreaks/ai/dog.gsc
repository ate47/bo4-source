// Atian COD Tools GSC decompiler test
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\killstreaks\killstreak_bundles.gsc;
#using scripts\killstreaks\ai\tracking.gsc;
#using scripts\killstreaks\ai\target.gsc;
#using scripts\killstreaks\ai\state.gsc;
#using scripts\killstreaks\ai\patrol.gsc;
#using scripts\killstreaks\ai\leave.gsc;
#using scripts\killstreaks\ai\escort.gsc;
#using scripts\core_common\targetting_delay.gsc;
#using scripts\core_common\ai\archetype_locomotion_utility.gsc;
#using script_3819e7a1427df6d2;
#using scripts\core_common\ai\systems\blackboard.gsc;
#using scripts\core_common\ai\systems\behavior_tree_utility.gsc;
#using scripts\core_common\ai\systems\behavior_state_machine.gsc;
#using scripts\core_common\ai\systems\animation_state_machine_mocomp.gsc;
#using scripts\core_common\ai\systems\animation_state_machine_utility.gsc;
#using scripts\core_common\ai\systems\animation_state_machine_notetracks.gsc;
#using scripts\core_common\ai\systems\ai_interface.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace archetypempdog;

// Namespace archetypempdog
// Method(s) 2 Total 2
class lookaround {

    // Namespace lookaround/dog
    // Params 0, eflags: 0x9 linked
    // Checksum 0x1785ea7, Offset: 0x3e8
    // Size: 0x2e
    __constructor() {
        self.var_268b3fe5 = gettime() + randomintrange(4500, 6500);
    }

    // Namespace lookaround/dog
    // Params 0, eflags: 0x91 linked class_linked
    // Checksum 0x80f724d1, Offset: 0x420
    // Size: 0x4
    __destructor() {
        
    }

}

// Namespace archetypempdog
// Method(s) 2 Total 2
class class_bd3490ad {

    // Namespace class_bd3490ad/dog
    // Params 0, eflags: 0x89 linked class_linked
    // Checksum 0x80f724d1, Offset: 0x4c0
    // Size: 0x4
    __constructor() {
        
    }

    // Namespace class_bd3490ad/dog
    // Params 0, eflags: 0x91 linked class_linked
    // Checksum 0x80f724d1, Offset: 0x4d0
    // Size: 0x4
    __destructor() {
        
    }

}

// Namespace archetypempdog
// Method(s) 2 Total 2
class class_9fa5eb75 {

    // Namespace class_9fa5eb75/dog
    // Params 0, eflags: 0x9 linked
    // Checksum 0xac3eee2d, Offset: 0x34a0
    // Size: 0x1a
    __constructor() {
        self.adjustmentstarted = 0;
        self.var_425c4c8b = 1;
    }

    // Namespace class_9fa5eb75/dog
    // Params 0, eflags: 0x91 linked class_linked
    // Checksum 0x80f724d1, Offset: 0x34c8
    // Size: 0x4
    __destructor() {
        
    }

}

// Namespace archetypempdog/dog
// Params 0, eflags: 0x1 linked
// Checksum 0x4d7a5acf, Offset: 0x2c8
// Size: 0x114
function init() {
    spawner::add_archetype_spawn_function(#"mp_dog", &function_ef4b81af);
    registerbehaviorscriptfunctions();
    if (!isdefined(level.extra_screen_electricity_)) {
        level.extra_screen_electricity_ = spawnstruct();
        level.extra_screen_electricity_.functions = [];
        clientfield::register("actor", "ks_dog_bark", 1, 1, "int");
        clientfield::register("actor", "ks_shocked", 1, 1, "int");
    }
    ai_patrol::init();
    ai_escort::init();
    ai_leave::init();
}

// Namespace archetypempdog/dog
// Params 0, eflags: 0x5 linked
// Checksum 0x9b3f6e4c, Offset: 0x570
// Size: 0x214
function private function_ef4b81af() {
    function_ae45f57b();
    self setplayercollision(0);
    self allowpitchangle(1);
    self setpitchorient();
    self setavoidancemask("avoid none");
    self collidewithactors(0);
    self function_11578581(30);
    self.ai.var_8a9efbb6 = 1;
    self.var_259f6c17 = 1;
    self.ignorepathenemyfightdist = 1;
    self.jukemaxdistance = 1800;
    self.highlyawareradius = 350;
    self.fovcosine = 0;
    self.fovcosinebusy = 0;
    self.maxsightdistsqrd = 900 * 900;
    self.sightlatency = 150;
    self.var_8908e328 = 1;
    self.ai.reacquire_state = 0;
    self.ai.var_54b19f55 = 1;
    self.ai.lookaround = new lookaround();
    self.ai.var_bd3490ad = new class_bd3490ad();
    self thread targetting_delay::function_7e1a12ce(4000);
    self thread function_8f876521();
    self callback::function_d8abfc3d(#"hash_c3f225c9fa3cb25", &function_3fb68a86);
    aiutility::addaioverridedamagecallback(self, &function_d6d0a32e);
}

// Namespace archetypempdog/dog
// Params 0, eflags: 0x1 linked
// Checksum 0x8d18740d, Offset: 0x790
// Size: 0x24
function function_3fb68a86() {
    self clientfield::set("ks_dog_bark", 0);
}

// Namespace archetypempdog/dog
// Params 1, eflags: 0x1 linked
// Checksum 0x870eeaaa, Offset: 0x7c0
// Size: 0x236
function function_a543b380(player) {
    if (!isalive(player) || player.sessionstate != "playing") {
        return false;
    }
    if (self.owner === player) {
        return false;
    }
    if (!player util::isenemyteam(self.team)) {
        return false;
    }
    if (player.team == #"spectator") {
        return false;
    }
    if (!player playerads()) {
        return false;
    }
    weapon = player getcurrentweapon();
    if (!isdefined(weapon) || !isdefined(weapon.rootweapon)) {
        return false;
    }
    if (weapon.rootweapon != getweapon(#"shotgun_semiauto_t8")) {
        return false;
    }
    if (!weaponhasattachment(weapon, "uber")) {
        return false;
    }
    distsq = distancesquared(self.origin, player.origin);
    if (distsq > 900 * 900) {
        return false;
    }
    if (!util::within_fov(self.origin, self.angles, player.origin, cos(45))) {
        return false;
    }
    if (!util::within_fov(player.origin, player getplayerangles(), self.origin, cos(45))) {
        return false;
    }
    return true;
}

// Namespace archetypempdog/dog
// Params 0, eflags: 0x1 linked
// Checksum 0x404395c8, Offset: 0xa00
// Size: 0x1d4
function function_8f876521() {
    self endon(#"death");
    self.ai.var_e90b47c1 = gettime();
    while (isalive(self)) {
        if (isdefined(self.ai.var_e90b47c1) && gettime() <= self.ai.var_e90b47c1) {
            wait(1);
            continue;
        }
        players = getplayers();
        foreach (player in players) {
            if (!function_a543b380(player)) {
                continue;
            }
            if (self cansee(player)) {
                self.health = self.health + 1;
                self dodamage(1, player.origin, undefined, undefined, "torso_lower", "MOD_UNKNOWN", 0, getweapon("eq_swat_grenade"), 0, 1);
                self.ai.var_e90b47c1 = gettime() + randomintrange(6000, 13000);
                break;
            }
        }
        wait(1);
    }
}

// Namespace archetypempdog/dog
// Params 0, eflags: 0x1 linked
// Checksum 0xa02a7b85, Offset: 0xbe0
// Size: 0x91c
function registerbehaviorscriptfunctions() {
    /#
        assert(isscriptfunctionptr(&dogtargetservice));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"mpdogtargetservice", &dogtargetservice, 1);
    /#
        assert(isscriptfunctionptr(&dogshouldwalk));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"mpdogshouldwalk", &dogshouldwalk);
    /#
        assert(isscriptfunctionptr(&dogshouldwalk));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"mpdogshouldwalk", &dogshouldwalk);
    /#
        assert(isscriptfunctionptr(&dogshouldrun));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"mpdogshouldrun", &dogshouldrun);
    /#
        assert(isscriptfunctionptr(&dogshouldrun));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"mpdogshouldrun", &dogshouldrun);
    /#
        assert(isscriptfunctionptr(&function_e382db1f));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4178f7c4c6cfaeb6", &function_e382db1f);
    /#
        assert(isscriptfunctionptr(&function_6c2426d3));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7aaa666497426ef4", &function_6c2426d3);
    /#
        assert(isscriptfunctionptr(&function_6c2426d3));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"hash_7aaa666497426ef4", &function_6c2426d3);
    /#
        assert(isscriptfunctionptr(&dogjukeinitialize));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"mpdogjukeinitialize", &dogjukeinitialize);
    /#
        assert(isscriptfunctionptr(&dogpreemptivejuketerminate));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"mpdogpreemptivejuketerminate", &dogpreemptivejuketerminate);
    /#
        assert(isscriptfunctionptr(&function_3089bb44));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_366c0b2c4164cc87", &function_3089bb44);
    /#
        assert(isscriptfunctionptr(&function_3089bb44));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"hash_366c0b2c4164cc87", &function_3089bb44);
    /#
        assert(isscriptfunctionptr(&function_b2e0da2));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"hash_65dc8904419628da", &function_b2e0da2);
    /#
        assert(isscriptfunctionptr(&function_3b9e385c));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"hash_4066108355410b7a", &function_3b9e385c);
    /#
        assert(isscriptfunctionptr(&function_ac9765d1));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"hash_3fdd4a9f016c4ba4", &function_ac9765d1);
    /#
        assert(isscriptfunctionptr(&function_d338afb8));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_28582743cd920a21", &function_d338afb8);
    /#
        assert(isscriptfunctionptr(&function_bcd7b170));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_3349a77142623d80", &function_bcd7b170);
    /#
        assert(isscriptfunctionptr(&function_4f9ebad6));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_bb74fb159118080", &function_4f9ebad6);
    /#
        assert(isscriptfunctionptr(&function_81c29086));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_34183bbd11db144", &function_81c29086);
    /#
        assert(isscriptfunctionptr(&function_c34253a9));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_3d584bfcad6c773d", &function_c34253a9);
    animationstatenetwork::registernotetrackhandlerfunction("dog_melee", &function_cebd576f);
    animationstatenetwork::registeranimationmocomp("mocomp_mp_dog_juke", &function_475a38e6, &function_75068028, &function_13978732);
    animationstatenetwork::registeranimationmocomp("mocomp_mp_dog_charge_melee", &function_b1eb29d8, &function_a5923bea, &function_668f9379);
    animationstatenetwork::registeranimationmocomp("mocomp_mp_dog_bark", &function_b17821dd, undefined, &function_92620306);
}

// Namespace archetypempdog/dog
// Params 12, eflags: 0x1 linked
// Checksum 0x696d8c6b, Offset: 0x1508
// Size: 0xea
function function_d6d0a32e(inflictor, attacker, damage, idflags, meansofdeath, weapon, point, dir, hitloc, offsettime, boneindex, modelindex) {
    chargelevel = 0;
    weapon_damage = killstreak_bundles::get_weapon_damage("dog", self.maxhealth, attacker, weapon, meansofdeath, damage, idflags, chargelevel);
    if (!isdefined(weapon_damage)) {
        weapon_damage = killstreaks::get_old_damage(attacker, weapon, meansofdeath, damage, 1);
    }
    return weapon_damage;
}

// Namespace archetypempdog/dog
// Params 1, eflags: 0x5 linked
// Checksum 0xca889e57, Offset: 0x1600
// Size: 0x56
function private function_4f9ebad6(entity) {
    var_14e113b = entity.var_40543c03;
    return var_14e113b === "concussion" || var_14e113b === "electrical" || var_14e113b === "flash";
}

// Namespace archetypempdog/dog
// Params 1, eflags: 0x5 linked
// Checksum 0x3c7a3135, Offset: 0x1660
// Size: 0x64
function private function_81c29086(entity) {
    if (entity.var_40543c03 === "electrical") {
        clientfield::set("ks_shocked", 1);
    }
    entity clientfield::set("ks_dog_bark", 0);
}

// Namespace archetypempdog/dog
// Params 1, eflags: 0x5 linked
// Checksum 0x10ed41a8, Offset: 0x16d0
// Size: 0x24
function private function_c34253a9(entity) {
    clientfield::set("ks_shocked", 0);
}

// Namespace archetypempdog/dog
// Params 1, eflags: 0x1 linked
// Checksum 0xe9273c34, Offset: 0x1700
// Size: 0x2c
function function_d338afb8(entity) {
    return entity function_d68af34c() == "patrol";
}

// Namespace archetypempdog/dog
// Params 0, eflags: 0x1 linked
// Checksum 0x6f9f23f1, Offset: 0x1738
// Size: 0x2a
function function_d68af34c() {
    if (self.ai.state == 0) {
        return "patrol";
    }
    return "escort";
}

// Namespace archetypempdog/dog
// Params 0, eflags: 0x1 linked
// Checksum 0x7f57dfef, Offset: 0x1770
// Size: 0x302
function function_1eda333b() {
    var_da7abcda = function_d68af34c();
    if (var_da7abcda == "escort" && self haspath() && isdefined(self.pathgoalpos)) {
        goalpos = self.pathgoalpos;
        if (isdefined(self.ai.var_bd3490ad) && self.ai.var_bd3490ad.goalpos === goalpos) {
            /#
                recordsphere(self.ai.var_bd3490ad.facepoint, 4, (1, 0.5, 0), "<unknown string>");
                recordline(self.ai.var_bd3490ad.facepoint, goalpos, (1, 0.5, 0), "<unknown string>");
            #/
            return self.ai.var_bd3490ad.arrivalyaw;
        }
        var_e5eff04f = self predictarrival();
        if (var_e5eff04f[#"path_prediction_status"] === 2) {
            tacpoints = tacticalquery("mp_dog_arrival", goalpos);
            if (isdefined(tacpoints) && tacpoints.size) {
                facepoint = tacpoints[0].origin;
                var_514ffbc7 = vectornormalize(goalpos - self.origin);
                var_62724777 = vectornormalize(facepoint - goalpos);
                var_616967d2 = vectortoangles(var_514ffbc7)[1];
                var_238f4f40 = vectortoangles(var_62724777)[1];
                arrivalyaw = absangleclamp360(var_616967d2 - var_238f4f40);
                self.ai.var_bd3490ad.goalpos = goalpos;
                self.ai.var_bd3490ad.arrivalyaw = arrivalyaw;
                self.ai.var_bd3490ad.facepoint = facepoint;
                return arrivalyaw;
            }
        }
    }
    arrivalyaw = self bb_getlocomotionarrivalyaw();
    return arrivalyaw;
}

// Namespace archetypempdog/dog
// Params 1, eflags: 0x1 linked
// Checksum 0x933477e1, Offset: 0x1a80
// Size: 0xa2
function function_a3708944(entity) {
    if (isdefined(self.ai.hasseenfavoriteenemy) && self.ai.hasseenfavoriteenemy && isdefined(self.enemy)) {
        return false;
    }
    var_da7abcda = function_d68af34c();
    if (var_da7abcda == "escort" && gettime() > self.ai.lookaround.var_268b3fe5) {
        return true;
    }
    return false;
}

// Namespace archetypempdog/dog
// Params 0, eflags: 0x1 linked
// Checksum 0x65089071, Offset: 0x1b30
// Size: 0x2d2
function function_c2bf7f10() {
    if (isdefined(self.ai.hasseenfavoriteenemy) && self.ai.hasseenfavoriteenemy && isdefined(self.enemy)) {
        predictedpos = self function_18c9035f(self.enemy);
        if (isdefined(predictedpos)) {
            turnyaw = absangleclamp360(self.angles[1] - vectortoangles(predictedpos - self.origin)[1]);
            return turnyaw;
        }
    }
    if (self.ai.lookaround.var_894c8373 === gettime() && isdefined(self.ai.lookaround.var_d166ed3d)) {
        return self.ai.lookaround.var_d166ed3d;
    }
    if (function_a3708944(self)) {
        tacpoints = tacticalquery("mp_dog_arrival", self.origin);
        if (isdefined(tacpoints) && tacpoints.size) {
            tacpoints = array::randomize(tacpoints);
            facepoint = tacpoints[0].origin;
            lookdir = anglestoforward(self.angles);
            var_62724777 = vectornormalize(facepoint - self.origin);
            var_3de41380 = vectortoangles(lookdir)[1];
            var_ba54da4 = vectortoangles(var_62724777)[1];
            turnyaw = absangleclamp360(var_3de41380 - var_ba54da4);
            if (turnyaw >= 90 && turnyaw <= 270) {
                self.ai.lookaround.var_d166ed3d = turnyaw;
                self.ai.lookaround.var_894c8373 = gettime();
                self.ai.lookaround.var_268b3fe5 = gettime() + randomintrange(4500, 6500);
                return turnyaw;
            }
        }
    }
    return undefined;
}

// Namespace archetypempdog/dog
// Params 1, eflags: 0x1 linked
// Checksum 0x4391d59d, Offset: 0x1e10
// Size: 0x74
function function_cebd576f(entity) {
    entity melee();
    entity playsound(#"aml_dog_attack_jump");
    /#
        record3dtext("<unknown string>", self.origin, (1, 0, 0), "<unknown string>", entity);
    #/
}

// Namespace archetypempdog/dog
// Params 0, eflags: 0x1 linked
// Checksum 0x27f074ba, Offset: 0x1e90
// Size: 0x4a
function function_ae45f57b() {
    blackboard::createblackboardforentity(self);
    ai::createinterfaceforentity(self);
    self.___archetypeonanimscriptedcallback = &function_cb274b5;
}

// Namespace archetypempdog/dog
// Params 1, eflags: 0x5 linked
// Checksum 0x2c276c0e, Offset: 0x1ee8
// Size: 0x2c
function private function_cb274b5(entity) {
    entity.__blackboard = undefined;
    entity function_ae45f57b();
}

// Namespace archetypempdog/dog
// Params 1, eflags: 0x1 linked
// Checksum 0x2cfb296f, Offset: 0x1f20
// Size: 0x40
function getyaw(org) {
    angles = vectortoangles(org - self.origin);
    return angles[1];
}

// Namespace archetypempdog/dog
// Params 1, eflags: 0x0
// Checksum 0x13d8f0e1, Offset: 0x1f68
// Size: 0x8a
function absyawtoenemy(enemy) {
    /#
        assert(isdefined(enemy));
    #/
    yaw = self.angles[1] - getyaw(enemy.origin);
    yaw = angleclamp180(yaw);
    if (yaw < 0) {
        yaw = -1 * yaw;
    }
    return yaw;
}

// Namespace archetypempdog/dog
// Params 1, eflags: 0x1 linked
// Checksum 0xe4ef4b3a, Offset: 0x2000
// Size: 0x56
function can_see_enemy(enemy) {
    if (!isdefined(enemy)) {
        return false;
    }
    if (self function_ce6d3545(enemy)) {
        return false;
    }
    if (!self targetting_delay::function_1c169b3a(enemy, 0)) {
        return false;
    }
    return true;
}

// Namespace archetypempdog/dog
// Params 0, eflags: 0x5 linked
// Checksum 0x319aee9e, Offset: 0x2060
// Size: 0x1a
function private function_a78474f2() {
    return self ai_state::function_a78474f2();
}

// Namespace archetypempdog/dog
// Params 0, eflags: 0x5 linked
// Checksum 0x1545df58, Offset: 0x2088
// Size: 0x64
function private get_favorite_enemy() {
    var_edc20efd = self ai_state::function_4af1ff64();
    var_ff716a93 = self function_a78474f2();
    if (isdefined(var_ff716a93)) {
        return ai_target::function_84235351(var_ff716a93, var_edc20efd);
    }
}

// Namespace archetypempdog/dog
// Params 0, eflags: 0x0
// Checksum 0x1a555f96, Offset: 0x20f8
// Size: 0x3e
function get_last_valid_position() {
    if (isplayer(self) && isdefined(self.last_valid_position)) {
        return self.last_valid_position;
    }
    return self.origin;
}

// Namespace archetypempdog/dog
// Params 1, eflags: 0x1 linked
// Checksum 0xe3d1772a, Offset: 0x2140
// Size: 0x7e
function function_3b9e385c(entity) {
    aiutility::cleararrivalpos(entity);
    entity function_a57c34b7(entity.origin);
    entity.ai.lookaround.var_268b3fe5 = gettime() + randomintrange(4500, 6500);
}

// Namespace archetypempdog/dog
// Params 1, eflags: 0x1 linked
// Checksum 0x98c36b69, Offset: 0x21c8
// Size: 0x44
function function_b2e0da2(entity) {
    if (isdefined(entity.ai.hasseenfavoriteenemy) && entity.ai.hasseenfavoriteenemy) {
        return true;
    }
    return false;
}

// Namespace archetypempdog/dog
// Params 1, eflags: 0x5 linked
// Checksum 0x2e925df1, Offset: 0x2218
// Size: 0x22
function private lid_closedpositionservicee(entity) {
    entity.ai.reacquire_state = 0;
}

// Namespace archetypempdog/dog
// Params 1, eflags: 0x5 linked
// Checksum 0xb7f7d905, Offset: 0x2248
// Size: 0x236
function private function_bcd7b170(entity) {
    if (!isdefined(entity.ai.reacquire_state)) {
        entity.ai.reacquire_state = 0;
    }
    if (!isdefined(entity.enemy)) {
        entity.ai.reacquire_state = 0;
        return 0;
    }
    if (!isalive(entity.enemy)) {
        entity.ai.reacquire_state = 0;
        return;
    }
    if (entity function_ce6d3545(entity.enemy)) {
        entity.ai.reacquire_state = 4;
        return;
    }
    var_27cd0f02 = entity cansee(entity.enemy, 20000);
    hasattackedenemyrecently = entity attackedrecently(entity.enemy, 3);
    var_fef47407 = entity.enemy attackedrecently(entity, 3);
    var_3b82352c = isdefined(function_9cc082d2(entity.enemy.origin, 30));
    if (var_3b82352c && (var_27cd0f02 || hasattackedenemyrecently || var_fef47407)) {
        entity.ai.reacquire_state = 0;
        return 0;
    }
    entity.ai.reacquire_state++;
    if (entity.ai.reacquire_state >= 4) {
        entity flagenemyunattackable(randomintrange(4000, 4500));
    }
    return 0;
}

// Namespace archetypempdog/dog
// Params 2, eflags: 0x1 linked
// Checksum 0x45f615c3, Offset: 0x2488
// Size: 0x36
function function_dc0b544b(entity, enemy) {
    if (entity function_ce6d3545(enemy)) {
        return true;
    }
    return false;
}

// Namespace archetypempdog/dog
// Params 0, eflags: 0x5 linked
// Checksum 0xc372a17b, Offset: 0x24c8
// Size: 0x82
function private get_last_attacker() {
    if (isdefined(self.attacker)) {
        if (issentient(self.attacker)) {
            return self.attacker;
        }
        if (isdefined(self.attacker.script_owner) && issentient(self.attacker.script_owner)) {
            return self.attacker.script_owner;
        }
    }
    return undefined;
}

// Namespace archetypempdog/dog
// Params 1, eflags: 0x1 linked
// Checksum 0xd4380f29, Offset: 0x2558
// Size: 0x4a4
function target_enemy(entity) {
    if (!isdefined(self.ai.state)) {
        return;
    }
    if (isdefined(self.ignoreall) && self.ignoreall) {
        return;
    }
    self.script_owner tracking::track();
    last_enemy = entity.favoriteenemy;
    var_dc0b544b = 0;
    var_fe3bf748 = 1;
    if (isdefined(last_enemy)) {
        var_dc0b544b = entity function_dc0b544b(entity, last_enemy);
        if (!var_dc0b544b && isdefined(entity.ai.var_4520deec) && gettime() >= entity.ai.var_4520deec + 15000) {
            newenemy = entity get_favorite_enemy();
            if (isdefined(newenemy) && newenemy != last_enemy) {
                var_dc0b544b = 1;
                var_fe3bf748 = 0;
            }
        }
    }
    if (var_dc0b544b || entity.ai.state == 2 || isdefined(entity.favoriteenemy) && !entity ai_target::is_target_valid(entity.favoriteenemy)) {
        if (isdefined(entity.favoriteenemy) && isdefined(entity.favoriteenemy.hunted_by) && entity.favoriteenemy.hunted_by > 0) {
            entity.favoriteenemy.hunted_by--;
        }
        entity clearenemy();
        entity.favoriteenemy = undefined;
        entity.ai.hasseenfavoriteenemy = 0;
        entity.ai.var_4520deec = undefined;
        if (var_fe3bf748) {
        }
        entity ai_state::function_e0e1a7fc();
        lid_closedpositionservicee(entity);
        return;
    }
    if (!entity ai_target::is_target_valid(entity.favoriteenemy)) {
        entity.favoriteenemy = entity get_favorite_enemy();
        entity targetting_delay::function_a4d6d6d8(entity.favoriteenemy, 0);
    }
    if (!(isdefined(entity.ai.hasseenfavoriteenemy) && entity.ai.hasseenfavoriteenemy)) {
        if (isdefined(entity.favoriteenemy) && entity can_see_enemy(entity.favoriteenemy)) {
            entity.ai.hasseenfavoriteenemy = 1;
            entity.ai.var_4520deec = gettime();
            entity ai_state::function_e0e1a7fc();
            lid_closedpositionservicee(entity);
            level thread function_df8cb62a(entity);
        }
    }
    if (isdefined(entity.favoriteenemy) && isdefined(entity.ai.hasseenfavoriteenemy) && entity.ai.hasseenfavoriteenemy) {
        if (gettime() >= entity.ai.var_4520deec + 50) {
            enemypos = getclosestpointonnavmesh(entity.favoriteenemy.origin, 400, 1.2 * entity getpathfindingradius());
            if (isdefined(enemypos)) {
                entity function_a57c34b7(enemypos);
                return;
            }
            entity function_a57c34b7(entity.favoriteenemy.origin);
        }
    }
}

// Namespace archetypempdog/dog
// Params 1, eflags: 0x1 linked
// Checksum 0x5a73e6, Offset: 0x2a08
// Size: 0x170
function function_df8cb62a(entity) {
    entity endon(#"death");
    wait(1);
    while (entity.ai.state != 2 && isdefined(entity.ai.hasseenfavoriteenemy) && entity.ai.hasseenfavoriteenemy) {
        if (isdefined(entity.enemy) && distancesquared(entity.enemy.origin, entity.origin) <= 400 * 400 && entity cansee(entity.enemy)) {
            entity clientfield::set("ks_dog_bark", 1);
            entity playsound(#"hash_21775fa77c0df395");
            wait(1.2);
            entity clientfield::set("ks_dog_bark", 0);
        }
        wait(randomfloatrange(2, 4));
    }
}

// Namespace archetypempdog/dog
// Params 1, eflags: 0x1 linked
// Checksum 0x76b258ea, Offset: 0x2b80
// Size: 0x44
function dogtargetservice(entity) {
    if (!isdefined(self.script_owner)) {
        return;
    }
    target_enemy(entity);
    entity ai_state::function_e8e7cf45();
}

// Namespace archetypempdog/dog
// Params 1, eflags: 0x1 linked
// Checksum 0x12405ced, Offset: 0x2bd0
// Size: 0x24
function dogshouldwalk(entity) {
    return !dogshouldrun(entity);
}

// Namespace archetypempdog/dog
// Params 1, eflags: 0x1 linked
// Checksum 0x9a7a7d9a, Offset: 0x2c00
// Size: 0x62
function dogshouldrun(entity) {
    if (isdefined(self.ai.state)) {
        if (self.ai.state == 0 && self.ai.patrol.state == 1) {
            return false;
        }
    }
    return true;
}

// Namespace archetypempdog/dog
// Params 1, eflags: 0x1 linked
// Checksum 0x9043f65b, Offset: 0x2c70
// Size: 0xbc
function function_e382db1f(entity) {
    if (!(isdefined(self.ai.hasseenfavoriteenemy) && self.ai.hasseenfavoriteenemy)) {
        return false;
    }
    lastattacker = get_last_attacker();
    if (isdefined(lastattacker) && self.favoriteenemy === lastattacker) {
        if (lastattacker attackedrecently(self, 0.1) && entity.ai.var_4520deec === gettime()) {
            return true;
        }
    }
    return false;
}

// Namespace archetypempdog/dog
// Params 1, eflags: 0x5 linked
// Checksum 0xe1655ca3, Offset: 0x2d38
// Size: 0x36
function private function_ac9765d1(entity) {
    entity.nextpreemptivejuke = gettime() + randomintrange(4500, 6000);
}

// Namespace archetypempdog/dog
// Params 1, eflags: 0x5 linked
// Checksum 0x71497191, Offset: 0x2d78
// Size: 0x10
function private dogjukeinitialize(entity) {
    return true;
}

// Namespace archetypempdog/dog
// Params 1, eflags: 0x5 linked
// Checksum 0x672ae9d4, Offset: 0x2d90
// Size: 0x36
function private dogpreemptivejuketerminate(entity) {
    entity.nextpreemptivejuke = gettime() + randomintrange(4500, 6000);
}

// Namespace archetypempdog/dog
// Params 1, eflags: 0x1 linked
// Checksum 0x6e15dd31, Offset: 0x2dd0
// Size: 0x29a
function function_6c2426d3(entity) {
    if (!isdefined(entity.enemy) || !isplayer(entity.enemy)) {
        return false;
    }
    if (isdefined(entity.nextpreemptivejuke) && entity.nextpreemptivejuke > gettime()) {
        return false;
    }
    disttoenemysq = distancesquared(entity.origin, entity.enemy.origin);
    if (disttoenemysq < 1800 * 1800 && disttoenemysq >= 400 * 400) {
        if (util::within_fov(entity.origin, entity.angles, entity.enemy.origin, cos(30))) {
            if (util::within_fov(entity.enemy.origin, entity.enemy.angles, entity.origin, cos(30))) {
                enemyangles = entity.enemy.angles;
                toenemy = entity.enemy.origin - entity.origin;
                forward = anglestoforward(enemyangles);
                dotproduct = abs(vectordot(vectornormalize(toenemy), forward));
                /#
                    record3dtext(acos(dotproduct), entity.origin + vectorscale((0, 0, 1), 10), (0, 1, 0), "<unknown string>");
                #/
                if (dotproduct > 0.766) {
                    return true;
                }
            }
        }
    }
    return false;
}

// Namespace archetypempdog/dog
// Params 2, eflags: 0x0
// Checksum 0x9301c602, Offset: 0x3078
// Size: 0x30
function dogmeleeaction(entity, asmstatename) {
    animationstatenetworkutility::requeststate(entity, asmstatename);
    return 5;
}

// Namespace archetypempdog/dog
// Params 2, eflags: 0x0
// Checksum 0x7341bbc7, Offset: 0x30b0
// Size: 0x18
function function_303397b0(entity, asmstatename) {
    return 4;
}

// Namespace archetypempdog/dog
// Params 5, eflags: 0x1 linked
// Checksum 0xba57feb6, Offset: 0x30d0
// Size: 0x84
function function_475a38e6(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    entity animmode("zonly_physics", 0);
    entity.blockingpain = 1;
    entity.usegoalanimweight = 1;
    entity pathmode("dont move");
}

// Namespace archetypempdog/dog
// Params 5, eflags: 0x1 linked
// Checksum 0x5c825369, Offset: 0x3160
// Size: 0x2c
function function_75068028(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    
}

// Namespace archetypempdog/dog
// Params 5, eflags: 0x1 linked
// Checksum 0xaa034506, Offset: 0x3198
// Size: 0x84
function function_13978732(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    entity.blockingpain = 0;
    entity.usegoalanimweight = 0;
    entity pathmode("move allowed");
    entity orientmode("face default");
}

// Namespace archetypempdog/dog
// Params 1, eflags: 0x1 linked
// Checksum 0x7913f88e, Offset: 0x3228
// Size: 0x26c
function function_3089bb44(entity) {
    if (isdefined(entity.enemy)) {
        predictedenemypos = entity.enemy.origin;
        distancesq = distancesquared(entity.origin, entity.enemy.origin);
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
    return true;
}

// Namespace archetypempdog/dog
// Params 5, eflags: 0x1 linked
// Checksum 0x473612e4, Offset: 0x3568
// Size: 0x6c
function function_b17821dd(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    entity orientmode("face current");
    entity animmode("zonly_physics", 1);
}

// Namespace archetypempdog/dog
// Params 5, eflags: 0x1 linked
// Checksum 0x96f714da, Offset: 0x35e0
// Size: 0x4c
function function_92620306(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    entity orientmode("face default");
}

// Namespace archetypempdog/dog
// Params 5, eflags: 0x1 linked
// Checksum 0xd981eda6, Offset: 0x3638
// Size: 0x31c
function function_b1eb29d8(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    entity animmode("gravity", 1);
    entity orientmode("face angle", entity.angles[1]);
    entity.usegoalanimweight = 1;
    entity pathmode("dont move");
    entity collidewithactors(0);
    entity pushplayer(0);
    if (isdefined(entity.enemy)) {
        dirtoenemy = vectornormalize(entity.enemy.origin - entity.origin);
        entity forceteleport(entity.origin, vectortoangles(dirtoenemy));
    }
    if (!isdefined(entity.meleeinfo)) {
        entity.meleeinfo = new class_9fa5eb75();
        entity.meleeinfo.var_9bfa8497 = entity.origin;
        entity.meleeinfo.var_98bc84b7 = getnotetracktimes(mocompanim, "start_adjust")[0];
        entity.meleeinfo.var_6392c3a2 = getnotetracktimes(mocompanim, "end_adjust")[0];
        var_e397f54c = getmovedelta(mocompanim, 0, 1, entity);
        entity.meleeinfo.var_cb28f380 = entity localtoworldcoords(var_e397f54c);
        /#
            movedelta = getmovedelta(mocompanim, 0, 1, entity);
            animendpos = entity localtoworldcoords(movedelta);
            distance = distance(entity.origin, animendpos);
            recordcircle(animendpos, 3, (0, 1, 0), "<unknown string>");
            record3dtext("<unknown string>" + distance, animendpos, (0, 1, 0), "<unknown string>");
        #/
    }
}

// Namespace archetypempdog/dog
// Params 5, eflags: 0x1 linked
// Checksum 0xd0b2bd62, Offset: 0x3960
// Size: 0xb34
function function_a5923bea(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    /#
        assert(isdefined(entity.meleeinfo));
    #/
    currentanimtime = entity getanimtime(mocompanim);
    if (isdefined(entity.enemy) && !entity.meleeinfo.adjustmentstarted && entity.meleeinfo.var_425c4c8b && currentanimtime >= entity.meleeinfo.var_98bc84b7) {
        predictedenemypos = entity.enemy.origin;
        if (isplayer(entity.enemy)) {
            velocity = entity.enemy getvelocity();
            if (length(velocity) > 0) {
                predictedenemypos = predictedenemypos + vectorscale(velocity, 0.25);
            }
        }
        entity.meleeinfo.adjustedendpos = predictedenemypos;
        var_cf699df5 = distancesquared(entity.meleeinfo.var_9bfa8497, entity.meleeinfo.var_cb28f380);
        var_776ddabf = distancesquared(entity.meleeinfo.var_cb28f380, entity.meleeinfo.adjustedendpos);
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
        } else if (var_cf699df5 > var_65cbfb52 && var_776ddabf >= 90 * 90) {
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
            var_beabc994 = anglestoforward(entity.angles);
            var_1c3641f2 = (entity.enemy.origin[0], entity.enemy.origin[1], entity.origin[2]);
            dirtoenemy = vectornormalize(var_1c3641f2 - entity.origin);
            zdiff = entity.meleeinfo.var_cb28f380[2] - entity.enemy.origin[2];
            var_6738a702 = abs(zdiff) <= 45;
            withinfov = vectordot(var_beabc994, dirtoenemy) > cos(30);
            var_7948b2f3 = var_6738a702 && withinfov;
            var_425c4c8b = (isvisible || var_535d098c) && var_7948b2f3;
            /#
                reasons = "<unknown string>" + isvisible + "<unknown string>" + var_6738a702 + "<unknown string>" + withinfov;
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
        /#
            recordsphere(entity.meleeinfo.var_cb28f380, 3, (0, 1, 0), "<unknown string>");
            recordsphere(entity.meleeinfo.adjustedendpos, 3, (0, 0, 1), "<unknown string>");
        #/
        adjustedorigin = entity.origin + entity.meleeinfo.var_10b8b6d1 * entity.meleeinfo.var_8b9a15a6;
        entity forceteleport(adjustedorigin);
    }
}

// Namespace archetypempdog/dog
// Params 5, eflags: 0x1 linked
// Checksum 0x8d4c5a8e, Offset: 0x44a0
// Size: 0xae
function function_668f9379(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    entity.usegoalanimweight = 0;
    entity pathmode("move allowed");
    entity orientmode("face default");
    entity collidewithactors(1);
    entity pushplayer(1);
    entity.meleeinfo = undefined;
}

// Namespace archetypempdog/bhtn_action_start
// Params 1, eflags: 0x40
// Checksum 0xf4381cfe, Offset: 0x4558
// Size: 0x6c
function event_handler[bhtn_action_start] function_df9abf31(eventstruct) {
    if (isdefined(self.archetype) && self.archetype == #"mp_dog") {
        if (eventstruct.action == "bark") {
            self playsound(#"hash_21775fa77c0df395");
        }
    }
}

