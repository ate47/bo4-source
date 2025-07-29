#using scripts\core_common\ai\systems\gib;
#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flagsys_shared;
#using scripts\core_common\laststand_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\perks;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\throttle_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\values_shared;
#using scripts\zm_common\zm;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_hero_weapon;
#using scripts\zm_common\zm_loadout;

#namespace zm_weap_katana;

// Namespace zm_weap_katana/zm_weap_katana
// Params 0, eflags: 0x2
// Checksum 0xbb1f02ee, Offset: 0x1b0
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zm_weap_katana", &__init__, undefined, undefined );
}

// Namespace zm_weap_katana/zm_weap_katana
// Params 0
// Checksum 0x21e82de6, Offset: 0x1f8
// Size: 0x2ec
function __init__()
{
    clientfield::register( "toplayer", "" + #"hero_katana_vigor_postfx", 1, 1, "counter" );
    clientfield::register( "allplayers", "" + #"katana_rush_postfx", 1, 1, "int" );
    clientfield::register( "allplayers", "" + #"katana_rush_sfx", 1, 1, "int" );
    level.hero_weapon[ #"katana" ][ 0 ] = getweapon( #"hero_katana_t8_lv1" );
    level.hero_weapon[ #"katana" ][ 1 ] = getweapon( #"hero_katana_t8_lv2" );
    level.hero_weapon[ #"katana" ][ 2 ] = getweapon( #"hero_katana_t8_lv3" );
    zm_loadout::register_hero_weapon_for_level( #"hero_katana_t8_lv1" );
    zm_loadout::register_hero_weapon_for_level( #"hero_katana_t8_lv2" );
    zm_loadout::register_hero_weapon_for_level( #"hero_katana_t8_lv3" );
    level.var_9ea358cc = 0;
    
    if ( !isdefined( level.var_3594d33a ) )
    {
        level.var_3594d33a = new throttle();
        [[ level.var_3594d33a ]]->initialize( 3, 0.1 );
    }
    
    callback::on_connect( &function_9a0f234b );
    zm::function_84d343d( #"hero_katana_t8_lv1", &function_4e81317c );
    zm::function_84d343d( #"hero_katana_t8_lv2", &function_4e81317c );
    zm::function_84d343d( #"hero_katana_t8_lv3", &function_4e81317c );
}

// Namespace zm_weap_katana/zm_weap_katana
// Params 2
// Checksum 0xab26931a, Offset: 0x4f0
// Size: 0xcc, Type: bool
function function_c740060f( weapon, var_e7c11b0c = 1 )
{
    if ( weapon == level.hero_weapon[ #"katana" ][ 2 ] )
    {
        return true;
    }
    
    if ( weapon == level.hero_weapon[ #"katana" ][ 1 ] && var_e7c11b0c < 3 )
    {
        return true;
    }
    
    if ( weapon == level.hero_weapon[ #"katana" ][ 0 ] && var_e7c11b0c < 2 )
    {
        return true;
    }
    
    return false;
}

// Namespace zm_weap_katana/zm_weap_katana
// Params 0, eflags: 0x4
// Checksum 0xbd0b59d, Offset: 0x5c8
// Size: 0x358
function private function_9a0f234b()
{
    self endon( #"disconnect" );
    self thread function_756560e3();
    
    while ( true )
    {
        waitresult = self waittill( #"weapon_change" );
        wpn_cur = waitresult.weapon;
        wpn_prev = waitresult.last_weapon;
        
        if ( isinarray( level.hero_weapon[ #"katana" ], wpn_cur ) )
        {
            self clientfield::increment_to_player( "" + #"hero_katana_vigor_postfx" );
            self function_c43691a9( 1 );
            self thread function_8d02f57b( wpn_cur );
        }
        else if ( isinarray( level.hero_weapon[ #"katana" ], wpn_prev ) )
        {
            self function_c43691a9( 0 );
            self notify( #"hero_katana_expired" );
            self.var_5605c31e = undefined;
        }
        
        if ( wpn_cur == level.hero_weapon[ #"katana" ][ 0 ] )
        {
            zm_hero_weapon::show_hint( wpn_cur, #"hash_648a5b1eedae58b9" );
            self thread function_9fdcf13f();
            continue;
        }
        
        if ( wpn_cur == level.hero_weapon[ #"katana" ][ 1 ] )
        {
            zm_hero_weapon::show_hint( wpn_cur, #"hash_52cddac894472d22" );
            self thread function_119af40d( wpn_cur );
            self thread function_478a4910( wpn_cur );
            self thread function_9fdcf13f();
            continue;
        }
        
        if ( wpn_cur == level.hero_weapon[ #"katana" ][ 2 ] )
        {
            if ( !self gamepadusedlast() )
            {
                self zm_hero_weapon::show_hint( wpn_cur, #"hash_4bf673fe684c7bcd" );
            }
            else
            {
                self zm_hero_weapon::show_hint( wpn_cur, #"hash_33116738f78d04b3" );
            }
            
            self thread function_119af40d( wpn_cur );
            self thread function_fcc26273( wpn_cur );
            self thread function_68ff89f7( wpn_cur );
            self thread function_9fdcf13f();
        }
    }
}

// Namespace zm_weap_katana/zm_weap_katana
// Params 0, eflags: 0x4
// Checksum 0xd1a537dc, Offset: 0x928
// Size: 0x8c
function private function_9fdcf13f()
{
    self endon( #"disconnect" );
    wait 1;
    callback::on_ai_damage( &function_af221ee1 );
    self waittill( #"death", #"hero_katana_expired" );
    callback::remove_on_ai_damage( &function_af221ee1 );
}

// Namespace zm_weap_katana/zm_weap_katana
// Params 0, eflags: 0x4
// Checksum 0xdeec1765, Offset: 0x9c0
// Size: 0xa0
function private function_756560e3()
{
    self endon( #"disconnect" );
    
    while ( true )
    {
        waitresult = self waittill( #"hero_weapon_give" );
        var_cad4df8e = waitresult.weapon;
        
        if ( function_c740060f( var_cad4df8e, 2 ) )
        {
            self clientfield::increment_to_player( "" + #"hero_katana_vigor_postfx" );
        }
    }
}

// Namespace zm_weap_katana/zm_weap_katana
// Params 12
// Checksum 0xd59e2353, Offset: 0xa68
// Size: 0x1c6
function function_4e81317c( einflictor, eattacker, idamage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype )
{
    if ( !isdefined( self.zm_ai_category ) )
    {
        return idamage;
    }
    
    if ( self.zm_ai_category == #"basic" || self.zm_ai_category == #"popcorn" || self.zm_ai_category == #"enhanced" )
    {
        return ( self.health + 100 );
    }
    else if ( self.zm_ai_category == #"heavy" || self.zm_ai_category == #"miniboss" || self.zm_ai_category == #"boss" )
    {
        switch ( self.zm_ai_category )
        {
            case #"heavy":
                return ( 0.2 * self.maxhealth );
            case #"miniboss":
                return ( 0.1 * self.maxhealth );
            case #"boss":
                return ( 0.05 * self.maxhealth );
        }
    }
    
    return idamage;
}

// Namespace zm_weap_katana/zm_weap_katana
// Params 1
// Checksum 0x2e0f1348, Offset: 0xc38
// Size: 0x44c
function function_af221ee1( s_params )
{
    if ( !isdefined( s_params.weapon ) )
    {
        return;
    }
    
    if ( isplayer( s_params.eattacker ) )
    {
        if ( function_c740060f( s_params.weapon, 1 ) )
        {
            if ( self.zm_ai_category == #"basic" || self.zm_ai_category == #"enhanced" )
            {
                if ( isdefined( level.no_gib_in_wolf_area ) && isdefined( self [[ level.no_gib_in_wolf_area ]]() ) && self [[ level.no_gib_in_wolf_area ]]() )
                {
                    var_bec5660f = 1;
                }
                
                if ( level.var_9ea358cc >= 6 )
                {
                    var_bec5660f = 1;
                }
                
                if ( isdefined( s_params.shitloc ) && self.archetype === #"zombie" )
                {
                    if ( !( isdefined( var_bec5660f ) && var_bec5660f ) )
                    {
                        if ( s_params.shitloc === "head" || s_params.shitloc === "helmet" )
                        {
                            self thread function_1475944a();
                            gibserverutils::gibhead( self );
                            self playsound( #"hash_762b44e67bc3761f" );
                        }
                        else if ( isdefined( s_params.vpoint ) )
                        {
                            self zombie_utility::derive_damage_refs( s_params.vpoint );
                            self playsound( #"hash_762b44e67bc3761f" );
                        }
                    }
                }
                
                waitframe( 1 );
                
                if ( isdefined( self ) && ( math::cointoss() || isdefined( self.missinglegs ) && self.missinglegs ) )
                {
                    if ( isdefined( s_params.vdir ) && self.health <= 0 && !( isdefined( var_bec5660f ) && var_bec5660f ) )
                    {
                        var_eb0d0f20 = 75 * vectornormalize( s_params.vdir );
                        var_eb0d0f20 = ( var_eb0d0f20[ 0 ], var_eb0d0f20[ 1 ], 20 );
                        self startragdoll();
                        self launchragdoll( var_eb0d0f20 );
                    }
                    else
                    {
                        self thread zombie_utility::setup_zombie_knockdown( s_params.eattacker.origin );
                    }
                }
                
                return;
            }
            
            if ( self.zm_ai_category == #"miniboss" )
            {
                if ( s_params.shitloc === "head" || s_params.shitloc === "helmet" && isdefined( self.hashelmet ) && self.hashelmet )
                {
                    if ( isdefined( self.helmethits && isdefined( self.var_905e4ce2 ) ) )
                    {
                        self.helmethits = self.var_905e4ce2;
                        waitframe( 1 );
                        
                        if ( isalive( self ) )
                        {
                            self dodamage( 1, self.origin, s_params.eattacker, s_params.eattacker, s_params.shitloc, s_params.smeansofdeath, 0, undefined );
                            self playsound( #"hash_762b44e67bc3761f" );
                        }
                    }
                }
            }
        }
    }
}

// Namespace zm_weap_katana/zm_weap_katana
// Params 0, eflags: 0x4
// Checksum 0xe7632743, Offset: 0x1090
// Size: 0x40
function private function_1475944a()
{
    level.var_9ea358cc++;
    self waittill( #"death", #"hero_katana_expired" );
    level.var_9ea358cc--;
}

// Namespace zm_weap_katana/zm_weap_katana
// Params 1
// Checksum 0xe891b482, Offset: 0x10d8
// Size: 0xf8
function function_8d02f57b( w_katana )
{
    self endon( #"disconnect", #"bled_out", #"death", #"hero_katana_expired" );
    
    while ( true )
    {
        if ( w_katana.name == #"hero_katana_t8_lv3" )
        {
            s_result = self waittill( #"weapon_melee_power" );
        }
        else
        {
            s_result = self waittill( #"weapon_melee_power", #"weapon_melee" );
        }
        
        if ( s_result.weapon == w_katana )
        {
            self thread function_269ad6a5( w_katana );
        }
    }
}

// Namespace zm_weap_katana/zm_weap_katana
// Params 1
// Checksum 0xa4e49c20, Offset: 0x11d8
// Size: 0x14e
function function_119af40d( w_katana )
{
    self endon( #"disconnect", #"bled_out", #"death", #"hero_katana_expired" );
    
    while ( true )
    {
        s_result = self waittill( #"weapon_melee_juke" );
        
        if ( s_result.weapon == w_katana )
        {
            self playsound( #"wpn_katana_dash" );
            self thread flagsys::set_for_time( 1, "katana_dash" );
            self.var_5605c31e = 1;
            self thread function_7903608c( w_katana );
            wait 1;
            self notify( #"hash_50c324a04c7e0b09" );
            self.var_5605c31e = undefined;
            
            while ( self adsbuttonpressed() )
            {
                wait 0.1;
            }
        }
        
        waitframe( 1 );
    }
}

// Namespace zm_weap_katana/zm_weap_katana
// Params 1
// Checksum 0x65cafc0d, Offset: 0x1330
// Size: 0x1fa
function function_7903608c( w_katana )
{
    self endon( #"disconnect", #"bled_out", #"death", #"hero_katana_expired", #"hash_50c324a04c7e0b09" );
    str_hitloc = "head";
    
    while ( true )
    {
        var_baf7d060 = getaiteamarray( level.zombie_team );
        var_a812a69b = self.origin + anglestoforward( self.angles ) * 40;
        a_ai_zombies = array::get_all_closest( var_a812a69b, var_baf7d060, undefined, undefined, 80 );
        
        foreach ( ai_zombie in a_ai_zombies )
        {
            if ( !isalive( ai_zombie ) || isdefined( ai_zombie.marked_for_death ) && ai_zombie.marked_for_death )
            {
                continue;
            }
            
            if ( !isdefined( ai_zombie.zm_ai_category ) )
            {
                continue;
            }
            
            if ( !( isdefined( ai_zombie.var_48a548c1 ) && ai_zombie.var_48a548c1 ) )
            {
                ai_zombie thread function_bbe55589( self, w_katana, str_hitloc );
            }
        }
        
        waitframe( 1 );
    }
}

// Namespace zm_weap_katana/zm_weap_katana
// Params 3, eflags: 0x4
// Checksum 0x4a9fc0a1, Offset: 0x1538
// Size: 0x25e
function private function_bbe55589( e_player, w_katana, str_hitloc )
{
    self endon( #"death" );
    n_base_damage = 50;
    
    if ( self.zm_ai_category == #"basic" || self.zm_ai_category == #"popcorn" || self.zm_ai_category == #"enhanced" )
    {
        self.var_48a548c1 = 1;
        [[ level.var_3594d33a ]]->waitinqueue( self );
        self dodamage( self.health + 100, e_player.origin, e_player, e_player, str_hitloc, "MOD_MELEE", 0, w_katana );
        self playsound( #"hash_762b44e67bc3761f" );
        return;
    }
    
    switch ( self.zm_ai_category )
    {
        case #"heavy":
            n_base_damage = 0.2 * self.maxhealth;
            break;
        case #"miniboss":
            n_base_damage = 0.1 * self.maxhealth;
            break;
        case #"boss":
            n_base_damage = 0.05 * self.maxhealth;
            break;
    }
    
    self.var_48a548c1 = 1;
    [[ level.var_3594d33a ]]->waitinqueue( self );
    n_damage = 750 < n_base_damage ? n_base_damage : 750;
    self dodamage( n_damage, e_player.origin, e_player, e_player, str_hitloc, "MOD_MELEE", 0, w_katana );
    self playsound( #"hash_762b44e67bc3761f" );
    self.var_48a548c1 = undefined;
}

// Namespace zm_weap_katana/zm_weap_katana
// Params 1
// Checksum 0x209bed92, Offset: 0x17a0
// Size: 0xa8
function function_fcc26273( w_katana )
{
    self endon( #"disconnect", #"bled_out", #"death", #"hero_katana_expired" );
    
    while ( true )
    {
        s_result = self waittill( #"weapon_melee" );
        
        if ( s_result.weapon == w_katana )
        {
            self thread function_bed1fd9f();
        }
    }
}

// Namespace zm_weap_katana/zm_weap_katana
// Params 0
// Checksum 0x800c48cc, Offset: 0x1850
// Size: 0x1fe
function function_bed1fd9f()
{
    self endon( #"disconnect" );
    self playsound( #"hash_58397a948dd38b37" );
    
    if ( isdefined( self.var_4e6b62c3 ) && self.var_4e6b62c3 )
    {
        self notify( #"hero_katana_rush_toggle" );
        return;
    }
    
    self val::set( #"hash_6b725a8367e0178a", "ignoreme" );
    self.var_4e6b62c3 = 1;
    self clientfield::set( "" + #"katana_rush_sfx", 1 );
    self clientfield::set( "" + #"katana_rush_postfx", 1 );
    waitresult = self waittill( #"hero_katana_expired", #"hero_katana_rush_toggle" );
    
    if ( waitresult._notify == #"hero_katana_expired" )
    {
        self playsound( #"hash_58397a948dd38b37" );
    }
    
    self clientfield::set( "" + #"katana_rush_sfx", 0 );
    self clientfield::set( "" + #"katana_rush_postfx", 0 );
    self val::reset( #"hash_6b725a8367e0178a", "ignoreme" );
    self.var_4e6b62c3 = undefined;
}

// Namespace zm_weap_katana/zm_weap_katana
// Params 1
// Checksum 0xe97ad582, Offset: 0x1a58
// Size: 0x11e
function function_269ad6a5( w_katana )
{
    self endon( #"disconnect", #"bled_out", #"death" );
    
    if ( isdefined( self.var_5605c31e ) )
    {
        return;
    }
    
    self.var_5605c31e = 0;
    var_f1149aba = 100;
    str_hitloc = array::random( array( "torso_lower", "left_arm_upper", "right_arm_upper", "left_leg_upper", "right_leg_upper" ) );
    waitframe( 4 );
    self thread function_8520d1c9( var_f1149aba, str_hitloc, w_katana );
    waitframe( 10 );
    self thread function_8520d1c9( var_f1149aba, str_hitloc, w_katana );
    wait 0.1;
    self.var_5605c31e = undefined;
}

// Namespace zm_weap_katana/zm_weap_katana
// Params 3
// Checksum 0x74177b9c, Offset: 0x1b80
// Size: 0x148
function function_8520d1c9( var_f1149aba, str_hitloc, w_katana )
{
    var_a812a69b = self.origin + anglestoforward( self.angles ) * var_f1149aba / 2;
    a_ai_zombies = array::get_all_closest( var_a812a69b, getaiteamarray( level.zombie_team ), undefined, undefined, var_f1149aba );
    
    foreach ( ai_zombie in a_ai_zombies )
    {
        if ( !isalive( ai_zombie ) || isdefined( ai_zombie.marked_for_death ) && ai_zombie.marked_for_death )
        {
            continue;
        }
        
        ai_zombie thread function_bbe55589( self, w_katana, str_hitloc );
    }
}

// Namespace zm_weap_katana/zm_weap_katana
// Params 1
// Checksum 0xbd52617, Offset: 0x1cd0
// Size: 0x1a
function function_c43691a9( var_2e56d8e5 )
{
    self.var_2e56d8e5 = var_2e56d8e5;
}

// Namespace zm_weap_katana/zm_weap_katana
// Params 1
// Checksum 0xb0b82d98, Offset: 0x1cf8
// Size: 0xd0
function function_478a4910( w_katana )
{
    self endon( #"disconnect", #"bled_out", #"death", #"hero_katana_expired" );
    
    while ( true )
    {
        s_result = self waittill( #"weapon_melee_juke" );
        
        if ( s_result.weapon == w_katana )
        {
            if ( 1 === zm_audio::create_and_play_dialog( #"hero_level_2", #"katana" ) )
            {
                break;
            }
        }
    }
}

// Namespace zm_weap_katana/zm_weap_katana
// Params 1
// Checksum 0x916ff1da, Offset: 0x1dd0
// Size: 0xd0
function function_68ff89f7( w_katana )
{
    self endon( #"disconnect", #"bled_out", #"death", #"hero_katana_expired" );
    
    while ( true )
    {
        s_result = self waittill( #"weapon_melee" );
        
        if ( s_result.weapon == w_katana )
        {
            if ( 1 === zm_audio::create_and_play_dialog( #"hero_level_3", #"katana" ) )
            {
                break;
            }
        }
    }
}

