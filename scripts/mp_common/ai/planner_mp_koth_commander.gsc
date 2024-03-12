// Atian COD Tools GSC decompiler test
#using scripts\mp_common\ai\planner_mp_koth_squad.gsc;
#using script_60f1433e7c9a921c;
#using scripts\core_common\ai\planner_squad_utility.gsc;
#using scripts\core_common\ai\planner_generic_commander.gsc;
#using scripts\core_common\ai\planner_commander_utility.gsc;
#using scripts\core_common\ai\planner_commander.gsc;
#using scripts\core_common\ai\systems\planner.gsc;
#using scripts\core_common\ai\systems\blackboard.gsc;

#namespace plannermpkothcommander;

// Namespace plannermpkothcommander/planner_mp_koth_commander
// Params 1, eflags: 0x4
// Checksum 0x40dc25db, Offset: 0x168
// Size: 0x32
function private createcommanderplanner(team) {
    planner = plannerutility::createplannerfromasset("mp_koth_commander.ai_htn");
    return planner;
}

// Namespace plannermpkothcommander/planner_mp_koth_commander
// Params 1, eflags: 0x0
// Checksum 0x82deeec3, Offset: 0x1a8
// Size: 0x1c0
function createcommander(team) {
    commander = plannercommanderutility::createcommander(team, createcommanderplanner(team), plannermpkothsquad::createsquadplanner(team), float(function_60d95f53()) / 1000 * 40, float(function_60d95f53()) / 1000 * 100, 3, 3);
    plannergenericcommander::commanderdaemons(commander);
    plannercommanderutility::adddaemon(commander, "daemonKothZone");
    plannercommanderutility::addsquadevaluator(commander, "commanderScoreBotPresence");
    plannercommanderutility::addsquadevaluator(commander, "commanderScoreForceGoal");
    plannercommanderutility::addsquadevaluator(commander, "commanderScoreKothZone");
    plannercommanderutility::addsquadevaluator(commander, "commanderScoreTeam");
    plannercommanderutility::addsquadevaluator(commander, "commanderScoreAge", [#"maxage":15000]);
    plannercommanderutility::addsquadevaluator(commander, "commanderScoreAlive");
    return commander;
}

