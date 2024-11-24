#using scripts\core_common\ai\planner_commander;
#using scripts\core_common\ai\planner_commander_utility;
#using scripts\core_common\ai\planner_squad_utility;
#using scripts\core_common\ai\systems\planner;
#using scripts\zm_common\ai\planner_zm_squad_utility;

#namespace namespace_42cba673;

// Namespace namespace_42cba673/planner_zm_generic_squad
// Params 1, eflags: 0x1 linked
// Checksum 0xa1801263, Offset: 0xa8
// Size: 0x32
function createsquadplanner(team) {
    planner = plannerutility::createplannerfromasset("zm_squad.ai_htn");
    return planner;
}

