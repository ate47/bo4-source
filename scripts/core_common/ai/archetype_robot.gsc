// Atian COD Tools GSC decompiler test
#include scripts/core_common/vehicles/raps.gsc;
#include script_4c5c4a64a59247a2;
#include script_35598499769dbb3d;
#include script_41fe08c37d53a635;
#include script_522aeb6ae906391e;
#include script_3aa0f32b70d4f7cb;
#include script_178024232e91b0a1;
#include script_caf007e2a98afa2;
#include script_4bf952f6ba31bb17;
#include script_cf8f48e7ee10aa3;
#include script_59f07c660e6710a5;
#include script_7b7ed6e4bc963a51;
#include scripts/core_common/ai/archetype_utility.gsc;
#include script_3819e7a1427df6d2;
#include script_5c5aa0d5054f56ee;
#include script_489b835a247c990e;
#include script_4a3f9b8905878272;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/spawner_shared.gsc;
#include scripts/core_common/math_shared.gsc;
#include scripts/core_common/laststand_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;
#include scripts/core_common/ai_shared.gsc;

#namespace archetype_robot;

// Namespace archetype_robot/archetype_robot
// Params 0, eflags: 0x2
// Checksum 0xde2ae58e, Offset: 0x1150
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"robot", &__init__, undefined, undefined);
}

// Namespace archetype_robot/archetype_robot
// Params 0, eflags: 0x1 linked
// Checksum 0xffde0bba, Offset: 0x1198
// Size: 0x194
function __init__() {
    spawner::add_archetype_spawn_function(#"robot", &namespace_6d47088::function_a06baa7d);
    spawner::add_archetype_spawn_function(#"robot", &namespace_6d47088::function_125cc705);
    spawner::add_archetype_spawn_function(#"robot", &namespace_8234b281::function_4fca472);
    if (ai::shouldregisterclientfieldforarchetype(#"robot")) {
        clientfield::register("actor", "robot_mind_control", 1, 2, "int");
        clientfield::register("actor", "robot_mind_control_explosion", 1, 1, "int");
        clientfield::register("actor", "robot_lights", 1, 3, "int");
        clientfield::register("actor", "robot_EMP", 1, 1, "int");
    }
    namespace_d0c98af::function_afffda42();
    namespace_6d47088::registerbehaviorscriptfunctions();
}

#namespace namespace_6d47088;

// Namespace namespace_6d47088/archetype_robot
// Params 0, eflags: 0x1 linked
// Checksum 0xa0a55d1f, Offset: 0x1338
// Size: 0x2834
function registerbehaviorscriptfunctions() {
    /#
        assert(!isdefined(&function_84d4e7f0) || isscriptfunctionptr(&function_84d4e7f0));
    #/
    /#
        assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
    #/
    /#
        assert(!isdefined(&function_453ef89f) || isscriptfunctionptr(&function_453ef89f));
    #/
    behaviortreenetworkutility::registerbehaviortreeaction("robotStepIntoAction", &function_84d4e7f0, undefined, &function_453ef89f);
    /#
        assert(!isdefined(&function_764dbfa9) || isscriptfunctionptr(&function_764dbfa9));
    #/
    /#
        assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
    #/
    /#
        assert(!isdefined(&function_1934aa43) || isscriptfunctionptr(&function_1934aa43));
    #/
    behaviortreenetworkutility::registerbehaviortreeaction("robotStepOutAction", &function_764dbfa9, undefined, &function_1934aa43);
    /#
        assert(!isdefined(&function_7613eded) || isscriptfunctionptr(&function_7613eded));
    #/
    /#
        assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
    #/
    /#
        assert(!isdefined(&function_7aecebde) || isscriptfunctionptr(&function_7aecebde));
    #/
    behaviortreenetworkutility::registerbehaviortreeaction("robotTakeOverAction", &function_7613eded, undefined, &function_7aecebde);
    /#
        assert(!isdefined(&function_e28cde3c) || isscriptfunctionptr(&function_e28cde3c));
    #/
    /#
        assert(!isdefined(&function_7eaa8695) || isscriptfunctionptr(&function_7eaa8695));
    #/
    /#
        assert(!isdefined(&function_1d91b5e9) || isscriptfunctionptr(&function_1d91b5e9));
    #/
    behaviortreenetworkutility::registerbehaviortreeaction("robotEmpIdleAction", &function_e28cde3c, &function_7eaa8695, &function_1d91b5e9);
    /#
        assert(isscriptfunctionptr(&function_1a78ffb));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotBecomeCrawler", &function_1a78ffb);
    /#
        assert(isscriptfunctionptr(&function_b301148d));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotDropStartingWeapon", &function_b301148d);
    /#
        assert(isscriptfunctionptr(&function_deb922cc));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotDontTakeCover", &function_deb922cc);
    /#
        assert(isscriptfunctionptr(&function_9cf0b5cd));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotCoverOverInitialize", &function_9cf0b5cd);
    /#
        assert(isscriptfunctionptr(&function_102bc0bc));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotCoverOverTerminate", &function_102bc0bc);
    /#
        assert(isscriptfunctionptr(&function_4b47ea1e));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotExplode", &function_4b47ea1e);
    /#
        assert(isscriptfunctionptr(&function_e9f1941f));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotExplodeTerminate", &function_e9f1941f);
    /#
        assert(isscriptfunctionptr(&function_b473acc1));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotDeployMiniRaps", &function_b473acc1);
    /#
        assert(isscriptfunctionptr(&function_4ddc8241));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotMoveToPlayer", &function_4ddc8241);
    /#
        assert(isscriptfunctionptr(&function_ebb79d85));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotStartSprint", &function_ebb79d85);
    /#
        assert(isscriptfunctionptr(&function_ebb79d85));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal("robotStartSprint", &function_ebb79d85);
    /#
        assert(isscriptfunctionptr(&function_f40b9a8e));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotStartSuperSprint", &function_f40b9a8e);
    /#
        assert(isscriptfunctionptr(&function_5bfddd8f));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotTacticalWalkActionStart", &function_5bfddd8f);
    /#
        assert(isscriptfunctionptr(&function_5bfddd8f));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal("robotTacticalWalkActionStart", &function_5bfddd8f);
    /#
        assert(isscriptfunctionptr(&function_67108896));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotDie", &function_67108896);
    /#
        assert(isscriptfunctionptr(&function_d0df5a2c));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotCleanupChargeMeleeAttack", &function_d0df5a2c);
    /#
        assert(isscriptfunctionptr(&function_d982e8f7));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotIsMoving", &function_d982e8f7);
    /#
        assert(isscriptfunctionptr(&function_e67e6cad));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotAbleToShoot", &function_e67e6cad);
    /#
        assert(isscriptfunctionptr(&function_a0f7ade9));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotCrawlerCanShootEnemy", &function_a0f7ade9);
    /#
        assert(isscriptfunctionptr(&function_f74aa8e4));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("canMoveToEnemy", &function_f74aa8e4);
    /#
        assert(isscriptfunctionptr(&function_78688f24));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("canMoveCloseToEnemy", &function_78688f24);
    /#
        assert(isscriptfunctionptr(&function_3b97d9c0));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("hasMiniRaps", &function_3b97d9c0);
    /#
        assert(isscriptfunctionptr(&function_63309931));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotIsAtCover", &function_63309931);
    /#
        assert(isscriptfunctionptr(&function_2286c90c));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotShouldTacticalWalk", &function_2286c90c);
    /#
        assert(isscriptfunctionptr(&function_adeb3a65));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotHasCloseEnemyToMelee", &function_adeb3a65);
    /#
        assert(isscriptfunctionptr(&function_f423812));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotHasEnemyToMelee", &function_f423812);
    /#
        assert(isscriptfunctionptr(&function_61ab6dfe));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotRogueHasCloseEnemyToMelee", &function_61ab6dfe);
    /#
        assert(isscriptfunctionptr(&function_793382c0));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotRogueHasEnemyToMelee", &function_793382c0);
    /#
        assert(isscriptfunctionptr(&function_9e4b1ae3));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotIsCrawler", &function_9e4b1ae3);
    /#
        assert(isscriptfunctionptr(&function_3bfe7353));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotIsMarching", &function_3bfe7353);
    /#
        assert(isscriptfunctionptr(&function_3e787c7d));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotPrepareForAdjustToCover", &function_3e787c7d);
    /#
        assert(isscriptfunctionptr(&function_7ffe9dd3));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotShouldAdjustToCover", &function_7ffe9dd3);
    /#
        assert(isscriptfunctionptr(&function_b03ab4e3));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotShouldBecomeCrawler", &function_b03ab4e3);
    /#
        assert(isscriptfunctionptr(&function_72b194a6));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotShouldReactAtCover", &function_72b194a6);
    /#
        assert(isscriptfunctionptr(&function_8e69a554));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotShouldExplode", &function_8e69a554);
    /#
        assert(isscriptfunctionptr(&function_6fc4273));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotShouldShutdown", &function_6fc4273);
    /#
        assert(isscriptfunctionptr(&function_dc510f45));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotSupportsOverCover", &function_dc510f45);
    /#
        assert(isscriptfunctionptr(&function_9dbbe8b8));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("shouldStepIn", &function_9dbbe8b8);
    /#
        assert(isscriptfunctionptr(&function_2feeeaea));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("shouldTakeOver", &function_2feeeaea);
    /#
        assert(isscriptfunctionptr(&function_85bba2a8));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("supportsStepOut", &function_85bba2a8);
    /#
        assert(isscriptfunctionptr(&function_a6a1eaac));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("setDesiredStanceToStand", &function_a6a1eaac);
    /#
        assert(isscriptfunctionptr(&function_1430887f));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("setDesiredStanceToCrouch", &function_1430887f);
    /#
        assert(isscriptfunctionptr(&function_16fedd3b));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("toggleDesiredStance", &function_16fedd3b);
    /#
        assert(isscriptfunctionptr(&function_653818a));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotMovement", &function_653818a);
    /#
        assert(isscriptfunctionptr(&function_97afd080));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotDelayMovement", &function_97afd080);
    /#
        assert(isscriptfunctionptr(&function_48725e3));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotInvalidateCover", &function_48725e3);
    /#
        assert(isscriptfunctionptr(&function_3bce76f4));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotShouldChargeMelee", &function_3bce76f4);
    /#
        assert(isscriptfunctionptr(&function_e5ddd4c));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotShouldMelee", &function_e5ddd4c);
    /#
        assert(isscriptfunctionptr(&function_7d3b0dcd));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotScriptRequiresToSprint", &function_7d3b0dcd);
    /#
        assert(isscriptfunctionptr(&function_1f612b7d));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotScanExposedPainTerminate", &function_1f612b7d);
    /#
        assert(isscriptfunctionptr(&function_3029a076));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotTookEmpDamage", &function_3029a076);
    /#
        assert(isscriptfunctionptr(&function_d334168f));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotNoCloseEnemyService", &function_d334168f);
    /#
        assert(isscriptfunctionptr(&function_b6726c16));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotWithinSprintRange", &function_b6726c16);
    /#
        assert(isscriptfunctionptr(&function_a36c381));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotWithinSuperSprintRange", &function_a36c381);
    /#
        assert(isscriptfunctionptr(&function_a36c381));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal("robotWithinSuperSprintRange", &function_a36c381);
    /#
        assert(isscriptfunctionptr(&function_110823db));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotOutsideTacticalWalkRange", &function_110823db);
    /#
        assert(isscriptfunctionptr(&function_d365993c));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotOutsideSprintRange", &function_d365993c);
    /#
        assert(isscriptfunctionptr(&function_19388d04));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotOutsideSuperSprintRange", &function_19388d04);
    /#
        assert(isscriptfunctionptr(&function_19388d04));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal("robotOutsideSuperSprintRange", &function_19388d04);
    /#
        assert(isscriptfunctionptr(&function_51a155cb));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotLightsOff", &function_51a155cb);
    /#
        assert(isscriptfunctionptr(&function_7be2ab6c));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotLightsFlicker", &function_7be2ab6c);
    /#
        assert(isscriptfunctionptr(&function_e1d894e4));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotLightsOn", &function_e1d894e4);
    /#
        assert(isscriptfunctionptr(&function_f10b25b));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotShouldGibDeath", &function_f10b25b);
    /#
        assert(!isdefined(&function_5c654b68) || isscriptfunctionptr(&function_5c654b68));
    #/
    /#
        assert(!isdefined(&function_f598db39) || isscriptfunctionptr(&function_f598db39));
    #/
    /#
        assert(!isdefined(&function_f7416c07) || isscriptfunctionptr(&function_f7416c07));
    #/
    behaviortreenetworkutility::registerbehaviortreeaction("robotProceduralTraversal", &function_5c654b68, &function_f598db39, &function_f7416c07);
    /#
        assert(isscriptfunctionptr(&function_e87b017c));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotCalcProceduralTraversal", &function_e87b017c);
    /#
        assert(isscriptfunctionptr(&function_327fd16d));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotProceduralLanding", &function_327fd16d);
    /#
        assert(isscriptfunctionptr(&function_ba0ed9a4));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotTraverseEnd", &function_ba0ed9a4);
    /#
        assert(isscriptfunctionptr(&function_f7416c07));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotTraverseRagdollOnDeath", &function_f7416c07);
    /#
        assert(isscriptfunctionptr(&function_a4141f70));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotShouldProceduralTraverse", &function_a4141f70);
    /#
        assert(isscriptfunctionptr(&function_b4dc7c43));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotWallrunTraverse", &function_b4dc7c43);
    /#
        assert(isscriptfunctionptr(&function_b4fd0257));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotShouldWallrun", &function_b4fd0257);
    /#
        assert(isscriptfunctionptr(&function_9f5b4111));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotSetupWallRunJump", &function_9f5b4111);
    /#
        assert(isscriptfunctionptr(&function_2e4b9cb5));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotSetupWallRunLand", &function_2e4b9cb5);
    /#
        assert(isscriptfunctionptr(&function_773f22e));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotWallrunStart", &function_773f22e);
    /#
        assert(isscriptfunctionptr(&function_5667c9c5));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotWallrunEnd", &function_5667c9c5);
    /#
        assert(isscriptfunctionptr(&function_fb51b549));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotCanJuke", &function_fb51b549);
    /#
        assert(isscriptfunctionptr(&function_4d1b05c7));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotCanTacticalJuke", &function_4d1b05c7);
    /#
        assert(isscriptfunctionptr(&function_975db3b));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotCanPreemptiveJuke", &function_975db3b);
    /#
        assert(isscriptfunctionptr(&function_b199b248));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotJukeInitialize", &function_b199b248);
    /#
        assert(isscriptfunctionptr(&function_fb916108));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotPreemptiveJukeTerminate", &function_fb916108);
    /#
        assert(isscriptfunctionptr(&function_90e4b252));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotCoverScanInitialize", &function_90e4b252);
    /#
        assert(isscriptfunctionptr(&function_620c174f));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotCoverScanTerminate", &function_620c174f);
    /#
        assert(isscriptfunctionptr(&function_441c44c9));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotIsAtCoverModeScan", &function_441c44c9);
    /#
        assert(isscriptfunctionptr(&function_9c82484c));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotExposedCoverService", &function_9c82484c);
    /#
        assert(isscriptfunctionptr(&function_23205355));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotPositionService", &function_23205355, 1);
    /#
        assert(isscriptfunctionptr(&function_43b65a50));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotTargetService", &function_43b65a50);
    /#
        assert(isscriptfunctionptr(&function_3b3f8f46));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotTryReacquireService", &function_3b3f8f46);
    /#
        assert(isscriptfunctionptr(&function_c4831444));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotRushEnemyService", &function_c4831444);
    /#
        assert(isscriptfunctionptr(&function_5f50f4df));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotRushNeighborService", &function_5f50f4df);
    /#
        assert(isscriptfunctionptr(&function_eb7ac87c));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotCrawlerService", &function_eb7ac87c);
    /#
        assert(isscriptfunctionptr(&function_4ddc8241));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotMoveToPlayerService", &function_4ddc8241);
    animationstatenetwork::registeranimationmocomp("robot_procedural_traversal", &function_7dd77ab, &function_5cb79c51, &function_29ec655a);
    animationstatenetwork::registeranimationmocomp("robot_start_traversal", &function_ccb6c28f, undefined, &function_341ae434);
    animationstatenetwork::registeranimationmocomp("robot_start_wallrun", &function_5e3675db, &function_98d72f6a, &function_77e9eb6e);
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x1 linked
// Checksum 0x3cbb5eda, Offset: 0x3b78
// Size: 0x5c
function function_d0df5a2c(behaviortreeentity) {
    aiutility::meleereleasemutex(behaviortreeentity);
    aiutility::releaseclaimnode(behaviortreeentity);
    behaviortreeentity setblackboardattribute("_melee_enemy_type", undefined);
}

// Namespace namespace_6d47088/archetype_robot
// Params 2, eflags: 0x5 linked
// Checksum 0xaac5530c, Offset: 0x3be0
// Size: 0x58
function private function_51a155cb(entity, asmstatename) {
    entity ai::set_behavior_attribute("robot_lights", 2);
    clientfield::set("robot_EMP", 1);
    return 4;
}

// Namespace namespace_6d47088/archetype_robot
// Params 2, eflags: 0x5 linked
// Checksum 0x8ae4371a, Offset: 0x3c40
// Size: 0x6c
function private function_7be2ab6c(entity, asmstatename) {
    entity ai::set_behavior_attribute("robot_lights", 1);
    clientfield::set("robot_EMP", 1);
    entity notify(#"hash_5dae36d21ff34a97");
    return 4;
}

// Namespace namespace_6d47088/archetype_robot
// Params 2, eflags: 0x5 linked
// Checksum 0xfd1769fa, Offset: 0x3cb8
// Size: 0x50
function private function_e1d894e4(entity, asmstatename) {
    entity ai::set_behavior_attribute("robot_lights", 0);
    clientfield::set("robot_EMP", 0);
    return 4;
}

// Namespace namespace_6d47088/archetype_robot
// Params 2, eflags: 0x5 linked
// Checksum 0x392ea542, Offset: 0x3d10
// Size: 0x1e
function private function_f10b25b(entity, asmstatename) {
    return entity.var_9787f5fe;
}

// Namespace namespace_6d47088/archetype_robot
// Params 2, eflags: 0x5 linked
// Checksum 0xede27242, Offset: 0x3d38
// Size: 0x5c
function private function_e28cde3c(entity, asmstatename) {
    entity.var_4ec2990b = gettime() + entity.var_e86a87ec;
    animationstatenetworkutility::requeststate(entity, asmstatename);
    entity notify(#"hash_7ce9bf69949f7e67");
    return 5;
}

// Namespace namespace_6d47088/archetype_robot
// Params 2, eflags: 0x5 linked
// Checksum 0xc2934a6a, Offset: 0x3da0
// Size: 0x8e
function private function_7eaa8695(entity, asmstatename) {
    if (gettime() < entity.var_4ec2990b || entity ai::get_behavior_attribute("shutdown")) {
        if (entity asmgetstatus() == "asm_status_complete") {
            animationstatenetworkutility::requeststate(entity, asmstatename);
        }
        return 5;
    }
    return 4;
}

// Namespace namespace_6d47088/archetype_robot
// Params 2, eflags: 0x5 linked
// Checksum 0x2a1dd90d, Offset: 0x3e38
// Size: 0x2c
function private function_1d91b5e9(entity, asmstatename) {
    entity notify(#"hash_5323466e2fb373e2");
    return 4;
}

// Namespace namespace_6d47088/archetype_robot
// Params 2, eflags: 0x5 linked
// Checksum 0xdd9656bd, Offset: 0x3e70
// Size: 0xd8
function private function_f598db39(entity, asmstatename) {
    /#
        assert(isdefined(entity.traversal));
    #/
    traversal = entity.traversal;
    t = min((gettime() - traversal.starttime) / traversal.totaltime, 1);
    var_89203ebe = traversal.var_e8277b62 * (1 - t);
    if (var_89203ebe < traversal.var_3262b376) {
        traversal.landing = 1;
        return 4;
    }
    return 5;
}

// Namespace namespace_6d47088/archetype_robot
// Params 2, eflags: 0x5 linked
// Checksum 0x3e9742c4, Offset: 0x3f50
// Size: 0x40
function private function_327fd16d(entity, asmstatename) {
    if (isdefined(entity.traversal)) {
        entity finishtraversal();
    }
    return 5;
}

// Namespace namespace_6d47088/archetype_robot
// Params 2, eflags: 0x5 linked
// Checksum 0x952815ea, Offset: 0x3f98
// Size: 0xa32
function private function_e87b017c(entity, asmstatename) {
    if (!isdefined(entity.traversestartnode) || !isdefined(entity.traverseendnode)) {
        return 1;
    }
    entity.traversal = spawnstruct();
    traversal = entity.traversal;
    traversal.var_3262b376 = 24;
    traversal.var_7e2e4ccf = 18;
    traversal.startnode = entity.traversestartnode;
    traversal.endnode = entity.traverseendnode;
    var_4e6c2ab3 = traversal.startnode.spawnflags & 2048;
    var_1ea4afef = traversal.endnode.spawnflags & 2048;
    traversal.var_9c223984 = entity.origin;
    traversal.var_9c00d14f = traversal.endnode.origin;
    if (var_1ea4afef) {
        var_8842db4c = getnavmeshfacenormal(traversal.var_9c00d14f, 30);
        traversal.var_9c00d14f = traversal.var_9c00d14f + var_8842db4c * 30 / 2;
    }
    if (!isdefined(traversal.var_9c00d14f)) {
        traversal.var_9c00d14f = traversal.endnode.origin;
    }
    traversal.var_5cb4ecd4 = distance(traversal.var_9c223984, traversal.var_9c00d14f);
    traversal.var_b4a9f059 = abs(traversal.var_9c223984[2] - traversal.var_9c00d14f[2]);
    traversal.var_42a74869 = distance2d(traversal.var_9c223984, traversal.var_9c00d14f);
    var_406671a8 = 0;
    if (traversal.var_42a74869 > 200) {
        var_406671a8 = 16;
    } else if (traversal.var_42a74869 > 120) {
        var_406671a8 = 8;
    } else if (traversal.var_42a74869 > 80 || traversal.var_b4a9f059 > 80) {
        var_406671a8 = 4;
    }
    if (isdefined(entity.var_9bbdfc8)) {
        var_406671a8 = entity [[ entity.var_9bbdfc8 ]]();
    }
    traversal.var_c6cdbf05 = (traversal.var_7e2e4ccf + var_406671a8) * 12;
    heightoffset = max(traversal.var_b4a9f059 * 0.8, min(traversal.var_42a74869, 96));
    traversal.var_89d414e8 = entity.origin + (0, 0, heightoffset);
    traversal.var_b23afdc3 = traversal.var_9c00d14f + (0, 0, heightoffset);
    if (traversal.var_9c223984[2] < traversal.var_9c00d14f[2]) {
        traversal.var_89d414e8 = traversal.var_89d414e8 + (0, 0, traversal.var_b4a9f059);
    } else {
        traversal.var_b23afdc3 = traversal.var_b23afdc3 + (0, 0, traversal.var_b4a9f059);
    }
    if (var_4e6c2ab3 || var_1ea4afef) {
        startdirection = function_3b3f438d();
        enddirection = function_42577e26();
        if (startdirection == "out") {
            var_1cab30df = 0.5;
            var_bee69af = (traversal.endnode.origin - entity.origin) * var_1cab30df;
            traversal.var_89d414e8 = entity.origin + (var_bee69af[0], var_bee69af[1], 0);
            traversal.var_b23afdc3 = traversal.var_9c00d14f + (0, 0, traversal.var_b4a9f059 * var_1cab30df);
            traversal.angles = entity.angles;
        }
        if (enddirection == "in") {
            var_1cab30df = 0.5;
            var_5da346ef = (entity.origin - traversal.endnode.origin) * var_1cab30df;
            traversal.var_89d414e8 = entity.origin + (0, 0, traversal.var_b4a9f059 * var_1cab30df);
            traversal.var_b23afdc3 = traversal.endnode.origin + (var_5da346ef[0], var_5da346ef[1], 0);
            var_8842db4c = getnavmeshfacenormal(traversal.endnode.origin, 30);
            direction = function_bf3c4658(traversal.startnode.origin, traversal.endnode.origin);
            movedirection = vectorcross(var_8842db4c, (0, 0, 1));
            if (direction == "right") {
                movedirection = movedirection * -1;
            }
            traversal.angles = vectortoangles(movedirection);
        }
        if (var_1ea4afef) {
            traversal.var_3262b376 = 110;
        } else {
            traversal.var_3262b376 = 60;
        }
        traversal.var_c6cdbf05 = traversal.var_c6cdbf05 * 1.2;
    }
    /#
        recordline(traversal.var_9c223984, traversal.var_89d414e8, (1, 0.5, 0), "robotScriptRequiresToSprint", entity);
        recordline(traversal.var_9c223984, traversal.var_9c00d14f, (1, 0.5, 0), "robotScriptRequiresToSprint", entity);
        recordline(traversal.var_9c00d14f, traversal.var_b23afdc3, (1, 0.5, 0), "robotScriptRequiresToSprint", entity);
        recordline(traversal.var_89d414e8, traversal.var_b23afdc3, (1, 0.5, 0), "robotScriptRequiresToSprint", entity);
        record3dtext(traversal.var_42a74869, traversal.var_9c00d14f + vectorscale((0, 0, 1), 12), (1, 0.5, 0), "robotScriptRequiresToSprint", entity);
    #/
    segments = 10;
    var_94a89b98 = traversal.var_9c223984;
    traversal.var_e8277b62 = 0;
    for (index = 1; index <= segments; index++) {
        t = index / segments;
        nextpoint = function_fd914ff5(t, traversal.var_9c223984, traversal.var_89d414e8, traversal.var_b23afdc3, traversal.var_9c00d14f);
        /#
            recordline(var_94a89b98, nextpoint, (0, 1, 0), "robotScriptRequiresToSprint", entity);
        #/
        traversal.var_e8277b62 = traversal.var_e8277b62 + distance(var_94a89b98, nextpoint);
        var_94a89b98 = nextpoint;
    }
    traversal.starttime = gettime();
    traversal.endtime = traversal.starttime + traversal.var_e8277b62 * 1000 / traversal.var_c6cdbf05;
    traversal.totaltime = traversal.endtime - traversal.starttime;
    traversal.landing = 0;
    return 1;
}

// Namespace namespace_6d47088/archetype_robot
// Params 2, eflags: 0x5 linked
// Checksum 0x286e37eb, Offset: 0x49d8
// Size: 0xc0
function private function_5c654b68(entity, asmstatename) {
    entity.skipdeath = 1;
    traversal = entity.traversal;
    traversal.starttime = gettime();
    traversal.endtime = traversal.starttime + traversal.var_e8277b62 * 1000 / traversal.var_c6cdbf05;
    traversal.totaltime = traversal.endtime - traversal.starttime;
    animationstatenetworkutility::requeststate(entity, asmstatename);
    return 5;
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x45fcd49d, Offset: 0x4aa0
// Size: 0x54
function private function_ba0ed9a4(entity) {
    function_f7416c07(entity);
    entity.skipdeath = 0;
    entity.traversal = undefined;
    entity notify(#"hash_255dc2e132c1a7e1");
    return 4;
}

// Namespace namespace_6d47088/archetype_robot
// Params 2, eflags: 0x5 linked
// Checksum 0xd28f43fb, Offset: 0x4b00
// Size: 0x48
function private function_f7416c07(entity, asmstatename) {
    if (!isalive(entity)) {
        entity startragdoll();
    }
    return 4;
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xdd12d4b3, Offset: 0x4b50
// Size: 0xa6
function private function_a4141f70(entity) {
    if (isdefined(entity.traversestartnode) && isdefined(entity.traverseendnode)) {
        var_47048a0b = entity ai::get_behavior_attribute("traversals") == "procedural" || entity.traversestartnode.spawnflags & 1024 || entity.traverseendnode.spawnflags & 1024;
        return var_47048a0b;
    }
    return 0;
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xb234ce49, Offset: 0x4c00
// Size: 0xb2
function private function_b4dc7c43(entity) {
    startnode = entity.traversestartnode;
    endnode = entity.traverseendnode;
    if (isdefined(startnode) && isdefined(endnode) && entity shouldstarttraversal()) {
        var_4e6c2ab3 = startnode.spawnflags & 2048;
        var_1ea4afef = endnode.spawnflags & 2048;
        return (var_4e6c2ab3 || var_1ea4afef);
    }
    return 0;
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x91ee5ce1, Offset: 0x4cc0
// Size: 0x34
function private function_b4fd0257(entity) {
    return entity getblackboardattribute("_robot_traversal_type") == "wall";
}

// Namespace namespace_6d47088/archetype_robot
// Params 5, eflags: 0x5 linked
// Checksum 0xf5c84830, Offset: 0x4d00
// Size: 0xcc
function private function_5e3675db(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    entity setrepairpaths(0);
    entity orientmode("face angle", entity.angles[1]);
    entity.blockingpain = 1;
    entity.clamptonavmesh = 0;
    entity animmode("normal_nogravity", 0);
    entity setavoidancemask("avoid none");
}

// Namespace namespace_6d47088/archetype_robot
// Params 5, eflags: 0x5 linked
// Checksum 0x6d08c52b, Offset: 0x4dd8
// Size: 0x1e4
function private function_98d72f6a(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    var_8842db4c = getnavmeshfacenormal(entity.origin, 30);
    var_1b083ba = getclosestpointonnavmesh(entity.origin, 30, 0);
    direction = entity getblackboardattribute("_robot_wallrun_direction");
    if (isdefined(var_8842db4c) && isdefined(var_1b083ba)) {
        var_8842db4c = (var_8842db4c[0], var_8842db4c[1], 0);
        var_8842db4c = vectornormalize(var_8842db4c);
        movedirection = vectorcross(var_8842db4c, (0, 0, 1));
        if (direction == "right") {
            movedirection = movedirection * -1;
        }
        var_17adf632 = getclosestpointonnavmesh(var_1b083ba + movedirection * 12, 30, 0);
        var_9fb8e100 = vectortoangles(var_17adf632 - var_1b083ba);
        /#
            recordline(var_1b083ba, var_17adf632, (1, 0, 0), "robotScriptRequiresToSprint", entity);
        #/
        entity orientmode("face angle", var_9fb8e100[1]);
    }
}

// Namespace namespace_6d47088/archetype_robot
// Params 5, eflags: 0x5 linked
// Checksum 0xd0728d53, Offset: 0x4fc8
// Size: 0x82
function private function_77e9eb6e(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    entity setrepairpaths(1);
    entity setavoidancemask("avoid all");
    entity.blockingpain = 0;
    entity.clamptonavmesh = 1;
}

// Namespace namespace_6d47088/archetype_robot
// Params 5, eflags: 0x5 linked
// Checksum 0xdc0d55cf, Offset: 0x5058
// Size: 0xd2
function private function_fd914ff5(t, p1, p2, var_cf9132fc, var_ba940902) {
    return pow(1 - t, 3) * p1 + 3 * pow(1 - t, 2) * t * p2 + 3 * (1 - t) * pow(t, 2) * var_cf9132fc + pow(t, 3) * var_ba940902;
}

// Namespace namespace_6d47088/archetype_robot
// Params 5, eflags: 0x5 linked
// Checksum 0xfb41e3ff, Offset: 0x5138
// Size: 0x364
function private function_ccb6c28f(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    startnode = entity.traversestartnode;
    var_4e6c2ab3 = startnode.spawnflags & 2048;
    endnode = entity.traverseendnode;
    var_1ea4afef = endnode.spawnflags & 2048;
    if (!var_1ea4afef) {
        var_2449da55 = vectortoangles(entity.traverseendnode.origin - entity.traversestartnode.origin);
        entity orientmode("face angle", var_2449da55[1]);
        if (var_4e6c2ab3) {
            entity animmode("normal_nogravity", 0);
        } else {
            entity animmode("gravity", 0);
        }
    } else {
        var_8842db4c = getnavmeshfacenormal(endnode.origin, 30);
        direction = function_bf3c4658(startnode.origin, endnode.origin);
        movedirection = vectorcross(var_8842db4c, (0, 0, 1));
        if (direction == "right") {
            movedirection = movedirection * -1;
        }
        /#
            recordline(endnode.origin, endnode.origin + var_8842db4c * 20, (1, 0, 0), "robotScriptRequiresToSprint", entity);
        #/
        /#
            recordline(endnode.origin, endnode.origin + movedirection * 20, (1, 0, 0), "robotScriptRequiresToSprint", entity);
        #/
        angles = vectortoangles(movedirection);
        entity orientmode("face angle", angles[1]);
        if (var_4e6c2ab3) {
            entity animmode("normal_nogravity", 0);
        } else {
            entity animmode("gravity", 0);
        }
    }
    entity setrepairpaths(0);
    entity.blockingpain = 1;
    entity.clamptonavmesh = 0;
    entity pathmode("dont move");
}

// Namespace namespace_6d47088/archetype_robot
// Params 5, eflags: 0x5 linked
// Checksum 0x3a11f1fd, Offset: 0x54a8
// Size: 0x2c
function private function_341ae434(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    
}

// Namespace namespace_6d47088/archetype_robot
// Params 5, eflags: 0x5 linked
// Checksum 0x77551167, Offset: 0x54e0
// Size: 0x114
function private function_7dd77ab(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    traversal = entity.traversal;
    entity setavoidancemask("avoid none");
    entity orientmode("face angle", entity.angles[1]);
    entity setrepairpaths(0);
    entity animmode("noclip", 0);
    entity.blockingpain = 1;
    entity.clamptonavmesh = 0;
    if (isdefined(traversal) && traversal.landing) {
        entity animmode("angle deltas", 0);
    }
}

// Namespace namespace_6d47088/archetype_robot
// Params 5, eflags: 0x5 linked
// Checksum 0xdff6258, Offset: 0x5600
// Size: 0x224
function private function_5cb79c51(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    traversal = entity.traversal;
    if (isdefined(traversal)) {
        if (entity ispaused()) {
            traversal.starttime = traversal.starttime + int(float(function_60d95f53()) / 1000 * 1000);
            return;
        }
        var_1ea4afef = traversal.endnode.spawnflags & 2048;
        var_1b6c09db = (gettime() - traversal.starttime) / traversal.totaltime;
        t = min(var_1b6c09db, 1);
        if (t < 1 || var_1b6c09db == 1 || !var_1ea4afef) {
            var_63162175 = function_fd914ff5(t, traversal.var_9c223984, traversal.var_89d414e8, traversal.var_b23afdc3, traversal.var_9c00d14f);
            angles = entity.angles;
            if (isdefined(traversal.angles)) {
                angles = traversal.angles;
            }
            entity forceteleport(var_63162175, angles, 0);
        } else {
            entity animmode("normal_nogravity", 0);
        }
    }
}

// Namespace namespace_6d47088/archetype_robot
// Params 5, eflags: 0x5 linked
// Checksum 0xad764e87, Offset: 0x5830
// Size: 0x104
function private function_29ec655a(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    traversal = entity.traversal;
    if (isdefined(traversal) && gettime() >= traversal.endtime) {
        var_1ea4afef = traversal.endnode.spawnflags & 2048;
        if (!var_1ea4afef) {
            entity pathmode("move allowed");
        }
    }
    entity.clamptonavmesh = 1;
    entity.blockingpain = 0;
    entity setrepairpaths(1);
    entity setavoidancemask("avoid all");
}

// Namespace namespace_6d47088/archetype_robot
// Params 2, eflags: 0x5 linked
// Checksum 0x814edad0, Offset: 0x5940
// Size: 0x166
function private function_bf3c4658(startposition, endposition) {
    entity = self;
    var_8842db4c = getnavmeshfacenormal(endposition, 30);
    /#
        recordline(startposition, endposition, (1, 0.5, 0), "robotScriptRequiresToSprint", entity);
    #/
    if (isdefined(var_8842db4c)) {
        /#
            recordline(endposition, endposition + var_8842db4c * 12, (1, 0.5, 0), "robotScriptRequiresToSprint", entity);
        #/
        angles = vectortoangles(var_8842db4c);
        right = anglestoright(angles);
        d = vectordot(right, endposition) * -1;
        if (vectordot(right, startposition) + d > 0) {
            return "right";
        }
        return "left";
    }
    return "unknown";
}

// Namespace namespace_6d47088/archetype_robot
// Params 0, eflags: 0x5 linked
// Checksum 0x3ff99e37, Offset: 0x5ab0
// Size: 0x62
function private function_773f22e() {
    entity = self;
    entity.skipdeath = 1;
    entity collidewithactors(0);
    entity pushplayer(1);
    entity.pushable = 0;
}

// Namespace namespace_6d47088/archetype_robot
// Params 0, eflags: 0x5 linked
// Checksum 0x344febae, Offset: 0x5b20
// Size: 0x72
function private function_5667c9c5() {
    entity = self;
    function_f7416c07(entity);
    entity.skipdeath = 0;
    entity collidewithactors(1);
    entity pushplayer(0);
    entity.pushable = 1;
}

// Namespace namespace_6d47088/archetype_robot
// Params 0, eflags: 0x5 linked
// Checksum 0x3e2fbd05, Offset: 0x5ba0
// Size: 0x1f8
function private function_9f5b4111() {
    entity = self;
    startnode = entity.traversestartnode;
    endnode = entity.traverseendnode;
    direction = "unknown";
    var_1db5a3ee = "unknown";
    traversaltype = "unknown";
    if (isdefined(startnode) && isdefined(endnode)) {
        var_4e6c2ab3 = startnode.spawnflags & 2048;
        var_1ea4afef = endnode.spawnflags & 2048;
        if (var_1ea4afef) {
            direction = function_bf3c4658(startnode.origin, endnode.origin);
        } else {
            direction = function_bf3c4658(endnode.origin, startnode.origin);
            if (direction == "right") {
                direction = "left";
            } else {
                direction = "right";
            }
        }
        var_1db5a3ee = function_3b3f438d();
        traversaltype = function_4eae3200(startnode);
    }
    entity setblackboardattribute("_robot_jump_direction", var_1db5a3ee);
    entity setblackboardattribute("_robot_wallrun_direction", direction);
    entity setblackboardattribute("_robot_traversal_type", traversaltype);
    function_e87b017c(entity, undefined);
    return 5;
}

// Namespace namespace_6d47088/archetype_robot
// Params 0, eflags: 0x5 linked
// Checksum 0xb129368f, Offset: 0x5da0
// Size: 0xe8
function private function_2e4b9cb5() {
    entity = self;
    startnode = entity.traversestartnode;
    endnode = entity.traverseendnode;
    var_5c59a9f5 = "unknown";
    traversaltype = "unknown";
    if (isdefined(startnode) && isdefined(endnode)) {
        var_5c59a9f5 = function_42577e26();
        traversaltype = function_4eae3200(endnode);
    }
    entity setblackboardattribute("_robot_jump_direction", var_5c59a9f5);
    entity setblackboardattribute("_robot_traversal_type", traversaltype);
    return 5;
}

// Namespace namespace_6d47088/archetype_robot
// Params 0, eflags: 0x5 linked
// Checksum 0x46cc8c0d, Offset: 0x5e90
// Size: 0x11a
function private function_3b3f438d() {
    entity = self;
    startnode = entity.traversestartnode;
    endnode = entity.traverseendnode;
    if (isdefined(startnode) && isdefined(endnode)) {
        var_4e6c2ab3 = startnode.spawnflags & 2048;
        var_1ea4afef = endnode.spawnflags & 2048;
        if (var_4e6c2ab3) {
            var_42a74869 = distance2d(startnode.origin, endnode.origin);
            if (startnode.origin[2] - endnode.origin[2] > 48 && var_42a74869 < 250) {
                return "out";
            }
        }
        return "up";
    }
    return "unknown";
}

// Namespace namespace_6d47088/archetype_robot
// Params 0, eflags: 0x5 linked
// Checksum 0xa460fce1, Offset: 0x5fb8
// Size: 0x11a
function private function_42577e26() {
    entity = self;
    startnode = entity.traversestartnode;
    endnode = entity.traverseendnode;
    if (isdefined(startnode) && isdefined(endnode)) {
        var_4e6c2ab3 = startnode.spawnflags & 2048;
        var_1ea4afef = endnode.spawnflags & 2048;
        if (var_1ea4afef) {
            var_42a74869 = distance2d(startnode.origin, endnode.origin);
            if (endnode.origin[2] - startnode.origin[2] > 48 && var_42a74869 < 250) {
                return "in";
            }
        }
        return "down";
    }
    return "unknown";
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x216d53e6, Offset: 0x60e0
// Size: 0x3e
function private function_4eae3200(node) {
    if (isdefined(node)) {
        if (node.spawnflags & 2048) {
            return "wall";
        }
        return "ground";
    }
    return "unknown";
}

// Namespace namespace_6d47088/archetype_robot
// Params 0, eflags: 0x5 linked
// Checksum 0x24d947ac, Offset: 0x6128
// Size: 0xbc
function private function_a06baa7d() {
    entity = self;
    blackboard::createblackboardforentity(entity);
    ai::createinterfaceforentity(entity);
    entity setblackboardattribute("_locomotion_speed", "locomotion_speed_sprint");
    entity.___archetypeonanimscriptedcallback = &function_c48b3a0a;
    if (self.accuratefire) {
        self thread aiutility::preshootlaserandglinton(self);
        self thread aiutility::postshootlaserandglintoff(self);
    }
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x4045377c, Offset: 0x61f0
// Size: 0x10a
function private function_a0f7ade9(entity) {
    if (!isdefined(entity.enemy)) {
        return 0;
    }
    var_18dca302 = entity getaimlimitsfromentry("robot_crawler");
    yawtoenemy = angleclamp180(vectortoangles(entity lastknownpos(entity.enemy) - entity.origin)[1] - entity.angles[1]);
    var_94a62b15 = 10;
    return yawtoenemy <= var_18dca302[#"aim_left"] + var_94a62b15 && yawtoenemy >= var_18dca302[#"aim_right"] + var_94a62b15;
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x6c623001, Offset: 0x6308
// Size: 0x2c
function private function_c48b3a0a(entity) {
    entity.__blackboard = undefined;
    entity function_a06baa7d();
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x6a33851a, Offset: 0x6340
// Size: 0x34
function private function_48725e3(entity) {
    entity.steppedoutofcover = 0;
    entity pathmode("move allowed");
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x2d72d45e, Offset: 0x6380
// Size: 0x44
function private function_97afd080(entity) {
    entity pathmode("move delayed", 0, randomfloatrange(1, 2));
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x816270d7, Offset: 0x63d0
// Size: 0x5c
function private function_653818a(entity) {
    if (entity getblackboardattribute("_stance") != "stand") {
        entity setblackboardattribute("_desired_stance", "stand");
    }
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xd0687779, Offset: 0x6438
// Size: 0xca
function private function_90e4b252(entity) {
    entity setblackboardattribute("_cover_mode", "cover_scan");
    entity setblackboardattribute("_desired_stance", "stand");
    entity setblackboardattribute("_robot_step_in", "slow");
    aiutility::keepclaimnode(entity);
    aiutility::choosecoverdirection(entity, 1);
    entity.var_89de610b = entity.node;
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x1fd7eccd, Offset: 0x6510
// Size: 0x94
function private function_620c174f(entity) {
    aiutility::cleanupcovermode(entity);
    entity.steppedoutofcover = 1;
    entity.var_ca9f1456 = gettime() - int(8 * 1000);
    aiutility::releaseclaimnode(entity);
    entity pathmode("dont move");
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x1 linked
// Checksum 0x63d7c01a, Offset: 0x65b0
// Size: 0x144
function function_fb51b549(entity) {
    if (!entity ai::get_behavior_attribute("phalanx") && !(isdefined(entity.steppedoutofcover) && entity.steppedoutofcover) && aiutility::canjuke(entity)) {
        jukeevents = blackboard::getblackboardevents("actor_juke");
        tooclosejukedistancesqr = 57600;
        foreach (event in jukeevents) {
            if (distance2dsquared(entity.origin, event.data.origin) <= tooclosejukedistancesqr) {
                return 0;
            }
        }
        return 1;
    }
    return 0;
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x1 linked
// Checksum 0x309e1399, Offset: 0x6700
// Size: 0x88
function function_4d1b05c7(entity) {
    if (entity haspath() && aiutility::bb_getlocomotionfaceenemyquadrant() == "locomotion_face_enemy_front") {
        var_309c0b7a = aiutility::calculatejukedirection(entity, 50, entity.jukedistance);
        return (var_309c0b7a != "forward");
    }
    return 0;
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x1 linked
// Checksum 0x8c0f532e, Offset: 0x6790
// Size: 0x38e
function function_975db3b(entity) {
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
    jukemaxdistance = 600;
    if (isweapon(entity.enemy.currentweapon) && isdefined(entity.enemy.currentweapon.enemycrosshairrange) && entity.enemy.currentweapon.enemycrosshairrange > 0) {
        jukemaxdistance = entity.enemy.currentweapon.enemycrosshairrange;
        if (jukemaxdistance > 1200) {
            jukemaxdistance = 1200;
        }
    }
    if (distancesquared(entity.origin, entity.enemy.origin) < jukemaxdistance * jukemaxdistance) {
        angledifference = absangleclamp180(entity.angles[1] - entity.enemy.angles[1]);
        /#
            record3dtext(angledifference, entity.origin + vectorscale((0, 0, 1), 5), (0, 1, 0), "robotScriptRequiresToSprint");
        #/
        if (angledifference > 135) {
            enemyangles = entity.enemy getgunangles();
            toenemy = entity.enemy.origin - entity.origin;
            forward = anglestoforward(enemyangles);
            dotproduct = abs(vectordot(vectornormalize(toenemy), forward));
            /#
                record3dtext(acos(dotproduct), entity.origin + vectorscale((0, 0, 1), 10), (0, 1, 0), "robotScriptRequiresToSprint");
            #/
            if (dotproduct > 0.9848) {
                return function_fb51b549(entity);
            }
        }
    }
    return 0;
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x1 linked
// Checksum 0x7581158c, Offset: 0x6b28
// Size: 0x44
function function_441c44c9(entity) {
    covermode = entity getblackboardattribute("_cover_mode");
    return covermode == "cover_scan";
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xa748cc58, Offset: 0x6b78
// Size: 0x4c
function private function_3e787c7d(entity) {
    aiutility::keepclaimnode(entity);
    entity setblackboardattribute("_desired_stance", "crouch");
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x38025186, Offset: 0x6bd0
// Size: 0x60
function private function_eb7ac87c(entity) {
    if (isdefined(entity.var_c2939d27) && entity.var_c2939d27 <= gettime() && entity.health > 0) {
        entity kill();
    }
    return 1;
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x1 linked
// Checksum 0x96925d20, Offset: 0x6c38
// Size: 0x16
function function_9e4b1ae3(entity) {
    return entity.var_dd830224;
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x6ce69e07, Offset: 0x6c58
// Size: 0xf0
function private function_1a78ffb(entity) {
    if (!entity ai::get_behavior_attribute("can_become_crawler")) {
        return;
    }
    entity.var_dd830224 = 1;
    entity.becomecrawler = 0;
    entity allowpitchangle(1);
    entity setpitchorient();
    entity.var_c2939d27 = gettime() + randomintrange(10000, 20000);
    function_6eac4ca1(entity, "rbCrawler");
    entity notify(#"bhtn_action_notify", {#action:"rbCrawler"});
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x1 linked
// Checksum 0xe46099a1, Offset: 0x6d50
// Size: 0x16
function function_b03ab4e3(entity) {
    return entity.becomecrawler;
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x1fee3195, Offset: 0x6d70
// Size: 0x34
function private function_3bfe7353(entity) {
    return entity getblackboardattribute("_move_mode") == "marching";
}

// Namespace namespace_6d47088/archetype_robot
// Params 0, eflags: 0x4
// Checksum 0xcebcb818, Offset: 0x6db0
// Size: 0xd6
function private function_d9c314d0() {
    entity = self;
    if (function_4bf0cd1c() == "mind_controlled") {
        switch (ai::getaiattribute(entity, "rogue_control_speed")) {
        case #"walk":
            return "locomotion_speed_walk";
        case #"run":
            return "locomotion_speed_run";
        case #"sprint":
            return "locomotion_speed_sprint";
            break;
        }
    } else if (ai::getaiattribute(entity, "sprint")) {
        return "locomotion_speed_sprint";
    }
    return "locomotion_speed_walk";
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xe16f9e7f, Offset: 0x6e90
// Size: 0x8c
function private function_9cf0b5cd(behaviortreeentity) {
    aiutility::setcovershootstarttime(behaviortreeentity);
    aiutility::keepclaimnode(behaviortreeentity);
    behaviortreeentity setblackboardattribute("_desired_stance", "stand");
    behaviortreeentity setblackboardattribute("_cover_mode", "cover_over");
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x57866c52, Offset: 0x6f28
// Size: 0x3c
function private function_102bc0bc(behaviortreeentity) {
    aiutility::cleanupcovermode(behaviortreeentity);
    aiutility::clearcovershootstarttime(behaviortreeentity);
}

// Namespace namespace_6d47088/archetype_robot
// Params 0, eflags: 0x5 linked
// Checksum 0xfe158e13, Offset: 0x6f70
// Size: 0x36
function private function_4bf0cd1c() {
    entity = self;
    if (entity.controllevel > 1) {
        return "mind_controlled";
    }
    return "normal";
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x87ef0b0e, Offset: 0x6fb0
// Size: 0x32
function private function_deb922cc(entity) {
    entity.combatmode = "no_cover";
    entity.var_29e1776a = gettime() + 4000;
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xb26ff96a, Offset: 0x6ff0
// Size: 0xb0
function private _isvalidplayer(player) {
    if (!isdefined(player) || !isalive(player) || !isplayer(player) || player.sessionstate == "spectator" || player.sessionstate == "intermission" || player laststand::player_is_in_laststand() || player.ignoreme) {
        return 0;
    }
    return 1;
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x72a86aff, Offset: 0x70a8
// Size: 0xec
function private function_c4831444(entity) {
    if (!isdefined(entity.enemy)) {
        return 0;
    }
    var_6373175b = distance2dsquared(entity.origin, entity.enemy.origin);
    if (var_6373175b >= 360000 && var_6373175b <= 1440000) {
        var_ae0df311 = entity findpath(entity.origin, entity.enemy.origin, 1, 0);
        if (var_ae0df311) {
            entity ai::set_behavior_attribute("move_mode", "rusher");
        }
    }
}

// Namespace namespace_6d47088/archetype_robot
// Params 2, eflags: 0x5 linked
// Checksum 0x56368810, Offset: 0x71a0
// Size: 0x186
function private function_795d206b(entity, var_95f1103c) {
    return isdefined(var_95f1103c) && isdefined(var_95f1103c.archetype) && var_95f1103c.archetype == "robot" && isdefined(var_95f1103c.team) && entity.team == var_95f1103c.team && entity != var_95f1103c && isdefined(var_95f1103c.enemy) && var_95f1103c ai::get_behavior_attribute("move_mode") == "normal" && !var_95f1103c ai::get_behavior_attribute("phalanx") && var_95f1103c ai::get_behavior_attribute("rogue_control") == "level_0" && distancesquared(entity.origin, var_95f1103c.origin) < 160000 && distancesquared(var_95f1103c.origin, var_95f1103c.enemy.origin) < 1440000;
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xdc1ef19, Offset: 0x7330
// Size: 0x18c
function private function_5f50f4df(entity) {
    actors = getaiarray();
    closestenemy = undefined;
    var_da080c65 = undefined;
    foreach (ai in actors) {
        if (function_795d206b(entity, ai)) {
            enemydistance = distancesquared(entity.origin, ai.origin);
            if (!isdefined(var_da080c65) || enemydistance < var_da080c65) {
                var_da080c65 = enemydistance;
                closestenemy = ai;
            }
        }
    }
    if (isdefined(closestenemy)) {
        var_ae0df311 = entity findpath(closestenemy.origin, closestenemy.enemy.origin, 1, 0);
        if (var_ae0df311) {
            closestenemy ai::set_behavior_attribute("move_mode", "rusher");
        }
    }
}

// Namespace namespace_6d47088/archetype_robot
// Params 2, eflags: 0x5 linked
// Checksum 0x5539ab36, Offset: 0x74c8
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

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x42f05ec0, Offset: 0x75f8
// Size: 0x55e
function private function_43b65a50(entity) {
    if (function_e67e6cad(entity)) {
        return 0;
    }
    if (isdefined(entity.ignoreall) && entity.ignoreall) {
        return 0;
    }
    if (isdefined(entity.var_8fc4b3ed) && entity.var_8fc4b3ed > gettime() && isalive(entity.favoriteenemy)) {
        return 0;
    }
    positiononnavmesh = getclosestpointonnavmesh(entity.origin, 200);
    if (!isdefined(positiononnavmesh)) {
        return;
    }
    if (isdefined(entity.favoriteenemy) && isdefined(entity.favoriteenemy.var_38147e4b) && entity.favoriteenemy.var_38147e4b == entity) {
        entity.favoriteenemy.var_38147e4b = undefined;
    }
    aienemies = [];
    playerenemies = [];
    ai = getaiarray();
    players = getplayers();
    foreach (index, value in ai) {
        if (issentient(value) && entity getignoreent(value)) {
            continue;
        }
        if (value.team != entity.team && isactor(value) && !isdefined(entity.favoriteenemy)) {
            enemypositiononnavmesh = getclosestpointonnavmesh(value.origin, 200, 30);
            if (isdefined(enemypositiononnavmesh) && entity findpath(positiononnavmesh, enemypositiononnavmesh, 1, 0)) {
                aienemies[aienemies.size] = value;
            }
        }
    }
    foreach (value in players) {
        if (_isvalidplayer(value) && value.team != entity.team) {
            if (issentient(value) && entity getignoreent(value)) {
                continue;
            }
            enemypositiononnavmesh = getclosestpointonnavmesh(value.origin, 200, 30);
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
        entity.favoriteenemy.var_38147e4b = entity;
    } else if (closestai.distancesquared < closestplayer.distancesquared) {
        entity.favoriteenemy = closestai.entity;
        entity.favoriteenemy.var_38147e4b = entity;
    } else {
        entity.favoriteenemy = closestplayer.entity;
    }
    entity.var_8fc4b3ed = gettime() + randomintrange(2500, 3500);
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x86e62ac3, Offset: 0x7b60
// Size: 0x6c
function private function_a6a1eaac(behaviortreeentity) {
    currentstance = behaviortreeentity getblackboardattribute("_stance");
    if (currentstance == "crouch") {
        behaviortreeentity setblackboardattribute("_desired_stance", "stand");
    }
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x477bce42, Offset: 0x7bd8
// Size: 0x6c
function private function_1430887f(behaviortreeentity) {
    currentstance = behaviortreeentity getblackboardattribute("_stance");
    if (currentstance == "stand") {
        behaviortreeentity setblackboardattribute("_desired_stance", "crouch");
    }
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xd425b75e, Offset: 0x7c50
// Size: 0x94
function private function_16fedd3b(entity) {
    currentstance = entity getblackboardattribute("_stance");
    if (currentstance == "stand") {
        entity setblackboardattribute("_desired_stance", "crouch");
    } else {
        entity setblackboardattribute("_desired_stance", "stand");
    }
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x4883a15a, Offset: 0x7cf0
// Size: 0x2a
function private function_6fc4273(entity) {
    return entity ai::get_behavior_attribute("shutdown");
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x3e7617ef, Offset: 0x7d28
// Size: 0x9c
function private function_8e69a554(entity) {
    if (entity.controllevel >= 3) {
        if (entity ai::get_behavior_attribute("rogue_force_explosion")) {
            return 1;
        } else if (isdefined(entity.enemy)) {
            enemydistsq = distancesquared(entity.origin, entity.enemy.origin);
            return (enemydistsq < 3600);
        }
    }
    return 0;
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x8de53ad4, Offset: 0x7dd0
// Size: 0x44
function private function_7ffe9dd3(entity) {
    if (!isdefined(entity.node)) {
        return 0;
    }
    return entity getblackboardattribute("_stance") != "crouch";
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xaa2a5b1b, Offset: 0x7e20
// Size: 0x96
function private function_72b194a6(behaviortreeentity) {
    return behaviortreeentity getblackboardattribute("_stance") == "crouch" && aiutility::canbeflanked(behaviortreeentity) && behaviortreeentity isatcovernodestrict() && behaviortreeentity isflankedatcovernode() && !behaviortreeentity haspath();
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x6d5186d7, Offset: 0x7ec0
// Size: 0x2a
function private function_4b47ea1e(entity) {
    entity.allowdeath = 0;
    entity.nocybercom = 1;
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xeeb73bde, Offset: 0x7ef8
// Size: 0x164
function private function_e9f1941f(entity) {
    entity setblackboardattribute("_gib_location", "legs");
    entity radiusdamage(entity.origin + vectorscale((0, 0, 1), 36), 60, 100, 50, entity, "MOD_EXPLOSIVE");
    if (math::cointoss()) {
        gibserverutils::gibleftarm(entity);
    } else {
        gibserverutils::gibrightarm(entity);
    }
    gibserverutils::giblegs(entity);
    gibserverutils::gibhead(entity);
    clientfield::set("robot_mind_control_explosion", 1);
    if (isalive(entity)) {
        entity.allowdeath = 1;
        entity kill();
    }
    entity startragdoll();
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xe42555b8, Offset: 0x8068
// Size: 0xf2
function private function_9c82484c(entity) {
    if (isdefined(entity.steppedoutofcover) && isdefined(entity.var_89de610b) && (!entity iscovervalid(entity.var_89de610b) || entity haspath() || !entity issafefromgrenade())) {
        entity.steppedoutofcover = 0;
        entity pathmode("move allowed");
    }
    if (isdefined(entity.var_29e1776a) && gettime() > entity.var_29e1776a) {
        entity.combatmode = "cover";
        entity.var_29e1776a = undefined;
    }
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xe83a3d1b, Offset: 0x8168
// Size: 0x11e
function private function_63309931(entity) {
    var_9f3afc7b = 0;
    if (isdefined(entity.enemy)) {
        var_73785e5e = entity lastknownpos(entity.enemy);
        var_78a6f64d = distance2dsquared(entity.origin, var_73785e5e);
        var_9f3afc7b = var_78a6f64d <= 57600;
    }
    return !var_9f3afc7b && !entity.steppedoutofcover && entity isatcovernodestrict() && entity shouldusecovernode() && !entity haspath() && entity issafefromgrenade() && entity.combatmode != "no_cover";
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xd8178b50, Offset: 0x8290
// Size: 0x174
function private function_dc510f45(entity) {
    if (isdefined(entity.node)) {
        if (isdefined(entity.node.spawnflags) && (entity.node.spawnflags & 4) == 4) {
            return (entity.node.type == #"cover stand" || entity.node.type == #"conceal stand");
        }
        return (entity.node.type == #"cover left" || entity.node.type == #"cover right" || entity.node.type == #"cover crouch" || entity.node.type == #"cover crouch window" || entity.node.type == #"conceal crouch");
    }
    return 0;
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xed4f28e9, Offset: 0x8410
// Size: 0x170
function private function_f74aa8e4(entity) {
    if (!isdefined(entity.enemy) || entity.enemy.health <= 0) {
        return 0;
    }
    positiononnavmesh = getclosestpointonnavmesh(entity.origin, 200);
    enemypositiononnavmesh = getclosestpointonnavmesh(entity.enemy.origin, 200, 30);
    if (!isdefined(positiononnavmesh) || !isdefined(enemypositiononnavmesh)) {
        return 0;
    }
    var_ae0df311 = entity findpath(positiononnavmesh, enemypositiononnavmesh, 1, 0);
    /#
        if (!var_ae0df311) {
            record3dtext("robotProceduralTraversal", enemypositiononnavmesh + vectorscale((0, 0, 1), 5), (1, 0.5, 0), "robotScriptRequiresToSprint");
            recordline(positiononnavmesh, enemypositiononnavmesh, (1, 0.5, 0), "robotScriptRequiresToSprint", entity);
        }
    #/
    return var_ae0df311;
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xe2a0e85a, Offset: 0x8588
// Size: 0xa4
function private function_78688f24(entity) {
    if (!isdefined(entity.enemy) || entity.enemy.health <= 0) {
        return 0;
    }
    queryresult = positionquery_source_navigation(entity.enemy.origin, 0, 120, 120, 20, entity);
    positionquery_filter_inclaimedlocation(queryresult, entity);
    return queryresult.data.size > 0;
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x996ab95d, Offset: 0x8638
// Size: 0x38
function private function_ebb79d85(entity) {
    entity setblackboardattribute("_locomotion_speed", "locomotion_speed_sprint");
    return 1;
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xe5d409cd, Offset: 0x8678
// Size: 0x38
function private function_f40b9a8e(entity) {
    entity setblackboardattribute("_locomotion_speed", "locomotion_speed_super_sprint");
    return 1;
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xb81671b6, Offset: 0x86b8
// Size: 0x90
function private function_5bfddd8f(entity) {
    aiutility::resetcoverparameters(entity);
    aiutility::setcanbeflanked(entity, 0);
    entity setblackboardattribute("_locomotion_speed", "locomotion_speed_walk");
    entity setblackboardattribute("_stance", "stand");
    return 1;
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xef994abc, Offset: 0x8750
// Size: 0x3c
function private function_67108896(entity) {
    if (isalive(entity)) {
        entity kill();
    }
}

// Namespace namespace_6d47088/archetype_robot
// Params 2, eflags: 0x5 linked
// Checksum 0xbaaa10e9, Offset: 0x8798
// Size: 0x722
function private function_4ddc8241(entity, asmstatename) {
    entity.keepclaimednode = 0;
    positiononnavmesh = getclosestpointonnavmesh(entity.origin, 200);
    if (!isdefined(positiononnavmesh)) {
        return 4;
    }
    if (isdefined(entity.ignoreall) && entity.ignoreall) {
        entity function_d4c687c9();
        return 4;
    }
    if (!isdefined(entity.enemy)) {
        return 4;
    }
    if (function_61ab6dfe(entity)) {
        return 4;
    }
    if (entity.var_deb967ea) {
        if (isdefined(entity.enemy) && distancesquared(entity.origin, entity.enemy.origin) > 300 * 300) {
            entity collidewithactors(0);
        } else {
            entity collidewithactors(1);
        }
    }
    if (entity asmistransdecrunning() || entity asmistransitionrunning()) {
        return 4;
    }
    if (!isdefined(entity.var_73785e5e)) {
        entity.var_73785e5e = entity.enemy.origin;
    }
    shouldrepath = !isdefined(entity.var_8ddd7935);
    if (!shouldrepath && isdefined(entity.enemy)) {
        if (isdefined(entity.var_edebbea5) && entity.var_edebbea5 <= gettime()) {
            shouldrepath = 1;
        } else if (distancesquared(entity.var_73785e5e, entity.enemy.origin) > 72 * 72) {
            shouldrepath = 1;
        } else if (distancesquared(entity.origin, entity.enemy.origin) <= 120 * 120) {
            shouldrepath = 1;
        } else if (isdefined(entity.pathgoalpos)) {
            distancetogoalsqr = distancesquared(entity.origin, entity.pathgoalpos);
            shouldrepath = distancetogoalsqr < 72 * 72;
        }
    }
    if (shouldrepath) {
        entity.var_73785e5e = entity.enemy.origin;
        queryresult = positionquery_source_navigation(entity.var_73785e5e, 0, 120, 120, 20, entity);
        positionquery_filter_inclaimedlocation(queryresult, entity);
        if (queryresult.data.size > 0) {
            entity.var_8ddd7935 = queryresult.data[0].origin;
        }
        if (isdefined(entity.var_8ddd7935)) {
            entity function_a57c34b7(entity.var_8ddd7935);
            if (distancesquared(entity.origin, entity.var_8ddd7935) > 240 * 240) {
                path = entity calcapproximatepathtoposition(entity.var_8ddd7935, 0);
                /#
                    if (getdvarint(#"ai_debugzigzag", 0)) {
                        for (index = 1; index < path.size; index++) {
                            recordline(path[index - 1], path[index], (1, 0.5, 0), "robotScriptRequiresToSprint", entity);
                        }
                    }
                #/
                deviationdistance = randomintrange(240, 480);
                segmentlength = 0;
                for (index = 1; index < path.size; index++) {
                    currentseglength = distance(path[index - 1], path[index]);
                    if (segmentlength + currentseglength > deviationdistance) {
                        remaininglength = deviationdistance - segmentlength;
                        seedposition = path[index - 1] + vectornormalize(path[index] - path[index - 1]) * remaininglength;
                        /#
                            recordcircle(seedposition, 2, (1, 0.5, 0), "robotScriptRequiresToSprint", entity);
                        #/
                        innerzigzagradius = 0;
                        outerzigzagradius = 64;
                        queryresult = positionquery_source_navigation(seedposition, innerzigzagradius, outerzigzagradius, 36, 16, entity, 16);
                        positionquery_filter_inclaimedlocation(queryresult, entity);
                        if (queryresult.data.size > 0) {
                            point = queryresult.data[randomint(queryresult.data.size)];
                            entity function_a57c34b7(point.origin);
                        }
                        break;
                    }
                    segmentlength = segmentlength + currentseglength;
                }
            }
        }
        entity.var_edebbea5 = gettime() + randomintrange(2000, 3000);
    }
    return 5;
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x66a44edc, Offset: 0x8ec8
// Size: 0x48
function private function_3bce76f4(entity) {
    if (aiutility::shouldmutexmelee(entity) && function_f423812(entity)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x7ab28381, Offset: 0x8f18
// Size: 0x174
function private function_f423812(entity) {
    if (isdefined(entity.enemy) && issentient(entity.enemy) && entity.enemy.health > 0) {
        enemydistsq = distancesquared(entity.origin, entity.enemy.origin);
        if (enemydistsq < entity.var_a7b4c61c * entity.var_a7b4c61c && abs(entity.enemy.origin[2] - entity.origin[2]) < 24) {
            yawtoenemy = angleclamp180(entity.angles[1] - vectortoangles(entity.enemy.origin - entity.origin)[1]);
            return (abs(yawtoenemy) <= 80);
        }
    }
    return 0;
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x9867bbba, Offset: 0x9098
// Size: 0xea
function private function_793382c0(entity) {
    if (isdefined(entity.enemy) && issentient(entity.enemy) && entity.enemy.health > 0 && entity ai::get_behavior_attribute("rogue_control") != "level_3") {
        if (!entity cansee(entity.enemy)) {
            return 0;
        }
        return (distancesquared(entity.origin, entity.enemy.origin) < 132 * 132);
    }
    return 0;
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xceb8771, Offset: 0x9190
// Size: 0x48
function private function_e5ddd4c(entity) {
    if (aiutility::shouldmutexmelee(entity) && function_adeb3a65(entity)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x5ec535f5, Offset: 0x91e0
// Size: 0x14c
function private function_adeb3a65(entity) {
    if (isdefined(entity.enemy) && issentient(entity.enemy) && entity.enemy.health > 0) {
        if (!entity cansee(entity.enemy)) {
            return 0;
        }
        enemydistsq = distancesquared(entity.origin, entity.enemy.origin);
        if (enemydistsq < 64 * 64) {
            yawtoenemy = angleclamp180(entity.angles[1] - vectortoangles(entity.enemy.origin - entity.origin)[1]);
            return (abs(yawtoenemy) <= 80);
        }
    }
    return 0;
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x3c4a0dfc, Offset: 0x9338
// Size: 0xc2
function private function_61ab6dfe(entity) {
    if (isdefined(entity.enemy) && issentient(entity.enemy) && entity.enemy.health > 0 && entity ai::get_behavior_attribute("rogue_control") != "level_3") {
        return (distancesquared(entity.origin, entity.enemy.origin) < 64 * 64);
    }
    return 0;
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x9d6b0fdc, Offset: 0x9408
// Size: 0x4e
function private function_7d3b0dcd(entity) {
    return entity ai::get_behavior_attribute("sprint") && !entity ai::get_behavior_attribute("disablesprint");
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xf5a3971b, Offset: 0x9460
// Size: 0x4c
function private function_1f612b7d(entity) {
    aiutility::cleanupcovermode(entity);
    entity setblackboardattribute("_robot_step_in", "fast");
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x1541fda3, Offset: 0x94b8
// Size: 0x8a
function private function_3029a076(entity) {
    if (isdefined(entity.damageweapon) && isdefined(entity.damagemod)) {
        weapon = entity.damageweapon;
        return (entity.damagemod == "MOD_GRENADE_SPLASH" && weapon.rootweapon.name == #"emp_grenade");
    }
    return 0;
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x60c5eadd, Offset: 0x9550
// Size: 0x54
function private function_d334168f(entity) {
    if (isdefined(entity.enemy) && aiutility::shouldmelee(entity)) {
        entity clearpath();
        return 1;
    }
    return 0;
}

// Namespace namespace_6d47088/archetype_robot
// Params 3, eflags: 0x5 linked
// Checksum 0xbafdfacc, Offset: 0x95b0
// Size: 0x106
function private function_93d35a2c(entity, range, var_7b920137) {
    /#
        assert(isdefined(range));
    #/
    if (!isdefined(entity.enemy) && !entity haspath()) {
        return 0;
    }
    goalpos = entity.pathgoalpos;
    if (isdefined(entity.enemy) && var_7b920137) {
        goalpos = entity lastknownpos(entity.enemy);
    }
    if (!isdefined(goalpos)) {
        return 0;
    }
    var_fa99ed4 = distancesquared(entity.origin, goalpos) > range * range;
    return var_fa99ed4;
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x86083b7c, Offset: 0x96c0
// Size: 0x24
function private function_19388d04(entity) {
    return !function_a36c381(entity);
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x19350051, Offset: 0x96f0
// Size: 0x76
function private function_a36c381(entity) {
    if (entity ai::get_behavior_attribute("supports_super_sprint") && !entity ai::get_behavior_attribute("disablesprint")) {
        return function_93d35a2c(entity, entity.var_e9bcc11f, 0);
    }
    return 0;
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x5d4c83de, Offset: 0x9770
// Size: 0x86
function private function_d365993c(entity) {
    if (entity ai::get_behavior_attribute("supports_super_sprint") && !entity ai::get_behavior_attribute("disablesprint")) {
        return function_93d35a2c(entity, entity.var_e9bcc11f * 1.15, 0);
    }
    return 0;
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x87be73a6, Offset: 0x9800
// Size: 0xc2
function private function_110823db(entity) {
    if (entity ai::get_behavior_attribute("disablesprint")) {
        return 0;
    }
    if (isdefined(entity.enemy) && distancesquared(entity.origin, entity.goalpos) < entity.minwalkdistance * entity.minwalkdistance) {
        return 0;
    }
    return function_93d35a2c(entity, entity.runandgundist * 1.15, 1);
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xc7bc944e, Offset: 0x98d0
// Size: 0xb2
function private function_b6726c16(entity) {
    if (entity ai::get_behavior_attribute("disablesprint")) {
        return 0;
    }
    if (isdefined(entity.enemy) && distancesquared(entity.origin, entity.goalpos) < entity.minwalkdistance * entity.minwalkdistance) {
        return 0;
    }
    return function_93d35a2c(entity, entity.runandgundist, 1);
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xe53e2320, Offset: 0x9990
// Size: 0x12c
function private function_2feeeaea(entity) {
    switch (entity.controllevel) {
    case 0:
        return isinarray(array("level_1", "level_2", "level_3"), entity ai::get_behavior_attribute("rogue_control"));
    case 1:
        return isinarray(array("level_2", "level_3"), entity ai::get_behavior_attribute("rogue_control"));
    case 2:
        return (entity ai::get_behavior_attribute("rogue_control") == "level_3");
        break;
    }
    return 0;
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xfd54322e, Offset: 0x9ac8
// Size: 0x18
function private function_3b97d9c0(entity) {
    return isdefined(entity.var_4ed804f6);
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xcfedf522, Offset: 0x9ae8
// Size: 0x76
function private function_d982e8f7(entity) {
    velocity = entity getvelocity();
    velocity = (velocity[0], 0, velocity[1]);
    var_a4fc34cd = lengthsquared(velocity);
    return var_a4fc34cd > 24 * 24;
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x9e7450df, Offset: 0x9b68
// Size: 0x1c
function private function_e67e6cad(entity) {
    return entity.controllevel <= 1;
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xa11a338, Offset: 0x9b90
// Size: 0x3c
function private function_2286c90c(entity) {
    if (!entity haspath()) {
        return 0;
    }
    return !function_3bfe7353(entity);
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x26f1cda4, Offset: 0x9bd8
// Size: 0x5dc
function private function_de92f68d(entity) {
    if (entity isflankedatcovernode()) {
        return 0;
    }
    if (entity shouldholdgroundagainstenemy()) {
        return 0;
    }
    shouldusecovernode = undefined;
    itsbeenawhile = gettime() > entity.nextfindbestcovertime;
    isatscriptgoal = undefined;
    if (isdefined(entity.var_445c1d7e)) {
        isatscriptgoal = entity isposatgoal(entity.var_445c1d7e.origin);
        shouldusecovernode = entity iscovervalid(entity.var_445c1d7e);
    } else {
        isatscriptgoal = entity isatgoal();
        shouldusecovernode = entity shouldusecovernode();
    }
    shouldlookforbettercover = !shouldusecovernode || itsbeenawhile || !isatscriptgoal;
    /#
        recordenttext("robotWallrunStart" + shouldusecovernode + "locomotion_speed_sprint" + itsbeenawhile + "_move_mode" + isatscriptgoal, entity, shouldlookforbettercover ? (0, 1, 0) : (1, 0, 0), "robotScriptRequiresToSprint");
    #/
    if (shouldlookforbettercover && !entity.keepclaimednode) {
        transitionrunning = entity asmistransitionrunning();
        substatepending = entity asmissubstatepending();
        transdecrunning = entity asmistransdecrunning();
        isbehaviortreeinrunningstate = entity getbehaviortreestatus() == 5;
        if (!transitionrunning && !substatepending && !transdecrunning && isbehaviortreeinrunningstate) {
            nodes = entity findbestcovernodes(entity.goalradius, entity.goalpos);
            node = undefined;
            for (nodeindex = 0; nodeindex < nodes.size; nodeindex++) {
                if (entity.var_445c1d7e === nodes[nodeindex] || !isdefined(nodes[nodeindex].var_39ae5b13)) {
                    node = nodes[nodeindex];
                    break;
                }
            }
            if (isentity(entity.node) && (!isdefined(entity.var_445c1d7e) || entity.var_445c1d7e != entity.node)) {
                entity.var_445c1d7e = entity.node;
                entity.var_445c1d7e.var_39ae5b13 = 1;
            }
            goingtodifferentnode = isdefined(node) && (!isdefined(entity.var_445c1d7e) || node != entity.var_445c1d7e) && (!isdefined(entity.var_89de610b) || entity.var_89de610b != node);
            aiutility::setnextfindbestcovertime(entity, node);
            if (goingtodifferentnode) {
                if (randomfloat(1) <= 0.75 || entity ai::get_behavior_attribute("force_cover")) {
                    aiutility::usecovernodewrapper(entity, node);
                } else {
                    searchradius = entity.goalradius;
                    if (searchradius > 200) {
                        searchradius = 200;
                    }
                    var_639e0e04 = util::positionquery_pointarray(node.origin, 30, searchradius, 72, 30);
                    if (var_639e0e04.size > 0) {
                        entity function_a57c34b7(var_639e0e04[randomint(var_639e0e04.size)]);
                    } else {
                        entity function_a57c34b7(entity getnodeoffsetposition(node));
                    }
                }
                if (isdefined(entity.var_445c1d7e)) {
                    entity.var_445c1d7e.var_39ae5b13 = undefined;
                }
                entity.var_445c1d7e = node;
                entity.var_445c1d7e.var_39ae5b13 = 1;
                entity pathmode("move delayed", 0, randomfloatrange(0.25, 2));
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xc703eaba, Offset: 0xa1c0
// Size: 0x2ce
function private function_9a368b70(entity) {
    if (entity ai::get_behavior_attribute("move_mode") == "escort") {
        var_7fa5bb4f = entity ai::get_behavior_attribute("escort_position");
        if (!isdefined(var_7fa5bb4f)) {
            return 1;
        }
        if (distance2dsquared(entity.origin, var_7fa5bb4f) <= 22500) {
            return 1;
        }
        if (isdefined(entity.var_1c472345) && gettime() < entity.var_1c472345) {
            return 1;
        }
        if (entity getpathmode() == "dont move") {
            return 1;
        }
        positiononnavmesh = getclosestpointonnavmesh(var_7fa5bb4f, 200);
        if (!isdefined(positiononnavmesh)) {
            positiononnavmesh = var_7fa5bb4f;
        }
        queryresult = positionquery_source_navigation(positiononnavmesh, 75, 150, 36, 16, entity, 16);
        positionquery_filter_inclaimedlocation(queryresult, entity);
        if (queryresult.data.size > 0) {
            closestpoint = undefined;
            var_7dd9f987 = undefined;
            foreach (point in queryresult.data) {
                if (!point.inclaimedlocation) {
                    var_4b9a8e8a = distance2dsquared(entity.origin, point.origin);
                    if (!isdefined(closestpoint) || var_4b9a8e8a < var_7dd9f987) {
                        closestpoint = point.origin;
                        var_7dd9f987 = var_4b9a8e8a;
                    }
                }
            }
            if (isdefined(closestpoint)) {
                entity function_a57c34b7(closestpoint);
                entity.var_1c472345 = gettime() + randomintrange(200, 300);
            }
        }
        return 1;
    }
    return 0;
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x35941c54, Offset: 0xa498
// Size: 0x39e
function private function_125e20b6(entity) {
    if (entity ai::get_behavior_attribute("move_mode") == "rusher") {
        entity pathmode("move allowed");
        if (!isdefined(entity.enemy)) {
            return 1;
        }
        var_5bedab77 = distance2dsquared(entity.origin, entity.enemy.origin);
        if (var_5bedab77 <= entity.var_c321a1a2 * entity.var_c321a1a2 && var_5bedab77 >= entity.var_dd06acb6 * entity.var_dd06acb6) {
            return 1;
        }
        if (isdefined(entity.var_d8ba637b) && gettime() < entity.var_d8ba637b) {
            return 1;
        }
        positiononnavmesh = getclosestpointonnavmesh(entity.enemy.origin, 200);
        if (!isdefined(positiononnavmesh)) {
            positiononnavmesh = entity.enemy.origin;
        }
        queryresult = positionquery_source_navigation(positiononnavmesh, entity.var_dd06acb6, entity.var_c321a1a2, 36, 16, entity, 16);
        positionquery_filter_inclaimedlocation(queryresult, entity);
        positionquery_filter_sight(queryresult, entity.enemy.origin, entity geteye() - entity.origin, entity, 2, entity.enemy);
        if (queryresult.data.size > 0) {
            closestpoint = undefined;
            var_7dd9f987 = undefined;
            foreach (point in queryresult.data) {
                if (!point.inclaimedlocation && point.visibility === 1) {
                    var_4b9a8e8a = distance2dsquared(entity.origin, point.origin);
                    if (!isdefined(closestpoint) || var_4b9a8e8a < var_7dd9f987) {
                        closestpoint = point.origin;
                        var_7dd9f987 = var_4b9a8e8a;
                    }
                }
            }
            if (isdefined(closestpoint)) {
                entity function_a57c34b7(closestpoint);
                entity.var_d8ba637b = gettime() + randomintrange(500, 1500);
            }
        }
        return 1;
    }
    return 0;
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xbcb89fbd, Offset: 0xa840
// Size: 0x3c8
function private function_54f120e4(entity) {
    if (entity ai::get_behavior_attribute("move_mode") == "guard") {
        if (entity getpathmode() == "dont move") {
            return 1;
        }
        if (!isdefined(entity.var_e5ed4cac) || distancesquared(entity.origin, entity.var_e5ed4cac) < 60 * 60) {
            entity pathmode("move delayed", 1, randomfloatrange(1, 1.5));
            queryresult = positionquery_source_navigation(entity.goalpos, 0, entity.goalradius / 2, 36, 36, entity, 72);
            positionquery_filter_inclaimedlocation(queryresult, entity);
            if (queryresult.data.size > 0) {
                var_764c377d = entity.goalradius * 0.2;
                var_764c377d = var_764c377d * var_764c377d;
                var_1b1cbc16 = [];
                foreach (point in queryresult.data) {
                    if (distancesquared(entity.origin, point.origin) > var_764c377d) {
                        var_1b1cbc16[var_1b1cbc16.size] = point;
                    }
                }
                if (var_1b1cbc16.size > 0) {
                    var_c4b57cc4 = var_1b1cbc16[randomint(var_1b1cbc16.size)];
                    entity.var_e5ed4cac = var_c4b57cc4.origin;
                    entity.var_9fb59c6d = undefined;
                    entity.var_553e739e = undefined;
                }
            }
        }
        currenttime = gettime();
        if (!isdefined(entity.var_553e739e) || entity.var_553e739e < currenttime) {
            if (isdefined(entity.var_9fb59c6d) && distancesquared(entity.var_9fb59c6d, entity.origin) < 24 * 24) {
                entity.var_e5ed4cac = entity.origin;
            }
            entity.var_9fb59c6d = entity.origin;
            entity.var_553e739e = currenttime + 3000;
        }
        if (isdefined(entity.var_e5ed4cac)) {
            entity function_a57c34b7(entity.var_e5ed4cac);
            return 1;
        }
    }
    entity.var_e5ed4cac = undefined;
    entity.var_9fb59c6d = undefined;
    entity.var_553e739e = undefined;
    return 0;
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x9e4cf967, Offset: 0xac10
// Size: 0x276
function private function_23205355(entity) {
    /#
        if (getdvarint(#"hash_78a811de97420486", 0) && isdefined(entity.enemy)) {
            lastknownpos = entity lastknownpos(entity.enemy);
            recordline(entity.origin, lastknownpos, (1, 0.5, 0), "robotScriptRequiresToSprint", entity);
            record3dtext("_gib_location", lastknownpos + vectorscale((0, 0, 1), 5), (1, 0.5, 0), "robotScriptRequiresToSprint");
        }
    #/
    if (!isalive(entity)) {
        if (isdefined(entity.var_445c1d7e)) {
            aiutility::releaseclaimnode(entity);
            entity.var_445c1d7e.var_39ae5b13 = undefined;
            entity.var_445c1d7e = undefined;
        }
        return 0;
    }
    if (entity.disablerepath) {
        return 0;
    }
    if (!function_e67e6cad(entity)) {
        return 0;
    }
    if (entity ai::get_behavior_attribute("phalanx")) {
        return 0;
    }
    if (aisquads::isfollowingsquadleader(entity)) {
        return 0;
    }
    if (function_125e20b6(entity)) {
        return 1;
    }
    if (function_54f120e4(entity)) {
        return 1;
    }
    if (function_9a368b70(entity)) {
        return 1;
    }
    if (!aiutility::issafefromgrenades(entity)) {
        aiutility::releaseclaimnode(entity);
        aiutility::choosebestcovernodeasap(entity);
    }
    if (function_de92f68d(entity)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_6d47088/archetype_robot
// Params 2, eflags: 0x5 linked
// Checksum 0x146152b7, Offset: 0xae90
// Size: 0x7c
function private function_b301148d(entity, asmstatename) {
    if (entity.weapon.name == level.weaponnone.name) {
        entity shared::placeweaponon(entity.startingweapon, "right");
        entity thread shared::dropaiweapon();
    }
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xdf37d007, Offset: 0xaf18
// Size: 0xec
function private function_b199b248(entity) {
    aiutility::choosejukedirection(entity);
    entity clearpath();
    function_6eac4ca1(entity, "rbJuke");
    entity notify(#"bhtn_action_notify", {#action:"rbJuke"});
    jukeinfo = spawnstruct();
    jukeinfo.origin = entity.origin;
    jukeinfo.entity = entity;
    blackboard::addblackboardevent("actor_juke", jukeinfo, 3000);
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x5e8fd225, Offset: 0xb010
// Size: 0x5e
function private function_fb916108(entity) {
    entity.nextpreemptivejuke = gettime() + randomintrange(4000, 6000);
    entity.nextpreemptivejukeads = randomfloatrange(0.5, 0.95);
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x901f64d0, Offset: 0xb078
// Size: 0x362
function private function_3b3f8f46(entity) {
    movemode = entity ai::get_behavior_attribute("move_mode");
    if (movemode == "rusher" || movemode == "escort" || movemode == "guard") {
        return 0;
    }
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
    if (!function_e67e6cad(entity)) {
        return 0;
    }
    if (entity ai::get_behavior_attribute("force_cover")) {
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

// Namespace namespace_6d47088/archetype_robot
// Params 2, eflags: 0x5 linked
// Checksum 0xabd990cd, Offset: 0xb3e8
// Size: 0xd8
function private function_7613eded(entity, asmstatename) {
    switch (entity ai::get_behavior_attribute("rogue_control")) {
    case #"level_1":
        entity namespace_8234b281::function_37b663f();
        break;
    case #"level_2":
        entity namespace_8234b281::function_1dc49ad9();
        break;
    case #"level_3":
        entity namespace_8234b281::function_2f113d72();
        break;
    }
    animationstatenetworkutility::requeststate(entity, asmstatename);
    return 5;
}

// Namespace namespace_6d47088/archetype_robot
// Params 2, eflags: 0x5 linked
// Checksum 0x87c24887, Offset: 0xb4c8
// Size: 0x7e
function private function_7aecebde(entity, asmstatename) {
    switch (entity ai::get_behavior_attribute("rogue_control")) {
    case #"level_2":
    case #"level_3":
        entity thread shared::dropaiweapon();
        break;
    }
    return 4;
}

// Namespace namespace_6d47088/archetype_robot
// Params 2, eflags: 0x5 linked
// Checksum 0xb7d924a5, Offset: 0xb550
// Size: 0xb0
function private function_84d4e7f0(entity, asmstatename) {
    aiutility::releaseclaimnode(entity);
    aiutility::usecovernodewrapper(entity, entity.var_89de610b);
    entity setblackboardattribute("_desired_stance", "crouch");
    aiutility::keepclaimnode(entity);
    entity.var_89de610b = undefined;
    animationstatenetworkutility::requeststate(entity, asmstatename);
    return 5;
}

// Namespace namespace_6d47088/archetype_robot
// Params 2, eflags: 0x5 linked
// Checksum 0x3e5e1988, Offset: 0xb608
// Size: 0x58
function private function_453ef89f(entity, asmstatename) {
    entity.steppedoutofcover = 0;
    aiutility::releaseclaimnode(entity);
    entity pathmode("move allowed");
    return 4;
}

// Namespace namespace_6d47088/archetype_robot
// Params 2, eflags: 0x5 linked
// Checksum 0x12cb3ade, Offset: 0xb668
// Size: 0xf8
function private function_764dbfa9(entity, asmstatename) {
    entity.var_89de610b = entity.node;
    aiutility::keepclaimnode(entity);
    if (math::cointoss()) {
        entity setblackboardattribute("_desired_stance", "stand");
    } else {
        entity setblackboardattribute("_desired_stance", "crouch");
    }
    entity setblackboardattribute("_robot_step_in", "fast");
    aiutility::choosecoverdirection(entity, 1);
    animationstatenetworkutility::requeststate(entity, asmstatename);
    return 5;
}

// Namespace namespace_6d47088/archetype_robot
// Params 2, eflags: 0x5 linked
// Checksum 0x892ae8c, Offset: 0xb768
// Size: 0x68
function private function_1934aa43(entity, asmstatename) {
    entity.steppedoutofcover = 1;
    entity.var_ca9f1456 = gettime();
    aiutility::releaseclaimnode(entity);
    entity pathmode("dont move");
    return 4;
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xfbc205ce, Offset: 0xb7d8
// Size: 0x7e
function private function_85bba2a8(entity) {
    return entity.node.type == #"cover left" || entity.node.type == #"cover right" || entity.node.type == #"cover pillar";
}

// Namespace namespace_6d47088/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xdafa331d, Offset: 0xb860
// Size: 0xfc
function private function_9dbbe8b8(entity) {
    if (!isdefined(entity.steppedoutofcover) || !entity.steppedoutofcover || !isdefined(entity.var_ca9f1456) || !entity.steppedoutofcover) {
        return 0;
    }
    var_70c051f6 = float(gettime() - entity.var_ca9f1456) / 1000;
    var_902a8b5b = var_70c051f6 >= 4 || var_70c051f6 >= 8;
    suppressed = entity.suppressionmeter > entity.suppressionthreshold;
    return var_902a8b5b || var_902a8b5b && suppressed;
}

// Namespace namespace_6d47088/archetype_robot
// Params 0, eflags: 0x5 linked
// Checksum 0x56fdf995, Offset: 0xb968
// Size: 0xb6
function private function_b473acc1() {
    entity = self;
    if (isdefined(entity) && isdefined(entity.var_4ed804f6)) {
        positiononnavmesh = getclosestpointonnavmesh(entity.origin, 200);
        raps = spawnvehicle("spawner_bo3_mini_raps", positiononnavmesh, (0, 0, 0));
        raps.team = entity.team;
        raps thread namespace_8234b281::function_14d9e581(raps);
        entity.var_4ed804f6 = undefined;
    }
}

// Namespace namespace_6d47088/archetype_robot
// Params 0, eflags: 0x5 linked
// Checksum 0x4fa74589, Offset: 0xba28
// Size: 0x94
function private function_125cc705() {
    if (self.var_9fde8624 === #"hash_70bbc471738b4f2f") {
        self.var_21001b38 = getweapon(#"hash_3b5610f58856b4ea");
        self.var_d5bd74f1 = getweapon(#"hash_1d8ec79043d16eb");
        self.var_cdf2311b = 0;
        self thread function_ce50548d();
    }
}

// Namespace namespace_6d47088/archetype_robot
// Params 0, eflags: 0x5 linked
// Checksum 0xab8e7d08, Offset: 0xbac8
// Size: 0x1f8
function private function_ce50548d() {
    self endon(#"death");
    self ai::gun_remove();
    self ai::gun_switchto(self.var_21001b38, "right");
    while (self.weapon !== self.var_21001b38) {
        waitframe(1);
    }
    while (isalive(self)) {
        var_70a33a38 = self ai::function_63734291(self.enemy);
        if (isdefined(self.enemy)) {
            if (isdefined(var_70a33a38) && var_70a33a38 && !(isdefined(self.var_cdf2311b) && self.var_cdf2311b)) {
                self ai::gun_remove();
                self ai::gun_switchto(self.var_d5bd74f1, "right");
                while (self.weapon !== self.var_d5bd74f1) {
                    waitframe(1);
                }
                self.var_cdf2311b = 1;
            }
            if (!(isdefined(var_70a33a38) && var_70a33a38) && isdefined(self.var_cdf2311b) && self.var_cdf2311b) {
                self ai::gun_remove();
                self ai::gun_switchto(self.var_21001b38, "right");
                while (self.weapon !== self.var_21001b38) {
                    waitframe(1);
                }
                self.var_cdf2311b = 0;
            }
        }
        waitframe(1);
    }
}

#namespace namespace_8234b281;

// Namespace namespace_8234b281/archetype_robot
// Params 4, eflags: 0x5 linked
// Checksum 0xcefccc4a, Offset: 0xbcc8
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

// Namespace namespace_8234b281/archetype_robot
// Params 5, eflags: 0x5 linked
// Checksum 0x33e334d4, Offset: 0xbe08
// Size: 0x28c
function private _trygibbinglimb(entity, damage, hitloc, isexplosive, ondeath) {
    if (gibserverutils::isgibbed(entity, 32) || gibserverutils::isgibbed(entity, 16)) {
        return;
    }
    if (isexplosive && randomfloatrange(0, 1) <= 0.25) {
        if (ondeath && math::cointoss()) {
            gibserverutils::gibrightarm(entity);
        } else {
            gibserverutils::gibleftarm(entity);
        }
    } else if (isinarray(array("left_hand", "left_arm_lower", "left_arm_upper"), hitloc)) {
        gibserverutils::gibleftarm(entity);
    } else if (ondeath && isinarray(array("right_hand", "right_arm_lower", "right_arm_upper"), hitloc)) {
        gibserverutils::gibrightarm(entity);
    } else if (namespace_6d47088::function_4bf0cd1c() == "mind_controlled" && isinarray(array("right_hand", "right_arm_lower", "right_arm_upper"), hitloc)) {
        gibserverutils::gibrightarm(entity);
    } else if (ondeath && randomfloatrange(0, 1) <= 0.25) {
        if (math::cointoss()) {
            gibserverutils::gibleftarm(entity);
        } else {
            gibserverutils::gibrightarm(entity);
        }
    }
}

// Namespace namespace_8234b281/archetype_robot
// Params 5, eflags: 0x5 linked
// Checksum 0x1b897d5f, Offset: 0xc0a0
// Size: 0x404
function private _trygibbinglegs(entity, damage, hitloc, isexplosive, attacker = entity) {
    cangiblegs = entity.health - damage <= 0 && entity.allowdeath;
    if (entity ai::get_behavior_attribute("can_become_crawler")) {
        cangiblegs = cangiblegs || (entity.health - damage) / entity.maxhealth <= 0.25 && distancesquared(entity.origin, attacker.origin) <= 360000 && !namespace_6d47088::function_63309931(entity) && entity.allowdeath;
    }
    if (entity.var_9787f5fe && entity.health - damage <= 0 && entity.allowdeath && !namespace_6d47088::function_9e4b1ae3(entity)) {
        return;
    }
    if (entity.health - damage <= 0 && entity.allowdeath && isexplosive && randomfloatrange(0, 1) <= 0.5) {
        gibserverutils::giblegs(entity);
        entity startragdoll();
    } else if (cangiblegs && isinarray(array("left_leg_upper", "left_leg_lower", "left_foot"), hitloc) && randomfloatrange(0, 1) <= 1) {
        if (entity.health - damage > 0) {
            becomecrawler(entity);
        }
        gibserverutils::gibleftleg(entity);
    } else if (cangiblegs && isinarray(array("right_leg_upper", "right_leg_lower", "right_foot"), hitloc) && randomfloatrange(0, 1) <= 1) {
        if (entity.health - damage > 0) {
            becomecrawler(entity);
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

// Namespace namespace_8234b281/archetype_robot
// Params 12, eflags: 0x5 linked
// Checksum 0x3a0c84ec, Offset: 0xc4b0
// Size: 0x1f8
function private function_532b620b(inflictor, attacker, damage, flags, meansofdeath, weapon, point, dir, hitloc, offsettime, boneindex, modelindex) {
    entity = self;
    if (isdefined(attacker) && attacker.team == entity.team) {
        return damage;
    }
    if (!entity ai::get_behavior_attribute("can_gib")) {
        return damage;
    }
    if ((entity.health - damage) / entity.maxhealth > 0.75) {
        return damage;
    }
    gibserverutils::togglespawngibs(entity, 1);
    destructserverutils::togglespawngibs(entity, 1);
    isexplosive = isinarray(array("MOD_CRUSH", "MOD_GRENADE", "MOD_GRENADE_SPLASH", "MOD_PROJECTILE", "MOD_PROJECTILE_SPLASH", "MOD_EXPLOSIVE"), meansofdeath);
    _trygibbinghead(entity, damage, hitloc, isexplosive);
    _trygibbinglimb(entity, damage, hitloc, isexplosive, 0);
    _trygibbinglegs(entity, damage, hitloc, isexplosive, attacker);
    return damage;
}

// Namespace namespace_8234b281/archetype_robot
// Params 8, eflags: 0x5 linked
// Checksum 0x818c2af5, Offset: 0xc6b0
// Size: 0x78
function private function_5cdb3a8f(inflictor, attacker, damage, meansofdeath, weapon, dir, hitloc, offsettime) {
    entity = self;
    entity ai::set_behavior_attribute("robot_lights", 4);
    return damage;
}

// Namespace namespace_8234b281/archetype_robot
// Params 8, eflags: 0x5 linked
// Checksum 0xfeb4f601, Offset: 0xc730
// Size: 0x300
function private function_668ebe68(inflictor, attacker, damage, meansofdeath, weapon, dir, hitloc, offsettime) {
    entity = self;
    if (!entity ai::get_behavior_attribute("can_gib") || entity.skipdeath) {
        return damage;
    }
    gibserverutils::togglespawngibs(entity, 1);
    destructserverutils::togglespawngibs(entity, 1);
    isexplosive = 0;
    if (entity.controllevel >= 3) {
        clientfield::set("robot_mind_control_explosion", 1);
        destructserverutils::destructnumberrandompieces(entity);
        gibserverutils::gibhead(entity);
        if (math::cointoss()) {
            gibserverutils::gibleftarm(entity);
        } else {
            gibserverutils::gibrightarm(entity);
        }
        gibserverutils::giblegs(entity);
        velocity = entity getvelocity() / 9;
        entity startragdoll();
        entity launchragdoll((velocity[0] + randomfloatrange(-10, 10), velocity[1] + randomfloatrange(-10, 10), randomfloatrange(40, 50)), "j_mainroot");
        physicsexplosionsphere(entity.origin + vectorscale((0, 0, 1), 36), 120, 32, 1);
    } else {
        isexplosive = isinarray(array("MOD_CRUSH", "MOD_GRENADE", "MOD_GRENADE_SPLASH", "MOD_PROJECTILE", "MOD_PROJECTILE_SPLASH", "MOD_EXPLOSIVE"), meansofdeath);
        _trygibbinglimb(entity, damage, hitloc, isexplosive, 1);
    }
    return damage;
}

// Namespace namespace_8234b281/archetype_robot
// Params 8, eflags: 0x5 linked
// Checksum 0x7f22d84b, Offset: 0xca38
// Size: 0x1f8
function private function_ca6332ee(inflictor, attacker, damage, meansofdeath, weapon, dir, hitloc, offsettime) {
    entity = self;
    if (entity.skipdeath) {
        return damage;
    }
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
    return damage;
}

// Namespace namespace_8234b281/archetype_robot
// Params 12, eflags: 0x5 linked
// Checksum 0xf2159631, Offset: 0xcc38
// Size: 0x396
function private function_34fb94b5(inflictor, attacker, damage, flags, meansofdamage, weapon, point, dir, hitloc, offsettime, boneindex, modelindex) {
    entity = self;
    if (hitloc != "helmet" || hitloc != "head" || hitloc != "neck") {
        if (isdefined(attacker) && !isplayer(attacker) && !isvehicle(attacker)) {
            dist = distancesquared(entity.origin, attacker.origin);
            if (dist < 65536) {
                damage = int(damage * 10);
            } else {
                damage = int(damage * 1.5);
            }
        }
    }
    if (hitloc == "helmet" || hitloc == "head" || hitloc == "neck") {
        damage = int(damage * 0.5);
    }
    if (isdefined(dir) && isdefined(meansofdamage) && isdefined(hitloc) && vectordot(anglestoforward(entity.angles), dir) > 0) {
        var_68915b32 = isinarray(array("MOD_RIFLE_BULLET", "MOD_PISTOL_BULLET"), meansofdamage);
        var_a37c7e12 = isinarray(array("torso_upper", "torso_lower"), hitloc);
        if (var_68915b32 && var_a37c7e12) {
            damage = int(damage * 2);
        }
    }
    if (weapon.name == #"sticky_grenade") {
        switch (meansofdamage) {
        case #"mod_impact":
            entity.var_c885ba62 = 1;
            break;
        case #"mod_grenade_splash":
            if (isdefined(entity.var_c885ba62) && entity.var_c885ba62) {
                damage = entity.health;
            }
            break;
        }
    }
    if (meansofdamage == "MOD_TRIGGER_HURT" && entity.ignoretriggerdamage) {
        damage = 0;
    }
    return damage;
}

// Namespace namespace_8234b281/archetype_robot
// Params 12, eflags: 0x5 linked
// Checksum 0xa745d386, Offset: 0xcfd8
// Size: 0xf0
function private function_69afabac(inflictor, attacker, damage, flags, meansofdamage, weapon, point, dir, hitloc, offsettime, boneindex, modelindex) {
    entity = self;
    isexplosive = isinarray(array("MOD_CRUSH", "MOD_GRENADE", "MOD_GRENADE_SPLASH", "MOD_PROJECTILE", "MOD_PROJECTILE_SPLASH", "MOD_EXPLOSIVE"), meansofdamage);
    if (isexplosive) {
        destructserverutils::destructrandompieces(entity);
    }
    return damage;
}

// Namespace namespace_8234b281/archetype_robot
// Params 1, eflags: 0x4
// Checksum 0x65d22146, Offset: 0xd0d0
// Size: 0x80
function private findclosestnavmeshpositiontoenemy(enemy) {
    enemypositiononnavmesh = undefined;
    for (tolerancelevel = 1; tolerancelevel <= 4; tolerancelevel++) {
        enemypositiononnavmesh = getclosestpointonnavmesh(enemy.origin, 200 * tolerancelevel, 30);
        if (isdefined(enemypositiononnavmesh)) {
            break;
        }
    }
    return enemypositiononnavmesh;
}

// Namespace namespace_8234b281/archetype_robot
// Params 2, eflags: 0x4
// Checksum 0x9097584b, Offset: 0xd158
// Size: 0x9c
function private function_360c478(entity, var_3d11d1c4) {
    if (!isdefined(entity.node)) {
        return;
    }
    coverdirection = entity getblackboardattribute("_cover_direction");
    entity setblackboardattribute("_previous_cover_direction", coverdirection);
    entity setblackboardattribute("_cover_direction", aiutility::calculatecoverdirection(entity, var_3d11d1c4));
}

// Namespace namespace_8234b281/archetype_robot
// Params 0, eflags: 0x5 linked
// Checksum 0x890d3ba5, Offset: 0xd200
// Size: 0x62c
function private function_4fca472() {
    entity = self;
    entity.var_dd830224 = 0;
    entity.becomecrawler = 0;
    entity.combatmode = "cover";
    entity.fullhealth = entity.health;
    entity.controllevel = 0;
    entity.steppedoutofcover = 0;
    entity.ignoretriggerdamage = 0;
    entity.startingweapon = entity.weapon;
    entity.jukedistance = 90;
    entity.jukemaxdistance = 1200;
    entity.entityradius = 15;
    entity.var_e86a87ec = 2000;
    entity.var_132d7c7b = 1;
    entity.ignorerunandgundist = 1;
    entity.disablerepath = 0;
    entity.var_c321a1a2 = 250;
    entity.var_dd06acb6 = 150;
    entity.var_9787f5fe = math::cointoss();
    entity.minwalkdistance = 240;
    entity.var_e9bcc11f = 300;
    entity.treatallcoversasgeneric = 1;
    entity.onlycroucharrivals = 1;
    entity.var_a7b4c61c = 125;
    entity.var_deb967ea = 1;
    entity.nextpreemptivejukeads = randomfloatrange(0.5, 0.95);
    entity.shouldpreemptivejuke = math::cointoss();
    destructserverutils::togglespawngibs(entity, 1);
    gibserverutils::togglespawngibs(entity, 1);
    clientfield::set("robot_mind_control", 0);
    /#
        if (getdvarint(#"hash_48cc90bd943a9960", 0)) {
            entity ai::set_behavior_attribute("rbJuke", "left_leg_upper");
        }
    #/
    entity thread function_7254ca9e(entity);
    aiutility::addaioverridedamagecallback(entity, &destructserverutils::handledamage);
    aiutility::addaioverridedamagecallback(entity, &function_34fb94b5);
    aiutility::addaioverridedamagecallback(entity, &function_69afabac);
    aiutility::addaioverridedamagecallback(entity, &function_532b620b);
    aiutility::addaioverridekilledcallback(entity, &function_5cdb3a8f);
    aiutility::addaioverridekilledcallback(entity, &function_668ebe68);
    aiutility::addaioverridekilledcallback(entity, &function_ca6332ee);
    /#
        if (getdvarint(#"hash_553d14e9f29a8fc", 0) == 1) {
            entity ai::set_behavior_attribute("torso_upper", "_robot_locomotion_type");
        } else if (getdvarint(#"hash_553d14e9f29a8fc", 0) == 2) {
            entity ai::set_behavior_attribute("torso_upper", "<unknown string>");
        } else if (getdvarint(#"hash_553d14e9f29a8fc", 0) == 3) {
            entity ai::set_behavior_attribute("torso_upper", "<unknown string>");
        }
        if (getdvarint(#"hash_5e96d2c972436347", 0) == 1) {
            entity ai::set_behavior_attribute("torso_upper", "<unknown string>");
        } else if (getdvarint(#"hash_5e96d2c972436347", 0) == 2) {
            entity ai::set_behavior_attribute("torso_upper", "<unknown string>");
        } else if (getdvarint(#"hash_5e96d2c972436347", 0) == 3) {
            entity ai::set_behavior_attribute("torso_upper", "<unknown string>");
        }
    #/
    if (getdvarint(#"hash_7f04ff36b21ec3f1", 0) == 1) {
        entity ai::set_behavior_attribute("force_crawler", "gib_legs");
    } else if (getdvarint(#"hash_7f04ff36b21ec3f1", 0) == 2) {
        entity ai::set_behavior_attribute("force_crawler", "remove_legs");
    }
}

// Namespace namespace_8234b281/archetype_robot
// Params 1, eflags: 0x4
// Checksum 0x6a5bf866, Offset: 0xd838
// Size: 0xd2
function private function_e9c4fa92(entity) {
    if (isdefined(entity) && !isdefined(entity.wasp)) {
        wasp = spawn("script_model", (0, 0, 0));
        wasp setmodel(#"hash_719b04f58757959a");
        wasp setscale(0.75);
        wasp linkto(entity, "j_spine4", (5, -15, 0), vectorscale((0, 0, 1), 90));
        entity.wasp = wasp;
    }
}

// Namespace namespace_8234b281/archetype_robot
// Params 1, eflags: 0x4
// Checksum 0x756c6fc, Offset: 0xd918
// Size: 0x136
function private function_3a6b890c(entity) {
    entity endon(#"death");
    wait(randomfloatrange(7, 10));
    if (isdefined(entity) && isdefined(entity.wasp)) {
        var_b522f590 = (5, -15, 0);
        while (!ispointinnavvolume(entity.wasp.origin + var_b522f590, "small volume")) {
            wait(1);
        }
        entity.wasp unlink();
        wasp = spawnvehicle("spawner_bo3_wasp_enemy", entity.wasp.origin + var_b522f590, (0, 0, 0));
        entity.wasp delete();
    }
    entity.wasp = undefined;
}

// Namespace namespace_8234b281/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xf354bf0b, Offset: 0xda58
// Size: 0x4c
function private function_14d9e581(entity) {
    entity endon(#"death");
    wait(randomfloatrange(20, 30));
    raps::detonate();
}

// Namespace namespace_8234b281/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xc66926e7, Offset: 0xdab0
// Size: 0x56
function private becomecrawler(entity) {
    if (!namespace_6d47088::function_9e4b1ae3(entity) && entity ai::get_behavior_attribute("can_become_crawler")) {
        entity.becomecrawler = 1;
    }
}

// Namespace namespace_8234b281/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x90b1a83f, Offset: 0xdb10
// Size: 0x7e
function private function_7254ca9e(entity) {
    entity waittill(#"death");
    if (!isdefined(entity)) {
        return;
    }
    if (isdefined(entity.var_4ed804f6)) {
        entity.var_4ed804f6 = undefined;
    }
    if (isdefined(entity.wasp)) {
        entity.wasp delete();
        entity.wasp = undefined;
    }
}

// Namespace namespace_8234b281/archetype_robot
// Params 0, eflags: 0x5 linked
// Checksum 0xc3091ea2, Offset: 0xdb98
// Size: 0x7c
function private function_37b663f() {
    entity = self;
    if (entity.controllevel >= 1) {
        return;
    }
    entity.controllevel = 1;
    clientfield::set("robot_mind_control", 1);
    entity ai::set_behavior_attribute("rogue_control", "level_1");
}

// Namespace namespace_8234b281/archetype_robot
// Params 0, eflags: 0x5 linked
// Checksum 0xc5f2dc48, Offset: 0xdc20
// Size: 0x294
function private function_1dc49ad9() {
    entity = self;
    if (entity.controllevel >= 2) {
        return;
    }
    var_3a7b75d3 = getweapon(#"hash_78ab67bd5c48dab1");
    locomotiontypes = array("alt1", "alt2", "alt3", "alt4", "alt5");
    entity setblackboardattribute("_robot_locomotion_type", locomotiontypes[randomint(locomotiontypes.size)]);
    entity asmsetanimationrate(randomfloatrange(0.95, 1.05));
    entity function_37b663f();
    entity.combatmode = "no_cover";
    entity setavoidancemask("avoid none");
    entity.controllevel = 2;
    entity shared::placeweaponon(entity.weapon, "none");
    entity.meleeweapon = var_3a7b75d3;
    entity.dontdropweapon = 1;
    entity.ignorepathenemyfightdist = 1;
    if (entity ai::get_behavior_attribute("rogue_allow_predestruct")) {
        destructserverutils::destructrandompieces(entity);
    }
    if (entity.health > entity.maxhealth * 0.6) {
        entity.health = int(entity.maxhealth * 0.6);
    }
    clientfield::set("robot_mind_control", 2);
    entity ai::set_behavior_attribute("rogue_control", "level_2");
    entity ai::set_behavior_attribute("can_become_crawler", 0);
}

// Namespace namespace_8234b281/archetype_robot
// Params 0, eflags: 0x5 linked
// Checksum 0xdede6857, Offset: 0xdec0
// Size: 0x8c
function private function_2f113d72() {
    entity = self;
    if (entity.controllevel >= 3) {
        return;
    }
    function_1dc49ad9();
    entity.controllevel = 3;
    clientfield::set("robot_mind_control", 3);
    entity ai::set_behavior_attribute("rogue_control", "level_3");
}

// Namespace namespace_8234b281/archetype_robot
// Params 4, eflags: 0x1 linked
// Checksum 0xd5cb1834, Offset: 0xdf58
// Size: 0x32
function function_b292e047(entity, attribute, oldvalue, value) {
    entity.var_4ed804f6 = value;
}

// Namespace namespace_8234b281/archetype_robot
// Params 4, eflags: 0x1 linked
// Checksum 0x46c3ef21, Offset: 0xdf98
// Size: 0x104
function function_6bc4029a(entity, attribute, oldvalue, value) {
    if (value == 3) {
        clientfield::set("robot_lights", 3);
    } else if (value == 0) {
        clientfield::set("robot_lights", 0);
    } else if (value == 1) {
        clientfield::set("robot_lights", 1);
    } else if (value == 2) {
        clientfield::set("robot_lights", 2);
    } else if (value == 4) {
        clientfield::set("robot_lights", 4);
    }
}

// Namespace namespace_8234b281/archetype_robot
// Params 1, eflags: 0x1 linked
// Checksum 0xcd7c3768, Offset: 0xe0a8
// Size: 0xf4
function function_51e0082b(entity) {
    gibserverutils::togglespawngibs(entity, 0);
    if (math::cointoss()) {
        if (math::cointoss()) {
            gibserverutils::gibrightarm(entity);
        } else if (math::cointoss()) {
            gibserverutils::gibleftarm(entity);
        }
    } else if (math::cointoss()) {
        gibserverutils::gibleftarm(entity);
    } else if (math::cointoss()) {
        gibserverutils::gibrightarm(entity);
    }
}

// Namespace namespace_8234b281/archetype_robot
// Params 4, eflags: 0x1 linked
// Checksum 0xacc4eead, Offset: 0xe1a8
// Size: 0x182
function function_f05545e(entity, attribute, oldvalue, value) {
    switch (value) {
    case #"forced_level_1":
        if (entity.controllevel <= 0) {
            function_37b663f();
        }
        break;
    case #"forced_level_2":
        if (entity.controllevel <= 1) {
            function_1dc49ad9();
            destructserverutils::togglespawngibs(entity, 0);
            if (entity ai::get_behavior_attribute("rogue_allow_pregib")) {
                function_51e0082b(entity);
            }
        }
        break;
    case #"forced_level_3":
        if (entity.controllevel <= 2) {
            function_2f113d72();
            destructserverutils::togglespawngibs(entity, 0);
            if (entity ai::get_behavior_attribute("rogue_allow_pregib")) {
                function_51e0082b(entity);
            }
        }
        break;
    }
}

// Namespace namespace_8234b281/archetype_robot
// Params 4, eflags: 0x1 linked
// Checksum 0x92605e1f, Offset: 0xe338
// Size: 0x152
function function_a5976cc9(entity, attribute, oldvalue, value) {
    entity.ignorepathenemyfightdist = 0;
    entity setblackboardattribute("_move_mode", "normal");
    if (value != "guard") {
        entity.var_e5ed4cac = undefined;
    }
    switch (value) {
    case #"normal":
        break;
    case #"rambo":
        entity.ignorepathenemyfightdist = 1;
        break;
    case #"marching":
        entity.ignorepathenemyfightdist = 1;
        entity setblackboardattribute("_move_mode", "marching");
        break;
    case #"rusher":
        if (!entity ai::get_behavior_attribute("can_become_rusher")) {
            entity ai::set_behavior_attribute("move_mode", oldvalue);
        }
        break;
    }
}

// Namespace namespace_8234b281/archetype_robot
// Params 4, eflags: 0x1 linked
// Checksum 0xedad1a46, Offset: 0xe498
// Size: 0x25c
function function_790b144e(entity, attribute, oldvalue, value) {
    if (namespace_6d47088::function_9e4b1ae3(entity)) {
        return;
    }
    if (!entity ai::get_behavior_attribute("can_become_crawler")) {
        return;
    }
    switch (value) {
    case #"normal":
        return;
    case #"hash_20f8ca59cae1ff63":
        gibserverutils::togglespawngibs(entity, 1);
        destructserverutils::togglespawngibs(entity, 1);
        break;
    case #"hash_3136b3a5fd89efd3":
        gibserverutils::togglespawngibs(entity, 0);
        destructserverutils::togglespawngibs(entity, 0);
        break;
    }
    if (value == "gib_legs" || value == "remove_legs") {
        if (math::cointoss()) {
            if (math::cointoss()) {
                gibserverutils::gibrightleg(entity);
            } else {
                gibserverutils::gibleftleg(entity);
            }
        } else {
            gibserverutils::giblegs(entity);
        }
        if (entity.health > entity.maxhealth * 0.25) {
            entity.health = int(entity.maxhealth * 0.25);
        }
        destructserverutils::destructrandompieces(entity);
        if (value == "gib_legs") {
            becomecrawler(entity);
        } else {
            namespace_6d47088::function_1a78ffb(entity);
        }
    }
}

// Namespace namespace_8234b281/archetype_robot
// Params 4, eflags: 0x1 linked
// Checksum 0xe47ae4cb, Offset: 0xe700
// Size: 0x10c
function function_cc3df458(entity, attribute, oldvalue, value) {
    if (!isvec(value)) {
        return;
    }
    var_5bb85acc = isinarray(array("level_2", "level_3"), entity ai::get_behavior_attribute("rogue_control"));
    if (!var_5bb85acc) {
        entity ai::set_behavior_attribute("rogue_control_force_goal", undefined);
    } else {
        entity.favoriteenemy = undefined;
        entity clearpath();
        entity function_a57c34b7(entity ai::get_behavior_attribute("rogue_control_force_goal"));
    }
}

// Namespace namespace_8234b281/archetype_robot
// Params 4, eflags: 0x1 linked
// Checksum 0x5b78a310, Offset: 0xe818
// Size: 0xe2
function function_54f8cd56(entity, attribute, oldvalue, value) {
    switch (value) {
    case #"walk":
        entity setblackboardattribute("_locomotion_speed", "locomotion_speed_walk");
        break;
    case #"run":
        entity setblackboardattribute("_locomotion_speed", "locomotion_speed_run");
        break;
    case #"sprint":
        entity setblackboardattribute("_locomotion_speed", "locomotion_speed_sprint");
        break;
    }
}

// Namespace namespace_8234b281/archetype_robot
// Params 4, eflags: 0x1 linked
// Checksum 0x4bbd6c7c, Offset: 0xe908
// Size: 0x7a
function function_94fa0836(entity, attribute, oldvalue, value) {
    switch (value) {
    case #"normal":
        entity.manualtraversemode = 0;
        break;
    case #"hash_3d4b552e80b9af02":
        entity.manualtraversemode = 1;
        break;
    }
}

// Namespace namespace_8234b281/archetype_robot
// Params 4, eflags: 0x1 linked
// Checksum 0x88981536, Offset: 0xe990
// Size: 0x4a
function disablesprintcallback(entity, attribute, oldvalue, value) {
    if (value) {
        entity.disablesprint = 1;
    } else {
        entity.disablesprint = 0;
    }
}

// Namespace namespace_8234b281/archetype_robot
// Params 4, eflags: 0x1 linked
// Checksum 0xbb6561c7, Offset: 0xe9e8
// Size: 0x4a
function forcesprintcallback(entity, attribute, oldvalue, value) {
    if (value) {
        entity.forcesprint = 1;
    } else {
        entity.forcesprint = 0;
    }
}

