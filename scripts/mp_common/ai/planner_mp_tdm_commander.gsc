#using scripts\core_common\ai\planner_commander;
#using scripts\core_common\ai\planner_commander_utility;
#using scripts\core_common\ai\planner_generic_commander;
#using scripts\core_common\ai\planner_squad_utility;
#using scripts\core_common\ai\systems\blackboard;
#using scripts\core_common\ai\systems\planner;
#using scripts\mp_common\ai\planner_mp_commander_utility;
#using scripts\mp_common\ai\planner_mp_tdm_squad;

#namespace plannermptdmcommander;

// Namespace plannermptdmcommander/planner_mp_tdm_commander
// Params 1, eflags: 0x4
// Checksum 0x23485c29, Offset: 0x138
// Size: 0x32
function private createcommanderplanner( team )
{
    planner = plannerutility::createplannerfromasset( "mp_tdm_commander.ai_htn" );
    return planner;
}

// Namespace plannermptdmcommander/planner_mp_tdm_commander
// Params 1
// Checksum 0x9a3b4b0e, Offset: 0x178
// Size: 0x118
function createcommander( team )
{
    commander = plannercommanderutility::createcommander( team, createcommanderplanner( team ), plannermptdmsquad::createsquadplanner( team ) );
    plannergenericcommander::commanderdaemons( commander );
    plannercommanderutility::addsquadevaluator( commander, "commanderScoreBotPresence" );
    plannercommanderutility::addsquadevaluator( commander, "commanderScoreForceGoal" );
    plannercommanderutility::addsquadevaluator( commander, "commanderScoreTeam" );
    plannercommanderutility::addsquadevaluator( commander, "commanderScoreAge", [ #"maxage":15000 ] );
    plannercommanderutility::addsquadevaluator( commander, "commanderScoreAlive" );
    return commander;
}

