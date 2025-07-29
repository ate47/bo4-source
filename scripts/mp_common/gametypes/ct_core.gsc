#using scripts\abilities\ability_util;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\lui_shared;
#using scripts\core_common\player\player_loadout;
#using scripts\core_common\player\player_role;
#using scripts\core_common\potm_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\values_shared;
#using scripts\mp_common\gametypes\ct_bots;
#using scripts\mp_common\gametypes\ct_difficulty;
#using scripts\mp_common\gametypes\ct_tutorial_skirmish;
#using scripts\mp_common\gametypes\ct_ui;
#using scripts\mp_common\gametypes\ct_utils;
#using scripts\mp_common\gametypes\globallogic;
#using scripts\mp_common\player\player_loadout;
#using scripts\mp_common\util;

#namespace ct_core;

// Namespace ct_core/ct_core
// Params 0
// Checksum 0x602bdfba, Offset: 0x2d0
// Size: 0x384
function function_46e95cc7()
{
    level.var_e7c95d09 = 1;
    level.givecustomloadout = &function_1dd43d36;
    level.var_7b05c4b5 = 1;
    level.var_9f011465 = 1;
    level.var_e3049e92 = 0;
    level.var_903e2252 = 1;
    level.var_87bcb1b = 0;
    level.var_827f5a28 = 1;
    level.skipgameend = 1;
    level.var_d0c7d280 = 0;
    level.var_e72728b8 = [];
    setgametypesetting( #"disableweapondrop", 1 );
    level.disableweapondrop = 1;
    callback::add_callback( #"on_player_killed", &function_1ca625ba );
    callback::add_callback( #"on_end_game", &on_end_game );
    globallogic::init();
    util::registerroundswitch( 0, 9 );
    util::registertimelimit( 0, 1440 );
    util::registerscorelimit( 0, 50000 );
    util::registerroundlimit( 0, 10 );
    util::registerroundwinlimit( 0, 10 );
    util::registernumlives( 0, 100 );
    setdvar( #"com_pausesupported", 1 );
    setdvar( #"custom_killstreak_mode", 0 );
    setdvar( #"hash_48162cd174e3034d", 1 );
    setdvar( #"scr_scorestreaks", 0 );
    setdvar( #"bot_maxfree", 0 );
    setdvar( #"bot_maxallies", 0 );
    setdvar( #"bot_maxaxis", 0 );
    level.usingscorestreaks = 0;
    level.disablescoreevents = 1;
    level.disablemomentum = 1;
    level.overrideteamscore = 1;
    level.forceusekillstreak = 1;
    level.forcedplayerteam = #"allies";
    ct_difficulty::function_be562a72();
    level.var_edd52efc = &function_edd52efc;
    level thread function_6a1d53f3();
}

// Namespace ct_core/ct_core
// Params 1
// Checksum 0x92babff1, Offset: 0x660
// Size: 0x836
function function_1dd43d36( spawn_weapon )
{
    player = self;
    
    if ( player.var_560765bb === player.spawntime )
    {
        return player.spawnweapon;
    }
    
    player loadout::init_player( 1 );
    player loadout::function_c67222df();
    player loadout::give_perks();
    
    if ( !isdefined( player.var_de9764de ) )
    {
        player.var_de9764de = [];
    }
    
    player setplayerrenderoptions( 0 );
    var_e6b5e0d7 = getdvar( #"hash_3fb2952874e511c2" );
    hands_weapon = ct_utils::function_84adcd1f();
    s_weaponprimary = getdvar( #"hash_4b0035c0038e0762" );
    
    if ( isdefined( s_weaponprimary ) )
    {
        attachments = [];
        
        for ( i = 0; i < 6 ; i++ )
        {
            if ( !isdefined( attachments ) )
            {
                attachments = [];
            }
            else if ( !isarray( attachments ) )
            {
                attachments = array( attachments );
            }
            
            if ( !isinarray( attachments, getdvar( #"hash_721ee06404866532" + i ) ) )
            {
                attachments[ attachments.size ] = getdvar( #"hash_721ee06404866532" + i );
            }
        }
        
        arrayremovevalue( attachments, #"" );
        primary_weapon = getweapon( s_weaponprimary, attachments );
        stashweapon = getdvarint( #"hash_48162cd174e3034d", 0 ) || isdefined( spawn_weapon );
        
        if ( stashweapon )
        {
            if ( !isdefined( player.var_de9764de ) )
            {
                player.var_de9764de = [];
            }
            else if ( !isarray( player.var_de9764de ) )
            {
                player.var_de9764de = array( player.var_de9764de );
            }
            
            if ( !isinarray( player.var_de9764de, primary_weapon ) )
            {
                player.var_de9764de[ player.var_de9764de.size ] = primary_weapon;
            }
            
            if ( !isdefined( spawn_weapon ) )
            {
                spawn_weapon = hands_weapon;
            }
        }
        else
        {
            spawn_weapon = primary_weapon;
        }
    }
    else if ( !isdefined( spawn_weapon ) )
    {
        primary_weapon = getweapon( #"ar_accurate_t8" );
        
        if ( !isdefined( player.var_de9764de ) )
        {
            player.var_de9764de = [];
        }
        else if ( !isarray( player.var_de9764de ) )
        {
            player.var_de9764de = array( player.var_de9764de );
        }
        
        if ( !isinarray( player.var_de9764de, primary_weapon ) )
        {
            player.var_de9764de[ player.var_de9764de.size ] = primary_weapon;
        }
        
        spawn_weapon = hands_weapon;
    }
    
    player giveweapon( spawn_weapon );
    player loadout::function_442539( "primary", spawn_weapon );
    var_670cba7 = getdvar( #"hash_6dcfed2e90bdae6e" );
    
    if ( isdefined( var_670cba7 ) )
    {
        attachments = [];
        
        for ( i = 0; i < 6 ; i++ )
        {
            if ( !isdefined( attachments ) )
            {
                attachments = [];
            }
            else if ( !isarray( attachments ) )
            {
                attachments = array( attachments );
            }
            
            if ( !isinarray( attachments, getdvar( #"hash_c7f896e4dff882e" + i ) ) )
            {
                attachments[ attachments.size ] = getdvar( #"hash_c7f896e4dff882e" + i );
            }
        }
        
        arrayremovevalue( attachments, #"" );
        secondary_weapon = getweapon( var_670cba7, attachments );
        
        if ( getdvarint( #"hash_48162cd174e3034d", 0 ) )
        {
            if ( !isdefined( player.var_de9764de ) )
            {
                player.var_de9764de = [];
            }
            else if ( !isarray( player.var_de9764de ) )
            {
                player.var_de9764de = array( player.var_de9764de );
            }
            
            if ( !isinarray( player.var_de9764de, secondary_weapon ) )
            {
                player.var_de9764de[ player.var_de9764de.size ] = secondary_weapon;
            }
        }
        else
        {
            player giveweapon( secondary_weapon );
            player loadout::function_442539( "secondary", secondary_weapon );
        }
    }
    
    if ( isdefined( player.playerrole ) )
    {
        primaryoffhand = getweapon( player.playerrole.primaryequipment );
        player giveweapon( primaryoffhand );
        player loadout::function_442539( "primarygrenade", primaryoffhand );
        player loadout::function_c3448ab0( "specialgrenade", undefined, 1 );
        specialoffhand = getweapon( player.playerrole.var_c21d61e9 );
        player giveweapon( specialoffhand );
        player loadout::function_442539( "herogadget", specialoffhand );
    }
    
    player loadout::function_d98a8122( spawn_weapon );
    player.health = 150;
    player.maxhealth = 150;
    player.var_66cb03ad = 150;
    player loadout::function_da96d067();
    player.var_560765bb = player.spawntime;
    return spawn_weapon;
}

// Namespace ct_core/ct_core
// Params 0
// Checksum 0x7fbed88e, Offset: 0xea0
// Size: 0x1e
function function_1ca625ba()
{
    entity = self;
    entity.var_560765bb = undefined;
}

// Namespace ct_core/ct_core
// Params 0
// Checksum 0x5ae1b5c9, Offset: 0xec8
// Size: 0x48
function function_6a1d53f3()
{
    level waittill( #"game_ended" );
    level notify( #"combattraining_logic_finished", { #success:0 } );
}

// Namespace ct_core/ct_core
// Params 0
// Checksum 0x674950c0, Offset: 0xf18
// Size: 0x80
function function_edd52efc()
{
    assert( player_role::is_valid( level.select_character ) );
    
    if ( player_role::is_valid( level.select_character ) )
    {
        self player_role::set( level.select_character );
    }
    
    level notify( #"custom_draft_completed" );
}

// Namespace ct_core/ct_core
// Params 0
// Checksum 0x3c5cb1, Offset: 0xfa0
// Size: 0x1e4
function function_fa03fc55()
{
    clientfield::register( "allplayers", "enemy_on_radar", 1, 1, "int" );
    clientfield::register( "actor", "enemy_on_radar", 1, 1, "int" );
    clientfield::register( "allplayers", "player_keyline_render", 1, 1, "int" );
    clientfield::register( "allplayers", "enemy_keyline_render", 1, 1, "int" );
    clientfield::register( "scriptmover", "enemyobj_keyline_render", 1, 1, "int" );
    clientfield::register( "actor", "actor_keyline_render", 1, 1, "int" );
    clientfield::register( "vehicle", "enemy_vehicle_keyline_render", 1, 1, "int" );
    clientfield::register( "allplayers", "set_vip", 1, 2, "int" );
    clientfield::register( "scriptmover", "animate_spawn_beacon", 1, 1, "int" );
    clientfield::register( "scriptmover", "objective_glow", 1, 1, "int" );
}

// Namespace ct_core/ct_core
// Params 0
// Checksum 0xd730e8f8, Offset: 0x1190
// Size: 0x58
function function_d2845186()
{
    level endon( #"hash_699329b4df616aed" );
    level waittill( #"hash_4c62fe02843b1a98" );
    
    if ( isdefined( level.var_e92a00d3 ) )
    {
        self [[ level.var_e92a00d3 ]]();
    }
}

// Namespace ct_core/ct_core
// Params 0
// Checksum 0xd39db629, Offset: 0x11f0
// Size: 0xce
function function_1aeaebae()
{
    level.allowspecialistdialog = 0;
    e_player = getplayers( #"allies" )[ 0 ];
    
    while ( !isdefined( e_player ) )
    {
        e_player = getplayers( #"allies" )[ 0 ];
        waitframe( 1 );
    }
    
    e_player endon( #"death" );
    e_player thread ct_ui::function_6889bb61( 0 );
    level waittill( #"hash_3779df13251ba6f7" );
    return level.ctdifficulty;
}

// Namespace ct_core/ct_core
// Params 1
// Checksum 0x28ec28f5, Offset: 0x12c8
// Size: 0x130
function function_f8f94589( gamedifficulty )
{
    level flag::set( "combat_training_started" );
    
    if ( isdefined( level.var_49240db3 ) )
    {
        level thread [[ level.var_49240db3 ]]( gamedifficulty );
    }
    
    waitresult = level waittill( #"combattraining_logic_finished" );
    level flag::clear( "combat_training_started" );
    e_player = ct_utils::get_player();
    
    if ( isdefined( e_player ) && isdefined( e_player.var_560765bb ) )
    {
        e_player on_end_game( undefined );
    }
    
    recordgameresult( #"draw" );
    globallogic::updateandfinalizematchrecord();
    level notify( #"hash_699329b4df616aed" );
}

// Namespace ct_core/ct_core
// Params 0
// Checksum 0x652791f5, Offset: 0x1400
// Size: 0x524
function function_1e84c767()
{
    level waittill( #"custom_draft_completed", #"draft_complete" );
    level.usingmomentum = 0;
    level.var_90bb9821 = 0;
    setdvar( #"scr_disablechallenges", 1 );
    level flag::init( "bot_init_complete" );
    level thread ct_bots::function_fa0d912f( 17 );
    
    if ( isdefined( level.var_4c2ecc6f ) )
    {
        level thread [[ level.var_4c2ecc6f ]]();
    }
    
    ct_utils::function_1edf99df();
    function_9a022fbc( "open" );
    player = getplayers()[ 0 ];
    var_60786cb4 = 0;
    
    if ( util::function_8570168d() )
    {
        while ( true )
        {
            waitresult = player waittill( #"menuresponse" );
            menu = waitresult.menu;
            response = waitresult.response;
            intval = waitresult.intpayload;
            
            if ( response == "isIntroTutorialMovie" )
            {
                var_60786cb4 = intval == 1;
                break;
            }
        }
    }
    
    while ( isloadingcinematicplaying() )
    {
        waitframe( 1 );
    }
    
    if ( var_60786cb4 )
    {
        waitframe( 1 );
        function_e9b83be8();
    }
    
    function_9a022fbc( "close" );
    
    /#
        level.var_63c19b1b = getdvarint( #"hash_6c85efe41dc0fd26", 0 ) == 1;
    #/
    
    if ( !( isdefined( level.var_63c19b1b ) && level.var_63c19b1b ) )
    {
        gamedifficulty = function_1aeaebae();
        level thread function_f8f94589( gamedifficulty );
        
        if ( player function_c2c1d36b( player function_76785843() ) == #"not_started" )
        {
            player function_3b91934f( player function_76785843(), #"tutorial_started" );
            player function_ea859fe2();
        }
        
        s_result = level waittill( #"combattraining_logic_finished" );
        b_completed = s_result.success;
        level waittill( #"hash_699329b4df616aed" );
    }
    else
    {
        b_completed = 1;
    }
    
    if ( util::function_8570168d() && b_completed )
    {
        str_state = player function_c2c1d36b( player function_76785843() );
        
        if ( str_state == #"skirmish_completed" )
        {
            player thread ct_tutorial_skirmish::function_b4ebcd8a();
            player function_ea859fe2();
            function_588a84ce();
            thread globallogic::end_round( 9 );
            return;
        }
        
        if ( str_state == #"tutorial_started" || str_state == #"tutorial_completed" )
        {
            player function_3b91934f( player function_76785843(), #"tutorial_completed" );
            player function_ea859fe2();
            waitframe( 1 );
            player thread ct_tutorial_skirmish::function_b4ebcd8a();
            function_588a84ce();
            ct_tutorial_skirmish::function_5e1029a();
        }
    }
}

// Namespace ct_core/ct_core
// Params 1
// Checksum 0x97b38fc4, Offset: 0x1930
// Size: 0x2c0
function function_a217c7b4( b_success )
{
    if ( isdefined( level.var_8b9d690e ) )
    {
        var_cd803a6b = level thread [[ level.var_8b9d690e ]]( b_success );
    }
    
    level thread ct_bots::deactivate_bots();
    axis = getaiteamarray( #"axis" );
    
    foreach ( entity in axis )
    {
        entity delete();
    }
    
    if ( b_success && true && isdefined( level.var_38c87b5 ) && level.var_38c87b5 )
    {
        wait 2;
        e_player = getplayers( #"allies" )[ 0 ];
        e_player val::set( #"potm", "freezecontrols", 1 );
        println( "<dev string:x38>" );
        println( "<dev string:x57>" );
        level potm::function_b6a5e7fa();
        println( "<dev string:x83>" );
        e_player = getplayers( #"allies" )[ 0 ];
        e_player val::reset( #"potm", "freezecontrols" );
        wait 0.3;
    }
    
    e_player = getplayers( #"allies" )[ 0 ];
    e_player ct_ui::function_fa910e34( b_success, var_cd803a6b );
    level notify( #"hash_6731a3e5cccf7357" );
    level notify( #"hash_42057c28bd084d77" );
}

// Namespace ct_core/ct_core
// Params 0
// Checksum 0xafb94e12, Offset: 0x1bf8
// Size: 0x64
function function_45a4f027()
{
    function_c7c103cd( #"allies", #"invalid" );
    function_c7c103cd( #"axis", #"invalid" );
}

// Namespace ct_core/ct_core
// Params 1
// Checksum 0xab4cdd7f, Offset: 0x1c68
// Size: 0xbc
function on_end_game( params )
{
    ct_utils::function_64f9f527();
    ct_utils::cleanup_globals();
    e_player = ct_utils::get_player();
    
    if ( isdefined( e_player ) )
    {
        e_player.var_560765bb = undefined;
    }
    
    callback::remove_callback( #"on_player_killed", &function_1ca625ba );
    callback::remove_callback( #"on_end_game", &on_end_game );
}

// Namespace ct_core/ct_core
// Params 1, eflags: 0x4
// Checksum 0x31d61c05, Offset: 0x1d30
// Size: 0x70, Type: bool
function private function_a1fb023a( ismaturecontent )
{
    e_player = ct_utils::get_player();
    
    if ( isdefined( e_player ) )
    {
        var_1e77bf82 = ismature( e_player );
    }
    
    return isdefined( ismaturecontent ) && ismaturecontent || isdefined( var_1e77bf82 ) && var_1e77bf82;
}

// Namespace ct_core/ct_core
// Params 1, eflags: 0x4
// Checksum 0xdb3137b, Offset: 0x1da8
// Size: 0xc4
function private function_95e72b33( moviefile )
{
    self notify( #"hash_76ffabe3ed35bd68" );
    self val::set( #"hash_61f16f3175b9a96f", "freezecontrols", 1 );
    self thread lui::play_movie( hash( moviefile ), "fullscreen", 1, 0, 1 );
    level waittill( #"movie_done" );
    self val::reset( #"hash_61f16f3175b9a96f", "freezecontrols" );
}

// Namespace ct_core/ct_core
// Params 0
// Checksum 0xa20938c4, Offset: 0x1e78
// Size: 0x114
function function_e9b83be8()
{
    assert( isdefined( level.select_character ), "<dev string:xa7>" );
    fields = getcharacterfields( level.select_character, currentsessionmode() );
    
    if ( isdefined( fields ) && isdefined( fields.intromovie ) && function_a1fb023a( fields.var_5331abe0 ) )
    {
        e_player = getplayers( #"allies" )[ 0 ];
        
        if ( isdefined( e_player ) && isplayer( e_player ) )
        {
            e_player function_95e72b33( fields.intromovie );
        }
    }
}

// Namespace ct_core/ct_core
// Params 0
// Checksum 0xea7e6158, Offset: 0x1f98
// Size: 0x114
function function_588a84ce()
{
    assert( isdefined( level.select_character ), "<dev string:xa7>" );
    fields = getcharacterfields( level.select_character, currentsessionmode() );
    
    if ( isdefined( fields ) && isdefined( fields.var_55f31ab6 ) && function_a1fb023a( fields.var_148d6d91 ) )
    {
        e_player = getplayers( #"allies" )[ 0 ];
        
        if ( isdefined( e_player ) && isplayer( e_player ) )
        {
            e_player function_95e72b33( fields.var_55f31ab6 );
        }
    }
}

// Namespace ct_core/ct_core
// Params 1
// Checksum 0xff7db201, Offset: 0x20b8
// Size: 0xfc
function function_9a022fbc( str_state )
{
    player = getplayers()[ 0 ];
    lui_menu = lui::get_luimenu( "FullScreenBlack" );
    
    if ( str_state == "open" )
    {
        if ( isdefined( lui_menu ) )
        {
            [[ lui_menu ]]->open( player );
            [[ lui_menu ]]->set_startalpha( player, 1 );
            [[ lui_menu ]]->set_endalpha( player, 1 );
            [[ lui_menu ]]->set_fadeovertime( player, int( 2000 ) );
        }
        
        return;
    }
    
    if ( isdefined( lui_menu ) )
    {
        [[ lui_menu ]]->close( player );
    }
}

