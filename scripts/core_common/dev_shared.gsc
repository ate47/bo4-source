#using scripts\core_common\gestures;
#using scripts\core_common\util_shared;

#namespace dev;

/#

    // Namespace dev/dev_shared
    // Params 5
    // Checksum 0xccbb20e9, Offset: 0x78
    // Size: 0xbc, Type: dev
    function debug_sphere( origin, radius, color, alpha, time )
    {
        if ( !isdefined( time ) )
        {
            time = 1000;
        }
        
        if ( !isdefined( color ) )
        {
            color = ( 1, 1, 1 );
        }
        
        sides = int( 10 * ( 1 + int( radius ) % 100 ) );
        sphere( origin, radius, color, alpha, 1, sides, time );
    }

    // Namespace dev/dev_shared
    // Params 0
    // Checksum 0xa1f88f5b, Offset: 0x140
    // Size: 0x3e6, Type: dev
    function devgui_test_chart_think()
    {
        waitframe( 1 );
        old_val = getdvarint( #"scr_debug_test_chart", 0 );
        scale = 120;
        
        for ( ;; )
        {
            val = getdvarint( #"scr_debug_test_chart", 0 );
            
            if ( old_val != val )
            {
                if ( isdefined( level.test_chart_model ) )
                {
                    level.test_chart_model delete();
                    level.test_chart_model = undefined;
                }
                
                if ( val )
                {
                    player = getplayers()[ 0 ];
                    direction = player getplayerangles();
                    direction_vec = anglestoforward( ( 0, direction[ 1 ], 0 ) );
                    direction_vec = ( direction_vec[ 0 ] * scale, direction_vec[ 1 ] * scale, direction_vec[ 2 ] * scale );
                    level.test_chart_model = spawn( "<dev string:x38>", player geteye() + direction_vec );
                    level.test_chart_model setmodel( #"test_chart_model" );
                    level.test_chart_model.angles = ( 0, direction[ 1 ], 0 ) + ( 0, 90, 0 );
                }
            }
            
            if ( val )
            {
                player = getplayers()[ 0 ];
                
                if ( val == 1 )
                {
                    level.test_chart_model setmodel( #"test_chart_model" );
                }
                else if ( val == 2 )
                {
                    level.test_chart_model setmodel( #"test_chart_model_2" );
                }
                else if ( val == 3 )
                {
                    level.test_chart_model setmodel( #"test_chart_model_3" );
                }
                
                direction = player getplayerangles();
                direction_vec = anglestoforward( ( 0, direction[ 1 ], 0 ) );
                direction_vec = ( direction_vec[ 0 ] * scale, direction_vec[ 1 ] * scale, direction_vec[ 2 ] * scale );
                level.test_chart_model.angles = ( 0, direction[ 1 ], 0 ) + ( 0, 90, 0 );
                level.test_chart_model.origin = player geteye() + direction_vec;
                
                if ( player meleebuttonpressed() )
                {
                    scale += 10;
                }
                
                if ( player sprintbuttonpressed() )
                {
                    scale -= 10;
                }
            }
            
            old_val = val;
            waitframe( 1 );
        }
    }

    // Namespace dev/dev_shared
    // Params 0
    // Checksum 0xe8efbeb2, Offset: 0x530
    // Size: 0xad4, Type: dev
    function updateminimapsetting()
    {
        requiredmapaspectratio = getdvarfloat( #"scr_requiredmapaspectratio", 0 );
        
        if ( !isdefined( level.minimapheight ) )
        {
            setdvar( #"scr_minimap_height", 0 );
            level.minimapheight = 0;
        }
        
        minimapheight = getdvarfloat( #"scr_minimap_height", 0 );
        
        if ( minimapheight != level.minimapheight )
        {
            if ( minimapheight <= 0 )
            {
                util::gethostplayer() cameraactivate( 0 );
                level.minimapheight = minimapheight;
                level notify( #"end_draw_map_bounds" );
            }
            
            if ( minimapheight > 0 )
            {
                level.minimapheight = minimapheight;
                players = getplayers();
                
                if ( players.size > 0 )
                {
                    player = util::gethostplayer();
                    corners = getentarray( "<dev string:x47>", "<dev string:x58>" );
                    
                    if ( corners.size == 2 )
                    {
                        viewpos = corners[ 0 ].origin + corners[ 1 ].origin;
                        viewpos = ( viewpos[ 0 ] * 0.5, viewpos[ 1 ] * 0.5, viewpos[ 2 ] * 0.5 );
                        level thread minimapwarn( corners );
                        maxcorner = ( corners[ 0 ].origin[ 0 ], corners[ 0 ].origin[ 1 ], viewpos[ 2 ] );
                        mincorner = ( corners[ 0 ].origin[ 0 ], corners[ 0 ].origin[ 1 ], viewpos[ 2 ] );
                        
                        if ( corners[ 1 ].origin[ 0 ] > corners[ 0 ].origin[ 0 ] )
                        {
                            maxcorner = ( corners[ 1 ].origin[ 0 ], maxcorner[ 1 ], maxcorner[ 2 ] );
                        }
                        else
                        {
                            mincorner = ( corners[ 1 ].origin[ 0 ], mincorner[ 1 ], mincorner[ 2 ] );
                        }
                        
                        if ( corners[ 1 ].origin[ 1 ] > corners[ 0 ].origin[ 1 ] )
                        {
                            maxcorner = ( maxcorner[ 0 ], corners[ 1 ].origin[ 1 ], maxcorner[ 2 ] );
                        }
                        else
                        {
                            mincorner = ( mincorner[ 0 ], corners[ 1 ].origin[ 1 ], mincorner[ 2 ] );
                        }
                        
                        viewpostocorner = maxcorner - viewpos;
                        viewpos = ( viewpos[ 0 ], viewpos[ 1 ], viewpos[ 2 ] + minimapheight );
                        northvector = ( cos( getnorthyaw() ), sin( getnorthyaw() ), 0 );
                        eastvector = ( northvector[ 1 ], 0 - northvector[ 0 ], 0 );
                        disttotop = vectordot( northvector, viewpostocorner );
                        
                        if ( disttotop < 0 )
                        {
                            disttotop = 0 - disttotop;
                        }
                        
                        disttoside = vectordot( eastvector, viewpostocorner );
                        
                        if ( disttoside < 0 )
                        {
                            disttoside = 0 - disttoside;
                        }
                        
                        if ( requiredmapaspectratio > 0 )
                        {
                            mapaspectratio = disttoside / disttotop;
                            
                            if ( mapaspectratio < requiredmapaspectratio )
                            {
                                incr = requiredmapaspectratio / mapaspectratio;
                                disttoside *= incr;
                                addvec = vecscale( eastvector, vectordot( eastvector, maxcorner - viewpos ) * ( incr - 1 ) );
                                mincorner -= addvec;
                                maxcorner += addvec;
                            }
                            else
                            {
                                incr = mapaspectratio / requiredmapaspectratio;
                                disttotop *= incr;
                                addvec = vecscale( northvector, vectordot( northvector, maxcorner - viewpos ) * ( incr - 1 ) );
                                mincorner -= addvec;
                                maxcorner += addvec;
                            }
                        }
                        
                        if ( level.console )
                        {
                            aspectratioguess = 1.77778;
                            angleside = 2 * atan( disttoside * 0.8 / minimapheight );
                            angletop = 2 * atan( disttotop * aspectratioguess * 0.8 / minimapheight );
                        }
                        else
                        {
                            aspectratioguess = 1.33333;
                            angleside = 2 * atan( disttoside / minimapheight );
                            angletop = 2 * atan( disttotop * aspectratioguess / minimapheight );
                        }
                        
                        if ( angleside > angletop )
                        {
                            angle = angleside;
                        }
                        else
                        {
                            angle = angletop;
                        }
                        
                        znear = minimapheight - 1000;
                        
                        if ( znear < 16 )
                        {
                            znear = 16;
                        }
                        
                        if ( znear > 10000 )
                        {
                            znear = 10000;
                        }
                        
                        player camerasetposition( viewpos, ( 90, getnorthyaw(), 0 ) );
                        player cameraactivate( 1 );
                        player takeallweapons();
                        setdvar( #"cg_drawgun", 0 );
                        setdvar( #"cg_draw2d", 0 );
                        setdvar( #"cg_drawfps", 0 );
                        setdvar( #"fx_enable", 0 );
                        setdvar( #"r_fog", 0 );
                        setdvar( #"r_highloddist", 0 );
                        setdvar( #"r_znear", znear );
                        setdvar( #"r_lodscalerigid", 0.1 );
                        setdvar( #"cg_drawversion", 0 );
                        setdvar( #"sm_enable", 1 );
                        setdvar( #"player_view_pitch_down", 90 );
                        setdvar( #"player_view_pitch_up", 0 );
                        setdvar( #"cg_fov", angle );
                        setdvar( #"cg_drawminimap", 1 );
                        setdvar( #"r_umbranumthreads", 1 );
                        setdvar( #"r_umbradistancescale", 0.1 );
                        setdvar( #"r_uselensfov", 0 );
                        setdvar( #"hash_5ee9a4ac16993e50", 1 );
                        setdvar( #"debug_show_viewpos", 0 );
                        thread drawminimapbounds( viewpos, mincorner, maxcorner );
                    }
                    else
                    {
                        println( "<dev string:x65>" );
                    }
                    
                    return;
                }
                
                setdvar( #"scr_minimap_height", 0 );
            }
        }
    }

    // Namespace dev/dev_shared
    // Params 2
    // Checksum 0x270fadc7, Offset: 0x1010
    // Size: 0x4a, Type: dev
    function vecscale( vec, scalar )
    {
        return ( vec[ 0 ] * scalar, vec[ 1 ] * scalar, vec[ 2 ] * scalar );
    }

    // Namespace dev/dev_shared
    // Params 3
    // Checksum 0x8cbc3e27, Offset: 0x1068
    // Size: 0x396, Type: dev
    function drawminimapbounds( viewpos, mincorner, maxcorner )
    {
        level notify( #"end_draw_map_bounds" );
        level endon( #"end_draw_map_bounds" );
        viewheight = viewpos[ 2 ] - maxcorner[ 2 ];
        north = ( cos( getnorthyaw() ), sin( getnorthyaw() ), 0 );
        diaglen = length( mincorner - maxcorner );
        mincorneroffset = mincorner - viewpos;
        mincorneroffset = vectornormalize( ( mincorneroffset[ 0 ], mincorneroffset[ 1 ], 0 ) );
        mincorner += vecscale( mincorneroffset, diaglen * 1 / 800 );
        maxcorneroffset = maxcorner - viewpos;
        maxcorneroffset = vectornormalize( ( maxcorneroffset[ 0 ], maxcorneroffset[ 1 ], 0 ) );
        maxcorner += vecscale( maxcorneroffset, diaglen * 1 / 800 );
        diagonal = maxcorner - mincorner;
        side = vecscale( north, vectordot( diagonal, north ) );
        sidenorth = vecscale( north, abs( vectordot( diagonal, north ) ) );
        corner0 = mincorner;
        corner1 = mincorner + side;
        corner2 = maxcorner;
        corner3 = maxcorner - side;
        toppos = vecscale( mincorner + maxcorner, 0.5 ) + vecscale( sidenorth, 0.51 );
        textscale = diaglen * 0.003;
        
        while ( true )
        {
            line( corner0, corner1 );
            line( corner1, corner2 );
            line( corner2, corner3 );
            line( corner3, corner0 );
            print3d( toppos, "<dev string:xb0>", ( 1, 1, 1 ), 1, textscale );
            waitframe( 1 );
        }
    }

    // Namespace dev/dev_shared
    // Params 1
    // Checksum 0xb0ff35b0, Offset: 0x1408
    // Size: 0x10, Type: dev
    function minimapwarn( corners )
    {
        
    }

    // Namespace dev/dev_shared
    // Params 0
    // Checksum 0xdae5961e, Offset: 0x1420
    // Size: 0x11e, Type: dev
    function function_e5746ec1()
    {
        host = util::gethostplayer();
        all_players = getplayers();
        var_1645eaac = host getstance() == "<dev string:xbf>";
        
        if ( !isdefined( host ) || var_1645eaac )
        {
            return all_players;
        }
        
        all_players = arraysort( all_players, host.origin );
        players = [];
        
        if ( all_players.size == 1 || host getstance() == "<dev string:xc7>" )
        {
            players[ 0 ] = host;
        }
        else
        {
            players[ 0 ] = all_players[ 1 ];
        }
        
        return players;
    }

    // Namespace dev/dev_shared
    // Params 2
    // Checksum 0xf7482fb4, Offset: 0x1548
    // Size: 0xc8, Type: dev
    function function_5639909a( bodytype, outfitindex )
    {
        players = function_e5746ec1();
        
        foreach ( player in players )
        {
            player setcharacterbodytype( bodytype );
            player setcharacteroutfit( outfitindex );
        }
    }

    // Namespace dev/dev_shared
    // Params 4
    // Checksum 0x7356cd84, Offset: 0x1618
    // Size: 0x178, Type: dev
    function function_f413b4d5( bodytype, outfitindex, var_c1154821, index )
    {
        players = function_e5746ec1();
        
        if ( var_c1154821 == "<dev string:xcf>" )
        {
            foreach ( player in players )
            {
                player function_fbc5a093( index );
            }
            
            return;
        }
        
        foreach ( player in players )
        {
            if ( var_c1154821 == "<dev string:xd8>" )
            {
                player setcharacterwarpaintoutfit( outfitindex );
            }
            
            player function_ab96a9b5( var_c1154821, index );
        }
    }

    // Namespace dev/dev_shared
    // Params 1
    // Checksum 0x1b63a7b2, Offset: 0x1798
    // Size: 0x3ca, Type: dev
    function body_customization_process_command( character_index )
    {
        println( "<dev string:xe3>" + character_index + "<dev string:x10a>" );
        split = strtok( character_index, "<dev string:x10e>" );
        
        switch ( split.size )
        {
            case 1:
                command0 = strtok( split[ 0 ], "<dev string:x112>" );
                bodytype = int( command0[ 1 ] );
                println( "<dev string:x116>" + bodytype + "<dev string:x154>" );
                function_5639909a( bodytype, 0 );
                break;
            case 2:
                command0 = strtok( split[ 0 ], "<dev string:x112>" );
                bodytype = int( command0[ 1 ] );
                command1 = strtok( split[ 1 ], "<dev string:x112>" );
                outfitindex = int( command1[ 1 ] );
                println( "<dev string:x116>" + bodytype + "<dev string:x158>" + outfitindex + "<dev string:x154>" );
                function_5639909a( bodytype, outfitindex );
                break;
            case 3:
                command0 = strtok( split[ 0 ], "<dev string:x112>" );
                bodytype = int( command0[ 1 ] );
                command1 = strtok( split[ 1 ], "<dev string:x112>" );
                outfitindex = int( command1[ 1 ] );
                var_e7f74d2b = strtok( split[ 2 ], "<dev string:x112>" );
                var_c1154821 = var_e7f74d2b[ 0 ];
                index = int( var_e7f74d2b[ 1 ] );
                println( "<dev string:x168>" + bodytype + "<dev string:x158>" + outfitindex + "<dev string:x19d>" + var_c1154821 + "<dev string:x1a6>" + index + "<dev string:x154>" );
                function_f413b4d5( bodytype, outfitindex, var_c1154821, index );
                break;
            default:
                break;
        }
    }

    // Namespace dev/dev_shared
    // Params 5
    // Checksum 0x5a43aefc, Offset: 0x1b70
    // Size: 0x120, Type: dev
    function function_3cec5609( &arr, devgui_path, bodytype, outfitindex, optiontype )
    {
        foreach ( index, option in arr )
        {
            if ( option.isvalid )
            {
                util::add_debug_command( devgui_path + index + "<dev string:x1aa>" + "<dev string:x1b4>" + "<dev string:x1a6>" + "<dev string:x1c2>" + bodytype + "<dev string:x10e>" + "<dev string:x1ce>" + outfitindex + "<dev string:x10e>" + optiontype + "<dev string:x112>" + index + "<dev string:x1d8>" );
            }
        }
    }

    // Namespace dev/dev_shared
    // Params 1
    // Checksum 0x59966e49, Offset: 0x1c98
    // Size: 0x44, Type: dev
    function function_2c6232e5( in_string )
    {
        out_string = strreplace( in_string, "<dev string:x112>", "<dev string:x1de>" );
        return out_string;
    }

    // Namespace dev/dev_shared
    // Params 1
    // Checksum 0x5b6530e7, Offset: 0x1ce8
    // Size: 0x150, Type: dev
    function function_970d4891( mode )
    {
        bodies = getallcharacterbodies( mode );
        
        foreach ( playerbodytype in bodies )
        {
            body_name = function_2c6232e5( makelocalizedstring( getcharacterdisplayname( playerbodytype, mode ) ) ) + "<dev string:x1e1>" + function_9e72a96( getcharacterassetname( playerbodytype, mode ) );
            util::add_devgui( "<dev string:x1e5>" + body_name + "<dev string:x202>", "<dev string:x217>" + "<dev string:x21e>" + "<dev string:x1a6>" + body_name );
        }
    }

    // Namespace dev/dev_shared
    // Params 2
    // Checksum 0xdd3c4ed4, Offset: 0x1e40
    // Size: 0x7fa, Type: dev
    function body_customization_populate( mode, var_ef4940a5 )
    {
        bodies = getallcharacterbodies( mode );
        body_customization_devgui_base = "<dev string:x23e>" + "<dev string:x1e5>";
        
        foreach ( playerbodytype in bodies )
        {
            body_name = function_2c6232e5( makelocalizedstring( getcharacterdisplayname( playerbodytype, mode ) ) ) + "<dev string:x1e1>" + function_9e72a96( getcharacterassetname( playerbodytype, mode ) );
            
            if ( isdefined( var_ef4940a5 ) && var_ef4940a5 != body_name )
            {
                continue;
            }
            
            util::add_debug_command( body_customization_devgui_base + body_name + "<dev string:x24d>" + "<dev string:x1aa>" + "<dev string:x1b4>" + "<dev string:x1a6>" + "<dev string:x1c2>" + playerbodytype + "<dev string:x1d8>" );
            outfitcount = function_d299ef16( playerbodytype, mode );
            
            for ( outfitindex = 0; outfitindex < outfitcount ; outfitindex++ )
            {
                var_9cf37283 = function_d7c3cf6c( playerbodytype, outfitindex, mode );
                
                if ( var_9cf37283.valid )
                {
                    var_346660ac = function_2c6232e5( makelocalizedstring( function_9e72a96( var_9cf37283.var_74996050 ) ) );
                    var_1bf829f2 = outfitindex + "<dev string:x1e1>" + var_346660ac + "<dev string:x1e1>" + function_9e72a96( var_9cf37283.namehash ) + "<dev string:x112>" + outfitindex;
                    var_a818c4e = body_customization_devgui_base + body_name + "<dev string:x258>" + var_1bf829f2;
                    util::add_debug_command( var_a818c4e + "<dev string:x24d>" + "<dev string:x1aa>" + "<dev string:x1b4>" + "<dev string:x1a6>" + "<dev string:x1c2>" + playerbodytype + "<dev string:x10e>" + "<dev string:x1ce>" + outfitindex + "<dev string:x1d8>" );
                    types = [ { #path:"<dev string:x25c>", #field:"<dev string:x267>" }, { #path:"<dev string:x26e>", #field:"<dev string:x27d>" }, { #path:"<dev string:x285>", #field:"<dev string:x292>" }, { #path:"<dev string:x299>", #field:"<dev string:x2ab>" }, { #path:"<dev string:x2b6>", #field:"<dev string:x2c1>" }, { #path:"<dev string:x2c8>", #field:"<dev string:x2db>" }, { #path:"<dev string:x2e5>", #field:"<dev string:x2f4>" }, { #path:"<dev string:x2fc>", #field:"<dev string:xd8>" } ];
                    
                    foreach ( type, data in types )
                    {
                        foreach ( index, option in var_9cf37283.options[ type ] )
                        {
                            if ( option.isvalid )
                            {
                                util::waittill_can_add_debug_command();
                                util::add_debug_command( var_a818c4e + "<dev string:x258>" + data.path + "<dev string:x1a6>" + index + "<dev string:x112>" + index + "<dev string:x1aa>" + "<dev string:x1b4>" + "<dev string:x1a6>" + "<dev string:x1c2>" + playerbodytype + "<dev string:x10e>" + "<dev string:x1ce>" + outfitindex + "<dev string:x10e>" + data.field + "<dev string:x112>" + index + "<dev string:x1d8>" );
                            }
                        }
                    }
                    
                    for ( presetindex = 0; presetindex < var_9cf37283.presets.size ; presetindex++ )
                    {
                        preset = var_9cf37283.presets[ presetindex ];
                        
                        if ( !preset.isvalid )
                        {
                            continue;
                        }
                        
                        util::waittill_can_add_debug_command();
                        util::add_debug_command( var_a818c4e + "<dev string:x258>" + "<dev string:x313>" + presetindex + "<dev string:x112>" + presetindex + "<dev string:x1aa>" + "<dev string:x1b4>" + "<dev string:x1a6>" + "<dev string:x1c2>" + playerbodytype + "<dev string:x10e>" + "<dev string:x1ce>" + outfitindex + "<dev string:x10e>" + "<dev string:xcf>" + "<dev string:x112>" + presetindex + "<dev string:x1d8>" );
                    }
                }
                
                if ( isdefined( var_ef4940a5 ) )
                {
                    util::remove_devgui( "<dev string:x1e5>" + body_name + "<dev string:x325>" );
                }
            }
        }
    }

    // Namespace dev/dev_shared
    // Params 1
    // Checksum 0xbddd4895, Offset: 0x2648
    // Size: 0x138, Type: dev
    function body_customization_devgui( mode )
    {
        function_970d4891( mode );
        
        for ( ;; )
        {
            var_f12e4923 = getdvarstring( #"hash_2195b248bfe1371e", "<dev string:x1de>" );
            
            if ( var_f12e4923 != "<dev string:x1de>" )
            {
                level thread body_customization_populate( mode, var_f12e4923 );
                setdvar( #"hash_2195b248bfe1371e", "<dev string:x1de>" );
            }
            
            character_index = getdvarstring( #"char_devgui", "<dev string:x1de>" );
            
            if ( character_index != "<dev string:x1de>" )
            {
                body_customization_process_command( character_index );
                setdvar( #"char_devgui", "<dev string:x1de>" );
            }
            
            wait 0.5;
        }
    }

    // Namespace dev/dev_shared
    // Params 2
    // Checksum 0x6e9695a3, Offset: 0x2788
    // Size: 0xbc, Type: dev
    function add_perk_devgui( name, specialties )
    {
        perk_devgui_base = "<dev string:x338>";
        perk_name = name;
        test = perk_devgui_base + perk_name + "<dev string:x1aa>" + "<dev string:x35e>" + "<dev string:x1a6>" + specialties + "<dev string:x1d8>";
        util::add_debug_command( perk_devgui_base + perk_name + "<dev string:x1aa>" + "<dev string:x35e>" + "<dev string:x1a6>" + specialties + "<dev string:x1d8>" );
    }

    // Namespace dev/dev_shared
    // Params 2
    // Checksum 0xa0b65a95, Offset: 0x2850
    // Size: 0xcc, Type: dev
    function function_373068ca( name, postfix )
    {
        if ( !isdefined( postfix ) )
        {
            postfix = "<dev string:x1de>";
        }
        
        if ( !isdefined( name ) )
        {
            return;
        }
        
        if ( name == "<dev string:x1de>" )
        {
            return;
        }
        
        util::waittill_can_add_debug_command();
        talentname = "<dev string:x1de>" + name + postfix;
        cmd = "<dev string:x217>" + "<dev string:x36d>" + "<dev string:x1a6>" + talentname;
        util::add_devgui( "<dev string:x37e>" + talentname, cmd );
    }

    // Namespace dev/dev_shared
    // Params 2
    // Checksum 0x4248fc2b, Offset: 0x2928
    // Size: 0xdc, Type: dev
    function function_8263c0d5( name, postfix )
    {
        if ( !isdefined( postfix ) )
        {
            postfix = "<dev string:x1de>";
        }
        
        if ( !isdefined( name ) )
        {
            return;
        }
        
        if ( name == "<dev string:x1de>" )
        {
            return;
        }
        
        util::waittill_can_add_debug_command();
        talentname = "<dev string:x3ad>" + getsubstr( name, 7 ) + postfix;
        cmd = "<dev string:x217>" + "<dev string:x3b6>" + "<dev string:x1a6>" + talentname;
        util::add_devgui( "<dev string:x3c6>" + talentname, cmd );
    }

    // Namespace dev/dev_shared
    // Params 0
    // Checksum 0xc35e7327, Offset: 0x2a10
    // Size: 0x17c, Type: dev
    function function_a432e633()
    {
        gesture = getdvarstring( #"scr_givegesture" );
        
        if ( isdefined( gesture ) && gesture != "<dev string:x1de>" )
        {
            foreach ( player in level.players )
            {
                if ( isbot( player ) )
                {
                    continue;
                }
                
                player gestures::clear_gesture();
                player.loadoutgesture = getweapon( gesture );
                
                if ( isdefined( player.loadoutgesture ) && player.loadoutgesture != level.weaponnone )
                {
                    player gestures::give_gesture( player.loadoutgesture );
                }
            }
        }
        
        setdvar( #"scr_givegesture", "<dev string:x1de>" );
    }

    // Namespace dev/dev_shared
    // Params 0
    // Checksum 0xa5c6773, Offset: 0x2b98
    // Size: 0x90, Type: dev
    function function_487bf571()
    {
        for ( ;; )
        {
            gesture = getdvarstring( #"scr_givegesture" );
            
            if ( gesture != "<dev string:x1de>" )
            {
                function_a432e633();
            }
            
            setdvar( #"scr_givegesture", "<dev string:x1de>" );
            wait 0.5;
        }
    }

    // Namespace dev/dev_shared
    // Params 1
    // Checksum 0x18d0ac7a, Offset: 0x2c30
    // Size: 0xca, Type: dev
    function get_lookat_origin( player )
    {
        angles = player getplayerangles();
        forward = anglestoforward( angles );
        dir = vectorscale( forward, 8000 );
        eye = player geteye();
        trace = bullettrace( eye, eye + dir, 0, undefined );
        return trace[ #"position" ];
    }

    // Namespace dev/dev_shared
    // Params 2
    // Checksum 0x80adb512, Offset: 0x2d08
    // Size: 0x6c, Type: dev
    function draw_pathnode( node, color )
    {
        if ( !isdefined( color ) )
        {
            color = ( 1, 0, 1 );
        }
        
        box( node.origin, ( -16, -16, 0 ), ( 16, 16, 16 ), 0, color, 1, 0, 1 );
    }

    // Namespace dev/dev_shared
    // Params 2
    // Checksum 0x41b1948b, Offset: 0x2d80
    // Size: 0x4e, Type: dev
    function draw_pathnode_think( node, color )
    {
        level endon( #"draw_pathnode_stop" );
        
        for ( ;; )
        {
            draw_pathnode( node, color );
            waitframe( 1 );
        }
    }

    // Namespace dev/dev_shared
    // Params 0
    // Checksum 0xd865e538, Offset: 0x2dd8
    // Size: 0x20, Type: dev
    function draw_pathnodes_stop()
    {
        wait 5;
        level notify( #"draw_pathnode_stop" );
    }

    // Namespace dev/dev_shared
    // Params 1
    // Checksum 0xca466bcd, Offset: 0x2e00
    // Size: 0x120, Type: dev
    function node_get( player )
    {
        for ( ;; )
        {
            waitframe( 1 );
            origin = get_lookat_origin( player );
            node = getnearestnode( origin );
            
            if ( !isdefined( node ) )
            {
                continue;
            }
            
            if ( player buttonpressed( "<dev string:x3ef>" ) )
            {
                return node;
            }
            else if ( player buttonpressed( "<dev string:x3fa>" ) )
            {
                return undefined;
            }
            
            if ( node.type == #"path" )
            {
                draw_pathnode( node, ( 1, 0, 1 ) );
                continue;
            }
            
            draw_pathnode( node, ( 0.85, 0.85, 0.1 ) );
        }
    }

    // Namespace dev/dev_shared
    // Params 0
    // Checksum 0x736182bf, Offset: 0x2f28
    // Size: 0x1a6, Type: dev
    function dev_get_node_pair()
    {
        player = util::gethostplayer();
        start = undefined;
        
        while ( !isdefined( start ) )
        {
            start = node_get( player );
            
            if ( player buttonpressed( "<dev string:x3fa>" ) )
            {
                level notify( #"draw_pathnode_stop" );
                return undefined;
            }
        }
        
        level thread draw_pathnode_think( start, ( 0, 1, 0 ) );
        
        while ( player buttonpressed( "<dev string:x3ef>" ) )
        {
            waitframe( 1 );
        }
        
        end = undefined;
        
        while ( !isdefined( end ) )
        {
            end = node_get( player );
            
            if ( player buttonpressed( "<dev string:x3fa>" ) )
            {
                level notify( #"draw_pathnode_stop" );
                return undefined;
            }
        }
        
        level thread draw_pathnode_think( end, ( 0, 1, 0 ) );
        level thread draw_pathnodes_stop();
        array = [];
        array[ 0 ] = start;
        array[ 1 ] = end;
        return array;
    }

    // Namespace dev/dev_shared
    // Params 2
    // Checksum 0xdfd4b232, Offset: 0x30d8
    // Size: 0x54, Type: dev
    function draw_point( origin, color )
    {
        if ( !isdefined( color ) )
        {
            color = ( 1, 0, 1 );
        }
        
        sphere( origin, 16, color, 0.25, 0, 16, 1 );
    }

    // Namespace dev/dev_shared
    // Params 1
    // Checksum 0x97abd4a0, Offset: 0x3138
    // Size: 0xa0, Type: dev
    function point_get( player )
    {
        for ( ;; )
        {
            waitframe( 1 );
            origin = get_lookat_origin( player );
            
            if ( player buttonpressed( "<dev string:x3ef>" ) )
            {
                return origin;
            }
            else if ( player buttonpressed( "<dev string:x3fa>" ) )
            {
                return undefined;
            }
            
            draw_point( origin, ( 1, 0, 1 ) );
        }
    }

    // Namespace dev/dev_shared
    // Params 0
    // Checksum 0x782a7195, Offset: 0x31e0
    // Size: 0xfc, Type: dev
    function dev_get_point_pair()
    {
        player = util::gethostplayer();
        start = undefined;
        points = [];
        
        while ( !isdefined( start ) )
        {
            start = point_get( player );
            
            if ( !isdefined( start ) )
            {
                return points;
            }
        }
        
        while ( player buttonpressed( "<dev string:x3ef>" ) )
        {
            waitframe( 1 );
        }
        
        end = undefined;
        
        while ( !isdefined( end ) )
        {
            end = point_get( player );
            
            if ( !isdefined( end ) )
            {
                return points;
            }
        }
        
        points[ 0 ] = start;
        points[ 1 ] = end;
        return points;
    }

#/
