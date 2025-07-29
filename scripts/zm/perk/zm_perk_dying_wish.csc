#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\postfx_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\zm_perks;
#using scripts\zm_common\zm_utility;

#namespace zm_perk_dying_wish;

// Namespace zm_perk_dying_wish/zm_perk_dying_wish
// Params 0, eflags: 0x2
// Checksum 0x2127aab9, Offset: 0x148
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zm_perk_dying_wish", &__init__, undefined, undefined );
}

// Namespace zm_perk_dying_wish/zm_perk_dying_wish
// Params 0
// Checksum 0x178ed801, Offset: 0x190
// Size: 0x14
function __init__()
{
    enable_dying_wish_perk_for_level();
}

// Namespace zm_perk_dying_wish/zm_perk_dying_wish
// Params 0
// Checksum 0xb278afb5, Offset: 0x1b0
// Size: 0x174
function enable_dying_wish_perk_for_level()
{
    zm_perks::register_perk_clientfields( #"specialty_berserker", &function_6e5c87d, &function_36db14fb );
    zm_perks::register_perk_effects( #"specialty_berserker", "divetonuke_light" );
    zm_perks::register_perk_init_thread( #"specialty_berserker", &function_536f842f );
    zm_perks::function_b60f4a9f( #"specialty_berserker", #"p8_zm_vapor_altar_icon_01_dyingwish", "zombie/fx8_perk_altar_symbol_ambient_dying_wish", #"zmperksdyingwish" );
    zm_perks::function_f3c80d73( "zombie_perk_bottle_dying_wish", "zombie_perk_totem_dying_wish" );
    level._effect[ #"hash_481f130cd5e53b7f" ] = #"hash_620000088d4c3f79";
    callback::on_spawned( &on_spawned );
    callback::on_localclient_connect( &on_localclient_connect );
}

// Namespace zm_perk_dying_wish/zm_perk_dying_wish
// Params 0
// Checksum 0x80f724d1, Offset: 0x330
// Size: 0x4
function function_536f842f()
{
    
}

// Namespace zm_perk_dying_wish/zm_perk_dying_wish
// Params 0
// Checksum 0x4282c662, Offset: 0x340
// Size: 0x5c
function function_6e5c87d()
{
    clientfield::register( "allplayers", "" + #"hash_10f459edea6b3eb", 1, 1, "int", &function_bd2b1ccb, 0, 0 );
}

// Namespace zm_perk_dying_wish/zm_perk_dying_wish
// Params 0
// Checksum 0x80f724d1, Offset: 0x3a8
// Size: 0x4
function function_36db14fb()
{
    
}

// Namespace zm_perk_dying_wish/zm_perk_dying_wish
// Params 1
// Checksum 0xc1a7270a, Offset: 0x3b8
// Size: 0x4c
function on_spawned( localclientnum )
{
    if ( self postfx::function_556665f2( #"pstfx_zm_dying_wish" ) )
    {
        self thread postfx::exitpostfxbundle( #"pstfx_zm_dying_wish" );
    }
}

// Namespace zm_perk_dying_wish/zm_perk_dying_wish
// Params 7, eflags: 0x4
// Checksum 0x13e88ddd, Offset: 0x410
// Size: 0x206
function private function_bd2b1ccb( localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump )
{
    if ( newvalue )
    {
        if ( self zm_utility::function_f8796df3( localclientnum ) )
        {
            self thread postfx::playpostfxbundle( #"pstfx_zm_dying_wish" );
        }
        else
        {
            self.var_d413d3e = util::playfxontag( localclientnum, level._effect[ #"hash_481f130cd5e53b7f" ], self, "j_spine4" );
        }
        
        if ( !isdefined( self.var_cffdb842 ) )
        {
            self.var_e9dd2ca0 = 1;
            self playsound( localclientnum, #"hash_268d2ee0a0daf799" );
            self.var_cffdb842 = self playloopsound( #"hash_22a448c0d7682cdf" );
        }
        
        return;
    }
    
    if ( self zm_utility::function_f8796df3( localclientnum ) )
    {
        self thread postfx::exitpostfxbundle( #"pstfx_zm_dying_wish" );
    }
    else if ( isdefined( self.var_d413d3e ) )
    {
        stopfx( localclientnum, self.var_d413d3e );
        self.var_d413d3e = undefined;
    }
    
    if ( isdefined( self.var_cffdb842 ) )
    {
        self.var_e9dd2ca0 = 0;
        self playsound( localclientnum, #"hash_2f273ae29320f08" );
        self stoploopsound( self.var_cffdb842 );
        self.var_cffdb842 = undefined;
    }
}

// Namespace zm_perk_dying_wish/zm_perk_dying_wish
// Params 1
// Checksum 0x49d9c2de, Offset: 0x620
// Size: 0x2c
function on_localclient_connect( localclientnum )
{
    self callback::on_death( &on_death );
}

// Namespace zm_perk_dying_wish/zm_perk_dying_wish
// Params 1
// Checksum 0x8c190eaa, Offset: 0x658
// Size: 0x84
function on_death( params )
{
    if ( !isplayer( self ) )
    {
        return;
    }
    
    localclientnum = params.localclientnum;
    
    if ( function_65b9eb0f( localclientnum ) )
    {
        return;
    }
    
    if ( isdefined( self.var_d413d3e ) )
    {
        deletefx( localclientnum, self.var_d413d3e, 1 );
    }
}

