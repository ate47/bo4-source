#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\mp_common\item_world;

#namespace wz_cash_safe;

// Namespace wz_cash_safe/wz_cash_safe
// Params 0, eflags: 0x2
// Checksum 0x84d8f8b3, Offset: 0x128
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"wz_cash_safe", &__init__, undefined, undefined );
}

// Namespace wz_cash_safe/wz_cash_safe
// Params 0
// Checksum 0x6a4cce7e, Offset: 0x170
// Size: 0xec
function __init__()
{
    clientfield::register( "clientuimodel", "hudItems.depositing", 13000, 1, "int", undefined, 0, 0 );
    
    if ( getdvarint( #"hash_7074ed0f04816b75", 0 ) )
    {
        clientfield::register( "allplayers", "wz_cash_carrying", 13000, 1, "int", &function_3d113bfb, 0, 1 );
        level.var_f042433 = [];
        level.var_e245bbc5 = [];
        level.var_7cce82bd = [];
        callback::on_localclient_connect( &on_localclient_connect );
    }
}

// Namespace wz_cash_safe/wz_cash_safe
// Params 1, eflags: 0x4
// Checksum 0xd8a66049, Offset: 0x268
// Size: 0x184
function private on_localclient_connect( localclientnum )
{
    if ( getdvarint( #"hash_7074ed0f04816b75", 0 ) )
    {
        level.var_f042433[ localclientnum ] = [];
        
        for ( i = 0; i < 1 ; i++ )
        {
            objid = util::getnextobjid( localclientnum );
            level.var_f042433[ localclientnum ][ i ] = objid;
            objective_add( localclientnum, objid, "invisible", #"wz_cash_safe" );
        }
        
        level.var_7cce82bd[ localclientnum ] = [];
        
        for ( i = 0; i < 12 ; i++ )
        {
            objid = util::getnextobjid( localclientnum );
            level.var_7cce82bd[ localclientnum ][ i ] = objid;
            objective_add( localclientnum, objid, "invisible", #"wz_cash_held" );
        }
        
        level thread function_93b89303( localclientnum );
    }
}

// Namespace wz_cash_safe/wz_cash_safe
// Params 1
// Checksum 0xaa844004, Offset: 0x3f8
// Size: 0x46
function function_ed66923( targetname )
{
    if ( !isarray( level.var_e245bbc5 ) )
    {
        return;
    }
    
    level.var_e245bbc5[ level.var_e245bbc5.size ] = targetname;
}

// Namespace wz_cash_safe/wz_cash_safe
// Params 1, eflags: 0x4
// Checksum 0x97596f38, Offset: 0x448
// Size: 0x920
function private function_93b89303( localclientnum )
{
    player = function_27673a7( localclientnum );
    player endon( #"disconnect" );
    
    while ( true )
    {
        if ( !isdefined( player ) )
        {
            player = function_27673a7( localclientnum );
        }
        
        for ( i = 0; i < 1 ; i++ )
        {
            if ( isdefined( level.var_f042433[ localclientnum ][ i ] ) )
            {
                objective_setstate( localclientnum, level.var_f042433[ localclientnum ][ i ], "invisible" );
            }
        }
        
        carryingcash = 0;
        var_59a2b21b = [];
        
        if ( isdefined( player ) && isalive( player ) )
        {
            clientdata = item_world::function_a7e98a1a( localclientnum );
            
            foreach ( item in clientdata.inventory.items )
            {
                if ( item.id != 32767 )
                {
                    point = function_b1702735( item.id );
                    
                    if ( isdefined( point ) && isdefined( point.itementry ) && point.itementry.itemtype == #"cash" )
                    {
                        carryingcash = 1;
                        break;
                    }
                }
            }
        }
        
        if ( carryingcash )
        {
            dynents = [];
            
            foreach ( targetname in level.var_e245bbc5 )
            {
                var_1ec402d4 = getdynentarray( targetname );
                
                foreach ( safe in var_1ec402d4 )
                {
                    if ( function_ffdbe8c2( safe ) == 0 )
                    {
                        dynents[ dynents.size ] = safe;
                    }
                }
            }
            
            if ( dynents.size > 0 )
            {
                dynents = arraysortclosest( dynents, player.origin, 10, 0, 5000 );
                
                if ( dynents.size > 0 )
                {
                    for ( i = 0; i < 1 ; i++ )
                    {
                        var_59a2b21b[ i ] = dynents[ i ];
                    }
                }
            }
        }
        
        if ( var_59a2b21b.size )
        {
            for ( i = 0; i < 1 ; i++ )
            {
                if ( isdefined( level.var_f042433[ localclientnum ][ i ] ) )
                {
                    if ( isdefined( var_59a2b21b[ i ] ) )
                    {
                        objective_setposition( localclientnum, level.var_f042433[ localclientnum ][ i ], var_59a2b21b[ i ].origin );
                        objective_setstate( localclientnum, level.var_f042433[ localclientnum ][ i ], "active" );
                        continue;
                    }
                    
                    objective_setstate( localclientnum, level.var_f042433[ localclientnum ][ i ], "invisible" );
                }
            }
        }
        else
        {
            for ( i = 0; i < 1 ; i++ )
            {
                if ( isdefined( level.var_f042433[ localclientnum ][ i ] ) )
                {
                    objective_setstate( localclientnum, level.var_f042433[ localclientnum ][ i ], "invisible" );
                }
            }
        }
        
        vehicle = getplayervehicle( player );
        
        if ( isdefined( vehicle ) && isdefined( vehicle.scriptbundlesettings ) )
        {
            var_165435de = struct::get_script_bundle( "vehiclecustomsettings", vehicle.scriptbundlesettings );
            
            if ( isdefined( var_165435de ) && isdefined( var_165435de.var_6754976b ) && var_165435de.var_6754976b )
            {
                var_ea44983e = [];
                var_81279b22 = [];
                all_players = getplayers( localclientnum );
                
                foreach ( enemy_player in all_players )
                {
                    if ( enemy_player.team === player.team )
                    {
                        continue;
                    }
                    
                    if ( !( isdefined( enemy_player.wz_carrying_cash ) && enemy_player.wz_carrying_cash ) )
                    {
                        continue;
                    }
                    
                    if ( distancesquared( enemy_player.origin, player.origin ) < 25000000 )
                    {
                        if ( isdefined( enemy_player.var_7c34933 ) && enemy_player.var_7c34933 + 1500 > gettime() )
                        {
                            var_81279b22[ enemy_player.var_cbe9b5b4 ] = enemy_player.var_cbe9b5b4;
                            continue;
                        }
                        
                        if ( !isdefined( var_ea44983e ) )
                        {
                            var_ea44983e = [];
                        }
                        else if ( !isarray( var_ea44983e ) )
                        {
                            var_ea44983e = array( var_ea44983e );
                        }
                        
                        if ( !isinarray( var_ea44983e, enemy_player ) )
                        {
                            var_ea44983e[ var_ea44983e.size ] = enemy_player;
                        }
                    }
                }
                
                for ( i = 0; i < 12 ; i++ )
                {
                    if ( var_81279b22[ i ] === i )
                    {
                        continue;
                    }
                    
                    if ( isdefined( level.var_7cce82bd[ localclientnum ][ i ] ) )
                    {
                        if ( !isdefined( var_ea44983e[ i ] ) )
                        {
                            objective_setstate( localclientnum, level.var_7cce82bd[ localclientnum ][ i ], "invisible" );
                            continue;
                        }
                        
                        objective_setposition( localclientnum, level.var_7cce82bd[ localclientnum ][ i ], var_ea44983e[ i ].origin );
                        objective_setstate( localclientnum, level.var_7cce82bd[ localclientnum ][ i ], "active" );
                        var_ea44983e[ i ].var_7c34933 = gettime();
                        var_ea44983e[ i ].var_cbe9b5b4 = i;
                    }
                }
            }
        }
        else
        {
            for ( i = 0; i < 12 ; i++ )
            {
                if ( isdefined( level.var_7cce82bd[ localclientnum ][ i ] ) )
                {
                    objective_setstate( localclientnum, level.var_7cce82bd[ localclientnum ][ i ], "invisible" );
                }
            }
        }
        
        waitframe( 1 );
    }
}

// Namespace wz_cash_safe/wz_cash_safe
// Params 2
// Checksum 0x9ec4c777, Offset: 0xd70
// Size: 0x7c
function function_4fec33b5( clientnum, value )
{
    modelpath = "Clients." + clientnum + ".hasCash";
    var_45d5c75f = createuimodel( getglobaluimodel(), modelpath );
    setuimodelvalue( var_45d5c75f, value );
}

// Namespace wz_cash_safe/wz_cash_safe
// Params 7
// Checksum 0xc72683d1, Offset: 0xdf8
// Size: 0xb4
function function_3d113bfb( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    self.wz_carrying_cash = newval;
    localplayer = function_5c10bd79( localclientnum );
    
    if ( self != localplayer && self.team == localplayer.team )
    {
        function_4fec33b5( self getentitynumber(), newval );
    }
}

