#using scripts\core_common\ai\planner_commander;
#using scripts\core_common\ai\planner_commander_utility;
#using scripts\core_common\ai\planner_squad_utility;
#using scripts\core_common\ai\systems\planner;
#using scripts\mp_common\ai\planner_mp_squad_utility;

#namespace plannermpcontrolsquad;

// Namespace plannermpcontrolsquad/planner_mp_control_squad
// Params 1
// Checksum 0x10555cf7, Offset: 0xb0
// Size: 0x32
function createsquadplanner( team )
{
    planner = plannerutility::createplannerfromasset( "mp_control_squad.ai_htn" );
    return planner;
}

