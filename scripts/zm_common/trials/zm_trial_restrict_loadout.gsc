#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\gameobjects_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\zm_common\trials\zm_trial_disable_hero_weapons;
#using scripts\zm_common\zm_equipment;
#using scripts\zm_common\zm_loadout;
#using scripts\zm_common\zm_traps;
#using scripts\zm_common\zm_trial;
#using scripts\zm_common\zm_trial_util;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_weapons;

#namespace zm_trial_restrict_loadout;

// Namespace zm_trial_restrict_loadout/zm_trial_restrict_loadout
// Params 0, eflags: 0x2
// Checksum 0x35cf742e, Offset: 0x420
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zm_trial_restrict_loadout", &__init__, undefined, undefined );
}

// Namespace zm_trial_restrict_loadout/zm_trial_restrict_loadout
// Params 0
// Checksum 0xd226e7c, Offset: 0x468
// Size: 0x5c
function __init__()
{
    if ( !zm_trial::is_trial_mode() )
    {
        return;
    }
    
    zm_trial::register_challenge( #"restrict_loadout", &on_begin, &on_end );
}

// Namespace zm_trial_restrict_loadout/zm_trial_restrict_loadout
// Params 1, eflags: 0x4
// Checksum 0x4acf442, Offset: 0x4d0
// Size: 0x25e, Type: bool
function private function_d805557c( weapon )
{
    assert( weapon != level.weaponnone );
    
    if ( zm_loadout::function_2ff6913( weapon ) )
    {
        return true;
    }
    
    challenge = zm_trial::function_a36e8c38( #"restrict_loadout" );
    
    if ( challenge.var_e097dc07 === #"melee" && is_ballistic_knife( weapon ) )
    {
        return false;
    }
    
    if ( weapon.isaltmode )
    {
        str_weapon_name = weapon.altweapon.name;
    }
    else
    {
        str_weapon_name = weapon.name;
        w_root = self zm_weapons::function_93cd8e76( weapon );
        var_19010660 = w_root.name;
    }
    
    if ( isdefined( level.var_526d919[ str_weapon_name ] ) || isdefined( var_19010660 ) && isdefined( level.var_526d919[ var_19010660 ] ) )
    {
        return true;
    }
    
    var_876795bf = weapon.attachments;
    
    if ( isdefined( level.var_4400c4f7 ) && level.var_4400c4f7 )
    {
        if ( isarray( var_876795bf ) )
        {
            foreach ( var_96bc131f in var_876795bf )
            {
                if ( var_96bc131f != "clantag" && var_96bc131f != "killcounter" && var_96bc131f != "custom2" )
                {
                    return false;
                }
            }
        }
        
        return true;
    }
    
    return false;
}

// Namespace zm_trial_restrict_loadout/zm_trial_restrict_loadout
// Params 1, eflags: 0x4
// Checksum 0x1227e7d, Offset: 0x738
// Size: 0xaa, Type: bool
function private is_ballistic_knife( weapon )
{
    if ( weapon == getweapon( #"special_ballisticknife_t8_dw" ) || weapon == getweapon( #"special_ballisticknife_t8_dw_upgraded" ) || weapon == getweapon( "special_ballisticknife_t8_dw_dw" ) || weapon == getweapon( "special_ballisticknife_t8_dw_upgraded_dw" ) )
    {
        return true;
    }
    
    return false;
}

// Namespace zm_trial_restrict_loadout/zm_trial_restrict_loadout
// Params 1, eflags: 0x4
// Checksum 0x181beb3d, Offset: 0x7f0
// Size: 0x18e, Type: bool
function private is_melee_allowed( weapon )
{
    challenge = zm_trial::function_a36e8c38( #"restrict_loadout" );
    
    if ( challenge.var_e097dc07 == #"melee" )
    {
        return true;
    }
    
    if ( ( challenge.var_e097dc07 == "any_pistol" || challenge.var_e097dc07 == #"hash_7416cabf26f52c5f" ) && isdefined( weapon.isriotshield ) && weapon.isriotshield && weapon.weapclass == "pistol" )
    {
        return false;
    }
    
    if ( isdefined( challenge ) && challenge.var_e097dc07 != #"melee" )
    {
        return self function_d805557c( weapon );
    }
    
    if ( self function_d805557c( weapon ) )
    {
        return true;
    }
    
    assert( weapon != level.weaponnone );
    
    if ( zm_weapons::function_35746b9c( weapon ) )
    {
        return true;
    }
    
    return false;
}

// Namespace zm_trial_restrict_loadout/zm_trial_restrict_loadout
// Params 0, eflags: 0x4
// Checksum 0x47eb4ef1, Offset: 0x988
// Size: 0xf0
function private function_6a8979c9()
{
    assert( isdefined( level.var_526d919 ) );
    
    foreach ( weapon in self getweaponslist( 1 ) )
    {
        self function_e14e7b75( weapon );
        
        if ( weapon.isdualwield && weapon.dualwieldweapon != level.weaponnone )
        {
            self function_e14e7b75( weapon.dualwieldweapon );
        }
    }
}

// Namespace zm_trial_restrict_loadout/zm_trial_restrict_loadout
// Params 1, eflags: 0x4
// Checksum 0xfed9e52f, Offset: 0xa80
// Size: 0x15c
function private function_e14e7b75( weapon )
{
    var_9caacad5 = !function_d805557c( weapon );
    var_b3340a9 = !is_melee_allowed( weapon );
    
    if ( var_9caacad5 || var_b3340a9 )
    {
        if ( isdefined( weapon.isburstfire ) && weapon.isburstfire && self getcurrentweapon() == weapon )
        {
            while ( self isfiring() )
            {
                waitframe( 1 );
            }
        }
        
        self lockweapon( weapon, var_9caacad5, var_b3340a9 );
        
        if ( zm_loadout::is_lethal_grenade( weapon ) )
        {
            self zm_trial_util::function_88805385( 1 );
        }
    }
    
    if ( isdefined( weapon.isheroweapon ) && weapon.isheroweapon && var_9caacad5 && var_b3340a9 )
    {
        self zm_trial_util::function_9bf8e274();
    }
}

// Namespace zm_trial_restrict_loadout/zm_trial_restrict_loadout
// Params 1, eflags: 0x4
// Checksum 0xb3757176, Offset: 0xbe8
// Size: 0x274
function private function_10c80e10( eventstruct )
{
    if ( self function_f3fdd8f7() )
    {
        foreach ( weapon in self getweaponslist( 1 ) )
        {
            if ( isdefined( level.var_526d919[ weapon.name ] ) )
            {
                self unlockweapon( weapon );
            }
        }
        
        level zm_trial::function_cd75b690( 0 );
        return;
    }
    
    foreach ( weapon in self getweaponslist( 1 ) )
    {
        can_lock = 1;
        
        if ( isdefined( level.var_ddff6359 ) )
        {
            foreach ( w_perk in level.var_ddff6359 )
            {
                if ( w_perk == weapon )
                {
                    can_lock = 0;
                    break;
                }
            }
        }
        
        if ( can_lock )
        {
            self lockweapon( weapon, 1, 0 );
            
            if ( weapon.dualwieldweapon != level.weaponnone )
            {
                self lockweapon( weapon.dualwieldweapon, 1, 0 );
            }
        }
    }
    
    level zm_trial::function_cd75b690( 1 );
}

// Namespace zm_trial_restrict_loadout/zm_trial_restrict_loadout
// Params 1, eflags: 0x4
// Checksum 0xaa5c0ee8, Offset: 0xe68
// Size: 0x24
function private function_33f0ddd3( eventstruct )
{
    self thread function_6a8979c9();
}

// Namespace zm_trial_restrict_loadout/zm_trial_restrict_loadout
// Params 0, eflags: 0x4
// Checksum 0xc5937a0a, Offset: 0xe98
// Size: 0xb6
function private function_f66032dd()
{
    if ( isdefined( self._gadgets_player ) )
    {
        for ( i = 0; i < 3 ; i++ )
        {
            if ( isdefined( self._gadgets_player[ i ] ) && self hasweapon( self._gadgets_player[ i ] ) && function_d805557c( self._gadgets_player[ i ] ) )
            {
                self gadgetpowerset( i, self._gadgets_player[ i ].gadget_powermax );
            }
        }
    }
}

// Namespace zm_trial_restrict_loadout/zm_trial_restrict_loadout
// Params 2, eflags: 0x4
// Checksum 0x19d020b0, Offset: 0xf58
// Size: 0x1778
function private on_begin( var_e097dc07, var_f5300808 )
{
    if ( isdefined( var_f5300808 ) )
    {
        var_f5300808 = zm_trial::function_5769f26a( var_f5300808 );
    }
    
    self.var_e097dc07 = var_e097dc07;
    var_e7beaa5 = [];
    
    switch ( var_e097dc07 )
    {
        case #"equipment":
            var_e7beaa5 = array( #"eq_acid_bomb", #"eq_acid_bomb_extra", #"homunculus", #"tomahawk_t8", #"tomahawk_t8_upgraded", #"claymore", #"claymore_extra", #"eq_molotov", #"eq_molotov_extra", #"eq_frag_grenade", #"eq_frag_grenade_extra", #"eq_wraith_fire", #"eq_wraith_fire_extra", #"mini_turret", #"proximity_grenade", #"sticky_grenade", #"sticky_grenade_extra" );
            level zm_trial::function_8e2a923( 1 );
            level zm_trial::function_44200d07( 1 );
            break;
        case #"melee":
            var_e7beaa5 = zm_weapons::function_ed29dde5( "melee", 0, 1 );
            level zm_trial::function_cdcce681( 1 );
            break;
        case #"bowie_knife":
            var_e7beaa5 = array( #"bowie_knife", #"bowie_knife_story_1", #"bowie_knife_widows_wine" );
            var_fda63ae3[ 0 ] = struct::get( "bowie_knife", "zombie_weapon_upgrade" ).origin;
            level zm_trial::function_25ee130( 1 );
            break;
        case #"leveraction":
            var_e7beaa5 = array( #"tr_leveraction_t8", #"tr_leveraction_t8_upgraded" );
            objective_struct = struct::get( "tr_leveraction_t8", "zombie_weapon_upgrade" );
            var_fda63ae3 = objective_struct.origin;
            level zm_trial::function_25ee130( 1 );
            break;
        case #"longburst":
            var_e7beaa5 = array( #"tr_longburst_t8", #"tr_longburst_t8_upgraded" );
            objective_struct = struct::get( "tr_longburst_t8", "zombie_weapon_upgrade" );
            var_fda63ae3 = objective_struct.origin;
            level zm_trial::function_25ee130( 1 );
            break;
        case #"hash_33380540d3ae5004":
            var_e7beaa5 = array( #"shotgun_pump_t8", #"shotgun_pump_t8_upgraded" );
            level zm_trial::function_25ee130( 1 );
            objective_struct = struct::get( "shotgun_pump_t8", "zombie_weapon_upgrade" );
            var_fda63ae3 = objective_struct.origin;
            break;
        case #"burst_pistol":
            var_e7beaa5 = array( #"pistol_burst_t8", #"pistol_burst_t8_upgraded" );
            objective_struct = struct::get( "pistol_burst_t8", "zombie_weapon_upgrade" );
            var_fda63ae3 = objective_struct.origin;
            level zm_trial::function_25ee130( 1 );
            break;
        case #"any_pistol":
            var_e7beaa5 = zm_weapons::function_ed29dde5( "pistol", 1, 1 );
            var_fda63ae3 = function_f1dd7bf8( array( "pistol_standard_t8", "pistol_burst_t8", "pistol_revolver_t8" ) );
            level zm_trial::function_25ee130( 1 );
            break;
        case #"hash_7416cabf26f52c5f":
            var_e7beaa5 = zm_weapons::function_ed29dde5( "pistol", 0, 1 );
            var_e7beaa5 = arraycombine( var_e7beaa5, array( #"ww_random_ray_gun1", #"ww_random_ray_gun2", #"ww_random_ray_gun2_charged", #"ww_random_ray_gun3", #"ww_random_ray_gun3_charged", #"ray_gun" ), 0, 0 );
            var_fda63ae3 = function_f1dd7bf8( array( "pistol_standard_t8", "pistol_burst_t8", "pistol_revolver_t8" ) );
            level zm_trial::function_25ee130( 1 );
            break;
        case #"hash_14468aadde60f9e1":
            var_e7beaa5 = zm_weapons::function_ed29dde5( "smg", 0, 1 );
            var_fda63ae3 = function_f1dd7bf8( array( "smg_fastfire_t8", "smg_handling_t8", "smg_drum_pistol_t8", "smg_standard_t8", "smg_accurate_t8" ) );
            level zm_trial::function_25ee130( 1 );
            break;
        case #"hash_2d7ec445ba288abf":
            var_e7beaa5 = zm_weapons::function_ed29dde5( "ar", 0, 1 );
            var_fda63ae3 = function_f1dd7bf8( array( "ar_accurate_t8", "ar_damage_t8", "ar_fastfire_t8", "ar_galil_t8", "ar_mg1909_t8", "ar_modular_t8", "ar_standard_t8", "ar_stealth_t8" ) );
            level zm_trial::function_25ee130( 1 );
            break;
        case #"hash_44dcc4dbf2ce47de":
            var_e7beaa5 = zm_weapons::function_ed29dde5( "tr", 0, 1 );
            var_fda63ae3 = function_f1dd7bf8( array( "tr_leveraction_t8", "tr_powersemi_t8", "tr_longburst_t8" ) );
            level zm_trial::function_25ee130( 1 );
            break;
        case #"hash_1dd9431fbe7472b7":
            var_e7beaa5 = zm_weapons::function_ed29dde5( "sniper", 0, 1 );
            var_e7beaa5 = arraycombine( var_e7beaa5, array( #"ww_tesla_sniper_t8" ), 0, 0 );
            var_fda63ae3 = function_f1dd7bf8( array( "sniper_quickscope_t8", "sniper_fastrechamber_t8", "sniper_powerbolt_t8", "sniper_powersemi_t8" ) );
            level zm_trial::function_25ee130( 1 );
            break;
        case #"hash_54d4bc51239254b8":
            var_e7beaa5 = zm_weapons::function_ed29dde5( "lmg", 0, 1 );
            var_fda63ae3 = function_f1dd7bf8( array( "lmg_double_t8", "lmg_heavy_t8", "lmg_spray_t8", "lmg_standard_t8" ) );
            level zm_trial::function_25ee130( 1 );
            break;
        case #"hash_706c2575a1c4f65e":
            var_e7beaa5 = zm_weapons::function_ed29dde5( "shotgun", 0, 1 );
            var_fda63ae3 = function_f1dd7bf8( array( "shotgun_pump_t8", "shotgun_trenchgun_t8" ) );
            level zm_trial::function_25ee130( 1 );
            break;
        case #"stake_knife":
            var_e7beaa5 = array( #"stake_knife", #"zhield_dw", #"knife", #"bowie_knife" );
            level zm_trial::function_25ee130( 1 );
            break;
        case #"galvaknuckles":
            var_e7beaa5 = array( #"galvaknuckles_t8" );
            var_fda63ae3 = function_f1dd7bf8( array( "galvaknuckles_t8" ) );
            level zm_trial::function_25ee130( 1 );
            break;
        case #"special":
            var_e7beaa5 = array( #"hero_chakram_lv1", #"hero_chakram_lv2", #"hero_chakram_lv3", #"hero_chakram_lh_lv1", #"hero_chakram_lh_lv2", #"hero_chakram_lh_lv3", #"hero_hammer_lv1", #"hero_hammer_lv2", #"hero_hammer_lv3", #"hero_scepter_lv1", #"hero_scepter_lv2", #"hero_scepter_lv3", #"hero_sword_pistol_lv1", #"hero_sword_pistol_lv2", #"hero_sword_pistol_lv3", #"hero_sword_pistol_lh_lv1", #"hero_sword_pistol_lh_lv2", #"hero_sword_pistol_lh_lv3", #"hero_flamethrower_t8_lv1", #"hero_flamethrower_t8_lv2", #"hero_flamethrower_t8_lv3", #"hero_gravityspikes_t8_lv1", #"hero_gravityspikes_t8_lv2", #"hero_gravityspikes_t8_lv3", #"hero_katana_t8_lv1", #"hero_katana_t8_lv2", #"hero_katana_t8_lv3", #"hero_minigun_t8_lv1", #"hero_minigun_t8_lv2", #"hero_minigun_t8_lv3" );
            level.b_special_weapons = 1;
            level zm_trial::function_cdcce681( 1 );
            break;
        case #"shield":
            var_e7beaa5 = array( #"zhield_zword_dw", #"zhield_zword_dw_upgraded", #"zhield_zword_lh", #"zhield_zword_lh_upgraded", #"zhield_zword_turret", #"zhield_zword_turret_upgraded" );
            level zm_trial::function_25ee130( 1 );
            break;
        case #"sniper_powersemi":
            var_e7beaa5 = array( #"sniper_powersemi_t8" );
            objective_struct = struct::get( "sniper_powersemi_t8", "zombie_weapon_upgrade" );
            
            if ( isdefined( objective_struct ) )
            {
                var_fda63ae3 = objective_struct.origin;
            }
            
            level zm_trial::function_25ee130( 1 );
            break;
        case #"spoon":
            var_e7beaa5 = array( #"spoon_alcatraz", #"spork_alcatraz", #"zhield_spectral_dw", #"zhield_spectral_lh", #"zhield_spectral_lh_upgraded", #"zhield_spectral_dw_upgraded", #"zhield_spectral_turret", #"zhield_spectral_turret_upgraded", "tomahawk_t8", "tomahawk_t8_upgraded" );
            level zm_trial::function_8e2a923( 1 );
            level zm_trial::function_44200d07( 1 );
            break;
        case #"spear_only":
            var_e7beaa5 = array( #"zhield_zpear_dw", #"zhield_zpear_turret", #"zhield_zpear_lh" );
            level zm_trial::function_8e2a923( 1 );
            level zm_trial::function_44200d07( 1 );
            level zm_trial::function_cd75b690( 1 );
            break;
        case #"mozu":
            var_e7beaa5 = array( #"pistol_revolver_t8", #"pistol_revolver_t8_upgraded" );
            objective_struct = struct::get( "pistol_revolver_t8", "zombie_weapon_upgrade" );
            
            if ( isdefined( objective_struct ) )
            {
                var_fda63ae3 = objective_struct.origin;
            }
            
            level zm_trial::function_25ee130( 1 );
            break;
        case #"tommy_gun":
            var_e7beaa5 = array( #"smg_thompson_t8", #"smg_thompson_t8_upgraded" );
            objective_struct = struct::get( "smg_thompson_t8", "zombie_weapon_upgrade" );
            
            if ( isdefined( objective_struct ) )
            {
                var_fda63ae3 = objective_struct.origin;
            }
            
            level zm_trial::function_25ee130( 1 );
            break;
        case #"no_attachments":
            level.var_4400c4f7 = 1;
            level.b_special_weapons = 1;
            break;
        case #"snowballs":
            var_e7beaa5 = array( #"snowball", #"snowball_upgraded", #"snowball_yellow", #"snowball_yellow_upgraded" );
            level zm_trial::function_8e2a923( 1 );
            level zm_trial::function_44200d07( 1 );
            break;
        default:
            assert( 0, "<dev string:x38>" + var_e097dc07 );
            break;
    }
    
    level.var_526d919 = [];
    
    foreach ( name in var_e7beaa5 )
    {
        weapon = getweapon( name );
        
        if ( isdefined( weapon ) && weapon != level.weaponnone )
        {
            level.var_526d919[ name ] = weapon;
        }
    }
    
    foreach ( player in getplayers() )
    {
        if ( var_e097dc07 === #"spear_only" )
        {
            player allowmelee( 0 );
        }
        
        player thread function_f0e03d3( var_f5300808 );
        
        if ( var_e097dc07 == #"snowballs" )
        {
            if ( !player function_f3fdd8f7() )
            {
                level zm_trial::function_cd75b690( 1 );
            }
            
            player enableoffhandweapons();
            callback::function_33f0ddd3( &function_10c80e10 );
        }
    }
    
    callback::function_33f0ddd3( &function_33f0ddd3 );
    callback::on_weapon_change( &zm_trial_util::function_79518194 );
    zm_traps::function_6966417b();
    self function_e20ebcfd();
    
    if ( isdefined( var_fda63ae3 ) )
    {
        if ( !isdefined( var_fda63ae3 ) )
        {
            var_fda63ae3 = [];
        }
        else if ( !isarray( var_fda63ae3 ) )
        {
            var_fda63ae3 = array( var_fda63ae3 );
        }
        
        foreach ( var_6bb4a364 in var_fda63ae3 )
        {
            n_obj_id = gameobjects::get_next_obj_id();
            
            if ( !isdefined( self.a_n_objective_ids ) )
            {
                self.a_n_objective_ids = [];
            }
            else if ( !isarray( self.a_n_objective_ids ) )
            {
                self.a_n_objective_ids = array( self.a_n_objective_ids );
            }
            
            self.a_n_objective_ids[ self.a_n_objective_ids.size ] = n_obj_id;
            objective_add( n_obj_id, "active", var_6bb4a364, #"hash_423a75e2700a53ab" );
            function_da7940a3( n_obj_id, 1 );
        }
        
        foreach ( player in getplayers() )
        {
            player thread monitor_objective( self );
        }
    }
}

// Namespace zm_trial_restrict_loadout/zm_trial_restrict_loadout
// Params 1, eflags: 0x4
// Checksum 0x1da54f10, Offset: 0x26d8
// Size: 0x444
function private on_end( round_reset )
{
    if ( isarray( self.a_n_objective_ids ) )
    {
        foreach ( n_objective_id in self.a_n_objective_ids )
        {
            gameobjects::release_obj_id( n_objective_id );
        }
        
        self.a_n_objective_ids = undefined;
    }
    
    level.b_special_weapons = undefined;
    callback::function_824d206( &function_33f0ddd3 );
    callback::remove_on_weapon_change( &zm_trial_util::function_79518194 );
    challenge = zm_trial::function_a36e8c38( #"restrict_loadout" );
    
    if ( challenge.var_e097dc07 === #"snowballs" )
    {
        callback::function_824d206( &function_10c80e10 );
    }
    
    foreach ( player in getplayers() )
    {
        foreach ( weapon in player getweaponslist( 1 ) )
        {
            player unlockweapon( weapon );
            
            if ( weapon.isdualwield && weapon.dualwieldweapon != level.weaponnone )
            {
                player unlockweapon( weapon.dualwieldweapon );
            }
            
            if ( zm_loadout::is_lethal_grenade( weapon ) )
            {
                player zm_trial_util::function_88805385( 0 );
            }
        }
        
        player zm_trial_util::function_73ff0096();
        player zm_trial_util::function_7dbb1712( 1 );
        
        if ( self.var_e097dc07 == #"spear_only" )
        {
            player allowmelee( 1 );
        }
        
        player enableoffhandweapons();
        player enableoffhandspecial();
    }
    
    if ( round_reset && self.var_e097dc07 == #"equipment" )
    {
        foreach ( player in getplayers() )
        {
            player function_f66032dd();
        }
    }
    
    zm_traps::function_9d0c9706();
    level.var_526d919 = undefined;
    level.var_4400c4f7 = undefined;
    level zm_trial::function_25ee130( 0 );
}

// Namespace zm_trial_restrict_loadout/zm_trial_restrict_loadout
// Params 1
// Checksum 0x8058cf00, Offset: 0x2b28
// Size: 0x148
function function_f1dd7bf8( var_9e126e48 )
{
    if ( !isdefined( var_9e126e48 ) )
    {
        var_9e126e48 = [];
    }
    else if ( !isarray( var_9e126e48 ) )
    {
        var_9e126e48 = array( var_9e126e48 );
    }
    
    var_fda63ae3 = [];
    
    foreach ( var_957235ca in var_9e126e48 )
    {
        s_wallbuy = struct::get( var_957235ca, "zombie_weapon_upgrade" );
        
        if ( isdefined( s_wallbuy ) )
        {
            if ( !isdefined( var_fda63ae3 ) )
            {
                var_fda63ae3 = [];
            }
            else if ( !isarray( var_fda63ae3 ) )
            {
                var_fda63ae3 = array( var_fda63ae3 );
            }
            
            var_fda63ae3[ var_fda63ae3.size ] = s_wallbuy.origin;
        }
    }
    
    return var_fda63ae3;
}

// Namespace zm_trial_restrict_loadout/zm_trial_restrict_loadout
// Params 1
// Checksum 0x38228e89, Offset: 0x2c78
// Size: 0x14c
function function_f0e03d3( var_f5300808 )
{
    self endon( #"disconnect" );
    
    if ( isdefined( var_f5300808 ) && var_f5300808 )
    {
        while ( self zm_utility::is_drinking() )
        {
            waitframe( 1 );
        }
        
        var_3ba4bf7d = self getweaponslistprimaries();
        
        foreach ( weapon in var_3ba4bf7d )
        {
            self takeweapon( weapon );
        }
        
        var_d6e53d7a = array::random( level.var_526d919 );
        self zm_weapons::weapon_give( var_d6e53d7a );
    }
    
    self thread function_6a8979c9();
    self zm_trial_util::function_7dbb1712( 1 );
}

// Namespace zm_trial_restrict_loadout/zm_trial_restrict_loadout
// Params 0
// Checksum 0x43334085, Offset: 0x2dd0
// Size: 0x44
function function_937e218c()
{
    s_challenge = zm_trial::function_a36e8c38( #"restrict_loadout" );
    
    if ( isdefined( s_challenge ) )
    {
        return s_challenge.var_e097dc07;
    }
}

// Namespace zm_trial_restrict_loadout/zm_trial_restrict_loadout
// Params 1
// Checksum 0x1c7a43cd, Offset: 0x2e20
// Size: 0x72, Type: bool
function is_active( var_1eb3fec6 = 0 )
{
    if ( var_1eb3fec6 && isdefined( level.b_special_weapons ) && level.b_special_weapons )
    {
        return false;
    }
    
    challenge = zm_trial::function_a36e8c38( #"restrict_loadout" );
    return isdefined( challenge );
}

// Namespace zm_trial_restrict_loadout/zm_trial_restrict_loadout
// Params 1
// Checksum 0x76e57b53, Offset: 0x2ea0
// Size: 0xc
function function_bb33631e( var_b5d0ea49 )
{
    
}

// Namespace zm_trial_restrict_loadout/zm_trial_restrict_loadout
// Params 0, eflags: 0x4
// Checksum 0x6e29eddc, Offset: 0x2f30
// Size: 0x6c
function private disable_offhand_weapons()
{
    self endon( #"disconnect" );
    was_enabled = self offhandweaponsenabled();
    self disableoffhandweapons();
    wait 1;
    
    if ( was_enabled )
    {
        self enableoffhandweapons();
    }
}

// Namespace zm_trial_restrict_loadout/zm_trial_restrict_loadout
// Params 0, eflags: 0x4
// Checksum 0xea2ab4a5, Offset: 0x2fa8
// Size: 0x16c
function private function_e20ebcfd()
{
    if ( self.var_e097dc07 != #"equipment" )
    {
        foreach ( player in getplayers() )
        {
            player thread disable_offhand_weapons();
            
            if ( isarray( player.mini_turrets ) )
            {
                arrayremovevalue( player.mini_turrets, undefined );
                
                foreach ( mini_turret in player.mini_turrets )
                {
                    mini_turret dodamage( mini_turret.health + 100, mini_turret.origin );
                }
            }
        }
    }
}

// Namespace zm_trial_restrict_loadout/zm_trial_restrict_loadout
// Params 0, eflags: 0x4
// Checksum 0x125b26c5, Offset: 0x3120
// Size: 0x11c, Type: bool
function private function_f3fdd8f7()
{
    assert( isdefined( level.var_526d919 ) );
    
    foreach ( weapon in level.var_526d919 )
    {
        if ( self hasweapon( weapon, 1 ) )
        {
            return true;
        }
        
        if ( isarray( level.var_5a069e6 ) && isweapon( level.var_5a069e6[ weapon ] ) && self hasweapon( level.var_5a069e6[ weapon ], 1 ) )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace zm_trial_restrict_loadout/zm_trial_restrict_loadout
// Params 1, eflags: 0x4
// Checksum 0x8ef1f1ed, Offset: 0x3248
// Size: 0x20a
function private monitor_objective( challenge )
{
    self endon( #"disconnect" );
    level endon( #"hash_7646638df88a3656" );
    assert( isarray( challenge.a_n_objective_ids ), "<dev string:x56>" );
    
    foreach ( n_objective_id in challenge.a_n_objective_ids )
    {
        objective_setinvisibletoplayer( n_objective_id, self );
    }
    
    wait 12;
    
    while ( true )
    {
        if ( self function_f3fdd8f7() )
        {
            foreach ( n_objective_id in challenge.a_n_objective_ids )
            {
                objective_setinvisibletoplayer( n_objective_id, self );
            }
        }
        else
        {
            foreach ( n_objective_id in challenge.a_n_objective_ids )
            {
                objective_setvisibletoplayer( n_objective_id, self );
            }
        }
        
        waitframe( 1 );
    }
}

// Namespace zm_trial_restrict_loadout/zm_trial_restrict_loadout
// Params 2
// Checksum 0x4ddf4a6e, Offset: 0x3460
// Size: 0x104, Type: bool
function function_5fbf572( weapon, var_2f0cc3aa = 0 )
{
    if ( !zm_utility::is_trials() )
    {
        return true;
    }
    
    if ( var_2f0cc3aa && is_active( 1 ) && isdefined( weapon ) && is_melee_allowed( weapon ) )
    {
        return true;
    }
    
    if ( is_active( 1 ) || zm_trial_disable_hero_weapons::is_active() || self isweaponlocked( weapon ) )
    {
        if ( isplayer( self ) )
        {
            self zm_trial_util::function_97444b02();
        }
        
        return false;
    }
    
    return true;
}

