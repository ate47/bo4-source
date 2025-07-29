#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\array_shared;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\struct;
#using scripts\core_common\trigger_shared;
#using scripts\core_common\util_shared;
#using scripts\zm\ai\zm_ai_catalyst;
#using scripts\zm\ai\zm_ai_nosferatu;
#using scripts\zm\zm_mansion;
#using scripts\zm\zm_mansion_pap_quest;
#using scripts\zm\zm_mansion_special_rounds;
#using scripts\zm\zm_mansion_util;
#using scripts\zm_common\callbacks;
#using scripts\zm_common\util\ai_werewolf_util;
#using scripts\zm_common\zm;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_blockers;
#using scripts\zm_common\zm_characters;
#using scripts\zm_common\zm_crafting;
#using scripts\zm_common\zm_equipment;
#using scripts\zm_common\zm_fasttravel;
#using scripts\zm_common\zm_hero_weapon;
#using scripts\zm_common\zm_items;
#using scripts\zm_common\zm_loadout;
#using scripts\zm_common\zm_magicbox;
#using scripts\zm_common\zm_pack_a_punch;
#using scripts\zm_common\zm_perks;
#using scripts\zm_common\zm_power;
#using scripts\zm_common\zm_round_logic;
#using scripts\zm_common\zm_round_spawning;
#using scripts\zm_common\zm_transformation;
#using scripts\zm_common\zm_unitrigger;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_utility_zstandard;
#using scripts\zm_common\zm_weapons;
#using scripts\zm_common\zm_zonemgr;

#namespace zm_mansion_zstandard;

// Namespace zm_mansion_zstandard/zm_mansion_zstandard
// Params 0
// Checksum 0x28977481, Offset: 0x5c0
// Size: 0x5fc
function function_84139b27()
{
    zm_utility::function_c492c4d6( #"cellar", #"hash_1b5f923615231b33", array( #"zone_cellar" ), array( #"billiards_room", #"library", #"greenhouse", #"cemetery" ), #"hash_d991d688c218647", #"hash_2b2357a02d83b291" );
    zm_utility::function_c492c4d6( #"main_hall", #"hash_7a9b6ecf9efe213d", array( #"zone_main_hall" ), array( #"library", #"dining_room", #"grand_staircase" ), #"hash_23e3f0727cf654e1", #"hash_56ee5965eeb986f7" );
    zm_utility::function_c492c4d6( #"grand_staircase", #"hash_385f3c24f5a215a0", array( #"zone_grand_staircase", #"zone_entrance_hall" ), array( #"billiards_room", #"greenhouse", #"dining_room", #"library" ), #"hash_17eb32ca84395d46", #"hash_63182288b2fa8fe2" );
    zm_utility::function_c492c4d6( #"library", #"hash_1ed56b51775c6337", array( #"zone_library" ), array( #"grand_staircase", #"main_hall", #"cemetery" ), #"hash_18ccedb519d08fdb", #"hash_3d3024b021773e75" );
    zm_utility::function_c492c4d6( #"greenhouse", #"hash_6ca6299c59dc3611", array( #"zone_greenhouse_lab" ), array( #"main_hall", #"cellar", #"grand_staircase", #"dining_room" ), #"hash_1eab9450a8098785", #"hash_11659cb4f681fe2b" );
    zm_utility::function_c492c4d6( #"dining_room", #"hash_630110b8f5ec36d9", array( #"zone_dining_room" ), array( #"greenhouse", #"cellar", #"cemetery" ), #"hash_59f4621f89897419", #"hash_9374fbb3272c53f" );
    zm_utility::function_c492c4d6( #"billiards_room", #"hash_1d07f6440958f050", array( #"zone_library_hallway_upper", #"zone_foyer_westend" ), array( #"cemetery", #"grand_staircase", #"greenhouse" ), #"hash_3d69c72a393f3836", #"hash_3d83f27f0bfd3a72" );
    zm_utility::function_c492c4d6( #"cemetery", #"hash_551b339e17319aa0", array( #"zone_cemetery_mausoleum" ), array( #"library", #"billiards_room", #"main_hall", #"cellar" ), #"hash_2b4478e34d38202", #"hash_a3797801599641e" );
    
    /#
        zm_utility::function_1e856719();
    #/
}

// Namespace zm_mansion_zstandard/zm_mansion_zstandard
// Params 0
// Checksum 0x803a6988, Offset: 0xbc8
// Size: 0x38c
function main()
{
    level thread function_fe69176c();
    function_edd5bb1a();
    function_ac904e5e();
    callback::function_74872db6( &function_74872db6 );
    level.fn_custom_round_ai_spawn = undefined;
    level.var_3f86fd35 = 8;
    level.var_d7853f35 = 14;
    level.var_ecdf38f = 13;
    level.var_55e562f9 = 16;
    zm_round_spawning::function_306ce518( #"catalyst", &function_40dfd00b );
    zm_round_spawning::function_306ce518( #"nosferatu", &function_2ce29db3 );
    zm_round_spawning::function_306ce518( #"werewolf", &function_124d3657 );
    zm_utility::function_2959a3cb( #"nosferatu", &function_c22d1f6a );
    zm_utility::function_2959a3cb( #"werewolf", &function_9ab66ae8 );
    level.zombie_hints[ #"default_treasure_chest" ] = #"hash_57a34375dddce337";
    level thread defend_areas();
    var_4ce6fa3d = getent( "connect_forest_entrance_to_forest", "script_flag" );
    var_4ce6fa3d.script_noteworthy = "";
    var_822110ba = getent( "ooze_gate_col", "targetname" );
    var_822110ba delete();
    level thread function_5f03f689();
    level thread zm_blockers::function_6f01c3cf( "barricade_start_west_1", "script_string" );
    level thread zm_blockers::function_6f01c3cf( "barricade_start_west_2", "script_string" );
    level thread zm_blockers::function_6f01c3cf( "barricade_start_east_1", "script_string" );
    level thread zm_blockers::function_6f01c3cf( "barricade_start_east_2", "script_string" );
    level thread zm_blockers::function_6f01c3cf( "barricade_hall_west_end_1", "script_string" );
    level thread zm_blockers::function_6f01c3cf( "barricade_hall_east_end_1", "script_string" );
    zm_power::turn_power_on_and_open_doors( 1 );
    mansion_pap::function_cdb8fe80();
}

// Namespace zm_mansion_zstandard/zm_mansion_zstandard
// Params 0
// Checksum 0xbfde677, Offset: 0xf60
// Size: 0xfa
function function_5f03f689()
{
    level endon( #"end_game" );
    level flag::wait_till( "start_zombie_round_logic" );
    a_s_fasttravels = struct::get_array( "fasttravel_trigger" );
    
    foreach ( s_fasttravel in a_s_fasttravels )
    {
        if ( s_fasttravel.script_string === "entrance_hall" )
        {
            s_fasttravel.var_a4134e51 = "connect_forest_entrance_to_forest";
            s_fasttravel.unitrigger_stub.var_a4134e51 = "connect_forest_entrance_to_forest";
        }
    }
}

// Namespace zm_mansion_zstandard/zm_mansion_zstandard
// Params 0
// Checksum 0xb860cb9b, Offset: 0x1068
// Size: 0x3e
function function_74872db6()
{
    level.var_2e3a6cbe = undefined;
    level.var_d614a8b4 = undefined;
    level.var_11f7a9af = undefined;
    level.var_18d20774 = undefined;
    level.registertheater_fxanim_kill_trigger_centerterminatetraverse = undefined;
}

// Namespace zm_mansion_zstandard/zm_mansion_zstandard
// Params 0
// Checksum 0x351fbea6, Offset: 0x10b0
// Size: 0x54
function function_c22d1f6a()
{
    level zm_utility::function_e64ac3b6( 11, #"hash_7f4287cceb84c614" );
    level thread zm_audio::sndannouncerplayvox( #"nosferatu", undefined, undefined, undefined, 1 );
}

// Namespace zm_mansion_zstandard/zm_mansion_zstandard
// Params 0
// Checksum 0xdffc1174, Offset: 0x1110
// Size: 0x54
function function_9ab66ae8()
{
    level zm_utility::function_e64ac3b6( 10, #"hash_44ee4f30644e71ec" );
    level thread zm_audio::sndannouncerplayvox( #"werewolf", undefined, undefined, undefined, 1 );
}

// Namespace zm_mansion_zstandard/zm_mansion_zstandard
// Params 0
// Checksum 0x1323dbaf, Offset: 0x1170
// Size: 0x4c
function registerlast_truck_headshot_()
{
    level zm_utility::function_7a35b1d7( #"hash_4ebcbd3655fdceb0" );
    level thread zm_audio::sndannouncerplayvox( #"pap_avail", undefined, undefined, undefined, 1 );
}

// Namespace zm_mansion_zstandard/zm_mansion_zstandard
// Params 0
// Checksum 0x442d95b7, Offset: 0x11c8
// Size: 0x4c
function function_a97f7327()
{
    level zm_utility::function_7a35b1d7( #"hash_60f7952659026bea" );
    level thread zm_audio::sndannouncerplayvox( #"hash_3acd6d72567def3a", undefined, undefined, undefined, 1 );
}

// Namespace zm_mansion_zstandard/zm_mansion_zstandard
// Params 1
// Checksum 0xb50dcfb7, Offset: 0x1220
// Size: 0xb4
function function_40dfd00b( n_round_number )
{
    var_c66743a5 = array::random( array( #"catalyst_corrosive", #"catalyst_electric", #"catalyst_plasma", #"catalyst_water" ) );
    zm_utility::function_9b7bc715( #"catalyst", 1 );
    zm_transform::function_bdd8aba6( var_c66743a5 );
}

// Namespace zm_mansion_zstandard/zm_mansion_zstandard
// Params 1
// Checksum 0x61b6c11d, Offset: 0x12e0
// Size: 0x4c
function function_2ce29db3( n_round )
{
    zm_utility::function_9b7bc715( #"nosferatu", 1 );
    zm_ai_nosferatu::function_74f25f8a( 1 );
}

// Namespace zm_mansion_zstandard/zm_mansion_zstandard
// Params 1
// Checksum 0x5e1e27ee, Offset: 0x1338
// Size: 0x54
function function_124d3657( n_round )
{
    zm_utility::function_9b7bc715( #"werewolf", 1 );
    zombie_werewolf_util::function_47a88a0c( 1, undefined, 1 );
}

// Namespace zm_mansion_zstandard/zm_mansion_zstandard
// Params 0
// Checksum 0x99df7521, Offset: 0x1398
// Size: 0x34
function function_edd5bb1a()
{
    if ( zm_utility::function_e37823df() )
    {
        zm_utility::function_6df718d( #"tag_origin" );
    }
}

// Namespace zm_mansion_zstandard/zm_mansion_zstandard
// Params 0
// Checksum 0x21479bc7, Offset: 0x13d8
// Size: 0x9fc
function defend_areas()
{
    level endon( #"end_game" );
    function_84139b27();
    level thread zm_mansion::function_e764a14b();
    level flag::wait_till( "start_zombie_round_logic" );
    level util::delay( 4, undefined, &zm_utility::open_door, array( "debris_startwest_to_starteast", "debris_starteast_to_startwest" ) );
    
    /#
        if ( getdvarint( #"hash_b3363e1d25715d7", 0 ) )
        {
            mansion_util::function_57423f( 1 );
            return;
        }
    #/
    
    zm_utility::function_fdb0368( 2 );
    level zm_utility::open_door( array( "door_start_to_hall", "debris_start_east_to_bedhall" ), undefined, undefined, 1 );
    zm_utility::function_fdb0368( 4 );
    zm_utility::open_door( array( "door_hallend_to_grand_staircase", "door_to_entrance_hall" ), undefined, undefined, 1 );
    level thread scene::play( "entrance_hall_exploding_door", "targetname" );
    str_next_defend = #"grand_staircase";
    wait 5;
    zm_utility::function_11101458( str_next_defend );
    wait 10;
    s_defend_area = zm_utility::function_a877cd10( str_next_defend );
    zm_utility::function_33798535( s_defend_area.var_39c44288, s_defend_area.a_str_zones, s_defend_area.var_ed1db1a7, undefined, undefined, 35 );
    zm_utility::function_fef4b36a( str_next_defend );
    var_6152b664 = getent( "use_elec_switch", "targetname" );
    var_6152b664 triggerenable( 1 );
    trigger::use( "use_elec_switch" );
    wait 10;
    str_second_defend = array::random( array( #"cellar", #"library", #"dining_room" ) );
    
    if ( str_second_defend == #"cellar" )
    {
        level thread zm_utility::open_door( array( "door_to_cellar" ) );
    }
    else if ( str_second_defend == #"library" )
    {
        level thread zm_utility::open_door( array( "door_to_library_floor", "door_to_library" ) );
    }
    else
    {
        level thread zm_utility::open_door( array( "door_to_dining_room_lower", "debris_to_dining_room_upper" ) );
    }
    
    wait 5;
    zm_utility::function_11101458( str_second_defend );
    s_defend_area = zm_utility::function_a877cd10( str_second_defend );
    zm_utility::function_33798535( s_defend_area.var_39c44288, s_defend_area.a_str_zones, s_defend_area.var_ed1db1a7, undefined, undefined, 45 );
    zm_utility::function_fef4b36a( str_second_defend );
    level zm_utility::open_door( array( "debris_startwest_to_mainhall", "debris_starteast_to_mainhall" ), undefined, undefined, 1 );
    wait 5;
    str_next_defend = #"main_hall";
    zm_utility::function_11101458( str_next_defend );
    registertrench_dogs_coop_round();
    wait 15;
    s_defend_area = zm_utility::function_a877cd10( str_next_defend );
    level thread zm_utility::function_33798535( s_defend_area.var_39c44288, s_defend_area.a_str_zones, s_defend_area.var_ed1db1a7 );
    level flag::wait_till( "started_defend_area" );
    level util::delay( 5, undefined, &zm_round_spawning::function_376e51ef, #"werewolf" );
    level waittill( #"hash_7a04a7fb98fa4e4d" );
    zm_utility::function_fef4b36a( str_next_defend );
    a_zbarriers = getzbarrierarray();
    
    foreach ( zbarrier in a_zbarriers )
    {
        if ( zbarrier.classname === "zbarrier_zm_packapunch_stationary" )
        {
            collision = spawn( "script_model", zbarrier.origin, 1 );
            collision.angles = zbarrier.angles;
            collision setmodel( #"zm_collision_perks1" );
            collision.script_noteworthy = "clip";
            collision disconnectpaths();
        }
    }
    
    level flag::set( "open_pap" );
    level thread zm_utility::open_door( array( "door_main_hall_to_forest_entrance" ) );
    wait 5;
    level thread registerlast_truck_headshot_();
    wait 30;
    
    if ( str_second_defend == #"library" )
    {
        str_next_defend = #"cemetery";
        level thread zm_utility::open_door( array( "debris_cemetery_entrance", "debris_cemetery", "door_to_library", "door_to_library_floor" ) );
    }
    else
    {
        str_next_defend = #"greenhouse";
        level thread zm_utility::open_door( array( "gate_greenhouse", "door_dining_room_to_greenhouse_entrance", "door_to_dining_room_lower", "debris_to_dining_room_upper" ) );
    }
    
    zm_utility::function_11101458( str_next_defend );
    wait 15;
    s_defend_area = zm_utility::function_a877cd10( str_next_defend );
    zm_utility::function_33798535( s_defend_area.var_39c44288, s_defend_area.a_str_zones, s_defend_area.var_ed1db1a7 );
    zm_utility::function_fef4b36a( str_next_defend );
    zm_round_spawning::function_376e51ef( #"bat" );
    zm_round_spawning::function_376e51ef( #"nosferatu" );
    level thread zm_round_spawning::function_376e51ef( #"crimson_nosferatu", level.round_number + 6 );
    level thread util::delay( 120, "end_game", &function_cf680b18 );
    
    /#
        iprintlnbold( "<dev string:x38>" );
    #/
    
    wait 7;
    level thread zm_utility::open_door( array( "door_to_cellar", "door_to_dining_room_lower", "debris_to_dining_room_upper", "door_dining_room_to_greenhouse_entrance", "gate_greenhouse", "door_to_library_floor", "door_to_library", "debris_cemetery_entrance", "debris_cemetery" ), undefined, undefined, 0 );
    level thread function_a97f7327();
    function_39364bed();
}

// Namespace zm_mansion_zstandard/zm_mansion_zstandard
// Params 0
// Checksum 0xd830525f, Offset: 0x1de0
// Size: 0xd2
function registertrench_dogs_coop_round()
{
    /#
        iprintlnbold( "<dev string:x69>" );
    #/
    
    switch ( level.players.size )
    {
        case 1:
        default:
            level.var_9a7491e = 1.5;
            break;
        case 2:
        case 3:
            level.var_9a7491e = 2;
            break;
        case 4:
            level.var_9a7491e = 2.5;
            break;
    }
}

// Namespace zm_mansion_zstandard/zm_mansion_zstandard
// Params 0
// Checksum 0x3620296, Offset: 0x1ec0
// Size: 0xd2
function function_cf680b18()
{
    /#
        iprintlnbold( "<dev string:x90>" );
    #/
    
    switch ( level.players.size )
    {
        case 1:
        default:
            level.var_cd345b49 = 1.5;
            break;
        case 2:
        case 3:
            level.var_cd345b49 = 2;
            break;
        case 4:
            level.var_cd345b49 = 3;
            break;
    }
}

// Namespace zm_mansion_zstandard/zm_mansion_zstandard
// Params 0
// Checksum 0x7c169870, Offset: 0x1fa0
// Size: 0x110
function function_39364bed()
{
    str_next_defend = array::random( array( #"billiards_room", #"cellar", #"library" ) );
    
    while ( true )
    {
        zm_utility::function_11101458( str_next_defend );
        wait 45;
        s_defend_area = zm_utility::function_a877cd10( str_next_defend );
        zm_zonemgr::function_8caa21df( s_defend_area.a_str_zones );
        zm_utility::function_33798535( s_defend_area.var_39c44288, s_defend_area.a_str_zones, s_defend_area.var_ed1db1a7 );
        str_next_defend = zm_utility::function_40ef77ab( str_next_defend );
        waitframe( 1 );
    }
}

// Namespace zm_mansion_zstandard/zm_mansion_zstandard
// Params 0
// Checksum 0xd03bcb6b, Offset: 0x20b8
// Size: 0x2f0
function function_ac904e5e()
{
    zm_utility::function_742f2c18( 1, #"zombie", 8, 4 );
    zm_utility::function_742f2c18( 2, #"zombie", 8, 4 );
    zm_utility::function_742f2c18( 3, #"zombie", 8, 6 );
    zm_utility::function_742f2c18( 4, #"zombie", 10, 6 );
    zm_utility::function_742f2c18( 5, #"zombie", 10, 8 );
    zm_utility::function_742f2c18( 6, #"zombie", 10, 8 );
    zm_utility::function_742f2c18( 7, #"zombie", 12, 8 );
    zm_utility::function_742f2c18( 8, #"zombie", 12, 8 );
    zm_utility::function_742f2c18( 9, #"zombie", 12, 8 );
    zm_utility::function_742f2c18( 10, #"zombie", 14, 10 );
    zm_utility::function_742f2c18( 11, #"zombie", 14, 10 );
    zm_utility::function_742f2c18( 12, #"zombie", 14, 10 );
    zm_utility::function_742f2c18( 13, #"zombie", 16, 12 );
    zm_utility::function_742f2c18( 14, #"zombie", 20, 12 );
    zm_utility::function_742f2c18( 15, #"zombie", 30, 12 );
    n_zombie_min = 12;
    
    for ( n_round = 10; n_round < 255 ; n_round++ )
    {
        zm_utility::function_742f2c18( n_round, #"zombie", undefined, n_zombie_min );
        
        if ( math::cointoss() )
        {
            n_zombie_min++;
        }
        
        n_zombie_min = math::clamp( n_zombie_min, 8, 24 );
    }
}

// Namespace zm_mansion_zstandard/zm_mansion_zstandard
// Params 0
// Checksum 0x6d16147, Offset: 0x23b0
// Size: 0xdc
function function_f3859095()
{
    var_82c8a927 = getent( "pap_lock_main_hall", "targetname" );
    var_a82b1de9 = getent( "pap_lock_library", "targetname" );
    var_34cbce37 = getent( "pap_lock_greenhouse", "targetname" );
    
    if ( isdefined( var_82c8a927 ) )
    {
        var_82c8a927 delete();
    }
    
    if ( isdefined( var_a82b1de9 ) )
    {
        var_a82b1de9 delete();
    }
    
    if ( isdefined( var_34cbce37 ) )
    {
        var_34cbce37 delete();
    }
}

// Namespace zm_mansion_zstandard/zm_mansion_zstandard
// Params 0
// Checksum 0x46a02fce, Offset: 0x2498
// Size: 0x2ae
function function_fe69176c()
{
    a_w_component = array();
    a_w_component[ 0 ] = zm_crafting::get_component( #"zitem_silver_bullet_part_1" );
    a_w_component[ 1 ] = zm_crafting::get_component( #"zitem_silver_bullet_part_2" );
    a_w_component[ 2 ] = zm_crafting::get_component( #"zitem_silver_bullet_part_3" );
    a_w_component[ 3 ] = zm_crafting::get_component( #"zitem_silver_molten_part_1" );
    a_w_component[ 4 ] = zm_crafting::get_component( #"zitem_silver_molten_part_2" );
    a_w_component[ 5 ] = zm_crafting::get_component( #"zitem_silver_molten_part_3" );
    a_e_items = getitemarray();
    
    foreach ( e_item in a_e_items )
    {
        if ( isinarray( a_w_component, e_item.item ) )
        {
            e_item delete();
        }
    }
    
    hidemiscmodels( "ww_lvl3_quest_piece_on_table" );
    var_7f952cba = getentarray( "ww_lvl3_quest_piece_on_table", "targetname" );
    array::delete_all( var_7f952cba );
    zm_crafting::function_ca244624( #"zblueprint_mansion_silver_bullet" );
    zm_crafting::function_ca244624( #"zblueprint_mansion_silver_molten" );
    level.var_4fe2f84d[ #"zblueprint_mansion_silver_molten" ][ 0 ].var_95f72816 = 1;
    level.var_4fe2f84d[ #"zblueprint_mansion_silver_bullet" ][ 0 ].var_95f72816 = 1;
}

