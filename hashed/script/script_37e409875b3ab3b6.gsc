#using script_c5bc2e592d581d0;
#using script_55cdac8f3eaa44cd;
#using script_770268ef1e664da9;
#using script_1b4af057274ffcd0;
#using script_37e409875b3ab3b6;
#using scripts\core_common\ai\planner_squad_utility.gsc;
#using scripts\core_common\ai\planner_generic_squad.gsc;
#using scripts\core_common\ai\planner_generic_commander.gsc;
#using scripts\core_common\ai\planner_commander_utility.gsc;
#using scripts\core_common\ai\planner_commander.gsc;
#using scripts\core_common\ai\systems\planner.gsc;
#using scripts\core_common\ai\systems\blackboard.gsc;

#namespace namespace_4932f496;

// Namespace namespace_4932f496/namespace_45b9b8e8
// Params 1, eflags: 0x4
// Checksum 0x734d6668, Offset: 0x118
// Size: 0x32
function private _createcommanderplanner(team) {
    planner = plannerutility::createplannerfromasset("zm_commander.ai_htn");
    return planner;
}

// Namespace namespace_4932f496/namespace_45b9b8e8
// Params 1, eflags: 0x4
// Checksum 0x9bf35a47, Offset: 0x158
// Size: 0x32
function private _createsquadplanner(team) {
    planner = plannerutility::createplannerfromasset("zm_squad.ai_htn");
    return planner;
}

// Namespace namespace_4932f496/namespace_45b9b8e8
// Params 0, eflags: 0x0
// Checksum 0xc0f18a4f, Offset: 0x198
// Size: 0xcc
function createcommander() {
    team = #"allies";
    commander = plannercommanderutility::createcommander(team, _createcommanderplanner(team), _createsquadplanner(team));
    plannergenericcommander::commanderdaemons(commander);
    plannercommanderutility::adddaemon(commander, "daemonZmBlockers");
    plannercommanderutility::adddaemon(commander, "daemonZmWallBuys");
    plannergenericcommander::commanderutilityevaluators(commander);
}

