#using script_112484f657ccd8b7;
#using script_1d1e3c193b0a51d;
#using script_30ba61ad5559c51d;
#using script_3688d332e17e9ac1;
#using script_3c775b8df460b415;
#using script_444bc5b4fa0fe14f;
#using script_45993630a26b2d85;
#using script_67da0c3654a906b6;
#using script_6951ea86fdae9ae0;
#using script_6ff72d27da99fb12;
#using script_ddbbb750404a64b;
#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\util_shared;
#using scripts\zm_common\trials\zm_trial_close_quarters;
#using scripts\zm_common\trials\zm_trial_crawlers_only;
#using scripts\zm_common\trials\zm_trial_disable_bgbs;
#using scripts\zm_common\trials\zm_trial_disable_buys;
#using scripts\zm_common\trials\zm_trial_disable_hero_weapons;
#using scripts\zm_common\trials\zm_trial_disable_hud;
#using scripts\zm_common\trials\zm_trial_disable_perks;
#using scripts\zm_common\trials\zm_trial_disable_regen;
#using scripts\zm_common\trials\zm_trial_disable_upgraded_weapons;
#using scripts\zm_common\trials\zm_trial_force_archetypes;
#using scripts\zm_common\trials\zm_trial_friendly_fire;
#using scripts\zm_common\trials\zm_trial_no_ads;
#using scripts\zm_common\trials\zm_trial_no_player_damage;
#using scripts\zm_common\trials\zm_trial_no_powerups;
#using scripts\zm_common\trials\zm_trial_open_all_doors;
#using scripts\zm_common\trials\zm_trial_random_teleport;
#using scripts\zm_common\trials\zm_trial_sprinters_only;
#using scripts\zm_common\trials\zm_trial_super_sprinters_only;
#using scripts\zm_common\trials\zm_trial_timeout;
#using scripts\zm_common\trials\zm_trial_use_magicbox;
#using scripts\zm_common\zm_round_spawning;
#using scripts\zm_common\zm_trial;

#namespace zm_zodt8_trials;

// Namespace zm_zodt8_trials/zm_zodt8_trials
// Params 0, eflags: 0x6
// Checksum 0x52dca983, Offset: 0x1a0
// Size: 0x24
function private autoexec function_88c28903()
{
    zm_round_spawning::function_54fee373( &function_6bf7d04f );
}

// Namespace zm_zodt8_trials/zm_zodt8_trials
// Params 1, eflags: 0x4
// Checksum 0xaca45a51, Offset: 0x1d0
// Size: 0x71e
function private function_6bf7d04f( var_c766fbe6 )
{
    if ( !zm_trial::is_trial_mode() )
    {
        return var_c766fbe6;
    }
    
    if ( !isdefined( var_c766fbe6[ #"blight_father" ] ) )
    {
        var_c766fbe6[ #"blight_father" ] = 0;
    }
    
    if ( !isdefined( var_c766fbe6[ #"stoker" ] ) )
    {
        var_c766fbe6[ #"stoker" ] = 0;
    }
    
    if ( !isdefined( var_c766fbe6[ #"catalyst" ] ) )
    {
        var_c766fbe6[ #"catalyst" ] = 0;
    }
    
    assert( isdefined( level.var_6d87ac05 ) );
    assert( isdefined( level.var_d77a6967 ) );
    a_human_players = util::get_human_players( #"allies" );
    player_count = a_human_players.size;
    
    if ( level.round_number == 24 )
    {
        assert( level.var_d77a6967.name == #"unhealthy" );
        
        if ( player_count == 1 )
        {
            var_c766fbe6[ #"blight_father" ] = 2;
        }
        else
        {
            var_c766fbe6[ #"blight_father" ] = 4;
        }
    }
    else if ( level.round_number == 28 )
    {
        assert( level.var_d77a6967.name == #"hash_7aff6c8730240d5" );
        var_c766fbe6[ #"blight_father" ] = max( var_c766fbe6[ #"blight_father" ], 1 );
        var_c766fbe6[ #"stoker" ] = max( var_c766fbe6[ #"stoker" ], 1 );
        var_c766fbe6[ #"catalyst" ] = max( var_c766fbe6[ #"catalyst" ], 1 );
        var_c766fbe6[ #"blight_father" ] = int( ceil( var_c766fbe6[ #"blight_father" ] * 1.3 ) );
        var_c766fbe6[ #"stoker" ] = int( ceil( var_c766fbe6[ #"stoker" ] * 1.3 ) );
        var_c766fbe6[ #"catalyst" ] = int( ceil( var_c766fbe6[ #"catalyst" ] * 1.3 ) );
    }
    else if ( level.round_number == 30 )
    {
        assert( level.var_d77a6967.name == #"hash_37f11d9a44a08099", "<dev string:x38>" );
        
        if ( getgametypesetting( "zmTrialsVariant" ) )
        {
            level.var_43fb4347 = "walk";
            level.var_102b1301 = "run";
            var_84572f0c = 0;
            
            foreach ( player in getplayers() )
            {
                if ( isbot( player ) )
                {
                    var_84572f0c++;
                }
            }
            
            if ( var_84572f0c > 0 )
            {
                level.zombie_total = int( level.zombie_total / var_84572f0c );
            }
            
            foreach ( player in getplayers() )
            {
                player gadgetpowerset( level.var_a53a05b5, 100 );
            }
            
            if ( player_count == 1 )
            {
                var_c766fbe6[ #"blight_father" ] = 1;
            }
            else
            {
                var_c766fbe6[ #"blight_father" ] = 2;
            }
        }
        else if ( player_count == 1 )
        {
            var_c766fbe6[ #"blight_father" ] = 3;
            var_c766fbe6[ #"stoker" ] += 2;
            var_c766fbe6[ #"catalyst" ] += 8;
        }
        else
        {
            var_c766fbe6[ #"blight_father" ] = 8;
            var_c766fbe6[ #"stoker" ] += 4;
            var_c766fbe6[ #"catalyst" ] += 16;
        }
    }
    
    return var_c766fbe6;
}

