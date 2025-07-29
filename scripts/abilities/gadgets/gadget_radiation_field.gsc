#using scripts\abilities\ability_player;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\damagefeedback_shared;
#using scripts\core_common\gameobjects_shared;
#using scripts\core_common\globallogic\globallogic_score;
#using scripts\core_common\killcam_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\scoreevents_shared;
#using scripts\core_common\status_effects\status_effect_util;
#using scripts\core_common\util_shared;

#namespace gadget_radiation_field;

// Namespace gadget_radiation_field/gadget_radiation_field
// Params 0
// Checksum 0x79e691eb, Offset: 0x328
// Size: 0x174
function init_shared()
{
    if ( getgametypesetting( #"competitivesettings" ) === 1 )
    {
        level.radiationfield_bundle = getscriptbundle( "radiation_field_custom_settings_comp" );
    }
    else
    {
        level.radiationfield_bundle = getscriptbundle( "radiation_field_bundle" );
    }
    
    clientfield::register( "scriptmover", "cf_overclock_fx", 1, 1, "int" );
    clientfield::register( "scriptmover", "self_destruct_start", 1, 1, "int" );
    clientfield::register( "scriptmover", "self_destruct_end", 1, 1, "int" );
    ability_player::register_gadget_activation_callbacks( 24, &gadget_on, &gadget_off );
    ability_player::register_gadget_ready_callbacks( 24, &on_ready );
    callback::on_spawned( &on_player_spawned );
}

// Namespace gadget_radiation_field/gadget_radiation_field
// Params 2
// Checksum 0xf550e862, Offset: 0x4a8
// Size: 0x11c
function on_ready( slot, weapon )
{
    player = self;
    
    if ( !isdefined( player ) || !isdefined( player._gadgets_player ) || !isdefined( player._gadgets_player[ 2 ] ) || !isdefined( player._gadgets_player[ 2 ].name ) )
    {
        return;
    }
    
    if ( player._gadgets_player[ 2 ].name === "gadget_radiation_field" )
    {
        if ( player function_d79b93e( player._gadgets_player[ 2 ].var_44c79c09 ) )
        {
            player clientfield::set_player_uimodel( "huditems.abilityHoldToActivate", 0 );
            return;
        }
        
        player clientfield::set_player_uimodel( "huditems.abilityHoldToActivate", 1 );
    }
}

// Namespace gadget_radiation_field/gadget_radiation_field
// Params 1
// Checksum 0x1c138f01, Offset: 0x5d0
// Size: 0x1a
function function_6ca75924( func )
{
    level.var_4a9c8bba = func;
}

// Namespace gadget_radiation_field/gadget_radiation_field
// Params 0
// Checksum 0x3bc97212, Offset: 0x5f8
// Size: 0x184
function on_player_spawned()
{
    player = self;
    player endon( #"death", #"disconnect" );
    player.var_ba5b487b = 0;
    
    if ( isdefined( player.var_92dddb36 ) && player.var_92dddb36 )
    {
        player function_91e05fa7();
    }
    
    if ( isdefined( player.var_e9791ff9 ) )
    {
        objective_delete( player.var_e9791ff9 );
        gameobjects::release_obj_id( player.var_e9791ff9 );
        player.var_e9791ff9 = undefined;
    }
    
    while ( !isdefined( player._gadgets_player[ 2 ] ) )
    {
        waitframe( 1 );
    }
    
    if ( player._gadgets_player[ 0 ].name === "gadget_radiation_field" )
    {
        player clientfield::set_player_uimodel( "huditems.abilityHoldToActivate", 1 );
        player.overrideplayerdamage = &player_damage_override;
    }
    else
    {
        player clientfield::set_player_uimodel( "huditems.abilityHoldToActivate", 0 );
    }
    
    player function_c5a2e918();
}

// Namespace gadget_radiation_field/gadget_radiation_field
// Params 11
// Checksum 0x7cbe171d, Offset: 0x788
// Size: 0x156
function player_damage_override( einflictor, eattacker, idamage, idflags, mod, weapon, vpoint, vdir, shitloc, modelindex, psoffsettime )
{
    if ( isdefined( self.var_d44d1214 ) )
    {
        if ( mod == "MOD_BULLET" || mod == "MOD_RIFLE_BULLET" || mod == "MOD_PISTOL_BULLET" || mod == "MOD_HEAD_SHOT" )
        {
            idamage *= isdefined( level.radiationfield_bundle.var_ebea02e3 ) ? level.radiationfield_bundle.var_ebea02e3 : 1;
            fx = level.radiationfield_bundle.var_befbf4c5;
            
            if ( isdefined( fx ) )
            {
                fxhandle = playfx( fx, vpoint, vdir * -1 );
                fxhandle.team = self.team;
            }
        }
    }
    
    return idamage;
}

// Namespace gadget_radiation_field/gadget_radiation_field
// Params 0
// Checksum 0x6bc897d4, Offset: 0x8e8
// Size: 0x358
function sndonoverride_eye_()
{
    player = self;
    player endon( #"death", #"disconnect", #"radiation_shutdown" );
    rate = 0.15;
    cur_time = 0;
    
    if ( isdefined( player.var_e9791ff9 ) )
    {
        objective_setprogress( player.var_e9791ff9, 0 );
    }
    
    total_time = level.radiationfield_bundle.baseduration + level.radiationfield_bundle.var_500496c9;
    redline = 0.75;
    player notify( #"hash_477083bb681cce64" );
    
    while ( true )
    {
        wait rate;
        cur_time += rate;
        percent = min( 1, cur_time / total_time );
        
        if ( isdefined( player.var_e9791ff9 ) )
        {
            objective_setprogress( player.var_e9791ff9, percent * redline );
        }
        
        if ( cur_time > total_time )
        {
            break;
        }
    }
    
    if ( isdefined( player.var_e9791ff9 ) )
    {
        objective_setprogress( player.var_e9791ff9, redline );
    }
    
    for ( dps = player status_effect::function_7f14a56f(); dps == 0 ; dps = player status_effect::function_7f14a56f() )
    {
        waitframe( 1 );
    }
    
    total_time = player.health / dps;
    start_health = player.health;
    
    if ( start_health < 1 )
    {
        if ( isdefined( player.var_e9791ff9 ) )
        {
            objective_delete( player.var_e9791ff9 );
            gameobjects::release_obj_id( player.var_e9791ff9 );
            player.var_e9791ff9 = undefined;
        }
        
        return;
    }
    
    cur_time = 0;
    
    while ( true )
    {
        wait rate;
        cur_time += rate;
        percent = min( 1, 1 - player.health / start_health );
        value = redline + percent * ( 1 - redline );
        value = math::clamp( value, 0, 0.99 );
        
        if ( isdefined( player.var_e9791ff9 ) )
        {
            objective_setprogress( player.var_e9791ff9, value );
        }
        
        if ( cur_time > total_time )
        {
            break;
        }
    }
}

// Namespace gadget_radiation_field/gadget_radiation_field
// Params 2
// Checksum 0x4542300, Offset: 0xc48
// Size: 0x44
function vecscale( vec, scalar )
{
    return ( vec[ 0 ] * scalar, vec[ 1 ] * scalar, vec[ 2 ] * scalar );
}

// Namespace gadget_radiation_field/gadget_radiation_field
// Params 1
// Checksum 0x9ef92bef, Offset: 0xc98
// Size: 0x14c
function on_player_killed( s_params )
{
    player = self;
    attacker = s_params.eattacker;
    
    if ( isdefined( player.var_342564dd ) && player.var_342564dd )
    {
        attacker = s_params.eattacker;
        
        if ( attacker === player )
        {
            player.var_d44d1214 clientfield::set( "self_destruct_end", 1 );
        }
        else if ( isdefined( attacker ) && isdefined( self ) && util::function_fbce7263( attacker.team, self.team ) )
        {
            weapon = s_params.weapon;
            scoreevents::processscoreevent( #"radiation_field_shutdown", attacker, player, weapon );
        }
    }
    
    player callback::function_52ac9652( #"on_player_killed_with_params", &on_player_killed );
}

// Namespace gadget_radiation_field/gadget_radiation_field
// Params 1
// Checksum 0x8f5b6bbf, Offset: 0xdf0
// Size: 0x4b4
function function_1503c832( weapon )
{
    player = self;
    player setclientthirdperson( 1 );
    player disableweaponcycling();
    prevstance = player getstance();
    player setstance( "crouch" );
    player allowprone( 0 );
    player allowstand( 0 );
    player function_f985d66c( 1 );
    player.var_342564dd = 1;
    player callback::function_d8abfc3d( #"on_player_killed_with_params", &on_player_killed );
    fwd = vecscale( vectornormalize( anglestoforward( player.angles ) ), 20 );
    player.var_ab42e44e = player.origin;
    player.var_ab42e44e += fwd;
    player.var_e9791ff9 = gameobjects::get_next_obj_id();
    objective_add( player.var_e9791ff9, "active", ( player.var_ab42e44e[ 0 ], player.var_ab42e44e[ 1 ], player.var_ab42e44e[ 2 ] ), #"hash_1bf4e9e4ba326a9" );
    objective_setteam( player.var_e9791ff9, player.team );
    objective_setinvisibletoall( player.var_e9791ff9 );
    objective_setvisibletoplayer( player.var_e9791ff9, player );
    anchor = spawn( "script_model", player.var_ab42e44e, 0, ( 0, 0, 1 ) );
    anchor setowner( player );
    anchor setteam( player.team );
    anchor setmodel( #"wpn_t8_sig_radiation_device_world" );
    anchor ghost();
    anchor linkto( player );
    player thread sndonoverride_eye_();
    anchor clientfield::set( "cf_overclock_fx", 1 );
    anchor clientfield::set( "self_destruct_start", 0 );
    anchor clientfield::set( "self_destruct_end", 0 );
    player.var_d44d1214 = anchor;
    killcament = spawn( "script_model", player.origin + ( 0, 0, 100 ) );
    killcament util::deleteaftertime( 15 );
    killcament.starttime = gettime();
    killcament linkto( anchor );
    killcament setweapon( getweapon( #"gadget_radiation_field" ) );
    anchor killcam::store_killcam_entity_on_entity( killcament );
    player thread function_a1cc4c59( weapon, killcament );
    player thread function_579fff1b();
}

// Namespace gadget_radiation_field/gadget_radiation_field
// Params 2
// Checksum 0x99469bf6, Offset: 0x12b0
// Size: 0x5e
function state_watch( state_id, time )
{
    player = self;
    player endon( #"radiation_shutdown" );
    wait time;
    
    if ( isdefined( player ) )
    {
        player notify( "state_done_" + state_id );
    }
}

// Namespace gadget_radiation_field/gadget_radiation_field
// Params 0
// Checksum 0x77b56826, Offset: 0x1318
// Size: 0x122
function function_c5a2e918()
{
    player = self;
    
    if ( isdefined( player.var_c9bf1c69 ) )
    {
        foreach ( loop_ent in player.var_c9bf1c69 )
        {
            loop_ent stoploopsound( 0.1 );
        }
        
        foreach ( loop_ent in player.var_c9bf1c69 )
        {
            loop_ent delete();
        }
        
        player.var_c9bf1c69 = undefined;
    }
}

// Namespace gadget_radiation_field/gadget_radiation_field
// Params 2
// Checksum 0x9a693109, Offset: 0x1448
// Size: 0x36, Type: bool
function function_408b42b4( val, arg )
{
    return isdefined( val.archetype ) && val.archetype == arg;
}

// Namespace gadget_radiation_field/gadget_radiation_field
// Params 2
// Checksum 0x2f833e75, Offset: 0x1488
// Size: 0x7c
function function_7e96addd( var_4411cc03, player )
{
    if ( !isdefined( level.heroplaydialog ) )
    {
        return;
    }
    
    buffer = 0;
    
    if ( isdefined( level.var_ac6052e9 ) )
    {
        buffer = [[ level.var_ac6052e9 ]]( "playerExertBuffer", 0 );
    }
    
    player thread [[ level.heroplaydialog ]]( var_4411cc03, 30, buffer );
}

// Namespace gadget_radiation_field/gadget_radiation_field
// Params 11
// Checksum 0xdbb003aa, Offset: 0x1510
// Size: 0x1036
function damage_state( state_id, weapon, min_radius, max_radius, min_height, max_height, duration, var_32900164, loop_sound, var_d68ee2ab, killcament )
{
    player = self;
    
    if ( state_id < 3 )
    {
        player thread state_watch( state_id, duration );
    }
    
    player endon( "state_done_" + state_id, #"radiation_shutdown", #"death", #"disconnect" );
    var_adf90433 = getstatuseffect( var_32900164 );
    var_327bdee = undefined;
    
    if ( isdefined( var_d68ee2ab ) )
    {
        var_327bdee = getstatuseffect( var_d68ee2ab );
        
        if ( isdefined( level.heroplaydialog ) )
        {
            buffer = 0;
            
            if ( isdefined( level.var_ac6052e9 ) )
            {
                buffer = [[ level.var_ac6052e9 ]]( "playerExertBuffer", 0 );
            }
            
            player [[ level.heroplaydialog ]]( "exertRadiationSelfStart", 30, buffer );
            var_a0f6ec2e = gettime() + 1000;
        }
    }
    
    enemyteam = util::getotherteam( player.team );
    dt = 0.1;
    radius = min_radius;
    half_height = min_height;
    nsteps = duration / dt;
    radius_delta = ( max_radius - min_radius ) / nsteps;
    var_a9e00cb3 = ( max_height - min_height ) / nsteps;
    player_radius = 10;
    var_1d93ec08 = int( level.radiationfield_bundle.var_533b6b6e * 1000 );
    
    while ( true )
    {
        fwd = vecscale( vectornormalize( anglestoforward( player.angles ) ), 20 );
        player.var_ab42e44e = player.origin;
        player.var_ab42e44e += fwd;
        radius += player_radius;
        radius2 = radius * radius;
        
        if ( isdefined( var_327bdee ) )
        {
            player thread status_effect::status_effect_apply( var_327bdee, weapon, player, 0 );
            
            if ( isdefined( level.heroplaydialog ) && gettime() > var_a0f6ec2e )
            {
                buffer = 0;
                
                if ( isdefined( level.var_ac6052e9 ) )
                {
                    buffer = [[ level.var_ac6052e9 ]]( "playerExertBuffer", 0 );
                }
                
                player [[ level.heroplaydialog ]]( "exertRadiationSelfLoop", 30, buffer );
                var_a0f6ec2e = gettime() + 1000;
            }
        }
        
        var_7ba94ed3 = 0;
        var_5e39ac54 = 0;
        
        if ( !isdefined( player.var_5350f794 ) || gettime() - player.var_5350f794 >= var_1d93ec08 )
        {
            var_5e39ac54 = 1;
        }
        
        players = level.aliveplayers[ enemyteam ];
        var_cef2372f = getactorteamarray( enemyteam );
        
        if ( !level.teambased )
        {
            players = level.aliveplayers[ #"free" ];
            var_cef2372f = getactorteamarray( #"free" );
        }
        
        var_dafaac88 = arraycombine( players, var_cef2372f, 0, 0 );
        var_480b4b92 = 0;
        
        foreach ( var_a3ca7cb2 in var_dafaac88 )
        {
            if ( !isdefined( var_a3ca7cb2 ) )
            {
                continue;
            }
            
            if ( var_a3ca7cb2 == player )
            {
                continue;
            }
            
            dist = distance2d( player.var_ab42e44e, var_a3ca7cb2.origin );
            var_a698a6df = dist < radius && var_a3ca7cb2.origin[ 2 ] < player.var_ab42e44e[ 2 ] + half_height && var_a3ca7cb2.origin[ 2 ] > player.var_ab42e44e[ 2 ] - half_height;
            
            if ( var_a698a6df )
            {
                if ( var_a3ca7cb2.archetype === #"mp_dog" && util::function_fbce7263( var_a3ca7cb2.team, player.team ) )
                {
                    health = level.killstreakbundle[ #"dog" ].kshealth;
                    lifetime = isdefined( level.killstreakbundle[ #"dog" ].var_b45a7714 ) ? level.killstreakbundle[ #"dog" ].var_b45a7714 : 3;
                    var_ae727111 = health / lifetime;
                    var_ae727111 *= dt;
                    var_a3ca7cb2 dodamage( var_ae727111, var_a3ca7cb2.origin, player, player, "none", "MOD_BURNED" );
                }
                else
                {
                    if ( !isdefined( var_a3ca7cb2.var_15359864 ) )
                    {
                        var_a3ca7cb2.var_15359864 = player;
                        
                        if ( !isdefined( player.var_57e6a430 ) )
                        {
                            player.var_57e6a430 = [];
                        }
                        
                        array::add( player.var_57e6a430, var_a3ca7cb2 );
                        player playlocalsound( #"hash_6808d51f3971786e" );
                        
                        if ( isplayer( var_a3ca7cb2 ) )
                        {
                            var_a3ca7cb2 playlocalsound( #"hash_7890710107740214" );
                            function_7e96addd( "exertRadiationSelfStart", var_a3ca7cb2 );
                        }
                    }
                    
                    if ( isplayer( var_a3ca7cb2 ) && !var_480b4b92 && var_a3ca7cb2 function_4e7b9eed() < 1 )
                    {
                        player damagefeedback::update( undefined, undefined, "flakjacket", weapon );
                        var_6f4ece8f = 1;
                    }
                    
                    if ( isdefined( var_5e39ac54 ) && var_5e39ac54 && var_a3ca7cb2.archetype !== #"robot" )
                    {
                        var_7ba94ed3++;
                    }
                    
                    var_a3ca7cb2.var_4dcf932b = player;
                    dot_scaler = 1;
                    
                    if ( dist < level.radiationfield_bundle.var_e914cf2b )
                    {
                        t = 1 - dist / level.radiationfield_bundle.var_e914cf2b;
                        dot_scaler = 1 - t + level.radiationfield_bundle.var_c3e28ba8 * t;
                    }
                    
                    if ( level.hardcoremode )
                    {
                        dot_scaler *= isdefined( level.radiationfield_bundle.var_78c1e37b ) ? level.radiationfield_bundle.var_78c1e37b : 0.25;
                    }
                    
                    if ( isplayer( var_a3ca7cb2 ) )
                    {
                        dot_scaler *= var_a3ca7cb2 function_4e7b9eed();
                    }
                    
                    var_65939bc3 = var_adf90433.dotdamage;
                    var_a2755834 = var_adf90433.var_44ff1a4;
                    var_adf90433.dotdamage = int( var_adf90433.dotdamage * dot_scaler );
                    var_adf90433.var_44ff1a4 = int( var_adf90433.var_44ff1a4 * dot_scaler );
                    
                    if ( !isdefined( player.radiationdamage ) )
                    {
                        player.radiationdamage = 0;
                    }
                    
                    player.radiationdamage += var_adf90433.dotdamage;
                    var_adf90433.killcament = killcament;
                    var_a3ca7cb2 thread status_effect::status_effect_apply( var_adf90433, weapon, player, 0 );
                    
                    if ( isdefined( level.var_ac6052e9 ) )
                    {
                        if ( ( isdefined( var_a3ca7cb2.var_a267ce8 ) ? var_a3ca7cb2.var_a267ce8 : 0 ) + int( [[ level.var_ac6052e9 ]]( "radiationDamageCooldown", 200 ) * 1000 ) < gettime() )
                        {
                            function_7e96addd( "exertRadiationSelfLoop", var_a3ca7cb2 );
                            var_a3ca7cb2.var_a267ce8 = gettime();
                        }
                    }
                    
                    var_adf90433.dotdamage = var_65939bc3;
                    var_adf90433.var_44ff1a4 = var_a2755834;
                    var_a3ca7cb2.var_ba5b487b = 1;
                }
                
                continue;
            }
            
            var_a3ca7cb2 status_effect::function_408158ef( var_adf90433.setype, var_adf90433.var_18d16a6b );
            var_a3ca7cb2.var_38103eed = 0;
            
            if ( isdefined( var_a3ca7cb2.var_ba5b487b ) && var_a3ca7cb2.var_ba5b487b )
            {
                function_7e96addd( "exertRadiationSelfEnd", var_a3ca7cb2 );
                var_a3ca7cb2.var_ba5b487b = 0;
            }
        }
        
        vehicles = getentarraybytype( 12 );
        
        for ( i = 0; i < vehicles.size ; i++ )
        {
            veh = vehicles[ i ];
            
            if ( util::function_fbce7263( veh.team, player.team ) )
            {
                if ( veh.archetype === "mini_ai_quadtank" || veh.archetype === "rcbomb" )
                {
                    dist = distance2d( player.var_ab42e44e, veh.origin );
                    var_a698a6df = dist < radius && veh.origin[ 2 ] < player.var_ab42e44e[ 2 ] + half_height && veh.origin[ 2 ] > player.var_ab42e44e[ 2 ] - half_height;
                    
                    if ( isdefined( var_a698a6df ) && var_a698a6df )
                    {
                        if ( veh.archetype === "rcbomb" )
                        {
                            health = level.killstreakbundle[ #"recon_car" ].kshealth;
                            lifetime = isdefined( level.killstreakbundle[ #"recon_car" ].var_b45a7714 ) ? level.killstreakbundle[ #"recon_car" ].var_b45a7714 : 3;
                        }
                        else
                        {
                            health = level.killstreakbundle[ #"tank_robot" ].kshealth;
                            lifetime = isdefined( level.killstreakbundle[ #"tank_robot" ].var_b45a7714 ) ? level.killstreakbundle[ #"tank_robot" ].var_b45a7714 : 3;
                        }
                        
                        var_ae727111 = health / lifetime;
                        var_ae727111 *= dt;
                        veh dodamage( var_ae727111, veh.origin, player, player, "none", "MOD_BURNED" );
                    }
                }
            }
        }
        
        if ( isdefined( var_5e39ac54 ) && var_5e39ac54 )
        {
            if ( var_7ba94ed3 > 0 )
            {
                player.var_5350f794 = gettime();
                scoreevents::processscoreevent( #"radiation_field_radiating_enemy", player, undefined, weapon, var_7ba94ed3 );
            }
        }
        
        if ( isdefined( level.playgadgetsuccess ) && isdefined( player.radiationdamage ) )
        {
            if ( isdefined( level.var_ac6052e9 ) )
            {
                var_9194a036 = [[ level.var_ac6052e9 ]]( "RadiationFieldSuccessLineCount", 0 ) * 25;
            }
            
            if ( player.radiationdamage > ( isdefined( var_9194a036 ) ? var_9194a036 : 0 ) && !( isdefined( player.var_25db02aa ) && player.var_25db02aa ) )
            {
                player.var_25db02aa = 1;
                player [[ level.playgadgetsuccess ]]( weapon, undefined, undefined, undefined );
            }
        }
        
        wait dt;
        radius += radius_delta;
        half_height += var_a9e00cb3;
        
        if ( radius > max_radius )
        {
            radius = max_radius;
        }
        
        if ( half_height > max_height )
        {
            height = max_height;
        }
    }
}

// Namespace gadget_radiation_field/gadget_radiation_field
// Params 2
// Checksum 0x23091270, Offset: 0x2550
// Size: 0x2cc
function function_a1cc4c59( weapon, killcament )
{
    player = self;
    player endon( #"radiation_shutdown", #"disconnect" );
    player.var_5350f794 = undefined;
    damage_state( 1, weapon, level.radiationfield_bundle.var_4d16c61f, level.radiationfield_bundle.var_9c3a936e, level.radiationfield_bundle.baseheightmin, level.radiationfield_bundle.baseheightmax, level.radiationfield_bundle.baseduration, level.radiationfield_bundle.var_1acd89e2, level.radiationfield_bundle.var_e5a95fca, undefined, killcament );
    damage_state( 2, weapon, level.radiationfield_bundle.var_9c3a936e, level.radiationfield_bundle.var_2b4199b5, level.radiationfield_bundle.baseheightmax, level.radiationfield_bundle.midheight, level.radiationfield_bundle.var_500496c9, level.radiationfield_bundle.var_1acd89e2, level.radiationfield_bundle.var_e5a95fca, undefined, killcament );
    player playlocalsound( #"hash_352529c7ca9f6143" );
    player hide_player();
    player.var_d44d1214 clientfield::set( "self_destruct_start", 1 );
    player function_6b83f6a9( 1 );
    player function_ad7b9f4a( "RAISEWEAPON", weapon, 0, 0, 1, 0 );
    damage_state( 3, weapon, level.radiationfield_bundle.var_2b4199b5, level.radiationfield_bundle.var_cbe3d2b8, level.radiationfield_bundle.midheight, level.radiationfield_bundle.finalheight, level.radiationfield_bundle.finalduration, level.radiationfield_bundle.var_3ef39bc5, level.radiationfield_bundle.var_d0e0a088, level.radiationfield_bundle.var_8d1e6357, killcament );
    player function_c5a2e918();
}

// Namespace gadget_radiation_field/gadget_radiation_field
// Params 1
// Checksum 0xf0192a97, Offset: 0x2828
// Size: 0xa2
function function_3cbab338( var_fb096220 )
{
    player = self;
    player setclientthirdperson( 0 );
    player function_f985d66c( 0 );
    player enableweaponcycling();
    player setstance( "stand" );
    
    if ( isdefined( var_fb096220 ) && var_fb096220 )
    {
        player.var_342564dd = 0;
    }
}

// Namespace gadget_radiation_field/gadget_radiation_field
// Params 0
// Checksum 0x79e7ffe7, Offset: 0x28d8
// Size: 0x17c
function function_579fff1b()
{
    player = self;
    player endon( #"death", #"disconnect", #"radiation_shutdown" );
    wait isdefined( player.gadget_weapon.var_1123a989 / 1000 ) ? player.gadget_weapon.var_1123a989 / 1000 : 0.5;
    
    if ( player function_d79b93e( player.gadget_weapon.var_44c79c09 ) )
    {
        waspressed = player fragbuttonpressed();
        
        for ( var_5aea88c3 = waspressed; ( !var_5aea88c3 || waspressed ) && player function_ff04e054() ; var_5aea88c3 = player fragbuttonpressed() )
        {
            waitframe( 1 );
            waspressed = var_5aea88c3;
        }
    }
    else
    {
        while ( player fragbuttonpressed() )
        {
            waitframe( 1 );
        }
    }
    
    player shutdown( 1 );
}

// Namespace gadget_radiation_field/gadget_radiation_field
// Params 1
// Checksum 0x3b2a49cd, Offset: 0x2a60
// Size: 0x54
function waitanddelete( time )
{
    self ghost();
    self endon( #"death" );
    wait time;
    self delete();
}

// Namespace gadget_radiation_field/gadget_radiation_field
// Params 1
// Checksum 0x5321ab29, Offset: 0x2ac0
// Size: 0x392
function shutdown( var_fb096220 )
{
    profilestart();
    player = self;
    player notify( #"hash_4aaf6d6479e7cf20" );
    
    if ( isdefined( player ) && player function_831bf182() )
    {
        player deactivate_gadget();
    }
    
    player clientfield::set_player_uimodel( "hudItems.abilityHintIndex", 0 );
    player.radiationdamage = 0;
    player.var_25db02aa = 0;
    
    if ( isdefined( player.var_d44d1214 ) )
    {
        player.var_d44d1214 clientfield::set( "cf_overclock_fx", 0 );
        player.var_d44d1214 thread waitanddelete( 1 );
        player.var_d44d1214 = undefined;
    }
    
    player function_3cbab338( var_fb096220 );
    player.gadget_slot = undefined;
    player.gadget_weapon = undefined;
    
    if ( isdefined( var_fb096220 ) && var_fb096220 )
    {
        player function_91e05fa7();
    }
    
    if ( isdefined( player.var_57e6a430 ) )
    {
        foreach ( var_a3ca7cb2 in player.var_57e6a430 )
        {
            if ( isdefined( var_a3ca7cb2 ) )
            {
                var_a3ca7cb2.var_15359864 = undefined;
                params = getstatuseffect( level.radiationfield_bundle.var_1acd89e2 );
                var_a3ca7cb2 status_effect::function_408158ef( params.setype, params.var_18d16a6b );
            }
        }
    }
    
    if ( isdefined( player.var_e9791ff9 ) )
    {
        objective_delete( player.var_e9791ff9 );
        gameobjects::release_obj_id( player.var_e9791ff9 );
        player.var_e9791ff9 = undefined;
    }
    
    player.var_57e6a430 = undefined;
    var_f52790de = getstatuseffect( level.radiationfield_bundle.var_8d1e6357 );
    player status_effect::function_408158ef( var_f52790de.setype, var_f52790de.var_18d16a6b );
    
    if ( isdefined( var_fb096220 ) && var_fb096220 && isdefined( level.heroplaydialog ) )
    {
        buffer = 0;
        
        if ( isdefined( level.var_ac6052e9 ) )
        {
            buffer = [[ level.var_ac6052e9 ]]( "playerExertBuffer", 0 );
        }
        
        player thread [[ level.heroplaydialog ]]( "exertRadiationSelfEnd", 30, buffer );
    }
    
    player function_c5a2e918();
    player notify( #"radiation_shutdown" );
    profilestop();
}

// Namespace gadget_radiation_field/gadget_radiation_field
// Params 0
// Checksum 0x2e98be73, Offset: 0x2e60
// Size: 0x22
function hide_player()
{
    player = self;
    player.var_92dddb36 = 1;
}

// Namespace gadget_radiation_field/gadget_radiation_field
// Params 0
// Checksum 0xf1d51897, Offset: 0x2e90
// Size: 0x4e
function function_91e05fa7()
{
    player = self;
    player allowprone( 1 );
    player allowstand( 1 );
    player.var_92dddb36 = undefined;
}

// Namespace gadget_radiation_field/gadget_radiation_field
// Params 2
// Checksum 0xc75f3498, Offset: 0x2ee8
// Size: 0x184
function gadget_on( slot, weapon )
{
    player = self;
    
    if ( isdefined( player.var_342564dd ) && player.var_342564dd )
    {
        return;
    }
    
    if ( isdefined( player.var_beee9523 ) && player.var_beee9523 )
    {
        return;
    }
    
    player.gadget_slot = slot;
    player.gadget_weapon = weapon;
    power = player gadgetpowerget( slot );
    
    if ( power < 100 )
    {
        return;
    }
    
    player gadgetpowerset( slot, 0 );
    
    if ( isdefined( level.var_4a9c8bba ) )
    {
        player [[ level.var_4a9c8bba ]]( weapon );
    }
    
    player setclientuivisibilityflag( "weapon_hud_visible", 0 );
    player function_1503c832( weapon );
    
    if ( isdefined( player.health ) && player.health > 0 )
    {
        player clientfield::set_player_uimodel( "hudItems.abilityHintIndex", 2 );
    }
}

// Namespace gadget_radiation_field/gadget_radiation_field
// Params 2
// Checksum 0x14c77055, Offset: 0x3078
// Size: 0x3c
function gadget_off( slot, weapon )
{
    player = self;
    player shutdown( 1 );
}

// Namespace gadget_radiation_field/gadget_radiation_field
// Params 0
// Checksum 0x47192cad, Offset: 0x30c0
// Size: 0xc, Type: bool
function function_831bf182()
{
    return isdefined( self.gadget_slot );
}

// Namespace gadget_radiation_field/gadget_radiation_field
// Params 0
// Checksum 0x5909b1a2, Offset: 0x30d8
// Size: 0x3a
function get_power()
{
    if ( self function_831bf182() )
    {
        return 0;
    }
    
    return self gadgetpowerget( self.gadget_slot );
}

// Namespace gadget_radiation_field/gadget_radiation_field
// Params 0
// Checksum 0x67bc91f5, Offset: 0x3120
// Size: 0x4c
function deactivate_gadget()
{
    self setclientuivisibilityflag( "weapon_hud_visible", 1 );
    self gadgetdeactivate( self.gadget_slot, self.gadget_weapon );
}

// Namespace gadget_radiation_field/gadget_radiation_field
// Params 0
// Checksum 0x4e324b7d, Offset: 0x3178
// Size: 0x24
function power_off()
{
    self gadgetpowerset( self.gadget_slot, 0 );
}

// Namespace gadget_radiation_field/gadget_radiation_field
// Params 0
// Checksum 0x5714594c, Offset: 0x31a8
// Size: 0x3c
function power_on()
{
    if ( self function_831bf182() )
    {
        self gadgetpowerset( self.gadget_slot, 100 );
    }
}

