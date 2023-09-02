// Atian COD Tools GSC decompiler test
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\ai\archetype_cover_utility.gsc;
#using scripts\core_common\ai\archetype_utility.gsc;
#using scripts\core_common\ai\systems\behavior_tree_utility.gsc;
#using scripts\core_common\ai\systems\ai_interface.gsc;
#using scripts\core_common\ai\systems\ai_blackboard.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace archetype_human_cover;

// Namespace archetype_human_cover/archetype_human_cover
// Params 0, eflags: 0x2
// Checksum 0x8744a435, Offset: 0x1f8
// Size: 0x9c4
function autoexec registerbehaviorscriptfunctions() {
    /#
        assert(isscriptfunctionptr(&shouldreturntocovercondition));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldreturntocovercondition", &shouldreturntocovercondition);
    /#
        assert(isscriptfunctionptr(&shouldreturntosuppressedcover));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldreturntosuppressedcover", &shouldreturntosuppressedcover);
    /#
        assert(isscriptfunctionptr(&shouldadjusttocover));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldadjusttocover", &shouldadjusttocover);
    /#
        assert(isscriptfunctionptr(&prepareforadjusttocover));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"prepareforadjusttocover", &prepareforadjusttocover);
    /#
        assert(isscriptfunctionptr(&coverblindfireshootactionstart));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"coverblindfireshootstart", &coverblindfireshootactionstart);
    /#
        assert(isscriptfunctionptr(&canchangestanceatcovercondition));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"canchangestanceatcovercondition", &canchangestanceatcovercondition);
    /#
        assert(isscriptfunctionptr(&coverchangestanceactionstart));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"coverchangestanceactionstart", &coverchangestanceactionstart);
    /#
        assert(isscriptfunctionptr(&preparetochangestancetostand));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"preparetochangestancetostand", &preparetochangestancetostand);
    /#
        assert(isscriptfunctionptr(&cleanupchangestancetostand));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"cleanupchangestancetostand", &cleanupchangestancetostand);
    /#
        assert(isscriptfunctionptr(&preparetochangestancetocrouch));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"preparetochangestancetocrouch", &preparetochangestancetocrouch);
    /#
        assert(isscriptfunctionptr(&cleanupchangestancetocrouch));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"cleanupchangestancetocrouch", &cleanupchangestancetocrouch);
    /#
        assert(isscriptfunctionptr(&shouldvantageatcovercondition));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldvantageatcovercondition", &shouldvantageatcovercondition);
    /#
        assert(isscriptfunctionptr(&supportsvantagecovercondition));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"supportsvantagecovercondition", &supportsvantagecovercondition);
    /#
        assert(isscriptfunctionptr(&covervantageinitialize));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"covervantageinitialize", &covervantageinitialize);
    /#
        assert(isscriptfunctionptr(&shouldthrowgrenadeatcovercondition));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldthrowgrenadeatcovercondition", &shouldthrowgrenadeatcovercondition);
    /#
        assert(isscriptfunctionptr(&coverpreparetothrowgrenade));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"coverpreparetothrowgrenade", &coverpreparetothrowgrenade);
    /#
        assert(isscriptfunctionptr(&covercleanuptothrowgrenade));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"covercleanuptothrowgrenade", &covercleanuptothrowgrenade);
    /#
        assert(isscriptfunctionptr(&sensenearbyplayers));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"sensenearbyplayers", &sensenearbyplayers);
    /#
        assert(isscriptfunctionptr(&function_f120d301));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_5b614e766fc4d283", &function_f120d301);
    /#
        assert(isscriptfunctionptr(&function_ae382dda));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2078ca98b094c39", &function_ae382dda);
    /#
        assert(isscriptfunctionptr(&function_e17114c2));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_914aa2c9d4ad21c", &function_e17114c2);
    /#
        assert(isscriptfunctionptr(&switchtogrenadelauncher));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"switchtogrenadelauncher", &switchtogrenadelauncher);
    /#
        assert(isscriptfunctionptr(&switchtolightninggun));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"switchtolightninggun", &switchtolightninggun);
    /#
        assert(isscriptfunctionptr(&switchtoannihilator));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"switchtoannihilator", &switchtoannihilator);
}

// Namespace archetype_human_cover/archetype_human_cover
// Params 2, eflags: 0x1 linked
// Checksum 0x3ffaba47, Offset: 0xbc8
// Size: 0x8f6
function shouldthrowgrenadeatcovercondition(entity, throwifpossible = 0) {
    if (isdefined(self.hero) && self.hero && isdefined(self.var_6fe3ea59) && self.var_6fe3ea59) {
        throwifpossible = 1;
    }
    if (isdefined(level.aidisablegrenadethrows) && level.aidisablegrenadethrows) {
        return 0;
    }
    if (!isdefined(entity.enemy)) {
        return 0;
    }
    if (!issentient(entity.enemy)) {
        return 0;
    }
    if (isvehicle(entity.enemy) && isairborne(entity.enemy)) {
        return 0;
    }
    if (isdefined(entity.grenadeammo) && entity.grenadeammo <= 0) {
        return 0;
    }
    if (ai::hasaiattribute(entity, "useGrenades") && !ai::getaiattribute(entity, "useGrenades")) {
        return 0;
    }
    if (isplayer(entity.enemy) && entity.enemy laststand::player_is_in_laststand()) {
        return 0;
    }
    entityangles = entity.angles;
    if (isdefined(entity.node) && (entity.node.type == #"cover left" || entity.node.type == #"cover right" || entity.node.type == #"cover pillar" || entity.node.type == #"cover stand" || entity.node.type == #"conceal stand" || entity.node.type == #"cover crouch" || entity.node.type == #"cover crouch window" || entity.node.type == #"conceal crouch") && entity isatcovernodestrict()) {
        entityangles = entity.node.angles;
    }
    toenemy = entity.enemy.origin - entity.origin;
    toenemy = vectornormalize((toenemy[0], toenemy[1], 0));
    entityforward = anglestoforward(entityangles);
    entityforward = vectornormalize((entityforward[0], entityforward[1], 0));
    if (vectordot(toenemy, entityforward) < 0.5) {
        return 0;
    }
    if (!throwifpossible) {
        friendlyplayers = getplayers(entity.team);
        allplayers = getplayers();
        if (isdefined(friendlyplayers) && friendlyplayers.size) {
            foreach (player in friendlyplayers) {
                if (distancesquared(entity.enemy.origin, player.origin) <= 640000) {
                    return 0;
                }
            }
        }
        if (isdefined(allplayers) && allplayers.size) {
            foreach (player in allplayers) {
                if (isdefined(player) && player laststand::player_is_in_laststand() && distancesquared(entity.enemy.origin, player.origin) <= 640000) {
                    return 0;
                }
            }
        }
        grenadethrowinfos = blackboard::getblackboardevents("team_grenade_throw");
        foreach (grenadethrowinfo in grenadethrowinfos) {
            if (grenadethrowinfo.data.grenadethrowerteam === entity.team) {
                return 0;
            }
        }
        grenadethrowinfos = blackboard::getblackboardevents("human_grenade_throw");
        foreach (grenadethrowinfo in grenadethrowinfos) {
            if (isdefined(grenadethrowinfo.data.grenadethrownat) && isalive(grenadethrowinfo.data.grenadethrownat)) {
                if (grenadethrowinfo.data.grenadethrower == entity) {
                    return 0;
                }
                if (isdefined(grenadethrowinfo.data.grenadethrownat) && grenadethrowinfo.data.grenadethrownat == entity.enemy) {
                    return 0;
                }
                if (isdefined(grenadethrowinfo.data.grenadethrownposition) && isdefined(entity.grenadethrowposition) && distancesquared(grenadethrowinfo.data.grenadethrownposition, entity.grenadethrowposition) <= 1440000) {
                    return 0;
                }
            }
        }
    }
    throw_dist = distance2dsquared(entity.origin, entity lastknownpos(entity.enemy));
    if (throw_dist < 500 * 500 || throw_dist > 1250 * 1250) {
        return 0;
    }
    arm_offset = temp_get_arm_offset(entity, entity lastknownpos(entity.enemy));
    throw_vel = entity canthrowgrenadepos(arm_offset, entity lastknownpos(entity.enemy));
    if (!isdefined(throw_vel)) {
        return 0;
    }
    return 1;
}

// Namespace archetype_human_cover/archetype_human_cover
// Params 1, eflags: 0x5 linked
// Checksum 0xcdea8e2d, Offset: 0x14c8
// Size: 0x130
function private sensenearbyplayers(entity) {
    players = getplayers();
    foreach (player in players) {
        distancesq = distancesquared(player.origin, entity.origin);
        if (distancesq <= 360 * 360) {
            distancetoplayer = sqrt(distancesq);
            chancetodetect = randomfloat(1);
            if (chancetodetect < distancetoplayer / 360) {
                entity getperfectinfo(player);
            }
        }
    }
}

// Namespace archetype_human_cover/archetype_human_cover
// Params 1, eflags: 0x5 linked
// Checksum 0x8a66f935, Offset: 0x1600
// Size: 0x16a
function private coverpreparetothrowgrenade(entity) {
    aiutility::keepclaimednodeandchoosecoverdirection(entity);
    if (isdefined(entity.enemy)) {
        entity.grenadethrowposition = entity lastknownpos(entity.enemy);
    }
    grenadethrowinfo = spawnstruct();
    grenadethrowinfo.grenadethrower = entity;
    grenadethrowinfo.grenadethrownat = entity.enemy;
    grenadethrowinfo.grenadethrownposition = entity.grenadethrowposition;
    blackboard::addblackboardevent("human_grenade_throw", grenadethrowinfo, randomintrange(15000, 20000));
    grenadethrowinfo = spawnstruct();
    grenadethrowinfo.grenadethrowerteam = entity.team;
    blackboard::addblackboardevent("team_grenade_throw", grenadethrowinfo, randomintrange(8000, 12000));
    entity.preparegrenadeammo = entity.grenadeammo;
}

// Namespace archetype_human_cover/archetype_human_cover
// Params 1, eflags: 0x5 linked
// Checksum 0x8644b82b, Offset: 0x1778
// Size: 0x20c
function private covercleanuptothrowgrenade(entity) {
    aiutility::resetcoverparameters(entity);
    if (entity.preparegrenadeammo == entity.grenadeammo) {
        if (entity.health <= 0) {
            grenade = undefined;
            if (isactor(entity.enemy) && isdefined(entity.grenadeweapon)) {
                grenade = entity.enemy magicgrenadetype(entity.grenadeweapon, entity gettagorigin("j_wrist_ri"), (0, 0, 0), float(entity.grenadeweapon.aifusetime) / 1000);
            } else if (isplayer(entity.enemy) && isdefined(entity.grenadeweapon)) {
                grenade = entity.enemy magicgrenadeplayer(entity.grenadeweapon, entity gettagorigin("j_wrist_ri"), (0, 0, 0));
            }
            if (isdefined(grenade)) {
                grenade.owner = entity;
                grenade.team = entity.team;
                grenade setcontents(grenade setcontents(0) & ~(32768 | 67108864 | 8388608 | 33554432));
            }
        }
    }
}

// Namespace archetype_human_cover/archetype_human_cover
// Params 1, eflags: 0x5 linked
// Checksum 0x986a3019, Offset: 0x1990
// Size: 0x9c
function private canchangestanceatcovercondition(entity) {
    switch (entity getblackboardattribute("_stance")) {
    case #"stand":
        return aiutility::isstanceallowedatnode("crouch", entity.node);
    case #"crouch":
        return aiutility::isstanceallowedatnode("stand", entity.node);
        break;
    }
    return 0;
}

// Namespace archetype_human_cover/archetype_human_cover
// Params 1, eflags: 0x5 linked
// Checksum 0x9beb0b4b, Offset: 0x1a38
// Size: 0x2e
function private shouldreturntosuppressedcover(entity) {
    if (!entity isatgoal()) {
        return 1;
    }
    return 0;
}

// Namespace archetype_human_cover/archetype_human_cover
// Params 1, eflags: 0x5 linked
// Checksum 0x3ad69c30, Offset: 0x1a70
// Size: 0x18e
function private shouldreturntocovercondition(entity) {
    if (entity asmistransitionrunning()) {
        return 0;
    }
    if (isdefined(entity.covershootstarttime)) {
        if (gettime() < entity.covershootstarttime + 800) {
            return 0;
        }
        if (isdefined(entity.enemy) && isplayer(entity.enemy) && entity.enemy.health < entity.enemy.maxhealth * 0.5) {
            if (gettime() < entity.covershootstarttime + 3000) {
                return 0;
            }
        }
    }
    if (aiutility::issuppressedatcovercondition(entity)) {
        return 1;
    }
    if (!entity isatgoal()) {
        if (isdefined(entity.node)) {
            offsetorigin = entity getnodeoffsetposition(entity.node);
            return !entity isposatgoal(offsetorigin);
        }
        return 1;
    }
    if (!entity issafefromgrenade()) {
        return 1;
    }
    return 0;
}

// Namespace archetype_human_cover/archetype_human_cover
// Params 1, eflags: 0x5 linked
// Checksum 0x958284f5, Offset: 0x1c08
// Size: 0x14e
function private shouldadjusttocover(entity) {
    if (!isdefined(entity.node)) {
        return 0;
    }
    highestsupportedstance = aiutility::gethighestnodestance(entity.node);
    currentstance = entity getblackboardattribute("_stance");
    if (currentstance == "crouch" && highestsupportedstance == "crouch") {
        return 0;
    }
    covermode = entity getblackboardattribute("_cover_mode");
    previouscovermode = entity getblackboardattribute("_previous_cover_mode");
    if (covermode != "cover_alert" && previouscovermode != "cover_alert" && !entity.keepclaimednode) {
        return 1;
    }
    if (!aiutility::isstanceallowedatnode(currentstance, entity.node)) {
        return 1;
    }
    return 0;
}

// Namespace archetype_human_cover/archetype_human_cover
// Params 1, eflags: 0x5 linked
// Checksum 0xced8e092, Offset: 0x1d60
// Size: 0x1c2
function private shouldvantageatcovercondition(entity) {
    if (!isdefined(entity.node) || !isdefined(entity.node.type) || !isdefined(entity.enemy) || !isdefined(entity.enemy.origin)) {
        return 0;
    }
    yawtoenemyposition = aiutility::getaimyawtoenemyfromnode(entity, entity.node, entity.enemy);
    pitchtoenemyposition = aiutility::getaimpitchtoenemyfromnode(entity, entity.node, entity.enemy);
    aimlimitsforcover = entity getaimlimitsfromentry("cover_vantage");
    legalaim = 0;
    if (yawtoenemyposition < aimlimitsforcover[#"aim_left"] && yawtoenemyposition > aimlimitsforcover[#"aim_right"] && pitchtoenemyposition < 85 && pitchtoenemyposition > 25 && entity.node.origin[2] - entity.enemy.origin[2] >= 36) {
        legalaim = 1;
    }
    return legalaim;
}

// Namespace archetype_human_cover/archetype_human_cover
// Params 1, eflags: 0x5 linked
// Checksum 0x44f445af, Offset: 0x1f30
// Size: 0xe
function private supportsvantagecovercondition(entity) {
    return 0;
}

// Namespace archetype_human_cover/archetype_human_cover
// Params 2, eflags: 0x5 linked
// Checksum 0x1b867163, Offset: 0x1f48
// Size: 0x54
function private covervantageinitialize(entity, asmstatename) {
    aiutility::keepclaimnode(entity);
    entity setblackboardattribute("_cover_mode", "cover_vantage");
}

// Namespace archetype_human_cover/archetype_human_cover
// Params 2, eflags: 0x5 linked
// Checksum 0x90fcb35d, Offset: 0x1fa8
// Size: 0x6c
function private coverblindfireshootactionstart(entity, asmstatename) {
    aiutility::keepclaimnode(entity);
    entity setblackboardattribute("_cover_mode", "cover_blind");
    aiutility::choosecoverdirection(entity);
}

// Namespace archetype_human_cover/archetype_human_cover
// Params 2, eflags: 0x5 linked
// Checksum 0x87464423, Offset: 0x2020
// Size: 0x54
function private preparetochangestancetostand(entity, asmstatename) {
    aiutility::cleanupcovermode(entity);
    entity setblackboardattribute("_desired_stance", "stand");
}

// Namespace archetype_human_cover/archetype_human_cover
// Params 2, eflags: 0x5 linked
// Checksum 0x813555c2, Offset: 0x2080
// Size: 0x3a
function private cleanupchangestancetostand(entity, asmstatename) {
    aiutility::releaseclaimnode(entity);
    entity.newenemyreaction = 0;
}

// Namespace archetype_human_cover/archetype_human_cover
// Params 2, eflags: 0x5 linked
// Checksum 0x132638b4, Offset: 0x20c8
// Size: 0x54
function private preparetochangestancetocrouch(entity, asmstatename) {
    aiutility::cleanupcovermode(entity);
    entity setblackboardattribute("_desired_stance", "crouch");
}

// Namespace archetype_human_cover/archetype_human_cover
// Params 2, eflags: 0x5 linked
// Checksum 0x16a47d1d, Offset: 0x2128
// Size: 0x3a
function private cleanupchangestancetocrouch(entity, asmstatename) {
    aiutility::releaseclaimnode(entity);
    entity.newenemyreaction = 0;
}

// Namespace archetype_human_cover/archetype_human_cover
// Params 2, eflags: 0x5 linked
// Checksum 0x84beb3a2, Offset: 0x2170
// Size: 0x6c
function private prepareforadjusttocover(entity, asmstatename) {
    aiutility::keepclaimnode(entity);
    highestsupportedstance = aiutility::gethighestnodestance(entity.node);
    entity setblackboardattribute("_desired_stance", highestsupportedstance);
}

// Namespace archetype_human_cover/archetype_human_cover
// Params 2, eflags: 0x5 linked
// Checksum 0xda672929, Offset: 0x21e8
// Size: 0xf2
function private coverchangestanceactionstart(entity, asmstatename) {
    entity setblackboardattribute("_cover_mode", "cover_alert");
    aiutility::keepclaimnode(entity);
    switch (entity getblackboardattribute("_stance")) {
    case #"stand":
        entity setblackboardattribute("_desired_stance", "crouch");
        break;
    case #"crouch":
        entity setblackboardattribute("_desired_stance", "stand");
        break;
    }
}

// Namespace archetype_human_cover/archetype_human_cover
// Params 2, eflags: 0x1 linked
// Checksum 0x1dde1c8f, Offset: 0x22e8
// Size: 0x47a
function temp_get_arm_offset(entity, throwposition) {
    stance = entity getblackboardattribute("_stance");
    arm_offset = undefined;
    if (stance == "crouch") {
        arm_offset = (13, -1, 56);
    } else {
        arm_offset = (14, -3, 80);
    }
    if (isdefined(entity.node) && entity isatcovernodestrict()) {
        if (entity.node.type == #"cover left") {
            if (stance == "crouch") {
                arm_offset = (-38, 15, 23);
            } else {
                arm_offset = (-45, 0, 40);
            }
        } else if (entity.node.type == #"cover right") {
            if (stance == "crouch") {
                arm_offset = (46, 12, 26);
            } else {
                arm_offset = (34, -21, 50);
            }
        } else if (entity.node.type == #"cover stand" || entity.node.type == #"conceal stand") {
            arm_offset = (10, 7, 77);
        } else if (entity.node.type == #"cover crouch" || entity.node.type == #"cover crouch window" || entity.node.type == #"conceal crouch") {
            arm_offset = (19, 5, 60);
        } else if (entity.node.type == #"cover pillar") {
            leftoffset = undefined;
            rightoffset = undefined;
            if (stance == "crouch") {
                leftoffset = (-20, 0, 35);
                rightoffset = (34, 6, 50);
            } else {
                leftoffset = (-24, 0, 76);
                rightoffset = (24, 0, 76);
            }
            if (isdefined(entity.node.spawnflags) && (entity.node.spawnflags & 1024) == 1024) {
                arm_offset = rightoffset;
            } else if (isdefined(entity.node.spawnflags) && (entity.node.spawnflags & 2048) == 2048) {
                arm_offset = leftoffset;
            } else {
                yawtoenemyposition = angleclamp180(vectortoangles(throwposition - entity.node.origin)[1] - entity.node.angles[1]);
                aimlimitsfordirectionright = entity getaimlimitsfromentry("pillar_right_lean");
                legalrightdirectionyaw = yawtoenemyposition >= aimlimitsfordirectionright[#"aim_right"] - 10 && yawtoenemyposition <= 0;
                if (legalrightdirectionyaw) {
                    arm_offset = rightoffset;
                } else {
                    arm_offset = leftoffset;
                }
            }
        }
    }
    return arm_offset;
}

// Namespace archetype_human_cover/archetype_human_cover
// Params 1, eflags: 0x5 linked
// Checksum 0xb8734a66, Offset: 0x2770
// Size: 0x4c
function private function_f120d301(entity) {
    return ai::hasaiattribute(entity, "useGrenadeLauncher") && ai::getaiattribute(entity, "useGrenadeLauncher");
}

// Namespace archetype_human_cover/archetype_human_cover
// Params 1, eflags: 0x5 linked
// Checksum 0xf193d042, Offset: 0x27c8
// Size: 0x4c
function private function_ae382dda(entity) {
    return ai::hasaiattribute(entity, "useLightningGun") && ai::getaiattribute(entity, "useLightningGun");
}

// Namespace archetype_human_cover/archetype_human_cover
// Params 1, eflags: 0x5 linked
// Checksum 0x9ba867c9, Offset: 0x2820
// Size: 0x4c
function private function_e17114c2(entity) {
    return ai::hasaiattribute(entity, "useAnnihilator") && ai::getaiattribute(entity, "useAnnihilator");
}

// Namespace archetype_human_cover/archetype_human_cover
// Params 1, eflags: 0x5 linked
// Checksum 0x49987cf9, Offset: 0x2878
// Size: 0x3c
function private switchtogrenadelauncher(entity) {
    entity.blockingpain = 1;
    entity ai::gun_switchto("hero_pineapplegun", "right");
}

// Namespace archetype_human_cover/archetype_human_cover
// Params 1, eflags: 0x5 linked
// Checksum 0xcd0d559f, Offset: 0x28c0
// Size: 0x3c
function private switchtolightninggun(entity) {
    entity.blockingpain = 1;
    entity ai::gun_switchto("hero_lightninggun", "right");
}

// Namespace archetype_human_cover/archetype_human_cover
// Params 1, eflags: 0x5 linked
// Checksum 0x86e6a342, Offset: 0x2908
// Size: 0x3c
function private switchtoannihilator(entity) {
    entity.blockingpain = 1;
    entity ai::gun_switchto("hero_annihilator", "right");
}

