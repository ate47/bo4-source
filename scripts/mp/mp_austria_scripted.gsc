#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\gameobjects_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\mp_common\draft;

#namespace mp_austria_scripted;

// Namespace mp_austria_scripted/mp_austria_scripted
// Params 0, eflags: 0x2
// Checksum 0x497ae1d1, Offset: 0x630
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"mp_austria_scripted", &__init__, &__main__, undefined );
}

// Namespace mp_austria_scripted/mp_austria_scripted
// Params 0
// Checksum 0x39174140, Offset: 0x680
// Size: 0xbc
function __init__()
{
    callback::on_game_playing( &on_game_playing );
    clientfield::register( "world", "flip_skybox", 1, 1, "int" );
    clientfield::register( "scriptmover", "zombie_has_eyes", 1, 1, "int" );
    level scene::add_scene_func( #"p8_fxanim_mp_austria_finger_trap_01_bundle", &function_d63cfc37, "init" );
}

// Namespace mp_austria_scripted/mp_austria_scripted
// Params 0
// Checksum 0x759e255b, Offset: 0x748
// Size: 0x74
function __main__()
{
    level.var_f3e25805 = &prematch_init;
    
    if ( getdvarint( #"hash_73f5861d8ae7d426", 1 ) )
    {
        level thread function_304304b4();
    }
    
    level thread function_34fc666e();
}

// Namespace mp_austria_scripted/mp_austria_scripted
// Params 0
// Checksum 0x39a6f820, Offset: 0x7c8
// Size: 0xfc
function on_game_playing()
{
    function_208c2a11();
    level scene::add_scene_func( #"p8_fxanim_mp_austria_finger_trap_01_bundle", &function_7ea86b26, "finger_down" );
    level thread scene::play( #"p8_fxanim_mp_austria_finger_trap_button_bundle", "button_out" );
    button = struct::get( "finger_trap_button" );
    
    if ( getgametypesetting( #"allowmapscripting" ) )
    {
        button.mdl_gameobject gameobjects::set_onuse_event( &function_dc12d0bd );
        return;
    }
    
    button.mdl_gameobject gameobjects::disable_object();
}

// Namespace mp_austria_scripted/mp_austria_scripted
// Params 0
// Checksum 0x7ea3dd8a, Offset: 0x8d0
// Size: 0x234
function prematch_init()
{
    if ( !getdvarint( #"hash_14d0ca427f597ef5", 1 ) )
    {
        n_delay = randomintrange( 20, 35 );
        level scene::add_scene_func( #"p8_fxanim_mp_austria_rocket_bundle", &function_6eeb5130, "play" );
        level scene::add_scene_func( #"p8_fxanim_mp_austria_rocket_bundle", &function_6e9fced0, "done" );
        level util::delay( n_delay, "game_ended", &scene::play, #"p8_fxanim_mp_austria_rocket_bundle" );
    }
    
    if ( util::isfirstround() )
    {
        while ( !draft::function_d255fb3e() )
        {
            waitframe( 1 );
        }
        
        exploder::exploder( "fxexp_teleport_end" );
        exploder::kill_exploder( "fxexp_teleport_start" );
        
        if ( getdvarint( #"hash_2dc42400fe4ca7ed", 0 ) )
        {
            var_cc166ca7 = getent( "zombies_eating_to_ai_vignette_trig", "targetname" );
            var_cc166ca7 callback::on_trigger( &zombies_eating_to_ai_vignette_trig );
            scene::add_scene_func( #"hash_7bdba6315b440b7c", &function_bf7a2005, "loop" );
            level thread scene::play( #"hash_7bdba6315b440b7c", "loop" );
        }
    }
}

// Namespace mp_austria_scripted/mp_austria_scripted
// Params 1
// Checksum 0x708e2742, Offset: 0xb10
// Size: 0x34
function function_6eeb5130( a_ents )
{
    setdvar( #"hash_14d0ca427f597ef5", 1 );
}

// Namespace mp_austria_scripted/mp_austria_scripted
// Params 1
// Checksum 0xfd91f386, Offset: 0xb50
// Size: 0x2c
function function_6e9fced0( a_ents )
{
    level clientfield::set( "flip_skybox", 1 );
}

// Namespace mp_austria_scripted/mp_austria_scripted
// Params 1
// Checksum 0x10e481db, Offset: 0xb88
// Size: 0x82
function function_bf7a2005( a_ents )
{
    foreach ( ent in a_ents )
    {
        ent.team = #"team4";
    }
}

// Namespace mp_austria_scripted/mp_austria_scripted
// Params 1
// Checksum 0xfa9fb4fe, Offset: 0xc18
// Size: 0x34
function zombies_eating_to_ai_vignette_trig( info )
{
    level thread scene::play( #"hash_7bdba6315b440b7c", "Shot 1" );
}

// Namespace mp_austria_scripted/mp_austria_scripted
// Params 1
// Checksum 0x814b720a, Offset: 0xc58
// Size: 0x1b4
function function_dc12d0bd( activator )
{
    level endon( #"game_ended" );
    self endon( #"death" );
    self gameobjects::disable_object();
    level thread scene::play( #"p8_fxanim_mp_austria_finger_trap_button_bundle", "button_in" );
    level scene::play( #"p8_fxanim_mp_austria_finger_trap_01_bundle", "finger_down" );
    level thread scene::play( #"p8_fxanim_mp_austria_finger_trap_01_bundle", "down_idle" );
    level thread scene::play( #"p8_fxanim_mp_austria_finger_trap_button_bundle", "button_in_idle" );
    wait 0;
    level scene::play( #"p8_fxanim_mp_austria_finger_trap_01_bundle", "finger_up" );
    level thread scene::play( #"p8_fxanim_mp_austria_finger_trap_01_bundle", "up_idle" );
    wait 10;
    level scene::play( #"p8_fxanim_mp_austria_finger_trap_button_bundle", "button_out" );
    level thread scene::play( #"p8_fxanim_mp_austria_finger_trap_button_bundle", "button_out_idle" );
    self gameobjects::enable_object();
}

// Namespace mp_austria_scripted/mp_austria_scripted
// Params 1
// Checksum 0x54e275f9, Offset: 0xe18
// Size: 0xcc
function function_d63cfc37( a_ents )
{
    self.t_kill = getent( "finger_trap_trig", "targetname" );
    self.clip = getent( "finger_trap_clip", "targetname" );
    self.clip connectpaths();
    self.clip notsolid();
    self.t_kill triggerenable( 0 );
    self.t_kill callback::on_trigger( &function_1eff721a );
}

// Namespace mp_austria_scripted/mp_austria_scripted
// Params 1
// Checksum 0x85b15840, Offset: 0xef0
// Size: 0x154
function function_7ea86b26( a_ents )
{
    level endon( #"game_ended" );
    finger = a_ents[ #"prop 1" ];
    t_kill = self.t_kill;
    clip = self.clip;
    
    if ( !isdefined( finger ) )
    {
        return;
    }
    
    finger endon( #"death" );
    wait 0.1;
    t_kill triggerenable( 1 );
    finger waittill( #"stop_damage" );
    t_kill triggerenable( 0 );
    clip solid();
    clip disconnectpaths();
    finger waittill( #"connect_paths" );
    clip connectpaths();
    clip notsolid();
}

// Namespace mp_austria_scripted/mp_austria_scripted
// Params 1
// Checksum 0x266d6832, Offset: 0x1050
// Size: 0x56
function function_1220cf5( finger )
{
    finger endon( #"stop_damage", #"death" );
    
    while ( true )
    {
        destroy_equipment( finger );
        waitframe( 1 );
    }
}

// Namespace mp_austria_scripted/mp_austria_scripted
// Params 1
// Checksum 0x32379f48, Offset: 0x10b0
// Size: 0x236
function destroy_equipment( finger )
{
    t_kill = finger.t_kill;
    equipment = getentitiesinradius( t_kill.origin, 256 );
    
    foreach ( device in equipment )
    {
        if ( isdefined( device ) && device istouching( t_kill ) )
        {
            if ( is_equipment( device ) )
            {
                switch ( device.weapon.name )
                {
                    case #"eq_tripwire":
                        device [[ level.var_2e06b76a ]]();
                        break;
                    case #"trophy_system":
                        device [[ level.var_4f3822f4 ]]();
                        break;
                    case #"cymbal_monkey":
                        device [[ level.var_7c5c96dc ]]();
                        break;
                    case #"homunculus":
                        device [[ level.var_cc310d06 ]]();
                        break;
                    case #"eq_sensor":
                        device [[ level.var_9911d36f ]]();
                        break;
                    case #"eq_concertina_wire":
                        device [[ level.var_94029383 ]]();
                        break;
                    case #"gadget_supplypod":
                        device notify( #"death" );
                        break;
                    default:
                        break;
                }
            }
        }
    }
}

// Namespace mp_austria_scripted/mp_austria_scripted
// Params 1
// Checksum 0xe146e4f9, Offset: 0x12f0
// Size: 0x13a, Type: bool
function is_equipment( entity )
{
    if ( isdefined( entity.weapon ) )
    {
        weapon = entity.weapon;
        
        if ( weapon.name === #"ability_smart_cover" || weapon.name === #"eq_tripwire" || weapon.name === #"trophy_system" || weapon.name === #"eq_concertina_wire" || weapon.name === #"eq_sensor" || weapon.name === #"cymbal_monkey" || weapon.name === #"gadget_supplypod" || weapon.name === #"homunculus" )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace mp_austria_scripted/mp_austria_scripted
// Params 1
// Checksum 0x700cce10, Offset: 0x1438
// Size: 0xcc
function function_1eff721a( info )
{
    e_player = info.activator;
    
    if ( isalive( e_player ) )
    {
        if ( isvehicle( e_player ) )
        {
            e_player dodamage( 100000, e_player.origin, undefined, undefined, "none", "MOD_EXPLOSIVE" );
            return;
        }
        
        e_player dodamage( e_player.maxhealth, e_player.origin, undefined, undefined, "none", "MOD_IMPACT" );
    }
}

// Namespace mp_austria_scripted/mp_austria_scripted
// Params 0
// Checksum 0xd1d08a58, Offset: 0x1510
// Size: 0x438
function function_304304b4()
{
    vign_list = array( #"hash_793682c8025c8a72", #"hash_248819bd6d0bebad", #"hash_248816bd6d0be694", #"aib_vign_tplt_prebtl_zmb_bang_against_door_03", #"hash_248814bd6d0be32e", #"hash_4025d13190c3e1da", #"hash_7e69aaf57b23bac7", #"hash_248815bd6d0be4e1", #"aib_vign_tplt_prebtl_zmb_bang_against_door_05_left", #"aib_vign_tplt_prebtl_zmb_bang_against_door_05_right", #"hash_248812bd6d0bdfc8", #"hash_faf914864952c40", #"hash_3e4b60276426aa55", #"hash_4f6cfe6c270e930b", #"hash_7ec086db9c96cd4d", #"hash_38e510b2ec569146", #"hash_4f6cff6c270e94be", #"hash_22dc2b75f56a628a", #"hash_202837d7ef0f7577", #"hash_632e390849174ebc", #"hash_632e3c08491753d5", #"hash_632e3b0849175222", #"hash_632e3608491749a3", #"hash_632e3508491747f0", #"aib_vign_tplt_prebtl_zmb_pinned_on_grnd_06", #"aib_vign_tplt_prebtl_zmb_pinned_on_grnd_07", #"hash_632e420849175e07", #"hash_632e410849175c54", #"aib_vign_tplt_prebtl_zmb_pinned_on_grnd_10", #"hash_632ab50849143899", #"hash_632ab20849143380", #"hash_3ba197ae1ed4fcc6", #"aib_vign_tplt_prebtl_zmb_reach_thru_wndw_01_left_austria", #"hash_71892698b9803fcf", #"hash_3ba196ae1ed4fb13", #"aib_vign_tplt_prebtl_zmb_reach_thru_wndw_02_left", #"hash_1829df3c0efc547e", #"hash_c3eb0cc21539b5", #"aib_vign_tplt_prebtl_zmb_stuck_in_car_02", #"aib_vign_tplt_prebtl_zmb_trapped_behind_wndw_01_austria", #"aib_vign_tplt_prebtl_zmb_trapped_behind_wndw_02_austria", #"aib_vign_tplt_prebtl_zmb_trapped_behind_wndw_03_austria", #"aib_vign_tplt_prebtl_zmb_trapped_behind_wndw_04_austria", #"aib_vign_tplt_prebtl_zmb_trapped_behind_wndw_04_left", #"hash_3573abae9f3ec484", #"hash_763721b8359db772", #"hash_31690edc5bfac5e", #"hash_687d46fb134c93d3" );
    
    foreach ( vign_name in vign_list )
    {
        waitframe( 1 );
        scenes = struct::get_array( vign_name, "scriptbundlename" );
        
        if ( scenes.size == 0 )
        {
            /#
                print( "<dev string:x38>" + function_9e72a96( vign_name ) + "<dev string:x59>" + "<dev string:x63>" );
            #/
            
            continue;
        }
        
        scene::add_scene_func( vign_name, &function_9b8bc25c );
        level thread scene::play( vign_name );
    }
}

// Namespace mp_austria_scripted/mp_austria_scripted
// Params 1
// Checksum 0x97e3e29f, Offset: 0x1950
// Size: 0x1cc
function function_9b8bc25c( a_ents )
{
    foreach ( ent in a_ents )
    {
        ent setcandamage( 1 );
        ent clientfield::set( "zombie_has_eyes", 1 );
    }
    
    /#
        self notify( "<dev string:x67>" );
        self endon( "<dev string:x67>" );
        
        while ( getdvarint( #"hash_51e8e64c588c30af", 0 ) )
        {
            waitframe( 20 );
            print3d( self.origin, function_9e72a96( self.scriptbundlename ), ( 0, 1, 0 ), 1, 0.3, 20 );
            
            foreach ( ent in a_ents )
            {
                line( self.origin, ent.origin, ( 0, 1, 0 ), 1, 0, 20 );
            }
        }
    #/
}

// Namespace mp_austria_scripted/mp_austria_scripted
// Params 0
// Checksum 0xe915a4f8, Offset: 0x1b28
// Size: 0x6c
function function_34fc666e()
{
    if ( util::isfirstround() && draft::is_draft_this_round() )
    {
        while ( !draft::function_d255fb3e() )
        {
            waitframe( 1 );
        }
        
        exploder::exploder( "fxexp_teleport_start" );
    }
}

// Namespace mp_austria_scripted/mp_austria_scripted
// Params 0
// Checksum 0x685789c5, Offset: 0x1ba0
// Size: 0xa4
function function_208c2a11()
{
    level util::delay( randomfloatrange( 7, 10 ), "game_ended", &function_3f6f8daa );
    level util::delay( randomfloatrange( 15, 20 ), "game_ended", &function_77156d1e );
}

// Namespace mp_austria_scripted/mp_austria_scripted
// Params 0
// Checksum 0xb60d37cc, Offset: 0x1c50
// Size: 0x230
function function_3f6f8daa()
{
    level endon( #"game_ended" );
    var_ef876e79 = [];
    var_ef876e79[ 1 ] = "vox_germ_german_radio_17";
    var_ef876e79[ 2 ] = "vox_germ_german_radio_18";
    var_ef876e79[ 3 ] = "vox_germ_german_radio_2";
    var_ef876e79[ 4 ] = "vox_germ_german_radio_3";
    var_ef876e79[ 5 ] = "vox_germ_german_radio_4";
    var_ef876e79[ 6 ] = "vox_germ_german_radio_5";
    var_ef876e79[ 7 ] = "vox_germ_german_radio_6";
    var_ef876e79[ 8 ] = "vox_germ_german_radio_7";
    var_ef876e79[ 9 ] = "vox_germ_german_radio_8";
    var_ef876e79[ 10 ] = "vox_germ_german_radio_9";
    speaker_pos = ( 2765, 2335, 701 );
    speaker = util::spawn_model( #"tag_origin", speaker_pos );
    
    while ( true )
    {
        foreach ( radio_line in var_ef876e79 )
        {
            if ( !isdefined( speaker ) )
            {
                return;
            }
            
            speaker playsoundwithnotify( radio_line, "radio_done" );
            speaker waittill( #"radio_done", #"death" );
            wait 0.2;
        }
        
        wait randomfloatrange( 30, 35 );
    }
}

// Namespace mp_austria_scripted/mp_austria_scripted
// Params 0
// Checksum 0xeddef5b5, Offset: 0x1e88
// Size: 0x58c
function function_77156d1e()
{
    level endon( #"game_ended" );
    var_a6f9d9b4 = [];
    var_a6f9d9b4[ 1 ] = [];
    var_a6f9d9b4[ 2 ] = [];
    var_a6f9d9b4[ 3 ] = [];
    var_a6f9d9b4[ 4 ] = [];
    var_a6f9d9b4[ 5 ] = [];
    var_a6f9d9b4[ 6 ] = [];
    var_a6f9d9b4[ 7 ] = [];
    var_a6f9d9b4[ 8 ] = [];
    var_a6f9d9b4[ 9 ] = [];
    var_a6f9d9b4[ 1 ][ 0 ] = "vox_plr_6_skit1_0";
    var_a6f9d9b4[ 1 ][ 1 ] = "vox_plr_5_skit1_1";
    var_a6f9d9b4[ 1 ][ 2 ] = "vox_plr_8_skit1_2";
    var_a6f9d9b4[ 2 ][ 0 ] = "vox_plr_7_skit2_0";
    var_a6f9d9b4[ 2 ][ 1 ] = "vox_plr_8_skit2_1";
    var_a6f9d9b4[ 2 ][ 2 ] = "vox_plr_6_skit2_2";
    var_a6f9d9b4[ 2 ][ 3 ] = "vox_plr_5_skit2_3";
    var_a6f9d9b4[ 2 ][ 4 ] = "vox_plr_6_skit2_4";
    var_a6f9d9b4[ 3 ][ 0 ] = "vox_plr_8_skit3_0";
    var_a6f9d9b4[ 3 ][ 1 ] = "vox_plr_8_skit3_1";
    var_a6f9d9b4[ 3 ][ 2 ] = "vox_plr_8_skit3_2";
    var_a6f9d9b4[ 3 ][ 3 ] = "vox_plr_5_skit3_3";
    var_a6f9d9b4[ 3 ][ 3 ] = "vox_plr_7_skit3_4";
    var_a6f9d9b4[ 4 ][ 0 ] = "vox_plr_6_skit4_0";
    var_a6f9d9b4[ 4 ][ 1 ] = "vox_plr_5_skit4_1";
    var_a6f9d9b4[ 4 ][ 2 ] = "vox_plr_7_skit4_2";
    var_a6f9d9b4[ 4 ][ 3 ] = "vox_plr_6_skit4_3";
    var_a6f9d9b4[ 5 ][ 0 ] = "vox_plr_6_skit5_0";
    var_a6f9d9b4[ 5 ][ 1 ] = "vox_plr_8_skit5_1";
    var_a6f9d9b4[ 5 ][ 2 ] = "vox_plr_6_skit5_2";
    var_a6f9d9b4[ 5 ][ 3 ] = "vox_plr_5_skit5_3";
    var_a6f9d9b4[ 5 ][ 4 ] = "vox_plr_6_skit5_4";
    var_a6f9d9b4[ 6 ][ 0 ] = "vox_plr_7_skit6_0";
    var_a6f9d9b4[ 6 ][ 1 ] = "vox_plr_6_skit6_1";
    var_a6f9d9b4[ 6 ][ 2 ] = "vox_plr_7_skit6_2";
    var_a6f9d9b4[ 7 ][ 0 ] = "vox_plr_6_skit7_0";
    var_a6f9d9b4[ 7 ][ 1 ] = "vox_plr_5_skit7_1";
    var_a6f9d9b4[ 7 ][ 2 ] = "vox_plr_8_skit7_2";
    var_a6f9d9b4[ 8 ][ 0 ] = "vox_plr_8_skit8_0";
    var_a6f9d9b4[ 8 ][ 1 ] = "vox_plr_6_skit8_1";
    var_a6f9d9b4[ 8 ][ 2 ] = "vox_plr_8_skit8_2";
    var_a6f9d9b4[ 9 ][ 0 ] = "vox_plr_5_skit9_0";
    var_a6f9d9b4[ 9 ][ 1 ] = "vox_plr_6_skit9_1";
    var_a6f9d9b4[ 9 ][ 2 ] = "vox_plr_5_skit9_2";
    var_a6f9d9b4 = array::randomize( var_a6f9d9b4 );
    speaker_pos = ( 3950, -957, 686 );
    speaker = util::spawn_model( #"tag_origin", speaker_pos );
    
    while ( true )
    {
        foreach ( list in var_a6f9d9b4 )
        {
            foreach ( line in list )
            {
                if ( !isdefined( speaker ) )
                {
                    return;
                }
                
                speaker playsoundwithnotify( line, "skit_done" );
                speaker waittill( #"skit_done", #"death" );
                wait 0.2;
            }
            
            wait randomfloatrange( 15, 45 );
        }
    }
}

