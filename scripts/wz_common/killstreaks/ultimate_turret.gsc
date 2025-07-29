#using scripts\core_common\callbacks_shared;
#using scripts\core_common\player\player_stats;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\targetting_delay;
#using scripts\core_common\turret_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\values_shared;
#using scripts\core_common\vehicle_ai_shared;
#using scripts\core_common\vehicle_shared;
#using scripts\killstreaks\killstreak_bundles;
#using scripts\killstreaks\killstreaks_shared;
#using scripts\killstreaks\ultimate_turret_shared;
#using scripts\weapons\deployable;

#namespace ultimate_turret;

// Namespace ultimate_turret/ultimate_turret
// Params 0, eflags: 0x2
// Checksum 0x4fd35e6e, Offset: 0x220
// Size: 0x34
function autoexec __init__system__()
{
    system::register( "ultimate_turret_wz", &__init__, undefined, undefined );
}

// Namespace ultimate_turret/ultimate_turret
// Params 0
// Checksum 0x2fdf1da5, Offset: 0x260
// Size: 0x6c
function __init__()
{
    level.ultimateturretweapon = getweapon( "ultimate_turret" );
    deployable::register_deployable( level.ultimateturretweapon, undefined, &function_b02e4a26 );
    callback::on_item_use( &on_item_use );
}

// Namespace ultimate_turret/ultimate_turret
// Params 1, eflags: 0x4
// Checksum 0x89a454bc, Offset: 0x2d8
// Size: 0x124
function private on_item_use( params )
{
    self endon( #"death", #"disconnect", #"begin_grenade_tracking", #"grenade_throw_cancelled" );
    var_d0931295 = function_b02e4a26( self );
    
    if ( !isdefined( params.item ) || !isdefined( params.item.itementry ) || !isdefined( params.item.itementry.weapon ) || params.item.itementry.weapon.name != "ultimate_turret" )
    {
        return;
    }
    
    self thread function_6c288c45( var_d0931295.origin, var_d0931295.angles );
}

// Namespace ultimate_turret/ultimate_turret
// Params 2
// Checksum 0xedf370d7, Offset: 0x408
// Size: 0x5f4
function function_6c288c45( spawnorigin, spawnangles )
{
    self endon( #"death", #"disconnect" );
    self stats::function_e24eec31( level.ultimateturretweapon, #"used", 1 );
    turretvehicle = spawnvehicle( "veh_ultimate_turret_wz", spawnorigin, spawnangles );
    
    if ( !isdefined( turretvehicle ) )
    {
        return;
    }
    
    turretvehicle.team = self.team;
    turretvehicle.owner = self;
    
    if ( isdefined( self.var_486ad7a4 ) && self.var_486ad7a4.owner === self )
    {
        self.var_486ad7a4 function_21f16a35();
    }
    
    self.var_486ad7a4 = turretvehicle;
    
    if ( isdefined( turretvehicle.scriptbundlesettings ) )
    {
        turretvehicle.settings = struct::get_script_bundle( "vehiclecustomsettings", turretvehicle.scriptbundlesettings );
    }
    
    if ( isdefined( turretvehicle.killstreaksettings ) )
    {
        level.killstreakbundle[ #"ultimate_turret" ] = struct::get_script_bundle( "killstreak", turretvehicle.killstreaksettings );
    }
    
    bundle = get_killstreak_bundle();
    assert( isdefined( bundle ) );
    turretvehicle solid();
    turretvehicle.overridevehicledamage = &onturretdamage;
    turretvehicle.overridevehiclekilled = &onturretdeath;
    turretvehicle.allowfriendlyfiredamageoverride = &turretallowfriendlyfiredamage;
    turretvehicle.var_54b19f55 = 1;
    turretvehicle.spawninfluencers = [];
    turretvehicle.spawninfluencers[ 0 ] = turretvehicle createturretinfluencer( "turret" );
    turretvehicle.spawninfluencers[ 1 ] = turretvehicle createturretinfluencer( "turret_close" );
    turretvehicle.maxhealth = isdefined( bundle.kshealth ) ? bundle.kshealth : turretvehicle.healthdefault;
    turretvehicle.health = turretvehicle.maxhealth;
    turretvehicle.controlled = 0;
    turretvehicle.damagetaken = 0;
    turretvehicle.dontfreeme = 1;
    turretvehicle.damage_on_death = 0;
    turretvehicle.delete_on_death = undefined;
    turretvehicle.use_non_teambased_enemy_selection = 1;
    turretvehicle.waittill_turret_on_target_delay = 0.25;
    turretvehicle.ignore_vehicle_underneath_splash_scalar = 1;
    turretvehicle.killstreak_duration = float( isdefined( bundle.ksduration ) ? bundle.ksduration : int( 120 * 1000 ) ) / 1000;
    turretvehicle.killstreak_end_time = gettime() + int( turretvehicle.killstreak_duration * 1000 );
    turretvehicle turretsetontargettolerance( 0, 15 );
    turretvehicle.soundmod = "mini_turret";
    turretvehicle.var_63d65a8d = "circle";
    turretvehicle.var_aac73d6c = 1;
    turretvehicle.var_7eb3ebd5 = [];
    turretvehicle.var_4ab08c1d = 1;
    turretvehicle.ignorelaststandplayers = 1;
    turretvehicle vehicle::disconnect_paths( 0, 0 );
    turretvehicle function_bc7568f1();
    turretvehicle thread function_d4f9ecb( turretvehicle.killstreak_duration );
    turretvehicle.is_staircase_up = &is_staircase_up;
    turretvehicle util::make_sentient();
    turretvehicle thread turretscanning();
    turretvehicle thread function_fefefcc4();
    turretvehicle turret::set_torso_targetting( 0 );
    turretvehicle turret::set_target_leading( 0 );
    turretvehicle thread turret_laser_watch();
    turretvehicle thread setup_death_watch_for_new_targets();
    turretvehicle thread targetting_delay::function_7e1a12ce( bundle.var_2aeadfa0 );
    callback::callback( #"hash_6d9bdacc6c29cfa5", { #turret:turretvehicle, #owner:self } );
}

// Namespace ultimate_turret/ultimate_turret
// Params 1, eflags: 0x4
// Checksum 0xc5717257, Offset: 0xa08
// Size: 0x1a8
function private function_b02e4a26( player )
{
    var_b43e8dc2 = player function_287dcf4b( 35, 115, 0, 0, level.ultimateturretweapon );
    
    if ( !var_b43e8dc2.isvalid )
    {
        player function_bf191832( 0, ( 0, 0, 0 ), ( 0, 0, 0 ) );
        return var_b43e8dc2;
    }
    
    if ( function_54267517( var_b43e8dc2.origin ) )
    {
        var_b43e8dc2.isvalid = 0;
        player function_bf191832( 0, ( 0, 0, 0 ), ( 0, 0, 0 ) );
        return var_b43e8dc2;
    }
    
    if ( isdefined( var_b43e8dc2.hitent ) )
    {
        if ( isvehicle( var_b43e8dc2.hitent ) || isai( var_b43e8dc2.hitent ) || var_b43e8dc2.hitent ismovingplatform() )
        {
            var_b43e8dc2.isvalid = 0;
            player function_bf191832( 0, ( 0, 0, 0 ), ( 0, 0, 0 ) );
            return var_b43e8dc2;
        }
    }
    
    player function_bf191832( 1, var_b43e8dc2.origin, var_b43e8dc2.angles );
    return var_b43e8dc2;
}

// Namespace ultimate_turret/ultimate_turret
// Params 1
// Checksum 0x255b5fb, Offset: 0xbb8
// Size: 0x5c
function function_d4f9ecb( duration )
{
    turretvehicle = self;
    turretvehicle endon( #"death", #"delete" );
    wait duration;
    turretvehicle function_21f16a35();
}

// Namespace ultimate_turret/ultimate_turret
// Params 0
// Checksum 0x109b92a, Offset: 0xc20
// Size: 0x70
function function_1c601b99()
{
    if ( isdefined( level.var_1b900c1d ) )
    {
        [[ level.var_1b900c1d ]]( level.ultimateturretweapon, &function_bff5c062 );
    }
    
    if ( isdefined( level.var_a5dacbea ) )
    {
        [[ level.var_a5dacbea ]]( level.ultimateturretweapon, &function_127fb8f3 );
    }
}

// Namespace ultimate_turret/ultimate_turret
// Params 15
// Checksum 0x42833144, Offset: 0xc98
// Size: 0x300
function onturretdamage( einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal )
{
    turretvehicle = self;
    empdamage = int( idamage + turretvehicle.maxhealth * 1 + 0.5 );
    idamage = turretvehicle killstreaks::ondamageperweapon( "ultimate_turret", eattacker, idamage, idflags, smeansofdeath, weapon, turretvehicle.maxhealth, undefined, turretvehicle.maxhealth * 0.4, undefined, empdamage, undefined, 1, 1, 1 );
    turretvehicle.damagetaken += idamage;
    
    if ( isdefined( einflictor ) && isvehicle( einflictor ) && issentient( einflictor ) )
    {
        if ( is_valid_target( einflictor, turretvehicle.team ) )
        {
            turretvehicle.favoriteenemy = einflictor;
            turretvehicle.var_c8072bcc = gettime();
            turretvehicle.var_7eb3ebd5[ einflictor getentitynumber() ] = #"damage";
            turretvehicle targetting_delay::function_a4d6d6d8( einflictor );
        }
    }
    else if ( isalive( eattacker ) && issentient( eattacker ) && !( isplayer( eattacker ) && eattacker isremotecontrolling() ) && is_valid_target( eattacker, turretvehicle.team ) )
    {
        turretvehicle.favoriteenemy = eattacker;
        turretvehicle.var_c8072bcc = gettime();
        turretvehicle.var_7eb3ebd5[ eattacker getentitynumber() ] = #"damage";
        turretvehicle targetting_delay::function_a4d6d6d8( eattacker );
    }
    
    return idamage;
}

// Namespace ultimate_turret/ultimate_turret
// Params 8
// Checksum 0xcc99d64a, Offset: 0xfa0
// Size: 0x264
function onturretdeath( einflictor, eattacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime )
{
    turretvehicle = self;
    
    if ( turretvehicle.dead === 1 )
    {
        return;
    }
    
    turretvehicle notify( #"death_started" );
    turretvehicle.dead = 1;
    eattacker = turretvehicle [[ level.figure_out_attacker ]]( eattacker );
    
    if ( isdefined( eattacker ) && isplayer( eattacker ) )
    {
        if ( isdefined( level.var_bbc796bf ) && isdefined( turretvehicle.owner ) && turretvehicle.owner != eattacker )
        {
            turretvehicle [[ level.var_bbc796bf ]]( eattacker, weapon );
        }
        
        if ( !isdefined( turretvehicle.owner ) || turretvehicle.owner util::isenemyplayer( eattacker ) )
        {
            eattacker stats::function_dad108fa( #"destroy_turret", 1 );
            eattacker stats::function_e24eec31( weapon, #"destroy_turret", 1 );
        }
    }
    
    turretvehicle playsound( "mpl_turret_exp" );
    
    if ( isdefined( turretvehicle.owner ) && isdefined( level.playequipmentdestroyedonplayer ) )
    {
        turretvehicle.owner [[ level.playequipmentdestroyedonplayer ]]();
    }
    
    turretvehicle function_9101e29a();
    callback::callback( #"on_turret_destroyed", { #turret:turretvehicle, #owner:turretvehicle.owner } );
}

// Namespace ultimate_turret/ultimate_turret
// Params 1
// Checksum 0x117c0dc2, Offset: 0x1210
// Size: 0x2c
function is_staircase_up( params )
{
    turretvehicle = self;
    turretvehicle function_21f16a35();
}

// Namespace ultimate_turret/ultimate_turret
// Params 0
// Checksum 0x6db13b97, Offset: 0x1248
// Size: 0xb4
function function_9101e29a()
{
    turretvehicle = self;
    turretvehicle stoploopsound( 0.5 );
    turretvehicle vehicle::connect_paths();
    turretvehicle function_3a9dddac();
    turret = turretvehicle.turret;
    waitframe( 1 );
    
    if ( isdefined( turretvehicle ) )
    {
        turretvehicle delete();
        waittillframeend();
    }
    
    if ( isdefined( turret ) )
    {
        turret delete();
    }
}

// Namespace ultimate_turret/ultimate_turret
// Params 0
// Checksum 0x6f3f5fad, Offset: 0x1308
// Size: 0x1c
function get_killstreak_bundle()
{
    return level.killstreakbundle[ #"ultimate_turret" ];
}

// Namespace ultimate_turret/ultimate_turret
// Params 2
// Checksum 0xfad406c9, Offset: 0x1330
// Size: 0xd6, Type: bool
function is_valid_target( potential_target, friendly_team )
{
    if ( isdefined( potential_target ) )
    {
        if ( isplayer( potential_target ) && isdefined( potential_target.laststand ) && potential_target.laststand )
        {
            return false;
        }
        
        if ( issentient( potential_target ) && potential_target.var_d600e174 === 1 )
        {
            return false;
        }
        
        if ( !isdefined( potential_target.team ) || !util::function_fbce7263( potential_target.team, friendly_team ) )
        {
            return false;
        }
        
        return true;
    }
    
    return false;
}

// Namespace ultimate_turret/ultimate_turret
// Params 0
// Checksum 0x67ca67c7, Offset: 0x1410
// Size: 0x348
function function_fefefcc4()
{
    turretvehicle = self;
    turret_index = 0;
    turretvehicle endon( #"death", #"death_started", #"end_turret_scanning" );
    wait 0.8;
    bundle = get_killstreak_bundle();
    var_beeadda8 = isdefined( bundle.var_5fa88c50 ) ? bundle.var_5fa88c50 : 300;
    
    while ( true )
    {
        if ( !isdefined( turretvehicle.enemy ) && !( isdefined( turretvehicle.isstunned ) && turretvehicle.isstunned ) && !( isdefined( turretvehicle.isjammed ) && turretvehicle.isjammed ) )
        {
            /#
                var_beeadda8 = isdefined( bundle.var_5fa88c50 ) ? bundle.var_5fa88c50 : 300;
            #/
            
            nearby_enemies = getplayers( util::getotherteam( turretvehicle.team ), turretvehicle.origin, var_beeadda8 );
            
            if ( nearby_enemies.size > 0 )
            {
                if ( turretvehicle.var_3413afc5 != #"hash_2d94a5f22d36fc73" )
                {
                    turretvehicle function_c524c4c8();
                }
                else
                {
                    foreach ( nearby_enemy in nearby_enemies )
                    {
                        if ( turretvehicle cansee( nearby_enemy ) == 0 )
                        {
                            continue;
                        }
                        
                        if ( turretvehicle targetting_delay::function_1c169b3a( nearby_enemy ) == 0 )
                        {
                            continue;
                        }
                        
                        if ( turretvehicle function_9d86d74c( nearby_enemy ) )
                        {
                            continue;
                        }
                        
                        turretvehicle.favoriteenemy = nearby_enemy;
                        turretvehicle.var_c8072bcc = gettime();
                        turretvehicle.var_7eb3ebd5[ nearby_enemy getentitynumber() ] = #"hash_47697c94ffb4a5bd";
                        break;
                    }
                }
            }
            else if ( turretvehicle.var_3413afc5 != #"standard_sight" )
            {
                turretvehicle function_bc7568f1();
            }
        }
        
        wait_time = turretvehicle.var_3413afc5 == #"standard_sight" ? 0.25 : 0.1;
        wait wait_time;
    }
}

// Namespace ultimate_turret/ultimate_turret
// Params 1
// Checksum 0x7386ec8, Offset: 0x1760
// Size: 0x102, Type: bool
function function_9d86d74c( enemy )
{
    fire_origin = self getseatfiringorigin( 0 );
    fire_angles = self getseatfiringangles( 0 );
    shoot_at_pos = enemy getshootatpos( self );
    var_6551f24e = anglestoforward( fire_angles );
    target_offset = shoot_at_pos - fire_origin;
    
    if ( lengthsquared( target_offset ) < 22 * 22 && vectordot( var_6551f24e, target_offset ) < 0 )
    {
        return true;
    }
    
    return false;
}

// Namespace ultimate_turret/ultimate_turret
// Params 1
// Checksum 0x9b5a9584, Offset: 0x1870
// Size: 0x154, Type: bool
function function_2034705c( bundle )
{
    var_351b3c55 = isdefined( self.enemy ) ? max( isdefined( self.enemylastseentime ) ? self.enemylastseentime : 0, isdefined( self.var_c8072bcc ) ? self.var_c8072bcc : 0 ) : 0;
    var_c112caa0 = int( ( isdefined( bundle.var_fa38350a ) ? bundle.var_fa38350a : 1 ) * 1000 );
    
    if ( isdefined( self.enemy ) && self.var_7eb3ebd5[ self.enemy getentitynumber() ] === #"damage" )
    {
        var_c112caa0 = int( ( isdefined( bundle.var_33561c46 ) ? bundle.var_33561c46 : 3 ) * 1000 );
    }
    
    return gettime() < var_351b3c55 + var_c112caa0;
}

// Namespace ultimate_turret/ultimate_turret
// Params 0
// Checksum 0x1c1a2d87, Offset: 0x19d0
// Size: 0x8a
function function_fc58f46f()
{
    turretvehicle = self;
    
    if ( !isdefined( turretvehicle ) )
    {
        return;
    }
    
    if ( isdefined( turretvehicle.enemy ) )
    {
        turretvehicle.var_c8072bcc = undefined;
        turretvehicle.var_7eb3ebd5[ turretvehicle.enemy getentitynumber() ] = undefined;
    }
    
    turretvehicle clearenemy();
    turretvehicle.favoriteenemy = undefined;
    turretvehicle.turret_target = undefined;
}

// Namespace ultimate_turret/ultimate_turret
// Params 1
// Checksum 0xde4e2e04, Offset: 0x1a68
// Size: 0x62
function get_target_offset( target )
{
    var_8134d046 = -12;
    stance = target getstance();
    
    if ( stance == "prone" )
    {
        var_8134d046 = -2;
    }
    
    return ( 0, 0, var_8134d046 );
}

// Namespace ultimate_turret/ultimate_turret
// Params 0
// Checksum 0x6a443ff3, Offset: 0x1ad8
// Size: 0xe74
function turretscanning()
{
    turretvehicle = self;
    turretvehicle endon( #"death", #"death_started", #"end_turret_scanning" );
    turretvehicle.turret_target = undefined;
    turretvehicle.do_not_clear_targets_during_think = 1;
    wait 0.8;
    turretvehicle playsound( #"mpl_turret_startup" );
    turretvehicle playloopsound( #"hash_69240c6db92da5bf" );
    bundle = get_killstreak_bundle();
    min_burst_time = bundle.ksburstfiremintime;
    max_burst_time = bundle.ksburstfiremaxtime;
    min_pause_time = bundle.ksburstfiredelaymintime;
    max_pause_time = bundle.ksburstfiredelaymaxtime;
    burst_fire_enabled = bundle.ksburstfireenabled;
    turretvehicle.maxsightdistsqrd = ( isdefined( bundle.var_2aeadfa0 ) ? bundle.var_2aeadfa0 : 3500 ) * ( isdefined( bundle.var_2aeadfa0 ) ? bundle.var_2aeadfa0 : 3500 );
    turretvehicle.var_e812cbe7 = ( isdefined( bundle.var_f6853f02 ) ? bundle.var_f6853f02 : 2500 ) * ( isdefined( bundle.var_f6853f02 ) ? bundle.var_f6853f02 : 2500 );
    turretvehicle.var_38e6355c = ( isdefined( bundle.var_5fa88c50 ) ? bundle.var_5fa88c50 : 500 ) * ( isdefined( bundle.var_5fa88c50 ) ? bundle.var_5fa88c50 : 500 );
    
    while ( isdefined( turretvehicle ) )
    {
        /#
            turretvehicle.maxsightdistsqrd = ( isdefined( bundle.var_2aeadfa0 ) ? bundle.var_2aeadfa0 : 3500 ) * ( isdefined( bundle.var_2aeadfa0 ) ? bundle.var_2aeadfa0 : 3500 );
            turretvehicle.var_e812cbe7 = ( isdefined( bundle.var_f6853f02 ) ? bundle.var_f6853f02 : 2500 ) * ( isdefined( bundle.var_f6853f02 ) ? bundle.var_f6853f02 : 2500 );
            turretvehicle.var_38e6355c = ( isdefined( bundle.var_5fa88c50 ) ? bundle.var_5fa88c50 : 500 ) * ( isdefined( bundle.var_5fa88c50 ) ? bundle.var_5fa88c50 : 500 );
        #/
        
        if ( isdefined( turretvehicle.isstunned ) && turretvehicle.isstunned || isdefined( turretvehicle.isjammed ) && turretvehicle.isjammed )
        {
            turretvehicle function_fc58f46f();
            wait 0.5;
            continue;
        }
        
        if ( isdefined( turretvehicle.enemy ) )
        {
            if ( !is_valid_target( turretvehicle.enemy, turretvehicle.team ) )
            {
                turretvehicle setignoreent( turretvehicle.enemy, 1 );
                turretvehicle function_fc58f46f();
                wait 0.1;
                continue;
            }
            
            var_2aa33bf1 = 0;
            
            if ( distancesquared( turretvehicle.enemy.origin, turretvehicle.origin ) > turretvehicle.var_38e6355c && turretvehicle.var_7eb3ebd5[ turretvehicle.enemy getentitynumber() ] === #"forwardscan" )
            {
                var_2aa33bf1 = 1;
            }
            else if ( turretvehicle function_9d86d74c( turretvehicle.enemy ) )
            {
                var_2aa33bf1 = 1;
            }
            
            if ( var_2aa33bf1 )
            {
                turretvehicle setpersonalignore( turretvehicle.enemy, 1 );
                turretvehicle function_fc58f46f();
                wait 0.1;
                continue;
            }
            
            if ( !isdefined( turretvehicle.var_7eb3ebd5[ turretvehicle.enemy getentitynumber() ] ) && turretvehicle targetting_delay::function_1c169b3a( turretvehicle.enemy ) )
            {
                turretvehicle.var_c8072bcc = gettime();
                turretvehicle.var_7eb3ebd5[ turretvehicle.enemy getentitynumber() ] = #"forwardscan";
            }
        }
        
        if ( turretvehicle has_active_enemy( bundle ) && isdefined( turretvehicle.enemy ) && isalive( turretvehicle.enemy ) )
        {
            turretvehicle.turretrotscale = getdvarfloat( #"hash_7a767607be3081e9", 3 );
            
            if ( !isdefined( turretvehicle.turret_target ) || turretvehicle.turret_target != turretvehicle.enemy )
            {
                turretvehicle.turret_target = turretvehicle.enemy;
                
                if ( !isdefined( turretvehicle.var_2b8e6720 ) || turretvehicle.var_2b8e6720 + 5000 < gettime() )
                {
                    turretvehicle playsoundtoteam( "mpl_ultimate_turret_lockon", turretvehicle.team );
                    turretvehicle playsoundtoteam( "mpl_ultimate_turret_lockon_enemy", util::getotherteam( turretvehicle.team ) );
                    turretvehicle.var_2b8e6720 = gettime();
                }
                
                turretvehicle childthread function_b8952a40( 0 );
            }
            
            if ( turretvehicle.turretontarget && turretvehicle function_2034705c( bundle ) && turretvehicle cansee( turretvehicle.enemy ) )
            {
                if ( burst_fire_enabled )
                {
                    fire_time = min_burst_time > max_burst_time ? min_burst_time : randomfloatrange( min_burst_time, max_burst_time );
                    var_fc9f290e = turretvehicle.enemy;
                    turretvehicle vehicle_ai::fire_for_time( fire_time, 0, turretvehicle.enemy );
                    var_afae28e0 = !isdefined( var_fc9f290e ) || !isalive( var_fc9f290e );
                    
                    if ( min_pause_time > 0 && !var_afae28e0 )
                    {
                        pause_time = min_pause_time > max_pause_time ? min_pause_time : randomfloatrange( min_pause_time, max_pause_time );
                        waitresult = turretvehicle.turret_target waittilltimeout( pause_time, #"death", #"disconnect" );
                        var_afae28e0 = waitresult._notify === "death";
                    }
                }
                else
                {
                    var_fc9f290e = turretvehicle.enemy;
                    turretvehicle vehicle_ai::fire_for_rounds( 10, 0, turretvehicle.enemy );
                    var_afae28e0 = !isdefined( var_fc9f290e ) || !isalive( var_fc9f290e );
                }
                
                if ( var_afae28e0 && isdefined( turretvehicle.turret_target ) && isdefined( turretvehicle.turret_target.var_e78602fc ) && turretvehicle.turret_target.var_e78602fc == turretvehicle )
                {
                    if ( isdefined( turretvehicle.owner ) )
                    {
                        turretvehicle.owner luinotifyevent( #"mini_turret_kill" );
                        turretvehicle.owner playsoundtoplayer( #"hash_7ea486136cd776c", turretvehicle.owner );
                    }
                    
                    turretvehicle.turretrotscale = 1;
                    wait randomfloatrange( 0.05, 0.2 );
                }
            }
            else
            {
                wait 0.25;
            }
            
            continue;
        }
        
        var_4ec572ee = isdefined( turretvehicle.turret_target );
        var_bb861d93 = 0;
        
        if ( var_4ec572ee && issentient( turretvehicle.turret_target ) )
        {
            var_bb861d93 = isalive( turretvehicle.turret_target );
            turretvehicle setpersonalignore( turretvehicle.turret_target, 1.5 );
        }
        
        turretvehicle function_fc58f46f();
        turretvehicle.turretrotscale = 1;
        
        if ( var_4ec572ee && var_bb861d93 )
        {
            turretvehicle playsoundtoteam( "mpl_turret_lost", turretvehicle.team );
            turretvehicle playsoundtoteam( "mpl_turret_lost_enemy", util::getotherteam( turretvehicle.team ) );
        }
        
        if ( turretvehicle.var_63d65a8d == "arc" )
        {
            if ( turretvehicle.scanpos === "left" )
            {
                turretvehicle turretsettargetangles( 0, ( -10, 40, 0 ) );
                turretvehicle.scanpos = "right";
            }
            else
            {
                turretvehicle turretsettargetangles( 0, ( -10, -40, 0 ) );
                turretvehicle.scanpos = "left";
            }
        }
        else if ( turretvehicle.scanpos === "left" )
        {
            turretvehicle turretsettargetangles( 0, ( -10, 180, 0 ) );
            turretvehicle.scanpos = "left2";
        }
        else if ( turretvehicle.scanpos === "left2" )
        {
            turretvehicle turretsettargetangles( 0, ( -10, 360, 0 ) );
            turretvehicle.scanpos = "right";
        }
        else if ( turretvehicle.scanpos === "right" )
        {
            turretvehicle turretsettargetangles( 0, ( -10, -180, 0 ) );
            turretvehicle.scanpos = "right2";
        }
        else
        {
            turretvehicle turretsettargetangles( 0, ( -10, -360, 0 ) );
            turretvehicle.scanpos = "left";
        }
        
        waitresult = turretvehicle waittilltimeout( 3.5, #"enemy" );
        
        if ( waitresult._notify == #"enemy" && isdefined( turretvehicle.enemy ) )
        {
            if ( turretvehicle.var_aac73d6c && !isdefined( turretvehicle.enemylastseentime ) )
            {
                attempts = 0;
                max_tries = 10;
                
                while ( attempts < max_tries && !isdefined( turretvehicle.enemylastseentime ) && isdefined( turretvehicle.enemy ) )
                {
                    turretvehicle getperfectinfo( self.enemy, 0 );
                    attempts++;
                    wait 0.1;
                }
            }
        }
    }
}

// Namespace ultimate_turret/ultimate_turret
// Params 4
// Checksum 0x263aa743, Offset: 0x2958
// Size: 0x3a, Type: bool
function turretallowfriendlyfiredamage( einflictor, eattacker, smeansofdeath, weapon )
{
    return !( isdefined( self.var_54b19f55 ) && self.var_54b19f55 );
}

