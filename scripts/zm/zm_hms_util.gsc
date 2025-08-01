#using scripts\core_common\aat_shared;
#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\callbacks;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_characters;
#using scripts\zm_common\zm_devgui;
#using scripts\zm_common\zm_round_logic;
#using scripts\zm_common\zm_score;
#using scripts\zm_common\zm_spawner;
#using scripts\zm_common\zm_unitrigger;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_vo;
#using scripts\zm_common\zm_zonemgr;

#namespace zm_hms_util;

// Namespace zm_hms_util/zm_hms_util
// Params 0, eflags: 0x2
// Checksum 0x15a874c2, Offset: 0x1b8
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zm_hms_util", &__init__, undefined, undefined );
}

// Namespace zm_hms_util/zm_hms_util
// Params 0
// Checksum 0x739d4d65, Offset: 0x200
// Size: 0x104
function __init__()
{
    /#
        if ( getdvarint( #"hash_79f58c97fc43e423", 0 ) )
        {
            level thread function_774b42ac();
        }
        
        if ( getdvarint( #"debug_event_log", 0 ) )
        {
            level.var_df9f1a00 = [];
            callback::on_ai_spawned( &function_df54cbcd );
            callback::on_ai_killed( &function_86b062a6 );
            callback::function_74872db6( &function_acd2ba83 );
            level thread function_84b292b4();
        }
        
        level thread devgui();
    #/
}

// Namespace zm_hms_util/zm_hms_util
// Params 3
// Checksum 0x31b2d2c, Offset: 0x310
// Size: 0x14c
function function_e308175e( alias, v_pos, e_player )
{
    n_wait_time = float( soundgetplaybacktime( alias ) ) / 1000;
    
    if ( isdefined( e_player ) && isplayer( e_player ) && isalive( e_player ) )
    {
        if ( isentity( self ) )
        {
            self playsoundtoplayer( alias, e_player );
        }
        else
        {
            e_tag = util::spawn_model( "tag_origin", v_pos );
            e_tag playsoundtoplayer( alias, e_player );
        }
    }
    else
    {
        playsoundatposition( alias, v_pos );
    }
    
    wait n_wait_time;
    
    if ( isdefined( e_tag ) )
    {
        e_tag delete();
    }
}

// Namespace zm_hms_util/zm_hms_util
// Params 2
// Checksum 0xcaa4de7e, Offset: 0x468
// Size: 0x88
function function_52c3fe8d( a_audio, v_pos )
{
    foreach ( audio in a_audio )
    {
        function_e308175e( audio, v_pos );
    }
}

// Namespace zm_hms_util/zm_hms_util
// Params 3
// Checksum 0xe6983625, Offset: 0x4f8
// Size: 0x7a
function function_d6dadf85( alias, player, entity )
{
    n_wait_time = float( soundgetplaybacktime( alias ) ) / 1000;
    entity playsoundtoplayer( alias, player );
    wait n_wait_time;
}

// Namespace zm_hms_util/zm_hms_util
// Params 3
// Checksum 0x58c0e04, Offset: 0x580
// Size: 0x98
function function_80f6206e( a_audio, player, entity )
{
    foreach ( audio in a_audio )
    {
        function_d6dadf85( audio, player, entity );
    }
}

// Namespace zm_hms_util/zm_hms_util
// Params 4
// Checksum 0x9bbd7201, Offset: 0x620
// Size: 0xc4
function function_fd24e47f( str_alias, n_variant = int( -1 ), b_wait_if_busy = 0, var_a97d4e32 = 0 )
{
    level endon( #"game_ended" );
    player = function_3815943c();
    
    if ( isdefined( player ) )
    {
        player function_51b752a9( str_alias, n_variant, b_wait_if_busy, var_a97d4e32 );
    }
}

// Namespace zm_hms_util/zm_hms_util
// Params 4
// Checksum 0xbacae611, Offset: 0x6f0
// Size: 0x22c
function function_51b752a9( str_alias, n_variant = int( -1 ), b_wait_if_busy = 0, var_a97d4e32 = 0 )
{
    if ( isdefined( level.var_3c9cfd6f ) && level.var_3c9cfd6f || !isdefined( self ) )
    {
        return;
    }
    
    level endon( #"game_ended" );
    self endon( #"player_downed", #"death", #"disconnect" );
    
    if ( !zm_utility::is_player_valid( self ) )
    {
        return;
    }
    
    if ( var_a97d4e32 )
    {
        self.last_vo_played_time = 0;
    }
    
    if ( n_variant < 0 )
    {
        self zm_vo::function_a2bd5a0c( str_alias, 0, b_wait_if_busy );
        return;
    }
    
    n_index = zm_characters::function_dc232a80();
    str_vo_alias = str_alias + "_plr_" + n_index + "_" + n_variant;
    
    if ( b_wait_if_busy )
    {
        self notify( #"hash_7efd5bdf8133ff7b" );
        self endon( #"hash_7efd5bdf8133ff7b" );
        var_215d4efb = b_wait_if_busy == 2 ? 1 : 0;
        
        while ( !zm_audio::can_speak( self.toself, var_215d4efb ) )
        {
            waitframe( 1 );
            waittillframeend();
        }
    }
    
    if ( !zm_audio::can_speak( self.toself ) )
    {
        return 0;
    }
    
    self zm_audio::do_player_or_npc_playvox( str_vo_alias );
}

// Namespace zm_hms_util/zm_hms_util
// Params 4
// Checksum 0xfa0b44e5, Offset: 0x928
// Size: 0x294
function function_6a0d675d( str_alias, n_variant = int( -1 ), b_wait_if_busy = 0, var_a97d4e32 = 0 )
{
    if ( isdefined( level.var_3c9cfd6f ) && level.var_3c9cfd6f || game.state == "postgame" )
    {
        return;
    }
    
    level endon( #"game_ended" );
    self endon( #"death" );
    
    if ( b_wait_if_busy )
    {
        self notify( #"hash_7efd5bdf8133ff7b" );
        self endon( #"hash_7efd5bdf8133ff7b" );
        var_215d4efb = b_wait_if_busy == 2 ? 1 : 0;
        
        while ( !zm_audio::can_speak( self.toself, var_215d4efb ) )
        {
            waitframe( 1 );
            waittillframeend();
        }
    }
    else if ( !self zm_audio::can_speak() )
    {
        return;
    }
    
    if ( var_a97d4e32 )
    {
        self.last_vo_played_time = 0;
    }
    
    str_vo_alias = str_alias;
    
    if ( isdefined( self.name ) )
    {
        str_vo_alias = str_alias + "_" + self.name;
    }
    
    if ( n_variant < 0 )
    {
        str_vo_alias = array::random( zm_audio::get_valid_lines( str_vo_alias ) );
    }
    else
    {
        str_vo_alias = str_vo_alias + "_" + n_variant;
    }
    
    if ( !isdefined( level.var_62281818 ) )
    {
        level.var_62281818 = [];
    }
    else if ( !isarray( level.var_62281818 ) )
    {
        level.var_62281818 = array( level.var_62281818 );
    }
    
    level.var_62281818[ level.var_62281818.size ] = self;
    self zm_audio::do_player_or_npc_playvox( str_vo_alias );
}

// Namespace zm_hms_util/zm_hms_util
// Params 0
// Checksum 0xc851b75d, Offset: 0xbc8
// Size: 0x54
function function_3c173d37()
{
    level notify( #"hash_1a91b42d31e0b28d" );
    level zm_vo::function_3c173d37( ( 0, 0, 0 ), 2147483647 );
    level function_29fe9a5d();
}

// Namespace zm_hms_util/zm_hms_util
// Params 0
// Checksum 0xfa018e6, Offset: 0xc28
// Size: 0xc0
function function_29fe9a5d()
{
    self notify( "c3b9aba044301cd" );
    self endon( "c3b9aba044301cd" );
    var_d2d5e742 = arraycopy( level.var_62281818 );
    
    foreach ( npc in var_d2d5e742 )
    {
        if ( isdefined( npc ) )
        {
            npc zm_vo::vo_stop();
        }
    }
}

// Namespace zm_hms_util/zm_hms_util
// Params 1
// Checksum 0xc714918e, Offset: 0xcf0
// Size: 0x132
function function_3815943c( a_players )
{
    players = getplayers();
    
    if ( isdefined( a_players ) )
    {
        players = a_players;
    }
    
    valid_players = [];
    
    foreach ( player in players )
    {
        if ( zm_utility::is_player_valid( player ) )
        {
            if ( !isdefined( valid_players ) )
            {
                valid_players = [];
            }
            else if ( !isarray( valid_players ) )
            {
                valid_players = array( valid_players );
            }
            
            valid_players[ valid_players.size ] = player;
        }
    }
    
    if ( valid_players.size > 0 )
    {
        return array::random( valid_players );
    }
    
    return;
}

// Namespace zm_hms_util/zm_hms_util
// Params 1
// Checksum 0x983c3434, Offset: 0xe30
// Size: 0x9c, Type: bool
function function_2270b2c8( var_6d71e83a )
{
    if ( isarray( var_6d71e83a ) )
    {
        foreach ( value in var_6d71e83a )
        {
            if ( !isdefined( value ) )
            {
                return true;
            }
        }
        
        return false;
    }
    
    return !isdefined( var_6d71e83a );
}

// Namespace zm_hms_util/zm_hms_util
// Params 2
// Checksum 0xf7e9037, Offset: 0xed8
// Size: 0x9c
function function_dc51a40( var_2a7487f4, str_key )
{
    coded_array = [];
    
    foreach ( entity in var_2a7487f4 )
    {
        coded_array[ entity.( str_key ) ] = entity;
    }
    
    return coded_array;
}

// Namespace zm_hms_util/zm_hms_util
// Params 3
// Checksum 0x903b50e5, Offset: 0xf80
// Size: 0x5a
function function_bffcedde( get_value, get_key, code_key )
{
    temp_array = getentarray( get_value, get_key );
    temp_array = function_dc51a40( temp_array, code_key );
    return temp_array;
}

// Namespace zm_hms_util/zm_hms_util
// Params 3
// Checksum 0x41cc08d7, Offset: 0xfe8
// Size: 0x5a
function function_2719d4c0( get_value, get_key, code_key )
{
    temp_array = struct::get_array( get_value, get_key );
    temp_array = function_dc51a40( temp_array, code_key );
    return temp_array;
}

// Namespace zm_hms_util/zm_hms_util
// Params 0
// Checksum 0xe08b848e, Offset: 0x1050
// Size: 0x4a
function get_player_index()
{
    for ( i = 0; i < level.activeplayers.size ; i++ )
    {
        if ( self == level.activeplayers[ i ] )
        {
            return i;
        }
    }
}

// Namespace zm_hms_util/zm_hms_util
// Params 1
// Checksum 0xec317037, Offset: 0x10a8
// Size: 0x54
function function_8bda2199( v_pos )
{
    a_ai_zombies = getaiteamarray( level.zombie_team );
    
    if ( a_ai_zombies.size > 0 )
    {
        return arraygetclosest( v_pos, a_ai_zombies );
    }
}

// Namespace zm_hms_util/zm_hms_util
// Params 0
// Checksum 0x52a6d510, Offset: 0x1108
// Size: 0x52
function function_e1015abd()
{
    v_angles = ( randomfloatrange( 0, 360 ), randomfloatrange( 0, 360 ), 0 );
    return anglestoforward( v_angles );
}

// Namespace zm_hms_util/zm_hms_util
// Params 0
// Checksum 0xfed8e9e5, Offset: 0x1168
// Size: 0x3a
function function_b649cf93()
{
    v_angles = ( 0, randomfloatrange( 0, 360 ), 0 );
    return anglestoforward( v_angles );
}

// Namespace zm_hms_util/zm_hms_util
// Params 2
// Checksum 0xd353277a, Offset: 0x11b0
// Size: 0x20a
function function_b2e1326( var_58df9892, var_1dc9c1bf = 1 )
{
    switch ( var_58df9892 )
    {
        case 0:
            self sethintstring( #"zombie/trap_locked" );
            break;
        case 1:
            self sethintstring( #"zombie/need_power" );
            break;
        case 2:
            if ( util::get_game_type() == "zstandard" )
            {
                if ( function_8b1a219a() )
                {
                    self sethintstring( #"hash_61d85c966dd9e83f" );
                }
                else
                {
                    self sethintstring( #"hash_24a438482954901" );
                }
            }
            else if ( function_8b1a219a() )
            {
                self sethintstring( #"hash_6e8ef1b690e98e51", var_1dc9c1bf );
            }
            else
            {
                self sethintstring( #"hash_23c1c09e94181fdb", var_1dc9c1bf );
            }
            
            break;
        case 3:
            self sethintstring( #"zombie/trap_active" );
            break;
        case 4:
            self sethintstring( #"zombie/trap_cooldown" );
            break;
    }
}

// Namespace zm_hms_util/zm_hms_util
// Params 2
// Checksum 0x397828ae, Offset: 0x13c8
// Size: 0x6c, Type: bool
function function_fab5fb4d( w_weapon, var_c4c6c433 )
{
    if ( isplayer( self ) )
    {
        var_1590457 = self aat::getaatonweapon( w_weapon, 1 );
        
        if ( var_1590457 === var_c4c6c433 )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace zm_hms_util/zm_hms_util
// Params 1
// Checksum 0xa9d5c0b3, Offset: 0x1440
// Size: 0x52, Type: bool
function function_69320b44( var_c4c6c433 )
{
    e_player = isdefined( self.attacker ) ? self.attacker : self.eattacker;
    return e_player function_fab5fb4d( self.weapon, var_c4c6c433 );
}

// Namespace zm_hms_util/zm_hms_util
// Params 2
// Checksum 0x250507c4, Offset: 0x14a0
// Size: 0x58
function function_7c15625f( str_fx, v_pos )
{
    fx_ent = util::spawn_model( "tag_origin", v_pos );
    playfxontag( str_fx, fx_ent, "tag_origin" );
    return fx_ent;
}

// Namespace zm_hms_util/zm_hms_util
// Params 2
// Checksum 0x831cea65, Offset: 0x1500
// Size: 0x104
function function_91a84161( w_weapon, n_total_ammo )
{
    if ( n_total_ammo == 0 )
    {
        self setweaponammostock( w_weapon, 0 );
        self setweaponammoclip( w_weapon, 0 );
        return;
    }
    
    n_clip_size = self getweaponammoclipsize( w_weapon );
    
    if ( n_total_ammo < n_clip_size )
    {
        self setweaponammostock( w_weapon, 0 );
        self setweaponammoclip( w_weapon, n_total_ammo );
        return;
    }
    
    n_stock_ammo = n_total_ammo - n_clip_size;
    self setweaponammostock( w_weapon, n_stock_ammo );
    self setweaponammoclip( w_weapon, n_clip_size );
}

// Namespace zm_hms_util/zm_hms_util
// Params 2
// Checksum 0x25c24027, Offset: 0x1610
// Size: 0xdc
function function_2ba419ee( var_53458a86 = 1, round = level.round_number )
{
    level.zombie_total = 0;
    level.zombie_health = zombie_utility::ai_calculate_health( zombie_utility::get_zombie_var( #"zombie_health_start" ), round );
    zm_round_logic::set_round_number( round );
    level notify( #"kill_round" );
    level zm_utility::function_9ad5aeb1( 1, 1, 0, var_53458a86, 1 );
}

// Namespace zm_hms_util/zm_hms_util
// Params 2
// Checksum 0x5b499247, Offset: 0x16f8
// Size: 0xbc
function pause_zombies( b_pause = 1, var_53458a86 = 1 )
{
    if ( b_pause )
    {
        level.disable_nuke_delay_spawning = 1;
        level flag::clear( "spawn_zombies" );
        level zm_utility::function_9ad5aeb1( 1, 1, 0, var_53458a86, 0 );
        return;
    }
    
    level.disable_nuke_delay_spawning = 0;
    level flag::set( "spawn_zombies" );
}

// Namespace zm_hms_util/zm_hms_util
// Params 2
// Checksum 0x9dedb5a2, Offset: 0x17c0
// Size: 0x5a
function function_3d636893( str_value, str_key = "targetname" )
{
    a_ents = getentarray( str_value, str_key );
    return array::random( a_ents );
}

// Namespace zm_hms_util/zm_hms_util
// Params 2
// Checksum 0xc3b1eabd, Offset: 0x1828
// Size: 0x5a
function function_4e7f5b2e( str_value, str_key = "targetname" )
{
    a_structs = struct::get_array( str_value, str_key );
    return array::random( a_structs );
}

// Namespace zm_hms_util/zm_hms_util
// Params 0
// Checksum 0x9f908dd5, Offset: 0x1890
// Size: 0xb4, Type: bool
function function_b8a27acc()
{
    a_e_players = getplayers();
    
    foreach ( e_player in a_e_players )
    {
        if ( zm_utility::is_player_valid( e_player ) && e_player istouching( self ) )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace zm_hms_util/zm_hms_util
// Params 2
// Checksum 0x9577dbbc, Offset: 0x1950
// Size: 0xdc
function function_6d41bab8( v_pos, n_radius )
{
    if ( isdefined( v_pos ) )
    {
        v_drop_point = function_9cc082d2( v_pos, 64 );
        
        if ( isdefined( v_drop_point ) && zm_utility::check_point_in_playable_area( v_drop_point[ #"point" ] ) )
        {
            return v_drop_point[ #"point" ];
        }
        
        if ( !isdefined( v_drop_point ) && isdefined( n_radius ) )
        {
            var_de3c569e = getclosestpointonnavmesh( v_pos, n_radius, 16 );
            
            if ( zm_utility::check_point_in_playable_area( var_de3c569e ) )
            {
                return var_de3c569e;
            }
        }
    }
}

// Namespace zm_hms_util/zm_hms_util
// Params 1
// Checksum 0x9f01c78f, Offset: 0x1a38
// Size: 0x35c
function function_45bb11e4( spot )
{
    self endoncallback( &zm_spawner::function_fe3cb19a, #"death" );
    self.var_5535a47d = 1;
    self zm_spawner::function_fe3cb19a();
    self.mdl_anchor = util::spawn_model( "tag_origin", self.origin, self.angles );
    self ghost();
    
    if ( !isdefined( spot.angles ) )
    {
        spot.angles = ( 0, 0, 0 );
    }
    
    self.mdl_anchor moveto( spot.origin, 0.05 );
    self.mdl_anchor rotateto( spot.angles, 0.05 );
    self.mdl_anchor waittill( #"movedone", #"death" );
    waitframe( 1 );
    self.create_eyes = 1;
    self show();
    
    if ( !isdefined( self.var_9ed3cc11 ) )
    {
        self.var_9ed3cc11 = self function_e827fc0e();
    }
    
    self pushplayer( 1 );
    e_align = isdefined( self.mdl_anchor ) ? self.mdl_anchor : spot;
    str_shot_name = "default";
    
    if ( isdefined( self.archetype ) )
    {
        switch ( self.archetype )
        {
            case #"nova_crawler":
                str_shot_name = "nova_crawler";
                break;
        }
    }
    
    if ( str_shot_name == "default" && ( self.has_legs === 0 || self.missing_legs === 1 ) )
    {
        str_shot_name = "crawler";
    }
    
    if ( isinarray( scene::get_all_shot_names( spot.scriptbundlename ), str_shot_name ) )
    {
        e_align scene::play( spot.scriptbundlename, str_shot_name, self );
    }
    else
    {
        e_align scene::play( spot.scriptbundlename, self );
    }
    
    if ( isdefined( self.var_9ed3cc11 ) )
    {
        self pushplayer( self.var_9ed3cc11 );
        self.var_9ed3cc11 = undefined;
    }
    
    self.var_5535a47d = 0;
    self thread zm_spawner::function_2d97cae1();
    self notify( #"risen", spot.script_string );
    self zm_spawner::zombie_complete_emerging_into_playable_area();
}

// Namespace zm_hms_util/zm_hms_util
// Params 1
// Checksum 0x55cb4128, Offset: 0x1da0
// Size: 0xca
function function_9258efe1( str_zone )
{
    var_cb24ec97 = 1;
    
    foreach ( e_player in getplayers() )
    {
        var_bdf9e3c2 = e_player zm_zonemgr::get_player_zone();
        
        if ( !isdefined( var_bdf9e3c2 ) || var_bdf9e3c2 != str_zone )
        {
            var_cb24ec97 = 0;
            break;
        }
    }
    
    return var_cb24ec97;
}

// Namespace zm_hms_util/zm_hms_util
// Params 1
// Checksum 0xf19be770, Offset: 0x1e78
// Size: 0xbc
function any_player_in_zone( a_str_zones )
{
    if ( isarray( a_str_zones ) )
    {
        foreach ( str_zone in a_str_zones )
        {
            if ( zm_zonemgr::any_player_in_zone( str_zone ) )
            {
                return 1;
            }
        }
        
        return 0;
    }
    
    return zm_zonemgr::any_player_in_zone( a_str_zones );
}

// Namespace zm_hms_util/zm_hms_util
// Params 2
// Checksum 0x262bab47, Offset: 0x1f40
// Size: 0x4a
function function_f9b8c5b6( array, key )
{
    a_keys = getarraykeys( array );
    return isinarray( a_keys, key );
}

// Namespace zm_hms_util/zm_hms_util
// Params 2
// Checksum 0xf4e2d8cc, Offset: 0x1f98
// Size: 0xc0
function function_a496116d( e_player, n_cost )
{
    if ( e_player zm_score::can_player_purchase( n_cost ) )
    {
        e_player zm_score::minus_to_player_score( n_cost );
        self zm_utility::play_sound_on_ent( "purchase" );
        return 1;
    }
    
    self zm_utility::play_sound_on_ent( "no_purchase" );
    e_player zm_audio::create_and_play_dialog( #"general", #"outofmoney" );
    return 0;
}

// Namespace zm_hms_util/zm_hms_util
// Params 0
// Checksum 0xa0632c4b, Offset: 0x2060
// Size: 0x26
function function_7a5ba111()
{
    zm_unitrigger::unregister_unitrigger( self.s_unitrigger );
    self.s_unitrigger = undefined;
}

// Namespace zm_hms_util/zm_hms_util
// Params 3
// Checksum 0x2c0e19b9, Offset: 0x2090
// Size: 0x120
function function_795d5b4f( a_e_ents, v_pos, n_radius )
{
    n_radius_sqr = n_radius * n_radius;
    a_e_targets = [];
    
    foreach ( e_ent in a_e_ents )
    {
        if ( distancesquared( v_pos, e_ent.origin ) <= n_radius_sqr )
        {
            if ( !isdefined( a_e_targets ) )
            {
                a_e_targets = [];
            }
            else if ( !isarray( a_e_targets ) )
            {
                a_e_targets = array( a_e_targets );
            }
            
            a_e_targets[ a_e_targets.size ] = e_ent;
        }
    }
    
    return a_e_targets;
}

// Namespace zm_hms_util/zm_hms_util
// Params 4
// Checksum 0x1e7b97ee, Offset: 0x21b8
// Size: 0x124
function function_6099877a( n_radius = 96, str_endon, str_hint = "", var_a33304ba = "" )
{
    s_unitrigger = self zm_unitrigger::function_a7620bfb( n_radius, 0 );
    zm_unitrigger::unitrigger_set_hint_string( s_unitrigger, zm_utility::function_d6046228( str_hint, var_a33304ba ) );
    s_unitrigger.related_parent = self;
    zm_unitrigger::register_static_unitrigger( s_unitrigger, &function_715588b3 );
    
    if ( isdefined( str_endon ) )
    {
        level endon( str_endon );
        level thread function_f4482deb( s_unitrigger, str_endon );
    }
    
    s_unitrigger waittill( #"hash_4993ab35c53e0b5c" );
}

// Namespace zm_hms_util/zm_hms_util
// Params 0
// Checksum 0xebbe86f4, Offset: 0x22e8
// Size: 0x22c
function function_715588b3()
{
    self endon( #"death" );
    s_unitrigger = self.stub;
    
    while ( true )
    {
        self waittill( #"trigger" );
        b_using = 1;
        n_time = 0;
        
        while ( n_time < 0.5 )
        {
            foreach ( player in util::get_active_players() )
            {
                if ( player util::is_spectating() )
                {
                    continue;
                }
                
                if ( !player usebuttonpressed() || !zm_utility::can_use( player ) || player isinmovemode( "ufo", "noclip" ) || !player istouching( self ) )
                {
                    b_using = 0;
                    n_time = 0;
                    break;
                }
            }
            
            if ( b_using == 0 || util::get_active_players().size == 0 )
            {
                break;
            }
            
            wait 0.1;
            n_time += 0.1;
        }
        
        if ( b_using == 1 )
        {
            break;
        }
        
        wait 0.1;
    }
    
    s_unitrigger notify( #"hash_4993ab35c53e0b5c" );
    zm_unitrigger::unregister_unitrigger( s_unitrigger );
}

// Namespace zm_hms_util/zm_hms_util
// Params 2
// Checksum 0xa3e88ba8, Offset: 0x2520
// Size: 0x4c
function function_f4482deb( s_unitrigger, str_endon )
{
    s_unitrigger endon( #"hash_4993ab35c53e0b5c" );
    level waittill( str_endon );
    zm_unitrigger::unregister_unitrigger( s_unitrigger );
}

// Namespace zm_hms_util/zm_hms_util
// Params 2
// Checksum 0x84250654, Offset: 0x2578
// Size: 0x74
function function_49dc915f( n_distance, n_move_time )
{
    vector = anglestoforward( self.angles );
    vector = n_distance * vector;
    goal_pos = self.origin + vector;
    self moveto( goal_pos, n_move_time );
}

// Namespace zm_hms_util/zm_hms_util
// Params 2
// Checksum 0xff23268a, Offset: 0x25f8
// Size: 0x74
function function_5c1535d0( n_distance, n_move_time )
{
    vector = anglestoright( self.angles );
    vector = n_distance * vector;
    goal_pos = self.origin + vector;
    self moveto( goal_pos, n_move_time );
}

// Namespace zm_hms_util/zm_hms_util
// Params 2
// Checksum 0xc5eb98f0, Offset: 0x2678
// Size: 0x74
function function_dc4ab629( n_distance, n_move_time )
{
    vector = anglestoup( self.angles );
    vector = n_distance * vector;
    goal_pos = self.origin + vector;
    self moveto( goal_pos, n_move_time );
}

// Namespace zm_hms_util/zm_hms_util
// Params 2
// Checksum 0x1a4692c8, Offset: 0x26f8
// Size: 0x1fc
function function_df67a12d( category, subcategory )
{
    if ( isdefined( level.sndplayervox ) && isdefined( level.sndplayervox[ category ] ) )
    {
        if ( !isdefined( level.var_e745455 ) )
        {
            level.var_e745455 = [];
        }
        else if ( !isarray( level.var_e745455 ) )
        {
            level.var_e745455 = array( level.var_e745455 );
        }
        
        if ( isdefined( subcategory ) )
        {
            if ( isdefined( level.sndplayervox[ category ][ subcategory ] ) )
            {
                if ( !isdefined( level.var_e745455[ category ] ) )
                {
                    level.var_e745455[ category ] = [];
                }
                else if ( !isarray( level.var_e745455[ category ] ) )
                {
                    level.var_e745455[ category ] = array( level.var_e745455[ category ] );
                }
                
                level.var_e745455[ category ][ subcategory ] = level.sndplayervox[ category ][ subcategory ];
                arrayremoveindex( level.sndplayervox[ category ], subcategory, 1 );
            }
            
            return;
        }
        
        level.var_e745455[ category ] = arraycopy( level.sndplayervox[ category ] );
        arrayremoveindex( level.sndplayervox, category, 1 );
    }
}

/#

    // Namespace zm_hms_util/zm_hms_util
    // Params 0
    // Checksum 0xa00d0c37, Offset: 0x2900
    // Size: 0x7e, Type: dev
    function function_774b42ac()
    {
        while ( true )
        {
            a_ents = getentarray();
            debug2dtext( ( 5, 1055, 0 ), "<dev string:x38>" + a_ents.size, ( 0, 1, 0 ), 1, ( 0, 0, 0 ), 0.5, 1, 30 );
            waitframe( 30 );
        }
    }

    // Namespace zm_hms_util/zm_hms_util
    // Params 0, eflags: 0x4
    // Checksum 0x48874c72, Offset: 0x2988
    // Size: 0x118, Type: dev
    function private devgui()
    {
        adddebugcommand( "<dev string:x4c>" );
        
        while ( true )
        {
            waitframe( 1 );
            str_command = getdvarstring( #"hash_6c7113bf98c41367", "<dev string:x9d>" );
            
            switch ( str_command )
            {
                case #"give_targets":
                    zm_devgui::zombie_devgui_goto_round( 10 );
                    level flag::set( #"spawn_zombies" );
                    level flag::set( #"infinite_round_spawning" );
                    break;
            }
            
            setdvar( #"hash_6c7113bf98c41367", "<dev string:x9d>" );
        }
    }

    // Namespace zm_hms_util/zm_hms_util
    // Params 4
    // Checksum 0x89fec604, Offset: 0x2aa8
    // Size: 0x162, Type: dev
    function log_debug_event( str_event, data1, data2, data3 )
    {
        if ( !isdefined( data1 ) )
        {
            data1 = "<dev string:x9d>";
        }
        
        if ( !isdefined( data2 ) )
        {
            data2 = "<dev string:x9d>";
        }
        
        if ( !isdefined( data3 ) )
        {
            data3 = "<dev string:x9d>";
        }
        
        s_event = { #str_event:str_event, #n_time:float( gettime() ) / 1000, #data1:data1, #data2:data2, #data3:data3 };
        
        if ( !isdefined( level.var_df9f1a00 ) )
        {
            level.var_df9f1a00 = [];
        }
        else if ( !isarray( level.var_df9f1a00 ) )
        {
            level.var_df9f1a00 = array( level.var_df9f1a00 );
        }
        
        level.var_df9f1a00[ level.var_df9f1a00.size ] = s_event;
    }

    // Namespace zm_hms_util/zm_hms_util
    // Params 0
    // Checksum 0xe33a6233, Offset: 0x2c18
    // Size: 0x74, Type: dev
    function function_df54cbcd()
    {
        if ( !isvehicle( self ) )
        {
            log_debug_event( "<dev string:xa0>", self.actor_id, function_9e72a96( self.archetype ) );
            self thread function_fc28e798();
        }
    }

    // Namespace zm_hms_util/zm_hms_util
    // Params 1
    // Checksum 0xea82206d, Offset: 0x2c98
    // Size: 0x74, Type: dev
    function function_86b062a6( s_params )
    {
        str_event = "<dev string:xad>";
        
        if ( self.b_cleaned_up === 1 )
        {
            str_event = "<dev string:xb9>";
        }
        
        log_debug_event( str_event, self.actor_id, function_9e72a96( self.archetype ) );
    }

    // Namespace zm_hms_util/zm_hms_util
    // Params 0
    // Checksum 0x7765b14f, Offset: 0x2d18
    // Size: 0x2c, Type: dev
    function function_acd2ba83()
    {
        log_debug_event( "<dev string:xc9>", level.round_number );
    }

    // Namespace zm_hms_util/zm_hms_util
    // Params 0
    // Checksum 0x907cf199, Offset: 0x2d50
    // Size: 0x2c, Type: dev
    function function_84b292b4()
    {
        level waittill( #"end_game" );
        function_4eb5a6ad();
    }

    // Namespace zm_hms_util/zm_hms_util
    // Params 0
    // Checksum 0x2cd8c193, Offset: 0x2d88
    // Size: 0x64, Type: dev
    function function_fc28e798()
    {
        self endon( #"death" );
        self waittill( #"completed_emerging_into_playable_area" );
        log_debug_event( "<dev string:xd7>", self.actor_id, function_9e72a96( self.archetype ) );
    }

    // Namespace zm_hms_util/zm_hms_util
    // Params 0
    // Checksum 0xadb46e03, Offset: 0x2df8
    // Size: 0x1bc, Type: dev
    function function_4eb5a6ad()
    {
        dir = "<dev string:xed>";
        filename = level.script + "<dev string:x100>" + getutc() + "<dev string:x114>";
        path = dir + "<dev string:x11b>" + filename;
        file = openfile( path, "<dev string:x11f>" );
        fprintln( file, "<dev string:x127>" );
        
        foreach ( s_event in level.var_df9f1a00 )
        {
            fprintln( file, s_event.n_time + "<dev string:x146>" + s_event.str_event + "<dev string:x146>" + s_event.data1 + "<dev string:x146>" + s_event.data2 + "<dev string:x146>" + s_event.data3 );
        }
        
        closefile( file );
        println( "<dev string:x14a>" + path );
    }

#/
