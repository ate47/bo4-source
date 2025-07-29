#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\laststand_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm\zm_hms_util;
#using scripts\zm\zm_orange_water;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_equipment;
#using scripts\zm_common\zm_round_spawning;
#using scripts\zm_common\zm_sq;
#using scripts\zm_common\zm_utility;

#namespace zm_orange_ee_freeze_mode;

// Namespace zm_orange_ee_freeze_mode/zm_orange_ee_freeze_mode
// Params 0
// Checksum 0x80f724d1, Offset: 0x180
// Size: 0x4
function preload()
{
    
}

// Namespace zm_orange_ee_freeze_mode/zm_orange_ee_freeze_mode
// Params 0
// Checksum 0xa7a1fd36, Offset: 0x190
// Size: 0x294
function main()
{
    level flag::init( #"freeze_mode" );
    level flag::init( #"all_freeze" );
    zm_audio::sndannouncervoxadd( #"freeze_mode", #"hash_2df47a99f054462e" );
    level.var_50c3a25b = getentarray( "freeze_mode_ice", "targetname" );
    
    foreach ( ice in level.var_50c3a25b )
    {
        ice hide();
        ice notsolid();
    }
    
    level.var_c422a9ae = getentarray( "freeze_mode_blockers", "targetname" );
    
    foreach ( barrier in level.var_c422a9ae )
    {
        barrier notsolid();
    }
    
    zm_sq::register( #"freeze_mode", #"step_1", #"freeze_quest", &freeze_quest, &freeze_quest_cleanup );
    zm_sq::start( #"freeze_mode", zm_utility::is_ee_enabled() );
    callback::on_spawned( &function_1bb74851 );
}

// Namespace zm_orange_ee_freeze_mode/zm_orange_ee_freeze_mode
// Params 1
// Checksum 0x33ab9bc8, Offset: 0x430
// Size: 0x5c
function freeze_quest( var_a276c861 )
{
    level flag::wait_till_any( array( #"all_freeze", #"hell_on_earth", #"hash_198bc172b5af7f25" ) );
}

// Namespace zm_orange_ee_freeze_mode/zm_orange_ee_freeze_mode
// Params 2
// Checksum 0xeffdeee9, Offset: 0x498
// Size: 0x52c
function freeze_quest_cleanup( var_a276c861, var_19e802fa )
{
    if ( var_a276c861 )
    {
        level flag::set( #"all_freeze" );
    }
    
    if ( level flag::get( #"hell_on_earth" ) || level flag::get( #"hash_198bc172b5af7f25" ) )
    {
        return;
    }
    
    var_e08890fb = getent( "freeze_mode_button", "targetname" );
    var_e08890fb movez( var_e08890fb.script_int, 2, 0.2, 0.2 );
    wait 1.5;
    var_57e06cb = struct::get( "freeze_mode_struct", "targetname" );
    var_57e06cb zm_hms_util::function_6099877a( 72, "end_game", #"hash_6001ebf204288bf8", #"hash_3fe9eae6f03accce" );
    var_898a45da = level.var_45827161[ level.round_number + 1 ];
    
    if ( isdefined( var_898a45da ) )
    {
        zm_round_spawning::function_43aed0ca( level.round_number + 1 );
    }
    
    level flag::clear( #"hash_7d9f8ec3cb9af87e" );
    level.func_get_delay_between_rounds = &function_f85d3d98;
    zm_hms_util::function_2ba419ee( 1, int( max( 199, level.round_number ) ) );
    level flag::clear( #"break_freeze_faster" );
    
    foreach ( zone in level.zones )
    {
        if ( zone.name != "docks_1" && zone.name != "docks_2" )
        {
            zone.is_enabled = 0;
        }
    }
    
    foreach ( ice in level.var_50c3a25b )
    {
        ice show();
        ice solid();
    }
    
    foreach ( barrier in level.var_c422a9ae )
    {
        barrier solid();
        barrier disconnectpaths();
    }
    
    zm_audio::sndannouncerplayvox( #"freeze_mode" );
    level zm_utility::function_e64ac3b6( 18, #"hash_552f81c78340aeb3" );
    
    foreach ( player in getplayers() )
    {
        player thread function_1aab918f();
    }
    
    callback::on_spawned( &function_1aab918f );
    level waittill( #"start_of_round" );
    level flag::set( #"infinite_round_spawning" );
}

// Namespace zm_orange_ee_freeze_mode/zm_orange_ee_freeze_mode
// Params 0
// Checksum 0xb242d78c, Offset: 0x9d0
// Size: 0x1c
function function_1aab918f()
{
    self thread function_e42e358e();
}

// Namespace zm_orange_ee_freeze_mode/zm_orange_ee_freeze_mode
// Params 0
// Checksum 0xe4e0e56c, Offset: 0x9f8
// Size: 0x10e
function function_1bb74851()
{
    self.var_e1257157 = 0;
    self.var_adf5d9b4 = [];
    self.var_adf5d9b4[ #"hash_2fb0927a65d8a9e" ] = 0;
    self.var_adf5d9b4[ #"hash_75f05448c75c06f" ] = 0;
    self.var_adf5d9b4[ #"hash_335d7ee067ac0e68" ] = 0;
    self.var_adf5d9b4[ #"hash_63f7af429c316620" ] = 0;
    self.var_adf5d9b4[ #"hash_1e6b498a976cdcb5" ] = 0;
    self.var_adf5d9b4[ #"hash_3a98581b802c0296" ] = 0;
    self.var_adf5d9b4[ #"hash_3461ddd73c20a747" ] = 0;
    self.var_adf5d9b4[ #"hash_99011c41f3d5380" ] = 0;
    self.var_adf5d9b4[ #"hash_381e2912fb0376dc" ] = 0;
    self.var_adf5d9b4[ #"hash_18aaabdeba54214a" ] = 0;
}

// Namespace zm_orange_ee_freeze_mode/zm_orange_ee_freeze_mode
// Params 0
// Checksum 0x119ab6d1, Offset: 0xb10
// Size: 0x8c
function function_3931c78()
{
    if ( isdefined( self.var_adf5d9b4[ self.var_5417136 ] ) && !self.var_adf5d9b4[ self.var_5417136 ] )
    {
        self.var_adf5d9b4[ self.var_5417136 ] = 1;
        self.var_e1257157++;
        
        if ( self.var_e1257157 >= self.var_adf5d9b4.size )
        {
            level flag::set( #"all_freeze" );
        }
    }
}

// Namespace zm_orange_ee_freeze_mode/zm_orange_ee_freeze_mode
// Params 0
// Checksum 0xcc036198, Offset: 0xba8
// Size: 0x6, Type: bool
function function_f85d3d98()
{
    return false;
}

// Namespace zm_orange_ee_freeze_mode/zm_orange_ee_freeze_mode
// Params 0
// Checksum 0xa4815732, Offset: 0xbb8
// Size: 0x9a
function function_e42e358e()
{
    level endon( #"end_game" );
    self endon( #"death", #"player_frozen" );
    
    while ( true )
    {
        wait 0.1;
        
        if ( !self issprinting() && !self laststand::player_is_in_laststand() )
        {
            self function_f0bdc5df();
            return;
        }
    }
}

// Namespace zm_orange_ee_freeze_mode/zm_orange_ee_freeze_mode
// Params 0
// Checksum 0x53e63a2c, Offset: 0xc60
// Size: 0xc4
function function_f0bdc5df()
{
    level endon( #"end_game" );
    self endon( #"death", #"player_frozen" );
    self thread function_6577cacc();
    self notify( #"hash_42fcb8fa7aec0734" );
    self clientfield::set_to_player( "" + #"hash_13f1aaee7ebf9986", 1 );
    self allowslide( 0 );
    self thread function_1b305413();
}

// Namespace zm_orange_ee_freeze_mode/zm_orange_ee_freeze_mode
// Params 0
// Checksum 0xac675f8c, Offset: 0xd30
// Size: 0x9a
function function_1b305413()
{
    level endon( #"end_game" );
    self endon( #"death", #"player_frozen" );
    
    while ( true )
    {
        wait 0.1;
        
        if ( self issprinting() || self laststand::player_is_in_laststand() )
        {
            self player_sprinting();
            return;
        }
    }
}

// Namespace zm_orange_ee_freeze_mode/zm_orange_ee_freeze_mode
// Params 0
// Checksum 0x99b7b905, Offset: 0xdd8
// Size: 0xc4
function player_sprinting()
{
    level endon( #"end_game" );
    self endon( #"death", #"player_frozen" );
    self notify( #"hash_668824b34b3076bc" );
    self allowslide( 1 );
    self thread zm_orange_water::function_d2dd1f2b();
    self clientfield::set_to_player( "" + #"hash_13f1aaee7ebf9986", 0 );
    self thread function_e42e358e();
}

// Namespace zm_orange_ee_freeze_mode/zm_orange_ee_freeze_mode
// Params 0
// Checksum 0x30462ee3, Offset: 0xea8
// Size: 0xbc
function function_6577cacc()
{
    level endon( #"end_game" );
    self endon( #"death", #"hash_668824b34b3076bc" );
    
    if ( !isdefined( self.var_36a93d1 ) )
    {
        self.var_36a93d1 = 0;
    }
    
    while ( true )
    {
        wait 1;
        self.var_36a93d1++;
        var_24e0e73d = 15;
        
        if ( self.var_36a93d1 >= var_24e0e73d )
        {
            waitframe( 1 );
            self thread function_9364acc1();
            self.var_36a93d1 = 0;
            return;
        }
    }
}

// Namespace zm_orange_ee_freeze_mode/zm_orange_ee_freeze_mode
// Params 0
// Checksum 0x7ff8f4d7, Offset: 0xf70
// Size: 0x31c
function function_9364acc1()
{
    self endoncallback( &zm_orange_water::function_c64292f, #"death" );
    self.var_7dc2d507 = 1;
    self notify( #"player_frozen" );
    self zm_orange_water::function_bad6907c();
    self clientfield::set( "" + #"hash_55543319943057f1", 1 );
    self clientfield::set_to_player( "" + #"hash_5160727729fd57a2", 1 );
    t_ice = spawn( "trigger_damage", self.origin, 0, 15, 72 );
    t_ice enablelinkto();
    t_ice linkto( self );
    self.t_ice = t_ice;
    self thread zm_orange_water::function_872ec0b2( t_ice );
    self thread zm_orange_water::function_6cadbaff();
    
    if ( self.var_d844486 !== 1 )
    {
        self thread zm_equipment::show_hint_text( #"hash_4b6950ec49c7e04c", 3 );
        self.var_d844486 = 1;
    }
    
    self waittill( #"hash_53bfad7081c69dee" );
    self playsound( #"hash_2f8c9575cb36a298" );
    self.var_7dc2d507 = 0;
    self zm_orange_water::function_46c3bbf7();
    self clientfield::set( "" + #"hash_55543319943057f1", 0 );
    self clientfield::set_to_player( "" + #"hash_5160727729fd57a2", 0 );
    self clientfield::set_to_player( "" + #"hash_603fc9d210bdbc4d", 1 );
    waitframe( 2 );
    self clientfield::set_to_player( "" + #"hash_603fc9d210bdbc4d", 0 );
    
    if ( isdefined( t_ice ) )
    {
        t_ice delete();
        self.t_ice = undefined;
    }
    
    self clientfield::set_to_player( "" + #"hash_13f1aaee7ebf9986", 0 );
    waitframe( 2 );
    self thread function_e42e358e();
}

