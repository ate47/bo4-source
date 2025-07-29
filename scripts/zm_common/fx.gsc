#using scripts\core_common\exploder_shared;
#using scripts\core_common\fx_shared;
#using scripts\core_common\sound_shared;
#using scripts\core_common\struct;
#using scripts\zm_common\util;

#namespace fx;

/#

    // Namespace fx/fx
    // Params 4
    // Checksum 0x68f5ac02, Offset: 0x90
    // Size: 0x17c, Type: dev
    function print_org( fxcommand, fxid, fxpos, waittime )
    {
        if ( getdvarint( #"debug", 0 ) )
        {
            println( "<dev string:x38>" );
            println( "<dev string:x3c>" + fxpos[ 0 ] + "<dev string:x49>" + fxpos[ 1 ] + "<dev string:x49>" + fxpos[ 2 ] + "<dev string:x4d>" );
            println( "<dev string:x51>" );
            println( "<dev string:x6e>" );
            println( "<dev string:x7d>" + fxcommand + "<dev string:x4d>" );
            println( "<dev string:x94>" + fxid + "<dev string:x4d>" );
            println( "<dev string:xa6>" + waittime + "<dev string:x4d>" );
            println( "<dev string:xb9>" );
        }
    }

#/

// Namespace fx/fx
// Params 8
// Checksum 0x7ad557e9, Offset: 0x218
// Size: 0x74
function gunfireloopfx( fxid, fxpos, shotsmin, shotsmax, shotdelaymin, shotdelaymax, betweensetsmin, betweensetsmax )
{
    thread gunfireloopfxthread( fxid, fxpos, shotsmin, shotsmax, shotdelaymin, shotdelaymax, betweensetsmin, betweensetsmax );
}

// Namespace fx/fx
// Params 8
// Checksum 0xd4d646f5, Offset: 0x298
// Size: 0x20a
function gunfireloopfxthread( fxid, fxpos, shotsmin, shotsmax, shotdelaymin, shotdelaymax, betweensetsmin, betweensetsmax )
{
    level endon( #"stop all gunfireloopfx" );
    waitframe( 1 );
    
    if ( betweensetsmax < betweensetsmin )
    {
        temp = betweensetsmax;
        betweensetsmax = betweensetsmin;
        betweensetsmin = temp;
    }
    
    betweensetsbase = betweensetsmin;
    betweensetsrange = betweensetsmax - betweensetsmin;
    
    if ( shotdelaymax < shotdelaymin )
    {
        temp = shotdelaymax;
        shotdelaymax = shotdelaymin;
        shotdelaymin = temp;
    }
    
    shotdelaybase = shotdelaymin;
    shotdelayrange = shotdelaymax - shotdelaymin;
    
    if ( shotsmax < shotsmin )
    {
        temp = shotsmax;
        shotsmax = shotsmin;
        shotsmin = temp;
    }
    
    shotsbase = shotsmin;
    shotsrange = shotsmax - shotsmin;
    fxent = spawnfx( level._effect[ fxid ], fxpos );
    
    for ( ;; )
    {
        shotnum = shotsbase + randomint( shotsrange );
        
        for ( i = 0; i < shotnum ; i++ )
        {
            triggerfx( fxent );
            wait shotdelaybase + randomfloat( shotdelayrange );
        }
        
        wait betweensetsbase + randomfloat( betweensetsrange );
    }
}

// Namespace fx/fx
// Params 9
// Checksum 0x5b777f62, Offset: 0x4b0
// Size: 0x84
function gunfireloopfxvec( fxid, fxpos, fxpos2, shotsmin, shotsmax, shotdelaymin, shotdelaymax, betweensetsmin, betweensetsmax )
{
    thread gunfireloopfxvecthread( fxid, fxpos, fxpos2, shotsmin, shotsmax, shotdelaymin, shotdelaymax, betweensetsmin, betweensetsmax );
}

// Namespace fx/fx
// Params 9
// Checksum 0xfd430526, Offset: 0x540
// Size: 0x29a
function gunfireloopfxvecthread( fxid, fxpos, fxpos2, shotsmin, shotsmax, shotdelaymin, shotdelaymax, betweensetsmin, betweensetsmax )
{
    level endon( #"stop all gunfireloopfx" );
    waitframe( 1 );
    
    if ( betweensetsmax < betweensetsmin )
    {
        temp = betweensetsmax;
        betweensetsmax = betweensetsmin;
        betweensetsmin = temp;
    }
    
    betweensetsbase = betweensetsmin;
    betweensetsrange = betweensetsmax - betweensetsmin;
    
    if ( shotdelaymax < shotdelaymin )
    {
        temp = shotdelaymax;
        shotdelaymax = shotdelaymin;
        shotdelaymin = temp;
    }
    
    shotdelaybase = shotdelaymin;
    shotdelayrange = shotdelaymax - shotdelaymin;
    
    if ( shotsmax < shotsmin )
    {
        temp = shotsmax;
        shotsmax = shotsmin;
        shotsmin = temp;
    }
    
    shotsbase = shotsmin;
    shotsrange = shotsmax - shotsmin;
    fxpos2 = vectornormalize( fxpos2 - fxpos );
    fxent = spawnfx( level._effect[ fxid ], fxpos, fxpos2 );
    
    for ( ;; )
    {
        shotnum = shotsbase + randomint( shotsrange );
        
        for ( i = 0; i < int( shotnum / level.fxfireloopmod ) ; i++ )
        {
            triggerfx( fxent );
            delay = ( shotdelaybase + randomfloat( shotdelayrange ) ) * level.fxfireloopmod;
            
            if ( delay < 0.05 )
            {
                delay = 0.05;
            }
            
            wait delay;
        }
        
        wait shotdelaybase + randomfloat( shotdelayrange );
        wait betweensetsbase + randomfloat( betweensetsrange );
    }
}

// Namespace fx/fx
// Params 1
// Checksum 0xa0faaba4, Offset: 0x7e8
// Size: 0x5c
function grenadeexplosionfx( pos )
{
    playfx( level._effect[ #"mechanical explosion" ], pos );
    earthquake( 0.15, 0.5, pos, 250 );
}

