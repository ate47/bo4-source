#using script_23c01b321e642c31;
#using script_28bfe6df1650ab79;
#using script_30ba61ad5559c51d;
#using script_43642da1b2402e5c;
#using script_6951ea86fdae9ae0;
#using script_6f5e741b2bceba3a;
#using script_ddbbb750404a64b;
#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\array_shared;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\struct;
#using scripts\zm\ai\zm_ai_avogadro;
#using scripts\zm\zm_white_mee;
#using scripts\zm\zm_white_special_rounds;
#using scripts\zm\zm_white_toast;
#using scripts\zm_common\bgbs\zm_bgb_anywhere_but_here;
#using scripts\zm_common\trials\zm_trial_acquire_weapon;
#using scripts\zm_common\trials\zm_trial_defend_area;
#using scripts\zm_common\trials\zm_trial_flag_check;
#using scripts\zm_common\trials\zm_trial_restrict_loadout;
#using scripts\zm_common\trials\zm_trial_special_enemy;
#using scripts\zm_common\trials\zm_trial_upgrade_multiple;
#using scripts\zm_common\trials\zm_trial_white_electric_slide;
#using scripts\zm_common\trials\zm_trial_white_eyes_open;
#using scripts\zm_common\trials\zm_trial_white_mannequin_american;
#using scripts\zm_common\trials\zm_trial_white_minutemen;
#using scripts\zm_common\trials\zm_trial_white_mobile_plan;
#using scripts\zm_common\trials\zm_trial_white_nukerun;
#using scripts\zm_common\trials\zm_trial_white_population_control;
#using scripts\zm_common\zm_powerups;

#namespace zm_white_trials;

// Namespace zm_white_trials/zm_white_trials
// Params 0
// Checksum 0xb8c9f93a, Offset: 0x290
// Size: 0x328
function main()
{
    level endon( #"end_game" );
    level.var_4182b94e = struct::get_array( "initial_spawn_points", "targetname" );
    level flag::init( #"hash_18775b013e93e516" );
    var_50f6b3f4 = getent( "counter_tens", "targetname" );
    var_50f6b3f4.start_angles = var_50f6b3f4.angles;
    var_d02e9cd = getent( "counter_ones", "targetname" );
    var_d02e9cd.start_angles = var_d02e9cd.angles;
    level.var_b691023c = 0;
    
    while ( true )
    {
        if ( isdefined( level.var_dc22f98 ) )
        {
            level.fn_custom_round_ai_spawn = level.var_dc22f98;
            level.var_dc22f98 = undefined;
        }
        
        if ( level.round_number > 1 )
        {
            level.var_b691023c = undefined;
        }
        
        level waittill( #"hash_5d42d8ee7a08b543" );
        
        switch ( level.round_number )
        {
            case 1:
                level thread function_1a2500e5();
                break;
            case 15:
                level thread function_439b486f();
                break;
            case 21:
                level thread head_hunter();
                break;
            case 30:
                level thread function_e478fb2a();
                level.var_dc22f98 = level.fn_custom_round_ai_spawn;
                level.fn_custom_round_ai_spawn = &function_1bc491ab;
                level thread spawn_boss();
                break;
        }
        
        level waittill( #"hash_7646638df88a3656" );
        
        if ( isdefined( level.e_avogadro ) )
        {
            level.e_avogadro kill();
        }
        
        if ( level flag::get( #"hash_639e8274a1b57729" ) && !level flag::get( #"hash_40856b65dff0f6eb" ) && level flag::get( "round_reset" ) )
        {
            level zm_white_special_rounds::function_6acd363d( 0 );
        }
    }
}

// Namespace zm_white_trials/zm_white_trials
// Params 0
// Checksum 0x9564527c, Offset: 0x5c0
// Size: 0xd6
function function_1a2500e5()
{
    level.var_806abe8f = level.var_f44e37f7;
    level.var_f44e37f7 = &function_c4d44a1b;
    
    foreach ( player in getplayers() )
    {
        player thread teleport_player();
    }
    
    wait 0.5;
    level.var_f44e37f7 = level.var_806abe8f;
}

// Namespace zm_white_trials/zm_white_trials
// Params 1
// Checksum 0x8f600eb6, Offset: 0x6a0
// Size: 0x4c
function function_c4d44a1b( a_s_respawn_points )
{
    n_script_int = self getentitynumber();
    s_point = level.var_4182b94e[ n_script_int ];
    return s_point;
}

// Namespace zm_white_trials/zm_white_trials
// Params 0
// Checksum 0x22b001d7, Offset: 0x6f8
// Size: 0x7c
function teleport_player()
{
    if ( isalive( self ) && self.zone_name != "zone_security_checkpoint" )
    {
        if ( self isusingoffhand() )
        {
            self forceoffhandend();
        }
        
        self zm_bgb_anywhere_but_here::activation( 0 );
    }
}

// Namespace zm_white_trials/zm_white_trials
// Params 0
// Checksum 0xb140592, Offset: 0x780
// Size: 0x14c
function function_439b486f()
{
    if ( !level flag::get( #"hash_18775b013e93e516" ) )
    {
        level flag::set( #"hash_18775b013e93e516" );
        exploder::exploder( "fxexp_disco_lgt" );
        var_51bef3af = spawn( "script_model", ( 1, 1145, -350 ) );
        var_51bef3af playsound( #"hash_c8d3a1557c42ab7" );
        s_notify = level waittilltimeout( 253, #"hash_7646638df88a3656" );
        var_51bef3af stopsound( #"hash_c8d3a1557c42ab7" );
        waitframe( 1 );
        var_51bef3af delete();
        exploder::stop_exploder( "fxexp_disco_lgt" );
        level flag::clear( #"hash_18775b013e93e516" );
    }
}

// Namespace zm_white_trials/zm_white_trials
// Params 0
// Checksum 0xdbace9d7, Offset: 0x8d8
// Size: 0xf8
function head_hunter()
{
    level flag::set( #"hash_502f2e83a538c679" );
    level.a_mees = getentarray( "dummy", "targetname" );
    level.var_561ae1f8 = level.a_mees.size;
    
    if ( level.a_mees.size <= 0 )
    {
        return;
    }
    
    foreach ( m in level.a_mees )
    {
        if ( isdefined( m ) )
        {
            m thread zm_white_mee::function_edcadf04();
        }
    }
}

// Namespace zm_white_trials/zm_white_trials
// Params 0
// Checksum 0xdf2cdc7c, Offset: 0x9d8
// Size: 0x13c, Type: bool
function function_1bc491ab()
{
    s_spawn_point = array::random( level.zm_loc_types[ #"zombie_location" ] );
    ai = zombie_utility::spawn_zombie( getentarray( "mannequin_zombie_spawner", "script_noteworthy" )[ 0 ], undefined, s_spawn_point );
    
    if ( isdefined( ai ) )
    {
        ai.health = int( ai.health * 2 );
        level.zombie_total--;
        n_delay = isdefined( zombie_utility::get_zombie_var( #"zombie_spawn_delay" ) ) ? zombie_utility::get_zombie_var( #"zombie_spawn_delay" ) : zombie_utility::get_zombie_var( #"hash_7d5a25e2463f7fc5" );
        wait n_delay;
        return true;
    }
    
    return false;
}

// Namespace zm_white_trials/zm_white_trials
// Params 0
// Checksum 0xaa65e073, Offset: 0xb20
// Size: 0x134
function spawn_boss()
{
    level endon( #"end_game", #"hash_7646638df88a3656" );
    exploder::exploder( "fxexp_pyramid_open" );
    var_1c91a56e = struct::get( "apd_door_scene", "targetname" );
    level waittill( #"zombie_total_set" );
    n_threshold = level.total_zombies_killed - level.zombie_total_subtract + level.zombie_total;
    s_notify = level waittill( #"hash_715188521b564b16" );
    var_1c91a56e scene::play( "open" );
    zm_white_toast::spawn_boss();
    
    if ( isdefined( level.e_avogadro ) )
    {
        level.e_avogadro thread spawn_done( n_threshold );
    }
}

// Namespace zm_white_trials/zm_white_trials
// Params 0
// Checksum 0xf9ba92d7, Offset: 0xc60
// Size: 0x84
function function_e478fb2a()
{
    var_1c91a56e = struct::get( "apd_door_scene", "targetname" );
    var_1c91a56e thread scene::play_from_time( "close", undefined, undefined, 1, 1 );
    exploder::exploder_stop( "fxexp_pyramid_open" );
    exploder::exploder_stop( "fxexp_pyramid_capture" );
}

// Namespace zm_white_trials/zm_white_trials
// Params 1
// Checksum 0x95edbbff, Offset: 0xcf0
// Size: 0x17c
function spawn_done( n_threshold )
{
    level endon( #"hash_7646638df88a3656" );
    waitframe( 1 );
    
    if ( isdefined( level.e_avogadro ) )
    {
        self waittill( #"new_scripted_anim" );
        self notify( #"intro_done" );
        self zm_ai_avogadro::function_ed39491e( 1 );
    }
    
    while ( n_threshold > level.total_zombies_killed - level.zombie_total_subtract )
    {
        wait 0.1;
    }
    
    if ( isdefined( level.e_avogadro ) )
    {
        self zm_ai_avogadro::function_ed39491e( 4 );
        exploder::exploder( "fxexp_pyramid_capture" );
        level.vol_toast_trap = getent( "vol_toast_trap", "targetname" );
        
        while ( isdefined( level.e_avogadro ) && !level.e_avogadro istouching( level.vol_toast_trap ) )
        {
            wait 0.1;
        }
        
        while ( isdefined( level.e_avogadro ) )
        {
            wait 0.1;
        }
        
        level thread zm_white_toast::function_3418b6f6();
    }
}

