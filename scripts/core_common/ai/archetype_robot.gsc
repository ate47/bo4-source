// Atian COD Tools GSC decompiler test
#using scripts\core_common\vehicles\raps.gsc;
#using scripts\core_common\ai\systems\shared.gsc;
#using scripts\core_common\ai\systems\gib.gsc;
#using scripts\core_common\ai\systems\destructible_character.gsc;
#using scripts\core_common\ai\systems\blackboard.gsc;
#using scripts\core_common\ai\systems\behavior_tree_utility.gsc;
#using scripts\core_common\ai\systems\behavior_state_machine.gsc;
#using scripts\core_common\ai\systems\animation_state_machine_utility.gsc;
#using scripts\core_common\ai\systems\animation_state_machine_mocomp.gsc;
#using scripts\core_common\ai\systems\ai_squads.gsc;
#using scripts\core_common\ai\systems\ai_interface.gsc;
#using scripts\core_common\ai\systems\ai_blackboard.gsc;
#using scripts\core_common\ai\archetype_utility.gsc;
#using script_3819e7a1427df6d2;
#using scripts\core_common\ai\archetype_robot_interface.gsc;
#using scripts\core_common\ai\archetype_locomotion_utility.gsc;
#using scripts\core_common\ai\archetype_cover_utility.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\ai_shared.gsc;

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
    spawner::add_archetype_spawn_function(#"robot", &robotsoldierbehavior::archetyperobotblackboardinit);
    spawner::add_archetype_spawn_function(#"robot", &robotsoldierbehavior::function_125cc705);
    spawner::add_archetype_spawn_function(#"robot", &robotsoldierserverutils::robotsoldierspawnsetup);
    if (ai::shouldregisterclientfieldforarchetype(#"robot")) {
        clientfield::register("actor", "robot_mind_control", 1, 2, "int");
        clientfield::register("actor", "robot_mind_control_explosion", 1, 1, "int");
        clientfield::register("actor", "robot_lights", 1, 3, "int");
        clientfield::register("actor", "robot_EMP", 1, 1, "int");
    }
    robotinterface::registerrobotinterfaceattributes();
    robotsoldierbehavior::registerbehaviorscriptfunctions();
}

#namespace robotsoldierbehavior;

// Namespace robotsoldierbehavior/archetype_robot
// Params 0, eflags: 0x1 linked
// Checksum 0xa0a55d1f, Offset: 0x1338
// Size: 0x2834
function registerbehaviorscriptfunctions() {
    /#
        assert(!isdefined(&stepintoinitialize) || isscriptfunctionptr(&stepintoinitialize));
    #/
    /#
        assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
    #/
    /#
        assert(!isdefined(&stepintoterminate) || isscriptfunctionptr(&stepintoterminate));
    #/
    behaviortreenetworkutility::registerbehaviortreeaction("robotStepIntoAction", &stepintoinitialize, undefined, &stepintoterminate);
    /#
        assert(!isdefined(&stepoutinitialize) || isscriptfunctionptr(&stepoutinitialize));
    #/
    /#
        assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
    #/
    /#
        assert(!isdefined(&stepoutterminate) || isscriptfunctionptr(&stepoutterminate));
    #/
    behaviortreenetworkutility::registerbehaviortreeaction("robotStepOutAction", &stepoutinitialize, undefined, &stepoutterminate);
    /#
        assert(!isdefined(&takeoverinitialize) || isscriptfunctionptr(&takeoverinitialize));
    #/
    /#
        assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
    #/
    /#
        assert(!isdefined(&takeoverterminate) || isscriptfunctionptr(&takeoverterminate));
    #/
    behaviortreenetworkutility::registerbehaviortreeaction("robotTakeOverAction", &takeoverinitialize, undefined, &takeoverterminate);
    /#
        assert(!isdefined(&robotempidleinitialize) || isscriptfunctionptr(&robotempidleinitialize));
    #/
    /#
        assert(!isdefined(&robotempidleupdate) || isscriptfunctionptr(&robotempidleupdate));
    #/
    /#
        assert(!isdefined(&robotempidleterminate) || isscriptfunctionptr(&robotempidleterminate));
    #/
    behaviortreenetworkutility::registerbehaviortreeaction("robotEmpIdleAction", &robotempidleinitialize, &robotempidleupdate, &robotempidleterminate);
    /#
        assert(isscriptfunctionptr(&robotbecomecrawler));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotBecomeCrawler", &robotbecomecrawler);
    /#
        assert(isscriptfunctionptr(&robotdropstartingweapon));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotDropStartingWeapon", &robotdropstartingweapon);
    /#
        assert(isscriptfunctionptr(&robotdonttakecover));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotDontTakeCover", &robotdonttakecover);
    /#
        assert(isscriptfunctionptr(&robotcoveroverinitialize));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotCoverOverInitialize", &robotcoveroverinitialize);
    /#
        assert(isscriptfunctionptr(&robotcoveroverterminate));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotCoverOverTerminate", &robotcoveroverterminate);
    /#
        assert(isscriptfunctionptr(&robotexplode));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotExplode", &robotexplode);
    /#
        assert(isscriptfunctionptr(&robotexplodeterminate));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotExplodeTerminate", &robotexplodeterminate);
    /#
        assert(isscriptfunctionptr(&robotdeployminiraps));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotDeployMiniRaps", &robotdeployminiraps);
    /#
        assert(isscriptfunctionptr(&movetoplayerupdate));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotMoveToPlayer", &movetoplayerupdate);
    /#
        assert(isscriptfunctionptr(&robotstartsprint));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotStartSprint", &robotstartsprint);
    /#
        assert(isscriptfunctionptr(&robotstartsprint));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal("robotStartSprint", &robotstartsprint);
    /#
        assert(isscriptfunctionptr(&robotstartsupersprint));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotStartSuperSprint", &robotstartsupersprint);
    /#
        assert(isscriptfunctionptr(&robottacticalwalkactionstart));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotTacticalWalkActionStart", &robottacticalwalkactionstart);
    /#
        assert(isscriptfunctionptr(&robottacticalwalkactionstart));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal("robotTacticalWalkActionStart", &robottacticalwalkactionstart);
    /#
        assert(isscriptfunctionptr(&robotdie));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotDie", &robotdie);
    /#
        assert(isscriptfunctionptr(&robotcleanupchargemeleeattack));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotCleanupChargeMeleeAttack", &robotcleanupchargemeleeattack);
    /#
        assert(isscriptfunctionptr(&robotismoving));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotIsMoving", &robotismoving);
    /#
        assert(isscriptfunctionptr(&robotabletoshootcondition));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotAbleToShoot", &robotabletoshootcondition);
    /#
        assert(isscriptfunctionptr(&robotcrawlercanshootenemy));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotCrawlerCanShootEnemy", &robotcrawlercanshootenemy);
    /#
        assert(isscriptfunctionptr(&canmovetoenemycondition));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("canMoveToEnemy", &canmovetoenemycondition);
    /#
        assert(isscriptfunctionptr(&canmoveclosetoenemycondition));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("canMoveCloseToEnemy", &canmoveclosetoenemycondition);
    /#
        assert(isscriptfunctionptr(&hasminiraps));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("hasMiniRaps", &hasminiraps);
    /#
        assert(isscriptfunctionptr(&robotisatcovercondition));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotIsAtCover", &robotisatcovercondition);
    /#
        assert(isscriptfunctionptr(&robotshouldtacticalwalk));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotShouldTacticalWalk", &robotshouldtacticalwalk);
    /#
        assert(isscriptfunctionptr(&robothascloseenemytomelee));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotHasCloseEnemyToMelee", &robothascloseenemytomelee);
    /#
        assert(isscriptfunctionptr(&robothasenemytomelee));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotHasEnemyToMelee", &robothasenemytomelee);
    /#
        assert(isscriptfunctionptr(&robotroguehascloseenemytomelee));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotRogueHasCloseEnemyToMelee", &robotroguehascloseenemytomelee);
    /#
        assert(isscriptfunctionptr(&robotroguehasenemytomelee));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotRogueHasEnemyToMelee", &robotroguehasenemytomelee);
    /#
        assert(isscriptfunctionptr(&robotiscrawler));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotIsCrawler", &robotiscrawler);
    /#
        assert(isscriptfunctionptr(&robotismarching));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotIsMarching", &robotismarching);
    /#
        assert(isscriptfunctionptr(&robotprepareforadjusttocover));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotPrepareForAdjustToCover", &robotprepareforadjusttocover);
    /#
        assert(isscriptfunctionptr(&robotshouldadjusttocover));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotShouldAdjustToCover", &robotshouldadjusttocover);
    /#
        assert(isscriptfunctionptr(&robotshouldbecomecrawler));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotShouldBecomeCrawler", &robotshouldbecomecrawler);
    /#
        assert(isscriptfunctionptr(&robotshouldreactatcover));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotShouldReactAtCover", &robotshouldreactatcover);
    /#
        assert(isscriptfunctionptr(&robotshouldexplode));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotShouldExplode", &robotshouldexplode);
    /#
        assert(isscriptfunctionptr(&robotshouldshutdown));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotShouldShutdown", &robotshouldshutdown);
    /#
        assert(isscriptfunctionptr(&robotsupportsovercover));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotSupportsOverCover", &robotsupportsovercover);
    /#
        assert(isscriptfunctionptr(&shouldstepincondition));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("shouldStepIn", &shouldstepincondition);
    /#
        assert(isscriptfunctionptr(&shouldtakeovercondition));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("shouldTakeOver", &shouldtakeovercondition);
    /#
        assert(isscriptfunctionptr(&supportsstepoutcondition));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("supportsStepOut", &supportsstepoutcondition);
    /#
        assert(isscriptfunctionptr(&setdesiredstancetostand));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("setDesiredStanceToStand", &setdesiredstancetostand);
    /#
        assert(isscriptfunctionptr(&setdesiredstancetocrouch));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("setDesiredStanceToCrouch", &setdesiredstancetocrouch);
    /#
        assert(isscriptfunctionptr(&toggledesiredstance));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("toggleDesiredStance", &toggledesiredstance);
    /#
        assert(isscriptfunctionptr(&robotmovement));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotMovement", &robotmovement);
    /#
        assert(isscriptfunctionptr(&robotdelaymovement));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotDelayMovement", &robotdelaymovement);
    /#
        assert(isscriptfunctionptr(&robotinvalidatecover));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotInvalidateCover", &robotinvalidatecover);
    /#
        assert(isscriptfunctionptr(&robotshouldchargemelee));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotShouldChargeMelee", &robotshouldchargemelee);
    /#
        assert(isscriptfunctionptr(&robotshouldmelee));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotShouldMelee", &robotshouldmelee);
    /#
        assert(isscriptfunctionptr(&scriptrequirestosprintcondition));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotScriptRequiresToSprint", &scriptrequirestosprintcondition);
    /#
        assert(isscriptfunctionptr(&robotscanexposedpainterminate));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotScanExposedPainTerminate", &robotscanexposedpainterminate);
    /#
        assert(isscriptfunctionptr(&robottookempdamage));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotTookEmpDamage", &robottookempdamage);
    /#
        assert(isscriptfunctionptr(&robotnocloseenemyservice));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotNoCloseEnemyService", &robotnocloseenemyservice);
    /#
        assert(isscriptfunctionptr(&robotwithinsprintrange));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotWithinSprintRange", &robotwithinsprintrange);
    /#
        assert(isscriptfunctionptr(&robotwithinsupersprintrange));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotWithinSuperSprintRange", &robotwithinsupersprintrange);
    /#
        assert(isscriptfunctionptr(&robotwithinsupersprintrange));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal("robotWithinSuperSprintRange", &robotwithinsupersprintrange);
    /#
        assert(isscriptfunctionptr(&robotoutsidetacticalwalkrange));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotOutsideTacticalWalkRange", &robotoutsidetacticalwalkrange);
    /#
        assert(isscriptfunctionptr(&robotoutsidesprintrange));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotOutsideSprintRange", &robotoutsidesprintrange);
    /#
        assert(isscriptfunctionptr(&robotoutsidesupersprintrange));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotOutsideSuperSprintRange", &robotoutsidesupersprintrange);
    /#
        assert(isscriptfunctionptr(&robotoutsidesupersprintrange));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal("robotOutsideSuperSprintRange", &robotoutsidesupersprintrange);
    /#
        assert(isscriptfunctionptr(&robotlightsoff));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotLightsOff", &robotlightsoff);
    /#
        assert(isscriptfunctionptr(&robotlightsflicker));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotLightsFlicker", &robotlightsflicker);
    /#
        assert(isscriptfunctionptr(&robotlightson));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotLightsOn", &robotlightson);
    /#
        assert(isscriptfunctionptr(&robotshouldgibdeath));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotShouldGibDeath", &robotshouldgibdeath);
    /#
        assert(!isdefined(&robottraversestart) || isscriptfunctionptr(&robottraversestart));
    #/
    /#
        assert(!isdefined(&robotproceduraltraversalupdate) || isscriptfunctionptr(&robotproceduraltraversalupdate));
    #/
    /#
        assert(!isdefined(&robottraverseragdollondeath) || isscriptfunctionptr(&robottraverseragdollondeath));
    #/
    behaviortreenetworkutility::registerbehaviortreeaction("robotProceduralTraversal", &robottraversestart, &robotproceduraltraversalupdate, &robottraverseragdollondeath);
    /#
        assert(isscriptfunctionptr(&robotcalcproceduraltraversal));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotCalcProceduralTraversal", &robotcalcproceduraltraversal);
    /#
        assert(isscriptfunctionptr(&robotprocedurallandingupdate));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotProceduralLanding", &robotprocedurallandingupdate);
    /#
        assert(isscriptfunctionptr(&robottraverseend));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotTraverseEnd", &robottraverseend);
    /#
        assert(isscriptfunctionptr(&robottraverseragdollondeath));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotTraverseRagdollOnDeath", &robottraverseragdollondeath);
    /#
        assert(isscriptfunctionptr(&robotshouldproceduraltraverse));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotShouldProceduralTraverse", &robotshouldproceduraltraverse);
    /#
        assert(isscriptfunctionptr(&robotwallruntraverse));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotWallrunTraverse", &robotwallruntraverse);
    /#
        assert(isscriptfunctionptr(&robotshouldwallrun));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotShouldWallrun", &robotshouldwallrun);
    /#
        assert(isscriptfunctionptr(&robotsetupwallrunjump));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotSetupWallRunJump", &robotsetupwallrunjump);
    /#
        assert(isscriptfunctionptr(&robotsetupwallrunland));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotSetupWallRunLand", &robotsetupwallrunland);
    /#
        assert(isscriptfunctionptr(&robotwallrunstart));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotWallrunStart", &robotwallrunstart);
    /#
        assert(isscriptfunctionptr(&robotwallrunend));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotWallrunEnd", &robotwallrunend);
    /#
        assert(isscriptfunctionptr(&robotcanjuke));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotCanJuke", &robotcanjuke);
    /#
        assert(isscriptfunctionptr(&robotcantacticaljuke));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotCanTacticalJuke", &robotcantacticaljuke);
    /#
        assert(isscriptfunctionptr(&robotcanpreemptivejuke));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotCanPreemptiveJuke", &robotcanpreemptivejuke);
    /#
        assert(isscriptfunctionptr(&robotjukeinitialize));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotJukeInitialize", &robotjukeinitialize);
    /#
        assert(isscriptfunctionptr(&robotpreemptivejuketerminate));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotPreemptiveJukeTerminate", &robotpreemptivejuketerminate);
    /#
        assert(isscriptfunctionptr(&robotcoverscaninitialize));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotCoverScanInitialize", &robotcoverscaninitialize);
    /#
        assert(isscriptfunctionptr(&robotcoverscanterminate));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotCoverScanTerminate", &robotcoverscanterminate);
    /#
        assert(isscriptfunctionptr(&robotisatcovermodescan));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotIsAtCoverModeScan", &robotisatcovermodescan);
    /#
        assert(isscriptfunctionptr(&robotexposedcoverservice));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotExposedCoverService", &robotexposedcoverservice);
    /#
        assert(isscriptfunctionptr(&robotpositionservice));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotPositionService", &robotpositionservice, 1);
    /#
        assert(isscriptfunctionptr(&robottargetservice));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotTargetService", &robottargetservice);
    /#
        assert(isscriptfunctionptr(&robottryreacquireservice));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotTryReacquireService", &robottryreacquireservice);
    /#
        assert(isscriptfunctionptr(&robotrushenemyservice));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotRushEnemyService", &robotrushenemyservice);
    /#
        assert(isscriptfunctionptr(&robotrushneighborservice));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotRushNeighborService", &robotrushneighborservice);
    /#
        assert(isscriptfunctionptr(&robotcrawlerservice));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotCrawlerService", &robotcrawlerservice);
    /#
        assert(isscriptfunctionptr(&movetoplayerupdate));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("robotMoveToPlayerService", &movetoplayerupdate);
    animationstatenetwork::registeranimationmocomp("robot_procedural_traversal", &mocomprobotproceduraltraversalinit, &mocomprobotproceduraltraversalupdate, &mocomprobotproceduraltraversalterminate);
    animationstatenetwork::registeranimationmocomp("robot_start_traversal", &mocomprobotstarttraversalinit, undefined, &mocomprobotstarttraversalterminate);
    animationstatenetwork::registeranimationmocomp("robot_start_wallrun", &mocomprobotstartwallruninit, &mocomprobotstartwallrunupdate, &mocomprobotstartwallrunterminate);
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x1 linked
// Checksum 0x3cbb5eda, Offset: 0x3b78
// Size: 0x5c
function robotcleanupchargemeleeattack(behaviortreeentity) {
    aiutility::meleereleasemutex(behaviortreeentity);
    aiutility::releaseclaimnode(behaviortreeentity);
    behaviortreeentity setblackboardattribute("_melee_enemy_type", undefined);
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 2, eflags: 0x5 linked
// Checksum 0xaac5530c, Offset: 0x3be0
// Size: 0x58
function private robotlightsoff(entity, asmstatename) {
    entity ai::set_behavior_attribute("robot_lights", 2);
    clientfield::set("robot_EMP", 1);
    return 4;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 2, eflags: 0x5 linked
// Checksum 0x8ae4371a, Offset: 0x3c40
// Size: 0x6c
function private robotlightsflicker(entity, asmstatename) {
    entity ai::set_behavior_attribute("robot_lights", 1);
    clientfield::set("robot_EMP", 1);
    entity notify(#"emp_fx_start");
    return 4;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 2, eflags: 0x5 linked
// Checksum 0xfd1769fa, Offset: 0x3cb8
// Size: 0x50
function private robotlightson(entity, asmstatename) {
    entity ai::set_behavior_attribute("robot_lights", 0);
    clientfield::set("robot_EMP", 0);
    return 4;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 2, eflags: 0x5 linked
// Checksum 0x392ea542, Offset: 0x3d10
// Size: 0x1e
function private robotshouldgibdeath(entity, asmstatename) {
    return entity.gibdeath;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 2, eflags: 0x5 linked
// Checksum 0xede27242, Offset: 0x3d38
// Size: 0x5c
function private robotempidleinitialize(entity, asmstatename) {
    entity.empstoptime = gettime() + entity.empshutdowntime;
    animationstatenetworkutility::requeststate(entity, asmstatename);
    entity notify(#"emp_shutdown_start");
    return 5;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 2, eflags: 0x5 linked
// Checksum 0xc2934a6a, Offset: 0x3da0
// Size: 0x8e
function private robotempidleupdate(entity, asmstatename) {
    if (gettime() < entity.empstoptime || entity ai::get_behavior_attribute("shutdown")) {
        if (entity asmgetstatus() == "asm_status_complete") {
            animationstatenetworkutility::requeststate(entity, asmstatename);
        }
        return 5;
    }
    return 4;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 2, eflags: 0x5 linked
// Checksum 0x2a1dd90d, Offset: 0x3e38
// Size: 0x2c
function private robotempidleterminate(entity, asmstatename) {
    entity notify(#"emp_shutdown_end");
    return 4;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 2, eflags: 0x5 linked
// Checksum 0xdd9656bd, Offset: 0x3e70
// Size: 0xd8
function private robotproceduraltraversalupdate(entity, asmstatename) {
    /#
        assert(isdefined(entity.traversal));
    #/
    traversal = entity.traversal;
    t = min((gettime() - traversal.starttime) / traversal.totaltime, 1);
    curveremaining = traversal.curvelength * (1 - t);
    if (curveremaining < traversal.landingdistance) {
        traversal.landing = 1;
        return 4;
    }
    return 5;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 2, eflags: 0x5 linked
// Checksum 0x3e9742c4, Offset: 0x3f50
// Size: 0x40
function private robotprocedurallandingupdate(entity, asmstatename) {
    if (isdefined(entity.traversal)) {
        entity finishtraversal();
    }
    return 5;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 2, eflags: 0x5 linked
// Checksum 0x952815ea, Offset: 0x3f98
// Size: 0xa32
function private robotcalcproceduraltraversal(entity, asmstatename) {
    if (!isdefined(entity.traversestartnode) || !isdefined(entity.traverseendnode)) {
        return 1;
    }
    entity.traversal = spawnstruct();
    traversal = entity.traversal;
    traversal.landingdistance = 24;
    traversal.minimumspeed = 18;
    traversal.startnode = entity.traversestartnode;
    traversal.endnode = entity.traverseendnode;
    startiswallrun = traversal.startnode.spawnflags & 2048;
    endiswallrun = traversal.endnode.spawnflags & 2048;
    traversal.startpoint1 = entity.origin;
    traversal.endpoint1 = traversal.endnode.origin;
    if (endiswallrun) {
        facenormal = getnavmeshfacenormal(traversal.endpoint1, 30);
        traversal.endpoint1 = traversal.endpoint1 + facenormal * 30 / 2;
    }
    if (!isdefined(traversal.endpoint1)) {
        traversal.endpoint1 = traversal.endnode.origin;
    }
    traversal.distancetoend = distance(traversal.startpoint1, traversal.endpoint1);
    traversal.absheighttoend = abs(traversal.startpoint1[2] - traversal.endpoint1[2]);
    traversal.abslengthtoend = distance2d(traversal.startpoint1, traversal.endpoint1);
    speedboost = 0;
    if (traversal.abslengthtoend > 200) {
        speedboost = 16;
    } else if (traversal.abslengthtoend > 120) {
        speedboost = 8;
    } else if (traversal.abslengthtoend > 80 || traversal.absheighttoend > 80) {
        speedboost = 4;
    }
    if (isdefined(entity.traversalspeedboost)) {
        speedboost = entity [[ entity.traversalspeedboost ]]();
    }
    traversal.speedoncurve = (traversal.minimumspeed + speedboost) * 12;
    heightoffset = max(traversal.absheighttoend * 0.8, min(traversal.abslengthtoend, 96));
    traversal.startpoint2 = entity.origin + (0, 0, heightoffset);
    traversal.endpoint2 = traversal.endpoint1 + (0, 0, heightoffset);
    if (traversal.startpoint1[2] < traversal.endpoint1[2]) {
        traversal.startpoint2 = traversal.startpoint2 + (0, 0, traversal.absheighttoend);
    } else {
        traversal.endpoint2 = traversal.endpoint2 + (0, 0, traversal.absheighttoend);
    }
    if (startiswallrun || endiswallrun) {
        startdirection = robotstartjumpdirection();
        enddirection = robotendjumpdirection();
        if (startdirection == "out") {
            point2scale = 0.5;
            towardend = (traversal.endnode.origin - entity.origin) * point2scale;
            traversal.startpoint2 = entity.origin + (towardend[0], towardend[1], 0);
            traversal.endpoint2 = traversal.endpoint1 + (0, 0, traversal.absheighttoend * point2scale);
            traversal.angles = entity.angles;
        }
        if (enddirection == "in") {
            point2scale = 0.5;
            towardstart = (entity.origin - traversal.endnode.origin) * point2scale;
            traversal.startpoint2 = entity.origin + (0, 0, traversal.absheighttoend * point2scale);
            traversal.endpoint2 = traversal.endnode.origin + (towardstart[0], towardstart[1], 0);
            facenormal = getnavmeshfacenormal(traversal.endnode.origin, 30);
            direction = _calculatewallrundirection(traversal.startnode.origin, traversal.endnode.origin);
            movedirection = vectorcross(facenormal, (0, 0, 1));
            if (direction == "right") {
                movedirection = movedirection * -1;
            }
            traversal.angles = vectortoangles(movedirection);
        }
        if (endiswallrun) {
            traversal.landingdistance = 110;
        } else {
            traversal.landingdistance = 60;
        }
        traversal.speedoncurve = traversal.speedoncurve * 1.2;
    }
    /#
        recordline(traversal.startpoint1, traversal.startpoint2, (1, 0.5, 0), "robotScriptRequiresToSprint", entity);
        recordline(traversal.startpoint1, traversal.endpoint1, (1, 0.5, 0), "robotScriptRequiresToSprint", entity);
        recordline(traversal.endpoint1, traversal.endpoint2, (1, 0.5, 0), "robotScriptRequiresToSprint", entity);
        recordline(traversal.startpoint2, traversal.endpoint2, (1, 0.5, 0), "robotScriptRequiresToSprint", entity);
        record3dtext(traversal.abslengthtoend, traversal.endpoint1 + vectorscale((0, 0, 1), 12), (1, 0.5, 0), "robotScriptRequiresToSprint", entity);
    #/
    segments = 10;
    previouspoint = traversal.startpoint1;
    traversal.curvelength = 0;
    for (index = 1; index <= segments; index++) {
        t = index / segments;
        nextpoint = calculatecubicbezier(t, traversal.startpoint1, traversal.startpoint2, traversal.endpoint2, traversal.endpoint1);
        /#
            recordline(previouspoint, nextpoint, (0, 1, 0), "robotScriptRequiresToSprint", entity);
        #/
        traversal.curvelength = traversal.curvelength + distance(previouspoint, nextpoint);
        previouspoint = nextpoint;
    }
    traversal.starttime = gettime();
    traversal.endtime = traversal.starttime + traversal.curvelength * 1000 / traversal.speedoncurve;
    traversal.totaltime = traversal.endtime - traversal.starttime;
    traversal.landing = 0;
    return 1;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 2, eflags: 0x5 linked
// Checksum 0x286e37eb, Offset: 0x49d8
// Size: 0xc0
function private robottraversestart(entity, asmstatename) {
    entity.skipdeath = 1;
    traversal = entity.traversal;
    traversal.starttime = gettime();
    traversal.endtime = traversal.starttime + traversal.curvelength * 1000 / traversal.speedoncurve;
    traversal.totaltime = traversal.endtime - traversal.starttime;
    animationstatenetworkutility::requeststate(entity, asmstatename);
    return 5;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x45fcd49d, Offset: 0x4aa0
// Size: 0x54
function private robottraverseend(entity) {
    robottraverseragdollondeath(entity);
    entity.skipdeath = 0;
    entity.traversal = undefined;
    entity notify(#"traverse_end");
    return 4;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 2, eflags: 0x5 linked
// Checksum 0xd28f43fb, Offset: 0x4b00
// Size: 0x48
function private robottraverseragdollondeath(entity, asmstatename) {
    if (!isalive(entity)) {
        entity startragdoll();
    }
    return 4;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xdd12d4b3, Offset: 0x4b50
// Size: 0xa6
function private robotshouldproceduraltraverse(entity) {
    if (isdefined(entity.traversestartnode) && isdefined(entity.traverseendnode)) {
        isprocedural = entity ai::get_behavior_attribute("traversals") == "procedural" || entity.traversestartnode.spawnflags & 1024 || entity.traverseendnode.spawnflags & 1024;
        return isprocedural;
    }
    return 0;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xb234ce49, Offset: 0x4c00
// Size: 0xb2
function private robotwallruntraverse(entity) {
    startnode = entity.traversestartnode;
    endnode = entity.traverseendnode;
    if (isdefined(startnode) && isdefined(endnode) && entity shouldstarttraversal()) {
        startiswallrun = startnode.spawnflags & 2048;
        endiswallrun = endnode.spawnflags & 2048;
        return (startiswallrun || endiswallrun);
    }
    return 0;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x91ee5ce1, Offset: 0x4cc0
// Size: 0x34
function private robotshouldwallrun(entity) {
    return entity getblackboardattribute("_robot_traversal_type") == "wall";
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 5, eflags: 0x5 linked
// Checksum 0xf5c84830, Offset: 0x4d00
// Size: 0xcc
function private mocomprobotstartwallruninit(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    entity setrepairpaths(0);
    entity orientmode("face angle", entity.angles[1]);
    entity.blockingpain = 1;
    entity.clamptonavmesh = 0;
    entity animmode("normal_nogravity", 0);
    entity setavoidancemask("avoid none");
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 5, eflags: 0x5 linked
// Checksum 0x6d08c52b, Offset: 0x4dd8
// Size: 0x1e4
function private mocomprobotstartwallrunupdate(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    facenormal = getnavmeshfacenormal(entity.origin, 30);
    positiononwall = getclosestpointonnavmesh(entity.origin, 30, 0);
    direction = entity getblackboardattribute("_robot_wallrun_direction");
    if (isdefined(facenormal) && isdefined(positiononwall)) {
        facenormal = (facenormal[0], facenormal[1], 0);
        facenormal = vectornormalize(facenormal);
        movedirection = vectorcross(facenormal, (0, 0, 1));
        if (direction == "right") {
            movedirection = movedirection * -1;
        }
        forwardpositiononwall = getclosestpointonnavmesh(positiononwall + movedirection * 12, 30, 0);
        anglestoend = vectortoangles(forwardpositiononwall - positiononwall);
        /#
            recordline(positiononwall, forwardpositiononwall, (1, 0, 0), "robotScriptRequiresToSprint", entity);
        #/
        entity orientmode("face angle", anglestoend[1]);
    }
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 5, eflags: 0x5 linked
// Checksum 0xd0728d53, Offset: 0x4fc8
// Size: 0x82
function private mocomprobotstartwallrunterminate(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    entity setrepairpaths(1);
    entity setavoidancemask("avoid all");
    entity.blockingpain = 0;
    entity.clamptonavmesh = 1;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 5, eflags: 0x5 linked
// Checksum 0xdc0d55cf, Offset: 0x5058
// Size: 0xd2
function private calculatecubicbezier(t, p1, p2, p3, p4) {
    return pow(1 - t, 3) * p1 + 3 * pow(1 - t, 2) * t * p2 + 3 * (1 - t) * pow(t, 2) * p3 + pow(t, 3) * p4;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 5, eflags: 0x5 linked
// Checksum 0xfb41e3ff, Offset: 0x5138
// Size: 0x364
function private mocomprobotstarttraversalinit(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    startnode = entity.traversestartnode;
    startiswallrun = startnode.spawnflags & 2048;
    endnode = entity.traverseendnode;
    endiswallrun = endnode.spawnflags & 2048;
    if (!endiswallrun) {
        angletoend = vectortoangles(entity.traverseendnode.origin - entity.traversestartnode.origin);
        entity orientmode("face angle", angletoend[1]);
        if (startiswallrun) {
            entity animmode("normal_nogravity", 0);
        } else {
            entity animmode("gravity", 0);
        }
    } else {
        facenormal = getnavmeshfacenormal(endnode.origin, 30);
        direction = _calculatewallrundirection(startnode.origin, endnode.origin);
        movedirection = vectorcross(facenormal, (0, 0, 1));
        if (direction == "right") {
            movedirection = movedirection * -1;
        }
        /#
            recordline(endnode.origin, endnode.origin + facenormal * 20, (1, 0, 0), "robotScriptRequiresToSprint", entity);
        #/
        /#
            recordline(endnode.origin, endnode.origin + movedirection * 20, (1, 0, 0), "robotScriptRequiresToSprint", entity);
        #/
        angles = vectortoangles(movedirection);
        entity orientmode("face angle", angles[1]);
        if (startiswallrun) {
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

// Namespace robotsoldierbehavior/archetype_robot
// Params 5, eflags: 0x5 linked
// Checksum 0x3a11f1fd, Offset: 0x54a8
// Size: 0x2c
function private mocomprobotstarttraversalterminate(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 5, eflags: 0x5 linked
// Checksum 0x77551167, Offset: 0x54e0
// Size: 0x114
function private mocomprobotproceduraltraversalinit(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
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

// Namespace robotsoldierbehavior/archetype_robot
// Params 5, eflags: 0x5 linked
// Checksum 0xdff6258, Offset: 0x5600
// Size: 0x224
function private mocomprobotproceduraltraversalupdate(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    traversal = entity.traversal;
    if (isdefined(traversal)) {
        if (entity ispaused()) {
            traversal.starttime = traversal.starttime + int(float(function_60d95f53()) / 1000 * 1000);
            return;
        }
        endiswallrun = traversal.endnode.spawnflags & 2048;
        realt = (gettime() - traversal.starttime) / traversal.totaltime;
        t = min(realt, 1);
        if (t < 1 || realt == 1 || !endiswallrun) {
            currentpos = calculatecubicbezier(t, traversal.startpoint1, traversal.startpoint2, traversal.endpoint2, traversal.endpoint1);
            angles = entity.angles;
            if (isdefined(traversal.angles)) {
                angles = traversal.angles;
            }
            entity forceteleport(currentpos, angles, 0);
        } else {
            entity animmode("normal_nogravity", 0);
        }
    }
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 5, eflags: 0x5 linked
// Checksum 0xad764e87, Offset: 0x5830
// Size: 0x104
function private mocomprobotproceduraltraversalterminate(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    traversal = entity.traversal;
    if (isdefined(traversal) && gettime() >= traversal.endtime) {
        endiswallrun = traversal.endnode.spawnflags & 2048;
        if (!endiswallrun) {
            entity pathmode("move allowed");
        }
    }
    entity.clamptonavmesh = 1;
    entity.blockingpain = 0;
    entity setrepairpaths(1);
    entity setavoidancemask("avoid all");
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 2, eflags: 0x5 linked
// Checksum 0x814edad0, Offset: 0x5940
// Size: 0x166
function private _calculatewallrundirection(startposition, endposition) {
    entity = self;
    facenormal = getnavmeshfacenormal(endposition, 30);
    /#
        recordline(startposition, endposition, (1, 0.5, 0), "robotScriptRequiresToSprint", entity);
    #/
    if (isdefined(facenormal)) {
        /#
            recordline(endposition, endposition + facenormal * 12, (1, 0.5, 0), "robotScriptRequiresToSprint", entity);
        #/
        angles = vectortoangles(facenormal);
        right = anglestoright(angles);
        d = vectordot(right, endposition) * -1;
        if (vectordot(right, startposition) + d > 0) {
            return "right";
        }
        return "left";
    }
    return "unknown";
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 0, eflags: 0x5 linked
// Checksum 0x3ff99e37, Offset: 0x5ab0
// Size: 0x62
function private robotwallrunstart() {
    entity = self;
    entity.skipdeath = 1;
    entity collidewithactors(0);
    entity pushplayer(1);
    entity.pushable = 0;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 0, eflags: 0x5 linked
// Checksum 0x344febae, Offset: 0x5b20
// Size: 0x72
function private robotwallrunend() {
    entity = self;
    robottraverseragdollondeath(entity);
    entity.skipdeath = 0;
    entity collidewithactors(1);
    entity pushplayer(0);
    entity.pushable = 1;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 0, eflags: 0x5 linked
// Checksum 0x3e2fbd05, Offset: 0x5ba0
// Size: 0x1f8
function private robotsetupwallrunjump() {
    entity = self;
    startnode = entity.traversestartnode;
    endnode = entity.traverseendnode;
    direction = "unknown";
    jumpdirection = "unknown";
    traversaltype = "unknown";
    if (isdefined(startnode) && isdefined(endnode)) {
        startiswallrun = startnode.spawnflags & 2048;
        endiswallrun = endnode.spawnflags & 2048;
        if (endiswallrun) {
            direction = _calculatewallrundirection(startnode.origin, endnode.origin);
        } else {
            direction = _calculatewallrundirection(endnode.origin, startnode.origin);
            if (direction == "right") {
                direction = "left";
            } else {
                direction = "right";
            }
        }
        jumpdirection = robotstartjumpdirection();
        traversaltype = robottraversaltype(startnode);
    }
    entity setblackboardattribute("_robot_jump_direction", jumpdirection);
    entity setblackboardattribute("_robot_wallrun_direction", direction);
    entity setblackboardattribute("_robot_traversal_type", traversaltype);
    robotcalcproceduraltraversal(entity, undefined);
    return 5;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 0, eflags: 0x5 linked
// Checksum 0xb129368f, Offset: 0x5da0
// Size: 0xe8
function private robotsetupwallrunland() {
    entity = self;
    startnode = entity.traversestartnode;
    endnode = entity.traverseendnode;
    landdirection = "unknown";
    traversaltype = "unknown";
    if (isdefined(startnode) && isdefined(endnode)) {
        landdirection = robotendjumpdirection();
        traversaltype = robottraversaltype(endnode);
    }
    entity setblackboardattribute("_robot_jump_direction", landdirection);
    entity setblackboardattribute("_robot_traversal_type", traversaltype);
    return 5;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 0, eflags: 0x5 linked
// Checksum 0x46cc8c0d, Offset: 0x5e90
// Size: 0x11a
function private robotstartjumpdirection() {
    entity = self;
    startnode = entity.traversestartnode;
    endnode = entity.traverseendnode;
    if (isdefined(startnode) && isdefined(endnode)) {
        startiswallrun = startnode.spawnflags & 2048;
        endiswallrun = endnode.spawnflags & 2048;
        if (startiswallrun) {
            abslengthtoend = distance2d(startnode.origin, endnode.origin);
            if (startnode.origin[2] - endnode.origin[2] > 48 && abslengthtoend < 250) {
                return "out";
            }
        }
        return "up";
    }
    return "unknown";
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 0, eflags: 0x5 linked
// Checksum 0xa460fce1, Offset: 0x5fb8
// Size: 0x11a
function private robotendjumpdirection() {
    entity = self;
    startnode = entity.traversestartnode;
    endnode = entity.traverseendnode;
    if (isdefined(startnode) && isdefined(endnode)) {
        startiswallrun = startnode.spawnflags & 2048;
        endiswallrun = endnode.spawnflags & 2048;
        if (endiswallrun) {
            abslengthtoend = distance2d(startnode.origin, endnode.origin);
            if (endnode.origin[2] - startnode.origin[2] > 48 && abslengthtoend < 250) {
                return "in";
            }
        }
        return "down";
    }
    return "unknown";
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x216d53e6, Offset: 0x60e0
// Size: 0x3e
function private robottraversaltype(node) {
    if (isdefined(node)) {
        if (node.spawnflags & 2048) {
            return "wall";
        }
        return "ground";
    }
    return "unknown";
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 0, eflags: 0x5 linked
// Checksum 0x24d947ac, Offset: 0x6128
// Size: 0xbc
function private archetyperobotblackboardinit() {
    entity = self;
    blackboard::createblackboardforentity(entity);
    ai::createinterfaceforentity(entity);
    entity setblackboardattribute("_locomotion_speed", "locomotion_speed_sprint");
    entity.___archetypeonanimscriptedcallback = &archetyperobotonanimscriptedcallback;
    if (self.accuratefire) {
        self thread aiutility::preshootlaserandglinton(self);
        self thread aiutility::postshootlaserandglintoff(self);
    }
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x4045377c, Offset: 0x61f0
// Size: 0x10a
function private robotcrawlercanshootenemy(entity) {
    if (!isdefined(entity.enemy)) {
        return 0;
    }
    aimlimits = entity getaimlimitsfromentry("robot_crawler");
    yawtoenemy = angleclamp180(vectortoangles(entity lastknownpos(entity.enemy) - entity.origin)[1] - entity.angles[1]);
    angleepsilon = 10;
    return yawtoenemy <= aimlimits[#"aim_left"] + angleepsilon && yawtoenemy >= aimlimits[#"aim_right"] + angleepsilon;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x6c623001, Offset: 0x6308
// Size: 0x2c
function private archetyperobotonanimscriptedcallback(entity) {
    entity.__blackboard = undefined;
    entity archetyperobotblackboardinit();
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x6a33851a, Offset: 0x6340
// Size: 0x34
function private robotinvalidatecover(entity) {
    entity.steppedoutofcover = 0;
    entity pathmode("move allowed");
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x2d72d45e, Offset: 0x6380
// Size: 0x44
function private robotdelaymovement(entity) {
    entity pathmode("move delayed", 0, randomfloatrange(1, 2));
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x816270d7, Offset: 0x63d0
// Size: 0x5c
function private robotmovement(entity) {
    if (entity getblackboardattribute("_stance") != "stand") {
        entity setblackboardattribute("_desired_stance", "stand");
    }
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xd0687779, Offset: 0x6438
// Size: 0xca
function private robotcoverscaninitialize(entity) {
    entity setblackboardattribute("_cover_mode", "cover_scan");
    entity setblackboardattribute("_desired_stance", "stand");
    entity setblackboardattribute("_robot_step_in", "slow");
    aiutility::keepclaimnode(entity);
    aiutility::choosecoverdirection(entity, 1);
    entity.steppedoutofcovernode = entity.node;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x1fd7eccd, Offset: 0x6510
// Size: 0x94
function private robotcoverscanterminate(entity) {
    aiutility::cleanupcovermode(entity);
    entity.steppedoutofcover = 1;
    entity.steppedouttime = gettime() - int(8 * 1000);
    aiutility::releaseclaimnode(entity);
    entity pathmode("dont move");
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x1 linked
// Checksum 0x63d7c01a, Offset: 0x65b0
// Size: 0x144
function robotcanjuke(entity) {
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

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x1 linked
// Checksum 0x309e1399, Offset: 0x6700
// Size: 0x88
function robotcantacticaljuke(entity) {
    if (entity haspath() && aiutility::bb_getlocomotionfaceenemyquadrant() == "locomotion_face_enemy_front") {
        jukedirection = aiutility::calculatejukedirection(entity, 50, entity.jukedistance);
        return (jukedirection != "forward");
    }
    return 0;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x1 linked
// Checksum 0x8c0f532e, Offset: 0x6790
// Size: 0x38e
function robotcanpreemptivejuke(entity) {
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
                return robotcanjuke(entity);
            }
        }
    }
    return 0;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x1 linked
// Checksum 0x7581158c, Offset: 0x6b28
// Size: 0x44
function robotisatcovermodescan(entity) {
    covermode = entity getblackboardattribute("_cover_mode");
    return covermode == "cover_scan";
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xa748cc58, Offset: 0x6b78
// Size: 0x4c
function private robotprepareforadjusttocover(entity) {
    aiutility::keepclaimnode(entity);
    entity setblackboardattribute("_desired_stance", "crouch");
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x38025186, Offset: 0x6bd0
// Size: 0x60
function private robotcrawlerservice(entity) {
    if (isdefined(entity.crawlerlifetime) && entity.crawlerlifetime <= gettime() && entity.health > 0) {
        entity kill();
    }
    return 1;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x1 linked
// Checksum 0x96925d20, Offset: 0x6c38
// Size: 0x16
function robotiscrawler(entity) {
    return entity.iscrawler;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x6ce69e07, Offset: 0x6c58
// Size: 0xf0
function private robotbecomecrawler(entity) {
    if (!entity ai::get_behavior_attribute("can_become_crawler")) {
        return;
    }
    entity.iscrawler = 1;
    entity.becomecrawler = 0;
    entity allowpitchangle(1);
    entity setpitchorient();
    entity.crawlerlifetime = gettime() + randomintrange(10000, 20000);
    function_6eac4ca1(entity, "rbCrawler");
    entity notify(#"bhtn_action_notify", {#action:"rbCrawler"});
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x1 linked
// Checksum 0xe46099a1, Offset: 0x6d50
// Size: 0x16
function robotshouldbecomecrawler(entity) {
    return entity.becomecrawler;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x1fee3195, Offset: 0x6d70
// Size: 0x34
function private robotismarching(entity) {
    return entity getblackboardattribute("_move_mode") == "marching";
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 0, eflags: 0x4
// Checksum 0xcebcb818, Offset: 0x6db0
// Size: 0xd6
function private robotlocomotionspeed() {
    entity = self;
    if (robotismindcontrolled() == "mind_controlled") {
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

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xe16f9e7f, Offset: 0x6e90
// Size: 0x8c
function private robotcoveroverinitialize(behaviortreeentity) {
    aiutility::setcovershootstarttime(behaviortreeentity);
    aiutility::keepclaimnode(behaviortreeentity);
    behaviortreeentity setblackboardattribute("_desired_stance", "stand");
    behaviortreeentity setblackboardattribute("_cover_mode", "cover_over");
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x57866c52, Offset: 0x6f28
// Size: 0x3c
function private robotcoveroverterminate(behaviortreeentity) {
    aiutility::cleanupcovermode(behaviortreeentity);
    aiutility::clearcovershootstarttime(behaviortreeentity);
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 0, eflags: 0x5 linked
// Checksum 0xfe158e13, Offset: 0x6f70
// Size: 0x36
function private robotismindcontrolled() {
    entity = self;
    if (entity.controllevel > 1) {
        return "mind_controlled";
    }
    return "normal";
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x87ef0b0e, Offset: 0x6fb0
// Size: 0x32
function private robotdonttakecover(entity) {
    entity.combatmode = "no_cover";
    entity.resumecover = gettime() + 4000;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xb26ff96a, Offset: 0x6ff0
// Size: 0xb0
function private _isvalidplayer(player) {
    if (!isdefined(player) || !isalive(player) || !isplayer(player) || player.sessionstate == "spectator" || player.sessionstate == "intermission" || player laststand::player_is_in_laststand() || player.ignoreme) {
        return 0;
    }
    return 1;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x72a86aff, Offset: 0x70a8
// Size: 0xec
function private robotrushenemyservice(entity) {
    if (!isdefined(entity.enemy)) {
        return 0;
    }
    distancetoenemy = distance2dsquared(entity.origin, entity.enemy.origin);
    if (distancetoenemy >= 360000 && distancetoenemy <= 1440000) {
        findpathresult = entity findpath(entity.origin, entity.enemy.origin, 1, 0);
        if (findpathresult) {
            entity ai::set_behavior_attribute("move_mode", "rusher");
        }
    }
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 2, eflags: 0x5 linked
// Checksum 0x56368810, Offset: 0x71a0
// Size: 0x186
function private _isvalidrusher(entity, neighbor) {
    return isdefined(neighbor) && isdefined(neighbor.archetype) && neighbor.archetype == "robot" && isdefined(neighbor.team) && entity.team == neighbor.team && entity != neighbor && isdefined(neighbor.enemy) && neighbor ai::get_behavior_attribute("move_mode") == "normal" && !neighbor ai::get_behavior_attribute("phalanx") && neighbor ai::get_behavior_attribute("rogue_control") == "level_0" && distancesquared(entity.origin, neighbor.origin) < 160000 && distancesquared(neighbor.origin, neighbor.enemy.origin) < 1440000;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xdc1ef19, Offset: 0x7330
// Size: 0x18c
function private robotrushneighborservice(entity) {
    actors = getaiarray();
    closestenemy = undefined;
    closestenemydistance = undefined;
    foreach (ai in actors) {
        if (_isvalidrusher(entity, ai)) {
            enemydistance = distancesquared(entity.origin, ai.origin);
            if (!isdefined(closestenemydistance) || enemydistance < closestenemydistance) {
                closestenemydistance = enemydistance;
                closestenemy = ai;
            }
        }
    }
    if (isdefined(closestenemy)) {
        findpathresult = entity findpath(closestenemy.origin, closestenemy.enemy.origin, 1, 0);
        if (findpathresult) {
            closestenemy ai::set_behavior_attribute("move_mode", "rusher");
        }
    }
}

// Namespace robotsoldierbehavior/archetype_robot
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

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x42f05ec0, Offset: 0x75f8
// Size: 0x55e
function private robottargetservice(entity) {
    if (robotabletoshootcondition(entity)) {
        return 0;
    }
    if (isdefined(entity.ignoreall) && entity.ignoreall) {
        return 0;
    }
    if (isdefined(entity.nexttargetserviceupdate) && entity.nexttargetserviceupdate > gettime() && isalive(entity.favoriteenemy)) {
        return 0;
    }
    positiononnavmesh = getclosestpointonnavmesh(entity.origin, 200);
    if (!isdefined(positiononnavmesh)) {
        return;
    }
    if (isdefined(entity.favoriteenemy) && isdefined(entity.favoriteenemy._currentroguerobot) && entity.favoriteenemy._currentroguerobot == entity) {
        entity.favoriteenemy._currentroguerobot = undefined;
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
        entity.favoriteenemy._currentroguerobot = entity;
    } else if (closestai.distancesquared < closestplayer.distancesquared) {
        entity.favoriteenemy = closestai.entity;
        entity.favoriteenemy._currentroguerobot = entity;
    } else {
        entity.favoriteenemy = closestplayer.entity;
    }
    entity.nexttargetserviceupdate = gettime() + randomintrange(2500, 3500);
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x86e62ac3, Offset: 0x7b60
// Size: 0x6c
function private setdesiredstancetostand(behaviortreeentity) {
    currentstance = behaviortreeentity getblackboardattribute("_stance");
    if (currentstance == "crouch") {
        behaviortreeentity setblackboardattribute("_desired_stance", "stand");
    }
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x477bce42, Offset: 0x7bd8
// Size: 0x6c
function private setdesiredstancetocrouch(behaviortreeentity) {
    currentstance = behaviortreeentity getblackboardattribute("_stance");
    if (currentstance == "stand") {
        behaviortreeentity setblackboardattribute("_desired_stance", "crouch");
    }
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xd425b75e, Offset: 0x7c50
// Size: 0x94
function private toggledesiredstance(entity) {
    currentstance = entity getblackboardattribute("_stance");
    if (currentstance == "stand") {
        entity setblackboardattribute("_desired_stance", "crouch");
    } else {
        entity setblackboardattribute("_desired_stance", "stand");
    }
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x4883a15a, Offset: 0x7cf0
// Size: 0x2a
function private robotshouldshutdown(entity) {
    return entity ai::get_behavior_attribute("shutdown");
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x3e7617ef, Offset: 0x7d28
// Size: 0x9c
function private robotshouldexplode(entity) {
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

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x8de53ad4, Offset: 0x7dd0
// Size: 0x44
function private robotshouldadjusttocover(entity) {
    if (!isdefined(entity.node)) {
        return 0;
    }
    return entity getblackboardattribute("_stance") != "crouch";
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xaa2a5b1b, Offset: 0x7e20
// Size: 0x96
function private robotshouldreactatcover(behaviortreeentity) {
    return behaviortreeentity getblackboardattribute("_stance") == "crouch" && aiutility::canbeflanked(behaviortreeentity) && behaviortreeentity isatcovernodestrict() && behaviortreeentity isflankedatcovernode() && !behaviortreeentity haspath();
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x6d5186d7, Offset: 0x7ec0
// Size: 0x2a
function private robotexplode(entity) {
    entity.allowdeath = 0;
    entity.nocybercom = 1;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xeeb73bde, Offset: 0x7ef8
// Size: 0x164
function private robotexplodeterminate(entity) {
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

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xe42555b8, Offset: 0x8068
// Size: 0xf2
function private robotexposedcoverservice(entity) {
    if (isdefined(entity.steppedoutofcover) && isdefined(entity.steppedoutofcovernode) && (!entity iscovervalid(entity.steppedoutofcovernode) || entity haspath() || !entity issafefromgrenade())) {
        entity.steppedoutofcover = 0;
        entity pathmode("move allowed");
    }
    if (isdefined(entity.resumecover) && gettime() > entity.resumecover) {
        entity.combatmode = "cover";
        entity.resumecover = undefined;
    }
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xe83a3d1b, Offset: 0x8168
// Size: 0x11e
function private robotisatcovercondition(entity) {
    enemytooclose = 0;
    if (isdefined(entity.enemy)) {
        lastknownenemypos = entity lastknownpos(entity.enemy);
        distancetoenemysqr = distance2dsquared(entity.origin, lastknownenemypos);
        enemytooclose = distancetoenemysqr <= 57600;
    }
    return !enemytooclose && !entity.steppedoutofcover && entity isatcovernodestrict() && entity shouldusecovernode() && !entity haspath() && entity issafefromgrenade() && entity.combatmode != "no_cover";
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xd8178b50, Offset: 0x8290
// Size: 0x174
function private robotsupportsovercover(entity) {
    if (isdefined(entity.node)) {
        if (isdefined(entity.node.spawnflags) && (entity.node.spawnflags & 4) == 4) {
            return (entity.node.type == #"cover stand" || entity.node.type == #"conceal stand");
        }
        return (entity.node.type == #"cover left" || entity.node.type == #"cover right" || entity.node.type == #"cover crouch" || entity.node.type == #"cover crouch window" || entity.node.type == #"conceal crouch");
    }
    return 0;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xed4f28e9, Offset: 0x8410
// Size: 0x170
function private canmovetoenemycondition(entity) {
    if (!isdefined(entity.enemy) || entity.enemy.health <= 0) {
        return 0;
    }
    positiononnavmesh = getclosestpointonnavmesh(entity.origin, 200);
    enemypositiononnavmesh = getclosestpointonnavmesh(entity.enemy.origin, 200, 30);
    if (!isdefined(positiononnavmesh) || !isdefined(enemypositiononnavmesh)) {
        return 0;
    }
    findpathresult = entity findpath(positiononnavmesh, enemypositiononnavmesh, 1, 0);
    /#
        if (!findpathresult) {
            record3dtext("robotProceduralTraversal", enemypositiononnavmesh + vectorscale((0, 0, 1), 5), (1, 0.5, 0), "robotScriptRequiresToSprint");
            recordline(positiononnavmesh, enemypositiononnavmesh, (1, 0.5, 0), "robotScriptRequiresToSprint", entity);
        }
    #/
    return findpathresult;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xe2a0e85a, Offset: 0x8588
// Size: 0xa4
function private canmoveclosetoenemycondition(entity) {
    if (!isdefined(entity.enemy) || entity.enemy.health <= 0) {
        return 0;
    }
    queryresult = positionquery_source_navigation(entity.enemy.origin, 0, 120, 120, 20, entity);
    positionquery_filter_inclaimedlocation(queryresult, entity);
    return queryresult.data.size > 0;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x996ab95d, Offset: 0x8638
// Size: 0x38
function private robotstartsprint(entity) {
    entity setblackboardattribute("_locomotion_speed", "locomotion_speed_sprint");
    return 1;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xe5d409cd, Offset: 0x8678
// Size: 0x38
function private robotstartsupersprint(entity) {
    entity setblackboardattribute("_locomotion_speed", "locomotion_speed_super_sprint");
    return 1;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xb81671b6, Offset: 0x86b8
// Size: 0x90
function private robottacticalwalkactionstart(entity) {
    aiutility::resetcoverparameters(entity);
    aiutility::setcanbeflanked(entity, 0);
    entity setblackboardattribute("_locomotion_speed", "locomotion_speed_walk");
    entity setblackboardattribute("_stance", "stand");
    return 1;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xef994abc, Offset: 0x8750
// Size: 0x3c
function private robotdie(entity) {
    if (isalive(entity)) {
        entity kill();
    }
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 2, eflags: 0x5 linked
// Checksum 0xbaaa10e9, Offset: 0x8798
// Size: 0x722
function private movetoplayerupdate(entity, asmstatename) {
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
    if (robotroguehascloseenemytomelee(entity)) {
        return 4;
    }
    if (entity.allowcollidewithactors) {
        if (isdefined(entity.enemy) && distancesquared(entity.origin, entity.enemy.origin) > 300 * 300) {
            entity collidewithactors(0);
        } else {
            entity collidewithactors(1);
        }
    }
    if (entity asmistransdecrunning() || entity asmistransitionrunning()) {
        return 4;
    }
    if (!isdefined(entity.lastknownenemypos)) {
        entity.lastknownenemypos = entity.enemy.origin;
    }
    shouldrepath = !isdefined(entity.lastvalidenemypos);
    if (!shouldrepath && isdefined(entity.enemy)) {
        if (isdefined(entity.nextmovetoplayerupdate) && entity.nextmovetoplayerupdate <= gettime()) {
            shouldrepath = 1;
        } else if (distancesquared(entity.lastknownenemypos, entity.enemy.origin) > 72 * 72) {
            shouldrepath = 1;
        } else if (distancesquared(entity.origin, entity.enemy.origin) <= 120 * 120) {
            shouldrepath = 1;
        } else if (isdefined(entity.pathgoalpos)) {
            distancetogoalsqr = distancesquared(entity.origin, entity.pathgoalpos);
            shouldrepath = distancetogoalsqr < 72 * 72;
        }
    }
    if (shouldrepath) {
        entity.lastknownenemypos = entity.enemy.origin;
        queryresult = positionquery_source_navigation(entity.lastknownenemypos, 0, 120, 120, 20, entity);
        positionquery_filter_inclaimedlocation(queryresult, entity);
        if (queryresult.data.size > 0) {
            entity.lastvalidenemypos = queryresult.data[0].origin;
        }
        if (isdefined(entity.lastvalidenemypos)) {
            entity function_a57c34b7(entity.lastvalidenemypos);
            if (distancesquared(entity.origin, entity.lastvalidenemypos) > 240 * 240) {
                path = entity calcapproximatepathtoposition(entity.lastvalidenemypos, 0);
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
        entity.nextmovetoplayerupdate = gettime() + randomintrange(2000, 3000);
    }
    return 5;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x66a44edc, Offset: 0x8ec8
// Size: 0x48
function private robotshouldchargemelee(entity) {
    if (aiutility::shouldmutexmelee(entity) && robothasenemytomelee(entity)) {
        return 1;
    }
    return 0;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x7ab28381, Offset: 0x8f18
// Size: 0x174
function private robothasenemytomelee(entity) {
    if (isdefined(entity.enemy) && issentient(entity.enemy) && entity.enemy.health > 0) {
        enemydistsq = distancesquared(entity.origin, entity.enemy.origin);
        if (enemydistsq < entity.chargemeleedistance * entity.chargemeleedistance && abs(entity.enemy.origin[2] - entity.origin[2]) < 24) {
            yawtoenemy = angleclamp180(entity.angles[1] - vectortoangles(entity.enemy.origin - entity.origin)[1]);
            return (abs(yawtoenemy) <= 80);
        }
    }
    return 0;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x9867bbba, Offset: 0x9098
// Size: 0xea
function private robotroguehasenemytomelee(entity) {
    if (isdefined(entity.enemy) && issentient(entity.enemy) && entity.enemy.health > 0 && entity ai::get_behavior_attribute("rogue_control") != "level_3") {
        if (!entity cansee(entity.enemy)) {
            return 0;
        }
        return (distancesquared(entity.origin, entity.enemy.origin) < 132 * 132);
    }
    return 0;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xceb8771, Offset: 0x9190
// Size: 0x48
function private robotshouldmelee(entity) {
    if (aiutility::shouldmutexmelee(entity) && robothascloseenemytomelee(entity)) {
        return 1;
    }
    return 0;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x5ec535f5, Offset: 0x91e0
// Size: 0x14c
function private robothascloseenemytomelee(entity) {
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

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x3c4a0dfc, Offset: 0x9338
// Size: 0xc2
function private robotroguehascloseenemytomelee(entity) {
    if (isdefined(entity.enemy) && issentient(entity.enemy) && entity.enemy.health > 0 && entity ai::get_behavior_attribute("rogue_control") != "level_3") {
        return (distancesquared(entity.origin, entity.enemy.origin) < 64 * 64);
    }
    return 0;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x9d6b0fdc, Offset: 0x9408
// Size: 0x4e
function private scriptrequirestosprintcondition(entity) {
    return entity ai::get_behavior_attribute("sprint") && !entity ai::get_behavior_attribute("disablesprint");
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xf5a3971b, Offset: 0x9460
// Size: 0x4c
function private robotscanexposedpainterminate(entity) {
    aiutility::cleanupcovermode(entity);
    entity setblackboardattribute("_robot_step_in", "fast");
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x1541fda3, Offset: 0x94b8
// Size: 0x8a
function private robottookempdamage(entity) {
    if (isdefined(entity.damageweapon) && isdefined(entity.damagemod)) {
        weapon = entity.damageweapon;
        return (entity.damagemod == "MOD_GRENADE_SPLASH" && weapon.rootweapon.name == #"emp_grenade");
    }
    return 0;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x60c5eadd, Offset: 0x9550
// Size: 0x54
function private robotnocloseenemyservice(entity) {
    if (isdefined(entity.enemy) && aiutility::shouldmelee(entity)) {
        entity clearpath();
        return 1;
    }
    return 0;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 3, eflags: 0x5 linked
// Checksum 0xbafdfacc, Offset: 0x95b0
// Size: 0x106
function private _robotoutsidemovementrange(entity, range, useenemypos) {
    /#
        assert(isdefined(range));
    #/
    if (!isdefined(entity.enemy) && !entity haspath()) {
        return 0;
    }
    goalpos = entity.pathgoalpos;
    if (isdefined(entity.enemy) && useenemypos) {
        goalpos = entity lastknownpos(entity.enemy);
    }
    if (!isdefined(goalpos)) {
        return 0;
    }
    outsiderange = distancesquared(entity.origin, goalpos) > range * range;
    return outsiderange;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x86083b7c, Offset: 0x96c0
// Size: 0x24
function private robotoutsidesupersprintrange(entity) {
    return !robotwithinsupersprintrange(entity);
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x19350051, Offset: 0x96f0
// Size: 0x76
function private robotwithinsupersprintrange(entity) {
    if (entity ai::get_behavior_attribute("supports_super_sprint") && !entity ai::get_behavior_attribute("disablesprint")) {
        return _robotoutsidemovementrange(entity, entity.supersprintdistance, 0);
    }
    return 0;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x5d4c83de, Offset: 0x9770
// Size: 0x86
function private robotoutsidesprintrange(entity) {
    if (entity ai::get_behavior_attribute("supports_super_sprint") && !entity ai::get_behavior_attribute("disablesprint")) {
        return _robotoutsidemovementrange(entity, entity.supersprintdistance * 1.15, 0);
    }
    return 0;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x87be73a6, Offset: 0x9800
// Size: 0xc2
function private robotoutsidetacticalwalkrange(entity) {
    if (entity ai::get_behavior_attribute("disablesprint")) {
        return 0;
    }
    if (isdefined(entity.enemy) && distancesquared(entity.origin, entity.goalpos) < entity.minwalkdistance * entity.minwalkdistance) {
        return 0;
    }
    return _robotoutsidemovementrange(entity, entity.runandgundist * 1.15, 1);
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xc7bc944e, Offset: 0x98d0
// Size: 0xb2
function private robotwithinsprintrange(entity) {
    if (entity ai::get_behavior_attribute("disablesprint")) {
        return 0;
    }
    if (isdefined(entity.enemy) && distancesquared(entity.origin, entity.goalpos) < entity.minwalkdistance * entity.minwalkdistance) {
        return 0;
    }
    return _robotoutsidemovementrange(entity, entity.runandgundist, 1);
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xe53e2320, Offset: 0x9990
// Size: 0x12c
function private shouldtakeovercondition(entity) {
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

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xfd54322e, Offset: 0x9ac8
// Size: 0x18
function private hasminiraps(entity) {
    return isdefined(entity.miniraps);
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xcfedf522, Offset: 0x9ae8
// Size: 0x76
function private robotismoving(entity) {
    velocity = entity getvelocity();
    velocity = (velocity[0], 0, velocity[1]);
    velocitysqr = lengthsquared(velocity);
    return velocitysqr > 24 * 24;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x9e7450df, Offset: 0x9b68
// Size: 0x1c
function private robotabletoshootcondition(entity) {
    return entity.controllevel <= 1;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xa11a338, Offset: 0x9b90
// Size: 0x3c
function private robotshouldtacticalwalk(entity) {
    if (!entity haspath()) {
        return 0;
    }
    return !robotismarching(entity);
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x26f1cda4, Offset: 0x9bd8
// Size: 0x5dc
function private _robotcoverposition(entity) {
    if (entity isflankedatcovernode()) {
        return 0;
    }
    if (entity shouldholdgroundagainstenemy()) {
        return 0;
    }
    shouldusecovernode = undefined;
    itsbeenawhile = gettime() > entity.nextfindbestcovertime;
    isatscriptgoal = undefined;
    if (isdefined(entity.robotnode)) {
        isatscriptgoal = entity isposatgoal(entity.robotnode.origin);
        shouldusecovernode = entity iscovervalid(entity.robotnode);
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
                if (entity.robotnode === nodes[nodeindex] || !isdefined(nodes[nodeindex].robotclaimed)) {
                    node = nodes[nodeindex];
                    break;
                }
            }
            if (isentity(entity.node) && (!isdefined(entity.robotnode) || entity.robotnode != entity.node)) {
                entity.robotnode = entity.node;
                entity.robotnode.robotclaimed = 1;
            }
            goingtodifferentnode = isdefined(node) && (!isdefined(entity.robotnode) || node != entity.robotnode) && (!isdefined(entity.steppedoutofcovernode) || entity.steppedoutofcovernode != node);
            aiutility::setnextfindbestcovertime(entity, node);
            if (goingtodifferentnode) {
                if (randomfloat(1) <= 0.75 || entity ai::get_behavior_attribute("force_cover")) {
                    aiutility::usecovernodewrapper(entity, node);
                } else {
                    searchradius = entity.goalradius;
                    if (searchradius > 200) {
                        searchradius = 200;
                    }
                    covernodepoints = util::positionquery_pointarray(node.origin, 30, searchradius, 72, 30);
                    if (covernodepoints.size > 0) {
                        entity function_a57c34b7(covernodepoints[randomint(covernodepoints.size)]);
                    } else {
                        entity function_a57c34b7(entity getnodeoffsetposition(node));
                    }
                }
                if (isdefined(entity.robotnode)) {
                    entity.robotnode.robotclaimed = undefined;
                }
                entity.robotnode = node;
                entity.robotnode.robotclaimed = 1;
                entity pathmode("move delayed", 0, randomfloatrange(0.25, 2));
                return 1;
            }
        }
    }
    return 0;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xc703eaba, Offset: 0xa1c0
// Size: 0x2ce
function private _robotescortposition(entity) {
    if (entity ai::get_behavior_attribute("move_mode") == "escort") {
        escortposition = entity ai::get_behavior_attribute("escort_position");
        if (!isdefined(escortposition)) {
            return 1;
        }
        if (distance2dsquared(entity.origin, escortposition) <= 22500) {
            return 1;
        }
        if (isdefined(entity.escortnexttime) && gettime() < entity.escortnexttime) {
            return 1;
        }
        if (entity getpathmode() == "dont move") {
            return 1;
        }
        positiononnavmesh = getclosestpointonnavmesh(escortposition, 200);
        if (!isdefined(positiononnavmesh)) {
            positiononnavmesh = escortposition;
        }
        queryresult = positionquery_source_navigation(positiononnavmesh, 75, 150, 36, 16, entity, 16);
        positionquery_filter_inclaimedlocation(queryresult, entity);
        if (queryresult.data.size > 0) {
            closestpoint = undefined;
            closestdistance = undefined;
            foreach (point in queryresult.data) {
                if (!point.inclaimedlocation) {
                    newclosestdistance = distance2dsquared(entity.origin, point.origin);
                    if (!isdefined(closestpoint) || newclosestdistance < closestdistance) {
                        closestpoint = point.origin;
                        closestdistance = newclosestdistance;
                    }
                }
            }
            if (isdefined(closestpoint)) {
                entity function_a57c34b7(closestpoint);
                entity.escortnexttime = gettime() + randomintrange(200, 300);
            }
        }
        return 1;
    }
    return 0;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x35941c54, Offset: 0xa498
// Size: 0x39e
function private _robotrusherposition(entity) {
    if (entity ai::get_behavior_attribute("move_mode") == "rusher") {
        entity pathmode("move allowed");
        if (!isdefined(entity.enemy)) {
            return 1;
        }
        disttoenemysqr = distance2dsquared(entity.origin, entity.enemy.origin);
        if (disttoenemysqr <= entity.robotrushermaxradius * entity.robotrushermaxradius && disttoenemysqr >= entity.robotrusherminradius * entity.robotrusherminradius) {
            return 1;
        }
        if (isdefined(entity.rushernexttime) && gettime() < entity.rushernexttime) {
            return 1;
        }
        positiononnavmesh = getclosestpointonnavmesh(entity.enemy.origin, 200);
        if (!isdefined(positiononnavmesh)) {
            positiononnavmesh = entity.enemy.origin;
        }
        queryresult = positionquery_source_navigation(positiononnavmesh, entity.robotrusherminradius, entity.robotrushermaxradius, 36, 16, entity, 16);
        positionquery_filter_inclaimedlocation(queryresult, entity);
        positionquery_filter_sight(queryresult, entity.enemy.origin, entity geteye() - entity.origin, entity, 2, entity.enemy);
        if (queryresult.data.size > 0) {
            closestpoint = undefined;
            closestdistance = undefined;
            foreach (point in queryresult.data) {
                if (!point.inclaimedlocation && point.visibility === 1) {
                    newclosestdistance = distance2dsquared(entity.origin, point.origin);
                    if (!isdefined(closestpoint) || newclosestdistance < closestdistance) {
                        closestpoint = point.origin;
                        closestdistance = newclosestdistance;
                    }
                }
            }
            if (isdefined(closestpoint)) {
                entity function_a57c34b7(closestpoint);
                entity.rushernexttime = gettime() + randomintrange(500, 1500);
            }
        }
        return 1;
    }
    return 0;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xbcb89fbd, Offset: 0xa840
// Size: 0x3c8
function private _robotguardposition(entity) {
    if (entity ai::get_behavior_attribute("move_mode") == "guard") {
        if (entity getpathmode() == "dont move") {
            return 1;
        }
        if (!isdefined(entity.guardposition) || distancesquared(entity.origin, entity.guardposition) < 60 * 60) {
            entity pathmode("move delayed", 1, randomfloatrange(1, 1.5));
            queryresult = positionquery_source_navigation(entity.goalpos, 0, entity.goalradius / 2, 36, 36, entity, 72);
            positionquery_filter_inclaimedlocation(queryresult, entity);
            if (queryresult.data.size > 0) {
                minimumdistancesq = entity.goalradius * 0.2;
                minimumdistancesq = minimumdistancesq * minimumdistancesq;
                distantpoints = [];
                foreach (point in queryresult.data) {
                    if (distancesquared(entity.origin, point.origin) > minimumdistancesq) {
                        distantpoints[distantpoints.size] = point;
                    }
                }
                if (distantpoints.size > 0) {
                    randomposition = distantpoints[randomint(distantpoints.size)];
                    entity.guardposition = randomposition.origin;
                    entity.intermediateguardposition = undefined;
                    entity.intermediateguardtime = undefined;
                }
            }
        }
        currenttime = gettime();
        if (!isdefined(entity.intermediateguardtime) || entity.intermediateguardtime < currenttime) {
            if (isdefined(entity.intermediateguardposition) && distancesquared(entity.intermediateguardposition, entity.origin) < 24 * 24) {
                entity.guardposition = entity.origin;
            }
            entity.intermediateguardposition = entity.origin;
            entity.intermediateguardtime = currenttime + 3000;
        }
        if (isdefined(entity.guardposition)) {
            entity function_a57c34b7(entity.guardposition);
            return 1;
        }
    }
    entity.guardposition = undefined;
    entity.intermediateguardposition = undefined;
    entity.intermediateguardtime = undefined;
    return 0;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x9e4cf967, Offset: 0xac10
// Size: 0x276
function private robotpositionservice(entity) {
    /#
        if (getdvarint(#"ai_debuglastknown", 0) && isdefined(entity.enemy)) {
            lastknownpos = entity lastknownpos(entity.enemy);
            recordline(entity.origin, lastknownpos, (1, 0.5, 0), "robotScriptRequiresToSprint", entity);
            record3dtext("_gib_location", lastknownpos + vectorscale((0, 0, 1), 5), (1, 0.5, 0), "robotScriptRequiresToSprint");
        }
    #/
    if (!isalive(entity)) {
        if (isdefined(entity.robotnode)) {
            aiutility::releaseclaimnode(entity);
            entity.robotnode.robotclaimed = undefined;
            entity.robotnode = undefined;
        }
        return 0;
    }
    if (entity.disablerepath) {
        return 0;
    }
    if (!robotabletoshootcondition(entity)) {
        return 0;
    }
    if (entity ai::get_behavior_attribute("phalanx")) {
        return 0;
    }
    if (aisquads::isfollowingsquadleader(entity)) {
        return 0;
    }
    if (_robotrusherposition(entity)) {
        return 1;
    }
    if (_robotguardposition(entity)) {
        return 1;
    }
    if (_robotescortposition(entity)) {
        return 1;
    }
    if (!aiutility::issafefromgrenades(entity)) {
        aiutility::releaseclaimnode(entity);
        aiutility::choosebestcovernodeasap(entity);
    }
    if (_robotcoverposition(entity)) {
        return 1;
    }
    return 0;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 2, eflags: 0x5 linked
// Checksum 0x146152b7, Offset: 0xae90
// Size: 0x7c
function private robotdropstartingweapon(entity, asmstatename) {
    if (entity.weapon.name == level.weaponnone.name) {
        entity shared::placeweaponon(entity.startingweapon, "right");
        entity thread shared::dropaiweapon();
    }
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xdf37d007, Offset: 0xaf18
// Size: 0xec
function private robotjukeinitialize(entity) {
    aiutility::choosejukedirection(entity);
    entity clearpath();
    function_6eac4ca1(entity, "rbJuke");
    entity notify(#"bhtn_action_notify", {#action:"rbJuke"});
    jukeinfo = spawnstruct();
    jukeinfo.origin = entity.origin;
    jukeinfo.entity = entity;
    blackboard::addblackboardevent("actor_juke", jukeinfo, 3000);
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x5e8fd225, Offset: 0xb010
// Size: 0x5e
function private robotpreemptivejuketerminate(entity) {
    entity.nextpreemptivejuke = gettime() + randomintrange(4000, 6000);
    entity.nextpreemptivejukeads = randomfloatrange(0.5, 0.95);
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x901f64d0, Offset: 0xb078
// Size: 0x362
function private robottryreacquireservice(entity) {
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
    if (!robotabletoshootcondition(entity)) {
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

// Namespace robotsoldierbehavior/archetype_robot
// Params 2, eflags: 0x5 linked
// Checksum 0xabd990cd, Offset: 0xb3e8
// Size: 0xd8
function private takeoverinitialize(entity, asmstatename) {
    switch (entity ai::get_behavior_attribute("rogue_control")) {
    case #"level_1":
        entity robotsoldierserverutils::forcerobotsoldiermindcontrollevel1();
        break;
    case #"level_2":
        entity robotsoldierserverutils::forcerobotsoldiermindcontrollevel2();
        break;
    case #"level_3":
        entity robotsoldierserverutils::forcerobotsoldiermindcontrollevel3();
        break;
    }
    animationstatenetworkutility::requeststate(entity, asmstatename);
    return 5;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 2, eflags: 0x5 linked
// Checksum 0x87c24887, Offset: 0xb4c8
// Size: 0x7e
function private takeoverterminate(entity, asmstatename) {
    switch (entity ai::get_behavior_attribute("rogue_control")) {
    case #"level_2":
    case #"level_3":
        entity thread shared::dropaiweapon();
        break;
    }
    return 4;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 2, eflags: 0x5 linked
// Checksum 0xb7d924a5, Offset: 0xb550
// Size: 0xb0
function private stepintoinitialize(entity, asmstatename) {
    aiutility::releaseclaimnode(entity);
    aiutility::usecovernodewrapper(entity, entity.steppedoutofcovernode);
    entity setblackboardattribute("_desired_stance", "crouch");
    aiutility::keepclaimnode(entity);
    entity.steppedoutofcovernode = undefined;
    animationstatenetworkutility::requeststate(entity, asmstatename);
    return 5;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 2, eflags: 0x5 linked
// Checksum 0x3e5e1988, Offset: 0xb608
// Size: 0x58
function private stepintoterminate(entity, asmstatename) {
    entity.steppedoutofcover = 0;
    aiutility::releaseclaimnode(entity);
    entity pathmode("move allowed");
    return 4;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 2, eflags: 0x5 linked
// Checksum 0x12cb3ade, Offset: 0xb668
// Size: 0xf8
function private stepoutinitialize(entity, asmstatename) {
    entity.steppedoutofcovernode = entity.node;
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

// Namespace robotsoldierbehavior/archetype_robot
// Params 2, eflags: 0x5 linked
// Checksum 0x892ae8c, Offset: 0xb768
// Size: 0x68
function private stepoutterminate(entity, asmstatename) {
    entity.steppedoutofcover = 1;
    entity.steppedouttime = gettime();
    aiutility::releaseclaimnode(entity);
    entity pathmode("dont move");
    return 4;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xfbc205ce, Offset: 0xb7d8
// Size: 0x7e
function private supportsstepoutcondition(entity) {
    return entity.node.type == #"cover left" || entity.node.type == #"cover right" || entity.node.type == #"cover pillar";
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xdafa331d, Offset: 0xb860
// Size: 0xfc
function private shouldstepincondition(entity) {
    if (!isdefined(entity.steppedoutofcover) || !entity.steppedoutofcover || !isdefined(entity.steppedouttime) || !entity.steppedoutofcover) {
        return 0;
    }
    exposedtimeinseconds = float(gettime() - entity.steppedouttime) / 1000;
    exceededtime = exposedtimeinseconds >= 4 || exposedtimeinseconds >= 8;
    suppressed = entity.suppressionmeter > entity.suppressionthreshold;
    return exceededtime || exceededtime && suppressed;
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 0, eflags: 0x5 linked
// Checksum 0x56fdf995, Offset: 0xb968
// Size: 0xb6
function private robotdeployminiraps() {
    entity = self;
    if (isdefined(entity) && isdefined(entity.miniraps)) {
        positiononnavmesh = getclosestpointonnavmesh(entity.origin, 200);
        raps = spawnvehicle("spawner_bo3_mini_raps", positiononnavmesh, (0, 0, 0));
        raps.team = entity.team;
        raps thread robotsoldierserverutils::rapsdetonatecountdown(raps);
        entity.miniraps = undefined;
    }
}

// Namespace robotsoldierbehavior/archetype_robot
// Params 0, eflags: 0x5 linked
// Checksum 0x4fa74589, Offset: 0xba28
// Size: 0x94
function private function_125cc705() {
    if (self.var_9fde8624 === #"robot_rpg") {
        self.var_21001b38 = getweapon(#"hash_3b5610f58856b4ea");
        self.var_d5bd74f1 = getweapon(#"hash_1d8ec79043d16eb");
        self.var_cdf2311b = 0;
        self thread function_ce50548d();
    }
}

// Namespace robotsoldierbehavior/archetype_robot
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

#namespace robotsoldierserverutils;

// Namespace robotsoldierserverutils/archetype_robot
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

// Namespace robotsoldierserverutils/archetype_robot
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
    } else if (robotsoldierbehavior::robotismindcontrolled() == "mind_controlled" && isinarray(array("right_hand", "right_arm_lower", "right_arm_upper"), hitloc)) {
        gibserverutils::gibrightarm(entity);
    } else if (ondeath && randomfloatrange(0, 1) <= 0.25) {
        if (math::cointoss()) {
            gibserverutils::gibleftarm(entity);
        } else {
            gibserverutils::gibrightarm(entity);
        }
    }
}

// Namespace robotsoldierserverutils/archetype_robot
// Params 5, eflags: 0x5 linked
// Checksum 0x1b897d5f, Offset: 0xc0a0
// Size: 0x404
function private _trygibbinglegs(entity, damage, hitloc, isexplosive, attacker = entity) {
    cangiblegs = entity.health - damage <= 0 && entity.allowdeath;
    if (entity ai::get_behavior_attribute("can_become_crawler")) {
        cangiblegs = cangiblegs || (entity.health - damage) / entity.maxhealth <= 0.25 && distancesquared(entity.origin, attacker.origin) <= 360000 && !robotsoldierbehavior::robotisatcovercondition(entity) && entity.allowdeath;
    }
    if (entity.gibdeath && entity.health - damage <= 0 && entity.allowdeath && !robotsoldierbehavior::robotiscrawler(entity)) {
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

// Namespace robotsoldierserverutils/archetype_robot
// Params 12, eflags: 0x5 linked
// Checksum 0x3a0c84ec, Offset: 0xc4b0
// Size: 0x1f8
function private robotgibdamageoverride(inflictor, attacker, damage, flags, meansofdeath, weapon, point, dir, hitloc, offsettime, boneindex, modelindex) {
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

// Namespace robotsoldierserverutils/archetype_robot
// Params 8, eflags: 0x5 linked
// Checksum 0x818c2af5, Offset: 0xc6b0
// Size: 0x78
function private robotdeathoverride(inflictor, attacker, damage, meansofdeath, weapon, dir, hitloc, offsettime) {
    entity = self;
    entity ai::set_behavior_attribute("robot_lights", 4);
    return damage;
}

// Namespace robotsoldierserverutils/archetype_robot
// Params 8, eflags: 0x5 linked
// Checksum 0xfeb4f601, Offset: 0xc730
// Size: 0x300
function private robotgibdeathoverride(inflictor, attacker, damage, meansofdeath, weapon, dir, hitloc, offsettime) {
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

// Namespace robotsoldierserverutils/archetype_robot
// Params 8, eflags: 0x5 linked
// Checksum 0x7f22d84b, Offset: 0xca38
// Size: 0x1f8
function private robotdestructdeathoverride(inflictor, attacker, damage, meansofdeath, weapon, dir, hitloc, offsettime) {
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

// Namespace robotsoldierserverutils/archetype_robot
// Params 12, eflags: 0x5 linked
// Checksum 0xf2159631, Offset: 0xcc38
// Size: 0x396
function private robotdamageoverride(inflictor, attacker, damage, flags, meansofdamage, weapon, point, dir, hitloc, offsettime, boneindex, modelindex) {
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
        isbullet = isinarray(array("MOD_RIFLE_BULLET", "MOD_PISTOL_BULLET"), meansofdamage);
        istorsoshot = isinarray(array("torso_upper", "torso_lower"), hitloc);
        if (isbullet && istorsoshot) {
            damage = int(damage * 2);
        }
    }
    if (weapon.name == #"sticky_grenade") {
        switch (meansofdamage) {
        case #"mod_impact":
            entity.stuckwithstickygrenade = 1;
            break;
        case #"mod_grenade_splash":
            if (isdefined(entity.stuckwithstickygrenade) && entity.stuckwithstickygrenade) {
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

// Namespace robotsoldierserverutils/archetype_robot
// Params 12, eflags: 0x5 linked
// Checksum 0xa745d386, Offset: 0xcfd8
// Size: 0xf0
function private robotdestructrandompieces(inflictor, attacker, damage, flags, meansofdamage, weapon, point, dir, hitloc, offsettime, boneindex, modelindex) {
    entity = self;
    isexplosive = isinarray(array("MOD_CRUSH", "MOD_GRENADE", "MOD_GRENADE_SPLASH", "MOD_PROJECTILE", "MOD_PROJECTILE_SPLASH", "MOD_EXPLOSIVE"), meansofdamage);
    if (isexplosive) {
        destructserverutils::destructrandompieces(entity);
    }
    return damage;
}

// Namespace robotsoldierserverutils/archetype_robot
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

// Namespace robotsoldierserverutils/archetype_robot
// Params 2, eflags: 0x4
// Checksum 0x9097584b, Offset: 0xd158
// Size: 0x9c
function private robotchoosecoverdirection(entity, stepout) {
    if (!isdefined(entity.node)) {
        return;
    }
    coverdirection = entity getblackboardattribute("_cover_direction");
    entity setblackboardattribute("_previous_cover_direction", coverdirection);
    entity setblackboardattribute("_cover_direction", aiutility::calculatecoverdirection(entity, stepout));
}

// Namespace robotsoldierserverutils/archetype_robot
// Params 0, eflags: 0x5 linked
// Checksum 0x890d3ba5, Offset: 0xd200
// Size: 0x62c
function private robotsoldierspawnsetup() {
    entity = self;
    entity.iscrawler = 0;
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
    entity.empshutdowntime = 2000;
    entity.nofriendlyfire = 1;
    entity.ignorerunandgundist = 1;
    entity.disablerepath = 0;
    entity.robotrushermaxradius = 250;
    entity.robotrusherminradius = 150;
    entity.gibdeath = math::cointoss();
    entity.minwalkdistance = 240;
    entity.supersprintdistance = 300;
    entity.treatallcoversasgeneric = 1;
    entity.onlycroucharrivals = 1;
    entity.chargemeleedistance = 125;
    entity.allowcollidewithactors = 1;
    entity.nextpreemptivejukeads = randomfloatrange(0.5, 0.95);
    entity.shouldpreemptivejuke = math::cointoss();
    destructserverutils::togglespawngibs(entity, 1);
    gibserverutils::togglespawngibs(entity, 1);
    clientfield::set("robot_mind_control", 0);
    /#
        if (getdvarint(#"ai_robotforceprocedural", 0)) {
            entity ai::set_behavior_attribute("rbJuke", "left_leg_upper");
        }
    #/
    entity thread cleanupequipment(entity);
    aiutility::addaioverridedamagecallback(entity, &destructserverutils::handledamage);
    aiutility::addaioverridedamagecallback(entity, &robotdamageoverride);
    aiutility::addaioverridedamagecallback(entity, &robotdestructrandompieces);
    aiutility::addaioverridedamagecallback(entity, &robotgibdamageoverride);
    aiutility::addaioverridekilledcallback(entity, &robotdeathoverride);
    aiutility::addaioverridekilledcallback(entity, &robotgibdeathoverride);
    aiutility::addaioverridekilledcallback(entity, &robotdestructdeathoverride);
    /#
        if (getdvarint(#"ai_robotforcecontrol", 0) == 1) {
            entity ai::set_behavior_attribute("torso_upper", "_robot_locomotion_type");
        } else if (getdvarint(#"ai_robotforcecontrol", 0) == 2) {
            entity ai::set_behavior_attribute("torso_upper", "<unknown string>");
        } else if (getdvarint(#"ai_robotforcecontrol", 0) == 3) {
            entity ai::set_behavior_attribute("torso_upper", "<unknown string>");
        }
        if (getdvarint(#"ai_robotspawnforcecontrol", 0) == 1) {
            entity ai::set_behavior_attribute("torso_upper", "<unknown string>");
        } else if (getdvarint(#"ai_robotspawnforcecontrol", 0) == 2) {
            entity ai::set_behavior_attribute("torso_upper", "<unknown string>");
        } else if (getdvarint(#"ai_robotspawnforcecontrol", 0) == 3) {
            entity ai::set_behavior_attribute("torso_upper", "<unknown string>");
        }
    #/
    if (getdvarint(#"ai_robotforcecrawler", 0) == 1) {
        entity ai::set_behavior_attribute("force_crawler", "gib_legs");
    } else if (getdvarint(#"ai_robotforcecrawler", 0) == 2) {
        entity ai::set_behavior_attribute("force_crawler", "remove_legs");
    }
}

// Namespace robotsoldierserverutils/archetype_robot
// Params 1, eflags: 0x4
// Checksum 0x6a5bf866, Offset: 0xd838
// Size: 0xd2
function private robotgivewasp(entity) {
    if (isdefined(entity) && !isdefined(entity.wasp)) {
        wasp = spawn("script_model", (0, 0, 0));
        wasp setmodel(#"veh_t7_drone_attack_red");
        wasp setscale(0.75);
        wasp linkto(entity, "j_spine4", (5, -15, 0), vectorscale((0, 0, 1), 90));
        entity.wasp = wasp;
    }
}

// Namespace robotsoldierserverutils/archetype_robot
// Params 1, eflags: 0x4
// Checksum 0x756c6fc, Offset: 0xd918
// Size: 0x136
function private robotdeploywasp(entity) {
    entity endon(#"death");
    wait(randomfloatrange(7, 10));
    if (isdefined(entity) && isdefined(entity.wasp)) {
        spawnoffset = (5, -15, 0);
        while (!ispointinnavvolume(entity.wasp.origin + spawnoffset, "small volume")) {
            wait(1);
        }
        entity.wasp unlink();
        wasp = spawnvehicle("spawner_bo3_wasp_enemy", entity.wasp.origin + spawnoffset, (0, 0, 0));
        entity.wasp delete();
    }
    entity.wasp = undefined;
}

// Namespace robotsoldierserverutils/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xf354bf0b, Offset: 0xda58
// Size: 0x4c
function private rapsdetonatecountdown(entity) {
    entity endon(#"death");
    wait(randomfloatrange(20, 30));
    raps::detonate();
}

// Namespace robotsoldierserverutils/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0xc66926e7, Offset: 0xdab0
// Size: 0x56
function private becomecrawler(entity) {
    if (!robotsoldierbehavior::robotiscrawler(entity) && entity ai::get_behavior_attribute("can_become_crawler")) {
        entity.becomecrawler = 1;
    }
}

// Namespace robotsoldierserverutils/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x90b1a83f, Offset: 0xdb10
// Size: 0x7e
function private cleanupequipment(entity) {
    entity waittill(#"death");
    if (!isdefined(entity)) {
        return;
    }
    if (isdefined(entity.miniraps)) {
        entity.miniraps = undefined;
    }
    if (isdefined(entity.wasp)) {
        entity.wasp delete();
        entity.wasp = undefined;
    }
}

// Namespace robotsoldierserverutils/archetype_robot
// Params 0, eflags: 0x5 linked
// Checksum 0xc3091ea2, Offset: 0xdb98
// Size: 0x7c
function private forcerobotsoldiermindcontrollevel1() {
    entity = self;
    if (entity.controllevel >= 1) {
        return;
    }
    entity.controllevel = 1;
    clientfield::set("robot_mind_control", 1);
    entity ai::set_behavior_attribute("rogue_control", "level_1");
}

// Namespace robotsoldierserverutils/archetype_robot
// Params 0, eflags: 0x5 linked
// Checksum 0xc5f2dc48, Offset: 0xdc20
// Size: 0x294
function private forcerobotsoldiermindcontrollevel2() {
    entity = self;
    if (entity.controllevel >= 2) {
        return;
    }
    rogue_melee_weapon = getweapon(#"rogue_robot_melee");
    locomotiontypes = array("alt1", "alt2", "alt3", "alt4", "alt5");
    entity setblackboardattribute("_robot_locomotion_type", locomotiontypes[randomint(locomotiontypes.size)]);
    entity asmsetanimationrate(randomfloatrange(0.95, 1.05));
    entity forcerobotsoldiermindcontrollevel1();
    entity.combatmode = "no_cover";
    entity setavoidancemask("avoid none");
    entity.controllevel = 2;
    entity shared::placeweaponon(entity.weapon, "none");
    entity.meleeweapon = rogue_melee_weapon;
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

// Namespace robotsoldierserverutils/archetype_robot
// Params 0, eflags: 0x5 linked
// Checksum 0xdede6857, Offset: 0xdec0
// Size: 0x8c
function private forcerobotsoldiermindcontrollevel3() {
    entity = self;
    if (entity.controllevel >= 3) {
        return;
    }
    forcerobotsoldiermindcontrollevel2();
    entity.controllevel = 3;
    clientfield::set("robot_mind_control", 3);
    entity ai::set_behavior_attribute("rogue_control", "level_3");
}

// Namespace robotsoldierserverutils/archetype_robot
// Params 4, eflags: 0x1 linked
// Checksum 0xd5cb1834, Offset: 0xdf58
// Size: 0x32
function robotequipminiraps(entity, attribute, oldvalue, value) {
    entity.miniraps = value;
}

// Namespace robotsoldierserverutils/archetype_robot
// Params 4, eflags: 0x1 linked
// Checksum 0x46c3ef21, Offset: 0xdf98
// Size: 0x104
function robotlights(entity, attribute, oldvalue, value) {
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

// Namespace robotsoldierserverutils/archetype_robot
// Params 1, eflags: 0x1 linked
// Checksum 0xcd7c3768, Offset: 0xe0a8
// Size: 0xf4
function randomgibroguerobot(entity) {
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

// Namespace robotsoldierserverutils/archetype_robot
// Params 4, eflags: 0x1 linked
// Checksum 0xacc4eead, Offset: 0xe1a8
// Size: 0x182
function roguecontrolattributecallback(entity, attribute, oldvalue, value) {
    switch (value) {
    case #"forced_level_1":
        if (entity.controllevel <= 0) {
            forcerobotsoldiermindcontrollevel1();
        }
        break;
    case #"forced_level_2":
        if (entity.controllevel <= 1) {
            forcerobotsoldiermindcontrollevel2();
            destructserverutils::togglespawngibs(entity, 0);
            if (entity ai::get_behavior_attribute("rogue_allow_pregib")) {
                randomgibroguerobot(entity);
            }
        }
        break;
    case #"forced_level_3":
        if (entity.controllevel <= 2) {
            forcerobotsoldiermindcontrollevel3();
            destructserverutils::togglespawngibs(entity, 0);
            if (entity ai::get_behavior_attribute("rogue_allow_pregib")) {
                randomgibroguerobot(entity);
            }
        }
        break;
    }
}

// Namespace robotsoldierserverutils/archetype_robot
// Params 4, eflags: 0x1 linked
// Checksum 0x92605e1f, Offset: 0xe338
// Size: 0x152
function robotmovemodeattributecallback(entity, attribute, oldvalue, value) {
    entity.ignorepathenemyfightdist = 0;
    entity setblackboardattribute("_move_mode", "normal");
    if (value != "guard") {
        entity.guardposition = undefined;
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

// Namespace robotsoldierserverutils/archetype_robot
// Params 4, eflags: 0x1 linked
// Checksum 0xedad1a46, Offset: 0xe498
// Size: 0x25c
function robotforcecrawler(entity, attribute, oldvalue, value) {
    if (robotsoldierbehavior::robotiscrawler(entity)) {
        return;
    }
    if (!entity ai::get_behavior_attribute("can_become_crawler")) {
        return;
    }
    switch (value) {
    case #"normal":
        return;
    case #"gib_legs":
        gibserverutils::togglespawngibs(entity, 1);
        destructserverutils::togglespawngibs(entity, 1);
        break;
    case #"remove_legs":
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
            robotsoldierbehavior::robotbecomecrawler(entity);
        }
    }
}

// Namespace robotsoldierserverutils/archetype_robot
// Params 4, eflags: 0x1 linked
// Checksum 0xe47ae4cb, Offset: 0xe700
// Size: 0x10c
function roguecontrolforcegoalattributecallback(entity, attribute, oldvalue, value) {
    if (!isvec(value)) {
        return;
    }
    roguecontrolled = isinarray(array("level_2", "level_3"), entity ai::get_behavior_attribute("rogue_control"));
    if (!roguecontrolled) {
        entity ai::set_behavior_attribute("rogue_control_force_goal", undefined);
    } else {
        entity.favoriteenemy = undefined;
        entity clearpath();
        entity function_a57c34b7(entity ai::get_behavior_attribute("rogue_control_force_goal"));
    }
}

// Namespace robotsoldierserverutils/archetype_robot
// Params 4, eflags: 0x1 linked
// Checksum 0x5b78a310, Offset: 0xe818
// Size: 0xe2
function roguecontrolspeedattributecallback(entity, attribute, oldvalue, value) {
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

// Namespace robotsoldierserverutils/archetype_robot
// Params 4, eflags: 0x1 linked
// Checksum 0x4bbd6c7c, Offset: 0xe908
// Size: 0x7a
function robottraversalattributecallback(entity, attribute, oldvalue, value) {
    switch (value) {
    case #"normal":
        entity.manualtraversemode = 0;
        break;
    case #"procedural":
        entity.manualtraversemode = 1;
        break;
    }
}

// Namespace robotsoldierserverutils/archetype_robot
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

// Namespace robotsoldierserverutils/archetype_robot
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

