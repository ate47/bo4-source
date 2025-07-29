#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\laststand_shared;
#using scripts\core_common\spawner_shared;
#using scripts\core_common\struct;
#using scripts\zm\zm_hms_util;
#using scripts\zm\zm_orange_util;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_blockers;
#using scripts\zm_common\zm_customgame;
#using scripts\zm_common\zm_hud;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_utility_zstandard;
#using scripts\zm_common\zm_zonemgr;

#namespace zm_orange_zones;

// Namespace zm_orange_zones/zm_orange_zones
// Params 0
// Checksum 0x6059da65, Offset: 0x6f8
// Size: 0x24
function main()
{
    callback::on_spawned( &function_29ec1ad7 );
}

// Namespace zm_orange_zones/zm_orange_zones
// Params 0
// Checksum 0xb2a193ea, Offset: 0x728
// Size: 0xe8c
function zone_init()
{
    level flag::init( "always_on" );
    level flag::init( #"hash_6f7fd3d4d070db87" );
    level flag::init( "grotto_tunnel_open" );
    level flag::set( "always_on" );
    level.disable_kill_thread = 1;
    zm_zonemgr::zone_init( "ice_grotto" );
    zm_zonemgr::enable_zone( "ice_grotto" );
    zm_zonemgr::zone_init( "gehen" );
    zm_zonemgr::enable_zone( "gehen" );
    zm_zonemgr::zone_init( "edge" );
    zm_zonemgr::enable_zone( "edge" );
    zm_zonemgr::zone_init( "main_entrance" );
    zm_zonemgr::zone_init( "ice_floe" );
    zm_zonemgr::add_adjacent_zone( "docks_1", "docks_2", "always_on", 0 );
    zm_zonemgr::add_adjacent_zone( "docks_2", "boathouse", "docks_to_boathouse", 0 );
    zm_zonemgr::add_adjacent_zone( "boathouse", "lighthouse_annex", "docks_to_boathouse", 0 );
    zm_zonemgr::add_adjacent_zone( "boathouse", "lighthouse_annex", "lighthouse_level_1_doors", 0 );
    zm_zonemgr::add_adjacent_zone( "docks_1", "frozen_crevasse", "frozen_crevasse_open", 0 );
    zm_zonemgr::add_adjacent_zone( "frozen_crevasse", "lagoon", "frozen_crevasse_open", 0 );
    zm_zonemgr::add_adjacent_zone( "ice_grotto", "lagoon", "grotto_tunnel_open", 0 );
    zm_zonemgr::add_adjacent_zone( "ice_grotto", "lagoon", "frozen_crevasse_open", 0 );
    zm_zonemgr::add_adjacent_zone( "ice_grotto", "lagoon", "docks_to_boathouse", 0 );
    zm_zonemgr::add_adjacent_zone( "lagoon", "lighthouse_cove", "frozen_crevasse_open", 0 );
    zm_zonemgr::add_adjacent_zone( "lagoon", "lighthouse_cove", "lighthouse_level_1_doors", 0 );
    zm_zonemgr::add_adjacent_zone( "lagoon", "lighthouse_cove", "lighthouse_cove_to_lighthouse_station", 0 );
    zm_zonemgr::add_adjacent_zone( "lagoon", "lighthouse_cove", "grotto_tunnel_open", 0 );
    zm_zonemgr::add_adjacent_zone( "lagoon", "lighthouse_cove", "docks_to_boathouse", 0 );
    zm_zonemgr::add_adjacent_zone( "lighthouse_annex", "lighthouse_level_1", "lighthouse_level_1_doors", 0 );
    zm_zonemgr::add_adjacent_zone( "lighthouse_cove", "lighthouse_level_1", "lighthouse_level_1_doors", 0 );
    zm_zonemgr::add_adjacent_zone( "lighthouse_cove", "lighthouse_station", "lighthouse_cove_to_lighthouse_station", 0 );
    zm_zonemgr::add_adjacent_zone( "lighthouse_station", "lighthouse_level_2", "lighthouse_station_to_lighthouse_level_2", 0 );
    zm_zonemgr::add_adjacent_zone( "lighthouse_station", "lighthouse_level_3", "lighthouse_station_to_lighthouse_level_3", 0 );
    zm_zonemgr::add_adjacent_zone( "lighthouse_level_1", "lighthouse_level_2", "lighthouse_level_1_doors", 0 );
    zm_zonemgr::add_adjacent_zone( "lighthouse_level_1", "lighthouse_level_2", "lighthouse_level_1_doors", 0 );
    zm_zonemgr::add_adjacent_zone( "lighthouse_level_1", "lighthouse_level_2", "lighthouse_station_to_lighthouse_level_2", 0 );
    zm_zonemgr::add_adjacent_zone( "lighthouse_level_1", "lighthouse_level_2", "lighthouse_station_to_lighthouse_level_3", 0 );
    zm_zonemgr::add_adjacent_zone( "lighthouse_level_1", "lighthouse_level_2", "lighthouse_level_3_to_level_4", 0 );
    zm_zonemgr::add_adjacent_zone( "lighthouse_level_2", "lighthouse_level_3", "lighthouse_level_1_doors", 0 );
    zm_zonemgr::add_adjacent_zone( "lighthouse_level_2", "lighthouse_level_3", "lighthouse_level_1_doors", 0 );
    zm_zonemgr::add_adjacent_zone( "lighthouse_level_2", "lighthouse_level_3", "lighthouse_station_to_lighthouse_level_2", 0 );
    zm_zonemgr::add_adjacent_zone( "lighthouse_level_2", "lighthouse_level_3", "lighthouse_station_to_lighthouse_level_3", 0 );
    zm_zonemgr::add_adjacent_zone( "lighthouse_level_2", "lighthouse_level_3", "lighthouse_level_3_to_level_4", 0 );
    zm_zonemgr::add_adjacent_zone( "lighthouse_level_3", "lighthouse_level_4", "lighthouse_level_3_to_level_4", 0 );
    zm_zonemgr::add_adjacent_zone( "lighthouse_level_4", "lighthouse_station", "lighthouse_level_3_to_level_4", 1 );
    zm_zonemgr::add_adjacent_zone( "lighthouse_station", "lighthouse_approach", "lighthouse_cove_to_lighthouse_station", 0 );
    zm_zonemgr::add_adjacent_zone( "lighthouse_station", "lighthouse_approach", "lighthouse_station_to_lighthouse_level_2", 0 );
    zm_zonemgr::add_adjacent_zone( "lighthouse_station", "lighthouse_approach", "lighthouse_station_to_lighthouse_level_3", 0 );
    zm_zonemgr::add_adjacent_zone( "lighthouse_station", "lighthouse_approach", "beach_to_lighthouse_approach", 0 );
    zm_zonemgr::add_adjacent_zone( "lighthouse_station", "lighthouse_approach", "lighthouse_level_3_to_level_4", 0 );
    zm_zonemgr::add_adjacent_zone( "lighthouse_approach", "beach", "beach_to_lighthouse_approach", 0 );
    zm_zonemgr::add_adjacent_zone( "lighthouse_cove", "cargo_hold", "lighthouse_cove_to_cargo_hold", 0 );
    zm_zonemgr::add_adjacent_zone( "beach", "gangway", "beach_to_gangway", 0 );
    zm_zonemgr::add_adjacent_zone( "gangway", "stern", "gangway_to_stern", 0 );
    zm_zonemgr::add_adjacent_zone( "gangway", "navigation", "gangway_to_navigation", 0 );
    zm_zonemgr::add_adjacent_zone( "navigation", "sun_deck", "gangway_to_navigation", 0 );
    zm_zonemgr::add_adjacent_zone( "sun_deck", "bridge", "sun_deck_to_bridge", 0 );
    zm_zonemgr::add_adjacent_zone( "gangway", "main_deck", "gangway_to_main_deck", 0 );
    zm_zonemgr::add_adjacent_zone( "cargo_hold", "main_deck", "lighthouse_cove_to_cargo_hold", 0 );
    zm_zonemgr::add_adjacent_zone( "cargo_hold", "main_deck", "gangway_to_main_deck", 0 );
    zm_zonemgr::add_adjacent_zone( "cargo_hold", "main_deck", "hidden_path_open", 0 );
    zm_zonemgr::add_adjacent_zone( "cargo_hold", "artifact_storage", "cargo_hold_to_artifact_storage", 0 );
    zm_zonemgr::add_adjacent_zone( "main_deck", "forecastle", "main_deck_to_forecastle", 0 );
    zm_zonemgr::add_adjacent_zone( "artifact_storage", "forecastle", "artifact_storage_to_forecastle", 0 );
    zm_zonemgr::add_adjacent_zone( "hidden_path", "cargo_hold", "hidden_path_open", 0 );
    zm_zonemgr::add_adjacent_zone( "hidden_path", "beach", "hidden_path_open", 1 );
    zm_zonemgr::add_adjacent_zone( "main_entrance", "security_lobby", #"facility_available", 0 );
    zm_zonemgr::add_adjacent_zone( "security_lobby", "geological_processing", "geological_processing_doors", 0 );
    zm_zonemgr::add_adjacent_zone( "security_lobby", "decontamination", "decontamination_doors", 0 );
    zm_zonemgr::add_adjacent_zone( "decontamination", "upper_catwalk", "decontamination_doors", 0 );
    zm_zonemgr::add_adjacent_zone( "geological_processing", "upper_catwalk", "geological_processing_doors", 0 );
    zm_zonemgr::add_adjacent_zone( "upper_catwalk", "human_infusion", "upper_catwalk_to_human_infusion", 0 );
    zm_zonemgr::add_adjacent_zone( "upper_catwalk", "specimen_storage", "specimen_storage_doors", 0 );
    zm_zonemgr::add_adjacent_zone( "specimen_storage", "loading_platform", #"facility_available", 0 );
    zm_zonemgr::add_adjacent_zone( "sunken_path", "artifact_storage", #"hash_6f7fd3d4d070db87", 0 );
    
    if ( zm_custom::function_901b751c( #"zmpowerdoorstate" ) == 2 )
    {
        zm_zonemgr::add_adjacent_zone( "lagoon", "sunken_path", "frozen_crevasse_open", 0 );
        zm_zonemgr::add_adjacent_zone( "lagoon", "sunken_path", #"hash_6f7fd3d4d070db87", 0 );
        zm_zonemgr::add_adjacent_zone( "lagoon", "sunken_path", "docks_to_boathouse", 0 );
        zm_zonemgr::add_adjacent_zone( "main_entrance", "outer_walkway", #"facility_available", 0 );
        zm_zonemgr::add_adjacent_zone( "outer_walkway", "loading_platform", #"facility_available", 0 );
        zm_zonemgr::add_adjacent_zone( "beach", "lighthouse_cove", "frozen_crevasse_open", 0 );
        zm_zonemgr::add_adjacent_zone( "beach", "lighthouse_cove", "beach_to_lighthouse_approach", 0 );
        zm_zonemgr::add_adjacent_zone( "beach", "lighthouse_cove", "beach_to_gangway", 0 );
        zm_zonemgr::add_adjacent_zone( "beach", "lighthouse_cove", "docks_to_boathouse", 0 );
    }
    else
    {
        zm_zonemgr::add_adjacent_zone( "lagoon", "sunken_path", #"hash_48e7d63b38c5e2da", 0 );
        zm_zonemgr::add_adjacent_zone( "main_entrance", "outer_walkway", #"hash_52d967f4fc8b12fc", 0 );
        zm_zonemgr::add_adjacent_zone( "outer_walkway", "loading_platform", #"hash_52d967f4fc8b12fc", 0 );
        zm_zonemgr::add_adjacent_zone( "beach", "lighthouse_cove", #"hash_38c97197db36afb7", 0 );
    }
    
    level.var_6f6cc58 = &function_8a80437;
    level thread function_4d5bea6e();
    level thread function_734d8b08();
    level thread function_49054104();
    level thread grotto_tunnel_watcher();
    level thread cargo_hold_to_artifact_storage_watcher();
    level thread sun_deck_to_bridge_watcher();
    level thread main_deck_to_forecastle_watcher();
    
    if ( !zm_utility::is_standard() )
    {
        level thread function_9d1d7efd();
        level thread function_58db1b78();
        level thread function_cbb8e588();
    }
}

// Namespace zm_orange_zones/zm_orange_zones
// Params 0
// Checksum 0x1d619f92, Offset: 0x15c0
// Size: 0x5c
function main_deck_to_forecastle_watcher()
{
    level waittill( #"main_deck_to_forecastle" );
    var_21a9b20e = array( "main_deck_to_forecastle", "main_deck_to_forecastle_blocker" );
    level zm_utility::open_door( var_21a9b20e );
}

// Namespace zm_orange_zones/zm_orange_zones
// Params 0
// Checksum 0x7927a38d, Offset: 0x1628
// Size: 0x5c
function function_4d5bea6e()
{
    level flag::init( #"facility_available" );
    level flag::wait_till( #"facility_available" );
    zm_zonemgr::enable_zone( "main_entrance" );
}

// Namespace zm_orange_zones/zm_orange_zones
// Params 0
// Checksum 0x2ad0798a, Offset: 0x1690
// Size: 0x5c
function function_734d8b08()
{
    level flag::init( #"hash_f14d343f59fc897" );
    level flag::wait_till( #"hash_f14d343f59fc897" );
    zm_zonemgr::enable_zone( "ice_floe" );
}

// Namespace zm_orange_zones/zm_orange_zones
// Params 1
// Checksum 0x208191c0, Offset: 0x16f8
// Size: 0x3e
function function_3b77181c( b_enable = 1 )
{
    level.zones[ #"ice_floe" ].is_enabled = b_enable;
}

// Namespace zm_orange_zones/zm_orange_zones
// Params 0
// Checksum 0xa7ccd5bf, Offset: 0x1740
// Size: 0x94
function function_49054104()
{
    level endon( #"end_game" );
    e_blocker = getent( "lighthouse_cove_to_lighthouse_level_1_xtra", "targetname" );
    level flag::wait_till( "lighthouse_level_1_doors" );
    e_blocker show();
    e_blocker disconnectpaths();
}

// Namespace zm_orange_zones/zm_orange_zones
// Params 0
// Checksum 0xe25181b4, Offset: 0x17e0
// Size: 0x1ea
function grotto_tunnel_watcher()
{
    level endon( #"end_game" );
    var_752cf781 = getent( "grotto_tunnel_big_blocker", "targetname" );
    var_752cf781 disconnectpaths();
    a_s_spawn_points = struct::get_array( "grotto_tunnel", "psuedo_zone" );
    var_ef7245fb = struct::get_array( "grotto_tunnel_crawl_spawn", "prefabname" );
    a_s_spawn_points = arraycombine( a_s_spawn_points, var_ef7245fb, 0, 0 );
    
    foreach ( s_spawn_point in a_s_spawn_points )
    {
        s_spawn_point.is_enabled = 0;
    }
    
    level flag::wait_till( "grotto_tunnel_open" );
    var_752cf781 connectpaths();
    var_752cf781 delete();
    
    foreach ( s_spawn_point in a_s_spawn_points )
    {
        s_spawn_point.is_enabled = 1;
    }
}

// Namespace zm_orange_zones/zm_orange_zones
// Params 0
// Checksum 0x4c3137ba, Offset: 0x19d8
// Size: 0x4c
function cargo_hold_to_artifact_storage_watcher()
{
    level endon( #"end_game" );
    level flag::wait_till( "cargo_hold_to_artifact_storage" );
    zm_orange_util::function_8a7521db( "cargo_hold_hatch_door" );
}

// Namespace zm_orange_zones/zm_orange_zones
// Params 0
// Checksum 0xe1233573, Offset: 0x1a30
// Size: 0xc4
function sun_deck_to_bridge_watcher()
{
    level endon( #"end_game" );
    e_door_clip = getent( "sun_deck_to_bridge_clip", "targetname" );
    e_door_clip notsolid();
    level flag::wait_till( "sun_deck_to_bridge" );
    e_door_clip solid();
    e_door_clip disconnectpaths();
    zm_orange_util::function_8a7521db( "bridge_hatch_door" );
}

// Namespace zm_orange_zones/zm_orange_zones
// Params 0
// Checksum 0x70c2e6b3, Offset: 0x1b00
// Size: 0x5c
function function_cbaec34a()
{
    result = 0;
    zone_name = self zm_zonemgr::get_player_zone();
    
    if ( isdefined( zone_name ) && function_a2888093( zone_name ) )
    {
        result = 1;
    }
    
    return result;
}

// Namespace zm_orange_zones/zm_orange_zones
// Params 0
// Checksum 0xeafc958f, Offset: 0x1b68
// Size: 0x5c
function function_8355a4a8()
{
    result = 0;
    zone_name = self zm_utility::get_current_zone();
    
    if ( isdefined( zone_name ) && function_a2888093( zone_name ) )
    {
        result = 1;
    }
    
    return result;
}

// Namespace zm_orange_zones/zm_orange_zones
// Params 0
// Checksum 0x1cc2fc8f, Offset: 0x1bd0
// Size: 0xb4, Type: bool
function function_c3bf42e9()
{
    foreach ( e_player in getplayers() )
    {
        str_player_zone = e_player zm_zonemgr::get_player_zone();
        
        if ( isdefined( str_player_zone ) && function_94b7a4bd( str_player_zone ) )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace zm_orange_zones/zm_orange_zones
// Params 1
// Checksum 0xba4b6608, Offset: 0x1c90
// Size: 0xd6
function function_a2888093( str_zone )
{
    result = 0;
    
    if ( str_zone == "main_entrance" || str_zone == "security_lobby" || str_zone == "decontamination" || str_zone == "geological_processing" || str_zone == "upper_catwalk" || str_zone == "human_infusion" || str_zone == "specimen_storage" || str_zone == "loading_platform" || str_zone == "outer_walkway" )
    {
        result = 1;
    }
    
    return result;
}

// Namespace zm_orange_zones/zm_orange_zones
// Params 1
// Checksum 0x539f750e, Offset: 0x1d70
// Size: 0x8c
function function_94b7a4bd( str_zone )
{
    if ( str_zone == "security_lobby" || str_zone == "decontamination" || str_zone == "geological_processing" || str_zone == "upper_catwalk" || str_zone == "human_infusion" || str_zone == "specimen_storage" )
    {
        return 1;
    }
    
    return 0;
}

// Namespace zm_orange_zones/zm_orange_zones
// Params 1, eflags: 0x4
// Checksum 0x45d0f03b, Offset: 0x1e08
// Size: 0x116
function private function_8a80437( target )
{
    result = 1;
    
    if ( isdefined( self ) && isdefined( target ) && isdefined( self.archetype ) && self.archetype == #"zombie_dog" )
    {
        if ( !isdefined( self.var_19ffa187 ) || self.var_19ffa187 < gettime() )
        {
            self.var_19ffa187 = gettime() + 50;
            self.var_b5b1e111 = 1;
            var_3eb6a47a = target function_cbaec34a();
            var_970d35d = self function_8355a4a8();
            
            if ( var_3eb6a47a != var_970d35d )
            {
                result = 0;
                self.var_b5b1e111 = 0;
            }
        }
        else if ( isdefined( self.var_b5b1e111 ) )
        {
            result = self.var_b5b1e111;
        }
    }
    
    return result;
}

// Namespace zm_orange_zones/zm_orange_zones
// Params 0
// Checksum 0x3233b058, Offset: 0x1f28
// Size: 0x44
function function_29ec1ad7()
{
    self thread function_8e0b371();
    
    if ( !zm_utility::is_standard() )
    {
        self thread function_17ac86f7();
    }
}

// Namespace zm_orange_zones/zm_orange_zones
// Params 0
// Checksum 0x1b08bf6c, Offset: 0x1f78
// Size: 0xb8
function function_8e0b371()
{
    self endon( #"disconnect" );
    
    while ( true )
    {
        if ( isalive( self ) )
        {
            str_location = function_ab7f70b9( self );
            self zm_hud::function_29780fb5( isdefined( str_location ) ? str_location : #"" );
        }
        else
        {
            self zm_hud::function_29780fb5( #"" );
        }
        
        wait 0.5;
    }
}

// Namespace zm_orange_zones/zm_orange_zones
// Params 2
// Checksum 0xb5f065c4, Offset: 0x2038
// Size: 0x5fe
function function_ab7f70b9( e_player, str_zone )
{
    if ( isdefined( e_player ) )
    {
        str_zone = e_player zm_zonemgr::get_player_zone();
    }
    
    if ( !isdefined( str_zone ) )
    {
        return undefined;
    }
    
    switch ( str_zone )
    {
        case #"docks_1":
        case #"docks_2":
            str_display = #"hash_99011c41f3d5380";
            break;
        case #"boathouse":
            str_display = #"hash_6b2f9edfc77ea9b2";
            break;
        case #"frozen_crevasse":
            str_display = #"hash_1e6b498a976cdcb5";
            break;
        case #"ice_grotto":
            str_display = #"hash_3461ddd73c20a747";
            break;
        case #"lighthouse_annex":
            str_display = #"hash_43a7944f79cf9bf1";
            break;
        case #"lagoon":
            str_display = #"hash_381e2912fb0376dc";
            break;
        case #"lighthouse_cove":
            str_display = #"hash_2fb0927a65d8a9e";
            break;
        case #"lighthouse_station":
            str_display = #"hash_1424b8bac646249f";
            break;
        case #"lighthouse_level_1":
            str_display = #"hash_7957c402b1b2ef31";
            break;
        case #"lighthouse_level_2":
            str_display = #"hash_7957c102b1b2ea18";
            break;
        case #"lighthouse_level_3":
            str_display = #"hash_7957c202b1b2ebcb";
            break;
        case #"lighthouse_level_4":
            str_display = #"hash_7957c702b1b2f44a";
            break;
        case #"lighthouse_approach":
            str_display = #"hash_39b4e46fd4bebad5";
            break;
        case #"beach":
            str_display = #"hash_75f05448c75c06f";
            break;
        case #"hidden_path":
            str_display = #"hash_3a98581b802c0296";
            break;
        case #"gangway":
            str_display = #"hash_1797071bcd3e6fe6";
            break;
        case #"stern":
            str_display = #"hash_4c328e01a462f48a";
            break;
        case #"navigation":
            str_display = #"hash_3d82a67e307a0426";
            break;
        case #"sun_deck":
            str_display = #"hash_38990c0828e68602";
            break;
        case #"bridge":
            str_display = #"hash_5dbcb178cb1573c1";
            break;
        case #"cargo_hold":
            str_display = #"hash_335d7ee067ac0e68";
            break;
        case #"artifact_storage":
            str_display = #"hash_63f7af429c316620";
            break;
        case #"main_deck":
            str_display = #"hash_75d26f96a738d2a3";
            break;
        case #"forecastle":
            str_display = #"hash_3befc74a37bbeb9e";
            break;
        case #"main_entrance":
            str_display = #"hash_520e403cdf1ae8";
            break;
        case #"security_lobby":
            str_display = #"hash_19a2493217019135";
            break;
        case #"geological_processing":
            str_display = #"hash_21450c4a4a6646d6";
            break;
        case #"upper_catwalk":
            str_display = #"hash_65457ae6fbfe6c32";
            break;
        case #"human_infusion":
            str_display = #"hash_46ef5a594e42c371";
            break;
        case #"decontamination":
            str_display = #"hash_6571eafdcddb13ab";
            break;
        case #"specimen_storage":
            str_display = #"hash_12750e3f1d3659e4";
            break;
        case #"loading_platform":
            str_display = #"hash_4f2b74b3fea599ba";
            break;
        case #"outer_walkway":
            str_display = #"hash_778497a569854310";
            break;
        case #"ice_floe":
            str_display = #"hash_550cd5295ec40e4a";
            break;
        case #"sunken_path":
            str_display = #"hash_18aaabdeba54214a";
            break;
        default:
            str_display = undefined;
            break;
    }
    
    return str_display;
}

// Namespace zm_orange_zones/zm_orange_zones
// Params 0
// Checksum 0x7678b961, Offset: 0x2640
// Size: 0x2dc
function function_17ac86f7()
{
    self thread zm_audio::function_713192b1( #"hash_6b2f9edfc77ea9b2", #"boathouse" );
    self thread zm_audio::function_713192b1( #"hash_2fb0927a65d8a9e", #"lighthouse_cove" );
    self thread zm_audio::function_713192b1( #"hash_75f05448c75c06f", #"beach" );
    self thread zm_audio::function_713192b1( #"hash_4c328e01a462f48a", #"ship_stern" );
    self thread zm_audio::function_713192b1( #"hash_5dbcb178cb1573c1", #"ship_bridge" );
    self thread zm_audio::function_713192b1( #"hash_38990c0828e68602", #"ship_bridge" );
    self thread zm_audio::function_713192b1( #"hash_75d26f96a738d2a3", #"ship_main" );
    self thread zm_audio::function_713192b1( #"hash_335d7ee067ac0e68", #"ship_cargo" );
    self thread zm_audio::function_713192b1( #"hash_520e403cdf1ae8", #"facility_main" );
    self thread zm_audio::function_713192b1( #"hash_12750e3f1d3659e4", #"facility_specimen" );
    self thread zm_audio::function_713192b1( #"hash_6571eafdcddb13ab", #"hash_2781f0de96fa6e4e" );
    self thread zm_audio::function_713192b1( #"hash_46ef5a594e42c371", #"facility_infusion" );
    self thread zm_audio::function_713192b1( #"hash_65457ae6fbfe6c32", #"facility_infusion" );
    self thread zm_audio::function_713192b1( #"hash_21450c4a4a6646d6", #"facility_geological" );
    self thread function_f7a190a8( undefined, 15, #"hash_99011c41f3d5380", #"docks" );
}

// Namespace zm_orange_zones/zm_orange_zones
// Params 4
// Checksum 0x57b25690, Offset: 0x2928
// Size: 0x14c
function function_f7a190a8( str_wait_flag, var_ab660f9a, str_location, var_39acfdda )
{
    level endon( #"end_game" );
    self endon( #"death" );
    level flag::wait_till( "start_zombie_round_logic" );
    
    if ( isdefined( str_wait_flag ) )
    {
        level flag::wait_till( str_wait_flag );
    }
    
    if ( isdefined( var_ab660f9a ) )
    {
        wait var_ab660f9a;
    }
    
    for ( var_33625d75 = function_ab7f70b9( self ); var_33625d75 !== str_location ; var_33625d75 = function_ab7f70b9( self ) )
    {
        wait 0.5;
    }
    
    for ( var_33625d75 = function_ab7f70b9( self ); var_33625d75 === str_location ; var_33625d75 = function_ab7f70b9( self ) )
    {
        wait 0.5;
    }
    
    self thread zm_audio::function_713192b1( str_location, var_39acfdda );
}

// Namespace zm_orange_zones/zm_orange_zones
// Params 0
// Checksum 0x96acea37, Offset: 0x2a80
// Size: 0x2a2
function function_9d1d7efd()
{
    level endon( #"end_game" );
    var_de23a374 = array( "lighthouse_level_1", "lighthouse_level_2", "lighthouse_level_3" );
    level waittill( #"start_zombie_round_logic" );
    level flag::wait_till( #"pablo_intro" );
    
    while ( true )
    {
        a_players = [];
        
        foreach ( zone in var_de23a374 )
        {
            a_players = arraycombine( a_players, zm_zonemgr::get_players_in_zone( zone, 1 ), 0, 0 );
        }
        
        if ( a_players.size < 1 )
        {
            break;
        }
        
        waitframe( 1 );
    }
    
    while ( true )
    {
        a_players = [];
        
        foreach ( zone in var_de23a374 )
        {
            a_players = arraycombine( a_players, zm_zonemgr::get_players_in_zone( zone, 1 ), 0, 0 );
        }
        
        if ( a_players.size > 0 && level.pablo_npc.var_f75b1f16.size < 1 )
        {
            if ( a_players[ 0 ] zm_audio::can_speak() && !level flag::get( #"hell_on_earth" ) )
            {
                player = array::random( a_players );
                player thread zm_orange_util::function_51b752a9( #"hash_14a884c0dda265b2", -1, 0, 1 );
                break;
            }
        }
        
        waitframe( 1 );
    }
}

// Namespace zm_orange_zones/zm_orange_zones
// Params 0
// Checksum 0xe067a3b4, Offset: 0x2d30
// Size: 0x19a
function function_58db1b78()
{
    level endon( #"end_game" );
    level waittill( #"start_zombie_round_logic" );
    var_4d44c98e = getentarray( "lighthouse_level_4_ext", "targetname" );
    
    while ( true )
    {
        foreach ( vol_ext in var_4d44c98e )
        {
            foreach ( player in getplayers() )
            {
                if ( player istouching( vol_ext ) )
                {
                    b_played = player zm_audio::create_and_play_dialog( #"location_enter", #"lighthouse_ext" );
                    
                    if ( b_played )
                    {
                        return;
                    }
                }
            }
            
            waitframe( 1 );
        }
    }
}

// Namespace zm_orange_zones/zm_orange_zones
// Params 0
// Checksum 0x1a33baab, Offset: 0x2ed8
// Size: 0x1ac
function function_cbb8e588()
{
    level endon( #"end_game" );
    level waittill( #"start_zombie_round_logic" );
    blood = getent( "mq_blood", "targetname" );
    
    while ( true )
    {
        foreach ( player in getplayers() )
        {
            if ( player zm_zonemgr::get_player_zone() === "artifact_storage" && player cansee( blood ) )
            {
                wait 1;
                
                if ( player cansee( blood ) && player zm_audio::can_speak() && !level flag::get( #"hell_on_earth" ) )
                {
                    player zm_orange_util::function_51b752a9( #"hash_21c0a11438981749" );
                    return;
                }
            }
        }
        
        waitframe( 1 );
    }
}

