#using script_16b1c195c0b9a9c;
#using scripts\core_common\ai\planner_squad_utility;
#using scripts\core_common\ai\planner_commander_utility;
#using scripts\core_common\ai\planner_commander;
#using scripts\core_common\ai\systems\planner;

#namespace plannermptdmsquad;

// Namespace plannermptdmsquad/planner_mp_tdm_squad
// Params 1, eflags: 0x0
// Checksum 0xaaae6df0, Offset: 0xa8
// Size: 0x32
function createsquadplanner(team) {
    planner = plannerutility::createplannerfromasset("mp_tdm_squad.ai_htn");
    return planner;
}

