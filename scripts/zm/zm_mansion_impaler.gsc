#using script_6b221588ece2c4aa;
#using scripts\core_common\ai\systems\gib;
#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\spawner_shared;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;
#using scripts\core_common\vehicle_shared;
#using scripts\weapons\weaponobjects;
#using scripts\zm\ai\zm_ai_nosferatu;
#using scripts\zm\zm_mansion_pap_quest;
#using scripts\zm\zm_mansion_special_rounds;
#using scripts\zm\zm_mansion_util;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_bgb_pack;
#using scripts\zm_common\zm_characters;
#using scripts\zm_common\zm_customgame;
#using scripts\zm_common\zm_loadout;
#using scripts\zm_common\zm_score;
#using scripts\zm_common\zm_sq;
#using scripts\zm_common\zm_unitrigger;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_vo;
#using scripts\zm_common\zm_weapons;

#namespace mansion_impaler;

// Namespace mansion_impaler/zm_mansion_impaler
// Params 0
// Checksum 0xb0094993, Offset: 0x3f8
// Size: 0x3a4
function init()
{
    clientfield::register( "scriptmover", "" + #"candle_light", 8000, 1, "int" );
    clientfield::register( "scriptmover", "" + #"monolith_water", 8000, 1, "int" );
    clientfield::register( "scriptmover", "" + #"hash_4d45dc65a8307183", 8000, 1, "counter" );
    clientfield::register( "actor", "" + #"soul_possess", 8000, 1, "int" );
    clientfield::register( "toplayer", "" + #"hash_3d7d4c5e6ed616e9", 8000, 1, "int" );
    clientfield::register( "scriptmover", "" + #"jewelry_dropped", 8000, 1, "int" );
    clientfield::register( "scriptmover", "" + #"hash_3d5a64bed5e39d24", 8000, 1, "int" );
    clientfield::register( "world", "" + #"hash_73123721764d7374", 8000, 1, "int" );
    level.var_e93e5852 = 0;
    level.w_crossbow = getweapon( #"ww_crossbow_impaler_t8" );
    zm_weapons::include_zombie_weapon( #"ww_crossbow_impaler_t8", 0 );
    zm_weapons::add_zombie_weapon( #"ww_crossbow_impaler_t8", "", 0, 0, undefined, undefined, 0, "", "special", 0, undefined, 0 );
    weaponobjects::function_e6400478( #"ww_crossbow_impaler_t8", &createspecialcrossbowwatchertypes, 1 );
    callback::on_ai_damage( &function_615d8c38 );
    register_steps();
    init_flags();
    function_c6e2a4fd();
    
    if ( zm_custom::function_901b751c( #"zmwonderweaponisenabled" ) && zm_custom::function_901b751c( #"zmpapenabled" ) != 2 )
    {
        zm_sq::start( #"zm_mansion_impaler", 1 );
    }
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 0
// Checksum 0xdbbc2a32, Offset: 0x7a8
// Size: 0x1e4
function register_steps()
{
    zm_sq::register( #"zm_mansion_impaler", #"step_1", #"impaler_step_1", &init_step_1, &cleanup_step_1 );
    zm_sq::register( #"zm_mansion_impaler", #"step_2", #"impaler_step_2", &init_step_2, &cleanup_step_2 );
    zm_sq::register( #"zm_mansion_impaler", #"step_3", #"impaler_step_3", &init_step_3, &cleanup_step_3 );
    zm_sq::register( #"zm_mansion_impaler", #"step_4", #"impaler_step_4", &init_step_4, &cleanup_step_4 );
    zm_sq::register( #"zm_mansion_impaler", #"step_5", #"impaler_step_5", &init_step_5, &cleanup_step_5 );
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 0
// Checksum 0xea4ff13c, Offset: 0x998
// Size: 0x1c4
function init_flags()
{
    level flag::init( #"hash_67e415588696c592" );
    level flag::init( #"hash_67e416588696c745" );
    level flag::init( #"hash_67e413588696c22c" );
    level flag::init( #"hash_67e414588696c3df" );
    level flag::init( #"hash_1687323c95faf914" );
    level flag::init( #"hash_1687333c95fafac7" );
    level flag::init( #"hash_1687343c95fafc7a" );
    level flag::init( #"hash_1687353c95fafe2d" );
    level flag::init( #"hash_54326b9f13bd4f1" );
    level flag::init( #"hash_2e0f59cef233a264" );
    level flag::init( #"hash_864c8ec1475abdc" );
    level flag::init( #"hash_61263135b6fb6340" );
    level flag::init( #"hash_38fe2a57d5f9d6ba" );
    level flag::init( #"hash_f3875ca909e696f" );
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 0
// Checksum 0x3bae7147, Offset: 0xb68
// Size: 0x54
function function_c6e2a4fd()
{
    array::thread_all( struct::get_array( "s_burn" ), &function_edb1add2 );
    level thread function_355450a4();
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 0
// Checksum 0x11fb2323, Offset: 0xbc8
// Size: 0x6c
function function_355450a4()
{
    level flag::wait_till( "all_players_spawned" );
    scene::init( "p8_fxanim_zm_man_crypt_bundle" );
    exploder::exploder_stop( "exp_lgt_crypt_normal" );
    exploder::exploder_stop( "exp_lgt_crypt_darker" );
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 0
// Checksum 0x2efef39e, Offset: 0xc40
// Size: 0xe4
function function_edb1add2()
{
    level flag::wait_till( "all_players_spawned" );
    self.mdl_candle = util::spawn_model( self.model, self.origin, self.angles );
    util::wait_network_frame();
    self.mdl_candle clientfield::set( "" + #"candle_light", 1 );
    self.mdl_candle setcandamage( 1 );
    self.mdl_candle.health = 10000;
    self thread function_d84548e7();
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 1
// Checksum 0xea4814fe, Offset: 0xd30
// Size: 0x4c
function init_step_1( var_a276c861 )
{
    if ( !var_a276c861 )
    {
        while ( level.var_e93e5852 < 6 )
        {
            wait 1;
        }
        
        level flag::wait_till( "open_pap" );
    }
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 2
// Checksum 0xa5a16ce9, Offset: 0xd88
// Size: 0xe0
function cleanup_step_1( var_5ea5c94d, ended_early )
{
    a_s_candles = struct::get_array( "s_burn" );
    
    foreach ( s_candle in a_s_candles )
    {
        s_candle.mdl_candle clientfield::set( "" + #"candle_light", 0 );
    }
    
    level notify( #"hash_785f94bb8c05dc05" );
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 1
// Checksum 0xf857be6a, Offset: 0xe70
// Size: 0x17c
function init_step_2( var_a276c861 )
{
    if ( !var_a276c861 )
    {
        s_monolith = struct::get( "s_monolith" );
        s_monolith.var_f4ecfb70 = util::spawn_model( "tag_origin", s_monolith.origin, s_monolith.angles );
        util::wait_network_frame();
        s_monolith.var_f4ecfb70 clientfield::set( "" + #"monolith_water", 1 );
        var_47323b73 = s_monolith zm_unitrigger::create( undefined, 64, &registerremaining_retreat_, 1, 1 );
        var_a6356bbe = array::random( struct::get_array( "s_monolith_ghost" ) );
        s_monolith thread function_d17deac0( var_a6356bbe );
        level flag::wait_till( #"hash_f3875ca909e696f" );
        zm_unitrigger::unregister_unitrigger( var_47323b73 );
    }
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 2
// Checksum 0xaf3c6f81, Offset: 0xff8
// Size: 0x18c
function cleanup_step_2( var_5ea5c94d, ended_early )
{
    level notify( #"hash_3e6c62c9a38d67de" );
    level flag::set( #"hash_f3875ca909e696f" );
    s_monolith = struct::get( "s_monolith" );
    
    if ( isdefined( s_monolith.var_f4ecfb70 ) )
    {
        s_monolith.var_f4ecfb70 clientfield::set( "" + #"monolith_water", 0 );
    }
    
    if ( isdefined( level.monolith_ghost ) && isdefined( level.monolith_ghost.var_c176969a ) )
    {
        level.monolith_ghost.var_c176969a thread scene::stop();
        level.monolith_ghost thread scene::stop();
        level.monolith_ghost.var_c176969a notify( #"reached_end_node" );
        level.monolith_ghost.var_c176969a delete();
    }
    
    wait 3;
    
    if ( isdefined( s_monolith.var_f4ecfb70 ) )
    {
        s_monolith.var_f4ecfb70 delete();
    }
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 1
// Checksum 0x603bd3fe, Offset: 0x1190
// Size: 0x684
function init_step_3( var_a276c861 )
{
    if ( !var_a276c861 )
    {
        s_cemetery = struct::get( "s_possess" );
        
        if ( isdefined( level.monolith_ghost ) )
        {
            n_time = function_c5a4ae6( level.monolith_ghost.origin, s_cemetery.origin );
            level.monolith_ghost.var_dafa2b89 = util::spawn_model( "tag_origin", level.monolith_ghost.origin, level.monolith_ghost.angles );
            util::wait_network_frame();
            level.monolith_ghost linkto( level.monolith_ghost.var_dafa2b89 );
            
            if ( n_time > 1 && n_time < 10 )
            {
                level.monolith_ghost.var_dafa2b89 moveto( s_cemetery.origin, n_time );
                level.monolith_ghost.var_dafa2b89 rotateto( s_cemetery.angles, n_time );
                level.monolith_ghost setvisibletoall();
                level.monolith_ghost.mdl_head setvisibletoall();
                level.monolith_ghost.var_dafa2b89 thread scene::play( #"aib_vign_zm_mnsn_ghost_walk_01", level.monolith_ghost );
                level.monolith_ghost thread scene::play( #"aib_vign_zm_mnsn_ghost_walk_01", level.monolith_ghost.mdl_head );
                level.monolith_ghost.var_dafa2b89 waittill( #"movedone" );
                level.monolith_ghost.var_dafa2b89 thread scene::stop();
                level.monolith_ghost thread scene::stop();
                level.monolith_ghost.var_dafa2b89 thread scene::play( #"aib_vign_zm_mnsn_ghost_idle_01", level.monolith_ghost );
                level.monolith_ghost thread scene::play( #"aib_vign_zm_mnsn_ghost_idle_01", level.monolith_ghost.mdl_head );
            }
            else
            {
                level.monolith_ghost.var_dafa2b89.origin = s_cemetery.origin;
                level.monolith_ghost.var_dafa2b89.angles = s_cemetery.angles;
                level.monolith_ghost setvisibletoall();
                level.monolith_ghost.mdl_head setvisibletoall();
                level.monolith_ghost.var_dafa2b89 thread scene::play( #"aib_vign_zm_mnsn_ghost_idle_01", level.monolith_ghost );
                level.monolith_ghost thread scene::play( #"aib_vign_zm_mnsn_ghost_idle_01", level.monolith_ghost.mdl_head );
            }
        }
        else
        {
            level.monolith_ghost = util::spawn_model( "tag_origin", s_cemetery.origin, s_cemetery.angles );
            level.monolith_ghost.var_dafa2b89 = util::spawn_model( "tag_origin", s_cemetery.origin, s_cemetery.angles );
            level.monolith_ghost setmodel( #"c_t8_zmb_dlc1_catherine_ghost_body" );
            level.monolith_ghost.mdl_head = util::spawn_model( #"c_t8_zmb_dlc1_catherine_ghost_head", level.monolith_ghost.origin, level.monolith_ghost.angles );
            util::wait_network_frame();
            level.monolith_ghost linkto( level.monolith_ghost.var_dafa2b89 );
            level.monolith_ghost.mdl_head linkto( level.monolith_ghost );
            level.monolith_ghost thread mansion_pap::function_c9c7a593();
            level.monolith_ghost clientfield::set( "" + #"ghost_trail", 1 );
            util::wait_network_frame();
            level.monolith_ghost.var_dafa2b89 thread scene::play( #"aib_vign_zm_mnsn_ghost_idle_01", level.monolith_ghost );
            level.monolith_ghost thread scene::play( #"aib_vign_zm_mnsn_ghost_idle_01", level.monolith_ghost.mdl_head );
        }
        
        s_cemetery thread function_9ee098d5();
        level flag::wait_till_all( array( #"hash_67e415588696c592", #"hash_67e416588696c745", #"hash_67e413588696c22c", #"hash_67e414588696c3df" ) );
    }
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 2
// Checksum 0x99b5cc6e, Offset: 0x1820
// Size: 0xc4
function cleanup_step_3( var_5ea5c94d, ended_early )
{
    level notify( #"hash_aa10db1b6143db9" );
    
    if ( isdefined( level.monolith_ghost ) && isdefined( level.monolith_ghost.mdl_head ) )
    {
        level.monolith_ghost.var_dafa2b89 scene::stop();
        level.monolith_ghost scene::stop();
        level.monolith_ghost.mdl_head delete();
        level.monolith_ghost delete();
    }
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 1
// Checksum 0x688362a8, Offset: 0x18f0
// Size: 0x134
function init_step_4( var_a276c861 )
{
    if ( !var_a276c861 )
    {
        var_1c3e934b = struct::get( "s_imp_enter" );
        array::thread_all( struct::get_array( "s_imp_symbol" ), &function_e7423237 );
        level flag::wait_till_all( array( #"hash_1687323c95faf914", #"hash_1687333c95fafac7", #"hash_1687343c95fafc7a", #"hash_1687353c95fafe2d" ) );
        level thread function_9768c04b();
        var_1c3e934b zm_unitrigger::create( undefined, 64, &function_d7d6b759, 1, 1 );
        level flag::wait_till( #"hash_54326b9f13bd4f1" );
    }
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 2
// Checksum 0x492f67f9, Offset: 0x1a30
// Size: 0x4c
function cleanup_step_4( var_5ea5c94d, ended_early )
{
    level notify( #"end_crypt_unlock" );
    callback::remove_on_ai_killed( &on_nosferatu_killed );
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 1
// Checksum 0xeba4b1ef, Offset: 0x1a88
// Size: 0x64
function init_step_5( var_a276c861 )
{
    level thread function_886c88e();
    level thread open_crypt();
    
    if ( !var_a276c861 )
    {
        level flag::wait_till( #"hash_38fe2a57d5f9d6ba" );
    }
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 2
// Checksum 0x420d79a6, Offset: 0x1af8
// Size: 0x1b8
function cleanup_step_5( var_5ea5c94d, ended_early )
{
    level notify( #"hash_69c33933b1ab3e2b" );
    level flag::set( #"hash_61263135b6fb6340" );
    zm_weapons::function_603af7a8( level.w_crossbow );
    level thread mansion_util::function_f1c106b( "loc1", 0 );
    exploder::exploder_stop( "fxexp_barrier_gameplay_crypt" );
    level flag::set( #"spawn_zombies" );
    level flag::clear( #"pause_round_timeout" );
    exploder::exploder_stop( "exp_lgt_crypt_darker" );
    exploder::exploder( "exp_lgt_crypt_normal" );
    mansion_util::function_5904a8e1();
    a_mdl_symbols = getentarray( "imp_floor_symbols", "script_noteworthy" );
    
    foreach ( mdl_symbol in a_mdl_symbols )
    {
        mdl_symbol delete();
    }
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 0
// Checksum 0x89883d0b, Offset: 0x1cb8
// Size: 0xa8
function function_d84548e7()
{
    level endon( #"hash_785f94bb8c05dc05" );
    
    while ( true )
    {
        s_notify = self.mdl_candle waittill( #"damage" );
        
        if ( s_notify.mod === "MOD_MELEE" )
        {
            self.mdl_candle clientfield::set( "" + #"candle_light", 0 );
            level.var_e93e5852++;
            break;
        }
    }
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 0
// Checksum 0xf9bd1445, Offset: 0x1d68
// Size: 0x100
function registerremaining_retreat_()
{
    level endon( #"hash_3e6c62c9a38d67de" );
    
    while ( true )
    {
        waitresult = self waittill( #"trigger" );
        e_player = waitresult.activator;
        
        if ( zm_utility::can_use( e_player ) && !( isdefined( e_player.b_is_designated_target ) && e_player.b_is_designated_target ) && function_89d75db( e_player ) && !( isdefined( e_player function_32606f19() ) && e_player function_32606f19() ) )
        {
            e_player thread function_c929af49();
        }
    }
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 0
// Checksum 0xd4b6cb8f, Offset: 0x1e70
// Size: 0x38
function function_32606f19()
{
    if ( isdefined( self.bgb ) && self.bgb != #"none" )
    {
        return 1;
    }
    
    return 0;
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 1
// Checksum 0x24765585, Offset: 0x1eb0
// Size: 0xac
function function_89d75db( e_player )
{
    if ( zm_utility::is_trials() )
    {
        if ( isdefined( e_player.b_is_designated_target ) && e_player.b_is_designated_target )
        {
            return 0;
        }
        
        return 1;
    }
    
    if ( !( isdefined( level.is_forever_solo_game ) && level.is_forever_solo_game ) && isdefined( e_player.var_34b7151c ) && e_player.var_34b7151c == level.round_number )
    {
        return 0;
    }
    
    return 1;
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 0
// Checksum 0xcae9dc8, Offset: 0x1f68
// Size: 0x26e
function function_c929af49()
{
    self endon( #"disconnect" );
    self notify( #"bgb_update" );
    self.bgb_active = 1;
    self.b_is_designated_target = 1;
    self.var_34b7151c = level.round_number;
    self thread function_9950740f();
    self playsound( #"zmb_bgb_nysm_start" );
    self playloopsound( #"zmb_bgb_nysm_loop", 1 );
    self util::delay( 0.75, "death", &zm_audio::create_and_play_dialog, #"stone_drink", #"water_react" );
    self clientfield::set_to_player( "" + #"hash_3d7d4c5e6ed616e9", 1 );
    
    if ( isdefined( level.is_forever_solo_game ) && level.is_forever_solo_game )
    {
        n_duration = 120;
    }
    else
    {
        n_duration = 60;
    }
    
    self.var_ea6941e2 = gettime() + int( n_duration * 1000 );
    self waittilltimeout( 0.5 + n_duration, #"hash_115d2cc01ac8b1e9", #"end_game", #"bgb_update" );
    self stoploopsound( 1 );
    self playsound( #"zmb_bgb_nysm_end" );
    self clientfield::set_to_player( "" + #"hash_3d7d4c5e6ed616e9", 0 );
    self.b_is_designated_target = 0;
    self.bgb_active = 0;
    self notify( #"hash_398b46ae1d545804" );
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 0
// Checksum 0x89ee4b3c, Offset: 0x21e0
// Size: 0x21e
function function_92e77dc6()
{
    level endon( #"hash_3e6c62c9a38d67de" );
    level.monolith_ghost.mdl_head endon( #"death" );
    level.monolith_ghost endon( #"death" );
    self endon( #"disconnect" );
    level.monolith_ghost setinvisibletoplayer( self );
    level.monolith_ghost.mdl_head setinvisibletoplayer( self );
    
    while ( true )
    {
        if ( isdefined( self.b_is_designated_target ) && self.b_is_designated_target && !isdefined( level.e_guide ) && !( isdefined( self.var_22514848 ) && self.var_22514848 ) )
        {
            self.var_22514848 = 1;
            level.monolith_ghost setvisibletoplayer( self );
            level.monolith_ghost.mdl_head setvisibletoplayer( self );
            level.monolith_ghost thread mansion_pap::function_c9c7a593();
        }
        else if ( !( isdefined( self.b_is_designated_target ) && self.b_is_designated_target ) && isdefined( self.var_22514848 ) && self.var_22514848 || isdefined( level.e_guide ) )
        {
            self.var_22514848 = 0;
            level.monolith_ghost setinvisibletoplayer( self );
            level.monolith_ghost.mdl_head setinvisibletoplayer( self );
            level.monolith_ghost notify( #"hash_6edff0409a51550e" );
        }
        
        waitframe( 1 );
    }
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 0
// Checksum 0x90721b9b, Offset: 0x2408
// Size: 0x6e
function function_9950740f()
{
    self notify( #"hash_398b46ae1d545804" );
    self endon( #"disconnect", #"hash_398b46ae1d545804" );
    self waittill( #"bled_out", #"fake_death" );
    self notify( #"hash_115d2cc01ac8b1e9" );
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 1
// Checksum 0xf20fbec, Offset: 0x2480
// Size: 0xbc
function function_d17deac0( var_a6356bbe )
{
    level endon( #"hash_3e6c62c9a38d67de" );
    nd_start = getvehiclenode( var_a6356bbe.target, "targetname" );
    level.monolith_ghost = util::spawn_model( "tag_origin", var_a6356bbe.origin, var_a6356bbe.angles );
    util::wait_network_frame();
    level.monolith_ghost thread function_a6978e42( nd_start );
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 1
// Checksum 0xe7764479, Offset: 0x2548
// Size: 0x294
function function_a6978e42( nd_start )
{
    level endon( #"hash_3e6c62c9a38d67de" );
    self setmodel( #"c_t8_zmb_dlc1_catherine_ghost_body" );
    self.mdl_head = util::spawn_model( #"c_t8_zmb_dlc1_catherine_ghost_head", self.origin, self.angles );
    self.mdl_head linkto( self );
    util::wait_network_frame();
    self clientfield::set( "" + #"ghost_trail", 1 );
    array::thread_all( getplayers(), &function_92e77dc6 );
    self.var_c176969a = spawner::simple_spawn_single( getent( "veh_power_on_projectile", "targetname" ) );
    self.var_c176969a.team = #"allies";
    self.var_c176969a.var_6353e3f1 = 1;
    self.var_c176969a.origin = nd_start.origin;
    self.var_c176969a.angles = nd_start.angles;
    self linkto( self.var_c176969a );
    var_878f0f0a = getallvehiclenodes();
    self thread function_4802a272();
    self thread mansion_pap::function_900b7dca( var_878f0f0a, 1 );
    self.var_c176969a vehicle::get_on_and_go_path( nd_start );
    self.var_c176969a thread scene::stop();
    self thread scene::stop();
    
    while ( isdefined( level.e_guide ) )
    {
        wait 1;
    }
    
    level flag::set( #"hash_f3875ca909e696f" );
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 0
// Checksum 0xc82066bf, Offset: 0x27e8
// Size: 0x55c
function function_4802a272()
{
    level endon( #"hash_3e6c62c9a38d67de" );
    self endon( #"death" );
    
    /#
        sphere( self.origin, 64, ( 1, 1, 1 ), 1, 0, 16, 5000 );
    #/
    
    do
    {
        var_80296afc = self function_4a51430a( 160, 1 );
        waitframe( 1 );
    }
    while ( !isalive( var_80296afc ) );
    
    n_player_index = var_80296afc zm_characters::function_d35e4c92();
    
    switch ( n_player_index )
    {
        case 10:
            var_5e246f88 = #"hash_56bcb3a8b0feb0ac";
            var_bfe15d00 = #"hash_4b8b51645e23b3d3";
            break;
        case 12:
            var_5e246f88 = #"hash_1da4031734c7836f";
            var_bfe15d00 = #"hash_5cb53f6467d09e7d";
            break;
        case 11:
            var_5e246f88 = #"hash_65f76254230c2099";
            var_bfe15d00 = #"hash_52da086461e4f9c8";
            break;
        case 9:
            var_5e246f88 = #"hash_5ddb037cae2d16db";
            var_bfe15d00 = #"hash_472fcbf532d22583";
            break;
        default:
            /#
                iprintlnbold( "<dev string:x38>" );
            #/
            
            break;
    }
    
    if ( isdefined( var_5e246f88 ) && isdefined( var_bfe15d00 ) && var_80296afc function_188bb878( var_bfe15d00 ) )
    {
        var_80296afc zm_vo::vo_say( var_bfe15d00, 0, 1, 9999 );
        self function_79556c43( var_80296afc, var_5e246f88 );
    }
    
    level flag::wait_till( "impaler_halfway" );
    
    do
    {
        var_80296afc = self function_4a51430a();
        waitframe( 1 );
    }
    while ( !isalive( var_80296afc ) );
    
    n_player_index = var_80296afc zm_characters::function_d35e4c92();
    var_5e246f88 = undefined;
    
    switch ( n_player_index )
    {
        case 10:
            var_5e246f88 = #"hash_4973070961c8d129";
            break;
        case 12:
            var_5e246f88 = #"hash_78c730f53ef32126";
            break;
        case 11:
            var_5e246f88 = #"hash_226e2edabe762438";
            break;
        case 9:
            var_5e246f88 = #"hash_615a8415bb0bfe1a";
            break;
        default:
            /#
                iprintlnbold( "<dev string:x38>" );
            #/
            
            break;
    }
    
    if ( isdefined( var_5e246f88 ) )
    {
        self function_79556c43( var_80296afc, var_5e246f88 );
    }
    
    level flag::wait_till( "impaler_arrive" );
    
    do
    {
        var_80296afc = self function_4a51430a();
        waitframe( 1 );
    }
    while ( !isalive( var_80296afc ) );
    
    n_player_index = var_80296afc zm_characters::function_d35e4c92();
    var_5e246f88 = undefined;
    
    switch ( n_player_index )
    {
        case 10:
            var_5e246f88 = #"hash_770d93aab97174b2";
            break;
        case 12:
            var_5e246f88 = #"hash_3c39ca349a4d1e4d";
            break;
        case 11:
            var_5e246f88 = #"hash_52cfd32c338e64b7";
            break;
        case 9:
            var_5e246f88 = #"hash_41b1fbce8a92a725";
            break;
        default:
            /#
                iprintlnbold( "<dev string:x38>" );
            #/
            
            break;
    }
    
    if ( isdefined( var_5e246f88 ) )
    {
        self function_79556c43( var_80296afc, var_5e246f88 );
    }
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 1
// Checksum 0x7fd0c723, Offset: 0x2d50
// Size: 0x82, Type: bool
function function_188bb878( str_vo )
{
    if ( !isdefined( self.var_ea6941e2 ) )
    {
        self.var_ea6941e2 = 15;
    }
    
    var_88546af8 = soundgetplaybacktime( str_vo );
    var_ac930d11 = gettime() + var_88546af8;
    return isdefined( self.b_is_designated_target ) && self.b_is_designated_target && self.var_ea6941e2 >= var_ac930d11;
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 2
// Checksum 0x4872ec1b, Offset: 0x2de0
// Size: 0x194
function function_79556c43( var_80296afc, var_5e246f88 )
{
    if ( isalive( var_80296afc ) )
    {
        var_5e243806 = function_8846933a();
        
        foreach ( var_e5e56c3d in var_5e243806 )
        {
            if ( isalive( var_e5e56c3d ) && var_e5e56c3d !== var_80296afc && var_e5e56c3d function_188bb878( var_5e246f88 ) && distancesquared( var_e5e56c3d.origin, self.origin ) <= 90000 )
            {
                var_e5e56c3d thread zm_vo::vo_say( var_5e246f88, 0, 1, 9999, 1, 1 );
            }
        }
        
        if ( var_80296afc function_188bb878( var_5e246f88 ) )
        {
            var_80296afc zm_vo::vo_say( var_5e246f88, 0, 1, 9999, 1, 1 );
        }
    }
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 0
// Checksum 0xcff4b03, Offset: 0x2f80
// Size: 0xb2
function function_8846933a()
{
    arrayconcubitant = [];
    
    foreach ( player in getplayers() )
    {
        if ( isdefined( player.b_is_designated_target ) && player.b_is_designated_target )
        {
            arrayconcubitant[ arrayconcubitant.size ] = player;
        }
    }
    
    return arrayconcubitant;
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 3
// Checksum 0xdb2d2d92, Offset: 0x3040
// Size: 0x158
function function_4a51430a( n_range = 190, var_16752072 = 1, var_caa1b6b8 = 0.8 )
{
    arrayconcubitant = function_8846933a();
    n_range_sq = n_range * n_range;
    
    if ( arrayconcubitant.size > 0 )
    {
        arrayconcubitant = arraysortclosest( arrayconcubitant, self.origin );
        player = arrayconcubitant[ 0 ];
        
        if ( var_16752072 )
        {
            b_can_see = player util::is_player_looking_at( self.origin, var_caa1b6b8, 0, self );
        }
        else
        {
            b_can_see = 1;
        }
        
        n_distsq = distancesquared( self.origin, player.origin );
        
        if ( n_distsq <= n_range_sq && isdefined( b_can_see ) && b_can_see )
        {
            return player;
        }
    }
    
    return undefined;
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 0
// Checksum 0x17f72310, Offset: 0x31a0
// Size: 0x914
function function_9ee098d5()
{
    level endon( #"hash_aa10db1b6143db9" );
    var_ac3fdee1 = 0;
    v_drop = undefined;
    e_trigger = getent( "e_possess_trigger", "targetname" );
    
    while ( var_ac3fdee1 < 4 )
    {
        while ( isdefined( level.e_guide ) )
        {
            wait 1;
        }
        
        e_possessed = self function_5270aabe( e_trigger );
        
        if ( isdefined( v_drop ) )
        {
            var_24a4f2c0 = v_drop;
            v_drop = undefined;
        }
        else
        {
            var_24a4f2c0 = self.origin;
        }
        
        fx_org = util::spawn_model( "tag_origin", var_24a4f2c0 + ( 0, 0, 32 ), self.angles );
        util::wait_network_frame();
        
        if ( !fx_org istouching( e_trigger ) )
        {
            fx_org.origin = self.origin;
        }
        
        wait 0.15;
        
        if ( isdefined( e_possessed ) )
        {
            fx_org clientfield::increment( "" + #"hash_4d45dc65a8307183" );
            n_time = function_c5a4ae6( fx_org.origin, e_possessed.origin );
            fx_org moveto( e_possessed gettagorigin( "j_spine4" ), n_time );
            level.monolith_ghost notify( #"hash_6edff0409a51550e" );
            level.monolith_ghost hide();
            level.monolith_ghost.mdl_head hide();
            fx_org waittill( #"movedone" );
            fx_org delete();
        }
        
        if ( isdefined( e_possessed ) )
        {
            e_possessed clientfield::set( "" + #"soul_possess", 1 );
            e_possessed thread function_99257c19();
            waitresult = e_possessed waittill( #"death" );
        }
        
        if ( isdefined( e_possessed ) && isdefined( e_possessed.origin ) )
        {
            v_death = e_possessed.origin;
        }
        
        v_drop = mansion_util::function_a8176b98( v_death );
        
        if ( isdefined( v_drop ) )
        {
            switch ( var_ac3fdee1 )
            {
                case 0:
                    if ( isplayer( waitresult.attacker ) )
                    {
                        level thread function_7de84c26( v_drop, var_ac3fdee1 );
                        var_ac3fdee1++;
                    }
                    
                    break;
                case 1:
                    if ( !zm_loadout::is_hero_weapon( waitresult.weapon ) && waitresult.mod === "MOD_BURNED" )
                    {
                        level thread function_7de84c26( v_drop, var_ac3fdee1 );
                        var_ac3fdee1++;
                    }
                    
                    break;
                case 2:
                    if ( zm_loadout::is_hero_weapon( waitresult.weapon ) )
                    {
                        level thread function_7de84c26( v_drop, var_ac3fdee1 );
                        var_ac3fdee1++;
                    }
                    
                    break;
                case 3:
                    if ( isdefined( waitresult.weapon ) && isdefined( waitresult.weapon.isriotshield ) && waitresult.weapon.isriotshield )
                    {
                        level thread function_7de84c26( v_drop, var_ac3fdee1 );
                        var_ac3fdee1++;
                    }
                    
                    break;
            }
            
            level.monolith_ghost.var_dafa2b89.origin = v_drop + ( 0, 0, 32 );
        }
        else
        {
            level.monolith_ghost.var_dafa2b89.origin = self.origin;
        }
        
        wait 1.5;
        level.monolith_ghost show();
        level.monolith_ghost.mdl_head show();
        level.monolith_ghost thread mansion_pap::function_c9c7a593();
        waitframe( 1 );
        level.monolith_ghost.var_dafa2b89 thread scene::stop();
        level.monolith_ghost thread scene::stop();
        level.monolith_ghost.var_dafa2b89 thread scene::play( #"aib_vign_zm_mnsn_ghost_idle_01", level.monolith_ghost );
        level.monolith_ghost thread scene::play( #"aib_vign_zm_mnsn_ghost_idle_01", level.monolith_ghost.mdl_head );
        
        if ( !level.monolith_ghost istouching( e_trigger ) )
        {
            n_time = function_c5a4ae6( level.monolith_ghost.origin, self.origin );
            level.monolith_ghost.var_dafa2b89 moveto( self.origin, n_time );
            level.monolith_ghost.var_dafa2b89 rotateto( self.angles, n_time );
            level.monolith_ghost.var_dafa2b89 thread scene::stop();
            level.monolith_ghost thread scene::stop();
            level.monolith_ghost.var_dafa2b89 thread scene::play( #"aib_vign_zm_mnsn_ghost_walk_01", level.monolith_ghost );
            level.monolith_ghost thread scene::play( #"aib_vign_zm_mnsn_ghost_idle_01", level.monolith_ghost.mdl_head );
            level.monolith_ghost.var_dafa2b89 waittill( #"movedone" );
            level.monolith_ghost.var_dafa2b89 thread scene::stop();
            level.monolith_ghost thread scene::stop();
            level.monolith_ghost.var_dafa2b89 thread scene::play( #"aib_vign_zm_mnsn_ghost_idle_01", level.monolith_ghost );
            level.monolith_ghost thread scene::play( #"aib_vign_zm_mnsn_ghost_idle_01", level.monolith_ghost.mdl_head );
        }
        
        wait randomintrangeinclusive( 3, 5 );
    }
    
    level.monolith_ghost.var_dafa2b89 thread scene::stop();
    level.monolith_ghost thread scene::stop();
    level.monolith_ghost.var_dafa2b89 delete();
    level.monolith_ghost.mdl_head delete();
    level.monolith_ghost delete();
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 0
// Checksum 0xfba188d0, Offset: 0x3ac0
// Size: 0x54
function function_99257c19()
{
    self endon( #"death" );
    level waittill( #"hash_aa10db1b6143db9" );
    self clientfield::set( "" + #"soul_possess", 0 );
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 2
// Checksum 0x2c1c493c, Offset: 0x3b20
// Size: 0x58
function function_c5a4ae6( v_start, v_end )
{
    n_distance = distance2d( v_start, v_end );
    n_time = n_distance / 200;
    return n_time;
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 1
// Checksum 0x2ab6dfad, Offset: 0x3b80
// Size: 0x148
function function_5270aabe( e_trigger )
{
    level endon( #"hash_aa10db1b6143db9" );
    
    while ( true )
    {
        var_4bb8adfe = array::get_touching( zombie_utility::get_zombie_array(), e_trigger );
        
        if ( isdefined( var_4bb8adfe ) && var_4bb8adfe.size )
        {
            var_680eece8 = arraysortclosest( var_4bb8adfe, self.origin, undefined, 256, undefined );
            
            foreach ( ai_zombie in var_680eece8 )
            {
                if ( isalive( ai_zombie ) && isdefined( ai_zombie.completed_emerging_into_playable_area ) && ai_zombie.completed_emerging_into_playable_area )
                {
                    return ai_zombie;
                }
            }
        }
        
        wait 1.5;
    }
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 2
// Checksum 0x1c1bcaf4, Offset: 0x3cd0
// Size: 0x1ce
function function_7de84c26( v_drop, n_drop )
{
    switch ( n_drop )
    {
        case 0:
            var_8dd283dd = #"p8_zm_man_watch_pocket_gold";
            break;
        case 1:
            var_8dd283dd = #"p8_zm_man_jewelry_ring";
            break;
        case 2:
            var_8dd283dd = #"p8_zm_man_jewelry_necklace";
            break;
        case 3:
            var_8dd283dd = #"p8_zm_man_jewelry_bracelet";
            break;
    }
    
    mdl_drop = util::spawn_model( var_8dd283dd, v_drop + ( 0, 0, 12 ) );
    util::wait_network_frame();
    mdl_drop clientfield::set( "" + #"jewelry_dropped", 1 );
    mdl_drop bobbing( ( 0, 0, 1 ), 2, 3 );
    
    /#
    #/
    
    var_ffba68db = mdl_drop zm_unitrigger::create( undefined, 64, &function_3c1f242b, 1, 1 );
    var_ffba68db.script_int = n_drop;
    var_ffba68db.mdl_drop = mdl_drop;
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 0
// Checksum 0x1f5e40d6, Offset: 0x3ea8
// Size: 0x218
function function_3c1f242b()
{
    level endon( #"hash_38fe2a57d5f9d6ba" );
    mdl_drop = self.stub.mdl_drop;
    n_loc = self.stub.script_int;
    
    while ( true )
    {
        waitresult = self waittill( #"trigger" );
        e_player = waitresult.activator;
        
        if ( zm_utility::can_use( e_player ) )
        {
            switch ( n_loc )
            {
                case 0:
                    str_flag = #"hash_67e415588696c592";
                    break;
                case 1:
                    str_flag = #"hash_67e416588696c745";
                    break;
                case 2:
                    str_flag = #"hash_67e413588696c22c";
                    break;
                case 3:
                    str_flag = #"hash_67e414588696c3df";
                    break;
            }
            
            if ( isdefined( mdl_drop ) )
            {
                playsoundatposition( #"hash_6b3b011b2d22c586", mdl_drop.origin );
            }
            
            e_player thread zm_audio::create_and_play_dialog( #"component_pickup", #"generic" );
            level flag::set( str_flag );
            
            if ( isdefined( mdl_drop ) )
            {
                mdl_drop delete();
            }
            
            zm_unitrigger::unregister_unitrigger( self.stub );
        }
    }
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 0
// Checksum 0xfd818404, Offset: 0x40c8
// Size: 0x304
function function_e7423237()
{
    level endon( #"hash_38fe2a57d5f9d6ba" );
    mdl_symbol = getent( self.target, "targetname" );
    mdl_symbol clientfield::set( "" + #"hash_3d5a64bed5e39d24", 1 );
    var_ffba68db = self zm_unitrigger::create( undefined, 80, &function_9f0de8b3, 1, 1 );
    var_ffba68db.script_int = self.script_int;
    
    switch ( self.script_int )
    {
        case 0:
            str_flag = #"hash_1687323c95faf914";
            break;
        case 1:
            str_flag = #"hash_1687333c95fafac7";
            break;
        case 2:
            str_flag = #"hash_1687343c95fafc7a";
            break;
        case 3:
            str_flag = #"hash_1687353c95fafe2d";
            break;
    }
    
    level flag::wait_till( str_flag );
    wpn_betty_explo_vox = util::spawn_model( self.model, self.origin + ( 0, 0, 6 ) );
    
    if ( self.target === "impaler_symbol_bracelet" )
    {
        wpn_betty_explo_vox setscale( 2 );
    }
    
    util::wait_network_frame();
    wpn_betty_explo_vox bobbing( ( 0, 0, 1 ), 2, 3 );
    wpn_betty_explo_vox clientfield::set( "" + #"jewelry_dropped", 1 );
    mdl_symbol clientfield::set( "" + #"hash_3d5a64bed5e39d24", 0 );
    level flag::wait_till( #"hash_61263135b6fb6340" );
    
    if ( isdefined( wpn_betty_explo_vox ) )
    {
        wpn_betty_explo_vox delete();
    }
    
    if ( isdefined( mdl_symbol ) )
    {
        mdl_symbol delete();
    }
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 0
// Checksum 0xf65a38c5, Offset: 0x43d8
// Size: 0x168
function function_9f0de8b3()
{
    level endon( #"hash_38fe2a57d5f9d6ba" );
    
    while ( true )
    {
        waitresult = self waittill( #"trigger" );
        e_player = waitresult.activator;
        
        if ( zm_utility::can_use( e_player ) )
        {
            switch ( self.stub.script_int )
            {
                case 0:
                    str_flag = #"hash_1687323c95faf914";
                    break;
                case 1:
                    str_flag = #"hash_1687333c95fafac7";
                    break;
                case 2:
                    str_flag = #"hash_1687343c95fafc7a";
                    break;
                case 3:
                    str_flag = #"hash_1687353c95fafe2d";
                    break;
            }
            
            level flag::set( str_flag );
            zm_unitrigger::unregister_unitrigger( self.stub );
        }
    }
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 0
// Checksum 0xe8314f10, Offset: 0x4548
// Size: 0x168
function function_9768c04b()
{
    level endon( #"end_crypt_unlock" );
    var_7853cc7c = getent( "imp_symbol_base", "targetname" );
    level.var_6a17ff24 = 0;
    callback::on_ai_killed( &on_nosferatu_killed );
    var_7853cc7c clientfield::set( "" + #"hash_3d5a64bed5e39d24", 1 );
    
    while ( !level flag::get( #"hash_54326b9f13bd4f1" ) )
    {
        level flag::wait_till( #"hash_2e0f59cef233a264" );
        var_7853cc7c clientfield::set( "" + #"hash_3d5a64bed5e39d24", 0 );
        function_cc11b6fd();
        var_7853cc7c clientfield::set( "" + #"hash_3d5a64bed5e39d24", 1 );
    }
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 0
// Checksum 0x863d710d, Offset: 0x46b8
// Size: 0x4c
function function_cc11b6fd()
{
    level endon( #"end_crypt_unlock" );
    wait 30;
    level.var_6a17ff24 = 0;
    level flag::clear( #"hash_2e0f59cef233a264" );
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 1
// Checksum 0x8b1e0e7b, Offset: 0x4710
// Size: 0x13c
function on_nosferatu_killed( s_params )
{
    if ( self.archetype === #"nosferatu" && !level flag::get( #"hash_2e0f59cef233a264" ) )
    {
        t_radius = getent( "t_imp_kill", "targetname" );
        
        if ( self istouching( t_radius ) && isplayer( s_params.eattacker ) )
        {
            level.var_6a17ff24++;
            self playsound( #"hash_4dd41aee138bb20c" );
            
            if ( level.var_6a17ff24 == 6 )
            {
                level flag::set( #"hash_2e0f59cef233a264" );
                self playsound( #"hash_57a171ab3437ea96" );
            }
        }
    }
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 0
// Checksum 0x275aef02, Offset: 0x4858
// Size: 0xd0
function function_d7d6b759()
{
    level endon( #"hash_38fe2a57d5f9d6ba" );
    
    while ( true )
    {
        waitresult = self waittill( #"trigger" );
        e_player = waitresult.activator;
        
        if ( zm_utility::can_use( e_player ) && level flag::get( #"hash_2e0f59cef233a264" ) )
        {
            level flag::set( #"hash_54326b9f13bd4f1" );
            zm_unitrigger::unregister_unitrigger( self.stub );
        }
    }
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 0
// Checksum 0x3959069f, Offset: 0x4930
// Size: 0x134
function function_886c88e()
{
    level endon( #"hash_38fe2a57d5f9d6ba" );
    var_a8534fa4 = struct::get( "s_imp" );
    exploder::exploder( "fxexp_pickup" );
    level thread function_520a8a02();
    level thread function_486252bc();
    var_ffba68db = var_a8534fa4 zm_unitrigger::create( undefined, 64, &function_d23a6d02, 1, 1 );
    level flag::wait_till( #"hash_61263135b6fb6340" );
    exploder::kill_exploder( "fxexp_pickup" );
    playsoundatposition( #"hash_64edabe355229d32", ( 0, 0, 0 ) );
    zm_unitrigger::unregister_unitrigger( var_ffba68db );
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 0
// Checksum 0x16459233, Offset: 0x4a70
// Size: 0x1b4
function open_crypt()
{
    level endon( #"hash_69c33933b1ab3e2b" );
    clientfield::set( "" + #"hash_73123721764d7374", 1 );
    e_floor = getent( "imp_open2", "targetname" );
    e_clip = getent( "imp_blocker", "targetname" );
    
    if ( isdefined( e_floor ) )
    {
        e_floor delete();
    }
    
    level thread scene::play( "p8_fxanim_zm_man_crypt_bundle" );
    exploder::exploder( "exp_lgt_crypt_normal" );
    wait 4;
    
    if ( isdefined( e_clip ) )
    {
        e_clip notsolid();
        e_clip connectpaths();
        e_clip delete();
    }
    
    level flag::set( "connect_cemetery_graveyard_to_underground" );
    level flag::wait_till( #"hash_61263135b6fb6340" );
    level thread mansion_util::function_f1c106b( "loc1", 1 );
    exploder::exploder( "fxexp_barrier_gameplay_crypt" );
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 0
// Checksum 0x38d61950, Offset: 0x4c30
// Size: 0x1cc
function function_520a8a02()
{
    level endon( #"hash_69c33933b1ab3e2b" );
    var_77663e28 = getent( "t_imp_in", "targetname" );
    mdl_gates = getentarray( "mdl_crp_gates", "targetname" );
    
    while ( !level flag::get( #"hash_61263135b6fb6340" ) )
    {
        if ( array::is_touching( util::get_active_players(), var_77663e28 ) )
        {
            if ( !level flag::get( #"hash_864c8ec1475abdc" ) )
            {
                level flag::set( #"hash_864c8ec1475abdc" );
                array::run_all( mdl_gates, &movez, -40, 0.5 );
            }
        }
        else if ( level flag::get( #"hash_864c8ec1475abdc" ) )
        {
            level flag::clear( #"hash_864c8ec1475abdc" );
            array::run_all( mdl_gates, &movez, 40, 0.5 );
        }
        
        wait 0.5;
    }
    
    var_77663e28 delete();
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 0
// Checksum 0x52b4398d, Offset: 0x4e08
// Size: 0xbc
function function_486252bc()
{
    level endon( #"hash_69c33933b1ab3e2b" );
    level flag::wait_till( #"hash_61263135b6fb6340" );
    level flag::clear( #"spawn_zombies" );
    level flag::set( #"pause_round_timeout" );
    exploder::exploder_stop( "exp_lgt_crypt_normal" );
    exploder::exploder( "exp_lgt_crypt_darker" );
    mansion_util::function_45ac4bb8();
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 0
// Checksum 0x46e72cb, Offset: 0x4ed0
// Size: 0x118
function function_d23a6d02()
{
    level endon( #"hash_38fe2a57d5f9d6ba" );
    
    while ( true )
    {
        waitresult = self waittill( #"trigger" );
        e_player = waitresult.activator;
        
        if ( zm_utility::can_use( e_player, 1 ) && level flag::get( #"hash_864c8ec1475abdc" ) )
        {
            e_player zm_weapons::weapon_give( level.w_crossbow );
            e_player thread zm_vo::function_a2bd5a0c( #"hash_5b257b4bd8a2c6ec", 1 );
            e_player thread function_a9bfed2d();
            level flag::set( #"hash_61263135b6fb6340" );
        }
    }
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 0
// Checksum 0x7d261108, Offset: 0x4ff0
// Size: 0x3e4
function function_a9bfed2d()
{
    level endon( #"hash_69c33933b1ab3e2b" );
    a_players = getplayers();
    
    switch ( a_players.size )
    {
        case 1:
            n_enemy_count = 16;
            n_wait_min = 2.25;
            n_wait_max = 2.75;
            break;
        case 2:
            n_enemy_count = 26;
            n_wait_min = 1.75;
            n_wait_max = 2.25;
            break;
        case 3:
            n_enemy_count = 36;
            n_wait_min = 1.25;
            n_wait_max = 1.75;
            break;
        case 4:
            n_enemy_count = 46;
            n_wait_min = 0.75;
            n_wait_max = 1.25;
            break;
    }
    
    var_219a33e2 = [];
    var_f1c4ec4f = self zm_utility::get_current_zone( 1 );
    a_spawn_locs = var_f1c4ec4f.a_loc_types[ #"nosferatu_location" ];
    
    for ( i = 0; i < n_enemy_count ; i++ )
    {
        if ( randomint( 100 ) > 90 )
        {
            b_crimson = 1;
        }
        else
        {
            b_crimson = 0;
        }
        
        if ( isdefined( a_spawn_locs ) )
        {
            s_spawn_loc = array::random( a_spawn_locs );
        }
        else
        {
            s_spawn_loc = zm_ai_nosferatu::function_6502a84d();
        }
        
        if ( isdefined( s_spawn_loc ) )
        {
            ai_nosferatu = zm_ai_nosferatu::function_74f25f8a( 1, s_spawn_loc, b_crimson, level.round_number );
            
            if ( isdefined( ai_nosferatu ) )
            {
                if ( !isdefined( var_219a33e2 ) )
                {
                    var_219a33e2 = [];
                }
                else if ( !isarray( var_219a33e2 ) )
                {
                    var_219a33e2 = array( var_219a33e2 );
                }
                
                var_219a33e2[ var_219a33e2.size ] = ai_nosferatu;
                ai_nosferatu.var_126d7bef = 1;
                ai_nosferatu.ignore_round_spawn_failsafe = 1;
                ai_nosferatu.ignore_enemy_count = 1;
                ai_nosferatu.b_ignore_cleanup = 1;
                ai_nosferatu.no_powerups = 1;
                ai_nosferatu zm_score::function_acaab828();
                ai_nosferatu forceteleport( s_spawn_loc.origin, s_spawn_loc.angles );
                s_spawn_loc = undefined;
                wait randomfloatrange( n_wait_min, n_wait_max );
            }
        }
    }
    
    while ( var_219a33e2.size > 1 )
    {
        array::remove_dead( var_219a33e2, 0 );
        wait 1.5;
    }
    
    level flag::set( #"hash_38fe2a57d5f9d6ba" );
    playsoundatposition( #"hash_7bd7306de23aa3bd", ( 0, 0, 0 ) );
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 1
// Checksum 0x540c0de6, Offset: 0x53e0
// Size: 0x54a
function function_615d8c38( params )
{
    self endon( #"death" );
    
    if ( params.weapon != level.w_crossbow )
    {
        return;
    }
    
    if ( !isalive( self ) || isdefined( self.var_a05119b7 ) && self.var_a05119b7 )
    {
        return;
    }
    
    if ( !isplayer( params.eattacker ) )
    {
        return;
    }
    
    e_player = params.eattacker;
    
    if ( isdefined( self.var_e104fa93 ) && self.var_e104fa93 )
    {
        return;
    }
    
    if ( isdefined( params.shitloc ) )
    {
        str_hitloc = params.shitloc;
    }
    else
    {
        return;
    }
    
    if ( isdefined( params.smeansofdeath ) )
    {
        str_meansofdeath = params.smeansofdeath;
    }
    
    if ( isdefined( params.einflictor ) )
    {
        e_bolt = params.einflictor;
    }
    
    switch ( self.archetype )
    {
        case #"zombie":
            self.allowdeath = 1;
            
            switch ( str_hitloc )
            {
                case #"left_leg_lower":
                case #"left_foot":
                case #"left_leg_upper":
                    gibserverutils::gibleftleg( self );
                    self thread function_9a05e3c2( e_player, e_bolt, str_hitloc, str_meansofdeath );
                    break;
                case #"right_leg_upper":
                case #"right_leg_lower":
                case #"right_foot":
                    gibserverutils::gibrightleg( self );
                    self thread function_9a05e3c2( e_player, e_bolt, str_hitloc, str_meansofdeath );
                    break;
                case #"left_arm_lower":
                case #"left_arm_upper":
                case #"left_hand":
                    gibserverutils::gibleftarm( self );
                    break;
                case #"right_arm_lower":
                case #"right_arm_upper":
                case #"right_hand":
                    gibserverutils::gibrightarm( self );
                    break;
                case #"head":
                case #"helmet":
                case #"neck":
                    gibserverutils::gibhead( self );
                    self crossbow_kill( self.health, e_player, e_bolt, str_hitloc, str_meansofdeath );
                    break;
            }
            
            if ( randomint( 100 ) < 25 )
            {
                self zombie_utility::gib_random_parts();
                gibserverutils::annihilate( self );
                self crossbow_kill( self.health, e_player, e_bolt, str_hitloc, str_meansofdeath );
                break;
            }
            
            break;
        case #"catalyst":
            switch ( str_hitloc )
            {
                case #"head":
                case #"helmet":
                case #"neck":
                    gibserverutils::gibhead( self );
                    self crossbow_kill( self.health, e_player, e_bolt, str_hitloc, str_meansofdeath );
                    break;
            }
            
            if ( randomint( 100 ) < 25 )
            {
                self zombie_utility::gib_random_parts();
                gibserverutils::annihilate( self );
                self crossbow_kill( self.health, e_player, e_bolt, str_hitloc, str_meansofdeath );
                break;
            }
            
            break;
        case #"nosferatu":
            self zombie_utility::gib_random_parts();
            gibserverutils::annihilate( self );
            self crossbow_kill( self.health, e_player, e_bolt, str_hitloc, str_meansofdeath );
            break;
    }
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 5
// Checksum 0x1f2f30f9, Offset: 0x5938
// Size: 0x74
function crossbow_kill( n_damage, e_player, e_bolt, str_hitloc, str_meansofdeath )
{
    self.var_e104fa93 = 1;
    self dodamage( n_damage, self.origin, e_player, e_bolt, str_hitloc, str_meansofdeath, 0, level.w_crossbow );
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 4
// Checksum 0x5cc28ba5, Offset: 0x59b8
// Size: 0x180
function function_9a05e3c2( e_player, e_bolt, str_hitloc, str_meansofdeath )
{
    self endon( #"death" );
    
    if ( isdefined( level.var_41259f0d ) && level.var_41259f0d || isdefined( level.var_9b91564e ) && ( isdefined( level.num_crawlers ) ? level.num_crawlers : 0 ) >= level.var_9b91564e )
    {
        self crossbow_kill( self.health, e_player, e_bolt, str_hitloc, str_meansofdeath );
        return;
    }
    
    self.has_legs = 0;
    self zombie_utility::function_df5afb5e( 1 );
    self allowedstances( "crouch" );
    self setphysparams( 15, 0, 24 );
    self allowpitchangle( 1 );
    self setpitchorient();
    health = self.health;
    health *= 0.1;
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 1
// Checksum 0x5cd3d032, Offset: 0x5b40
// Size: 0x8e
function createspecialcrossbowwatchertypes( watcher )
{
    watcher.onfizzleout = undefined;
    watcher.ondetonatecallback = &weaponobjects::deleteent;
    watcher.ondamage = &weaponobjects::voidondamage;
    watcher.onspawn = &onspawncrossbowboltimpact;
    watcher.onspawnretrievetriggers = &weaponobjects::voidonspawnretrievetriggers;
    watcher.pickup = &weaponobjects::voidpickup;
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 2
// Checksum 0x25dd2313, Offset: 0x5bd8
// Size: 0x3c
function onspawncrossbowboltimpact( s_watcher, e_player )
{
    self.delete_on_death = 1;
    self thread onspawncrossbowboltimpact_internal( s_watcher, e_player );
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 2
// Checksum 0x1e1ddd3f, Offset: 0x5c20
// Size: 0x104
function onspawncrossbowboltimpact_internal( s_watcher, e_player )
{
    self endon( #"death" );
    e_player endon( #"disconnect" );
    self waittill( #"stationary" );
    s_watcher thread waitandfizzleout( self, 2 );
    
    foreach ( n_index, e_object in s_watcher.objectarray )
    {
        if ( self == e_object )
        {
            s_watcher.objectarray[ n_index ] = undefined;
        }
    }
    
    cleanweaponobjectarray( s_watcher );
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 1
// Checksum 0x188d033f, Offset: 0x5d30
// Size: 0x2e
function cleanweaponobjectarray( watcher )
{
    watcher.objectarray = array::remove_undefined( watcher.objectarray );
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 2
// Checksum 0x98ea87dd, Offset: 0x5d68
// Size: 0xa4
function waitandfizzleout( object, delay )
{
    object endon( #"death", #"hacked" );
    
    if ( isdefined( object.detonated ) && object.detonated )
    {
        return;
    }
    
    object.detonated = 1;
    object notify( #"fizzleout" );
    
    if ( delay > 0 )
    {
        wait delay;
    }
    
    object deleteent();
}

// Namespace mansion_impaler/zm_mansion_impaler
// Params 3
// Checksum 0x47662256, Offset: 0x5e18
// Size: 0x3c
function deleteent( attacker, emp, target )
{
    if ( isdefined( self ) )
    {
        self delete();
    }
}

/#

    // Namespace mansion_impaler/zm_mansion_impaler
    // Params 1
    // Checksum 0x318de6dd, Offset: 0x5e60
    // Size: 0x68, Type: dev
    function function_1e640843( n_drop )
    {
        level endon( #"hash_aa10db1b6143db9" );
        
        while ( isdefined( self ) )
        {
            print3d( self.origin, n_drop, ( 0, 1, 0 ), 1, 0.4, 10 );
            wait 0.2;
        }
    }

#/
