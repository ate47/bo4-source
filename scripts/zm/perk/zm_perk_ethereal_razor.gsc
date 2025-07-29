#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_loadout;
#using scripts\zm_common\zm_perks;

#namespace zm_perk_ethereal_razor;

// Namespace zm_perk_ethereal_razor/zm_perk_ethereal_razor
// Params 0, eflags: 0x2
// Checksum 0x467ce9dc, Offset: 0x168
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zm_perk_ethereal_razor", &__init__, undefined, undefined );
}

// Namespace zm_perk_ethereal_razor/zm_perk_ethereal_razor
// Params 0
// Checksum 0x91d0a9e6, Offset: 0x1b0
// Size: 0x14
function __init__()
{
    enable_ethereal_razor_perk_for_level();
}

// Namespace zm_perk_ethereal_razor/zm_perk_ethereal_razor
// Params 0
// Checksum 0xf0a0ed45, Offset: 0x1d0
// Size: 0x254
function enable_ethereal_razor_perk_for_level()
{
    if ( function_8b1a219a() )
    {
        zm_perks::register_perk_basic_info( #"specialty_etherealrazor", #"perk_ethereal_razor", 4000, #"hash_1e8ce5bc6963fb34", getweapon( "zombie_perk_bottle_ethereal_razor" ), getweapon( "zombie_perk_totem_ethereal_razor" ), #"zmperksetherealrazor" );
    }
    else
    {
        zm_perks::register_perk_basic_info( #"specialty_etherealrazor", #"perk_ethereal_razor", 4000, #"zombie/perk_ethereal_razor", getweapon( "zombie_perk_bottle_ethereal_razor" ), getweapon( "zombie_perk_totem_ethereal_razor" ), #"zmperksetherealrazor" );
    }
    
    zm_perks::register_perk_precache_func( #"specialty_etherealrazor", &function_ee114cab );
    zm_perks::register_perk_clientfields( #"specialty_etherealrazor", &function_f20b4260, &function_f3043027 );
    zm_perks::register_perk_host_migration_params( #"specialty_etherealrazor", "vending_ethereal_razor", "ethereal_razor_light" );
    zm_perks::register_perk_threads( #"specialty_etherealrazor", &function_c38b0ce4, &function_6cedb75c );
    
    if ( isdefined( level.var_f32d2a34 ) && level.var_f32d2a34 )
    {
        level thread [[ level.var_f32d2a34 ]]();
    }
    
    callback::on_spawned( &on_spawned );
}

// Namespace zm_perk_ethereal_razor/zm_perk_ethereal_razor
// Params 0
// Checksum 0xa08c2a75, Offset: 0x430
// Size: 0x1c
function on_spawned()
{
    self function_5b0f2cc5();
}

// Namespace zm_perk_ethereal_razor/zm_perk_ethereal_razor
// Params 0
// Checksum 0xe476b1f, Offset: 0x458
// Size: 0x10e
function function_ee114cab()
{
    if ( isdefined( level.var_e0f12444 ) )
    {
        [[ level.var_e0f12444 ]]();
        return;
    }
    
    level._effect[ #"ethereal_razor_light" ] = #"hash_1442db17b83460ad";
    level.machine_assets[ #"specialty_etherealrazor" ] = spawnstruct();
    level.machine_assets[ #"specialty_etherealrazor" ].weapon = getweapon( "zombie_perk_bottle_ethereal_razor" );
    level.machine_assets[ #"specialty_etherealrazor" ].off_model = "p7_zm_vending_nuke";
    level.machine_assets[ #"specialty_etherealrazor" ].on_model = "p7_zm_vending_nuke";
}

// Namespace zm_perk_ethereal_razor/zm_perk_ethereal_razor
// Params 0
// Checksum 0xd6a427ab, Offset: 0x570
// Size: 0xc4
function function_f20b4260()
{
    clientfield::register( "actor", "" + #"hash_29c26fb019da89f3", 13000, 1, "counter" );
    clientfield::register( "allplayers", "" + #"hash_450d9f824068dcc2", 13000, 1, "counter" );
    clientfield::register( "allplayers", "" + #"hash_4de2dbcd551f1fb7", 13000, 1, "counter" );
}

// Namespace zm_perk_ethereal_razor/zm_perk_ethereal_razor
// Params 1
// Checksum 0x3ca09178, Offset: 0x640
// Size: 0xc
function function_f3043027( state )
{
    
}

// Namespace zm_perk_ethereal_razor/zm_perk_ethereal_razor
// Params 0
// Checksum 0xefe8e0c0, Offset: 0x658
// Size: 0x9c
function function_c38b0ce4()
{
    self endon( #"disconnect", #"specialty_etherealrazor" + "_take" );
    self thread function_f86e4c3d();
    self function_5b0f2cc5();
    callback::on_ai_damage( &on_ai_damage );
    callback::on_ai_killed( &on_ai_killed );
}

// Namespace zm_perk_ethereal_razor/zm_perk_ethereal_razor
// Params 4
// Checksum 0x18b87ec7, Offset: 0x700
// Size: 0x94
function function_6cedb75c( b_pause, str_perk, str_result, n_slot )
{
    self notify( #"specialty_etherealrazor" + "_take" );
    self function_5b0f2cc5();
    callback::remove_on_ai_damage( &on_ai_damage );
    callback::remove_on_ai_killed( &on_ai_killed );
}

// Namespace zm_perk_ethereal_razor/zm_perk_ethereal_razor
// Params 0
// Checksum 0xe1cfb5fe, Offset: 0x7a0
// Size: 0x1a8
function function_f86e4c3d()
{
    self endon( #"disconnect", #"specialty_etherealrazor" + "_take" );
    
    while ( true )
    {
        waitresult = self waittill( #"weapon_melee", #"weapon_melee_charge" );
        w_melee = waitresult.weapon;
        var_c34665fc = waitresult._notify;
        
        if ( self hasperk( #"specialty_etherealrazor" ) && function_866130c7( w_melee ) )
        {
            if ( w_melee === level.w_bowie_knife )
            {
                self clientfield::increment( "" + #"hash_4de2dbcd551f1fb7" );
            }
            else
            {
                self clientfield::increment( "" + #"hash_450d9f824068dcc2" );
            }
            
            if ( var_c34665fc === #"weapon_melee_charge" )
            {
                self function_1f7c6bb9( w_melee, 20, 40, 1 );
                continue;
            }
            
            self function_1f7c6bb9( w_melee, 50, 10 );
        }
    }
}

// Namespace zm_perk_ethereal_razor/zm_perk_ethereal_razor
// Params 4
// Checksum 0x9d3737d8, Offset: 0x950
// Size: 0x5bc
function function_1f7c6bb9( w_melee, var_2b9d3880, var_48e9b3cc, is_lunge = 0 )
{
    self endon( #"disconnect" );
    var_2ed6f142 = self getplayercamerapos();
    v_angles = self getplayerangles();
    v_norm = vectornormalize( anglestoforward( v_angles ) );
    a_e_targets = function_fa63958c();
    a_e_targets = arraysortclosest( a_e_targets, self.origin );
    var_5f96a3db = 0;
    var_cf912c82 = 0;
    n_base_damage = int( 500 );
    var_9c0b2bd5 = is_lunge ? 1 : 3;
    
    if ( self function_da33f286() && is_lunge )
    {
        if ( isdefined( self.var_ec2fa29e ) && self.var_ec2fa29e )
        {
            var_48e9b3cc = 30;
            self.health = math::clamp( self.health + var_48e9b3cc, 0, self.var_66cb03ad );
            self function_5b0f2cc5();
            return;
        }
    }
    else if ( isdefined( self.var_53b8e41f ) && self.var_53b8e41f )
    {
        self function_5b0f2cc5();
        return;
    }
    
    foreach ( e_target in a_e_targets )
    {
        if ( !isalive( e_target ) )
        {
            continue;
        }
        
        test_origin = e_target getcentroid();
        n_dist_sq = distancesquared( var_2ed6f142, test_origin );
        
        if ( n_dist_sq > 10000 && !is_lunge )
        {
            continue;
        }
        
        var_c04cadc7 = e_target sightconetrace( var_2ed6f142, self, v_norm, var_2b9d3880 );
        
        if ( var_c04cadc7 == 0 && !isdefined( e_target.var_39c64392 ) )
        {
            continue;
        }
        
        if ( isdefined( e_target.var_39c64392 ) )
        {
            n_total_damage = n_base_damage;
        }
        else
        {
            n_total_damage = n_base_damage + w_melee.meleedamage;
        }
        
        if ( is_lunge )
        {
            if ( self hasperk( #"specialty_mod_etherealrazor" ) && ( e_target.zm_ai_category === #"basic" || e_target.zm_ai_category === #"popcorn" || e_target.zm_ai_category === #"enhanced" ) )
            {
                n_total_damage = e_target.health + 666;
            }
            else if ( self hasperk( #"specialty_mod_etherealrazor" ) )
            {
                n_total_damage += 4000;
            }
            else
            {
                n_total_damage += 1000;
            }
        }
        
        e_target.var_39c64392 = undefined;
        e_target dodamage( n_total_damage, self.origin, self, undefined, e_target.var_39c64392, "MOD_MELEE", 0, w_melee );
        e_target playsound( #"hash_444f738bd1d3fd8" );
        
        if ( isactor( e_target ) )
        {
            e_target clientfield::increment( "" + #"hash_29c26fb019da89f3" );
        }
        
        var_5f96a3db++;
        
        if ( var_cf912c82 < 1 && self function_da33f286() && !( isdefined( self.var_ec2fa29e ) && self.var_ec2fa29e ) )
        {
            self.health = math::clamp( self.health + var_48e9b3cc, 0, self.var_66cb03ad );
            var_cf912c82++;
        }
        
        if ( var_5f96a3db >= var_9c0b2bd5 )
        {
            self function_5b0f2cc5();
            return;
        }
    }
    
    self function_5b0f2cc5();
}

// Namespace zm_perk_ethereal_razor/zm_perk_ethereal_razor
// Params 0
// Checksum 0x64a05af, Offset: 0xf18
// Size: 0x16
function function_5b0f2cc5()
{
    self.var_53b8e41f = undefined;
    self.var_ec2fa29e = undefined;
}

// Namespace zm_perk_ethereal_razor/zm_perk_ethereal_razor
// Params 0
// Checksum 0x2c217614, Offset: 0xf38
// Size: 0xfc
function function_fa63958c()
{
    var_25e2354 = function_4d8c71ce();
    var_72714481 = getaispeciesarray( level.zombie_team, "all" );
    a_e_targets = arraycombine( var_72714481, var_25e2354, 0, 0 );
    var_f7c84239 = [];
    
    foreach ( target in a_e_targets )
    {
        if ( true )
        {
            array::add( var_f7c84239, target );
        }
    }
    
    return var_f7c84239;
}

// Namespace zm_perk_ethereal_razor/zm_perk_ethereal_razor
// Params 1
// Checksum 0xf7dfc48c, Offset: 0x1040
// Size: 0xae, Type: bool
function function_866130c7( w_melee )
{
    if ( !( isdefined( w_melee.isriotshield ) && w_melee.isriotshield ) && !zm_loadout::is_hero_weapon( w_melee ) && !( isdefined( w_melee.isbulletweapon ) && w_melee.isbulletweapon ) && ( !( isdefined( w_melee.isprimary ) && w_melee.isprimary ) || w_melee.isballisticknife ) )
    {
        return true;
    }
    
    return false;
}

// Namespace zm_perk_ethereal_razor/zm_perk_ethereal_razor
// Params 0
// Checksum 0xe3a9be9d, Offset: 0x10f8
// Size: 0x4a, Type: bool
function function_da33f286()
{
    if ( isdefined( self.var_eb319d10 ) && self.var_eb319d10 || self.n_regen_rate === 0 || !self.heal.enabled )
    {
        return false;
    }
    
    return true;
}

// Namespace zm_perk_ethereal_razor/zm_perk_ethereal_razor
// Params 1
// Checksum 0xa82b937a, Offset: 0x1150
// Size: 0x152
function on_ai_killed( s_params )
{
    player = s_params.eattacker;
    w_melee = s_params.weapon;
    
    if ( !isdefined( w_melee ) || s_params.smeansofdeath !== "MOD_MELEE" )
    {
        return;
    }
    
    if ( isplayer( player ) && player hasperk( #"specialty_etherealrazor" ) && function_866130c7( w_melee ) && isdefined( self.var_39c64392 ) && isplayer( s_params.einflictor ) )
    {
        if ( player function_da33f286() )
        {
            player.health = math::clamp( player.health + 10, 0, player.var_66cb03ad );
            player.var_ec2fa29e = 1;
            return;
        }
        
        player.var_53b8e41f = 1;
    }
}

// Namespace zm_perk_ethereal_razor/zm_perk_ethereal_razor
// Params 1
// Checksum 0xfb4c52bc, Offset: 0x12b0
// Size: 0xe2
function on_ai_damage( s_params )
{
    player = s_params.eattacker;
    w_melee = s_params.weapon;
    
    if ( !isdefined( w_melee ) || s_params.smeansofdeath !== "MOD_MELEE" )
    {
        return;
    }
    
    if ( isplayer( player ) && player hasperk( #"specialty_etherealrazor" ) && function_866130c7( w_melee ) && isplayer( s_params.einflictor ) )
    {
        self.var_39c64392 = s_params.shitloc;
    }
}

