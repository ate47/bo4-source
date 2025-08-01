#using scripts\core_common\callbacks_shared;
#using scripts\core_common\dialog_shared;
#using scripts\core_common\system_shared;

#namespace grapple;

// Namespace grapple/grapple
// Params 0, eflags: 0x2
// Checksum 0xbfe2d1e9, Offset: 0x140
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"grapple", &__init__, undefined, undefined );
}

// Namespace grapple/grapple
// Params 0
// Checksum 0x69f48d05, Offset: 0x188
// Size: 0x5e
function __init__()
{
    callback::on_localplayer_spawned( &player_on_spawned );
    level.var_c3e66138 = &function_bbd7fc60;
    level.var_1b2035de = getscriptbundle( "grapple_custom_settings" );
}

// Namespace grapple/grapple
// Params 1
// Checksum 0xca0b2c8c, Offset: 0x1f0
// Size: 0x94
function player_on_spawned( localclientnum )
{
    player = self;
    
    if ( sessionmodeismultiplayergame() || sessionmodeiswarzonegame() )
    {
        if ( !player function_21c0fa55() )
        {
            return;
        }
        
        player thread function_664d0a50( localclientnum );
        player thread function_2297363d( localclientnum );
    }
}

// Namespace grapple/grapple
// Params 1
// Checksum 0x26a6e802, Offset: 0x290
// Size: 0x21c
function function_664d0a50( localclientnum )
{
    self notify( "16bdee31b75b050b" );
    self endon( "16bdee31b75b050b" );
    player = self;
    var_e413b7c3 = undefined;
    invalidhandle = undefined;
    
    while ( isdefined( player ) )
    {
        var_6e521a44 = function_15f112c3( localclientnum );
        
        if ( isdefined( var_6e521a44 ) )
        {
            if ( var_6e521a44 && !isdefined( var_e413b7c3 ) )
            {
                if ( isdefined( invalidhandle ) )
                {
                    killfx( localclientnum, invalidhandle );
                    player notify( "grapple_light_done_watch" + "invalid" );
                    invalidhandle = undefined;
                }
                
                var_e413b7c3 = playviewmodelfx( localclientnum, #"hash_2a3978ae302f2faf", "tag_fx1", 0 );
                thread grapple_light_watch_end( localclientnum, var_e413b7c3, "valid" );
            }
            else if ( !var_6e521a44 && !isdefined( invalidhandle ) )
            {
                if ( isdefined( var_e413b7c3 ) )
                {
                    killfx( localclientnum, var_e413b7c3 );
                    player notify( "grapple_light_done_watch" + "valid" );
                    var_e413b7c3 = undefined;
                }
                
                invalidhandle = playviewmodelfx( localclientnum, #"hash_39ed4a0ecba806a2", "tag_fx1", 0 );
                thread grapple_light_watch_end( localclientnum, invalidhandle, "invalid" );
            }
        }
        else
        {
            if ( isdefined( invalidhandle ) )
            {
                killfx( localclientnum, invalidhandle );
                invalidhandle = undefined;
            }
            
            if ( isdefined( var_e413b7c3 ) )
            {
                killfx( localclientnum, var_e413b7c3 );
                var_e413b7c3 = undefined;
            }
        }
        
        waitframe( 1 );
    }
}

// Namespace grapple/grapple
// Params 3
// Checksum 0xe1ec5d4a, Offset: 0x4b8
// Size: 0xa4
function grapple_light_watch_end( localclientnum, handle, name )
{
    player = self;
    player endon( "grapple_light_done_watch" + name );
    player notify( "grapple_light_watch_end" + name );
    player endon( "grapple_light_watch_end" + name );
    player waittill( #"death" );
    
    if ( isdefined( handle ) )
    {
        killfx( localclientnum, handle );
    }
}

// Namespace grapple/grapple
// Params 1
// Checksum 0xb7fe3842, Offset: 0x568
// Size: 0x1e8
function function_2297363d( localclientnum )
{
    self notify( "567d59ecc92fd8f5" );
    self endon( "567d59ecc92fd8f5" );
    player = self;
    doearthquake = 1;
    var_30f9f328 = 0;
    
    while ( isdefined( player ) )
    {
        if ( function_fd33f2ef( localclientnum ) == 3 )
        {
            if ( doearthquake )
            {
                player.grappleeq = earthquake( localclientnum, level.var_1b2035de.var_1598129, 10000, player.origin, 0, 0 );
                doearthquake = 0;
            }
            
            player mapshaderconstant( localclientnum, 0, "scriptVector1", var_30f9f328, 0, 0, 0 );
            var_30f9f328 += 0.05;
        }
        else if ( function_fd33f2ef( localclientnum ) == 0 )
        {
            player mapshaderconstant( localclientnum, 0, "scriptVector1", var_30f9f328, 0, 0, 0 );
            var_30f9f328 -= 0.05;
        }
        else
        {
            player mapshaderconstant( localclientnum, 0, "scriptVector1", 0, 0, 0, 0 );
            
            if ( isdefined( player.grappleeq ) )
            {
                function_196e7c4b( localclientnum, player.grappleeq );
                player.grappleeq = undefined;
                doearthquake = 1;
            }
        }
        
        waitframe( 1 );
    }
}

// Namespace grapple/grapple
// Params 1
// Checksum 0x61c0964c, Offset: 0x758
// Size: 0x84
function function_bbd7fc60( var_428d0be2 )
{
    if ( !isdefined( var_428d0be2 ) || isdefined( level.allowspecialistdialog ) && !level.allowspecialistdialog )
    {
        return;
    }
    
    dialogalias = var_428d0be2 dialog_shared::get_player_dialog_alias( "grappleGunWeaponUseFail" );
    
    if ( !isdefined( dialogalias ) )
    {
        return;
    }
    
    var_428d0be2 playsound( 0, dialogalias );
}

