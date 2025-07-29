#using script_71e26f08f03b7a7a;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\compass;
#using scripts\core_common\death_circle;
#using scripts\core_common\flag_shared;
#using scripts\core_common\flagsys_shared;
#using scripts\core_common\gestures;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;
#using scripts\core_common\values_shared;
#using scripts\mp_common\item_inventory;
#using scripts\mp_common\item_world;
#using scripts\mp_common\load;
#using scripts\wz\wz_escape_ai_zones;
#using scripts\wz\wz_escape_elevators;
#using scripts\wz\wz_escape_ffotd;
#using scripts\wz_common\wz_blackjack_stash;
#using scripts\wz_common\wz_ee_poster;
#using scripts\wz_common\wz_loadouts;
#using scripts\wz_common\wz_nixie_tubes;

#namespace wz_escape;

// Namespace wz_escape/level_init
// Params 1, eflags: 0x40
// Checksum 0xe2b3ec21, Offset: 0x150
// Size: 0x2e4
function event_handler[level_init] main( eventstruct )
{
    callback::on_spawned( &on_player_spawned );
    callback::add_callback( #"hash_3be1213f454fa90e", &function_78d5fb9b );
    
    /#
        callback::on_vehicle_spawned( &on_vehicle_spawned );
    #/
    
    if ( !( isdefined( getgametypesetting( #"wzzombieapocalypsemusic" ) ) && getgametypesetting( #"wzzombieapocalypsemusic" ) ) )
    {
        level.var_30783ca9 = &function_28990311;
    }
    
    level.mapcenter = ( 0, 0, 0 );
    setmapcenter( level.mapcenter );
    level.var_7fd6bd44 = 3300;
    load::main();
    level.var_405a6738 = 16000;
    level.var_8a390df2 = 16000;
    level death_circle::init();
    
    if ( isdefined( getgametypesetting( #"hash_731aac1992af2669" ) ) ? getgametypesetting( #"hash_731aac1992af2669" ) : 0 )
    {
        level thread function_74ee36be();
    }
    
    compass::setupminimap( "" );
    
    /#
        level thread init_devgui();
    #/
    
    level wz_escape_ai_zones::init();
    level.var_18bf5e98 = &function_d075b84e;
    var_80b6eb8c = isdefined( level.waverespawndelay ) ? level.waverespawndelay : 30;
    
    if ( var_80b6eb8c == 0 )
    {
        var_80b6eb8c = 30;
    }
    
    var_80b6eb8c = int( var_80b6eb8c * 1000 );
    item_world::function_cbc32e1b( var_80b6eb8c );
    level thread namespace_3d2704b3::start( 3, 15, array( 20, 20, 20 ) );
}

// Namespace wz_escape/wz_escape
// Params 0
// Checksum 0xdb42f95e, Offset: 0x440
// Size: 0x10e
function function_d075b84e()
{
    itemlist = level.zombie_itemlist;
    
    if ( isdefined( level.var_b4143320 ) && level.var_b4143320 )
    {
        if ( isdefined( getgametypesetting( #"hash_26f00de198472b81" ) ) && getgametypesetting( #"hash_26f00de198472b81" ) )
        {
            itemlist = #"zombie_itemlist_escape_hzc";
        }
        else
        {
            itemlist = #"zombie_itemlist_escape";
        }
        
        if ( randomint( 100 ) <= 2 )
        {
            if ( !level.var_8a3036cc && isdefined( level.var_db43cbd7 ) )
            {
                itemlist = level.var_db43cbd7;
                level.var_8a3036cc = 1;
            }
        }
    }
    
    return itemlist;
}

// Namespace wz_escape/wz_escape
// Params 0
// Checksum 0x53a8b19c, Offset: 0x558
// Size: 0x1c
function on_player_spawned()
{
    /#
        self thread function_e8f0335f();
    #/
}

// Namespace wz_escape/wz_escape
// Params 0
// Checksum 0xf15322c2, Offset: 0x580
// Size: 0x46
function function_28990311()
{
    n_variant = "0" + randomintrange( 1, 2 );
    game.musicset = "_zm_" + n_variant;
}

// Namespace wz_escape/wz_escape
// Params 0
// Checksum 0x5d6fd8de, Offset: 0x5d0
// Size: 0x34
function function_78d5fb9b()
{
    playsoundatposition( #"hash_5bcfe3a4f3bf67a6", ( -1638, -2162, 2673 ) );
}

// Namespace wz_escape/wz_escape
// Params 0
// Checksum 0x349b66a4, Offset: 0x610
// Size: 0xca
function function_74ee36be()
{
    location = randomintrange( 1, 3 );
    
    switch ( location )
    {
        case 1:
            function_69e60a10( "ParadeGrounds" );
            break;
        case 2:
            function_69e60a10( "NewIndustries" );
            break;
        case 3:
            function_69e60a10( "CellHouse" );
            break;
    }
}

// Namespace wz_escape/wz_escape
// Params 1
// Checksum 0x9b37f5a, Offset: 0x6e8
// Size: 0x8e
function function_69e60a10( var_e4204b3 )
{
    finalcircle = level.deathcircles[ level.deathcircles.size - 1 ];
    hint = struct::get( var_e4204b3 );
    finalcircle.var_3b9f4abf = hint.origin;
    finalcircle.mapwidth = 1024;
    finalcircle.mapheight = 1024;
}

/#

    // Namespace wz_escape/wz_escape
    // Params 0
    // Checksum 0x497143ed, Offset: 0x780
    // Size: 0xdc, Type: dev
    function init_devgui()
    {
        mapname = util::get_map_name();
        adddebugcommand( "<dev string:x38>" );
        adddebugcommand( "<dev string:x78>" + mapname + "<dev string:x89>" );
        level thread function_9cc59537();
        level thread function_13a77bfa();
        level thread function_10c650e6();
        level thread function_4b227faf();
        level thread devgui_weapon_think();
    }

    // Namespace wz_escape/wz_escape
    // Params 0
    // Checksum 0xbfc18360, Offset: 0x868
    // Size: 0x1c, Type: dev
    function on_vehicle_spawned()
    {
        self thread function_f42944c7();
    }

    // Namespace wz_escape/wz_escape
    // Params 0
    // Checksum 0xf6457bc7, Offset: 0x890
    // Size: 0x20a, Type: dev
    function function_10c650e6()
    {
        if ( !getdvarint( #"hash_45acaa3a266bbdec", 0 ) )
        {
            return;
        }
        
        item_world::function_1b11e73c();
        item_world::function_4de3ca98();
        var_6e64f8a3 = function_91b29d2a( #"cu35_item" );
        
        while ( getdvarint( #"hash_45acaa3a266bbdec", 0 ) )
        {
            foreach ( point in var_6e64f8a3 )
            {
                var_91d1913b = distance2d( level.players[ 0 ].origin, point.origin );
                n_radius = 0.015 * var_91d1913b;
                
                if ( n_radius > 768 )
                {
                    n_radius = 768;
                }
                
                if ( var_91d1913b > 768 )
                {
                    sphere( point.origin, n_radius, ( 0, 1, 0 ) );
                    
                    if ( var_91d1913b < 2048 )
                    {
                        print3d( point.origin + ( 0, 0, 32 ), "<dev string:xb3>", ( 0, 1, 0 ) );
                    }
                }
            }
            
            waitframe( 1 );
        }
    }

    // Namespace wz_escape/wz_escape
    // Params 0
    // Checksum 0x2780c9f6, Offset: 0xaa8
    // Size: 0x149e, Type: dev
    function function_9cc59537()
    {
        if ( !getdvarint( #"hash_68dcd0d52e11b957", 0 ) )
        {
            return;
        }
        
        var_55a05f87 = 0;
        var_cbc7aaf6 = 0;
        var_ebd66b56 = [];
        item_spawn_groups = struct::get_array( "<dev string:xbb>", "<dev string:xd8>" );
        
        foreach ( group in item_spawn_groups )
        {
            group.debug_spawnpoints = [];
            var_f0179f4a = getdvarstring( #"hash_230734aeaaf8671", "<dev string:xe4>" );
            
            if ( isstring( group.target ) && ( var_f0179f4a == "<dev string:xe4>" || function_d72aa67e( var_f0179f4a, group.target ) ) )
            {
                group.debug_spawnpoints = function_91b29d2a( group.target );
            }
        }
        
        var_7cb887a8 = [];
        level flag::wait_till( "<dev string:xea>" );
        level.players[ 0 ] endon( #"disconnect" );
        adddebugcommand( "<dev string:x101>" );
        
        do
        {
            waitframe( 8 );
            
            foreach ( group in item_spawn_groups )
            {
                itemlistbundle = getscriptbundle( group.scriptbundlename );
                
                if ( !isdefined( itemlistbundle ) || isdefined( itemlistbundle.vehiclespawner ) && itemlistbundle.vehiclespawner || group.debug_spawnpoints.size == 0 || itemlistbundle.name === "<dev string:x10a>" || itemlistbundle.name === "<dev string:x127>" || itemlistbundle.name === "<dev string:x14a>" )
                {
                    continue;
                }
                else if ( itemlistbundle.name === "<dev string:x16a>" )
                {
                    var_df1e5fef = arraysortclosest( group.debug_spawnpoints, level.players[ 0 ].origin, 85, 1, 4000 );
                    
                    foreach ( point in var_df1e5fef )
                    {
                        sphere( point.origin, 16, ( 1, 1, 1 ), 1, 0, 16, 8 );
                    }
                    
                    continue;
                }
                
                spawn_points = arraysortclosest( group.debug_spawnpoints, level.players[ 0 ].origin, 85, 1, 4000 );
                
                foreach ( point in spawn_points )
                {
                    if ( level.players[ 0 ] util::is_player_looking_at( point.origin, 0.8, 0 ) )
                    {
                        b_failed = 0;
                        var_47748885 = 28;
                        var_c5330f11 = 32;
                        v_color = ( 1, 0, 1 );
                        
                        if ( isdefined( itemlistbundle.itemlist[ 0 ] ) )
                        {
                            if ( itemlistbundle.itemlist[ 0 ].itementry === "<dev string:x188>" || itemlistbundle.itemlist[ 0 ].itementry === "<dev string:x19e>" || itemlistbundle.itemlist[ 0 ].itementry === "<dev string:x1aa>" || itemlistbundle.itemlist[ 0 ].itementry === "<dev string:x1b6>" || itemlistbundle.itemlist[ 0 ].itementry === "<dev string:x1c2>" || itemlistbundle.itemlist[ 0 ].itementry === "<dev string:x1ce>" || itemlistbundle.itemlist[ 0 ].itementry === "<dev string:x1da>" )
                            {
                                v_color = ( 1, 1, 0 );
                                var_47748885 = 4;
                                var_c5330f11 = 4;
                            }
                            else if ( itemlistbundle.itemlist[ 0 ].itementry === "<dev string:x1e6>" )
                            {
                                v_color = ( 1, 1, 0 );
                                var_47748885 = 8;
                                var_c5330f11 = 8;
                            }
                        }
                        
                        n_radius = 4;
                        items = item_world::function_2e3efdda( point.origin, undefined, 1, var_47748885, -1, 1 );
                        
                        if ( items.size > 0 )
                        {
                            v_color = ( 0, 1, 0 );
                            
                            foreach ( item in items )
                            {
                                var_c3aa278e = item.itementry.name;
                                str_item_name = getdvarstring( #"hash_4d2d3346b87258c6", "<dev string:x1fc>" );
                                
                                if ( function_d72aa67e( str_item_name, var_c3aa278e ) )
                                {
                                    n_radius = 18;
                                    v_color = ( 1, 0.5, 0 );
                                    print3d( point.origin + ( 0, 0, 24 ), var_c3aa278e, v_color, 1, 0.3, 8 );
                                }
                            }
                        }
                        
                        var_7cb887a8 = [];
                        var_3e832e74 = 360 / 8;
                        v_angles = point.angles;
                        var_c24ea284 = undefined;
                        var_4b82457c = distance2d( point.origin, level.players[ 0 ].origin );
                        var_24b0b1ea = itemlistbundle.var_7fb0967b;
                        
                        if ( isdefined( var_24b0b1ea ) )
                        {
                            if ( items.size > 0 )
                            {
                                var_abc7e003 = item_world::function_2e3efdda( point.origin, undefined, 20, var_24b0b1ea, -1, 1 );
                                var_abc7e003 = arraysortclosest( var_abc7e003, point.origin, 10, var_47748885 );
                                
                                foreach ( item_type in itemlistbundle.itemlist )
                                {
                                    foreach ( var_d76a7255 in var_abc7e003 )
                                    {
                                        if ( item_type.itementry === var_d76a7255.itementry.name && var_d76a7255.itementry.name === items[ 0 ].itementry.name )
                                        {
                                            print3d( point.origin + ( 0, 0, 18 ), item_type.itementry + "<dev string:x203>" + var_24b0b1ea, ( 1, 0.5, 0 ), 1, 0.3, 8 );
                                            line( var_d76a7255.origin, point.origin, ( 1, 0.5, 0 ), 1, 0, 8 );
                                        }
                                    }
                                }
                            }
                        }
                        
                        if ( isdefined( itemlistbundle.supplystash ) && itemlistbundle.supplystash )
                        {
                            n_depth = 18;
                            n_width = 24;
                            
                            if ( itemlistbundle.name === "<dev string:x10a>" || itemlistbundle.name === "<dev string:x127>" || itemlistbundle.name === "<dev string:x14a>" )
                            {
                                n_depth = 12;
                                n_width = 48;
                            }
                            
                            var_7cb887a8[ 0 ] = point.origin + ( 0, 0, 16 ) + vectorscale( anglestoforward( v_angles ), n_depth );
                            var_7cb887a8[ 1 ] = point.origin + ( 0, 0, 16 ) + vectorscale( anglestoforward( v_angles ) * -1, n_depth );
                            var_7cb887a8[ 2 ] = point.origin + ( 0, 0, 16 ) + vectorscale( anglestoright( v_angles ), n_width );
                            var_7cb887a8[ 3 ] = point.origin + ( 0, 0, 16 ) + vectorscale( anglestoright( v_angles ) * -1, n_width );
                        }
                        else
                        {
                            for ( i = 0; i < 8 ; i++ )
                            {
                                var_7cb887a8[ i ] = point.origin + ( 0, 0, 16 ) + vectorscale( anglestoforward( v_angles ), var_47748885 );
                                v_angles += ( 0, var_3e832e74, 0 );
                            }
                        }
                        
                        var_2e0e7774 = arraysortclosest( spawn_points, point.origin, 20, 1, var_c5330f11 );
                        
                        foreach ( close in var_2e0e7774 )
                        {
                            if ( bullettracepassed( point.origin + ( 0, 0, 16 ), close.origin, 0, level.players[ 0 ] ) )
                            {
                                v_color = ( 0, 0, 1 );
                                b_failed = 1;
                                line( close.origin, point.origin, v_color, 1, 0, 8 );
                                circle( point.origin, var_c5330f11 / 2, v_color, 0, 1, 8 );
                                print3d( point.origin + ( 0, 0, 24 ), sqrt( distancesquared( point.origin, close.origin ) ), v_color, 1, 0.3, 8 );
                            }
                        }
                        
                        if ( isdefined( itemlistbundle.supplystash ) && itemlistbundle.supplystash )
                        {
                            var_47748885 = n_depth;
                            
                            foreach ( i, v_test in var_7cb887a8 )
                            {
                                if ( i > 2 )
                                {
                                    var_47748885 = n_width;
                                }
                                
                                a_trace = bullettrace( point.origin + ( 0, 0, 24 ), v_test, 0, level.players[ 0 ] );
                                
                                if ( distancesquared( a_trace[ #"position" ], point.origin + ( 0, 0, 24 ) ) < var_47748885 * var_47748885 - 2 && !isdefined( a_trace[ #"dynent" ] ) )
                                {
                                    v_color = ( 1, 0, 0 );
                                    b_failed = 1;
                                    
                                    if ( var_4b82457c < 256 )
                                    {
                                        debugstar( a_trace[ #"position" ], 8, v_color );
                                    }
                                }
                            }
                            
                            var_47748885 = 18;
                        }
                        else
                        {
                            foreach ( v_test in var_7cb887a8 )
                            {
                                a_trace = bullettrace( point.origin + ( 0, 0, 16 ), v_test, 0, level.players[ 0 ] );
                                
                                if ( distancesquared( a_trace[ #"position" ], point.origin + ( 0, 0, 16 ) ) < var_47748885 * var_47748885 - 3 && !isdefined( a_trace[ #"dynent" ] ) )
                                {
                                    v_color = ( 1, 0, 0 );
                                    b_failed = 1;
                                    
                                    if ( var_4b82457c < 256 )
                                    {
                                        debugstar( a_trace[ #"position" ], 8, v_color );
                                    }
                                }
                            }
                        }
                        
                        if ( b_failed )
                        {
                            n_radius = 0.015 * var_4b82457c;
                            
                            if ( n_radius > 32 )
                            {
                                n_radius = 32;
                            }
                        }
                        
                        if ( isdefined( itemlistbundle.supplystash ) && itemlistbundle.supplystash )
                        {
                            function_47351fa3( point.origin, point.angles, v_color, 8 );
                        }
                        
                        if ( var_4b82457c > 212 )
                        {
                            sphere( point.origin, n_radius, v_color, 1, 0, 8, 8 );
                        }
                        
                        if ( bullettracepassed( point.origin, level.players[ 0 ] geteye(), 0, level.players[ 0 ], var_c24ea284 ) )
                        {
                            circle( point.origin, var_47748885, v_color, 0, 1, 8 );
                            
                            if ( var_4b82457c < 512 )
                            {
                                print3d( point.origin, function_9e72a96( point.targetname ), v_color, 1, 0.4, 8 );
                                
                                if ( var_4b82457c < 256 && level.players[ 0 ] util::is_player_looking_at( point.origin, 0.87, 0 ) )
                                {
                                    print3d( point.origin + ( 0, 0, 12 ), point.origin, v_color, 1, 0.3, 8 );
                                }
                            }
                        }
                    }
                }
            }
        }
        while ( getdvarint( #"hash_68dcd0d52e11b957", 0 ) );
    }

    // Namespace wz_escape/wz_escape
    // Params 2
    // Checksum 0xfcc168c0, Offset: 0x1f50
    // Size: 0xb4, Type: dev
    function function_d72aa67e( str_list, str_name )
    {
        a_str_tok = strtok( str_list, "<dev string:x224>" );
        
        foreach ( tok in a_str_tok )
        {
            if ( tok == str_name )
            {
                return 1;
            }
        }
        
        return 0;
    }

    // Namespace wz_escape/wz_escape
    // Params 4
    // Checksum 0xec5bdf52, Offset: 0x2010
    // Size: 0x324, Type: dev
    function function_47351fa3( org, ang, opcolor, frames )
    {
        if ( !isdefined( frames ) )
        {
            frames = 1;
        }
        
        forward = anglestoforward( ang );
        forwardfar = vectorscale( forward, 50 );
        forwardclose = vectorscale( forward, 50 * 0.8 );
        right = anglestoright( ang );
        left = anglestoright( ang ) * -1;
        leftdraw = vectorscale( right, 50 * -0.2 );
        rightdraw = vectorscale( right, 50 * 0.2 );
        up = anglestoup( ang );
        right = vectorscale( right, 50 );
        left = vectorscale( left, 50 );
        up = vectorscale( up, 50 );
        red = ( 0.9, 0.2, 0.2 );
        green = ( 0.2, 0.9, 0.2 );
        blue = ( 0.2, 0.2, 0.9 );
        
        if ( isdefined( opcolor ) )
        {
            red = opcolor;
            green = opcolor;
            blue = opcolor;
        }
        
        line( org, org + forwardfar, red, 0.9, 0, frames );
        line( org + forwardfar, org + forwardclose + rightdraw, red, 0.9, 0, frames );
        line( org + forwardfar, org + forwardclose + leftdraw, red, 0.9, 0, frames );
        line( org, org + right, blue, 0.9, 0, frames );
        line( org, org + left, blue, 0.9, 0, frames );
        line( org, org + up, green, 0.9, 0, frames );
    }

    // Namespace wz_escape/wz_escape
    // Params 0
    // Checksum 0x4cb2d67d, Offset: 0x2340
    // Size: 0x6c0, Type: dev
    function function_e8f0335f()
    {
        if ( !getdvarint( #"hash_15ce8723d2ead5ef", 0 ) )
        {
            return;
        }
        
        self endon( #"death", #"disconnect" );
        var_b3a9e916 = getdvarint( #"hash_796c892495c48172", 1 );
        
        while ( getdvarint( #"hash_15ce8723d2ead5ef", 1 ) )
        {
            waitframe( 1 );
            
            if ( self weaponswitchbuttonpressed() )
            {
                var_b3a9e916 += 1;
                
                if ( var_b3a9e916 > 2 )
                {
                    var_b3a9e916 = 0;
                }
                
                setdvar( #"hash_796c892495c48172", var_b3a9e916 );
                
                while ( self weaponswitchbuttonpressed() )
                {
                    waitframe( 1 );
                }
            }
            
            if ( var_b3a9e916 == 0 )
            {
                continue;
            }
            
            v_eye = self geteye();
            v_end = v_eye + vectorscale( anglestoforward( self getplayerangles() ), 1024 );
            physicstrace = physicstraceex( v_eye, v_end, ( -0.5, -0.5, -0.5 ), ( 0.5, 0.5, 0.5 ), self, 32 );
            var_11cc451b = bullettrace( v_eye, v_end, 0, self, 0, 0 );
            var_708a2754 = physicstrace;
            var_7cb887a8 = [];
            var_3e832e74 = 360 / 8;
            
            if ( var_11cc451b[ #"position" ][ 2 ] > physicstrace[ #"position" ][ 2 ] )
            {
                var_708a2754 = var_11cc451b;
            }
            
            origin = var_708a2754[ #"position" ];
            
            if ( var_708a2754[ #"fraction" ] < 1 && vectordot( var_708a2754[ #"normal" ], ( 0, 0, 1 ) ) >= 0.707 )
            {
                if ( var_708a2754[ #"position" ][ 2 ] > -10000 )
                {
                    origin = var_708a2754[ #"position" ];
                }
            }
            
            b_failed = 0;
            v_color = ( 0, 1, 0 );
            v_angles = ( 0, 0, 0 );
            
            if ( var_b3a9e916 != 0 )
            {
                for ( i = 0; i < 8 ; i++ )
                {
                    var_7cb887a8[ i ] = origin + ( 0, 0, 12 ) + vectorscale( anglestoforward( v_angles ), 32 );
                    v_angles += ( 0, var_3e832e74, 0 );
                }
                
                foreach ( v_test in var_7cb887a8 )
                {
                    a_trace = bullettrace( origin + ( 0, 0, 12 ), v_test, 0, level.players[ 0 ] );
                    
                    if ( isdefined( a_trace[ #"entity" ] ) )
                    {
                        a_trace = bullettrace( origin + ( 0, 0, 12 ), v_test, 0, a_trace[ #"entity" ] );
                    }
                    
                    if ( distancesquared( a_trace[ #"position" ], origin + ( 0, 0, 12 ) ) < 32 * 32 - 2 )
                    {
                        v_color = ( 1, 0, 0 );
                        b_failed = 1;
                        
                        if ( distance2d( origin, level.players[ 0 ] getorigin() ) < 512 )
                        {
                            debugstar( a_trace[ #"position" ], 1, v_color );
                        }
                    }
                }
            }
            
            sphere( origin, 2, v_color );
            circle( origin, 32, v_color, 0, 1, 1 );
            
            if ( var_b3a9e916 == 2 )
            {
                print3d( origin + ( 0, 0, 8 ), "<dev string:x224>" + origin, v_color, 0.25, 1 );
            }
            
            if ( b_failed )
            {
                print3d( origin + ( 0, 0, 8 ), "<dev string:x228>", v_color, 0.85, 1 );
            }
        }
    }

    // Namespace wz_escape/event_9673dc9a
    // Params 1, eflags: 0x44
    // Checksum 0x5d9d86dc, Offset: 0x2a08
    // Size: 0x2b0, Type: dev
    function private event_handler[event_9673dc9a] function_f9b68fd7( eventstruct )
    {
        if ( !getdvarint( #"hash_69592e1b2d05fb21", 0 ) )
        {
            return;
        }
        
        dynent = eventstruct.ent;
        dynent notify( #"debug_draw" );
        dynent endon( #"debug_draw" );
        
        while ( getdvarint( #"hash_69592e1b2d05fb21", 0 ) )
        {
            waitframe( 10 );
            
            if ( !isdefined( level.players[ 0 ] ) )
            {
                continue;
            }
            
            var_91d1913b = distance2d( dynent.origin, level.players[ 0 ].origin );
            
            if ( level.players[ 0 ] util::is_player_looking_at( dynent.origin, 0.8, 0 ) && var_91d1913b <= 6000 )
            {
                if ( isdefined( dynent.var_15d44120 ) && dynent.var_15d44120 !== #"hash_1dcbe8021fb16344" )
                {
                    function_a476d876( dynent.origin, dynent.angles, ( 1, 0.5, 0 ), 10 );
                    
                    if ( var_91d1913b <= 768 )
                    {
                        print3d( dynent.origin + ( 0, 0, 18 ), function_9e72a96( dynent.var_15d44120 ), ( 1, 0.5, 0 ), 0.9, 0.5, 10 );
                    }
                }
                
                if ( isdefined( dynent.targetname ) && var_91d1913b <= 768 )
                {
                    print3d( dynent.origin + ( 0, 0, 8 ), function_9e72a96( dynent.targetname ), ( 1, 0.5, 0 ), 0.9, 0.5, 10 );
                }
            }
        }
    }

    // Namespace wz_escape/wz_escape
    // Params 4
    // Checksum 0x57bb5c65, Offset: 0x2cc0
    // Size: 0x22c, Type: dev
    function function_a476d876( org, ang, opcolor, frames )
    {
        if ( !isdefined( frames ) )
        {
            frames = 1;
        }
        
        right = anglestoright( ang );
        left = anglestoright( ang ) * -1;
        forwardfar = vectorscale( left, 52 );
        forwardclose = vectorscale( left, 52 * 0.8 );
        leftdraw = vectorscale( right, 52 * -0.2 );
        rightdraw = vectorscale( right, 52 * 0.2 );
        up = anglestoup( ang );
        right = vectorscale( right, 52 );
        left = vectorscale( left, 52 );
        up = vectorscale( up, 96 );
        red = ( 0.9, 0.2, 0.2 );
        green = ( 0.2, 0.9, 0.2 );
        blue = ( 0.2, 0.2, 0.9 );
        
        if ( isdefined( opcolor ) )
        {
            red = opcolor;
            green = opcolor;
            blue = opcolor;
        }
        
        line( org, org + left, blue, 0.9, 0, frames );
        line( org, org + up, green, 0.9, 0, frames );
    }

    // Namespace wz_escape/wz_escape
    // Params 0
    // Checksum 0xee84078a, Offset: 0x2ef8
    // Size: 0x56e, Type: dev
    function function_13a77bfa()
    {
        if ( !getdvarint( #"hash_43f2306cde703585", 0 ) )
        {
            return;
        }
        
        level flag::wait_till( "<dev string:xea>" );
        var_c57af5d9 = level.var_7767cea8;
        
        do
        {
            waitframe( 12 );
            total_spawns = 0;
            var_ad802a37 = ( 120, 480, 0 );
            debug2dtext( var_ad802a37, "<dev string:x22c>" + var_c57af5d9.size, ( 1, 0.752941, 0.796078 ), 1, ( 0, 0, 0 ), 0.5, 1.3, 12 );
            
            foreach ( influencer in var_c57af5d9 )
            {
                spawns = arraysortclosest( influencer.spawns, influencer.origin );
                furthest = spawns[ spawns.size - 1 ];
                radius = distance2d( influencer.origin, furthest.origin );
                circle( influencer.origin, radius, ( 1, 0.752941, 0.796078 ), 0, 1, 12 );
                print3d( influencer.origin + ( 0, 0, 0 ), function_9e72a96( influencer.target ), ( 1, 0.752941, 0.796078 ), 0.9, 4, 12 );
                print3d( influencer.origin + ( 0, 0, 96 ), spawns.size, ( 1, 0.752941, 0.796078 ), 0.9, 4, 12 );
                
                foreach ( spawn in spawns )
                {
                    line( influencer.origin, spawn.origin, ( 1, 0.752941, 0.796078 ), 1, 0, 12 );
                    sphere( spawn.origin, 10, ( 1, 0.752941, 0.796078 ), 1, 0, 4, 12 );
                    print3d( spawn.origin + ( 0, 0, 12 ), function_9e72a96( spawn.targetname ), ( 1, 0.752941, 0.796078 ), 0.9, 0.5, 12 );
                }
                
                total_spawns += spawns.size;
                var_ad802a37 += ( 0, 28, 0 );
                debug2dtext( var_ad802a37, influencer.target + "<dev string:x243>" + spawns.size, ( 1, 0.752941, 0.796078 ), 1, ( 0, 0, 0 ), 0.5, 1, 12 );
            }
            
            var_ad802a37 += ( 0, 28, 0 );
            debug2dtext( var_ad802a37, "<dev string:x248>" + total_spawns, ( 1, 0.752941, 0.796078 ), 1, ( 0, 0, 0 ), 0.5, 1.3, 12 );
        }
        while ( getdvarint( #"hash_43f2306cde703585", 0 ) );
    }

    // Namespace wz_escape/wz_escape
    // Params 0
    // Checksum 0x33bb2e6a, Offset: 0x3470
    // Size: 0x436, Type: dev
    function function_f42944c7()
    {
        if ( !getdvarint( #"hash_57a9b32c8a8503f1", 0 ) || !self function_1221d304() )
        {
            return;
        }
        
        self endon( #"death" );
        
        if ( !isdefined( level.var_6eef6733 ) )
        {
            level.var_6eef6733 = [];
        }
        
        if ( !isdefined( level.var_6eef6733[ function_9e72a96( self.vehicletype ) ] ) )
        {
            level.var_6eef6733[ function_9e72a96( self.vehicletype ) ] = [];
        }
        
        if ( !isdefined( level.var_6eef6733[ function_9e72a96( self.vehicletype ) ] ) )
        {
            level.var_6eef6733[ function_9e72a96( self.vehicletype ) ] = [];
        }
        else if ( !isarray( level.var_6eef6733[ function_9e72a96( self.vehicletype ) ] ) )
        {
            level.var_6eef6733[ function_9e72a96( self.vehicletype ) ] = array( level.var_6eef6733[ function_9e72a96( self.vehicletype ) ] );
        }
        
        level.var_6eef6733[ function_9e72a96( self.vehicletype ) ][ level.var_6eef6733[ function_9e72a96( self.vehicletype ) ].size ] = self;
        v_spawn_pos = self.origin;
        level thread function_f567f0cd();
        level flag::wait_till( "<dev string:xea>" );
        str_type = function_9e72a96( self.vehicletype );
        v_color = self function_b2775b52();
        
        while ( getdvarint( #"hash_57a9b32c8a8503f1", 0 ) )
        {
            var_91d1913b = distance2d( level.players[ 0 ].origin, self.origin );
            n_radius = 0.015 * var_91d1913b;
            
            if ( n_radius > 768 )
            {
                n_radius = 768;
            }
            
            if ( var_91d1913b > 768 )
            {
                sphere( self.origin, n_radius, v_color );
                
                if ( var_91d1913b < 2048 )
                {
                    print3d( self.origin + ( 0, 0, 32 ), str_type, v_color );
                }
            }
            
            if ( getdvarint( #"hash_491fd7f96bbc8909", 0 ) && distance2d( v_spawn_pos, self.origin ) > 4 )
            {
                line( v_spawn_pos, self.origin, v_color );
                circle( v_spawn_pos, 64, v_color, 0, 1 );
            }
            
            waitframe( 1 );
        }
    }

    // Namespace wz_escape/wz_escape
    // Params 0
    // Checksum 0x9a006651, Offset: 0x38b0
    // Size: 0x25e, Type: dev
    function function_f567f0cd()
    {
        level notify( #"hash_79845fe0e187bb22" );
        level endon( #"hash_79845fe0e187bb22" );
        
        while ( getdvarint( #"hash_57a9b32c8a8503f1", 0 ) )
        {
            n_total = 0;
            var_bd9acc19 = 176;
            
            foreach ( var_f0ffe8b2 in level.var_6eef6733 )
            {
                var_bd9acc19 += 24;
                n_total += var_f0ffe8b2.size;
                
                foreach ( var_3ed342fe in var_f0ffe8b2 )
                {
                    if ( isvehicle( var_3ed342fe ) && isdefined( var_f0ffe8b2 ) && isdefined( var_f0ffe8b2[ 0 ] ) && isdefined( var_f0ffe8b2[ 0 ].vehicletype ) )
                    {
                        debug2dtext( ( 810, var_bd9acc19, 0 ), function_9e72a96( var_f0ffe8b2[ 0 ].vehicletype ) + "<dev string:x243>" + var_f0ffe8b2.size, var_3ed342fe function_b2775b52() );
                        break;
                    }
                }
            }
            
            debug2dtext( ( 810, 176, 0 ), "<dev string:x259>" + n_total, ( 1, 1, 1 ) );
            waitframe( 1 );
        }
    }

    // Namespace wz_escape/wz_escape
    // Params 0
    // Checksum 0xed06baba, Offset: 0x3b18
    // Size: 0x3fe, Type: dev
    function function_1221d304()
    {
        a_str_types = array( #"vehicle_boct_mil_truck_cargo_wz_dark", #"vehicle_boct_mil_truck_cargo_wz_green", #"vehicle_boct_mil_truck_cargo_wz_tan", #"vehicle_boct_mil_boat_tactical_raft_wz_blk", #"vehicle_boct_mil_boat_tactical_raft_wz_gry", #"vehicle_boct_mil_boat_tactical_raft_wz_odg", #"veh_quad_player_wz_blk", #"hash_232abda4e81275f4", #"veh_quad_player_wz_grn", #"hash_2f8d60a5381870ee", #"veh_quad_player_wz_tan", #"vehicle_t8_mil_helicopter_light_transport_wz_grey", #"vehicle_t8_mil_helicopter_light_transport_wz_tan", #"vehicle_t8_mil_helicopter_light_transport_wz_dark", #"vehicle_t8_mil_helicopter_light_transport_wz_black", #"veh_fav_player_wz_blk", #"veh_fav_player_wz_grn", #"veh_fav_player_wz_tan", #"veh_muscle_car_convertible_player_wz_bandit_blk", #"veh_muscle_car_convertible_player_wz_blu", #"veh_muscle_car_convertible_player_wz_grn", #"veh_muscle_car_convertible_player_wz_org", #"veh_muscle_car_convertible_player_wz_phantom", #"veh_muscle_car_convertible_player_wz_red", #"veh_muscle_car_convertible_player_wz_replacer", #"veh_muscle_car_convertible_player_wz_wht", #"veh_muscle_car_convertible_player_wz_ylw", #"veh_muscle_car_convertible_player_wz_blk", #"veh_muscle_car_convertible_player_wz_racing_grn", #"veh_suv_player_police_wz", #"vehicle_boct_mil_boat_pbr_wz_police", #"veh_suv_player_wz_blk", #"veh_suv_player_wz_gry", #"veh_suv_player_wz_met_gry", #"veh_suv_player_wz_wht", #"vehicle_t8_mil_helicopter_light_transport_wz_police", #"veh_suv_player_private_security_wz", #"veh_quad_player_wz_police", #"hash_482e864157620248", #"hash_1d37bc413f25898e", #"hash_1d37af413f257377", #"hash_8ea0340ead96490", #"hash_79bf6a7491c80c7", #"hash_32e4c0a7619f03a9", #"hash_22d9b5a7a0d9dd73", #"vehicle_boct_mil_boat_pbr_wz_black", #"vehicle_boct_mil_boat_pbr_wz_green", #"vehicle_boct_mil_boat_pbr_wz_grey", #"vehicle_boct_mil_boat_pbr_wz_tan", #"vehicle_t8_mil_helicopter_light_gunner_wz_black", #"vehicle_t8_mil_helicopter_light_gunner_wz_dark", #"vehicle_t8_mil_helicopter_light_gunner_wz_green", #"vehicle_t8_mil_helicopter_light_gunner_wz_grey", #"vehicle_t8_mil_helicopter_light_gunner_wz_tan" );
        
        foreach ( str_type in a_str_types )
        {
            if ( self.vehicletype == str_type )
            {
                return 1;
            }
        }
        
        return 0;
    }

    // Namespace wz_escape/wz_escape
    // Params 0
    // Checksum 0x5711e9b1, Offset: 0x3f20
    // Size: 0x3e2, Type: dev
    function function_b2775b52()
    {
        switch ( self.vehicletype )
        {
            case #"veh_quad_player_wz_blk":
            case #"hash_232abda4e81275f4":
            case #"veh_quad_player_wz_grn":
            case #"veh_quad_player_wz_tan":
            case #"hash_2f8d60a5381870ee":
                return ( 0, 0, 1 );
            case #"vehicle_boct_mil_truck_cargo_wz_tan":
            case #"vehicle_boct_mil_truck_cargo_wz_dark":
            case #"vehicle_boct_mil_truck_cargo_wz_green":
                return ( 1, 0, 1 );
            case #"vehicle_t8_mil_helicopter_light_transport_wz_grey":
            case #"vehicle_t8_mil_helicopter_light_transport_wz_black":
            case #"hash_482e864157620248":
            case #"vehicle_t8_mil_helicopter_light_gunner_wz_green":
            case #"vehicle_t8_mil_helicopter_light_gunner_wz_dark":
            case #"vehicle_t8_mil_helicopter_light_transport_wz_tan":
            case #"vehicle_t8_mil_helicopter_light_gunner_wz_tan":
            case #"vehicle_t8_mil_helicopter_light_gunner_wz_grey":
            case #"hash_1d37af413f257377":
            case #"hash_1d37bc413f25898e":
            case #"vehicle_t8_mil_helicopter_light_gunner_wz_black":
            case #"vehicle_t8_mil_helicopter_light_transport_wz_dark":
                return ( 1, 0, 0 );
            case #"vehicle_boct_mil_boat_tactical_raft_wz_blk":
            case #"vehicle_boct_mil_boat_tactical_raft_wz_gry":
            case #"vehicle_boct_mil_boat_tactical_raft_wz_odg":
                return ( 1, 0.5, 0 );
            case #"veh_fav_player_wz_blk":
            case #"veh_fav_player_wz_tan":
            case #"veh_fav_player_wz_grn":
            case #"hash_79bf6a7491c80c7":
            case #"hash_22d9b5a7a0d9dd73":
            case #"hash_32e4c0a7619f03a9":
                return ( 0.501961, 0.501961, 0 );
            case #"vehicle_boct_mil_boat_pbr_wz_tan":
            case #"vehicle_boct_mil_boat_pbr_wz_grey":
            case #"vehicle_boct_mil_boat_pbr_wz_green":
            case #"vehicle_boct_mil_boat_pbr_wz_police":
            case #"vehicle_boct_mil_boat_pbr_wz_black":
                return ( 0, 1, 0 );
            case #"veh_suv_player_wz_blk":
            case #"veh_suv_player_wz_met_gry":
            case #"veh_suv_player_wz_wht":
            case #"veh_suv_player_wz_gry":
            case #"veh_suv_player_private_security_wz":
            case #"veh_suv_player_police_wz":
                return ( 0, 1, 1 );
            case #"veh_muscle_car_convertible_player_wz_wht":
            case #"veh_muscle_car_convertible_player_wz_replacer":
            case #"veh_muscle_car_convertible_player_wz_grn":
            case #"veh_muscle_car_convertible_player_wz_red":
            case #"veh_muscle_car_convertible_player_wz_org":
            case #"veh_muscle_car_convertible_player_wz_blk":
            case #"veh_muscle_car_convertible_player_wz_bandit_blk":
            case #"veh_muscle_car_convertible_player_wz_racing_grn":
            case #"veh_muscle_car_convertible_player_wz_blu":
            case #"veh_muscle_car_convertible_player_wz_ylw":
            case #"veh_muscle_car_convertible_player_wz_phantom":
                return ( 0, 1, 1 );
            case #"veh_quad_player_wz_police":
                return ( 0.545098, 0.270588, 0.0745098 );
            default:
                return ( 1, 0, 1 );
        }
    }

    // Namespace wz_escape/wz_escape
    // Params 0
    // Checksum 0x68f00396, Offset: 0x4310
    // Size: 0x34a, Type: dev
    function function_4b227faf()
    {
        if ( !getdvarint( #"hash_59e2d7722e56c1c6", 0 ) )
        {
            return;
        }
        
        item_spawn_groups = struct::get_array( "<dev string:xbb>", "<dev string:xd8>" );
        
        foreach ( group in item_spawn_groups )
        {
            switch ( group.scriptbundlename )
            {
                case #"wz_escape_zodiac":
                    var_dc1ea650 = group;
                    break;
                default:
                    break;
            }
        }
        
        var_4ff6627b = [];
        var_6b5f6eb2 = function_91b29d2a( var_dc1ea650.target );
        var_4ff6627b = arraycombine( var_4ff6627b, var_6b5f6eb2, 0, 0 );
        level flag::wait_till( "<dev string:x272>" );
        
        while ( getdvarint( #"hash_59e2d7722e56c1c6", 0 ) )
        {
            foreach ( point in var_4ff6627b )
            {
                var_91d1913b = distance2d( level.players[ 0 ].origin, point.origin );
                n_radius = 0.015 * var_91d1913b;
                
                if ( n_radius > 768 )
                {
                    n_radius = 768;
                }
                
                if ( var_91d1913b > 768 )
                {
                    v_color = function_df930125( point.targetname );
                    str_type = function_9e72a96( point.targetname );
                    sphere( point.origin, n_radius, v_color );
                    
                    if ( var_91d1913b < 2048 )
                    {
                        print3d( point.origin + ( 0, 0, 32 ), str_type, v_color );
                    }
                }
            }
            
            waitframe( 1 );
        }
    }

    // Namespace wz_escape/wz_escape
    // Params 1
    // Checksum 0xb08c45c8, Offset: 0x4668
    // Size: 0x5a, Type: dev
    function function_df930125( str_type )
    {
        switch ( str_type )
        {
            case #"raft_items":
                return ( 1, 0, 0 );
            default:
                return ( 1, 0.5, 0 );
        }
    }

    // Namespace wz_escape/wz_escape
    // Params 0
    // Checksum 0xb9bfe669, Offset: 0x46d0
    // Size: 0xb0, Type: dev
    function devgui_weapon_think()
    {
        for ( ;; )
        {
            weapon_index = getdvarint( #"scr_give_wz_item", 0 );
            
            switch ( weapon_index )
            {
                case 1:
                    devgui_handle_player_command( &function_1880c93d );
                    break;
            }
            
            setdvar( #"scr_give_wz_item", 0 );
            wait 0.5;
        }
    }

    // Namespace wz_escape/wz_escape
    // Params 3
    // Checksum 0xe688d262, Offset: 0x4788
    // Size: 0x134, Type: dev
    function devgui_handle_player_command( playercallback, pcb_param_1, pcb_param_2 )
    {
        pid = getdvarint( #"scr_give_wz_item", 0 );
        
        if ( pid > 0 )
        {
            player = getplayers()[ pid - 1 ];
            
            if ( isdefined( player ) )
            {
                if ( isdefined( pcb_param_2 ) )
                {
                    player thread [[ playercallback ]]( pcb_param_1, pcb_param_2 );
                }
                else if ( isdefined( pcb_param_1 ) )
                {
                    player thread [[ playercallback ]]( pcb_param_1 );
                }
                else
                {
                    player thread [[ playercallback ]]();
                }
            }
        }
        else
        {
            array::thread_all( getplayers(), playercallback, pcb_param_1, pcb_param_2 );
        }
        
        setdvar( #"scr_give_wz_item", -1 );
    }

    // Namespace wz_escape/wz_escape
    // Params 0, eflags: 0x4
    // Checksum 0x12999f34, Offset: 0x48c8
    // Size: 0xb4, Type: dev
    function private function_1880c93d()
    {
        assert( isdefined( self ) );
        assert( isplayer( self ) );
        item = wz_loadouts::_get_item( #"ultimate_turret_wz_item" );
        var_fa3df96 = self item_inventory::function_e66dcff5( item );
        self item_world::function_de2018e3( item, self, var_fa3df96 );
    }

#/
