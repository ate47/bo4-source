#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\hud_util_shared;
#using scripts\core_common\lui_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm\weapons\zm_weap_blundergat;
#using scripts\zm\zm_escape_util;
#using scripts\zm_common\util\ai_brutus_util;
#using scripts\zm_common\zm;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_crafting;
#using scripts\zm_common\zm_customgame;
#using scripts\zm_common\zm_devgui;
#using scripts\zm_common\zm_items;
#using scripts\zm_common\zm_powerups;
#using scripts\zm_common\zm_ui_inventory;
#using scripts\zm_common\zm_unitrigger;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_weapons;

#namespace namespace_fc5c8455;

// Namespace namespace_fc5c8455/namespace_8d08012b
// Params 0, eflags: 0x2
// Checksum 0xd08f22d2, Offset: 0x320
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"hash_32658a301920c858", &__init__, &__main__, undefined );
}

// Namespace namespace_fc5c8455/namespace_8d08012b
// Params 0
// Checksum 0x280e7bad, Offset: 0x370
// Size: 0x60c
function __init__()
{
    clientfield::register( "scriptmover", "" + #"magma_fireplace_fx", 1, getminbitcountfornum( 4 ), "int" );
    clientfield::register( "scriptmover", "" + #"magma_fireplace_skull_fx", 1, 1, "int" );
    clientfield::register( "scriptmover", "" + #"magma_door_barrier_fx", 1, 1, "int" );
    clientfield::register( "scriptmover", "" + #"magma_glow_fx", 1, 1, "int" );
    clientfield::register( "scriptmover", "" + #"magma_urn_fire_fx", 1, 2, "int" );
    clientfield::register( "scriptmover", "" + #"bg_spawn_fx", 1, 1, "int" );
    clientfield::register( "toplayer", "" + #"magma_gat_glow_override", 1, 1, "int" );
    clientfield::register( "toplayer", "" + #"magma_gat_glow_recharge", 1, 1, "counter" );
    clientfield::register( "toplayer", "" + #"magma_gat_glow_shot_fired", 1, 1, "counter" );
    clientfield::register( "scriptmover", "" + #"magma_essence_explode_fx", 1, 1, "int" );
    clientfield::register( "scriptmover", "" + #"magma_gat_essence_fx", 1, 1, "int" );
    clientfield::register( "scriptmover", "" + #"magma_gat_disappear_fx", 1, 1, "counter" );
    clientfield::register( "scriptmover", "" + #"magma_urn_triggered_fx", 1, 1, "counter" );
    clientfield::register( "scriptmover", "" + #"hash_7692067c56d8b6cc", 1, 2, "int" );
    level.var_8e6fc65e = getentarray( "mg_al_skull", "targetname" );
    level.var_5f506a2b = getent( "mg_ho_vol", "targetname" );
    zm_powerups::set_weapon_ignore_max_ammo( #"ww_blundergat_fire_t8_unfinished" );
    var_e34de65b = struct::get( "mg_door_frame_pos", "targetname" );
    level.var_760f9184 = util::spawn_model( "tag_origin", var_e34de65b.origin, var_e34de65b.angles );
    var_9eb4d270 = struct::get( "mg_fp_pos", "targetname" );
    level.var_cc5631a6 = util::spawn_model( "tag_origin", var_9eb4d270.origin, var_9eb4d270.angles );
    var_dc49a24d = struct::get( "mg_forg_pos", "targetname" );
    level.var_bff24582 = util::spawn_model( "tag_origin", var_dc49a24d.origin, var_dc49a24d.angles );
    level flag::init( #"hash_3ec656e276ceee53" );
    level flag::init( #"hash_3fb7d58b07b04333" );
    level flag::init( #"hash_1d5f5fbf80476490" );
    level flag::init( #"magma_forge_completed" );
    level flag::init( #"hash_5e6097345e223e2d" );
    level.var_19a54d73 = 0;
    scene::add_scene_func( #"aib_vign_zm_mob_smelter_ghost", &function_6672db20, "play" );
}

// Namespace namespace_fc5c8455/namespace_8d08012b
// Params 0
// Checksum 0x6dfe31d6, Offset: 0x988
// Size: 0xf4
function __main__()
{
    if ( !zm_custom::function_901b751c( #"zmwonderweaponisenabled" ) )
    {
        return;
    }
    
    /#
        level thread function_78ca248c();
    #/
    
    level flag::wait_till( "start_zombie_round_logic" );
    var_99f0b8d7 = struct::get_array( "mg_fire_urn", "targetname" );
    array::thread_all( var_99f0b8d7, &function_ff4e7fcd );
    level thread function_d445bc55();
    level thread function_316db647();
    level thread function_b00fd241();
}

// Namespace namespace_fc5c8455/namespace_8d08012b
// Params 0
// Checksum 0x2180771d, Offset: 0xa88
// Size: 0xb4
function function_d445bc55()
{
    var_9eb4d270 = struct::get( "mg_fp_pos" );
    var_9eb4d270.s_unitrigger_stub = var_9eb4d270 zm_unitrigger::create( &function_842d114a, 128, &function_cbe7f871 );
    zm_unitrigger::unitrigger_force_per_player_triggers( var_9eb4d270.s_unitrigger_stub, 1 );
    level.var_cc5631a6 clientfield::set( "" + #"magma_fireplace_fx", 1 );
}

// Namespace namespace_fc5c8455/namespace_8d08012b
// Params 1
// Checksum 0x3a675d6b, Offset: 0xb48
// Size: 0x52a
function function_842d114a( player )
{
    if ( level flag::get( #"magma_forge_completed" ) || level flag::get( #"hash_5e6097345e223e2d" ) )
    {
        return 0;
    }
    
    if ( isdefined( zm_audio::function_fa4dfde0( player.currentweapon ) ) )
    {
        return 0;
    }
    
    if ( ( player hasweapon( getweapon( #"ww_blundergat_t8" ) ) || player hasweapon( getweapon( #"ww_blundergat_t8_upgraded" ) ) || player hasweapon( getweapon( #"ww_blundergat_acid_t8" ) ) || player hasweapon( getweapon( #"ww_blundergat_acid_t8_upgraded" ) ) ) && !isdefined( self.stub.var_bd8af718 ) )
    {
        if ( player hasweapon( getweapon( #"ww_blundergat_t8" ) ) )
        {
            if ( function_8b1a219a() )
            {
                self sethintstring( #"hash_4aaa1b70a31edb6f" );
            }
            else
            {
                self sethintstring( #"hash_6aefb24885426431" );
            }
        }
        else if ( player hasweapon( getweapon( #"ww_blundergat_t8_upgraded" ) ) )
        {
            if ( function_8b1a219a() )
            {
                self sethintstring( #"hash_6363a7fc77e158a4" );
            }
            else
            {
                self sethintstring( #"hash_7755302d416e3168" );
            }
        }
        else if ( player hasweapon( getweapon( #"ww_blundergat_acid_t8" ) ) )
        {
            if ( function_8b1a219a() )
            {
                self sethintstring( #"hash_49c7816541364de0" );
            }
            else
            {
                self sethintstring( #"hash_1875e6c5a3e5e96c" );
            }
        }
        else if ( player hasweapon( getweapon( #"ww_blundergat_acid_t8_upgraded" ) ) )
        {
            if ( function_8b1a219a() )
            {
                self sethintstring( #"hash_66c939cc0e7e3b08" );
            }
            else
            {
                self sethintstring( #"hash_ecb311bfa753664" );
            }
        }
        
        return 1;
    }
    
    if ( isdefined( player.var_b0c0f8bf ) && player.var_b0c0f8bf )
    {
        if ( !level flag::get( #"hash_1d5f5fbf80476490" ) && isdefined( self.stub.var_a29167c5 ) )
        {
            if ( function_8b1a219a() )
            {
                self sethintstring( #"hash_781bc746720b47e3" );
            }
            else
            {
                self sethintstring( #"hash_86231cba8afa1fd" );
            }
            
            return 1;
        }
        else if ( level flag::get( #"hash_1d5f5fbf80476490" ) )
        {
            if ( function_8b1a219a() )
            {
                self sethintstring( #"hash_6413ba5620873f28" );
            }
            else
            {
                self sethintstring( #"hash_6717cabd759589c4" );
            }
            
            return 1;
        }
        else
        {
            return 0;
        }
        
        return;
    }
    
    return 0;
}

// Namespace namespace_fc5c8455/namespace_8d08012b
// Params 0, eflags: 0x4
// Checksum 0xf2903349, Offset: 0x1080
// Size: 0x258
function private function_cbe7f871()
{
    v_weapon_origin_offset = ( 8, -2, 9 );
    v_weapon_angles_offset = ( 0, -90, 0 );
    self.stub.v_weapon_origin = level.var_cc5631a6.origin + v_weapon_origin_offset;
    self.stub.v_weapon_angles = level.var_cc5631a6.angles + v_weapon_angles_offset;
    var_a29167c5 = undefined;
    
    if ( level flag::get( #"hash_3fb7d58b07b04333" ) )
    {
        var_a29167c5 = 1;
    }
    
    while ( true )
    {
        s_result = self waittill( #"trigger" );
        e_player = s_result.activator;
        
        if ( !level flag::get( #"hash_3fb7d58b07b04333" ) && !level flag::get( #"hash_1d5f5fbf80476490" ) )
        {
            self.stub thread function_d74a3faf( e_player );
            continue;
        }
        
        if ( level flag::get( #"hash_3fb7d58b07b04333" ) && !level flag::get( #"hash_1d5f5fbf80476490" ) )
        {
            self.stub thread function_fcf0a319( e_player, var_a29167c5 );
            continue;
        }
        
        if ( level flag::get( #"hash_3fb7d58b07b04333" ) && level flag::get( #"hash_1d5f5fbf80476490" ) )
        {
            self.stub notify( #"hash_38a4480847fe9677", { #activator:e_player } );
        }
    }
}

// Namespace namespace_fc5c8455/namespace_8d08012b
// Params 1
// Checksum 0x490183b3, Offset: 0x12e0
// Size: 0x494
function function_d74a3faf( e_player )
{
    self notify( "4e021117b5553400" );
    self endon( "4e021117b5553400" );
    var_f2528cbc = undefined;
    
    if ( e_player hasweapon( getweapon( #"ww_blundergat_t8" ) ) )
    {
        var_f2528cbc = #"ww_blundergat_t8";
    }
    else if ( e_player hasweapon( getweapon( #"ww_blundergat_t8_upgraded" ) ) )
    {
        var_f2528cbc = #"ww_blundergat_t8_upgraded";
    }
    else if ( e_player hasweapon( getweapon( #"ww_blundergat_acid_t8" ) ) )
    {
        var_f2528cbc = #"ww_blundergat_acid_t8";
        var_da887cb9 = getweapon( #"ww_blundergat_acid_t8" );
    }
    else if ( e_player hasweapon( getweapon( #"ww_blundergat_acid_t8_upgraded" ) ) )
    {
        var_f2528cbc = #"ww_blundergat_acid_t8_upgraded";
        var_da887cb9 = getweapon( #"ww_blundergat_acid_t8_upgraded" );
    }
    
    if ( isdefined( var_da887cb9 ) )
    {
        e_player.var_452feb6c = e_player getweaponammostock( var_da887cb9 );
    }
    
    if ( isdefined( var_f2528cbc ) )
    {
        e_player.var_22b64976 = var_f2528cbc;
        e_player takeweapon( getweapon( var_f2528cbc ) );
        e_player.var_95afb037 = 1;
        self.var_bd8af718 = 1;
        self.e_player = e_player;
        level.var_19a54d73 = 0;
        
        if ( !( isdefined( e_player.intermission ) && e_player.intermission ) && !( isdefined( e_player.is_drinking ) && e_player.is_drinking ) )
        {
            e_player zm_weapons::switch_back_primary_weapon();
        }
        
        exploder::exploder( "fxexplo_magma_window_barrier_fx" );
        level.var_cc5631a6 clientfield::set( "" + #"magma_fireplace_fx", 1 );
        playsoundatposition( #"hash_2c4234f291620027", self.origin );
        self.var_607f49de = zm_utility::spawn_weapon_model( getweapon( var_f2528cbc ), undefined, self.v_weapon_origin, self.v_weapon_angles );
        self.var_607f49de thread scene::play( #"p8_fxanim_zm_esc_blundergat_fireplace_hover_bundle", self.var_607f49de );
        level flag::clear( #"hash_3ec656e276ceee53" );
        e_player thread function_4022d369( self );
        e_player thread function_8b619951();
        e_player function_181eb502();
        
        if ( isalive( e_player ) && level flag::get( #"hash_3fb7d58b07b04333" ) )
        {
            var_a29167c5 = 1;
            self.var_a29167c5 = 1;
            e_player.var_b0c0f8bf = 1;
            return;
        }
        
        self function_599013ad( e_player, 1 );
        playsoundatposition( #"hash_65b4e7aafb64c1a1", ( 0, 0, 0 ) );
    }
}

// Namespace namespace_fc5c8455/namespace_8d08012b
// Params 2
// Checksum 0x7b56301a, Offset: 0x1780
// Size: 0x21c
function function_fcf0a319( e_player, var_a29167c5 )
{
    self notify( "c470e33374ac8b5" );
    self endon( "c470e33374ac8b5" );
    
    if ( isdefined( self.var_607f49de ) )
    {
        self.var_607f49de delete();
    }
    
    self.var_607f49de = zm_utility::spawn_weapon_model( getweapon( #"ww_blundergat_fire_t8_unfinished" ), undefined, self.v_weapon_origin, self.v_weapon_angles );
    self.var_a29167c5 = undefined;
    level.var_cc5631a6 function_d586e457();
    level flag::set( #"hash_1d5f5fbf80476490" );
    
    if ( isalive( e_player ) )
    {
        self thread function_11efbb03( e_player );
        self thread wait_for_timeout( e_player, var_a29167c5 );
        var_2b94e3bb = self waittill( #"magma_timeout", #"magma_taken" );
    }
    
    if ( isalive( e_player ) )
    {
        e_player.var_95afb037 = undefined;
        e_player.var_b0c0f8bf = undefined;
    }
    
    self.var_bd8af718 = undefined;
    self.var_a29167c5 = undefined;
    self.e_player = undefined;
    
    if ( isdefined( var_2b94e3bb ) && var_2b94e3bb._notify == #"magma_timeout" )
    {
        self function_599013ad( e_player, 1 );
        playsoundatposition( #"hash_65b4e7aafb64c1a1", ( 0, 0, 0 ) );
    }
}

// Namespace namespace_fc5c8455/namespace_8d08012b
// Params 2
// Checksum 0x55aae0c6, Offset: 0x19a8
// Size: 0x182
function function_599013ad( e_player, var_98fbd60e )
{
    level notify( #"hash_fd8be2ffb55eaf7" );
    level.var_19a54d73 = 0;
    function_a057cdf0();
    exploder::stop_exploder( "fxexplo_magma_window_barrier_fx" );
    level.var_cc5631a6 clientfield::set( "" + #"magma_fireplace_fx", 1 );
    level flag::clear( #"hash_3fb7d58b07b04333" );
    level flag::clear( #"hash_1d5f5fbf80476490" );
    level flag::clear( #"hash_3ec656e276ceee53" );
    
    if ( isdefined( self.var_607f49de ) )
    {
        if ( isdefined( var_98fbd60e ) && var_98fbd60e )
        {
            self thread magma_gat_disappear_fx();
        }
        
        self.var_607f49de delete();
    }
    
    self.var_bd8af718 = undefined;
    self.var_a29167c5 = undefined;
    
    if ( isdefined( e_player ) )
    {
        e_player.var_22b64976 = undefined;
        e_player.var_13a24eee = undefined;
        e_player.var_b0c0f8bf = undefined;
    }
}

// Namespace namespace_fc5c8455/namespace_8d08012b
// Params 0
// Checksum 0xd6604167, Offset: 0x1b38
// Size: 0xb8
function function_a057cdf0()
{
    foreach ( mdl_skull in level.var_8e6fc65e )
    {
        mdl_skull setmodel( "p8_zm_esc_skull_sgl" );
        mdl_skull clientfield::set( "" + #"magma_fireplace_skull_fx", 0 );
    }
}

// Namespace namespace_fc5c8455/namespace_8d08012b
// Params 0
// Checksum 0x399182fa, Offset: 0x1bf8
// Size: 0xb4
function magma_gat_disappear_fx()
{
    var_ce2c859d = util::spawn_model( "tag_origin", self.v_weapon_origin, self.v_weapon_angles );
    
    if ( isdefined( var_ce2c859d ) )
    {
        var_ce2c859d endon( #"death" );
        util::wait_network_frame();
        var_ce2c859d clientfield::increment( "" + #"magma_gat_disappear_fx" );
        wait 3;
        var_ce2c859d delete();
    }
}

// Namespace namespace_fc5c8455/namespace_8d08012b
// Params 0
// Checksum 0x59d0822c, Offset: 0x1cb8
// Size: 0x184
function function_d586e457()
{
    level endon( #"hash_fd8be2ffb55eaf7" );
    var_ec3ff08c = array::sort_by_script_int( level.var_8e6fc65e, 0 );
    
    foreach ( mdl_skull in var_ec3ff08c )
    {
        mdl_skull setmodel( "p8_zm_esc_skull_sgl" );
        mdl_skull clientfield::set( "" + #"magma_fireplace_skull_fx", 0 );
        wait 0.5;
    }
    
    wait 0.5;
    self clientfield::set( "" + #"magma_fireplace_fx", 4 );
    playsoundatposition( #"hash_5642bd4cb9f030d7", self.origin );
    wait 1;
    self clientfield::set( "" + #"magma_fireplace_fx", 3 );
}

// Namespace namespace_fc5c8455/namespace_8d08012b
// Params 1, eflags: 0x4
// Checksum 0x77f19ddb, Offset: 0x1e48
// Size: 0x2c2
function private function_11efbb03( e_player )
{
    self endon( #"magma_timeout" );
    e_player endon( #"disconnect" );
    
    while ( true )
    {
        s_result = self waittill( #"hash_38a4480847fe9677" );
        
        if ( s_result.activator == e_player )
        {
            if ( zm_utility::can_use( e_player, 1 ) && e_player.currentweapon.name != "none" )
            {
                self notify( #"magma_taken" );
                e_player notify( #"magma_taken" );
                var_287a8343 = zm_utility::get_player_weapon_limit( e_player );
                a_primaries = e_player getweaponslistprimaries();
                
                if ( isdefined( a_primaries ) && a_primaries.size >= var_287a8343 )
                {
                    e_player takeweapon( e_player.currentweapon );
                }
                
                e_player giveweapon( getweapon( #"ww_blundergat_fire_t8_unfinished" ) );
                e_player switchtoweapon( getweapon( #"ww_blundergat_fire_t8_unfinished" ) );
                e_player clientfield::set_to_player( "" + #"magma_gat_glow_override", 1 );
                e_player.var_1ea09849 = 1;
                level notify( #"hash_575b654fc5c59146", { #e_player:e_player } );
                level flag::set( #"hash_5e6097345e223e2d" );
                e_player zm_audio::create_and_play_dialog( #"weapon_pickup", #"magmagat_unfinished" );
                e_player thread function_6222e98f();
                self function_599013ad( undefined, undefined );
                exploder::exploder( "blue_fire" );
                return;
            }
        }
    }
}

// Namespace namespace_fc5c8455/namespace_8d08012b
// Params 2, eflags: 0x4
// Checksum 0x83ecf9d0, Offset: 0x2118
// Size: 0x72
function private wait_for_timeout( e_player, var_9bce3ebf )
{
    self endon( #"magma_taken" );
    
    if ( isdefined( var_9bce3ebf ) && var_9bce3ebf )
    {
        wait 30;
    }
    else
    {
        wait 30;
    }
    
    self notify( #"magma_timeout" );
    
    if ( isdefined( e_player ) )
    {
        e_player.var_22b64976 = undefined;
    }
}

// Namespace namespace_fc5c8455/namespace_8d08012b
// Params 0
// Checksum 0xdda15518, Offset: 0x2198
// Size: 0x11c
function function_181eb502()
{
    self endoncallback( &function_6eca1fcc, #"disconnect" );
    level.var_760f9184 thread clientfield::set( "" + #"magma_door_barrier_fx", 1 );
    callback::on_ai_killed( &function_ed30e654 );
    s_result = level flag::wait_till_any( array( #"hash_3ec656e276ceee53", #"hash_3fb7d58b07b04333" ) );
    callback::remove_on_ai_killed( &function_ed30e654 );
    level.var_760f9184 thread clientfield::set( "" + #"magma_door_barrier_fx", 0 );
    wait 1;
}

// Namespace namespace_fc5c8455/namespace_8d08012b
// Params 1
// Checksum 0xb0009b7b, Offset: 0x22c0
// Size: 0x96
function function_6eca1fcc( str_notify )
{
    callback::remove_on_ai_killed( &function_ed30e654 );
    level flag::set( #"hash_3ec656e276ceee53" );
    var_9eb4d270 = struct::get( "mg_fp_pos" );
    var_9eb4d270.s_unitrigger_stub.var_a29167c5 = undefined;
    var_9eb4d270.s_unitrigger_stub.e_player = undefined;
}

// Namespace namespace_fc5c8455/namespace_8d08012b
// Params 1
// Checksum 0xac88988, Offset: 0x2360
// Size: 0xb4
function function_ed30e654( s_params )
{
    if ( self.archetype != #"zombie" && self.archetype != #"zombie_dog" && self.archetype != #"brutus" )
    {
        return;
    }
    
    if ( isplayer( s_params.eattacker ) && self istouching( level.var_5f506a2b ) )
    {
        self thread function_1ff8ba1();
    }
}

// Namespace namespace_fc5c8455/namespace_8d08012b
// Params 0
// Checksum 0x41b47488, Offset: 0x2420
// Size: 0x154
function function_1ff8ba1()
{
    var_88f24b00 = util::spawn_model( "tag_origin", self.origin + ( 0, 0, 22 ), self.angles );
    var_88f24b00 endon( #"death" );
    var_146228fb = spawn( "trigger_radius", self.origin, 0, 24, 96 );
    var_146228fb setvisibletoteam( util::get_enemy_team( self.team ) );
    var_146228fb setteamfortrigger( util::get_enemy_team( self.team ) );
    var_146228fb thread function_9689b55c( var_88f24b00 );
    var_88f24b00 thread function_dd30dc9a( var_146228fb );
    var_88f24b00 thread function_ce0bd88a( var_146228fb );
    
    while ( isdefined( var_146228fb ) )
    {
        wait 0.25;
    }
    
    var_88f24b00 delete();
}

// Namespace namespace_fc5c8455/namespace_8d08012b
// Params 1
// Checksum 0x535440b1, Offset: 0x2580
// Size: 0x4b0
function function_9689b55c( var_88f24b00 )
{
    self endon( #"death" );
    var_88f24b00 endon( #"death" );
    var_39662a63 = int( 5 );
    
    foreach ( mdl_skull in level.var_8e6fc65e )
    {
        if ( mdl_skull.script_int == 0 )
        {
            var_ddbc98df = mdl_skull;
            continue;
        }
        
        if ( mdl_skull.script_int == 1 )
        {
            var_f697c38 = mdl_skull;
            continue;
        }
        
        var_b9484ff7 = mdl_skull;
    }
    
    while ( true )
    {
        s_result = self waittill( #"trigger" );
        
        if ( isplayer( s_result.activator ) )
        {
            level.var_19a54d73++;
            s_result.activator playsound( #"hash_7924de0ae1c7e3c7" );
            
            if ( level.var_19a54d73 == var_39662a63 )
            {
                var_ddbc98df setmodel( "p8_zm_esc_skull_afterlife" );
                var_ddbc98df thread clientfield::set( "" + #"magma_fireplace_skull_fx", 1 );
                var_ddbc98df playsound( #"hash_4fad63fcdab19a1d" );
            }
            else if ( level.var_19a54d73 == var_39662a63 * 2 )
            {
                var_f697c38 setmodel( "p8_zm_esc_skull_afterlife" );
                var_f697c38 thread clientfield::set( "" + #"magma_fireplace_skull_fx", 1 );
                var_f697c38 playsound( #"hash_4fad63fcdab19a1d" );
            }
            else if ( level.var_19a54d73 >= 15 )
            {
                var_b9484ff7 setmodel( "p8_zm_esc_skull_afterlife" );
                var_b9484ff7 thread clientfield::set( "" + #"magma_fireplace_skull_fx", 1 );
                var_b9484ff7 playsound( #"hash_57188d77b17d82ca" );
                level.var_cc5631a6 clientfield::set( "" + #"magma_fireplace_fx", 2 );
                exploder::exploder_stop( "fxexplo_magma_window_barrier_fx" );
                level flag::set( #"hash_3fb7d58b07b04333" );
                var_9eb4d270 = struct::get( "mg_fp_pos" );
                var_9eb4d270.s_unitrigger_stub.var_a29167c5 = 1;
                
                if ( isdefined( var_9eb4d270.s_unitrigger_stub.e_player ) )
                {
                    var_9eb4d270.s_unitrigger_stub.e_player.var_b0c0f8bf = 1;
                }
            }
            
            var_88f24b00 clientfield::set( "" + #"magma_gat_essence_fx", 0 );
            var_88f24b00 clientfield::set( "" + #"magma_essence_explode_fx", 1 );
            
            if ( isdefined( self ) )
            {
                self delete();
            }
        }
    }
}

// Namespace namespace_fc5c8455/namespace_8d08012b
// Params 1
// Checksum 0x1e861d38, Offset: 0x2a38
// Size: 0x70
function function_dd30dc9a( var_146228fb )
{
    self endon( #"death" );
    self clientfield::set( "" + #"magma_gat_essence_fx", 1 );
    
    while ( isdefined( var_146228fb ) )
    {
        self zm_escape_util::make_wobble();
    }
}

// Namespace namespace_fc5c8455/namespace_8d08012b
// Params 1
// Checksum 0x25ebd26e, Offset: 0x2ab0
// Size: 0xc4
function function_ce0bd88a( var_146228fb )
{
    self endon( #"death" );
    self movez( 36, 3 );
    wait 3;
    
    if ( isdefined( var_146228fb ) )
    {
        var_146228fb delete();
    }
    
    self clientfield::set( "" + #"magma_gat_essence_fx", 0 );
    playsoundatposition( #"hash_279a376468c0749c", self.origin );
    self delete();
}

// Namespace namespace_fc5c8455/namespace_8d08012b
// Params 1
// Checksum 0x414744f4, Offset: 0x2b80
// Size: 0xbc
function function_4022d369( var_6282581e )
{
    level endon( #"hash_3ec656e276ceee53" );
    self endon( #"magma_taken" );
    self waittill( #"death", #"disconnect" );
    
    if ( level flag::get( #"hash_3fb7d58b07b04333" ) )
    {
        var_6282581e function_599013ad( self, 1 );
    }
    
    level flag::set( #"hash_3ec656e276ceee53" );
}

// Namespace namespace_fc5c8455/namespace_8d08012b
// Params 0
// Checksum 0x1d1c6c22, Offset: 0x2c48
// Size: 0x128
function function_8b619951()
{
    level endon( #"hash_3ec656e276ceee53" );
    
    while ( !level flag::get( #"hash_3fb7d58b07b04333" ) )
    {
        if ( !self istouching( level.var_5f506a2b ) )
        {
            if ( !isdefined( self.var_13a24eee ) )
            {
                self.var_13a24eee = 0;
            }
            else
            {
                self.var_13a24eee++;
                
                if ( self.var_13a24eee >= 30 )
                {
                    level flag::set( #"hash_3ec656e276ceee53" );
                }
                else if ( self.var_13a24eee >= 10 && level.var_19a54d73 > 0 )
                {
                    level.var_19a54d73 = 0;
                    function_a057cdf0();
                }
            }
        }
        else
        {
            self.var_13a24eee = 0;
        }
        
        wait 1;
    }
}

// Namespace namespace_fc5c8455/namespace_8d08012b
// Params 0
// Checksum 0x5fe7f645, Offset: 0x2d78
// Size: 0x2be
function function_6222e98f()
{
    if ( !isdefined( self ) )
    {
        return;
    }
    
    self thread function_95a4deeb();
    self thread function_6b09dab1();
    self thread function_7f19d274();
    self.n_cooldown_time = 25;
    
    while ( isdefined( self ) && self.n_cooldown_time > 0 && isdefined( self.var_1ea09849 ) && self.var_1ea09849 )
    {
        self.n_cooldown_time -= 0.5;
        wait 0.5;
    }
    
    if ( !isdefined( self ) )
    {
        return;
    }
    
    if ( isdefined( self.var_1ea09849 ) && self.var_1ea09849 && self.n_cooldown_time <= 0 )
    {
        if ( self hasweapon( getweapon( #"ww_blundergat_fire_t8_unfinished" ) ) )
        {
            self clientfield::set_to_player( "" + #"magma_gat_glow_override", 0 );
            self takeweapon( getweapon( #"ww_blundergat_fire_t8_unfinished" ) );
            playsoundatposition( #"hash_65b4e7aafb64c1a1", ( 0, 0, 0 ) );
        }
        
        if ( isdefined( self.var_22b64976 ) )
        {
            self giveweapon( getweapon( self.var_22b64976 ) );
            self switchtoweapon( getweapon( self.var_22b64976 ) );
            self zm_audio::create_and_play_dialog( #"magmagat", #"burnout", undefined, 1 );
            self.var_22b64976 = undefined;
        }
        
        self.var_1ea09849 = undefined;
        self notify( #"hash_3c807aeefe7734fa" );
        function_e1f2fb39();
        self notify( #"hash_2c23d48f0925d266" );
        level flag::clear( #"hash_5e6097345e223e2d" );
    }
    
    self.n_cooldown_time = undefined;
}

// Namespace namespace_fc5c8455/namespace_8d08012b
// Params 0
// Checksum 0xebb366c7, Offset: 0x3040
// Size: 0x2a2
function function_95a4deeb()
{
    self endon( #"death", #"disconnect", #"hash_5dc448a84a24492", #"hash_2c23d48f0925d266" );
    
    while ( true )
    {
        s_result = self waittill( #"weapon_change", #"player_downed" );
        
        if ( s_result._notify === "player_downed" )
        {
            b_player_downed = 1;
        }
        else
        {
            wait 0.1;
        }
        
        if ( isdefined( self.var_6417e645 ) && self.var_6417e645 )
        {
            continue;
        }
        
        if ( !( isdefined( b_player_downed ) && b_player_downed ) && s_result.last_weapon !== getweapon( #"ww_blundergat_fire_t8_unfinished" ) )
        {
            continue;
        }
        
        if ( self hasweapon( getweapon( #"ww_blundergat_fire_t8_unfinished" ) ) )
        {
            self clientfield::set_to_player( "" + #"magma_gat_glow_override", 0 );
            self takeweapon( getweapon( #"ww_blundergat_fire_t8_unfinished" ) );
            playsoundatposition( #"hash_65b4e7aafb64c1a1", ( 0, 0, 0 ) );
        }
        
        if ( isdefined( self.var_22b64976 ) )
        {
            self giveweapon( getweapon( self.var_22b64976 ) );
            self switchtoweapon( getweapon( self.var_22b64976 ) );
            self.var_22b64976 = undefined;
        }
        
        level flag::clear( #"hash_5e6097345e223e2d" );
        function_e1f2fb39();
        self.var_1ea09849 = undefined;
        self notify( #"hash_3c807aeefe7734fa" );
        self notify( #"hash_2c23d48f0925d266" );
    }
}

// Namespace namespace_fc5c8455/namespace_8d08012b
// Params 0
// Checksum 0x3fdf1eb4, Offset: 0x32f0
// Size: 0x1dc
function function_6b09dab1()
{
    self endon( #"death", #"disconnect", #"hash_5dc448a84a24492", #"hash_2c23d48f0925d266" );
    self waittill( #"fasttravel_over" );
    
    if ( self hasweapon( getweapon( #"ww_blundergat_fire_t8_unfinished" ) ) )
    {
        self clientfield::set_to_player( "" + #"magma_gat_glow_override", 0 );
        self takeweapon( getweapon( #"ww_blundergat_fire_t8_unfinished" ) );
        playsoundatposition( #"hash_65b4e7aafb64c1a1", ( 0, 0, 0 ) );
        
        if ( isdefined( self.var_22b64976 ) )
        {
            self giveweapon( getweapon( self.var_22b64976 ) );
            self switchtoweapon( getweapon( self.var_22b64976 ) );
            self.var_22b64976 = undefined;
        }
        
        function_e1f2fb39();
        self.var_1ea09849 = undefined;
        self notify( #"hash_3c807aeefe7734fa" );
        self notify( #"hash_2c23d48f0925d266" );
        level flag::clear( #"hash_5e6097345e223e2d" );
    }
}

// Namespace namespace_fc5c8455/namespace_8d08012b
// Params 0
// Checksum 0xdeff2d02, Offset: 0x34d8
// Size: 0x140
function function_7f19d274()
{
    self endon( #"death", #"disconnect", #"hash_5dc448a84a24492", #"hash_2c23d48f0925d266" );
    
    while ( true )
    {
        s_result = self waittill( #"weapon_fired" );
        
        if ( s_result.weapon == getweapon( #"ww_blundergat_fire_t8_unfinished" ) )
        {
            assert( isdefined( self.n_cooldown_time ), "<dev string:x38>" );
            self.n_cooldown_time -= 6;
            self clientfield::increment_to_player( "" + #"magma_gat_glow_shot_fired" );
            self givemaxammo( getweapon( #"ww_blundergat_fire_t8_unfinished" ) );
        }
    }
}

// Namespace namespace_fc5c8455/namespace_8d08012b
// Params 0
// Checksum 0x321be5af, Offset: 0x3620
// Size: 0x160
function function_ff4e7fcd()
{
    var_ff554ec = util::spawn_model( "tag_origin", self.origin, self.angles );
    self.s_unitrigger_stub = self zm_unitrigger::create( &function_bc77319a, 64, &function_3e6b7a2d, 0 );
    self.s_unitrigger_stub.var_ff554ec = var_ff554ec;
    self.var_ff554ec = var_ff554ec;
    wait 0.4;
    var_ff554ec clientfield::set( "" + #"magma_urn_fire_fx", 1 );
    
    while ( true )
    {
        s_result = level waittill( #"hash_575b654fc5c59146" );
        
        if ( isplayer( s_result.e_player ) )
        {
            var_ff554ec clientfield::set( "" + #"magma_urn_fire_fx", 2 );
        }
    }
}

// Namespace namespace_fc5c8455/namespace_8d08012b
// Params 1
// Checksum 0xc9a830d8, Offset: 0x3788
// Size: 0x3a
function function_bc77319a( player )
{
    if ( isdefined( player.var_1ea09849 ) && player.var_1ea09849 )
    {
        return 1;
    }
    
    return 0;
}

// Namespace namespace_fc5c8455/namespace_8d08012b
// Params 0
// Checksum 0x79a1dec8, Offset: 0x37d0
// Size: 0x2a0
function function_3e6b7a2d()
{
    var_fbab1c11 = undefined;
    
    while ( true )
    {
        var_d249c0e6 = 25;
        n_power = var_d249c0e6;
        s_result = self waittill( #"trigger" );
        e_player = s_result.activator;
        
        if ( isdefined( e_player.var_1ea09849 ) && e_player.var_1ea09849 && var_d249c0e6 > 0 )
        {
            self.stub.var_ff554ec clientfield::increment( "" + #"magma_urn_triggered_fx" );
            self.stub.var_ff554ec clientfield::set( "" + #"magma_urn_fire_fx", 0 );
            
            if ( isdefined( e_player.n_cooldown_time ) )
            {
                if ( e_player.n_cooldown_time + n_power > 25 )
                {
                    e_player.n_cooldown_time = 25;
                }
                else
                {
                    e_player.n_cooldown_time += n_power;
                }
            }
            
            var_d249c0e6 = 0;
            
            if ( isalive( e_player ) && isdefined( e_player.var_1ea09849 ) && e_player.var_1ea09849 )
            {
                e_player clientfield::increment_to_player( "" + #"magma_gat_glow_recharge" );
                e_player givemaxammo( getweapon( #"ww_blundergat_fire_t8_unfinished" ) );
                
                if ( !( isdefined( e_player.var_a40e9d01 ) && e_player.var_a40e9d01 ) )
                {
                    e_player.var_a40e9d01 = 1;
                    e_player thread function_e02f6600();
                    e_player zm_audio::create_and_play_dialog( #"magmagat", #"reheat", undefined, 1 );
                }
            }
            
            level waittill( #"hash_575b654fc5c59146" );
        }
    }
}

// Namespace namespace_fc5c8455/namespace_8d08012b
// Params 0, eflags: 0x4
// Checksum 0xa69e9d26, Offset: 0x3a78
// Size: 0x2a
function private function_e02f6600()
{
    self endon( #"disconnect" );
    wait 45;
    self.var_a40e9d01 = undefined;
}

// Namespace namespace_fc5c8455/namespace_8d08012b
// Params 0
// Checksum 0x41af3fdb, Offset: 0x3ab0
// Size: 0xdc
function function_e1f2fb39()
{
    var_99f0b8d7 = struct::get_array( "mg_fire_urn", "targetname" );
    
    foreach ( var_1fb87b8e in var_99f0b8d7 )
    {
        var_1fb87b8e.var_ff554ec clientfield::set( "" + #"magma_urn_fire_fx", 1 );
    }
    
    exploder::stop_exploder( "blue_fire" );
}

// Namespace namespace_fc5c8455/namespace_8d08012b
// Params 0
// Checksum 0xda51823b, Offset: 0x3b98
// Size: 0xa4
function function_316db647()
{
    var_dc49a24d = struct::get( "mg_forg_pos" );
    var_dc49a24d = struct::get( var_dc49a24d.target );
    var_dc49a24d.s_unitrigger_stub = var_dc49a24d zm_unitrigger::create( &function_77e65267, 80, &function_d3db303d, 1 );
    zm_unitrigger::unitrigger_force_per_player_triggers( var_dc49a24d.s_unitrigger_stub );
}

// Namespace namespace_fc5c8455/namespace_8d08012b
// Params 1
// Checksum 0x9caeb125, Offset: 0x3c48
// Size: 0x59a
function function_77e65267( player )
{
    if ( isdefined( zm_audio::function_fa4dfde0( player.currentweapon ) ) )
    {
        return 0;
    }
    
    if ( player hasweapon( getweapon( #"ww_blundergat_fire_t8_unfinished" ) ) && !isdefined( self.stub.var_cec3094a ) )
    {
        if ( function_8b1a219a() )
        {
            self sethintstring( #"hash_4aaa1b70a31edb6f" );
        }
        else
        {
            self sethintstring( #"hash_6aefb24885426431" );
        }
        
        return 1;
    }
    
    if ( ( player hasweapon( getweapon( #"ww_blundergat_t8" ) ) || player hasweapon( getweapon( #"ww_blundergat_t8_upgraded" ) ) || player hasweapon( getweapon( #"ww_blundergat_acid_t8" ) ) || player hasweapon( getweapon( #"ww_blundergat_acid_t8_upgraded" ) ) ) && level flag::get( #"magma_forge_completed" ) && !isdefined( self.stub.var_cec3094a ) )
    {
        if ( player hasweapon( getweapon( #"ww_blundergat_t8" ) ) )
        {
            if ( function_8b1a219a() )
            {
                self sethintstring( #"hash_4aaa1b70a31edb6f" );
            }
            else
            {
                self sethintstring( #"hash_6aefb24885426431" );
            }
        }
        else if ( player hasweapon( getweapon( #"ww_blundergat_t8_upgraded" ) ) )
        {
            if ( function_8b1a219a() )
            {
                self sethintstring( #"hash_6363a7fc77e158a4" );
            }
            else
            {
                self sethintstring( #"hash_7755302d416e3168" );
            }
        }
        else if ( player hasweapon( getweapon( #"ww_blundergat_acid_t8" ) ) )
        {
            if ( function_8b1a219a() )
            {
                self sethintstring( #"hash_49c7816541364de0" );
            }
            else
            {
                self sethintstring( #"hash_1875e6c5a3e5e96c" );
            }
        }
        else if ( player hasweapon( getweapon( #"ww_blundergat_acid_t8_upgraded" ) ) )
        {
            if ( function_8b1a219a() )
            {
                self sethintstring( #"hash_66c939cc0e7e3b08" );
            }
            else
            {
                self sethintstring( #"hash_ecb311bfa753664" );
            }
        }
        
        return 1;
    }
    
    if ( isdefined( self.stub.var_154419fd ) && self.stub.var_154419fd && isdefined( player.var_6417e645 ) && player.var_6417e645 )
    {
        if ( self.stub.var_515e20e6 )
        {
            if ( function_8b1a219a() )
            {
                self sethintstring( #"hash_e737d245c39d9ea" );
            }
            else
            {
                self sethintstring( #"hash_293170106f0832fe" );
            }
        }
        else if ( function_8b1a219a() )
        {
            self sethintstring( #"hash_4734e26452e1c11b" );
        }
        else
        {
            self sethintstring( #"hash_14afad0ad7a156a5" );
        }
        
        return 1;
    }
    
    return 0;
}

// Namespace namespace_fc5c8455/namespace_8d08012b
// Params 0
// Checksum 0x3ecea4ea, Offset: 0x41f0
// Size: 0x8a0
function function_d3db303d()
{
    v_weapon_origin_offset = ( 0, 0, 9 );
    v_weapon_angles_offset = ( 0, -90, 0 );
    self.stub.v_weapon_origin = level.var_bff24582.origin + anglestoforward( level.var_bff24582.angles ) * 15 + v_weapon_origin_offset;
    self.stub.v_weapon_angles = level.var_bff24582.angles + v_weapon_angles_offset;
    
    while ( true )
    {
        s_result = self waittill( #"trigger" );
        e_player = s_result.activator;
        var_fc074136 = undefined;
        
        if ( !( isdefined( self.stub.var_154419fd ) && self.stub.var_154419fd ) )
        {
            if ( !level flag::get( #"magma_forge_completed" ) )
            {
                if ( e_player hasweapon( getweapon( #"ww_blundergat_fire_t8_unfinished" ) ) )
                {
                    var_fc074136 = #"ww_blundergat_fire_t8_unfinished";
                }
            }
            else if ( e_player hasweapon( getweapon( #"ww_blundergat_t8" ) ) )
            {
                var_fc074136 = #"ww_blundergat_t8";
            }
            else if ( e_player hasweapon( getweapon( #"ww_blundergat_t8_upgraded" ) ) )
            {
                var_fc074136 = #"ww_blundergat_t8_upgraded";
            }
            else if ( e_player hasweapon( getweapon( #"ww_blundergat_acid_t8" ) ) )
            {
                var_fc074136 = #"ww_blundergat_acid_t8";
            }
            else if ( e_player hasweapon( getweapon( #"ww_blundergat_acid_t8_upgraded" ) ) )
            {
                var_fc074136 = #"ww_blundergat_acid_t8_upgraded";
            }
            
            if ( isdefined( var_fc074136 ) )
            {
                self.stub.var_cec3094a = 1;
                
                if ( var_fc074136 == #"ww_blundergat_fire_t8_unfinished" )
                {
                    e_player clientfield::set_to_player( "" + #"magma_gat_glow_override", 0 );
                }
                else
                {
                    var_da887cb9 = getweapon( var_fc074136 );
                    e_player.var_452feb6c = e_player getweaponammostock( var_da887cb9 );
                }
                
                e_player thread zm_audio::create_and_play_dialog( #"success_resp", #"generic" );
                e_player takeweapon( getweapon( var_fc074136 ) );
                e_player.var_6417e645 = 1;
                e_player.var_1ea09849 = undefined;
                e_player notify( #"hash_3c807aeefe7734fa" );
                e_player notify( #"hash_5dc448a84a24492" );
                
                if ( isplayer( e_player ) && !( isdefined( e_player.intermission ) && e_player.intermission ) && !( isdefined( e_player.is_drinking ) && e_player.is_drinking ) )
                {
                    e_player zm_weapons::switch_back_primary_weapon();
                }
                
                self.stub.var_607f49de = zm_utility::spawn_weapon_model( getweapon( var_fc074136 ), undefined, self.stub.v_weapon_origin, self.stub.v_weapon_angles );
                self.stub.e_player = e_player;
                var_25b99c94 = struct::get( "s_ni_mach" );
                var_25b99c94 thread scene::play();
                level notify( #"hash_5dc448a84a24492" );
                function_e1f2fb39();
                self.stub thread function_e672cf9( e_player, var_fc074136 );
                self.stub thread function_ecc34f71( e_player );
            }
            
            continue;
        }
        
        if ( e_player == self.stub.e_player )
        {
            if ( zm_utility::can_use( e_player, 1 ) && e_player.currentweapon.name != "none" )
            {
                self.stub notify( #"magma_taken" );
                e_player notify( #"magma_taken" );
                var_287a8343 = zm_utility::get_player_weapon_limit( e_player );
                a_primaries = e_player getweaponslistprimaries();
                
                if ( isdefined( a_primaries ) && a_primaries.size >= var_287a8343 )
                {
                    e_player takeweapon( e_player.currentweapon );
                }
                
                if ( isdefined( self.stub.var_515e20e6 ) && self.stub.var_515e20e6 )
                {
                    var_f2fae71a = getweapon( #"ww_blundergat_fire_t8_upgraded" );
                }
                else
                {
                    var_f2fae71a = getweapon( #"ww_blundergat_fire_t8" );
                }
                
                e_player giveweapon( var_f2fae71a );
                e_player switchtoweapon( var_f2fae71a );
                
                if ( isdefined( e_player.var_452feb6c ) )
                {
                    e_player setweaponammostock( var_f2fae71a, math::clamp( e_player.var_452feb6c, 0, var_f2fae71a.maxammo ) );
                    e_player.var_452feb6c = undefined;
                }
                
                e_player thread zm_audio::create_and_play_dialog( #"weapon_pickup", #"magmagat" );
                e_player notify( #"hash_6e0a27b37f225a25" );
                self.stub.var_154419fd = undefined;
                
                if ( isdefined( e_player ) )
                {
                    e_player.var_6417e645 = undefined;
                    e_player.var_22b64976 = undefined;
                }
                
                if ( !level flag::get( #"magma_forge_completed" ) )
                {
                    zombie_brutus_util::attempt_brutus_spawn( 1, "zone_new_industries" );
                }
                
                level flag::set( #"magma_forge_completed" );
                self.stub.var_cec3094a = undefined;
                self.stub.var_515e20e6 = 0;
                self.stub.e_player = undefined;
                
                if ( isdefined( self.stub.var_607f49de ) )
                {
                    self.stub.var_607f49de delete();
                }
            }
        }
    }
}

// Namespace namespace_fc5c8455/namespace_8d08012b
// Params 2
// Checksum 0x64eb6888, Offset: 0x4a98
// Size: 0x234
function function_e672cf9( e_player, var_fc074136 )
{
    self endon( #"magma_taken" );
    level waittill( #"smelter_press" );
    self.var_607f49de ghost();
    level waittill( #"smelter_show" );
    self.var_607f49de show();
    
    if ( isdefined( e_player ) )
    {
        self.var_154419fd = 1;
        self.var_515e20e6 = 0;
        
        if ( !level flag::get( #"magma_forge_completed" ) )
        {
            self.var_515e20e6 = self function_a6a91f7a( e_player.var_22b64976 );
        }
        else
        {
            self.var_515e20e6 = self function_a6a91f7a( var_fc074136 );
        }
        
        self thread wait_for_timeout( e_player );
        s_result = self waittill( #"magma_timeout" );
        playsoundatposition( #"hash_65b4e7aafb64c1a1", ( 0, 0, 0 ) );
        level flag::clear( #"hash_5e6097345e223e2d" );
        
        if ( isdefined( self.e_player ) )
        {
            self.e_player.var_6417e645 = undefined;
            self.e_player = undefined;
        }
        
        self.var_cec3094a = undefined;
        self.var_515e20e6 = 0;
        self.var_154419fd = undefined;
        
        if ( isdefined( self.var_607f49de ) )
        {
            self.var_607f49de clientfield::increment( "" + #"magma_gat_disappear_fx" );
            waitframe( 1 );
            self.var_607f49de delete();
        }
    }
}

// Namespace namespace_fc5c8455/namespace_8d08012b
// Params 1
// Checksum 0xa616e0a8, Offset: 0x4cd8
// Size: 0x1d4
function function_6672db20( a_ents )
{
    var_36fa84e8 = a_ents[ #"fakeactor 1" ];
    var_48c0a804 = a_ents[ #"fakeactor 2" ];
    var_36fa84e8 clientfield::set( "" + #"hash_7692067c56d8b6cc", 1 );
    var_48c0a804 clientfield::set( "" + #"hash_7692067c56d8b6cc", 1 );
    var_48c0a804 waittill( #"start_alpha" );
    var_48c0a804 clientfield::set( "" + #"hash_7692067c56d8b6cc", 2 );
    var_36fa84e8 waittill( #"start_alpha" );
    var_36fa84e8 clientfield::set( "" + #"hash_7692067c56d8b6cc", 2 );
    var_36fa84e8 waittill( #"end_alpha" );
    var_36fa84e8 clientfield::set( "" + #"hash_7692067c56d8b6cc", 0 );
    var_48c0a804 clientfield::set( "" + #"hash_7692067c56d8b6cc", 0 );
}

// Namespace namespace_fc5c8455/namespace_8d08012b
// Params 1, eflags: 0x4
// Checksum 0x13eafad9, Offset: 0x4eb8
// Size: 0x160
function private function_a6a91f7a( var_f2528cbc )
{
    if ( isdefined( self.var_607f49de ) )
    {
        self.var_607f49de delete();
    }
    
    if ( !isdefined( var_f2528cbc ) )
    {
        self.var_607f49de = zm_utility::spawn_weapon_model( getweapon( #"ww_blundergat_fire_t8" ), undefined, self.v_weapon_origin, self.v_weapon_angles );
        return 0;
    }
    
    if ( var_f2528cbc == #"ww_blundergat_t8" || var_f2528cbc == #"ww_blundergat_acid_t8" )
    {
        self.var_607f49de = zm_utility::spawn_weapon_model( getweapon( #"ww_blundergat_fire_t8" ), undefined, self.v_weapon_origin, self.v_weapon_angles );
        return 0;
    }
    
    self.var_607f49de = zm_utility::spawn_weapon_model( getweapon( #"ww_blundergat_fire_t8_upgraded" ), undefined, self.v_weapon_origin, self.v_weapon_angles );
    return 1;
}

// Namespace namespace_fc5c8455/namespace_8d08012b
// Params 1
// Checksum 0xf46e3720, Offset: 0x5020
// Size: 0x8e
function function_ecc34f71( e_player )
{
    self endon( #"magma_taken", #"magma_timeout" );
    e_player waittill( #"death", #"disconnect" );
    self.e_player = undefined;
    self.var_cec3094a = undefined;
    self.var_515e20e6 = 0;
    self.e_player = undefined;
    self notify( #"magma_timeout" );
}

/#

    // Namespace namespace_fc5c8455/namespace_8d08012b
    // Params 0
    // Checksum 0xc3d29318, Offset: 0x50b8
    // Size: 0x84, Type: dev
    function function_78ca248c()
    {
        if ( !getdvarint( #"zm_debug_ee", 0 ) )
        {
            return;
        }
        
        zm_devgui::add_custom_devgui_callback( &function_6f4823a9 );
        adddebugcommand( "<dev string:x87>" );
        adddebugcommand( "<dev string:xf8>" );
    }

    // Namespace namespace_fc5c8455/namespace_8d08012b
    // Params 1
    // Checksum 0xc7881620, Offset: 0x5148
    // Size: 0x14a, Type: dev
    function function_6f4823a9( cmd )
    {
        switch ( cmd )
        {
            case #"hash_2406dff55d52785a":
                foreach ( mdl_skull in level.var_8e6fc65e )
                {
                    mdl_skull setmodel( "<dev string:x169>" );
                    mdl_skull clientfield::set( "<dev string:x185>" + #"magma_fireplace_skull_fx", 1 );
                }
                
                level flag::set( #"hash_3fb7d58b07b04333" );
                break;
            case #"hash_384ee6deba35ca28":
                level flag::set( #"magma_forge_completed" );
                break;
        }
    }

#/

// Namespace namespace_fc5c8455/namespace_8d08012b
// Params 0
// Checksum 0xaaa4142f, Offset: 0x52a0
// Size: 0x34c
function function_b00fd241()
{
    var_7de73bd2 = struct::get_array( "key_door_trigger", "targetname" );
    
    foreach ( var_f4539b2e in var_7de73bd2 )
    {
        var_f4539b2e.a_e_doors = [];
        a_e_parts = getentarray( var_f4539b2e.target, "targetname" );
        
        foreach ( e_part in a_e_parts )
        {
            if ( e_part.script_noteworthy === "door" )
            {
                if ( !isdefined( var_f4539b2e.a_e_doors ) )
                {
                    var_f4539b2e.a_e_doors = [];
                }
                else if ( !isarray( var_f4539b2e.a_e_doors ) )
                {
                    var_f4539b2e.a_e_doors = array( var_f4539b2e.a_e_doors );
                }
                
                if ( !isinarray( var_f4539b2e.a_e_doors, e_part ) )
                {
                    var_f4539b2e.a_e_doors[ var_f4539b2e.a_e_doors.size ] = e_part;
                }
                
                continue;
            }
            
            if ( e_part.script_noteworthy === "clip" )
            {
                var_f4539b2e.e_clip = e_part;
                continue;
            }
            
            if ( e_part.script_noteworthy === "lock" )
            {
                var_f4539b2e.e_lock = e_part;
                continue;
            }
            
            if ( e_part.script_noteworthy === "item_part" )
            {
                var_f4539b2e.e_item = e_part;
            }
        }
    }
    
    zm_items::function_4d230236( getweapon( #"zitem_acid_gat_part_1" ), &function_6fe98729 );
    zm_items::function_4d230236( getweapon( #"zitem_acid_gat_part_2" ), &function_6fe98729 );
    zm_items::function_4d230236( getweapon( #"zitem_acid_gat_part_3" ), &function_6fe98729 );
    array::thread_all( var_7de73bd2, &function_48c915fa );
}

// Namespace namespace_fc5c8455/namespace_8d08012b
// Params 2
// Checksum 0xbbc1ba2a, Offset: 0x55f8
// Size: 0x34
function function_6fe98729( e_holder, w_item )
{
    self playsound( #"hash_230737b2535a3374" );
}

// Namespace namespace_fc5c8455/namespace_8d08012b
// Params 0
// Checksum 0x9e93e2cc, Offset: 0x5638
// Size: 0x432
function function_48c915fa()
{
    t_door = spawn( "trigger_radius_use", self.origin, 0, 64, 64 );
    t_door setcursorhint( "HINT_NOICON" );
    t_door triggerignoreteam();
    t_door setvisibletoall();
    t_door thread function_38792a35();
    
    while ( true )
    {
        s_result = t_door waittill( #"trigger" );
        e_player = s_result.activator;
        
        if ( level flag::get( #"hash_7039457b1cc827de" ) )
        {
            t_door delete();
            self.e_lock delete();
            
            foreach ( e_door in self.a_e_doors )
            {
                if ( isdefined( e_door.script_vector ) )
                {
                    e_door rotateto( e_door.script_vector, 1 );
                }
                else
                {
                    e_door movez( 10000, 1 );
                }
                
                if ( isdefined( e_door.script_sound ) )
                {
                    playsoundatposition( e_door.script_sound, e_door.origin );
                }
            }
            
            if ( isdefined( self.e_item ) && isdefined( self.e_item.script_int ) )
            {
                if ( self.e_item.script_int == 1 )
                {
                    level flag::set( #"activate_sally_port_acid" );
                    self.e_item ghost();
                    var_80c0f2e6 = zm_crafting::get_component( #"zitem_acid_gat_part_1" );
                    zm_items::spawn_item( var_80c0f2e6, self.e_item.origin, self.e_item.angles );
                    self.e_item delete();
                }
                
                if ( self.e_item.script_int == 2 )
                {
                    self.e_item ghost();
                    var_80c0f2e6 = zm_crafting::get_component( #"zitem_acid_gat_part_2" );
                    zm_items::spawn_item( var_80c0f2e6, self.e_item.origin, self.e_item.angles );
                    self.e_item delete();
                }
            }
            
            if ( isdefined( self.e_clip ) )
            {
                self.e_clip notsolid();
                self.e_clip connectpaths();
                wait 0.5;
                
                if ( isdefined( self.e_clip ) )
                {
                    self.e_clip delete();
                }
            }
            
            return;
        }
    }
}

// Namespace namespace_fc5c8455/namespace_8d08012b
// Params 0, eflags: 0x4
// Checksum 0xb450267f, Offset: 0x5a78
// Size: 0xb4
function private function_38792a35()
{
    self endon( #"death" );
    self sethintstring( #"hash_2f5a14e8bf175422" );
    level flag::wait_till( #"hash_7039457b1cc827de" );
    
    if ( function_8b1a219a() )
    {
        self sethintstring( #"hash_782c9287b8dfe2d4" );
        return;
    }
    
    self sethintstring( #"hash_6ca88a5a4b9466d8" );
}

