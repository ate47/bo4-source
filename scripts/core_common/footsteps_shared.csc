#namespace footsteps;

// Namespace footsteps/footsteps_shared
// Params 0
// Checksum 0x3cf6d2ca, Offset: 0x68
// Size: 0x64
function missing_ai_footstep_callback()
{
    /#
        type = self.archetype;
        
        if ( !isdefined( type ) )
        {
            type = "<dev string:x38>";
        }
        
        println( "<dev string:x42>" + type + "<dev string:x53>" + self._aitype + "<dev string:xd9>" );
    #/
}

// Namespace footsteps/footsteps_shared
// Params 2
// Checksum 0x1ca85fdf, Offset: 0xd8
// Size: 0x8a
function registeraitypefootstepcb( archetype, callback )
{
    if ( !isdefined( level._footstepcbfuncs ) )
    {
        level._footstepcbfuncs = [];
    }
    
    assert( !isdefined( level._footstepcbfuncs[ archetype ] ), "<dev string:x109>" + archetype + "<dev string:x116>" );
    level._footstepcbfuncs[ archetype ] = callback;
}

// Namespace footsteps/footsteps_shared
// Params 5
// Checksum 0x4d61e290, Offset: 0x170
// Size: 0xe2
function playaifootstep( client_num, pos, surface, notetrack, bone )
{
    if ( !isdefined( self.archetype ) )
    {
        println( "<dev string:x145>" );
        footstepdoeverything();
        return;
    }
    
    if ( !isdefined( level._footstepcbfuncs ) || !isdefined( level._footstepcbfuncs[ self.archetype ] ) )
    {
        self missing_ai_footstep_callback();
        footstepdoeverything();
        return;
    }
    
    [[ level._footstepcbfuncs[ self.archetype ] ]]( client_num, pos, surface, notetrack, bone );
}

