#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;

#namespace mp_slums2_scripted;

// Namespace mp_slums2_scripted/mp_slums2_scripted
// Params 0, eflags: 0x2
// Checksum 0x883bbb7d, Offset: 0xb0
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"mp_slums2_scripted", &__init__, &__main__, undefined );
}

// Namespace mp_slums2_scripted/mp_slums2_scripted
// Params 0
// Checksum 0x66c9a1e3, Offset: 0x100
// Size: 0x24
function __init__()
{
    callback::on_game_playing( &on_game_playing );
}

// Namespace mp_slums2_scripted/mp_slums2_scripted
// Params 0
// Checksum 0x554c0eaf, Offset: 0x130
// Size: 0x2c
function __main__()
{
    /#
        init_devgui();
    #/
    
    function_2cdcf5c3();
}

// Namespace mp_slums2_scripted/mp_slums2_scripted
// Params 0
// Checksum 0x714a8d40, Offset: 0x168
// Size: 0x114
function on_game_playing()
{
    array::delete_all( getentarray( "sun_block", "targetname" ) );
    
    if ( !getdvarint( #"hash_14f8907ba73d8e4f", 1 ) )
    {
        return;
    }
    
    wait getdvarfloat( #"hash_68cf1e8e429452b0", 0 );
    
    if ( util::isfirstround() )
    {
        level scene::add_scene_func( #"p8_fxanim_mp_slu_cop_car_explosion_bundle", &function_33022f5b, "play" );
        level thread scene::play( #"p8_fxanim_mp_slu_cop_car_explosion_bundle" );
        level thread scene::play( #"p8_fxanim_mp_slu_car_powerline_bundle" );
    }
}

// Namespace mp_slums2_scripted/mp_slums2_scripted
// Params 0
// Checksum 0xcc7371b6, Offset: 0x288
// Size: 0x84
function function_2cdcf5c3()
{
    if ( !getdvarint( #"hash_14f8907ba73d8e4f", 1 ) )
    {
        return;
    }
    
    if ( !util::isfirstround() )
    {
        level thread scene::skipto_end( #"p8_fxanim_mp_slu_cop_car_explosion_bundle" );
        level thread scene::skipto_end( #"p8_fxanim_mp_slu_car_powerline_bundle" );
    }
}

// Namespace mp_slums2_scripted/mp_slums2_scripted
// Params 1
// Checksum 0xa5a03a1c, Offset: 0x318
// Size: 0x5c
function function_33022f5b( a_ents )
{
    if ( isdefined( a_ents[ #"prop 1" ] ) )
    {
        physicsexplosionsphere( a_ents[ #"prop 1" ].origin, 512, 1, 1 );
    }
}

/#

    // Namespace mp_slums2_scripted/mp_slums2_scripted
    // Params 0
    // Checksum 0xd63c732f, Offset: 0x380
    // Size: 0x9c, Type: dev
    function init_devgui()
    {
        mapname = util::get_map_name();
        adddebugcommand( "<dev string:x38>" + mapname + "<dev string:x48>" );
        adddebugcommand( "<dev string:x38>" + mapname + "<dev string:x87>" );
        adddebugcommand( "<dev string:x38>" + mapname + "<dev string:xc6>" );
    }

#/
