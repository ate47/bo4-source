#using scripts\core_common\util_shared;
#using scripts\zm\zm_office_zstandard;

#namespace zm_office_gamemodes;

// Namespace zm_office_gamemodes/level_finalizeinit
// Params 1, eflags: 0x40
// Checksum 0x6cb9f54d, Offset: 0x78
// Size: 0xe2
function event_handler[level_finalizeinit] main( eventstruct )
{
    if ( !isdefined( level.flag ) || !( isdefined( level.flag[ #"load_main_complete" ] ) && level.flag[ #"load_main_complete" ] ) )
    {
        level waittill( #"load_main_complete" );
    }
    
    gametype = hash( util::get_game_type() );
    
    switch ( gametype )
    {
        case #"zstandard":
            zm_office_zstandard::main();
            break;
    }
}

