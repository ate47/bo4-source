#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;

#namespace zm_demo;

// Namespace zm_demo/zm_demo
// Params 0, eflags: 0x2
// Checksum 0xdf6b57f3, Offset: 0xc8
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zm_demo", &__init__, undefined, undefined );
}

// Namespace zm_demo/zm_demo
// Params 0
// Checksum 0xac2e80c8, Offset: 0x110
// Size: 0x54
function __init__()
{
    if ( isdemoplaying() )
    {
        if ( !isdefined( level.demolocalclients ) )
        {
            level.demolocalclients = [];
        }
        
        callback::on_localclient_connect( &player_on_connect );
    }
}

// Namespace zm_demo/zm_demo
// Params 1
// Checksum 0x217f2f9d, Offset: 0x170
// Size: 0x24
function player_on_connect( localclientnum )
{
    level thread watch_predicted_player_changes( localclientnum );
}

// Namespace zm_demo/zm_demo
// Params 1
// Checksum 0xd9e2a2bb, Offset: 0x1a0
// Size: 0x294
function watch_predicted_player_changes( localclientnum )
{
    level.demolocalclients[ localclientnum ] = spawnstruct();
    level.demolocalclients[ localclientnum ].nonpredicted_local_player = function_27673a7( localclientnum );
    level.demolocalclients[ localclientnum ].predicted_local_player = function_5c10bd79( localclientnum );
    
    while ( true )
    {
        nonpredicted_local_player = function_27673a7( localclientnum );
        predicted_local_player = function_5c10bd79( localclientnum );
        
        if ( nonpredicted_local_player !== level.demolocalclients[ localclientnum ].nonpredicted_local_player )
        {
            level notify( #"demo_nplplayer_change", localclientnum );
            level notify( "demo_nplplayer_change" + localclientnum, { #old_player:level.demolocalclients[ localclientnum ].nonpredicted_local_player, #new_player:nonpredicted_local_player } );
            level.demolocalclients[ localclientnum ].nonpredicted_local_player = nonpredicted_local_player;
        }
        
        if ( predicted_local_player !== level.demolocalclients[ localclientnum ].predicted_local_player )
        {
            level notify( #"demo_plplayer_change", { #localclientnum:localclientnum, #old_player:level.demolocalclients[ localclientnum ].predicted_local_player, #new_player:predicted_local_player } );
            level notify( "demo_plplayer_change" + localclientnum, { #old_player:level.demolocalclients[ localclientnum ].predicted_local_player, #new_player:predicted_local_player } );
            level.demolocalclients[ localclientnum ].predicted_local_player = predicted_local_player;
        }
        
        waitframe( 1 );
    }
}

