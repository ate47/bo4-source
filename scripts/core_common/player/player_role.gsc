#using scripts\core_common\player\player_stats;
#using scripts\core_common\system_shared;

#namespace player_role;

// Namespace player_role/player_role
// Params 0, eflags: 0x2
// Checksum 0xbc5c8b65, Offset: 0x90
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"player_role", &__init__, undefined, undefined );
}

// Namespace player_role/player_role
// Params 0
// Checksum 0x9af5cda0, Offset: 0xd8
// Size: 0x22
function __init__()
{
    if ( !isdefined( world.playerroles ) )
    {
        world.playerroles = [];
    }
}

// Namespace player_role/player_role
// Params 1
// Checksum 0xbafc44c9, Offset: 0x108
// Size: 0xb2
function get_category_for_index( characterindex )
{
    categoryname = getplayerrolecategory( characterindex, currentsessionmode() );
    
    if ( isdefined( categoryname ) )
    {
        categoryinfo = getplayerrolecategoryinfo( categoryname );
        assert( isdefined( categoryinfo ) );
        
        if ( isdefined( categoryinfo.enabled ) && categoryinfo.enabled )
        {
            return categoryname;
        }
    }
    
    return "default";
}

// Namespace player_role/player_role
// Params 0
// Checksum 0x4930935d, Offset: 0x1c8
// Size: 0xa2
function get_category()
{
    player = self;
    assert( isplayer( player ) );
    characterindex = player get();
    assert( is_valid( characterindex ) );
    return get_category_for_index( characterindex );
}

// Namespace player_role/player_role
// Params 0
// Checksum 0x93032221, Offset: 0x278
// Size: 0x24
function function_c1f61ea2()
{
    return world.playerroles[ self getentitynumber() ];
}

// Namespace player_role/player_role
// Params 1
// Checksum 0xfa7ea4cf, Offset: 0x2a8
// Size: 0x156
function is_valid( index )
{
    if ( !isdefined( index ) )
    {
        return 0;
    }
    
    if ( currentsessionmode() == 0 )
    {
        if ( isdefined( level.validcharacters ) )
        {
            return isinarray( level.validcharacters, index );
        }
        
        return 0;
    }
    else if ( currentsessionmode() == 2 )
    {
        return ( index >= 0 && index < getplayerroletemplatecount( currentsessionmode() ) );
    }
    
    /#
        if ( getdvarint( #"allowdebugcharacter", 0 ) == 1 )
        {
            return ( index >= 0 && index < getplayerroletemplatecount( currentsessionmode() ) );
        }
    #/
    
    return index > 0 && index < getplayerroletemplatecount( currentsessionmode() );
}

// Namespace player_role/player_role
// Params 0
// Checksum 0xc2a14d77, Offset: 0x408
// Size: 0x4a
function get()
{
    assert( isplayer( self ) );
    return self getspecialistindex();
}

// Namespace player_role/player_role
// Params 0
// Checksum 0x2fc9e381, Offset: 0x460
// Size: 0x22
function update_fields()
{
    self.playerrole = self getrolefields();
}

// Namespace player_role/player_role
// Params 2
// Checksum 0x4b4546f9, Offset: 0x490
// Size: 0x258
function set( index, force )
{
    player = self;
    assert( isplayer( player ) );
    assert( is_valid( index ) );
    player.pers[ #"characterindex" ] = index;
    player setspecialistindex( index );
    
    if ( isbot( self ) && getdvarint( #"hash_542c037530526acb", 0 ) && !( isdefined( force ) && force ) )
    {
        self botsetrandomcharactercustomization();
    }
    
    player update_fields();
    world.playerroles[ self getentitynumber() ] = index;
    
    if ( currentsessionmode() == 0 )
    {
        customloadoutindex = get_custom_loadout_index( index );
    }
    else if ( currentsessionmode() == 2 )
    {
        customloadoutindex = self stats::get_stat( #"selectedcustomclass" );
    }
    else if ( currentsessionmode() == 3 )
    {
        customloadoutindex = 0;
    }
    else
    {
        customloadoutindex = self.pers[ #"loadoutindex" ];
    }
    
    if ( isdefined( customloadoutindex ) )
    {
        result = self [[ level.curclass ]]( "custom" + customloadoutindex );
        
        if ( !isdefined( result ) )
        {
            return 1;
        }
        
        return result;
    }
    
    return 0;
}

// Namespace player_role/player_role
// Params 0
// Checksum 0xd4cad58e, Offset: 0x6f0
// Size: 0x7a
function clear()
{
    player = self;
    assert( isplayer( player ) );
    player setspecialistindex( 0 );
    player.pers[ #"characterindex" ] = undefined;
    player.playerrole = undefined;
}

// Namespace player_role/player_role
// Params 1
// Checksum 0x8dea3814, Offset: 0x778
// Size: 0x22
function get_custom_loadout_index( characterindex )
{
    return getcharacterclassindex( characterindex );
}

// Namespace player_role/player_role
// Params 1
// Checksum 0x6b40b52d, Offset: 0x7a8
// Size: 0xa6
function function_97d19493( name )
{
    sessionmode = currentsessionmode();
    playerroletemplatecount = getplayerroletemplatecount( sessionmode );
    
    for ( i = 0; i < playerroletemplatecount ; i++ )
    {
        prtname = function_b14806c6( i, sessionmode );
        
        if ( prtname == name )
        {
            return i;
        }
    }
    
    return undefined;
}

