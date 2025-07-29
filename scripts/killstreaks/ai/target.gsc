#using scripts\core_common\targetting_delay;
#using scripts\core_common\util_shared;

#namespace ai_target;

// Namespace ai_target/target
// Params 2
// Checksum 0x9a1d7b35, Offset: 0x98
// Size: 0x8c, Type: bool
function function_d15dd929( radius, origin )
{
    result = function_9cc082d2( origin + ( 0, 0, 100 ), 200 );
    
    if ( isdefined( result ) && isdefined( result[ #"materialflags" ] ) && result[ #"materialflags" ] & 2 )
    {
        return false;
    }
    
    return true;
}

// Namespace ai_target/target
// Params 1
// Checksum 0x9f6b08a0, Offset: 0x130
// Size: 0x21c, Type: bool
function is_target_valid( target )
{
    if ( !isdefined( target ) )
    {
        return false;
    }
    
    if ( !isalive( target ) )
    {
        return false;
    }
    
    if ( isplayer( target ) && target.sessionstate == "spectator" )
    {
        return false;
    }
    
    if ( isplayer( target ) && target.sessionstate == "intermission" )
    {
        return false;
    }
    
    if ( isdefined( level.intermission ) && level.intermission )
    {
        return false;
    }
    
    if ( isdefined( target.ignoreme ) && target.ignoreme )
    {
        return false;
    }
    
    if ( target isnotarget() )
    {
        return false;
    }
    
    if ( issentient( target ) && self function_ce6d3545( target ) )
    {
        return false;
    }
    
    if ( !util::function_fbce7263( self.team, target.team ) )
    {
        return false;
    }
    
    if ( isplayer( target ) )
    {
        if ( target isplayerswimming() )
        {
            return false;
        }
        
        waterdepth = target depthofplayerinwater();
        
        if ( waterdepth > 2 )
        {
            return false;
        }
        
        radius = self getpathfindingradius();
        
        if ( !function_d15dd929( radius, target.origin ) )
        {
            return false;
        }
    }
    
    if ( target depthinwater() >= 10 )
    {
        return false;
    }
    
    return true;
}

// Namespace ai_target/target
// Params 0
// Checksum 0x360a0f06, Offset: 0x358
// Size: 0x130
function get_targets()
{
    targets = [];
    targets = arraycombine( getplayers(), getactorarray(), 0, 0 );
    valid_targets = [];
    
    foreach ( target in targets )
    {
        if ( !is_target_valid( target ) )
        {
            continue;
        }
        
        if ( !isdefined( valid_targets ) )
        {
            valid_targets = [];
        }
        else if ( !isarray( valid_targets ) )
        {
            valid_targets = array( valid_targets );
        }
        
        valid_targets[ valid_targets.size ] = target;
    }
    
    return valid_targets;
}

// Namespace ai_target/target
// Params 2
// Checksum 0x97ad095e, Offset: 0x490
// Size: 0x318
function function_84235351( attack_origin, var_edc20efd )
{
    targets = self get_targets();
    var_e0c224a4 = var_edc20efd * var_edc20efd;
    least_hunted = undefined;
    closest_target_dist_squared = undefined;
    
    foreach ( target in targets )
    {
        if ( !isdefined( target.hunted_by ) )
        {
            target.hunted_by = 0;
        }
        
        attackedrecently = 0;
        
        if ( issentient( target ) )
        {
            attackedrecently = target attackedrecently( self, 3 );
            
            if ( isdefined( attackedrecently ) && attackedrecently )
            {
                return target;
            }
        }
        
        if ( self function_ce6d3545( target ) )
        {
            continue;
        }
        
        if ( isplayer( target ) && target isgrappling() )
        {
            continue;
        }
        
        if ( !isdefined( getclosestpointonnavmesh( target.origin, 200, 1.2 * self getpathfindingradius() ) ) )
        {
            continue;
        }
        
        dist_squared = distancesquared( attack_origin, target.origin );
        var_e294ac7d = isplayer( target ) ? target function_d730727f() : 1;
        var_97f7ad10 = var_e0c224a4 * var_e294ac7d;
        
        if ( dist_squared > var_97f7ad10 )
        {
            continue;
        }
        
        if ( !self is_target_valid( least_hunted ) )
        {
            least_hunted = target;
        }
        
        if ( target.hunted_by <= least_hunted.hunted_by && ( !isdefined( closest_target_dist_squared ) || dist_squared < closest_target_dist_squared ) )
        {
            least_hunted = target;
            closest_target_dist_squared = dist_squared;
        }
    }
    
    if ( !self is_target_valid( least_hunted ) )
    {
        return undefined;
    }
    
    least_hunted.hunted_by += 1;
    return least_hunted;
}

// Namespace ai_target/target
// Params 2
// Checksum 0xde1f605d, Offset: 0x7b0
// Size: 0x152
function function_a13468f5( attack_origin, var_edc20efd )
{
    targets = self get_targets();
    valid_targets = [];
    var_e0c224a4 = var_edc20efd * var_edc20efd;
    
    foreach ( target in targets )
    {
        dist_squared = distancesquared( attack_origin, target.origin );
        
        if ( dist_squared > var_e0c224a4 )
        {
            continue;
        }
        
        if ( self function_ce6d3545( target ) )
        {
            continue;
        }
        
        if ( self is_target_valid( target ) )
        {
            valid_targets[ valid_targets.size ] = target;
        }
    }
    
    if ( valid_targets.size )
    {
        return valid_targets[ 0 ];
    }
    
    return undefined;
}

