#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\throttle_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\trials\zm_trial_restrict_loadout;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_hero_weapon;
#using scripts\zm_common\zm_loadout;
#using scripts\zm_common\zm_utility;

#namespace zm_weap_sword_pistol;

// Namespace zm_weap_sword_pistol/zm_weap_sword_pistol
// Params 0, eflags: 0x2
// Checksum 0x2714c444, Offset: 0x248
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zm_weap_sword_pistol", &__init__, undefined, undefined );
}

// Namespace zm_weap_sword_pistol/zm_weap_sword_pistol
// Params 0
// Checksum 0x1ac86b80, Offset: 0x290
// Size: 0x7dc
function __init__()
{
    clientfield::register( "actor", "" + #"sword_pistol_slice_right", 1, 1, "counter" );
    clientfield::register( "vehicle", "" + #"sword_pistol_slice_right", 1, 1, "counter" );
    clientfield::register( "actor", "" + #"sword_pistol_slice_left", 1, 1, "counter" );
    clientfield::register( "vehicle", "" + #"sword_pistol_slice_left", 1, 1, "counter" );
    clientfield::register( "scriptmover", "" + #"viper_bite_projectile", 1, 1, "int" );
    clientfield::register( "actor", "" + #"viper_bite_projectile_impact", 1, 1, "counter" );
    clientfield::register( "vehicle", "" + #"viper_bite_projectile_impact", 1, 1, "counter" );
    clientfield::register( "actor", "" + #"viper_bite_bitten_fx", 1, 1, "int" );
    clientfield::register( "actor", "" + #"dragon_roar_impact", 1, 1, "counter" );
    clientfield::register( "vehicle", "" + #"dragon_roar_impact", 1, 1, "counter" );
    clientfield::register( "scriptmover", "" + #"dragon_roar_explosion", 1, 1, "counter" );
    clientfield::register( "toplayer", "" + #"swordpistol_rumble", 1, 3, "counter" );
    level.hero_weapon[ #"sword_pistol" ][ 0 ] = getweapon( #"hero_sword_pistol_lv1" );
    level.hero_weapon[ #"sword_pistol" ][ 1 ] = getweapon( #"hero_sword_pistol_lv2" );
    level.hero_weapon[ #"sword_pistol" ][ 2 ] = getweapon( #"hero_sword_pistol_lv3" );
    zm_loadout::register_hero_weapon_for_level( "hero_sword_pistol_lv1" );
    zm_loadout::register_hero_weapon_for_level( "hero_sword_pistol_lv2" );
    zm_loadout::register_hero_weapon_for_level( "hero_sword_pistol_lv3" );
    
    if ( !isdefined( level.hero_weapon_stats ) )
    {
        level.hero_weapon_stats = [];
    }
    
    level.hero_weapon_stats[ #"sword_pistol" ] = [];
    level.hero_weapon_stats[ #"sword_pistol" ][ #"hash_6fba0e2bde88b416" ] = 38416;
    level.hero_weapon_stats[ #"sword_pistol" ][ #"hash_55062ef720314247" ] = 270;
    level.hero_weapon_stats[ #"sword_pistol" ][ #"hash_48e41904bfc0f47c" ] = 640;
    level.hero_weapon_stats[ #"sword_pistol" ][ #"hash_c2f67d595789176" ] = 1024;
    level.hero_weapon_stats[ #"sword_pistol" ][ #"hash_75b11282a283d609" ] = 80;
    level.hero_weapon_stats[ #"sword_pistol" ][ #"hash_ef5f7de16aa873d" ] = 0.25;
    level.hero_weapon_stats[ #"sword_pistol" ][ #"hash_c2f67d595789176" ] = 1024;
    level.hero_weapon_stats[ #"sword_pistol" ][ #"hash_4ef595c3dab3275e" ] = 10;
    level.hero_weapon_stats[ #"sword_pistol" ][ #"hash_1ec768b1d6fc1dc6" ] = 64;
    level.hero_weapon_stats[ #"sword_pistol" ][ #"hash_5fe5ad9db12d4c99" ] = 32;
    level.hero_weapon_stats[ #"sword_pistol" ][ #"hash_579056d441d637d" ] = 800;
    level.hero_weapon_stats[ #"sword_pistol" ][ #"hash_634b06c9d5064145" ] = 160;
    
    if ( !isdefined( level.var_396cf513 ) )
    {
        level.var_396cf513 = new throttle();
        [[ level.var_396cf513 ]]->initialize( 3, 0.1 );
    }
    
    callback::on_connect( &function_eca0c19d );
    callback::on_disconnect( &on_disconnect );
    callback::add_weapon_fired( level.hero_weapon[ #"sword_pistol" ][ 0 ].dualwieldweapon, &function_5922a7dc );
    callback::add_weapon_fired( level.hero_weapon[ #"sword_pistol" ][ 1 ].dualwieldweapon, &function_5922a7dc );
    callback::add_weapon_fired( level.hero_weapon[ #"sword_pistol" ][ 2 ].dualwieldweapon, &function_5922a7dc );
}

// Namespace zm_weap_sword_pistol/zm_weap_sword_pistol
// Params 0
// Checksum 0xf8ed92d9, Offset: 0xa78
// Size: 0x54
function on_disconnect()
{
    if ( isdefined( self.var_7c78b80e ) )
    {
        self.var_7c78b80e delete();
    }
    
    if ( isdefined( self.var_94a84ade ) )
    {
        self.var_94a84ade delete();
    }
}

// Namespace zm_weap_sword_pistol/zm_weap_sword_pistol
// Params 0, eflags: 0x4
// Checksum 0xb1c52eba, Offset: 0xad8
// Size: 0x340
function private function_eca0c19d()
{
    self endon( #"disconnect" );
    
    while ( true )
    {
        waitresult = self waittill( #"weapon_change" );
        wpn_cur = waitresult.weapon;
        wpn_prev = waitresult.last_weapon;
        
        if ( wpn_cur == level.hero_weapon[ #"sword_pistol" ][ 0 ] )
        {
            self thread swordpistol_rumble( 1 );
            
            if ( !self gamepadusedlast() )
            {
                self zm_hero_weapon::show_hint( wpn_cur, #"hash_6514f206d5d2c57f" );
            }
            else
            {
                self zm_hero_weapon::show_hint( wpn_cur, #"hash_211bb263a0e77c99" );
            }
            
            self thread function_6fe1307b( wpn_cur );
            self thread function_65c52c4c( wpn_cur );
            continue;
        }
        
        if ( wpn_cur == level.hero_weapon[ #"sword_pistol" ][ 1 ] )
        {
            self thread swordpistol_rumble( 1 );
            
            if ( !self gamepadusedlast() )
            {
                self zm_hero_weapon::show_hint( wpn_cur, #"hash_6514f206d5d2c57f" );
            }
            else
            {
                self zm_hero_weapon::show_hint( wpn_cur, #"hash_211bb263a0e77c99" );
            }
            
            self thread function_6fe1307b( wpn_cur );
            self thread function_65c52c4c( wpn_cur );
            continue;
        }
        
        if ( wpn_cur == level.hero_weapon[ #"sword_pistol" ][ 2 ] )
        {
            self thread swordpistol_rumble( 1 );
            
            if ( !self gamepadusedlast() )
            {
                self zm_hero_weapon::show_hint( wpn_cur, #"hash_2303e09b25647ced" );
            }
            else
            {
                self zm_hero_weapon::show_hint( wpn_cur, #"hash_289f1ec940a22d13" );
            }
            
            self thread function_6fe1307b( wpn_cur );
            self thread function_65c52c4c( wpn_cur );
            self thread function_be6cef79( wpn_cur );
            self thread function_68ff89f7( wpn_cur );
        }
    }
}

// Namespace zm_weap_sword_pistol/zm_weap_sword_pistol
// Params 1, eflags: 0x4
// Checksum 0x1105f838, Offset: 0xe20
// Size: 0xe8
function private function_6fe1307b( weapon )
{
    self endon( #"weapon_change", #"disconnect", #"bled_out" );
    
    while ( true )
    {
        if ( weapon == level.hero_weapon[ #"sword_pistol" ][ 2 ] )
        {
            self waittill( #"weapon_melee_power" );
        }
        else
        {
            self waittill( #"weapon_melee_power", #"weapon_melee" );
        }
        
        if ( !zm_trial_restrict_loadout::function_5fbf572( weapon, 1 ) )
        {
            continue;
        }
        
        weapon function_a9e0db86( self );
    }
}

// Namespace zm_weap_sword_pistol/zm_weap_sword_pistol
// Params 1, eflags: 0x4
// Checksum 0x239d9ffc, Offset: 0xf10
// Size: 0x8c
function private blood_death_fx( var_14ef0a6c )
{
    if ( self.archetype === #"zombie" )
    {
        if ( var_14ef0a6c )
        {
            self clientfield::increment( "" + #"sword_pistol_slice_left", 1 );
            return;
        }
        
        self clientfield::increment( "" + #"sword_pistol_slice_right", 1 );
    }
}

// Namespace zm_weap_sword_pistol/zm_weap_sword_pistol
// Params 3
// Checksum 0x6ab9c639, Offset: 0xfa8
// Size: 0x84
function function_fe3f086c( e_target, leftswing, weapon = level.weaponnone )
{
    if ( isactor( e_target ) )
    {
        self thread chop_actor( e_target, leftswing, weapon );
        return;
    }
    
    self thread function_5e2c9b64( e_target, leftswing, weapon );
}

// Namespace zm_weap_sword_pistol/zm_weap_sword_pistol
// Params 3
// Checksum 0xda4e5390, Offset: 0x1038
// Size: 0x24c
function chop_actor( ai, leftswing, weapon = level.weaponnone )
{
    self endon( #"weapon_change", #"disconnect", #"bled_out" );
    ai endon( #"death" );
    
    if ( !isdefined( ai.zm_ai_category ) )
    {
        return;
    }
    
    switch ( ai.zm_ai_category )
    {
        case #"popcorn":
        case #"basic":
        case #"enhanced":
            n_damage = ai.health;
            break;
        case #"heavy":
            n_damage = int( ai.maxhealth * 0.25 );
            break;
        case #"miniboss":
            n_damage = int( ai.maxhealth * 0.15 );
            break;
        default:
            n_damage = 2500;
            break;
    }
    
    if ( n_damage >= ai.health )
    {
        ai.ignoremelee = 1;
    }
    
    [[ level.var_396cf513 ]]->waitinqueue( ai );
    ai blood_death_fx( leftswing );
    
    if ( ai.health <= 0 )
    {
        ai.ignoremelee = 1;
    }
    
    util::wait_network_frame();
    self thread swordpistol_rumble( 3 );
    self thread function_7d2970bc( ai, weapon, n_damage );
}

// Namespace zm_weap_sword_pistol/zm_weap_sword_pistol
// Params 3
// Checksum 0xcc90b9e8, Offset: 0x1290
// Size: 0x7c
function function_5e2c9b64( e_target, leftswing, weapon = level.weaponnone )
{
    util::wait_network_frame();
    self thread swordpistol_rumble( 3 );
    self thread function_7d2970bc( e_target, weapon, 2500 );
}

// Namespace zm_weap_sword_pistol/zm_weap_sword_pistol
// Params 3
// Checksum 0xbe4d5989, Offset: 0x1318
// Size: 0x2ce
function function_787cd537( first_time, leftswing, weapon = level.weaponnone )
{
    self endon( #"disconnect" );
    var_2ed6f142 = self getweaponmuzzlepoint();
    var_16d329c7 = self getweaponforwarddir();
    a_e_targets = zm_hero_weapon::function_7c3681f7();
    a_e_targets = arraysortclosest( a_e_targets, self.origin );
    
    foreach ( e_target in a_e_targets )
    {
        if ( !isalive( e_target ) )
        {
            continue;
        }
        
        if ( first_time )
        {
            e_target.chopped = 0;
        }
        else if ( isdefined( e_target.chopped ) && e_target.chopped )
        {
            continue;
        }
        
        test_origin = e_target getcentroid();
        n_dist_sq = distancesquared( var_2ed6f142, test_origin );
        var_b1ef33ec = level.hero_weapon_stats[ #"sword_pistol" ][ #"hash_6fba0e2bde88b416" ];
        var_7efcfc36 = level.hero_weapon_stats[ #"sword_pistol" ][ #"hash_55062ef720314247" ];
        
        if ( n_dist_sq > var_b1ef33ec )
        {
            continue;
        }
        
        if ( 0 == e_target sightconetrace( var_2ed6f142, self, var_16d329c7, 270 ) )
        {
            continue;
        }
        
        e_target.chopped = 1;
        
        if ( isdefined( e_target.chop_actor_cb ) )
        {
            self thread [[ e_target.chop_actor_cb ]]( e_target, self, weapon );
        }
        else
        {
            self thread function_fe3f086c( e_target, leftswing, weapon );
        }
        
        waitframe( 1 );
    }
}

// Namespace zm_weap_sword_pistol/zm_weap_sword_pistol
// Params 1
// Checksum 0xa8f3465d, Offset: 0x15f0
// Size: 0x124
function function_a9e0db86( player )
{
    player thread function_787cd537( 1, 1, player.var_fd05e363 );
    wait 0.15;
    player thread function_787cd537( 0, 1, player.var_fd05e363 );
    
    if ( player.var_fd05e363 == level.hero_weapon[ #"sword_pistol" ][ 1 ] || player.var_fd05e363 == level.hero_weapon[ #"sword_pistol" ][ 2 ] )
    {
        wait 0.35;
        player thread function_787cd537( 1, 0, player.var_fd05e363 );
        wait 0.15;
        player thread function_787cd537( 0, 0, player.var_fd05e363 );
    }
    
    wait 0.1;
}

// Namespace zm_weap_sword_pistol/zm_weap_sword_pistol
// Params 3
// Checksum 0x5495d48e, Offset: 0x1720
// Size: 0x8c
function function_7d2970bc( e_target, weapon, n_damage )
{
    if ( isalive( e_target ) )
    {
        e_target thread zm_hero_weapon::function_acee2761();
        e_target dodamage( n_damage, e_target.origin, self, self, "none", "MOD_MELEE", 0, weapon );
    }
}

// Namespace zm_weap_sword_pistol/zm_weap_sword_pistol
// Params 1
// Checksum 0xf704042b, Offset: 0x17b8
// Size: 0x5c
function function_5922a7dc( weapon )
{
    if ( !zm_trial_restrict_loadout::function_5fbf572( weapon ) )
    {
        return;
    }
    
    self thread swordpistol_rumble( 4 );
    self function_698ddbd9( weapon );
}

// Namespace zm_weap_sword_pistol/zm_weap_sword_pistol
// Params 1
// Checksum 0x3ae8df8b, Offset: 0x1820
// Size: 0x5c
function function_65c52c4c( weapon )
{
    self givemaxammo( weapon.dualwieldweapon );
    self setweaponammoclip( weapon.dualwieldweapon, weapon.dualwieldweapon.clipsize );
}

// Namespace zm_weap_sword_pistol/zm_weap_sword_pistol
// Params 1, eflags: 0x4
// Checksum 0x88c6ad36, Offset: 0x1888
// Size: 0x1378
function private function_698ddbd9( weapon )
{
    level.hero_weapon_stats[ #"sword_pistol" ][ #"hash_5fe5ad9db12d4c99" ] = 32;
    level.hero_weapon_stats[ #"sword_pistol" ][ #"hash_579056d441d637d" ] = 800;
    level.hero_weapon_stats[ #"sword_pistol" ][ #"hash_634b06c9d5064145" ] = 160;
    v_source = self getorigin();
    
    for ( i = 0; i < level.hero_weapon[ #"sword_pistol" ].size ; i++ )
    {
        if ( weapon == level.hero_weapon[ #"sword_pistol" ][ i ].dualwieldweapon )
        {
            n_level = i;
            var_f5df740b = level.hero_weapon_stats[ #"sword_pistol" ][ #"hash_5fe5ad9db12d4c99" ];
            var_c05cba98 = level.hero_weapon_stats[ #"sword_pistol" ][ #"hash_579056d441d637d" ];
            weapon = level.hero_weapon[ #"sword_pistol" ][ i ];
            break;
        }
    }
    
    var_2ed6f142 = self getweaponmuzzlepoint();
    var_16d329c7 = self getweaponforwarddir();
    v_end_pos = var_2ed6f142 + vectorscale( var_16d329c7, var_c05cba98 );
    a_beamtrace = beamtrace( var_2ed6f142, v_end_pos, 0, self );
    var_26f49352 = var_f5df740b * var_f5df740b;
    var_2dfd6afd = distance( var_2ed6f142, a_beamtrace[ #"position" ] );
    var_825c6643 = var_2dfd6afd * var_2dfd6afd;
    var_2069eb4c = zm_hero_weapon::function_7c3681f7();
    var_2069eb4c = arraysortclosest( var_2069eb4c, var_2ed6f142, undefined, undefined, var_2dfd6afd );
    
    if ( isdefined( a_beamtrace[ #"entity" ] ) && a_beamtrace[ #"entity" ].zm_ai_category === #"inanimate" || isdefined( level.var_2c19331b ) && isinarray( level.var_2c19331b, a_beamtrace[ #"entity" ] ) )
    {
        a_beamtrace[ #"entity" ].b_is_valid_target = 1;
        
        if ( !isdefined( var_2069eb4c ) )
        {
            var_2069eb4c = [];
        }
        else if ( !isarray( var_2069eb4c ) )
        {
            var_2069eb4c = array( var_2069eb4c );
        }
        
        if ( !isinarray( var_2069eb4c, a_beamtrace[ #"entity" ] ) )
        {
            var_2069eb4c[ var_2069eb4c.size ] = a_beamtrace[ #"entity" ];
        }
    }
    
    if ( isdefined( level.var_2e32e0bb ) )
    {
        self thread function_5ff8ad0b( weapon, a_beamtrace[ #"position" ] );
    }
    
    if ( n_level == 0 && var_2069eb4c.size <= 0 )
    {
        return undefined;
    }
    
    var_d49a6eda = [];
    
    if ( !isdefined( var_d49a6eda ) )
    {
        var_d49a6eda = [];
    }
    else if ( !isarray( var_d49a6eda ) )
    {
        var_d49a6eda = array( var_d49a6eda );
    }
    
    var_d49a6eda[ var_d49a6eda.size ] = "j_head";
    
    if ( !isdefined( var_d49a6eda ) )
    {
        var_d49a6eda = [];
    }
    else if ( !isarray( var_d49a6eda ) )
    {
        var_d49a6eda = array( var_d49a6eda );
    }
    
    var_d49a6eda[ var_d49a6eda.size ] = "j_spine_4";
    
    if ( !isdefined( var_d49a6eda ) )
    {
        var_d49a6eda = [];
    }
    else if ( !isarray( var_d49a6eda ) )
    {
        var_d49a6eda = array( var_d49a6eda );
    }
    
    var_d49a6eda[ var_d49a6eda.size ] = "j_shoulder_le";
    
    if ( !isdefined( var_d49a6eda ) )
    {
        var_d49a6eda = [];
    }
    else if ( !isarray( var_d49a6eda ) )
    {
        var_d49a6eda = array( var_d49a6eda );
    }
    
    var_d49a6eda[ var_d49a6eda.size ] = "j_shoulder_ri";
    
    if ( !isdefined( var_d49a6eda ) )
    {
        var_d49a6eda = [];
    }
    else if ( !isarray( var_d49a6eda ) )
    {
        var_d49a6eda = array( var_d49a6eda );
    }
    
    var_d49a6eda[ var_d49a6eda.size ] = "j_elbow_le";
    
    if ( !isdefined( var_d49a6eda ) )
    {
        var_d49a6eda = [];
    }
    else if ( !isarray( var_d49a6eda ) )
    {
        var_d49a6eda = array( var_d49a6eda );
    }
    
    var_d49a6eda[ var_d49a6eda.size ] = "j_elbow_ri";
    
    if ( !isdefined( var_d49a6eda ) )
    {
        var_d49a6eda = [];
    }
    else if ( !isarray( var_d49a6eda ) )
    {
        var_d49a6eda = array( var_d49a6eda );
    }
    
    var_d49a6eda[ var_d49a6eda.size ] = "j_wrist_le";
    
    if ( !isdefined( var_d49a6eda ) )
    {
        var_d49a6eda = [];
    }
    else if ( !isarray( var_d49a6eda ) )
    {
        var_d49a6eda = array( var_d49a6eda );
    }
    
    var_d49a6eda[ var_d49a6eda.size ] = "j_wrist_ri";
    a_e_targets = [];
    
    for ( i = 0; i < var_2069eb4c.size ; i++ )
    {
        if ( !isalive( var_2069eb4c[ i ] ) )
        {
            continue;
        }
        
        if ( isactor( var_2069eb4c[ i ] ) || isdefined( level.var_2c19331b ) && isinarray( level.var_2c19331b, var_2069eb4c[ i ] ) )
        {
            v_target_location = var_2069eb4c[ i ] getcentroid();
            v_target_origin = var_2069eb4c[ i ] getorigin();
            var_4061b1b2 = distancesquared( var_2ed6f142, v_target_location );
            var_1dc736c5 = pointonsegmentnearesttopoint( var_2ed6f142, v_end_pos, v_target_origin );
            
            if ( var_4061b1b2 > var_825c6643 )
            {
                continue;
            }
            
            normal = vectornormalize( v_target_location - var_2ed6f142 );
            dot = vectordot( var_16d329c7, normal );
            
            if ( 0 > dot )
            {
                continue;
            }
            
            if ( distancesquared( v_target_location, var_1dc736c5 ) <= var_26f49352 || distancesquared( v_target_origin, var_1dc736c5 ) <= var_26f49352 )
            {
                var_2069eb4c[ i ].b_is_valid_target = 1;
            }
            else
            {
                foreach ( str_tag in var_d49a6eda )
                {
                    v_hitloc = var_2069eb4c[ i ] gettagorigin( str_tag );
                    
                    if ( isdefined( v_hitloc ) && distancesquared( v_hitloc, var_1dc736c5 ) <= var_26f49352 )
                    {
                        var_2069eb4c[ i ].b_is_valid_target = 1;
                        break;
                    }
                }
            }
        }
        
        if ( isdefined( var_2069eb4c[ i ].b_is_valid_target ) && var_2069eb4c[ i ].b_is_valid_target )
        {
            if ( !isdefined( a_e_targets ) )
            {
                a_e_targets = [];
            }
            else if ( !isarray( a_e_targets ) )
            {
                a_e_targets = array( a_e_targets );
            }
            
            a_e_targets[ a_e_targets.size ] = var_2069eb4c[ i ];
        }
    }
    
    if ( a_e_targets.size > 0 )
    {
        a_e_targets = array::remove_dead( a_e_targets );
        a_e_targets = arraysortclosest( a_e_targets, self.origin );
        
        foreach ( i, e_target in a_e_targets )
        {
            if ( !isalive( e_target ) || zm_utility::is_magic_bullet_shield_enabled( e_target ) )
            {
                continue;
            }
            
            if ( isdefined( e_target.var_69a981e6 ) && e_target.var_69a981e6 )
            {
                continue;
            }
            
            if ( isdefined( e_target.aat_turned ) && e_target.aat_turned )
            {
                continue;
            }
            
            if ( !isdefined( e_target.zm_ai_category ) )
            {
                continue;
            }
            
            switch ( e_target.zm_ai_category )
            {
                case #"popcorn":
                case #"basic":
                case #"enhanced":
                    n_damage = e_target.health;
                    break;
                case #"heavy":
                    n_damage = int( e_target.maxhealth * 0.2 );
                    break;
                case #"miniboss":
                    n_damage = int( e_target.maxhealth * 0.1 );
                    break;
                default:
                    n_damage = 2500;
                    break;
            }
            
            if ( isactor( e_target ) )
            {
                e_target clientfield::increment( "" + #"dragon_roar_impact" );
                
                if ( n_level > 0 && i == a_e_targets.size - 1 )
                {
                    var_fb504c3b = a_e_targets[ i ] getcentroid();
                    var_774fab40 = a_e_targets[ i ];
                }
                
                if ( n_damage >= e_target.health )
                {
                    e_target.ignoremelee = 1;
                }
                
                [[ level.var_396cf513 ]]->waitinqueue( e_target );
                e_target thread zm_hero_weapon::function_acee2761();
            }
            
            if ( isdefined( e_target ) )
            {
                origin = isdefined( self ) ? self.origin : e_target.origin;
                e_target dodamage( n_damage, origin, self, self, "none", "MOD_EXPLOSIVE", 0, weapon );
            }
            
            waitframe( 1 );
        }
    }
    else if ( n_level > 0 )
    {
        v_end = var_2ed6f142 + var_16d329c7 * sqrt( var_825c6643 );
        a_trace = bullettrace( var_2ed6f142, v_end, 0, self );
        var_a1db2464 = a_trace[ #"position" ];
        check1 = distance( var_2ed6f142, var_a1db2464 );
        check2 = distance( var_2ed6f142, v_end );
        
        if ( distancesquared( var_2ed6f142, var_a1db2464 ) < distancesquared( var_2ed6f142, v_end ) )
        {
            var_fb504c3b = var_a1db2464;
        }
        else
        {
            var_fb504c3b = v_end;
        }
    }
    
    if ( isdefined( var_fb504c3b ) )
    {
        if ( !isdefined( self.var_4ecb8a5c ) )
        {
            self.var_4ecb8a5c = spawn( "script_model", var_fb504c3b );
            util::wait_network_frame( 2 );
        }
        
        self.var_4ecb8a5c dontinterpolate();
        self.var_4ecb8a5c.origin = var_fb504c3b;
        self.var_4ecb8a5c clientfield::increment( "" + #"dragon_roar_explosion" );
        var_2069eb4c = zm_hero_weapon::function_7c3681f7();
        var_2069eb4c = arraysortclosest( var_2069eb4c, var_2ed6f142, undefined, undefined, level.hero_weapon_stats[ #"sword_pistol" ][ #"hash_634b06c9d5064145" ] );
        
        if ( isdefined( a_trace ) && isdefined( a_trace[ #"entity" ] ) && function_ffa5b184( a_trace[ #"entity" ].zm_ai_category === #"inanimate" ) )
        {
            if ( !isdefined( var_2069eb4c ) )
            {
                var_2069eb4c = [];
            }
            else if ( !isarray( var_2069eb4c ) )
            {
                var_2069eb4c = array( var_2069eb4c );
            }
            
            if ( !isinarray( var_2069eb4c, a_trace[ #"entity" ] ) )
            {
                var_2069eb4c[ var_2069eb4c.size ] = a_trace[ #"entity" ];
            }
        }
        
        foreach ( e_target in var_2069eb4c )
        {
            if ( !isdefined( e_target.zm_ai_category ) )
            {
                continue;
            }
            
            switch ( e_target.zm_ai_category )
            {
                case #"popcorn":
                case #"basic":
                case #"enhanced":
                    n_damage = e_target.health;
                    break;
                case #"heavy":
                    n_damage = int( e_target.maxhealth * 0.2 );
                    break;
                case #"miniboss":
                    n_damage = int( e_target.maxhealth * 0.1 );
                    break;
                default:
                    n_damage = 2500;
                    break;
            }
            
            if ( isactor( e_target ) )
            {
                if ( !isalive( e_target ) || zm_utility::is_magic_bullet_shield_enabled( e_target ) )
                {
                    continue;
                }
                
                if ( isdefined( e_target.var_69a981e6 ) && e_target.var_69a981e6 )
                {
                    continue;
                }
                
                if ( isdefined( e_target.aat_turned ) && e_target.aat_turned )
                {
                    continue;
                }
                
                e_target thread zm_hero_weapon::function_acee2761();
            }
            
            if ( isdefined( e_target ) )
            {
                origin = isdefined( self ) ? self.origin : e_target.origin;
                e_target dodamage( n_damage, origin, self, self, "none", "MOD_EXPLOSIVE", 0, weapon );
            }
        }
    }
}

// Namespace zm_weap_sword_pistol/zm_weap_sword_pistol
// Params 2
// Checksum 0x34d7fff1, Offset: 0x2c08
// Size: 0x110
function function_5ff8ad0b( weapon, var_fb504c3b )
{
    if ( !isdefined( var_fb504c3b ) )
    {
        return;
    }
    
    var_2ed6f142 = self getweaponmuzzlepoint();
    v_forward = self getweaponforwarddir();
    v_end = var_2ed6f142 + v_forward * 10000;
    a_trace = bullettrace( var_2ed6f142, v_end, 0, self );
    level notify( #"hero_weapon_hit", { #player:self, #e_entity:a_trace[ #"entity" ], #var_80e17549:weapon, #v_position:var_fb504c3b } );
}

// Namespace zm_weap_sword_pistol/zm_weap_sword_pistol
// Params 1, eflags: 0x4
// Checksum 0xfa28adce, Offset: 0x2d20
// Size: 0xb8
function private function_be6cef79( weapon )
{
    self endon( #"weapon_change", #"disconnect", #"bled_out" );
    self.var_61950f95 = undefined;
    
    while ( true )
    {
        self waittill( #"weapon_melee" );
        
        if ( !zm_trial_restrict_loadout::function_5fbf572( weapon ) )
        {
            continue;
        }
        
        if ( !( isdefined( self.var_61950f95 ) && self.var_61950f95 ) )
        {
            self function_e47a52e0( weapon );
        }
    }
}

// Namespace zm_weap_sword_pistol/zm_weap_sword_pistol
// Params 1, eflags: 0x4
// Checksum 0x1d86b11c, Offset: 0x2de0
// Size: 0x71a
function private function_e47a52e0( weapon )
{
    self endon( #"disconnect" );
    var_d52bf5d8 = level.hero_weapon_stats[ #"sword_pistol" ][ #"hash_48e41904bfc0f47c" ];
    var_17af1110 = level.hero_weapon_stats[ #"sword_pistol" ][ #"hash_75b11282a283d609" ];
    var_e70af44b = var_17af1110 * var_17af1110;
    var_f0ccd955 = level.hero_weapon_stats[ #"sword_pistol" ][ #"hash_ef5f7de16aa873d" ];
    n_move_speed = var_d52bf5d8 / var_f0ccd955;
    self.var_61950f95 = 1;
    
    if ( !isdefined( self.var_7c78b80e ) )
    {
        self.var_7c78b80e = util::spawn_model( "tag_origin", self getcentroid(), self getangles() );
    }
    else
    {
        self.var_7c78b80e.origin = self getorigin() + ( 0, 0, 48 );
    }
    
    v_pos = self getweaponmuzzlepoint();
    v_forward = self getweaponforwarddir();
    var_ea317f4d = v_pos + v_forward * var_d52bf5d8;
    var_ea317f4d = bullettrace( v_pos, var_ea317f4d, 0, undefined )[ #"position" ];
    var_3c23401c = self function_5c924730();
    
    if ( isdefined( var_3c23401c ) )
    {
        var_3c23401c.var_69a981e6 = 1;
        v_end = var_3c23401c getcentroid();
    }
    
    if ( !isdefined( v_end ) || isdefined( v_end ) && var_ea317f4d == v_end )
    {
        v_end = var_ea317f4d;
    }
    
    var_6ff1bf88 = distance( v_pos, v_end );
    n_time_travel = var_6ff1bf88 / n_move_speed;
    var_f0ccd955 = n_time_travel < 0.1 ? 0.1 : n_time_travel;
    self.var_7c78b80e moveto( v_end, var_f0ccd955 );
    self.var_7c78b80e clientfield::set( "" + #"viper_bite_projectile", 1 );
    self thread swordpistol_rumble( 5 );
    n_time_started = gettime() / 1000;
    n_time_elapsed = 0;
    level notify( #"viper_bite_projectile", { #player:self } );
    self notify( #"viper_bite_projectile" );
    
    while ( n_time_elapsed < var_f0ccd955 )
    {
        a_ai_targets = zm_hero_weapon::function_7c3681f7();
        a_ai_targets = util::get_array_of_closest( self.var_7c78b80e.origin, a_ai_targets, undefined, undefined, var_17af1110 );
        var_6c07d0f0 = arraycopy( a_ai_targets );
        
        foreach ( var_9af81396 in var_6c07d0f0 )
        {
            if ( isactor( var_9af81396 ) )
            {
                var_ca4c48f1 = var_9af81396 geteye();
            }
            else
            {
                var_ca4c48f1 = var_9af81396 getcentroid();
            }
            
            if ( !( isdefined( bullettracepassed( self.var_7c78b80e.origin, var_ca4c48f1, 0, self, var_9af81396 ) ) && bullettracepassed( self.var_7c78b80e.origin, var_ca4c48f1, 0, self, var_9af81396 ) ) )
            {
                arrayremovevalue( a_ai_targets, var_9af81396 );
            }
        }
        
        if ( a_ai_targets.size > 0 )
        {
            foreach ( ai_target in a_ai_targets )
            {
                if ( isdefined( ai_target ) )
                {
                    if ( isdefined( var_3c23401c ) && var_3c23401c == ai_target )
                    {
                        continue;
                    }
                    
                    v_target = ai_target getcentroid();
                    
                    if ( distancesquared( self.var_7c78b80e.origin, v_target ) <= var_e70af44b )
                    {
                        if ( isalive( ai_target ) )
                        {
                            self thread function_e29f395c( ai_target, weapon );
                        }
                    }
                }
            }
        }
        
        waitframe( 1 );
        n_time_current = gettime() / 1000;
        n_time_elapsed = n_time_current - n_time_started;
    }
    
    self.var_7c78b80e clientfield::set( "" + #"viper_bite_projectile", 0 );
    
    if ( isalive( var_3c23401c ) )
    {
        var_3c23401c thread function_72070f02( self, weapon );
        return;
    }
    
    self.var_61950f95 = undefined;
}

// Namespace zm_weap_sword_pistol/zm_weap_sword_pistol
// Params 0, eflags: 0x4
// Checksum 0xf9b3030d, Offset: 0x3508
// Size: 0x4c8
function private function_5c924730()
{
    v_source = self getorigin();
    var_b2dd8c4f = level.hero_weapon_stats[ #"sword_pistol" ][ #"hash_75b11282a283d609" ];
    var_9298ef1e = var_b2dd8c4f * var_b2dd8c4f;
    var_92916829 = level.hero_weapon_stats[ #"sword_pistol" ][ #"hash_48e41904bfc0f47c" ];
    var_5f63dfa7 = var_92916829 * var_92916829;
    var_2ed6f142 = self getweaponmuzzlepoint();
    var_16d329c7 = self getweaponforwarddir();
    v_end_pos = var_2ed6f142 + vectorscale( var_16d329c7, var_92916829 );
    a_ai_zombies = zm_hero_weapon::function_7c3681f7();
    a_ai_zombies = util::get_array_of_closest( var_2ed6f142, a_ai_zombies, undefined, undefined, var_92916829 );
    
    if ( !a_ai_zombies.size )
    {
        return undefined;
    }
    
    var_b4f95a7 = [];
    
    for ( i = 0; i < a_ai_zombies.size ; i++ )
    {
        if ( !isalive( a_ai_zombies[ i ] ) )
        {
            continue;
        }
        
        if ( isactor( a_ai_zombies[ i ] ) )
        {
            var_ca4c48f1 = a_ai_zombies[ i ] geteye();
        }
        else
        {
            var_ca4c48f1 = a_ai_zombies[ i ] getcentroid();
        }
        
        if ( !( isdefined( bullettracepassed( var_2ed6f142, var_ca4c48f1, 0, self, a_ai_zombies[ i ] ) ) && bullettracepassed( var_2ed6f142, var_ca4c48f1, 0, self, a_ai_zombies[ i ] ) ) )
        {
            continue;
        }
        
        if ( a_ai_zombies[ i ].archetype !== #"zombie" && ( !isdefined( level.var_2c19331b ) || !isinarray( level.var_2c19331b, a_ai_zombies[ i ] ) ) )
        {
            continue;
        }
        
        if ( isdefined( a_ai_zombies[ i ].var_69a981e6 ) && a_ai_zombies[ i ].var_69a981e6 )
        {
            continue;
        }
        
        if ( isdefined( a_ai_zombies[ i ].aat_turned ) && a_ai_zombies[ i ].aat_turned )
        {
            continue;
        }
        
        v_zombie_location = a_ai_zombies[ i ] getcentroid();
        normal = vectornormalize( v_zombie_location - var_2ed6f142 );
        dot = vectordot( var_16d329c7, normal );
        
        if ( 0 > dot )
        {
            continue;
        }
        
        var_4061b1b2 = distancesquared( var_2ed6f142, v_zombie_location );
        var_1dc736c5 = pointonsegmentnearesttopoint( var_2ed6f142, v_end_pos, v_zombie_location );
        
        if ( var_4061b1b2 > var_5f63dfa7 )
        {
            continue;
        }
        
        if ( distancesquared( v_zombie_location, var_1dc736c5 ) > var_9298ef1e )
        {
            continue;
        }
        
        if ( !isdefined( var_b4f95a7 ) )
        {
            var_b4f95a7 = [];
        }
        else if ( !isarray( var_b4f95a7 ) )
        {
            var_b4f95a7 = array( var_b4f95a7 );
        }
        
        var_b4f95a7[ var_b4f95a7.size ] = a_ai_zombies[ i ];
    }
    
    if ( var_b4f95a7.size <= 0 )
    {
        return undefined;
    }
    
    var_b4f95a7 = arraysortclosest( var_b4f95a7, v_source );
    return var_b4f95a7[ var_b4f95a7.size - 1 ];
}

// Namespace zm_weap_sword_pistol/zm_weap_sword_pistol
// Params 2, eflags: 0x4
// Checksum 0x2c99072d, Offset: 0x39d8
// Size: 0x124
function private function_e29f395c( e_zombie, weapon )
{
    if ( !isdefined( e_zombie.zm_ai_category ) )
    {
        return;
    }
    
    [[ level.var_396cf513 ]]->waitinqueue( e_zombie );
    
    if ( isalive( e_zombie ) )
    {
        switch ( e_zombie.zm_ai_category )
        {
            case #"popcorn":
            case #"basic":
            case #"enhanced":
                n_damage = e_zombie.health;
                break;
            default:
                n_damage = 1000;
                break;
        }
        
        e_zombie thread zm_hero_weapon::function_acee2761();
        e_zombie dodamage( n_damage, self.origin, self, self, "none", "MOD_PROJECTILE", 0, weapon );
    }
}

// Namespace zm_weap_sword_pistol/zm_weap_sword_pistol
// Params 2, eflags: 0x4
// Checksum 0x6602ded1, Offset: 0x3b08
// Size: 0x12c
function private function_72070f02( player, weapon )
{
    self thread function_3295542a( player, weapon );
    var_2290928d = level.hero_weapon_stats[ #"sword_pistol" ][ #"hash_c2f67d595789176" ];
    var_63609d3f = level.hero_weapon_stats[ #"sword_pistol" ][ #"hash_1ec768b1d6fc1dc6" ];
    var_894b77d3 = level.hero_weapon_stats[ #"sword_pistol" ][ #"hash_4ef595c3dab3275e" ];
    self zm_utility::create_zombie_point_of_interest( var_2290928d, var_63609d3f, 10000 );
    self zm_utility::create_zombie_point_of_interest_attractor_positions( var_894b77d3, undefined, 128 );
    self thread function_37106789( player, weapon );
}

// Namespace zm_weap_sword_pistol/zm_weap_sword_pistol
// Params 2
// Checksum 0x6e4b53c9, Offset: 0x3c40
// Size: 0x2cc
function function_37106789( player, weapon )
{
    self endon( #"death" );
    
    if ( !isdefined( self.zm_ai_category ) )
    {
        return;
    }
    
    n_time_started = gettime() / 1000;
    
    while ( true )
    {
        n_time_current = gettime() / 1000;
        n_time_elapsed = n_time_current - n_time_started;
        a_ai_potential_targets = getaiteamarray( level.zombie_team );
        a_ai_targets = arraysortclosest( a_ai_potential_targets, self.origin, undefined, undefined, 128 );
        
        foreach ( ai_target in a_ai_targets )
        {
            if ( !isalive( ai_target ) )
            {
                continue;
            }
            
            if ( isdefined( ai_target.aat_turned ) && ai_target.aat_turned )
            {
                continue;
            }
            
            if ( self !== ai_target )
            {
                ai_target thread function_571d2d19( player, weapon );
                waitframe( 1 );
            }
        }
        
        wait 0.25;
        
        if ( n_time_elapsed >= 5 )
        {
            break;
        }
    }
    
    self clientfield::increment( "" + #"viper_bite_projectile_impact" );
    self notify( #"hash_1404343e2a1a434c" );
    waitframe( 1 );
    
    switch ( self.zm_ai_category )
    {
        case #"popcorn":
        case #"basic":
        case #"enhanced":
            n_damage = self.health;
            break;
        default:
            n_damage = 1000;
            break;
    }
    
    self thread zm_hero_weapon::function_acee2761();
    self dodamage( n_damage, self.origin, player, player, "none", "MOD_PROJECTILE", 0, weapon );
}

// Namespace zm_weap_sword_pistol/zm_weap_sword_pistol
// Params 2
// Checksum 0x1843bd35, Offset: 0x3f18
// Size: 0xbc
function function_571d2d19( player, weapon )
{
    self endon( #"death" );
    
    if ( isalive( self ) )
    {
        self thread zm_hero_weapon::function_acee2761();
        self clientfield::increment( "" + #"viper_bite_projectile_impact" );
        waitframe( 1 );
        self dodamage( 1000, self.origin, player, undefined, "none", "MOD_PROJECTILE", 0, weapon );
    }
}

// Namespace zm_weap_sword_pistol/zm_weap_sword_pistol
// Params 2, eflags: 0x4
// Checksum 0x2fa63a07, Offset: 0x3fe0
// Size: 0x336
function private function_3295542a( player, weapon )
{
    var_344157ae = self getcentroid();
    self clientfield::set( "" + #"viper_bite_bitten_fx", 1 );
    
    if ( !isdefined( player.var_94a84ade ) )
    {
        player.var_94a84ade = util::spawn_model( "tag_origin", var_344157ae );
    }
    else
    {
        player.var_94a84ade.origin = var_344157ae;
    }
    
    self waittill( #"hash_1404343e2a1a434c", #"death" );
    
    if ( isdefined( self ) )
    {
        self clientfield::set( "" + #"viper_bite_bitten_fx", 0 );
        self.var_69a981e6 = undefined;
    }
    
    if ( isdefined( player ) )
    {
        player.var_61950f95 = undefined;
        a_ai_zombies = player getenemiesinradius( var_344157ae, 192 );
    }
    else
    {
        a_ai_zombies = getaiteamarray( level.zombie_team );
        a_ai_zombies = arraysortclosest( a_ai_zombies, var_344157ae, undefined, undefined, 192 );
    }
    
    if ( !a_ai_zombies.size )
    {
        return;
    }
    
    var_50495455 = 36864;
    
    foreach ( ai_zombie in a_ai_zombies )
    {
        if ( !isalive( ai_zombie ) )
        {
            continue;
        }
        
        if ( !isdefined( ai_zombie.zm_ai_category ) )
        {
            continue;
        }
        
        switch ( ai_zombie.zm_ai_category )
        {
            case #"popcorn":
            case #"basic":
            case #"enhanced":
                n_damage = ai_zombie.health;
                break;
            default:
                n_damage = 1000;
                break;
        }
        
        if ( ai_zombie.health <= n_damage )
        {
            ai_zombie.var_8c8102a5 = 1;
        }
        
        ai_zombie dodamage( n_damage, ai_zombie.origin, player, player, "none", "MOD_EXPLOSIVE", 0, weapon );
        waitframe( 1 );
    }
}

// Namespace zm_weap_sword_pistol/zm_weap_sword_pistol
// Params 1
// Checksum 0x23ed78ad, Offset: 0x4320
// Size: 0x162
function swordpistol_rumble( var_b2e05bae )
{
    self endon( #"death" );
    
    if ( var_b2e05bae )
    {
        waitframe( 1 );
        
        switch ( var_b2e05bae )
        {
            case 1:
                self playrumbleonentity( "zm_weap_special_activate_rumble" );
                break;
            case 2:
                self clientfield::increment_to_player( "" + #"swordpistol_rumble", 2 );
                break;
            case 3:
                self playrumbleonentity( "zm_weap_swordpistol_melee_hit_rumble" );
                break;
            case 4:
                self clientfield::increment_to_player( "" + #"swordpistol_rumble", 4 );
                break;
            case 5:
                self clientfield::increment_to_player( "" + #"swordpistol_rumble", 5 );
                break;
        }
    }
}

// Namespace zm_weap_sword_pistol/zm_weap_sword_pistol
// Params 1, eflags: 0x4
// Checksum 0x49ee1b29, Offset: 0x4490
// Size: 0xac
function private function_68ff89f7( w_swordpistol )
{
    self endon( #"weapon_change", #"disconnect", #"bled_out" );
    s_result = self waittill( #"weapon_melee" );
    
    if ( s_result.weapon === w_swordpistol )
    {
        self thread zm_audio::create_and_play_dialog( #"hero_level_3", #"sword_pistol" );
    }
}

