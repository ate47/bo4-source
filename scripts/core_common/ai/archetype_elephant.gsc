#using scripts\core_common\vehicle_ai_shared.gsc;
#using scripts\core_common\statemachine_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using script_67e37e63e177f107;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\ai\systems\behavior_state_machine.gsc;
#using script_2c5daa95f8fec03c;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\ai\systems\ai_interface.gsc;
#using scripts\core_common\ai\systems\gib.gsc;
#using scripts\core_common\ai\systems\ai_blackboard.gsc;
#using scripts\core_common\ai\systems\blackboard.gsc;
#using scripts\core_common\ai\systems\behavior_tree_utility.gsc;
#using scripts\core_common\status_effects\status_effect_util.gsc;
#using scripts\core_common\ai\archetype_locomotion_utility.gsc;
#using script_3819e7a1427df6d2;
#using scripts\core_common\ai\systems\animation_state_machine_mocomp.gsc;
#using scripts\core_common\ai\systems\animation_state_machine_notetracks.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace archetypeelephant;

// Namespace archetypeelephant
// Method(s) 2 Total 2
class class_a504b9a3 {

    var var_190509f3;
    var var_6392c3a2;
    var var_9177748f;
    var var_9ab05afa;

    // Namespace class_a504b9a3/archetype_elephant
    // Params 0, eflags: 0x9 linked
    // Checksum 0xd63fc1a1, Offset: 0x7d48
    // Size: 0x32
    constructor() {
        var_9ab05afa = 0;
        var_6392c3a2 = 0;
        var_190509f3 = 0;
        var_9177748f = gettime();
    }

}

// Namespace archetypeelephant/archetype_elephant
// Params 0, eflags: 0x2
// Checksum 0x4099533, Offset: 0x8a8
// Size: 0x20c
function autoexec main() {
    registerbehaviorscriptfunctions();
    spawner::add_archetype_spawn_function(#"elephant", &function_e8525036);
    spawner::add_archetype_spawn_function(#"elephant", &function_4c731a08);
    clientfield::register("actor", "towers_boss_melee_effect", 1, 1, "counter");
    clientfield::register("actor", "tower_boss_death_fx", 1, 1, "counter");
    clientfield::register("actor", "towers_boss_eye_fx_cf", 1, 2, "int");
    clientfield::register("actor", "boss_death_rob", 1, 2, "int");
    clientfield::register("scriptmover", "entrails_model_cf", 1, 1, "int");
    clientfield::register("scriptmover", "towers_boss_head_proj_fx_cf", 1, 1, "int");
    clientfield::register("scriptmover", "towers_boss_head_proj_explosion_fx_cf", 1, 1, "int");
    clientfield::register("actor", "sndTowersBossArmor", 1, 1, "int");
    /#
        level thread setup_devgui();
    #/
}

// Namespace archetypeelephant/archetype_elephant
// Params 0, eflags: 0x5 linked
// Checksum 0x4efcbf10, Offset: 0xac0
// Size: 0x7be
function private registerbehaviorscriptfunctions() {
    assert(isscriptfunctionptr(&function_2c58bc39));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2f6e4a95b8974fcd", &function_2c58bc39);
    assert(isscriptfunctionptr(&function_10a75bb7));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_40d6b5994b49d7aa", &function_10a75bb7);
    assert(isscriptfunctionptr(&function_d3d560e9));
    behaviorstatemachine::registerbsmscriptapiinternal(#"hash_9188ed9ed594c69", &function_d3d560e9);
    assert(isscriptfunctionptr(&elephantknockdownservice));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"elephantknockdownservice", &elephantknockdownservice);
    assert(isscriptfunctionptr(&function_5db0f49a));
    behaviorstatemachine::registerbsmscriptapiinternal(#"hash_7aace3e67f786b19", &function_5db0f49a);
    assert(isscriptfunctionptr(&function_1c0db2ec));
    behaviorstatemachine::registerbsmscriptapiinternal(#"hash_a14b98894f1d688", &function_1c0db2ec);
    assert(isscriptfunctionptr(&function_18e1bf30));
    behaviorstatemachine::registerbsmscriptapiinternal(#"hash_4b225936ae91a204", &function_18e1bf30);
    assert(isscriptfunctionptr(&elephantshouldmelee));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"elephantshouldmelee", &elephantshouldmelee);
    assert(isscriptfunctionptr(&elephantshouldmelee));
    behaviorstatemachine::registerbsmscriptapiinternal(#"elephantshouldmelee", &elephantshouldmelee);
    assert(isscriptfunctionptr(&function_9c076ff9));
    behaviorstatemachine::registerbsmscriptapiinternal(#"hash_2cab44d162eb9a83", &function_9c076ff9);
    assert(isscriptfunctionptr(&function_69faa74));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_597ef06035bca069", &function_69faa74);
    assert(isscriptfunctionptr(&function_cd472d5));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4e7335c0f98549c3", &function_cd472d5);
    assert(isscriptfunctionptr(&function_f2c697c7));
    behaviorstatemachine::registerbsmscriptapiinternal(#"hash_4fbf554dacfacc1f", &function_f2c697c7);
    assert(isscriptfunctionptr(&function_f8145b00));
    behaviorstatemachine::registerbsmscriptapiinternal(#"hash_67699fc0b32fc954", &function_f8145b00);
    assert(isscriptfunctionptr(&function_2bfd3841));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_72b216f44f66e0ca", &function_2bfd3841);
    animationstatenetwork::registeranimationmocomp("mocomp_melee@towers_boss", &function_5e17ac7a, &function_e88518a1, &function_10296bfa);
    animationstatenetwork::registernotetrackhandlerfunction("towersboss_melee", &function_2328518e);
    animationstatenetwork::registernotetrackhandlerfunction("towersboss_melee_big", &function_df15eebf);
    animationstatenetwork::registernotetrackhandlerfunction("launch_head_proj", &function_4b28fc8c);
    animationstatenetwork::registernotetrackhandlerfunction("launch_head_proj2", &function_4b28fc8c);
    animationstatenetwork::registernotetrackhandlerfunction("towers_boss_ground_attack", &function_ce8fe2b0);
    animation::add_global_notetrack_handler("carriage_explode", &function_91bee4fc, 0);
    animation::add_global_notetrack_handler("tower_boss_death_effects", &function_afc99f32, 0);
    animation::add_global_notetrack_handler("tower_boss_entrace_effects", &function_35130a59, 0);
    level.var_c6001986 = &function_67525edc;
}

// Namespace archetypeelephant/archetype_elephant
// Params 1, eflags: 0x1 linked
// Checksum 0xf4583ff0, Offset: 0x1288
// Size: 0x170
function function_67525edc(dustball) {
    enemies = util::function_81ccf6d3(self.team);
    foreach (target in enemies) {
        if (isplayer(target)) {
            distsq = distancesquared(dustball.origin, target.origin);
            if (distsq <= 150 * 150) {
                params = getstatuseffect(#"hash_12a64221f4d27f9b");
                weapon = getweapon(#"eq_molotov");
                target status_effect::status_effect_apply(params, weapon, dustball, 0, 3000, undefined, dustball.origin);
            }
        }
    }
}

// Namespace archetypeelephant/archetype_elephant
// Params 0, eflags: 0x1 linked
// Checksum 0x12432a2d, Offset: 0x1400
// Size: 0x24
function function_35130a59() {
    self clientfield::increment("tower_boss_death_fx");
}

// Namespace archetypeelephant/archetype_elephant
// Params 1, eflags: 0x1 linked
// Checksum 0x6f5b2f5f, Offset: 0x1430
// Size: 0x9c
function function_e1df3626(phase) {
    if (phase == #"hash_266f56fb994e6639") {
        self setmodel(#"hash_fa17b711ee009bb");
        return;
    }
    self setmodel(#"hash_3221e8b3c0c61381");
    self clientfield::set("boss_death_rob", 1);
    self thread function_7f012c08();
}

// Namespace archetypeelephant/archetype_elephant
// Params 0, eflags: 0x5 linked
// Checksum 0x8c53977a, Offset: 0x14d8
// Size: 0x3c
function private function_7f012c08() {
    self endon(#"death");
    wait 1;
    self clientfield::set("boss_death_rob", 0);
}

// Namespace archetypeelephant/archetype_elephant
// Params 0, eflags: 0x1 linked
// Checksum 0x4cf5d519, Offset: 0x1520
// Size: 0x24
function function_afc99f32() {
    self clientfield::increment("tower_boss_death_fx");
}

// Namespace archetypeelephant/archetype_elephant
// Params 1, eflags: 0x1 linked
// Checksum 0x2bba2d89, Offset: 0x1550
// Size: 0xa8
function function_452a76a8(elephant) {
    elephant endon(#"death");
    while (isdefined(1)) {
        deathloop = elephant animmappingsearch(#"hash_45e1ac151f9ea53c");
        elephant animation::play(deathloop, elephant.origin, elephant.angles, 1, 0.2, 0.1, undefined, undefined, undefined, 0);
    }
}

// Namespace archetypeelephant/archetype_elephant
// Params 1, eflags: 0x1 linked
// Checksum 0x173d4186, Offset: 0x1600
// Size: 0x51a
function elephantstartdeath(elephant) {
    model = "p8_fxanim_zm_towers_boss_death_01_mod";
    animname = "p8_fxanim_zm_towers_boss_death_01_anim";
    deathanim = elephant animmappingsearch(#"hash_3af6e4606cafd1ed");
    if (elephant.ai.phase == #"hash_266f56fb994e6639") {
        model = "p8_fxanim_zm_towers_boss_death_02_mod";
        animname = "p8_fxanim_zm_towers_boss_death_02_anim";
        deathanim = elephant animmappingsearch(#"hash_2ca88c72c7b85749");
    }
    phase = elephant.ai.phase;
    elephant.skipdeath = 1;
    elephant.diedinscriptedanim = 1;
    elephant.entrailsmodel = spawn("script_model", elephant.origin);
    elephant.entrailsmodel setmodel(model);
    elephant.entrailsmodel useanimtree("generic");
    elephant.entrailsmodel thread animation::play(animname, elephant.origin, elephant.angles, 1, 0.2, 0.1, undefined, undefined, undefined, 0);
    elephant.entrailsmodel clientfield::set("entrails_model_cf", 1);
    entrailsmodel = elephant.entrailsmodel;
    origin = elephant.origin;
    angles = elephant.angles;
    var_55ec4bbf = elephant.ai.phase == #"hash_266f53fb994e6120";
    elephant clientfield::set("towers_boss_eye_fx_cf", 0);
    elephant.skipdeath = 1;
    elephant thread animation::play(deathanim, elephant.origin, elephant.angles, 1, 0.2, 0.1, undefined, undefined, undefined, 0);
    wait 10;
    if (isdefined(elephant)) {
        elephant function_e1df3626(phase);
        wait 2.7;
        if (isdefined(elephant)) {
            if (phase == #"hash_266f56fb994e6639") {
                elephant thread function_452a76a8(elephant);
            } else {
                elephant.allowdeath = 1;
                elephant kill();
            }
        }
    }
    if (phase == #"hash_266f56fb994e6639" && level flag::exists("both_towers_bosses_killed")) {
        level flag::set("both_towers_bosses_killed");
    }
    entrailsmodel thread function_78f4a0d1();
    level thread function_106b6b29();
    if (var_55ec4bbf) {
        soulball = spawnvehicle(#"hash_2db015dc967ccf56", origin, angles, "soul_ball_ai");
        if (isdefined(soulball)) {
            soulball.var_6353e3f1 = 1;
            soulball.b_ignore_cleanup = 1;
            soulball.ignore_nuke = 1;
            soulball.lightning_chain_immune = 1;
            soulball.var_dd6fe31f = 1;
            var_1801a239 = struct::get("soul_exit", "targetname");
            pos = getclosestpointonnavmesh(var_1801a239.origin, 500, 30);
            wait 1;
            soulball vehicle_ai::set_state("soul");
            soulball.ai.var_a38db64f = pos;
        }
    }
}

// Namespace archetypeelephant/archetype_elephant
// Params 0, eflags: 0x1 linked
// Checksum 0x9c73cfb3, Offset: 0x1b28
// Size: 0x24
function function_78f4a0d1() {
    wait 20;
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace archetypeelephant/archetype_elephant
// Params 0, eflags: 0x1 linked
// Checksum 0x1bcb7144, Offset: 0x1b58
// Size: 0x34
function function_106b6b29() {
    wait 4.5;
    playsoundatposition(#"hash_4cf49c7c9533b539", (0, 0, 0));
}

// Namespace archetypeelephant/archetype_elephant
// Params 3, eflags: 0x0
// Checksum 0x517d8fe4, Offset: 0x1b98
// Size: 0x21e
function function_8d7ad318(launchpos, trajectory, targetpos) {
    self endon(#"hash_79e095919e415a70", #"death");
    /#
        assert(trajectory.size);
        recordsphere(targetpos, 3, (0, 1, 1), "<dev string:x38>");
        recordline(launchpos, trajectory[0], (0, 1, 1), "<dev string:x41>");
        while (true) {
            i = 0;
            foreach (point in trajectory) {
                recordsphere(point, 3, (0, 1, 1), "<dev string:x38>");
                if (isdefined(trajectory[i + 1])) {
                    recordline(point, trajectory[i + 1], (0, 1, 1), "<dev string:x41>");
                }
                i++;
            }
            recordsphere(targetpos, 3, (0, 1, 1), "<dev string:x38>");
            recordline(point, targetpos, (0, 1, 1), "<dev string:x41>");
            waitframe(1);
        }
    #/
}

// Namespace archetypeelephant/archetype_elephant
// Params 1, eflags: 0x1 linked
// Checksum 0x1aa22383, Offset: 0x1dc0
// Size: 0x3c0
function function_4b28fc8c(entity) {
    assert(isdefined(entity.ai.var_a05929e4));
    launchpos = entity gettagorigin("j_head");
    var_d82e1fd1 = entity gettagangles("j_head");
    /#
        recordsphere(launchpos, 3, (0, 0, 1), "<dev string:x41>");
    #/
    landpos = entity.var_f6ea2286;
    if (!isdefined(landpos)) {
        landpos = entity.favoriteenemy.origin;
    }
    headproj = spawn("script_model", launchpos);
    headproj setmodel("tag_origin");
    vectorfromenemy = vectornormalize(entity.origin - landpos);
    vectorfromenemy = vectorscale(vectorfromenemy, 250);
    targetpos = landpos + vectorfromenemy + (0, 0, 200);
    headproj clientfield::set("towers_boss_head_proj_fx_cf", 1);
    trajectory = [];
    dirtotarget = targetpos - launchpos;
    var_f1c85329 = (0, 0, 30);
    var_62e75be4 = (0, 0, 200);
    trajectory[trajectory.size] = launchpos + dirtotarget * 0.85 + var_f1c85329;
    trajectory[trajectory.size] = launchpos + dirtotarget * 0.5 + var_62e75be4;
    trajectory[trajectory.size] = launchpos + dirtotarget * 0.15 + var_f1c85329;
    trajectory = array::reverse(trajectory);
    /#
        self thread function_8d7ad318(launchpos, trajectory, targetpos);
    #/
    var_10b732dc = 0.3;
    foreach (point in trajectory) {
        headproj moveto(point, var_10b732dc);
        headproj waittill(#"movedone");
    }
    self playsound(#"hash_62894125ab280b62");
    self notify(#"hash_79e095919e415a70");
    if (isdefined(entity.ai.var_502d9d0d)) {
        [[ entity.ai.var_502d9d0d ]](entity, headproj);
    }
}

// Namespace archetypeelephant/archetype_elephant
// Params 1, eflags: 0x5 linked
// Checksum 0xc6be828c, Offset: 0x2188
// Size: 0x4e4
function private function_df15eebf(entity) {
    origin = entity gettagorigin("j_nose4");
    radiusdamage(origin, 600, 70, 30, entity);
    enemies = util::function_81ccf6d3(self.team);
    foreach (target in enemies) {
        dist = distance(self.origin, target.origin);
        if (isplayer(target) && dist < 600) {
            params = getstatuseffect(#"hash_2c80515d8ac9f1b4");
            weapon = getweapon(#"zombie_ai_defaultmelee");
            target status_effect::status_effect_apply(params, weapon, entity, 0, 500);
            var_95fca4e5 = (target.origin[0], target.origin[1], self.origin[2]);
            var_7d97040b = vectornormalize(var_95fca4e5 - self.origin);
            target playerknockback(1);
            knockback = mapfloat(0, 600, 100, 1000, dist);
            target applyknockback(int(knockback), var_7d97040b);
            target playerknockback(0);
        }
    }
    entity clientfield::increment("towers_boss_melee_effect");
    zombiesarray = getaiarchetypearray(#"zombie");
    zombiesarray = arraycombine(zombiesarray, getaiarchetypearray(#"catalyst"), 0, 0);
    zombiesarray = arraycombine(zombiesarray, getaiarchetypearray(#"tiger"), 0, 0);
    zombiesarray = array::filter(zombiesarray, 0, &function_1d65bc12, entity);
    [[ self.ai.var_64eb729e ]](zombiesarray, entity);
    var_bfd0a84a = getentarray("towers_boss_tower_trigger", "targetname");
    foreach (var_e220a902 in var_bfd0a84a) {
        if (!(isdefined(var_e220a902.b_exploded) && var_e220a902.b_exploded)) {
            distsq = distancesquared(entity.origin, var_e220a902.origin);
            if (distsq < 300 * 300) {
                continue;
            }
            if (!util::within_fov(entity.origin, entity.angles, var_e220a902.origin, cos(90))) {
                continue;
            }
            var_e220a902 notify(#"tower_boss_scripted_trigger_tower");
        }
    }
}

// Namespace archetypeelephant/archetype_elephant
// Params 1, eflags: 0x5 linked
// Checksum 0x47b312e4, Offset: 0x2678
// Size: 0x284
function private function_2328518e(entity) {
    origin = entity gettagorigin("j_nose4");
    radiusdamage(origin, 450, 70, 30, entity);
    enemies = util::function_81ccf6d3(self.team);
    foreach (target in enemies) {
        dist = distance(self.origin, target.origin);
        if (isplayer(target) && dist < 450) {
            params = getstatuseffect(#"hash_2c80515d8ac9f1b4");
            weapon = getweapon("zombie_ai_defaultmelee");
            target status_effect::status_effect_apply(params, weapon, entity, 0, 500);
            var_7d97040b = vectornormalize(anglestoforward(target.origin - self.origin));
            target playerknockback(1);
            knockback = mapfloat(0, 450, 100, 500, dist);
            target applyknockback(int(knockback), var_7d97040b);
            target playerknockback(0);
        }
    }
    entity clientfield::increment("towers_boss_melee_effect");
}

// Namespace archetypeelephant/archetype_elephant
// Params 0, eflags: 0x1 linked
// Checksum 0xbef3fb6f, Offset: 0x2908
// Size: 0x86
function function_9d14fcee() {
    if (isdefined(self.enemy)) {
        predictedpos = self.enemy.origin;
        if (isdefined(predictedpos)) {
            turnyaw = absangleclamp360(self.angles[1] - vectortoangles(predictedpos - self.origin)[1]);
            return turnyaw;
        }
    }
    return undefined;
}

// Namespace archetypeelephant/archetype_elephant
// Params 2, eflags: 0x1 linked
// Checksum 0xa0d7a4d0, Offset: 0x2998
// Size: 0x734
function function_48f6761d(elephant, waittime = 0) {
    wait waittime;
    elephant detach(self.ai.armor, "tag_origin");
    if (elephant isattached(#"hash_4f282285ef50e3ee", "tag_origin")) {
        elephant detach(#"hash_4f282285ef50e3ee", "tag_origin");
    }
    if (elephant isattached(#"hash_4f282185ef50e23b", "tag_origin")) {
        elephant detach(#"hash_4f282185ef50e23b", "tag_origin");
    }
    if (elephant isattached(#"hash_4f282085ef50e088", "tag_origin")) {
        elephant detach(#"hash_4f282085ef50e088", "tag_origin");
    }
    if (elephant isattached(#"hash_4f282785ef50ec6d", "tag_origin")) {
        elephant detach(#"hash_4f282785ef50ec6d", "tag_origin");
    }
    if (elephant isattached(#"hash_4f282585ef50e907", "tag_origin")) {
        elephant detach(#"hash_4f282585ef50e907", "tag_origin");
    }
    if (elephant isattached(#"c_t8_zmb_dlc0_elephant_chain1", "tag_origin")) {
        elephant detach(#"c_t8_zmb_dlc0_elephant_chain1", "tag_origin");
    }
    if (elephant isattached(#"c_t8_zmb_dlc0_elephant_chain2", "tag_origin")) {
        elephant detach(#"c_t8_zmb_dlc0_elephant_chain2", "tag_origin");
    }
    if (elephant isattached(#"c_t8_zmb_dlc0_elephant_chain3", "tag_origin")) {
        elephant detach(#"c_t8_zmb_dlc0_elephant_chain3", "tag_origin");
    }
    if (elephant isattached(#"c_t8_zmb_dlc0_elephant_chain4", "tag_origin")) {
        elephant detach(#"c_t8_zmb_dlc0_elephant_chain4", "tag_origin");
    }
    if (elephant isattached(#"c_t8_zmb_dlc0_elephant_chain5", "tag_origin")) {
        elephant detach(#"c_t8_zmb_dlc0_elephant_chain5", "tag_origin");
    }
    if (elephant isattached(#"c_t8_zmb_dlc0_elephant_chain6", "tag_origin")) {
        elephant detach(#"c_t8_zmb_dlc0_elephant_chain6", "tag_origin");
    }
    if (elephant isattached(#"hash_78fee920883d70c9", "tag_origin")) {
        elephant detach(#"hash_78fee920883d70c9", "tag_origin");
    }
    if (elephant isattached(#"hash_2de139921fda52d2", "tag_origin")) {
        elephant detach(#"hash_2de139921fda52d2", "tag_origin");
    }
    if (elephant isattached(#"hash_53571fb496a1baf7", "tag_origin")) {
        elephant detach(#"hash_53571fb496a1baf7", "tag_origin");
    }
    if (elephant isattached(#"hash_85f1a2ad4a8a800", "tag_origin")) {
        elephant detach(#"hash_85f1a2ad4a8a800", "tag_origin");
    }
    if (elephant isattached(#"hash_6594ef853a532da6", "tag_origin")) {
        elephant detach(#"hash_6594ef853a532da6", "tag_origin");
    }
    if (elephant isattached(#"c_t8_zmb_dlc0_elephant_chain1_evil", "tag_origin")) {
        elephant detach(#"c_t8_zmb_dlc0_elephant_chain1_evil", "tag_origin");
    }
    if (elephant isattached(#"c_t8_zmb_dlc0_elephant_chain2_evil", "tag_origin")) {
        elephant detach(#"c_t8_zmb_dlc0_elephant_chain2_evil", "tag_origin");
    }
    if (elephant isattached(#"c_t8_zmb_dlc0_elephant_chain3_evil", "tag_origin")) {
        elephant detach(#"c_t8_zmb_dlc0_elephant_chain3_evil", "tag_origin");
    }
    if (elephant isattached(#"c_t8_zmb_dlc0_elephant_chain4_evil", "tag_origin")) {
        elephant detach(#"c_t8_zmb_dlc0_elephant_chain4_evil", "tag_origin");
    }
    if (elephant isattached(#"c_t8_zmb_dlc0_elephant_chain5_evil", "tag_origin")) {
        elephant detach(#"c_t8_zmb_dlc0_elephant_chain5_evil", "tag_origin");
    }
    if (elephant isattached(#"c_t8_zmb_dlc0_elephant_chain6_evil", "tag_origin")) {
        elephant detach(#"c_t8_zmb_dlc0_elephant_chain6_evil", "tag_origin");
    }
}

// Namespace archetypeelephant/archetype_elephant
// Params 0, eflags: 0x5 linked
// Checksum 0x8db69855, Offset: 0x30d8
// Size: 0x2cc
function private function_423390f2() {
    self endon(#"death");
    while (!isdefined(self.ai.phase)) {
        waitframe(1);
    }
    if (self.ai.phase == #"hash_266f56fb994e6639") {
        self.ai.armor = #"hash_53ac5aa39c680a35";
    } else {
        self.ai.armor = #"hash_76c423ccbf246dc2";
    }
    self attach(self.ai.armor, "tag_origin");
    if (self.ai.phase == #"hash_266f53fb994e6120") {
        self attach(#"c_t8_zmb_dlc0_elephant_chain1", "tag_origin");
        self attach(#"c_t8_zmb_dlc0_elephant_chain2", "tag_origin");
        self attach(#"c_t8_zmb_dlc0_elephant_chain3", "tag_origin");
        self attach(#"c_t8_zmb_dlc0_elephant_chain4", "tag_origin");
        self attach(#"c_t8_zmb_dlc0_elephant_chain5", "tag_origin");
        self attach(#"c_t8_zmb_dlc0_elephant_chain6", "tag_origin");
        return;
    }
    self attach(#"c_t8_zmb_dlc0_elephant_chain1_evil", "tag_origin");
    self attach(#"c_t8_zmb_dlc0_elephant_chain2_evil", "tag_origin");
    self attach(#"c_t8_zmb_dlc0_elephant_chain3_evil", "tag_origin");
    self attach(#"c_t8_zmb_dlc0_elephant_chain4_evil", "tag_origin");
    self attach(#"c_t8_zmb_dlc0_elephant_chain5_evil", "tag_origin");
    self attach(#"c_t8_zmb_dlc0_elephant_chain6_evil", "tag_origin");
}

// Namespace archetypeelephant/archetype_elephant
// Params 2, eflags: 0x5 linked
// Checksum 0x889ed287, Offset: 0x33b0
// Size: 0x11e
function private function_7427c937(elephant, rider) {
    if (!isdefined(elephant.closestenemy)) {
        return false;
    }
    if (gettime() < elephant.ai.var_4622f7a9) {
        return false;
    }
    if (isdefined(elephant.ai.var_a504b9a3)) {
        return false;
    }
    distsq = distancesquared(elephant.origin, elephant.closestenemy.origin);
    if (distsq < 200 * 200) {
        return false;
    }
    if (!util::within_fov(rider.origin + (0, 0, -40), rider.angles, elephant.closestenemy.origin, cos(70))) {
        return false;
    }
    return true;
}

// Namespace archetypeelephant/archetype_elephant
// Params 3, eflags: 0x5 linked
// Checksum 0x875436ce, Offset: 0x34d8
// Size: 0x132
function private function_67fbc3a3(elephant, rider, var_c3f91959) {
    predictedpos = undefined;
    if (isdefined(elephant.closestenemy)) {
        predictedpos = elephant lastknownpos(elephant.closestenemy);
    } else if (isdefined(var_c3f91959)) {
        predictedpos = var_c3f91959.origin;
    }
    if (isdefined(predictedpos)) {
        turnyaw = absangleclamp360(rider.angles[1] - vectortoangles(predictedpos - rider.origin)[1]);
        if (turnyaw >= 67.5 && turnyaw <= 180) {
            return "attack_right";
        }
        if (turnyaw >= 180 && turnyaw <= 292.5) {
            return "attack_left";
        }
    }
    return "attack_forward";
}

// Namespace archetypeelephant/archetype_elephant
// Params 2, eflags: 0x5 linked
// Checksum 0x7f73ea5d, Offset: 0x3618
// Size: 0x4a6
function private function_978a4592(elephant, rider) {
    rider endon(#"death", #"hash_45ddc9393cf1b3e2");
    elephant endon(#"death");
    while (true) {
        if (isdefined(rider.ai.inpain) && rider.ai.inpain || isdefined(rider.ai.ducking) && rider.ai.ducking) {
            waitframe(1);
            continue;
        }
        if (function_7427c937(elephant, rider)) {
            rider.ai.attacking = 1;
            attackdirection = function_67fbc3a3(elephant, rider);
            aligntag = rider.ai.var_4f12fc77;
            rider.ai.var_c3f91959 = undefined;
            if (attackdirection == "attack_right") {
                rider animation::play(rider.ai.var_182e3181, elephant, aligntag, 1.5, 0.2, 0.1, undefined, undefined, undefined, 0);
            } else if (attackdirection == "attack_left") {
                rider animation::play(rider.ai.var_debedb6f, elephant, aligntag, 1.5, 0.2, 0.1, undefined, undefined, undefined, 0);
            } else {
                rider animation::play(rider.ai.var_9ca71a12, elephant, aligntag, 1.5, 0.2, 0.1, undefined, undefined, undefined, 0);
            }
            rider.ai.attacking = 0;
            wait randomintrange(1, 2);
        } else if (isdefined(level.var_5feff7d0)) {
            var_c3f91959 = [[ level.var_5feff7d0 ]](elephant, rider);
            if (isdefined(var_c3f91959)) {
                rider.ai.attacking = 1;
                attackdirection = function_67fbc3a3(elephant, rider, var_c3f91959);
                aligntag = rider.ai.var_4f12fc77;
                rider.ai.var_c3f91959 = var_c3f91959;
                if (attackdirection == "attack_right") {
                    rider animation::play(rider.ai.var_182e3181, elephant, aligntag, 1.2, 0.2, 0.1, undefined, undefined, undefined, 0);
                } else if (attackdirection == "attack_left") {
                    rider animation::play(rider.ai.var_debedb6f, elephant, aligntag, 1.2, 0.2, 0.1, undefined, undefined, undefined, 0);
                } else {
                    rider animation::play(rider.ai.var_9ca71a12, elephant, aligntag, 1.2, 0.2, 0.1, undefined, undefined, undefined, 0);
                }
                rider.ai.attacking = 0;
                wait randomintrange(1, 2);
            }
        }
        waitframe(1);
    }
}

// Namespace archetypeelephant/archetype_elephant
// Params 2, eflags: 0x1 linked
// Checksum 0x9c877ac0, Offset: 0x3ac8
// Size: 0x68
function function_202012ad(elephant, rider) {
    currenttime = gettime();
    if (isdefined(rider.ai.var_37e9f736) && gettime() - rider.ai.var_37e9f736 <= 50) {
        return true;
    }
    return false;
}

// Namespace archetypeelephant/archetype_elephant
// Params 2, eflags: 0x5 linked
// Checksum 0x6b50e223, Offset: 0x3b38
// Size: 0x196
function private function_1cd7a6d7(elephant, rider) {
    rider endon(#"death", #"hash_45ddc9393cf1b3e2");
    elephant endon(#"death");
    while (true) {
        if (function_202012ad(elephant, rider)) {
            rider.ai.inpain = 1;
            aligntag = rider.ai.var_4f12fc77;
            rider.ai.var_bd0ffccf = rider animmappingsearch(#"hash_2e52a646a71cee70");
            assert(isdefined(rider.ai.var_bd0ffccf));
            rider animation::play(rider.ai.var_bd0ffccf, elephant, aligntag, 1, 0.2, 0.1, undefined, undefined, undefined, 0);
            rider.ai.inpain = 0;
            wait randomintrange(3, 4);
        }
        waitframe(1);
    }
}

// Namespace archetypeelephant/archetype_elephant
// Params 2, eflags: 0x5 linked
// Checksum 0xb8cf536e, Offset: 0x3cd8
// Size: 0x2f4
function private function_557c9c90(elephant, rider) {
    rider endon(#"death", #"hash_45ddc9393cf1b3e2");
    elephant endon(#"death");
    aligntag = rider.ai.var_4f12fc77;
    rider.ai.var_62c039ab = rider animmappingsearch(#"hash_6a0be85d14df502a");
    rider.ai.var_b8d6c5a = rider animmappingsearch(#"hash_22d12a7d199608d0");
    rider.ai.var_1f6a68ae = rider animmappingsearch(#"hash_323636e22326da5f");
    while (true) {
        if (!(isdefined(rider.ai.ducking) && rider.ai.ducking)) {
            waitframe(1);
            continue;
        }
        if (!(isdefined(rider.ai.var_44b45a81) && rider.ai.var_44b45a81)) {
            rider animation::play(rider.ai.var_62c039ab, elephant, aligntag, 1, 0.2, 0.1, undefined, undefined, undefined, 0);
            rider.ai.var_44b45a81 = 1;
        }
        rider animation::play(rider.ai.var_b8d6c5a, elephant, aligntag, 1, 0.2, 0.1, undefined, undefined, undefined, 0);
        if (isdefined(rider.ai.var_34106895) && rider.ai.var_34106895) {
            rider animation::play(rider.ai.var_1f6a68ae, elephant, aligntag, 1, 0.2, 0.1, undefined, undefined, undefined, 0);
            rider.ai.var_44b45a81 = 0;
            rider.ai.ducking = 0;
            rider.ai.var_34106895 = 0;
        }
        waitframe(1);
    }
}

// Namespace archetypeelephant/archetype_elephant
// Params 2, eflags: 0x5 linked
// Checksum 0x6f146d77, Offset: 0x3fd8
// Size: 0x3e8
function private function_2798bb2(elephant, rider) {
    rider endon(#"death", #"hash_45ddc9393cf1b3e2");
    elephant endon(#"death");
    alignstruct = struct::get("tag_align_boss_doors", "targetname");
    if (elephant.ai.phase == #"hash_266f56fb994e6639") {
        rider ghost();
        elephant waittill(#"hash_6537a2364ba9dcb3");
        rider show();
    }
    if (isdefined(rider.ai.var_61a678fe)) {
        rider unlink();
        rider.takedamage = 0;
        rider animation::play(rider.ai.var_61a678fe, alignstruct.origin, alignstruct.angles, 1, 0.2, 0.1, undefined, undefined, undefined, 0);
        rider.takedamage = 1;
        assert(isdefined(rider.ai.var_4f12fc77));
        rider linkto(elephant, rider.ai.var_4f12fc77, (0, 0, 0), (0, 0, 0));
    }
    rider thread function_978a4592(elephant, rider);
    rider thread function_1cd7a6d7(elephant, rider);
    rider thread function_557c9c90(elephant, rider);
    target_set(rider);
    while (true) {
        if (isdefined(rider.ai.ducking) && rider.ai.ducking) {
            waitframe(1);
            continue;
        }
        if (isdefined(rider.ai.attacking) && rider.ai.attacking) {
            waitframe(1);
            continue;
        }
        if (isdefined(rider.ai.inpain) && rider.ai.inpain) {
            waitframe(1);
            continue;
        }
        rider.ai.var_6fe5490e = rider animmappingsearch(#"hash_3cfb620b1f6d2192");
        assert(isdefined(rider.ai.var_6fe5490e));
        rider animation::play(rider.ai.var_6fe5490e, elephant, rider.ai.var_4f12fc77, 1, 0.2, 0.1, undefined, undefined, undefined, 0);
    }
}

// Namespace archetypeelephant/archetype_elephant
// Params 3, eflags: 0x5 linked
// Checksum 0x2707aa3c, Offset: 0x43c8
// Size: 0x4f8
function private function_e5f2ff53(elephant, var_a4946e52, targetname) {
    if (!isdefined(elephant.ai.riders)) {
        elephant.ai.riders = [];
    }
    var_a02578 = self gettagorigin(var_a4946e52);
    var_cfdbb182 = self gettagangles(var_a4946e52);
    rider = spawnactor(#"hash_46a05f54d289c9d7", var_a02578, var_cfdbb182, targetname, 1);
    assert(isdefined(rider));
    rider attach("p7_shr_weapon_spear_lrg", "tag_weapon_right");
    rider.var_c8ec4813 = 1;
    rider linkto(self, var_a4946e52, (0, 0, 0), (0, 0, 0));
    array::add(elephant.ai.riders, rider);
    rider.ai.spearweapon = getweapon("rider_spear_projectile");
    rider.ai.elephant = elephant;
    /#
        recordent(rider);
    #/
    rider.ai.var_6fe5490e = rider animmappingsearch(#"hash_3cfb620b1f6d2192");
    assert(isdefined(rider.ai.var_6fe5490e));
    rider.ai.var_9ca71a12 = rider animmappingsearch(#"hash_52c3d7bee8eabebc");
    assert(isdefined(rider.ai.var_9ca71a12));
    rider.ai.var_182e3181 = rider animmappingsearch(#"hash_4950e0c9a2675981");
    assert(isdefined(rider.ai.var_182e3181));
    rider.ai.var_debedb6f = rider animmappingsearch(#"hash_37f92f1082115f74");
    assert(isdefined(rider.ai.var_debedb6f));
    n_health = 60000;
    for (i = 0; i < level.players.size - 1; i++) {
        n_health += 15000;
    }
    rider.maxhealth = n_health;
    rider.health = n_health;
    rider.goalradius = 24;
    rider.b_ignore_cleanup = 1;
    rider.ignore_nuke = 1;
    rider.lightning_chain_immune = 1;
    rider.var_dd6fe31f = 1;
    rider disableaimassist();
    rider attach("c_t8_zmb_dlc0_zombie_destroyer_le_arm1", "j_shoulder_le");
    rider attach("c_t8_zmb_dlc0_zombie_destroyer_ri_arm1", "j_clavicle_ri");
    rider attach("c_t8_zmb_dlc0_zombie_destroyer_helmet1", "j_head");
    rider attach("c_t8_zmb_dlc0_zombie_destroyer_le_pauldron1", "tag_pauldron_le");
    rider attach("c_t8_zmb_dlc0_zombie_destroyer_ri_pauldron1", "tag_pauldron_ri");
    aiutility::addaioverridedamagecallback(rider, &function_ee23b15d);
    return rider;
}

// Namespace archetypeelephant/archetype_elephant
// Params 0, eflags: 0x5 linked
// Checksum 0x18705911, Offset: 0x48c8
// Size: 0x3fc
function private function_d8c752e0() {
    self endon(#"death");
    while (!isdefined(self.ai.phase)) {
        waitframe(1);
    }
    rider = function_e5f2ff53(self, "tag_char_align_a", #"hash_6101964904e7d17b");
    rider.ai.var_758ed187 = #"hash_20cbd41b17321edc";
    rider.ai.var_4f12fc77 = "tag_char_align_a";
    rider.instakill_func = &function_707d0196;
    rider.allowdeath = 0;
    if (self.ai.phase == #"hash_266f53fb994e6120") {
        rider.ai.var_61a678fe = #"hash_561cf85af113ff1e";
    } else {
        rider.ai.var_61a678fe = #"hash_1447253275dbb643";
    }
    rider thread function_2798bb2(self, rider);
    rider = function_e5f2ff53(self, "tag_char_align_b", #"hash_2672ad69ba7c107");
    rider.ai.var_758ed187 = #"hash_20cbd71b173223f5";
    rider.ai.var_4f12fc77 = "tag_char_align_b";
    rider.instakill_func = &function_707d0196;
    if (self.ai.phase == #"hash_266f53fb994e6120") {
        rider.ai.var_61a678fe = #"hash_561cf75af113fd6b";
    } else {
        rider.ai.var_61a678fe = #"hash_1447263275dbb7f6";
    }
    rider thread function_2798bb2(self, rider);
    if (isdefined(level.var_a52a5487) && level.var_a52a5487) {
        rider = function_e5f2ff53(self, "tag_char_align_c", #"hash_6101964904e7d17b");
        rider.ai.var_758ed187 = #"hash_20cbd41b17321edc";
        rider.ai.var_4f12fc77 = "tag_char_align_c";
        rider.instakill_func = &function_707d0196;
        rider.ai.var_61a678fe = #"hash_1447273275dbb9a9";
        rider thread function_2798bb2(self, rider);
        rider = function_e5f2ff53(self, "tag_char_align_d", #"hash_2672ad69ba7c107");
        rider.ai.var_758ed187 = #"hash_20cbd71b173223f5";
        rider.ai.var_4f12fc77 = "tag_char_align_d";
        rider.instakill_func = &function_707d0196;
        rider.ai.var_61a678fe = #"hash_1447283275dbbb5c";
        rider thread function_2798bb2(self, rider);
    }
}

// Namespace archetypeelephant/archetype_elephant
// Params 0, eflags: 0x4
// Checksum 0xa8c1ee06, Offset: 0x4cd0
// Size: 0xd6
function private function_670bff63() {
    self endon(#"death");
    while (true) {
        if (isdefined(self.favoriteenemy)) {
            dist = distance(self.origin, self.favoriteenemy.origin);
            /#
                record3dtext("<dev string:x4a>" + dist, self.origin, (0, 1, 0), "<dev string:x38>");
                recordcircle(self.favoriteenemy.origin, 4, (0, 1, 1), "<dev string:x41>");
            #/
        }
        waitframe(1);
    }
}

// Namespace archetypeelephant/archetype_elephant
// Params 0, eflags: 0x5 linked
// Checksum 0x10226cd0, Offset: 0x4db0
// Size: 0x374
function private function_4c731a08() {
    self disableaimassist();
    self pushplayer(1);
    self setavoidancemask("avoid none");
    self.ai.var_5c1cc6e9 = gettime() + 3000;
    self.ai.var_c53cce81 = gettime() + randomintrange(3500, 4000);
    self.ai.var_a05929e4 = getweapon(#"elephant_eye_projectile");
    self.ai.var_4622f7a9 = gettime() + randomintrange(1500, 2000);
    self.b_ignore_cleanup = 1;
    self.ignore_nuke = 1;
    self.lightning_chain_immune = 1;
    self.maxhealth = self ai::function_9139c839().minhealth;
    for (i = 0; i < level.players.size - 1; i++) {
        self.maxhealth += int(self ai::function_9139c839().minhealth * self ai::function_9139c839().var_854eebd);
    }
    self.health = self.maxhealth;
    self setrepairpaths(0);
    self.targetname = "zombie_towers_boss";
    self.clamptonavmesh = 1;
    self.ai.var_a5dabb8b = 1;
    self.allowdeath = 0;
    self bloodimpact("none");
    namespace_81245006::initweakpoints(self, #"c_t8_zmb_dlc0_towers_boss_weakpoint_def");
    aiutility::addaioverridedamagecallback(self, &function_cfe82365);
    function_2e4487f6(self, #"hash_8e173ae91589439");
    self thread function_f51431a9(self);
    self thread function_423390f2();
    self setblackboardattribute("_locomotion_speed", "locomotion_speed_run");
    self thread function_d8c752e0();
    self clientfield::set("sndTowersBossArmor", 1);
    self thread function_4ccdadc3();
    /#
        self thread function_670bff63();
        self thread function_ad38f85c();
    #/
}

// Namespace archetypeelephant/archetype_elephant
// Params 0, eflags: 0x5 linked
// Checksum 0x1eef959a, Offset: 0x5130
// Size: 0xa4
function private function_4ccdadc3() {
    self endon(#"death");
    while (!isdefined(self.ai.phase)) {
        wait 0.1;
    }
    if (self.ai.phase == #"hash_266f56fb994e6639") {
        self clientfield::set("towers_boss_eye_fx_cf", 2);
        return;
    }
    self clientfield::set("towers_boss_eye_fx_cf", 1);
}

// Namespace archetypeelephant/archetype_elephant
// Params 1, eflags: 0x5 linked
// Checksum 0xedfe5eff, Offset: 0x51e0
// Size: 0x26
function private function_5db0f49a(entity) {
    entity.ai.isturning = 1;
    return true;
}

// Namespace archetypeelephant/archetype_elephant
// Params 1, eflags: 0x5 linked
// Checksum 0x8a2fc72a, Offset: 0x5210
// Size: 0x26
function private function_1c0db2ec(entity) {
    entity.ai.isturning = 0;
    return true;
}

// Namespace archetypeelephant/archetype_elephant
// Params 1, eflags: 0x5 linked
// Checksum 0x8d43803e, Offset: 0x5240
// Size: 0x44
function private function_9c076ff9(entity) {
    entity setgoal(entity.origin);
    entity clearpath();
}

// Namespace archetypeelephant/archetype_elephant
// Params 3, eflags: 0x5 linked
// Checksum 0x317f06d6, Offset: 0x5290
// Size: 0x1a0
function private function_1d65bc12(enemy, elephant, var_60e4c6b7 = 1) {
    if (isdefined(enemy.knockdown) && enemy.knockdown) {
        return false;
    }
    if (gibserverutils::isgibbed(enemy, 384)) {
        return false;
    }
    if (distancesquared(enemy.origin, elephant.origin) > 250 * 250) {
        return false;
    }
    facingvec = anglestoforward(elephant.angles);
    enemyvec = enemy.origin - elephant.origin;
    var_3e3c8075 = (enemyvec[0], enemyvec[1], 0);
    var_c2ee8451 = (facingvec[0], facingvec[1], 0);
    var_3e3c8075 = vectornormalize(var_3e3c8075);
    var_c2ee8451 = vectornormalize(var_c2ee8451);
    if (var_60e4c6b7) {
        enemydot = vectordot(var_c2ee8451, var_3e3c8075);
        if (enemydot < 0) {
            return false;
        }
    }
    return true;
}

// Namespace archetypeelephant/archetype_elephant
// Params 1, eflags: 0x5 linked
// Checksum 0x65474f71, Offset: 0x5438
// Size: 0x10c
function private elephantknockdownservice(entity) {
    if (!isdefined(self.ai.var_a504b9a3)) {
        return 0;
    }
    zombiesarray = getaiarchetypearray(#"zombie");
    zombiesarray = arraycombine(zombiesarray, getaiarchetypearray(#"catalyst"), 0, 0);
    zombiesarray = arraycombine(zombiesarray, getaiarchetypearray(#"tiger"), 0, 0);
    zombiesarray = array::filter(zombiesarray, 0, &function_1d65bc12, entity);
    [[ self.ai.var_64eb729e ]](zombiesarray, entity);
}

// Namespace archetypeelephant/archetype_elephant
// Params 0, eflags: 0x4
// Checksum 0xcd873622, Offset: 0x5550
// Size: 0xd8
function private function_ad38f85c() {
    self waittill(#"death");
    if (isdefined(self.ai.riders)) {
        foreach (rider in self.ai.riders) {
            if (isdefined(rider)) {
                aiutility::removeaioverridedamagecallback(rider, &function_ee23b15d);
                rider delete();
            }
        }
    }
}

// Namespace archetypeelephant/archetype_elephant
// Params 1, eflags: 0x1 linked
// Checksum 0x4514fe19, Offset: 0x5630
// Size: 0x76c
function function_74fba881(elephant) {
    var_dd54fdb1 = namespace_81245006::function_37e3f011(elephant, "tag_carriage_ws_le");
    if (!isdefined(var_dd54fdb1)) {
        return;
    }
    if (var_dd54fdb1.health <= var_dd54fdb1.maxhealth * 0.1) {
        if (elephant isattached(#"c_t8_zmb_dlc0_elephant_chain6", "tag_origin")) {
            elephant detach(#"c_t8_zmb_dlc0_elephant_chain6", "tag_origin");
            elephant attach(#"hash_4f282585ef50e907", "tag_origin");
            elephant playsound(#"hash_9d86c1e08ca3809");
        } else if (elephant isattached(#"c_t8_zmb_dlc0_elephant_chain6_evil", "tag_origin")) {
            elephant detach(#"c_t8_zmb_dlc0_elephant_chain6_evil", "tag_origin");
            elephant attach(#"hash_6594ef853a532da6", "tag_origin");
            elephant playsound(#"hash_9d86c1e08ca3809");
        }
        return;
    }
    if (var_dd54fdb1.health <= var_dd54fdb1.maxhealth * 0.25) {
        if (elephant isattached(#"c_t8_zmb_dlc0_elephant_chain4", "tag_origin")) {
            elephant detach(#"c_t8_zmb_dlc0_elephant_chain4", "tag_origin");
            elephant detach(#"c_t8_zmb_dlc0_elephant_chain5", "tag_origin");
            elephant attach(#"hash_4f282785ef50ec6d", "tag_origin");
            elephant playsound(#"hash_55bac56f7a46775c");
        } else if (elephant isattached(#"c_t8_zmb_dlc0_elephant_chain4_evil", "tag_origin")) {
            elephant detach(#"c_t8_zmb_dlc0_elephant_chain4_evil", "tag_origin");
            elephant detach(#"c_t8_zmb_dlc0_elephant_chain5_evil", "tag_origin");
            elephant attach(#"hash_85f1a2ad4a8a800", "tag_origin");
            elephant playsound(#"hash_55bac56f7a46775c");
        }
        return;
    }
    if (var_dd54fdb1.health <= var_dd54fdb1.maxhealth * 0.5) {
        if (elephant isattached(#"c_t8_zmb_dlc0_elephant_chain3", "tag_origin")) {
            elephant detach(#"c_t8_zmb_dlc0_elephant_chain3", "tag_origin");
            elephant attach(#"hash_4f282085ef50e088", "tag_origin");
            elephant playsound(#"hash_55bac56f7a46775c");
        } else if (elephant isattached(#"c_t8_zmb_dlc0_elephant_chain3_evil", "tag_origin")) {
            elephant detach(#"c_t8_zmb_dlc0_elephant_chain3_evil", "tag_origin");
            elephant attach(#"hash_53571fb496a1baf7", "tag_origin");
            elephant playsound(#"hash_55bac56f7a46775c");
        }
        return;
    }
    if (var_dd54fdb1.health <= var_dd54fdb1.maxhealth * 0.75) {
        if (elephant isattached(#"c_t8_zmb_dlc0_elephant_chain2", "tag_origin")) {
            elephant detach(#"c_t8_zmb_dlc0_elephant_chain2", "tag_origin");
            elephant attach(#"hash_4f282185ef50e23b", "tag_origin");
            elephant playsound(#"hash_55bac56f7a46775c");
        } else if (elephant isattached(#"c_t8_zmb_dlc0_elephant_chain2_evil", "tag_origin")) {
            elephant detach(#"c_t8_zmb_dlc0_elephant_chain2_evil", "tag_origin");
            elephant attach(#"hash_2de139921fda52d2", "tag_origin");
            elephant playsound(#"hash_55bac56f7a46775c");
        }
        return;
    }
    if (var_dd54fdb1.health <= var_dd54fdb1.maxhealth * 0.95) {
        if (elephant isattached(#"c_t8_zmb_dlc0_elephant_chain1", "tag_origin")) {
            elephant detach(#"c_t8_zmb_dlc0_elephant_chain1", "tag_origin");
            elephant attach(#"hash_4f282285ef50e3ee", "tag_origin");
            elephant playsound(#"hash_55bac56f7a46775c");
            return;
        }
        if (elephant isattached(#"c_t8_zmb_dlc0_elephant_chain1_evil", "tag_origin")) {
            elephant detach(#"c_t8_zmb_dlc0_elephant_chain1_evil", "tag_origin");
            elephant attach(#"hash_78fee920883d70c9", "tag_origin");
            elephant playsound(#"hash_55bac56f7a46775c");
        }
    }
}

// Namespace archetypeelephant/archetype_elephant
// Params 3, eflags: 0x1 linked
// Checksum 0xd6e7e5f9, Offset: 0x5da8
// Size: 0x186
function function_c153d922(elephant, point, bonename) {
    assert(isdefined(point) && isdefined(bonename));
    weakpointpos = elephant gettagorigin(bonename);
    if (distancesquared(weakpointpos, point) <= 40 * 40) {
        /#
            recordsphere(point, 4, (0, 1, 0), "<dev string:x41>");
        #/
        /#
            recordsphere(weakpointpos, 4, (0, 0, 1), "<dev string:x41>");
        #/
        /#
            recordline(weakpointpos, point, (0, 0, 1), "<dev string:x41>");
        #/
        return true;
    }
    /#
        recordsphere(point, 4, (1, 0, 0), "<dev string:x41>");
    #/
    /#
        recordsphere(weakpointpos, 4, (0, 0, 1), "<dev string:x41>");
    #/
    /#
        recordline(weakpointpos, point, (0, 0, 1), "<dev string:x41>");
    #/
    return false;
}

// Namespace archetypeelephant/archetype_elephant
// Params 3, eflags: 0x1 linked
// Checksum 0xf5320b86, Offset: 0x5f38
// Size: 0x182
function function_498f147(elephant, point, boneindex) {
    if (!isdefined(point)) {
        return 0;
    }
    if (isdefined(boneindex)) {
        var_dd54fdb1 = namespace_81245006::function_37e3f011(self, boneindex);
        if (isdefined(var_dd54fdb1)) {
            return getpartname(elephant, boneindex);
        }
    }
    if (self.ai.var_112ec817 == #"hash_8e173ae91589439") {
        if (function_c153d922(elephant, point, "tag_chest_armor_ws")) {
            return "tag_chest_armor_ws";
        }
        if (function_c153d922(elephant, point, "tag_carriage_ws_le")) {
            return "tag_carriage_ws_le";
        }
        if (function_c153d922(elephant, point, "tag_carriage_ws_ri")) {
            return "tag_carriage_ws_ri";
        }
    } else {
        if (function_c153d922(elephant, point, "tag_head_ws")) {
            return "tag_head_ws";
        }
        if (function_c153d922(elephant, point, "tag_body_ws")) {
            return "tag_body_ws";
        }
    }
    return undefined;
}

// Namespace archetypeelephant/archetype_elephant
// Params 6, eflags: 0x1 linked
// Checksum 0x68f72a25, Offset: 0x60c8
// Size: 0x234
function function_e864f0da(elephant, damage, attacker, point, dir, var_88cb1bf9) {
    assert(isdefined(elephant));
    self.var_265cb589 = 1;
    var_dd54fdb1 = namespace_81245006::function_37e3f011(elephant, "tag_carriage_ws_le");
    if (isdefined(var_dd54fdb1) && namespace_81245006::function_f29756fe(var_dd54fdb1) === 1) {
        attacker playhitmarker(undefined, 5, undefined, 1, 0);
        level notify(#"hash_3aa3137f1bf70773");
        namespace_81245006::function_ef87b7e8(var_dd54fdb1, damage);
        /#
            iprintlnbold("<dev string:x4d>" + var_dd54fdb1.health);
        #/
        if (namespace_81245006::function_f29756fe(var_dd54fdb1) === 3) {
            /#
                iprintlnbold("<dev string:x63>");
            #/
        }
        function_74fba881(elephant);
        if (isdefined(var_88cb1bf9)) {
            if (elephant.ai.phase == #"hash_266f56fb994e6639") {
                playfxontag("maps/zm_towers/fx8_boss_dmg_weakspot_gem_blue", elephant, var_88cb1bf9);
            } else {
                playfxontag("maps/zm_towers/fx8_boss_dmg_weakspot_gem_red", elephant, var_88cb1bf9);
            }
        }
        return;
    }
    playfx("maps/zm_towers/fx8_boss_dmg_flesh", point, dir * -1);
    attacker playhitmarker(undefined, 1, undefined, 0);
}

// Namespace archetypeelephant/archetype_elephant
// Params 1, eflags: 0x4
// Checksum 0x633da4ba, Offset: 0x6308
// Size: 0x72
function private function_c62e8244(damage) {
    n_scalar = 1.5;
    for (i = 0; i < level.players.size; i++) {
        n_scalar -= 0.07;
    }
    return int(damage * n_scalar);
}

// Namespace archetypeelephant/archetype_elephant
// Params 1, eflags: 0x5 linked
// Checksum 0x56a216d2, Offset: 0x6388
// Size: 0x66
function private function_a903e1eb(elephant) {
    var_dd54fdb1 = namespace_81245006::function_37e3f011(elephant, "tag_carriage_ws_le");
    if (isdefined(var_dd54fdb1) && namespace_81245006::function_f29756fe(var_dd54fdb1) === 3) {
        return true;
    }
    return false;
}

// Namespace archetypeelephant/archetype_elephant
// Params 12, eflags: 0x1 linked
// Checksum 0xb2e95742, Offset: 0x63f8
// Size: 0x1a4
function function_ee23b15d(inflictor, attacker, damage, idflags, meansofdeath, weapon, point, dir, hitloc, offsettime, boneindex, modelindex) {
    if (attacker === self) {
        return 0;
    }
    if (isdefined(attacker) && !isplayer(attacker)) {
        return 0;
    }
    if (self.health - damage <= 0) {
        self.health += int(damage + 1);
        self.ai.var_37e9f736 = gettime();
    }
    assert(isdefined(self.ai.elephant));
    if (isdefined(level.var_b394f92f)) {
        damage_scalar = [[ level.var_b394f92f ]](attacker, weapon, boneindex, hitloc, point);
        damage *= damage_scalar;
    }
    function_e864f0da(self.ai.elephant, damage, attacker, point, dir);
    level notify(#"basket_hit");
    return damage;
}

// Namespace archetypeelephant/archetype_elephant
// Params 12, eflags: 0x1 linked
// Checksum 0x5cb78b3d, Offset: 0x65a8
// Size: 0x92
function function_cfe82365(inflictor, attacker, damage, idflags, meansofdeath, weapon, point, dir, hitloc, offsettime, boneindex, modelindex) {
    if (isdefined(attacker) && !isplayer(attacker)) {
        return 0;
    }
    return damage;
}

// Namespace archetypeelephant/archetype_elephant
// Params 0, eflags: 0x5 linked
// Checksum 0x6846f74, Offset: 0x6648
// Size: 0x4a
function private function_e8525036() {
    blackboard::createblackboardforentity(self);
    ai::createinterfaceforentity(self);
    self.___archetypeonanimscriptedcallback = &function_137a1ca8;
}

// Namespace archetypeelephant/archetype_elephant
// Params 1, eflags: 0x5 linked
// Checksum 0xd23a2d3f, Offset: 0x66a0
// Size: 0x2c
function private function_137a1ca8(entity) {
    entity.__blackboard = undefined;
    entity function_e8525036();
}

// Namespace archetypeelephant/archetype_elephant
// Params 1, eflags: 0x5 linked
// Checksum 0x816ecd1d, Offset: 0x66d8
// Size: 0x110
function private function_16096ca1(elephant) {
    if (elephant.ai.var_112ec817 == #"hash_8e173ae91589439") {
        return false;
    }
    var_9f6c27c5 = 0;
    var_dd54fdb1 = namespace_81245006::function_37e3f011(elephant, "tag_body_ws");
    if (isdefined(var_dd54fdb1) && namespace_81245006::function_f29756fe(var_dd54fdb1) === 3) {
        var_9f6c27c5 = 1;
    }
    headdestroyed = 0;
    var_dd54fdb1 = namespace_81245006::function_37e3f011(elephant, "tag_head_ws");
    if (isdefined(var_dd54fdb1) && namespace_81245006::function_f29756fe(var_dd54fdb1) === 3) {
        headdestroyed = 1;
    }
    if (var_9f6c27c5 || headdestroyed) {
        return true;
    }
    return false;
}

// Namespace archetypeelephant/archetype_elephant
// Params 1, eflags: 0x5 linked
// Checksum 0x347bf9dc, Offset: 0x67f0
// Size: 0x56
function private function_d6ae999a(elephant) {
    if (elephant.ai.var_112ec817 != #"hash_8e173ae91589439") {
        return true;
    }
    if (function_a903e1eb(elephant)) {
        return true;
    }
    return false;
}

// Namespace archetypeelephant/archetype_elephant
// Params 2, eflags: 0x5 linked
// Checksum 0x19e68a24, Offset: 0x6850
// Size: 0x104
function private function_26ce5914(rider, elephant) {
    rider endon(#"death");
    rider notify(#"hash_45ddc9393cf1b3e2");
    rider animation::stop();
    rider animation::play(rider.ai.var_758ed187, elephant, rider.ai.var_4f12fc77, 1, 0.2, 0.1);
    aiutility::removeaioverridedamagecallback(rider, &function_ee23b15d);
    rider unlink();
    rider.allowdeath = 1;
    rider delete();
}

// Namespace archetypeelephant/archetype_elephant
// Params 0, eflags: 0x1 linked
// Checksum 0x331e33f9, Offset: 0x6960
// Size: 0xe4
function function_91bee4fc() {
    self clientfield::set("sndTowersBossArmor", 0);
    self thread function_48f6761d(self, 0.1);
    self.var_25f9fcf1 show();
    self.var_25f9fcf1 useanimtree("generic");
    self.var_25f9fcf1 animation::play("p8_fxanim_zm_towers_boss_armor_explode_anim", self.origin, self.angles, 1, 0.2, 0.1, undefined, undefined, undefined, 0);
    self.var_25f9fcf1 delete();
}

// Namespace archetypeelephant/archetype_elephant
// Params 0, eflags: 0x1 linked
// Checksum 0xa48b4af1, Offset: 0x6a50
// Size: 0xb4
function function_cd989dbb() {
    self.var_25f9fcf1 = spawn("script_model", self.origin);
    if (self.ai.phase == #"hash_266f56fb994e6639") {
        self.var_25f9fcf1 setmodel("p8_fxanim_zm_towers_boss_armor_explode_02_mod");
    } else {
        self.var_25f9fcf1 setmodel("p8_fxanim_zm_towers_boss_armor_explode_mod");
    }
    self.var_25f9fcf1 hide();
}

// Namespace archetypeelephant/archetype_elephant
// Params 1, eflags: 0x5 linked
// Checksum 0xb34105f5, Offset: 0x6b10
// Size: 0x374
function private function_4d479d22(elephant) {
    if (!isdefined(elephant.ai.riders)) {
        return;
    }
    foreach (rider in elephant.ai.riders) {
        rider thread function_26ce5914(rider, elephant);
    }
    elephant function_cd989dbb();
    elephant.maxhealth = elephant ai::function_9139c839().minhealth;
    for (i = 0; i < level.players.size - 1; i++) {
        elephant.maxhealth += int(elephant ai::function_9139c839().minhealth * elephant ai::function_9139c839().var_854eebd);
    }
    elephant.health = elephant.maxhealth;
    elephant animation::play("ch_vign_tplt_inbtl_hllpht_evlve_2_stg_2_00_hllpht", undefined, undefined, 1, 0.2, 0.1, undefined, undefined, undefined, 0);
    level notify(#"hash_634700dd42db02d8");
    elephant setblackboardattribute("_locomotion_speed", "locomotion_speed_run");
    var_dd54fdb1 = namespace_81245006::function_37e3f011(elephant, "tag_carriage_ws_le");
    namespace_81245006::function_6c64ebd3(var_dd54fdb1, 2);
    var_dd54fdb1 = namespace_81245006::function_37e3f011(elephant, "tag_carriage_ws_ri");
    namespace_81245006::function_6c64ebd3(var_dd54fdb1, 2);
    var_dd54fdb1 = namespace_81245006::function_37e3f011(elephant, "tag_chest_armor_ws");
    namespace_81245006::function_6c64ebd3(var_dd54fdb1, 2);
    var_dd54fdb1 = namespace_81245006::function_37e3f011(elephant, "tag_body_ws");
    namespace_81245006::function_6c64ebd3(var_dd54fdb1, 1);
    var_dd54fdb1 = namespace_81245006::function_37e3f011(elephant, "tag_head_ws");
    namespace_81245006::function_6c64ebd3(var_dd54fdb1, 1);
    function_2e4487f6(elephant, #"hash_8e170ae91588f20");
}

// Namespace archetypeelephant/archetype_elephant
// Params 1, eflags: 0x5 linked
// Checksum 0x87820d89, Offset: 0x6e90
// Size: 0x16c
function private function_f51431a9(elephant) {
    elephant endon(#"death");
    while (true) {
        var_55fb74b2 = elephant.health <= elephant.maxhealth * 0.5;
        var_e8e6826f = elephant.health <= elephant.maxhealth * 0.2;
        currentstate = elephant.ai.var_112ec817;
        switch (currentstate) {
        case #"hash_8e170ae91588f20":
            if (function_16096ca1(elephant) || var_e8e6826f) {
                level thread elephantstartdeath(elephant);
                return;
            }
            break;
        case #"hash_8e173ae91589439":
            if (function_d6ae999a(elephant) || var_55fb74b2) {
                elephant function_4d479d22(elephant);
            }
            break;
        }
        wait 1;
    }
}

// Namespace archetypeelephant/archetype_elephant
// Params 2, eflags: 0x5 linked
// Checksum 0xb7bc4af8, Offset: 0x7008
// Size: 0xba
function private function_2e4487f6(elephant, stage) {
    assert(stage == #"hash_8e173ae91589439" || stage == #"hash_8e170ae91588f20");
    elephant.ai.var_112ec817 = stage;
    switch (stage) {
    case #"hash_8e173ae91589439":
        break;
    case #"hash_8e170ae91588f20":
        break;
    default:
        break;
    }
}

// Namespace archetypeelephant/archetype_elephant
// Params 1, eflags: 0x1 linked
// Checksum 0xb6f5fdf0, Offset: 0x70d0
// Size: 0x22c
function function_cd472d5(entity) {
    stage = entity.ai.var_112ec817;
    if (stage != #"hash_8e170ae91588f20") {
        return false;
    }
    if (isdefined(self.var_b554dbf2) && self.var_b554dbf2) {
        return false;
    }
    if (!isdefined(entity.favoriteenemy)) {
        return false;
    }
    if (isdefined(entity.ai.var_f2d193df) && gettime() < entity.ai.var_f2d193df) {
        return false;
    }
    if (distancesquared(entity.favoriteenemy.origin, entity.origin) < 600 * 600) {
        return false;
    }
    if (randomint(100) < 50) {
        return false;
    }
    fov = cos(30);
    if (!util::within_fov(entity.origin, entity.angles, entity.favoriteenemy.origin, fov)) {
        return false;
    }
    var_b21fc1a7 = blackboard::getblackboardevents("towersboss_head_proj");
    if (isdefined(var_b21fc1a7) && var_b21fc1a7.size) {
        foreach (var_358d39a3 in var_b21fc1a7) {
            if (var_358d39a3.enemy === entity.favoriteenemy) {
                return false;
            }
        }
    }
    return true;
}

// Namespace archetypeelephant/archetype_elephant
// Params 2, eflags: 0x1 linked
// Checksum 0xe7c3c743, Offset: 0x7308
// Size: 0x3c4
function function_ce8fe2b0(entity, splitorigin) {
    self endon(#"death");
    forwardvec = vectornormalize(anglestoforward(entity.angles));
    forwarddist = 200;
    if (isdefined(splitorigin)) {
        launchpoint = splitorigin;
    } else {
        launchpoint = entity.origin + forwarddist * forwardvec;
    }
    closestpointonnavmesh = getclosestpointonnavmesh(launchpoint, 500, 200);
    if (isdefined(closestpointonnavmesh)) {
        trace = groundtrace(closestpointonnavmesh + (0, 0, 200), closestpointonnavmesh + (0, 0, -200), 0, undefined);
        if (isdefined(trace[#"position"])) {
            newpos = trace[#"position"];
        }
        /#
            recordsphere(newpos, 15, (1, 0.5, 0), "<dev string:x41>");
        #/
        dustball = spawnvehicle(#"hash_6be593a62b8b87a5", newpos, entity.angles, "dynamic_spawn_ai");
        if (isdefined(dustball)) {
            dustball.var_6353e3f1 = 1;
            entity.ai.var_f2d193df = gettime() + randomintrange(5000, 8000);
            if (isdefined(self.var_fe41477d) && self.var_fe41477d) {
                entity.ai.var_f2d193df = gettime() + 5000;
            }
        }
    } else {
        /#
            recordsphere(launchpoint, 15, (0, 0, 0), "<dev string:x41>");
        #/
    }
    wait 0.5;
    targets = getplayers();
    for (i = 0; i < targets.size; i++) {
        target = targets[i];
        if (!is_player_valid(target, 1, 1) || !function_71790b86(entity)) {
            arrayremovevalue(targets, target);
            break;
        }
    }
    if (targets.size == 0) {
        return;
    }
    if (targets.size > 1 && self.ai.phase == #"hash_266f56fb994e6639" && isdefined(dustball) && isalive(dustball) && !isdefined(splitorigin)) {
        function_ce8fe2b0(self, dustball.origin);
    }
}

// Namespace archetypeelephant/archetype_elephant
// Params 1, eflags: 0x1 linked
// Checksum 0x8f405aef, Offset: 0x76d8
// Size: 0x1f4
function function_69faa74(entity) {
    stage = entity.ai.var_112ec817;
    if (stage != #"hash_8e170ae91588f20") {
        return false;
    }
    if (isdefined(self.var_fe41477d) && self.var_fe41477d) {
        return false;
    }
    if (!isdefined(entity.favoriteenemy)) {
        return false;
    }
    if (gettime() < entity.ai.var_c53cce81) {
        return false;
    }
    if (distancesquared(entity.favoriteenemy.origin, entity.origin) < 600 * 600) {
        return false;
    }
    fov = cos(20);
    if (!util::within_fov(entity.origin, entity.angles, entity.favoriteenemy.origin, fov)) {
        return false;
    }
    var_b21fc1a7 = blackboard::getblackboardevents("towersboss_head_proj");
    if (isdefined(var_b21fc1a7) && var_b21fc1a7.size) {
        foreach (var_358d39a3 in var_b21fc1a7) {
            if (var_358d39a3.enemy === entity.favoriteenemy) {
                return false;
            }
        }
    }
    return true;
}

// Namespace archetypeelephant/archetype_elephant
// Params 1, eflags: 0x1 linked
// Checksum 0x87c276f1, Offset: 0x78d8
// Size: 0xcc
function function_2bfd3841(entity) {
    entity.ai.var_c53cce81 = gettime() + randomintrange(3500, 4000);
    var_51955401 = spawnstruct();
    var_51955401.enemy = entity.favoriteenemy;
    entity.var_f6ea2286 = entity.favoriteenemy.origin;
    blackboard::addblackboardevent("towersboss_head_proj", var_51955401, randomintrange(3500, 4000));
}

// Namespace archetypeelephant/archetype_elephant
// Params 1, eflags: 0x1 linked
// Checksum 0xd6003e12, Offset: 0x79b0
// Size: 0x86
function function_18e1bf30(entity) {
    if (!elephantshouldmelee(entity)) {
        return false;
    }
    if (!util::within_fov(entity.origin, entity.angles, entity.favoriteenemy.origin, cos(45))) {
        return false;
    }
    return true;
}

// Namespace archetypeelephant/archetype_elephant
// Params 1, eflags: 0x5 linked
// Checksum 0x445ea765, Offset: 0x7a40
// Size: 0x156
function private elephantshouldmelee(entity) {
    if (!isdefined(entity.favoriteenemy)) {
        return false;
    }
    if (entity asmistransitionrunning() || entity asmistransdecrunning()) {
        return false;
    }
    if (isdefined(entity.ai.isturning) && entity.ai.isturning) {
        return false;
    }
    disttoenemysq = distancesquared(entity.favoriteenemy.origin, entity.origin);
    yawtoenemy = angleclamp180(entity.angles[1] - vectortoangles(entity.favoriteenemy.origin - entity.origin)[1]);
    if (disttoenemysq <= 440 * 440 && abs(yawtoenemy) < 80) {
        return true;
    }
    return false;
}

// Namespace archetypeelephant/archetype_elephant
// Params 1, eflags: 0x5 linked
// Checksum 0x1e9359df, Offset: 0x7ba0
// Size: 0x10
function private function_71790b86(entity) {
    return true;
}

// Namespace archetypeelephant/archetype_elephant
// Params 1, eflags: 0x5 linked
// Checksum 0xb435b13c, Offset: 0x7bb8
// Size: 0x186
function private function_2ff17378(entity) {
    if (isdefined(entity.ai.var_ea8d826a) && entity.ai.var_ea8d826a) {
        return false;
    }
    if (!isdefined(entity.favoriteenemy)) {
        return false;
    }
    if (entity.ai.var_5c1cc6e9 > gettime()) {
        return false;
    }
    if (isdefined(entity.ai.var_a504b9a3)) {
        return false;
    }
    if (entity asmistransitionrunning() || entity asmistransdecrunning()) {
        return false;
    }
    if (isdefined(entity.ai.isturning) && entity.ai.isturning) {
        return false;
    }
    if (!function_71790b86(entity)) {
        return false;
    }
    disttoenemysq = distancesquared(entity.favoriteenemy.origin, entity.origin);
    if (disttoenemysq <= 850 * 850) {
        return false;
    }
    if (elephantshouldmelee(entity)) {
        return false;
    }
    return true;
}

// Namespace archetypeelephant/archetype_elephant
// Params 1, eflags: 0x5 linked
// Checksum 0x588c839b, Offset: 0x7e28
// Size: 0x9c
function private function_10a75bb7(entity) {
    if (function_2ff17378(entity)) {
        targetpos = getclosestpointonnavmesh(entity.favoriteenemy.origin, 400, entity getpathfindingradius() * 1.2);
        if (isdefined(targetpos)) {
            entity setgoal(targetpos);
            return true;
        }
    }
    return false;
}

// Namespace archetypeelephant/archetype_elephant
// Params 1, eflags: 0x5 linked
// Checksum 0x9f91f118, Offset: 0x7ed0
// Size: 0x2d6
function private function_f2c697c7(entity) {
    entity.ai.var_a504b9a3 = new class_a504b9a3();
    entity.ai.var_a504b9a3.var_86d0fc5 = entity.goalpos;
    entity.ai.var_a504b9a3.var_9ab05afa = distancesquared(entity.origin, entity.goalpos);
    entity.ai.var_a504b9a3.startpos = entity.origin;
    stage = entity.ai.var_112ec817;
    if (isdefined(entity.ai.riders)) {
        foreach (rider in entity.ai.riders) {
            if (isdefined(rider)) {
                rider.ai.ducking = 1;
            }
        }
    }
    switch (stage) {
    case #"hash_8e173ae91589439":
        entity.ai.var_a504b9a3.var_6392c3a2 = gettime() + randomintrange(2500, 3000);
        entity.ai.var_a504b9a3.var_190509f3 = 250 * 250;
        entity.ai.var_a504b9a3.var_f84fafb2 = 400 * 400;
        break;
    case #"hash_8e170ae91588f20":
        entity.ai.var_a504b9a3.var_6392c3a2 = gettime() + randomintrange(3500, 4000);
        entity.ai.var_a504b9a3.var_190509f3 = 250 * 250;
        entity.ai.var_a504b9a3.var_f84fafb2 = 400 * 400;
        break;
    default:
        break;
    }
    return true;
}

// Namespace archetypeelephant/archetype_elephant
// Params 1, eflags: 0x5 linked
// Checksum 0x44664e14, Offset: 0x81b0
// Size: 0x5d2
function private function_f8145b00(entity) {
    if (isdefined(entity.favoriteenemy) && isalive(entity.favoriteenemy)) {
        assert(isdefined(entity.ai.var_a504b9a3));
        assert(isdefined(entity.ai.var_a504b9a3.var_86d0fc5));
        assert(isdefined(entity.ai.var_a504b9a3.var_6392c3a2));
        /#
            recordsphere(entity.ai.var_a504b9a3.var_86d0fc5, 8, (1, 0, 0), "<dev string:x41>");
        #/
        if (entity asmistransitionrunning() || entity asmistransdecrunning()) {
            return true;
        }
        if (gettime() < entity.ai.var_a504b9a3.var_9177748f) {
            return true;
        }
        if (gettime() <= entity.ai.var_a504b9a3.var_6392c3a2) {
            var_ba63d54d = distancesquared(entity.ai.var_a504b9a3.var_86d0fc5, entity.favoriteenemy.origin);
            var_3a73a0ae = distancesquared(entity.ai.var_a504b9a3.startpos, entity.favoriteenemy.origin) > entity.ai.var_a504b9a3.var_9ab05afa;
            threshold = entity.ai.var_a504b9a3.var_190509f3;
            if (var_3a73a0ae) {
                threshold = entity.ai.var_a504b9a3.var_f84fafb2;
            }
            if (var_ba63d54d <= threshold && sighttracepassed(entity.origin + (0, 0, 200), entity.favoriteenemy.origin + (0, 0, 100), 0, entity, entity.favoriteenemy)) {
                /#
                    recordline(entity.origin + (0, 0, 200), entity.favoriteenemy.origin + (0, 0, 200), (0, 1, 0), "<dev string:x38>");
                #/
                targetpos = getclosestpointonnavmesh(entity.favoriteenemy.origin, 400, entity getpathfindingradius() * 1.2);
                if (isdefined(targetpos)) {
                    /#
                        recordsphere(targetpos, 8, (0, 1, 1), "<dev string:x41>");
                    #/
                    dirtoenemy = vectornormalize(targetpos - self.origin);
                    targetpos += vectorscale(dirtoenemy * -1, 170);
                    targetpos = getclosestpointonnavmesh(targetpos, 400, entity getpathfindingradius() * 1.2);
                    if (isdefined(targetpos)) {
                        path = generatenavmeshpath(self.origin, targetpos, self);
                        if (!isdefined(path) || !isdefined(path.pathpoints) || path.pathpoints.size == 0) {
                            /#
                                recordsphere(targetpos, 8, (0.1, 0.1, 0.1), "<dev string:x41>");
                            #/
                        } else {
                            entity setgoal(targetpos);
                            /#
                                recordsphere(targetpos, 8, (0, 0, 1), "<dev string:x41>");
                            #/
                            /#
                                recordline(entity.ai.var_a504b9a3.var_86d0fc5, targetpos, (1, 0, 0), "<dev string:x41>");
                            #/
                        }
                    } else {
                        /#
                            recordsphere(targetpos, 8, (0.1, 0.1, 0.1), "<dev string:x41>");
                        #/
                    }
                }
            }
        }
    }
    entity.ai.var_a504b9a3.var_9177748f = gettime() + 200;
    return true;
}

// Namespace archetypeelephant/archetype_elephant
// Params 1, eflags: 0x5 linked
// Checksum 0xb446d44c, Offset: 0x8790
// Size: 0x1ae
function private function_d3d560e9(entity) {
    entity aiutility::cleararrivalpos(entity);
    entity.ai.var_a504b9a3 = undefined;
    stage = entity.ai.var_112ec817;
    if (isdefined(entity.ai.riders)) {
        foreach (rider in entity.ai.riders) {
            if (isdefined(rider)) {
                rider.ai.var_34106895 = 1;
            }
        }
    }
    switch (stage) {
    case #"hash_8e173ae91589439":
        entity.ai.var_5c1cc6e9 = gettime() + randomintrange(8000, 10000);
        break;
    case #"hash_8e170ae91588f20":
        entity.ai.var_5c1cc6e9 = gettime() + randomintrange(6500, 7500);
        break;
    default:
        break;
    }
    return true;
}

// Namespace archetypeelephant/archetype_elephant
// Params 3, eflags: 0x1 linked
// Checksum 0xbb0610c0, Offset: 0x8948
// Size: 0x190
function is_player_valid(player, checkignoremeflag, ignore_laststand_players) {
    if (!isdefined(player)) {
        return 0;
    }
    if (!isalive(player)) {
        return 0;
    }
    if (!isplayer(player)) {
        return 0;
    }
    if (player isnotarget()) {
        return 0;
    }
    if (isdefined(player.is_zombie) && player.is_zombie == 1) {
        return 0;
    }
    if (player.sessionstate == "spectator") {
        return 0;
    }
    if (player.sessionstate == "intermission") {
        return 0;
    }
    if (isdefined(player.intermission) && player.intermission) {
        return 0;
    }
    if (!(isdefined(ignore_laststand_players) && ignore_laststand_players)) {
        if (player laststand::player_is_in_laststand()) {
            return 0;
        }
    }
    if (player isnotarget()) {
        return 0;
    }
    if (isdefined(checkignoremeflag) && checkignoremeflag && player.ignoreme) {
        return 0;
    }
    if (isdefined(level.is_player_valid_override)) {
        return [[ level.is_player_valid_override ]](player);
    }
    return 1;
}

// Namespace archetypeelephant/archetype_elephant
// Params 1, eflags: 0x5 linked
// Checksum 0xd3b3f1b4, Offset: 0x8ae0
// Size: 0x166
function private function_ab5aea01(entity) {
    if (isdefined(entity.ai.var_a504b9a3)) {
        return false;
    }
    targets = getplayers();
    for (i = 0; i < targets.size; i++) {
        target = targets[i];
        if (!is_player_valid(target, 1, 1) || !function_71790b86(entity)) {
            arrayremovevalue(targets, target);
            break;
        }
    }
    if (targets.size == 0) {
        return false;
    }
    sortedtargets = arraysort(targets, entity.origin, 0);
    entity.favoriteenemy = sortedtargets[0];
    sortedtargets = arraysortclosest(targets, entity.origin);
    entity.closestenemy = sortedtargets[0];
    return true;
}

// Namespace archetypeelephant/archetype_elephant
// Params 1, eflags: 0x5 linked
// Checksum 0xd93cfd5b, Offset: 0x8c50
// Size: 0xaa
function private function_2c58bc39(entity) {
    if (isdefined(entity.ignoreall) && entity.ignoreall) {
        return 0;
    }
    stage = self.ai.var_112ec817;
    switch (stage) {
    case #"hash_8e170ae91588f20":
    case #"hash_8e173ae91589439":
        function_ab5aea01(entity);
        break;
    default:
        break;
    }
}

// Namespace archetypeelephant/archetype_elephant
// Params 5, eflags: 0x5 linked
// Checksum 0x11d1d49c, Offset: 0x8d08
// Size: 0xa4
function private function_5e17ac7a(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    entity animmode("zonly_physics", 1);
    entity pathmode("dont move");
    entity clearpath();
    entity setgoal(entity.origin);
}

// Namespace archetypeelephant/archetype_elephant
// Params 5, eflags: 0x5 linked
// Checksum 0x65ad9a6f, Offset: 0x8db8
// Size: 0x2c
function private function_e88518a1(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    
}

// Namespace archetypeelephant/archetype_elephant
// Params 5, eflags: 0x5 linked
// Checksum 0x24420a49, Offset: 0x8df0
// Size: 0x6c
function private function_10296bfa(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    entity pathmode("move allowed");
    entity setgoal(entity.origin);
}

// Namespace archetypeelephant/archetype_elephant
// Params 3, eflags: 0x5 linked
// Checksum 0x8cd84ab8, Offset: 0x8e68
// Size: 0x20
function private function_707d0196(player, mod, shitloc) {
    return true;
}

/#

    // Namespace archetypeelephant/archetype_elephant
    // Params 0, eflags: 0x0
    // Checksum 0x3f13a92e, Offset: 0x8e90
    // Size: 0x178
    function function_6c8289fe() {
        elephants = getaiarchetypearray(#"elephant");
        foreach (elephant in elephants) {
            if (isdefined(elephant.ai.riders)) {
                foreach (rider in elephant.ai.riders) {
                    if (isdefined(rider)) {
                        aiutility::removeaioverridedamagecallback(rider, &function_ee23b15d);
                        rider delete();
                    }
                }
            }
            level thread elephantstartdeath(elephant);
        }
    }

    // Namespace archetypeelephant/archetype_elephant
    // Params 1, eflags: 0x0
    // Checksum 0xe9f61c53, Offset: 0x9010
    // Size: 0x1fc
    function spawn_elephant(phase) {
        player = level.players[0];
        direction = player getplayerangles();
        direction_vec = anglestoforward(direction);
        eye = player geteye();
        direction_vec = (direction_vec[0] * 8000, direction_vec[1] * 8000, direction_vec[2] * 8000);
        trace = bullettrace(eye, eye + direction_vec, 0, undefined);
        elephant = undefined;
        var_947e61ac = getspawnerarray("<dev string:x79>", "<dev string:x96>");
        if (var_947e61ac.size == 0) {
            iprintln("<dev string:xaa>");
            return;
        }
        elephant_spawner = array::random(var_947e61ac);
        elephant = zombie_utility::spawn_zombie(elephant_spawner, undefined, elephant_spawner);
        elephant.ai.phase = phase;
        if (isdefined(elephant)) {
            wait 0.5;
            elephant forceteleport(trace[#"position"], player.angles + (0, 180, 0));
        }
    }

    // Namespace archetypeelephant/archetype_elephant
    // Params 0, eflags: 0x0
    // Checksum 0x5860953b, Offset: 0x9218
    // Size: 0xdae
    function setup_devgui() {
        adddebugcommand("<dev string:xc7>");
        adddebugcommand("<dev string:x135>");
        adddebugcommand("<dev string:x1a2>");
        adddebugcommand("<dev string:x1f8>");
        adddebugcommand("<dev string:x24e>");
        adddebugcommand("<dev string:x2a5>");
        adddebugcommand("<dev string:x2fe>");
        adddebugcommand("<dev string:x347>");
        adddebugcommand("<dev string:x3a0>");
        adddebugcommand("<dev string:x403>");
        adddebugcommand("<dev string:x466>");
        adddebugcommand("<dev string:x4c7>");
        adddebugcommand("<dev string:x528>");
        adddebugcommand("<dev string:x589>");
        adddebugcommand("<dev string:x5ee>");
        adddebugcommand("<dev string:x64b>");
        adddebugcommand("<dev string:x6b0>");
        adddebugcommand("<dev string:x719>");
        adddebugcommand("<dev string:x78b>");
        while (true) {
            setdvar(#"hash_7a7fc216709f1aa4", "<dev string:x4a>");
            wait 0.2;
            cmd = getdvarstring(#"hash_7a7fc216709f1aa4", "<dev string:x4a>");
            if (cmd == "<dev string:x4a>") {
                continue;
            }
            switch (cmd) {
            case #"spawn_phase1":
                level thread spawn_elephant(#"hash_266f53fb994e6120");
                break;
            case #"spawn_phase2":
                level.var_a52a5487 = 1;
                level thread spawn_elephant(#"hash_266f56fb994e6639");
                break;
            case #"kill":
                function_6c8289fe();
                break;
            case #"stage_2":
                elephants = getaiarchetypearray(#"elephant");
                foreach (elephant in elephants) {
                    stage = elephant.ai.var_112ec817;
                    if (stage == #"hash_8e173ae91589439") {
                        elephant function_4d479d22(elephant);
                    }
                }
                break;
            case #"charge_enable":
                elephants = getaiarchetypearray(#"elephant");
                foreach (elephant in elephants) {
                    elephant.ai.var_ea8d826a = 0;
                }
                break;
            case #"charge_disable":
                elephants = getaiarchetypearray(#"elephant");
                foreach (elephant in elephants) {
                    elephant.ai.var_ea8d826a = 1;
                }
                break;
            case #"hide_heart":
                elephants = getaiarchetypearray(#"elephant");
                foreach (elephant in elephants) {
                    elephant hidepart("<dev string:x801>");
                }
                break;
            case #"show_heart":
                elephants = getaiarchetypearray(#"elephant");
                foreach (elephant in elephants) {
                    elephant showpart("<dev string:x801>");
                }
                break;
            case #"hide_head":
                elephants = getaiarchetypearray(#"elephant");
                foreach (elephant in elephants) {
                    elephant hidepart("<dev string:x80f>");
                }
                break;
            case #"show_head":
                elephants = getaiarchetypearray(#"elephant");
                foreach (elephant in elephants) {
                    elephant showpart("<dev string:x80f>");
                }
                break;
            case #"hash_6f54f417f7b5ac51":
                level flag::set(#"hash_37071af70fe7a9f2");
                setdvar(#"hash_3065419bcba97739", 1);
                break;
            case #"hash_484a268dfc6c97aa":
                setdvar(#"zombie_default_max", 0);
                setdvar(#"hash_2b64162aa40fe2bb", 1);
                level flag::set(#"hash_37071af70fe7a9f2");
                setdvar(#"hash_3065419bcba97739", 1);
                break;
            case #"hash_1b7f90925f6498e3":
                elephants = getaiarchetypearray(#"elephant");
                foreach (elephant in elephants) {
                    elephant.var_e15d8b1f = 2;
                }
                break;
            case #"hash_503e90ea2aaf5f30":
                elephants = getaiarchetypearray(#"elephant");
                foreach (elephant in elephants) {
                    elephant.var_e15d8b1f = 1;
                }
                break;
            case #"hash_5e18a71c0cbda56a":
                elephants = getaiarchetypearray(#"elephant");
                foreach (elephant in elephants) {
                    elephant.var_e15d8b1f = 3;
                }
                break;
            case #"hash_28ef2ead2bec713f":
                elephants = getaiarchetypearray(#"elephant");
                foreach (elephant in elephants) {
                    elephant.var_fe41477d = 1;
                    elephant.var_b554dbf2 = 0;
                    elephant.ai.var_ea8d826a = 1;
                }
                break;
            case #"hash_618d48cfd9850a9a":
                elephants = getaiarchetypearray(#"elephant");
                foreach (elephant in elephants) {
                    elephant.var_fe41477d = 0;
                    elephant.var_b554dbf2 = 0;
                    elephant.ai.var_ea8d826a = 0;
                }
                break;
            case #"hash_3659cf300f60df4b":
                elephants = getaiarchetypearray(#"elephant");
                foreach (elephant in elephants) {
                    elephant.var_b554dbf2 = 1;
                    elephant.var_fe41477d = 0;
                    elephant.ai.var_ea8d826a = 1;
                }
                break;
            case #"hash_69cb3828846de716":
                elephants = getaiarchetypearray(#"elephant");
                foreach (elephant in elephants) {
                    elephant.var_b554dbf2 = 0;
                    elephant.var_fe41477d = 0;
                    elephant.ai.var_ea8d826a = 0;
                }
                break;
            default:
                break;
            }
        }
    }

#/
