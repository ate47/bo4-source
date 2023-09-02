// Atian COD Tools GSC decompiler test
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\ai\systems\behavior_tree_utility.gsc;
#using scripts\core_common\ai\systems\behavior_state_machine.gsc;
#using scripts\core_common\ai\systems\ai_interface.gsc;

#namespace archetype_human_locomotion;

// Namespace archetype_human_locomotion/archetype_human_locomotion
// Params 0, eflags: 0x2
// Checksum 0x9b26ab12, Offset: 0x1d0
// Size: 0xb64
function autoexec registerbehaviorscriptfunctions() {
    /#
        assert(isscriptfunctionptr(&prepareformovement));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"prepareformovement", &prepareformovement);
    /#
        assert(isscriptfunctionptr(&prepareformovement));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"prepareformovement", &prepareformovement);
    /#
        assert(isscriptfunctionptr(&shouldtacticalarrivecondition));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldtacticalarrive", &shouldtacticalarrivecondition);
    /#
        assert(isscriptfunctionptr(&planhumanarrivalatcover));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"planhumanarrivalatcover", &planhumanarrivalatcover);
    /#
        assert(isscriptfunctionptr(&shouldplanarrivalintocover));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"shouldplanarrivalintocover", &shouldplanarrivalintocover);
    /#
        assert(iscodefunctionptr(&btapi_shouldarriveexposed));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"btapi_shouldarriveexposed", &btapi_shouldarriveexposed);
    /#
        assert(isscriptfunctionptr(&shouldarriveexposed));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"shouldarriveexposed", &shouldarriveexposed);
    /#
        assert(iscodefunctionptr(&btapi_humannoncombatlocomotionupdate));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"btapi_humannoncombatlocomotionupdate", &btapi_humannoncombatlocomotionupdate);
    /#
        assert(isscriptfunctionptr(&noncombatlocomotionupdate));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"noncombatlocomotionupdate", &noncombatlocomotionupdate);
    /#
        assert(isscriptfunctionptr(&combatlocomotionstart));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"combatlocomotionstart", &combatlocomotionstart);
    /#
        assert(iscodefunctionptr(&btapi_combatlocomotionupdate));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"btapi_combatlocomotionupdate", &btapi_combatlocomotionupdate);
    /#
        assert(isscriptfunctionptr(&combatlocomotionupdate));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"combatlocomotionupdate", &combatlocomotionupdate);
    /#
        assert(iscodefunctionptr(&btapi_humannoncombatlocomotioncondition));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"btapi_humannoncombatlocomotioncondition", &btapi_humannoncombatlocomotioncondition);
    /#
        assert(isscriptfunctionptr(&humannoncombatlocomotioncondition));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"humannoncombatlocomotioncondition", &humannoncombatlocomotioncondition);
    /#
        assert(iscodefunctionptr(&btapi_humancombatlocomotioncondition));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"btapi_humancombatlocomotioncondition", &btapi_humancombatlocomotioncondition);
    /#
        assert(isscriptfunctionptr(&humancombatlocomotioncondition));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"humancombatlocomotioncondition", &humancombatlocomotioncondition);
    /#
        assert(iscodefunctionptr(&btapi_shouldswitchtotacticalwalkfromrun));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"btapi_shouldswitchtotacticalwalkfromrun", &btapi_shouldswitchtotacticalwalkfromrun);
    /#
        assert(isscriptfunctionptr(&shouldswitchtotacticalwalkfromrun));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"shouldswitchtotacticalwalkfromrun", &shouldswitchtotacticalwalkfromrun);
    /#
        assert(isscriptfunctionptr(&preparetostopnearenemy));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"preparetostopnearenemy", &preparetostopnearenemy);
    /#
        assert(isscriptfunctionptr(&preparetostopnearenemy));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"preparetostopnearenemy", &preparetostopnearenemy);
    /#
        assert(isscriptfunctionptr(&preparetomoveawayfromnearbyenemy));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"preparetomoveawayfromnearbyenemy", &preparetomoveawayfromnearbyenemy);
    /#
        assert(isscriptfunctionptr(&shouldtacticalwalkpain));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"shouldtacticalwalkpain", &shouldtacticalwalkpain);
    /#
        assert(isscriptfunctionptr(&begintacticalwalkpain));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"begintacticalwalkpain", &begintacticalwalkpain);
    /#
        assert(isscriptfunctionptr(&shouldcontinuetacticalwalkpain));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"shouldcontinuetacticalwalkpain", &shouldcontinuetacticalwalkpain);
    /#
        assert(isscriptfunctionptr(&shouldtacticalwalkscan));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"shouldtacticalwalkscan", &shouldtacticalwalkscan);
    /#
        assert(isscriptfunctionptr(&continuetacticalwalkscan));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"continuetacticalwalkscan", &continuetacticalwalkscan);
    /#
        assert(isscriptfunctionptr(&tacticalwalkscanterminate));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"tacticalwalkscanterminate", &tacticalwalkscanterminate);
    /#
        assert(isscriptfunctionptr(&bsmlocomotionhasvalidpaininterrupt));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"bsmlocomotionhasvalidpaininterrupt", &bsmlocomotionhasvalidpaininterrupt);
}

// Namespace archetype_human_locomotion/archetype_human_locomotion
// Params 1, eflags: 0x5 linked
// Checksum 0x50353a50, Offset: 0xd40
// Size: 0x1e
function private tacticalwalkscanterminate(entity) {
    entity.lasttacticalscantime = gettime();
    return 1;
}

// Namespace archetype_human_locomotion/archetype_human_locomotion
// Params 1, eflags: 0x5 linked
// Checksum 0xdfecffab, Offset: 0xd68
// Size: 0x120
function private shouldtacticalwalkscan(entity) {
    if (isdefined(entity.lasttacticalscantime) && entity.lasttacticalscantime + 2000 > gettime()) {
        return 0;
    }
    if (!entity haspath()) {
        return 0;
    }
    if (isdefined(entity.enemy)) {
        return 0;
    }
    if (entity shouldfacemotion()) {
        if (ai::hasaiattribute(entity, "forceTacticalWalk") && !ai::getaiattribute(entity, "forceTacticalWalk")) {
            return 0;
        }
    }
    animation = entity asmgetcurrentdeltaanimation();
    if (isdefined(animation)) {
        animtime = entity getanimtime(animation);
        return (animtime <= 0.05);
    }
    return 0;
}

// Namespace archetype_human_locomotion/archetype_human_locomotion
// Params 1, eflags: 0x5 linked
// Checksum 0xbc1964c2, Offset: 0xe90
// Size: 0x13c
function private continuetacticalwalkscan(entity) {
    if (!entity haspath()) {
        return 0;
    }
    if (isdefined(entity.enemy)) {
        return 0;
    }
    if (entity shouldfacemotion()) {
        if (ai::hasaiattribute(entity, "forceTacticalWalk") && !ai::getaiattribute(entity, "forceTacticalWalk")) {
            return 0;
        }
    }
    animation = entity asmgetcurrentdeltaanimation();
    if (isdefined(animation)) {
        animlength = getanimlength(animation);
        animtime = entity getanimtime(animation) * animlength;
        normalizedtime = (animtime + 0.2) / animlength;
        return (normalizedtime < 1);
    }
    return 0;
}

// Namespace archetype_human_locomotion/archetype_human_locomotion
// Params 1, eflags: 0x5 linked
// Checksum 0x886ae66, Offset: 0xfd8
// Size: 0x76
function private shouldtacticalwalkpain(entity) {
    if ((!isdefined(entity.startpaintime) || entity.startpaintime + 3000 < gettime()) && randomfloat(1) > 0.25) {
        return bsmlocomotionhasvalidpaininterrupt(entity);
    }
    return 0;
}

// Namespace archetype_human_locomotion/archetype_human_locomotion
// Params 1, eflags: 0x5 linked
// Checksum 0x6910df8a, Offset: 0x1058
// Size: 0x1e
function private begintacticalwalkpain(entity) {
    entity.startpaintime = gettime();
    return 1;
}

// Namespace archetype_human_locomotion/archetype_human_locomotion
// Params 1, eflags: 0x5 linked
// Checksum 0x87bcf5a3, Offset: 0x1080
// Size: 0x20
function private shouldcontinuetacticalwalkpain(entity) {
    return entity.startpaintime + 100 >= gettime();
}

// Namespace archetype_human_locomotion/archetype_human_locomotion
// Params 1, eflags: 0x5 linked
// Checksum 0x1d76d2cc, Offset: 0x10a8
// Size: 0x2a
function private bsmlocomotionhasvalidpaininterrupt(entity) {
    return entity hasvalidinterrupt("pain");
}

// Namespace archetype_human_locomotion/archetype_human_locomotion
// Params 1, eflags: 0x5 linked
// Checksum 0x8cbe6edb, Offset: 0x10e0
// Size: 0xd6
function private shouldarriveexposed(behaviortreeentity) {
    if (behaviortreeentity ai::get_behavior_attribute("disablearrivals")) {
        return 0;
    }
    if (behaviortreeentity haspath()) {
        if (isdefined(behaviortreeentity.node) && iscovernode(behaviortreeentity.node) && isdefined(behaviortreeentity.pathgoalpos) && distancesquared(behaviortreeentity.pathgoalpos, behaviortreeentity getnodeoffsetposition(behaviortreeentity.node)) < 8) {
            return 0;
        }
    }
    return 1;
}

// Namespace archetype_human_locomotion/archetype_human_locomotion
// Params 1, eflags: 0x5 linked
// Checksum 0x5fa64b85, Offset: 0x11c0
// Size: 0x32
function private preparetostopnearenemy(behaviortreeentity) {
    behaviortreeentity clearpath();
    behaviortreeentity.keepclaimednode = 1;
}

// Namespace archetype_human_locomotion/archetype_human_locomotion
// Params 1, eflags: 0x5 linked
// Checksum 0x60402099, Offset: 0x1200
// Size: 0x32
function private preparetomoveawayfromnearbyenemy(behaviortreeentity) {
    behaviortreeentity clearpath();
    behaviortreeentity.keepclaimednode = 1;
}

// Namespace archetype_human_locomotion/archetype_human_locomotion
// Params 1, eflags: 0x5 linked
// Checksum 0xb27f8a3c, Offset: 0x1240
// Size: 0x1a2
function private shouldplanarrivalintocover(behaviortreeentity) {
    goingtocovernode = isdefined(behaviortreeentity.node) && iscovernode(behaviortreeentity.node);
    if (!goingtocovernode) {
        return 0;
    }
    if (isdefined(behaviortreeentity.pathgoalpos)) {
        if (isdefined(behaviortreeentity.arrivalfinalpos)) {
            if (behaviortreeentity.arrivalfinalpos != behaviortreeentity.pathgoalpos) {
                return 1;
            } else if (behaviortreeentity.ai.replannedcoverarrival === 0 && isdefined(behaviortreeentity.exitpos) && isdefined(behaviortreeentity.predictedexitpos)) {
                behaviortreeentity.ai.replannedcoverarrival = 1;
                exitdir = vectornormalize(behaviortreeentity.predictedexitpos - behaviortreeentity.exitpos);
                currentdir = vectornormalize(behaviortreeentity.origin - behaviortreeentity.exitpos);
                if (vectordot(exitdir, currentdir) < cos(30)) {
                    behaviortreeentity.predictedarrivaldirectionvalid = 0;
                    return 1;
                }
            }
        }
    }
    return 0;
}

// Namespace archetype_human_locomotion/archetype_human_locomotion
// Params 1, eflags: 0x5 linked
// Checksum 0xc1afc909, Offset: 0x13f0
// Size: 0x12e
function private shouldswitchtotacticalwalkfromrun(behaviortreeentity) {
    if (!behaviortreeentity haspath()) {
        return 0;
    }
    if (ai::hasaiattribute(behaviortreeentity, "forceTacticalWalk") && ai::getaiattribute(behaviortreeentity, "forceTacticalWalk")) {
        return 1;
    }
    goalpos = undefined;
    if (isdefined(behaviortreeentity.arrivalfinalpos)) {
        goalpos = behaviortreeentity.arrivalfinalpos;
    } else {
        goalpos = behaviortreeentity.pathgoalpos;
    }
    if (isdefined(behaviortreeentity.pathstartpos) && isdefined(goalpos)) {
        pathdist = distancesquared(behaviortreeentity.pathstartpos, goalpos);
        if (pathdist < 250 * 250) {
            return 1;
        }
    }
    if (!behaviortreeentity shouldfacemotion()) {
        return 1;
    }
    return 0;
}

// Namespace archetype_human_locomotion/archetype_human_locomotion
// Params 1, eflags: 0x5 linked
// Checksum 0x4213f6ed, Offset: 0x1528
// Size: 0x84
function private humannoncombatlocomotioncondition(behaviortreeentity) {
    if (!behaviortreeentity haspath()) {
        return 0;
    }
    if (isdefined(behaviortreeentity.accuratefire) && behaviortreeentity.accuratefire) {
        return 1;
    }
    if (behaviortreeentity humanshouldsprint()) {
        return 1;
    }
    if (isdefined(behaviortreeentity.enemy)) {
        return 0;
    }
    return 1;
}

// Namespace archetype_human_locomotion/archetype_human_locomotion
// Params 1, eflags: 0x5 linked
// Checksum 0xf3c0d2a8, Offset: 0x15b8
// Size: 0x84
function private humancombatlocomotioncondition(behaviortreeentity) {
    if (!behaviortreeentity haspath()) {
        return 0;
    }
    if (isdefined(behaviortreeentity.accuratefire) && behaviortreeentity.accuratefire) {
        return 0;
    }
    if (behaviortreeentity humanshouldsprint()) {
        return 0;
    }
    if (isdefined(behaviortreeentity.enemy)) {
        return 1;
    }
    return 0;
}

// Namespace archetype_human_locomotion/archetype_human_locomotion
// Params 1, eflags: 0x5 linked
// Checksum 0x336f8601, Offset: 0x1648
// Size: 0xe8
function private combatlocomotionstart(behaviortreeentity) {
    behaviortreeentity setblackboardattribute("_desired_stance", "stand");
    randomchance = randomint(100);
    if (randomchance > 50) {
        behaviortreeentity setblackboardattribute("_run_n_gun_variation", "variation_forward");
        return 1;
    }
    if (randomchance > 25) {
        behaviortreeentity setblackboardattribute("_run_n_gun_variation", "variation_strafe_1");
        return 1;
    }
    behaviortreeentity setblackboardattribute("_run_n_gun_variation", "variation_strafe_2");
    return 1;
}

// Namespace archetype_human_locomotion/archetype_human_locomotion
// Params 1, eflags: 0x5 linked
// Checksum 0xf5de8066, Offset: 0x1738
// Size: 0x106
function private noncombatlocomotionupdate(behaviortreeentity) {
    if (!behaviortreeentity haspath()) {
        return 0;
    }
    if (isdefined(behaviortreeentity.enemy) && !(isdefined(behaviortreeentity.accuratefire) && behaviortreeentity.accuratefire) && !behaviortreeentity humanshouldsprint()) {
        return 0;
    }
    if (!behaviortreeentity asmistransitionrunning()) {
        behaviortreeentity setblackboardattribute("_stance", "stand");
        if (!isdefined(behaviortreeentity.ai.replannedcoverarrival)) {
            behaviortreeentity.ai.replannedcoverarrival = 0;
        }
    } else {
        behaviortreeentity.ai.replannedcoverarrival = undefined;
    }
    return 1;
}

// Namespace archetype_human_locomotion/archetype_human_locomotion
// Params 1, eflags: 0x5 linked
// Checksum 0xe1298aad, Offset: 0x1848
// Size: 0xd4
function private combatlocomotionupdate(behaviortreeentity) {
    if (!behaviortreeentity haspath()) {
        return 0;
    }
    if (behaviortreeentity humanshouldsprint()) {
        return 0;
    }
    if (!behaviortreeentity asmistransitionrunning()) {
        behaviortreeentity setblackboardattribute("_stance", "stand");
        if (!isdefined(behaviortreeentity.replannedcoverarrival)) {
            behaviortreeentity.ai.replannedcoverarrival = 0;
        }
    } else {
        behaviortreeentity.ai.replannedcoverarrival = undefined;
    }
    if (isdefined(behaviortreeentity.enemy)) {
        return 1;
    }
    return 0;
}

// Namespace archetype_human_locomotion/archetype_human_locomotion
// Params 1, eflags: 0x5 linked
// Checksum 0xd7b3daf7, Offset: 0x1928
// Size: 0x38
function private prepareformovement(behaviortreeentity) {
    behaviortreeentity setblackboardattribute("_stance", "stand");
    return 1;
}

// Namespace archetype_human_locomotion/archetype_human_locomotion
// Params 1, eflags: 0x5 linked
// Checksum 0xfa544260, Offset: 0x1968
// Size: 0x32
function private isarrivingfour(arrivalangle) {
    if (arrivalangle >= 45 && arrivalangle <= 120) {
        return 1;
    }
    return 0;
}

// Namespace archetype_human_locomotion/archetype_human_locomotion
// Params 1, eflags: 0x5 linked
// Checksum 0xa79f8dd3, Offset: 0x19a8
// Size: 0x32
function private isarrivingone(arrivalangle) {
    if (arrivalangle >= 120 && arrivalangle <= 165) {
        return 1;
    }
    return 0;
}

// Namespace archetype_human_locomotion/archetype_human_locomotion
// Params 1, eflags: 0x5 linked
// Checksum 0xafe2f435, Offset: 0x19e8
// Size: 0x32
function private isarrivingtwo(arrivalangle) {
    if (arrivalangle >= 165 && arrivalangle <= 195) {
        return 1;
    }
    return 0;
}

// Namespace archetype_human_locomotion/archetype_human_locomotion
// Params 1, eflags: 0x5 linked
// Checksum 0x30475cd3, Offset: 0x1a28
// Size: 0x32
function private isarrivingthree(arrivalangle) {
    if (arrivalangle >= 195 && arrivalangle <= 240) {
        return 1;
    }
    return 0;
}

// Namespace archetype_human_locomotion/archetype_human_locomotion
// Params 1, eflags: 0x5 linked
// Checksum 0x8b649579, Offset: 0x1a68
// Size: 0x32
function private isarrivingsix(arrivalangle) {
    if (arrivalangle >= 240 && arrivalangle <= 315) {
        return 1;
    }
    return 0;
}

// Namespace archetype_human_locomotion/archetype_human_locomotion
// Params 1, eflags: 0x5 linked
// Checksum 0x859d7c49, Offset: 0x1aa8
// Size: 0x32
function private isfacingfour(facingangle) {
    if (facingangle >= 45 && facingangle <= 135) {
        return 1;
    }
    return 0;
}

// Namespace archetype_human_locomotion/archetype_human_locomotion
// Params 1, eflags: 0x5 linked
// Checksum 0x43a780d0, Offset: 0x1ae8
// Size: 0x32
function private isfacingeight(facingangle) {
    if (facingangle >= -45 && facingangle <= 45) {
        return 1;
    }
    return 0;
}

// Namespace archetype_human_locomotion/archetype_human_locomotion
// Params 1, eflags: 0x5 linked
// Checksum 0x3b5ecb3e, Offset: 0x1b28
// Size: 0x30
function private isfacingseven(facingangle) {
    if (facingangle >= 0 && facingangle <= 90) {
        return 1;
    }
    return 0;
}

// Namespace archetype_human_locomotion/archetype_human_locomotion
// Params 1, eflags: 0x5 linked
// Checksum 0x1386a8d, Offset: 0x1b60
// Size: 0x32
function private isfacingsix(facingangle) {
    if (facingangle >= -135 && facingangle <= -45) {
        return 1;
    }
    return 0;
}

// Namespace archetype_human_locomotion/archetype_human_locomotion
// Params 1, eflags: 0x5 linked
// Checksum 0x3954f94d, Offset: 0x1ba0
// Size: 0x30
function private isfacingnine(facingangle) {
    if (facingangle >= -90 && facingangle <= 0) {
        return 1;
    }
    return 0;
}

// Namespace archetype_human_locomotion/archetype_human_locomotion
// Params 1, eflags: 0x5 linked
// Checksum 0xc7e46b8c, Offset: 0x1bd8
// Size: 0x3fa
function private shouldtacticalarrivecondition(behaviortreeentity) {
    if (getdvarint(#"enabletacticalarrival", 0) != 1) {
        return 0;
    }
    if (!isdefined(behaviortreeentity.node)) {
        return 0;
    }
    if (!(behaviortreeentity.node.type == #"cover left")) {
        return 0;
    }
    stance = behaviortreeentity getblackboardattribute("_arrival_stance");
    if (stance != "stand") {
        return 0;
    }
    arrivaldistance = 35;
    /#
        arrivaldvar = getdvarint(#"tacarrivaldistance", 0);
        if (arrivaldvar != 0) {
            arrivaldistance = arrivaldvar;
        }
    #/
    nodeoffsetposition = behaviortreeentity getnodeoffsetposition(behaviortreeentity.node);
    if (distance(nodeoffsetposition, behaviortreeentity.origin) > arrivaldistance || distance(nodeoffsetposition, behaviortreeentity.origin) < 25) {
        return 0;
    }
    entityangles = vectortoangles(behaviortreeentity.origin - nodeoffsetposition);
    if (abs(behaviortreeentity.node.angles[1] - entityangles[1]) < 60) {
        return 0;
    }
    tacticalfaceangle = behaviortreeentity getblackboardattribute("_tactical_arrival_facing_yaw");
    arrivalangle = behaviortreeentity getblackboardattribute("_locomotion_arrival_yaw");
    if (isarrivingfour(arrivalangle)) {
        if (!isfacingsix(tacticalfaceangle) && !isfacingeight(tacticalfaceangle) && !isfacingfour(tacticalfaceangle)) {
            return 0;
        }
    } else if (isarrivingone(arrivalangle)) {
        if (!isfacingnine(tacticalfaceangle) && !isfacingseven(tacticalfaceangle)) {
            return 0;
        }
    } else if (isarrivingtwo(arrivalangle)) {
        if (!isfacingeight(tacticalfaceangle)) {
            return 0;
        }
    } else if (isarrivingthree(arrivalangle)) {
        if (!isfacingseven(tacticalfaceangle) && !isfacingnine(tacticalfaceangle)) {
            return 0;
        }
    } else if (isarrivingsix(arrivalangle)) {
        if (!isfacingfour(tacticalfaceangle) && !isfacingeight(tacticalfaceangle) && !isfacingsix(tacticalfaceangle)) {
            return 0;
        }
    } else {
        return 0;
    }
    return 1;
}

// Namespace archetype_human_locomotion/archetype_human_locomotion
// Params 0, eflags: 0x5 linked
// Checksum 0x19861863, Offset: 0x1fe0
// Size: 0x3c
function private humanshouldsprint() {
    currentlocomovementtype = self getblackboardattribute("_human_locomotion_movement_type");
    return currentlocomovementtype == "human_locomotion_movement_sprint";
}

// Namespace archetype_human_locomotion/archetype_human_locomotion
// Params 2, eflags: 0x5 linked
// Checksum 0xf81250e9, Offset: 0x2028
// Size: 0x53c
function private planhumanarrivalatcover(behaviortreeentity, arrivalanim) {
    if (behaviortreeentity ai::get_behavior_attribute("disablearrivals")) {
        return 0;
    }
    behaviortreeentity setblackboardattribute("_desired_stance", "stand");
    if (!isdefined(arrivalanim)) {
        return 0;
    }
    if (isdefined(behaviortreeentity.node) && isdefined(behaviortreeentity.pathgoalpos)) {
        if (!iscovernode(behaviortreeentity.node)) {
            return 0;
        }
        nodeoffsetposition = behaviortreeentity getnodeoffsetposition(behaviortreeentity.node);
        if (nodeoffsetposition != behaviortreeentity.pathgoalpos) {
            return 0;
        }
        if (isdefined(arrivalanim)) {
            isright = behaviortreeentity.node.type == #"cover right";
            splittime = getarrivalsplittime(arrivalanim, isright);
            issplitarrival = splittime < 1;
            nodeapproachyaw = behaviortreeentity getnodeoffsetangles(behaviortreeentity.node)[1];
            angle = (0, nodeapproachyaw - getangledelta(arrivalanim), 0);
            if (issplitarrival) {
                forwarddir = anglestoforward(angle);
                rightdir = anglestoright(angle);
                animlength = getanimlength(arrivalanim);
                movedelta = getmovedelta(arrivalanim, 0, (animlength - 0.2) / animlength);
                premovedelta = getmovedelta(arrivalanim, 0, splittime);
                postmovedelta = movedelta - premovedelta;
                forward = vectorscale(forwarddir, postmovedelta[0]);
                right = vectorscale(rightdir, postmovedelta[1]);
                coverenterpos = nodeoffsetposition - forward + right;
                postenterpos = coverenterpos;
                forward = vectorscale(forwarddir, premovedelta[0]);
                right = vectorscale(rightdir, premovedelta[1]);
                coverenterpos = coverenterpos - forward + right;
                /#
                    recordline(postenterpos, nodeoffsetposition, (1, 0.5, 0), "<unknown string>", behaviortreeentity);
                    recordline(coverenterpos, postenterpos, (1, 0.5, 0), "<unknown string>", behaviortreeentity);
                #/
                if (!behaviortreeentity maymovefrompointtopoint(postenterpos, nodeoffsetposition, 1, 0)) {
                    return 0;
                }
                if (!behaviortreeentity maymovefrompointtopoint(coverenterpos, postenterpos, 1, 0)) {
                    return 0;
                }
            } else {
                forwarddir = anglestoforward(angle);
                rightdir = anglestoright(angle);
                movedeltaarray = getmovedelta(arrivalanim);
                forward = vectorscale(forwarddir, movedeltaarray[0]);
                right = vectorscale(rightdir, movedeltaarray[1]);
                coverenterpos = nodeoffsetposition - forward + right;
                if (!behaviortreeentity maymovefrompointtopoint(coverenterpos, nodeoffsetposition, 1, 1)) {
                    return 0;
                }
            }
            if (!checkcoverarrivalconditions(coverenterpos, nodeoffsetposition)) {
                return 0;
            }
            if (ispointonnavmesh(coverenterpos, behaviortreeentity)) {
                /#
                    recordcircle(coverenterpos, 2, (1, 0, 0), "<unknown string>", behaviortreeentity);
                #/
                behaviortreeentity function_a57c34b7(coverenterpos, behaviortreeentity.pathgoalpos);
                return 1;
            }
        }
    }
    return 0;
}

// Namespace archetype_human_locomotion/archetype_human_locomotion
// Params 2, eflags: 0x5 linked
// Checksum 0x2d3d570a, Offset: 0x2570
// Size: 0x2f4
function private checkcoverarrivalconditions(coverenterpos, coverpos) {
    distsqtonode = distancesquared(self.origin, coverpos);
    distsqfromnodetoenterpos = distancesquared(coverpos, coverenterpos);
    awayfromenterpos = distsqtonode >= distsqfromnodetoenterpos + 150;
    if (!awayfromenterpos) {
        return 0;
    }
    trace = groundtrace(coverenterpos + vectorscale((0, 0, 1), 72), coverenterpos + vectorscale((0, 0, -1), 72), 0, 0, 0);
    if (isdefined(trace[#"position"]) && abs(trace[#"position"][2] - coverpos[2]) > 30) {
        /#
            if (getdvarint(#"ai_debugarrivals", 0)) {
                recordcircle(coverenterpos, 1, (1, 0, 0), "<unknown string>");
                record3dtext("<unknown string>", coverenterpos, (1, 0, 0), "<unknown string>", undefined, 0.4);
                recordcircle(trace[#"position"], 1, (1, 0, 0), "<unknown string>");
                record3dtext("<unknown string>" + int(abs(trace[#"position"][2] - coverpos[2])), trace[#"position"] + vectorscale((0, 0, 1), 5), (1, 0, 0), "<unknown string>", undefined, 0.4);
                record3dtext("<unknown string>" + 30, trace[#"position"], (1, 0, 0), "<unknown string>", undefined, 0.4);
                recordline(coverenterpos, trace[#"position"], (1, 0, 0), "<unknown string>");
            }
        #/
        return 0;
    }
    return 1;
}

// Namespace archetype_human_locomotion/archetype_human_locomotion
// Params 2, eflags: 0x5 linked
// Checksum 0xad8d39ef, Offset: 0x2870
// Size: 0x102
function private getarrivalsplittime(arrivalanim, isright) {
    if (!isdefined(level.animarrivalsplittimes)) {
        level.animarrivalsplittimes = [];
    }
    if (isdefined(level.animarrivalsplittimes[arrivalanim])) {
        return level.animarrivalsplittimes[arrivalanim];
    }
    bestsplit = -1;
    if (animhasnotetrack(arrivalanim, "cover_split")) {
        times = getnotetracktimes(arrivalanim, "cover_split");
        /#
            assert(times.size > 0);
        #/
        bestsplit = times[0];
    } else {
        bestsplit = 0.4;
    }
    level.animarrivalsplittimes[arrivalanim] = bestsplit;
    return bestsplit;
}

// Namespace archetype_human_locomotion/archetype_human_locomotion
// Params 2, eflags: 0x4
// Checksum 0xd054026a, Offset: 0x2980
// Size: 0x9a
function private deltarotate(delta, yaw) {
    cosine = cos(yaw);
    sine = sin(yaw);
    return (delta[0] * cosine - delta[1] * sine, delta[1] * cosine + delta[0] * sine, 0);
}

