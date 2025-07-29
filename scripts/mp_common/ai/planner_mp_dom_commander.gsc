#using scripts\core_common\ai\planner_commander;
#using scripts\core_common\ai\planner_commander_utility;
#using scripts\core_common\ai\planner_generic_commander;
#using scripts\core_common\ai\planner_squad_utility;
#using scripts\core_common\ai\systems\blackboard;
#using scripts\core_common\ai\systems\planner;
#using scripts\mp_common\ai\planner_mp_commander_utility;
#using scripts\mp_common\ai\planner_mp_dom_squad;

#namespace plannermpdomcommander;

// Namespace plannermpdomcommander/planner_mp_dom_commander
// Params 1, eflags: 0x4
// Checksum 0xcd5775f9, Offset: 0x188
// Size: 0x32
function private createcommanderplanner( team )
{
    planner = plannerutility::createplannerfromasset( "mp_dom_commander.ai_htn" );
    return planner;
}

// Namespace plannermpdomcommander/planner_mp_dom_commander
// Params 1
// Checksum 0xf46738e5, Offset: 0x1c8
// Size: 0x1e0
function createcommander( team )
{
    commander = plannercommanderutility::createcommander( team, createcommanderplanner( team ), plannermpdomsquad::createsquadplanner( team ), float( function_60d95f53() ) / 1000 * 40, float( function_60d95f53() ) / 1000 * 100, 3, 3 );
    plannergenericcommander::commanderdaemons( commander );
    plannercommanderutility::adddaemon( commander, "daemonDomFlags" );
    plannercommanderutility::addsquadevaluator( commander, "commanderScoreBotPresence" );
    plannercommanderutility::addsquadevaluator( commander, "commanderScoreForceGoal" );
    plannercommanderutility::addsquadevaluator( commander, "commanderScoreTeam" );
    plannercommanderutility::addsquadevaluator( commander, "commanderScoreDomFlags" );
    plannercommanderutility::addsquadevaluator( commander, "commanderScoreAge", [ #"maxage":15000 ] );
    plannercommanderutility::addsquadevaluator( commander, "commanderScoreAlive" );
    plannercommanderutility::addsquadevaluator( commander, "commanderScoreStopWanderingDom" );
    return commander;
}

