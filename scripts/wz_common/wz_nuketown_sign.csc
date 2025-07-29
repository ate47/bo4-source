#using scripts\core_common\callbacks_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;

#namespace wz_nuketown_sign;

// Namespace wz_nuketown_sign/wz_nuketown_sign
// Params 0, eflags: 0x2
// Checksum 0xb283954f, Offset: 0xe8
// Size: 0x34
function autoexec __init__system__()
{
    system::register( #"wz_nuketown_sign", undefined, &__main__, undefined );
}

// Namespace wz_nuketown_sign/wz_nuketown_sign
// Params 0
// Checksum 0x3c679f8f, Offset: 0x128
// Size: 0x3c
function __main__()
{
    callback::on_gameplay_started( &on_gameplay_started );
    util::waitforclient( 0 );
}

// Namespace wz_nuketown_sign/wz_nuketown_sign
// Params 1
// Checksum 0x8a08a649, Offset: 0x170
// Size: 0x24
function on_gameplay_started( localclientnum )
{
    level thread nuked_population_sign_think( localclientnum );
}

// Namespace wz_nuketown_sign/wz_nuketown_sign
// Params 1
// Checksum 0xcc799a55, Offset: 0x1a0
// Size: 0x498
function nuked_population_sign_think( localclientnum )
{
    tens_model = getent( localclientnum, "counter_tens", "targetname" );
    ones_model = getent( localclientnum, "counter_ones", "targetname" );
    zone = getent( localclientnum, "nuketown_island_zone", "targetname" );
    time = set_dvar_float_if_unset( "scr_dial_rotate_time", "0.5" );
    
    /#
        level thread function_102a701c( tens_model, ones_model );
    #/
    
    step = 36;
    ones = 0;
    tens = 0;
    tens_model rotateroll( step, 0.05 );
    ones_model rotateroll( step, 0.05 );
    
    for ( ;; )
    {
        wait 1;
        dosign = 0;
        players = getlocalplayers();
        
        foreach ( localplayer in players )
        {
            if ( !isdefined( localplayer ) )
            {
                continue;
            }
            
            if ( istouching( localplayer.origin, zone ) && !localplayer isplayerswimming() )
            {
                dosign = 1;
                break;
            }
        }
        
        if ( !dosign )
        {
            continue;
        }
        
        players = [];
        
        foreach ( player in getplayers( localclientnum ) )
        {
            if ( istouching( player.origin, zone ) && !player isplayerswimming() )
            {
                if ( !isdefined( players ) )
                {
                    players = [];
                }
                else if ( !isarray( players ) )
                {
                    players = array( players );
                }
                
                players[ players.size ] = player;
            }
        }
        
        for ( dial = ones + tens * 10; players.size < dial ; dial = ones + tens * 10 )
        {
            ones--;
            
            if ( ones < 0 )
            {
                ones = 9;
                tens_model rotateroll( 0 - step, time );
                tens--;
            }
            
            ones_model rotateroll( 0 - step, time );
            ones_model waittill( #"rotatedone" );
        }
        
        while ( players.size > dial )
        {
            ones++;
            
            if ( ones > 9 )
            {
                ones = 0;
                tens_model rotateroll( step, time );
                tens++;
            }
            
            ones_model rotateroll( step, time );
            ones_model waittill( #"rotatedone" );
            dial = ones + tens * 10;
        }
    }
}

// Namespace wz_nuketown_sign/wz_nuketown_sign
// Params 2
// Checksum 0x3bf303d6, Offset: 0x640
// Size: 0x6a
function set_dvar_float_if_unset( dvar, value )
{
    if ( getdvarstring( dvar ) == "" )
    {
        setdvar( dvar, value );
    }
    
    return getdvarfloat( dvar, 0 );
}

/#

    // Namespace wz_nuketown_sign/wz_nuketown_sign
    // Params 2
    // Checksum 0xa1361610, Offset: 0x6b8
    // Size: 0x4e, Type: dev
    function function_102a701c( tens, ones )
    {
        while ( !isdefined( tens ) || !isdefined( ones ) )
        {
            iprintlnbold( "<dev string:x38>" );
            wait 2;
        }
    }

#/
