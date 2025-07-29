#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\gameobjects_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\mp_common\draft;

#namespace mp_zombie_museum_scripted;

// Namespace mp_zombie_museum_scripted/mp_zombie_museum_scripted
// Params 0, eflags: 0x2
// Checksum 0xcf838b81, Offset: 0x148
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"mp_zombie_museum_scripted", &__init__, &__main__, undefined );
}

// Namespace mp_zombie_museum_scripted/mp_zombie_museum_scripted
// Params 0
// Checksum 0x7312ab2e, Offset: 0x198
// Size: 0x84
function __init__()
{
    callback::on_game_playing( &on_game_playing );
    clientfield::register( "scriptmover", "zombie_has_eyes", 1, 1, "int" );
    clientfield::register( "scriptmover", "exhibit_vo", 1, 4, "int" );
}

// Namespace mp_zombie_museum_scripted/mp_zombie_museum_scripted
// Params 0
// Checksum 0x12e2059, Offset: 0x228
// Size: 0xcc
function __main__()
{
    scene::add_scene_func( #"p8_fxanim_mp_zmuseum_util_closet_vig_bundle", &function_35fa13e8, "play" );
    level.var_f3e25805 = &prematch_init;
    
    if ( getgametypesetting( #"allowmapscripting" ) )
    {
        if ( getdvarint( #"hash_7ac069c0a6148b32", 1 ) )
        {
            level thread function_304304b4();
        }
        
        level thread function_34fc666e();
    }
}

// Namespace mp_zombie_museum_scripted/mp_zombie_museum_scripted
// Params 0
// Checksum 0xcb09203f, Offset: 0x300
// Size: 0x54
function prematch_init()
{
    level thread scene::stop( #"p8_fxanim_mp_zmuseum_chaos_sidea_bundle", 1 );
    level thread scene::stop( #"p8_fxanim_mp_zmuseum_chaos_sideb_bundle", 1 );
}

// Namespace mp_zombie_museum_scripted/mp_zombie_museum_scripted
// Params 0
// Checksum 0xa33a21ef, Offset: 0x360
// Size: 0x34
function on_game_playing()
{
    level thread function_489bd1e9();
    level thread function_208c2a11();
}

// Namespace mp_zombie_museum_scripted/mp_zombie_museum_scripted
// Params 0
// Checksum 0xab1b9903, Offset: 0x3a0
// Size: 0x530
function function_304304b4()
{
    vign_list = array( #"hash_793682c8025c8a72", #"hash_248819bd6d0bebad", #"hash_248816bd6d0be694", #"aib_vign_tplt_prebtl_zmb_bang_against_door_03", #"hash_248814bd6d0be32e", #"hash_4025d13190c3e1da", #"hash_7e69aaf57b23bac7", #"hash_248815bd6d0be4e1", #"aib_vign_tplt_prebtl_zmb_bang_against_door_05_left", #"aib_vign_tplt_prebtl_zmb_bang_against_door_05_right", #"hash_248812bd6d0bdfc8", #"hash_faf914864952c40", #"hash_3e4b60276426aa55", #"hash_4f6cfe6c270e930b", #"hash_7ec086db9c96cd4d", #"hash_38e510b2ec569146", #"hash_4f6cff6c270e94be", #"hash_22dc2b75f56a628a", #"hash_202837d7ef0f7577", #"hash_632e390849174ebc", #"hash_632e3c08491753d5", #"hash_632e3b0849175222", #"hash_632e3608491749a3", #"hash_632e3508491747f0", #"aib_vign_tplt_prebtl_zmb_pinned_on_grnd_06", #"aib_vign_tplt_prebtl_zmb_pinned_on_grnd_07", #"hash_632e420849175e07", #"hash_632e410849175c54", #"aib_vign_tplt_prebtl_zmb_pinned_on_grnd_10", #"hash_632ab50849143899", #"hash_632ab20849143380", #"hash_3ba197ae1ed4fcc6", #"hash_28fb7e04d65ac0c2", #"hash_71892698b9803fcf", #"hash_3ba196ae1ed4fb13", #"aib_vign_tplt_prebtl_zmb_reach_thru_wndw_02_left", #"hash_1829df3c0efc547e", #"hash_c3eb0cc21539b5", #"aib_vign_tplt_prebtl_zmb_stuck_in_car_02", #"hash_76371db8359db0a6", #"aib_vign_tplt_prebtl_zmb_trapped_behind_wndw_02", #"hash_76371bb8359dad40", #"hash_763722b8359db925", #"aib_vign_tplt_prebtl_zmb_trapped_behind_wndw_04_left", #"hash_3573abae9f3ec484", #"hash_763721b8359db772", #"hash_31690edc5bfac5e", #"hash_687d46fb134c93d3", #"hash_4af8d26882a98651", #"hash_2f194b687256acac", #"hash_39cea46878fc2ee7", #"hash_65245568918911aa", #"aib_vign_tplt_prebtl_zmb_astronaut_zm_on_ceiling_05_a", #"aib_vign_tplt_prebtl_zmb_astronaut_zm_on_ceiling_06_a", #"aib_vign_tplt_prebtl_animatronic_zmb_01", #"aib_vign_tplt_prebtl_animatronic_zmb_02", #"aib_vign_tplt_prebtl_animatronic_zmb_03", #"aib_vign_tplt_prebtl_animatronic_zmb_04", #"aib_vign_tplt_prebtl_animatronic_zmb_05", #"hash_5d6ba6fd6755f42c", #"hash_5d6bacfd6755fe5e" );
    
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
        
        /#
            scene::add_scene_func( vign_name, &function_4ee0d67 );
        #/
        
        level thread scene::play( vign_name );
    }
}

// Namespace mp_zombie_museum_scripted/mp_zombie_museum_scripted
// Params 1
// Checksum 0x73c8b1c0, Offset: 0x8d8
// Size: 0x34c
function function_9b8bc25c( a_ents )
{
    exclude_kill = array( #"hash_4af8d26882a98651", #"hash_2f194b687256acac", #"hash_39cea46878fc2ee7", #"hash_65245568918911aa", #"aib_vign_tplt_prebtl_zmb_astronaut_zm_on_ceiling_05_a", #"aib_vign_tplt_prebtl_zmb_astronaut_zm_on_ceiling_06_a", #"aib_vign_tplt_prebtl_animatronic_zmb_01", #"aib_vign_tplt_prebtl_animatronic_zmb_02", #"aib_vign_tplt_prebtl_animatronic_zmb_03", #"aib_vign_tplt_prebtl_animatronic_zmb_04", #"aib_vign_tplt_prebtl_animatronic_zmb_05", #"hash_5d6ba6fd6755f42c", #"hash_5d6bacfd6755fe5e", #"hash_632e390849174ebc" );
    var_7a4fb99 = array( #"aib_vign_tplt_prebtl_animatronic_zmb_01", #"aib_vign_tplt_prebtl_animatronic_zmb_02", #"aib_vign_tplt_prebtl_animatronic_zmb_03", #"aib_vign_tplt_prebtl_animatronic_zmb_04", #"aib_vign_tplt_prebtl_animatronic_zmb_05", #"hash_5d6ba6fd6755f42c", #"hash_5d6bacfd6755fe5e" );
    var_29942081 = array( #"aib_vign_tplt_prebtl_animatronic_zmb_01", #"aib_vign_tplt_prebtl_animatronic_zmb_02", #"aib_vign_tplt_prebtl_animatronic_zmb_03", #"aib_vign_tplt_prebtl_animatronic_zmb_04", #"aib_vign_tplt_prebtl_animatronic_zmb_05", #"hash_5d6ba6fd6755f42c", #"hash_5d6bacfd6755fe5e", #"hash_4af8d26882a98651", #"hash_2f194b687256acac", #"hash_39cea46878fc2ee7", #"hash_65245568918911aa", #"aib_vign_tplt_prebtl_zmb_astronaut_zm_on_ceiling_05_a", #"aib_vign_tplt_prebtl_zmb_astronaut_zm_on_ceiling_06_a" );
    
    if ( !isinarray( exclude_kill, self.scriptbundlename ) )
    {
        array::run_all( a_ents, &setcandamage, 1 );
    }
    
    if ( isinarray( var_7a4fb99, self.scriptbundlename ) )
    {
        array::run_all( a_ents, &notsolid );
    }
    
    if ( !isinarray( var_29942081, self.scriptbundlename ) )
    {
        array::thread_all( a_ents, &clientfield::set, "zombie_has_eyes", 1 );
    }
}

/#

    // Namespace mp_zombie_museum_scripted/mp_zombie_museum_scripted
    // Params 1
    // Checksum 0x604de0f2, Offset: 0xc30
    // Size: 0x134, Type: dev
    function function_4ee0d67( a_ents )
    {
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
    }

#/

// Namespace mp_zombie_museum_scripted/mp_zombie_museum_scripted
// Params 0
// Checksum 0x27e72f23, Offset: 0xd70
// Size: 0xd4
function function_34fc666e()
{
    if ( getgametypesetting( #"allowmapscripting" ) && util::isfirstround() && draft::is_draft_this_round() )
    {
        level endon( #"game_ended" );
        
        while ( !draft::function_d255fb3e() )
        {
            waitframe( 1 );
        }
        
        level thread scene::play( #"p8_fxanim_mp_zmuseum_chaos_sidea_bundle" );
        waitframe( 1 );
        level thread scene::play( #"p8_fxanim_mp_zmuseum_chaos_sideb_bundle" );
    }
}

// Namespace mp_zombie_museum_scripted/mp_zombie_museum_scripted
// Params 0
// Checksum 0x4d0400a0, Offset: 0xe50
// Size: 0x104
function function_489bd1e9()
{
    buttons = struct::get_array( "exhibit_vo_button" );
    
    if ( getgametypesetting( #"allowmapscripting" ) )
    {
        foreach ( button in buttons )
        {
            button.mdl_gameobject.var_ee7ff721 = button.var_ee7ff721;
            button.mdl_gameobject gameobjects::set_onuse_event( &function_4967eb5a );
        }
        
        return;
    }
    
    button.mdl_gameobject gameobjects::disable_object();
}

// Namespace mp_zombie_museum_scripted/mp_zombie_museum_scripted
// Params 1
// Checksum 0xc97b9dd6, Offset: 0xf60
// Size: 0x16c
function function_4967eb5a( activator )
{
    level endon( #"game_ended" );
    self endon( #"death" );
    
    if ( !isdefined( self.var_ee7ff721 ) )
    {
        return;
    }
    
    switch ( self.var_ee7ff721 )
    {
        case #"asylum":
            value = 1;
            break;
        case #"moon":
            value = 2;
            break;
        case #"titanic":
            value = 3;
            break;
        case #"tranzit":
            value = 4;
            break;
        default:
            value = 0;
            break;
    }
    
    self gameobjects::disable_object( 1 );
    self clientfield::set( "exhibit_vo", value );
    wait 60;
    
    if ( isdefined( self ) )
    {
        self gameobjects::enable_object( 1 );
        self clientfield::set( "exhibit_vo", 0 );
    }
}

// Namespace mp_zombie_museum_scripted/mp_zombie_museum_scripted
// Params 1
// Checksum 0x1e0322ea, Offset: 0x10d8
// Size: 0xc4
function function_35fa13e8( a_ents )
{
    fakeactor = a_ents[ #"fakeactor 1" ];
    
    if ( isdefined( fakeactor ) )
    {
        level endon( #"game_ended" );
        fakeactor setcandamage( 1 );
        info = fakeactor waittill( #"damage", #"death" );
        self util::delay( 1, undefined, &scene::stop );
    }
}

// Namespace mp_zombie_museum_scripted/mp_zombie_museum_scripted
// Params 0
// Checksum 0x5e9bb426, Offset: 0x11a8
// Size: 0x6c
function function_208c2a11()
{
    var_ffcbc13a = struct::get( "lobby_vo_spot" );
    var_ffcbc13a util::delay( randomfloatrange( 5, 8 ), undefined, &randomlocstom );
}

// Namespace mp_zombie_museum_scripted/mp_zombie_museum_scripted
// Params 0
// Checksum 0x8825bdc, Offset: 0x1220
// Size: 0xd8
function randomlocstom()
{
    level endon( #"game_ended" );
    speaker = util::spawn_model( #"tag_origin", self.origin, self.angles );
    
    while ( isdefined( speaker ) )
    {
        speaker playsoundwithnotify( "vox_muse_lobby_pa", "pa_done" );
        speaker waittill( #"pa_done", #"death" );
        wait randomfloatrange( 60, 120 );
    }
}

