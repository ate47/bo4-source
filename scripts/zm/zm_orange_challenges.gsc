#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\laststand_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;
#using scripts\core_common\values_shared;
#using scripts\zm\zm_hms_util;
#using scripts\zm\zm_orange_pablo;
#using scripts\zm\zm_orange_snowball_piles;
#using scripts\zm\zm_orange_util;
#using scripts\zm_common\util\ai_dog_util;
#using scripts\zm_common\zm_armor;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_bgb;
#using scripts\zm_common\zm_equipment;
#using scripts\zm_common\zm_item_pickup;
#using scripts\zm_common\zm_laststand;
#using scripts\zm_common\zm_loadout;
#using scripts\zm_common\zm_trial;
#using scripts\zm_common\zm_ui_inventory;
#using scripts\zm_common\zm_unitrigger;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_vo;
#using scripts\zm_common\zm_weapons;
#using scripts\zm_common\zm_zonemgr;

#namespace zm_orange_challenges;

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0x1e65669a, Offset: 0x588
// Size: 0x4c
function init()
{
    init_clientfields();
    init_flags();
    zm_armor::register( #"hash_35c87147e29f1708", 1 );
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0x5ac4ddd, Offset: 0x5e0
// Size: 0x34
function init_clientfields()
{
    clientfield::register( "allplayers", "zm_orange_force_challenge_model", 24000, 1, "int" );
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0xbfc50376, Offset: 0x620
// Size: 0x1c4
function init_flags()
{
    level flag::init( #"all_challenges_complete" );
    level flag::init( #"hash_4a8105909cc2603d" );
    level flag::init( #"break_freeze_faster" );
    level flag::init( #"challenge_active" );
    level flag::init( #"challenges_started" );
    level flag::init( #"extra_snowballs" );
    level flag::init( #"hash_2a1215d8a3e31013" );
    level flag::init( #"half_price_traps" );
    level flag::init( #"hash_84593b9650c7abf" );
    level flag::init( #"hash_2d3f1dd5445d3423" );
    level flag::init( #"hash_4e33fc3d32735214" );
    level flag::init( #"hash_701aa76674161d36" );
    level flag::init( #"hash_616e0abddc034740" );
    level flag::init( #"hash_5b3ea84b9db5af50" );
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0x40fdcc2c, Offset: 0x7f0
// Size: 0x54
function main()
{
    if ( zm_utility::is_standard() )
    {
        return;
    }
    
    level.var_9cb7f7de = 0;
    level.var_97a44fdd = undefined;
    level.var_a43a746d = 0;
    level thread function_980b1dc5();
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 8
// Checksum 0x14a21049, Offset: 0x850
// Size: 0xfa
function init_challenge( n_index, var_db4802f2, var_be570367, str_notify, func_setup, func_cleanup, str_reward, str_vox )
{
    s_challenge = spawnstruct();
    s_challenge.n_index = n_index;
    s_challenge.var_db4802f2 = var_db4802f2;
    s_challenge.var_be570367 = var_be570367;
    s_challenge.str_notify = str_notify;
    s_challenge.func_setup = func_setup;
    s_challenge.func_cleanup = func_cleanup;
    s_challenge.str_reward = str_reward;
    s_challenge.n_current_progress = 0;
    s_challenge.str_vox = str_vox;
    s_challenge.s_challenge_station = self;
    return s_challenge;
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0xf2c1db09, Offset: 0x958
// Size: 0x198
function function_980b1dc5()
{
    level.a_s_challenge_stations = struct::get_array( "s_challenge_station", "targetname" );
    
    foreach ( s_challenge_station in level.a_s_challenge_stations )
    {
        s_challenge_station.b_is_active = 0;
        s_challenge_station.var_6fb9ebb6 = 0;
        s_challenge_station.var_54cb6134 = 0;
        s_challenge_station.var_6c841cf = 1;
        s_challenge_station.e_totem = getent( s_challenge_station.target, "targetname" );
        
        for ( i = 1; i < 4 ; i++ )
        {
            s_challenge_station.e_totem hidepart( "tag_bulb_on_" + i );
        }
        
        s_challenge_station function_d3fc7131();
        s_challenge_station zm_unitrigger::create( &function_848a8225, 64 );
        s_challenge_station thread function_af2eff2e();
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0x7046a9b8, Offset: 0xaf8
// Size: 0x7ca
function function_d3fc7131()
{
    self.a_s_challenges = [];
    
    switch ( self.script_location )
    {
        case #"beach":
            self.a_s_challenges[ self.a_s_challenges.size ] = init_challenge( 1, 13, 25, #"hash_1eff75043dd3a914", &function_f0f0f5f3, &function_20f477f2, "bonus_points_team", #"hash_78a6b67ab7d98b2f" );
            self.a_s_challenges[ self.a_s_challenges.size ] = init_challenge( 2, 15, 30, #"hash_1eff78043dd3ae2d", &function_b1c46dce, &function_b0d19ce9, "insta_kill", #"hash_697d3cc07f8424da" );
            self.a_s_challenges[ self.a_s_challenges.size ] = init_challenge( 3, 3, 3, #"hash_1eff77043dd3ac7a", &function_e960fbf3, &function_35f6e838, "break_freeze_faster", #"hash_4394f0fdb2267af1" );
            self function_33f591cf();
            break;
        case #"forecastle":
            self.a_s_challenges[ self.a_s_challenges.size ] = init_challenge( 4, 25, 50, #"hash_4e74f8eb1bd5b367", &function_63ed3839, &function_d9dffba1, "carpenter", #"hash_78a6b67ab7d98b2f" );
            self.a_s_challenges[ self.a_s_challenges.size ] = init_challenge( 5, 10, 20, #"hash_4e74f9eb1bd5b51a", &function_6d225067, &function_6d50f216, "fire_sale", #"hash_697d3cc07f8424da" );
            self.a_s_challenges[ self.a_s_challenges.size ] = init_challenge( 6, 3, 3, #"hash_4e74faeb1bd5b6cd", &function_2ae162bf, &function_1de4dc2b, "armor", #"hash_3192e2687f3a2667" );
            self function_be80cd37();
            break;
        case #"frozen_crevasse":
            self.a_s_challenges[ self.a_s_challenges.size ] = init_challenge( 7, 20, 40, #"hash_d9f2cedb84b8d66", &function_658f9053, &function_5ba49bb9, "bonus_points_team", #"hash_78a6b67ab7d98b2f" );
            self.a_s_challenges[ self.a_s_challenges.size ] = init_challenge( 8, 6, 12, #"hash_d9f2bedb84b8bb3", &function_8885885d, &function_b0848cf7, "full_ammo", #"hash_697d3cc07f8424da" );
            self.a_s_challenges[ self.a_s_challenges.size ] = init_challenge( 9, 5, 5, #"hash_d9f2aedb84b8a00", &function_39ca7654, &function_a0ebbf07, "extra_snowballs", #"hash_607ea24c3576c5b2" );
            self function_e12fb431();
            break;
        case #"lighthouse_station":
            self.a_s_challenges[ self.a_s_challenges.size ] = init_challenge( 10, 25, 50, #"hash_3f452857bdecf44e", &function_6384ebfd, &function_fd31e27b, "carpenter", #"hash_78a6b67ab7d98b2f" );
            self.a_s_challenges[ self.a_s_challenges.size ] = init_challenge( 11, 20, 40, #"hash_3f452757bdecf29b", &function_6639d547, &function_50961fa5, "hero_weapon_power", #"hash_697d3cc07f8424da" );
            self.a_s_challenges[ self.a_s_challenges.size ] = init_challenge( 12, 3, 5, #"hash_3f452657bdecf0e8", &function_bb6ca008, &function_a9598dd1, "self_revives", #"hash_72d97680741c869d" );
            break;
        case #"specimen_storage":
            self.a_s_challenges[ self.a_s_challenges.size ] = init_challenge( 13, 15, 25, #"hash_6ded98ee1bc95925", &function_b40fed60, &function_a4b66a2b, "insta_kill", #"hash_78a6b67ab7d98b2f" );
            self.a_s_challenges[ self.a_s_challenges.size ] = init_challenge( 14, 10, 15, #"hash_6ded95ee1bc9540c", &registersplicestarttraverse, &function_7d030c3d, "hero_weapon_power", #"hash_697d3cc07f8424da" );
            self.a_s_challenges[ self.a_s_challenges.size ] = init_challenge( 15, 3, 3, #"hash_6ded96ee1bc955bf", &function_a36ace8b, &function_6884e5b8, "half_price_traps", #"hash_1374108085ffeb9d" );
            break;
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 1
// Checksum 0xb9de18a3, Offset: 0x12d0
// Size: 0x2f8, Type: bool
function function_848a8225( e_player )
{
    s_challenge_station = self.stub.related_parent;
    
    if ( !level flag::get( #"hash_641f14d0b2fd57d7" ) )
    {
        self sethintstring( #"hash_3c96e29876e85183" );
        return true;
    }
    
    if ( isdefined( s_challenge_station.var_6fb9ebb6 ) && s_challenge_station.var_6fb9ebb6 )
    {
        self sethintstring( #"hash_ca361c0650153b4" );
        return true;
    }
    
    if ( isdefined( s_challenge_station.var_54cb6134 ) && s_challenge_station.var_54cb6134 )
    {
        var_98d32b71 = s_challenge_station function_9f2ab302();
        
        if ( function_8b1a219a() )
        {
            self sethintstring( #"hash_1fe11cd647262073", var_98d32b71 );
            return true;
        }
        else
        {
            self sethintstring( #"hash_124603508868b48d", var_98d32b71 );
            return true;
        }
    }
    
    if ( isdefined( s_challenge_station.b_is_active ) && s_challenge_station.b_is_active )
    {
        if ( isdefined( s_challenge_station.var_5ac3d786 ) && s_challenge_station.var_5ac3d786 && s_challenge_station.script_location === "frozen_crevasse" && s_challenge_station.var_d6578e1f.n_index === 9 )
        {
            str_hint = zm_utility::function_d6046228( #"hash_286ff0974159fb7c", #"hash_6d101ea87a79ddf0" );
            self sethintstring( str_hint );
            return true;
        }
        
        self sethintstring( #"hash_6e0cbceab229716f" );
        return true;
    }
    else if ( level flag::get( #"challenge_active" ) )
    {
        self sethintstring( #"hash_eff579a2073f6b5" );
        return true;
    }
    
    str_hint = zm_utility::function_d6046228( #"hash_1ea67965f84fd306", #"hash_4ca32e791c5048a2" );
    self sethintstring( str_hint );
    return true;
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0xc4e8bc5b, Offset: 0x15d0
// Size: 0x1e2
function function_9f2ab302()
{
    switch ( self.var_d6578e1f.str_reward )
    {
        case #"bonus_points_team":
            var_289d3f49 = #"hash_33e97cafe9a6ce11";
            return var_289d3f49;
        case #"insta_kill":
            var_289d3f49 = #"hash_5f22e6bba160236";
            return var_289d3f49;
        case #"fire_sale":
            var_289d3f49 = #"hash_5979dcb633c28888";
            return var_289d3f49;
        case #"hero_weapon_power":
            var_289d3f49 = #"hash_649852d17720d7f9";
            return var_289d3f49;
        case #"carpenter":
            var_289d3f49 = #"hash_3f3c0bdcb88cacfa";
            return var_289d3f49;
        case #"full_ammo":
            var_289d3f49 = #"hash_1c356afe160c9b7a";
            return var_289d3f49;
        case #"self_revives":
            var_289d3f49 = #"hash_189972b46e07775";
            return var_289d3f49;
        case #"extra_snowballs":
            var_289d3f49 = #"hash_1c6212f5aff79380";
            return var_289d3f49;
        case #"half_price_traps":
            var_289d3f49 = #"hash_6875903d42d6d8ba";
            return var_289d3f49;
        case #"break_freeze_faster":
            var_289d3f49 = #"hash_1cc63d50dbd08da7";
            return var_289d3f49;
        case #"armor":
            var_289d3f49 = #"hash_6c9edec0976eeca1";
            return var_289d3f49;
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0x8e1193fa, Offset: 0x17c0
// Size: 0x29e
function function_af2eff2e()
{
    level endon( #"end_game", #"hell_on_earth", #"hash_198bc172b5af7f25" );
    self endon( #"challenge_station_completed" );
    
    while ( true )
    {
        s_waitresult = self waittill( #"trigger_activated" );
        
        if ( !level flag::get( #"hash_641f14d0b2fd57d7" ) )
        {
            continue;
        }
        
        if ( isdefined( self.var_5ac3d786 ) && self.var_5ac3d786 && isdefined( self.b_is_active ) && self.b_is_active && self.script_location === "frozen_crevasse" && self.var_d6578e1f.n_index === 9 )
        {
            self.var_5ac3d786 = 0;
            self thread function_2a4de81f();
            self.var_d6578e1f function_c40f1feb( self );
            continue;
        }
        
        if ( level flag::get( #"challenge_active" ) )
        {
            continue;
        }
        
        self.b_is_active = 1;
        level flag::set( #"challenge_active" );
        level.var_97a44fdd = self;
        self.e_vo = spawn( "script_origin", self.origin );
        self.e_vo.name = "herm";
        
        if ( !level flag::get( #"challenges_started" ) )
        {
            level flag::set( #"challenges_started" );
            level flag::set( #"hash_2a1215d8a3e31013" );
        }
        
        callback::on_connect( &function_76007e28 );
        self thread function_1525b94c();
        
        if ( self.script_location != "frozen_crevasse" )
        {
            return;
        }
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0x7f78f8b7, Offset: 0x1a68
// Size: 0x2e
function function_2a4de81f()
{
    level endon( #"end_game" );
    wait 5;
    self.var_5ac3d786 = 1;
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0xcab59cf7, Offset: 0x1aa0
// Size: 0xf4
function function_1525b94c()
{
    n_size = self.a_s_challenges.size;
    
    if ( n_size > 0 )
    {
        self.var_d6578e1f = array::pop_front( self.a_s_challenges );
        
        if ( n_size == 3 && level flag::get( #"hash_2a1215d8a3e31013" ) )
        {
            self.e_vo zm_hms_util::function_6a0d675d( #"hash_3a42fc5b4bbe08c5" );
            level flag::clear( #"hash_2a1215d8a3e31013" );
        }
        
        self start_challenge();
        return;
    }
    
    self challenges_completed();
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0x28075a3a, Offset: 0x1ba0
// Size: 0x114
function challenges_completed()
{
    self notify( #"challenge_station_completed" );
    self.var_6fb9ebb6 = 1;
    level.var_97a44fdd = undefined;
    level flag::clear( #"challenge_active" );
    level.var_a43a746d++;
    level function_e7b5b4bc();
    callback::remove_on_connect( &function_76007e28 );
    
    if ( level.var_a43a746d == level.a_s_challenge_stations.size )
    {
        level thread all_challenges_completed();
    }
    
    while ( isdefined( self.e_vo.is_speaking ) && self.e_vo.is_speaking )
    {
        waitframe( 1 );
    }
    
    if ( isdefined( self.e_vo ) )
    {
        self.e_vo delete();
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0x2a643a7e, Offset: 0x1cc0
// Size: 0x132
function function_e7b5b4bc()
{
    switch ( level.var_a43a746d )
    {
        case 1:
            level flag::set( #"hash_2d3f1dd5445d3423" );
            break;
        case 2:
            level flag::set( #"hash_4e33fc3d32735214" );
            break;
        case 3:
            level flag::set( #"hash_701aa76674161d36" );
            break;
        case 4:
            level flag::set( #"hash_616e0abddc034740" );
            break;
        case 5:
            level flag::set( #"hash_5b3ea84b9db5af50" );
            break;
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0x1956ed61, Offset: 0x1e00
// Size: 0x1a2
function function_76007e28()
{
    self endon( #"disconnect" );
    
    if ( !isdefined( level.var_97a44fdd ) || !isdefined( level.var_97a44fdd.var_d6578e1f ) )
    {
        return;
    }
    
    var_d6578e1f = level.var_97a44fdd.var_d6578e1f;
    n_current_progress = var_d6578e1f.n_current_progress;
    n_index = var_d6578e1f.n_index;
    n_goal = var_d6578e1f.n_goal;
    
    if ( isdefined( var_d6578e1f ) && isdefined( n_current_progress ) && isdefined( n_index ) && isdefined( n_goal ) )
    {
        level zm_ui_inventory::function_7df6bb60( #"zm_orange_challenges_progress", n_current_progress, self );
        level zm_ui_inventory::function_7df6bb60( #"zm_orange_challenges_target", n_goal, self );
        level zm_ui_inventory::function_7df6bb60( #"zm_orange_challenges", n_index, self );
        
        switch ( n_index )
        {
            case 4:
            case 12:
                self thread function_ffe9eab7( var_d6578e1f );
                break;
            default:
                break;
        }
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0x10bcc49, Offset: 0x1fb0
// Size: 0x7c
function all_challenges_completed()
{
    level flag::set( #"all_challenges_complete" );
    zm_orange_pablo::function_3f9e02b8( 0, #"hash_3f668e62652456fd", #"hash_3e87176776a2b6e3", &function_561fda29 );
    zm_orange_pablo::function_d83490c5( 0 );
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0xa91fa99d, Offset: 0x2038
// Size: 0xfc
function function_561fda29()
{
    var_16c37c7f = struct::get( "reward_crate_thunder", "targetname" );
    var_16c37c7f.e_lid = getent( var_16c37c7f.var_c8166135, "targetname" );
    var_16c37c7f.e_lock = getent( var_16c37c7f.target_lock, "targetname" );
    var_16c37c7f.e_weapon = getent( var_16c37c7f.target_weapon, "targetname" );
    var_16c37c7f zm_unitrigger::create( &function_54e8826c, 64 );
    var_16c37c7f thread function_400a7216();
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 1
// Checksum 0xd1c8e324, Offset: 0x2140
// Size: 0xb2
function function_54e8826c( e_player )
{
    if ( e_player.currentweapon.isheroweapon === 1 || e_player.currentweapon.name === #"zhield_riot_dw" )
    {
        return 0;
    }
    
    str_hint = zm_utility::function_d6046228( #"hash_509dd10b32275ac6", #"hash_1fbdd38541c13a62" );
    self sethintstring( str_hint );
    return 1;
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0xbc724342, Offset: 0x2200
// Size: 0x74
function function_400a7216()
{
    level endon( #"end_game" );
    s_result = self waittill( #"trigger_activated" );
    self zm_unitrigger::unregister_unitrigger( self.s_unitrigger );
    self function_735037d4();
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0xbe204375, Offset: 0x2280
// Size: 0x13c
function function_735037d4()
{
    level endon( #"end_game" );
    
    if ( isdefined( self.e_lock ) )
    {
        self.e_lock delete();
    }
    
    wait 0.5;
    self.e_lid rotatepitch( -95, 2, 0, 0.666667 );
    self.e_lid playsound( #"hash_1cfa90c531f36b92" );
    self.e_lid waittill( #"rotatedone" );
    self.e_weapon movez( 24, 2 );
    self.e_weapon waittill( #"movedone" );
    self.e_weapon zm_orange_util::start_zombies_collision_manager( getweapon( "thundergun" ), &function_3e185177 );
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 2
// Checksum 0xdedb9aba, Offset: 0x23c8
// Size: 0x3c
function function_3e185177( e_player, b_get_weapon )
{
    if ( b_get_weapon )
    {
        e_player thread zm_orange_util::function_51b752a9( #"hash_5de2e17b31c4f1fd" );
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0x677a7899, Offset: 0x2410
// Size: 0x20c
function start_challenge()
{
    level endon( #"end_game" );
    level.var_b42f4f4b = self;
    var_d6578e1f = self.var_d6578e1f;
    
    while ( level.pablo_npc.isspeaking )
    {
        waitframe( 1 );
    }
    
    self.e_vo zm_hms_util::function_6a0d675d( var_d6578e1f.str_vox );
    
    if ( getplayers().size <= 2 )
    {
        var_d6578e1f.n_goal = var_d6578e1f.var_db4802f2;
    }
    else
    {
        var_d6578e1f.n_goal = var_d6578e1f.var_be570367;
    }
    
    self function_bce7e59b( var_d6578e1f.n_index, var_d6578e1f.n_current_progress, var_d6578e1f.n_goal );
    playsoundatposition( #"hash_405121518503e4be", self.origin );
    self thread [[ var_d6578e1f.func_setup ]]();
    var_d6578e1f waittill( var_d6578e1f.str_notify );
    self [[ var_d6578e1f.func_cleanup ]]();
    self function_616536b0();
    var_d6578e1f function_11001794();
    playsoundatposition( #"zmb_challenges_complete", self.origin );
    
    if ( var_d6578e1f.var_f2e7f46a )
    {
        self function_9e87f32a();
    }
    else
    {
        self function_98233b53();
    }
    
    self function_1525b94c();
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0x65233de5, Offset: 0x2628
// Size: 0x60
function function_616536b0()
{
    self.e_totem showpart( "tag_bulb_on_" + self.var_6c841cf );
    self.e_totem hidepart( "tag_bulb_off_" + self.var_6c841cf );
    self.var_6c841cf++;
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0x6eb16963, Offset: 0x2690
// Size: 0x3c
function function_658f9053()
{
    level endon( #"end_game" );
    callback::on_ai_killed( &function_1fdda3c7 );
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0xc8f1074f, Offset: 0x26d8
// Size: 0x3c
function function_5ba49bb9()
{
    level endon( #"end_game" );
    callback::remove_on_ai_killed( &function_1fdda3c7 );
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0xc15728ac, Offset: 0x2720
// Size: 0x34
function function_b1c46dce()
{
    level endon( #"end_game" );
    self.var_d6578e1f thread function_abec537();
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0x53dbe2e1, Offset: 0x2760
// Size: 0x1a
function function_b0d19ce9()
{
    level endon( #"end_game" );
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0xc78b448c, Offset: 0x2788
// Size: 0xac
function function_e960fbf3()
{
    level endon( #"end_game" );
    var_d6578e1f = self.var_d6578e1f;
    var_3d297ffb = var_d6578e1f.var_3d297ffb;
    var_d6578e1f function_5ba54739( var_d6578e1f.var_1d3eddd0, var_3d297ffb );
    var_d6578e1f function_5ba54739( var_d6578e1f.var_4b11b975, var_3d297ffb );
    var_d6578e1f function_5ba54739( var_d6578e1f.var_f99e168f, var_3d297ffb );
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0xb166682f, Offset: 0x2840
// Size: 0x1a
function function_35f6e838()
{
    level endon( #"end_game" );
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0x45a40ef6, Offset: 0x2868
// Size: 0x124
function function_63ed3839()
{
    level endon( #"end_game" );
    self.var_d6578e1f.var_4220f02a = array( getweapon( #"launcher_standard_t8" ), getweapon( #"tundragun" ) );
    
    foreach ( e_player in getplayers() )
    {
        e_player thread function_ffe9eab7( self.var_d6578e1f );
    }
    
    callback::on_ai_killed( &function_1fdda3c7 );
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0xe8acd9cd, Offset: 0x2998
// Size: 0x3c
function function_d9dffba1()
{
    level endon( #"end_game" );
    callback::remove_on_ai_killed( &function_1fdda3c7 );
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0x8f625cbd, Offset: 0x29e0
// Size: 0x3c
function function_6d225067()
{
    level endon( #"end_game" );
    callback::on_ai_killed( &function_1fdda3c7 );
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0xa3628771, Offset: 0x2a28
// Size: 0x3c
function function_6d50f216()
{
    level endon( #"end_game" );
    callback::remove_on_ai_killed( &function_1fdda3c7 );
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0xde36e564, Offset: 0x2a70
// Size: 0x1c4
function function_2ae162bf()
{
    level endon( #"end_game" );
    level flag::set( #"hash_84593b9650c7abf" );
    var_d6578e1f = self.var_d6578e1f;
    
    foreach ( s_ingredient in var_d6578e1f.a_s_ingredients )
    {
        s_ingredient zm_unitrigger::create( &function_79884a9c, 64 );
        s_ingredient thread function_2fc4d208( var_d6578e1f );
    }
    
    var_d6578e1f thread function_e845253b();
    var_d6578e1f.var_db24b7da = struct::get( "soup_ingredient_dropoff", "targetname" );
    var_d6578e1f.var_db24b7da zm_unitrigger::create( &function_7327ab9f, 64 );
    var_d6578e1f.var_db24b7da thread function_4ab0f49a( var_d6578e1f );
    var_d6578e1f.var_735249ac = getent( "soup_pot", "targetname" );
    var_d6578e1f.var_735249ac thread function_48f86741( var_d6578e1f );
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0xa20d9aae, Offset: 0x2c40
// Size: 0xbc
function function_1de4dc2b()
{
    level endon( #"end_game" );
    var_d6578e1f = self.var_d6578e1f;
    var_db24b7da = var_d6578e1f.var_db24b7da;
    var_db24b7da zm_unitrigger::unregister_unitrigger( var_db24b7da.s_unitrigger );
    var_735249ac = var_d6578e1f.var_735249ac;
    var_735249ac setcandamage( 0 );
    var_735249ac val::reset( "challenges", "allowdeath" );
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0x35c01c84, Offset: 0x2d08
// Size: 0x3c
function function_f0f0f5f3()
{
    level endon( #"end_game" );
    callback::on_ai_killed( &function_1fdda3c7 );
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0x7475d6a2, Offset: 0x2d50
// Size: 0x3c
function function_20f477f2()
{
    level endon( #"end_game" );
    callback::remove_on_ai_killed( &function_1fdda3c7 );
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0x1970eb98, Offset: 0x2d98
// Size: 0x34
function function_8885885d()
{
    level endon( #"end_game" );
    self.var_d6578e1f function_f363530e();
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0xf30b793a, Offset: 0x2dd8
// Size: 0x1a
function function_b0848cf7()
{
    level endon( #"end_game" );
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0xedb81750, Offset: 0x2e00
// Size: 0xac
function function_39ca7654()
{
    level endon( #"end_game" );
    self.var_5ac3d786 = 0;
    self.var_d6578e1f.var_2abe7ecb = getentarray( "challenges_bell", "targetname" );
    var_2abe7ecb = self.var_d6578e1f.var_2abe7ecb;
    self.var_d6578e1f function_3bb5cdd9( self );
    level flag::set( #"hash_4a8105909cc2603d" );
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0x171c68c8, Offset: 0x2eb8
// Size: 0xc8
function function_a0ebbf07()
{
    level endon( #"end_game" );
    level flag::clear( #"hash_4a8105909cc2603d" );
    
    foreach ( var_c3e20cb in self.var_d6578e1f.var_2abe7ecb )
    {
        var_c3e20cb val::reset( "challenges", "allowdeath" );
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0xb708b57e, Offset: 0x2f88
// Size: 0x54
function function_6384ebfd()
{
    level endon( #"end_game" );
    self.var_d6578e1f thread function_1417e75b();
    callback::on_ai_killed( &function_1fdda3c7 );
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0x120a6b30, Offset: 0x2fe8
// Size: 0xd8
function function_fd31e27b()
{
    level endon( #"end_game" );
    callback::remove_on_ai_killed( &function_1fdda3c7 );
    var_cbb3defa = getentarray( "brain_item_drop", "targetname" );
    
    foreach ( var_1e43a31e in var_cbb3defa )
    {
        var_1e43a31e zm_item_pickup::function_d6812b9d();
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0x39466e6b, Offset: 0x30c8
// Size: 0x3c
function function_6639d547()
{
    level endon( #"end_game" );
    callback::on_ai_killed( &function_1fdda3c7 );
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0x741c3d8, Offset: 0x3110
// Size: 0x3c
function function_50961fa5()
{
    level endon( #"end_game" );
    callback::remove_on_ai_killed( &function_1fdda3c7 );
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0x59104406, Offset: 0x3158
// Size: 0x2c8
function function_bb6ca008()
{
    level endon( #"end_game" );
    
    foreach ( e_player in getplayers() )
    {
        e_player thread function_ffe9eab7( self.var_d6578e1f );
    }
    
    self.var_d6578e1f.var_cfff7c87 = struct::get( "piss_bottles_pickup", "targetname" );
    var_cfff7c87 = self.var_d6578e1f.var_cfff7c87;
    var_cfff7c87 zm_unitrigger::create( &function_753b9012, 96 );
    var_cfff7c87 thread function_c607ac40( self.var_d6578e1f );
    self.var_d6578e1f.var_c0620ae0 = struct::get_array( "piss_bottles_dropoff", "targetname" );
    var_c0620ae0 = self.var_d6578e1f.var_c0620ae0;
    
    if ( var_c0620ae0.size > 1 )
    {
        foreach ( var_b5b189cd in var_c0620ae0 )
        {
            var_b5b189cd zm_unitrigger::create( &function_88d98fce, 256 );
            var_b5b189cd thread function_3fbb4390( self.var_d6578e1f );
        }
        
        return;
    }
    
    foreach ( var_b5b189cd in var_c0620ae0 )
    {
        var_b5b189cd zm_unitrigger::create( "", 1256 );
        var_b5b189cd thread function_3fbb4390( self.var_d6578e1f );
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0xdc2135, Offset: 0x3428
// Size: 0xe8
function function_a9598dd1()
{
    level endon( #"end_game" );
    var_cfff7c87 = self.var_d6578e1f.var_cfff7c87;
    var_cfff7c87 zm_unitrigger::unregister_unitrigger( var_cfff7c87.s_unitrigger );
    var_c0620ae0 = self.var_d6578e1f.var_c0620ae0;
    
    foreach ( var_b5b189cd in var_c0620ae0 )
    {
        var_b5b189cd zm_unitrigger::unregister_unitrigger( var_b5b189cd.s_unitrigger );
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0xa2ef4e87, Offset: 0x3518
// Size: 0x34
function function_b40fed60()
{
    level endon( #"end_game" );
    self.var_d6578e1f thread function_ce8060cc();
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0x330caca8, Offset: 0x3558
// Size: 0x1a
function function_a4b66a2b()
{
    level endon( #"end_game" );
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0xc38d5ff6, Offset: 0x3580
// Size: 0x3c
function registersplicestarttraverse()
{
    level endon( #"end_game" );
    callback::on_ai_killed( &function_1fdda3c7 );
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0xe589e4f5, Offset: 0x35c8
// Size: 0x3c
function function_7d030c3d()
{
    level endon( #"end_game" );
    callback::remove_on_ai_killed( &function_1fdda3c7 );
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0xca0bf19, Offset: 0x3610
// Size: 0x34
function function_a36ace8b()
{
    level endon( #"end_game" );
    self.var_d6578e1f thread function_a0ce7b0f();
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0x1df99cfa, Offset: 0x3650
// Size: 0x34
function function_6884e5b8()
{
    level endon( #"end_game" );
    self.var_d6578e1f function_8288a87();
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0x98d08df6, Offset: 0x3690
// Size: 0x184
function function_a0ce7b0f()
{
    self.var_1ef4f1fa = getent( "whack_a_mole_start", "targetname" );
    var_1ef4f1fa = self.var_1ef4f1fa;
    self.var_975e7731 = getentarray( "whack_a_mole_target", "targetname" );
    
    foreach ( var_deeb8287 in self.var_975e7731 )
    {
        var_deeb8287.s_challenge = self;
        var_deeb8287.var_107ca298 = var_deeb8287.origin;
        var_deeb8287.var_5287d229 = var_deeb8287.angles;
        var_deeb8287.var_4e749208 = var_deeb8287.var_107ca298 + ( 0, 0, 56 );
    }
    
    var_1ef4f1fa setcandamage( 1 );
    var_1ef4f1fa val::set( "challenges", "allowdeath", 0 );
    var_1ef4f1fa thread whack_a_mole_start_watcher( self );
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 1
// Checksum 0xa5ab2538, Offset: 0x3820
// Size: 0xfa
function whack_a_mole_start_watcher( var_d6578e1f )
{
    level endon( #"end_game" );
    var_d6578e1f endon( var_d6578e1f.str_notify );
    self notify( "1c28e592c6826d46" );
    self endon( "1c28e592c6826d46" );
    
    while ( true )
    {
        s_params = self waittill( #"damage" );
        
        if ( zm_orange_util::function_fe8ee9f0( s_params.weapon, 0 ) )
        {
            self setcandamage( 0 );
            self val::reset( "challenges", "allowdeath" );
            var_d6578e1f thread function_4ce023ff();
            return;
        }
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0xe0f1f5b7, Offset: 0x3928
// Size: 0x184
function function_4ce023ff()
{
    level endon( #"end_game" );
    self endon( self.str_notify, #"hash_1a4fcb205b5695b5" );
    self.var_49201a73 = 1;
    
    foreach ( e_target in self.var_975e7731 )
    {
        e_target setcandamage( 1 );
        e_target val::set( "challenges", "allowdeath", 0 );
    }
    
    if ( self.n_current_progress === 0 )
    {
        self function_1e4147b3( 5, 3 );
        wait 5;
    }
    
    if ( self.n_current_progress === 1 )
    {
        self function_1e4147b3( 10, 2.75 );
        wait 5;
    }
    
    if ( self.n_current_progress === 2 )
    {
        self function_1e4147b3( 15, 2.5 );
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 2
// Checksum 0xbcf3e3b9, Offset: 0x3ab8
// Size: 0x1d4
function function_1e4147b3( var_a5d77ed0, var_a5bc211a )
{
    level endon( #"end_game" );
    self endon( self.str_notify, #"hash_1a4fcb205b5695b5" );
    
    if ( getplayers().size <= 2 )
    {
        self.var_8aa74ff0 = 6;
    }
    else
    {
        self.var_8aa74ff0 = 4;
    }
    
    var_77ba553d = 0;
    self.var_d71fc7c = 0;
    
    while ( var_77ba553d < var_a5d77ed0 )
    {
        b_success = 0;
        wait var_a5bc211a;
        
        while ( !b_success )
        {
            e_target = array::random( self.var_975e7731 );
            
            if ( !isdefined( e_target.b_is_up ) || !e_target.b_is_up )
            {
                b_success = 1;
                e_target.b_is_up = 1;
                var_77ba553d++;
                e_target thread function_8645fbe7( self );
                e_target moveto( e_target.var_4e749208, 0.35 );
                e_target waittill( #"movedone" );
                e_target thread function_a80a048d( self );
            }
        }
    }
    
    while ( self.var_d71fc7c < var_a5d77ed0 )
    {
        waitframe( 1 );
    }
    
    self function_eaf6e39e();
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0x38695f58, Offset: 0x3c98
// Size: 0x108
function function_8288a87()
{
    level endon( #"end_game" );
    
    foreach ( var_deeb8287 in self.var_975e7731 )
    {
        if ( var_deeb8287.b_is_up === 1 )
        {
            var_deeb8287 moveto( var_deeb8287.var_107ca298, 0.1 );
            var_deeb8287 rotateto( var_deeb8287.var_5287d229, 0.1 );
            var_deeb8287.b_is_up = 0;
            var_deeb8287 waittill( #"movedone" );
        }
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 1
// Checksum 0xc457b830, Offset: 0x3da8
// Size: 0x110
function function_a80a048d( s_challenge )
{
    level endon( #"end_game" );
    self endon( #"hash_759e710e575d89bb" );
    s_challenge endon( #"hash_1a4fcb205b5695b5", s_challenge.str_notify );
    wait 0.5;
    self rotateyaw( 360, s_challenge.var_8aa74ff0 - 1 );
    self waittill( #"rotatedone" );
    wait 0.5;
    
    if ( isdefined( s_challenge.var_49201a73 ) && s_challenge.var_49201a73 )
    {
        s_challenge.var_49201a73 = 0;
        s_challenge thread function_b0770e43();
    }
    
    self notify( #"hash_1a4fcb205b5695b5" );
    s_challenge notify( #"hash_1a4fcb205b5695b5" );
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0xdebd28d6, Offset: 0x3ec0
// Size: 0x16c
function function_b0770e43()
{
    self thread function_8288a87();
    
    if ( math::cointoss( 50 ) )
    {
        a_e_players = array::randomize( getplayers() );
        
        foreach ( e_player in a_e_players )
        {
            if ( !e_player util::is_spectating() )
            {
                e_player thread zm_orange_util::function_51b752a9( #"vox_generic_responses_negative" );
                break;
            }
        }
    }
    
    var_1ef4f1fa = self.var_1ef4f1fa;
    var_1ef4f1fa setcandamage( 1 );
    var_1ef4f1fa val::set( "challenges", "allowdeath", 0 );
    var_1ef4f1fa thread whack_a_mole_start_watcher( self );
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 1
// Checksum 0x6d34744d, Offset: 0x4038
// Size: 0x12c
function function_8645fbe7( s_challenge )
{
    level endon( #"end_game" );
    self endon( #"hash_1a4fcb205b5695b5" );
    s_challenge endon( s_challenge.str_notify );
    
    while ( true )
    {
        s_params = self waittill( #"damage" );
        
        if ( zm_orange_util::function_fe8ee9f0( s_params.weapon, 0 ) )
        {
            self moveto( self.var_107ca298, 0.1 );
            self rotateto( self.var_5287d229, 0.1 );
            self.b_is_up = 0;
            s_challenge.var_d71fc7c++;
            self waittill( #"movedone" );
            self notify( #"hash_759e710e575d89bb" );
            return;
        }
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0x59bda882, Offset: 0x4170
// Size: 0x3ec
function function_33f591cf()
{
    s_challenge = self.a_s_challenges[ 2 ];
    var_dd80e9d = getentarray( "sos_snowball", "targetname" );
    s_challenge.var_1d3eddd0 = [];
    s_challenge.var_4b11b975 = [];
    s_challenge.var_f99e168f = [];
    
    foreach ( var_a64b34d1 in var_dd80e9d )
    {
        if ( var_a64b34d1.script_int === 0 )
        {
            if ( !isdefined( s_challenge.var_1d3eddd0 ) )
            {
                s_challenge.var_1d3eddd0 = [];
            }
            else if ( !isarray( s_challenge.var_1d3eddd0 ) )
            {
                s_challenge.var_1d3eddd0 = array( s_challenge.var_1d3eddd0 );
            }
            
            s_challenge.var_1d3eddd0[ s_challenge.var_1d3eddd0.size ] = var_a64b34d1;
            continue;
        }
        
        if ( var_a64b34d1.script_int === 1 )
        {
            if ( !isdefined( s_challenge.var_4b11b975 ) )
            {
                s_challenge.var_4b11b975 = [];
            }
            else if ( !isarray( s_challenge.var_4b11b975 ) )
            {
                s_challenge.var_4b11b975 = array( s_challenge.var_4b11b975 );
            }
            
            s_challenge.var_4b11b975[ s_challenge.var_4b11b975.size ] = var_a64b34d1;
            continue;
        }
        
        if ( !isdefined( s_challenge.var_f99e168f ) )
        {
            s_challenge.var_f99e168f = [];
        }
        else if ( !isarray( s_challenge.var_f99e168f ) )
        {
            s_challenge.var_f99e168f = array( s_challenge.var_f99e168f );
        }
        
        s_challenge.var_f99e168f[ s_challenge.var_f99e168f.size ] = var_a64b34d1;
    }
    
    s_challenge.var_d9226626 = 0;
    s_challenge.var_f5b2caa6 = 0;
    s_challenge.var_1755f412 = 0;
    s_challenge.var_1d3eddd0 = array::randomize( s_challenge.var_1d3eddd0 );
    s_challenge.var_4b11b975 = array::randomize( s_challenge.var_4b11b975 );
    s_challenge.var_f99e168f = array::randomize( s_challenge.var_f99e168f );
    
    if ( getplayers().size <= 2 )
    {
        s_challenge.var_3d297ffb = 4;
    }
    else
    {
        s_challenge.var_3d297ffb = 6;
    }
    
    var_3d297ffb = s_challenge.var_3d297ffb;
    function_577eae5d( s_challenge.var_1d3eddd0, var_3d297ffb );
    function_577eae5d( s_challenge.var_4b11b975, var_3d297ffb );
    function_577eae5d( s_challenge.var_f99e168f, var_3d297ffb );
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 2
// Checksum 0x228bed9, Offset: 0x4568
// Size: 0xba
function function_577eae5d( var_dd80e9d, var_e205c5f3 )
{
    var_588c71ce = 0;
    
    foreach ( var_a64b34d1 in var_dd80e9d )
    {
        if ( var_588c71ce < var_e205c5f3 )
        {
            var_a64b34d1 hide();
            var_588c71ce++;
            continue;
        }
        
        var_a64b34d1.var_518da2ac = 1;
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 2
// Checksum 0x67fbdc53, Offset: 0x4630
// Size: 0xe8
function function_5ba54739( var_dd80e9d, var_e205c5f3 )
{
    foreach ( var_a64b34d1 in var_dd80e9d )
    {
        if ( isdefined( var_a64b34d1 ) && !isdefined( var_a64b34d1.var_518da2ac ) )
        {
            var_a64b34d1 setcandamage( 1 );
            var_a64b34d1 val::set( "challenges", "allowdeath", 0 );
            var_a64b34d1 thread function_89754c19( self );
        }
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 1
// Checksum 0x305df385, Offset: 0x4720
// Size: 0x1fe
function function_89754c19( var_d6578e1f )
{
    level endon( #"end_game" );
    self endon( #"death" );
    var_d6578e1f endon( var_d6578e1f.str_notify );
    
    while ( true )
    {
        s_params = self waittill( #"damage" );
        
        if ( zm_orange_util::function_fe8ee9f0( s_params.weapon, 0 ) )
        {
            self show();
            
            if ( self.script_int === 0 )
            {
                var_d6578e1f.var_d9226626++;
                
                if ( var_d6578e1f.var_d9226626 >= var_d6578e1f.var_3d297ffb )
                {
                    var_d6578e1f.n_current_progress++;
                }
            }
            else if ( self.script_int === 1 )
            {
                var_d6578e1f.var_f5b2caa6++;
                
                if ( var_d6578e1f.var_f5b2caa6 >= var_d6578e1f.var_3d297ffb )
                {
                    var_d6578e1f.n_current_progress++;
                }
            }
            else
            {
                var_d6578e1f.var_1755f412++;
                
                if ( var_d6578e1f.var_1755f412 >= var_d6578e1f.var_3d297ffb )
                {
                    var_d6578e1f.n_current_progress++;
                }
            }
            
            self setcandamage( 0 );
            self val::reset( "challenges", "allowdeath" );
            var_d6578e1f function_544b63c0( var_d6578e1f.n_current_progress );
            
            if ( var_d6578e1f.n_current_progress >= var_d6578e1f.n_goal )
            {
                var_d6578e1f notify( var_d6578e1f.str_notify );
            }
            
            return;
        }
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0x8ffd931e, Offset: 0x4928
// Size: 0x568
function function_dfeb1c1b()
{
    var_7176f841 = struct::get_array( "pablo_soup_ingredients", "targetname" );
    a_s_meats = [];
    a_s_spices = [];
    a_s_vegetables = [];
    
    foreach ( var_33e4d4f0 in var_7176f841 )
    {
        if ( var_33e4d4f0.script_string === "meats" )
        {
            if ( !isdefined( a_s_meats ) )
            {
                a_s_meats = [];
            }
            else if ( !isarray( a_s_meats ) )
            {
                a_s_meats = array( a_s_meats );
            }
            
            a_s_meats[ a_s_meats.size ] = var_33e4d4f0;
            continue;
        }
        
        if ( var_33e4d4f0.script_string === "spices" )
        {
            if ( !isdefined( a_s_spices ) )
            {
                a_s_spices = [];
            }
            else if ( !isarray( a_s_spices ) )
            {
                a_s_spices = array( a_s_spices );
            }
            
            a_s_spices[ a_s_spices.size ] = var_33e4d4f0;
            continue;
        }
        
        if ( !isdefined( a_s_vegetables ) )
        {
            a_s_vegetables = [];
        }
        else if ( !isarray( a_s_vegetables ) )
        {
            a_s_vegetables = array( a_s_vegetables );
        }
        
        a_s_vegetables[ a_s_vegetables.size ] = var_33e4d4f0;
    }
    
    self.a_s_ingredients = [];
    s_meat = array::random( a_s_meats );
    
    if ( !isdefined( self.a_s_ingredients ) )
    {
        self.a_s_ingredients = [];
    }
    else if ( !isarray( self.a_s_ingredients ) )
    {
        self.a_s_ingredients = array( self.a_s_ingredients );
    }
    
    self.a_s_ingredients[ self.a_s_ingredients.size ] = s_meat;
    arrayremovevalue( a_s_meats, s_meat );
    s_spice = array::random( a_s_spices );
    
    if ( !isdefined( self.a_s_ingredients ) )
    {
        self.a_s_ingredients = [];
    }
    else if ( !isarray( self.a_s_ingredients ) )
    {
        self.a_s_ingredients = array( self.a_s_ingredients );
    }
    
    self.a_s_ingredients[ self.a_s_ingredients.size ] = s_spice;
    arrayremovevalue( a_s_spices, s_spice );
    s_vegetable = array::random( a_s_vegetables );
    
    if ( !isdefined( self.a_s_ingredients ) )
    {
        self.a_s_ingredients = [];
    }
    else if ( !isarray( self.a_s_ingredients ) )
    {
        self.a_s_ingredients = array( self.a_s_ingredients );
    }
    
    self.a_s_ingredients[ self.a_s_ingredients.size ] = s_vegetable;
    arrayremovevalue( a_s_vegetables, s_vegetable );
    
    foreach ( s_ingredient in self.a_s_ingredients )
    {
        s_ingredient.e_ingredient = getent( s_ingredient.target, "targetname" );
    }
    
    var_d74bb24 = [];
    var_d74bb24 = arraycombine( a_s_meats, a_s_spices, 1, 0 );
    var_d74bb24 = arraycombine( var_d74bb24, a_s_vegetables, 1, 0 );
    
    foreach ( s_ingredient in var_d74bb24 )
    {
        e_ingredient = getent( s_ingredient.target, "targetname" );
        e_ingredient delete();
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 1
// Checksum 0xf51a81fd, Offset: 0x4e98
// Size: 0x60, Type: bool
function function_79884a9c( e_player )
{
    str_hint = zm_utility::function_d6046228( #"hash_1b00229a5eb94332", #"hash_48b4d710bb0a2406" );
    self sethintstring( str_hint );
    return true;
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 1
// Checksum 0xe3d6cfd6, Offset: 0x4f00
// Size: 0x12c
function function_2fc4d208( s_challenge )
{
    level endon( #"end_game" );
    s_challenge endon( s_challenge.str_notify );
    s_result = self waittill( #"trigger_activated" );
    e_who = s_result.e_who;
    playsoundatposition( #"hash_4b33537532733659", self.origin );
    e_who thread zm_audio::create_and_play_dialog( #"challenge", #"pickup_generic" );
    self.e_ingredient delete();
    
    if ( !isdefined( s_challenge.var_e9a74caf ) )
    {
        s_challenge.var_e9a74caf = 0;
    }
    
    s_challenge.var_e9a74caf++;
    self zm_unitrigger::unregister_unitrigger( self.s_unitrigger );
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0xb67164c, Offset: 0x5038
// Size: 0x84
function function_e845253b()
{
    level endon( #"end_game" );
    self endon( self.str_notify );
    
    while ( true )
    {
        if ( isdefined( self.var_e9a74caf ) && self.var_e9a74caf >= 3 )
        {
            self.n_current_progress++;
            self function_544b63c0( self.n_current_progress );
            return;
        }
        
        wait 0.1;
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 1
// Checksum 0x31e365c8, Offset: 0x50c8
// Size: 0x138, Type: bool
function function_7327ab9f( e_player )
{
    if ( level flag::get( #"ww_icicle_melting" ) )
    {
        return false;
    }
    
    if ( isdefined( level.var_97a44fdd ) && isdefined( level.var_97a44fdd.var_d6578e1f ) )
    {
        s_challenge = level.var_97a44fdd.var_d6578e1f;
    }
    else
    {
        self sethintstring( "" );
        return true;
    }
    
    if ( isdefined( s_challenge.var_e9a74caf ) && s_challenge.var_e9a74caf >= 3 )
    {
        str_hint = zm_utility::function_d6046228( #"hash_1d0e45476161abb0", #"hash_25488a48dddb319c" );
        self sethintstring( str_hint );
        return true;
    }
    
    self sethintstring( "" );
    return true;
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 1
// Checksum 0x6a02f1c3, Offset: 0x5208
// Size: 0x192
function function_4ab0f49a( var_d6578e1f )
{
    level endon( #"end_game" );
    var_d6578e1f endon( var_d6578e1f.str_notify );
    
    while ( true )
    {
        self waittill( #"trigger_activated" );
        
        if ( level flag::get( #"ww_icicle_melting" ) )
        {
            continue;
        }
        
        if ( !isdefined( var_d6578e1f.var_e9a74caf ) )
        {
            var_d6578e1f.var_e9a74caf = 0;
        }
        
        if ( var_d6578e1f.var_e9a74caf >= 3 )
        {
            playsoundatposition( #"hash_45b15e2671c49618", self.origin );
            var_d6578e1f.n_current_progress++;
            var_d6578e1f function_544b63c0( var_d6578e1f.n_current_progress );
            var_d6578e1f.var_735249ac setmodel( "p8_zm_ora_kitchenware_soup_pot" );
            
            if ( var_d6578e1f.n_current_progress >= var_d6578e1f.n_goal )
            {
                var_d6578e1f thread function_65a629f5();
                var_d6578e1f notify( var_d6578e1f.str_notify );
            }
            
            self zm_unitrigger::unregister_unitrigger( self.s_unitrigger );
            return;
        }
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0x1c65e5b9, Offset: 0x53a8
// Size: 0x84
function function_65a629f5()
{
    level endon( #"end_game" );
    
    while ( zm_zonemgr::any_player_in_zone( "forecastle" ) )
    {
        waitframe( 1 );
    }
    
    self.var_735249ac setmodel( "p8_cas_kitchenware_soup_pot" );
    level flag::clear( #"hash_84593b9650c7abf" );
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 1
// Checksum 0xb537a42d, Offset: 0x5438
// Size: 0x17a
function function_48f86741( var_d6578e1f )
{
    var_d6578e1f endon( var_d6578e1f.str_notify );
    self endon( #"delete" );
    self setcandamage( 1 );
    self val::set( "challenges", "allowdeath", 0 );
    
    while ( true )
    {
        s_params = self waittill( #"damage" );
        
        if ( zm_orange_util::function_fe8ee9f0( s_params.weapon ) && !level flag::get( #"ww_icicle_melting" ) )
        {
            var_d6578e1f.n_current_progress++;
            var_d6578e1f function_544b63c0( var_d6578e1f.n_current_progress );
            
            if ( var_d6578e1f.n_current_progress >= var_d6578e1f.n_goal )
            {
                var_d6578e1f.var_735249ac setmodel( "p8_zm_ora_kitchenware_soup_pot" );
                var_d6578e1f thread function_65a629f5();
                var_d6578e1f notify( var_d6578e1f.str_notify );
            }
            
            return;
        }
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0xfd57408, Offset: 0x55c0
// Size: 0x34
function function_be80cd37()
{
    var_b9e7250b = self.a_s_challenges[ 2 ];
    var_b9e7250b function_dfeb1c1b();
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 1
// Checksum 0xaaa849bb, Offset: 0x5600
// Size: 0x92
function function_753b9012( e_player )
{
    if ( !isdefined( e_player.var_77d7715a ) || !e_player.var_77d7715a )
    {
        str_hint = zm_utility::function_d6046228( #"hash_2ce0613217a0bac4", #"hash_21b8b8c46271e228" );
        self sethintstring( str_hint );
        return 1;
    }
    
    return 0;
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 1
// Checksum 0x27b570f7, Offset: 0x56a0
// Size: 0x138
function function_c607ac40( var_d6578e1f )
{
    level endon( #"end_game" );
    var_d6578e1f endon( var_d6578e1f.str_notify );
    self.var_5637fcf9 = 0;
    
    while ( true )
    {
        s_waitresult = self waittill( #"trigger_activated" );
        e_who = s_waitresult.e_who;
        
        if ( !isdefined( e_who.var_77d7715a ) || !e_who.var_77d7715a )
        {
            e_who playsound( #"hash_2814441619ec7760" );
            
            if ( !self.var_5637fcf9 )
            {
                self.var_5637fcf9 = 1;
                e_who thread function_10e9c8b5();
            }
            
            e_who.var_77d7715a = 1;
            e_who thread function_f1da3c8( var_d6578e1f );
            e_who thread function_f6ccb39( var_d6578e1f );
        }
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 1
// Checksum 0xb57585b6, Offset: 0x57e0
// Size: 0xf0
function function_88d98fce( e_player )
{
    if ( isdefined( e_player.var_77d7715a ) && e_player.var_77d7715a && e_player zm_zonemgr::get_player_zone() === "beach" && isdefined( e_player.b_in_water ) && e_player.b_in_water )
    {
        str_hint = zm_utility::function_d6046228( #"hash_30d231a12332f5ca", #"hash_5ada8641cf6032ce" );
        self sethintstring( str_hint );
        return 1;
    }
    
    self sethintstring( "" );
    return 0;
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 1
// Checksum 0x791aa52d, Offset: 0x58d8
// Size: 0x168
function function_3fbb4390( var_d6578e1f )
{
    level endon( #"end_game" );
    var_d6578e1f endon( var_d6578e1f.str_notify );
    
    while ( true )
    {
        s_waitresult = self waittill( #"trigger_activated" );
        e_who = s_waitresult.e_who;
        
        if ( isdefined( e_who.var_77d7715a ) && e_who.var_77d7715a && e_who zm_zonemgr::get_player_zone() === "beach" && isdefined( e_who.b_in_water ) && e_who.b_in_water )
        {
            e_who playsound( #"hash_2ad99bf60d7fe42a" );
            e_who notify( #"hash_1ae87f50e75564f3" );
            e_who.var_77d7715a = 0;
            
            if ( var_d6578e1f.n_current_progress === 0 )
            {
                e_who thread function_77044d02();
            }
            
            var_d6578e1f function_eaf6e39e();
        }
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0x1f9fb433, Offset: 0x5a48
// Size: 0x10a
function function_77044d02()
{
    switch ( self zm_vo::function_82f9bc9f() )
    {
        case #"marl":
            self thread zm_hms_util::function_51b752a9( #"vox_oh_shit", 2 );
            break;
        case #"mist":
            self thread zm_hms_util::function_51b752a9( #"vox_generic_responses_positive", 8 );
            break;
        case #"russ":
            self thread zm_hms_util::function_51b752a9( #"hash_43bbef358d7a1d56", 4 );
            break;
        case #"stuh":
            self thread zm_hms_util::function_51b752a9( #"hash_6ca1deacc4f61926", 4 );
            break;
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0xc9984f2e, Offset: 0x5b60
// Size: 0x10a
function function_10e9c8b5()
{
    switch ( self zm_vo::function_82f9bc9f() )
    {
        case #"marl":
            self thread zm_hms_util::function_51b752a9( #"hash_5a7e23f64d8bf2d0", 4 );
            break;
        case #"mist":
            self thread zm_hms_util::function_51b752a9( #"hash_43d252dd310e2faa", 4 );
            break;
        case #"russ":
            self thread zm_hms_util::function_51b752a9( #"hash_43d252dd310e2faa", 8 );
            break;
        case #"stuh":
            self thread zm_hms_util::function_51b752a9( #"vox_generic_responses_negative", 4 );
            break;
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 1
// Checksum 0x10bfe04a, Offset: 0x5c78
// Size: 0x150
function function_f6ccb39( s_challenge )
{
    level endon( #"end_game" );
    s_challenge endon( s_challenge.str_notify );
    self endon( #"death", #"hash_1ae87f50e75564f3", #"piss_spilled" );
    
    while ( true )
    {
        if ( self zm_utility::is_jumping() || self issliding() || self issprinting() || isdefined( self.laststand ) && self.laststand )
        {
            self playsound( #"hash_2fe344cda8a89a7a" );
            
            if ( math::cointoss( 50 ) )
            {
                self thread zm_orange_util::function_51b752a9( #"vox_generic_responses_negative" );
            }
            
            self.var_77d7715a = 0;
            self notify( #"piss_spilled" );
        }
        
        waitframe( 1 );
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 1
// Checksum 0x2ba19ae6, Offset: 0x5dd0
// Size: 0xb0
function function_f1da3c8( s_challenge )
{
    level endon( #"end_game" );
    s_challenge endon( s_challenge.str_notify );
    self endon( #"death", #"hash_1ae87f50e75564f3", #"piss_spilled" );
    
    while ( true )
    {
        wait 1;
        
        if ( isdefined( self.var_ab5095e1 ) && self.var_ab5095e1 )
        {
            self playsound( "zmb_pee_slosh" );
        }
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0xba655fc4, Offset: 0x5e88
// Size: 0x120
function function_e12fb431()
{
    level endon( #"end_game" );
    s_challenge = self.a_s_challenges[ 2 ];
    s_challenge.var_2abe7ecb = getentarray( "challenges_bell", "targetname" );
    
    foreach ( var_c3e20cb in s_challenge.var_2abe7ecb )
    {
        var_c3e20cb setcandamage( 1 );
        var_c3e20cb val::set( "challenges", "allowdeath", 0 );
        var_c3e20cb thread function_472fa2ca( s_challenge );
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 1
// Checksum 0xbfaa19b8, Offset: 0x5fb0
// Size: 0x9a
function function_3bb5cdd9( s_challenge_station )
{
    a_n_sequence = array( 0, 0, 1, 1, 2, 2, 3, 3 );
    a_n_sequence = array::randomize( a_n_sequence );
    self.a_n_sequence = a_n_sequence;
    self function_c40f1feb( s_challenge_station );
    wait 1;
    s_challenge_station.var_5ac3d786 = 1;
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 1
// Checksum 0x830c3541, Offset: 0x6058
// Size: 0x184
function function_c40f1feb( s_challenge_station )
{
    level endon( #"end_game" );
    self endon( self.str_notify );
    a_n_sequence = self.a_n_sequence;
    e_vo = s_challenge_station.e_vo;
    e_vo.last_vo_played_time = 0;
    
    for ( i = 0; i < 5 ; i++ )
    {
        switch ( a_n_sequence[ i ] )
        {
            case 0:
                e_vo zm_audio::do_player_or_npc_playvox( #"hash_2243128c47028806" );
                break;
            case 1:
                e_vo zm_audio::do_player_or_npc_playvox( #"hash_60469dfb06e1b418" );
                break;
            case 2:
                e_vo zm_audio::do_player_or_npc_playvox( #"hash_6358e1a146400a52" );
                break;
            case 3:
                e_vo zm_audio::do_player_or_npc_playvox( #"hash_10d5f47609e63584" );
                break;
        }
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 1
// Checksum 0x13185f55, Offset: 0x61e8
// Size: 0x30e
function function_472fa2ca( s_challenge )
{
    level endon( #"end_game" );
    
    while ( true )
    {
        self waittill( #"damage" );
        
        switch ( self.script_int )
        {
            case 0:
                var_66bb9366 = #"hash_b2dd9a0b97705ad";
                playsoundatposition( #"hash_23c7abbf9d34bf4a", self.origin );
                break;
            case 1:
                var_66bb9366 = #"hash_53f014fab33492d8";
                playsoundatposition( #"hash_23c7a9bf9d34bbe4", self.origin );
                break;
            case 2:
                var_66bb9366 = #"hash_594894375473c7b";
                playsoundatposition( #"hash_23c7a7bf9d34b87e", self.origin );
                break;
            case 3:
                var_66bb9366 = #"hash_33ce9da949624fae";
                playsoundatposition( #"hash_23c7a5bf9d34b518", self.origin );
                break;
        }
        
        foreach ( e_player in getplayers() )
        {
            if ( distancesquared( e_player.origin, self.origin ) < 6250000 )
            {
                e_player thread zm_equipment::show_hint_text( var_66bb9366, 2 );
            }
        }
        
        if ( level flag::get( #"hash_4a8105909cc2603d" ) )
        {
            if ( s_challenge.n_current_progress > s_challenge.a_n_sequence.size )
            {
                s_challenge.n_current_progress = s_challenge.a_n_sequence.size;
            }
            
            if ( self.script_int === s_challenge.a_n_sequence[ s_challenge.n_current_progress ] )
            {
                s_challenge function_eaf6e39e();
            }
            else
            {
                s_challenge.n_current_progress = 0;
                s_challenge function_544b63c0( s_challenge.n_current_progress );
            }
        }
        
        wait 1;
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0x77d2633e, Offset: 0x6500
// Size: 0x70
function function_f363530e()
{
    level endon( #"end_game" );
    self endon( self.str_notify );
    
    while ( true )
    {
        level waittill( #"hash_36bd057e4aa760bd", #"hash_4904b9ea745d6545" );
        self function_eaf6e39e();
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0x16f0a6cf, Offset: 0x6578
// Size: 0x78
function function_ce8060cc()
{
    level endon( #"end_game" );
    self endon( self.str_notify );
    
    while ( true )
    {
        s_result = level waittill( #"hash_1ba786f1661e3817" );
        self function_eaf6e39e( s_result.var_2ef2374 );
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0xa077c7f, Offset: 0x65f8
// Size: 0x78
function function_abec537()
{
    level endon( #"end_game" );
    self endon( self.str_notify );
    
    while ( true )
    {
        s_result = level waittill( #"hash_5e2619172b4487dd" );
        self function_eaf6e39e( s_result.n_count );
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 1
// Checksum 0x6281c325, Offset: 0x6678
// Size: 0x1c2
function function_1fdda3c7( s_params )
{
    if ( !isplayer( s_params.eattacker ) )
    {
        return;
    }
    
    var_d6578e1f = level.var_b42f4f4b.var_d6578e1f;
    
    switch ( var_d6578e1f.n_index )
    {
        case 1:
            var_d6578e1f function_a302ccda( s_params );
            break;
        case 4:
            var_d6578e1f function_d06cd5f9( s_params );
            break;
        case 5:
            var_d6578e1f function_d2403e6a( s_params );
            break;
        case 7:
            var_d6578e1f function_a741762f( s_params );
            break;
        case 10:
            var_d6578e1f function_55bd528c( s_params, self );
            break;
        case 11:
            var_d6578e1f function_2d23b317( s_params );
            break;
        case 14:
            var_d6578e1f function_eaf96378( s_params );
            break;
        default:
            break;
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 1
// Checksum 0x3a6448cb, Offset: 0x6848
// Size: 0x6c
function function_2d23b317( s_params )
{
    if ( s_params.weapon.isriotshield && ( s_params.smeansofdeath === "MOD_IMPACT" || s_params.smeansofdeath === "MOD_MELEE" ) )
    {
        self function_eaf6e39e();
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 1
// Checksum 0xa4927fe, Offset: 0x68c0
// Size: 0x54
function function_d06cd5f9( s_params )
{
    if ( isdefined( s_params.eattacker.var_ab5095e1 ) && !s_params.eattacker.var_ab5095e1 )
    {
        self function_eaf6e39e();
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 1
// Checksum 0x114eff25, Offset: 0x6920
// Size: 0x1a4
function function_ffe9eab7( s_challenge )
{
    level endon( #"end_game" );
    self endon( #"disconnect" );
    s_challenge endon( s_challenge.str_notify );
    
    while ( true )
    {
        var_197c85d1 = self getvelocity();
        var_9b7f7d9b = length( var_197c85d1 );
        w_weapon = self getcurrentweapon();
        w_weapon = zm_weapons::get_base_weapon( w_weapon );
        var_f77522bb = self getnormalizedmovement();
        
        if ( isalive( self ) && var_9b7f7d9b === 0 )
        {
            self.var_ab5095e1 = 0;
        }
        else if ( isarray( s_challenge.var_4220f02a ) && self isfiring() && isinarray( s_challenge.var_4220f02a, w_weapon ) && var_f77522bb == ( 0, 0, 0 ) )
        {
            self.var_ab5095e1 = 0;
        }
        else
        {
            self.var_ab5095e1 = 1;
        }
        
        waitframe( 1 );
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 1
// Checksum 0x46b26b10, Offset: 0x6ad0
// Size: 0x54
function function_eaf96378( s_params )
{
    if ( isdefined( s_params.eattacker.var_bf8dfaf4 ) && s_params.eattacker.var_bf8dfaf4 )
    {
        self function_eaf6e39e();
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 1
// Checksum 0xd9e34a5b, Offset: 0x6b30
// Size: 0x54
function function_a741762f( s_params )
{
    if ( isdefined( s_params.eattacker.b_in_water ) && s_params.eattacker.b_in_water )
    {
        self function_eaf6e39e();
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 2
// Checksum 0xc6dcca13, Offset: 0x6b90
// Size: 0xcc
function function_55bd528c( s_params, ai )
{
    if ( zm_utility::is_headshot( s_params.weapon, s_params.shitloc, s_params.smeansofdeath ) && ( !isdefined( ai.var_bf8dfaf4 ) || !ai.var_bf8dfaf4 ) )
    {
        if ( level.var_9cb7f7de < 15 )
        {
            b_spawned = self function_b0d64cce( ai.origin, ai.angles );
            
            if ( b_spawned )
            {
                level.var_9cb7f7de++;
            }
        }
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 2
// Checksum 0x2a8694cf, Offset: 0x6c68
// Size: 0x204, Type: bool
function function_b0d64cce( v_pos, v_angles )
{
    if ( isdefined( v_pos ) )
    {
        v_drop = zm_hms_util::function_6d41bab8( v_pos, 360 );
        
        if ( !isdefined( v_drop ) )
        {
            /#
                iprintlnbold( "<dev string:x38>" );
            #/
            
            v_drop = v_pos;
        }
        
        v_ground = groundtrace( v_drop + ( 0, 0, 64 ) + ( 0, 0, 8 ), v_drop + ( 0, 0, 64 ) + ( 0, 0, -100000 ), 0, self )[ #"position" ];
        v_ground += ( 0, 0, 36 );
        e_brain = util::spawn_model( "p8_zm_esc_warden_organs_brain", v_ground );
        waitframe( 1 );
        s_unitrigger = e_brain zm_item_pickup::create_item_pickup( &function_4626ec3, &function_fde99ac6, undefined, 96 );
        e_brain.targetname = "brain_item_drop";
        e_brain.var_8691c7d4 = 1;
        e_brain playsound( #"zmb_spawn_powerup" );
        e_brain playloopsound( #"zmb_spawn_powerup_loop" );
        e_brain thread function_f5f83516();
        zm_unitrigger::reregister_unitrigger_as_dynamic( s_unitrigger );
        return true;
    }
    
    return false;
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 2
// Checksum 0x28769ea2, Offset: 0x6e78
// Size: 0x8c
function function_4626ec3( e_item, e_player )
{
    e_item zm_unitrigger::unregister_unitrigger( e_item.s_unitrigger );
    e_item stoploopsound();
    e_player playsound( #"zmb_powerup_grabbed" );
    level notify( #"hash_3f9f63ddefc15247" );
    level.var_9cb7f7de--;
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 1
// Checksum 0x61ae97dc, Offset: 0x6f10
// Size: 0x60, Type: bool
function function_fde99ac6( e_player )
{
    str_hint = zm_utility::function_d6046228( #"hash_74a5f9eca181602", #"hash_682f7d4cd40349d6" );
    self sethintstring( str_hint );
    return true;
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0xead70e3c, Offset: 0x6f78
// Size: 0x60
function function_1417e75b()
{
    level endon( #"end_game" );
    self endon( self.str_notify );
    
    while ( true )
    {
        level waittill( #"hash_3f9f63ddefc15247" );
        self function_eaf6e39e();
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 1
// Checksum 0x14a80d5a, Offset: 0x6fe0
// Size: 0x3c
function function_a302ccda( s_params )
{
    if ( zm_orange_util::function_fe8ee9f0( s_params.weapon ) )
    {
        self function_eaf6e39e();
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 1
// Checksum 0x54c7040d, Offset: 0x7028
// Size: 0x6c
function function_d2403e6a( s_params )
{
    if ( s_params.smeansofdeath === "MOD_MELEE" || s_params.smeansofdeath === "MOD_IMPACT" && s_params.weapon.isriotshield )
    {
        self function_eaf6e39e();
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0xef4db543, Offset: 0x70a0
// Size: 0x5b2
function function_11001794()
{
    level endon( #"end_game" );
    var_50ed6de = ( 0, 90, 0 );
    self.var_f2e7f46a = 0;
    
    if ( zm_utility::is_trials() && self.str_reward == "self_revives" )
    {
        self.str_reward = "full_ammo";
    }
    
    str_reward = self.str_reward;
    
    switch ( str_reward )
    {
        case #"self_revives":
            self.var_f7d17867 = ( 0, 0, 0 );
            self.var_14172483 = var_50ed6de;
            self.var_3ff570f3 = #"p8_zm_gla_heart_zombie";
            a_e_players = getplayers();
            a_e_players[ 0 ] clientfield::set( "zm_orange_force_challenge_model", 1 );
            break;
        case #"full_ammo":
            self.var_f7d17867 = ( 0, 0, 6 );
            self.var_14172483 = var_50ed6de;
            self.var_3ff570f3 = "p7_zm_power_up_max_ammo";
            break;
        case #"fire_sale":
            self.var_f7d17867 = ( 0, 0, 6 );
            self.var_14172483 = var_50ed6de;
            self.var_3ff570f3 = "p7_zm_power_up_firesale";
            break;
        case #"insta_kill":
            self.var_f7d17867 = ( 0, 0, 12 );
            self.var_14172483 = var_50ed6de;
            self.var_3ff570f3 = "p7_zm_power_up_insta_kill";
            break;
        case #"hero_weapon_power":
            self.var_f7d17867 = ( 0, 0, 6 );
            self.var_14172483 = var_50ed6de;
            self.var_3ff570f3 = "p8_zm_powerup_full_power";
            break;
        case #"bonus_points_team":
            self.var_f7d17867 = ( 0, 0, 10 );
            self.var_14172483 = var_50ed6de;
            self.var_3ff570f3 = "zombie_z_money_icon";
            break;
        case #"carpenter":
            self.var_f7d17867 = ( 0, 0, 10 );
            self.var_14172483 = var_50ed6de;
            self.var_3ff570f3 = "p7_zm_power_up_carpenter";
            break;
        case #"extra_snowballs":
            self.var_f7d17867 = ( 0, 0, 10 );
            self.var_14172483 = var_50ed6de;
            self.var_3ff570f3 = "p8_zm_ora_snowball_power_up";
            break;
        case #"armor":
            self.var_f7d17867 = ( 0, 0, 10 );
            self.var_14172483 = var_50ed6de;
            self.var_3ff570f3 = "p8_zm_ora_challenge_armor_power_up";
            break;
        case #"half_price_traps":
            self.var_f7d17867 = ( 0, 0, 10 );
            self.var_14172483 = var_50ed6de;
            self.var_3ff570f3 = "p8_zm_ora_trap_power_up";
            break;
        case #"break_freeze_faster":
            self.var_f7d17867 = ( 0, 0, 10 );
            self.var_14172483 = var_50ed6de;
            self.var_3ff570f3 = "p8_zm_ora_ice_picker_power_up";
            break;
    }
    
    var_e18247ac = level.var_b42f4f4b.origin + self.var_f7d17867;
    v_spawn_angles = level.var_b42f4f4b.angles + self.var_14172483;
    
    if ( isdefined( self.var_f2e7f46a ) && self.var_f2e7f46a )
    {
        self.mdl_reward = zm_utility::spawn_buildkit_weapon_model( self.e_player, getweapon( self.str_reward ), undefined, var_e18247ac, v_spawn_angles );
        self.mdl_reward.str_weapon_name = self.str_reward;
        self.mdl_reward movez( 5, 1 );
    }
    else
    {
        self.mdl_reward = util::spawn_model( self.var_3ff570f3, var_e18247ac, v_spawn_angles );
        self.mdl_reward movez( 5, 1 );
        self.mdl_reward.var_c9837131 = 1;
        self.mdl_reward thread function_f5f83516();
        self.mdl_reward playsound( #"zmb_spawn_powerup" );
        self.mdl_reward playloopsound( #"zmb_spawn_powerup_loop" );
    }
    
    level.var_b42f4f4b.var_54cb6134 = 1;
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0x956b2419, Offset: 0x7660
// Size: 0x1a0
function function_f5f83516()
{
    self endon( #"death" );
    self thread powerup_wobble_fx();
    
    while ( isdefined( self ) )
    {
        waittime = randomfloatrange( 2.5, 5 );
        yaw = randomint( 360 );
        
        if ( yaw > 300 )
        {
            yaw = 300;
        }
        else if ( yaw < 60 )
        {
            yaw = 60;
        }
        
        yaw = self.angles[ 1 ] + yaw;
        new_angles = ( -60 + randomint( 120 ), yaw, -45 + randomint( 90 ) );
        self rotateto( new_angles, waittime, waittime * 0.5, waittime * 0.5 );
        
        if ( isdefined( self.worldgundw ) )
        {
            self.worldgundw rotateto( new_angles, waittime, waittime * 0.5, waittime * 0.5 );
        }
        
        wait randomfloat( waittime - 0.1 );
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0xa7abb262, Offset: 0x7808
// Size: 0xc4
function powerup_wobble_fx()
{
    self endon( #"death" );
    
    if ( !isdefined( self ) )
    {
        return;
    }
    
    if ( isdefined( self.var_c9837131 ) && self.var_c9837131 )
    {
        self clientfield::set( "powerup_fx", 1 );
        return;
    }
    
    if ( isdefined( self.var_8691c7d4 ) && self.var_8691c7d4 )
    {
        self clientfield::set( "powerup_fx", 4 );
        return;
    }
    
    self clientfield::set( "powerup_fx", 2 );
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0xf1b79181, Offset: 0x78d8
// Size: 0xe2
function function_9e87f32a()
{
    level endon( #"end_game" );
    self endon( #"hash_5d2057864469af2a", #"hash_4ac0558a94ba3fd7" );
    self thread function_b49b8fc6();
    
    while ( true )
    {
        s_waitresult = self waittill( #"trigger_activated" );
        e_who = s_waitresult.e_who;
        
        if ( zm_utility::can_use( e_who, 1 ) )
        {
            self function_816f228f( e_who );
            self notify( #"hash_5d2057864469af2a" );
        }
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0x935e3b8d, Offset: 0x79c8
// Size: 0xba
function function_98233b53()
{
    level endon( #"end_game" );
    self endon( #"hash_5d2057864469af2a" );
    
    while ( true )
    {
        s_waitresult = self waittill( #"trigger_activated" );
        e_who = s_waitresult.e_who;
        
        if ( zm_utility::can_use( e_who, 0 ) )
        {
            self function_816f228f( e_who );
            self notify( #"hash_5d2057864469af2a" );
        }
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0xe6be2f76, Offset: 0x7a90
// Size: 0x1b0
function function_b49b8fc6()
{
    self.e_player endon( #"disconnect", #"hash_5d2057864469af2a", #"hash_4ac0558a94ba3fd7" );
    self endon( #"hash_5d2057864469af2a", #"hash_4ac0558a94ba3fd7" );
    self.var_561f7ea3 = 0;
    mdl_reward = self.var_d6578e1f.mdl_reward;
    
    while ( true )
    {
        if ( isdefined( self.s_unitrigger.trigger ) && isdefined( self.var_54596501 ) && self.var_54596501 && isdefined( mdl_reward ) )
        {
            self.var_561f7ea3 = 0;
            
            if ( self.e_player util::is_looking_at( mdl_reward ) )
            {
                self.var_561f7ea3 = 1;
            }
            
            if ( self.e_player meleebuttonpressed() && self.var_561f7ea3 && self.e_player istouching( self.s_unitrigger.trigger ) )
            {
                self.var_54596501 = 0;
                
                if ( isdefined( mdl_reward ) )
                {
                    mdl_reward delete();
                    self.var_d6578e1f.mdl_reward = undefined;
                }
                
                self function_fd8a137e();
                self notify( #"hash_4ac0558a94ba3fd7" );
            }
        }
        
        waitframe( 1 );
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 1
// Checksum 0x686e2c4b, Offset: 0x7c48
// Size: 0x52c
function function_816f228f( e_who )
{
    level endon( #"end_game" );
    self.var_54cb6134 = 0;
    mdl_reward = self.var_d6578e1f.mdl_reward;
    str_reward = self.var_d6578e1f.str_reward;
    
    switch ( str_reward )
    {
        case #"self_revives":
            foreach ( e_player in getplayers() )
            {
                e_player zm_laststand::function_3a00302e();
            }
            
            a_e_players = getplayers();
            a_e_players[ 0 ] clientfield::set( "zm_orange_force_challenge_model", 0 );
            break;
        case #"carpenter":
        case #"full_ammo":
        case #"bonus_points_team":
        case #"fire_sale":
        case #"insta_kill":
            self.var_59bf6fe2 = 1;
            level [[ level._custom_powerups[ str_reward ].grab_powerup ]]( e_who );
            break;
        case #"hero_weapon_power":
            self.var_59bf6fe2 = 1;
            
            foreach ( e_player in getplayers() )
            {
                if ( !e_player util::is_spectating() )
                {
                    level [[ level._custom_powerups[ str_reward ].grab_powerup ]]( e_player );
                }
            }
            
            break;
        case #"extra_snowballs":
            level flag::set( #"extra_snowballs" );
            
            foreach ( e_player in getplayers() )
            {
                e_player thread function_f0c3ac7c();
            }
            
            break;
        case #"armor":
            foreach ( player in getplayers() )
            {
                if ( !player laststand::player_is_in_laststand() && isalive( player ) )
                {
                    player zm_armor::add( #"hash_35c87147e29f1708", 100, 100 );
                }
            }
            
            break;
        case #"half_price_traps":
            level flag::set( #"half_price_traps" );
            break;
        case #"break_freeze_faster":
            level flag::set( #"break_freeze_faster" );
            break;
    }
    
    self function_fd8a137e();
    e_who playsound( #"zmb_powerup_grabbed" );
    
    if ( isdefined( mdl_reward ) )
    {
        mdl_reward stoploopsound();
        mdl_reward delete();
        self.var_d6578e1f.mdl_reward = undefined;
    }
    
    if ( isdefined( self.var_59bf6fe2 ) && self.var_59bf6fe2 )
    {
        level zm_audio::sndannouncerplayvox( str_reward );
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 0
// Checksum 0xf84c5e15, Offset: 0x8180
// Size: 0x154
function function_f0c3ac7c()
{
    var_d49d10b0 = self zm_loadout::get_player_lethal_grenade();
    
    if ( isdefined( var_d49d10b0 ) && var_d49d10b0 == level.w_snowball )
    {
        self zm_weapons::weapon_give( level.w_snowball_upgraded, 1, 0 );
        n_slot = self gadgetgetslot( var_d49d10b0 );
        self gadgetpowerreset( n_slot, 0 );
        self thread zm_orange_snowball_piles::function_76e94d52();
        return;
    }
    
    if ( isdefined( var_d49d10b0 ) && var_d49d10b0 == level.w_snowball_yellow )
    {
        self zm_weapons::weapon_give( level.w_snowball_yellow_upgraded, 1, 0 );
        n_slot = self gadgetgetslot( var_d49d10b0 );
        self gadgetpowerreset( n_slot, 0 );
        self thread zm_orange_snowball_piles::function_76e94d52();
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 1
// Checksum 0xd69a45ce, Offset: 0x82e0
// Size: 0xec
function swap_weapon( w_reward )
{
    var_6822257f = self getweaponslist();
    
    foreach ( w_gun in var_6822257f )
    {
        if ( w_gun.rootweapon === w_reward )
        {
            self zm_weapons::function_7c5dd4bd( w_gun );
            return;
        }
    }
    
    if ( !self hasweapon( w_reward, 1 ) )
    {
        self function_e2a25377( w_reward );
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 1
// Checksum 0x18ca9da6, Offset: 0x83d8
// Size: 0x84
function function_e2a25377( w_reward )
{
    if ( self hasweapon( zm_weapons::get_base_weapon( w_reward ), 1 ) )
    {
        self takeweapon( zm_weapons::get_base_weapon( w_reward ), 1 );
    }
    
    self zm_weapons::weapon_give( w_reward, 1 );
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 1
// Checksum 0xe8fc0067, Offset: 0x8468
// Size: 0x172
function function_eaf6e39e( n_count = 1 )
{
    self.n_current_progress += n_count;
    
    if ( self.n_current_progress >= self.n_goal )
    {
        self.n_current_progress = self.n_goal;
    }
    
    self function_544b63c0( self.n_current_progress );
    
    if ( self.n_current_progress >= self.n_goal )
    {
        if ( math::cointoss( 50 ) )
        {
            a_e_players = array::randomize( getplayers() );
            
            foreach ( e_player in a_e_players )
            {
                if ( !e_player util::is_spectating() )
                {
                    e_player thread zm_orange_util::function_51b752a9( #"vox_generic_responses_positive" );
                    break;
                }
            }
        }
        
        self notify( self.str_notify );
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 3
// Checksum 0xc8b92b0a, Offset: 0x85e8
// Size: 0xf8
function function_bce7e59b( n_index, n_current_progress, n_goal )
{
    foreach ( e_player in getplayers() )
    {
        level zm_ui_inventory::function_7df6bb60( #"zm_orange_challenges_progress", n_current_progress, e_player );
        level zm_ui_inventory::function_7df6bb60( #"zm_orange_challenges_target", n_goal, e_player );
        level zm_ui_inventory::function_7df6bb60( #"zm_orange_challenges", n_index, e_player );
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 1, eflags: 0x4
// Checksum 0xb92e3b39, Offset: 0x86e8
// Size: 0xb8
function private function_544b63c0( n_progress )
{
    if ( n_progress > self.n_goal )
    {
        n_progress = self.n_goal;
    }
    
    foreach ( e_player in getplayers() )
    {
        level zm_ui_inventory::function_7df6bb60( #"zm_orange_challenges_progress", n_progress, e_player );
    }
}

// Namespace zm_orange_challenges/zm_orange_challenges
// Params 1
// Checksum 0xc6e86ff8, Offset: 0x87a8
// Size: 0x118
function function_fd8a137e( n_time = 0 )
{
    self notify( #"hash_b296fe3ccb7d273" );
    self endon( #"disconnect", #"hash_b296fe3ccb7d273" );
    
    if ( n_time > 0 )
    {
        wait n_time;
    }
    
    foreach ( e_player in getplayers() )
    {
        level zm_ui_inventory::function_7df6bb60( #"zm_orange_challenges", 0, e_player );
        level zm_ui_inventory::function_7df6bb60( #"zm_orange_challenges_progress", 0, e_player );
    }
}

/#

    // Namespace zm_orange_challenges/zm_orange_challenges
    // Params 0
    // Checksum 0xa1df1dbb, Offset: 0x88c8
    // Size: 0xa4, Type: dev
    function function_e4b04738()
    {
        if ( level flag::get( #"challenge_active" ) )
        {
            if ( isdefined( level.var_97a44fdd ) )
            {
                var_d6578e1f = level.var_97a44fdd.var_d6578e1f;
                var_d6578e1f.n_current_progress = var_d6578e1f.n_goal;
                var_d6578e1f function_544b63c0( var_d6578e1f.n_current_progress );
                var_d6578e1f notify( var_d6578e1f.str_notify );
            }
        }
    }

#/
