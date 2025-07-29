#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flag_shared;
#using scripts\zm_common\callbacks;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_zonemgr;

#namespace zm_office_trophies;

// Namespace zm_office_trophies/zm_office_trophies
// Params 0
// Checksum 0x4bccbb33, Offset: 0x1d8
// Size: 0x114
function init()
{
    callback::on_connect( &on_player_connect );
    callback::on_ai_killed( &function_8addaa01 );
    callback::on_laststand( &on_player_last_stand );
    callback::on_ai_killed( &function_60f79e9c );
    level.n_electric_trap_kills = 0;
    callback::on_ai_killed( &function_7fe4eb1d );
    callback::function_74872db6( &function_60193f7d );
    callback::function_74872db6( &function_dab4588 );
    callback::on_round_end( &function_d62a70b4 );
}

// Namespace zm_office_trophies/zm_office_trophies
// Params 0
// Checksum 0x2fd07513, Offset: 0x2f8
// Size: 0x64
function on_player_connect()
{
    self thread function_b091b039();
    self.var_e9f787ee = 0;
    self.var_5a15be2a = &function_ea30554a;
    self.var_d67976f1 = 0;
    self.var_32ab02ea = 0;
    self thread player_teleport_watcher();
}

// Namespace zm_office_trophies/zm_office_trophies
// Params 0
// Checksum 0x155a5768, Offset: 0x368
// Size: 0x74
function function_b091b039()
{
    self endon( #"disconnect" );
    self waittill( #"hash_5a48f79b359c304" );
    
    /#
        iprintlnbold( "<dev string:x38>" + "<dev string:x4b>" );
    #/
    
    self zm_utility::giveachievement_wrapper( "zm_office_cold_war", 0 );
}

// Namespace zm_office_trophies/zm_office_trophies
// Params 0
// Checksum 0x5052797a, Offset: 0x3e8
// Size: 0x9e
function function_ea30554a()
{
    self.var_e9f787ee++;
    
    /#
        iprintln( "<dev string:x60>" + self.var_e9f787ee );
    #/
    
    if ( self.var_e9f787ee > 114 )
    {
        /#
            iprintlnbold( "<dev string:x38>" + "<dev string:x76>" );
        #/
        
        self zm_utility::giveachievement_wrapper( "zm_office_ice", 0 );
        self.var_5a15be2a = undefined;
    }
}

// Namespace zm_office_trophies/zm_office_trophies
// Params 1
// Checksum 0x9b37a16f, Offset: 0x490
// Size: 0x10c
function function_7fe4eb1d( s_params )
{
    e_attacker = s_params.eattacker;
    
    if ( !isdefined( e_attacker ) || !isdefined( e_attacker._trap_type ) || e_attacker._trap_type != "electric" )
    {
        return;
    }
    
    level.n_electric_trap_kills++;
    
    /#
        iprintln( "<dev string:x86>" + level.n_electric_trap_kills );
    #/
    
    if ( level.n_electric_trap_kills > 114 )
    {
        /#
            iprintlnbold( "<dev string:x38>" + "<dev string:x9e>" );
        #/
        
        zm_utility::giveachievement_wrapper( "zm_office_shock", 1 );
        callback::remove_on_ai_killed( &function_7fe4eb1d );
    }
}

// Namespace zm_office_trophies/zm_office_trophies
// Params 0
// Checksum 0x5989f554, Offset: 0x5a8
// Size: 0xbc
function function_60193f7d()
{
    if ( level flag::get( "power_on" ) )
    {
        callback::function_50fdac80( &function_60193f7d );
        return;
    }
    
    if ( level.round_number > 19 )
    {
        /#
            iprintlnbold( "<dev string:x38>" + "<dev string:xb0>" );
        #/
        
        zm_utility::giveachievement_wrapper( "zm_office_power", 1 );
        callback::function_50fdac80( &function_60193f7d );
    }
}

// Namespace zm_office_trophies/zm_office_trophies
// Params 1
// Checksum 0xfc110d03, Offset: 0x670
// Size: 0x126
function function_8addaa01( params )
{
    e_attacker = params.eattacker;
    
    if ( !isdefined( e_attacker.var_d67976f1 ) )
    {
        return;
    }
    
    if ( self.archetype != #"nova_crawler" || params.smeansofdeath == "MOD_PISTOL_BULLET" || params.smeansofdeath == "MOD_RIFLE_BULLET" )
    {
        return;
    }
    
    e_attacker.var_d67976f1++;
    
    /#
        iprintln( "<dev string:xc2>" + e_attacker.var_d67976f1 );
    #/
    
    if ( e_attacker.var_d67976f1 > 49 )
    {
        /#
            iprintlnbold( "<dev string:x38>" + "<dev string:xdd>" );
        #/
        
        e_attacker zm_utility::giveachievement_wrapper( "zm_office_strike", 0 );
        e_attacker.var_d67976f1 = undefined;
    }
}

// Namespace zm_office_trophies/zm_office_trophies
// Params 0
// Checksum 0x7417580, Offset: 0x7a0
// Size: 0xb4
function function_dab4588()
{
    if ( zm_zonemgr::zone_is_enabled( "war_room_zone_top" ) )
    {
        callback::function_50fdac80( &function_dab4588 );
        return;
    }
    
    if ( level.round_number > 19 )
    {
        /#
            iprintlnbold( "<dev string:x38>" + "<dev string:xf0>" );
        #/
        
        zm_utility::giveachievement_wrapper( "zm_office_office", 1 );
        callback::function_50fdac80( &function_dab4588 );
    }
}

// Namespace zm_office_trophies/zm_office_trophies
// Params 0
// Checksum 0xf35b642, Offset: 0x860
// Size: 0x1c
function on_player_last_stand()
{
    self thread function_edf1b266();
}

// Namespace zm_office_trophies/zm_office_trophies
// Params 0
// Checksum 0x7a61f06d, Offset: 0x888
// Size: 0x5c
function function_edf1b266()
{
    self endon( #"death", #"disconnect", #"player_revived" );
    self waittill( #"teleporting" );
    self thread function_1ac7a037();
}

// Namespace zm_office_trophies/zm_office_trophies
// Params 0
// Checksum 0xea3fc5a0, Offset: 0x8f0
// Size: 0x84
function function_1ac7a037()
{
    self endon( #"death", #"disconnect" );
    self waittill( #"player_revived" );
    
    /#
        iprintlnbold( "<dev string:x38>" + "<dev string:x103>" );
    #/
    
    self zm_utility::giveachievement_wrapper( "zm_office_crawl", 0 );
}

// Namespace zm_office_trophies/zm_office_trophies
// Params 1
// Checksum 0x3ed0e658, Offset: 0x980
// Size: 0x11e
function function_60f79e9c( params )
{
    e_attacker = params.eattacker;
    
    if ( !isdefined( e_attacker ) || !isdefined( e_attacker.var_32ab02ea ) || !isplayer( e_attacker ) )
    {
        return;
    }
    
    if ( !e_attacker clientfield::get_to_player( "nova_crawler_gas_cloud_postfx_clientfield" ) )
    {
        return;
    }
    
    e_attacker.var_32ab02ea++;
    
    /#
        iprintln( "<dev string:x115>" + e_attacker.var_32ab02ea );
    #/
    
    if ( e_attacker.var_32ab02ea > 49 )
    {
        /#
            iprintlnbold( "<dev string:x38>" + "<dev string:x126>" );
        #/
        
        e_attacker zm_utility::giveachievement_wrapper( "zm_office_gas", 0 );
        e_attacker.var_32ab02ea = undefined;
    }
}

// Namespace zm_office_trophies/zm_office_trophies
// Params 0
// Checksum 0xa22bf87a, Offset: 0xaa8
// Size: 0xbe, Type: bool
function function_1cc0b38a()
{
    foreach ( e_player in level.activeplayers )
    {
        if ( zm_utility::is_player_valid( e_player, 0, 1 ) && !e_player istouching( level.var_83225f64[ 0 ] ) )
        {
            return false;
        }
    }
    
    return true;
}

// Namespace zm_office_trophies/zm_office_trophies
// Params 0
// Checksum 0x6ef8b3d8, Offset: 0xb70
// Size: 0x144
function function_d62a70b4()
{
    if ( isdefined( level.var_2ae5b6fb ) )
    {
        level.var_2ae5b6fb++;
        
        /#
            iprintln( "<dev string:x136>" + level.var_2ae5b6fb );
        #/
        
        if ( level.var_2ae5b6fb > 4 )
        {
            /#
                iprintlnbold( "<dev string:x38>" + "<dev string:x153>" );
            #/
            
            zm_utility::giveachievement_wrapper( "zm_office_pentupagon", 1 );
            level notify( #"hash_40475441c5bdca82" );
            callback::remove_on_round_end( &function_d62a70b4 );
        }
        
        return;
    }
    
    if ( function_1cc0b38a() )
    {
        level.var_2ae5b6fb = 1;
        
        /#
            iprintln( "<dev string:x136>" + level.var_2ae5b6fb );
        #/
        
        level thread function_98390b60();
    }
}

// Namespace zm_office_trophies/zm_office_trophies
// Params 0
// Checksum 0xc0d4e08f, Offset: 0xcc0
// Size: 0x42
function function_98390b60()
{
    level endon( #"hash_40475441c5bdca82" );
    
    while ( function_1cc0b38a() )
    {
        wait 1;
    }
    
    level.var_2ae5b6fb = undefined;
}

// Namespace zm_office_trophies/zm_office_trophies
// Params 0
// Checksum 0xfe755743, Offset: 0xd10
// Size: 0xb8
function function_3db52483()
{
    n_time = gettime();
    
    if ( !isdefined( self.var_23688a5e ) )
    {
        self.var_23688a5e = [];
    }
    else if ( !isarray( self.var_23688a5e ) )
    {
        self.var_23688a5e = array( self.var_23688a5e );
    }
    
    self.var_23688a5e[ self.var_23688a5e.size ] = n_time;
    
    while ( n_time > self.var_23688a5e[ 0 ] + 60000 )
    {
        arrayremoveindex( self.var_23688a5e, 0 );
    }
}

// Namespace zm_office_trophies/zm_office_trophies
// Params 0
// Checksum 0x6bee8d45, Offset: 0xdd0
// Size: 0x11c
function player_teleport_watcher()
{
    self endon( #"disconnect" );
    
    if ( !isdefined( self.var_23688a5e ) )
    {
        self.var_23688a5e = [];
    }
    else if ( !isarray( self.var_23688a5e ) )
    {
        self.var_23688a5e = array( self.var_23688a5e );
    }
    
    while ( self.var_23688a5e.size < 7 )
    {
        self waittill( #"teleporting" );
        self function_3db52483();
        
        /#
            iprintln( "<dev string:x16a>" + self.var_23688a5e.size );
        #/
    }
    
    /#
        iprintlnbold( "<dev string:x38>" + "<dev string:x183>" );
    #/
    
    self zm_utility::giveachievement_wrapper( "zm_office_everywhere", 0 );
}

