#using scripts\core_common\ai\systems\ai_interface;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\targetting_delay;
#using scripts\core_common\turret_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\vehicle_ai_shared;
#using scripts\core_common\vehicle_shared;
#using scripts\core_common\weapons_shared;
#using scripts\killstreaks\killstreaks_shared;
#using scripts\killstreaks\remote_weapons;

#namespace lead_drone;

// Namespace lead_drone/lead_drone
// Params 0, eflags: 0x2
// Checksum 0x4f75f9ec, Offset: 0x1c8
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"lead_drone", &__init__, undefined, undefined );
}

// Namespace lead_drone/lead_drone
// Params 0
// Checksum 0x2986f048, Offset: 0x210
// Size: 0x5c
function __init__()
{
    vehicle::add_main_callback( "lead_drone", &function_e8549ef6 );
    clientfield::register( "vehicle", "lead_drone_reload", 1, 1, "int" );
}

// Namespace lead_drone/lead_drone
// Params 0, eflags: 0x4
// Checksum 0xc045ab23, Offset: 0x278
// Size: 0x1ec
function private function_e8549ef6()
{
    self endon( #"death" );
    self useanimtree( "generic" );
    vehicle::make_targetable( self, ( 0, 0, 0 ) );
    ai::createinterfaceforentity( self );
    self.health = self.healthdefault;
    self vehicle::friendly_fire_shield();
    self setneargoalnotifydist( 40 );
    self.damagetaken = 0;
    self.fovcosine = 0;
    self.fovcosinebusy = 0.574;
    self.vehaircraftcollisionenabled = 1;
    self.var_94e2cf87 = 1;
    self.settings = struct::get_script_bundle( "vehiclecustomsettings", self.scriptbundlesettings );
    self.var_ec0d66ce = 0.5 * ( self.settings.engagementdistmin + self.settings.engagementdistmax );
    self.var_ff6d7c88 = self.var_ec0d66ce * self.var_ec0d66ce;
    self.vehaircraftcollisionenabled = 0;
    self.ai.var_88b0fd29 = gettime();
    self.ai.var_54b19f55 = 1;
    self.ai.clipsize = 60;
    self.ai.bulletsinclip = 60;
    defaultrole();
    self.overridevehicledamage = &function_9bbb40ab;
    self thread targetting_delay::function_7e1a12ce( 3500 );
}

// Namespace lead_drone/lead_drone
// Params 0, eflags: 0x4
// Checksum 0x22553dc9, Offset: 0x470
// Size: 0x54
function private side_turrets_forward()
{
    self turretsettargetangles( 1, ( 10, -90, 0 ) );
    self turretsettargetangles( 2, ( 10, 90, 0 ) );
}

// Namespace lead_drone/lead_drone
// Params 0
// Checksum 0x30a457d8, Offset: 0x4d0
// Size: 0xf4
function defaultrole()
{
    self vehicle_ai::init_state_machine_for_role();
    self vehicle_ai::get_state_callbacks( "combat" ).enter_func = &state_combat_enter;
    self vehicle_ai::get_state_callbacks( "combat" ).update_func = &state_combat_update;
    self vehicle_ai::get_state_callbacks( "combat" ).exit_func = &state_combat_exit;
    self vehicle_ai::get_state_callbacks( "death" ).update_func = &state_death_update;
    vehicle_ai::startinitialstate( "combat" );
}

// Namespace lead_drone/lead_drone
// Params 1
// Checksum 0x26b313dc, Offset: 0x5d0
// Size: 0x124
function state_death_update( params )
{
    self endon( #"death" );
    death_type = vehicle_ai::get_death_type( params );
    
    if ( !isdefined( death_type ) )
    {
        params.death_type = "gibbed";
        death_type = params.death_type;
    }
    
    self vehicle_ai::clearalllookingandtargeting();
    self vehicle_ai::clearallmovement();
    self cancelaimove();
    self setspeedimmediate( 0 );
    self setvehvelocity( ( 0, 0, 0 ) );
    self setphysacceleration( ( 0, 0, 0 ) );
    self setangularvelocity( ( 0, 0, 0 ) );
    self vehicle_ai::defaultstate_death_update( params );
}

// Namespace lead_drone/lead_drone
// Params 0
// Checksum 0x8faca29, Offset: 0x700
// Size: 0x28c
function function_f358791()
{
    self endon( #"death", #"change_state" );
    wait 1;
    
    for ( ;; )
    {
        if ( isdefined( self.isstunned ) && self.isstunned )
        {
            self.favoriteenemy = undefined;
            waitframe( 1 );
            continue;
        }
        
        targets = [];
        targetsmissile = [];
        players = level.players;
        
        foreach ( player in players )
        {
            if ( self cantargetplayer( player ) )
            {
                targets[ targets.size ] = player;
            }
        }
        
        tanks = getentarray( "talon", "targetname" );
        
        foreach ( tank in tanks )
        {
            if ( self cantargettank( tank ) )
            {
                targets[ targets.size ] = tank;
            }
        }
        
        actors = getactorarray();
        
        foreach ( actor in actors )
        {
            if ( self cantargetactor( actor ) )
            {
                targets[ targets.size ] = actor;
            }
        }
        
        self.var_dac49144 = function_b2cc6703( targets );
        wait 1;
    }
}

// Namespace lead_drone/lead_drone
// Params 1
// Checksum 0xa4384408, Offset: 0x998
// Size: 0x24c
function function_b2cc6703( targets )
{
    entnum = self getentitynumber();
    
    for ( idx = 0; idx < targets.size ; idx++ )
    {
        if ( !isdefined( targets[ idx ].var_629a6b13 ) )
        {
            targets[ idx ].var_629a6b13 = [];
        }
        
        targets[ idx ].var_629a6b13[ entnum ] = 0;
        
        if ( isdefined( targets[ idx ].type ) && targets[ idx ].type == "dog" )
        {
            update_dog_threat( targets[ idx ] );
            continue;
        }
        
        if ( isactor( targets[ idx ] ) )
        {
            update_actor_threat( targets[ idx ] );
            continue;
        }
        
        if ( isplayer( targets[ idx ] ) )
        {
            update_player_threat( targets[ idx ] );
            continue;
        }
        
        update_non_player_threat( targets[ idx ] );
    }
    
    var_8ec7f501 = undefined;
    highest = -1;
    
    for ( idx = 0; idx < targets.size ; idx++ )
    {
        assert( isdefined( targets[ idx ].var_629a6b13[ entnum ] ), "<dev string:x38>" );
        
        if ( targets[ idx ].var_629a6b13[ entnum ] >= highest )
        {
            highest = targets[ idx ].var_629a6b13[ entnum ];
            var_8ec7f501 = targets[ idx ];
        }
    }
    
    return var_8ec7f501;
}

// Namespace lead_drone/lead_drone
// Params 1, eflags: 0x4
// Checksum 0x18b716cd, Offset: 0xbf0
// Size: 0x29a
function private update_player_threat( player )
{
    entnum = self getentitynumber();
    player.var_629a6b13[ entnum ] = 0;
    dist = distance( player.origin, self.origin );
    player.var_629a6b13[ entnum ] -= dist;
    
    if ( isdefined( self.attacker ) && player == self.attacker )
    {
        player.var_629a6b13[ entnum ] += 100;
    }
    
    if ( isdefined( player.carryobject ) )
    {
        player.var_629a6b13[ entnum ] += 200;
    }
    
    if ( player weapons::has_launcher() )
    {
        if ( player weapons::has_lockon( self ) )
        {
            player.var_629a6b13[ entnum ] += 1000;
        }
        else
        {
            player.var_629a6b13[ entnum ] += 500;
        }
    }
    
    if ( player weapons::has_heavy_weapon() )
    {
        player.var_629a6b13[ entnum ] += 300;
    }
    
    if ( player weapons::has_lmg() )
    {
        player.var_629a6b13[ entnum ] += 200;
    }
    
    if ( isdefined( player.antithreat ) )
    {
        player.var_629a6b13[ entnum ] -= player.antithreat;
    }
    
    if ( player.var_629a6b13[ entnum ] <= 0 )
    {
        player.var_629a6b13[ entnum ] = 2;
    }
}

// Namespace lead_drone/lead_drone
// Params 1, eflags: 0x4
// Checksum 0xbf72eb90, Offset: 0xe98
// Size: 0xca
function private update_non_player_threat( non_player )
{
    entnum = self getentitynumber();
    non_player.var_629a6b13[ entnum ] = 0;
    dist = distance( non_player.origin, self.origin );
    non_player.var_629a6b13[ entnum ] -= dist;
    
    if ( non_player.var_629a6b13[ entnum ] <= 0 )
    {
        non_player.var_629a6b13[ entnum ] = 1;
    }
}

// Namespace lead_drone/lead_drone
// Params 1, eflags: 0x4
// Checksum 0xfb9e061b, Offset: 0xf70
// Size: 0x1c2
function private update_actor_threat( actor )
{
    entnum = self getentitynumber();
    actor.var_629a6b13[ entnum ] = 0;
    dist = distance( actor.origin, self.origin );
    actor.var_629a6b13[ entnum ] -= dist;
    
    if ( isdefined( actor.owner ) )
    {
        if ( isdefined( self.attacker ) && actor.owner == self.attacker )
        {
            actor.var_629a6b13[ entnum ] += 100;
        }
        
        if ( isdefined( actor.owner.carryobject ) )
        {
            actor.var_629a6b13[ entnum ] += 200;
        }
        
        if ( isdefined( actor.owner.antithreat ) )
        {
            actor.var_629a6b13[ entnum ] -= actor.owner.antithreat;
        }
    }
    
    if ( actor.var_629a6b13[ entnum ] <= 0 )
    {
        actor.var_629a6b13[ entnum ] = 1;
    }
}

// Namespace lead_drone/lead_drone
// Params 1, eflags: 0x4
// Checksum 0xf8a48fc9, Offset: 0x1140
// Size: 0x9a
function private update_dog_threat( dog )
{
    entnum = self getentitynumber();
    dog.var_629a6b13[ entnum ] = 0;
    dist = distance( dog.origin, self.origin );
    dog.var_629a6b13[ entnum ] -= dist;
}

// Namespace lead_drone/lead_drone
// Params 1
// Checksum 0x359e37b7, Offset: 0x11e8
// Size: 0x1d4, Type: bool
function cantargetplayer( player )
{
    if ( !isdefined( player ) )
    {
        return false;
    }
    
    if ( !isalive( player ) || player.sessionstate != "playing" )
    {
        return false;
    }
    
    if ( player.ignoreme === 1 )
    {
        return false;
    }
    
    if ( isdefined( self.owner ) && player == self.owner )
    {
        return false;
    }
    
    if ( !isdefined( player.team ) )
    {
        return false;
    }
    
    if ( level.teambased && player.team == self.team )
    {
        return false;
    }
    
    if ( player.team == #"spectator" )
    {
        return false;
    }
    
    if ( !self cansee( player, 2 ) )
    {
        return false;
    }
    
    if ( player depthinwater() >= 30 || player isplayerswimming() )
    {
        return false;
    }
    
    var_2910def0 = self targetting_delay::function_1c169b3a( player );
    targetting_delay::function_a4d6d6d8( player, int( ( isdefined( self.targeting_delay ) ? self.targeting_delay : 0.05 ) * 1000 ) );
    
    if ( !var_2910def0 )
    {
        return false;
    }
    
    return true;
}

// Namespace lead_drone/lead_drone
// Params 1
// Checksum 0x30ef5eb5, Offset: 0x13c8
// Size: 0x8e, Type: bool
function cantargettank( tank )
{
    if ( !isdefined( tank ) )
    {
        return false;
    }
    
    if ( !isdefined( tank.team ) )
    {
        return false;
    }
    
    if ( !util::function_fbce7263( tank.team, self.team ) )
    {
        return false;
    }
    
    if ( isdefined( tank.owner ) && self.owner == tank.owner )
    {
        return false;
    }
    
    return true;
}

// Namespace lead_drone/lead_drone
// Params 1
// Checksum 0xb1a16adc, Offset: 0x1460
// Size: 0x8e, Type: bool
function cantargetactor( actor )
{
    if ( !isdefined( actor ) )
    {
        return false;
    }
    
    if ( !isactor( actor ) )
    {
        return false;
    }
    
    if ( !isalive( actor ) )
    {
        return false;
    }
    
    if ( !isdefined( actor.team ) )
    {
        return false;
    }
    
    if ( !util::function_fbce7263( actor.team, self.team ) )
    {
        return false;
    }
    
    return true;
}

// Namespace lead_drone/lead_drone
// Params 1
// Checksum 0x4283156a, Offset: 0x14f8
// Size: 0x54
function state_combat_enter( params )
{
    self.protectdest = self.origin;
    self function_a57c34b7( self.origin, 1, 1 );
    self thread function_f358791();
}

// Namespace lead_drone/lead_drone
// Params 0
// Checksum 0x5666373c, Offset: 0x1558
// Size: 0x7a
function reload()
{
    self laseroff();
    clientfield::set( "lead_drone_reload", 1 );
    wait 2;
    clientfield::set( "lead_drone_reload", 0 );
    self.ai.bulletsinclip = self.ai.clipsize;
}

// Namespace lead_drone/lead_drone
// Params 0
// Checksum 0x8f49926, Offset: 0x15e0
// Size: 0x1c6
function attackthread()
{
    self endon( #"death", #"change_state", #"end_attack_thread" );
    
    while ( true )
    {
        enemy = undefined;
        
        if ( isdefined( self.var_dac49144 ) )
        {
            enemy = self.var_dac49144;
            self.favoriteenemy = self.var_dac49144;
        }
        else
        {
            enemy = undefined;
            self.favoriteenemy = undefined;
        }
        
        if ( isdefined( enemy ) )
        {
            self laseron();
            self vehlookat( enemy );
            
            if ( self cansee( enemy ) )
            {
                self turretsettarget( 0, enemy );
                
                while ( !self.turretontarget )
                {
                    waitframe( 1 );
                }
                
                if ( isdefined( enemy ) )
                {
                    if ( self.ai.bulletsinclip > 0 )
                    {
                        s_turret = self turret::_get_turret_data( 0 );
                        
                        if ( isdefined( s_turret ) )
                        {
                            minigun = self fireweapon( 0, enemy, s_turret.v_offset );
                            self.ai.bulletsinclip--;
                        }
                    }
                    else
                    {
                        reload();
                    }
                }
            }
        }
        
        if ( !isdefined( self.favoriteenemy ) )
        {
            self laseroff();
        }
        
        waitframe( 1 );
    }
}

// Namespace lead_drone/lead_drone
// Params 6
// Checksum 0x2e1497f8, Offset: 0x17b0
// Size: 0x2d6
function function_1c4cd527( origin, owner, innerradius, outerradius, halfheight, spacing )
{
    queryresult = positionquery_source_navigation( origin, innerradius, outerradius, halfheight, spacing, "navvolume_small", spacing );
    positionquery_filter_sight( queryresult, origin, self geteye() - self.origin, self, 0, owner );
    
    foreach ( point in queryresult.data )
    {
        if ( !point.visibility )
        {
            /#
                if ( !isdefined( point._scoredebug ) )
                {
                    point._scoredebug = [];
                }
                
                if ( !isdefined( point._scoredebug[ #"no visibility" ] ) )
                {
                    point._scoredebug[ #"no visibility" ] = spawnstruct();
                }
                
                point._scoredebug[ #"no visibility" ].score = -5000;
                point._scoredebug[ #"no visibility" ].scorename = "<dev string:x63>";
            #/
            
            point.score += -5000;
        }
    }
    
    if ( queryresult.data.size > 0 )
    {
        vehicle_ai::positionquery_postprocess_sortscore( queryresult );
        self vehicle_ai::positionquery_debugscores( queryresult );
        
        foreach ( point in queryresult.data )
        {
            if ( isdefined( point.origin ) )
            {
                goal = point.origin;
                break;
            }
        }
    }
    
    return goal;
}

// Namespace lead_drone/lead_drone
// Params 1
// Checksum 0x210135ab, Offset: 0x1a90
// Size: 0x16e
function function_ede09a4e( owner )
{
    protectdest = undefined;
    
    if ( isdefined( owner ) )
    {
        groundpos = getclosestpointonnavmesh( owner.origin, 10000 );
        groundpos += vectorscale( anglestoforward( owner.angles ), randomintrange( 100, 200 ) );
        
        if ( isdefined( groundpos ) )
        {
            self.var_d6acaac4 = groundpos;
            pos = groundpos + ( 0, 0, randomintrange( 150, 300 ) );
            pos = getclosestpointonnavvolume( pos, "navvolume_small", 2000 );
            
            if ( isdefined( pos ) )
            {
                var_3a364b6c = distance( self.protectdest, pos );
                
                if ( var_3a364b6c > 256 )
                {
                    protectdest = function_1c4cd527( pos, self.owner, 32, 256, 48, 48 );
                    
                    if ( isdefined( protectdest ) )
                    {
                        self.protectdest = protectdest;
                    }
                }
            }
        }
    }
    
    return protectdest;
}

// Namespace lead_drone/lead_drone
// Params 0
// Checksum 0xfddcb625, Offset: 0x1c08
// Size: 0xce
function function_5ebe7443()
{
    self endon( #"death" );
    
    while ( true )
    {
        if ( isdefined( self.protectdest ) )
        {
            /#
                recordsphere( self.protectdest, 8, ( 0, 0, 1 ), "<dev string:x73>" );
            #/
            
            if ( isdefined( self.var_d6acaac4 ) )
            {
                /#
                    recordsphere( self.protectdest, 8, ( 0, 1, 0 ), "<dev string:x73>" );
                    recordline( self.protectdest, self.var_d6acaac4, ( 0, 1, 0 ), "<dev string:x73>" );
                #/
            }
        }
        
        waitframe( 1 );
    }
}

// Namespace lead_drone/lead_drone
// Params 1
// Checksum 0xdc1981c3, Offset: 0x1ce0
// Size: 0x17e
function state_combat_update( params )
{
    self endon( #"change_state", #"death" );
    self thread function_5ebe7443();
    self thread attackthread();
    
    for ( ;; )
    {
        if ( isdefined( self.ignoreall ) && self.ignoreall )
        {
            wait 1;
            continue;
        }
        
        if ( isdefined( self.owner ) && isdefined( level.var_fdf0dff2 ) && ![[ level.var_fdf0dff2 ]]( self.owner ) )
        {
            wait 1;
            continue;
        }
        
        if ( !ispointinnavvolume( self.origin, "navvolume_small" ) )
        {
            var_f524eafc = getclosestpointonnavvolume( self.origin, "navvolume_small", 2000 );
            
            if ( isdefined( var_f524eafc ) )
            {
                self.origin = var_f524eafc;
            }
        }
        
        protectdest = function_ede09a4e( self.owner );
        
        if ( isdefined( protectdest ) )
        {
            self function_a57c34b7( protectdest, 1, 1 );
        }
        
        wait 1;
    }
}

// Namespace lead_drone/lead_drone
// Params 1
// Checksum 0xc11a1b37, Offset: 0x1e68
// Size: 0x44
function state_combat_exit( params )
{
    self notify( #"end_attack_thread" );
    self notify( #"end_movement_thread" );
    self turretcleartarget( 0 );
}

// Namespace lead_drone/lead_drone
// Params 15
// Checksum 0xd88eb316, Offset: 0x1eb8
// Size: 0x30a
function function_9bbb40ab( einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal )
{
    if ( smeansofdeath == "MOD_TRIGGER_HURT" )
    {
        return 0;
    }
    
    idamage = vehicle_ai::shared_callback_damage( einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal );
    
    if ( isdefined( weapon ) )
    {
        if ( weapon.dostun && smeansofdeath == "MOD_GRENADE_SPLASH" || weapon.var_8456d4d === #"damageeffecttype_electrical" )
        {
            minempdowntime = 0.8 * ( isdefined( self.settings.empdowntime ) ? self.settings.empdowntime : 0 );
            maxempdowntime = 1.2 * ( isdefined( self.settings.empdowntime ) ? self.settings.empdowntime : 1 );
            self notify( #"emped", { #param0:randomfloatrange( minempdowntime, maxempdowntime ), #param1:eattacker, #param2:einflictor } );
        }
    }
    
    emp_damage = self.healthdefault * 0.5 + 0.5;
    idamage = killstreaks::ondamageperweapon( "drone_squadron", eattacker, idamage, idflags, smeansofdeath, weapon, self.maxhealth, &destroyed_cb, self.maxhealth * 0.4, &low_health_cb, emp_damage, undefined, 1, 1 );
    
    if ( isdefined( weapon ) )
    {
        if ( weapon.name == #"hatchet" && smeansofdeath == "MOD_IMPACT" )
        {
            idamage = self.maxhealth;
        }
    }
    
    self.damagetaken += idamage;
    return idamage;
}

// Namespace lead_drone/lead_drone
// Params 2
// Checksum 0x5feccc73, Offset: 0x21d0
// Size: 0x14
function destroyed_cb( attacker, weapon )
{
    
}

// Namespace lead_drone/lead_drone
// Params 2
// Checksum 0xa25ce08f, Offset: 0x21f0
// Size: 0x5a
function low_health_cb( attacker, weapon )
{
    if ( self.playeddamaged == 0 )
    {
        self killstreaks::play_pilot_dialog_on_owner( "damaged", "drone_squadron", self.killstreak_id );
        self.playeddamaged = 1;
    }
}

