#using script_24c32478acf44108;
#using scripts\core_common\ai\systems\gib;
#using scripts\core_common\ai\zombie_death;
#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\ai_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\laststand_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\player\player_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\throttle_shared;
#using scripts\core_common\util_shared;
#using scripts\zm\weapons\zm_weap_riotshield;
#using scripts\zm_common\zm;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_crafting;
#using scripts\zm_common\zm_customgame;
#using scripts\zm_common\zm_devgui;
#using scripts\zm_common\zm_equipment;
#using scripts\zm_common\zm_hero_weapon;
#using scripts\zm_common\zm_laststand;
#using scripts\zm_common\zm_powerups;
#using scripts\zm_common\zm_score;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_weapons;

#namespace zm_weap_spear_shield;

// Namespace zm_weap_spear_shield/zm_weap_spear_shield
// Params 0, eflags: 0x2
// Checksum 0x6d7ef02f, Offset: 0x170
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"zm_weap_spear_shield", &__init__, &__main__, undefined );
}

// Namespace zm_weap_spear_shield/zm_weap_spear_shield
// Params 0
// Checksum 0xf7458b1, Offset: 0x1c0
// Size: 0x7e
function __init__()
{
    level.var_96059a93 = getweapon( #"zhield_zpear_dw" );
    level.var_85ed93f4 = getweapon( #"zhield_zpear_lh" );
    level.var_ce3aa8a8 = getweapon( #"zhield_zpear_turret" );
}

// Namespace zm_weap_spear_shield/zm_weap_spear_shield
// Params 0
// Checksum 0x180208f, Offset: 0x248
// Size: 0x1e
function __main__()
{
    level.riotshield_melee = &function_4b03aab;
}

/#

    // Namespace zm_weap_spear_shield/zm_weap_spear_shield
    // Params 2
    // Checksum 0x13ff5cc9, Offset: 0x270
    // Size: 0x18, Type: dev
    function function_64ff58da( color, var_6ab2cf36 )
    {
        
    }

#/

// Namespace zm_weap_spear_shield/zm_weap_spear_shield
// Params 1
// Checksum 0x80c02641, Offset: 0x290
// Size: 0x64
function function_4b03aab( weapon )
{
    if ( weapon == level.var_ce3aa8a8 )
    {
        riotshield::riotshield_melee( weapon );
        return;
    }
    
    function_dcdaf81c( weapon, 128, 128, 96, 360, 240 );
}

// Namespace zm_weap_spear_shield/zm_weap_spear_shield
// Params 7
// Checksum 0x32373e77, Offset: 0x300
// Size: 0x42c
function function_dcdaf81c( weapon, riotshield_knockdown_range, riotshield_gib_range, riotshield_fling_range, var_1c3d89, riotshield_cylinder_radius, riotshield_fling_force_melee )
{
    level.riotshield_knockdown_enemies = [];
    level.riotshield_knockdown_gib = [];
    level.riotshield_fling_enemies = [];
    level.riotshield_fling_vecs = [];
    level.var_21ffc192 = [];
    self riotshield::riotshield_get_enemies_in_range( riotshield_knockdown_range, riotshield_gib_range, riotshield_fling_range, var_1c3d89, riotshield_cylinder_radius, riotshield_fling_force_melee );
    shield_damage = 0;
    
    for ( i = 0; i < level.riotshield_fling_enemies.size ; i++ )
    {
        [[ level.var_2677b8bb ]]->waitinqueue( level.riotshield_fling_enemies[ i ] );
        
        if ( isdefined( level.riotshield_fling_enemies[ i ] ) )
        {
            /#
                function_64ff58da( ( 1, 0, 0 ), level.riotshield_fling_enemies[ i ].origin );
            #/
            
            level.riotshield_fling_enemies[ i ] thread function_80a146c1( self, weapon );
            var_d3f92d4d = 30;
            
            if ( self hasperk( #"specialty_mod_shield" ) )
            {
                var_d3f92d4d *= 0.66;
            }
            
            shield_damage += var_d3f92d4d;
        }
    }
    
    for ( i = 0; i < level.riotshield_knockdown_enemies.size ; i++ )
    {
        /#
            function_64ff58da( ( 0, 1, 0 ), level.riotshield_knockdown_enemies[ i ].origin );
        #/
        
        [[ level.var_2677b8bb ]]->waitinqueue( level.riotshield_knockdown_enemies[ i ] );
        
        if ( !isdefined( level.riotshield_knockdown_enemies[ i ] ) )
        {
            continue;
        }
        
        level.riotshield_knockdown_enemies[ i ] thread riotshield::riotshield_knockdown_zombie( self, level.riotshield_knockdown_gib[ i ], weapon );
        shield_damage += 20;
    }
    
    foreach ( ai_enemy in level.var_21ffc192 )
    {
        [[ level.var_2677b8bb ]]->waitinqueue( ai_enemy );
        
        if ( !isdefined( ai_enemy ) )
        {
            continue;
        }
        
        switch ( ai_enemy.zm_ai_category )
        {
            case #"heavy":
            case #"miniboss":
            case #"boss":
                var_d3f92d4d = 30;
                break;
            default:
                var_d3f92d4d = 20;
                break;
        }
        
        if ( self hasperk( #"specialty_mod_shield" ) )
        {
            var_d3f92d4d *= 0.66;
        }
        
        shield_damage += var_d3f92d4d;
    }
    
    level.riotshield_knockdown_enemies = [];
    level.riotshield_knockdown_gib = [];
    level.riotshield_fling_enemies = [];
    level.riotshield_fling_vecs = [];
    level.var_21ffc192 = [];
    
    if ( shield_damage )
    {
        self riotshield::player_damage_shield( shield_damage, 0 );
    }
}

// Namespace zm_weap_spear_shield/zm_weap_spear_shield
// Params 2
// Checksum 0x972c1556, Offset: 0x738
// Size: 0xfc
function function_80a146c1( player, weapon )
{
    if ( !isdefined( self ) || !isalive( self ) )
    {
        return;
    }
    
    if ( isdefined( self.ignore_riotshield ) && self.ignore_riotshield )
    {
        return;
    }
    
    if ( isdefined( self.var_9c1f60e8 ) )
    {
        self [[ self.var_9c1f60e8 ]]( player );
        return;
    }
    
    self dodamage( 3000, player.origin, player, player, "", "MOD_IMPACT", 0, weapon );
    
    if ( self.health < 1 || player zm_powerups::is_insta_kill_active() )
    {
        gibserverutils::annihilate( self );
    }
}

// Namespace zm_weap_spear_shield/zm_weap_spear_shield
// Params 1
// Checksum 0xc882cd49, Offset: 0x840
// Size: 0x226
function function_a5ed9221( weapon )
{
    if ( weapon == level.var_ce3aa8a8 )
    {
        riotshield::riotshield_melee( weapon );
        return;
    }
    
    view_pos = self.origin;
    var_25e2354 = function_4d8c71ce();
    var_72714481 = getaispeciesarray( level.zombie_team, "all" );
    a_e_targets = arraycombine( var_72714481, var_25e2354, 0, 0 );
    forward_view_angles = self getweaponforwarddir();
    end_pos = view_pos + vectorscale( forward_view_angles, 64 );
    
    /#
        sphere( end_pos, 48, ( 1, 0, 0 ), 0.1, 1, 16, int( 5 * 1 / float( function_60d95f53() ) / 1000 ) );
    #/
    
    a_e_targets = array::get_all_closest( end_pos, a_e_targets, undefined, undefined, 48 );
    
    if ( !isdefined( a_e_targets ) || a_e_targets.size < 1 )
    {
        return;
    }
    
    for ( i = 0; i < a_e_targets.size ; i++ )
    {
        [[ level.var_2677b8bb ]]->waitinqueue( a_e_targets[ i ] );
        
        if ( !isdefined( a_e_targets[ i ] ) )
        {
            continue;
        }
        
        a_e_targets[ i ] thread riotshield::riotshield_knockdown_zombie( self, 0, weapon );
    }
}

// Namespace zm_weap_spear_shield/zm_weap_spear_shield
// Params 1
// Checksum 0x2c69ea80, Offset: 0xa70
// Size: 0x3de
function function_376cd4f6( weapon )
{
    if ( !isdefined( level.riotshield_knockdown_enemies ) )
    {
        level.riotshield_knockdown_enemies = [];
        level.riotshield_knockdown_gib = [];
        level.riotshield_fling_enemies = [];
        level.riotshield_fling_vecs = [];
        level.var_21ffc192 = [];
    }
    
    self riotshield::riotshield_get_enemies_in_range( 128, 128, 128 );
    shield_damage = 0;
    
    for ( i = 0; i < level.riotshield_fling_enemies.size ; i++ )
    {
        [[ level.var_2677b8bb ]]->waitinqueue( level.riotshield_fling_enemies[ i ] );
        
        if ( isdefined( level.riotshield_fling_enemies[ i ] ) )
        {
            level.riotshield_fling_enemies[ i ] thread riotshield::riotshield_fling_zombie( self, level.riotshield_fling_vecs[ i ], i );
            var_d3f92d4d = zombie_utility::get_zombie_var( #"riotshield_fling_damage_shield" );
            
            if ( self hasperk( #"specialty_mod_shield" ) )
            {
                var_d3f92d4d *= 0.66;
            }
            
            shield_damage += var_d3f92d4d;
        }
    }
    
    for ( i = 0; i < level.riotshield_knockdown_enemies.size ; i++ )
    {
        [[ level.var_2677b8bb ]]->waitinqueue( level.riotshield_knockdown_enemies[ i ] );
        
        if ( !isdefined( level.riotshield_knockdown_enemies[ i ] ) )
        {
            continue;
        }
        
        level.riotshield_knockdown_enemies[ i ] thread riotshield::riotshield_knockdown_zombie( self, level.riotshield_knockdown_gib[ i ] );
        shield_damage += zombie_utility::get_zombie_var( #"riotshield_knockdown_damage_shield" );
    }
    
    foreach ( ai_enemy in level.var_21ffc192 )
    {
        switch ( ai_enemy.zm_ai_category )
        {
            case #"heavy":
            case #"miniboss":
            case #"boss":
                var_d3f92d4d = zombie_utility::get_zombie_var( #"hash_bfdf728041b626a" );
                break;
            default:
                var_d3f92d4d = zombie_utility::get_zombie_var( #"hash_6835f7c5524585f3" );
                break;
        }
        
        if ( self hasperk( #"specialty_mod_shield" ) )
        {
            var_d3f92d4d *= 0.66;
        }
        
        shield_damage += var_d3f92d4d;
    }
    
    level.riotshield_knockdown_enemies = [];
    level.riotshield_knockdown_gib = [];
    level.riotshield_fling_enemies = [];
    level.riotshield_fling_vecs = [];
    level.var_21ffc192 = [];
    
    if ( shield_damage )
    {
    }
}

