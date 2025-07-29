#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\shoutcaster;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;
#using scripts\mp_common\gametypes\ct_tutorial_skirmish;

#namespace control;

// Namespace control/gametype_init
// Params 1, eflags: 0x40
// Checksum 0xd4ff0c22, Offset: 0x1e8
// Size: 0x484
function event_handler[gametype_init] main( eventstruct )
{
    level.current_zone_mask = [];
    level.current_zone_state_mask = [];
    level.visuals = [];
    level.warzonefx = [];
    level.zones = [];
    
    for ( i = 0; i < 4 ; i++ )
    {
        level.current_zone_mask[ i ] = 0;
        level.current_zone_state_mask[ i ] = 0;
        level.warzonefx[ i ] = [];
    }
    
    clientfield::register( "world", "warzone", 1, 5, "int", &warzone, 0, 0 );
    clientfield::register( "world", "warzonestate", 1, 10, "int", &warzone_state, 0, 0 );
    clientfield::register( "worlduimodel", "hudItems.missions.captureMultiplierStatus", 1, 2, "int", undefined, 0, 1 );
    clientfield::register( "worlduimodel", "hudItems.war.attackingTeam", 1, 2, "int", undefined, 0, 1 );
    level.effect_scriptbundles = [];
    level.effect_scriptbundles[ #"zoneedgemarker" ] = struct::get_script_bundle( "teamcolorfx", "teamcolorfx_koth_edge_marker" );
    level.effect_scriptbundles[ #"zoneedgemarkerwndw" ] = struct::get_script_bundle( "teamcolorfx", "teamcolorfx_koth_edge_marker_window" );
    level._effect[ #"zoneedgemarker" ] = [];
    level._effect[ #"zoneedgemarker" ][ 0 ] = #"ui/fx8_infil_marker_neutral";
    level._effect[ #"zoneedgemarker" ][ 1 ] = #"hash_5c2ae9f4f331d4b9";
    level._effect[ #"zoneedgemarker" ][ 2 ] = #"hash_7d1b0f001ea88b82";
    level._effect[ #"zoneedgemarker" ][ 3 ] = #"hash_7981eb245ea536fc";
    level._effect[ #"zoneedgemarkerwndw" ] = [];
    level._effect[ #"zoneedgemarkerwndw" ][ 0 ] = #"ui/fx8_infil_marker_neutral_window";
    level._effect[ #"zoneedgemarkerwndw" ][ 1 ] = #"hash_5565c3fc2c7742fe";
    level._effect[ #"zoneedgemarkerwndw" ][ 2 ] = #"hash_3283b765fe480df7";
    level._effect[ #"zoneedgemarkerwndw" ][ 3 ] = #"hash_6a512c225256a2e9";
    level.mission_bundle = getscriptbundle( "mission_settings_control" );
    callback::on_localclient_connect( &on_localclient_connect );
    callback::on_spawned( &function_6e3affdc );
    
    if ( util::function_8570168d() )
    {
        ct_tutorial_skirmish::init();
    }
}

// Namespace control/control
// Params 1
// Checksum 0x1b7a2469, Offset: 0x678
// Size: 0x24
function on_localclient_connect( localclientnum )
{
    thread function_185b0894( localclientnum, undefined, undefined );
}

// Namespace control/control
// Params 1
// Checksum 0x35bdc8c8, Offset: 0x6a8
// Size: 0x222
function get_shoutcaster_fx( local_client_num )
{
    effects = [];
    effects[ #"zoneedgemarker" ] = level._effect[ #"zoneedgemarker" ];
    effects[ #"zoneedgemarkerwndw" ] = level._effect[ #"zoneedgemarkerwndw" ];
    effects[ #"zoneedgemarker" ][ 2 ] = #"ui/fx8_infil_marker_shoutcaster_allies";
    effects[ #"zoneedgemarker" ][ 1 ] = #"ui/fx8_infil_marker_shoutcaster_axis";
    effects[ #"zoneedgemarker" ][ 3 ] = [];
    effects[ #"zoneedgemarker" ][ 3 ][ 2 ] = #"hash_2d6240bcbe378735";
    effects[ #"zoneedgemarker" ][ 3 ][ 1 ] = #"hash_1485defdfe47975a";
    effects[ #"zoneedgemarkerwndw" ][ 2 ] = #"ui/fx8_infil_marker_shoutcaster_allies_window";
    effects[ #"zoneedgemarkerwndw" ][ 1 ] = #"ui/fx8_infil_marker_shoutcaster_axis_window";
    effects[ #"zoneedgemarkerwndw" ][ 3 ] = [];
    effects[ #"zoneedgemarkerwndw" ][ 3 ][ 2 ] = #"hash_3add4ab2008b6ea2";
    effects[ #"zoneedgemarkerwndw" ][ 3 ][ 1 ] = #"hash_49751fe881244b5f";
    return effects;
}

// Namespace control/control
// Params 4
// Checksum 0x8f953343, Offset: 0x8d8
// Size: 0x100
function get_fx_state( local_client_num, state, attackers, is_shoutcaster )
{
    if ( is_shoutcaster )
    {
        if ( attackers == #"allies" )
        {
            return state;
        }
        else if ( state == 1 )
        {
            return 2;
        }
        else if ( state == 2 )
        {
            return 1;
        }
        else
        {
            return state;
        }
    }
    
    if ( state == 1 )
    {
        if ( function_9b3f0ed1( local_client_num ) != attackers )
        {
            return 1;
        }
        else
        {
            return 2;
        }
    }
    else if ( state == 2 )
    {
        if ( function_9b3f0ed1( local_client_num ) == attackers )
        {
            return 1;
        }
        else
        {
            return 2;
        }
    }
    
    return state;
}

// Namespace control/control
// Params 3
// Checksum 0x13a0b0ee, Offset: 0x9e0
// Size: 0x2c
function get_fx( fx_name, fx_state, effects )
{
    return effects[ fx_name ][ fx_state ];
}

// Namespace control/control
// Params 0, eflags: 0x4
// Checksum 0x1ffbdc87, Offset: 0xa18
// Size: 0x62
function private get_attacking_team()
{
    attackers_key = codegetworlduimodelfield( "hudItems.war.attackingTeam" );
    attackers = #"allies";
    
    if ( attackers_key == 2 )
    {
        attackers = #"axis";
    }
    
    return attackers;
}

// Namespace control/control
// Params 0
// Checksum 0xdafa9ed9, Offset: 0xa88
// Size: 0x54
function function_6e3affdc()
{
    if ( isdefined( level.current_zone_state_mask ) )
    {
        local_client_num = self getlocalclientnumber();
        
        if ( isdefined( local_client_num ) )
        {
            setup_warzone_fx( local_client_num );
        }
    }
}

// Namespace control/control
// Params 1
// Checksum 0xc2cb746f, Offset: 0xae8
// Size: 0x3c4
function setup_warzone_fx( local_client_num )
{
    for ( zi = 0; zi < level.zones.size ; zi++ )
    {
        zonestate = level.current_zone_state_mask[ local_client_num ] >> zi * 2 & 3;
        effects = [];
        
        if ( shoutcaster::is_shoutcaster( local_client_num ) )
        {
            effects = get_shoutcaster_fx( local_client_num );
        }
        else
        {
            effects[ #"zoneedgemarker" ] = level._effect[ #"zoneedgemarker" ];
            effects[ #"zoneedgemarkerwndw" ] = level._effect[ #"zoneedgemarkerwndw" ];
        }
        
        if ( isdefined( level.warzonefx[ local_client_num ][ zi ] ) )
        {
            foreach ( fx in level.warzonefx[ local_client_num ][ zi ] )
            {
                stopfx( local_client_num, fx );
            }
        }
        
        level.warzonefx[ local_client_num ][ zi ] = [];
        
        if ( level.current_zone_mask[ local_client_num ] & 1 << zi )
        {
            if ( isdefined( level.visuals[ zi ] ) )
            {
                attackers = get_attacking_team();
                fx_state = get_fx_state( local_client_num, zonestate, attackers, shoutcaster::is_shoutcaster( local_client_num ) );
                
                foreach ( visual in level.visuals[ zi ] )
                {
                    if ( !isdefined( visual.script_fxid ) )
                    {
                        continue;
                    }
                    
                    fxid = get_fx( visual.script_fxid, fx_state, effects );
                    
                    if ( isarray( fxid ) )
                    {
                        zonestate = 2;
                        function_ca8ebccf( local_client_num, visual, fxid[ zonestate ], zi, zonestate, attackers );
                        zonestate = 1;
                        function_ca8ebccf( local_client_num, visual, fxid[ zonestate ], zi, zonestate, attackers );
                        continue;
                    }
                    
                    function_ca8ebccf( local_client_num, visual, fxid, zi, zonestate, attackers );
                }
            }
        }
    }
    
    thread watch_for_team_change( local_client_num );
}

// Namespace control/control
// Params 6, eflags: 0x4
// Checksum 0x181ccc80, Offset: 0xeb8
// Size: 0x184
function private function_ca8ebccf( local_client_num, visual, fxid, zi, zonestate, attackers )
{
    if ( isdefined( visual.angles ) )
    {
        forward = anglestoforward( visual.angles );
    }
    else
    {
        forward = ( 0, 0, 0 );
    }
    
    fxhandle = playfx( local_client_num, fxid, visual.origin, forward );
    level.warzonefx[ local_client_num ][ zi ][ level.warzonefx[ local_client_num ][ zi ].size ] = fxhandle;
    
    if ( isdefined( fxhandle ) )
    {
        if ( zonestate == 2 )
        {
            setfxteam( local_client_num, fxhandle, attackers );
            return;
        }
        
        if ( zonestate == 1 )
        {
            defenders = util::get_other_team( attackers );
            setfxteam( local_client_num, fxhandle, defenders );
            return;
        }
        
        setfxteam( local_client_num, fxhandle, "free" );
    }
}

// Namespace control/control
// Params 2
// Checksum 0xdc8932fa, Offset: 0x1048
// Size: 0xfc, Type: bool
function compare_zone_indicies( zone_a, zone_b )
{
    script_index_a = zone_a.script_index;
    script_index_b = zone_b.script_index;
    
    if ( !isdefined( script_index_a ) && !isdefined( script_index_b ) )
    {
        return false;
    }
    
    if ( !isdefined( script_index_a ) && isdefined( script_index_b ) )
    {
        println( "<dev string:x38>" + zone_a.origin );
        return true;
    }
    
    if ( isdefined( script_index_a ) && !isdefined( script_index_b ) )
    {
        println( "<dev string:x38>" + zone_b.origin );
        return false;
    }
    
    if ( script_index_a > script_index_b )
    {
        return true;
    }
    
    return false;
}

// Namespace control/control
// Params 0
// Checksum 0x84117790, Offset: 0x1150
// Size: 0x2ec
function get_zone_array()
{
    allzones = struct::get_array( "control_zone_center", "targetname" );
    
    if ( allzones.size > 1 )
    {
        if ( !isdefined( allzones ) )
        {
            return;
        }
        
        zoneindices = [];
        numberofzones = allzones.size;
        
        for ( i = 0; i < numberofzones ; i++ )
        {
            fieldname = "zoneinfo" + numberofzones + i + 1;
            index = isdefined( level.mission_bundle.( fieldname ) ) ? level.mission_bundle.( fieldname ) : 0;
            zoneindices[ zoneindices.size ] = index;
        }
        
        zones = [];
        
        for ( i = 0; i < allzones.size ; i++ )
        {
            ind = allzones[ i ].script_index;
            
            if ( isdefined( ind ) )
            {
                for ( j = 0; j < zoneindices.size ; j++ )
                {
                    if ( zoneindices[ j ] == ind )
                    {
                        zones[ zones.size ] = allzones[ i ];
                        break;
                    }
                }
            }
        }
    }
    else
    {
        zones = struct::get_array( "control_zone_center", "targetname" );
    }
    
    if ( !isdefined( zones ) )
    {
        return undefined;
    }
    
    swapped = 1;
    
    for ( n = zones.size; swapped ; n-- )
    {
        swapped = 0;
        
        for ( i = 0; i < n - 1 ; i++ )
        {
            if ( compare_zone_indicies( zones[ i ], zones[ i + 1 ] ) )
            {
                temp = zones[ i ];
                zones[ i ] = zones[ i + 1 ];
                zones[ i + 1 ] = temp;
                swapped = 1;
            }
        }
    }
    
    for ( i = 0; i < zones.size ; i++ )
    {
        zones[ i ].zone_index = i;
    }
    
    return zones;
}

// Namespace control/control
// Params 7
// Checksum 0x1a66b93, Offset: 0x1448
// Size: 0x254
function warzone( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( level.zones.size == 0 )
    {
        level.zones = get_zone_array();
        
        for ( zi = 0; zi < level.zones.size ; zi++ )
        {
            if ( isdefined( level.zones[ zi ].target ) )
            {
                level.visuals[ zi ] = struct::get_array( level.zones[ zi ].target, "targetname" );
            }
            
            level.zones[ zi ].objectiveid = serverobjective_getobjective( localclientnum, "control_" + zi );
            level.zones[ zi ].objectiveentity = spawn( 0, level.zones[ zi ].origin, "script_origin" );
            level.zones[ zi ].var_ce6accbd = 0;
        }
        
        level notify( #"zone_initialization" );
    }
    
    level.current_zone_mask[ localclientnum ] = newval;
    
    for ( zi = 0; zi < level.zones.size ; zi++ )
    {
        if ( ( oldval & 1 << zi ) != ( newval & 1 << zi ) )
        {
            level.current_zone_state_mask[ localclientnum ] &= ~( 3 << zi );
        }
    }
    
    setup_warzone_fx( localclientnum );
}

// Namespace control/control
// Params 7
// Checksum 0x99504e4, Offset: 0x16a8
// Size: 0x84
function warzone_state( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( newval != level.current_zone_state_mask[ localclientnum ] )
    {
        level.current_zone_state_mask[ localclientnum ] = newval;
        setup_warzone_fx( localclientnum );
    }
}

// Namespace control/control
// Params 1
// Checksum 0x77e6d028, Offset: 0x1738
// Size: 0x64
function watch_for_team_change( localclientnum )
{
    level notify( #"end_team_change_watch" );
    level endon( #"end_team_change_watch" );
    level waittill( #"team_changed" );
    thread setup_warzone_fx( localclientnum );
}

// Namespace control/control
// Params 3
// Checksum 0x725da180, Offset: 0x17a8
// Size: 0x294
function function_185b0894( localclientnum, oldval, newval )
{
    level endon( #"game_ended" );
    self notify( "4f9ede08240c30af" );
    self endon( "4f9ede08240c30af" );
    basepitch = 0.8;
    var_9a7dc638 = 1;
    var_f802a6b1 = 255;
    progresspercentage = 1 / var_f802a6b1;
    waitresult = level waittill( #"zone_initialization" );
    
    while ( true )
    {
        foreach ( zone in level.zones )
        {
            if ( !isdefined( zone.objectiveid ) )
            {
                continue;
            }
            
            progress = serverobjective_getobjectiveprogress( localclientnum, zone.objectiveid );
            change = progress - ( isdefined( zone.lastprogress ) ? zone.lastprogress : 0 );
            
            if ( change <= 0 )
            {
                if ( zone.var_ce6accbd )
                {
                    zone.objectiveentity stoploopsound( zone.soundid );
                    zone.var_ce6accbd = 0;
                }
            }
            else
            {
                if ( !zone.var_ce6accbd )
                {
                    zone.soundid = zone.objectiveentity playloopsound( #"hash_5a0b392405d5f148" );
                    zone.var_ce6accbd = 1;
                }
                
                newpitch = basepitch + var_9a7dc638 * progress * progresspercentage;
                setsoundpitch( zone.soundid, newpitch );
            }
            
            zone.lastprogress = progress;
        }
        
        wait 0.25;
    }
}

