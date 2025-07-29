#using scripts\core_common\hostmigration_shared;

#namespace hostmigration;

// Namespace hostmigration/hostmigration
// Params 0
// Checksum 0x80f724d1, Offset: 0x70
// Size: 0x4
function callback_hostmigrationsave()
{
    
}

// Namespace hostmigration/hostmigration
// Params 0
// Checksum 0x80f724d1, Offset: 0x80
// Size: 0x4
function callback_prehostmigrationsave()
{
    
}

// Namespace hostmigration/hostmigration
// Params 0
// Checksum 0x8535c902, Offset: 0x90
// Size: 0x1e0
function callback_hostmigration()
{
    setslowmotion( 1, 1, 0 );
    level.hostmigrationreturnedplayercount = 0;
    
    if ( level.inprematchperiod )
    {
        level waittill( #"prematch_over" );
    }
    
    if ( level.gameended )
    {
        println( "<dev string:x38>" + gettime() + "<dev string:x56>" );
        return;
    }
    
    println( "<dev string:x38>" + gettime() );
    level.hostmigrationtimer = 1;
    sethostmigrationstatus( 1 );
    level notify( #"host_migration_begin" );
    thread locktimer();
    players = level.players;
    
    for ( i = 0; i < players.size ; i++ )
    {
        player = players[ i ];
        player thread hostmigrationtimerthink();
    }
    
    level endon( #"host_migration_begin" );
    hostmigrationwait();
    level.hostmigrationtimer = undefined;
    sethostmigrationstatus( 0 );
    println( "<dev string:x7f>" + gettime() );
    level notify( #"host_migration_end" );
}

