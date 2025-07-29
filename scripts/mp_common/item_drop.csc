#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flagsys_shared;
#using scripts\core_common\system_shared;
#using scripts\mp_common\item_inventory;
#using scripts\mp_common\item_inventory_util;
#using scripts\mp_common\item_world;
#using scripts\mp_common\item_world_util;

#namespace item_drop;

// Namespace item_drop/item_drop
// Params 0, eflags: 0x2
// Checksum 0xfcc7187e, Offset: 0x118
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"item_drop", &__init__, undefined, undefined );
}

// Namespace item_drop/item_drop
// Params 0
// Checksum 0x89c75bc4, Offset: 0x160
// Size: 0x2ac
function __init__()
{
    if ( getgametypesetting( #"useitemspawns" ) == 0 )
    {
        return;
    }
    
    clientfield::register( "missile", "dynamic_item_drop", 1, 2, "int", &function_a517a859, 0, 0 );
    clientfield::register( "missile", "dynamic_item_drop_count", 11000, 10, "int", &function_fd47982d, 0, 0 );
    clientfield::register( "scriptmover", "dynamic_item_drop", 1, 2, "int", &function_a517a859, 0, 0 );
    clientfield::register( "scriptmover", "dynamic_item_drop_count", 11000, 10, "int", &function_fd47982d, 0, 0 );
    clientfield::register( "missile", "dynamic_item_drop", 10000, 3, "int", &function_a517a859, 0, 0 );
    clientfield::register( "scriptmover", "dynamic_item_drop", 10000, 3, "int", &function_a517a859, 0, 0 );
    clientfield::register( "scriptmover", "dynamic_stash", 1, 2, "int", &function_e7bb925a, 0, 0 );
    clientfield::register( "scriptmover", "dynamic_stash_type", 1, 2, "int", &function_63226f88, 0, 0 );
    level.item_spawn_drops = [];
    level.var_624588d5 = [];
    level.var_d49a1a10 = [];
    level thread function_b8f6e02f();
}

// Namespace item_drop/item_drop
// Params 0, eflags: 0x4
// Checksum 0xea29315e, Offset: 0x418
// Size: 0x16c
function private function_b8f6e02f()
{
    while ( true )
    {
        item_world::function_1b11e73c();
        reset = isdefined( level flagsys::get( #"item_world_reset" ) ) && level flagsys::get( #"item_world_reset" );
        var_d68d9a4d = level.var_d49a1a10.size;
        
        for ( index = 0; index < var_d68d9a4d ; index++ )
        {
            var_5c6af5cf = level.var_d49a1a10[ index ];
            level.var_d49a1a10[ index ] = undefined;
            
            if ( !isdefined( var_5c6af5cf ) || !isdefined( var_5c6af5cf.item ) )
            {
                continue;
            }
            
            if ( var_5c6af5cf.reset !== reset )
            {
                continue;
            }
            
            profilestart();
            var_5c6af5cf.item function_67189b6b( var_5c6af5cf.localclientnum, var_5c6af5cf.newval );
            profilestop();
        }
        
        level.var_d49a1a10 = [];
        
        if ( reset )
        {
            break;
        }
        
        waitframe( 1 );
    }
}

// Namespace item_drop/item_drop
// Params 2, eflags: 0x4
// Checksum 0x4746c92a, Offset: 0x590
// Size: 0x454
function private function_67189b6b( localclientnum, newval )
{
    stashitem = ( newval & 4 ) != 0;
    newval &= -5;
    
    if ( newval == 0 )
    {
        if ( isdefined( self ) && isdefined( self.networkid ) && isdefined( level.item_spawn_drops[ self.networkid ] ) )
        {
            arrayremoveindex( level.item_spawn_drops, self.networkid, 1 );
        }
        
        if ( isdefined( self ) && isdefined( self.networkid ) && isdefined( level.var_5b2a8d88[ self.networkid ] ) )
        {
            level.var_5b2a8d88[ self.networkid ] = 0;
        }
        
        return;
    }
    
    if ( newval == 1 )
    {
        assert( self.id < 1024 );
        
        if ( self.id >= 1024 )
        {
            return;
        }
        
        self.networkid = item_world_util::function_1f0def85( self );
        self.hidetime = 0;
        
        if ( stashitem )
        {
            self.hidetime = -1;
        }
        
        if ( self.id != 32767 && self.id < function_8322cf16() )
        {
            self.itementry = function_b1702735( self.id ).itementry;
            self function_1fe1281( localclientnum, clientfield::get( "dynamic_item_drop_count" ) );
            
            if ( self.itementry.name == #"sig_blade_wz_item" && isdefined( level.var_5b2a8d88 ) )
            {
                level.var_5b2a8d88[ self.networkid ] = 1;
            }
        }
        
        arrayremovevalue( level.item_spawn_drops, undefined, 1 );
        level.item_spawn_drops[ self.networkid ] = self;
        item_world::function_b78a9820( localclientnum );
        player = function_5c10bd79( localclientnum );
        
        if ( isplayer( player ) && distance2dsquared( self.origin, player.origin ) <= 1350 * 1350 )
        {
            player.var_506495f9 = 1;
        }
        
        item_inventory::function_b1136fc8( localclientnum, self );
        player item_world::show_item( localclientnum, self.networkid, !stashitem );
        return;
    }
    
    if ( newval == 2 )
    {
        self.hidetime = gettime();
        self.networkid = item_world_util::function_1f0def85( self );
        item_inventory::function_31868137( localclientnum, self );
        item_world::function_b78a9820( localclientnum );
        item_world::function_2990e5f( localclientnum, self );
        
        if ( isdefined( self.networkid ) && getdvarint( #"hash_99bb0233e482c77", 0 ) )
        {
            level.item_spawn_drops[ self.networkid ] = undefined;
        }
        
        player = function_5c10bd79( localclientnum );
        player item_world::hide_item( localclientnum, self.networkid );
    }
}

// Namespace item_drop/item_drop
// Params 1, eflags: 0x4
// Checksum 0x72e7c542, Offset: 0x9f0
// Size: 0x74, Type: bool
function private function_1a45bc2a( item )
{
    if ( !isdefined( item ) )
    {
        return false;
    }
    
    if ( !isdefined( item.type ) || item.type != #"scriptmover" && item.type != #"missile" )
    {
        return false;
    }
    
    return true;
}

// Namespace item_drop/item_drop
// Params 7
// Checksum 0xf26696c7, Offset: 0xa70
// Size: 0x7c
function function_fd47982d( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( !isdefined( self.id ) || !isdefined( self.itementry ) )
    {
        return;
    }
    
    self function_1fe1281( localclientnum, newval );
}

// Namespace item_drop/item_drop
// Params 2
// Checksum 0xfbfac326, Offset: 0xaf8
// Size: 0x1a4
function function_1fe1281( localclientnum, newval )
{
    if ( !isdefined( self ) )
    {
        return;
    }
    
    assert( isdefined( self.id ) );
    assert( isdefined( self.itementry ) );
    
    if ( !isdefined( self.id ) || !isdefined( self.itementry ) )
    {
        return;
    }
    
    if ( self.itementry.itemtype === #"ammo" || self.itementry.itemtype === #"armor" || self.itementry.itemtype === #"weapon" )
    {
        if ( isdefined( self.amount ) && newval !== self.amount )
        {
            item_inventory::function_31868137( localclientnum, self );
        }
        
        self.amount = newval;
        self.count = 1;
    }
    else
    {
        if ( isdefined( self.count ) && newval !== self.count )
        {
            item_inventory::function_31868137( localclientnum, self );
        }
        
        self.amount = 0;
        self.count = newval;
    }
    
    item_world::function_b78a9820( localclientnum );
}

// Namespace item_drop/item_drop
// Params 7
// Checksum 0xc59d4c0e, Offset: 0xca8
// Size: 0xb4
function function_a517a859( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    self endon( #"death" );
    self.id = self getitemindex();
    
    if ( !item_world::function_1b11e73c() )
    {
        return;
    }
    
    if ( !function_1a45bc2a( self ) )
    {
        return;
    }
    
    self function_67189b6b( localclientnum, newval );
}

// Namespace item_drop/item_drop
// Params 7
// Checksum 0x2415cc8b, Offset: 0xd68
// Size: 0x144
function function_e7bb925a( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    self endon( #"death" );
    
    if ( !item_world::function_1b11e73c() )
    {
        return;
    }
    
    if ( newval == 1 )
    {
        self.var_bad13452 = 0;
    }
    else if ( newval == 2 )
    {
        self.var_bad13452 = 2;
    }
    
    level.var_624588d5[ level.var_624588d5.size ] = self;
    player = function_5c10bd79( localclientnum );
    
    if ( isplayer( player ) && distance2dsquared( self.origin, player.origin ) <= 1350 * 1350 )
    {
        item_world::function_a4886b1e( localclientnum, undefined, self );
    }
}

// Namespace item_drop/item_drop
// Params 7
// Checksum 0x7eb44006, Offset: 0xeb8
// Size: 0xbe
function function_63226f88( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    self endon( #"death" );
    
    if ( !item_world::function_1b11e73c() )
    {
        return;
    }
    
    if ( newval == 0 )
    {
        self.stash_type = 0;
        return;
    }
    
    if ( newval == 1 )
    {
        self.stash_type = 1;
        return;
    }
    
    if ( newval == 2 )
    {
        self.stash_type = 2;
    }
}

