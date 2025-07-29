#namespace zm_white_doomsday_clock;

// Namespace zm_white_doomsday_clock/zm_white_doomsday_clock
// Params 0
// Checksum 0xd9491cf8, Offset: 0xb8
// Size: 0x1c
function init()
{
    level thread function_c720fa94();
}

// Namespace zm_white_doomsday_clock/zm_white_doomsday_clock
// Params 0
// Checksum 0x2a2e0a59, Offset: 0xe0
// Size: 0x78
function function_c720fa94()
{
    var_e323931b = getent( "e_doomsday_clock_min_hand", "targetname" );
    var_e323931b.position = 0;
    
    while ( true )
    {
        level waittill( #"update_doomsday_clock" );
        level thread update_doomsday_clock( var_e323931b );
    }
}

// Namespace zm_white_doomsday_clock/zm_white_doomsday_clock
// Params 1
// Checksum 0x39652c57, Offset: 0x160
// Size: 0x15e
function update_doomsday_clock( var_e323931b )
{
    while ( var_e323931b.is_updating === 1 )
    {
        wait 0.05;
    }
    
    var_e323931b.is_updating = 1;
    
    if ( var_e323931b.position == 0 )
    {
        var_e323931b.position = 3;
        var_e323931b rotatepitch( -90, 1 );
        var_e323931b playsound( "zmb_clock_hand" );
        var_e323931b waittill( #"rotatedone" );
        var_e323931b playsound( "zmb_clock_chime" );
    }
    else
    {
        var_e323931b.position--;
        var_e323931b rotatepitch( 30, 1 );
        var_e323931b playsound( "zmb_clock_hand" );
        var_e323931b waittill( #"rotatedone" );
    }
    
    level notify( #"nuke_clock_moved" );
    var_e323931b.is_updating = 0;
}

