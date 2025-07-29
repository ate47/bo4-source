#using scripts\core_common\animation_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\killcam_shared;
#using scripts\core_common\player\player_shared;
#using scripts\core_common\renderoverridebundle;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\visionset_mgr_shared;
#using scripts\killstreaks\killstreak_detect;
#using scripts\mp_common\gametypes\display_transition;
#using scripts\mp_common\player\player;

#namespace globallogic;

// Namespace globallogic/globallogic
// Params 0, eflags: 0x2
// Checksum 0x62896ca3, Offset: 0x420
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"globallogic", &__init__, undefined, #"visionset_mgr" );
}

// Namespace globallogic/globallogic
// Params 0
// Checksum 0xa7ebff2d, Offset: 0x470
// Size: 0x9b4
function __init__()
{
    visionset_mgr::register_visionset_info( "mpintro", 1, 31, undefined, "mpintro" );
    visionset_mgr::register_visionset_info( "crithealth", 1, 25, undefined, "critical_health" );
    animation::add_notetrack_func( #"globallogic::play_plant_sound", &play_plant_sound );
    clientfield::register( "world", "game_ended", 1, 1, "int", &on_end_game, 1, 1 );
    clientfield::register( "world", "post_game", 1, 1, "int", &post_game, 1, 1 );
    registerclientfield( "playercorpse", "firefly_effect", 1, 2, "int", &firefly_effect_cb, 0 );
    registerclientfield( "playercorpse", "annihilate_effect", 1, 1, "int", &annihilate_effect_cb, 0 );
    registerclientfield( "playercorpse", "pineapplegun_effect", 1, 1, "int", &pineapplegun_effect_cb, 0 );
    registerclientfield( "actor", "annihilate_effect", 1, 1, "int", &annihilate_effect_cb, 0 );
    registerclientfield( "actor", "pineapplegun_effect", 1, 1, "int", &pineapplegun_effect_cb, 0 );
    clientfield::register( "worlduimodel", "hudItems.team1.roundsWon", 1, 4, "int", undefined, 0, 0 );
    clientfield::register( "worlduimodel", "hudItems.team1.livesCount", 1, 8, "int", undefined, 0, 0 );
    clientfield::register( "worlduimodel", "hudItems.team1.noRespawnsLeft", 1, 1, "int", undefined, 0, 0 );
    clientfield::register( "worlduimodel", "hudItems.team2.roundsWon", 1, 4, "int", undefined, 0, 0 );
    clientfield::register( "worlduimodel", "hudItems.team2.livesCount", 1, 8, "int", undefined, 0, 0 );
    clientfield::register( "worlduimodel", "hudItems.team2.noRespawnsLeft", 1, 1, "int", undefined, 0, 0 );
    clientfield::register( "worlduimodel", "hudItems.specialistSwitchIsLethal", 1, 1, "int", undefined, 0, 0 );
    clientfield::register( "clientuimodel", "hudItems.armorIsOnCooldown", 1, 1, "int", undefined, 0, 0 );
    clientfield::register( "clientuimodel", "hudItems.hideOutcomeUI", 1, 1, "int", undefined, 0, 0 );
    clientfield::register( "clientuimodel", "hudItems.captureCrateState", 1, 2, "int", undefined, 0, 0 );
    clientfield::register( "clientuimodel", "hudItems.captureCrateTotalTime", 1, 13, "int", undefined, 0, 0 );
    clientfield::register( "clientuimodel", "hudItems.playerLivesCount", 1, 8, "int", undefined, 0, 0 );
    clientfield::register( "clientuimodel", "huditems.killedByEntNum", 1, 4, "int", undefined, 0, 0 );
    clientfield::register( "clientuimodel", "huditems.killedByAttachmentCount", 1, 4, "int", undefined, 0, 0 );
    clientfield::register( "clientuimodel", "huditems.killedByItemIndex", 1, 10, "int", undefined, 0, 0 );
    clientfield::register( "clientuimodel", "huditems.killedByMOD", 1, 8, "int", undefined, 0, 0 );
    
    for ( index = 0; index < 5 ; index++ )
    {
        clientfield::register( "clientuimodel", "huditems.killedByAttachment" + index, 1, 6, "int", undefined, 0, 0 );
    }
    
    clientfield::register( "toplayer", "thermal_sight", 1, 1, "int", &function_765b7c63, 0, 0 );
    clientfield::register( "toplayer", "strobe_light", 1, 1, "int", &fireflykillcam, 0, 0 );
    clientfield::register( "allplayers", "cold_blooded", 1, 1, "int", &function_194072a7, 0, 0 );
    level.var_20369084 = #"rob_sonar_set_enemy_cold";
    level._effect[ #"annihilate_explosion" ] = #"hash_17591c79f2960fba";
    level._effect[ #"pineapplegun_explosion" ] = #"hash_84cd1f227fcd07e";
    level.gameended = 0;
    level.postgame = 0;
    level.new_health_model = getdvarint( #"new_health_model", 1 ) > 0;
    
    if ( sessionmodeismultiplayergame() )
    {
        level.var_90bb9821 = getgametypesetting( #"specialistmaxhealth_allies_1" ) - 150;
    }
    else
    {
        level.var_90bb9821 = getgametypesetting( #"playermaxhealth" ) - 150;
    }
    
    setdvar( #"bg_boastenabled", getgametypesetting( #"boastenabled" ) );
    boastallowcam = getgametypesetting( #"boastallowcam" );
    setdvar( #"hash_23c5d7207ebc0bf9", boastallowcam );
    setdvar( #"hash_62833d3c5e6d7380", boastallowcam );
    setdvar( #"hash_e099986c072eb0f", getgametypesetting( #"hash_104f124f56f0f20a" ) );
    setdvar( #"hash_553ad8f9db24bf22", int( 1000 * getgametypesetting( #"hash_1614b9cbe0df6f75" ) ) );
    callback::on_spawned( &on_player_spawned );
    display_transition::init_shared();
}

// Namespace globallogic/globallogic
// Params 1
// Checksum 0x952d2208, Offset: 0xe30
// Size: 0x24
function on_player_spawned( localclientnum )
{
    self function_36b630a3( 1 );
}

// Namespace globallogic/globallogic
// Params 7
// Checksum 0x9dec24f0, Offset: 0xe60
// Size: 0x9e
function on_end_game( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( newval && !level.gameended )
    {
        callback::callback( #"on_end_game", localclientnum );
        level notify( #"game_ended" );
        level.gameended = 1;
    }
}

// Namespace globallogic/globallogic
// Params 7
// Checksum 0x2b8875f3, Offset: 0xf08
// Size: 0x76
function post_game( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( newval && !level.postgame )
    {
        level notify( #"post_game" );
        level.postgame = 1;
    }
}

// Namespace globallogic/globallogic
// Params 7
// Checksum 0xe982c04d, Offset: 0xf88
// Size: 0x4e
function firefly_effect_cb( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( bnewent && newval )
    {
    }
}

// Namespace globallogic/globallogic
// Params 7
// Checksum 0x30942922, Offset: 0xfe0
// Size: 0x19c
function annihilate_effect_cb( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( newval && !oldval )
    {
        where = self gettagorigin( "J_SpineLower" );
        
        if ( !isdefined( where ) )
        {
            where = self.origin;
        }
        
        where += ( 0, 0, -40 );
        character_index = self getcharacterbodytype();
        fields = getcharacterfields( character_index, currentsessionmode() );
        
        if ( isdefined( fields ) && isdefined( fields.fullbodyexplosion ) && fields.fullbodyexplosion !== "" )
        {
            if ( util::is_mature() && !util::is_gib_restricted_build() )
            {
                playfx( localclientnum, fields.fullbodyexplosion, where );
            }
            
            playfx( localclientnum, "explosions/fx8_exp_grenade_default", where );
        }
    }
}

// Namespace globallogic/globallogic
// Params 7
// Checksum 0x58ea96, Offset: 0x1188
// Size: 0xdc
function pineapplegun_effect_cb( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( newval && !oldval )
    {
        where = self gettagorigin( "J_SpineLower" );
        
        if ( !isdefined( where ) )
        {
            where = self.origin;
        }
        
        if ( isdefined( level._effect[ #"pineapplegun_explosion" ] ) )
        {
            playfx( localclientnum, level._effect[ #"pineapplegun_explosion" ], where );
        }
    }
}

// Namespace globallogic/globallogic
// Params 2
// Checksum 0xf468556, Offset: 0x1270
// Size: 0x8c
function play_plant_sound( param1, param2 )
{
    if ( function_1e6822f( self, "No Plant Sounds" ) )
    {
        return;
    }
    
    tagpos = self gettagorigin( "j_ring_ri_2" );
    self playsound( self.localclientnum, #"fly_bomb_buttons_npc", tagpos );
}

// Namespace globallogic/globallogic
// Params 2
// Checksum 0xd079dc7d, Offset: 0x1308
// Size: 0xdc
function updateenemyequipment( local_client_num, newval )
{
    if ( isdefined( level.var_58253868 ) )
    {
        self renderoverridebundle::function_c8d97b8e( local_client_num, #"friendly", #"hash_66ac79c57723c169" );
    }
    
    if ( isdefined( level.var_420d7d7e ) )
    {
        self renderoverridebundle::function_c8d97b8e( local_client_num, #"enemy", #"hash_691f7dc47ae8aa08" );
    }
    
    self renderoverridebundle::function_c8d97b8e( local_client_num, #"friendly", #"hash_ebb37dab2ee0ae3" );
}

// Namespace globallogic/globallogic
// Params 2
// Checksum 0x441c5d63, Offset: 0x13f0
// Size: 0x2c
function function_116b413e( local_client_num, newval )
{
    self killstreak_detect::function_d859c344( local_client_num, newval );
}

// Namespace globallogic/globallogic
// Params 7
// Checksum 0x81ea2e4b, Offset: 0x1428
// Size: 0x27c
function function_765b7c63( local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( newval )
    {
        if ( !( isdefined( self.var_33b61b6f ) && self.var_33b61b6f ) )
        {
            self.var_8e7f416f = self playloopsound( #"hash_a93a3bf58dbd89d" );
            self.var_33b61b6f = 1;
        }
    }
    else if ( isdefined( self.var_33b61b6f ) && self.var_33b61b6f )
    {
        self stoploopsound( self.var_8e7f416f );
        self.var_33b61b6f = 0;
    }
    
    level notify( #"thermal_toggle" );
    players = getplayers( local_client_num );
    
    foreach ( player in players )
    {
        if ( util::function_fbce7263( player.team, self.team ) && player hasperk( local_client_num, #"specialty_immunenvthermal" ) )
        {
            player function_194072a7( local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump );
        }
    }
    
    util::clean_deleted( level.enemyequip );
    array::thread_all( level.enemyequip, &updateenemyequipment, local_client_num, newval );
    util::clean_deleted( level.enemyvehicles );
    array::thread_all( level.enemyvehicles, &function_116b413e, local_client_num, newval );
}

// Namespace globallogic/globallogic
// Params 7
// Checksum 0xa495db5f, Offset: 0x16b0
// Size: 0xcc
function fireflykillcam( local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( function_1cbf351b( local_client_num ) )
    {
        return;
    }
    
    if ( newval && !self hastalent( local_client_num, #"talent_resistance" ) )
    {
        self function_36b630a3( 0 );
        return;
    }
    
    self function_36b630a3( 1 );
}

// Namespace globallogic/globallogic
// Params 7
// Checksum 0xb75a9a37, Offset: 0x1788
// Size: 0x6c
function function_194072a7( local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( !function_9d295a8c( local_client_num ) )
    {
        self player::function_f22aa227( local_client_num );
    }
}

