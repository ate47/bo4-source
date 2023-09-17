// Atian COD Tools GSC decompiler test
#using scripts\mp_common\util.gsc;
#using scripts\mp_common\spawnbeacon.gsc;
#using scripts\mp_common\userspawnselection.gsc;
#using scripts\mp_common\player\player_utils.gsc;
#using scripts\mp_common\gametypes\round.gsc;
#using scripts\mp_common\gametypes\match.gsc;
#using scripts\mp_common\gametypes\hostmigration.gsc;
#using scripts\mp_common\gametypes\globallogic_utils.gsc;
#using scripts\mp_common\gametypes\globallogic_spawn.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using scripts\mp_common\gametypes\globallogic_audio.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\mp_common\gametypes\gametype.gsc;
#using scripts\mp_common\gametypes\ct_tutorial_skirmish.gsc;
#using scripts\mp_common\challenges.gsc;
#using scripts\mp_common\bb.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\sound_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\potm_shared.gsc;
#using scripts\core_common\popups_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\persistence_shared.gsc;
#using scripts\core_common\influencers_shared.gsc;
#using scripts\core_common\hostmigration_shared.gsc;
#using scripts\core_common\globallogic\globallogic_score.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\demo_shared.gsc;
#using scripts\core_common\contracts_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace dom;

// Namespace dom/gametype_init
// Params 1, eflags: 0x40
// Checksum 0x17ab16b7, Offset: 0x8e0
// Size: 0x6ce
function event_handler[gametype_init] main(eventstruct) {
    globallogic::init();
    util::registertimelimit(0, 1440);
    util::registerscorelimit(0, 2000);
    util::registerroundscorelimit(0, 2000);
    util::registerroundlimit(0, 10);
    util::registerroundwinlimit(0, 10);
    util::registerroundswitch(0, 9);
    util::registernumlives(0, 100);
    globallogic::registerfriendlyfiredelay(level.gametype, 15, 0, 1440);
    level.teamscoreperkill = getgametypesetting(#"teamscoreperkill");
    level.killstreaksgivegamescore = getgametypesetting(#"killstreaksgivegamescore");
    level.scoreroundwinbased = getgametypesetting(#"cumulativeroundscores") == 0;
    level.overrideteamscore = 1;
    level.var_f5a73a96 = 1;
    level.onstartgametype = &onstartgametype;
    player::function_cf3aa03d(&onplayerkilled);
    player::function_3c5cc656(&function_610d3790);
    level.onroundswitch = &on_round_switch;
    level.onendround = &onendround;
    level.var_cdb8ae2c = &function_a8da260c;
    globallogic_spawn::addsupportedspawnpointtype("dom");
    globallogic_audio::set_leader_gametype_dialog("startDomination", "hcStartDomination", "objCapture", "objCapture", "bbStartDomination", "hcbbStartDomination");
    game.dialog[#"securing_a"] = "domFriendlySecuringA";
    game.dialog[#"securing_b"] = "domFriendlySecuringB";
    game.dialog[#"securing_c"] = "domFriendlySecuringC";
    game.dialog[#"secured_a"] = "domFriendlySecuredA";
    game.dialog[#"secured_b"] = "domFriendlySecuredB";
    game.dialog[#"secured_c"] = "domFriendlySecuredC";
    game.dialog[#"secured_all"] = "domFriendlySecuredAll";
    game.dialog[#"losing_a"] = "domEnemySecuringA";
    game.dialog[#"losing_b"] = "domEnemySecuringB";
    game.dialog[#"losing_c"] = "domEnemySecuringC";
    game.dialog[#"lost_a"] = "domEnemySecuredA";
    game.dialog[#"lost_b"] = "domEnemySecuredB";
    game.dialog[#"lost_c"] = "domEnemySecuredC";
    game.dialog[#"lost_all"] = "domEnemySecuredAll";
    game.dialog[#"enemy_a"] = "domEnemyHasA";
    game.dialog[#"enemy_b"] = "domEnemyHasB";
    game.dialog[#"enemy_c"] = "domEnemyHasC";
    game.dialogtime = [];
    game.dialogtime[#"securing_a"] = 0;
    game.dialogtime[#"securing_b"] = 0;
    game.dialogtime[#"securing_c"] = 0;
    game.dialogtime[#"losing_a"] = 0;
    game.dialogtime[#"losing_b"] = 0;
    game.dialogtime[#"losing_c"] = 0;
    level.var_e6979a05 = [];
    level.var_e6979a05[#"_a"] = "dom_flag_a";
    level.var_e6979a05[#"_b"] = "dom_flag_b";
    level.var_e6979a05[#"_c"] = "dom_flag_c";
    if (util::function_8570168d()) {
        ct_tutorial_skirmish::init();
    }
    level.var_1aef539f = &function_a800815;
    level.var_d3a438fb = &function_d3a438fb;
}

// Namespace dom/dom
// Params 0, eflags: 0x1 linked
// Checksum 0x361cd092, Offset: 0xfb8
// Size: 0x5e
function function_58306805() {
    label = self gameobjects::get_label();
    if (label == "_a") {
        return "spl4";
    } else if (label == "_c") {
        return "spl5";
    }
    return undefined;
}

// Namespace dom/dom
// Params 0, eflags: 0x1 linked
// Checksum 0xb21c798d, Offset: 0x1020
// Size: 0xb8
function function_eac6cecb() {
    foreach (team, _ in level.teams) {
        spawnteam = util::function_6f4ff113(team);
        spawning::add_start_spawn_points(spawnteam, "mp_dom_spawn_" + team + "_start");
    }
}

// Namespace dom/dom
// Params 0, eflags: 0x1 linked
// Checksum 0x946ebfda, Offset: 0x10e0
// Size: 0x66
function function_a8da260c() {
    spawning::place_spawn_points("mp_dom_spawn_allies_start");
    spawning::place_spawn_points("mp_dom_spawn_axis_start");
    function_eac6cecb();
    level.spawn_all = spawning::get_spawnpoint_array("mp_dom_spawn");
}

// Namespace dom/dom
// Params 0, eflags: 0x1 linked
// Checksum 0xefe111cc, Offset: 0x1150
// Size: 0xfc
function onstartgametype() {
    level.flagbasefxid = [];
    level.startpos[#"allies"] = level.spawn_start[#"allies"][0].origin;
    level.startpos[#"axis"] = level.spawn_start[#"axis"][0].origin;
    level.b_allow_vehicle_proximity_pickup = 1;
    level thread watchforbflagcap();
    updategametypedvars();
    thread domflags();
    thread updatedomscores();
    function_de560341();
}

// Namespace dom/dom
// Params 0, eflags: 0x1 linked
// Checksum 0xe34f4a54, Offset: 0x1258
// Size: 0x3cc
function function_de560341() {
    globallogic_spawn::function_c40af6fa();
    globallogic_spawn::addsupportedspawnpointtype("dom");
    globallogic_spawn::addspawns();
    var_273a84a9 = [];
    if (!isdefined(var_273a84a9)) {
        var_273a84a9 = [];
    } else if (!isarray(var_273a84a9)) {
        var_273a84a9 = array(var_273a84a9);
    }
    var_273a84a9[var_273a84a9.size] = "dom_flag_a";
    if (!isdefined(var_273a84a9)) {
        var_273a84a9 = [];
    } else if (!isarray(var_273a84a9)) {
        var_273a84a9 = array(var_273a84a9);
    }
    var_273a84a9[var_273a84a9.size] = "dom_flag_c";
    flagspawns = globallogic_spawn::function_d400d613(#"mp_t8_spawn_point", var_273a84a9);
    foreach (var_de435199 in flagspawns) {
        foreach (spawn in var_de435199) {
            if (!isdefined(level.spawnpoints)) {
                level.spawnpoints = [];
            } else if (!isarray(level.spawnpoints)) {
                level.spawnpoints = array(level.spawnpoints);
            }
            level.spawnpoints[level.spawnpoints.size] = spawn;
            if (!isdefined(spawn.enabled)) {
                spawn.enabled = -1;
            }
        }
    }
    if (isdefined(flagspawns)) {
        if (isdefined(flagspawns[#"dom_flag_a"])) {
            addspawnpoints(#"allies", flagspawns[#"dom_flag_a"], "spl4");
            addspawnpoints(#"axis", flagspawns[#"dom_flag_a"], "spl4");
        }
        if (isdefined(flagspawns[#"dom_flag_c"])) {
            addspawnpoints(#"allies", flagspawns[#"dom_flag_c"], "spl5");
            addspawnpoints(#"axis", flagspawns[#"dom_flag_c"], "spl5");
        }
    }
    spawning::add_default_spawnlist("spl4");
    spawning::add_default_spawnlist("spl5");
}

// Namespace dom/dom
// Params 1, eflags: 0x1 linked
// Checksum 0x5132b5f, Offset: 0x1630
// Size: 0x11c
function onendround(var_c1e98979) {
    for (i = 0; i < level.domflags.size; i++) {
        domflag = level.domflags[i];
        if (isdefined(domflag.singleowner) && domflag.singleowner == 1) {
            team = domflag gameobjects::get_owner_team();
            label = domflag gameobjects::get_label();
            challenges::holdflagentirematch(team, label);
        }
        if (isdefined(domflag.var_56d394cd)) {
            domflag.var_249009fd[domflag.var_249009fd.size] = gettime() - domflag.var_56d394cd;
        }
    }
    function_1609a882(var_c1e98979);
}

// Namespace dom/dom
// Params 0, eflags: 0x1 linked
// Checksum 0xa800f2af, Offset: 0x1758
// Size: 0x19a
function setup_zone_exclusions() {
    if (!isdefined(level.var_bf5fec71)) {
        return;
    }
    foreach (nullzone in level.var_bf5fec71) {
        mindist = 1410065408;
        foundzone = undefined;
        foreach (flag in level.flags) {
            distance = distancesquared(nullzone.origin, flag.origin);
            if (distance < mindist) {
                foundzone = flag;
                mindist = distance;
            }
        }
        if (isdefined(foundzone) && foundzone == self.trigger) {
            if (!isdefined(self.exclusions)) {
                self.exclusions = [];
            }
            self.exclusions[self.exclusions.size] = nullzone;
        }
    }
}

// Namespace dom/dom
// Params 0, eflags: 0x1 linked
// Checksum 0xa02f473f, Offset: 0x1900
// Size: 0x1fa
function updategametypedvars() {
    level.flagcapturetime = getgametypesetting(#"capturetime");
    level.playercapturelpm = getgametypesetting(#"maxplayereventsperminute");
    level.flagcapturelpm = getgametypesetting(#"maxobjectiveeventsperminute");
    level.playeroffensivemax = getgametypesetting(#"maxplayeroffensive");
    level.playerdefensivemax = getgametypesetting(#"maxplayerdefensive");
    level.flagcanbeneutralized = getgametypesetting(#"flagcanbeneutralized");
    level.decayprogress = isdefined(getgametypesetting(#"decayprogress")) ? getgametypesetting(#"decayprogress") : 0;
    level.autodecaytime = isdefined(getgametypesetting(#"autodecaytime")) ? getgametypesetting(#"autodecaytime") : undefined;
    level.flagcapturerateincrease = isdefined(getgametypesetting(#"flagcapturerateincrease")) ? getgametypesetting(#"flagcapturerateincrease") : 0;
}

// Namespace dom/dom
// Params 0, eflags: 0x1 linked
// Checksum 0x2e17cd4e, Offset: 0x1b08
// Size: 0x9e4
function domflags() {
    level.laststatus[#"allies"] = 0;
    level.laststatus[#"axis"] = 0;
    level.flagmodel[#"allies"] = "tag_origin";
    level.flagmodel[#"axis"] = "tag_origin";
    level.flagmodel[#"neutral"] = "tag_origin";
    primaryflags = getentarray("flag_primary", "targetname");
    if (primaryflags.size < 2) {
        /#
            println("");
        #/
        callback::abort_level();
        return;
    }
    level.flags = [];
    foreach (dom_flag in primaryflags) {
        if (isdefined(dom_flag.target)) {
            trigger = getent(dom_flag.target, "targetname");
            trigger trigger::function_1792c799(16);
            if (isdefined(trigger)) {
                trigger.visual = dom_flag;
                trigger.script_label = dom_flag.script_label;
                spawn_beacon::function_18f38647(trigger);
            } else {
                /#
                    util::error("<unknown string>" + dom_flag.script_label + "<unknown string>" + dom_flag.target);
                #/
            }
        } else {
            /#
                util::error("<unknown string>" + dom_flag.script_label);
            #/
        }
        if (trigger.script_label == "_a") {
            level.flags[0] = trigger;
        } else if (trigger.script_label == "_b") {
            level.flags[1] = trigger;
        } else if (trigger.script_label == "_c") {
            level.flags[2] = trigger;
        } else {
            /#
                util::error("<unknown string>" + trigger.script_label);
            #/
        }
    }
    level.domflags = [];
    for (fi = 0; fi < level.flags.size; fi++) {
        trigger = level.flags[fi];
        trigger.visual setmodel(level.flagmodel[#"neutral"]);
        name = #"dom" + trigger.visual.script_label;
        visuals = [];
        visuals[0] = trigger.visual;
        domflag = gameobjects::create_use_object(#"neutral", trigger, visuals, (0, 0, 0), name);
        domflag gameobjects::allow_use(#"enemy");
        if (level.flagcanbeneutralized) {
            domflag gameobjects::set_use_time(level.flagcapturetime / 2);
        } else {
            domflag gameobjects::set_use_time(level.flagcapturetime);
        }
        domflag gameobjects::set_use_text(#"mp/capturing_flag");
        label = domflag gameobjects::get_label();
        domflag.label = label;
        domflag.flagindex = trigger.visual.script_index;
        domflag gameobjects::set_visible_team(#"any");
        domflag.onuse = &onuse;
        domflag.onbeginuse = &onbeginuse;
        domflag.onuseupdate = &onuseupdate;
        domflag.onenduse = &onenduse;
        domflag.onupdateuserate = &onupdateuserate;
        domflag.ondecaycomplete = &ondecaycomplete;
        domflag.hasbeencaptured = 0;
        domflag.var_a0ff5eb8 = !level.flagcapturerateincrease;
        domflag.decayprogress = level.decayprogress;
        domflag.autodecaytime = level.autodecaytime;
        domflag.currentlyunoccupied = 1;
        domflag.ontouchuse = &on_touch_use;
        if (domflag.decayprogress) {
            domflag gameobjects::must_maintain_claim(0);
            if (level.flagcanbeneutralized) {
                domflag gameobjects::set_decay_time(level.flagcapturetime / 2);
            } else {
                domflag gameobjects::set_decay_time(level.flagcapturetime);
            }
        }
        domflag gameobjects::set_objective_entity(visuals[0]);
        domflag gameobjects::set_owner_team(#"neutral");
        tracestart = visuals[0].origin + vectorscale((0, 0, 1), 32);
        traceend = visuals[0].origin + vectorscale((0, 0, -1), 32);
        trace = bullettrace(tracestart, traceend, 0, undefined);
        upangles = vectortoangles(trace[#"normal"]);
        domflag.baseeffectforward = anglestoforward(upangles);
        domflag.baseeffectright = anglestoright(upangles);
        domflag.baseeffectpos = trace[#"position"];
        trigger.useobj = domflag;
        trigger.adjflags = [];
        trigger.nearbyspawns = [];
        domflag.levelflag = trigger;
        domflag.var_249009fd = [];
        domflag setup_zone_exclusions();
        level.domflags[level.domflags.size] = domflag;
    }
    level.bestspawnflag = [];
    level.bestspawnflag[#"allies"] = getunownedflagneareststart(#"allies", undefined);
    level.bestspawnflag[#"axis"] = getunownedflagneareststart(#"axis", level.bestspawnflag[#"allies"]);
    for (index = 0; index < level.domflags.size; index++) {
        level.domflags[index] createflagspawninfluencers();
    }
    flagsetup();
    /#
        thread domdebug();
    #/
}

// Namespace dom/dom
// Params 2, eflags: 0x1 linked
// Checksum 0xaf68ae67, Offset: 0x24f8
// Size: 0x122
function getunownedflagneareststart(team, excludeflag) {
    best = undefined;
    bestdistsq = undefined;
    for (i = 0; i < level.flags.size; i++) {
        flag = level.flags[i];
        if (flag getflagteam() != #"neutral") {
            continue;
        }
        distsq = distancesquared(flag.origin, level.startpos[team]);
        if ((!isdefined(excludeflag) || flag != excludeflag) && (!isdefined(best) || distsq < bestdistsq)) {
            bestdistsq = distsq;
            best = flag;
        }
    }
    return best;
}

// Namespace dom/dom
// Params 0, eflags: 0x0
// Checksum 0x51bd0fec, Offset: 0x2628
// Size: 0x274
function domdebug() {
    /#
        while (1) {
            if (getdvarint(#"scr_domdebug", 0) != 1) {
                wait(2);
                continue;
            }
            while (1) {
                if (getdvarint(#"scr_domdebug", 0) != 1) {
                    break;
                }
                for (i = 0; i < level.flags.size; i++) {
                    for (j = 0; j < level.flags[i].adjflags.size; j++) {
                        line(level.flags[i].origin, level.flags[i].adjflags[j].origin, (1, 1, 1));
                    }
                    for (j = 0; j < level.flags[i].nearbyspawns.size; j++) {
                        line(level.flags[i].origin, level.flags[i].nearbyspawns[j].origin, (0.2, 0.2, 0.6));
                    }
                    if (level.flags[i] == level.bestspawnflag[#"allies"]) {
                        print3d(level.flags[i].origin, "<unknown string>");
                    }
                    if (level.flags[i] == level.bestspawnflag[#"axis"]) {
                        print3d(level.flags[i].origin, "<unknown string>");
                    }
                }
                waitframe(1);
            }
        }
    #/
}

// Namespace dom/dom
// Params 1, eflags: 0x1 linked
// Checksum 0x2488af0a, Offset: 0x28a8
// Size: 0xf6
function onbeginuse(sentient) {
    ownerteam = self gameobjects::get_owner_team();
    self.didstatusnotify = 0;
    if (ownerteam == #"allies") {
        otherteam = #"axis";
    } else {
        otherteam = #"allies";
    }
    if (ownerteam == #"neutral") {
        otherteam = util::getotherteam(sentient.team);
        statusdialog("securing" + self.label, sentient.team, "objective" + self.label);
        return;
    }
}

// Namespace dom/dom
// Params 3, eflags: 0x1 linked
// Checksum 0x60baab55, Offset: 0x29a8
// Size: 0x2d2
function onuseupdate(team, progress, change) {
    if (change > 0) {
        self gameobjects::set_flags(team == "allies" ? 1 : 2);
    }
    if (progress > 0.05 && change && !self.didstatusnotify) {
        ownerteam = self gameobjects::get_owner_team();
        if (ownerteam == #"neutral") {
            otherteam = util::getotherteam(team);
            statusdialog("securing" + self.label, team, "objective" + self.label);
        } else {
            statusdialog("losing" + self.label, ownerteam, "objective" + self.label);
            statusdialog("securing" + self.label, team, "objective" + self.label);
            globallogic_audio::flush_objective_dialog("objective_all");
        }
        self.didstatusnotify = 1;
    }
    if (change > 0 && self.currentlyunoccupied) {
        self.currentlyunoccupied = 0;
        players = getplayers();
        foreach (player in players) {
            if (player.team == team) {
                player playsoundtoplayer(#"hash_3cca41b3702f764a", player);
            } else {
                player playsoundtoplayer(#"hash_2bb2a0ec776ba8f7", player);
            }
        }
    } else if (change == 0 && !self.currentlyunoccupied) {
        self.currentlyunoccupied = 1;
    }
}

// Namespace dom/dom
// Params 0, eflags: 0x1 linked
// Checksum 0xd838fc23, Offset: 0x2c88
// Size: 0x140
function ondecaycomplete() {
    team = self.ownerteam;
    enemyteam = util::get_enemy_team(team);
    if (self.touchlist[enemyteam].size == 0 && self.touchlist[team].size > 0) {
        self.var_670f7a7f = 1;
        foreach (st in self.touchlist[team]) {
            player_from_touchlist = gameobjects::function_73944efe(self.touchlist[team], st);
            if (!isdefined(player_from_touchlist)) {
                continue;
            }
            scoreevents::processscoreevent(#"hash_7edabe01ed05afa3", player_from_touchlist, undefined, undefined);
        }
    }
}

// Namespace dom/dom
// Params 0, eflags: 0x1 linked
// Checksum 0x602b6092, Offset: 0x2dd0
// Size: 0x4c
function flushobjectiveflagdialog() {
    globallogic_audio::flush_objective_dialog("objective_a");
    globallogic_audio::flush_objective_dialog("objective_b");
    globallogic_audio::flush_objective_dialog("objective_c");
}

// Namespace dom/dom
// Params 3, eflags: 0x1 linked
// Checksum 0x53891ba3, Offset: 0x2e28
// Size: 0xe4
function statusdialog(dialog, team, objectivekey) {
    dialogtime = game.dialogtime[dialog];
    if (isdefined(dialogtime)) {
        time = gettime();
        if (dialogtime > time) {
            return;
        }
        game.dialogtime[dialog] = time + 10000;
    }
    dialogkey = game.dialog[dialog];
    if (isdefined(objectivekey)) {
        if (objectivekey != "objective_all") {
            dialogbufferkey = "domPointDialogBuffer";
        }
    }
    globallogic_audio::leader_dialog(dialogkey, team, undefined, objectivekey, undefined, dialogbufferkey);
}

// Namespace dom/dom
// Params 3, eflags: 0x1 linked
// Checksum 0x8d1efbea, Offset: 0x2f18
// Size: 0x5a
function onenduse(team, player, success) {
    if (!success) {
        globallogic_audio::flush_objective_dialog("objective" + self.label);
    }
    self.currentlyunoccupied = 1;
}

// Namespace dom/dom
// Params 1, eflags: 0x1 linked
// Checksum 0x8e27a494, Offset: 0x2f80
// Size: 0x1e4
function flagcapturedfromneutral(team) {
    self.singleowner = 1;
    otherteam = util::getotherteam(team);
    thread util::printandsoundoneveryone(team, undefined, #"", undefined, "mp_war_objective_taken");
    thread sound::play_on_players("mus_dom_captured" + "_" + level.teampostfix[team]);
    if (getteamflagcount(team) == level.flags.size) {
        statusdialog("secured_all", team, "objective_all");
        statusdialog("lost_all", otherteam, "objective_all");
        flushobjectiveflagdialog();
    } else {
        statusdialog("secured" + self.label, team, "objective" + self.label);
        statusdialog(#"enemy" + self.label, otherteam, "objective" + self.label);
        globallogic_audio::flush_objective_dialog("objective_all");
    }
    globallogic_audio::play_2d_on_team("mpl_flagcapture_sting_enemy", otherteam);
    globallogic_audio::play_2d_on_team("mpl_flagcapture_sting_friend", team);
}

// Namespace dom/dom
// Params 2, eflags: 0x1 linked
// Checksum 0x5c772e63, Offset: 0x3170
// Size: 0x21e
function flagcapturedfromteam(team, oldteam) {
    self.singleowner = 0;
    thread util::printandsoundoneveryone(team, oldteam, #"", #"", "mp_war_objective_taken", "mp_war_objective_lost", "");
    if (getteamflagcount(team) == level.flags.size) {
        statusdialog("secured_all", team, "objective_all");
        statusdialog("lost_all", oldteam, "objective_all");
        flushobjectiveflagdialog();
    } else {
        statusdialog("secured" + self.label, team, "objective" + self.label);
        if (randomint(2)) {
            statusdialog("lost" + self.label, oldteam, "objective" + self.label);
        } else {
            statusdialog(#"enemy" + self.label, oldteam, "objective" + self.label);
        }
        globallogic_audio::flush_objective_dialog("objective_all");
        globallogic_audio::play_2d_on_team("mpl_flagcapture_sting_enemy", oldteam);
        globallogic_audio::play_2d_on_team("mpl_flagcapture_sting_friend", team);
    }
    level.bestspawnflag[oldteam] = self.levelflag;
}

// Namespace dom/dom
// Params 2, eflags: 0x1 linked
// Checksum 0xc655c6d9, Offset: 0x3398
// Size: 0x144
function flagneutralized(team, oldteam) {
    self.singleowner = 1;
    thread util::printandsoundoneveryone(#"neutral", oldteam, #"", #"", "mp_war_objective_neutralized", "mp_war_objective_lost", "");
    if (getteamflagcount(team) == level.flags.size) {
        statusdialog("lost_all", oldteam, "objective_all");
        flushobjectiveflagdialog();
    } else {
        statusdialog("lost" + self.label, oldteam, "objective" + self.label);
        globallogic_audio::flush_objective_dialog("objective_all");
        globallogic_audio::play_2d_on_team("mpl_flagcapture_sting_enemy", oldteam);
    }
}

// Namespace dom/dom
// Params 2, eflags: 0x1 linked
// Checksum 0xbb7355fc, Offset: 0x34e8
// Size: 0x226
function getdomflagusestring(label, neutralized) {
    string = #"";
    if (neutralized) {
        switch (label) {
        case #"_a":
            string = #"hash_3ff1c88b4360ea84";
            break;
        case #"_b":
            string = #"hash_dd6191acefd6847";
            break;
        case #"_c":
            string = #"hash_25a2a0aff40c76aa";
            break;
        case #"_d":
            string = #"hash_2bcd7171f9aae4a5";
            break;
        case #"_e":
            string = #"hash_5334d65b46b55660";
            break;
        default:
            break;
        }
    } else {
        switch (label) {
        case #"_a":
            string = #"hash_5b47de31c97a49ff";
            break;
        case #"_b":
            string = #"hash_481e5e34f798331e";
            break;
        case #"_c":
            string = #"hash_6a0c2383d37849bd";
            break;
        case #"_d":
            string = #"hash_5079687d6a87790c";
            break;
        case #"_e":
            string = #"hash_78e2a90cf85daa3b";
            break;
        default:
            break;
        }
    }
    return string;
}

// Namespace dom/dom
// Params 1, eflags: 0x1 linked
// Checksum 0x74a7dce5, Offset: 0x3718
// Size: 0x454
function onusewithneutralizingflag(sentient) {
    team = sentient.team;
    oldteam = self gameobjects::get_owner_team();
    label = self gameobjects::get_label();
    /#
        print("<unknown string>" + self.label);
    #/
    level.usestartspawns = 0;
    /#
        assert(team != #"neutral");
    #/
    string = #"";
    if (oldteam == #"neutral") {
        level notify(#"flag_captured");
        string = getdomflagusestring(label, 0);
        level.bestspawnflag[oldteam] = self.levelflag;
        self gameobjects::set_owner_team(team);
        self.visuals[0] setmodel(level.flagmodel[team]);
        self update_spawn_influencers(team);
        self flagcapturedfromneutral(team);
    } else {
        level notify(#"flag_neutralized");
        string = getdomflagusestring(label, 1);
        self gameobjects::set_owner_team(#"neutral");
        self.visuals[0] setmodel(level.flagmodel[#"neutral"]);
        self update_spawn_influencers(#"neutral");
        self flagneutralized(team, oldteam);
    }
    /#
        assert(string != #"");
    #/
    touchlist = arraycopy(self.touchlist[team]);
    isbflag = 0;
    if (label == "_b") {
        isbflag = 1;
    }
    if (oldteam == #"neutral") {
        if (isdefined(getgametypesetting(#"contributioncapture")) && getgametypesetting(#"contributioncapture")) {
            var_1dbb2b2b = arraycopy(self.var_1dbb2b2b[team]);
            self thread function_ef09febd(var_1dbb2b2b, touchlist, string, oldteam, isbflag, 0);
        } else {
            thread give_capture_credit(touchlist, string, oldteam, isbflag, 1);
        }
    } else {
        thread give_neutralized_credit(touchlist, string, oldteam, isbflag);
    }
    bb::function_95a5b5c2("dom_capture", label, team, sentient.origin);
    if (dominated_challenge_check()) {
        level thread totaldomination(team);
    }
}

// Namespace dom/dom
// Params 1, eflags: 0x1 linked
// Checksum 0xced43ec3, Offset: 0x3b78
// Size: 0x3c4
function onusewithoutneutralizingflag(sentient) {
    level notify(#"flag_captured");
    team = sentient.team;
    oldteam = self gameobjects::get_owner_team();
    label = self gameobjects::get_label();
    /#
        print("<unknown string>" + self.label);
    #/
    self gameobjects::set_owner_team(team);
    self.visuals[0] setmodel(level.flagmodel[team]);
    level.usestartspawns = 0;
    /#
        assert(team != #"neutral");
    #/
    isbflag = 0;
    if (label == "_b") {
        isbflag = 1;
    }
    string = getdomflagusestring(label, 0);
    /#
        assert(string != #"");
    #/
    if (isdefined(getgametypesetting(#"contributioncapture")) && getgametypesetting(#"contributioncapture")) {
        var_1dbb2b2b = arraycopy(self.var_1dbb2b2b[team]);
        var_6d7ae157 = arraycopy(self.touchlist[team]);
        self thread function_ef09febd(var_1dbb2b2b, var_6d7ae157, string, oldteam, isbflag, 0);
    } else {
        touchlist = arraycopy(self.touchlist[team]);
        thread give_capture_credit(touchlist, string, oldteam, isbflag, 0);
    }
    bb::function_95a5b5c2("dom_capture", undefined, team, sentient.origin);
    if (oldteam == #"neutral") {
        self flagcapturedfromneutral(team);
        self.var_9dcc8b07 = gettime();
        self.var_a248f0a8 = 1;
        self.var_56d394cd = gettime();
    } else {
        self flagcapturedfromteam(team, oldteam);
        self.var_249009fd[self.var_249009fd.size] = gettime() - self.var_56d394cd;
        self.var_56d394cd = gettime();
        self.var_a248f0a8++;
    }
    if (dominated_challenge_check()) {
        level thread totaldomination(team);
        util::function_5a68c330(25, team);
    }
    self update_spawn_influencers(team);
}

// Namespace dom/dom
// Params 1, eflags: 0x1 linked
// Checksum 0x2afaa392, Offset: 0x3f48
// Size: 0xbc
function onuse(sentient) {
    if (level.flagcanbeneutralized) {
        self onusewithneutralizingflag(sentient);
    } else {
        self onusewithoutneutralizingflag(sentient);
    }
    var_2989dcef = 3;
    if (self.label == "_a") {
        var_2989dcef = 1;
    } else if (self.label == "_b") {
        var_2989dcef = 2;
    }
    util::function_5a68c330(20, sentient.team, -1, var_2989dcef);
}

// Namespace dom/dom
// Params 1, eflags: 0x1 linked
// Checksum 0x3fef3e3, Offset: 0x4010
// Size: 0x4c
function totaldomination(team) {
    level endon(#"flag_captured", #"game_ended");
    wait(180);
    challenges::totaldomination(team);
}

// Namespace dom/dom
// Params 0, eflags: 0x1 linked
// Checksum 0x17b51c8f, Offset: 0x4068
// Size: 0x90
function watchforbflagcap() {
    level endon(#"game_ended", #"endwatchforbflagcapaftertime");
    level thread endwatchforbflagcapaftertime(60);
    for (;;) {
        waitresult = undefined;
        waitresult = level waittill(#"b_flag_captured");
        waitresult.player challenges::capturedbfirstminute();
    }
}

// Namespace dom/dom
// Params 1, eflags: 0x1 linked
// Checksum 0x169bb298, Offset: 0x4100
// Size: 0x40
function endwatchforbflagcapaftertime(time) {
    level endon(#"game_ended");
    wait(60);
    level notify(#"endwatchforbflagcapaftertime");
}

// Namespace dom/dom
// Params 6, eflags: 0x1 linked
// Checksum 0x1bed7ac9, Offset: 0x4148
// Size: 0x3a4
function function_ef09febd(var_1dbb2b2b, var_6d7ae157, string, lastownerteam, isbflag, neutralizing) {
    time = gettime();
    waitframe(1);
    util::waittillslowprocessallowed();
    self updatecapsperminute(lastownerteam);
    var_b4613aa2 = [];
    earliestplayer = undefined;
    foreach (contribution in var_1dbb2b2b) {
        if (isdefined(contribution)) {
            contributor = contribution.player;
            if (isdefined(contributor) && isdefined(contribution.contribution)) {
                percentage = 100 * contribution.contribution / self.usetime;
                contributor.var_759a143b = int(0.5 + percentage);
                contributor.var_1aea8209 = contribution.starttime;
                if (percentage < getgametypesetting(#"contributionmin")) {
                    continue;
                }
                if (contribution.var_e22ea52b && (!isdefined(earliestplayer) || contributor.var_1aea8209 < earliestplayer.var_1aea8209)) {
                    earliestplayer = contributor;
                }
                if (!isdefined(var_b4613aa2)) {
                    var_b4613aa2 = [];
                } else if (!isarray(var_b4613aa2)) {
                    var_b4613aa2 = array(var_b4613aa2);
                }
                var_b4613aa2[var_b4613aa2.size] = contributor;
            }
        }
    }
    foreach (player in var_b4613aa2) {
        var_a84f97bf = earliestplayer === player;
        var_af8f6146 = 0;
        foreach (touch in var_6d7ae157) {
            if (!isdefined(touch)) {
                continue;
            }
            if (touch.player === player) {
                var_af8f6146 = 1;
                break;
            }
        }
        function_5a9598f0(player, string, lastownerteam, isbflag, neutralizing, time, var_a84f97bf, var_af8f6146);
    }
    self gameobjects::function_98aae7cf();
}

// Namespace dom/dom
// Params 5, eflags: 0x1 linked
// Checksum 0x254a469d, Offset: 0x44f8
// Size: 0x128
function give_capture_credit(touchlist, string, lastownerteam, isbflag, neutralizing) {
    time = gettime();
    waitframe(1);
    util::waittillslowprocessallowed();
    self updatecapsperminute(lastownerteam);
    foreach (touch in touchlist) {
        player_from_touchlist = gameobjects::function_73944efe(touchlist, touch);
        if (!isdefined(player_from_touchlist)) {
            continue;
        }
        function_5a9598f0(player_from_touchlist, string, lastownerteam, isbflag, neutralizing, time, 0, 1);
    }
}

// Namespace dom/dom
// Params 8, eflags: 0x1 linked
// Checksum 0x31a21eec, Offset: 0x4628
// Size: 0x4b4
function function_5a9598f0(player, string, lastownerteam, isbflag, neutralizing, time, var_a84f97bf, var_af8f6146) {
    player updatecapsperminute(lastownerteam);
    if (!isscoreboosting(player, self)) {
        player challenges::capturedobjective(time, self.levelflag);
        if (lastownerteam == #"neutral" && neutralizing && isdefined(self.hasbeencaptured) && self.hasbeencaptured) {
            scoreevents::processscoreevent(#"dom_point_secured_neutralizing", player, level.weaponnone, undefined);
        } else if (lastownerteam == #"neutral") {
            if (isbflag) {
                scoreevents::processscoreevent(#"neutral_b_secured", player, level.weaponnone, undefined);
                player stats::function_dad108fa(#"hash_60545a50ce7c9791", 1);
            } else {
                scoreevents::processscoreevent(#"dom_point_neutral_secured", player, level.weaponnone, undefined);
            }
        } else {
            scoreevents::processscoreevent(#"dom_point_secured", player, level.weaponnone, undefined);
        }
        self.hasbeencaptured = 1;
        player recordgameevent("capture");
        if (isbflag) {
            level notify(#"b_flag_captured", {#player:player});
        }
        if (isdefined(player.pers[#"captures"])) {
            player.pers[#"captures"]++;
            player.captures = player.pers[#"captures"];
        }
        player.pers[#"objectives"]++;
        player.objectives = player.pers[#"objectives"];
        demo::bookmark(#"event", gettime(), player);
        potm::bookmark(#"event", gettime(), player);
        player stats::function_bb7eedf0(#"captures", 1);
        player globallogic_score::incpersstat(#"objectivescore", 1, 0, 1);
        if (isdefined(getgametypesetting(#"contributioncapture")) && getgametypesetting(#"contributioncapture")) {
            player luinotifyevent(#"waypoint_captured", 2, self.var_f23c87bd, player.var_759a143b);
            player.var_759a143b = undefined;
        }
        if (var_af8f6146) {
            player stats::function_dad108fa(#"captures_in_capture_area", 1);
            player contracts::increment_contract(#"hash_4fa0008b60deaab4");
        }
    } else {
        /#
            player iprintlnbold("<unknown string>");
        #/
    }
    if (var_a84f97bf) {
        level thread popups::displayteammessagetoall(string, player);
    }
}

// Namespace dom/dom
// Params 4, eflags: 0x1 linked
// Checksum 0xacb95542, Offset: 0x4ae8
// Size: 0x248
function give_neutralized_credit(touchlist, string, lastownerteam, isbflag) {
    time = gettime();
    waitframe(1);
    util::waittillslowprocessallowed();
    foreach (touch in touchlist) {
        player_from_touchlist = gameobjects::function_73944efe(touchlist, touch);
        if (!isdefined(player_from_touchlist)) {
            continue;
        }
        player_from_touchlist updatecapsperminute(lastownerteam);
        if (!isscoreboosting(player_from_touchlist, self)) {
            scoreevents::processscoreevent(#"dom_point_neutralized_neutralizing", player_from_touchlist, undefined, undefined);
            player_from_touchlist recordgameevent("neutralized");
            if (isdefined(player_from_touchlist.pers[#"neutralizes"])) {
                player_from_touchlist.pers[#"neutralizes"]++;
                player_from_touchlist.captures = player_from_touchlist.pers[#"neutralizes"];
            }
            demo::bookmark(#"event", gettime(), player_from_touchlist);
            potm::bookmark(#"event", gettime(), player_from_touchlist);
        } else {
            /#
                player_from_touchlist iprintlnbold("<unknown string>");
            #/
        }
        level thread popups::displayteammessagetoall(string, player_from_touchlist);
    }
}

// Namespace dom/dom
// Params 0, eflags: 0x1 linked
// Checksum 0x4d3dd249, Offset: 0x4d38
// Size: 0x610
function updatedomscores() {
    if (level.roundscorelimit && !level.timelimit) {
        warningscore = max(0, level.roundscorelimit - 12);
    } else {
        warningscore = 0;
    }
    playednearendvo = 0;
    alliesroundstartscore = [[ level._getteamscore ]](#"allies");
    axisroundstartscore = [[ level._getteamscore ]](#"axis");
    while (!level.gameended) {
        numownedflags = 0;
        scoring_teams = [];
        round_score_limit = util::get_current_round_score_limit();
        totalflags = getteamflagcount(#"allies") + getteamflagcount(#"axis");
        if (totalflags == 3 && game.stat[#"teamscores"][#"allies"] == round_score_limit - 1 && game.stat[#"teamscores"][#"axis"] == round_score_limit - 1) {
            level.clampscorelimit = 0;
        }
        numflags = getteamflagcount(#"allies");
        numownedflags = numownedflags + numflags;
        if (numflags) {
            scoring_teams[scoring_teams.size] = #"allies";
            globallogic_score::giveteamscoreforobjective_delaypostprocessing(#"allies", numflags);
        }
        numflags = getteamflagcount(#"axis");
        numownedflags = numownedflags + numflags;
        if (numflags) {
            scoring_teams[scoring_teams.size] = #"axis";
            globallogic_score::giveteamscoreforobjective_delaypostprocessing(#"axis", numflags);
        }
        if (numownedflags) {
            globallogic_score::postprocessteamscores(scoring_teams);
        }
        if (warningscore && !playednearendvo) {
            winningteam = undefined;
            alliesroundscore = [[ level._getteamscore ]](#"allies") - alliesroundstartscore;
            axisroundscore = [[ level._getteamscore ]](#"axis") - axisroundstartscore;
            if (alliesroundscore >= warningscore) {
                winningteam = #"allies";
            } else if (axisroundscore >= warningscore) {
                winningteam = #"axis";
            }
            if (isdefined(winningteam)) {
                nearwinning = "nearWinning";
                nearlosing = "nearLosing";
                if (util::isoneround() || util::islastround()) {
                    nearwinning = "nearWinningFinal";
                    nearlosing = "nearLosingFinal";
                } else {
                    if (randomint(4) < 3) {
                        nearwinning = "nearWinningFinal";
                    }
                    if (randomint(4) < 1) {
                        nearlosing = "nearLosingFinal";
                    }
                }
                globallogic_audio::leader_dialog(nearwinning, winningteam);
                globallogic_audio::leader_dialog_for_other_teams(nearlosing, winningteam);
                playednearendvo = 1;
            }
        }
        onscoreclosemusic();
        var_bac44d7f = 1;
        if (level.teamscoreperkill) {
            var_bac44d7f = 0;
        }
        /#
            if (getdvarint(#"hash_697b325da5b79b83", 0) > 0) {
                var_bac44d7f = 0;
            }
        #/
        if (var_bac44d7f) {
            timepassed = globallogic_utils::gettimepassed();
            if ((float(timepassed) / 1000 > 120 && numownedflags < 2 || float(timepassed) / 1000 > 300 && numownedflags < 3) && gamemodeismode(0)) {
                round::set_flag("tie");
                thread globallogic::end_round(0);
                return;
            }
        }
        wait(5);
        hostmigration::waittillhostmigrationdone();
    }
}

// Namespace dom/dom
// Params 0, eflags: 0x1 linked
// Checksum 0x722e97bc, Offset: 0x5350
// Size: 0x35e
function onscoreclosemusic() {
    axisscore = [[ level._getteamscore ]](#"axis");
    alliedscore = [[ level._getteamscore ]](#"allies");
    scorelimit = level.scorelimit;
    scorethreshold = scorelimit * 0.1;
    scoredif = abs(axisscore - alliedscore);
    scorethresholdstart = abs(scorelimit - scorethreshold);
    scorelimitcheck = scorelimit - 10;
    if (!isdefined(level.playingactionmusic)) {
        level.playingactionmusic = 0;
    }
    if (!isdefined(level.sndhalfway)) {
        level.sndhalfway = 0;
    }
    if (alliedscore > axisscore) {
        currentscore = alliedscore;
    } else {
        currentscore = axisscore;
    }
    /#
        if (getdvarint(#"debug_music", 0) > 0) {
            println("<unknown string>" + scoredif);
            println("<unknown string>" + axisscore);
            println("<unknown string>" + alliedscore);
            println("<unknown string>" + scorelimit);
            println("<unknown string>" + currentscore);
            println("<unknown string>" + scorethreshold);
            println("<unknown string>" + scoredif);
            println("<unknown string>" + scorethresholdstart);
        }
    #/
    if (scoredif <= scorethreshold && scorethresholdstart <= currentscore && level.playingactionmusic != 1) {
    }
    halfwayscore = scorelimit * 0.5;
    if (isdefined(level.roundscorelimit)) {
        halfwayscore = level.roundscorelimit * 0.5;
        if (game.roundsplayed == 1) {
            halfwayscore = halfwayscore + level.roundscorelimit;
        }
    }
    if ((axisscore >= halfwayscore || alliedscore >= halfwayscore) && !level.sndhalfway) {
        level notify(#"sndmusichalfway");
        level.sndhalfway = 1;
    }
}

// Namespace dom/dom
// Params 0, eflags: 0x1 linked
// Checksum 0x19f73506, Offset: 0x56b8
// Size: 0xb0
function on_round_switch() {
    gametype::on_round_switch();
    if (level.scoreroundwinbased) {
        [[ level._setteamscore ]](#"allies", game.stat[#"roundswon"][#"allies"]);
        [[ level._setteamscore ]](#"axis", game.stat[#"roundswon"][#"axis"]);
    }
}

// Namespace dom/dom
// Params 4, eflags: 0x1 linked
// Checksum 0xebac2b56, Offset: 0x5770
// Size: 0xcd4
function function_610d3790(einflictor, victim, idamage, weapon) {
    attacker = self;
    if (isdefined(weapon) && isdefined(level.iskillstreakweapon)) {
        if ([[ level.iskillstreakweapon ]](weapon) || isdefined(weapon.statname) && [[ level.iskillstreakweapon ]](getweapon(weapon.statname))) {
            weaponiskillstreak = 1;
        }
    }
    var_1cfdf798 = isdefined(victim.lastattacker) ? victim.lastattacker === attacker : 0;
    foreach (flag in level.flags) {
        if (isdefined(einflictor) && isdefined(attacker) && einflictor != attacker) {
            var_7901de48 = (flag.radius + 350) * (flag.radius + 350);
            dist = distance2dsquared(einflictor.origin, flag.origin);
            if (dist < var_7901de48) {
                var_19041061 = 1;
            } else {
                continue;
            }
        } else {
            var_19041061 = 1;
        }
        victim thread globallogic_score::function_7d830bc(einflictor, attacker, weapon, flag, flag.radius, flag.useobj.ownerteam, flag.useobj);
    }
    if (!(isdefined(var_19041061) && var_19041061)) {
        return;
    }
    if (isdefined(attacker) && isplayer(attacker)) {
        scoreeventprocessed = 0;
        if (!scoreeventprocessed && isdefined(attacker.touchtriggers) && attacker.touchtriggers.size && attacker.pers[#"team"] != victim.pers[#"team"]) {
            triggerids = getarraykeys(attacker.touchtriggers);
            domflag = attacker.touchtriggers[triggerids[0]].useobj;
            team = attacker.pers[#"team"];
            if (team != domflag.ownerteam) {
                if (!(isdefined(weaponiskillstreak) && weaponiskillstreak)) {
                    scoreevents::processscoreevent(#"kill_enemy_while_capping_dom", attacker, victim, weapon);
                }
                attacker challenges::function_2f462ffd(victim, weapon, einflictor, domflag);
                attacker.pers[#"objectiveekia"]++;
                attacker.objectiveekia = attacker.pers[#"objectiveekia"];
                attacker.pers[#"objectives"]++;
                attacker.objectives = attacker.pers[#"objectives"];
                scoreeventprocessed = 1;
            }
        }
        for (index = 0; index < level.flags.size; index++) {
            flagteam = "invalidTeam";
            inflagzone = 0;
            defendedflag = 0;
            offendedflag = 0;
            flagorigin = level.flags[index].origin;
            offenseradiussq = level.flags[index].radius * level.flags[index].radius;
            dist = distance2dsquared(victim.origin, flagorigin);
            if (dist < offenseradiussq) {
                inflagzone = 1;
                if (level.flags[index] getflagteam() == attacker.pers[#"team"] || level.flags[index] getflagteam() == #"neutral") {
                    defendedflag = 1;
                } else {
                    offendedflag = 1;
                }
            }
            dist = distance2dsquared(attacker.origin, flagorigin);
            if (dist < offenseradiussq) {
                inflagzone = 1;
                if (level.flags[index] getflagteam() == attacker.pers[#"team"] || level.flags[index] getflagteam() == #"neutral") {
                    defendedflag = 1;
                } else {
                    offendedflag = 1;
                }
            }
            if (inflagzone && isplayer(attacker) && attacker.pers[#"team"] != victim.pers[#"team"]) {
                if (offendedflag) {
                    if (!isdefined(attacker.dom_defends)) {
                        attacker.dom_defends = 0;
                    }
                    attacker.dom_defends++;
                    if (level.playerdefensivemax >= attacker.dom_defends) {
                        attacker thread challenges::killedbasedefender(level.flags[index]);
                        if (!scoreeventprocessed) {
                            if (!(isdefined(weaponiskillstreak) && weaponiskillstreak)) {
                                scoreevents::processscoreevent(#"killed_defender", attacker, victim, weapon);
                            }
                            attacker challenges::function_2f462ffd(victim, weapon, einflictor, level.flags[index].useobj);
                            attacker.pers[#"objectiveekia"]++;
                            attacker.objectiveekia = attacker.pers[#"objectiveekia"];
                            attacker.pers[#"objectives"]++;
                            attacker.objectives = attacker.pers[#"objectives"];
                            scoreeventprocessed = 1;
                        }
                        victim recordkillmodifier("defending");
                        break;
                    } else {
                        /#
                            attacker iprintlnbold("<unknown string>");
                        #/
                    }
                }
                if (defendedflag) {
                    if (!isdefined(attacker.dom_offends)) {
                        attacker.dom_offends = 0;
                    }
                    attacker thread updateattackermultikills();
                    attacker.dom_offends++;
                    if (level.playeroffensivemax >= attacker.dom_offends) {
                        attacker.pers[#"defends"]++;
                        attacker.defends = attacker.pers[#"defends"];
                        attacker thread challenges::killedbaseoffender(level.flags[index], weapon, einflictor);
                        attacker recordgameevent("return");
                        attacker challenges::killedzoneattacker(weapon);
                        if (!scoreeventprocessed) {
                            if (!(isdefined(weaponiskillstreak) && weaponiskillstreak)) {
                                scoreevents::processscoreevent(#"killed_attacker", attacker, victim, weapon);
                            }
                            attacker challenges::function_2f462ffd(victim, weapon, einflictor, level.flags[index].useobj);
                            attacker.pers[#"objectiveekia"]++;
                            attacker.objectiveekia = attacker.pers[#"objectiveekia"];
                            attacker.pers[#"objectives"]++;
                            attacker.objectives = attacker.pers[#"objectives"];
                            scoreeventprocessed = 1;
                        }
                        victim recordkillmodifier("assaulting");
                        break;
                    } else {
                        /#
                            attacker iprintlnbold("<unknown string>");
                        #/
                    }
                }
            }
        }
        if (var_1cfdf798 && !(isdefined(weaponiskillstreak) && weaponiskillstreak) && isdefined(victim.touchtriggers) && victim.touchtriggers.size && attacker.pers[#"team"] != victim.pers[#"team"]) {
            triggerids = getarraykeys(victim.touchtriggers);
            flag = victim.touchtriggers[triggerids[0]].useobj;
            ownerteam = flag.ownerteam;
            team = victim.pers[#"team"];
            if (team != ownerteam) {
                scoreevents::processscoreevent(#"kill_enemy_that_is_capping_your_objective", attacker, self, weapon);
                scoreeventprocessed = 1;
                if (flag.contested === 1) {
                    attacker killwhilecontesting(flag, weapon);
                }
            }
        }
        if (var_1cfdf798 && scoreeventprocessed === 1) {
            attacker challenges::function_82bb78f7(weapon);
        }
    }
}

// Namespace dom/dom
// Params 9, eflags: 0x1 linked
// Checksum 0x7d81d1f4, Offset: 0x6450
// Size: 0xfc
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration) {
    if (smeansofdeath == "MOD_META") {
        return;
    }
    if (isplayer(attacker) == 0 || attacker.team == self.team) {
        return;
    }
    if (!isdefined(killstreaks::get_killstreak_for_weapon(weapon)) || isdefined(level.killstreaksgivegamescore) && level.killstreaksgivegamescore) {
        attacker globallogic_score::giveteamscoreforobjective(attacker.team, level.teamscoreperkill);
    }
}

// Namespace dom/dom
// Params 2, eflags: 0x1 linked
// Checksum 0xf7c8a55b, Offset: 0x6558
// Size: 0x198
function function_a800815(victim, attacker) {
    if (!isdefined(victim) || !isdefined(victim.pers) || !isdefined(victim.pers[#"team"])) {
        return 0;
    }
    if (!isdefined(attacker) || !isdefined(attacker.pers) || !isdefined(attacker.pers[#"team"])) {
        return 0;
    }
    if (isdefined(victim.touchtriggers) && victim.touchtriggers.size && attacker.pers[#"team"] != victim.pers[#"team"]) {
        triggerids = getarraykeys(victim.touchtriggers);
        domflag = victim.touchtriggers[triggerids[0]].useobj;
        team = victim.pers[#"team"];
        if (team != domflag.ownerteam) {
            return 1;
        }
    }
    return 0;
}

// Namespace dom/dom
// Params 1, eflags: 0x1 linked
// Checksum 0x3f5ce938, Offset: 0x66f8
// Size: 0x92
function function_d3a438fb(entity) {
    foreach (flag in level.flags) {
        if (entity istouching(flag)) {
            return 1;
        }
    }
    return 0;
}

// Namespace dom/dom
// Params 2, eflags: 0x1 linked
// Checksum 0xe372c12a, Offset: 0x6798
// Size: 0x1a6
function killwhilecontesting(flag, weapon) {
    self notify(#"killwhilecontesting");
    self endon(#"killwhilecontesting", #"disconnect");
    killtime = gettime();
    playerteam = self.pers[#"team"];
    if (!isdefined(self.clearenemycount)) {
        self.clearenemycount = 0;
    }
    self.clearenemycount++;
    flag waittill(#"contest_over");
    if (playerteam != self.pers[#"team"] || isdefined(self.spawntime) && killtime < self.spawntime) {
        self.clearenemycount = 0;
        return;
    }
    if (flag.ownerteam != playerteam && flag.ownerteam != #"neutral") {
        self.clearenemycount = 0;
        return;
    }
    if (self.clearenemycount >= 2 && killtime + 200 > gettime()) {
        scoreevents::processscoreevent(#"clear_2_attackers", self, undefined, undefined);
        self challenges::function_e0f51b6f(weapon);
    }
    self.clearenemycount = 0;
}

// Namespace dom/dom
// Params 0, eflags: 0x1 linked
// Checksum 0x103a4baf, Offset: 0x6948
// Size: 0xae
function updateattackermultikills() {
    self endon(#"disconnect");
    level endon(#"game_ended");
    self notify(#"updatedomrecentkills");
    self endon(#"updatedomrecentkills");
    if (!isdefined(self.recentdomattackerkillcount)) {
        self.recentdomattackerkillcount = 0;
    }
    self.recentdomattackerkillcount++;
    wait(4);
    if (self.recentdomattackerkillcount > 1) {
        self challenges::domattackermultikill(self.recentdomattackerkillcount);
    }
    self.recentdomattackerkillcount = 0;
}

// Namespace dom/dom
// Params 1, eflags: 0x1 linked
// Checksum 0x9ac0e941, Offset: 0x6a00
// Size: 0x78
function getteamflagcount(team) {
    score = 0;
    for (i = 0; i < level.flags.size; i++) {
        if (level.domflags[i] gameobjects::get_owner_team() == team) {
            score++;
        }
    }
    return score;
}

// Namespace dom/dom
// Params 0, eflags: 0x1 linked
// Checksum 0x7a3ad082, Offset: 0x6a80
// Size: 0x1a
function getflagteam() {
    return self.useobj gameobjects::get_owner_team();
}

// Namespace dom/dom
// Params 0, eflags: 0x1 linked
// Checksum 0x9098ae0d, Offset: 0x6aa8
// Size: 0xf2
function getboundaryflags() {
    bflags = [];
    for (i = 0; i < level.flags.size; i++) {
        for (j = 0; j < level.flags[i].adjflags.size; j++) {
            if (level.flags[i].useobj gameobjects::get_owner_team() != level.flags[i].adjflags[j].useobj gameobjects::get_owner_team()) {
                bflags[bflags.size] = level.flags[i];
                continue;
            }
        }
    }
    return bflags;
}

// Namespace dom/dom
// Params 1, eflags: 0x0
// Checksum 0x2ed2189c, Offset: 0x6ba8
// Size: 0xea
function getboundaryflagspawns(team) {
    spawns = [];
    bflags = getboundaryflags();
    for (i = 0; i < bflags.size; i++) {
        if (isdefined(team) && bflags[i] getflagteam() != team) {
            continue;
        }
        for (j = 0; j < bflags[i].nearbyspawns.size; j++) {
            spawns[spawns.size] = bflags[i].nearbyspawns[j];
        }
    }
    return spawns;
}

// Namespace dom/dom
// Params 1, eflags: 0x0
// Checksum 0x93b89c4a, Offset: 0x6ca0
// Size: 0x12a
function getspawnsboundingflag(avoidflag) {
    spawns = [];
    for (i = 0; i < level.flags.size; i++) {
        flag = level.flags[i];
        if (flag == avoidflag) {
            continue;
        }
        isbounding = 0;
        for (j = 0; j < flag.adjflags.size; j++) {
            if (flag.adjflags[j] == avoidflag) {
                isbounding = 1;
                break;
            }
        }
        if (!isbounding) {
            continue;
        }
        for (j = 0; j < flag.nearbyspawns.size; j++) {
            spawns[spawns.size] = flag.nearbyspawns[j];
        }
    }
    return spawns;
}

// Namespace dom/dom
// Params 1, eflags: 0x0
// Checksum 0xf5489361, Offset: 0x6dd8
// Size: 0x1a0
function getownedandboundingflagspawns(team) {
    spawns = [];
    for (i = 0; i < level.flags.size; i++) {
        if (level.flags[i] getflagteam() == team) {
            for (s = 0; s < level.flags[i].nearbyspawns.size; s++) {
                spawns[spawns.size] = level.flags[i].nearbyspawns[s];
            }
        } else {
            for (j = 0; j < level.flags[i].adjflags.size; j++) {
                if (level.flags[i].adjflags[j] getflagteam() == team) {
                    for (s = 0; s < level.flags[i].nearbyspawns.size; s++) {
                        spawns[spawns.size] = level.flags[i].nearbyspawns[s];
                    }
                    continue;
                }
            }
        }
    }
    return spawns;
}

// Namespace dom/dom
// Params 1, eflags: 0x0
// Checksum 0xd4717d22, Offset: 0x6f80
// Size: 0xd2
function getownedflagspawns(team) {
    spawns = [];
    for (i = 0; i < level.flags.size; i++) {
        if (level.flags[i] getflagteam() == team) {
            for (s = 0; s < level.flags[i].nearbyspawns.size; s++) {
                spawns[spawns.size] = level.flags[i].nearbyspawns[s];
            }
        }
    }
    return spawns;
}

// Namespace dom/dom
// Params 0, eflags: 0x1 linked
// Checksum 0xb5dc2bf8, Offset: 0x7060
// Size: 0x5b2
function flagsetup() {
    descriptorsbylinkname = [];
    descriptors = getentarray("flag_descriptor", "targetname");
    flags = level.flags;
    for (i = 0; i < level.domflags.size; i++) {
        closestdist = undefined;
        closestdesc = undefined;
        for (j = 0; j < descriptors.size; j++) {
            dist = distance(flags[i].origin, descriptors[j].origin);
            if (!isdefined(closestdist) || dist < closestdist) {
                closestdist = dist;
                closestdesc = descriptors[j];
            }
        }
        if (!isdefined(closestdesc)) {
            globallogic_utils::add_map_error("there is no flag_descriptor in the map! see explanation in dom.gsc");
            break;
        }
        if (isdefined(closestdesc.flag)) {
            globallogic_utils::add_map_error("flag_descriptor with script_linkname "" + closestdesc.script_linkname + "" is nearby more than one flag; is there a unique descriptor near each flag?");
        } else {
            flags[i].descriptor = closestdesc;
            closestdesc.flag = flags[i];
            descriptorsbylinkname[closestdesc.script_linkname] = closestdesc;
        }
    }
    if (!isdefined(level.maperrors) || level.maperrors.size == 0) {
        for (i = 0; i < flags.size; i++) {
            if (isdefined(flags[i].descriptor.script_linkto)) {
                adjdescs = strtok(flags[i].descriptor.script_linkto, " ");
            } else {
                adjdescs = [];
            }
            for (j = 0; j < adjdescs.size; j++) {
                otherdesc = descriptorsbylinkname[adjdescs[j]];
                if (!isdefined(otherdesc) || otherdesc.targetname != "flag_descriptor") {
                    globallogic_utils::add_map_error("flag_descriptor with script_linkname "" + flags[i].descriptor.script_linkname + "" linked to "" + adjdescs[j] + "" which does not exist as a script_linkname of any other entity with a targetname of flag_descriptor (or, if it does, that flag_descriptor has not been assigned to a flag)");
                } else {
                    adjflag = otherdesc.flag;
                    if (adjflag == flags[i]) {
                        globallogic_utils::add_map_error("flag_descriptor with script_linkname "" + flags[i].descriptor.script_linkname + "" linked to itself");
                    } else {
                        flags[i].adjflags[flags[i].adjflags.size] = adjflag;
                    }
                }
            }
        }
    }
    spawnpoints = spawning::get_spawnpoint_array("mp_dom_spawn");
    for (i = 0; i < spawnpoints.size; i++) {
        if (isdefined(spawnpoints[i].script_linkto)) {
            desc = descriptorsbylinkname[spawnpoints[i].script_linkto];
            if (!isdefined(desc) || desc.targetname != "flag_descriptor") {
                globallogic_utils::add_map_error("Spawnpoint at " + spawnpoints[i].origin + "" linked to "" + spawnpoints[i].script_linkto + "" which does not exist as a script_linkname of any entity with a targetname of flag_descriptor (or, if it does, that flag_descriptor has not been assigned to a flag)");
                continue;
            }
            nearestflag = desc.flag;
        } else {
            nearestflag = undefined;
            nearestdist = undefined;
            for (j = 0; j < flags.size; j++) {
                dist = distancesquared(flags[j].origin, spawnpoints[i].origin);
                if (!isdefined(nearestflag) || dist < nearestdist) {
                    nearestflag = flags[j];
                    nearestdist = dist;
                }
            }
        }
        nearestflag.nearbyspawns[nearestflag.nearbyspawns.size] = spawnpoints[i];
    }
    if (globallogic_utils::print_map_errors()) {
        return 0;
    }
}

// Namespace dom/dom
// Params 0, eflags: 0x1 linked
// Checksum 0x885671f5, Offset: 0x7620
// Size: 0x23c
function createflagspawninfluencers() {
    ss = level.spawnsystem;
    for (flag_index = 0; flag_index < level.flags.size; flag_index++) {
        if (level.domflags[flag_index] == self) {
            break;
        }
    }
    self.owned_flag_influencer = self influencers::create_influencer("dom_friendly", self.trigger.origin, 0);
    self.neutral_flag_influencer = self influencers::create_influencer("dom_neutral", self.trigger.origin, 0);
    self.enemy_flag_influencer = self influencers::create_influencer("dom_enemy", self.trigger.origin, 0);
    var_4b91b8a4 = self function_58306805();
    if (isdefined(var_4b91b8a4)) {
        self.var_7f85bfce = self influencers::create_influencer("dom_flag_spawn_friendly", self.trigger.origin, 0);
        function_8b51d4df(self.var_7f85bfce, var_4b91b8a4);
        self.var_b56facb1 = self influencers::create_influencer("dom_flag_spawn_enemy", self.trigger.origin, 0);
        function_8b51d4df(self.var_b56facb1, var_4b91b8a4);
        self.var_b0f6f826 = self influencers::create_influencer("dom_flag_spawn_neutral", self.trigger.origin, 0);
        function_8b51d4df(self.var_b0f6f826, var_4b91b8a4);
    }
    self update_spawn_influencers(#"neutral");
}

// Namespace dom/dom
// Params 1, eflags: 0x1 linked
// Checksum 0xe3edff0f, Offset: 0x7868
// Size: 0x2cc
function update_spawn_influencers(team) {
    /#
        assert(isdefined(self.neutral_flag_influencer));
    #/
    /#
        assert(isdefined(self.owned_flag_influencer));
    #/
    /#
        assert(isdefined(self.enemy_flag_influencer));
    #/
    if (team == #"neutral") {
        enableinfluencer(self.neutral_flag_influencer, 1);
        enableinfluencer(self.owned_flag_influencer, 0);
        enableinfluencer(self.enemy_flag_influencer, 0);
        if (isdefined(self function_58306805())) {
            enableinfluencer(self.var_b0f6f826, 1);
            enableinfluencer(self.var_7f85bfce, 0);
            enableinfluencer(self.var_b56facb1, 0);
        }
    } else {
        enableinfluencer(self.neutral_flag_influencer, 0);
        enableinfluencer(self.owned_flag_influencer, 1);
        enableinfluencer(self.enemy_flag_influencer, 1);
        if (isdefined(self function_58306805())) {
            enableinfluencer(self.var_b0f6f826, 0);
            enableinfluencer(self.var_7f85bfce, 1);
            enableinfluencer(self.var_b56facb1, 1);
            setinfluencerteammask(self.var_7f85bfce, util::getteammask(team));
            setinfluencerteammask(self.var_b56facb1, util::getotherteamsmask(team));
        }
        setinfluencerteammask(self.owned_flag_influencer, util::getteammask(team));
        setinfluencerteammask(self.enemy_flag_influencer, util::getotherteamsmask(team));
    }
}

// Namespace dom/dom
// Params 4, eflags: 0x0
// Checksum 0xb0ac4089, Offset: 0x7b40
// Size: 0x84
function addspawnpointsforflag(team, flag_team, flagspawnname, label) {
    team = util::function_6f4ff113(team);
    otherteam = util::getotherteam(team);
    if (flag_team != otherteam) {
        spawning::add_spawn_points(team, flagspawnname);
    }
}

// Namespace dom/dom
// Params 3, eflags: 0x0
// Checksum 0x28be876c, Offset: 0x7bd0
// Size: 0x74
function function_bde5689e(team, flag_team, label) {
    otherteam = util::getotherteam(team);
    if (flag_team != otherteam) {
        globallogic_spawn::addsupportedspawnpointtype(level.var_e6979a05[label], team);
    }
}

// Namespace dom/dom
// Params 0, eflags: 0x1 linked
// Checksum 0xd96fb32e, Offset: 0x7c50
// Size: 0xf2
function dominated_challenge_check() {
    num_flags = level.flags.size;
    allied_flags = 0;
    axis_flags = 0;
    for (i = 0; i < num_flags; i++) {
        flag_team = level.flags[i] getflagteam();
        if (flag_team == #"allies") {
            allied_flags++;
        } else if (flag_team == #"axis") {
            axis_flags++;
        } else {
            return 0;
        }
        if (allied_flags > 0 && axis_flags > 0) {
            return 0;
        }
    }
    return 1;
}

// Namespace dom/dom
// Params 0, eflags: 0x0
// Checksum 0xdc9c6d1c, Offset: 0x7d50
// Size: 0xea
function dominated_check() {
    num_flags = level.flags.size;
    allied_flags = 0;
    axis_flags = 0;
    for (i = 0; i < num_flags; i++) {
        flag_team = level.flags[i] getflagteam();
        if (flag_team == #"allies") {
            allied_flags++;
        } else if (flag_team == #"axis") {
            axis_flags++;
        }
        if (allied_flags > 0 && axis_flags > 0) {
            return 0;
        }
    }
    return 1;
}

// Namespace dom/dom
// Params 1, eflags: 0x1 linked
// Checksum 0x1959e290, Offset: 0x7e48
// Size: 0x14e
function updatecapsperminute(lastownerteam) {
    if (!isdefined(self.capsperminute)) {
        self.numcaps = 0;
        self.capsperminute = 0;
    }
    if (lastownerteam == #"neutral") {
        return;
    }
    self.numcaps++;
    minutespassed = float(globallogic_utils::gettimepassed()) / 60000;
    if (isplayer(self) && isdefined(self.timeplayed[#"total"])) {
        minutespassed = self.timeplayed[#"total"] / 60;
    }
    if ((isdefined(minutespassed) ? minutespassed : 0) > 0) {
        self.capsperminute = self.numcaps / minutespassed;
    } else {
        self.capsperminute = self.numcaps;
    }
    if (self.capsperminute > self.numcaps) {
        self.capsperminute = self.numcaps;
    }
}

// Namespace dom/dom
// Params 2, eflags: 0x1 linked
// Checksum 0x60d745ff, Offset: 0x7fa0
// Size: 0x62
function isscoreboosting(player, flag) {
    if (!level.rankedmatch) {
        return 0;
    }
    if (player.capsperminute > level.playercapturelpm) {
        return 1;
    }
    if (flag.capsperminute > level.flagcapturelpm) {
        return 1;
    }
    return 0;
}

// Namespace dom/dom
// Params 1, eflags: 0x1 linked
// Checksum 0x52f5c8b1, Offset: 0x8010
// Size: 0xa6
function on_touch_use(sentient) {
    if (isplayer(sentient)) {
        if ((isdefined(self.contested) ? self.contested : 0) && (isdefined(sentient.var_c8d27c06) ? sentient.var_c8d27c06 : 0) < gettime()) {
            sentient playsoundtoplayer(#"hash_5daa27b37c13bc01", sentient);
            sentient.var_c8d27c06 = gettime() + 5000;
        }
    }
}

// Namespace dom/dom
// Params 0, eflags: 0x1 linked
// Checksum 0x6a58488c, Offset: 0x80c0
// Size: 0x23a
function onupdateuserate() {
    if (!isdefined(self.contested)) {
        self.contested = 0;
    }
    var_7ccef8c6 = self.numtouching[self.claimteam];
    previousstate = self.contested;
    ownerteam = self.ownerteam;
    if (var_7ccef8c6 > 0 && isdefined(ownerteam) && ownerteam != #"neutral" && ownerteam != self.claimteam) {
        if (previousstate == 0) {
            foreach (playerlist in self.touchlist) {
                foreach (struct in playerlist) {
                    player = struct.player;
                    if (isdefined(player) && isplayer(player) && (isdefined(player.var_c8d27c06) ? player.var_c8d27c06 : 0) < gettime()) {
                        player playsoundtoplayer(#"hash_5daa27b37c13bc01", player);
                        player.var_c8d27c06 = gettime() + 5000;
                    }
                }
            }
        }
        self.contested = 1;
    } else {
        if (previousstate == 1) {
            self notify(#"contest_over");
        }
        self.contested = 0;
    }
}

// Namespace dom/dom
// Params 1, eflags: 0x1 linked
// Checksum 0x6811f7d, Offset: 0x8308
// Size: 0x26e
function function_1609a882(var_c1e98979) {
    var_1e866967 = spawnstruct();
    switch (var_c1e98979) {
    case 4:
        var_1e866967.wintype = "round_score_reached";
        break;
    case 9:
    case 10:
    default:
        var_1e866967.wintype = "NA";
        break;
    }
    bb::function_bf5cad4e(var_1e866967);
    for (var_268d0315 = 0; var_268d0315 < level.domflags.size; var_268d0315++) {
        domflag = level.domflags[var_268d0315];
        var_9669dd4c = 0;
        for (var_be3d50b0 = 0; var_be3d50b0 < domflag.var_249009fd.size; var_be3d50b0++) {
            var_9669dd4c = var_9669dd4c + domflag.var_249009fd[var_be3d50b0];
        }
        if (domflag.var_249009fd.size != 0) {
            var_3458097 = var_9669dd4c / domflag.var_249009fd.size;
        }
        var_93746b40 = {#var_a248f0a8:domflag.var_a248f0a8, #var_afd986ce:isdefined(var_3458097) ? var_3458097 : 0, #var_9dcc8b07:domflag.var_9dcc8b07, #label:domflag gameobjects::get_label(), #round:game.roundsplayed, #gametime:function_f8d53445()};
        function_92d1707f(#"hash_4b747d11b8ad1b23", var_93746b40);
    }
}

