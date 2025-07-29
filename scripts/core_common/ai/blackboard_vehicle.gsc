#namespace blackboard;

/#

    // Namespace blackboard/blackboard_vehicle
    // Params 0
    // Checksum 0xe3c30a9d, Offset: 0x68
    // Size: 0x34, Type: dev
    function registervehicleblackboardattributes()
    {
        assert( isvehicle( self ), "<dev string:x38>" );
    }

#/

// Namespace blackboard/blackboard_vehicle
// Params 0
// Checksum 0x508c8009, Offset: 0xa8
// Size: 0x3a
function bb_getspeed()
{
    velocity = self getvelocity();
    return length( velocity );
}

// Namespace blackboard/blackboard_vehicle
// Params 0
// Checksum 0x9761ddbc, Offset: 0xf0
// Size: 0x4a
function bb_vehgetenemyyaw()
{
    enemy = self.enemy;
    
    if ( !isdefined( enemy ) )
    {
        return 0;
    }
    
    toenemyyaw = vehgetpredictedyawtoenemy( self, 0.2 );
    return toenemyyaw;
}

// Namespace blackboard/blackboard_vehicle
// Params 2
// Checksum 0x552fdd8f, Offset: 0x148
// Size: 0x15e
function vehgetpredictedyawtoenemy( entity, lookaheadtime )
{
    if ( isdefined( entity.predictedyawtoenemy ) && isdefined( entity.predictedyawtoenemytime ) && entity.predictedyawtoenemytime == gettime() )
    {
        return entity.predictedyawtoenemy;
    }
    
    selfpredictedpos = entity.origin;
    moveangle = entity.angles[ 1 ] + entity getmotionangle();
    selfpredictedpos += ( cos( moveangle ), sin( moveangle ), 0 ) * 200 * lookaheadtime;
    yaw = vectortoangles( entity.enemy.origin - selfpredictedpos )[ 1 ] - entity.angles[ 1 ];
    yaw = absangleclamp360( yaw );
    entity.predictedyawtoenemy = yaw;
    entity.predictedyawtoenemytime = gettime();
    return yaw;
}

