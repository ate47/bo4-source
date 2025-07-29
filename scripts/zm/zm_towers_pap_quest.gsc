#using scripts\core_common\ai\archetype_tiger;
#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\ai_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\fx_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;
#using scripts\zm\zm_towers_util;
#using scripts\zm_common\util\ai_gladiator_util;
#using scripts\zm_common\util\ai_tiger_util;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_customgame;
#using scripts\zm_common\zm_pack_a_punch;
#using scripts\zm_common\zm_score;
#using scripts\zm_common\zm_ui_inventory;
#using scripts\zm_common\zm_utility;

#namespace zm_towers_pap_quest;

// Namespace zm_towers_pap_quest/zm_towers_pap_quest
// Params 0
// Checksum 0x966fdbe, Offset: 0xa48
// Size: 0x32c
function init()
{
    level._effect[ #"fx_challenge_head_blood_burst" ] = "maps/zm_towers/fx8_challenge_head_blood_burst";
    level._effect[ #"fx_challenge_head_blood_drips" ] = "maps/zm_towers/fx8_challenge_head_blood_drips";
    function_90a833e2();
    level thread function_5ad3e281();
    scene::add_scene_func( "p8_fxanim_zm_towers_pap_sarcophagus_spikes_bundle", &function_64f2d6de, "init" );
    level thread scene::init( "p8_fxanim_zm_towers_pap_door_blue_bundle" );
    level thread scene::init( "p8_fxanim_zm_towers_pap_door_red_bundle" );
    level thread scene::init( "p8_fxanim_zm_towers_pap_sarcophagus_bundle" );
    n_pap_enabled = zm_custom::function_901b751c( #"zmpapenabled" );
    
    if ( n_pap_enabled == 2 || isdefined( level.var_fe2bb2ac ) && level.var_fe2bb2ac || isdefined( level.var_15747fb1 ) && level.var_15747fb1 )
    {
        level thread function_a7faeaaf();
    }
    else if ( n_pap_enabled == 0 )
    {
        level flag::set( #"pap_disabled" );
        mdl_sentinel_artifact = getent( "mdl_pap_quest_sentinel_artifact", "targetname" );
        mdl_sentinel_artifact hide();
        mdl_sentinel_artifact notsolid();
        function_a73ff9f2();
    }
    
    level thread function_ce84849b();
    a_mdl_pap_room_debris_clip = getentarray( "mdl_pap_room_debris_clip", "targetname" );
    
    foreach ( mdl_pap_room_debris_clip in a_mdl_pap_room_debris_clip )
    {
        mdl_pap_room_debris_clip disconnectpaths();
    }
    
    var_f7afe1a0 = getent( "sarcophagus_destroyed", "targetname" );
    var_f7afe1a0 hide();
}

// Namespace zm_towers_pap_quest/zm_towers_pap_quest
// Params 0
// Checksum 0x5fa8d57f, Offset: 0xd80
// Size: 0x3c
function function_5ad3e281()
{
    level flag::wait_till( #"hash_2a7d461c7eff8179" );
    changeadvertisedstatus( 0 );
}

// Namespace zm_towers_pap_quest/zm_towers_pap_quest
// Params 0
// Checksum 0x95b334bd, Offset: 0xdc8
// Size: 0x174
function function_a7faeaaf()
{
    level flag::wait_till( "all_players_spawned" );
    level flag::set( #"hash_3d833ecc64915d8d" );
    level flag::set( #"hash_d38ff215be3a4fc" );
    level flag::set( #"hash_4142472dec557d03" );
    level flag::set( #"hash_45b6b1ee5d5038b4" );
    level flag::set( #"hash_1eda3c39867cbe53" );
    level flag::set( #"hash_1b7828aafd3f83f4" );
    level flag::set( #"hash_15b79db61753c205" );
    level flag::set( #"hash_34c1fdccaa5279bc" );
    flag::wait_till_any( array( "connect_ra_tunnel_to_body_pit", "connect_zeus_tunnel_to_flooded_crypt" ) );
    level flag::set( #"hash_2cf71ce4a3d1c081" );
}

// Namespace zm_towers_pap_quest/zm_towers_pap_quest
// Params 0
// Checksum 0x6ddd4c6b, Offset: 0xf48
// Size: 0x2e4
function function_90a833e2()
{
    level flag::init( #"pap_disabled" );
    level flag::init( #"hash_2a7d461c7eff8179" );
    level flag::init( #"hash_798d51388d6e10f4" );
    level flag::init( #"hash_18134dc5b9b39a96" );
    level flag::init( #"hash_582eea77824b014d" );
    level flag::init( #"hash_5cc500f9282cd290" );
    level flag::init( #"hash_20c64c155f7a0065" );
    level flag::init( #"hash_589679a12150767a" );
    level flag::init( #"hash_4abb12b14a38d2e9" );
    level flag::init( #"hash_15f5946d4968f144" );
    level flag::init( #"hash_355567a6fa6d44d1" );
    level flag::init( #"hash_76692d6669cb0500" );
    level flag::init( #"hash_3d833ecc64915d8d" );
    level flag::init( #"hash_d38ff215be3a4fc" );
    level flag::init( #"hash_4142472dec557d03" );
    level flag::init( #"hash_45b6b1ee5d5038b4" );
    level flag::init( #"hash_1eda3c39867cbe53" );
    level flag::init( #"hash_1b7828aafd3f83f4" );
    level flag::init( #"hash_15b79db61753c205" );
    level flag::init( #"hash_34c1fdccaa5279bc" );
    level flag::init( #"hash_2cf71ce4a3d1c081" );
    level flag::init( "zm_towers_pap_quest_sentinel_artifact_exploded" );
    level flag::init( "zm_towers_pap_quest_completed" );
}

// Namespace zm_towers_pap_quest/zm_towers_pap_quest
// Params 0
// Checksum 0x449a4469, Offset: 0x1238
// Size: 0x44
function function_ce84849b()
{
    level endon( #"end_game" );
    pap_quest_init( 0 );
    function_52411f5e( 0 );
}

// Namespace zm_towers_pap_quest/zm_towers_pap_quest
// Params 1
// Checksum 0xe42a753c, Offset: 0x1288
// Size: 0xd4
function function_9b917fd5( is_powered )
{
    level flag::wait_till( "all_players_spawned" );
    self zm_pack_a_punch::set_state_hidden();
    
    if ( zm_utility::is_standard() )
    {
        level waittill( #"hash_7ca261f468171655" );
    }
    
    level flag::wait_till( "zm_towers_pap_quest_completed" );
    
    if ( !level flag::get( #"pap_disabled" ) )
    {
        self zm_pack_a_punch::function_bb629351( 1, "arriving", "arrive_anim_done" );
    }
}

// Namespace zm_towers_pap_quest/zm_towers_pap_quest
// Params 1
// Checksum 0x2d08525, Offset: 0x1368
// Size: 0x45c
function pap_quest_init( var_5ea5c94d )
{
    var_9840ab47 = getentarray( "pap_quest_encounter_triggers", "script_noteworthy" );
    
    if ( function_8b1a219a() )
    {
        array::run_all( var_9840ab47, &sethintstring, #"hash_7c465ea7da6991fb" );
    }
    else
    {
        array::run_all( var_9840ab47, &sethintstring, #"hash_2a4860e40142bac5" );
    }
    
    var_16561d51 = array( #"marauder", #"destroyer", #"both", #"tigers" );
    a_str_towers = array( #"danu", #"ra", #"odin", #"zeus" );
    var_16561d51 = array::randomize( var_16561d51 );
    level.var_4118581a = 0;
    
    foreach ( i, str_tower in a_str_towers )
    {
        level thread function_199b1814( str_tower, var_16561d51[ i ] );
    }
    
    level.var_c22016cf = 0;
    level.var_7695ff59 = 0;
    level.var_9847c460 = 0;
    level thread function_a2f4eb85();
    a_mdl_heads = getentarray( "mdl_pap_quest_head", "targetname" );
    
    foreach ( mdl_head in a_mdl_heads )
    {
        mdl_head flag::init( #"hash_26125a3306681e2" );
        mdl_head hide();
    }
    
    level thread function_d7c092b9();
    level zm_ui_inventory::function_7df6bb60( #"hash_4fce42c559430ff9", 1 );
    level zm_ui_inventory::function_7df6bb60( #"hash_6257a73f22800e57", 1 );
    level zm_ui_inventory::function_7df6bb60( #"hash_61f69ed4cbd8f2f5", 1 );
    level zm_ui_inventory::function_7df6bb60( #"hash_5114ed99a6bad03b", 1 );
    
    if ( !var_5ea5c94d )
    {
        level flag::wait_till_all( array( #"hash_3d833ecc64915d8d", #"hash_d38ff215be3a4fc", #"hash_4142472dec557d03", #"hash_45b6b1ee5d5038b4" ) );
    }
    
    level flag::set( #"hash_76692d6669cb0500" );
    function_97e78811( 0, 0 );
}

// Namespace zm_towers_pap_quest/zm_towers_pap_quest
// Params 0
// Checksum 0x5b08df2f, Offset: 0x17d0
// Size: 0x1a4
function function_18b39e14()
{
    if ( level flag::get( #"hash_18134dc5b9b39a96" ) && !level flag::get( #"hash_589679a12150767a" ) )
    {
        function_3effad88( #"danu" );
    }
    
    if ( level flag::get( #"hash_582eea77824b014d" ) && !level flag::get( #"hash_4abb12b14a38d2e9" ) )
    {
        function_3effad88( #"ra" );
    }
    
    if ( level flag::get( #"hash_5cc500f9282cd290" ) && !level flag::get( #"hash_15f5946d4968f144" ) )
    {
        function_3effad88( #"odin" );
    }
    
    if ( level flag::get( #"hash_20c64c155f7a0065" ) && !level flag::get( #"hash_355567a6fa6d44d1" ) )
    {
        function_3effad88( #"zeus" );
    }
}

// Namespace zm_towers_pap_quest/zm_towers_pap_quest
// Params 1, eflags: 0x4
// Checksum 0xc6cfdcc2, Offset: 0x1980
// Size: 0x244
function private function_3effad88( str_tower )
{
    str_prompt = zm_utility::function_d6046228( #"hash_2a4860e40142bac5", #"hash_7c465ea7da6991fb" );
    
    switch ( str_tower )
    {
        case #"danu":
            var_e362d075 = getent( "t_pap_quest_danu_encounter", "targetname" );
            level flag::clear( #"hash_18134dc5b9b39a96" );
            break;
        case #"ra":
            var_e362d075 = getent( "t_pap_quest_ra_encounter", "targetname" );
            level flag::clear( #"hash_582eea77824b014d" );
            break;
        case #"odin":
            var_e362d075 = getent( "t_pap_quest_odin_encounter", "targetname" );
            level flag::clear( #"hash_5cc500f9282cd290" );
            break;
        case #"zeus":
            var_e362d075 = getent( "t_pap_quest_zeus_encounter", "targetname" );
            level flag::clear( #"hash_20c64c155f7a0065" );
            break;
    }
    
    var_e362d075 triggerenable( 1 );
    var_e362d075 sethintstring( str_prompt );
    level flag::clear( #"hash_798d51388d6e10f4" );
    level thread function_199b1814( str_tower, get_encounter( str_tower ) );
}

// Namespace zm_towers_pap_quest/zm_towers_pap_quest
// Params 0
// Checksum 0x932077d0, Offset: 0x1bd0
// Size: 0x57c
function pap_quest_restart()
{
    level notify( #"pap_quest_restart" );
    level flag::clear( #"hash_18134dc5b9b39a96" );
    level flag::clear( #"hash_582eea77824b014d" );
    level flag::clear( #"hash_5cc500f9282cd290" );
    level flag::clear( #"hash_20c64c155f7a0065" );
    level flag::clear( #"hash_589679a12150767a" );
    level flag::clear( #"hash_4abb12b14a38d2e9" );
    level flag::clear( #"hash_15f5946d4968f144" );
    level flag::clear( #"hash_355567a6fa6d44d1" );
    level flag::clear( #"hash_3d833ecc64915d8d" );
    level flag::clear( #"hash_d38ff215be3a4fc" );
    level flag::clear( #"hash_4142472dec557d03" );
    level flag::clear( #"hash_45b6b1ee5d5038b4" );
    var_9840ab47 = getentarray( "pap_quest_encounter_triggers", "script_noteworthy" );
    
    if ( function_8b1a219a() )
    {
        array::run_all( var_9840ab47, &sethintstring, #"hash_7c465ea7da6991fb" );
    }
    else
    {
        array::run_all( var_9840ab47, &sethintstring, #"hash_2a4860e40142bac5" );
    }
    
    var_16561d51 = array( #"marauder", #"destroyer", #"both", #"tigers" );
    a_str_towers = array( #"danu", #"ra", #"odin", #"zeus" );
    var_16561d51 = array::randomize( var_16561d51 );
    level.var_4118581a = 0;
    
    foreach ( i, str_tower in a_str_towers )
    {
        level thread function_199b1814( str_tower, var_16561d51[ i ] );
    }
    
    level.var_c22016cf = 0;
    level.var_7695ff59 = 0;
    level.var_9847c460 = 0;
    level thread function_a2f4eb85();
    a_mdl_heads = getentarray( "mdl_pap_quest_head", "targetname" );
    
    foreach ( mdl_head in a_mdl_heads )
    {
        mdl_head flag::clear( #"hash_26125a3306681e2" );
        mdl_head hide();
    }
    
    level zm_ui_inventory::function_7df6bb60( #"hash_4fce42c559430ff9", 1 );
    level zm_ui_inventory::function_7df6bb60( #"hash_6257a73f22800e57", 1 );
    level zm_ui_inventory::function_7df6bb60( #"hash_61f69ed4cbd8f2f5", 1 );
    level zm_ui_inventory::function_7df6bb60( #"hash_5114ed99a6bad03b", 1 );
    
    if ( isdefined( level.var_9ca6160c ) )
    {
        array::delete_all( level.var_9ca6160c );
        level.var_9ca6160c = undefined;
    }
    
    function_f18e2775();
}

// Namespace zm_towers_pap_quest/zm_towers_pap_quest
// Params 1
// Checksum 0x3e415df3, Offset: 0x2158
// Size: 0xd8
function function_64f2d6de( a_ents )
{
    var_f99f1421 = a_ents[ #"prop 1" ];
    a_mdl_heads = getentarray( "mdl_pap_quest_head", "targetname" );
    
    foreach ( mdl_head in a_mdl_heads )
    {
        mdl_head linkto( var_f99f1421, mdl_head.var_d06913fa );
    }
}

// Namespace zm_towers_pap_quest/zm_towers_pap_quest
// Params 2
// Checksum 0x4c6ecbab, Offset: 0x2238
// Size: 0x1d0
function function_97e78811( var_5ea5c94d, ended_early )
{
    if ( var_5ea5c94d || ended_early )
    {
        level flag::set( #"hash_18134dc5b9b39a96" );
        level flag::set( #"hash_582eea77824b014d" );
        level flag::set( #"hash_5cc500f9282cd290" );
        level flag::set( #"hash_20c64c155f7a0065" );
        level flag::set( #"hash_589679a12150767a" );
        level flag::set( #"hash_4abb12b14a38d2e9" );
        level flag::set( #"hash_15f5946d4968f144" );
        level flag::set( #"hash_355567a6fa6d44d1" );
        level flag::set( #"hash_3d833ecc64915d8d" );
        level flag::set( #"hash_d38ff215be3a4fc" );
        level flag::set( #"hash_4142472dec557d03" );
        level flag::set( #"hash_45b6b1ee5d5038b4" );
        return;
    }
    
    level thread function_a73ff9f2();
    level notify( #"hash_9ffcf4efbfb9b65" );
}

// Namespace zm_towers_pap_quest/zm_towers_pap_quest
// Params 2
// Checksum 0xa2d1b0b7, Offset: 0x2410
// Size: 0x1004
function function_199b1814( str_tower, str_encounter )
{
    level notify( str_tower + "_pap_quest_restart" );
    level endon( #"pap_quest_completed", #"pap_quest_restart", str_tower + "_pap_quest_restart" );
    
    switch ( str_tower )
    {
        case #"danu":
            str_trigger = "t_pap_quest_danu_encounter";
            var_31e5b512 = #"hash_18134dc5b9b39a96";
            var_def2a519 = #"hash_589679a12150767a";
            level.var_58e06b5b = str_encounter;
            var_33a5ad52 = struct::get_array( "s_pap_encounter_scenes_danu_destroyer" );
            var_b994877d = struct::get_array( "s_pap_encounter_scenes_danu_marauder" );
            var_a0529e1b = struct::get_array( "s_pap_encounter_scenes_danu_tiger" );
            s_spawn = struct::get( "s_pap_encounter_spawn_danu" );
            break;
        case #"ra":
            str_trigger = "t_pap_quest_ra_encounter";
            var_31e5b512 = #"hash_582eea77824b014d";
            var_def2a519 = #"hash_4abb12b14a38d2e9";
            level.var_b941799e = str_encounter;
            var_33a5ad52 = struct::get_array( "s_pap_encounter_scenes_ra_destroyer" );
            var_b994877d = struct::get_array( "s_pap_encounter_scenes_ra_marauder" );
            var_a0529e1b = struct::get_array( "s_pap_encounter_scenes_ra_tiger" );
            s_spawn = struct::get( "s_pap_encounter_spawn_ra" );
            break;
        case #"odin":
            str_trigger = "t_pap_quest_odin_encounter";
            var_31e5b512 = #"hash_5cc500f9282cd290";
            var_def2a519 = #"hash_15f5946d4968f144";
            level.var_34bb868f = str_encounter;
            var_33a5ad52 = struct::get_array( "s_pap_encounter_scenes_odin_destroyer" );
            var_b994877d = struct::get_array( "s_pap_encounter_scenes_odin_marauder" );
            var_a0529e1b = struct::get_array( "s_pap_encounter_scenes_odin_tiger" );
            s_spawn = struct::get( "s_pap_encounter_spawn_odin" );
            break;
        case #"zeus":
            str_trigger = "t_pap_quest_zeus_encounter";
            var_31e5b512 = #"hash_20c64c155f7a0065";
            var_def2a519 = #"hash_355567a6fa6d44d1";
            level.var_c90f6df9 = str_encounter;
            var_33a5ad52 = struct::get_array( "s_pap_encounter_scenes_zeus_destroyer" );
            var_b994877d = struct::get_array( "s_pap_encounter_scenes_zeus_marauder" );
            var_a0529e1b = struct::get_array( "s_pap_encounter_scenes_zeus_tiger" );
            s_spawn = struct::get( "s_pap_encounter_spawn_zeus" );
            break;
    }
    
    var_33a5ad52 = array::randomize( var_33a5ad52 );
    var_b994877d = array::randomize( var_b994877d );
    var_a0529e1b = array::randomize( var_a0529e1b );
    t_trigger = getent( str_trigger, "targetname" );
    var_190d5d80 = getent( t_trigger.target, "targetname" );
    var_190d5d80 thread scene::init( "p8_fxanim_zm_towers_challenge_gong_bundle", var_190d5d80 );
    b_triggered = 0;
    
    while ( !b_triggered )
    {
        waitresult = t_trigger waittill( #"trigger" );
        
        if ( !level flag::get( #"hash_798d51388d6e10f4" ) )
        {
            b_triggered = 1;
            break;
        }
    }
    
    level flag::set( #"hash_2a7d461c7eff8179" );
    level flag::set( var_31e5b512 );
    level flag::set( #"hash_798d51388d6e10f4" );
    
    switch ( str_tower )
    {
        case #"danu":
            str_encounter = level.var_58e06b5b;
            str_exploder = "fxexp_gong_danu";
            var_38e7a8be = #"hash_18134dc5b9b39a96";
            break;
        case #"ra":
            str_encounter = level.var_b941799e;
            str_exploder = "fxexp_gong_ra";
            var_38e7a8be = #"hash_582eea77824b014d";
            break;
        case #"odin":
            str_encounter = level.var_34bb868f;
            str_exploder = "fxexp_gong_odin";
            var_38e7a8be = #"hash_5cc500f9282cd290";
            break;
        case #"zeus":
            str_encounter = level.var_c90f6df9;
            str_exploder = "fxexp_gong_zeus";
            var_38e7a8be = #"hash_20c64c155f7a0065";
            break;
    }
    
    exploder::exploder( str_exploder );
    zm_towers_util::function_afd37143( var_38e7a8be );
    
    switch ( str_encounter )
    {
        case #"marauder":
            if ( !level.var_4118581a )
            {
                var_e482422a = array( #"marauder" );
            }
            else
            {
                var_e482422a = [];
                
                for ( i = 0; i < var_b994877d.size ; i++ )
                {
                    if ( !isdefined( var_e482422a ) )
                    {
                        var_e482422a = [];
                    }
                    else if ( !isarray( var_e482422a ) )
                    {
                        var_e482422a = array( var_e482422a );
                    }
                    
                    var_e482422a[ var_e482422a.size ] = #"marauder";
                }
            }
            
            break;
        case #"destroyer":
            if ( !level.var_4118581a )
            {
                var_e482422a = array( #"destroyer" );
            }
            else
            {
                var_e482422a = [];
                
                for ( i = 0; i < var_33a5ad52.size ; i++ )
                {
                    if ( !isdefined( var_e482422a ) )
                    {
                        var_e482422a = [];
                    }
                    else if ( !isarray( var_e482422a ) )
                    {
                        var_e482422a = array( var_e482422a );
                    }
                    
                    var_e482422a[ var_e482422a.size ] = #"destroyer";
                }
            }
            
            break;
        case #"both":
            var_e482422a = array( #"marauder", #"destroyer" );
            break;
        case #"tigers":
            if ( !level.var_4118581a )
            {
                var_e482422a = array( #"tiger", #"tiger", #"tiger", #"tiger" );
            }
            else
            {
                var_e482422a = [];
                
                for ( i = 0; i < var_a0529e1b.size ; i++ )
                {
                    if ( !isdefined( var_e482422a ) )
                    {
                        var_e482422a = [];
                    }
                    else if ( !isarray( var_e482422a ) )
                    {
                        var_e482422a = array( var_e482422a );
                    }
                    
                    var_e482422a[ var_e482422a.size ] = #"tiger";
                }
            }
            
            break;
    }
    
    var_190d5d80 thread scene::play( "p8_fxanim_zm_towers_challenge_gong_bundle", var_190d5d80 );
    level.var_b2b15659 = 1;
    function_a73ff9f2();
    level.var_5c51cf1a = var_e482422a.size;
    level.var_4629a597 = 0;
    var_1f8676e3 = arraycopy( var_33a5ad52 );
    var_1b55c253 = arraycopy( var_b994877d );
    var_6e280451 = arraycopy( var_a0529e1b );
    
    foreach ( i, str_enemy in var_e482422a )
    {
        switch ( str_enemy )
        {
            case #"destroyer":
                if ( str_encounter != #"both" )
                {
                    if ( var_1f8676e3.size == 0 )
                    {
                        var_1f8676e3 = array::randomize( var_33a5ad52 );
                    }
                    
                    s_scene = var_1f8676e3[ 0 ];
                    arrayremoveindex( var_1f8676e3, 0 );
                }
                else
                {
                    switch ( str_tower )
                    {
                        case #"danu":
                            s_scene = struct::get( "danu_destroyer", "script_pap_encounter_scene_both" );
                            break;
                        case #"ra":
                            s_scene = struct::get( "ra_destroyer", "script_pap_encounter_scene_both" );
                            break;
                        case #"odin":
                            s_scene = struct::get( "odin_destroyer", "script_pap_encounter_scene_both" );
                            break;
                        case #"zeus":
                            s_scene = struct::get( "zeus_destroyer", "script_pap_encounter_scene_both" );
                            break;
                    }
                }
                
                break;
            case #"marauder":
                if ( str_encounter != #"both" )
                {
                    if ( var_1b55c253.size == 0 )
                    {
                        var_1b55c253 = array::randomize( var_b994877d );
                    }
                    
                    s_scene = var_1b55c253[ 0 ];
                    arrayremoveindex( var_1b55c253, 0 );
                }
                else
                {
                    switch ( str_tower )
                    {
                        case #"danu":
                            s_scene = struct::get( "danu_marauder", "script_pap_encounter_scene_both" );
                            break;
                        case #"ra":
                            s_scene = struct::get( "ra_marauder", "script_pap_encounter_scene_both" );
                            break;
                        case #"odin":
                            s_scene = struct::get( "odin_marauder", "script_pap_encounter_scene_both" );
                            break;
                        case #"zeus":
                            s_scene = struct::get( "zeus_marauder", "script_pap_encounter_scene_both" );
                            break;
                    }
                }
                
                break;
            case #"tiger":
                if ( var_6e280451.size == 0 )
                {
                    var_6e280451 = array::randomize( var_a0529e1b );
                }
                
                s_scene = var_6e280451[ 0 ];
                arrayremoveindex( var_6e280451, 0 );
                break;
        }
        
        function_79071b9a( str_enemy, s_spawn, s_scene );
        
        if ( level.var_4118581a || str_encounter == #"tigers" && i < var_e482422a.size )
        {
            wait 1;
        }
    }
    
    s_waitresult = level waittill( #"hash_2ea1048758a3ff14" );
    v_origin = s_waitresult.v_origin;
    var_7246d429 = s_waitresult.var_7246d429;
    str_archetype = s_waitresult.str_archetype;
    var_1e137cec = s_waitresult.var_1e137cec;
    
    if ( str_encounter == #"both" )
    {
        if ( var_1e137cec == #"gladiator_destroyer" )
        {
            level.var_9bd700c9 = #"destroyer";
        }
        else
        {
            level.var_9bd700c9 = #"marauder";
        }
    }
    
    level thread drop_head( v_origin, str_tower, var_7246d429 );
    level flag::set( var_def2a519 );
    level flag::clear( #"hash_798d51388d6e10f4" );
    level.var_b2b15659 = 0;
    function_f18e2775();
    
    switch ( str_tower )
    {
        case #"danu":
            var_38e7a8be = #"hash_589679a12150767a";
            break;
        case #"ra":
            var_38e7a8be = #"hash_4abb12b14a38d2e9";
            break;
        case #"odin":
            var_38e7a8be = #"hash_15f5946d4968f144";
            break;
        case #"zeus":
            var_38e7a8be = #"hash_355567a6fa6d44d1";
            break;
    }
    
    zm_towers_util::function_afd37143( var_38e7a8be );
}

// Namespace zm_towers_pap_quest/zm_towers_pap_quest
// Params 3
// Checksum 0x3d02a42f, Offset: 0x3420
// Size: 0x172
function function_79071b9a( str_enemy, s_spawn, s_scene )
{
    ai_enemy = undefined;
    
    while ( !isdefined( ai_enemy ) )
    {
        switch ( str_enemy )
        {
            case #"marauder":
                ai_enemy = zombie_gladiator_util::function_c9cd31( 1, s_spawn );
                break;
            case #"destroyer":
                ai_enemy = zombie_gladiator_util::function_2efc00db( 1, s_spawn );
                break;
            case #"tiger":
                ai_enemy = zombie_tiger_util::spawn_single( 1, s_spawn );
                break;
        }
        
        if ( isdefined( ai_enemy ) )
        {
            ai_enemy flag::init( #"hash_368f8dee8aca386c" );
            ai_enemy thread function_9ec8ec89();
            ai_enemy thread function_4b702fd5( s_scene );
            
            if ( ai_enemy.archetype == #"tiger" )
            {
                ai_enemy ai::set_behavior_attribute( "sprint", 1 );
            }
            
            return;
        }
    }
}

// Namespace zm_towers_pap_quest/zm_towers_pap_quest
// Params 1
// Checksum 0x527d1f5e, Offset: 0x35a0
// Size: 0x124
function function_4b702fd5( s_scene )
{
    self endon( #"death" );
    self.var_126d7bef = 1;
    self.no_powerups = 1;
    self.ignore_round_spawn_failsafe = 1;
    self.b_ignore_cleanup = 1;
    self.ignore_enemy_count = 1;
    self.ignore_nuke = 1;
    self.var_1df64653 = 1;
    s_scene scene::play( self );
    self.var_1df64653 = undefined;
    
    if ( self.archetype == #"gladiator" )
    {
        self.completed_emerging_into_playable_area = 1;
        self notify( #"completed_emerging_into_playable_area" );
    }
    else if ( self.archetype == #"tiger" )
    {
        self tigerbehavior::function_8747b993();
    }
    
    self flag::set( #"hash_368f8dee8aca386c" );
}

// Namespace zm_towers_pap_quest/zm_towers_pap_quest
// Params 0
// Checksum 0x6248e94c, Offset: 0x36d0
// Size: 0x158
function function_9ec8ec89()
{
    level endon( #"round_reset" );
    str_archetype = self.archetype;
    var_1e137cec = self.subarchetype;
    self waittill( #"death" );
    v_origin = self.origin;
    var_7246d429 = self flag::get( #"hash_368f8dee8aca386c" );
    
    if ( var_7246d429 )
    {
        var_7246d429 = zm_utility::check_point_in_playable_area( v_origin );
    }
    
    level.var_4629a597++;
    
    if ( level.var_4629a597 >= level.var_5c51cf1a )
    {
        self thread zm_towers_util::function_ae1b4f5b( 100, 75, 75 );
        level notify( #"hash_2ea1048758a3ff14", { #v_origin:v_origin, #var_7246d429:var_7246d429, #str_archetype:str_archetype, #var_1e137cec:var_1e137cec } );
    }
}

// Namespace zm_towers_pap_quest/zm_towers_pap_quest
// Params 0
// Checksum 0x2e769859, Offset: 0x3830
// Size: 0xa8
function function_a73ff9f2()
{
    var_9840ab47 = getentarray( "pap_quest_encounter_triggers", "script_noteworthy" );
    
    foreach ( var_324ea742 in var_9840ab47 )
    {
        var_324ea742 triggerenable( 0 );
    }
}

// Namespace zm_towers_pap_quest/zm_towers_pap_quest
// Params 0
// Checksum 0x463a42d3, Offset: 0x38e0
// Size: 0xd8
function function_f18e2775()
{
    var_9840ab47 = getentarray( "pap_quest_encounter_triggers", "script_noteworthy" );
    
    foreach ( var_324ea742 in var_9840ab47 )
    {
        if ( !level flag::get( hash( var_324ea742.var_bc2bade2 ) ) )
        {
            var_324ea742 triggerenable( 1 );
        }
    }
}

// Namespace zm_towers_pap_quest/zm_towers_pap_quest
// Params 3
// Checksum 0xa613b9ad, Offset: 0x39c0
// Size: 0x3d2
function drop_head( v_origin, str_tower, var_5570d8de )
{
    v_position = v_origin + ( 0, 0, 40 );
    str_head = #"c_t8_zmb_dlc0_zombie_corpse_head_2";
    str_encounter = get_encounter( str_tower );
    b_both = 0;
    
    if ( str_encounter == #"both" )
    {
        b_both = 1;
        
        if ( !isdefined( level.var_9bd700c9 ) )
        {
            level.var_9bd700c9 = #"destroyer";
        }
        
        str_encounter = level.var_9bd700c9;
    }
    
    switch ( str_encounter )
    {
        case #"destroyer":
            str_head = #"hash_7c166ef26a8ce946";
            break;
        case #"marauder":
            str_head = #"c_t8_zmb_dlc0_zombie_marauder_decapitated_head1";
            break;
        case #"tigers":
            str_head = #"hash_7046550bbfeaf740";
            break;
    }
    
    var_483b8a0 = util::spawn_model( str_head, v_position, ( 270, 0, 0 ) );
    var_483b8a0 clientfield::set( "zombie_head_pickup_glow", 1 );
    
    if ( !var_5570d8de )
    {
        switch ( str_tower )
        {
            case #"danu":
                str_backup = "s_danu_encounter_back_up_head_spawn";
                break;
            case #"ra":
                str_backup = "s_ra_encounter_back_up_head_spawn";
                break;
            case #"odin":
                str_backup = "s_odin_encounter_back_up_head_spawn";
                break;
            case #"zeus":
                str_backup = "s_zeus_encounter_back_up_head_spawn";
                break;
        }
        
        s_point = struct::get( str_backup );
        var_a0fca4e1 = s_point.origin + ( 0, 0, 40 );
        var_483b8a0 moveto( var_a0fca4e1, 2 );
    }
    
    var_483b8a0 thread zm_towers_util::function_48f49769();
    
    if ( b_both )
    {
        str_encounter = #"both";
    }
    
    var_483b8a0 thread function_499b080d( str_tower, str_encounter );
    
    if ( !isdefined( level.var_9ca6160c ) )
    {
        level.var_9ca6160c = array();
    }
    
    if ( !isdefined( level.var_9ca6160c ) )
    {
        level.var_9ca6160c = [];
    }
    else if ( !isarray( level.var_9ca6160c ) )
    {
        level.var_9ca6160c = array( level.var_9ca6160c );
    }
    
    if ( !isinarray( level.var_9ca6160c, var_483b8a0 ) )
    {
        level.var_9ca6160c[ level.var_9ca6160c.size ] = var_483b8a0;
    }
}

// Namespace zm_towers_pap_quest/zm_towers_pap_quest
// Params 2
// Checksum 0x9cda6d31, Offset: 0x3da0
// Size: 0x4a0
function function_499b080d( str_tower, str_encounter )
{
    level endon( #"pap_quest_restart" );
    var_903152eb = 0;
    
    while ( !var_903152eb )
    {
        a_e_players = level.players;
        
        foreach ( e_player in a_e_players )
        {
            if ( distancesquared( e_player.origin, self.origin ) < 4096 )
            {
                var_903152eb = 1;
                break;
            }
        }
        
        wait 0.1;
    }
    
    switch ( str_tower )
    {
        case #"danu":
            str_flag = #"hash_3d833ecc64915d8d";
            break;
        case #"ra":
            str_flag = #"hash_d38ff215be3a4fc";
            break;
        case #"odin":
            str_flag = #"hash_4142472dec557d03";
            break;
        case #"zeus":
            str_flag = #"hash_45b6b1ee5d5038b4";
            break;
    }
    
    level flag::set( str_flag );
    str_clientfield = function_1191a919( str_encounter );
    level zm_ui_inventory::function_7df6bb60( str_clientfield, 2 );
    level.var_c22016cf++;
    level thread function_7590a833();
    n_scalar = zombie_utility::get_zombie_var_team( #"zombie_point_scalar", #"allies" );
    
    foreach ( e_player in level.players )
    {
        e_player zm_score::add_to_player_score( 500 * n_scalar );
    }
    
    playsoundatposition( #"hash_f35db774de79d2", self.origin );
    
    if ( isdefined( level.var_9ca6160c ) && isinarray( level.var_9ca6160c, self ) )
    {
        arrayremovevalue( level.var_9ca6160c, self );
        
        if ( !level.var_9ca6160c.size )
        {
            level.var_9ca6160c = undefined;
        }
    }
    
    self clientfield::set( "zombie_head_pickup_glow", 0 );
    self delete();
    
    /#
        var_cd6e44b6 = 0;
        
        if ( level flag::get( #"hash_3d833ecc64915d8d" ) )
        {
            var_cd6e44b6++;
        }
        
        if ( level flag::get( #"hash_d38ff215be3a4fc" ) )
        {
            var_cd6e44b6++;
        }
        
        if ( level flag::get( #"hash_4142472dec557d03" ) )
        {
            var_cd6e44b6++;
        }
        
        if ( level flag::get( #"hash_45b6b1ee5d5038b4" ) )
        {
            var_cd6e44b6++;
        }
        
        str_message = var_cd6e44b6 + "<dev string:x38>";
        iprintlnbold( str_message );
    #/
    
    level notify( #"collected_head" );
}

// Namespace zm_towers_pap_quest/zm_towers_pap_quest
// Params 1
// Checksum 0x8e1330e7, Offset: 0x4248
// Size: 0x8c
function function_52411f5e( var_5ea5c94d )
{
    if ( !var_5ea5c94d )
    {
        level flag::wait_till( #"hash_2cf71ce4a3d1c081" );
        level flag::wait_till( "zm_towers_pap_quest_sentinel_artifact_exploded" );
    }
    
    level flag::set( "zm_towers_pap_quest_completed" );
    function_156669dd( 0, 0 );
}

// Namespace zm_towers_pap_quest/zm_towers_pap_quest
// Params 2
// Checksum 0xe3231097, Offset: 0x42e0
// Size: 0x500
function function_156669dd( var_5ea5c94d, ended_early )
{
    if ( var_5ea5c94d || ended_early )
    {
        level flag::set( #"hash_2cf71ce4a3d1c081" );
        level flag::set( "zm_towers_pap_quest_sentinel_artifact_exploded" );
        level flag::set( "zm_towers_pap_quest_completed" );
        a_mdl_heads = getentarray( "mdl_pap_quest_head", "targetname" );
        
        foreach ( mdl_head in a_mdl_heads )
        {
            mdl_head show();
        }
        
        mdl_sentinel_artifact = getent( "mdl_pap_quest_sentinel_artifact", "targetname" );
        mdl_sentinel_artifact hide();
        mdl_sentinel_artifact notsolid();
        return;
    }
    
    /#
        iprintlnbold( "<dev string:x5b>" );
    #/
    
    if ( zm_utility::is_standard() )
    {
        level waittill( #"hash_7ca261f468171655" );
    }
    else
    {
        level flag::set( "power_on" );
    }
    
    zm_towers_util::function_afd37143( #"pap_quest_completed" );
    a_mdl_heads = getentarray( "mdl_pap_quest_head", "targetname" );
    array::thread_all( a_mdl_heads, &function_9b320791 );
    level thread scene::play( "p8_fxanim_zm_towers_pap_sarcophagus_spikes_bundle" );
    level thread scene::play( "p8_fxanim_zm_towers_pap_sarcophagus_blood_01_bundle", "Shot 2" );
    level thread scene::play( "p8_fxanim_zm_towers_pap_sarcophagus_blood_02_bundle", "Shot 2" );
    level thread scene::play( "p8_fxanim_zm_towers_pap_sarcophagus_blood_03_bundle", "Shot 2" );
    level scene::play( "p8_fxanim_zm_towers_pap_sarcophagus_blood_04_bundle", "Shot 2" );
    level thread scene::play( "p8_fxanim_zm_towers_pap_sarcophagus_bundle" );
    level thread scene::play( "p8_fxanim_zm_towers_pap_door_blue_bundle" );
    level thread scene::play( "p8_fxanim_zm_towers_pap_door_red_bundle" );
    exploder::exploder( "fx8_exp_pap_slam_smk" );
    var_f7afe1a0 = getent( "sarcophagus_destroyed", "targetname" );
    var_f7afe1a0 show();
    var_e7ab66ef = getent( "sarcophagus_solid", "targetname" );
    var_e7ab66ef delete();
    a_mdl_pap_room_debris_clip = getentarray( "mdl_pap_room_debris_clip", "targetname" );
    
    foreach ( mdl_pap_room_debris_clip in a_mdl_pap_room_debris_clip )
    {
        mdl_pap_room_debris_clip connectpaths();
        mdl_pap_room_debris_clip delete();
    }
    
    level flag::set( "connect_pap_room_to_danu_ra_tunnel" );
    level flag::set( "connect_pap_room_to_odin_zeus_tunnel" );
    level notify( #"pap_quest_completed" );
}

// Namespace zm_towers_pap_quest/zm_towers_pap_quest
// Params 0
// Checksum 0xb25c9a66, Offset: 0x47e8
// Size: 0xa4
function function_9b320791()
{
    level endon( #"end_game" );
    str_notify = self.var_427eb1ae;
    level waittill( str_notify );
    self thread fx::play( "fx_challenge_head_blood_burst", self getcentroid(), undefined, undefined, 1, undefined, 1, 0 );
    self notify( #"hash_691806c47ba12fac" );
    self hide();
}

// Namespace zm_towers_pap_quest/zm_towers_pap_quest
// Params 0
// Checksum 0xe7e907f8, Offset: 0x4898
// Size: 0x4c
function function_a2f4eb85()
{
    t_trigger = getent( "t_pap_quest_place_head", "targetname" );
    t_trigger sethintstring( #"hash_6b4f36812ac1e729" );
}

// Namespace zm_towers_pap_quest/zm_towers_pap_quest
// Params 0
// Checksum 0x99f18b84, Offset: 0x48f0
// Size: 0x1cc
function function_7590a833()
{
    self notify( "5e1fb7fbace74e0b" );
    self endon( "5e1fb7fbace74e0b" );
    level endon( #"pap_quest_completed" );
    t_trigger = getent( "t_pap_quest_place_head", "targetname" );
    
    foreach ( e_player in level.players )
    {
        e_player clientfield::set( "force_pap_models", 1 );
    }
    
    if ( function_8b1a219a() )
    {
        t_trigger sethintstring( #"hash_785577888de11add" );
    }
    else
    {
        t_trigger sethintstring( #"hash_50fc385a94b3d3f" );
    }
    
    while ( true )
    {
        s_notify = t_trigger waittill( #"trigger" );
        e_player = s_notify.activator;
        
        if ( isplayer( e_player ) )
        {
            v_origin = e_player.origin;
            break;
        }
    }
    
    level thread function_5ed0d968( v_origin );
}

// Namespace zm_towers_pap_quest/zm_towers_pap_quest
// Params 1
// Checksum 0x4573c5e8, Offset: 0x4ac8
// Size: 0x254
function function_5ed0d968( v_player_origin )
{
    a_mdl_heads = getentarray( "mdl_pap_quest_head", "targetname" );
    a_mdl_heads = util::get_array_of_closest( v_player_origin, a_mdl_heads );
    n_heads = level.var_c22016cf;
    level.var_c22016cf = 0;
    
    foreach ( mdl_head in a_mdl_heads )
    {
        if ( mdl_head flag::get( #"hash_26125a3306681e2" ) )
        {
            continue;
        }
        
        mdl_head flag::set( #"hash_26125a3306681e2" );
        mdl_head function_f3c4aeac();
        mdl_head thread function_61cf4d04();
        level.var_7695ff59++;
        n_heads--;
        
        if ( n_heads <= 0 )
        {
            break;
        }
    }
    
    if ( level.var_7695ff59 >= 4 )
    {
        var_10761775 = getent( "t_pap_quest_place_head", "targetname" );
        var_10761775 triggerenable( 0 );
        
        foreach ( e_player in level.players )
        {
            e_player clientfield::set( "force_pap_models", 0 );
        }
        
        return;
    }
    
    function_a2f4eb85();
}

// Namespace zm_towers_pap_quest/zm_towers_pap_quest
// Params 0
// Checksum 0x52dcab01, Offset: 0x4d28
// Size: 0x424
function function_f3c4aeac()
{
    if ( level flag::get( #"hash_3d833ecc64915d8d" ) && !level flag::get( #"hash_1eda3c39867cbe53" ) )
    {
        str_flag = #"hash_1eda3c39867cbe53";
        str_tower = #"danu";
    }
    else if ( level flag::get( #"hash_d38ff215be3a4fc" ) && !level flag::get( #"hash_1b7828aafd3f83f4" ) )
    {
        str_flag = #"hash_1b7828aafd3f83f4";
        str_tower = #"ra";
    }
    else if ( level flag::get( #"hash_4142472dec557d03" ) && !level flag::get( #"hash_15b79db61753c205" ) )
    {
        str_flag = #"hash_15b79db61753c205";
        str_tower = #"odin";
    }
    else if ( level flag::get( #"hash_45b6b1ee5d5038b4" ) && !level flag::get( #"hash_34c1fdccaa5279bc" ) )
    {
        str_flag = #"hash_34c1fdccaa5279bc";
        str_tower = #"zeus";
    }
    
    str_clientfield = function_1191a919( str_tower );
    level zm_ui_inventory::function_7df6bb60( str_clientfield, 3 );
    level flag::set( str_flag );
    str_fx_tag = "j_neck";
    str_encounter = get_encounter( str_tower );
    
    if ( str_encounter == #"both" )
    {
        if ( !isdefined( level.var_9bd700c9 ) )
        {
            level.var_9bd700c9 = #"destroyer";
        }
        
        str_encounter = level.var_9bd700c9;
    }
    
    switch ( str_encounter )
    {
        case #"destroyer":
            str_fx_tag = undefined;
            self setmodel( #"hash_7c166ef26a8ce946" );
            break;
        case #"marauder":
            str_fx_tag = undefined;
            self setmodel( #"c_t8_zmb_dlc0_zombie_marauder_decapitated_head1" );
            break;
        case #"tigers":
            str_fx_tag = undefined;
            self setmodel( #"hash_7046550bbfeaf740" );
            break;
    }
    
    self show();
    self playsound( #"hash_3d7066af9c9bf849" );
    self thread fx::play( "fx_challenge_head_blood_burst", self getcentroid(), undefined, undefined, 1, undefined, 1, 0 );
    self thread fx::play( "fx_challenge_head_blood_drips", self getcentroid(), undefined, #"hash_691806c47ba12fac", 1, str_fx_tag, 1, 0 );
}

// Namespace zm_towers_pap_quest/zm_towers_pap_quest
// Params 1
// Checksum 0x772a1fa8, Offset: 0x5158
// Size: 0xae
function get_encounter( str_tower )
{
    switch ( str_tower )
    {
        case #"danu":
            str_encounter = level.var_58e06b5b;
            break;
        case #"ra":
            str_encounter = level.var_b941799e;
            break;
        case #"odin":
            str_encounter = level.var_34bb868f;
            break;
        case #"zeus":
            str_encounter = level.var_c90f6df9;
            break;
    }
    
    return str_encounter;
}

// Namespace zm_towers_pap_quest/zm_towers_pap_quest
// Params 1
// Checksum 0x49867b7b, Offset: 0x5210
// Size: 0x106
function function_1191a919( str_encounter )
{
    switch ( str_encounter )
    {
        case #"destroyer":
            str_clientfield = #"hash_4fce42c559430ff9";
            break;
        case #"marauder":
            str_clientfield = #"hash_6257a73f22800e57";
            break;
        case #"both":
            str_clientfield = #"hash_61f69ed4cbd8f2f5";
            break;
        case #"tigers":
            str_clientfield = #"hash_5114ed99a6bad03b";
            break;
        default:
            str_encounter = get_encounter( str_encounter );
            str_clientfield = function_1191a919( str_encounter );
            break;
    }
    
    return str_clientfield;
}

// Namespace zm_towers_pap_quest/zm_towers_pap_quest
// Params 0
// Checksum 0x59cb2a3, Offset: 0x5320
// Size: 0x6c
function function_61cf4d04()
{
    level scene::play( self.var_28f6edb7, "Shot 1" );
    level.var_9847c460++;
    
    if ( level.var_9847c460 >= 4 )
    {
        level flag::set( #"hash_2cf71ce4a3d1c081" );
    }
}

// Namespace zm_towers_pap_quest/zm_towers_pap_quest
// Params 0
// Checksum 0xad26ff85, Offset: 0x5398
// Size: 0x174
function function_d7c092b9()
{
    level flag::wait_till( #"hash_2cf71ce4a3d1c081" );
    var_10761775 = getent( "t_pap_quest_place_head", "targetname" );
    
    if ( isdefined( var_10761775 ) && !( zm_utility::is_trials() && level.round_number <= 8 ) )
    {
        var_10761775 delete();
    }
    
    var_8a3d82fc = getentarray( "script_brush_lgt_pap_door", "targetname" );
    
    foreach ( a_clip in var_8a3d82fc )
    {
        a_clip delete();
    }
    
    exploder::exploder( "exp_lgt_pap" );
    level flag::set( "zm_towers_pap_quest_sentinel_artifact_exploded" );
}

/#

    // Namespace zm_towers_pap_quest/zm_towers_pap_quest
    // Params 1
    // Checksum 0xf99d81df, Offset: 0x5518
    // Size: 0x31c, Type: dev
    function function_438a415( str_head )
    {
        switch ( str_head )
        {
            case #"danu":
                var_31e5b512 = #"hash_18134dc5b9b39a96";
                var_def2a519 = #"hash_589679a12150767a";
                var_ce6f7a4c = #"hash_3d833ecc64915d8d";
                break;
            case #"ra":
                var_31e5b512 = #"hash_582eea77824b014d";
                var_def2a519 = #"hash_4abb12b14a38d2e9";
                var_ce6f7a4c = #"hash_d38ff215be3a4fc";
                break;
            case #"odin":
                var_31e5b512 = #"hash_5cc500f9282cd290";
                var_def2a519 = #"hash_15f5946d4968f144";
                var_ce6f7a4c = #"hash_4142472dec557d03";
                break;
            case #"zeus":
                var_31e5b512 = #"hash_20c64c155f7a0065";
                var_def2a519 = #"hash_355567a6fa6d44d1";
                var_ce6f7a4c = #"hash_45b6b1ee5d5038b4";
                break;
            case #"all":
                function_438a415( #"danu" );
                function_438a415( #"ra" );
                function_438a415( #"odin" );
                function_438a415( #"zeus" );
                return;
        }
        
        level flag::set( #"hash_2a7d461c7eff8179" );
        
        if ( level flag::get( #"hash_2cf71ce4a3d1c081" ) || level flag::get( var_31e5b512 ) )
        {
            return;
        }
        
        function_a73ff9f2();
        str_clientfield = function_1191a919( str_head );
        level zm_ui_inventory::function_7df6bb60( str_clientfield, 2 );
        level flag::set( var_31e5b512 );
        level flag::set( var_def2a519 );
        level flag::set( var_ce6f7a4c );
        function_f18e2775();
        level.var_c22016cf++;
        level thread function_7590a833();
    }

    // Namespace zm_towers_pap_quest/zm_towers_pap_quest
    // Params 1
    // Checksum 0xddc3fbdf, Offset: 0x5840
    // Size: 0x1d2, Type: dev
    function function_883e88be( str_enemy )
    {
        level.var_4118581a = 1;
        
        switch ( str_enemy )
        {
            case #"destroyers":
                level.var_58e06b5b = #"destroyer";
                level.var_b941799e = #"destroyer";
                level.var_34bb868f = #"destroyer";
                level.var_c90f6df9 = #"destroyer";
                iprintlnbold( "<dev string:x73>" );
                break;
            case #"marauders":
                level.var_58e06b5b = #"marauder";
                level.var_b941799e = #"marauder";
                level.var_34bb868f = #"marauder";
                level.var_c90f6df9 = #"marauder";
                iprintlnbold( "<dev string:x99>" );
                break;
            case #"tigers":
                level.var_58e06b5b = #"tigers";
                level.var_b941799e = #"tigers";
                level.var_34bb868f = #"tigers";
                level.var_c90f6df9 = #"tigers";
                iprintlnbold( "<dev string:xbe>" );
                break;
        }
    }

#/
