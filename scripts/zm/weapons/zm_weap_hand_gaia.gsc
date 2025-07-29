#using script_24c32478acf44108;
#using scripts\abilities\ability_player;
#using scripts\core_common\ai\systems\gib;
#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\ai_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\throttle_shared;
#using scripts\core_common\util_shared;
#using scripts\zm\zm_lightning_chain;
#using scripts\zm_common\callbacks;
#using scripts\zm_common\zm_armor;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_hero_weapon;
#using scripts\zm_common\zm_loadout;
#using scripts\zm_common\zm_net;
#using scripts\zm_common\zm_score;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_weapons;

#namespace zm_weap_hand_gaia;

// Namespace zm_weap_hand_gaia/zm_weap_hand_gaia
// Params 0, eflags: 0x2
// Checksum 0xc61ac578, Offset: 0x1f8
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zm_weap_hand_gaia", &__init__, undefined, undefined );
}

// Namespace zm_weap_hand_gaia/zm_weap_hand_gaia
// Params 0
// Checksum 0x981ddcd1, Offset: 0x240
// Size: 0x41e
function __init__()
{
    clientfield::register( "actor", "" + #"gaia_impact_zombie", 16000, 1, "counter" );
    clientfield::register( "scriptmover", "" + #"gaia_shoot", 16000, 1, "counter" );
    clientfield::register( "scriptmover", "" + #"gaia_impact", 16000, 1, "counter" );
    clientfield::register( "scriptmover", "" + #"spike_explode", 16000, 1, "counter" );
    clientfield::register( "scriptmover", "" + #"spike_spawn", 16000, 1, "counter" );
    level.w_hand_gaia = getweapon( #"ww_hand_g" );
    level.w_hand_gaia_charged = getweapon( #"ww_hand_g_charged" );
    level.w_hand_gaia_uncharged = getweapon( #"ww_hand_g_uncharged" );
    level.w_hand_gaia_upgraded = getweapon( #"ww_hand_g_upgraded" );
    zm_weapons::include_zombie_weapon( #"ww_hand_g", 0 );
    zm_weapons::include_zombie_weapon( #"ww_hand_g_charged", 0 );
    zm_weapons::include_zombie_weapon( #"ww_hand_g_uncharged", 0 );
    zm_weapons::include_zombie_weapon( #"ww_hand_g_upgraded", 0 );
    namespace_9ff9f642::register_slowdown( #"gaia_slowdown_time", 0.1, 3 );
    namespace_9ff9f642::register_slowdown( #"hash_2b068d1172ea957", 0.3, 3 );
    namespace_9ff9f642::register_slowdown( #"hash_315cdbcb170fa2c4", 0.5, 3 );
    callback::on_connect( &on_player_connect );
    
    if ( !isdefined( level.var_9295b8ef ) )
    {
        level.var_9295b8ef = new throttle();
        [[ level.var_9295b8ef ]]->initialize( 6, 0.1 );
    }
    
    callback::add_weapon_fired( level.w_hand_gaia, &function_10b4d6ac );
    callback::add_weapon_fired( level.w_hand_gaia_charged, &function_dd7bc108 );
    callback::add_weapon_fired( level.w_hand_gaia_uncharged, &function_10b4d6ac );
    callback::add_weapon_fired( level.w_hand_gaia_upgraded, &function_10b4d6ac );
    level.var_4cd68405 = [];
    level.var_ff53a03a = [];
}

// Namespace zm_weap_hand_gaia/zm_weap_hand_gaia
// Params 0
// Checksum 0x7fdb616b, Offset: 0x668
// Size: 0x1c
function on_player_connect()
{
    self thread function_3f8da82c();
}

// Namespace zm_weap_hand_gaia/zm_weap_hand_gaia
// Params 0
// Checksum 0xb6290c11, Offset: 0x690
// Size: 0x8a
function function_3f8da82c()
{
    self endon( #"disconnect" );
    
    while ( true )
    {
        s_notify = self waittill( #"weapon_change" );
        
        if ( s_notify.weapon == level.w_hand_gaia || s_notify.weapon == level.w_hand_gaia_upgraded )
        {
            level.var_a8472176 = 1;
        }
    }
}

// Namespace zm_weap_hand_gaia/zm_weap_hand_gaia
// Params 1
// Checksum 0xe3e91ddb, Offset: 0x728
// Size: 0x316
function function_10b4d6ac( weapon )
{
    self endon( #"death" );
    
    if ( weapon == level.w_hand_gaia_upgraded )
    {
        n_damage = 8500;
        b_up = 1;
    }
    else
    {
        n_damage = 5000;
        b_up = 0;
    }
    
    a_e_targets = function_31ad5b3d( b_up );
    
    if ( isdefined( a_e_targets ) )
    {
        if ( isdefined( a_e_targets[ 0 ] ) && a_e_targets[ 0 ].zm_ai_category === #"boss" )
        {
            n_proj = 3;
        }
        else if ( !a_e_targets.size || a_e_targets.size === 1 && !isactor( a_e_targets[ 0 ] ) )
        {
            n_proj = 1;
        }
        else
        {
            n_proj = 3;
        }
    }
    
    for ( i = 0; i < n_proj ; i++ )
    {
        e_projectile = util::spawn_model( "tag_origin", self gettagorigin( "tag_flash" ), self gettagangles( "tag_flash" ) );
        
        if ( isdefined( e_projectile ) )
        {
            e_projectile thread set_projectile( i );
            
            if ( isdefined( a_e_targets ) && isdefined( a_e_targets[ i ] ) )
            {
                self thread gaia_projectile( e_projectile, a_e_targets[ i ], n_damage );
            }
            else if ( i == 1 && isdefined( a_e_targets[ i - 1 ] ) )
            {
                self thread gaia_projectile( e_projectile, a_e_targets[ i - 1 ], n_damage );
            }
            else if ( i == 2 )
            {
                if ( isdefined( a_e_targets[ i - 1 ] ) )
                {
                    self thread gaia_projectile( e_projectile, a_e_targets[ i - 1 ], n_damage );
                }
                else if ( isdefined( a_e_targets[ i - 2 ] ) )
                {
                    self thread gaia_projectile( e_projectile, a_e_targets[ i - 2 ], n_damage );
                }
            }
            else
            {
                self thread gaia_projectile( e_projectile );
            }
            
            wait 0.1;
        }
    }
}

// Namespace zm_weap_hand_gaia/zm_weap_hand_gaia
// Params 1
// Checksum 0x303d146a, Offset: 0xa48
// Size: 0x75c
function function_31ad5b3d( b_up )
{
    if ( b_up )
    {
        n_range = 3000;
    }
    else
    {
        n_range = 2150;
    }
    
    view_pos = self geteye();
    forward_view_angles = anglestoforward( self getplayerangles() );
    
    if ( forward_view_angles[ 2 ] < -0.7 )
    {
        var_ccb70dad = vectornormalize( ( forward_view_angles[ 0 ], forward_view_angles[ 1 ], -0.25 ) );
    }
    else
    {
        var_ccb70dad = vectornormalize( forward_view_angles );
    }
    
    a_e_targets = function_3874b38f();
    a_e_valid = [];
    
    foreach ( e_target in a_e_targets )
    {
        if ( self is_valid_target( e_target, n_range ) )
        {
            a_e_valid[ a_e_valid.size ] = e_target;
        }
    }
    
    a_e_valid = array::get_all_closest( self.origin, a_e_valid );
    a_e_priority = [];
    
    foreach ( e_target in a_e_valid )
    {
        if ( isdefined( e_target.var_564012c4 ) && e_target.var_564012c4 )
        {
            if ( !isdefined( a_e_priority ) )
            {
                a_e_priority = [];
            }
            else if ( !isarray( a_e_priority ) )
            {
                a_e_priority = array( a_e_priority );
            }
            
            a_e_priority[ a_e_priority.size ] = e_target;
        }
    }
    
    foreach ( e_target in a_e_priority )
    {
        arrayremovevalue( a_e_valid, e_target );
        array::push_front( a_e_valid, e_target );
    }
    
    var_99588c0f = function_3ebebb9c();
    
    if ( isdefined( var_99588c0f ) )
    {
        var_4784577e = a_e_valid.size;
        var_f9486bd2 = 0;
        var_99588c0f = array::remove_undefined( var_99588c0f );
        var_99588c0f = arraysortclosest( var_99588c0f, self.origin );
        
        foreach ( e_target in var_99588c0f )
        {
            if ( !self zm_utility::is_player_looking_at( e_target getcentroid(), 0.9, 0, self ) && !self zm_utility::is_player_looking_at( e_target.origin, 0.9, 0, self ) )
            {
                continue;
            }
            
            if ( distance2dsquared( self.origin, e_target.origin ) > n_range * n_range )
            {
                continue;
            }
            
            if ( isdefined( level.var_5b7d4d8d ) && level.var_5b7d4d8d )
            {
                var_f9486bd2++;
                
                if ( var_4784577e == 0 )
                {
                    array::push_front( a_e_valid, e_target );
                }
                
                continue;
            }
            
            var_f9486bd2++;
            array::push_front( a_e_valid, e_target );
        }
        
        if ( isdefined( level.var_5b7d4d8d ) && level.var_5b7d4d8d && var_4784577e > 0 )
        {
            if ( var_f9486bd2 == var_99588c0f.size )
            {
                foreach ( var_ef7e8e7c in var_99588c0f )
                {
                    array::push_front( a_e_valid, var_ef7e8e7c );
                }
            }
            else
            {
                var_f9486bd2 = 0;
            }
        }
        
        if ( isdefined( level.var_f521216c ) && level.var_f521216c && var_f9486bd2 > 0 )
        {
            level notify( #"hash_1e5cf7b7965152f3", { #var_f9486bd2:var_f9486bd2, #e_player:self } );
        }
    }
    
    var_465b9157 = function_b9a3e6f9();
    
    if ( isdefined( var_465b9157 ) )
    {
        var_465b9157 = array::remove_undefined( var_465b9157 );
        var_465b9157 = arraysortclosest( var_465b9157, self.origin );
        
        foreach ( e_target in var_465b9157 )
        {
            if ( !self zm_utility::is_player_looking_at( e_target.origin, 0.9, 1, self ) )
            {
                continue;
            }
            
            if ( distance2dsquared( self.origin, e_target.origin ) > n_range * n_range )
            {
                continue;
            }
            
            e_target.var_3df1a748 = 1;
            array::push_front( a_e_valid, e_target );
        }
    }
    
    return a_e_valid;
}

// Namespace zm_weap_hand_gaia/zm_weap_hand_gaia
// Params 2
// Checksum 0x217741de, Offset: 0x11b0
// Size: 0x2b2, Type: bool
function is_valid_target( e_target, n_range )
{
    if ( zm_utility::is_magic_bullet_shield_enabled( e_target ) )
    {
        return false;
    }
    
    if ( isdefined( e_target.var_5a3ebaa3 ) && e_target.var_5a3ebaa3 || isdefined( e_target.var_f9b38410 ) && e_target.var_f9b38410 )
    {
        return false;
    }
    
    if ( isdefined( e_target.marked_for_death ) && e_target.marked_for_death )
    {
        return false;
    }
    
    if ( distance2dsquared( self.origin, e_target.origin ) <= 64 * 64 && ( self zm_utility::is_player_looking_at( e_target getcentroid(), 0.3, 1, self ) || self zm_utility::is_player_looking_at( e_target getcentroid() + ( 0, 0, 32 ), 0.3, 1, self ) ) )
    {
        return true;
    }
    
    if ( isdefined( e_target.fake_death ) && e_target.fake_death )
    {
        return false;
    }
    
    if ( !isalive( e_target ) )
    {
        return false;
    }
    
    if ( distance2dsquared( self.origin, e_target.origin ) > n_range * n_range )
    {
        return false;
    }
    
    var_c060d2c8 = !( isdefined( level.var_58f509b6 ) && level.var_58f509b6 );
    
    if ( !self zm_utility::is_player_looking_at( e_target getcentroid(), 0.9, var_c060d2c8, self ) && !self zm_utility::is_player_looking_at( e_target.origin, 0.9, var_c060d2c8, self ) && !self zm_utility::is_player_looking_at( e_target getcentroid() + ( 0, 0, 28 ), 0.9, var_c060d2c8, self ) )
    {
        return false;
    }
    
    return true;
}

// Namespace zm_weap_hand_gaia/zm_weap_hand_gaia
// Params 1
// Checksum 0xa558f9da, Offset: 0x1470
// Size: 0x64
function set_projectile( n_index )
{
    self endon( #"death" );
    self.n_index = n_index;
    wait 0.1;
    self clientfield::increment( "" + #"gaia_shoot" );
}

// Namespace zm_weap_hand_gaia/zm_weap_hand_gaia
// Params 3
// Checksum 0x1dae527c, Offset: 0x14e0
// Size: 0x7fc
function gaia_projectile( e_projectile, ai_zombie, n_damage )
{
    e_projectile endon( #"death" );
    self endon( #"disconnect" );
    e_projectile thread projectile_timeout();
    v_end = self function_39e8ed04();
    n_dist = distance( e_projectile.origin, v_end );
    n_time = n_dist / 1500;
    
    if ( n_time <= 0.1 )
    {
        n_time = 0.1;
    }
    
    if ( !isdefined( ai_zombie ) )
    {
        e_projectile moveto( v_end, n_time );
        e_projectile waittill( #"movedone" );
        e_projectile clientfield::increment( "" + #"gaia_impact" );
        waitframe( 1 );
    }
    else
    {
        var_2ed6f142 = self getweaponmuzzlepoint();
        v_forward = self getweaponforwarddir();
        v_end = var_2ed6f142 + v_forward * 200;
        n_dist_sq = distance2dsquared( self.origin, v_end );
        
        if ( isdefined( ai_zombie ) && distance2dsquared( e_projectile.origin, ai_zombie.origin ) <= n_dist_sq )
        {
            n_dist = distance( e_projectile.origin, ai_zombie.origin );
            n_time = n_dist / 1500;
            
            if ( n_time <= 0.1 )
            {
                n_time = 0.1;
            }
            
            if ( isdefined( ai_zombie ) )
            {
                e_projectile moveto( ai_zombie getcentroid(), n_time );
                wait n_time - 0.05;
            }
        }
        else if ( isdefined( ai_zombie ) )
        {
            var_4d8b7233 = 0;
            var_14dcf3ed = 0;
            v_org = function_30239376( ai_zombie );
            n_dist = distance( self.origin, v_org );
            var_7fd007f9 = n_dist * 0.5;
            v_end = var_2ed6f142 + v_forward * 100;
            var_a93a9211 = distance( self.origin, v_end );
            v_right = var_2ed6f142 + anglestoright( self.angles ) * 50;
            v_right_end = v_right + v_forward * 100;
            v_left = var_2ed6f142 - anglestoright( self.angles ) * 50;
            v_left_end = v_left + v_forward * 100;
            n_time = var_a93a9211 / 1500;
            
            if ( n_time <= 0.1 )
            {
                n_time = 0.1;
            }
            
            if ( e_projectile.n_index === 1 )
            {
                e_projectile moveto( v_right_end, n_time );
            }
            else if ( e_projectile.n_index === 2 )
            {
                e_projectile moveto( v_left_end, n_time );
            }
            else
            {
                e_projectile moveto( v_end, n_time );
            }
            
            wait n_time - 0.05;
            
            if ( isdefined( ai_zombie ) && ai_zombie.zm_ai_category === #"boss" )
            {
                if ( isdefined( ai_zombie gettagorigin( "j_tail_1" ) ) )
                {
                    n_hit_dist_sq = 2500;
                }
                else
                {
                    n_hit_dist_sq = 400;
                }
            }
            else
            {
                n_hit_dist_sq = 400;
            }
            
            while ( isdefined( ai_zombie ) )
            {
                v_target = function_30239376( ai_zombie );
                n_dist = distance( e_projectile.origin, v_target );
                
                if ( n_dist > var_7fd007f9 )
                {
                    var_4d8b7233 += 20;
                    
                    if ( e_projectile.n_index === 1 )
                    {
                        v_horz = v_target + anglestoright( ai_zombie.angles ) * 100;
                    }
                    else if ( e_projectile.n_index === 2 )
                    {
                        v_horz = v_target - anglestoright( ai_zombie.angles ) * 100;
                    }
                    else
                    {
                        v_horz = v_target;
                    }
                    
                    if ( isdefined( v_horz ) )
                    {
                        v_end = v_horz + ( 0, 0, var_4d8b7233 );
                    }
                }
                else
                {
                    var_4d8b7233 -= 20;
                    
                    if ( isdefined( v_target ) )
                    {
                        v_end = v_target + ( 0, 0, var_4d8b7233 );
                        
                        if ( v_end[ 2 ] < v_target[ 2 ] + 8 )
                        {
                            v_end = v_target + ( 0, 0, 8 );
                        }
                    }
                }
                
                n_time = n_dist / 1500;
                
                if ( n_time <= 0.1 )
                {
                    n_time = 0.1;
                }
                
                if ( isdefined( v_end ) && isdefined( ai_zombie ) )
                {
                    e_projectile moveto( v_end, n_time );
                }
                
                waitframe( 1 );
                var_dc65d1c = distance2dsquared( e_projectile.origin, v_end );
                
                if ( var_dc65d1c <= n_hit_dist_sq )
                {
                    break;
                }
            }
        }
    }
    
    if ( isdefined( ai_zombie ) )
    {
        v_end = function_30239376( ai_zombie );
    }
    
    if ( isdefined( v_end ) )
    {
        e_projectile moveto( v_end, 0.05 );
        e_projectile waittill( #"movedone" );
    }
    
    if ( isalive( ai_zombie ) || isdefined( ai_zombie ) && ai_zombie.zm_ai_category === #"boss" )
    {
        self thread function_dced5aef( ai_zombie, level.w_hand_gaia_uncharged, n_damage, undefined );
    }
    
    waitframe( 1 );
    e_projectile delete();
}

// Namespace zm_weap_hand_gaia/zm_weap_hand_gaia
// Params 1
// Checksum 0x2e6eb8ec, Offset: 0x1ce8
// Size: 0x126
function function_30239376( e_target )
{
    if ( isdefined( e_target ) && e_target.zm_ai_category === #"boss" )
    {
        if ( isdefined( e_target gettagorigin( "j_tail_1" ) ) )
        {
            v_org = e_target gettagorigin( "j_tail_1" );
        }
        else if ( isdefined( e_target gettagorigin( "j_spine4" ) ) )
        {
            v_org = e_target gettagorigin( "j_spine4" );
        }
        else
        {
            v_org = e_target getcentroid();
        }
    }
    else if ( isdefined( e_target gettagorigin( "j_spine4" ) ) )
    {
        v_org = e_target gettagorigin( "j_spine4" );
    }
    else
    {
        v_org = e_target.origin;
    }
    
    return v_org;
}

// Namespace zm_weap_hand_gaia/zm_weap_hand_gaia
// Params 0
// Checksum 0x5a5f7207, Offset: 0x1e18
// Size: 0x34
function projectile_timeout()
{
    self endon( #"death" );
    wait 5;
    self delete();
}

// Namespace zm_weap_hand_gaia/zm_weap_hand_gaia
// Params 1
// Checksum 0x28df9f14, Offset: 0x1e58
// Size: 0x4a
function function_794f3059( v_end )
{
    v_to_goal = v_end - self.origin;
    v_face_angles = vectortoangles( v_to_goal );
    return v_face_angles;
}

// Namespace zm_weap_hand_gaia/zm_weap_hand_gaia
// Params 5
// Checksum 0xbee5010e, Offset: 0x1eb0
// Size: 0x474
function function_dced5aef( e_target, weapon = level.weaponnone, n_damage, b_charged, v_dir )
{
    self endon( #"disconnect" );
    e_target endon( #"death" );
    
    if ( isactor( e_target ) && zm_utility::is_magic_bullet_shield_enabled( e_target ) )
    {
        return;
    }
    
    if ( isdefined( e_target ) && isdefined( e_target.zm_ai_category ) )
    {
        [[ level.var_9295b8ef ]]->waitinqueue( e_target );
        
        switch ( e_target.zm_ai_category )
        {
            case #"popcorn":
            case #"basic":
            case #"enhanced":
                if ( isdefined( level.var_14f649ad ) && level.var_14f649ad )
                {
                    n_damage = e_target.health + 666;
                }
                
                if ( n_damage >= e_target.health )
                {
                    e_target.marked_for_death = 1;
                }
                
                if ( e_target.archetype === #"skeleton" )
                {
                    e_target dodamage( n_damage, self.origin, self, undefined, "none", "MOD_UNKNOWN", 0, weapon );
                }
                else if ( isdefined( e_target.marked_for_death ) && e_target.marked_for_death || isdefined( b_charged ) )
                {
                    self thread function_85d88e17( e_target, b_charged, v_dir, n_damage );
                }
                else
                {
                    e_target dodamage( n_damage, e_target.origin, self, self, "none", "MOD_UNKNOWN", 0, weapon );
                }
                
                break;
            case #"heavy":
                e_target dodamage( n_damage, self.origin, self, undefined, "none", "MOD_UNKNOWN", 0, weapon );
                e_target.var_61768419 = 0;
                break;
            case #"miniboss":
                if ( !isdefined( b_charged ) )
                {
                    e_target clientfield::increment( "" + #"gaia_impact_zombie" );
                }
                
                n_damage = int( n_damage * 0.3 );
                e_target dodamage( n_damage, e_target.origin, self, undefined, "none", "MOD_UNKNOWN", 0, weapon );
                e_target.var_61768419 = 0;
                
                if ( randomint( 10 ) == 0 )
                {
                    e_target thread ai::stun();
                }
                
                break;
            case #"boss":
                if ( !isactor( e_target ) )
                {
                    e_target clientfield::increment( "" + #"gaia_impact" );
                }
                
                n_damage = 175;
                e_target dodamage( n_damage, self.origin, self, undefined, "none", "MOD_UNKNOWN", 0, weapon );
                break;
        }
        
        return;
    }
    
    e_target dodamage( n_damage, self.origin, self, undefined, "none", "MOD_UNKNOWN", 0, weapon );
}

// Namespace zm_weap_hand_gaia/zm_weap_hand_gaia
// Params 0
// Checksum 0x803c4c63, Offset: 0x2330
// Size: 0x110
function function_39e8ed04()
{
    var_2ed6f142 = self getweaponmuzzlepoint();
    v_forward = self getweaponforwarddir();
    v_end = var_2ed6f142 + v_forward * 10000;
    a_trace = bullettrace( var_2ed6f142, v_end, 0, self );
    
    if ( isdefined( level.var_1e60b889 ) )
    {
        level notify( #"ww_gaia_hit", { #player:self, #e_entity:a_trace[ #"entity" ], #v_position:a_trace[ #"position" ] } );
    }
    
    return a_trace[ #"position" ];
}

// Namespace zm_weap_hand_gaia/zm_weap_hand_gaia
// Params 1
// Checksum 0xf17fda55, Offset: 0x2448
// Size: 0x4ba
function function_dd7bc108( weapon )
{
    self endon( #"disconnect", #"weapon_change" );
    
    if ( !level.var_a8472176 )
    {
        return;
    }
    
    level.var_a8472176 = 0;
    
    if ( self.currentweapon === level.w_hand_gaia_upgraded )
    {
        n_damage = 8500;
        b_up = 1;
    }
    else
    {
        n_damage = 5000;
        b_up = 0;
    }
    
    n_inc = 100;
    v_org = self.origin;
    
    if ( self.currentweapon === level.w_hand_gaia_upgraded || self.currentweapon === level.w_hand_gaia )
    {
        n_ammo = self getweaponammoclip( self.currentweapon );
    }
    
    if ( n_ammo >= 2 )
    {
        n_ammo -= 2;
    }
    else
    {
        return;
    }
    
    if ( self.currentweapon === level.w_hand_gaia_upgraded || self.currentweapon === level.w_hand_gaia )
    {
        self setweaponammoclip( self.currentweapon, n_ammo );
    }
    
    self notify( #"hash_1b2c21ba7b18dbf9" );
    a_e_targets = function_31ad5b3d( b_up );
    level thread function_35f548bc();
    var_d29931f9 = 0;
    
    for ( i = 0; i < 15 ; i++ )
    {
        v_forward = anglestoforward( self.angles ) * n_inc;
        v_target = v_org + v_forward;
        v_ground = undefined;
        
        while ( !isdefined( v_ground ) )
        {
            v_trace = groundtrace( v_target + ( 0, 0, 200 ), v_target + ( 0, 0, -2000 ), 0, self, 1 )[ #"position" ];
            v_trace += ( randomintrange( -10, 10 ), randomintrange( -10, 10 ), 0 );
            v_on_navmesh = zm_utility::function_b0eeaada( v_trace );
            
            if ( isdefined( v_on_navmesh ) )
            {
                v_ground = v_on_navmesh[ #"point" ];
            }
            
            waitframe( 1 );
        }
        
        mdl_spike = util::spawn_model( "p8_fxanim_zm_red_gaia_spikes_mod", v_ground, self.angles + ( 0, randomintrange( -30, 30 ), 0 ), 0 );
        
        if ( isdefined( mdl_spike ) )
        {
            mdl_spike.owner = self;
            mdl_spike thread scene::play( "p8_fxanim_zm_red_gaia_spikes_bundle", "rise", mdl_spike );
            mdl_spike thread function_33f9ab00( a_e_targets, self.currentweapon );
        }
        
        n_inc += 50;
        wait 0.1;
        
        if ( isdefined( mdl_spike ) && isdefined( mdl_spike.var_6fe9ec3f ) && mdl_spike.var_6fe9ec3f )
        {
            var_d29931f9++;
        }
    }
    
    self notify( #"hash_4c8edf52fbfca691", { #var_e0ae28d:var_d29931f9 } );
    
    foreach ( e_target in a_e_targets )
    {
        if ( isdefined( e_target ) )
        {
            e_target.var_61768419 = 0;
        }
    }
}

// Namespace zm_weap_hand_gaia/zm_weap_hand_gaia
// Params 0
// Checksum 0x3476fb46, Offset: 0x2910
// Size: 0x1a
function function_35f548bc()
{
    wait 1.8;
    level.var_a8472176 = 1;
}

// Namespace zm_weap_hand_gaia/zm_weap_hand_gaia
// Params 2
// Checksum 0xa69a998a, Offset: 0x2938
// Size: 0x284
function function_33f9ab00( a_e_targets, weapon )
{
    self endon( #"death" );
    v_pos = self.origin;
    
    foreach ( e_target in a_e_targets )
    {
        if ( isalive( e_target ) && distancesquared( v_pos, e_target.origin ) <= 60 * 60 && !( isdefined( e_target.var_317b8f00 ) && e_target.var_317b8f00 ) && !( isdefined( e_target.var_5a3ebaa3 ) && e_target.var_5a3ebaa3 ) && !( isdefined( e_target.var_339655cf ) && e_target.var_339655cf ) && v_pos[ 2 ] <= e_target.origin[ 2 ] )
        {
            if ( isdefined( self.owner ) )
            {
                self.owner thread gaia_slow( e_target );
            }
            
            if ( !( isdefined( self.var_6fe9ec3f ) && self.var_6fe9ec3f ) && !( isdefined( e_target.var_a447e680 ) && e_target.var_a447e680 ) && ( e_target.archetype === #"zombie" || e_target.archetype === #"catalyst" ) )
            {
                self.var_6fe9ec3f = 1;
                e_target.var_a447e680 = 1;
                self thread scene::play( #"aib_vign_cust_zm_red_zmb_impale_from_below_00", e_target );
            }
        }
    }
    
    wait 1.5;
    self spike_explode( v_pos, weapon );
}

// Namespace zm_weap_hand_gaia/zm_weap_hand_gaia
// Params 2
// Checksum 0x601b14bf, Offset: 0x2bc8
// Size: 0x324
function spike_explode( v_pos, weapon )
{
    self endon( #"death" );
    
    if ( weapon == level.w_hand_gaia_upgraded )
    {
        n_dist = 62500;
    }
    else
    {
        n_dist = 40000;
    }
    
    self thread scene::play( "p8_fxanim_zm_red_gaia_spikes_bundle", "explode", self );
    wait 0.1;
    level notify( #"gaia_spike_exploded", { #v_origin:v_pos } );
    a_e_targets = function_3874b38f();
    
    foreach ( e_target in a_e_targets )
    {
        if ( isalive( e_target ) && !( isdefined( e_target.var_61768419 ) && e_target.var_61768419 ) && !( isdefined( e_target.var_5a3ebaa3 ) && e_target.var_5a3ebaa3 ) && !( isdefined( e_target.var_339655cf ) && e_target.var_339655cf ) && distancesquared( self.origin, e_target.origin ) <= n_dist && abs( self.origin[ 2 ] - e_target.origin[ 2 ] ) <= 20 )
        {
            e_target.var_61768419 = 1;
            
            if ( self function_1d315fcd( e_target ) )
            {
                v_dir = anglestoright( self.angles ) * randomintrange( 100, 150 ) + ( 0, 0, randomintrange( 50, 150 ) );
            }
            else
            {
                v_dir = anglestoright( self.angles ) * randomintrange( -150, -100 ) + ( 0, 0, randomintrange( 50, 150 ) );
            }
            
            self thread function_5bca6886( e_target, v_dir );
        }
    }
    
    wait 1.5;
    self delete();
}

// Namespace zm_weap_hand_gaia/zm_weap_hand_gaia
// Params 1
// Checksum 0x9c5aaddf, Offset: 0x2ef8
// Size: 0x4e
function function_1d315fcd( e_target )
{
    n_dot = self math::get_dot_right( e_target.origin );
    
    if ( n_dot > 0 )
    {
        return 1;
    }
    
    return 0;
}

// Namespace zm_weap_hand_gaia/zm_weap_hand_gaia
// Params 0
// Checksum 0xbaeee734, Offset: 0x2f50
// Size: 0xe8
function function_1e39fbc5()
{
    self endon( #"death", #"stop_beaming", #"weapon_change" );
    
    while ( zm_utility::is_player_valid( self ) && self attackbuttonpressed() && !self fragbuttonpressed() )
    {
        n_ammo = self getweaponammoclip( level.w_hand_gaia );
        
        if ( n_ammo )
        {
            n_ammo--;
        }
        
        self setweaponammoclip( level.w_hand_gaia, n_ammo );
        wait 0.5;
    }
}

// Namespace zm_weap_hand_gaia/zm_weap_hand_gaia
// Params 2
// Checksum 0x79596da9, Offset: 0x3040
// Size: 0xbc
function function_5bca6886( e_target, v_dir )
{
    self endon( #"death" );
    e_target endon( #"death" );
    player = self.owner;
    
    if ( isdefined( player ) )
    {
        if ( player.currentweapon == level.w_hand_gaia_upgraded )
        {
            n_damage = 8500;
        }
        else
        {
            n_damage = 5000;
        }
        
        player thread function_dced5aef( e_target, level.w_hand_gaia, n_damage, 1, v_dir );
    }
}

// Namespace zm_weap_hand_gaia/zm_weap_hand_gaia
// Params 4
// Checksum 0x77d437aa, Offset: 0x3108
// Size: 0x252
function function_85d88e17( e_target, b_charged, v_dir, n_damage )
{
    self endon( #"death" );
    e_target endon( #"death" );
    
    if ( zm_utility::is_magic_bullet_shield_enabled( e_target ) )
    {
        return;
    }
    
    e_target.var_61768419 = 1;
    [[ level.var_9295b8ef ]]->waitinqueue( e_target );
    w_weapon = level.w_hand_gaia_uncharged;
    
    if ( isdefined( b_charged ) && isdefined( v_dir ) )
    {
        e_target.marked_for_death = 1;
        w_weapon = level.w_hand_gaia;
        e_target zm_utility::function_ffc279( v_dir, self, undefined, w_weapon );
        wait randomfloatrange( 1.5, 2 );
        
        if ( isdefined( e_target ) )
        {
            gibserverutils::annihilate( e_target );
            n_damage = e_target.health + 999;
        }
    }
    
    if ( isalive( e_target ) )
    {
        e_target clientfield::increment( "" + #"gaia_impact_zombie" );
        waitframe( 1 );
        
        if ( n_damage >= e_target.health )
        {
            e_target.marked_for_death = 1;
        }
        
        if ( e_target.archetype === #"skeleton" )
        {
            e_target dodamage( n_damage, self.origin, self, undefined, "none", "MOD_UNKNOWN", 0, w_weapon );
        }
        else
        {
            e_target dodamage( n_damage, e_target.origin, self, undefined, "none", "MOD_UNKNOWN", 0, w_weapon );
        }
    }
    
    e_target.var_61768419 = 0;
}

// Namespace zm_weap_hand_gaia/zm_weap_hand_gaia
// Params 1
// Checksum 0xe042b549, Offset: 0x3368
// Size: 0x172
function gaia_slow( e_target )
{
    self endon( #"death" );
    e_target endon( #"death" );
    
    if ( isdefined( e_target.var_317b8f00 ) && e_target.var_317b8f00 )
    {
        return;
    }
    
    e_target.var_317b8f00 = 1;
    
    if ( !isdefined( e_target.zm_ai_category ) )
    {
        return;
    }
    
    switch ( e_target.zm_ai_category )
    {
        case #"popcorn":
        case #"basic":
        case #"enhanced":
            e_target thread namespace_9ff9f642::slowdown( #"gaia_slowdown_time" );
            break;
        case #"heavy":
            e_target thread namespace_9ff9f642::slowdown( #"hash_2b068d1172ea957" );
            break;
        case #"miniboss":
            e_target thread namespace_9ff9f642::slowdown( #"hash_315cdbcb170fa2c4" );
            break;
    }
    
    wait 3;
    e_target.var_317b8f00 = 0;
}

// Namespace zm_weap_hand_gaia/zm_weap_hand_gaia
// Params 0
// Checksum 0xb133641c, Offset: 0x34e8
// Size: 0x2a
function function_3874b38f()
{
    var_72714481 = getaiteamarray( "axis" );
    return var_72714481;
}

// Namespace zm_weap_hand_gaia/zm_weap_hand_gaia
// Params 1
// Checksum 0x1982001b, Offset: 0x3520
// Size: 0xb2
function function_5fc81f0a( e_target )
{
    if ( !isdefined( level.var_4cd68405 ) )
    {
        level.var_4cd68405 = [];
    }
    else if ( !isarray( level.var_4cd68405 ) )
    {
        level.var_4cd68405 = array( level.var_4cd68405 );
    }
    
    if ( !isinarray( level.var_4cd68405, e_target ) )
    {
        level.var_4cd68405[ level.var_4cd68405.size ] = e_target;
    }
}

// Namespace zm_weap_hand_gaia/zm_weap_hand_gaia
// Params 1
// Checksum 0x38692cbe, Offset: 0x35e0
// Size: 0x2c
function function_6d783edd( e_target )
{
    arrayremovevalue( level.var_4cd68405, e_target );
}

// Namespace zm_weap_hand_gaia/zm_weap_hand_gaia
// Params 0
// Checksum 0x2bf96529, Offset: 0x3618
// Size: 0xe
function function_3ebebb9c()
{
    return level.var_4cd68405;
}

// Namespace zm_weap_hand_gaia/zm_weap_hand_gaia
// Params 1
// Checksum 0x2a89f2c8, Offset: 0x3630
// Size: 0xb2
function function_25513188( e_target )
{
    if ( !isdefined( level.var_ff53a03a ) )
    {
        level.var_ff53a03a = [];
    }
    else if ( !isarray( level.var_ff53a03a ) )
    {
        level.var_ff53a03a = array( level.var_ff53a03a );
    }
    
    if ( !isinarray( level.var_ff53a03a, e_target ) )
    {
        level.var_ff53a03a[ level.var_ff53a03a.size ] = e_target;
    }
}

// Namespace zm_weap_hand_gaia/zm_weap_hand_gaia
// Params 1
// Checksum 0x69e9d00f, Offset: 0x36f0
// Size: 0x2c
function function_5760b289( e_target )
{
    arrayremovevalue( level.var_ff53a03a, e_target );
}

// Namespace zm_weap_hand_gaia/zm_weap_hand_gaia
// Params 0
// Checksum 0x4facf155, Offset: 0x3728
// Size: 0xe
function function_b9a3e6f9()
{
    return level.var_ff53a03a;
}

