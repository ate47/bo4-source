#using scripts\core_common\array_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\compass;
#using scripts\core_common\doors_shared;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\util_shared;
#using scripts\mp_common\draft;
#using scripts\mp_common\load;

#namespace mp_embassy;

// Namespace mp_embassy/level_init
// Params 1, eflags: 0x40
// Checksum 0x10f5d66f, Offset: 0x1b8
// Size: 0xfc
function event_handler[level_init] main( eventstruct )
{
    clientfield::register( "scriptmover", "spawn_flavor_apc_explosion", 1, 1, "counter" );
    load::main();
    compass::setupminimap( "" );
    level.cleandepositpoints = array( ( 1663, -2262, 11.25 ), ( -506, -3186, 14 ), ( 3888, -32, 39 ), ( 71, -1169, 14 ), ( 3398, -2146, 7 ) );
    level.var_f3e25805 = &prematch_init;
    level thread function_34fc666e();
}

// Namespace mp_embassy/mp_embassy
// Params 0
// Checksum 0xf20670f1, Offset: 0x2c0
// Size: 0x19c
function function_34fc666e()
{
    level endon( #"game_ended" );
    
    if ( util::isfirstround() && getgametypesetting( #"allowmapscripting" ) && draft::is_draft_this_round() )
    {
        while ( !draft::function_d255fb3e() )
        {
            waitframe( 1 );
        }
        
        level thread scene::play( #"aib_t8_vign_cust_emb_civs_running_01" );
        level thread scene::play( #"aib_t8_vign_cust_emb_civs_running_02" );
        return;
    }
    
    mdl_apc = getent( "spawn_flavor_apc_explode", "targetname" );
    mdl_apc setmodel( "veh_t8_mil_apc_macv_dead_no_turret_no_armor_mp_grey" );
    scene::skipto_end( #"p8_fxanim_mp_emb_apc_arrive_bundle" );
    level flag::wait_till( "first_player_spawned" );
    array::delete_all( getentarray( "sun_block", "targetname" ) );
    exploder::exploder( "fxexp_embassy_aftermath" );
}

// Namespace mp_embassy/mp_embassy
// Params 0
// Checksum 0xb11b092e, Offset: 0x468
// Size: 0x19e
function prematch_init()
{
    array::delete_all( getentarray( "sun_block", "targetname" ) );
    scene::stop( #"aib_t8_vign_cust_emb_civs_running_01", 1 );
    scene::stop( #"aib_t8_vign_cust_emb_civs_running_02", 1 );
    
    if ( util::isfirstround() && getgametypesetting( #"allowmapscripting" ) )
    {
        exploder::exploder( "fxexp_embassy_explosion" );
        level util::delay( 4, "game_ended", &scene::play, #"p8_fxanim_mp_emb_apc_arrive_bundle" );
        level thread scene::play( #"p8_fxanim_mp_emb_balloons_fly_bundle" );
        mdl_apc = getent( "spawn_flavor_apc_explode", "targetname" );
        mdl_apc setmodel( "veh_t8_mil_apc_macv_dead_no_turret_no_armor_mp_grey" );
        mdl_apc clientfield::increment( "spawn_flavor_apc_explosion" );
        return;
    }
}

