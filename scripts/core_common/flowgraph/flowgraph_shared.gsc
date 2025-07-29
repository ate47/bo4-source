#using scripts\core_common\flowgraph\flowgraph_core;

#namespace flowgraph_logic;

// Namespace flowgraph_logic/flowgraph_shared
// Params 2
// Checksum 0x7490278d, Offset: 0x70
// Size: 0x2a
function iffunc( x, b )
{
    return array( b, !b );
}

// Namespace flowgraph_logic/flowgraph_shared
// Params 3
// Checksum 0x324f5964, Offset: 0xa8
// Size: 0x4a
function orfunc( x, b_a, b_b )
{
    return array( b_a || b_b, !( b_a || b_b ) );
}

// Namespace flowgraph_logic/flowgraph_shared
// Params 3
// Checksum 0xe3632b26, Offset: 0x100
// Size: 0x4a
function andfunc( x, b_a, b_b )
{
    return array( b_a && b_b, !( b_a && b_b ) );
}

// Namespace flowgraph_logic/flowgraph_shared
// Params 1
// Checksum 0x5ff4f140, Offset: 0x158
// Size: 0x12, Type: bool
function notfunc( b_value )
{
    return !b_value;
}

// Namespace flowgraph_logic/flowgraph_shared
// Params 2
// Checksum 0x553dcbd6, Offset: 0x178
// Size: 0x1e, Type: bool
function lessthan( var_a, var_b )
{
    return var_a < var_b;
}

// Namespace flowgraph_logic/flowgraph_shared
// Params 2
// Checksum 0x2cb19020, Offset: 0x1a0
// Size: 0x1e, Type: bool
function function_b457969e( var_a, var_b )
{
    return var_a <= var_b;
}

// Namespace flowgraph_logic/flowgraph_shared
// Params 2
// Checksum 0xaaf982b8, Offset: 0x1c8
// Size: 0x1e, Type: bool
function greaterthan( var_a, var_b )
{
    return var_a > var_b;
}

// Namespace flowgraph_logic/flowgraph_shared
// Params 2
// Checksum 0x3abae81a, Offset: 0x1f0
// Size: 0x1e, Type: bool
function function_3743e19e( var_a, var_b )
{
    return var_a >= var_b;
}

// Namespace flowgraph_logic/flowgraph_shared
// Params 2
// Checksum 0xd4accba1, Offset: 0x218
// Size: 0x1e, Type: bool
function equal( var_a, var_b )
{
    return var_a == var_b;
}

// Namespace flowgraph_logic/flowgraph_shared
// Params 3
// Checksum 0x7bc005ad, Offset: 0x240
// Size: 0xa4
function function_5cb6d7c8( x, b_1, b_2 )
{
    if ( isdefined( b_1 ) && b_1 )
    {
        self flowgraph::kick( array( undefined, 1, 0 ), 1 );
        return;
    }
    
    if ( isdefined( b_2 ) && b_2 )
    {
        self flowgraph::kick( array( undefined, 0, 1 ), 1 );
    }
}

// Namespace flowgraph_logic/flowgraph_shared
// Params 4
// Checksum 0x1ffb715c, Offset: 0x2f0
// Size: 0xfc
function function_4902305f( x, b_1, b_2, b_3 )
{
    if ( isdefined( b_1 ) && b_1 )
    {
        self flowgraph::kick( array( undefined, 1, 0, 0 ), 1 );
        return;
    }
    
    if ( isdefined( b_2 ) && b_2 )
    {
        self flowgraph::kick( array( undefined, 0, 1, 0 ), 1 );
        return;
    }
    
    if ( isdefined( b_3 ) && b_3 )
    {
        self flowgraph::kick( array( undefined, 0, 0, 1 ), 1 );
    }
}

// Namespace flowgraph_logic/flowgraph_shared
// Params 5
// Checksum 0x27850dce, Offset: 0x3f8
// Size: 0x14c
function function_3b225c4( x, b_1, b_2, b_3, b_4 )
{
    if ( isdefined( b_1 ) && b_1 )
    {
        self flowgraph::kick( array( undefined, 1, 0, 0, 0 ), 1 );
        return;
    }
    
    if ( isdefined( b_2 ) && b_2 )
    {
        self flowgraph::kick( array( undefined, 0, 1, 0, 0 ), 1 );
        return;
    }
    
    if ( isdefined( b_3 ) && b_3 )
    {
        self flowgraph::kick( array( undefined, 0, 0, 1, 0 ), 1 );
        return;
    }
    
    if ( isdefined( b_4 ) && b_4 )
    {
        self flowgraph::kick( array( undefined, 0, 0, 0, 1 ), 1 );
    }
}

// Namespace flowgraph_logic/flowgraph_shared
// Params 6
// Checksum 0x5acd9340, Offset: 0x550
// Size: 0x1bc
function function_f82f0ebe( x, b_1, b_2, b_3, b_4, b_5 )
{
    if ( isdefined( b_1 ) && b_1 )
    {
        self flowgraph::kick( array( undefined, 1, 0, 0, 0, 0 ), 1 );
        return;
    }
    
    if ( isdefined( b_2 ) && b_2 )
    {
        self flowgraph::kick( array( undefined, 0, 1, 0, 0, 0 ), 1 );
        return;
    }
    
    if ( isdefined( b_3 ) && b_3 )
    {
        self flowgraph::kick( array( undefined, 0, 0, 1, 0, 0 ), 1 );
        return;
    }
    
    if ( isdefined( b_4 ) && b_4 )
    {
        self flowgraph::kick( array( undefined, 0, 0, 0, 1, 0 ), 1 );
        return;
    }
    
    if ( isdefined( b_5 ) && b_5 )
    {
        self flowgraph::kick( array( undefined, 0, 0, 0, 0, 1 ), 1 );
    }
}

// Namespace flowgraph_logic/flowgraph_shared
// Params 7
// Checksum 0x4638364d, Offset: 0x718
// Size: 0x214
function function_3f431ce5( x, b_1, b_2, b_3, b_4, b_5, b_6 )
{
    if ( isdefined( b_1 ) && b_1 )
    {
        self flowgraph::kick( array( undefined, 1, 0, 0, 0, 0, 0 ), 1 );
        return;
    }
    
    if ( isdefined( b_2 ) && b_2 )
    {
        self flowgraph::kick( array( undefined, 0, 1, 0, 0, 0, 0 ), 1 );
        return;
    }
    
    if ( isdefined( b_3 ) && b_3 )
    {
        self flowgraph::kick( array( undefined, 0, 0, 1, 0, 0, 0 ), 1 );
        return;
    }
    
    if ( isdefined( b_4 ) && b_4 )
    {
        self flowgraph::kick( array( undefined, 0, 0, 0, 1, 0, 0 ), 1 );
        return;
    }
    
    if ( isdefined( b_5 ) && b_5 )
    {
        self flowgraph::kick( array( undefined, 0, 0, 0, 0, 1, 0 ), 1 );
        return;
    }
    
    if ( isdefined( b_6 ) && b_6 )
    {
        self flowgraph::kick( array( undefined, 0, 0, 0, 0, 0, 1 ), 1 );
    }
}

// Namespace flowgraph_logic/flowgraph_shared
// Params 8
// Checksum 0x23a76dd6, Offset: 0x938
// Size: 0x274
function function_2d817962( x, b_1, b_2, b_3, b_4, b_5, b_6, b_7 )
{
    if ( isdefined( b_1 ) && b_1 )
    {
        self flowgraph::kick( array( undefined, 1, 0, 0, 0, 0, 0, 0 ), 1 );
        return;
    }
    
    if ( isdefined( b_2 ) && b_2 )
    {
        self flowgraph::kick( array( undefined, 0, 1, 0, 0, 0, 0, 0 ), 1 );
        return;
    }
    
    if ( isdefined( b_3 ) && b_3 )
    {
        self flowgraph::kick( array( undefined, 0, 0, 1, 0, 0, 0, 0 ), 1 );
        return;
    }
    
    if ( isdefined( b_4 ) && b_4 )
    {
        self flowgraph::kick( array( undefined, 0, 0, 0, 1, 0, 0, 0 ), 1 );
        return;
    }
    
    if ( isdefined( b_5 ) && b_5 )
    {
        self flowgraph::kick( array( undefined, 0, 0, 0, 0, 1, 0, 0 ), 1 );
        return;
    }
    
    if ( isdefined( b_6 ) && b_6 )
    {
        self flowgraph::kick( array( undefined, 0, 0, 0, 0, 0, 1, 0 ), 1 );
        return;
    }
    
    if ( isdefined( b_7 ) && b_7 )
    {
        self flowgraph::kick( array( undefined, 0, 0, 0, 0, 0, 0, 1 ), 1 );
    }
}

// Namespace flowgraph_logic/flowgraph_shared
// Params 9
// Checksum 0xaccf1ea1, Offset: 0xbb8
// Size: 0x2cc
function function_c8fcb052( x, b_1, b_2, b_3, b_4, b_5, b_6, b_7, b_8 )
{
    if ( isdefined( b_1 ) && b_1 )
    {
        self flowgraph::kick( array( undefined, 1, 0, 0, 0, 0, 0, 0, 0 ), 1 );
        return;
    }
    
    if ( isdefined( b_2 ) && b_2 )
    {
        self flowgraph::kick( array( undefined, 0, 1, 0, 0, 0, 0, 0, 0 ), 1 );
        return;
    }
    
    if ( isdefined( b_3 ) && b_3 )
    {
        self flowgraph::kick( array( undefined, 0, 0, 1, 0, 0, 0, 0, 0 ), 1 );
        return;
    }
    
    if ( isdefined( b_4 ) && b_4 )
    {
        self flowgraph::kick( array( undefined, 0, 0, 0, 1, 0, 0, 0, 0 ), 1 );
        return;
    }
    
    if ( isdefined( b_5 ) && b_5 )
    {
        self flowgraph::kick( array( undefined, 0, 0, 0, 0, 1, 0, 0, 0 ), 1 );
        return;
    }
    
    if ( isdefined( b_6 ) && b_6 )
    {
        self flowgraph::kick( array( undefined, 0, 0, 0, 0, 0, 1, 0, 0 ), 1 );
        return;
    }
    
    if ( isdefined( b_7 ) && b_7 )
    {
        self flowgraph::kick( array( undefined, 0, 0, 0, 0, 0, 0, 1, 0 ), 1 );
        return;
    }
    
    if ( isdefined( b_8 ) && b_8 )
    {
        self flowgraph::kick( array( undefined, 0, 0, 0, 0, 0, 0, 0, 1 ), 1 );
    }
}

#namespace flowgraph_loops;

// Namespace flowgraph_loops/flowgraph_shared
// Params 3
// Checksum 0x5b97e4bc, Offset: 0xe90
// Size: 0x9e
function forloop( x, i_begin, i_end )
{
    i_step = 1;
    
    if ( i_end < i_begin )
    {
        i_step = -1;
    }
    
    i = i_begin;
    
    while ( i != i_end )
    {
        self flowgraph::kick( array( 1, i ), 1 );
        i += i_step;
    }
}

// Namespace flowgraph_loops/flowgraph_shared
// Params 2
// Checksum 0x80ccfb0a, Offset: 0xf38
// Size: 0xa0
function foreachloop( x, a_items )
{
    foreach ( item in a_items )
    {
        self flowgraph::kick( array( 1, item ), 1 );
    }
}

// Namespace flowgraph_loops/flowgraph_shared
// Params 2
// Checksum 0x3c062254, Offset: 0xfe0
// Size: 0x70
function whileloop( x, b_condition )
{
    while ( b_condition )
    {
        self flowgraph::kick( 1, 1 );
        inputs = self flowgraph::collect_inputs();
        b_condition = inputs[ 1 ];
    }
}

#namespace flowgraph_sequence;

// Namespace flowgraph_sequence/flowgraph_shared
// Params 1
// Checksum 0x964918d9, Offset: 0x1058
// Size: 0x6c
function sequence2( x )
{
    self flowgraph::kick( array( 1, 0 ), 1 );
    self flowgraph::kick( array( 0, 1 ), 1 );
}

// Namespace flowgraph_sequence/flowgraph_shared
// Params 1
// Checksum 0x31207b2a, Offset: 0x10d0
// Size: 0x9c
function sequence3( x )
{
    self flowgraph::kick( array( 1, 0, 0 ), 1 );
    self flowgraph::kick( array( 0, 1, 0 ), 1 );
    self flowgraph::kick( array( 0, 0, 1 ), 1 );
}

// Namespace flowgraph_sequence/flowgraph_shared
// Params 1
// Checksum 0x74426084, Offset: 0x1178
// Size: 0xcc
function sequence4( x )
{
    self flowgraph::kick( array( 1, 0, 0, 0 ), 1 );
    self flowgraph::kick( array( 0, 1, 0, 0 ), 1 );
    self flowgraph::kick( array( 0, 0, 1, 0 ), 1 );
    self flowgraph::kick( array( 0, 0, 0, 1 ), 1 );
}

// Namespace flowgraph_sequence/flowgraph_shared
// Params 1
// Checksum 0x7bc99f57, Offset: 0x1250
// Size: 0x124
function sequence5( x )
{
    self flowgraph::kick( array( 1, 0, 0, 0, 0 ), 1 );
    self flowgraph::kick( array( 0, 1, 0, 0, 0 ), 1 );
    self flowgraph::kick( array( 0, 0, 1, 0, 0 ), 1 );
    self flowgraph::kick( array( 0, 0, 0, 1, 0 ), 1 );
    self flowgraph::kick( array( 0, 0, 0, 0, 1 ), 1 );
}

// Namespace flowgraph_sequence/flowgraph_shared
// Params 1
// Checksum 0xe13a11ca, Offset: 0x1380
// Size: 0x15c
function sequence6( x )
{
    self flowgraph::kick( array( 1, 0, 0, 0, 0, 0 ), 1 );
    self flowgraph::kick( array( 0, 1, 0, 0, 0, 0 ), 1 );
    self flowgraph::kick( array( 0, 0, 1, 0, 0, 0 ), 1 );
    self flowgraph::kick( array( 0, 0, 0, 1, 0, 0 ), 1 );
    self flowgraph::kick( array( 0, 0, 0, 0, 1, 0 ), 1 );
    self flowgraph::kick( array( 0, 0, 0, 0, 0, 1 ), 1 );
}

// Namespace flowgraph_sequence/flowgraph_shared
// Params 1
// Checksum 0xc976cf00, Offset: 0x14e8
// Size: 0x194
function sequence7( x )
{
    self flowgraph::kick( array( 1, 0, 0, 0, 0, 0, 0 ), 1 );
    self flowgraph::kick( array( 0, 1, 0, 0, 0, 0, 0 ), 1 );
    self flowgraph::kick( array( 0, 0, 1, 0, 0, 0, 0 ), 1 );
    self flowgraph::kick( array( 0, 0, 0, 1, 0, 0, 0 ), 1 );
    self flowgraph::kick( array( 0, 0, 0, 0, 1, 0, 0 ), 1 );
    self flowgraph::kick( array( 0, 0, 0, 0, 0, 1, 0 ), 1 );
    self flowgraph::kick( array( 0, 0, 0, 0, 0, 0, 1 ), 1 );
}

// Namespace flowgraph_sequence/flowgraph_shared
// Params 1
// Checksum 0x6eb83876, Offset: 0x1688
// Size: 0x1cc
function sequence8( x )
{
    self flowgraph::kick( array( 1, 0, 0, 0, 0, 0, 0, 0 ), 1 );
    self flowgraph::kick( array( 0, 1, 0, 0, 0, 0, 0, 0 ), 1 );
    self flowgraph::kick( array( 0, 0, 1, 0, 0, 0, 0, 0 ), 1 );
    self flowgraph::kick( array( 0, 0, 0, 1, 0, 0, 0, 0 ), 1 );
    self flowgraph::kick( array( 0, 0, 0, 0, 1, 0, 0, 0 ), 1 );
    self flowgraph::kick( array( 0, 0, 0, 0, 0, 1, 0, 0 ), 1 );
    self flowgraph::kick( array( 0, 0, 0, 0, 0, 0, 1, 0 ), 1 );
    self flowgraph::kick( array( 0, 0, 0, 0, 0, 0, 0, 1 ), 1 );
}

#namespace flowgraph_util;

// Namespace flowgraph_util/flowgraph_shared
// Params 0
// Checksum 0x91a68037, Offset: 0x1860
// Size: 0x24, Type: bool
function onflowgraphrun()
{
    self.owner waittill( #"flowgraph_run" );
    return true;
}

// Namespace flowgraph_util/flowgraph_shared
// Params 2
// Checksum 0x3f69f6aa, Offset: 0x1890
// Size: 0x1e, Type: bool
function waitfunc( x, f_seconds )
{
    wait f_seconds;
    return true;
}

// Namespace flowgraph_util/flowgraph_shared
// Params 1
// Checksum 0x41293a8d, Offset: 0x18b8
// Size: 0x10, Type: bool
function createthread( x )
{
    return true;
}

#namespace flowgraph_random;

// Namespace flowgraph_random/flowgraph_shared
// Params 2
// Checksum 0xf707caa4, Offset: 0x18d0
// Size: 0x2a
function randomfloatinrangefunc( f_min, f_max )
{
    return randomfloatrange( f_min, f_max );
}

// Namespace flowgraph_random/flowgraph_shared
// Params 0
// Checksum 0x30c0bb98, Offset: 0x1908
// Size: 0x5a
function randomunitvector()
{
    return vectornormalize( ( randomfloat( 1 ), randomfloat( 1 ), randomfloat( 1 ) ) );
}

#namespace flowgraph_math;

// Namespace flowgraph_math/flowgraph_shared
// Params 2
// Checksum 0x10228c1c, Offset: 0x1970
// Size: 0x1e
function multiply( var_1, var_2 )
{
    return var_1 * var_1;
}

// Namespace flowgraph_math/flowgraph_shared
// Params 2
// Checksum 0x81fdc79e, Offset: 0x1998
// Size: 0x1e
function divide( var_1, var_2 )
{
    return var_1 / var_2;
}

// Namespace flowgraph_math/flowgraph_shared
// Params 2
// Checksum 0x7a8f746, Offset: 0x19c0
// Size: 0x1e
function add( var_1, var_2 )
{
    return var_1 + var_2;
}

// Namespace flowgraph_math/flowgraph_shared
// Params 2
// Checksum 0xef99f947, Offset: 0x19e8
// Size: 0x1e
function subtract( var_1, var_2 )
{
    return var_1 - var_2;
}

// Namespace flowgraph_math/flowgraph_shared
// Params 1
// Checksum 0x24997a0f, Offset: 0x1a10
// Size: 0x16
function negate( v )
{
    return v * -1;
}

// Namespace flowgraph_math/flowgraph_shared
// Params 2
// Checksum 0x9748beaf, Offset: 0x1a30
// Size: 0x2a
function vectordotfunc( v_1, v_2 )
{
    return vectordot( v_1, v_2 );
}

#namespace flowgraph_level;

// Namespace flowgraph_level/flowgraph_shared
// Params 1
// Checksum 0x10daa027, Offset: 0x1a68
// Size: 0x18
function function_35dc468d( str_field )
{
    return level.( str_field );
}

// Namespace flowgraph_level/flowgraph_shared
// Params 3
// Checksum 0x8354874b, Offset: 0x1a88
// Size: 0x32, Type: bool
function function_f9d5c4b0( x, str_field, var_value )
{
    level.( str_field ) = var_value;
    return true;
}

#namespace namespace_22752a75;

// Namespace namespace_22752a75/flowgraph_shared
// Params 1
// Checksum 0x747a4819, Offset: 0x1ac8
// Size: 0x10
function function_8892c7a6( i_value )
{
    return i_value;
}

// Namespace namespace_22752a75/flowgraph_shared
// Params 1
// Checksum 0x5d45ee8e, Offset: 0x1ae0
// Size: 0x10
function function_28c4ae67( f_value )
{
    return f_value;
}

// Namespace namespace_22752a75/flowgraph_shared
// Params 1
// Checksum 0xbe38dd53, Offset: 0x1af8
// Size: 0x10
function function_36bf9c6c( b_value )
{
    return b_value;
}

// Namespace namespace_22752a75/flowgraph_shared
// Params 1
// Checksum 0xf639f918, Offset: 0x1b10
// Size: 0x10
function function_fe4cf085( str_value )
{
    return str_value;
}

// Namespace namespace_22752a75/flowgraph_shared
// Params 1
// Checksum 0x9ba499dc, Offset: 0x1b28
// Size: 0x10
function function_3ece9d7e( h_value )
{
    return h_value;
}

// Namespace namespace_22752a75/flowgraph_shared
// Params 1
// Checksum 0x15ffcfe9, Offset: 0x1b40
// Size: 0x10
function function_68a5d644( ea_value )
{
    return ea_value;
}

// Namespace namespace_22752a75/flowgraph_shared
// Params 1
// Checksum 0x201b95d4, Offset: 0x1b58
// Size: 0x10
function vectorconstant( v_value )
{
    return v_value;
}

// Namespace namespace_22752a75/flowgraph_shared
// Params 1
// Checksum 0xce79f86d, Offset: 0x1b70
// Size: 0x10
function pathnodeconstant( var_f4af12cc )
{
    return var_f4af12cc;
}

// Namespace namespace_22752a75/flowgraph_shared
// Params 1
// Checksum 0x9ee27668, Offset: 0x1b88
// Size: 0x10
function function_9ef80b8b( e_value )
{
    return e_value;
}

// Namespace namespace_22752a75/flowgraph_shared
// Params 1
// Checksum 0x14f524a1, Offset: 0x1ba0
// Size: 0x10
function introduction_minigun( ai_value )
{
    return ai_value;
}

// Namespace namespace_22752a75/flowgraph_shared
// Params 1
// Checksum 0x2c9de1b7, Offset: 0x1bb8
// Size: 0x10
function function_513da14e( var_162b6305 )
{
    return var_162b6305;
}

// Namespace namespace_22752a75/flowgraph_shared
// Params 1
// Checksum 0x87ab9a1, Offset: 0x1bd0
// Size: 0x10
function function_7cbb60c3( sp_value )
{
    return sp_value;
}

// Namespace namespace_22752a75/flowgraph_shared
// Params 1
// Checksum 0xa29aee45, Offset: 0x1be8
// Size: 0x10
function function_f2357a4d( w_value )
{
    return w_value;
}

// Namespace namespace_22752a75/flowgraph_shared
// Params 1
// Checksum 0xa5b66cd3, Offset: 0x1c00
// Size: 0x10
function function_79f7d941( var_value )
{
    return var_value;
}

// Namespace namespace_22752a75/flowgraph_shared
// Params 1
// Checksum 0xe3c41dcf, Offset: 0x1c18
// Size: 0x10
function function_fdafe394( var_e477c3b )
{
    return var_e477c3b;
}

// Namespace namespace_22752a75/flowgraph_shared
// Params 1
// Checksum 0xf24812a7, Offset: 0x1c30
// Size: 0x10
function function_28848a6a( mdl_value )
{
    return mdl_value;
}

// Namespace namespace_22752a75/flowgraph_shared
// Params 1
// Checksum 0xe83a2a81, Offset: 0x1c48
// Size: 0x10
function function_8f5a9b3e( fx_value )
{
    return fx_value;
}

// Namespace namespace_22752a75/flowgraph_shared
// Params 1
// Checksum 0xc66feefe, Offset: 0x1c60
// Size: 0x10
function function_a5f771ce( var_e0bddaf5 )
{
    return var_e0bddaf5;
}

// Namespace namespace_22752a75/flowgraph_shared
// Params 1
// Checksum 0x5d3bbaf0, Offset: 0x1c78
// Size: 0x10
function function_527fa489( var_5ab747e5 )
{
    return var_5ab747e5;
}

