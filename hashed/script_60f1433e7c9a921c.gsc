// Atian COD Tools GSC decompiler test
#include scripts/core_common/array_shared.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/gameobjects_shared.gsc;
#include scripts/core_common/bots/bot.gsc;
#include scripts/core_common/ai/strategic_command.gsc;
#include scripts/core_common/ai/region_utility.gsc;
#include scripts/core_common/ai/planner_squad.gsc;
#include scripts/core_common/ai/planner_commander.gsc;
#include scripts/core_common/ai/systems/planner_blackboard.gsc;
#include scripts/core_common/ai/systems/planner.gsc;
#include scripts/core_common/ai/systems/blackboard.gsc;

#namespace namespace_ff7f7372;

// Namespace namespace_ff7f7372/namespace_ff7f7372
// Params 0, eflags: 0x2
// Checksum 0xd8c3321a, Offset: 0x350
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_432f3eb0cc2e347f", &namespace_e2d53d54::__init__, undefined, undefined);
}

#namespace namespace_e2d53d54;

// Namespace namespace_e2d53d54/namespace_ff7f7372
// Params 0, eflags: 0x5 linked
// Checksum 0x3d1ab65b, Offset: 0x398
// Size: 0x734
function private __init__() {
    plannercommanderutility::registerdaemonapi("daemonControlZones", &function_c5bf12a5);
    plannercommanderutility::registerdaemonapi("daemonDomFlags", &function_88ab5a6e);
    plannercommanderutility::registerdaemonapi("daemonKothZone", &function_337c2c5d);
    plannercommanderutility::registerdaemonapi("daemonSdBomb", &function_4364713f);
    plannercommanderutility::registerdaemonapi("daemonSdBombZones", &function_c111c0aa);
    plannercommanderutility::registerdaemonapi("daemonSdDefuseObj", &function_7e03c94a);
    plannercommanderutility::registerutilityapi("commanderScoreAge", &_monkey_water_corvus_vo_cleared);
    plannercommanderutility::registerutilityapi("commanderScoreAlive", &function_e319475e);
    plannercommanderutility::registerutilityapi("commanderScoreControlZones", &function_f478ac94);
    plannercommanderutility::registerutilityapi("commanderScoreDomFlags", &function_78126acd);
    plannercommanderutility::registerutilityapi("commanderScoreStopWanderingDom", &function_8ee25278);
    plannercommanderutility::registerutilityapi("commanderScoreKothZone", &function_eb0a4e86);
    plannerutility::registerplannerapi(#"hash_6130077bb861d4fa", &function_2f04f764);
    plannerutility::registerplannerapi(#"hash_23ede7441ff7e15f", &function_34c0ebaf);
    plannerutility::registerplannerapi(#"hash_9d5448e604895e", &function_68a32d83);
    plannerutility::registerplannerapi(#"hash_58f852e4b26d4080", &function_380f4233);
    plannerutility::registerplannerapi(#"hash_6c55a3eed50ed047", &function_4792217e);
    plannerutility::registerplannerapi(#"hash_654106abca773945", &function_97e7d0d8);
    plannerutility::registerplannerapi(#"hash_783f83ce7a2dc41b", &function_493ead90);
    plannerutility::registerplannerapi(#"hash_19dd182b96412bae", &function_cd5b7cc9);
    plannerutility::registerplannerapi(#"hash_72014ae7e091d06f", &function_efa74ce4);
    plannerutility::registerplanneraction(#"hash_5c39c15c20a4b033", &function_b35625c2, undefined, undefined, undefined);
    plannerutility::registerplanneraction(#"hash_5ad6d3a6bb956fb1", &function_a207b2e4, undefined, undefined, undefined);
    plannerutility::registerplanneraction(#"hash_6a957e932b7f93aa", &function_9d8a9994, undefined, undefined, undefined);
    plannerutility::registerplanneraction(#"hash_746e217e5d63efc2", &function_913bffb1, undefined, undefined, undefined);
    plannerutility::registerplanneraction(#"hash_303c3d6d6bfcc25b", &function_edf25221, undefined, undefined, undefined);
    plannerutility::registerplanneraction(#"hash_4a587832fd66b314", &function_90af2101, undefined, undefined, undefined);
    plannerutility::registerplanneraction(#"hash_4d82b95b9c45bb53", &function_bca7d900, undefined, undefined, undefined);
    plannerutility::registerplanneraction(#"hash_494fab5e2093d5b", &function_1cce4bb6, undefined, undefined, undefined);
    plannerutility::registerplanneraction(#"hash_506b5e12327f16f4", &function_f192ef84, undefined, undefined, undefined);
    plannerutility::registerplanneraction(#"hash_67ba42774c6db6a6", &function_7a576970, undefined, undefined, undefined);
    plannerutility::registerplanneraction(#"hash_6b51afb697e53d12", &function_53600d78, undefined, undefined, undefined);
    plannerutility::registerplanneraction(#"hash_4c584e62f0069dfa", &function_7a9a7a24, undefined, undefined, undefined);
    plannerutility::registerplanneraction(#"hash_3eb5ac2692fce4e7", &function_b032f16b, undefined, undefined, undefined);
    plannerutility::registerplanneraction(#"hash_60a8773a51426c27", &function_9c7e3773, undefined, undefined, undefined);
    plannerutility::registerplannerapi(#"hash_3df2466d38b695da", &function_39cd5957);
    plannerutility::registerplannerapi(#"hash_2d8246b9d8badd2e", &function_97659d05);
    plannerutility::registerplannerapi(#"hash_10cfd447c35656ef", &function_9e016913);
}

// Namespace namespace_e2d53d54/namespace_ff7f7372
// Params 3, eflags: 0x5 linked
// Checksum 0x352d8dbc, Offset: 0xad8
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

// Namespace namespace_e2d53d54/namespace_ff7f7372
// Params 4, eflags: 0x5 linked
// Checksum 0xa9e5484e, Offset: 0xc58
// Size: 0x39e
function private function_c0e398c4(bots, var_26b45a5e, bbkey, claimed = undefined) {
    /#
        assert(isarray(bots));
    #/
    /#
        assert(isarray(var_26b45a5e));
    #/
    var_f8d389a2 = [];
    if (bots.size <= 0 || var_26b45a5e.size <= 0) {
        return var_f8d389a2;
    }
    for (i = 0; i < var_26b45a5e.size; i++) {
        var_deb9ffcf = var_26b45a5e[i][#"__unsafe__"][bbkey];
        if (!isdefined(var_deb9ffcf)) {
            continue;
        }
        if (isdefined(claimed) && var_26b45a5e[i][#"claimed"] != claimed) {
            continue;
        }
        var_9f855ac9 = getclosestpointonnavmesh(var_deb9ffcf.origin, 200);
        if (isdefined(var_9f855ac9)) {
            pathable = 1;
            distance = 0;
            for (botindex = 0; botindex < bots.size; botindex++) {
                bot = bots[botindex][#"__unsafe__"][#"bot"];
                if (!strategiccommandutility::isvalidbot(bot)) {
                    continue;
                }
                position = getclosestpointonnavmesh(bot.origin, 120, 1.2 * bot getpathfindingradius());
                if (!isdefined(position)) {
                    pathable = 0;
                } else {
                    queryresult = positionquery_source_navigation(var_9f855ac9, 0, 120, 60, 16, bot, 16);
                    if (queryresult.data.size > 0) {
                        path = _calculatepositionquerypath(queryresult, position, bot);
                        if (!isdefined(path)) {
                            pathable = 0;
                            break;
                        }
                        if (path.pathdistance > distance) {
                            distance = path.pathdistance;
                        }
                    }
                }
            }
            if (pathable) {
                path = [];
                path[bbkey] = var_26b45a5e[i];
                path[#"distance"] = distance;
                if (!isdefined(var_f8d389a2)) {
                    var_f8d389a2 = [];
                } else if (!isarray(var_f8d389a2)) {
                    var_f8d389a2 = array(var_f8d389a2);
                }
                var_f8d389a2[var_f8d389a2.size] = path;
            }
        }
    }
    return var_f8d389a2;
}

// Namespace namespace_e2d53d54/namespace_ff7f7372
// Params 2, eflags: 0x5 linked
// Checksum 0x5b8eaae5, Offset: 0x1000
// Size: 0xa8
function private function_3ea6bf0b(gameobject, var_1766c557) {
    teamkeys = getarraykeys(gameobject.numtouching);
    for (i = 0; i < gameobject.numtouching.size; i++) {
        team = teamkeys[i];
        if (team == var_1766c557) {
            continue;
        }
        if (gameobject.numtouching[team] > 0) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_e2d53d54/namespace_ff7f7372
// Params 1, eflags: 0x5 linked
// Checksum 0xaa561069, Offset: 0x10b0
// Size: 0x2dc
function private function_c5bf12a5(commander) {
    if (!isdefined(level.zones)) {
        return;
    }
    commanderteam = blackboard::getstructblackboardattribute(commander, #"team");
    controlzones = [];
    var_c4c8bf3f = arraycopy(level.zones);
    foreach (zone in var_c4c8bf3f) {
        if (!isdefined(zone) || !isdefined(zone.trigger) || !zone.trigger istriggerenabled()) {
            continue;
        }
        var_72812cde = [];
        var_72812cde[#"origin"] = zone.origin;
        if (!isdefined(var_72812cde[#"__unsafe__"])) {
            var_72812cde[#"__unsafe__"] = array();
        }
        var_72812cde[#"__unsafe__"][#"controlzone"] = zone;
        if (!isdefined(controlzones)) {
            controlzones = [];
        } else if (!isarray(controlzones)) {
            controlzones = array(controlzones);
        }
        controlzones[controlzones.size] = var_72812cde;
        if (getrealtime() - commander.var_22765a25 > commander.var_b9dd2f) {
            aiprofile_endentry();
            pixendevent();
            [[ level.strategic_command_throttle ]]->waitinqueue(commander);
            commander.var_22765a25 = getrealtime();
            pixbeginevent("daemonControlZones");
            aiprofile_beginentry("daemonControlZones");
        }
    }
    blackboard::setstructblackboardattribute(commander, "mp_controlZones", controlzones);
}

// Namespace namespace_e2d53d54/namespace_ff7f7372
// Params 1, eflags: 0x5 linked
// Checksum 0xa1d59482, Offset: 0x1398
// Size: 0x334
function private function_88ab5a6e(commander) {
    if (!isdefined(level.domflags)) {
        return;
    }
    commanderteam = blackboard::getstructblackboardattribute(commander, #"team");
    domflags = [];
    var_42c3a790 = arraycopy(level.domflags);
    foreach (domflag in var_42c3a790) {
        if (!isdefined(domflag) || !isdefined(domflag.trigger)) {
            continue;
        }
        if (!domflag.trigger istriggerenabled()) {
            continue;
        }
        var_2435544a = [];
        var_2435544a[#"origin"] = domflag.origin;
        var_2435544a[#"radius"] = domflag.levelflag.radius;
        var_2435544a[#"claimed"] = commanderteam == domflag gameobjects::get_owner_team();
        if (!isdefined(var_2435544a[#"__unsafe__"])) {
            var_2435544a[#"__unsafe__"] = array();
        }
        var_2435544a[#"__unsafe__"][#"domflag"] = domflag;
        if (!isdefined(domflags)) {
            domflags = [];
        } else if (!isarray(domflags)) {
            domflags = array(domflags);
        }
        domflags[domflags.size] = var_2435544a;
        if (getrealtime() - commander.var_22765a25 > commander.var_b9dd2f) {
            aiprofile_endentry();
            pixendevent();
            [[ level.strategic_command_throttle ]]->waitinqueue(commander);
            commander.var_22765a25 = getrealtime();
            pixbeginevent("daemonDomFlags");
            aiprofile_beginentry("daemonDomFlags");
        }
    }
    blackboard::setstructblackboardattribute(commander, "mp_domFlags", domflags);
}

// Namespace namespace_e2d53d54/namespace_ff7f7372
// Params 1, eflags: 0x5 linked
// Checksum 0xe5cf4471, Offset: 0x16d8
// Size: 0x174
function private function_337c2c5d(commander) {
    if (!isdefined(level.zone)) {
        return;
    }
    commanderteam = blackboard::getstructblackboardattribute(commander, #"team");
    zone = [];
    cachedzone = [];
    cachedzone[#"origin"] = level.zone.origin;
    if (!isdefined(cachedzone[#"__unsafe__"])) {
        cachedzone[#"__unsafe__"] = array();
    }
    cachedzone[#"__unsafe__"][#"kothzone"] = level.zone;
    if (!isdefined(zone)) {
        zone = [];
    } else if (!isarray(zone)) {
        zone = array(zone);
    }
    zone[zone.size] = cachedzone;
    blackboard::setstructblackboardattribute(commander, "mp_kothZone", zone);
}

// Namespace namespace_e2d53d54/namespace_ff7f7372
// Params 1, eflags: 0x5 linked
// Checksum 0x2354af02, Offset: 0x1858
// Size: 0x174
function private function_4364713f(commander) {
    if (!isdefined(level.sdbomb)) {
        return;
    }
    commanderteam = blackboard::getstructblackboardattribute(commander, #"team");
    bomb = [];
    var_b0fd50a8 = [];
    var_b0fd50a8[#"origin"] = level.sdbomb.origin;
    if (!isdefined(var_b0fd50a8[#"__unsafe__"])) {
        var_b0fd50a8[#"__unsafe__"] = array();
    }
    var_b0fd50a8[#"__unsafe__"][#"sdbomb"] = level.sdbomb;
    if (!isdefined(bomb)) {
        bomb = [];
    } else if (!isarray(bomb)) {
        bomb = array(bomb);
    }
    bomb[bomb.size] = var_b0fd50a8;
    blackboard::setstructblackboardattribute(commander, "mp_sdBomb", bomb);
}

// Namespace namespace_e2d53d54/namespace_ff7f7372
// Params 1, eflags: 0x5 linked
// Checksum 0x7711939a, Offset: 0x19d8
// Size: 0x34c
function private function_c111c0aa(commander) {
    if (!isdefined(level.bombzones) || !isarray(level.bombzones) || level.bombzones.size <= 0) {
        return;
    }
    commanderteam = blackboard::getstructblackboardattribute(commander, #"team");
    bombzones = [];
    var_99cb62dc = arraycopy(level.bombzones);
    foreach (bombzone in var_99cb62dc) {
        if (!isdefined(bombzone) || !isdefined(bombzone.trigger)) {
            continue;
        }
        if (!bombzone.trigger istriggerenabled()) {
            continue;
        }
        var_fa640b48 = [];
        var_fa640b48[#"origin"] = bombzone.origin;
        var_fa640b48[#"planted"] = bombzone gameobjects::get_flags(1);
        if (!isdefined(var_fa640b48[#"__unsafe__"])) {
            var_fa640b48[#"__unsafe__"] = array();
        }
        var_fa640b48[#"__unsafe__"][#"sdbombzone"] = bombzone;
        if (!isdefined(bombzones)) {
            bombzones = [];
        } else if (!isarray(bombzones)) {
            bombzones = array(bombzones);
        }
        bombzones[bombzones.size] = var_fa640b48;
        if (getrealtime() - commander.var_22765a25 > commander.var_b9dd2f) {
            aiprofile_endentry();
            pixendevent();
            [[ level.strategic_command_throttle ]]->waitinqueue(commander);
            commander.var_22765a25 = getrealtime();
            pixbeginevent("daemonSdBombZones");
            aiprofile_beginentry("daemonSdBombZones");
        }
    }
    blackboard::setstructblackboardattribute(commander, "mp_sdBombZones", bombzones);
}

// Namespace namespace_e2d53d54/namespace_ff7f7372
// Params 1, eflags: 0x5 linked
// Checksum 0x3e89d10b, Offset: 0x1d30
// Size: 0x174
function private function_7e03c94a(commander) {
    if (!isdefined(level.defuseobject)) {
        return;
    }
    commanderteam = blackboard::getstructblackboardattribute(commander, #"team");
    defuseobj = [];
    var_30b29fd3 = [];
    var_30b29fd3[#"origin"] = level.defuseobject.origin;
    if (!isdefined(var_30b29fd3[#"__unsafe__"])) {
        var_30b29fd3[#"__unsafe__"] = array();
    }
    var_30b29fd3[#"__unsafe__"][#"sddefuseobj"] = level.defuseobject;
    if (!isdefined(defuseobj)) {
        defuseobj = [];
    } else if (!isarray(defuseobj)) {
        defuseobj = array(defuseobj);
    }
    defuseobj[defuseobj.size] = var_30b29fd3;
    blackboard::setstructblackboardattribute(commander, "mp_sdDefuseObj", defuseobj);
}

// Namespace namespace_e2d53d54/namespace_ff7f7372
// Params 3, eflags: 0x5 linked
// Checksum 0xbc582afe, Offset: 0x1eb0
// Size: 0x9a
function private _monkey_water_corvus_vo_cleared(commander, squad, constants) {
    /#
        assert(isdefined(constants[#"maxage"]), "<unknown string>" + "<unknown string>" + "<unknown string>");
    #/
    if (gettime() > squad.createtime + constants[#"maxage"]) {
        return 0;
    }
    return 1;
}

// Namespace namespace_e2d53d54/namespace_ff7f7372
// Params 3, eflags: 0x5 linked
// Checksum 0x1b35700f, Offset: 0x1f58
// Size: 0xda
function private function_e319475e(commander, squad, constants) {
    bots = plannersquadutility::getblackboardattribute(squad, "doppelbots");
    if (!isdefined(bots)) {
        return 0;
    }
    for (botindex = 0; botindex < bots.size; botindex++) {
        bot = bots[botindex][#"__unsafe__"][#"bot"];
        if (!isdefined(bot)) {
            return 0;
        }
        if (!isalive(bot)) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_e2d53d54/namespace_ff7f7372
// Params 3, eflags: 0x5 linked
// Checksum 0xdcd1c2c, Offset: 0x2040
// Size: 0xee
function private function_f478ac94(commander, squad, constants) {
    controlzones = plannersquadutility::getblackboardattribute(squad, "mp_controlZones");
    if (isdefined(controlzones) && controlzones.size > 0) {
        for (i = 0; i < controlzones.size; i++) {
            zone = controlzones[i][#"__unsafe__"][#"controlzone"];
            if (!zone.gameobject.trigger istriggerenabled()) {
                return 0;
            }
        }
        return 1;
    }
    return 0;
}

// Namespace namespace_e2d53d54/namespace_ff7f7372
// Params 3, eflags: 0x5 linked
// Checksum 0xad53c44f, Offset: 0x2138
// Size: 0x14e
function private function_78126acd(commander, squad, constants) {
    domflags = plannersquadutility::getblackboardattribute(squad, "mp_domFlags");
    squadteam = plannersquadutility::getblackboardattribute(squad, "team");
    if (isdefined(domflags) && domflags.size > 0) {
        foreach (domflag in domflags) {
            object = domflag[#"__unsafe__"][#"domflag"];
            if (hash(squadteam) !== object gameobjects::get_owner_team()) {
                return 1;
            }
        }
        return 0;
    }
    return 1;
}

// Namespace namespace_e2d53d54/namespace_ff7f7372
// Params 3, eflags: 0x5 linked
// Checksum 0x3d29ee47, Offset: 0x2290
// Size: 0xf6
function private function_8ee25278(commander, squad, constants) {
    order = plannersquadutility::getblackboardattribute(squad, "order");
    if (order === "order_wander") {
        bots = plannersquadutility::getblackboardattribute(squad, "doppelbots");
        domflags = planner::getblackboardattribute(commander.planner, "mp_domFlags");
        if (isdefined(domflags)) {
            pathabledomflags = function_c0e398c4(bots, domflags, "domFlag");
            if (pathabledomflags.size > 0) {
                return 0;
            }
        }
    }
    return 1;
}

// Namespace namespace_e2d53d54/namespace_ff7f7372
// Params 3, eflags: 0x5 linked
// Checksum 0xb2eba3bd, Offset: 0x2390
// Size: 0xc6
function private function_eb0a4e86(commander, squad, constants) {
    kothzone = plannersquadutility::getblackboardattribute(squad, "mp_kothZone");
    if (isdefined(kothzone) && kothzone.size > 0) {
        zone = kothzone[0][#"__unsafe__"][#"kothzone"];
        if (zone.gameobject.trigger istriggerenabled()) {
            return 1;
        }
        return 0;
    }
    return 0;
}

// Namespace namespace_e2d53d54/namespace_ff7f7372
// Params 2, eflags: 0x5 linked
// Checksum 0x6cb6d536, Offset: 0x2460
// Size: 0x1a2
function private function_2f04f764(planner, constants) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    commanderteam = planner::getblackboardattribute(planner, #"team");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    controlzones = planner::getblackboardattribute(planner, "mp_pathable_controlZones", squadindex);
    foreach (controlzone in controlzones) {
        zone = controlzone[#"controlzone"][#"__unsafe__"][#"controlzone"];
        if (!isdefined(zone) || !isdefined(zone.gameobject)) {
            continue;
        }
        if (function_3ea6bf0b(zone.gameobject, commanderteam)) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_e2d53d54/namespace_ff7f7372
// Params 2, eflags: 0x5 linked
// Checksum 0x82cf797b, Offset: 0x2610
// Size: 0x98
function private function_34c0ebaf(planner, constants) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    controlzones = planner::getblackboardattribute(planner, "mp_pathable_controlZones", squadindex);
    return controlzones.size > 0;
}

// Namespace namespace_e2d53d54/namespace_ff7f7372
// Params 2, eflags: 0x5 linked
// Checksum 0x440a2ee8, Offset: 0x26b0
// Size: 0x98
function private function_68a32d83(planner, constants) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    domflags = planner::getblackboardattribute(planner, "mp_pathable_domFlags", squadindex);
    return domflags.size > 0;
}

// Namespace namespace_e2d53d54/namespace_ff7f7372
// Params 2, eflags: 0x5 linked
// Checksum 0x576a2cbc, Offset: 0x2750
// Size: 0x98
function private function_380f4233(planner, constants) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    kothzone = planner::getblackboardattribute(planner, "mp_pathable_kothZone", squadindex);
    return kothzone.size > 0;
}

// Namespace namespace_e2d53d54/namespace_ff7f7372
// Params 2, eflags: 0x5 linked
// Checksum 0xd8b964ca, Offset: 0x27f0
// Size: 0xa2
function private function_4792217e(planner, constants) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    bomb = planner::getblackboardattribute(planner, "mp_pathable_sdBomb", squadindex);
    return isdefined(bomb) && bomb.size > 0;
}

// Namespace namespace_e2d53d54/namespace_ff7f7372
// Params 2, eflags: 0x5 linked
// Checksum 0x288beed8, Offset: 0x28a0
// Size: 0xa2
function private function_97e7d0d8(planner, constants) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    zones = planner::getblackboardattribute(planner, "mp_pathable_sdBombZones", squadindex);
    return isdefined(zones) && zones.size > 0;
}

// Namespace namespace_e2d53d54/namespace_ff7f7372
// Params 2, eflags: 0x5 linked
// Checksum 0x5adc711a, Offset: 0x2950
// Size: 0x138
function private function_493ead90(planner, constants) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    bots = planner::getblackboardattribute(planner, "doppelbots", squadindex);
    for (i = 0; i < bots.size; i++) {
        bot = bots[0][#"__unsafe__"][#"bot"];
        if (isdefined(bot.isbombcarrier) && bot.isbombcarrier || isdefined(level.multibomb) && level.multibomb) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_e2d53d54/namespace_ff7f7372
// Params 2, eflags: 0x5 linked
// Checksum 0xf0b1cfb3, Offset: 0x2a90
// Size: 0xa2
function private function_cd5b7cc9(planner, constants) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    var_a13843cf = planner::getblackboardattribute(planner, "mp_pathable_sdDefuseObj", squadindex);
    return isdefined(var_a13843cf) && var_a13843cf.size > 0;
}

// Namespace namespace_e2d53d54/namespace_ff7f7372
// Params 2, eflags: 0x5 linked
// Checksum 0x84df3faf, Offset: 0x2b40
// Size: 0x26
function private function_efa74ce4(planner, constants) {
    return region_utility::function_9fe18733() > 0;
}

// Namespace namespace_e2d53d54/namespace_ff7f7372
// Params 2, eflags: 0x5 linked
// Checksum 0xbfbf2b73, Offset: 0x2b70
// Size: 0x112
function private function_b35625c2(planner, constants) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    bots = planner::getblackboardattribute(planner, "doppelbots", squadindex);
    controlzones = planner::getblackboardattribute(planner, "mp_controlZones");
    var_72d5b8ac = function_c0e398c4(bots, controlzones, "controlZone");
    planner::setblackboardattribute(planner, "mp_pathable_controlZones", var_72d5b8ac, squadindex);
    return spawnstruct();
}

// Namespace namespace_e2d53d54/namespace_ff7f7372
// Params 2, eflags: 0x5 linked
// Checksum 0x7542eee9, Offset: 0x2c90
// Size: 0x3aa
function private function_a207b2e4(planner, constants) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    commanderteam = planner::getblackboardattribute(planner, #"team");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    var_72d5b8ac = planner::getblackboardattribute(planner, "mp_pathable_controlZones", squadindex);
    if (!isarray(var_72d5b8ac) || var_72d5b8ac.size <= 0) {
        return spawnstruct();
    }
    var_82711a20 = [];
    foreach (var_2b511b1a in var_72d5b8ac) {
        zone = var_2b511b1a[#"controlzone"][#"__unsafe__"][#"controlzone"];
        if (!isdefined(zone) || !isdefined(zone.gameobject)) {
            continue;
        }
        if (function_3ea6bf0b(zone.gameobject, commanderteam)) {
            if (!isdefined(var_82711a20)) {
                var_82711a20 = [];
            } else if (!isarray(var_82711a20)) {
                var_82711a20 = array(var_82711a20);
            }
            var_82711a20[var_82711a20.size] = var_2b511b1a;
        }
    }
    if (var_82711a20.size < 1) {
        if (!isdefined(var_82711a20)) {
            var_82711a20 = [];
        } else if (!isarray(var_82711a20)) {
            var_82711a20 = array(var_82711a20);
        }
        var_82711a20[var_82711a20.size] = var_72d5b8ac[0];
    }
    shortestpath = var_82711a20[0][#"distance"];
    controlzone = var_82711a20[0][#"controlzone"];
    for (i = 1; i < var_82711a20.size; i++) {
        if (var_82711a20[i][#"distance"] < shortestpath) {
            shortestpath = var_82711a20[i][#"distance"];
            controlzone = var_82711a20[i][#"controlzone"];
        }
    }
    planner::setblackboardattribute(planner, "mp_controlZones", array(controlzone), squadindex);
    return spawnstruct();
}

// Namespace namespace_e2d53d54/namespace_ff7f7372
// Params 2, eflags: 0x5 linked
// Checksum 0x39dc796b, Offset: 0x3048
// Size: 0x4fa
function private function_9d8a9994(planner, constants) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    var_72d5b8ac = planner::getblackboardattribute(planner, "mp_pathable_controlZones", squadindex);
    if (!isarray(var_72d5b8ac) || var_72d5b8ac.size <= 0) {
        return spawnstruct();
    }
    controlzones = [];
    for (i = 0; i < var_72d5b8ac.size; i++) {
        zone = var_72d5b8ac[i][#"controlzone"];
        if (!isdefined(controlzones)) {
            controlzones = [];
        } else if (!isarray(controlzones)) {
            controlzones = array(controlzones);
        }
        controlzones[controlzones.size] = zone;
    }
    controlzone = undefined;
    bot = undefined;
    bots = planner::getblackboardattribute(planner, "doppelbots", squadindex);
    if (isdefined(bots) && bots.size > 0) {
        bot = bots[0][#"__unsafe__"][#"bot"];
    }
    if (isdefined(bot) && isalive(bot)) {
        if (!isdefined(controlzone) && getdvarint(#"bot_difficulty", 1) >= 1) {
            if (function_97659d05(planner, constants)) {
                foreach (var_e8450bcf in controlzones) {
                    var_f7b61e5e = var_e8450bcf[#"__unsafe__"][#"controlzone"];
                    if (var_f7b61e5e.gameobject.trigger istriggerenabled() && bot istouching(var_f7b61e5e.gameobject.trigger) && var_f7b61e5e.gameobject.curprogress > 0) {
                        controlzone = var_e8450bcf;
                        break;
                    }
                }
            }
        }
        if (!isdefined(controlzone) && getdvarint(#"bot_difficulty", 1) >= 2) {
            if (function_39cd5957(planner, constants)) {
                foreach (var_e8450bcf in controlzones) {
                    var_f7b61e5e = var_e8450bcf[#"__unsafe__"][#"controlzone"];
                    if (var_f7b61e5e.gameobject.trigger istriggerenabled() && bot istouching(var_f7b61e5e.gameobject.trigger)) {
                        controlzone = var_e8450bcf;
                        break;
                    }
                }
            }
        }
    }
    if (!isdefined(controlzone)) {
        controlzone = array::random(controlzones);
    }
    planner::setblackboardattribute(planner, "mp_controlZones", array(controlzone), squadindex);
    return spawnstruct();
}

// Namespace namespace_e2d53d54/namespace_ff7f7372
// Params 2, eflags: 0x5 linked
// Checksum 0x4ea19cd0, Offset: 0x3550
// Size: 0x112
function private function_913bffb1(planner, constants) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    bots = planner::getblackboardattribute(planner, "doppelbots", squadindex);
    domflags = planner::getblackboardattribute(planner, "mp_domFlags");
    pathabledomflags = function_c0e398c4(bots, domflags, "domFlag");
    planner::setblackboardattribute(planner, "mp_pathable_domFlags", pathabledomflags, squadindex);
    return spawnstruct();
}

// Namespace namespace_e2d53d54/namespace_ff7f7372
// Params 2, eflags: 0x5 linked
// Checksum 0x4034bdd3, Offset: 0x3670
// Size: 0x39a
function private function_edf25221(planner, constants) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    pathabledomflags = planner::getblackboardattribute(planner, "mp_pathable_domFlags", squadindex);
    if (!isarray(pathabledomflags) || pathabledomflags.size <= 0) {
        return spawnstruct();
    }
    domflags = [];
    shortestpath = pathabledomflags[0][#"distance"];
    longestpath = pathabledomflags[0][#"distance"];
    var_fa2c1b88 = 0;
    var_67f36fed = 0;
    for (i = 1; i < pathabledomflags.size; i++) {
        pathabledomflag = pathabledomflags[i];
        if (pathabledomflag[#"distance"] < shortestpath) {
            shortestpath = pathabledomflags[i][#"distance"];
            var_fa2c1b88 = i;
        } else if (pathabledomflag[#"distance"] > longestpath) {
            longestpath = pathabledomflags[i][#"distance"];
            var_67f36fed = i;
        }
    }
    if (!isdefined(domflags)) {
        domflags = [];
    } else if (!isarray(domflags)) {
        domflags = array(domflags);
    }
    domflags[domflags.size] = pathabledomflags[var_fa2c1b88][#"domflag"];
    for (i = 0; i < pathabledomflags.size; i++) {
        if (i == var_fa2c1b88 || i == var_67f36fed) {
            continue;
        }
        if (!isdefined(domflags)) {
            domflags = [];
        } else if (!isarray(domflags)) {
            domflags = array(domflags);
        }
        domflags[domflags.size] = pathabledomflags[i][#"domflag"];
    }
    if (!isdefined(domflags)) {
        domflags = [];
    } else if (!isarray(domflags)) {
        domflags = array(domflags);
    }
    domflags[domflags.size] = pathabledomflags[var_67f36fed][#"domflag"];
    planner::setblackboardattribute(planner, "mp_domFlags", domflags, squadindex);
    return spawnstruct();
}

// Namespace namespace_e2d53d54/namespace_ff7f7372
// Params 2, eflags: 0x5 linked
// Checksum 0xf7696208, Offset: 0x3a18
// Size: 0x112
function private function_90af2101(planner, constants) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    bots = planner::getblackboardattribute(planner, "doppelbots", squadindex);
    kothzone = planner::getblackboardattribute(planner, "mp_kothZone");
    pathablekothzone = function_c0e398c4(bots, kothzone, "kothZone");
    planner::setblackboardattribute(planner, "mp_pathable_kothZone", pathablekothzone, squadindex);
    return spawnstruct();
}

// Namespace namespace_e2d53d54/namespace_ff7f7372
// Params 2, eflags: 0x5 linked
// Checksum 0xec5178cb, Offset: 0x3b38
// Size: 0x122
function private function_bca7d900(planner, constants) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    pathablekothzone = planner::getblackboardattribute(planner, "mp_pathable_kothZone", squadindex);
    if (!isarray(pathablekothzone) || pathablekothzone.size <= 0) {
        return spawnstruct();
    }
    planner::setblackboardattribute(planner, "mp_kothZone", array(pathablekothzone[0][#"kothzone"]), squadindex);
    return spawnstruct();
}

// Namespace namespace_e2d53d54/namespace_ff7f7372
// Params 2, eflags: 0x5 linked
// Checksum 0xe801a37, Offset: 0x3c68
// Size: 0x192
function private function_1cce4bb6(planner, constants) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    bots = planner::getblackboardattribute(planner, "doppelbots", squadindex);
    sdbomb = planner::getblackboardattribute(planner, "mp_sdBomb");
    if (!isdefined(sdbomb)) {
        return spawnstruct();
    }
    bomb = sdbomb[0][#"__unsafe__"][#"sdbomb"];
    if (isdefined(bomb) && isdefined(bomb.carrier)) {
        var_494de2dd = [];
    } else {
        var_494de2dd = function_c0e398c4(bots, sdbomb, "sdBomb");
    }
    planner::setblackboardattribute(planner, "mp_pathable_sdBomb", var_494de2dd, squadindex);
    return spawnstruct();
}

// Namespace namespace_e2d53d54/namespace_ff7f7372
// Params 2, eflags: 0x5 linked
// Checksum 0xb5ed6c4d, Offset: 0x3e08
// Size: 0x122
function private function_f192ef84(planner, constants) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    pathablesdbomb = planner::getblackboardattribute(planner, "mp_pathable_sdBomb", squadindex);
    if (!isarray(pathablesdbomb) || pathablesdbomb.size <= 0) {
        return spawnstruct();
    }
    planner::setblackboardattribute(planner, "mp_sdBomb", array(pathablesdbomb[0][#"sdbomb"]), squadindex);
    return spawnstruct();
}

// Namespace namespace_e2d53d54/namespace_ff7f7372
// Params 2, eflags: 0x5 linked
// Checksum 0xdfc66873, Offset: 0x3f38
// Size: 0x12a
function private function_7a576970(planner, constants) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    bots = planner::getblackboardattribute(planner, "doppelbots", squadindex);
    bombzones = planner::getblackboardattribute(planner, "mp_sdBombZones");
    if (isdefined(bots) && isdefined(bombzones)) {
        var_154e2210 = function_c0e398c4(bots, bombzones, "sdBombZone");
        planner::setblackboardattribute(planner, "mp_pathable_sdBombZones", var_154e2210, squadindex);
    }
    return spawnstruct();
}

// Namespace namespace_e2d53d54/namespace_ff7f7372
// Params 2, eflags: 0x5 linked
// Checksum 0xea8c91ff, Offset: 0x4070
// Size: 0x242
function private function_53600d78(planner, constants) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    bots = planner::getblackboardattribute(planner, "doppelbots", squadindex);
    var_154e2210 = planner::getblackboardattribute(planner, "mp_pathable_sdBombZones", squadindex);
    if (!isarray(var_154e2210) || var_154e2210.size <= 0) {
        return spawnstruct();
    }
    zoneindex = undefined;
    if (isdefined(bots)) {
        bot = bots[0][#"__unsafe__"][#"bot"];
        if (isdefined(bot) && isalive(bot)) {
            if (!isdefined(bot.bot.var_16fb46e7)) {
                bot.bot.var_16fb46e7 = randomint(var_154e2210.size);
            }
            zoneindex = bot.bot.var_16fb46e7;
        }
    }
    if (!isdefined(zoneindex) || zoneindex >= var_154e2210.size) {
        zoneindex = randomint(var_154e2210.size);
    }
    planner::setblackboardattribute(planner, "mp_sdBombZones", array(var_154e2210[zoneindex][#"sdbombzone"]), squadindex);
    return spawnstruct();
}

// Namespace namespace_e2d53d54/namespace_ff7f7372
// Params 2, eflags: 0x5 linked
// Checksum 0x2002d732, Offset: 0x42c0
// Size: 0x132
function private function_7a9a7a24(planner, constants) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    bots = planner::getblackboardattribute(planner, "doppelbots", squadindex);
    defuseobj = planner::getblackboardattribute(planner, "mp_sdDefuseObj");
    if (!isdefined(defuseobj)) {
        return spawnstruct();
    }
    var_a9e623b5 = function_c0e398c4(bots, defuseobj, "sdDefuseObj");
    planner::setblackboardattribute(planner, "mp_pathable_sdDefuseObj", var_a9e623b5, squadindex);
    return spawnstruct();
}

// Namespace namespace_e2d53d54/namespace_ff7f7372
// Params 2, eflags: 0x5 linked
// Checksum 0xb1b8f58a, Offset: 0x4400
// Size: 0x14a
function private function_b032f16b(planner, constants) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    bots = planner::getblackboardattribute(planner, "doppelbots", squadindex);
    var_a9e623b5 = planner::getblackboardattribute(planner, "mp_pathable_sdDefuseObj", squadindex);
    if (!isarray(var_a9e623b5) || var_a9e623b5.size <= 0) {
        return spawnstruct();
    }
    planner::setblackboardattribute(planner, "mp_sdDefuseObj", array(var_a9e623b5[0][#"sddefuseobj"]), squadindex);
    return spawnstruct();
}

// Namespace namespace_e2d53d54/namespace_ff7f7372
// Params 2, eflags: 0x5 linked
// Checksum 0x8a21b90f, Offset: 0x4558
// Size: 0xd2
function private function_9c7e3773(planner, constants) {
    squadindex = planner::getblackboardattribute(planner, #"current_squad");
    /#
        assert(squadindex >= 0, "<unknown string>");
    #/
    var_7c70464e = region_utility::function_9fe18733();
    lanenum = squadindex % var_7c70464e;
    planner::setblackboardattribute(planner, "mp_laneNum", array(lanenum), squadindex);
    return spawnstruct();
}

// Namespace namespace_e2d53d54/namespace_ff7f7372
// Params 2, eflags: 0x5 linked
// Checksum 0xf5398d16, Offset: 0x4638
// Size: 0x4c
function private function_39cd5957(planner, constants) {
    commanderteam = planner::getblackboardattribute(planner, #"team");
    return commanderteam == game.attackers;
}

// Namespace namespace_e2d53d54/namespace_ff7f7372
// Params 2, eflags: 0x5 linked
// Checksum 0x7606ed71, Offset: 0x4690
// Size: 0x4c
function private function_97659d05(planner, constants) {
    commanderteam = planner::getblackboardattribute(planner, #"team");
    return commanderteam == game.defenders;
}

// Namespace namespace_e2d53d54/namespace_ff7f7372
// Params 2, eflags: 0x5 linked
// Checksum 0x54881e95, Offset: 0x46e8
// Size: 0x30
function private function_9e016913(planner, constants) {
    return isdefined(level.bombplanted) && level.bombplanted;
}

