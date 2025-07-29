#namespace map;

// Namespace map/map
// Params 0
// Checksum 0x752e8654, Offset: 0x68
// Size: 0x14
function init()
{
    get_script_bundle();
}

// Namespace map/map
// Params 0
// Checksum 0xc7700528, Offset: 0x88
// Size: 0x6e
function get_script_bundle()
{
    if ( !isdefined( level.var_427d6976 ) )
    {
        level.var_427d6976 = function_2717b55f();
    }
    
    if ( !isdefined( level.var_427d6976 ) )
    {
        level.var_179eaba8 = 1;
        level.var_427d6976 = {};
    }
    else
    {
        level.var_179eaba8 = 0;
    }
    
    return level.var_427d6976;
}

// Namespace map/map
// Params 0
// Checksum 0x921a99bf, Offset: 0x100
// Size: 0x2a
function is_default()
{
    if ( !isdefined( level.var_179eaba8 ) )
    {
        level.var_179eaba8 = 1;
    }
    
    return level.var_179eaba8;
}

