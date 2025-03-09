#using scripts\core_common\ai\planner_commander;
#using scripts\core_common\ai\strategic_command;
#using scripts\core_common\ai\systems\blackboard;
#using scripts\core_common\ai\systems\planner;

#namespace plannergenericcommander;

// Namespace plannergenericcommander/planner_generic_commander
// Params 1, eflags: 0x4
// Checksum 0xc3567989, Offset: 0x290
// Size: 0x32
function private _createcommanderplanner(team) {
    planner = plannerutility::createplannerfromasset("strategic_commander.ai_htn");
    return planner;
}

// Namespace plannergenericcommander/planner_generic_commander
// Params 1, eflags: 0x4
// Checksum 0x86fc34b1, Offset: 0x2d0
// Size: 0x32
function private _createsquadplanner(team) {
    planner = plannerutility::createplannerfromasset("strategic_squad.ai_htn");
    return planner;
}

// Namespace plannergenericcommander/planner_generic_commander
// Params 1, eflags: 0x0
// Checksum 0x36501048, Offset: 0x310
// Size: 0xc8
function createcommander(team) {
    commander = plannercommanderutility::createcommander(team, _createcommanderplanner(team), _createsquadplanner(team));
    commanderdaemons(commander);
    commanderutilityevaluators(commander);
    blackboard::setstructblackboardattribute(commander, #"gameobjects_exclude", array("ammo_cache", "mobile_armory", "trap"));
    return commander;
}

// Namespace plannergenericcommander/planner_generic_commander
// Params 1, eflags: 0x0
// Checksum 0xb8fcb612, Offset: 0x3e0
// Size: 0x74
function commanderdaemons(commander) {
    assert(isstruct(commander));
    plannercommanderutility::adddaemon(commander, "daemonClients");
    plannercommanderutility::adddaemon(commander, "daemonGameobjects");
}

// Namespace plannergenericcommander/planner_generic_commander
// Params 1, eflags: 0x0
// Checksum 0x2738d30c, Offset: 0x460
// Size: 0x1b4
function commanderutilityevaluators(commander) {
    assert(isstruct(commander));
    plannercommanderutility::addsquadevaluator(commander, "commanderScoreBotChain");
    plannercommanderutility::addsquadevaluator(commander, "commanderScoreBotPresence");
    plannercommanderutility::addsquadevaluator(commander, "commanderScoreBotVehiclePresence");
    plannercommanderutility::addsquadevaluator(commander, "commanderScoreEscortPathing");
    plannercommanderutility::addsquadevaluator(commander, "commanderScoreForceGoal");
    plannercommanderutility::addsquadevaluator(commander, "commanderScoreGameobjectsValidity");
    plannercommanderutility::addsquadevaluator(commander, "commanderScoreGameobjectPathing");
    plannercommanderutility::addsquadevaluator(commander, "commanderScoreNoTarget");
    plannercommanderutility::addsquadevaluator(commander, "commanderScoreTeam");
    plannercommanderutility::addsquadevaluator(commander, "commanderScoreViableEscort");
    plannercommanderutility::addsquadevaluator(commander, "commanderScoreProgressThrottling");
    plannercommanderutility::addsquadevaluator(commander, "commanderScoreTarget");
}

// Namespace plannergenericcommander/planner_generic_commander
// Params 0, eflags: 0x0
// Checksum 0x420cb40d, Offset: 0x620
// Size: 0x66
function function_6549878f() {
    function_321afadc();
    level.axiscommander = createcommander(#"axis");
    level.alliescommander = createcommander(#"allies");
}

// Namespace plannergenericcommander/planner_generic_commander
// Params 0, eflags: 0x0
// Checksum 0x1342a587, Offset: 0x690
// Size: 0x44
function function_321afadc() {
    strategiccommandutility::function_1852d313("default_strategicbundle", "sidea");
    strategiccommandutility::function_1852d313("default_strategicbundle", "sideb");
}

