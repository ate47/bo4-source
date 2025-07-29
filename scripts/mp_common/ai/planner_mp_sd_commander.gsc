#using scripts\core_common\ai\planner_commander;
#using scripts\core_common\ai\planner_commander_utility;
#using scripts\core_common\ai\planner_generic_commander;
#using scripts\core_common\ai\planner_squad_utility;
#using scripts\core_common\ai\systems\blackboard;
#using scripts\core_common\ai\systems\planner;
#using scripts\mp_common\ai\planner_mp_commander_utility;
#using scripts\mp_common\ai\planner_mp_sd_squad;

#namespace plannermpsdcommander;

// Namespace plannermpsdcommander/planner_mp_sd_commander
// Params 1, eflags: 0x4
// Checksum 0x676cb0ad, Offset: 0x158
// Size: 0x32
function private createcommanderplanner( team )
{
    planner = plannerutility::createplannerfromasset( "mp_sd_commander.ai_htn" );
    return planner;
}

// Namespace plannermpsdcommander/planner_mp_sd_commander
// Params 1
// Checksum 0xaa9d228e, Offset: 0x198
// Size: 0x1c0
function createcommander( team )
{
    commander = plannercommanderutility::createcommander( team, createcommanderplanner( team ), plannermpsdsquad::createsquadplanner( team ), float( function_60d95f53() ) / 1000 * 40, float( function_60d95f53() ) / 1000 * 100, 3, 3 );
    plannergenericcommander::commanderdaemons( commander );
    plannercommanderutility::adddaemon( commander, "daemonSdBomb" );
    plannercommanderutility::adddaemon( commander, "daemonSdBombZones" );
    plannercommanderutility::adddaemon( commander, "daemonSdDefuseObj" );
    plannercommanderutility::addsquadevaluator( commander, "commanderScoreBotPresence" );
    plannercommanderutility::addsquadevaluator( commander, "commanderScoreForceGoal" );
    plannercommanderutility::addsquadevaluator( commander, "commanderScoreTeam" );
    plannercommanderutility::addsquadevaluator( commander, "commanderScoreAge", [ #"maxage":6000 ] );
    return commander;
}

