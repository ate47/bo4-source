// Atian COD Tools GSC decompiler test
#include script_16b1c195c0b9a9c;
#include scripts/core_common/ai/planner_squad_utility.gsc;
#include scripts/core_common/ai/planner_commander_utility.gsc;
#include scripts/core_common/ai/planner_commander.gsc;
#include script_31e56101095f174b;

#namespace plannermptdmsquad;

// Namespace plannermptdmsquad/planner_mp_tdm_squad
// Params 1, eflags: 0x1 linked
// Checksum 0xaaae6df0, Offset: 0xa8
// Size: 0x32
function createsquadplanner(team) {
    planner = plannerutility::createplannerfromasset("mp_tdm_squad.ai_htn");
    return planner;
}
