#using scripts\core_common\ai\planner_commander;
#using scripts\core_common\ai\systems\ai_interface;

#namespace commanderinterface;

// Namespace commanderinterface/planner_commander_interface
// Params 0
// Checksum 0x3a2bfa2d, Offset: 0x78
// Size: 0x9c
function registercommanderinterfaceattributes()
{
    ai::registerentityinterface( #"commander", #"commander_force_goal", undefined, &plannercommanderutility::setforcegoalattribute );
    ai::registermatchedinterface( #"commander", #"commander_golden_path", 1, array( 1, 0 ), &plannercommanderutility::setgoldenpathattribute );
}

