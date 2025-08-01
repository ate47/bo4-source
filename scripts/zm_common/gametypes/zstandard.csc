#using scripts\autogenerated\luielems\zm\zm_arcade_timer;
#using scripts\autogenerated\luielems\zm\zm_trial_timer;
#using scripts\autogenerated\luielems\zm_laststand\self_revive_visuals_rush;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\struct;
#using scripts\zm_common\zm_powerups;

#namespace zstandard;

// Namespace zstandard/gametype_init
// Params 1, eflags: 0x40
// Checksum 0xd54553ed, Offset: 0x1a8
// Size: 0x236
function event_handler[gametype_init] main( eventstruct )
{
    createuimodel( getglobaluimodel(), "ZMHudGlobal.trials.gameStartTime" );
    callback::on_localclient_connect( &on_localplayer_connect );
    callback::on_finalize_initialization( &finalize_clientfields );
    level.var_f5682bb8 = zm_arcade_timer::register( "zm_arcade_timer" );
    level.var_f995ece6 = zm_trial_timer::register( "zm_trial_timer" );
    level.var_b9f167ba = self_revive_visuals_rush::register( "self_revive_visuals_rush" );
    level._zombie_gamemodeprecache = &onprecachegametype;
    level._zombie_gamemodemain = &onstartgametype;
    
    for ( i = 0; i < 4 ; i++ )
    {
        clientfield::register( "worlduimodel", "PlayerList.client" + i + ".playerIsDowned", 1, 1, "int", undefined, 0, 0 );
        clientfield::register( "worlduimodel", "PlayerList.client" + i + ".multiplier_count", 1, 12, "int", undefined, 0, 0 );
        clientfield::register( "worlduimodel", "PlayerList.client" + i + ".multiplier_blink", 1, 1, "int", undefined, 0, 0 );
        clientfield::register( "worlduimodel", "PlayerList.client" + i + ".self_revives", 1, 8, "int", undefined, 0, 0 );
    }
}

// Namespace zstandard/zstandard
// Params 1, eflags: 0x4
// Checksum 0x78bff701, Offset: 0x3e8
// Size: 0x9c
function private finalize_clientfields( localclientnum )
{
    clientfield::register( "toplayer", "zm_trials_timer", 1, getminbitcountfornum( 540 ), "int", &function_bb753058, 0, 1 );
    clientfield::register( "worlduimodel", "ZMHudGlobal.trials.gameStartTime", 1, 31, "int", undefined, 0, 0 );
}

// Namespace zstandard/zstandard
// Params 0
// Checksum 0x80f724d1, Offset: 0x490
// Size: 0x4
function onprecachegametype()
{
    
}

// Namespace zstandard/zstandard
// Params 0
// Checksum 0x80f724d1, Offset: 0x4a0
// Size: 0x4
function onstartgametype()
{
    
}

// Namespace zstandard/zstandard
// Params 1, eflags: 0x4
// Checksum 0xa23995e7, Offset: 0x4b0
// Size: 0x44
function private on_localplayer_connect( localclientnum )
{
    timer_model = function_c8b7588d( localclientnum );
    setuimodelvalue( timer_model, 0 );
}

// Namespace zstandard/zstandard
// Params 1, eflags: 0x4
// Checksum 0xa93e0768, Offset: 0x500
// Size: 0x4a
function private function_c8b7588d( localclientnum )
{
    controller_model = getuimodelforcontroller( localclientnum );
    return createuimodel( controller_model, "ZMHud.trialsTimer" );
}

// Namespace zstandard/zstandard
// Params 7, eflags: 0x4
// Checksum 0x662b7ce5, Offset: 0x558
// Size: 0xc4
function private function_bb753058( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( !function_65b9eb0f( localclientnum ) )
    {
        timer_model = function_c8b7588d( localclientnum );
        duration_msec = newval * 1000;
        setuimodelvalue( timer_model, getservertime( localclientnum, 1 ) + duration_msec );
    }
}

