#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;
#using scripts\zm\zm_hms_util;
#using scripts\zm\zm_orange_util;
#using scripts\zm_common\bgbs\zm_bgb_anywhere_but_here;
#using scripts\zm_common\zm_sq;
#using scripts\zm_common\zm_ui_inventory;
#using scripts\zm_common\zm_unitrigger;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_weapons;

#namespace namespace_5449c7ba;

// Namespace namespace_5449c7ba/namespace_5449c7ba
// Params 0
// Checksum 0x9edf59c3, Offset: 0x2c8
// Size: 0x14
function init()
{
    init_flags();
}

// Namespace namespace_5449c7ba/namespace_5449c7ba
// Params 0
// Checksum 0xe44a77d7, Offset: 0x2e8
// Size: 0x104
function init_flags()
{
    level flag::init( #"hash_7220fbbcfb27dbd4" );
    level flag::init( #"hash_4119ce1986c28b9d" );
    level flag::init( #"hash_5c6f1082ddbc7389" );
    level flag::init( #"hash_50f159e379843d0c" );
    level flag::init( #"hash_4839f3b910ec6b98" );
    level flag::init( #"vault_unlocked" );
    level flag::init( #"hash_60c221c7e2c660c0" );
    level flag::init( #"hash_475c24f631fab267" );
}

// Namespace namespace_5449c7ba/namespace_5449c7ba
// Params 0
// Checksum 0xc8ea2284, Offset: 0x3f8
// Size: 0x354
function main()
{
    level.var_79260935 = spawnstruct();
    level.var_79260935.a_s_vault_keyholes = struct::get_array( "s_vault_keyhole", "targetname" );
    level.var_79260935.e_vault_defend_blocker = getent( "e_vault_defend_blocker", "targetname" );
    level.var_79260935.s_vault_reward = struct::get( "s_vault_reward", "targetname" );
    level.var_79260935.var_7ff5dbc4 = struct::get( "facility_vault_door_bundle", "targetname" );
    zm_sq::register( #"sams_box", #"step_1", #"sams_box_step1", &sams_box_step1_setup, &sams_box_step1_cleanup );
    zm_sq::register( #"sams_box", #"step_2", #"sams_box_step2", &sams_box_step2_setup, &sams_box_step2_cleanup );
    zm_sq::register( #"sams_box", #"step_3", #"sams_box_step3", &sams_box_step3_setup, &sams_box_step3_cleanup );
    zm_sq::register( #"sams_box", #"step_4", #"sams_box_step4", &sams_box_step4_setup, &sams_box_step4_cleanup );
    zm_sq::register( #"sams_box", #"step_5", #"sams_box_step5", &sams_box_step5_setup, &sams_box_step5_cleanup );
    zm_sq::register( #"sams_box", #"step_6", #"sams_box_step6", &sams_box_step6_setup, &sams_box_step6_cleanup );
    zm_sq::start( #"sams_box", !zm_utility::is_standard() );
}

// Namespace namespace_5449c7ba/namespace_5449c7ba
// Params 1
// Checksum 0xf2eb9b76, Offset: 0x758
// Size: 0x244
function sams_box_step1_setup( var_5ea5c94d )
{
    function_ee2edc25();
    level.var_79260935.var_c8b70e7e = 1;
    
    foreach ( s_vault_keyhole in level.var_79260935.a_s_vault_keyholes )
    {
        s_vault_keyhole zm_unitrigger::create( &function_36db86a9, 64 );
        s_vault_keyhole thread function_3590cb58();
    }
    
    level.var_79260935.var_6388e36f = struct::get( "keycard_machine", "targetname" );
    
    if ( !var_5ea5c94d )
    {
        foreach ( s_keycard in level.var_79260935.a_s_keycards )
        {
            s_keycard zm_unitrigger::create( "", 64 );
            s_keycard thread function_d332685();
        }
        
        level flag::wait_till( "power_on3" );
        level.var_79260935.var_6388e36f zm_unitrigger::create( "", 64 );
        level.var_79260935.var_6388e36f thread function_f83bfaa();
        level flag::wait_till( #"hash_7220fbbcfb27dbd4" );
    }
}

// Namespace namespace_5449c7ba/namespace_5449c7ba
// Params 0
// Checksum 0x6091eab6, Offset: 0x9a8
// Size: 0x4d0
function function_ee2edc25()
{
    level.var_79260935.var_f4c36022 = 0;
    level.var_79260935.var_30df7623 = 0;
    a_s_keycards = struct::get_array( "sam_keycard", "targetname" );
    var_88f6f50a = [];
    var_7ab3d884 = [];
    
    foreach ( s_keycard in a_s_keycards )
    {
        if ( s_keycard.script_int === 0 )
        {
            if ( !isdefined( var_88f6f50a ) )
            {
                var_88f6f50a = [];
            }
            else if ( !isarray( var_88f6f50a ) )
            {
                var_88f6f50a = array( var_88f6f50a );
            }
            
            var_88f6f50a[ var_88f6f50a.size ] = s_keycard;
            continue;
        }
        
        if ( !isdefined( var_7ab3d884 ) )
        {
            var_7ab3d884 = [];
        }
        else if ( !isarray( var_7ab3d884 ) )
        {
            var_7ab3d884 = array( var_7ab3d884 );
        }
        
        var_7ab3d884[ var_7ab3d884.size ] = s_keycard;
    }
    
    level.var_79260935.a_s_keycards = [];
    var_986b4af2 = array::random( var_88f6f50a );
    
    if ( !isdefined( level.var_79260935.a_s_keycards ) )
    {
        level.var_79260935.a_s_keycards = [];
    }
    else if ( !isarray( level.var_79260935.a_s_keycards ) )
    {
        level.var_79260935.a_s_keycards = array( level.var_79260935.a_s_keycards );
    }
    
    level.var_79260935.a_s_keycards[ level.var_79260935.a_s_keycards.size ] = var_986b4af2;
    arrayremovevalue( var_88f6f50a, var_986b4af2 );
    var_f3d781b9 = array::random( var_7ab3d884 );
    
    if ( !isdefined( level.var_79260935.a_s_keycards ) )
    {
        level.var_79260935.a_s_keycards = [];
    }
    else if ( !isarray( level.var_79260935.a_s_keycards ) )
    {
        level.var_79260935.a_s_keycards = array( level.var_79260935.a_s_keycards );
    }
    
    level.var_79260935.a_s_keycards[ level.var_79260935.a_s_keycards.size ] = var_f3d781b9;
    arrayremovevalue( var_7ab3d884, var_f3d781b9 );
    
    foreach ( s_keycard in level.var_79260935.a_s_keycards )
    {
        s_keycard.e_keycard = getent( s_keycard.target, "targetname" );
    }
    
    var_5731429e = [];
    var_5731429e = arraycombine( var_88f6f50a, var_7ab3d884, 1, 0 );
    
    foreach ( s_keycard in var_5731429e )
    {
        var_b587be04 = getent( s_keycard.target, "targetname" );
        var_b587be04 delete();
    }
}

// Namespace namespace_5449c7ba/namespace_5449c7ba
// Params 0
// Checksum 0x548b8603, Offset: 0xe80
// Size: 0x1f4
function function_d332685()
{
    level endon( #"end_game", #"hash_7220fbbcfb27dbd4" );
    s_results = self waittill( #"trigger_activated" );
    e_who = s_results.e_who;
    playsoundatposition( #"hash_d8937c5c97f485e", self.e_keycard.origin );
    self.e_keycard delete();
    
    if ( level.var_79260935.var_f4c36022 === 0 && level.var_79260935.var_30df7623 === 0 )
    {
        e_who thread zm_orange_util::function_51b752a9( #"hash_18bc664341e86310" );
        level zm_ui_inventory::function_7df6bb60( "zm_orange_zipquest_keycard_1", 1 );
    }
    else
    {
        if ( !isdefined( level.var_79260935.var_30df7623 ) || level.var_79260935.var_30df7623 == 0 )
        {
            e_who thread zm_orange_util::function_51b752a9( #"hash_52378df470d0a88b" );
        }
        else
        {
            e_who thread zm_orange_util::function_51b752a9( #"hash_35c946ee7d89155d" );
        }
        
        level zm_ui_inventory::function_7df6bb60( "zm_orange_zipquest_keycard_2", 1 );
    }
    
    level.var_79260935.var_f4c36022++;
    self zm_unitrigger::unregister_unitrigger( self.s_unitrigger );
}

// Namespace namespace_5449c7ba/namespace_5449c7ba
// Params 0
// Checksum 0xb2ef78d6, Offset: 0x1080
// Size: 0x1b0
function function_f83bfaa()
{
    level endon( #"end_game", #"hash_7220fbbcfb27dbd4" );
    
    while ( true )
    {
        s_results = self waittill( #"trigger_activated" );
        e_who = s_results.e_who;
        
        if ( level.var_79260935.var_f4c36022 === 0 )
        {
            continue;
        }
        
        if ( level.var_79260935.var_f4c36022 === 1 )
        {
            if ( level.var_79260935.var_30df7623 == 0 )
            {
                e_who thread zm_orange_util::function_51b752a9( #"hash_6997edb52b235dd9" );
                self function_61298be5();
            }
            else
            {
                e_who thread zm_orange_util::function_51b752a9( #"hash_6b8c87cc827523c2" );
                self function_2ec6a1aa();
            }
            
            continue;
        }
        
        e_who thread zm_orange_util::function_51b752a9( #"hash_6997edb52b235dd9" );
        self function_61298be5();
        e_who thread zm_orange_util::function_51b752a9( #"hash_6b8c87cc827523c2" );
        self function_2ec6a1aa();
    }
}

// Namespace namespace_5449c7ba/namespace_5449c7ba
// Params 0
// Checksum 0x76e0ea90, Offset: 0x1238
// Size: 0x128
function function_61298be5()
{
    var_1a304a2f = struct::get( self.target, "targetname" );
    self.var_b6aa4c4f = util::spawn_model( "p8_zm_ora_keycard_0", var_1a304a2f.origin, var_1a304a2f.angles );
    playsoundatposition( #"hash_7b375cb6d6863713", self.var_b6aa4c4f.origin );
    level zm_ui_inventory::function_7df6bb60( "zm_orange_zipquest_keycard_1", 0 );
    level.var_79260935.var_f4c36022--;
    level.var_79260935.var_30df7623++;
    wait 0.5;
    self.var_b6aa4c4f zm_hms_util::function_dc4ab629( -8, 1.5 );
    self.var_b6aa4c4f waittill( #"movedone" );
}

// Namespace namespace_5449c7ba/namespace_5449c7ba
// Params 0
// Checksum 0xb5246205, Offset: 0x1368
// Size: 0x244
function function_2ec6a1aa()
{
    var_1a304a2f = struct::get( self.target2, "targetname" );
    self.var_a56fa9da = util::spawn_model( "p8_zm_ora_keycard_0", var_1a304a2f.origin, var_1a304a2f.angles );
    playsoundatposition( #"hash_7b375cb6d6863713", self.var_a56fa9da.origin );
    level zm_ui_inventory::function_7df6bb60( "zm_orange_zipquest_keycard_2", 0 );
    level.var_79260935.var_f4c36022--;
    level.var_79260935.var_30df7623++;
    wait 0.5;
    self.var_a56fa9da zm_hms_util::function_dc4ab629( -8, 1.5 );
    self.var_a56fa9da waittill( #"movedone" );
    self zm_unitrigger::unregister_unitrigger( self.s_unitrigger );
    playsoundatposition( #"hash_105229c7410bf423", self.origin );
    wait 4;
    self.var_b6aa4c4f setmodel( "p8_zm_ora_keycard_1" );
    self.var_a56fa9da setmodel( "p8_zm_ora_keycard_2" );
    self.var_b6aa4c4f zm_hms_util::function_dc4ab629( 8, 1.5 );
    self.var_a56fa9da zm_hms_util::function_dc4ab629( 8, 1.5 );
    self.var_a56fa9da waittill( #"movedone" );
    level flag::set( #"hash_7220fbbcfb27dbd4" );
}

// Namespace namespace_5449c7ba/namespace_5449c7ba
// Params 2
// Checksum 0x10339883, Offset: 0x15b8
// Size: 0x1bc
function sams_box_step1_cleanup( var_5ea5c94d, ended_early )
{
    if ( var_5ea5c94d || ended_early )
    {
        foreach ( s_keycard in level.var_79260935.a_s_keycards )
        {
            if ( isdefined( s_keycard.e_keycard ) )
            {
                s_keycard.e_keycard delete();
                s_keycard zm_unitrigger::unregister_unitrigger( s_keycard.s_unitrigger );
            }
        }
        
        switch ( level.var_79260935.var_30df7623 )
        {
            case 0:
                level.var_79260935.var_6388e36f function_61298be5();
                level.var_79260935.var_6388e36f function_2ec6a1aa();
                break;
            case 1:
                level.var_79260935.var_6388e36f function_2ec6a1aa();
                break;
            default:
                break;
        }
        
        level flag::set( #"hash_7220fbbcfb27dbd4" );
    }
}

// Namespace namespace_5449c7ba/namespace_5449c7ba
// Params 1
// Checksum 0x2e49abb9, Offset: 0x1780
// Size: 0x84
function sams_box_step2_setup( var_5ea5c94d )
{
    if ( !var_5ea5c94d )
    {
        level.var_79260935.var_6388e36f zm_unitrigger::create( "", 64 );
        level.var_79260935.var_6388e36f thread function_6c5a5d32();
        level flag::wait_till( #"hash_4119ce1986c28b9d" );
    }
}

// Namespace namespace_5449c7ba/namespace_5449c7ba
// Params 0
// Checksum 0x2df289e5, Offset: 0x1810
// Size: 0x104
function function_6c5a5d32()
{
    level endon( #"end_game", #"hash_4119ce1986c28b9d" );
    self waittill( #"trigger_activated" );
    level zm_ui_inventory::function_7df6bb60( "zm_orange_zipquest_keycard_1", 2 );
    level zm_ui_inventory::function_7df6bb60( "zm_orange_zipquest_keycard_2", 2 );
    playsoundatposition( #"hash_218d931e2eeaafc4", self.var_b6aa4c4f.origin );
    self.var_b6aa4c4f delete();
    self.var_a56fa9da delete();
    level flag::set( #"hash_4119ce1986c28b9d" );
}

// Namespace namespace_5449c7ba/namespace_5449c7ba
// Params 2
// Checksum 0x7a9b8315, Offset: 0x1920
// Size: 0x94
function sams_box_step2_cleanup( var_5ea5c94d, ended_early )
{
    if ( var_5ea5c94d || ended_early )
    {
        if ( isdefined( self.var_b6aa4c4f ) )
        {
            self.var_b6aa4c4f delete();
        }
        
        if ( isdefined( self.var_a56fa9da ) )
        {
            self.var_a56fa9da delete();
        }
        
        level flag::set( #"hash_4119ce1986c28b9d" );
    }
}

// Namespace namespace_5449c7ba/namespace_5449c7ba
// Params 1
// Checksum 0xa17f8fa9, Offset: 0x19c0
// Size: 0x54
function sams_box_step3_setup( var_5ea5c94d )
{
    if ( !var_5ea5c94d )
    {
        level flag::set( #"hash_475c24f631fab267" );
        level flag::wait_till( #"hash_50f159e379843d0c" );
    }
}

// Namespace namespace_5449c7ba/namespace_5449c7ba
// Params 2
// Checksum 0x88bb0640, Offset: 0x1a20
// Size: 0x110
function sams_box_step3_cleanup( var_5ea5c94d, ended_early )
{
    if ( var_5ea5c94d || ended_early )
    {
        level flag::set( #"hash_5c6f1082ddbc7389" );
        level flag::set( #"hash_50f159e379843d0c" );
    }
    
    level flag::clear( #"hash_475c24f631fab267" );
    
    foreach ( s_vault_keyhole in level.var_79260935.a_s_vault_keyholes )
    {
        s_vault_keyhole zm_unitrigger::unregister_unitrigger( s_vault_keyhole.s_unitrigger );
    }
}

// Namespace namespace_5449c7ba/namespace_5449c7ba
// Params 1
// Checksum 0x3adb0f5d, Offset: 0x1b38
// Size: 0xaa
function function_36db86a9( e_player )
{
    if ( level flag::get( #"hash_475c24f631fab267" ) )
    {
        str_hint = zm_utility::function_d6046228( #"hash_3d7d3a56e292c6fa", #"hash_b6e409536fc91fe" );
        self sethintstring( str_hint );
        return 1;
    }
    
    self sethintstring( "" );
    return 1;
}

// Namespace namespace_5449c7ba/namespace_5449c7ba
// Params 0
// Checksum 0xcae7a694, Offset: 0x1bf0
// Size: 0x2f8
function function_3590cb58()
{
    level endon( #"end_game" );
    self.var_1a304a2f = struct::get( self.target, "targetname" );
    
    while ( true )
    {
        s_result = self waittill( #"trigger_activated" );
        e_who = s_result.e_who;
        
        if ( level flag::get( #"hash_475c24f631fab267" ) )
        {
            self.var_896127a6 = util::spawn_model( self.var_1a304a2f.model, self.var_1a304a2f.origin, self.var_1a304a2f.angles );
            playsoundatposition( #"hash_7b375cb6d6863713", self.var_896127a6.origin );
            wait 1;
            self.var_896127a6 zm_hms_util::function_dc4ab629( -8, 1.5 );
            self.var_896127a6 waittill( #"movedone" );
            
            if ( !level flag::get( #"hash_5c6f1082ddbc7389" ) )
            {
                e_who thread zm_orange_util::function_51b752a9( #"vox_generic_responses_positive" );
                level flag::set( #"hash_5c6f1082ddbc7389" );
                self zm_unitrigger::unregister_unitrigger( self.s_unitrigger );
                level zm_ui_inventory::function_7df6bb60( "zm_orange_zipquest_keycard_1", 0 );
            }
            else
            {
                level flag::set( #"hash_50f159e379843d0c" );
                level zm_ui_inventory::function_7df6bb60( "zm_orange_zipquest_keycard_2", 0 );
                level zm_ui_inventory::function_7df6bb60( "zm_orange_zipquest_phase_num", 2 );
                level zm_ui_inventory::function_7df6bb60( "zm_orange_zipquest_handle_final", 1 );
                return;
            }
            
            continue;
        }
        
        if ( isdefined( level.var_79260935.var_c8b70e7e ) && level.var_79260935.var_c8b70e7e )
        {
            level.var_79260935.var_c8b70e7e = 0;
            e_who thread zm_orange_util::function_51b752a9( #"vox_generic_responses_negative" );
        }
    }
}

// Namespace namespace_5449c7ba/namespace_5449c7ba
// Params 1
// Checksum 0x879603e0, Offset: 0x1ef0
// Size: 0x8c
function sams_box_step4_setup( var_5ea5c94d )
{
    if ( !var_5ea5c94d )
    {
        level.var_79260935.s_vault_reward zm_unitrigger::create( &function_bb5cf7f2, 128 );
        level.var_79260935.s_vault_reward thread function_6b4a631b();
        level flag::wait_till( #"hash_4839f3b910ec6b98" );
    }
}

// Namespace namespace_5449c7ba/namespace_5449c7ba
// Params 2
// Checksum 0x92c435ae, Offset: 0x1f88
// Size: 0x7c
function sams_box_step4_cleanup( var_5ea5c94d, ended_early )
{
    if ( var_5ea5c94d || ended_early )
    {
        level flag::set( #"hash_4839f3b910ec6b98" );
    }
    
    level.var_79260935.s_vault_reward zm_unitrigger::unregister_unitrigger( level.var_79260935.s_vault_reward.s_unitrigger );
}

// Namespace namespace_5449c7ba/namespace_5449c7ba
// Params 1
// Checksum 0x12311552, Offset: 0x2010
// Size: 0x152
function function_bb5cf7f2( e_player )
{
    var_cb24ec97 = zm_hms_util::function_9258efe1( "human_infusion" );
    
    if ( zm_utility::is_classic() && level.var_45827161[ level.round_number ] !== undefined || zm_utility::is_trials() && ( level.round_number == 5 || level.round_number == 19 ) )
    {
        self sethintstring( #"hash_3c96e29876e85183" );
        return 1;
    }
    
    if ( var_cb24ec97 )
    {
        str_hint = zm_utility::function_d6046228( #"hash_56fc5ab8c0878d32", #"hash_17af2e2ebc75a206" );
        self sethintstring( str_hint );
        return 1;
    }
    
    self sethintstring( #"hash_3a0b70fac224c702" );
    return 1;
}

// Namespace namespace_5449c7ba/namespace_5449c7ba
// Params 0
// Checksum 0x8ae58e8c, Offset: 0x2170
// Size: 0x10a
function function_6b4a631b()
{
    level endon( #"end_game" );
    
    while ( true )
    {
        self waittill( #"trigger_activated" );
        var_cb24ec97 = zm_hms_util::function_9258efe1( "human_infusion" );
        
        if ( zm_utility::is_classic() && level.var_45827161[ level.round_number ] !== undefined || zm_utility::is_trials() && ( level.round_number == 5 || level.round_number == 19 ) )
        {
            var_cb24ec97 = 0;
        }
        
        if ( var_cb24ec97 )
        {
            level flag::set( #"hash_4839f3b910ec6b98" );
            return;
        }
    }
}

// Namespace namespace_5449c7ba/namespace_5449c7ba
// Params 1
// Checksum 0x153ce869, Offset: 0x2288
// Size: 0x8c
function sams_box_step5_setup( var_5ea5c94d )
{
    if ( !var_5ea5c94d )
    {
        level thread function_1f269398();
        exploder::exploder( "fxexp_vault_door_facility_steam" );
        level.var_79260935.var_7ff5dbc4 scene::play( "open" );
        level flag::wait_till( #"vault_unlocked" );
    }
}

// Namespace namespace_5449c7ba/namespace_5449c7ba
// Params 2
// Checksum 0xddeadbb6, Offset: 0x2320
// Size: 0x104
function sams_box_step5_cleanup( var_5ea5c94d, ended_early )
{
    if ( var_5ea5c94d || ended_early )
    {
        level.var_79260935.var_7ff5dbc4 scene::play( "open_fast" );
        level flag::clear( #"infinite_round_spawning" );
        level flag::clear( #"pause_round_timeout" );
        zm_bgb_anywhere_but_here::function_886fce8f( 1 );
        level.var_382a24b0 = undefined;
        level flag::set( #"vault_unlocked" );
    }
    
    exploder::stop_exploder( "fxexp_forcefield_facility" );
    level.var_79260935.e_vault_defend_blocker delete();
}

// Namespace namespace_5449c7ba/namespace_5449c7ba
// Params 0
// Checksum 0x5c082de4, Offset: 0x2430
// Size: 0x1e4
function function_1f269398()
{
    level endon( #"end_game" );
    level.var_79260935.e_vault_defend_blocker movez( 104, 0.1 );
    exploder::exploder( "fxexp_forcefield_facility" );
    
    if ( level.var_98138d6b > 1 )
    {
        level.var_1c53964e thread zm_hms_util::function_6a0d675d( #"hash_4b68766a3d07f0da", 0 );
    }
    
    level flag::set( #"infinite_round_spawning" );
    level flag::set( #"pause_round_timeout" );
    zm_bgb_anywhere_but_here::function_886fce8f( 0 );
    level.var_382a24b0 = 0;
    level thread function_b53212e5();
    wait 60;
    level flag::clear( #"infinite_round_spawning" );
    level flag::clear( #"pause_round_timeout" );
    zm_bgb_anywhere_but_here::function_886fce8f( 1 );
    level.var_382a24b0 = undefined;
    
    if ( level.var_98138d6b > 1 )
    {
        level.var_1c53964e zm_hms_util::function_6a0d675d( #"hash_4b68766a3d07f0da", 1 );
    }
    
    level flag::set( #"vault_unlocked" );
}

// Namespace namespace_5449c7ba/namespace_5449c7ba
// Params 0
// Checksum 0x8dfeff54, Offset: 0x2620
// Size: 0x168
function function_b53212e5()
{
    var_408fc16d = struct::get_array( "vault_alarm", "targetname" );
    wait 2;
    
    foreach ( alarm in var_408fc16d )
    {
        alarm.e_snd = spawn( "script_origin", alarm.origin );
        alarm.e_snd playloopsound( #"evt_vault_alarm" );
        wait 0.05;
    }
    
    wait 60;
    
    foreach ( alarm in var_408fc16d )
    {
        alarm.e_snd delete();
    }
}

// Namespace namespace_5449c7ba/namespace_5449c7ba
// Params 1
// Checksum 0xe74a6b83, Offset: 0x2790
// Size: 0xfc
function sams_box_step6_setup( var_5ea5c94d )
{
    level.var_79260935.w_music_box = getweapon( #"music_box" );
    callback::function_33f0ddd3( &function_33f0ddd3 );
    callback::on_disconnect( &on_disconnect );
    
    if ( !var_5ea5c94d )
    {
        level.var_79260935.s_vault_reward zm_unitrigger::create( &function_c0510b69, 64 );
        level.var_79260935.s_vault_reward thread function_be4c3b3e();
        level flag::wait_till( #"hash_60c221c7e2c660c0" );
    }
}

// Namespace namespace_5449c7ba/namespace_5449c7ba
// Params 2
// Checksum 0x3671dba3, Offset: 0x2898
// Size: 0x10c
function sams_box_step6_cleanup( var_5ea5c94d, ended_early )
{
    if ( var_5ea5c94d || ended_early )
    {
        a_e_players = getplayers();
        
        foreach ( e_player in a_e_players )
        {
            if ( !e_player util::is_spectating() )
            {
                e_player zm_weapons::weapon_give( level.var_79260935.w_music_box, 1 );
            }
        }
        
        level flag::set( #"hash_60c221c7e2c660c0" );
    }
}

// Namespace namespace_5449c7ba/namespace_5449c7ba
// Params 1
// Checksum 0x66b6b364, Offset: 0x29b0
// Size: 0x60, Type: bool
function function_c0510b69( e_player )
{
    str_hint = zm_utility::function_d6046228( #"hash_7976ce10c7043db7", #"hash_226401bfc284fb25" );
    self sethintstring( str_hint );
    return true;
}

// Namespace namespace_5449c7ba/namespace_5449c7ba
// Params 0
// Checksum 0xe1dff676, Offset: 0x2a18
// Size: 0x144
function function_be4c3b3e()
{
    level endon( #"end_game" );
    s_result = self waittill( #"trigger_activated" );
    e_who = s_result.e_who;
    level thread function_7c831be0( e_who );
    e_who zm_weapons::weapon_give( level.var_79260935.w_music_box, 1 );
    zm_weapons::function_603af7a8( level.var_79260935.w_music_box );
    var_b3362cd = getent( self.target, "targetname" );
    var_b3362cd hide();
    self zm_unitrigger::unregister_unitrigger( level.var_79260935.s_vault_reward.s_unitrigger );
    level flag::set( #"hash_60c221c7e2c660c0" );
}

// Namespace namespace_5449c7ba/namespace_5449c7ba
// Params 1
// Checksum 0x62b62458, Offset: 0x2b68
// Size: 0x6c
function function_7c831be0( e_player )
{
    e_player zm_orange_util::function_51b752a9( #"hash_7809b2dff89ac8d0" );
    wait 1;
    
    if ( level.var_98138d6b > 1 )
    {
        level.var_1c53964e thread zm_hms_util::function_6a0d675d( #"hash_7809b2dff89ac8d0" );
    }
}

// Namespace namespace_5449c7ba/namespace_5449c7ba
// Params 0, eflags: 0x4
// Checksum 0x743d7fcc, Offset: 0x2be0
// Size: 0x84
function private function_89c75856()
{
    var_b3362cd = getent( self.target, "targetname" );
    var_b3362cd show();
    self zm_unitrigger::create( &function_c0510b69, 64 );
    self thread function_be4c3b3e();
}

// Namespace namespace_5449c7ba/namespace_5449c7ba
// Params 0, eflags: 0x4
// Checksum 0xb74b1af8, Offset: 0x2c70
// Size: 0x6c
function private on_disconnect()
{
    if ( self hasweapon( level.var_79260935.w_music_box ) )
    {
        /#
            iprintln( "<dev string:x38>" );
        #/
        
        level.var_79260935.s_vault_reward function_89c75856();
    }
}

// Namespace namespace_5449c7ba/namespace_5449c7ba
// Params 1, eflags: 0x4
// Checksum 0x488296a4, Offset: 0x2ce8
// Size: 0xa4
function private function_33f0ddd3( s_event )
{
    if ( s_event.event === "take_weapon" && s_event.weapon === level.var_79260935.w_music_box && self.var_3b55baa1 !== level.var_79260935.w_music_box )
    {
        /#
            iprintln( "<dev string:x38>" );
        #/
        
        level.var_79260935.s_vault_reward function_89c75856();
    }
}

// Namespace namespace_5449c7ba/namespace_5449c7ba
// Params 0
// Checksum 0x97f7d602, Offset: 0x2d98
// Size: 0x24
function function_96d95cf5()
{
    level.var_79260935.s_vault_reward function_89c75856();
}

