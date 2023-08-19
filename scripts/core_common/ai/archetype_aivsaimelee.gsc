// Atian COD Tools GSC decompiler test
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/array_shared.gsc;
#include scripts/core_common/ai/archetype_utility.gsc;
#include script_3aa0f32b70d4f7cb;
#include scripts/core_common/ai_shared.gsc;
#include scripts/core_common/struct.gsc;

#namespace archetype_aivsaimelee;

// Namespace archetype_aivsaimelee/archetype_aivsaimelee
// Params 0, eflags: 0x2
// Checksum 0xde8132c4, Offset: 0x1e0
// Size: 0x21c
function autoexec main() {
    meleebundles = struct::get_script_bundles("aiassassination");
    level._aivsai_meleebundles = [];
    foreach (meleebundle in meleebundles) {
        attacker_archetype = meleebundle.attackerarchetype;
        defender_archetype = meleebundle.defenderarchetype;
        attacker_variant = meleebundle.attackervariant;
        defender_variant = meleebundle.defendervariant;
        if (!isdefined(level._aivsai_meleebundles[attacker_archetype])) {
            level._aivsai_meleebundles[attacker_archetype] = [];
            level._aivsai_meleebundles[attacker_archetype][defender_archetype] = [];
            level._aivsai_meleebundles[attacker_archetype][defender_archetype][attacker_variant] = [];
        } else if (!isdefined(level._aivsai_meleebundles[attacker_archetype][defender_archetype])) {
            level._aivsai_meleebundles[attacker_archetype][defender_archetype] = [];
            level._aivsai_meleebundles[attacker_archetype][defender_archetype][attacker_variant] = [];
        } else if (!isdefined(level._aivsai_meleebundles[attacker_archetype][defender_archetype][attacker_variant])) {
            level._aivsai_meleebundles[attacker_archetype][defender_archetype][attacker_variant] = [];
        }
        level._aivsai_meleebundles[attacker_archetype][defender_archetype][attacker_variant][defender_variant] = meleebundle;
    }
}

// Namespace archetype_aivsaimelee/archetype_aivsaimelee
// Params 0, eflags: 0x1 linked
// Checksum 0x78f66cab, Offset: 0x408
// Size: 0x3d4
function registeraivsaimeleebehaviorfunctions() {
    /#
        assert(isscriptfunctionptr(&hasaivsaienemy));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hasaivsaienemy", &hasaivsaienemy);
    /#
        assert(isscriptfunctionptr(&decideinitiator));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"decideinitiator", &decideinitiator);
    /#
        assert(isscriptfunctionptr(&isinitiator));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"isinitiator", &isinitiator);
    /#
        assert(isscriptfunctionptr(&hascloseaivsaienemy));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hascloseaivsaienemy", &hascloseaivsaienemy);
    /#
        assert(isscriptfunctionptr(&chooseaivsaimeleeanimations));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"chooseaivsaimeleeanimations", &chooseaivsaimeleeanimations);
    /#
        assert(isscriptfunctionptr(&iscloseenoughforaivsaimelee));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"iscloseenoughforaivsaimelee", &iscloseenoughforaivsaimelee);
    /#
        assert(isscriptfunctionptr(&haspotentalaivsaimeleeenemy));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"haspotentalaivsaimeleeenemy", &haspotentalaivsaimeleeenemy);
    /#
        assert(!isdefined(&aivsaimeleeinitialize) || isscriptfunctionptr(&aivsaimeleeinitialize));
    #/
    /#
        assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
    #/
    /#
        assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
    #/
    behaviortreenetworkutility::registerbehaviortreeaction(#"aivsaimeleeaction", &aivsaimeleeinitialize, undefined, undefined);
}

// Namespace archetype_aivsaimelee/archetype_aivsaimelee
// Params 1, eflags: 0x1 linked
// Checksum 0xe4455b2b, Offset: 0x7e8
// Size: 0x5e
function haspotentalaivsaimeleeenemy(behaviortreeentity) {
    if (!hasaivsaienemy(behaviortreeentity)) {
        return 0;
    }
    if (!chooseaivsaimeleeanimations(behaviortreeentity)) {
        return 0;
    }
    if (!hascloseaivsaienemy(behaviortreeentity)) {
        return 1;
    }
    return 0;
}

// Namespace archetype_aivsaimelee/archetype_aivsaimelee
// Params 1, eflags: 0x1 linked
// Checksum 0xfaca1ff0, Offset: 0x850
// Size: 0x5e
function iscloseenoughforaivsaimelee(behaviortreeentity) {
    if (!hasaivsaienemy(behaviortreeentity)) {
        return 0;
    }
    if (!chooseaivsaimeleeanimations(behaviortreeentity)) {
        return 0;
    }
    if (!hascloseaivsaienemy(behaviortreeentity)) {
        return 0;
    }
    return 1;
}

// Namespace archetype_aivsaimelee/archetype_aivsaimelee
// Params 1, eflags: 0x5 linked
// Checksum 0xde6c1d06, Offset: 0x8b8
// Size: 0xb2
function private shouldaquiremutexonenemyforaivsaimelee(behaviortreeentity) {
    if (isplayer(behaviortreeentity.enemy)) {
        return 0;
    }
    if (!isdefined(behaviortreeentity.enemy)) {
        return 0;
    }
    if (isdefined(behaviortreeentity.meleeenemy) && behaviortreeentity.meleeenemy == behaviortreeentity.enemy) {
        return 1;
    }
    if (isdefined(behaviortreeentity.enemy.meleeenemy) && behaviortreeentity.enemy.meleeenemy != behaviortreeentity) {
        return 0;
    }
    return 1;
}

// Namespace archetype_aivsaimelee/archetype_aivsaimelee
// Params 1, eflags: 0x5 linked
// Checksum 0xedd52403, Offset: 0x978
// Size: 0xb5c
function private hasaivsaienemy(behaviortreeentity) {
    enemy = behaviortreeentity.enemy;
    if (getdvarint(#"disable_aivsai_melee", 0)) {
        /#
            record3dtext("<unknown string>", behaviortreeentity.origin, (1, 0.5, 0), "<unknown string>", behaviortreeentity, 0.4);
        #/
        return 0;
    }
    if (!isdefined(enemy)) {
        /#
            record3dtext("<unknown string>", behaviortreeentity.origin, (1, 0.5, 0), "<unknown string>", behaviortreeentity, 0.4);
        #/
        return 0;
    }
    if (!(isalive(behaviortreeentity) && isalive(enemy))) {
        /#
            record3dtext("<unknown string>", behaviortreeentity.origin, (1, 0.5, 0), "<unknown string>", behaviortreeentity, 0.4);
        #/
        return 0;
    }
    if (!isai(enemy) || !isactor(enemy)) {
        /#
            record3dtext("<unknown string>", behaviortreeentity.origin, (1, 0.5, 0), "<unknown string>", behaviortreeentity, 0.4);
        #/
        return 0;
    }
    if (isdefined(enemy.archetype)) {
        if (enemy.archetype != #"human" && enemy.archetype != #"human_riotshield" && enemy.archetype != #"robot") {
            /#
                record3dtext("<unknown string>", behaviortreeentity.origin, (1, 0.5, 0), "<unknown string>", behaviortreeentity, 0.4);
            #/
            return 0;
        }
    }
    if (enemy.team == behaviortreeentity.team) {
        /#
            record3dtext("<unknown string>", behaviortreeentity.origin, (1, 0.5, 0), "<unknown string>", behaviortreeentity, 0.4);
        #/
        return 0;
    }
    if (enemy isragdoll()) {
        /#
            record3dtext("<unknown string>", behaviortreeentity.origin, (1, 0.5, 0), "<unknown string>", behaviortreeentity, 0.4);
        #/
        return 0;
    }
    if (isdefined(enemy.ignoreme) && enemy.ignoreme) {
        /#
            record3dtext("<unknown string>", behaviortreeentity.origin, (1, 0.5, 0), "<unknown string>", behaviortreeentity, 0.4);
        #/
        return 0;
    }
    if (isdefined(enemy._ai_melee_markeddead) && enemy._ai_melee_markeddead) {
        /#
            record3dtext("<unknown string>", behaviortreeentity.origin, (1, 0.5, 0), "<unknown string>", behaviortreeentity, 0.4);
        #/
        return 0;
    }
    if (behaviortreeentity ai::has_behavior_attribute("can_initiateaivsaimelee") && !behaviortreeentity ai::get_behavior_attribute("can_initiateaivsaimelee")) {
        /#
            record3dtext("<unknown string>", behaviortreeentity.origin, (1, 0.5, 0), "<unknown string>", behaviortreeentity, 0.4);
        #/
        return 0;
    }
    if (behaviortreeentity ai::has_behavior_attribute("can_melee") && !behaviortreeentity ai::get_behavior_attribute("can_melee")) {
        /#
            record3dtext("<unknown string>", behaviortreeentity.origin, (1, 0.5, 0), "<unknown string>", behaviortreeentity, 0.4);
        #/
        return 0;
    }
    if (enemy ai::has_behavior_attribute("can_be_meleed") && !enemy ai::get_behavior_attribute("can_be_meleed")) {
        /#
            record3dtext("<unknown string>", behaviortreeentity.origin, (1, 0.5, 0), "<unknown string>", behaviortreeentity, 0.4);
        #/
        return 0;
    }
    if (distance2dsquared(behaviortreeentity.origin, enemy.origin) > 22500) {
        /#
            record3dtext("<unknown string>", behaviortreeentity.origin, (1, 0.5, 0), "<unknown string>", behaviortreeentity, 0.4);
        #/
        behaviortreeentity._ai_melee_initiator = undefined;
        return 0;
    }
    forwardvec = vectornormalize(anglestoforward(behaviortreeentity.angles));
    rightvec = vectornormalize(anglestoright(behaviortreeentity.angles));
    toenemyvec = vectornormalize(enemy.origin - behaviortreeentity.origin);
    fdot = vectordot(toenemyvec, forwardvec);
    if (fdot < 0) {
        /#
            record3dtext("<unknown string>", behaviortreeentity.origin, (1, 0.5, 0), "<unknown string>", behaviortreeentity, 0.4);
        #/
        return 0;
    }
    if (enemy isinscriptedstate()) {
        /#
            record3dtext("<unknown string>", behaviortreeentity.origin, (1, 0.5, 0), "<unknown string>", behaviortreeentity, 0.4);
        #/
        return 0;
    }
    currentstance = behaviortreeentity getblackboardattribute("_stance");
    enemystance = enemy getblackboardattribute("_stance");
    if (currentstance != "stand" || enemystance != "stand") {
        /#
            record3dtext("<unknown string>", behaviortreeentity.origin, (1, 0.5, 0), "<unknown string>", behaviortreeentity, 0.4);
        #/
        return 0;
    }
    if (!shouldaquiremutexonenemyforaivsaimelee(behaviortreeentity)) {
        /#
            record3dtext("<unknown string>", behaviortreeentity.origin, (1, 0.5, 0), "<unknown string>", behaviortreeentity, 0.4);
        #/
        return 0;
    }
    if (abs(behaviortreeentity.origin[2] - behaviortreeentity.enemy.origin[2]) > 16) {
        /#
            record3dtext("<unknown string>", behaviortreeentity.origin, (1, 0.5, 0), "<unknown string>", behaviortreeentity, 0.4);
        #/
        return 0;
    }
    raisedenemyentorigin = (behaviortreeentity.enemy.origin[0], behaviortreeentity.enemy.origin[1], behaviortreeentity.enemy.origin[2] + 8);
    if (!behaviortreeentity maymovetopoint(raisedenemyentorigin, 0, 1, behaviortreeentity.enemy)) {
        /#
            record3dtext("<unknown string>", behaviortreeentity.origin, (1, 0.5, 0), "<unknown string>", behaviortreeentity, 0.4);
        #/
        return 0;
    }
    if (isdefined(enemy.allowdeath) && !enemy.allowdeath) {
        if (isdefined(behaviortreeentity.allowdeath) && !behaviortreeentity.allowdeath) {
            /#
                record3dtext("<unknown string>", behaviortreeentity.origin, (1, 0.5, 0), "<unknown string>", behaviortreeentity, 0.4);
            #/
            self notify(#"failed_melee_mbs", {#entity:enemy});
            return 0;
        }
        behaviortreeentity._ai_melee_attacker_loser = 1;
        return 1;
    }
    return 1;
}

// Namespace archetype_aivsaimelee/archetype_aivsaimelee
// Params 1, eflags: 0x5 linked
// Checksum 0x6f901994, Offset: 0x14e0
// Size: 0x4a
function private decideinitiator(behaviortreeentity) {
    if (!isdefined(behaviortreeentity._ai_melee_initiator)) {
        if (!isdefined(behaviortreeentity.enemy._ai_melee_initiator)) {
            behaviortreeentity._ai_melee_initiator = 1;
            return 1;
        }
    }
    return 0;
}

// Namespace archetype_aivsaimelee/archetype_aivsaimelee
// Params 1, eflags: 0x5 linked
// Checksum 0xd04018a6, Offset: 0x1538
// Size: 0x34
function private isinitiator(behaviortreeentity) {
    if (!(isdefined(behaviortreeentity._ai_melee_initiator) && behaviortreeentity._ai_melee_initiator)) {
        return 0;
    }
    return 1;
}

// Namespace archetype_aivsaimelee/archetype_aivsaimelee
// Params 1, eflags: 0x5 linked
// Checksum 0x34802736, Offset: 0x1578
// Size: 0x3b4
function private hascloseaivsaienemy(behaviortreeentity) {
    if (!(isdefined(behaviortreeentity._ai_melee_animname) && isdefined(behaviortreeentity.enemy._ai_melee_animname))) {
        /#
            record3dtext("<unknown string>", behaviortreeentity.origin, (1, 0.5, 0), "<unknown string>", behaviortreeentity, 0.4);
        #/
        return 0;
    }
    animationstartorigin = getstartorigin(behaviortreeentity.enemy gettagorigin("tag_sync"), behaviortreeentity.enemy gettagangles("tag_sync"), behaviortreeentity._ai_melee_animname);
    /#
        record3dtext("<unknown string>" + sqrt(900), behaviortreeentity.origin, (1, 0.5, 0), "<unknown string>", behaviortreeentity, 0.4);
        record3dtext("<unknown string>" + distance(animationstartorigin, behaviortreeentity.origin), behaviortreeentity.origin, (1, 0.5, 0), "<unknown string>", behaviortreeentity, 0.4);
        recordcircle(behaviortreeentity.enemy gettagorigin("<unknown string>"), 8, (1, 0, 0), "<unknown string>", behaviortreeentity);
        recordcircle(animationstartorigin, 8, (1, 0.5, 0), "<unknown string>", behaviortreeentity);
        recordline(animationstartorigin, behaviortreeentity.origin, (1, 0.5, 0), "<unknown string>", behaviortreeentity);
    #/
    if (distance2dsquared(behaviortreeentity.origin, animationstartorigin) <= 900) {
        return 1;
    }
    if (behaviortreeentity haspath()) {
        selfpredictedpos = behaviortreeentity.origin;
        moveangle = behaviortreeentity.angles[1] + behaviortreeentity getmotionangle();
        selfpredictedpos = selfpredictedpos + (cos(moveangle), sin(moveangle), 0) * 200 * 0.2;
        /#
            record3dtext("<unknown string>" + distance(selfpredictedpos, animationstartorigin), behaviortreeentity.origin, (1, 0.5, 0), "<unknown string>", behaviortreeentity, 0.4);
        #/
        if (distance2dsquared(selfpredictedpos, animationstartorigin) <= 900) {
            return 1;
        }
    }
    return 0;
}

// Namespace archetype_aivsaimelee/archetype_aivsaimelee
// Params 1, eflags: 0x5 linked
// Checksum 0x9ce4f0b4, Offset: 0x1938
// Size: 0x504
function private chooseaivsaimeleeanimations(behaviortreeentity) {
    anglestoenemy = vectortoangles(behaviortreeentity.enemy.origin - behaviortreeentity.origin);
    yawtoenemy = angleclamp180(behaviortreeentity.enemy.angles[1] - anglestoenemy[1]);
    /#
        record3dtext("<unknown string>" + abs(yawtoenemy), behaviortreeentity.origin, (1, 0.5, 0), "<unknown string>", behaviortreeentity, 0.4);
    #/
    behaviortreeentity._ai_melee_animname = undefined;
    behaviortreeentity.enemy._ai_melee_animname = undefined;
    attacker_variant = choosearchetypevariant(behaviortreeentity);
    defender_variant = choosearchetypevariant(behaviortreeentity.enemy);
    if (!aivsaimeleebundleexists(behaviortreeentity, attacker_variant, defender_variant)) {
        /#
            record3dtext("<unknown string>" + function_9e72a96(behaviortreeentity.archetype) + "<unknown string>" + behaviortreeentity.enemy.archetype + "<unknown string>" + attacker_variant + "<unknown string>" + defender_variant, behaviortreeentity.origin, (1, 0.5, 0), "<unknown string>", behaviortreeentity, 0.4);
        #/
        return 0;
    }
    animbundle = level._aivsai_meleebundles[behaviortreeentity.archetype][behaviortreeentity.enemy.archetype][attacker_variant][defender_variant];
    /#
        if (isdefined(behaviortreeentity._ai_melee_attacker_loser) && behaviortreeentity._ai_melee_attacker_loser) {
            record3dtext("<unknown string>", behaviortreeentity.origin, (1, 0.5, 0), "<unknown string>", behaviortreeentity, 0.4);
        }
    #/
    foundanims = 0;
    possiblemelees = [];
    if (abs(yawtoenemy) > 120) {
        if (isdefined(behaviortreeentity.var_9c3773f7)) {
            possiblemelees[possiblemelees.size] = &chooseaivsaimeleefrontflipanimations;
        } else if (isdefined(behaviortreeentity.var_6cc28067)) {
            possiblemelees[possiblemelees.size] = &chooseaivsaimeleefrontwrestleanimations;
        } else {
            possiblemelees[possiblemelees.size] = &chooseaivsaimeleefrontflipanimations;
            possiblemelees[possiblemelees.size] = &chooseaivsaimeleefrontwrestleanimations;
        }
    } else if (abs(yawtoenemy) < 60) {
        possiblemelees[possiblemelees.size] = &chooseaivsaimeleebackanimations;
    } else {
        rightvec = vectornormalize(anglestoright(behaviortreeentity.enemy.angles));
        toattackervec = vectornormalize(behaviortreeentity.origin - behaviortreeentity.enemy.origin);
        rdot = vectordot(toattackervec, rightvec);
        if (rdot > 0) {
            possiblemelees[possiblemelees.size] = &chooseaivsaimeleerightanimations;
        } else {
            possiblemelees[possiblemelees.size] = &chooseaivsaimeleeleftanimations;
        }
    }
    if (possiblemelees.size > 0) {
        [[ array::random(possiblemelees) ]](behaviortreeentity, animbundle);
    }
    if (isdefined(behaviortreeentity._ai_melee_animname)) {
        debug_chosenmeleeanimations(behaviortreeentity);
        return 1;
    }
    return 0;
}

// Namespace archetype_aivsaimelee/archetype_aivsaimelee
// Params 1, eflags: 0x5 linked
// Checksum 0xe765e98a, Offset: 0x1e48
// Size: 0xee
function private choosearchetypevariant(entity) {
    if (entity.archetype == #"robot") {
        robot_state = entity ai::get_behavior_attribute("rogue_control");
        if (isinarray(array("forced_level_1", "level_1", "level_0"), robot_state)) {
            return "regular";
        }
        if (isinarray(array("forced_level_2", "level_2", "level_3", "forced_level_3"), robot_state)) {
            return "melee";
        }
    }
    return "regular";
}

// Namespace archetype_aivsaimelee/archetype_aivsaimelee
// Params 3, eflags: 0x5 linked
// Checksum 0x65722ebf, Offset: 0x1f40
// Size: 0xfc
function private aivsaimeleebundleexists(behaviortreeentity, attacker_variant, defender_variant) {
    if (!isdefined(level._aivsai_meleebundles[behaviortreeentity.archetype])) {
        return 0;
    } else if (!isdefined(level._aivsai_meleebundles[behaviortreeentity.archetype][behaviortreeentity.enemy.archetype])) {
        return 0;
    } else if (!isdefined(level._aivsai_meleebundles[behaviortreeentity.archetype][behaviortreeentity.enemy.archetype][attacker_variant])) {
        return 0;
    } else if (!isdefined(level._aivsai_meleebundles[behaviortreeentity.archetype][behaviortreeentity.enemy.archetype][attacker_variant][defender_variant])) {
        return 0;
    }
    return 1;
}

// Namespace archetype_aivsaimelee/archetype_aivsaimelee
// Params 2, eflags: 0x1 linked
// Checksum 0x29cfc9b5, Offset: 0x2048
// Size: 0xf8
function aivsaimeleeinitialize(behaviortreeentity, asmstatename) {
    behaviortreeentity.blockingpain = 1;
    behaviortreeentity.enemy.blockingpain = 1;
    aiutility::meleeacquiremutex(behaviortreeentity);
    behaviortreeentity._ai_melee_opponent = behaviortreeentity.enemy;
    behaviortreeentity.enemy._ai_melee_opponent = behaviortreeentity;
    if (isdefined(behaviortreeentity._ai_melee_attacker_loser) && behaviortreeentity._ai_melee_attacker_loser) {
        behaviortreeentity._ai_melee_markeddead = 1;
        behaviortreeentity.enemy thread playscriptedmeleeanimations();
    } else {
        behaviortreeentity.enemy._ai_melee_markeddead = 1;
        behaviortreeentity thread playscriptedmeleeanimations();
    }
    return 5;
}

// Namespace archetype_aivsaimelee/archetype_aivsaimelee
// Params 0, eflags: 0x1 linked
// Checksum 0x22d063d, Offset: 0x2148
// Size: 0x61c
function playscriptedmeleeanimations() {
    self endon(#"death");
    /#
        assert(isdefined(self._ai_melee_opponent));
    #/
    opponent = self._ai_melee_opponent;
    if (!(isalive(self) && isalive(opponent))) {
        /#
            record3dtext("<unknown string>", self.origin, (1, 0.5, 0), "<unknown string>", self, 0.4);
        #/
        return 0;
    }
    if (self isragdoll() || opponent isragdoll()) {
        /#
            record3dtext("<unknown string>", self.origin, (1, 0.5, 0), "<unknown string>", self, 0.4);
        #/
        return 0;
    }
    if (isdefined(opponent._ai_melee_attacker_loser) && opponent._ai_melee_attacker_loser) {
        opponent animscripted("aivsaimeleeloser", self gettagorigin("tag_sync"), self gettagangles("tag_sync"), opponent._ai_melee_animname, "normal", undefined, 1, 0.2, 0.3);
        self animscripted("aivsaimeleewinner", self gettagorigin("tag_sync"), self gettagangles("tag_sync"), self._ai_melee_animname, "normal", undefined, 1, 0.2, 0.3);
        /#
            recordcircle(self gettagorigin("<unknown string>"), 2, (1, 0.5, 0), "<unknown string>");
            recordline(self gettagorigin("<unknown string>"), opponent.origin, (1, 0.5, 0), "<unknown string>");
        #/
    } else {
        self animscripted("aivsaimeleewinner", opponent gettagorigin("tag_sync"), opponent gettagangles("tag_sync"), self._ai_melee_animname, "normal", undefined, 1, 0.2, 0.3);
        opponent animscripted("aivsaimeleeloser", opponent gettagorigin("tag_sync"), opponent gettagangles("tag_sync"), opponent._ai_melee_animname, "normal", undefined, 1, 0.2, 0.3);
        /#
            recordcircle(opponent gettagorigin("<unknown string>"), 2, (1, 0.5, 0), "<unknown string>");
            recordline(opponent gettagorigin("<unknown string>"), self.origin, (1, 0.5, 0), "<unknown string>");
        #/
    }
    opponent thread handledeath(opponent._ai_melee_animname, self);
    if (getdvarint(#"tu1_aivsaimeleedisablegib", 1)) {
        if (opponent ai::has_behavior_attribute("can_gib")) {
            opponent ai::set_behavior_attribute("can_gib", 0);
        }
    }
    self thread processinterrupteddeath();
    opponent thread processinterrupteddeath();
    self waittillmatch({#notetrack:"end"}, #"aivsaimeleewinner");
    self.fixedlinkyawonly = 0;
    aiutility::cleanupchargemeleeattack(self);
    if (isdefined(self._ai_melee_attachedknife) && self._ai_melee_attachedknife) {
        self detach(#"wpn_t7_knife_combat_prop", "TAG_WEAPON_LEFT");
        self._ai_melee_attachedknife = 0;
    }
    self.blockingpain = 0;
    self._ai_melee_initiator = undefined;
    self notify(#"meleecompleted");
    self pathmode("move delayed", 1, 3);
}

// Namespace archetype_aivsaimelee/archetype_aivsaimelee
// Params 2, eflags: 0x5 linked
// Checksum 0xbeecd631, Offset: 0x2770
// Size: 0x12e
function private chooseaivsaimeleefrontflipanimations(behaviortreeentity, animbundle) {
    /#
        record3dtext("<unknown string>", behaviortreeentity.origin, (1, 0.5, 0), "<unknown string>", behaviortreeentity, 0.4);
    #/
    /#
        assert(isdefined(animbundle));
    #/
    if (isdefined(behaviortreeentity._ai_melee_attacker_loser) && behaviortreeentity._ai_melee_attacker_loser) {
        behaviortreeentity._ai_melee_animname = animbundle.attackerloserfrontanim;
        behaviortreeentity.enemy._ai_melee_animname = animbundle.defenderwinnerfrontanim;
    } else {
        behaviortreeentity._ai_melee_animname = animbundle.attackerfrontanim;
        behaviortreeentity.enemy._ai_melee_animname = animbundle.victimfrontanim;
    }
    behaviortreeentity._ai_melee_animtype = 1;
    behaviortreeentity.enemy._ai_melee_animtype = 1;
}

// Namespace archetype_aivsaimelee/archetype_aivsaimelee
// Params 2, eflags: 0x5 linked
// Checksum 0x2c1aabca, Offset: 0x28a8
// Size: 0x126
function private chooseaivsaimeleefrontwrestleanimations(behaviortreeentity, animbundle) {
    /#
        record3dtext("<unknown string>", behaviortreeentity.origin, (1, 0.5, 0), "<unknown string>", behaviortreeentity, 0.4);
    #/
    /#
        assert(isdefined(animbundle));
    #/
    if (isdefined(behaviortreeentity._ai_melee_attacker_loser) && behaviortreeentity._ai_melee_attacker_loser) {
        behaviortreeentity._ai_melee_animname = animbundle.attackerloseralternatefrontanim;
        behaviortreeentity.enemy._ai_melee_animname = animbundle.defenderwinneralternatefrontanim;
    } else {
        behaviortreeentity._ai_melee_animname = animbundle.attackeralternatefrontanim;
        behaviortreeentity.enemy._ai_melee_animname = animbundle.victimalternatefrontanim;
    }
    behaviortreeentity._ai_melee_animtype = 0;
    behaviortreeentity.enemy._ai_melee_animtype = 0;
}

// Namespace archetype_aivsaimelee/archetype_aivsaimelee
// Params 2, eflags: 0x5 linked
// Checksum 0x6012562e, Offset: 0x29d8
// Size: 0x12e
function private chooseaivsaimeleebackanimations(behaviortreeentity, animbundle) {
    /#
        record3dtext("<unknown string>", behaviortreeentity.origin, (1, 0.5, 0), "<unknown string>", behaviortreeentity, 0.4);
    #/
    /#
        assert(isdefined(animbundle));
    #/
    if (isdefined(behaviortreeentity._ai_melee_attacker_loser) && behaviortreeentity._ai_melee_attacker_loser) {
        behaviortreeentity._ai_melee_animname = animbundle.attackerloserbackanim;
        behaviortreeentity.enemy._ai_melee_animname = animbundle.defenderwinnerbackanim;
    } else {
        behaviortreeentity._ai_melee_animname = animbundle.attackerbackanim;
        behaviortreeentity.enemy._ai_melee_animname = animbundle.victimbackanim;
    }
    behaviortreeentity._ai_melee_animtype = 2;
    behaviortreeentity.enemy._ai_melee_animtype = 2;
}

// Namespace archetype_aivsaimelee/archetype_aivsaimelee
// Params 2, eflags: 0x5 linked
// Checksum 0xe7fe2a88, Offset: 0x2b10
// Size: 0x12e
function private chooseaivsaimeleerightanimations(behaviortreeentity, animbundle) {
    /#
        record3dtext("<unknown string>", behaviortreeentity.origin, (1, 0.5, 0), "<unknown string>", behaviortreeentity, 0.4);
    #/
    /#
        assert(isdefined(animbundle));
    #/
    if (isdefined(behaviortreeentity._ai_melee_attacker_loser) && behaviortreeentity._ai_melee_attacker_loser) {
        behaviortreeentity._ai_melee_animname = animbundle.attackerloserrightanim;
        behaviortreeentity.enemy._ai_melee_animname = animbundle.defenderwinnerrightanim;
    } else {
        behaviortreeentity._ai_melee_animname = animbundle.attackerrightanim;
        behaviortreeentity.enemy._ai_melee_animname = animbundle.victimrightanim;
    }
    behaviortreeentity._ai_melee_animtype = 3;
    behaviortreeentity.enemy._ai_melee_animtype = 3;
}

// Namespace archetype_aivsaimelee/archetype_aivsaimelee
// Params 2, eflags: 0x5 linked
// Checksum 0x263cf0ca, Offset: 0x2c48
// Size: 0x12e
function private chooseaivsaimeleeleftanimations(behaviortreeentity, animbundle) {
    /#
        record3dtext("<unknown string>", behaviortreeentity.origin, (1, 0.5, 0), "<unknown string>", behaviortreeentity, 0.4);
    #/
    /#
        assert(isdefined(animbundle));
    #/
    if (isdefined(behaviortreeentity._ai_melee_attacker_loser) && behaviortreeentity._ai_melee_attacker_loser) {
        behaviortreeentity._ai_melee_animname = animbundle.attackerloserleftanim;
        behaviortreeentity.enemy._ai_melee_animname = animbundle.defenderwinnerleftanim;
    } else {
        behaviortreeentity._ai_melee_animname = animbundle.attackerleftanim;
        behaviortreeentity.enemy._ai_melee_animname = animbundle.victimleftanim;
    }
    behaviortreeentity._ai_melee_animtype = 4;
    behaviortreeentity.enemy._ai_melee_animtype = 4;
}

// Namespace archetype_aivsaimelee/archetype_aivsaimelee
// Params 1, eflags: 0x5 linked
// Checksum 0x44d1c64e, Offset: 0x2d80
// Size: 0xec
function private debug_chosenmeleeanimations(behaviortreeentity) {
    /#
        if (isdefined(behaviortreeentity._ai_melee_animname) && isdefined(behaviortreeentity.enemy._ai_melee_animname)) {
            record3dtext("<unknown string>" + behaviortreeentity._ai_melee_animname, behaviortreeentity.origin, (1, 0.5, 0), "<unknown string>", behaviortreeentity, 0.4);
            record3dtext("<unknown string>" + behaviortreeentity.enemy._ai_melee_animname, behaviortreeentity.origin, (1, 0.5, 0), "<unknown string>", behaviortreeentity, 0.4);
        }
    #/
}

// Namespace archetype_aivsaimelee/archetype_aivsaimelee
// Params 2, eflags: 0x1 linked
// Checksum 0x851856f4, Offset: 0x2e78
// Size: 0x94
function handledeath(animationname, attacker) {
    self endon(#"death", #"interrupteddeath");
    self.skipdeath = 1;
    self.diedinscriptedanim = 1;
    totaltime = getanimlength(animationname);
    wait(totaltime - 0.2);
    self killwrapper(attacker);
}

// Namespace archetype_aivsaimelee/archetype_aivsaimelee
// Params 0, eflags: 0x1 linked
// Checksum 0xbd7c125b, Offset: 0x2f18
// Size: 0x29c
function processinterrupteddeath() {
    self endon(#"meleecompleted");
    /#
        assert(isdefined(self._ai_melee_opponent));
    #/
    opponent = self._ai_melee_opponent;
    if (!(isdefined(self.allowdeath) && self.allowdeath)) {
        return;
    }
    self waittill(#"death");
    if (isdefined(self) && isdefined(self._ai_melee_attachedknife) && self._ai_melee_attachedknife) {
        self detach(#"wpn_t7_knife_combat_prop", "TAG_WEAPON_LEFT");
    }
    if (isalive(opponent)) {
        if (isdefined(opponent._ai_melee_markeddead) && opponent._ai_melee_markeddead) {
            opponent.diedinscriptedanim = 1;
            opponent.skipdeath = 1;
            opponent notify(#"interrupteddeath");
            opponent notify(#"meleecompleted");
            opponent stopanimscripted();
            opponent killwrapper();
            opponent startragdoll();
        } else {
            opponent._ai_melee_initiator = undefined;
            opponent.blockingpain = 0;
            opponent._ai_melee_markeddead = undefined;
            opponent.skipdeath = 0;
            opponent.diedinscriptedanim = 0;
            aiutility::cleanupchargemeleeattack(opponent);
            opponent notify(#"interrupteddeath");
            opponent notify(#"meleecompleted");
            opponent stopanimscripted();
        }
    }
    if (isdefined(self)) {
        self.diedinscriptedanim = 1;
        self.skipdeath = 1;
        self notify(#"interrupteddeath");
        self stopanimscripted();
        self killwrapper();
        self startragdoll();
    }
}

// Namespace archetype_aivsaimelee/archetype_aivsaimelee
// Params 1, eflags: 0x1 linked
// Checksum 0xeb9295b7, Offset: 0x31c0
// Size: 0x8c
function killwrapper(attacker) {
    if (isdefined(self.overrideactordamage)) {
        self.overrideactordamage = undefined;
    }
    self.tokubetsukogekita = undefined;
    if (isdefined(attacker) && util::function_fbce7263(self.team, attacker.team)) {
        self kill(self.origin, attacker);
    } else {
        self kill();
    }
}

