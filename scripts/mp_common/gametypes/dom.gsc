// Atian COD Tools GSC decompiler test
#include scripts/mp_common/util.gsc;
#include scripts/mp_common/spawnbeacon.gsc;
#include scripts/mp_common/userspawnselection.gsc;
#include scripts/mp_common/player/player_utils.gsc;
#include scripts/mp_common/gametypes/round.gsc;
#include scripts/mp_common/gametypes/match.gsc;
#include scripts/mp_common/gametypes/hostmigration.gsc;
#include scripts/mp_common/gametypes/globallogic_utils.gsc;
#include scripts/mp_common/gametypes/globallogic_spawn.gsc;
#include scripts/mp_common/gametypes/globallogic_score.gsc;
#include scripts/mp_common/gametypes/globallogic_audio.gsc;
#include scripts/mp_common/gametypes/globallogic.gsc;
#include scripts/mp_common/gametypes/gametype.gsc;
#include script_4c8dba49908aecc2;
#include scripts/mp_common/challenges.gsc;
#include scripts/mp_common/bb.gsc;
#include scripts/killstreaks/killstreaks_shared.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/trigger_shared.gsc;
#include scripts/core_common/spawning_shared.gsc;
#include scripts/core_common/sound_shared.gsc;
#include scripts/core_common/scoreevents_shared.gsc;
#include scripts/core_common/potm_shared.gsc;
#include scripts/core_common/popups_shared.gsc;
#include scripts/core_common/player/player_stats.gsc;
#include scripts/core_common/persistence_shared.gsc;
#include scripts/core_common/influencers_shared.gsc;
#include scripts/core_common/hostmigration_shared.gsc;
#include scripts/core_common/globallogic/globallogic_score.gsc;
#include scripts/core_common/gameobjects_shared.gsc;
#include scripts/core_common/demo_shared.gsc;
#include scripts/core_common/contracts_shared.gsc;
#include scripts/core_common/challenges_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;

#namespace dom;

// Namespace dom/gametype_init
// Params 1, eflags: 0x40
// Checksum 0x17ab16b7, Offset: 0x8e0
// Size: 0x6ce
function event<gametype_init> main(eventstruct) {
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
    game.dialog[#"hash_2cce4e27ba1efbfa"] = "domFriendlySecuringB";
    game.dialog[#"hash_2cce4f27ba1efdad"] = "domFriendlySecuringC";
    game.dialog[#"secured_a"] = "domFriendlySecuredA";
    game.dialog[#"hash_617e11012f96be81"] = "domFriendlySecuredB";
    game.dialog[#"hash_617e10012f96bcce"] = "domFriendlySecuredC";
    game.dialog[#"hash_38611690b739e2e0"] = "domFriendlySecuredAll";
    game.dialog[#"losing_a"] = "domEnemySecuringA";
    game.dialog[#"hash_39b609dc888623b2"] = "domEnemySecuringB";
    game.dialog[#"hash_39b60adc88862565"] = "domEnemySecuringC";
    game.dialog[#"lost_a"] = "domEnemySecuredA";
    game.dialog[#"hash_251e6b681a651d4a"] = "domEnemySecuredB";
    game.dialog[#"hash_251e6c681a651efd"] = "domEnemySecuredC";
    game.dialog[#"hash_5c20fcde19f7c3b7"] = "domEnemySecuredAll";
    game.dialog[#"enemy_a"] = "domEnemyHasA";
    game.dialog[#"enemy_b"] = "domEnemyHasB";
    game.dialog[#"hash_7ca0ebd7255f342d"] = "domEnemyHasC";
    game.var_2564b3a = [];
    game.var_2564b3a[#"securing_a"] = 0;
    game.var_2564b3a[#"hash_2cce4e27ba1efbfa"] = 0;
    game.var_2564b3a[#"hash_2cce4f27ba1efdad"] = 0;
    game.var_2564b3a[#"losing_a"] = 0;
    game.var_2564b3a[#"hash_39b609dc888623b2"] = 0;
    game.var_2564b3a[#"hash_39b60adc88862565"] = 0;
    level.var_e6979a05 = [];
    level.var_e6979a05[#"_a"] = "dom_flag_a";
    level.var_e6979a05[#"_b"] = "dom_flag_b";
    level.var_e6979a05[#"_c"] = "dom_flag_c";
    if (util::function_8570168d()) {
        namespace_9096c917::init();
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
    level.var_2b34b53a = [];
    level.startpos[#"allies"] = level.spawn_start[#"allies"][0].origin;
    level.startpos[#"axis"] = level.spawn_start[#"axis"][0].origin;
    level.b_allow_vehicle_proximity_pickup = 1;
    level thread function_f9739348();
    updategametypedvars();
    thread domflags();
    thread function_d231cbf3();
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
    var_61deea0f = globallogic_spawn::function_d400d613(#"mp_t8_spawn_point", var_273a84a9);
    foreach (var_de435199 in var_61deea0f) {
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
    if (isdefined(var_61deea0f)) {
        if (isdefined(var_61deea0f[#"dom_flag_a"])) {
            addspawnpoints(#"allies", var_61deea0f[#"dom_flag_a"], "spl4");
            addspawnpoints(#"axis", var_61deea0f[#"dom_flag_a"], "spl4");
        }
        if (isdefined(var_61deea0f[#"dom_flag_c"])) {
            addspawnpoints(#"allies", var_61deea0f[#"dom_flag_c"], "spl5");
            addspawnpoints(#"axis", var_61deea0f[#"dom_flag_c"], "spl5");
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
        if (isdefined(domflag.var_da57b5c1) && domflag.var_da57b5c1 == 1) {
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
function function_fadbbfea() {
    if (!isdefined(level.var_bf5fec71)) {
        return;
    }
    foreach (var_f8de67c4 in level.var_bf5fec71) {
        mindist = 1410065408;
        var_41891211 = undefined;
        foreach (flag in level.flags) {
            distance = distancesquared(var_f8de67c4.origin, flag.origin);
            if (distance < mindist) {
                var_41891211 = flag;
                mindist = distance;
            }
        }
        if (isdefined(var_41891211) && var_41891211 == self.trigger) {
            if (!isdefined(self.exclusions)) {
                self.exclusions = [];
            }
            self.exclusions[self.exclusions.size] = var_f8de67c4;
        }
    }
}

// Namespace dom/dom
// Params 0, eflags: 0x1 linked
// Checksum 0xa02f473f, Offset: 0x1900
// Size: 0x1fa
function updategametypedvars() {
    level.var_90e3f42e = getgametypesetting(#"capturetime");
    level.var_26ee7cf = getgametypesetting(#"hash_3de4aa2f016161ec");
    level.var_dc04c27d = getgametypesetting(#"hash_314b4f81b8b7dc64");
    level.var_e2719bc9 = getgametypesetting(#"hash_483e8c0148a4e513");
    level.var_9f6b22e7 = getgametypesetting(#"hash_29d84ecb37393f81");
    level.flagCanBeNeutralized = getgametypesetting(#"flagCanBeNeutralized");
    level.decayprogress = isdefined(getgametypesetting(#"decayprogress")) ? getgametypesetting(#"decayprogress") : 0;
    level.autodecaytime = isdefined(getgametypesetting(#"autodecaytime")) ? getgametypesetting(#"autodecaytime") : undefined;
    level.flagCaptureRateIncrease = isdefined(getgametypesetting(#"flagCaptureRateIncrease")) ? getgametypesetting(#"flagCaptureRateIncrease") : 0;
}

// Namespace dom/dom
// Params 0, eflags: 0x1 linked
// Checksum 0x2e17cd4e, Offset: 0x1b08
// Size: 0x9e4
function domflags() {
    level.var_e2b61d82[#"allies"] = 0;
    level.var_e2b61d82[#"axis"] = 0;
    level.var_f9b0966e[#"allies"] = "tag_origin";
    level.var_f9b0966e[#"axis"] = "tag_origin";
    level.var_f9b0966e[#"neutral"] = "tag_origin";
    var_d4a202a2 = getentarray("flag_primary", "targetname");
    if (var_d4a202a2.size < 2) {
        /#
            println("");
        #/
        callback::abort_level();
        return;
    }
    level.flags = [];
    foreach (var_d0c2b197 in var_d4a202a2) {
        if (isdefined(var_d0c2b197.target)) {
            trigger = getent(var_d0c2b197.target, "targetname");
            trigger trigger::function_1792c799(16);
            if (isdefined(trigger)) {
                trigger.visual = var_d0c2b197;
                trigger.script_label = var_d0c2b197.script_label;
                spawn_beacon::function_18f38647(trigger);
            } else {
                /#
                    util::error("<unknown string>" + var_d0c2b197.script_label + "<unknown string>" + var_d0c2b197.target);
                #/
            }
        } else {
            /#
                util::error("<unknown string>" + var_d0c2b197.script_label);
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
        trigger.visual setmodel(level.var_f9b0966e[#"neutral"]);
        name = #"dom" + trigger.visual.script_label;
        visuals = [];
        visuals[0] = trigger.visual;
        domflag = gameobjects::create_use_object(#"neutral", trigger, visuals, (0, 0, 0), name);
        domflag gameobjects::allow_use(#"enemy");
        if (level.flagCanBeNeutralized) {
            domflag gameobjects::set_use_time(level.var_90e3f42e / 2);
        } else {
            domflag gameobjects::set_use_time(level.var_90e3f42e);
        }
        domflag gameobjects::set_use_text(#"hash_12e5f9d3793fc759");
        label = domflag gameobjects::get_label();
        domflag.label = label;
        domflag.var_48adea04 = trigger.visual.script_index;
        domflag gameobjects::set_visible_team(#"any");
        domflag.onuse = &onuse;
        domflag.onbeginuse = &onbeginuse;
        domflag.onuseupdate = &onuseupdate;
        domflag.onenduse = &onenduse;
        domflag.var_df79c725 = &function_df79c725;
        domflag.ondecaycomplete = &ondecaycomplete;
        domflag.var_a334f38f = 0;
        domflag.var_a0ff5eb8 = !level.flagCaptureRateIncrease;
        domflag.decayprogress = level.decayprogress;
        domflag.autodecaytime = level.autodecaytime;
        domflag.var_eac9e8ae = 1;
        domflag.var_3c57b17d = &function_8c50d606;
        if (domflag.decayprogress) {
            domflag gameobjects::must_maintain_claim(0);
            if (level.flagCanBeNeutralized) {
                domflag gameobjects::set_decay_time(level.var_90e3f42e / 2);
            } else {
                domflag gameobjects::set_decay_time(level.var_90e3f42e);
            }
        }
        domflag gameobjects::set_objective_entity(visuals[0]);
        domflag gameobjects::set_owner_team(#"neutral");
        tracestart = visuals[0].origin + vectorscale((0, 0, 1), 32);
        traceend = visuals[0].origin + vectorscale((0, 0, -1), 32);
        trace = bullettrace(tracestart, traceend, 0, undefined);
        upangles = vectortoangles(trace[#"normal"]);
        domflag.var_a91ec60a = anglestoforward(upangles);
        domflag.var_e088d306 = anglestoright(upangles);
        domflag.var_7aa5fc67 = trace[#"position"];
        trigger.useobj = domflag;
        trigger.var_5be13778 = [];
        trigger.var_f5f7dbd7 = [];
        domflag.var_6402a372 = trigger;
        domflag.var_249009fd = [];
        domflag function_fadbbfea();
        level.domflags[level.domflags.size] = domflag;
    }
    level.var_e7d1ca6f = [];
    level.var_e7d1ca6f[#"allies"] = function_abc8e95d(#"allies", undefined);
    level.var_e7d1ca6f[#"axis"] = function_abc8e95d(#"axis", level.var_e7d1ca6f[#"allies"]);
    for (index = 0; index < level.domflags.size; index++) {
        level.domflags[index] function_e0f147a1();
    }
    function_a0ba5429();
    /#
        thread function_a44d879d();
    #/
}

// Namespace dom/dom
// Params 2, eflags: 0x1 linked
// Checksum 0xaf68ae67, Offset: 0x24f8
// Size: 0x122
function function_abc8e95d(team, var_852653a3) {
    best = undefined;
    bestdistsq = undefined;
    for (i = 0; i < level.flags.size; i++) {
        flag = level.flags[i];
        if (flag function_9b06f5c8() != #"neutral") {
            continue;
        }
        distsq = distancesquared(flag.origin, level.startpos[team]);
        if ((!isdefined(var_852653a3) || flag != var_852653a3) && (!isdefined(best) || distsq < bestdistsq)) {
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
function function_a44d879d() {
    /#
        while (1) {
            if (getdvarint(#"hash_23ae7c97af044f7", 0) != 1) {
                wait(2);
                continue;
            }
            while (1) {
                if (getdvarint(#"hash_23ae7c97af044f7", 0) != 1) {
                    break;
                }
                for (i = 0; i < level.flags.size; i++) {
                    for (j = 0; j < level.flags[i].var_5be13778.size; j++) {
                        line(level.flags[i].origin, level.flags[i].var_5be13778[j].origin, (1, 1, 1));
                    }
                    for (j = 0; j < level.flags[i].var_f5f7dbd7.size; j++) {
                        line(level.flags[i].origin, level.flags[i].var_f5f7dbd7[j].origin, (0.2, 0.2, 0.6));
                    }
                    if (level.flags[i] == level.var_e7d1ca6f[#"allies"]) {
                        print3d(level.flags[i].origin, "<unknown string>");
                    }
                    if (level.flags[i] == level.var_e7d1ca6f[#"axis"]) {
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
    self.var_c5ea56f3 = 0;
    if (ownerteam == #"allies") {
        otherteam = #"axis";
    } else {
        otherteam = #"allies";
    }
    if (ownerteam == #"neutral") {
        otherteam = util::getotherteam(sentient.team);
        function_37c09a53("securing" + self.label, sentient.team, "objective" + self.label);
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
    if (progress > 0.05 && change && !self.var_c5ea56f3) {
        ownerteam = self gameobjects::get_owner_team();
        if (ownerteam == #"neutral") {
            otherteam = util::getotherteam(team);
            function_37c09a53("securing" + self.label, team, "objective" + self.label);
        } else {
            function_37c09a53("losing" + self.label, ownerteam, "objective" + self.label);
            function_37c09a53("securing" + self.label, team, "objective" + self.label);
            globallogic_audio::flush_objective_dialog("objective_all");
        }
        self.var_c5ea56f3 = 1;
    }
    if (change > 0 && self.var_eac9e8ae) {
        self.var_eac9e8ae = 0;
        players = getplayers();
        foreach (player in players) {
            if (player.team == team) {
                player playsoundtoplayer(#"hash_3cca41b3702f764a", player);
            } else {
                player playsoundtoplayer(#"hash_2bb2a0ec776ba8f7", player);
            }
        }
    } else if (change == 0 && !self.var_eac9e8ae) {
        self.var_eac9e8ae = 1;
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
            var_5498ee18 = gameobjects::function_73944efe(self.touchlist[team], st);
            if (!isdefined(var_5498ee18)) {
                continue;
            }
            scoreevents::processscoreevent(#"hash_7edabe01ed05afa3", var_5498ee18, undefined, undefined);
        }
    }
}

// Namespace dom/dom
// Params 0, eflags: 0x1 linked
// Checksum 0x602b6092, Offset: 0x2dd0
// Size: 0x4c
function function_671936d8() {
    globallogic_audio::flush_objective_dialog("objective_a");
    globallogic_audio::flush_objective_dialog("objective_b");
    globallogic_audio::flush_objective_dialog("objective_c");
}

// Namespace dom/dom
// Params 3, eflags: 0x1 linked
// Checksum 0x53891ba3, Offset: 0x2e28
// Size: 0xe4
function function_37c09a53(dialog, team, objectivekey) {
    var_2564b3a = game.var_2564b3a[dialog];
    if (isdefined(var_2564b3a)) {
        time = gettime();
        if (var_2564b3a > time) {
            return;
        }
        game.var_2564b3a[dialog] = time + 10000;
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
    self.var_eac9e8ae = 1;
}

// Namespace dom/dom
// Params 1, eflags: 0x1 linked
// Checksum 0x8e27a494, Offset: 0x2f80
// Size: 0x1e4
function function_c2298919(team) {
    self.var_da57b5c1 = 1;
    otherteam = util::getotherteam(team);
    thread util::printandsoundoneveryone(team, undefined, #"hash_0", undefined, "mp_war_objective_taken");
    thread sound::play_on_players("mus_dom_captured" + "_" + level.teampostfix[team]);
    if (function_d11cf8f2(team) == level.flags.size) {
        function_37c09a53("secured_all", team, "objective_all");
        function_37c09a53("lost_all", otherteam, "objective_all");
        function_671936d8();
    } else {
        function_37c09a53("secured" + self.label, team, "objective" + self.label);
        function_37c09a53(#"enemy" + self.label, otherteam, "objective" + self.label);
        globallogic_audio::flush_objective_dialog("objective_all");
    }
    globallogic_audio::play_2d_on_team("mpl_flagcapture_sting_enemy", otherteam);
    globallogic_audio::play_2d_on_team("mpl_flagcapture_sting_friend", team);
}

// Namespace dom/dom
// Params 2, eflags: 0x1 linked
// Checksum 0x5c772e63, Offset: 0x3170
// Size: 0x21e
function function_abe819a0(team, oldteam) {
    self.var_da57b5c1 = 0;
    thread util::printandsoundoneveryone(team, oldteam, #"hash_0", #"hash_0", "mp_war_objective_taken", "mp_war_objective_lost", "");
    if (function_d11cf8f2(team) == level.flags.size) {
        function_37c09a53("secured_all", team, "objective_all");
        function_37c09a53("lost_all", oldteam, "objective_all");
        function_671936d8();
    } else {
        function_37c09a53("secured" + self.label, team, "objective" + self.label);
        if (randomint(2)) {
            function_37c09a53("lost" + self.label, oldteam, "objective" + self.label);
        } else {
            function_37c09a53(#"enemy" + self.label, oldteam, "objective" + self.label);
        }
        globallogic_audio::flush_objective_dialog("objective_all");
        globallogic_audio::play_2d_on_team("mpl_flagcapture_sting_enemy", oldteam);
        globallogic_audio::play_2d_on_team("mpl_flagcapture_sting_friend", team);
    }
    level.var_e7d1ca6f[oldteam] = self.var_6402a372;
}

// Namespace dom/dom
// Params 2, eflags: 0x1 linked
// Checksum 0xc655c6d9, Offset: 0x3398
// Size: 0x144
function function_1f87be90(team, oldteam) {
    self.var_da57b5c1 = 1;
    thread util::printandsoundoneveryone(#"neutral", oldteam, #"hash_0", #"hash_0", "mp_war_objective_neutralized", "mp_war_objective_lost", "");
    if (function_d11cf8f2(team) == level.flags.size) {
        function_37c09a53("lost_all", oldteam, "objective_all");
        function_671936d8();
    } else {
        function_37c09a53("lost" + self.label, oldteam, "objective" + self.label);
        globallogic_audio::flush_objective_dialog("objective_all");
        globallogic_audio::play_2d_on_team("mpl_flagcapture_sting_enemy", oldteam);
    }
}

// Namespace dom/dom
// Params 2, eflags: 0x1 linked
// Checksum 0xbb7355fc, Offset: 0x34e8
// Size: 0x226
function function_f053f278(label, var_eec92069) {
    string = #"hash_0";
    if (var_eec92069) {
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
function function_99b2902f(sentient) {
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
    string = #"hash_0";
    if (oldteam == #"neutral") {
        level notify(#"hash_124b6939764cfcaa");
        string = function_f053f278(label, 0);
        level.var_e7d1ca6f[oldteam] = self.var_6402a372;
        self gameobjects::set_owner_team(team);
        self.visuals[0] setmodel(level.var_f9b0966e[team]);
        self function_502cc193(team);
        self function_c2298919(team);
    } else {
        level notify(#"hash_4eebc58cc2211c21");
        string = function_f053f278(label, 1);
        self gameobjects::set_owner_team(#"neutral");
        self.visuals[0] setmodel(level.var_f9b0966e[#"neutral"]);
        self function_502cc193(#"neutral");
        self function_1f87be90(team, oldteam);
    }
    /#
        assert(string != #"hash_0");
    #/
    touchlist = arraycopy(self.touchlist[team]);
    var_dd783761 = 0;
    if (label == "_b") {
        var_dd783761 = 1;
    }
    if (oldteam == #"neutral") {
        if (isdefined(getgametypesetting(#"hash_5362566b7e897067")) && getgametypesetting(#"hash_5362566b7e897067")) {
            var_1dbb2b2b = arraycopy(self.var_1dbb2b2b[team]);
            self thread function_ef09febd(var_1dbb2b2b, touchlist, string, oldteam, var_dd783761, 0);
        } else {
            thread function_48b7eb27(touchlist, string, oldteam, var_dd783761, 1);
        }
    } else {
        thread function_b6355b7f(touchlist, string, oldteam, var_dd783761);
    }
    bb::function_95a5b5c2("dom_capture", label, team, sentient.origin);
    if (function_c6da4b50()) {
        level thread totaldomination(team);
    }
}

// Namespace dom/dom
// Params 1, eflags: 0x1 linked
// Checksum 0xced43ec3, Offset: 0x3b78
// Size: 0x3c4
function function_6dace231(sentient) {
    level notify(#"hash_124b6939764cfcaa");
    team = sentient.team;
    oldteam = self gameobjects::get_owner_team();
    label = self gameobjects::get_label();
    /#
        print("<unknown string>" + self.label);
    #/
    self gameobjects::set_owner_team(team);
    self.visuals[0] setmodel(level.var_f9b0966e[team]);
    level.usestartspawns = 0;
    /#
        assert(team != #"neutral");
    #/
    var_dd783761 = 0;
    if (label == "_b") {
        var_dd783761 = 1;
    }
    string = function_f053f278(label, 0);
    /#
        assert(string != #"hash_0");
    #/
    if (isdefined(getgametypesetting(#"hash_5362566b7e897067")) && getgametypesetting(#"hash_5362566b7e897067")) {
        var_1dbb2b2b = arraycopy(self.var_1dbb2b2b[team]);
        var_6d7ae157 = arraycopy(self.touchlist[team]);
        self thread function_ef09febd(var_1dbb2b2b, var_6d7ae157, string, oldteam, var_dd783761, 0);
    } else {
        touchlist = arraycopy(self.touchlist[team]);
        thread function_48b7eb27(touchlist, string, oldteam, var_dd783761, 0);
    }
    bb::function_95a5b5c2("dom_capture", undefined, team, sentient.origin);
    if (oldteam == #"neutral") {
        self function_c2298919(team);
        self.var_9dcc8b07 = gettime();
        self.var_a248f0a8 = 1;
        self.var_56d394cd = gettime();
    } else {
        self function_abe819a0(team, oldteam);
        self.var_249009fd[self.var_249009fd.size] = gettime() - self.var_56d394cd;
        self.var_56d394cd = gettime();
        self.var_a248f0a8++;
    }
    if (function_c6da4b50()) {
        level thread totaldomination(team);
        util::function_5a68c330(25, team);
    }
    self function_502cc193(team);
}

// Namespace dom/dom
// Params 1, eflags: 0x1 linked
// Checksum 0x2afaa392, Offset: 0x3f48
// Size: 0xbc
function onuse(sentient) {
    if (level.flagCanBeNeutralized) {
        self function_99b2902f(sentient);
    } else {
        self function_6dace231(sentient);
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
    level endon(#"hash_124b6939764cfcaa", #"game_ended");
    wait(180);
    challenges::totaldomination(team);
}

// Namespace dom/dom
// Params 0, eflags: 0x1 linked
// Checksum 0x17b51c8f, Offset: 0x4068
// Size: 0x90
function function_f9739348() {
    level endon(#"game_ended", #"hash_2a9b36f2d3716c0f");
    level thread function_ba536bfd(60);
    for (;;) {
        waitresult = undefined;
        waitresult = level waittill(#"hash_1810d8064579f927");
        waitresult.player challenges::capturedbfirstminute();
    }
}

// Namespace dom/dom
// Params 1, eflags: 0x1 linked
// Checksum 0x169bb298, Offset: 0x4100
// Size: 0x40
function function_ba536bfd(time) {
    level endon(#"game_ended");
    wait(60);
    level notify(#"hash_2a9b36f2d3716c0f");
}

// Namespace dom/dom
// Params 6, eflags: 0x1 linked
// Checksum 0x1bed7ac9, Offset: 0x4148
// Size: 0x3a4
function function_ef09febd(var_1dbb2b2b, var_6d7ae157, string, var_277c627b, var_dd783761, var_79fcf277) {
    time = gettime();
    waitframe(1);
    util::waittillslowprocessallowed();
    self function_91d77b44(var_277c627b);
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
        function_5a9598f0(player, string, var_277c627b, var_dd783761, var_79fcf277, time, var_a84f97bf, var_af8f6146);
    }
    self gameobjects::function_98aae7cf();
}

// Namespace dom/dom
// Params 5, eflags: 0x1 linked
// Checksum 0x254a469d, Offset: 0x44f8
// Size: 0x128
function function_48b7eb27(touchlist, string, var_277c627b, var_dd783761, var_79fcf277) {
    time = gettime();
    waitframe(1);
    util::waittillslowprocessallowed();
    self function_91d77b44(var_277c627b);
    foreach (touch in touchlist) {
        var_5498ee18 = gameobjects::function_73944efe(touchlist, touch);
        if (!isdefined(var_5498ee18)) {
            continue;
        }
        function_5a9598f0(var_5498ee18, string, var_277c627b, var_dd783761, var_79fcf277, time, 0, 1);
    }
}

// Namespace dom/dom
// Params 8, eflags: 0x1 linked
// Checksum 0x31a21eec, Offset: 0x4628
// Size: 0x4b4
function function_5a9598f0(player, string, var_277c627b, var_dd783761, var_79fcf277, time, var_a84f97bf, var_af8f6146) {
    player function_91d77b44(var_277c627b);
    if (!function_dacbb6ac(player, self)) {
        player challenges::capturedobjective(time, self.var_6402a372);
        if (var_277c627b == #"neutral" && var_79fcf277 && isdefined(self.var_a334f38f) && self.var_a334f38f) {
            scoreevents::processscoreevent(#"hash_49ea1ef8d7a4140f", player, level.weaponnone, undefined);
        } else if (var_277c627b == #"neutral") {
            if (var_dd783761) {
                scoreevents::processscoreevent(#"hash_40d073eb367b9e75", player, level.weaponnone, undefined);
                player stats::function_dad108fa(#"hash_60545a50ce7c9791", 1);
            } else {
                scoreevents::processscoreevent(#"hash_3993c195e8b824ba", player, level.weaponnone, undefined);
            }
        } else {
            scoreevents::processscoreevent(#"hash_1761fb9050f4930e", player, level.weaponnone, undefined);
        }
        self.var_a334f38f = 1;
        player recordgameevent("capture");
        if (var_dd783761) {
            level notify(#"hash_1810d8064579f927", {#player:player});
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
        if (isdefined(getgametypesetting(#"hash_5362566b7e897067")) && getgametypesetting(#"hash_5362566b7e897067")) {
            player luinotifyevent(#"hash_289bacbf80b953c9", 2, self.var_f23c87bd, player.var_759a143b);
            player.var_759a143b = undefined;
        }
        if (var_af8f6146) {
            player stats::function_dad108fa(#"hash_2f1df496791a2f5f", 1);
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
function function_b6355b7f(touchlist, string, var_277c627b, var_dd783761) {
    time = gettime();
    waitframe(1);
    util::waittillslowprocessallowed();
    foreach (touch in touchlist) {
        var_5498ee18 = gameobjects::function_73944efe(touchlist, touch);
        if (!isdefined(var_5498ee18)) {
            continue;
        }
        var_5498ee18 function_91d77b44(var_277c627b);
        if (!function_dacbb6ac(var_5498ee18, self)) {
            scoreevents::processscoreevent(#"hash_1a22ac168ba22619", var_5498ee18, undefined, undefined);
            var_5498ee18 recordgameevent("neutralized");
            if (isdefined(var_5498ee18.pers[#"neutralizes"])) {
                var_5498ee18.pers[#"neutralizes"]++;
                var_5498ee18.captures = var_5498ee18.pers[#"neutralizes"];
            }
            demo::bookmark(#"event", gettime(), var_5498ee18);
            potm::bookmark(#"event", gettime(), var_5498ee18);
        } else {
            /#
                var_5498ee18 iprintlnbold("<unknown string>");
            #/
        }
        level thread popups::displayteammessagetoall(string, var_5498ee18);
    }
}

// Namespace dom/dom
// Params 0, eflags: 0x1 linked
// Checksum 0x4d3dd249, Offset: 0x4d38
// Size: 0x610
function function_d231cbf3() {
    if (level.roundscorelimit && !level.timelimit) {
        var_e0852dc7 = max(0, level.roundscorelimit - 12);
    } else {
        var_e0852dc7 = 0;
    }
    var_369c8734 = 0;
    var_de0d37dd = [[ level._getteamscore ]](#"allies");
    var_3ca13ab7 = [[ level._getteamscore ]](#"axis");
    while (!level.gameended) {
        var_26a35b5a = 0;
        var_3c3c42ba = [];
        round_score_limit = util::get_current_round_score_limit();
        var_7e053979 = function_d11cf8f2(#"allies") + function_d11cf8f2(#"axis");
        if (var_7e053979 == 3 && game.stat[#"teamscores"][#"allies"] == round_score_limit - 1 && game.stat[#"teamscores"][#"axis"] == round_score_limit - 1) {
            level.clampscorelimit = 0;
        }
        var_99ae6589 = function_d11cf8f2(#"allies");
        var_26a35b5a = var_26a35b5a + var_99ae6589;
        if (var_99ae6589) {
            var_3c3c42ba[var_3c3c42ba.size] = #"allies";
            globallogic_score::giveteamscoreforobjective_delaypostprocessing(#"allies", var_99ae6589);
        }
        var_99ae6589 = function_d11cf8f2(#"axis");
        var_26a35b5a = var_26a35b5a + var_99ae6589;
        if (var_99ae6589) {
            var_3c3c42ba[var_3c3c42ba.size] = #"axis";
            globallogic_score::giveteamscoreforobjective_delaypostprocessing(#"axis", var_99ae6589);
        }
        if (var_26a35b5a) {
            globallogic_score::postprocessteamscores(var_3c3c42ba);
        }
        if (var_e0852dc7 && !var_369c8734) {
            winningteam = undefined;
            alliesroundscore = [[ level._getteamscore ]](#"allies") - var_de0d37dd;
            axisroundscore = [[ level._getteamscore ]](#"axis") - var_3ca13ab7;
            if (alliesroundscore >= var_e0852dc7) {
                winningteam = #"allies";
            } else if (axisroundscore >= var_e0852dc7) {
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
                var_369c8734 = 1;
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
            if ((float(timepassed) / 1000 > 120 && var_26a35b5a < 2 || float(timepassed) / 1000 > 300 && var_26a35b5a < 3) && gamemodeismode(0)) {
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
    var_94beea99 = [[ level._getteamscore ]](#"allies");
    scorelimit = level.scorelimit;
    scorethreshold = scorelimit * 0.1;
    scoredif = abs(axisscore - var_94beea99);
    scorethresholdstart = abs(scorelimit - scorethreshold);
    scorelimitcheck = scorelimit - 10;
    if (!isdefined(level.var_6822ecc7)) {
        level.var_6822ecc7 = 0;
    }
    if (!isdefined(level.var_f30df94)) {
        level.var_f30df94 = 0;
    }
    if (var_94beea99 > axisscore) {
        currentscore = var_94beea99;
    } else {
        currentscore = axisscore;
    }
    /#
        if (getdvarint(#"debug_music", 0) > 0) {
            println("<unknown string>" + scoredif);
            println("<unknown string>" + axisscore);
            println("<unknown string>" + var_94beea99);
            println("<unknown string>" + scorelimit);
            println("<unknown string>" + currentscore);
            println("<unknown string>" + scorethreshold);
            println("<unknown string>" + scoredif);
            println("<unknown string>" + scorethresholdstart);
        }
    #/
    if (scoredif <= scorethreshold && scorethresholdstart <= currentscore && level.var_6822ecc7 != 1) {
    }
    var_cb0b2100 = scorelimit * 0.5;
    if (isdefined(level.roundscorelimit)) {
        var_cb0b2100 = level.roundscorelimit * 0.5;
        if (game.roundsplayed == 1) {
            var_cb0b2100 = var_cb0b2100 + level.roundscorelimit;
        }
    }
    if ((axisscore >= var_cb0b2100 || var_94beea99 >= var_cb0b2100) && !level.var_f30df94) {
        level notify(#"sndmusichalfway");
        level.var_f30df94 = 1;
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
        var_e4b6c276 = 0;
        if (!var_e4b6c276 && isdefined(attacker.touchtriggers) && attacker.touchtriggers.size && attacker.pers[#"team"] != victim.pers[#"team"]) {
            var_34bb9c9e = getarraykeys(attacker.touchtriggers);
            domflag = attacker.touchtriggers[var_34bb9c9e[0]].useobj;
            team = attacker.pers[#"team"];
            if (team != domflag.ownerteam) {
                if (!(isdefined(weaponiskillstreak) && weaponiskillstreak)) {
                    scoreevents::processscoreevent(#"hash_30b6b59bf8e87ab0", attacker, victim, weapon);
                }
                attacker challenges::function_2f462ffd(victim, weapon, einflictor, domflag);
                attacker.pers[#"objectiveekia"]++;
                attacker.objectiveekia = attacker.pers[#"objectiveekia"];
                attacker.pers[#"objectives"]++;
                attacker.objectives = attacker.pers[#"objectives"];
                var_e4b6c276 = 1;
            }
        }
        for (index = 0; index < level.flags.size; index++) {
            var_60cb3923 = "invalidTeam";
            var_c9ff0e04 = 0;
            var_a0581c28 = 0;
            var_70f83f4 = 0;
            var_61018b = level.flags[index].origin;
            var_9edfdb98 = level.flags[index].radius * level.flags[index].radius;
            dist = distance2dsquared(victim.origin, var_61018b);
            if (dist < var_9edfdb98) {
                var_c9ff0e04 = 1;
                if (level.flags[index] function_9b06f5c8() == attacker.pers[#"team"] || level.flags[index] function_9b06f5c8() == #"neutral") {
                    var_a0581c28 = 1;
                } else {
                    var_70f83f4 = 1;
                }
            }
            dist = distance2dsquared(attacker.origin, var_61018b);
            if (dist < var_9edfdb98) {
                var_c9ff0e04 = 1;
                if (level.flags[index] function_9b06f5c8() == attacker.pers[#"team"] || level.flags[index] function_9b06f5c8() == #"neutral") {
                    var_a0581c28 = 1;
                } else {
                    var_70f83f4 = 1;
                }
            }
            if (var_c9ff0e04 && isplayer(attacker) && attacker.pers[#"team"] != victim.pers[#"team"]) {
                if (var_70f83f4) {
                    if (!isdefined(attacker.var_d953a3a6)) {
                        attacker.var_d953a3a6 = 0;
                    }
                    attacker.var_d953a3a6++;
                    if (level.var_9f6b22e7 >= attacker.var_d953a3a6) {
                        attacker thread challenges::killedbasedefender(level.flags[index]);
                        if (!var_e4b6c276) {
                            if (!(isdefined(weaponiskillstreak) && weaponiskillstreak)) {
                                scoreevents::processscoreevent(#"killed_defender", attacker, victim, weapon);
                            }
                            attacker challenges::function_2f462ffd(victim, weapon, einflictor, level.flags[index].useobj);
                            attacker.pers[#"objectiveekia"]++;
                            attacker.objectiveekia = attacker.pers[#"objectiveekia"];
                            attacker.pers[#"objectives"]++;
                            attacker.objectives = attacker.pers[#"objectives"];
                            var_e4b6c276 = 1;
                        }
                        victim recordkillmodifier("defending");
                        break;
                    } else {
                        /#
                            attacker iprintlnbold("<unknown string>");
                        #/
                    }
                }
                if (var_a0581c28) {
                    if (!isdefined(attacker.var_23ed24f4)) {
                        attacker.var_23ed24f4 = 0;
                    }
                    attacker thread function_a8515e7d();
                    attacker.var_23ed24f4++;
                    if (level.var_e2719bc9 >= attacker.var_23ed24f4) {
                        attacker.pers[#"defends"]++;
                        attacker.defends = attacker.pers[#"defends"];
                        attacker thread challenges::killedbaseoffender(level.flags[index], weapon, einflictor);
                        attacker recordgameevent("return");
                        attacker challenges::killedzoneattacker(weapon);
                        if (!var_e4b6c276) {
                            if (!(isdefined(weaponiskillstreak) && weaponiskillstreak)) {
                                scoreevents::processscoreevent(#"killed_attacker", attacker, victim, weapon);
                            }
                            attacker challenges::function_2f462ffd(victim, weapon, einflictor, level.flags[index].useobj);
                            attacker.pers[#"objectiveekia"]++;
                            attacker.objectiveekia = attacker.pers[#"objectiveekia"];
                            attacker.pers[#"objectives"]++;
                            attacker.objectives = attacker.pers[#"objectives"];
                            var_e4b6c276 = 1;
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
            var_34bb9c9e = getarraykeys(victim.touchtriggers);
            flag = victim.touchtriggers[var_34bb9c9e[0]].useobj;
            ownerteam = flag.ownerteam;
            team = victim.pers[#"team"];
            if (team != ownerteam) {
                scoreevents::processscoreevent(#"hash_339b0e87303dbd56", attacker, self, weapon);
                var_e4b6c276 = 1;
                if (flag.contested === 1) {
                    attacker function_fd41fc0f(flag, weapon);
                }
            }
        }
        if (var_1cfdf798 && var_e4b6c276 === 1) {
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
        var_34bb9c9e = getarraykeys(victim.touchtriggers);
        domflag = victim.touchtriggers[var_34bb9c9e[0]].useobj;
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
function function_fd41fc0f(flag, weapon) {
    self notify(#"hash_7b9f639422df668a");
    self endon(#"hash_7b9f639422df668a", #"disconnect");
    killtime = gettime();
    playerteam = self.pers[#"team"];
    if (!isdefined(self.var_80220c95)) {
        self.var_80220c95 = 0;
    }
    self.var_80220c95++;
    flag waittill(#"hash_75ccf11c4b9a9faa");
    if (playerteam != self.pers[#"team"] || isdefined(self.spawntime) && killtime < self.spawntime) {
        self.var_80220c95 = 0;
        return;
    }
    if (flag.ownerteam != playerteam && flag.ownerteam != #"neutral") {
        self.var_80220c95 = 0;
        return;
    }
    if (self.var_80220c95 >= 2 && killtime + 200 > gettime()) {
        scoreevents::processscoreevent(#"hash_5d581b2af1ef6338", self, undefined, undefined);
        self challenges::function_e0f51b6f(weapon);
    }
    self.var_80220c95 = 0;
}

// Namespace dom/dom
// Params 0, eflags: 0x1 linked
// Checksum 0x103a4baf, Offset: 0x6948
// Size: 0xae
function function_a8515e7d() {
    self endon(#"disconnect");
    level endon(#"game_ended");
    self notify(#"hash_7251dc00070e3b88");
    self endon(#"hash_7251dc00070e3b88");
    if (!isdefined(self.var_bbef13cd)) {
        self.var_bbef13cd = 0;
    }
    self.var_bbef13cd++;
    wait(4);
    if (self.var_bbef13cd > 1) {
        self challenges::domattackermultikill(self.var_bbef13cd);
    }
    self.var_bbef13cd = 0;
}

// Namespace dom/dom
// Params 1, eflags: 0x1 linked
// Checksum 0x9ac0e941, Offset: 0x6a00
// Size: 0x78
function function_d11cf8f2(team) {
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
function function_9b06f5c8() {
    return self.useobj gameobjects::get_owner_team();
}

// Namespace dom/dom
// Params 0, eflags: 0x1 linked
// Checksum 0x9098ae0d, Offset: 0x6aa8
// Size: 0xf2
function function_c8c3dd4() {
    var_9076b386 = [];
    for (i = 0; i < level.flags.size; i++) {
        for (j = 0; j < level.flags[i].var_5be13778.size; j++) {
            if (level.flags[i].useobj gameobjects::get_owner_team() != level.flags[i].var_5be13778[j].useobj gameobjects::get_owner_team()) {
                var_9076b386[var_9076b386.size] = level.flags[i];
                continue;
            }
        }
    }
    return var_9076b386;
}

// Namespace dom/dom
// Params 1, eflags: 0x0
// Checksum 0x2ed2189c, Offset: 0x6ba8
// Size: 0xea
function function_1c2a2710(team) {
    spawns = [];
    var_9076b386 = function_c8c3dd4();
    for (i = 0; i < var_9076b386.size; i++) {
        if (isdefined(team) && var_9076b386[i] function_9b06f5c8() != team) {
            continue;
        }
        for (j = 0; j < var_9076b386[i].var_f5f7dbd7.size; j++) {
            spawns[spawns.size] = var_9076b386[i].var_f5f7dbd7[j];
        }
    }
    return spawns;
}

// Namespace dom/dom
// Params 1, eflags: 0x0
// Checksum 0x93b89c4a, Offset: 0x6ca0
// Size: 0x12a
function function_be8d05df(var_8cd71845) {
    spawns = [];
    for (i = 0; i < level.flags.size; i++) {
        flag = level.flags[i];
        if (flag == var_8cd71845) {
            continue;
        }
        var_9e7b9572 = 0;
        for (j = 0; j < flag.var_5be13778.size; j++) {
            if (flag.var_5be13778[j] == var_8cd71845) {
                var_9e7b9572 = 1;
                break;
            }
        }
        if (!var_9e7b9572) {
            continue;
        }
        for (j = 0; j < flag.var_f5f7dbd7.size; j++) {
            spawns[spawns.size] = flag.var_f5f7dbd7[j];
        }
    }
    return spawns;
}

// Namespace dom/dom
// Params 1, eflags: 0x0
// Checksum 0xf5489361, Offset: 0x6dd8
// Size: 0x1a0
function function_c7d6480c(team) {
    spawns = [];
    for (i = 0; i < level.flags.size; i++) {
        if (level.flags[i] function_9b06f5c8() == team) {
            for (s = 0; s < level.flags[i].var_f5f7dbd7.size; s++) {
                spawns[spawns.size] = level.flags[i].var_f5f7dbd7[s];
            }
        } else {
            for (j = 0; j < level.flags[i].var_5be13778.size; j++) {
                if (level.flags[i].var_5be13778[j] function_9b06f5c8() == team) {
                    for (s = 0; s < level.flags[i].var_f5f7dbd7.size; s++) {
                        spawns[spawns.size] = level.flags[i].var_f5f7dbd7[s];
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
function function_e48550ac(team) {
    spawns = [];
    for (i = 0; i < level.flags.size; i++) {
        if (level.flags[i] function_9b06f5c8() == team) {
            for (s = 0; s < level.flags[i].var_f5f7dbd7.size; s++) {
                spawns[spawns.size] = level.flags[i].var_f5f7dbd7[s];
            }
        }
    }
    return spawns;
}

// Namespace dom/dom
// Params 0, eflags: 0x1 linked
// Checksum 0xb5dc2bf8, Offset: 0x7060
// Size: 0x5b2
function function_a0ba5429() {
    var_663808fc = [];
    var_859761c0 = getentarray("flag_descriptor", "targetname");
    flags = level.flags;
    for (i = 0; i < level.domflags.size; i++) {
        var_f704c15e = undefined;
        var_21be1101 = undefined;
        for (j = 0; j < var_859761c0.size; j++) {
            dist = distance(flags[i].origin, var_859761c0[j].origin);
            if (!isdefined(var_f704c15e) || dist < var_f704c15e) {
                var_f704c15e = dist;
                var_21be1101 = var_859761c0[j];
            }
        }
        if (!isdefined(var_21be1101)) {
            globallogic_utils::add_map_error("there is no flag_descriptor in the map! see explanation in dom.gsc");
            break;
        }
        if (isdefined(var_21be1101.flag)) {
            globallogic_utils::add_map_error("flag_descriptor with script_linkname "" + var_21be1101.script_linkname + "" is nearby more than one flag; is there a unique descriptor near each flag?");
        } else {
            flags[i].descriptor = var_21be1101;
            var_21be1101.flag = flags[i];
            var_663808fc[var_21be1101.script_linkname] = var_21be1101;
        }
    }
    if (!isdefined(level.maperrors) || level.maperrors.size == 0) {
        for (i = 0; i < flags.size; i++) {
            if (isdefined(flags[i].descriptor.script_linkto)) {
                var_e5614715 = strtok(flags[i].descriptor.script_linkto, " ");
            } else {
                var_e5614715 = [];
            }
            for (j = 0; j < var_e5614715.size; j++) {
                var_e3ed9eb8 = var_663808fc[var_e5614715[j]];
                if (!isdefined(var_e3ed9eb8) || var_e3ed9eb8.targetname != "flag_descriptor") {
                    globallogic_utils::add_map_error("flag_descriptor with script_linkname "" + flags[i].descriptor.script_linkname + "" linked to "" + var_e5614715[j] + "" which does not exist as a script_linkname of any other entity with a targetname of flag_descriptor (or, if it does, that flag_descriptor has not been assigned to a flag)");
                } else {
                    var_1201d702 = var_e3ed9eb8.flag;
                    if (var_1201d702 == flags[i]) {
                        globallogic_utils::add_map_error("flag_descriptor with script_linkname "" + flags[i].descriptor.script_linkname + "" linked to itself");
                    } else {
                        flags[i].var_5be13778[flags[i].var_5be13778.size] = var_1201d702;
                    }
                }
            }
        }
    }
    spawnpoints = spawning::get_spawnpoint_array("mp_dom_spawn");
    for (i = 0; i < spawnpoints.size; i++) {
        if (isdefined(spawnpoints[i].script_linkto)) {
            desc = var_663808fc[spawnpoints[i].script_linkto];
            if (!isdefined(desc) || desc.targetname != "flag_descriptor") {
                globallogic_utils::add_map_error("Spawnpoint at " + spawnpoints[i].origin + "" linked to "" + spawnpoints[i].script_linkto + "" which does not exist as a script_linkname of any entity with a targetname of flag_descriptor (or, if it does, that flag_descriptor has not been assigned to a flag)");
                continue;
            }
            var_bba1cc8c = desc.flag;
        } else {
            var_bba1cc8c = undefined;
            var_f8dd1ef = undefined;
            for (j = 0; j < flags.size; j++) {
                dist = distancesquared(flags[j].origin, spawnpoints[i].origin);
                if (!isdefined(var_bba1cc8c) || dist < var_f8dd1ef) {
                    var_bba1cc8c = flags[j];
                    var_f8dd1ef = dist;
                }
            }
        }
        var_bba1cc8c.var_f5f7dbd7[var_bba1cc8c.var_f5f7dbd7.size] = spawnpoints[i];
    }
    if (globallogic_utils::print_map_errors()) {
        return 0;
    }
}

// Namespace dom/dom
// Params 0, eflags: 0x1 linked
// Checksum 0x885671f5, Offset: 0x7620
// Size: 0x23c
function function_e0f147a1() {
    ss = level.spawnsystem;
    for (var_1b9c46db = 0; var_1b9c46db < level.flags.size; var_1b9c46db++) {
        if (level.domflags[var_1b9c46db] == self) {
            break;
        }
    }
    self.var_1ec646f0 = self influencers::create_influencer("dom_friendly", self.trigger.origin, 0);
    self.var_903e762d = self influencers::create_influencer("dom_neutral", self.trigger.origin, 0);
    self.var_544fd3f0 = self influencers::create_influencer("dom_enemy", self.trigger.origin, 0);
    var_4b91b8a4 = self function_58306805();
    if (isdefined(var_4b91b8a4)) {
        self.var_7f85bfce = self influencers::create_influencer("dom_flag_spawn_friendly", self.trigger.origin, 0);
        function_8b51d4df(self.var_7f85bfce, var_4b91b8a4);
        self.var_b56facb1 = self influencers::create_influencer("dom_flag_spawn_enemy", self.trigger.origin, 0);
        function_8b51d4df(self.var_b56facb1, var_4b91b8a4);
        self.var_b0f6f826 = self influencers::create_influencer("dom_flag_spawn_neutral", self.trigger.origin, 0);
        function_8b51d4df(self.var_b0f6f826, var_4b91b8a4);
    }
    self function_502cc193(#"neutral");
}

// Namespace dom/dom
// Params 1, eflags: 0x1 linked
// Checksum 0xe3edff0f, Offset: 0x7868
// Size: 0x2cc
function function_502cc193(team) {
    /#
        assert(isdefined(self.var_903e762d));
    #/
    /#
        assert(isdefined(self.var_1ec646f0));
    #/
    /#
        assert(isdefined(self.var_544fd3f0));
    #/
    if (team == #"neutral") {
        enableinfluencer(self.var_903e762d, 1);
        enableinfluencer(self.var_1ec646f0, 0);
        enableinfluencer(self.var_544fd3f0, 0);
        if (isdefined(self function_58306805())) {
            enableinfluencer(self.var_b0f6f826, 1);
            enableinfluencer(self.var_7f85bfce, 0);
            enableinfluencer(self.var_b56facb1, 0);
        }
    } else {
        enableinfluencer(self.var_903e762d, 0);
        enableinfluencer(self.var_1ec646f0, 1);
        enableinfluencer(self.var_544fd3f0, 1);
        if (isdefined(self function_58306805())) {
            enableinfluencer(self.var_b0f6f826, 0);
            enableinfluencer(self.var_7f85bfce, 1);
            enableinfluencer(self.var_b56facb1, 1);
            setinfluencerteammask(self.var_7f85bfce, util::getteammask(team));
            setinfluencerteammask(self.var_b56facb1, util::getotherteamsmask(team));
        }
        setinfluencerteammask(self.var_1ec646f0, util::getteammask(team));
        setinfluencerteammask(self.var_544fd3f0, util::getotherteamsmask(team));
    }
}

// Namespace dom/dom
// Params 4, eflags: 0x0
// Checksum 0xb0ac4089, Offset: 0x7b40
// Size: 0x84
function function_7209ab7e(team, var_40d8ea96, var_30d929c0, label) {
    team = util::function_6f4ff113(team);
    otherteam = util::getotherteam(team);
    if (var_40d8ea96 != otherteam) {
        spawning::add_spawn_points(team, var_30d929c0);
    }
}

// Namespace dom/dom
// Params 3, eflags: 0x0
// Checksum 0x28be876c, Offset: 0x7bd0
// Size: 0x74
function function_bde5689e(team, var_40d8ea96, label) {
    otherteam = util::getotherteam(team);
    if (var_40d8ea96 != otherteam) {
        globallogic_spawn::addsupportedspawnpointtype(level.var_e6979a05[label], team);
    }
}

// Namespace dom/dom
// Params 0, eflags: 0x1 linked
// Checksum 0xd96fb32e, Offset: 0x7c50
// Size: 0xf2
function function_c6da4b50() {
    var_eb2cc4dc = level.flags.size;
    var_1d0f3c6c = 0;
    var_3c2575f2 = 0;
    for (i = 0; i < var_eb2cc4dc; i++) {
        var_40d8ea96 = level.flags[i] function_9b06f5c8();
        if (var_40d8ea96 == #"allies") {
            var_1d0f3c6c++;
        } else if (var_40d8ea96 == #"axis") {
            var_3c2575f2++;
        } else {
            return 0;
        }
        if (var_1d0f3c6c > 0 && var_3c2575f2 > 0) {
            return 0;
        }
    }
    return 1;
}

// Namespace dom/dom
// Params 0, eflags: 0x0
// Checksum 0xdc9c6d1c, Offset: 0x7d50
// Size: 0xea
function function_a1411616() {
    var_eb2cc4dc = level.flags.size;
    var_1d0f3c6c = 0;
    var_3c2575f2 = 0;
    for (i = 0; i < var_eb2cc4dc; i++) {
        var_40d8ea96 = level.flags[i] function_9b06f5c8();
        if (var_40d8ea96 == #"allies") {
            var_1d0f3c6c++;
        } else if (var_40d8ea96 == #"axis") {
            var_3c2575f2++;
        }
        if (var_1d0f3c6c > 0 && var_3c2575f2 > 0) {
            return 0;
        }
    }
    return 1;
}

// Namespace dom/dom
// Params 1, eflags: 0x1 linked
// Checksum 0x1959e290, Offset: 0x7e48
// Size: 0x14e
function function_91d77b44(var_277c627b) {
    if (!isdefined(self.var_36cd5e69)) {
        self.var_8bf2fa7 = 0;
        self.var_36cd5e69 = 0;
    }
    if (var_277c627b == #"neutral") {
        return;
    }
    self.var_8bf2fa7++;
    minutespassed = float(globallogic_utils::gettimepassed()) / 60000;
    if (isplayer(self) && isdefined(self.timeplayed[#"total"])) {
        minutespassed = self.timeplayed[#"total"] / 60;
    }
    if ((isdefined(minutespassed) ? minutespassed : 0) > 0) {
        self.var_36cd5e69 = self.var_8bf2fa7 / minutespassed;
    } else {
        self.var_36cd5e69 = self.var_8bf2fa7;
    }
    if (self.var_36cd5e69 > self.var_8bf2fa7) {
        self.var_36cd5e69 = self.var_8bf2fa7;
    }
}

// Namespace dom/dom
// Params 2, eflags: 0x1 linked
// Checksum 0x60d745ff, Offset: 0x7fa0
// Size: 0x62
function function_dacbb6ac(player, flag) {
    if (!level.rankedmatch) {
        return 0;
    }
    if (player.var_36cd5e69 > level.var_26ee7cf) {
        return 1;
    }
    if (flag.var_36cd5e69 > level.var_dc04c27d) {
        return 1;
    }
    return 0;
}

// Namespace dom/dom
// Params 1, eflags: 0x1 linked
// Checksum 0x52f5c8b1, Offset: 0x8010
// Size: 0xa6
function function_8c50d606(sentient) {
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
function function_df79c725() {
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
            self notify(#"hash_75ccf11c4b9a9faa");
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

