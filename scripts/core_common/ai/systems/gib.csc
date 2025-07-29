#using scripts\core_common\clientfield_shared;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;

#namespace gibclientutils;

// Namespace gibclientutils/gib
// Params 0, eflags: 0x2
// Checksum 0xab3427a1, Offset: 0x228
// Size: 0xbc
function autoexec main()
{
    clientfield::register( "actor", "gib_state", 1, 9, "int", &_gibhandler, 0, 0 );
    clientfield::register( "playercorpse", "gib_state", 1, 15, "int", &_gibhandler, 0, 0 );
    level.var_ad0f5efa = [];
    level thread _annihilatecorpse();
}

// Namespace gibclientutils/gib
// Params 1, eflags: 0x4
// Checksum 0xe7027f20, Offset: 0x2f0
// Size: 0x306
function private function_3aa023f1( name )
{
    if ( !isdefined( name ) )
    {
        return undefined;
    }
    
    gibdef = level.var_ad0f5efa[ name ];
    
    if ( isdefined( gibdef ) )
    {
        return gibdef;
    }
    
    definition = struct::get_script_bundle( "gibcharacterdef", name );
    
    if ( !isdefined( definition ) )
    {
        assertmsg( "<dev string:x38>" + name );
        return undefined;
    }
    
    gibpiecelookup = [];
    gibpiecelookup[ 2 ] = "annihilate";
    gibpiecelookup[ 8 ] = "head";
    gibpiecelookup[ 16 ] = "rightarm";
    gibpiecelookup[ 32 ] = "leftarm";
    gibpiecelookup[ 128 ] = "rightleg";
    gibpiecelookup[ 256 ] = "leftleg";
    gibpieces = [];
    
    foreach ( gibflag, gibpiece in gibpiecelookup )
    {
        if ( !isdefined( gibpiece ) )
        {
            assertmsg( "<dev string:x58>" + gibflag );
            continue;
        }
        
        gibstruct = spawnstruct();
        gibstruct.gibmodel = definition.( gibpiece + "_gibmodel" );
        gibstruct.gibtag = definition.( gibpiece + "_gibtag" );
        gibstruct.gibfx = definition.( gibpiece + "_gibfx" );
        gibstruct.gibfxtag = definition.( gibpiece + "_gibeffecttag" );
        gibstruct.gibdynentfx = definition.( gibpiece + "_gibdynentfx" );
        gibstruct.var_42c89fa1 = definition.( gibpiece + "_gibcinematicfx" );
        gibstruct.gibsound = definition.( gibpiece + "_gibsound" );
        gibstruct.gibhidetag = definition.( gibpiece + "_gibhidetag" );
        gibpieces[ gibflag ] = gibstruct;
    }
    
    level.var_ad0f5efa[ name ] = gibpieces;
    return gibpieces;
}

// Namespace gibclientutils/gib
// Params 2, eflags: 0x4
// Checksum 0x86ef1cf0, Offset: 0x600
// Size: 0x366
function private function_9fe14ca3( entity, gibflag )
{
    if ( gibflag == 8 )
    {
        part = "head";
    }
    else if ( gibflag == 16 || gibflag == 32 )
    {
        part = "arms";
    }
    else if ( gibflag == 128 || gibflag == 256 )
    {
        part = "legs";
    }
    
    if ( !isdefined( part ) )
    {
        return undefined;
    }
    
    name = entity getplayergibdef( part );
    
    if ( !isdefined( name ) )
    {
        assertmsg( "<dev string:x8a>" + gibflag );
        return undefined;
    }
    
    gibdef = level.var_ad0f5efa[ name ];
    
    if ( isdefined( gibdef ) )
    {
        return gibdef;
    }
    
    definition = struct::get_script_bundle( "playeroutfitgibdef", name );
    
    if ( !isdefined( definition ) )
    {
        assertmsg( "<dev string:x38>" + name );
        return undefined;
    }
    
    gibpiecelookup = [];
    gibpiecelookup[ 0 ] = "left";
    gibpiecelookup[ 1 ] = "right";
    gibpieces = [];
    
    foreach ( side, gibpiece in gibpiecelookup )
    {
        if ( !isdefined( gibpiece ) )
        {
            continue;
        }
        
        gibstruct = spawnstruct();
        gibstruct.gibmodel = definition.( gibpiece + "_gibmodel" );
        gibstruct.gibtag = definition.( gibpiece + "_gibtag" );
        gibstruct.gibfx = definition.( gibpiece + "_gibfx" );
        gibstruct.gibfxtag = definition.( gibpiece + "_gibeffecttag" );
        gibstruct.gibdynentfx = definition.( gibpiece + "_gibdynentfx" );
        gibstruct.var_42c89fa1 = definition.( gibpiece + "_gibcinematicfx" );
        gibstruct.gibsound = definition.( gibpiece + "_gibsound" );
        gibstruct.gibhidetag = definition.( gibpiece + "_gibhidetag" );
        gibpieces[ side ] = gibstruct;
    }
    
    level.var_ad0f5efa[ name ] = gibpieces;
    return gibpieces;
}

// Namespace gibclientutils/gib
// Params 2
// Checksum 0x4e90d68, Offset: 0x970
// Size: 0xba
function function_c0099e86( entity, gibflag )
{
    gibpiece = function_9fe14ca3( entity, gibflag );
    
    if ( !isdefined( gibpiece ) )
    {
        return undefined;
    }
    
    if ( gibflag == 8 )
    {
        side = 0;
    }
    else if ( gibflag == 16 || gibflag == 128 )
    {
        side = 1;
    }
    else if ( gibflag == 32 || gibflag == 256 )
    {
        side = 0;
    }
    
    return gibpiece[ side ];
}

// Namespace gibclientutils/gib
// Params 2, eflags: 0x4
// Checksum 0x1d780e81, Offset: 0xa38
// Size: 0xc8
function private function_69db754( entity, gibflag )
{
    if ( isplayer( entity ) || entity isplayercorpse() )
    {
        return function_c0099e86( entity, gibflag );
    }
    
    if ( isdefined( entity.gib_data ) )
    {
        gibpieces = function_3aa023f1( entity.gib_data.gibdef );
    }
    else
    {
        gibpieces = function_3aa023f1( entity.gibdef );
    }
    
    return gibpieces[ gibflag ];
}

// Namespace gibclientutils/gib
// Params 0, eflags: 0x4
// Checksum 0xbbb1e23, Offset: 0xb08
// Size: 0x240
function private _annihilatecorpse()
{
    while ( true )
    {
        waitresult = level waittill( #"corpse_explode" );
        localclientnum = waitresult.localclientnum;
        body = waitresult.body;
        origin = waitresult.position;
        
        if ( !util::is_mature() || util::is_gib_restricted_build() )
        {
            continue;
        }
        
        if ( isdefined( body ) && _hasgibdef( body ) && body isragdoll() )
        {
            cliententgibhead( localclientnum, body );
            cliententgibrightarm( localclientnum, body );
            cliententgibleftarm( localclientnum, body );
            cliententgibrightleg( localclientnum, body );
            cliententgibleftleg( localclientnum, body );
        }
        
        if ( isdefined( body ) && _hasgibdef( body ) && body.archetype == #"human" )
        {
            if ( randomint( 100 ) >= 50 )
            {
                continue;
            }
            
            if ( isdefined( origin ) && distancesquared( body.origin, origin ) <= 14400 )
            {
                body.ignoreragdoll = 1;
                body _gibentity( localclientnum, 50 | 384, 1 );
            }
        }
    }
}

// Namespace gibclientutils/gib
// Params 3, eflags: 0x4
// Checksum 0x77c28495, Offset: 0xd50
// Size: 0x1d6
function private _clonegibdata( localclientnum, entity, clone )
{
    clone.gib_data = spawnstruct();
    clone.gib_data.gib_state = entity.gib_state;
    clone.gib_data.gibdef = entity.gibdef;
    clone.gib_data.hatmodel = entity.hatmodel;
    clone.gib_data.head = entity.head;
    clone.gib_data.legdmg1 = entity.legdmg1;
    clone.gib_data.legdmg2 = entity.legdmg2;
    clone.gib_data.legdmg3 = entity.legdmg3;
    clone.gib_data.legdmg4 = entity.legdmg4;
    clone.gib_data.torsodmg1 = entity.torsodmg1;
    clone.gib_data.torsodmg2 = entity.torsodmg2;
    clone.gib_data.torsodmg3 = entity.torsodmg3;
    clone.gib_data.torsodmg4 = entity.torsodmg4;
    clone.gib_data.torsodmg5 = entity.torsodmg5;
}

// Namespace gibclientutils/gib
// Params 2, eflags: 0x4
// Checksum 0xc1cc393a, Offset: 0xf30
// Size: 0x76
function private _getgibbedstate( localclientnum, entity )
{
    if ( isdefined( entity.gib_data ) && isdefined( entity.gib_data.gib_state ) )
    {
        return entity.gib_data.gib_state;
    }
    else if ( isdefined( entity.gib_state ) )
    {
        return entity.gib_state;
    }
    
    return 0;
}

// Namespace gibclientutils/gib
// Params 2, eflags: 0x4
// Checksum 0xf7d34ae0, Offset: 0xfb0
// Size: 0x15a
function private _getgibbedlegmodel( localclientnum, entity )
{
    gibstate = _getgibbedstate( localclientnum, entity );
    rightleggibbed = gibstate & 128;
    leftleggibbed = gibstate & 256;
    
    if ( rightleggibbed && leftleggibbed )
    {
        return ( isdefined( entity.gib_data ) ? entity.gib_data.legdmg4 : entity.legdmg4 );
    }
    else if ( rightleggibbed )
    {
        return ( isdefined( entity.gib_data ) ? entity.gib_data.legdmg2 : entity.legdmg2 );
    }
    else if ( leftleggibbed )
    {
        return ( isdefined( entity.gib_data ) ? entity.gib_data.legdmg3 : entity.legdmg3 );
    }
    
    return isdefined( entity.gib_data ) ? entity.gib_data.legdmg1 : entity.legdmg1;
}

// Namespace gibclientutils/gib
// Params 3, eflags: 0x4
// Checksum 0xde24fdb6, Offset: 0x1118
// Size: 0xcc
function private _getgibextramodel( localclientnumm, entity, gibflag )
{
    if ( gibflag == 4 )
    {
        return ( isdefined( entity.gib_data ) ? entity.gib_data.hatmodel : entity.hatmodel );
    }
    
    if ( gibflag == 8 )
    {
        return ( isdefined( entity.gib_data ) ? entity.gib_data.head : entity.head );
    }
    
    assertmsg( "<dev string:xb0>" );
}

// Namespace gibclientutils/gib
// Params 2, eflags: 0x4
// Checksum 0x3df54ee8, Offset: 0x11f0
// Size: 0x15a
function private _getgibbedtorsomodel( localclientnum, entity )
{
    gibstate = _getgibbedstate( localclientnum, entity );
    rightarmgibbed = gibstate & 16;
    leftarmgibbed = gibstate & 32;
    
    if ( rightarmgibbed && leftarmgibbed )
    {
        return ( isdefined( entity.gib_data ) ? entity.gib_data.torsodmg2 : entity.torsodmg2 );
    }
    else if ( rightarmgibbed )
    {
        return ( isdefined( entity.gib_data ) ? entity.gib_data.torsodmg2 : entity.torsodmg2 );
    }
    else if ( leftarmgibbed )
    {
        return ( isdefined( entity.gib_data ) ? entity.gib_data.torsodmg3 : entity.torsodmg3 );
    }
    
    return isdefined( entity.gib_data ) ? entity.gib_data.torsodmg1 : entity.torsodmg1;
}

// Namespace gibclientutils/gib
// Params 3, eflags: 0x4
// Checksum 0x1db711c0, Offset: 0x1358
// Size: 0x74
function private _gibpiecetag( localclientnum, entity, gibflag )
{
    if ( !_hasgibdef( self ) )
    {
        return;
    }
    
    gibpiece = function_69db754( entity, gibflag );
    
    if ( isdefined( gibpiece ) )
    {
        return gibpiece.gibfxtag;
    }
}

// Namespace gibclientutils/gib
// Params 1, eflags: 0x4
// Checksum 0xc65f4ddd, Offset: 0x13d8
// Size: 0x72
function private function_ba120c50( gibflags )
{
    var_ec7623a6 = 0;
    
    if ( gibflags & 12 )
    {
        var_ec7623a6 |= 1;
    }
    
    if ( gibflags & 48 )
    {
        var_ec7623a6 |= 2;
    }
    
    if ( gibflags & 384 )
    {
        var_ec7623a6 |= 4;
    }
    
    return var_ec7623a6;
}

// Namespace gibclientutils/gib
// Params 3, eflags: 0x4
// Checksum 0x33af80c1, Offset: 0x1458
// Size: 0x42e
function private _gibentity( localclientnum, gibflags, shouldspawngibs )
{
    entity = self;
    
    if ( !_hasgibdef( entity ) )
    {
        return;
    }
    
    currentgibflag = 2;
    gibdir = undefined;
    gibdirscale = undefined;
    
    if ( isplayer( entity ) || entity isplayercorpse() )
    {
        yaw_bits = gibflags >> 9 & 8 - 1;
        yaw = getanglefrombits( yaw_bits, 3 );
        gibdir = anglestoforward( ( 0, yaw, 0 ) );
    }
    
    while ( gibflags >= currentgibflag )
    {
        if ( gibflags & currentgibflag )
        {
            if ( currentgibflag == 2 )
            {
                if ( isplayer( entity ) || entity isplayercorpse() )
                {
                    var_c0c9eae3 = entity function_4976d5ee();
                    _playgibfx( localclientnum, entity, var_c0c9eae3[ #"fx" ], var_c0c9eae3[ #"tag" ] );
                }
                else
                {
                    gibpiece = function_69db754( entity, currentgibflag );
                    
                    if ( isdefined( gibpiece ) )
                    {
                        _playgibfx( localclientnum, entity, gibpiece.gibfx, gibpiece.gibfxtag );
                        
                        if ( isdefined( gibpiece.var_42c89fa1 ) )
                        {
                            if ( function_92beaa28( localclientnum ) )
                            {
                                _playgibfx( localclientnum, entity, gibpiece.var_42c89fa1, gibpiece.gibfxtag );
                            }
                        }
                        
                        _playgibsound( localclientnum, entity, gibpiece.gibsound );
                    }
                }
                
                entity hide();
                entity.ignoreragdoll = 1;
            }
            else
            {
                gibpiece = function_69db754( entity, currentgibflag );
                
                if ( isdefined( gibpiece ) )
                {
                    if ( shouldspawngibs )
                    {
                        var_cd61eb7d = function_ba120c50( currentgibflag );
                        entity thread _gibpiece( localclientnum, entity, gibpiece.gibmodel, gibpiece.gibtag, gibpiece.gibdynentfx, gibdir, gibdirscale, var_cd61eb7d );
                    }
                    
                    _playgibfx( localclientnum, entity, gibpiece.gibfx, gibpiece.gibfxtag );
                    
                    if ( isdefined( gibpiece.var_42c89fa1 ) )
                    {
                        if ( function_92beaa28( localclientnum ) )
                        {
                            _playgibfx( localclientnum, entity, gibpiece.var_42c89fa1, gibpiece.gibfxtag );
                        }
                    }
                    
                    _playgibsound( localclientnum, entity, gibpiece.gibsound );
                }
            }
            
            _handlegibcallbacks( localclientnum, entity, currentgibflag );
        }
        
        currentgibflag <<= 1;
    }
}

// Namespace gibclientutils/gib
// Params 3, eflags: 0x4
// Checksum 0xc3a6c62, Offset: 0x1890
// Size: 0x8a
function private _setgibbed( localclientnum, entity, gibflag )
{
    gib_state = _getgibbedstate( localclientnum, entity ) | gibflag & 512 - 1;
    
    if ( isdefined( entity.gib_data ) )
    {
        entity.gib_data.gib_state = gib_state;
        return;
    }
    
    entity.gib_state = gib_state;
}

// Namespace gibclientutils/gib
// Params 3, eflags: 0x4
// Checksum 0xd321f4e, Offset: 0x1928
// Size: 0x1ac
function private _gibcliententityinternal( localclientnum, entity, gibflag )
{
    if ( !util::is_mature() || util::is_gib_restricted_build() )
    {
        return;
    }
    
    if ( !isdefined( entity ) || !_hasgibdef( entity ) )
    {
        return;
    }
    
    if ( entity.type !== "scriptmover" )
    {
        return;
    }
    
    if ( isgibbed( localclientnum, entity, gibflag ) )
    {
        return;
    }
    
    if ( !( _getgibbedstate( localclientnum, entity ) < 16 ) )
    {
        legmodel = _getgibbedlegmodel( localclientnum, entity );
        entity detach( legmodel, "" );
    }
    
    _setgibbed( localclientnum, entity, gibflag );
    entity setmodel( _getgibbedtorsomodel( localclientnum, entity ) );
    entity attach( _getgibbedlegmodel( localclientnum, entity ), "" );
    entity _gibentity( localclientnum, gibflag, 1 );
}

// Namespace gibclientutils/gib
// Params 3, eflags: 0x4
// Checksum 0x1e21ce29, Offset: 0x1ae0
// Size: 0x1dc
function private _gibclientextrainternal( localclientnum, entity, gibflag )
{
    if ( !util::is_mature() || util::is_gib_restricted_build() )
    {
        return;
    }
    
    if ( !isdefined( entity ) )
    {
        return;
    }
    
    if ( entity.type !== "scriptmover" )
    {
        return;
    }
    
    if ( isgibbed( localclientnum, entity, gibflag ) )
    {
        return;
    }
    
    gibmodel = _getgibextramodel( localclientnum, entity, gibflag );
    
    if ( isdefined( gibmodel ) && entity isattached( gibmodel, "" ) )
    {
        entity detach( gibmodel, "" );
    }
    
    if ( gibflag == 8 )
    {
        if ( isdefined( isdefined( entity.gib_data ) ? entity.gib_data.torsodmg5 : entity.torsodmg5 ) )
        {
            entity attach( isdefined( entity.gib_data ) ? entity.gib_data.torsodmg5 : entity.torsodmg5, "" );
        }
    }
    
    _setgibbed( localclientnum, entity, gibflag );
    entity _gibentity( localclientnum, gibflag, 1 );
}

// Namespace gibclientutils/gib
// Params 7, eflags: 0x4
// Checksum 0xbf43390b, Offset: 0x1cc8
// Size: 0x1b2
function private _gibhandler( localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump )
{
    entity = self;
    
    if ( isplayer( entity ) || entity isplayercorpse() )
    {
        if ( !util::is_mature() || util::is_gib_restricted_build() )
        {
            return;
        }
    }
    else
    {
        if ( isdefined( entity.maturegib ) && entity.maturegib && ( !util::is_mature() || !isshowgibsenabled() ) )
        {
            return;
        }
        
        if ( isdefined( entity.restrictedgib ) && entity.restrictedgib && !isshowgibsenabled() )
        {
            return;
        }
    }
    
    gibflags = oldvalue ^ newvalue;
    shouldspawngibs = !( newvalue & 1 );
    
    if ( bnewent )
    {
        gibflags = 0 ^ newvalue;
    }
    
    entity _gibentity( localclientnum, gibflags, shouldspawngibs );
    entity.gib_state = newvalue;
}

// Namespace gibclientutils/gib
// Params 8
// Checksum 0x12173cb7, Offset: 0x1e88
// Size: 0x34c
function _gibpiece( localclientnum, entity, gibmodel, gibtag, gibfx, gibdir, gibdirscale, var_bf41adc0 )
{
    if ( !isdefined( gibtag ) || !isdefined( gibmodel ) )
    {
        return;
    }
    
    startposition = entity gettagorigin( gibtag );
    startangles = entity gettagangles( gibtag );
    endposition = startposition;
    endangles = startangles;
    forwardvector = undefined;
    
    if ( !isdefined( startposition ) || !isdefined( startangles ) )
    {
        return 0;
    }
    
    if ( isdefined( gibdir ) && !isdefined( gibdirscale ) )
    {
        startposition = ( 0, 0, 0 );
        forwardvector = gibdir;
        forwardvector *= randomfloatrange( 100, 500 );
    }
    else
    {
        waitframe( 1 );
        
        if ( isdefined( entity ) )
        {
            endposition = entity gettagorigin( gibtag );
            endangles = entity gettagangles( gibtag );
        }
        else
        {
            endposition = startposition + anglestoforward( startangles ) * 10;
            endangles = startangles;
        }
        
        if ( !isdefined( endposition ) || !isdefined( endangles ) )
        {
            return 0;
        }
        
        scale = randomfloatrange( 0.6, 1 );
        dir = ( randomfloatrange( 0, 0.2 ), randomfloatrange( 0, 0.2 ), randomfloatrange( 0.2, 0.7 ) );
        
        if ( isdefined( gibdir ) && isdefined( gibdirscale ) && gibdirscale > 0 )
        {
            dir = gibdir + dir;
            scale = gibdirscale;
        }
        
        forwardvector = vectornormalize( endposition - startposition );
        forwardvector *= scale;
        forwardvector += dir;
    }
    
    if ( isdefined( entity ) )
    {
        gibentity = createdynentandlaunch( localclientnum, gibmodel, endposition, endangles, startposition, forwardvector, gibfx, 1, !( isdefined( level.var_2f78f66c ) && level.var_2f78f66c ) );
        
        if ( isdefined( gibentity ) )
        {
            setdynentbodyrenderoptionspacked( gibentity, entity getbodyrenderoptionspacked(), var_bf41adc0 );
        }
    }
}

// Namespace gibclientutils/gib
// Params 3, eflags: 0x4
// Checksum 0x70a0c52c, Offset: 0x21e0
// Size: 0xc4
function private _handlegibcallbacks( localclientnum, entity, gibflag )
{
    if ( isdefined( entity._gibcallbacks ) && isdefined( entity._gibcallbacks[ gibflag ] ) )
    {
        foreach ( callback in entity._gibcallbacks[ gibflag ] )
        {
            [[ callback ]]( localclientnum, entity, gibflag );
        }
    }
}

// Namespace gibclientutils/gib
// Params 1, eflags: 0x4
// Checksum 0xa2335ca1, Offset: 0x22b0
// Size: 0x7c
function private _handlegibannihilate( localclientnum )
{
    entity = self;
    entity endon( #"death" );
    entity waittillmatch( { #notetrack:"gib_annihilate" }, #"_anim_notify_" );
    cliententgibannihilate( localclientnum, entity );
}

// Namespace gibclientutils/gib
// Params 1, eflags: 0x4
// Checksum 0xcc7f78cf, Offset: 0x2338
// Size: 0x7c
function private _handlegibhead( localclientnum )
{
    entity = self;
    entity endon( #"death" );
    entity waittillmatch( { #notetrack:"gib = \"head\"" }, #"_anim_notify_" );
    cliententgibhead( localclientnum, entity );
}

// Namespace gibclientutils/gib
// Params 1, eflags: 0x4
// Checksum 0xdf41fe5c, Offset: 0x23c0
// Size: 0x7c
function private _handlegibrightarm( localclientnum )
{
    entity = self;
    entity endon( #"death" );
    entity waittillmatch( { #notetrack:"gib = \"arm_right\"" }, #"_anim_notify_" );
    cliententgibrightarm( localclientnum, entity );
}

// Namespace gibclientutils/gib
// Params 1, eflags: 0x4
// Checksum 0xa7949fe5, Offset: 0x2448
// Size: 0x7c
function private _handlegibleftarm( localclientnum )
{
    entity = self;
    entity endon( #"death" );
    entity waittillmatch( { #notetrack:"gib = \"arm_left\"" }, #"_anim_notify_" );
    cliententgibleftarm( localclientnum, entity );
}

// Namespace gibclientutils/gib
// Params 1, eflags: 0x4
// Checksum 0xff595c34, Offset: 0x24d0
// Size: 0x7c
function private _handlegibrightleg( localclientnum )
{
    entity = self;
    entity endon( #"death" );
    entity waittillmatch( { #notetrack:"gib = \"leg_right\"" }, #"_anim_notify_" );
    cliententgibrightleg( localclientnum, entity );
}

// Namespace gibclientutils/gib
// Params 1, eflags: 0x4
// Checksum 0xb40db692, Offset: 0x2558
// Size: 0x7c
function private _handlegibleftleg( localclientnum )
{
    entity = self;
    entity endon( #"death" );
    entity waittillmatch( { #notetrack:"gib = \"leg_left\"" }, #"_anim_notify_" );
    cliententgibleftleg( localclientnum, entity );
}

// Namespace gibclientutils/gib
// Params 1, eflags: 0x4
// Checksum 0x3c3641f4, Offset: 0x25e0
// Size: 0x88, Type: bool
function private _hasgibdef( entity )
{
    return isdefined( entity.gib_data ) && isdefined( entity.gib_data.gibdef ) || isdefined( entity.gibdef ) || isdefined( entity getplayergibdef( "arms" ) ) && isdefined( entity getplayergibdef( "legs" ) );
}

// Namespace gibclientutils/gib
// Params 4
// Checksum 0xd2317f83, Offset: 0x2670
// Size: 0x102
function _playgibfx( localclientnum, entity, fxfilename, fxtag )
{
    if ( isdefined( fxfilename ) && isdefined( fxtag ) && entity hasdobj( localclientnum ) )
    {
        fx = util::playfxontag( localclientnum, fxfilename, entity, fxtag );
        
        if ( isdefined( fx ) )
        {
            if ( isdefined( entity.team ) )
            {
                setfxteam( localclientnum, fx, entity.team );
            }
            
            if ( isdefined( level.setgibfxtoignorepause ) && level.setgibfxtoignorepause )
            {
                setfxignorepause( localclientnum, fx, 1 );
            }
        }
        
        return fx;
    }
}

// Namespace gibclientutils/gib
// Params 3
// Checksum 0x5a68a21b, Offset: 0x2780
// Size: 0x44
function _playgibsound( localclientnum, entity, soundalias )
{
    if ( isdefined( soundalias ) )
    {
        playsound( localclientnum, soundalias, entity.origin );
    }
}

// Namespace gibclientutils/gib
// Params 4
// Checksum 0x922b322, Offset: 0x27d0
// Size: 0xde
function addgibcallback( localclientnum, entity, gibflag, callbackfunction )
{
    assert( isfunctionptr( callbackfunction ) );
    
    if ( !isdefined( entity._gibcallbacks ) )
    {
        entity._gibcallbacks = [];
    }
    
    if ( !isdefined( entity._gibcallbacks[ gibflag ] ) )
    {
        entity._gibcallbacks[ gibflag ] = [];
    }
    
    gibcallbacks = entity._gibcallbacks[ gibflag ];
    gibcallbacks[ gibcallbacks.size ] = callbackfunction;
    entity._gibcallbacks[ gibflag ] = gibcallbacks;
}

// Namespace gibclientutils/gib
// Params 2
// Checksum 0x2db5eade, Offset: 0x28b8
// Size: 0x7c
function cliententgibannihilate( localclientnum, entity )
{
    if ( !util::is_mature() || util::is_gib_restricted_build() )
    {
        return;
    }
    
    entity.ignoreragdoll = 1;
    entity _gibentity( localclientnum, 50 | 384, 1 );
}

// Namespace gibclientutils/gib
// Params 2
// Checksum 0xf6d35110, Offset: 0x2940
// Size: 0x34
function cliententgibhead( localclientnum, entity )
{
    _gibclientextrainternal( localclientnum, entity, 8 );
}

// Namespace gibclientutils/gib
// Params 2
// Checksum 0xb45e9ef4, Offset: 0x2980
// Size: 0x54
function cliententgibleftarm( localclientnum, entity )
{
    if ( isgibbed( localclientnum, entity, 16 ) )
    {
        return;
    }
    
    _gibcliententityinternal( localclientnum, entity, 32 );
}

// Namespace gibclientutils/gib
// Params 2
// Checksum 0x2a123c72, Offset: 0x29e0
// Size: 0x54
function cliententgibrightarm( localclientnum, entity )
{
    if ( isgibbed( localclientnum, entity, 32 ) )
    {
        return;
    }
    
    _gibcliententityinternal( localclientnum, entity, 16 );
}

// Namespace gibclientutils/gib
// Params 2
// Checksum 0x54b5280c, Offset: 0x2a40
// Size: 0x34
function cliententgibleftleg( localclientnum, entity )
{
    _gibcliententityinternal( localclientnum, entity, 256 );
}

// Namespace gibclientutils/gib
// Params 2
// Checksum 0xf366d8dc, Offset: 0x2a80
// Size: 0x34
function cliententgibrightleg( localclientnum, entity )
{
    _gibcliententityinternal( localclientnum, entity, 128 );
}

// Namespace gibclientutils/gib
// Params 2
// Checksum 0xcef493e9, Offset: 0x2ac0
// Size: 0x330
function createscriptmodelofentity( localclientnum, entity )
{
    clone = spawn( localclientnum, entity.origin, "script_model" );
    clone.angles = entity.angles;
    _clonegibdata( localclientnum, entity, clone );
    gibstate = _getgibbedstate( localclientnum, clone );
    
    if ( !util::is_mature() || util::is_gib_restricted_build() )
    {
        gibstate = 0;
    }
    
    if ( !( _getgibbedstate( localclientnum, entity ) < 16 ) )
    {
        clone setmodel( _getgibbedtorsomodel( localclientnum, entity ) );
        clone attach( _getgibbedlegmodel( localclientnum, entity ), "" );
    }
    else
    {
        clone setmodel( entity.model );
    }
    
    if ( gibstate & 8 )
    {
        if ( isdefined( isdefined( clone.gib_data ) ? clone.gib_data.torsodmg5 : clone.torsodmg5 ) )
        {
            clone attach( isdefined( clone.gib_data ) ? clone.gib_data.torsodmg5 : clone.torsodmg5, "" );
        }
    }
    else
    {
        if ( isdefined( isdefined( clone.gib_data ) ? clone.gib_data.head : clone.head ) )
        {
            clone attach( isdefined( clone.gib_data ) ? clone.gib_data.head : clone.head, "" );
        }
        
        if ( !( gibstate & 4 ) && isdefined( isdefined( clone.gib_data ) ? clone.gib_data.hatmodel : clone.hatmodel ) )
        {
            clone attach( isdefined( clone.gib_data ) ? clone.gib_data.hatmodel : clone.hatmodel, "" );
        }
    }
    
    return clone;
}

// Namespace gibclientutils/gib
// Params 3
// Checksum 0x8798f384, Offset: 0x2df8
// Size: 0x38
function isgibbed( localclientnum, entity, gibflag )
{
    return _getgibbedstate( localclientnum, entity ) & gibflag;
}

// Namespace gibclientutils/gib
// Params 2
// Checksum 0xf72246d9, Offset: 0x2e38
// Size: 0x2e, Type: bool
function isundamaged( localclientnum, entity )
{
    return _getgibbedstate( localclientnum, entity ) == 0;
}

// Namespace gibclientutils/gib
// Params 2
// Checksum 0x38b8c3a9, Offset: 0x2e70
// Size: 0x66
function gibentity( localclientnum, gibflags )
{
    self _gibentity( localclientnum, gibflags, 1 );
    self.gib_state = _getgibbedstate( localclientnum, self ) | gibflags & 512 - 1;
}

// Namespace gibclientutils/gib
// Params 1
// Checksum 0xbb905f6f, Offset: 0x2ee0
// Size: 0xac
function handlegibnotetracks( localclientnum )
{
    entity = self;
    entity thread _handlegibannihilate( localclientnum );
    entity thread _handlegibhead( localclientnum );
    entity thread _handlegibrightarm( localclientnum );
    entity thread _handlegibleftarm( localclientnum );
    entity thread _handlegibrightleg( localclientnum );
    entity thread _handlegibleftleg( localclientnum );
}

// Namespace gibclientutils/gib
// Params 1
// Checksum 0xb8d783e4, Offset: 0x2f98
// Size: 0x2c
function playergibleftarm( localclientnum )
{
    self gibentity( localclientnum, 32 );
}

// Namespace gibclientutils/gib
// Params 1
// Checksum 0x30e5f3dd, Offset: 0x2fd0
// Size: 0x2c
function playergibrightarm( localclientnum )
{
    self gibentity( localclientnum, 16 );
}

// Namespace gibclientutils/gib
// Params 1
// Checksum 0xf4a090cf, Offset: 0x3008
// Size: 0x2c
function playergibleftleg( localclientnum )
{
    self gibentity( localclientnum, 256 );
}

// Namespace gibclientutils/gib
// Params 1
// Checksum 0x8994bd1f, Offset: 0x3040
// Size: 0x2c
function playergibrightleg( localclientnum )
{
    self gibentity( localclientnum, 128 );
}

// Namespace gibclientutils/gib
// Params 1
// Checksum 0x54144a3c, Offset: 0x3078
// Size: 0x4c
function playergiblegs( localclientnum )
{
    self gibentity( localclientnum, 128 );
    self gibentity( localclientnum, 256 );
}

// Namespace gibclientutils/gib
// Params 2
// Checksum 0x4bdf8577, Offset: 0x30d0
// Size: 0x2a
function playergibtag( localclientnum, gibflag )
{
    return _gibpiecetag( localclientnum, self, gibflag );
}

