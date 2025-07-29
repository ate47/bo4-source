#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\flagsys_shared;
#using scripts\core_common\fx_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm\zm_mansion_util;
#using scripts\zm_common\zm_crafting;
#using scripts\zm_common\zm_customgame;
#using scripts\zm_common\zm_items;
#using scripts\zm_common\zm_ui_inventory;
#using scripts\zm_common\zm_unitrigger;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_vo;
#using scripts\zm_common\zm_weapons;

#namespace ww_lvl2_quest;

// Namespace ww_lvl2_quest/zm_mansion_ww_lvl2_quest
// Params 0, eflags: 0x2
// Checksum 0xd1544470, Offset: 0x3d8
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"ww_lvl2_quest", &__init__, &__main__, undefined );
}

// Namespace ww_lvl2_quest/zm_mansion_ww_lvl2_quest
// Params 0
// Checksum 0x7c077159, Offset: 0x428
// Size: 0x134
function __init__()
{
    level.var_9e0e74ff = 0;
    level flag::init( "flag_player_grabbed_werewolf_material" );
    level flag::init( "flag_player_grabbed_catalyst_material" );
    level flag::init( "flag_player_grabbed_nosferatu_material" );
    level flag::init( "flag_player_grabbed_werewolf_prima" );
    level flag::init( "flag_player_grabbed_bat_prima" );
    level flag::init( "flag_player_grabbed_nosferatu_prima" );
    var_a70a763b = getentarray( "ww_lvl2_quest_piece_on_table", "targetname" );
    array::run_all( var_a70a763b, &hide );
    array::run_all( var_a70a763b, &notsolid );
}

// Namespace ww_lvl2_quest/zm_mansion_ww_lvl2_quest
// Params 0
// Checksum 0x18d2476a, Offset: 0x568
// Size: 0x144
function __main__()
{
    if ( zm_custom::function_901b751c( #"zmwonderweaponisenabled" ) )
    {
        level thread function_6b6712e3();
        level thread function_c9e23896();
        w_blueprint = zm_crafting::function_b18074d0( #"zblueprint_mansion_ww_lvl2" );
        w_blueprint.component02.var_62a98b13 = #"weapon_frame";
        w_blueprint.component03.var_62a98b13 = #"prima_materia";
        zm_crafting::function_d1f16587( #"zblueprint_mansion_ww_lvl2", &ww_lvl2_crafted );
        callback::on_connect( &function_27b91fdb );
    }
    
    level flag::init( #"hash_1462d174d4023e58" );
    level thread function_514a3f80();
}

// Namespace ww_lvl2_quest/zm_mansion_ww_lvl2_quest
// Params 0
// Checksum 0xfb02938b, Offset: 0x6b8
// Size: 0x1b8
function function_27b91fdb()
{
    self endon( #"disconnect" );
    level endon( #"ww_lvl2_crafting_completed" );
    self flag::init( #"hash_4428586b42c7a522" );
    
    while ( true )
    {
        var_e7df750a = 0;
        s_result = self waittill( #"weapon_change" );
        var_3ba4bf7d = self getweaponslistprimaries();
        
        foreach ( w_primary in var_3ba4bf7d )
        {
            if ( w_primary == level.var_f086136b )
            {
                var_e7df750a = 1;
                
                if ( !self flag::get( #"hash_4428586b42c7a522" ) )
                {
                    self flag::set( #"hash_4428586b42c7a522" );
                }
            }
        }
        
        if ( !var_e7df750a && self flag::get( #"hash_4428586b42c7a522" ) )
        {
            self flag::clear( #"hash_4428586b42c7a522" );
        }
    }
}

// Namespace ww_lvl2_quest/zm_mansion_ww_lvl2_quest
// Params 0
// Checksum 0x5106f972, Offset: 0x878
// Size: 0x21c
function function_6b6712e3()
{
    level flagsys::wait_till( "start_zombie_round_logic" );
    var_ca45945a = scene::get_active_scenes( #"p8_fxanim_zm_man_bookcase_04_bundle" );
    var_48e18d96 = var_ca45945a[ 0 ];
    var_80c684f = var_48e18d96.scene_ents[ #"prop 1" ];
    var_728bcf6e = getent( "ww_l2_part_clip_right", "targetname" );
    var_728bcf6e linkto( var_80c684f, "tag_animate_02" );
    var_45e56423 = getent( "ww_l2_part_clip_left", "targetname" );
    var_45e56423 linkto( var_80c684f, "tag_animate_01" );
    var_728bcf6e disconnectpaths();
    var_45e56423 disconnectpaths();
    var_80c684f thread function_4a81e337();
    level waittill( #"hash_2588983e2be22ca5" );
    s_loc = struct::get( "s_wwlvl2_quest_pickup_1", "targetname" );
    var_ef5b83bb = mansion_util::function_89e9bca5( #"hash_5dba840c6ed3ea3b", s_loc.origin, s_loc.angles );
    var_ef5b83bb clientfield::set( "" + #"ww_pickup_part", 1 );
}

// Namespace ww_lvl2_quest/zm_mansion_ww_lvl2_quest
// Params 0
// Checksum 0xd49d0911, Offset: 0xaa0
// Size: 0xde
function function_4a81e337()
{
    level endon( #"hash_2588983e2be22ca5" );
    self setcandamage( 1 );
    self thread function_292dd34f();
    self.health = 10000;
    
    while ( true )
    {
        s_notify = self waittill( #"damage" );
        
        if ( isplayer( s_notify.attacker ) )
        {
            if ( function_216d0545( s_notify ) )
            {
                level notify( #"hash_2588983e2be22ca5" );
            }
            
            continue;
        }
        
        self.health = 10000;
    }
}

// Namespace ww_lvl2_quest/zm_mansion_ww_lvl2_quest
// Params 1
// Checksum 0x3e526549, Offset: 0xb88
// Size: 0x5c
function function_292dd34f( b_right )
{
    level waittill( #"hash_2588983e2be22ca5" );
    self setcandamage( 0 );
    level scene::play( #"p8_fxanim_zm_man_bookcase_04_bundle" );
}

// Namespace ww_lvl2_quest/zm_mansion_ww_lvl2_quest
// Params 1
// Checksum 0x665c82a3, Offset: 0xbf0
// Size: 0x9c, Type: bool
function function_216d0545( s_notify )
{
    /#
        if ( s_notify.mod === "<dev string:x38>" && isdefined( level.var_14a33fde ) && level.var_14a33fde )
        {
            return true;
        }
    #/
    
    return ( s_notify.mod === "MOD_MELEE" || s_notify.mod === "MOD_IMPACT" ) && mansion_util::is_shield( s_notify.weapon );
}

// Namespace ww_lvl2_quest/zm_mansion_ww_lvl2_quest
// Params 0
// Checksum 0xab6235e2, Offset: 0xc98
// Size: 0x94
function function_c9e23896()
{
    level endon( #"hash_3b0bcf867c23b993" );
    level waittill( #"hash_879562bd9e764a4" );
    var_9e030909 = getweapon( #"ww_random_ray_gun1" );
    level flag::init( "ww_lvl2_crafting_completed" );
    level thread function_6231b511();
}

// Namespace ww_lvl2_quest/zm_mansion_ww_lvl2_quest
// Params 0
// Checksum 0x1572aee8, Offset: 0xd38
// Size: 0xd8
function function_6231b511()
{
    while ( !level flag::get( "ww_lvl2_crafting_completed" ) )
    {
        s_notify = level waittill( #"blueprint_completed" );
        
        if ( s_notify.blueprint.name === "zblueprint_mansion_ww_lvl2" )
        {
            level flag::set( "ww_lvl2_crafting_completed" );
            callback::remove_on_connect( &function_27b91fdb );
            level zm_ui_inventory::function_7df6bb60( #"ww_phase", 1 );
        }
    }
}

// Namespace ww_lvl2_quest/zm_mansion_ww_lvl2_quest
// Params 0
// Checksum 0xc0b4f669, Offset: 0xe18
// Size: 0x22c
function function_514a3f80()
{
    if ( !isdefined( level.var_9332cecc ) )
    {
        level.var_9332cecc = 0;
    }
    
    if ( !isdefined( level.var_f6a6ddae ) )
    {
        level.var_f6a6ddae = 0;
    }
    
    if ( !isdefined( level.var_ea58030a ) )
    {
        level.var_ea58030a = 0;
    }
    
    struct::get( "s_prima_material_device" ) zm_unitrigger::create( &function_32573d2a, 64, &function_ea6f56ee );
    zm_items::function_4d230236( zm_crafting::get_component( #"hash_5dba850c6ed3ebee" ), &function_b9cbdac6 );
    zm_items::function_4d230236( zm_crafting::get_component( #"zitem_chaos_lvl3_part_1" ), &function_b9cbdac6 );
    zm_items::function_4d230236( zm_crafting::get_component( #"zitem_chaos_lvl3_part_2" ), &function_b9cbdac6 );
    level flagsys::wait_till_any( array( #"power_on1", #"hash_2daf5bdda85cc660" ) );
    wait randomintrange( 20, 30 );
    s_machine = struct::get( "s_pr_mach" );
    s_machine scene::play( "Open" );
    exploder::exploder( "exp_lgt_prima_disp_green_sml" );
    exploder::exploder( "exp_lgt_prima_disp_red_lrg" );
}

// Namespace ww_lvl2_quest/zm_mansion_ww_lvl2_quest
// Params 1
// Checksum 0x3a526e5, Offset: 0x1050
// Size: 0x118, Type: bool
function function_32573d2a( player )
{
    if ( !level flag::get( #"hash_1462d174d4023e58" ) && ( level flag::get( "flag_player_grabbed_werewolf_material" ) && !level.var_9332cecc || level flag::get( "flag_player_grabbed_catalyst_material" ) && !level.var_f6a6ddae || level flag::get( "flag_player_grabbed_nosferatu_material" ) && !level.var_ea58030a ) )
    {
        self sethintstringforplayer( player, #"hash_7e343f7677cbafe5" );
    }
    else
    {
        self sethintstringforplayer( player, "" );
    }
    
    return true;
}

// Namespace ww_lvl2_quest/zm_mansion_ww_lvl2_quest
// Params 0
// Checksum 0xcedd132c, Offset: 0x1170
// Size: 0x334
function function_ea6f56ee()
{
    while ( true )
    {
        waitresult = self waittill( #"trigger" );
        player = waitresult.activator;
        
        if ( !zm_utility::can_use( player ) || level flag::get( #"hash_1462d174d4023e58" ) )
        {
            continue;
        }
        
        var_21839a96 = #"";
        var_57ec466d = #"zmb_sq_souls_release";
        
        if ( level flag::get( "flag_player_grabbed_werewolf_material" ) && !level flag::get( "flag_player_grabbed_werewolf_prima" ) )
        {
            var_21839a96 = #"hash_5dba850c6ed3ebee";
            level thread function_29f66f1a( var_21839a96, var_57ec466d );
            level.var_9332cecc = 1;
            level zm_ui_inventory::function_7df6bb60( #"ww_p1_2", 0 );
        }
        else if ( level flag::get( "flag_player_grabbed_catalyst_material" ) && !level flag::get( "flag_player_grabbed_bat_prima" ) )
        {
            var_21839a96 = #"zitem_chaos_lvl3_part_1";
            level thread function_29f66f1a( var_21839a96, var_57ec466d );
            level.var_f6a6ddae = 1;
            level zm_ui_inventory::function_7df6bb60( #"ww_p2_2", 0 );
        }
        else if ( level flag::get( "flag_player_grabbed_nosferatu_material" ) && !level flag::get( "flag_player_grabbed_nosferatu_prima" ) )
        {
            var_21839a96 = #"zitem_chaos_lvl3_part_2";
            level thread function_29f66f1a( var_21839a96, var_57ec466d );
            level.var_ea58030a = 1;
            level zm_ui_inventory::function_7df6bb60( #"ww_p2_3", 0 );
        }
        
        if ( isdefined( level.var_9332cecc ) && level.var_9332cecc && isdefined( level.var_f6a6ddae ) && level.var_f6a6ddae && isdefined( level.var_ea58030a ) && level.var_ea58030a )
        {
            break;
        }
    }
    
    zm_unitrigger::unregister_unitrigger( self.stub );
}

// Namespace ww_lvl2_quest/zm_mansion_ww_lvl2_quest
// Params 2, eflags: 0x4
// Checksum 0x86a878f9, Offset: 0x14b0
// Size: 0x1bc
function private function_29f66f1a( var_21839a96, var_57ec466d )
{
    level flag::set( #"hash_1462d174d4023e58" );
    s_machine = struct::get( "s_pr_mach" );
    s_start_loc = struct::get( #"s_prima_material_device" );
    mdl_chaos = util::spawn_model( s_start_loc.model, s_start_loc.origin, s_start_loc.angles );
    s_machine scene::play( "Start" );
    mdl_chaos thread function_6f29b131();
    exploder::exploder( "exp_lgt_prima_disp_red_sml" );
    exploder::exploder_stop( "exp_lgt_prima_disp_green_sml" );
    s_machine thread scene::play( "init" );
    wait 12;
    level thread function_672eb1dc( var_21839a96, var_57ec466d );
    s_machine scene::play( "Finish" );
    exploder::exploder( "exp_lgt_prima_disp_green_lrg" );
    exploder::exploder_stop( "exp_lgt_prima_disp_red_lrg" );
}

// Namespace ww_lvl2_quest/zm_mansion_ww_lvl2_quest
// Params 0
// Checksum 0x961394c0, Offset: 0x1678
// Size: 0x3c
function function_6f29b131()
{
    self endon( #"death" );
    wait 2.5;
    
    if ( isdefined( self ) )
    {
        self delete();
    }
}

// Namespace ww_lvl2_quest/zm_mansion_ww_lvl2_quest
// Params 2
// Checksum 0xb578b76d, Offset: 0x16c0
// Size: 0xa0
function function_672eb1dc( var_21839a96, var_57ec466d )
{
    s_loc = struct::get( "s_prima_material_spawn_loc" );
    wait 5;
    var_58b3e56b = mansion_util::function_89e9bca5( var_21839a96, s_loc.origin, s_loc.angles );
    playsoundatposition( var_57ec466d, var_58b3e56b.origin );
    level notify( #"hash_144b3192f03325f3" );
}

// Namespace ww_lvl2_quest/zm_mansion_ww_lvl2_quest
// Params 2
// Checksum 0x5b5507a9, Offset: 0x1768
// Size: 0x214
function function_b9cbdac6( e_holder, w_item )
{
    s_machine = struct::get( "s_pr_mach" );
    
    switch ( w_item.name )
    {
        case #"hash_5dba850c6ed3ebee":
            level zm_ui_inventory::function_7df6bb60( #"ww_p1_2", 2 );
            level flag::set( "flag_player_grabbed_werewolf_prima" );
            break;
        case #"zitem_chaos_lvl3_part_1":
            level zm_ui_inventory::function_7df6bb60( #"ww_p2_2", 2 );
            level flag::set( "flag_player_grabbed_bat_prima" );
            break;
        case #"zitem_chaos_lvl3_part_2":
            level zm_ui_inventory::function_7df6bb60( #"ww_p2_3", 5 );
            level flag::set( "flag_player_grabbed_nosferatu_prima" );
            break;
    }
    
    s_machine scene::play( "Close" );
    exploder::exploder( "exp_lgt_prima_disp_red_lrg" );
    exploder::exploder_stop( "exp_lgt_prima_disp_green_lrg" );
    s_machine scene::play( "Open" );
    exploder::exploder( "exp_lgt_prima_disp_green_sml" );
    exploder::exploder_stop( "exp_lgt_prima_disp_red_sml" );
    level flag::clear( #"hash_1462d174d4023e58" );
}

// Namespace ww_lvl2_quest/zm_mansion_ww_lvl2_quest
// Params 1
// Checksum 0x220d98a0, Offset: 0x1988
// Size: 0x12e
function ww_lvl2_crafted( e_player )
{
    level notify( #"ww_lvl2_crafted" );
    var_a70a763b = getentarray( "ww_lvl2_quest_piece_on_table", "targetname" );
    array::run_all( var_a70a763b, &show );
    unitrigger_stub = self.stub;
    e_player zm_weapons::weapon_take( level.var_f086136b );
    e_player thread zm_vo::function_a2bd5a0c( #"hash_ab2e19733266586", 1 );
    e_player zm_weapons::weapon_give( self.stub.blueprint.var_54a97edd );
    wait 0.1;
    unitrigger_stub zm_crafting::reset_table();
    unitrigger_stub.prompt_and_visibility_func = &function_7aa50bb7;
}

// Namespace ww_lvl2_quest/zm_mansion_ww_lvl2_quest
// Params 1
// Checksum 0x3b886936, Offset: 0x1ac0
// Size: 0x108
function function_7aa50bb7( e_player )
{
    can_use = self.stub zm_crafting::function_18f2be60( e_player );
    
    if ( e_player zm_weapons::has_weapon_or_upgrade( level.var_6fe89212 ) || e_player zm_weapons::has_weapon_or_upgrade( level.var_7b9ca97a ) )
    {
        self sethintstring( "" );
    }
    else if ( e_player zm_weapons::has_weapon_or_upgrade( level.var_f086136b ) )
    {
        self sethintstring( self.stub.blueprint.var_4dbc4aee );
    }
    else
    {
        self sethintstring( #"hash_61bd1f669b4c6a1c" );
    }
    
    return can_use;
}

