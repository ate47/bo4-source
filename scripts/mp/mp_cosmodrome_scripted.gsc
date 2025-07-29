#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\mp_common\draft;
#using scripts\mp_common\gametypes\globallogic_utils;

#namespace mp_cosmodrome_scripted;

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 0, eflags: 0x2
// Checksum 0xee8aceb7, Offset: 0x4d0
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"mp_cosmodrome_scripted", &__init__, &__main__, undefined );
}

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 0
// Checksum 0x3903aea, Offset: 0x520
// Size: 0x24
function __init__()
{
    callback::on_game_playing( &on_game_playing );
}

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 0
// Checksum 0x92a8155b, Offset: 0x550
// Size: 0x12c
function __main__()
{
    level.var_f3e25805 = &prematch_init;
    level.var_40263d6 = [];
    level.var_40263d6[ 0 ] = ( 592, -2387, 289 );
    level.var_40263d6[ 1 ] = ( -131, -1575, 287 );
    level.var_40263d6[ 2 ] = ( -1493, -88, 347 );
    level.var_40263d6[ 3 ] = ( -1346, 838, 364 );
    level.var_40263d6[ 4 ] = ( -1305, 1576, 384 );
    level.var_40263d6[ 5 ] = ( -963, 2273, 440 );
    level.var_40263d6[ 6 ] = ( 575, 2905, 292 );
    function_34fc666e();
    rocket_init();
}

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 0
// Checksum 0xaf35c966, Offset: 0x688
// Size: 0x6c
function prematch_init()
{
    if ( getgametypesetting( #"allowmapscripting" ) )
    {
        level thread scene::play( #"p8_fxanim_mp_cosmo_pigeons_bundle" );
        level thread scene::play( #"p8_fxanim_mp_cosmo_hinds_bundle", "Shot 1" );
    }
}

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 0
// Checksum 0x660185c7, Offset: 0x700
// Size: 0x18c
function on_game_playing()
{
    level endon( #"game_ended" );
    
    /#
        level thread function_56b1158f( level.var_40263d6 );
    #/
    
    level util::delay( #"emergency_lights_start", "game_ended", &exploder::stop_exploder, "exp_lgt_spawn_flavor" );
    level util::delay( #"emergency_lights_start", "game_ended", &function_aa8af5cd, level.var_40263d6, "evt_base_alarm" );
    
    if ( getgametypesetting( #"allowmapscripting" ) )
    {
        if ( true )
        {
            level thread function_3a7aa317();
        }
    }
    
    level flag::wait_till( "first_player_spawned" );
    
    if ( !draft::is_draft_this_round() )
    {
        level notify( #"emergency_lights_start" );
    }
    
    if ( util::isfirstround() )
    {
        exploder::exploder( "fxexp_fuel_tank_exp" );
        exploder::stop_exploder( "exp_lgt_spawn_fire" );
    }
}

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 0
// Checksum 0x92bdf6c7, Offset: 0x898
// Size: 0x104
function function_3a7aa317()
{
    level endon( #"game_ended" );
    level scene::add_scene_func( #"p8_fxanim_mp_cosmo_rocket_bundle", &function_269c793, "Shot 2" );
    function_de03ab6f();
    function_6c6d4350();
    level thread scene::play( #"p8_fxanim_mp_cosmo_rocket_cradle_bundle" );
    level scene::play( #"p8_fxanim_mp_cosmo_rocket_bundle", "Shot 1" );
    function_f7dd380e();
    function_b121d5f5();
    level thread scene::play( #"p8_fxanim_mp_cosmo_rocket_bundle", "Shot 2" );
}

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 0
// Checksum 0x21249458, Offset: 0x9a8
// Size: 0x7c
function function_de03ab6f()
{
    level endon( #"game_ended" );
    
    if ( !getdvarint( #"hash_1ee64aff68c3f875", 1 ) )
    {
        return;
    }
    
    time = level.timelimit * 60 / 4;
    
    if ( time < 60 )
    {
        time = 3;
    }
    
    wait time;
}

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 0
// Checksum 0xfbe9359b, Offset: 0xa30
// Size: 0x136
function function_f7dd380e()
{
    level endon( #"game_ended" );
    
    if ( !getdvarint( #"hash_1ee64aff68c3f875", 1 ) )
    {
        return;
    }
    
    remaining = float( globallogic_utils::gettimeremaining() ) / 1000;
    timeout = remaining - 60;
    
    if ( timeout < 3 )
    {
        timeout = 3;
    }
    
    if ( isdefined( timeout ) )
    {
        __s = spawnstruct();
        __s endon( #"timeout" );
        __s util::delay_notify( timeout, "timeout" );
    }
    
    do
    {
        waitframe( 5 );
        reached_score = function_efa3251f();
    }
    while ( !reached_score );
    
    wait 3;
}

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 0
// Checksum 0xbbe71865, Offset: 0xb70
// Size: 0x1d0
function function_b121d5f5()
{
    level endon( #"game_ended" );
    countdown_lines = [];
    countdown_lines[ 0 ] = "vox_rupa_pa_rocket_sequence_9";
    countdown_lines[ 1 ] = "vox_rupa_pa_rocket_sequence_10";
    countdown_lines[ 2 ] = "vox_rupa_pa_rocket_sequence_11";
    countdown_lines[ 3 ] = "vox_rupa_pa_rocket_sequence_12";
    countdown_lines[ 4 ] = "vox_rupa_pa_rocket_sequence_13";
    countdown_lines[ 5 ] = "vox_rupa_pa_rocket_sequence_14";
    countdown_lines[ 6 ] = "vox_rupa_pa_rocket_sequence_15";
    countdown_lines[ 7 ] = "vox_rupa_pa_rocket_sequence_16";
    countdown_lines[ 8 ] = "vox_rupa_pa_rocket_sequence_17";
    countdown_lines[ 9 ] = "vox_rupa_pa_rocket_sequence_18";
    
    foreach ( i, countdown_line in countdown_lines )
    {
        if ( getdvarint( #"hash_8ddd1821fceebe9", 0 ) )
        {
            /#
                iprintlnbold( i );
            #/
        }
        
        function_aa8af5cd( level.var_40263d6, countdown_line );
        
        if ( i == 9 )
        {
            exploder::exploder( "fxexp_rocket_ignition" );
        }
        
        wait 1.2;
    }
}

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 0
// Checksum 0x9f24c4c6, Offset: 0xd48
// Size: 0xe4, Type: bool
function function_efa3251f()
{
    round_score_limit = util::get_current_round_score_limit();
    
    if ( round_score_limit < level.scorelimit )
    {
        round_score_limit = level.scorelimit;
    }
    
    foreach ( team, _ in level.teams )
    {
        if ( game.stat[ #"teamscores" ][ team ] >= int( round_score_limit / 2 ) )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 0
// Checksum 0x80fd35e8, Offset: 0xe38
// Size: 0xb4
function rocket_init()
{
    level scene::add_scene_func( #"p8_fxanim_mp_cosmo_rocket_bundle", &function_e3ec98e4, "Shot 1" );
    level scene::add_scene_func( #"p8_fxanim_mp_cosmo_rocket_cradle_bundle", &function_84d0eb82, "init" );
    level scene::init( #"p8_fxanim_mp_cosmo_rocket_bundle" );
    level scene::init( #"p8_fxanim_mp_cosmo_rocket_cradle_bundle" );
}

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 1
// Checksum 0x3baa1ba0, Offset: 0xef8
// Size: 0x11c
function function_84d0eb82( a_ents )
{
    cradle = a_ents[ #"prop 2" ];
    waitframe( 2 );
    
    if ( isdefined( cradle ) )
    {
        cradle_clip = getent( "rocket_cradle_clip", "targetname" );
        link = util::spawn_model( #"tag_origin", cradle gettagorigin( "tag_link_all" ), cradle gettagangles( "tag_link_all" ) );
        cradle_clip setmovingplatformenabled( 1, 0 );
        link linkto( cradle, "tag_link_all" );
        cradle_clip linkto( link );
    }
}

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 1
// Checksum 0x749cc933, Offset: 0x1020
// Size: 0x314
function function_e3ec98e4( a_ents )
{
    level.var_578a0ca4 = spawnstruct();
    level.var_578a0ca4.scene_ents = self.scene_ents;
    self.rocket_kill_trig = getent( "rocket_kill_trig", "targetname" );
    rumble_locs = struct::get_array( "rocket_gantry_rumble" );
    rumbles = [];
    
    foreach ( pos in rumble_locs )
    {
        if ( !isdefined( rumbles ) )
        {
            rumbles = [];
        }
        else if ( !isarray( rumbles ) )
        {
            rumbles = array( rumbles );
        }
        
        rumbles[ rumbles.size ] = util::spawn_model( #"tag_origin", pos.origin, pos.angles );
    }
    
    if ( isdefined( self.rocket_kill_trig ) )
    {
        self.rocket_kill_trig triggerenable( 0 );
    }
    
    array::run_all( rumbles, &playrumblelooponentity, "mp_cosdmodrome_gantry_prep_rumble" );
    function_aa8af5cd( level.var_40263d6, "vox_rupa_pa_rocket_sequence_3" );
    a_ents[ #"prop 2" ] waittill( #"stop_rumble", #"death" );
    array::run_all( rumbles, &stoprumble, "mp_cosdmodrome_rocket_ready_rumble" );
    
    if ( isdefined( a_ents[ #"prop 2" ] ) )
    {
        a_ents[ #"prop 2" ] playrumbleonentity( "mp_cosdmodrome_rocket_ready_rumble" );
    }
    
    array::run_all( rumbles, &playrumblelooponentity, "mp_cosdmodrome_rocket_ready_gantry_rumble" );
    array::delete_all( rumbles );
    a_ents[ #"prop 2" ] waittill( #"rocket_on_pad" );
    function_aa8af5cd( level.var_40263d6, "vox_rupa_pa_rocket_sequence_7" );
}

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 1
// Checksum 0x5ced71c1, Offset: 0x1340
// Size: 0x2ec
function function_269c793( a_ents )
{
    function_aa8af5cd( level.var_40263d6, "evt_rocket_alarm" );
    
    if ( isdefined( self.rocket_kill_trig ) )
    {
        level endon( #"game_ended" );
        a_ents[ #"prop 3" ] endon( #"death" );
        rumble_ent = util::spawn_model( #"tag_origin", self.rocket_kill_trig.origin );
        rumble_ent linkto( a_ents[ #"prop 3" ] );
        a_ents[ #"prop 3" ] waittill( #"start_damage" );
        a_ents[ #"prop 3" ] util::delay( "line_23", undefined, &function_aa8af5cd, level.var_40263d6, "vox_rupa_pa_rocket_sequence_23" );
        level.var_578a0ca4 thread function_7be405f8();
        self.rocket_kill_trig triggerenable( 1 );
        self.rocket_kill_trig callback::on_trigger( &function_971b8aa2 );
        self thread function_6edeb4c2( a_ents[ #"prop 3" ] );
        rumble_ent playrumblelooponentity( "mp_cosdmodrome_rocket_rumble" );
        a_ents[ #"prop 3" ] waittill( #"stop_damage" );
        level thread function_aa8af5cd( level.var_40263d6, "vox_rupa_pa_rocket_sequence_19" );
        
        if ( isdefined( self ) && isdefined( self.rocket_kill_trig ) )
        {
            self.rocket_kill_trig triggerenable( 0 );
        }
        
        a_ents[ #"prop 3" ] thread util::delete_on_death( rumble_ent );
        a_ents[ #"prop 3" ] waittill( #"cleared_tower" );
        level thread function_aa8af5cd( level.var_40263d6, "vox_rupa_pa_rocket_sequence_20" );
    }
}

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 1
// Checksum 0x86f8eb51, Offset: 0x1638
// Size: 0x9c
function function_971b8aa2( var_ae2faaca )
{
    player = var_ae2faaca.activator;
    
    if ( isalive( player ) )
    {
        mod = "MOD_BURNED";
        
        if ( isvehicle( player ) )
        {
            mod = "MOD_EXPLOSIVE";
        }
        
        player dodamage( player.health, player.origin, undefined, undefined, undefined, mod );
    }
}

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 1
// Checksum 0x5467c412, Offset: 0x16e0
// Size: 0x76
function function_6edeb4c2( rocket )
{
    level endon( #"game_ended" );
    rocket endon( #"stop_damage", #"death" );
    
    while ( true )
    {
        self kill_equipment( self.rocket_kill_trig );
        waitframe( 5 );
    }
}

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 0
// Checksum 0xd97096d, Offset: 0x1760
// Size: 0x114
function function_34fc666e()
{
    level endon( #"game_ended" );
    
    if ( getgametypesetting( #"allowmapscripting" ) && draft::is_draft_this_round() )
    {
        if ( util::isfirstround() )
        {
            level scene::init( #"p8_fxanim_mp_cosmo_pigeons_bundle" );
        }
    }
    
    level flag::wait_till( "all_players_connected" );
    waitframe( 1 );
    exploder::exploder( "exp_lgt_spawn_flavor" );
    
    if ( util::isfirstround() )
    {
        exploder::exploder( "exp_lgt_spawn_fire" );
        return;
    }
    
    exploder::exploder( "fxexp_fuel_tank_exp_aftermath" );
}

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 0
// Checksum 0x466c5ec4, Offset: 0x1880
// Size: 0x76
function function_7be405f8()
{
    level endon( #"game_ended" );
    
    while ( true )
    {
        self.scene_ents = array::remove_undefined( self.scene_ents );
        
        if ( self.scene_ents.size <= 5 )
        {
            return;
        }
        
        self function_e940bcf9();
        waitframe( 5 );
    }
}

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 0
// Checksum 0x9fb3f8c, Offset: 0x1900
// Size: 0x124
function function_e940bcf9()
{
    foreach ( var_66bc2a51 in self.scene_ents )
    {
        if ( !isdefined( var_66bc2a51 ) || !isdefined( var_66bc2a51.stuck_items ) )
        {
            continue;
        }
        
        foreach ( item_stuck in var_66bc2a51.stuck_items )
        {
            if ( isdefined( item_stuck ) )
            {
                item_stuck dodamage( 500, item_stuck.origin, undefined, undefined, undefined, "MOD_EXPLOSIVE" );
            }
        }
    }
}

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 2
// Checksum 0x8ca8653b, Offset: 0x1a30
// Size: 0xa8
function function_aa8af5cd( locs, line )
{
    foreach ( loc in locs )
    {
        playsoundatposition( line, loc );
        
        /#
            level thread function_cd7664d5( loc, line );
        #/
    }
}

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 0
// Checksum 0x397293b, Offset: 0x1ae0
// Size: 0x140
function function_6c6d4350()
{
    locs = [];
    locs[ 0 ] = ( -1493, -88, 347 );
    locs[ 1 ] = ( -1346, 838, 364 );
    locs[ 2 ] = ( 714, 955, 272 );
    locs[ 3 ] = ( 720, -125, 200 );
    
    /#
        level thread function_56b1158f( locs, ( 1, 1, 0 ) );
    #/
    
    foreach ( loc in locs )
    {
        playsoundatposition( "evt_gantry_alarm", loc );
        
        /#
            level thread function_cd7664d5( loc, "<dev string:x38>", ( 1, 1, 0 ) );
        #/
    }
}

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 1
// Checksum 0x84c9e871, Offset: 0x1c28
// Size: 0x13a, Type: bool
function is_equipment( entity )
{
    if ( isdefined( entity.weapon ) )
    {
        weapon = entity.weapon;
        
        if ( weapon.name === #"ability_smart_cover" || weapon.name === #"eq_tripwire" || weapon.name === #"trophy_system" || weapon.name === #"eq_concertina_wire" || weapon.name === #"eq_sensor" || weapon.name === #"cymbal_monkey" || weapon.name === #"gadget_supplypod" || weapon.name === #"homunculus" )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 1
// Checksum 0x1fe95c7d, Offset: 0x1d70
// Size: 0x26e
function kill_equipment( rocket_kill_trig )
{
    self endon( #"death" );
    level endon( #"start_warzone" );
    
    if ( !isdefined( rocket_kill_trig ) )
    {
        return;
    }
    
    equipment = getentitiesinradius( self.origin, 10000 );
    
    foreach ( device in equipment )
    {
        if ( isdefined( device ) && is_equipment( device ) && device istouching( rocket_kill_trig ) )
        {
            switch ( device.weapon.name )
            {
                case #"eq_tripwire":
                    device [[ level.var_2e06b76a ]]();
                    break;
                case #"trophy_system":
                    device [[ level.var_4f3822f4 ]]();
                    break;
                case #"cymbal_monkey":
                    device [[ level.var_7c5c96dc ]]();
                    break;
                case #"homunculus":
                    device [[ level.var_cc310d06 ]]();
                    break;
                case #"eq_sensor":
                    device [[ level.var_9911d36f ]]();
                    break;
                case #"eq_concertina_wire":
                    device [[ level.var_94029383 ]]();
                    break;
                case #"gadget_supplypod":
                    device notify( #"death" );
                    break;
                default:
                    device dodamage( 10000, device.origin );
                    break;
            }
        }
    }
}

/#

    // Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
    // Params 2
    // Checksum 0xc05583cf, Offset: 0x1fe8
    // Size: 0x122, Type: dev
    function function_56b1158f( locs, color )
    {
        if ( !isdefined( color ) )
        {
            color = ( 0, 1, 0 );
        }
        
        while ( getdvarint( #"hash_2115192db52b1b16", 0 ) )
        {
            foreach ( loc in locs )
            {
                print3d( loc + ( 0, 0, 8 ), loc, color, 1, 1.2, 30 );
                sphere( loc, 8, color, 1, 0, 4, 30 );
            }
            
            waitframe( 30 );
        }
    }

    // Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
    // Params 3
    // Checksum 0xfb090efe, Offset: 0x2118
    // Size: 0x94, Type: dev
    function function_cd7664d5( loc, alias, color )
    {
        if ( !isdefined( color ) )
        {
            color = ( 0, 1, 0 );
        }
        
        if ( getdvarint( #"hash_2115192db52b1b16", 0 ) )
        {
            /#
                print3d( loc + ( 0, 0, 32 ), alias, color, 1, 1.2, 120 );
            #/
        }
    }

#/

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 0
// Checksum 0xf1786b2, Offset: 0x21b8
// Size: 0xc0
function debug_pa()
{
    while ( true )
    {
        wait 3;
        function_aa8af5cd( level.var_40263d6, "evt_base_alarm" );
        wait 3;
        function_b121d5f5();
        function_aa8af5cd( level.var_40263d6, "evt_rocket_alarm" );
        wait 5;
        function_aa8af5cd( level.var_40263d6, "vox_rupa_pa_rocket_sequence_3" );
        wait 3;
        function_aa8af5cd( level.var_40263d6, "vox_rupa_pa_rocket_sequence_7" );
    }
}

