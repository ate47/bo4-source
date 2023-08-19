// Atian COD Tools GSC decompiler test
#include script_16b1c195c0b9a9c;
#include scripts/core_common/ai/planner_squad_utility.gsc;
#include scripts/core_common/ai/planner_commander_utility.gsc;
#include scripts/core_common/ai/planner_commander.gsc;
#include script_31e56101095f174b;

#namespace plannermpdomsquad;

// Namespace plannermpdomsquad/planner_mp_dom_squad
// Params 1, eflags: 0x1 linked
// Checksum 0xba33dab, Offset: 0xa8
// Size: 0x32
function createsquadplanner(team) {
    planner = plannerutility::createplannerfromasset("mp_dom_squad.ai_htn");
    return planner;
}

