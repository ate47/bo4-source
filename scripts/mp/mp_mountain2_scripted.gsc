#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\mp_common\draft;

#namespace mp_mountain2_scripted;

// Namespace mp_mountain2_scripted/mp_mountain2_scripted
// Params 0, eflags: 0x2
// Checksum 0x31c5961b, Offset: 0xd0
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"mp_mountain2_scripted", &__init__, &__main__, undefined );
}

// Namespace mp_mountain2_scripted/mp_mountain2_scripted
// Params 0
// Checksum 0x7181033c, Offset: 0x120
// Size: 0x24
function __init__()
{
    callback::on_game_playing( &on_game_playing );
}

// Namespace mp_mountain2_scripted/mp_mountain2_scripted
// Params 0
// Checksum 0x7d3b3d93, Offset: 0x150
// Size: 0x34
function __main__()
{
    /#
        init_devgui();
    #/
    
    level thread function_2cdcf5c3();
}

// Namespace mp_mountain2_scripted/mp_mountain2_scripted
// Params 0
// Checksum 0x6b16757c, Offset: 0x190
// Size: 0x7c
function on_game_playing()
{
    array::delete_all( getentarray( "sun_block", "targetname" ) );
    
    if ( !getdvarint( #"hash_14f8907ba73d8e4f", 1 ) )
    {
        return;
    }
    
    exploder::stop_exploder( "fxexp_blizzard" );
}

// Namespace mp_mountain2_scripted/mp_mountain2_scripted
// Params 0
// Checksum 0xaf74f6e2, Offset: 0x218
// Size: 0xdc
function function_2cdcf5c3()
{
    if ( !getdvarint( #"hash_14f8907ba73d8e4f", 1 ) )
    {
        return;
    }
    
    if ( util::isfirstround() )
    {
        while ( !draft::function_d255fb3e() )
        {
            waitframe( 1 );
        }
        
        wait getdvarfloat( #"hash_142927c6a6db817c", 0 );
        exploder::exploder( "fxexp_blizzard" );
        return;
    }
    
    if ( math::cointoss() )
    {
        exploder::exploder( "fxexp_blizzard" );
    }
}

/#

    // Namespace mp_mountain2_scripted/mp_mountain2_scripted
    // Params 0
    // Checksum 0x39010d96, Offset: 0x300
    // Size: 0xc4, Type: dev
    function init_devgui()
    {
        mapname = util::get_map_name();
        adddebugcommand( "<dev string:x38>" + mapname + "<dev string:x48>" );
        adddebugcommand( "<dev string:x38>" + mapname + "<dev string:x87>" );
        adddebugcommand( "<dev string:x38>" + mapname + "<dev string:xc6>" );
        adddebugcommand( "<dev string:x38>" + mapname + "<dev string:x105>" );
    }

#/
