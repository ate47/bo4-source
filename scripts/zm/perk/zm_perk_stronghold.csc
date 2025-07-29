#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\zm_perks;
#using scripts\zm_common\zm_utility;

#namespace zm_perk_stronghold;

// Namespace zm_perk_stronghold/zm_perk_stronghold
// Params 0, eflags: 0x2
// Checksum 0x899d9052, Offset: 0x140
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zm_perk_stronghold", &__init__, undefined, undefined );
}

// Namespace zm_perk_stronghold/zm_perk_stronghold
// Params 0
// Checksum 0x2c676f2f, Offset: 0x188
// Size: 0x64
function __init__()
{
    enable_stronghold_perk_for_level();
    level._effect[ #"hash_24e322568c9492c5" ] = #"hash_497cb15bcf6c05b1";
    callback::on_localclient_connect( &on_localclient_connect );
}

// Namespace zm_perk_stronghold/zm_perk_stronghold
// Params 0
// Checksum 0x169a1dbe, Offset: 0x1f8
// Size: 0x104
function enable_stronghold_perk_for_level()
{
    zm_perks::register_perk_clientfields( #"specialty_camper", &function_5a4557ee, &function_44bd921f );
    zm_perks::register_perk_effects( #"specialty_camper", "divetonuke_light" );
    zm_perks::register_perk_init_thread( #"specialty_camper", &init_stronghold );
    zm_perks::function_b60f4a9f( #"specialty_camper", #"p8_zm_vapor_altar_icon_01_stonecoldstronghold", "zombie/fx8_perk_altar_symbol_ambient_stronghold", #"zmperksstonecold" );
    zm_perks::function_f3c80d73( "zombie_perk_bottle_stronghold", "zombie_perk_totem_stronghold" );
}

// Namespace zm_perk_stronghold/zm_perk_stronghold
// Params 0
// Checksum 0x80f724d1, Offset: 0x308
// Size: 0x4
function init_stronghold()
{
    
}

// Namespace zm_perk_stronghold/zm_perk_stronghold
// Params 0
// Checksum 0x28680403, Offset: 0x318
// Size: 0x5c
function function_5a4557ee()
{
    clientfield::register( "toplayer", "" + #"hash_24e322568c9492c5", 1, 1, "int", &function_2400dd1d, 0, 1 );
}

// Namespace zm_perk_stronghold/zm_perk_stronghold
// Params 0
// Checksum 0x80f724d1, Offset: 0x380
// Size: 0x4
function function_44bd921f()
{
    
}

// Namespace zm_perk_stronghold/zm_perk_stronghold
// Params 7
// Checksum 0xf6afb0b8, Offset: 0x390
// Size: 0x1ee
function function_2400dd1d( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( !isdefined( self.var_f9c892e3 ) )
    {
        self.var_f9c892e3 = [];
    }
    
    if ( newval )
    {
        if ( isdefined( self.var_f9c892e3[ localclientnum ] ) )
        {
            deletefx( localclientnum, self.var_f9c892e3[ localclientnum ], 1 );
        }
        
        self.var_f9c892e3[ localclientnum ] = util::playfxontag( localclientnum, level._effect[ #"hash_24e322568c9492c5" ], self, "j_spine" );
        
        if ( !isdefined( self.var_2ec16150 ) )
        {
            self playsound( localclientnum, #"hash_5e1e162af8490f1d" );
            self.var_2ec16150 = self playloopsound( #"hash_641286598a33d4e3" );
        }
        
        return;
    }
    
    if ( isdefined( self.var_f9c892e3[ localclientnum ] ) )
    {
        deletefx( localclientnum, self.var_f9c892e3[ localclientnum ], 0 );
        self.var_f9c892e3[ localclientnum ] = undefined;
    }
    
    if ( isdefined( self.var_2ec16150 ) )
    {
        self playsound( localclientnum, #"hash_73b66a25abec1fe4" );
        self stoploopsound( self.var_2ec16150 );
        self.var_2ec16150 = undefined;
    }
}

// Namespace zm_perk_stronghold/zm_perk_stronghold
// Params 1
// Checksum 0xc7619f19, Offset: 0x588
// Size: 0x2c
function on_localclient_connect( localclientnum )
{
    self callback::on_death( &on_death );
}

// Namespace zm_perk_stronghold/zm_perk_stronghold
// Params 1
// Checksum 0x8e3b93b6, Offset: 0x5c0
// Size: 0xb4
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
    
    if ( isarray( self.var_f9c892e3 ) && isdefined( self.var_f9c892e3[ localclientnum ] ) )
    {
        deletefx( localclientnum, self.var_f9c892e3[ localclientnum ], 1 );
    }
}

