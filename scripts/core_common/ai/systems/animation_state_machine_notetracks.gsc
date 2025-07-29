#namespace animationstatenetwork;

// Namespace animationstatenetwork/animation_state_machine_notetracks
// Params 0, eflags: 0x2
// Checksum 0x353c801f, Offset: 0x68
// Size: 0x12
function autoexec initnotetrackhandler()
{
    level._notetrack_handler = [];
}

// Namespace animationstatenetwork/runnotetrackhandler
// Params 1, eflags: 0x44
// Checksum 0x95594d17, Offset: 0x88
// Size: 0x96
function private event_handler[runnotetrackhandler] runnotetrackhandler( eventstruct )
{
    assert( isarray( eventstruct.notetracks ) );
    
    for ( index = 0; index < eventstruct.notetracks.size ; index++ )
    {
        handlenotetrack( eventstruct.entity, eventstruct.notetracks[ index ] );
    }
}

// Namespace animationstatenetwork/animation_state_machine_notetracks
// Params 2, eflags: 0x4
// Checksum 0xc6ddb474, Offset: 0x128
// Size: 0x8c
function private handlenotetrack( entity, notetrack )
{
    notetrackhandler = level._notetrack_handler[ notetrack ];
    
    if ( !isdefined( notetrackhandler ) )
    {
        return;
    }
    
    if ( isfunctionptr( notetrackhandler ) )
    {
        [[ notetrackhandler ]]( entity );
        return;
    }
    
    entity setblackboardattribute( notetrackhandler.blackboardattributename, notetrackhandler.blackboardvalue );
}

// Namespace animationstatenetwork/animation_state_machine_notetracks
// Params 2
// Checksum 0x8abf809f, Offset: 0x1c0
// Size: 0xca
function registernotetrackhandlerfunction( notetrackname, notetrackfuncptr )
{
    assert( isstring( notetrackname ), "<dev string:x38>" );
    assert( isfunctionptr( notetrackfuncptr ), "<dev string:x73>" );
    assert( !isdefined( level._notetrack_handler[ notetrackname ] ), "<dev string:xbd>" + notetrackname + "<dev string:xe2>" );
    level._notetrack_handler[ notetrackname ] = notetrackfuncptr;
}

// Namespace animationstatenetwork/animation_state_machine_notetracks
// Params 3
// Checksum 0x76200bf7, Offset: 0x298
// Size: 0x6e
function registerblackboardnotetrackhandler( notetrackname, blackboardattributename, blackboardvalue )
{
    notetrackhandler = spawnstruct();
    notetrackhandler.blackboardattributename = blackboardattributename;
    notetrackhandler.blackboardvalue = blackboardvalue;
    level._notetrack_handler[ notetrackname ] = notetrackhandler;
}

