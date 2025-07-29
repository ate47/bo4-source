#namespace ai_interface;

/#

    // Namespace ai_interface/ai_interface
    // Params 0, eflags: 0x2
    // Checksum 0x38936ac0, Offset: 0xb8
    // Size: 0x36, Type: dev
    function autoexec main()
    {
        level.__ai_debuginterface = getdvarint( #"ai_debuginterface", 0 );
    }

    // Namespace ai_interface/ai_interface
    // Params 3, eflags: 0x4
    // Checksum 0x57640758, Offset: 0xf8
    // Size: 0x32a, Type: dev
    function private _checkvalue( archetype, attributename, value )
    {
        attribute = level.__ai_interface[ archetype ][ attributename ];
        
        switch ( attribute[ #"type" ] )
        {
            case #"_interface_entity":
                break;
            case #"_interface_match":
                possiblevalues = attribute[ #"values" ];
                assert( !isarray( possiblevalues ) || isinarray( possiblevalues, value ), "<dev string:x38>" + value + "<dev string:x40>" + attributename + "<dev string:x75>" );
                break;
            case #"_interface_numeric":
                maxvalue = attribute[ #"max_value" ];
                minvalue = attribute[ #"min_value" ];
                assert( isint( value ) || isfloat( value ), "<dev string:x7a>" + attributename + "<dev string:x8c>" + value + "<dev string:xaf>" );
                assert( !isdefined( maxvalue ) && !isdefined( minvalue ) || value <= maxvalue && value >= minvalue, "<dev string:x38>" + value + "<dev string:xc5>" + minvalue + "<dev string:xeb>" + maxvalue + "<dev string:xef>" );
                break;
            case #"_interface_vector":
                if ( isdefined( value ) )
                {
                    assert( isvec( value ), "<dev string:x7a>" + attributename + "<dev string:xf4>" + value + "<dev string:xaf>" );
                }
                
                break;
            default:
                assert( "<dev string:x116>" + attribute[ #"type" ] + "<dev string:x138>" + attributename + "<dev string:x75>" );
                break;
        }
    }

    // Namespace ai_interface/ai_interface
    // Params 2, eflags: 0x4
    // Checksum 0xcc1f9c29, Offset: 0x430
    // Size: 0x314, Type: dev
    function private _checkprerequisites( entity, attribute )
    {
        if ( isdefined( level.__ai_debuginterface ) && level.__ai_debuginterface > 0 )
        {
            assert( isentity( entity ) || isstruct( entity ), "<dev string:x14c>" );
            assert( isactor( entity ) || isvehicle( entity ) || isstruct( entity ) || isbot( entity ), "<dev string:x17e>" );
            assert( isstring( attribute ), "<dev string:x1ba>" );
            assert( isarray( entity.__interface ), "<dev string:x1e5>" + function_9e72a96( entity.archetype ) + "<dev string:x1f3>" + "<dev string:x226>" );
            assert( isarray( level.__ai_interface ), "<dev string:x257>" );
            assert( isarray( level.__ai_interface[ entity.archetype ] ), "<dev string:x2a2>" + function_9e72a96( entity.archetype ) + "<dev string:x2c6>" );
            assert( isarray( level.__ai_interface[ entity.archetype ][ attribute ] ), "<dev string:x7a>" + attribute + "<dev string:x2e0>" + function_9e72a96( entity.archetype ) + "<dev string:x30c>" );
            assert( isstring( level.__ai_interface[ entity.archetype ][ attribute ][ #"type" ] ), "<dev string:x315>" + attribute + "<dev string:x75>" );
        }
    }

    // Namespace ai_interface/ai_interface
    // Params 3, eflags: 0x4
    // Checksum 0x568ed2a5, Offset: 0x750
    // Size: 0xc4, Type: dev
    function private _checkregistrationprerequisites( archetype, attribute, callbackfunction )
    {
        assert( ishash( archetype ), "<dev string:x33d>" );
        assert( ishash( attribute ), "<dev string:x382>" );
        assert( !isdefined( callbackfunction ) || isfunctionptr( callbackfunction ), "<dev string:x3c7>" );
    }

#/

// Namespace ai_interface/ai_interface
// Params 1, eflags: 0x4
// Checksum 0xf36e74c5, Offset: 0x820
// Size: 0x52
function private _initializelevelinterface( archetype )
{
    if ( !isdefined( level.__ai_interface ) )
    {
        level.__ai_interface = [];
    }
    
    if ( !isdefined( level.__ai_interface[ archetype ] ) )
    {
        level.__ai_interface[ archetype ] = [];
    }
}

#namespace ai;

// Namespace ai/ai_interface
// Params 1
// Checksum 0xffd46be1, Offset: 0x880
// Size: 0x2a
function createinterfaceforentity( entity )
{
    if ( !isdefined( entity.__interface ) )
    {
        entity.__interface = [];
    }
}

// Namespace ai/ai_interface
// Params 2
// Checksum 0x165a3d0, Offset: 0x8b8
// Size: 0x8c
function getaiattribute( entity, attribute )
{
    /#
        ai_interface::_checkprerequisites( entity, attribute );
    #/
    
    if ( !isdefined( entity.__interface[ attribute ] ) )
    {
        return level.__ai_interface[ entity.archetype ][ attribute ][ #"default_value" ];
    }
    
    return entity.__interface[ attribute ];
}

// Namespace ai/ai_interface
// Params 2
// Checksum 0x209ea5aa, Offset: 0x950
// Size: 0x86, Type: bool
function hasaiattribute( entity, attribute )
{
    return isdefined( entity ) && isdefined( attribute ) && isdefined( entity.archetype ) && isdefined( level.__ai_interface ) && isdefined( level.__ai_interface[ entity.archetype ] ) && isdefined( level.__ai_interface[ entity.archetype ][ attribute ] );
}

// Namespace ai/ai_interface
// Params 4
// Checksum 0x5aeedb23, Offset: 0x9e0
// Size: 0x17c
function registerentityinterface( archetype, attribute, defaultvalue, callbackfunction )
{
    /#
        ai_interface::_checkregistrationprerequisites( archetype, attribute, callbackfunction );
    #/
    
    ai_interface::_initializelevelinterface( archetype );
    assert( !isdefined( level.__ai_interface[ archetype ][ attribute ] ), "<dev string:x38>" + attribute + "<dev string:x419>" + archetype + "<dev string:x443>" );
    level.__ai_interface[ archetype ][ attribute ] = [];
    level.__ai_interface[ archetype ][ attribute ][ #"callback" ] = callbackfunction;
    level.__ai_interface[ archetype ][ attribute ][ #"default_value" ] = defaultvalue;
    level.__ai_interface[ archetype ][ attribute ][ #"type" ] = "_interface_entity";
    
    /#
        ai_interface::_checkvalue( archetype, attribute, defaultvalue );
    #/
}

// Namespace ai/ai_interface
// Params 5
// Checksum 0x889e916d, Offset: 0xb68
// Size: 0x1f4
function registermatchedinterface( archetype, attribute, defaultvalue, possiblevalues, callbackfunction )
{
    /#
        ai_interface::_checkregistrationprerequisites( archetype, attribute, callbackfunction );
        assert( !isdefined( possiblevalues ) || isarray( possiblevalues ), "<dev string:x447>" );
    #/
    
    ai_interface::_initializelevelinterface( archetype );
    assert( !isdefined( level.__ai_interface[ archetype ][ attribute ] ), "<dev string:x38>" + attribute + "<dev string:x419>" + archetype + "<dev string:x443>" );
    level.__ai_interface[ archetype ][ attribute ] = [];
    level.__ai_interface[ archetype ][ attribute ][ #"callback" ] = callbackfunction;
    level.__ai_interface[ archetype ][ attribute ][ #"default_value" ] = defaultvalue;
    level.__ai_interface[ archetype ][ attribute ][ #"type" ] = "_interface_match";
    level.__ai_interface[ archetype ][ attribute ][ #"values" ] = possiblevalues;
    
    /#
        ai_interface::_checkvalue( archetype, attribute, defaultvalue );
    #/
}

// Namespace ai/ai_interface
// Params 6
// Checksum 0xc0361b74, Offset: 0xd68
// Size: 0x33c
function registernumericinterface( archetype, attribute, defaultvalue, minimum, maximum, callbackfunction )
{
    /#
        ai_interface::_checkregistrationprerequisites( archetype, attribute, callbackfunction );
        assert( !isdefined( minimum ) || isint( minimum ) || isfloat( minimum ), "<dev string:x48d>" );
        assert( !isdefined( maximum ) || isint( maximum ) || isfloat( maximum ), "<dev string:x4cd>" );
        assert( !isdefined( minimum ) && !isdefined( maximum ) || isdefined( minimum ) && isdefined( maximum ), "<dev string:x50d>" );
        assert( !isdefined( minimum ) && !isdefined( maximum ) || minimum <= maximum, "<dev string:x7a>" + attribute + "<dev string:x563>" + "<dev string:x58e>" );
    #/
    
    ai_interface::_initializelevelinterface( archetype );
    assert( !isdefined( level.__ai_interface[ archetype ][ attribute ] ), "<dev string:x38>" + attribute + "<dev string:x419>" + archetype + "<dev string:x443>" );
    level.__ai_interface[ archetype ][ attribute ] = [];
    level.__ai_interface[ archetype ][ attribute ][ #"callback" ] = callbackfunction;
    level.__ai_interface[ archetype ][ attribute ][ #"default_value" ] = defaultvalue;
    level.__ai_interface[ archetype ][ attribute ][ #"max_value" ] = maximum;
    level.__ai_interface[ archetype ][ attribute ][ #"min_value" ] = minimum;
    level.__ai_interface[ archetype ][ attribute ][ #"type" ] = "_interface_numeric";
    
    /#
        ai_interface::_checkvalue( archetype, attribute, defaultvalue );
    #/
}

// Namespace ai/ai_interface
// Params 4
// Checksum 0xb1c188e9, Offset: 0x10b0
// Size: 0x17c
function registervectorinterface( archetype, attribute, defaultvalue, callbackfunction )
{
    /#
        ai_interface::_checkregistrationprerequisites( archetype, attribute, callbackfunction );
    #/
    
    ai_interface::_initializelevelinterface( archetype );
    assert( !isdefined( level.__ai_interface[ archetype ][ attribute ] ), "<dev string:x38>" + attribute + "<dev string:x419>" + archetype + "<dev string:x443>" );
    level.__ai_interface[ archetype ][ attribute ] = [];
    level.__ai_interface[ archetype ][ attribute ][ #"callback" ] = callbackfunction;
    level.__ai_interface[ archetype ][ attribute ][ #"default_value" ] = defaultvalue;
    level.__ai_interface[ archetype ][ attribute ][ #"type" ] = "_interface_vector";
    
    /#
        ai_interface::_checkvalue( archetype, attribute, defaultvalue );
    #/
}

// Namespace ai/ai_interface
// Params 3
// Checksum 0x6fbdc64, Offset: 0x1238
// Size: 0x130
function setaiattribute( entity, attribute, value )
{
    /#
        ai_interface::_checkprerequisites( entity, attribute );
        ai_interface::_checkvalue( entity.archetype, attribute, value );
    #/
    
    oldvalue = entity.__interface[ attribute ];
    
    if ( !isdefined( oldvalue ) )
    {
        oldvalue = level.__ai_interface[ entity.archetype ][ attribute ][ #"default_value" ];
    }
    
    entity.__interface[ attribute ] = value;
    callback = level.__ai_interface[ entity.archetype ][ attribute ][ #"callback" ];
    
    if ( isfunctionptr( callback ) )
    {
        [[ callback ]]( entity, attribute, oldvalue, value );
    }
}

