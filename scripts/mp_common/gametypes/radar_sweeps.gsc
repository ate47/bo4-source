#using scripts\mp_common\gametypes\globallogic_audio;
#using scripts\mp_common\gametypes\globallogic_utils;

#namespace radar_sweeps;

// Namespace radar_sweeps/radar_sweeps
// Params 0
// Checksum 0xaa43f709, Offset: 0x98
// Size: 0x218
function radarsweeps()
{
    level endon( #"game_ended" );
    
    if ( !sessionmodeismultiplayergame() )
    {
        return;
    }
    
    level.var_f0eb9bca = getgametypesetting( #"hash_6aba2f652c6f4e07" );
    level.var_fdd4b16 = getgametypesetting( #"hash_926bf70c5a0d23b" );
    level.var_e4cfa0c3 = getgametypesetting( #"hash_3da025c068c34bcb" );
    
    while ( game.state !== "playing" )
    {
        wait 1;
    }
    
    if ( level.var_f0eb9bca )
    {
        while ( !level.var_fdd4b16 || float( globallogic_utils::gettimeremaining() ) / 1000 > level.var_e4cfa0c3 )
        {
            wait level.var_f0eb9bca;
            var_bc40925b = level.var_f0eb9bca > 10;
            thread doradarsweep( var_bc40925b );
        }
    }
    else if ( level.var_fdd4b16 )
    {
        while ( float( globallogic_utils::gettimeremaining() ) / 1000 > level.var_e4cfa0c3 )
        {
            wait 1;
        }
    }
    
    if ( level.var_fdd4b16 )
    {
        while ( game.state == "playing" )
        {
            wait level.var_fdd4b16;
            var_bc40925b = level.var_fdd4b16 > 10;
            thread doradarsweep();
        }
    }
}

// Namespace radar_sweeps/radar_sweeps
// Params 1, eflags: 0x4
// Checksum 0xce3dc8a, Offset: 0x2b8
// Size: 0x280
function private doradarsweep( var_bc40925b )
{
    if ( isdefined( var_bc40925b ) && globallogic_utils::gettimeremaining() > 10 )
    {
        thread globallogic_audio::leader_dialog( "bountyUAVSweep" );
    }
    
    if ( level.teambased )
    {
        setteamspyplane( #"allies", 1 );
        setteamspyplane( #"axis", 1 );
        wait 5;
        setteamspyplane( #"allies", 0 );
        setteamspyplane( #"axis", 0 );
        return;
    }
    
    foreach ( player in level.players )
    {
        player.pers[ #"hasradar" ] = 1;
        player.hasspyplane = 1;
        level.activeuavs[ player getentitynumber() ] = 1;
    }
    
    level notify( #"uav_update" );
    wait 5;
    
    foreach ( player in level.players )
    {
        player.pers[ #"hasradar" ] = 0;
        player.hasspyplane = 0;
        level.activeuavs[ player getentitynumber() ] = 0;
    }
    
    level notify( #"uav_update" );
}

