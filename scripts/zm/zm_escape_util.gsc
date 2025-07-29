#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\ai_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\values_shared;
#using scripts\zm\zm_escape_travel;
#using scripts\zm_common\util\ai_dog_util;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_characters;
#using scripts\zm_common\zm_crafting;
#using scripts\zm_common\zm_customgame;
#using scripts\zm_common\zm_items;
#using scripts\zm_common\zm_player;
#using scripts\zm_common\zm_round_logic;
#using scripts\zm_common\zm_round_spawning;
#using scripts\zm_common\zm_score;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_vo;
#using scripts\zm_common\zm_zonemgr;

#namespace zm_escape_util;

// Namespace zm_escape_util/zm_escape_util
// Params 0, eflags: 0x2
// Checksum 0x8001814b, Offset: 0x4a0
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"zm_escape_util", &__init__, &__main__, undefined );
}

// Namespace zm_escape_util/zm_escape_util
// Params 0
// Checksum 0x48ef291e, Offset: 0x4f0
// Size: 0x54
function __init__()
{
    level flag::init( #"hash_7039457b1cc827de" );
    level.lighting_state = 0;
    callback::on_connect( &function_6a1500f1 );
}

// Namespace zm_escape_util/zm_escape_util
// Params 0
// Checksum 0x50a78331, Offset: 0x550
// Size: 0x64
function __main__()
{
    level thread function_8164716a();
    level thread catwalk_arm_scene_init();
    level.gravityspike_position_check = &function_ba62dc81;
    level thread function_5d3c7c04();
}

// Namespace zm_escape_util/zm_escape_util
// Params 0
// Checksum 0xb2279edc, Offset: 0x5c0
// Size: 0x104
function init_clientfields()
{
    clientfield::register( "scriptmover", "" + #"hash_7327d0447d656234", 1, 1, "int" );
    clientfield::register( "item", "" + #"hash_76662556681a502c", 1, 1, "int" );
    clientfield::register( "scriptmover", "" + #"hash_59be891b288663cc", 1, 1, "int" );
    clientfield::register( "toplayer", "" + #"hash_257c215ab25a21c5", 1, 1, "counter" );
}

// Namespace zm_escape_util/zm_escape_util
// Params 1
// Checksum 0x9216f0f7, Offset: 0x6d0
// Size: 0x246
function function_28d0cf11( str_script_noteworthy )
{
    audioaudio_cleanup = 0;
    
    switch ( level.activeplayers.size )
    {
        case 1:
            n_multiplier = 3;
            break;
        case 2:
            n_multiplier = 2;
            break;
        case 3:
            n_multiplier = 1;
            break;
        default:
            n_multiplier = 1;
            break;
    }
    
    var_637f088d = zm_round_logic::get_zombie_count_for_round( level.round_number, level.activeplayers.size ) - level.round_number * n_multiplier;
    level.var_c843e795 = var_637f088d;
    
    if ( var_637f088d < 0 )
    {
        var_637f088d = 0;
    }
    else
    {
        switch ( level.activeplayers.size )
        {
            case 1:
                if ( var_637f088d > 36 )
                {
                    var_637f088d = 36;
                }
                
                break;
            case 2:
                if ( var_637f088d > 37 )
                {
                    var_637f088d = 37;
                }
                
                break;
            case 3:
                if ( var_637f088d > 38 )
                {
                    var_637f088d = 38;
                }
                
                break;
            case 4:
                if ( var_637f088d > 39 )
                {
                    var_637f088d = 39;
                }
                
                break;
        }
    }
    
    var_d8036031 = zombie_utility::get_current_zombie_count();
    
    if ( var_d8036031 > var_637f088d )
    {
        audioaudio_cleanup = 1;
    }
    
    return audioaudio_cleanup;
}

// Namespace zm_escape_util/zm_escape_util
// Params 0
// Checksum 0x760f9d7, Offset: 0x920
// Size: 0x38, Type: bool
function function_f79f494e()
{
    var_1ce4fa50 = zombie_utility::get_current_zombie_count();
    
    if ( var_1ce4fa50 >= level.zombie_ai_limit )
    {
        return true;
    }
    
    return false;
}

// Namespace zm_escape_util/zm_escape_util
// Params 2
// Checksum 0x2e4f668a, Offset: 0x960
// Size: 0xce
function function_24d3ec02( str_script_noteworthy, var_a61b5e1 = 0 )
{
    self endon( #"death" );
    
    if ( isdefined( str_script_noteworthy ) )
    {
        self.script_noteworthy = str_script_noteworthy;
    }
    
    self.var_45cec07d = 1;
    self.ignore_enemy_count = 1;
    self.exclude_cleanup_adding_to_total = 1;
    self zombie_utility::set_zombie_run_cycle( "sprint" );
    
    if ( !var_a61b5e1 )
    {
        self zm_score::function_acaab828();
    }
    
    self waittill( #"completed_emerging_into_playable_area" );
    self.no_powerups = 1;
}

// Namespace zm_escape_util/zm_escape_util
// Params 2
// Checksum 0x7fe0d1b2, Offset: 0xa38
// Size: 0x356
function function_7273c33d( s_loc, var_2c30f72f = 1 )
{
    self endon( #"death" );
    self.ignore_find_flesh = 1;
    self.b_ignore_cleanup = 1;
    self.ignore_enemy_count = 1;
    self.exclude_cleanup_adding_to_total = 1;
    self val::set( #"dog_spawn", "ignoreall", 1 );
    self val::set( #"dog_spawn", "ignoreme", 1 );
    self util::magic_bullet_shield();
    self setfreecameralockonallowed( 0 );
    self forceteleport( s_loc.origin, s_loc.angles );
    self ghost();
    playsoundatposition( #"zmb_hellhound_prespawn", s_loc.origin );
    wait 1.5;
    
    if ( var_2c30f72f )
    {
        self clientfield::increment( "dog_spawn_fx" );
        playsoundatposition( #"zmb_hellhound_bolt", s_loc.origin );
    }
    
    earthquake( 0.5, 0.75, s_loc.origin, 1000 );
    playsoundatposition( #"zmb_hellhound_spawn", s_loc.origin );
    assert( isdefined( self ), "<dev string:x38>" );
    assert( isalive( self ), "<dev string:x53>" );
    assert( zm_utility::is_magic_bullet_shield_enabled( self ), "<dev string:x68>" );
    self zombie_dog_util::zombie_setup_attack_properties_dog();
    self util::stop_magic_bullet_shield();
    wait 0.1;
    self show();
    self setfreecameralockonallowed( 1 );
    self val::reset( #"dog_spawn", "ignoreme" );
    self val::reset( #"dog_spawn", "ignoreall" );
    self notify( #"visible" );
}

// Namespace zm_escape_util/zm_escape_util
// Params 0
// Checksum 0x1fd84590, Offset: 0xd98
// Size: 0xbc
function catwalk_arm_scene_init()
{
    scene::add_scene_func( #"aib_vign_tplt_zm_arm_grasp_01", &function_817220a9, "init" );
    scene::add_scene_func( #"aib_vign_tplt_zm_arm_grasp_02", &function_817220a9, "init" );
    var_b959a637 = struct::get_array( "catwalk_arm_scene", "targetname" );
    array::thread_all( var_b959a637, &function_b5ac159d );
}

// Namespace zm_escape_util/zm_escape_util
// Params 1
// Checksum 0x22b576a7, Offset: 0xe60
// Size: 0x274
function function_817220a9( a_ents )
{
    a_ents[ #"arm_grasp" ] setcandamage( 1 );
    a_ents[ #"arm_grasp" ].health = 10000;
    var_44ec6b44 = getent( self.target, "targetname" );
    a_ents[ #"arm_grasp" ].var_ead5d884 = 1;
    
    if ( !zm_utility::is_standard() )
    {
        var_44ec6b44 thread function_1abf5396( a_ents[ #"arm_grasp" ] );
    }
    
    while ( true )
    {
        s_result = a_ents[ #"arm_grasp" ] waittill( #"damage" );
        
        if ( isplayer( s_result.attacker ) && isalive( s_result.attacker ) )
        {
            if ( isdefined( s_result.attacker.var_7e008e0c ) && s_result.attacker.var_7e008e0c > 0 )
            {
                n_points = 10 * s_result.attacker.var_7e008e0c;
            }
            else
            {
                n_points = 10;
            }
            
            s_result.attacker zm_score::add_to_player_score( n_points );
        }
        
        self thread scene::play( "Shot 1" );
        a_ents[ #"arm_grasp" ].var_ead5d884 = 0;
        var_44ec6b44 notify( #"hash_4a3551167bd870c2" );
        break;
    }
    
    level waittill( #"between_round_over" );
    self.t_arm setvisibletoall();
}

// Namespace zm_escape_util/zm_escape_util
// Params 1
// Checksum 0xa0461115, Offset: 0x10e0
// Size: 0x130
function function_1abf5396( var_cba19e17 )
{
    self endon( #"death", #"hash_4a3551167bd870c2" );
    
    while ( true )
    {
        waitresult = self waittill( #"trigger" );
        
        if ( isplayer( waitresult.activator ) && var_cba19e17.var_ead5d884 )
        {
            waitresult.activator dodamage( 10, waitresult.activator.origin );
            waitresult.activator clientfield::increment_to_player( "" + #"hash_257c215ab25a21c5" );
            waitresult.activator playsoundtoplayer( #"hash_75318bcffca7ff06", waitresult.activator );
            wait 4;
        }
        
        wait 0.1;
    }
}

// Namespace zm_escape_util/zm_escape_util
// Params 0
// Checksum 0x3c155aa6, Offset: 0x1218
// Size: 0xb0
function function_b5ac159d()
{
    self.t_arm = spawn( "trigger_radius_new", self.origin, 0, 256, 96 );
    
    while ( true )
    {
        s_result = self.t_arm waittill( #"trigger" );
        
        if ( isplayer( s_result.activator ) )
        {
            self thread scene::init();
            self.t_arm setinvisibletoall();
        }
    }
}

// Namespace zm_escape_util/zm_escape_util
// Params 0
// Checksum 0xec408e31, Offset: 0x12d0
// Size: 0x184
function function_8164716a()
{
    level endon( #"hash_7039457b1cc827de" );
    
    while ( !level flag::get( #"hash_7039457b1cc827de" ) )
    {
        var_5601237b = zm_crafting::function_31d883d7();
        
        foreach ( s_blueprint in var_5601237b )
        {
            if ( s_blueprint.var_54a97edd == getweapon( #"zhield_spectral_dw" ) )
            {
                level flag::set( #"hash_7039457b1cc827de" );
                break;
            }
        }
        
        if ( zm_items::player_has( level.players[ 0 ], zm_crafting::get_component( #"zitem_spectral_shield_part_3" ) ) )
        {
            level flag::set( #"hash_7039457b1cc827de" );
            break;
        }
        
        wait 1;
    }
}

// Namespace zm_escape_util/zm_escape_util
// Params 0
// Checksum 0x33b6a571, Offset: 0x1460
// Size: 0xe0
function function_2def6c82()
{
    a_mdl_parts = getitemarray();
    
    foreach ( mdl_part in a_mdl_parts )
    {
        if ( mdl_part.item == getweapon( #"zitem_spectral_shield_part_2" ) )
        {
            mdl_part clientfield::set( "" + #"hash_76662556681a502c", 1 );
        }
    }
}

// Namespace zm_escape_util/zm_escape_util
// Params 0
// Checksum 0xa964cca6, Offset: 0x1548
// Size: 0x37a
function function_6a1500f1()
{
    level endon( #"hash_40cd2e6f2c496d75" );
    self endon( #"disconnect" );
    a_bad_zones = [];
    a_bad_zones[ 0 ] = "zone_model_industries";
    a_bad_zones[ 1 ] = "zone_studio";
    a_bad_zones[ 2 ] = "zone_citadel_stairs";
    a_bad_zones[ 3 ] = "cellblock_shower";
    a_bad_zones[ 4 ] = "zone_citadel";
    a_bad_zones[ 5 ] = "zone_infirmary";
    a_bad_zones[ 6 ] = "zone_infirmary_roof";
    a_bad_zones[ 7 ] = "zone_citadel_shower";
    level flag::wait_till( "start_zombie_round_logic" );
    var_f3b29ae8 = 0;
    
    while ( true )
    {
        wait randomfloatrange( 1, 20 );
        
        for ( i = 0; i < 2 ; i++ )
        {
            if ( isdefined( self function_3477b4e6( a_bad_zones ) ) && self function_3477b4e6( a_bad_zones ) )
            {
                self.var_3643da89 = 1;
                self util::set_lighting_state( math::clamp( level.lighting_state + 1, 1, 3 ) );
                exploder::exploder( "bx_lightning_setup" );
            }
            
            var_cd6bd640 = randomintrange( 1, 6 );
            
            if ( var_cd6bd640 === var_f3b29ae8 )
            {
                var_cd6bd640 = math::clamp( var_cd6bd640 + 1, 1, 6 );
            }
            
            var_f3b29ae8 = var_cd6bd640;
            exploder::exploder( "fxexp_script_lightning_0" + var_cd6bd640 );
            level thread function_2d4f5b73();
            
            if ( i == 0 )
            {
                wait randomfloatrange( 0.3, 0.8 );
            }
            else
            {
                wait randomfloatrange( 0.2, 0.5 );
            }
            
            if ( isdefined( self.var_3643da89 ) && self.var_3643da89 )
            {
                self util::set_lighting_state( level.lighting_state );
                self.var_3643da89 = undefined;
                exploder::stop_exploder( "bx_lightning_setup" );
            }
            
            exploder::stop_exploder( "fxexp_script_lightning_0" + var_cd6bd640 );
            
            if ( i == 0 )
            {
                wait randomfloatrange( 0.3, 0.5 );
            }
        }
    }
}

// Namespace zm_escape_util/zm_escape_util
// Params 0
// Checksum 0x80bd689e, Offset: 0x18d0
// Size: 0x76
function function_2d4f5b73()
{
    if ( !isdefined( level.var_4b695095 ) )
    {
        level.var_4b695095 = 0;
    }
    
    if ( !level.var_4b695095 )
    {
        level.var_4b695095 = 1;
        playsoundatposition( "amb_thunder_strike_script", ( 6559, 17376, 3893 ) );
        wait 3;
        level.var_4b695095 = 0;
    }
}

// Namespace zm_escape_util/zm_escape_util
// Params 1
// Checksum 0x8deada7, Offset: 0x1950
// Size: 0x4e, Type: bool
function function_3477b4e6( a_bad_zones )
{
    str_zone = self zm_zonemgr::get_player_zone();
    
    if ( isinarray( a_bad_zones, str_zone ) )
    {
        return false;
    }
    
    return true;
}

// Namespace zm_escape_util/zm_escape_util
// Params 0
// Checksum 0xb28185ab, Offset: 0x19a8
// Size: 0xe0
function function_a8024c77()
{
    var_8e8b6c9b = getentarray( "afterlife_shock_box", "targetname" );
    
    foreach ( var_da5e0bea in var_8e8b6c9b )
    {
        if ( !zm_utility::is_standard() )
        {
            var_da5e0bea.var_91e24690 = 1;
            var_da5e0bea thread function_dde2edd8();
            continue;
        }
        
        var_da5e0bea thread function_ad6125f0();
    }
}

// Namespace zm_escape_util/zm_escape_util
// Params 0
// Checksum 0x8053aad6, Offset: 0x1a90
// Size: 0x4c
function function_c2237c03()
{
    self setmodel( #"hash_233df8109c680010" );
    self thread scene::play( #"p8_fxanim_zm_esc_shockbox_bundle", "Activated", self );
}

// Namespace zm_escape_util/zm_escape_util
// Params 0
// Checksum 0xb4824383, Offset: 0x1ae8
// Size: 0x4c
function function_3ef2d2c6()
{
    self setmodel( #"p8_fxanim_zm_esc_shockbox_mod" );
    self thread scene::play( #"p8_fxanim_zm_esc_shockbox_bundle", "Desactivated", self );
}

// Namespace zm_escape_util/zm_escape_util
// Params 0
// Checksum 0x37764462, Offset: 0x1b40
// Size: 0x44
function function_ad6125f0()
{
    self setmodel( #"p8_fxanim_zm_esc_shockbox_damaged_mod" );
    self thread scene::play( #"p8_fxanim_zm_esc_shockbox_damaged_bundle", self );
}

// Namespace zm_escape_util/zm_escape_util
// Params 0
// Checksum 0x2b5a5950, Offset: 0x1b90
// Size: 0x162
function function_dde2edd8()
{
    self endon( #"hash_7f8e7011812dff48" );
    
    while ( isdefined( self.var_91e24690 ) && self.var_91e24690 )
    {
        s_info = self waittill( #"blast_attack" );
        
        if ( self.script_string == "crane_shock_box" )
        {
            level.var_a29d2d8 = s_info.e_player;
        }
        
        if ( isdefined( self.var_8dfa1155 ) && self.var_8dfa1155 )
        {
            continue;
        }
        
        self function_c2237c03();
        self notify( #"hash_7e1d78666f0be68b", { #e_player:s_info.e_player } );
        
        if ( isdefined( self.var_8e350723 ) && self.var_8e350723 )
        {
            self waittilltimeout( 10, #"turn_off" );
        }
        else
        {
            self waittill( #"turn_off" );
        }
        
        self function_3ef2d2c6();
        self notify( #"hash_57de930eb121052f" );
    }
}

// Namespace zm_escape_util/zm_escape_util
// Params 2
// Checksum 0x482dcf72, Offset: 0x1d00
// Size: 0x1be
function function_d89227a0( ent_name, message )
{
    a_ents = getentarray( ent_name, "targetname" );
    
    foreach ( ent in a_ents )
    {
        if ( isdefined( ent ) && isdefined( ent.bundle ) )
        {
            ent thread scene::play( ent.bundle, "OFF", ent );
            waitframe( 1 );
        }
    }
    
    level flag::wait_till( message );
    a_ents = getentarray( ent_name, "targetname" );
    
    foreach ( ent in a_ents )
    {
        if ( isdefined( ent ) && isdefined( ent.bundle ) )
        {
            ent thread scene::play( ent.bundle, "ON", ent );
            waitframe( 1 );
        }
    }
}

// Namespace zm_escape_util/zm_escape_util
// Params 1
// Checksum 0x4b660fc0, Offset: 0x1ec8
// Size: 0x2a4
function function_34b291c3( e_player )
{
    var_1ddd5d18 = array( "zone_cafeteria_end", "zone_cafeteria", "zone_cellblock_east", "zone_cellblock_entrance", "zone_start", "zone_library", "zone_cellblock_west", "zone_broadway_floor_2", "zone_cellblock_west_barber", "zone_cellblock_west_warden" );
    
    if ( ( level flag::get( "gondola_doors_moving" ) || level flag::get( "gondola_in_motion" ) ) && e_player zm_escape_travel::function_9a8ab327() && !self zm_escape_travel::function_9a8ab327() )
    {
        return 0;
    }
    
    if ( ( level flag::get( "gondola_doors_moving" ) || level flag::get( "gondola_in_motion" ) ) && !e_player zm_escape_travel::function_9a8ab327() && self zm_escape_travel::function_9a8ab327() )
    {
        return 0;
    }
    
    if ( isalive( level.var_7b71cdb7 ) && isdefined( level.var_7b71cdb7.b_is_visible ) && level.var_7b71cdb7.b_is_visible )
    {
        str_zone = e_player zm_zonemgr::get_player_zone();
        
        if ( isdefined( str_zone ) && array::contains( var_1ddd5d18, str_zone ) )
        {
            if ( self.archetype === #"zombie" )
            {
                if ( e_player === level.var_7b71cdb7 )
                {
                    return 1;
                }
                else
                {
                    return 0;
                }
            }
            else if ( self.archetype === #"zombie_dog" || self.archetype === #"brutus" )
            {
                if ( e_player === level.var_7b71cdb7 )
                {
                    return 0;
                }
                else
                {
                    return 1;
                }
            }
            
            return 1;
        }
        else
        {
            return 1;
        }
        
        return;
    }
    
    return 1;
}

// Namespace zm_escape_util/zm_escape_util
// Params 0
// Checksum 0x4c33ba87, Offset: 0x2178
// Size: 0x282
function function_cd3a65e0()
{
    switch ( level.dog_round_count )
    {
        case 2:
            level.next_dog_round = level.round_number + randomintrangeinclusive( 5, 7 );
            zm_round_spawning::function_376e51ef( #"zombie_dog", level.next_dog_round + 1 );
            break;
        case 3:
            level.next_dog_round = level.round_number + randomintrangeinclusive( 6, 8 );
            break;
        case 4:
            level.next_dog_round = level.round_number + randomintrangeinclusive( 7, 9 );
            break;
        default:
            level.next_dog_round = level.round_number + randomintrangeinclusive( 8, 10 );
            break;
    }
    
    foreach ( e_player in util::get_active_players() )
    {
        if ( e_player flag::exists( #"hash_120fbb364796cd32" ) && e_player flag::exists( #"hash_11ab20934759ebc3" ) && e_player flag::get( #"hash_120fbb364796cd32" ) && !e_player flag::get( #"hash_11ab20934759ebc3" ) )
        {
            level.next_dog_round = level.round_number + randomintrangeinclusive( 5, 7 );
        }
    }
}

// Namespace zm_escape_util/zm_escape_util
// Params 0
// Checksum 0xc6703ac8, Offset: 0x2408
// Size: 0x55a
function dog_spawn_func()
{
    s_spawn_loc = undefined;
    target = zombie_dog_util::function_a5abd591();
    
    if ( !isdefined( target ) )
    {
        return undefined;
    }
    
    if ( level.zm_loc_types[ #"dog_location" ].size > 0 )
    {
        zone_tag = target zm_zonemgr::get_player_zone();
        
        if ( !isdefined( zone_tag ) )
        {
            return undefined;
        }
        
        target_zone = level.zones[ zone_tag ];
        adj_zone_names = getarraykeys( target_zone.adjacent_zones );
        var_2057a8c1 = array( target_zone.name );
        
        foreach ( zone_name in adj_zone_names )
        {
            if ( target_zone.adjacent_zones[ zone_name ].is_connected )
            {
                if ( !isdefined( var_2057a8c1 ) )
                {
                    var_2057a8c1 = [];
                }
                else if ( !isarray( var_2057a8c1 ) )
                {
                    var_2057a8c1 = array( var_2057a8c1 );
                }
                
                var_2057a8c1[ var_2057a8c1.size ] = level.zones[ zone_name ].name;
            }
        }
        
        var_905a9429 = [];
        var_51fb0ec7 = [];
        players = getplayers();
        
        foreach ( loc in level.zm_loc_types[ #"dog_location" ] )
        {
            if ( array::contains( var_2057a8c1, loc.zone_name ) )
            {
                spawn_list = 0;
                
                foreach ( player in players )
                {
                    if ( isdefined( player.am_i_valid ) && player.am_i_valid )
                    {
                        sqr_dist = distancesquared( loc.origin, player.origin );
                        
                        if ( sqr_dist < 9000000 )
                        {
                            if ( sqr_dist > 1000000 && spawn_list != 2 )
                            {
                                spawn_list = 1;
                                continue;
                            }
                            
                            if ( sqr_dist > 250000 )
                            {
                                spawn_list = 2;
                                continue;
                            }
                            
                            spawn_list = 0;
                            break;
                        }
                    }
                }
                
                if ( spawn_list == 1 )
                {
                    if ( !isdefined( var_905a9429 ) )
                    {
                        var_905a9429 = [];
                    }
                    else if ( !isarray( var_905a9429 ) )
                    {
                        var_905a9429 = array( var_905a9429 );
                    }
                    
                    var_905a9429[ var_905a9429.size ] = loc;
                    continue;
                }
                
                if ( spawn_list == 2 )
                {
                    if ( !isdefined( var_51fb0ec7 ) )
                    {
                        var_51fb0ec7 = [];
                    }
                    else if ( !isarray( var_51fb0ec7 ) )
                    {
                        var_51fb0ec7 = array( var_51fb0ec7 );
                    }
                    
                    var_51fb0ec7[ var_51fb0ec7.size ] = loc;
                }
            }
        }
        
        if ( var_905a9429.size < 3 )
        {
            foreach ( loc in var_51fb0ec7 )
            {
                if ( !isdefined( var_905a9429 ) )
                {
                    var_905a9429 = [];
                }
                else if ( !isarray( var_905a9429 ) )
                {
                    var_905a9429 = array( var_905a9429 );
                }
                
                var_905a9429[ var_905a9429.size ] = loc;
            }
        }
        
        s_spawn_loc = array::random( var_905a9429 );
    }
    
    return s_spawn_loc;
}

// Namespace zm_escape_util/zm_escape_util
// Params 0
// Checksum 0xa86cd061, Offset: 0x2970
// Size: 0x22
function function_e270dfe4()
{
    if ( isdefined( self.var_16735873 ) && self.var_16735873 )
    {
        return 0;
    }
    
    return undefined;
}

// Namespace zm_escape_util/zm_escape_util
// Params 0
// Checksum 0x1ae43e92, Offset: 0x29a0
// Size: 0x12c
function make_wobble()
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
    wait randomfloat( waittime - 0.1 );
}

// Namespace zm_escape_util/zm_escape_util
// Params 0, eflags: 0x4
// Checksum 0x8a80b7da, Offset: 0x2ad8
// Size: 0x60, Type: bool
function private function_ba62dc81()
{
    if ( isdefined( level.e_gondola ) && isdefined( level.e_gondola.t_ride ) && self istouching( level.e_gondola.t_ride ) )
    {
        return false;
    }
    
    return true;
}

// Namespace zm_escape_util/zm_escape_util
// Params 0
// Checksum 0x6136e4b, Offset: 0x2b40
// Size: 0x1b0
function function_2f9d355c()
{
    foreach ( e_player in level.players )
    {
        if ( e_player inlaststand() )
        {
            e_player reviveplayer();
            e_player notify( #"stop_revive_trigger" );
            
            if ( isdefined( e_player.revivetrigger ) )
            {
                e_player.revivetrigger delete();
                e_player.revivetrigger = undefined;
            }
            
            e_player allowjump( 1 );
            e_player val::reset( #"laststand", "ignoreme" );
            e_player.laststand = undefined;
            e_player clientfield::set( "zmbLastStand", 0 );
            e_player notify( #"player_revived", { #reviver:self } );
            continue;
        }
        
        if ( e_player util::is_spectating() )
        {
            e_player thread zm_player::spectator_respawn_player();
        }
    }
}

// Namespace zm_escape_util/zm_escape_util
// Params 2
// Checksum 0xa2b0bb77, Offset: 0x2cf8
// Size: 0xdc
function function_37aed203( var_f1404f73, b_use_spawn_fx = 1 )
{
    var_f1404f73.var_db8b3627 = 1;
    
    if ( b_use_spawn_fx )
    {
        var_f1404f73 clientfield::set( "brutus_spawn_clientfield", 0 );
    }
    
    waitframe( 1 );
    var_61a5b0ea = struct::get( "s_teleport_br_kill" );
    var_f1404f73 forceteleport( var_61a5b0ea.origin );
    wait 0.1;
    
    if ( isalive( var_f1404f73 ) )
    {
        var_f1404f73 kill();
    }
}

// Namespace zm_escape_util/zm_escape_util
// Params 1
// Checksum 0xf21d51a, Offset: 0x2de0
// Size: 0x17c
function function_67710e66( b_enable = 0 )
{
    if ( !b_enable )
    {
        level zm_audio::function_6191af93( #"brutus", #"react", "", "" );
        level zm_audio::function_6191af93( #"brutus", #"helm_off", "", "" );
        level zm_audio::function_6191af93( #"brutus", #"smoke_react", "", "" );
        return;
    }
    
    level zm_audio::function_e1666976( #"brutus", #"react" );
    level zm_audio::function_e1666976( #"brutus", #"helm_off" );
    level zm_audio::function_e1666976( #"brutus", #"smoke_react" );
}

// Namespace zm_escape_util/zm_escape_util
// Params 0, eflags: 0x4
// Checksum 0x280c7a2b, Offset: 0x2f68
// Size: 0x160
function private function_5d3c7c04()
{
    while ( true )
    {
        s_result = level waittill( #"brutus_locked", #"unlock_purchased" );
        
        if ( s_result.s_stub.targetname !== "crafting_trigger" )
        {
            continue;
        }
        
        if ( s_result._notify == #"brutus_locked" )
        {
            var_89ddd572 = util::spawn_model( "tag_origin", s_result.s_stub.origin, s_result.s_stub.angles );
            var_89ddd572 clientfield::set( "" + #"hash_59be891b288663cc", 1 );
            continue;
        }
        
        if ( isdefined( var_89ddd572 ) )
        {
            var_89ddd572 clientfield::set( "" + #"hash_59be891b288663cc", 0 );
            var_89ddd572 delete();
        }
    }
}

