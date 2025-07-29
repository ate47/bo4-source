#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\array_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\music_shared;
#using scripts\core_common\spawner_shared;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;
#using scripts\core_common\values_shared;
#using scripts\zm\zm_hms_util;
#using scripts\zm\zm_orange_challenges;
#using scripts\zm\zm_orange_lighthouse;
#using scripts\zm\zm_orange_mq_hell;
#using scripts\zm\zm_orange_pablo;
#using scripts\zm\zm_orange_pap;
#using scripts\zm\zm_orange_util;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_pack_a_punch;
#using scripts\zm_common\zm_round_spawning;
#using scripts\zm_common\zm_sq;
#using scripts\zm_common\zm_sq_modules;
#using scripts\zm_common\zm_ui_inventory;
#using scripts\zm_common\zm_unitrigger;
#using scripts\zm_common\zm_utility;

#namespace namespace_4b68b2b3;

// Namespace namespace_4b68b2b3/namespace_4b68b2b3
// Params 0
// Checksum 0x8817b212, Offset: 0x280
// Size: 0x214
function preload()
{
    zm_sq_modules::function_d8383812( #"sc_pap_beach", 24000, "sc_pap_beach", &is_soul_capture, &soul_captured, 1 );
    zm_sq_modules::function_d8383812( #"sc_pap_boathouse", 24000, "sc_pap_boathouse", &is_soul_capture, &soul_captured, 1 );
    zm_sq_modules::function_d8383812( #"sc_pap_ship", 24000, "sc_pap_ship", &is_soul_capture, &soul_captured, 1 );
    zm_sq_modules::function_d8383812( #"sc_pap_lagoon", 24000, "sc_pap_lagoon", &is_soul_capture, &soul_captured, 1 );
    zm_sq_modules::function_d8383812( #"sc_pap_island", 24000, "sc_pap_island", &is_soul_capture, &soul_captured, 1 );
    clientfield::register( "scriptmover", "" + #"hash_411947cf11cffb69", 24000, 1, "int" );
    clientfield::register( "scriptmover", "" + #"hash_249c83f6060ea7ba", 24000, 1, "int" );
}

// Namespace namespace_4b68b2b3/namespace_4b68b2b3
// Params 0
// Checksum 0x7b82be4d, Offset: 0x4a0
// Size: 0x1f0
function main()
{
    level flag::init( #"hash_7b6c32b9937aee62" );
    level flag::init( #"hash_11d64d1f93c196cc" );
    level flag::init( #"hash_4898001eb77cb16f" );
    level flag::init( #"hash_5266a594b96823e2" );
    level flag::init( #"hash_1d9afa9be4c10160" );
    a_e_blockers = getentarray( "lockdown_lighthouse", "targetname" );
    
    foreach ( e_blocker in a_e_blockers )
    {
        e_blocker notsolid();
    }
    
    level.var_d7374603 = 0;
    level.var_3089454f = getentarray( "mq_pap_vessel", "targetname" );
    
    foreach ( e_vessel in level.var_3089454f )
    {
        e_vessel hide();
    }
}

// Namespace namespace_4b68b2b3/namespace_4b68b2b3
// Params 1
// Checksum 0x63068be5, Offset: 0x698
// Size: 0xc4
function function_1faf4b9( var_5ea5c94d )
{
    if ( !var_5ea5c94d )
    {
        zm_orange_pablo::register_drop_off( 15, #"hash_59c4b1052b566fa1", #"hash_28356be4df0c611f", &function_9af4e8bd );
        level.pablo_npc.var_cb3ed98f[ 15 ].b_all_players = 1;
        zm_orange_pablo::function_d83490c5( 15 );
        level flag::wait_till( #"hash_7b6c32b9937aee62" );
        defend_event();
    }
}

// Namespace namespace_4b68b2b3/namespace_4b68b2b3
// Params 2
// Checksum 0x46779d03, Offset: 0x768
// Size: 0x5c
function function_a8748143( var_5ea5c94d, ended_early )
{
    if ( var_5ea5c94d || ended_early )
    {
        pap_charging();
        level flag::set( #"hash_11d64d1f93c196cc" );
    }
}

// Namespace namespace_4b68b2b3/namespace_4b68b2b3
// Params 1
// Checksum 0xab0f5917, Offset: 0x7d0
// Size: 0x6c
function function_91fbb734( var_5ea5c94d )
{
    zm_ui_inventory::function_7df6bb60( #"zm_orange_objective_progress", 6 );
    
    if ( !var_5ea5c94d )
    {
        level waittill( #"hash_5266a594b96823e2" );
        level waittill( #"hash_11d64d1f93c196cc" );
    }
}

// Namespace namespace_4b68b2b3/namespace_4b68b2b3
// Params 2
// Checksum 0x71efdf3f, Offset: 0x848
// Size: 0xa4
function function_c2898bf0( var_5ea5c94d, ended_early )
{
    if ( var_5ea5c94d || ended_early )
    {
        level flag::set( #"hash_4898001eb77cb16f" );
        level flag::set( #"hash_5266a594b96823e2" );
        level flag::set( #"hash_11d64d1f93c196cc" );
    }
    
    level flag::set( #"hash_5266a594b96823e2" );
}

// Namespace namespace_4b68b2b3/namespace_4b68b2b3
// Params 1
// Checksum 0x59e9708d, Offset: 0x8f8
// Size: 0x22c
function function_816c3132( var_5ea5c94d )
{
    zm_ui_inventory::function_7df6bb60( #"zm_orange_objective_progress", 9 );
    
    if ( !var_5ea5c94d )
    {
        if ( !isdefined( level.var_4d8e32c8 ) )
        {
            level.var_4d8e32c8 = [];
        }
        else if ( !isarray( level.var_4d8e32c8 ) )
        {
            level.var_4d8e32c8 = array( level.var_4d8e32c8 );
        }
        
        level.var_4d8e32c8[ level.var_4d8e32c8.size ] = level.var_9d121dce;
        level flag::clear( #"hash_5266a594b96823e2" );
        
        while ( level.var_98138d6b < 3 )
        {
            wait 1;
        }
        
        level flag::set( #"hash_3028604821838259" );
        level flag::set( #"hash_1d9afa9be4c10160" );
        level thread zm_orange_pap::function_56db9cdc();
        level.var_1c53964e thread zm_hms_util::function_6a0d675d( #"hash_17b44ac72ae4b92f", -1, 0, 1 );
        level thread function_8c273b51();
        
        while ( !zm_hms_util::any_player_in_zone( array( "ice_floe" ) ) )
        {
            waitframe( 1 );
        }
        
        level.var_b2b15659 = 1;
        zm_orange_util::function_fd24e47f( #"hash_56bc0447e6f4c9bf", -1, 1, 1 );
        level waittill( #"hash_5266a594b96823e2" );
    }
}

// Namespace namespace_4b68b2b3/namespace_4b68b2b3
// Params 0
// Checksum 0x80f724d1, Offset: 0xb30
// Size: 0x4
function function_e0dfc80f()
{
    
}

// Namespace namespace_4b68b2b3/namespace_4b68b2b3
// Params 2
// Checksum 0x18a32317, Offset: 0xb40
// Size: 0x15c
function function_3c9be590( var_5ea5c94d, ended_early )
{
    if ( var_5ea5c94d || ended_early )
    {
        level.var_50b3f446 = 1;
        level notify( #"hash_5266a594b96823e2" );
        level.var_b2b15659 = 1;
    }
    
    foreach ( s_challenge_station in level.a_s_challenge_stations )
    {
        s_challenge_station.b_is_active = 0;
        s_challenge_station zm_orange_challenges::function_fd8a137e();
    }
    
    level flag::clear( #"hash_3028604821838259" );
    zm_hms_util::pause_zombies( 1, 0 );
    level flag::set( #"disable_special_rounds" );
    zm_orange_mq_hell::spawn_guide();
    zm_orange_lighthouse::function_da304f6e( 0 );
}

// Namespace namespace_4b68b2b3/namespace_4b68b2b3
// Params 0
// Checksum 0x788413db, Offset: 0xca8
// Size: 0x24
function function_9af4e8bd()
{
    level flag::set( #"hash_7b6c32b9937aee62" );
}

// Namespace namespace_4b68b2b3/namespace_4b68b2b3
// Params 0, eflags: 0x4
// Checksum 0xad1c8b95, Offset: 0xcd8
// Size: 0x77c
function private defend_event()
{
    /#
        if ( getdvarint( #"zm_debug_ee", 0 ) )
        {
            if ( getdvarint( #"zm_debug_ee", 0 ) )
            {
                iprintlnbold( "<dev string:x38>" );
                println( "<dev string:x38>" );
            }
        }
    #/
    
    zm_orange_pablo::function_b9e15919( 1 );
    level.musicsystemoverride = 1;
    music::setmusicstate( "lighthouse_defend" );
    n_next_round = level.round_number + 1;
    var_898a45da = level.var_45827161[ n_next_round ];
    
    if ( isdefined( var_898a45da ) )
    {
        zm_round_spawning::function_43aed0ca( n_next_round );
    }
    
    level.var_eacf25e4 = level.func_get_delay_between_rounds;
    level.func_get_delay_between_rounds = &function_f85d3d98;
    zm_hms_util::function_2ba419ee( 0 );
    a_e_blockers = getentarray( "lockdown_lighthouse", "targetname" );
    
    foreach ( e_blocker in a_e_blockers )
    {
        e_blocker solid();
    }
    
    exploder::exploder( "fxexp_forcefield_door_lighthouse_lvl_4" );
    level flag::set( #"infinite_round_spawning" );
    wait 30;
    
    /#
        if ( getdvarint( #"zm_debug_ee", 0 ) )
        {
            if ( getdvarint( #"zm_debug_ee", 0 ) )
            {
                iprintlnbold( "<dev string:x56>" );
                println( "<dev string:x56>" );
            }
        }
    #/
    
    wait 30;
    
    /#
        if ( getdvarint( #"zm_debug_ee", 0 ) )
        {
            if ( getdvarint( #"zm_debug_ee", 0 ) )
            {
                iprintlnbold( "<dev string:x67>" );
                println( "<dev string:x67>" );
            }
        }
    #/
    
    wait 30;
    
    /#
        if ( getdvarint( #"zm_debug_ee", 0 ) )
        {
            if ( getdvarint( #"zm_debug_ee", 0 ) )
            {
                iprintlnbold( "<dev string:x78>" );
                println( "<dev string:x78>" );
            }
        }
    #/
    
    wait 10;
    
    /#
        if ( getdvarint( #"zm_debug_ee", 0 ) )
        {
            if ( getdvarint( #"zm_debug_ee", 0 ) )
            {
                iprintlnbold( "<dev string:x89>" );
                println( "<dev string:x89>" );
            }
        }
    #/
    
    wait 10;
    
    /#
        if ( getdvarint( #"zm_debug_ee", 0 ) )
        {
            if ( getdvarint( #"zm_debug_ee", 0 ) )
            {
                iprintlnbold( "<dev string:x9a>" );
                println( "<dev string:x9a>" );
            }
        }
    #/
    
    wait 10;
    level flag::clear( #"infinite_round_spawning" );
    level.func_get_delay_between_rounds = level.var_eacf25e4;
    level.musicsystemoverride = 0;
    music::setmusicstate( "none" );
    zm_hms_util::pause_zombies( 1, 1 );
    a_e_blockers = getentarray( "lockdown_lighthouse", "targetname" );
    
    foreach ( e_blocker in a_e_blockers )
    {
        e_blocker notsolid();
    }
    
    exploder::exploder_stop( "fxexp_forcefield_door_lighthouse_lvl_4" );
    
    /#
        if ( getdvarint( #"zm_debug_ee", 0 ) )
        {
            if ( getdvarint( #"zm_debug_ee", 0 ) )
            {
                iprintlnbold( "<dev string:xab>" );
                println( "<dev string:xab>" );
            }
        }
    #/
    
    zm_orange_pablo::function_3f9e02b8( 8, #"hash_3be823a04b5cca2d", #"hash_25cb84d1af883c53", &pap_charging );
    zm_orange_pablo::function_d83490c5( 8 );
    
    /#
        if ( getdvarint( #"zm_debug_ee", 0 ) )
        {
            if ( getdvarint( #"zm_debug_ee", 0 ) )
            {
                iprintlnbold( "<dev string:xc7>" );
                println( "<dev string:xc7>" );
            }
        }
    #/
    
    wait 10;
    zm_hms_util::pause_zombies( 0 );
}

// Namespace namespace_4b68b2b3/namespace_4b68b2b3
// Params 0
// Checksum 0x7aa36b0f, Offset: 0x1460
// Size: 0x6, Type: bool
function function_f85d3d98()
{
    return false;
}

// Namespace namespace_4b68b2b3/namespace_4b68b2b3
// Params 0
// Checksum 0x4717c412, Offset: 0x1470
// Size: 0x88
function pap_charging()
{
    level.var_f6f7a368 = 0;
    arrayremoveindex( level.var_4d8e32c8, 4 );
    level flag::set( #"hash_4898001eb77cb16f" );
    level flag::set( #"hash_11d64d1f93c196cc" );
    level notify( #"hash_39b6629ce957cce9" );
}

// Namespace namespace_4b68b2b3/namespace_4b68b2b3
// Params 0
// Checksum 0xff1abb6a, Offset: 0x1500
// Size: 0xe8
function function_3f15613f()
{
    if ( level flag::get( #"hash_11d64d1f93c196cc" ) && !( isdefined( self.stub.pap_machine.var_b6d21cc2 ) && self.stub.pap_machine.var_b6d21cc2 ) )
    {
        str_prompt = zm_utility::function_d6046228( #"hash_546b9ae85f7a9448", #"hash_38d87fd576702a44" );
        self sethintstring( str_prompt );
        return 1;
    }
    
    str_prompt = "";
    self sethintstring( str_prompt );
    return 0;
}

// Namespace namespace_4b68b2b3/namespace_4b68b2b3
// Params 0
// Checksum 0xe20be39, Offset: 0x15f0
// Size: 0x92c
function function_dc380897()
{
    level endon( #"game_end" );
    self flag::clear( "pap_waiting_for_user" );
    
    foreach ( vessel in level.var_3089454f )
    {
        if ( vessel.script_noteworthy === self.script_noteworthy )
        {
            self.vessel = vessel;
        }
    }
    
    waitresult = self waittill( #"trigger_activated" );
    player = waitresult.e_who;
    
    if ( level.var_d7374603 == 0 )
    {
        player thread zm_orange_util::function_51b752a9( #"hash_abba1937c744399", -1, 0, 1 );
    }
    else if ( level.var_d7374603 == 3 )
    {
        player thread zm_orange_util::function_51b752a9( #"hash_549030026224cbce", -1, 0, 1 );
    }
    else if ( level.var_d7374603 == 4 )
    {
        player thread zm_orange_util::function_51b752a9( #"hash_103075d32e77e799", -1, 0, 1 );
    }
    
    level flag::clear( #"hash_11d64d1f93c196cc" );
    self thread function_d584f1a8();
    self.vessel show();
    self.vessel playsound( "zmb_vessel_drop" );
    self.vessel clientfield::set( "" + #"hash_1b72c208f2964e24", level.var_ed1e7d4d );
    self.vessel.return_loc = self.vessel.origin;
    self.vessel playsound( #"hash_8655fa14e357e9a" );
    self.vessel playloopsound( #"hash_3c00e3a927df9b2e" );
    var_deb6871b = struct::get( self.vessel.target, "targetname" );
    self.vessel moveto( var_deb6871b.origin, 1.5 );
    self.vessel waittill( #"movedone" );
    self.vessel clientfield::set( "" + #"hash_1b72c208f2964e24", 0 );
    var_deb6871b.var_7944be4a = 0;
    
    switch ( getplayers().size )
    {
        case 1:
            var_deb6871b.n_souls_required = 20;
            break;
        case 2:
            var_deb6871b.n_souls_required = 40;
            break;
        case 3:
        case 4:
            var_deb6871b.n_souls_required = 80;
            break;
    }
    
    var_deb6871b.var_b9989e12 = hash( var_deb6871b.script_noteworthy );
    zm_sq_modules::function_3f808d3d( var_deb6871b.var_b9989e12 );
    level flag::set( #"infinite_round_spawning" );
    var_deb6871b waittill( #"hash_1f9b852104ab2c13" );
    
    /#
        if ( getdvarint( #"zm_debug_ee", 0 ) )
        {
            if ( getdvarint( #"zm_debug_ee", 0 ) )
            {
                iprintlnbold( "<dev string:xdb>" );
                println( "<dev string:xdb>" );
            }
        }
    #/
    
    self.var_b6d21cc2 = 1;
    pos = var_deb6871b.origin + anglestoforward( var_deb6871b.angles ) * 14 + ( 0, 0, 4 );
    self.e_fire = spawn( "script_model", pos );
    self.e_fire.angles = var_deb6871b.angles + ( 0, 90, 0 );
    self.e_fire setmodel( "tag_origin" );
    self.e_fire clientfield::set( "" + #"hash_249c83f6060ea7ba", 1 );
    self.vessel clientfield::set( "" + #"hash_411947cf11cffb69", 1 );
    self.e_fire playsound( #"hash_49156c17a247721c" );
    arrayremovevalue( level.var_4d8e32c8, self );
    
    if ( !level flag::get( #"hash_3028604821838259" ) )
    {
        wait 1;
        level notify( #"hash_39b6629ce957cce9" );
        self.vessel clientfield::set( "" + #"hash_1b72c208f2964e24", level.var_ed1e7d4d );
        self.vessel moveto( self.vessel.return_loc, 0.5 );
        self.vessel playsound( #"hash_1ae6116ea0aa080f" );
        self.vessel stoploopsound();
        wait 0.5;
        self.vessel zm_unitrigger::function_fac87205( zm_utility::function_d6046228( #"hash_3be823a04b5cca2d", #"hash_25cb84d1af883c53" ), 64 );
        self.vessel playsound( #"zmb_vessel_pickup" );
        
        if ( level.var_d7374603 == 1 )
        {
            player thread zm_orange_util::function_51b752a9( #"hash_4de6e4f76ebb0c43", -1, 0, 1 );
        }
        else if ( level.var_d7374603 == 4 )
        {
            player thread zm_orange_util::function_51b752a9( #"hash_2fbc5c784ba782b6", -1, 0, 1 );
        }
        
        arrayremovevalue( level.var_3089454f, self.vessel );
        self.vessel delete();
        level flag::set( #"hash_11d64d1f93c196cc" );
        return;
    }
    
    arrayremovevalue( level.var_3089454f, self.vessel );
    self.vessel delete();
}

// Namespace namespace_4b68b2b3/namespace_4b68b2b3
// Params 0
// Checksum 0x6d45b9b1, Offset: 0x1f28
// Size: 0xd4
function function_3177f73c()
{
    if ( !isdefined( self.unitrigger_stub.var_b8237333 ) )
    {
        self.unitrigger_stub.var_b8237333 = self.prompt_and_visibility_func;
    }
    
    if ( !isdefined( self.var_5faaa732 ) )
    {
        self.unitrigger_stub.var_5faaa732 = self.trigger_func;
    }
    
    self.unitrigger_stub.prompt_and_visibility_func = &function_3f15613f;
    self.unitrigger_stub.trigger_func = &zm_unitrigger::function_69168e61;
    zm_unitrigger::reregister_unitrigger( self.unitrigger_stub );
    self.unitrigger_stub.related_parent = self;
    self thread function_dc380897();
}

// Namespace namespace_4b68b2b3/namespace_4b68b2b3
// Params 0
// Checksum 0x18e4cafb, Offset: 0x2008
// Size: 0xbc
function function_d584f1a8()
{
    for ( i = 0; i < self getnumzbarrierpieces() ; i++ )
    {
        self hidezbarrierpiece( i );
    }
    
    self showzbarrierpiece( 1 );
    self setzbarrierpiecestate( 1, "opening" );
    self showzbarrierpiece( 2 );
    self setzbarrierpiecestate( 2, "opening" );
}

// Namespace namespace_4b68b2b3/namespace_4b68b2b3
// Params 2
// Checksum 0x98e0687b, Offset: 0x20d0
// Size: 0xc2
function is_soul_capture( var_88206a50, ent )
{
    b_killed_by_player = isdefined( ent.attacker ) && isplayer( ent.attacker ) || isdefined( ent.damageinflictor ) && isplayer( ent.damageinflictor );
    packtri = b_killed_by_player && distance( ent.origin, var_88206a50.origin ) < 500;
    return packtri;
}

// Namespace namespace_4b68b2b3/namespace_4b68b2b3
// Params 2
// Checksum 0xc2fa0674, Offset: 0x21a0
// Size: 0x94
function soul_captured( var_f0e6c7a2, ent )
{
    var_f0e6c7a2.var_7944be4a++;
    
    /#
        if ( level flag::get( #"soul_fill" ) )
        {
            var_f0e6c7a2.var_7944be4a = var_f0e6c7a2.n_souls_required;
        }
    #/
    
    if ( var_f0e6c7a2.var_7944be4a >= var_f0e6c7a2.n_souls_required )
    {
        var_f0e6c7a2 function_a66f0de2();
    }
}

// Namespace namespace_4b68b2b3/namespace_4b68b2b3
// Params 0
// Checksum 0x2417befc, Offset: 0x2240
// Size: 0xa4
function function_a66f0de2()
{
    zm_sq_modules::function_2a94055d( self.var_b9989e12 );
    level.var_d7374603++;
    self notify( #"hash_1f9b852104ab2c13" );
    level flag::clear( #"infinite_round_spawning" );
    
    if ( level.var_d7374603 > 3 )
    {
        level flag::set( #"hash_5266a594b96823e2" );
        zm_orange_lighthouse::function_da304f6e( 0 );
    }
}

// Namespace namespace_4b68b2b3/namespace_4b68b2b3
// Params 0
// Checksum 0x88924818, Offset: 0x22f0
// Size: 0xa2
function function_8c273b51()
{
    level endon( #"end_game", #"hash_5266a594b96823e2" );
    
    while ( true )
    {
        if ( zm_hms_util::any_player_in_zone( "lighthouse_level_4" ) && level.pablo_npc zm_audio::can_speak() )
        {
            level zm_orange_pablo::function_e44c7c0c( #"hash_17b44ac72ae4b92f" );
            break;
        }
        
        wait 1;
    }
}

