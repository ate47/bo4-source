#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\animation_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\laststand_shared;
#using scripts\core_common\lui_shared;
#using scripts\core_common\music_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm\ai\zm_ai_blight_father;
#using scripts\zm\ai\zm_ai_catalyst;
#using scripts\zm\ai\zm_ai_stoker;
#using scripts\zm\zm_zodt8;
#using scripts\zm\zm_zodt8_sentinel_trial;
#using scripts\zm_common\ai\zm_ai_utility;
#using scripts\zm_common\bgbs\zm_bgb_anywhere_but_here;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_devgui;
#using scripts\zm_common\zm_laststand;
#using scripts\zm_common\zm_player;
#using scripts\zm_common\zm_powerups;
#using scripts\zm_common\zm_spawner;
#using scripts\zm_common\zm_sq;
#using scripts\zm_common\zm_transformation;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_vo;
#using scripts\zm_common\zm_weapons;

#namespace zodt8_eye;

// Namespace zodt8_eye/zm_zodt8_eye
// Params 0, eflags: 0x2
// Checksum 0xa318b9e8, Offset: 0xdd8
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zodt8_boss", &__init__, undefined, undefined );
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 0
// Checksum 0xad109408, Offset: 0xe20
// Size: 0xdc
function __init__()
{
    init_clientfields();
    init_flags();
    init_steps();
    function_a46c58d0();
    function_f34b8812();
    init_boss();
    level thread function_28effa18();
    function_8dec32e2();
    init_vo();
    
    /#
        if ( getdvarint( #"zm_debug_ee", 0 ) )
        {
            level thread function_5d346946();
        }
    #/
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 0
// Checksum 0x63e20bf8, Offset: 0xf08
// Size: 0x484
function init_clientfields()
{
    clientfield::register( "world", "engine_room_chillout_decals", 1, 1, "int" );
    clientfield::register( "world", "state_rooms_chillout_decals", 1, 1, "int" );
    clientfield::register( "world", "promenade_chillout_decals", 1, 1, "int" );
    clientfield::register( "world", "poop_deck_chillout_decals", 1, 1, "int" );
    clientfield::register( "scriptmover", "bs_bdy_base_cf", 1, 3, "int" );
    clientfield::register( "scriptmover", "bs_bdy_fx_cf", 1, 2, "int" );
    clientfield::register( "scriptmover", "bs_bdy_dmg_fx_cf", 1, 3, "int" );
    clientfield::register( "scriptmover", "bs_dth_fx_cf", 1, 1, "counter" );
    clientfield::register( "scriptmover", "bs_bdy_str_cf", 1, 2, "int" );
    clientfield::register( "scriptmover", "bs_spn_fx_cf", 1, 1, "int" );
    clientfield::register( "scriptmover", "bs_att_mst_tell_cf", 1, 1, "int" );
    clientfield::register( "scriptmover", "bs_att_mst_cf", 1, 1, "int" );
    clientfield::register( "scriptmover", "bs_att_bm_targ_ini_cf", 1, 1, "int" );
    clientfield::register( "scriptmover", "bs_att_bm_tell_cf", 1, 2, "int" );
    clientfield::register( "scriptmover", "bs_att_bm_tell_fx_cf", 1, 1, "int" );
    clientfield::register( "scriptmover", "bs_att_bm_cf", 1, 1, "int" );
    clientfield::register( "allplayers", "bs_att_bm_targ_hit_cf", 1, 1, "int" );
    clientfield::register( "toplayer", "bs_att_bm_targ_frz_fx_cf", 1, 1, "int" );
    clientfield::register( "scriptmover", "bs_att_blst_tll", 1, 1, "int" );
    clientfield::register( "scriptmover", "bs_att_blst", 1, 1, "int" );
    clientfield::register( "world", "in_engine_room", 1, 1, "int" );
    clientfield::register( "world", "bs_gr_fog_fx_cf", 1, 1, "int" );
    clientfield::register( "allplayers", "bs_player_ice_br_cf", 1, 1, "int" );
    clientfield::register( "allplayers", "bs_player_snow_cf", 1, 3, "int" );
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 0
// Checksum 0x75a7482, Offset: 0x1398
// Size: 0xc4
function init_flags()
{
    level flag::init( #"boss_fight_started" );
    level flag::init( #"hash_62b951a213a3945e" );
    level flag::init( #"hash_bd3b222f6d8329d" );
    level flag::init( #"hash_fa1fa6cc9b17c7c" );
    level flag::init( #"hash_50113a36d2c6bb73" );
    level flag::init( #"hash_25d8c88ff3f91ee5" );
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 0
// Checksum 0xa792b719, Offset: 0x1468
// Size: 0x1e4
function init_steps()
{
    zm_sq::register( #"boss_fight", #"step_1", #"hash_29b25d86ddeb7d44", &function_51e51897, &function_99cfd11d );
    zm_sq::register( #"boss_fight", #"step_2", #"hash_29b26086ddeb825d", &function_85bc1590, &function_af6afecd );
    zm_sq::register( #"boss_fight", #"step_3", #"hash_29b25f86ddeb80aa", &function_ed500548, &function_3c959c2e );
    zm_sq::register( #"boss_fight", #"step_4", #"hash_29b25a86ddeb782b", &function_37f8d5ce, &function_eeb1c75d );
    zm_sq::register( #"boss_fight", #"step_5", #"hash_29b25986ddeb7678", &function_b939c184, &function_c6fc0a46 );
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 0
// Checksum 0x923a052d, Offset: 0x1658
// Size: 0xb8
function function_a46c58d0()
{
    a_blockers = getentarray( "bs_scr_bkr", "targetname" );
    
    foreach ( e_blocker in a_blockers )
    {
        e_blocker hide();
        e_blocker notsolid();
    }
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 0
// Checksum 0x208832cd, Offset: 0x1718
// Size: 0xb8
function function_f34b8812()
{
    a_blockers = getentarray( "bs_att_bm_ai_blck", "targetname" );
    
    foreach ( e_blocker in a_blockers )
    {
        e_blocker hide();
        e_blocker notsolid();
    }
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 0
// Checksum 0xe90ce296, Offset: 0x17d8
// Size: 0x204
function init_boss()
{
    e_boss = getent( "bs_bdy_mdl", "targetname" );
    e_boss enablelinkto();
    e_boss notsolid();
    e_boss.e_damage = getent( "bs_bdy_dmg", "targetname" );
    e_boss.e_damage.takedamage = 1;
    e_boss.e_damage function_2baad8fc();
    e_boss.e_damage.zm_ai_category = #"boss";
    e_boss.e_damage enablelinkto();
    e_boss.e_damage linkto( e_boss );
    e_boss.e_damage notsolid();
    level.e_boss = e_boss;
    zm_player::register_slowdown( #"hash_2cc0dfb628810e41", 0.5, 0.1 );
    zm_player::register_slowdown( #"hash_7d336706f2aeadab", 0, 60 );
    zm_player::register_slowdown( #"hash_532f7f688c86c9b1", 0, 2 );
    zm_player::register_slowdown( #"hash_2a290908eb355917", 0, 2 );
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 0
// Checksum 0x6b608369, Offset: 0x19e8
// Size: 0x8c
function function_28effa18()
{
    wait 5;
    level flag::wait_till( "start_zombie_round_logic" );
    function_901c5ffe( "eng", 0 );
    function_901c5ffe( "st", 0 );
    function_901c5ffe( "pro", 0 );
    function_901c5ffe( "pd", 0 );
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 0
// Checksum 0xaa6d09ff, Offset: 0x1a80
// Size: 0x23c
function function_8dec32e2()
{
    sp_blight_father = getent( "zombie_spawner_blight_father", "targetname" );
    zm_transform::function_cfca77a7( sp_blight_father, #"hash_9ecf8085fb7a68f", &zm_ai_blight_father::function_39212989, 10, undefined, undefined, "aib_vign_zm_zod_bltfthr_spawn_pre_split", "aib_vign_zm_zod_bltfthr_spawn_post_split" );
    sp_catalyst = getent( "zombie_spawn_1", "script_string" );
    zm_transform::function_cfca77a7( sp_catalyst, #"hash_7c89b1397a38e3ad", &zm_ai_utility::function_db610082, 0, undefined, &function_724b3e30, "aib_vign_zm_zod_catalyst_corrosive_spawn_pre_split", "aib_vign_zm_zod_catalyst_corrosive_spawn_post_split" );
    sp_catalyst = getent( "zombie_spawn_2", "script_string" );
    zm_transform::function_cfca77a7( sp_catalyst, #"hash_7c89ae397a38de94", &zm_ai_utility::function_db610082, 0, undefined, &function_724b3e30, "aib_vign_zm_zod_catalyst_water_spawn_pre_split", "aib_vign_zm_zod_catalyst_water_spawn_post_split" );
    sp_catalyst = getent( "zombie_spawn_3", "script_string" );
    zm_transform::function_cfca77a7( sp_catalyst, #"hash_7c89af397a38e047", &zm_ai_utility::function_db610082, 0, undefined, &function_724b3e30, "aib_vign_zm_zod_catalyst_electric_spawn_pre_split", "aib_vign_zm_zod_catalyst_electric_spawn_post_split" );
    sp_catalyst = getent( "zombie_spawn_4", "script_string" );
    zm_transform::function_cfca77a7( sp_catalyst, #"hash_7c89ac397a38db2e", &zm_ai_utility::function_db610082, 0, undefined, &function_724b3e30, "aib_vign_zm_zod_catalyst_plasma_spawn_pre_split", "aib_vign_zm_zod_catalyst_plasma_spawn_post_split" );
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 0
// Checksum 0x9554d2a2, Offset: 0x1cc8
// Size: 0x10de
function init_vo()
{
    level.var_bd976920 = [];
    
    if ( !isdefined( level.var_bd976920[ 1 ] ) )
    {
        level.var_bd976920[ 1 ] = [];
    }
    else if ( !isarray( level.var_bd976920[ 1 ] ) )
    {
        level.var_bd976920[ 1 ] = array( level.var_bd976920[ 1 ] );
    }
    
    level.var_bd976920[ 1 ][ level.var_bd976920[ 1 ].size ] = array( 1, #"hash_3131662c13d2efbc" );
    
    if ( !isdefined( level.var_bd976920[ 1 ] ) )
    {
        level.var_bd976920[ 1 ] = [];
    }
    else if ( !isarray( level.var_bd976920[ 1 ] ) )
    {
        level.var_bd976920[ 1 ] = array( level.var_bd976920[ 1 ] );
    }
    
    level.var_bd976920[ 1 ][ level.var_bd976920[ 1 ].size ] = array( 4, #"hash_3131662c13d2efbc" );
    
    if ( !isdefined( level.var_bd976920[ 1 ] ) )
    {
        level.var_bd976920[ 1 ] = [];
    }
    else if ( !isarray( level.var_bd976920[ 1 ] ) )
    {
        level.var_bd976920[ 1 ] = array( level.var_bd976920[ 1 ] );
    }
    
    level.var_bd976920[ 1 ][ level.var_bd976920[ 1 ].size ] = array( 2, #"hash_3131662c13d2efbc" );
    
    if ( !isdefined( level.var_bd976920[ 1 ] ) )
    {
        level.var_bd976920[ 1 ] = [];
    }
    else if ( !isarray( level.var_bd976920[ 1 ] ) )
    {
        level.var_bd976920[ 1 ] = array( level.var_bd976920[ 1 ] );
    }
    
    level.var_bd976920[ 1 ][ level.var_bd976920[ 1 ].size ] = array( 3, #"hash_3131662c13d2efbc" );
    
    if ( !isdefined( level.var_bd976920[ 2 ] ) )
    {
        level.var_bd976920[ 2 ] = [];
    }
    else if ( !isarray( level.var_bd976920[ 2 ] ) )
    {
        level.var_bd976920[ 2 ] = array( level.var_bd976920[ 2 ] );
    }
    
    level.var_bd976920[ 2 ][ level.var_bd976920[ 2 ].size ] = array( 1, #"hash_510594b72cc9b1fd" );
    
    if ( !isdefined( level.var_bd976920[ 2 ] ) )
    {
        level.var_bd976920[ 2 ] = [];
    }
    else if ( !isarray( level.var_bd976920[ 2 ] ) )
    {
        level.var_bd976920[ 2 ] = array( level.var_bd976920[ 2 ] );
    }
    
    level.var_bd976920[ 2 ][ level.var_bd976920[ 2 ].size ] = array( 4, #"hash_510594b72cc9b1fd" );
    
    if ( !isdefined( level.var_bd976920[ 2 ] ) )
    {
        level.var_bd976920[ 2 ] = [];
    }
    else if ( !isarray( level.var_bd976920[ 2 ] ) )
    {
        level.var_bd976920[ 2 ] = array( level.var_bd976920[ 2 ] );
    }
    
    level.var_bd976920[ 2 ][ level.var_bd976920[ 2 ].size ] = array( 3, #"hash_510594b72cc9b1fd" );
    
    if ( !isdefined( level.var_bd976920[ 2 ] ) )
    {
        level.var_bd976920[ 2 ] = [];
    }
    else if ( !isarray( level.var_bd976920[ 2 ] ) )
    {
        level.var_bd976920[ 2 ] = array( level.var_bd976920[ 2 ] );
    }
    
    level.var_bd976920[ 2 ][ level.var_bd976920[ 2 ].size ] = array( 2, #"hash_510594b72cc9b1fd" );
    
    if ( !isdefined( level.var_bd976920[ 3 ] ) )
    {
        level.var_bd976920[ 3 ] = [];
    }
    else if ( !isarray( level.var_bd976920[ 3 ] ) )
    {
        level.var_bd976920[ 3 ] = array( level.var_bd976920[ 3 ] );
    }
    
    level.var_bd976920[ 3 ][ level.var_bd976920[ 3 ].size ] = array( 2, #"hash_7dc8f64c802a299e" );
    
    if ( !isdefined( level.var_bd976920[ 3 ] ) )
    {
        level.var_bd976920[ 3 ] = [];
    }
    else if ( !isarray( level.var_bd976920[ 3 ] ) )
    {
        level.var_bd976920[ 3 ] = array( level.var_bd976920[ 3 ] );
    }
    
    level.var_bd976920[ 3 ][ level.var_bd976920[ 3 ].size ] = array( 4, #"hash_7dc8f64c802a299e" );
    
    if ( !isdefined( level.var_bd976920[ 3 ] ) )
    {
        level.var_bd976920[ 3 ] = [];
    }
    else if ( !isarray( level.var_bd976920[ 3 ] ) )
    {
        level.var_bd976920[ 3 ] = array( level.var_bd976920[ 3 ] );
    }
    
    level.var_bd976920[ 3 ][ level.var_bd976920[ 3 ].size ] = array( 1, #"hash_7dc8f64c802a299e" );
    
    if ( !isdefined( level.var_bd976920[ 3 ] ) )
    {
        level.var_bd976920[ 3 ] = [];
    }
    else if ( !isarray( level.var_bd976920[ 3 ] ) )
    {
        level.var_bd976920[ 3 ] = array( level.var_bd976920[ 3 ] );
    }
    
    level.var_bd976920[ 3 ][ level.var_bd976920[ 3 ].size ] = array( 3, #"hash_7dc8f64c802a299e" );
    
    if ( !isdefined( level.var_bd976920[ 4 ] ) )
    {
        level.var_bd976920[ 4 ] = [];
    }
    else if ( !isarray( level.var_bd976920[ 4 ] ) )
    {
        level.var_bd976920[ 4 ] = array( level.var_bd976920[ 4 ] );
    }
    
    level.var_bd976920[ 4 ][ level.var_bd976920[ 4 ].size ] = array( 1, #"hash_c76edadd1574af7" );
    
    if ( !isdefined( level.var_bd976920[ 4 ] ) )
    {
        level.var_bd976920[ 4 ] = [];
    }
    else if ( !isarray( level.var_bd976920[ 4 ] ) )
    {
        level.var_bd976920[ 4 ] = array( level.var_bd976920[ 4 ] );
    }
    
    level.var_bd976920[ 4 ][ level.var_bd976920[ 4 ].size ] = array( 2, #"hash_c76edadd1574af7" );
    
    if ( !isdefined( level.var_bd976920[ 4 ] ) )
    {
        level.var_bd976920[ 4 ] = [];
    }
    else if ( !isarray( level.var_bd976920[ 4 ] ) )
    {
        level.var_bd976920[ 4 ] = array( level.var_bd976920[ 4 ] );
    }
    
    level.var_bd976920[ 4 ][ level.var_bd976920[ 4 ].size ] = array( 3, #"hash_c76edadd1574af7" );
    
    if ( !isdefined( level.var_bd976920[ 4 ] ) )
    {
        level.var_bd976920[ 4 ] = [];
    }
    else if ( !isarray( level.var_bd976920[ 4 ] ) )
    {
        level.var_bd976920[ 4 ] = array( level.var_bd976920[ 4 ] );
    }
    
    level.var_bd976920[ 4 ][ level.var_bd976920[ 4 ].size ] = array( 4, #"hash_c76edadd1574af7" );
    
    if ( !isdefined( level.var_bd976920[ 5 ] ) )
    {
        level.var_bd976920[ 5 ] = [];
    }
    else if ( !isarray( level.var_bd976920[ 5 ] ) )
    {
        level.var_bd976920[ 5 ] = array( level.var_bd976920[ 5 ] );
    }
    
    level.var_bd976920[ 5 ][ level.var_bd976920[ 5 ].size ] = array( 4, #"hash_3cde846b48875568" );
    
    if ( !isdefined( level.var_bd976920[ 5 ] ) )
    {
        level.var_bd976920[ 5 ] = [];
    }
    else if ( !isarray( level.var_bd976920[ 5 ] ) )
    {
        level.var_bd976920[ 5 ] = array( level.var_bd976920[ 5 ] );
    }
    
    level.var_bd976920[ 5 ][ level.var_bd976920[ 5 ].size ] = array( 3, #"hash_3cde846b48875568" );
    
    if ( !isdefined( level.var_bd976920[ 5 ] ) )
    {
        level.var_bd976920[ 5 ] = [];
    }
    else if ( !isarray( level.var_bd976920[ 5 ] ) )
    {
        level.var_bd976920[ 5 ] = array( level.var_bd976920[ 5 ] );
    }
    
    level.var_bd976920[ 5 ][ level.var_bd976920[ 5 ].size ] = array( 2, #"hash_3cde846b48875568" );
    
    if ( !isdefined( level.var_bd976920[ 5 ] ) )
    {
        level.var_bd976920[ 5 ] = [];
    }
    else if ( !isarray( level.var_bd976920[ 5 ] ) )
    {
        level.var_bd976920[ 5 ] = array( level.var_bd976920[ 5 ] );
    }
    
    level.var_bd976920[ 5 ][ level.var_bd976920[ 5 ].size ] = array( 1, #"hash_3cde846b48875568" );
    level.var_d748689e = #"hash_2df184d89b83d7a6";
    level.var_73f9d759 = #"hash_68b36b3fd33fde80";
    level.var_99d2b056 = #"hash_50eaadbd6d85e554";
    level.var_2404b2a5 = #"hash_1eb09b9ee996d6ed";
    level.var_c7daa370 = #"hash_1ad33382e08dace7";
    level.var_ad9b527b = #"hash_6c43ec4efecb96f8";
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 1
// Checksum 0xa95a1f9e, Offset: 0x2db0
// Size: 0x554
function function_51e51897( var_5ea5c94d )
{
    level flag::clear( "spawn_zombies" );
    level flag::clear( "zombie_drop_powerups" );
    level flag::clear( #"hash_21921ed511559aa3" );
    level flag::set( #"disable_fast_travel" );
    level flag::set( "pause_round_timeout" );
    level flag::set( #"boss_fight_started" );
    level zm_bgb_anywhere_but_here::function_886fce8f( 0 );
    arrayremoveindex( level.sndplayervox, #"elixir", 1 );
    arrayremoveindex( level.sndplayervox, #"blight_father", 1 );
    arrayremoveindex( level.sndplayervox, #"powerup", 1 );
    arrayremoveindex( level.sndplayervox, #"stoker", 1 );
    arrayremoveindex( level.sndplayervox, #"kill", 1 );
    arrayremoveindex( level.sndplayervox, #"fast_travel", 1 );
    arrayremoveindex( level.sndplayervox, #"catalyst_decay_gas", 1 );
    arrayremoveindex( level.sndplayervox, #"catalyst_plasma_detonation", 1 );
    arrayremoveindex( level.sndplayervox, #"hash_4433242e2d225df8", 1 );
    arrayremoveindex( level.sndplayervox, #"catalyst_radiant_scream", 1 );
    level.var_923e8cb4 = struct::get_array( "pd", "script_teleport" );
    level.var_eeb98313 = &function_714f8756;
    level.custom_spawnplayer = &function_9bc4f8cb;
    level.disable_nuke_delay_spawning = 1;
    level notify( #"disable_nuke_delay_spawning" );
    level zodt8_sentinel::function_77a859a8( 1 );
    level.var_d6f059f7 = max( level.round_number, 25 );
    zm_spawner::register_zombie_death_event_callback( &function_e9b8eaff );
    level.var_c9f5947d = 1;
    level notify( #"force_transformations" );
    
    /#
        util::wait_network_frame();
        level notify( #"hash_fbdf766a8b47229" );
    #/
    
    level.e_boss function_500cb0be( #"hash_678aaf8e37498e9a", #"p8_fxanim_zm_zod_eye_01_bundle" );
    level thread zm_zodt8::change_water_height_aft( 1 );
    
    if ( !var_5ea5c94d )
    {
        level thread function_482a7a01();
        level.musicsystemoverride = 1;
        music::setmusicstate( "boss_1" );
        level.e_boss function_8f3497ee( 1, "pd" );
        level thread function_de60e752();
        level thread function_f6e1e56f( 10, 3 );
        level thread function_776c95e2( 50, 1 );
        level thread function_ee223250( 2 );
        var_23cac703 = [];
        level.e_boss function_bb612e31( var_23cac703, 0, -1 );
    }
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 2
// Checksum 0x264191b5, Offset: 0x3310
// Size: 0x5c
function function_99cfd11d( var_5ea5c94d, ended_early )
{
    level flag::set( #"hash_62b951a213a3945e" );
    
    if ( !var_5ea5c94d )
    {
        level.e_boss function_9bc73093( 1 );
    }
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 1
// Checksum 0x552c6040, Offset: 0x3378
// Size: 0x18c
function function_85bc1590( var_5ea5c94d )
{
    if ( !var_5ea5c94d )
    {
        level clientfield::set( "in_engine_room", 1 );
        level boss_teleport_players( "eng" );
        level thread function_482a7a01();
        level.e_boss function_8f3497ee( 2, "eng" );
        var_533ac894 = array( #"zone_boiler_room", #"zone_turbine_room" );
        level thread function_de60e752( var_533ac894 );
        level thread function_f6e1e56f( 12, 3, var_533ac894 );
        level thread function_776c95e2( 35, 2 );
        level thread function_ee223250( 2 );
        var_23cac703 = array( &function_ff69c896 );
        level.e_boss function_bb612e31( var_23cac703, 0, -1, 0 );
    }
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 2
// Checksum 0x7c9f24e6, Offset: 0x3510
// Size: 0x7c
function function_af6afecd( var_5ea5c94d, ended_early )
{
    level flag::set( #"hash_bd3b222f6d8329d" );
    
    if ( !var_5ea5c94d )
    {
        level.e_boss function_9bc73093( 2 );
        level clientfield::set( "in_engine_room", 0 );
    }
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 1
// Checksum 0xc878fdc1, Offset: 0x3598
// Size: 0x10c
function function_ed500548( var_5ea5c94d )
{
    if ( !var_5ea5c94d )
    {
        level boss_teleport_players( "st" );
        level thread function_482a7a01();
        music::setmusicstate( "boss_2" );
        level.e_boss function_8f3497ee( 3, "st" );
        level thread function_de60e752();
        level thread function_f6e1e56f( 20 );
        var_23cac703 = array( &function_c7c928e9 );
        level.e_boss function_bb612e31( var_23cac703, 8000, 36000 );
    }
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 2
// Checksum 0xcd009f82, Offset: 0x36b0
// Size: 0x5c
function function_3c959c2e( var_5ea5c94d, ended_early )
{
    level flag::set( #"hash_fa1fa6cc9b17c7c" );
    
    if ( !var_5ea5c94d )
    {
        level.e_boss function_9bc73093( 3 );
    }
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 1
// Checksum 0x19a037dc, Offset: 0x3718
// Size: 0x10c
function function_37f8d5ce( var_5ea5c94d )
{
    if ( !var_5ea5c94d )
    {
        level boss_teleport_players( "pro" );
        level thread function_482a7a01();
        level.e_boss function_8f3497ee( 4, "pro" );
        level thread function_de60e752();
        level thread function_f6e1e56f( 15 );
        level thread function_770486e1( 46 );
        var_23cac703 = array( &function_371e0929 );
        level.e_boss function_bb612e31( var_23cac703, 13000, 35000 );
    }
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 2
// Checksum 0x632312ac, Offset: 0x3830
// Size: 0x5c
function function_eeb1c75d( var_5ea5c94d, ended_early )
{
    level flag::set( #"hash_50113a36d2c6bb73" );
    
    if ( !var_5ea5c94d )
    {
        level.e_boss function_9bc73093( 4 );
    }
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 1
// Checksum 0x240d2fc0, Offset: 0x3898
// Size: 0x114
function function_b939c184( var_5ea5c94d )
{
    level boss_teleport_players( "pd" );
    level thread function_482a7a01();
    music::setmusicstate( "boss_3" );
    level.e_boss function_8f3497ee( 5, "pd" );
    level thread function_de60e752();
    level thread function_f6e1e56f( 9 );
    level thread function_770486e1( 35 );
    var_23cac703 = array( &function_f487ff16 );
    level.e_boss function_6fa7a16a( var_23cac703 );
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 2
// Checksum 0x82d12056, Offset: 0x39b8
// Size: 0x11c
function function_c6fc0a46( var_5ea5c94d, ended_early )
{
    level flag::clear( #"boss_fight_started" );
    level zm_bgb_anywhere_but_here::function_886fce8f( 1 );
    level.custom_spawnplayer = undefined;
    level.var_c9f5947d = 0;
    zm_spawner::deregister_zombie_death_event_callback( &function_e9b8eaff );
    music::setmusicstate( "none" );
    level.musicsystemoverride = 0;
    level.e_boss function_9bc73093( 5 );
    function_a46c58d0();
    level flag::set( #"hash_25d8c88ff3f91ee5" );
    
    /#
        iprintlnbold( "<dev string:x38>" );
    #/
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 0
// Checksum 0x4e522582, Offset: 0x3ae0
// Size: 0x34
function function_9bc4f8cb()
{
    self.spectator_respawn = level.var_923e8cb4[ self.characterindex ];
    self zm_player::spectator_respawn();
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 2
// Checksum 0x53a56ee8, Offset: 0x3b20
// Size: 0xe8
function function_f74b38da( str_rumble, var_b5291261 = 0 )
{
    if ( var_b5291261 )
    {
        a_e_players = arraycopy( level.activeplayers );
    }
    else
    {
        a_e_players = arraycopy( level.players );
    }
    
    foreach ( e_player in a_e_players )
    {
        e_player playrumbleonentity( str_rumble );
    }
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 2
// Checksum 0x9387f52a, Offset: 0x3c10
// Size: 0x22c
function function_500cb0be( str_mdl, str_scene )
{
    self endon( #"death" );
    self setmodel( str_mdl );
    self.mdl_base = str_mdl;
    
    if ( str_mdl == #"hash_678aaf8e37498e9a" )
    {
        self clientfield::set( "bs_bdy_base_cf", 1 );
    }
    else if ( str_mdl == #"hash_32a51dafb1c7344f" )
    {
        self clientfield::set( "bs_bdy_base_cf", 2 );
    }
    else if ( str_mdl == #"hash_597bdc83a7c9e8c" )
    {
        self clientfield::set( "bs_bdy_base_cf", 3 );
    }
    
    self.str_scene = str_scene;
    self function_3d8879d7();
    util::wait_network_frame();
    self clientfield::set( "bs_bdy_fx_cf", 2 );
    util::wait_network_frame();
    
    if ( isdefined( self.var_ad1388ef ) && self.var_ad1388ef )
    {
        self clientfield::set( "bs_bdy_fx_cf", 0 );
    }
    else
    {
        self clientfield::set( "bs_bdy_fx_cf", 1 );
    }
    
    if ( isdefined( self.var_914750d ) && self.var_914750d > 0 && self.var_914750d <= 3 )
    {
        util::wait_network_frame();
        self clientfield::set( "bs_bdy_dmg_fx_cf", self.var_914750d );
    }
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 1
// Checksum 0x71eb3aee, Offset: 0x3e48
// Size: 0x2b4
function function_3d8879d7( var_97d9fa86 )
{
    self endon( #"death" );
    self clientfield::set( "bs_bdy_str_cf", 0 );
    
    if ( !isdefined( var_97d9fa86 ) )
    {
        self clientfield::set( "bs_bdy_str_cf", 2 );
        util::wait_network_frame( 8 );
        self clientfield::set( "bs_bdy_dmg_fx_cf", 0 );
        self.str_idle = "ilde";
        self.str_arrive = "arrive";
        self.str_depart = "leave";
    }
    else if ( var_97d9fa86 == "crack" )
    {
        self clientfield::set( "bs_bdy_str_cf", 1 );
        util::wait_network_frame( 8 );
        self clientfield::set( "bs_bdy_dmg_fx_cf", self.var_914750d );
        self scene::play( self.str_scene, "crack", self );
        self animation::stop( 0 );
        self.str_arrive = "crack_arrive";
        self.str_depart = "crack_leave";
    }
    else if ( var_97d9fa86 == "break" )
    {
        self clientfield::set( "bs_bdy_str_cf", 1 );
        util::wait_network_frame( 8 );
        self clientfield::set( "bs_bdy_dmg_fx_cf", self.var_914750d );
        self scene::play( self.str_scene, "break", self );
        self animation::stop( 0 );
        self.str_arrive = "break_arrive";
        self.str_depart = "break_leave";
    }
    
    util::wait_network_frame( 2 );
    self clientfield::set( "bs_bdy_str_cf", 0 );
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 2
// Checksum 0xb003076, Offset: 0x4108
// Size: 0x43a
function function_901c5ffe( str_loc, b_on )
{
    switch ( str_loc )
    {
        case #"eng":
            if ( b_on )
            {
                exploder::exploder( "fxexp_er_bf_w_1" );
                exploder::exploder( "fxexp_er_bf_w_2" );
                level clientfield::set( "engine_room_chillout_decals", 0 );
                var_4f77fdcb = getentarray( "engine_room_chillout_ice", "targetname" );
                
                foreach ( var_da532ccb in var_4f77fdcb )
                {
                    var_da532ccb solid();
                    var_da532ccb show();
                }
                
                showmiscmodels( "engine_room_chillout_misc_models_iced" );
                hidemiscmodels( "engine_room_chillout_misc_models_not_iced" );
            }
            else
            {
                level clientfield::set( "engine_room_chillout_decals", 1 );
                var_4f77fdcb = getentarray( "engine_room_chillout_ice", "targetname" );
                
                foreach ( var_da532ccb in var_4f77fdcb )
                {
                    var_da532ccb notsolid();
                    var_da532ccb hide();
                }
                
                showmiscmodels( "engine_room_chillout_misc_models_not_iced" );
                hidemiscmodels( "engine_room_chillout_misc_models_iced" );
            }
            
            break;
        case #"st":
            if ( b_on )
            {
                level clientfield::set( "state_rooms_chillout_decals", 0 );
            }
            else
            {
                level clientfield::set( "state_rooms_chillout_decals", 1 );
            }
            
            break;
        case #"pro":
            if ( b_on )
            {
                exploder::exploder( "fxexp_s_p_bf_w" );
                level clientfield::set( "promenade_chillout_decals", 0 );
                showmiscmodels( "promenade_chillout_props" );
            }
            else
            {
                level clientfield::set( "promenade_chillout_decals", 1 );
                hidemiscmodels( "promenade_chillout_props" );
            }
            
            break;
        case #"pd":
            if ( b_on )
            {
                exploder::exploder( "fxexp_pd_bf_w" );
                level clientfield::set( "poop_deck_chillout_decals", 0 );
                showmiscmodels( "poop_deck_chillout_props" );
            }
            else
            {
                level clientfield::set( "poop_deck_chillout_decals", 1 );
                hidemiscmodels( "poop_deck_chillout_props" );
            }
            
            break;
    }
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 1
// Checksum 0xa08cd882, Offset: 0x4550
// Size: 0x16
function function_714f8756( a_s_valid_respawn_points )
{
    return level.var_923e8cb4;
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 1
// Checksum 0x62837d84, Offset: 0x4570
// Size: 0x74
function boss_teleport_players( str_loc )
{
    level.var_923e8cb4 = struct::get_array( str_loc, "script_teleport" );
    level zodt8_sentinel::function_43a16eb7( str_loc, struct::get( #"boss_fight" ) );
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 0
// Checksum 0xdbbb4ff1, Offset: 0x45f0
// Size: 0x98
function function_7d475775()
{
    foreach ( player in level.players )
    {
        if ( player laststand::player_is_in_laststand() )
        {
            player thread zm_laststand::auto_revive( player );
        }
    }
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 0
// Checksum 0x295bef3f, Offset: 0x4690
// Size: 0x6e
function function_732f7da0()
{
    if ( !isdefined( level.var_f3c4bd00 ) )
    {
        level.var_f3c4bd00 = zm_utility::get_number_of_valid_players();
        return;
    }
    
    if ( level.var_f3c4bd00 < zm_utility::get_number_of_valid_players() )
    {
        level.var_f3c4bd00 = zm_utility::get_number_of_valid_players();
    }
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 0
// Checksum 0x409db085, Offset: 0x4708
// Size: 0x74
function function_482a7a01()
{
    self notify( "1c4193aa80a6dcb8" );
    self endon( "1c4193aa80a6dcb8" );
    level waittill( #"hash_38f29f9cb03586ea", #"intermission" );
    zm_transform::function_e95ec8df();
    level zodt8_sentinel::function_77a859a8( 1, 0, 0 );
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 2
// Checksum 0x63721c5e, Offset: 0x4788
// Size: 0x3b6
function function_c8f90603( str_blocker, b_solid )
{
    a_blockers = getentarray( str_blocker, "script_blocker" );
    
    if ( b_solid )
    {
        foreach ( e_blocker in a_blockers )
        {
            e_blocker solid();
            e_blocker show();
        }
        
        e_blocker.a_mdl_fx = [];
        a_s_fx = struct::get_array( str_blocker, "script_blocker_fx" );
        
        foreach ( s_fx in a_s_fx )
        {
            mdl_fx = util::spawn_model( #"p8_zm_power_door_symbol_01", s_fx.origin, s_fx.angles );
            mdl_fx.objectid = "symbol_front_power";
            mdl_fx clientfield::set( "" + #"blocker_fx", 1 );
            
            if ( !isdefined( e_blocker.a_mdl_fx ) )
            {
                e_blocker.a_mdl_fx = [];
            }
            else if ( !isarray( e_blocker.a_mdl_fx ) )
            {
                e_blocker.a_mdl_fx = array( e_blocker.a_mdl_fx );
            }
            
            e_blocker.a_mdl_fx[ e_blocker.a_mdl_fx.size ] = mdl_fx;
        }
        
        return;
    }
    
    foreach ( e_blocker in a_blockers )
    {
        e_blocker notsolid();
        e_blocker hide();
        
        if ( isdefined( e_blocker.a_mdl_fx ) )
        {
            foreach ( mdl_fx in e_blocker.a_mdl_fx )
            {
                mdl_fx thread zodt8_sentinel::function_73145dbe();
                mdl_fx clientfield::set( "" + #"blocker_fx", 0 );
            }
            
            e_blocker.a_mdl_fx = undefined;
        }
    }
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 1
// Checksum 0xdd54bbca, Offset: 0x4b48
// Size: 0x282
function function_a55a0339( str_loc )
{
    self.var_431d02e5 = struct::get( "bs_pth_hld_" + str_loc, "targetname" );
    
    if ( !isdefined( self.var_431d02e5 ) )
    {
        self.var_431d02e5 = spawnstruct();
        self.var_431d02e5.targetname = "bs_pth_hld_" + str_loc;
        self.var_431d02e5.origin = ( 0, 0, -9999 );
        self.var_431d02e5.angles = ( 0, 0, 0 );
    }
    
    var_461e7e58 = struct::get( "bs_pth_st_" + str_loc, "targetname" );
    
    if ( !isdefined( var_461e7e58 ) )
    {
        var_461e7e58 = self.var_431d02e5;
    }
    
    assert( isdefined( var_461e7e58 ) );
    self.a_s_path = [];
    
    if ( !isdefined( self.a_s_path ) )
    {
        self.a_s_path = [];
    }
    else if ( !isarray( self.a_s_path ) )
    {
        self.a_s_path = array( self.a_s_path );
    }
    
    self.a_s_path[ self.a_s_path.size ] = var_461e7e58;
    self.n_path_start = 0;
    n_path_index = 0;
    
    while ( isdefined( var_461e7e58.linkto ) )
    {
        n_path_index++;
        var_461e7e58 = struct::get( var_461e7e58.linkto, "linkname" );
        
        if ( !isdefined( self.a_s_path ) )
        {
            self.a_s_path = [];
        }
        else if ( !isarray( self.a_s_path ) )
        {
            self.a_s_path = array( self.a_s_path );
        }
        
        self.a_s_path[ self.a_s_path.size ] = var_461e7e58;
        
        if ( isdefined( var_461e7e58.var_f0b23ec1 ) && var_461e7e58.var_f0b23ec1 )
        {
            self.n_path_start = n_path_index;
        }
    }
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 2
// Checksum 0x82e85a92, Offset: 0x4dd8
// Size: 0xca4
function function_8f3497ee( n_stage, str_loc )
{
    level thread function_c8f90603( "bs_blkr_stg_" + str_loc, 1 );
    util::wait_network_frame( 2 );
    self function_141c7d46();
    self function_a55a0339( str_loc );
    self function_26e02ac9( 0 );
    function_732f7da0();
    self function_71f63a19( str_loc );
    self function_1b11b43( str_loc );
    
    /#
        iprintlnbold( "<dev string:x49>" + n_stage + "<dev string:x52>" );
    #/
    
    zm_audio::sndvoxoverride( 1 );
    level.powerup_vo_available = &zodt8_sentinel::return_false;
    
    switch ( n_stage )
    {
        case 1:
            function_d21f5b58( 1 );
            wait 3;
            self function_1122d832( "event_low_impact", "pd" );
            self playsound( "zmb_eyeball_vox_intro_s1" );
            level thread function_f74b38da( "zm_power_on_rumble" );
            self scene::play( self.str_scene, "roar", self );
            self animation::stop( 0 );
            self thread scene::play( self.str_scene, self.str_idle, self );
            level util::delay( #"hash_5286b6160d468570", undefined, &function_a2170913, n_stage, 3 );
            level thread zodt8_sentinel::function_53802e89( #"hash_696f2e5fafff5614", undefined, array( 2, 1, 4, 3 ) );
            wait 1.5;
            self function_671e8d37();
            self boss_move( 0, 0 );
            util::wait_network_frame( 4 );
            self boss_leave();
            self.var_451ab1a6 = 0;
            var_d1c757d1 = struct::get( "bs_pth_pd_s1_hold", "targetname" );
            self.origin = var_d1c757d1.origin;
            self.angles = var_d1c757d1.angles;
            self boss_arrive();
            function_d21f5b58( 0 );
            break;
        case 2:
            function_d21f5b58( 1 );
            wait 3;
            self function_1122d832( "event_low_impact", "eng", 2 );
            self playsound( "zmb_eyeball_vox_intro_s2" );
            level thread function_f74b38da( "zm_power_on_rumble" );
            self scene::play( self.str_scene, "roar", self );
            self animation::stop( 0 );
            self thread scene::play( self.str_scene, self.str_idle, self );
            function_901c5ffe( "eng", 1 );
            wait 1;
            self clientfield::set( "bs_att_mst_tell_cf", 1 );
            level thread scene::play( "p8_fxanim_zm_zod_engine_pistons_idle_01_bundle", "stop" );
            level thread scene::play( "p8_fxanim_zm_zod_engine_pistons_idle_02_bundle", "stop" );
            wait 1;
            level thread function_a2170913( n_stage );
            function_d21f5b58( 1 );
            break;
        case 3:
            function_d21f5b58( 1 );
            wait 3;
            self function_1122d832( "event_impact", "st" );
            function_901c5ffe( "st", 1 );
            self playsound( "zmb_eyeball_vox_intro_s3" );
            level thread function_f74b38da( "zm_power_on_rumble" );
            self function_671e8d37();
            level thread function_a6f08a79( #"p8_fxanim_zm_zod_state_lft_hall_bundle" );
            self function_c7c928e9( 0, 1, 0 );
            level thread function_a6f08a79( #"p8_fxanim_zm_zod_state_rt_hall_bundle" );
            self function_c7c928e9( 0, 1, 1 );
            self function_a8a76e18();
            wait 0.5;
            level thread function_a2170913( n_stage );
            function_d21f5b58( 0 );
            break;
        case 4:
            function_d21f5b58( 1 );
            self function_500cb0be( #"hash_32a51dafb1c7344f", #"p8_fxanim_zm_zod_eye_02_bundle" );
            wait 3;
            self function_1122d832( "event_impact", "pro", 4 );
            self playsound( "zmb_eyeball_vox_intro_s4" );
            level thread function_f74b38da( "zm_power_on_rumble" );
            self.var_914750d = 1;
            self clientfield::set( "bs_bdy_dmg_fx_cf", self.var_914750d );
            wait 0.5;
            function_901c5ffe( "pro", 1 );
            level thread function_3681a3ac( #"p8_fxanim_zm_zod_prom_icicles_01_bundle" );
            level thread function_3681a3ac( #"p8_fxanim_zm_zod_prom_icicles_02_bundle" );
            level thread function_3681a3ac( #"p8_fxanim_zm_zod_prom_icicles_03_bundle" );
            self scene::play( self.str_scene, "roar1", self );
            self.str_idle = "idle1";
            self animation::stop( 0 );
            self thread scene::play( self.str_scene, self.str_idle, self );
            self clientfield::set( "bs_att_mst_tell_cf", 0 );
            wait 0.5;
            level thread function_a2170913( n_stage );
            function_d21f5b58( 0 );
            break;
        case 5:
            function_d21f5b58( 1 );
            self function_500cb0be( #"hash_597bdc83a7c9e8c", #"p8_fxanim_zm_zod_eye_03_bundle" );
            wait 2;
            self function_1122d832( "event_high_impact", "pd", 5 );
            self playsound( "zmb_eyeball_vox_intro_s5" );
            level thread function_f74b38da( "zm_power_on_rumble" );
            self scene::play( self.str_scene, "roar2", self );
            self.str_idle = "idle2";
            self animation::stop( 0 );
            self thread scene::play( self.str_scene, self.str_idle, self );
            self.var_914750d = 1;
            self clientfield::set( "bs_bdy_dmg_fx_cf", self.var_914750d );
            a_iceberg = getentarray( "forget_what_you_know", "targetname" );
            
            foreach ( mdl in a_iceberg )
            {
                mdl.origin -= ( 0, 0, 13800 );
                mdl show();
                mdl.origin += ( 0, 0, 13800 );
                mdl clientfield::set( "" + #"hash_15b23de7589e61a", 1 );
            }
            
            function_901c5ffe( "pd", 1 );
            wait 0.5;
            level thread function_a2170913( n_stage );
            wait 1;
            function_d21f5b58( 0 );
            break;
    }
    
    /#
        iprintlnbold( "<dev string:x49>" + n_stage + "<dev string:x63>" );
    #/
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 2
// Checksum 0xd08df9c, Offset: 0x5a88
// Size: 0x11e
function function_a2170913( n_stage, n_delay )
{
    zm_audio::sndvoxoverride( 1 );
    
    if ( isdefined( n_delay ) )
    {
        wait n_delay;
    }
    
    foreach ( str_vo_line in level.var_bd976920[ n_stage ] )
    {
        e_speaker = zm_utility::function_828bac1( str_vo_line[ 0 ] );
        
        if ( isplayer( e_speaker ) )
        {
            e_speaker zm_vo::function_a2bd5a0c( str_vo_line[ 1 ] );
        }
    }
    
    zm_audio::sndvoxoverride( 0 );
    level.powerup_vo_available = undefined;
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 3
// Checksum 0x59bfa9e1, Offset: 0x5bb0
// Size: 0x1e8
function function_1122d832( var_d503d5d9, str_loc, n_stage )
{
    level thread scene::stop( #"p8_fxanim_zm_zod_skybox_bundle" );
    level thread scene::play( #"p8_fxanim_zm_zod_skybox_bundle", var_d503d5d9 );
    level thread function_f74b38da( "zm_power_on_rumble" );
    level thread zodt8_sentinel::function_63a0f09e( 1, 0 );
    wait 0.5;
    self function_1e93034e( str_loc );
    self function_a8a76e18( 1 );
    level clientfield::set( "bs_gr_fog_fx_cf", 1 );
    
    if ( isdefined( n_stage ) )
    {
        switch ( n_stage )
        {
            case 2:
                var_5fe34cb1 = 1;
                break;
            case 4:
                var_5fe34cb1 = 2;
                break;
            case 5:
                var_5fe34cb1 = 3;
                break;
        }
        
        foreach ( e_player in level.players )
        {
            e_player clientfield::set( "bs_player_snow_cf", var_5fe34cb1 );
        }
    }
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 1
// Checksum 0xb9ee612d, Offset: 0x5da0
// Size: 0x2c
function function_a6f08a79( var_c1d77974 )
{
    wait 2.5;
    level thread scene::play( var_c1d77974 );
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 1
// Checksum 0x3cbe1169, Offset: 0x5dd8
// Size: 0x24
function function_3681a3ac( var_c1d77974 )
{
    level thread scene::play( var_c1d77974 );
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 1
// Checksum 0x3bfeae43, Offset: 0x5e08
// Size: 0x118
function function_d21f5b58( b_turn_on )
{
    if ( b_turn_on )
    {
        foreach ( player in level.activeplayers )
        {
            player clientfield::set( "bs_player_ice_br_cf", 1 );
        }
        
        return;
    }
    
    foreach ( player in level.players )
    {
        player clientfield::set( "bs_player_ice_br_cf", 0 );
    }
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 1
// Checksum 0x31cac9f, Offset: 0x5f28
// Size: 0x6f4
function function_9bc73093( n_stage )
{
    function_7d475775();
    
    /#
        iprintlnbold( "<dev string:x49>" + n_stage + "<dev string:x75>" );
    #/
    
    self function_26e02ac9( 0 );
    level thread function_f74b38da( "zm_power_on_rumble" );
    
    switch ( n_stage )
    {
        case 1:
            var_d66d7d37 = "zmb_eyeball_vox_outro_s1";
            var_d503d5d9 = "event_low_impact";
            break;
        case 2:
            var_d66d7d37 = "zmb_eyeball_vox_outro_s2";
            var_d503d5d9 = "event_impact";
            break;
        case 3:
            var_d66d7d37 = "zmb_eyeball_vox_outro_s3";
            var_d503d5d9 = "event_impact";
            break;
        case 4:
            var_d66d7d37 = "zmb_eyeball_vox_outro_s4";
            var_d503d5d9 = "event_high_impact";
            break;
        case 5:
            var_d66d7d37 = "zmb_eyeball_vox_outro_s5";
            var_d503d5d9 = "event_high_impact";
            break;
    }
    
    self playsound( var_d66d7d37 );
    level thread scene::stop( #"p8_fxanim_zm_zod_skybox_bundle" );
    level util::delay( 0.2, undefined, &scene::play, #"p8_fxanim_zm_zod_skybox_bundle", var_d503d5d9 );
    self thread scene::play( self.str_scene, "pain", self );
    level thread function_f74b38da( "zm_power_on_rumble" );
    n_wait = 0.6 * getanimlength( #"hash_24f221de31f87832" );
    wait n_wait;
    
    if ( n_stage != 5 )
    {
        level thread zodt8_sentinel::function_63a0f09e( 1, 0 );
        self boss_leave( 1 );
        self clientfield::set( "bs_bdy_fx_cf", 2 );
        wait 0.5;
        level clientfield::set( "bs_gr_fog_fx_cf", 0 );
        self clientfield::set( "bs_bdy_dmg_fx_cf", 0 );
        
        foreach ( e_player in level.players )
        {
            e_player clientfield::set( "bs_player_snow_cf", 0 );
        }
        
        self.origin -= ( 0, 0, 9999 );
        self boss_arrive();
        
        if ( isdefined( self.var_29b322f2 ) )
        {
            array::remove_undefined( self.var_29b322f2 );
            
            if ( self.var_29b322f2.size > 0 )
            {
                wait 5;
            }
        }
        
        wait 5;
    }
    else
    {
        level thread scene::init_streamer( #"cin_zm_zod_outro", level.teams[ #"allies" ] );
        level thread lui::screen_flash( 0.33, 0.33, 0.33, 0.8, "white" );
        level thread scene::stop( #"p8_fxanim_zm_zod_skybox_bundle" );
        level util::delay( 0.2, undefined, &scene::play, #"p8_fxanim_zm_zod_skybox_bundle", var_d503d5d9 );
        self clientfield::set( "bs_bdy_fx_cf", 2 );
        self clientfield::increment( "bs_dth_fx_cf", 1 );
        self scene::play( self.str_scene, "death", self );
        wait 1;
        level thread lui::screen_fade_out( 10, "white" );
        wait 10;
        self function_141c7d46();
        level clientfield::set( "bs_gr_fog_fx_cf", 0 );
        self clientfield::set( "bs_bdy_dmg_fx_cf", 0 );
        
        foreach ( e_player in level.players )
        {
            e_player clientfield::set( "bs_player_snow_cf", 0 );
        }
        
        util::wait_network_frame();
        level notify( #"hash_38f29f9cb03586ea" );
        self.e_damage delete();
        self delete();
    }
    
    /#
        iprintlnbold( "<dev string:x49>" + n_stage + "<dev string:x86>" );
    #/
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 1
// Checksum 0x64ca84ba, Offset: 0x6628
// Size: 0x58
function function_ee223250( var_bcccab17 )
{
    for ( var_aae7efaa = 0; var_aae7efaa < var_bcccab17 ; var_aae7efaa++ )
    {
        level waittill( #"hash_3a4456148ade383a" );
    }
    
    level notify( #"hash_38f29f9cb03586ea" );
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 2
// Checksum 0xedfc1dbd, Offset: 0x6688
// Size: 0xec
function function_abbfbdff( a_str_vo, n_delay )
{
    if ( isdefined( n_delay ) )
    {
        wait n_delay;
    }
    
    if ( isplayer( self ) )
    {
        e_random_player = self;
    }
    else
    {
        e_random_player = array::random( zm_vo::function_347f7d34() );
        
        if ( !isdefined( e_random_player ) )
        {
            return;
        }
    }
    
    if ( !isdefined( a_str_vo ) )
    {
        a_str_vo = [];
    }
    else if ( !isarray( a_str_vo ) )
    {
        a_str_vo = array( a_str_vo );
    }
    
    str_vo_line = array::random( a_str_vo );
    e_random_player thread zm_vo::function_a2bd5a0c( str_vo_line );
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 4
// Checksum 0x361286e2, Offset: 0x6780
// Size: 0x14c
function function_bb612e31( var_23cac703, var_59cdb7b9, var_c962047c, var_890ce7a8 = 1 )
{
    level thread function_2b6b4a44();
    var_2aaf6cdb = 0.5;
    
    foreach ( player in level.activeplayers )
    {
        var_2aaf6cdb += 0.5;
    }
    
    self.var_59cdb7b9 = var_2aaf6cdb * var_59cdb7b9;
    
    if ( var_c962047c > 0 )
    {
        self.var_c962047c = var_2aaf6cdb * var_c962047c;
    }
    else
    {
        self.var_c962047c = -1;
    }
    
    if ( var_23cac703.size > 0 )
    {
        self thread function_542eeaa7( var_23cac703, var_890ce7a8 );
    }
    
    level waittill( #"hash_38f29f9cb03586ea" );
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 1
// Checksum 0xa5502bfd, Offset: 0x68d8
// Size: 0x1c6
function function_1e93034e( str_loc )
{
    self.var_29b322f2 = [];
    var_43a9d923 = struct::get( "bs_pup_fa_" + str_loc, "targetname" );
    var_906d3e2a = zm_powerups::specific_powerup_drop( "full_ammo", var_43a9d923.origin, undefined, undefined, undefined, 1 );
    
    if ( !isdefined( self.var_29b322f2 ) )
    {
        self.var_29b322f2 = [];
    }
    else if ( !isarray( self.var_29b322f2 ) )
    {
        self.var_29b322f2 = array( self.var_29b322f2 );
    }
    
    self.var_29b322f2[ self.var_29b322f2.size ] = var_906d3e2a;
    var_78a8b445 = struct::get( "bs_pup_crpn_" + str_loc, "targetname" );
    e_carpenter = zm_powerups::specific_powerup_drop( "carpenter", var_78a8b445.origin, undefined, undefined, undefined, 1 );
    
    if ( !isdefined( self.var_29b322f2 ) )
    {
        self.var_29b322f2 = [];
    }
    else if ( !isarray( self.var_29b322f2 ) )
    {
        self.var_29b322f2 = array( self.var_29b322f2 );
    }
    
    self.var_29b322f2[ self.var_29b322f2.size ] = e_carpenter;
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 0
// Checksum 0xfb098f0a, Offset: 0x6aa8
// Size: 0x90
function function_141c7d46()
{
    if ( !isdefined( self.var_29b322f2 ) )
    {
        return;
    }
    
    foreach ( e_powerup in self.var_29b322f2 )
    {
        if ( isdefined( e_powerup ) )
        {
            e_powerup delete();
        }
    }
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 1
// Checksum 0x4ce361e4, Offset: 0x6b40
// Size: 0x1d0
function function_71f63a19( str_loc )
{
    var_a6a5b18e = struct::get_array( "bs_att_mst_" + str_loc, "targetname" );
    
    if ( var_a6a5b18e.size > 0 )
    {
        self.var_48b3f539 = [];
        var_a6a5b18e = array::sort_by_script_int( var_a6a5b18e, 1 );
        var_20920e30 = 0;
        self.var_48b3f539[ var_20920e30 ] = [];
        
        for ( i = 0; i < var_a6a5b18e.size ; i++ )
        {
            if ( !isdefined( self.var_48b3f539[ var_20920e30 ] ) )
            {
                self.var_48b3f539[ var_20920e30 ] = [];
            }
            
            if ( !isdefined( self.var_48b3f539[ var_20920e30 ] ) )
            {
                self.var_48b3f539[ var_20920e30 ] = [];
            }
            else if ( !isarray( self.var_48b3f539[ var_20920e30 ] ) )
            {
                self.var_48b3f539[ var_20920e30 ] = array( self.var_48b3f539[ var_20920e30 ] );
            }
            
            self.var_48b3f539[ var_20920e30 ][ self.var_48b3f539[ var_20920e30 ].size ] = var_a6a5b18e[ i ];
            
            if ( isdefined( var_a6a5b18e[ i + 1 ] ) )
            {
                if ( var_a6a5b18e[ i ].script_int != var_a6a5b18e[ i + 1 ].script_int )
                {
                    var_20920e30++;
                }
            }
        }
    }
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 2
// Checksum 0x92f77952, Offset: 0x6d18
// Size: 0x2ea
function function_1b11b43( str_loc, var_765a63f )
{
    self.var_3c63665 = [];
    var_ef1960a9 = struct::get_array( "bs_att_bm_" + str_loc, "targetname" );
    
    if ( isdefined( var_765a63f ) )
    {
        var_dde77388 = struct::get_array( "bs_att_bm_" + var_765a63f, "targetname" );
        var_ef1960a9 = arraycombine( var_ef1960a9, var_dde77388, 0, 0 );
    }
    
    var_ef1960a9 = array::filter( var_ef1960a9, 0, &function_c0e39137 );
    
    if ( var_ef1960a9.size > 0 )
    {
        var_ef1960a9 = array::sort_by_script_int( var_ef1960a9, 1 );
        
        for ( i = 0; i < var_ef1960a9.size ; i++ )
        {
            var_2a64b584 = var_ef1960a9[ i ];
            self.var_3c63665[ i ] = [];
            
            if ( !isdefined( self.var_3c63665[ i ] ) )
            {
                self.var_3c63665[ i ] = [];
            }
            else if ( !isarray( self.var_3c63665[ i ] ) )
            {
                self.var_3c63665[ i ] = array( self.var_3c63665[ i ] );
            }
            
            self.var_3c63665[ i ][ self.var_3c63665[ i ].size ] = var_2a64b584;
            
            while ( isdefined( var_2a64b584.linkto ) )
            {
                var_2a64b584 = struct::get( var_2a64b584.linkto, "linkname" );
                
                if ( !isdefined( self.var_3c63665[ i ] ) )
                {
                    self.var_3c63665[ i ] = [];
                }
                else if ( !isarray( self.var_3c63665[ i ] ) )
                {
                    self.var_3c63665[ i ] = array( self.var_3c63665[ i ] );
                }
                
                self.var_3c63665[ i ][ self.var_3c63665[ i ].size ] = var_2a64b584;
            }
        }
    }
    
    self.var_e6621b81 = getentarray( "bs_att_bm_vol_" + str_loc, "targetname" );
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 1
// Checksum 0xcadf7976, Offset: 0x7010
// Size: 0x1a, Type: bool
function function_c0e39137( e_ent )
{
    return !isdefined( e_ent.linkname );
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 0
// Checksum 0x6f85a4b4, Offset: 0x7038
// Size: 0x474
function function_bb528a4b()
{
    level endon( #"hash_38f29f9cb03586ea", #"intermission" );
    self notify( "541847c2acc31617" );
    self endon( "541847c2acc31617" );
    var_2721aeff = 0;
    self.var_18acfe18 = 0;
    
    if ( !isdefined( self.var_c962047c ) || self.var_c962047c <= 0 )
    {
        var_bdcf6288 = 1;
    }
    else
    {
        var_bdcf6288 = 0;
        var_97cf344e = 3;
        
        if ( !isdefined( self.var_914750d ) )
        {
            self.var_914750d = 0;
            var_97cf344e -= 1;
        }
        
        var_3b922743 = self.var_c962047c / 4;
        
        if ( !isdefined( self.var_6a30a892 ) )
        {
            self.var_6a30a892 = var_3b922743;
        }
    }
    
    while ( true )
    {
        b_cancelled = 0;
        s_notify = self.e_damage waittill( #"damage" );
        n_damage = s_notify.amount;
        w_weapon = s_notify.weapon;
        
        if ( isdefined( w_weapon ) && zm_weapons::is_wonder_weapon( w_weapon ) )
        {
            n_damage *= 0.1;
        }
        
        if ( isalive( s_notify.attacker ) && isplayer( s_notify.attacker ) )
        {
            s_notify.attacker util::show_hit_marker();
            
            if ( s_notify.attacker hasperk( #"specialty_mod_awareness" ) )
            {
                n_damage = int( n_damage * 1.1 );
            }
        }
        
        self.var_18acfe18 += n_damage;
        
        if ( isdefined( self.var_59cdb7b9 ) && self.var_59cdb7b9 > 0 && self.var_18acfe18 >= self.var_59cdb7b9 )
        {
            /#
                iprintlnbold( "<dev string:x98>" );
            #/
            
            b_cancelled = 1;
            self function_26e02ac9( 0 );
            util::wait_network_frame();
        }
        
        if ( !var_bdcf6288 )
        {
            self.var_57badb98 += n_damage;
            
            if ( self.var_914750d < var_97cf344e && self.var_57badb98 > self.var_6a30a892 )
            {
                self.var_914750d++;
                self.var_6a30a892 += var_3b922743;
                b_cancelled = 1;
                self.var_e21ca032 = &function_c85b83f3;
            }
            
            if ( self.var_57badb98 >= self.var_c962047c )
            {
                b_cancelled = 1;
                var_2721aeff = 1;
            }
        }
        
        if ( b_cancelled )
        {
            level notify( #"hash_14400d2bff068132" );
            
            if ( var_2721aeff )
            {
                self.var_914750d = undefined;
                self.var_6a30a892 = undefined;
                level notify( #"hash_38f29f9cb03586ea" );
            }
            else
            {
                function_abbfbdff( level.var_73f9d759, 0.5 );
                playsoundatposition( #"hash_6040f3b85932670c", self.origin );
                self scene::play( self.str_scene, "pain", self );
                level thread function_f74b38da( "zm_power_on_rumble" );
            }
            
            break;
        }
    }
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 0
// Checksum 0xa71889fb, Offset: 0x74b8
// Size: 0xec
function function_c85b83f3()
{
    if ( !isdefined( self.var_914750d ) )
    {
        self.var_914750d = 0;
    }
    
    if ( self.mdl_base == #"hash_32a51dafb1c7344f" )
    {
        if ( self.var_914750d == 2 )
        {
            self function_3d8879d7( "crack" );
        }
        else
        {
            self function_3d8879d7( "break" );
        }
        
        return;
    }
    
    if ( self.mdl_base == #"hash_678aaf8e37498e9a" )
    {
        if ( self.var_914750d == 1 )
        {
            self function_3d8879d7( "crack" );
            return;
        }
        
        self function_3d8879d7( "break" );
    }
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 1
// Checksum 0x444153b0, Offset: 0x75b0
// Size: 0xea
function function_26e02ac9( b_show )
{
    if ( isdefined( b_show ) && b_show )
    {
        self clientfield::set( "bs_bdy_fx_cf", 0 );
        self.e_damage solid();
        target_set( self );
    }
    else
    {
        self clientfield::set( "bs_bdy_fx_cf", 1 );
        self.e_damage notsolid();
        
        if ( target_istarget( self ) )
        {
            target_remove( self );
        }
    }
    
    self.var_ad1388ef = b_show;
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 1
// Checksum 0x6be705ca, Offset: 0x76a8
// Size: 0x17c
function function_6fa7a16a( var_23cac703 )
{
    level endon( #"intermission" );
    level thread function_c8f90603( "bs_blkr_stg_" + "pd", 1 );
    level thread function_2b6b4a44();
    self function_a55a0339( "pd" );
    var_2aaf6cdb = 0.5;
    
    foreach ( player in level.activeplayers )
    {
        var_2aaf6cdb += 0.5;
    }
    
    self.var_7954bf70 = var_2aaf6cdb * 10000;
    self.var_ba36376c = var_2aaf6cdb * 25000;
    self.var_f881e30f = var_2aaf6cdb * 18000;
    self.var_6efcc8c1 = 0;
    self thread function_542eeaa7( var_23cac703 );
    level waittill( #"hash_38f29f9cb03586ea" );
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 0
// Checksum 0x9eee51ad, Offset: 0x7830
// Size: 0x374
function function_3d6eaad5()
{
    level endon( #"hash_38f29f9cb03586ea", #"hash_14400d2bff068132", #"intermission" );
    self notify( "470dfc850103a920" );
    self endon( "470dfc850103a920" );
    self.var_18acfe18 = 0;
    var_7350b8a6 = 0;
    
    while ( true )
    {
        b_cancelled = 0;
        s_notify = self.e_damage waittill( #"damage" );
        n_damage = s_notify.amount;
        w_weapon = s_notify.weapon;
        
        if ( isdefined( w_weapon ) && zm_weapons::is_wonder_weapon( w_weapon ) )
        {
            n_damage *= 0.1;
        }
        
        if ( isalive( s_notify.attacker ) && isplayer( s_notify.attacker ) )
        {
            s_notify.attacker util::show_hit_marker();
            
            if ( s_notify.attacker hasperk( #"specialty_mod_awareness" ) )
            {
                n_damage = int( n_damage * 1.1 );
            }
        }
        
        self.var_18acfe18 += n_damage;
        
        if ( self.var_18acfe18 >= self.var_7954bf70 )
        {
            /#
                iprintlnbold( "<dev string:xab>" );
            #/
            
            self function_26e02ac9( 0 );
            b_cancelled = 1;
            util::wait_network_frame();
        }
        
        self.var_57badb98 += n_damage;
        
        if ( self.var_57badb98 >= self.var_ba36376c )
        {
            /#
                iprintlnbold( "<dev string:xab>" );
            #/
            
            self.var_575f3097 = 1;
            self.var_57badb98 = 0;
            self function_26e02ac9( 0 );
            b_cancelled = 1;
            var_7350b8a6 = 1;
        }
        
        if ( b_cancelled )
        {
            level notify( #"hash_14400d2bff068132" );
            
            if ( !var_7350b8a6 )
            {
                function_abbfbdff( level.var_73f9d759, 0.5 );
                playsoundatposition( #"hash_6040f3b85932670c", self.origin );
                self scene::play( self.str_scene, "pain", self );
                level thread function_f74b38da( "zm_power_on_rumble" );
            }
            
            break;
        }
    }
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 0
// Checksum 0xaef664c4, Offset: 0x7bb0
// Size: 0x2e0
function function_ae4a013d()
{
    level endon( #"hash_38f29f9cb03586ea", #"hash_2e4b6b86e99b024b", #"intermission" );
    self.var_18acfe18 = 0;
    var_8ce07a9c = 0;
    var_7350b8a6 = 0;
    
    while ( true )
    {
        s_notify = self.e_damage waittill( #"damage" );
        n_damage = s_notify.amount;
        
        if ( isalive( s_notify.attacker ) && isplayer( s_notify.attacker ) )
        {
            s_notify.attacker util::show_hit_marker();
            
            if ( s_notify.attacker hasperk( #"specialty_mod_awareness" ) )
            {
                n_damage = int( n_damage * 1.1 );
            }
        }
        
        self.var_18acfe18 += n_damage;
        
        if ( self.var_18acfe18 >= self.var_f881e30f )
        {
            /#
                iprintlnbold( "<dev string:x98>" );
            #/
            
            self function_26e02ac9( 0 );
            util::wait_network_frame();
            self.var_6efcc8c1++;
            
            if ( self.var_6efcc8c1 >= 3 )
            {
                var_8ce07a9c = 1;
                var_7350b8a6 = 0;
            }
            
            self clientfield::set( "bs_att_blst_tll", 0 );
            level notify( #"hash_14400d2bff068132" );
            
            if ( !var_7350b8a6 )
            {
                self.var_914750d++;
                self scene::play( self.str_scene, "pain", self );
                level thread function_f74b38da( "zm_power_on_rumble" );
                playsoundatposition( #"hash_6040f3b85932670c", self.origin );
                self.var_e21ca032 = &function_d775bddd;
            }
            
            if ( var_8ce07a9c )
            {
                level notify( #"hash_38f29f9cb03586ea" );
            }
            
            break;
        }
    }
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 0
// Checksum 0x70ce2d57, Offset: 0x7e98
// Size: 0x7c
function function_d775bddd()
{
    if ( !isdefined( self.var_914750d ) )
    {
        self.var_914750d = 0;
    }
    
    if ( self.var_914750d == 2 )
    {
        self function_3d8879d7( "crack" );
        return;
    }
    
    if ( self.var_914750d == 3 )
    {
        self function_3d8879d7( "break" );
    }
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 2
// Checksum 0x796fe52, Offset: 0x7f20
// Size: 0x150
function function_542eeaa7( var_23cac703, var_890ce7a8 = 1 )
{
    level endon( #"hash_38f29f9cb03586ea", #"intermission" );
    self function_26e02ac9( 0 );
    self.var_57badb98 = 0;
    n_attack = 0;
    
    while ( true )
    {
        if ( !( isdefined( self.var_575f3097 ) && self.var_575f3097 ) )
        {
            wait randomfloatrange( 9, 13 );
        }
        
        if ( var_890ce7a8 && !( isdefined( self.var_575f3097 ) && self.var_575f3097 ) )
        {
            self function_671e8d37();
        }
        
        self function_bb28e41d( var_23cac703, n_attack );
        
        if ( n_attack + 1 >= var_23cac703.size )
        {
            n_attack = 0;
        }
        else
        {
            n_attack++;
        }
        
        if ( var_890ce7a8 )
        {
            self function_a8a76e18();
        }
    }
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 1
// Checksum 0xc3aa8d84, Offset: 0x8078
// Size: 0x134
function boss_leave( var_db828ea6 = 0 )
{
    self animation::stop( 0 );
    v_pos = self.origin;
    
    if ( var_db828ea6 )
    {
        playsoundatposition( #"hash_e2ba9305b1dafc9", v_pos );
    }
    else
    {
        playsoundatposition( #"hash_1b108a99d8b8a77e", v_pos );
    }
    
    self thread function_55841cbf( "bs_spn_fx_cf", 0, "bs_bdy_fx_cf", 2, 3, "bs_bdy_dmg_fx_cf", 0 );
    self scene::play( self.str_scene, self.str_depart, self );
    self animation::stop( 0 );
    
    if ( !var_db828ea6 )
    {
        self ghost();
    }
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 1
// Checksum 0x7f599985, Offset: 0x81b8
// Size: 0x1f4
function boss_arrive( var_dc094f99 = 0 )
{
    util::wait_network_frame();
    v_pos = self.origin;
    
    if ( var_dc094f99 )
    {
        playsoundatposition( #"hash_732b71cd63845865", v_pos );
    }
    else
    {
        playsoundatposition( #"hash_241b296b37ac90bf", v_pos );
    }
    
    var_193df069 = undefined;
    var_914750d = undefined;
    
    if ( isdefined( self.var_914750d ) && self.var_914750d > 0 )
    {
        var_193df069 = "bs_bdy_dmg_fx_cf";
        var_914750d = self.var_914750d;
    }
    
    self thread function_55841cbf( "bs_spn_fx_cf", 1, "bs_bdy_fx_cf", 1, 3, var_193df069, var_914750d );
    self clientfield::set( "bs_spn_fx_cf", 1 );
    self util::delay( 0.1, "death", &show_self );
    self scene::play( self.str_scene, self.str_arrive, self );
    self animation::stop( 0 );
    self clientfield::set( "bs_bdy_fx_cf", 1 );
    self thread scene::play( self.str_scene, self.str_idle, self );
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 0
// Checksum 0xb3a2d0e4, Offset: 0x83b8
// Size: 0x1c
function show_self()
{
    self show();
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 7
// Checksum 0x544fd57a, Offset: 0x83e0
// Size: 0xb4
function function_55841cbf( var_2cab862a, var_b5cb2fdb, var_73d99491, var_2f44a2c, n_frames, var_8218310e, var_1f94836c )
{
    self clientfield::set( var_2cab862a, var_b5cb2fdb );
    util::wait_network_frame( n_frames );
    self clientfield::set( var_73d99491, var_2f44a2c );
    
    if ( isdefined( var_8218310e ) && isdefined( var_1f94836c ) )
    {
        self clientfield::set( var_8218310e, var_1f94836c );
    }
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 1
// Checksum 0x358c44fa, Offset: 0x84a0
// Size: 0xa4
function function_a8a76e18( var_dc094f99 = 0 )
{
    self boss_leave();
    
    if ( isdefined( self.var_e21ca032 ) )
    {
        [[ self.var_e21ca032 ]]();
        self.var_e21ca032 = undefined;
    }
    
    self.var_451ab1a6 = 0;
    self.origin = self.var_431d02e5.origin;
    self.angles = self.var_431d02e5.angles;
    self boss_arrive( var_dc094f99 );
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 0
// Checksum 0xd2ba68cf, Offset: 0x8550
// Size: 0x7c
function function_671e8d37()
{
    self boss_leave();
    self.var_451ab1a6 = self.n_path_start;
    self.origin = self.a_s_path[ self.var_451ab1a6 ].origin;
    self.angles = self.a_s_path[ self.var_451ab1a6 ].angles;
    self boss_arrive();
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 2
// Checksum 0x2c74d9c1, Offset: 0x85d8
// Size: 0x210
function boss_move( var_31a7a68f, var_6eabe8dd = 1 )
{
    level endon( #"intermission" );
    
    if ( self.a_s_path.size == 1 )
    {
        return;
    }
    
    if ( self.var_451ab1a6 == var_31a7a68f )
    {
        return;
    }
    
    if ( var_6eabe8dd )
    {
        var_6c1749ec = 3;
    }
    else
    {
        var_6c1749ec = 2;
    }
    
    while ( self.var_451ab1a6 != var_31a7a68f )
    {
        if ( self.var_451ab1a6 > var_31a7a68f )
        {
            for ( i = 1; i <= var_6c1749ec ; i++ )
            {
                if ( self.var_451ab1a6 - i < var_31a7a68f )
                {
                    break;
                }
                
                var_ac191c43 = i * -1;
            }
        }
        else
        {
            for ( i = 1; i <= var_6c1749ec ; i++ )
            {
                if ( self.var_451ab1a6 + i > var_31a7a68f )
                {
                    break;
                }
                
                var_ac191c43 = i;
            }
        }
        
        self boss_leave();
        self.var_451ab1a6 += var_ac191c43;
        self.origin = self.a_s_path[ self.var_451ab1a6 ].origin;
        self.angles = self.a_s_path[ self.var_451ab1a6 ].angles;
        self boss_arrive();
        
        if ( self.var_451ab1a6 != var_31a7a68f )
        {
            if ( !var_6eabe8dd )
            {
                wait randomfloatrange( 0.75, 1.25 );
                continue;
            }
            
            util::wait_network_frame( 4 );
        }
    }
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 2
// Checksum 0x6efa314f, Offset: 0x87f0
// Size: 0xc4
function function_bb28e41d( var_23cac703, n_attack )
{
    level endon( #"intermission" );
    
    if ( isdefined( self.var_575f3097 ) && self.var_575f3097 )
    {
        self.var_575f3097 = 0;
        self function_1acc1d3();
    }
    else
    {
        self [[ var_23cac703[ n_attack ] ]]();
    }
    
    level notify( #"hash_14400d2bff068132" );
    self function_26e02ac9( 0 );
    
    /#
        iprintlnbold( "<dev string:xc4>" );
    #/
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 0
// Checksum 0x36e9b1d, Offset: 0x88c0
// Size: 0x44
function function_371e0929()
{
    level endon( #"intermission" );
    self thread function_ff69c896();
    self function_c7c928e9();
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 0
// Checksum 0x65402f45, Offset: 0x8910
// Size: 0x44
function function_f487ff16()
{
    level endon( #"intermission" );
    self thread function_ff69c896();
    self function_c7c928e9( 1 );
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 0
// Checksum 0x37135803, Offset: 0x8960
// Size: 0x134
function function_ff69c896()
{
    level endon( #"hash_14400d2bff068132", #"intermission" );
    
    /#
        iprintlnbold( "<dev string:xdb>" );
    #/
    
    var_34f21704 = array::random( self.var_48b3f539 );
    self clientfield::set( "bs_att_mst_tell_cf", 1 );
    
    foreach ( var_cbd5f8e3 in var_34f21704 )
    {
        self thread function_47073904( var_cbd5f8e3.origin );
        util::wait_network_frame();
    }
    
    wait 6;
    self clientfield::set( "bs_att_mst_tell_cf", 0 );
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 2
// Checksum 0x4ebcd1f0, Offset: 0x8aa0
// Size: 0x298
function function_47073904( v_loc, n_time = 8 )
{
    level endon( #"intermission" );
    e_target = util::spawn_model( "tag_origin", v_loc );
    util::wait_network_frame();
    e_target clientfield::set( "bs_att_mst_cf", 1 );
    e_target thread function_65bd10f6();
    wait 1;
    n_time_passed = 0;
    
    while ( n_time_passed <= n_time )
    {
        a_players = util::get_active_players();
        a_players = arraysortclosest( a_players, v_loc, undefined, undefined, 128 );
        
        foreach ( player in a_players )
        {
            player thread zm_player::slowdown( #"hash_2cc0dfb628810e41" );
        }
        
        a_ai_zombies = array::get_all_closest( v_loc, getaiarchetypearray( #"zombie" ), undefined, undefined, 128 );
        
        foreach ( ai_zombie in a_ai_zombies )
        {
            if ( !ai_zombie zm_ai_catalyst::function_50a8406d() )
            {
                ai_zombie thread zm_ai_catalyst::function_e5e8cbd2( 0 );
            }
        }
        
        wait 0.1;
        n_time_passed += 0.1;
    }
    
    level notify( #"hash_738991c86bf9f7c2" );
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 0
// Checksum 0x8b5d9b62, Offset: 0x8d40
// Size: 0x8c
function function_65bd10f6()
{
    level waittill( #"hash_38f29f9cb03586ea", #"hash_738991c86bf9f7c2", #"intermission" );
    self clientfield::set( "bs_att_mst_cf", 0 );
    util::wait_network_frame( 4 );
    self delete();
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 3
// Checksum 0xb01d58da, Offset: 0x8dd8
// Size: 0x1c4
function function_c7c928e9( var_a3d1842b = 0, var_6df65756 = 0, var_601f90f8 )
{
    level endon( #"hash_14400d2bff068132", #"intermission" );
    
    /#
        iprintlnbold( "<dev string:xea>" );
    #/
    
    level thread function_7e30d4b5();
    var_b7ba41fc = [];
    
    if ( isdefined( var_601f90f8 ) )
    {
        n_path = var_601f90f8;
    }
    else if ( self.var_e6621b81.size > 0 )
    {
        n_path = self function_5382ba1b( self.var_e6621b81 );
    }
    else
    {
        n_path = randomint( self.var_3c63665.size );
    }
    
    var_b7ba41fc = self.var_3c63665[ n_path ];
    level.e_boss thread function_c48e93c1( n_path );
    var_31a7a68f = var_b7ba41fc[ 0 ].script_int;
    self boss_move( var_31a7a68f );
    
    if ( var_a3d1842b )
    {
        self thread function_3d6eaad5();
    }
    else if ( !var_6df65756 )
    {
        self thread function_bb528a4b();
    }
    
    self function_d07ce2a9( n_path, var_a3d1842b, var_6df65756 );
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 1
// Checksum 0xbb6326d9, Offset: 0x8fa8
// Size: 0x1e6
function function_5382ba1b( a_vols )
{
    a_vols = array::randomize( a_vols );
    var_28f5cd30 = a_vols[ 0 ];
    var_8adde38a = 0;
    
    foreach ( e_vol in a_vols )
    {
        var_f14d7e9d = var_8adde38a;
        var_8adde38a = 0;
        
        foreach ( player in level.activeplayers )
        {
            if ( player istouching( e_vol ) )
            {
                var_8adde38a++;
            }
        }
        
        if ( var_8adde38a > var_f14d7e9d )
        {
            var_28f5cd30 = e_vol;
        }
    }
    
    assert( isdefined( var_28f5cd30.script_int ) );
    var_2370b91b = var_28f5cd30.script_int;
    
    for ( i = 0; i < self.var_3c63665.size ; i++ )
    {
        if ( self.var_3c63665[ i ][ 0 ].script_int == var_2370b91b )
        {
            return i;
        }
    }
    
    return 0;
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 1
// Checksum 0x8706827a, Offset: 0x9198
// Size: 0x260
function function_c48e93c1( n_path )
{
    if ( !isdefined( self.var_ba0b1919 ) )
    {
        return;
    }
    
    var_1e908ff2 = [];
    var_8830daf3 = "bs_att_bm_ai_blck_" + self.var_ba0b1919;
    a_e_blockers = array::sort_by_script_int( getentarray( var_8830daf3, "script_blocker" ), 1 );
    
    foreach ( e_blocker in a_e_blockers )
    {
        if ( e_blocker.script_int == n_path )
        {
            if ( !isdefined( var_1e908ff2 ) )
            {
                var_1e908ff2 = [];
            }
            else if ( !isarray( var_1e908ff2 ) )
            {
                var_1e908ff2 = array( var_1e908ff2 );
            }
            
            var_1e908ff2[ var_1e908ff2.size ] = e_blocker;
            e_blocker solid();
            e_blocker show();
            e_blocker disconnectpaths();
        }
    }
    
    level waittill( #"hash_38f29f9cb03586ea", #"hash_ba0b98df6573d80", #"intermission" );
    
    if ( isdefined( var_1e908ff2 ) )
    {
        foreach ( e_blocker in var_1e908ff2 )
        {
            e_blocker notsolid();
            e_blocker hide();
            e_blocker connectpaths();
        }
    }
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 0
// Checksum 0x55532296, Offset: 0x9400
// Size: 0xe4
function function_7e30d4b5()
{
    level waittill( #"hash_38f29f9cb03586ea", #"hash_14400d2bff068132", #"hash_ba0b98df6573d80", #"intermission" );
    level.e_boss function_26e02ac9( 0 );
    level.e_boss clientfield::set( "bs_att_bm_tell_fx_cf", 0 );
    level.e_boss clientfield::set( "bs_att_bm_cf", 0 );
    level.e_boss clientfield::set( "bs_att_mst_tell_cf", 0 );
    level.e_boss notify( #"hash_2bb8be6b846aed93" );
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 2
// Checksum 0xab1b07fd, Offset: 0x94f0
// Size: 0x10a
function function_3413fdf9( v_loc, n_time )
{
    level endon( #"hash_14400d2bff068132", #"intermission" );
    
    if ( !isdefined( level.var_90bda347 ) )
    {
        level.var_90bda347 = util::spawn_model( "tag_origin", v_loc );
        util::wait_network_frame( 4 );
        level.var_90bda347 clientfield::set( "bs_att_bm_targ_ini_cf", 1 );
        util::wait_network_frame( 4 );
    }
    
    if ( isdefined( n_time ) )
    {
        level.var_90bda347 moveto( v_loc, n_time );
        wait n_time;
        return;
    }
    
    level.var_90bda347.origin = v_loc;
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 3
// Checksum 0x8dc02cc4, Offset: 0x9608
// Size: 0x3b0
function function_d07ce2a9( n_path_id, var_a3d1842b, var_6df65756 )
{
    level endon( #"hash_14400d2bff068132", #"intermission" );
    assert( isdefined( self.var_3c63665 ) );
    v_loc = self.var_3c63665[ n_path_id ][ 0 ].origin;
    var_5b84ed9a = self gettagorigin( "tag_fx_beam" );
    var_23ee4083 = vectortoangles( v_loc - self.origin );
    v_forward = anglestoforward( var_23ee4083 );
    a_trace = beamtrace( var_5b84ed9a, var_5b84ed9a + v_forward * 20000, 0, self, 1, 1 );
    var_dd6e9876 = a_trace[ #"position" ];
    level function_3413fdf9( var_dd6e9876 );
    self thread scene::play( self.str_scene, "charge", self );
    self clientfield::set( "bs_att_bm_cf", 1 );
    wait 1;
    self clientfield::set( "bs_att_bm_tell_cf", 1 );
    wait 0.4;
    self clientfield::set( "bs_att_bm_tell_fx_cf", 1 );
    wait 0.1;
    self clientfield::set( "bs_att_bm_tell_cf", 2 );
    self playsound( #"hash_2af120dbf3e870e8" );
    self function_26e02ac9( 1 );
    
    if ( !var_a3d1842b && randomint( 100 ) > 30 )
    {
        function_abbfbdff( array( level.var_d748689e, level.var_99d2b056 ) );
    }
    
    /#
        self thread persistentdebugline( var_5b84ed9a, level.var_90bda347 );
        render_debug_sphere( var_5b84ed9a, ( 1, 1, 0 ) );
        render_debug_sphere( var_dd6e9876, ( 1, 0, 0 ) );
    #/
    
    if ( var_a3d1842b )
    {
        self thread function_9520ea39( 1 );
    }
    else if ( var_6df65756 )
    {
        self thread function_9520ea39( 0, 1 );
    }
    else
    {
        self thread function_9520ea39( 0 );
    }
    
    self function_f142f73c( n_path_id, var_a3d1842b, var_6df65756 );
    level notify( #"hash_ba0b98df6573d80" );
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 3
// Checksum 0x7ccc5fc, Offset: 0x99c0
// Size: 0x2be
function function_f142f73c( var_1ee74d52, var_a3d1842b, var_6df65756 )
{
    level endon( #"hash_14400d2bff068132", #"intermission" );
    var_b68dd8d0 = [];
    var_a50ac7ec = 0;
    a_path = arraycopy( self.var_3c63665[ var_1ee74d52 ] );
    var_d9ad5cc8 = a_path[ 0 ];
    
    while ( isdefined( var_d9ad5cc8.linkto ) )
    {
        var_cd22b387 = var_d9ad5cc8.origin;
        var_d9ad5cc8 = struct::get( var_d9ad5cc8.linkto, "linkname" );
        n_dist = distance( var_d9ad5cc8.origin, var_cd22b387 );
        var_a50ac7ec += n_dist;
        
        if ( !isdefined( var_b68dd8d0 ) )
        {
            var_b68dd8d0 = [];
        }
        else if ( !isarray( var_b68dd8d0 ) )
        {
            var_b68dd8d0 = array( var_b68dd8d0 );
        }
        
        var_b68dd8d0[ var_b68dd8d0.size ] = n_dist;
    }
    
    a_n_times = [];
    
    if ( var_6df65756 )
    {
        n_total_time = 2;
    }
    else if ( var_a3d1842b )
    {
        n_total_time = 7.5;
    }
    else
    {
        n_total_time = 9;
    }
    
    for ( i = 0; i < var_b68dd8d0.size ; i++ )
    {
        n_time = n_total_time * var_b68dd8d0[ i ] / var_a50ac7ec;
        
        if ( !isdefined( a_n_times ) )
        {
            a_n_times = [];
        }
        else if ( !isarray( a_n_times ) )
        {
            a_n_times = array( a_n_times );
        }
        
        a_n_times[ a_n_times.size ] = n_time;
    }
    
    for ( i = 1; i < a_path.size ; i++ )
    {
        level function_3413fdf9( a_path[ i ].origin, a_n_times[ i - 1 ] );
    }
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 2
// Checksum 0xc6e32a78, Offset: 0x9c88
// Size: 0xdb0
function function_9520ea39( var_a3d1842b, var_6df65756 = 0 )
{
    level endon( #"hash_14400d2bff068132", #"intermission" );
    self endon( #"hash_2bb8be6b846aed93" );
    
    while ( true )
    {
        v_source = self gettagorigin( "tag_fx_beam" );
        v_target = level.var_90bda347.origin;
        a_beamtrace = beamtrace( v_source, v_target, 0, self, 1, 1 );
        var_f94546ed = distance( v_source, a_beamtrace[ #"position" ] );
        var_78d7b8bf = var_f94546ed * var_f94546ed;
        a_players = array::get_all_closest( v_source, level.players, undefined, undefined, var_f94546ed );
        
        if ( a_players.size <= 0 )
        {
            foreach ( player in level.players )
            {
                player notify( #"hash_27a44c71de4b4cb8" );
                player.var_39ef0b7f = 0;
            }
            
            util::wait_network_frame();
            continue;
        }
        
        var_fc0acaf1 = [];
        
        if ( !isdefined( var_fc0acaf1 ) )
        {
            var_fc0acaf1 = [];
        }
        else if ( !isarray( var_fc0acaf1 ) )
        {
            var_fc0acaf1 = array( var_fc0acaf1 );
        }
        
        var_fc0acaf1[ var_fc0acaf1.size ] = "j_helmet";
        
        if ( !isdefined( var_fc0acaf1 ) )
        {
            var_fc0acaf1 = [];
        }
        else if ( !isarray( var_fc0acaf1 ) )
        {
            var_fc0acaf1 = array( var_fc0acaf1 );
        }
        
        var_fc0acaf1[ var_fc0acaf1.size ] = "j_head";
        
        if ( !isdefined( var_fc0acaf1 ) )
        {
            var_fc0acaf1 = [];
        }
        else if ( !isarray( var_fc0acaf1 ) )
        {
            var_fc0acaf1 = array( var_fc0acaf1 );
        }
        
        var_fc0acaf1[ var_fc0acaf1.size ] = "j_neck";
        
        if ( !isdefined( var_fc0acaf1 ) )
        {
            var_fc0acaf1 = [];
        }
        else if ( !isarray( var_fc0acaf1 ) )
        {
            var_fc0acaf1 = array( var_fc0acaf1 );
        }
        
        var_fc0acaf1[ var_fc0acaf1.size ] = "j_spine_upper";
        
        if ( !isdefined( var_fc0acaf1 ) )
        {
            var_fc0acaf1 = [];
        }
        else if ( !isarray( var_fc0acaf1 ) )
        {
            var_fc0acaf1 = array( var_fc0acaf1 );
        }
        
        var_fc0acaf1[ var_fc0acaf1.size ] = "j_spine_lower";
        
        if ( !isdefined( var_fc0acaf1 ) )
        {
            var_fc0acaf1 = [];
        }
        else if ( !isarray( var_fc0acaf1 ) )
        {
            var_fc0acaf1 = array( var_fc0acaf1 );
        }
        
        var_fc0acaf1[ var_fc0acaf1.size ] = "j_shoulder_le";
        
        if ( !isdefined( var_fc0acaf1 ) )
        {
            var_fc0acaf1 = [];
        }
        else if ( !isarray( var_fc0acaf1 ) )
        {
            var_fc0acaf1 = array( var_fc0acaf1 );
        }
        
        var_fc0acaf1[ var_fc0acaf1.size ] = "j_shoulder_ri";
        
        if ( !isdefined( var_fc0acaf1 ) )
        {
            var_fc0acaf1 = [];
        }
        else if ( !isarray( var_fc0acaf1 ) )
        {
            var_fc0acaf1 = array( var_fc0acaf1 );
        }
        
        var_fc0acaf1[ var_fc0acaf1.size ] = "j_spine4";
        
        if ( !isdefined( var_fc0acaf1 ) )
        {
            var_fc0acaf1 = [];
        }
        else if ( !isarray( var_fc0acaf1 ) )
        {
            var_fc0acaf1 = array( var_fc0acaf1 );
        }
        
        var_fc0acaf1[ var_fc0acaf1.size ] = "tag_aim";
        
        if ( !isdefined( var_fc0acaf1 ) )
        {
            var_fc0acaf1 = [];
        }
        else if ( !isarray( var_fc0acaf1 ) )
        {
            var_fc0acaf1 = array( var_fc0acaf1 );
        }
        
        var_fc0acaf1[ var_fc0acaf1.size ] = "j_elbow_le";
        
        if ( !isdefined( var_fc0acaf1 ) )
        {
            var_fc0acaf1 = [];
        }
        else if ( !isarray( var_fc0acaf1 ) )
        {
            var_fc0acaf1 = array( var_fc0acaf1 );
        }
        
        var_fc0acaf1[ var_fc0acaf1.size ] = "j_elbow_ri";
        
        if ( !isdefined( var_fc0acaf1 ) )
        {
            var_fc0acaf1 = [];
        }
        else if ( !isarray( var_fc0acaf1 ) )
        {
            var_fc0acaf1 = array( var_fc0acaf1 );
        }
        
        var_fc0acaf1[ var_fc0acaf1.size ] = "j_wrist_le";
        
        if ( !isdefined( var_fc0acaf1 ) )
        {
            var_fc0acaf1 = [];
        }
        else if ( !isarray( var_fc0acaf1 ) )
        {
            var_fc0acaf1 = array( var_fc0acaf1 );
        }
        
        var_fc0acaf1[ var_fc0acaf1.size ] = "j_wrist_ri";
        
        if ( !isdefined( var_fc0acaf1 ) )
        {
            var_fc0acaf1 = [];
        }
        else if ( !isarray( var_fc0acaf1 ) )
        {
            var_fc0acaf1 = array( var_fc0acaf1 );
        }
        
        var_fc0acaf1[ var_fc0acaf1.size ] = "j_hiptwist_le";
        
        if ( !isdefined( var_fc0acaf1 ) )
        {
            var_fc0acaf1 = [];
        }
        else if ( !isarray( var_fc0acaf1 ) )
        {
            var_fc0acaf1 = array( var_fc0acaf1 );
        }
        
        var_fc0acaf1[ var_fc0acaf1.size ] = "j_hiptwist_ri";
        
        if ( !isdefined( var_fc0acaf1 ) )
        {
            var_fc0acaf1 = [];
        }
        else if ( !isarray( var_fc0acaf1 ) )
        {
            var_fc0acaf1 = array( var_fc0acaf1 );
        }
        
        var_fc0acaf1[ var_fc0acaf1.size ] = "j_knee_bulge_le";
        
        if ( !isdefined( var_fc0acaf1 ) )
        {
            var_fc0acaf1 = [];
        }
        else if ( !isarray( var_fc0acaf1 ) )
        {
            var_fc0acaf1 = array( var_fc0acaf1 );
        }
        
        var_fc0acaf1[ var_fc0acaf1.size ] = "j_knee_bulge_ri";
        
        if ( !isdefined( var_fc0acaf1 ) )
        {
            var_fc0acaf1 = [];
        }
        else if ( !isarray( var_fc0acaf1 ) )
        {
            var_fc0acaf1 = array( var_fc0acaf1 );
        }
        
        var_fc0acaf1[ var_fc0acaf1.size ] = "j_ankle_le";
        
        if ( !isdefined( var_fc0acaf1 ) )
        {
            var_fc0acaf1 = [];
        }
        else if ( !isarray( var_fc0acaf1 ) )
        {
            var_fc0acaf1 = array( var_fc0acaf1 );
        }
        
        var_fc0acaf1[ var_fc0acaf1.size ] = "j_ankle_ri";
        
        if ( !isdefined( var_fc0acaf1 ) )
        {
            var_fc0acaf1 = [];
        }
        else if ( !isarray( var_fc0acaf1 ) )
        {
            var_fc0acaf1 = array( var_fc0acaf1 );
        }
        
        var_fc0acaf1[ var_fc0acaf1.size ] = "j_ball_le";
        
        if ( !isdefined( var_fc0acaf1 ) )
        {
            var_fc0acaf1 = [];
        }
        else if ( !isarray( var_fc0acaf1 ) )
        {
            var_fc0acaf1 = array( var_fc0acaf1 );
        }
        
        var_fc0acaf1[ var_fc0acaf1.size ] = "j_ball_ri";
        var_aaa5649f = [];
        
        foreach ( player in a_players )
        {
            if ( zm_utility::is_player_valid( player ) && !player issliding() )
            {
                var_7cb315bb = player getcentroid();
                v_player_origin = player getorigin();
                var_67b0f6b1 = distancesquared( v_source, var_7cb315bb );
                var_cf64e11c = distancesquared( v_source, v_player_origin );
                var_3c71dedb = pointonsegmentnearesttopoint( v_source, v_target, var_7cb315bb );
                var_c526df5a = pointonsegmentnearesttopoint( v_source, v_target, v_player_origin );
                b_is_valid_target = 0;
                
                if ( distancesquared( var_7cb315bb, var_3c71dedb ) <= 324 || distancesquared( v_player_origin, var_c526df5a ) <= 324 )
                {
                    b_is_valid_target = 1;
                }
                else
                {
                    foreach ( str_tag in var_fc0acaf1 )
                    {
                        v_hitloc = player gettagorigin( str_tag );
                        
                        if ( isdefined( v_hitloc ) )
                        {
                            var_4d9e2def = pointonsegmentnearesttopoint( v_source, v_target, v_hitloc );
                            temp_dist = distancesquared( v_hitloc, var_4d9e2def );
                            
                            if ( distancesquared( v_hitloc, var_4d9e2def ) <= 324 )
                            {
                                b_is_valid_target = 1;
                                break;
                            }
                        }
                    }
                }
            }
            
            if ( isdefined( b_is_valid_target ) && b_is_valid_target )
            {
                if ( !isdefined( var_aaa5649f ) )
                {
                    var_aaa5649f = [];
                }
                else if ( !isarray( var_aaa5649f ) )
                {
                    var_aaa5649f = array( var_aaa5649f );
                }
                
                var_aaa5649f[ var_aaa5649f.size ] = player;
            }
        }
        
        if ( var_aaa5649f.size > 0 )
        {
            foreach ( player in var_aaa5649f )
            {
                if ( !zm_utility::is_player_valid( player ) )
                {
                    continue;
                }
                
                if ( isdefined( player ) )
                {
                    if ( var_6df65756 )
                    {
                        if ( !( isdefined( player.var_13e995b6 ) && player.var_13e995b6 ) )
                        {
                            player thread function_d8d597c();
                        }
                        
                        util::wait_network_frame();
                        continue;
                    }
                    
                    if ( !( isdefined( player.var_39ef0b7f ) && player.var_39ef0b7f ) )
                    {
                        player.var_39ef0b7f = 1;
                        player thread function_583f7d85( var_a3d1842b );
                    }
                    
                    player thread function_c542a237();
                }
            }
        }
        
        util::wait_network_frame();
    }
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 0
// Checksum 0x686b22c3, Offset: 0xaa40
// Size: 0x76
function function_d8d597c()
{
    self endon( #"entering_last_stand", #"disconnect", #"death" );
    self.var_13e995b6 = 1;
    self dodamage( 25, self.origin );
    wait 2.5;
    self.var_13e995b6 = 0;
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 0
// Checksum 0xf074d170, Offset: 0xaac0
// Size: 0x6e
function function_c542a237()
{
    self notify( "68b77673d8cf61f6" );
    self endon( "68b77673d8cf61f6" );
    wait 0.3;
    
    if ( isdefined( self ) )
    {
        self.var_39ef0b7f = 0;
        self clientfield::set( "bs_att_bm_targ_hit_cf", 0 );
        self notify( #"hash_27a44c71de4b4cb8" );
    }
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 1
// Checksum 0x9106091d, Offset: 0xab38
// Size: 0x278
function function_583f7d85( var_a3d1842b )
{
    level endon( #"hash_14400d2bff068132", #"intermission" );
    self endon( #"hash_27a44c71de4b4cb8", #"disconnect" );
    n_counter = 0;
    
    if ( var_a3d1842b )
    {
        n_wait = 0.2;
    }
    else
    {
        n_wait = 0.3;
    }
    
    while ( !( isdefined( self.var_49c233e ) && self.var_49c233e ) && self.var_39ef0b7f && zm_utility::is_player_valid( self ) )
    {
        if ( n_counter == 0 && !( isdefined( self.var_f6adf684 ) && self.var_f6adf684 ) )
        {
            self thread function_c010c5f2();
            self dodamage( 25, self.origin );
            self clientfield::set( "bs_att_bm_targ_hit_cf", 1 );
        }
        else
        {
            self dodamage( 10, self.origin );
            self clientfield::set( "bs_att_bm_targ_hit_cf", 1 );
        }
        
        if ( n_counter < 4 )
        {
            if ( var_a3d1842b )
            {
                self thread zm_player::slowdown( #"hash_2a290908eb355917", 1 - n_wait );
            }
            else
            {
                self thread zm_player::slowdown( #"hash_532f7f688c86c9b1", 1 - n_wait );
            }
            
            wait n_wait;
            n_wait /= 2;
            n_counter++;
            continue;
        }
        
        if ( !( isdefined( self.var_49c233e ) && self.var_49c233e ) )
        {
            self.var_49c233e = 1;
            self thread function_844b44a2();
            return;
        }
        
        wait n_wait;
    }
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 0
// Checksum 0xfeb5e963, Offset: 0xadb8
// Size: 0x6a
function function_c010c5f2()
{
    level endon( #"intermission" );
    self notify( "134819d3c344ebdd" );
    self endon( "134819d3c344ebdd" );
    self endon( #"disconnect" );
    self.var_f6adf684 = 1;
    wait 2;
    self.var_f6adf684 = 0;
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 0
// Checksum 0x7092ddb2, Offset: 0xae30
// Size: 0x194
function function_844b44a2()
{
    level endon( #"intermission" );
    self notify( "24a2fa7fb84676f3" );
    self endon( "24a2fa7fb84676f3" );
    self endon( #"disconnect" );
    self thread function_70123a1a();
    self thread zm_player::slowdown( #"hash_7d336706f2aeadab" );
    self clientfield::set( "bs_att_bm_targ_hit_cf", 0 );
    self clientfield::set_to_player( "bs_att_bm_targ_frz_fx_cf", 1 );
    self allowjump( 0 );
    self util::delay( 0.5, "death", &function_abbfbdff, level.var_2404b2a5 );
    self waittill( #"entering_last_stand", #"hash_14ed4d12ee0b5984" );
    self thread zm_player::slowdown( #"hash_7d336706f2aeadab", 1 );
    self clientfield::set_to_player( "bs_att_bm_targ_frz_fx_cf", 0 );
    self allowjump( 1 );
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 0
// Checksum 0x5e7f23b, Offset: 0xafd0
// Size: 0xaa
function function_70123a1a()
{
    level endon( #"intermission" );
    self notify( "7aed1f0026cbe559" );
    self endon( "7aed1f0026cbe559" );
    self endon( #"disconnect", #"entering_last_stand" );
    s_result = self waittill( #"weapon_melee", #"weapon_melee_power" );
    self notify( #"hash_14ed4d12ee0b5984" );
    self.var_49c233e = 0;
}

/#

    // Namespace zodt8_eye/zm_zodt8_eye
    // Params 2
    // Checksum 0xf38200e2, Offset: 0xb088
    // Size: 0x4c, Type: dev
    function render_debug_sphere( origin, color )
    {
        sphere( origin, 2, color, 0.75, 1, 10, 100 );
    }

    // Namespace zodt8_eye/zm_zodt8_eye
    // Params 2
    // Checksum 0x3472570e, Offset: 0xb0e0
    // Size: 0xb0, Type: dev
    function persistentdebugline( start, end )
    {
        level endon( #"hash_14400d2bff068132", #"newdebugline" );
        self endon( #"hash_27a44c71de4b4cb8" );
        level notify( #"newdebugline" );
        
        for ( ;; )
        {
            line( start, end.origin, ( 0.3, 1, 0 ), 1 );
            util::wait_network_frame();
        }
    }

#/

// Namespace zodt8_eye/zm_zodt8_eye
// Params 0
// Checksum 0xb1c2d9bd, Offset: 0xb198
// Size: 0x578
function function_1acc1d3()
{
    level endon( #"hash_14400d2bff068132", #"intermission" );
    n_time_started = gettime() / 1000;
    n_time_elapsed = 0;
    var_75c193e4 = 0;
    var_2d4cbeee = 0;
    var_b29f9af = 0;
    var_a74ef896 = 0;
    var_6b67821f = 0;
    var_b973dc14 = 0;
    
    /#
        iprintlnbold( "<dev string:xf9>" );
    #/
    
    level thread function_bacc07e2();
    self function_a8a76e18();
    self thread function_ae4a013d();
    self function_26e02ac9( 1 );
    self clientfield::set( "bs_att_blst_tll", 1 );
    self thread function_e3f1b159();
    self playsound( "zmb_eyeball_swrath_charge" );
    self thread scene::play( self.str_scene, "charge_blast", self );
    
    while ( n_time_elapsed < 15 )
    {
        n_time_current = gettime() / 1000;
        n_time_elapsed = n_time_current - n_time_started;
        util::wait_network_frame();
        n_time_left = 15 - n_time_elapsed;
        
        if ( !var_75c193e4 && n_time_left <= 12 )
        {
            var_75c193e4 = 1;
            
            /#
                iprintlnbold( "<dev string:x109>" );
            #/
            
            continue;
        }
        
        if ( !var_2d4cbeee && n_time_left <= 10 )
        {
            var_2d4cbeee = 1;
            
            /#
                iprintlnbold( "<dev string:x127>" );
            #/
            
            function_abbfbdff( level.var_c7daa370 );
            continue;
        }
        
        if ( !var_b29f9af && n_time_left <= 5 )
        {
            var_b29f9af = 1;
            
            /#
                iprintlnbold( "<dev string:x145>" );
            #/
            
            continue;
        }
        
        if ( !var_a74ef896 && n_time_left <= 3 )
        {
            var_a74ef896 = 1;
            
            /#
                iprintlnbold( "<dev string:x162>" );
            #/
            
            continue;
        }
        
        if ( !var_6b67821f && n_time_left <= 2 )
        {
            var_6b67821f = 1;
            
            /#
                iprintlnbold( "<dev string:x17f>" );
            #/
            
            continue;
        }
        
        if ( !var_b973dc14 && n_time_left <= 1 )
        {
            var_b973dc14 = 1;
            
            /#
                iprintlnbold( "<dev string:x19c>" );
            #/
        }
    }
    
    self clientfield::set( "bs_att_blst", 1 );
    level thread lui::screen_flash( 0.1, 0.3, 0.7, 0.5, "white" );
    self playsound( "zmb_eyeball_swrath_burst" );
    var_3f0f05e = 0;
    a_players = array::randomize( level.activeplayers );
    
    foreach ( player in a_players )
    {
        if ( !( isdefined( player.hasriotshieldequipped ) && player.hasriotshieldequipped ) )
        {
            player dodamage( player.health + 666, player.origin );
            continue;
        }
        
        if ( !var_3f0f05e )
        {
            if ( isdefined( player ) )
            {
                player function_abbfbdff( level.var_ad9b527b );
                var_3f0f05e = 1;
            }
        }
    }
    
    level notify( #"hash_2e4b6b86e99b024b" );
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 0
// Checksum 0xcb8091af, Offset: 0xb718
// Size: 0x174
function function_bacc07e2()
{
    level endon( #"intermission" );
    level.e_boss endon( #"death" );
    level waittill( #"hash_38f29f9cb03586ea", #"hash_14400d2bff068132", #"hash_2e4b6b86e99b024b" );
    level.e_boss clientfield::set( "bs_att_blst_tll", 0 );
    exploder::exploder_stop( "fxexp_be_f_ovf_b" );
    exploder::exploder_stop( "fxexp_be_f_a" );
    exploder::exploder_stop( "fxexp_be_f_b" );
    exploder::exploder_stop( "fxexp_be_f_c" );
    level.e_boss function_26e02ac9( 0 );
    level.e_boss animation::stop( 0 );
    level.e_boss stopsound( "zmb_eyeball_swrath_charge" );
    wait 1;
    level.e_boss clientfield::set( "bs_att_blst", 0 );
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 0
// Checksum 0x12df16c9, Offset: 0xb898
// Size: 0xec
function function_e3f1b159()
{
    level endon( #"hash_38f29f9cb03586ea", #"hash_14400d2bff068132", #"hash_2e4b6b86e99b024b", #"intermission" );
    level.e_boss endon( #"death" );
    wait 4;
    exploder::exploder( "fxexp_be_f_ovf_b" );
    wait 0.5;
    exploder::exploder( "fxexp_be_f_a" );
    wait 0.5;
    exploder::exploder( "fxexp_be_f_b" );
    wait 0.5;
    exploder::exploder( "fxexp_be_f_c" );
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 0
// Checksum 0x11db00a3, Offset: 0xb990
// Size: 0xf8
function function_2b6b4a44()
{
    level endon( #"hash_38f29f9cb03586ea", #"spawn_zombies", #"intermission" );
    
    while ( true )
    {
        level notify( #"hash_6986218d09dc1cb2" );
        util::wait_network_frame( randomintrange( 1, 3 ) );
        level function_e2f134ce();
        level notify( #"hash_6b642d0b24b9ee12" );
        util::wait_network_frame( randomintrange( 1, 3 ) );
        level function_e2f134ce();
    }
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 0
// Checksum 0x55a04f37, Offset: 0xba90
// Size: 0x24
function function_e2f134ce()
{
    level flag::wait_till_clear( #"hash_21921ed511559aa3" );
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 1
// Checksum 0x37232588, Offset: 0xbac0
// Size: 0x5d8
function function_de60e752( var_533ac894 )
{
    level endon( #"hash_38f29f9cb03586ea", #"spawn_zombies", #"intermission" );
    n_round = level.var_d6f059f7;
    
    switch ( level.var_f3c4bd00 )
    {
        case 1:
            var_d166a3c6 = 1;
            var_6d55be0e = 1.5;
            break;
        case 2:
            var_d166a3c6 = 2;
            var_6d55be0e = 1;
            break;
        case 3:
            var_d166a3c6 = 5;
            var_6d55be0e = 0.5;
            break;
        case 4:
            var_d166a3c6 = 9;
            var_6d55be0e = 0.1;
            break;
    }
    
    n_max_active_ai = 16 + var_d166a3c6;
    level.var_9eaf1031 = 0;
    level.var_83c0592c = 0;
    level thread function_f5b2d086();
    a_players = util::get_active_players();
    
    if ( a_players.size > 0 )
    {
        s_zone = a_players[ 0 ] zm_utility::get_current_zone( 1 );
    }
    
    if ( !isdefined( s_zone ) )
    {
        s_zone = level.zones[ #"zone_poop_deck" ];
    }
    
    a_s_spawnpoints = struct::get_array( s_zone.name + "_spawns" );
    a_s_spawnpoints = arraycombine( a_s_spawnpoints, struct::get_array( s_zone.name + "_spawner" ), 0, 0 );
    var_e6217dda = getarraykeys( s_zone.adjacent_zones );
    
    foreach ( str_zone in var_e6217dda )
    {
        if ( isdefined( s_zone.adjacent_zones[ str_zone ] ) && s_zone.adjacent_zones[ str_zone ].is_connected )
        {
            a_s_spawnpoints = arraycombine( a_s_spawnpoints, struct::get_array( str_zone + "_spawns" ), 0, 0 );
            a_s_spawnpoints = arraycombine( a_s_spawnpoints, struct::get_array( str_zone + "_spawner" ), 0, 0 );
        }
    }
    
    if ( isdefined( var_533ac894 ) )
    {
        foreach ( str_zone in var_533ac894 )
        {
            a_s_spawnpoints = arraycombine( a_s_spawnpoints, struct::get_array( str_zone + "_spawns" ), 0, 0 );
            a_s_spawnpoints = arraycombine( a_s_spawnpoints, struct::get_array( str_zone + "_spawner" ), 0, 0 );
        }
    }
    
    a_s_spawnpoints = array::filter( a_s_spawnpoints, 0, &function_62b1d725 );
    var_c5cc6b59 = array::randomize( a_s_spawnpoints );
    n_index = 0;
    
    while ( true )
    {
        while ( getaiteamarray( level.zombie_team ).size >= n_max_active_ai )
        {
            util::wait_network_frame();
        }
        
        spawner = array::random( level.zombie_spawners );
        s_spawnpoint = var_c5cc6b59[ n_index ];
        
        if ( n_index + 1 >= var_c5cc6b59.size )
        {
            n_index = 0;
        }
        else
        {
            n_index++;
        }
        
        var_b2a4b538 = level.var_83c0592c;
        level waittill( #"hash_6986218d09dc1cb2" );
        e_zombie = zombie_utility::spawn_zombie( spawner, spawner.targetname, s_spawnpoint, n_round );
        
        if ( isdefined( e_zombie ) )
        {
            level.var_83c0592c++;
        }
        
        wait var_6d55be0e;
    }
    
    level notify( #"hash_71fd67248b9a37ca" );
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 1
// Checksum 0x43727eef, Offset: 0xc0a0
// Size: 0x68
function function_e9b8eaff( e_attacker )
{
    if ( self.archetype !== #"zombie" )
    {
        return;
    }
    
    if ( !isplayer( e_attacker ) )
    {
        return;
    }
    
    if ( isdefined( self.var_69a981e6 ) && self.var_69a981e6 )
    {
        return;
    }
    
    level.var_9eaf1031++;
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 1
// Checksum 0xd61cb07e, Offset: 0xc110
// Size: 0xe4, Type: bool
function function_62b1d725( s_loc )
{
    if ( !isdefined( s_loc.script_noteworthy ) )
    {
        return false;
    }
    
    if ( s_loc.script_noteworthy === "spawn_location" )
    {
        return true;
    }
    
    a_str_tokens = strtok( s_loc.script_noteworthy, " " );
    
    foreach ( str_token in a_str_tokens )
    {
        if ( str_token == "custom_spawner_entry" )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 0
// Checksum 0xc4aa43c0, Offset: 0xc200
// Size: 0x14e
function boss_cleanup_zombie()
{
    level endon( #"intermission" );
    a_ai_zombies = getaiarchetypearray( #"zombie", level.zombie_team );
    
    foreach ( ai in a_ai_zombies )
    {
        if ( !isalive( ai ) || zm_utility::is_magic_bullet_shield_enabled( ai ) || isdefined( ai.var_69a981e6 ) && ai.var_69a981e6 )
        {
            util::wait_network_frame();
            continue;
        }
        
        ai kill();
        ai hide();
        level.var_83c0592c--;
        return;
    }
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 0
// Checksum 0xd23c5577, Offset: 0xc358
// Size: 0x1bc
function function_f5b2d086()
{
    level endon( #"hash_38f29f9cb03586ea", #"spawn_zombies", #"hash_71fd67248b9a37ca", #"intermission" );
    wait 6;
    var_e8ebec1d = array( #"hash_7c89b1397a38e3ad", #"hash_7c89ae397a38de94", #"hash_7c89af397a38e047", #"hash_7c89ac397a38db2e" );
    level.var_8a64ef3a = 0;
    var_ffd2fe87 = 4 + level.var_f3c4bd00;
    
    while ( true )
    {
        if ( getaiteamarray( level.zombie_team ).size > 0 && level.var_8a64ef3a / getaiteamarray( level.zombie_team ).size * 100 < var_ffd2fe87 )
        {
            var_6c463143 = 1;
        }
        else
        {
            var_6c463143 = 0;
        }
        
        var_c0958d26 = array::random( var_e8ebec1d );
        
        if ( var_6c463143 && !zm_transform::function_abf1dcb4( var_c0958d26 ) )
        {
            zm_transform::function_bdd8aba6( var_c0958d26 );
            level.var_9eaf1031--;
        }
        
        wait 2;
    }
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 1
// Checksum 0xa89f95b0, Offset: 0xc520
// Size: 0x74
function function_724b3e30( n_health )
{
    level endon( #"hash_38f29f9cb03586ea", #"spawn_zombies", #"intermission" );
    self.b_ignore_cleanup = 1;
    level.var_8a64ef3a++;
    level thread function_83ad8f65( self );
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 1
// Checksum 0xebecee05, Offset: 0xc5a0
// Size: 0x78
function function_83ad8f65( ai )
{
    level endon( #"hash_38f29f9cb03586ea", #"spawn_zombies", #"intermission" );
    ai waittill( #"death" );
    
    if ( isdefined( level.var_8a64ef3a ) )
    {
        level.var_8a64ef3a--;
    }
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 3
// Checksum 0x5bddb28a, Offset: 0xc620
// Size: 0x7dc
function function_f6e1e56f( var_238eb6ec, var_b5a033fe = 0, var_533ac894 )
{
    level endon( #"hash_38f29f9cb03586ea", #"spawn_zombies", #"intermission" );
    n_round = level.var_d6f059f7;
    var_5b839378 = 0;
    var_c6e6a75d = 0;
    a_stokers = [];
    
    switch ( level.var_f3c4bd00 )
    {
        case 1:
            var_c9221a0f = 10;
            var_b68a90de = 12;
            var_dda23e4b = 0.5;
            break;
        case 2:
            var_c9221a0f = 8;
            var_b68a90de = 10;
            var_dda23e4b = 0.4;
            break;
        case 3:
            var_c9221a0f = 6;
            var_b68a90de = 8;
            var_dda23e4b = 0.35;
            break;
        case 4:
            var_c9221a0f = 4;
            var_b68a90de = 6;
            var_dda23e4b = 0.3;
            break;
    }
    
    var_5dc704a7 = int( ceil( var_238eb6ec + var_238eb6ec * var_dda23e4b ) );
    var_1e8caeb1 = var_5dc704a7;
    n_max_active_ai = 16 + level.var_f3c4bd00;
    var_36f58c64 = level.var_f3c4bd00 + 1;
    ai_stoker = undefined;
    a_players = util::get_active_players();
    
    if ( a_players.size > 0 )
    {
        s_zone = a_players[ 0 ] zm_utility::get_current_zone( 1 );
    }
    
    if ( !isdefined( s_zone ) )
    {
        s_zone = level.zones[ #"zone_poop_deck" ];
    }
    
    var_bb492495 = struct::get_array( s_zone.name + "_spawns" );
    var_bb492495 = arraycombine( var_bb492495, struct::get_array( s_zone.name + "_spawner" ), 0, 0 );
    var_e6217dda = getarraykeys( s_zone.adjacent_zones );
    
    foreach ( str_zone in var_e6217dda )
    {
        if ( isdefined( s_zone.adjacent_zones[ str_zone ] ) && s_zone.adjacent_zones[ str_zone ].is_connected )
        {
            var_bb492495 = arraycombine( var_bb492495, struct::get_array( str_zone + "_spawns" ), 0, 0 );
            var_bb492495 = arraycombine( var_bb492495, struct::get_array( str_zone + "_spawner" ), 0, 0 );
        }
    }
    
    if ( isdefined( var_533ac894 ) )
    {
        foreach ( str_zone in var_533ac894 )
        {
            var_bb492495 = arraycombine( var_bb492495, struct::get_array( str_zone + "_spawns" ), 0, 0 );
            var_bb492495 = arraycombine( var_bb492495, struct::get_array( str_zone + "_spawner" ), 0, 0 );
        }
    }
    
    var_bb492495 = array::filter( var_bb492495, 0, &function_6c4ef5c9 );
    
    while ( var_b5a033fe == 0 || var_5b839378 < var_b5a033fe )
    {
        if ( level.var_9eaf1031 < var_1e8caeb1 )
        {
            util::wait_network_frame( 5 );
            continue;
        }
        
        var_bb492495 = array::randomize( var_bb492495 );
        var_c979da59 = 0;
        var_1e8caeb1 += var_5dc704a7;
        
        while ( a_stokers.size < var_36f58c64 )
        {
            while ( !isdefined( ai_stoker ) )
            {
                level waittill( #"hash_6b642d0b24b9ee12" );
                ai_stoker = zm_ai_stoker::spawn_single( 1, var_bb492495[ var_c979da59 ], n_round );
            }
            
            if ( !isdefined( a_stokers ) )
            {
                a_stokers = [];
            }
            else if ( !isarray( a_stokers ) )
            {
                a_stokers = array( a_stokers );
            }
            
            a_stokers[ a_stokers.size ] = ai_stoker;
            var_c6e6a75d++;
            
            while ( getaiteamarray( level.zombie_team ).size >= n_max_active_ai )
            {
                util::wait_network_frame();
                level boss_cleanup_zombie();
            }
            
            wait randomfloatrange( var_c9221a0f, var_b68a90de );
            ai_stoker = undefined;
            var_c979da59++;
        }
        
        function_1eaaceab( a_stokers, 0 );
        
        if ( a_stokers.size )
        {
            array::wait_till( a_stokers, "death" );
        }
        
        function_1eaaceab( a_stokers, 0 );
        
        if ( a_stokers.size )
        {
            array::wait_till( a_stokers, "death" );
        }
        
        if ( var_b5a033fe > 0 )
        {
            var_5b839378++;
            
            if ( var_5b839378 >= var_b5a033fe )
            {
                break;
            }
        }
    }
    
    function_98198f98( #"stoker" );
    wait randomfloatrange( var_c9221a0f, var_b68a90de );
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 1
// Checksum 0xc505a263, Offset: 0xce08
// Size: 0x40, Type: bool
function function_6c4ef5c9( s_loc )
{
    if ( !isdefined( s_loc.script_noteworthy ) )
    {
        return false;
    }
    
    if ( s_loc.script_noteworthy === "stoker_location" )
    {
        return true;
    }
    
    return false;
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 2
// Checksum 0x44ceba5f, Offset: 0xce50
// Size: 0x2fc
function function_776c95e2( var_61e1a92c, var_dbb23c7 )
{
    level endon( #"hash_38f29f9cb03586ea", #"spawn_zombies", #"intermission" );
    var_2208179c = struct::get_array( #"blightfather_spawn" );
    var_7bb1ca00 = level.var_f3c4bd00;
    ai_blightfather = undefined;
    var_24b27265 = 0;
    
    switch ( level.var_f3c4bd00 )
    {
        case 1:
            var_8c9010a4 = 21;
            var_dde52a4d = 26;
            break;
        case 2:
            var_8c9010a4 = 19;
            var_dde52a4d = 24;
            break;
        case 3:
            var_8c9010a4 = 17;
            var_dde52a4d = 22;
            break;
        case 4:
            var_8c9010a4 = 15;
            var_dde52a4d = 20;
            break;
    }
    
    while ( var_24b27265 < var_dbb23c7 )
    {
        wait randomfloatrange( 20, 25 );
        var_50e016a7 = level.var_83c0592c + var_61e1a92c;
        
        while ( level.var_83c0592c <= var_50e016a7 )
        {
            util::wait_network_frame( 2 );
        }
        
        var_9b2fc577 = 0;
        
        while ( var_9b2fc577 < var_7bb1ca00 )
        {
            zm_transform::function_bdd8aba6( #"hash_9ecf8085fb7a68f" );
            var_9b2fc577++;
            wait randomfloatrange( var_8c9010a4, var_dde52a4d );
        }
        
        while ( level.var_b175714d[ #"hash_9ecf8085fb7a68f" ].var_33e393a7 > 0 )
        {
            util::wait_network_frame( 2 );
        }
        
        do
        {
            wait 2;
            a_ai_blightfather = getaiarchetypearray( #"blight_father" );
        }
        while ( a_ai_blightfather.size > 0 );
        
        var_24b27265++;
    }
    
    function_98198f98( #"blight_father" );
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 1
// Checksum 0x143b11ef, Offset: 0xd158
// Size: 0x278
function function_770486e1( var_61e1a92c )
{
    level endon( #"hash_38f29f9cb03586ea", #"spawn_zombies", #"intermission" );
    var_2208179c = struct::get_array( #"blightfather_spawn" );
    var_7bb1ca00 = level.var_f3c4bd00;
    ai_blightfather = undefined;
    
    while ( true )
    {
        wait randomfloatrange( 20, 25 );
        var_50e016a7 = level.var_83c0592c + var_61e1a92c;
        
        while ( level.var_83c0592c <= var_50e016a7 )
        {
            util::wait_network_frame( 2 );
        }
        
        var_9b2fc577 = 0;
        
        while ( var_9b2fc577 < var_7bb1ca00 )
        {
            zm_transform::function_bdd8aba6( #"hash_9ecf8085fb7a68f" );
            var_9b2fc577++;
            wait randomfloatrange( 15, 20 );
        }
        
        while ( level.var_b175714d[ #"hash_9ecf8085fb7a68f" ].var_33e393a7 > 0 )
        {
            wait 0.2;
        }
        
        a_ai_blightfather = getaiarchetypearray( #"blight_father" );
        var_791efa17 = a_ai_blightfather.size;
        
        while ( var_791efa17 > 0 )
        {
            foreach ( ai_blightfather in a_ai_blightfather )
            {
                if ( !isalive( ai_blightfather ) )
                {
                    var_791efa17--;
                }
            }
            
            wait 0.2;
        }
        
        util::wait_network_frame();
    }
}

// Namespace zodt8_eye/zm_zodt8_eye
// Params 1
// Checksum 0x80411dfd, Offset: 0xd3d8
// Size: 0x11e
function function_98198f98( str_archetype )
{
    level endon( #"intermission" );
    util::delay_notify( 600, #"hash_20ba9a0874996fda" );
    
    while ( true )
    {
        wait 0.5;
        b_wait = 0;
        a_ai = getaiarchetypearray( str_archetype );
        
        foreach ( ai in a_ai )
        {
            if ( isalive( ai ) )
            {
                b_wait = 1;
                break;
            }
        }
        
        if ( !b_wait )
        {
            level notify( #"hash_3a4456148ade383a" );
            return;
        }
    }
}

/#

    // Namespace zodt8_eye/zm_zodt8_eye
    // Params 0
    // Checksum 0x2f5ae598, Offset: 0xd500
    // Size: 0x1a4, Type: dev
    function function_5d346946()
    {
        if ( !getdvarint( #"zm_debug_ee", 0 ) )
        {
            return;
        }
        
        zm_devgui::add_custom_devgui_callback( &function_d25f8fbc );
        adddebugcommand( "<dev string:x1b8>" );
        adddebugcommand( "<dev string:x1f9>" );
        adddebugcommand( "<dev string:x24c>" );
        adddebugcommand( "<dev string:x29f>" );
        adddebugcommand( "<dev string:x2f2>" );
        adddebugcommand( "<dev string:x345>" );
        adddebugcommand( "<dev string:x3a5>" );
        adddebugcommand( "<dev string:x3f7>" );
        adddebugcommand( "<dev string:x448>" );
        adddebugcommand( "<dev string:x49d>" );
        adddebugcommand( "<dev string:x4f1>" );
        adddebugcommand( "<dev string:x549>" );
        adddebugcommand( "<dev string:x59f>" );
        adddebugcommand( "<dev string:x5f5>" );
    }

    // Namespace zodt8_eye/zm_zodt8_eye
    // Params 1
    // Checksum 0x92fd9e8a, Offset: 0xd6b0
    // Size: 0x322, Type: dev
    function function_d25f8fbc( cmd )
    {
        switch ( cmd )
        {
            case #"start_bf":
                level thread function_435a7941();
                return 1;
            case #"hash_1774efff8d070e0d":
                level thread function_435a7941( 1 );
                return 1;
            case #"hash_1774eeff8d070c5a":
                level thread function_435a7941( 2 );
                return 1;
            case #"hash_1774e9ff8d0703db":
                level thread function_435a7941( 3 );
                return 1;
            case #"hash_1774e8ff8d070228":
                level thread function_435a7941( 4 );
                return 1;
            case #"hash_56b003484b719b01":
                level.e_boss thread function_225a4561();
                return 1;
            case #"do_mst":
                level.e_boss thread function_81b39fd3();
                return 1;
            case #"do_bm":
                level.e_boss thread function_6b5e9ead();
                return 1;
            case #"do_combo":
                level.e_boss thread function_da98e094();
                return 1;
            case #"do_blst":
                level.e_boss thread function_c31e58d9();
                return 1;
            case #"hash_42e3fa83d357e8e0":
                level.e_boss function_500cb0be( #"hash_678aaf8e37498e9a", #"p8_fxanim_zm_zod_eye_01_bundle" );
                return 1;
            case #"hash_42e3fd83d357edf9":
                level.e_boss function_500cb0be( #"hash_32a51dafb1c7344f", #"p8_fxanim_zm_zod_eye_02_bundle" );
                return 1;
            case #"hash_42e3fc83d357ec46":
                level.e_boss function_500cb0be( #"hash_597bdc83a7c9e8c", #"p8_fxanim_zm_zod_eye_03_bundle" );
                return 1;
            case #"hash_5dad3801740fa24a":
                level notify( #"hash_38f29f9cb03586ea" );
                return 1;
        }
    }

    // Namespace zodt8_eye/zm_zodt8_eye
    // Params 1
    // Checksum 0xed17298c, Offset: 0xd9e0
    // Size: 0xf4, Type: dev
    function function_435a7941( var_c1051599 )
    {
        zm_devgui::zombie_devgui_open_sesame();
        
        if ( !flag::get( "<dev string:x64f>" ) )
        {
            level.s_pap_quest.var_4ee2e2ab = 0;
            level flag::set( "<dev string:x64f>" );
        }
        
        if ( isdefined( var_c1051599 ) )
        {
            level._ee[ #"boss_fight" ].skip_to_step = var_c1051599;
        }
        
        zm_sq::start( #"boss_fight" );
        level waittill( #"hash_fbdf766a8b47229" );
        
        if ( !isdefined( var_c1051599 ) )
        {
            level boss_teleport_players( "<dev string:x664>" );
        }
    }

    // Namespace zodt8_eye/zm_zodt8_eye
    // Params 0
    // Checksum 0x1b55cd32, Offset: 0xdae0
    // Size: 0xdc, Type: dev
    function function_225a4561()
    {
        if ( isdefined( level.var_19261dce ) && level.var_19261dce )
        {
            return;
        }
        
        self function_5e792125();
        var_b7ba41fc = [];
        n_rand = randomint( self.var_3c63665.size );
        var_b7ba41fc = self.var_3c63665[ n_rand ];
        var_31a7a68f = var_b7ba41fc[ 0 ].script_int;
        util::wait_network_frame();
        self boss_move( var_31a7a68f );
        self function_ae28c1a7();
    }

    // Namespace zodt8_eye/zm_zodt8_eye
    // Params 0
    // Checksum 0x73a6c571, Offset: 0xdbc8
    // Size: 0x6c, Type: dev
    function function_81b39fd3()
    {
        if ( isdefined( level.var_19261dce ) && level.var_19261dce )
        {
            return;
        }
        
        self function_5e792125();
        self function_ff69c896();
        self function_ae28c1a7();
    }

    // Namespace zodt8_eye/zm_zodt8_eye
    // Params 0
    // Checksum 0x64b5cf80, Offset: 0xdc40
    // Size: 0x6c, Type: dev
    function function_6b5e9ead()
    {
        if ( isdefined( level.var_19261dce ) && level.var_19261dce )
        {
            return;
        }
        
        self function_5e792125();
        self function_c7c928e9();
        self function_ae28c1a7();
    }

    // Namespace zodt8_eye/zm_zodt8_eye
    // Params 0
    // Checksum 0x9864887b, Offset: 0xdcb8
    // Size: 0x6c, Type: dev
    function function_da98e094()
    {
        if ( isdefined( level.var_19261dce ) && level.var_19261dce )
        {
            return;
        }
        
        self function_5e792125();
        self function_371e0929();
        self function_ae28c1a7();
    }

    // Namespace zodt8_eye/zm_zodt8_eye
    // Params 0
    // Checksum 0x19626723, Offset: 0xdd30
    // Size: 0x74, Type: dev
    function function_c31e58d9()
    {
        if ( isdefined( level.var_19261dce ) && level.var_19261dce )
        {
            return;
        }
        
        self function_5e792125( 1 );
        self function_1acc1d3();
        self function_ae28c1a7();
    }

    // Namespace zodt8_eye/zm_zodt8_eye
    // Params 1
    // Checksum 0x74e372b, Offset: 0xddb0
    // Size: 0x204, Type: dev
    function function_5e792125( var_4c971546 )
    {
        if ( !isdefined( var_4c971546 ) )
        {
            var_4c971546 = 0;
        }
        
        /#
            iprintlnbold( "<dev string:x669>" );
        #/
        
        level.var_19261dce = 1;
        
        if ( !isdefined( self.var_431d02e5 ) )
        {
            self function_a55a0339( "<dev string:x664>" );
        }
        
        if ( !isdefined( self.var_48b3f539 ) )
        {
            self function_71f63a19( "<dev string:x664>" );
        }
        
        if ( !isdefined( self.var_3c63665 ) )
        {
            self function_1b11b43( "<dev string:x664>" );
        }
        
        if ( !isdefined( self.var_c962047c ) )
        {
            self.var_c962047c = -1;
        }
        
        if ( !isdefined( self.var_59cdb7b9 ) )
        {
            self.var_59cdb7b9 = 1000;
        }
        
        if ( !isdefined( self.var_f881e30f ) )
        {
            self.var_f881e30f = 1000;
        }
        
        if ( !isdefined( self.var_6efcc8c1 ) )
        {
            self.var_6efcc8c1 = 0;
        }
        
        if ( !isdefined( self.str_scene ) )
        {
            self function_500cb0be( #"hash_678aaf8e37498e9a", #"p8_fxanim_zm_zod_eye_01_bundle" );
        }
        
        level clientfield::set( "<dev string:x682>", 1 );
        util::wait_network_frame();
        self function_a8a76e18();
        util::wait_network_frame();
        self function_26e02ac9( 0 );
        wait 4;
        
        if ( !var_4c971546 )
        {
            self function_671e8d37();
        }
    }

    // Namespace zodt8_eye/zm_zodt8_eye
    // Params 0
    // Checksum 0x6a4329bc, Offset: 0xdfc0
    // Size: 0xdc, Type: dev
    function function_ae28c1a7()
    {
        self function_26e02ac9( 0 );
        wait 2;
        self function_a8a76e18();
        wait 3;
        self boss_leave();
        self.origin = ( 0, 0, 0 );
        self.angles = ( 0, 0, 0 );
        self boss_arrive();
        level.var_19261dce = 0;
        level clientfield::set( "<dev string:x682>", 0 );
        
        /#
            iprintlnbold( "<dev string:x694>" );
        #/
    }

#/
