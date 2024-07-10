#using script_16b1c195c0b9a9c;
#using scripts\core_common\ai\planner_squad_utility.gsc;
#using scripts\core_common\ai\planner_commander_utility.gsc;
#using scripts\core_common\ai\planner_commander.gsc;
#using scripts\core_common\ai\systems\planner.gsc;

#namespace plannermpcontrolsquad;

// Namespace plannermpcontrolsquad/planner_mp_control_squad
// Params 1, eflags: 0x0
// Checksum 0x10555cf7, Offset: 0xb0
// Size: 0x32
function createsquadplanner(team) {
    planner = plannerutility::createplannerfromasset("mp_control_squad.ai_htn");
    return planner;
}

