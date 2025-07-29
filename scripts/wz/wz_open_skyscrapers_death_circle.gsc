#using script_71e26f08f03b7a7a;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\compass;
#using scripts\core_common\death_circle;
#using scripts\core_common\flag_shared;
#using scripts\core_common\map;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;
#using scripts\core_common\values_shared;
#using scripts\mp_common\load;

#namespace wz_open_skyscrapers_death_circle;

// Namespace wz_open_skyscrapers_death_circle/wz_open_skyscrapers_death_circle
// Params 0
// Checksum 0x9f129962, Offset: 0x2d0
// Size: 0x6cc
function function_6f6f5189()
{
    death_circle::init();
    
    if ( isarray( level.deathcircles ) && level.deathcircles.size > 0 )
    {
        finalcircle = level.deathcircles[ level.deathcircles.size - 1 ];
        level.var_5c8bbb85 = finalcircle.var_3b9f4abf;
        level.var_6d8a1d51 = finalcircle.mapwidth;
        level.var_2a9f2129 = finalcircle.mapheight;
        level.var_398d38ce = finalcircle.radius;
        
        if ( !isdefined( level.var_6f535d7f ) )
        {
            function_731497bb();
        }
        
        if ( isdefined( level.var_6f535d7f ) && level.var_6f535d7f.size > 0 )
        {
            function_c213f1b5( level.var_6f535d7f );
        }
        
        /#
            var_6b4cdf43 = getdvarint( #"hash_51e0c04607235f5f", 0 );
            
            if ( var_6b4cdf43 != 0 && level.deathcircles.size > 0 )
            {
                function_9d313516( var_6b4cdf43 );
            }
        #/
        
        if ( ( isdefined( getgametypesetting( #"hash_453cdf8a6bd610d7" ) ) ? getgametypesetting( #"hash_453cdf8a6bd610d7" ) : 0 ) && isdefined( level.var_a6a3e12a ) )
        {
            function_320393b9();
        }
        
        finalcircle.var_3b9f4abf = level.var_5c8bbb85;
        finalcircle.mapwidth = level.var_6d8a1d51;
        finalcircle.mapheight = level.var_2a9f2129;
    }
    
    if ( util::get_game_type() == "warzone_dbno" || util::get_game_type() == "warzone_hot_pursuit" || util::get_game_type() == "warzone_pandemic_quad" )
    {
        level thread namespace_3d2704b3::start( array( 5, 4, 4, 4 ), 20, array( 60, 45, 20 ) );
        
        if ( isdefined( getgametypesetting( #"hash_6eb44149a8ac6dd1" ) ) ? getgametypesetting( #"hash_6eb44149a8ac6dd1" ) : 0 )
        {
            level thread namespace_3d2704b3::start_vehicle( array( #"veh_suv_player_police_wz", #"veh_quad_player_wz_police", #"veh_muscle_car_convertible_player_wz_blk" ), array( 0, 4, 4, 4 ), 10, array( 40, 30, 15 ) );
        }
    }
    else if ( util::get_game_type() == "warzone_heavy_metal_heroes" )
    {
        level thread namespace_3d2704b3::start( array( 4, 4, 3, 3, 0 ), 20, array( 60, 45, 20 ) );
        
        if ( isdefined( getgametypesetting( #"hash_6eb44149a8ac6dd1" ) ) ? getgametypesetting( #"hash_6eb44149a8ac6dd1" ) : 0 )
        {
            level thread namespace_3d2704b3::start_vehicle( array( #"vehicle_t8_mil_tank_wz_black", #"vehicle_t8_mil_tank_wz_green", #"vehicle_t8_mil_tank_wz_grey", #"vehicle_t8_mil_tank_wz_tan" ), array( 2, 2, 2, 2, 2 ), 10, array( 40, 30, 15 ) );
        }
    }
    else if ( util::get_game_type() == #"warzone_bigteam_quad" || util::get_game_type() == #"warzone_bigteam_dbno_quad" )
    {
        level thread namespace_3d2704b3::start( array( 2, 2, 2, 2 ), 20, array( 45, 20, 20 ) );
    }
    else
    {
        level thread namespace_3d2704b3::start( 4, 20, array( 60, 45, 20 ) );
    }
    
    if ( ( isdefined( getgametypesetting( #"wzhardcore" ) ) ? getgametypesetting( #"wzhardcore" ) : 0 ) || util::get_game_type() == "warzone_pandemic_quad" )
    {
        level thread namespace_3d2704b3::start_flare( 6 );
    }
}

// Namespace wz_open_skyscrapers_death_circle/wz_open_skyscrapers_death_circle
// Params 0
// Checksum 0xa27d752, Offset: 0x9a8
// Size: 0x914
function function_731497bb()
{
    level.var_6f535d7f = [];
    i = 0;
    
    if ( isdefined( getgametypesetting( #"hash_2e8be75aaeb34d13" ) ) ? getgametypesetting( #"hash_2e8be75aaeb34d13" ) : 0 )
    {
        level.var_6f535d7f[ i ] = #"open_areas";
        i += 1;
    }
    
    if ( isdefined( getgametypesetting( #"hash_418601236eb2ed88" ) ) ? getgametypesetting( #"hash_418601236eb2ed88" ) : 0 )
    {
        level.var_6f535d7f[ i ] = "array_final_circle";
        i += 1;
    }
    
    if ( isdefined( getgametypesetting( #"hash_4297c2e4ff31ffd0" ) ) ? getgametypesetting( #"hash_4297c2e4ff31ffd0" ) : 0 )
    {
        level.var_6f535d7f[ i ] = "asylum_final_circle";
        i += 1;
    }
    
    if ( isdefined( getgametypesetting( #"hash_5ea3cb15587cb277" ) ) ? getgametypesetting( #"hash_5ea3cb15587cb277" ) : 0 )
    {
        level.var_6f535d7f[ i ] = "boxing_gym_final_circle";
        i += 1;
    }
    
    if ( isdefined( getgametypesetting( #"hash_631e99de856ff41c" ) ) ? getgametypesetting( #"hash_631e99de856ff41c" ) : 0 )
    {
        level.var_6f535d7f[ i ] = "clearing_final_circle";
        i += 1;
    }
    
    if ( isdefined( getgametypesetting( #"hash_5c4b6e44d8ccc5aa" ) ) ? getgametypesetting( #"hash_5c4b6e44d8ccc5aa" ) : 0 )
    {
        level.var_6f535d7f[ i ] = "construction_final_circle";
        i += 1;
    }
    
    if ( isdefined( getgametypesetting( #"hash_63adbcc59d938119" ) ) ? getgametypesetting( #"hash_63adbcc59d938119" ) : 0 )
    {
        level.var_6f535d7f[ i ] = "diner_final_circle";
        i += 1;
    }
    
    if ( isdefined( getgametypesetting( #"hash_664db8b87ce69945" ) ) ? getgametypesetting( #"hash_664db8b87ce69945" ) : 0 )
    {
        level.var_6f535d7f[ i ] = "docks_final_circle";
        i += 1;
    }
    
    if ( isdefined( getgametypesetting( #"hash_4bf33add6108efdc" ) ) ? getgametypesetting( #"hash_4bf33add6108efdc" ) : 0 )
    {
        level.var_6f535d7f[ i ] = "estates_final_circle";
        i += 1;
    }
    
    if ( isdefined( getgametypesetting( #"hash_7de6d9552df081ff" ) ) ? getgametypesetting( #"hash_7de6d9552df081ff" ) : 0 )
    {
        level.var_6f535d7f[ i ] = "factory_final_circle";
        i += 1;
    }
    
    if ( isdefined( getgametypesetting( #"hash_7d6a9fa4f88f659d" ) ) ? getgametypesetting( #"hash_7d6a9fa4f88f659d" ) : 0 )
    {
        level.var_6f535d7f[ i ] = "firing_range_final_circle";
        i += 1;
    }
    
    if ( isdefined( getgametypesetting( #"hash_2d9fdec301de5f90" ) ) ? getgametypesetting( #"hash_2d9fdec301de5f90" ) : 0 )
    {
        level.var_6f535d7f[ i ] = "fracking_final_circle";
        i += 1;
    }
    
    if ( isdefined( getgametypesetting( #"hash_bcd95788af03810" ) ) ? getgametypesetting( #"hash_bcd95788af03810" ) : 0 )
    {
        level.var_6f535d7f[ i ] = "graveyard_final_circle";
        i += 1;
    }
    
    if ( isdefined( getgametypesetting( #"hash_14ae69b26e41df2a" ) ) ? getgametypesetting( #"hash_14ae69b26e41df2a" ) : 0 )
    {
        level.var_6f535d7f[ i ] = "hijacked_final_circle";
        i += 1;
    }
    
    if ( isdefined( getgametypesetting( #"hash_3aa0d0e28c1f837" ) ) ? getgametypesetting( #"hash_3aa0d0e28c1f837" ) : 0 )
    {
        level.var_6f535d7f[ i ] = "hydro_final_circle";
        i += 1;
    }
    
    if ( isdefined( getgametypesetting( #"hash_52e1e26442d1fbc3" ) ) ? getgametypesetting( #"hash_52e1e26442d1fbc3" ) : 0 )
    {
        level.var_6f535d7f[ i ] = "lighthouse_final_circle";
        i += 1;
    }
    
    if ( isdefined( getgametypesetting( #"hash_6110c70d45bde13e" ) ) ? getgametypesetting( #"hash_6110c70d45bde13e" ) : 0 )
    {
        level.var_6f535d7f[ i ] = "nuketown_island_final_circle";
        i += 1;
    }
    
    if ( isdefined( getgametypesetting( #"hash_15a720f5ee3c1492" ) ) ? getgametypesetting( #"hash_15a720f5ee3c1492" ) : 0 )
    {
        level.var_6f535d7f[ i ] = "turbine_final_circle";
        i += 1;
    }
    
    if ( isdefined( getgametypesetting( #"hash_41ac3c30d0114266" ) ) ? getgametypesetting( #"hash_41ac3c30d0114266" ) : 0 )
    {
        level.var_6f535d7f[ i ] = "ghost_town_final_circle";
        i += 1;
    }
}

// Namespace wz_open_skyscrapers_death_circle/wz_open_skyscrapers_death_circle
// Params 1
// Checksum 0xe3e86365, Offset: 0x12c8
// Size: 0x242
function function_c213f1b5( var_31c68e48 )
{
    var_2f43eb3d = var_31c68e48.size;
    
    if ( var_2f43eb3d <= 0 )
    {
        return;
    }
    
    rand = randomintrange( 0, var_2f43eb3d );
    var_e4204b3 = var_31c68e48[ rand ];
    
    if ( !isdefined( var_e4204b3 ) )
    {
        println( "<dev string:x38>" );
        return;
    }
    
    switch ( var_e4204b3 )
    {
        case #"open_areas":
            function_fdabbb8a();
            break;
        case #"boxing_gym_final_circle":
        case #"turbine_final_circle":
        case #"construction_final_circle":
        case #"array_final_circle":
        case #"fracking_final_circle":
        case #"asylum_final_circle":
        case #"estates_final_circle":
        case #"firing_range_final_circle":
        case #"lighthouse_final_circle":
        case #"hydro_final_circle":
        case #"ghost_town_final_circle":
        case #"diner_final_circle":
        case #"factory_final_circle":
        case #"nuketown_island_final_circle":
        case #"clearing_final_circle":
        case #"docks_final_circle":
        case #"hijacked_final_circle":
        case #"graveyard_final_circle":
            function_69e60a10( var_e4204b3 );
            break;
        default:
            println( "<dev string:x69>" + var_e4204b3 + "<dev string:x88>" );
            break;
    }
}

// Namespace wz_open_skyscrapers_death_circle/wz_open_skyscrapers_death_circle
// Params 1
// Checksum 0xe59d7560, Offset: 0x1518
// Size: 0x40a
function function_9d313516( var_6b4cdf43 )
{
    switch ( var_6b4cdf43 )
    {
        case 0:
            break;
        case 1:
            level.var_5c8bbb85 = ( 29566, 24509, 0 );
            level.var_2a9f2129 = 57527;
            level.var_6d8a1d51 = 56045;
            break;
        case 2:
            level.var_5c8bbb85 = ( -29567, 24509, 0 );
            level.var_2a9f2129 = 57527;
            level.var_6d8a1d51 = 56045;
            break;
        case 3:
            level.var_5c8bbb85 = ( 29566, -33018, 0 );
            level.var_2a9f2129 = 57527;
            level.var_6d8a1d51 = 56045;
            break;
        case 4:
            level.var_5c8bbb85 = ( -29567, -33018, 0 );
            level.var_2a9f2129 = 57527;
            level.var_6d8a1d51 = 56045;
            break;
        case 5:
            level.var_5c8bbb85 = ( 29566, -4254, 0 );
            level.var_2a9f2129 = 115055;
            level.var_6d8a1d51 = 56045;
            break;
        case 6:
            level.var_5c8bbb85 = ( -29567, -4254, 0 );
            level.var_2a9f2129 = 115055;
            level.var_6d8a1d51 = 56045;
            break;
        case 7:
            level.var_5c8bbb85 = ( -1544, -33018, 0 );
            level.var_2a9f2129 = 57527;
            level.var_6d8a1d51 = 112090;
            break;
        case 8:
            level.var_5c8bbb85 = ( -1544, 24509, 0 );
            level.var_2a9f2129 = 57527;
            level.var_6d8a1d51 = 112090;
            break;
        case 9:
            level.var_5c8bbb85 = ( -1544, -4254, 0 );
            level.var_2a9f2129 = 57527;
            level.var_6d8a1d51 = 56045;
            break;
        case 10:
            function_1e92e76c();
            break;
        case 11:
            function_3ac2e00();
            break;
        case 12:
            function_9c000dd6();
            break;
        case 13:
            function_69e60a10( "graveyard_final_circle" );
            break;
        case 14:
            function_69e60a10( "nuketown_island_final_circle" );
            break;
        case 15:
            function_69e60a10( "hijacked_final_circle" );
            break;
        default:
            return;
    }
}

// Namespace wz_open_skyscrapers_death_circle/wz_open_skyscrapers_death_circle
// Params 0
// Checksum 0xe6995565, Offset: 0x1930
// Size: 0x15a
function function_1e92e76c()
{
    location = randomintrange( 1, 7 );
    
    switch ( location )
    {
        case 1:
            function_69e60a10( "hydro_final_circle" );
            break;
        case 2:
            function_69e60a10( "factory_final_circle" );
            break;
        case 3:
            function_69e60a10( "fracking_final_circle" );
            break;
        case 4:
            function_69e60a10( "construction_final_circle" );
            break;
        case 5:
            function_69e60a10( "docks_final_circle" );
            break;
        case 6:
            function_69e60a10( "turbine_final_circle" );
            break;
    }
}

// Namespace wz_open_skyscrapers_death_circle/wz_open_skyscrapers_death_circle
// Params 0
// Checksum 0x83394b63, Offset: 0x1a98
// Size: 0x12a
function function_3ac2e00()
{
    location = randomintrange( 1, 6 );
    
    switch ( location )
    {
        case 1:
            function_69e60a10( "diner_final_circle" );
            break;
        case 2:
            function_69e60a10( "lighthouse_final_circle" );
            break;
        case 3:
            function_69e60a10( "boxing_gym_final_circle" );
            break;
        case 4:
            function_69e60a10( "asylum_final_circle" );
            break;
        case 5:
            function_69e60a10( "graveyard_final_circle" );
            break;
    }
}

// Namespace wz_open_skyscrapers_death_circle/wz_open_skyscrapers_death_circle
// Params 0
// Checksum 0x5c2acaf6, Offset: 0x1bd0
// Size: 0x12a
function function_9c000dd6()
{
    location = randomintrange( 1, 6 );
    
    switch ( location )
    {
        case 1:
            function_69e60a10( "nuketown_island_final_circle" );
            break;
        case 2:
            function_69e60a10( "clearing_final_circle" );
            break;
        case 3:
            function_69e60a10( "array_final_circle" );
            break;
        case 4:
            function_69e60a10( "estates_final_circle" );
            break;
        case 5:
            function_69e60a10( "hijacked_final_circle" );
            break;
    }
}

// Namespace wz_open_skyscrapers_death_circle/wz_open_skyscrapers_death_circle
// Params 1
// Checksum 0x6a275d6b, Offset: 0x1d08
// Size: 0x76
function function_69e60a10( var_e4204b3 )
{
    hint = struct::get( var_e4204b3 );
    level.var_5c8bbb85 = hint.origin;
    level.var_2a9f2129 = hint.height;
    level.var_6d8a1d51 = hint.width;
}

// Namespace wz_open_skyscrapers_death_circle/wz_open_skyscrapers_death_circle
// Params 0
// Checksum 0xc7891f0a, Offset: 0x1d88
// Size: 0x3a
function function_9873bbc3()
{
    level.var_5c8bbb85 = ( 23460, 47303, 0 );
    level.var_2a9f2129 = 6319;
    level.var_6d8a1d51 = 4400;
}

// Namespace wz_open_skyscrapers_death_circle/wz_open_skyscrapers_death_circle
// Params 0
// Checksum 0x2b2d2bcf, Offset: 0x1dd0
// Size: 0x3e
function function_d1fa217c()
{
    level.var_5c8bbb85 = ( 50576, -650, 4890 );
    level.var_2a9f2129 = 15125;
    level.var_6d8a1d51 = 6890;
}

// Namespace wz_open_skyscrapers_death_circle/wz_open_skyscrapers_death_circle
// Params 0
// Checksum 0x457ee2fb, Offset: 0x1e18
// Size: 0x3e
function function_1129bcc8()
{
    level.var_5c8bbb85 = ( 4994, 18165, 4469 );
    level.var_2a9f2129 = 8415;
    level.var_6d8a1d51 = 9875;
}

// Namespace wz_open_skyscrapers_death_circle/wz_open_skyscrapers_death_circle
// Params 0
// Checksum 0x119034e4, Offset: 0x1e60
// Size: 0x3e
function function_2c08463c()
{
    level.var_5c8bbb85 = ( 29394, 4439, 4067 );
    level.var_2a9f2129 = 4690;
    level.var_6d8a1d51 = 4971;
}

// Namespace wz_open_skyscrapers_death_circle/wz_open_skyscrapers_death_circle
// Params 0
// Checksum 0x59b6d1c2, Offset: 0x1ea8
// Size: 0x3e
function function_10922af0()
{
    level.var_5c8bbb85 = ( -11592, 43535, 1350 );
    level.var_2a9f2129 = 19691;
    level.var_6d8a1d51 = 22406;
}

// Namespace wz_open_skyscrapers_death_circle/wz_open_skyscrapers_death_circle
// Params 0
// Checksum 0x7630d249, Offset: 0x1ef0
// Size: 0x3e
function function_ee550b9a()
{
    level.var_5c8bbb85 = ( 2589, -49423, 4700 );
    level.var_2a9f2129 = 3991;
    level.var_6d8a1d51 = 4994;
}

// Namespace wz_open_skyscrapers_death_circle/wz_open_skyscrapers_death_circle
// Params 0
// Checksum 0xd11fc94d, Offset: 0x1f38
// Size: 0x3e
function function_7896ad1d()
{
    level.var_5c8bbb85 = ( 10826, -44160, 4090 );
    level.var_2a9f2129 = 6105;
    level.var_6d8a1d51 = 6717;
}

// Namespace wz_open_skyscrapers_death_circle/wz_open_skyscrapers_death_circle
// Params 0
// Checksum 0xde407496, Offset: 0x1f80
// Size: 0x3e
function function_b4f48010()
{
    level.var_5c8bbb85 = ( -18312, -25582, 1300 );
    level.var_2a9f2129 = 1759;
    level.var_6d8a1d51 = 3157;
}

// Namespace wz_open_skyscrapers_death_circle/wz_open_skyscrapers_death_circle
// Params 0
// Checksum 0xb318b165, Offset: 0x1fc8
// Size: 0x3e
function function_4045ad15()
{
    level.var_5c8bbb85 = ( -44862, 27369, 1400 );
    level.var_2a9f2129 = 3663;
    level.var_6d8a1d51 = 2856;
}

// Namespace wz_open_skyscrapers_death_circle/wz_open_skyscrapers_death_circle
// Params 0
// Checksum 0x4e0eafbf, Offset: 0x2010
// Size: 0x3e
function function_b1f34ec5()
{
    level.var_5c8bbb85 = ( 2839, 27576, 2395 );
    level.var_2a9f2129 = 2677;
    level.var_6d8a1d51 = 5310;
}

// Namespace wz_open_skyscrapers_death_circle/wz_open_skyscrapers_death_circle
// Params 0
// Checksum 0xc1e953f, Offset: 0x2058
// Size: 0x3a
function function_116b8cff()
{
    level.var_5c8bbb85 = ( 33403, -43940, 0 );
    level.var_2a9f2129 = 9250;
    level.var_6d8a1d51 = 13493;
}

// Namespace wz_open_skyscrapers_death_circle/wz_open_skyscrapers_death_circle
// Params 0
// Checksum 0x67d23b8e, Offset: 0x20a0
// Size: 0x3a
function function_81e9f1be()
{
    level.var_5c8bbb85 = ( -40308, -12226, 0 );
    level.var_2a9f2129 = 12239;
    level.var_6d8a1d51 = 8766;
}

// Namespace wz_open_skyscrapers_death_circle/wz_open_skyscrapers_death_circle
// Params 0
// Checksum 0xae9e569b, Offset: 0x20e8
// Size: 0x3a
function function_dbb233d6()
{
    level.var_5c8bbb85 = ( -24173, -49307, 0 );
    level.var_2a9f2129 = 16635;
    level.var_6d8a1d51 = 21438;
}

// Namespace wz_open_skyscrapers_death_circle/wz_open_skyscrapers_death_circle
// Params 0
// Checksum 0x7324ee7d, Offset: 0x2130
// Size: 0x3a
function function_8114ea4f()
{
    level.var_5c8bbb85 = ( -21373, -4119, 0 );
    level.var_2a9f2129 = 8803;
    level.var_6d8a1d51 = 12317;
}

// Namespace wz_open_skyscrapers_death_circle/wz_open_skyscrapers_death_circle
// Params 0
// Checksum 0x3de33cf8, Offset: 0x2178
// Size: 0x3a
function function_3ab57f72()
{
    level.var_5c8bbb85 = ( 35398, 21980, 0 );
    level.var_2a9f2129 = 7735;
    level.var_6d8a1d51 = 11563;
}

// Namespace wz_open_skyscrapers_death_circle/wz_open_skyscrapers_death_circle
// Params 0
// Checksum 0xf66ead6f, Offset: 0x21c0
// Size: 0x3a
function function_918f3f42()
{
    level.var_5c8bbb85 = ( -31295, 25841, 0 );
    level.var_2a9f2129 = 11340;
    level.var_6d8a1d51 = 15061;
}

// Namespace wz_open_skyscrapers_death_circle/wz_open_skyscrapers_death_circle
// Params 0
// Checksum 0x4260e908, Offset: 0x2208
// Size: 0x3a
function function_4d20b749()
{
    level.var_5c8bbb85 = ( -52516, -37189, 0 );
    level.var_2a9f2129 = 6412;
    level.var_6d8a1d51 = 11232;
}

// Namespace wz_open_skyscrapers_death_circle/wz_open_skyscrapers_death_circle
// Params 0
// Checksum 0x521cfa0a, Offset: 0x2250
// Size: 0x27c
function function_320393b9()
{
    if ( !isdefined( level.var_590e0497 ) || level.var_590e0497.size <= 0 )
    {
        println( "<dev string:xb2>" );
        return;
    }
    
    var_f4a0340a = array::randomize( level.var_590e0497 );
    var_8ecddd2c = level.var_6d8a1d51 / 2;
    var_788ab0a6 = level.var_2a9f2129 / 2;
    min_x = level.var_5c8bbb85[ 0 ] - var_8ecddd2c;
    max_x = level.var_5c8bbb85[ 0 ] + var_8ecddd2c;
    min_y = level.var_5c8bbb85[ 1 ] - var_788ab0a6;
    max_y = level.var_5c8bbb85[ 1 ] + var_788ab0a6;
    var_68daafed = 0;
    
    foreach ( safe in var_f4a0340a )
    {
        if ( safe.origin[ 0 ] >= min_x && safe.origin[ 0 ] <= max_x && safe.origin[ 1 ] >= min_y && safe.origin[ 1 ] <= max_y )
        {
            var_68daafed = 1;
            level.var_5c8bbb85 = safe.origin;
            level.var_6d8a1d51 = level.var_398d38ce * 1.5;
            level.var_2a9f2129 = level.var_398d38ce * 1.5;
            return;
        }
    }
    
    /#
        if ( var_68daafed == 0 )
        {
            println( "<dev string:xd3>" );
        }
    #/
}

// Namespace wz_open_skyscrapers_death_circle/wz_open_skyscrapers_death_circle
// Params 0
// Checksum 0x67b86dc8, Offset: 0x24d8
// Size: 0x206
function function_fdabbb8a()
{
    a_locs = array( ( 50636, 27500, 0 ), ( 39800, 10650, 0 ), ( 28434, 13200, 0 ), ( 14714, 13200, 0 ), ( 10100, 30360, 0 ), ( -15238, 20633, 0 ), ( -18050, 32800, 0 ), ( -25222, 17560, 0 ), ( -17800, 5010, 0 ), ( -22150, -15590, 0 ), ( -2182, 5150, 0 ), ( 16500, -15333, 0 ), ( 33150, -4070, 0 ), ( 54138, -21735, 0 ), ( 35700, -25830, 0 ), ( 24186, -53500, 0 ), ( 13700, -56167, 0 ), ( 2500, -48500, 0 ), ( -2500, -32870, 0 ), ( -10630, -58215, 0 ), ( -15600, -36000, 0 ), ( -29414, -57500, 0 ), ( -43878, -54055, 0 ), ( -57318, -46600, 0 ), ( -35000, -34500, 0 ), ( -56300, -28583, 0 ), ( -41446, -28327, 0 ), ( -50000, -11500, 0 ), ( -56300, 4000, 0 ), ( -56550, 22500, 0 ), ( 13100, -23270, 0 ) );
    v_loc = array::random( a_locs );
    level.var_5c8bbb85 = v_loc;
    level.var_2a9f2129 = randomint( 9000 );
    level.var_6d8a1d51 = randomint( 9000 );
}

