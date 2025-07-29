#using script_24c32478acf44108;
#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\zm_utility;

#namespace zm_weap_freezegun;

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 0, eflags: 0x2
// Checksum 0xd6f9d7d8, Offset: 0x130
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zm_weap_freezegun", &_init_, undefined, undefined );
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 0
// Checksum 0xeb3545c3, Offset: 0x178
// Size: 0x396
function _init_()
{
    level.w_freezegun = getweapon( #"ww_freezegun_t8" );
    level.w_freezegun_upgraded = getweapon( #"ww_freezegun_t8_upgraded" );
    callback::add_weapon_fired( level.w_freezegun, &function_660bf66e );
    callback::add_weapon_fired( level.w_freezegun_upgraded, &function_660bf66e );
    callback::on_ai_damage( &function_b65fd5ae );
    zombie_utility::add_zombie_gib_weapon_callback( #"ww_freezegun_t8", &function_3eedf19c, &function_3eedf19c );
    zombie_utility::add_zombie_gib_weapon_callback( #"ww_freezegun_t8_upgraded", &function_3eedf19c, &function_3eedf19c );
    clientfield::register( "actor", "" + #"hash_2f305a0bea20d6ed", 1, 1, "int" );
    clientfield::register( "actor", "" + #"hash_757f891a37d3db00", 1, 1, "int" );
    clientfield::register( "actor", "" + #"hash_26d3eeef96a2291e", 1, 1, "int" );
    clientfield::register( "actor", "" + #"hash_32ec41222f58aa75", 1, 1, "int" );
    clientfield::register( "actor", "" + #"hash_259cdeffe60fe48f", 1, 1, "int" );
    clientfield::register( "actor", "" + #"hash_1aa3522b88c2b76f", 1, 1, "int" );
    clientfield::register( "actor", "" + #"hash_5ad28d5f104a6e3b", 1, 1, "int" );
    namespace_9ff9f642::register_slowdown( #"freezegun_slowdown", 0.85, 10 );
    namespace_9ff9f642::register_slowdown( #"hash_5a1a7bceb3b8fded", 0.65, 15 );
    level.var_58e6238 = &mp_dom_flag_d_captured_byinterfaceattributes;
    level.var_f975b6ae = &function_9a01c5b0;
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 1
// Checksum 0x1077a144, Offset: 0x518
// Size: 0xe, Type: bool
function function_3eedf19c( damage_percent )
{
    return false;
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 1
// Checksum 0x8860ed5, Offset: 0x530
// Size: 0x1e4
function function_b65fd5ae( params )
{
    if ( isdefined( self.water_damage ) && self.water_damage )
    {
        if ( params.idamage >= self.health )
        {
            self thread freezegun_death( params );
            return;
        }
    }
    
    if ( !is_freezegun_damage( params ) )
    {
        return;
    }
    
    if ( !isplayer( params.eattacker ) )
    {
        return;
    }
    
    if ( !isalive( self ) )
    {
        return;
    }
    
    if ( params.idamage >= self.health )
    {
        self thread freezegun_death( params );
        return;
    }
    
    if ( !isdefined( self.freezegun_damage ) )
    {
        self.freezegun_damage = 0;
    }
    
    if ( !isdefined( self.var_4592c713 ) )
    {
        self.var_4592c713 = 0;
    }
    
    var_bdbde2d2 = #"freezegun_slowdown";
    
    if ( self.var_4592c713 || params.weapon == level.w_freezegun_upgraded )
    {
        var_bdbde2d2 = #"hash_5a1a7bceb3b8fded";
    }
    
    if ( self.archetype != #"zombie_dog" )
    {
        self thread namespace_9ff9f642::slowdown( var_bdbde2d2 );
        self thread slow_watcher( var_bdbde2d2 );
    }
    
    if ( !( getdvarint( #"splitscreen_playercount", 1 ) > 2 ) )
    {
        self thread function_cdcf36d9();
    }
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 1
// Checksum 0x8577ad4, Offset: 0x720
// Size: 0x92
function slow_watcher( var_bdbde2d2 )
{
    self notify( #"hash_7898db449656ed5a" );
    self endon( #"death", #"hash_7898db449656ed5a" );
    self.var_4592c713 = 1;
    n_wait = 10;
    
    if ( var_bdbde2d2 == #"hash_5a1a7bceb3b8fded" )
    {
        n_wait = 15;
    }
    
    wait n_wait;
    self.var_4592c713 = 0;
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 1
// Checksum 0xaedd6e75, Offset: 0x7c0
// Size: 0x44
function function_660bf66e( weapon )
{
    self endon( #"disconnect" );
    self thread freezegun_fired( weapon == level.w_freezegun_upgraded );
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 1
// Checksum 0x8f602fb6, Offset: 0x810
// Size: 0xdc
function freezegun_fired( is_upgraded )
{
    if ( !isdefined( level.freezegun_enemies ) )
    {
        level.freezegun_enemies = [];
        level.freezegun_enemies_dist_ratio = [];
    }
    
    self freezegun_get_enemies_in_range( is_upgraded );
    
    for ( i = 0; i < level.freezegun_enemies.size ; i++ )
    {
        level.freezegun_enemies[ i ] thread freezegun_do_damage( is_upgraded, self, level.freezegun_enemies_dist_ratio[ i ] );
    }
    
    level.freezegun_enemies = [];
    level.freezegun_enemies_dist_ratio = [];
    self function_4aa98d7d( is_upgraded );
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 1
// Checksum 0x4422ff58, Offset: 0x8f8
// Size: 0x51a
function freezegun_get_enemies_in_range( is_upgraded )
{
    inner_range = freezegun_get_inner_range( is_upgraded );
    outer_range = freezegun_get_outer_range( is_upgraded );
    cylinder_radius = freezegun_get_cylinder_radius( is_upgraded );
    view_pos = self getweaponmuzzlepoint();
    a_targets = getentitiesinradius( view_pos, outer_range * 1.1, 15 );
    
    if ( !isdefined( a_targets ) )
    {
        return;
    }
    
    a_targets = arraysortclosest( a_targets, view_pos );
    freezegun_inner_range_squared = inner_range * inner_range;
    freezegun_outer_range_squared = outer_range * outer_range;
    cylinder_radius_squared = cylinder_radius * cylinder_radius;
    forward_view_angles = self getweaponforwarddir();
    end_pos = view_pos + vectorscale( forward_view_angles, outer_range );
    
    /#
        if ( 2 == getdvarint( #"scr_freezegun_debug", 0 ) )
        {
            near_circle_pos = view_pos + vectorscale( forward_view_angles, 2 );
            circle( near_circle_pos, cylinder_radius, ( 1, 0, 0 ), 0, 0, 100 );
            line( near_circle_pos, end_pos, ( 0, 0, 1 ), 1, 0, 100 );
            circle( end_pos, cylinder_radius, ( 1, 0, 0 ), 0, 0, 100 );
        }
    #/
    
    foreach ( ai in a_targets )
    {
        if ( !isdefined( ai ) || ai.archetype !== #"zombie" && ai.archetype !== #"zombie_dog" && ai.archetype !== #"nova_crawler" || ai getteam() !== level.zombie_team || !isalive( ai ) )
        {
            continue;
        }
        
        test_origin = ai getcentroid();
        test_range_squared = distancesquared( view_pos, test_origin );
        
        if ( test_range_squared > freezegun_outer_range_squared )
        {
            ai freezegun_debug_print( "range", ( 1, 0, 0 ) );
            return;
        }
        
        normal = vectornormalize( test_origin - view_pos );
        dot = vectordot( forward_view_angles, normal );
        
        if ( 0 > dot )
        {
            ai freezegun_debug_print( "dot", ( 1, 0, 0 ) );
            continue;
        }
        
        radial_origin = pointonsegmentnearesttopoint( view_pos, end_pos, test_origin );
        
        if ( distancesquared( test_origin, radial_origin ) > cylinder_radius_squared )
        {
            ai freezegun_debug_print( "cylinder", ( 1, 0, 0 ) );
            continue;
        }
        
        if ( 0 == ai damageconetrace( view_pos, self ) )
        {
            ai freezegun_debug_print( "cone", ( 1, 0, 0 ) );
            continue;
        }
        
        level.freezegun_enemies[ level.freezegun_enemies.size ] = ai;
        level.freezegun_enemies_dist_ratio[ level.freezegun_enemies_dist_ratio.size ] = ( freezegun_outer_range_squared - test_range_squared ) / ( freezegun_outer_range_squared - freezegun_inner_range_squared );
    }
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 3
// Checksum 0xca97a2c5, Offset: 0xe20
// Size: 0x9c
function freezegun_do_damage( is_upgraded, player, dist_ratio )
{
    damage = int( lerpfloat( freezegun_get_outer_damage( is_upgraded ), freezegun_get_inner_damage( is_upgraded ), dist_ratio ) );
    self dodamage( damage, self.origin, player, undefined, undefined, "MOD_PROJECTILE" );
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 1
// Checksum 0x88f1b5cd, Offset: 0xec8
// Size: 0x144
function function_4aa98d7d( is_upgraded )
{
    view_pos = self getweaponmuzzlepoint();
    var_6beec13a = self getweaponforwarddir();
    var_61101445 = freezegun_get_outer_range( is_upgraded );
    n_max_damage = freezegun_get_inner_damage( is_upgraded );
    n_min_damage = freezegun_get_outer_damage( is_upgraded );
    end_pos = view_pos + vectorscale( var_6beec13a, var_61101445 );
    var_6a748e6b = beamtrace( view_pos, end_pos, 0, self );
    
    if ( isdefined( var_6a748e6b[ #"position" ] ) )
    {
        glassradiusdamage( var_6a748e6b[ #"position" ], 40, n_max_damage, n_min_damage );
    }
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 3
// Checksum 0xfb848dd, Offset: 0x1018
// Size: 0x314
function freezegun_do_shatter( params, shatter_trigger, crumple_trigger )
{
    freezegun_debug_print( "shattered" );
    self thread freezegun_cleanup_freezegun_triggers( shatter_trigger, crumple_trigger );
    is_upgraded = params.weapon == level.w_freezegun_upgraded;
    centroid = self getcentroid();
    a_targets = getentitiesinradius( centroid, freezegun_get_shatter_range( is_upgraded ), 15 );
    
    foreach ( ai in a_targets )
    {
        if ( !isdefined( ai ) || ai.archetype !== #"zombie" && ai.archetype !== #"zombie_dog" && ai.archetype !== #"nova_crawler" || ai getteam() !== level.zombie_team )
        {
            continue;
        }
        
        if ( isalive( ai ) )
        {
            ai dodamage( freezegun_get_shatter_inner_damage( is_upgraded ), ai.origin, params.eattacker, undefined, undefined, "MOD_EXPLOSIVE" );
            continue;
        }
        
        if ( isdefined( ai.shatter_trigger ) )
        {
            ai.shatter_trigger dodamage( freezegun_get_shatter_inner_damage( is_upgraded ), ai.origin, params.eattacker, undefined, undefined, "MOD_EXPLOSIVE" );
        }
    }
    
    level notify( #"hash_36bd057e4aa760bd" );
    self zombie_utility::zombie_eye_glow_stop();
    self function_1cdfba74( is_upgraded );
    
    if ( isdefined( params.eattacker ) && isdefined( params.eattacker.var_5a15be2a ) )
    {
        params.eattacker [[ params.eattacker.var_5a15be2a ]]();
    }
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 3
// Checksum 0x93c125b8, Offset: 0x1338
// Size: 0x154
function freezegun_wait_for_shatter( params, shatter_trigger, crumple_trigger )
{
    shatter_trigger endon( #"death", #"cleanup_freezegun_triggers" );
    self endon( #"death" );
    wait 0.1;
    orig_attacker = params.eattacker;
    s_notify = shatter_trigger waittill( #"damage" );
    
    if ( isdefined( s_notify.eattacker ) && orig_attacker == s_notify.eattacker && s_notify.smeansofdeath == "MOD_PROJECTILE" && ( s_notify.weapon == level.w_freezegun || s_notify.weapon == level.w_freezegun_upgraded ) )
    {
        self thread freezegun_do_crumple( params, shatter_trigger, crumple_trigger );
        return;
    }
    
    self thread freezegun_do_shatter( params, shatter_trigger, crumple_trigger );
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 3
// Checksum 0xb0110983, Offset: 0x1498
// Size: 0xc4
function freezegun_do_crumple( params, shatter_trigger, crumple_trigger )
{
    freezegun_debug_print( "crumpled" );
    self freezegun_cleanup_freezegun_triggers( shatter_trigger, crumple_trigger );
    is_upgraded = params.weapon == level.w_freezegun_upgraded;
    level notify( #"hash_4904b9ea745d6545" );
    self zombie_utility::zombie_eye_glow_stop();
    self function_c61abffb( is_upgraded );
    self startragdoll();
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 3
// Checksum 0x955fe891, Offset: 0x1568
// Size: 0x94
function freezegun_wait_for_crumple( params, shatter_trigger, crumple_trigger )
{
    crumple_trigger endon( #"death", #"cleanup_freezegun_triggers" );
    self endon( #"death" );
    wait 0.1;
    crumple_trigger waittill( #"trigger" );
    self thread freezegun_do_crumple( params, shatter_trigger, crumple_trigger );
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 2
// Checksum 0x934b6300, Offset: 0x1608
// Size: 0x9c
function freezegun_cleanup_freezegun_triggers( shatter_trigger, crumple_trigger )
{
    self endon( #"death" );
    self.cleanup_freezegun_triggers = 1;
    self notify( #"cleanup_freezegun_triggers" );
    shatter_trigger notify( #"cleanup_freezegun_triggers" );
    crumple_trigger notify( #"cleanup_freezegun_triggers" );
    shatter_trigger delete();
    crumple_trigger delete();
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 0
// Checksum 0x254ba21f, Offset: 0x16b0
// Size: 0x1c
function freezegun_run_skipped_death_events()
{
    self thread zombie_utility::zombie_eye_glow_stop();
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 1
// Checksum 0xcbce17, Offset: 0x16d8
// Size: 0x8c
function freezegun_death( params )
{
    if ( self.archetype === #"zombie_dog" )
    {
        self freezegun_run_skipped_death_events();
        return;
    }
    
    self.freezegun_death = 1;
    self.skip_death_notetracks = 1;
    self.nodeathragdoll = 1;
    self.var_606a4641 = params;
    self playsound( #"hash_2039f8c77ff89659" );
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 0
// Checksum 0xa895d8ad, Offset: 0x1770
// Size: 0x204
function mp_dom_flag_d_captured_byinterfaceattributes()
{
    if ( !( getdvarint( #"splitscreen_playercount", 1 ) > 2 ) )
    {
        self thread function_cdcf36d9();
        self thread function_aa09d4c6();
    }
    
    self thread function_cd5a6d8();
    shatter_trigger = spawn( "trigger_damage", self.origin, 0, 15, 72 );
    shatter_trigger enablelinkto();
    shatter_trigger linkto( self );
    shatter_trigger thread function_e31780b1();
    spawnflags = 512 | 1 | 512 | 2 | 512 | 4 | 16;
    crumple_trigger = spawn( "trigger_radius", self.origin, spawnflags, 15, 72 );
    crumple_trigger enablelinkto();
    crumple_trigger linkto( self );
    crumple_trigger thread function_e31780b1();
    self.shatter_trigger = shatter_trigger;
    self.crumple_trigger = crumple_trigger;
    self thread freezegun_wait_for_shatter( self.var_606a4641, shatter_trigger, crumple_trigger );
    self thread freezegun_wait_for_crumple( self.var_606a4641, shatter_trigger, crumple_trigger );
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 0
// Checksum 0xe37c0ccc, Offset: 0x1980
// Size: 0xe4
function function_9a01c5b0()
{
    if ( isdefined( self.cleanup_freezegun_triggers ) && self.cleanup_freezegun_triggers )
    {
        return;
    }
    
    if ( isdefined( self.shatter_trigger ) && isdefined( self.crumple_trigger ) )
    {
        self freezegun_do_crumple( self.var_606a4641, self.shatter_trigger, self.crumple_trigger );
        return;
    }
    
    if ( isdefined( self ) )
    {
        if ( !( getdvarint( #"splitscreen_playercount", 1 ) > 2 ) )
        {
            self function_1e71ac1e();
            self function_95a1c464();
        }
        
        self startragdoll();
    }
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 0
// Checksum 0xa944a9fd, Offset: 0x1a70
// Size: 0x54
function function_e31780b1()
{
    level endon( #"game_ended" );
    self endon( #"death" );
    wait 10;
    
    if ( isdefined( self ) )
    {
        self delete();
    }
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 1
// Checksum 0x2923835e, Offset: 0x1ad0
// Size: 0x84, Type: bool
function is_freezegun_damage( params )
{
    return ( params.smeansofdeath == "MOD_EXPLOSIVE" || params.smeansofdeath == "MOD_PROJECTILE" ) && isdefined( params.weapon ) && ( params.weapon == level.w_freezegun || params.weapon == level.w_freezegun_upgraded );
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 1
// Checksum 0x5f078e8e, Offset: 0x1b60
// Size: 0x68, Type: bool
function is_freezegun_shatter_damage( params )
{
    return params.smeansofdeath == "MOD_EXPLOSIVE" && isdefined( params.weapon ) && ( params.weapon == level.w_freezegun || params.weapon == level.w_freezegun_upgraded );
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 1
// Checksum 0x25fd12bf, Offset: 0x1bd0
// Size: 0x22, Type: bool
function should_do_freezegun_death( params )
{
    return is_freezegun_damage( params );
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 0
// Checksum 0xf53b236d, Offset: 0x1c00
// Size: 0x10, Type: bool
function enemy_damaged_by_freezegun()
{
    return 0 < self.freezegun_damage;
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 0
// Checksum 0x2796c647, Offset: 0x1c18
// Size: 0x14
function enemy_percent_damaged_by_freezegun()
{
    return self.freezegun_damage / self.maxhealth;
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 0
// Checksum 0xf42fc223, Offset: 0x1c38
// Size: 0x1e, Type: bool
function enemy_killed_by_freezegun()
{
    return isdefined( self.freezegun_death ) && self.freezegun_death == 1;
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 1
// Checksum 0xcfa0678c, Offset: 0x1c60
// Size: 0x24
function freezegun_get_cylinder_radius( is_upgraded )
{
    if ( is_upgraded )
    {
        return 180;
    }
    
    return 120;
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 1
// Checksum 0x3c97a1e7, Offset: 0x1c90
// Size: 0x24
function freezegun_get_inner_range( is_upgraded )
{
    if ( is_upgraded )
    {
        return 120;
    }
    
    return 60;
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 1
// Checksum 0xecff8313, Offset: 0x1cc0
// Size: 0x24
function freezegun_get_outer_range( is_upgraded )
{
    if ( is_upgraded )
    {
        return 900;
    }
    
    return 600;
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 1
// Checksum 0x53cd7834, Offset: 0x1cf0
// Size: 0x24
function freezegun_get_inner_damage( is_upgraded )
{
    if ( is_upgraded )
    {
        return 3000;
    }
    
    return 1500;
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 1
// Checksum 0x77c52751, Offset: 0x1d20
// Size: 0x24
function freezegun_get_outer_damage( is_upgraded )
{
    if ( is_upgraded )
    {
        return 1500;
    }
    
    return 750;
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 1
// Checksum 0x1e378e59, Offset: 0x1d50
// Size: 0x24
function freezegun_get_shatter_range( is_upgraded )
{
    if ( is_upgraded )
    {
        return 300;
    }
    
    return 180;
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 1
// Checksum 0x37792e8f, Offset: 0x1d80
// Size: 0x24
function freezegun_get_shatter_inner_damage( is_upgraded )
{
    if ( is_upgraded )
    {
        return 750;
    }
    
    return 500;
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 1
// Checksum 0xb7bff93b, Offset: 0x1db0
// Size: 0x24
function freezegun_get_shatter_outer_damage( is_upgraded )
{
    if ( is_upgraded )
    {
        return 500;
    }
    
    return 250;
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 2
// Checksum 0xd39c40ba, Offset: 0x1de0
// Size: 0x8c
function freezegun_debug_print( msg, color )
{
    /#
        if ( !getdvarint( #"scr_freezegun_debug", 0 ) )
        {
            return;
        }
        
        if ( !isdefined( color ) )
        {
            color = ( 1, 1, 1 );
        }
        
        print3d( self.origin + ( 0, 0, 60 ), msg, color, 1, 1, 40 );
    #/
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 1
// Checksum 0xdd9153c4, Offset: 0x1e78
// Size: 0xb4
function function_1cdfba74( is_upgraded )
{
    if ( is_upgraded )
    {
        self clientfield::set( "" + #"hash_26d3eeef96a2291e", 1 );
        self playsound( #"hash_3bed1320e59a493c" );
        return;
    }
    
    self clientfield::set( "" + #"hash_2f305a0bea20d6ed", 1 );
    self playsound( #"hash_3bed1320e59a493c" );
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 1
// Checksum 0x24835ae1, Offset: 0x1f38
// Size: 0xb4
function function_c61abffb( is_upgraded )
{
    if ( is_upgraded )
    {
        self clientfield::set( "" + #"hash_32ec41222f58aa75", 1 );
        self playsound( #"hash_55070bed4172e08c" );
        return;
    }
    
    self clientfield::set( "" + #"hash_757f891a37d3db00", 1 );
    self playsound( #"hash_55070bed4172e08c" );
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 0
// Checksum 0x595af49, Offset: 0x1ff8
// Size: 0x34
function function_cdcf36d9()
{
    self clientfield::set( "" + #"hash_1aa3522b88c2b76f", 1 );
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 0
// Checksum 0x904e784f, Offset: 0x2038
// Size: 0x2c
function function_1e71ac1e()
{
    self clientfield::set( "" + #"hash_1aa3522b88c2b76f", 0 );
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 0
// Checksum 0xdb70db5d, Offset: 0x2070
// Size: 0x34
function function_aa09d4c6()
{
    self clientfield::set( "" + #"hash_259cdeffe60fe48f", 1 );
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 0
// Checksum 0x95dd0c00, Offset: 0x20b0
// Size: 0x2c
function function_95a1c464()
{
    self clientfield::set( "" + #"hash_259cdeffe60fe48f", 0 );
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 0
// Checksum 0xfc189097, Offset: 0x20e8
// Size: 0x34
function function_cd5a6d8()
{
    self clientfield::set( "" + #"hash_5ad28d5f104a6e3b", 1 );
}

// Namespace zm_weap_freezegun/zm_weap_freezegun
// Params 0
// Checksum 0xc89e8712, Offset: 0x2128
// Size: 0x2c
function function_7258958d()
{
    self clientfield::set( "" + #"hash_5ad28d5f104a6e3b", 0 );
}

