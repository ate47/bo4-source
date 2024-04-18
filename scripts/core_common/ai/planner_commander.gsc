// Atian COD Tools GSC decompiler test
#using scripts\core_common\throttle_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\ai\strategic_command.gsc;
#using scripts\core_common\ai\planner_squad.gsc;
#using scripts\core_common\ai\planner_commander_interface.gsc;
#using scripts\core_common\ai\commander_util.gsc;
#using scripts\core_common\ai\systems\planner.gsc;
#using scripts\core_common\ai\systems\blackboard.gsc;
#using scripts\core_common\ai\systems\ai_interface.gsc;

#namespace planner_commander;

// Namespace planner_commander/planner_commander
// Params 0, eflags: 0x2
// Checksum 0xb471a3eb, Offset: 0x240
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"planner_commander", &plannercommander::__init__, undefined, undefined);
}

#namespace plannercommander;

// Namespace plannercommander/planner_commander
// Params 0, eflags: 0x2
// Checksum 0x80f724d1, Offset: 0x288
// Size: 0x4
function autoexec main() {
    
}

// Namespace plannercommander/planner_commander
// Params 0, eflags: 0x5 linked
// Checksum 0x7c9ec4a4, Offset: 0x298
// Size: 0x84
function private __init__() {
    commanderinterface::registercommanderinterfaceattributes();
    if (!isdefined(level.strategic_command_throttle)) {
        level.strategic_command_throttle = new throttle();
        [[ level.strategic_command_throttle ]]->initialize(1, float(function_60d95f53()) / 1000);
    }
}

// Namespace plannercommander/planner_commander
// Params 1, eflags: 0x4
// Checksum 0xf5dc859e, Offset: 0x328
// Size: 0x34
function private _cancelstrategize(commander) {
    commander.cancel = 1;
    planner::cancel(commander.planner);
}

// Namespace plannercommander/planner_commander
// Params 1, eflags: 0x5 linked
// Checksum 0x1cb95b2, Offset: 0x368
// Size: 0x140
function private _cloneblackboard(commander) {
    pixbeginevent(#"commandercloneblackboard");
    aiprofile_beginentry("commanderCloneBlackboard");
    blackboard = blackboard::cloneblackboardfromstruct(commander);
    if (getrealtime() - commander.strategizestarttime > commander.maxframetime) {
        aiprofile_endentry();
        pixendevent();
        [[ level.strategic_command_throttle ]]->waitinqueue(commander);
        commander.strategizestarttime = getrealtime();
        pixbeginevent("commanderCloneBlackboard");
        aiprofile_beginentry("commanderCloneBlackboard");
    }
    aiprofile_endentry();
    pixendevent();
    return blackboard;
}

// Namespace plannercommander/planner_commander
// Params 2, eflags: 0x5 linked
// Checksum 0xd284e559, Offset: 0x4b0
// Size: 0x1b4
function private function_b1c3f0bd(commander, &blackboard) {
    pixbeginevent(#"commanderconstructtargetlist");
    aiprofile_beginentry("commanderConstructTargetList");
    assert(isstruct(commander));
    assert(isarray(blackboard));
    possiblesquads = array();
    idlebots = blackboard[#"idle_doppelbots"];
    foreach (idlebot in idlebots) {
        squad = array();
        squad[squad.size] = idlebot;
        possiblesquads[possiblesquads.size] = squad;
    }
    blackboard[#"possible_squads"] = possiblesquads;
    aiprofile_endentry();
    pixendevent();
}

// Namespace plannercommander/planner_commander
// Params 2, eflags: 0x5 linked
// Checksum 0x4f411cf1, Offset: 0x670
// Size: 0x774
function private function_12b9fafb(commander, &blackboard) {
    pixbeginevent(#"commanderconstructtargetlist");
    aiprofile_beginentry("commanderConstructTargetList");
    assert(isstruct(commander));
    assert(isarray(blackboard));
    targets = array();
    priorities = array(#"hash_179ccf9d7cfd1e31", #"hash_254689c549346d57", #"hash_4bd86f050b36e1f6", #"hash_19c0ac460bdb9928", #"hash_160b01bbcd78c723", #"hash_c045a5aa4ac7c1d", #"hash_47fd3da20e90cd01", #"hash_64fc5c612a94639c", #"(-4) unimportant");
    foreach (priority in priorities) {
        targets[priority] = array();
    }
    gameobjects = blackboard[#"gameobjects"];
    blackboard[#"gameobjects"] = undefined;
    foreach (gameobject in gameobjects) {
        priority = gameobject[#"strategy"].("doppelbotspriority");
        targetsize = targets[priority].size;
        targets[priority][targetsize] = gameobject;
    }
    if (getrealtime() - commander.strategizestarttime > commander.maxframetime) {
        aiprofile_endentry();
        pixendevent();
        [[ level.strategic_command_throttle ]]->waitinqueue(commander);
        commander.strategizestarttime = getrealtime();
        pixbeginevent("commanderConstructTargetList");
        aiprofile_beginentry("commanderConstructTargetList");
    }
    if (commander.cancel) {
        aiprofile_endentry();
        pixendevent();
        return;
    }
    missioncomponents = blackboard[#"missioncomponents"];
    blackboard[#"missioncomponents"] = undefined;
    foreach (component in missioncomponents) {
        priority = component[#"strategy"].("doppelbotspriority");
        targetsize = targets[priority].size;
        targets[priority][targetsize] = component;
    }
    if (getrealtime() - commander.strategizestarttime > commander.maxframetime) {
        aiprofile_endentry();
        pixendevent();
        [[ level.strategic_command_throttle ]]->waitinqueue(commander);
        commander.strategizestarttime = getrealtime();
        pixbeginevent("commanderConstructTargetList");
        aiprofile_beginentry("commanderConstructTargetList");
    }
    if (commander.cancel) {
        aiprofile_endentry();
        pixendevent();
        return;
    }
    gpbundles = blackboard[#"gpbundles"];
    blackboard[#"gpbundles"] = undefined;
    foreach (bundle in gpbundles) {
        priority = bundle[#"strategy"].("doppelbotspriority");
        targetsize = targets[priority].size;
        targets[priority][targetsize] = bundle;
    }
    if (getrealtime() - commander.strategizestarttime > commander.maxframetime) {
        aiprofile_endentry();
        pixendevent();
        [[ level.strategic_command_throttle ]]->waitinqueue(commander);
        commander.strategizestarttime = getrealtime();
        pixbeginevent("commanderConstructTargetList");
        aiprofile_beginentry("commanderConstructTargetList");
    }
    if (commander.cancel) {
        aiprofile_endentry();
        pixendevent();
        return;
    }
    blackboard[#"targets"] = targets;
    commander.var_6365d720 = targets.size;
    aiprofile_endentry();
    pixendevent();
}

// Namespace plannercommander/planner_commander
// Params 1, eflags: 0x5 linked
// Checksum 0x225a6a4d, Offset: 0xdf0
// Size: 0xf8
function private _createsquads(commander) {
    newsquadcount = planner::subblackboardcount(commander.planner);
    for (index = 1; index <= newsquadcount; index++) {
        [[ level.strategic_command_throttle ]]->waitinqueue(commander);
        if (commander.cancel) {
            return;
        }
        newsquad = plannersquadutility::createsquad(planner::getsubblackboard(commander.planner, index), commander.squadplanner, commander.squadupdaterate, commander.squadmaxplannerframetime);
        commander.squads[commander.squads.size] = newsquad;
    }
}

// Namespace plannercommander/planner_commander
// Params 1, eflags: 0x4
// Checksum 0xd1ec544d, Offset: 0xef0
// Size: 0x8a0
function private _debugcommander(commander) {
    if (!isdefined(level.__plannercommanderdebug)) {
        level.__plannercommanderdebug = [];
    }
    for (index = 0; index <= level.__plannercommanderdebug.size; index++) {
        if (!isdefined(level.__plannercommanderdebug[index]) || level.__plannercommanderdebug[index].shutdown) {
            break;
        }
    }
    level.__plannercommanderdebug[index] = commander;
    commanderid = index + 1;
    while (isdefined(commander) && !commander.shutdown) {
        if (getdvarint(#"ai_debugcommander", 0) == commanderid) {
            offset = 30;
            position = (0, 0, 0);
            xoffset = 0;
            yoffset = 200;
            textscale = 0.7;
            team = blackboard::getstructblackboardattribute(commander, #"team");
            /#
                if (commander.pause) {
                    recordtext(function_9e72a96(commander.planner.name) + "<unknown string>" + function_9e72a96(team) + "<unknown string>", position + (xoffset, yoffset, 0), (1, 1, 1), "<unknown string>", textscale);
                    waitframe(1);
                    continue;
                }
                recordtext(function_9e72a96(commander.planner.name) + "<unknown string>" + function_9e72a96(team) + "<unknown string>" + commander.planstarttime + "<unknown string>" + commander.planfinishtime + "<unknown string>" + int((commander.planfinishtime - commander.planstarttime) / int(float(function_60d95f53()) / 1000 * 1000) + 1) + "<unknown string>", position + (xoffset, yoffset, 0), (1, 1, 1), "<unknown string>", textscale);
            #/
            xoffset += 15;
            /#
                side = strategiccommandutility::function_a1edb007(team);
                var_b5dfd8a6 = strategiccommandutility::function_45c5edc6(side);
                if (!isdefined(var_b5dfd8a6)) {
                    var_b5dfd8a6 = #"default_strategicbundle";
                }
                yoffset += 13;
                recordtext("<unknown string>" + var_b5dfd8a6, position + (xoffset, yoffset, 0), (1, 1, 1), "<unknown string>", textscale);
            #/
            for (index = 0; index < commander.plan.size; index++) {
                yoffset += 13;
                /#
                    recordtext(function_9e72a96(commander.plan[index].name), position + (xoffset, yoffset, 0), (1, 1, 1), "<unknown string>", textscale);
                #/
            }
            attackgameobjects = blackboard::getstructblackboardattribute(commander, #"gameobjects_assault");
            for (index = 0; index < attackgameobjects.size; index++) {
                /#
                    if (isdefined(attackgameobjects[index][#"identifier"])) {
                        record3dtext(attackgameobjects[index][#"identifier"], attackgameobjects[index][#"origin"] + (0, 0, offset), (1, 0, 0), "<unknown string>");
                    }
                    recordsphere(attackgameobjects[index][#"origin"], 20, (1, 0, 0));
                #/
            }
            defendgameobjects = blackboard::getstructblackboardattribute(commander, #"gameobjects_defend");
            for (index = 0; index < defendgameobjects.size; index++) {
                /#
                    if (isdefined(defendgameobjects[index][#"identifier"])) {
                        record3dtext(defendgameobjects[index][#"identifier"], defendgameobjects[index][#"origin"] + (0, 0, offset), (1, 0.5, 0), "<unknown string>");
                    }
                    recordsphere(defendgameobjects[index][#"origin"], 20, (1, 0.5, 0));
                #/
            }
            objectives = blackboard::getstructblackboardattribute(commander, #"objectives");
            for (index = 0; index < objectives.size; index++) {
                /#
                    recordsphere(objectives[index][#"origin"], 20, (0, 0, 1));
                #/
            }
            excluded = blackboard::getstructblackboardattribute(commander, #"gameobjects_exclude");
            excludedmap = [];
            foreach (excludename in excluded) {
                excludedmap[excludename] = 1;
            }
            if (excludedmap.size > 0) {
                if (isdefined(level.a_gameobjects)) {
                    for (index = 0; index < level.a_gameobjects.size; index++) {
                        gameobject = level.a_gameobjects[index];
                        identifier = gameobject gameobjects::get_identifier();
                        if (isdefined(identifier) && isdefined(excludedmap[identifier])) {
                            /#
                                record3dtext(identifier, gameobject.origin + (0, 0, offset), (1, 1, 0), "<unknown string>");
                                recordsphere(gameobject.origin, 20, (1, 1, 0));
                            #/
                        }
                    }
                }
            }
        }
        waitframe(1);
    }
}

// Namespace plannercommander/planner_commander
// Params 1, eflags: 0x4
// Checksum 0x11c83c2d, Offset: 0x1798
// Size: 0xf6
function private function_9962ffd8(commander) {
    team = blackboard::getstructblackboardattribute(commander, #"team");
    pause = 1;
    while (isdefined(commander) && !commander.shutdown) {
        if (getdvarint(#"hash_3335f636d26687d3", 0)) {
            if (pause) {
                commander_util::pause_commander(team);
                pause = 0;
            } else {
                commander_util::function_2c38e191(team);
                pause = 1;
            }
        }
        setdvar(#"hash_3335f636d26687d3", 0);
        waitframe(1);
    }
}

// Namespace plannercommander/planner_commander
// Params 1, eflags: 0x5 linked
// Checksum 0xeac65681, Offset: 0x1898
// Size: 0x6a
function private _disbandallsquads(commander) {
    for (index = 0; index < commander.squads.size; index++) {
        plannersquadutility::shutdown(commander.squads[index]);
    }
    commander.squads = [];
}

// Namespace plannercommander/planner_commander
// Params 1, eflags: 0x5 linked
// Checksum 0xfaa5bbc5, Offset: 0x1910
// Size: 0x1cc
function private _disbandsquads(commander) {
    pixbeginevent(#"commanderdisbandsquads");
    aiprofile_beginentry("commanderDisbandSquads");
    for (index = 0; index < commander.var_6e4f62de.size; index++) {
        plannersquadutility::shutdown(commander.var_6e4f62de[index]);
        if (getrealtime() - commander.strategizestarttime > commander.maxframetime) {
            aiprofile_endentry();
            pixendevent();
            [[ level.strategic_command_throttle ]]->waitinqueue(commander);
            commander.strategizestarttime = getrealtime();
            pixbeginevent("commanderDisbandSquads");
            aiprofile_beginentry("commanderDisbandSquads");
        }
        if (commander.cancel) {
            aiprofile_endentry();
            pixendevent();
            return;
        }
    }
    commander.squads = commander.squadsfit;
    commander.squadsfit = [];
    commander.var_6e4f62de = [];
    aiprofile_endentry();
    pixendevent();
}

// Namespace plannercommander/planner_commander
// Params 2, eflags: 0x5 linked
// Checksum 0x9b43cacd, Offset: 0x1ae8
// Size: 0x332
function private _evaluatefitness(commander, squad) {
    assert(isstruct(squad));
    if (commander.squadevaluators.size == 0) {
        return 0;
    }
    scores = [];
    foreach (evaluatorentry in commander.squadevaluators) {
        assert(isarray(evaluatorentry));
        pixbeginevent(evaluatorentry[0]);
        aiprofile_beginentry(evaluatorentry[0]);
        evaluatorfunc = plannercommanderutility::getutilityapifunction(evaluatorentry[0]);
        score = [[ evaluatorfunc ]](commander, squad, evaluatorentry[1]);
        assert(score >= 0 && score <= 1, "<unknown string>" + evaluatorentry[0] + "<unknown string>" + 0 + "<unknown string>" + 1 + "<unknown string>");
        scores[evaluatorentry[0]] = score;
        aiprofile_endentry();
        pixendevent();
        if (getrealtime() - commander.strategizestarttime > commander.maxframetime) {
            aiprofile_endentry();
            pixendevent();
            [[ level.strategic_command_throttle ]]->waitinqueue(commander);
            commander.strategizestarttime = getrealtime();
            pixbeginevent("commanderEvaluateSquads");
            aiprofile_beginentry("commanderEvaluateSquads");
        }
    }
    fitness = 1;
    foreach (score in scores) {
        fitness *= score;
    }
    return fitness;
}

// Namespace plannercommander/planner_commander
// Params 1, eflags: 0x5 linked
// Checksum 0xa78b6c4c, Offset: 0x1e28
// Size: 0x1c4
function private _evaluatesquads(commander) {
    pixbeginevent(#"commanderevaluatesquads");
    aiprofile_beginentry("commanderEvaluateSquads");
    commander.squadsfitness = [];
    for (index = 0; index < commander.squads.size; index++) {
        commander.squadsfitness[index] = _evaluatefitness(commander, commander.squads[index]);
        if (getrealtime() - commander.strategizestarttime > commander.maxframetime) {
            aiprofile_endentry();
            pixendevent();
            [[ level.strategic_command_throttle ]]->waitinqueue(commander);
            commander.strategizestarttime = getrealtime();
            pixbeginevent("commanderEvaluateSquads");
            aiprofile_beginentry("commanderEvaluateSquads");
        }
        if (commander.cancel) {
            aiprofile_endentry();
            pixendevent();
            return;
        }
    }
    aiprofile_endentry();
    pixendevent();
}

// Namespace plannercommander/planner_commander
// Params 2, eflags: 0x5 linked
// Checksum 0x1adfb6aa, Offset: 0x1ff8
// Size: 0x74c
function private _initializeblackboard(commander, team) {
    blackboard::createblackboardforentity(commander);
    blackboard::registerblackboardattribute(commander, #"doppelbots", array(), undefined);
    blackboard::registerblackboardattribute(commander, #"gameobjects_assault", array(), undefined);
    blackboard::registerblackboardattribute(commander, #"gameobjects_assault_destroyed", 0, undefined);
    blackboard::registerblackboardattribute(commander, #"gameobjects_assault_total", 0, undefined);
    blackboard::registerblackboardattribute(commander, #"gameobjects_defend", array(), undefined);
    blackboard::registerblackboardattribute(commander, #"idle_doppelbots", array(), undefined);
    blackboard::registerblackboardattribute(commander, #"objectives", array(), undefined);
    blackboard::registerblackboardattribute(commander, #"players", array(), undefined);
    blackboard::registerblackboardattribute(commander, #"bot_vehicles", array(), undefined);
    blackboard::registerblackboardattribute(commander, #"allow_escort", 1, undefined);
    blackboard::registerblackboardattribute(commander, #"allow_golden_path", 1, undefined);
    blackboard::registerblackboardattribute(commander, #"allow_progress_throttling", 0, undefined);
    blackboard::registerblackboardattribute(commander, #"gameobjects_exclude", array(), undefined);
    blackboard::registerblackboardattribute(commander, #"gameobjects_force_attack", array(), undefined);
    blackboard::registerblackboardattribute(commander, #"gameobjects_force_defend", array(), undefined);
    blackboard::registerblackboardattribute(commander, #"gameobjects_priority", array(), undefined);
    blackboard::registerblackboardattribute(commander, #"gameobjects_restrict", array(), undefined);
    blackboard::registerblackboardattribute(commander, #"team", team, undefined);
    blackboard::registerblackboardattribute(commander, #"throttling_total_gameobjects", undefined, undefined);
    blackboard::registerblackboardattribute(commander, #"throttling_total_gameobjects_enemy", undefined, undefined);
    blackboard::registerblackboardattribute(commander, #"throttling_enemy_commander", undefined, undefined);
    blackboard::registerblackboardattribute(commander, #"throttling_lower_bound", undefined, undefined);
    blackboard::registerblackboardattribute(commander, #"throttling_upper_bound", undefined, undefined);
    blackboard::registerblackboardattribute(commander, #"pathing_calculated_paths", array(), undefined);
    blackboard::registerblackboardattribute(commander, #"pathing_requested_bots", array(), undefined);
    blackboard::registerblackboardattribute(commander, #"pathing_requested_points", array(), undefined);
    blackboard::registerblackboardattribute(commander, #"hash_f5c6c6aa7dc0f6d", array(), undefined);
    blackboard::registerblackboardattribute(commander, #"hash_6e9081699001bcd9", array(), undefined);
    blackboard::registerblackboardattribute(commander, #"hash_4984fd4b0ba666a2", array(), undefined);
    blackboard::registerblackboardattribute(commander, #"missioncomponents", array(), undefined);
    blackboard::registerblackboardattribute(commander, #"gameobjects", array(), undefined);
    blackboard::registerblackboardattribute(commander, #"gameobjects_vehicles", array(), undefined);
    blackboard::registerblackboardattribute(commander, #"targets", array(), undefined);
    blackboard::registerblackboardattribute(commander, #"entities", array(), undefined);
    blackboard::registerblackboardattribute(commander, #"gpbundles", array(), undefined);
    blackboard::registerblackboardattribute(commander, #"current_squad", -1, undefined);
}

// Namespace plannercommander/planner_commander
// Params 1, eflags: 0x5 linked
// Checksum 0x22d1ed34, Offset: 0x2750
// Size: 0x52
function private _initializedaemonfunctions(functype) {
    if (!isdefined(level._daemonscriptfunctions)) {
        level._daemonscriptfunctions = [];
    }
    if (!isdefined(level._daemonscriptfunctions[functype])) {
        level._daemonscriptfunctions[functype] = [];
    }
}

// Namespace plannercommander/planner_commander
// Params 1, eflags: 0x5 linked
// Checksum 0x7ceb3667, Offset: 0x27b0
// Size: 0x64
function private _initializedaemons(commander) {
    assert(!isdefined(commander.daemons), "<unknown string>");
    commander.daemons = [];
    commander thread _updateblackboarddaemons(commander);
}

// Namespace plannercommander/planner_commander
// Params 1, eflags: 0x5 linked
// Checksum 0x30d15d5d, Offset: 0x2820
// Size: 0x1a
function private _initializesquads(commander) {
    commander.squads = [];
}

// Namespace plannercommander/planner_commander
// Params 1, eflags: 0x5 linked
// Checksum 0x690c10fd, Offset: 0x2848
// Size: 0x52
function private _initializeutilityfunctions(functype) {
    if (!isdefined(level._squadutilityscriptfunctions)) {
        level._squadutilityscriptfunctions = [];
    }
    if (!isdefined(level._squadutilityscriptfunctions[functype])) {
        level._squadutilityscriptfunctions[functype] = [];
    }
}

// Namespace plannercommander/planner_commander
// Params 1, eflags: 0x5 linked
// Checksum 0xfdbe7816, Offset: 0x28a8
// Size: 0x478
function private function_f9d38682(commander) {
    pixbeginevent(#"commanderorphanbotcount");
    aiprofile_beginentry("commanderOrphanBotCount");
    var_c7a9b9a8 = [];
    for (index = 0; index < commander.squads.size; index++) {
        botentries = plannersquadutility::getblackboardattribute(commander.squads[index], "doppelbots");
        foreach (botentry in botentries) {
            bot = botentry[#"__unsafe__"][#"bot"];
            if (strategiccommandutility::isvalidbot(bot)) {
                var_c7a9b9a8[bot getentitynumber()] = bot;
            }
        }
        if (getrealtime() - commander.strategizestarttime > commander.maxframetime) {
            aiprofile_endentry();
            pixendevent();
            [[ level.strategic_command_throttle ]]->waitinqueue(commander);
            commander.strategizestarttime = getrealtime();
            pixbeginevent("commanderOrphanBotCount");
            aiprofile_beginentry("commanderOrphanBotCount");
        }
        if (commander.cancel) {
            aiprofile_endentry();
            pixendevent();
            return;
        }
    }
    doppelbots = blackboard::getstructblackboardattribute(commander, #"doppelbots");
    var_ad63c778 = 0;
    if (doppelbots.size > var_c7a9b9a8.size) {
        foreach (botentry in doppelbots) {
            bot = botentry[#"__unsafe__"][#"bot"];
            if (strategiccommandutility::isvalidbot(bot) && !isdefined(var_c7a9b9a8[bot getentitynumber()])) {
                var_ad63c778++;
            }
            if (getrealtime() - commander.strategizestarttime > commander.maxframetime) {
                aiprofile_endentry();
                pixendevent();
                [[ level.strategic_command_throttle ]]->waitinqueue(commander);
                commander.strategizestarttime = getrealtime();
                pixbeginevent("commanderOrphanBotCount");
                aiprofile_beginentry("commanderOrphanBotCount");
            }
            if (commander.cancel) {
                aiprofile_endentry();
                pixendevent();
                return;
            }
        }
    }
    aiprofile_endentry();
    pixendevent();
    return var_ad63c778;
}

// Namespace plannercommander/planner_commander
// Params 2, eflags: 0x5 linked
// Checksum 0x7504f7cd, Offset: 0x2d28
// Size: 0x166
function private _plan(commander, &blackboard) {
    planstarttime = gettime();
    var_80d439bc = [];
    var_547a067e = 0;
    do {
        var_593a7ecb = planner::plan(commander.planner, blackboard, commander.maxframetime, commander.strategizestarttime, var_547a067e);
        var_80d439bc = arraycombine(var_80d439bc, var_593a7ecb, 0, 0);
        var_547a067e = 1;
        if (getrealtime() - commander.strategizestarttime > commander.maxframetime) {
            [[ level.strategic_command_throttle ]]->waitinqueue(commander);
            commander.strategizestarttime = getrealtime();
        }
    } while (planner::getblackboardattribute(commander.planner, #"idle_doppelbots").size > 0);
    commander.plan = var_80d439bc;
    commander.planstarttime = planstarttime;
    commander.planfinishtime = gettime();
}

// Namespace plannercommander/planner_commander
// Params 2, eflags: 0x4
// Checksum 0xfbc67ef2, Offset: 0x2e98
// Size: 0x51c
function private _reclaimescortparameters(commander, &blackboard) {
    pixbeginevent(#"commanderreclaimescortparameters");
    aiprofile_beginentry("commanderReclaimEscortParameters");
    assert(isstruct(commander));
    assert(isarray(blackboard));
    players = blackboard[#"players"];
    for (index = 0; index < commander.squads.size; index++) {
        escorts = plannersquadutility::getblackboardattribute(commander.squads[index], "escorts");
        order = plannersquadutility::getblackboardattribute(commander.squads[index], "order");
        squadbots = plannersquadutility::getblackboardattribute(commander.squads[index], "doppelbots");
        if (!isdefined(escorts) || escorts.size <= 0 || !isdefined(order)) {
            continue;
        }
        foreach (escort in escorts) {
            foreach (player in players) {
                if (!isdefined(player[#"entnum"]) || !isdefined(escort[#"entnum"]) || player[#"entnum"] !== escort[#"entnum"]) {
                    continue;
                }
                switch (order) {
                case #"order_escort_mainguard":
                    player[#"escortmainguard"] = arraycombine(player[#"escortmainguard"], squadbots, 1, 0);
                    break;
                case #"order_escort_rearguard":
                    player[#"escortrearguard"] = arraycombine(player[#"escortrearguard"], squadbots, 1, 0);
                    break;
                case #"order_escort_vanguard":
                    player[#"escortvanguard"] = arraycombine(player[#"escortvanguard"], squadbots, 1, 0);
                    break;
                }
            }
            if (getrealtime() - commander.strategizestarttime > commander.maxframetime) {
                aiprofile_endentry();
                pixendevent();
                [[ level.strategic_command_throttle ]]->waitinqueue(commander);
                commander.strategizestarttime = getrealtime();
                pixbeginevent("commanderReclaimEscortParameters");
                aiprofile_beginentry("commanderReclaimEscortParameters");
            }
            if (commander.cancel) {
                aiprofile_endentry();
                pixendevent();
                return;
            }
        }
    }
    aiprofile_endentry();
    pixendevent();
}

// Namespace plannercommander/planner_commander
// Params 2, eflags: 0x5 linked
// Checksum 0x3d0571eb, Offset: 0x33c0
// Size: 0x45c
function private function_ac4ff936(commander, &blackboard) {
    pixbeginevent(#"commanderreclaimtargets");
    aiprofile_beginentry("commanderReclaimTargets");
    assert(isstruct(commander));
    assert(isarray(blackboard));
    targets = blackboard[#"targets"];
    for (index = 0; index < commander.squads.size; index++) {
        gameobjects = plannersquadutility::getblackboardattribute(commander.squads[index], "gameobjects");
        if (isarray(gameobjects)) {
            foreach (gameobjectentry in gameobjects) {
                if (gameobjectentry[#"claimed"]) {
                    strategy = gameobjectentry[#"strategy"];
                    gameobject = gameobjectentry[#"__unsafe__"][#"object"];
                    if (isdefined(gameobject)) {
                        priority = strategy.("doppelbotspriority");
                        assert(isstring(priority));
                        if (!isstring(priority)) {
                            continue;
                        }
                        foreach (var_128fdd23 in targets[priority]) {
                            if (var_128fdd23[#"type"] === "gameobject" && var_128fdd23[#"__unsafe__"][#"object"] == gameobject) {
                                var_128fdd23[#"claimed"] = 1;
                            }
                        }
                    }
                }
            }
        }
        if (getrealtime() - commander.strategizestarttime > commander.maxframetime) {
            aiprofile_endentry();
            pixendevent();
            [[ level.strategic_command_throttle ]]->waitinqueue(commander);
            commander.strategizestarttime = getrealtime();
            pixbeginevent("commanderReclaimTargets");
            aiprofile_beginentry("commanderReclaimTargets");
        }
        if (commander.cancel) {
            aiprofile_endentry();
            pixendevent();
            return;
        }
    }
    blackboard[#"targets"] = targets;
    aiprofile_endentry();
    pixendevent();
}

// Namespace plannercommander/planner_commander
// Params 1, eflags: 0x5 linked
// Checksum 0xf6204044, Offset: 0x3828
// Size: 0x7f4
function private function_60f42acc(commander) {
    pixbeginevent(#"commanderreclaimsquads");
    aiprofile_beginentry("commanderReclaimSquads");
    fitsquads = [];
    unfitsquads = [];
    for (index = 0; index < commander.squads.size; index++) {
        if (commander.squadsfitness[index] >= 0.3) {
            fitsquads[fitsquads.size] = commander.squads[index];
        } else {
            unfitsquads[unfitsquads.size] = commander.squads[index];
        }
        if (getrealtime() - commander.strategizestarttime > commander.maxframetime) {
            aiprofile_endentry();
            pixendevent();
            [[ level.strategic_command_throttle ]]->waitinqueue(commander);
            commander.strategizestarttime = getrealtime();
            pixbeginevent("commanderReclaimSquads");
            aiprofile_beginentry("commanderReclaimSquads");
        }
        if (commander.cancel) {
            aiprofile_endentry();
            pixendevent();
            return;
        }
    }
    commander.squadsfit = fitsquads;
    commander.var_6e4f62de = unfitsquads;
    fitbots = [];
    for (index = 0; index < fitsquads.size; index++) {
        botentries = plannersquadutility::getblackboardattribute(fitsquads[index], "doppelbots");
        foreach (botentry in botentries) {
            bot = botentry[#"__unsafe__"][#"bot"];
            if (strategiccommandutility::isvalidbot(bot)) {
                fitbots[bot getentitynumber()] = bot;
            }
        }
        if (getrealtime() - commander.strategizestarttime > commander.maxframetime) {
            aiprofile_endentry();
            pixendevent();
            [[ level.strategic_command_throttle ]]->waitinqueue(commander);
            commander.strategizestarttime = getrealtime();
            pixbeginevent("commanderReclaimSquads");
            aiprofile_beginentry("commanderReclaimSquads");
        }
        if (commander.cancel) {
            aiprofile_endentry();
            pixendevent();
            return;
        }
    }
    idlebots = [];
    doppelbots = blackboard::getstructblackboardattribute(commander, #"doppelbots");
    foreach (botentry in doppelbots) {
        bot = botentry[#"__unsafe__"][#"bot"];
        if (strategiccommandutility::isvalidbot(bot) && !isdefined(fitbots[bot getentitynumber()])) {
            idlebots[idlebots.size] = botentry;
        }
        if (getrealtime() - commander.strategizestarttime > commander.maxframetime) {
            aiprofile_endentry();
            pixendevent();
            [[ level.strategic_command_throttle ]]->waitinqueue(commander);
            commander.strategizestarttime = getrealtime();
            pixbeginevent("commanderReclaimSquads");
            aiprofile_beginentry("commanderReclaimSquads");
        }
        if (commander.cancel) {
            aiprofile_endentry();
            pixendevent();
            return;
        }
    }
    var_fa3efaa4 = blackboard::getstructblackboardattribute(commander, #"bot_vehicles");
    foreach (var_a6b55625 in var_fa3efaa4) {
        bot = var_a6b55625[#"__unsafe__"][#"bot"];
        if (strategiccommandutility::isvalidbot(bot) && !isdefined(fitbots[bot getentitynumber()])) {
            idlebots[idlebots.size] = var_a6b55625;
        }
        if (getrealtime() - commander.strategizestarttime > commander.maxframetime) {
            aiprofile_endentry();
            pixendevent();
            [[ level.strategic_command_throttle ]]->waitinqueue(commander);
            commander.strategizestarttime = getrealtime();
            pixbeginevent("commanderReclaimSquads");
            aiprofile_beginentry("commanderReclaimSquads");
        }
        if (commander.cancel) {
            aiprofile_endentry();
            pixendevent();
            return;
        }
    }
    blackboard::setstructblackboardattribute(commander, #"idle_doppelbots", idlebots);
    aiprofile_endentry();
    pixendevent();
}

// Namespace plannercommander/planner_commander
// Params 2, eflags: 0x5 linked
// Checksum 0xcd4b7c16, Offset: 0x4028
// Size: 0x3cc
function private function_d8b8afde(commander, &blackboard) {
    pixbeginevent(#"commandersorttargetlist");
    aiprofile_beginentry("commanderSortTargetList");
    priorities = array("escortbiped", "destroy", "capturearea", "defend", "goto", "gameobject");
    targets = blackboard[#"targets"];
    foreach (priority, var_5a60beef in targets) {
        sortedtargets = associativearray("gameobject", [], "goto", [], "escortbiped", [], "destroy", [], "defend", [], "capturearea", []);
        foreach (target in var_5a60beef) {
            size = sortedtargets[target[#"type"]].size;
            sortedtargets[target[#"type"]][size] = target;
        }
        combined = [];
        foreach (prioritykey in priorities) {
            combined = arraycombine(combined, sortedtargets[prioritykey], 0, 0);
        }
        targets[priority] = combined;
        if (getrealtime() - commander.strategizestarttime > commander.maxframetime) {
            aiprofile_endentry();
            pixendevent();
            [[ level.strategic_command_throttle ]]->waitinqueue(commander);
            commander.strategizestarttime = getrealtime();
            pixbeginevent("commanderSortTargetList");
            aiprofile_beginentry("commanderSortTargetList");
        }
        if (commander.cancel) {
            aiprofile_endentry();
            pixendevent();
            return;
        }
    }
    blackboard[#"targets"] = targets;
    aiprofile_endentry();
    pixendevent();
}

// Namespace plannercommander/planner_commander
// Params 1, eflags: 0x5 linked
// Checksum 0x85170689, Offset: 0x4400
// Size: 0x224
function private _strategize(commander) {
    assert(isdefined(commander));
    assert(isdefined(commander.planner));
    [[ level.strategic_command_throttle ]]->waitinqueue(commander);
    commander.cancel = 0;
    commander.lastupdatetime = gettime();
    commander.strategizestarttime = getrealtime();
    _evaluatesquads(commander);
    if (commander.cancel) {
        return;
    }
    function_60f42acc(commander);
    if (commander.cancel) {
        return;
    }
    if (blackboard::getstructblackboardattribute(commander, #"idle_doppelbots").size == 0) {
        _disbandsquads(commander);
        return;
    }
    blackboard = _cloneblackboard(commander);
    if (commander.cancel) {
        return;
    }
    function_12b9fafb(commander, blackboard);
    function_d8b8afde(commander, blackboard);
    function_ac4ff936(commander, blackboard);
    function_b1c3f0bd(commander, blackboard);
    if (commander.cancel) {
        return;
    }
    _plan(commander, blackboard);
    if (commander.cancel) {
        return;
    }
    _disbandsquads(commander);
    _createsquads(commander);
}

// Namespace plannercommander/planner_commander
// Params 1, eflags: 0x5 linked
// Checksum 0x1702e238, Offset: 0x4630
// Size: 0x1f4
function private _updateblackboarddaemons(commander) {
    assert(isdefined(commander));
    assert(isarray(commander.daemons));
    var_9ff7cf36 = spawnstruct();
    while (isdefined(commander) && !commander.shutdown) {
        if (commander.pause) {
            waitframe(1);
            continue;
        }
        [[ level.strategic_command_throttle ]]->waitinqueue(var_9ff7cf36);
        foreach (daemonjob in commander.daemons) {
            if (gettime() - daemonjob.lastupdatetime > daemonjob.updaterate) {
                [[ level.strategic_command_throttle ]]->waitinqueue(daemonjob);
                commander.var_22765a25 = getrealtime();
                pixbeginevent(daemonjob.daemonname);
                aiprofile_beginentry(daemonjob.daemonname);
                [[ daemonjob.func ]](commander);
                daemonjob.lastupdatetime = gettime();
                aiprofile_endentry();
                pixendevent();
            }
        }
    }
}

// Namespace plannercommander/planner_commander
// Params 1, eflags: 0x5 linked
// Checksum 0xb33042d3, Offset: 0x4830
// Size: 0x10c
function private _updateplanner(commander) {
    assert(isdefined(commander));
    while (isdefined(commander) && !commander.shutdown) {
        if (commander.pause) {
            _disbandallsquads(commander);
            waitframe(1);
            continue;
        }
        time = gettime();
        var_e1f110d9 = time - commander.lastupdatetime > commander.updaterate;
        if (var_e1f110d9 || function_f9d38682(commander) > 0) {
            _strategize(commander);
        }
        waitframe(1);
    }
    if (isdefined(commander)) {
        _disbandallsquads(commander);
    }
}

#namespace plannercommanderutility;

// Namespace plannercommanderutility/planner_commander
// Params 3, eflags: 0x1 linked
// Checksum 0x91eaf60e, Offset: 0x4948
// Size: 0x14e
function adddaemon(commander, daemonname, updaterate = float(function_60d95f53()) / 1000 * 10) {
    assert(isstruct(commander));
    assert(!isdefined(commander.daemons[daemonname]), "<unknown string>" + daemonname + "<unknown string>");
    daemonjob = spawnstruct();
    daemonjob.func = getdaemonapifunction(daemonname);
    daemonjob.daemonname = daemonname;
    daemonjob.lastupdatetime = 0;
    daemonjob.updaterate = updaterate * 1000;
    commander.daemons[daemonname] = daemonjob;
}

// Namespace plannercommanderutility/planner_commander
// Params 3, eflags: 0x1 linked
// Checksum 0x3b35a79, Offset: 0x4aa0
// Size: 0xc6
function addsquadevaluator(commander, evaluatorname, constants = []) {
    assert(isstruct(commander));
    assert(isstring(evaluatorname) || ishash(evaluatorname));
    commander.squadevaluators[commander.squadevaluators.size] = array(evaluatorname, constants);
}

// Namespace plannercommanderutility/planner_commander
// Params 7, eflags: 0x1 linked
// Checksum 0x5876719f, Offset: 0x4b70
// Size: 0x436
function createcommander(team, commanderplanner, squadplanner, commanderupdaterate = float(function_60d95f53()) / 1000 * 40, squadupdaterate = float(function_60d95f53()) / 1000 * 100, commandermaxframetime = 2, squadmaxplannerframetime = 2) {
    assert(isstruct(commanderplanner));
    assert(isstruct(squadplanner));
    assert(commandermaxframetime > 0);
    assert(squadmaxplannerframetime > 0);
    commander = spawnstruct();
    ai::createinterfaceforentity(commander);
    commander.archetype = hash("commander");
    commander.cancel = 0;
    commander.var_b9dd2f = commandermaxframetime;
    commander.var_22765a25 = getrealtime();
    commander.var_6365d720 = 0;
    commander.lastupdatetime = gettime();
    commander.maxframetime = commandermaxframetime;
    commander.pause = 0;
    commander.plan = [];
    commander.planfinishtime = gettime();
    commander.planstarttime = gettime();
    commander.planner = commanderplanner;
    commander.squads = [];
    commander.squadsfit = [];
    commander.squadsfitness = [];
    commander.var_6e4f62de = [];
    commander.shutdown = 0;
    commander.squadevaluators = [];
    commander.strategizestarttime = getrealtime();
    commander.updaterate = commanderupdaterate * 1000;
    commander.squadmaxplannerframetime = squadmaxplannerframetime;
    commander.squadplanner = squadplanner;
    commander.squadupdaterate = squadupdaterate;
    plannercommander::_initializeblackboard(commander, team);
    plannercommander::_initializedaemons(commander);
    plannercommander::_initializesquads(commander);
    /#
        commander thread plannercommander::_debugcommander(commander);
        commander thread plannercommander::function_9962ffd8(commander);
    #/
    commander thread plannercommander::_updateplanner(commander);
    if (!isdefined(level.var_b3d6ba87)) {
        level.var_b3d6ba87 = [];
    } else if (!isarray(level.var_b3d6ba87)) {
        level.var_b3d6ba87 = array(level.var_b3d6ba87);
    }
    level.var_b3d6ba87[level.var_b3d6ba87.size] = commander;
    return commander;
}

// Namespace plannercommanderutility/planner_commander
// Params 6, eflags: 0x0
// Checksum 0x30cdea09, Offset: 0x4fb0
// Size: 0x1ec
function initializeenemythrottle(commander, enemycommander, upperbound, lowerbound, totalgameobjects = undefined, totalgameobjectsenemy = undefined) {
    assert(isstruct(commander));
    assert(isstruct(enemycommander));
    assert(upperbound >= -1 && upperbound <= 1);
    assert(lowerbound >= -1 && lowerbound <= 1);
    assert(lowerbound <= upperbound);
    blackboard::setstructblackboardattribute(commander, #"allow_progress_throttling", 1);
    blackboard::setstructblackboardattribute(commander, #"throttling_enemy_commander", enemycommander);
    blackboard::setstructblackboardattribute(commander, #"throttling_lower_bound", lowerbound);
    blackboard::setstructblackboardattribute(commander, #"throttling_upper_bound", upperbound);
    blackboard::setstructblackboardattribute(commander, #"throttling_total_gameobjects", totalgameobjects);
    blackboard::setstructblackboardattribute(commander, #"throttling_total_gameobjects_enemy", totalgameobjectsenemy);
}

// Namespace plannercommanderutility/planner_commander
// Params 1, eflags: 0x1 linked
// Checksum 0xa5b50f0b, Offset: 0x51a8
// Size: 0xce
function getdaemonapifunction(functionname) {
    assert((isstring(functionname) || ishash(functionname)) && functionname != "<unknown string>", "<unknown string>");
    assert(isdefined(level._daemonscriptfunctions[#"api"][functionname]), "<unknown string>" + functionname + "<unknown string>");
    return level._daemonscriptfunctions[#"api"][functionname];
}

// Namespace plannercommanderutility/planner_commander
// Params 1, eflags: 0x1 linked
// Checksum 0xcfe75193, Offset: 0x5280
// Size: 0xce
function getutilityapifunction(functionname) {
    assert((isstring(functionname) || ishash(functionname)) && functionname != "<unknown string>", "<unknown string>");
    assert(isdefined(level._squadutilityscriptfunctions[#"api"][functionname]), "<unknown string>" + functionname + "<unknown string>");
    return level._squadutilityscriptfunctions[#"api"][functionname];
}

// Namespace plannercommanderutility/planner_commander
// Params 1, eflags: 0x1 linked
// Checksum 0xb726b0b3, Offset: 0x5358
// Size: 0xa2
function pausecommander(commander) {
    assert(isstruct(commander));
    if (!commander.pause) {
        /#
            team = blackboard::getstructblackboardattribute(commander, #"team");
            iprintlnbold("<unknown string>" + team + "<unknown string>");
        #/
        commander.pause = 1;
    }
}

// Namespace plannercommanderutility/planner_commander
// Params 2, eflags: 0x1 linked
// Checksum 0x5cd67b39, Offset: 0x5408
// Size: 0x134
function registerdaemonapi(functionname, functionptr) {
    assert((isstring(functionname) || ishash(functionname)) && functionname != "<unknown string>", "<unknown string>");
    assert(isfunctionptr(functionptr), "<unknown string>");
    plannercommander::_initializedaemonfunctions(#"api");
    assert(!isdefined(level._daemonscriptfunctions[#"api"][functionname]), "<unknown string>" + functionname + "<unknown string>");
    level._daemonscriptfunctions[#"api"][functionname] = functionptr;
}

// Namespace plannercommanderutility/planner_commander
// Params 2, eflags: 0x1 linked
// Checksum 0x69400c5d, Offset: 0x5548
// Size: 0x134
function registerutilityapi(functionname, functionptr) {
    assert((isstring(functionname) || ishash(functionname)) && functionname != "<unknown string>", "<unknown string>");
    assert(isfunctionptr(functionptr), "<unknown string>");
    plannercommander::_initializeutilityfunctions(#"api");
    assert(!isdefined(level._squadutilityscriptfunctions[#"api"][functionname]), "<unknown string>" + functionname + "<unknown string>");
    level._squadutilityscriptfunctions[#"api"][functionname] = functionptr;
}

// Namespace plannercommanderutility/planner_commander
// Params 1, eflags: 0x1 linked
// Checksum 0x22a27897, Offset: 0x5688
// Size: 0xb2
function function_2974807c(commander) {
    assert(isstruct(commander));
    if (commander.pause) {
        /#
            team = blackboard::getstructblackboardattribute(commander, #"team");
            iprintlnbold("<unknown string>" + function_9e72a96(team) + "<unknown string>");
        #/
        commander.pause = 0;
    }
}

// Namespace plannercommanderutility/planner_commander
// Params 4, eflags: 0x1 linked
// Checksum 0x7b447b58, Offset: 0x5748
// Size: 0x6c
function setforcegoalattribute(commander, attribute, oldvalue, value) {
    assert(isstruct(commander));
    blackboard::setstructblackboardattribute(commander, #"force_goal", value);
}

// Namespace plannercommanderutility/planner_commander
// Params 4, eflags: 0x1 linked
// Checksum 0xd3d38641, Offset: 0x57c0
// Size: 0x6c
function setgoldenpathattribute(commander, attribute, oldvalue, value) {
    assert(isstruct(commander));
    blackboard::setstructblackboardattribute(commander, #"allow_golden_path", value);
}

// Namespace plannercommanderutility/planner_commander
// Params 1, eflags: 0x0
// Checksum 0xa50b4542, Offset: 0x5838
// Size: 0x5c
function shutdowncommander(commander) {
    assert(isstruct(commander));
    commander.shutdown = 1;
    planner::cancel(commander.planner);
}

