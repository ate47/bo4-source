#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\util_shared;

#namespace clean;

// Namespace clean/gametype_init
// Params 1, eflags: 0x40
// Checksum 0x228632e3, Offset: 0x1d8
// Size: 0x23c
function event_handler[gametype_init] main( eventstruct )
{
    clientfield::register( "clientuimodel", "hudItems.cleanCarryCount", 14000, 4, "int", undefined, 0, 0 );
    clientfield::register( "clientuimodel", "hudItems.cleanCarryFull", 14000, 1, "int", undefined, 0, 0 );
    clientfield::register( "scriptmover", "taco_flag", 14000, 2, "int", &function_11abf5b2, 0, 0 );
    clientfield::register( "allplayers", "taco_carry", 14000, 1, "int", &function_aa7bb941, 0, 0 );
    clientfield::register( "scriptmover", "taco_player_entnum", 14000, 4, "int", &function_568727a2, 0, 0 );
    level.var_aaaae0b = "ui/fx8_fracture_plyr_marker";
    level.var_5844252c = "ui/fx8_fracture_drop_marker";
    level.var_ce64ea3e = #"clean_taco";
    
    if ( isdefined( getgametypesetting( #"hash_5cc4c3042b7d4935" ) ) && getgametypesetting( #"hash_5cc4c3042b7d4935" ) )
    {
        level.var_aaaae0b = "ui/fx8_fracture_plyr_marker_shamrock";
        level.var_5844252c = "ui/fx8_fracture_drop_marker_shamrock";
        level.var_ce64ea3e = #"hash_3a64e972390f43aa";
    }
    
    callback::on_localclient_connect( &on_localclient_connect );
}

// Namespace clean/clean
// Params 1, eflags: 0x4
// Checksum 0xc858096c, Offset: 0x420
// Size: 0x24
function private on_localclient_connect( localclientnum )
{
    function_d91ca1f1( localclientnum );
}

// Namespace clean/clean
// Params 7
// Checksum 0xddc873aa, Offset: 0x450
// Size: 0x1d4
function function_11abf5b2( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    self notify( #"stopbounce" );
    
    if ( isdefined( self.var_47b256ef ) )
    {
        self.var_47b256ef unlink();
        self.var_47b256ef.origin = self.origin;
    }
    
    self function_81431153( localclientnum );
    
    if ( newval != 0 )
    {
        if ( !isdefined( self.var_47b256ef ) )
        {
            self.var_47b256ef = spawn( localclientnum, self.origin, "script_model" );
            self.var_47b256ef setmodel( #"tag_origin" );
            self thread function_bcb88fb7( localclientnum );
        }
        
        self.var_5844252c = util::playfxontag( localclientnum, level.var_5844252c, self.var_47b256ef, "tag_origin" );
        setfxteam( localclientnum, self.var_5844252c, self.team );
    }
    
    if ( newval == 1 )
    {
        self.var_47b256ef linkto( self );
        return;
    }
    
    if ( newval == 2 )
    {
        self thread function_d1834e16( localclientnum );
    }
}

// Namespace clean/clean
// Params 1
// Checksum 0x44ccc975, Offset: 0x630
// Size: 0x5e
function function_bcb88fb7( localclientnum )
{
    self waittill( #"death" );
    self function_81431153( localclientnum );
    self.var_47b256ef delete();
    self.var_47b256ef = undefined;
}

// Namespace clean/clean
// Params 1
// Checksum 0xbfd772e2, Offset: 0x698
// Size: 0x3e
function function_81431153( localclientnum )
{
    if ( isdefined( self.var_5844252c ) )
    {
        killfx( localclientnum, self.var_5844252c );
        self.var_5844252c = undefined;
    }
}

// Namespace clean/clean
// Params 1
// Checksum 0xddaa6c37, Offset: 0x6e0
// Size: 0xfc
function function_d1834e16( localclientnum )
{
    self endon( #"stopbounce" );
    self endon( #"death" );
    toppos = self.origin + ( 0, 0, 12 );
    bottompos = self.origin;
    
    while ( true )
    {
        self.var_47b256ef moveto( toppos, 0.5, 0, 0 );
        self.var_47b256ef waittill( #"movedone" );
        self.var_47b256ef moveto( bottompos, 0.5, 0, 0 );
        self.var_47b256ef waittill( #"movedone" );
    }
}

// Namespace clean/clean
// Params 7
// Checksum 0x66db7814, Offset: 0x7e8
// Size: 0xec
function function_aa7bb941( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    self function_cd6915b7( localclientnum );
    
    if ( newval && function_5c10bd79( localclientnum ) != self )
    {
        self util::waittill_dobj( localclientnum );
        
        if ( !isdefined( self ) )
        {
            return;
        }
        
        self.var_aaaae0b = util::playfxontag( localclientnum, level.var_aaaae0b, self, "j_neck" );
        setfxteam( localclientnum, self.var_aaaae0b, self.team );
    }
}

// Namespace clean/clean
// Params 1
// Checksum 0x550199fa, Offset: 0x8e0
// Size: 0x3c
function function_5cf5b566( localclientnum )
{
    self waittill( #"death" );
    self function_cd6915b7( localclientnum );
}

// Namespace clean/clean
// Params 1
// Checksum 0xf45b1d0f, Offset: 0x928
// Size: 0x3e
function function_cd6915b7( localclientnum )
{
    if ( isdefined( self.var_aaaae0b ) )
    {
        killfx( localclientnum, self.var_aaaae0b );
        self.var_aaaae0b = undefined;
    }
}

// Namespace clean/clean
// Params 1
// Checksum 0xa0309388, Offset: 0x970
// Size: 0xf6
function function_d91ca1f1( localclientnum )
{
    level.var_67485c05[ localclientnum ] = [];
    
    for ( i = 0; i < 16 ; i++ )
    {
        level.var_ccb8d7fb[ localclientnum ][ i ] = spawnstruct();
        objid = util::getnextobjid( localclientnum );
        level.var_ccb8d7fb[ localclientnum ][ i ].id = objid;
        level.var_ccb8d7fb[ localclientnum ][ i ].tacoentnum = undefined;
        objective_add( localclientnum, objid, "invisible", level.var_ce64ea3e );
    }
}

// Namespace clean/clean
// Params 2
// Checksum 0xd86af7d8, Offset: 0xa70
// Size: 0x9c
function function_5d02c098( localclientnum, tacoentnum )
{
    for ( i = 0; i < 16 ; i++ )
    {
        if ( !isdefined( level.var_ccb8d7fb[ localclientnum ][ i ].tacoentnum ) )
        {
            level.var_ccb8d7fb[ localclientnum ][ i ].tacoentnum = tacoentnum;
            return level.var_ccb8d7fb[ localclientnum ][ i ].id;
        }
    }
    
    return undefined;
}

// Namespace clean/clean
// Params 2
// Checksum 0x4a7786dc, Offset: 0xb18
// Size: 0x9c
function function_53576950( localclientnum, tacoentnum )
{
    for ( i = 0; i < 16 ; i++ )
    {
        if ( level.var_ccb8d7fb[ localclientnum ][ i ].tacoentnum === tacoentnum )
        {
            level.var_ccb8d7fb[ localclientnum ][ i ].tacoentnum = undefined;
            return level.var_ccb8d7fb[ localclientnum ][ i ].id;
        }
    }
    
    return undefined;
}

// Namespace clean/clean
// Params 7
// Checksum 0x488faa25, Offset: 0xbc0
// Size: 0x164
function function_568727a2( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    player = function_27673a7( localclientnum );
    playerentnum = player getentitynumber();
    
    if ( newval == playerentnum && newval != oldval )
    {
        objid = function_5d02c098( localclientnum, self getentitynumber() );
        
        if ( isdefined( objid ) )
        {
            objective_setstate( localclientnum, objid, "active" );
            objective_setposition( localclientnum, objid, self.origin );
        }
        
        return;
    }
    
    objid = function_53576950( localclientnum, self getentitynumber() );
    
    if ( isdefined( objid ) )
    {
        objective_setstate( localclientnum, objid, "invisible" );
    }
}

