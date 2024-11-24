#using scripts\core_common\array_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\gameobjects_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\ai_shared;
#using scripts\core_common\bots\bot;
#using scripts\core_common\ai\strategic_command;
#using scripts\core_common\ai\planner_squad_utility;
#using scripts\core_common\ai\planner_squad;
#using scripts\core_common\ai\systems\planner_blackboard;
#using scripts\core_common\ai\systems\planner;
#using scripts\core_common\ai\systems\blackboard;
#using scripts\core_common\ai\systems\ai_interface;
#using scripts\core_common\ai\region_utility;

#namespace planner_mp_squad_utility;

// Namespace planner_mp_squad_utility/planner_mp_squad_utility
// Params 0, eflags: 0x2
// Checksum 0x82037293, Offset: 0x1a0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"planner_mp_squad_utility", &namespace_9b3ab448::__init__, undefined, undefined);
}

#namespace namespace_9b3ab448;

// Namespace namespace_9b3ab448/planner_mp_squad_utility
// Params 0, eflags: 0x5 linked
// Checksum 0x78c9249d, Offset: 0x1e8
// Size: 0x404
function private __init__() {
    plannerutility::registerplannerapi(#"hash_7cb07a568d6f4cdf", &function_984c7289);
    plannerutility::registerplannerapi(#"hash_a478e9ff1c93f25", &function_3e055926);
    plannerutility::registerplannerapi(#"hash_6d04a8beefdd8300", &function_ca867965);
    plannerutility::registerplannerapi(#"hash_4e7f3e0ab96fb7d6", &function_16b44b20);
    plannerutility::registerplannerapi(#"hash_390ec5fab1695fc5", &function_c1f972ba);
    plannerutility::registerplannerapi(#"hash_729fab3e03b8972e", &function_a5c008c);
    plannerutility::registerplannerapi(#"hash_22435468ace59f07", &function_b6cc50c3);
    plannerutility::registerplannerapi(#"hash_5a17553b6546a4c5", &function_5d508101);
    plannerutility::registerplanneraction(#"hash_238cb2b85abe80de", &function_c586e586, &function_bb0c6999, &function_e9a16daa, undefined);
    plannerutility::registerplanneraction(#"hash_3fff1f031065f09f", &function_2b5c33a8, &function_4ff28605, &function_fd3f340f, undefined);
    plannerutility::registerplanneraction(#"hash_1d498d2dc9db37d7", &function_e32ce201, &function_fb2a81d9, &function_99cd56f9, undefined);
    plannerutility::registerplanneraction(#"hash_62f0edcdb7d80d62", &function_f3fefad8, &function_3235898a, &function_94e18e0d, undefined);
    plannerutility::registerplanneraction(#"hash_44fb55c97ea86435", &function_5b04cb13, &function_bb791fc6, &function_df817333, undefined);
    plannerutility::registerplanneraction(#"hash_7390712ebfb3d2d3", &function_f08360d0, &function_e7a81528, &function_fb79f3bd, undefined);
    plannerutility::registerplanneraction(#"hash_49c4e40e3e0f7be0", &function_458e36c0, &function_4f4ef3b6, &function_53882720, undefined);
    plannerutility::registerplanneraction(#"hash_53845b799f264276", &function_8c1624c4, &function_61587057, &function_6203826a, undefined);
}

// Namespace namespace_9b3ab448/planner_mp_squad_utility
// Params 1, eflags: 0x5 linked
// Checksum 0xcacb5a29, Offset: 0x5f8
// Size: 0xc6
function private _paramshasbots(params) {
    foreach (bot in params.bots) {
        if (isdefined(bot) && isbot(bot) && ai::getaiattribute(bot, "control") === "commander") {
            return true;
        }
    }
    return false;
}

// Namespace namespace_9b3ab448/planner_mp_squad_utility
// Params 1, eflags: 0x5 linked
// Checksum 0xd27b5c5f, Offset: 0x6c8
// Size: 0x6a
function private function_5cc53671(bot) {
    if (isdefined(bot) && isbot(bot)) {
        bot setgoal(bot.origin);
        bot.goalradius = 128;
        bot.goalheight = 128;
    }
}

// Namespace namespace_9b3ab448/planner_mp_squad_utility
// Params 2, eflags: 0x4
// Checksum 0xc69959f, Offset: 0x740
// Size: 0x18e
function private function_61be4b2c(bot, gameobject) {
    botpos = getclosestpointonnavmesh(bot.origin, 120, bot getpathfindingradius() * 1.05);
    var_5bf84edd = getclosestpointonnavmesh(gameobject.origin, 200);
    if (!isdefined(botpos) || !isdefined(var_5bf84edd)) {
        return gameobject.origin;
    }
    queryresult = positionquery_source_navigation(var_5bf84edd, 0, 200, 100, 16, bot);
    if (queryresult.data.size > 0) {
        for (i = 0; i < queryresult.data.size; i++) {
            pathsegment = generatenavmeshpath(botpos, queryresult.data[i].origin, bot);
            if (isdefined(pathsegment) && pathsegment.status === "succeeded") {
                return queryresult.data[i].origin;
            }
        }
    }
}

// Namespace namespace_9b3ab448/planner_mp_squad_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x8a19df9b, Offset: 0x8d8
// Size: 0x230
function private function_3ecc52d9(var_d3547bb1, lanenum) {
    if (isdefined(self.bot.var_6369695a)) {
        currentpath = self.bot.var_6369695a.path;
        if (currentpath.size > 0) {
            var_3ebdf257 = currentpath[currentpath.size - 1];
            if (var_3ebdf257 === var_d3547bb1) {
                return self.bot.var_6369695a;
            }
        }
    }
    tpoint = getclosesttacpoint(self.origin);
    if (!isdefined(tpoint)) {
        navpos = getclosestpointonnavmesh(self.origin, 600);
        if (isdefined(navpos)) {
            tpoint = getclosesttacpoint(navpos);
        }
    }
    if (isdefined(tpoint)) {
        var_55e8adf1 = tpoint.region;
        var_8c8aa14d = spawnstruct();
        var_8c8aa14d.path = self region_utility::function_b0f112ca(var_55e8adf1, var_d3547bb1, lanenum);
        var_8c8aa14d.var_91fc28f4 = 0;
        if (var_8c8aa14d.path.size == 0) {
            if (!isdefined(var_8c8aa14d.path)) {
                var_8c8aa14d.path = [];
            } else if (!isarray(var_8c8aa14d.path)) {
                var_8c8aa14d.path = array(var_8c8aa14d.path);
            }
            var_8c8aa14d.path[var_8c8aa14d.path.size] = var_d3547bb1;
        }
        self.bot.var_6369695a = var_8c8aa14d;
        return var_8c8aa14d;
    }
}

// Namespace namespace_9b3ab448/planner_mp_squad_utility
// Params 2, eflags: 0x5 linked
// Checksum 0xdce63bcc, Offset: 0xb10
// Size: 0x294
function private function_a702eb04(params, goal) {
    var_c19c4223 = 0;
    for (i = 0; i < params.bots.size; i++) {
        bot = params.bots[i];
        if (strategiccommandutility::isvalidbot(bot)) {
            var_6369695a = params.var_bb5fa5a7[i];
            if (!isdefined(var_6369695a) || var_6369695a.path.size == 0) {
                bot setgoal(goal);
                continue;
            }
            goalinfo = bot function_4794d6a3();
            tpoint = getclosesttacpoint(bot.origin);
            if (!isdefined(tpoint) && isdefined(goalinfo.regionid) && !goalinfo.isatgoal) {
                continue;
            }
            var_65733efe = -1;
            if (isdefined(tpoint)) {
                var_65733efe = tpoint.region;
            }
            for (var_91fc28f4 = var_6369695a.var_91fc28f4; var_91fc28f4 < var_6369695a.path.size; var_91fc28f4++) {
                if (var_65733efe === var_6369695a.path[var_91fc28f4]) {
                    break;
                }
            }
            if (var_91fc28f4 < var_6369695a.path.size - 2) {
                bot.var_d494450c = undefined;
                bot setgoal(var_6369695a.path[var_91fc28f4 + 1]);
                if (var_91fc28f4 > var_6369695a.var_91fc28f4) {
                    var_6369695a.var_91fc28f4 = var_91fc28f4;
                }
                continue;
            }
            bot.var_d494450c = undefined;
            bot setgoal(goal);
            var_c19c4223++;
        }
    }
    if (var_c19c4223 == params.bots.size) {
        return 1;
    }
    return 3;
}

// Namespace namespace_9b3ab448/planner_mp_squad_utility
// Params 2, eflags: 0x4
// Checksum 0x17397274, Offset: 0xdb0
// Size: 0x90
function private function_a023ae49(planner, params) {
    foreach (bot in params.bots) {
        function_5cc53671(bot);
    }
}

// Namespace namespace_9b3ab448/planner_mp_squad_utility
// Params 1, eflags: 0x5 linked
// Checksum 0x146152eb, Offset: 0xe48
// Size: 0x112
function private function_3f15f776(params) {
    for (i = 0; i < params.bots.size; i++) {
        bot = params.bots[i];
        if (strategiccommandutility::isvalidbot(bot)) {
            goalinfo = bot function_4794d6a3();
            if (isdefined(goalinfo.regionid) && !goalinfo.isatgoal) {
                continue;
            }
            region = params.regions[randomint(params.regions.size)];
            bot.var_d494450c = undefined;
            bot setgoal(region);
        }
    }
    return 3;
}

// Namespace namespace_9b3ab448/planner_mp_squad_utility
// Params 1, eflags: 0x5 linked
// Checksum 0x1c0d02f6, Offset: 0xf68
// Size: 0x112
function private function_6d153384(position) {
    if (level.teambased) {
        return function_69e73bdb(position);
    }
    maxdist = 0;
    var_4764de7f = position;
    foreach (spawn in level.spawn_start[#"free"]) {
        dist = distancesquared(position, spawn.origin);
        if (dist > maxdist) {
            maxdist = dist;
            var_4764de7f = spawn.origin;
        }
    }
    return var_4764de7f;
}

// Namespace namespace_9b3ab448/planner_mp_squad_utility
// Params 1, eflags: 0x5 linked
// Checksum 0x7921a458, Offset: 0x1088
// Size: 0x15e
function private function_69e73bdb(position) {
    if (!isdefined(level.spawn_start) || !isdefined(level.spawn_start[#"allies"]) || !isdefined(level.spawn_start[#"axis"]) || level.spawn_start[#"allies"].size == 0 || level.spawn_start[#"axis"].size == 0) {
        return undefined;
    }
    var_192c21ed = level.spawn_start[#"allies"][0].origin;
    var_945e5bae = level.spawn_start[#"axis"][0].origin;
    var_eb097b41 = distancesquared(position, var_192c21ed);
    var_75b1f52d = distancesquared(position, var_945e5bae);
    return var_eb097b41 < var_75b1f52d ? var_945e5bae : var_192c21ed;
}

// Namespace namespace_9b3ab448/planner_mp_squad_utility
// Params 2, eflags: 0x1 linked
// Checksum 0x38384984, Offset: 0x11f0
// Size: 0x156
function function_55cc58c4(planner, var_973c5ec5) {
    var_757ff5c1 = undefined;
    var_72d5b8ac = planner::getblackboardattribute(planner, "mp_pathable_controlZones");
    if (isarray(var_72d5b8ac) && var_72d5b8ac.size == 2) {
        foreach (var_2b511b1a in var_72d5b8ac) {
            zone = var_2b511b1a[#"controlzone"][#"__unsafe__"][#"controlzone"];
            if (zone.gameobject.trigger istriggerenabled() && zone != var_973c5ec5) {
                var_757ff5c1 = zone;
            }
        }
    }
    return var_757ff5c1;
}

// Namespace namespace_9b3ab448/planner_mp_squad_utility
// Params 2, eflags: 0x5 linked
// Checksum 0xf010816b, Offset: 0x1350
// Size: 0xe8
function private function_984c7289(planner, constants) {
    controlzones = planner::getblackboardattribute(planner, "mp_controlZones");
    if (!isarray(controlzones) || controlzones.size <= 0) {
        return false;
    }
    for (i = 0; i < controlzones.size; i++) {
        zone = controlzones[i][#"__unsafe__"][#"controlzone"];
        if (isdefined(zone) && isdefined(zone.gameobject)) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_9b3ab448/planner_mp_squad_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x8de96068, Offset: 0x1440
// Size: 0xfa
function private function_3e055926(planner, constants) {
    domflags = planner::getblackboardattribute(planner, "mp_domFlags");
    if (!isarray(domflags) || domflags.size <= 0) {
        return false;
    }
    for (i = 0; i < domflags.size; i++) {
        domflag = domflags[i][#"__unsafe__"][#"domflag"];
        if (isdefined(domflag) && domflags[i][#"claimed"] == 0) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_9b3ab448/planner_mp_squad_utility
// Params 2, eflags: 0x5 linked
// Checksum 0xfb150682, Offset: 0x1548
// Size: 0xe8
function private function_ca867965(planner, constants) {
    kothzone = planner::getblackboardattribute(planner, "mp_kothZone");
    if (!isarray(kothzone) || kothzone.size <= 0) {
        return false;
    }
    zone = kothzone[0][#"__unsafe__"][#"kothzone"];
    if (isdefined(zone) && isdefined(zone.trig) && zone.trig istriggerenabled()) {
        return true;
    }
    return false;
}

// Namespace namespace_9b3ab448/planner_mp_squad_utility
// Params 2, eflags: 0x5 linked
// Checksum 0xe0cdb490, Offset: 0x1638
// Size: 0x2a8
function private function_16b44b20(planner, constants) {
    sdbomb = planner::getblackboardattribute(planner, "mp_sdBomb");
    if (!isarray(sdbomb) || sdbomb.size <= 0) {
        return false;
    }
    bots = planner::getblackboardattribute(planner, "doppelbots");
    if (isdefined(bots)) {
        bot = bots[0][#"__unsafe__"][#"bot"];
        if (isdefined(bot) && isalive(bot)) {
            var_7fe54ea1 = bot getentitynumber();
            foreach (player in level.players) {
                if (!isdefined(player) || !isalive(player)) {
                    continue;
                }
                if (player == bot || !isbot(player)) {
                    continue;
                }
                if (!isdefined(player.sessionstate) || player.sessionstate != "playing") {
                    continue;
                }
                if (player.team != bot.team) {
                    continue;
                }
                if (player getentitynumber() < var_7fe54ea1) {
                    return false;
                }
            }
        }
    }
    bomb = sdbomb[0][#"__unsafe__"][#"sdbomb"];
    if (isdefined(bomb) && bomb.trigger istriggerenabled()) {
        return true;
    }
    return false;
}

// Namespace namespace_9b3ab448/planner_mp_squad_utility
// Params 2, eflags: 0x5 linked
// Checksum 0xb817c30, Offset: 0x18e8
// Size: 0xd6
function private function_c1f972ba(planner, constants) {
    bombzones = planner::getblackboardattribute(planner, "mp_sdBombZones");
    if (!isarray(bombzones) || bombzones.size <= 0) {
        return false;
    }
    for (i = 0; i < bombzones.size; i++) {
        zone = bombzones[i][#"__unsafe__"][#"sdbombzone"];
        if (isdefined(zone)) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_9b3ab448/planner_mp_squad_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x2c423ab9, Offset: 0x19c8
// Size: 0xb2
function private function_a5c008c(planner, constants) {
    defuseobj = planner::getblackboardattribute(planner, "mp_sdDefuseObj");
    if (!isarray(defuseobj) || defuseobj.size <= 0) {
        return false;
    }
    defuse = defuseobj[0][#"__unsafe__"][#"sddefuseobj"];
    if (isdefined(defuse)) {
        return true;
    }
    return false;
}

// Namespace namespace_9b3ab448/planner_mp_squad_utility
// Params 2, eflags: 0x5 linked
// Checksum 0xc2dde523, Offset: 0x1a88
// Size: 0xe8
function private function_b6cc50c3(planner, constants) {
    bots = planner::getblackboardattribute(planner, "doppelbots");
    for (i = 0; i < bots.size; i++) {
        bot = bots[0][#"__unsafe__"][#"bot"];
        if (isdefined(bot.isbombcarrier) && bot.isbombcarrier || isdefined(level.multibomb) && level.multibomb) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_9b3ab448/planner_mp_squad_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x29035059, Offset: 0x1b78
// Size: 0x60
function private function_5d508101(planner, constants) {
    lanenum = planner::getblackboardattribute(planner, "mp_laneNum");
    if (!isdefined(lanenum) || lanenum.size == 0) {
        return false;
    }
    return true;
}

// Namespace namespace_9b3ab448/planner_mp_squad_utility
// Params 2, eflags: 0x1 linked
// Checksum 0xda4f2e44, Offset: 0x1be0
// Size: 0x76
function function_f816c9b0(var_973c5ec5, var_5d4457) {
    var_803d2f2a = var_973c5ec5.gameobject.curprogress > 0;
    var_99b927c3 = var_5d4457.gameobject.curprogress > 0;
    if (!var_803d2f2a && var_99b927c3) {
        return true;
    }
    return false;
}

// Namespace namespace_9b3ab448/planner_mp_squad_utility
// Params 2, eflags: 0x5 linked
// Checksum 0xa69f24fa, Offset: 0x1c60
// Size: 0x52c
function private function_c586e586(planner, constants) {
    params = spawnstruct();
    controlzone = planner::getblackboardattribute(planner, "mp_controlZones");
    bots = [];
    foreach (botinfo in planner::getblackboardattribute(planner, "doppelbots")) {
        if (!isdefined(bots)) {
            bots = [];
        } else if (!isarray(bots)) {
            bots = array(bots);
        }
        bots[bots.size] = botinfo[#"__unsafe__"][#"bot"];
    }
    params.bots = bots;
    params.controlzone = controlzone[0][#"__unsafe__"][#"controlzone"];
    var_a83322cd = params.controlzone.gameobject.trigger istriggerenabled();
    if (!var_a83322cd) {
        var_5d4457 = self function_55cc58c4(planner, params.controlzone);
        var_497c24d4 = isdefined(var_5d4457);
        if (var_497c24d4) {
            params.controlzone = var_5d4457;
        }
    } else if (isdefined(params.bots[0]) && params.bots[0].team == game.defenders && getdvarint(#"bot_difficulty", 1) >= 1) {
        var_5d4457 = self function_55cc58c4(planner, params.controlzone);
        var_497c24d4 = isdefined(var_5d4457);
        if (var_497c24d4 && self function_f816c9b0(params.controlzone, var_5d4457)) {
            params.controlzone = var_5d4457;
        }
    }
    params.var_f76f8cf6 = planner::getblackboardattribute(planner, "mp_laneNum");
    params.var_46b70ee6 = getclosesttacpoint(params.controlzone.gameobject.origin).region;
    if (isdefined(params.controlzone)) {
        if (isdefined(params.var_f76f8cf6)) {
            params.var_bb5fa5a7 = [];
            for (i = 0; i < bots.size; i++) {
                if (strategiccommandutility::isvalidbot(bots[i]) && isalive(bots[i]) && game.state == "playing") {
                    params.var_bb5fa5a7[i] = bots[i] function_3ecc52d9(params.var_46b70ee6, params.var_f76f8cf6[0]);
                }
            }
        } else {
            foreach (bot in bots) {
                if (strategiccommandutility::isvalidbot(bot)) {
                    params.path = strategiccommandutility::calculatepathtoposition(bot, params.controlzone.gameobject.origin);
                    if (isdefined(params.path)) {
                        break;
                    }
                }
            }
        }
    }
    return params;
}

// Namespace namespace_9b3ab448/planner_mp_squad_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x400fbf97, Offset: 0x2198
// Size: 0x4c
function private function_bb0c6999(planner, params) {
    if (!isdefined(params.controlzone) || !_paramshasbots(params)) {
        return 2;
    }
    return 1;
}

// Namespace namespace_9b3ab448/planner_mp_squad_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x9f10d931, Offset: 0x21f0
// Size: 0x2a2
function private function_e9a16daa(planner, params) {
    if (!_paramshasbots(params)) {
        return 2;
    }
    if (!isdefined(params.controlzone)) {
        return 2;
    }
    var_a83322cd = params.controlzone.gameobject.trigger istriggerenabled();
    if (!var_a83322cd) {
        var_5d4457 = self function_55cc58c4(planner, params.controlzone);
        var_497c24d4 = isdefined(var_5d4457);
        if (var_497c24d4) {
            return 2;
        }
    } else if (isdefined(params.bots[0]) && params.bots[0].team == game.defenders && getdvarint(#"bot_difficulty", 1) >= 1) {
        var_5d4457 = self function_55cc58c4(planner, params.controlzone);
        var_497c24d4 = isdefined(var_5d4457);
        if (var_497c24d4 && self function_f816c9b0(params.controlzone, var_5d4457)) {
            return 2;
        }
    }
    if (!isdefined(params.var_bb5fa5a7) || params.var_bb5fa5a7.size == 0) {
        foreach (bot in params.bots) {
            if (strategiccommandutility::isvalidbot(bot)) {
                bot setgoal(params.controlzone.trigger);
            }
        }
        return 3;
    }
    return function_a702eb04(params, params.controlzone.trigger);
}

// Namespace namespace_9b3ab448/planner_mp_squad_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x52765079, Offset: 0x24a0
// Size: 0x88c
function private function_2b5c33a8(planner, constants) {
    params = spawnstruct();
    domflags = planner::getblackboardattribute(planner, "mp_domFlags");
    bots = [];
    foreach (botinfo in planner::getblackboardattribute(planner, "doppelbots")) {
        if (!isdefined(bots)) {
            bots = [];
        } else if (!isarray(bots)) {
            bots = array(bots);
        }
        bots[bots.size] = botinfo[#"__unsafe__"][#"bot"];
    }
    var_2bd3822d = [];
    foreach (flag in domflags) {
        var_796d54f2 = flag[#"__unsafe__"][#"domflag"];
        if (!isdefined(var_2bd3822d)) {
            var_2bd3822d = [];
        } else if (!isarray(var_2bd3822d)) {
            var_2bd3822d = array(var_2bd3822d);
        }
        var_2bd3822d[var_2bd3822d.size] = var_796d54f2;
    }
    params.bots = bots;
    foreach (bot in params.bots) {
        if (!isdefined(bot)) {
            continue;
        }
        var_d637f1b0 = [];
        var_e2b90cdd = [];
        var_44114a0e = "";
        for (i = 0; i < var_2bd3822d.size; i++) {
            flag = var_2bd3822d[i];
            if (flag gameobjects::get_owner_team() === bot.team) {
                var_44114a0e += "d";
                if (!isdefined(var_e2b90cdd)) {
                    var_e2b90cdd = [];
                } else if (!isarray(var_e2b90cdd)) {
                    var_e2b90cdd = array(var_e2b90cdd);
                }
                var_e2b90cdd[var_e2b90cdd.size] = flag;
                continue;
            }
            var_44114a0e += "a";
            if (!isdefined(var_d637f1b0)) {
                var_d637f1b0 = [];
            } else if (!isarray(var_d637f1b0)) {
                var_d637f1b0 = array(var_d637f1b0);
            }
            var_d637f1b0[var_d637f1b0.size] = flag;
        }
        if (!isdefined(bot.bot.var_44114a0e) || var_44114a0e != bot.bot.var_44114a0e) {
            bot.bot.var_44114a0e = var_44114a0e;
            bot.bot.currentflag = undefined;
        }
        if (!isdefined(bot.bot.currentflag)) {
            if (var_e2b90cdd.size >= 2) {
                if (getdvarint(#"bot_difficulty", 1) == 0) {
                    bot.bot.currentflag = var_e2b90cdd[0];
                } else {
                    bot.bot.currentflag = array::random(var_e2b90cdd);
                }
            } else if (var_d637f1b0.size >= 0) {
                bot.bot.currentflag = var_d637f1b0[0];
                if (var_d637f1b0.size > 1 && randomfloat(1) < 0.35 && distancesquared(bot.origin, var_d637f1b0[0].origin) > 360000) {
                    bot.bot.currentflag = var_d637f1b0[1];
                    if (var_d637f1b0.size > 2 && randomfloat(1) < 0.3) {
                        bot.bot.currentflag = var_d637f1b0[2];
                    }
                }
            } else if (var_2bd3822d.size > 0) {
                bot.bot.currentflag = var_2bd3822d[0];
            }
        }
        params.domflag = bot.bot.currentflag;
    }
    if (!isdefined(params.domflag)) {
        return params;
    }
    params.var_f76f8cf6 = planner::getblackboardattribute(planner, "mp_laneNum");
    params.var_46b70ee6 = getclosesttacpoint(params.domflag.origin).region;
    if (isdefined(params.domflag)) {
        if (isdefined(params.var_f76f8cf6)) {
            params.var_bb5fa5a7 = [];
            for (i = 0; i < bots.size; i++) {
                if (strategiccommandutility::isvalidbot(bots[i]) && isalive(bots[i]) && game.state == "playing") {
                    params.var_bb5fa5a7[i] = bots[i] function_3ecc52d9(params.var_46b70ee6, params.var_f76f8cf6[0]);
                }
            }
        } else {
            foreach (bot in bots) {
                if (strategiccommandutility::isvalidbot(bot)) {
                    params.path = strategiccommandutility::calculatepathtoposition(bot, params.domflag.origin);
                    if (isdefined(params.path)) {
                        break;
                    }
                }
            }
        }
    }
    return params;
}

// Namespace namespace_9b3ab448/planner_mp_squad_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x4b5cad36, Offset: 0x2d38
// Size: 0xec
function private function_4ff28605(planner, params) {
    if (!isdefined(params.domflag) || !_paramshasbots(params)) {
        return 2;
    }
    foreach (bot in params.bots) {
        if (strategiccommandutility::isvalidbot(bot)) {
            bot setgoal(params.domflag.trigger);
        }
    }
    return 1;
}

// Namespace namespace_9b3ab448/planner_mp_squad_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x13e629f4, Offset: 0x2e30
// Size: 0x142
function private function_fd3f340f(planner, params) {
    if (!_paramshasbots(params)) {
        return 2;
    }
    if (!isdefined(params.domflag)) {
        return 2;
    }
    if (!isdefined(params.var_bb5fa5a7) || params.var_bb5fa5a7.size == 0) {
        foreach (bot in params.bots) {
            if (strategiccommandutility::isvalidbot(bot)) {
                bot setgoal(params.domflag.trigger);
            }
        }
        return 3;
    }
    return function_a702eb04(params, params.domflag.trigger);
}

// Namespace namespace_9b3ab448/planner_mp_squad_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x7e17c668, Offset: 0x2f80
// Size: 0x39c
function private function_e32ce201(planner, constants) {
    params = spawnstruct();
    kothzone = planner::getblackboardattribute(planner, "mp_kothZone");
    bots = [];
    foreach (botinfo in planner::getblackboardattribute(planner, "doppelbots")) {
        if (!isdefined(bots)) {
            bots = [];
        } else if (!isarray(bots)) {
            bots = array(bots);
        }
        bots[bots.size] = botinfo[#"__unsafe__"][#"bot"];
    }
    params.bots = bots;
    params.kothzone = kothzone[0][#"__unsafe__"][#"kothzone"];
    params.var_f76f8cf6 = planner::getblackboardattribute(planner, "mp_laneNum");
    params.var_46b70ee6 = getclosesttacpoint(params.kothzone.gameobject.origin).region;
    if (isdefined(params.kothzone)) {
        if (isdefined(params.lanenum)) {
            params.var_bb5fa5a7 = [];
            for (i = 0; i < bots.size; i++) {
                if (strategiccommandutility::isvalidbot(bots[i]) && isalive(bots[i])) {
                    params.var_bb5fa5a7[i] = bots[i] function_3ecc52d9(params.var_46b70ee6, params.var_f76f8cf6[0]);
                }
            }
        } else {
            foreach (bot in bots) {
                if (strategiccommandutility::isvalidbot(bot)) {
                    params.path = strategiccommandutility::calculatepathtoposition(bot, params.kothzone.gameobject.origin);
                    if (isdefined(params.path)) {
                        break;
                    }
                }
            }
        }
    }
    return params;
}

// Namespace namespace_9b3ab448/planner_mp_squad_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x4e9bcc38, Offset: 0x3328
// Size: 0x4c
function private function_fb2a81d9(planner, params) {
    if (!isdefined(params.kothzone) || !_paramshasbots(params)) {
        return 2;
    }
    return 1;
}

// Namespace namespace_9b3ab448/planner_mp_squad_utility
// Params 2, eflags: 0x5 linked
// Checksum 0xebf91b4a, Offset: 0x3380
// Size: 0x142
function private function_99cd56f9(planner, params) {
    if (!_paramshasbots(params)) {
        return 2;
    }
    if (!isdefined(params.kothzone)) {
        return 2;
    }
    if (!isdefined(params.var_bb5fa5a7) || params.var_bb5fa5a7.size == 0) {
        foreach (bot in params.bots) {
            if (strategiccommandutility::isvalidbot(bot)) {
                bot setgoal(params.kothzone.trig);
            }
        }
        return 3;
    }
    return function_a702eb04(params, params.kothzone.trig);
}

// Namespace namespace_9b3ab448/planner_mp_squad_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x9c676704, Offset: 0x34d0
// Size: 0x264
function private function_f3fefad8(planner, constants) {
    params = spawnstruct();
    sdbomb = planner::getblackboardattribute(planner, "mp_sdBomb");
    bots = [];
    foreach (botinfo in planner::getblackboardattribute(planner, "doppelbots")) {
        if (!isdefined(bots)) {
            bots = [];
        } else if (!isarray(bots)) {
            bots = array(bots);
        }
        bots[bots.size] = botinfo[#"__unsafe__"][#"bot"];
    }
    params.bots = bots;
    params.sdbomb = sdbomb[0][#"__unsafe__"][#"sdbomb"];
    if (isdefined(params.sdbomb)) {
        foreach (bot in bots) {
            if (strategiccommandutility::isvalidbot(bot)) {
                params.path = strategiccommandutility::calculatepathtoposition(bot, params.sdbomb.origin);
                if (isdefined(params.path)) {
                    break;
                }
            }
        }
    }
    return params;
}

// Namespace namespace_9b3ab448/planner_mp_squad_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x60349cff, Offset: 0x3740
// Size: 0x172
function private function_3235898a(planner, params) {
    if (!isdefined(params.sdbomb) || !_paramshasbots(params)) {
        return 2;
    }
    foreach (bot in params.bots) {
        if (strategiccommandutility::isvalidbot(bot)) {
            bot bot::clear_interact();
            goal = params.sdbomb.origin;
            if (!ispointonnavmesh(goal, bot)) {
                var_1209f27 = getclosesttacpoint(goal);
                if (isdefined(var_1209f27)) {
                    goal = var_1209f27.origin;
                }
            }
            bot setgoal(goal);
            bot.goalradius = 8;
        }
    }
    return 1;
}

// Namespace namespace_9b3ab448/planner_mp_squad_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x11dc0d8e, Offset: 0x38c0
// Size: 0x156
function private function_94e18e0d(planner, params) {
    if (!_paramshasbots(params)) {
        return 2;
    }
    if (isdefined(params.sdbomb)) {
        if (isdefined(params.bots[0].isbombcarrier) && params.bots[0].isbombcarrier) {
            return 1;
        }
        if (!isdefined(params.sdbomb.trigger) || !params.sdbomb.trigger istriggerenabled()) {
            return 2;
        }
        goalinfo = params.bots[0] function_4794d6a3();
        if (isdefined(goalinfo) && goalinfo.isatgoal) {
            params.sdbomb.trigger useby(params.bots[0]);
        }
        return 3;
    }
    return 2;
}

// Namespace namespace_9b3ab448/planner_mp_squad_utility
// Params 2, eflags: 0x5 linked
// Checksum 0xd2c4d481, Offset: 0x3a20
// Size: 0x264
function private function_5b04cb13(planner, constants) {
    params = spawnstruct();
    sdbombzone = planner::getblackboardattribute(planner, "mp_sdBombZones");
    bots = [];
    foreach (botinfo in planner::getblackboardattribute(planner, "doppelbots")) {
        if (!isdefined(bots)) {
            bots = [];
        } else if (!isarray(bots)) {
            bots = array(bots);
        }
        bots[bots.size] = botinfo[#"__unsafe__"][#"bot"];
    }
    params.bots = bots;
    params.sdbombzone = sdbombzone[0][#"__unsafe__"][#"sdbombzone"];
    if (isdefined(params.sdbombzone)) {
        foreach (bot in bots) {
            if (strategiccommandutility::isvalidbot(bot)) {
                params.path = strategiccommandutility::calculatepathtoposition(bot, params.sdbombzone.origin);
                if (isdefined(params.path)) {
                    break;
                }
            }
        }
    }
    return params;
}

// Namespace namespace_9b3ab448/planner_mp_squad_utility
// Params 2, eflags: 0x5 linked
// Checksum 0xd00eb1ac, Offset: 0x3c90
// Size: 0x13c
function private function_bb791fc6(planner, params) {
    if (!isdefined(params.sdbombzone) || !_paramshasbots(params)) {
        return 2;
    }
    foreach (bot in params.bots) {
        if (strategiccommandutility::isvalidbot(bot)) {
            bot bot::clear_interact();
            goal = params.sdbombzone;
            bot setgoal(goal);
            bot.goalradius = 128;
            bot bot::set_interact(params.sdbombzone);
        }
    }
    return 1;
}

// Namespace namespace_9b3ab448/planner_mp_squad_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x9a3d2beb, Offset: 0x3dd8
// Size: 0x4e
function private function_df817333(planner, params) {
    if (!_paramshasbots(params)) {
        return 2;
    }
    if (isdefined(params.sdbombzone)) {
        return 3;
    }
    return 2;
}

// Namespace namespace_9b3ab448/planner_mp_squad_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x536a8fd5, Offset: 0x3e30
// Size: 0x264
function private function_f08360d0(planner, constants) {
    params = spawnstruct();
    sddefuseobj = planner::getblackboardattribute(planner, "mp_sdDefuseObj");
    bots = [];
    foreach (botinfo in planner::getblackboardattribute(planner, "doppelbots")) {
        if (!isdefined(bots)) {
            bots = [];
        } else if (!isarray(bots)) {
            bots = array(bots);
        }
        bots[bots.size] = botinfo[#"__unsafe__"][#"bot"];
    }
    params.bots = bots;
    params.sddefuseobj = sddefuseobj[0][#"__unsafe__"][#"sddefuseobj"];
    if (isdefined(params.sddefuseobj)) {
        foreach (bot in bots) {
            if (strategiccommandutility::isvalidbot(bot)) {
                params.path = strategiccommandutility::calculatepathtoposition(bot, params.sddefuseobj.origin);
                if (isdefined(params.path)) {
                    break;
                }
            }
        }
    }
    return params;
}

// Namespace namespace_9b3ab448/planner_mp_squad_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x2c989903, Offset: 0x40a0
// Size: 0x12c
function private function_e7a81528(planner, params) {
    if (!isdefined(params.sddefuseobj) || !_paramshasbots(params)) {
        return 2;
    }
    foreach (bot in params.bots) {
        if (strategiccommandutility::isvalidbot(bot)) {
            bot bot::clear_interact();
            bot setgoal(params.sddefuseobj);
            bot.goalradius = 128;
            bot bot::set_interact(params.sddefuseobj);
        }
    }
    return 1;
}

// Namespace namespace_9b3ab448/planner_mp_squad_utility
// Params 2, eflags: 0x5 linked
// Checksum 0xa811939c, Offset: 0x41d8
// Size: 0x4e
function private function_fb79f3bd(planner, params) {
    if (!_paramshasbots(params)) {
        return 2;
    }
    if (isdefined(params.sddefuseobj)) {
        return 3;
    }
    return 2;
}

// Namespace namespace_9b3ab448/planner_mp_squad_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x4fc2665c, Offset: 0x4230
// Size: 0x43e
function private function_458e36c0(planner, constants) {
    params = spawnstruct();
    sdbombzone = planner::getblackboardattribute(planner, "mp_sdBombZones");
    bots = [];
    foreach (botinfo in planner::getblackboardattribute(planner, "doppelbots")) {
        if (!isdefined(bots)) {
            bots = [];
        } else if (!isarray(bots)) {
            bots = array(bots);
        }
        bots[bots.size] = botinfo[#"__unsafe__"][#"bot"];
    }
    params.bots = bots;
    params.sdbombzone = sdbombzone[0][#"__unsafe__"][#"sdbombzone"];
    if (isdefined(params.sdbombzone)) {
        foreach (bot in bots) {
            if (strategiccommandutility::isvalidbot(bot)) {
                params.path = strategiccommandutility::calculatepathtoposition(bot, params.sdbombzone.origin);
                if (isdefined(params.path)) {
                    break;
                }
            }
        }
    }
    params.regions = [];
    if (!isdefined(params.regions)) {
        params.regions = [];
    } else if (!isarray(params.regions)) {
        params.regions = array(params.regions);
    }
    params.regions[params.regions.size] = getclosesttacpoint(params.sdbombzone.origin).region;
    var_c1db2604 = function_b507a336(params.regions[0]);
    foreach (neighbor in var_c1db2604.neighbors) {
        if (!isdefined(params.regions)) {
            params.regions = [];
        } else if (!isarray(params.regions)) {
            params.regions = array(params.regions);
        }
        params.regions[params.regions.size] = neighbor;
    }
    return params;
}

// Namespace namespace_9b3ab448/planner_mp_squad_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x7ebed205, Offset: 0x4678
// Size: 0xec
function private function_4f4ef3b6(planner, params) {
    if (!isdefined(params.sdbombzone) || !_paramshasbots(params)) {
        return 2;
    }
    foreach (bot in params.bots) {
        if (strategiccommandutility::isvalidbot(bot)) {
            bot setgoal(params.regions[0]);
        }
    }
    return 1;
}

// Namespace namespace_9b3ab448/planner_mp_squad_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x60dd06b5, Offset: 0x4770
// Size: 0x5a
function private function_53882720(planner, params) {
    if (!_paramshasbots(params)) {
        return 2;
    }
    if (!isdefined(params.sdbombzone)) {
        return 2;
    }
    return function_3f15f776(params);
}

// Namespace namespace_9b3ab448/planner_mp_squad_utility
// Params 2, eflags: 0x5 linked
// Checksum 0xb778368c, Offset: 0x47d8
// Size: 0x3f4
function private function_8c1624c4(planner, constants) {
    params = spawnstruct();
    bots = [];
    foreach (botinfo in planner::getblackboardattribute(planner, "doppelbots")) {
        if (!isdefined(bots)) {
            bots = [];
        } else if (!isarray(bots)) {
            bots = array(bots);
        }
        bots[bots.size] = botinfo[#"__unsafe__"][#"bot"];
    }
    if (!isdefined(bots[0]) || game.state != "playing") {
        return params;
    }
    params.bots = bots;
    params.var_f76f8cf6 = planner::getblackboardattribute(planner, "mp_laneNum");
    /#
        if (bots.size > 1) {
            print("<dev string:x38>");
        }
    #/
    var_79a83b2e = undefined;
    if (isdefined(bots[0].bot.var_f9954cf6)) {
        var_79a83b2e = bots[0].bot.var_f9954cf6;
        var_f6ce5982 = getclosesttacpoint(bots[0].origin);
        if (isdefined(var_f6ce5982) && isdefined(var_f6ce5982.region)) {
            var_65733efe = var_f6ce5982.region;
            if (var_65733efe === bots[0].bot.var_f9954cf6) {
                var_79a83b2e = undefined;
            }
        }
    }
    if (!isdefined(var_79a83b2e)) {
        var_ae5ed4e = function_6d153384(bots[0].origin);
        if (isdefined(var_ae5ed4e)) {
            var_79a83b2e = getclosesttacpoint(var_ae5ed4e).region;
        } else {
            var_79a83b2e = getclosesttacpoint(bots[0].origin).region;
        }
        bots[0].bot.var_f9954cf6 = var_79a83b2e;
    }
    params.var_46b70ee6 = var_79a83b2e;
    params.var_bb5fa5a7 = [];
    for (i = 0; i < bots.size; i++) {
        if (strategiccommandutility::isvalidbot(bots[i]) && isalive(bots[i])) {
            params.var_bb5fa5a7[i] = bots[i] function_3ecc52d9(params.var_46b70ee6, params.var_f76f8cf6[0]);
        }
    }
    return params;
}

// Namespace namespace_9b3ab448/planner_mp_squad_utility
// Params 2, eflags: 0x5 linked
// Checksum 0xaed690, Offset: 0x4bd8
// Size: 0x4c
function private function_61587057(planner, params) {
    if (!isdefined(params.var_bb5fa5a7) || !_paramshasbots(params)) {
        return 2;
    }
    return 1;
}

// Namespace namespace_9b3ab448/planner_mp_squad_utility
// Params 2, eflags: 0x5 linked
// Checksum 0x732be0bd, Offset: 0x4c30
// Size: 0x192
function private function_6203826a(planner, params) {
    if (!_paramshasbots(params)) {
        return 2;
    }
    if (!isdefined(params.var_bb5fa5a7)) {
        return 2;
    }
    var_d5fcb00b = params;
    for (i = 0; i < var_d5fcb00b.bots.size; i++) {
        bot = var_d5fcb00b.bots[i];
        if (strategiccommandutility::isvalidbot(bot) && bot bot::in_combat() && distancesquared(bot.enemy.origin, bot.origin) < 640000) {
            var_494658cd = getclosesttacpoint(bot.enemy.origin);
            if (!isdefined(var_494658cd)) {
                continue;
            }
            bot setgoal(var_494658cd.region);
            var_d5fcb00b.bots[i] = undefined;
        }
    }
    return function_a702eb04(var_d5fcb00b, params.var_46b70ee6);
}

