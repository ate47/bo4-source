// Atian COD Tools GSC decompiler test
#include script_16b1c195c0b9a9c;
#include scripts/core_common/ai/planner_squad_utility.gsc;
#include scripts/core_common/ai/planner_commander_utility.gsc;
#include scripts/core_common/ai/planner_commander.gsc;
#include scripts/core_common/ai/systems/planner.gsc;

#namespace plannermpkothsquad;

// Namespace plannermpkothsquad/planner_mp_koth_squad
// Params 1, eflags: 0x1 linked
// Checksum 0x49d2c99e, Offset: 0xa8
// Size: 0x32
function createsquadplanner(team) {
    planner = plannerutility::createplannerfromasset("mp_koth_squad.ai_htn");
    return planner;
}

