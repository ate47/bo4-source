#using scripts\core_common\callbacks_shared;
#using scripts\core_common\entityheadicons_shared;
#using scripts\core_common\globallogic\globallogic_score;
#using scripts\core_common\influencers_shared;
#using scripts\core_common\killcam_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\player\player_stats;
#using scripts\core_common\scoreevents_shared;
#using scripts\core_common\status_effects\status_effect_util;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\weapons\weaponobjects;
#using scripts\weapons\weapons;

#namespace molotov;

// Namespace molotov/molotov
// Params 0, eflags: 0x2
// Checksum 0xeb8260f3, Offset: 0x1d0
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"molotov", &init_shared, undefined, undefined );
}

// Namespace molotov/molotov
// Params 0
// Checksum 0x72855f46, Offset: 0x218
// Size: 0xc4
function init_shared()
{
    params = getstatuseffect( "dot_molotov" );
    level.var_e6a4f161 = params.var_18d16a6b;
    level.var_5d450296 = params.setype;
    level.var_e8a6b3ee = [];
    level._effect[ #"hash_31b6cc906e6d0ae0" ] = #"hash_6b74a0816b45e3f8";
    weaponobjects::function_e6400478( #"eq_molotov", &function_853f8cff, 1 );
}

// Namespace molotov/molotov
// Params 1
// Checksum 0x1487c254, Offset: 0x2e8
// Size: 0x26
function function_853f8cff( watcher )
{
    watcher.onspawn = &function_f37c777a;
}

// Namespace molotov/molotov
// Params 2
// Checksum 0x9982d291, Offset: 0x318
// Size: 0x9c
function function_f37c777a( watcher, player )
{
    player endon( #"death", #"disconnect" );
    level endon( #"game_ended" );
    player stats::function_e24eec31( self.weapon, #"used", 1 );
    self thread function_1cdbb1e5( player, self.weapon );
}

// Namespace molotov/molotov
// Params 0
// Checksum 0x38151815, Offset: 0x3c0
// Size: 0x2e
function function_bba54dca()
{
    self waittill( #"death" );
    waittillframeend();
    self notify( #"molotov_deleted" );
}

// Namespace molotov/molotov
// Params 2
// Checksum 0xf38c420f, Offset: 0x3f8
// Size: 0x274
function function_1cdbb1e5( owner, weapon )
{
    self endon( #"hacked", #"molotov_deleted" );
    assert( isdefined( weapon.customsettings ), "<dev string:x38>" + weapon.name );
    self thread function_bba54dca();
    team = self.team;
    var_3e7a440 = getscriptbundle( weapon.customsettings );
    killcament = spawn( "script_model", self.origin );
    killcament util::deleteaftertime( var_3e7a440.var_b79d64a9 + 5 );
    killcament.starttime = gettime();
    killcament linkto( self );
    killcament setweapon( self.weapon );
    killcament killcam::store_killcam_entity_on_entity( self );
    self thread function_71c73ece();
    waitresult = self waittill( #"projectile_impact_explode", #"explode" );
    
    if ( waitresult._notify == "projectile_impact_explode" )
    {
        if ( isdefined( killcament ) )
        {
            killcament unlink();
        }
        
        var_bd5f5c6c = !is_under_water( waitresult.position );
        
        if ( var_bd5f5c6c )
        {
            function_462c8632( owner, waitresult.position, waitresult.normal, self.var_59ba00f5, killcament, weapon, team, var_3e7a440 );
        }
    }
}

// Namespace molotov/molotov
// Params 8
// Checksum 0xfef75571, Offset: 0x678
// Size: 0x8c
function function_462c8632( owner, origin, normal, velocity, killcament, weapon, team, customsettings )
{
    playsoundatposition( "", origin );
    self thread function_e8ad1d81( origin, owner, normal, velocity, killcament, weapon, team, customsettings );
}

// Namespace molotov/molotov
// Params 1
// Checksum 0x49e5ee11, Offset: 0x710
// Size: 0x44, Type: bool
function is_under_water( position )
{
    water_depth = getwaterheight( position ) - position[ 2 ];
    return water_depth >= 24;
}

// Namespace molotov/molotov
// Params 1
// Checksum 0x9b27189, Offset: 0x760
// Size: 0x24, Type: bool
function function_a66ba8cc( water_depth )
{
    return 0 < water_depth && water_depth < 24;
}

// Namespace molotov/molotov
// Params 1
// Checksum 0x83089dc4, Offset: 0x790
// Size: 0x2e
function get_water_depth( position )
{
    return getwaterheight( position ) - position[ 2 ];
}

// Namespace molotov/molotov
// Params 0
// Checksum 0xd9bd93d7, Offset: 0x7c8
// Size: 0x7a
function function_71c73ece()
{
    self endon( #"projectile_impact_explode", #"death" );
    
    while ( true )
    {
        self.var_59ba00f5 = self getvelocity();
        wait float( function_60d95f53() ) / 1000;
    }
}

// Namespace molotov/molotov
// Params 1
// Checksum 0xf8c8e4d8, Offset: 0x850
// Size: 0x8c
function function_7cbeb2f0( normal )
{
    if ( normal[ 2 ] < 0.5 )
    {
        stepoutdistance = normal * getdvarint( #"hash_72463d6fcf7cb178", 50 );
    }
    else
    {
        stepoutdistance = normal * getdvarint( #"hash_1423ebf820f9483f", 12 );
    }
    
    return stepoutdistance;
}

// Namespace molotov/molotov
// Params 8
// Checksum 0xa0b562e4, Offset: 0x8e8
// Size: 0x95c
function function_e8ad1d81( position, owner, normal, velocity, killcament, weapon, team, customsettings )
{
    originalposition = position;
    var_493d36f9 = normal;
    var_77261b6 = vectornormalize( velocity );
    var_1f254a06 = vectorscale( var_77261b6, -1 );
    var_d6d43109 = 1;
    var_e76400c0 = undefined;
    wallnormal = undefined;
    var_693f108f = undefined;
    molotovfireweapon = getweapon( #"molotov_fire" );
    molotovfirewallweapon = getweapon( "molotov_fire_wall" );
    molotovsteamweapon = getweapon( "molotov_steam" );
    
    if ( normal[ 2 ] < -0.5 )
    {
        var_36c22d1d = position + vectorscale( normal, 2 );
        var_8ae62b02 = var_36c22d1d - ( 0, 0, 240 );
        var_69d15ad0 = physicstrace( var_36c22d1d, var_8ae62b02, ( -0.5, -0.5, -0.5 ), ( 0.5, 0.5, 0.5 ), self, 1 );
        
        if ( var_69d15ad0[ #"fraction" ] < 1 )
        {
            position = var_69d15ad0[ #"position" ];
            
            if ( var_69d15ad0[ #"fraction" ] > 0 )
            {
                normal = var_69d15ad0[ #"normal" ];
            }
            else
            {
                normal = ( 0, 0, 1 );
            }
            
            var_1b1117c6 = 1.2 * var_69d15ad0[ #"fraction" ];
            var_1f254a06 = normal;
            
            if ( var_1b1117c6 > 0 )
            {
                wait var_1b1117c6;
            }
        }
        else
        {
            return;
        }
    }
    else if ( normal[ 2 ] < 0.5 )
    {
        var_36c22d1d = position + vectorscale( var_493d36f9, 2 );
        var_8ae62b02 = var_36c22d1d - ( 0, 0, 20 );
        var_69d15ad0 = physicstrace( var_36c22d1d, var_8ae62b02, ( -0.5, -0.5, -0.5 ), ( 0.5, 0.5, 0.5 ), self, 1 );
        
        if ( var_69d15ad0[ #"fraction" ] < 1 )
        {
            position = var_36c22d1d;
            
            if ( var_69d15ad0[ #"fraction" ] > 0 )
            {
                normal = var_69d15ad0[ #"normal" ];
            }
            else
            {
                normal = ( 0, 0, 1 );
            }
        }
    }
    
    if ( normal[ 2 ] < 0.5 )
    {
        wall_normal = normal;
        var_36c22d1d = originalposition + vectorscale( var_493d36f9, 8 );
        var_8ae62b02 = var_36c22d1d - ( 0, 0, 300 );
        var_69d15ad0 = physicstrace( var_36c22d1d, var_8ae62b02, ( -3, -3, -3 ), ( 3, 3, 3 ), self, 1 );
        var_693f108f = var_69d15ad0[ #"fraction" ] * 300;
        var_959a2a8b = 0;
        
        if ( var_693f108f > 10 )
        {
            var_e76400c0 = originalposition;
            wallnormal = var_493d36f9;
            var_d6d43109 = sqrt( 1 - var_69d15ad0[ #"fraction" ] );
            var_959a2a8b = 1;
        }
        
        if ( var_69d15ad0[ #"fraction" ] < 1 )
        {
            position = var_69d15ad0[ #"position" ];
            
            if ( var_69d15ad0[ #"fraction" ] > 0 )
            {
                normal = var_69d15ad0[ #"normal" ];
            }
            else
            {
                normal = ( 0, 0, 1 );
            }
        }
        
        if ( var_959a2a8b )
        {
            x = originalposition[ 0 ];
            y = originalposition[ 1 ];
            lowestz = var_69d15ad0[ #"position" ][ 2 ];
            z = originalposition[ 2 ];
            
            while ( z > lowestz )
            {
                newpos = ( x, y, z );
                water_depth = get_water_depth( newpos );
                
                if ( function_a66ba8cc( water_depth ) || is_under_water( newpos ) )
                {
                    newpos -= ( 0, 0, water_depth );
                    level thread function_42b9fdbe( molotovsteamweapon, newpos, ( 0, 0, 1 ), int( customsettings.var_b79d64a9 ), team );
                    break;
                }
                
                level thread function_42b9fdbe( molotovfirewallweapon, newpos, wall_normal, int( customsettings.var_b79d64a9 ), team );
                z -= randomintrange( 20, 30 );
            }
            
            var_bc9ec158 = 0.6 * var_69d15ad0[ #"fraction" ];
            
            if ( var_bc9ec158 > 0 )
            {
                wait var_bc9ec158;
            }
        }
    }
    
    startpos = position + function_7cbeb2f0( normal );
    desiredendpos = startpos + ( 0, 0, 60 );
    function_1493c734( startpos, 20, ( 0, 1, 0 ), 0.6, 200 );
    phystrace = physicstrace( startpos, desiredendpos, ( -4, -4, -4 ), ( 4, 4, 4 ), self, 1 );
    goalpos = phystrace[ #"fraction" ] > 1 ? desiredendpos : phystrace[ #"position" ];
    
    if ( isdefined( killcament ) )
    {
        killcament moveto( goalpos, 0.5 );
    }
    
    rotation = randomint( 360 );
    
    if ( normal[ 2 ] < 0.1 && !isdefined( var_e76400c0 ) )
    {
        black = ( 0.1, 0.1, 0.1 );
        trace = hitpos( startpos, startpos + normal * -1 * 70 + ( 0, 0, -1 ) * 70, black );
        traceposition = trace[ #"position" ];
        
        if ( trace[ #"fraction" ] < 0.9 )
        {
            var_252a0dc7 = trace[ #"normal" ];
            spawntimedfx( molotovfirewallweapon, traceposition, var_252a0dc7, int( customsettings.var_b79d64a9 ), team );
        }
    }
    
    var_1f254a06 = normal;
    level function_8a03d3f3( owner, position, startpos, var_1f254a06, var_d6d43109, rotation, killcament, weapon, customsettings, team, var_e76400c0, wallnormal, var_693f108f );
}

// Namespace molotov/molotov
// Params 7
// Checksum 0xe542a424, Offset: 0x1250
// Size: 0x98
function function_523961e2( startpos, normal, var_4997e17c, fxindex, fxcount, defaultdistance, rotation )
{
    currentangle = 360 / fxcount * fxindex;
    var_7ee25402 = rotatepointaroundaxis( var_4997e17c * defaultdistance, normal, currentangle + rotation );
    return startpos + var_7ee25402;
}

// Namespace molotov/molotov
// Params 0
// Checksum 0x2bca9e1e, Offset: 0x12f0
// Size: 0xd8
function function_31cc6bd9()
{
    if ( !isdefined( level.var_a88ac760 ) )
    {
        return;
    }
    
    keys = getarraykeys( level.var_a88ac760 );
    time = gettime();
    
    foreach ( key in keys )
    {
        if ( level.var_a88ac760[ key ].var_46ee5246 < time )
        {
            level.var_a88ac760[ key ] = undefined;
        }
    }
}

// Namespace molotov/molotov
// Params 2
// Checksum 0x6c2d898f, Offset: 0x13d0
// Size: 0xf6, Type: bool
function function_31f342a2( origin, var_9c7e3678 )
{
    if ( !isdefined( level.var_a88ac760 ) )
    {
        return false;
    }
    
    foreach ( molotov in level.var_a88ac760 )
    {
        if ( abs( molotov.origin[ 2 ] - origin[ 2 ] > 20 ) )
        {
            continue;
        }
        
        if ( distance2dsquared( molotov.origin, origin ) < var_9c7e3678 )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace molotov/molotov
// Params 13
// Checksum 0xb4dbd043, Offset: 0x14d0
// Size: 0xfa8
function function_8a03d3f3( owner, impactpos, startpos, normal, multiplier, rotation, killcament, weapon, customsettings, team, var_e76400c0, wallnormal, var_693f108f )
{
    defaultdistance = customsettings.var_6193a41b * multiplier;
    defaultdropdistance = getdvarint( #"hash_4a8fc6d7cacea9d5", 90 );
    colorarray = [];
    colorarray[ colorarray.size ] = ( 0.9, 0.2, 0.2 );
    colorarray[ colorarray.size ] = ( 0.2, 0.9, 0.2 );
    colorarray[ colorarray.size ] = ( 0.2, 0.2, 0.9 );
    colorarray[ colorarray.size ] = ( 0.9, 0.9, 0.9 );
    locations = [];
    locations[ #"color" ] = [];
    locations[ #"loc" ] = [];
    locations[ #"tracepos" ] = [];
    locations[ #"distsqrd" ] = [];
    locations[ #"fxtoplay" ] = [];
    locations[ #"radius" ] = [];
    locations[ #"tallfire" ] = [];
    locations[ #"smallfire" ] = [];
    locations[ #"steam" ] = [];
    fxcount = customsettings.var_b650dc43;
    var_33ad9452 = isdefined( customsettings.var_bc24d9d3 ) ? customsettings.var_bc24d9d3 : 0;
    fxcount = int( math::clamp( fxcount * multiplier + 6, 6, customsettings.var_b650dc43 ) );
    
    if ( multiplier < 0.04 )
    {
        fxcount = 0;
    }
    
    function_31cc6bd9();
    
    if ( function_31f342a2( startpos, customsettings.var_6193a41b * 1.5 * customsettings.var_6193a41b * 1.5 ) && fxcount > 10 )
    {
        fxcount = 7;
    }
    
    var_4997e17c = perpendicularvector( normal );
    
    for ( fxindex = 0; fxindex < fxcount ; fxindex++ )
    {
        locations[ #"point" ][ fxindex ] = function_523961e2( startpos, normal, var_4997e17c, fxindex, fxcount, defaultdistance, rotation );
        function_1493c734( locations[ #"point" ][ fxindex ], 10, ( 0, fxindex * 20, 0 ), 0.6, 200 );
        locations[ #"color" ][ fxindex ] = colorarray[ fxindex % colorarray.size ];
    }
    
    var_1cac1ca8 = normal[ 2 ] > 0.5;
    
    for ( count = 0; count < fxcount ; count++ )
    {
        trace = hitpos( startpos, locations[ #"point" ][ count ], locations[ #"color" ][ count ] );
        traceposition = trace[ #"position" ];
        locations[ #"tracepos" ][ count ] = traceposition;
        hitsomething = 0;
        
        if ( trace[ #"fraction" ] < 0.7 )
        {
            function_1493c734( traceposition, 10, ( 1, 0, 0 ), 0.6, 200 );
            locations[ #"loc" ][ count ] = traceposition;
            locations[ #"normal" ][ count ] = trace[ #"normal" ];
            
            if ( var_1cac1ca8 )
            {
                locations[ #"tallfire" ][ count ] = 1;
            }
            
            hitsomething = 1;
        }
        
        if ( !hitsomething )
        {
            tracedown = hitpos( traceposition, traceposition - normal * defaultdropdistance, locations[ #"color" ][ count ] );
            
            if ( tracedown[ #"fraction" ] != 1 )
            {
                function_1493c734( tracedown[ #"position" ], 10, ( 0, 0, 1 ), 0.6, 200 );
                locations[ #"loc" ][ count ] = tracedown[ #"position" ];
                water_depth = get_water_depth( tracedown[ #"position" ] );
                
                if ( function_a66ba8cc( water_depth ) )
                {
                    locations[ #"normal" ][ count ] = ( 0, 0, 1 );
                    locations[ #"steam" ][ count ] = 1;
                    locations[ #"loc" ][ count ] -= ( 0, 0, water_depth );
                }
                else
                {
                    locations[ #"normal" ][ count ] = tracedown[ #"normal" ];
                    locations[ #"smallfire" ][ count ] = 1;
                }
            }
        }
        
        randangle = randomint( 360 );
        var_c4b09917 = randomfloatrange( -25, 25 );
        var_7ee25402 = rotatepointaroundaxis( var_4997e17c, normal, randangle );
        var_995eb37a = int( min( var_33ad9452 * multiplier * trace[ #"fraction" ] + 1, var_33ad9452 ) );
        
        for ( var_ecef2fde = 0; var_ecef2fde < var_995eb37a && count % 2 == 0 ; var_ecef2fde++ )
        {
            fraction = ( var_ecef2fde + 1 ) / ( var_995eb37a + 1 );
            offsetpoint = startpos + ( traceposition - startpos ) * fraction + var_7ee25402 * var_c4b09917;
            var_9417df90 = hitpos( offsetpoint, offsetpoint - normal * defaultdropdistance, locations[ #"color" ][ count ] );
            
            if ( var_9417df90[ #"fraction" ] != 1 )
            {
                function_1493c734( var_9417df90[ #"position" ], 10, ( 0, 0, 1 ), 0.6, 200 );
                locindex = count + fxcount * ( var_ecef2fde + 1 );
                locations[ #"loc" ][ locindex ] = var_9417df90[ #"position" ];
                water_depth = get_water_depth( var_9417df90[ #"position" ] );
                
                if ( function_a66ba8cc( water_depth ) )
                {
                    locations[ #"normal" ][ locindex ] = ( 0, 0, 1 );
                    locations[ #"steam" ][ locindex ] = 1;
                    locations[ #"loc" ][ locindex ] -= ( 0, 0, water_depth );
                    continue;
                }
                
                locations[ #"normal" ][ locindex ] = var_9417df90[ #"normal" ];
            }
        }
    }
    
    molotovfireweapon = getweapon( #"molotov_fire" );
    molotovfiretallweapon = getweapon( "molotov_fire_tall" );
    molotovfiresmallweapon = getweapon( "molotov_fire_small" );
    molotovsteamweapon = getweapon( "molotov_steam" );
    var_6b23e1c9 = impactpos + normal * 1.5;
    forward = ( 1, 0, 0 );
    
    if ( abs( vectordot( forward, normal ) ) > 0.999 )
    {
        forward = ( 0, 0, 1 );
    }
    
    if ( !is_under_water( var_6b23e1c9 ) )
    {
        playfx( level._effect[ #"hash_31b6cc906e6d0ae0" ], var_6b23e1c9, forward, normal, 0, team );
        
        if ( !isdefined( var_e76400c0 ) )
        {
            spawntimedfx( molotovfireweapon, var_6b23e1c9, normal, int( customsettings.var_b79d64a9 ), team );
        }
    }
    
    if ( level.gameended )
    {
        return;
    }
    
    if ( !isdefined( level.var_801fd65e ) )
    {
        level.var_801fd65e = 0;
    }
    
    if ( !isdefined( level.var_a88ac760 ) )
    {
        level.var_a88ac760 = [];
    }
    
    var_bf264593 = level.var_a88ac760.size;
    level.var_a88ac760[ var_bf264593 ] = {};
    var_4b424bc1 = level.var_a88ac760[ var_bf264593 ];
    var_4b424bc1.var_46ee5246 = int( gettime() + customsettings.var_b79d64a9 * 1000 );
    var_4b424bc1.origin = startpos;
    thread damageeffectarea( owner, startpos, killcament, normal, molotovfireweapon, customsettings, multiplier, var_e76400c0, wallnormal, var_693f108f, var_4b424bc1.var_46ee5246 );
    thread function_9464e4ad( owner, startpos, killcament, normal, molotovfireweapon, customsettings, multiplier, var_e76400c0, wallnormal, var_693f108f, var_4b424bc1.var_46ee5246 );
    var_b1dd2ca0 = getarraykeys( locations[ #"loc" ] );
    
    foreach ( lockey in var_b1dd2ca0 )
    {
        if ( !isdefined( lockey ) )
        {
            continue;
        }
        
        if ( is_under_water( locations[ #"loc" ][ lockey ] ) )
        {
            continue;
        }
        
        if ( isdefined( locations[ #"smallfire" ][ lockey ] ) )
        {
            fireweapon = molotovfiresmallweapon;
        }
        else if ( isdefined( locations[ #"steam" ][ lockey ] ) )
        {
            fireweapon = molotovsteamweapon;
        }
        else
        {
            fireweapon = isdefined( locations[ #"tallfire" ][ lockey ] ) ? molotovfiretallweapon : molotovfireweapon;
        }
        
        level thread function_42b9fdbe( fireweapon, locations[ #"loc" ][ lockey ], locations[ #"normal" ][ lockey ], int( customsettings.var_b79d64a9 ), team );
    }
}

// Namespace molotov/molotov
// Params 5
// Checksum 0x8eff178f, Offset: 0x2480
// Size: 0x84
function function_42b9fdbe( weapon, loc, normal, duration, team )
{
    fxnormal = normal;
    wait randomfloatrange( 0, 0.5 );
    spawntimedfx( weapon, loc, fxnormal, duration, team );
}

/#

    // Namespace molotov/molotov
    // Params 5
    // Checksum 0x72d5c657, Offset: 0x2510
    // Size: 0xb4, Type: dev
    function incendiary_debug_line( from, to, color, depthtest, time )
    {
        debug_rcbomb = getdvarint( #"scr_molotov_debug", 0 );
        
        if ( debug_rcbomb == 1 )
        {
            if ( !isdefined( time ) )
            {
                time = 100;
            }
            
            if ( !isdefined( depthtest ) )
            {
                depthtest = 1;
            }
            
            line( from, to, color, 1, depthtest, time );
        }
    }

#/

// Namespace molotov/molotov
// Params 11
// Checksum 0xf49b8dc2, Offset: 0x25d0
// Size: 0x6c0
function damageeffectarea( owner, position, killcament, normal, weapon, customsettings, radius_multiplier, var_e76400c0, wallnormal, var_cbaaea69, damageendtime )
{
    level endon( #"game_ended" );
    radius = customsettings.var_6193a41b * radius_multiplier;
    height = customsettings.var_cbd86f3e;
    trigger_radius_position = position - ( 0, 0, height );
    trigger_radius_height = height * 2;
    
    if ( isdefined( var_e76400c0 ) && isdefined( wallnormal ) )
    {
        var_21f4217c = var_e76400c0 + vectorscale( wallnormal, 12 ) - ( 0, 0, var_cbaaea69 );
        var_289a74bc = spawn( "trigger_radius", var_21f4217c, 0, 12, var_cbaaea69 );
        
        /#
            if ( getdvarint( #"scr_draw_triggers", 0 ) )
            {
                level thread util::drawcylinder( var_21f4217c, 12, var_cbaaea69, undefined, "<dev string:x74>", ( 1, 0, 0 ), 0.9 );
            }
        #/
    }
    
    if ( radius >= 0.04 )
    {
        fireeffectarea = spawn( "trigger_radius", trigger_radius_position, 0, radius, trigger_radius_height );
        firesound = spawn( "script_origin", fireeffectarea.origin );
        
        if ( isdefined( firesound ) )
        {
            firesound playloopsound( #"hash_d2a83cecbfbd9e2" );
        }
        
        level thread influencers::create_grenade_influencers( isdefined( owner ) ? owner.team : undefined, weapon, fireeffectarea );
    }
    
    /#
        if ( getdvarint( #"scr_draw_triggers", 0 ) )
        {
            level thread util::drawcylinder( trigger_radius_position, radius, trigger_radius_height, undefined, "<dev string:x74>" );
        }
    #/
    
    self.var_ebf0b1c9 = [];
    burntime = 0;
    var_d0603aba = 1;
    originalteam = isdefined( owner ) ? owner.team : undefined;
    
    while ( gettime() < damageendtime && ( !isdefined( owner ) || owner.team == originalteam ) )
    {
        damageapplied = 0;
        potential_targets = self getpotentialtargets( owner, customsettings );
        
        if ( isdefined( owner ) )
        {
            owner.var_52dceca = [];
        }
        
        foreach ( target in potential_targets )
        {
            self trytoapplyfiredamage( target, owner, position, fireeffectarea, var_289a74bc, killcament, weapon, customsettings );
        }
        
        if ( isdefined( owner ) )
        {
            affectedplayers = owner.var_52dceca.size;
            
            if ( affectedplayers > 0 && burntime < gettime() )
            {
                scoreevents::processscoreevent( #"hash_1343f5418bd52c6c", owner, undefined, weapon, affectedplayers );
                burntime = gettime() + int( customsettings.var_5c06ec56 * 1000 );
            }
            
            if ( isdefined( level.playgadgetsuccess ) && var_d0603aba )
            {
                if ( isdefined( level.var_ac6052e9 ) )
                {
                    var_9194a036 = [[ level.var_ac6052e9 ]]( "molotovSuccessLineCount", 0 );
                }
                
                if ( affectedplayers >= ( isdefined( var_9194a036 ) ? var_9194a036 : 3 ) )
                {
                    owner [[ level.playgadgetsuccess ]]( weapon );
                }
            }
            
            if ( var_d0603aba )
            {
                var_d0603aba = 0;
            }
        }
        
        wait customsettings.var_90bd7d92;
    }
    
    arrayremovevalue( self.var_ebf0b1c9, undefined );
    
    foreach ( target in self.var_ebf0b1c9 )
    {
        target.var_84e41b20 = undefined;
        target status_effect::function_408158ef( level.var_5d450296, level.var_e6a4f161 );
    }
    
    if ( isdefined( owner ) )
    {
        owner.var_52dceca = [];
    }
    
    if ( isdefined( killcament ) )
    {
        killcament entityheadicons::destroyentityheadicons();
    }
    
    if ( isdefined( fireeffectarea ) )
    {
        fireeffectarea delete();
        
        if ( isdefined( firesound ) )
        {
            firesound thread stopfiresound();
        }
    }
    
    if ( isdefined( var_289a74bc ) )
    {
        var_289a74bc delete();
    }
    
    /#
        if ( getdvarint( #"scr_draw_triggers", 0 ) )
        {
            level notify( #"hash_33d328e380ab0acc" );
        }
    #/
}

// Namespace molotov/molotov
// Params 0
// Checksum 0x459200d2, Offset: 0x2c98
// Size: 0x54
function stopfiresound()
{
    firesound = self;
    firesound stoploopsound( 2 );
    wait 0.5;
    
    if ( isdefined( firesound ) )
    {
        firesound delete();
    }
}

// Namespace molotov/molotov
// Params 11
// Checksum 0x89c2716e, Offset: 0x2cf8
// Size: 0x384
function function_9464e4ad( owner, position, killcament, normal, weapon, customsettings, radius_multiplier, var_e76400c0, wallnormal, var_cbaaea69, damageendtime )
{
    level endon( #"game_ended" );
    radius = customsettings.var_6193a41b * radius_multiplier;
    height = customsettings.var_cbd86f3e;
    trigger_radius_position = position - ( 0, 0, height );
    trigger_radius_height = height * 2;
    
    if ( isdefined( var_e76400c0 ) && isdefined( wallnormal ) )
    {
        var_21f4217c = var_e76400c0 + vectorscale( wallnormal, 12 ) - ( 0, 0, var_cbaaea69 );
        var_289a74bc = spawn( "trigger_radius", var_21f4217c, 0, 12, var_cbaaea69 );
    }
    
    if ( radius >= 0.04 )
    {
        fireeffectarea = spawn( "trigger_radius", trigger_radius_position, 0, radius, trigger_radius_height );
    }
    
    self.var_ebf0b1c9 = [];
    
    while ( gettime() < damageendtime )
    {
        damageapplied = 0;
        potential_targets = self weapons::function_356292be( owner, position, radius );
        
        foreach ( target in potential_targets )
        {
            self trytoapplyfiredamage( target, owner, position, fireeffectarea, var_289a74bc, killcament, weapon, customsettings );
        }
        
        wait customsettings.var_8fbd03cb;
    }
    
    arrayremovevalue( self.var_ebf0b1c9, undefined );
    
    foreach ( target in self.var_ebf0b1c9 )
    {
        target.var_84e41b20 = undefined;
        target status_effect::function_408158ef( level.var_5d450296, level.var_e6a4f161 );
    }
    
    if ( isdefined( owner ) )
    {
        owner globallogic_score::function_d3ca3608( #"hash_468ad9ee571cf1c6" );
    }
    
    if ( isdefined( fireeffectarea ) )
    {
        fireeffectarea delete();
    }
    
    if ( isdefined( var_289a74bc ) )
    {
        var_289a74bc delete();
    }
}

// Namespace molotov/molotov
// Params 2
// Checksum 0xd79be6e5, Offset: 0x3088
// Size: 0x364
function getpotentialtargets( owner, customsettings )
{
    owner_team = isdefined( owner ) ? owner.team : undefined;
    
    if ( level.teambased && isdefined( owner_team ) && level.friendlyfire == 0 )
    {
        potential_targets = [];
        
        foreach ( team, _ in level.teams )
        {
            if ( customsettings.var_14e16318 === 1 || util::function_fbce7263( team, owner_team ) )
            {
                potential_targets = arraycombine( potential_targets, getplayers( team ), 0, 0 );
            }
        }
        
        if ( isdefined( customsettings.var_4e1d1f97 ) && customsettings.var_4e1d1f97 )
        {
            if ( !isdefined( potential_targets ) )
            {
                potential_targets = [];
            }
            else if ( !isarray( potential_targets ) )
            {
                potential_targets = array( potential_targets );
            }
            
            if ( !isinarray( potential_targets, owner ) )
            {
                potential_targets[ potential_targets.size ] = owner;
            }
        }
        
        return potential_targets;
    }
    
    all_targets = [];
    all_targets = arraycombine( all_targets, level.players, 0, 0 );
    all_targets = arraycombine( all_targets, getaiarray(), 0, 0 );
    
    if ( level.friendlyfire > 0 )
    {
        return all_targets;
    }
    
    potential_targets = [];
    
    foreach ( target in all_targets )
    {
        if ( !isdefined( target ) )
        {
            continue;
        }
        
        if ( !isdefined( target.team ) )
        {
            continue;
        }
        
        if ( isdefined( owner ) )
        {
            if ( target != owner )
            {
                if ( !isdefined( owner_team ) )
                {
                    continue;
                }
                
                if ( !util::function_fbce7263( target.team, owner_team ) )
                {
                    continue;
                }
            }
        }
        else
        {
            if ( !isdefined( self ) )
            {
                continue;
            }
            
            if ( !isdefined( self.team ) )
            {
                continue;
            }
            
            if ( !util::function_fbce7263( target.team, self.team ) )
            {
                continue;
            }
        }
        
        potential_targets[ potential_targets.size ] = target;
    }
    
    return potential_targets;
}

// Namespace molotov/molotov
// Params 1
// Checksum 0xbdf3846b, Offset: 0x33f8
// Size: 0x160
function function_5a49ebd3( team )
{
    scriptmodels = getentarray( "script_model", "classname" );
    var_e26b971c = [];
    
    foreach ( scriptmodel in scriptmodels )
    {
        if ( !isdefined( scriptmodel ) )
        {
            continue;
        }
        
        if ( !isdefined( scriptmodel.team ) )
        {
            continue;
        }
        
        if ( scriptmodel.health <= 0 )
        {
            continue;
        }
        
        if ( scriptmodel.team == team )
        {
            if ( !isdefined( var_e26b971c ) )
            {
                var_e26b971c = [];
            }
            else if ( !isarray( var_e26b971c ) )
            {
                var_e26b971c = array( var_e26b971c );
            }
            
            if ( !isinarray( var_e26b971c, scriptmodel ) )
            {
                var_e26b971c[ var_e26b971c.size ] = scriptmodel;
            }
        }
    }
    
    return var_e26b971c;
}

// Namespace molotov/molotov
// Params 8
// Checksum 0x3f85864c, Offset: 0x3560
// Size: 0x350
function trytoapplyfiredamage( target, owner, position, fireeffectarea, var_289a74bc, killcament, weapon, customsettings )
{
    if ( !( isdefined( fireeffectarea ) || isdefined( var_289a74bc ) ) )
    {
        return;
    }
    
    var_4c3c1b32 = 0;
    var_75046efd = 0;
    sourcepos = position;
    
    if ( isdefined( fireeffectarea ) )
    {
        var_4c3c1b32 = target istouching( fireeffectarea );
        sourcepos = fireeffectarea.origin;
    }
    
    if ( isdefined( var_289a74bc ) )
    {
        var_75046efd = target istouching( var_289a74bc );
        sourcepos = var_289a74bc.origin;
    }
    
    var_be45d685 = !( var_4c3c1b32 || var_75046efd );
    targetentnum = target getentitynumber();
    
    if ( !var_be45d685 && ( !isdefined( target.sessionstate ) || target.sessionstate == "playing" ) )
    {
        trace = bullettrace( position, target getshootatpos(), 0, target );
        
        if ( trace[ #"fraction" ] == 1 )
        {
            if ( isplayer( target ) )
            {
                target thread damageinfirearea( sourcepos, killcament, trace, position, weapon, customsettings, owner );
                
                if ( isdefined( owner ) && util::function_fbce7263( target.team, owner.team ) )
                {
                    owner.var_52dceca[ targetentnum ] = target;
                }
            }
            else
            {
                target thread function_37ddab3( sourcepos, killcament, trace, position, weapon, customsettings, owner );
            }
            
            self.var_ebf0b1c9[ targetentnum ] = target;
        }
        else
        {
            var_be45d685 = 1;
        }
    }
    
    if ( var_be45d685 && isdefined( target.var_84e41b20 ) && isplayer( target ) )
    {
        if ( target.var_84e41b20.size == 0 )
        {
            target.var_84e41b20 = undefined;
            target status_effect::function_408158ef( level.var_5d450296, level.var_e6a4f161 );
            self.var_ebf0b1c9[ targetentnum ] = undefined;
        }
        else if ( isdefined( killcament ) )
        {
            target.var_84e41b20[ killcament.starttime ] = undefined;
        }
        
        if ( isdefined( owner ) )
        {
            owner.var_52dceca[ targetentnum ] = undefined;
        }
    }
}

// Namespace molotov/molotov
// Params 7
// Checksum 0x877aa08b, Offset: 0x38b8
// Size: 0x1dc
function damageinfirearea( origin, killcament, trace, position, weapon, customsettings, owner )
{
    self endon( #"disconnect", #"death" );
    timer = 0;
    
    if ( candofiredamage( killcament, self, customsettings.var_90bd7d92 ) )
    {
        /#
            level.molotov_debug = getdvarint( #"scr_molotov_debug", 0 );
            
            if ( level.molotov_debug )
            {
                if ( !isdefined( level.incendiarydamagetime ) )
                {
                    level.incendiarydamagetime = gettime();
                }
                
                iprintlnbold( level.incendiarydamagetime - gettime() );
                level.incendiarydamagetime = gettime();
            }
        #/
        
        var_4dd4e6ee = owner;
        
        if ( !isdefined( self.var_84e41b20 ) )
        {
            self.var_84e41b20 = [];
        }
        
        if ( isdefined( killcament ) )
        {
            self.var_84e41b20[ killcament.starttime ] = 1;
        }
        
        params = getstatuseffect( "dot_molotov" );
        params.killcament = killcament;
        self status_effect::status_effect_apply( params, weapon, owner, 0, undefined, undefined, origin );
        self.var_ae639436 = var_4dd4e6ee;
        self thread sndfiredamage();
    }
}

// Namespace molotov/molotov
// Params 7
// Checksum 0xc06182fa, Offset: 0x3aa0
// Size: 0x162
function function_37ddab3( origin, killcament, trace, position, weapon, customsettings, owner )
{
    self endon( #"disconnect", #"death" );
    timer = 0;
    
    if ( candofiredamage( killcament, self, customsettings.var_8fbd03cb ) )
    {
        var_4dd4e6ee = owner;
        
        if ( !isdefined( self.var_84e41b20 ) )
        {
            self.var_84e41b20 = [];
        }
        
        if ( isdefined( killcament ) )
        {
            self.var_84e41b20[ killcament.starttime ] = 1;
        }
        
        var_341dfe48 = int( customsettings.var_4931651e * customsettings.var_8fbd03cb );
        self dodamage( var_341dfe48, self.origin, owner, weapon, "none", "MOD_BURNED", 0, weapon );
        self.var_ae639436 = var_4dd4e6ee;
    }
}

// Namespace molotov/molotov
// Params 0
// Checksum 0xba1b4524, Offset: 0x3c10
// Size: 0x14e
function sndfiredamage()
{
    self notify( #"sndfire" );
    self endon( #"sndfire", #"death", #"disconnect" );
    
    if ( !isdefined( self.sndfireent ) )
    {
        self.sndfireent = spawn( "script_origin", self.origin );
        self.sndfireent linkto( self, "tag_origin" );
        self.sndfireent playsound( #"chr_burn_start" );
        self thread sndfiredamage_deleteent( self.sndfireent );
    }
    
    self.sndfireent playloopsound( #"chr_burn_start_loop", 0.5 );
    wait 3;
    
    if ( isdefined( self.sndfireent ) )
    {
        self.sndfireent delete();
        self.sndfireent = undefined;
    }
}

// Namespace molotov/molotov
// Params 1
// Checksum 0xcc6a57b2, Offset: 0x3d68
// Size: 0x4c
function sndfiredamage_deleteent( ent )
{
    self waittill( #"death", #"disconnect" );
    
    if ( isdefined( ent ) )
    {
        ent delete();
    }
}

// Namespace molotov/molotov
// Params 3
// Checksum 0xd3e0fd6c, Offset: 0x3dc0
// Size: 0xf0
function hitpos( start, end, color )
{
    trace = bullettrace( start, end, 0, undefined );
    
    /#
        level.molotov_debug = getdvarint( #"scr_molotov_debug", 0 );
        
        if ( level.molotov_debug )
        {
            debugstar( trace[ #"position" ], 2000, color );
        }
        
        thread incendiary_debug_line( start, trace[ #"position" ], color, 1, 80 );
    #/
    
    return trace;
}

// Namespace molotov/molotov
// Params 3
// Checksum 0xffef4adf, Offset: 0x3eb8
// Size: 0xc4, Type: bool
function candofiredamage( killcament, victim, resetfiretime )
{
    if ( isplayer( victim ) && victim depthofplayerinwater() >= 1 )
    {
        return false;
    }
    
    entnum = victim getentitynumber();
    
    if ( !isdefined( level.var_e8a6b3ee[ entnum ] ) )
    {
        level.var_e8a6b3ee[ entnum ] = 1;
        level thread resetfiredamage( entnum, resetfiretime );
        return true;
    }
    
    return false;
}

// Namespace molotov/molotov
// Params 2
// Checksum 0xc71b4edc, Offset: 0x3f88
// Size: 0x44
function resetfiredamage( entnum, time )
{
    if ( time > 0.05 )
    {
        wait time - 0.05;
    }
    
    level.var_e8a6b3ee[ entnum ] = undefined;
}

// Namespace molotov/molotov
// Params 5
// Checksum 0x18d818c1, Offset: 0x3fd8
// Size: 0xb4
function function_1493c734( origin, radius, color, alpha, time )
{
    /#
        debug_fire = getdvarint( #"debug_molotov_fire", 0 );
        
        if ( debug_fire > 0 )
        {
            if ( debug_fire > 1 )
            {
                radius = int( radius / debug_fire );
            }
            
            util::debug_sphere( origin, radius, color, alpha, time );
        }
    #/
}

