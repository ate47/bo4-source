#using scripts\core_common\ai\planner_commander;
#using scripts\core_common\ai\planner_commander_utility;
#using scripts\core_common\ai\planner_squad_utility;
#using scripts\core_common\ai\systems\planner;
#using scripts\mp_common\ai\planner_mp_squad_utility;

#namespace plannermpsdsquad;

// Namespace plannermpsdsquad/planner_mp_sd_squad
// Params 1
// Checksum 0x64231435, Offset: 0xa8
// Size: 0x32
function createsquadplanner( team )
{
    planner = plannerutility::createplannerfromasset( "mp_sd_squad.ai_htn" );
    return planner;
}

