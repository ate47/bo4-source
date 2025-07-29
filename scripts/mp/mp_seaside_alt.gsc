#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\compass;
#using scripts\core_common\flag_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\util_shared;
#using scripts\mp\mp_seaside_alt_fx;
#using scripts\mp\mp_seaside_alt_sound;
#using scripts\mp_common\gametypes\globallogic_spawn;
#using scripts\mp_common\load;

#namespace mp_seaside_alt;

// Namespace mp_seaside_alt/level_init
// Params 1, eflags: 0x40
// Checksum 0x22348adf, Offset: 0xd8
// Size: 0x104
function event_handler[level_init] main( eventstruct )
{
    precache();
    callback::on_game_playing( &on_game_playing );
    mp_seaside_alt_fx::main();
    mp_seaside_alt_sound::main();
    
    /#
        init_devgui();
    #/
    
    load::main();
    compass::setupminimap( "" );
    level.cleandepositpoints = array( ( 56, -1016, 711 ), ( 1120, 288, 712 ), ( -499, -2437, 776 ), ( 775, -2820, 725 ) );
    function_2cdcf5c3();
}

// Namespace mp_seaside_alt/mp_seaside_alt
// Params 0
// Checksum 0x80f724d1, Offset: 0x1e8
// Size: 0x4
function precache()
{
    
}

// Namespace mp_seaside_alt/mp_seaside_alt
// Params 0
// Checksum 0x18dc1c56, Offset: 0x1f8
// Size: 0xb4
function on_game_playing()
{
    array::delete_all( getentarray( "sun_block", "targetname" ) );
    wait getdvarfloat( #"hash_205d729c5c415715", 0.3 );
    
    if ( util::isfirstround() )
    {
        if ( getdvarint( #"hash_1ee1f013d124a26a", 0 ) )
        {
            level thread scene::play( #"p8_fxanim_mp_seaside_tanks_bundle" );
        }
    }
}

// Namespace mp_seaside_alt/mp_seaside_alt
// Params 0
// Checksum 0xd1697204, Offset: 0x2b8
// Size: 0xa4
function function_2cdcf5c3()
{
    if ( util::isfirstround() )
    {
        if ( getdvarint( #"hash_1ee1f013d124a26a", 0 ) )
        {
            level scene::init( #"p8_fxanim_mp_seaside_tanks_bundle" );
        }
        
        return;
    }
    
    if ( getdvarint( #"hash_1ee1f013d124a26a", 0 ) )
    {
        level scene::skipto_end( #"p8_fxanim_mp_seaside_tanks_bundle" );
    }
}

/#

    // Namespace mp_seaside_alt/mp_seaside_alt
    // Params 0
    // Checksum 0x128cf976, Offset: 0x368
    // Size: 0x74, Type: dev
    function init_devgui()
    {
        mapname = util::get_map_name();
        adddebugcommand( "<dev string:x38>" + mapname + "<dev string:x48>" );
        adddebugcommand( "<dev string:x38>" + mapname + "<dev string:x89>" );
    }

#/
