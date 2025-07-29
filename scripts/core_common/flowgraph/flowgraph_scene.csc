#using scripts\core_common\scene_shared;

#namespace flowgraph_scene;

// Namespace flowgraph_scene/flowgraph_scene
// Params 4
// Checksum 0x12330ec0, Offset: 0x70
// Size: 0x84
function playscenefunc( x, e_entity, sb_name, b_thread )
{
    target = e_entity;
    
    if ( !isdefined( target ) )
    {
        target = level;
    }
    
    if ( b_thread )
    {
        target thread scene::play( sb_name );
        return;
    }
    
    target scene::play( sb_name );
}

