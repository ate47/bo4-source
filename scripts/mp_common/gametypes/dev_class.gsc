#using scripts\core_common\util_shared;
#using scripts\mp_common\gametypes\dev;

#namespace dev_class;

/#

    // Namespace dev_class/dev_class
    // Params 0
    // Checksum 0xce9f9e88, Offset: 0x78
    // Size: 0x888, Type: dev
    function dev_cac_init()
    {
        dev_cac_overlay = 0;
        dev_cac_camera_on = 0;
        level thread dev_cac_gdt_update_think();
        var_b7b0fdc0 = getdvarint( #"hash_158f81eb73a459bd", 0 );
        
        for ( var_1db243f1 = getdvarint( #"hash_729117f20b736ab4", 0 );  ; var_1db243f1 = deathfxindex )
        {
            wait 0.5;
            reset = 1;
            
            if ( getdvarstring( #"scr_disable_cac_2" ) != "<dev string:x38>" )
            {
                continue;
            }
            
            host = util::gethostplayer();
            
            if ( !isdefined( level.dev_cac_player ) )
            {
                level.dev_cac_player = host;
            }
            
            switch ( getdvarstring( #"devgui_dev_cac" ) )
            {
                case 0:
                    reset = 0;
                    break;
                case #"dpad_body":
                    host thread dev_cac_dpad_think( "<dev string:x3b>", &dev_cac_cycle_body, "<dev string:x38>" );
                    break;
                case #"dpad_head":
                    host thread dev_cac_dpad_think( "<dev string:x42>", &dev_cac_cycle_head, "<dev string:x38>" );
                    break;
                case #"dpad_character":
                    host thread dev_cac_dpad_think( "<dev string:x49>", &dev_cac_cycle_character, "<dev string:x38>" );
                    break;
                case #"next_player":
                    dev_cac_cycle_player( 1 );
                    break;
                case #"prev_player":
                    dev_cac_cycle_player( 0 );
                    break;
                case #"cac_overlay":
                    level notify( #"dev_cac_overlay_think" );
                    
                    if ( !dev_cac_overlay )
                    {
                        level thread dev_cac_overlay_think();
                    }
                    
                    dev_cac_overlay = !dev_cac_overlay;
                    break;
                case #"best_bullet_armor":
                    dev_cac_set_model_range( &sort_greatest, "<dev string:x55>" );
                    break;
                case #"worst_bullet_armor":
                    dev_cac_set_model_range( &sort_least, "<dev string:x55>" );
                    break;
                case #"best_explosive_armor":
                    dev_cac_set_model_range( &sort_greatest, "<dev string:x64>" );
                    break;
                case #"worst_explosive_armor":
                    dev_cac_set_model_range( &sort_least, "<dev string:x64>" );
                    break;
                case #"best_mobility":
                    dev_cac_set_model_range( &sort_greatest, "<dev string:x76>" );
                    break;
                case #"worst_mobility":
                    dev_cac_set_model_range( &sort_least, "<dev string:x76>" );
                    break;
                case #"camera":
                    dev_cac_camera_on = !dev_cac_camera_on;
                    dev_cac_camera( dev_cac_camera_on );
                    break;
                case #"dpad_camo":
                    host thread dev_cac_dpad_think( "<dev string:x81>", &dev_cac_cycle_render_options, "<dev string:x81>" );
                    break;
                case #"dpad_meleecamo":
                    host thread dev_cac_dpad_think( "<dev string:x88>", &dev_cac_cycle_render_options, "<dev string:x88>" );
                    break;
                case #"dpad_lens":
                    host thread dev_cac_dpad_think( "<dev string:x94>", &dev_cac_cycle_render_options, "<dev string:x94>" );
                    break;
                case #"dpad_reticle":
                    host thread dev_cac_dpad_think( "<dev string:x9b>", &dev_cac_cycle_render_options, "<dev string:x9b>" );
                    break;
                case #"hash_70b765122950a76":
                    host thread dev_cac_dpad_think( "<dev string:xa5>", &dev_cac_cycle_render_options, "<dev string:xa5>" );
                    break;
                case #"dpad_reticle_color":
                    host thread dev_cac_dpad_think( "<dev string:xb7>", &dev_cac_cycle_render_options, "<dev string:xc7>" );
                    break;
                case #"dpad_emblem":
                    host thread dev_cac_dpad_think( "<dev string:xd7>", &dev_cac_cycle_render_options, "<dev string:xd7>" );
                    break;
                case #"dpad_tag":
                    host thread dev_cac_dpad_think( "<dev string:xe0>", &dev_cac_cycle_render_options, "<dev string:xe0>" );
                    break;
                case #"dpad_facepaint_pattern":
                    host thread dev_cac_dpad_think( "<dev string:xe6>", &dev_cac_cycle_render_options, "<dev string:xfa>" );
                    break;
                case #"dpad_facepaint_color":
                    host thread dev_cac_dpad_think( "<dev string:x10e>", &dev_cac_cycle_render_options, "<dev string:x120>" );
                    break;
                case #"dpad_reset":
                    host notify( #"dev_cac_dpad_think" );
                    break;
            }
            
            if ( reset )
            {
                setdvar( #"devgui_dev_cac", "<dev string:x38>" );
            }
            
            charmindex = getdvarint( #"hash_158f81eb73a459bd", 0 );
            
            if ( var_b7b0fdc0 != charmindex )
            {
                host function_3fb8b14( host getcurrentweapon(), charmindex );
            }
            
            var_b7b0fdc0 = charmindex;
            deathfxindex = getdvarint( #"hash_729117f20b736ab4", 0 );
            
            if ( var_1db243f1 != deathfxindex )
            {
                host function_a85d2581( host getcurrentweapon(), deathfxindex );
            }
        }
    }

    // Namespace dev_class/dev_class
    // Params 1
    // Checksum 0xe759aa80, Offset: 0x908
    // Size: 0x104, Type: dev
    function dev_cac_camera( on )
    {
        if ( on )
        {
            self setclientthirdperson( 1 );
            setdvar( #"cg_thirdpersonangle", 185 );
            setdvar( #"cg_thirdpersonrange", 138 );
            setdvar( #"cg_fov", 20 );
            return;
        }
        
        self setclientthirdperson( 0 );
        setdvar( #"cg_fov", getdvarstring( #"cg_fov_default" ) );
    }

    // Namespace dev_class/dev_class
    // Params 3
    // Checksum 0x9cae58ca, Offset: 0xa18
    // Size: 0x20e, Type: dev
    function dev_cac_dpad_think( part_name, cycle_function, tag )
    {
        self notify( #"dev_cac_dpad_think" );
        self endon( #"dev_cac_dpad_think", #"disconnect" );
        iprintln( "<dev string:x132>" + part_name + "<dev string:x13e>" );
        iprintln( "<dev string:x155>" + part_name + "<dev string:x15d>" );
        dpad_left = 0;
        dpad_right = 0;
        level.dev_cac_player thread highlight_player();
        
        for ( ;; )
        {
            self setactionslot( 3, "<dev string:x38>" );
            self setactionslot( 4, "<dev string:x38>" );
            
            if ( !dpad_left && self buttonpressed( "<dev string:x175>" ) )
            {
                [[ cycle_function ]]( 0, tag );
                dpad_left = 1;
            }
            else if ( !self buttonpressed( "<dev string:x175>" ) )
            {
                dpad_left = 0;
            }
            
            if ( !dpad_right && self buttonpressed( "<dev string:x181>" ) )
            {
                [[ cycle_function ]]( 1, tag );
                dpad_right = 1;
            }
            else if ( !self buttonpressed( "<dev string:x181>" ) )
            {
                dpad_right = 0;
            }
            
            waitframe( 1 );
        }
    }

    // Namespace dev_class/dev_class
    // Params 2
    // Checksum 0x63ce20f0, Offset: 0xc30
    // Size: 0xa8, Type: dev
    function next_in_list( value, list )
    {
        if ( !isdefined( value ) )
        {
            return list[ 0 ];
        }
        
        for ( i = 0; i < list.size ; i++ )
        {
            if ( value == list[ i ] )
            {
                if ( isdefined( list[ i + 1 ] ) )
                {
                    value = list[ i + 1 ];
                }
                else
                {
                    value = list[ 0 ];
                }
                
                break;
            }
        }
        
        return value;
    }

    // Namespace dev_class/dev_class
    // Params 2
    // Checksum 0x93f8519f, Offset: 0xce0
    // Size: 0xb2, Type: dev
    function prev_in_list( value, list )
    {
        if ( !isdefined( value ) )
        {
            return list[ 0 ];
        }
        
        for ( i = 0; i < list.size ; i++ )
        {
            if ( value == list[ i ] )
            {
                if ( isdefined( list[ i - 1 ] ) )
                {
                    value = list[ i - 1 ];
                }
                else
                {
                    value = list[ list.size - 1 ];
                }
                
                break;
            }
        }
        
        return value;
    }

    // Namespace dev_class/dev_class
    // Params 0
    // Checksum 0xffb21abb, Offset: 0xda0
    // Size: 0x1a, Type: dev
    function dev_cac_set_player_model()
    {
        self.tag_stowed_back = undefined;
        self.tag_stowed_hip = undefined;
    }

    // Namespace dev_class/dev_class
    // Params 2
    // Checksum 0x96d9e841, Offset: 0xdc8
    // Size: 0xec, Type: dev
    function dev_cac_cycle_body( forward, tag )
    {
        if ( !dev_cac_player_valid() )
        {
            return;
        }
        
        player = level.dev_cac_player;
        keys = getarraykeys( level.cac_functions[ #"set_body_model" ] );
        
        if ( forward )
        {
            player.cac_body_type = next_in_list( player.cac_body_type, keys );
        }
        else
        {
            player.cac_body_type = prev_in_list( player.cac_body_type, keys );
        }
        
        player dev_cac_set_player_model();
    }

    // Namespace dev_class/dev_class
    // Params 2
    // Checksum 0x9592723e, Offset: 0xec0
    // Size: 0xfc, Type: dev
    function dev_cac_cycle_head( forward, tag )
    {
        if ( !dev_cac_player_valid() )
        {
            return;
        }
        
        player = level.dev_cac_player;
        keys = getarraykeys( level.cac_functions[ #"set_head_model" ] );
        
        if ( forward )
        {
            player.cac_head_type = next_in_list( player.cac_head_type, keys );
        }
        else
        {
            player.cac_head_type = prev_in_list( player.cac_head_type, keys );
        }
        
        player.cac_hat_type = "<dev string:x18e>";
        player dev_cac_set_player_model();
    }

    // Namespace dev_class/dev_class
    // Params 2
    // Checksum 0x83dabd82, Offset: 0xfc8
    // Size: 0xfc, Type: dev
    function dev_cac_cycle_character( forward, tag )
    {
        if ( !dev_cac_player_valid() )
        {
            return;
        }
        
        player = level.dev_cac_player;
        keys = getarraykeys( level.cac_functions[ #"set_body_model" ] );
        
        if ( forward )
        {
            player.cac_body_type = next_in_list( player.cac_body_type, keys );
        }
        else
        {
            player.cac_body_type = prev_in_list( player.cac_body_type, keys );
        }
        
        player.cac_hat_type = "<dev string:x18e>";
        player dev_cac_set_player_model();
    }

    // Namespace dev_class/dev_class
    // Params 3
    // Checksum 0x32deaede, Offset: 0x10d0
    // Size: 0x5c, Type: dev
    function dev_cac_cycle_render_options( forward, tag, count )
    {
        if ( !dev_cac_player_valid() )
        {
            return;
        }
        
        level.dev_cac_player nextplayerrenderoption( tag, forward, count );
    }

    // Namespace dev_class/dev_class
    // Params 0
    // Checksum 0xb801a453, Offset: 0x1138
    // Size: 0x38, Type: dev
    function dev_cac_player_valid()
    {
        return isdefined( level.dev_cac_player ) && level.dev_cac_player.sessionstate == "<dev string:x195>";
    }

    // Namespace dev_class/dev_class
    // Params 1
    // Checksum 0x4476a902, Offset: 0x1178
    // Size: 0xea, Type: dev
    function dev_cac_cycle_player( forward )
    {
        players = getplayers();
        
        for ( i = 0; i < players.size ; i++ )
        {
            if ( forward )
            {
                level.dev_cac_player = next_in_list( level.dev_cac_player, players );
            }
            else
            {
                level.dev_cac_player = prev_in_list( level.dev_cac_player, players );
            }
            
            if ( dev_cac_player_valid() )
            {
                level.dev_cac_player thread highlight_player();
                return;
            }
        }
        
        level.dev_cac_player = undefined;
    }

    // Namespace dev_class/dev_class
    // Params 0
    // Checksum 0x2758f316, Offset: 0x1270
    // Size: 0x44, Type: dev
    function highlight_player()
    {
        self sethighlighted( 1 );
        wait 1;
        self sethighlighted( 0 );
    }

    // Namespace dev_class/dev_class
    // Params 0
    // Checksum 0xac6a7728, Offset: 0x12c0
    // Size: 0x6c, Type: dev
    function dev_cac_overlay_think()
    {
        hud = dev_cac_overlay_create();
        level thread dev_cac_overlay_update( hud );
        level waittill( #"dev_cac_overlay_think" );
        dev_cac_overlay_destroy( hud );
    }

    // Namespace dev_class/dev_class
    // Params 1
    // Checksum 0x79ba825, Offset: 0x1338
    // Size: 0x10, Type: dev
    function dev_cac_overlay_update( hud )
    {
        
    }

    // Namespace dev_class/dev_class
    // Params 1
    // Checksum 0x479ecd34, Offset: 0x1350
    // Size: 0x94, Type: dev
    function dev_cac_overlay_destroy( hud )
    {
        for ( i = 0; i < hud.menu.size ; i++ )
        {
            hud.menu[ i ] destroy();
        }
        
        hud destroy();
        setdvar( #"player_debugsprint", 0 );
    }

    // Namespace dev_class/dev_class
    // Params 0
    // Checksum 0x2eae74c9, Offset: 0x13f0
    // Size: 0xd74, Type: dev
    function dev_cac_overlay_create()
    {
        x = -80;
        y = 140;
        menu_name = "<dev string:x19f>";
        hud = dev::new_hud( menu_name, undefined, x, y, 1 );
        hud setshader( #"white", 185, 285 );
        hud.alignx = "<dev string:x1af>";
        hud.aligny = "<dev string:x1b6>";
        hud.sort = 10;
        hud.alpha = 0.6;
        hud.color = ( 0, 0, 0.5 );
        x_offset = 100;
        hud.menu[ 0 ] = dev::new_hud( menu_name, "<dev string:x1bc>", x + 5, y + 10, 1.3 );
        hud.menu[ 1 ] = dev::new_hud( menu_name, "<dev string:x1c3>", x + 5, y + 25, 1 );
        hud.menu[ 2 ] = dev::new_hud( menu_name, "<dev string:x1cc>", x + 5, y + 35, 1 );
        hud.menu[ 3 ] = dev::new_hud( menu_name, "<dev string:x1d6>", x + 5, y + 45, 1 );
        hud.menu[ 4 ] = dev::new_hud( menu_name, "<dev string:x1e0>", x + 5, y + 55, 1 );
        hud.menu[ 5 ] = dev::new_hud( menu_name, "<dev string:x1ef>", x + 5, y + 70, 1 );
        hud.menu[ 6 ] = dev::new_hud( menu_name, "<dev string:x1cc>", x + 5, y + 80, 1 );
        hud.menu[ 7 ] = dev::new_hud( menu_name, "<dev string:x1e0>", x + 5, y + 90, 1 );
        hud.menu[ 8 ] = dev::new_hud( menu_name, "<dev string:x1fa>", x + 5, y + 100, 1 );
        hud.menu[ 9 ] = dev::new_hud( menu_name, "<dev string:x20b>", x + 5, y + 110, 1 );
        hud.menu[ 10 ] = dev::new_hud( menu_name, "<dev string:x220>", x + 5, y + 120, 1 );
        hud.menu[ 11 ] = dev::new_hud( menu_name, "<dev string:x235>", x + 5, y + 135, 1 );
        hud.menu[ 12 ] = dev::new_hud( menu_name, "<dev string:x1cc>", x + 5, y + 145, 1 );
        hud.menu[ 13 ] = dev::new_hud( menu_name, "<dev string:x1e0>", x + 5, y + 155, 1 );
        hud.menu[ 14 ] = dev::new_hud( menu_name, "<dev string:x246>", x + 5, y + 170, 1 );
        hud.menu[ 15 ] = dev::new_hud( menu_name, "<dev string:x1cc>", x + 5, y + 180, 1 );
        hud.menu[ 16 ] = dev::new_hud( menu_name, "<dev string:x1e0>", x + 5, y + 190, 1 );
        hud.menu[ 17 ] = dev::new_hud( menu_name, "<dev string:x25a>", x + 5, y + 205, 1 );
        hud.menu[ 18 ] = dev::new_hud( menu_name, "<dev string:x263>", x + 5, y + 215, 1 );
        hud.menu[ 19 ] = dev::new_hud( menu_name, "<dev string:x26d>", x + 5, y + 225, 1 );
        hud.menu[ 20 ] = dev::new_hud( menu_name, "<dev string:x27b>", x + 5, y + 235, 1 );
        hud.menu[ 21 ] = dev::new_hud( menu_name, "<dev string:x286>", x + 5, y + 245, 1 );
        hud.menu[ 22 ] = dev::new_hud( menu_name, "<dev string:x295>", x + 5, y + 255, 1 );
        hud.menu[ 23 ] = dev::new_hud( menu_name, "<dev string:x2a3>", x + 5, y + 265, 1 );
        hud.menu[ 24 ] = dev::new_hud( menu_name, "<dev string:x2af>", x + 5, y + 275, 1 );
        x_offset = 65;
        hud.menu[ 25 ] = dev::new_hud( menu_name, "<dev string:x38>", x + x_offset, y + 35, 1 );
        hud.menu[ 26 ] = dev::new_hud( menu_name, "<dev string:x38>", x + x_offset, y + 45, 1 );
        hud.menu[ 27 ] = dev::new_hud( menu_name, "<dev string:x38>", x + x_offset, y + 55, 1 );
        x_offset = 100;
        hud.menu[ 28 ] = dev::new_hud( menu_name, "<dev string:x38>", x + x_offset, y + 80, 1 );
        hud.menu[ 29 ] = dev::new_hud( menu_name, "<dev string:x38>", x + x_offset, y + 90, 1 );
        hud.menu[ 30 ] = dev::new_hud( menu_name, "<dev string:x38>", x + x_offset, y + 100, 1 );
        hud.menu[ 31 ] = dev::new_hud( menu_name, "<dev string:x38>", x + x_offset, y + 110, 1 );
        hud.menu[ 32 ] = dev::new_hud( menu_name, "<dev string:x38>", x + x_offset, y + 120, 1 );
        hud.menu[ 33 ] = dev::new_hud( menu_name, "<dev string:x38>", x + x_offset, y + 145, 1 );
        hud.menu[ 34 ] = dev::new_hud( menu_name, "<dev string:x38>", x + x_offset, y + 155, 1 );
        hud.menu[ 35 ] = dev::new_hud( menu_name, "<dev string:x38>", x + x_offset, y + 180, 1 );
        hud.menu[ 36 ] = dev::new_hud( menu_name, "<dev string:x38>", x + x_offset, y + 190, 1 );
        x_offset = 65;
        hud.menu[ 37 ] = dev::new_hud( menu_name, "<dev string:x38>", x + x_offset, y + 215, 1 );
        hud.menu[ 38 ] = dev::new_hud( menu_name, "<dev string:x38>", x + x_offset, y + 225, 1 );
        hud.menu[ 39 ] = dev::new_hud( menu_name, "<dev string:x38>", x + x_offset, y + 235, 1 );
        hud.menu[ 40 ] = dev::new_hud( menu_name, "<dev string:x38>", x + x_offset, y + 245, 1 );
        hud.menu[ 41 ] = dev::new_hud( menu_name, "<dev string:x38>", x + x_offset, y + 255, 1 );
        hud.menu[ 42 ] = dev::new_hud( menu_name, "<dev string:x38>", x + x_offset, y + 265, 1 );
        hud.menu[ 43 ] = dev::new_hud( menu_name, "<dev string:x38>", x + x_offset, y + 275, 1 );
        return hud;
    }

    // Namespace dev_class/dev_class
    // Params 1
    // Checksum 0x6e8bec05, Offset: 0x2170
    // Size: 0x98, Type: dev
    function color( value )
    {
        r = 1;
        g = 1;
        b = 0;
        color = ( 0, 0, 0 );
        
        if ( value > 0 )
        {
            r -= value;
        }
        else
        {
            g += value;
        }
        
        c = ( r, g, b );
        return c;
    }

    // Namespace dev_class/dev_class
    // Params 0
    // Checksum 0xd34a8b87, Offset: 0x2210
    // Size: 0x1f8, Type: dev
    function dev_cac_gdt_update_think()
    {
        for ( ;; )
        {
            waitresult = level waittill( #"gdt_update" );
            asset = waitresult.asset;
            keyvalue = waitresult.keyvalue;
            keyvalue = strtok( keyvalue, "<dev string:x2ba>" );
            key = keyvalue[ 0 ];
            
            switch ( key )
            {
                case #"armorbullet":
                    key = "<dev string:x55>";
                    break;
                case #"armorexplosive":
                    key = "<dev string:x64>";
                    break;
                case #"movespeed":
                    key = "<dev string:x76>";
                    break;
                case #"sprinttimetotal":
                    key = "<dev string:x2be>";
                    break;
                case #"sprinttimecooldown":
                    key = "<dev string:x2d2>";
                    break;
                default:
                    key = undefined;
                    break;
            }
            
            if ( !isdefined( key ) )
            {
                continue;
            }
            
            value = float( keyvalue[ 1 ] );
            level.cac_attributes[ key ][ asset ] = value;
            players = getplayers();
            
            for ( i = 0; i < players.size ; i++ )
            {
            }
        }
    }

    // Namespace dev_class/dev_class
    // Params 3
    // Checksum 0x806bce3, Offset: 0x2410
    // Size: 0xc8, Type: dev
    function sort_greatest( func, attribute, greatest )
    {
        keys = getarraykeys( level.cac_functions[ func ] );
        greatest = keys[ 0 ];
        
        for ( i = 0; i < keys.size ; i++ )
        {
            if ( level.cac_attributes[ attribute ][ keys[ i ] ] > level.cac_attributes[ attribute ][ greatest ] )
            {
                greatest = keys[ i ];
            }
        }
        
        return greatest;
    }

    // Namespace dev_class/dev_class
    // Params 3
    // Checksum 0xdf4add37, Offset: 0x24e0
    // Size: 0xc8, Type: dev
    function sort_least( func, attribute, least )
    {
        keys = getarraykeys( level.cac_functions[ func ] );
        least = keys[ 0 ];
        
        for ( i = 0; i < keys.size ; i++ )
        {
            if ( level.cac_attributes[ attribute ][ keys[ i ] ] < level.cac_attributes[ attribute ][ least ] )
            {
                least = keys[ i ];
            }
        }
        
        return least;
    }

    // Namespace dev_class/dev_class
    // Params 2
    // Checksum 0x5b74ba79, Offset: 0x25b0
    // Size: 0xbc, Type: dev
    function dev_cac_set_model_range( sort_function, attribute )
    {
        if ( !dev_cac_player_valid() )
        {
            return;
        }
        
        player = level.dev_cac_player;
        player.cac_body_type = [[ sort_function ]]( "<dev string:x2e9>", attribute );
        player.cac_head_type = [[ sort_function ]]( "<dev string:x2fa>", attribute );
        player.cac_hat_type = [[ sort_function ]]( "<dev string:x30b>", attribute );
        player dev_cac_set_player_model();
    }

#/
