#using script_24c32478acf44108;
#using scripts\abilities\ability_util;
#using scripts\core_common\ai\systems\gib;
#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\ai_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\bots\bot;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\lui_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\music_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\spawner_shared;
#using scripts\core_common\status_effects\status_effect_util;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;
#using scripts\core_common\values_shared;
#using scripts\core_common\vehicle_shared;
#using scripts\zm\ai\zm_ai_blight_father;
#using scripts\zm\ai\zm_ai_gegenees;
#using scripts\zm\weapons\zm_weap_hand_charon;
#using scripts\zm\weapons\zm_weap_hand_gaia;
#using scripts\zm\weapons\zm_weap_riotshield;
#using scripts\zm\zm_red_boss_battle;
#using scripts\zm\zm_red_challenges;
#using scripts\zm\zm_red_ww_quests;
#using scripts\zm_common\ai\zm_ai_utility;
#using scripts\zm_common\util\ai_gegenees_util;
#using scripts\zm_common\util\ai_skeleton_util;
#using scripts\zm_common\zm;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_characters;
#using scripts\zm_common\zm_hero_weapon;
#using scripts\zm_common\zm_player;
#using scripts\zm_common\zm_powerups;
#using scripts\zm_common\zm_round_spawning;
#using scripts\zm_common\zm_sq;
#using scripts\zm_common\zm_transformation;
#using scripts\zm_common\zm_trial;
#using scripts\zm_common\zm_ui_inventory;
#using scripts\zm_common\zm_unitrigger;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_vo;

#namespace zm_red_main_quest;

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xc352cbbb, Offset: 0x990
// Size: 0xdc
function init()
{
    init_clientfield();
    init_flags();
    function_97d75392();
    init_reflect();
    init_split();
    function_3ffc2c9e();
    init_light();
    init_play();
    init_blood();
    init_cleanse();
    init_steps();
    
    if ( !zm_utility::is_ee_enabled() )
    {
        hidemiscmodels( "mdl_progress_route" );
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x43ce2e7b, Offset: 0xa78
// Size: 0x1c
function main()
{
    level thread function_5f80a70a();
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xbdb1b80c, Offset: 0xaa0
// Size: 0x1184
function init_clientfield()
{
    var_7551dff2 = getminbitcountfornum( 4 );
    var_b7863a03 = getminbitcountfornum( 3 );
    clientfield::register( "allplayers", "" + #"hash_72bd7a6af2ba1c5e", 16000, 1, "int" );
    clientfield::register( "allplayers", "" + #"hash_4a149c9daff159cd", 16000, 1, "int" );
    clientfield::register( "toplayer", "" + #"hash_7343b1cdab1f31c5", 16000, 1, "counter" );
    clientfield::register( "scriptmover", "" + #"hash_2a17f2993036fab4", 16000, 1, "counter" );
    clientfield::register( "scriptmover", "" + #"rune_fire", 16000, 1, "int" );
    clientfield::register( "scriptmover", "" + #"monument_eyes", 16000, var_7551dff2, "int" );
    clientfield::register( "scriptmover", "" + #"hash_78fa79d021d86cb6", 16000, 1, "int" );
    clientfield::register( "scriptmover", "" + #"hash_4f90c0f4c5bc1c42", 16000, 1, "int" );
    clientfield::register( "scriptmover", "" + #"hash_784f06b253332f8f", 16000, 1, "counter" );
    clientfield::register( "toplayer", "" + #"hash_491027931a3fc18f", 16000, 1, "int" );
    clientfield::register( "world", "" + #"hash_682b7b65432b7746", 16000, var_b7863a03, "int" );
    clientfield::register( "toplayer", "" + #"hash_214549d33d068451", 16000, 1, "counter" );
    clientfield::register( "world", "" + #"hash_51858e923e750c33", 16000, 2, "int" );
    clientfield::register( "world", "" + #"hash_2b05d4c6217bac22", 16000, 2, "int" );
    clientfield::register( "world", "" + #"hash_3836d3a94cf05642", 16000, 2, "int" );
    clientfield::register( "world", "" + #"hash_53e684a319647b40", 16000, 2, "int" );
    clientfield::register( "world", "" + #"hash_70e157c389c1c02f", 16000, 1, "int" );
    clientfield::register( "world", "" + #"hash_4f59799617fef9c7", 16000, 1, "int" );
    clientfield::register( "world", "" + #"hash_31a10d565ae05ddb", 16000, 2, "int" );
    clientfield::register( "world", "" + #"hash_1c97c11fb59eb4bf", 16000, 2, "int" );
    clientfield::register( "scriptmover", "" + #"hash_797e7381ba62ff8a", 16000, 1, "counter" );
    clientfield::register( "scriptmover", "" + #"hash_30660c47aae060a9", 16000, 1, "int" );
    clientfield::register( "scriptmover", "" + #"hash_22acf133b0aa208a", 16000, 1, "int" );
    clientfield::register( "world", "" + #"hash_530e1caa1a8c81d2", 16000, 1, "counter" );
    clientfield::register( "toplayer", "" + #"hash_11480c2b11f0c92f", 16000, 1, "counter" );
    clientfield::register( "scriptmover", "" + #"hash_6d76e4b7a31537af", 16000, 1, "int" );
    clientfield::register( "world", "" + #"hash_4d77ba61cd7f3eb7", 16000, 1, "counter" );
    clientfield::register( "world", "" + #"hash_43972920fa314daa", 16000, 2, "int" );
    clientfield::register( "toplayer", "" + #"hash_25cfe5e9786d97e7", 16000, 1, "int" );
    clientfield::register( "scriptmover", "" + #"hash_125706eb7b363924", 16000, 1, "int" );
    clientfield::register( "vehicle", "" + #"hash_7fc7f7b5958831d4", 16000, 1, "int" );
    clientfield::register( "scriptmover", "" + #"hash_431f319e4b8fe9db", 16000, 1, "int" );
    clientfield::register( "world", "" + #"hash_158233cdc645bef6", 16000, 1, "int" );
    clientfield::register( "toplayer", "" + #"hash_492a33037a532fe0", 16000, 1, "counter" );
    clientfield::register( "toplayer", "" + #"hash_4aeb7fcdd8302eaa", 16000, 1, "int" );
    clientfield::register( "toplayer", "" + #"hash_7a99ff005314c5fc", 16000, 1, "int" );
    clientfield::register( "toplayer", "" + #"hash_7f85dc0ce20a6f2c", 16000, 1, "int" );
    clientfield::register( "toplayer", "" + #"hash_4e3e66f200f76f34", 16000, 1, "int" );
    clientfield::register( "toplayer", "" + #"hash_565ca9982285f23e", 16000, 1, "int" );
    clientfield::register( "actor", "" + #"hash_415416bf220de94", 16000, 1, "int" );
    clientfield::register( "actor", "" + #"hash_3e2b1092de25c2dd", 16000, 1, "int" );
    clientfield::register( "actor", "" + #"hash_24b5302c2f39ebc2", 16000, 1, "int" );
    clientfield::register( "actor", "" + #"hash_6a8479b5a5b359a7", 16000, 1, "int" );
    clientfield::register( "actor", "" + #"hash_4feb66128e57d092", 16000, 1, "int" );
    clientfield::register( "actor", "" + #"hash_7552d5567ab25417", 16000, 1, "int" );
    clientfield::register( "actor", "" + #"hash_4e1b58f05f69a65a", 16000, 1, "int" );
    clientfield::register( "actor", "" + #"hash_5a6761fe764bdccf", 16000, 1, "int" );
    var_ff76a259 = getminbitcountfornum( 5 );
    clientfield::register( "world", "" + #"hash_74aaba5c17a71e0d", 16000, var_ff76a259, "int" );
    clientfield::register( "world", "" + #"hash_7e49e921c4dd052f", 16000, var_ff76a259, "int" );
    clientfield::register( "world", "" + #"hash_9d4aab5c25b93ff", 16000, var_ff76a259, "int" );
    clientfield::register( "world", "" + #"hash_58e58259618537e7", 16000, var_ff76a259, "int" );
    clientfield::register( "scriptmover", "" + #"hash_155f8a4473c5849f", 16000, 1, "int" );
    clientfield::register( "scriptmover", "" + #"hash_4400550c9847a1c5", 16000, 1, "int" );
    clientfield::register( "scriptmover", "" + #"hash_1f0dd5bf6862e335", 16000, 1, "int" );
    clientfield::register( "scriptmover", "" + #"hash_ab97fcf2b12187d", 16000, 1, "int" );
    clientfield::register( "world", "" + #"hash_d80665c22fafd1e", 16000, 1, "int" );
    var_995dd8bf = getminbitcountfornum( 9 );
    clientfield::register( "world", "" + #"play_fanfare", 16000, var_995dd8bf, "int" );
    clientfield::register( "scriptmover", "" + #"blood_teleport", 16000, 1, "counter" );
    clientfield::register( "allplayers", "" + #"hash_67b317587e795ec2", 16000, 1, "int" );
    clientfield::register( "allplayers", "" + #"hash_10275bcd47e53936", 16000, 1, "int" );
    clientfield::register( "toplayer", "" + #"hash_49068d48a9eb7b89", 16000, 2, "int" );
    clientfield::register( "world", "" + #"hash_51e28147388ee3d8", 16000, 1, "int" );
    clientfield::register( "world", "" + #"hash_16e27bea0cc1b56b", 16000, 1, "int" );
    clientfield::register( "scriptmover", "" + #"hash_297c800c6e18f746", 16000, 1, "int" );
    clientfield::register( "scriptmover", "" + #"hash_26ddf1f70bd1f67a", 16000, 1, "int" );
    clientfield::register( "scriptmover", "" + #"hash_508fc6409c815104", 16000, 1, "counter" );
    clientfield::register( "world", "" + #"cleanse_portal", 16000, 1, "int" );
    clientfield::register( "world", "" + #"narrative_room", 16000, 1, "int" );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xd95cd55a, Offset: 0x1c30
// Size: 0x124
function init_flags()
{
    level flag::init( #"monument_changed" );
    level flag::init( #"hash_4e74b4172497a14a" );
    level flag::init( #"oil_completed" );
    level flag::init( #"hash_70a5801e57336554" );
    level flag::init( #"split_completed" );
    level flag::init( #"flag_prophecy_completed" );
    level flag::init( #"flag_light_completed" );
    level flag::init( #"hash_f38b18eaf7b063b" );
    level flag::init( #"hash_5a7f1f9adac6dc8c" );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xe1edac62, Offset: 0x1d60
// Size: 0x9a4
function init_steps()
{
    zm_sq::register( #"main_quest", #"oil", #"oil", &oil_setup, &oil_cleanup );
    zm_sq::register( #"main_quest", #"reflect", #"reflect", &reflect_setup, &reflect_cleanup );
    zm_sq::register( #"main_quest", #"split", #"split", &split_setup, &split_cleanup );
    zm_sq::register( #"prophecy", #"shoot_roots", #"shoot_roots", &shoot_roots_setup, &shoot_roots_cleanup );
    zm_sq::register( #"prophecy", #"defeat_gegenees", #"defeat_gegenees", &defeat_gegenees_setup, &defeat_gegenees_cleanup );
    zm_sq::register( #"prophecy", #"take_spear", #"take_spear", &take_spear_setup, &take_spear_cleanup );
    zm_sq::register( #"prophecy", #"place_spear", #"place_spear", &place_spear_setup, &place_spear_cleanup );
    zm_sq::register( #"prophecy", #"sundial_puzzle", #"sundial_puzzle", &sundial_puzzle_setup, &sundial_puzzle_cleanup );
    zm_sq::register( #"light", #"free_ankh", #"free_ankh", &free_ankh_setup, &free_ankh_cleanup );
    zm_sq::register( #"light", #"take_ankh", #"take_ankh", &take_ankh_setup, &take_ankh_cleanup );
    zm_sq::register( #"light", #"give_ankh", #"give_ankh", &give_ankh_setup, &give_ankh_cleanup );
    zm_sq::register( #"light", #"defend_ra", #"defend_ra", &defend_ra_setup, &defend_ra_cleanup );
    zm_sq::register( #"light", #"take_staff", #"take_staff", &take_staff_setup, &take_staff_cleanup );
    zm_sq::register( #"light", #"give_staff", #"give_staff", &give_staff_setup, &give_staff_cleanup );
    zm_sq::register( #"main_quest", #"hash_1b1abb2af5960bfe", #"hash_1b1abb2af5960bfe", &function_29a8dcd4, &function_488a4eb2 );
    zm_sq::register( #"main_quest", #"play", #"play", &play_setup, &play_cleanup );
    zm_sq::register( #"main_quest", #"blood", #"blood", &blood_setup, &blood_cleanup );
    zm_sq::register( #"main_quest", #"door_interact", #"door_interact", &door_interact_setup, &door_interact_cleanup );
    zm_sq::register( #"main_quest", #"mid_igc", #"mid_igc", &mid_igc_setup, &mid_igc_cleanup );
    zm_sq::register( #"main_quest", #"cleanse", #"cleanse", &cleanse_setup, &cleanse_cleanup );
    zm_sq::register( #"main_quest", #"push_ballista", #"push_ballista", &push_ballista_setup, &push_ballista_cleanup );
    zm_sq::register( #"main_quest", #"ignite_ballista", #"ignite_ballista", &ignite_ballista_setup, &ignite_ballista_cleanup );
    zm_sq::register( #"main_quest", #"teleport", #"teleport", &teleport_setup, &teleport_cleanup );
    zm_sq::register( #"narrative_room", #"1", #"hash_64d6af5ddc324d26", &function_6f55d670, &function_13c87ace );
    zm_sq::register( #"narrative_room", #"2", #"hash_3f567f217222e5b2", &narrative_room, &narrative_room_cleanup );
    zm_sq::start( #"main_quest" );
    zm_sq::start( #"narrative_room" );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0x3b50b018, Offset: 0x2710
// Size: 0x104
function oil_setup( b_skipped )
{
    level.var_38ee0d9e = array( 0, 0, 0 );
    level flag::wait_till( #"pap_quest_completed" );
    level zm_ui_inventory::function_7df6bb60( #"zm_red_objective_progress", 1 );
    level flag::wait_till( "fl_oracle_unlocked" );
    function_40b663e7();
    
    for ( i = 1; i <= 3 ; i++ )
    {
        level thread function_881659b( i, b_skipped );
    }
    
    level flag::wait_till( #"oil_completed" );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xc2d8a5dd, Offset: 0x2820
// Size: 0x8e
function function_97d75392()
{
    level.var_6c94f00a = 0;
    
    for ( i = 1; i <= 3 ; i++ )
    {
        var_782728a8 = getent( "rune_" + i, "targetname" );
        var_782728a8 hidepart( "tag_emissive" );
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xefaec448, Offset: 0x28b8
// Size: 0x15a
function function_40b663e7()
{
    callback::on_connect( &function_a9481419 );
    a_players = getplayers();
    
    foreach ( player in a_players )
    {
        player thread function_a9481419();
    }
    
    level.var_1177ae05 = &function_f26aeec5;
    namespace_9ff9f642::register_burn( #"hash_26b7fbb55bad5c2f", 16, 6 );
    zm::function_84d343d( #"zhield_zpear_dw", &function_b252fc5 );
    zm::function_84d343d( #"zhield_zpear_turret", &function_b252fc5 );
    level.var_ec37138d = 1;
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x52de85f5, Offset: 0x2a20
// Size: 0xa0
function function_a9481419()
{
    self endon( #"disconnect" );
    
    while ( true )
    {
        s_flame = struct::get( #"hash_11e79ab8fb768baa" );
        function_e9af1fc4( s_flame, 13689 );
        
        if ( !( isdefined( self.var_b4f85096 ) && self.var_b4f85096 ) )
        {
            self thread function_fbc44c3e();
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 4
// Checksum 0xad67d147, Offset: 0x2ac8
// Size: 0x22a
function function_e9af1fc4( s_target, var_7d07543f, var_a0d128c8 = 1, str_notify )
{
    self endon( #"disconnect" );
    
    if ( isdefined( str_notify ) )
    {
        level endon( str_notify );
    }
    
    if ( !var_a0d128c8 && !isdefined( s_target.t_damage ) )
    {
        level thread function_eebc7e40( s_target, str_notify );
    }
    
    var_8f1e485e = 0;
    
    while ( !var_8f1e485e )
    {
        s_result = self waittill( #"weapon_melee" );
        
        if ( isdefined( s_result.weapon.isriotshield ) && s_result.weapon.isriotshield )
        {
            if ( var_a0d128c8 && s_result.weapon == level.var_ce3aa8a8 )
            {
                continue;
            }
            
            if ( distancesquared( self.origin, s_target.origin ) < var_7d07543f )
            {
                v_player_eye = self geteye();
                v_normalize = vectornormalize( s_target.origin - v_player_eye );
                var_24169a2e = self getweaponforwarddir();
                n_dot = vectordot( var_24169a2e, v_normalize );
                
                if ( n_dot > 0.16 )
                {
                    var_8f1e485e = 1;
                    
                    if ( isdefined( str_notify ) )
                    {
                        level notify( str_notify, { #e_player:self } );
                    }
                }
            }
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 2
// Checksum 0x298cc75a, Offset: 0x2d00
// Size: 0x240
function function_eebc7e40( s_target, str_notify )
{
    level endon( #"oil_completed" );
    
    if ( !isdefined( s_target.t_damage ) )
    {
        s_target.t_damage = spawn( "trigger_damage_new", s_target.origin, 0, 61, 61 );
        s_target.t_damage.health = 999999;
        s_target.t_damage endon( #"death" );
    }
    
    var_c4b94b6 = 0;
    
    while ( !var_c4b94b6 )
    {
        s_result = s_target.t_damage waittill( #"damage" );
        s_target.t_damage.health += s_result.amount;
        
        if ( isplayer( s_result.inflictor ) )
        {
            var_8f1e485e = isdefined( s_result.weapon.isriotshield ) && s_result.weapon.isriotshield && ( s_result.mod === "MOD_PROJECTILE" || s_result.mod === "MOD_PROJECTILE_SPLASH" );
            
            if ( var_8f1e485e && isdefined( s_result.inflictor.var_b4f85096 ) && s_result.inflictor.var_b4f85096 )
            {
                level notify( str_notify, { #e_player:s_result.inflictor } );
                var_c4b94b6 = 1;
                s_target.t_damage delete();
            }
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x246e56d4, Offset: 0x2f48
// Size: 0x13a
function function_fbc44c3e()
{
    self endon( #"death", #"hash_313ddbccf660de40" );
    self clientfield::set( "" + #"hash_72bd7a6af2ba1c5e", 1 );
    self.var_b4f85096 = 1;
    
    if ( !level.var_6c94f00a )
    {
        level.var_6c94f00a = 1;
        level thread function_3135d0e6( self );
    }
    
    self thread function_1251d08c();
    self thread function_630766ac();
    self waittill( #"hash_cbf6a8f73a300c8" );
    self clientfield::set( "" + #"hash_4a149c9daff159cd", 1 );
    self clientfield::set( "" + #"hash_72bd7a6af2ba1c5e", 0 );
    self.var_b0cde18d = 1;
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0xf37e999e, Offset: 0x3090
// Size: 0x1e4
function function_3135d0e6( e_player )
{
    level endon( #"end_game" );
    
    if ( zm_utility::is_player_valid( e_player ) )
    {
        e_player thread zm_audio::create_and_play_dialog( #"generic", #"response_positive" );
    }
    
    wait 10;
    level zm_vo::function_3c173d37( ( 0, 0, 0 ), 2147483647 );
    level zm_audio::sndvoxoverride( 1 );
    waitframe( 1 );
    a_e_players = util::get_active_players();
    a_e_players = array::randomize( a_e_players );
    
    foreach ( e_player in a_e_players )
    {
        if ( zm_utility::is_player_valid( e_player ) && e_player zm_audio::can_speak() )
        {
            b_played = e_player zm_vo::function_a2bd5a0c( #"hash_5d135a09f5f75f0e" );
            break;
        }
    }
    
    if ( isdefined( b_played ) && b_played )
    {
        level thread function_7b345f6d( #"hash_2b67d88ef795d22c" );
    }
    
    level zm_audio::sndvoxoverride( 0 );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x7fa71c3f, Offset: 0x3280
// Size: 0x14e
function function_1251d08c()
{
    self endon( #"death" );
    s_result = self waittill( #"hash_459246e5bfcc3713", #"destroy_riotshield", #"weapon_fired", #"fake_death" );
    self clientfield::set( "" + #"hash_72bd7a6af2ba1c5e", 0 );
    
    if ( isdefined( self.var_b0cde18d ) && self.var_b0cde18d )
    {
        self clientfield::set( "" + #"hash_4a149c9daff159cd", 0 );
    }
    
    self thread zm_audio::create_and_play_dialog( #"generic", #"response_negative" );
    
    if ( s_result._notify == "weapon_fired" )
    {
        wait 1.6;
    }
    
    self.var_b4f85096 = 0;
    self.var_b0cde18d = 0;
    self notify( #"hash_313ddbccf660de40" );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x30affb96, Offset: 0x33d8
// Size: 0x2e
function function_f26aeec5()
{
    if ( !( isdefined( self.var_16735873 ) && self.var_16735873 ) )
    {
        self notify( #"hash_459246e5bfcc3713" );
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 12
// Checksum 0xd7fc1709, Offset: 0x3410
// Size: 0x248
function function_b252fc5( inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype )
{
    if ( isplayer( attacker ) && isdefined( attacker.var_b4f85096 ) && attacker.var_b4f85096 )
    {
        if ( isdefined( attacker.var_b0cde18d ) && attacker.var_b0cde18d && self.zm_ai_category == #"basic" )
        {
            if ( self.archetype == #"zombie" && !zm_utility::is_magic_bullet_shield_enabled( self ) )
            {
                mdl_fx = util::spawn_model( #"tag_origin", self gettagorigin( "j_spine4" ), self gettagangles( "j_spine4" ) );
                mdl_fx clientfield::increment( "" + #"hash_2a17f2993036fab4" );
                mdl_fx thread util::delayed_delete( 0.25 );
                gibserverutils::annihilate( self );
            }
            
            return ( self.health + 666 );
        }
        
        self clientfield::set( "zm_nuked", 1 );
        self namespace_9ff9f642::burn( #"hash_26b7fbb55bad5c2f", attacker, weapon, 16 );
    }
    
    return damage;
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xbc8819d5, Offset: 0x3660
// Size: 0x160
function function_630766ac()
{
    self notify( "2c94f6cd68ab93b0" );
    self endon( "2c94f6cd68ab93b0" );
    level endon( #"end_game" );
    self endon( #"death", #"hash_459246e5bfcc3713", #"destroy_riotshield" );
    
    while ( self hasriotshield() && isdefined( self.var_b4f85096 ) && self.var_b4f85096 )
    {
        wait 5;
        
        if ( self hasriotshield() && isdefined( self.var_b4f85096 ) && self.var_b4f85096 )
        {
            if ( !isbot( self ) )
            {
                self clientfield::increment_to_player( "" + #"hash_7343b1cdab1f31c5" );
            }
            
            self riotshield::player_damage_shield( 25 / zombie_utility::get_zombie_var( #"hash_cc85b961f25c2ff" ), undefined, undefined, undefined, 0 );
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 2
// Checksum 0xbc249aee, Offset: 0x37c8
// Size: 0x3e4
function function_881659b( n_index, b_skipped )
{
    level endon( #"oil_completed" );
    var_782728a8 = getent( "rune_" + n_index, "targetname" );
    var_e13b91f9 = struct::get( var_782728a8.target );
    
    if ( !b_skipped )
    {
        var_c4b94b6 = 0;
        str_notify = #"oil_fire_" + n_index;
        
        while ( !var_c4b94b6 )
        {
            a_players = getplayers();
            
            foreach ( player in a_players )
            {
                player thread function_e9af1fc4( var_e13b91f9, 3721, 0, str_notify );
            }
            
            s_result = level waittill( str_notify );
            
            if ( isdefined( s_result.e_player.var_b4f85096 ) && s_result.e_player.var_b4f85096 )
            {
                var_c4b94b6 = 1;
                
                if ( !( isdefined( level.var_3dc6358c ) && level.var_3dc6358c ) )
                {
                    level.var_3dc6358c = 1;
                    s_result.e_player thread zm_audio::create_and_play_dialog( #"generic", #"response_positive" );
                }
            }
        }
    }
    
    if ( isdefined( var_e13b91f9.t_damage ) )
    {
        var_e13b91f9.t_damage delete();
    }
    
    level clientfield::set( "" + #"hash_682b7b65432b7746", n_index );
    
    if ( !b_skipped )
    {
        level scene::play( #"hash_76acbb03fdd478a0" + var_e13b91f9.var_471a77a9 + "_bundle" );
    }
    
    var_782728a8 showpart( "tag_emissive" );
    var_782728a8 clientfield::set( "" + #"rune_fire", 1 );
    level.var_38ee0d9e[ n_index - 1 ] = 1;
    var_2df64d67 = 0;
    
    foreach ( var_9ce1d083 in level.var_38ee0d9e )
    {
        if ( var_9ce1d083 )
        {
            var_2df64d67++;
        }
    }
    
    if ( var_2df64d67 == 3 )
    {
        level flag::set( #"oil_completed" );
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 2
// Checksum 0xe95e82bc, Offset: 0x3bb8
// Size: 0xe4
function oil_cleanup( b_skipped, var_19e802fa )
{
    if ( b_skipped || var_19e802fa )
    {
        if ( !( isdefined( level.var_ec37138d ) && level.var_ec37138d ) )
        {
            function_40b663e7();
        }
        
        if ( !level flag::get( #"oil_completed" ) )
        {
            for ( i = 1; i <= 3 ; i++ )
            {
                if ( !level.var_38ee0d9e[ i - 1 ] )
                {
                    function_881659b( i, 1 );
                }
            }
        }
    }
    
    level thread function_f0f982b();
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xd1c1464a, Offset: 0x3ca8
// Size: 0x344
function function_f0f982b()
{
    playsoundatposition( #"hash_48910fcc61ab6c8a", ( 0, 0, 0 ) );
    exploder::exploder( "exp_lgt_skylight" );
    var_e986e64a = getent( "cave_door", "targetname" );
    var_d25ef27c = struct::get( #"hash_4625361373037689" );
    var_a4a51709 = struct::get( #"hash_9e0e9cf53602f0a" );
    var_e986e64a moveto( var_d25ef27c.origin, 2.9 );
    wait 0.25;
    playsoundatposition( #"hash_396f1597d3662c78", ( 0, 0, 0 ) );
    
    foreach ( e_player in getplayers() )
    {
        e_player clientfield::increment_to_player( "" + #"hash_214549d33d068451" );
    }
    
    var_e986e64a waittilltimeout( 2.9 - 0.25, #"movedone" );
    var_e986e64a rotateto( var_a4a51709.angles, 2.9 );
    var_e986e64a moveto( var_a4a51709.origin, 2.9 );
    var_e986e64a waittill( #"movedone" );
    level clientfield::set( "" + #"hash_51858e923e750c33", 1 );
    wait 1;
    a_e_players = util::get_active_players();
    a_e_players = array::randomize( a_e_players );
    
    foreach ( e_player in a_e_players )
    {
        if ( zm_utility::is_player_valid( e_player ) )
        {
            e_player thread zm_vo::function_a2bd5a0c( #"hash_7c2fc0e6e835e8df" );
            break;
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0x3a9b5963, Offset: 0x3ff8
// Size: 0x1c4
function reflect_setup( b_skipped )
{
    level zm_ui_inventory::function_7df6bb60( #"zm_red_objective_progress", 2 );
    
    if ( !b_skipped )
    {
        level thread reflect_vo();
        level thread spartan_monuments();
        a_players = getplayers();
        
        foreach ( player in a_players )
        {
            player thread function_8142733f();
        }
        
        level flag::wait_till( #"hash_4e74b4172497a14a" );
        a_players = util::get_active_players();
        
        foreach ( player in a_players )
        {
            player playrumbleonentity( "zm_red_step_complete_rumble" );
        }
        
        playsoundatposition( #"hash_396f1597d3662c78", ( 0, 0, 0 ) );
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x69a7a8a2, Offset: 0x41c8
// Size: 0x21c
function reflect_vo()
{
    level flag::wait_till( #"oil_completed" );
    level thread function_cad81195();
    level thread function_a9bde51();
    array::thread_all( getplayers(), &function_e64c55ea );
    wait 15;
    b_played = 0;
    a_e_players = util::get_active_players();
    a_e_players = array::randomize( a_e_players );
    
    foreach ( e_player in a_e_players )
    {
        if ( zm_utility::is_player_valid( e_player ) )
        {
            b_played = e_player zm_vo::function_a2bd5a0c( #"hash_76a20f43fee4ec4f" );
            break;
        }
    }
    
    if ( isdefined( b_played ) && b_played )
    {
        level thread function_7b345f6d( #"hash_fa3fa8d2434cae7" );
    }
    
    s_result = level waittill( #"monument_shot" );
    
    if ( isplayer( s_result.e_player ) )
    {
        s_result.e_player zm_audio::create_and_play_dialog( #"generic", #"response_positive" );
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xf53a6220, Offset: 0x43f0
// Size: 0x18c
function function_a9bde51()
{
    level waittill( #"last_monument" );
    s_result = level waittill( #"monument_shot" );
    level waittill( #"hash_6a78cf8b84796501" );
    
    if ( zm_utility::is_player_valid( s_result.e_player ) )
    {
        s_result.e_player zm_vo::function_a2bd5a0c( #"hash_5b6e60c5280dcb1c" );
    }
    else
    {
        a_e_players = util::get_active_players();
        a_e_players = array::randomize( a_e_players );
        
        foreach ( e_player in a_e_players )
        {
            if ( zm_utility::is_player_valid( e_player ) )
            {
                e_player zm_vo::function_a2bd5a0c( #"hash_5b6e60c5280dcb1c" );
                break;
            }
        }
    }
    
    level flag::set( #"hash_70a5801e57336554" );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x6cbb92e8, Offset: 0x4588
// Size: 0xfe
function function_e64c55ea()
{
    self endon( #"disconnect" );
    level endon( #"hash_103477b55ed9a149" );
    var_c29a1099 = getent( "vol_reflect", "targetname" );
    
    while ( !level flag::get( #"hash_4e74b4172497a14a" ) )
    {
        if ( zm_utility::is_player_valid( self ) && !( isdefined( level.var_4ea7b88f ) && level.var_4ea7b88f ) && self istouching( var_c29a1099 ) )
        {
            level.var_4ea7b88f = 1;
            self thread zm_vo::function_a2bd5a0c( #"hash_1aa9fc5f46a728d0" );
        }
        
        waitframe( 1 );
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xe7f4a183, Offset: 0x4690
// Size: 0x9c
function function_cad81195()
{
    a_origin = ( 439, -4107, -677 );
    var_e25ba3b3 = spawn( "script_origin", a_origin );
    var_e25ba3b3 playloopsound( #"hash_34d1426dd3b11eb8" );
    flag::wait_till( #"hash_4e74b4172497a14a" );
    var_e25ba3b3 delete();
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x21b2f999, Offset: 0x4738
// Size: 0x318
function function_8142733f()
{
    self endon( #"disconnect" );
    level endon( #"hash_4e74b4172497a14a" );
    self thread function_f94701f3();
    var_c29a1099 = getent( "vol_reflect", "targetname" );
    
    while ( !level flag::get( #"hash_4e74b4172497a14a" ) )
    {
        self waittill( #"hash_288cb56263c7b7fa" );
        
        if ( self istouching( var_c29a1099 ) )
        {
            if ( !( isdefined( self.var_a56de6e0 ) && self.var_a56de6e0 ) )
            {
                self clientfield::set_to_player( "" + #"hash_491027931a3fc18f", 1 );
                self.var_a56de6e0 = 1;
                self thread function_b87e4fa1();
            }
            
            if ( !( isdefined( level.var_97a5d82f ) && level.var_97a5d82f ) )
            {
                level.var_97a5d82f = 1;
                level notify( #"hash_103477b55ed9a149" );
                self thread zm_vo::function_a2bd5a0c( #"hash_4c8a4f38397df93a" );
            }
            
            level flag::wait_till( #"monument_changed" );
            level.var_67c7040c flag::clear( #"hash_1267306c12c34607" );
            var_e041507a = self getentitynumber() + 1;
            level.var_67c7040c clientfield::set( "" + #"monument_eyes", var_e041507a );
            level.var_67c7040c.b_in_use = 1;
            var_46307de5 = level.var_67c7040c;
            zm_weap_hand_charon::function_25513188( var_46307de5 );
            s_result = self waittill( #"monument_change", #"hash_56c5053f5e67838b", #"monument_shot" );
            
            if ( isdefined( var_46307de5 ) )
            {
                zm_weap_hand_charon::function_5760b289( var_46307de5 );
                var_46307de5 clientfield::set( "" + #"monument_eyes", 0 );
                var_46307de5 thread function_b7c33177();
            }
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x24d217d2, Offset: 0x4a58
// Size: 0x3e
function function_b7c33177()
{
    wait 0.15;
    
    if ( isdefined( self ) )
    {
        self flag::set( #"hash_1267306c12c34607" );
        self.b_in_use = undefined;
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x1c9a24fb, Offset: 0x4aa0
// Size: 0x156
function function_f94701f3()
{
    level endon( #"hash_4e74b4172497a14a" );
    self waittill( #"disconnect" );
    
    foreach ( var_9be47330 in level.var_6775c28d )
    {
        if ( isdefined( var_9be47330 ) )
        {
            zm_weap_hand_charon::function_5760b289( var_9be47330 );
            var_9be47330 clientfield::set( "" + #"monument_eyes", 0 );
            var_9be47330.b_in_use = undefined;
        }
    }
    
    if ( isdefined( level.var_42a95bde ) )
    {
        zm_weap_hand_charon::function_5760b289( level.var_42a95bde );
        level.var_42a95bde clientfield::set( "" + #"monument_eyes", 0 );
        level.var_42a95bde.b_in_use = undefined;
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xb80afc4b, Offset: 0x4c00
// Size: 0xec
function function_b87e4fa1()
{
    self endon( #"death" );
    
    while ( isdefined( self.var_b1224954 ) && self istouching( self.var_b1224954 ) && !level flag::get( #"hash_4e74b4172497a14a" ) )
    {
        waitframe( 1 );
    }
    
    self.var_a56de6e0 = undefined;
    self clientfield::set_to_player( "" + #"hash_491027931a3fc18f", 0 );
    self notify( #"hash_56c5053f5e67838b" );
    
    if ( isdefined( level.var_67c7040c ) )
    {
        level.var_67c7040c notify( #"clean_up" );
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xd44f08b0, Offset: 0x4cf8
// Size: 0x178
function function_47c0d27()
{
    self endon( #"death" );
    self flag::init( #"hash_1267306c12c34607" );
    
    while ( true )
    {
        s_result = level waittill( #"ww_charon_hit" );
        
        if ( isdefined( self ) )
        {
            if ( s_result.e_entity === self && self == level.var_67c7040c )
            {
                if ( isplayer( s_result.player ) && isdefined( s_result.player.var_a56de6e0 ) && s_result.player.var_a56de6e0 )
                {
                    self notify( #"monument_shot" );
                    s_result.player notify( #"monument_shot" );
                    level notify( #"monument_shot", { #e_player:s_result.player } );
                    self flag::wait_till( #"hash_1267306c12c34607" );
                }
            }
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 2
// Checksum 0xacc937fb, Offset: 0x4e78
// Size: 0x384
function monument_trail( e_projectile, var_862206ea )
{
    e_projectile endon( #"death" );
    e_projectile thread projectile_timeout();
    
    if ( isdefined( var_862206ea ) )
    {
        var_4d8b7233 = 0;
        var_edf17cfc = var_862206ea getcentroid();
        n_dist = distance( e_projectile.origin, var_edf17cfc );
        var_948c9fb6 = n_dist - n_dist * 0.29;
        
        while ( isdefined( var_862206ea ) && distance2dsquared( e_projectile.origin, var_862206ea.origin ) > 289 )
        {
            var_edf17cfc = var_862206ea getcentroid();
            var_727d3c77 = e_projectile.origin;
            v_forward = vectornormalize( var_862206ea.origin - var_727d3c77 );
            v_target = var_727d3c77 + v_forward * 61;
            n_dist = distance2d( e_projectile.origin, var_edf17cfc );
            var_4d8b7233 = randomintrange( 92, 116 );
            
            if ( n_dist <= var_948c9fb6 )
            {
                var_4d8b7233 *= 0.29;
                var_4d8b7233 *= -1;
            }
            
            v_end = v_target + ( 0, 0, var_4d8b7233 );
            
            if ( isdefined( v_end ) && isdefined( var_862206ea ) )
            {
                if ( distance2dsquared( e_projectile.origin, var_862206ea.origin ) <= 289 )
                {
                    v_end = var_862206ea getcentroid();
                }
                
                e_projectile moveto( v_end, 0.2 );
                wait 0.2 - 0.05;
                continue;
            }
            
            waitframe( 1 );
        }
    }
    
    if ( isdefined( var_862206ea ) && var_862206ea.zm_ai_category === #"boss" )
    {
        if ( isdefined( var_862206ea gettagorigin( "tag_body" ) ) )
        {
            v_end = var_862206ea gettagorigin( "tag_body" );
        }
    }
    
    if ( isdefined( v_end ) )
    {
        e_projectile moveto( v_end, 0.05 );
        e_projectile waittill( #"movedone" );
    }
    
    e_projectile playsound( #"hash_7c51534a91103a32" );
    
    if ( isdefined( e_projectile ) )
    {
        e_projectile delete();
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xf5f86705, Offset: 0x5208
// Size: 0x34
function projectile_timeout()
{
    self endon( #"death" );
    wait 6.1;
    self delete();
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x44d11d27, Offset: 0x5248
// Size: 0x15e
function init_reflect()
{
    a_s_monuments = struct::get_array( #"reflect_structs", "script_noteworthy" );
    a_s_monuments = array::randomize( a_s_monuments );
    
    foreach ( s_monument in a_s_monuments )
    {
        if ( s_monument.script_string === "reflect_0" )
        {
            var_f1962e98 = s_monument;
            break;
        }
    }
    
    arrayremovevalue( a_s_monuments, var_f1962e98 );
    level.var_42a95bde = var_f1962e98 function_e4ccd9be( 0 );
    
    for ( i = 0; i < 3 ; i++ )
    {
        a_s_monuments[ i ] function_e4ccd9be();
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xa52d4fc4, Offset: 0x53b0
// Size: 0x11c
function function_5f80a70a()
{
    while ( !isdefined( level.var_6775c28d ) || level.var_6775c28d.size == 0 )
    {
        waitframe( 1 );
    }
    
    foreach ( var_9be47330 in level.var_6775c28d )
    {
        var_9be47330 clientfield::set( "" + #"hash_78fa79d021d86cb6", 1 );
    }
    
    while ( !isdefined( level.var_42a95bde ) )
    {
        waitframe( 1 );
    }
    
    level.var_42a95bde clientfield::set( "" + #"hash_78fa79d021d86cb6", 1 );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x6237a008, Offset: 0x54d8
// Size: 0x59c
function spartan_monuments()
{
    level endon( #"hash_4e74b4172497a14a" );
    level.var_4822b326 = 1;
    
    while ( level.var_6775c28d.size > 0 )
    {
        var_9aa36ed = arraycopy( level.var_6775c28d );
        
        foreach ( var_407cfce6 in level.var_6775c28d )
        {
            if ( isdefined( var_407cfce6 ) && !( isdefined( var_407cfce6.b_shot ) && var_407cfce6.b_shot ) )
            {
                level.var_67c7040c = var_407cfce6;
                level flag::set( #"monument_changed" );
                var_4c07cedf = function_2a9c51b5();
                s_result = var_407cfce6 waittilltimeout( var_4c07cedf, #"monument_shot" );
                level flag::clear( #"monument_changed" );
                a_players = getplayers();
                
                foreach ( player in a_players )
                {
                    player notify( #"monument_change" );
                }
                
                if ( isdefined( var_407cfce6.b_in_use ) && var_407cfce6.b_in_use )
                {
                    var_407cfce6 function_5dc6a4b7( s_result._notify );
                }
                
                wait 1.6;
            }
        }
        
        level.var_6775c28d = array::remove_undefined( level.var_6775c28d );
        
        foreach ( var_407cfce6 in level.var_6775c28d )
        {
            if ( var_407cfce6.b_shot )
            {
                arrayremovevalue( var_9aa36ed, var_407cfce6, 0 );
            }
        }
        
        var_9aa36ed = array::remove_undefined( var_9aa36ed );
        level.var_6775c28d = var_9aa36ed;
        waitframe( 1 );
    }
    
    level.var_67c7040c = level.var_42a95bde;
    level flag::set( #"monument_changed" );
    level notify( #"last_monument" );
    var_b6225a1f = 0;
    
    while ( !var_b6225a1f )
    {
        var_4c07cedf = function_2a9c51b5();
        s_result = level.var_67c7040c waittilltimeout( var_4c07cedf, #"clean_up", #"monument_shot" );
        
        if ( s_result._notify == #"monument_shot" )
        {
            var_b6225a1f = 1;
            level.var_67c7040c thread function_5dc6a4b7( s_result._notify );
        }
        
        a_players = getplayers();
        
        foreach ( player in a_players )
        {
            player notify( #"monument_change" );
        }
    }
    
    level.var_67c7040c function_822fc9a( 1.6 );
    level flag::set( #"hash_4e74b4172497a14a" );
    a_players = getplayers();
    
    foreach ( player in a_players )
    {
        player notify( #"monument_change" );
    }
    
    level.var_67c7040c flag::wait_till( #"hash_1267306c12c34607" );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x71334460, Offset: 0x5a80
// Size: 0x52
function function_2a9c51b5()
{
    var_4c07cedf = 6.1;
    a_players = util::get_active_players();
    
    if ( a_players.size > 1 )
    {
        var_4c07cedf = 2.9;
    }
    
    return var_4c07cedf;
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0x3804892a, Offset: 0x5ae0
// Size: 0x174
function function_5dc6a4b7( str_notify )
{
    v_origin = self.origin;
    v_angles = self.angles;
    self flag::wait_till( #"hash_1267306c12c34607" );
    
    if ( str_notify == #"monument_shot" )
    {
        self.b_shot = 1;
        self thread function_822fc9a();
        a_players = util::get_active_players();
        n_spartoi = 3 * a_players.size;
        n_projectile = 0;
        
        for ( i = 0; i < n_spartoi ; i++ )
        {
            var_862206ea = zombie_skeleton_util::function_1ea880bd( 1 );
            
            if ( isdefined( var_862206ea ) )
            {
                var_862206ea.var_3c394b1b = 1;
                n_projectile++;
                
                if ( n_projectile <= 3 )
                {
                    level thread function_2d65c8cf( v_origin, v_angles, var_862206ea );
                }
            }
            
            waitframe( 1 );
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 3
// Checksum 0x23bb567d, Offset: 0x5c60
// Size: 0xac
function function_2d65c8cf( v_origin_start, v_angles_start, var_862206ea )
{
    wait 1;
    e_projectile = util::spawn_model( "tag_origin", v_origin_start + ( 0, 0, 128 ), v_origin_start );
    e_projectile clientfield::set( "" + #"hash_4f90c0f4c5bc1c42", 1 );
    monument_trail( e_projectile, var_862206ea );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0xf751db09, Offset: 0x5d18
// Size: 0xd4
function function_822fc9a( n_wait = 0 )
{
    self clientfield::set( "" + #"hash_78fa79d021d86cb6", 0 );
    self playsound( #"hash_4b4a1df956b94dd8" );
    
    if ( n_wait > 0 )
    {
        self thread scene::play( self.str_fxanim, self );
        wait n_wait;
    }
    else
    {
        self scene::play( self.str_fxanim, self );
    }
    
    if ( isdefined( self ) )
    {
        self delete();
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0x46dc17be, Offset: 0x5df8
// Size: 0x130
function function_e4ccd9be( var_1c49ffa5 = 1 )
{
    var_407cfce6 = util::spawn_model( self.model, self.origin, self.angles );
    var_407cfce6.b_shot = 0;
    var_407cfce6.str_fxanim = self.fxa;
    var_407cfce6 thread function_47c0d27();
    
    if ( var_1c49ffa5 )
    {
        if ( !isdefined( level.var_6775c28d ) )
        {
            level.var_6775c28d = [];
        }
        else if ( !isarray( level.var_6775c28d ) )
        {
            level.var_6775c28d = array( level.var_6775c28d );
        }
        
        level.var_6775c28d[ level.var_6775c28d.size ] = var_407cfce6;
    }
    
    hidemiscmodels( self.targetname );
    return var_407cfce6;
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 2
// Checksum 0x909d644f, Offset: 0x5f30
// Size: 0x2ac
function reflect_cleanup( b_skipped, var_19e802fa )
{
    if ( !level flag::get( #"hash_4e74b4172497a14a" ) )
    {
        level flag::set( #"hash_4e74b4172497a14a" );
    }
    
    foreach ( var_9be47330 in level.var_6775c28d )
    {
        if ( isdefined( var_9be47330 ) )
        {
            var_9be47330 delete();
        }
    }
    
    if ( isdefined( level.var_42a95bde ) )
    {
        level.var_42a95bde delete();
    }
    
    s_mirror = struct::get( #"split_mirror" );
    mdl_mirror = util::spawn_model( s_mirror.model, s_mirror.origin, s_mirror.angles );
    mdl_mirror movez( 320, 2.9 );
    
    if ( !b_skipped && !var_19e802fa )
    {
        mdl_mirror waittill( #"movedone" );
        level notify( #"hash_6a78cf8b84796501" );
    }
    else if ( !level flag::get( #"hash_70a5801e57336554" ) )
    {
        level flag::set( #"hash_70a5801e57336554" );
    }
    
    playsoundatposition( #"hash_48910ecc61ab6ad7", ( 0, 0, 0 ) );
    level clientfield::set( "" + #"hash_51858e923e750c33", 2 );
    level clientfield::set( "" + #"hash_2b05d4c6217bac22", 1 );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0x991d88f4, Offset: 0x61e8
// Size: 0x164
function split_setup( b_skipped )
{
    level zm_ui_inventory::function_7df6bb60( #"zm_red_objective_progress", 3 );
    callback::on_connect( &function_b8911151 );
    array::thread_all( getplayers(), &function_b8911151 );
    
    if ( !b_skipped )
    {
        level thread function_3d0f05e();
        a_s_cracks = struct::get_array( #"split_circle" );
        
        foreach ( s_crack in a_s_cracks )
        {
            s_crack thread function_8b20a029();
        }
        
        level flag::wait_till( #"split_completed" );
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x415c7fef, Offset: 0x6358
// Size: 0x6e
function init_split()
{
    var_ef84b792 = struct::get( #"split_final" );
    level.var_20622c6 = util::spawn_model( var_ef84b792.model, var_ef84b792.origin, var_ef84b792.angles );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xa11a1367, Offset: 0x63d0
// Size: 0x134
function function_3d0f05e()
{
    level flag::wait_till( #"hash_70a5801e57336554" );
    wait 10;
    a_e_players = util::get_active_players();
    a_e_players = array::randomize( a_e_players );
    
    foreach ( e_player in a_e_players )
    {
        if ( zm_utility::is_player_valid( e_player ) )
        {
            b_played = e_player zm_vo::function_a2bd5a0c( #"hash_56e84d8c794a63f7" );
            break;
        }
    }
    
    if ( isdefined( b_played ) && b_played )
    {
        level thread function_7b345f6d( #"hash_210265271f212c8f" );
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x86948046, Offset: 0x6510
// Size: 0x108
function function_b8911151()
{
    self notify( "1114015a3e4d9c5d" );
    self endon( "1114015a3e4d9c5d" );
    level endon( #"end_game", #"hash_1beb529f935869e4" );
    self endon( #"disconnect" );
    
    while ( true )
    {
        s_waitresult = self waittill( #"projectile_impact" );
        w_weapon = s_waitresult.weapon;
        
        if ( isdefined( w_weapon.isriotshield ) && w_weapon.isriotshield )
        {
            e_projectile = s_waitresult.projectile;
            
            if ( isdefined( e_projectile ) )
            {
                self.var_7808e305 = e_projectile.angles;
                self thread function_b77d6eae();
            }
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xb8091077, Offset: 0x6620
// Size: 0x3e
function function_b77d6eae()
{
    self notify( "8450fe687a4c855" );
    self endon( "8450fe687a4c855" );
    self endon( #"disconnect" );
    waitframe( 2 );
    self.var_7808e305 = undefined;
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xfd3c08cc, Offset: 0x6668
// Size: 0xdbc
function function_8b20a029()
{
    if ( isdefined( self.anim_id ) )
    {
        level scene::play( #"hash_3ec0153ab122b92b" + self.anim_id + "_bundle", "Shot 1" );
    }
    
    var_cff0c83d = util::spawn_model( self.model, self.origin, self.angles );
    var_cff0c83d.n_axis = self.script_int;
    var_cff0c83d playloopsound( #"hash_61150086f42e0ae1" );
    var_2becd382 = struct::get( self.script_noteworthy );
    var_cff0c83d.var_f1560899 = spawn( "trigger_damage_new", var_2becd382.origin, 0, 29, 29 );
    var_cff0c83d.var_f1560899.origin -= ( 0, 0, 29 );
    var_cff0c83d.var_f1560899.health = 999999;
    var_73bd6df = struct::get( self.target );
    var_99fea1a4 = util::spawn_model( var_73bd6df.model, var_73bd6df.origin, var_73bd6df.angles );
    var_ff61d09e = self.origin;
    s_damage = struct::get( self.script_string );
    
    if ( isdefined( s_damage ) )
    {
        var_ff61d09e = s_damage.origin;
    }
    
    var_61550b0 = 0;
    t_damage = spawn( "trigger_damage_new", var_ff61d09e, 0, 61, 61 );
    t_damage.health = 999999;
    
    while ( !var_61550b0 )
    {
        s_result = t_damage waittill( #"damage" );
        t_damage.health += s_result.amount;
        
        if ( isplayer( s_result.inflictor ) )
        {
            t_damage delete();
            var_61550b0 = 1;
            
            if ( !( isdefined( level.var_8007cbae ) && level.var_8007cbae ) )
            {
                level.var_8007cbae = 1;
                s_result.inflictor thread zm_audio::create_and_play_dialog( #"generic", #"response_positive" );
            }
        }
    }
    
    var_cff0c83d stoploopsound();
    
    if ( isdefined( self.anim_id ) )
    {
        level scene::play( #"hash_3ec0153ab122b92b" + self.anim_id + "_bundle", "Shot 2" );
    }
    
    var_99fea1a4 flag::init( #"gear_connected" );
    var_99fea1a4.var_b6226b48 = 1;
    var_99fea1a4.n_rotate_angle = 296;
    var_99fea1a4.var_d5b27ae8 = 0;
    var_99fea1a4 thread function_dacc5df9( var_73bd6df.target );
    var_99fea1a4 thread function_f0c7fe90();
    var_cff0c83d thread function_a0e1ae36( var_99fea1a4 );
    var_99fea1a4 flag::wait_till( #"gear_connected" );
    var_e18247ac = var_99fea1a4.origin;
    v_spawn_angle = var_99fea1a4.var_1101ac10;
    mdl_spear = util::spawn_model( #"wpn_t8_zm_red_spear_world", var_e18247ac, v_spawn_angle );
    mdl_spear setscale( 0.92 );
    var_99fea1a4 moveto( var_99fea1a4.origin, 0.01 );
    mdl_spear playsound( #"hash_2c3c886a5f128a1b" );
    var_cff0c83d.var_b6226b48 = 1;
    var_cff0c83d.n_rotate_angle = 296;
    
    if ( var_99fea1a4.n_rotate_angle > 0 )
    {
        var_cff0c83d.n_rotate_angle *= -1;
    }
    
    var_cff0c83d thread function_f0c7fe90();
    var_cff0c83d playloopsound( #"hash_3b4498972bdd0afe" );
    mdl_statue = getent( self.modeltarget, "targetname" );
    
    if ( !isdefined( level.a_mdl_statues ) )
    {
        level.a_mdl_statues = [];
    }
    
    if ( !isdefined( level.a_mdl_statues ) )
    {
        level.a_mdl_statues = [];
    }
    else if ( !isarray( level.a_mdl_statues ) )
    {
        level.a_mdl_statues = array( level.a_mdl_statues );
    }
    
    level.a_mdl_statues[ level.a_mdl_statues.size ] = mdl_statue;
    level.var_20622c6 clientfield::increment( "" + #"hash_784f06b253332f8f" );
    level.var_20622c6 hidepart( "tag_chaos_0" + level.a_mdl_statues.size );
    
    if ( level.a_mdl_statues.size >= 3 )
    {
        level.var_e0146859 = 0;
        
        foreach ( var_8899ca5c in level.a_mdl_statues )
        {
            var_8899ca5c thread rotate_statue();
        }
        
        level.var_20622c6.var_b6226b48 = 1;
        level.var_20622c6.n_rotate_angle = 296;
        level.var_20622c6 thread function_f0c7fe90();
        level.var_20622c6 playloopsound( #"hash_495a282fc8b810f5" );
        t_damage = spawn( "trigger_damage_new", level.var_20622c6.origin, 0, 61, 61 );
        t_damage.health = 999999;
        t_damage.origin -= ( 0, 0, 61 );
        var_32071ca7 = 0;
        
        while ( !var_32071ca7 )
        {
            s_result = t_damage waittill( #"damage" );
            t_damage.health += s_result.amount;
            var_db76a822 = level.a_mdl_statues[ 0 ] function_b35c1d18() || level.a_mdl_statues[ 1 ] function_b35c1d18() || level.a_mdl_statues[ 2 ] function_b35c1d18();
            
            if ( isplayer( s_result.inflictor ) && s_result.weapon === getweapon( #"zhield_zpear_turret" ) && var_db76a822 )
            {
                t_damage delete();
                var_32071ca7 = 1;
                level.var_720c7171 = s_result.inflictor;
            }
        }
        
        level notify( #"hash_1beb529f935869e4" );
        callback::remove_on_connect( &function_b8911151 );
        level.var_20622c6 notify( #"stop_gear" );
        level.var_20622c6 stoploopsound();
        level.var_20622c6 playsound( #"hash_2c3c886a5f128a1b" );
        v_spawn_angle = level.var_20622c6.angles + ( 0, -180, 0 );
        util::spawn_model( #"wpn_t8_zm_red_spear_world", level.var_20622c6.origin, v_spawn_angle );
        
        foreach ( var_8899ca5c in level.a_mdl_statues )
        {
            var_8899ca5c notify( #"hash_28fdd13c3ec45417" );
            var_8899ca5c stoploopsound();
            var_8899ca5c playsound( #"hash_3f2007b693c27c10" );
            v_forward = anglestoforward( var_8899ca5c.angles );
            s_fountain = struct::get( #"split_center" );
            var_b033e1a5 = vectornormalize( s_fountain.origin - var_8899ca5c.origin );
            v_angles = vectortoangles( var_b033e1a5 );
            v_angles = ( 0, v_angles[ 1 ], 0 );
            
            if ( var_8899ca5c.targetname == #"hash_1d9730159c4cbb32" )
            {
                v_angles += ( 0, 10, 0 );
            }
            
            var_8899ca5c rotateto( v_angles, 0.01 );
        }
        
        a_players = util::get_active_players();
        
        foreach ( player in a_players )
        {
            player playrumbleonentity( "zm_red_step_complete_rumble" );
        }
        
        level util::delay( "reflect_reflected", "end_game", &clientfield::set, "" + #"hash_2b05d4c6217bac22", 2 );
        level scene::play( #"p8_fxanim_zm_red_fountain_prism_bundle" );
        level flag::set( #"split_completed" );
        return;
    }
    
    mdl_statue thread rotate_statue( 0 );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 2
// Checksum 0xd1ae27c5, Offset: 0x7430
// Size: 0x286
function function_7a8d146e( var_99fea1a4, v_angles )
{
    n_x = var_99fea1a4.origin[ 0 ];
    n_y = var_99fea1a4.origin[ 1 ];
    n_z = var_99fea1a4.origin[ 2 ];
    
    switch ( self.var_d9488319 )
    {
        case 0:
            n_x += self.var_d9a41f3c;
            break;
        case 1:
            n_y += self.var_d9a41f3c;
            break;
        case 2:
            n_z += self.var_d9a41f3c;
            break;
        default:
            break;
    }
    
    var_e18247ac = ( n_x, n_y, n_z );
    
    if ( isdefined( self.var_86928b64 ) )
    {
        v_forward = anglestoforward( v_angles );
        var_a0fca4e1 = var_e18247ac + self.var_5b6446b4 * v_forward;
        
        switch ( self.var_86928b64 )
        {
            case 0:
                n_diff = var_a0fca4e1[ 0 ] - var_99fea1a4.origin[ 0 ];
                var_e18247ac += ( n_diff * -1, 0, 0 );
                break;
            case 1:
                n_diff = var_a0fca4e1[ 1 ] - var_99fea1a4.origin[ 1 ];
                var_e18247ac += ( 0, n_diff * -1, 0 );
                break;
            case 2:
                n_diff = var_a0fca4e1[ 2 ] - var_99fea1a4.origin[ 2 ];
                var_e18247ac += ( 0, 0, n_diff * -1 );
                break;
            default:
                break;
        }
    }
    
    return var_e18247ac;
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x534c253e, Offset: 0x76c0
// Size: 0xca
function function_b35c1d18()
{
    var_d0f267b3 = 0;
    v_forward = anglestoforward( self.angles );
    s_fountain = struct::get( #"split_center" );
    var_b033e1a5 = vectornormalize( s_fountain.origin - self.origin );
    n_dot = vectordot( v_forward, var_b033e1a5 );
    
    if ( n_dot > 0.92 )
    {
        var_d0f267b3 = 1;
    }
    
    return var_d0f267b3;
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0xfaec42df, Offset: 0x7798
// Size: 0x158
function function_a0e1ae36( var_99fea1a4 )
{
    self endon( #"gear_connected" );
    self flag::init( #"gear_connected" );
    self thread function_a0111782( var_99fea1a4 );
    
    while ( true )
    {
        var_2f3fee37 = abs( self.origin[ self.n_axis ] - var_99fea1a4.origin[ self.n_axis ] );
        
        if ( var_99fea1a4.var_d5b27ae8 && var_2f3fee37 < 3 )
        {
            n_rotate_angle = 61;
            
            if ( var_99fea1a4.n_rotate_angle > 0 )
            {
                n_rotate_angle *= -1;
            }
            
            self playsound( #"hash_42d34713fed239f2" );
            self rotateroll( n_rotate_angle, 0.3 );
            self waittill( #"rotatedone" );
            continue;
        }
        
        waitframe( 1 );
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0x87a7b8b1, Offset: 0x78f8
// Size: 0x248
function function_a0111782( var_99fea1a4 )
{
    self endon( #"gear_connected" );
    
    while ( true )
    {
        s_result = self.var_f1560899 waittill( #"damage" );
        self.var_f1560899.health += s_result.amount;
        var_2f3fee37 = abs( self.origin[ self.n_axis ] - var_99fea1a4.origin[ self.n_axis ] );
        
        if ( var_99fea1a4.var_d5b27ae8 && var_2f3fee37 <= 3.9 )
        {
            if ( isplayer( s_result.inflictor ) && isdefined( s_result.weapon.isriotshield ) && s_result.weapon.isriotshield )
            {
                if ( !( isdefined( level.var_2a3c1c63 ) && level.var_2a3c1c63 ) )
                {
                    level.var_2a3c1c63 = 1;
                    s_result.inflictor thread zm_audio::create_and_play_dialog( #"generic", #"response_positive" );
                }
                
                v_angles = s_result.inflictor function_c8fd26ac();
                
                if ( !isdefined( v_angles ) )
                {
                    continue;
                }
                
                self.var_f1560899 delete();
                var_99fea1a4.var_4f9c8c58 = s_result.inflictor;
                var_99fea1a4.var_1101ac10 = v_angles;
                var_99fea1a4 flag::set( #"gear_connected" );
                self flag::set( #"gear_connected" );
            }
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x798803d2, Offset: 0x7b48
// Size: 0xc4
function function_c8fd26ac()
{
    self notify( "10940de7d70a55a1" );
    self endon( "10940de7d70a55a1" );
    
    if ( isdefined( 0.25 ) )
    {
        __s = spawnstruct();
        __s endon( #"timeout" );
        __s util::delay_notify( 0.25, "timeout" );
    }
    
    self endon( #"disconnect" );
    v_angles = self.var_7808e305;
    
    while ( !isdefined( v_angles ) )
    {
        v_angles = self.var_7808e305;
        waitframe( 1 );
    }
    
    return v_angles;
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0x5481ec69, Offset: 0x7c18
// Size: 0x2b2
function function_dacc5df9( str_target )
{
    self endon( #"gear_connected" );
    
    for ( s_target = struct::get( str_target ); true ; s_target = struct::get( s_target.target ) )
    {
        self.var_d5b27ae8 = 0;
        
        if ( isdefined( s_target.script_int ) && s_target.script_int )
        {
            self.var_d5b27ae8 = 1;
        }
        
        n_move_time = 2.9;
        
        if ( isdefined( s_target.move_time ) )
        {
            n_move_time = s_target.move_time;
        }
        
        self playloopsound( #"hash_1e2887a33211a780" );
        self moveto( s_target.origin, n_move_time );
        self.var_b6226b48 = 1;
        self waittill( #"movedone" );
        self.var_b6226b48 = 0;
        self notify( #"rotatedone" );
        self rotateroll( 1, 0.01 );
        self stoploopsound();
        self.n_rotate_angle *= -1;
        
        if ( isdefined( s_target.rotate_angle ) )
        {
            self.var_9f82b856 = self.n_rotate_angle;
            
            if ( s_target.rotate_angle == 1 && self.n_rotate_angle < 1 )
            {
                self.n_rotate_angle *= -1;
            }
            else if ( s_target.rotate_angle == -1 && self.n_rotate_angle > 1 )
            {
                self.n_rotate_angle *= -1;
            }
        }
        else if ( isdefined( self.var_9f82b856 ) )
        {
            self.n_rotate_angle = -1 * self.var_9f82b856;
            self.var_9f82b856 = undefined;
        }
        
        n_wait_time = 1.6;
        
        if ( isdefined( s_target.wait_time ) )
        {
            n_wait_time = s_target.wait_time;
        }
        
        wait n_wait_time;
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x870dad89, Offset: 0x7ed8
// Size: 0x70
function function_f0c7fe90()
{
    self endon( #"stop_gear" );
    
    while ( true )
    {
        if ( self.var_b6226b48 )
        {
            self rotateroll( self.n_rotate_angle, 1.6 );
            self waittill( #"rotatedone" );
            continue;
        }
        
        waitframe( 1 );
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0x3d7b7b07, Offset: 0x7f50
// Size: 0x236
function rotate_statue( b_reset = 1 )
{
    self notify( #"hash_28fdd13c3ec45417" );
    self endon( #"hash_28fdd13c3ec45417" );
    v_forward = anglestoforward( self.angles );
    s_fountain = struct::get( #"split_center" );
    var_b033e1a5 = vectornormalize( s_fountain.origin - self.origin );
    v_angles = vectortoangles( var_b033e1a5 );
    v_angles = ( 0, v_angles[ 1 ], 0 );
    
    if ( self.targetname == #"hash_1d9730159c4cbb32" )
    {
        v_angles += ( 0, 10, 0 );
    }
    
    if ( b_reset )
    {
        self rotateto( v_angles, 0.01 );
        self waittill( #"rotatedone" );
        level.var_e0146859++;
        
        if ( level.var_e0146859 == 3 )
        {
            level notify( #"hash_a176192d6b745f0" );
        }
        else
        {
            level waittill( #"hash_a176192d6b745f0" );
        }
    }
    
    self playsound( #"hash_d9cd3d59940994" );
    self playloopsound( #"hash_5abec0ae1cc80274" );
    
    while ( true )
    {
        self rotateyaw( 296, 2.9 );
        self waittill( #"rotatedone" );
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 2
// Checksum 0xde03576e, Offset: 0x8190
// Size: 0x2f4
function split_cleanup( b_skipped, var_19e802fa )
{
    level notify( #"hash_1beb529f935869e4" );
    callback::remove_on_connect( &function_b8911151 );
    level clientfield::set( "" + #"hash_2b05d4c6217bac22", 2 );
    level clientfield::set( "" + #"hash_3836d3a94cf05642", 1 );
    level clientfield::set( "" + #"hash_53e684a319647b40", 1 );
    e_player = level.var_720c7171;
    
    if ( zm_utility::is_player_valid( e_player ) )
    {
        e_player thread zm_vo::function_a2bd5a0c( #"hash_74d703743c928320" );
    }
    else
    {
        a_e_players = util::get_active_players();
        a_e_players = array::randomize( a_e_players );
        
        foreach ( e_player in a_e_players )
        {
            if ( zm_utility::is_player_valid( e_player ) )
            {
                e_player thread zm_vo::function_a2bd5a0c( #"hash_74d703743c928320" );
                break;
            }
        }
    }
    
    playsoundatposition( #"hash_72db081c52e1b776", ( 108, -2838, -191 ) );
    playsoundatposition( #"hash_48910dcc61ab6924", ( 0, 0, 0 ) );
    
    if ( var_19e802fa )
    {
        if ( isarray( level.a_mdl_statues ) )
        {
            foreach ( mdl_statues in level.a_mdl_statues )
            {
                mdl_statues notify( #"hash_28fdd13c3ec45417" );
            }
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x7359578a, Offset: 0x8490
// Size: 0x2ac
function function_3ffc2c9e()
{
    s_prophecy = spawnstruct();
    level.var_cc9c60d2 = s_prophecy;
    a_s_roots[ #"easy" ] = struct::get_array( #"hash_2783a0c589b287e5" );
    a_s_roots[ #"medium" ] = struct::get_array( #"hash_7262d5ff710a3d2c" );
    a_s_roots[ #"hard" ] = struct::get_array( #"hash_3686ffef2f4fe836" );
    s_prophecy.a_s_roots = a_s_roots;
    a_mdl_sundial[ #"outer" ] = getent( "mdl_prophecy_code_easy", "targetname" );
    a_mdl_sundial[ #"middle" ] = getent( "mdl_prophecy_code_medium", "targetname" );
    a_mdl_sundial[ #"inner" ] = getent( "mdl_prophecy_code_hard", "targetname" );
    s_prophecy.a_mdl_sundial = a_mdl_sundial;
    var_7bb826c5 = getent( "mdl_prophecy_block", "targetname" );
    
    if ( !zm_utility::is_ee_enabled() )
    {
        var_7bb826c5 delete();
        
        foreach ( var_c6ebeb1 in a_s_roots )
        {
            array::delete_all( var_c6ebeb1 );
        }
        
        return;
    }
    
    var_7bb826c5 notsolid();
    var_7bb826c5 connectpaths();
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0x5360985, Offset: 0x8748
// Size: 0x456
function shoot_roots_setup( b_skipped )
{
    level endon( #"end_game", #"shoot_roots" + "_ended_early" );
    
    /#
        if ( b_skipped )
        {
            return;
        }
    #/
    
    s_prophecy = level.var_cc9c60d2;
    a_s_roots = s_prophecy.a_s_roots;
    
    foreach ( str_difficulty, a_s_difficulty in a_s_roots )
    {
        a_mdl_targets = [];
        
        for ( i = 0; i < a_s_difficulty.size ; i++ )
        {
            s_target = struct::get( a_s_difficulty[ i ].target );
            a_mdl_targets[ i ] = util::spawn_model( #"tag_origin", s_target.origin, s_target.angles );
            s_target struct::delete();
            a_s_difficulty[ i ] scene::init();
        }
        
        var_b01f45f0[ str_difficulty ] = a_mdl_targets;
    }
    
    s_prophecy.a_mdl_targets = var_b01f45f0;
    level.var_5b7d4d8d = 1;
    level.var_f521216c = 1;
    level thread function_2ee0f84b();
    
    while ( true )
    {
        foreach ( mdl_target in a_mdl_targets )
        {
            zm_weap_hand_gaia::function_6d783edd( mdl_target );
        }
        
        foreach ( str_difficulty, a_roots in a_s_roots )
        {
            if ( str_difficulty != #"easy" )
            {
                foreach ( s_roots in a_roots )
                {
                    if ( isdefined( s_roots.var_24e08b15 ) && s_roots.var_24e08b15 )
                    {
                        s_roots.var_24e08b15 = undefined;
                        s_roots scene::stop();
                        s_roots thread scene::play( s_roots.scriptbundlename, "in" );
                    }
                }
            }
        }
        
        wait 3;
        function_310741f7( #"easy" );
        wait 3;
        b_success = function_310741f7( #"medium" );
        
        if ( !b_success )
        {
            continue;
        }
        
        wait 3;
        b_success = function_310741f7( #"hard" );
        
        if ( !b_success )
        {
            continue;
        }
        
        break;
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x29c8f75c, Offset: 0x8ba8
// Size: 0x9c
function function_2ee0f84b()
{
    level thread function_bb660b8a();
    s_result = level waittill( #"hash_1e533dd76c452301" );
    
    if ( isplayer( s_result.e_player ) )
    {
        s_result.e_player zm_audio::create_and_play_dialog( #"generic", #"response_positive" );
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xca9dc547, Offset: 0x8c50
// Size: 0x94
function function_bb660b8a()
{
    level endon( #"shoot_roots_completed" );
    s_result = level waittill( #"hash_22f69672129581f6" );
    
    if ( isplayer( s_result.e_player ) )
    {
        s_result.e_player zm_audio::create_and_play_dialog( #"generic", #"response_negative" );
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xc55e919, Offset: 0x8cf0
// Size: 0x60
function function_66f49835()
{
    level endon( #"hash_1e533dd76c452301", #"hash_22f69672129581f6" );
    wait 6.1;
    level notify( #"hash_4885c7e8226d2fdd", { #var_f9486bd2:0 } );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 2
// Checksum 0xd105ae0f, Offset: 0x8d58
// Size: 0x268
function shoot_roots_cleanup( b_skipped, var_19e802fa )
{
    s_prophecy = level.var_cc9c60d2;
    var_f18de103 = s_prophecy.a_mdl_targets;
    
    if ( isdefined( var_f18de103 ) )
    {
        foreach ( var_b01f45f0 in var_f18de103 )
        {
            foreach ( mdl_target in var_b01f45f0 )
            {
                zm_weap_hand_gaia::function_6d783edd( mdl_target );
                mdl_target thread util::delayed_delete( 1 );
            }
        }
    }
    
    var_d9d7f557 = s_prophecy.a_s_roots;
    
    foreach ( a_s_roots in var_d9d7f557 )
    {
        foreach ( s_root in a_s_roots )
        {
            s_root scene::stop( 1 );
            s_root struct::delete();
        }
    }
    
    level.var_5b7d4d8d = undefined;
    level.var_f521216c = undefined;
    level notify( #"shoot_roots_completed" );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 2
// Checksum 0x9e205daa, Offset: 0x8fc8
// Size: 0x28c, Type: bool
function function_310741f7( var_1cd2521, n_time_limit )
{
    level endon( #"end_game", #"shoot_roots" + "_ended_early" );
    s_prophecy = level.var_cc9c60d2;
    a_s_roots = s_prophecy.a_s_roots[ var_1cd2521 ];
    s_prophecy.var_c77a0713 = 0;
    s_prophecy.var_46b09973 = a_s_roots.size;
    var_b01f45f0 = s_prophecy.a_mdl_targets;
    a_mdl_targets = var_b01f45f0[ var_1cd2521 ];
    
    for ( i = 0; i < a_s_roots.size ; i++ )
    {
        mdl_target = a_mdl_targets[ i ];
        a_s_roots[ i ] thread function_c538a5b7( mdl_target );
    }
    
    if ( var_1cd2521 != #"easy" )
    {
        level thread function_66f49835();
    }
    
    s_result = level waittill( #"hash_1e5cf7b7965152f3", #"hash_4885c7e8226d2fdd" );
    
    if ( s_result.var_f9486bd2 != a_s_roots.size )
    {
        foreach ( mdl_target in a_mdl_targets )
        {
            mdl_target notify( #"hash_580cbae7da0c821d" );
        }
        
        level notify( #"hash_22f69672129581f6", { #e_player:s_result.e_player } );
        level waittill( #"hash_768102de761a94ee" );
        return false;
    }
    
    level notify( #"hash_1e533dd76c452301", { #e_player:s_result.e_player } );
    return true;
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0x29b22ed6, Offset: 0x9260
// Size: 0x348
function function_c538a5b7( mdl_target )
{
    level endon( #"end_game", #"shoot_roots" + "_ended_early", #"hash_768102de761a94ee", #"hash_580cbae7da0c821d" );
    self endon( #"death" );
    mdl_target endon( #"death" );
    
    if ( !( isdefined( self.var_24e08b15 ) && self.var_24e08b15 ) )
    {
        mdl_target clientfield::increment( "" + #"hash_797e7381ba62ff8a" );
        self.var_24e08b15 = 1;
        self scene::play( self.scriptbundlename, "out" );
    }
    
    mdl_target val::set( #"prophecy_takedamage", "takedamage", 1 );
    zm_weap_hand_gaia::function_5fc81f0a( mdl_target );
    
    while ( true )
    {
        mdl_target.health = 999999;
        s_waitresult = mdl_target waittill( #"damage", #"hash_580cbae7da0c821d" );
        w_weapon = s_waitresult.weapon;
        
        if ( is_wonder_weapon( w_weapon, #"earth", 1 ) || is_wonder_weapon( w_weapon, #"earth", 0 ) )
        {
            break;
        }
        
        if ( s_waitresult._notify == #"hash_580cbae7da0c821d" )
        {
            break;
        }
    }
    
    if ( s_waitresult._notify != #"hash_580cbae7da0c821d" )
    {
        mdl_target clientfield::increment( "" + #"hash_797e7381ba62ff8a" );
    }
    
    self.var_24e08b15 = undefined;
    self thread scene::play( self.scriptbundlename, "in" );
    zm_weap_hand_gaia::function_6d783edd( mdl_target );
    mdl_target val::reset( #"prophecy_takedamage", "takedamage" );
    s_prophecy = level.var_cc9c60d2;
    s_prophecy.var_c77a0713++;
    
    if ( s_prophecy.var_c77a0713 >= s_prophecy.var_46b09973 )
    {
        level notify( #"hash_768102de761a94ee" );
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xfb7289ed, Offset: 0x95b0
// Size: 0x130
function function_f275243f()
{
    level endon( #"end_game", #"shoot_roots" + "_ended_early", #"hash_6961c92dc5b5cb68" );
    s_prophecy = level.var_cc9c60d2;
    mdl_chaos = s_prophecy.mdl_chaos;
    v_target = mdl_chaos.origin;
    
    while ( true )
    {
        s_waitresult = level waittill( #"gaia_spike_exploded" );
        v_hit = s_waitresult.v_origin;
        
        if ( isdefined( v_hit ) )
        {
            n_dist = distance2dsquared( v_hit, v_target );
            
            if ( n_dist <= 64 * 64 )
            {
                break;
            }
        }
    }
    
    level notify( #"hash_687e8fa112fa1330" );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0x54f04782, Offset: 0x96e8
// Size: 0x276
function defeat_gegenees_setup( b_skipped )
{
    level endon( #"end_game", #"defeat_gegenees" + "_ended_early" );
    level.var_ed006fe8 = array( 3 );
    
    /#
        if ( b_skipped )
        {
            return;
        }
    #/
    
    zm::register_zombie_damage_override_callback( &function_907d5e60 );
    s_scene = struct::get( #"aib_vign_cust_zm_red_gegn_crystal_break", "scriptbundlename" );
    s_scene.var_6efb24e2 = 1;
    
    while ( true )
    {
        ai_gegenees = zombie_gegenees_util::spawn_single( 1, s_scene );
        
        if ( isdefined( ai_gegenees ) )
        {
            break;
        }
        
        util::wait_network_frame();
    }
    
    ai_gegenees zm_ai_gegenees::function_59e9f77b();
    ai_gegenees.var_e946c8e8 = 1;
    ai_gegenees zm_ai_gegenees::function_d06af584();
    ai_gegenees scene::stop();
    level thread scene::play( #"aib_vign_cust_zm_red_gegn_crystal_break", ai_gegenees );
    ai_gegenees.var_126d7bef = 1;
    ai_gegenees.ignore_round_spawn_failsafe = 1;
    ai_gegenees.b_ignore_cleanup = 1;
    ai_gegenees.ignore_enemy_count = 1;
    ai_gegenees.var_3c394b1b = 1;
    ai_gegenees.no_powerups = 1;
    ai_gegenees.maxhealth *= 2;
    ai_gegenees.health *= 2;
    s_prophecy = level.var_cc9c60d2;
    s_prophecy.ai_gegenees = ai_gegenees;
    
    while ( isalive( ai_gegenees ) )
    {
        waitframe( 1 );
    }
    
    s_prophecy.v_gegenees_death = ai_gegenees.origin;
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 13
// Checksum 0xc860cffd, Offset: 0x9968
// Size: 0xd8
function function_907d5e60( death, inflictor, attacker, damage, flags, mod, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype )
{
    s_prophecy = level.var_cc9c60d2;
    
    if ( isdefined( s_prophecy ) )
    {
        ai_gegenees = s_prophecy.ai_gegenees;
        
        if ( ai_gegenees === self && isdefined( death ) && death )
        {
            self zm_ai_gegenees::function_59e9f77b();
        }
    }
    
    return damage;
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 2
// Checksum 0xc4c932ff, Offset: 0x9a48
// Size: 0x104
function defeat_gegenees_cleanup( b_skipped, var_19e802fa )
{
    s_gegenees = struct::get( #"hash_3556fe84a78fb6b" );
    
    if ( isdefined( s_gegenees ) )
    {
        s_gegenees struct::delete();
    }
    
    s_prophecy = level.var_cc9c60d2;
    ai_gegenees = s_prophecy.ai_gegenees;
    
    if ( var_19e802fa && isdefined( ai_gegenees ) )
    {
        while ( zm_utility::is_magic_bullet_shield_enabled( ai_gegenees ) )
        {
            waitframe( 1 );
        }
        
        s_prophecy.v_gegenees_death = ai_gegenees.origin;
        ai_gegenees zm_ai_gegenees::function_59e9f77b();
        ai_gegenees kill();
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0xcfa7657a, Offset: 0x9b58
// Size: 0x244
function take_spear_setup( b_skipped )
{
    level endon( #"end_game", #"take_spear" + "_ended_early" );
    
    /#
        if ( b_skipped )
        {
            return;
        }
    #/
    
    s_prophecy = level.var_cc9c60d2;
    s_backup = struct::get( #"hash_7c6d4a7c40906a70" );
    
    if ( !isdefined( s_prophecy.v_gegenees_death ) )
    {
        s_prophecy.v_gegenees_death = s_backup.origin;
    }
    
    v_origin = s_prophecy.v_gegenees_death;
    a_info = zm_utility::function_b0eeaada( v_origin );
    
    if ( isdefined( a_info ) )
    {
        v_navmesh = a_info[ #"point" ];
        
        if ( isdefined( v_navmesh ) )
        {
            v_origin = v_navmesh;
        }
    }
    
    if ( !zm_utility::check_point_in_playable_area( v_origin ) )
    {
        v_origin = s_backup.origin;
    }
    
    s_backup struct::delete();
    v_origin += ( 0, 0, 95 );
    v_angles = ( 0, 0, 165 );
    s_prophecy.mdl_spear = util::spawn_model( "c_t8_zmb_dlc2_gegenees_spear_golden", v_origin, v_angles );
    s_prophecy.mdl_spear playsound( #"hash_5dd75be565f9cc2" );
    e_player = s_prophecy.mdl_spear zm_unitrigger::function_fac87205( &function_8ddf09ff, 96 );
    s_prophecy.var_8257a25e = e_player;
    e_player playsound( #"hash_230737b2535a3374" );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 2
// Checksum 0x124c9ac5, Offset: 0x9da8
// Size: 0x13c
function take_spear_cleanup( b_skipped, var_19e802fa )
{
    s_backup = struct::get( #"hash_7c6d4a7c40906a70" );
    
    if ( isdefined( s_backup ) )
    {
        s_backup struct::delete();
    }
    
    s_prophecy = level.var_cc9c60d2;
    mdl_spear = s_prophecy.mdl_spear;
    
    if ( isdefined( mdl_spear ) )
    {
        if ( isdefined( mdl_spear.s_unitrigger ) )
        {
            zm_unitrigger::unregister_unitrigger( mdl_spear.s_unitrigger );
            mdl_spear.s_unitrigger = undefined;
        }
        
        mdl_spear delete();
    }
    
    if ( !b_skipped && !var_19e802fa )
    {
        e_player = s_prophecy.var_8257a25e;
        
        if ( zm_utility::is_player_valid( e_player ) )
        {
            e_player thread zm_vo::function_a2bd5a0c( #"hash_3cfe15f9edeeb79c" );
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0xb47a84f3, Offset: 0x9ef0
// Size: 0x22
function function_8ddf09ff( e_player )
{
    return zm_utility::is_player_valid( e_player );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0xec742859, Offset: 0x9f20
// Size: 0xa6
function place_spear_setup( b_skipped )
{
    level endon( #"end_game", #"take_spear" + "_ended_early" );
    
    /#
        if ( b_skipped )
        {
            return;
        }
    #/
    
    s_loc = struct::get( #"hash_1deabdaf47d6a78" );
    e_player = s_loc zm_unitrigger::function_fac87205( &function_63b805db, 96 );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 2
// Checksum 0xa6cdb0a8, Offset: 0x9fd0
// Size: 0x360
function place_spear_cleanup( b_skipped, var_19e802fa )
{
    s_loc = struct::get( #"hash_1deabdaf47d6a78" );
    
    if ( isdefined( s_loc.s_unitrigger ) )
    {
        zm_unitrigger::unregister_unitrigger( s_loc.s_unitrigger );
        s_loc.s_unitrigger = undefined;
    }
    
    s_prophecy = level.var_cc9c60d2;
    s_spear = struct::get( #"hash_18ff2df3f645697b" );
    mdl_spear = util::spawn_model( "c_t8_zmb_dlc2_gegenees_spear_golden", s_spear.origin, s_spear.angles );
    s_spear struct::delete();
    var_f8d39ecf = struct::get( #"hash_69e0bef55957f3ff" );
    var_48474ec7 = util::spawn_model( #"tag_origin", var_f8d39ecf.origin, var_f8d39ecf.angles );
    var_f8d39ecf struct::delete();
    var_7bb826c5 = getent( "mdl_prophecy_block", "targetname" );
    var_7bb826c5 solid();
    var_7bb826c5 disconnectpaths();
    var_48474ec7 linkto( mdl_spear );
    var_7bb826c5 linkto( mdl_spear );
    s_prophecy.mdl_spear = mdl_spear;
    s_prophecy.var_48474ec7 = var_48474ec7;
    level clientfield::increment( "" + #"hash_530e1caa1a8c81d2" );
    mdl_spear playsound( #"hash_6e7410aad6f58cde" );
    v_rotate = mdl_spear.angles + ( 0, 90, 0 );
    mdl_spear rotateto( v_rotate, 1 );
    mdl_spear waittilltimeout( 1, #"rotatedone" );
    wait 1;
    mdl_spear playsound( #"hash_647f96cdf0b9fce0" );
    mdl_spear movez( 8 * -1, 1 );
    mdl_spear waittilltimeout( 1, #"movedone" );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0x4d130d3f, Offset: 0xa338
// Size: 0x22
function function_63b805db( e_player )
{
    return zm_utility::is_player_valid( e_player );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0x4c1217f8, Offset: 0xa368
// Size: 0x5c
function sundial_puzzle_setup( b_skipped )
{
    level endon( #"end_game", #"sundial_puzzle" + "_ended_early" );
    
    /#
        if ( b_skipped )
        {
            return;
        }
    #/
    
    function_4c903aa5();
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 2
// Checksum 0xe2acbcd0, Offset: 0xa3d0
// Size: 0x294
function sundial_puzzle_cleanup( b_skipped, var_19e802fa )
{
    level notify( #"hash_1995757cb678aacb" );
    callback::remove_on_ai_killed( &function_c48b575b );
    s_prophecy = level.var_cc9c60d2;
    var_625d23b8 = s_prophecy.var_625d23b8;
    
    if ( isdefined( var_625d23b8 ) )
    {
        var_625d23b8 show();
    }
    
    a_mdl_symbols = s_prophecy.a_mdl_symbols;
    
    if ( isdefined( a_mdl_symbols ) )
    {
        array::delete_all( a_mdl_symbols );
    }
    
    s_unitrigger = struct::get( #"hash_1deabdaf47d6a78" );
    
    if ( isdefined( s_unitrigger ) )
    {
        if ( isdefined( s_unitrigger.s_unitrigger ) )
        {
            zm_unitrigger::unregister_unitrigger( s_unitrigger.s_unitrigger );
            s_unitrigger.s_unitrigger = undefined;
        }
        
        s_unitrigger struct::delete();
    }
    
    s_end = struct::get( #"hash_a42e01481663cf0" );
    s_end struct::delete();
    var_48474ec7 = s_prophecy.var_48474ec7;
    
    if ( isdefined( var_48474ec7 ) )
    {
        var_48474ec7 clientfield::set( "" + #"hash_22acf133b0aa208a", 0 );
        var_48474ec7 delete();
    }
    
    level.var_ed006fe8 = undefined;
    
    if ( b_skipped || var_19e802fa )
    {
        level thread function_8ed9dd3c();
    }
    else
    {
        function_8ed9dd3c();
    }
    
    level flag::set( #"flag_prophecy_completed" );
    playsoundatposition( #"hash_48910ccc61ab6771", ( 0, 0, 0 ) );
    level.var_cc9c60d2 struct::delete();
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x6b0c17c2, Offset: 0xa670
// Size: 0x9e6
function function_4c903aa5()
{
    level endon( #"end_game", #"sundial_puzzle" + "_ended_early" );
    callback::on_ai_killed( &function_c48b575b );
    level thread function_ade40c4a();
    level thread function_3ddff1b4();
    s_prophecy = level.var_cc9c60d2;
    a_mdl_sundial = s_prophecy.a_mdl_sundial;
    var_3ab52107 = array( 2, 3, 4, 5, 6, 7, 8 );
    b_clockwise = math::cointoss();
    s_unitrigger = struct::get( #"hash_1deabdaf47d6a78" );
    s_unitrigger zm_unitrigger::create( &function_63b805db, 96 );
    s_unitrigger thread function_8e8da19a();
    
    foreach ( str_ring, mdl_ring in a_mdl_sundial )
    {
        switch ( str_ring )
        {
            case #"outer":
                var_dcc2eee3 = 0.5;
                var_ef2b4932 = 0.5;
                str_scene = #"p8_fxanim_zm_red_sundial_outer_doors_bundle";
                str_shots = "outer";
                str_letter = "a";
                break;
            case #"middle":
                var_dcc2eee3 = 0.5;
                var_ef2b4932 = 0.25;
                str_scene = #"p8_fxanim_zm_red_sundial_middle_doors_bundle";
                str_shots = "mid";
                str_letter = "b";
                break;
            case #"inner":
                var_dcc2eee3 = 0.25;
                var_ef2b4932 = 0.25;
                str_scene = #"p8_fxanim_zm_red_sundial_inner_doors_bundle";
                str_shots = "inner";
                str_letter = "c";
                break;
        }
        
        str_prefix = "alchemical_symbol_" + str_letter + "_";
        v_angles_original = mdl_ring.angles;
        
        while ( true )
        {
            mdl_ring.angles = v_angles_original;
            s_prophecy.var_d7ebba27 = 0;
            s_prophecy.var_3dd6bbe9 = 0;
            s_prophecy.var_4bd614ab = 0;
            level waittill( #"hash_22acf133b0aa208a" );
            s_prophecy.var_3dd6bbe9 = 1;
            s_prophecy.var_48474ec7 clientfield::set( "" + #"hash_22acf133b0aa208a", 1 );
            n_symbol = array::random( var_3ab52107 );
            
            for ( i = 1; i <= 8 ; i++ )
            {
                str_on = str_prefix + i + "_on_jnt";
                str_off = str_prefix + i + "_off_jnt";
                
                if ( i == n_symbol )
                {
                    mdl_ring showpart( str_on );
                    mdl_ring hidepart( str_off );
                    continue;
                }
                
                mdl_ring hidepart( str_on );
                mdl_ring showpart( str_off );
            }
            
            n_opening = randomintrangeinclusive( 2, 4 );
            str_shot = str_shots + "_0" + n_opening + "_open";
            level scene::play( str_scene, str_shot );
            b_clockwise = !b_clockwise;
            var_137a6201 = n_symbol;
            
            while ( isdefined( s_prophecy.var_3dd6bbe9 ) && s_prophecy.var_3dd6bbe9 )
            {
                if ( b_clockwise )
                {
                    var_137a6201--;
                    
                    if ( var_137a6201 == 0 )
                    {
                        var_137a6201 = 8;
                    }
                }
                else
                {
                    var_137a6201++;
                    
                    if ( var_137a6201 == 8 + 1 )
                    {
                        var_137a6201 = 1;
                    }
                }
                
                var_82d542fb = var_137a6201 == 1;
                
                if ( var_82d542fb )
                {
                    s_prophecy.var_4bd614ab = 1;
                }
                
                mdl_ring function_a92eaaa( b_clockwise, var_dcc2eee3 );
                
                if ( isdefined( s_prophecy.var_3dd6bbe9 ) && s_prophecy.var_3dd6bbe9 && var_ef2b4932 > 0 )
                {
                    wait var_ef2b4932;
                }
                
                if ( var_82d542fb )
                {
                    level thread function_f3979ca2();
                }
            }
            
            s_prophecy.var_48474ec7 clientfield::set( "" + #"hash_22acf133b0aa208a", 0 );
            str_shot = str_shots + "_0" + n_opening + "_close";
            level scene::play( str_scene, str_shot );
            e_player = s_prophecy.var_6a8e51de;
            
            if ( isdefined( s_prophecy.var_113bf6cb ) && s_prophecy.var_113bf6cb )
            {
                v_adjust = ( 0, 45 * ( n_symbol - 1 ), 0 );
                mdl_ring.angles = v_angles_original - v_adjust;
                str_shot = str_shots + "_01_open";
                level scene::play( str_scene, str_shot );
                wait 1;
                
                if ( zm_utility::is_player_valid( e_player ) )
                {
                    switch ( str_ring )
                    {
                        case #"outer":
                            level thread function_590ba57a( e_player );
                            break;
                        case #"middle":
                            e_player thread zm_audio::create_and_play_dialog( #"generic", #"response_positive" );
                            break;
                        case #"inner":
                            level thread function_ca906c66( e_player );
                            break;
                    }
                }
                
                mdl_spear = s_prophecy.mdl_spear;
                mdl_spear playrumbleonentity( #"hash_2f90ad8c2371d73d" );
                var_850120d = 16;
                var_42496c02 = 2;
                b_last = str_ring == #"inner";
                str_alias = #"hash_7dd8d603476a2fdc";
                
                if ( b_last )
                {
                    var_850120d = 64;
                    var_42496c02 = 8;
                    str_alias = #"hash_2115ac365fbaf55f";
                }
                
                mdl_spear playsound( str_alias );
                mdl_spear movez( var_850120d * -1, var_42496c02 );
                mdl_spear waittill( #"movedone" );
                
                if ( b_last )
                {
                    var_7bb826c5 = getent( "mdl_prophecy_block", "targetname" );
                    var_7bb826c5 delete();
                }
                
                s_prophecy.var_113bf6cb = undefined;
                break;
            }
            
            s_prophecy.var_6a8e51de = undefined;
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xb5bea302, Offset: 0xb060
// Size: 0x66
function function_f3979ca2()
{
    level endon( #"end_game", #"sundial_puzzle" + "_ended_early" );
    wait 0.1;
    s_prophecy = level.var_cc9c60d2;
    
    if ( isdefined( s_prophecy ) )
    {
        s_prophecy.var_4bd614ab = 0;
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0x174d2b8a, Offset: 0xb0d0
// Size: 0xc4
function function_590ba57a( e_player )
{
    if ( !isdefined( e_player ) )
    {
        return;
    }
    
    level endon( #"end_game", #"sundial_puzzle" + "_ended_early" );
    e_player endon( #"disconnect" );
    
    if ( zm_utility::is_player_valid( e_player ) )
    {
        e_player zm_vo::function_a2bd5a0c( #"hash_3f73cd79382c519" );
    }
    
    wait 2;
    
    if ( zm_utility::is_player_valid( e_player ) )
    {
        e_player thread zm_vo::function_a2bd5a0c( #"hash_11241cd3fee87d8c" );
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0xd7770c05, Offset: 0xb1a0
// Size: 0x164
function function_ca906c66( e_player )
{
    if ( !isdefined( e_player ) )
    {
        return;
    }
    
    level endon( #"end_game", #"sundial_puzzle" + "_ended_early" );
    e_player endon( #"disconnect" );
    
    if ( e_player zm_characters::is_character( array( #"hash_7180c6cf382f6010", #"hash_14e91ceb9a7b3eb6" ) ) )
    {
        if ( zm_utility::is_player_valid( e_player ) )
        {
            b_played = e_player zm_vo::function_a2bd5a0c( #"hash_682a22908f49f4ab" );
        }
        
        if ( b_played === 1 )
        {
            e_player thread zm_vo::vo_say( #"hash_5b1fc7fce1734175", undefined, undefined, undefined, undefined, 1 );
        }
        
        return;
    }
    
    if ( zm_utility::is_player_valid( e_player ) )
    {
        e_player thread zm_audio::create_and_play_dialog( #"terrace_mirror", #"final" );
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0xc1655e0, Offset: 0xb310
// Size: 0x120
function function_c48b575b( s_params )
{
    if ( self.archetype == #"catalyst" && self.subarchetype == #"catalyst_electric" )
    {
        s_prophecy = level.var_cc9c60d2;
        mdl_spear = s_prophecy.mdl_spear;
        n_dist = distance2dsquared( self.origin, mdl_spear.origin );
        
        if ( !( isdefined( s_prophecy.var_d7ebba27 ) && s_prophecy.var_d7ebba27 ) && n_dist <= 128 * 128 )
        {
            s_prophecy.var_d7ebba27 = 1;
            level function_7e47a01a( self.origin );
            level notify( #"hash_22acf133b0aa208a" );
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0x9925a3d4, Offset: 0xb438
// Size: 0x164
function function_7e47a01a( v_start )
{
    params = level.var_7fe61e7a;
    s_end = struct::get( #"hash_a42e01481663cf0" );
    
    if ( !isdefined( s_end ) )
    {
        return;
    }
    
    v_end = s_end.origin;
    mdl_fx = util::spawn_model( #"tag_origin", v_start );
    mdl_fx clientfield::set( "" + #"hash_30660c47aae060a9", 1 );
    mdl_fx moveto( v_end, params.arc_travel_time );
    mdl_fx waittill( #"death", #"movedone" );
    mdl_fx clientfield::set( "" + #"hash_30660c47aae060a9", 0 );
    mdl_fx delete();
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xde484492, Offset: 0xb5a8
// Size: 0x80
function function_ade40c4a()
{
    level endon( #"end_game", #"sundial_puzzle" + "_ended_early", #"hash_1995757cb678aacb" );
    
    while ( true )
    {
        level thread function_3c71e07d();
        level waittill( #"end_of_round" );
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x491f14e0, Offset: 0xb630
// Size: 0x406
function function_3c71e07d()
{
    self notify( "a7b89283a4c0771" );
    self endon( "a7b89283a4c0771" );
    level endon( #"end_game", #"sundial_puzzle" + "_ended_early", #"end_of_round", #"hash_1995757cb678aacb" );
    s_prophecy = level.var_cc9c60d2;
    mdl_spear = s_prophecy.mdl_spear;
    v_spear = mdl_spear.origin;
    
    for ( i = 0; i < 2 ; i++ )
    {
        b_has_spawned = 0;
        
        while ( true )
        {
            wait 30;
            
            if ( isdefined( s_prophecy.var_d7ebba27 ) && s_prophecy.var_d7ebba27 )
            {
                continue;
            }
            
            a_ai_catalysts = getaiarchetypearray( #"catalyst" );
            var_e7f5b3e0 = 1;
            
            foreach ( ai_catalyst in a_ai_catalysts )
            {
                if ( isalive( ai_catalyst ) && ai_catalyst.subarchetype == #"catalyst_electric" )
                {
                    var_e7f5b3e0 = 0;
                    break;
                }
            }
            
            if ( var_e7f5b3e0 && !zm_transform::function_abf1dcb4( #"catalyst_electric" ) )
            {
                a_ai_zombies = getaiarchetypearray( #"zombie" );
                a_ai_zombies = array::randomize( a_ai_zombies );
                
                foreach ( ai_zombie in a_ai_zombies )
                {
                    if ( isdefined( ai_zombie.completed_emerging_into_playable_area ) && ai_zombie.completed_emerging_into_playable_area && !zm_utility::is_magic_bullet_shield_enabled( ai_zombie ) && !( isdefined( ai_zombie.marked_for_death ) && ai_zombie.marked_for_death ) && !( isdefined( ai_zombie.var_94c53b42 ) && ai_zombie.var_94c53b42 ) && !( isdefined( ai_zombie.var_52531256 ) && ai_zombie.var_52531256 ) && !( isdefined( ai_zombie.var_3c394b1b ) && ai_zombie.var_3c394b1b ) && ai_zombie zm_ai_utility::function_db610082() )
                    {
                        b_has_spawned = 1;
                        level thread zm_transform::function_9acf76e6( ai_zombie, #"catalyst_electric" );
                        break;
                    }
                }
            }
            
            if ( b_has_spawned )
            {
                break;
            }
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x59d28b35, Offset: 0xba40
// Size: 0x1a4
function function_3ddff1b4()
{
    level endon( #"end_game", #"sundial_puzzle" + "_ended_early", #"hash_1995757cb678aacb" );
    s_prophecy = level.var_cc9c60d2;
    mdl_spear = s_prophecy.mdl_spear;
    v_spear = mdl_spear.origin;
    
    while ( true )
    {
        wait 1;
        a_corpses = getcorpsearray();
        a_corpses = arraysortclosest( a_corpses, v_spear, undefined, 0, 150 );
        
        foreach ( corpse in a_corpses )
        {
            if ( isdefined( corpse ) && !( isdefined( corpse.var_acce8803 ) && corpse.var_acce8803 ) )
            {
                corpse.var_acce8803 = 1;
                corpse thread util::delayed_delete( 5 );
            }
            
            util::wait_network_frame();
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 2
// Checksum 0x1d1ea7f, Offset: 0xbbf0
// Size: 0x15a
function function_a92eaaa( b_clockwise, var_dcc2eee3 )
{
    self endon( #"death" );
    v_angles = self.angles;
    
    if ( b_clockwise )
    {
        var_1df0b136 = v_angles - ( 0, 45, 0 );
    }
    else
    {
        var_1df0b136 = v_angles + ( 0, 45, 0 );
    }
    
    var_a36ad416 = v_angles[ 1 ];
    
    if ( var_a36ad416 >= 360 || var_a36ad416 <= -360 )
    {
        v_angles = ( 0, 0, 0 );
    }
    
    if ( var_dcc2eee3 >= 0.5 )
    {
        self playsound( #"hash_868e3ed7747ae38" );
    }
    else
    {
        self playsound( #"hash_d4c1b4d970f73ef" );
    }
    
    self thread function_b2c1549();
    self rotateto( var_1df0b136, var_dcc2eee3 );
    self waittill( #"rotatedone" );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xa01209bf, Offset: 0xbd58
// Size: 0x44
function function_b2c1549()
{
    self endon( #"death" );
    wait 0.1;
    self playrumbleonentity( #"hash_1bdf9c4013e4d12f" );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xb1061f85, Offset: 0xbda8
// Size: 0x23c
function function_8e8da19a()
{
    level endon( #"end_game", #"sundial_puzzle" + "_ended_early" );
    self endon( #"death" );
    s_prophecy = level.var_cc9c60d2;
    blind_status_effect = getstatuseffect( "blind_zm_catalyst" );
    
    while ( true )
    {
        s_waitresult = self waittill( #"trigger_activated" );
        e_player = s_waitresult.e_who;
        
        if ( isdefined( s_prophecy.var_3dd6bbe9 ) && s_prophecy.var_3dd6bbe9 )
        {
            if ( isdefined( s_prophecy.var_4bd614ab ) && s_prophecy.var_4bd614ab )
            {
                s_prophecy.var_6a8e51de = e_player;
                s_prophecy.var_113bf6cb = 1;
                s_prophecy.mdl_spear playsound( #"hash_49d17300fbc95a4a" );
            }
            else
            {
                mdl_spear = s_prophecy.mdl_spear;
                
                if ( !isdefined( mdl_spear ) )
                {
                    mdl_spear = e_player;
                }
                
                e_player playsound( #"hash_5af2a9d11f007b9" );
                e_player thread status_effect::status_effect_apply( blind_status_effect, undefined, mdl_spear );
                e_player thread zm_audio::create_and_play_dialog( #"generic", #"response_negative" );
            }
            
            e_player clientfield::increment_to_player( "" + #"hash_11480c2b11f0c92f" );
            s_prophecy.var_3dd6bbe9 = 0;
            level notify( #"hash_79c10e50a279a37f" );
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x79804ebe, Offset: 0xbff0
// Size: 0x1ec
function function_8ed9dd3c()
{
    level endon( #"end_game" );
    s_mirror = struct::get( #"hash_6ac21db894ff6862" );
    str_model = s_mirror.model;
    v_origin = s_mirror.origin;
    v_angles = s_mirror.angles;
    s_mirror struct::delete();
    v_origin -= ( 0, 0, 118 );
    mdl_mirror = util::spawn_model( str_model, v_origin, v_angles );
    mdl_mirror setscale( 0.43 );
    mdl_mirror movez( 118, 5 );
    playrumbleonposition( #"hash_78384ae5c2a95e85", v_origin );
    playsoundatposition( #"hash_396f1597d3662c78", ( 0, 0, 0 ) );
    wait 5 - 1.5;
    level clientfield::set( "" + #"hash_3836d3a94cf05642", 2 );
    level clientfield::set( "" + #"hash_70e157c389c1c02f", 1 );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x7d48cd11, Offset: 0xc1e8
// Size: 0x24c
function init_light()
{
    s_light = spawnstruct();
    level.var_5299790a = s_light;
    s_lid = struct::get( #"hash_629b7a21e0492c7f" );
    s_light.var_7b57e2cc = util::spawn_model( s_lid.model, s_lid.origin, s_lid.angles );
    s_light.var_7b57e2cc setscale( 0.5 );
    s_lid struct::delete();
    level scene::add_scene_func( #"p8_fxanim_zm_red_ankh_chaos_scene", &function_9d73ee19, "init" );
    level thread scene::init( #"p8_fxanim_zm_red_ankh_chaos_scene" );
    
    if ( zm_utility::is_ee_enabled() )
    {
        s_staff = struct::get( #"hash_711f47fcf57e02d6" );
        s_light.mdl_staff = util::spawn_model( s_staff.model, s_staff.origin, s_staff.angles );
        s_staff struct::delete();
        str_shot = "init_idle";
    }
    else
    {
        str_shot = "lower_staff";
        level thread function_f10904df();
    }
    
    level scene::add_scene_func( #"p8_fxanim_zm_red_vapor_altar_ra_arms_bundle", &function_abba38a8, str_shot, str_shot );
    level thread scene::play( #"p8_fxanim_zm_red_vapor_altar_ra_arms_bundle", str_shot );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0xfa7448e6, Offset: 0xc440
// Size: 0x7c
function function_9d73ee19( a_ents )
{
    s_light = level.var_5299790a;
    s_light.var_8d22740d = a_ents[ #"prop 1" ];
    level scene::remove_scene_func( #"p8_fxanim_zm_red_ankh_chaos_scene", &function_9d73ee19, "init" );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 2
// Checksum 0x46bc94df, Offset: 0xc4c8
// Size: 0x7c
function function_abba38a8( a_ents, str_shot )
{
    s_light = level.var_5299790a;
    s_light.var_19d2da88 = a_ents[ #"prop 1" ];
    level scene::remove_scene_func( #"p8_fxanim_zm_red_vapor_altar_ra_arms_bundle", &function_abba38a8, str_shot );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0xca849615, Offset: 0xc550
// Size: 0x12c
function free_ankh_setup( b_skipped )
{
    level endon( #"end_game", #"free_ankh" + "_ended_early" );
    
    if ( b_skipped )
    {
        level thread function_11d400f9();
        return;
    }
    else
    {
        function_11d400f9();
    }
    
    level thread function_38548080();
    level thread function_aabfb424();
    spawner::add_archetype_spawn_function( #"gegenees", &function_d62a2d14 );
    array::thread_all( getaiarchetypearray( #"gegenees" ), &function_d62a2d14 );
    level waittill( #"hash_6a89add74b46c461" );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 2
// Checksum 0x1a7e1bd3, Offset: 0xc688
// Size: 0x194
function free_ankh_cleanup( b_skipped, var_19e802fa )
{
    level notify( #"hash_6a89add74b46c461" );
    s_light = level.var_5299790a;
    s_light.var_5e622c60 = 1;
    level scene::play( #"p8_fxanim_zm_red_ankh_chaos_scene", "Shot 1" );
    
    if ( !b_skipped && !var_19e802fa )
    {
        var_8d22740d = s_light.var_8d22740d;
        a_e_players = util::get_active_players();
        a_e_players = arraysortclosest( a_e_players, var_8d22740d.origin, undefined, 0, 512 );
        
        foreach ( e_player in a_e_players )
        {
            if ( zm_utility::is_player_valid( e_player ) )
            {
                e_player thread zm_audio::create_and_play_dialog( #"generic", #"response_positive" );
                break;
            }
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xf99eecee, Offset: 0xc828
// Size: 0x1ec
function function_11d400f9()
{
    s_start = struct::get( #"hash_b2180b8714f30b" );
    mdl_fx = util::spawn_model( #"tag_origin", s_start.origin );
    s_start struct::delete();
    mdl_fx clientfield::set( "" + #"hash_6d76e4b7a31537af", 1 );
    s_end = struct::get( #"hash_16d7f49b344088ee" );
    v_end = s_end.origin;
    mdl_fx moveto( v_end, 0.5 );
    mdl_fx waittilltimeout( 0.5, #"movedone" );
    mdl_fx playsound( #"hash_772b6a593788929f" );
    mdl_fx clientfield::set( "" + #"hash_6d76e4b7a31537af", 0 );
    level clientfield::increment( "" + #"hash_4d77ba61cd7f3eb7" );
    s_light = level.var_5299790a;
    s_light.var_7b57e2cc delete();
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x846ab0ac, Offset: 0xca20
// Size: 0x1b4
function function_38548080()
{
    level endon( #"end_game", #"free_ankh" + "_ended_early", #"hash_6a89add74b46c461" );
    s_light = level.var_5299790a;
    mdl_ra = s_light.var_19d2da88;
    
    while ( true )
    {
        foreach ( e_player in util::get_active_players() )
        {
            if ( zm_utility::is_player_valid( e_player ) && e_player zm_audio::can_speak() )
            {
                n_dist = distance2dsquared( e_player.origin, mdl_ra.origin );
                
                if ( n_dist <= 128 * 128 )
                {
                    level notify( #"hash_705d83d9c92550de" );
                    e_player thread zm_audio::create_and_play_dialog( #"ra_altar", #"altered_react" );
                    return;
                }
            }
        }
        
        wait 2;
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x414bc514, Offset: 0xcbe0
// Size: 0x80
function function_aabfb424()
{
    level endon( #"end_game", #"free_ankh" + "_ended_early", #"hash_6a89add74b46c461" );
    
    while ( true )
    {
        level waittill( #"hash_5d3012139f083ccb" );
        level thread function_49b3f5aa();
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x1bf1598e, Offset: 0xcc68
// Size: 0x1f0
function function_49b3f5aa()
{
    self notify( "f01c424d82d3513" );
    self endon( "f01c424d82d3513" );
    level endon( #"end_game", #"free_ankh" + "_ended_early", #"end_of_round", #"hash_6a89add74b46c461" );
    n_random_wait = randomfloatrange( 10, 30 );
    wait n_random_wait;
    var_d5bd9bcb = getaiarchetypearray( #"gegenees" );
    
    if ( zm_round_spawning::function_d0db51fc( #"gegenees" ) || var_d5bd9bcb.size > 0 )
    {
        return;
    }
    
    s_target = struct::get( #"hash_2419db3559d2bbcb" );
    v_target = s_target.origin;
    
    while ( true )
    {
        a_s_spawns = level.zm_loc_types[ #"gegenees_location" ];
        
        if ( a_s_spawns.size > 0 )
        {
            s_spawn = arraygetclosest( v_target, a_s_spawns );
            
            while ( true )
            {
                ai_gegenees = zombie_gegenees_util::spawn_single( 1, s_spawn );
                
                if ( isdefined( ai_gegenees ) )
                {
                    return;
                }
                
                util::wait_network_frame();
            }
        }
        
        util::wait_network_frame();
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x17b5c682, Offset: 0xce60
// Size: 0x18c
function function_d62a2d14()
{
    self notify( "63970f0e43bba472" );
    self endon( "63970f0e43bba472" );
    level endon( #"end_game", #"free_ankh" + "_ended_early", #"hash_6a89add74b46c461" );
    self endon( #"death" );
    s_light = level.var_5299790a;
    
    if ( !isdefined( s_light ) || isdefined( s_light.var_5e622c60 ) && s_light.var_5e622c60 )
    {
        return;
    }
    
    s_target = struct::get( #"hash_2419db3559d2bbcb" );
    v_target = s_target.origin;
    
    while ( true )
    {
        self waittill( #"gegenees_shield_blast" );
        n_dist = distancesquared( self.origin, v_target );
        
        if ( n_dist <= 1200 * 1200 && self util::is_looking_at( v_target, undefined, 1 ) )
        {
            level notify( #"hash_6a89add74b46c461" );
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0xb6ac8433, Offset: 0xcff8
// Size: 0xec
function take_ankh_setup( b_skipped )
{
    level endon( #"end_game", #"hash_589a676acbec281a" + "_ended_early" );
    s_loc = struct::get( #"hash_6812ea5a7f9fdf21" );
    
    /#
        if ( b_skipped )
        {
            s_loc struct::delete();
            return;
        }
    #/
    
    e_player = s_loc zm_unitrigger::function_fac87205( &function_8e7bc7d6 );
    e_player thread zm_vo::function_a2bd5a0c( #"hash_78f60d6898d690f" );
    e_player playsound( #"hash_27af4f102b79c3c0" );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 2
// Checksum 0x6bdeac30, Offset: 0xd0f0
// Size: 0xbc
function take_ankh_cleanup( b_skipped, var_19e802fa )
{
    s_loc = struct::get( #"hash_6812ea5a7f9fdf21" );
    
    if ( isdefined( s_loc ) )
    {
        if ( isdefined( s_loc.s_unitrigger ) )
        {
            zm_unitrigger::unregister_unitrigger( s_loc.s_unitrigger );
            s_loc.s_unitrigger = undefined;
        }
        
        s_loc struct::delete();
    }
    
    level scene::play( #"p8_fxanim_zm_red_ankh_chaos_scene", "Shot 2" );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0xcad34798, Offset: 0xd1b8
// Size: 0xbc, Type: bool
function function_8e7bc7d6( e_player )
{
    s_light = level.var_5299790a;
    var_8d22740d = s_light.var_8d22740d;
    v_target = var_8d22740d gettagorigin( "tag_chaos_chunks_all" );
    var_39b20ef6 = e_player zm_utility::is_player_looking_at( v_target, 0.9, 0 );
    b_is_valid = zm_utility::is_player_valid( e_player );
    return var_39b20ef6 && b_is_valid;
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0xf2c94c13, Offset: 0xd280
// Size: 0x10c
function give_ankh_setup( b_skipped )
{
    level endon( #"end_game", #"give_ankh" + "_ended_early" );
    s_loc = struct::get( #"hash_68e5680a6c84cf71" );
    
    /#
        if ( b_skipped )
        {
            s_loc struct::delete();
            return;
        }
    #/
    
    s_light = level.var_5299790a;
    var_19d2da88 = s_light.var_19d2da88;
    s_light.var_7134dc2b = var_19d2da88 gettagorigin( "ankh_jnt" );
    s_loc zm_unitrigger::function_fac87205( &function_4998929a );
    s_loc struct::delete();
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 2
// Checksum 0x5c9a5f59, Offset: 0xd398
// Size: 0xbc
function give_ankh_cleanup( b_skipped, var_19e802fa )
{
    s_loc = struct::get( #"hash_68e5680a6c84cf71" );
    
    if ( isdefined( s_loc ) )
    {
        if ( isdefined( s_loc.s_unitrigger ) )
        {
            zm_unitrigger::unregister_unitrigger( s_loc.s_unitrigger );
            s_loc.s_unitrigger = undefined;
        }
        
        s_loc struct::delete();
    }
    
    level scene::play( #"p8_fxanim_zm_red_vapor_altar_ra_arms_bundle", "give_ankh" );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0x5c2c2be, Offset: 0xd460
// Size: 0x106, Type: bool
function function_4998929a( e_player )
{
    s_light = level.var_5299790a;
    var_39b20ef6 = e_player zm_utility::is_player_looking_at( s_light.var_7134dc2b, 0.9, 0 );
    b_is_valid = zm_utility::is_player_valid( e_player );
    var_ca29a143 = 1;
    
    if ( isdefined( s_light.var_f1e9d276 ) && s_light.var_f1e9d276 )
    {
        w_current = e_player getcurrentweapon();
        var_ca29a143 = is_wonder_weapon( w_current, #"light", 0 );
    }
    
    return var_39b20ef6 && b_is_valid && var_ca29a143;
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0x8411302, Offset: 0xd570
// Size: 0x5c
function defend_ra_setup( b_skipped )
{
    level endon( #"end_game", #"defend_ra" + "_ended_early" );
    
    /#
        if ( b_skipped )
        {
            return;
        }
    #/
    
    function_ecbc541d();
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 2
// Checksum 0xcbb6d30f, Offset: 0xd5d8
// Size: 0x310
function defend_ra_cleanup( b_skipped, var_19e802fa )
{
    function_9f390ef0( 0 );
    s_unitrigger = struct::get( #"hash_56ba037bba790648" );
    
    if ( isdefined( s_unitrigger ) && isdefined( s_unitrigger.s_unitrigger ) )
    {
        zm_unitrigger::unregister_unitrigger( s_unitrigger.s_unitrigger );
        s_unitrigger.s_unitrigger = undefined;
    }
    
    s_ww = struct::get( #"hash_1cc363b6ee27ea18" );
    
    if ( isdefined( s_ww ) )
    {
        s_ww struct::delete();
    }
    
    t_close = getent( "t_light_fuel_ignite_close", "targetname" );
    t_far = getent( "t_light_fuel_ignite_far", "targetname" );
    t_close delete();
    t_far delete();
    a_s_scenes = struct::get_array( #"hash_eef2e238d701a8e" );
    
    foreach ( s_scene in a_s_scenes )
    {
        s_blocked = struct::get( s_scene.target );
        s_blocked struct::delete();
        s_scene scene::stop();
        s_scene struct::delete();
    }
    
    var_2a28e6d4 = getaiarchetypearray( #"skeleton" );
    
    foreach ( var_862206ea in var_2a28e6d4 )
    {
        var_862206ea.var_67faa700 = undefined;
        var_862206ea val::reset( #"hash_644a9e9d528c2f44", "ignoreall" );
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xbdee7c5b, Offset: 0xd8f0
// Size: 0x918
function function_ecbc541d()
{
    level endon( #"end_game", #"defend_ra" + "_ended_early", #"hash_4140f0472ba137c" );
    s_light = level.var_5299790a;
    var_19d2da88 = s_light.var_19d2da88;
    level.var_8016c0d8 = 40;
    s_light.var_f1e9d276 = 1;
    s_light.var_7134dc2b = var_19d2da88 gettagorigin( "staff_jnt" );
    s_unitrigger = struct::get( #"hash_56ba037bba790648" );
    s_ww = struct::get( #"hash_1cc363b6ee27ea18" );
    var_d93f6af3 = s_ww.model;
    var_151563d0 = s_ww.origin;
    var_97e6bcd7 = s_ww.angles;
    s_ww struct::delete();
    s_runes = struct::get( #"hash_ea56ff869e65f82" );
    var_8d5cca6b[ 0 ] = util::spawn_model( #"p8_zm_red_rune_ra_01", s_runes.origin, s_runes.angles );
    var_8d5cca6b[ 1 ] = util::spawn_model( #"p8_zm_red_rune_ra_02", s_runes.origin, s_runes.angles );
    var_8d5cca6b[ 2 ] = util::spawn_model( #"p8_zm_red_rune_ra_03", s_runes.origin, s_runes.angles );
    s_runes struct::delete();
    s_light.var_8d5cca6b = var_8d5cca6b;
    t_close = getent( "t_light_fuel_ignite_close", "targetname" );
    t_far = getent( "t_light_fuel_ignite_far", "targetname" );
    t_close thread function_6af7dacb();
    t_far thread function_6af7dacb();
    t_close triggerenable( 0 );
    t_far triggerenable( 0 );
    callback::on_connect( &function_d45f304f );
    array::thread_all( getplayers(), &function_d45f304f );
    s_light.var_1b52cf99 = level.var_b897ed83;
    level.var_b897ed83 = &function_173c692b;
    a_e_players = util::get_active_players();
    a_e_players = arraysortclosest( a_e_players, var_19d2da88.origin );
    
    foreach ( e_player in a_e_players )
    {
        if ( zm_utility::is_player_valid( e_player ) )
        {
            e_player thread zm_audio::create_and_play_dialog( #"ra_altar", #"ankh_restored" );
            break;
        }
    }
    
    s_unitrigger zm_unitrigger::create( &function_4998929a );
    
    while ( true )
    {
        while ( true )
        {
            s_waitresult = s_unitrigger waittill( #"trigger_activated" );
            e_player = s_waitresult.e_who;
            
            if ( zm_utility::is_player_valid( e_player ) )
            {
                w_current = e_player getcurrentweapon();
                
                if ( is_wonder_weapon( w_current, #"light", 0 ) )
                {
                    level.var_8016c0d8 = e_player getammocount( w_current );
                    break;
                }
            }
        }
        
        e_player thread zm_audio::create_and_play_dialog( #"generic", #"response_positive" );
        mdl_ww = util::spawn_model( var_d93f6af3, var_151563d0, var_97e6bcd7 );
        mdl_ww setscale( 2.2 );
        mdl_ww playsound( #"hash_6d4d114514ea4566" );
        s_light.var_24a1abd7 = mdl_ww;
        mdl_ww playloopsound( #"hash_5a4a005ac681a695" );
        var_26eac22c = e_player.var_7e19c3db;
        e_player.var_7e19c3db = 1;
        e_player thread function_cd5fc887( var_26eac22c );
        a_w_charged = function_36afae35( #"light" );
        
        foreach ( w_charged in a_w_charged )
        {
            if ( e_player hasweapon( w_charged ) )
            {
                e_player takeweapon( w_charged );
                break;
            }
        }
        
        wait 2;
        level flag::set( #"infinite_round_spawning" );
        mdl_ww stoploopsound();
        mdl_ww playsound( #"hash_2612baeb741d5600" );
        level thread function_3288a0d2();
        level thread function_202bd7b8();
        level thread function_a30dee24();
        level waittill( #"hash_2f511b37fc55c45a" );
        a_e_players = util::get_active_players();
        a_e_players = arraysortclosest( a_e_players, var_19d2da88.origin, undefined, 0, 1024 );
        a_e_players = array::randomize( a_e_players );
        
        foreach ( e_player in a_e_players )
        {
            if ( zm_utility::is_player_valid( e_player ) )
            {
                e_player thread zm_audio::create_and_play_dialog( #"generic", #"response_negative" );
                break;
            }
        }
        
        function_9f390ef0();
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0x1015dc46, Offset: 0xe210
// Size: 0x4a
function function_cd5fc887( var_26eac22c )
{
    level endon( #"end_game" );
    self endon( #"disconnect" );
    wait 2;
    self.var_7e19c3db = var_26eac22c;
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x72ca6661, Offset: 0xe268
// Size: 0x246
function function_3288a0d2()
{
    level endon( #"end_game", #"defend_ra" + "_ended_early", #"hash_2f511b37fc55c45a" );
    level thread function_e5352d71();
    t_close = getent( "t_light_fuel_ignite_close", "targetname" );
    t_far = getent( "t_light_fuel_ignite_far", "targetname" );
    
    while ( true )
    {
        t_close triggerenable( 1 );
        t_far triggerenable( 1 );
        level clientfield::set( "" + #"hash_43972920fa314daa", 1 );
        level thread function_6511349e();
        s_waitresult = level waittill( #"hash_d0d79bd22a685c1" );
        n_cf = s_waitresult.n_cf;
        level clientfield::set( "" + #"hash_43972920fa314daa", n_cf );
        
        if ( n_cf == 2 )
        {
            t_far triggerenable( 0 );
        }
        
        var_83aeafd6 = s_waitresult.var_83aeafd6;
        
        if ( isdefined( var_83aeafd6 ) )
        {
            level thread function_1c1d4313();
            
            while ( isdefined( var_83aeafd6 ) && isalive( var_83aeafd6 ) )
            {
                waitframe( 1 );
            }
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xc928d40b, Offset: 0xe4b8
// Size: 0x140
function function_6511349e()
{
    level endon( #"end_game", #"defend_ra" + "_ended_early" );
    s_light = level.var_5299790a;
    mdl_ra = s_light.var_19d2da88;
    
    if ( !isdefined( s_light.var_93919a1f ) )
    {
        s_light.var_93919a1f = 60;
    }
    
    n_start_time = gettime();
    s_waitresult = level waittilltimeout( s_light.var_93919a1f, #"hash_d0d79bd22a685c1" );
    
    if ( s_waitresult._notify == #"hash_d0d79bd22a685c1" )
    {
        offset_con = gettime();
        s_light.var_93919a1f -= float( offset_con - n_start_time ) / 1000;
        return;
    }
    
    level notify( #"hash_4140f0472ba137c" );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x811288cc, Offset: 0xe600
// Size: 0x240
function function_e5352d71()
{
    level endon( #"end_game", #"defend_ra" + "_ended_early", #"hash_2f511b37fc55c45a" );
    s_light = level.var_5299790a;
    var_8d5cca6b = s_light.var_8d5cca6b;
    n_runes = var_8d5cca6b.size;
    var_e41dced6 = 60 / ( n_runes + 1 );
    
    foreach ( var_740e1e0e in var_8d5cca6b )
    {
        n_time_left = var_e41dced6;
        
        while ( true )
        {
            n_start_time = gettime();
            s_waitresult = level waittilltimeout( n_time_left, #"hash_d0d79bd22a685c1" );
            
            if ( s_waitresult._notify == #"hash_d0d79bd22a685c1" )
            {
                offset_con = gettime();
                n_time_passed = float( offset_con - n_start_time ) / 1000;
                n_time_left -= n_time_passed;
                var_83aeafd6 = s_waitresult.var_83aeafd6;
                
                while ( isdefined( var_83aeafd6 ) && isalive( var_83aeafd6 ) )
                {
                    waitframe( 1 );
                }
                
                continue;
            }
            
            break;
        }
        
        var_740e1e0e clientfield::set( "" + #"hash_125706eb7b363924", 1 );
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xfafc6753, Offset: 0xe848
// Size: 0x68
function function_1c1d4313()
{
    level endon( #"end_game", #"defend_ra" + "_ended_early", #"hash_7eef54a6ef1d07e8" );
    wait 5;
    level notify( #"hash_2f511b37fc55c45a" );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x13eeb5af, Offset: 0xe8b8
// Size: 0x33c
function function_202bd7b8()
{
    level endon( #"end_game", #"defend_ra" + "_ended_early", #"hash_4140f0472ba137c", #"hash_2f511b37fc55c45a" );
    n_random_wait = randomfloatrange( 10, 30 );
    wait n_random_wait;
    s_light = level.var_5299790a;
    mdl_ra = s_light.var_19d2da88;
    v_ra = mdl_ra.origin;
    
    while ( true )
    {
        if ( !zm_transform::function_abf1dcb4( #"blight_father" ) )
        {
            a_ai_blight_father = getaiarchetypearray( #"blight_father" );
            a_ai_blight_father = arraysortclosest( a_ai_blight_father, v_ra, undefined, 0, 1024 );
            
            if ( a_ai_blight_father.size == 0 )
            {
                a_ai_zombies = getaiarchetypearray( #"zombie" );
                a_ai_zombies = arraysortclosest( a_ai_zombies, v_ra, undefined, 0, 1024 );
                a_ai_zombies = array::randomize( a_ai_zombies );
                
                foreach ( ai_zombie in a_ai_zombies )
                {
                    if ( isdefined( ai_zombie.completed_emerging_into_playable_area ) && ai_zombie.completed_emerging_into_playable_area && !zm_utility::is_magic_bullet_shield_enabled( ai_zombie ) && !( isdefined( ai_zombie.marked_for_death ) && ai_zombie.marked_for_death ) && !( isdefined( ai_zombie.var_94c53b42 ) && ai_zombie.var_94c53b42 ) && !( isdefined( ai_zombie.var_52531256 ) && ai_zombie.var_52531256 ) && !( isdefined( ai_zombie.var_3c394b1b ) && ai_zombie.var_3c394b1b ) && ai_zombie zm_ai_utility::function_db610082() )
                    {
                        level thread zm_transform::function_9acf76e6( ai_zombie, #"blight_father" );
                        return;
                    }
                }
            }
        }
        
        wait 1;
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x33e5e8bb, Offset: 0xec00
// Size: 0x388
function function_a30dee24()
{
    level endon( #"end_game", #"defend_ra" + "_ended_early", #"hash_4140f0472ba137c", #"hash_2f511b37fc55c45a" );
    s_light = level.var_5299790a;
    a_s_spawns = struct::get_array( #"hash_33fd28ee963853d6" );
    
    while ( true )
    {
        var_2a28e6d4 = getaiarchetypearray( #"skeleton" );
        
        if ( var_2a28e6d4.size <= 2 )
        {
            s_spawn = array::random( a_s_spawns );
            
            while ( true )
            {
                var_862206ea = zombie_skeleton_util::function_1ea880bd( 1, s_spawn, undefined, 0 );
                
                if ( isdefined( var_862206ea ) )
                {
                    break;
                }
                
                util::wait_network_frame();
            }
            
            if ( level.zombie_total > 0 )
            {
                level.zombie_total--;
            }
            
            if ( level.zombie_respawns > 0 )
            {
                level.zombie_respawns--;
            }
            
            if ( !isdefined( var_2a28e6d4 ) )
            {
                var_2a28e6d4 = [];
            }
            else if ( !isarray( var_2a28e6d4 ) )
            {
                var_2a28e6d4 = array( var_2a28e6d4 );
            }
            
            var_2a28e6d4[ var_2a28e6d4.size ] = var_862206ea;
        }
        
        var_83aeafd6 = s_light.var_83aeafd6;
        
        if ( !isdefined( var_83aeafd6 ) || !isalive( var_83aeafd6 ) || isdefined( var_83aeafd6.fake_death ) && var_83aeafd6.fake_death )
        {
            level notify( #"hash_7eef54a6ef1d07e8" );
            
            foreach ( var_862206ea in var_2a28e6d4 )
            {
                if ( isdefined( var_862206ea.var_4e9f7942 ) && var_862206ea.var_4e9f7942 && !( isdefined( var_862206ea.fake_death ) && var_862206ea.fake_death ) && !( isdefined( var_862206ea.aat_turned ) && var_862206ea.aat_turned ) )
                {
                    s_light.var_83aeafd6 = var_862206ea;
                    var_862206ea.var_d3ddc8ed = 1;
                    var_862206ea.var_126d7bef = 1;
                    var_862206ea.ignore_round_spawn_failsafe = 1;
                    var_862206ea.b_ignore_cleanup = 1;
                    var_862206ea.var_3c394b1b = 1;
                    var_862206ea thread function_e4162ab8();
                    break;
                }
            }
        }
        
        util::wait_network_frame();
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x569c15e8, Offset: 0xef90
// Size: 0x394
function function_e4162ab8()
{
    level endon( #"end_game", #"defend_ra" + "_ended_early", #"hash_4140f0472ba137c", #"hash_2f511b37fc55c45a" );
    self endon( #"death", #"hash_4a05d34e6e2ebdf0" );
    self thread watch_for_fake_death();
    waitframe( 1 );
    
    if ( !( isdefined( self.completed_emerging_into_playable_area ) && self.completed_emerging_into_playable_area ) )
    {
        self.completed_emerging_into_playable_area = 1;
        self notify( #"completed_emerging_into_playable_area" );
    }
    
    self zombie_utility::set_zombie_run_cycle_override_value( "sprint" );
    self val::set( #"hash_644a9e9d528c2f44", "ignoreall", 1 );
    a_s_scenes = struct::get_array( #"hash_eef2e238d701a8e" );
    s_scene = arraygetclosest( self.origin, a_s_scenes );
    v_scene = s_scene.origin;
    s_source = struct::get( #"hash_28652987572c5885" );
    v_source = s_source.origin;
    self.var_67faa700 = 1;
    self setgoal( v_scene, 1 );
    
    while ( true )
    {
        n_dist = distance2dsquared( self.origin, v_scene );
        
        if ( n_dist <= 64 * 64 )
        {
            break;
        }
        
        waitframe( 1 );
    }
    
    self notify( #"goal" );
    n_dot = self math::get_dot_right( v_source );
    
    if ( n_dot > 0 )
    {
        str_scene = #"aib_vign_cust_zm_red_spar_swrd_shld_block_r_00";
    }
    else
    {
        str_scene = #"aib_vign_cust_zm_red_spar_swrd_shld_block_l_00";
    }
    
    self.var_37f733c3 = 1;
    s_scene scene::stop();
    self thread function_fbbee9d0( s_scene, str_scene );
    level waittilltimeout( 4, #"light_fuel_blocked" );
    s_blocked = struct::get( s_scene.target );
    n_cf = s_blocked.var_333e279d;
    level notify( #"hash_d0d79bd22a685c1", { #var_83aeafd6:self, #n_cf:n_cf } );
    self thread function_554bdd28( s_scene, str_scene );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 2
// Checksum 0x7cca575d, Offset: 0xf330
// Size: 0xcc
function function_fbbee9d0( s_scene, str_scene )
{
    level endon( #"end_game", #"defend_ra" + "_ended_early", #"hash_4140f0472ba137c", #"hash_2f511b37fc55c45a" );
    self endon( #"death", #"hash_4a05d34e6e2ebdf0" );
    s_scene scene::play( str_scene, "init", self );
    s_scene thread scene::play( str_scene, "loop", self );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x4d2094c9, Offset: 0xf408
// Size: 0x106
function watch_for_fake_death()
{
    level endon( #"end_game", #"defend_ra" + "_ended_early", #"hash_4140f0472ba137c", #"hash_2f511b37fc55c45a" );
    self endon( #"death" );
    
    if ( !( isdefined( self.fake_death ) && self.fake_death ) )
    {
        while ( !( isdefined( self.fake_death ) && self.fake_death ) )
        {
            waitframe( 1 );
        }
    }
    
    if ( isdefined( self.var_37f733c3 ) && self.var_37f733c3 )
    {
        self util::stop_magic_bullet_shield();
        self kill();
        return;
    }
    
    self notify( #"hash_4a05d34e6e2ebdf0" );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 2
// Checksum 0xdc432755, Offset: 0xf518
// Size: 0xfc
function function_554bdd28( s_scene, str_scene )
{
    level endon( #"end_game", #"defend_ra" + "_ended_early", #"hash_4140f0472ba137c" );
    self endon( #"death" );
    level waittill( #"hash_2f511b37fc55c45a" );
    s_scene scene::play( str_scene, "exit", self );
    self val::reset( #"hash_644a9e9d528c2f44", "ignoreall" );
    self.var_67faa700 = undefined;
    self.var_126d7bef = undefined;
    self.ignore_round_spawn_failsafe = undefined;
    self.b_ignore_cleanup = undefined;
    self thread zombie_utility::round_spawn_failsafe();
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x7ae1b2f, Offset: 0xf620
// Size: 0x24, Type: bool
function function_173c692b()
{
    if ( isdefined( self.var_d3ddc8ed ) && self.var_d3ddc8ed )
    {
        return false;
    }
    
    return true;
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x8101e681, Offset: 0xf650
// Size: 0x2a0
function function_6af7dacb()
{
    level endon( #"end_game", #"defend_ra" + "_ended_early", #"hash_4140f0472ba137c" );
    self endon( #"death" );
    
    while ( true )
    {
        s_waitresult = self waittill( #"trigger" );
        e_victim = s_waitresult.activator;
        
        if ( isdefined( e_victim ) && isactor( e_victim ) )
        {
            var_dee5880d = 0;
            var_8e22b0cb = 0;
            
            switch ( e_victim.archetype )
            {
                case #"zombie":
                    var_dee5880d = 1;
                    break;
                case #"catalyst":
                    var_dee5880d = 1;
                    break;
                case #"gegenees":
                    var_8e22b0cb = 1;
                    n_damage_percent = 0.1;
                    break;
            }
            
            if ( var_dee5880d && !zm_utility::is_magic_bullet_shield_enabled( e_victim ) )
            {
                gibserverutils::annihilate( e_victim );
                e_victim kill();
                continue;
            }
            
            if ( var_8e22b0cb && !( isdefined( e_victim.var_77e2b5bf ) && e_victim.var_77e2b5bf ) )
            {
                e_victim.var_77e2b5bf = 1;
                e_victim thread function_124c623e();
            }
            
            if ( isdefined( n_damage_percent ) && !( isdefined( e_victim.var_a3156ec0 ) && e_victim.var_a3156ec0 ) )
            {
                e_victim.var_a3156ec0 = 1;
                n_damage = int( e_victim.maxhealth * n_damage_percent );
                e_victim dodamage( n_damage, e_victim.origin );
                e_victim thread function_89a22f4e();
            }
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x7a6fedd6, Offset: 0xf8f8
// Size: 0x52
function function_124c623e()
{
    self endon( #"death" );
    self thread ai::stun( 3 );
    wait 3 + 4;
    self.var_77e2b5bf = undefined;
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x41a73115, Offset: 0xf958
// Size: 0x26
function function_89a22f4e()
{
    self endon( #"death" );
    wait 1;
    self.var_a3156ec0 = undefined;
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x5ae3d794, Offset: 0xf988
// Size: 0x2aa
function function_d45f304f()
{
    level endon( #"end_game", #"defend_ra" + "_ended_early", #"hash_4140f0472ba137c" );
    self endon( #"disconnect" );
    
    if ( isdefined( self.var_59378b6a ) && self.var_59378b6a )
    {
        return;
    }
    
    self.var_59378b6a = 1;
    self.var_6e4f26e5 = 0;
    t_close = getent( "t_light_fuel_ignite_close", "targetname" );
    t_far = getent( "t_light_fuel_ignite_far", "targetname" );
    self thread function_c2d50fdc( t_close );
    self thread function_c2d50fdc( t_far );
    
    while ( true )
    {
        self waittill( #"hash_465838105ca1e0c2" );
        self allowsprint( 0 );
        self allowslide( 0 );
        self setmovespeedscale( 0.5 );
        
        if ( !isbot( self ) )
        {
            self clientfield::set_to_player( "" + #"hash_25cfe5e9786d97e7", 1 );
        }
        
        self.var_de9eef5a = 1;
        
        while ( true )
        {
            self waittill( #"hash_488d86d3e6f92c" );
            
            if ( self.var_6e4f26e5 <= 0 )
            {
                break;
            }
        }
        
        self allowsprint( 1 );
        self allowslide( 1 );
        self setmovespeedscale( 1 );
        
        if ( !isbot( self ) )
        {
            self clientfield::set_to_player( "" + #"hash_25cfe5e9786d97e7", 0 );
        }
        
        self.var_de9eef5a = undefined;
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0x70075310, Offset: 0xfc40
// Size: 0x21a
function function_c2d50fdc( var_7ecf0d18 )
{
    level endon( #"end_game", #"defend_ra" + "_ended_early", #"hash_4140f0472ba137c" );
    self endon( #"disconnect" );
    var_7ecf0d18 endon( #"death" );
    
    while ( true )
    {
        while ( !zm_utility::is_player_valid( self ) || self getstance() == "crouch" || self getstance() == "prone" || self issliding() || !self istouching( var_7ecf0d18 ) || !var_7ecf0d18 istriggerenabled() )
        {
            waitframe( 1 );
        }
        
        self.var_6e4f26e5++;
        self notify( #"hash_465838105ca1e0c2" );
        
        while ( zm_utility::is_player_valid( self ) && self getstance() != "crouch" && self getstance() != "prone" && !self issliding() && self istouching( var_7ecf0d18 ) && var_7ecf0d18 istriggerenabled() )
        {
            waitframe( 1 );
        }
        
        self.var_6e4f26e5--;
        self notify( #"hash_488d86d3e6f92c" );
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0x2b340170, Offset: 0xfe68
// Size: 0x34c
function function_9f390ef0( var_3561625b = 1 )
{
    level flag::clear( #"infinite_round_spawning" );
    s_light = level.var_5299790a;
    s_light.var_6c41dc66 = undefined;
    s_light.var_93919a1f = undefined;
    
    if ( isdefined( s_light.var_24a1abd7 ) )
    {
        s_light.var_24a1abd7 stoploopsound();
        s_light.var_24a1abd7 delete();
    }
    
    level clientfield::set( "" + #"hash_43972920fa314daa", 0 );
    t_close = getent( "t_light_fuel_ignite_close", "targetname" );
    t_far = getent( "t_light_fuel_ignite_far", "targetname" );
    t_close triggerenable( 0 );
    t_far triggerenable( 0 );
    callback::remove_on_connect( &function_d45f304f );
    
    if ( isdefined( s_light.var_1b52cf99 ) )
    {
        level.var_b897ed83 = s_light.var_1b52cf99;
    }
    
    foreach ( e_player in getplayers() )
    {
        if ( isdefined( e_player.var_de9eef5a ) && e_player.var_de9eef5a )
        {
            e_player allowsprint( 1 );
            e_player allowslide( 1 );
            e_player setmovespeedscale( 1 );
            
            if ( !isbot( e_player ) )
            {
                e_player clientfield::set_to_player( "" + #"hash_25cfe5e9786d97e7", 0 );
            }
            
            e_player.var_de9eef5a = undefined;
        }
    }
    
    if ( var_3561625b )
    {
        var_8d5cca6b = s_light.var_8d5cca6b;
        
        if ( isdefined( var_8d5cca6b ) )
        {
            array::run_all( var_8d5cca6b, &clientfield::set, "" + #"hash_125706eb7b363924", 0 );
        }
    }
    
    level thread function_e952e361();
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xab31f51a, Offset: 0x101c0
// Size: 0x16e
function function_e952e361()
{
    level endon( #"end_game" );
    
    while ( true )
    {
        var_92121491 = spawner::simple_spawn_single( "sp_light_return" );
        
        if ( isdefined( var_92121491 ) )
        {
            break;
        }
        
        util::wait_network_frame();
    }
    
    var_92121491 clientfield::set( "" + #"hash_7fc7f7b5958831d4", 1 );
    wait 1;
    
    if ( isdefined( var_92121491 ) )
    {
        nd_start = getvehiclenode( "nd_light_return", "targetname" );
        var_92121491 vehicle::get_on_and_go_path( nd_start );
        
        if ( isdefined( var_92121491 ) )
        {
            var_92121491 clientfield::set( "" + #"hash_7fc7f7b5958831d4", 0 );
            var_92121491 delete();
        }
    }
    
    level thread zm_red_ww_quests::function_887b7e4b( #"light", level.var_8016c0d8 );
    level.var_8016c0d8 = undefined;
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0x5f14af6, Offset: 0x10338
// Size: 0x1cc
function take_staff_setup( b_skipped )
{
    level endon( #"end_game", #"take_staff" + "_ended_early" );
    
    if ( !b_skipped )
    {
        wait 2;
    }
    
    s_light = level.var_5299790a;
    var_8d5cca6b = s_light.var_8d5cca6b;
    
    if ( isdefined( var_8d5cca6b ) )
    {
        var_8d5cca6b = array::remove_undefined( var_8d5cca6b );
        array::delete_all( var_8d5cca6b );
    }
    
    level thread scene::play( #"p8_fxanim_zm_red_ra_wall_bundle" );
    var_4b6d2c14 = getent( "script_brush_hole_blend_01", "targetname" );
    var_4b6d2c14 delete();
    s_loc = struct::get( #"hash_1ab7c0d94efd8f5b" );
    
    /#
        if ( b_skipped )
        {
            s_loc struct::delete();
            return;
        }
    #/
    
    level thread function_de6854c2();
    e_player = s_loc zm_unitrigger::function_fac87205( &function_4340daa );
    e_player playsound( #"hash_7209c8ab82d14e04" );
    s_loc struct::delete();
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 2
// Checksum 0xca304af4, Offset: 0x10510
// Size: 0xdc
function take_staff_cleanup( b_skipped, var_19e802fa )
{
    level notify( #"hash_5fcd23307b562aca" );
    s_loc = struct::get( #"hash_1ab7c0d94efd8f5b" );
    
    if ( isdefined( s_loc ) )
    {
        if ( isdefined( s_loc.s_unitrigger ) )
        {
            zm_unitrigger::unregister_unitrigger( s_loc.s_unitrigger );
            s_loc.s_unitrigger = undefined;
        }
        
        s_loc struct::delete();
    }
    
    s_light = level.var_5299790a;
    s_light.mdl_staff delete();
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x57c6c0f2, Offset: 0x105f8
// Size: 0x22c
function function_de6854c2()
{
    level endon( #"end_game" );
    s_dest = struct::get( #"hash_1ab7c0d94efd8f5b" );
    v_dest = s_dest.origin;
    b_played = 0;
    
    while ( true )
    {
        foreach ( e_player in util::get_active_players() )
        {
            if ( zm_utility::is_player_valid( e_player ) && e_player zm_audio::can_speak() )
            {
                n_dist = distance2dsquared( e_player.origin, v_dest );
                
                if ( n_dist <= 64 * 64 )
                {
                    b_played = e_player zm_vo::function_a2bd5a0c( #"hash_54a1b97aabbc232e" );
                    
                    if ( isdefined( b_played ) && b_played )
                    {
                        break;
                    }
                }
            }
        }
        
        if ( isdefined( b_played ) && b_played )
        {
            break;
        }
        
        wait 1;
    }
    
    if ( isdefined( b_played ) && b_played )
    {
        level zm_vo::function_3c173d37( ( 0, 0, 0 ), 2147483647 );
        level zm_audio::sndvoxoverride( 1 );
        function_7b345f6d( #"hash_9d670ad099b664c" );
        level zm_audio::sndvoxoverride( 0 );
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0xed6e980b, Offset: 0x10830
// Size: 0x22
function function_4340daa( e_player )
{
    return zm_utility::is_player_valid( e_player );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0x860f647, Offset: 0x10860
// Size: 0x13c
function give_staff_setup( b_skipped )
{
    level endon( #"end_game", #"give_staff" + "_ended_early" );
    s_loc = struct::get( #"hash_56ba037bba790648" );
    
    /#
        if ( b_skipped )
        {
            s_loc struct::delete();
            return;
        }
    #/
    
    s_light = level.var_5299790a;
    var_19d2da88 = s_light.var_19d2da88;
    s_light.var_f1e9d276 = 0;
    s_light.var_7134dc2b = var_19d2da88 gettagorigin( "staff_jnt" );
    e_player = s_loc zm_unitrigger::function_fac87205( &function_4998929a );
    s_light.var_6f46a620 = e_player;
    e_player playsound( #"hash_339e50753ce9c39b" );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 2
// Checksum 0x8662fa3b, Offset: 0x109a8
// Size: 0x3bc
function give_staff_cleanup( b_skipped, var_19e802fa )
{
    s_loc = struct::get( #"hash_56ba037bba790648" );
    
    if ( isdefined( s_loc ) )
    {
        if ( isdefined( s_loc.s_unitrigger ) )
        {
            zm_unitrigger::unregister_unitrigger( s_loc.s_unitrigger );
            s_loc.s_unitrigger = undefined;
        }
        
        s_loc struct::delete();
    }
    
    s_light = level.var_5299790a;
    e_player = s_light.var_6f46a620;
    
    if ( zm_utility::is_player_valid( e_player ) )
    {
        e_player thread zm_audio::create_and_play_dialog( #"generic", #"response_positive" );
    }
    
    level thread function_f10904df();
    level scene::play( #"p8_fxanim_zm_red_vapor_altar_ra_arms_bundle", "aim_staff" );
    
    if ( !b_skipped && !var_19e802fa )
    {
        level clientfield::set( "" + #"hash_158233cdc645bef6", 1 );
        
        foreach ( e_player in getplayers() )
        {
            e_player clientfield::increment_to_player( "" + #"hash_492a33037a532fe0" );
        }
        
        wait 10;
        level clientfield::set( "" + #"hash_158233cdc645bef6", 0 );
    }
    
    level thread function_5436fd42();
    var_fbefc1ba = struct::get( #"hash_6873469a7f41e2af" );
    s_beam_end = struct::get( #"hash_258b38a5968b7b5a" );
    var_fbefc1ba struct::delete();
    s_beam_end struct::delete();
    level thread scene::play( #"p8_fxanim_zm_red_vapor_altar_ra_arms_bundle", "lower_staff" );
    
    if ( b_skipped || var_19e802fa )
    {
        level thread function_82b3a72();
    }
    else
    {
        function_82b3a72();
    }
    
    level flag::set( #"flag_light_completed" );
    playsoundatposition( #"hash_48910bcc61ab65be", ( 0, 0, 0 ) );
    level.var_5299790a struct::delete();
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xd5c01ff3, Offset: 0x10d70
// Size: 0x134
function function_f10904df()
{
    level endon( #"end_game" );
    level flag::wait_till( "all_players_spawned" );
    s_light = level.var_5299790a;
    
    while ( !isdefined( s_light.var_19d2da88 ) )
    {
        waitframe( 1 );
    }
    
    mdl_arms = s_light.var_19d2da88;
    mdl_fx = util::spawn_model( #"tag_origin", mdl_arms gettagorigin( "fx_tag_ra_scepter" ), mdl_arms gettagangles( "fx_tag_ra_scepter" ) );
    mdl_fx linkto( mdl_arms, "fx_tag_ra_scepter" );
    mdl_fx clientfield::set( "" + #"hash_431f319e4b8fe9db", 1 );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xda9ade4d, Offset: 0x10eb0
// Size: 0xf4
function function_5436fd42()
{
    level endon( #"end_game" );
    s_rumble = struct::get( #"hash_6873469a7f41e2af" );
    
    if ( !isdefined( s_rumble ) )
    {
        return;
    }
    
    v_rumble = s_rumble.origin;
    playrumbleonposition( #"hash_bd49fc7b8840e7d", v_rumble );
    s_waitresult = level waittilltimeout( 60, #"light_second_part" );
    
    if ( s_waitresult._notify == "light_second_part" )
    {
        playrumbleonposition( #"hash_bd49cc7b8840964", v_rumble );
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xec14d817, Offset: 0x10fb0
// Size: 0xc4
function function_82b3a72()
{
    level endon( #"end_game" );
    level thread scene::play( #"p8_fxanim_zm_red_bathhouse_mirror_bundle" );
    level waittill( #"light_has_risen" );
    level clientfield::set( "" + #"hash_53e684a319647b40", 2 );
    level clientfield::set( "" + #"hash_4f59799617fef9c7", 1 );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0x474e27ff, Offset: 0x11080
// Size: 0x10c
function function_29a8dcd4( b_skipped )
{
    zm_sq::start( #"prophecy" );
    zm_sq::start( #"light" );
    level zm_ui_inventory::function_7df6bb60( #"zm_red_objective_progress", 4 );
    
    /#
        if ( b_skipped )
        {
            return;
        }
    #/
    
    level endon( #"end_game", #"hash_1b1abb2af5960bfe" + "_ended_early" );
    level thread function_59ef31c5();
    level flag::wait_till_all( array( #"flag_prophecy_completed", #"flag_light_completed" ) );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 2
// Checksum 0xc8a9e62c, Offset: 0x11198
// Size: 0x158
function function_488a4eb2( b_skipped, var_19e802fa )
{
    level flag::set( #"flag_prophecy_completed" );
    level flag::set( #"flag_light_completed" );
    
    /#
        if ( b_skipped || var_19e802fa )
        {
            a_str_steps = array( #"prophecy", #"light" );
            
            foreach ( str_step in a_str_steps )
            {
                s_ee = level._ee[ str_step ];
                var_1c9b219a = s_ee.steps.size - 1;
                zm_sq::function_f2dd8601( str_step, var_1c9b219a );
            }
        }
    #/
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xf26ab6c0, Offset: 0x112f8
// Size: 0x2b4
function function_59ef31c5()
{
    level endon( #"end_game", #"hash_1b1abb2af5960bfe" + "_setup_completed", #"hash_1b1abb2af5960bfe" + "_ended_early" );
    wait 10;
    a_e_players = util::get_active_players();
    a_e_players = array::randomize( a_e_players );
    
    foreach ( e_player in a_e_players )
    {
        if ( zm_utility::is_player_valid( e_player ) )
        {
            b_played = e_player zm_vo::function_a2bd5a0c( #"hash_7ffb03b3b746f056" );
            break;
        }
    }
    
    if ( isdefined( b_played ) && b_played )
    {
        function_7b345f6d( #"hash_27b9dcc6ada75bb4" );
    }
    
    level waittill( #"end_of_round", #"between_round_over", #"start_of_round", #"flag_prophecy_completed", #"flag_light_completed" );
    wait 10;
    b_played = 0;
    a_e_players = util::get_active_players();
    a_e_players = array::randomize( a_e_players );
    
    foreach ( e_player in a_e_players )
    {
        if ( zm_utility::is_player_valid( e_player ) )
        {
            b_played = e_player zm_vo::function_a2bd5a0c( #"hash_106b08864b5ae288" );
            break;
        }
    }
    
    if ( isdefined( b_played ) && b_played )
    {
        level thread function_7b345f6d( #"hash_678f44703c046db6" );
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x2f40efbf, Offset: 0x115b8
// Size: 0x454
function init_play()
{
    s_play = spawnstruct();
    level.var_28dcf408 = s_play;
    var_38e73d19[ #"death" ] = "" + #"hash_4aeb7fcdd8302eaa";
    var_38e73d19[ #"earth" ] = "" + #"hash_7a99ff005314c5fc";
    var_38e73d19[ #"air" ] = "" + #"hash_7f85dc0ce20a6f2c";
    var_38e73d19[ #"light" ] = "" + #"hash_4e3e66f200f76f34";
    var_38e73d19[ #"return" ] = "" + #"hash_565ca9982285f23e";
    s_play.var_38e73d19 = var_38e73d19;
    a_s_spotlights[ #"death" ] = struct::get( #"hash_11302005e130b7eb" );
    a_s_spotlights[ #"earth" ] = struct::get( #"hash_2b292979020933aa" );
    a_s_spotlights[ #"air" ] = struct::get( #"hash_286a392e24892dee" );
    a_s_spotlights[ #"light" ] = struct::get( #"hash_5ae30fa5823821ee" );
    a_s_spotlights[ 1 ] = struct::get( #"hash_2038ad2a6cbb9188" );
    a_s_spotlights[ 2 ] = struct::get( #"hash_2038b02a6cbb96a1" );
    a_s_spotlights[ 3 ] = struct::get( #"hash_2038af2a6cbb94ee" );
    a_s_spotlights[ 4 ] = struct::get( #"hash_2038b22a6cbb9a07" );
    s_play.a_s_spotlights = a_s_spotlights;
    var_ed2fbe40[ #"death" ] = "" + #"hash_74aaba5c17a71e0d";
    var_ed2fbe40[ #"earth" ] = "" + #"hash_7e49e921c4dd052f";
    var_ed2fbe40[ #"air" ] = "" + #"hash_9d4aab5c25b93ff";
    var_ed2fbe40[ #"light" ] = "" + #"hash_58e58259618537e7";
    s_play.var_ed2fbe40 = var_ed2fbe40;
    var_cbf56f63 = getent( "mdl_play_leave", "targetname" );
    s_play.var_cbf56f63 = var_cbf56f63;
    
    if ( !zm_utility::is_ee_enabled() && !zm_utility::is_trials() )
    {
        array::delete_all( a_s_spotlights );
        var_cbf56f63 delete();
        return;
    }
    
    var_cbf56f63 notsolid();
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0x5d88e3cf, Offset: 0x11a18
// Size: 0x7c
function play_setup( b_skipped )
{
    level endon( #"end_game", #"play" + "_ended_early" );
    level zm_ui_inventory::function_7df6bb60( #"zm_red_objective_progress", 5 );
    
    /#
        if ( b_skipped )
        {
            return;
        }
    #/
    
    play_think();
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 2
// Checksum 0x17de354c, Offset: 0x11aa0
// Size: 0x57c
function play_cleanup( b_skipped, var_19e802fa )
{
    level.no_powerups = undefined;
    level.var_58f509b6 = undefined;
    level.var_14f649ad = undefined;
    array::notify_all( getplayers(), #"hash_3f61d1172dd383b2" );
    array::notify_all( getplayers(), #"hash_1ff39e85b7b8e833" );
    s_play = level.var_28dcf408;
    
    if ( isdefined( s_play.var_1b52cf99 ) )
    {
        level.var_b897ed83 = s_play.var_1b52cf99;
    }
    
    a_s_spotlights = s_play.a_s_spotlights;
    array::delete_all( a_s_spotlights );
    vol_stage = getent( "vol_play_away", "targetname" );
    var_64c757e0 = getent( "vol_play_home", "targetname" );
    vol_stage delete();
    var_64c757e0 delete();
    var_cbf56f63 = s_play.var_cbf56f63;
    var_cbf56f63 delete();
    level clientfield::set( "" + #"hash_d80665c22fafd1e", 0 );
    playsoundatposition( #"hash_48910acc61ab640b", ( 0, 0, 0 ) );
    playsoundatposition( #"hash_396f1597d3662c78", ( 0, 0, 0 ) );
    
    if ( !b_skipped && !var_19e802fa )
    {
        level thread function_1ddccc6c();
        util::delay( 1, "end_game", &zm_audio::function_bca32e49, #"playhouse", #"complete" );
    }
    
    /#
        if ( var_19e802fa )
        {
            foreach ( ai_zombie in getaiarray() )
            {
                if ( isdefined( ai_zombie.var_be2fc36d ) && ai_zombie.var_be2fc36d )
                {
                    ai_zombie kill();
                }
            }
            
            level flag::set( "<dev string:x38>" );
            level flag::clear( "<dev string:x48>" );
            level flag::clear( "<dev string:x5e>" );
            callback::remove_on_ai_killed( &function_93e711a6 );
            callback::remove_on_spawned( &function_b0457d15 );
            var_a3db07f9 = s_play.var_a3db07f9;
            var_8d8bdb5b = s_play.var_8d8bdb5b;
            var_c755ceee = s_play.var_c755ceee;
            var_e630bec4 = array( var_a3db07f9, var_8d8bdb5b, var_c755ceee );
            var_e630bec4 = array::remove_undefined( var_e630bec4 );
            array::delete_all( var_e630bec4 );
            var_ed2fbe40 = s_play.var_ed2fbe40;
            
            foreach ( var_8c827c67 in var_ed2fbe40 )
            {
                level clientfield::set( var_8c827c67, 0 );
            }
        }
    #/
    
    level clientfield::set( "" + #"hash_31a10d565ae05ddb", 1 );
    level exploder::exploder( "fxexp_mq_mirror_light_waterfall" );
    level.var_28dcf408 struct::delete();
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xae525a2, Offset: 0x12028
// Size: 0x1020
function play_think()
{
    level endon( #"end_game", #"play" + "_ended_early" );
    s_play = level.var_28dcf408;
    s_play.var_a3db07f9 = spawnstruct();
    s_play.var_8d8bdb5b = spawnstruct();
    s_play.var_c755ceee = spawnstruct();
    s_play.var_8ed0f199 = array( 0, 1, 2, 3, 4, 5, 6, 7, 8 );
    s_play.var_75c04ca3 = arraycopy( s_play.var_8ed0f199 );
    s_play.var_d5353976 = -1;
    s_play.var_1b52cf99 = level.var_b897ed83;
    level.var_b897ed83 = &function_64b2fedf;
    zm::register_zombie_damage_override_callback( &function_c3d19eae );
    a_s_spotlights = s_play.a_s_spotlights;
    var_ed2fbe40 = s_play.var_ed2fbe40;
    var_cbf56f63 = s_play.var_cbf56f63;
    var_cbf56f63 notsolid();
    var_4ebe6ac0 = 0;
    level thread function_9348c9a4();
    
    while ( true )
    {
        while ( true )
        {
            function_c170200a();
            s_play.n_players_ready = 0;
            
            foreach ( e_player in util::get_active_players() )
            {
                if ( e_player function_3d581a6( #"death", 0 ) )
                {
                    str_ww = #"death";
                }
                else if ( e_player function_3d581a6( #"earth", 0 ) )
                {
                    str_ww = #"earth";
                }
                else if ( e_player function_3d581a6( #"air", 0 ) )
                {
                    str_ww = #"air";
                }
                else if ( e_player function_3d581a6( #"light", 0 ) )
                {
                    str_ww = #"light";
                }
                
                if ( isdefined( str_ww ) )
                {
                    a_s_spotlights[ str_ww ] thread function_7413c414( str_ww );
                }
            }
            
            level notify( #"hash_52b0d62a28ee7a99" );
            level thread function_1f96a60e();
            level thread clear_lockon_after_grappleattackstart();
            b_ready = function_9ccbf284();
            
            if ( b_ready === 1 )
            {
                break;
            }
            
            array::notify_all( getplayers(), #"hash_3f61d1172dd383b2" );
            
            foreach ( var_8c827c67 in var_ed2fbe40 )
            {
                level clientfield::set( var_8c827c67, 0 );
            }
        }
        
        a_e_players = util::get_active_players();
        a_e_participants = [];
        a_str_ww = [];
        
        foreach ( e_player in a_e_players )
        {
            foreach ( str_ww in array( #"death", #"earth", #"air", #"light" ) )
            {
                if ( e_player function_3d581a6( str_ww, 0 ) )
                {
                    a_e_participants[ str_ww ] = e_player;
                    
                    if ( !isdefined( a_str_ww ) )
                    {
                        a_str_ww = [];
                    }
                    else if ( !isarray( a_str_ww ) )
                    {
                        a_str_ww = array( a_str_ww );
                    }
                    
                    if ( !isinarray( a_str_ww, str_ww ) )
                    {
                        a_str_ww[ a_str_ww.size ] = str_ww;
                    }
                    
                    break;
                }
            }
        }
        
        level notify( #"play_all_players_ready" );
        s_play.a_e_participants = a_e_participants;
        s_play.var_38993303 = a_e_participants.size;
        s_play.a_str_ww = a_str_ww;
        level.no_powerups = 1;
        level.disable_nuke_delay_spawning = 1;
        level.var_58f509b6 = 1;
        level.var_14f649ad = 1;
        level flag::clear( "spawn_zombies" );
        level flag::set( "pause_round_timeout" );
        level flag::set( "hold_round_end" );
        level thread zm_utility::function_9ad5aeb1();
        playsoundatposition( #"hash_2175b725b43ec02d", ( 0, 0, 0 ) );
        level thread zm_audio::sndmusicsystem_playstate( "play" );
        
        foreach ( str_ww, e_player in a_e_participants )
        {
            e_player notify( #"hash_3f61d1172dd383b2" );
            e_player thread function_41577fb();
            e_player thread function_86d3bb1( str_ww );
        }
        
        callback::on_ai_killed( &function_93e711a6 );
        callback::on_spawned( &function_b0457d15 );
        
        foreach ( var_8c827c67 in var_ed2fbe40 )
        {
            level clientfield::set( var_8c827c67, 0 );
        }
        
        var_cbf56f63 solid();
        level clientfield::set( "" + #"hash_d80665c22fafd1e", 1 );
        s_waitresult = level waittilltimeout( 3, #"hash_285de4ce79135552" );
        
        if ( s_waitresult._notify != #"hash_285de4ce79135552" )
        {
            level thread function_14727b8f();
            s_waitresult = level waittill( #"hash_666e960831b9abc4", #"hash_285de4ce79135552" );
        }
        
        level.no_powerups = undefined;
        level.var_58f509b6 = undefined;
        level.var_14f649ad = undefined;
        level thread zm_utility::function_9ad5aeb1( 0 );
        level thread function_caeca1d3();
        callback::remove_on_ai_killed( &function_93e711a6 );
        callback::remove_on_spawned( &function_b0457d15 );
        array::notify_all( getplayers(), #"hash_3f61d1172dd383b2" );
        array::notify_all( getplayers(), #"hash_1ff39e85b7b8e833" );
        
        foreach ( var_8c827c67 in var_ed2fbe40 )
        {
            level clientfield::set( var_8c827c67, 0 );
        }
        
        var_cbf56f63 notsolid();
        level clientfield::set( "" + #"hash_d80665c22fafd1e", 0 );
        
        if ( s_waitresult._notify == #"hash_666e960831b9abc4" )
        {
            /#
                iprintlnbold( "<dev string:x6f>" );
            #/
            
            level thread function_4d79231e();
            music::setmusicstate( "none" );
            break;
        }
        
        music::setmusicstate( "none" );
        playsoundatposition( #"hash_dd13a4fbdd9c86d", ( 0, 0, 0 ) );
        e_player = s_waitresult.e_player;
        
        if ( isdefined( e_player ) )
        {
            e_player thread function_2efcf3bf();
        }
        
        /#
            iprintlnbold( "<dev string:x87>" );
            str_reason = s_waitresult.str_reason;
            
            if ( isdefined( str_reason ) )
            {
                switch ( str_reason )
                {
                    case #"late_mark":
                        iprintlnbold( "<dev string:x9d>" );
                        break;
                    case #"late_backstage":
                        iprintlnbold( "<dev string:xb6>" );
                        break;
                    case #"late_kills":
                        iprintlnbold( "<dev string:xcb>" );
                        break;
                    case #"left_stage":
                        iprintlnbold( "<dev string:xe9>" );
                        break;
                    case #"left_backstage":
                        iprintlnbold( "<dev string:xf6>" );
                        break;
                    case #"no_ww":
                        iprintlnbold( "<dev string:x107>" );
                        break;
                    case #"downed":
                        iprintlnbold( "<dev string:x122>" );
                        break;
                    case #"rezzed":
                        iprintlnbold( "<dev string:x132>" );
                        break;
                    case #"dropped_ww":
                        iprintlnbold( "<dev string:x147>" );
                        break;
                    case #"hash_a3d841d32682b30":
                        iprintlnbold( "<dev string:x154>" );
                        break;
                }
            }
            
            if ( isdefined( e_player ) )
            {
                str_name = e_player.name;
                
                if ( isdefined( str_name ) )
                {
                    iprintlnbold( str_name );
                }
            }
        #/
        
        var_4ebe6ac0++;
        
        if ( var_4ebe6ac0 >= 5 && !zm_utility::is_trials() )
        {
            /#
                iprintlnbold( "<dev string:x16c>" );
            #/
            
            var_4ebe6ac0 = 0;
            level waittill( #"between_round_over" );
            continue;
        }
        
        foreach ( var_8c827c67 in var_ed2fbe40 )
        {
            level clientfield::set( var_8c827c67, 0 );
        }
        
        if ( zm_utility::is_trials() )
        {
            zm_trial::fail( #"hash_3cd5b19b981e5c3c", getplayers() );
            zm_trial::function_ae725d63( 5 );
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xd3d28a20, Offset: 0x13050
// Size: 0x20c
function function_1f96a60e()
{
    level endon( #"end_game" );
    s_play = level.var_28dcf408;
    
    if ( isdefined( s_play.var_134fadcb ) && s_play.var_134fadcb )
    {
        return;
    }
    
    s_play.var_134fadcb = 1;
    a_e_players = util::get_active_players();
    a_e_players = array::randomize( a_e_players );
    
    foreach ( e_player in a_e_players )
    {
        if ( zm_utility::is_player_valid( e_player ) && e_player zm_audio::can_speak() )
        {
            if ( e_player zm_characters::is_character( array( #"hash_7180c6cf382f6010", #"hash_14e91ceb9a7b3eb6" ) ) )
            {
                b_played = e_player zm_vo::function_a2bd5a0c( #"hash_573c7474847811" );
                
                if ( isdefined( b_played ) && b_played )
                {
                    e_player thread zm_vo::vo_say( #"hash_242d4dda05399a77", undefined, undefined, undefined, undefined, 1 );
                }
            }
            else
            {
                e_player thread zm_audio::create_and_play_dialog( #"playhouse", #"enter" );
            }
            
            break;
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x930eb9d1, Offset: 0x13268
// Size: 0x94
function function_2efcf3bf()
{
    level endon( #"end_game", #"play" + "_ended_early" );
    self endon( #"death" );
    wait 1;
    
    if ( zm_utility::is_player_valid( self ) )
    {
        self thread zm_audio::create_and_play_dialog( #"generic", #"response_negative" );
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x6d5aa31f, Offset: 0x13308
// Size: 0x136
function function_c170200a()
{
    level endon( #"end_game", #"play" + "_ended_early" );
    
    while ( true )
    {
        var_24a19a92 = 1;
        
        foreach ( e_player in util::get_active_players() )
        {
            if ( !zm_utility::is_player_valid( e_player ) || !e_player function_dc5aa56f() || !is_wonder_weapon( e_player getcurrentweapon(), undefined, 0 ) )
            {
                var_24a19a92 = 0;
                break;
            }
        }
        
        if ( var_24a19a92 )
        {
            break;
        }
        
        waitframe( 1 );
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xf0e7e274, Offset: 0x13448
// Size: 0x138
function clear_lockon_after_grappleattackstart()
{
    level endon( #"end_game", #"play" + "_ended_early", #"play_all_players_ready" );
    
    while ( true )
    {
        foreach ( e_player in util::get_active_players() )
        {
            if ( !zm_utility::is_player_valid( e_player ) || !e_player function_dc5aa56f() || !is_wonder_weapon( e_player getcurrentweapon(), undefined, 0 ) )
            {
                level notify( #"hash_2fd7b0f35f31ef25" );
                return;
            }
        }
        
        waitframe( 1 );
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xfa107d15, Offset: 0x13588
// Size: 0xa6
function function_9ccbf284()
{
    level endon( #"end_game", #"play" + "_ended_early", #"hash_2fd7b0f35f31ef25" );
    s_play = level.var_28dcf408;
    
    while ( true )
    {
        a_e_players = util::get_active_players();
        
        if ( s_play.n_players_ready >= a_e_players.size )
        {
            return 1;
        }
        
        waitframe( 1 );
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 13
// Checksum 0xe1d09bc4, Offset: 0x13638
// Size: 0x13c
function function_c3d19eae( death, inflictor, attacker, damage, flags, mod, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype )
{
    if ( !( isdefined( self.var_be2fc36d ) && self.var_be2fc36d ) )
    {
        return;
    }
    
    str_ww = self.var_8ca159b2;
    b_uncharged = self.var_71ecb9db;
    
    if ( is_wonder_weapon( weapon, str_ww, b_uncharged ) && mod !== "MOD_MELEE" )
    {
        return ( self.health + 666 );
    }
    
    a_w_charged = function_36afae35();
    
    if ( isinarray( a_w_charged, weapon ) )
    {
        return 0;
    }
    
    return damage;
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xed4b0c7a, Offset: 0x13780
// Size: 0x24, Type: bool
function function_64b2fedf()
{
    if ( isdefined( self.var_be2fc36d ) && self.var_be2fc36d )
    {
        return false;
    }
    
    return true;
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0x7c93311f, Offset: 0x137b0
// Size: 0x168
function function_93e711a6( s_params )
{
    if ( !( isdefined( self.var_be2fc36d ) && self.var_be2fc36d ) || isdefined( self.var_b07f4eb9 ) && self.var_b07f4eb9 )
    {
        return;
    }
    
    self.var_b07f4eb9 = 1;
    str_ww = self.var_8ca159b2;
    b_uncharged = self.var_71ecb9db;
    w_weapon = s_params.weapon;
    str_mod = s_params.smeansofdeath;
    
    if ( is_wonder_weapon( w_weapon, str_ww, b_uncharged ) && str_mod !== "MOD_MELEE" )
    {
        s_play = level.var_28dcf408;
        s_play.var_155837a1[ str_ww ]++;
        return;
    }
    
    e_player = s_params.eattacker;
    level notify( #"hash_285de4ce79135552", { #str_reason:#"no_ww", #e_player:e_player } );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x7c9c5b21, Offset: 0x13920
// Size: 0xac
function function_caeca1d3()
{
    level endon( #"end_game", #"play" + "_ended_early", #"play_all_players_ready" );
    wait 10;
    level.disable_nuke_delay_spawning = undefined;
    level flag::set( "spawn_zombies" );
    level flag::clear( "pause_round_timeout" );
    level flag::clear( "hold_round_end" );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x9231e1ce, Offset: 0x139d8
// Size: 0x1d4
function function_9348c9a4()
{
    level endon( #"end_game" );
    wait 10;
    level zm_vo::function_3c173d37( ( 0, 0, 0 ), 2147483647 );
    level zm_audio::sndvoxoverride( 1 );
    waitframe( 1 );
    
    while ( true )
    {
        b_played = 0;
        a_e_players = util::get_active_players();
        a_e_players = array::randomize( a_e_players );
        
        foreach ( e_player in a_e_players )
        {
            if ( zm_utility::is_player_valid( e_player ) && e_player zm_audio::can_speak() )
            {
                b_played = e_player zm_vo::function_a2bd5a0c( #"hash_a2f572761972fa2" );
                
                if ( isdefined( b_played ) && b_played )
                {
                    break;
                }
            }
        }
        
        if ( isdefined( b_played ) && b_played )
        {
            break;
        }
        
        wait 1;
    }
    
    function_7b345f6d( #"hash_6ee819ce1d175470" );
    level zm_audio::sndvoxoverride( 0 );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0xb5a98cc0, Offset: 0x13bb8
// Size: 0x2a8
function function_7413c414( str_ww )
{
    level endon( #"end_game", #"play" + "_ended_early", #"hash_2fd7b0f35f31ef25", #"play_all_players_ready" );
    self endon( #"death" );
    s_play = level.var_28dcf408;
    var_ed2fbe40 = s_play.var_ed2fbe40;
    var_8c827c67 = var_ed2fbe40[ str_ww ];
    level clientfield::set( var_8c827c67, 1 );
    
    while ( true )
    {
        while ( true )
        {
            var_548144c0 = 0;
            
            foreach ( e_player in util::get_active_players() )
            {
                if ( e_player function_813c4629( self, str_ww ) )
                {
                    var_548144c0 = 1;
                    break;
                }
            }
            
            if ( var_548144c0 )
            {
                break;
            }
            
            waitframe( 1 );
        }
        
        if ( !isdefined( e_player ) )
        {
            continue;
        }
        
        e_player thread function_e028a26f( str_ww, 1 );
        b_success = e_player function_5d2011fa( self, str_ww, 3 );
        
        if ( !isdefined( b_success ) )
        {
            b_success = 0;
        }
        
        if ( !b_success )
        {
            if ( isdefined( e_player ) )
            {
                e_player notify( #"hash_3f61d1172dd383b2" );
            }
            
            continue;
        }
        
        s_play.n_players_ready++;
        
        while ( true )
        {
            if ( !isdefined( e_player ) || !e_player function_813c4629( self, str_ww ) )
            {
                break;
            }
            
            waitframe( 1 );
        }
        
        if ( isdefined( e_player ) )
        {
            e_player notify( #"hash_3f61d1172dd383b2" );
        }
        
        s_play.n_players_ready--;
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 2
// Checksum 0xe18850d1, Offset: 0x13e68
// Size: 0xd2, Type: bool
function function_813c4629( s_spotlight, str_ww )
{
    b_is_valid = zm_utility::is_player_valid( self );
    var_c04e7375 = 1;
    
    if ( isdefined( str_ww ) )
    {
        var_c04e7375 = self function_3d581a6( str_ww, 0 );
    }
    
    n_dist = distance2dsquared( self.origin, s_spotlight.origin );
    var_a9c01904 = n_dist <= 64 * 64;
    return b_is_valid && var_c04e7375 && var_a9c01904;
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 3
// Checksum 0x1ea82553, Offset: 0x13f48
// Size: 0x118, Type: bool
function function_5d2011fa( s_spotlight, str_ww, n_duration )
{
    level endon( #"end_game", #"play" + "_ended_early", #"hash_285de4ce79135552" );
    self endon( #"entering_last_stand", #"death" );
    
    if ( n_duration <= 0 )
    {
        return true;
    }
    
    n_start_time = gettime();
    
    while ( self function_813c4629( s_spotlight, str_ww ) )
    {
        n_current_time = gettime();
        n_time_passed = float( n_current_time - n_start_time ) / 1000;
        
        if ( n_time_passed >= n_duration )
        {
            return true;
        }
        
        waitframe( 1 );
    }
    
    return false;
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 3
// Checksum 0x4ef34f5f, Offset: 0x14068
// Size: 0x194
function function_e028a26f( str_ww, var_9410d484 = 1, b_return = 0 )
{
    self endon( #"disconnect" );
    s_play = level.var_28dcf408;
    var_a5e426e5 = s_play.var_38e73d19;
    str_cf = var_a5e426e5[ str_ww ];
    
    if ( !isbot( self ) )
    {
        if ( var_9410d484 )
        {
            self clientfield::set_to_player( str_cf, 1 );
        }
        
        if ( b_return )
        {
            self clientfield::set_to_player( "" + #"hash_565ca9982285f23e", 1 );
        }
    }
    
    self thread function_12d27b4f();
    self waittill( #"hash_3f61d1172dd383b2" );
    
    if ( !isbot( self ) )
    {
        self clientfield::set_to_player( str_cf, 0 );
        self clientfield::set_to_player( "" + #"hash_565ca9982285f23e", 0 );
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xda2af542, Offset: 0x14208
// Size: 0x4e
function function_12d27b4f()
{
    self endon( #"disconnect", #"hash_3f61d1172dd383b2" );
    level waittill( #"end_game" );
    self notify( #"hash_3f61d1172dd383b2" );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xcd92a79f, Offset: 0x14260
// Size: 0x120
function function_41577fb()
{
    level endon( #"end_game", #"play" + "_ended_early", #"hash_666e960831b9abc4", #"hash_285de4ce79135552" );
    
    if ( isdefined( self ) )
    {
        s_waitresult = self waittill( #"entering_last_stand", #"death", #"fake_death" );
    }
    
    if ( s_waitresult._notify == "fake_death" )
    {
        var_e84738a3 = #"hash_a3d841d32682b30";
    }
    else
    {
        var_e84738a3 = #"downed";
    }
    
    level notify( #"hash_285de4ce79135552", { #str_reason:var_e84738a3, #e_player:self } );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0x566ef1c, Offset: 0x14388
// Size: 0xf0
function function_86d3bb1( str_ww )
{
    level endon( #"end_game", #"play" + "_ended_early", #"hash_666e960831b9abc4", #"hash_285de4ce79135552" );
    self endon( #"entering_last_stand", #"death" );
    
    while ( self function_3d581a6( str_ww, 0 ) )
    {
        waitframe( 1 );
    }
    
    level notify( #"hash_285de4ce79135552", { #str_reason:#"dropped_ww", #e_player:self } );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xe92fd719, Offset: 0x14480
// Size: 0x50
function function_b0457d15()
{
    level notify( #"hash_285de4ce79135552", { #str_reason:#"rezzed", #e_player:self } );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0x1d43ad42, Offset: 0x144d8
// Size: 0x256
function function_36afae35( str_ww = "" )
{
    switch ( str_ww )
    {
        case #"death":
            a_w_charged = array( level.w_hand_charon, level.w_hand_charon_charged, level.w_hand_charon_upgraded );
            break;
        case #"earth":
            a_w_charged = array( level.w_hand_gaia, level.w_hand_gaia_charged, level.w_hand_gaia_upgraded );
            break;
        case #"air":
            a_w_charged = array( level.w_hand_ouranos, level.w_hand_ouranos_charged, level.w_hand_ouranos_upgraded );
            break;
        case #"light":
            a_w_charged = array( level.w_hand_hemera, level.w_hand_hemera_charged, level.w_hand_hemera_upgraded );
            break;
        default:
            a_w_death = function_36afae35( #"death" );
            a_w_earth = function_36afae35( #"earth" );
            a_w_air = function_36afae35( #"air" );
            a_w_light = function_36afae35( #"light" );
            a_w_charged = arraycombine( a_w_death, a_w_earth, 0, 0 );
            a_w_charged = arraycombine( a_w_charged, a_w_air, 0, 0 );
            a_w_charged = arraycombine( a_w_charged, a_w_light, 0, 0 );
            break;
    }
    
    return a_w_charged;
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0x7046d45d, Offset: 0x14738
// Size: 0xf6
function function_a67dc10( str_ww )
{
    switch ( str_ww )
    {
        case #"death":
            w_uncharged = level.w_hand_charon_uncharged;
            break;
        case #"earth":
            w_uncharged = level.w_hand_gaia_uncharged;
            break;
        case #"air":
            w_uncharged = level.w_hand_ouranos_uncharged;
            break;
        case #"light":
            w_uncharged = level.w_hand_hemera_uncharged;
            break;
        default:
            w_uncharged = array( level.w_hand_charon_uncharged, level.w_hand_gaia_uncharged, level.w_hand_ouranos_uncharged, level.w_hand_hemera_uncharged );
            break;
    }
    
    return w_uncharged;
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 2
// Checksum 0x7cf7e606, Offset: 0x14838
// Size: 0x11a, Type: bool
function function_3d581a6( str_ww, b_uncharged = 0 )
{
    if ( b_uncharged )
    {
        a_w_ww = function_a67dc10( str_ww );
        
        if ( !isdefined( a_w_ww ) )
        {
            a_w_ww = [];
        }
        else if ( !isarray( a_w_ww ) )
        {
            a_w_ww = array( a_w_ww );
        }
    }
    else
    {
        a_w_ww = function_36afae35( str_ww );
    }
    
    foreach ( w_ww in a_w_ww )
    {
        if ( self hasweapon( w_ww ) )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 3
// Checksum 0x5398280b, Offset: 0x14960
// Size: 0xca
function is_wonder_weapon( w_weapon, str_ww, b_uncharged = 0 )
{
    if ( !isdefined( w_weapon ) )
    {
        return 0;
    }
    
    if ( b_uncharged )
    {
        a_w_ww = function_a67dc10( str_ww );
        
        if ( !isdefined( a_w_ww ) )
        {
            a_w_ww = [];
        }
        else if ( !isarray( a_w_ww ) )
        {
            a_w_ww = array( a_w_ww );
        }
    }
    else
    {
        a_w_ww = function_36afae35( str_ww );
    }
    
    return isinarray( a_w_ww, w_weapon );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x88918890, Offset: 0x14a38
// Size: 0x8c0
function function_14727b8f()
{
    level endon( #"end_game", #"play" + "_ended_early", #"hash_285de4ce79135552" );
    function_a6ec87a7();
    s_play = level.var_28dcf408;
    a_s_spotlights = s_play.a_s_spotlights;
    a_s_spotlights = array( a_s_spotlights[ 1 ], a_s_spotlights[ 2 ], a_s_spotlights[ 3 ], a_s_spotlights[ 4 ] );
    a_e_participants = s_play.a_e_participants;
    array::thread_all( a_e_participants, &function_5ea46511 );
    var_551a187 = [];
    var_55b0fa0c = [];
    
    for ( n_act = 1; n_act <= 3 ; n_act++ )
    {
        /#
            iprintlnbold( "<dev string:x180>" + n_act + "<dev string:x187>" );
        #/
        
        switch ( n_act )
        {
            case 1:
                s_act = s_play.var_a3db07f9;
                break;
            case 2:
                s_act = s_play.var_8d8bdb5b;
                var_8088b8ed = 0;
                break;
            case 3:
                s_act = s_play.var_c755ceee;
                break;
        }
        
        var_d8d4faff = 0;
        var_c3815c7 = s_act.var_c3815c7;
        var_37c7bb4d = s_act.var_37c7bb4d;
        n_parts = var_c3815c7.size;
        
        for ( i = 0; i < n_parts ; i++ )
        {
            switch ( n_act )
            {
                case 2:
                    var_d8d4faff = math::cointoss();
                    
                    if ( !var_d8d4faff )
                    {
                        var_8088b8ed++;
                        
                        if ( var_8088b8ed >= 2 )
                        {
                            var_8088b8ed = 0;
                            var_d8d4faff = 1;
                        }
                    }
                    
                    break;
                case 3:
                    var_d8d4faff = 2;
                    break;
            }
            
            s_play.var_ef5091fc = 0;
            a_str_ww = var_c3815c7[ i ];
            a_str_tasks = var_37c7bb4d[ i ];
            s_play.var_ecc915b5 = 0;
            
            if ( isinarray( a_str_ww, #"air" ) )
            {
                n_index = array::find( a_str_ww, #"air" );
                
                if ( a_str_tasks[ n_index ] === #"charged" )
                {
                    s_play.var_ecc915b5 = 1;
                }
            }
            
            var_39324db2 = arraycopy( a_s_spotlights );
            
            foreach ( str_ww, e_player in a_e_participants )
            {
                if ( isinarray( a_str_ww, str_ww ) && isinarray( var_551a187, str_ww ) )
                {
                    s_previous = var_55b0fa0c[ str_ww ];
                    a_s_adjusted = arraycopy( var_39324db2 );
                    arrayremovevalue( a_s_adjusted, s_previous );
                    s_spotlight = arraygetfarthest( e_player.origin, a_s_adjusted );
                    arrayremovevalue( var_39324db2, s_spotlight );
                    var_55b0fa0c[ str_ww ] = s_spotlight;
                }
            }
            
            var_551a187 = [];
            
            foreach ( str_ww, e_player in a_e_participants )
            {
                if ( isinarray( a_str_ww, str_ww ) )
                {
                    if ( !isdefined( var_551a187 ) )
                    {
                        var_551a187 = [];
                    }
                    else if ( !isarray( var_551a187 ) )
                    {
                        var_551a187 = array( var_551a187 );
                    }
                    
                    var_551a187[ var_551a187.size ] = str_ww;
                    s_spotlight = var_55b0fa0c[ str_ww ];
                    
                    if ( !isdefined( s_spotlight ) )
                    {
                        s_spotlight = arraygetfarthest( e_player.origin, var_39324db2 );
                        arrayremovevalue( var_39324db2, s_spotlight );
                        var_55b0fa0c[ str_ww ] = s_spotlight;
                    }
                    
                    n_task = array::find( a_str_ww, str_ww );
                    str_task = a_str_tasks[ n_task ];
                    n_spotlight = array::find( a_s_spotlights, s_spotlight );
                    n_spotlight++;
                    e_player thread function_9cb5a6ac( str_ww, str_task, n_act, n_spotlight, var_d8d4faff );
                    continue;
                }
                
                var_55b0fa0c[ str_ww ] = undefined;
                e_player thread function_9cb5a6ac( str_ww, #"return", n_act );
            }
            
            level waittill( #"hash_6f04da8e7237740" );
            level thread function_b927f16();
            wait 1;
        }
        
        if ( n_act < 3 )
        {
            s_play.var_ef5091fc = 0;
            
            foreach ( str_ww, e_player in a_e_participants )
            {
                e_player thread function_9cb5a6ac( str_ww, #"return", n_act );
            }
            
            level waittill( #"hash_6f04da8e7237740" );
            array::thread_all( a_e_participants, &function_5ea46511 );
            level thread function_b927f16();
        }
        
        /#
            iprintlnbold( "<dev string:x180>" + n_act + "<dev string:x190>" );
        #/
        
        level notify( #"play_act_completed" );
        
        if ( n_act < 3 )
        {
            playsoundatposition( #"hash_83542f629d907c8", ( 0, 0, 0 ) );
            level thread function_759871d0();
            wait 10;
            continue;
        }
        
        playsoundatposition( #"hash_c775906a283558d", ( 0, 0, 0 ) );
    }
    
    level notify( #"hash_666e960831b9abc4" );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x5d695f2c, Offset: 0x15300
// Size: 0xfc
function function_b927f16()
{
    s_play = level.var_28dcf408;
    
    if ( s_play.var_75c04ca3.size == 0 )
    {
        s_play.var_75c04ca3 = arraycopy( s_play.var_8ed0f199 );
    }
    
    arrayremovevalue( s_play.var_75c04ca3, s_play.var_d5353976 );
    var_d40bf404 = array::random( s_play.var_75c04ca3 );
    arrayremovevalue( s_play.var_75c04ca3, var_d40bf404 );
    s_play.var_d5353976 = var_d40bf404;
    level clientfield::set( "" + #"play_fanfare", var_d40bf404 );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x7df9f383, Offset: 0x15408
// Size: 0xfc
function function_4d79231e()
{
    level endon( #"end_game" );
    wait 2;
    level clientfield::set( "" + #"play_fanfare", 8 );
    wait 1;
    level clientfield::set( "" + #"play_fanfare", 5 );
    wait 3;
    level clientfield::set( "" + #"play_fanfare", 9 );
    wait 3;
    level clientfield::set( "" + #"play_fanfare", 0 );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xaf3bfba5, Offset: 0x15510
// Size: 0x7c
function function_759871d0()
{
    level endon( #"end_game", #"play" + "_ended_early", #"hash_285de4ce79135552" );
    wait 1;
    level thread zm_audio::function_bca32e49( #"generic", #"response_positive" );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x9b7795d0, Offset: 0x15598
// Size: 0x724
function function_a6ec87a7()
{
    level endon( #"end_game", #"play" + "_ended_early", #"hash_285de4ce79135552" );
    s_play = level.var_28dcf408;
    a_str_ww = s_play.a_str_ww;
    a_str_tasks = array( #"uncharged", #"charged" );
    
    for ( i = 1; i <= 3 ; i++ )
    {
        switch ( i )
        {
            case 1:
                s_act = s_play.var_a3db07f9;
                var_c877d37f = 50;
                var_a3ef3c8c = 25;
                var_8175d38 = 0;
                n_parts = 3;
                break;
            case 2:
                s_act = s_play.var_8d8bdb5b;
                var_c877d37f = 75;
                var_a3ef3c8c = 50;
                var_8175d38 = 25;
                n_parts = 4;
                break;
            case 3:
                s_act = s_play.var_c755ceee;
                var_c877d37f = 100;
                var_a3ef3c8c = 100;
                var_8175d38 = 100;
                n_parts = 5;
                break;
        }
        
        var_c3815c7 = [];
        var_5280384 = array::randomize( a_str_ww );
        
        for ( j = 0; j < n_parts ; j++ )
        {
            var_ec8414b6 = math::cointoss( var_c877d37f );
            var_f2e5b13e = math::cointoss( var_a3ef3c8c );
            var_17cf7caa = math::cointoss( var_8175d38 );
            n_players = 1;
            
            switch ( a_str_ww.size )
            {
                case 2:
                    if ( var_ec8414b6 )
                    {
                        n_players = 2;
                    }
                    
                    break;
                case 3:
                    if ( var_f2e5b13e )
                    {
                        n_players = 3;
                    }
                    else if ( var_ec8414b6 )
                    {
                        n_players = 2;
                    }
                    
                    break;
                case 4:
                    if ( var_17cf7caa )
                    {
                        n_players = 4;
                    }
                    else if ( var_f2e5b13e )
                    {
                        n_players = 3;
                    }
                    else if ( var_ec8414b6 )
                    {
                        n_players = 2;
                    }
                    
                    break;
            }
            
            var_e8e6e6da = [];
            
            for ( k = 0; k < n_players ; k++ )
            {
                str_ww = array::random( var_5280384 );
                
                if ( !isdefined( var_e8e6e6da ) )
                {
                    var_e8e6e6da = [];
                }
                else if ( !isarray( var_e8e6e6da ) )
                {
                    var_e8e6e6da = array( var_e8e6e6da );
                }
                
                var_e8e6e6da[ var_e8e6e6da.size ] = str_ww;
                
                if ( a_str_ww.size > 1 )
                {
                    arrayremovevalue( var_5280384, str_ww );
                    
                    if ( var_5280384.size == 0 )
                    {
                        var_5280384 = array::randomize( a_str_ww );
                        arrayremovevalue( var_5280384, str_ww );
                    }
                }
            }
            
            if ( !isdefined( var_c3815c7 ) )
            {
                var_c3815c7 = [];
            }
            else if ( !isarray( var_c3815c7 ) )
            {
                var_c3815c7 = array( var_c3815c7 );
            }
            
            var_c3815c7[ var_c3815c7.size ] = var_e8e6e6da;
        }
        
        var_37c7bb4d = [];
        var_76b58dd = [];
        var_79dd2c3d = [];
        
        foreach ( part in var_c3815c7 )
        {
            var_f704b824 = [];
            
            for ( j = 0; j < part.size ; j++ )
            {
                str_task = array::random( a_str_tasks );
                str_ww = part[ j ];
                
                if ( isdefined( str_ww ) )
                {
                    var_f804950f = var_76b58dd[ str_ww ];
                    
                    if ( isdefined( var_79dd2c3d[ str_ww ] ) && var_79dd2c3d[ str_ww ] )
                    {
                        var_79dd2c3d[ str_ww ] = 0;
                        
                        if ( isdefined( var_f804950f ) )
                        {
                            var_7dbbbf1f = arraycopy( a_str_tasks );
                            arrayremovevalue( var_7dbbbf1f, var_f804950f );
                            var_c88233d3 = var_7dbbbf1f[ 0 ];
                            
                            if ( isdefined( var_c88233d3 ) )
                            {
                                str_task = var_c88233d3;
                            }
                        }
                    }
                    
                    if ( var_f804950f === str_task )
                    {
                        var_79dd2c3d[ str_ww ] = 1;
                    }
                    
                    var_76b58dd[ str_ww ] = str_task;
                }
                
                if ( !isdefined( var_f704b824 ) )
                {
                    var_f704b824 = [];
                }
                else if ( !isarray( var_f704b824 ) )
                {
                    var_f704b824 = array( var_f704b824 );
                }
                
                var_f704b824[ var_f704b824.size ] = str_task;
            }
            
            if ( !isdefined( var_37c7bb4d ) )
            {
                var_37c7bb4d = [];
            }
            else if ( !isarray( var_37c7bb4d ) )
            {
                var_37c7bb4d = array( var_37c7bb4d );
            }
            
            var_37c7bb4d[ var_37c7bb4d.size ] = var_f704b824;
        }
        
        s_act.var_c3815c7 = var_c3815c7;
        s_act.var_37c7bb4d = var_37c7bb4d;
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 5
// Checksum 0x46f5e90c, Offset: 0x15cc8
// Size: 0x5a0
function function_9cb5a6ac( str_ww, str_task, n_act, n_spotlight, var_d8d4faff )
{
    level endon( #"end_game", #"play" + "_ended_early", #"hash_285de4ce79135552" );
    self endon( #"entering_last_stand", #"death" );
    var_b1224954 = self.var_b1224954;
    
    if ( isdefined( var_b1224954 ) )
    {
        var_b1224954 delete();
        mdl_aoe = self.mdl_aoe;
        
        if ( isdefined( mdl_aoe ) )
        {
            mdl_aoe zm_utility::deactivate_zombie_point_of_interest();
            mdl_aoe clientfield::set( "charon_pool", 0 );
            mdl_aoe delete();
        }
    }
    
    wait 0.5;
    s_play = level.var_28dcf408;
    
    switch ( n_act )
    {
        case 1:
            var_c9386af2 = 5;
            var_bfa3340e = 10;
            break;
        case 2:
            var_c9386af2 = 5;
            var_bfa3340e = 10;
            break;
        case 3:
            var_c9386af2 = 5;
            var_bfa3340e = 10;
            break;
    }
    
    a_s_spotlights = s_play.a_s_spotlights;
    var_ed2fbe40 = s_play.var_ed2fbe40;
    var_8c827c67 = var_ed2fbe40[ str_ww ];
    b_return = str_task == #"return";
    
    if ( b_return )
    {
        var_24437625 = 1;
        var_c9386af2 = 5;
        s_spotlight = a_s_spotlights[ str_ww ];
        var_fb51c008 = self function_6a5bdb08();
    }
    else
    {
        var_24437625 = n_spotlight + 1;
        s_spotlight = a_s_spotlights[ n_spotlight ];
        var_fb51c008 = self function_813c4629( s_spotlight );
    }
    
    self thread function_5ea46511( str_ww );
    
    if ( !var_fb51c008 || b_return )
    {
        self notify( #"hash_1ff39e85b7b8e833" );
    }
    
    if ( !var_fb51c008 )
    {
        level clientfield::set( var_8c827c67, var_24437625 );
        self thread function_e028a26f( str_ww, 0, b_return );
        self thread function_4900fd63( s_spotlight, b_return );
        s_waitresult = self waittilltimeout( var_c9386af2, #"hash_29f30403ceebc819" );
        level clientfield::set( var_8c827c67, 0 );
        self notify( #"hash_3f61d1172dd383b2" );
        
        if ( s_waitresult._notify != #"hash_29f30403ceebc819" )
        {
            str_reason = #"late_mark";
            
            if ( b_return )
            {
                str_reason = #"late_backstage";
            }
            
            level notify( #"hash_285de4ce79135552", { #str_reason:str_reason, #e_player:self } );
            return;
        }
    }
    
    if ( b_return )
    {
        self thread function_ad68de97();
    }
    else
    {
        self thread function_4f45dd3c();
    }
    
    if ( !b_return )
    {
        level thread function_542a6ee4( self, str_ww, str_task, n_spotlight, var_d8d4faff );
        level thread function_4462d56a( self, str_ww );
        s_waitresult = self waittilltimeout( var_bfa3340e, #"play_task_completed" );
        
        if ( s_waitresult._notify != #"play_task_completed" )
        {
            level notify( #"hash_285de4ce79135552", { #str_reason:#"late_kills", #e_player:self } );
            return;
        }
    }
    
    s_play.var_ef5091fc++;
    var_2d971fd7 = s_play.a_e_participants.size;
    
    if ( s_play.var_ef5091fc >= var_2d971fd7 )
    {
        level notify( #"hash_6f04da8e7237740" );
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0x9707fc9c, Offset: 0x16270
// Size: 0xf4
function function_5ea46511( str_ww )
{
    if ( !isdefined( self ) )
    {
        return;
    }
    
    a_w_charged = function_36afae35( str_ww );
    
    foreach ( w_charged in a_w_charged )
    {
        if ( self hasweapon( w_charged ) )
        {
            if ( self getweaponammoclip( w_charged ) < 5 )
            {
                self setweaponammoclip( w_charged, 10 );
            }
            
            break;
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 2
// Checksum 0x277f413, Offset: 0x16370
// Size: 0xee
function function_4900fd63( s_spotlight, b_backstage = 0 )
{
    level endon( #"end_game", #"play" + "_ended_early", #"hash_285de4ce79135552" );
    self endon( #"entering_last_stand", #"death" );
    
    if ( !b_backstage )
    {
        while ( !self function_813c4629( s_spotlight ) )
        {
            waitframe( 1 );
        }
    }
    else
    {
        while ( !self function_6a5bdb08() )
        {
            waitframe( 1 );
        }
    }
    
    self notify( #"hash_29f30403ceebc819" );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x10ab42d1, Offset: 0x16468
// Size: 0x34, Type: bool
function function_dc5aa56f()
{
    return self function_6a5bdb08() || self function_3471a3dc();
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xe0f728c0, Offset: 0x164a8
// Size: 0x42
function function_3471a3dc()
{
    vol_stage = getent( "vol_play_away", "targetname" );
    return self istouching( vol_stage );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xd2efdab7, Offset: 0x164f8
// Size: 0x42
function function_6a5bdb08()
{
    var_64c757e0 = getent( "vol_play_home", "targetname" );
    return self istouching( var_64c757e0 );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x562effc1, Offset: 0x16548
// Size: 0x130
function function_4f45dd3c()
{
    level endon( #"end_game", #"play" + "_ended_early", #"hash_6f04da8e7237740", #"hash_285de4ce79135552" );
    self endon( #"entering_last_stand", #"death" );
    
    while ( !self function_3471a3dc() )
    {
        waitframe( 1 );
    }
    
    while ( true )
    {
        while ( self function_3471a3dc() )
        {
            waitframe( 1 );
        }
        
        wait 2;
        
        if ( !self function_3471a3dc() )
        {
            break;
        }
    }
    
    level notify( #"hash_285de4ce79135552", { #str_reason:#"left_stage", #e_player:self } );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x7aab2ad, Offset: 0x16680
// Size: 0x130
function function_ad68de97()
{
    level endon( #"end_game", #"play" + "_ended_early", #"hash_6f04da8e7237740", #"hash_285de4ce79135552" );
    self endon( #"entering_last_stand", #"death" );
    
    while ( !self function_6a5bdb08() )
    {
        waitframe( 1 );
    }
    
    while ( true )
    {
        while ( self function_6a5bdb08() )
        {
            waitframe( 1 );
        }
        
        wait 2;
        
        if ( !self function_6a5bdb08() )
        {
            break;
        }
    }
    
    level notify( #"hash_285de4ce79135552", { #str_reason:#"left_backstage", #e_player:self } );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 2
// Checksum 0x3e914b2d, Offset: 0x167b8
// Size: 0x28c
function function_4462d56a( e_player, str_ww )
{
    level endon( #"end_game", #"play" + "_ended_early", #"hash_666e960831b9abc4", #"hash_285de4ce79135552" );
    e_player endon( #"entering_last_stand", #"death", #"hash_1ff39e85b7b8e833" );
    var_65adf081 = util::spawn_model( #"tag_origin", e_player.origin );
    
    switch ( str_ww )
    {
        case #"death":
            str_cf = "" + #"hash_155f8a4473c5849f";
            break;
        case #"earth":
            str_cf = "" + #"hash_4400550c9847a1c5";
            break;
        case #"air":
            str_cf = "" + #"hash_1f0dd5bf6862e335";
            break;
        case #"light":
            str_cf = "" + #"hash_ab97fcf2b12187d";
            break;
    }
    
    var_65adf081 clientfield::set( str_cf, 1 );
    var_65adf081 thread function_52b56ea3( str_cf );
    var_65adf081 thread function_2593636e( e_player, str_cf );
    
    while ( true )
    {
        v_origin = e_player.origin;
        a_info = zm_utility::function_b0eeaada( v_origin );
        
        if ( isdefined( a_info ) )
        {
            v_navmesh = a_info[ #"point" ];
            
            if ( isdefined( v_navmesh ) )
            {
                v_origin = v_navmesh;
            }
        }
        
        var_65adf081.origin = v_origin;
        waitframe( 1 );
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0xea67b12, Offset: 0x16a50
// Size: 0x84
function function_52b56ea3( str_cf )
{
    self endon( #"death" );
    level waittill( #"end_game", #"play" + "_ended_early", #"hash_666e960831b9abc4", #"hash_285de4ce79135552" );
    self thread function_1fa773bf( str_cf );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 2
// Checksum 0x47369a8, Offset: 0x16ae0
// Size: 0xec
function function_2593636e( e_player, str_cf )
{
    level endon( #"end_game", #"play" + "_ended_early", #"hash_666e960831b9abc4", #"hash_285de4ce79135552" );
    self endon( #"death" );
    
    if ( isdefined( e_player ) )
    {
        s_waitresult = e_player waittill( #"entering_last_stand", #"death", #"hash_1ff39e85b7b8e833", #"fake_death" );
    }
    
    self thread function_1fa773bf( str_cf );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0x6c150a65, Offset: 0x16bd8
// Size: 0x7c
function function_1fa773bf( str_cf )
{
    self endon( #"death" );
    
    if ( isdefined( self.var_46f6099a ) && self.var_46f6099a )
    {
        return;
    }
    
    self.var_46f6099a = 1;
    self clientfield::set( str_cf, 0 );
    wait 1;
    self delete();
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 5
// Checksum 0x22164aec, Offset: 0x16c60
// Size: 0x540
function function_542a6ee4( e_player, str_ww, str_task, n_spotlight, var_d8d4faff )
{
    level endon( #"end_game", #"play" + "_ended_early", #"hash_285de4ce79135552" );
    e_player endon( #"entering_last_stand", #"death" );
    
    if ( str_task == #"both" )
    {
        a_str_tasks = array( #"uncharged", #"charged" );
    }
    else
    {
        a_str_tasks = array( str_task );
    }
    
    s_play = level.var_28dcf408;
    n_to_kill = 0;
    s_play.var_155837a1[ str_ww ] = 0;
    
    foreach ( str_task in a_str_tasks )
    {
        if ( str_task == #"uncharged" )
        {
            a_s_spotlights = s_play.a_s_spotlights;
            s_spotlight = a_s_spotlights[ n_spotlight ];
            a_s_spawns = struct::get_array( s_spotlight.target );
            n_to_kill += a_s_spawns.size;
            level function_37411f7e( a_s_spawns, str_ww, 1, 1, var_d8d4faff );
            continue;
        }
        
        switch ( str_ww )
        {
            case #"death":
                var_8959ce50 = array( #"hash_75db9afbf4e59ab7", #"hash_75db9bfbf4e59c6a" );
                str_group = array::random( var_8959ce50 );
                
                if ( isdefined( s_play.var_ecc915b5 ) && s_play.var_ecc915b5 )
                {
                    str_group = #"hash_75db9afbf4e59ab7";
                }
                
                a_s_spawns = struct::get_array( str_group );
                n_to_kill += a_s_spawns.size;
                var_d8d4faff = 0;
                level function_37411f7e( a_s_spawns, str_ww, 0, 1, var_d8d4faff );
                break;
            case #"earth":
                var_8959ce50 = array( #"hash_56c60404554c8d15", #"hash_56c60104554c87fc" );
                str_group = array::random( var_8959ce50 );
                a_s_spawns = struct::get_array( str_group );
                n_to_kill += a_s_spawns.size;
                level function_37411f7e( a_s_spawns, str_ww, 0, 1, var_d8d4faff );
                break;
            case #"air":
                a_s_spawns = struct::get_array( #"hash_6da4b236b2ab84fa" );
                n_to_kill += a_s_spawns.size;
                level function_37411f7e( a_s_spawns, str_ww, 0, 1, var_d8d4faff );
                break;
            case #"light":
                var_8959ce50 = array( #"hash_5a3fbb7f6ef6cdb8", #"hash_5a3fbe7f6ef6d2d1" );
                str_group = array::random( var_8959ce50 );
                a_s_spawns = struct::get_array( str_group );
                n_to_kill += 12;
                level thread function_3c6638c1( a_s_spawns, 12, var_d8d4faff );
                break;
        }
    }
    
    while ( s_play.var_155837a1[ str_ww ] < n_to_kill )
    {
        waitframe( 1 );
    }
    
    e_player notify( #"play_task_completed" );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 5
// Checksum 0xf94b7ecb, Offset: 0x171a8
// Size: 0x100
function function_37411f7e( a_s_spawns, str_ww, b_uncharged, b_stationary, var_d8d4faff )
{
    level endon( #"end_game", #"play" + "_ended_early", #"hash_285de4ce79135552" );
    
    foreach ( s_spawn in a_s_spawns )
    {
        s_spawn function_6cdf4b0( str_ww, b_uncharged, b_stationary, var_d8d4faff );
        util::wait_network_frame();
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 4
// Checksum 0x104532bd, Offset: 0x172b0
// Size: 0x440
function function_6cdf4b0( str_ww, b_uncharged, b_stationary, var_d8d4faff )
{
    level endon( #"end_game", #"play" + "_ended_early", #"hash_285de4ce79135552" );
    self endon( #"death" );
    b_spartoi = 0;
    
    switch ( var_d8d4faff )
    {
        case 1:
            b_spartoi = 1;
            break;
        case 2:
            b_spartoi = math::cointoss();
            break;
    }
    
    while ( true )
    {
        if ( !b_spartoi )
        {
            ai_zombie = zombie_utility::spawn_zombie( array::random( level.zombie_spawners ), undefined, self );
        }
        else
        {
            ai_zombie = zombie_skeleton_util::function_1ea880bd( 1, self );
        }
        
        if ( isdefined( ai_zombie ) )
        {
            break;
        }
        
        util::wait_network_frame();
    }
    
    ai_zombie.var_be2fc36d = 1;
    ai_zombie.var_8ca159b2 = str_ww;
    ai_zombie.var_71ecb9db = b_uncharged;
    ai_zombie.var_564012c4 = 1;
    ai_zombie.var_aea6e035 = 1;
    ai_zombie.var_827f6f4a = 1;
    ai_zombie.var_5a3ebaa3 = 1;
    ai_zombie.var_2e4247bc = 1;
    
    switch ( str_ww )
    {
        case #"death":
            ai_zombie.var_2e4247bc = undefined;
            break;
        case #"earth":
            ai_zombie.var_5a3ebaa3 = undefined;
            break;
        case #"air":
            ai_zombie.var_827f6f4a = undefined;
            break;
        case #"light":
            ai_zombie.var_aea6e035 = undefined;
            break;
    }
    
    ai_zombie.var_f9b38410 = 1;
    ai_zombie.var_339655cf = 1;
    
    if ( b_uncharged )
    {
        ai_zombie.var_f9b38410 = undefined;
        ai_zombie thread function_b22c312e( str_ww );
    }
    else
    {
        ai_zombie.var_339655cf = undefined;
        
        switch ( str_ww )
        {
            case #"death":
                ai_zombie thread function_a9398fd4();
                break;
            case #"earth":
                ai_zombie thread function_9364cb64();
                break;
        }
    }
    
    ai_zombie.var_126d7bef = 1;
    ai_zombie.ignore_round_spawn_failsafe = 1;
    ai_zombie.b_ignore_cleanup = 1;
    ai_zombie.ignore_enemy_count = 1;
    ai_zombie.no_powerups = 1;
    ai_zombie.var_12745932 = 1;
    ai_zombie.var_3c394b1b = 1;
    
    if ( b_stationary )
    {
        ai_zombie val::set( #"play_ignoreall", "ignoreall", 1 );
        ai_zombie.start_inert = 1;
        ai_zombie.var_67faa700 = 1;
        ai_zombie thread function_d9b360d2( self );
    }
    
    ai_zombie thread function_790e49a5( str_ww, b_uncharged );
    return ai_zombie;
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0xf0dd91aa, Offset: 0x176f8
// Size: 0x10e
function function_d9b360d2( s_spawn )
{
    self endoncallback( &function_7b08eb2c, #"death" );
    v_origin = s_spawn.origin;
    v_angles = s_spawn.angles;
    self forceteleport( v_origin, v_angles );
    self dontinterpolate();
    self.var_621c2eb4 = util::spawn_model( #"tag_origin", v_origin, v_angles );
    self linkto( self.var_621c2eb4 );
    
    while ( true )
    {
        self setgoal( v_origin, 1 );
        waitframe( 1 );
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0xa6e64a0c, Offset: 0x17810
// Size: 0x34
function function_7b08eb2c( notifyhash )
{
    if ( isdefined( self.var_621c2eb4 ) )
    {
        self.var_621c2eb4 delete();
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 2
// Checksum 0x16fdba7f, Offset: 0x17850
// Size: 0x214
function function_790e49a5( str_ww, b_uncharged )
{
    switch ( str_ww )
    {
        case #"death":
            if ( b_uncharged )
            {
                var_84c10792 = "" + #"hash_415416bf220de94";
            }
            else
            {
                var_84c10792 = "" + #"hash_3e2b1092de25c2dd";
            }
            
            break;
        case #"earth":
            if ( b_uncharged )
            {
                var_84c10792 = "" + #"hash_24b5302c2f39ebc2";
            }
            else
            {
                var_84c10792 = "" + #"hash_6a8479b5a5b359a7";
            }
            
            break;
        case #"air":
            if ( b_uncharged )
            {
                var_84c10792 = "" + #"hash_4feb66128e57d092";
            }
            else
            {
                var_84c10792 = "" + #"hash_7552d5567ab25417";
            }
            
            break;
        case #"light":
            if ( b_uncharged )
            {
                var_84c10792 = "" + #"hash_4e1b58f05f69a65a";
            }
            else
            {
                var_84c10792 = "" + #"hash_5a6761fe764bdccf";
            }
            
            break;
    }
    
    self clientfield::set( var_84c10792, 1 );
    
    while ( isdefined( self ) && isalive( self ) && !( isdefined( self.var_47d982a1 ) && self.var_47d982a1 ) )
    {
        waitframe( 1 );
    }
    
    if ( isdefined( self ) )
    {
        self clientfield::set( var_84c10792, 0 );
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0x43e4e4ac, Offset: 0x17a70
// Size: 0x94
function function_b22c312e( str_ww )
{
    self endon( #"death" );
    
    while ( !( isdefined( self.var_61768419 ) && self.var_61768419 ) )
    {
        waitframe( 1 );
    }
    
    w_uncharged = function_a67dc10( str_ww );
    s_params = { #weapon:w_uncharged };
    self thread function_93e711a6( s_params );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x80941cc4, Offset: 0x17b10
// Size: 0x74
function function_a9398fd4()
{
    self endon( #"death" );
    
    while ( !( isdefined( self.var_47d982a1 ) && self.var_47d982a1 ) )
    {
        waitframe( 1 );
    }
    
    s_params = { #weapon:level.w_hand_charon };
    self thread function_93e711a6( s_params );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x46504375, Offset: 0x17b90
// Size: 0x74
function function_9364cb64()
{
    self endon( #"death" );
    
    while ( !( isdefined( self.var_a447e680 ) && self.var_a447e680 ) )
    {
        waitframe( 1 );
    }
    
    s_params = { #weapon:level.w_hand_gaia };
    self thread function_93e711a6( s_params );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 3
// Checksum 0xaeb0aa40, Offset: 0x17c10
// Size: 0xf6
function function_3c6638c1( a_s_spawns, n_zombies, var_d8d4faff )
{
    level endon( #"end_game", #"play" + "_ended_early", #"hash_285de4ce79135552" );
    
    for ( i = 0; i < n_zombies ; i++ )
    {
        s_spawn = array::random( a_s_spawns );
        ai_zombie = s_spawn function_6cdf4b0( #"light", 0, 0, var_d8d4faff );
        ai_zombie zombie_utility::set_zombie_run_cycle_override_value( "sprint" );
        wait 0.25;
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0x655813e6, Offset: 0x17d10
// Size: 0x2d0
function function_12ff6bb5( n_act )
{
    level endon( #"end_game", #"play" + "_ended_early", #"play_act_completed", #"hash_666e960831b9abc4", #"hash_285de4ce79135552" );
    a_s_spawns = struct::get_array( #"hash_408827725d1ed07a" );
    a_ai_spawned = [];
    
    while ( true )
    {
        a_ai_spawned = array::remove_dead( a_ai_spawned );
        
        if ( a_ai_spawned.size < 6 && getaiarray().size < level.zombie_ai_limit )
        {
            b_spartoi = 0;
            
            if ( n_act > 2 )
            {
                b_spartoi = math::cointoss();
            }
            
            s_spawn = array::random( a_s_spawns );
            
            if ( isdefined( s_spawn.script_noteworthy ) )
            {
                b_spartoi = 0;
            }
            
            while ( true )
            {
                if ( !b_spartoi )
                {
                    ai_zombie = zombie_utility::spawn_zombie( array::random( level.zombie_spawners ), undefined, s_spawn );
                }
                else
                {
                    ai_zombie = zombie_skeleton_util::function_1ea880bd( 1, s_spawn );
                }
                
                if ( isdefined( ai_zombie ) )
                {
                    break;
                }
                
                waitframe( 1 );
            }
            
            if ( !isdefined( a_ai_spawned ) )
            {
                a_ai_spawned = [];
            }
            else if ( !isarray( a_ai_spawned ) )
            {
                a_ai_spawned = array( a_ai_spawned );
            }
            
            a_ai_spawned[ a_ai_spawned.size ] = ai_zombie;
            ai_zombie.var_126d7bef = 1;
            ai_zombie.ignore_round_spawn_failsafe = 1;
            ai_zombie.b_ignore_cleanup = 1;
            ai_zombie.ignore_enemy_count = 1;
            ai_zombie.no_powerups = 1;
            ai_zombie.var_3c394b1b = 1;
        }
        
        n_random_wait = randomfloatrange( 1, 2 );
        wait n_random_wait;
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xc1d4e9c7, Offset: 0x17fe8
// Size: 0x152
function function_79a4f7f8()
{
    level endon( #"end_game", #"play" + "_ended_early", #"play_act_completed", #"hash_666e960831b9abc4", #"hash_285de4ce79135552" );
    n_random_wait = randomfloatrange( 10, 20 );
    wait n_random_wait;
    s_spawn = struct::get( #"hash_55ffe99e3e9981b7" );
    
    while ( true )
    {
        ai_gegenees = zombie_gegenees_util::spawn_single( 1, s_spawn );
        
        if ( isdefined( ai_gegenees ) )
        {
            break;
        }
        
        waitframe( 1 );
    }
    
    ai_gegenees.var_126d7bef = 1;
    ai_gegenees.ignore_round_spawn_failsafe = 1;
    ai_gegenees.b_ignore_cleanup = 1;
    ai_gegenees.ignore_enemy_count = 1;
    ai_gegenees.no_powerups = 1;
    ai_gegenees.var_3c394b1b = 1;
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xdc0a5651, Offset: 0x18148
// Size: 0x13a
function function_1ddccc6c()
{
    level endon( #"end_game" );
    wait 5;
    s_reward = struct::get( #"hash_534aae214445a501" );
    v_reward = s_reward.origin;
    s_reward struct::delete();
    level thread zm_powerups::specific_powerup_drop( "full_ammo", v_reward, undefined, undefined, undefined, 0, 1 );
    var_6463d67c = level.var_6463d67c;
    var_2b4d16c2 = level.var_48e2ab90;
    level.var_6463d67c = undefined;
    level.var_48e2ab90 = undefined;
    zm_utility::function_4a25b584( v_reward, 10, 128 );
    level.var_6463d67c = var_6463d67c;
    level.var_48e2ab90 = var_2b4d16c2;
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x9089c9bd, Offset: 0x18290
// Size: 0x2ec
function init_blood()
{
    s_blood = spawnstruct();
    level.var_d16c3b5 = s_blood;
    a_n_runes = array( 12, 2, 15, 19, 6, 9 );
    a_str_glow_tags = [];
    var_8cdb3dc1 = [];
    mdl_door = getent( "mdl_blood_code", "targetname" );
    
    foreach ( n_rune in a_n_runes )
    {
        var_66d75ac = "tag_panel_real_";
        var_cd82427a = "tag_panel_real_emissive_";
        
        if ( n_rune < 10 )
        {
            var_66d75ac += 0;
            var_cd82427a += 0;
        }
        
        str_tag = var_66d75ac + n_rune;
        str_glow_tag = var_cd82427a + n_rune;
        mdl_door hidepart( str_glow_tag );
        v_target = mdl_door gettagorigin( str_tag );
        
        if ( !isdefined( a_str_glow_tags ) )
        {
            a_str_glow_tags = [];
        }
        else if ( !isarray( a_str_glow_tags ) )
        {
            a_str_glow_tags = array( a_str_glow_tags );
        }
        
        a_str_glow_tags[ a_str_glow_tags.size ] = str_glow_tag;
        
        if ( !isdefined( var_8cdb3dc1 ) )
        {
            var_8cdb3dc1 = [];
        }
        else if ( !isarray( var_8cdb3dc1 ) )
        {
            var_8cdb3dc1 = array( var_8cdb3dc1 );
        }
        
        var_8cdb3dc1[ var_8cdb3dc1.size ] = v_target;
    }
    
    s_blood.a_str_glow_tags = a_str_glow_tags;
    s_blood.var_8cdb3dc1 = var_8cdb3dc1;
    mdl_weapon_clip = getent( "mdl_blood_bounce", "targetname" );
    
    if ( zm_utility::is_ee_enabled() )
    {
        mdl_weapon_clip notsolid();
        return;
    }
    
    mdl_weapon_clip delete();
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0xf2a8cf4, Offset: 0x18588
// Size: 0x104
function blood_setup( b_skipped )
{
    level endon( #"end_game", #"blood" + "_ended_early" );
    level zm_ui_inventory::function_7df6bb60( #"zm_red_objective_progress", 6 );
    level thread scene::init_streamer( #"cin_zm_red_mid", #"allies" );
    
    /#
        if ( b_skipped )
        {
            return;
        }
    #/
    
    s_blood = level.var_d16c3b5;
    s_blood.var_774f9f7b = 6;
    s_blood.var_27dc3a2f = 0;
    callback::on_weapon_fired( &function_b224d9eb );
    level waittill( #"hash_59e7b50156995646" );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 2
// Checksum 0xbe3d4c22, Offset: 0x18698
// Size: 0x118
function blood_cleanup( b_skipped, var_19e802fa )
{
    callback::remove_on_weapon_fired( &function_b224d9eb );
    level notify( #"hash_59e7b50156995646" );
    s_blood = level.var_d16c3b5;
    a_str_glow_tags = s_blood.a_str_glow_tags;
    mdl_door = getent( "mdl_blood_code", "targetname" );
    
    foreach ( str_glow_tag in a_str_glow_tags )
    {
        mdl_door showpart( str_glow_tag );
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0x704fcb91, Offset: 0x187b8
// Size: 0x508
function function_b224d9eb( s_params )
{
    w_weapon = s_params.weapon;
    
    if ( !zm_utility::is_player_valid( self ) || !( isdefined( w_weapon.isprimary ) && w_weapon.isprimary ) || isdefined( w_weapon.isprojectileweapon ) && w_weapon.isprojectileweapon || w_weapon.type === "script" )
    {
        return;
    }
    
    s_blood = level.var_d16c3b5;
    
    if ( !isdefined( s_blood ) || isdefined( s_blood.var_3886603c ) && s_blood.var_3886603c )
    {
        return;
    }
    
    var_2ed6f142 = self getweaponmuzzlepoint();
    v_forward = self getweaponforwarddir();
    v_end = var_2ed6f142 + v_forward * 10000;
    a_trace = bullettrace( var_2ed6f142, v_end, 0, self );
    
    if ( isdefined( a_trace ) )
    {
        mdl_hit = a_trace[ #"entity" ];
        v_hit = a_trace[ #"position" ];
        mdl_door = getent( "mdl_blood_code", "targetname" );
        
        if ( mdl_hit === mdl_door && isdefined( v_hit ) )
        {
            n_index = s_blood.var_27dc3a2f;
            a_str_glow_tags = s_blood.a_str_glow_tags;
            var_8cdb3dc1 = s_blood.var_8cdb3dc1;
            v_target = var_8cdb3dc1[ n_index ];
            
            if ( !isdefined( v_target ) )
            {
                return;
            }
            
            n_dist = distancesquared( v_hit, v_target );
            
            if ( n_dist <= 10 * 10 )
            {
                str_glow_tag = a_str_glow_tags[ n_index ];
                mdl_door showpart( str_glow_tag );
                mdl_door playsoundontag( #"hash_27384a9aed0e6481", str_glow_tag );
                s_blood.var_27dc3a2f++;
                
                if ( s_blood.var_27dc3a2f >= s_blood.var_774f9f7b )
                {
                    s_blood.var_3886603c = 1;
                    s_blood.var_ea0be65c = self;
                    level notify( #"hash_59e7b50156995646" );
                }
                
                return;
            }
            
            var_35a69490 = 0;
            
            for ( i = 0; i < s_blood.var_27dc3a2f ; i++ )
            {
                v_target = var_8cdb3dc1[ i ];
                n_dist = distancesquared( v_hit, v_target );
                
                if ( n_dist <= 10 * 10 )
                {
                    var_35a69490 = 1;
                    break;
                }
            }
            
            if ( !var_35a69490 )
            {
                if ( s_blood.var_27dc3a2f > 0 )
                {
                    self thread zm_audio::create_and_play_dialog( #"generic", #"response_negative" );
                    
                    foreach ( str_glow_tag in a_str_glow_tags )
                    {
                        mdl_door playsoundontag( #"hash_255e2eb89fb1d228", str_glow_tag );
                    }
                }
                
                s_blood.var_27dc3a2f = 0;
                
                foreach ( str_glow_tag in a_str_glow_tags )
                {
                    mdl_door hidepart( str_glow_tag );
                }
            }
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0xa515e632, Offset: 0x18cc8
// Size: 0x2a6
function door_interact_setup( b_skipped )
{
    level endon( #"end_game", #"door_interact" + "_ended_early", #"hash_385b5bbf2492408c" );
    s_blood = level.var_d16c3b5;
    
    /#
        if ( b_skipped )
        {
            callback::on_disconnect( &function_afd5b72a );
            s_blood.var_d5c65c5e = 1;
            return;
        }
    #/
    
    if ( !function_9eacf92d() )
    {
        s_blood = level.var_d16c3b5;
        e_player = s_blood.var_ea0be65c;
        
        if ( zm_utility::is_player_valid( e_player ) )
        {
            e_player thread zm_audio::create_and_play_dialog( #"generic", #"response_positive" );
        }
        
        return;
    }
    
    callback::on_connect( &isfollowingspalette );
    array::thread_all( getplayers(), &isfollowingspalette );
    callback::on_disconnect( &function_afd5b72a );
    s_unitrigger = struct::get( #"hash_4054acecbf766067" );
    s_unitrigger zm_unitrigger::create( &function_c3735f60, 64 );
    
    while ( true )
    {
        s_waitresult = s_unitrigger waittill( #"trigger_activated" );
        e_player = s_waitresult.e_who;
        
        if ( zm_utility::is_player_valid( e_player ) && e_player function_90836224() && isdefined( s_blood.b_players_ready ) && s_blood.b_players_ready && !( isdefined( e_player.var_564dec14 ) && e_player.var_564dec14 ) )
        {
            break;
        }
    }
    
    s_blood.var_d5c65c5e = 1;
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 2
// Checksum 0x1b71a4e9, Offset: 0x18f78
// Size: 0xa4
function door_interact_cleanup( b_skipped, var_19e802fa )
{
    level notify( #"hash_57e7801ba472d7f9" );
    s_unitrigger = struct::get( #"hash_4054acecbf766067" );
    
    if ( isdefined( s_unitrigger.s_unitrigger ) )
    {
        zm_unitrigger::unregister_unitrigger( s_unitrigger.s_unitrigger );
        s_unitrigger.s_unitrigger = undefined;
    }
    
    s_unitrigger struct::delete();
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0x21f634dd, Offset: 0x19028
// Size: 0x278, Type: bool
function function_c3735f60( e_player )
{
    if ( zm_utility::is_player_valid( e_player ) && e_player function_90836224() && isdefined( e_player.var_4f958d45 ) && e_player.var_4f958d45 && !( isdefined( e_player.var_564dec14 ) && e_player.var_564dec14 ) )
    {
        a_e_players = function_e3142c13();
        e_stanton = a_e_players[ #"stanton" ];
        e_bruno = a_e_players[ #"bruno" ];
        
        if ( e_stanton === e_player )
        {
            e_partner = e_bruno;
            var_6fd6a42e = #"hash_3ee9cef44af6161a";
        }
        else
        {
            e_partner = e_stanton;
            var_6fd6a42e = #"hash_6e9541ef6c1ea427";
        }
        
        b_enabled = 1;
        
        if ( isdefined( e_partner ) )
        {
            if ( !( isdefined( e_partner.var_4f958d45 ) && e_partner.var_4f958d45 ) || isdefined( e_partner.var_564dec14 ) && e_partner.var_564dec14 )
            {
                b_enabled = 0;
            }
        }
        
        s_blood = level.var_d16c3b5;
        s_blood.b_players_ready = b_enabled;
        
        if ( b_enabled )
        {
            str_prompt = zm_utility::function_d6046228( #"hash_69c54340ac778652", #"hash_19bff4ab299e71e6" );
            self sethintstringforplayer( e_player, str_prompt );
        }
        else
        {
            self sethintstringforplayer( e_player, var_6fd6a42e );
        }
    }
    else
    {
        self sethintstringforplayer( e_player, "" );
    }
    
    return true;
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0x6f407796, Offset: 0x192a8
// Size: 0x98
function function_153ee6c7( str_character )
{
    foreach ( e_player in getplayers() )
    {
        if ( e_player zm_characters::is_character( str_character ) )
        {
            return e_player;
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x16bc0eb1, Offset: 0x19348
// Size: 0xf6
function function_e3142c13()
{
    a_e_players = [];
    e_stanton = function_153ee6c7( array( #"hash_3e63362aea484e09", #"hash_5a906d7137467771" ) );
    e_bruno = function_153ee6c7( array( #"hash_7180c6cf382f6010", #"hash_14e91ceb9a7b3eb6" ) );
    
    if ( isdefined( e_stanton ) )
    {
        a_e_players[ #"stanton" ] = e_stanton;
    }
    
    if ( isdefined( e_bruno ) )
    {
        a_e_players[ #"bruno" ] = e_bruno;
    }
    
    return a_e_players;
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xe8fc130e, Offset: 0x19448
// Size: 0x4c, Type: bool
function function_9eacf92d()
{
    a_e_players = function_e3142c13();
    return isdefined( a_e_players[ #"stanton" ] ) || isdefined( a_e_players[ #"bruno" ] );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xe0907575, Offset: 0x194a0
// Size: 0x32
function function_90836224()
{
    a_e_players = function_e3142c13();
    return isinarray( a_e_players, self );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xc46e30c5, Offset: 0x194e0
// Size: 0x15e
function isfollowingspalette()
{
    self notify( "4068843564855f72" );
    self endon( "4068843564855f72" );
    level endon( #"end_game", #"door_interact" + "_ended_early", #"hash_57e7801ba472d7f9", #"hash_385b5bbf2492408c" );
    self endon( #"disconnect" );
    
    if ( !self function_90836224() )
    {
        return;
    }
    
    s_door = struct::get( #"hash_4054acecbf766067" );
    v_door = s_door.origin;
    
    while ( true )
    {
        waitframe( 1 );
        
        if ( zm_utility::is_player_valid( self ) )
        {
            n_dist = distance2dsquared( v_door, self.origin );
            
            if ( n_dist <= 64 * 64 )
            {
                self.var_4f958d45 = 1;
                continue;
            }
        }
        
        self.var_4f958d45 = undefined;
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x1d5c2a72, Offset: 0x19648
// Size: 0x74
function function_afd5b72a()
{
    if ( !function_9eacf92d() )
    {
        level notify( #"hash_385b5bbf2492408c" );
    }
    
    if ( self function_90836224() && level scene::is_active( #"cin_zm_red_mid" ) )
    {
        level thread function_f9c3ccc4();
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x138662df, Offset: 0x196c8
// Size: 0x6c
function function_f9c3ccc4()
{
    self notify( "393d26483d138935" );
    self endon( "393d26483d138935" );
    util::wait_network_frame();
    level notify( #"hash_7a407f37d5416506" );
    level scene::stop( #"cin_zm_red_mid" );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0xbd88f999, Offset: 0x19740
// Size: 0xcbc
function mid_igc_setup( b_skipped )
{
    level endon( #"end_game", #"mid_igc" + "_ended_early" );
    s_blood = level.var_d16c3b5;
    s_blood.var_52ecb170 = level.player_out_of_playable_area_override;
    level.player_out_of_playable_area_override = &function_5810a89;
    level.var_b2b15659 = 1;
    level notify( #"hash_6e979a553f2df885" );
    
    /#
        if ( b_skipped )
        {
            return;
        }
    #/
    
    if ( !( isdefined( s_blood.var_d5c65c5e ) && s_blood.var_d5c65c5e ) )
    {
        return;
    }
    
    e_stanton = function_153ee6c7( array( #"hash_3e63362aea484e09", #"hash_5a906d7137467771" ) );
    e_bruno = function_153ee6c7( array( #"hash_7180c6cf382f6010", #"hash_14e91ceb9a7b3eb6" ) );
    
    if ( !isdefined( e_stanton ) && !isdefined( e_bruno ) )
    {
        return;
    }
    
    n_players = util::get_active_players().size;
    
    if ( isdefined( e_stanton ) )
    {
        n_players--;
    }
    
    if ( isdefined( e_bruno ) )
    {
        n_players--;
    }
    
    if ( n_players <= 0 )
    {
        level flag::clear( "spawn_zombies" );
        level flag::set( "pause_round_timeout" );
        level flag::set( "hold_round_end" );
        s_blood.var_45fcc5e8 = 1;
    }
    else
    {
        s_blood.var_45fcc5e8 = 0;
    }
    
    if ( !isdefined( e_stanton ) )
    {
        e_stanton = bot::add_bot( #"allies" );
        s_blood.var_c702bbb0 = e_stanton;
        e_stanton zm_characters::set_character( array( #"hash_3e63362aea484e09", #"hash_5a906d7137467771" ) );
        e_stanton init_bot();
    }
    
    if ( !isdefined( e_bruno ) )
    {
        e_bruno = bot::add_bot( #"allies" );
        s_blood.var_208b164f = e_bruno;
        e_bruno zm_characters::set_character( array( #"hash_7180c6cf382f6010", #"hash_14e91ceb9a7b3eb6" ) );
        e_bruno init_bot();
    }
    
    w_shield = getweapon( #"zhield_zpear_dw" );
    a_ai_blight_father = getaiarchetypearray( #"blight_father" );
    
    foreach ( e_actor in array( e_stanton, e_bruno ) )
    {
        if ( !isplayer( e_actor ) )
        {
            return;
        }
        
        e_actor val::set( #"blood_takedamage", "takedamage", 0 );
        e_actor val::set( #"blood_ignoreme", "ignoreme", 1 );
        e_actor val::set( #"blood_ignoreall", "ignoreall", 1 );
        e_actor.var_f22c83f5 = 1;
        e_actor.var_f4e33249 = 1;
        e_actor.var_6b830459 = 1;
        e_actor notify( #"hash_46064b6c2cb5cf20" );
        
        foreach ( ai_blight_father in a_ai_blight_father )
        {
            e_grapplee = ai_blight_father.e_grapplee;
            
            if ( e_grapplee === e_actor )
            {
                ai_blight_father notify( #"hash_2fb2eddfa6a0ef3f" );
                level thread zm_ai_blight_father::function_c526065b( ai_blight_father );
                break;
            }
        }
        
        w_hero_weapon = e_actor.var_fd05e363;
        
        if ( isdefined( w_hero_weapon ) )
        {
            n_slot = e_actor gadgetgetslot( w_hero_weapon );
            
            if ( e_actor gadgetisactive( n_slot ) || e_actor function_36dfc05f( n_slot ) )
            {
                e_actor.var_b0df5e59 = n_slot;
                e_actor thread zm_hero_weapon::hero_weapon_off( n_slot, w_hero_weapon );
            }
        }
    }
    
    while ( true )
    {
        var_b5d11642 = 1;
        
        foreach ( e_player in array( e_stanton, e_bruno ) )
        {
            if ( !isdefined( e_player ) )
            {
                return;
            }
            
            n_slot = e_player.var_b0df5e59;
            
            if ( isdefined( n_slot ) && ( e_player gadgetisactive( n_slot ) || e_player function_36dfc05f( n_slot ) ) )
            {
                var_b5d11642 = 0;
                break;
            }
        }
        
        if ( var_b5d11642 )
        {
            break;
        }
        
        waitframe( 1 );
    }
    
    if ( !isdefined( e_stanton ) || !isdefined( e_bruno ) )
    {
        return;
    }
    
    setdvar( #"cg_disableplayernames", 1 );
    setdvar( #"hash_2d5b0d6d4ce995d7", 0 );
    zm_red_challenges::pause_challenges( 1 );
    s_blood.var_9f2db310 = 1;
    
    foreach ( e_actor in array( e_stanton, e_bruno ) )
    {
        if ( e_actor hasweapon( w_shield ) )
        {
            e_actor.var_94bab787 = 1;
            e_actor takeweapon( w_shield );
        }
        
        mdl_fx = util::spawn_model( #"tag_origin", e_actor gettagorigin( "j_spine4" ), e_actor gettagangles( "j_spine4" ) );
        mdl_fx clientfield::increment( "" + #"blood_teleport" );
        mdl_fx thread util::delayed_delete( 1 );
        e_actor clientfield::set( "" + #"hash_67b317587e795ec2", 1 );
        e_actor setinvisibletoall();
        e_actor val::set( #"blood_disable_weapons", "disable_weapons", 1 );
        e_actor thread lui::screen_fade_out( 0.5 );
    }
    
    wait 0.75;
    
    if ( !isdefined( e_stanton ) || !isdefined( e_bruno ) )
    {
        return;
    }
    
    s_stanton = struct::get( #"hash_5391982125b20498" );
    s_bruno = struct::get( #"hash_401be93bf2a88e39" );
    e_stanton dontinterpolate();
    e_stanton setorigin( s_stanton.origin );
    e_stanton setvisibletoall();
    e_bruno dontinterpolate();
    e_bruno setorigin( s_bruno.origin );
    e_bruno setvisibletoall();
    wait 1;
    
    if ( !isdefined( e_stanton ) || !isdefined( e_bruno ) )
    {
        return;
    }
    
    e_stanton.script_animname = "e_blood_scar";
    e_bruno.script_animname = "e_blood_brute";
    mdl_door = getent( "mdl_blood_code", "targetname" );
    mdl_door.script_animname = "mdl_blood_code";
    level thread function_b8834fae( 1 );
    e_stanton thread function_c12407c0();
    e_bruno thread function_a750434e();
    e_stanton thread function_7e27fc5e();
    e_bruno thread function_7e27fc5e();
    level scene::add_scene_func( #"cin_zm_red_mid", &function_f81bfa93, "play" );
    level scene::play( #"cin_zm_red_mid", array( e_stanton, e_bruno, mdl_door ) );
    zm_red_challenges::pause_challenges( 0 );
    level thread function_b8834fae( 0 );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0x10d17398, Offset: 0x1a408
// Size: 0x124
function function_f81bfa93( a_ents )
{
    mdl_weapon_clip = getent( "mdl_blood_bounce", "targetname" );
    mdl_weapon_clip solid();
    e_stanton = a_ents[ #"e_blood_scar" ];
    e_bruno = a_ents[ #"e_blood_brute" ];
    e_bruno playsoundtoplayer( #"hash_6469d6b70bfbf855", e_bruno );
    e_stanton playsoundtoplayer( #"hash_3a00192f62922210", e_stanton );
    level thread function_cce14a84( e_stanton, e_bruno );
    level scene::remove_scene_func( #"cin_zm_red_mid", &function_f81bfa93, "play" );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 2
// Checksum 0x72aaea8b, Offset: 0x1a538
// Size: 0xb2
function function_cce14a84( e_stanton, e_bruno )
{
    wait 0.1;
    s_blood = level.var_d16c3b5;
    
    if ( isdefined( s_blood.var_9f2db310 ) && s_blood.var_9f2db310 )
    {
        if ( isdefined( e_stanton ) )
        {
            e_stanton thread lui::screen_fade_in( 0.5 );
        }
        
        if ( isdefined( e_bruno ) )
        {
            e_bruno thread lui::screen_fade_in( 0.5 );
        }
        
        s_blood.var_9f2db310 = 0;
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0x444fa980, Offset: 0x1a5f8
// Size: 0x270
function function_b8834fae( var_bcf66490 )
{
    e_stanton = function_153ee6c7( array( #"hash_3e63362aea484e09", #"hash_5a906d7137467771" ) );
    e_bruno = function_153ee6c7( array( #"hash_7180c6cf382f6010", #"hash_14e91ceb9a7b3eb6" ) );
    
    foreach ( e_player in getplayers() )
    {
        if ( isdefined( var_bcf66490 ) && var_bcf66490 )
        {
            if ( e_player !== e_stanton && e_player !== e_bruno )
            {
                e_player.dontspeak = 1;
                e_player scene::function_8b06792( #"cin_zm_red_mid" );
            }
            
            if ( isdefined( e_stanton ) && e_player === e_stanton || isdefined( e_bruno ) && e_player === e_bruno )
            {
                e_player clientfield::set_to_player( "" + #"hash_49068d48a9eb7b89", 1 );
            }
            else
            {
                e_player clientfield::set_to_player( "" + #"hash_49068d48a9eb7b89", 2 );
            }
            
            continue;
        }
        
        if ( e_player !== e_stanton && e_player !== e_bruno )
        {
            e_player.dontspeak = undefined;
        }
        
        e_player clientfield::set_to_player( "" + #"hash_49068d48a9eb7b89", 0 );
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x50e842a5, Offset: 0x1a870
// Size: 0xc4
function function_c12407c0()
{
    self endon( #"death" );
    self waittill( #"start_fade" );
    self thread lui::screen_fade_out( 3, ( 0, 0, 0 ) );
    self waittill( #"start_fade" );
    self lui::screen_fade_in( 0, ( 1, 1, 1 ) );
    self thread lui::screen_fade_out( 0.1, ( 1, 1, 1 ) );
    self waittill( #"end_fade" );
    self thread lui::screen_fade_in( 2, ( 1, 1, 1 ) );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xf73b2de9, Offset: 0x1a940
// Size: 0x7c
function function_a750434e()
{
    self endon( #"death" );
    self waittill( #"start_fade" );
    self thread lui::screen_fade_out( 0.5, ( 1, 1, 1 ) );
    self waittill( #"end_fade" );
    self thread lui::screen_fade_in( 2, ( 1, 1, 1 ) );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xf459d1b2, Offset: 0x1a9c8
// Size: 0x104
function function_7e27fc5e()
{
    self endon( #"death" );
    s_waitresult = level waittill( #"blood_fuzzy_start", #"end_game", #"hash_7a407f37d5416506" );
    
    if ( s_waitresult._notify == "blood_fuzzy_start" )
    {
        self clientfield::set( "" + #"hash_10275bcd47e53936", 1 );
        level waittill( #"blood_fuzzy_end", #"end_game", #"hash_7a407f37d5416506" );
        self clientfield::set( "" + #"hash_10275bcd47e53936", 0 );
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 2
// Checksum 0x4386ea4b, Offset: 0x1aad8
// Size: 0xa4c
function mid_igc_cleanup( b_skipped, var_19e802fa )
{
    s_blood = level.var_d16c3b5;
    level.player_out_of_playable_area_override = s_blood.var_52ecb170;
    level.var_b2b15659 = undefined;
    callback::remove_on_disconnect( &function_afd5b72a );
    
    if ( isdefined( s_blood.var_45fcc5e8 ) && s_blood.var_45fcc5e8 )
    {
        level flag::set( "spawn_zombies" );
        level flag::clear( "pause_round_timeout" );
        level flag::clear( "hold_round_end" );
    }
    
    mdl_weapon_clip = getent( "mdl_blood_bounce", "targetname" );
    mdl_weapon_clip delete();
    s_stanton = struct::get( #"hash_125d10ad0d2bf469" );
    s_bruno = struct::get( #"hash_4c80f9a7539d48a8" );
    var_45de69ce = s_stanton.origin;
    var_8fa0b4c1 = s_stanton.angles;
    var_43b8df0c = s_bruno.origin;
    var_c5aa5678 = s_bruno.angles;
    s_stanton struct::delete();
    s_bruno struct::delete();
    w_shield = getweapon( #"zhield_zpear_dw" );
    
    if ( isdefined( s_blood.var_c702bbb0 ) )
    {
        bot::remove_bot( s_blood.var_c702bbb0 );
    }
    else
    {
        e_stanton = function_153ee6c7( array( #"hash_3e63362aea484e09", #"hash_5a906d7137467771" ) );
        
        if ( isdefined( e_stanton ) )
        {
            e_stanton val::reset( #"blood_disable_weapons", "disable_weapons" );
            e_stanton.var_f22c83f5 = undefined;
            e_stanton.var_f4e33249 = undefined;
            e_stanton.var_6b830459 = undefined;
            e_stanton val::reset( #"blood_takedamage", "takedamage" );
            e_stanton val::reset( #"blood_ignoreme", "ignoreme" );
            e_stanton val::reset( #"blood_ignoreall", "ignoreall" );
            e_stanton util::delay( float( function_60d95f53() ) / 1000, undefined, &clientfield::set, "" + #"hash_67b317587e795ec2", 0 );
            e_stanton clientfield::set( "" + #"hash_10275bcd47e53936", 0 );
            
            if ( !b_skipped && !var_19e802fa )
            {
                e_stanton dontinterpolate();
                e_stanton setorigin( var_45de69ce );
                e_stanton setplayerangles( var_8fa0b4c1 );
                mdl_fx = util::spawn_model( #"tag_origin", e_stanton gettagorigin( "j_spine4" ), e_stanton gettagangles( "j_spine4" ) );
                mdl_fx clientfield::increment( "" + #"blood_teleport" );
                mdl_fx thread util::delayed_delete( 1 );
            }
            
            if ( isdefined( e_stanton.var_94bab787 ) && e_stanton.var_94bab787 )
            {
                e_stanton giveweapon( w_shield );
            }
            
            if ( isdefined( s_blood.var_9f2db310 ) && s_blood.var_9f2db310 )
            {
                e_stanton thread lui::screen_fade_in( 1 );
            }
        }
    }
    
    if ( isdefined( s_blood.var_208b164f ) )
    {
        bot::remove_bot( s_blood.var_208b164f );
    }
    else
    {
        e_bruno = function_153ee6c7( array( #"hash_7180c6cf382f6010", #"hash_14e91ceb9a7b3eb6" ) );
        
        if ( isdefined( e_bruno ) )
        {
            e_bruno val::reset( #"blood_disable_weapons", "disable_weapons" );
            e_bruno.var_f22c83f5 = undefined;
            e_bruno.var_f4e33249 = undefined;
            e_bruno.var_6b830459 = undefined;
            e_bruno val::reset( #"blood_takedamage", "takedamage" );
            e_bruno val::reset( #"blood_ignoreme", "ignoreme" );
            e_bruno val::reset( #"blood_ignoreall", "ignoreall" );
            e_bruno util::delay( float( function_60d95f53() ) / 1000, undefined, &clientfield::set, "" + #"hash_67b317587e795ec2", 0 );
            e_bruno clientfield::set( "" + #"hash_10275bcd47e53936", 0 );
            
            if ( !b_skipped && !var_19e802fa )
            {
                e_bruno dontinterpolate();
                e_bruno setorigin( var_43b8df0c );
                e_bruno setplayerangles( var_c5aa5678 );
                mdl_fx = util::spawn_model( #"tag_origin", e_bruno gettagorigin( "j_spine4" ), e_bruno gettagangles( "j_spine4" ) );
                mdl_fx clientfield::increment( "" + #"blood_teleport" );
                mdl_fx thread util::delayed_delete( 1 );
            }
            
            if ( isdefined( e_bruno.var_94bab787 ) && e_bruno.var_94bab787 )
            {
                e_bruno giveweapon( w_shield );
            }
            
            if ( isdefined( s_blood.var_9f2db310 ) && s_blood.var_9f2db310 )
            {
                e_bruno thread lui::screen_fade_in( 1 );
            }
        }
    }
    
    s_blood.var_9f2db310 = 0;
    setdvar( #"cg_disableplayernames", 0 );
    setdvar( #"hash_2d5b0d6d4ce995d7", 1 );
    zm_vo::function_769aa73b( "post_mid_banter", array( #"hash_7180c6cf382f6010", #"hash_14e91ceb9a7b3eb6" ), array( #"hash_3e63362aea484e09", #"hash_5a906d7137467771" ) );
    callback::on_connect( &function_dcc3c705 );
    
    if ( isdefined( e_stanton ) )
    {
        e_stanton thread function_dcc3c705();
    }
    
    if ( b_skipped || var_19e802fa )
    {
        level thread function_5a8c0d95();
    }
    else
    {
        level thread function_cb724dc5();
        function_5a8c0d95();
    }
    
    level.var_d16c3b5 struct::delete();
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xddf767b5, Offset: 0x1b530
// Size: 0x22
function function_5810a89()
{
    if ( isdefined( self.var_6b830459 ) && self.var_6b830459 )
    {
        return 0;
    }
    
    return undefined;
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x55bfe872, Offset: 0x1b560
// Size: 0xa2
function init_bot()
{
    self endon( #"disconnect" );
    
    while ( self.sessionstate !== "playing" )
    {
        waitframe( 1 );
    }
    
    while ( self.sessionstate !== "spectator" )
    {
        waitframe( 1 );
    }
    
    if ( self util::is_spectating() )
    {
        self zm_player::spectator_respawn_player();
    }
    
    while ( self.sessionstate !== "playing" )
    {
        waitframe( 1 );
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x873ffbf6, Offset: 0x1b610
// Size: 0x32c
function function_5a8c0d95()
{
    level endon( #"end_game" );
    s_mirror = struct::get( #"hash_5a26d9402630b7e1" );
    s_base = struct::get( #"hash_4d4ad65b737bdceb" );
    playrumbleonposition( #"hash_78384ae5c2a95e85", s_base.origin );
    v_mirror = s_mirror.origin - ( 0, 0, 256 );
    v_base = s_base.origin - ( 0, 0, 256 );
    playsoundatposition( #"hash_396f1597d3662c78", ( 0, 0, 0 ) );
    mdl_mirror = util::spawn_model( s_mirror.model, v_mirror, s_mirror.angles );
    mdl_base = util::spawn_model( s_base.model, v_base, s_base.angles );
    mdl_mirror setscale( 0.75 );
    mdl_base setscale( 0.75 );
    s_mirror struct::delete();
    s_base struct::delete();
    mdl_mirror movez( 256, 5 );
    mdl_base movez( 256, 5 );
    wait 5 - 1.5;
    level clientfield::set( "" + #"hash_31a10d565ae05ddb", 2 );
    level clientfield::set( "" + #"hash_1c97c11fb59eb4bf", 1 );
    level clientfield::set( "" + #"hash_51e28147388ee3d8", 1 );
    level clientfield::set( "" + #"hash_16e27bea0cc1b56b", 1 );
    exploder::exploder( "fxexp_barrier_egg_hit" );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xe92e4bb4, Offset: 0x1b948
// Size: 0x29c
function function_cb724dc5()
{
    level endon( #"end_game" );
    wait 2;
    e_stanton = function_153ee6c7( array( #"hash_3e63362aea484e09", #"hash_5a906d7137467771" ) );
    e_bruno = function_153ee6c7( array( #"hash_7180c6cf382f6010", #"hash_14e91ceb9a7b3eb6" ) );
    
    if ( isdefined( e_stanton ) && isdefined( e_bruno ) )
    {
        e_stanton endon( #"disconnect" );
        e_bruno endon( #"disconnect" );
        b_played = e_stanton zm_vo::vo_say( #"hash_66cea79656de98a3", undefined, undefined, undefined, undefined, 1 );
        
        if ( isdefined( b_played ) && b_played )
        {
            b_played = 0;
            b_played = e_stanton zm_vo::function_a2bd5a0c( #"hash_62227711901aad2" );
            
            if ( isdefined( b_played ) && b_played )
            {
                e_bruno thread zm_vo::function_a2bd5a0c( #"hash_62226711901a91f" );
            }
        }
        
        return;
    }
    
    if ( isdefined( e_stanton ) )
    {
        e_stanton endon( #"disconnect" );
        b_played = e_stanton zm_vo::vo_say( #"hash_72f5967a35325ac3", undefined, undefined, undefined, undefined, 1 );
        
        if ( isdefined( b_played ) && b_played )
        {
            e_stanton thread zm_vo::function_a2bd5a0c( #"hash_3e5825fcf6f95472" );
        }
        
        return;
    }
    
    if ( isdefined( e_bruno ) )
    {
        e_bruno endon( #"disconnect" );
        b_played = e_bruno zm_vo::function_a2bd5a0c( #"hash_552391bd4f9ce741" );
        
        if ( isdefined( b_played ) && b_played )
        {
            e_bruno thread zm_vo::vo_say( #"hash_1b221d6248a53127", undefined, undefined, undefined, undefined, 1 );
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x8ccb32d5, Offset: 0x1bbf0
// Size: 0x194
function function_dcc3c705()
{
    self notify( "3c63cddddcc253bf" );
    self endon( "3c63cddddcc253bf" );
    level endon( #"end_game", #"cleanse_teleported" );
    self endon( #"disconnect" );
    
    if ( !self zm_characters::is_character( array( #"hash_3e63362aea484e09", #"hash_5a906d7137467771" ) ) )
    {
        return;
    }
    
    if ( !isdefined( level.var_3dd1c71a ) )
    {
        level.var_3dd1c71a = 0;
    }
    
    while ( level.var_3dd1c71a < 3 )
    {
        self waittill( #"hash_ed377b19afa69d2" );
        
        switch ( level.var_3dd1c71a )
        {
            case 0:
                self thread zm_vo::vo_say( #"hash_189f560c95cb6d61", undefined, undefined, undefined, undefined, 1 );
                break;
            case 2:
                self thread zm_vo::vo_say( #"hash_dcc0683b777af3", undefined, undefined, undefined, undefined, 1 );
                break;
        }
        
        level.var_3dd1c71a++;
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x6b15fc52, Offset: 0x1bd90
// Size: 0x94
function init_cleanse()
{
    s_cleanse = spawnstruct();
    level.var_29e8cce2 = s_cleanse;
    
    if ( zm_utility::is_ee_enabled() )
    {
        level scene::add_scene_func( #"p8_fxanim_zm_red_ballista_bundle", &function_db9be550 );
        level thread scene::init( #"p8_fxanim_zm_red_ballista_bundle" );
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0x6f8ae7e9, Offset: 0x1be30
// Size: 0x7c
function function_db9be550( a_ents )
{
    s_cleanse = level.var_29e8cce2;
    
    if ( isdefined( s_cleanse ) )
    {
        s_cleanse.mdl_ballista = a_ents[ #"prop 1" ];
        level scene::remove_scene_func( #"p8_fxanim_zm_red_ballista_bundle", &function_db9be550 );
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0xfbe3de7c, Offset: 0x1beb8
// Size: 0x3cc
function cleanse_setup( b_skipped )
{
    level endon( #"end_game", #"cleanse" + "_ended_early" );
    a_s_spawns = struct::get_array( #"river_lower_spawns" );
    
    foreach ( s_spawn in a_s_spawns )
    {
        if ( isdefined( s_spawn.var_8448183f ) && s_spawn.var_8448183f && isdefined( s_spawn.script_noteworthy ) )
        {
            switch ( s_spawn.script_noteworthy )
            {
                default:
                    str_move = #"hash_18cccc85670ce70e";
                    break;
                case #"gegenees_location":
                    str_move = #"hash_6c2f8e1ec515638";
                    break;
                case #"blight_father_location":
                    str_move = #"hash_37ed662e10c50b79";
                    break;
            }
            
            s_move = struct::get( str_move );
            s_spawn.origin = s_move.origin;
            s_spawn.angles = s_move.angles;
            s_move struct::delete();
        }
    }
    
    level scene::play( #"p8_fxanim_zm_red_ballista_bundle", "Shot 1" );
    
    /#
        if ( b_skipped )
        {
            return;
        }
    #/
    
    level thread function_f2fa1520();
    level thread function_482dc5ac();
    s_rune = struct::get( #"hash_7a21f9a230f88631" );
    var_740e1e0e = util::spawn_model( s_rune.model, s_rune.origin, s_rune.angles );
    var_db8ec3ee = util::spawn_model( #"tag_origin", s_rune.origin );
    var_db8ec3ee clientfield::set( "" + #"hash_297c800c6e18f746", 1 );
    var_db8ec3ee playloopsound( #"hash_6f30c390503d064f" );
    s_cleanse = level.var_29e8cce2;
    s_cleanse.var_740e1e0e = var_740e1e0e;
    s_cleanse.var_db8ec3ee = var_db8ec3ee;
    s_cleanse.var_8121ef9f = level.var_b3b0d9d7;
    level.var_b3b0d9d7 = &function_cecc7973;
    level waittill( #"hash_6a4f03503cfcfac4" );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 2
// Checksum 0xd6756127, Offset: 0x1c290
// Size: 0x796
function cleanse_cleanup( b_skipped, var_19e802fa )
{
    s_cleanse = level.var_29e8cce2;
    var_740e1e0e = s_cleanse.var_740e1e0e;
    
    if ( isdefined( var_740e1e0e ) )
    {
        var_740e1e0e delete();
    }
    
    var_db8ec3ee = s_cleanse.var_db8ec3ee;
    
    if ( isdefined( var_db8ec3ee ) )
    {
        var_db8ec3ee clientfield::set( "" + #"hash_297c800c6e18f746", 0 );
        var_db8ec3ee thread util::delayed_delete( 1 );
    }
    
    mdl_ballista = s_cleanse.mdl_ballista;
    
    if ( !b_skipped && !var_19e802fa )
    {
        s_cleanse.var_5b7cf289 = 1;
        callback::on_connect( &function_7b4b880f );
        array::thread_all( getplayers(), &function_7b4b880f );
        level thread function_1f6e4a6d();
        s_summon = struct::get( #"hash_6e87a80cd6f532b3" );
        var_1f514a0c = util::spawn_model( s_summon.model, s_summon.origin, s_summon.angles );
        s_summon struct::delete();
        var_1f514a0c zm_utility::create_zombie_point_of_interest( undefined, 16, 10000 );
        var_1f514a0c zm_utility::create_zombie_point_of_interest_attractor_positions( undefined, undefined, 400, 1 );
        var_1f514a0c util::delay( float( function_60d95f53() ) / 1000, undefined, &clientfield::set, "" + #"hash_1187b848bf7868c5", 1 );
        wait 1;
        
        foreach ( e_player in getplayers() )
        {
            e_player playsoundtoplayer( #"hash_737ff3246a85fd0e", e_player );
        }
        
        wait 2;
        s_scene = struct::get( #"hash_1dda242c988113ce" );
        level scene::add_scene_func( s_scene.scriptbundlename, &function_67e537fd );
        s_scene thread scene::play();
        
        while ( !isdefined( s_cleanse.var_10d4f67d ) )
        {
            waitframe( 1 );
        }
        
        var_10d4f67d = s_cleanse.var_10d4f67d;
        mdl_fx = util::spawn_model( #"tag_origin", var_10d4f67d.origin, var_10d4f67d.angles );
        mdl_fx clientfield::set( "" + #"electric_storm", 1 );
        wait 2;
        var_10d4f67d clientfield::set( "" + #"hash_26ddf1f70bd1f67a", 1 );
        wait 0.1;
        mdl_ballista playrumbleonentity( #"hash_22cb25543ecfd0bf" );
        wait 3;
    }
    
    mdl_ballista playrumbleonentity( #"hash_32ed6d5a446f6a3a" );
    level scene::play( #"p8_fxanim_zm_red_ballista_bundle", "Shot 2" );
    
    if ( !b_skipped && !var_19e802fa )
    {
        var_10d4f67d clientfield::set( "" + #"hash_26ddf1f70bd1f67a", 0 );
        wait 2;
        
        foreach ( e_player in getplayers() )
        {
            e_player playsoundtoplayer( #"hash_737ff3246a85fd0e", e_player );
        }
        
        wait 1;
        s_scene scene::play( s_scene.scriptbundlename, "end" );
        mdl_fx clientfield::set( "" + #"electric_storm", 0 );
        mdl_fx thread util::delayed_delete( 1 );
        var_10d4f67d delete();
        var_1f514a0c delete();
        s_cleanse.var_5b7cf289 = 0;
        level notify( #"hash_3970f4ab245a1853" );
        w_thunderstorm = getweapon( #"thunderstorm" );
        
        foreach ( e_player in getplayers() )
        {
            if ( isdefined( e_player.var_69c1f71b ) && e_player.var_69c1f71b )
            {
                e_player ability_util::function_1a38f0b0( w_thunderstorm );
            }
        }
    }
    
    var_9520d62 = s_cleanse.var_8121ef9f;
    
    if ( isdefined( var_9520d62 ) )
    {
        level.var_b3b0d9d7 = var_9520d62;
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x2fab030c, Offset: 0x1ca30
// Size: 0x174
function function_f2fa1520()
{
    level endon( #"end_game", #"cleanse" + "_ended_early", #"hash_6a4f03503cfcfac4" );
    wait 20;
    a_e_players = util::get_active_players();
    a_e_players = array::randomize( a_e_players );
    
    foreach ( e_player in a_e_players )
    {
        if ( zm_utility::is_player_valid( e_player ) && e_player zm_audio::can_speak() )
        {
            b_played = e_player zm_vo::function_a2bd5a0c( #"hash_1ea1fc078a770c47" );
            break;
        }
    }
    
    if ( isdefined( b_played ) && b_played )
    {
        level thread function_7b345f6d( #"hash_792896baba5747bf" );
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x976120ea, Offset: 0x1cbb0
// Size: 0x1dc
function function_482dc5ac()
{
    level endon( #"end_game", #"cleanse" + "_ended_early", #"hash_6a4f03503cfcfac4" );
    s_target = struct::get( #"hash_5c0ec58a74f10a88" );
    v_target = s_target.origin;
    s_target struct::delete();
    
    while ( true )
    {
        foreach ( e_player in util::get_active_players() )
        {
            if ( zm_utility::is_player_valid( e_player ) && e_player zm_audio::can_speak() && e_player zm_utility::is_player_looking_at( v_target ) )
            {
                n_dist = distance2dsquared( e_player.origin, v_target );
                
                if ( n_dist <= 512 * 512 )
                {
                    e_player thread zm_audio::create_and_play_dialog( #"ballista", #"rises" );
                    return;
                }
            }
        }
        
        wait 2;
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x77529622, Offset: 0x1cd98
// Size: 0x94
function function_1f6e4a6d()
{
    level endon( #"end_game" );
    wait 1;
    s_cleanse = level.var_29e8cce2;
    e_player = s_cleanse.var_e935dae1;
    
    if ( zm_utility::is_player_valid( e_player ) )
    {
        e_player thread zm_audio::create_and_play_dialog( #"pegasus", #"summon" );
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 2
// Checksum 0xee3accc6, Offset: 0x1ce38
// Size: 0x172, Type: bool
function function_cecc7973( e_grenade, e_player )
{
    s_cleanse = level.var_29e8cce2;
    
    if ( isdefined( s_cleanse ) && isdefined( s_cleanse.var_5b7cf289 ) && s_cleanse.var_5b7cf289 )
    {
        if ( isdefined( e_grenade ) )
        {
            e_grenade.origin -= ( 0, 0, 2048 );
        }
        
        return false;
    }
    
    if ( isdefined( e_player ) )
    {
        s_cleanse = level.var_29e8cce2;
        var_740e1e0e = s_cleanse.var_740e1e0e;
        
        if ( isdefined( s_cleanse ) && isdefined( var_740e1e0e ) )
        {
            n_dist = distance2dsquared( e_player.origin, var_740e1e0e.origin );
            
            if ( n_dist <= 64 * 64 )
            {
                s_cleanse.var_e935dae1 = e_player;
                level notify( #"hash_6a4f03503cfcfac4" );
                
                if ( isdefined( e_grenade ) )
                {
                    e_grenade.origin -= ( 0, 0, 2048 );
                }
                
                return false;
            }
        }
    }
    
    return true;
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x22e43dd, Offset: 0x1cfb8
// Size: 0x16a
function function_7b4b880f()
{
    self notify( "3800075c6875cab1" );
    self endon( "3800075c6875cab1" );
    level endon( #"end_game", #"hash_3970f4ab245a1853" );
    self endon( #"disconnect" );
    w_thunderstorm = getweapon( #"thunderstorm" );
    
    while ( true )
    {
        while ( true )
        {
            a_w_gadgets = self._gadgets_player;
            
            if ( isdefined( a_w_gadgets ) && isinarray( a_w_gadgets, w_thunderstorm ) )
            {
                break;
            }
            
            waitframe( 1 );
        }
        
        self ability_util::function_e8aa75b8( w_thunderstorm );
        self.var_69c1f71b = 1;
        
        while ( true )
        {
            a_w_gadgets = self._gadgets_player;
            
            if ( isdefined( a_w_gadgets ) && !isinarray( a_w_gadgets, w_thunderstorm ) )
            {
                break;
            }
            
            waitframe( 1 );
        }
        
        self ability_util::function_1a38f0b0( w_thunderstorm );
        self.var_69c1f71b = 0;
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0xeb6b729d, Offset: 0x1d130
// Size: 0x9c
function function_67e537fd( a_ents )
{
    if ( isdefined( self.targetname ) && self.targetname != #"hash_1dda242c988113ce" )
    {
        return;
    }
    
    s_cleanse = level.var_29e8cce2;
    
    if ( isdefined( s_cleanse ) )
    {
        s_cleanse.var_10d4f67d = a_ents[ #"prop 1" ];
        level scene::remove_scene_func( self.scriptbundlename, &function_67e537fd );
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0xcee9db13, Offset: 0x1d1d8
// Size: 0x5c
function push_ballista_setup( b_skipped )
{
    level endon( #"end_game", #"push_ballista" + "_ended_early" );
    
    /#
        if ( b_skipped )
        {
            return;
        }
    #/
    
    function_4109a3a1();
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 2
// Checksum 0x5bf067ec, Offset: 0x1d240
// Size: 0x84
function push_ballista_cleanup( b_skipped, var_19e802fa )
{
    callback::remove_on_connect( &function_a2147cf );
    level notify( #"hash_4d110cc2383265e3" );
    
    if ( b_skipped || var_19e802fa )
    {
        level scene::play( #"p8_fxanim_zm_red_ballista_bundle", "Shot 6" );
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x26692b36, Offset: 0x1d2d0
// Size: 0x19e
function function_4109a3a1()
{
    level endon( #"end_game", #"push_ballista" + "_ended_early" );
    callback::on_connect( &function_a2147cf );
    level thread function_95210026();
    
    for ( i = 0; i < 4 ; i++ )
    {
        array::thread_all( getplayers(), &function_a2147cf );
        level waittill( #"hash_4d110cc2383265e3" );
        
        switch ( i )
        {
            case 0:
                str_shot = "Shot 3";
                break;
            case 1:
                str_shot = "Shot 4";
                break;
            case 2:
                str_shot = "Shot 5";
                break;
            case 3:
                str_shot = "Shot 6";
                break;
        }
        
        level scene::play( #"p8_fxanim_zm_red_ballista_bundle", str_shot );
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0xef47647b, Offset: 0x1d478
// Size: 0x18c
function function_95210026()
{
    level endon( #"end_game", #"push_ballista" + "_ended_early", #"hash_4d110cc2383265e3" );
    wait 1;
    s_cleanse = level.var_29e8cce2;
    mdl_ballista = s_cleanse.mdl_ballista;
    a_e_players = util::get_active_players();
    a_e_players = arraysortclosest( a_e_players, mdl_ballista.origin, undefined, 0, 512 );
    
    foreach ( e_player in a_e_players )
    {
        if ( zm_utility::is_player_valid( e_player ) && e_player zm_audio::can_speak() )
        {
            e_player thread zm_audio::create_and_play_dialog( #"ballista", #"stuck" );
            break;
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x3bf979c8, Offset: 0x1d610
// Size: 0x2a6
function function_a2147cf()
{
    self notify( "3313d94ce5b7d5e" );
    self endon( "3313d94ce5b7d5e" );
    level endon( #"end_game", #"push_ballista" + "_ended_early", #"hash_4d110cc2383265e3" );
    self endon( #"disconnect" );
    s_cleanse = level.var_29e8cce2;
    mdl_ballista = s_cleanse.mdl_ballista;
    
    while ( true )
    {
        var_afb3c2b3 = 0;
        
        while ( !self function_9bd33cca() )
        {
            waitframe( 1 );
        }
        
        b_pushed = 0;
        
        while ( self function_9bd33cca() )
        {
            v_ballista = mdl_ballista gettagorigin( "mid_moss_01_jnt" );
            n_dist = distance2dsquared( self.origin, v_ballista );
            var_5168e40f = self zm_utility::is_player_looking_at( v_ballista, 0.7, 0 );
            var_f62556c4 = mdl_ballista math::get_dot_right( self.origin ) > 0;
            b_pushing = n_dist <= 512 * 512 && var_5168e40f && var_f62556c4;
            
            if ( b_pushing )
            {
                n_start_time = gettime();
            }
            else
            {
                var_afb3c2b3 = 0;
            }
            
            waitframe( 1 );
            
            if ( b_pushing )
            {
                n_current_time = gettime();
                n_time_passed = float( n_current_time - n_start_time ) / 1000;
                var_afb3c2b3 += n_time_passed;
                
                if ( var_afb3c2b3 >= 1 )
                {
                    b_pushed = 1;
                    break;
                }
            }
        }
        
        if ( b_pushed )
        {
            level notify( #"hash_4d110cc2383265e3" );
            return;
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x90ca7c6, Offset: 0x1d8c0
// Size: 0xac, Type: bool
function function_9bd33cca()
{
    w_current = self getcurrentweapon();
    return zm_utility::is_player_valid( self ) && self attackbuttonpressed() && is_wonder_weapon( w_current, #"air", 0 ) && self.chargeshotlevel === 2 && self getweaponammoclip( w_current );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0xaf10eab7, Offset: 0x1d978
// Size: 0xd4
function ignite_ballista_setup( b_skipped )
{
    level endon( #"end_game", #"ignite_ballista" + "_ended_early" );
    
    /#
        if ( b_skipped )
        {
            return;
        }
    #/
    
    a_e_players = getplayers();
    callback::on_connect( &function_2b23b087 );
    array::thread_all( a_e_players, &function_2b23b087 );
    level thread function_995ff495();
    level waittill( #"hash_659f3fc9efbd4620" );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 2
// Checksum 0xbd14ee10, Offset: 0x1da58
// Size: 0x22c
function ignite_ballista_cleanup( b_skipped, var_19e802fa )
{
    callback::remove_on_connect( &function_2b23b087 );
    array::notify_all( getplayers(), #"hash_659f3fc9efbd4620" );
    s_strike = struct::get( #"hash_dfe5ea1e5b36d65" );
    s_stand = struct::get( #"hash_3e111145a5afc255" );
    s_strike struct::delete();
    s_stand struct::delete();
    s_cleanse = level.var_29e8cce2;
    mdl_ballista = s_cleanse.mdl_ballista;
    mdl_ballista clientfield::increment( "" + #"hash_508fc6409c815104" );
    wait 2;
    level thread scene::play( #"p8_fxanim_zm_red_ballista_bundle", "Shot 7" );
    level scene::play( #"p8_fxanim_zm_red_drakaina_bundle" );
    level zm_ui_inventory::function_7df6bb60( #"zm_red_objective_progress", 7 );
    playsoundatposition( #"hash_489109cc61ab6258", ( 0, 0, 0 ) );
    level clientfield::set( "" + #"hash_51e28147388ee3d8", 0 );
    exploder::stop_exploder( "fxexp_barrier_egg_hit" );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x402f9f30, Offset: 0x1dc90
// Size: 0x256
function function_2b23b087()
{
    self notify( "3bd01db8602ba8a7" );
    self endon( "3bd01db8602ba8a7" );
    level endon( #"end_game", #"ignite_ballista" + "_ended_early", #"hash_659f3fc9efbd4620" );
    self endon( #"disconnect" );
    s_strike = struct::get( #"hash_dfe5ea1e5b36d65" );
    s_stand = struct::get( #"hash_3e111145a5afc255" );
    v_strike = s_strike.origin;
    v_stand = s_stand.origin;
    
    while ( true )
    {
        s_waitresult = self waittill( #"weapon_melee_power", #"weapon_melee" );
        w_weapon = s_waitresult.weapon;
        
        if ( zm_utility::is_player_valid( self ) && isdefined( w_weapon ) && isdefined( w_weapon.isriotshield ) && w_weapon.isriotshield && isdefined( self.var_b0cde18d ) && self.var_b0cde18d )
        {
            n_dist = distance2dsquared( self.origin, v_stand );
            
            if ( n_dist <= 64 * 64 )
            {
                var_39b20ef6 = self zm_utility::is_player_looking_at( v_strike, 0.9, 0 );
                
                if ( var_39b20ef6 )
                {
                    s_cleanse = level.var_29e8cce2;
                    s_cleanse.var_fabe5be7 = self;
                    level notify( #"hash_659f3fc9efbd4620" );
                    return;
                }
            }
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x7f49254b, Offset: 0x1def0
// Size: 0x10c
function function_995ff495()
{
    level endon( #"end_game", #"ignite_ballista" + "_ended_early" );
    wait 1;
    
    foreach ( e_player in util::get_active_players() )
    {
        if ( zm_utility::is_player_valid( e_player ) && e_player function_3d581a6( #"air", 0 ) )
        {
            e_player thread zm_vo::function_a2bd5a0c( #"hash_6838bb9002545093" );
            break;
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0x386d574, Offset: 0x1e008
// Size: 0x21c
function teleport_setup( b_skipped )
{
    level endon( #"end_game", #"teleport" + "_ended_early" );
    
    /#
        if ( b_skipped )
        {
            return;
        }
    #/
    
    level thread function_c54d30d5();
    
    while ( true )
    {
        var_eb75c56d = 0;
        
        foreach ( e_player in util::get_active_players() )
        {
            str_zone = e_player zm_utility::get_current_zone();
            
            if ( str_zone === "zone_drakaina_arena" )
            {
                var_eb75c56d = 1;
                break;
            }
        }
        
        if ( var_eb75c56d )
        {
            break;
        }
        
        wait 1;
    }
    
    level thread function_d67d9a14();
    s_unitrigger = struct::get( #"hash_5112e768ad998b70" );
    s_unitrigger zm_unitrigger::create( &function_72004612 );
    s_cleanse = level.var_29e8cce2;
    level thread scene::init_streamer( #"aib_vign_cust_zm_red_boss_intro", #"allies" );
    
    while ( true )
    {
        s_unitrigger waittill( #"trigger_activated" );
        
        if ( isdefined( s_cleanse.b_all_players_ready ) && s_cleanse.b_all_players_ready )
        {
            break;
        }
    }
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 2
// Checksum 0x8f73a6b5, Offset: 0x1e230
// Size: 0x114
function teleport_cleanup( b_skipped, var_19e802fa )
{
    level notify( #"cleanse_teleported" );
    level flag::set( #"hash_5a7f1f9adac6dc8c" );
    callback::remove_on_connect( &function_dcc3c705 );
    s_unitrigger = struct::get( #"hash_5112e768ad998b70" );
    
    if ( isdefined( s_unitrigger.s_unitrigger ) )
    {
        zm_unitrigger::unregister_unitrigger( s_unitrigger.s_unitrigger );
        s_unitrigger.s_unitrigger = undefined;
    }
    
    s_unitrigger struct::delete();
    level.var_29e8cce2 struct::delete();
    level thread red_boss_battle::function_3a2efd4e( 0 );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x3fa0c9ba, Offset: 0x1e350
// Size: 0x174
function function_c54d30d5()
{
    level endon( #"end_game" );
    wait 1;
    level zm_vo::function_3c173d37( ( 0, 0, 0 ), 2147483647 );
    level zm_audio::sndvoxoverride( 1 );
    waitframe( 1 );
    s_cleanse = level.var_29e8cce2;
    e_player = s_cleanse.var_fabe5be7;
    
    if ( zm_utility::is_player_valid( e_player ) )
    {
        e_player zm_vo::function_a2bd5a0c( #"hash_3280eb0abc8ec3ed" );
    }
    
    level zm_audio::sndvoxoverride( 0 );
    level flag::wait_till( #"hash_f38b18eaf7b063b" );
    level zm_vo::function_3c173d37( ( 0, 0, 0 ), 2147483647 );
    level zm_audio::sndvoxoverride( 1 );
    waitframe( 1 );
    function_7b345f6d( #"hash_50daf567c473d26d" );
    level zm_audio::sndvoxoverride( 0 );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x199f2ee8, Offset: 0x1e4d0
// Size: 0x12c
function function_d67d9a14()
{
    level endon( #"end_game", #"cleanse_teleported" );
    level flag::set( #"hash_f38b18eaf7b063b" );
    level clientfield::set( "" + #"hash_16e27bea0cc1b56b", 0 );
    level clientfield::set( "" + #"cleanse_portal", 1 );
    level thread scene::play( #"p8_fxanim_zm_red_omphalos_egg_bundle" );
    wait 0.25;
    level clientfield::set( "" + #"hash_1c97c11fb59eb4bf", 2 );
    level thread function_e8e36e67();
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 0
// Checksum 0x979a22b1, Offset: 0x1e608
// Size: 0x1ec
function function_e8e36e67()
{
    level endon( #"end_game" );
    level flag::wait_till( #"hash_5a7f1f9adac6dc8c" );
    level clientfield::set( "" + #"cleanse_portal", 0 );
    level clientfield::set( "" + #"hash_51858e923e750c33", 0 );
    level clientfield::set( "" + #"hash_2b05d4c6217bac22", 0 );
    level clientfield::set( "" + #"hash_3836d3a94cf05642", 0 );
    level clientfield::set( "" + #"hash_53e684a319647b40", 0 );
    level clientfield::set( "" + #"hash_70e157c389c1c02f", 0 );
    level clientfield::set( "" + #"hash_4f59799617fef9c7", 0 );
    level clientfield::set( "" + #"hash_31a10d565ae05ddb", 0 );
    level clientfield::set( "" + #"hash_1c97c11fb59eb4bf", 0 );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0x2874ce33, Offset: 0x1e800
// Size: 0x1ce, Type: bool
function function_72004612( e_player )
{
    s_teleport = struct::get( #"hash_5112e768ad998b70" );
    v_teleport = s_teleport.origin;
    b_ready = 1;
    
    foreach ( e_battler in util::get_active_players() )
    {
        n_dist = distance2dsquared( e_battler.origin, v_teleport );
        
        if ( n_dist > 128 * 128 )
        {
            b_ready = 0;
            break;
        }
    }
    
    if ( b_ready )
    {
        str_prompt = zm_utility::function_d6046228( #"hash_cb9ec6ff4ccecb8", #"hash_2bbe0121500d0f4" );
        self sethintstringforplayer( e_player, str_prompt );
    }
    else
    {
        self sethintstringforplayer( e_player, #"hash_45fd3f34a60262a3" );
    }
    
    s_cleanse = level.var_29e8cce2;
    s_cleanse.b_all_players_ready = b_ready;
    return true;
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0x54d204cd, Offset: 0x1e9d8
// Size: 0x226
function function_7b345f6d( str_alias )
{
    var_3562ed6 = [];
    
    foreach ( e_player in getplayers() )
    {
        if ( e_player zm_audio::can_speak( 1 ) && !( isdefined( e_player.isspeaking ) && e_player.isspeaking ) && !( isdefined( e_player.var_5b6ebfd0 ) && e_player.var_5b6ebfd0 ) )
        {
            if ( !isdefined( var_3562ed6 ) )
            {
                var_3562ed6 = [];
            }
            else if ( !isarray( var_3562ed6 ) )
            {
                var_3562ed6 = array( var_3562ed6 );
            }
            
            var_3562ed6[ var_3562ed6.size ] = e_player;
        }
    }
    
    if ( var_3562ed6.size == 0 )
    {
        return 0;
    }
    
    foreach ( i, e_player in var_3562ed6 )
    {
        var_dc5f4a1c = i + 1 == var_3562ed6.size;
        
        if ( !var_dc5f4a1c )
        {
            e_player thread zm_vo::vo_say( str_alias, undefined, undefined, undefined, 1 );
            continue;
        }
        
        b_played = e_player zm_vo::vo_say( str_alias, undefined, undefined, undefined, 1 );
    }
    
    return b_played;
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0x606449c0, Offset: 0x1ec08
// Size: 0x24
function function_6f55d670( var_a276c861 )
{
    level waittill( #"fake_waittill" );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 2
// Checksum 0x37f1d5c5, Offset: 0x1ec38
// Size: 0x14
function function_13c87ace( var_a276c861, var_19e802fa )
{
    
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 1
// Checksum 0xf3ed1d9, Offset: 0x1ec58
// Size: 0xf4
function narrative_room( var_a276c861 )
{
    level flag::set( #"connect_portico_zones" );
    mdl_door = getent( "portico_model", "targetname" );
    mdl_door rotateyaw( 129, 1.6 );
    var_3400a741 = getentarray( "portico_clip", "targetname" );
    array::run_all( var_3400a741, &delete );
    level clientfield::set( "" + #"narrative_room", 1 );
}

// Namespace zm_red_main_quest/zm_red_main_quest
// Params 2
// Checksum 0x7f52e25e, Offset: 0x1ed58
// Size: 0x14
function narrative_room_cleanup( var_a276c861, var_19e802fa )
{
    
}

/#

    // Namespace zm_red_main_quest/zm_red_main_quest
    // Params 0
    // Checksum 0xca5d2bbd, Offset: 0x1ed78
    // Size: 0x3b4, Type: dev
    function function_69e1a1fc()
    {
        level flag::wait_till( "<dev string:x19c>" );
        
        if ( !isdefined( level.var_9d581f96 ) )
        {
            level.var_9d581f96 = 0;
        }
        
        if ( !level.var_9d581f96 )
        {
            level.var_9d581f96 = 1;
            level clientfield::set( "<dev string:x1b2>" + #"hash_51858e923e750c33", 2 );
            level clientfield::set( "<dev string:x1b2>" + #"hash_2b05d4c6217bac22", 2 );
            level clientfield::set( "<dev string:x1b2>" + #"hash_3836d3a94cf05642", 2 );
            level clientfield::set( "<dev string:x1b2>" + #"hash_53e684a319647b40", 2 );
            level clientfield::set( "<dev string:x1b2>" + #"hash_70e157c389c1c02f", 1 );
            level clientfield::set( "<dev string:x1b2>" + #"hash_4f59799617fef9c7", 1 );
            level clientfield::set( "<dev string:x1b2>" + #"hash_31a10d565ae05ddb", 2 );
            level clientfield::set( "<dev string:x1b2>" + #"hash_1c97c11fb59eb4bf", 1 );
            return;
        }
        
        level.var_9d581f96 = 0;
        level clientfield::set( "<dev string:x1b2>" + #"hash_51858e923e750c33", 0 );
        level clientfield::set( "<dev string:x1b2>" + #"hash_2b05d4c6217bac22", 0 );
        level clientfield::set( "<dev string:x1b2>" + #"hash_3836d3a94cf05642", 0 );
        level clientfield::set( "<dev string:x1b2>" + #"hash_53e684a319647b40", 0 );
        level clientfield::set( "<dev string:x1b2>" + #"hash_70e157c389c1c02f", 0 );
        level clientfield::set( "<dev string:x1b2>" + #"hash_4f59799617fef9c7", 0 );
        level clientfield::set( "<dev string:x1b2>" + #"hash_31a10d565ae05ddb", 0 );
        level clientfield::set( "<dev string:x1b2>" + #"hash_1c97c11fb59eb4bf", 0 );
    }

    // Namespace zm_red_main_quest/zm_red_main_quest
    // Params 1
    // Checksum 0xa6c1360a, Offset: 0x1f138
    // Size: 0x124, Type: dev
    function function_25bb4829( var_57c9944e )
    {
        foreach ( e_player in getplayers() )
        {
            w_current = e_player getcurrentweapon();
            
            if ( isdefined( w_current.isriotshield ) && w_current.isriotshield )
            {
                if ( !( isdefined( e_player.var_b4f85096 ) && e_player.var_b4f85096 ) )
                {
                    e_player thread function_fbc44c3e();
                    
                    if ( var_57c9944e )
                    {
                        e_player notify( #"hash_cbf6a8f73a300c8" );
                    }
                    
                    continue;
                }
                
                e_player notify( #"hash_459246e5bfcc3713" );
            }
        }
    }

#/
