// Atian COD Tools GSC decompiler test
#include scripts/mp_common/ai/planner_mp_control_squad.gsc;
#include script_60f1433e7c9a921c;
#include scripts/core_common/ai/planner_squad_utility.gsc;
#include scripts/core_common/ai/planner_generic_commander.gsc;
#include scripts/core_common/ai/planner_commander_utility.gsc;
#include scripts/core_common/ai/planner_commander.gsc;
#include scripts/core_common/ai/systems/planner.gsc;
#include scripts/core_common/ai/systems/blackboard.gsc;

#namespace plannermpcontrolcommander;

// Namespace plannermpcontrolcommander/planner_mp_control_commander
// Params 1, eflags: 0x5 linked
// Checksum 0xb9512cd, Offset: 0x170
// Size: 0x32
function private createcommanderplanner(team) {
    planner = plannerutility::createplannerfromasset("mp_control_commander.ai_htn");
    return planner;
}

// Namespace plannermpcontrolcommander/planner_mp_control_commander
// Params 1, eflags: 0x1 linked
// Checksum 0x1fab739d, Offset: 0x1b0
// Size: 0x1c0
function createcommander(team) {
    commander = plannercommanderutility::createcommander(team, createcommanderplanner(team), plannermpcontrolsquad::createsquadplanner(team), float(function_60d95f53()) / 1000 * 40, float(function_60d95f53()) / 1000 * 100, 3, 3);
    plannergenericcommander::commanderdaemons(commander);
    plannercommanderutility::adddaemon(commander, "daemonControlZones");
    plannercommanderutility::addsquadevaluator(commander, "commanderScoreBotPresence");
    plannercommanderutility::addsquadevaluator(commander, "commanderScoreForceGoal");
    plannercommanderutility::addsquadevaluator(commander, "commanderScoreTeam");
    plannercommanderutility::addsquadevaluator(commander, "commanderScoreAge", [#"maxage":20000]);
    plannercommanderutility::addsquadevaluator(commander, "commanderScoreAlive");
    plannercommanderutility::addsquadevaluator(commander, "commanderScoreControlZones");
    return commander;
}

