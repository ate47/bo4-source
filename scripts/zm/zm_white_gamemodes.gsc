#using scripts\core_common\util_shared;
#using scripts\zm\zm_white_zstandard;

#namespace zm_white_gamemodes;

// Namespace zm_white_gamemodes/level_finalizeinit
// Params 1, eflags: 0x40
// Checksum 0xc94cee9, Offset: 0x78
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
            zm_white_zstandard::main();
            break;
    }
}

