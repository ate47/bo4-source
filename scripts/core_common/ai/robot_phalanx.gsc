// Atian COD Tools GSC decompiler test
#using scripts\core_common\values_shared.gsc;
#using script_3819e7a1427df6d2;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace robotphalanx;

// Namespace robotphalanx
// Method(s) 25 Total 25
class robotphalanx {

    // Namespace robotphalanx/robot_phalanx
    // Params 0, eflags: 0x9 linked
    // Checksum 0x4fc4c550, Offset: 0x16b8
    // Size: 0x56
    __constructor() {
        self.tier1robots_ = [];
        self.tier2robots_ = [];
        self.tier3robots_ = [];
        self.startrobotcount_ = 0;
        self.currentrobotcount_ = 0;
        self.breakingpoint_ = 0;
        self.scattered_ = 0;
    }

    // Namespace robotphalanx/robot_phalanx
    // Params 0, eflags: 0x11 linked
    // Checksum 0x80f724d1, Offset: 0x1718
    // Size: 0x4
    __destructor() {
        
    }

    // Namespace robotphalanx/robot_phalanx
    // Params 0, eflags: 0x1 linked
    // Checksum 0x47144607, Offset: 0x1d50
    // Size: 0xee
    function scatterphalanx() {
        if (!self.scattered_) {
            self.scattered_ = 1;
            _releaserobots(self.tier1robots_);
            self.tier1robots_ = [];
            _assignphalanxstance(self.tier2robots_, "crouch");
            wait(randomfloatrange(5, 7));
            _releaserobots(self.tier2robots_);
            self.tier2robots_ = [];
            _assignphalanxstance(self.tier3robots_, "crouch");
            wait(randomfloatrange(5, 7));
            _releaserobots(self.tier3robots_);
            self.tier3robots_ = [];
        }
    }

    // Namespace robotphalanx/robot_phalanx
    // Params 0, eflags: 0x1 linked
    // Checksum 0x8a9fce1e, Offset: 0x1cf8
    // Size: 0x4c
    function resumefire() {
        _resumefirerobots(self.tier1robots_);
        _resumefirerobots(self.tier2robots_);
        _resumefirerobots(self.tier3robots_);
    }

    // Namespace robotphalanx/robot_phalanx
    // Params 0, eflags: 0x1 linked
    // Checksum 0xc1aa3fed, Offset: 0x1bd8
    // Size: 0x114
    function resumeadvance() {
        if (!self.scattered_) {
            _assignphalanxstance(self.tier1robots_, "stand");
            wait(1);
            forward = vectornormalize(self.endposition_ - self.startposition_);
            _movephalanxtier(self.tier1robots_, self.phalanxtype_, "phalanx_tier1", self.endposition_, forward);
            _movephalanxtier(self.tier2robots_, self.phalanxtype_, "phalanx_tier2", self.endposition_, forward);
            _movephalanxtier(self.tier3robots_, self.phalanxtype_, "phalanx_tier3", self.endposition_, forward);
            _assignphalanxstance(self.tier1robots_, "crouch");
        }
    }

    // Namespace robotphalanx/robot_phalanx
    // Params 8, eflags: 0x1 linked
    // Checksum 0x31ade7c8, Offset: 0x18c0
    // Size: 0x30c
    function initialize(phalanxtype, origin, destination, breakingpoint, maxtiersize = 10, tieronespawner = undefined, tiertwospawner = undefined, tierthreespawner = undefined) {
        /#
            assert(isstring(phalanxtype));
        #/
        /#
            assert(isint(breakingpoint));
        #/
        /#
            assert(isvec(origin));
        #/
        /#
            assert(isvec(destination));
        #/
        maxtiersize = math::clamp(maxtiersize, 1, 10);
        forward = vectornormalize(destination - origin);
        self.tier1robots_ = _createphalanxtier(phalanxtype, "phalanx_tier1", origin, forward, maxtiersize, tieronespawner);
        self.tier2robots_ = _createphalanxtier(phalanxtype, "phalanx_tier2", origin, forward, maxtiersize, tiertwospawner);
        self.tier3robots_ = _createphalanxtier(phalanxtype, "phalanx_tier3", origin, forward, maxtiersize, tierthreespawner);
        _assignphalanxstance(self.tier1robots_, "crouch");
        _movephalanxtier(self.tier1robots_, phalanxtype, "phalanx_tier1", destination, forward);
        _movephalanxtier(self.tier2robots_, phalanxtype, "phalanx_tier2", destination, forward);
        _movephalanxtier(self.tier3robots_, phalanxtype, "phalanx_tier3", destination, forward);
        self.startrobotcount_ = self.tier1robots_.size + self.tier2robots_.size + self.tier3robots_.size;
        self.breakingpoint_ = breakingpoint;
        self.startposition_ = origin;
        self.endposition_ = destination;
        self.phalanxtype_ = phalanxtype;
        self thread _updatephalanxthread(self);
    }

    // Namespace robotphalanx/robot_phalanx
    // Params 0, eflags: 0x1 linked
    // Checksum 0x444f84a0, Offset: 0x1860
    // Size: 0x54
    function haltadvance() {
        if (!self.scattered_) {
            _haltadvance(self.tier1robots_);
            _haltadvance(self.tier2robots_);
            _haltadvance(self.tier3robots_);
        }
    }

    // Namespace robotphalanx/robot_phalanx
    // Params 0, eflags: 0x1 linked
    // Checksum 0xd2d527df, Offset: 0x1808
    // Size: 0x4c
    function haltfire() {
        _haltfire(self.tier1robots_);
        _haltfire(self.tier2robots_);
        _haltfire(self.tier3robots_);
    }

    // Namespace robotphalanx/robot_phalanx
    // Params 0, eflags: 0x5 linked
    // Checksum 0xcfc6d9e, Offset: 0x1728
    // Size: 0xd4
    function private _updatephalanx() {
        if (self.scattered_) {
            return 0;
        }
        self.tier1robots_ = _prunedead(self.tier1robots_);
        self.tier2robots_ = _prunedead(self.tier2robots_);
        self.tier3robots_ = _prunedead(self.tier3robots_);
        self.currentrobotcount_ = self.tier1robots_.size + self.tier2robots_.size + self.tier2robots_.size;
        if (self.currentrobotcount_ <= self.startrobotcount_ - self.breakingpoint_) {
            scatterphalanx();
            return 0;
        }
        return 1;
    }

    // Namespace robotphalanx/robot_phalanx
    // Params 1, eflags: 0x5 linked
    // Checksum 0xf8ab2132, Offset: 0x1688
    // Size: 0x28
    function private _updatephalanxthread(phalanx) {
        while ([[ phalanx ]]->_updatephalanx()) {
            wait(1);
        }
    }

    // Namespace robotphalanx/robot_phalanx
    // Params 2, eflags: 0x5 linked
    // Checksum 0x217ac43d, Offset: 0x15e0
    // Size: 0xa0
    function private _rotatevec(vector, angle) {
        return (vector[0] * cos(angle) - vector[1] * sin(angle), vector[0] * sin(angle) + vector[1] * cos(angle), vector[2]);
    }

    // Namespace robotphalanx/robot_phalanx
    // Params 1, eflags: 0x5 linked
    // Checksum 0xcb6b4ee6, Offset: 0x1530
    // Size: 0xa8
    function private _resumefirerobots(robots) {
        /#
            assert(isarray(robots));
        #/
        foreach (robot in robots) {
            _resumefire(robot);
        }
    }

    // Namespace robotphalanx/robot_phalanx
    // Params 1, eflags: 0x5 linked
    // Checksum 0x9e4b7894, Offset: 0x14c8
    // Size: 0x5c
    function private _resumefire(robot) {
        if (isdefined(robot) && isalive(robot)) {
            robot val::reset(#"halt_fire", "ignoreall");
        }
    }

    // Namespace robotphalanx/robot_phalanx
    // Params 1, eflags: 0x5 linked
    // Checksum 0x8f893952, Offset: 0x1408
    // Size: 0xb8
    function private _releaserobots(robots) {
        foreach (robot in robots) {
            _resumefire(robot);
            _releaserobot(robot);
            wait(randomfloatrange(0.5, 5));
        }
    }

    // Namespace robotphalanx/robot_phalanx
    // Params 1, eflags: 0x5 linked
    // Checksum 0x90d3c8c4, Offset: 0x12b0
    // Size: 0x14c
    function private _releaserobot(robot) {
        if (isdefined(robot) && isalive(robot)) {
            robot function_d4c687c9();
            robot pathmode("move delayed", 1, randomfloatrange(0.5, 1));
            robot ai::set_behavior_attribute("phalanx", 0);
            waitframe(1);
            if (isdefined(robot) && isalive(robot)) {
                robot ai::set_behavior_attribute("move_mode", "normal");
                robot ai::set_behavior_attribute("force_cover", 0);
                robot setavoidancemask("avoid all");
                aiutility::removeaioverridedamagecallback(robot, &_dampenexplosivedamage);
            }
        }
    }

    // Namespace robotphalanx/robot_phalanx
    // Params 1, eflags: 0x5 linked
    // Checksum 0x2b7d6a, Offset: 0x11f8
    // Size: 0xb0
    function private _prunedead(robots) {
        liverobots = [];
        foreach (index, robot in robots) {
            if (isdefined(robot) && isalive(robot)) {
                liverobots[index] = robot;
            }
        }
        return liverobots;
    }

    // Namespace robotphalanx/robot_phalanx
    // Params 5, eflags: 0x5 linked
    // Checksum 0xc4408e52, Offset: 0x1000
    // Size: 0x1f0
    function private _movephalanxtier(robots, phalanxtype, tier, destination, forward) {
        positions = _getphalanxpositions(phalanxtype, tier);
        angles = vectortoangles(forward);
        /#
            assert(robots.size <= positions.size, "<unknown string>");
        #/
        foreach (index, robot in robots) {
            if (isdefined(robot) && isalive(robot)) {
                /#
                    assert(isvec(positions[index]), "<unknown string>" + index + "<unknown string>" + tier + "<unknown string>" + phalanxtype);
                #/
                orientedpos = _rotatevec(positions[index], angles[1] - 90);
                navmeshposition = getclosestpointonnavmesh(destination + orientedpos, 200);
                robot function_a57c34b7(navmeshposition);
            }
        }
    }

    // Namespace robotphalanx/robot_phalanx
    // Params 1, eflags: 0x5 linked
    // Checksum 0x1be9282b, Offset: 0xf10
    // Size: 0xe4
    function private _initializerobot(robot) {
        /#
            assert(isactor(robot));
        #/
        robot ai::set_behavior_attribute("phalanx", 1);
        robot ai::set_behavior_attribute("move_mode", "marching");
        robot ai::set_behavior_attribute("force_cover", 1);
        robot setavoidancemask("avoid none");
        aiutility::addaioverridedamagecallback(robot, &_dampenexplosivedamage, 1);
    }

    // Namespace robotphalanx/robot_phalanx
    // Params 1, eflags: 0x5 linked
    // Checksum 0xeffcb851, Offset: 0xe28
    // Size: 0xe0
    function private _haltfire(robots) {
        /#
            assert(isarray(robots));
        #/
        foreach (robot in robots) {
            if (isdefined(robot) && isalive(robot)) {
                robot val::set(#"halt_fire", "ignoreall", 1);
            }
        }
    }

    // Namespace robotphalanx/robot_phalanx
    // Params 1, eflags: 0x5 linked
    // Checksum 0xf9f0e0bd, Offset: 0xcf8
    // Size: 0x128
    function private _haltadvance(robots) {
        /#
            assert(isarray(robots));
        #/
        foreach (robot in robots) {
            if (isdefined(robot) && isalive(robot) && robot haspath()) {
                navmeshposition = getclosestpointonnavmesh(robot.origin, 200);
                robot function_a57c34b7(navmeshposition);
                robot clearpath();
            }
        }
    }

    // Namespace robotphalanx/robot_phalanx
    // Params 1, eflags: 0x5 linked
    // Checksum 0x1fe66706, Offset: 0xc38
    // Size: 0xb4
    function private _getphalanxspawner(tier) {
        spawner = getspawnerarray(tier, "targetname");
        /#
            assert(spawner.size >= 0, "<unknown string>" + "<unknown string>" + "<unknown string>");
        #/
        /#
            assert(spawner.size == 1, "<unknown string>" + "<unknown string>" + "<unknown string>");
        #/
        return spawner[0];
    }

    // Namespace robotphalanx/robot_phalanx
    // Params 2, eflags: 0x5 linked
    // Checksum 0x88cc2ad, Offset: 0x680
    // Size: 0x5ac
    function private _getphalanxpositions(phalanxtype, tier) {
        switch (phalanxtype) {
        case #"phanalx_wedge":
            switch (tier) {
            case #"phalanx_tier1":
                return array((0, 0, 0), (-64, -48, 0), (64, -48, 0), (-128, -96, 0), (128, -96, 0));
            case #"phalanx_tier2":
                return array((-32, -96, 0), (32, -96, 0));
            case #"phalanx_tier3":
                return array();
            }
            break;
        case #"phalanx_diagonal_left":
            switch (tier) {
            case #"phalanx_tier1":
                return array((0, 0, 0), (-48, -64, 0), (-96, -128, 0), (-144, -192, 0));
            case #"phalanx_tier2":
                return array(vectorscale((1, 0, 0), 64), (16, -64, 0), (-48, -128, 0), (-112, -192, 0));
            case #"phalanx_tier3":
                return array();
            }
            break;
        case #"phalanx_diagonal_right":
            switch (tier) {
            case #"phalanx_tier1":
                return array((0, 0, 0), (48, -64, 0), (96, -128, 0), (144, -192, 0));
            case #"phalanx_tier2":
                return array(vectorscale((-1, 0, 0), 64), (-16, -64, 0), (48, -128, 0), (112, -192, 0));
            case #"phalanx_tier3":
                return array();
            }
            break;
        case #"phalanx_forward":
            switch (tier) {
            case #"phalanx_tier1":
                return array((0, 0, 0), vectorscale((1, 0, 0), 64), vectorscale((1, 0, 0), 128), vectorscale((1, 0, 0), 192));
            case #"phalanx_tier2":
                return array((-32, -64, 0), (32, -64, 0), (96, -64, 0), (160, -64, 0));
            case #"phalanx_tier3":
                return array();
            }
            break;
        case #"phalanx_column":
            switch (tier) {
            case #"phalanx_tier1":
                return array((0, 0, 0), vectorscale((-1, 0, 0), 64), vectorscale((0, -1, 0), 64), vectorscale((-1, -1, 0), 64));
            case #"phalanx_tier2":
                return array(vectorscale((0, -1, 0), 128), (-64, -128, 0), vectorscale((0, -1, 0), 192), (-64, -192, 0));
            case #"phalanx_tier3":
                return array();
            }
            break;
        case #"phalanx_column_right":
            switch (tier) {
            case #"phalanx_tier1":
                return array((0, 0, 0), vectorscale((0, -1, 0), 64), vectorscale((0, -1, 0), 128), vectorscale((0, -1, 0), 192));
            case #"phalanx_tier2":
                return array();
            case #"phalanx_tier3":
                return array();
            }
            break;
        default:
            /#
                assert("<unknown string>" + phalanxtype + "<unknown string>");
            #/
            break;
        }
        /#
            assert("<unknown string>" + tier + "<unknown string>");
        #/
    }

    // Namespace robotphalanx/robot_phalanx
    // Params 12, eflags: 0x5 linked
    // Checksum 0x64c8212e, Offset: 0x4d0
    // Size: 0x1a8
    function private _dampenexplosivedamage(inflictor, attacker, damage, flags, meansofdamage, weapon, point, dir, hitloc, offsettime, boneindex, modelindex) {
        entity = self;
        isexplosive = isinarray(array("MOD_GRENADE", "MOD_GRENADE_SPLASH", "MOD_PROJECTILE", "MOD_PROJECTILE_SPLASH", "MOD_EXPLOSIVE"), meansofdamage);
        if (isexplosive && isdefined(inflictor) && isdefined(inflictor.weapon)) {
            weapon = inflictor.weapon;
            distancetoentity = distance(entity.origin, inflictor.origin);
            fractiondistance = 1;
            if (weapon.explosionradius > 0) {
                fractiondistance = (weapon.explosionradius - distancetoentity) / weapon.explosionradius;
            }
            return int(max(damage * fractiondistance, 1));
        }
        return damage;
    }

    // Namespace robotphalanx/robot_phalanx
    // Params 6, eflags: 0x5 linked
    // Checksum 0x36f4747a, Offset: 0x2a0
    // Size: 0x224
    function private _createphalanxtier(phalanxtype, tier, phalanxposition, forward, maxtiersize, spawner = undefined) {
        robots = [];
        if (!isspawner(spawner)) {
            spawner = _getphalanxspawner(tier);
        }
        positions = _getphalanxpositions(phalanxtype, tier);
        angles = vectortoangles(forward);
        foreach (index, position in positions) {
            if (index >= maxtiersize) {
                break;
            }
            orientedpos = _rotatevec(position, angles[1] - 90);
            navmeshposition = getclosestpointonnavmesh(phalanxposition + orientedpos, 200);
            if (!(spawner.spawnflags & 64)) {
                spawner.count++;
            }
            robot = spawner spawner::spawn(1, "", navmeshposition, angles);
            if (isalive(robot)) {
                _initializerobot(robot);
                waitframe(1);
                robots[robots.size] = robot;
            }
        }
        return robots;
    }

    // Namespace robotphalanx/robot_phalanx
    // Params 2, eflags: 0x5 linked
    // Checksum 0xe241323b, Offset: 0x1c0
    // Size: 0xd8
    function private _assignphalanxstance(robots, stance) {
        /#
            assert(isarray(robots));
        #/
        foreach (robot in robots) {
            if (isdefined(robot) && isalive(robot)) {
                robot ai::set_behavior_attribute("phalanx_force_stance", stance);
            }
        }
    }

}

