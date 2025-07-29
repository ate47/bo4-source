#namespace animationstatenetwork;

// Namespace animationstatenetwork/animation_state_machine_mocomp
// Params 0, eflags: 0x2
// Checksum 0x471e5283, Offset: 0xb0
// Size: 0x12
function autoexec initanimationmocomps()
{
    level._animationmocomps = [];
}

// Namespace animationstatenetwork/runanimationmocomp
// Params 1, eflags: 0x40
// Checksum 0x6d517fe6, Offset: 0xd0
// Size: 0x192
function event_handler[runanimationmocomp] runanimationmocomp( eventstruct )
{
    assert( eventstruct.status >= 0 && eventstruct.status <= 2, "<dev string:x38>" + eventstruct.status + "<dev string:x5a>" );
    assert( isdefined( level._animationmocomps[ eventstruct.name ] ), "<dev string:x75>" + eventstruct.name + "<dev string:x9b>" );
    
    if ( eventstruct.status == 0 )
    {
        eventstruct.status = "asm_mocomp_start";
    }
    else if ( eventstruct.status == 1 )
    {
        eventstruct.status = "asm_mocomp_update";
    }
    else
    {
        eventstruct.status = "asm_mocomp_terminate";
    }
    
    animationmocompresult = eventstruct.entity [[ level._animationmocomps[ eventstruct.name ][ eventstruct.status ] ]]( eventstruct.entity, eventstruct.delta_anim, eventstruct.blend_out_time, "", eventstruct.duration );
    return animationmocompresult;
}

// Namespace animationstatenetwork/animation_state_machine_mocomp
// Params 4
// Checksum 0x989a5922, Offset: 0x270
// Size: 0x258
function registeranimationmocomp( mocompname, startfuncptr, updatefuncptr, terminatefuncptr )
{
    mocompname = tolower( mocompname );
    assert( isstring( mocompname ), "<dev string:xaf>" );
    assert( !isdefined( level._animationmocomps[ mocompname ] ), "<dev string:xf0>" + mocompname + "<dev string:x104>" );
    level._animationmocomps[ mocompname ] = array();
    assert( isdefined( startfuncptr ) && isfunctionptr( startfuncptr ), "<dev string:x11e>" );
    level._animationmocomps[ mocompname ][ #"asm_mocomp_start" ] = startfuncptr;
    
    if ( isdefined( updatefuncptr ) )
    {
        assert( isfunctionptr( updatefuncptr ), "<dev string:x17d>" );
        level._animationmocomps[ mocompname ][ #"asm_mocomp_update" ] = updatefuncptr;
    }
    else
    {
        level._animationmocomps[ mocompname ][ #"asm_mocomp_update" ] = &animationmocompemptyfunc;
    }
    
    if ( isdefined( terminatefuncptr ) )
    {
        assert( isfunctionptr( terminatefuncptr ), "<dev string:x1d9>" );
        level._animationmocomps[ mocompname ][ #"asm_mocomp_terminate" ] = terminatefuncptr;
        return;
    }
    
    level._animationmocomps[ mocompname ][ #"asm_mocomp_terminate" ] = &animationmocompemptyfunc;
}

// Namespace animationstatenetwork/animation_state_machine_mocomp
// Params 5
// Checksum 0x1e41624b, Offset: 0x4d0
// Size: 0x2c
function animationmocompemptyfunc( entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration )
{
    
}

