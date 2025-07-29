#using scripts\core_common\ai\archetype_damage_utility;
#using scripts\core_common\array_shared;
#using scripts\core_common\bots\bot;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\gameobjects_shared;
#using scripts\core_common\potm_shared;
#using scripts\core_common\spawning_shared;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;
#using scripts\core_common\vehicle_ai_shared;
#using scripts\core_common\vehicle_death_shared;
#using scripts\core_common\vehicle_shared;
#using scripts\killstreaks\ai_tank_shared;
#using scripts\killstreaks\helicopter_shared;
#using scripts\killstreaks\killstreaks_shared;
#using scripts\killstreaks\mp\killstreak_vehicle;
#using scripts\mp_common\gametypes\ct_ai;
#using scripts\mp_common\gametypes\ct_battery_tutorial;
#using scripts\mp_common\gametypes\ct_bots;
#using scripts\mp_common\gametypes\ct_core;
#using scripts\mp_common\gametypes\ct_gadgets;
#using scripts\mp_common\gametypes\ct_utils;
#using scripts\mp_common\gametypes\globallogic_spawn;
#using scripts\mp_common\player\player_loadout;
#using scripts\mp_common\player\player_utils;

#namespace ct_battery;

// Namespace ct_battery/gametype_init
// Params 1, eflags: 0x40
// Checksum 0x86210df8, Offset: 0x338
// Size: 0x27c
function event_handler[gametype_init] main( eventstruct )
{
    ct_core::function_46e95cc7();
    level.select_character = ct_utils::get_roleindex( #"prt_mp_battery" );
    level.var_820c5561 = "BATTERY";
    ct_utils::function_be3a76b7( level.var_820c5561 );
    level.var_d6d98fbe = 1;
    level.debugbots = 0;
    ct_core::function_fa03fc55();
    level.var_4c2ecc6f = &function_6db6572b;
    level.var_c01b7f8b = &function_ba542258;
    level.var_49240db3 = &function_b89106ad;
    level.var_8b9d690e = &function_cf3224fe;
    level.onspawnplayer = &function_7c4ef26b;
    player::function_cf3aa03d( &function_9d65db70 );
    level.var_cdb8ae2c = &ct_utils::function_a8da260c;
    level.resurrect_override_spawn = &ct_utils::function_78469779;
    level.var_e31c5d7a = &ct_bots::function_e31c5d7a;
    callback::on_game_playing( &ct_core::function_1e84c767 );
    globallogic_spawn::addsupportedspawnpointtype( "ct" );
    level flag::init( "combat_training_started" );
    ct_utils::function_6046a5e3( #"ar_damage_t8", array( #"ar_damage_t8", "holo", "damage", "damage2" ) );
    ct_utils::function_c3e647e2( #"pistol_standard_t8" );
    
    if ( level.ctdifficulty == 0 )
    {
        level ct_battery_tutorial::init();
    }
}

// Namespace ct_battery/ct_battery
// Params 1
// Checksum 0xbc2ecd94, Offset: 0x5c0
// Size: 0x194
function function_7c4ef26b( predictedspawn )
{
    if ( level.ctdifficulty == 0 )
    {
        self ct_battery_tutorial::function_c9ff0dce();
        return;
    }
    
    setdvar( #"custom_killstreak_mode", 2 );
    setdvar( #"custom_killstreak1", level.killstreakindices[ #"uav" ] );
    setdvar( #"custom_killstreak2", level.killstreakindices[ #"satellite" ] );
    setdvar( #"custom_killstreak3", level.killstreakindices[ #"remote_missile" ] );
    self thread ct_core::function_d2845186();
    spawning::onspawnplayer( predictedspawn );
    
    if ( isbot( self ) )
    {
        if ( isdefined( level.var_e31c5d7a ) )
        {
            self [[ level.var_e31c5d7a ]]();
        }
        
        return;
    }
    
    self.n_multikill = 0;
    self thread function_7dbf5593();
}

// Namespace ct_battery/ct_battery
// Params 9
// Checksum 0x5bec08ab, Offset: 0x760
// Size: 0x2a4
function function_9d65db70( einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration )
{
    if ( level.ctdifficulty == 0 )
    {
        self ct_battery_tutorial::function_72ba0df6( einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration );
        return;
    }
    
    if ( self.team == #"allies" )
    {
        self ct_utils::function_ee4639dd( -5, 1 );
        self notify( #"hash_789b40a7845c0591" );
        self.var_6b6241ac = self.last_valid_position;
        self.var_45cac770 = self.angles;
        return;
    }
    
    if ( level flag::exists( "combat_training_started" ) && level flag::get( "combat_training_started" ) && self.team == #"axis" && isdefined( level.var_902e7351 ) && level.var_902e7351 )
    {
        self ct_bots::function_43df30a8();
        e_player = ct_utils::get_player();
        
        if ( isdefined( level.ct_shared_objcounter.n_count ) )
        {
            e_player ct_utils::function_785eb2ca();
        }
        
        e_player thread function_e12a129( self.origin );
        level thread ct_utils::function_bfa522d1();
        
        if ( weapon === getweapon( #"hero_pineapplegun" ) || weapon === getweapon( #"hero_pineapple_grenade" ) )
        {
            e_player ct_utils::function_d471f8fa( 5, undefined, 1 );
            return;
        }
        
        e_player ct_utils::function_d471f8fa( 2 );
    }
}

// Namespace ct_battery/ct_battery
// Params 0
// Checksum 0xe945fc2f, Offset: 0xa10
// Size: 0x94
function function_6db6572b()
{
    level.callbackvehiclekilled = &function_4293d37b;
    level.var_d2193160 = util::spawn_model( "tag_origin" );
    level.var_f3c95b8b = getnodearray( "nd_enemy_bot", "targetname" );
    level thread ct_utils::function_6b71f442();
    
    /#
        level thread function_868cd9ac();
    #/
}

// Namespace ct_battery/ct_battery
// Params 1
// Checksum 0x6a6763ac, Offset: 0xab0
// Size: 0xc2
function function_ba542258( mode )
{
    if ( isdefined( level.var_1ecfe3a2 ) )
    {
        self.var_71a70093 = level.var_1ecfe3a2;
    }
    
    self thread ct_gadgets::function_19181566();
    self loadout::function_cdb86a18();
    var_27875ecd = 180000;
    self thread function_9270ab93( 0, var_27875ecd );
    level.var_9468071 = [];
    level.var_9468071[ #"hash_4d612f606300433a" ] = 0;
    level.var_902e7351 = 1;
}

// Namespace ct_battery/ct_battery
// Params 2
// Checksum 0x627e85f3, Offset: 0xb80
// Size: 0x21c
function function_9270ab93( var_db89c655, var_27875ecd )
{
    var_e7cc5e43 = [];
    var_e7cc5e43[ #"mp_frenetic" ][ 1 ] = 60000;
    var_e7cc5e43[ #"mp_frenetic" ][ 2 ] = 52000;
    var_e7cc5e43[ #"mp_frenetic" ][ 3 ] = 45000;
    var_e7cc5e43[ #"mp_offshore" ][ 1 ] = 60000;
    var_e7cc5e43[ #"mp_offshore" ][ 2 ] = 52000;
    var_e7cc5e43[ #"mp_offshore" ][ 3 ] = 45000;
    var_e7cc5e43[ #"mp_seaside" ][ 1 ] = 60000;
    var_e7cc5e43[ #"mp_seaside" ][ 2 ] = 52000;
    var_e7cc5e43[ #"mp_seaside" ][ 3 ] = 45000;
    var_e7cc5e43[ #"mp_silo" ][ 1 ] = 60000;
    var_e7cc5e43[ #"mp_silo" ][ 2 ] = 52000;
    var_e7cc5e43[ #"mp_silo" ][ 3 ] = 45000;
    str_map = hash( getrootmapname() );
    ct_utils::function_7a21ac57( 0, var_27875ecd, var_e7cc5e43[ str_map ][ 1 ], var_e7cc5e43[ str_map ][ 2 ], var_e7cc5e43[ str_map ][ 3 ] );
}

// Namespace ct_battery/ct_battery
// Params 1
// Checksum 0x307a130e, Offset: 0xda8
// Size: 0xd8
function function_b89106ad( gamedifficulty )
{
    level endon( #"combattraining_logic_finished" );
    level notify( #"hash_2a473e02881ca991" );
    level.usingscorestreaks = 0;
    level.disablescoreevents = 1;
    level.disablemomentum = 1;
    level.var_ebad4ea8 = gettime();
    
    if ( gamedifficulty == 0 )
    {
        ct_battery_tutorial::function_9b9525e9();
    }
    else
    {
        j_fore_le_01();
    }
    
    level notify( #"combattraining_logic_finished", { #success:1 } );
}

// Namespace ct_battery/ct_battery
// Params 0
// Checksum 0xa17c8377, Offset: 0xe88
// Size: 0x14c
function function_9e8fddfe()
{
    level.var_11f15cb8 = [];
    a_s_vh_enemy = struct::get_array( "s_vh_enemy", "targetname" );
    
    foreach ( var_7c73ae03 in a_s_vh_enemy )
    {
        vh_enemy = registerstart_killstreak_collision_rounds( var_7c73ae03 );
        vh_enemy clientfield::set( "enemy_vehicle_keyline_render", 1 );
        level.var_11f15cb8[ level.var_11f15cb8.size ] = vh_enemy;
    }
    
    e_player = ct_utils::get_player();
    e_player ct_utils::objcounter_init( #"hash_1b6372a0a5dc0fef", 0, level.var_11f15cb8.size, 1, 1 );
}

// Namespace ct_battery/ct_battery
// Params 4
// Checksum 0xd21afd59, Offset: 0xfe0
// Size: 0x268
function spawn_attack_wave( n_count, var_2c6e8cfe = 0, a_parms, var_1b783b8b = 0 )
{
    var_d3dc6155 = [];
    var_c580022d = [];
    var_4ea36929[ 0 ] = "ct_attack_helicopter";
    var_4ea36929[ 1 ] = "ct_mini_quadtank";
    a_s_enemy = struct::get_array( var_4ea36929[ var_2c6e8cfe ], "script_noteworthy" );
    
    if ( n_count > a_s_enemy.size )
    {
        n_limit = a_s_enemy.size;
    }
    else
    {
        n_limit = n_count;
    }
    
    for ( i = 0; i < n_limit ; i++ )
    {
        switch ( var_1b783b8b )
        {
            case 0:
                s_enemy = arraygetfarthest( self.origin, a_s_enemy );
                break;
            case 1:
                s_enemy = arraygetclosest( self.origin, a_s_enemy );
                break;
            case 2:
                s_enemy = array::random( a_s_enemy );
                break;
        }
        
        if ( var_2c6e8cfe == 0 )
        {
            var_d3dc6155[ var_d3dc6155.size ] = s_enemy spawn_attack_helicopter( "enemy_chopper", #"axis", 1, 1, a_parms );
        }
        else if ( var_2c6e8cfe == 1 )
        {
            var_d3dc6155[ var_d3dc6155.size ] = s_enemy function_4c8f915a( "enemy_mini_quad_tank", #"axis" );
        }
        
        arrayremovevalue( a_s_enemy, s_enemy );
        waitframe( 1 );
    }
    
    return var_d3dc6155;
}

// Namespace ct_battery/ct_battery
// Params 1
// Checksum 0x9f12bd01, Offset: 0x1250
// Size: 0xa2
function registerstart_killstreak_collision_rounds( s_veh )
{
    switch ( s_veh.script_noteworthy )
    {
        case #"ct_mini_quadtank":
            return s_veh function_4c8f915a( "enemy_mini_quadtank", #"axis" );
        case #"ct_attack_helicopter":
            return s_veh spawn_attack_helicopter( "enemy_attack_chopper", #"axis" );
    }
}

// Namespace ct_battery/ct_battery
// Params 5
// Checksum 0x5002edca, Offset: 0x1300
// Size: 0x608
function spawn_attack_helicopter( str_targetname, str_team, b_guns = 1, b_missiles = 1, a_parms )
{
    chopper = spawnvehicle( #"veh_t8_helicopter_gunship_mp", self.origin, self.angles, str_targetname );
    
    if ( !isdefined( a_parms ) )
    {
        a_parms = [];
    }
    
    if ( !isdefined( a_parms[ #"hash_340f1ead2b66b1e5" ] ) )
    {
        a_parms[ #"hash_340f1ead2b66b1e5" ] = 1200;
    }
    
    if ( !isdefined( a_parms[ #"attack_time" ] ) )
    {
        a_parms[ #"attack_time" ] = 5;
    }
    
    if ( !isdefined( a_parms[ #"attack_rest" ] ) )
    {
        a_parms[ #"attack_rest" ] = 3;
    }
    
    if ( !isdefined( a_parms[ #"shoot_spread" ] ) )
    {
        a_parms[ #"shoot_spread" ] = 25;
    }
    
    if ( !isdefined( a_parms[ #"speed" ] ) )
    {
        a_parms[ #"speed" ] = 30;
    }
    
    if ( !isdefined( a_parms[ #"ACCEL" ] ) )
    {
        a_parms[ #"ACCEL" ] = 10;
    }
    
    chopper.var_6982e1d6 = a_parms[ #"hash_340f1ead2b66b1e5" ];
    chopper.var_9d8645cf = a_parms[ #"attack_time" ];
    chopper.var_847fac28 = a_parms[ #"attack_rest" ];
    chopper.n_shoot_spread = a_parms[ #"shoot_spread" ];
    chopper.n_speed = a_parms[ #"speed" ];
    chopper.n_accel = a_parms[ #"ACCEL" ];
    chopper setteam( str_team );
    chopper.originalteam = str_team;
    chopper.attackers = [];
    chopper.attackerdata = [];
    chopper.attackerdamage = [];
    chopper.flareattackerdamage = [];
    chopper.destroyfunc = &function_64dd0b39;
    chopper.hardpointtype = "attack_helicopter";
    chopper.killstreak_id = -1;
    chopper.lastrocketfiretime = -1;
    chopper.missile_ammo = 100;
    chopper.pilotistalking = 0;
    chopper setdrawinfrared( 1 );
    chopper.allowcontinuedlockonafterinvis = 1;
    chopper.soundmod = "heli";
    target_offset = ( 0, 0, 100 );
    chopper.target_offset = target_offset;
    target_set( chopper, target_offset );
    minigun_snd_ent = spawn( "script_origin", chopper gettagorigin( "tag_flash" ) );
    minigun_snd_ent linkto( chopper, "tag_flash", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    chopper.minigun_snd_ent = minigun_snd_ent;
    minigun_snd_ent thread helicopter::autostopsound();
    self.damagetaken = 0;
    aiutility::addaioverridedamagecallback( chopper, &function_4e049216 );
    
    if ( randomint( 100 ) > 50 )
    {
        chopper.crashtype = "spinOut";
    }
    else
    {
        chopper.crashtype = "crashOnPath";
    }
    
    chopper.maxhealth = level.heli_amored_maxhealth;
    chopper thread helicopter::heli_health( chopper.hardpointtype );
    e_player = ct_utils::get_player();
    chopper.primarytarget = e_player;
    chopper.secondarytarget = e_player;
    chopper.defaultweapon = getweapon( #"cobra_20mm_comlink" );
    
    if ( b_guns )
    {
        chopper thread function_62449dad();
    }
    
    if ( b_missiles )
    {
    }
    
    chopper thread helicopter::heli_missile_regen();
    level.heli_loopmax = 10000;
    chopper.loopcount = 0;
    chopper.str_path_start = self.target;
    chopper function_5d585945( chopper.hardpointtype );
    return chopper;
}

// Namespace ct_battery/ct_battery
// Params 0
// Checksum 0x75e5c2e6, Offset: 0x1910
// Size: 0x548
function function_62449dad()
{
    self endon( #"death", #"crashing", #"leaving" );
    level endon( #"game_ended" );
    var_df0dfc2d = self.var_6982e1d6 * self.var_6982e1d6;
    level.heli_turretreloadtime = 5;
    
    while ( true )
    {
        if ( isdefined( self.primarytarget ) )
        {
            self.primarytarget.antithreat = undefined;
            self.turrettarget = self.primarytarget;
            antithreat = 0;
            last_pos = undefined;
            
            while ( isdefined( self.turrettarget ) && isalive( self.turrettarget ) )
            {
                if ( distance2dsquared( self.turrettarget.origin, self.origin ) <= var_df0dfc2d )
                {
                    self vehlookat( self.turrettarget );
                }
                
                helicopterturretmaxangle = getdvar( #"scr_helicopterturretmaxangle", level.helicopterturretmaxangle );
                
                while ( isdefined( self.turrettarget ) && isalive( self.turrettarget ) && self helicopter::turret_target_check( self.turrettarget, helicopterturretmaxangle ) == 0 )
                {
                    wait 0.1;
                }
                
                if ( !isdefined( self.turrettarget ) || !isalive( self.turrettarget ) )
                {
                    break;
                }
                
                v_offset = function_17786807();
                self turretsettarget( 0, self.turrettarget, v_offset );
                self setvehweapon( self.defaultweapon );
                self waittill( #"turret_on_target" );
                self notify( #"turret_on_target" );
                
                if ( self.pilotistalking )
                {
                }
                
                wait 1;
                wait level.heli_turret_spinup_delay;
                weaponshoottime = self.defaultweapon.firetime;
                self setvehweapon( self.defaultweapon );
                
                for ( i = 0; i < level.heli_turretclipsize ; i++ )
                {
                    v_offset = function_17786807();
                    
                    if ( isdefined( self.turrettarget ) && isdefined( self.primarytarget ) )
                    {
                        if ( self.primarytarget != self.turrettarget )
                        {
                            self turretsettarget( 0, self.primarytarget, v_offset );
                        }
                    }
                    
                    var_ff52e201 = self ct_utils::is_facing( self.primarytarget, 0.6, 1 );
                    
                    if ( gettime() != self.lastrocketfiretime && isdefined( var_ff52e201 ) && var_ff52e201 )
                    {
                        self setvehweapon( self.defaultweapon );
                        
                        if ( isdefined( self.primarytarget ) )
                        {
                            self turretsettarget( 0, self.primarytarget, v_offset );
                            minigun = self fireweapon( 0, self.primarytarget );
                        }
                        else
                        {
                            minigun = self fireweapon();
                        }
                    }
                    
                    if ( i < level.heli_turretclipsize - 1 )
                    {
                        wait weaponshoottime;
                    }
                }
                
                self notify( #"turret reloading" );
                wait level.heli_turretreloadtime;
                
                if ( isdefined( self.turrettarget ) && isalive( self.turrettarget ) )
                {
                    antithreat += 100;
                    self.turrettarget.antithreat = antithreat;
                }
                
                if ( !isdefined( self.primarytarget ) || isdefined( self.turrettarget ) && isdefined( self.primarytarget ) && self.primarytarget != self.turrettarget )
                {
                    break;
                }
            }
            
            if ( isdefined( self.turrettarget ) )
            {
                self.turrettarget.antithreat = undefined;
            }
        }
        
        self function_d9adace1();
        wait self.var_847fac28;
    }
}

// Namespace ct_battery/ct_battery
// Params 0
// Checksum 0x404e3b86, Offset: 0x1e60
// Size: 0x1a
function function_d9adace1()
{
    self.primarytarget = ct_utils::get_player();
}

// Namespace ct_battery/ct_battery
// Params 0
// Checksum 0xc9d3ed74, Offset: 0x1e88
// Size: 0x74
function function_17786807()
{
    n_spread = self.n_shoot_spread;
    return ( randomfloatrange( n_spread * -1, n_spread ), randomfloatrange( n_spread * -1, n_spread ), randomfloatrange( n_spread * -1, n_spread ) );
}

// Namespace ct_battery/ct_battery
// Params 0
// Checksum 0xa23621f1, Offset: 0x1f08
// Size: 0x180
function function_303fcbd8()
{
    self endon( #"death", #"crashing", #"leaving" );
    
    for ( ;; )
    {
        if ( isdefined( self.secondarytarget ) )
        {
            self.secondarytarget.antithreat = undefined;
            self.missiletarget = self.secondarytarget;
            antithreat = 0;
            
            while ( isdefined( self.missiletarget ) && isalive( self.missiletarget ) )
            {
                if ( self helicopter::target_cone_check( self.missiletarget, level.heli_missile_target_cone ) )
                {
                    self thread helicopter::missile_support( self.missiletarget, level.heli_missile_rof, 1, undefined );
                }
                else
                {
                    break;
                }
                
                antithreat += 100;
                self.missiletarget.antithreat = antithreat;
                wait level.heli_missile_rof;
                
                if ( !isdefined( self.secondarytarget ) || isdefined( self.secondarytarget ) && self.missiletarget != self.secondarytarget )
                {
                    break;
                }
            }
            
            if ( isdefined( self.missiletarget ) )
            {
                self.missiletarget.antithreat = undefined;
            }
        }
        
        wait 5;
    }
}

// Namespace ct_battery/ct_battery
// Params 1
// Checksum 0x7c0c15ea, Offset: 0x2090
// Size: 0xfc
function function_5d585945( hardpointtype )
{
    self notify( #"evasive" );
    self.evasive = 1;
    var_ca7b2d46 = function_430510ec( self.str_path_start, "targetname" );
    
    if ( var_ca7b2d46.size > 1 )
    {
        self.nd_path_start = array::random( var_ca7b2d46 );
    }
    else
    {
        self.nd_path_start = var_ca7b2d46[ 0 ];
    }
    
    nd_path_start = self.nd_path_start;
    startwait = 2;
    
    if ( isdefined( self.donotstop ) && self.donotstop )
    {
        startwait = 0;
    }
    
    self thread function_560c5174( nd_path_start, startwait, hardpointtype );
}

// Namespace ct_battery/ct_battery
// Params 2
// Checksum 0xc8e4ddcb, Offset: 0x2198
// Size: 0x3a
function function_430510ec( str_path_start, key = "targetname" )
{
    return getvehiclenodearray( str_path_start, key );
}

// Namespace ct_battery/ct_battery
// Params 3
// Checksum 0x8a4c24d6, Offset: 0x21e0
// Size: 0x574
function function_560c5174( currentnode, startwait, hardpointtype )
{
    self endon( #"death", #"leaving" );
    self notify( #"flying" );
    self endon( #"flying", #"abandoned" );
    self.reached_dest = 0;
    helicopter::heli_reset();
    pos = self.origin;
    wait startwait;
    
    while ( isdefined( currentnode.target ) )
    {
        a_nextnode = function_430510ec( currentnode.target, "targetname" );
        
        if ( a_nextnode.size > 1 )
        {
            if ( isdefined( self.primarytarget ) )
            {
                nextnode = undefined;
                
                while ( a_nextnode.size > 0 && ( !isdefined( nextnode ) || currentnode === nextnode ) )
                {
                    nextnode = arraygetclosest( self.primarytarget.origin, a_nextnode );
                    arrayremovevalue( a_nextnode, nextnode, 0 );
                }
            }
            else
            {
                nextnode = array::random( a_nextnode );
            }
        }
        else
        {
            nextnode = a_nextnode[ 0 ];
        }
        
        assert( isdefined( nextnode ), "<dev string:x38>" );
        pos = nextnode.origin + ( 0, 0, 30 );
        
        if ( isdefined( currentnode.script_airspeed ) && currentnode.script_airspeed > 0 )
        {
            heli_speed = currentnode.script_airspeed;
        }
        else
        {
            heli_speed = self.n_speed + randomint( 20 );
        }
        
        if ( isdefined( currentnode.script_accel ) )
        {
            heli_accel = currentnode.script_accel;
        }
        else
        {
            heli_accel = self.n_accel + randomint( 5 );
        }
        
        if ( isdefined( self.pathspeedscale ) )
        {
            heli_speed *= self.pathspeedscale;
            heli_accel *= self.pathspeedscale;
        }
        
        if ( !isdefined( nextnode.target ) )
        {
            stop = 1;
        }
        else
        {
            stop = 0;
        }
        
        if ( isdefined( nextnode.script_delay ) && !isdefined( self.donotstop ) )
        {
            stop = 1;
        }
        
        self setspeed( heli_speed, heli_accel );
        self helicopter::set_goal_pos( pos, stop );
        
        if ( !isdefined( nextnode.script_delay ) || isdefined( self.donotstop ) )
        {
            self waittill( #"near_goal" );
            self notify( #"path start" );
        }
        else
        {
            self setgoalyaw( nextnode.angles[ 1 ] );
            self waittill( #"goal" );
            
            /#
                while ( level flag::get( "<dev string:x6d>" ) )
                {
                    helicopter::heli_wait( 1 );
                }
            #/
            
            n_wait = nextnode.script_delay;
            
            if ( isdefined( self.var_e55eb7b9 ) )
            {
                n_wait += self.var_e55eb7b9;
            }
            
            self function_ab637f96( n_wait );
        }
        
        for ( index = 0; index < level.heli_loop_paths.size ; index++ )
        {
            if ( level.heli_loop_paths[ index ].origin == nextnode.origin )
            {
                self.loopcount++;
            }
        }
        
        currentnode = nextnode;
    }
    
    self setgoalyaw( currentnode.angles[ 1 ] );
    self.reached_dest = 1;
    self notify( #"destination reached" );
    
    if ( isdefined( self.waittime ) && self.waittime )
    {
        self function_ab637f96( self.waittime );
    }
    
    if ( isdefined( self ) )
    {
        self thread function_5d585945( hardpointtype );
    }
}

// Namespace ct_battery/ct_battery
// Params 2
// Checksum 0xc379b6fe, Offset: 0x2760
// Size: 0xe6
function function_ab637f96( waittime, var_f49cf7e0 = 0 )
{
    self endon( #"death", #"crashing", #"evasive" );
    self endoncallback( &function_6b4ab31d, #"chase_target", #"damage", #"hash_1ef47c427ec739d7" );
    self thread helicopter::heli_hover();
    
    if ( var_f49cf7e0 > 0 )
    {
        self thread function_40c7d949( var_f49cf7e0 );
    }
    
    wait waittime;
    self notify( #"hash_1ef47c427ec739d7" );
}

// Namespace ct_battery/ct_battery
// Params 1
// Checksum 0x845cb44e, Offset: 0x2850
// Size: 0xa2
function function_40c7d949( n_range = 2000 )
{
    self endon( #"hash_1ef47c427ec739d7" );
    var_d6326c12 = n_range * n_range;
    
    while ( true )
    {
        if ( isdefined( self.primarytarget ) && distance2dsquared( self.origin, self.primarytarget.origin ) > var_d6326c12 )
        {
            self notify( #"chase_target" );
        }
    }
}

// Namespace ct_battery/ct_battery
// Params 1
// Checksum 0x59e3091d, Offset: 0x2900
// Size: 0x2e
function function_6b4ab31d( _hash )
{
    helicopter::heli_reset();
    self notify( #"stop hover" );
}

// Namespace ct_battery/ct_battery
// Params 1
// Checksum 0xfe4f1c00, Offset: 0x2938
// Size: 0x1e4
function function_64dd0b39( var_fec7078b )
{
    e_player = ct_utils::get_player();
    e_player thread ct_utils::function_785eb2ca();
    e_player thread ct_utils::function_329f9ba6( #"hash_d004238c40b4d74", 2, "green" );
    e_player thread ct_utils::magic_explosion( self.origin );
    team = self.originalteam;
    
    if ( target_istarget( self ) )
    {
        target_remove( self );
    }
    
    if ( isdefined( self.interior_model ) )
    {
        self.interior_model delete();
        self.interior_model = undefined;
    }
    
    if ( isdefined( self.minigun_snd_ent ) )
    {
        self.minigun_snd_ent stoploopsound();
        self.minigun_snd_ent delete();
        self.minigun_snd_ent = undefined;
    }
    
    if ( isdefined( self.alarm_snd_ent ) )
    {
        self.alarm_snd_ent delete();
        self.alarm_snd_ent = undefined;
    }
    
    if ( isdefined( self.flare_ent ) )
    {
        self.flare_ent delete();
        self.flare_ent = undefined;
    }
    
    if ( isdefined( var_fec7078b ) && var_fec7078b )
    {
        self helicopter::function_e1058a3e();
    }
    
    self delete();
}

// Namespace ct_battery/ct_battery
// Params 15, eflags: 0x4
// Checksum 0x447ca04a, Offset: 0x2b28
// Size: 0x3f4
function private function_4e049216( einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal )
{
    if ( isdefined( einflictor ) && einflictor == self )
    {
        return 0;
    }
    
    if ( isdefined( eattacker ) && eattacker == self )
    {
        return 0;
    }
    
    if ( !isdefined( self.damagetaken ) )
    {
        self.damagetaken = 0;
    }
    
    if ( smeansofdeath === "MOD_PISTOL_BULLET" || smeansofdeath === "MOD_RIFLE_BULLET" )
    {
        if ( !( isdefined( level.var_9468071[ #"hash_4d612f606300433a" ] ) && level.var_9468071[ #"hash_4d612f606300433a" ] ) )
        {
            level.var_9468071[ #"hash_4d612f606300433a" ] = 1;
            ct_utils::get_player() thread ct_utils::function_329f9ba6( #"hash_70f2d94bae3edef5", 2, "red" );
        }
    }
    else if ( smeansofdeath === "MOD_IMPACT" && weapon === getweapon( #"hero_pineapplegun" ) )
    {
        level notify( #"hash_788c0d72802f35af", { #v_loc:vpoint } );
        self.damagetaken += 751;
    }
    else if ( weapon === getweapon( #"eq_cluster_semtex_grenade" ) && !( isdefined( self.var_21c8bc5f ) && self.var_21c8bc5f ) )
    {
        self.var_21c8bc5f = 1;
        level notify( #"hash_18859ff9fe569290", { #v_loc:vpoint } );
        ct_utils::get_player() thread ct_utils::magic_explosion( vpoint );
        
        if ( !isdefined( self.damagetaken ) )
        {
            self.damagetaken = 0;
        }
        
        self.damagetaken += 1501;
    }
    
    if ( self.damagetaken >= self.maxhealth && !isdefined( self.about_to_die ) )
    {
        self.about_to_die = 1;
        eattacker notify( #"destroyed_helicopter" );
        eattacker potm::bookmark( #"ct_battery", gettime(), eattacker );
        level notify( #"ct_timer_stop" );
        
        if ( isdefined( self.waypoint ) )
        {
            self.waypoint ct_utils::function_f9ed304d();
        }
        
        if ( target_istarget( self ) )
        {
            target_remove( self );
        }
        
        if ( isdefined( level.var_4d5e1035 ) )
        {
            self [[ level.var_4d5e1035 ]]( eattacker, weapon, smeansofdeath, idamage, "attack_chopper_shutdown", 0, self.hardpointtype );
        }
    }
    
    return idamage;
}

// Namespace ct_battery/ct_battery
// Params 8
// Checksum 0xb9fe5a59, Offset: 0x2f28
// Size: 0x264
function function_4293d37b( einflictor, eattacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime )
{
    self clientfield::set( "enemy_vehicle_keyline_render", 0 );
    self notify( #"death" );
    self killstreak_vehicle::vehicle_death();
    self vehicle::remove_from_target_group( self );
    e_player = ct_utils::get_player();
    
    if ( isdefined( self.waypoint ) )
    {
        self.waypoint ct_utils::function_f9ed304d();
    }
    
    if ( self.targetname === "enemy_mini_quad_tank" && !( isdefined( self.var_d11c8572 ) && self.var_d11c8572 ) )
    {
        self.var_d11c8572 = 1;
        self cancelaimove();
        self function_d4c687c9();
        e_player thread ct_utils::magic_explosion( self.origin );
        
        if ( isdefined( self.var_95d9bf2e ) )
        {
            e_player thread function_e12a129();
            
            if ( self.var_95d9bf2e == getweapon( #"hero_pineapple_gun" ) || self.var_95d9bf2e == getweapon( #"eq_cluster_semtex_grenade" ) )
            {
                n_points = 5;
            }
            else
            {
                n_points = 2;
            }
        }
        
        e_player thread ct_utils::function_d471f8fa( n_points, undefined, 1 );
        self delete();
    }
    
    if ( isdefined( level.ct_shared_objcounter.n_count ) )
    {
        e_player ct_utils::function_785eb2ca();
    }
}

// Namespace ct_battery/ct_battery
// Params 2
// Checksum 0xfb06b5c2, Offset: 0x3198
// Size: 0xa0
function function_4c8f915a( str_targetname, str_team )
{
    drone = ct_ai::function_4c8f915a( self.origin );
    drone.angles = self.angles;
    drone setteam( str_team );
    drone.targetname = str_targetname;
    drone.var_95d9bf2e = undefined;
    aiutility::addaioverridedamagecallback( drone, &function_1f04fda );
    return drone;
}

// Namespace ct_battery/ct_battery
// Params 15, eflags: 0x4
// Checksum 0xb6503274, Offset: 0x3240
// Size: 0x24e
function private function_1f04fda( einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal )
{
    if ( isdefined( einflictor ) && einflictor == self )
    {
        return 0;
    }
    
    if ( isdefined( eattacker ) && eattacker == self )
    {
        return 0;
    }
    
    if ( !isdefined( self.damagetaken ) )
    {
        self.damagetaken = 0;
    }
    
    w_cluster = getweapon( #"eq_cluster_semtex_grenade" );
    var_60350909 = getweapon( #"hash_66401df7cd6bf292" );
    w_pineapple = getweapon( #"hero_pineapple_grenade" );
    
    if ( weapon === w_pineapple )
    {
        level notify( #"hash_788c0d72802f35af", { #v_loc:vpoint } );
    }
    else if ( smeansofdeath !== "MOD_IMPACT" && weapon === w_cluster )
    {
        self.damagetaken += 1501;
    }
    else if ( smeansofdeath !== "MOD_IMPACT" && weapon === var_60350909 )
    {
        self.damagetaken += 751;
    }
    
    if ( self.damagetaken >= self.maxhealth )
    {
        idamage = self.maxhealth + 1000;
        
        if ( isdefined( self.waypoint ) )
        {
            self.waypoint ct_utils::function_f9ed304d();
        }
    }
    
    self.var_95d9bf2e = weapon;
    return idamage;
}

// Namespace ct_battery/ct_battery
// Params 1, eflags: 0x4
// Checksum 0xf287eb8f, Offset: 0x3498
// Size: 0x24
function private state_combat_enter( params )
{
    self thread ai_tank::turretfireupdate();
}

// Namespace ct_battery/ct_battery
// Params 1
// Checksum 0xdf248d84, Offset: 0x34c8
// Size: 0x22c
function function_cf3224fe( b_success )
{
    ct_utils::get_player() thread ct_utils::function_c2a10fc();
    
    if ( isdefined( level.var_4d4de8f9 ) )
    {
        foreach ( var_74d0673 in level.var_4d4de8f9 )
        {
            var_74d0673 ct_bots::function_43df30a8();
        }
    }
    
    if ( isdefined( level.var_ae0bbaac ) )
    {
        foreach ( var_c361acde in level.var_ae0bbaac )
        {
            if ( isalive( var_c361acde ) )
            {
                var_c361acde delete();
            }
        }
    }
    
    if ( isdefined( level.a_vh_choppers ) )
    {
        foreach ( vh_chopper in level.a_vh_choppers )
        {
            if ( isalive( vh_chopper ) )
            {
                vh_chopper delete();
            }
        }
    }
    
    level.var_38c87b5 = b_success;
    var_cd803a6b = gettime() - level.var_ebad4ea8;
    return var_cd803a6b;
}

// Namespace ct_battery/ct_battery
// Params 0
// Checksum 0x48c40948, Offset: 0x3700
// Size: 0xa8
function function_377cd9ae()
{
    level endon( #"combattraining_logic_finished" );
    
    while ( !level.gameended )
    {
        while ( !self actionslotfourbuttonpressed() )
        {
            waitframe( 1 );
        }
        
        if ( !self isinmovemode( "ufo", "noclip" ) )
        {
            level.var_105dad71++;
            
            if ( level.var_105dad71 > 17 )
            {
                level.var_105dad71 = 17;
            }
        }
        
        waitframe( 1 );
    }
}

// Namespace ct_battery/ct_battery
// Params 0
// Checksum 0xd55b852a, Offset: 0x37b0
// Size: 0xa4
function function_78aff698()
{
    level endon( #"combattraining_logic_finished" );
    
    while ( !level.gameended )
    {
        while ( !self actionslotthreebuttonpressed() )
        {
            waitframe( 1 );
        }
        
        if ( !self isinmovemode( "ufo", "noclip" ) )
        {
            level.var_105dad71--;
            
            if ( level.var_105dad71 < 0 )
            {
                level.var_105dad71 = 0;
            }
        }
        
        waitframe( 1 );
    }
}

// Namespace ct_battery/ct_battery
// Params 0
// Checksum 0x605e9600, Offset: 0x3860
// Size: 0x1f4
function j_fore_le_01()
{
    level endon( #"combattraining_logic_finished" );
    ct_utils::function_6d7f4ec6( 30 );
    level.var_105dad71 = 1;
    e_player = getplayers( #"allies" )[ 0 ];
    e_player thread function_377cd9ae();
    e_player thread function_78aff698();
    e_player thread ct_utils::function_329f9ba6( #"hash_3e63055cff392ca5", 10, "grey", 1 );
    e_player thread ct_utils::function_61c3d59c( #"hash_789ced07ae5c9a0b", undefined );
    e_player wave_enemy_bot( 1 );
    wait 1;
    e_player thread ct_utils::function_329f9ba6( #"hash_5949f76edc389803", 4, "red", 1 );
    e_player wave_enemy_bot( 2 );
    wait 1;
    e_player thread ct_utils::function_329f9ba6( #"hash_5949f76edc389803", 4, "red", 1 );
    e_player wave_enemy_bot( 3 );
    e_player thread function_9be2d75f();
    e_player thread ct_utils::function_61c3d59c( #"hash_233aafc8172fead1", undefined );
    e_player function_701302a8();
}

// Namespace ct_battery/ct_battery
// Params 0
// Checksum 0xc194ead2, Offset: 0x3a60
// Size: 0x1a6
function function_701302a8()
{
    e_player = self;
    level.var_ae0bbaac = e_player spawn_attack_wave( 10, 1, undefined, 1 );
    
    foreach ( var_c22808fd in level.var_ae0bbaac )
    {
        var_c22808fd.waypoint = var_c22808fd ct_utils::create_waypoint( #"hash_4b08047cf5e74f2e", var_c22808fd.origin, var_c22808fd.angles, #"any", undefined, 0, undefined );
        
        if ( isdefined( level.var_d6d98fbe ) && level.var_d6d98fbe )
        {
            var_c22808fd clientfield::set( "enemy_vehicle_keyline_render", 1 );
        }
    }
    
    e_player ct_utils::objcounter_init( #"hash_1b6372a0a5dc0fef", 0, level.var_ae0bbaac.size, 1, 1 );
    
    while ( level.var_ae0bbaac.size > 0 )
    {
        function_1eaaceab( level.var_ae0bbaac );
        wait 1;
    }
}

// Namespace ct_battery/ct_battery
// Params 1
// Checksum 0x1da1eb17, Offset: 0x3c10
// Size: 0x414
function function_52d196f2( n_difficulty = 2 )
{
    e_player = self;
    var_88e49d60 = array( 1, 1, 1 );
    var_a7b6c024 = array( 0, 0, 0 );
    var_89d9697a = array( 7, 5, 5 );
    var_ed621a12 = array( 50, 50, 25 );
    var_c52588b6 = array( 30, 35, 50 );
    var_c005d40b = array( 10, 15, 30 );
    var_44092575 = 0;
    
    foreach ( n_count in var_88e49d60 )
    {
        var_44092575 += n_count;
    }
    
    e_player thread function_9be2d75f();
    a_parms = [];
    a_parms[ #"hash_72de0eaa7f3c7619" ] = var_a7b6c024[ n_difficulty ];
    a_parms[ #"attack_rest" ] = var_89d9697a[ n_difficulty ];
    a_parms[ #"shoot_spread" ] = var_ed621a12[ n_difficulty ];
    a_parms[ #"speed" ] = var_c52588b6[ n_difficulty ];
    a_parms[ #"ACCEL" ] = var_c005d40b[ n_difficulty ];
    level.a_vh_choppers = e_player spawn_attack_wave( var_88e49d60[ n_difficulty ], 0, a_parms, 2 );
    
    foreach ( vh_chopper in level.a_vh_choppers )
    {
        vh_chopper.waypoint = vh_chopper ct_utils::create_waypoint( #"hash_3489718f227fba3", vh_chopper.origin, vh_chopper.angles, #"any", undefined, 0, undefined );
    }
    
    n_count = 10;
    n_total = 10 + level.a_vh_choppers.size;
    e_player ct_utils::objcounter_init( #"hash_1b6372a0a5dc0fef", n_count, n_total, 1, 1 );
    
    while ( level.a_vh_choppers.size > 0 || level.var_ae0bbaac.size > 0 )
    {
        function_1eaaceab( level.a_vh_choppers );
        function_1eaaceab( level.var_ae0bbaac );
        wait 0.5;
    }
    
    e_player ct_utils::function_8b7a2fdd();
}

// Namespace ct_battery/ct_battery
// Params 0
// Checksum 0x908ecf18, Offset: 0x4030
// Size: 0x64
function function_9be2d75f()
{
    self ct_utils::function_329f9ba6( #"hash_5b71b9ee6fbb6a4a", 2, "green", 2 );
    self ct_utils::function_329f9ba6( #"hash_2f203cc2de1af314", 5, "red" );
}

// Namespace ct_battery/ct_battery
// Params 0
// Checksum 0x2e6587ee, Offset: 0x40a0
// Size: 0x96
function function_7dbf5593()
{
    self endon( #"death" );
    
    while ( true )
    {
        s_notify = self waittill( #"grenade_launcher_fire" );
        
        if ( self util::gadget_is_in_use( 2 ) )
        {
            if ( isdefined( s_notify.projectile ) )
            {
                s_notify.projectile thread function_4674d2e7();
            }
        }
        
        waitframe( 1 );
    }
}

// Namespace ct_battery/ct_battery
// Params 0
// Checksum 0xbcb39235, Offset: 0x4140
// Size: 0xd6
function function_4674d2e7()
{
    self endon( #"death" );
    
    while ( true )
    {
        s_notify = level waittill( #"hash_788c0d72802f35af" );
        var_1c5e8282 = distance( self.origin, s_notify.v_loc );
        
        if ( var_1c5e8282 < 4 )
        {
            ct_utils::get_player() thread ct_utils::magic_explosion( self.origin );
            wait 0.1;
            self delete();
        }
        
        waitframe( 1 );
    }
}

// Namespace ct_battery/ct_battery
// Params 1
// Checksum 0x24f9b45e, Offset: 0x4220
// Size: 0x1f8
function wave_enemy_bot( var_764a1fa0 )
{
    level endon( #"combattraining_logic_finished" );
    var_5c91700c = [];
    
    foreach ( nd_enemy in level.var_f3c95b8b )
    {
        if ( nd_enemy.script_int == var_764a1fa0 )
        {
            var_5c91700c[ var_5c91700c.size ] = nd_enemy;
        }
    }
    
    level.var_4d4de8f9 = [];
    
    foreach ( nd_enemy in var_5c91700c )
    {
        e_enemy = ct_bots::function_7e8fcca2( nd_enemy );
        
        if ( isalive( e_enemy ) )
        {
            level.var_4d4de8f9[ level.var_4d4de8f9.size ] = e_enemy;
        }
        
        waitframe( 1 );
    }
    
    ct_utils::get_player() ct_utils::objcounter_init( #"hash_1b6372a0a5dc0fef", 0, level.var_4d4de8f9.size, 1, 1 );
    
    while ( level.var_4d4de8f9.size > 0 )
    {
        function_1eaaceab( level.var_4d4de8f9 );
        wait 0.1;
    }
}

// Namespace ct_battery/ct_battery
// Params 1
// Checksum 0x888ccbca, Offset: 0x4420
// Size: 0xe4
function function_e12a129( v_target )
{
    self endon( #"multikill_reset" );
    
    if ( !( isdefined( self.var_e2ca43cf ) && self.var_e2ca43cf ) && !isbot( self ) )
    {
        if ( !isdefined( self.n_multikill ) )
        {
            self.n_multikill = 0;
        }
        
        self.n_multikill++;
        
        if ( !( isdefined( self.var_439da772 ) && self.var_439da772 ) )
        {
            self.var_439da772 = 1;
            wait 2;
            self.n_multikill = 0;
            self.var_439da772 = 0;
            return;
        }
        
        if ( self.n_multikill >= 3 )
        {
            self thread function_f75c4ec2( v_target );
        }
    }
}

// Namespace ct_battery/ct_battery
// Params 1
// Checksum 0xca5b1a7a, Offset: 0x4510
// Size: 0x11e
function function_f75c4ec2( v_target )
{
    self notify( #"multikill_reset" );
    
    if ( isdefined( v_target ) )
    {
        level.var_d2193160.origin = v_target + ( 0, 0, 48 );
        
        if ( !self function_80d68e4d( level.var_d2193160, 0.7, 1 ) )
        {
            self potm::bookmark( #"ct_battery", gettime(), self );
        }
    }
    
    self.var_e2ca43cf = 1;
    self thread ct_utils::function_d471f8fa( 10, undefined, 1, "_multikill" );
    self ct_utils::function_329f9ba6( #"hash_334ffdf56102449f", 2, "green", 1 );
    self.n_multikill = 0;
    self.var_e2ca43cf = 0;
    self.var_439da772 = 0;
}

/#

    // Namespace ct_battery/ct_battery
    // Params 0
    // Checksum 0x10cdab8d, Offset: 0x4638
    // Size: 0x6f8, Type: dev
    function function_868cd9ac()
    {
        sessionmode = currentsessionmode();
        setdvar( #"hash_16e650a0fe963515", "<dev string:x84>" );
        level flag::init( "<dev string:x6d>" );
        
        if ( sessionmode != 4 )
        {
            adddebugcommand( "<dev string:x87>" );
            adddebugcommand( "<dev string:xed>" );
            adddebugcommand( "<dev string:x161>" );
            adddebugcommand( "<dev string:x1d0>" );
            adddebugcommand( "<dev string:x245>" );
            adddebugcommand( "<dev string:x2a6>" );
        }
        
        while ( true )
        {
            wait 0.25;
            cmd = getdvarstring( #"hash_16e650a0fe963515", "<dev string:x84>" );
            
            if ( cmd == "<dev string:x84>" )
            {
                continue;
            }
            
            e_player = level.players[ 0 ];
            
            switch ( cmd )
            {
                case #"hash_3a7f84f30eb3613e":
                    if ( isdefined( level.var_ae0bbaac ) && level.var_ae0bbaac.size > 0 )
                    {
                        while ( level.var_ae0bbaac.size > 0 )
                        {
                            var_c95e2891 = level.var_ae0bbaac[ 0 ];
                            
                            if ( isalive( var_c95e2891 ) )
                            {
                                var_c95e2891 dodamage( 100000, var_c95e2891.origin );
                                function_1eaaceab( level.var_ae0bbaac, 0 );
                                wait 0.1;
                            }
                        }
                    }
                    
                    break;
                case #"spawn_chopper":
                    a_s_chopper = struct::get_array( "<dev string:x309>", "<dev string:x320>" );
                    registerstart_killstreak_collision_rounds( a_s_chopper[ 0 ] );
                    break;
                case #"hash_3336321eb0a42dd":
                    var_e62f2b3d = struct::get_array( "<dev string:x334>", "<dev string:x320>" );
                    e_player spawn_attack_wave( var_e62f2b3d.size, 1 );
                    break;
                case #"hash_20f84a451b85817":
                    if ( level flag::get( "<dev string:x6d>" ) )
                    {
                        iprintlnbold( "<dev string:x347>" );
                        level flag::clear( "<dev string:x6d>" );
                    }
                    else
                    {
                        iprintlnbold( "<dev string:x364>" );
                        level flag::set( "<dev string:x6d>" );
                    }
                    
                    break;
                case #"hash_47e019566f91d4d1":
                    if ( !( isdefined( level.var_d6d98fbe ) && level.var_d6d98fbe ) )
                    {
                        level.var_d6d98fbe = 1;
                        
                        foreach ( ai_bot in level.var_4d4de8f9 )
                        {
                            if ( isalive( ai_bot ) )
                            {
                                ai_bot thread ct_utils::function_8963dae3();
                            }
                        }
                        
                        if ( isdefined( level.var_ae0bbaac ) && level.var_ae0bbaac.size > 0 )
                        {
                            foreach ( var_c22808fd in level.var_ae0bbaac )
                            {
                                if ( isalive( var_c22808fd ) )
                                {
                                    var_c22808fd clientfield::set( "<dev string:x380>", 1 );
                                }
                            }
                        }
                    }
                    
                    break;
                case #"hash_3384d4df94b5c66d":
                    if ( isdefined( level.var_d6d98fbe ) && level.var_d6d98fbe )
                    {
                        level.var_d6d98fbe = 0;
                        
                        foreach ( ai_bot in level.var_4d4de8f9 )
                        {
                            if ( isalive( ai_bot ) )
                            {
                                ai_bot notify( #"keyline_off" );
                            }
                        }
                        
                        if ( isdefined( level.var_ae0bbaac ) && level.var_ae0bbaac.size > 0 )
                        {
                            foreach ( var_c22808fd in level.var_ae0bbaac )
                            {
                                if ( isalive( var_c22808fd ) )
                                {
                                    var_c22808fd clientfield::set( "<dev string:x380>", 0 );
                                }
                            }
                        }
                    }
                    
                    break;
            }
            
            setdvar( #"hash_16e650a0fe963515", "<dev string:x84>" );
        }
    }

#/
