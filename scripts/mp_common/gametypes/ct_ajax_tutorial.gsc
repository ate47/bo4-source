#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;
#using scripts\core_common\values_shared;
#using scripts\killstreaks\killstreaks_shared;
#using scripts\mp_common\gametypes\ct_bots;
#using scripts\mp_common\gametypes\ct_gadgets;
#using scripts\mp_common\gametypes\ct_utils;
#using scripts\mp_common\gametypes\ct_vo;
#using scripts\mp_common\gametypes\globallogic_score;

#namespace ct_ajax_tutorial;

// Namespace ct_ajax_tutorial/ct_ajax_tutorial
// Params 0
// Checksum 0xb622316, Offset: 0x1068
// Size: 0x9e
function init()
{
    level flag::init( "grenade_exp" );
    level.var_d0ad09c5 = &function_d0ad09c5;
    level.var_ae120f18 = array( #"hash_87a98c043a87965", #"hash_87a97c043a877b2" );
    level.var_e72728b8 = array( #"sig_buckler_dw" );
}

// Namespace ct_ajax_tutorial/ct_ajax_tutorial
// Params 1
// Checksum 0xf82163a2, Offset: 0x1110
// Size: 0x2c
function function_d0ad09c5( effect )
{
    wait randomfloatrange( 0, 0.5 );
}

// Namespace ct_ajax_tutorial/ct_ajax_tutorial
// Params 0
// Checksum 0xf220c55a, Offset: 0x1148
// Size: 0x4ba
function function_c9ff0dce()
{
    self.overrideplayerdamage = &callback_player_damage;
    
    if ( self.team == #"allies" )
    {
        self ct_utils::player_reset();
        self thread player_grenade_watcher();
        self thread function_f9eac817();
        self thread function_4e23716d();
        
        if ( !isbot( self ) )
        {
            ct_utils::function_8f04870f();
            var_9cfc44ff = 0;
            
            if ( isdefined( level.var_ad7c0539 ) )
            {
                switch ( level.var_ad7c0539 )
                {
                    case 2:
                    case 9:
                        var_9cfc44ff = 1;
                        self thread ct_bots::function_fd2d220e( 0 );
                        break;
                    case 4:
                    case 5:
                        var_9cfc44ff = 1;
                        self thread ct_gadgets::function_9dc27b4f( #"sig_buckler_dw", array( #"sig_buckler_dw", #"eq_swat_grenade" ), array( #"eq_swat_grenade" ) );
                        break;
                    case 6:
                    case 7:
                        var_9cfc44ff = 1;
                        self thread ct_gadgets::function_9dc27b4f( #"sig_buckler_dw", array( #"sig_buckler_dw", #"eq_swat_grenade" ) );
                        break;
                }
            }
            else
            {
                level.var_e72728b8 = array( #"sig_buckler_dw" );
            }
            
            if ( !var_9cfc44ff && isdefined( level.b_bare_hands ) && level.b_bare_hands )
            {
                self thread ct_gadgets::function_952b1db2();
            }
        }
        
        return;
    }
    
    if ( self.team == #"axis" )
    {
        self thread ct_utils::function_5149c890( 1 );
        
        if ( isdefined( level.var_7b46025 ) )
        {
            switch ( level.var_ad7c0539 )
            {
                case 1:
                    self val::set( #"grenade_bot", "ignoreall", 1 );
                    self thread function_58c62280( 0 );
                    break;
                case 2:
                    self val::set( #"grenade_bot", "ignoreall", 1 );
                    self.script_accuracy = 0.3;
                    self thread function_58c62280( 0 );
                    break;
                case 6:
                    self thread function_77e3ea7();
                    self thread function_58c62280( 1 );
                    break;
                case 8:
                    self thread function_58c62280( 1 );
                    break;
                default:
                    self val::set( #"grenade_bot", "ignoreall", 1 );
                    self thread function_58c62280( 1 );
                    break;
            }
        }
    }
}

// Namespace ct_ajax_tutorial/ct_ajax_tutorial
// Params 11
// Checksum 0x8a058e2e, Offset: 0x1610
// Size: 0x278
function callback_player_damage( e_inflictor, e_attacker, n_damage, n_dflags, str_means_of_death, weapon, v_point, v_dir, str_hit_loc, n_psoffsettime, var_8b69d5cf )
{
    level notify( #"player_damaged" );
    
    if ( !isdefined( level.var_ad7c0539 ) )
    {
        return n_damage;
    }
    
    switch ( level.var_ad7c0539 )
    {
        case 1:
        case 2:
            if ( isdefined( weapon ) && ( weapon.name == #"hash_3f62a872201cd1ce" || weapon.name == #"eq_swat_grenade" ) )
            {
                if ( self.health < 10 )
                {
                    self.health = 10;
                }
                
                return 0;
            }
            
            break;
        case 4:
            if ( isdefined( weapon ) && weapon.name == #"sig_buckler_turret" )
            {
                if ( self.health < 151 )
                {
                    self.health = 151;
                }
                
                return 0;
            }
            
            break;
    }
    
    if ( !( isdefined( level.var_a600ce76 ) && level.var_a600ce76 && str_means_of_death !== "MOD_GRENADE_SPLASH" ) )
    {
        self.var_147223cf = gettime() / 1000;
    }
    
    if ( !isbot( self ) )
    {
        if ( isdefined( weapon ) && ( weapon.name == #"recon_car" || weapon.name == #"hash_38ffd09564931482" ) )
        {
            self.health += 1;
            n_damage = 1;
        }
        
        if ( isdefined( level.var_bf4ff87f ) )
        {
            n_damage *= level.var_bf4ff87f;
        }
    }
    
    return n_damage;
}

// Namespace ct_ajax_tutorial/ct_ajax_tutorial
// Params 9
// Checksum 0xf8d853cd, Offset: 0x1890
// Size: 0x11c
function function_72ba0df6( einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration )
{
    if ( self.team == #"axis" )
    {
        self.isinuse = 0;
        
        if ( level.var_ad7c0539 === 5 )
        {
            if ( smeansofdeath == "MOD_MELEE_WEAPON_BUTT" )
            {
                level.b_melee_kill = 1;
            }
        }
        
        if ( level.var_ad7c0539 === 9 )
        {
            e_player = ct_utils::get_player();
            
            if ( !( isdefined( e_player.var_51ff7a58 ) && e_player.var_51ff7a58 ) && isalive( e_player ) )
            {
                function_c3ccdcf5();
            }
        }
    }
}

// Namespace ct_ajax_tutorial/ct_ajax_tutorial
// Params 0
// Checksum 0xd638d8db, Offset: 0x19b8
// Size: 0x88c
function function_9b9525e9()
{
    level endon( #"combattraining_logic_finished" );
    level.var_e6db911d = 1;
    level.var_fa76e237 = undefined;
    level.var_a188abf = undefined;
    level thread ct_utils::function_9ab507a9( "courtyard_collision", "start_courtyard_collision", "stop_courtyard_collision", undefined, 1, 0 );
    level thread ct_utils::function_9ab507a9( "courtyard_collision_door", "start_courtyard_collision_door", "stop_courtyard_collision_door", undefined, 1, 0 );
    level thread ct_utils::function_9ab507a9( "permanent_shield_collision", "start_permanent_shield_collision", "stop_permanent_collision", undefined, 1, 1 );
    level thread ct_utils::function_9ab507a9( "permanent_rcxd_collision", "start_permanent_rcxd_collision", "stop_permanent_rcxd_collision", undefined, 1, 1 );
    level thread ct_utils::function_9ab507a9( "use_shield_collision_open_path", "start_shield_path_collision", "stop_shield_path_collision", undefined, 1, 1 );
    level thread ct_utils::function_9ab507a9( "use_shield_collision", "start_use_shield_collision", "stop_use_shield_collision", undefined, 1, 1 );
    level thread ct_utils::function_9ab507a9( "use_shield_melee_guy", "start_shield_melee_collision", "stop_shield_melee_collision", undefined, 1, 1 );
    level thread ct_utils::function_9ab507a9( "shield_staircase_collision", "start_shield_staircase_collision", "stop_shield_staircase_collision", undefined, 1, 1 );
    level thread ct_utils::function_9ab507a9( "shield_cook_collision", "start_shield_cook_collision", "stop_shield_cook_collision", undefined, 1, 1 );
    level thread ct_utils::function_9ab507a9( "fortify_shield_collision", "start_fortify_shield_collision", "stop_fortify_shield_collision", undefined, 1, 1 );
    level thread ct_utils::function_9ab507a9( "fortify_shield_complete_collision", "start_fortify_shield_complete_collision", "stop_fortify_shield_complete_collision", undefined, 1, 1 );
    level thread ct_utils::function_9ab507a9( "fortify_window_collision", "start_fortify_window_collision", "stop_fortify_window_collision", undefined, 1, 1 );
    level thread ct_utils::function_9ab507a9( "enemy_hardpoint_collision", "start_enemy_hardpoint_collision", "stop_enemy_hardpoint_collision", undefined, 1, 0 );
    level thread ct_utils::function_9ab507a9( "hp_backwards_collision", "start_hp_backwards_collision", "stop_hp_backwards_collision", undefined, 1, 0 );
    level thread ct_utils::function_9ab507a9( "run_clear_collision", "start_run_clear_collision", "stop_run_clear_collision", undefined, 1, 0 );
    level thread ct_utils::function_9ab507a9( "open_car_blocker_collision", "start_open_car_blocker_collision", "stop_open_car_blocker_collision", undefined, 1, 0 );
    level thread ct_utils::function_9ab507a9( "car_kill_collision", "start_car_kill_collision", "stop_car_kill_collision", undefined, 1, 0 );
    level thread ct_utils::function_9ab507a9( "car_blocker_collision", "start_car_blocker_collision", "stop_car_blocker_collision", undefined, 1, 0 );
    level thread ct_utils::function_9ab507a9( "car_blocker_exit_collision", "start_car_blocker_exit_collision", "stop_car_blocker_exit_collision", undefined, 1, 0 );
    level thread ct_utils::function_9ab507a9( "rcxd_collision", "start_rcxd_collision", "stop_rcxd_collision", undefined, 1, 0 );
    level thread ct_utils::function_9ab507a9( "hardpoint_navmesh_collision", "start_hardpoint_navmesh_collision", "stop_hardpoint_navmesh_collision", undefined, 1, 1 );
    level thread ct_utils::function_9ab507a9( "hp_ai_collision", "start_hp_ai_collision", "stop_hp_ai_collision", undefined, 1, 0 );
    level thread ct_utils::function_9ab507a9( "init_killstreak_collision", "start_init_killstreak_collision", "stop_init_killstreak_collision", undefined, 1, 0 );
    e_player = getplayers()[ 0 ];
    e_player ct_utils::function_6ad0c151();
    a_nodes = getnodearray( "disable_node", "script_noteworthy" );
    
    foreach ( node in a_nodes )
    {
        setenablenode( node, 0 );
    }
    
    level.var_d4668c34 = 1;
    level.var_ad7c0539 = 1;
    function_732cbc35();
    level.var_ad7c0539 = 2;
    function_f907b408();
    level.var_ad7c0539 = 3;
    function_c6e7b0d9();
    level.var_c4002ed1 = 1;
    e_player = getplayers()[ 0 ];
    e_player disableweaponcycling();
    e_player function_4488a530( 1 );
    level.var_ad7c0539 = 4;
    function_9d1bba67();
    level.var_ad7c0539 = 5;
    function_b87295f2();
    level.var_ad7c0539 = 6;
    function_9f3ecaf2();
    level.var_ad7c0539 = 7;
    function_8c3101de();
    e_player = getplayers()[ 0 ];
    e_player enableweaponcycling();
    level.var_ad7c0539 = 8;
    function_4a9cfde5();
    level.var_ad7c0539 = 9;
    function_109c0cc2();
    globallogic_score::_setplayermomentum( e_player, 0 );
    level.var_e72728b8 = array( #"sig_buckler_dw", #"eq_swat_grenade" );
    a_str_vo = array( #"hash_7f0714797e19dd7f", #"hash_7f0713797e19dbcc" );
    ct_vo::function_831e0584( a_str_vo, 1 );
    ct_utils::onboarding_complete();
}

// Namespace ct_ajax_tutorial/ct_ajax_tutorial
// Params 0
// Checksum 0x8c94aeca, Offset: 0x2250
// Size: 0x32c
function function_732cbc35()
{
    level endon( #"combattraining_logic_finished" );
    ct_utils::function_e9ab1003( "s_ajax_start_loc" );
    e_player = getplayers()[ 0 ];
    e_player thread ct_utils::function_61c3d59c( #"hash_61357f8063d72c40", undefined );
    e_player val::set( #"grenade", "ignoreme", 1 );
    level.var_e72728b8 = array( #"sig_buckler_dw", #"eq_swat_grenade" );
    e_player = getplayers()[ 0 ];
    v_forward = anglestoforward( e_player.angles );
    v_pos = e_player.origin + v_forward * 60;
    e_player thread ct_utils::player_collisionbox( undefined, v_pos, 0 );
    ct_vo::function_3ca1b77d();
    var_5be6a7a9 = array( #"hash_6a49c57530e1762c" );
    var_49a50326 = array( #"hash_6a49c67530e177df" );
    var_c897b566 = array( #"hash_1af148e151d2c10e" );
    var_eed14f5e = array( #"hash_1a4f889ff65c0a0c" );
    function_593bdda2( 1, 1, var_eed14f5e, 0, var_5be6a7a9, var_49a50326, var_c897b566 );
    level.var_e72728b8 = array( #"sig_buckler_dw", #"eq_swat_grenade" );
    level notify( #"hash_4d65fa7bba19c892" );
    wait 0.1;
    ct_vo::function_3ca1b77d();
    ct_vo::function_831e0584( array( "vox_tvoi_tutor_ajax_flash_stunned_0" ), 1 );
    e_player = getplayers()[ 0 ];
    e_player val::reset( #"grenade", "ignoreme" );
}

// Namespace ct_ajax_tutorial/ct_ajax_tutorial
// Params 0
// Checksum 0xe14b9788, Offset: 0x2588
// Size: 0xc8
function function_f29a3861()
{
    level endon( #"hash_4d65fa7bba19c892", #"combattraining_logic_finished" );
    level.var_fa76e237 = undefined;
    
    while ( true )
    {
        if ( isdefined( level.var_fa76e237 ) && level.var_fa76e237 > 1 )
        {
            e_player = getplayers()[ 0 ];
            e_player ct_utils::function_329f9ba6( #"hash_629d4f9c61888a79", 4, "green", 2, 1 );
            level.var_fa76e237 = undefined;
        }
        
        waitframe( 1 );
    }
}

// Namespace ct_ajax_tutorial/ct_ajax_tutorial
// Params 2
// Checksum 0x63208f47, Offset: 0x2658
// Size: 0x180
function function_f8ee8801( var_68e5d590, a_str_vo )
{
    level endon( #"hash_6c4f5054a4889eb4", #"combattraining_logic_finished" );
    
    while ( true )
    {
        if ( isdefined( level.var_fa76e237 ) )
        {
            if ( !isdefined( var_68e5d590 ) || level.var_fa76e237 == var_68e5d590 )
            {
                var_beeee781 = ct_utils::function_ee33a140();
                
                if ( var_beeee781 == 0 )
                {
                    if ( !ct_vo::function_5d127774() )
                    {
                        var_1069c3d2 = 0;
                        n_time = gettime() / 1000;
                        
                        if ( isdefined( level.var_6ee32682 ) )
                        {
                            dt = n_time - level.var_6ee32682;
                            
                            if ( dt < 8 )
                            {
                                var_1069c3d2 = 1;
                            }
                        }
                        
                        dt = n_time - level.var_a72fad31;
                        
                        if ( dt > 6 )
                        {
                            var_1069c3d2 = 1;
                        }
                        
                        if ( !var_1069c3d2 )
                        {
                            level.var_6ee32682 = n_time;
                            ct_vo::function_831e0584( a_str_vo, 1 );
                            level.var_fa76e237 = undefined;
                        }
                    }
                }
            }
        }
        
        waitframe( 1 );
    }
}

// Namespace ct_ajax_tutorial/ct_ajax_tutorial
// Params 0
// Checksum 0x3a6e4ea0, Offset: 0x27e0
// Size: 0x216
function function_f907b408()
{
    level endon( #"combattraining_logic_finished" );
    e_player = getplayers()[ 0 ];
    e_player thread ct_utils::function_61c3d59c( #"hash_61357f8063d72c40", undefined );
    var_1f1e8cf1 = array( "vox_tvoi_tutor_ajax_flash_cook_lvl3_0" );
    var_eed14f5e = array( #"hash_14fd3bd7532cdcf3" );
    level thread function_593bdda2( 2, 0, var_eed14f5e, 1, var_1f1e8cf1, undefined, undefined );
    level thread function_192a6db2();
    var_65a3553e = "ajax_soldier_loc_2";
    level.var_7b46025 = struct::get_array( 1, var_65a3553e );
    level.var_47cd3e56 = 0;
    level thread ct_bots::activate_bots( level.var_7b46025.size, #"axis" );
    var_c897b566 = array( #"hash_563e6afd71dd6968" );
    level thread ct_vo::function_14b08e49( var_c897b566, "kill_off_enemies" );
    level waittill( #"hash_59ab222626525669" );
    ct_vo::function_3ca1b77d();
    ct_vo::function_831e0584( array( #"hash_21e513f28d50977" ) );
    ct_vo::function_3ca1b77d();
    level.var_d0ad09c5 = undefined;
}

// Namespace ct_ajax_tutorial/ct_ajax_tutorial
// Params 0
// Checksum 0x94665efa, Offset: 0x2a00
// Size: 0x1b8
function function_192a6db2()
{
    level endon( #"combattraining_logic_finished", #"hash_59ab222626525669" );
    
    while ( true )
    {
        e_player = getplayers()[ 0 ];
        a_bots = e_player ct_bots::function_dde6edbd();
        
        foreach ( bot in a_bots )
        {
            if ( isdefined( bot.var_ef9b6f0b ) && bot.var_ef9b6f0b && !( isdefined( bot.var_d31bfee0 ) && bot.var_d31bfee0 ) )
            {
                bot val::set( #"stunned_bot", "ignoreall", 1 );
                bot.var_d31bfee0 = 1;
                continue;
            }
            
            if ( isdefined( bot.var_d31bfee0 ) && bot.var_d31bfee0 )
            {
                bot val::reset( #"stunned_bot", "ignoreall" );
                bot.var_d31bfee0 = 0;
            }
        }
        
        waitframe( 1 );
    }
}

// Namespace ct_ajax_tutorial/ct_ajax_tutorial
// Params 7
// Checksum 0xdc0e0c0f, Offset: 0x2bc0
// Size: 0x6d8
function function_593bdda2( n_level, var_e8d6f89, var_eed14f5e, var_ec3da253, var_8bc5c0cf, var_5833e5c1, var_c897b566 )
{
    level endon( #"combattraining_logic_finished" );
    
    if ( isdefined( var_8bc5c0cf ) )
    {
        ct_vo::function_831e0584( var_8bc5c0cf, 1 );
    }
    
    ct_vo::function_3ca1b77d();
    level.var_e72728b8 = array( #"sig_buckler_dw" );
    wait 0.3;
    e_player = getplayers()[ 0 ];
    e_player thread ct_utils::function_61c3d59c( var_eed14f5e[ 0 ], undefined );
    
    if ( isdefined( var_5833e5c1 ) )
    {
        level thread ct_vo::function_831e0584( var_5833e5c1, 1 );
    }
    
    if ( var_e8d6f89 > 0 )
    {
        var_65a3553e = "ajax_soldier_loc_" + n_level;
        level.var_7b46025 = struct::get_array( 1, var_65a3553e );
        level.var_47cd3e56 = 0;
        
        if ( !isdefined( level.var_7b46025 ) || level.var_7b46025.size == 0 )
        {
            wait 0.1;
            ct_utils::function_c2a10fc();
            ct_vo::function_3ca1b77d();
            level notify( #"hash_59ab222626525669" );
            return;
        }
        
        level thread ct_bots::activate_bots( level.var_7b46025.size, #"axis" );
    }
    
    if ( isdefined( var_c897b566 ) )
    {
        level thread ct_vo::function_14b08e49( var_c897b566, "stop_nag" );
    }
    
    wait 0.1;
    
    if ( n_level == 1 )
    {
    }
    
    while ( true )
    {
        var_beeee781 = ct_utils::function_ee33a140();
        
        if ( var_beeee781 == 1 && level flag::get( "grenade_exp" ) )
        {
            if ( isdefined( level.var_fa76e237 ) && n_level == 1 && level.var_fa76e237 > n_level )
            {
                if ( !ct_vo::function_5d127774() )
                {
                    level thread ct_vo::function_831e0584( array( #"hash_637aa6efdccd7d3b" ), 1 );
                }
            }
            
            if ( isdefined( level.var_fa76e237 ) && n_level == level.var_fa76e237 )
            {
                break;
            }
            else if ( n_level != 1 )
            {
                if ( !ct_vo::function_5d127774() )
                {
                    a_str_vo = array( "vox_tvoi_tutor_ajax_flash_cook_lvl3_fail" );
                    ct_vo::function_831e0584( a_str_vo, 1 );
                    n_time = gettime() / 1000;
                    var_3991eccb = n_time;
                }
            }
        }
        
        waitframe( 1 );
    }
    
    level.var_e72728b8 = array( #"sig_buckler_dw" );
    level notify( #"stop_nag" );
    ct_utils::function_c2a10fc();
    ct_vo::function_3ca1b77d();
    
    if ( isdefined( var_ec3da253 ) && var_ec3da253 )
    {
        level notify( #"kill_off_enemies" );
        level notify( #"hash_6c4f5054a4889eb4" );
        ct_vo::function_3ca1b77d();
        a_str_vo = array( "vox_tvoi_tutor_ajax_flash_cook_lvl3_bang" );
        level thread ct_vo::function_831e0584( a_str_vo, 0 );
        ct_utils::function_c2a10fc();
        wait 0.1;
        level notify( #"hash_24bd25e0736c3ca3" );
        level notify( #"hash_4c9c5fbc89779e64" );
        level notify( #"start_courtyard_collision" );
        level notify( #"start_courtyard_collision_door" );
        level.var_bf4ff87f = 0.2;
        e_player = getplayers()[ 0 ];
        e_player thread ct_utils::function_61c3d59c( #"hash_6f09eaccd74feff5", undefined );
        e_player thread ct_utils::function_84181d75( 0, undefined, undefined );
        wait 0.1;
        ct_utils::function_b05a86bc( #"axis", 800, 0 );
        e_player ct_bots::function_fd2d220e();
        
        while ( true )
        {
            e_player = getplayers()[ 0 ];
            a_bots = e_player ct_bots::function_dde6edbd();
            
            if ( a_bots.size == 0 )
            {
                break;
            }
            
            waitframe( 1 );
        }
        
        ct_utils::function_c2a10fc();
        e_player = getplayers()[ 0 ];
        e_player ct_bots::function_26d45f32( 1 );
        level.var_bf4ff87f = undefined;
    }
    
    wait 0.1;
    level.var_7b46025 = undefined;
    level notify( #"hash_59ab222626525669" );
}

// Namespace ct_ajax_tutorial/ct_ajax_tutorial
// Params 0
// Checksum 0xd2d99f, Offset: 0x32a0
// Size: 0x65a
function function_c6e7b0d9()
{
    level endon( #"combattraining_logic_finished" );
    var_a14cd67 = 0;
    
    while ( !var_a14cd67 )
    {
        level thread ct_vo::function_14b08e49( array( #"hash_4aaf37a6e822c717" ), "stop_nag" );
        ct_utils::function_e0d36a2c( undefined, "s_grenade_off_wall_obj", array( #"eq_swat_grenade", #"sig_buckler_dw" ), 0, 0.1, 50 );
        ct_vo::function_3ca1b77d();
        level notify( #"stop_nag" );
        ct_utils::function_e9ab1003( "s_grenade_off_wall_obj" );
        level.var_7b46025 = struct::get_array( "s_off_wall_bots_loc", "targetname" );
        level.var_47cd3e56 = 0;
        level thread ct_bots::activate_bots( level.var_7b46025.size, #"axis" );
        var_c897b566 = array( #"hash_369d22fddac9484d" );
        level thread ct_vo::function_14b08e49( var_c897b566, "stop_nag" );
        wait 0.1;
        ct_vo::function_3ca1b77d();
        e_player = getplayers()[ 0 ];
        e_player thread ct_utils::function_61c3d59c( #"hash_6078852a3e27a57b", array( "vox_tvoi_tutor_ajax_flash_bank_shot_1" ) );
        s_loc = struct::get( "s_grenade_off_wall_aim", "targetname" );
        waypoint = ct_utils::create_waypoint( undefined, s_loc.origin, s_loc.angles, #"any", undefined, 20, undefined );
        level.var_e72728b8 = array( #"sig_buckler_dw" );
        level thread function_f58c42e2();
        
        while ( true )
        {
            var_beeee781 = ct_utils::function_ee33a140();
            
            if ( var_beeee781 == 1 )
            {
                break;
            }
            
            waitframe( 1 );
        }
        
        level notify( #"guys_stunned" );
        level notify( #"stop_nag" );
        
        if ( isdefined( waypoint ) )
        {
            waypoint ct_utils::function_f9ed304d();
        }
        else
        {
            ct_utils::highlight_sphere_off();
        }
        
        level notify( #"stop_courtyard_collision_door" );
        e_player = getplayers()[ 0 ];
        e_player ct_bots::function_fd2d220e();
        ct_vo::function_3ca1b77d();
        a_str_vo = array( "vox_tvoi_tutor_ajax_flash_bank_shot_stun" );
        e_player = getplayers()[ 0 ];
        e_player thread ct_utils::function_61c3d59c( #"hash_6f09eaccd74feff5", a_str_vo );
        var_a14cd67 = ct_utils::function_be7bc7b2( 0, 2.5, undefined, undefined );
        e_player = getplayers()[ 0 ];
        a_bots = e_player ct_bots::function_dde6edbd();
        
        if ( a_bots.size == 0 )
        {
            var_a14cd67 = 1;
        }
        
        if ( !var_a14cd67 )
        {
            ct_vo::function_831e0584( array( "vox_tvoi_tutor_ajax_flash_fail" ), 0 );
            ct_utils::kill_all_bots();
            level notify( #"hash_18530bbb9146c297" );
            ct_utils::function_79957328( undefined );
            waitframe( 1 );
            level thread ct_utils::function_9ab507a9( "courtyard_collision", "start_courtyard_collision", "stop_courtyard_collision", undefined, 1, 1 );
            level thread ct_utils::function_9ab507a9( "courtyard_collision_door", "start_courtyard_collision_door", "stop_courtyard_collision_door", undefined, 1, 1 );
            waitframe( 1 );
            level notify( #"start_courtyard_collision" );
            level notify( #"start_courtyard_collision_door" );
        }
    }
    
    ct_utils::function_654280be();
    level notify( #"start_courtyard_collision_door" );
    e_player = getplayers()[ 0 ];
    e_player ct_bots::function_26d45f32( 1 );
    ct_utils::function_c2a10fc();
    wait 1;
    ct_vo::function_3ca1b77d();
    level notify( #"stop_courtyard_collision" );
    level.var_7b46025 = undefined;
}

// Namespace ct_ajax_tutorial/ct_ajax_tutorial
// Params 0
// Checksum 0xe2e9d690, Offset: 0x3908
// Size: 0x13e
function function_f58c42e2()
{
    level endon( #"guys_stunned", #"combattraining_logic_finished" );
    
    while ( true )
    {
        e_player = getplayers()[ 0 ];
        waitresult = e_player waittill( #"grenade_fire" );
        n_start_time = gettime() / 1000;
        
        while ( true )
        {
            var_beeee781 = ct_utils::function_ee33a140();
            n_time = gettime() / 1000;
            dt = n_time - n_start_time;
            
            if ( dt > 3 )
            {
                if ( !ct_vo::function_5d127774() )
                {
                    ct_vo::function_831e0584( array( #"hash_6ad85090ee589e10" ) );
                    break;
                }
            }
            
            waitframe( 1 );
        }
    }
}

// Namespace ct_ajax_tutorial/ct_ajax_tutorial
// Params 0
// Checksum 0x29a802cd, Offset: 0x3a50
// Size: 0x538
function function_9d1bba67()
{
    level endon( #"combattraining_logic_finished" );
    level.var_de17b8a3 = 0;
    level thread ct_gadgets::function_144e61da( 2, "combattraining_logic_finished" );
    a_str_vo = array( "vox_tvoi_tutor_ajax_shield_0" );
    level thread ct_vo::function_831e0584( a_str_vo, 0 );
    level thread ct_vo::function_14b08e49( array( #"hash_4aaf37a6e822c717" ), "stop_nag" );
    ct_utils::function_e0d36a2c( undefined, "s_shield_goto_obj", array( #"eq_swat_grenade", #"sig_buckler_dw" ), 0, 0.1, 35 );
    level notify( #"stop_nag" );
    ct_utils::function_e9ab1003( "s_shield_goto_obj" );
    level notify( #"start_permanent_shield_collision" );
    level notify( #"start_permanent_rcxd_collision" );
    level notify( #"start_use_shield_collision" );
    level notify( #"start_shield_path_collision" );
    level.var_e72728b8 = array( #"eq_swat_grenade" );
    ct_vo::function_3ca1b77d();
    a_str_vo = array( #"hash_4e9d7116bf0098eb", #"hash_4e9d7216bf009a9e" );
    e_player = getplayers()[ 0 ];
    var_9bc42298 = e_player gamepadusedlast() ? #"hash_137d47e2a7f7225c" : #"hash_4894195236e0698";
    e_player thread ct_utils::function_61c3d59c( var_9bc42298, a_str_vo );
    a_str_vo = array( #"hash_622d320255f505fa" );
    level thread ct_vo::function_14b08e49( a_str_vo, "shield_deployed" );
    e_player = getplayers()[ 0 ];
    var_7c59ef25 = e_player gadgetgetslot( getweapon( #"sig_buckler_dw" ) );
    
    while ( !e_player gadgetisactive( var_7c59ef25 ) )
    {
        waitframe( 1 );
    }
    
    level notify( #"shield_deployed" );
    ct_utils::function_c2a10fc();
    ct_vo::function_3ca1b77d();
    a_str_vo = array( "vox_tvoi_tutor_ajax_hip_fire" );
    e_player = getplayers()[ 0 ];
    e_player thread ct_utils::function_61c3d59c( #"hash_8a60229db7d9f06", a_str_vo );
    level.var_7b46025 = struct::get_array( "s_shield_shoot_ai", "targetname" );
    level.var_47cd3e56 = 0;
    level thread ct_bots::activate_bots( level.var_7b46025.size, #"axis" );
    wait 0.1;
    a_str_vo = array( #"hash_3a11ade5936ba51" );
    level thread ct_vo::function_14b08e49( a_str_vo, "enemy_killed" );
    level.var_fcf21a21 = 1;
    ct_utils::function_654280be();
    level.var_fcf21a21 = 0;
    level notify( #"enemy_killed" );
    level.var_7b46025 = undefined;
    ct_utils::function_c2a10fc();
    level notify( #"start_shield_melee_collision" );
    ct_vo::function_3ca1b77d();
    level notify( #"hash_4c9c5fbc89779e64" );
    wait 0.2;
}

// Namespace ct_ajax_tutorial/ct_ajax_tutorial
// Params 0
// Checksum 0xfb8fdb7d, Offset: 0x3f90
// Size: 0x2d4
function function_b87295f2()
{
    level endon( #"combattraining_logic_finished" );
    ct_vo::function_831e0584( array( #"hash_5b73d53d22211be2" ), 1 );
    e_player = getplayers()[ 0 ];
    e_player thread ct_utils::function_61c3d59c( #"hash_2933d1e2a048635e", undefined );
    level.var_7b46025 = struct::get_array( "s_shield_melee_ai", "targetname" );
    level.var_47cd3e56 = 0;
    level thread ct_bots::activate_bots( level.var_7b46025.size, #"axis" );
    level notify( #"stop_shield_path_collision" );
    wait 0.5;
    a_str_vo = array( #"hash_7d5741c589233b9b" );
    level thread ct_vo::function_14b08e49( a_str_vo, "melee_kill" );
    
    while ( true )
    {
        ct_utils::function_654280be();
        
        if ( isdefined( level.b_melee_kill ) && level.b_melee_kill )
        {
            break;
        }
        
        ct_vo::function_3ca1b77d();
        ct_vo::function_831e0584( array( #"hash_44a873cdcbaf3caa" ), 1 );
        ct_utils::delete_corpses();
        wait 0.2;
        level.var_7b46025 = struct::get_array( "s_shield_melee_ai", "targetname" );
        level.var_47cd3e56 = 0;
        level thread ct_bots::activate_bots( level.var_7b46025.size, #"axis" );
    }
    
    level notify( #"melee_kill" );
    level.var_1c6dbf1c = 0;
    level.var_7b46025 = undefined;
    ct_utils::function_c2a10fc();
    ct_vo::function_3ca1b77d();
    wait 0.1;
}

// Namespace ct_ajax_tutorial/ct_ajax_tutorial
// Params 0
// Checksum 0x5b2faa9, Offset: 0x4270
// Size: 0x884
function function_9f3ecaf2()
{
    level endon( #"combattraining_logic_finished" );
    a_str_vo = array( #"hash_381486398b947877" );
    ct_vo::function_831e0584( a_str_vo, 1 );
    level notify( #"stop_shield_melee_collision" );
    level notify( #"start_fortify_shield_complete_collision" );
    level notify( #"start_shield_staircase_collision" );
    level thread ct_vo::function_14b08e49( array( #"hash_4aaf37a6e822c717" ), "stop_nag" );
    ct_utils::function_e0d36a2c( undefined, "s_grenade_cooked_obj", array( #"eq_swat_grenade" ), 0, 0.1, 30 );
    level notify( #"stop_nag" );
    level notify( #"start_shield_cook_collision" );
    level notify( #"stop_shield_staircase_collision" );
    ct_utils::function_e9ab1003( "s_grenade_cooked_obj" );
    ct_utils::function_c2a10fc();
    ct_vo::function_3ca1b77d();
    ct_vo::function_831e0584( array( #"hash_381485398b9476c4" ), 1 );
    level.var_e72728b8 = undefined;
    var_e29ee6bf = 0;
    
    while ( !var_e29ee6bf )
    {
        level thread function_c99618be();
        a_str_vo = array( #"hash_4aaf37a6e822c717" );
        level thread ct_vo::function_14b08e49( a_str_vo, "shield_cooked" );
        e_player = getplayers()[ 0 ];
        e_player thread ct_utils::function_61c3d59c( #"hash_15ea928b21f90ff", undefined );
        var_b509dacb = 0;
        
        while ( !var_b509dacb )
        {
            while ( !e_player fragbuttonpressed() )
            {
                waitframe( 1 );
            }
            
            e_player = getplayers()[ 0 ];
            e_player thread ct_utils::function_61c3d59c( #"hash_481e857eee7f2a9c", undefined );
            s_loc = struct::get( "s_cooked_shield_door_obj", "targetname" );
            waypoint = ct_utils::create_waypoint( #"hash_1f1deaa6bff12db8", s_loc.origin, s_loc.angles, #"any", undefined, 40, undefined );
            
            while ( true )
            {
                if ( !e_player fragbuttonpressed() )
                {
                    break;
                }
                
                n_dist = distance( e_player.origin, s_loc.origin );
                
                if ( n_dist < 100 )
                {
                    var_b509dacb = 1;
                    break;
                }
                
                waitframe( 1 );
            }
            
            if ( !var_b509dacb )
            {
                if ( !ct_vo::function_5d127774() )
                {
                    level thread ct_vo::function_831e0584( array( #"hash_6ad85090ee589e10" ) );
                }
                
                waypoint ct_utils::function_f9ed304d();
                ct_vo::function_731eb7ed();
                wait 2;
                e_player = getplayers()[ 0 ];
                ct_utils::function_79957328( undefined );
            }
        }
        
        waypoint ct_utils::function_f9ed304d();
        e_player = getplayers()[ 0 ];
        e_player thread ct_utils::function_61c3d59c( #"hash_132a68dfb3f8697a", undefined );
        level notify( #"shield_cooked" );
        level.var_7b46025 = struct::get_array( "s_cooked_shield_ai", "targetname" );
        level.var_47cd3e56 = 0;
        level thread ct_bots::activate_bots( level.var_7b46025.size, #"axis" );
        e_player = getplayers()[ 0 ];
        s_result = e_player waittill( #"grenade_fire", #"weapon_fired" );
        level notify( #"stop_use_shield_collision" );
        
        if ( s_result._notify === "grenade_fire" )
        {
            var_3e7a6a5c = ct_utils::function_be7bc7b2( 1, 2, array( #"vox_tvoi_tutor_ajax_flash_bank_shot_stun" ), #"hash_5995a8451b2bccf5" );
        }
        else
        {
            var_3e7a6a5c = 0;
        }
        
        if ( var_3e7a6a5c )
        {
            ct_vo::function_3ca1b77d();
            level notify( #"hash_24bd25e0736c3ca3" );
            
            while ( true )
            {
                e_player = getplayers()[ 0 ];
                a_bots = e_player ct_bots::function_dde6edbd();
                
                if ( a_bots.size == 0 )
                {
                    break;
                }
                else if ( !isalive( e_player ) )
                {
                    var_3e7a6a5c = 0;
                    break;
                }
                
                waitframe( 1 );
            }
        }
        
        if ( !var_3e7a6a5c )
        {
            ct_utils::function_c2a10fc();
            e_player = getplayers()[ 0 ];
            e_player ct_utils::function_49e0c5bc();
            level thread ct_vo::function_831e0584( array( "vox_tvoi_tutor_ajax_flash_fail" ), 1 );
            wait 2;
            ct_utils::function_79957328( undefined );
            level notify( #"start_use_shield_collision" );
            level notify( #"hash_2a15358f9e2dbc11" );
        }
        else
        {
            ct_utils::function_c2a10fc();
            var_e29ee6bf = 1;
        }
        
        ct_vo::function_3ca1b77d();
    }
    
    level notify( #"hash_2a15358f9e2dbc11" );
    ct_vo::function_3ca1b77d();
    ct_vo::function_831e0584( array( #"hash_669409e6610922ae" ) );
    ct_vo::function_3ca1b77d();
}

// Namespace ct_ajax_tutorial/ct_ajax_tutorial
// Params 0
// Checksum 0xaa080a95, Offset: 0x4b00
// Size: 0x78
function function_c99618be()
{
    level endon( #"combattraining_logic_finished", #"hash_2a15358f9e2dbc11" );
    
    while ( true )
    {
        n_frac = ct_utils::function_ee33a140();
        
        if ( n_frac > 0 )
        {
            ct_vo::function_3ca1b77d();
            return;
        }
        
        waitframe( 1 );
    }
}

// Namespace ct_ajax_tutorial/ct_ajax_tutorial
// Params 0
// Checksum 0x9add6d5a, Offset: 0x4b80
// Size: 0x5a0
function function_8c3101de()
{
    level endon( #"combattraining_logic_finished" );
    level thread ct_vo::function_14b08e49( array( #"hash_4aaf37a6e822c717" ), "stop_nag" );
    ct_utils::function_e0d36a2c( undefined, "s_fortified_shield_start_obj", array( #"eq_swat_grenade" ), 0, 0.1, 30 );
    level notify( #"stop_nag" );
    level notify( #"start_use_shield_collision" );
    level notify( #"stop_shield_cook_collision" );
    level notify( #"start_fortify_shield_collision" );
    level notify( #"start_fortify_window_collision" );
    ct_utils::function_e9ab1003( "s_fortified_shield_start_obj" );
    ct_vo::function_3ca1b77d();
    a_str_vo = array( #"hash_66940ae661092461", #"hash_669407e661091f48" );
    e_player = getplayers()[ 0 ];
    e_player thread ct_utils::function_61c3d59c( #"hash_4c5c212bf1d426c4", a_str_vo );
    level.var_c4002ed1 = undefined;
    e_player function_4488a530( 0 );
    level.var_8c8703b0 = [];
    level.var_8c8703b0[ level.var_8c8703b0.size ] = struct::get( "s_shield_fight_path1", "targetname" );
    level.var_8c8703b0[ level.var_8c8703b0.size ] = struct::get( "s_shield_fight_path2", "targetname" );
    level.var_8c8703b0[ level.var_8c8703b0.size ] = struct::get( "s_shield_fight_path3", "targetname" );
    level.var_8c8703b0[ level.var_8c8703b0.size ] = struct::get( "s_shield_fight_path4", "targetname" );
    level.var_8c8703b0[ level.var_8c8703b0.size ] = struct::get( "s_shield_fight_path5", "targetname" );
    level.var_122c8d00 = 0;
    level.var_7b46025 = struct::get_array( "s_fortified_shield_ai", "targetname" );
    level.var_47cd3e56 = 0;
    level thread ct_bots::activate_bots( level.var_7b46025.size, #"axis" );
    level thread ct_vo::function_14b08e49( array( #"hash_3f3ce103b8badcf0" ), "stop_nag" );
    
    while ( true )
    {
        if ( isdefined( level.var_d7622168 ) && level.var_d7622168 )
        {
            break;
        }
        
        waitframe( 1 );
    }
    
    level notify( #"stop_nag" );
    level thread function_b73895e1();
    level thread function_4e24aa26();
    ct_utils::function_c2a10fc();
    ct_vo::function_3ca1b77d();
    level notify( #"stop_fortify_shield_complete_collision" );
    ct_utils::function_9aca2fa0( "ct_action2" );
    e_player = getplayers()[ 0 ];
    e_player thread ct_utils::function_61c3d59c( #"hash_6cf104078fcdf403", array( #"hash_828457c6bd51f59" ) );
    level notify( #"hash_24bd25e0736c3ca3" );
    level.var_e72728b8 = undefined;
    ct_utils::function_654280be();
    ct_utils::function_9aca2fa0( "ct_action" );
    level notify( #"hash_4161e19c15c58c8c" );
    level.var_5830bda2 = 1;
    ct_vo::function_3ca1b77d();
    ct_vo::function_831e0584( array( #"hash_7de3d0ed50c305d6" ), 1 );
    level notify( #"stop_fortify_shield_collision" );
}

// Namespace ct_ajax_tutorial/ct_ajax_tutorial
// Params 0
// Checksum 0x4ca975cc, Offset: 0x5128
// Size: 0x40
function function_e706a3ca()
{
    self endon( #"death" );
    self waittill( #"damage" );
    level notify( #"hash_24bd25e0736c3ca3" );
}

// Namespace ct_ajax_tutorial/ct_ajax_tutorial
// Params 0
// Checksum 0x8ad247a6, Offset: 0x5170
// Size: 0x24e
function function_b73895e1()
{
    level endon( #"combattraining_logic_finished" );
    
    while ( true )
    {
        if ( isdefined( level.var_5830bda2 ) && level.var_5830bda2 )
        {
            break;
        }
        
        e_player = getplayers()[ 0 ];
        weapon = e_player getcurrentweapon();
        
        if ( !( weapon.name == "sig_buckler_dw" || weapon.name == "sig_buckler_turret" ) )
        {
            e_player thread ct_utils::function_61c3d59c( #"hash_137d47e2a7f7225c", undefined );
            
            while ( true )
            {
                weapon = e_player getcurrentweapon();
                
                if ( weapon.name == "sig_buckler_dw" || weapon.name == "sig_buckler_turret" )
                {
                    e_player = getplayers()[ 0 ];
                    e_player thread ct_utils::function_61c3d59c( #"hash_4c5c212bf1d426c4", undefined );
                    break;
                }
                
                waitframe( 1 );
            }
        }
        else if ( !( isdefined( level.var_d7622168 ) && level.var_d7622168 ) )
        {
            e_player = getplayers()[ 0 ];
            e_player thread ct_utils::function_61c3d59c( #"hash_4c5c212bf1d426c4", undefined );
            
            while ( !( isdefined( level.var_d7622168 ) && level.var_d7622168 ) )
            {
                waitframe( 1 );
            }
            
            e_player = getplayers()[ 0 ];
            e_player thread ct_utils::function_61c3d59c( #"hash_6cf104078fcdf403", undefined );
        }
        
        waitframe( 1 );
    }
}

// Namespace ct_ajax_tutorial/ct_ajax_tutorial
// Params 0
// Checksum 0x85c0b39d, Offset: 0x53c8
// Size: 0x13a
function function_4e24aa26()
{
    level endon( #"hash_4161e19c15c58c8c", #"combattraining_logic_finished" );
    var_6ee32682 = 0;
    
    while ( true )
    {
        n_time = gettime() / 1000;
        e_player = getplayers()[ 0 ];
        weapon = e_player getcurrentweapon();
        
        if ( weapon.name != "sig_buckler_turret" )
        {
            dt = n_time - var_6ee32682;
            
            if ( dt > 7 && !ct_vo::function_5d127774() )
            {
                ct_vo::function_831e0584( array( #"hash_3f3ce103b8badcf0" ) );
                n_time = gettime() / 1000;
                var_6ee32682 = n_time;
            }
        }
        
        waitframe( 1 );
    }
}

// Namespace ct_ajax_tutorial/ct_ajax_tutorial
// Params 0
// Checksum 0x72ce8254, Offset: 0x5510
// Size: 0x6cc
function function_4a9cfde5()
{
    level endon( #"combattraining_logic_finished" );
    ct_utils::function_e9ab1003( undefined );
    level.var_e72728b8 = array( #"sig_buckler_dw", #"eq_swat_grenade" );
    e_player = getplayers()[ 0 ];
    e_player ct_utils::function_6ad0c151();
    level notify( #"start_enemy_hardpoint_collision" );
    level notify( #"start_hardpoint_navmesh_collision" );
    level notify( #"start_hp_ai_collision" );
    level thread ct_vo::function_14b08e49( array( #"hash_4aaf37a6e822c717" ), "stop_nag" );
    ct_utils::function_e0d36a2c( undefined, "s_goto_final_battle_1", undefined, 0, 0.1, 30 );
    level notify( #"stop_nag" );
    e_player = getplayers()[ 0 ];
    level thread ct_vo::function_14b08e49( array( #"hash_4aaf37a6e822c717" ), "stop_nag" );
    ct_utils::function_e0d36a2c( undefined, "s_goto_final_battle_1_2", undefined, 0, 0.1, 30 );
    level notify( #"stop_nag" );
    level notify( #"start_hp_backwards_collision" );
    level notify( #"stop_fortify_window_collision" );
    level notify( #"stop_permanent_rcxd_collision" );
    level.var_e72728b8 = undefined;
    ct_utils::function_e9ab1003( "s_goto_final_battle_1_2" );
    ct_utils::function_9aca2fa0( "ct_action2" );
    level.temp_disable = level.var_32ae304;
    level.var_32ae304 = undefined;
    level clientfield::set( "area_arrows_specialist", 5 );
    waitframe( 1 );
    level clientfield::set( "area_arrows", 3 );
    var_c897b566 = array( #"hash_369d22fddac9484d" );
    level thread ct_vo::function_14b08e49( var_c897b566, "player_damaged" );
    b_vo_played = 0;
    var_ddf0f271 = 0;
    
    while ( !var_ddf0f271 )
    {
        level.var_e72728b8 = [];
        e_player ct_bots::function_fd2d220e();
        ct_vo::function_3ca1b77d();
        
        if ( !b_vo_played )
        {
            level thread ct_vo::function_831e0584( array( "vox_tvoi_tutor_ajax_final_event_2" ), 1 );
            b_vo_played = 1;
        }
        
        e_player = getplayers()[ 0 ];
        e_player thread ct_utils::function_61c3d59c( #"hash_1b703a1b2e465ca5", undefined );
        level.var_aac17066 = 1;
        level.var_7b46025 = struct::get_array( "s_enemy_hardpoint_loc", "targetname" );
        level.var_47cd3e56 = 0;
        level thread ct_bots::activate_bots( level.var_7b46025.size, #"axis" );
        level waittill( #"player_damaged" );
        wait 1.5;
        level.var_aac17066 = 2;
        
        if ( isalive( e_player ) )
        {
            level thread ct_vo::function_831e0584( array( #"hash_6dcb529d2be93d5d" ) );
            level.var_7b46025 = struct::get_array( "s_enemy_hardpoint_loc_2", "targetname" );
            level.var_47cd3e56 = 0;
            level thread ct_bots::activate_bots( level.var_7b46025.size, #"axis" );
        }
        
        wait 0.5;
        level notify( #"hash_24bd25e0736c3ca3" );
        
        while ( true )
        {
            e_player = getplayers()[ 0 ];
            
            if ( !isalive( e_player ) )
            {
                ct_utils::kill_all_bots( undefined );
                ct_utils::function_79957328( 0.5 );
                break;
            }
            else
            {
                a_bots = e_player ct_bots::function_dde6edbd();
                
                if ( a_bots.size == 0 )
                {
                    var_ddf0f271 = 1;
                    break;
                }
            }
            
            waitframe( 1 );
        }
        
        level.var_aac17066 = undefined;
    }
    
    level.var_32ae304 = level.temp_disable;
    level clientfield::set( "area_arrows", 0 );
    ct_vo::function_3ca1b77d();
    ct_vo::function_831e0584( array( #"hash_58724fe003e2f1ce" ), 1 );
    ct_utils::function_9aca2fa0( "ct_action" );
}

// Namespace ct_ajax_tutorial/ct_ajax_tutorial
// Params 0
// Checksum 0xc5963045, Offset: 0x5be8
// Size: 0x434
function function_109c0cc2()
{
    level endon( #"combattraining_logic_finished" );
    ct_utils::function_e9ab1003( undefined );
    level.temp_disable = level.var_32ae304;
    level.var_32ae304 = undefined;
    e_player = getplayers()[ 0 ];
    globallogic_score::_setplayermomentum( e_player, 0 );
    var_c897b566 = array( #"hash_4aaf37a6e822c717" );
    level thread ct_vo::function_14b08e49( var_c897b566, "action_started" );
    level.var_e72728b8 = array( #"sig_buckler_dw", #"eq_swat_grenade" );
    ct_utils::function_e0d36a2c( undefined, "s_run_and_clear_obj", undefined, 0, 0.1, 30 );
    level notify( #"action_started" );
    ct_utils::function_9aca2fa0( "ct_action2" );
    ct_utils::function_e9ab1003( "s_run_and_clear_obj" );
    level.var_e72728b8 = [];
    level notify( #"stop_use_shield_collision" );
    level notify( #"stop_enemy_hardpoint_collision" );
    level notify( #"start_run_clear_collision" );
    level notify( #"start_open_car_blocker_collision" );
    level notify( #"stop_hp_ai_collision" );
    level notify( #"start_permanent_rcxd_collision" );
    ct_utils::function_e44c5b8e( "recon_car", 10 );
    e_player = getplayers()[ 0 ];
    e_player thread ct_utils::function_68848e5( "recon_car" );
    callback::on_player_killed_with_params( &ct_utils::function_944e4110 );
    level.var_28cfc859 = 50;
    b_success = 0;
    
    while ( true )
    {
        level notify( #"start_init_killstreak_collision" );
        e_player ct_vo::function_831e0584( array( "vox_tvoi_tutor_ajax_final_event_2_start_0" ), 1 );
        level notify( #"stop_init_killstreak_collision" );
        level.var_2b85d59c = 1;
        wait_for_car();
        level.var_2b85d59c = undefined;
        level notify( #"start_rcxd_collision" );
        b_success = function_e9b5de80();
        level notify( #"stop_rcxd_collision" );
        
        if ( !b_success )
        {
            ct_utils::kill_all_bots( undefined );
            ct_utils::function_79957328( 0.5 );
            
            while ( true )
            {
                e_player = getplayers()[ 0 ];
                
                if ( isalive( e_player ) )
                {
                    break;
                }
                
                waitframe( 1 );
            }
            
            continue;
        }
        
        e_player thread ct_utils::function_1bb93418();
        return;
    }
    
    callback::remove_on_player_killed_with_params( &ct_utils::function_944e4110 );
}

// Namespace ct_ajax_tutorial/ct_ajax_tutorial
// Params 0
// Checksum 0x163428ec, Offset: 0x6028
// Size: 0x4be
function wait_for_car()
{
    level endon( #"combattraining_logic_finished" );
    e_player = getplayers()[ 0 ];
    e_player thread ct_utils::function_61c3d59c( undefined, undefined, "dynobj_KillToEarnRCXD" );
    level.var_f9242904 = 1;
    
    while ( level.var_f9242904 )
    {
        if ( !isdefined( e_player.killstreaks ) || e_player.killstreaks.size == 0 )
        {
            level thread ct_utils::function_e44c5b8e( "recon_car" );
        }
        
        e_player thread ct_utils::function_61c3d59c( undefined, undefined, "dynobj_KillToEarnRCXD" );
        level.var_3fe23421 = 0;
        e_player ct_utils::function_80bf685b( level.var_3fe23421 );
        e_player.momentum = 0;
        e_player thread function_537c9eea();
        level.var_7b46025 = struct::get_array( "s_killstreak_spawn", "targetname" );
        level.var_47cd3e56 = 0;
        level thread ct_bots::activate_bots( level.var_7b46025.size, #"axis" );
        wait 0.5;
        level notify( #"hash_24bd25e0736c3ca3" );
        a_bots = ct_bots::function_fbe3dcbb();
        var_9bff2467 = a_bots.size;
        var_e2bcb756 = struct::get_array( "bot_killstreak_respawn_pos", "targetname" );
        var_16bd65fd = 0;
        b_player_died = 0;
        
        while ( !( isdefined( b_player_died ) && b_player_died ) && level.var_f9242904 )
        {
            e_player = getplayers()[ 0 ];
            
            if ( !isalive( e_player ) )
            {
                e_player ct_utils::function_1bb93418();
                ct_utils::kill_all_bots( undefined );
                ct_utils::function_79957328( 0.5 );
                e_player ct_vo::function_831e0584( array( "vox_tvoi_tutor_ajax_final_event_2_dead" ) );
                
                while ( true )
                {
                    e_player = getplayers()[ 0 ];
                    
                    if ( isalive( e_player ) )
                    {
                        break;
                    }
                    
                    waitframe( 1 );
                }
                
                b_player_died = 1;
                break;
            }
            
            if ( !( isdefined( b_player_died ) && b_player_died ) )
            {
                a_bots = e_player ct_bots::function_dde6edbd();
                
                if ( a_bots.size < var_9bff2467 )
                {
                    s_loc = var_e2bcb756[ var_16bd65fd ];
                    var_16bd65fd++;
                    
                    if ( var_16bd65fd >= var_e2bcb756.size )
                    {
                        var_16bd65fd = 0;
                    }
                    
                    wait 1;
                    level.var_7b46025 = array( s_loc );
                    level.var_47cd3e56 = 0;
                    level thread ct_bots::activate_bots( level.var_7b46025.size, #"axis" );
                    wait 1;
                    level notify( #"hash_24bd25e0736c3ca3" );
                }
            }
            
            e_player = getplayers()[ 0 ];
            
            if ( isdefined( e_player.var_51ff7a58 ) && e_player.var_51ff7a58 )
            {
                ct_utils::kill_all_bots( undefined );
                level.var_f9242904 = 0;
            }
            
            waitframe( 1 );
        }
    }
    
    e_player = getplayers()[ 0 ];
    e_player.var_51ff7a58 = 0;
}

// Namespace ct_ajax_tutorial/ct_ajax_tutorial
// Params 0
// Checksum 0xe5727e1e, Offset: 0x64f0
// Size: 0x5c
function function_c3ccdcf5()
{
    e_player = ct_utils::get_player();
    level.var_3fe23421 += level.var_28cfc859;
    e_player ct_utils::function_80bf685b( level.var_3fe23421 );
}

// Namespace ct_ajax_tutorial/ct_ajax_tutorial
// Params 0
// Checksum 0x91a327b3, Offset: 0x6558
// Size: 0x54
function function_537c9eea()
{
    self endon( #"death" );
    self waittill( "killstreak_quantity_" + #"recon_car" );
    self.var_51ff7a58 = 1;
    self ct_utils::function_1bb93418();
}

// Namespace ct_ajax_tutorial/ct_ajax_tutorial
// Params 0
// Checksum 0xca36465d, Offset: 0x65b8
// Size: 0x9d4
function function_e9b5de80()
{
    level endon( #"combattraining_logic_finished" );
    ct_utils::function_e9ab1003( undefined );
    b_success = 0;
    level.var_e72728b8 = array( #"sig_buckler_dw", #"eq_swat_grenade" );
    e_player = getplayers()[ 0 ];
    e_player thread ct_utils::function_6ad0c151();
    e_player thread ct_vo::function_831e0584( array( "vox_tvoi_tutor_ajax_final_event_2_comp_0" ) );
    ct_utils::function_e0d36a2c( undefined, "s_use_car_loc", undefined, 0, 0.1, 30 );
    ct_utils::function_e9ab1003( "s_use_car_loc" );
    level notify( #"start_car_blocker_collision" );
    e_player = getplayers()[ 0 ];
    e_player ct_utils::function_6ad0c151();
    var_baf3556b = 0;
    var_f7bf657b = 0;
    
    do
    {
        level.var_46f4865d = 1;
        var_8a74527 = 0;
        level notify( #"start_car_blocker_exit_collision" );
        level notify( #"start_open_car_blocker_collision" );
        level thread ct_utils::function_e44c5b8e( #"recon_car", 10, var_baf3556b );
        var_baf3556b = 1;
        level.var_e72728b8 = array( #"sig_buckler_dw", #"eq_swat_grenade" );
        e_player thread function_a9e6b1aa();
        e_player = getplayers()[ 0 ];
        var_f89d1864 = e_player gamepadusedlast() ? #"hash_4ebfe875c2651663" : #"hash_39ef32192475cedd";
        e_player thread ct_utils::function_61c3d59c( var_f89d1864, undefined );
        e_player thread ct_vo::function_261ed63c( "vox_tvoi_tutor_ajax_final_event_3_active_nag", 30, 20 );
        
        if ( !( isdefined( var_f7bf657b ) && var_f7bf657b ) )
        {
            var_f7bf657b = 1;
            level thread ct_vo::function_831e0584( array( "vox_tvoi_tutor_ajax_final_event_3_start_0" ), 1 );
        }
        
        setdvar( #"hash_3e06b14c41136e95", 0 );
        
        do
        {
            waitframe( 1 );
            level.e_rcxd = getent( "recon_car", "targetname" );
        }
        while ( !isalive( level.e_rcxd ) );
        
        level notify( #"stop_car_blocker_exit_collision" );
        level notify( #"stop_permanent_rcxd_collision" );
        level notify( #"stop_open_car_blocker_collision" );
        level notify( #"start_car_kill_collision" );
        level notify( #"hash_60e26e14a51c5211" );
        e_player ct_vo::function_3ca1b77d();
        
        if ( isdefined( level.e_rcxd ) )
        {
            s_loc = struct::get( "s_rccar_spawn_ok_loc", "targetname" );
            v_forward = anglestoforward( s_loc.angles );
            v_dir = vectornormalize( s_loc.origin - level.e_rcxd.origin );
            dp = vectordot( v_dir, v_forward );
            
            if ( dp < 0 )
            {
                b_success = 0;
            }
            else
            {
                b_success = 1;
            }
        }
        
        level.var_46f4865d = 0;
        e_player thread ct_utils::function_61c3d59c( #"hash_631f59a9f211ecef", array( "vox_tvoi_tutor_ajax_final_event_3_start_1" ) );
        level.var_7b46025 = struct::get_array( "s_enemy_of_car", "targetname" );
        level.var_47cd3e56 = 0;
        level thread ct_bots::activate_bots( level.var_7b46025.size, #"axis" );
        wait 0.5;
        a_ai_enemies = e_player ct_bots::function_dde6edbd();
        
        foreach ( ai_enemy in a_ai_enemies )
        {
            ai_enemy thread function_ad416588();
        }
        
        level notify( #"hash_24bd25e0736c3ca3" );
        level.var_e36bc03f = 1;
        
        if ( b_success && isdefined( level.e_rcxd ) )
        {
            b_success = 0;
            function_90c6b9d4();
            level notify( #"start_permanent_rcxd_collision" );
            ct_utils::function_8f04870f();
            
            while ( e_player util::isusingremote() )
            {
                waitframe( 1 );
            }
        }
        else
        {
            b_success = 0;
            
            if ( isdefined( level.e_rcxd ) )
            {
                level.e_rcxd dodamage( level.e_rcxd.health + 100, level.e_rcxd.origin );
            }
            
            e_player = getplayers()[ 0 ];
            var_6a58d9ed = killstreaks::get_killstreak_momentum_cost( e_player, "recon_car" );
            globallogic_score::_setplayermomentum( e_player, var_6a58d9ed );
            var_8a74527 = 1;
            wait 0.5;
            e_car = getentarray( "recon_car", "targetname" )[ 0 ];
            
            if ( isdefined( e_car ) )
            {
                e_car delete();
            }
            
            level notify( #"start_permanent_rcxd_collision" );
            ct_utils::function_8f04870f();
        }
        
        wait 0.1;
        a_bots = e_player ct_bots::function_dde6edbd();
        
        if ( !( isdefined( var_8a74527 ) && var_8a74527 ) && a_bots.size == 0 )
        {
            b_success = 1;
            ct_utils::function_9aca2fa0( "ct_endgame" );
        }
        else
        {
            e_player ct_utils::function_1bb93418();
            e_player thread ct_vo::function_831e0584( array( "vox_tvoi_tutor_ajax_final_event_3_miss" ) );
            e_player ct_utils::function_49e0c5bc();
            
            while ( !isalive( e_player ) )
            {
                waitframe( 1 );
            }
        }
        
        waitframe( 1 );
    }
    while ( !( isdefined( b_success ) && b_success ) );
    
    level.var_32ae304 = level.temp_disable;
    level.var_e36bc03f = undefined;
    level notify( #"start_car_kill_collision" );
    e_player ct_utils::function_6ad0c151();
    level.usingscorestreaks = 0;
    level.disablescoreevents = 0;
    level.disablemomentum = 1;
    level.usingmomentum = 0;
    level notify( #"start_open_car_blocker_collision" );
    level notify( #"stop_car_blocker_collision" );
    return b_success;
}

// Namespace ct_ajax_tutorial/ct_ajax_tutorial
// Params 0
// Checksum 0x130dd7e0, Offset: 0x6f98
// Size: 0x5c
function function_ad416588()
{
    s_notify = self waittill( #"damage" );
    
    if ( isalive( self ) )
    {
        self kill();
    }
}

// Namespace ct_ajax_tutorial/ct_ajax_tutorial
// Params 0
// Checksum 0x3cfe6c80, Offset: 0x7000
// Size: 0x64
function function_a9e6b1aa()
{
    killstreakweapon = getweapon( #"recon_car" );
    
    if ( killstreaks::get_killstreak_quantity( killstreakweapon ) == 0 )
    {
        killstreaks::change_killstreak_quantity( killstreakweapon, 1 );
    }
}

// Namespace ct_ajax_tutorial/ct_ajax_tutorial
// Params 0
// Checksum 0x5766edce, Offset: 0x7070
// Size: 0x5a
function function_852f4e51()
{
    level endon( #"combattraining_logic_finished" );
    e_player = getplayers()[ 0 ];
    e_player waittill( #"stopped_using_remote" );
    level.var_18d34c86 = 1;
}

// Namespace ct_ajax_tutorial/ct_ajax_tutorial
// Params 0
// Checksum 0xc2dc0b32, Offset: 0x70d8
// Size: 0xd0
function function_90c6b9d4()
{
    level endon( #"combattraining_logic_finished" );
    
    while ( isdefined( level.e_rcxd ) && level.e_rcxd.health > 0 )
    {
        waitframe( 1 );
    }
    
    level notify( #"stop_open_car_blocker_collision" );
    
    if ( isdefined( level.e_rcxd ) )
    {
        level.var_8a21b7f2 = level.e_rcxd;
        level.var_8a21b7f2.targetname = "recon_car_dead";
        level.e_rcxd = undefined;
    }
    
    level.var_18d34c86 = 1;
    level notify( #"start_open_car_blocker_collision" );
}

// Namespace ct_ajax_tutorial/ct_ajax_tutorial
// Params 0
// Checksum 0xd119a84a, Offset: 0x71b0
// Size: 0x194
function player_grenade_watcher()
{
    level endon( #"combattraining_logic_finished" );
    self endon( #"death" );
    
    while ( true )
    {
        level flag::clear( "grenade_exp" );
        waitresult = self waittill( #"grenade_fire" );
        
        if ( waitresult.weapon.name == #"eq_swat_grenade" )
        {
            v_pos = waitresult.projectile.origin;
            
            while ( isdefined( waitresult.projectile ) )
            {
                v_pos = waitresult.projectile.origin;
                waitframe( 1 );
            }
            
            level flag::set( "grenade_exp" );
            var_8b8281e4 = waitresult.cook_time;
            
            if ( var_8b8281e4 <= 300 )
            {
                level.var_fa76e237 = 1;
            }
            else if ( var_8b8281e4 <= 550 )
            {
                level.var_fa76e237 = 2;
            }
            else
            {
                level.var_fa76e237 = 2;
            }
            
            level.var_a72fad31 = gettime() / 1000;
            wait 0.1;
        }
    }
}

// Namespace ct_ajax_tutorial/ct_ajax_tutorial
// Params 1
// Checksum 0x15af898a, Offset: 0x7350
// Size: 0x54c
function function_58c62280( b_keyline )
{
    s_loc = level.var_7b46025[ level.var_47cd3e56 ];
    level.var_47cd3e56++;
    
    if ( level.var_47cd3e56 >= level.var_7b46025.size )
    {
        level.var_47cd3e56 = 0;
    }
    
    self endon( #"death" );
    
    if ( isdefined( s_loc ) )
    {
        self ct_utils::function_61d750d4( s_loc.origin, s_loc.angles );
        self thread ct_utils::function_5b59f3b7( s_loc.origin, s_loc.angles, 32 );
    }
    else
    {
        return;
    }
    
    wait 0.2;
    
    if ( isdefined( b_keyline ) && b_keyline )
    {
        self clientfield::set( "enemy_keyline_render", 1 );
    }
    
    if ( level.var_ad7c0539 == 5 )
    {
        self val::reset( #"grenade_bot", "ignoreall" );
        self.health = 50;
    }
    else if ( level.var_ad7c0539 == 7 )
    {
        self thread function_e706a3ca();
    }
    else if ( level.var_ad7c0539 == 8 )
    {
        self thread ct_utils::function_402c2175();
        self thread ct_bots::function_35e77034( getweapon( #"ar_accurate_t8", 1 ) );
    }
    else if ( level.var_ad7c0539 == 9 )
    {
        self ct_bots::function_fd2d220e();
    }
    
    level waittill( #"hash_24bd25e0736c3ca3" );
    self val::reset( #"grenade_bot", "ignoreall" );
    
    if ( level.var_ad7c0539 == 2 )
    {
        n_wait = randomfloatrange( 0.1, 1 );
        wait n_wait;
        self thread ct_utils::function_1e7b75f2( s_loc );
        return;
    }
    
    if ( level.var_ad7c0539 == 6 )
    {
        self thread ct_utils::function_5b59f3b7( self.origin, self.angles, 32 );
        return;
    }
    
    if ( level.var_ad7c0539 == 7 )
    {
        s_loc = level.var_8c8703b0[ level.var_122c8d00 ];
        level.var_122c8d00++;
        
        if ( level.var_122c8d00 >= level.var_8c8703b0.size )
        {
            level.var_122c8d00 = 0;
        }
        
        self thread ct_utils::function_1e7b75f2( s_loc );
        return;
    }
    
    if ( level.var_ad7c0539 == 8 )
    {
        if ( level.var_aac17066 == 2 )
        {
            s_loc = struct::get( "s_enemy_hardpoint_guard_loc", "targetname" );
            self thread ct_utils::function_5b59f3b7( s_loc.origin, s_loc.angles, 300 );
        }
        
        return;
    }
    
    if ( level.var_ad7c0539 == 9 )
    {
        if ( isdefined( level.var_e36bc03f ) && level.var_e36bc03f )
        {
            self thread ct_utils::function_5b59f3b7( self.origin, self.angles, 32 );
            var_6eee318e = struct::get( s_loc.target, "targetname" );
            self.var_2925fedc = var_6eee318e.origin;
        }
        else
        {
            s_loc = struct::get( "bot_killstreak_guard_loc", "targetname" );
            self thread ct_utils::function_5b59f3b7( s_loc.origin, s_loc.angles, 1200 );
        }
        
        return;
    }
    
    s_loc = struct::get( "s_courtyard_guard_loc", "targetname" );
    self thread ct_utils::function_5b59f3b7( s_loc.origin, s_loc.angles, 500 );
}

// Namespace ct_ajax_tutorial/ct_ajax_tutorial
// Params 0
// Checksum 0xf0b4cbf9, Offset: 0x78a8
// Size: 0xac
function function_77e3ea7()
{
    self endon( #"death" );
    self val::set( #"hash_688274741bd92b3", "ignoreall", 1 );
    
    while ( true )
    {
        var_beeee781 = ct_utils::function_ee33a140();
        
        if ( var_beeee781 > 0 )
        {
            break;
        }
        
        waitframe( 1 );
    }
    
    self val::reset( #"hash_688274741bd92b3", "ignoreall" );
}

// Namespace ct_ajax_tutorial/ct_ajax_tutorial
// Params 0
// Checksum 0x673a40c2, Offset: 0x7960
// Size: 0xc6
function function_f9eac817()
{
    self endon( #"death" );
    self notify( "7362195890e41eba" );
    self endon( "7362195890e41eba" );
    
    while ( true )
    {
        waitresult = self waittill( #"weapon_change" );
        next_weapon = waitresult.weapon;
        
        if ( isdefined( next_weapon ) && next_weapon.name == #"sig_buckler_turret" )
        {
            level.var_d7622168 = 1;
            continue;
        }
        
        level.var_d7622168 = 0;
    }
}

// Namespace ct_ajax_tutorial/ct_ajax_tutorial
// Params 0
// Checksum 0xda9419bb, Offset: 0x7a30
// Size: 0x136
function function_4e23716d()
{
    self endon( #"death", #"hash_1ee5e1328a4dfd77" );
    wpn_buckler_turret = getweapon( #"sig_buckler_turret" );
    wpn_buckler_dw = getweapon( #"sig_buckler_dw" );
    var_6af5e1d4 = self getweaponammoclipsize( wpn_buckler_turret );
    
    while ( true )
    {
        wpn_current = self getcurrentweapon();
        
        if ( wpn_current == wpn_buckler_turret || wpn_current == wpn_buckler_dw )
        {
            n_ammo = self getweaponammoclip( wpn_current );
            
            if ( n_ammo == 1 )
            {
                self setweaponammoclip( wpn_current, var_6af5e1d4 );
            }
        }
        
        waitframe( 1 );
    }
}

