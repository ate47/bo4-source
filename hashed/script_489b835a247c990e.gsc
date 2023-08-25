// Atian COD Tools GSC decompiler test
#include scripts/core_common/math_shared.gsc;
#include scripts/core_common/ai/archetype_utility.gsc;
#include script_4a3f9b8905878272;
#include script_3aa0f32b70d4f7cb;
#include script_178024232e91b0a1;
#include script_caf007e2a98afa2;

#namespace aiutility;

// Namespace aiutility/namespace_9e06515
// Params 0, eflags: 0x2
// Checksum 0x35a059a5, Offset: 0x300
// Size: 0x13c4
function autoexec registerbehaviorscriptfunctions() {
    /#
        assert(iscodefunctionptr(&btapi_locomotionbehaviorcondition));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"btapi_locomotionbehaviorcondition", &btapi_locomotionbehaviorcondition);
    /#
        assert(iscodefunctionptr(&btapi_locomotionbehaviorcondition));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"btapi_locomotionbehaviorcondition", &btapi_locomotionbehaviorcondition);
    /#
        assert(isscriptfunctionptr(&noncombatlocomotioncondition));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"noncombatlocomotioncondition", &noncombatlocomotioncondition);
    /#
        assert(isscriptfunctionptr(&setdesiredstanceformovement));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"setdesiredstanceformovement", &setdesiredstanceformovement);
    /#
        assert(isscriptfunctionptr(&clearpathfromscript));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"clearpathfromscript", &clearpathfromscript);
    /#
        assert(isscriptfunctionptr(&locomotionshouldpatrol));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"locomotionshouldpatrol", &locomotionshouldpatrol);
    /#
        assert(isscriptfunctionptr(&locomotionshouldpatrol));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"locomotionshouldpatrol", &locomotionshouldpatrol);
    /#
        assert(iscodefunctionptr(&btapi_shouldtacticalwalk));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi("btApi_shouldtacticalwalk", &btapi_shouldtacticalwalk);
    /#
        assert(isscriptfunctionptr(&shouldtacticalwalk));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldtacticalwalk", &shouldtacticalwalk);
    /#
        assert(iscodefunctionptr(&btapi_shouldtacticalwalk));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"btapi_shouldtacticalwalk", &btapi_shouldtacticalwalk);
    /#
        assert(isscriptfunctionptr(&shouldtacticalwalk));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"shouldtacticalwalk", &shouldtacticalwalk);
    /#
        assert(isscriptfunctionptr(&shouldadjuststanceattacticalwalk));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldadjuststanceattacticalwalk", &shouldadjuststanceattacticalwalk);
    /#
        assert(isscriptfunctionptr(&adjuststancetofaceenemyinitialize));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"adjuststancetofaceenemyinitialize", &adjuststancetofaceenemyinitialize);
    /#
        assert(isscriptfunctionptr(&adjuststancetofaceenemyterminate));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"adjuststancetofaceenemyterminate", &adjuststancetofaceenemyterminate);
    /#
        assert(isscriptfunctionptr(&tacticalwalkactionstart));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"tacticalwalkactionstart", &tacticalwalkactionstart);
    /#
        assert(isscriptfunctionptr(&tacticalwalkactionstart));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"tacticalwalkactionstart", &tacticalwalkactionstart);
    /#
        assert(isscriptfunctionptr(&cleararrivalpos));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"cleararrivalpos", &cleararrivalpos);
    /#
        assert(isscriptfunctionptr(&cleararrivalpos));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"cleararrivalpos", &cleararrivalpos);
    /#
        assert(isscriptfunctionptr(&shouldstartarrivalcondition));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldstartarrival", &shouldstartarrivalcondition);
    /#
        assert(isscriptfunctionptr(&shouldstartarrivalcondition));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"shouldstartarrival", &shouldstartarrivalcondition);
    /#
        assert(isscriptfunctionptr(&locomotionshouldtraverse));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"locomotionshouldtraverse", &locomotionshouldtraverse);
    /#
        assert(isscriptfunctionptr(&locomotionshouldtraverse));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"locomotionshouldtraverse", &locomotionshouldtraverse);
    /#
        assert(isscriptfunctionptr(&locomotionshouldparametrictraverse));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"locomotionshouldparametrictraverse", &locomotionshouldparametrictraverse);
    /#
        assert(isscriptfunctionptr(&locomotionshouldparametrictraverse));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"locomotionshouldparametrictraverse", &locomotionshouldparametrictraverse);
    /#
        assert(isscriptfunctionptr(&function_5ef5b35a));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7234c48b18665dc6", &function_5ef5b35a);
    /#
        assert(isscriptfunctionptr(&function_5ef5b35a));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"hash_7234c48b18665dc6", &function_5ef5b35a);
    /#
        assert(isscriptfunctionptr(&function_8a8c5d44));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4c93e133d3b1accc", &function_8a8c5d44);
    /#
        assert(isscriptfunctionptr(&function_8a8c5d44));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"hash_4c93e133d3b1accc", &function_8a8c5d44);
    /#
        assert(isscriptfunctionptr(&traverseactionstart));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"traverseactionstart", &traverseactionstart);
    /#
        assert(isscriptfunctionptr(&wpn_debug_bot_joinleave));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"hash_5d1b3df7dd4e60c0", &wpn_debug_bot_joinleave);
    /#
        assert(isscriptfunctionptr(&traverseactionstart));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"traverseactionstart", &traverseactionstart);
    /#
        assert(isscriptfunctionptr(&wpn_debug_bot_joinleave));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_5d1b3df7dd4e60c0", &wpn_debug_bot_joinleave);
    /#
        assert(!isdefined(&traverseactionstart) || isscriptfunctionptr(&traverseactionstart));
    #/
    /#
        assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
    #/
    /#
        assert(!isdefined(&wpn_debug_bot_joinleave) || isscriptfunctionptr(&wpn_debug_bot_joinleave));
    #/
    behaviortreenetworkutility::registerbehaviortreeaction(#"traverseactionstart", &traverseactionstart, undefined, &wpn_debug_bot_joinleave);
    /#
        assert(isscriptfunctionptr(&traversesetup));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"traversesetup", &traversesetup);
    /#
        assert(isscriptfunctionptr(&traversesetup));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"traversesetup", &traversesetup);
    /#
        assert(isscriptfunctionptr(&disablerepath));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"disablerepath", &disablerepath);
    /#
        assert(isscriptfunctionptr(&enablerepath));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"enablerepath", &enablerepath);
    /#
        assert(isscriptfunctionptr(&canjuke));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"canjuke", &canjuke);
    /#
        assert(isscriptfunctionptr(&choosejukedirection));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"choosejukedirection", &choosejukedirection);
    /#
        assert(isscriptfunctionptr(&locomotionpainbehaviorcondition));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"locomotionpainbehaviorcondition", &locomotionpainbehaviorcondition);
    /#
        assert(isscriptfunctionptr(&locomotionisonstairs));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"locomotionisonstairs", &locomotionisonstairs);
    /#
        assert(isscriptfunctionptr(&locomotionshouldlooponstairs));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"locomotionshouldlooponstairs", &locomotionshouldlooponstairs);
    /#
        assert(isscriptfunctionptr(&locomotionshouldskipstairs));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"locomotionshouldskipstairs", &locomotionshouldskipstairs);
    /#
        assert(isscriptfunctionptr(&locomotionstairsstart));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"locomotionstairsstart", &locomotionstairsstart);
    /#
        assert(isscriptfunctionptr(&locomotionstairsend));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"locomotionstairsend", &locomotionstairsend);
    /#
        assert(isscriptfunctionptr(&delaymovement));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"delaymovement", &delaymovement);
    /#
        assert(isscriptfunctionptr(&delaymovement));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"delaymovement", &delaymovement);
}

// Namespace aiutility/namespace_9e06515
// Params 1, eflags: 0x5 linked
// Checksum 0x51db5d78, Offset: 0x16d0
// Size: 0x90
function private locomotionisonstairs(behaviortreeentity) {
    startnode = behaviortreeentity.traversestartnode;
    if (isdefined(startnode) && behaviortreeentity shouldstarttraversal()) {
        if (isdefined(startnode.animscript) && issubstr(tolower(startnode.animscript), "stairs")) {
            return 1;
        }
    }
    return 0;
}

// Namespace aiutility/namespace_9e06515
// Params 1, eflags: 0x5 linked
// Checksum 0x694f31ad, Offset: 0x1768
// Size: 0x150
function private locomotionshouldskipstairs(behaviortreeentity) {
    /#
        assert(isdefined(behaviortreeentity._stairsstartnode) && isdefined(behaviortreeentity._stairsendnode));
    #/
    numtotalsteps = behaviortreeentity getblackboardattribute("_staircase_num_total_steps");
    stepssofar = behaviortreeentity getblackboardattribute("_staircase_num_steps");
    direction = behaviortreeentity getblackboardattribute("_staircase_direction");
    if (direction != "staircase_up") {
        return 0;
    }
    numoutsteps = 2;
    totalstepswithoutout = numtotalsteps - numoutsteps;
    if (stepssofar >= totalstepswithoutout) {
        return 0;
    }
    remainingsteps = totalstepswithoutout - stepssofar;
    if (remainingsteps >= 3 || remainingsteps >= 6 || remainingsteps >= 8) {
        return 1;
    }
    return 0;
}

// Namespace aiutility/namespace_9e06515
// Params 1, eflags: 0x5 linked
// Checksum 0xfbd44fea, Offset: 0x18c0
// Size: 0x19c
function private locomotionshouldlooponstairs(behaviortreeentity) {
    /#
        assert(isdefined(behaviortreeentity._stairsstartnode) && isdefined(behaviortreeentity._stairsendnode));
    #/
    numtotalsteps = behaviortreeentity getblackboardattribute("_staircase_num_total_steps");
    stepssofar = behaviortreeentity getblackboardattribute("_staircase_num_steps");
    exittype = behaviortreeentity getblackboardattribute("_staircase_exit_type");
    direction = behaviortreeentity getblackboardattribute("_staircase_direction");
    numoutsteps = 2;
    if (direction == "staircase_up") {
        switch (exittype) {
        case #"staircase_up_exit_l_3_stairs":
        case #"staircase_up_exit_r_3_stairs":
            numoutsteps = 3;
            break;
        case #"staircase_up_exit_r_4_stairs":
        case #"staircase_up_exit_l_4_stairs":
            numoutsteps = 4;
            break;
        }
    }
    if (stepssofar >= numtotalsteps - numoutsteps) {
        behaviortreeentity setstairsexittransform();
        return 0;
    }
    return 1;
}

// Namespace aiutility/namespace_9e06515
// Params 1, eflags: 0x5 linked
// Checksum 0x22a422f0, Offset: 0x1a68
// Size: 0x3a0
function private locomotionstairsstart(behaviortreeentity) {
    startnode = behaviortreeentity.traversestartnode;
    endnode = behaviortreeentity.traverseendnode;
    /#
        assert(isdefined(startnode) && isdefined(endnode));
    #/
    behaviortreeentity._stairsstartnode = startnode;
    behaviortreeentity._stairsendnode = endnode;
    if (startnode.type == #"begin") {
        direction = "staircase_down";
    } else {
        direction = "staircase_up";
    }
    behaviortreeentity setblackboardattribute("_staircase_type", behaviortreeentity._stairsstartnode.animscript);
    behaviortreeentity setblackboardattribute("_staircase_state", "staircase_start");
    behaviortreeentity setblackboardattribute("_staircase_direction", direction);
    numtotalsteps = undefined;
    if (isdefined(startnode.script_int)) {
        numtotalsteps = int(endnode.script_int);
    } else if (isdefined(endnode.script_int)) {
        numtotalsteps = int(endnode.script_int);
    }
    /#
        assert(isdefined(numtotalsteps) && isint(numtotalsteps) && numtotalsteps > 0);
    #/
    behaviortreeentity setblackboardattribute("_staircase_num_total_steps", numtotalsteps);
    behaviortreeentity setblackboardattribute("_staircase_num_steps", 0);
    exittype = undefined;
    if (direction == "staircase_up") {
        switch (int(behaviortreeentity._stairsstartnode.script_int) % 4) {
        case 0:
            exittype = "staircase_up_exit_r_3_stairs";
            break;
        case 1:
            exittype = "staircase_up_exit_r_4_stairs";
            break;
        case 2:
            exittype = "staircase_up_exit_l_3_stairs";
            break;
        case 3:
            exittype = "staircase_up_exit_l_4_stairs";
            break;
        }
    } else {
        switch (int(behaviortreeentity._stairsstartnode.script_int) % 2) {
        case 0:
            exittype = "staircase_down_exit_l_2_stairs";
            break;
        case 1:
            exittype = "staircase_down_exit_r_2_stairs";
            break;
        }
    }
    behaviortreeentity setblackboardattribute("_staircase_exit_type", exittype);
    return 1;
}

// Namespace aiutility/namespace_9e06515
// Params 1, eflags: 0x4
// Checksum 0xd9bcc4cb, Offset: 0x1e10
// Size: 0x64
function private locomotionstairloopstart(behaviortreeentity) {
    /#
        assert(isdefined(behaviortreeentity._stairsstartnode) && isdefined(behaviortreeentity._stairsendnode));
    #/
    behaviortreeentity setblackboardattribute("_staircase_state", "staircase_loop");
}

// Namespace aiutility/namespace_9e06515
// Params 1, eflags: 0x5 linked
// Checksum 0xc39986c1, Offset: 0x1e80
// Size: 0x4c
function private locomotionstairsend(behaviortreeentity) {
    behaviortreeentity setblackboardattribute("_staircase_state", undefined);
    behaviortreeentity setblackboardattribute("_staircase_direction", undefined);
}

// Namespace aiutility/namespace_9e06515
// Params 1, eflags: 0x5 linked
// Checksum 0x68ed932b, Offset: 0x1ed8
// Size: 0x44
function private locomotionpainbehaviorcondition(entity) {
    return entity haspath() && entity hasvalidinterrupt("pain");
}

// Namespace aiutility/namespace_9e06515
// Params 1, eflags: 0x1 linked
// Checksum 0x8e5c9b0d, Offset: 0x1f28
// Size: 0x24
function clearpathfromscript(behaviortreeentity) {
    behaviortreeentity clearpath();
}

// Namespace aiutility/namespace_9e06515
// Params 1, eflags: 0x5 linked
// Checksum 0x4035587, Offset: 0x1f58
// Size: 0x6c
function private noncombatlocomotioncondition(behaviortreeentity) {
    if (!behaviortreeentity haspath()) {
        return 0;
    }
    if (isdefined(behaviortreeentity.accuratefire) && behaviortreeentity.accuratefire) {
        return 1;
    }
    if (isdefined(behaviortreeentity.enemy)) {
        return 0;
    }
    return 1;
}

// Namespace aiutility/namespace_9e06515
// Params 1, eflags: 0x4
// Checksum 0x484be655, Offset: 0x1fd0
// Size: 0x68
function private combatlocomotioncondition(behaviortreeentity) {
    if (!behaviortreeentity haspath()) {
        return 0;
    }
    if (isdefined(behaviortreeentity.accuratefire) && behaviortreeentity.accuratefire) {
        return 0;
    }
    if (isdefined(behaviortreeentity.enemy)) {
        return 1;
    }
    return 0;
}

// Namespace aiutility/namespace_9e06515
// Params 1, eflags: 0x5 linked
// Checksum 0x691c16b, Offset: 0x2040
// Size: 0x5c
function private setdesiredstanceformovement(behaviortreeentity) {
    if (behaviortreeentity getblackboardattribute("_stance") != "stand") {
        behaviortreeentity setblackboardattribute("_desired_stance", "stand");
    }
}

// Namespace aiutility/namespace_9e06515
// Params 1, eflags: 0x5 linked
// Checksum 0xbe7e677d, Offset: 0x20a8
// Size: 0x7c
function private locomotionshouldtraverse(behaviortreeentity) {
    startnode = behaviortreeentity.traversestartnode;
    if (isdefined(startnode) && behaviortreeentity shouldstarttraversal()) {
        /#
            record3dtext("<unknown string>", self.origin, (1, 0, 0), "<unknown string>");
        #/
        return 1;
    }
    return 0;
}

// Namespace aiutility/namespace_9e06515
// Params 1, eflags: 0x5 linked
// Checksum 0x36855df2, Offset: 0x2130
// Size: 0xa4
function private locomotionshouldparametrictraverse(entity) {
    startnode = entity.traversestartnode;
    if (isdefined(startnode) && entity shouldstarttraversal()) {
        traversaltype = entity getblackboardattribute("_parametric_traversal_type");
        /#
            record3dtext("<unknown string>", self.origin, (1, 0, 0), "<unknown string>");
        #/
        return (traversaltype != "unknown_traversal");
    }
    return 0;
}

// Namespace aiutility/namespace_9e06515
// Params 1, eflags: 0x5 linked
// Checksum 0x2c577854, Offset: 0x21e0
// Size: 0x7c
function private function_5ef5b35a(behaviortreeentity) {
    startnode = behaviortreeentity.traversestartnode;
    if (isdefined(startnode) && behaviortreeentity function_420d1e6b()) {
        /#
            record3dtext("<unknown string>", self.origin, (1, 0, 0), "<unknown string>");
        #/
        return 1;
    }
    return 0;
}

// Namespace aiutility/namespace_9e06515
// Params 1, eflags: 0x5 linked
// Checksum 0xac045dc6, Offset: 0x2268
// Size: 0xa4
function private function_8a8c5d44(entity) {
    startnode = entity.traversestartnode;
    if (isdefined(startnode) && entity function_420d1e6b()) {
        traversaltype = entity getblackboardattribute("_parametric_traversal_type");
        /#
            record3dtext("<unknown string>", self.origin, (1, 0, 0), "<unknown string>");
        #/
        return (traversaltype != "unknown_traversal");
    }
    return 0;
}

// Namespace aiutility/namespace_9e06515
// Params 1, eflags: 0x5 linked
// Checksum 0xb892d16d, Offset: 0x2318
// Size: 0x68
function private traversesetup(behaviortreeentity) {
    behaviortreeentity setblackboardattribute("_stance", "stand");
    behaviortreeentity setblackboardattribute("_traversal_type", behaviortreeentity.traversestartnode.animscript);
    return 1;
}

// Namespace aiutility/namespace_9e06515
// Params 2, eflags: 0x1 linked
// Checksum 0x7dcfa62e, Offset: 0x2388
// Size: 0x210
function traverseactionstart(behaviortreeentity, asmstatename) {
    traversesetup(behaviortreeentity);
    if (!isdefined(asmstatename) && isdefined(self.ai.var_2b570fa6)) {
        asmstatename = self.ai.var_2b570fa6;
    }
    behaviortreeentity.var_efe0efe7 = behaviortreeentity function_b7350442();
    behaviortreeentity.var_846d7e33 = behaviortreeentity function_f650e40b();
    behaviortreeentity allowpitchangle(0);
    behaviortreeentity clearpitchorient();
    /#
        result = behaviortreeentity astsearch(asmstatename);
        if (!isdefined(result[#"animation"])) {
            record3dtext("<unknown string>", self.origin + vectorscale((0, 0, 1), 16), (1, 0, 0), "<unknown string>");
        } else {
            record3dtext("<unknown string>" + (ishash(result[#"animation"]) ? function_9e72a96(result[#"animation"]) : result[#"animation"]), self.origin + vectorscale((0, 0, 1), 16), (1, 0, 0), "<unknown string>");
        }
    #/
    animationstatenetworkutility::requeststate(behaviortreeentity, asmstatename);
    return 5;
}

// Namespace aiutility/namespace_9e06515
// Params 2, eflags: 0x1 linked
// Checksum 0x7d3da67, Offset: 0x25a0
// Size: 0x96
function wpn_debug_bot_joinleave(behaviortreeentity, asmstatename) {
    behaviortreeentity allowpitchangle(isdefined(behaviortreeentity.var_efe0efe7) && behaviortreeentity.var_efe0efe7);
    if (isdefined(behaviortreeentity.var_846d7e33) && behaviortreeentity.var_846d7e33) {
        behaviortreeentity setpitchorient();
    }
    behaviortreeentity.var_efe0efe7 = undefined;
    behaviortreeentity.var_846d7e33 = undefined;
    return 4;
}

// Namespace aiutility/namespace_9e06515
// Params 1, eflags: 0x5 linked
// Checksum 0x9c7cbe99, Offset: 0x2640
// Size: 0x1a
function private disablerepath(entity) {
    entity.disablerepath = 1;
}

// Namespace aiutility/namespace_9e06515
// Params 1, eflags: 0x5 linked
// Checksum 0x3024bb5e, Offset: 0x2668
// Size: 0x1a
function private enablerepath(entity) {
    entity.disablerepath = 0;
}

// Namespace aiutility/namespace_9e06515
// Params 1, eflags: 0x1 linked
// Checksum 0xb9312f44, Offset: 0x2690
// Size: 0x2e
function shouldstartarrivalcondition(behaviortreeentity) {
    if (behaviortreeentity shouldstartarrival()) {
        return 1;
    }
    return 0;
}

// Namespace aiutility/namespace_9e06515
// Params 1, eflags: 0x1 linked
// Checksum 0x3b19f646, Offset: 0x26c8
// Size: 0x58
function cleararrivalpos(behaviortreeentity) {
    if (!isdefined(behaviortreeentity.isarrivalpending) || isdefined(behaviortreeentity.isarrivalpending) && behaviortreeentity.isarrivalpending) {
        self function_d4c687c9();
    }
    return 1;
}

// Namespace aiutility/namespace_9e06515
// Params 1, eflags: 0x1 linked
// Checksum 0xa196adb1, Offset: 0x2728
// Size: 0x48
function delaymovement(entity) {
    entity pathmode("move delayed", 0, randomfloatrange(1, 2));
    return 1;
}

// Namespace aiutility/namespace_9e06515
// Params 1, eflags: 0x5 linked
// Checksum 0xf29be643, Offset: 0x2778
// Size: 0x50
function private shouldadjuststanceattacticalwalk(behaviortreeentity) {
    stance = behaviortreeentity getblackboardattribute("_stance");
    if (stance != "stand") {
        return 1;
    }
    return 0;
}

// Namespace aiutility/namespace_9e06515
// Params 1, eflags: 0x5 linked
// Checksum 0xb44cf945, Offset: 0x27d0
// Size: 0x60
function private adjuststancetofaceenemyinitialize(behaviortreeentity) {
    behaviortreeentity.newenemyreaction = 0;
    behaviortreeentity setblackboardattribute("_desired_stance", "stand");
    behaviortreeentity orientmode("face enemy");
    return 1;
}

// Namespace aiutility/namespace_9e06515
// Params 1, eflags: 0x5 linked
// Checksum 0x5734c22d, Offset: 0x2838
// Size: 0x34
function private adjuststancetofaceenemyterminate(behaviortreeentity) {
    behaviortreeentity setblackboardattribute("_stance", "stand");
}

// Namespace aiutility/namespace_9e06515
// Params 1, eflags: 0x5 linked
// Checksum 0x1f0e4168, Offset: 0x2878
// Size: 0xa0
function private tacticalwalkactionstart(behaviortreeentity) {
    cleararrivalpos(behaviortreeentity);
    resetcoverparameters(behaviortreeentity);
    setcanbeflanked(behaviortreeentity, 0);
    behaviortreeentity setblackboardattribute("_stance", "stand");
    behaviortreeentity orientmode("face enemy");
    return 1;
}

// Namespace aiutility/namespace_9e06515
// Params 4, eflags: 0x5 linked
// Checksum 0x85737082, Offset: 0x2920
// Size: 0x134
function private validjukedirection(entity, var_1a55c5d2, forwardoffset, lateraloffset) {
    jukenavmeshthreshold = 6;
    forwardposition = entity.origin + lateraloffset + forwardoffset;
    backwardposition = entity.origin + lateraloffset - forwardoffset;
    forwardpositionvalid = ispointonnavmesh(forwardposition, entity) && tracepassedonnavmesh(entity.origin, forwardposition);
    backwardpositionvalid = ispointonnavmesh(backwardposition, entity) && tracepassedonnavmesh(entity.origin, backwardposition);
    if (!isdefined(entity.ignorebackwardposition)) {
        return (forwardpositionvalid && backwardpositionvalid);
    } else {
        return forwardpositionvalid;
    }
    return 0;
}

// Namespace aiutility/namespace_9e06515
// Params 3, eflags: 0x1 linked
// Checksum 0x46f5fa11, Offset: 0x2a60
// Size: 0x2d4
function calculatejukedirection(entity, entityradius, jukedistance) {
    jukenavmeshthreshold = 30;
    defaultdirection = "forward";
    if (isdefined(entity.var_35549bb5)) {
        defaultdirection = entity.var_35549bb5;
    }
    if (isdefined(entity.enemy)) {
        navmeshposition = getclosestpointonnavmesh(entity.origin, jukenavmeshthreshold);
        if (!isvec(navmeshposition)) {
            return defaultdirection;
        }
        vectortoenemy = entity.enemy.origin - entity.origin;
        vectortoenemyangles = vectortoangles(vectortoenemy);
        forwarddistance = anglestoforward(vectortoenemyangles) * entityradius;
        rightjukedistance = anglestoright(vectortoenemyangles) * jukedistance;
        preferleft = undefined;
        if (entity haspath()) {
            rightposition = entity.origin + rightjukedistance;
            leftposition = entity.origin - rightjukedistance;
            preferleft = distancesquared(leftposition, entity.pathgoalpos) <= distancesquared(rightposition, entity.pathgoalpos);
        } else {
            preferleft = math::cointoss();
        }
        if (preferleft) {
            if (validjukedirection(entity, navmeshposition, forwarddistance, rightjukedistance * -1)) {
                return "left";
            } else if (validjukedirection(entity, navmeshposition, forwarddistance, rightjukedistance)) {
                return "right";
            }
        } else if (validjukedirection(entity, navmeshposition, forwarddistance, rightjukedistance)) {
            return "right";
        } else if (validjukedirection(entity, navmeshposition, forwarddistance, rightjukedistance * -1)) {
            return "left";
        }
    }
    return defaultdirection;
}

// Namespace aiutility/namespace_9e06515
// Params 1, eflags: 0x5 linked
// Checksum 0x8634e656, Offset: 0x2d40
// Size: 0x82
function private calculatedefaultjukedirection(entity) {
    jukedistance = 30;
    entityradius = 15;
    if (isdefined(entity.jukedistance)) {
        jukedistance = entity.jukedistance;
    }
    if (isdefined(entity.entityradius)) {
        entityradius = entity.entityradius;
    }
    return calculatejukedirection(entity, entityradius, jukedistance);
}

// Namespace aiutility/namespace_9e06515
// Params 1, eflags: 0x1 linked
// Checksum 0x2cc1c9ab, Offset: 0x2dd0
// Size: 0xbc
function canjuke(entity) {
    if (isdefined(entity.jukemaxdistance) && isdefined(entity.enemy)) {
        maxdistsquared = entity.jukemaxdistance * entity.jukemaxdistance;
        if (distance2dsquared(entity.origin, entity.enemy.origin) > maxdistsquared) {
            return 0;
        }
    }
    jukedirection = calculatedefaultjukedirection(entity);
    return jukedirection != "forward";
}

// Namespace aiutility/namespace_9e06515
// Params 1, eflags: 0x1 linked
// Checksum 0xf354215, Offset: 0x2e98
// Size: 0x4c
function choosejukedirection(entity) {
    jukedirection = calculatedefaultjukedirection(entity);
    entity setblackboardattribute("_juke_direction", jukedirection);
}

