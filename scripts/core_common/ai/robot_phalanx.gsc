#using scripts\core_common\ai\archetype_damage_utility;
#using scripts\core_common\ai_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\spawner_shared;
#using scripts\core_common\values_shared;

#namespace robotphalanx;

// Namespace robotphalanx
// Method(s) 25 Total 25
class robotphalanx
{

    var breakingpoint_;
    var currentrobotcount_;
    var endposition_;
    var phalanxtype_;
    var scattered_;
    var startposition_;
    var startrobotcount_;
    var tier1robots_;
    var tier2robots_;
    var tier3robots_;

    // Namespace robotphalanx/robot_phalanx
    // Params 0, eflags: 0x8
    // Checksum 0x4fc4c550, Offset: 0x16b8
    // Size: 0x56
    constructor()
    {
        tier1robots_ = [];
        tier2robots_ = [];
        tier3robots_ = [];
        startrobotcount_ = 0;
        currentrobotcount_ = 0;
        breakingpoint_ = 0;
        scattered_ = 0;
    }

    // Namespace robotphalanx/robot_phalanx
    // Params 0
    // Checksum 0x47144607, Offset: 0x1d50
    // Size: 0xee
    function scatterphalanx()
    {
        if ( !scattered_ )
        {
            scattered_ = 1;
            _releaserobots( tier1robots_ );
            tier1robots_ = [];
            _assignphalanxstance( tier2robots_, "crouch" );
            wait randomfloatrange( 5, 7 );
            _releaserobots( tier2robots_ );
            tier2robots_ = [];
            _assignphalanxstance( tier3robots_, "crouch" );
            wait randomfloatrange( 5, 7 );
            _releaserobots( tier3robots_ );
            tier3robots_ = [];
        }
    }

    // Namespace robotphalanx/robot_phalanx
    // Params 0
    // Checksum 0x8a9fce1e, Offset: 0x1cf8
    // Size: 0x4c
    function resumefire()
    {
        _resumefirerobots( tier1robots_ );
        _resumefirerobots( tier2robots_ );
        _resumefirerobots( tier3robots_ );
    }

    // Namespace robotphalanx/robot_phalanx
    // Params 0
    // Checksum 0xc1aa3fed, Offset: 0x1bd8
    // Size: 0x114
    function resumeadvance()
    {
        if ( !scattered_ )
        {
            _assignphalanxstance( tier1robots_, "stand" );
            wait 1;
            forward = vectornormalize( endposition_ - startposition_ );
            _movephalanxtier( tier1robots_, phalanxtype_, "phalanx_tier1", endposition_, forward );
            _movephalanxtier( tier2robots_, phalanxtype_, "phalanx_tier2", endposition_, forward );
            _movephalanxtier( tier3robots_, phalanxtype_, "phalanx_tier3", endposition_, forward );
            _assignphalanxstance( tier1robots_, "crouch" );
        }
    }

    // Namespace robotphalanx/robot_phalanx
    // Params 8
    // Checksum 0x31ade7c8, Offset: 0x18c0
    // Size: 0x30c
    function initialize( phalanxtype, origin, destination, breakingpoint, maxtiersize = 10, tieronespawner = undefined, tiertwospawner = undefined, tierthreespawner = undefined )
    {
        assert( isstring( phalanxtype ) );
        assert( isint( breakingpoint ) );
        assert( isvec( origin ) );
        assert( isvec( destination ) );
        maxtiersize = math::clamp( maxtiersize, 1, 10 );
        forward = vectornormalize( destination - origin );
        tier1robots_ = _createphalanxtier( phalanxtype, "phalanx_tier1", origin, forward, maxtiersize, tieronespawner );
        tier2robots_ = _createphalanxtier( phalanxtype, "phalanx_tier2", origin, forward, maxtiersize, tiertwospawner );
        tier3robots_ = _createphalanxtier( phalanxtype, "phalanx_tier3", origin, forward, maxtiersize, tierthreespawner );
        _assignphalanxstance( tier1robots_, "crouch" );
        _movephalanxtier( tier1robots_, phalanxtype, "phalanx_tier1", destination, forward );
        _movephalanxtier( tier2robots_, phalanxtype, "phalanx_tier2", destination, forward );
        _movephalanxtier( tier3robots_, phalanxtype, "phalanx_tier3", destination, forward );
        startrobotcount_ = tier1robots_.size + tier2robots_.size + tier3robots_.size;
        breakingpoint_ = breakingpoint;
        startposition_ = origin;
        endposition_ = destination;
        phalanxtype_ = phalanxtype;
        self thread _updatephalanxthread( self );
    }

    // Namespace robotphalanx/robot_phalanx
    // Params 0
    // Checksum 0x444f84a0, Offset: 0x1860
    // Size: 0x54
    function haltadvance()
    {
        if ( !scattered_ )
        {
            _haltadvance( tier1robots_ );
            _haltadvance( tier2robots_ );
            _haltadvance( tier3robots_ );
        }
    }

    // Namespace robotphalanx/robot_phalanx
    // Params 0
    // Checksum 0xd2d527df, Offset: 0x1808
    // Size: 0x4c
    function haltfire()
    {
        _haltfire( tier1robots_ );
        _haltfire( tier2robots_ );
        _haltfire( tier3robots_ );
    }

    // Namespace robotphalanx/robot_phalanx
    // Params 0, eflags: 0x4
    // Checksum 0xcfc6d9e, Offset: 0x1728
    // Size: 0xd4, Type: bool
    function private _updatephalanx()
    {
        if ( scattered_ )
        {
            return false;
        }
        
        tier1robots_ = _prunedead( tier1robots_ );
        tier2robots_ = _prunedead( tier2robots_ );
        tier3robots_ = _prunedead( tier3robots_ );
        currentrobotcount_ = tier1robots_.size + tier2robots_.size + tier2robots_.size;
        
        if ( currentrobotcount_ <= startrobotcount_ - breakingpoint_ )
        {
            scatterphalanx();
            return false;
        }
        
        return true;
    }

    // Namespace robotphalanx/robot_phalanx
    // Params 1, eflags: 0x4
    // Checksum 0xf8ab2132, Offset: 0x1688
    // Size: 0x28
    function private _updatephalanxthread( phalanx )
    {
        while ( [[ phalanx ]]->_updatephalanx() )
        {
            wait 1;
        }
    }

    // Namespace robotphalanx/robot_phalanx
    // Params 2, eflags: 0x4
    // Checksum 0x217ac43d, Offset: 0x15e0
    // Size: 0xa0
    function private _rotatevec( vector, angle )
    {
        return ( vector[ 0 ] * cos( angle ) - vector[ 1 ] * sin( angle ), vector[ 0 ] * sin( angle ) + vector[ 1 ] * cos( angle ), vector[ 2 ] );
    }

    // Namespace robotphalanx/robot_phalanx
    // Params 1, eflags: 0x4
    // Checksum 0xcb6b4ee6, Offset: 0x1530
    // Size: 0xa8
    function private _resumefirerobots( robots )
    {
        assert( isarray( robots ) );
        
        foreach ( robot in robots )
        {
            _resumefire( robot );
        }
    }

    // Namespace robotphalanx/robot_phalanx
    // Params 1, eflags: 0x4
    // Checksum 0x9e4b7894, Offset: 0x14c8
    // Size: 0x5c
    function private _resumefire( robot )
    {
        if ( isdefined( robot ) && isalive( robot ) )
        {
            robot val::reset( #"halt_fire", "ignoreall" );
        }
    }

    // Namespace robotphalanx/robot_phalanx
    // Params 1, eflags: 0x4
    // Checksum 0x8f893952, Offset: 0x1408
    // Size: 0xb8
    function private _releaserobots( robots )
    {
        foreach ( robot in robots )
        {
            _resumefire( robot );
            _releaserobot( robot );
            wait randomfloatrange( 0.5, 5 );
        }
    }

    // Namespace robotphalanx/robot_phalanx
    // Params 1, eflags: 0x4
    // Checksum 0x90d3c8c4, Offset: 0x12b0
    // Size: 0x14c
    function private _releaserobot( robot )
    {
        if ( isdefined( robot ) && isalive( robot ) )
        {
            robot function_d4c687c9();
            robot pathmode( "move delayed", 1, randomfloatrange( 0.5, 1 ) );
            robot ai::set_behavior_attribute( "phalanx", 0 );
            waitframe( 1 );
            
            if ( isdefined( robot ) && isalive( robot ) )
            {
                robot ai::set_behavior_attribute( "move_mode", "normal" );
                robot ai::set_behavior_attribute( "force_cover", 0 );
                robot setavoidancemask( "avoid all" );
                aiutility::removeaioverridedamagecallback( robot, &_dampenexplosivedamage );
            }
        }
    }

    // Namespace robotphalanx/robot_phalanx
    // Params 1, eflags: 0x4
    // Checksum 0x2b7d6a, Offset: 0x11f8
    // Size: 0xb0
    function private _prunedead( robots )
    {
        liverobots = [];
        
        foreach ( index, robot in robots )
        {
            if ( isdefined( robot ) && isalive( robot ) )
            {
                liverobots[ index ] = robot;
            }
        }
        
        return liverobots;
    }

    // Namespace robotphalanx/robot_phalanx
    // Params 5, eflags: 0x4
    // Checksum 0xc4408e52, Offset: 0x1000
    // Size: 0x1f0
    function private _movephalanxtier( robots, phalanxtype, tier, destination, forward )
    {
        positions = _getphalanxpositions( phalanxtype, tier );
        angles = vectortoangles( forward );
        assert( robots.size <= positions.size, "<dev string:x1da>" );
        
        foreach ( index, robot in robots )
        {
            if ( isdefined( robot ) && isalive( robot ) )
            {
                assert( isvec( positions[ index ] ), "<dev string:x21c>" + index + "<dev string:x24b>" + tier + "<dev string:x258>" + phalanxtype );
                orientedpos = _rotatevec( positions[ index ], angles[ 1 ] - 90 );
                navmeshposition = getclosestpointonnavmesh( destination + orientedpos, 200 );
                robot function_a57c34b7( navmeshposition );
            }
        }
    }

    // Namespace robotphalanx/robot_phalanx
    // Params 1, eflags: 0x4
    // Checksum 0x1be9282b, Offset: 0xf10
    // Size: 0xe4
    function private _initializerobot( robot )
    {
        assert( isactor( robot ) );
        robot ai::set_behavior_attribute( "phalanx", 1 );
        robot ai::set_behavior_attribute( "move_mode", "marching" );
        robot ai::set_behavior_attribute( "force_cover", 1 );
        robot setavoidancemask( "avoid none" );
        aiutility::addaioverridedamagecallback( robot, &_dampenexplosivedamage, 1 );
    }

    // Namespace robotphalanx/robot_phalanx
    // Params 1, eflags: 0x4
    // Checksum 0xeffcb851, Offset: 0xe28
    // Size: 0xe0
    function private _haltfire( robots )
    {
        assert( isarray( robots ) );
        
        foreach ( robot in robots )
        {
            if ( isdefined( robot ) && isalive( robot ) )
            {
                robot val::set( #"halt_fire", "ignoreall", 1 );
            }
        }
    }

    // Namespace robotphalanx/robot_phalanx
    // Params 1, eflags: 0x4
    // Checksum 0xf9f0e0bd, Offset: 0xcf8
    // Size: 0x128
    function private _haltadvance( robots )
    {
        assert( isarray( robots ) );
        
        foreach ( robot in robots )
        {
            if ( isdefined( robot ) && isalive( robot ) && robot haspath() )
            {
                navmeshposition = getclosestpointonnavmesh( robot.origin, 200 );
                robot function_a57c34b7( navmeshposition );
                robot clearpath();
            }
        }
    }

    // Namespace robotphalanx/robot_phalanx
    // Params 1, eflags: 0x4
    // Checksum 0x1fe66706, Offset: 0xc38
    // Size: 0xb4
    function private _getphalanxspawner( tier )
    {
        spawner = getspawnerarray( tier, "targetname" );
        assert( spawner.size >= 0, "<dev string:x6f>" + "<dev string:xbd>" + "<dev string:x107>" );
        assert( spawner.size == 1, "<dev string:x120>" + "<dev string:x16c>" + "<dev string:x194>" );
        return spawner[ 0 ];
    }

    // Namespace robotphalanx/robot_phalanx
    // Params 2, eflags: 0x4
    // Checksum 0x88cc2ad, Offset: 0x680
    // Size: 0x5ac
    function private _getphalanxpositions( phalanxtype, tier )
    {
        switch ( phalanxtype )
        {
            case #"phanalx_wedge":
                switch ( tier )
                {
                    case #"phalanx_tier1":
                        return array( ( 0, 0, 0 ), ( -64, -48, 0 ), ( 64, -48, 0 ), ( -128, -96, 0 ), ( 128, -96, 0 ) );
                    case #"phalanx_tier2":
                        return array( ( -32, -96, 0 ), ( 32, -96, 0 ) );
                    case #"phalanx_tier3":
                        return array();
                }
                
                break;
            case #"phalanx_diagonal_left":
                switch ( tier )
                {
                    case #"phalanx_tier1":
                        return array( ( 0, 0, 0 ), ( -48, -64, 0 ), ( -96, -128, 0 ), ( -144, -192, 0 ) );
                    case #"phalanx_tier2":
                        return array( ( 64, 0, 0 ), ( 16, -64, 0 ), ( -48, -128, 0 ), ( -112, -192, 0 ) );
                    case #"phalanx_tier3":
                        return array();
                }
                
                break;
            case #"phalanx_diagonal_right":
                switch ( tier )
                {
                    case #"phalanx_tier1":
                        return array( ( 0, 0, 0 ), ( 48, -64, 0 ), ( 96, -128, 0 ), ( 144, -192, 0 ) );
                    case #"phalanx_tier2":
                        return array( ( -64, 0, 0 ), ( -16, -64, 0 ), ( 48, -128, 0 ), ( 112, -192, 0 ) );
                    case #"phalanx_tier3":
                        return array();
                }
                
                break;
            case #"phalanx_forward":
                switch ( tier )
                {
                    case #"phalanx_tier1":
                        return array( ( 0, 0, 0 ), ( 64, 0, 0 ), ( 128, 0, 0 ), ( 192, 0, 0 ) );
                    case #"phalanx_tier2":
                        return array( ( -32, -64, 0 ), ( 32, -64, 0 ), ( 96, -64, 0 ), ( 160, -64, 0 ) );
                    case #"phalanx_tier3":
                        return array();
                }
                
                break;
            case #"phalanx_column":
                switch ( tier )
                {
                    case #"phalanx_tier1":
                        return array( ( 0, 0, 0 ), ( -64, 0, 0 ), ( 0, -64, 0 ), ( -64, -64, 0 ) );
                    case #"phalanx_tier2":
                        return array( ( 0, -128, 0 ), ( -64, -128, 0 ), ( 0, -192, 0 ), ( -64, -192, 0 ) );
                    case #"phalanx_tier3":
                        return array();
                }
                
                break;
            case #"phalanx_column_right":
                switch ( tier )
                {
                    case #"phalanx_tier1":
                        return array( ( 0, 0, 0 ), ( 0, -64, 0 ), ( 0, -128, 0 ), ( 0, -192, 0 ) );
                    case #"phalanx_tier2":
                        return array();
                    case #"phalanx_tier3":
                        return array();
                }
                
                break;
            default:
                assert( "<dev string:x38>" + phalanxtype + "<dev string:x51>" );
                break;
        }
        
        assert( "<dev string:x56>" + tier + "<dev string:x51>" );
    }

    // Namespace robotphalanx/robot_phalanx
    // Params 12, eflags: 0x4
    // Checksum 0x64c8212e, Offset: 0x4d0
    // Size: 0x1a8
    function private _dampenexplosivedamage( inflictor, attacker, damage, flags, meansofdamage, weapon, point, dir, hitloc, offsettime, boneindex, modelindex )
    {
        entity = self;
        isexplosive = isinarray( array( "MOD_GRENADE", "MOD_GRENADE_SPLASH", "MOD_PROJECTILE", "MOD_PROJECTILE_SPLASH", "MOD_EXPLOSIVE" ), meansofdamage );
        
        if ( isexplosive && isdefined( inflictor ) && isdefined( inflictor.weapon ) )
        {
            weapon = inflictor.weapon;
            distancetoentity = distance( entity.origin, inflictor.origin );
            fractiondistance = 1;
            
            if ( weapon.explosionradius > 0 )
            {
                fractiondistance = ( weapon.explosionradius - distancetoentity ) / weapon.explosionradius;
            }
            
            return int( max( damage * fractiondistance, 1 ) );
        }
        
        return damage;
    }

    // Namespace robotphalanx/robot_phalanx
    // Params 6, eflags: 0x4
    // Checksum 0x36f4747a, Offset: 0x2a0
    // Size: 0x224
    function private _createphalanxtier( phalanxtype, tier, phalanxposition, forward, maxtiersize, spawner = undefined )
    {
        robots = [];
        
        if ( !isspawner( spawner ) )
        {
            spawner = _getphalanxspawner( tier );
        }
        
        positions = _getphalanxpositions( phalanxtype, tier );
        angles = vectortoangles( forward );
        
        foreach ( index, position in positions )
        {
            if ( index >= maxtiersize )
            {
                break;
            }
            
            orientedpos = _rotatevec( position, angles[ 1 ] - 90 );
            navmeshposition = getclosestpointonnavmesh( phalanxposition + orientedpos, 200 );
            
            if ( !( spawner.spawnflags & 64 ) )
            {
                spawner.count++;
            }
            
            robot = spawner spawner::spawn( 1, "", navmeshposition, angles );
            
            if ( isalive( robot ) )
            {
                _initializerobot( robot );
                waitframe( 1 );
                robots[ robots.size ] = robot;
            }
        }
        
        return robots;
    }

    // Namespace robotphalanx/robot_phalanx
    // Params 2, eflags: 0x4
    // Checksum 0xe241323b, Offset: 0x1c0
    // Size: 0xd8
    function private _assignphalanxstance( robots, stance )
    {
        assert( isarray( robots ) );
        
        foreach ( robot in robots )
        {
            if ( isdefined( robot ) && isalive( robot ) )
            {
                robot ai::set_behavior_attribute( "phalanx_force_stance", stance );
            }
        }
    }

}

