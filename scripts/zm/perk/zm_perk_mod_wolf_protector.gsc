#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\visionset_mgr_shared;
#using scripts\zm\powerup\zm_powerup_bonus_points_player;
#using scripts\zm\powerup\zm_powerup_hero_weapon_power;
#using scripts\zm\powerup\zm_powerup_small_ammo;
#using scripts\zm_common\util;
#using scripts\zm_common\zm_customgame;
#using scripts\zm_common\zm_perks;
#using scripts\zm_common\zm_powerups;
#using scripts\zm_common\zm_stats;
#using scripts\zm_common\zm_utility;

#namespace zm_perk_mod_wolf_protector;

// Namespace zm_perk_mod_wolf_protector/zm_perk_mod_wolf_protector
// Params 0, eflags: 0x2
// Checksum 0xa4b958f8, Offset: 0x190
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zm_perk_mod_wolf_protector", &__init__, undefined, undefined );
}

// Namespace zm_perk_mod_wolf_protector/zm_perk_mod_wolf_protector
// Params 0
// Checksum 0xc7b0eaa5, Offset: 0x1d8
// Size: 0x3c
function __init__()
{
    if ( getdvarint( #"hash_4e1190045ef3588b", 0 ) )
    {
        function_27473e44();
    }
}

// Namespace zm_perk_mod_wolf_protector/zm_perk_mod_wolf_protector
// Params 0
// Checksum 0x977d2391, Offset: 0x220
// Size: 0x254
function function_27473e44()
{
    zm_perks::register_perk_mod_basic_info( #"specialty_mod_wolf_protector", "mod_wolf_protector", #"perk_wolf_protector", #"specialty_wolf_protector", 4000 );
    zm_perks::register_perk_clientfields( #"specialty_mod_wolf_protector", &register_clientfield, &set_clientfield );
    zm_perks::register_perk_threads( #"specialty_mod_wolf_protector", &give_perk, &take_perk );
    callback::on_ai_killed( &on_ai_killed );
    zm_powerups::register_powerup( "wolf_bonus_points", &function_5517e41a );
    zm_powerups::register_powerup( "wolf_bonus_ammo", &zm_powerup_small_ammo::function_81558cdf );
    zm_powerups::register_powerup( "wolf_bonus_hero_power", &zm_powerup_hero_weapon_power::hero_weapon_power );
    
    if ( zm_powerups::function_cc33adc8() )
    {
        zm_powerups::add_zombie_powerup( "wolf_bonus_points", "zombie_z_money_icon", #"zombie_powerup_bonus_points", &zm_powerups::func_should_never_drop, 1, 0, 0 );
        zm_powerups::add_zombie_powerup( "wolf_bonus_ammo", "p7_zm_power_up_max_ammo", #"hash_69256172c78db147", &zm_powerups::func_should_never_drop, 1, 0, 0 );
        zm_powerups::add_zombie_powerup( "wolf_bonus_hero_power", "p8_zm_powerup_full_power", #"zombie_powerup_free_perk", &zm_powerup_hero_weapon_power::function_7e51ac0f, 1, 0, 0 );
    }
}

// Namespace zm_perk_mod_wolf_protector/zm_perk_mod_wolf_protector
// Params 0
// Checksum 0x80f724d1, Offset: 0x480
// Size: 0x4
function register_clientfield()
{
    
}

// Namespace zm_perk_mod_wolf_protector/zm_perk_mod_wolf_protector
// Params 1
// Checksum 0xe86ef71, Offset: 0x490
// Size: 0xc
function set_clientfield( state )
{
    
}

// Namespace zm_perk_mod_wolf_protector/zm_perk_mod_wolf_protector
// Params 0
// Checksum 0x80f724d1, Offset: 0x4a8
// Size: 0x4
function give_perk()
{
    
}

// Namespace zm_perk_mod_wolf_protector/zm_perk_mod_wolf_protector
// Params 4
// Checksum 0x80a248b4, Offset: 0x4b8
// Size: 0x24
function take_perk( b_pause, str_perk, str_result, n_slot )
{
    
}

// Namespace zm_perk_mod_wolf_protector/zm_perk_mod_wolf_protector
// Params 1
// Checksum 0x664f72e6, Offset: 0x4e8
// Size: 0x24
function function_5517e41a( player )
{
    level thread zm_powerup_bonus_points_player::bonus_points_player_powerup( self, player );
}

// Namespace zm_perk_mod_wolf_protector/zm_perk_mod_wolf_protector
// Params 1
// Checksum 0x1fdce9c4, Offset: 0x518
// Size: 0x232
function on_ai_killed( s_params )
{
    e_attacker = s_params.einflictor;
    
    if ( isdefined( e_attacker ) && isplayer( e_attacker.player_owner ) && e_attacker.player_owner hasperk( #"specialty_mod_wolf_protector" ) )
    {
        if ( level.active_powerups.size < 75 )
        {
            if ( math::cointoss( 25 ) )
            {
                roll = randomintrangeinclusive( 0, 100 );
                
                if ( roll <= 33 )
                {
                    e_powerup = zm_powerups::specific_powerup_drop( "wolf_bonus_hero_power", self.origin, undefined, 0.1, e_attacker.player_owner, 0, 1 );
                    
                    if ( isdefined( e_powerup ) )
                    {
                        e_powerup setscale( 0.3 );
                        e_powerup.var_c2bcd604 = 5;
                    }
                    
                    return;
                }
                
                if ( roll >= 66 )
                {
                    e_powerup = zm_powerups::specific_powerup_drop( "wolf_bonus_ammo", self.origin, undefined, 0.1, e_attacker.player_owner, 0, 1 );
                    
                    if ( isdefined( e_powerup ) )
                    {
                        e_powerup setscale( 0.3 );
                    }
                    
                    return;
                }
                
                e_powerup = zm_powerups::specific_powerup_drop( "wolf_bonus_points", self.origin, undefined, 0.1, e_attacker.player_owner, 0, 1 );
                
                if ( isdefined( e_powerup ) )
                {
                    e_powerup setscale( 0.3 );
                    e_powerup.var_258c5fbc = 10;
                }
            }
        }
    }
}

