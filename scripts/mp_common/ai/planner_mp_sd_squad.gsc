// Atian COD Tools GSC decompiler test
#using script_16b1c195c0b9a9c;
#using scripts\core_common\ai\planner_squad_utility.gsc;
#using scripts\core_common\ai\planner_commander_utility.gsc;
#using scripts\core_common\ai\planner_commander.gsc;
#using scripts\core_common\ai\systems\planner.gsc;

#namespace plannermpsdsquad;

// Namespace plannermpsdsquad/planner_mp_sd_squad
// Params 1, eflags: 0x1 linked
// Checksum 0x64231435, Offset: 0xa8
// Size: 0x32
function createsquadplanner(team) {
    planner = plannerutility::createplannerfromasset("mp_sd_squad.ai_htn");
    return planner;
}

