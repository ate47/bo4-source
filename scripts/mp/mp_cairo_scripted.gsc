#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\gameobjects_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\mp_common\draft;

#namespace mp_cairo_scripted;

// Namespace mp_cairo_scripted/mp_cairo_scripted
// Params 0, eflags: 0x2
// Checksum 0xa01bc3ce, Offset: 0x478
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"mp_cairo_scripted", &__init__, &__main__, undefined );
}

// Namespace mp_cairo_scripted/mp_cairo_scripted
// Params 0
// Checksum 0x8bdf5521, Offset: 0x4c8
// Size: 0x24
function __init__()
{
    callback::on_game_playing( &on_game_playing );
}

// Namespace mp_cairo_scripted/mp_cairo_scripted
// Params 0
// Checksum 0xa99aaa28, Offset: 0x4f8
// Size: 0x120
function __main__()
{
    level.var_f3e25805 = &prematch_init;
    level thread function_34fc666e();
    array::run_all( getentarray( "dynamic_car_clip", "targetname" ), &disconnectpaths );
    
    foreach ( node in getnodearray( "dynamic_car_traverse", "targetname" ) )
    {
        if ( gameobjects::entity_is_allowed( node, level.allowedgameobjects ) )
        {
            linktraversal( node );
        }
    }
}

// Namespace mp_cairo_scripted/mp_cairo_scripted
// Params 0
// Checksum 0x68ccc71c, Offset: 0x620
// Size: 0x54
function on_game_playing()
{
    level util::delay( randomintrange( 6, 15 ), "game_ended", &function_69cdac99 );
}

// Namespace mp_cairo_scripted/mp_cairo_scripted
// Params 0
// Checksum 0x6f99aee3, Offset: 0x680
// Size: 0x56
function prematch_init()
{
    if ( util::isfirstround() )
    {
        if ( getgametypesetting( #"allowmapscripting" ) )
        {
            level thread scene::play( #"p8_fxanim_mp_havana_ac130_drop_bundle" );
        }
        
        return;
    }
}

// Namespace mp_cairo_scripted/mp_cairo_scripted
// Params 0
// Checksum 0x41953591, Offset: 0x6e0
// Size: 0xf4
function function_34fc666e()
{
    level endon( #"game_ended" );
    
    if ( draft::is_draft_this_round() )
    {
        while ( !draft::function_d255fb3e() )
        {
            waitframe( 1 );
        }
    }
    
    if ( util::isfirstround() )
    {
        if ( getgametypesetting( #"allowmapscripting" ) )
        {
            level scene::play( #"p8_fxanim_mp_havana_ac130_drop_bundle" );
        }
    }
    
    level flag::wait_till( "first_player_spawned" );
    exploder::exploder( "fxexp_falling_leaflets" );
    exploder::exploder( "fxexp_ground_leaflets" );
}

// Namespace mp_cairo_scripted/mp_cairo_scripted
// Params 0
// Checksum 0x6c6d540a, Offset: 0x7e0
// Size: 0x408
function function_69cdac99()
{
    level endon( #"game_ended" );
    next_line = undefined;
    last_line = undefined;
    var_c7ecf728 = [];
    var_c7ecf728[ 0 ] = "vox_cuba_propaganda_radio_0";
    var_c7ecf728[ 1 ] = "vox_cuba_propaganda_radio_1";
    var_c7ecf728[ 2 ] = "vox_cuba_propaganda_radio_10";
    var_c7ecf728[ 3 ] = "vox_cuba_propaganda_radio_11";
    var_c7ecf728[ 4 ] = "vox_cuba_propaganda_radio_12";
    var_c7ecf728[ 5 ] = "vox_cuba_propaganda_radio_13";
    var_c7ecf728[ 6 ] = "vox_cuba_propaganda_radio_2";
    var_c7ecf728[ 7 ] = "vox_cuba_propaganda_radio_3";
    var_c7ecf728[ 8 ] = "vox_cuba_propaganda_radio_4";
    var_c7ecf728[ 9 ] = "vox_cuba_propaganda_radio_5";
    var_c7ecf728[ 10 ] = "vox_cuba_propaganda_radio_6";
    var_c7ecf728[ 11 ] = "vox_cuba_propaganda_radio_7";
    var_c7ecf728[ 12 ] = "vox_cuba_propaganda_radio_8";
    var_c7ecf728[ 13 ] = "vox_cuba_propaganda_radio_9";
    var_c7ecf728[ 14 ] = "vox_usbr_us_propaganda_radio_0";
    var_c7ecf728[ 15 ] = "vox_usbr_us_propaganda_radio_1";
    var_c7ecf728[ 16 ] = "vox_usbr_us_propaganda_radio_10";
    var_c7ecf728[ 17 ] = "vox_usbr_us_propaganda_radio_11";
    var_c7ecf728[ 18 ] = "vox_usbr_us_propaganda_radio_2";
    var_c7ecf728[ 19 ] = "vox_usbr_us_propaganda_radio_3";
    var_c7ecf728[ 20 ] = "vox_usbr_us_propaganda_radio_4";
    var_c7ecf728[ 21 ] = "vox_usbr_us_propaganda_radio_5";
    var_c7ecf728[ 22 ] = "vox_usbr_us_propaganda_radio_6";
    var_c7ecf728[ 23 ] = "vox_usbr_us_propaganda_radio_7";
    var_c7ecf728[ 24 ] = "vox_usbr_us_propaganda_radio_8";
    var_c7ecf728[ 25 ] = "vox_usbr_us_propaganda_radio_9";
    tv_locs = array( ( 2043, -787, 1 ), ( 2344, 599, 150 ), ( 865, 878, 216 ), ( -1775, -76, 219 ) );
    radio_locs = array( ( 1486, 189, 64 ), ( -1802, 1706, 93 ) );
    
    while ( true )
    {
        do
        {
            next_line = randomintrange( 0, 26 );
            waitframe( 1 );
        }
        while ( next_line === last_line );
        
        last_line = next_line;
        
        if ( isdefined( var_c7ecf728[ next_line ] ) )
        {
            line_locs = tv_locs;
            
            if ( next_line >= 14 )
            {
                line_locs = radio_locs;
            }
            
            foreach ( line_pos in line_locs )
            {
                playsoundatposition( var_c7ecf728[ next_line ], line_pos );
            }
            
            wait randomfloatrange( 34, 65 );
        }
    }
}

