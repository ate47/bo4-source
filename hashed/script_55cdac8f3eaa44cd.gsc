// Atian COD Tools GSC decompiler test
#using script_c5bc2e592d581d0;
#using scripts\core_common\ai\planner_squad_utility.gsc;
#using scripts\core_common\ai\planner_commander_utility.gsc;
#using scripts\core_common\ai\planner_commander.gsc;
#using scripts\core_common\ai\systems\planner.gsc;

#namespace namespace_42cba673;

// Namespace namespace_42cba673/namespace_299eed9e
// Params 1, eflags: 0x1 linked
// Checksum 0xa1801263, Offset: 0xa8
// Size: 0x32
function createsquadplanner(team) {
    planner = plannerutility::createplannerfromasset("zm_squad.ai_htn");
    return planner;
}

