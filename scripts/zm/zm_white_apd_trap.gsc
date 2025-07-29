#using scripts\core_common\array_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm\zm_hms_util;
#using scripts\zm\zm_lightning_chain;
#using scripts\zm\zm_trap_electric;
#using scripts\zm\zm_white_util;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_traps;
#using scripts\zm_common\zm_unitrigger;
#using scripts\zm_common\zm_utility;

#namespace zm_white_apd_trap;

// Namespace zm_white_apd_trap/zm_white_apd_trap
// Params 0, eflags: 0x2
// Checksum 0x53fde7ef, Offset: 0x1b8
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"zm_white_apd_trap", &__init__, &__main__, undefined );
}

// Namespace zm_white_apd_trap/zm_white_apd_trap
// Params 0
// Checksum 0x8bf3e00e, Offset: 0x208
// Size: 0x2a
function __init__()
{
    level._effect[ #"tesla_bolt" ] = "zm_ai/fx8_avo_elec_projectile";
}

// Namespace zm_white_apd_trap/zm_white_apd_trap
// Params 0
// Checksum 0x95db868, Offset: 0x240
// Size: 0x14
function __main__()
{
    function_32639301();
}

// Namespace zm_white_apd_trap/zm_white_apd_trap
// Params 0
// Checksum 0x1315a282, Offset: 0x260
// Size: 0x290
function function_32639301()
{
    level.s_apd_trap = struct::get( "apd_trap", "targetname" );
    level.s_apd_trap.var_38cd3d0e = lightning_chain::create_lightning_chain_params();
    s_trap = level.s_apd_trap;
    s_trap._trap_type = "soul";
    s_trap.v_touching = getent( s_trap.target, "targetname" );
    s_trap.v_touching._trap_type = "soul";
    s_trap.a_s_buttons = struct::get_array( s_trap.target2, "targetname" );
    s_trap.a_s_bullets = struct::get_array( s_trap.target3, "targetname" );
    s_trap.a_e_lights = getentarray( s_trap.target4, "targetname" );
    s_trap.a_s_panels = struct::get_array( s_trap.target5, "targetname" );
    s_trap.var_6b64b967 = 0;
    s_trap.var_41ee2ddc = 1;
    level flag::wait_till( "all_players_spawned" );
    level flag::wait_till( #"hash_25d9cfebd2bdf1f2" );
    
    foreach ( s_button in s_trap.a_s_buttons )
    {
        s_button zm_unitrigger::create( &function_d1112480, 64 );
        s_button thread function_e14376a3();
        s_button thread function_65c804dc();
    }
}

// Namespace zm_white_apd_trap/zm_white_apd_trap
// Params 1
// Checksum 0x78de1289, Offset: 0x4f8
// Size: 0x2c2
function function_d1112480( e_player )
{
    if ( e_player zm_utility::is_drinking() )
    {
        self sethintstring( "" );
        return 0;
    }
    
    if ( level.s_apd_trap.var_6b64b967 === 1 )
    {
        self sethintstring( #"zombie/trap_active" );
        return 1;
    }
    
    if ( isdefined( self.stub.related_parent.power_flag ) && !level flag::get( self.stub.related_parent.power_flag ) )
    {
        self sethintstring( #"zombie/need_power" );
        return 1;
    }
    
    if ( level flag::get( #"hash_1478cafcd626c361" ) && !level flag::get( #"circuit_step_complete" ) )
    {
        self sethintstring( #"zombie/need_power" );
        return 1;
    }
    
    if ( level.s_apd_trap.var_41ee2ddc === 0 )
    {
        self sethintstring( #"zombie/trap_cooldown" );
        return 1;
    }
    
    if ( util::get_game_type() == "zstandard" )
    {
        if ( function_8b1a219a() )
        {
            self sethintstring( #"hash_61d85c966dd9e83f" );
            return 1;
        }
        else
        {
            self sethintstring( #"hash_24a438482954901" );
            return 1;
        }
        
        return;
    }
    
    if ( function_8b1a219a() )
    {
        self sethintstring( #"hash_6e8ef1b690e98e51", 1000 );
        return 1;
    }
    
    self sethintstring( #"hash_23c1c09e94181fdb", 1000 );
    return 1;
}

// Namespace zm_white_apd_trap/zm_white_apd_trap
// Params 0
// Checksum 0xafe63efe, Offset: 0x7c8
// Size: 0x240
function function_e14376a3()
{
    level endon( #"end_game" );
    
    while ( true )
    {
        s_waitresult = self waittill( #"trigger_activated" );
        e_who = s_waitresult.e_who;
        
        if ( isdefined( level.var_4f7df1ac ) && level.var_4f7df1ac )
        {
            continue;
        }
        
        if ( isdefined( self.power_flag ) && !level flag::get( self.power_flag ) )
        {
            continue;
        }
        
        if ( level.s_apd_trap.var_6b64b967 === 1 )
        {
            continue;
        }
        
        if ( level flag::get( #"hash_1478cafcd626c361" ) && !level flag::get( #"circuit_step_complete" ) )
        {
            continue;
        }
        
        if ( zm_utility::is_player_valid( e_who ) && level.s_apd_trap.var_41ee2ddc === 1 )
        {
            b_purchased = level.s_apd_trap.a_e_lights[ 0 ] zm_traps::trap_purchase( e_who, 1000 );
            
            if ( !b_purchased )
            {
                continue;
            }
            
            self notify( #"hash_1d482aca0464609a" );
            self.e_activator = e_who;
            level.s_apd_trap.v_touching.activated_by_player = e_who;
            
            if ( !( isdefined( level.var_3c9cfd6f ) && level.var_3c9cfd6f ) && zm_audio::can_speak() )
            {
                e_who thread zm_audio::create_and_play_dialog( #"trap_generic", #"activate" );
            }
        }
    }
}

// Namespace zm_white_apd_trap/zm_white_apd_trap
// Params 0
// Checksum 0x9741b765, Offset: 0xa10
// Size: 0x218
function function_65c804dc()
{
    level endon( #"end_game" );
    function_91ecec97( level.s_apd_trap.a_e_lights, "p8_zm_off_trap_switch_light_green_on" );
    open_panels( level.s_apd_trap.a_s_panels );
    
    while ( true )
    {
        self waittill( #"hash_1d482aca0464609a" );
        function_91ecec97( level.s_apd_trap.a_e_lights, "p8_zm_off_trap_switch_light_red_on" );
        level.s_apd_trap.var_6b64b967 = 1;
        e_who = self.e_activator;
        
        if ( isdefined( e_who ) )
        {
            zm_utility::play_sound_at_pos( "purchase", e_who.origin );
            level notify( #"trap_activated", { #trap_activator:e_who, #trap:self } );
        }
        
        level.s_apd_trap apd_trap_activate( e_who );
        level.s_apd_trap.var_6b64b967 = 0;
        level.s_apd_trap.var_41ee2ddc = 0;
        n_cooldown = zm_traps::function_da13db45( 60, e_who );
        wait n_cooldown;
        level.s_apd_trap.var_41ee2ddc = 1;
        function_91ecec97( level.s_apd_trap.a_e_lights, "p8_zm_off_trap_switch_light_green_on" );
        playsoundatposition( #"zmb_trap_ready", self.origin );
    }
}

// Namespace zm_white_apd_trap/zm_white_apd_trap
// Params 1
// Checksum 0x47e7efcf, Offset: 0xc30
// Size: 0x1f0
function apd_trap_activate( e_player )
{
    level endon( #"end_game" );
    n_total_time = 0;
    weapon = getweapon( #"ww_tesla_gun_t8" );
    
    while ( n_total_time < 60 )
    {
        var_890584df = [];
        
        foreach ( ai in getaiteamarray( level.zombie_team ) )
        {
            if ( ai istouching( self.v_touching ) )
            {
                if ( !isdefined( var_890584df ) )
                {
                    var_890584df = [];
                }
                else if ( !isarray( var_890584df ) )
                {
                    var_890584df = array( var_890584df );
                }
                
                var_890584df[ var_890584df.size ] = ai;
            }
        }
        
        if ( var_890584df.size > 0 )
        {
            foreach ( ai in var_890584df )
            {
                ai thread function_25ede6c7( self );
            }
        }
        
        wait 3;
        n_total_time += 3;
    }
}

// Namespace zm_white_apd_trap/zm_white_apd_trap
// Params 1
// Checksum 0x6aa61629, Offset: 0xe28
// Size: 0x164
function function_25ede6c7( s_trap )
{
    self endoncallback( &function_171226f4, #"death" );
    self.var_410faa5f = util::spawn_model( "tag_origin", s_trap.origin );
    fx = playfxontag( level._effect[ #"tesla_bolt" ], self.var_410faa5f, "tag_origin" );
    playsoundatposition( #"hash_286b88c1d2e99649", s_trap.origin );
    self.var_410faa5f moveto( self gettagorigin( "J_Spine4" ), 0.6 );
    self.var_410faa5f waittill( #"movedone" );
    self.var_410faa5f delete();
    self thread zm_trap_electric::damage( s_trap.v_touching );
}

// Namespace zm_white_apd_trap/zm_white_apd_trap
// Params 1
// Checksum 0x68cf082a, Offset: 0xf98
// Size: 0x34
function function_171226f4( str_notify )
{
    if ( isdefined( self.var_410faa5f ) )
    {
        self.var_410faa5f delete();
    }
}

// Namespace zm_white_apd_trap/zm_white_apd_trap
// Params 1
// Checksum 0x217848b, Offset: 0xfd8
// Size: 0x88
function open_panels( a_s_panels )
{
    foreach ( panel in a_s_panels )
    {
        panel thread scene::play( "open" );
    }
}

// Namespace zm_white_apd_trap/zm_white_apd_trap
// Params 2
// Checksum 0x51210dab, Offset: 0x1068
// Size: 0x88
function function_91ecec97( a_e_lights, str_model )
{
    foreach ( light in a_e_lights )
    {
        light setmodel( str_model );
    }
}

