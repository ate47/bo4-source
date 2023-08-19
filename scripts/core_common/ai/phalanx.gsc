// Atian COD Tools GSC decompiler test
#include scripts/core_common/values_shared.gsc;
#include script_3819e7a1427df6d2;
#include scripts/core_common/spawner_shared.gsc;
#include scripts/core_common/math_shared.gsc;
#include scripts/core_common/ai_shared.gsc;

#namespace phalanx;

// Namespace phalanx
// Method(s) 25 Total 25
class phalanx {

    // Namespace phalanx/phalanx
    // Params 0, eflags: 0x9 linked
    // Checksum 0x36406d06, Offset: 0x1808
    // Size: 0x3e
    __constructor() {
        self.sentienttiers_ = [];
        self.startsentientcount_ = 0;
        self.currentsentientcount_ = 0;
        self.breakingpoint_ = 0;
        self.scattered_ = 0;
    }

    // Namespace phalanx/phalanx
    // Params 0, eflags: 0x11 linked
    // Checksum 0x80f724d1, Offset: 0x1850
    // Size: 0x4
    __destructor() {
        
    }

    // Namespace phalanx/phalanx
    // Params 0, eflags: 0x1 linked
    // Checksum 0x3e02a0e1, Offset: 0x2030
    // Size: 0x16e
    function scatterphalanx() {
        if (!self.scattered_) {
            self.scattered_ = 1;
            _releasesentients(self.sentienttiers_[#"phalanx_tier1"]);
            self.sentienttiers_[#"phalanx_tier1"] = [];
            _assignphalanxstance(self.sentienttiers_[#"phalanx_tier2"], "crouch");
            wait(randomfloatrange(5, 7));
            _releasesentients(self.sentienttiers_[#"phalanx_tier2"]);
            self.sentienttiers_[#"phalanx_tier2"] = [];
            _assignphalanxstance(self.sentienttiers_[#"phalanx_tier3"], "crouch");
            wait(randomfloatrange(5, 7));
            _releasesentients(self.sentienttiers_[#"phalanx_tier3"]);
            self.sentienttiers_[#"phalanx_tier3"] = [];
        }
    }

    // Namespace phalanx/phalanx
    // Params 0, eflags: 0x1 linked
    // Checksum 0xd913b723, Offset: 0x1fa8
    // Size: 0x7c
    function resumefire() {
        _resumefiresentients(self.sentienttiers_[#"phalanx_tier1"]);
        _resumefiresentients(self.sentienttiers_[#"phalanx_tier2"]);
        _resumefiresentients(self.sentienttiers_[#"phalanx_tier3"]);
    }

    // Namespace phalanx/phalanx
    // Params 0, eflags: 0x1 linked
    // Checksum 0x6f9108e1, Offset: 0x1e38
    // Size: 0x164
    function resumeadvance() {
        if (!self.scattered_) {
            _assignphalanxstance(self.sentienttiers_[#"phalanx_tier1"], "stand");
            wait(1);
            forward = vectornormalize(self.endposition_ - self.startposition_);
            _movephalanxtier(self.sentienttiers_[#"phalanx_tier1"], self.phalanxtype_, "phalanx_tier1", self.endposition_, forward);
            _movephalanxtier(self.sentienttiers_[#"phalanx_tier2"], self.phalanxtype_, "phalanx_tier2", self.endposition_, forward);
            _movephalanxtier(self.sentienttiers_[#"phalanx_tier3"], self.phalanxtype_, "phalanx_tier3", self.endposition_, forward);
            _assignphalanxstance(self.sentienttiers_[#"phalanx_tier1"], "crouch");
        }
    }

    // Namespace phalanx/phalanx
    // Params 8, eflags: 0x1 linked
    // Checksum 0xf75842c4, Offset: 0x1a80
    // Size: 0x3ac
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
        tierspawners = [];
        tierspawners[#"phalanx_tier1"] = tieronespawner;
        tierspawners[#"phalanx_tier2"] = tiertwospawner;
        tierspawners[#"phalanx_tier3"] = tierthreespawner;
        maxtiersize = math::clamp(maxtiersize, 1, 10);
        forward = vectornormalize(destination - origin);
        foreach (tiername in array("phalanx_tier1", "phalanx_tier2", "phalanx_tier3")) {
            self.sentienttiers_[tiername] = _createphalanxtier(phalanxtype, tiername, origin, forward, maxtiersize, tierspawners[tiername]);
            self.startsentientcount_ = self.startsentientcount_ + self.sentienttiers_[tiername].size;
        }
        _assignphalanxstance(self.sentienttiers_[#"phalanx_tier1"], "crouch");
        foreach (name, tier in self.sentienttiers_) {
            _movephalanxtier(self.sentienttiers_[name], phalanxtype, name, destination, forward);
        }
        self.breakingpoint_ = breakingpoint;
        self.startposition_ = origin;
        self.endposition_ = destination;
        self.phalanxtype_ = phalanxtype;
        self thread _updatephalanxthread(self);
    }

    // Namespace phalanx/phalanx
    // Params 0, eflags: 0x1 linked
    // Checksum 0x9731c670, Offset: 0x19f0
    // Size: 0x88
    function haltadvance() {
        if (!self.scattered_) {
            foreach (tier in self.sentienttiers_) {
                _haltadvance(tier);
            }
        }
    }

    // Namespace phalanx/phalanx
    // Params 0, eflags: 0x1 linked
    // Checksum 0x4b37dace, Offset: 0x1970
    // Size: 0x78
    function haltfire() {
        foreach (tier in self.sentienttiers_) {
            _haltfire(tier);
        }
    }

    // Namespace phalanx/phalanx
    // Params 0, eflags: 0x5 linked
    // Checksum 0x539817b8, Offset: 0x1860
    // Size: 0x104
    function private _updatephalanx() {
        if (self.scattered_) {
            return 0;
        }
        self.currentsentientcount_ = 0;
        foreach (name, tier in self.sentienttiers_) {
            self.sentienttiers_[name] = _prunedead(tier);
            self.currentsentientcount_ = self.currentsentientcount_ + self.sentienttiers_[name].size;
        }
        if (self.currentsentientcount_ <= self.startsentientcount_ - self.breakingpoint_) {
            scatterphalanx();
            return 0;
        }
        return 1;
    }

    // Namespace phalanx/phalanx
    // Params 1, eflags: 0x5 linked
    // Checksum 0xfd7d8fc0, Offset: 0x17d8
    // Size: 0x28
    function private _updatephalanxthread(phalanx) {
        while ([[ phalanx ]]->_updatephalanx()) {
            wait(1);
        }
    }

    // Namespace phalanx/phalanx
    // Params 2, eflags: 0x5 linked
    // Checksum 0x16b04115, Offset: 0x1730
    // Size: 0xa0
    function private _rotatevec(vector, angle) {
        return (vector[0] * cos(angle) - vector[1] * sin(angle), vector[0] * sin(angle) + vector[1] * cos(angle), vector[2]);
    }

    // Namespace phalanx/phalanx
    // Params 1, eflags: 0x5 linked
    // Checksum 0x3772c226, Offset: 0x1680
    // Size: 0xa8
    function private _resumefiresentients(sentients) {
        /#
            assert(isarray(sentients));
        #/
        foreach (sentient in sentients) {
            _resumefire(sentient);
        }
    }

    // Namespace phalanx/phalanx
    // Params 1, eflags: 0x5 linked
    // Checksum 0xf229214, Offset: 0x1618
    // Size: 0x5c
    function private _resumefire(sentient) {
        if (isdefined(sentient) && isalive(sentient)) {
            sentient val::reset(#"halt_fire", "ignoreall");
        }
    }

    // Namespace phalanx/phalanx
    // Params 1, eflags: 0x5 linked
    // Checksum 0xc9a76873, Offset: 0x1558
    // Size: 0xb8
    function private _releasesentients(sentients) {
        foreach (sentient in sentients) {
            _resumefire(sentient);
            _releasesentient(sentient);
            wait(randomfloatrange(0.5, 5));
        }
    }

    // Namespace phalanx/phalanx
    // Params 1, eflags: 0x5 linked
    // Checksum 0xfe256363, Offset: 0x13d0
    // Size: 0x17c
    function private _releasesentient(sentient) {
        if (isdefined(sentient) && isalive(sentient)) {
            sentient function_d4c687c9();
            sentient pathmode("move delayed", 1, randomfloatrange(0.5, 1));
            sentient ai::set_behavior_attribute("phalanx", 0);
            waitframe(1);
            if (sentient.archetype === "human") {
                sentient.allowpain = 1;
            }
            sentient setavoidancemask("avoid all");
            aiutility::removeaioverridedamagecallback(sentient, &_dampenexplosivedamage);
            if (isdefined(sentient.archetype) && sentient.archetype == #"robot") {
                sentient ai::set_behavior_attribute("move_mode", "normal");
                sentient ai::set_behavior_attribute("force_cover", 0);
            }
        }
    }

    // Namespace phalanx/phalanx
    // Params 1, eflags: 0x5 linked
    // Checksum 0xf0e1faf3, Offset: 0x1318
    // Size: 0xb0
    function private _prunedead(sentients) {
        livesentients = [];
        foreach (index, sentient in sentients) {
            if (isdefined(sentient) && isalive(sentient)) {
                livesentients[index] = sentient;
            }
        }
        return livesentients;
    }

    // Namespace phalanx/phalanx
    // Params 5, eflags: 0x5 linked
    // Checksum 0x7d596dad, Offset: 0x1120
    // Size: 0x1f0
    function private _movephalanxtier(sentients, phalanxtype, tier, destination, forward) {
        positions = _getphalanxpositions(phalanxtype, tier);
        angles = vectortoangles(forward);
        /#
            assert(sentients.size <= positions.size, "<unknown string>");
        #/
        foreach (index, sentient in sentients) {
            if (isdefined(sentient) && isalive(sentient)) {
                /#
                    assert(isvec(positions[index]), "<unknown string>" + index + "<unknown string>" + tier + "<unknown string>" + phalanxtype);
                #/
                orientedpos = _rotatevec(positions[index], angles[1] - 90);
                navmeshposition = getclosestpointonnavmesh(destination + orientedpos, 200);
                sentient function_a57c34b7(navmeshposition);
            }
        }
    }

    // Namespace phalanx/phalanx
    // Params 1, eflags: 0x1 linked
    // Checksum 0x7cfacdce, Offset: 0xfe8
    // Size: 0x12c
    function _initializesentient(sentient) {
        /#
            assert(isactor(sentient));
        #/
        sentient ai::set_behavior_attribute("phalanx", 1);
        if (sentient.archetype === "human") {
            sentient.allowpain = 0;
        }
        sentient setavoidancemask("avoid none");
        if (isdefined(sentient.archetype) && sentient.archetype == #"robot") {
            sentient ai::set_behavior_attribute("move_mode", "marching");
            sentient ai::set_behavior_attribute("force_cover", 1);
        }
        aiutility::addaioverridedamagecallback(sentient, &_dampenexplosivedamage, 1);
    }

    // Namespace phalanx/phalanx
    // Params 1, eflags: 0x5 linked
    // Checksum 0xd27fd086, Offset: 0xf00
    // Size: 0xe0
    function private _haltfire(sentients) {
        /#
            assert(isarray(sentients));
        #/
        foreach (sentient in sentients) {
            if (isdefined(sentient) && isalive(sentient)) {
                sentient val::set(#"halt_fire", "ignoreall", 1);
            }
        }
    }

    // Namespace phalanx/phalanx
    // Params 1, eflags: 0x5 linked
    // Checksum 0x62d2ccb2, Offset: 0xdd0
    // Size: 0x128
    function private _haltadvance(sentients) {
        /#
            assert(isarray(sentients));
        #/
        foreach (sentient in sentients) {
            if (isdefined(sentient) && isalive(sentient) && sentient haspath()) {
                navmeshposition = getclosestpointonnavmesh(sentient.origin, 200);
                sentient function_a57c34b7(navmeshposition);
                sentient clearpath();
            }
        }
    }

    // Namespace phalanx/phalanx
    // Params 1, eflags: 0x5 linked
    // Checksum 0xafd0c403, Offset: 0xd10
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

    // Namespace phalanx/phalanx
    // Params 2, eflags: 0x5 linked
    // Checksum 0x3270501, Offset: 0x670
    // Size: 0x694
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
                break;
            }
            break;
        case #"phalanx_reverse_wedge":
            switch (tier) {
            case #"phalanx_tier1":
                return array(vectorscale((-1, 0, 0), 32), vectorscale((1, 0, 0), 32));
            case #"phalanx_tier2":
                return array(vectorscale((0, -1, 0), 96));
            case #"phalanx_tier3":
                return array();
                break;
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
                break;
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
                break;
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
                break;
            }
            break;
        case #"phalanx_column":
            switch (tier) {
            case #"phalanx_tier1":
                return array((0, 0, 0), vectorscale((-1, 0, 0), 64), vectorscale((0, -1, 0), 64), vectorscale((-1, -1, 0), 64));
            case #"phalanx_tier2":
                return array(vectorscale((0, -1, 0), 128), (-64, -128, 0), vectorscale((0, -1, 0), 192), (-64, -192, 0));
            case #"phalanx_tier3":
                return array(vectorscale((1, 0, 0), 64), vectorscale((1, -1, 0), 64), (64, -128, 0), (64, -192, 0));
                break;
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
                break;
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

    // Namespace phalanx/phalanx
    // Params 12, eflags: 0x5 linked
    // Checksum 0x2c6ac81b, Offset: 0x4c0
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

    // Namespace phalanx/phalanx
    // Params 6, eflags: 0x5 linked
    // Checksum 0x1d4aa6a8, Offset: 0x2a8
    // Size: 0x20c
    function private _createphalanxtier(phalanxtype, tier, phalanxposition, forward, maxtiersize, spawner = undefined) {
        sentients = [];
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
            sentient = spawner spawner::spawn(1, "", navmeshposition, angles);
            _initializesentient(sentient);
            waitframe(1);
            sentients[sentients.size] = sentient;
        }
        return sentients;
    }

    // Namespace phalanx/phalanx
    // Params 2, eflags: 0x5 linked
    // Checksum 0x3296af38, Offset: 0x1c8
    // Size: 0xd8
    function private _assignphalanxstance(sentients, stance) {
        /#
            assert(isarray(sentients));
        #/
        foreach (sentient in sentients) {
            if (isdefined(sentient) && isalive(sentient)) {
                sentient ai::set_behavior_attribute("phalanx_force_stance", stance);
            }
        }
    }

}

