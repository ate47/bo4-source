#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\entityheadicons_shared;
#using scripts\core_common\flag_shared;
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

#namespace wraith_fire;

// Namespace wraith_fire/wraith_fire
// Params 0, eflags: 0x2
// Checksum 0x7892c2f6, Offset: 0x1c0
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"wraith_fire", &init_shared, undefined, undefined );
}

// Namespace wraith_fire/wraith_fire
// Params 0
// Checksum 0x55a9cf6, Offset: 0x208
// Size: 0x112
function init_shared()
{
    params = getstatuseffect( "dot_wraith_fire" );
    level.var_40d32830 = params.var_18d16a6b;
    level.var_ccdda8d1 = params.setype;
    level.var_660293e0 = [];
    level.var_d3b05dcb = [];
    level._effect[ #"hash_6024e139900c449a" ] = #"hash_3937ef26298b6caf";
    weaponobjects::function_e6400478( #"eq_wraith_fire", &function_5ea93036, 1 );
    weaponobjects::function_e6400478( #"eq_wraith_fire_extra", &function_5ea93036, 1 );
    level.var_f9145520 = 0;
}

// Namespace wraith_fire/wraith_fire
// Params 1
// Checksum 0x18ca03fd, Offset: 0x328
// Size: 0x26
function function_5ea93036( watcher )
{
    watcher.onspawn = &function_dfe5cf4c;
}

// Namespace wraith_fire/wraith_fire
// Params 2
// Checksum 0x56d354e, Offset: 0x358
// Size: 0x8c
function function_dfe5cf4c( watcher, player )
{
    player endon( #"death" );
    level endon( #"game_ended" );
    player stats::function_e24eec31( self.weapon, #"used", 1 );
    self thread function_13f6636b( player, self.weapon );
}

// Namespace wraith_fire/wraith_fire
// Params 0
// Checksum 0x46a290dd, Offset: 0x3f0
// Size: 0x2e
function function_4dbceded()
{
    self waittill( #"death" );
    waittillframeend();
    self notify( #"hash_51d0dcaebb5940a5" );
}

// Namespace wraith_fire/wraith_fire
// Params 2
// Checksum 0xf51e619c, Offset: 0x428
// Size: 0x264
function function_13f6636b( owner, weapon )
{
    self endon( #"hacked", #"hash_51d0dcaebb5940a5" );
    assert( isdefined( weapon.customsettings ), "<dev string:x38>" + weapon.name );
    self thread function_4dbceded();
    team = self.team;
    killcament = spawn( "script_model", self.origin );
    killcament.targetname = "wraith_fire_killcament";
    killcament util::deleteaftertime( 15 );
    killcament.starttime = gettime();
    killcament linkto( self );
    killcament setweapon( self.weapon );
    killcament killcam::store_killcam_entity_on_entity( self );
    self thread function_b66b2f4d();
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
            function_3932cbd9( owner, waitresult.position, waitresult.normal, self.var_59ba00f5, killcament, weapon, team, getscriptbundle( weapon.customsettings ) );
        }
    }
}

// Namespace wraith_fire/wraith_fire
// Params 8
// Checksum 0x937f9be6, Offset: 0x698
// Size: 0x8c
function function_3932cbd9( owner, origin, normal, velocity, killcament, weapon, team, customsettings )
{
    playsoundatposition( "", origin );
    self thread function_e8ad1d81( origin, owner, normal, velocity, killcament, weapon, team, customsettings );
}

// Namespace wraith_fire/wraith_fire
// Params 1
// Checksum 0xad03ee07, Offset: 0x730
// Size: 0x66, Type: bool
function is_under_water( position )
{
    water_depth = getwaterheight( position ) - position[ 2 ];
    return !( isdefined( level.var_c62ed297 ) && level.var_c62ed297 ) && water_depth >= 24;
}

// Namespace wraith_fire/wraith_fire
// Params 1
// Checksum 0x73c35dea, Offset: 0x7a0
// Size: 0x48, Type: bool
function function_a66ba8cc( water_depth )
{
    return !( isdefined( level.var_c62ed297 ) && level.var_c62ed297 ) && 0 < water_depth && water_depth < 24;
}

// Namespace wraith_fire/wraith_fire
// Params 1
// Checksum 0x846d9bb4, Offset: 0x7f0
// Size: 0x2e
function get_water_depth( position )
{
    return getwaterheight( position ) - position[ 2 ];
}

// Namespace wraith_fire/wraith_fire
// Params 0
// Checksum 0x53598544, Offset: 0x828
// Size: 0x7a
function function_b66b2f4d()
{
    self endon( #"projectile_impact_explode", #"death" );
    
    while ( true )
    {
        self.var_59ba00f5 = self getvelocity();
        wait float( function_60d95f53() ) / 1000;
    }
}

// Namespace wraith_fire/wraith_fire
// Params 1
// Checksum 0xc04fdeaf, Offset: 0x8b0
// Size: 0x8c
function function_7cbeb2f0( normal )
{
    if ( normal[ 2 ] < 0.5 )
    {
        stepoutdistance = normal * getdvarint( #"hash_4fd125a3b5b9c476", 50 );
    }
    else
    {
        stepoutdistance = normal * getdvarint( #"hash_49b134352662c4b9", 12 );
    }
    
    return stepoutdistance;
}

// Namespace wraith_fire/wraith_fire
// Params 8
// Checksum 0xe612b478, Offset: 0x948
// Size: 0x96c
function function_e8ad1d81( position, owner, normal, velocity, killcament, weapon, team, customsettings )
{
    originalposition = position;
    var_493d36f9 = normal;
    var_96609105 = vectornormalize( velocity );
    var_87d082a9 = vectorscale( var_96609105, -1 );
    var_d6d43109 = 1;
    var_e76400c0 = undefined;
    wallnormal = undefined;
    var_693f108f = undefined;
    var_8eb0a180 = getweapon( #"wraith_fire_fire" );
    var_f483ab45 = getweapon( #"wraith_fire_fire_wall" );
    var_fc031a6d = getweapon( #"wraith_fire_steam" );
    
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
            var_87d082a9 = normal;
            
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
                    level thread function_42b9fdbe( var_fc031a6d, newpos, ( 0, 0, 1 ), int( customsettings.var_b79d64a9 ), team );
                    break;
                }
                
                level thread function_42b9fdbe( var_f483ab45, newpos, wall_normal, int( customsettings.var_b79d64a9 ), team );
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
    function_85ff22aa( startpos, 20, ( 0, 1, 0 ), 0.6, 200 );
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
            function_a25dee15( var_f483ab45, traceposition, var_252a0dc7, int( customsettings.var_b79d64a9 ), team );
        }
    }
    
    var_87d082a9 = normal;
    level function_8a03d3f3( owner, position, startpos, var_87d082a9, var_d6d43109, rotation, killcament, weapon, customsettings, team, var_e76400c0, wallnormal, var_693f108f );
}

// Namespace wraith_fire/wraith_fire
// Params 7
// Checksum 0x8a2d34ab, Offset: 0x12c0
// Size: 0x98
function function_523961e2( startpos, normal, var_4997e17c, fxindex, fxcount, defaultdistance, rotation )
{
    currentangle = 360 / fxcount * fxindex;
    var_7ee25402 = rotatepointaroundaxis( var_4997e17c * defaultdistance, normal, currentangle + rotation );
    return startpos + var_7ee25402;
}

// Namespace wraith_fire/wraith_fire
// Params 13
// Checksum 0x5d59b051, Offset: 0x1360
// Size: 0x10b0
function function_8a03d3f3( owner, impactpos, startpos, normal, multiplier, rotation, killcament, weapon, customsettings, team, var_e76400c0, wallnormal, var_693f108f )
{
    defaultdistance = customsettings.var_6193a41b * multiplier;
    defaultdropdistance = getdvarint( #"hash_4270b8db6cf2ceff", 90 );
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
    
    var_4997e17c = perpendicularvector( normal );
    
    for ( fxindex = 0; fxindex < fxcount ; fxindex++ )
    {
        locations[ #"point" ][ fxindex ] = function_523961e2( startpos, normal, var_4997e17c, fxindex, fxcount, defaultdistance, rotation );
        function_85ff22aa( locations[ #"point" ][ fxindex ], 10, ( 0, fxindex * 20, 0 ), 0.6, 200 );
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
            function_85ff22aa( traceposition, 10, ( 1, 0, 0 ), 0.6, 200 );
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
                function_85ff22aa( tracedown[ #"position" ], 10, ( 0, 0, 1 ), 0.6, 200 );
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
                function_85ff22aa( var_9417df90[ #"position" ], 10, ( 0, 0, 1 ), 0.6, 200 );
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
    
    var_8eb0a180 = getweapon( #"wraith_fire_fire" );
    var_1c8ca3ba = getweapon( #"wraith_fire_fire_tall" );
    var_c0fe81f1 = getweapon( #"wraith_fire_fire_small" );
    var_fc031a6d = getweapon( #"wraith_fire_steam" );
    var_6b23e1c9 = impactpos + normal * 1.5;
    forward = ( 1, 0, 0 );
    
    if ( abs( vectordot( forward, normal ) ) > 0.999 )
    {
        forward = ( 0, 0, 1 );
    }
    
    mdl_anchor = util::spawn_model( "tag_origin", var_6b23e1c9 );
    s_trace = groundtrace( mdl_anchor.origin + ( 0, 0, 10 ), mdl_anchor.origin + ( 0, 0, -100 ), 0, mdl_anchor );
    
    if ( isdefined( s_trace[ #"entity" ] ) && s_trace[ #"entity" ] ismovingplatform() )
    {
        mdl_anchor linkto( s_trace[ #"entity" ] );
    }
    else
    {
        mdl_anchor delete();
    }
    
    if ( !is_under_water( var_6b23e1c9 ) )
    {
        if ( isdefined( mdl_anchor ) )
        {
            playfxontag( level._effect[ #"hash_6024e139900c449a" ], mdl_anchor, "tag_origin", 0 );
        }
        else
        {
            e_light_fx = playfx( level._effect[ #"hash_6024e139900c449a" ], var_6b23e1c9, forward, normal, 0, team );
            
            if ( !isdefined( level.var_d3b05dcb ) )
            {
                level.var_d3b05dcb = [];
            }
            else if ( !isarray( level.var_d3b05dcb ) )
            {
                level.var_d3b05dcb = array( level.var_d3b05dcb );
            }
            
            level.var_d3b05dcb[ level.var_d3b05dcb.size ] = e_light_fx;
        }
        
        if ( !isdefined( var_e76400c0 ) )
        {
            var_af1bdf1 = function_a25dee15( var_8eb0a180, var_6b23e1c9, normal, int( customsettings.var_b79d64a9 ), team );
            var_af1bdf1 function_4e5a1dd3( mdl_anchor );
        }
    }
    
    if ( level.gameended )
    {
        return;
    }
    
    thread damageeffectarea( owner, startpos, killcament, normal, var_8eb0a180, customsettings, multiplier, var_e76400c0, wallnormal, var_693f108f, mdl_anchor );
    thread function_9464e4ad( owner, startpos, killcament, normal, var_8eb0a180, customsettings, multiplier, var_e76400c0, wallnormal, var_693f108f, mdl_anchor );
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
        
        if ( is_round_reset() )
        {
            break;
        }
        
        if ( isdefined( locations[ #"smallfire" ][ lockey ] ) )
        {
            fireweapon = var_c0fe81f1;
        }
        else if ( isdefined( locations[ #"steam" ][ lockey ] ) )
        {
            fireweapon = var_fc031a6d;
        }
        else
        {
            fireweapon = isdefined( locations[ #"tallfire" ][ lockey ] ) ? var_1c8ca3ba : var_8eb0a180;
        }
        
        level thread function_42b9fdbe( fireweapon, locations[ #"loc" ][ lockey ], locations[ #"normal" ][ lockey ], int( customsettings.var_b79d64a9 ), team, mdl_anchor );
    }
}

// Namespace wraith_fire/wraith_fire
// Params 6
// Checksum 0x72227895, Offset: 0x2418
// Size: 0x9c
function function_42b9fdbe( weapon, loc, normal, duration, team, mdl_anchor )
{
    wait randomfloatrange( 0, 0.5 );
    var_af1bdf1 = function_a25dee15( weapon, loc, normal, duration, team );
    var_af1bdf1 function_4e5a1dd3( mdl_anchor );
}

// Namespace wraith_fire/wraith_fire
// Params 5
// Checksum 0x3daee41b, Offset: 0x24c0
// Size: 0x186
function function_a25dee15( weapon, loc, normal, duration, team )
{
    level.var_d3b05dcb = array::remove_undefined( level.var_d3b05dcb );
    var_c4554e4a = isdefined( level.var_f9af4bc8 ) ? level.var_f9af4bc8 : 20;
    
    if ( level.var_d3b05dcb.size >= var_c4554e4a )
    {
        level.var_d3b05dcb[ 0 ] delete();
        arrayremoveindex( level.var_d3b05dcb, 0 );
    }
    
    var_af1bdf1 = spawntimedfx( weapon, loc, normal, duration, team );
    
    if ( !isdefined( level.var_d3b05dcb ) )
    {
        level.var_d3b05dcb = [];
    }
    else if ( !isarray( level.var_d3b05dcb ) )
    {
        level.var_d3b05dcb = array( level.var_d3b05dcb );
    }
    
    level.var_d3b05dcb[ level.var_d3b05dcb.size ] = var_af1bdf1;
    return var_af1bdf1;
}

// Namespace wraith_fire/wraith_fire
// Params 1
// Checksum 0xfc9933a, Offset: 0x2650
// Size: 0x4c
function function_4e5a1dd3( mdl_anchor )
{
    if ( isdefined( self ) && isdefined( mdl_anchor ) )
    {
        self enablelinkto();
        self linkto( mdl_anchor );
    }
}

/#

    // Namespace wraith_fire/wraith_fire
    // Params 5
    // Checksum 0x5fa412, Offset: 0x26a8
    // Size: 0xb4, Type: dev
    function incendiary_debug_line( from, to, color, depthtest, time )
    {
        debug_rcbomb = getdvarint( #"hash_75de04766593ca0c", 0 );
        
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

// Namespace wraith_fire/wraith_fire
// Params 11
// Checksum 0xab9bf636, Offset: 0x2768
// Size: 0x698
function damageeffectarea( owner, position, killcament, normal, weapon, customsettings, radius_multiplier, var_e76400c0, wallnormal, var_cbaaea69, mdl_anchor )
{
    level endon( #"game_ended" );
    radius = customsettings.var_6193a41b * radius_multiplier;
    height = customsettings.var_cbd86f3e;
    trigger_radius_position = position - ( 0, 0, height );
    trigger_radius_height = height * 2;
    spawnflags = function_30125f88();
    
    if ( isdefined( var_e76400c0 ) && isdefined( wallnormal ) )
    {
        var_21f4217c = var_e76400c0 + vectorscale( wallnormal, 12 ) - ( 0, 0, var_cbaaea69 );
        var_289a74bc = spawn( "trigger_radius", var_21f4217c, spawnflags, 12, var_cbaaea69 );
        var_289a74bc function_4e5a1dd3( mdl_anchor );
        
        /#
            if ( getdvarint( #"scr_draw_triggers", 0 ) )
            {
                level thread util::drawcylinder( var_21f4217c, 12, var_cbaaea69, undefined, "<dev string:x78>", ( 1, 0, 0 ), 0.9 );
            }
        #/
    }
    
    if ( radius >= 0.04 )
    {
        fireeffectarea = spawn( "trigger_radius", trigger_radius_position, spawnflags, radius, trigger_radius_height );
        fireeffectarea function_4e5a1dd3( mdl_anchor );
        firesound = spawn( "script_origin", fireeffectarea.origin );
        firesound playloopsound( #"hash_bdb30092e9dc406" );
        level thread influencers::create_grenade_influencers( isdefined( owner ) ? owner.team : undefined, weapon, fireeffectarea );
    }
    
    /#
        if ( getdvarint( #"scr_draw_triggers", 0 ) )
        {
            level thread util::drawcylinder( trigger_radius_position, radius, trigger_radius_height, undefined, "<dev string:x78>" );
        }
    #/
    
    self.var_ebf0b1c9 = [];
    burntime = 0;
    var_d0603aba = 1;
    damageendtime = int( gettime() + customsettings.var_b79d64a9 * 1000 );
    
    while ( gettime() < damageendtime )
    {
        damageapplied = 0;
        potential_targets = self getpotentialtargets( owner, customsettings );
        
        if ( isdefined( owner ) )
        {
            owner.var_14e5c74a = [];
        }
        
        self thread function_124fe29c( potential_targets, owner, position, fireeffectarea, var_289a74bc, killcament, weapon, customsettings );
        
        if ( isdefined( owner ) )
        {
            affectedplayers = owner.var_14e5c74a.size;
            
            if ( affectedplayers > 0 && burntime < gettime() )
            {
                burntime = gettime() + int( customsettings.var_5c06ec56 * 1000 );
            }
            
            if ( isdefined( level.playgadgetsuccess ) && var_d0603aba )
            {
                if ( isdefined( level.var_ac6052e9 ) )
                {
                    var_9194a036 = [[ level.var_ac6052e9 ]]( "wraith_fireSuccessLineCount", 0 );
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
        
        if ( is_round_reset() )
        {
            break;
        }
        
        wait customsettings.var_90bd7d92;
    }
    
    arrayremovevalue( self.var_ebf0b1c9, undefined );
    
    foreach ( target in self.var_ebf0b1c9 )
    {
        target.var_84e41b20 = undefined;
        target status_effect::function_408158ef( level.var_ccdda8d1, level.var_40d32830 );
    }
    
    if ( isdefined( owner ) )
    {
        owner.var_14e5c74a = [];
    }
    
    if ( isdefined( killcament ) )
    {
        killcament entityheadicons::destroyentityheadicons();
    }
    
    if ( isdefined( mdl_anchor ) )
    {
        mdl_anchor delete();
    }
    
    if ( isdefined( fireeffectarea ) )
    {
        fireeffectarea delete();
        firesound thread stopfiresound();
    }
    
    if ( isdefined( var_289a74bc ) )
    {
        var_289a74bc delete();
    }
    
    /#
        if ( getdvarint( #"scr_draw_triggers", 0 ) )
        {
            level notify( #"hash_67e730c2519446" );
        }
    #/
}

// Namespace wraith_fire/wraith_fire
// Params 0, eflags: 0x4
// Checksum 0xb6249eeb, Offset: 0x2e08
// Size: 0x50, Type: bool
function private is_round_reset()
{
    if ( level flag::exists( "round_reset" ) && level flag::get( "round_reset" ) )
    {
        return true;
    }
    
    return false;
}

// Namespace wraith_fire/wraith_fire
// Params 0, eflags: 0x4
// Checksum 0x9f4f6285, Offset: 0x2e60
// Size: 0x22
function private function_30125f88()
{
    if ( level.friendlyfire > 0 )
    {
        return ( 2 | 1 );
    }
    
    return 0;
}

// Namespace wraith_fire/wraith_fire
// Params 8
// Checksum 0xfc65148b, Offset: 0x2e90
// Size: 0x15c
function function_124fe29c( a_targets, owner, position, fireeffectarea, var_289a74bc, killcament, weapon, customsettings )
{
    function_e7f6e154();
    var_b54f21b2 = 0;
    
    foreach ( target in a_targets )
    {
        if ( isalive( target ) )
        {
            var_1956fc57 = trytoapplyfiredamage( target, owner, position, fireeffectarea, var_289a74bc, killcament, weapon, customsettings );
            
            if ( var_1956fc57 )
            {
                var_b54f21b2++;
            }
        }
        
        if ( var_b54f21b2 >= 1 )
        {
            util::wait_network_frame();
            var_b54f21b2 = 0;
        }
    }
    
    level.var_f9145520--;
}

// Namespace wraith_fire/wraith_fire
// Params 1
// Checksum 0xc1b8c551, Offset: 0x2ff8
// Size: 0x54
function function_e7f6e154( n_count_per_network_frame = 1 )
{
    while ( level.var_f9145520 >= n_count_per_network_frame )
    {
        util::wait_network_frame();
    }
    
    level.var_f9145520++;
}

// Namespace wraith_fire/wraith_fire
// Params 0
// Checksum 0x5b4dc95c, Offset: 0x3058
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

// Namespace wraith_fire/wraith_fire
// Params 11
// Checksum 0x923229b2, Offset: 0x30b8
// Size: 0x3dc
function function_9464e4ad( owner, position, killcament, normal, weapon, customsettings, radius_multiplier, var_e76400c0, wallnormal, var_cbaaea69, mdl_anchor )
{
    level endon( #"game_ended" );
    radius = customsettings.var_6193a41b * radius_multiplier;
    height = customsettings.var_cbd86f3e;
    trigger_radius_position = position - ( 0, 0, height );
    trigger_radius_height = height * 2;
    spawnflags = function_30125f88();
    
    if ( isdefined( var_e76400c0 ) && isdefined( wallnormal ) )
    {
        var_21f4217c = var_e76400c0 + vectorscale( wallnormal, 12 ) - ( 0, 0, var_cbaaea69 );
        var_289a74bc = spawn( "trigger_radius", var_21f4217c, spawnflags, 12, var_cbaaea69 );
        var_289a74bc function_4e5a1dd3( mdl_anchor );
    }
    
    if ( radius >= 0.04 )
    {
        fireeffectarea = spawn( "trigger_radius", trigger_radius_position, spawnflags, radius, trigger_radius_height );
        fireeffectarea function_4e5a1dd3( mdl_anchor );
    }
    
    self.var_ebf0b1c9 = [];
    damageendtime = int( gettime() + customsettings.var_b79d64a9 * 1000 );
    
    while ( gettime() < damageendtime )
    {
        damageapplied = 0;
        potential_targets = self weapons::function_356292be( owner, position, radius );
        self thread function_124fe29c( potential_targets, owner, position, fireeffectarea, var_289a74bc, killcament, weapon, customsettings );
        
        if ( is_round_reset() )
        {
            break;
        }
        
        wait customsettings.var_8fbd03cb;
    }
    
    arrayremovevalue( self.var_ebf0b1c9, undefined );
    
    foreach ( target in self.var_ebf0b1c9 )
    {
        target.var_84e41b20 = undefined;
        target status_effect::function_408158ef( level.var_ccdda8d1, level.var_40d32830 );
    }
    
    if ( isdefined( owner ) )
    {
        owner globallogic_score::function_d3ca3608( #"hash_775faa6097bd0ccc" );
    }
    
    if ( isdefined( mdl_anchor ) )
    {
        mdl_anchor delete();
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

// Namespace wraith_fire/wraith_fire
// Params 2
// Checksum 0xa4691b4e, Offset: 0x34a0
// Size: 0x33c
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

// Namespace wraith_fire/wraith_fire
// Params 1
// Checksum 0x68792967, Offset: 0x37e8
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

// Namespace wraith_fire/wraith_fire
// Params 8
// Checksum 0xf8c65320, Offset: 0x3950
// Size: 0x434
function trytoapplyfiredamage( target, owner, position, fireeffectarea, var_289a74bc, killcament, weapon, customsettings )
{
    var_1956fc57 = 0;
    
    if ( !( isdefined( fireeffectarea ) || isdefined( var_289a74bc ) ) || is_round_reset() )
    {
        return var_1956fc57;
    }
    
    if ( isdefined( level.var_484675b5 ) && level.var_484675b5 && owner === target )
    {
        return var_1956fc57;
    }
    
    if ( isdefined( level.var_edae191d ) && level.var_edae191d && isplayer( target ) )
    {
        return var_1956fc57;
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
            if ( isplayer( target ) || sessionmodeiswarzonegame() && isactor( target ) )
            {
                target thread damageinfirearea( sourcepos, killcament, trace, position, weapon, customsettings, owner );
                
                if ( isdefined( owner ) && util::function_fbce7263( target.team, owner.team ) )
                {
                    owner.var_14e5c74a[ targetentnum ] = target;
                }
            }
            else
            {
                target thread function_37ddab3( sourcepos, killcament, trace, position, weapon, customsettings, owner );
            }
            
            self.var_ebf0b1c9[ targetentnum ] = target;
            var_1956fc57 = 1;
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
            target status_effect::function_408158ef( level.var_ccdda8d1, level.var_40d32830 );
            self.var_ebf0b1c9[ targetentnum ] = undefined;
        }
        else if ( isdefined( killcament ) )
        {
            target.var_84e41b20[ killcament.starttime ] = undefined;
        }
        
        if ( isdefined( owner ) )
        {
            owner.var_14e5c74a[ targetentnum ] = undefined;
        }
    }
    
    return var_1956fc57;
}

// Namespace wraith_fire/wraith_fire
// Params 7
// Checksum 0xc87180fa, Offset: 0x3d90
// Size: 0x1cc
function damageinfirearea( origin, killcament, trace, position, weapon, customsettings, owner )
{
    self endon( #"death" );
    timer = 0;
    
    if ( candofiredamage( killcament, self, customsettings.var_90bd7d92 ) )
    {
        /#
            level.var_eb1010d2 = getdvarint( #"hash_75de04766593ca0c", 0 );
            
            if ( level.var_eb1010d2 )
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
        
        params = getstatuseffect( "dot_wraith_fire" );
        params.killcament = killcament;
        self status_effect::status_effect_apply( params, weapon, owner, 0, undefined, undefined, origin );
        self.var_c8b39cc6 = var_4dd4e6ee;
        self thread sndfiredamage();
    }
}

// Namespace wraith_fire/wraith_fire
// Params 7
// Checksum 0xf643314, Offset: 0x3f68
// Size: 0x152
function function_37ddab3( origin, killcament, trace, position, weapon, customsettings, owner )
{
    self endon( #"death" );
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
        self.var_c8b39cc6 = var_4dd4e6ee;
    }
}

// Namespace wraith_fire/wraith_fire
// Params 0
// Checksum 0xbe1a992e, Offset: 0x40c8
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

// Namespace wraith_fire/wraith_fire
// Params 1
// Checksum 0xab71831a, Offset: 0x4220
// Size: 0x4c
function sndfiredamage_deleteent( ent )
{
    self waittill( #"death", #"disconnect" );
    
    if ( isdefined( ent ) )
    {
        ent delete();
    }
}

// Namespace wraith_fire/wraith_fire
// Params 3
// Checksum 0x155d7eaf, Offset: 0x4278
// Size: 0xf0
function hitpos( start, end, color )
{
    trace = bullettrace( start, end, 0, undefined );
    
    /#
        level.var_eb1010d2 = getdvarint( #"hash_75de04766593ca0c", 0 );
        
        if ( level.var_eb1010d2 )
        {
            debugstar( trace[ #"position" ], 2000, color );
        }
        
        thread incendiary_debug_line( start, trace[ #"position" ], color, 1, 80 );
    #/
    
    return trace;
}

// Namespace wraith_fire/wraith_fire
// Params 3
// Checksum 0x260ec7f5, Offset: 0x4370
// Size: 0xfc, Type: bool
function candofiredamage( killcament, victim, resetfiretime )
{
    if ( isplayer( victim ) && victim depthofplayerinwater() >= 1 && !( isdefined( level.var_c62ed297 ) && level.var_c62ed297 ) )
    {
        return false;
    }
    
    if ( is_round_reset() )
    {
        return false;
    }
    
    entnum = victim getentitynumber();
    
    if ( !isdefined( level.var_660293e0[ entnum ] ) )
    {
        level.var_660293e0[ entnum ] = 1;
        level thread resetfiredamage( entnum, resetfiretime );
        return true;
    }
    
    return false;
}

// Namespace wraith_fire/wraith_fire
// Params 2
// Checksum 0x8f1e11b7, Offset: 0x4478
// Size: 0x44
function resetfiredamage( entnum, time )
{
    if ( time > 0.05 )
    {
        wait time - 0.05;
    }
    
    level.var_660293e0[ entnum ] = undefined;
}

// Namespace wraith_fire/wraith_fire
// Params 5
// Checksum 0x7c8334d1, Offset: 0x44c8
// Size: 0xb4
function function_85ff22aa( origin, radius, color, alpha, time )
{
    /#
        debug_fire = getdvarint( #"hash_66232b46a7e21dec", 0 );
        
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

