#using scripts\core_common\ai\zombie_death;
#using scripts\core_common\array_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\fx_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\status_effects\status_effect_util;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\throttle_shared;
#using scripts\core_common\util_shared;
#using scripts\zm\weapons\zm_weap_riotshield;
#using scripts\zm\zm_mansion_util;
#using scripts\zm\zm_mansion_ww_lvl2_quest;
#using scripts\zm\zm_trap_electric;
#using scripts\zm_common\util\ai_werewolf_util;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_contracts;
#using scripts\zm_common\zm_customgame;
#using scripts\zm_common\zm_items;
#using scripts\zm_common\zm_score;
#using scripts\zm_common\zm_stats;
#using scripts\zm_common\zm_traps;
#using scripts\zm_common\zm_unitrigger;
#using scripts\zm_common\zm_utility;

#namespace zm_trap_werewolfer;

// Namespace zm_trap_werewolfer/zm_mansion_trap_werewolfer
// Params 0, eflags: 0x2
// Checksum 0x6b45d01b, Offset: 0x248
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"zm_trap_werewolfer", &__init__, &__main__, undefined );
}

// Namespace zm_trap_werewolfer/zm_mansion_trap_werewolfer
// Params 0
// Checksum 0xf6159c7a, Offset: 0x298
// Size: 0x14c
function __init__()
{
    if ( !zm_custom::function_901b751c( #"zmtrapsenabled" ) )
    {
        return;
    }
    
    level._effect[ #"werewolfer_impact" ] = #"hash_6e44fde5d49cfc9b";
    zm_traps::register_trap_basic_info( "werewolfer", &function_670dda89, &zm_trap_electric::trap_audio );
    zm_traps::register_trap_damage( "werewolfer", &function_436d9a24, &ai_damage );
    level flag::init( #"hash_2287cf5d6310237e" );
    level flag::init( #"hash_6f483dda6f8ab19d" );
    
    if ( !isdefined( level.var_7aa02c24 ) )
    {
        level.var_7aa02c24 = new throttle();
        [[ level.var_7aa02c24 ]]->initialize( 2, 0.1 );
    }
}

// Namespace zm_trap_werewolfer/zm_mansion_trap_werewolfer
// Params 0
// Checksum 0xaceb6748, Offset: 0x3f0
// Size: 0xa4
function __main__()
{
    if ( !zm_custom::function_901b751c( #"zmtrapsenabled" ) )
    {
        return;
    }
    
    level flag::wait_till( "all_players_spawned" );
    level.var_4cca20a9 = getent( "mdl_ww_trap_machine", "targetname" );
    level.var_4cca20a9 clientfield::set( "" + #"hash_17df66ef5f71c0de", 1 );
}

// Namespace zm_trap_werewolfer/zm_mansion_trap_werewolfer
// Params 0
// Checksum 0xb4374097, Offset: 0x4a0
// Size: 0x28c
function function_670dda89()
{
    level.var_4fe07a = self;
    self._trap_duration = 10;
    self._trap_cooldown_time = 30;
    
    if ( isdefined( level.sndtrapfunc ) )
    {
        level thread [[ level.sndtrapfunc ]]( self, 1 );
    }
    
    level notify( #"traps_activated", { #var_be3f58a:self.script_string } );
    level flag::set( #"hash_6f483dda6f8ab19d" );
    level thread function_408fcb87();
    level exploder::exploder( "fxexp_ele_trap_activate" );
    
    if ( !isdefined( self.mdl_handle ) )
    {
        self.mdl_handle = getent( "mdl_ww_trap_lever", "targetname" );
    }
    
    self.mdl_handle rotatepitch( 90, 0.5 );
    level.var_4cca20a9 clientfield::set( "" + #"hash_17df66ef5f71c0de", 2 );
    fx_points = struct::get_array( self.target, "targetname" );
    
    for ( i = 0; i < fx_points.size ; i++ )
    {
        util::wait_network_frame();
        fx_points[ i ] thread zm_trap_electric::trap_audio( self );
    }
    
    self thread zm_traps::trap_damage();
    self waittilltimeout( self._trap_duration, #"trap_deactivate" );
    self notify( #"trap_done" );
    level exploder::stop_exploder( "fxexp_ele_trap_activate" );
    level flag::clear( #"hash_6f483dda6f8ab19d" );
    self thread function_38b44aab();
}

// Namespace zm_trap_werewolfer/zm_mansion_trap_werewolfer
// Params 0
// Checksum 0xf1f6c815, Offset: 0x738
// Size: 0x13c
function function_408fcb87()
{
    t_trap = getent( "werewolfer", "script_noteworthy" );
    
    while ( level flag::get( #"hash_6f483dda6f8ab19d" ) )
    {
        foreach ( player in getplayers() )
        {
            if ( isdefined( player ) && player istouching( t_trap ) && player.currentweapon === getweapon( #"zhield_dw" ) )
            {
                player riotshield::player_damage_shield( 5 );
            }
        }
        
        wait 0.25;
    }
}

// Namespace zm_trap_werewolfer/zm_mansion_trap_werewolfer
// Params 0
// Checksum 0x483fedcd, Offset: 0x880
// Size: 0xf8
function function_38b44aab()
{
    level notify( #"traps_cooldown", { #var_be3f58a:self.script_string } );
    n_cooldown = zm_traps::function_da13db45( self._trap_cooldown_time, self.activated_by_player );
    wait n_cooldown;
    self.mdl_handle rotatepitch( -90, 0.5 );
    wait 0.5;
    level.var_4cca20a9 clientfield::set( "" + #"hash_17df66ef5f71c0de", 1 );
    level notify( #"traps_available", { #var_be3f58a:self.script_string } );
}

// Namespace zm_trap_werewolfer/zm_mansion_trap_werewolfer
// Params 1
// Checksum 0xbab7483c, Offset: 0x980
// Size: 0x84
function function_436d9a24( t_damage )
{
    shock_status_effect = getstatuseffect( #"hash_19533caf858a9f3b" );
    
    if ( !( isdefined( self.b_no_trap_damage ) && self.b_no_trap_damage ) )
    {
        self thread zm_traps::player_elec_damage( t_damage );
        status_effect::status_effect_apply( shock_status_effect, undefined, self, 0 );
    }
}

// Namespace zm_trap_werewolfer/zm_mansion_trap_werewolfer
// Params 1
// Checksum 0x7fe5958a, Offset: 0xa10
// Size: 0x3fa
function ai_damage( e_trap )
{
    self endon( #"death" );
    
    if ( self.subarchetype === #"catalyst_electric" )
    {
        return;
    }
    
    if ( self.team === #"allies" )
    {
        return;
    }
    
    if ( self.archetype === #"blight_father" )
    {
        e_trap notify( #"trap_deactivate" );
        return;
    }
    
    if ( isdefined( self.var_3e60a85e ) && self.var_3e60a85e )
    {
        return;
    }
    
    self.var_3e60a85e = 1;
    
    if ( isdefined( e_trap.activated_by_player ) && isplayer( e_trap.activated_by_player ) )
    {
        e_trap.activated_by_player zm_stats::increment_challenge_stat( #"zombie_hunter_kill_trap" );
        e_trap.activated_by_player contracts::increment_zm_contract( #"contract_zm_trap_kills" );
        
        if ( isdefined( e_trap.activated_by_player.var_a8049e3d ) )
        {
            e_trap.activated_by_player.var_a8049e3d++;
            e_trap.activated_by_player notify( #"zombie_zapped" );
        }
    }
    
    self fx::play( "werewolfer_impact", self.origin, self.angles, "death" );
    playsoundatposition( #"wpn_zmb_electrap_zap", self.origin );
    
    if ( self.archetype === #"werewolf" )
    {
        self thread zm_traps::electroctute_death_fx();
        self thread zm_traps::play_elec_vocals();
        self function_a3059f6( e_trap );
    }
    else if ( self.archetype === #"zombie" )
    {
        refs[ 0 ] = "guts";
        refs[ 1 ] = "right_arm";
        refs[ 2 ] = "left_arm";
        refs[ 3 ] = "right_leg";
        refs[ 4 ] = "left_leg";
        refs[ 5 ] = "no_legs";
        refs[ 6 ] = "head";
        self.a.gib_ref = refs[ randomint( refs.size ) ];
        
        if ( randomint( 100 ) > 50 )
        {
            self thread zm_traps::electroctute_death_fx();
            self thread zm_traps::play_elec_vocals();
        }
        
        bhtnactionstartevent( self, "electrocute" );
        self notify( #"bhtn_action_notify", { #action:"electrocute" } );
        wait randomfloat( 1.25 );
        self function_a3059f6( e_trap );
    }
    else
    {
        self function_a3059f6( e_trap );
    }
    
    wait 2;
    self.var_3e60a85e = undefined;
}

// Namespace zm_trap_werewolfer/zm_mansion_trap_werewolfer
// Params 1
// Checksum 0x42d20a1b, Offset: 0xe18
// Size: 0x16c
function function_a3059f6( e_trap )
{
    self endon( #"death" );
    [[ level.var_7aa02c24 ]]->waitinqueue( self );
    
    if ( isdefined( self.var_5475b4ad ) )
    {
        self [[ self.var_5475b4ad ]]( e_trap );
        return;
    }
    
    if ( self.archetype === #"werewolf" )
    {
        n_damage = self.health + 100;
    }
    else
    {
        n_damage = 20000;
    }
    
    if ( self.health < n_damage )
    {
        level notify( #"trap_kill", { #victim:self, #e_trap:e_trap } );
        
        if ( self.archetype === #"werewolf" && isdefined( e_trap.activated_by_player ) )
        {
            e_trap.activated_by_player notify( #"hash_510f9114e7a6300c" );
        }
    }
    
    self dodamage( n_damage, e_trap.origin, undefined, e_trap, undefined, "MOD_ELECTROCUTED", 0, undefined );
}

// Namespace zm_trap_werewolfer/zm_mansion_trap_werewolfer
// Params 0
// Checksum 0xfdb703d1, Offset: 0xf90
// Size: 0x118
function function_2b9a3abe()
{
    if ( isdefined( level.var_4fe07a ) )
    {
        if ( level.var_4fe07a._trap_in_use )
        {
            level.var_4fe07a notify( #"trap_done" );
            level.var_4fe07a._trap_cooldown_time = 0.05;
            level.var_4fe07a waittill( #"available" );
        }
        
        if ( level.var_4fe07a._trap_use_trigs.size > 0 )
        {
            foreach ( trig in level.var_4fe07a._trap_use_trigs )
            {
                trig triggerenable( 0 );
            }
        }
    }
}

