#using scripts\core_common\ai\zombie_death;
#using scripts\core_common\array_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\spawner_shared;
#using scripts\core_common\status_effects\status_effect_util;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\throttle_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\values_shared;
#using scripts\core_common\vehicle_shared;
#using scripts\zm\zm_hms_util;
#using scripts\zm\zm_orange_pap;
#using scripts\zm\zm_orange_util;
#using scripts\zm\zm_trap_electric;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_contracts;
#using scripts\zm_common\zm_customgame;
#using scripts\zm_common\zm_score;
#using scripts\zm_common\zm_stats;
#using scripts\zm_common\zm_traps;
#using scripts\zm_common\zm_unitrigger;
#using scripts\zm_common\zm_utility;

#namespace zm_orange_lighthouse;

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 0, eflags: 0x2
// Checksum 0xa7f00795, Offset: 0x400
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"zm_orange_lighthouse", &__init__, &__main__, undefined );
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 0
// Checksum 0xdb1253af, Offset: 0x450
// Size: 0x84
function __init__()
{
    if ( !isdefined( level.var_db63b33b ) )
    {
        level.var_db63b33b = new throttle();
        [[ level.var_db63b33b ]]->initialize( 2, 0.1 );
    }
    
    init_clientfields();
    
    /#
        level thread devgui();
        function_f5a342bc();
    #/
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 0
// Checksum 0x1c26be17, Offset: 0x4e0
// Size: 0x18c
function __main__()
{
    level.var_f92c8836 = struct::get_array( "lighthouse_trap_switch", "script_noteworthy" );
    array::run_all( level.var_f92c8836, &trap_switch_init );
    level.var_ab11c23d = getent( "lighthouse_light", "targetname" );
    level thread function_ad646ef8( 0 );
    level.var_98138d6b = 0;
    level thread function_b87894c1( "power_on1" );
    
    if ( !zm_utility::is_standard() )
    {
        level thread function_b87894c1( "power_on2" );
        level thread function_b87894c1( "power_on3" );
    }
    
    var_f9b3aa5e = getentarray( "use_elec_switch", "targetname" );
    array::thread_all( var_f9b3aa5e, &function_fcbb2307 );
    zm_traps::register_trap_damage( "lighthouse", &function_542e3c73, &function_2853c44e );
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 0
// Checksum 0x2f1798fa, Offset: 0x678
// Size: 0xb4
function init_clientfields()
{
    clientfield::register( "scriptmover", "lighthouse_on", 24000, 3, "int" );
    clientfield::register( "vehicle", "" + #"hash_19bce46b8ab82440", 24000, 1, "int" );
    clientfield::register( "actor", "" + #"hash_5af1cd27f90895ae", 24000, 1, "counter" );
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 0
// Checksum 0x626fabc5, Offset: 0x738
// Size: 0x9c
function function_6a10478()
{
    if ( level flag::get( #"hash_5a3d0402a5557739" ) )
    {
        level.var_ab11c23d clientfield::set( "lighthouse_on", 2 );
        function_1f29d511();
    }
    else
    {
        level.var_ab11c23d clientfield::set( "lighthouse_on", 1 );
    }
    
    function_da304f6e( 3 );
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 1
// Checksum 0x2545b286, Offset: 0x7e0
// Size: 0x84
function function_da304f6e( n_state )
{
    if ( level.var_ab11c23d.var_3931cef9 !== n_state )
    {
        level.var_ab11c23d notify( #"hash_78fc5bbd712046b0" );
        level.var_ab11c23d.var_3931cef9 = n_state;
        
        if ( !is_trap_active() )
        {
            function_d85bd834();
        }
    }
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 0
// Checksum 0xe0196ae8, Offset: 0x870
// Size: 0xea
function function_d85bd834()
{
    switch ( level.var_ab11c23d.var_3931cef9 )
    {
        case 0:
            level.var_ab11c23d thread function_1aeab14e();
            break;
        case 1:
            level.var_ab11c23d thread lighthouse_freakout();
            break;
        case 2:
            level.var_ab11c23d thread function_92b102fc();
            break;
        case 3:
            level.var_ab11c23d thread function_dbad2f5a();
            break;
    }
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 0
// Checksum 0xcbb2e78c, Offset: 0x968
// Size: 0x84
function function_dbad2f5a()
{
    self endon( #"death", #"hash_78fc5bbd712046b0" );
    level endon( #"end_game" );
    self thread function_1b488412( level.var_3428b470.origin, 1 );
    wait 5;
    level thread function_da304f6e( 0 );
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 0
// Checksum 0xa5e4214d, Offset: 0x9f8
// Size: 0x13e
function function_1aeab14e()
{
    self endon( #"death", #"hash_78fc5bbd712046b0" );
    var_14c78bd5 = 2;
    var_223dfca3 = 0.2;
    var_d4cb0c1 = var_223dfca3 / 2;
    
    if ( level flag::get( #"hash_5a3d0402a5557739" ) )
    {
        level.var_ab11c23d clientfield::set( "lighthouse_on", 2 );
    }
    
    if ( self.angles[ 0 ] != 0 )
    {
        self rotateto( ( 10, self.angles[ 1 ] + 50, 0 ), var_14c78bd5 );
        wait var_14c78bd5;
    }
    
    while ( true )
    {
        self rotateto( ( 10, self.angles[ 1 ] + 5, 0 ), var_223dfca3 );
        wait var_d4cb0c1;
    }
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 0
// Checksum 0x6a306e5e, Offset: 0xb40
// Size: 0xce
function lighthouse_freakout()
{
    self endon( #"death", #"hash_78fc5bbd712046b0" );
    
    while ( true )
    {
        n_time = randomfloatrange( 0.5, 1 );
        self rotateto( ( randomintrange( -90, 90 ), randomintrange( -180, 180 ), randomintrange( -90, 90 ) ), n_time );
        self waittill( #"rotatedone" );
    }
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 0
// Checksum 0xf88b934b, Offset: 0xc18
// Size: 0x84
function function_92b102fc()
{
    v_pap = level.var_7d8bf93f.origin;
    self function_1b488412( v_pap, 1 );
    
    if ( level flag::get( #"hash_5a3d0402a5557739" ) )
    {
        level.var_ab11c23d clientfield::set( "lighthouse_on", 3 );
    }
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 2
// Checksum 0xaa0054e3, Offset: 0xca8
// Size: 0x6c
function function_1b488412( v_pos, n_aim_time )
{
    v_dir = v_pos - self.origin;
    angles = vectortoangles( v_dir );
    self rotateto( angles, n_aim_time );
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 1
// Checksum 0x51d7f821, Offset: 0xd20
// Size: 0x94
function function_b87894c1( str_flag )
{
    level endon( #"game_ended" );
    level flag::wait_till( str_flag );
    function_45489835( str_flag );
    
    if ( level.var_98138d6b < 1 )
    {
        function_1baa684c( str_flag );
    }
    
    level thread function_320f5fb3();
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 1
// Checksum 0xa102a9b5, Offset: 0xdc0
// Size: 0xfa
function function_45489835( str_flag )
{
    switch ( str_flag )
    {
        case #"power_on1":
            playsoundatposition( #"hash_5f9ff903d1e07acb", ( 0, 0, 0 ) );
            break;
        case #"power_on2":
            playsoundatposition( #"hash_7bb9774ddb11bc9f", ( 0, 0, 0 ) );
            playsoundatposition( #"hash_957e90e703a238a", ( 1311, -1971, 1102 ) );
            break;
        case #"power_on3":
            playsoundatposition( #"hash_4760ffee46ef7f74", ( 0, 0, 0 ) );
            break;
    }
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 0
// Checksum 0x18192c49, Offset: 0xec8
// Size: 0x1e2
function function_320f5fb3()
{
    level endon( #"end_game" );
    level.var_98138d6b++;
    
    switch ( level.var_98138d6b )
    {
        case 1:
            function_6a10478();
            wait 3;
            
            if ( isdefined( level.var_9a8dee15 ) )
            {
                level.var_9a8dee15 thread zm_orange_util::function_51b752a9( #"vox_power_switch_1_activate" );
            }
            
            break;
        case 2:
            level thread zm_orange_pap::function_56db9cdc();
            
            if ( zm_custom::function_901b751c( #"zmpowerstate" ) != 2 )
            {
                wait 3;
                level.var_1c53964e zm_hms_util::function_6a0d675d( "vox_power_switch_2_activate" );
                level thread zm_orange_util::function_fd24e47f( "vox_power_switch_2_activate" );
            }
            
            level thread zm_orange_util::function_3d6809e9();
            break;
        case 3:
            level.var_6ed7c585 = 1;
            level thread zm_orange_pap::function_2401694f();
            
            if ( zm_custom::function_901b751c( #"zmpowerstate" ) != 2 )
            {
                wait 3;
                level.var_1c53964e thread zm_hms_util::function_6a0d675d( "vox_power_switch_3_activate" );
            }
            
            break;
    }
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 0
// Checksum 0xe04ff06f, Offset: 0x10b8
// Size: 0x94
function function_602d605()
{
    level.var_ab11c23d clientfield::set( "lighthouse_on", 2 );
    level.var_ab11c23d.b_blue = 1;
    
    if ( level flag::get( #"hash_3028604821838259" ) )
    {
        exploder::exploder( "fxexp_pap_light_icefloe" );
    }
    
    level thread function_ad646ef8( 2 );
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 0
// Checksum 0x3e0c1702, Offset: 0x1158
// Size: 0x44
function function_1f29d511()
{
    array::thread_all( level.var_f92c8836, &function_1e43f3c7 );
    level thread function_ad646ef8( 2 );
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 1
// Checksum 0x9b845018, Offset: 0x11a8
// Size: 0xc2
function function_1baa684c( str_flag )
{
    switch ( str_flag )
    {
        case #"power_on1":
            level.var_3428b470 = struct::get( "power_intro_1" );
            break;
        case #"power_on2":
            level.var_3428b470 = struct::get( "power_intro_2" );
            break;
        case #"power_on3":
            level.var_3428b470 = struct::get( "power_intro_3" );
            break;
    }
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 1
// Checksum 0xe32e927a, Offset: 0x1278
// Size: 0x39a
function function_ad646ef8( n_state )
{
    e_lighthouse = level.var_ab11c23d;
    
    if ( e_lighthouse.var_58df9892 !== n_state )
    {
        e_lighthouse notify( #"hash_1aa56851d9d4ec0d" );
        e_lighthouse.var_58df9892 = n_state;
        
        /#
            iprintln( "<dev string:x38>" + level.var_4b3d7dc1[ e_lighthouse.var_58df9892 ] );
        #/
        
        switch ( e_lighthouse.var_58df9892 )
        {
            case 0:
                array::thread_all( level.var_f92c8836, &function_76adab5e );
                break;
            case 1:
                e_lighthouse notify( #"hash_6e9ab520bd7ba3c" );
                function_d85bd834();
                array::run_all( level.var_f92c8836, &function_f7e6bf61, 0 );
                n_cooldown = zm_traps::function_da13db45( 60, e_lighthouse.var_d9ae30d6 );
                e_lighthouse.var_a5a067c5 = undefined;
                e_lighthouse.var_d9ae30d6 = undefined;
                e_lighthouse.activated_by_player = undefined;
                e_lighthouse.v_trap_target = undefined;
                e_lighthouse thread function_74b930af( n_cooldown, 2 );
                break;
            case 2:
                array::thread_all( level.var_f92c8836, &function_76adab5e );
                break;
            case 3:
                e_lighthouse notify( #"hash_78fc5bbd712046b0" );
                e_lighthouse thread function_71399d9c();
                break;
            case 4:
                e_lighthouse thread function_ef69a891( e_lighthouse.var_a5a067c5, e_lighthouse.var_d9ae30d6 );
                break;
            case 5:
                e_lighthouse thread function_72ff128e( e_lighthouse.v_trap_target );
                break;
            case 6:
                e_lighthouse thread shoot_trap_target( e_lighthouse.v_trap_target, e_lighthouse.var_d9ae30d6 );
                break;
            case 7:
                e_lighthouse.v_trap_target = undefined;
                e_lighthouse thread function_ea089392();
                e_lighthouse thread function_74b930af( 3, 4 );
                break;
            case 8:
                e_lighthouse thread function_74a24d00();
                break;
            case 9:
                e_lighthouse thread function_76ff758d();
                break;
        }
    }
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 2
// Checksum 0xb210aabc, Offset: 0x1620
// Size: 0x94
function function_74b930af( n_time, n_state )
{
    self endon( #"death", #"hash_6e9ab520bd7ba3c" );
    wait n_time;
    
    while ( n_state == 1 && ( self.var_58df9892 == 5 || self.var_58df9892 == 6 ) )
    {
        wait 0.1;
    }
    
    level thread function_ad646ef8( n_state );
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 0
// Checksum 0xc5b0eb3e, Offset: 0x16c0
// Size: 0x21c
function function_71399d9c()
{
    self endon( #"death", #"hash_1aa56851d9d4ec0d" );
    
    for ( vh_target = spawner::simple_spawn_single( getent( "virgil", "targetname" ) ); !isdefined( vh_target ) ; vh_target = spawner::simple_spawn_single( getent( "virgil", "targetname" ) ) )
    {
        waitframe( 1 );
    }
    
    vh_target.origin = self.var_223285b1.origin;
    vh_target.b_moving = 0;
    vh_target val::set( #"trap_target", "takedamage", 0 );
    self.vh_target = vh_target;
    self function_1b488412( vh_target.origin, 1 );
    self waittill( #"rotatedone" );
    level.var_ab11c23d clientfield::set( "lighthouse_on", 4 );
    self.vh_target clientfield::set( "" + #"hash_19bce46b8ab82440", 1 );
    self.vh_target thread function_18f63949();
    self function_2b2f2a7f();
    self.t_trap thread zm_traps::trap_damage();
    self.t_trap thread soapstone_watcher();
    wait 2;
    level thread function_ad646ef8( 8 );
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 0
// Checksum 0x4d4e505e, Offset: 0x18e8
// Size: 0xb6
function function_2b2f2a7f()
{
    t_trap = spawn( "trigger_radius_new", self.vh_target.origin, 512 | 1, 100 );
    t_trap._trap_type = "lighthouse";
    t_trap enablelinkto();
    t_trap linkto( self.vh_target );
    self.t_trap = t_trap;
    t_trap.activated_by_player = level.var_ab11c23d.activated_by_player;
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 0
// Checksum 0x3876b187, Offset: 0x19a8
// Size: 0x6c
function function_74a24d00()
{
    self.vh_target thread vehicle::get_on_and_go_path( self.var_223285b1 );
    self.vh_target setspeed( self.var_3f813eec );
    self.vh_target.b_moving = 1;
    self.vh_target thread function_fc65cb61();
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 0
// Checksum 0x65d63047, Offset: 0x1a20
// Size: 0x60
function function_18f63949()
{
    self endon( #"death" );
    
    while ( true )
    {
        if ( self.b_moving )
        {
            level.var_ab11c23d function_1b488412( self.origin, 0.1 );
        }
        
        wait 0.1;
    }
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 0
// Checksum 0x4566c0d9, Offset: 0x1a88
// Size: 0x44
function function_fc65cb61()
{
    self endon( #"death" );
    self waittill( #"reached_end_node" );
    level.var_ab11c23d thread function_76ff758d();
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 0
// Checksum 0x13e89de6, Offset: 0x1ad8
// Size: 0xc4
function function_76ff758d()
{
    self endon( #"death" );
    self.vh_target.b_moving = 0;
    wait 2;
    self.t_trap notify( #"trap_done" );
    self.vh_target clientfield::set( "" + #"hash_19bce46b8ab82440", 0 );
    self.t_trap delete();
    self.vh_target delete();
    level thread function_ad646ef8( 1 );
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 1
// Checksum 0x8302eb5f, Offset: 0x1ba8
// Size: 0x84
function function_56b9aca4( e_activator )
{
    var_82224aaf = isdefined( self.var_82224aaf ) ? self.var_82224aaf : 500;
    a_e_targets = e_activator getenemiesinradius( self.origin, var_82224aaf );
    
    if ( a_e_targets.size > 0 )
    {
        return arraygetclosest( self.origin, a_e_targets );
    }
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 1
// Checksum 0xe5d01afd, Offset: 0x1c38
// Size: 0x7c
function function_72ff128e( v_target )
{
    self endon( #"death", #"hash_1aa56851d9d4ec0d" );
    self function_1b488412( v_target, 1 );
    self waittill( #"rotatedone" );
    level thread function_ad646ef8( 6 );
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 2
// Checksum 0xfdfb53fc, Offset: 0x1cc0
// Size: 0x74
function shoot_trap_target( v_target, e_activator )
{
    self endon( #"death", #"hash_1aa56851d9d4ec0d" );
    wait 0.5;
    trigger_trap_explosion( v_target, e_activator );
    level thread function_ad646ef8( 7 );
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 2
// Checksum 0x737412ff, Offset: 0x1d40
// Size: 0x22c
function trigger_trap_explosion( v_pos, e_activator )
{
    a_e_ai = e_activator getenemiesinradius( v_pos, 250 );
    array::thread_all( a_e_ai, &zm_trap_electric::damage, level.var_ab11c23d );
    
    if ( a_e_ai.size > 0 )
    {
        level notify( #"hash_5e2619172b4487dd", { #n_count:a_e_ai.size } );
    }
    
    a_e_players = getplayers();
    var_6cb5ae98 = 250 * 250;
    
    foreach ( e_player in a_e_players )
    {
        if ( distancesquared( v_pos, e_player.origin ) <= var_6cb5ae98 )
        {
            e_player thread zm_trap_electric::player_damage( level.var_ab11c23d );
        }
    }
    
    if ( isdefined( level.s_soapstone ) && isdefined( level.s_soapstone.e_stone ) )
    {
        if ( distancesquared( v_pos, level.s_soapstone.e_stone.origin ) <= 250 * 250 )
        {
            level.s_soapstone.is_charged = 1;
            level.s_soapstone.is_hot = 1;
        }
    }
    
    level thread function_576ecbe6( v_pos );
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 1
// Checksum 0x2928444f, Offset: 0x1f78
// Size: 0x54
function function_576ecbe6( v_pos )
{
    e_tag = util::spawn_model( "tag_origin", v_pos, ( 0, 0, 0 ) );
    wait 5;
    e_tag delete();
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 2
// Checksum 0xa2403cd7, Offset: 0x1fd8
// Size: 0x8c
function function_27304b98( var_a5a067c5, var_a75e9b3b )
{
    var_82224aaf = isdefined( var_a5a067c5.var_82224aaf ) ? var_a5a067c5.var_82224aaf : 500;
    var_548dce62 = var_a5a067c5.origin + var_82224aaf * zm_hms_util::function_b649cf93();
    self function_1b488412( var_548dce62, var_a75e9b3b );
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 2
// Checksum 0x3ebb03b3, Offset: 0x2070
// Size: 0xdc
function function_ef69a891( var_a5a067c5, e_activator )
{
    self endon( #"death", #"hash_1aa56851d9d4ec0d" );
    e_target = var_a5a067c5 function_56b9aca4( e_activator );
    
    if ( !isdefined( e_target ) )
    {
        self thread function_ea089392();
        
        while ( !isdefined( e_target ) )
        {
            wait 0.1;
            e_target = var_a5a067c5 function_56b9aca4( e_activator );
        }
    }
    
    self.v_trap_target = e_target.origin;
    level thread function_ad646ef8( 5 );
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 0
// Checksum 0xa7c11031, Offset: 0x2158
// Size: 0x6e
function function_ea089392()
{
    self endon( #"death", #"hash_1aa56851d9d4ec0d" );
    
    while ( true )
    {
        self function_27304b98( self.var_a5a067c5, 2 );
        self waittill( #"rotatedone" );
    }
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 1
// Checksum 0x73d007f0, Offset: 0x21d0
// Size: 0x13c
function function_2ad3b642( s_trap )
{
    self thread zm_audio::create_and_play_dialog( #"trap_lighthouse", #"activate" );
    level.var_ab11c23d.var_223285b1 = s_trap.var_223285b1;
    level.var_ab11c23d.var_3f813eec = s_trap.travel_speed;
    level.var_ab11c23d.var_d9ae30d6 = self;
    playsoundatposition( #"zmb_cha_ching", ( 1692, 444, 134 ) );
    level.var_ab11c23d.activated_by_player = self;
    level thread function_ad646ef8( 3 );
    array::run_all( level.var_f92c8836, &function_f7e6bf61, 1 );
    array::thread_all( level.var_f92c8836, &function_76adab5e );
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 0
// Checksum 0xe05e7116, Offset: 0x2318
// Size: 0x20c
function electrocute_zombie()
{
    self endon( #"death" );
    self clientfield::set( "electrocute_ai_fx", 1 );
    self.marked_for_death = 1;
    
    if ( isactor( self ) )
    {
        refs[ 0 ] = "guts";
        refs[ 1 ] = "right_arm";
        refs[ 2 ] = "left_arm";
        refs[ 3 ] = "right_leg";
        refs[ 4 ] = "left_leg";
        refs[ 5 ] = "no_legs";
        refs[ 6 ] = "head";
        self.a.gib_ref = refs[ randomint( refs.size ) ];
        playsoundatposition( #"hash_5183b687ad8d715a", self.origin );
        
        if ( math::cointoss() )
        {
            self thread zm_traps::electroctute_death_fx();
        }
        
        bhtnactionstartevent( self, "electrocute" );
        self notify( #"bhtn_action_notify", { #action:"electrocute" } );
        wait randomfloat( 1.25 );
        self playsound( #"hash_5183b687ad8d715a" );
    }
    
    self dodamage( self.health + 666, self.origin );
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 0
// Checksum 0xfd219bbc, Offset: 0x2530
// Size: 0x84
function electrocute_player()
{
    shock_status_effect = getstatuseffect( #"hash_19533caf858a9f3b" );
    
    if ( !( isdefined( self.b_no_trap_damage ) && self.b_no_trap_damage ) )
    {
        self thread zm_traps::player_elec_damage( level.var_ab11c23d );
        self status_effect::status_effect_apply( shock_status_effect, undefined, self, 0 );
    }
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 0
// Checksum 0x2422eb3f, Offset: 0x25c0
// Size: 0xf4
function trap_switch_init()
{
    self.var_223285b1 = getvehiclenode( self.var_40d27c6d, "targetname" );
    a_pieces = zm_hms_util::function_bffcedde( self.target, "targetname", "script_noteworthy" );
    self.mdl_switch = a_pieces[ #"switch" ];
    self.mdl_light = a_pieces[ #"light" ];
    self.s_panel = struct::get( self.target );
    self zm_unitrigger::create( &function_85d3d607, 64 );
    self thread function_72d528e6();
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 1
// Checksum 0xe1256c37, Offset: 0x26c0
// Size: 0x1f6, Type: bool
function function_85d3d607( e_player )
{
    if ( level.var_98138d6b < 1 )
    {
        self zm_hms_util::function_b2e1326( 1 );
    }
    else if ( isdefined( level.var_4f7df1ac ) && level.var_4f7df1ac )
    {
        self zm_hms_util::function_b2e1326( 0 );
    }
    else
    {
        switch ( level.var_ab11c23d.var_58df9892 )
        {
            case 0:
                self zm_hms_util::function_b2e1326( 0 );
                break;
            case 1:
                self zm_hms_util::function_b2e1326( 4 );
                break;
            case 2:
                if ( level flag::get( #"half_price_traps" ) )
                {
                    self zm_hms_util::function_b2e1326( 2, int( 500 ) );
                }
                else
                {
                    self zm_hms_util::function_b2e1326( 2, 1000 );
                }
                
                break;
            case 3:
            case 4:
            case 5:
            case 6:
            case 7:
                self zm_hms_util::function_b2e1326( 3 );
                break;
        }
    }
    
    return true;
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 0
// Checksum 0x7aa6fef0, Offset: 0x28c0
// Size: 0x168
function function_72d528e6()
{
    self endon( #"death" );
    
    while ( true )
    {
        s_waitresult = self waittill( #"trigger_activated" );
        e_who = s_waitresult.e_who;
        
        if ( isdefined( level.var_4f7df1ac ) && level.var_4f7df1ac )
        {
            continue;
        }
        
        if ( zm_utility::is_player_valid( e_who ) && level.var_ab11c23d.var_58df9892 === 2 )
        {
            if ( level flag::get( #"half_price_traps" ) )
            {
                if ( self.mdl_switch zm_traps::trap_purchase( e_who, int( 500 ) ) )
                {
                    e_who function_2ad3b642( self );
                }
                
                continue;
            }
            
            if ( self.mdl_switch zm_traps::trap_purchase( e_who, 1000 ) )
            {
                e_who function_2ad3b642( self );
            }
        }
    }
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 1
// Checksum 0x97288241, Offset: 0x2a30
// Size: 0x64
function function_f7e6bf61( b_on )
{
    if ( b_on )
    {
        self.mdl_switch rotatepitch( 180, 0.5 );
        return;
    }
    
    self.mdl_switch rotatepitch( -180, 0.5 );
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 0
// Checksum 0x46aa6871, Offset: 0x2aa0
// Size: 0xca
function function_76adab5e()
{
    switch ( level.var_ab11c23d.var_58df9892 )
    {
        case 0:
            self.mdl_light setmodel( "p8_zm_off_trap_switch_light" );
            break;
        case 3:
            self.mdl_light setmodel( "p8_zm_off_trap_switch_light_red_on" );
            break;
        case 2:
            self.mdl_light setmodel( "p8_zm_off_trap_switch_light_green_on" );
            break;
    }
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 0
// Checksum 0x3af975c5, Offset: 0x2b78
// Size: 0x24
function function_1e43f3c7()
{
    self.s_panel scene::play( "open" );
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 0
// Checksum 0xbb049fe7, Offset: 0x2ba8
// Size: 0x1c, Type: bool
function is_trap_active()
{
    return level.var_ab11c23d.var_58df9892 > 2;
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 1
// Checksum 0xc2028685, Offset: 0x2bd0
// Size: 0x1c4
function function_2853c44e( e_trap )
{
    self endon( #"death" );
    self clientfield::increment( "" + #"hash_5af1cd27f90895ae", 1 );
    
    if ( isdefined( self.var_5475b4ad ) )
    {
        self [[ self.var_5475b4ad ]]( e_trap );
        return;
    }
    
    [[ level.var_db63b33b ]]->waitinqueue( self );
    level notify( #"trap_kill", { #e_victim:self, #e_trap:e_trap } );
    level notify( #"hash_5e2619172b4487dd", { #n_count:1 } );
    
    if ( isdefined( level.var_ab11c23d.activated_by_player ) && isplayer( level.var_ab11c23d.activated_by_player ) )
    {
        level.var_ab11c23d.activated_by_player zm_stats::increment_challenge_stat( #"zombie_hunter_kill_trap" );
        level.var_ab11c23d.activated_by_player contracts::increment_zm_contract( #"contract_zm_trap_kills" );
    }
    
    self dodamage( 20000, e_trap.origin, undefined, e_trap, undefined, "MOD_BURNED", 0, undefined );
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 1
// Checksum 0x95141cd6, Offset: 0x2da0
// Size: 0x6c
function function_542e3c73( e_trap )
{
    if ( !isdefined( self.var_ab551063 ) )
    {
        self dodamage( 50, e_trap.origin, undefined, e_trap, undefined, "MOD_BURNED", 0, undefined );
        self thread function_b00e24fb();
    }
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 0
// Checksum 0xf4b17c65, Offset: 0x2e18
// Size: 0x22c
function soapstone_watcher()
{
    self endon( #"trap_done" );
    var_76b556c9 = 0;
    var_dac21b13 = 0;
    
    while ( true )
    {
        if ( isdefined( level.s_soapstone ) && isdefined( level.s_soapstone.s_placement ) && level.s_soapstone.s_placement.e_stone istouching( self ) )
        {
            var_76b556c9 += 0.1;
            
            if ( var_76b556c9 >= 1 )
            {
                if ( !level.s_soapstone.is_charged || !level.s_soapstone.is_hot )
                {
                    level thread zm_orange_util::function_fd24e47f( "vox_soap_stones_heat", -1, 1, 0 );
                }
                
                level.s_soapstone.is_charged = 1;
                level.s_soapstone.is_hot = 1;
                level.s_soapstone.s_placement.e_stone clientfield::set( "soapstone_start_fx", 2 );
                level.s_soapstone.s_placement.e_stone setmodel( "p8_zm_ora_soapstone_01_hot" );
                
                if ( level.s_soapstone.var_b6e5b65f == 2 )
                {
                    level.s_soapstone.s_placement.var_28f1732d clientfield::set( "soapstone_start_fx", 2 );
                    level.s_soapstone.s_placement.var_28f1732d setmodel( "p8_zm_ora_soapstone_01_hot" );
                }
                
                break;
            }
        }
        
        wait 0.1;
    }
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 0
// Checksum 0xd12cc051, Offset: 0x3050
// Size: 0x3a
function function_b00e24fb()
{
    self endon( #"death" );
    self.var_ab551063 = 1;
    wait 0.5;
    self.var_ab551063 = undefined;
}

// Namespace zm_orange_lighthouse/zm_orange_lighthouse
// Params 0
// Checksum 0x4fc9b805, Offset: 0x3098
// Size: 0x80
function function_fcbb2307()
{
    level endon( #"hash_9a7b18e2622af5d" );
    self endon( #"death" );
    waitresult = self waittill( #"trigger" );
    level.var_9a8dee15 = waitresult.activator;
    level notify( #"hash_9a7b18e2622af5d" );
}

/#

    // Namespace zm_orange_lighthouse/zm_orange_lighthouse
    // Params 0, eflags: 0x4
    // Checksum 0x480a6619, Offset: 0x3120
    // Size: 0x182, Type: dev
    function private function_f5a342bc()
    {
        if ( !isdefined( level.var_4b3d7dc1 ) )
        {
            level.var_4b3d7dc1 = [];
        }
        else if ( !isarray( level.var_4b3d7dc1 ) )
        {
            level.var_4b3d7dc1 = array( level.var_4b3d7dc1 );
        }
        
        level.var_4b3d7dc1[ 0 ] = "<dev string:x52>";
        level.var_4b3d7dc1[ 1 ] = "<dev string:x5b>";
        level.var_4b3d7dc1[ 2 ] = "<dev string:x65>";
        level.var_4b3d7dc1[ 3 ] = "<dev string:x6d>";
        level.var_4b3d7dc1[ 4 ] = "<dev string:x75>";
        level.var_4b3d7dc1[ 5 ] = "<dev string:x81>";
        level.var_4b3d7dc1[ 6 ] = "<dev string:x8a>";
        level.var_4b3d7dc1[ 7 ] = "<dev string:x93>";
        level.var_4b3d7dc1[ 8 ] = "<dev string:x9e>";
        level.var_4b3d7dc1[ 9 ] = "<dev string:xa7>";
    }

    // Namespace zm_orange_lighthouse/zm_orange_lighthouse
    // Params 0, eflags: 0x4
    // Checksum 0xf72be9b2, Offset: 0x32b0
    // Size: 0x1e0, Type: dev
    function private devgui()
    {
        level.var_10f86d56 = zm_hms_util::function_2719d4c0( "<dev string:xaf>", "<dev string:xc5>", "<dev string:xd9>" );
        adddebugcommand( "<dev string:xe6>" );
        adddebugcommand( "<dev string:x167>" );
        adddebugcommand( "<dev string:x1e3>" );
        
        while ( true )
        {
            waitframe( 1 );
            str_command = getdvarstring( #"zm_orange_lighthouse_cmd", "<dev string:x260>" );
            
            switch ( str_command )
            {
                case #"hash_2e5bdb11c6bc0cd":
                    getplayers()[ 0 ] function_2ad3b642( level.var_10f86d56[ 0 ] );
                    break;
                case #"hash_2e5bab11c6bbbb4":
                    getplayers()[ 0 ] function_2ad3b642( level.var_10f86d56[ 1 ] );
                    break;
                case #"hash_2e5bbb11c6bbd67":
                    getplayers()[ 0 ] function_2ad3b642( level.var_10f86d56[ 2 ] );
                    break;
            }
            
            setdvar( #"zm_orange_lighthouse_cmd", "<dev string:x260>" );
        }
    }

    // Namespace zm_orange_lighthouse/zm_orange_lighthouse
    // Params 0
    // Checksum 0x85ef2b21, Offset: 0x3498
    // Size: 0x5e, Type: dev
    function function_f6d23861()
    {
        self endon( #"death" );
        
        while ( true )
        {
            sphere( self.origin, 100, ( 1, 0, 0 ), 0.6, 0, 8, 1 );
            waitframe( 1 );
        }
    }

#/
