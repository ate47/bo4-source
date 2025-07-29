#using scripts\core_common\aat_shared;
#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\flagsys_shared;
#using scripts\core_common\laststand_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\trials\zm_trial_disable_buys;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_customgame;
#using scripts\zm_common\zm_equipment;
#using scripts\zm_common\zm_laststand;
#using scripts\zm_common\zm_loadout;
#using scripts\zm_common\zm_magicbox;
#using scripts\zm_common\zm_pack_a_punch_util;
#using scripts\zm_common\zm_perks;
#using scripts\zm_common\zm_score;
#using scripts\zm_common\zm_unitrigger;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_vo;
#using scripts\zm_common\zm_weapons;
#using scripts\zm_common\zm_zonemgr;

#namespace zm_red_oracle_boons;

// Namespace zm_red_oracle_boons/zm_red_oracle_boons
// Params 0, eflags: 0x2
// Checksum 0xaf06b1f, Offset: 0x230
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"zm_red_oracle_boons", &__init__, &__main__, undefined );
}

// Namespace zm_red_oracle_boons/zm_red_oracle_boons
// Params 0
// Checksum 0xca9997d3, Offset: 0x280
// Size: 0xc4
function __init__()
{
    n_bits = getminbitcountfornum( 4 );
    clientfield::register( "item", "" + #"hash_7e5c581ade235dfc", 16000, n_bits, "int" );
    clientfield::register( "toplayer", "" + #"hash_403e80cafccc207c", 16000, 1, "int" );
    callback::on_connecting( &on_player_connect );
}

// Namespace zm_red_oracle_boons/zm_red_oracle_boons
// Params 0
// Checksum 0x10fa6713, Offset: 0x350
// Size: 0xe9c
function __main__()
{
    if ( zm_utility::is_standard() )
    {
        return;
    }
    
    level.var_e8ccb5b4 = [];
    
    if ( !isdefined( level.var_e8ccb5b4 ) )
    {
        level.var_e8ccb5b4 = [];
    }
    else if ( !isarray( level.var_e8ccb5b4 ) )
    {
        level.var_e8ccb5b4 = array( level.var_e8ccb5b4 );
    }
    
    level.var_e8ccb5b4[ level.var_e8ccb5b4.size ] = getweapon( #"none" );
    
    if ( !isdefined( level.var_e8ccb5b4 ) )
    {
        level.var_e8ccb5b4 = [];
    }
    else if ( !isarray( level.var_e8ccb5b4 ) )
    {
        level.var_e8ccb5b4 = array( level.var_e8ccb5b4 );
    }
    
    level.var_e8ccb5b4[ level.var_e8ccb5b4.size ] = getweapon( #"zombie_fists" );
    
    if ( !isdefined( level.var_e8ccb5b4 ) )
    {
        level.var_e8ccb5b4 = [];
    }
    else if ( !isarray( level.var_e8ccb5b4 ) )
    {
        level.var_e8ccb5b4 = array( level.var_e8ccb5b4 );
    }
    
    level.var_e8ccb5b4[ level.var_e8ccb5b4.size ] = getweapon( #"hero_scepter_lv1" );
    
    if ( !isdefined( level.var_e8ccb5b4 ) )
    {
        level.var_e8ccb5b4 = [];
    }
    else if ( !isarray( level.var_e8ccb5b4 ) )
    {
        level.var_e8ccb5b4 = array( level.var_e8ccb5b4 );
    }
    
    level.var_e8ccb5b4[ level.var_e8ccb5b4.size ] = getweapon( #"hero_scepter_lv2" );
    
    if ( !isdefined( level.var_e8ccb5b4 ) )
    {
        level.var_e8ccb5b4 = [];
    }
    else if ( !isarray( level.var_e8ccb5b4 ) )
    {
        level.var_e8ccb5b4 = array( level.var_e8ccb5b4 );
    }
    
    level.var_e8ccb5b4[ level.var_e8ccb5b4.size ] = getweapon( #"hero_scepter_lv3" );
    
    if ( !isdefined( level.var_e8ccb5b4 ) )
    {
        level.var_e8ccb5b4 = [];
    }
    else if ( !isarray( level.var_e8ccb5b4 ) )
    {
        level.var_e8ccb5b4 = array( level.var_e8ccb5b4 );
    }
    
    level.var_e8ccb5b4[ level.var_e8ccb5b4.size ] = getweapon( #"hero_chakram_lv1" );
    
    if ( !isdefined( level.var_e8ccb5b4 ) )
    {
        level.var_e8ccb5b4 = [];
    }
    else if ( !isarray( level.var_e8ccb5b4 ) )
    {
        level.var_e8ccb5b4 = array( level.var_e8ccb5b4 );
    }
    
    level.var_e8ccb5b4[ level.var_e8ccb5b4.size ] = getweapon( #"hero_chakram_lv2" );
    
    if ( !isdefined( level.var_e8ccb5b4 ) )
    {
        level.var_e8ccb5b4 = [];
    }
    else if ( !isarray( level.var_e8ccb5b4 ) )
    {
        level.var_e8ccb5b4 = array( level.var_e8ccb5b4 );
    }
    
    level.var_e8ccb5b4[ level.var_e8ccb5b4.size ] = getweapon( #"hero_chakram_lv3" );
    
    if ( !isdefined( level.var_e8ccb5b4 ) )
    {
        level.var_e8ccb5b4 = [];
    }
    else if ( !isarray( level.var_e8ccb5b4 ) )
    {
        level.var_e8ccb5b4 = array( level.var_e8ccb5b4 );
    }
    
    level.var_e8ccb5b4[ level.var_e8ccb5b4.size ] = getweapon( #"hero_hammer_lv1" );
    
    if ( !isdefined( level.var_e8ccb5b4 ) )
    {
        level.var_e8ccb5b4 = [];
    }
    else if ( !isarray( level.var_e8ccb5b4 ) )
    {
        level.var_e8ccb5b4 = array( level.var_e8ccb5b4 );
    }
    
    level.var_e8ccb5b4[ level.var_e8ccb5b4.size ] = getweapon( #"hero_hammer_lv2" );
    
    if ( !isdefined( level.var_e8ccb5b4 ) )
    {
        level.var_e8ccb5b4 = [];
    }
    else if ( !isarray( level.var_e8ccb5b4 ) )
    {
        level.var_e8ccb5b4 = array( level.var_e8ccb5b4 );
    }
    
    level.var_e8ccb5b4[ level.var_e8ccb5b4.size ] = getweapon( #"hero_hammer_lv3" );
    
    if ( !isdefined( level.var_e8ccb5b4 ) )
    {
        level.var_e8ccb5b4 = [];
    }
    else if ( !isarray( level.var_e8ccb5b4 ) )
    {
        level.var_e8ccb5b4 = array( level.var_e8ccb5b4 );
    }
    
    level.var_e8ccb5b4[ level.var_e8ccb5b4.size ] = getweapon( #"hero_sword_pistol_lv1" );
    
    if ( !isdefined( level.var_e8ccb5b4 ) )
    {
        level.var_e8ccb5b4 = [];
    }
    else if ( !isarray( level.var_e8ccb5b4 ) )
    {
        level.var_e8ccb5b4 = array( level.var_e8ccb5b4 );
    }
    
    level.var_e8ccb5b4[ level.var_e8ccb5b4.size ] = getweapon( #"hero_sword_pistol_lv2" );
    
    if ( !isdefined( level.var_e8ccb5b4 ) )
    {
        level.var_e8ccb5b4 = [];
    }
    else if ( !isarray( level.var_e8ccb5b4 ) )
    {
        level.var_e8ccb5b4 = array( level.var_e8ccb5b4 );
    }
    
    level.var_e8ccb5b4[ level.var_e8ccb5b4.size ] = getweapon( #"hero_sword_pistol_lv3" );
    
    if ( !isdefined( level.var_e8ccb5b4 ) )
    {
        level.var_e8ccb5b4 = [];
    }
    else if ( !isarray( level.var_e8ccb5b4 ) )
    {
        level.var_e8ccb5b4 = array( level.var_e8ccb5b4 );
    }
    
    level.var_e8ccb5b4[ level.var_e8ccb5b4.size ] = getweapon( #"ww_hand_c" );
    
    if ( !isdefined( level.var_e8ccb5b4 ) )
    {
        level.var_e8ccb5b4 = [];
    }
    else if ( !isarray( level.var_e8ccb5b4 ) )
    {
        level.var_e8ccb5b4 = array( level.var_e8ccb5b4 );
    }
    
    level.var_e8ccb5b4[ level.var_e8ccb5b4.size ] = getweapon( #"ww_hand_g" );
    
    if ( !isdefined( level.var_e8ccb5b4 ) )
    {
        level.var_e8ccb5b4 = [];
    }
    else if ( !isarray( level.var_e8ccb5b4 ) )
    {
        level.var_e8ccb5b4 = array( level.var_e8ccb5b4 );
    }
    
    level.var_e8ccb5b4[ level.var_e8ccb5b4.size ] = getweapon( #"ww_hand_h" );
    
    if ( !isdefined( level.var_e8ccb5b4 ) )
    {
        level.var_e8ccb5b4 = [];
    }
    else if ( !isarray( level.var_e8ccb5b4 ) )
    {
        level.var_e8ccb5b4 = array( level.var_e8ccb5b4 );
    }
    
    level.var_e8ccb5b4[ level.var_e8ccb5b4.size ] = getweapon( #"ww_hand_o" );
    
    if ( !isdefined( level.var_e8ccb5b4 ) )
    {
        level.var_e8ccb5b4 = [];
    }
    else if ( !isarray( level.var_e8ccb5b4 ) )
    {
        level.var_e8ccb5b4 = array( level.var_e8ccb5b4 );
    }
    
    level.var_e8ccb5b4[ level.var_e8ccb5b4.size ] = getweapon( #"ww_hand_c_upgraded" );
    
    if ( !isdefined( level.var_e8ccb5b4 ) )
    {
        level.var_e8ccb5b4 = [];
    }
    else if ( !isarray( level.var_e8ccb5b4 ) )
    {
        level.var_e8ccb5b4 = array( level.var_e8ccb5b4 );
    }
    
    level.var_e8ccb5b4[ level.var_e8ccb5b4.size ] = getweapon( #"ww_hand_g_upgraded" );
    
    if ( !isdefined( level.var_e8ccb5b4 ) )
    {
        level.var_e8ccb5b4 = [];
    }
    else if ( !isarray( level.var_e8ccb5b4 ) )
    {
        level.var_e8ccb5b4 = array( level.var_e8ccb5b4 );
    }
    
    level.var_e8ccb5b4[ level.var_e8ccb5b4.size ] = getweapon( #"ww_hand_h_upgraded" );
    
    if ( !isdefined( level.var_e8ccb5b4 ) )
    {
        level.var_e8ccb5b4 = [];
    }
    else if ( !isarray( level.var_e8ccb5b4 ) )
    {
        level.var_e8ccb5b4 = array( level.var_e8ccb5b4 );
    }
    
    level.var_e8ccb5b4[ level.var_e8ccb5b4.size ] = getweapon( #"ww_hand_o_upgraded" );
    
    if ( !isdefined( level.var_e8ccb5b4 ) )
    {
        level.var_e8ccb5b4 = [];
    }
    else if ( !isarray( level.var_e8ccb5b4 ) )
    {
        level.var_e8ccb5b4 = array( level.var_e8ccb5b4 );
    }
    
    level.var_e8ccb5b4[ level.var_e8ccb5b4.size ] = getweapon( #"zombie_builder" );
    
    if ( !isdefined( level.var_e8ccb5b4 ) )
    {
        level.var_e8ccb5b4 = [];
    }
    else if ( !isarray( level.var_e8ccb5b4 ) )
    {
        level.var_e8ccb5b4 = array( level.var_e8ccb5b4 );
    }
    
    level.var_e8ccb5b4[ level.var_e8ccb5b4.size ] = getweapon( #"equip_sprout" );
    level thread function_25efffc0();
    level thread function_d71a9fa1();
}

// Namespace zm_red_oracle_boons/zm_red_oracle_boons
// Params 0
// Checksum 0xca277731, Offset: 0x11f8
// Size: 0x56
function function_25efffc0()
{
    level flag::wait_till( "power_on" );
    level.custom_door_buy_check = &custom_door_buy_check;
    level.var_2e93df96 = &custom_door_buy_check;
}

// Namespace zm_red_oracle_boons/zm_red_oracle_boons
// Params 0
// Checksum 0x34619653, Offset: 0x1258
// Size: 0x1c2
function on_player_connect()
{
    if ( zm_utility::is_standard() )
    {
        return;
    }
    
    self.var_6a885e6e = 0;
    self.s_boons[ 0 ] = function_4b36d499( 1, -1 );
    self.s_boons[ 1 ] = function_4b36d499( 1, 10 );
    self.s_boons[ 2 ] = function_4b36d499( 1, 5 );
    self.s_boons[ 3 ] = function_4b36d499( 1, 10 );
    self.s_boons[ 4 ] = function_4b36d499( 1, -1 );
    self.s_boons[ 5 ] = function_4b36d499( 1, -1 );
    self.s_boons[ 6 ] = function_4b36d499( 1, 10 );
    self thread function_e1bfb2de();
    self thread function_4e1abe8f();
    self thread function_99792b2f();
    self thread function_1ba093e();
    self thread function_3fe13b7b();
    self.player_damage_override = &function_b4b16823;
}

// Namespace zm_red_oracle_boons/zm_red_oracle_boons
// Params 2
// Checksum 0x73bc6afe, Offset: 0x1428
// Size: 0x52
function function_4b36d499( b_available, var_e7a18e05 )
{
    s_boon = struct::spawn();
    s_boon.b_available = b_available;
    s_boon.var_e7a18e05 = var_e7a18e05;
    return s_boon;
}

// Namespace zm_red_oracle_boons/zm_red_oracle_boons
// Params 10
// Checksum 0x8b7ba083, Offset: 0x1488
// Size: 0x154
function function_b4b16823( einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime )
{
    if ( !level flag::get( "power_on" ) || zm_utility::is_trials() )
    {
        return;
    }
    
    if ( idamage >= self.health && self zm_laststand::function_618fd37e() == 0 && util::get_active_players().size === 1 )
    {
        if ( self function_3b81466e( 5 ) == 1 )
        {
            self zm_laststand::function_3a00302e();
            
            if ( getplayers().size > 1 )
            {
                self.var_20f86af4 = 1;
            }
            
            self thread function_eb25a497();
        }
    }
}

// Namespace zm_red_oracle_boons/zm_red_oracle_boons
// Params 0, eflags: 0x4
// Checksum 0x7d41125a, Offset: 0x15e8
// Size: 0x4c
function private function_eb25a497()
{
    self endon( #"disconnect" );
    self waittill( #"player_revived" );
    self.var_20f86af4 = undefined;
    self thread function_c3778d8a( 5, undefined );
}

// Namespace zm_red_oracle_boons/zm_red_oracle_boons
// Params 0, eflags: 0x4
// Checksum 0x8f704e99, Offset: 0x1640
// Size: 0x100
function private function_99792b2f()
{
    self endon( #"death" );
    
    if ( zm_custom::function_901b751c( #"zmmysteryboxstate" ) != 2 )
    {
        return;
    }
    
    level flag::wait_till( "all_players_spawned" );
    level flag::wait_till( "power_on" );
    
    while ( true )
    {
        while ( !isdefined( level.chests ) )
        {
            waitframe( 1 );
        }
        
        chest = level.chests[ level.chest_index ];
        chest.zbarrier waittill( #"randomization_done" );
        self function_c69ff317( chest );
    }
}

// Namespace zm_red_oracle_boons/zm_red_oracle_boons
// Params 1, eflags: 0x4
// Checksum 0x6f8a1c03, Offset: 0x1748
// Size: 0x21c
function private function_c69ff317( chest )
{
    self endon( #"death" );
    chest.zbarrier endon( #"weapon_grabbed" );
    
    if ( isdefined( chest.zbarrier.weapon_model ) && isdefined( chest.chest_user ) && self == chest.chest_user )
    {
        wait 11;
        
        if ( self function_3b81466e( 3 ) == 1 )
        {
            self thread function_c3778d8a( 3, 3 );
            chest.var_1f9dff37 = 1;
            chest.var_481aa649 = 0;
            chest.no_fly_away = 1;
            chest.zbarrier notify( #"box_hacked_respin" );
            chest thread zm_unitrigger::unregister_unitrigger( chest.unitrigger_stub );
            chest.zbarrier thread zm_magicbox::treasure_chest_weapon_spawn( chest, self );
            chest.zbarrier waittill( #"randomization_done" );
            chest.no_fly_away = undefined;
            
            if ( !level flag::get( "moving_chest_now" ) )
            {
                chest.grab_weapon_hint = 1;
                chest.grab_weapon = chest.zbarrier.weapon;
                chest thread zm_unitrigger::register_static_unitrigger( chest.unitrigger_stub, &zm_magicbox::magicbox_unitrigger_think );
                chest thread zm_magicbox::treasure_chest_timeout();
                chest thread function_f53cfc70();
            }
        }
    }
}

// Namespace zm_red_oracle_boons/zm_red_oracle_boons
// Params 0
// Checksum 0xcfe2680b, Offset: 0x1970
// Size: 0x3a
function function_f53cfc70()
{
    level endon( #"game_ended" );
    self waittill( #"chest_accessed" );
    self.var_1f9dff37 = undefined;
}

// Namespace zm_red_oracle_boons/zm_red_oracle_boons
// Params 0, eflags: 0x4
// Checksum 0x2f38fc3b, Offset: 0x19b8
// Size: 0x1f6
function private function_4e1abe8f()
{
    self endon( #"death" );
    level flag::wait_till( "power_on" );
    
    while ( true )
    {
        str_zone = self zm_zonemgr::get_player_zone();
        
        if ( !zm_utility::is_player_valid( self ) || !isdefined( str_zone ) || !isdefined( level.var_eb91e07c[ str_zone ] ) || level.round_number < level.var_eb91e07c[ str_zone ] + 3 )
        {
            wait 5;
            continue;
        }
        
        a_items = getitemarray();
        
        foreach ( e_item in a_items )
        {
            if ( isdefined( e_item.item ) && isinarray( level.crafting_components, e_item.item ) && isdefined( str_zone ) && e_item zm_zonemgr::entity_in_zone( str_zone ) )
            {
                if ( self function_3b81466e( 2 ) == 1 )
                {
                    self thread function_fa31ee20( e_item );
                    break;
                }
            }
        }
        
        wait 5;
    }
}

// Namespace zm_red_oracle_boons/zm_red_oracle_boons
// Params 1, eflags: 0x4
// Checksum 0xdb0c678b, Offset: 0x1bb8
// Size: 0x7c
function private function_fa31ee20( e_item )
{
    self thread function_c3778d8a( 2, undefined );
    var_21c1ba1 = self getentitynumber();
    e_item clientfield::set( "" + #"hash_7e5c581ade235dfc", var_21c1ba1 + 1 );
}

// Namespace zm_red_oracle_boons/zm_red_oracle_boons
// Params 0, eflags: 0x4
// Checksum 0xcebcd33b, Offset: 0x1c40
// Size: 0x1ae
function private function_d71a9fa1()
{
    level endon( #"game_ended" );
    level.var_eb91e07c = [];
    level flagsys::wait_till( "start_zombie_round_logic" );
    var_90c5736d = function_99a3da6a();
    
    foreach ( str_zone in var_90c5736d )
    {
        if ( !isdefined( level.var_eb91e07c[ str_zone ] ) )
        {
            level.var_eb91e07c[ str_zone ] = level.round_number;
        }
    }
    
    while ( true )
    {
        level waittill( #"between_round_over" );
        var_90c5736d = function_99a3da6a();
        
        foreach ( str_zone in var_90c5736d )
        {
            if ( !isdefined( level.var_eb91e07c[ str_zone ] ) )
            {
                level.var_eb91e07c[ str_zone ] = level.round_number - 1;
            }
        }
    }
}

// Namespace zm_red_oracle_boons/zm_red_oracle_boons
// Params 0, eflags: 0x4
// Checksum 0xb7d77777, Offset: 0x1df8
// Size: 0xbe
function private function_99a3da6a()
{
    var_7ab9503c = [];
    
    if ( !isdefined( level.zone_keys ) )
    {
        return var_7ab9503c;
    }
    
    while ( level.zone_scanning_active )
    {
        waitframe( 1 );
    }
    
    for ( i = 0; i < level.zone_keys.size ; i++ )
    {
        if ( level.zones[ level.zone_keys[ i ] ].is_enabled )
        {
            var_7ab9503c[ var_7ab9503c.size ] = level.zones[ level.zone_keys[ i ] ].name;
        }
    }
    
    return var_7ab9503c;
}

// Namespace zm_red_oracle_boons/zm_red_oracle_boons
// Params 0, eflags: 0x4
// Checksum 0xd10d4b12, Offset: 0x1ec0
// Size: 0x2c6
function private function_e1bfb2de()
{
    self endon( #"death" );
    level flag::wait_till( "all_players_spawned" );
    level flag::wait_till( "power_on" );
    wait 5;
    
    while ( true )
    {
        var_59130748 = 0;
        
        if ( isarray( level.active_powerups ) && level.active_powerups.size )
        {
            foreach ( e_powerup in level.active_powerups )
            {
                if ( isdefined( e_powerup ) && e_powerup.powerup_name === "full_ammo" )
                {
                    var_59130748 = 1;
                    break;
                }
            }
        }
        
        if ( zm_custom::function_901b751c( #"zmpowerupsactive" ) && zm_utility::is_player_valid( self ) && !self zm_utility::is_drinking() && !( isdefined( var_59130748 ) && var_59130748 ) && !self zm_laststand::is_reviving_any() )
        {
            w_weapon = self getcurrentweapon();
            
            if ( self getweaponammostock( w_weapon ) < self getweaponammoclipsize( w_weapon ) && self getweaponammoclip( w_weapon ) <= int( self getweaponammoclipsize( w_weapon ) / 2 ) && !isinarray( level.var_e8ccb5b4, w_weapon ) )
            {
                if ( self function_3b81466e( 1 ) == 1 )
                {
                    self thread function_c3778d8a( 1, undefined );
                    self zm_weapons::ammo_give( w_weapon, 0 );
                }
            }
        }
        
        wait 1;
    }
}

// Namespace zm_red_oracle_boons/zm_red_oracle_boons
// Params 1
// Checksum 0x23721307, Offset: 0x2190
// Size: 0xe0, Type: bool
function custom_door_buy_check( e_door )
{
    if ( zm_trial_disable_buys::is_active() )
    {
        return false;
    }
    
    var_b35154c6 = self.score - e_door.zombie_cost;
    
    if ( var_b35154c6 < 0 && abs( var_b35154c6 ) <= 200 )
    {
        if ( self function_3b81466e( 0 ) == 1 )
        {
            self thread function_c3778d8a( 0, undefined );
            self zm_score::player_add_points( "oracle_boon", abs( var_b35154c6 ), undefined, undefined, undefined, undefined, 1 );
        }
    }
    
    return true;
}

// Namespace zm_red_oracle_boons/zm_red_oracle_boons
// Params 0, eflags: 0x4
// Checksum 0x55534f4, Offset: 0x2278
// Size: 0x14c
function private function_1ba093e()
{
    self endon( #"death" );
    pap_machine = getent( "zm_pack_a_punch", "targetname" );
    level flag::wait_till( "all_players_spawned" );
    level flag::wait_till( "pap_machine_active" );
    
    while ( true )
    {
        self waittill( #"packing_weapon" );
        
        if ( isdefined( pap_machine.unitrigger_stub.current_weapon ) && zm_weapons::is_wonder_weapon( pap_machine.unitrigger_stub.current_weapon ) )
        {
            continue;
        }
        
        if ( isdefined( pap_machine.pack_player ) && pap_machine.pack_player == self )
        {
            self thread function_91a9c226( pap_machine );
            self waittill( #"pap_timeout", #"pap_taken" );
        }
        
        waitframe( 1 );
    }
}

// Namespace zm_red_oracle_boons/zm_red_oracle_boons
// Params 1, eflags: 0x4
// Checksum 0xc3f7f416, Offset: 0x23d0
// Size: 0x6c
function private function_91a9c226( pap_machine )
{
    self endon( #"death", #"pap_timeout", #"pap_taken" );
    self waittill( #"entering_last_stand" );
    self thread function_de053460( pap_machine );
}

// Namespace zm_red_oracle_boons/zm_red_oracle_boons
// Params 1, eflags: 0x4
// Checksum 0x24ccfbd2, Offset: 0x2448
// Size: 0x426
function private function_de053460( pap_machine )
{
    self endon( #"death", #"pap_taken" );
    waitframe( 2 );
    var_2ff5c7ee = pap_machine.unitrigger_stub;
    var_b64e889a = pap_machine.var_b64e889a;
    b_weapon_supports_aat = pap_machine.b_weapon_supports_aat;
    assert( isdefined( var_2ff5c7ee.current_weapon ), "<dev string:x38>" );
    assert( isdefined( var_2ff5c7ee.upgrade_weapon ), "<dev string:x69>" );
    w_current = var_2ff5c7ee.current_weapon;
    self waittill( #"player_revived" );
    wait 1;
    
    while ( isdefined( self.isspeaking ) && self.isspeaking )
    {
        waitframe( 1 );
    }
    
    var_287a8343 = zm_utility::get_player_weapon_limit( self );
    a_primaries = self getweaponslistprimaries();
    
    if ( isdefined( a_primaries ) && a_primaries.size >= var_287a8343 )
    {
        return;
    }
    
    if ( self function_3b81466e( 4 ) )
    {
        self thread function_c3778d8a( 4, undefined );
        
        if ( zm_utility::is_player_valid( self ) )
        {
            self zm_weapons::take_fallback_weapon();
            w_upgrade = self zm_weapons::give_build_kit_weapon( var_2ff5c7ee.upgrade_weapon, var_2ff5c7ee.var_3ded6a21, var_2ff5c7ee.var_f716c676 );
            self zm_weapons::function_7c5dd4bd( w_upgrade );
            self notify( #"weapon_give", w_upgrade );
            var_cbf27833 = zm_weapons::is_weapon_upgraded( w_current );
            
            if ( isdefined( b_weapon_supports_aat ) && b_weapon_supports_aat && var_cbf27833 )
            {
                if ( !isdefined( var_2ff5c7ee.var_3ae1dddb ) )
                {
                    var_2ff5c7ee.var_3ae1dddb = 0;
                }
                
                self thread aat::acquire( w_upgrade, undefined, var_2ff5c7ee.var_da1ddb37 );
                self zm_pap_util::repack_weapon( w_upgrade, var_2ff5c7ee.var_3ae1dddb + 1 );
            }
            
            weaponidx = undefined;
            
            if ( isdefined( w_current ) )
            {
                weaponidx = matchrecordgetweaponindex( w_current );
            }
            
            self switchtoweapon( w_upgrade );
            
            if ( isdefined( self.var_655c0753 ) && self.var_655c0753 && !( isdefined( var_b64e889a ) && var_b64e889a ) )
            {
                new_clip = self.restore_clip + w_upgrade.clipsize - self.restore_clip_size;
                new_stock = self.healing_aura_revive_zm + w_upgrade.maxammo - self.restore_max;
                self setweaponammostock( w_upgrade, new_stock );
                self setweaponammoclip( w_upgrade, new_clip );
            }
            
            self.var_655c0753 = undefined;
            self.restore_clip = undefined;
            self.healing_aura_revive_zm = undefined;
            self.restore_max = undefined;
            self.restore_clip_size = undefined;
        }
    }
}

// Namespace zm_red_oracle_boons/zm_red_oracle_boons
// Params 0, eflags: 0x4
// Checksum 0x9c9c9acf, Offset: 0x2878
// Size: 0x288
function private function_3fe13b7b()
{
    self endon( #"death" );
    level flag::wait_till( "power_on" );
    
    while ( true )
    {
        self waittill( #"entering_last_stand" );
        var_2c7d72cf = arraycopy( self.var_466b927f );
        
        if ( !var_2c7d72cf.size )
        {
            continue;
        }
        
        s_result = self waittill( #"player_revived", #"bled_out" );
        wait 1;
        a_current_perks = arraycopy( self.var_466b927f );
        var_2c7d72cf = array::randomize( var_2c7d72cf );
        
        for ( i = 0; i < var_2c7d72cf.size ; i++ )
        {
            if ( !isinarray( a_current_perks, var_2c7d72cf[ i ] ) )
            {
                self.var_b0a9df22 = var_2c7d72cf[ i ];
                break;
            }
        }
        
        if ( s_result._notify == "player_revived" && isdefined( self.var_b0a9df22 ) )
        {
            while ( isdefined( self.isspeaking ) && self.isspeaking )
            {
                waitframe( 1 );
            }
            
            if ( self function_3b81466e( 6 ) )
            {
                for ( i = 0; i < self.var_c27f1e90.size ; i++ )
                {
                    if ( self.var_c27f1e90[ i ] == self.var_b0a9df22 )
                    {
                        var_c3f41835 = i;
                        break;
                    }
                }
                
                if ( isdefined( var_c3f41835 ) )
                {
                    self thread zm_perks::function_9bdf581f( self.var_b0a9df22, var_c3f41835 );
                }
                else
                {
                    self thread zm_perks::function_a7ae070c( self.var_b0a9df22 );
                }
                
                self thread function_c3778d8a( 6, undefined );
            }
        }
        
        self.var_b0a9df22 = undefined;
        waitframe( 1 );
    }
}

// Namespace zm_red_oracle_boons/zm_red_oracle_boons
// Params 2, eflags: 0x4
// Checksum 0xa48c8a68, Offset: 0x2b08
// Size: 0x2bc
function private function_c3778d8a( n_boon, n_delay = undefined )
{
    self endon( #"death" );
    
    if ( isdefined( n_delay ) )
    {
        wait n_delay;
    }
    
    switch ( n_boon )
    {
        case 0:
            var_8b7ccae4 = #"hash_6a1a8af71c401279";
            break;
        case 1:
            var_8b7ccae4 = #"hash_6a1a88f71c400f13";
            break;
        case 2:
            var_8b7ccae4 = #"hash_6a1a8bf71c40142c";
            break;
        case 3:
            var_8b7ccae4 = #"hash_6a1a87f71c400d60";
            break;
        case 4:
            var_8b7ccae4 = #"hash_6a1a90f71c401cab";
            break;
        case 5:
            var_8b7ccae4 = #"hash_6a1a8ef71c401945";
            break;
        case 6:
            var_8b7ccae4 = #"hash_6a1a8ff71c401af8";
            break;
        default:
            var_8b7ccae4 = #"hash_11dfeee664d456ef";
            break;
    }
    
    self clientfield::set_to_player( "" + #"hash_403e80cafccc207c", 1 );
    b_say = self zm_vo::vo_say( var_8b7ccae4, 0, 1, 9999, 1, 1, 1 );
    self clientfield::set_to_player( "" + #"hash_403e80cafccc207c", 0 );
    
    if ( b_say && self zm_audio::can_speak() && !( isdefined( self.var_e0ffa699 ) && self.var_e0ffa699 ) )
    {
        self.var_e0ffa699 = 1;
        self zm_vo::function_a2bd5a0c( #"hash_1cf28dc8ff858000", 0.5, 1, 9999, 0, 0, 1 );
    }
}

// Namespace zm_red_oracle_boons/zm_red_oracle_boons
// Params 1, eflags: 0x4
// Checksum 0xbf983c81, Offset: 0x2dd0
// Size: 0x10c, Type: bool
function private function_3b81466e( n_boon )
{
    if ( level flag::get( #"hash_1c0b421abe38d4e0" ) || level flag::get( "round_reset" ) )
    {
        return false;
    }
    
    if ( isdefined( self.s_boons[ n_boon ].b_available ) && self.s_boons[ n_boon ].b_available && isdefined( self.var_6a885e6e ) && !self.var_6a885e6e && self zm_audio::can_speak() )
    {
        self.s_boons[ n_boon ].b_available = 0;
        self thread function_5e8518bb( n_boon );
        self thread function_edb554f3();
        return true;
    }
    
    return false;
}

// Namespace zm_red_oracle_boons/zm_red_oracle_boons
// Params 1, eflags: 0x4
// Checksum 0xb2b001ae, Offset: 0x2ee8
// Size: 0xa2
function private function_5e8518bb( n_boon )
{
    self endon( #"death" );
    
    if ( self.s_boons[ n_boon ].var_e7a18e05 <= 0 )
    {
        return;
    }
    
    for ( n_rounds = self.s_boons[ n_boon ].var_e7a18e05; n_rounds > 0 ; n_rounds-- )
    {
        level waittill( #"start_of_round" );
    }
    
    self.s_boons[ n_boon ].b_available = 1;
}

// Namespace zm_red_oracle_boons/zm_red_oracle_boons
// Params 0, eflags: 0x4
// Checksum 0x8d9e6e00, Offset: 0x2f98
// Size: 0x4e
function private function_edb554f3()
{
    self notify( "2d3e894ede4eef0e" );
    self endon( "2d3e894ede4eef0e" );
    self endon( #"death" );
    self.var_6a885e6e = 1;
    wait 180;
    self.var_6a885e6e = 0;
}

