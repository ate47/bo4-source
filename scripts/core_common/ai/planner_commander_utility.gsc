// Atian COD Tools GSC decompiler test
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\flagsys_shared.gsc;
#using scripts\core_common\ai\strategic_command.gsc;
#using scripts\core_common\ai\planner_squad.gsc;
#using scripts\core_common\ai\planner_commander.gsc;
#using scripts\core_common\ai\systems\planner.gsc;
#using scripts\core_common\ai\systems\blackboard.gsc;

#namespace planner_commander_utility;

// Namespace planner_commander_utility/planner_commander_utility
// Params 0, eflags: 0x2
// Checksum 0x65c47ad1, Offset: 0x510
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"planner_commander_utility", &plannercommanderutility::__init__, undefined, undefined);
}

#namespace plannercommanderutility;

// Namespace plannercommanderutility/planner_commander_utility
// Params 0, eflags: 0x5 linked
// Checksum 0xf2a6c1c9, Offset: 0x558
// Size: 0x12b4
function private __init__() {
    plannerutility::registerplannerapi(#"hash_3032cc0c39eec160", &function_790fb743);
    plannerutility::registerplannerapi(#"hash_27cb7425e82f36b2", &function_a05a08bf);
    plannerutility::registerplannerapi(#"commanderblackboardvalueistrue", &strategyblackboardvalueistrue);
    plannerutility::registerplannerapi(#"hash_758a5e038102521d", &function_a75b29d8);
    plannerutility::registerplannerapi(#"commanderhasatleastxassaultobjects", &strategyhasatleastxassaultobjects);
    plannerutility::registerplannerapi(#"commanderhasatleastxdefendobjects", &strategyhasatleastxdefendobjects);
    plannerutility::registerplannerapi(#"commanderhasatleastxobjectives", &strategyhasatleastxobjectives);
    plannerutility::registerplannerapi(#"commanderhasatleastxplayers", &strategyhasatleastxplayers);
    plannerutility::registerplannerapi(#"commanderhasatleastxpriorityassaultobjects", &strategyhasatleastxpriorityassaultobjects);
    plannerutility::registerplannerapi(#"commanderhasatleastxprioritydefendobjects", &strategyhasatleastxprioritydefendobjects);
    plannerutility::registerplannerapi(#"commanderhasatleastxunassignedbots", &strategyhasatleastxunassignedbots);
    plannerutility::registerplannerapi(#"commanderhasatleastxunclaimedassaultobjects", &strategyhasatleastxunclaimedassaultobjects);
    plannerutility::registerplannerapi(#"commanderhasatleastxunclaimeddefendobjects", &strategyhasatleastxunclaimeddefendobjects);
    plannerutility::registerplannerapi(#"commanderhasatleastxunclaimedpriorityassaultobjects", &strategyhasatleastxunclaimedpriorityassaultobjects);
    plannerutility::registerplannerapi(#"commanderhasatleastxunclaimedprioritydefendobjects", &strategyhasatleastxunclaimedprioritydefendobjects);
    plannerutility::registerplannerapi(#"commanderhasforcegoal", &strategyhasforcegoal);
    plannerutility::registerplannerapi(#"hash_3328412ef57ec24f", &function_f6a3c6d5);
    plannerutility::registerplannerapi(#"commandershouldrushprogress", &strategyshouldrushprogress);
    plannerutility::registerplannerapi(#"commandershouldthrottleprogress", &strategyshouldthrottleprogress);
    plannerutility::registerplanneraction(#"hash_665ea68c4244269", &function_e0092cfc, undefined, undefined, undefined);
    plannerutility::registerplanneraction(#"hash_38a4c999135f3595", &function_86270cca, undefined, undefined, undefined);
    plannerutility::registerplanneraction(#"hash_30d4da4336523524", &function_14c766b3, undefined, undefined, undefined);
    plannerutility::registerplanneraction(#"hash_5a63edd39e17c7fa", &function_52012b78, undefined, undefined, undefined);
    plannerutility::registerplanneraction(#"commanderendplan", undefined, undefined, undefined, undefined);
    plannerutility::registerplannerapi(#"commanderincrementblackboardvalue", &strategyincrementblackboardvalue);
    plannerutility::registerplannerapi(#"hash_1e2223a7ca7420d2", &function_166d74b2);
    plannerutility::registerplannerapi(#"hash_63fe7d4f2c2b7232", &function_f162255b);
    plannerutility::registerplannerapi(#"commandersetblackboardvalue", &strategysetblackboardvalue);
    plannerutility::registerplannerapi(#"hash_757f8311986da567", &function_20de0d52);
    plannerutility::registerplannerapi(#"hash_b0021da8974ba24", &bunker_exposure_scale);
    plannerutility::registerplannerapi(#"commandersquadhaspathableescort", &strategysquadhaspathableescort);
    plannerutility::registerplannerapi(#"commandersquadhaspathableobject", &strategysquadhaspathableobject);
    plannerutility::registerplannerapi(#"commandersquadhaspathableobjective", &strategysquadhaspathableobjective);
    plannerutility::registerplannerapi(#"commandersquadhaspathableunclaimedobject", &strategysquadhaspathableunclaimedobject);
    plannerutility::registerplannerapi(#"commandersquadcopyblackboardvalue", &strategysquadcopyblackboardvalue);
    plannerutility::registerplannerapi(#"hash_405fef7ef4724a61", &function_86c0732e);
    plannerutility::registerplannerapi(#"commandersquadsortescortpoi", &strategysquadsortescortpoi);
    plannerutility::registerplanneraction(#"commandersquadassignforcegoal", &strategysquadassignforcegoalparam, undefined, undefined, undefined);
    plannerutility::registerplanneraction(#"commandersquadassignpathableescort", &strategysquadassignpathableescortparam, undefined, undefined, undefined);
    plannerutility::registerplanneraction(#"commandersquadassignpathableobject", &strategysquadassignpathableobjectparam, undefined, undefined, undefined);
    plannerutility::registerplanneraction(#"commandersquadassignpathableobjective", &strategysquadassignpathableobjectiveparam, undefined, undefined, undefined);
    plannerutility::registerplanneraction(#"commandersquadassignpathableunclaimedobject", &strategysquadassignpathableunclaimedobjectparam, undefined, undefined, undefined);
    plannerutility::registerplanneraction(#"hash_58798fbbe44b7ef0", &function_b77887e, undefined, undefined, undefined);
    plannerutility::registerplanneraction(#"commandersquadassignwander", &strategysquadassignwanderparam, undefined, undefined, undefined);
    plannerutility::registerplanneraction(#"hash_5cd436bbd4c1e857", &function_34464159, undefined, undefined, undefined);
    plannerutility::registerplanneraction(#"commandersquadcalculatepathableobjectives", &strategysquadcalculatepathableobjectivesparam, undefined, undefined, undefined);
    plannerutility::registerplanneraction(#"commandersquadcalculatepathableplayers", &strategysquadcalculatepathableplayersparam, undefined, undefined, undefined);
    plannerutility::registerplanneraction(#"commandersquadclaimobject", &strategysquadclaimobjectparam, undefined, undefined, undefined);
    plannerutility::registerplanneraction(#"hash_544ff9246bf758e2", &function_d58b0781, undefined, undefined, undefined);
    plannerutility::registerplanneraction(#"hash_4da9a3c5542078a", &function_45f841ea, undefined, undefined, undefined);
    plannerutility::registerplanneraction(#"commandersquadcreateofsizex", &strategysquadcreateofsizexparam, undefined, undefined, undefined);
    plannerutility::registerplanneraction(#"commandersquadorder", &strategysquadorderparam, undefined, undefined, undefined);
    plannerutility::registerplannerapi(#"commandersquadescorthasnomainguard", &strategysquadescorthasnomainguard);
    plannerutility::registerplannerapi(#"commandersquadescorthasnorearguard", &strategysquadescorthasnorearguard);
    plannerutility::registerplannerapi(#"commandersquadescorthasnovanguard", &strategysquadescorthasnovanguard);
    plannerutility::registerplanneraction(#"commandersquadescortcalculatepathablepoi", &strategysquadescortcalculatepathablepoiparam, undefined, undefined, undefined);
    plannerutility::registerplanneraction(#"commandersquadassignmainguard", &strategysquadescortassignmainguardparam, undefined, undefined, undefined);
    plannerutility::registerplanneraction(#"commandersquadassignrearguard", &strategysquadescortassignrearguardparam, undefined, undefined, undefined);
    plannerutility::registerplanneraction(#"commandersquadassignvanguard", &strategysquadescortassignvanguardparam, undefined, undefined, undefined);
    plannerutility::registerplannerapi(#"commanderpathinghascalculatedpaths", &strategypathinghascalculatedpaths);
    plannerutility::registerplannerapi(#"commanderpathinghascalculatedpathablepath", &strategypathinghascalculatedpathablepath);
    plannerutility::registerplannerapi(#"commanderpathinghasnorequestpoints", &strategypathinghasnorequestpoints);
    plannerutility::registerplannerapi(#"commanderpathinghasrequestpoints", &strategypathinghasrequestpoints);
    plannerutility::registerplannerapi(#"commanderpathinghasunprocessedgameobjects", &strategypathinghasunprocessedgameobjects);
    plannerutility::registerplannerapi(#"commanderpathinghasunprocessedobjectives", &strategypathinghasunprocessedobjectives);
    plannerutility::registerplannerapi(#"commanderpathinghasunprocessedrequestpoints", &strategypathinghasunprocessedrequestpoints);
    plannerutility::registerplannerapi(#"commanderpathinghasunreachablepath", &strategypathinghasunreachablepath);
    plannerutility::registerplanneraction(#"commanderpathingaddassaultgameobjects", &strategypathingaddassaultgameobjectsparam, undefined, undefined, undefined);
    plannerutility::registerplanneraction(#"commanderpathingadddefendgameobjects", &strategypathingadddefendgameobjectsparam, undefined, undefined, undefined);
    plannerutility::registerplanneraction(#"commanderpathingaddobjectives", &strategypathingaddobjectivesparam, undefined, undefined, undefined);
    plannerutility::registerplanneraction(#"commanderpathingaddsquadbots", &strategypathingaddsquadbotsparam, undefined, undefined, undefined);
    plannerutility::registerplanneraction(#"commanderpathingaddsquadescorts", &strategypathingaddsquadescortsparam, undefined, undefined, undefined);
    plannerutility::registerplanneraction(#"commanderpathingaddtosquadcalculatedgameobjects", &strategypathingaddtosquadcalculatedgameobjectsparam, undefined, undefined, undefined);
    plannerutility::registerplanneraction(#"commanderpathingaddtosquadcalculatedobjectives", &strategypathingaddtosquadcalculatedobjectivesparam, undefined, undefined, undefined);
    plannerutility::registerplanneraction(#"commanderpathingcalculatepathtorequestedpoints", &strategypathingcalculatepathtorequestedpointsparam, undefined, undefined, undefined);
    plannerutility::registerplanneraction(#"commanderpathingcalculategameobjectrequestpoints", &strategypathingcalculategameobjectrequestpointsparam, undefined, undefined, undefined);
    plannerutility::registerplanneraction(#"commanderpathingcalculategameobjectpathability", &strategypathingcalculategameobjectpathabilityparam, undefined, undefined, undefined);
    plannerutility::registerplanneraction(#"commanderpathingcalculateobjectiverequestpoints", &strategypathingcalculateobjectiverequestpointsparam, undefined, undefined, undefined);
    plannerutility::registerplanneraction(#"commanderpathingcalculateobjectivepathability", &strategypathingcalculateobjectivepathabilityparam, undefined, undefined, undefined);
    registerutilityapi("commanderScoreBotChain", &function_61d2b8ef);
    registerutilityapi("commanderScoreBotPresence", &utilityscorebotpresence);
    registerutilityapi("commanderScoreBotVehiclePresence", &function_de2b04c0);
    registerutilityapi("commanderScoreEscortPathing", &utilityscoreescortpathing);
    registerutilityapi("commanderScoreForceGoal", &utilityscoreforcegoal);
    registerutilityapi("commanderScoreGameobjectPathing", &utilityscoregameobjectpathing);
    registerutilityapi("commanderScoreGameobjectPriority", &utilityscoregameobjectpriority);
    registerutilityapi("commanderScoreGameobjectsValidity", &utilityscoregameobjectsvalidity);
    registerutilityapi("commanderScoreNoTarget", &function_2985faa1);
    registerutilityapi("commanderScoreProgressThrottling", &utilityscoreprogressthrottling);
    registerutilityapi("commanderScoreTarget", &function_a65b2be5);
    registerutilityapi("commanderScoreTeam", &function_f389ef61);
    registerutilityapi("commanderScoreViableEscort", &utilityscoreviableescort);
    registerdaemonapi("daemonClients", &daemonupdateclients);
    registerdaemonapi("daemonGameobjects", &daemonupdategameobjects);
    registerdaemonapi("daemonGameplayBundles", &function_e6443602);
    registerdaemonapi("daemonMissionComponents", &function_7706a6fa);
    registerdaemonapi("daemonObjectives", &daemonupdateobjective);
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x4
// Checksum 0xf249d98f, Offset: 0x1818
// Size: 0x188
function private _assignsquadunclaimeddefendgameobjectparam(planner, squadindex) {
    defendobjects = planner::getblackboardattribute(planner, #"gameobjects_defend");
    validobjects = [];
    defendobject = undefined;
    foreach (gameobject in defendobjects) {
        if (!gameobject[#"claimed"]) {
            validobjects[validobjects.size] = gameobject;
        }
    }
    if (validobjects.size > 0) {
        doppelbots = planner::getblackboardattribute(planner, "doppelbots", squadindex);
        centroid = _calculatebotscentroid(doppelbots);
        defendobject = _calculateclosestgameobject(centroid, validobjects);
    }
    if (isdefined(defendobject)) {
        planner::setblackboardattribute(planner, "gameobjects", array(defendobject), squadindex);
        goto LOC_00000186;
    }
LOC_00000186:
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x4
// Checksum 0x2185a1b4, Offset: 0x19a8
// Size: 0xe4
function private _assignsquadassaultgameobjectparam(planner, squadindex) {
    assaultobjects = planner::getblackboardattribute(planner, #"gameobjects_assault");
    if (assaultobjects.size > 0) {
        doppelbots = planner::getblackboardattribute(planner, "doppelbots", squadindex);
        centroid = _calculatebotscentroid(doppelbots);
        assaultobject = _calculateclosestgameobject(centroid, assaultobjects);
        planner::setblackboardattribute(planner, "gameobjects", array(assaultobject), squadindex);
    }
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x4
// Checksum 0xf92fa96, Offset: 0x1a98
// Size: 0xe4
function private _assignsquaddefendgameobjectparam(planner, squadindex) {
    defendobjects = planner::getblackboardattribute(planner, #"gameobjects_defend");
    if (defendobjects.size > 0) {
        doppelbots = planner::getblackboardattribute(planner, "doppelbots", squadindex);
        centroid = _calculatebotscentroid(doppelbots);
        defendobject = _calculateclosestgameobject(centroid, defendobjects);
        planner::setblackboardattribute(planner, "gameobjects", array(defendobject), squadindex);
    }
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 1, eflags: 0x4
// Checksum 0x3771874f, Offset: 0x1b88
// Size: 0x22
function private _calculatealliedteams(team) {
    return array(team);
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 1, eflags: 0x5 linked
// Checksum 0xaefbe91, Offset: 0x1bb8
// Size: 0xe0
function private _calculatebotscentroid(doppelbots) {
    /#
        assert(isarray(doppelbots));
    #/
    centroid = (0, 0, 0);
    foreach (doppelbot in doppelbots) {
        centroid = centroid + doppelbot[#"origin"];
    }
    if (doppelbots.size > 0) {
        return (centroid / doppelbots.size);
    }
    return centroid;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x34aa0f8, Offset: 0x1ca0
// Size: 0x146
function private _calculateclosestgameobject(position, gameobjects) {
    /#
        assert(isvec(position));
    #/
    /#
        assert(isarray(gameobjects));
    #/
    if (gameobjects.size <= 0) {
        return undefined;
    }
    closest = gameobjects[0];
    distancesq = distancesquared(position, closest[#"origin"]);
    for (index = 1; index < gameobjects.size; index++) {
        newdistancesq = distancesquared(position, gameobjects[index][#"origin"]);
        if (newdistancesq < distancesq) {
            closest = gameobjects[index];
            distancesq = newdistancesq;
        }
    }
    return closest;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x4
// Checksum 0xfc237b04, Offset: 0x1df0
// Size: 0x2da
function private function_65b16924(doppelbots, components) {
    /#
        assert(isarray(doppelbots));
    #/
    /#
        assert(isarray(components));
    #/
    var_1a9886d3 = array();
    if (doppelbots.size <= 0 || components.size <= 0) {
        return var_1a9886d3;
    }
    for (var_16b9ef20 = 0; var_16b9ef20 < components.size; var_16b9ef20++) {
        component = components[var_16b9ef20][#"__unsafe__"][#"component"];
        if (!isdefined(component)) {
            continue;
        }
        chained = 0;
        for (botindex = 0; botindex < doppelbots.size; botindex++) {
            bot = doppelbots[botindex][#"__unsafe__"][#"bot"];
            if (!strategiccommandutility::isvalidbot(bot) || !isdefined(bot.var_aeb3e046)) {
                break;
            }
            if (bot isinvehicle()) {
                break;
            }
            foreach (crumb in bot.var_aeb3e046) {
                teaminfo = crumb.var_5b8b19fe[bot.team];
                if (!isdefined(teaminfo)) {
                    continue;
                }
                if (component.var_54a1987a === teaminfo.var_951e29f) {
                    chained = 1;
                }
            }
        }
        if (chained) {
            var_d6d184 = array();
            var_d6d184[#"component"] = components[var_16b9ef20];
            var_1a9886d3[var_1a9886d3.size] = var_d6d184;
        }
    }
    return var_1a9886d3;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 3, eflags: 0x5 linked
// Checksum 0x93143356, Offset: 0x20d8
// Size: 0x3a4
function private _calculateallpathablegameobjects(planner, doppelbots, gameobjects) {
    /#
        assert(isarray(doppelbots));
    #/
    /#
        assert(isarray(gameobjects));
    #/
    pathablegameobjects = [];
    if (gameobjects.size <= 0) {
        return pathablegameobjects;
    }
    if (doppelbots.size <= 0) {
        return pathablegameobjects;
    }
    for (gameobjectindex = 0; gameobjectindex < gameobjects.size; gameobjectindex++) {
        gameobject = gameobjects[gameobjectindex][#"__unsafe__"][#"object"];
        if (!isdefined(gameobject)) {
            continue;
        }
        pathable = 1;
        longestpath = 0;
        for (botindex = 0; botindex < doppelbots.size; botindex++) {
            bot = doppelbots[botindex][#"__unsafe__"][#"bot"];
            if (!strategiccommandutility::isvalidbot(bot)) {
                pathable = 0;
                break;
            }
            path = strategiccommandutility::calculatepathtogameobject(bot, gameobject);
            if (!isdefined(path)) {
                pathable = 0;
                break;
            }
            if (path.pathdistance > longestpath) {
                longestpath = path.pathdistance;
            }
        }
        if (pathable) {
            path = array();
            path[#"distance"] = longestpath;
            path[#"gameobject"] = gameobjects[gameobjectindex];
            pathablegameobjects[pathablegameobjects.size] = path;
        }
        if (getrealtime() - planner.planstarttime > planner.maxframetime) {
            var_ce386d7a = planner.api;
            planner.api = undefined;
            aiprofile_endentry();
            pixendevent();
            aiprofile_endentry();
            pixendevent();
            waitframe(1);
            [[ level.strategic_command_throttle ]]->waitinqueue(planner);
            pixbeginevent(planner.name);
            aiprofile_beginentry(planner.name);
            planner.api = var_ce386d7a;
            pixbeginevent(var_ce386d7a);
            aiprofile_beginentry(var_ce386d7a);
            planner.planstarttime = getrealtime();
        }
    }
    return pathablegameobjects;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 3, eflags: 0x5 linked
// Checksum 0x5521abe0, Offset: 0x2488
// Size: 0x40c
function private function_816f4052(planner, doppelbots, bundles) {
    /#
        assert(isarray(doppelbots));
    #/
    /#
        assert(isarray(bundles));
    #/
    pathablebundles = [];
    if (bundles.size <= 0) {
        return pathablebundles;
    }
    if (doppelbots.size <= 0) {
        return pathablebundles;
    }
    for (bundleindex = 0; bundleindex < bundles.size; bundleindex++) {
        bundle = bundles[bundleindex][#"__unsafe__"][#"bundle"];
        if (!isdefined(bundle)) {
            continue;
        }
        escort = undefined;
        switch (bundle.m_str_type) {
        case #"escortbiped":
            escort = bundle.var_27726d51;
            break;
        default:
            break;
        }
        if (!isdefined(escort)) {
            continue;
        }
        pathable = 1;
        longestpath = 0;
        for (botindex = 0; botindex < doppelbots.size; botindex++) {
            bot = doppelbots[botindex][#"__unsafe__"][#"bot"];
            if (!strategiccommandutility::isvalidbot(bot)) {
                pathable = 0;
                break;
            }
            path = strategiccommandutility::calculatepathtoposition(bot, escort.origin);
            if (!isdefined(path)) {
                pathable = 0;
                break;
            }
            if (path.pathdistance > longestpath) {
                longestpath = path.pathdistance;
            }
        }
        if (pathable) {
            path = array();
            path[#"distance"] = longestpath;
            path[#"bundle"] = bundles[bundleindex];
            pathablebundles[pathablebundles.size] = path;
        }
        if (getrealtime() - planner.planstarttime > planner.maxframetime) {
            var_ce386d7a = planner.api;
            planner.api = undefined;
            aiprofile_endentry();
            pixendevent();
            aiprofile_endentry();
            pixendevent();
            waitframe(1);
            [[ level.strategic_command_throttle ]]->waitinqueue(planner);
            pixbeginevent(planner.name);
            aiprofile_beginentry(planner.name);
            planner.api = var_ce386d7a;
            pixbeginevent(var_ce386d7a);
            aiprofile_beginentry(var_ce386d7a);
            planner.planstarttime = getrealtime();
        }
    }
    return pathablebundles;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 3, eflags: 0x5 linked
// Checksum 0xc4c28362, Offset: 0x28a0
// Size: 0x52c
function private function_77cd4593(planner, doppelbots, components) {
    /#
        assert(isarray(doppelbots));
    #/
    /#
        assert(isarray(components));
    #/
    pathablecomponents = [];
    if (components.size <= 0) {
        return pathablecomponents;
    }
    if (doppelbots.size <= 0) {
        return pathablecomponents;
    }
    var_80e29ead = 0;
    for (botindex = 0; botindex < doppelbots.size; botindex++) {
        if (doppelbots[botindex][#"type"] == "air") {
            var_80e29ead = 1;
            break;
        }
    }
    var_b73a1d4b = 0;
    for (botindex = 0; botindex < doppelbots.size; botindex++) {
        if (doppelbots[botindex][#"type"] == "ground") {
            var_b73a1d4b = 1;
            break;
        }
    }
    for (var_16b9ef20 = 0; var_16b9ef20 < components.size; var_16b9ef20++) {
        component = components[var_16b9ef20][#"__unsafe__"][#"component"];
        if (!isdefined(component)) {
            continue;
        }
        trigger = undefined;
        switch (component.m_str_type) {
        case #"goto":
            break;
        case #"destroy":
        case #"defend":
            trigger = var_80e29ead ? component.var_6bc907c4 : component.var_2956bff4;
            break;
        case #"capturearea":
            trigger = component.var_cc67d976;
            break;
        default:
            break;
        }
        if (!isdefined(trigger)) {
            continue;
        }
        pathable = 1;
        longestpath = 0;
        for (botindex = 0; botindex < doppelbots.size; botindex++) {
            bot = doppelbots[botindex][#"__unsafe__"][#"bot"];
            if (!strategiccommandutility::isvalidbot(bot)) {
                pathable = 0;
                break;
            }
            path = strategiccommandutility::calculatepathtoobjective(bot, trigger);
            if (!isdefined(path)) {
                pathable = 0;
                break;
            }
            if (path.pathdistance > longestpath) {
                longestpath = path.pathdistance;
            }
        }
        if (pathable) {
            path = array();
            path[#"distance"] = longestpath;
            path[#"objective"] = components[var_16b9ef20];
            pathablecomponents[pathablecomponents.size] = path;
        }
        if (getrealtime() - planner.planstarttime > planner.maxframetime) {
            var_ce386d7a = planner.api;
            planner.api = undefined;
            aiprofile_endentry();
            pixendevent();
            aiprofile_endentry();
            pixendevent();
            waitframe(1);
            [[ level.strategic_command_throttle ]]->waitinqueue(planner);
            pixbeginevent(planner.name);
            aiprofile_beginentry(planner.name);
            planner.api = var_ce386d7a;
            pixbeginevent(var_ce386d7a);
            aiprofile_beginentry(var_ce386d7a);
            planner.planstarttime = getrealtime();
        }
    }
    return pathablecomponents;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x5f69e1c4, Offset: 0x2dd8
// Size: 0x34a
function private function_98bde2b6(doppelbots, entities) {
    /#
        assert(isarray(doppelbots));
    #/
    /#
        assert(isarray(entities));
    #/
    var_afb9d067 = [];
    if (entities.size <= 0) {
        return var_afb9d067;
    }
    if (doppelbots.size <= 0) {
        return var_afb9d067;
    }
    for (entityindex = 0; entityindex < entities.size; entityindex++) {
        entity = entities[entityindex][#"__unsafe__"][#"entity"];
        if (!isdefined(entity)) {
            continue;
        }
        var_cec03170 = getclosestpointonnavmesh(entity.origin, 200);
        pathable = 1;
        longestpath = 0;
        for (botindex = 0; botindex < doppelbots.size; botindex++) {
            bot = doppelbots[botindex][#"__unsafe__"][#"bot"];
            position = getclosestpointonnavmesh(bot.origin, 120, bot getpathfindingradius() * 1.05);
            if (!isdefined(position) || !isdefined(var_cec03170)) {
                pathable = 0;
                break;
            }
            if (!strategiccommandutility::isvalidbot(bot)) {
                pathable = 0;
                break;
            }
            queryresult = positionquery_source_navigation(var_cec03170, 0, 120, 60, 16, bot, 16);
            if (queryresult.data.size > 0) {
                path = _calculatepositionquerypath(queryresult, position, bot);
                if (!isdefined(path)) {
                    pathable = 0;
                    break;
                }
                if (path.pathdistance > longestpath) {
                    longestpath = path.pathdistance;
                }
            }
        }
        if (pathable) {
            path = array();
            path[#"distance"] = longestpath;
            path[#"entity"] = entities[entityindex];
            var_afb9d067[var_afb9d067.size] = path;
        }
    }
    return var_afb9d067;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x8b428574, Offset: 0x3130
// Size: 0x26a
function private _calculateallpathableobjectives(doppelbots, objectives) {
    /#
        assert(isarray(doppelbots));
    #/
    /#
        assert(isarray(objectives));
    #/
    pathableobjectives = [];
    if (objectives.size <= 0) {
        return pathableobjectives;
    }
    if (doppelbots.size <= 0) {
        return pathableobjectives;
    }
    for (objectiveindex = 0; objectiveindex < objectives.size; objectiveindex++) {
        trigger = objectives[objectiveindex][#"__unsafe__"][#"trigger"];
        if (!isdefined(trigger)) {
            continue;
        }
        pathable = 1;
        longestpath = 0;
        for (botindex = 0; botindex < doppelbots.size; botindex++) {
            bot = doppelbots[botindex][#"__unsafe__"][#"bot"];
            if (!strategiccommandutility::isvalidbot(bot)) {
                pathable = 0;
                break;
            }
            path = strategiccommandutility::calculatepathtoobjective(bot, trigger);
            if (!isdefined(path)) {
                pathable = 0;
                break;
            }
            if (path.pathdistance > longestpath) {
                longestpath = path.pathdistance;
            }
        }
        if (pathable) {
            path = array();
            path[#"distance"] = longestpath;
            path[#"objective"] = objectives[objectiveindex];
            pathableobjectives[pathableobjectives.size] = path;
        }
    }
    return pathableobjectives;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x8e8d804f, Offset: 0x33a8
// Size: 0x3da
function private _calculateallpathableclients(doppelbots, clients) {
    /#
        assert(isarray(doppelbots));
    #/
    /#
        assert(isarray(clients));
    #/
    pathableclients = [];
    if (clients.size <= 0) {
        return pathableclients;
    }
    if (doppelbots.size <= 0) {
        return pathableclients;
    }
    for (clientindex = 0; clientindex < clients.size; clientindex++) {
        player = clients[clientindex][#"__unsafe__"][#"player"];
        if (!isdefined(player) || player isinmovemode("ufo", "noclip") || player.sessionstate !== "playing") {
            continue;
        }
        var_a0f4105 = strategiccommandutility::function_778568e2(player);
        clientposition = getclosestpointonnavmesh(player.origin, 200);
        pathable = 1;
        longestpath = 0;
        for (botindex = 0; botindex < doppelbots.size; botindex++) {
            bot = doppelbots[botindex][#"__unsafe__"][#"bot"];
            if (!strategiccommandutility::isvalidbot(bot)) {
                pathable = 0;
                break;
            }
            var_79c06ff6 = strategiccommandutility::function_778568e2(bot);
            if (var_79c06ff6 != var_a0f4105) {
                pathable = 0;
                break;
            }
            position = getclosestpointonnavmesh(bot.origin, 120, bot getpathfindingradius() * 1.05);
            if (!isdefined(position) || !isdefined(clientposition)) {
                pathable = 0;
                break;
            }
            queryresult = positionquery_source_navigation(clientposition, 0, 120, 60, 16, bot, 16);
            if (queryresult.data.size > 0) {
                path = _calculatepositionquerypath(queryresult, position, bot);
                if (!isdefined(path)) {
                    pathable = 0;
                    break;
                }
                if (path.pathdistance > longestpath) {
                    longestpath = path.pathdistance;
                }
            }
        }
        if (pathable) {
            path = array();
            path[#"distance"] = longestpath;
            path[#"player"] = clients[clientindex];
            pathableclients[pathableclients.size] = path;
        }
    }
    return pathableclients;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 3, eflags: 0x5 linked
// Checksum 0xfba4e0e9, Offset: 0x3790
// Size: 0x174
function private _calculatepositionquerypath(queryresult, position, entity) {
    path = undefined;
    longestpath = 0;
    if (queryresult.data.size > 0) {
        index = 0;
        while (index < queryresult.data.size) {
            goalpoints = [];
            for (goalindex = index; goalindex - index < 16 && goalindex < queryresult.data.size; goalindex++) {
                goalpoints[goalpoints.size] = queryresult.data[goalindex].origin;
            }
            pathsegment = generatenavmeshpath(position, goalpoints, entity);
            if (isdefined(pathsegment) && pathsegment.status === "succeeded") {
                if (pathsegment.pathdistance > longestpath) {
                    path = pathsegment;
                    longestpath = pathsegment.pathdistance;
                }
            }
            index = index + 16;
        }
    }
    return path;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0xd2ccc1f0, Offset: 0x3910
// Size: 0x12e
function private _calculateprioritygameobjects(gameobjects, prioritygameobjectidentifiers) {
    prioritygameobjects = [];
    foreach (gameobjectentry in gameobjects) {
        identifier = gameobjectentry[#"identifier"];
        if (!isdefined(identifier)) {
            continue;
        }
        foreach (priorityidentifier in prioritygameobjectidentifiers) {
            if (identifier == priorityidentifier) {
                prioritygameobjects[prioritygameobjects.size] = gameobjectentry;
            }
        }
    }
    return prioritygameobjects;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 1, eflags: 0x4
// Checksum 0xd5616a77, Offset: 0x3a48
// Size: 0x1dc
function private _updatehistoricalgameobjects(commander) {
    destroyedgameobjecttotal = blackboard::getstructblackboardattribute(commander, #"gameobjects_assault_destroyed");
    assaultobjects = blackboard::getstructblackboardattribute(commander, #"gameobjects_assault");
    gameobjecttotal = 0;
    if (isarray(assaultobjects)) {
        foreach (assaultobjectentry in assaultobjects) {
            if (!isdefined(assaultobjectentry)) {
                continue;
            }
            if (assaultobjectentry[#"identifier"] === "carry_object") {
                continue;
            }
            gameobject = assaultobjectentry[#"__unsafe__"][#"object"];
            if (!isdefined(gameobject) || !isdefined(gameobject.trigger) || !gameobject.trigger istriggerenabled()) {
                destroyedgameobjecttotal++;
            } else {
                gameobjecttotal++;
            }
        }
    }
    gameobjecttotal = gameobjecttotal + destroyedgameobjecttotal;
    blackboard::setstructblackboardattribute(commander, #"gameobjects_assault_destroyed", destroyedgameobjecttotal);
    blackboard::setstructblackboardattribute(commander, #"gameobjects_assault_total", gameobjecttotal);
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 1, eflags: 0x5 linked
// Checksum 0x12a62758, Offset: 0x3c30
// Size: 0x46c
function private daemonupdateclients(commander) {
    team = blackboard::getstructblackboardattribute(commander, #"team");
    clients = getplayers(team);
    doppelbots = [];
    players = [];
    vehicles = [];
    foreach (client in clients) {
        cachedclient = array();
        cachedclient[#"origin"] = client.origin;
        cachedclient[#"entnum"] = client getentitynumber();
        cachedclient[#"escortmainguard"] = array();
        cachedclient[#"escortrearguard"] = array();
        cachedclient[#"escortvanguard"] = array();
        if (strategiccommandutility::isvalidbot(client)) {
            if (!isdefined(cachedclient[#"__unsafe__"])) {
                cachedclient[#"__unsafe__"] = array();
            }
            cachedclient[#"__unsafe__"][#"bot"] = client;
            if (client isinvehicle()) {
                if (strategiccommandutility::function_4732f860(client)) {
                    vehicle = client getvehicleoccupied();
                    if (!isdefined(cachedclient[#"__unsafe__"])) {
                        cachedclient[#"__unsafe__"] = array();
                    }
                    cachedclient[#"__unsafe__"][#"vehicle"] = vehicle;
                    cachedclient[#"type"] = strategiccommandutility::function_4b0c469d(vehicle);
                    vehicles[vehicles.size] = cachedclient;
                }
            } else {
                cachedclient[#"type"] = "bot";
                doppelbots[doppelbots.size] = cachedclient;
            }
        } else if (strategiccommandutility::isvalidplayer(client)) {
            if (!isdefined(cachedclient[#"__unsafe__"])) {
                cachedclient[#"__unsafe__"] = array();
            }
            cachedclient[#"__unsafe__"][#"player"] = client;
            players[players.size] = cachedclient;
        }
    }
    blackboard::setstructblackboardattribute(commander, #"bot_vehicles", vehicles);
    blackboard::setstructblackboardattribute(commander, #"doppelbots", doppelbots);
    blackboard::setstructblackboardattribute(commander, #"players", players);
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 1, eflags: 0x5 linked
// Checksum 0xaadc9dd2, Offset: 0x40a8
// Size: 0x6d4
function private daemonupdategameobjects(commander) {
    if (isdefined(level.a_gameobjects)) {
        commanderteam = blackboard::getstructblackboardattribute(commander, #"team");
        var_832340f2 = strategiccommandutility::function_a1edb007(commanderteam);
        var_31b80437 = tolower(var_832340f2);
        gameobjects = array();
        var_1d83f398 = arraycopy(level.a_gameobjects);
        var_aa8d6440 = array();
        excluded = blackboard::getstructblackboardattribute(commander, #"gameobjects_exclude");
        excludedmap = array();
        foreach (excludename in excluded) {
            excludedmap[excludename] = 1;
        }
        restrict = blackboard::getstructblackboardattribute(commander, #"gameobjects_restrict");
        var_fffabd2 = array();
        foreach (var_c96f243d in restrict) {
            var_fffabd2[var_c96f243d] = 1;
        }
        for (gameobjectindex = 0; gameobjectindex < var_1d83f398.size; gameobjectindex++) {
            gameobject = var_1d83f398[gameobjectindex];
            if (!isdefined(gameobject) || !isdefined(gameobject.trigger)) {
                continue;
            }
            if (gameobject.type === "GenericObject") {
                continue;
            }
            if (!gameobject.trigger istriggerenabled()) {
                continue;
            }
            if (!(gameobject.team == commanderteam || gameobject.team == var_31b80437 || gameobject.absolute_visible_and_interact_team === commanderteam || gameobject.team == #"free")) {
                continue;
            }
            identifier = gameobject gameobjects::get_identifier();
            if (var_fffabd2.size > 0) {
                jumpiffalse(!isdefined(identifier) || !isdefined(var_fffabd2[identifier])) LOC_000003aa;
            } else {
            LOC_000003aa:
                if (isdefined(identifier) && isdefined(excludedmap[identifier])) {
                    continue;
                }
                if (isdefined(gameobject.var_a267844e)) {
                    continue;
                }
                cachedgameobject = array();
                cachedgameobject[#"strategy"] = strategiccommandutility::function_423cfbc1(var_31b80437, undefined, undefined, gameobject);
                if (strategiccommandutility::function_f59ca353(cachedgameobject[#"strategy"])) {
                    continue;
                }
                cachedgameobject[#"claimed"] = 0;
                cachedgameobject[#"type"] = "gameobject";
                if (!isdefined(cachedgameobject[#"__unsafe__"])) {
                    cachedgameobject[#"__unsafe__"] = array();
                }
                cachedgameobject[#"__unsafe__"][#"object"] = gameobject;
                if (!isdefined(cachedgameobject[#"__unsafe__"])) {
                    cachedgameobject[#"__unsafe__"] = array();
                }
                cachedgameobject[#"__unsafe__"][#"entity"] = gameobject.e_object;
                if (isdefined(identifier) && (identifier == "air_vehicle" || identifier == "ground_vehicle")) {
                    var_aa8d6440[var_aa8d6440.size] = cachedgameobject;
                } else {
                    gameobjects[gameobjects.size] = cachedgameobject;
                }
                if (getrealtime() - commander.var_22765a25 > commander.var_b9dd2f) {
                    aiprofile_endentry();
                    pixendevent();
                    [[ level.strategic_command_throttle ]]->waitinqueue(commander);
                    commander.var_22765a25 = getrealtime();
                    pixbeginevent("daemonGameobjects");
                    aiprofile_beginentry("daemonGameobjects");
                }
            }
        }
        blackboard::setstructblackboardattribute(commander, #"gameobjects", gameobjects);
        blackboard::setstructblackboardattribute(commander, #"gameobjects_vehicles", var_aa8d6440);
    }
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 1, eflags: 0x5 linked
// Checksum 0x7c751133, Offset: 0x4788
// Size: 0x364
function private function_e6443602(commander) {
    if (isdefined(level.var_97964e1)) {
        commanderteam = blackboard::getstructblackboardattribute(commander, #"team");
        var_832340f2 = strategiccommandutility::function_a1edb007(commanderteam);
        var_31b80437 = tolower(var_832340f2);
        bundles = array();
        foreach (gameplay in level.var_97964e1) {
            if (!strategiccommandutility::function_208c970d(gameplay, var_832340f2)) {
                continue;
            }
            gpbundle = gameplay.o_gpbundle;
            type = gameplay.classname;
            var_5f31ab8b = array();
            switch (type) {
            case #"hash_1c67b29f3576b10d":
                var_5f31ab8b[#"type"] = "escortbiped";
                break;
            default:
                goto LOC_00000332;
            }
            var_5f31ab8b[#"strategy"] = strategiccommandutility::function_423cfbc1(var_31b80437, gpbundle.m_s_bundle);
            if (!isdefined(var_5f31ab8b[#"__unsafe__"])) {
                var_5f31ab8b[#"__unsafe__"] = array();
            }
            var_5f31ab8b[#"__unsafe__"][#"bundle"] = gpbundle;
            bundles[bundles.size] = var_5f31ab8b;
            if (getrealtime() - commander.var_22765a25 > commander.var_b9dd2f) {
                aiprofile_endentry();
                pixendevent();
                [[ level.strategic_command_throttle ]]->waitinqueue(commander);
                commander.var_22765a25 = getrealtime();
                pixbeginevent("daemonMissionComponents");
                aiprofile_beginentry("daemonMissionComponents");
            LOC_00000332:
            }
        LOC_00000332:
        }
        blackboard::setstructblackboardattribute(commander, #"gpbundles", bundles);
    }
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 1, eflags: 0x5 linked
// Checksum 0xbbface81, Offset: 0x4af8
// Size: 0x688
function private function_7706a6fa(commander) {
    if (isdefined(level.var_8239a46c) && level flagsys::get(#"hash_3a3d68ab491e1985")) {
        commanderteam = blackboard::getstructblackboardattribute(commander, #"team");
        var_832340f2 = strategiccommandutility::function_a1edb007(commanderteam);
        var_31b80437 = tolower(var_832340f2);
        components = array();
        var_35301d62 = array();
        var_35301d62[#"hash_f5c6c6aa7dc0f6d"] = array();
        var_35301d62[#"hash_6e9081699001bcd9"] = array();
        var_35301d62[#"hash_3bf68fbcb5c53b6c"] = array();
        var_35301d62[#"hash_4984fd4b0ba666a2"] = array();
        foreach (missioncomponent in level.var_8239a46c) {
            if (!strategiccommandutility::function_f867cce0(missioncomponent, commanderteam)) {
                continue;
            }
            component = missioncomponent.var_36f0c06d;
            type = missioncomponent.scriptbundlename;
            var_b313868d = array();
            switch (type) {
            case #"hash_f5c6c6aa7dc0f6d":
                var_b313868d[#"type"] = "defend";
                break;
            case #"hash_6e9081699001bcd9":
                var_b313868d[#"type"] = "destroy";
                break;
            case #"hash_3bf68fbcb5c53b6c":
                var_b313868d[#"type"] = "capturearea";
                break;
            case #"hash_4984fd4b0ba666a2":
                if (isdefined(component.var_c68dc48c) || isdefined(component.var_b95bcdc6)) {
                    var_b313868d[#"type"] = "goto";
                } else {
                    /#
                        println("order_escort_rearguard" + missioncomponent.origin + "<unknown string>");
                    #/
                    goto LOC_000005fa;
                }
                break;
            default:
                goto LOC_000005fa;
            }
            var_b313868d[#"strategy"] = strategiccommandutility::function_423cfbc1(var_31b80437, undefined, missioncomponent);
            if (strategiccommandutility::function_f59ca353(var_b313868d[#"strategy"])) {
                continue;
            }
            if (!isdefined(var_b313868d[#"__unsafe__"])) {
                var_b313868d[#"__unsafe__"] = array();
            }
            var_b313868d[#"__unsafe__"][#"mission_component"] = missioncomponent;
            if (!isdefined(var_b313868d[#"__unsafe__"])) {
                var_b313868d[#"__unsafe__"] = array();
            }
            var_b313868d[#"__unsafe__"][#"component"] = component;
            components[components.size] = var_b313868d;
            arraysize = var_35301d62[type].size;
            var_35301d62[type][arraysize] = var_b313868d;
            if (getrealtime() - commander.var_22765a25 > commander.var_b9dd2f) {
                aiprofile_endentry();
                pixendevent();
                [[ level.strategic_command_throttle ]]->waitinqueue(commander);
                commander.var_22765a25 = getrealtime();
                pixbeginevent("daemonMissionComponents");
                aiprofile_beginentry("daemonMissionComponents");
            LOC_000005fa:
            }
        LOC_000005fa:
        }
        blackboard::setstructblackboardattribute(commander, #"missioncomponents", components);
        foreach (componenttype, componentarray in var_35301d62) {
            blackboard::setstructblackboardattribute(commander, componenttype, componentarray);
        }
    }
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 1, eflags: 0x5 linked
// Checksum 0xe9470614, Offset: 0x5188
// Size: 0x794
function private daemonupdateobjective(commander) {
    if (isdefined(level.a_objectives)) {
        commanderteam = blackboard::getstructblackboardattribute(commander, #"team");
        objectives = array();
        foreach (objective in level.a_objectives) {
            if (isdefined(objective.m_done) && objective.m_done) {
                continue;
            }
            if (isdefined(objective.m_str_team) && objective.m_str_team != commanderteam) {
                continue;
            }
            if (isdefined(objective.m_a_player_game_obj) && objective.m_a_player_game_obj.size > 0) {
                currentbreadcrumb = 0;
                furthestobjective = undefined;
                teamplayers = getplayers(commanderteam);
                foreach (player in teamplayers) {
                    playerentitynumber = player getentitynumber();
                    objectiveid = objective.m_a_player_game_obj[playerentitynumber];
                    if (isdefined(objectiveid) && objective_state(objectiveid) == "active") {
                        cachedobjective = array();
                        cachedobjective[#"entnum"] = playerentitynumber;
                        cachedobjective[#"id"] = objectiveid;
                        cachedobjective[#"origin"] = objective_position(objectiveid);
                        if (!isdefined(cachedobjective[#"__unsafe__"])) {
                            cachedobjective[#"__unsafe__"] = array();
                        }
                        cachedobjective[#"__unsafe__"][#"trigger"] = undefined;
                        if (isdefined(player.a_t_breadcrumbs)) {
                            cachedobjective[#"breadcrumbs"] = player.a_t_breadcrumbs.size;
                            for (index = 0; index < player.a_t_breadcrumbs.size; index++) {
                                if (player.t_current_active_breadcrumb == player.a_t_breadcrumbs[index]) {
                                    cachedobjective[#"currentbreadcrumb"] = index;
                                    cachedobjective[#"triggermax"] = player.t_current_active_breadcrumb.maxs;
                                    cachedobjective[#"triggermin"] = player.t_current_active_breadcrumb.mins;
                                    cachedobjective[#"radius"] = player.t_current_active_breadcrumb.radius;
                                    if (!isdefined(cachedobjective[#"__unsafe__"])) {
                                        cachedobjective[#"__unsafe__"] = array();
                                    }
                                    cachedobjective[#"__unsafe__"][#"trigger"] = player.t_current_active_breadcrumb;
                                    break;
                                }
                            }
                        } else {
                            cachedobjective[#"breadcrumbs"] = 0;
                            cachedobjective[#"currentbreadcrumb"] = 0;
                        }
                        if (currentbreadcrumb <= cachedobjective[#"currentbreadcrumb"]) {
                            currentbreadcrumb = cachedobjective[#"currentbreadcrumb"];
                            furthestobjective = cachedobjective;
                        }
                    }
                }
                if (isdefined(furthestobjective)) {
                    objectives[objectives.size] = furthestobjective;
                }
            } else if (isdefined(objective.m_a_targets) && objective.m_a_targets.size > 0) {
                foreach (objectiveid in objective.m_a_game_obj) {
                    if (isdefined(objectiveid) && objective_state(objectiveid) == "active") {
                        foreach (target in objective.m_a_targets) {
                            if (isdefined(target) && (isstruct(target) || isentity(target)) && isdefined(target.origin)) {
                                cachedobjective = array();
                                cachedobjective[#"id"] = objectiveid;
                                cachedobjective[#"origin"] = target.origin;
                                if (!isdefined(cachedobjective[#"__unsafe__"])) {
                                    cachedobjective[#"__unsafe__"] = array();
                                }
                                cachedobjective[#"__unsafe__"][#"trigger"] = undefined;
                            }
                        }
                    }
                }
            }
        }
        blackboard::setstructblackboardattribute(commander, #"objectives", objectives);
    }
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x1 linked
// Checksum 0x4fb76f2, Offset: 0x5928
// Size: 0xf6
function function_790fb743(planner, constants) {
    /#
        assert(isstring(constants[#"key"]) || ishash(constants[#"key"]), "<unknown string>" + "<unknown string>" + "<unknown string>");
    #/
    attribute = planner::getblackboardattribute(planner, constants[#"key"]);
    if (isdefined(attribute) && isarray(attribute)) {
        return (attribute.size > 0);
    }
    return 0;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0xf8747714, Offset: 0x5a28
// Size: 0xbc
function private function_a05a08bf(planner, constants) {
    /#
        assert(isstring(constants[#"key"]) || ishash(constants[#"key"]), "<unknown string>" + "<unknown string>" + "<unknown string>");
    #/
    return isdefined(planner::getblackboardattribute(planner, constants[#"key"]));
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x10c0cb6c, Offset: 0x5af0
// Size: 0xc0
function private strategyblackboardvalueistrue(planner, constants) {
    /#
        assert(isstring(constants[#"key"]) || ishash(constants[#"key"]), "<unknown string>" + "<unknown string>" + "<unknown string>");
    #/
    return planner::getblackboardattribute(planner, constants[#"key"]) == 1;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0xe6bd1fd5, Offset: 0x5bb8
// Size: 0x20e
function private function_a75b29d8(planner, constants) {
    /#
        assert(isstring(constants[#"focus"]) || ishash(constants[#"focus"]), "<unknown string>" + "<unknown string>" + "<unknown string>");
    #/
    target = planner::getblackboardattribute(planner, #"current_target");
    /#
        assert(isdefined(target));
    #/
    if (!isdefined(target)) {
        return 0;
    }
    strategy = target[#"strategy"];
    /#
        assert(isstruct(strategy));
    #/
    if (!isstruct(strategy)) {
        return 0;
    }
    var_90b56683 = strategiccommandutility::function_f4921cb3(constants[#"focus"]);
    var_3c288f1b = strategy.("doppelbotsfocus");
    foreach (focus in var_90b56683) {
        if (var_3c288f1b == focus) {
            return 1;
        }
    }
    return 0;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x1934e10f, Offset: 0x5dd0
// Size: 0x242
function private function_e0092cfc(planner, constant) {
    planner::setblackboardattribute(planner, #"current_target", undefined);
    targets = planner::getblackboardattribute(planner, #"targets");
    /#
        assert(isarray(targets));
    #/
    if (!isarray(targets)) {
        return spawnstruct();
    }
    priorities = array(#"hash_179ccf9d7cfd1e31", #"hash_254689c549346d57", #"hash_4bd86f050b36e1f6", #"hash_19c0ac460bdb9928", #"hash_160b01bbcd78c723", #"hash_c045a5aa4ac7c1d", #"hash_47fd3da20e90cd01", #"hash_64fc5c612a94639c", #"hash_46658a8270df5a9e");
    /#
        assert(isarray(priorities));
    #/
    foreach (priority in priorities) {
        if (targets[priority].size > 0) {
            planner::setblackboardattribute(planner, #"current_target", targets[priority][0]);
            break;
        }
    }
    return spawnstruct();
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0xeca19666, Offset: 0x6020
// Size: 0x5aa
function private function_86270cca(planner, constant) {
    target = planner::getblackboardattribute(planner, #"current_target");
    validsquads = planner::getblackboardattribute(planner, #"valid_squads");
    if (getdvarint(#"hash_6cad7fcde98d23ee", 0)) {
        var_41ecbdf4 = array();
        if (!isdefined(target) || !isarray(validsquads) || validsquads.size <= 0) {
            planner::setblackboardattribute(planner, #"hash_1a25f2c4feaf60cf", var_41ecbdf4);
            return spawnstruct();
        }
        gameobject = target[#"__unsafe__"][#"object"];
        if (isdefined(gameobject)) {
            foreach (squad in validsquads) {
                pathablegameobjects = _calculateallpathablegameobjects(planner, squad, array(target));
                if (pathablegameobjects.size > 0) {
                    var_3703551e = array();
                    var_3703551e[#"squad"] = squad;
                    var_3703551e[#"pathablegameobjects"] = pathablegameobjects;
                    var_41ecbdf4[var_41ecbdf4.size] = var_3703551e;
                }
            }
        }
        component = target[#"__unsafe__"][#"component"];
        if (isdefined(component)) {
            foreach (squad in validsquads) {
                pathablecomponents = function_77cd4593(planner, squad, array(target));
                if (pathablecomponents.size > 0) {
                    var_3703551e = array();
                    var_3703551e[#"squad"] = squad;
                    var_3703551e[#"pathablecomponents"] = pathablecomponents;
                    var_41ecbdf4[var_41ecbdf4.size] = var_3703551e;
                }
            }
        }
        bundle = target[#"__unsafe__"][#"bundle"];
        if (isdefined(bundle)) {
            foreach (squad in validsquads) {
                pathablebundles = function_816f4052(planner, squad, array(target));
                if (pathablebundles.size > 0) {
                    var_3703551e = array();
                    var_3703551e[#"squad"] = squad;
                    var_3703551e[#"pathablebundles"] = pathablebundles;
                    var_41ecbdf4[var_41ecbdf4.size] = var_3703551e;
                }
            }
        }
        planner::setblackboardattribute(planner, #"hash_1a25f2c4feaf60cf", var_41ecbdf4);
    } else {
        var_41ecbdf4 = array();
        foreach (squad in validsquads) {
            var_3703551e = array();
            var_3703551e[#"squad"] = squad;
            var_41ecbdf4[var_41ecbdf4.size] = var_3703551e;
        }
        planner::setblackboardattribute(planner, #"hash_1a25f2c4feaf60cf", var_41ecbdf4);
    }
    return spawnstruct();
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0xdfa873d6, Offset: 0x65d8
// Size: 0x472
function private function_14c766b3(planner, constant) {
    possiblesquads = planner::getblackboardattribute(planner, #"possible_squads");
    target = planner::getblackboardattribute(planner, #"current_target");
    var_3db29cab = 0;
    if (target[#"type"] == "gameobject") {
        object = target[#"__unsafe__"][#"object"];
        if (isdefined(object) && isarray(object.keyobject) && object.keyobject.size > 0) {
            var_3db29cab = 1;
        }
    }
    players = planner::getblackboardattribute(planner, #"players");
    hasplayers = players.size > 0;
    var_8769837e = !hasplayers || target[#"strategy"].("doppelbotsinteractions") == #"hash_7fa10febd2862b4a";
    var_f75536ec = !hasplayers || target[#"strategy"].("companionsinteractions") == #"hash_7fa10febd2862b4a";
    var_f22aefd = strategiccommandutility::function_698a5382(target[#"strategy"]);
    groundvehicles = strategiccommandutility::function_54032f13(target[#"strategy"]);
    var_eda803e5 = groundvehicles;
    validsquads = [];
    foreach (squad in possiblesquads) {
        foreach (member in squad) {
            bot = member[#"__unsafe__"][#"bot"];
            if (!isdefined(bot)) {
                break;
            }
            if (!var_8769837e) {
                continue;
            }
            if (var_3db29cab && !bot gameobjects::has_key_object(object)) {
                continue;
            }
            if (var_f22aefd && member[#"type"] == "air") {
                validsquads[validsquads.size] = squad;
                break;
            } else if (groundvehicles && member[#"type"] == "ground") {
                validsquads[validsquads.size] = squad;
                break;
            } else if (var_eda803e5 && member[#"type"] == "bot") {
                validsquads[validsquads.size] = squad;
                break;
            }
        }
    }
    planner::setblackboardattribute(planner, #"valid_squads", validsquads);
    return spawnstruct();
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x83fd9145, Offset: 0x6a58
// Size: 0x2aa
function private function_52012b78(planner, constant) {
    target = planner::getblackboardattribute(planner, #"current_target");
    /#
        assert(isdefined(target));
    #/
    if (!isdefined(target)) {
        return spawnstruct();
    }
    strategy = target[#"strategy"];
    /#
        assert(isstruct(strategy));
    #/
    if (!isstruct(strategy)) {
        return spawnstruct();
    }
    distribution = strategy.("doppelbotsdistribution");
    priority = strategy.("doppelbotspriority");
    targets = planner::getblackboardattribute(planner, #"targets");
    /#
        assert(isarray(targets));
    #/
    if (!isarray(targets)) {
        return spawnstruct();
    }
    switch (distribution) {
    case #"evenly":
        arrayremoveindex(targets[priority], 0);
        targets[priority][targets.size] = target;
        break;
    case #"greedy":
        break;
    case #"uniquely":
        arrayremoveindex(targets[priority], 0);
        break;
    default:
        /#
            assert(0);
        #/
        break;
    }
    planner::setblackboardattribute(planner, #"targets", targets);
    return spawnstruct();
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x4de03a0b, Offset: 0x6d10
// Size: 0x2b2
function private function_34464159(planner, constant) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    doppelbots = planner::getblackboardattribute(planner, "doppelbots", squadindex);
    target = planner::getblackboardattribute(planner, "target", squadindex);
    bundle = target[#"__unsafe__"][#"bundle"];
    if (!isdefined(bundle)) {
        return spawnstruct();
    }
    team = planner::getblackboardattribute(planner, #"team");
    if (!strategiccommandutility::function_a0f88aca(bundle, team)) {
        return spawnstruct();
    }
    switch (bundle.m_str_type) {
    case #"escortbiped":
        entity = bundle.var_27726d51;
        break;
    }
    if (!isdefined(entity)) {
        return spawnstruct();
    }
    var_eec336d1 = [];
    if (!isdefined(var_eec336d1[#"__unsafe__"])) {
        var_eec336d1[#"__unsafe__"] = array();
    }
    var_eec336d1[#"__unsafe__"][#"entity"] = entity;
    entities = array(var_eec336d1);
    pathableescorts = function_98bde2b6(doppelbots, entities);
    planner::setblackboardattribute(planner, "pathable_escorts", pathableescorts, squadindex);
    return spawnstruct();
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x725f6c25, Offset: 0x6fd0
// Size: 0x10a
function private strategysquadcalculatepathableobjectivesparam(planner, constant) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    doppelbots = planner::getblackboardattribute(planner, "doppelbots", squadindex);
    objectives = planner::getblackboardattribute(planner, #"objectives");
    pathableobjectives = _calculateallpathableobjectives(doppelbots, objectives);
    planner::setblackboardattribute(planner, "pathable_objectives", pathableobjectives, squadindex);
    return spawnstruct();
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0xf477def6, Offset: 0x70e8
// Size: 0x10a
function private strategysquadcalculatepathableplayersparam(planner, constant) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    doppelbots = planner::getblackboardattribute(planner, "doppelbots", squadindex);
    players = planner::getblackboardattribute(planner, #"players");
    pathableescorts = _calculateallpathableclients(doppelbots, players);
    planner::setblackboardattribute(planner, "pathable_escorts", pathableescorts, squadindex);
    return spawnstruct();
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x2bb147ac, Offset: 0x7200
// Size: 0xf4
function private strategyincrementblackboardvalue(planner, constants) {
    /#
        assert(isarray(constants));
    #/
    /#
        assert(isstring(constants[#"name"]) || ishash(constants[#"name"]));
    #/
    planner::setblackboardattribute(planner, constants[#"name"], planner::getblackboardattribute(planner, constants[#"name"]) + 1);
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x7b0b17a1, Offset: 0x7300
// Size: 0x354
function private function_166d74b2(planner, constants) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex > 0, "<unknown string>");
    #/
    currentsquad = planner::getblackboardattribute(planner, "doppelbots", squadindex);
    possiblesquads = planner::getblackboardattribute(planner, #"possible_squads");
    for (i = 0; i < possiblesquads.size; i++) {
        var_b44338e1 = 1;
        foreach (possiblemember in possiblesquads[i]) {
            var_5dc382b8 = 0;
            foreach (currentmember in currentsquad) {
                if (possiblemember[#"entnum"] == currentmember[#"entnum"]) {
                    var_5dc382b8 = 1;
                    break;
                }
            }
            if (!var_5dc382b8) {
                var_b44338e1 = 0;
                break;
            }
        }
        if (var_b44338e1) {
            arrayremoveindex(possiblesquads, i);
            break;
        }
    }
    planner::setblackboardattribute(planner, #"possible_squads", possiblesquads);
    idlebots = array();
    for (squadindex = 0; squadindex < possiblesquads.size; squadindex++) {
        squad = possiblesquads[squadindex];
        for (var_353877ef = 0; var_353877ef < squad.size; var_353877ef++) {
            idlebots[idlebots.size] = squad[var_353877ef];
        }
    }
    /#
        var_26ae1214 = planner::getblackboardattribute(planner, #"idle_doppelbots").size;
        /#
            assert(var_26ae1214 > idlebots.size, "<unknown string>");
        #/
    #/
    planner::setblackboardattribute(planner, #"idle_doppelbots", idlebots);
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x928323a8, Offset: 0x7660
// Size: 0x1c4
function private function_f162255b(planner, constants) {
    targets = planner::getblackboardattribute(planner, #"targets");
    priorities = array(#"hash_179ccf9d7cfd1e31", #"hash_254689c549346d57", #"hash_4bd86f050b36e1f6", #"hash_19c0ac460bdb9928", #"hash_160b01bbcd78c723", #"hash_c045a5aa4ac7c1d", #"hash_47fd3da20e90cd01", #"hash_64fc5c612a94639c", #"hash_46658a8270df5a9e");
    /#
        assert(isarray(priorities));
    #/
    foreach (priority in priorities) {
        if (targets[priority].size > 0) {
            arrayremoveindex(targets[priority], 0);
            break;
        }
    }
    planner::setblackboardattribute(planner, #"targets", targets);
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x22d674df, Offset: 0x7830
// Size: 0xdc
function private strategysetblackboardvalue(planner, constants) {
    /#
        assert(isarray(constants));
    #/
    /#
        assert(isstring(constants[#"name"]) || ishash(constants[#"name"]));
    #/
    planner::setblackboardattribute(planner, constants[#"name"], constants[#"value"]);
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x2d925baa, Offset: 0x7918
// Size: 0xe4
function private function_20de0d52(planner, constants) {
    /#
        assert(isarray(constants));
    #/
    /#
        assert(isstring(constants[#"name"]) || ishash(constants[#"name"]));
    #/
    planner::setblackboardattribute(planner, constants[#"name"], array());
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x82e23cb1, Offset: 0x7a08
// Size: 0x1de
function private strategyshouldrushprogress(planner, constant) {
    if (planner::getblackboardattribute(planner, #"allow_progress_throttling") === 1) {
        enemycommander = planner::getblackboardattribute(planner, #"throttling_enemy_commander");
        if (!isdefined(enemycommander)) {
            return 0;
        }
        lowerbound = planner::getblackboardattribute(planner, #"throttling_lower_bound");
        upperbound = planner::getblackboardattribute(planner, #"throttling_upper_bound");
        destroyedassaults = planner::getblackboardattribute(planner, #"gameobjects_assault_destroyed");
        totalassaults = planner::getblackboardattribute(planner, #"throttling_total_gameobjects");
        if (!isdefined(totalassaults)) {
            totalassaults = planner::getblackboardattribute(planner, #"gameobjects_assault_total");
        }
        enemydestroyedassaults = blackboard::getstructblackboardattribute(enemycommander, #"gameobjects_assault_destroyed");
        enemytotalassaults = planner::getblackboardattribute(planner, #"throttling_total_gameobjects_enemy");
        if (!isdefined(enemytotalassaults)) {
            enemytotalassaults = blackboard::getstructblackboardattribute(enemycommander, #"gameobjects_assault_total");
        }
        return strategiccommandutility::calculateprogressrushing(lowerbound, upperbound, destroyedassaults, totalassaults, enemydestroyedassaults, enemytotalassaults);
    }
    return 0;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x329638fc, Offset: 0x7bf0
// Size: 0x1de
function private strategyshouldthrottleprogress(planner, constant) {
    if (planner::getblackboardattribute(planner, #"allow_progress_throttling") === 1) {
        enemycommander = planner::getblackboardattribute(planner, #"throttling_enemy_commander");
        if (!isdefined(enemycommander)) {
            return 0;
        }
        lowerbound = planner::getblackboardattribute(planner, #"throttling_lower_bound");
        upperbound = planner::getblackboardattribute(planner, #"throttling_upper_bound");
        destroyedassaults = planner::getblackboardattribute(planner, #"gameobjects_assault_destroyed");
        totalassaults = planner::getblackboardattribute(planner, #"throttling_total_gameobjects");
        if (!isdefined(totalassaults)) {
            totalassaults = planner::getblackboardattribute(planner, #"gameobjects_assault_total");
        }
        enemydestroyedassaults = blackboard::getstructblackboardattribute(enemycommander, #"gameobjects_assault_destroyed");
        enemytotalassaults = planner::getblackboardattribute(planner, #"throttling_total_gameobjects_enemy");
        if (!isdefined(enemytotalassaults)) {
            enemytotalassaults = blackboard::getstructblackboardattribute(enemycommander, #"gameobjects_assault_total");
        }
        return strategiccommandutility::calculateprogressthrottling(lowerbound, upperbound, destroyedassaults, totalassaults, enemydestroyedassaults, enemytotalassaults);
    }
    return 0;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0xefe2ed83, Offset: 0x7dd8
// Size: 0x122
function private strategysquadorderparam(planner, constants) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    /#
        assert(isstring(constants[#"order"]) || ishash(constants[#"order"]), "<unknown string>" + "<unknown string>" + "<unknown string>");
    #/
    planner::setblackboardattribute(planner, "order", constants[#"order"], squadindex);
    return spawnstruct();
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x3962dc7f, Offset: 0x7f08
// Size: 0xc2
function private strategysquadassignforcegoalparam(planner, constants) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    forcegoal = planner::getblackboardattribute(planner, #"force_goal");
    planner::setblackboardattribute(planner, "force_goal", forcegoal, squadindex);
    return spawnstruct();
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0xd08e876d, Offset: 0x7fd8
// Size: 0x26a
function private strategysquadassignpathableescortparam(planner, constants) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    pathableescorts = planner::getblackboardattribute(planner, "pathable_escorts", squadindex);
    if (!isarray(pathableescorts) || pathableescorts.size <= 0) {
        return spawnstruct();
    }
    shortestpath = pathableescorts[0][#"distance"];
    types = array("player", "entity");
    foreach (type in types) {
        if (isdefined(pathableescorts[0][type])) {
            escort = pathableescorts[0][type];
            for (index = 1; index < pathableescorts.size; index++) {
                pathableescort = pathableescorts[index];
                if (pathableescort[#"distance"] < shortestpath) {
                    shortestpath = pathableescort[#"distance"];
                    escort = pathableescort[type];
                }
            }
            planner::setblackboardattribute(planner, "escorts", array(escort), squadindex);
        }
    }
    return spawnstruct();
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x4c237ccc, Offset: 0x8250
// Size: 0x2c2
function private strategysquadassignpathableobjectparam(planner, constant) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    pathablegameobjects = planner::getblackboardattribute(planner, "pathable_gameobjects", squadindex);
    prioritynames = planner::getblackboardattribute(planner, #"gameobjects_priority");
    gameobject = undefined;
    foreach (priorityname in prioritynames) {
        foreach (pathablegameobject in pathablegameobjects) {
            if (pathablegameobject[#"gameobject"][#"identifier"] === priorityname) {
                gameobject = pathablegameobject[#"gameobject"];
                break;
            }
        }
    }
    if (!isdefined(gameobject)) {
        shortestpath = pathablegameobjects[0][#"distance"];
        gameobject = pathablegameobjects[0][#"gameobject"];
        for (index = 1; index < pathablegameobjects.size; index++) {
            pathablegameobject = pathablegameobjects[index];
            if (pathablegameobject[#"distance"] < shortestpath) {
                shortestpath = pathablegameobject[#"distance"];
                gameobject = pathablegameobject[#"gameobject"];
            }
        }
    }
    planner::setblackboardattribute(planner, "gameobjects", array(gameobject), squadindex);
    return spawnstruct();
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0xc0aefea8, Offset: 0x8520
// Size: 0x192
function private strategysquadassignpathableobjectiveparam(planner, constant) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    pathableobjectives = planner::getblackboardattribute(planner, "pathable_objectives", squadindex);
    shortestpath = pathableobjectives[0][#"distance"];
    objective = pathableobjectives[0][#"objective"];
    for (index = 1; index < pathableobjectives.size; index++) {
        pathableobjective = pathableobjectives[index];
        if (pathableobjective[#"distance"] < shortestpath) {
            shortestpath = pathableobjective[#"distance"];
            objective = pathableobjective[#"objective"];
        }
    }
    planner::setblackboardattribute(planner, "objectives", array(objective), squadindex);
    return spawnstruct();
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x796f4162, Offset: 0x86c0
// Size: 0x32a
function private strategysquadassignpathableunclaimedobjectparam(planner, constant) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    pathablegameobjects = planner::getblackboardattribute(planner, "pathable_gameobjects", squadindex);
    prioritynames = planner::getblackboardattribute(planner, #"gameobjects_priority");
    gameobject = undefined;
    foreach (priorityname in prioritynames) {
        foreach (pathablegameobject in pathablegameobjects) {
            if (!pathablegameobject[#"gameobject"][#"claimed"] && pathablegameobject[#"gameobject"][#"identifier"] === priorityname) {
                gameobject = pathablegameobject[#"gameobject"];
                break;
            }
        }
    }
    if (!isdefined(gameobject)) {
        shortestpath = undefined;
        foreach (pathablegameobject in pathablegameobjects) {
            if (!pathablegameobject[#"gameobject"][#"claimed"] && (!isdefined(shortestpath) || pathablegameobject[#"distance"] < shortestpath)) {
                shortestpath = pathablegameobject[#"distance"];
                gameobject = pathablegameobject[#"gameobject"];
            }
        }
    }
    if (isdefined(gameobject)) {
        planner::setblackboardattribute(planner, "gameobjects", array(gameobject), squadindex);
    }
    return spawnstruct();
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0xb4c9e3eb, Offset: 0x89f8
// Size: 0xda
function private function_b77887e(planner, constants) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    currenttarget = planner::getblackboardattribute(planner, #"current_target");
    /#
        assert(isdefined(currenttarget), "<unknown string>");
    #/
    planner::setblackboardattribute(planner, "target", currenttarget, squadindex);
    return spawnstruct();
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x4ba58032, Offset: 0x8ae0
// Size: 0x9a
function private strategysquadassignwanderparam(planner, constants) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    planner::setblackboardattribute(planner, "order", "order_wander", squadindex);
    return spawnstruct();
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x2daa736b, Offset: 0x8b88
// Size: 0x142
function private strategysquadclaimobjectparam(planner, constants) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    gameobjects = planner::getblackboardattribute(planner, "gameobjects", squadindex);
    /#
        assert(gameobjects.size > 0, "<unknown string>");
    #/
    foreach (gameobject in gameobjects) {
        gameobject[#"claimed"] = 1;
    }
    return spawnstruct();
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x12516e7c, Offset: 0x8cd8
// Size: 0x1c4
function private strategysquadcopyblackboardvalue(planner, constants) {
    /#
        assert(isstring(constants[#"from"]) || ishash(constants[#"from"]), "<unknown string>" + "<unknown string>" + "<unknown string>");
    #/
    /#
        assert(isstring(constants[#"to"]) || ishash(constants[#"to"]), "<unknown string>" + "<unknown string>" + "<unknown string>");
    #/
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    value = planner::getblackboardattribute(planner, constants[#"from"], squadindex);
    planner::setblackboardattribute(planner, constants[#"to"], value, squadindex);
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x3b984550, Offset: 0x8ea8
// Size: 0x1c4
function private function_86c0732e(planner, constants) {
    /#
        assert(isstring(constants[#"from"]) || ishash(constants[#"from"]), "<unknown string>" + "<unknown string>" + "<unknown string>");
    #/
    /#
        assert(isstring(constants[#"to"]) || ishash(constants[#"to"]), "<unknown string>" + "<unknown string>" + "<unknown string>");
    #/
    value = planner::getblackboardattribute(planner, constants[#"from"]);
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    planner::setblackboardattribute(planner, constants[#"to"], value, squadindex);
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x2200d856, Offset: 0x9078
// Size: 0x42
function private function_d58b0781(planner, constants) {
    return function_faa6dd57(planner, constants, constants[#"key"]);
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0xa22dc873, Offset: 0x90c8
// Size: 0x3a
function private function_45f841ea(planner, constants) {
    return function_faa6dd57(planner, constants, #"hash_1a25f2c4feaf60cf");
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 3, eflags: 0x5 linked
// Checksum 0x9e924dd4, Offset: 0x9110
// Size: 0x2c2
function private function_faa6dd57(planner, constants, var_92812a91) {
    squads = planner::getblackboardattribute(planner, var_92812a91);
    /#
        assert(isarray(squads));
    #/
    /#
        assert(squads.size > 0, "<unknown string>" + var_92812a91 + "<unknown string>");
    #/
    if (!isarray(squads)) {
        return spawnstruct();
    }
    var_75ff48f8 = squads[0];
    var_d91b9923 = array();
    foreach (botentry in var_75ff48f8[#"squad"]) {
        bot = botentry[#"__unsafe__"][#"bot"];
        if (!isdefined(bot)) {
            continue;
        }
        var_d91b9923[bot getentitynumber()] = 1;
    }
    squadindex = planner::createsubblackboard(planner);
    /#
        assert(squadindex <= 17, "<unknown string>");
    #/
    planner::setblackboardattribute(planner, #"current_squad", squadindex);
    planner::setblackboardattribute(planner, "doppelbots", var_75ff48f8[#"squad"], squadindex);
    team = planner::getblackboardattribute(planner, #"team");
    planner::setblackboardattribute(planner, "team", team, squadindex);
    return spawnstruct();
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0xbb81c77b, Offset: 0x93e0
// Size: 0x2c2
function private strategysquadcreateofsizexparam(planner, constants) {
    /#
        assert(isint(constants[#"amount"]), "<unknown string>" + "<unknown string>" + "<unknown string>");
    #/
    doppelbots = planner::getblackboardattribute(planner, #"idle_doppelbots");
    /#
        assert(doppelbots.size >= constants[#"amount"], "<unknown string>" + constants[#"amount"] + "<unknown string>");
    #/
    enlisteddoppelbots = array();
    idledoppelbots = array();
    for (index = 0; index < constants[#"amount"]; index++) {
        enlisteddoppelbots[enlisteddoppelbots.size] = doppelbots[index];
    }
    for (index = constants[#"amount"]; index < doppelbots.size; index++) {
        idledoppelbots[idledoppelbots.size] = doppelbots[index];
    }
    planner::setblackboardattribute(planner, #"idle_doppelbots", idledoppelbots);
    squadindex = planner::createsubblackboard(planner);
    /#
        assert(squadindex <= 17, "<unknown string>");
    #/
    planner::setblackboardattribute(planner, #"current_squad", squadindex);
    planner::setblackboardattribute(planner, "doppelbots", enlisteddoppelbots, squadindex);
    team = planner::getblackboardattribute(planner, #"team");
    planner::setblackboardattribute(planner, "team", team, squadindex);
    return spawnstruct();
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0xbe9bbcf3, Offset: 0x96b0
// Size: 0x1ba
function private strategysquadescortassignmainguardparam(planner, constants) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    escorts = planner::getblackboardattribute(planner, "escorts", squadindex);
    squadbots = planner::getblackboardattribute(planner, "doppelbots", squadindex);
    foreach (escort in escorts) {
        escort[#"escortmainguard"] = arraycombine(escort[#"escortmainguard"], squadbots, 1, 0);
    }
    planner::setblackboardattribute(planner, "escorts", escorts, squadindex);
    planner::setblackboardattribute(planner, "order", "order_escort_mainguard", squadindex);
    return spawnstruct();
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0xc6b10255, Offset: 0x9878
// Size: 0x1ba
function private strategysquadescortassignrearguardparam(planner, constants) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    escorts = planner::getblackboardattribute(planner, "escorts", squadindex);
    squadbots = planner::getblackboardattribute(planner, "doppelbots", squadindex);
    foreach (escort in escorts) {
        escort[#"escortrearguard"] = arraycombine(escort[#"escortrearguard"], squadbots, 1, 0);
    }
    planner::setblackboardattribute(planner, "escorts", escorts, squadindex);
    planner::setblackboardattribute(planner, "order", "order_escort_rearguard", squadindex);
    return spawnstruct();
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x402e2e8a, Offset: 0x9a40
// Size: 0x1ba
function private strategysquadescortassignvanguardparam(planner, constants) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    escorts = planner::getblackboardattribute(planner, "escorts", squadindex);
    squadbots = planner::getblackboardattribute(planner, "doppelbots", squadindex);
    foreach (escort in escorts) {
        escort[#"escortvanguard"] = arraycombine(escort[#"escortvanguard"], squadbots, 1, 0);
    }
    planner::setblackboardattribute(planner, "escorts", escorts, squadindex);
    planner::setblackboardattribute(planner, "order", "order_escort_vanguard", squadindex);
    return spawnstruct();
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x3bc20ace, Offset: 0x9c08
// Size: 0x11a
function private strategysquadescortcalculatepathablepoiparam(planner, constants) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    escorts = planner::getblackboardattribute(planner, "escorts", squadindex);
    /#
        assert(isarray(escorts) && escorts.size > 0, "<unknown string>");
    #/
    escortpoi = array();
    planner::setblackboardattribute(planner, "escort_poi", escortpoi, squadindex);
    return spawnstruct();
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x4e929437, Offset: 0x9d30
// Size: 0x10e
function private strategysquadescorthasnomainguard(planner, constants) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    escorts = planner::getblackboardattribute(planner, "escorts", squadindex);
    foreach (escort in escorts) {
        if (escort[#"escortmainguard"].size > 0) {
            return 1;
        }
    }
    return 1;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0xc7128a9e, Offset: 0x9e48
// Size: 0x10c
function private strategysquadescorthasnorearguard(planner, constants) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    escorts = planner::getblackboardattribute(planner, "escorts", squadindex);
    foreach (escort in escorts) {
        if (escort[#"escortrearguard"].size > 0) {
            return 0;
        }
    }
    return 1;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x59c91ab0, Offset: 0x9f60
// Size: 0x10c
function private strategysquadescorthasnovanguard(planner, constants) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    escorts = planner::getblackboardattribute(planner, "escorts", squadindex);
    foreach (escort in escorts) {
        if (escort[#"escortvanguard"].size > 0) {
            return 0;
        }
    }
    return 1;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0xc4dd410, Offset: 0xa078
// Size: 0x19c
function private strategysquadsortescortpoi(planner, constants) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    escortpois = planner::getblackboardattribute(planner, "escort_poi", squadindex);
    if (escortpois.size > 0) {
        for (index = 0; index < escortpois.size; index++) {
            closestindex = index;
            for (innerindex = index + 1; innerindex < escortpois.size; innerindex++) {
                if (escortpois[innerindex][#"distance"] < escortpois[closestindex][#"distance"]) {
                    closestindex = innerindex;
                }
            }
            temp = escortpois[index];
            escortpois[index] = escortpois[closestindex];
            escortpois[closestindex] = temp;
        }
    }
    planner::setblackboardattribute(planner, "escort_poi", escortpois, squadindex);
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0xa9d5736, Offset: 0xa220
// Size: 0x146
function private bunker_exposure_scale(planner, constants) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    /#
        assert(isstring(constants[#"key"]) || ishash(constants[#"key"]), "<unknown string>" + "<unknown string>" + "<unknown string>");
    #/
    attribute = planner::getblackboardattribute(planner, constants[#"key"], squadindex);
    if (isdefined(attribute) && isarray(attribute)) {
        return (attribute.size > 0);
    }
    return 0;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x3675944a, Offset: 0xa370
// Size: 0x98
function private strategysquadhaspathableescort(planner, constants) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    escorts = planner::getblackboardattribute(planner, "pathable_escorts", squadindex);
    return escorts.size > 0;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0xc1ab06b1, Offset: 0xa410
// Size: 0xa2
function private strategysquadhaspathableobject(planner, constants) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    gameobjects = planner::getblackboardattribute(planner, "pathable_gameobjects", squadindex);
    return isdefined(gameobjects) && gameobjects.size > 0;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x4a4aa98b, Offset: 0xa4c0
// Size: 0x98
function private strategysquadhaspathableobjective(planner, constants) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    objectives = planner::getblackboardattribute(planner, "pathable_objectives", squadindex);
    return objectives.size > 0;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0xc1dfeb1, Offset: 0xa560
// Size: 0xee
function private strategysquadhaspathableunclaimedobject(planner, constant) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    gameobjects = planner::getblackboardattribute(planner, "pathable_gameobjects", squadindex);
    for (index = 0; index < gameobjects.size; index++) {
        if (!gameobjects[index][#"gameobject"][#"claimed"]) {
            return 1;
        }
    }
    return 0;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x2ea818a3, Offset: 0xa658
// Size: 0xa2
function private strategyhasatleastxassaultobjects(planner, constants) {
    /#
        assert(isint(constants[#"amount"]), "<unknown string>" + "<unknown string>" + "<unknown string>");
    #/
    return planner::getblackboardattribute(planner, #"gameobjects_assault").size >= constants[#"amount"];
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x2edfed4c, Offset: 0xa708
// Size: 0xa2
function private strategyhasatleastxdefendobjects(planner, constants) {
    /#
        assert(isint(constants[#"amount"]), "<unknown string>" + "<unknown string>" + "<unknown string>");
    #/
    return planner::getblackboardattribute(planner, #"gameobjects_defend").size >= constants[#"amount"];
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0xeb6fd23d, Offset: 0xa7b8
// Size: 0xa2
function private strategyhasatleastxobjectives(planner, constants) {
    /#
        assert(isint(constants[#"amount"]), "<unknown string>" + "<unknown string>" + "<unknown string>");
    #/
    return planner::getblackboardattribute(planner, #"objectives").size >= constants[#"amount"];
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x5da7ebb0, Offset: 0xa868
// Size: 0xa2
function private strategyhasatleastxplayers(planner, constants) {
    /#
        assert(isint(constants[#"amount"]), "<unknown string>" + "<unknown string>" + "<unknown string>");
    #/
    return planner::getblackboardattribute(planner, #"players").size >= constants[#"amount"];
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x28d70af3, Offset: 0xa918
// Size: 0x21e
function private strategyhasatleastxpriorityassaultobjects(planner, constants) {
    /#
        assert(isint(constants[#"amount"]), "<unknown string>" + "<unknown string>" + "<unknown string>");
    #/
    if (strategyhasatleastxassaultobjects(planner, constants)) {
        prioritynames = planner::getblackboardattribute(planner, #"gameobjects_priority");
        prioritymap = [];
        foreach (priorityname in prioritynames) {
            prioritymap[priorityname] = 1;
        }
        priorityobjects = 0;
        gameobjects = planner::getblackboardattribute(planner, #"gameobjects_assault");
        foreach (gameobject in gameobjects) {
            if (isdefined(gameobject[#"identifier"]) && isdefined(prioritymap[gameobject[#"identifier"]])) {
                priorityobjects++;
            }
        }
        return (priorityobjects >= constants[#"amount"]);
    }
    return 0;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x3b7f891e, Offset: 0xab40
// Size: 0x21e
function private strategyhasatleastxprioritydefendobjects(planner, constants) {
    /#
        assert(isint(constants[#"amount"]), "<unknown string>" + "<unknown string>" + "<unknown string>");
    #/
    if (strategyhasatleastxassaultobjects(planner, constants)) {
        prioritynames = planner::getblackboardattribute(planner, #"gameobjects_priority");
        prioritymap = [];
        foreach (priorityname in prioritynames) {
            prioritymap[priorityname] = 1;
        }
        priorityobjects = 0;
        gameobjects = planner::getblackboardattribute(planner, #"gameobjects_defend");
        foreach (gameobject in gameobjects) {
            if (isdefined(gameobject[#"identifier"]) && isdefined(prioritymap[gameobject[#"identifier"]])) {
                priorityobjects++;
            }
        }
        return (priorityobjects >= constants[#"amount"]);
    }
    return 0;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x9ef6ecc, Offset: 0xad68
// Size: 0xa2
function private strategyhasatleastxunassignedbots(planner, constants) {
    /#
        assert(isint(constants[#"amount"]), "<unknown string>" + "<unknown string>" + "<unknown string>");
    #/
    return planner::getblackboardattribute(planner, #"idle_doppelbots").size >= constants[#"amount"];
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x1 linked
// Checksum 0xfb435738, Offset: 0xae18
// Size: 0x13a
function strategyhasatleastxunclaimedassaultobjects(planner, constants) {
    /#
        assert(isint(constants[#"amount"]), "<unknown string>" + "<unknown string>" + "<unknown string>");
    #/
    unclaimedobjects = 0;
    gameobjects = planner::getblackboardattribute(planner, #"gameobjects_assault");
    foreach (gameobject in gameobjects) {
        if (!gameobject[#"claimed"]) {
            unclaimedobjects++;
        }
    }
    return unclaimedobjects >= constants[#"amount"];
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x1 linked
// Checksum 0xe06dbe3, Offset: 0xaf60
// Size: 0x13a
function strategyhasatleastxunclaimeddefendobjects(planner, constants) {
    /#
        assert(isint(constants[#"amount"]), "<unknown string>" + "<unknown string>" + "<unknown string>");
    #/
    unclaimedobjects = 0;
    gameobjects = planner::getblackboardattribute(planner, #"gameobjects_defend");
    foreach (gameobject in gameobjects) {
        if (!gameobject[#"claimed"]) {
            unclaimedobjects++;
        }
    }
    return unclaimedobjects >= constants[#"amount"];
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x1 linked
// Checksum 0x955290e9, Offset: 0xb0a8
// Size: 0x236
function strategyhasatleastxunclaimedpriorityassaultobjects(planner, constants) {
    /#
        assert(isint(constants[#"amount"]), "<unknown string>" + "<unknown string>" + "<unknown string>");
    #/
    if (strategyhasatleastxassaultobjects(planner, constants)) {
        prioritynames = planner::getblackboardattribute(planner, #"gameobjects_priority");
        prioritymap = [];
        foreach (priorityname in prioritynames) {
            prioritymap[priorityname] = 1;
        }
        priorityobjects = 0;
        gameobjects = planner::getblackboardattribute(planner, #"gameobjects_assault");
        foreach (gameobject in gameobjects) {
            if (isdefined(gameobject[#"identifier"]) && isdefined(prioritymap[gameobject[#"identifier"]]) && !gameobject[#"claimed"]) {
                priorityobjects++;
            }
        }
        return (priorityobjects >= constants[#"amount"]);
    }
    return 0;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x1 linked
// Checksum 0x73fe3214, Offset: 0xb2e8
// Size: 0x236
function strategyhasatleastxunclaimedprioritydefendobjects(planner, constants) {
    /#
        assert(isint(constants[#"amount"]), "<unknown string>" + "<unknown string>" + "<unknown string>");
    #/
    if (strategyhasatleastxassaultobjects(planner, constants)) {
        prioritynames = planner::getblackboardattribute(planner, #"gameobjects_priority");
        prioritymap = [];
        foreach (priorityname in prioritynames) {
            prioritymap[priorityname] = 1;
        }
        priorityobjects = 0;
        gameobjects = planner::getblackboardattribute(planner, #"gameobjects_defend");
        foreach (gameobject in gameobjects) {
            if (isdefined(gameobject[#"identifier"]) && isdefined(prioritymap[gameobject[#"identifier"]]) && !gameobject[#"claimed"]) {
                priorityobjects++;
            }
        }
        return (priorityobjects >= constants[#"amount"]);
    }
    return 0;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x1 linked
// Checksum 0x6f80d6eb, Offset: 0xb528
// Size: 0x34
function strategyhasforcegoal(planner, constants) {
    return isdefined(planner::getblackboardattribute(planner, #"force_goal"));
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x1 linked
// Checksum 0xc97968de, Offset: 0xb568
// Size: 0x1dc
function function_f6a3c6d5(planner, constants) {
    targets = planner::getblackboardattribute(planner, #"targets");
    /#
        assert(isarray(targets));
    #/
    if (!isarray(targets)) {
        return 0;
    }
    priorities = array(#"hash_179ccf9d7cfd1e31", #"hash_254689c549346d57", #"hash_4bd86f050b36e1f6", #"hash_19c0ac460bdb9928", #"hash_160b01bbcd78c723", #"hash_c045a5aa4ac7c1d", #"hash_47fd3da20e90cd01", #"hash_64fc5c612a94639c", #"hash_46658a8270df5a9e");
    /#
        assert(isarray(priorities));
    #/
    foreach (priority in priorities) {
        if (targets[priority].size > 0) {
            return 1;
        }
    }
    return 0;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0xd89c2275, Offset: 0xb750
// Size: 0x38
function private strategypathinghascalculatedpaths(planner, constants) {
    return planner::getblackboardattribute(planner, #"pathing_calculated_paths").size > 0;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x59269413, Offset: 0xb790
// Size: 0xae
function private strategypathinghascalculatedpathablepath(planner, constants) {
    bots = planner::getblackboardattribute(planner, #"pathing_requested_bots");
    botindex = planner::getblackboardattribute(planner, #"pathing_current_bot_index");
    calculatedpaths = planner::getblackboardattribute(planner, #"pathing_calculated_paths");
    return calculatedpaths.size >= bots.size && botindex >= bots.size;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0xc6de43d8, Offset: 0xb848
// Size: 0x38
function private strategypathinghasnorequestpoints(planner, constants) {
    return planner::getblackboardattribute(planner, #"pathing_requested_points").size <= 0;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x18ee9fed, Offset: 0xb888
// Size: 0x38
function private strategypathinghasrequestpoints(planner, constants) {
    return planner::getblackboardattribute(planner, #"pathing_requested_points").size > 0;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x8a19570, Offset: 0xb8c8
// Size: 0x72
function private strategypathinghasunprocessedgameobjects(planner, constants) {
    requestedgameobjects = planner::getblackboardattribute(planner, #"pathing_requested_gameobjects");
    gameobjectindex = planner::getblackboardattribute(planner, #"pathing_current_gameobject_index");
    return gameobjectindex < requestedgameobjects.size;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x291009a6, Offset: 0xb948
// Size: 0x72
function private strategypathinghasunprocessedobjectives(planner, constants) {
    requestedobjectives = planner::getblackboardattribute(planner, #"pathing_requested_objectives");
    objectiveindex = planner::getblackboardattribute(planner, #"pathing_current_objective_index");
    return objectiveindex < requestedobjectives.size;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0xaddb5985, Offset: 0xb9c8
// Size: 0xd4
function private strategypathinghasunprocessedrequestpoints(planner, constants) {
    requestedpoints = planner::getblackboardattribute(planner, #"pathing_requested_points");
    bots = planner::getblackboardattribute(planner, #"pathing_requested_bots");
    pointindex = planner::getblackboardattribute(planner, #"pathing_current_point_index");
    botindex = planner::getblackboardattribute(planner, #"pathing_current_bot_index");
    return pointindex < requestedpoints.size && botindex < bots.size;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0xe92493a1, Offset: 0xbaa8
// Size: 0x72
function private strategypathinghasunreachablepath(planner, constants) {
    botindex = planner::getblackboardattribute(planner, #"pathing_current_bot_index");
    calculatedpaths = planner::getblackboardattribute(planner, #"pathing_calculated_paths");
    return botindex > calculatedpaths.size;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0xbc4b86c9, Offset: 0xbb28
// Size: 0x72
function private strategypathingaddassaultgameobjectsparam(planner, constants) {
    assaultobjects = planner::getblackboardattribute(planner, #"gameobjects_assault");
    planner::setblackboardattribute(planner, #"pathing_requested_gameobjects", assaultobjects);
    return spawnstruct();
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x896d087a, Offset: 0xbba8
// Size: 0x72
function private strategypathingadddefendgameobjectsparam(planner, constants) {
    defendobjects = planner::getblackboardattribute(planner, #"gameobjects_defend");
    planner::setblackboardattribute(planner, #"pathing_requested_gameobjects", defendobjects);
    return spawnstruct();
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x3293fa65, Offset: 0xbc28
// Size: 0x72
function private strategypathingaddobjectivesparam(planner, constants) {
    objectives = planner::getblackboardattribute(planner, #"objectives");
    planner::setblackboardattribute(planner, #"pathing_requested_objectives", objectives);
    return spawnstruct();
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0xf2ee7744, Offset: 0xbca8
// Size: 0xc2
function private strategypathingaddsquadbotsparam(planner, constants) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    doppelbots = planner::getblackboardattribute(planner, "doppelbots", squadindex);
    planner::setblackboardattribute(planner, #"pathing_requested_bots", doppelbots);
    return spawnstruct();
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0xa01d8bba, Offset: 0xbd78
// Size: 0x19a
function private strategypathingaddsquadescortsparam(planner, constants) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    escorts = planner::getblackboardattribute(planner, "escorts", squadindex);
    for (index = 0; index < escorts.size; index++) {
        player = escorts[index][#"__unsafe__"][#"player"];
        if (!isdefined(escorts[index][#"__unsafe__"])) {
            escorts[index][#"__unsafe__"] = array();
        }
        escorts[index][#"__unsafe__"][#"bot"] = player;
    }
    planner::setblackboardattribute(planner, #"pathing_requested_bots", escorts);
    return spawnstruct();
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0xde41e2f6, Offset: 0xbf20
// Size: 0x142
function private strategypathingaddtosquadcalculatedgameobjectsparam(planner, constants) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    calculatedgameobjects = planner::getblackboardattribute(planner, #"pathing_calculated_gameobjects");
    gameobjects = planner::getblackboardattribute(planner, "gameobjects", squadindex);
    if (!isdefined(gameobjects)) {
        gameobjects = array();
    }
    if (isdefined(calculatedgameobjects) && calculatedgameobjects.size > 0) {
        gameobjects = arraycombine(gameobjects, calculatedgameobjects, 0, 0);
    }
    planner::setblackboardattribute(planner, "pathable_gameobjects", gameobjects, squadindex);
    return spawnstruct();
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0xdd4b4596, Offset: 0xc070
// Size: 0x142
function private strategypathingaddtosquadcalculatedobjectivesparam(planner, constants) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    calculatedobjectives = planner::getblackboardattribute(planner, #"pathing_calculated_objectives");
    objectives = planner::getblackboardattribute(planner, "objectives", squadindex);
    if (!isdefined(objectives)) {
        objectives = array();
    }
    if (isdefined(calculatedobjectives) && calculatedobjectives.size > 0) {
        objectives = arraycombine(objectives, calculatedobjectives, 0, 0);
    }
    planner::setblackboardattribute(planner, "pathable_objectives", objectives, squadindex);
    return spawnstruct();
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0xeca1e02c, Offset: 0xc1c0
// Size: 0x332
function private strategypathingcalculatepathtorequestedpointsparam(planner, constants) {
    requestedpoints = planner::getblackboardattribute(planner, #"pathing_requested_points");
    bots = planner::getblackboardattribute(planner, #"pathing_requested_bots");
    pointindex = planner::getblackboardattribute(planner, #"pathing_current_point_index");
    botindex = planner::getblackboardattribute(planner, #"pathing_current_bot_index");
    /#
        assert(bots.size > 0);
    #/
    /#
        assert(requestedpoints.size > 0);
    #/
    /#
        assert(pointindex < requestedpoints.size);
    #/
    /#
        assert(botindex < bots.size);
    #/
    if (bots.size > 0 && requestedpoints.size > 0 && pointindex < requestedpoints.size && botindex < bots.size) {
        bot = bots[botindex][#"__unsafe__"][#"bot"];
        goalpoints = array();
        startindex = pointindex;
        index = 0;
        while (pointindex < requestedpoints.size && index < 16) {
            goalpoints[goalpoints.size] = requestedpoints[pointindex];
            index++;
            pointindex++;
        }
        path = strategiccommandutility::calculatepathtopoints(bot, goalpoints);
        if (isdefined(path)) {
            calculatedpaths = planner::getblackboardattribute(planner, #"pathing_calculated_paths");
            calculatedpaths[calculatedpaths.size] = path;
            planner::setblackboardattribute(planner, #"pathing_calculated_paths", calculatedpaths, undefined, 1);
        }
        if (isdefined(path) || pointindex >= requestedpoints.size) {
            pointindex = 0;
            botindex++;
        }
        planner::setblackboardattribute(planner, #"pathing_current_point_index", pointindex);
        planner::setblackboardattribute(planner, #"pathing_current_bot_index", botindex);
    }
    return spawnstruct();
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x49cc39a7, Offset: 0xc500
// Size: 0x1c2
function private strategypathingcalculategameobjectrequestpointsparam(planner, constants) {
    requestedbots = planner::getblackboardattribute(planner, #"pathing_requested_bots");
    requestedgameobjects = planner::getblackboardattribute(planner, #"pathing_requested_gameobjects");
    gameobjectindex = planner::getblackboardattribute(planner, #"pathing_current_gameobject_index");
    if (requestedbots.size <= 0 || requestedgameobjects.size <= 0) {
        return spawnstruct();
    }
    requestedbot = requestedbots[0];
    bot = requestedbot[#"__unsafe__"][#"bot"];
    gameobject = requestedgameobjects[gameobjectindex][#"__unsafe__"][#"object"];
    requestedpoints = array();
    if (strategiccommandutility::isvalidbotorplayer(bot) && isdefined(gameobject)) {
        requestedpoints = strategiccommandutility::querypointsaroundgameobject(bot, gameobject);
    }
    planner::setblackboardattribute(planner, #"pathing_requested_points", requestedpoints);
    return spawnstruct();
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x6b4a2b41, Offset: 0xc6d0
// Size: 0x1c2
function private strategypathingcalculateobjectiverequestpointsparam(planner, constants) {
    requestedbots = planner::getblackboardattribute(planner, #"pathing_requested_bots");
    requestedobjectives = planner::getblackboardattribute(planner, #"pathing_requested_objectives");
    objectiveindex = planner::getblackboardattribute(planner, #"pathing_current_objective_index");
    if (requestedbots.size <= 0 || requestedobjectives.size <= 0) {
        return spawnstruct();
    }
    requestedbot = requestedbots[0];
    bot = requestedbot[#"__unsafe__"][#"bot"];
    trigger = requestedobjectives[objectiveindex][#"__unsafe__"][#"trigger"];
    requestedpoints = array();
    if (strategiccommandutility::isvalidbotorplayer(bot) && isdefined(trigger)) {
        requestedpoints = strategiccommandutility::querypointsinsidetrigger(bot, trigger);
    }
    planner::setblackboardattribute(planner, #"pathing_requested_points", requestedpoints);
    return spawnstruct();
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x7c849866, Offset: 0xc8a0
// Size: 0x1f2
function private strategypathingcalculateobjectivepathabilityparam(planner, constants) {
    requestedbots = planner::getblackboardattribute(planner, #"pathing_requested_bots");
    requestedobjectives = planner::getblackboardattribute(planner, #"pathing_requested_objectives");
    objectiveindex = planner::getblackboardattribute(planner, #"pathing_current_objective_index");
    calculatedpaths = planner::getblackboardattribute(planner, #"pathing_calculated_paths");
    if (requestedbots.size == calculatedpaths.size) {
        longestpath = 0;
        for (index = 0; index < calculatedpaths.size; index++) {
            if (calculatedpaths[index].pathdistance > longestpath) {
                longestpath = calculatedpaths[index].pathdistance;
            }
        }
        objectiveentry = array();
        objectiveentry[#"distance"] = longestpath;
        objectiveentry[#"objective"] = requestedobjectives[objectiveindex];
        calculatedobjectives = planner::getblackboardattribute(planner, #"pathing_calculated_objectives");
        calculatedobjectives[calculatedobjectives.size] = objectiveentry;
        planner::setblackboardattribute(planner, #"pathing_calculated_objectives", calculatedobjectives);
    }
    return spawnstruct();
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 2, eflags: 0x5 linked
// Checksum 0xfdbe9524, Offset: 0xcaa0
// Size: 0x1f2
function private strategypathingcalculategameobjectpathabilityparam(planner, constants) {
    requestedbots = planner::getblackboardattribute(planner, #"pathing_requested_bots");
    requestedgameobjects = planner::getblackboardattribute(planner, #"pathing_requested_gameobjects");
    gameobjectindex = planner::getblackboardattribute(planner, #"pathing_current_gameobject_index");
    calculatedpaths = planner::getblackboardattribute(planner, #"pathing_calculated_paths");
    if (requestedbots.size == calculatedpaths.size) {
        longestpath = 0;
        for (index = 0; index < calculatedpaths.size; index++) {
            if (calculatedpaths[index].pathdistance > longestpath) {
                longestpath = calculatedpaths[index].pathdistance;
            }
        }
        gameobjectentry = array();
        gameobjectentry[#"distance"] = longestpath;
        gameobjectentry[#"gameobject"] = requestedgameobjects[gameobjectindex];
        calculatedgameobjects = planner::getblackboardattribute(planner, #"pathing_calculated_gameobjects");
        calculatedgameobjects[calculatedgameobjects.size] = gameobjectentry;
        planner::setblackboardattribute(planner, #"pathing_calculated_gameobjects", calculatedgameobjects);
    }
    return spawnstruct();
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 3, eflags: 0x5 linked
// Checksum 0x6261aad, Offset: 0xcca0
// Size: 0x166
function private function_61d2b8ef(commander, squad, constants) {
    doppelbots = plannersquadutility::getblackboardattribute(squad, "doppelbots");
    order = plannersquadutility::getblackboardattribute(squad, "order");
    if (isdefined(doppelbots) && doppelbots.size > 0 && isdefined(order)) {
        foreach (botentry in doppelbots) {
            bot = botentry[#"__unsafe__"][#"bot"];
            if (isdefined(bot) && order == "follow_chain" && bot isinvehicle()) {
                return 0;
            }
        }
        return 1;
    }
    return 1;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 3, eflags: 0x5 linked
// Checksum 0x91fad4cc, Offset: 0xce10
// Size: 0x116
function private utilityscorebotpresence(commander, squad, constants) {
    doppelbots = plannersquadutility::getblackboardattribute(squad, "doppelbots");
    if (isdefined(doppelbots) && doppelbots.size > 0) {
        foreach (botentry in doppelbots) {
            bot = botentry[#"__unsafe__"][#"bot"];
            if (!strategiccommandutility::isvalidbot(bot)) {
                return 0;
            }
        }
        return 1;
    }
    return 1;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 3, eflags: 0x5 linked
// Checksum 0xfdb247bc, Offset: 0xcf30
// Size: 0x18e
function private function_de2b04c0(commander, squad, constants) {
    doppelbots = plannersquadutility::getblackboardattribute(squad, "doppelbots");
    if (isdefined(doppelbots) && doppelbots.size > 0) {
        foreach (botentry in doppelbots) {
            bot = botentry[#"__unsafe__"][#"bot"];
            if (!isdefined(bot)) {
                return 0;
            }
            if (bot isinvehicle() && botentry[#"type"] == "bot") {
                return 0;
            } else if (!bot isinvehicle() && botentry[#"type"] != "bot") {
                return 0;
            }
            if (!strategiccommandutility::function_4732f860(bot)) {
                return 0;
            }
        }
    }
    return 1;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 3, eflags: 0x5 linked
// Checksum 0x587c1973, Offset: 0xd0c8
// Size: 0x1fe
function private utilityscoreescortpathing(commander, squad, constants) {
    doppelbots = plannersquadutility::getblackboardattribute(squad, "doppelbots");
    escorts = plannersquadutility::getblackboardattribute(squad, "escorts");
    escortpoi = plannersquadutility::getblackboardattribute(squad, "escort_poi");
    if (!isdefined(doppelbots) || doppelbots.size <= 0) {
        return 1;
    }
    if (!isdefined(escorts) || escorts.size <= 0) {
        return 1;
    }
    if (!blackboard::getstructblackboardattribute(commander, #"allow_escort")) {
        return 0;
    }
    if (_calculateallpathableclients(doppelbots, escorts).size < escorts.size) {
        return 0;
    }
    if (isdefined(escortpoi) && escortpoi.size > 0) {
        return 0;
    } else {
        assaultgameobjects = blackboard::getstructblackboardattribute(commander, #"gameobjects_assault");
        defendgameobjects = blackboard::getstructblackboardattribute(commander, #"gameobjects_defend");
        objectives = blackboard::getstructblackboardattribute(commander, #"objectives");
        if (assaultgameobjects.size > 0 || defendgameobjects.size > 0 || objectives.size > 0) {
            return 0;
        }
    }
    return 1;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 3, eflags: 0x1 linked
// Checksum 0x9286fa76, Offset: 0xd2d0
// Size: 0xae
function utilityscoreforcegoal(commander, squad, constants) {
    doppelbots = plannersquadutility::getblackboardattribute(squad, "doppelbots");
    squadforcegoal = plannersquadutility::getblackboardattribute(squad, "force_goal");
    forcegoal = blackboard::getstructblackboardattribute(commander, #"force_goal");
    if (forcegoal !== squadforcegoal) {
        return 0;
    }
    return 1;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 3, eflags: 0x5 linked
// Checksum 0x50bfd1, Offset: 0xd388
// Size: 0x172
function private utilityscoregameobjectpathing(commander, squad, constants) {
    doppelbots = plannersquadutility::getblackboardattribute(squad, "doppelbots");
    if (!isdefined(doppelbots) || doppelbots.size <= 0) {
        return 1;
    }
    foreach (botentry in doppelbots) {
        bot = botentry[#"__unsafe__"][#"bot"];
        if (!strategiccommandutility::isvalidbot(bot)) {
            continue;
        }
        if (isalive(bot) && !bot isingoal(bot.origin) && !bot haspath()) {
            return 0;
        }
    }
    return 1;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 3, eflags: 0x5 linked
// Checksum 0x837ca704, Offset: 0xd508
// Size: 0x42a
function private utilityscoregameobjectpriority(commander, squad, constants) {
    priorityidentifiers = constants[#"priority"];
    if (!isdefined(priorityidentifiers) || priorityidentifiers.size <= 0) {
        return 1;
    }
    squadobjects = plannersquadutility::getblackboardattribute(squad, "gameobjects");
    if (isdefined(squadobjects)) {
        prioritygameobjects = _calculateprioritygameobjects(squadobjects, priorityidentifiers);
        if (prioritygameobjects.size > 0) {
            return 1;
        }
    }
    assaultobjects = blackboard::getstructblackboardattribute(commander, #"gameobjects_assault");
    defendobjects = blackboard::getstructblackboardattribute(commander, #"gameobjects_defend");
    activeidentifiers = [];
    currentsquadassignedpriority = 0;
    if (isarray(assaultobjects)) {
        prioritygameobjects = _calculateprioritygameobjects(assaultobjects, priorityidentifiers);
        foreach (gameobjectentry in prioritygameobjects) {
            activeidentifiers[gameobjectentry[#"identifier"]] = 1;
        }
    }
    if (isarray(defendobjects)) {
        prioritygameobjects = _calculateprioritygameobjects(defendobjects, priorityidentifiers);
        foreach (gameobjectentry in prioritygameobjects) {
            activeidentifiers[gameobjectentry[#"identifier"]] = 1;
        }
    }
    if (activeidentifiers.size > 0) {
        foreach (currentsquad in commander.squads) {
            if (currentsquad == squad) {
                continue;
            }
            squadobjects = plannersquadutility::getblackboardattribute(currentsquad, "gameobjects");
            if (isdefined(squadobjects)) {
                prioritygameobjects = _calculateprioritygameobjects(squadobjects, priorityidentifiers);
                foreach (gameobjectentry in prioritygameobjects) {
                    activeidentifiers[gameobjectentry[#"identifier"]] = 0;
                }
            }
        }
    }
    foreach (value in activeidentifiers) {
        if (value) {
            return 0;
        }
    }
    return 1;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 3, eflags: 0x5 linked
// Checksum 0xe2598487, Offset: 0xd940
// Size: 0x132
function private utilityscoregameobjectsvalidity(commander, squad, constants) {
    gameobjects = plannersquadutility::getblackboardattribute(squad, "gameobjects");
    if (!isdefined(gameobjects)) {
        return 1;
    }
    foreach (gameobjectentry in gameobjects) {
        gameobject = gameobjectentry[#"__unsafe__"][#"object"];
        if (!isdefined(gameobject) || isdefined(gameobject.trigger) && !gameobject.trigger istriggerenabled()) {
            return 0;
        }
    }
    return 1;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 3, eflags: 0x5 linked
// Checksum 0x7ec81742, Offset: 0xda80
// Size: 0x5a
function private function_2985faa1(commander, squad, constants) {
    target = plannersquadutility::getblackboardattribute(squad, "target");
    if (!isdefined(target)) {
        return 0;
    }
    return 1;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 3, eflags: 0x5 linked
// Checksum 0x49a1c09, Offset: 0xdae8
// Size: 0x242
function private utilityscoreprogressthrottling(commander, squad, constants) {
    if (blackboard::getstructblackboardattribute(commander, #"allow_progress_throttling") === 1) {
        enemycommander = blackboard::getstructblackboardattribute(commander, #"throttling_enemy_commander");
        if (!isdefined(enemycommander)) {
            return 0;
        }
        lowerbound = blackboard::getstructblackboardattribute(commander, #"throttling_lower_bound");
        upperbound = blackboard::getstructblackboardattribute(commander, #"throttling_upper_bound");
        destroyedassaults = blackboard::getstructblackboardattribute(commander, #"gameobjects_assault_destroyed");
        totalassaults = blackboard::getstructblackboardattribute(commander, #"throttling_total_gameobjects");
        if (!isdefined(totalassaults)) {
            totalassaults = blackboard::getstructblackboardattribute(commander, #"gameobjects_assault_total");
        }
        enemydestroyedassaults = blackboard::getstructblackboardattribute(enemycommander, #"gameobjects_assault_destroyed");
        enemytotalassaults = blackboard::getstructblackboardattribute(commander, #"throttling_total_gameobjects_enemy");
        if (!isdefined(enemytotalassaults)) {
            enemytotalassaults = blackboard::getstructblackboardattribute(enemycommander, #"gameobjects_assault_total");
        }
        order = plannersquadutility::getblackboardattribute(squad, "order");
        if (strategiccommandutility::calculateprogressthrottling(lowerbound, upperbound, destroyedassaults, totalassaults, enemydestroyedassaults, enemytotalassaults)) {
            if (order === "order_attack") {
                return 0;
            }
        } else if (order === "order_attack_surround") {
            return 0;
        }
    }
    return 1;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 3, eflags: 0x5 linked
// Checksum 0x1e110715, Offset: 0xdd38
// Size: 0x21a
function private function_a65b2be5(commander, squad, constants) {
    var_fcee18d7 = plannersquadutility::getblackboardattribute(squad, "target");
    if (!isdefined(var_fcee18d7)) {
        return 1;
    }
    if (var_fcee18d7[#"type"] === "gameobject") {
        gameobject = var_fcee18d7[#"__unsafe__"][#"object"];
        if (!isdefined(gameobject) || isdefined(gameobject.trigger) && !gameobject.trigger istriggerenabled()) {
            return 0;
        }
    } else if (var_fcee18d7[#"type"] === "destroy" || var_fcee18d7[#"type"] === "defend") {
        return 0;
    } else if (var_fcee18d7[#"type"] === "capturearea") {
        return 0;
    } else if (var_fcee18d7[#"type"] === "destroy" || var_fcee18d7[#"type"] === "goto") {
        missioncomponent = var_fcee18d7[#"__unsafe__"][#"mission_component"];
        commanderteam = blackboard::getstructblackboardattribute(commander, #"team");
        if (!strategiccommandutility::function_f867cce0(missioncomponent, commanderteam)) {
            return 0;
        }
    }
    return 1;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 3, eflags: 0x5 linked
// Checksum 0x8d88a504, Offset: 0xdf60
// Size: 0x10e
function private function_f389ef61(commander, squad, constants) {
    doppelbots = plannersquadutility::getblackboardattribute(squad, "doppelbots");
    team = blackboard::getstructblackboardattribute(commander, #"team");
    if (!isdefined(doppelbots) || !isdefined(team)) {
        return 1;
    }
    for (botindex = 0; botindex < doppelbots.size; botindex++) {
        bot = doppelbots[botindex][#"__unsafe__"][#"bot"];
        if (isdefined(bot) && bot.team != team) {
            return 0;
        }
    }
    return 1;
}

// Namespace plannercommanderutility/planner_commander_utility
// Params 3, eflags: 0x5 linked
// Checksum 0x98d0ddd, Offset: 0xe078
// Size: 0x12e
function private utilityscoreviableescort(commander, squad, constants) {
    doppelbots = plannersquadutility::getblackboardattribute(squad, "doppelbots");
    escorts = plannersquadutility::getblackboardattribute(squad, "escorts");
    players = blackboard::getstructblackboardattribute(commander, #"players");
    if (isdefined(escorts) && escorts.size > 0) {
        return 1;
    }
    if (!isdefined(doppelbots) || doppelbots.size <= 0) {
        return 1;
    }
    if (!isdefined(players) || players.size <= 0) {
        return 1;
    }
    if (_calculateallpathableclients(doppelbots, players).size > 0) {
        return 0;
    }
    return 1;
}

