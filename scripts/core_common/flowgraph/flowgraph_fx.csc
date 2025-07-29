#using scripts\core_common\exploder_shared;
#using scripts\core_common\util_shared;

#namespace flowgraph_fx;

// Namespace flowgraph_fx/flowgraph_fx
// Params 6
// Checksum 0x73d06203, Offset: 0x78
// Size: 0x68, Type: bool
function playfxatposition( x, fx_effect, v_position, v_forward, v_up, i_time )
{
    playfx( self.owner.localclientnum, fx_effect, v_position, v_forward, v_up, i_time );
    return true;
}

// Namespace flowgraph_fx/flowgraph_fx
// Params 4
// Checksum 0xd92074cb, Offset: 0xe8
// Size: 0x50, Type: bool
function playfxontagfunc( x, e_entity, fx_effect, str_tagname )
{
    util::playfxontag( self.owner.localclientnum, fx_effect, e_entity, str_tagname );
    return true;
}

// Namespace flowgraph_fx/flowgraph_fx
// Params 6
// Checksum 0x6b2d59, Offset: 0x140
// Size: 0x68, Type: bool
function function_f4373d13( x, fx_effect, v_offset, v_forward, v_up, i_time )
{
    playfxoncamera( self.owner.localclientnum, fx_effect, v_offset, v_forward, v_up, i_time );
    return true;
}

#namespace namespace_84ba1809;

// Namespace namespace_84ba1809/flowgraph_fx
// Params 2
// Checksum 0x620cbd57, Offset: 0x1b0
// Size: 0x30, Type: bool
function playexploder( x, str_name )
{
    exploder::exploder( str_name );
    return true;
}

// Namespace namespace_84ba1809/flowgraph_fx
// Params 2
// Checksum 0xb094ff0, Offset: 0x1e8
// Size: 0x30, Type: bool
function stopexploder( x, str_name )
{
    exploder::stop_exploder( str_name );
    return true;
}

// Namespace namespace_84ba1809/flowgraph_fx
// Params 2
// Checksum 0x134114d3, Offset: 0x220
// Size: 0x30, Type: bool
function killexploder( x, str_name )
{
    exploder::kill_exploder( str_name );
    return true;
}

