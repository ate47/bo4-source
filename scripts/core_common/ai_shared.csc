#using scripts\core_common\util_shared;

#namespace ai_shared;

// Namespace ai_shared/ai_shared
// Params 0, eflags: 0x2
// Checksum 0x54b5d6f2, Offset: 0x78
// Size: 0x1e
function autoexec main()
{
    level._customactorcbfunc = &ai::spawned_callback;
}

#namespace ai;

// Namespace ai/ai_shared
// Params 2, eflags: 0x20 variadic
// Checksum 0x828ac357, Offset: 0xa0
// Size: 0x132
function add_ai_spawn_function( func_spawn, ... )
{
    if ( !isdefined( level.var_71b23817 ) )
    {
        level.var_71b23817 = [];
    }
    else if ( !isarray( level.var_71b23817 ) )
    {
        level.var_71b23817 = array( level.var_71b23817 );
    }
    
    var_e45a16f3 = { #func:func_spawn, #params:vararg };
    
    if ( !isdefined( level.var_71b23817 ) )
    {
        level.var_71b23817 = [];
    }
    else if ( !isarray( level.var_71b23817 ) )
    {
        level.var_71b23817 = array( level.var_71b23817 );
    }
    
    level.var_71b23817[ level.var_71b23817.size ] = var_e45a16f3;
}

// Namespace ai/ai_shared
// Params 1
// Checksum 0x218ced65, Offset: 0x1e0
// Size: 0xb2
function function_932006d1( func_spawn )
{
    if ( !isdefined( level.var_71b23817 ) )
    {
        return;
    }
    
    foreach ( var_e45a16f3 in level.var_71b23817 )
    {
        if ( var_e45a16f3.func == func_spawn )
        {
            arrayremovevalue( level.var_71b23817, var_e45a16f3 );
            return;
        }
    }
}

// Namespace ai/ai_shared
// Params 3, eflags: 0x20 variadic
// Checksum 0x607d5cb3, Offset: 0x2a0
// Size: 0x1e0
function add_archetype_spawn_function( str_archetype, func_spawn, ... )
{
    if ( !isdefined( level.var_c18b23c1 ) )
    {
        level.var_c18b23c1 = [];
    }
    else if ( !isarray( level.var_c18b23c1 ) )
    {
        level.var_c18b23c1 = array( level.var_c18b23c1 );
    }
    
    if ( !isdefined( level.var_c18b23c1[ str_archetype ] ) )
    {
        level.var_c18b23c1[ str_archetype ] = [];
    }
    else if ( !isarray( level.var_c18b23c1[ str_archetype ] ) )
    {
        level.var_c18b23c1[ str_archetype ] = array( level.var_c18b23c1[ str_archetype ] );
    }
    
    var_6d69c0bf = { #func:func_spawn, #params:vararg };
    
    if ( !isdefined( level.var_c18b23c1[ str_archetype ] ) )
    {
        level.var_c18b23c1[ str_archetype ] = [];
    }
    else if ( !isarray( level.var_c18b23c1[ str_archetype ] ) )
    {
        level.var_c18b23c1[ str_archetype ] = array( level.var_c18b23c1[ str_archetype ] );
    }
    
    level.var_c18b23c1[ str_archetype ][ level.var_c18b23c1[ str_archetype ].size ] = var_6d69c0bf;
}

// Namespace ai/ai_shared
// Params 1
// Checksum 0x9a071a8f, Offset: 0x488
// Size: 0x1d8
function spawned_callback( localclientnum )
{
    if ( isdefined( level.var_71b23817 ) )
    {
        foreach ( var_e45a16f3 in level.var_71b23817 )
        {
            a_args = arraycombine( array( localclientnum ), var_e45a16f3.params, 1, 0 );
            util::single_func_argarray( self, var_e45a16f3.func, a_args );
        }
    }
    
    if ( isdefined( level.var_c18b23c1 ) && isdefined( level.var_c18b23c1[ self.archetype ] ) )
    {
        foreach ( var_6d69c0bf in level.var_c18b23c1[ self.archetype ] )
        {
            a_args = arraycombine( array( localclientnum ), var_6d69c0bf.params, 1, 0 );
            util::single_func_argarray( self, var_6d69c0bf.func, a_args );
        }
    }
}

// Namespace ai/ai_shared
// Params 1
// Checksum 0xdb85145, Offset: 0x668
// Size: 0x52, Type: bool
function shouldregisterclientfieldforarchetype( archetype )
{
    if ( isdefined( level.clientfieldaicheck ) && level.clientfieldaicheck && !isarchetypeloaded( archetype ) )
    {
        return false;
    }
    
    return true;
}

// Namespace ai/ai_shared
// Params 0
// Checksum 0x3902e578, Offset: 0x6c8
// Size: 0xf4
function function_9139c839()
{
    if ( !isdefined( self.var_76167463 ) )
    {
        if ( isdefined( self.aisettingsbundle ) )
        {
            settingsbundle = self.aisettingsbundle;
        }
        else if ( isdefined( self.scriptbundlesettings ) )
        {
            settingsbundle = getscriptbundle( self.scriptbundlesettings ).aisettingsbundle;
        }
        
        if ( !isdefined( settingsbundle ) )
        {
            return undefined;
        }
        
        self.var_76167463 = settingsbundle;
        
        if ( !isdefined( level.var_e3a467cf ) )
        {
            level.var_e3a467cf = [];
        }
        
        if ( !isdefined( level.var_e3a467cf[ self.var_76167463 ] ) )
        {
            level.var_e3a467cf[ self.var_76167463 ] = getscriptbundle( self.var_76167463 );
        }
    }
    
    return level.var_e3a467cf[ self.var_76167463 ];
}

// Namespace ai/ai_shared
// Params 3
// Checksum 0xdb678341, Offset: 0x7c8
// Size: 0xda
function function_71919555( var_45302432, fieldname, archetype )
{
    if ( !isdefined( level.var_e3a467cf ) )
    {
        level.var_e3a467cf = [];
    }
    
    if ( !isdefined( level.var_e3a467cf[ var_45302432 ] ) )
    {
        level.var_e3a467cf[ var_45302432 ] = getscriptbundle( var_45302432 );
    }
    
    if ( isdefined( level.var_e3a467cf[ var_45302432 ] ) )
    {
        if ( isdefined( archetype ) )
        {
            return level.var_e3a467cf[ var_45302432 ].( archetype + "_" + fieldname );
        }
        
        return level.var_e3a467cf[ var_45302432 ].( fieldname );
    }
    
    return undefined;
}

