// Atian COD Tools GSC decompiler test
#include scripts/mp_common/ai/planner_mp_tdm_squad.gsc;
#include script_60f1433e7c9a921c;
#include scripts/core_common/ai/planner_squad_utility.gsc;
#include scripts/core_common/ai/planner_generic_commander.gsc;
#include scripts/core_common/ai/planner_commander_utility.gsc;
#include scripts/core_common/ai/planner_commander.gsc;
#include script_31e56101095f174b;
#include script_522aeb6ae906391e;

#namespace plannermptdmcommander;

// Namespace plannermptdmcommander/planner_mp_tdm_commander
// Params 1, eflags: 0x5 linked
// Checksum 0x23485c29, Offset: 0x138
// Size: 0x32
function private createcommanderplanner(team) {
    planner = plannerutility::createplannerfromasset("mp_tdm_commander.ai_htn");
    return planner;
}

// Namespace plannermptdmcommander/planner_mp_tdm_commander
// Params 1, eflags: 0x1 linked
// Checksum 0x9a3b4b0e, Offset: 0x178
// Size: 0x118
function createcommander(team) {
    commander = plannercommanderutility::createcommander(team, createcommanderplanner(team), plannermptdmsquad::createsquadplanner(team));
    plannergenericcommander::commanderdaemons(commander);
    plannercommanderutility::addsquadevaluator(commander, "commanderScoreBotPresence");
    plannercommanderutility::addsquadevaluator(commander, "commanderScoreForceGoal");
    plannercommanderutility::addsquadevaluator(commander, "commanderScoreTeam");
    plannercommanderutility::addsquadevaluator(commander, "commanderScoreAge", [#"maxage":15000]);
    plannercommanderutility::addsquadevaluator(commander, "commanderScoreAlive");
    return commander;
}
