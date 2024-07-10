#using script_16b1c195c0b9a9c;
#using scripts\core_common\ai\planner_squad_utility.gsc;
#using scripts\core_common\ai\planner_commander_utility.gsc;
#using scripts\core_common\ai\planner_commander.gsc;
#using scripts\core_common\ai\systems\planner.gsc;

#namespace plannermpdomsquad;

// Namespace plannermpdomsquad/planner_mp_dom_squad
// Params 1, eflags: 0x0
// Checksum 0xba33dab, Offset: 0xa8
// Size: 0x32
function createsquadplanner(team) {
    planner = plannerutility::createplannerfromasset("mp_dom_squad.ai_htn");
    return planner;
}

