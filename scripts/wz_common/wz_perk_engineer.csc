#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\renderoverridebundle;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\weapons\weaponobjects;

#namespace wz_perk_engineer;

// Namespace wz_perk_engineer/wz_perk_engineer
// Params 0, eflags: 0x2
// Checksum 0xf67c583c, Offset: 0xb8
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"wz_perk_engineer", &__init__, undefined, undefined );
}

// Namespace wz_perk_engineer/wz_perk_engineer
// Params 0
// Checksum 0xa755f67b, Offset: 0x100
// Size: 0x104
function __init__()
{
    renderoverridebundle::function_f72f089c( #"hash_f5de00feee70c13", sessionmodeiscampaigngame() ? #"rob_sonar_set_friendlyequip_cp" : #"rob_sonar_set_friendlyequip_mp", &function_8550d243 );
    renderoverridebundle::function_f72f089c( #"hash_77f7418d2f2a7890", #"rob_sonar_set_enemyequip", &function_62888a11 );
    renderoverridebundle::function_f72f089c( #"hash_61c696df3d5a1765", #"hash_44adc567f9f60d61", &function_b52a94e5 );
    callback::on_localplayer_spawned( &on_localplayer_spawned );
}

// Namespace wz_perk_engineer/wz_perk_engineer
// Params 1, eflags: 0x4
// Checksum 0x2418edb8, Offset: 0x210
// Size: 0x3c
function private on_localplayer_spawned( localclientnum )
{
    if ( self function_21c0fa55() )
    {
        self thread function_7800b9c2( localclientnum );
    }
}

// Namespace wz_perk_engineer/wz_perk_engineer
// Params 1
// Checksum 0x5e4382c6, Offset: 0x258
// Size: 0xae
function function_e446e567( notifyhash )
{
    if ( !isdefined( self.var_100abb43 ) || !isarray( self.var_100abb43 ) )
    {
        return;
    }
    
    foreach ( item in self.var_100abb43 )
    {
        if ( isdefined( item ) )
        {
            item.var_f19b4afd = undefined;
        }
    }
}

// Namespace wz_perk_engineer/wz_perk_engineer
// Params 1, eflags: 0x4
// Checksum 0x79cea8ed, Offset: 0x310
// Size: 0x380
function private function_7800b9c2( localclientnum )
{
    level endon( #"game_ended" );
    self endoncallback( &function_e446e567, #"death" );
    
    if ( !isdefined( self.var_100abb43 ) )
    {
        self.var_100abb43 = [];
    }
    
    while ( true )
    {
        var_94c264dd = self hasperk( localclientnum, #"specialty_showenemyequipment" );
        
        if ( !var_94c264dd && isdefined( self.var_53204996 ) )
        {
            var_94c264dd |= self [[ self.var_53204996 ]]( localclientnum );
        }
        
        if ( !var_94c264dd && self.var_100abb43.size == 0 )
        {
            wait 0.2;
            continue;
        }
        
        var_5ef114b0 = [];
        
        if ( var_94c264dd )
        {
            var_7c16c290 = array::filter( level.enemyequip, 0, &function_5118c0a3 );
            items = arraycombine( level.allvehicles, var_7c16c290, 0, 0 );
            arrayremovevalue( items, undefined, 0 );
            var_5ef114b0 = arraysortclosest( items, self.origin, 5, 0, 7200 );
        }
        
        foreach ( item in self.var_100abb43 )
        {
            if ( isdefined( item ) )
            {
                item.var_f19b4afd = undefined;
            }
        }
        
        foreach ( item in var_5ef114b0 )
        {
            item.var_f19b4afd = 1;
        }
        
        var_2e2e2808 = arraycombine( self.var_100abb43, var_5ef114b0, 0, 0 );
        
        foreach ( item in var_2e2e2808 )
        {
            if ( isdefined( item ) )
            {
                if ( isdefined( item.vehicletype ) )
                {
                    item function_c34cebb1( localclientnum );
                }
                else
                {
                    item weaponobjects::updateenemyequipment( localclientnum, undefined );
                }
            }
            
            waitframe( 1 );
        }
        
        self.var_100abb43 = var_5ef114b0;
        wait 0.2;
    }
}

// Namespace wz_perk_engineer/wz_perk_engineer
// Params 1, eflags: 0x4
// Checksum 0xbed2e643, Offset: 0x698
// Size: 0x2e, Type: bool
function private function_5118c0a3( item )
{
    return isdefined( item ) && !item function_ca024039();
}

// Namespace wz_perk_engineer/wz_perk_engineer
// Params 1, eflags: 0x4
// Checksum 0x948939e0, Offset: 0x6d0
// Size: 0xb4
function private function_c34cebb1( localclientnum )
{
    self renderoverridebundle::function_c8d97b8e( localclientnum, #"friendly", #"hash_f5de00feee70c13" );
    self renderoverridebundle::function_c8d97b8e( localclientnum, #"enemy", #"hash_77f7418d2f2a7890" );
    self renderoverridebundle::function_c8d97b8e( localclientnum, #"neutral", #"hash_61c696df3d5a1765" );
}

// Namespace wz_perk_engineer/wz_perk_engineer
// Params 0, eflags: 0x4
// Checksum 0x3d9320c4, Offset: 0x790
// Size: 0x6a
function private function_76a0624a()
{
    if ( !isdefined( self.owner ) || !isdefined( self.owner.team ) )
    {
        return 0;
    }
    
    if ( self.owner.team == #"neutral" )
    {
        return 0;
    }
    
    return self.owner function_83973173();
}

// Namespace wz_perk_engineer/wz_perk_engineer
// Params 0, eflags: 0x4
// Checksum 0x83f3f8b2, Offset: 0x808
// Size: 0x6c, Type: bool
function private function_da8108ae()
{
    if ( !isdefined( self.owner ) || !isdefined( self.owner.team ) )
    {
        return false;
    }
    
    if ( self.owner.team == #"neutral" )
    {
        return false;
    }
    
    return !self.owner function_83973173();
}

// Namespace wz_perk_engineer/wz_perk_engineer
// Params 2, eflags: 0x4
// Checksum 0x6b186296, Offset: 0x880
// Size: 0xc2, Type: bool
function private function_8550d243( localclientnum, bundle )
{
    if ( function_9d295a8c( localclientnum ) )
    {
        return false;
    }
    
    if ( self.type === "vehicle" && isinvehicle( localclientnum, self ) )
    {
        return false;
    }
    
    if ( self.type === "vehicle_corpse" )
    {
        return false;
    }
    
    if ( self function_76a0624a() && isdefined( self.var_f19b4afd ) && self.var_f19b4afd )
    {
        return true;
    }
    
    return false;
}

// Namespace wz_perk_engineer/wz_perk_engineer
// Params 2, eflags: 0x4
// Checksum 0x29ea0bae, Offset: 0x950
// Size: 0xc2, Type: bool
function private function_62888a11( localclientnum, bundle )
{
    if ( function_9d295a8c( localclientnum ) )
    {
        return false;
    }
    
    if ( self.type === "vehicle" && isinvehicle( localclientnum, self ) )
    {
        return false;
    }
    
    if ( self.type === "vehicle_corpse" )
    {
        return false;
    }
    
    if ( self function_da8108ae() && isdefined( self.var_f19b4afd ) && self.var_f19b4afd )
    {
        return true;
    }
    
    return false;
}

// Namespace wz_perk_engineer/wz_perk_engineer
// Params 2, eflags: 0x4
// Checksum 0xb848bd2, Offset: 0xa20
// Size: 0xde, Type: bool
function private function_b52a94e5( localclientnum, bundle )
{
    if ( function_9d295a8c( localclientnum ) )
    {
        return false;
    }
    
    if ( self.type === "vehicle" && isinvehicle( localclientnum, self ) )
    {
        return false;
    }
    
    if ( self.type === "vehicle_corpse" )
    {
        return false;
    }
    
    if ( !self function_76a0624a() && !self function_da8108ae() && isdefined( self.var_f19b4afd ) && self.var_f19b4afd )
    {
        return true;
    }
    
    return false;
}

