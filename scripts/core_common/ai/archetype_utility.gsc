#using scripts\core_common\ai\archetype_aivsaimelee;
#using scripts\core_common\array_shared;
#using scripts\core_common\ai\archetype_mocomps_utility;
#using scripts\core_common\ai\systems\shared;
#using scripts\core_common\ai\systems\gib;
#using scripts\core_common\ai\systems\behavior_tree_utility;
#using scripts\core_common\ai\systems\behavior_state_machine;
#using scripts\core_common\ai\systems\ai_interface;
#using scripts\core_common\ai_shared;

#namespace aiutility;

// Namespace aiutility/archetype_utility
// Params 0, eflags: 0x2
// Checksum 0xba68f7e7, Offset: 0x7f0
// Size: 0x21f4
function autoexec registerbehaviorscriptfunctions() {
    assert(iscodefunctionptr(&btapi_forceragdoll));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"btapi_forceragdoll", &btapi_forceragdoll);
    assert(iscodefunctionptr(&btapi_hasammo));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"btapi_hasammo", &btapi_hasammo);
    assert(iscodefunctionptr(&btapi_haslowammo));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"btapi_haslowammo", &btapi_haslowammo);
    assert(iscodefunctionptr(&btapi_hasenemy));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"btapi_hasenemy", &btapi_hasenemy);
    assert(iscodefunctionptr(&btapi_issafefromgrenades));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"btapi_issafefromgrenades", &btapi_issafefromgrenades);
    assert(isscriptfunctionptr(&issafefromgrenades));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"issafefromgrenades", &issafefromgrenades);
    assert(isscriptfunctionptr(&ingrenadeblastradius));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"ingrenadeblastradius", &ingrenadeblastradius);
    assert(isscriptfunctionptr(&recentlysawenemy));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"recentlysawenemy", &recentlysawenemy);
    assert(isscriptfunctionptr(&shouldbeaggressive));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldbeaggressive", &shouldbeaggressive);
    assert(isscriptfunctionptr(&shouldonlyfireaccurately));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldonlyfireaccurately", &shouldonlyfireaccurately);
    assert(isscriptfunctionptr(&shouldreacttonewenemy));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldreacttonewenemy", &shouldreacttonewenemy);
    assert(isscriptfunctionptr(&shouldreacttonewenemy));
    behaviorstatemachine::registerbsmscriptapiinternal(#"shouldreacttonewenemy", &shouldreacttonewenemy);
    assert(isscriptfunctionptr(&hasweaponmalfunctioned));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hasweaponmalfunctioned", &hasweaponmalfunctioned);
    assert(isscriptfunctionptr(&shouldstopmoving));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldstopmoving", &shouldstopmoving);
    assert(isscriptfunctionptr(&shouldstopmoving));
    behaviorstatemachine::registerbsmscriptapiinternal(#"shouldstopmoving", &shouldstopmoving);
    assert(isscriptfunctionptr(&choosebestcovernodeasap));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"choosebestcovernodeasap", &choosebestcovernodeasap);
    assert(isscriptfunctionptr(&choosebettercoverservicecodeversion));
    behaviortreenetworkutility::registerbehaviortreescriptapi("chooseBetterCoverService", &choosebettercoverservicecodeversion, 1);
    assert(iscodefunctionptr(&btapi_trackcoverparamsservice));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"btapi_trackcoverparamsservice", &btapi_trackcoverparamsservice);
    assert(isscriptfunctionptr(&trackcoverparamsservice));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"trackcoverparamsservice", &trackcoverparamsservice);
    assert(iscodefunctionptr(&btapi_refillammoifneededservice));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"btapi_refillammoifneededservice", &btapi_refillammoifneededservice);
    assert(isscriptfunctionptr(&refillammo));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"refillammoifneededservice", &refillammo);
    assert(isscriptfunctionptr(&trystoppingservice));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"trystoppingservice", &trystoppingservice);
    assert(isscriptfunctionptr(&isfrustrated));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"isfrustrated", &isfrustrated);
    assert(iscodefunctionptr(&btapi_updatefrustrationlevel));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"btapi_updatefrustrationlevel", &btapi_updatefrustrationlevel);
    assert(isscriptfunctionptr(&updatefrustrationlevel));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"updatefrustrationlevel", &updatefrustrationlevel);
    assert(isscriptfunctionptr(&islastknownenemypositionapproachable));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"islastknownenemypositionapproachable", &islastknownenemypositionapproachable);
    assert(isscriptfunctionptr(&tryadvancingonlastknownpositionbehavior));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"tryadvancingonlastknownpositionbehavior", &tryadvancingonlastknownpositionbehavior);
    assert(isscriptfunctionptr(&trygoingtoclosestnodetoenemybehavior));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"trygoingtoclosestnodetoenemybehavior", &trygoingtoclosestnodetoenemybehavior);
    assert(isscriptfunctionptr(&tryrunningdirectlytoenemybehavior));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"tryrunningdirectlytoenemybehavior", &tryrunningdirectlytoenemybehavior);
    assert(isscriptfunctionptr(&flagenemyunattackableservice));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"flagenemyunattackableservice", &flagenemyunattackableservice);
    assert(isscriptfunctionptr(&keepclaimnode));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"keepclaimnode", &keepclaimnode);
    assert(isscriptfunctionptr(&keepclaimnode));
    behaviorstatemachine::registerbsmscriptapiinternal(#"keepclaimnode", &keepclaimnode);
    assert(isscriptfunctionptr(&releaseclaimnode));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"releaseclaimnode", &releaseclaimnode);
    assert(isscriptfunctionptr(&releaseclaimnode));
    behaviorstatemachine::registerbsmscriptapiinternal(#"releaseclaimnode", &releaseclaimnode);
    assert(isscriptfunctionptr(&scriptstartragdoll));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"startragdoll", &scriptstartragdoll);
    assert(isscriptfunctionptr(&notstandingcondition));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"notstandingcondition", &notstandingcondition);
    assert(isscriptfunctionptr(&notcrouchingcondition));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"notcrouchingcondition", &notcrouchingcondition);
    assert(isscriptfunctionptr(&meleeacquiremutex));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"meleeacquiremutex", &meleeacquiremutex);
    assert(isscriptfunctionptr(&meleereleasemutex));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"meleereleasemutex", &meleereleasemutex);
    assert(isscriptfunctionptr(&prepareforexposedmelee));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"prepareforexposedmelee", &prepareforexposedmelee);
    assert(isscriptfunctionptr(&cleanupmelee));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"cleanupmelee", &cleanupmelee);
    assert(iscodefunctionptr(&btapi_shouldnormalmelee));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"btapi_shouldnormalmelee", &btapi_shouldnormalmelee);
    assert(iscodefunctionptr(&btapi_shouldnormalmelee));
    behaviorstatemachine::registerbsmscriptapiinternal(#"btapi_shouldnormalmelee", &btapi_shouldnormalmelee);
    assert(isscriptfunctionptr(&shouldnormalmelee));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldnormalmelee", &shouldnormalmelee);
    assert(iscodefunctionptr(&btapi_shouldmelee));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"btapi_shouldmelee", &btapi_shouldmelee);
    assert(iscodefunctionptr(&btapi_shouldmelee));
    behaviorstatemachine::registerbsmscriptapiinternal(#"btapi_shouldmelee", &btapi_shouldmelee);
    assert(isscriptfunctionptr(&shouldmelee));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldmelee", &shouldmelee);
    assert(isscriptfunctionptr(&shouldmelee));
    behaviorstatemachine::registerbsmscriptapiinternal(#"shouldmelee", &shouldmelee);
    assert(isscriptfunctionptr(&hascloseenemytomelee));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hascloseenemymelee", &hascloseenemytomelee);
    assert(isscriptfunctionptr(&isbalconydeath));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"isbalconydeath", &isbalconydeath);
    assert(isscriptfunctionptr(&balconydeath));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"balconydeath", &balconydeath);
    assert(isscriptfunctionptr(&usecurrentposition));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"usecurrentposition", &usecurrentposition);
    assert(isscriptfunctionptr(&isunarmed));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"isunarmed", &isunarmed);
    assert(iscodefunctionptr(&btapi_shouldchargemelee));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"btapi_shouldchargemelee", &btapi_shouldchargemelee);
    assert(isscriptfunctionptr(&shouldchargemelee));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldchargemelee", &shouldchargemelee);
    assert(iscodefunctionptr(&btapi_shouldchargemelee));
    behaviorstatemachine::registerbsmscriptapiinternal(#"btapi_shouldchargemelee", &btapi_shouldchargemelee);
    assert(isscriptfunctionptr(&shouldattackinchargemelee));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldattackinchargemelee", &shouldattackinchargemelee);
    assert(isscriptfunctionptr(&cleanupchargemelee));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"cleanupchargemelee", &cleanupchargemelee);
    assert(isscriptfunctionptr(&cleanupchargemeleeattack));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"cleanupchargemeleeattack", &cleanupchargemeleeattack);
    assert(isscriptfunctionptr(&setupchargemeleeattack));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"setupchargemeleeattack", &setupchargemeleeattack);
    assert(isscriptfunctionptr(&shouldchoosespecialpain));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldchoosespecialpain", &shouldchoosespecialpain);
    assert(isscriptfunctionptr(&function_9b0e7a22));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_50fc16dcf1175197", &function_9b0e7a22);
    assert(isscriptfunctionptr(&shouldchoosespecialpronepain));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldchoosespecialpronepain", &shouldchoosespecialpronepain);
    assert(isscriptfunctionptr(&function_89cb7bfd));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_78675d76c0c51e10", &function_89cb7bfd);
    assert(isscriptfunctionptr(&shouldchoosespecialdeath));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldchoosespecialdeath", &shouldchoosespecialdeath);
    assert(isscriptfunctionptr(&shouldchoosespecialpronedeath));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldchoosespecialpronedeath", &shouldchoosespecialpronedeath);
    assert(isscriptfunctionptr(&setupexplosionanimscale));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"setupexplosionanimscale", &setupexplosionanimscale);
    assert(isscriptfunctionptr(&shouldstealth));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldstealth", &shouldstealth);
    assert(isscriptfunctionptr(&stealthreactcondition));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"stealthreactcondition", &stealthreactcondition);
    assert(isscriptfunctionptr(&locomotionshouldstealth));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"locomotionshouldstealth", &locomotionshouldstealth);
    assert(isscriptfunctionptr(&shouldstealthresume));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldstealthresume", &shouldstealthresume);
    assert(isscriptfunctionptr(&locomotionshouldstealth));
    behaviorstatemachine::registerbsmscriptapiinternal(#"locomotionshouldstealth", &locomotionshouldstealth);
    assert(isscriptfunctionptr(&stealthreactcondition));
    behaviorstatemachine::registerbsmscriptapiinternal(#"stealthreactcondition", &stealthreactcondition);
    assert(isscriptfunctionptr(&stealthreactstart));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"stealthreactstart", &stealthreactstart);
    assert(isscriptfunctionptr(&stealthreactterminate));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"stealthreactterminate", &stealthreactterminate);
    assert(isscriptfunctionptr(&stealthidleterminate));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"stealthidleterminate", &stealthidleterminate);
    assert(iscodefunctionptr(&btapi_isinphalanx));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"btapi_isinphalanx", &btapi_isinphalanx);
    assert(isscriptfunctionptr(&isinphalanx));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"isinphalanx", &isinphalanx);
    assert(isscriptfunctionptr(&isinphalanxstance));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"isinphalanxstance", &isinphalanxstance);
    assert(isscriptfunctionptr(&togglephalanxstance));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"togglephalanxstance", &togglephalanxstance);
    assert(isscriptfunctionptr(&isatattackobject));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"isatattackobject", &isatattackobject);
    assert(isscriptfunctionptr(&shouldattackobject));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldattackobject", &shouldattackobject);
    assert(isscriptfunctionptr(&generictryreacquireservice));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"generictryreacquireservice", &generictryreacquireservice);
    behaviortreenetworkutility::registerbehaviortreeaction(#"defaultaction", undefined, undefined, undefined);
    archetype_aivsaimelee::registeraivsaimeleebehaviorfunctions();
}

// Namespace aiutility/archetype_utility
// Params 0, eflags: 0x5 linked
// Checksum 0xa4de3d3a, Offset: 0x29f0
// Size: 0x162
function private bb_getstairsnumskipsteps() {
    assert(isdefined(self._stairsstartnode) && isdefined(self._stairsendnode));
    numtotalsteps = self getblackboardattribute("_staircase_num_total_steps");
    stepssofar = self getblackboardattribute("_staircase_num_steps");
    direction = self getblackboardattribute("_staircase_direction");
    numoutsteps = 2;
    totalstepswithoutout = numtotalsteps - numoutsteps;
    assert(stepssofar < totalstepswithoutout);
    remainingsteps = totalstepswithoutout - stepssofar;
    if (remainingsteps >= 8) {
        return "staircase_skip_8";
    } else if (remainingsteps >= 6) {
        return "staircase_skip_6";
    }
    assert(remainingsteps >= 3);
    return "staircase_skip_3";
}

// Namespace aiutility/archetype_utility
// Params 0, eflags: 0x5 linked
// Checksum 0xef6b7b6c, Offset: 0x2b60
// Size: 0x264
function private bb_gettraversalheight() {
    entity = self;
    startposition = entity.traversalstartpos;
    endposition = entity.traversalendpos;
    if (isdefined(entity.traveseheightoverride)) {
        /#
            record3dtext("<dev string:x38>" + entity.traveseheightoverride, self.origin + (0, 0, 32), (1, 0, 0), "<dev string:x4c>");
        #/
        return entity.traveseheightoverride;
    }
    if (isdefined(entity.traversemantlenode)) {
        pivotorigin = archetype_mocomps_utility::calculatepivotoriginfromedge(entity, entity.traversemantlenode, entity.origin);
        traversalheight = pivotorigin[2] - (isdefined(entity.var_fad2bca9) && entity.var_fad2bca9 && isdefined(entity.traversalstartpos) ? entity.traversalstartpos[2] : entity.origin[2]);
        /#
            record3dtext("<dev string:x38>" + traversalheight, self.origin + (0, 0, 32), (1, 0, 0), "<dev string:x4c>");
        #/
        return traversalheight;
    } else if (isdefined(startposition) && isdefined(endposition)) {
        traversalheight = endposition[2] - startposition[2];
        if (bb_getparametrictraversaltype() == "jump_across_traversal") {
            traversalheight = abs(traversalheight);
        }
        /#
            record3dtext("<dev string:x38>" + traversalheight, self.origin + (0, 0, 32), (1, 0, 0), "<dev string:x4c>");
        #/
        return traversalheight;
    }
    return 0;
}

// Namespace aiutility/archetype_utility
// Params 0, eflags: 0x5 linked
// Checksum 0x769e4324, Offset: 0x2dd0
// Size: 0x134
function private bb_gettraversalwidth() {
    entity = self;
    startposition = entity.traversalstartpos;
    endposition = entity.traversalendpos;
    if (isdefined(entity.travesewidthoverride)) {
        /#
            record3dtext("<dev string:x55>" + entity.travesewidthoverride, self.origin + (0, 0, 48), (1, 0, 0), "<dev string:x4c>");
        #/
        return entity.travesewidthoverride;
    }
    if (isdefined(startposition) && isdefined(endposition)) {
        var_d4b651b8 = distance2d(startposition, endposition);
        /#
            record3dtext("<dev string:x55>" + var_d4b651b8, self.origin + (0, 0, 48), (1, 0, 0), "<dev string:x4c>");
        #/
        return var_d4b651b8;
    }
    return 0;
}

// Namespace aiutility/archetype_utility
// Params 4, eflags: 0x1 linked
// Checksum 0x56732a42, Offset: 0x2f10
// Size: 0x112
function function_a0d0fc27(entity, startnode, endnode, mantlenode) {
    assert(isdefined(startnode));
    assert(isdefined(endnode));
    assert(isdefined(mantlenode));
    if (!(isdefined(entity.var_20e07206) && entity.var_20e07206)) {
        return;
    }
    if (isdefined(mantlenode.uneven_mantle_traversal) && mantlenode.uneven_mantle_traversal) {
        return;
    }
    heightdiff = abs(endnode.origin[2] - startnode.origin[2]);
    if (heightdiff > 40) {
        mantlenode.uneven_mantle_traversal = 1;
    }
}

// Namespace aiutility/archetype_utility
// Params 4, eflags: 0x1 linked
// Checksum 0x7b4aa76, Offset: 0x3030
// Size: 0x104
function function_b882ba71(entity, startnode, endnode, mantlenode) {
    assert(isdefined(startnode));
    assert(isdefined(endnode));
    assert(isdefined(mantlenode));
    var_3efada15 = abs(startnode.origin[2] - mantlenode.origin[2]);
    var_6d4236a3 = abs(endnode.origin[2] - mantlenode.origin[2]);
    if (var_3efada15 > var_6d4236a3) {
        return var_3efada15;
    }
    return var_6d4236a3;
}

// Namespace aiutility/archetype_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x40f39b85, Offset: 0x3140
// Size: 0x42e
function bb_getparametrictraversaltype() {
    entity = self;
    startposition = entity.traversalstartpos;
    endposition = entity.traversalendpos;
    if (sessionmodeiswarzonegame()) {
        entity.traveseheightoverride = undefined;
    }
    if (isdefined(entity.travesetypeoverride)) {
        return entity.travesetypeoverride;
    }
    if (!isdefined(entity.traversestartnode) || entity.traversestartnode.type != "Volume" || !isdefined(entity.traverseendnode) || entity.traverseendnode.type != "Volume") {
        return "unknown_traversal";
    }
    if (isdefined(entity.traversestartnode) && isdefined(entity.traversemantlenode)) {
        function_a0d0fc27(entity, entity.traversestartnode, entity.traverseendnode, entity.traversemantlenode);
        if (sessionmodeiswarzonegame() && isdefined(entity.traversemantlenode.uneven_mantle_traversal) && entity.traversemantlenode.uneven_mantle_traversal) {
            entity.traveseheightoverride = abs(function_b882ba71(entity, entity.traversestartnode, entity.traverseendnode, entity.traversemantlenode));
        }
        if (isdefined(entity.traversemantlenode.uneven_mantle_traversal) && entity.traversemantlenode.uneven_mantle_traversal && isdefined(entity.var_2c628c0f) && entity.var_2c628c0f) {
            isendpointaboveorsamelevel = startposition[2] < endposition[2];
            traversaltype = "jump_down_mantle_traversal";
            if (isendpointaboveorsamelevel) {
                traversaltype = "jump_up_mantle_traversal";
            }
            if (sessionmodeiswarzonegame()) {
                entity.traveseheightoverride = function_b882ba71(entity, entity.traversestartnode, entity.traverseendnode, entity.traversemantlenode);
                if (traversaltype == "jump_down_mantle_traversal") {
                    entity.traveseheightoverride *= -1;
                }
            }
            return traversaltype;
        }
        return "mantle_traversal";
    }
    if (isdefined(startposition) && isdefined(endposition)) {
        traversaldistance = distance2d(startposition, endposition);
        isendpointaboveorsamelevel = startposition[2] <= endposition[2];
        if (traversaldistance >= 108 && abs(endposition[2] - startposition[2]) <= 100) {
            return "jump_across_traversal";
        }
        if (isendpointaboveorsamelevel) {
            if (isdefined(entity.traverseendnode.hanging_traversal) && entity.traverseendnode.hanging_traversal && isdefined(entity.var_1731eda3) && entity.var_1731eda3) {
                return "jump_up_hanging_traversal";
            } else {
                return "jump_up_traversal";
            }
        }
        return "jump_down_traversal";
    }
    return "unknown_traversal";
}

// Namespace aiutility/archetype_utility
// Params 0, eflags: 0x1 linked
// Checksum 0xc83a34e, Offset: 0x3578
// Size: 0xa
function bb_getawareness() {
    return self.awarenesslevelcurrent;
}

// Namespace aiutility/archetype_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x4b7f790b, Offset: 0x3590
// Size: 0xa
function bb_getawarenessprevious() {
    return self.awarenesslevelprevious;
}

// Namespace aiutility/archetype_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x6dae3713, Offset: 0x35a8
// Size: 0xb2
function function_cc26899f() {
    if (isdefined(self.zombie_move_speed)) {
        if (self.zombie_move_speed == "walk") {
            return "locomotion_speed_walk";
        } else if (self.zombie_move_speed == "run") {
            return "locomotion_speed_run";
        } else if (self.zombie_move_speed == "sprint") {
            return "locomotion_speed_sprint";
        } else if (self.zombie_move_speed == "super_sprint") {
            return "locomotion_speed_super_sprint";
        } else if (self.zombie_move_speed == "super_super_sprint") {
            return "locomotion_speed_super_super_sprint";
        }
    }
    return "locomotion_speed_walk";
}

// Namespace aiutility/archetype_utility
// Params 0, eflags: 0x5 linked
// Checksum 0x685b9669, Offset: 0x3668
// Size: 0xa6
function private bb_getgibbedlimbs() {
    entity = self;
    rightarmgibbed = gibserverutils::isgibbed(entity, 16);
    leftarmgibbed = gibserverutils::isgibbed(entity, 32);
    if (rightarmgibbed && leftarmgibbed) {
        return "both_arms";
    } else if (rightarmgibbed) {
        return "right_arm";
    } else if (leftarmgibbed) {
        return "left_arm";
    }
    return "none";
}

// Namespace aiutility/archetype_utility
// Params 0, eflags: 0x5 linked
// Checksum 0x6a0bcd47, Offset: 0x3718
// Size: 0x102
function private bb_getyawtocovernode() {
    if (!isdefined(self.node)) {
        return 0;
    }
    disttonodesqr = distance2dsquared(self getnodeoffsetposition(self.node), self.origin);
    if (isdefined(self.keepclaimednode) && self.keepclaimednode) {
        if (disttonodesqr > 64 * 64) {
            return 0;
        }
    } else if (disttonodesqr > 24 * 24) {
        return 0;
    }
    angletonode = ceil(angleclamp180(self.angles[1] - self getnodeoffsetangles(self.node)[1]));
    return angletonode;
}

// Namespace aiutility/archetype_utility
// Params 0, eflags: 0x0
// Checksum 0x590445b7, Offset: 0x3828
// Size: 0x84
function bb_gethigheststance() {
    if (self isatcovernodestrict() && self shouldusecovernode()) {
        higheststance = gethighestnodestance(self.node);
        return higheststance;
    }
    return self getblackboardattribute("_stance");
}

// Namespace aiutility/archetype_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x19bafd99, Offset: 0x38b8
// Size: 0xba
function bb_getlocomotionfaceenemyquadrantprevious() {
    if (isdefined(self.prevrelativedir)) {
        direction = self.prevrelativedir;
        switch (direction) {
        case 0:
            return "locomotion_face_enemy_none";
        case 1:
            return "locomotion_face_enemy_front";
        case 2:
            return "locomotion_face_enemy_right";
        case 3:
            return "locomotion_face_enemy_left";
        case 4:
            return "locomotion_face_enemy_back";
        }
    }
    return "locomotion_face_enemy_none";
}

// Namespace aiutility/archetype_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x9db29ee7, Offset: 0x3980
// Size: 0x1a
function bb_getcurrentcovernodetype() {
    return getcovertype(self.node);
}

// Namespace aiutility/archetype_utility
// Params 0, eflags: 0x1 linked
// Checksum 0xc1870dc2, Offset: 0x39a8
// Size: 0x2e
function bb_getcoverconcealed() {
    if (iscoverconcealed(self.node)) {
        return "concealed";
    }
    return "unconcealed";
}

// Namespace aiutility/archetype_utility
// Params 0, eflags: 0x1 linked
// Checksum 0xcddb28a9, Offset: 0x39e0
// Size: 0x6a
function bb_getcurrentlocationcovernodetype() {
    if (isdefined(self.node) && distancesquared(self.origin, self.node.origin) < 48 * 48) {
        return bb_getcurrentcovernodetype();
    }
    return bb_getpreviouscovernodetype();
}

// Namespace aiutility/archetype_utility
// Params 0, eflags: 0x1 linked
// Checksum 0xb0c525fb, Offset: 0x3a58
// Size: 0x2a
function bb_getshouldturn() {
    if (isdefined(self.should_turn) && self.should_turn) {
        return "should_turn";
    }
    return "should_not_turn";
}

// Namespace aiutility/archetype_utility
// Params 0, eflags: 0x1 linked
// Checksum 0xeae9a500, Offset: 0x3a90
// Size: 0x3a
function bb_getarmsposition() {
    if (isdefined(self.zombie_arms_position)) {
        if (self.zombie_arms_position == "up") {
            return "arms_up";
        }
        return "arms_down";
    }
    return "arms_up";
}

// Namespace aiutility/archetype_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x52357467, Offset: 0x3ad8
// Size: 0x1e
function bb_gethaslegsstatus() {
    if (self.missinglegs) {
        return "has_legs_no";
    }
    return "has_legs_yes";
}

// Namespace aiutility/archetype_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x3f90f896, Offset: 0x3b00
// Size: 0x2e
function function_f61d3341() {
    if (gibserverutils::isgibbed(self, 256)) {
        return "has_left_leg_no";
    }
    return "has_left_leg_yes";
}

// Namespace aiutility/archetype_utility
// Params 0, eflags: 0x1 linked
// Checksum 0xbfd04108, Offset: 0x3b38
// Size: 0x2e
function function_9b395e55() {
    if (gibserverutils::isgibbed(self, 128)) {
        return "has_right_leg_no";
    }
    return "has_right_leg_yes";
}

// Namespace aiutility/archetype_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x7cb8e60f, Offset: 0x3b70
// Size: 0x2e
function function_99e55609() {
    if (gibserverutils::isgibbed(self, 32)) {
        return "has_left_arm_no";
    }
    return "has_left_arm_yes";
}

// Namespace aiutility/archetype_utility
// Params 0, eflags: 0x1 linked
// Checksum 0xfc043c2, Offset: 0x3ba8
// Size: 0x2e
function function_aa8f1e69() {
    if (gibserverutils::isgibbed(self, 16)) {
        return "has_right_arm_no";
    }
    return "has_right_arm_yes";
}

// Namespace aiutility/archetype_utility
// Params 0, eflags: 0x1 linked
// Checksum 0xa1253c04, Offset: 0x3be0
// Size: 0x1e
function function_5b03a448() {
    if (isdefined(self.e_grapplee)) {
        return "has_grapplee_yes";
    }
    return "has_grapplee_no";
}

// Namespace aiutility/archetype_utility
// Params 2, eflags: 0x1 linked
// Checksum 0x1f9444d8, Offset: 0x3c08
// Size: 0x16e
function actorgetpredictedyawtoenemy(entity, lookaheadtime) {
    if (isdefined(entity.predictedyawtoenemy) && isdefined(entity.predictedyawtoenemytime) && entity.predictedyawtoenemytime == gettime()) {
        return entity.predictedyawtoenemy;
    }
    selfpredictedpos = entity.origin;
    moveangle = entity.angles[1] + entity getmotionangle();
    selfpredictedpos += (cos(moveangle), sin(moveangle), 0) * 200 * lookaheadtime;
    yaw = vectortoangles(entity lastknownpos(entity.enemy) - selfpredictedpos)[1] - entity.angles[1];
    yaw = absangleclamp360(yaw);
    entity.predictedyawtoenemy = yaw;
    entity.predictedyawtoenemytime = gettime();
    return yaw;
}

// Namespace aiutility/archetype_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x74a18853, Offset: 0x3d80
// Size: 0x5e
function bb_actorispatroling() {
    entity = self;
    if (entity ai::has_behavior_attribute("patrol") && entity ai::get_behavior_attribute("patrol")) {
        return "patrol_enabled";
    }
    return "patrol_disabled";
}

// Namespace aiutility/archetype_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x1ce4b463, Offset: 0x3de8
// Size: 0x32
function bb_actorhasenemy() {
    entity = self;
    if (isdefined(entity.enemy)) {
        return "has_enemy";
    }
    return "no_enemy";
}

// Namespace aiutility/archetype_utility
// Params 0, eflags: 0x1 linked
// Checksum 0xe85625c2, Offset: 0x3e28
// Size: 0x4a
function bb_actorgetenemyyaw() {
    enemy = self.enemy;
    if (!isdefined(enemy)) {
        return 0;
    }
    toenemyyaw = actorgetpredictedyawtoenemy(self, 0.2);
    return toenemyyaw;
}

// Namespace aiutility/archetype_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x6a731d8a, Offset: 0x3e80
// Size: 0xb0
function bb_actorgetperfectenemyyaw() {
    enemy = self.enemy;
    if (!isdefined(enemy)) {
        return 0;
    }
    toenemyyaw = vectortoangles(enemy.origin - self.origin)[1] - self.angles[1];
    toenemyyaw = absangleclamp360(toenemyyaw);
    /#
        recordenttext("<dev string:x68>" + toenemyyaw, self, (1, 0, 0), "<dev string:x75>");
    #/
    return toenemyyaw;
}

// Namespace aiutility/archetype_utility
// Params 0, eflags: 0x1 linked
// Checksum 0xa21e8e23, Offset: 0x3f38
// Size: 0x124
function function_caea19a8() {
    result = self.angles[1];
    v_origin = self geteventpointofinterest();
    if (!isdefined(v_origin) && isdefined(self.ai.var_2a2d6d17)) {
        v_origin = self.ai.var_2a2d6d17.origin;
    }
    if (isdefined(v_origin)) {
        str_typename = self getcurrenteventtypename();
        e_originator = self getcurrenteventoriginator();
        if (str_typename == "bullet" && isdefined(e_originator)) {
            v_origin = e_originator.origin;
        }
        deltaorigin = v_origin - self.origin;
        result = vectortoangles(deltaorigin)[1];
    }
    return result;
}

// Namespace aiutility/archetype_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x9ec53214, Offset: 0x4068
// Size: 0x42
function bb_actorgetreactyaw() {
    return absangleclamp360(self.angles[1] - self getblackboardattribute("_react_yaw_world"));
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xe6088ad3, Offset: 0x40b8
// Size: 0xba
function getangleusingdirection(direction) {
    directionyaw = vectortoangles(direction)[1];
    yawdiff = directionyaw - self.angles[1];
    yawdiff *= 0.00277778;
    flooredyawdiff = floor(yawdiff + 0.5);
    turnangle = (yawdiff - flooredyawdiff) * 360;
    return absangleclamp360(turnangle);
}

// Namespace aiutility/archetype_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x588b17d3, Offset: 0x4180
// Size: 0x13c
function wasatcovernode() {
    if (isdefined(self.prevnode)) {
        if (self.prevnode.type == #"cover left" || self.prevnode.type == #"cover right" || self.prevnode.type == #"cover pillar" || self.prevnode.type == #"cover stand" || self.prevnode.type == #"conceal stand" || self.prevnode.type == #"cover crouch" || self.prevnode.type == #"cover crouch window" || self.prevnode.type == #"conceal crouch") {
            return true;
        }
    }
    return false;
}

// Namespace aiutility/archetype_utility
// Params 2, eflags: 0x1 linked
// Checksum 0xe8b0c578, Offset: 0x42c8
// Size: 0x64e
function bb_getlocomotionexityaw(blackboard, yaw) {
    if (self haspath()) {
        predictedlookaheadinfo = self predictexit();
        status = predictedlookaheadinfo[#"path_prediction_status"];
        if (!isdefined(self.pathgoalpos)) {
            return -1;
        }
        if (status == 3) {
            start = self.origin;
            end = start + vectorscale((0, predictedlookaheadinfo[#"path_prediction_travel_vector"][1], 0), 100);
            angletoexit = vectortoangles(predictedlookaheadinfo[#"path_prediction_travel_vector"])[1];
            exityaw = absangleclamp360(angletoexit - self.prevnode.angles[1]);
            /#
                record3dtext("<dev string:x82>" + int(exityaw), self.origin - (0, 0, 5), (1, 0, 0), "<dev string:x75>", undefined, 0.4);
            #/
            return exityaw;
        } else if (status == 4) {
            start = self.origin;
            end = start + vectorscale((0, predictedlookaheadinfo[#"path_prediction_travel_vector"][1], 0), 100);
            angletoexit = vectortoangles(predictedlookaheadinfo[#"path_prediction_travel_vector"])[1];
            exityaw = absangleclamp360(angletoexit - self.angles[1]);
            /#
                record3dtext("<dev string:x82>" + int(exityaw), self.origin - (0, 0, 5), (1, 0, 0), "<dev string:x75>", undefined, 0.4);
            #/
            return exityaw;
        } else if (status == 0) {
            if (wasatcovernode() && distancesquared(self.prevnode.origin, self.origin) < 25) {
                end = self.pathgoalpos;
                angletodestination = vectortoangles(end - self.origin)[1];
                exityaw = absangleclamp360(angletodestination - self.prevnode.angles[1]);
                /#
                    record3dtext("<dev string:x82>" + int(exityaw), self.origin - (0, 0, 5), (1, 0, 0), "<dev string:x75>", undefined, 0.4);
                #/
                return exityaw;
            }
            start = predictedlookaheadinfo[#"path_prediction_start_point"];
            end = start + predictedlookaheadinfo[#"path_prediction_travel_vector"];
            exityaw = getangleusingdirection(predictedlookaheadinfo[#"path_prediction_travel_vector"]);
            /#
                record3dtext("<dev string:x82>" + int(exityaw), self.origin - (0, 0, 5), (1, 0, 0), "<dev string:x75>", undefined, 0.4);
            #/
            return exityaw;
        } else if (status == 2) {
            if (wasatcovernode() && distancesquared(self.prevnode.origin, self.origin) < 25) {
                end = self.pathgoalpos;
                angletodestination = vectortoangles(end - self.origin)[1];
                exityaw = absangleclamp360(angletodestination - self.prevnode.angles[1]);
                /#
                    record3dtext("<dev string:x82>" + int(exityaw), self.origin - (0, 0, 5), (1, 0, 0), "<dev string:x75>", undefined, 0.4);
                #/
                return exityaw;
            }
            exityaw = getangleusingdirection(vectornormalize(self.pathgoalpos - self.origin));
            /#
                record3dtext("<dev string:x82>" + int(exityaw), self.origin - (0, 0, 5), (1, 0, 0), "<dev string:x75>", undefined, 0.4);
            #/
            return exityaw;
        }
    }
    return -1;
}

// Namespace aiutility/archetype_utility
// Params 0, eflags: 0x1 linked
// Checksum 0xd12c3602, Offset: 0x4920
// Size: 0x14a
function bb_getlocomotionfaceenemyquadrant() {
    /#
        walkstring = getdvarstring(#"tacticalwalkdirection");
        switch (walkstring) {
        case #"right":
            return "<dev string:x8f>";
        case #"left":
            return "<dev string:xad>";
        case #"back":
            return "<dev string:xca>";
        }
    #/
    if (isdefined(self.relativedir)) {
        direction = self.relativedir;
        switch (direction) {
        case 0:
            return "locomotion_face_enemy_front";
        case 1:
            return "locomotion_face_enemy_front";
        case 2:
            return "locomotion_face_enemy_right";
        case 3:
            return "locomotion_face_enemy_left";
        case 4:
            return "locomotion_face_enemy_back";
        }
    }
    return "locomotion_face_enemy_front";
}

// Namespace aiutility/archetype_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x5f4bfade, Offset: 0x4a78
// Size: 0x272
function bb_getlocomotionpaintype() {
    if (self haspath()) {
        predictedlookaheadinfo = self predictpath();
        status = predictedlookaheadinfo[#"path_prediction_status"];
        startpos = self.origin;
        furthestpointtowardsgoalclear = 1;
        if (status == 2) {
            furthestpointalongtowardsgoal = startpos + vectorscale(self.lookaheaddir, 300);
            furthestpointtowardsgoalclear = self findpath(startpos, furthestpointalongtowardsgoal, 0, 0) && self maymovetopoint(furthestpointalongtowardsgoal);
        }
        if (furthestpointtowardsgoalclear) {
            forwarddir = anglestoforward(self.angles);
            possiblepaintypes = [];
            endpos = startpos + vectorscale(forwarddir, 300);
            if (self maymovetopoint(endpos) && self findpath(startpos, endpos, 0, 0)) {
                possiblepaintypes[possiblepaintypes.size] = "locomotion_moving_pain_long";
            }
            endpos = startpos + vectorscale(forwarddir, 200);
            if (self maymovetopoint(endpos) && self findpath(startpos, endpos, 0, 0)) {
                possiblepaintypes[possiblepaintypes.size] = "locomotion_moving_pain_med";
            }
            endpos = startpos + vectorscale(forwarddir, 150);
            if (self maymovetopoint(endpos) && self findpath(startpos, endpos, 0, 0)) {
                possiblepaintypes[possiblepaintypes.size] = "locomotion_moving_pain_short";
            }
            if (possiblepaintypes.size) {
                return array::random(possiblepaintypes);
            }
        }
    }
    return "locomotion_inplace_pain";
}

// Namespace aiutility/archetype_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x96c5a87e, Offset: 0x4cf8
// Size: 0x42
function bb_getlookaheadangle() {
    return absangleclamp360(vectortoangles(self.lookaheaddir)[1] - self.angles[1]);
}

// Namespace aiutility/archetype_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x9d2180c2, Offset: 0x4d48
// Size: 0x1a
function bb_getpreviouscovernodetype() {
    return getcovertype(self.prevnode);
}

// Namespace aiutility/archetype_utility
// Params 0, eflags: 0x1 linked
// Checksum 0xdf11439d, Offset: 0x4d70
// Size: 0x306
function bb_actorgettrackingturnyaw() {
    var_71a0045b = undefined;
    if (isdefined(self.enemy)) {
        if (self cansee(self.enemy)) {
            var_71a0045b = self.enemy.origin;
        } else if (issentient(self.enemy)) {
            if (self.highlyawareradius && distance2dsquared(self.enemy.origin, self.origin) < self.highlyawareradius * self.highlyawareradius) {
                var_71a0045b = self.enemy.origin;
            } else {
                var_18c9035f = self function_18c9035f(self.enemy);
                attackedrecently = self attackedrecently(self.enemy, 2);
                if (attackedrecently && isdefined(var_18c9035f)) {
                    if (self canshoot(var_18c9035f)) {
                        var_71a0045b = self.var_18c9035f;
                    }
                }
                if (!isdefined(var_71a0045b)) {
                    if (issentient(self.enemy)) {
                        lastknownpostime = self lastknowntime(self.enemy);
                        lastknownpos = self lastknownpos(self.enemy);
                    } else {
                        lastknownpostime = gettime();
                        lastknownpos = self.enemy.origin;
                    }
                    if (gettime() <= lastknownpostime + 2) {
                        if (sighttracepassed(self geteye(), lastknownpos, 0, self, self.enemy)) {
                            var_71a0045b = lastknownpos;
                        }
                    }
                }
            }
        }
    } else if (isdefined(self.ai.var_3af1add3)) {
        var_71a0045b = [[ self.ai.var_3af1add3 ]](self);
    } else if (isdefined(self.likelyenemyposition)) {
        if (self canshoot(self.likelyenemyposition)) {
            var_71a0045b = self.likelyenemyposition;
        }
    }
    if (isdefined(var_71a0045b)) {
        turnyaw = absangleclamp360(self.angles[1] - vectortoangles(var_71a0045b - self.origin)[1]);
        return turnyaw;
    }
    return 0;
}

// Namespace aiutility/archetype_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x6a3adfd7, Offset: 0x5080
// Size: 0xa
function bb_getweaponclass() {
    return "rifle";
}

// Namespace aiutility/archetype_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x51e54e2c, Offset: 0x5098
// Size: 0x4a
function function_6f949118() {
    angles = self gettagangles("tag_origin");
    return angleclamp180(angles[0]);
}

// Namespace aiutility/archetype_utility
// Params 0, eflags: 0x1 linked
// Checksum 0xa4a779b2, Offset: 0x50f0
// Size: 0x4a
function function_38855dc8() {
    if (!isdefined(self.favoriteenemy)) {
        return 0;
    }
    velocity = self.favoriteenemy getvelocity();
    return length(velocity);
}

// Namespace aiutility/archetype_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x8fc8f2a0, Offset: 0x5148
// Size: 0x36
function function_ebaa4b7c() {
    if (!isdefined(self.enemy)) {
        return 0;
    }
    return self.enemy.origin[2] - self.origin[2];
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xdb392358, Offset: 0x5188
// Size: 0x40
function notstandingcondition(behaviortreeentity) {
    if (behaviortreeentity getblackboardattribute("_stance") != "stand") {
        return true;
    }
    return false;
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x36d1b7d2, Offset: 0x51d0
// Size: 0x40
function notcrouchingcondition(behaviortreeentity) {
    if (behaviortreeentity getblackboardattribute("_stance") != "crouch") {
        return true;
    }
    return false;
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xcd9607e, Offset: 0x5218
// Size: 0x24
function scriptstartragdoll(behaviortreeentity) {
    behaviortreeentity startragdoll();
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x5 linked
// Checksum 0x955a3675, Offset: 0x5248
// Size: 0xf4
function private prepareforexposedmelee(behaviortreeentity) {
    keepclaimnode(behaviortreeentity);
    meleeacquiremutex(behaviortreeentity);
    currentstance = behaviortreeentity getblackboardattribute("_stance");
    if (isdefined(behaviortreeentity.enemy) && behaviortreeentity.enemy.scriptvehicletype === "firefly") {
        behaviortreeentity setblackboardattribute("_melee_enemy_type", "fireflyswarm");
    }
    if (currentstance == "crouch") {
        behaviortreeentity setblackboardattribute("_desired_stance", "stand");
    }
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xf17973fd, Offset: 0x5348
// Size: 0x3c
function isfrustrated(behaviortreeentity) {
    return isdefined(behaviortreeentity.ai.frustrationlevel) && behaviortreeentity.ai.frustrationlevel > 0;
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x3754c62b, Offset: 0x5390
// Size: 0x34
function clampfrustration(frustrationlevel) {
    if (frustrationlevel > 4) {
        return 4;
    } else if (frustrationlevel < 0) {
        return 0;
    }
    return frustrationlevel;
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x3b3d6277, Offset: 0x53d0
// Size: 0x42e
function updatefrustrationlevel(entity) {
    if (!isdefined(entity.ai.frustrationlevel)) {
        entity.ai.frustrationlevel = 0;
    }
    if (!isdefined(entity.enemy)) {
        entity.ai.frustrationlevel = 0;
        return false;
    }
    /#
        record3dtext("<dev string:xe7>" + entity.ai.frustrationlevel, entity.origin, (1, 0.5, 0), "<dev string:x75>");
    #/
    if (isactor(entity.enemy) || isplayer(entity.enemy)) {
        if (entity.ai.aggressivemode) {
            if (!isdefined(entity.ai.lastfrustrationboost)) {
                entity.ai.lastfrustrationboost = gettime();
            }
            if (entity.ai.lastfrustrationboost + 5000 < gettime()) {
                entity.ai.frustrationlevel++;
                entity.ai.lastfrustrationboost = gettime();
                entity.ai.frustrationlevel = clampfrustration(entity.ai.frustrationlevel);
            }
        }
        isawareofenemy = gettime() - entity lastknowntime(entity.enemy) < int(10 * 1000);
        if (entity.ai.frustrationlevel == 4) {
            hasseenenemy = entity seerecently(entity.enemy, 2);
        } else {
            hasseenenemy = entity seerecently(entity.enemy, 5);
        }
        hasattackedenemyrecently = entity attackedrecently(entity.enemy, 5);
        if (!isawareofenemy || isactor(entity.enemy)) {
            if (!hasseenenemy) {
                entity.ai.frustrationlevel++;
            } else if (!hasattackedenemyrecently) {
                entity.ai.frustrationlevel += 2;
            }
            entity.ai.frustrationlevel = clampfrustration(entity.ai.frustrationlevel);
            return true;
        }
        if (hasattackedenemyrecently) {
            entity.ai.frustrationlevel -= 2;
            entity.ai.frustrationlevel = clampfrustration(entity.ai.frustrationlevel);
            return true;
        } else if (hasseenenemy) {
            entity.ai.frustrationlevel--;
            entity.ai.frustrationlevel = clampfrustration(entity.ai.frustrationlevel);
            return true;
        }
    }
    return false;
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xfb956162, Offset: 0x5808
// Size: 0x24
function flagenemyunattackableservice(behaviortreeentity) {
    behaviortreeentity flagenemyunattackable();
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xf7122a8a, Offset: 0x5838
// Size: 0x98
function islastknownenemypositionapproachable(behaviortreeentity) {
    if (isdefined(behaviortreeentity.enemy)) {
        lastknownpositionofenemy = behaviortreeentity lastknownpos(behaviortreeentity.enemy);
        if (behaviortreeentity isingoal(lastknownpositionofenemy) && behaviortreeentity findpath(behaviortreeentity.origin, lastknownpositionofenemy, 1, 0)) {
            return true;
        }
    }
    return false;
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xc5e32208, Offset: 0x58d8
// Size: 0xfc
function tryadvancingonlastknownpositionbehavior(behaviortreeentity) {
    if (isdefined(behaviortreeentity.enemy)) {
        if (isdefined(behaviortreeentity.ai.aggressivemode) && behaviortreeentity.ai.aggressivemode) {
            lastknownpositionofenemy = behaviortreeentity lastknownpos(behaviortreeentity.enemy);
            if (behaviortreeentity isingoal(lastknownpositionofenemy) && behaviortreeentity findpath(behaviortreeentity.origin, lastknownpositionofenemy, 1, 0)) {
                behaviortreeentity function_a57c34b7(lastknownpositionofenemy, lastknownpositionofenemy);
                setnextfindbestcovertime(behaviortreeentity, undefined);
                return true;
            }
        }
    }
    return false;
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xdc923c28, Offset: 0x59e0
// Size: 0xe4
function trygoingtoclosestnodetoenemybehavior(behaviortreeentity) {
    if (isdefined(behaviortreeentity.enemy)) {
        closestrandomnode = behaviortreeentity findbestcovernodes(behaviortreeentity.engagemaxdist, behaviortreeentity.enemy.origin)[0];
        if (isdefined(closestrandomnode) && behaviortreeentity isingoal(closestrandomnode.origin) && behaviortreeentity findpath(behaviortreeentity.origin, closestrandomnode.origin, 1, 0)) {
            usecovernodewrapper(behaviortreeentity, closestrandomnode);
            return true;
        }
    }
    return false;
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x53a4e744, Offset: 0x5ad0
// Size: 0xf4
function tryrunningdirectlytoenemybehavior(behaviortreeentity) {
    if (isdefined(behaviortreeentity.enemy) && isdefined(behaviortreeentity.ai.aggressivemode) && behaviortreeentity.ai.aggressivemode) {
        origin = behaviortreeentity.enemy.origin;
        if (behaviortreeentity isingoal(origin) && behaviortreeentity findpath(behaviortreeentity.origin, origin, 1, 0)) {
            behaviortreeentity function_a57c34b7(origin, origin);
            setnextfindbestcovertime(behaviortreeentity, undefined);
            return true;
        }
    }
    return false;
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xdcdfa404, Offset: 0x5bd0
// Size: 0x16
function shouldreacttonewenemy(behaviortreeentity) {
    return false;
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xa0be632d, Offset: 0x5c70
// Size: 0x28
function hasweaponmalfunctioned(behaviortreeentity) {
    return isdefined(behaviortreeentity.malfunctionreaction) && behaviortreeentity.malfunctionreaction;
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x4ca3f3f2, Offset: 0x5ca0
// Size: 0x186
function issafefromgrenades(entity) {
    if (isdefined(entity.grenade) && isdefined(entity.grenade.weapon) && entity.grenade !== entity.knowngrenade && !entity issafefromgrenade()) {
        if (isdefined(entity.node)) {
            offsetorigin = entity getnodeoffsetposition(entity.node);
            percentradius = distance(entity.grenade.origin, offsetorigin);
            if (entity.grenadeawareness >= percentradius) {
                return true;
            }
        } else {
            percentradius = distance(entity.grenade.origin, entity.origin) / entity.grenade.weapon.explosionradius;
            if (entity.grenadeawareness >= percentradius) {
                return true;
            }
        }
        entity.knowngrenade = entity.grenade;
        return false;
    }
    return true;
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xb10db48c, Offset: 0x5e30
// Size: 0x24
function ingrenadeblastradius(entity) {
    return !entity issafefromgrenade();
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x32e224c3, Offset: 0x5e60
// Size: 0x58
function recentlysawenemy(behaviortreeentity) {
    if (isdefined(behaviortreeentity.enemy) && behaviortreeentity seerecently(behaviortreeentity.enemy, 6)) {
        return true;
    }
    return false;
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x65d26053, Offset: 0x5ec0
// Size: 0x34
function shouldonlyfireaccurately(behaviortreeentity) {
    if (isdefined(behaviortreeentity.accuratefire) && behaviortreeentity.accuratefire) {
        return true;
    }
    return false;
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x266bdc16, Offset: 0x5f00
// Size: 0x44
function shouldbeaggressive(behaviortreeentity) {
    if (isdefined(behaviortreeentity.ai.aggressivemode) && behaviortreeentity.ai.aggressivemode) {
        return true;
    }
    return false;
}

// Namespace aiutility/archetype_utility
// Params 2, eflags: 0x1 linked
// Checksum 0xc3fb5bc4, Offset: 0x5f50
// Size: 0xbc
function usecovernodewrapper(behaviortreeentity, node) {
    samenode = behaviortreeentity.node === node;
    behaviortreeentity usecovernode(node);
    if (!samenode) {
        behaviortreeentity setblackboardattribute("_cover_mode", "cover_mode_none");
        behaviortreeentity setblackboardattribute("_previous_cover_mode", "cover_mode_none");
    }
    setnextfindbestcovertime(behaviortreeentity, node);
}

// Namespace aiutility/archetype_utility
// Params 2, eflags: 0x1 linked
// Checksum 0x42caa252, Offset: 0x6018
// Size: 0x56
function setnextfindbestcovertime(behaviortreeentity, node) {
    behaviortreeentity.nextfindbestcovertime = behaviortreeentity getnextfindbestcovertime(behaviortreeentity.engagemindist, behaviortreeentity.engagemaxdist, behaviortreeentity.coversearchinterval);
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xbc411721, Offset: 0x6078
// Size: 0xa2
function trackcoverparamsservice(behaviortreeentity) {
    if (isdefined(behaviortreeentity.node) && behaviortreeentity isatcovernodestrict() && behaviortreeentity shouldusecovernode()) {
        if (!isdefined(behaviortreeentity.covernode)) {
            behaviortreeentity.covernode = behaviortreeentity.node;
            setnextfindbestcovertime(behaviortreeentity, behaviortreeentity.node);
        }
        return;
    }
    behaviortreeentity.covernode = undefined;
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xd333b2af, Offset: 0x6128
// Size: 0x5c
function choosebestcovernodeasap(behaviortreeentity) {
    if (!isdefined(behaviortreeentity.enemy)) {
        return 0;
    }
    node = getbestcovernodeifavailable(behaviortreeentity);
    if (isdefined(node)) {
        usecovernodewrapper(behaviortreeentity, node);
    }
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xedfb2e0f, Offset: 0x6190
// Size: 0x43c
function shouldchoosebettercover(behaviortreeentity) {
    if (behaviortreeentity ai::has_behavior_attribute("stealth") && behaviortreeentity ai::get_behavior_attribute("stealth")) {
        return 0;
    }
    if (isdefined(behaviortreeentity.avoid_cover) && behaviortreeentity.avoid_cover) {
        return 0;
    }
    if (behaviortreeentity isinanybadplace()) {
        return 1;
    }
    if (isdefined(behaviortreeentity.enemy)) {
        shouldusecovernoderesult = 0;
        shouldbeboredatcurrentcover = 0;
        abouttoarriveatcover = 0;
        iswithineffectiverangealready = 0;
        islookingaroundforenemy = 0;
        if (behaviortreeentity shouldholdgroundagainstenemy()) {
            return 0;
        }
        if (behaviortreeentity haspath() && isdefined(behaviortreeentity.arrivalfinalpos) && isdefined(behaviortreeentity.pathgoalpos) && self.pathgoalpos == behaviortreeentity.arrivalfinalpos) {
            if (distancesquared(behaviortreeentity.origin, behaviortreeentity.arrivalfinalpos) < 4096) {
                abouttoarriveatcover = 1;
            }
        }
        shouldusecovernoderesult = behaviortreeentity shouldusecovernode();
        if (self isatgoal()) {
            if (shouldusecovernoderesult && isdefined(behaviortreeentity.node) && self isatgoal()) {
                lastknownpos = behaviortreeentity lastknownpos(behaviortreeentity.enemy);
                dist = distance2d(behaviortreeentity.origin, lastknownpos);
                if (dist > behaviortreeentity.engageminfalloffdist && dist <= behaviortreeentity.engagemaxfalloffdist) {
                    iswithineffectiverangealready = 1;
                }
            }
            shouldbeboredatcurrentcover = !iswithineffectiverangealready && behaviortreeentity isatcovernode() && gettime() > self.nextfindbestcovertime;
            if (!shouldusecovernoderesult) {
                if (isdefined(behaviortreeentity.ai.frustrationlevel) && behaviortreeentity.ai.frustrationlevel > 0 && behaviortreeentity haspath()) {
                    islookingaroundforenemy = 1;
                }
            }
        }
        shouldlookforbettercover = !islookingaroundforenemy && !abouttoarriveatcover && !iswithineffectiverangealready && (!shouldusecovernoderesult || shouldbeboredatcurrentcover || !self isatgoal());
        /#
            if (shouldlookforbettercover) {
                color = (0, 1, 0);
            } else {
                color = (1, 0, 0);
            }
            recordenttext("<dev string:xfb>" + shouldusecovernoderesult + "<dev string:x11b>" + islookingaroundforenemy + "<dev string:x123>" + abouttoarriveatcover + "<dev string:x12b>" + iswithineffectiverangealready + "<dev string:x133>" + shouldbeboredatcurrentcover, behaviortreeentity, color, "<dev string:x75>");
        #/
    } else {
        return !(behaviortreeentity shouldusecovernode() && behaviortreeentity isapproachinggoal());
    }
    return shouldlookforbettercover;
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xa81a88a, Offset: 0x65d8
// Size: 0x126
function choosebettercoverservicecodeversion(behaviortreeentity) {
    if (isdefined(behaviortreeentity.stealth) && behaviortreeentity ai::get_behavior_attribute("stealth")) {
        return false;
    }
    if (isdefined(behaviortreeentity.avoid_cover) && behaviortreeentity.avoid_cover) {
        return false;
    }
    if (isdefined(behaviortreeentity.knowngrenade)) {
        return false;
    }
    if (!issafefromgrenades(behaviortreeentity)) {
        behaviortreeentity.nextfindbestcovertime = 0;
    }
    if (isdefined(behaviortreeentity.keepclaimednode) && behaviortreeentity.keepclaimednode) {
        return false;
    }
    newnode = behaviortreeentity choosebettercovernode();
    if (isdefined(newnode)) {
        usecovernodewrapper(behaviortreeentity, newnode);
        return true;
    }
    setnextfindbestcovertime(behaviortreeentity, undefined);
    return false;
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x4
// Checksum 0x9bf66c4f, Offset: 0x6708
// Size: 0x196
function private choosebettercoverservice(behaviortreeentity) {
    shouldchoosebettercoverresult = shouldchoosebettercover(behaviortreeentity);
    if (shouldchoosebettercoverresult && !behaviortreeentity.keepclaimednode) {
        transitionrunning = behaviortreeentity asmistransitionrunning();
        substatepending = behaviortreeentity asmissubstatepending();
        transdecrunning = behaviortreeentity asmistransdecrunning();
        isbehaviortreeinrunningstate = behaviortreeentity getbehaviortreestatus() == 5;
        if (!transitionrunning && !substatepending && !transdecrunning && isbehaviortreeinrunningstate) {
            node = getbestcovernodeifavailable(behaviortreeentity);
            goingtodifferentnode = isdefined(node) && (!isdefined(behaviortreeentity.node) || node != behaviortreeentity.node);
            if (goingtodifferentnode) {
                usecovernodewrapper(behaviortreeentity, node);
                return true;
            }
            setnextfindbestcovertime(behaviortreeentity, undefined);
        }
    }
    return false;
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xdc5880dd, Offset: 0x68a8
// Size: 0x4a
function refillammo(behaviortreeentity) {
    if (behaviortreeentity.weapon != level.weaponnone) {
        behaviortreeentity.ai.bulletsinclip = behaviortreeentity.weapon.clipsize;
    }
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xa92d4b15, Offset: 0x6900
// Size: 0xae
function getbestcovernodeifavailable(behaviortreeentity) {
    node = behaviortreeentity findbestcovernode();
    if (!isdefined(node)) {
        return undefined;
    }
    if (behaviortreeentity nearclaimnode()) {
        currentnode = self.node;
    }
    if (isdefined(currentnode) && node == currentnode) {
        return undefined;
    }
    if (isdefined(behaviortreeentity.covernode) && node == behaviortreeentity.covernode) {
        return undefined;
    }
    return node;
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x0
// Checksum 0x6e82f465, Offset: 0x69b8
// Size: 0xe6
function getsecondbestcovernodeifavailable(behaviortreeentity) {
    nodes = behaviortreeentity findbestcovernodes(behaviortreeentity.goalradius, behaviortreeentity.origin);
    if (nodes.size > 1) {
        node = nodes[1];
    }
    if (!isdefined(node)) {
        return undefined;
    }
    if (behaviortreeentity nearclaimnode()) {
        currentnode = self.node;
    }
    if (isdefined(currentnode) && node == currentnode) {
        return undefined;
    }
    if (isdefined(behaviortreeentity.covernode) && node == behaviortreeentity.covernode) {
        return undefined;
    }
    return node;
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xa77f51bf, Offset: 0x6aa8
// Size: 0x19a
function getcovertype(node) {
    if (isdefined(node)) {
        if (node.type == #"cover pillar") {
            return "cover_pillar";
        } else if (node.type == #"cover left") {
            return "cover_left";
        } else if (node.type == #"cover right") {
            return "cover_right";
        } else if (node.type == #"cover stand" || node.type == #"conceal stand") {
            return "cover_stand";
        } else if (node.type == #"cover crouch" || node.type == #"cover crouch window" || node.type == #"conceal crouch") {
            return "cover_crouch";
        } else if (node.type == #"exposed" || node.type == #"guard") {
            return "cover_exposed";
        }
    }
    return "cover_none";
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x67a065dd, Offset: 0x6c50
// Size: 0x52
function iscoverconcealed(node) {
    if (isdefined(node)) {
        return (node.type == #"conceal crouch" || node.type == #"conceal stand");
    }
    return false;
}

// Namespace aiutility/archetype_utility
// Params 0, eflags: 0x0
// Checksum 0x7168ac47, Offset: 0x6cb0
// Size: 0x4c4
function canseeenemywrapper() {
    if (!isdefined(self.enemy)) {
        return 0;
    }
    if (!isdefined(self.node)) {
        return self cansee(self.enemy);
    }
    node = self.node;
    enemyeye = self.enemy geteye();
    yawtoenemy = angleclamp180(node.angles[1] - vectortoangles(enemyeye - node.origin)[1]);
    if (node.type == #"cover left" || node.type == #"cover right") {
        if (yawtoenemy > 60 || yawtoenemy < -60) {
            return 0;
        }
        if (isdefined(node.spawnflags) && (node.spawnflags & 4) == 4) {
            if (node.type == #"cover left" && yawtoenemy > 10) {
                return 0;
            }
            if (node.type == #"cover right" && yawtoenemy < -10) {
                return 0;
            }
        }
    }
    nodeoffset = (0, 0, 0);
    if (node.type == #"cover pillar") {
        assert(!(isdefined(node.spawnflags) && (node.spawnflags & 2048) == 2048) || !(isdefined(node.spawnflags) && (node.spawnflags & 1024) == 1024));
        canseefromleft = 1;
        canseefromright = 1;
        nodeoffset = (-32, 3.7, 60);
        lookfrompoint = calculatenodeoffsetposition(node, nodeoffset);
        canseefromleft = sighttracepassed(lookfrompoint, enemyeye, 0, undefined);
        nodeoffset = (32, 3.7, 60);
        lookfrompoint = calculatenodeoffsetposition(node, nodeoffset);
        canseefromright = sighttracepassed(lookfrompoint, enemyeye, 0, undefined);
        return (canseefromright || canseefromleft);
    }
    if (node.type == #"cover left") {
        nodeoffset = (-36, 7, 63);
    } else if (node.type == #"cover right") {
        nodeoffset = (36, 7, 63);
    } else if (node.type == #"cover stand" || node.type == #"conceal stand") {
        nodeoffset = (-3.7, -22, 63);
    } else if (node.type == #"cover crouch" || node.type == #"cover crouch window" || node.type == #"conceal crouch") {
        nodeoffset = (3.5, -12.5, 45);
    }
    lookfrompoint = calculatenodeoffsetposition(node, nodeoffset);
    if (sighttracepassed(lookfrompoint, enemyeye, 0, undefined)) {
        return 1;
    }
    return 0;
}

// Namespace aiutility/archetype_utility
// Params 2, eflags: 0x1 linked
// Checksum 0x21330360, Offset: 0x7180
// Size: 0x9e
function calculatenodeoffsetposition(node, nodeoffset) {
    right = anglestoright(node.angles);
    forward = anglestoforward(node.angles);
    return node.origin + vectorscale(right, nodeoffset[0]) + vectorscale(forward, nodeoffset[1]) + (0, 0, nodeoffset[2]);
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xdb3cbe0a, Offset: 0x7228
// Size: 0x16a
function gethighestnodestance(node) {
    assert(isdefined(node));
    if (isdefined(node.spawnflags) && (node.spawnflags & 4) == 4) {
        return "stand";
    }
    if (isdefined(node.spawnflags) && (node.spawnflags & 8) == 8) {
        return "crouch";
    }
    if (isdefined(node.spawnflags) && (node.spawnflags & 16) == 16) {
        return "prone";
    }
    errormsg(node.type + "<dev string:x13b>" + node.origin + "<dev string:x146>");
    if (node.type == #"cover crouch" || node.type == #"cover crouch window" || node.type == #"conceal crouch") {
        return "crouch";
    }
    return "stand";
}

// Namespace aiutility/archetype_utility
// Params 2, eflags: 0x1 linked
// Checksum 0xdea45d6, Offset: 0x73a0
// Size: 0x112
function isstanceallowedatnode(stance, node) {
    assert(isdefined(stance));
    assert(isdefined(node));
    if (stance == "stand" && isdefined(node.spawnflags) && (node.spawnflags & 4) == 4) {
        return true;
    }
    if (stance == "crouch" && isdefined(node.spawnflags) && (node.spawnflags & 8) == 8) {
        return true;
    }
    if (stance == "prone" && isdefined(node.spawnflags) && (node.spawnflags & 16) == 16) {
        return true;
    }
    return false;
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x44120fa3, Offset: 0x74c0
// Size: 0x60
function trystoppingservice(behaviortreeentity) {
    if (behaviortreeentity shouldholdgroundagainstenemy()) {
        behaviortreeentity clearpath();
        behaviortreeentity.keepclaimednode = 1;
        return true;
    }
    behaviortreeentity.keepclaimednode = 0;
    return false;
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x8677a63d, Offset: 0x7528
// Size: 0x2e
function shouldstopmoving(behaviortreeentity) {
    if (behaviortreeentity shouldholdgroundagainstenemy()) {
        return true;
    }
    return false;
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xad8be9d9, Offset: 0x7560
// Size: 0x96
function setcurrentweapon(weapon) {
    self.weapon = weapon;
    self.weaponclass = weapon.weapclass;
    if (weapon != level.weaponnone) {
        assert(isdefined(weapon.worldmodel), "<dev string:x15d>" + weapon.name + "<dev string:x168>");
    }
    self.weaponmodel = weapon.worldmodel;
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xaabaa136, Offset: 0x7600
// Size: 0x84
function setprimaryweapon(weapon) {
    self.primaryweapon = weapon;
    self.primaryweaponclass = weapon.weapclass;
    if (weapon != level.weaponnone) {
        assert(isdefined(weapon.worldmodel), "<dev string:x15d>" + weapon.name + "<dev string:x168>");
    }
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xed0e9108, Offset: 0x7690
// Size: 0x84
function setsecondaryweapon(weapon) {
    self.secondaryweapon = weapon;
    self.secondaryweaponclass = weapon.weapclass;
    if (weapon != level.weaponnone) {
        assert(isdefined(weapon.worldmodel), "<dev string:x15d>" + weapon.name + "<dev string:x168>");
    }
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x94ef7426, Offset: 0x7720
// Size: 0x1e
function keepclaimnode(behaviortreeentity) {
    behaviortreeentity.keepclaimednode = 1;
    return true;
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x141fdb8a, Offset: 0x7748
// Size: 0x1e
function releaseclaimnode(behaviortreeentity) {
    behaviortreeentity.keepclaimednode = 0;
    return true;
}

// Namespace aiutility/archetype_utility
// Params 3, eflags: 0x1 linked
// Checksum 0xd3d3bbaf, Offset: 0x7770
// Size: 0x82
function getaimyawtoenemyfromnode(behaviortreeentity, node, enemy) {
    return angleclamp180(vectortoangles(behaviortreeentity lastknownpos(behaviortreeentity.enemy) - node.origin)[1] - node.angles[1]);
}

// Namespace aiutility/archetype_utility
// Params 3, eflags: 0x1 linked
// Checksum 0x938fd05c, Offset: 0x7800
// Size: 0x82
function getaimpitchtoenemyfromnode(behaviortreeentity, node, enemy) {
    return angleclamp180(vectortoangles(behaviortreeentity lastknownpos(behaviortreeentity.enemy) - node.origin)[0] - node.angles[0]);
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xda99fccf, Offset: 0x7890
// Size: 0x7c
function choosefrontcoverdirection(behaviortreeentity) {
    coverdirection = behaviortreeentity getblackboardattribute("_cover_direction");
    behaviortreeentity setblackboardattribute("_previous_cover_direction", coverdirection);
    behaviortreeentity setblackboardattribute("_cover_direction", "cover_front_direction");
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xc8795c1c, Offset: 0x7918
// Size: 0x1c6
function shouldtacticalwalk(behaviortreeentity) {
    if (!behaviortreeentity haspath()) {
        return false;
    }
    if (ai::hasaiattribute(behaviortreeentity, "forceTacticalWalk") && ai::getaiattribute(behaviortreeentity, "forceTacticalWalk")) {
        return true;
    }
    if (ai::hasaiattribute(behaviortreeentity, "disablesprint") && !ai::getaiattribute(behaviortreeentity, "disablesprint")) {
        if (ai::hasaiattribute(behaviortreeentity, "sprint") && ai::getaiattribute(behaviortreeentity, "sprint")) {
            return false;
        }
    }
    goalpos = undefined;
    if (isdefined(behaviortreeentity.arrivalfinalpos)) {
        goalpos = behaviortreeentity.arrivalfinalpos;
    } else {
        goalpos = behaviortreeentity.pathgoalpos;
    }
    if (isdefined(behaviortreeentity.pathstartpos) && isdefined(goalpos)) {
        pathdist = distancesquared(behaviortreeentity.pathstartpos, goalpos);
        if (pathdist < 9216) {
            return true;
        }
    }
    if (behaviortreeentity shouldfacemotion()) {
        return false;
    }
    if (!behaviortreeentity issafefromgrenade()) {
        return false;
    }
    return true;
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x3a16a257, Offset: 0x7ae8
// Size: 0x58
function shouldstealth(behaviortreeentity) {
    if (behaviortreeentity ai::has_behavior_attribute("stealth") && behaviortreeentity ai::get_behavior_attribute("stealth")) {
        return true;
    }
    return false;
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xc3609638, Offset: 0x7b48
// Size: 0x2e
function locomotionshouldstealth(behaviortreeentity) {
    if (behaviortreeentity haspath()) {
        return true;
    }
    return false;
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x338202e1, Offset: 0x7b80
// Size: 0x5e
function shouldstealthresume(behaviortreeentity) {
    if (!shouldstealth(behaviortreeentity)) {
        return false;
    }
    if (isdefined(behaviortreeentity.stealth_resume) && behaviortreeentity.stealth_resume) {
        behaviortreeentity.stealth_resume = undefined;
        return true;
    }
    return false;
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x5 linked
// Checksum 0x20adff39, Offset: 0x7be8
// Size: 0xa0
function private stealthreactcondition(entity) {
    inscene = isdefined(self._o_scene) && isdefined(self._o_scene._str_state) && self._o_scene._str_state == "play";
    return !(isdefined(entity.stealth_reacting) && entity.stealth_reacting) && entity hasvalidinterrupt("react") && !inscene;
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x5 linked
// Checksum 0xe12b2fe2, Offset: 0x7c90
// Size: 0x1a
function private stealthreactstart(behaviortreeentity) {
    behaviortreeentity.stealth_reacting = 1;
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x5 linked
// Checksum 0x21e60d2e, Offset: 0x7cb8
// Size: 0x16
function private stealthreactterminate(behaviortreeentity) {
    behaviortreeentity.stealth_reacting = undefined;
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x5 linked
// Checksum 0x5c1961bd, Offset: 0x7cd8
// Size: 0x5a
function private stealthidleterminate(behaviortreeentity) {
    behaviortreeentity notify(#"stealthidleterminate");
    if (isdefined(behaviortreeentity.stealth_resume_after_idle) && behaviortreeentity.stealth_resume_after_idle) {
        behaviortreeentity.stealth_resume_after_idle = undefined;
        behaviortreeentity.stealth_resume = 1;
    }
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x5a49b982, Offset: 0x7d40
// Size: 0x88
function locomotionshouldpatrol(behaviortreeentity) {
    if (shouldstealth(behaviortreeentity)) {
        return false;
    }
    if (behaviortreeentity haspath() && behaviortreeentity ai::has_behavior_attribute("patrol") && behaviortreeentity ai::get_behavior_attribute("patrol")) {
        return true;
    }
    return false;
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x5 linked
// Checksum 0xebe7dfe4, Offset: 0x7dd0
// Size: 0x7c
function private _dropriotshield(riotshieldinfo) {
    entity = self;
    entity shared::throwweapon(riotshieldinfo.weapon, riotshieldinfo.tag, 1, 0);
    if (isdefined(entity)) {
        entity detach(riotshieldinfo.model, riotshieldinfo.tag);
    }
}

// Namespace aiutility/archetype_utility
// Params 4, eflags: 0x0
// Checksum 0xcbd1d023, Offset: 0x7e58
// Size: 0xa2
function attachriotshield(entity, riotshieldweapon, riotshieldmodel, riotshieldtag) {
    riotshield = spawnstruct();
    riotshield.weapon = riotshieldweapon;
    riotshield.tag = riotshieldtag;
    riotshield.model = riotshieldmodel;
    entity attach(riotshieldmodel, riotshield.tag);
    entity.riotshield = riotshield;
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xf17be595, Offset: 0x7f08
// Size: 0x54
function dropriotshield(behaviortreeentity) {
    if (isdefined(behaviortreeentity.riotshield)) {
        riotshieldinfo = behaviortreeentity.riotshield;
        behaviortreeentity.riotshield = undefined;
        behaviortreeentity thread _dropriotshield(riotshieldinfo);
    }
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xbcf29cd1, Offset: 0x7f68
// Size: 0xa4
function meleeacquiremutex(behaviortreeentity) {
    if (isdefined(behaviortreeentity) && isdefined(behaviortreeentity.enemy)) {
        behaviortreeentity.meleeenemy = behaviortreeentity.enemy;
        if (isplayer(behaviortreeentity.meleeenemy)) {
            if (!isdefined(behaviortreeentity.meleeenemy.meleeattackers)) {
                behaviortreeentity.meleeenemy.meleeattackers = 0;
            }
            behaviortreeentity.meleeenemy.meleeattackers++;
        }
    }
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xccda40a7, Offset: 0x8018
// Size: 0xb6
function meleereleasemutex(behaviortreeentity) {
    if (isdefined(behaviortreeentity.meleeenemy)) {
        if (isplayer(behaviortreeentity.meleeenemy)) {
            if (isdefined(behaviortreeentity.meleeenemy.meleeattackers)) {
                behaviortreeentity.meleeenemy.meleeattackers -= 1;
                if (behaviortreeentity.meleeenemy.meleeattackers <= 0) {
                    behaviortreeentity.meleeenemy.meleeattackers = undefined;
                }
            }
        }
    }
    behaviortreeentity.meleeenemy = undefined;
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xe689d6fe, Offset: 0x80d8
// Size: 0xaa
function shouldmutexmelee(behaviortreeentity) {
    if (isdefined(behaviortreeentity.enemy)) {
        if (!isplayer(behaviortreeentity.enemy)) {
            if (behaviortreeentity.enemy.meleeattackers) {
                return false;
            }
        } else {
            if (!sessionmodeiscampaigngame()) {
                return true;
            }
            behaviortreeentity.enemy.meleeattackers = 0;
            return (behaviortreeentity.enemy.meleeattackers < 1);
        }
    }
    return true;
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x2d09c2b4, Offset: 0x8190
// Size: 0x22
function shouldnormalmelee(behaviortreeentity) {
    return hascloseenemytomelee(behaviortreeentity);
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xafb450e0, Offset: 0x81c0
// Size: 0x2ee
function shouldmelee(entity) {
    if (isdefined(entity.ai.lastshouldmeleeresult) && !entity.ai.lastshouldmeleeresult && entity.ai.lastshouldmeleechecktime + 50 >= gettime()) {
        return false;
    }
    entity.lastshouldmeleechecktime = gettime();
    entity.lastshouldmeleeresult = 0;
    if (!isdefined(entity.enemy)) {
        return false;
    }
    if (!entity.enemy.allowdeath) {
        return false;
    }
    if (!isalive(entity.enemy)) {
        return false;
    }
    if (!issentient(entity.enemy)) {
        return false;
    }
    if (isvehicle(entity.enemy) && !(isdefined(entity.enemy.ai.good_melee_target) && entity.enemy.ai.good_melee_target)) {
        return false;
    }
    if (isplayer(entity.enemy) && entity.enemy getstance() == "prone") {
        return false;
    }
    if (distancesquared(entity.origin, entity.enemy.origin) > 140 * 140) {
        return false;
    }
    if (ai::hasaiattribute(entity, "can_melee") && !ai::getaiattribute(entity, "can_melee")) {
        return false;
    }
    if (ai::hasaiattribute(entity.enemy, "can_be_meleed") && !ai::getaiattribute(entity.enemy, "can_be_meleed")) {
        return false;
    }
    if (!shouldmutexmelee(entity)) {
        return false;
    }
    if (shouldnormalmelee(entity) || shouldchargemelee(entity)) {
        entity.ai.lastshouldmeleeresult = 1;
        return true;
    }
    return false;
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xf4336d71, Offset: 0x84b8
// Size: 0x2a
function hascloseenemytomelee(entity) {
    return hascloseenemytomeleewithrange(entity, 64 * 64);
}

// Namespace aiutility/archetype_utility
// Params 2, eflags: 0x1 linked
// Checksum 0x5ee9cd79, Offset: 0x84f0
// Size: 0x1a4
function hascloseenemytomeleewithrange(entity, melee_range_sq) {
    assert(isdefined(entity.enemy));
    if (!entity cansee(entity.enemy)) {
        return false;
    }
    predicitedposition = entity.enemy.origin + vectorscale(entity getenemyvelocity(), 0.25);
    distsq = distancesquared(entity.origin, predicitedposition);
    yawtoenemy = angleclamp180(entity.angles[1] - vectortoangles(entity.enemy.origin - entity.origin)[1]);
    if (distsq <= 36 * 36) {
        return (abs(yawtoenemy) <= 40);
    }
    if (distsq <= melee_range_sq && entity maymovetopoint(entity.enemy.origin)) {
        return (abs(yawtoenemy) <= 80);
    }
    return false;
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xebe9269d, Offset: 0x86a0
// Size: 0x20c
function shouldchargemelee(entity) {
    assert(isdefined(entity.enemy));
    currentstance = entity getblackboardattribute("_stance");
    if (currentstance != "stand") {
        return false;
    }
    if (isdefined(entity.ai.nextchargemeleetime)) {
        if (gettime() < entity.ai.nextchargemeleetime) {
            return false;
        }
    }
    enemydistsq = distancesquared(entity.origin, entity.enemy.origin);
    if (enemydistsq < 64 * 64) {
        return false;
    }
    offset = entity.enemy.origin - vectornormalize(entity.enemy.origin - entity.origin) * 36;
    if (enemydistsq < 140 * 140 && entity maymovetopoint(offset, 1, 1)) {
        yawtoenemy = angleclamp180(entity.angles[1] - vectortoangles(entity.enemy.origin - entity.origin)[1]);
        return (abs(yawtoenemy) <= 80);
    }
    return false;
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x5 linked
// Checksum 0xe20ea85e, Offset: 0x88b8
// Size: 0xe4
function private shouldattackinchargemelee(behaviortreeentity) {
    if (isdefined(behaviortreeentity.enemy)) {
        if (distancesquared(behaviortreeentity.origin, behaviortreeentity.enemy.origin) < 74 * 74) {
            yawtoenemy = angleclamp180(behaviortreeentity.angles[1] - vectortoangles(behaviortreeentity.enemy.origin - behaviortreeentity.origin)[1]);
            if (abs(yawtoenemy) > 80) {
                return 0;
            }
            return 1;
        }
    }
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x5 linked
// Checksum 0xb4601faf, Offset: 0x89a8
// Size: 0x94
function private setupchargemeleeattack(behaviortreeentity) {
    if (isdefined(behaviortreeentity.enemy) && behaviortreeentity.enemy.scriptvehicletype === "firefly") {
        behaviortreeentity setblackboardattribute("_melee_enemy_type", "fireflyswarm");
    }
    meleeacquiremutex(behaviortreeentity);
    keepclaimnode(behaviortreeentity);
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x5 linked
// Checksum 0xe3be1216, Offset: 0x8a48
// Size: 0xe4
function private cleanupmelee(behaviortreeentity) {
    meleereleasemutex(behaviortreeentity);
    releaseclaimnode(behaviortreeentity);
    behaviortreeentity setblackboardattribute("_melee_enemy_type", undefined);
    if (isdefined(behaviortreeentity.ai.var_aba9dcfd) && isdefined(behaviortreeentity.ai.var_38ee3a42)) {
        behaviortreeentity pathmode("move delayed", 1, randomfloatrange(behaviortreeentity.ai.var_aba9dcfd, behaviortreeentity.ai.var_38ee3a42));
    }
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x5 linked
// Checksum 0x5966f3d4, Offset: 0x8b38
// Size: 0xb4
function private cleanupchargemelee(behaviortreeentity) {
    behaviortreeentity.ai.nextchargemeleetime = gettime() + 2000;
    behaviortreeentity setblackboardattribute("_melee_enemy_type", undefined);
    meleereleasemutex(behaviortreeentity);
    releaseclaimnode(behaviortreeentity);
    behaviortreeentity pathmode("move delayed", 1, randomfloatrange(0.75, 1.5));
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xf812bb1a, Offset: 0x8bf8
// Size: 0x124
function cleanupchargemeleeattack(behaviortreeentity) {
    meleereleasemutex(behaviortreeentity);
    releaseclaimnode(behaviortreeentity);
    behaviortreeentity setblackboardattribute("_melee_enemy_type", undefined);
    if (isdefined(behaviortreeentity.ai.var_aba9dcfd) && isdefined(behaviortreeentity.ai.var_38ee3a42)) {
        behaviortreeentity pathmode("move delayed", 1, randomfloatrange(behaviortreeentity.ai.var_aba9dcfd, behaviortreeentity.ai.var_38ee3a42));
        return;
    }
    behaviortreeentity pathmode("move delayed", 1, randomfloatrange(0.5, 1));
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x5 linked
// Checksum 0x6e372eab, Offset: 0x8d28
// Size: 0x56
function private shouldchoosespecialpronepain(behaviortreeentity) {
    stance = behaviortreeentity getblackboardattribute("_stance");
    return stance == "prone_back" || stance == "prone_front";
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x5 linked
// Checksum 0xb94355af, Offset: 0x8d88
// Size: 0x20
function private function_9b0e7a22(behaviortreeentity) {
    return behaviortreeentity.var_40543c03 === "concussion";
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x5 linked
// Checksum 0x89b84a3c, Offset: 0x8db0
// Size: 0x18
function private shouldchoosespecialpain(behaviortreeentity) {
    return isdefined(behaviortreeentity.var_40543c03);
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x5 linked
// Checksum 0x580b9631, Offset: 0x8dd0
// Size: 0x16
function private function_89cb7bfd(behaviortreeentity) {
    return behaviortreeentity.var_ab2486b4;
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x5 linked
// Checksum 0x38b4eb9d, Offset: 0x8df0
// Size: 0x32
function private shouldchoosespecialdeath(behaviortreeentity) {
    if (isdefined(behaviortreeentity.damageweapon)) {
        return behaviortreeentity.damageweapon.specialpain;
    }
    return 0;
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x5 linked
// Checksum 0x1cae839e, Offset: 0x8e30
// Size: 0x56
function private shouldchoosespecialpronedeath(behaviortreeentity) {
    stance = behaviortreeentity getblackboardattribute("_stance");
    return stance == "prone_back" || stance == "prone_front";
}

// Namespace aiutility/archetype_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x8f557654, Offset: 0x8e90
// Size: 0x40
function private setupexplosionanimscale(entity, asmstatename) {
    self.animtranslationscale = 2;
    self asmsetanimationrate(0.7);
    return 4;
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xc0271541, Offset: 0x8ed8
// Size: 0x14e
function isbalconydeath(behaviortreeentity) {
    if (!isdefined(behaviortreeentity.node)) {
        return false;
    }
    if (!(behaviortreeentity.node.spawnflags & 1024 || behaviortreeentity.node.spawnflags & 2048)) {
        return false;
    }
    covermode = behaviortreeentity getblackboardattribute("_cover_mode");
    if (isdefined(behaviortreeentity.node.script_balconydeathchance) && randomint(100) > int(100 * behaviortreeentity.node.script_balconydeathchance)) {
        return false;
    }
    distsq = distancesquared(behaviortreeentity.origin, behaviortreeentity.node.origin);
    if (distsq > 64 * 64) {
        return false;
    }
    self.b_balcony_death = 1;
    return true;
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xe71d4b3e, Offset: 0x9030
// Size: 0xa4
function balconydeath(behaviortreeentity) {
    behaviortreeentity.clamptonavmesh = 0;
    if (behaviortreeentity.node.spawnflags & 1024) {
        behaviortreeentity setblackboardattribute("_special_death", "balcony");
        return;
    }
    if (behaviortreeentity.node.spawnflags & 2048) {
        behaviortreeentity setblackboardattribute("_special_death", "balcony_norail");
    }
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x30ffc69d, Offset: 0x90e0
// Size: 0x2c
function usecurrentposition(entity) {
    entity function_a57c34b7(entity.origin);
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x27b445e0, Offset: 0x9118
// Size: 0x2c
function isunarmed(behaviortreeentity) {
    if (behaviortreeentity.weapon == level.weaponnone) {
        return true;
    }
    return false;
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xcf45f7b5, Offset: 0x9150
// Size: 0x180
function preshootlaserandglinton(ai) {
    self endon(#"death");
    if (!isdefined(ai.laserstatus)) {
        ai.laserstatus = 0;
    }
    sniper_glint = #"hash_3db1ecb54b192a49";
    while (true) {
        self waittill(#"about_to_fire");
        if (ai.laserstatus !== 1) {
            ai laseron();
            ai.laserstatus = 1;
            tag = ai gettagorigin("tag_flash");
            if (isdefined(tag)) {
                playfxontag(sniper_glint, ai, "tag_flash");
                continue;
            }
            type = isdefined(ai.classname) ? "" + ai.classname : "";
            println("<dev string:x18a>" + type + "<dev string:x190>");
            playfxontag(sniper_glint, ai, "tag_eye");
        }
    }
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x6672a077, Offset: 0x92d8
// Size: 0x76
function postshootlaserandglintoff(ai) {
    self endon(#"death");
    while (true) {
        self waittill(#"stopped_firing");
        if (ai.laserstatus === 1) {
            ai laseroff();
            ai.laserstatus = 0;
        }
    }
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x5 linked
// Checksum 0xb7ec4716, Offset: 0x9358
// Size: 0x2a
function private isinphalanx(entity) {
    return entity ai::get_behavior_attribute("phalanx");
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x5 linked
// Checksum 0xe16c216a, Offset: 0x9390
// Size: 0xb6
function private isinphalanxstance(entity) {
    phalanxstance = entity ai::get_behavior_attribute("phalanx_force_stance");
    currentstance = entity getblackboardattribute("_stance");
    switch (phalanxstance) {
    case #"stand":
        return (currentstance == "stand");
    case #"crouch":
        return (currentstance == "crouch");
    }
    return true;
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x5 linked
// Checksum 0xbfdaa8f0, Offset: 0x9450
// Size: 0xba
function private togglephalanxstance(entity) {
    phalanxstance = entity ai::get_behavior_attribute("phalanx_force_stance");
    switch (phalanxstance) {
    case #"stand":
        entity setblackboardattribute("_desired_stance", "stand");
        break;
    case #"crouch":
        entity setblackboardattribute("_desired_stance", "crouch");
        break;
    }
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xafcb0b77, Offset: 0x9518
// Size: 0xbe
function isatattackobject(entity) {
    if (isdefined(entity.enemyoverride) && isdefined(entity.enemyoverride[1])) {
        return false;
    }
    if (isdefined(entity.attackable) && isdefined(entity.attackable.is_active) && entity.attackable.is_active) {
        if (!isdefined(entity.attackable_slot)) {
            return false;
        }
        if (entity isatgoal()) {
            entity.is_at_attackable = 1;
            return true;
        }
    }
    return false;
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x8b7120ee, Offset: 0x95e0
// Size: 0xa4
function shouldattackobject(entity) {
    if (isdefined(entity.enemyoverride) && isdefined(entity.enemyoverride[1])) {
        return false;
    }
    if (isdefined(entity.attackable) && isdefined(entity.attackable.is_active) && entity.attackable.is_active) {
        if (isdefined(entity.is_at_attackable) && entity.is_at_attackable) {
            return true;
        }
    }
    return false;
}

// Namespace aiutility/archetype_utility
// Params 4, eflags: 0x1 linked
// Checksum 0x91107536, Offset: 0x9690
// Size: 0xb2
function meleeattributescallback(entity, attribute, oldvalue, value) {
    switch (attribute) {
    case #"can_melee":
        if (value) {
            entity.canmelee = 1;
        } else {
            entity.canmelee = 0;
        }
        break;
    case #"can_be_meleed":
        if (value) {
            entity.canbemeleed = 1;
        } else {
            entity.canbemeleed = 0;
        }
        break;
    }
}

// Namespace aiutility/archetype_utility
// Params 4, eflags: 0x1 linked
// Checksum 0x2f72c6ae, Offset: 0x9750
// Size: 0x82
function arrivalattributescallback(entity, attribute, oldvalue, value) {
    switch (attribute) {
    case #"disablearrivals":
        if (value) {
            entity.ai.disablearrivals = 1;
        } else {
            entity.ai.disablearrivals = 0;
        }
        break;
    }
}

// Namespace aiutility/archetype_utility
// Params 4, eflags: 0x1 linked
// Checksum 0xea881215, Offset: 0x97e0
// Size: 0x5a
function phalanxattributecallback(entity, attribute, oldvalue, value) {
    if (value) {
        entity.ai.phalanx = 1;
        return;
    }
    entity.ai.phalanx = 0;
}

// Namespace aiutility/archetype_utility
// Params 1, eflags: 0x5 linked
// Checksum 0x728c26ea, Offset: 0x9848
// Size: 0x2ba
function private generictryreacquireservice(behaviortreeentity) {
    if (!isdefined(behaviortreeentity.reacquire_state)) {
        behaviortreeentity.reacquire_state = 0;
    }
    if (!isdefined(behaviortreeentity.enemy)) {
        behaviortreeentity.reacquire_state = 0;
        return false;
    }
    if (behaviortreeentity haspath()) {
        behaviortreeentity.reacquire_state = 0;
        return false;
    }
    if (behaviortreeentity seerecently(behaviortreeentity.enemy, 4)) {
        behaviortreeentity.reacquire_state = 0;
        return false;
    }
    dirtoenemy = vectornormalize(behaviortreeentity.enemy.origin - behaviortreeentity.origin);
    forward = anglestoforward(behaviortreeentity.angles);
    if (vectordot(dirtoenemy, forward) < 0.5) {
        behaviortreeentity.reacquire_state = 0;
        return false;
    }
    switch (behaviortreeentity.reacquire_state) {
    case 0:
    case 1:
    case 2:
        step_size = 32 + behaviortreeentity.reacquire_state * 32;
        reacquirepos = behaviortreeentity reacquirestep(step_size);
        break;
    case 4:
        if (!behaviortreeentity cansee(behaviortreeentity.enemy) || !behaviortreeentity canshootenemy()) {
            behaviortreeentity flagenemyunattackable();
        }
        break;
    default:
        if (behaviortreeentity.reacquire_state > 15) {
            behaviortreeentity.reacquire_state = 0;
            return false;
        }
        break;
    }
    if (isvec(reacquirepos)) {
        behaviortreeentity function_a57c34b7(reacquirepos);
        return true;
    }
    behaviortreeentity.reacquire_state++;
    return false;
}

