// Atian COD Tools GSC decompiler test
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\rank_shared.gsc;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\killcam_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace potm;

// Namespace potm/potm_shared
// Params 0, eflags: 0x2
// Checksum 0x72fff11d, Offset: 0x218
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"potm", &__init__, undefined, undefined);
}

// Namespace potm/potm_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x64fba532, Offset: 0x260
// Size: 0x3e
function __init__() {
    callback::on_start_gametype(&init);
    level.var_abb3fd2 = &event_bookmark;
}

// Namespace potm/potm_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x7cc92a4d, Offset: 0x2a8
// Size: 0xc6
function function_d71338e4() {
    if (isdefined(game.var_5d3e5c4e)) {
        return;
    }
    game.highlightreelinfodefines = gethighlightreelinfodefines();
    game.var_b9a7e65f = 0;
    for (i = 0; i < game.highlightreelinfodefines.size; i++) {
        info = game.highlightreelinfodefines[i];
        if (info.secondsbefore > game.var_b9a7e65f) {
            game.var_b9a7e65f = info.secondsbefore;
        }
    }
    game.var_5d3e5c4e = 1;
}

// Namespace potm/potm_shared
// Params 0, eflags: 0x5 linked
// Checksum 0x8aa5e53d, Offset: 0x378
// Size: 0x4a4
function private init() {
    if (!isdefined(game.var_ab39640b)) {
        game.potm_enabled = getgametypesetting(#"allowplayofthematch");
        if (!game.potm_enabled) {
            level.var_abb3fd2 = undefined;
            return;
        }
        game.potm_max_events = getgametypesetting(#"maxplayofthematchevents");
        game.var_c7a2645f = getgametypesetting(#"hash_567db38226658dbf");
        game.var_3a859f59 = getgametypesetting(#"hash_62a4fd40810cb61");
        game.var_94fe2d81 = getgametypesetting(#"hash_4a6ef8940f4cbb83");
        game.var_659f084a = getgametypesetting(#"hash_6881c7cab0dcef39");
        game.var_50b05a28 = getgametypesetting(#"hash_7c0dcff6ffb1e348");
        game.var_6bd02863 = getgametypesetting(#"hash_4f4a73f236278ba8");
        game.var_691bbcd2 = getgametypesetting(#"hash_7c0acf14fb1f4080");
        function_f6b119c7();
        game.var_c7826a3f = getgametypesetting(#"hash_6269eb986d22cd37");
        game.var_b924522a = getgametypesetting(#"hash_6e2abf2cc40e03f1");
        game.var_aafe322f = [];
        game.var_12ffe1e3 = [];
        game.potmevents = [];
        game.var_8ea529d1 = #"potm";
        /#
            debuginit();
        #/
        if (sessionmodeismultiplayergame()) {
            game.var_4afb166c = &function_e6c9822f;
            game.var_2e431430 = &function_20422a1a;
            game.var_94f3e5d2 = &function_c65274ed;
            game.var_321b0d80 = &function_43690387;
            game.highlightreelprofileweighting = function_f2f9ce22();
            game.var_701e85bf = 1;
            game.var_8581b2bd = 1;
        } else if (sessionmodeiszombiesgame()) {
            game.var_4afb166c = &function_5570c594;
            game.var_2e431430 = &function_34576c1;
            game.var_94f3e5d2 = &function_d34511e6;
            game.var_321b0d80 = undefined;
            game.var_8581b2bd = 0;
        } else {
            game.var_4afb166c = &function_3ca7924f;
            game.var_2e431430 = &e_target_1;
            game.var_94f3e5d2 = &function_66bbf824;
            game.var_321b0d80 = undefined;
            game.var_8581b2bd = 0;
        }
        game.var_fc393bcd = [];
        game.var_b2ee45db = [];
        game.var_ab39640b = 1;
        game.var_1d3545e = undefined;
    } else {
        function_1cffcfda();
    }
    function_d71338e4();
    game.var_fb8365e0 = util::getroundsplayed();
    level.var_e99fd3d1 = 0;
    thread function_bc21fc81();
    if (isdefined(game.var_1d3545e)) {
        [[ game.var_1d3545e ]]();
    }
}

// Namespace potm/potm_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xafe21ece, Offset: 0x828
// Size: 0x24
function forceinit() {
    game.var_ab39640b = undefined;
    init();
}

// Namespace potm/potm_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x6c320eb7, Offset: 0x858
// Size: 0x20
function isenabled() {
    return isdefined(game.potm_enabled) && game.potm_enabled;
}

// Namespace potm/potm_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x28f03997, Offset: 0x880
// Size: 0x62
function function_1cffcfda() {
    if (!isenabled()) {
        return;
    }
    for (eventindex = 0; eventindex < game.potmevents.size; eventindex++) {
        removepotmevent(eventindex);
    }
    game.potmevents = [];
}

// Namespace potm/potm_shared
// Params 0, eflags: 0x0
// Checksum 0xf88b22ab, Offset: 0x8f0
// Size: 0x46
function function_3438c1f4() {
    if (!isenabled()) {
        return;
    }
    game.potm_max_events = getgametypesetting(#"maxplayofthematchevents");
}

// Namespace potm/potm_shared
// Params 1, eflags: 0x0
// Checksum 0x7681eba3, Offset: 0x940
// Size: 0x6e
function function_80cdf4b2(maxevents) {
    if (!isenabled() || !isdefined(game.potm_max_events)) {
        return;
    }
    if (maxevents < getgametypesetting(#"maxplayofthematchevents")) {
        game.potm_max_events = maxevents;
    }
}

// Namespace potm/potm_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x4855114a, Offset: 0x9b8
// Size: 0x2e
function function_f6b119c7() {
    if (!isenabled()) {
        return;
    }
    game.var_701e85bf = !game.var_50b05a28;
}

// Namespace potm/potm_shared
// Params 1, eflags: 0x0
// Checksum 0x7a8e0eb8, Offset: 0x9f0
// Size: 0x2e
function function_734a7d24(var_ad074e3a) {
    if (!isenabled()) {
        return;
    }
    game.var_701e85bf = var_ad074e3a;
}

// Namespace potm/potm_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x1ce50380, Offset: 0xa28
// Size: 0x1e
function function_ec01de3() {
    if (!isenabled()) {
        return 0;
    }
    return 1;
}

// Namespace potm/potm_shared
// Params 1, eflags: 0x5 linked
// Checksum 0x687ddbd6, Offset: 0xa50
// Size: 0x6c
function private getclientname(clientent) {
    if (!isdefined(clientent)) {
        return "N/A";
    }
    if (isdefined(clientent.name)) {
        return clientent.name;
    }
    cliententnum = clientent getentitynumber();
    return "N/A [" + cliententnum + "]";
}

// Namespace potm/potm_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x9a41e4b2, Offset: 0xac8
// Size: 0x232
function function_c7e98e25(preparinginformation) {
    currentevent = preparinginformation.currentevent;
    var_1be0f2c3 = "N/A";
    if (!isdefined(currentevent)) {
        return var_1be0f2c3;
    }
    if (!isdefined(currentevent.killcamparams)) {
        if (isdefined(preparinginformation.clientnum)) {
            foreach (player in level.players) {
                if (player getentitynumber() == preparinginformation.clientnum) {
                    var_1be0f2c3 = getclientname(player);
                    var_1be0f2c3 = var_1be0f2c3 + " (KillcamParams: N/A)";
                }
            }
        }
        return var_1be0f2c3;
    }
    killcamparams = currentevent.killcamparams;
    attackername = "N/A";
    spectatorclientnum = "N/A";
    if (isdefined(killcamparams.attacker) && isdefined(killcamparams.attacker.name)) {
        attackername = killcamparams.attacker.name;
    }
    var_1be0f2c3 = attackername + " {" + spectatorclientnum + "}";
    if (isdefined(killcamparams.weapon)) {
        var_1be0f2c3 = var_1be0f2c3 + " Weapon: " + killcamparams.weapon.name;
    }
    if (isdefined(killcamparams.meansofdeath)) {
        var_1be0f2c3 = var_1be0f2c3 + " MoD: " + killcamparams.meansofdeath;
    }
    return var_1be0f2c3;
}

// Namespace potm/potm_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x2a7116f7, Offset: 0xd08
// Size: 0x23c
function function_b5433e55(bookmark) {
    if (!game.var_8581b2bd) {
        return;
    }
    var_cef89b92 = {};
    var_cef89b92.round = game.var_fb8365e0;
    var_cef89b92.name = bookmark.bookmarkname;
    var_cef89b92.time = bookmark.time;
    var_cef89b92.isfirstperson = bookmark.isfirstperson;
    var_cef89b92.infoindex = bookmark.var_900768bc.index;
    var_cef89b92.var_fddbd3ce = bookmark.var_900768bc.id;
    var_cef89b92.mainclientnum = bookmark.mainclientnum;
    var_cef89b92.var_9b2cab54 = getclientname(bookmark.var_81538b15);
    var_cef89b92.otherclientnum = bookmark.otherclientnum;
    var_cef89b92.var_3b8a36fd = getclientname(bookmark.var_f28fb772);
    var_cef89b92.scoreaddition = bookmark.scoreaddition;
    var_cef89b92.scoremultiplier = bookmark.scoremultiplier;
    var_cef89b92.scoreeventpriority = bookmark.scoreeventpriority;
    var_cef89b92.inflictorentnum = bookmark.inflictorentnum;
    var_cef89b92.inflictorenttype = bookmark.inflictorenttype;
    var_cef89b92.overrideentitycamera = bookmark.overrideentitycamera;
    var_cef89b92.tableindex = bookmark.eventdata.tableindex;
    var_cef89b92.var_96db1aff = bookmark.eventdata.var_96db1aff;
    function_92d1707f(#"hash_4782850b19da4089", var_cef89b92);
}

// Namespace potm/potm_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x26045c6d, Offset: 0xf50
// Size: 0x1ec
function function_b5633c73(preparinginformation) {
    if (!game.var_8581b2bd) {
        return;
    }
    if (!isdefined(preparinginformation) || !isdefined(preparinginformation.currentevent)) {
        return;
    }
    duration = preparinginformation.currentevent.endtime - preparinginformation.currentevent.starttime;
    var_dd06123 = {};
    var_dd06123.round = game.var_fb8365e0;
    var_dd06123.clientnum = preparinginformation.clientnum;
    var_dd06123.infoindex = preparinginformation.currentevent.infoindex;
    var_dd06123.var_fddbd3ce = preparinginformation.currentevent.var_f130571c;
    var_dd06123.isfirstperson = preparinginformation.currentevent.var_1be950f5;
    var_dd06123.starttime = preparinginformation.currentevent.starttime;
    var_dd06123.endtime = preparinginformation.currentevent.endtime;
    var_dd06123.duration = duration;
    var_dd06123.priority = int(preparinginformation.currentevent.priority);
    var_dd06123.occurrencecount = preparinginformation.var_e567d17;
    var_dd06123.killcamparams = function_c7e98e25(preparinginformation);
    function_92d1707f(#"hash_83a3293e7437420", var_dd06123);
}

// Namespace potm/potm_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x61827305, Offset: 0x1148
// Size: 0x6c
function post_round_potm() {
    if (!function_ec01de3()) {
        /#
            println("<unknown string>");
        #/
        return;
    }
    /#
        println("<unknown string>");
    #/
    level function_b6a5e7fa();
}

// Namespace potm/potm_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x14ea11e1, Offset: 0x11c0
// Size: 0x176
function function_b0bc26b3(deathtime, starttime) {
    self endon(#"disconnect", #"end_killcam");
    var_a7e16ed3 = deathtime - starttime;
    waitbeforedeath = 1;
    timetowait = max(0, float(var_a7e16ed3) / 1000 - waitbeforedeath);
    game.var_a1e9e96a = gettime() + timetowait * 1000;
    wait(timetowait);
    util::setclientsysstate("levelNotify", "sndFKsl");
    self playlocalsound(#"hash_96a5f3e5e8749c6");
    setslowmotion(1, 0.25, waitbeforedeath);
    wait(waitbeforedeath);
    self playlocalsound(#"hash_38072640bdeb5b48");
    setslowmotion(0.25, 1, 1);
    game.var_a1e9e96a = undefined;
}

// Namespace potm/potm_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xb3195e12, Offset: 0x1340
// Size: 0x3fa
function function_f909006c(currentevent) {
    self endon(#"disconnect", #"end_killcam");
    if (!isdefined(currentevent.var_b86d6c40)) {
        return;
    }
    if (currentevent.var_b86d6c40.size <= 0) {
        return;
    }
    currenttime = gettime();
    starttime = currentevent.starttime;
    var_dcbc5c97 = arraycopy(currentevent.var_b86d6c40);
    luinotifyevent(#"clear_notification_queue");
    while (1) {
        waitframe(1);
        if (var_dcbc5c97.size <= 0) {
            break;
        }
        index = 0;
        timeelapsed = gettime() - currenttime;
        do {
            var_e0aa3530 = var_dcbc5c97[index];
            if (var_e0aa3530.time - starttime < timeelapsed) {
                if (var_e0aa3530.bookmarkname == #"medal") {
                    medalstruct = {};
                    medalstruct.medal_index = var_e0aa3530.eventdata.tableindex;
                    if (!util::function_8570168d() && isdefined(medalstruct.medal_index)) {
                        luinotifyevent(#"medal_received", 1, medalstruct.medal_index);
                    }
                } else if (var_e0aa3530.bookmarkname == #"score_event") {
                    if (isdefined(var_e0aa3530.eventdata.var_96db1aff)) {
                        label = rank::getscoreinfolabel(var_e0aa3530.eventdata.var_96db1aff);
                        score = rank::getscoreinfovalue(var_e0aa3530.eventdata.var_96db1aff);
                        combatefficiencyscore = rank::function_4587103(var_e0aa3530.eventdata.var_96db1aff);
                        eventindex = level.scoreinfo[var_e0aa3530.eventdata.var_96db1aff][#"row"];
                    } else {
                        label = var_e0aa3530.eventdata.label;
                        score = var_e0aa3530.eventdata.score;
                        combatefficiencyscore = var_e0aa3530.eventdata.combatefficiencyscore;
                        eventindex = var_e0aa3530.eventdata.eventindex;
                    }
                    if (!isdefined(label)) {
                        label = #"hash_480234a872bd64ac";
                    }
                    if (!isdefined(score)) {
                        score = 0;
                    }
                    if (!isdefined(combatefficiencyscore)) {
                        combatefficiencyscore = 0;
                    }
                    if (!isdefined(eventindex)) {
                        eventindex = 1;
                    }
                    luinotifyevent(#"score_event", 4, label, score, combatefficiencyscore, eventindex);
                }
                array::pop(var_dcbc5c97, index, 0);
            } else {
                index++;
            }
        } while(index < var_dcbc5c97.size);
    }
}

// Namespace potm/potm_shared
// Params 1, eflags: 0x5 linked
// Checksum 0x56ad8d85, Offset: 0x1748
// Size: 0x562
function private play_potm_on_player_internal(event) {
    killcamparams = event.currentevent.killcamparams;
    var_f92eaa56 = isdefined(killcamparams) && !event.currentevent.var_1be950f5;
    if (var_f92eaa56) {
        var_900768bc = function_876f528(event.currentevent.infoindex);
        killcamentitystarttime = killcam::get_killcam_entity_info_starttime(killcamparams.killcam_entity_info);
        killcamoffset = float(gettime() - event.currentevent.starttime) / 1000;
        killcamlength = float(event.currentevent.endtime - event.currentevent.starttime) / 1000 - 0.05;
        killcamstarttime = event.currentevent.starttime;
        spectatorclient = killcamparams.spectatorclientnum;
        var_1c66b97d = killcamparams.var_1c66b97d;
        targetentityindex = killcamparams.targetentityindex;
        offsettime = killcamparams.offsettime;
    } else {
        var_900768bc = function_876f528(event.currentevent.infoindex);
        killcamoffset = float(gettime() - event.currentevent.starttime) / 1000;
        killcamlength = float(event.currentevent.endtime - event.currentevent.starttime) / 1000;
        spectatorclient = event.clientnum;
        var_1c66b97d = event.clientxuid;
        targetentityindex = -1;
        offsettime = 0;
    }
    self notify(#"begin_killcam", {#start_time:gettime()});
    self.sessionstate = "spectator";
    self.spectatorclient = spectatorclient;
    self.var_1c66b97d = var_1c66b97d;
    self.killcamentity = -1;
    if (var_f92eaa56) {
        self thread killcam::set_killcam_entities(killcamparams.killcam_entity_info, killcamstarttime);
        self.killcamweapon = killcamparams.weapon;
        self.killcammod = killcamparams.meansofdeath;
    }
    self.killcamtargetentity = targetentityindex;
    self.archivetime = killcamoffset;
    self.killcamlength = killcamlength;
    self.psoffsettime = offsettime;
    foreach (team, _ in level.teams) {
        self allowspectateteam(team, 1);
    }
    self allowspectateteam("freelook", 1);
    self allowspectateteam(#"none", 1);
    self callback::function_d8abfc3d(#"on_end_game", &killcam::function_f5f2d8e6);
    waitframe(1);
    self thread killcam::check_for_abrupt_end();
    self.killcam = 1;
    self thread killcam::wait_killcam_time();
    if (var_f92eaa56) {
        if (game.var_701e85bf) {
            self thread function_b0bc26b3(killcamparams.deathtime, killcamstarttime);
        }
    } else if (isdefined(var_900768bc)) {
        if (game.var_701e85bf) {
            self thread function_b0bc26b3(event.currentevent.endtime - var_900768bc.secondsafter, event.currentevent.starttime);
        }
    }
    self waittill(#"end_killcam");
}

// Namespace potm/potm_shared
// Params 1, eflags: 0x5 linked
// Checksum 0x8d21d1ba, Offset: 0x1cb8
// Size: 0x14c
function private play_potm_on_player(event) {
    self endon(#"disconnect");
    level endon(#"game_ended");
    if (isdefined(game.var_321b0d80)) {
        self [[ game.var_321b0d80 ]](event.clientxuid);
    }
    var_f699686a = #"melee_amuletfist_t8";
    hide_event = 0;
    killcamparams = event.currentevent.killcamparams;
    if (isdefined(killcamparams)) {
        if (killcamparams.weapon.name == var_f699686a) {
            hide_event = 1;
            /#
                println("<unknown string>");
            #/
        }
    }
    if (!hide_event) {
        play_potm_on_player_internal(event);
    }
    self val::set(#"potm", "freezecontrols");
    self killcam::end(1);
}

// Namespace potm/potm_shared
// Params 0, eflags: 0x0
// Checksum 0xa22823e1, Offset: 0x1e10
// Size: 0x24
function function_afe21831() {
    if (!isenabled()) {
        return 0;
    }
    return game.potmevents.size;
}

// Namespace potm/potm_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x752a78f0, Offset: 0x1e40
// Size: 0x108
function function_cd1447ce() {
    self endon(#"disconnect");
    level endon(#"game_ended", #"potm_finished");
    while (1) {
        waitresult = undefined;
        waitresult = self waittill(#"menuresponse");
        menu = waitresult.menu;
        response = waitresult.response;
        if (menu == "PlayOfTheMatchWidget") {
            if (isplayer(self) && response == "voteSkip") {
                self.var_3211ad9b = 1;
                self clientfield::set_player_uimodel("hudItems.voteKillcamSkip", 1);
                return;
            }
        }
        waitframe(1);
    }
}

// Namespace potm/potm_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x50b95668, Offset: 0x1f50
// Size: 0x2ee
function function_a76f0a49() {
    level endon(#"game_ended", #"potm_finished");
    numplayers = 0;
    foreach (player in level.players) {
        if (!isbot(player)) {
            numplayers++;
        }
    }
    var_a818d531 = numplayers;
    foreach (player in level.players) {
        player clientfield::set_player_uimodel("hudItems.voteRequired", var_a818d531);
    }
    while (1) {
        var_927f9075 = 0;
        foreach (player in level.players) {
            if (isdefined(player.var_3211ad9b) && player.var_3211ad9b) {
                var_927f9075++;
            }
        }
        foreach (player in level.players) {
            player clientfield::set_player_uimodel("hudItems.voteCommitted", var_927f9075);
        }
        waitframe(1);
        music::setmusicstate("none");
        if (var_927f9075 >= var_a818d531) {
            foreach (player in level.players) {
                player killcam::function_875fc588();
            }
            return;
        }
    }
}

// Namespace potm/potm_shared
// Params 0, eflags: 0x0
// Checksum 0xbebca8b4, Offset: 0x2248
// Size: 0xdc
function function_449c210c() {
    foreach (player in level.players) {
        player.var_3211ad9b = 0;
        player clientfield::set_player_uimodel("hudItems.voteKillcamSkip", 0);
        if (!isbot(player)) {
            player thread function_cd1447ce();
        }
    }
    level thread function_a76f0a49();
}

// Namespace potm/potm_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xa52ed73e, Offset: 0x2330
// Size: 0xc4
function function_65839288(event) {
    if (!isdefined(event.currentevent.var_c79756c4)) {
        return;
    }
    /#
        println("<unknown string>" + event.currentevent.var_c79756c4 + "<unknown string>" + event.currentevent.var_ccfb7703 + "<unknown string>");
    #/
    level util::create_streamer_hint(event.currentevent.var_c79756c4, event.currentevent.var_ccfb7703, 0.9);
}

// Namespace potm/potm_shared
// Params 1, eflags: 0x5 linked
// Checksum 0x288fa4de, Offset: 0x2400
// Size: 0x3e
function private function_caf394b8(duration) {
    if (!isdefined(game.var_a1e9e96a)) {
        return 1;
    }
    if (gettime() + duration < game.var_a1e9e96a) {
        return 1;
    }
    return 0;
}

// Namespace potm/potm_shared
// Params 1, eflags: 0x5 linked
// Checksum 0x52d42541, Offset: 0x2448
// Size: 0x5ae
function private function_60211cf4(sequence) {
    level endon(#"potm_finished", #"game_ended");
    /#
        assert(sequence.params.events.size > 0);
    #/
    starttimescale = 1;
    if (sequence.isintro) {
        playsoundatposition(#"hash_3fb775afd7e025dc", (0, 0, 0));
        music::setmusicstate("none");
    }
    cameraindex = 0;
    currenttime = gettime();
    var_aa5d1f5b = 0;
    currenttimescale = starttimescale;
    if (isdefined(sequence.var_aa5d1f5b)) {
        var_aa5d1f5b = sequence.var_aa5d1f5b;
    }
    do {
        event = sequence.params.events[cameraindex];
        processevent = 1;
        if (isdefined(event.cameraname) && event.cameraname == #"hash_520dfab6dc8b7832") {
            level thread function_d1cb3471();
        }
        if (var_aa5d1f5b > 0) {
            if (var_aa5d1f5b >= event.duration) {
                var_aa5d1f5b = var_aa5d1f5b - event.duration;
                processevent = 0;
            } else {
                event.duration = event.duration - var_aa5d1f5b;
                var_aa5d1f5b = 0;
            }
        }
        if (event.luievent != "") {
            luinotifyevent(event.luievent);
        }
        if (processevent) {
            foreach (player in level.players) {
                cmd = 1;
                if (cameraindex == 0 && game.var_142de1de == 0) {
                    goto_btapi_refillammoifneededservice = [[ game.var_94f3e5d2 ]]();
                } else {
                    goto_btapi_refillammoifneededservice = 0;
                }
                if (goto_btapi_refillammoifneededservice > 0) {
                    cmd = cmd | 4;
                }
                if (isdefined(sequence.var_50c26ba) && sequence.var_50c26ba > 0) {
                    var_fa042c40 = sequence.var_50c26ba;
                    /#
                        println("<unknown string>" + var_fa042c40 + "<unknown string>");
                    #/
                } else if (isdefined(sequence.inflictorentnum)) {
                    var_fa042c40 = sequence.inflictorentnum;
                    /#
                        println("<unknown string>" + var_fa042c40 + "<unknown string>");
                    #/
                } else {
                    /#
                        println("<unknown string>");
                    #/
                    var_fa042c40 = 0;
                }
                player function_705598e4(cmd, sequence.infoindex, sequence.var_9806ad5a, cameraindex, sequence.params.events[cameraindex].postfxtype, goto_btapi_refillammoifneededservice, var_fa042c40);
            }
            game.var_142de1de = 0;
            if (cameraindex > 0) {
                starttimescale = sequence.params.events[cameraindex - 1].timescale;
            } else {
                starttimescale = 1;
            }
            currenttimescale = event.timescale;
            if (function_caf394b8(event.duration)) {
                setslowmotion(starttimescale, currenttimescale, event.duration);
            }
            wait(event.duration);
        }
        cameraindex++;
    } while(cameraindex < sequence.params.events.size);
    level thread function_d1cb3471();
    if (function_caf394b8(0)) {
        setslowmotion(currenttimescale, 1, 0);
    }
    timeelapsed = float(gettime() - currenttime) / 1000;
    if (sequence.duration > timeelapsed) {
        wait(sequence.duration - timeelapsed);
    }
}

// Namespace potm/potm_shared
// Params 0, eflags: 0x5 linked
// Checksum 0x34087137, Offset: 0x2a00
// Size: 0x80
function private function_e6934aaa() {
    foreach (player in level.players) {
        player function_eb0dd56(0);
    }
}

// Namespace potm/potm_shared
// Params 3, eflags: 0x5 linked
// Checksum 0xe408586b, Offset: 0x2a88
// Size: 0x9a
function private function_404ffafb(var_353e7913, var_550d79fc, var_19e3f5ac) {
    var_6e17bdac = {};
    var_6e17bdac.starttime = var_550d79fc;
    var_6e17bdac.endtime = var_19e3f5ac;
    var_6e17bdac.duration = float(var_6e17bdac.endtime - var_6e17bdac.starttime) / 1000;
    var_6e17bdac.var_cef682cb = 1;
    return var_6e17bdac;
}

// Namespace potm/potm_shared
// Params 2, eflags: 0x5 linked
// Checksum 0x46fb2ae7, Offset: 0x2b30
// Size: 0xacc
function private function_b1b3bfc5(event, var_50c26ba) {
    level endon(#"potm_finished", #"game_ended");
    if (!game.var_50b05a28) {
        return;
    }
    if (!isdefined(event.currentevent.var_ccda367c) || event.currentevent.var_ccda367c.size <= 0) {
        return;
    }
    artillery_mus_crowd_bossbattle = event.currentevent.var_ccda367c;
    var_353e7913 = [];
    var_550d79fc = undefined;
    var_5d6aaf90 = 0;
    isintro = 1;
    do {
        var_a73108fa = artillery_mus_crowd_bossbattle[var_5d6aaf90];
        infoindex = var_a73108fa.infoindex;
        var_900768bc = function_876f528(infoindex);
        result = function_211b7237(infoindex, isintro);
        if (isdefined(result)) {
            params = function_66aa4b70(infoindex, result.var_9806ad5a);
            if (isdefined(params)) {
                sequence = {};
                duration = 0;
                foreach (var_67d7854 in params.events) {
                    duration = duration + abs(var_67d7854.duration);
                }
                duration = duration * 1000;
                if (isintro) {
                    sequence.starttime = event.currentevent.starttime;
                } else {
                    /#
                        assert(params.events.size > 0);
                    #/
                    var_d0382a1f = params.events[0].lerp_duration;
                    var_fe39cea0 = params.events[0].duration;
                    if (var_d0382a1f < 0) {
                        var_fe39cea0 = var_fe39cea0 + var_d0382a1f;
                    }
                    if (var_fe39cea0 < 0) {
                        sequence.starttime = var_a73108fa.time + var_fe39cea0 * 1000;
                        if (params.events.size <= 1) {
                            params.events[0].duration = abs(var_fe39cea0);
                        } else {
                            var_bbc632fa = var_fe39cea0;
                            for (eventindex = 1; eventindex < params.events.size; eventindex++) {
                                var_7acd420d = params.events[eventindex].lerp_duration;
                                if (var_7acd420d < 0) {
                                    params.events[eventindex - 1].duration = abs(var_bbc632fa - params.events[eventindex].duration - var_7acd420d);
                                    var_bbc632fa = params.events[eventindex].duration + var_7acd420d;
                                } else {
                                    params.events[eventindex - 1].duration = abs(var_bbc632fa - params.events[eventindex].duration);
                                    var_bbc632fa = params.events[eventindex].duration;
                                }
                            }
                            params.events[params.events.size - 1].duration = 0;
                        }
                    } else {
                        sequence.starttime = var_a73108fa.time;
                        if (var_d0382a1f < 0) {
                            sequence.starttime = var_a73108fa.time + var_d0382a1f * 1000;
                        }
                    }
                }
                sequence.var_50c26ba = var_50c26ba;
                sequence.mainclientnum = var_a73108fa.mainclientnum;
                sequence.otherclientnum = var_a73108fa.otherclientnum;
                sequence.inflictorentnum = var_a73108fa.inflictorentnum;
                /#
                    println("<unknown string>" + sequence.var_50c26ba + "<unknown string>");
                #/
                sequence.endtime = min(sequence.starttime + duration, event.currentevent.endtime);
                sequence.params = params;
                sequence.isintro = isintro;
                sequence.infoindex = infoindex;
                sequence.var_9806ad5a = result.var_9806ad5a;
                sequence.duration = float(sequence.endtime - sequence.starttime) / 1000;
                addsequence = 1;
                if (isdefined(var_550d79fc)) {
                    if (var_550d79fc >= sequence.starttime) {
                        if (var_550d79fc >= sequence.endtime) {
                            addsequence = 0;
                            /#
                                println("<unknown string>" + var_5d6aaf90 + "<unknown string>" + var_550d79fc + "<unknown string>" + sequence.starttime + "<unknown string>" + var_353e7913.size + "<unknown string>" + sequence.starttime + "<unknown string>" + sequence.endtime + "<unknown string>" + infoindex + "<unknown string>" + isintro + "<unknown string>" + result.var_9806ad5a + "<unknown string>");
                            #/
                        } else {
                            sequence.var_aa5d1f5b = float(var_550d79fc - sequence.starttime) / 1000;
                        }
                    } else {
                        var_6e17bdac = function_404ffafb(var_353e7913, var_550d79fc, sequence.starttime);
                        /#
                            println("<unknown string>" + var_353e7913.size + "<unknown string>" + var_6e17bdac.starttime + "<unknown string>" + var_6e17bdac.endtime + "<unknown string>");
                        #/
                        array::add(var_353e7913, var_6e17bdac);
                    }
                }
                if (addsequence) {
                    /#
                        println("<unknown string>" + var_353e7913.size + "<unknown string>" + sequence.starttime + "<unknown string>" + sequence.endtime + "<unknown string>" + infoindex + "<unknown string>" + isintro + "<unknown string>" + result.var_9806ad5a + "<unknown string>");
                    #/
                    var_550d79fc = sequence.endtime;
                    array::add(var_353e7913, sequence);
                }
                goto LOC_0000091e;
            }
        LOC_0000091e:
            goto LOC_00000922;
        }
    LOC_00000922:
        if (isintro) {
            isintro = 0;
        } else {
            var_5d6aaf90++;
        }
    } while(var_5d6aaf90 < artillery_mus_crowd_bossbattle.size);
    if (isdefined(var_550d79fc) && var_550d79fc < event.currentevent.endtime) {
        var_6e17bdac = function_404ffafb(var_353e7913, var_550d79fc, event.currentevent.endtime);
        /#
            println("<unknown string>" + var_353e7913.size + "<unknown string>" + var_6e17bdac.starttime + "<unknown string>" + var_6e17bdac.endtime + "<unknown string>");
        #/
        array::add(var_353e7913, var_6e17bdac);
    }
    foreach (sequence in var_353e7913) {
        if (isdefined(sequence.var_cef682cb) && sequence.var_cef682cb == 1) {
            wait(sequence.duration);
        } else {
            function_60211cf4(sequence);
        }
    }
    function_e6934aaa();
    luinotifyevent(#"hash_5bcad2526c42e308");
}

// Namespace potm/potm_shared
// Params 1, eflags: 0x5 linked
// Checksum 0xa7ad0396, Offset: 0x3608
// Size: 0x94
function private function_a85adb2c(delta) {
    self endon(#"end_killcam", #"hash_17418db31d60118f");
    time = gettime();
    delta = delta - 300;
    if (delta > 0) {
        wait(float(delta) / 1000);
    }
    luinotifyevent(#"post_potm_transition");
}

// Namespace potm/potm_shared
// Params 1, eflags: 0x0
// Checksum 0x220b5c65, Offset: 0x36a8
// Size: 0x8c
function play_potm(repeatcount) {
    if (isdefined(level.var_869c7fba) && level.var_869c7fba) {
        return;
    }
    level.var_869c7fba = 1;
    /#
        println("<unknown string>");
    #/
    level waittill(#"play_potm");
    function_b6a5e7fa(repeatcount);
}

// Namespace potm/potm_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x47d7363f, Offset: 0x3740
// Size: 0x954
function function_b6a5e7fa(repeatcount = 1) {
    function_bbbd20cc(1);
    function_f19228da();
    if (game.potmevents.size == 0) {
        /#
            println("<unknown string>");
        #/
        level notify(#"potm_finished");
        /#
            println("<unknown string>");
        #/
        level.var_869c7fba = 0;
        return;
    }
    if (isdefined(game.potmevents[0]) && isdefined(game.potmevents[0].clientnum)) {
        luinotifyevent(#"potm_client", 1, game.potmevents[0].clientnum);
    }
    level function_65839288(game.potmevents[0]);
    setslowmotion(1, 1, 0);
    level.infinalkillcam = 1;
    if (util::waslastround()) {
        setmatchflag("round_end_killcam", 0);
    }
    visionsetnaked("default", 0);
    setmatchflag("potm", 1);
    luinotifyevent(#"pre_potm_transition");
    level notify(#"pre_potm");
    wait(0.25);
    exit = 0;
    count = 0;
    game.var_142de1de = 1;
    while (!exit && count < repeatcount) {
        /#
            println("<unknown string>" + count + "<unknown string>");
        #/
        for (eventindex = 0; eventindex < game.potmevents.size && !exit; eventindex++) {
            event = game.potmevents[eventindex];
            var_50c26ba = 0;
            if (isdefined(event.currentevent.killcamparams)) {
                killcamparams = event.currentevent.killcamparams;
                if (!isdefined(killcamparams.targetentityindex)) {
                    continue;
                } else {
                    var_50c26ba = killcamparams.targetentityindex;
                }
                attacker = killcamparams.attacker;
                jumpiffalse(isdefined(attacker) && isdefined(attacker.archetype) && attacker.archetype == "mannequin") LOC_000003e4;
            } else {
            LOC_000003e4:
                /#
                    println("<unknown string>" + eventindex + "<unknown string>" + game.potmevents.size + "<unknown string>");
                #/
                level function_65839288(event);
                startplayofthematch(eventindex);
                thread function_b1b3bfc5(event, var_50c26ba);
                level.var_5e18ae78 = eventindex;
                level notify(#"potm_selected");
                foreach (player in level.players) {
                    player setclientuivisibilityflag("hud_visible", 1);
                    player luinotifyevent(#"potm_fadeout");
                }
                waitframe(1);
                thread function_a85adb2c(event.currentevent.endtime - event.currentevent.starttime);
                level notify(#"hash_4ead2cd3fa59f29b");
                function_a714a888(event.currentevent);
                function_fff1ad7e(event.clientxuid);
                level thread function_f909006c(event.currentevent);
                if (isdefined(event.clientnum)) {
                    player = getentbynum(event.clientnum);
                    if (isplayer(player)) {
                        player stats::function_dad108fa(#"featured_in_best_play", 1);
                    }
                }
                for (index = 0; index < level.players.size; index++) {
                    player = level.players[index];
                    if (!function_8b1a219a()) {
                        player closeingamemenu();
                    }
                    player thread play_potm_on_player(event);
                }
                wait(0.1);
                while (killcam::are_any_players_watching() && !exit) {
                    for (index = 0; index < level.players.size; index++) {
                        player = level.players[index];
                        if (game.var_6bd02863) {
                            if (player jumpbuttonpressed()) {
                                exit = 1;
                                /#
                                    println("<unknown string>");
                                #/
                            }
                        }
                    }
                    waitframe(1);
                }
            }
        }
        count++;
    }
    music::setmusicstate("none");
    util::wait_network_frame();
    util::setclientsysstate("levelNotify", "sndFKe");
    if (exit) {
        self notify(#"hash_17418db31d60118f");
        luinotifyevent(#"post_potm_transition");
        wait(0.3);
    }
    foreach (player in level.players) {
        player killcam::spawn_end_of_final_killcam();
        if (game.var_50b05a28) {
            player function_eb0dd56(0);
        }
    }
    stopplayofthematch();
    setmatchflag("potm", 0);
    luinotifyevent(#"potm_client", 1, -1);
    luinotifyevent(#"clear_notification_queue");
    level.infinalkillcam = 0;
    level notify(#"potm_finished");
    level.var_869c7fba = 0;
    level.var_5e18ae78 = undefined;
    /#
        println("<unknown string>");
    #/
}

// Namespace potm/potm_shared
// Params 0, eflags: 0x0
// Checksum 0xcbcaa370, Offset: 0x40a0
// Size: 0xe4
function function_ede9fbc1() {
    self.sessionstate = "playing";
    self.spectatorclient = -1;
    self stopfollowing();
    self.killcamentity = -1;
    self.archivetime = 0;
    self.psoffsettime = 0;
    self.spectatekillcam = 0;
    self stopfollowing();
    self val::reset(#"potm", "freezecontrols");
    self val::reset(#"spectate", "freezecontrols");
    self freezecontrols(0);
}

// Namespace potm/potm_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xbe6b9122, Offset: 0x4190
// Size: 0x64
function function_d1cb3471() {
    if (sessionmodeiswarzonegame() || sessionmodeismultiplayergame()) {
        if (isdefined(game.musicset)) {
            music::setmusicstate("potm_main" + game.musicset);
        }
    }
}

// Namespace potm/potm_shared
// Params 0, eflags: 0x4
// Checksum 0x719de50d, Offset: 0x4200
// Size: 0x64
function private waitthennotifyplaypotm() {
    /#
        setdvar(#"scr_force_potm", 0);
        setdvar(#"hash_2428eb9c3d05eee0", 0);
        level function_b6a5e7fa(1);
    #/
}

// Namespace potm/potm_shared
// Params 0, eflags: 0x5 linked
// Checksum 0xd046e5c0, Offset: 0x4270
// Size: 0xa8
function private function_797778b5() {
    var_6fa74f86 = -1;
    for (i = 0; i < game.potmevents.size; i++) {
        event = game.potmevents[i];
        if (var_6fa74f86 < 0 || event.currentevent.priority < game.potmevents[var_6fa74f86].currentevent.priority) {
            var_6fa74f86 = i;
        }
    }
    return var_6fa74f86;
}

// Namespace potm/potm_shared
// Params 1, eflags: 0x5 linked
// Checksum 0x2523911a, Offset: 0x4320
// Size: 0x144
function private function_a0b212(var_6fa74f86) {
    /#
        assert(var_6fa74f86 >= 0, "<unknown string>");
    #/
    /#
        assert(var_6fa74f86 < game.potmevents.size);
    #/
    if (removepotmevent(var_6fa74f86)) {
        /#
            println("<unknown string>" + var_6fa74f86 + "<unknown string>" + game.potmevents[var_6fa74f86].currentevent.priority + "<unknown string>");
        #/
        array::pop(game.potmevents, var_6fa74f86, 0);
    } else {
        /#
            println("<unknown string>" + var_6fa74f86 + "<unknown string>" + game.potmevents[var_6fa74f86].currentevent.priority + "<unknown string>");
        #/
    }
}

// Namespace potm/potm_shared
// Params 0, eflags: 0x5 linked
// Checksum 0xb74e8203, Offset: 0x4470
// Size: 0x4de
function private function_f19228da() {
    if (game.var_12ffe1e3.size <= 0) {
        return;
    }
    if (isdefined(level.infinalkillcam) && level.infinalkillcam) {
        return;
    }
    level.var_e99fd3d1 = 1;
    for (i = 0; i < game.var_12ffe1e3.size; i++) {
        item = game.var_12ffe1e3[i];
        if (!isdefined(item.currentevent) || !isdefined(item.currentevent.priority)) {
            /#
                println("<unknown string>");
            #/
        } else {
            if (!isdefined(item.currentevent.starttime) || !isdefined(item.currentevent.endtime)) {
                continue;
            }
            var_a0b212 = 0;
            var_6fa74f86 = -1;
            var_42f86adc = function_8c9585ea(item.currentevent.endtime - item.currentevent.starttime);
            if (game.potmevents.size >= game.potm_max_events || !var_42f86adc) {
                if (game.potmevents.size <= 0) {
                    /#
                        println("<unknown string>");
                    #/
                    continue;
                }
                var_6fa74f86 = function_797778b5();
                /#
                    assert(var_6fa74f86 >= 0, "<unknown string>");
                #/
                /#
                    assert(var_6fa74f86 < game.potmevents.size);
                #/
                if (isdefined(game.potmevents[var_6fa74f86]) && isdefined(game.potmevents[var_6fa74f86].currentevent) && isdefined(game.potmevents[var_6fa74f86].currentevent.priority) && game.potmevents[var_6fa74f86].currentevent.priority > item.currentevent.priority) {
                    continue;
                }
                if (!var_42f86adc) {
                    /#
                        println("<unknown string>");
                    #/
                    function_a0b212(var_6fa74f86);
                } else {
                    var_a0b212 = 1;
                }
            }
            if (addpotmevent(item.currentevent.starttime, item.currentevent.endtime, item.clientnum)) {
                /#
                    println("<unknown string>" + game.var_12ffe1e3[i].currentevent.priority + "<unknown string>");
                #/
                array::push(game.potmevents, game.var_12ffe1e3[i], game.potmevents.size);
                /#
                    if (getdvarint(#"scr_potm_debug_print", 0) == 1) {
                        printplayofthematchdebuginformation(item.currentevent.starttime, item.currentevent.endtime);
                    }
                #/
                if (var_a0b212 == 1) {
                    function_a0b212(var_6fa74f86);
                }
            } else {
                /#
                    println("<unknown string>" + game.var_12ffe1e3[i].currentevent.priority + "<unknown string>");
                #/
            }
            /#
                updatedebugmenudata(1);
            #/
        }
    }
    level.var_e99fd3d1 = 0;
    game.var_12ffe1e3 = [];
}

// Namespace potm/potm_shared
// Params 0, eflags: 0x5 linked
// Checksum 0x49c07d80, Offset: 0x4958
// Size: 0x38
function private function_bc21fc81() {
    while (1) {
        waitframe(1);
        function_bbbd20cc(0);
        function_f19228da();
    }
}

// Namespace potm/potm_shared
// Params 1, eflags: 0x5 linked
// Checksum 0xef89d1b1, Offset: 0x4998
// Size: 0xa4
function private function_43690387(xuid) {
    if (!level.rankedmatch) {
        return;
    }
    if (!isplayer(self)) {
        return;
    }
    if (!isdefined(xuid)) {
        return;
    }
    if (self getxuid() == xuid) {
        self stats::set_stat(#"hash_151429c0411edbfb", 0);
    } else {
        self stats::inc_stat(#"hash_151429c0411edbfb", 1);
    }
}

// Namespace potm/potm_shared
// Params 0, eflags: 0x5 linked
// Checksum 0x3880a5fe, Offset: 0x4a48
// Size: 0xca
function private function_2da4a527() {
    if (isdefined(game.highlightreelprofileweighting) && !level.rankedmatch) {
        var_ac5cbd49 = self stats::get_stat(#"hash_151429c0411edbfb");
        for (i = game.highlightreelprofileweighting.size - 1; i >= 0; i--) {
            if (var_ac5cbd49 >= game.highlightreelprofileweighting[i].var_58e4affc) {
                return game.highlightreelprofileweighting[i].boost;
            }
        }
    }
    return e_target_1();
}

// Namespace potm/potm_shared
// Params 1, eflags: 0x5 linked
// Checksum 0xe65c64e2, Offset: 0x4b20
// Size: 0x13c
function private function_fff1ad7e(var_740b4e7b) {
    foundplayer = 0;
    foreach (var_e705c59f in game.var_b2ee45db) {
        if (var_e705c59f.xuid == var_740b4e7b) {
            var_e705c59f.weight = game.var_c7826a3f;
            foundplayer = 1;
        } else {
            var_e705c59f.weight = min(var_e705c59f.weight + game.var_b924522a, 1);
        }
    }
    if (!foundplayer) {
        array::add(game.var_b2ee45db, {#weight:game.var_c7826a3f, #xuid:var_740b4e7b}, 0);
    }
}

// Namespace potm/potm_shared
// Params 0, eflags: 0x5 linked
// Checksum 0xf44d9ba6, Offset: 0x4c68
// Size: 0xea
function private function_b83114d9() {
    if (!isplayer(self)) {
        return e_target_1();
    }
    xuid = self getxuid();
    foreach (var_e705c59f in game.var_b2ee45db) {
        if (var_e705c59f.xuid == xuid) {
            return var_e705c59f.weight;
        }
    }
    return e_target_1();
}

// Namespace potm/potm_shared
// Params 1, eflags: 0x5 linked
// Checksum 0x55cdde73, Offset: 0x4d60
// Size: 0xc0
function private function_a714a888(currentevent) {
    if (!isdefined(currentevent.var_ccda367c)) {
        return;
    }
    if (currentevent.var_ccda367c.size <= 0) {
        return;
    }
    foreach (details in currentevent.var_ccda367c) {
        array::add(game.var_fc393bcd, details.infoindex, 0);
    }
}

// Namespace potm/potm_shared
// Params 1, eflags: 0x5 linked
// Checksum 0x76f482bd, Offset: 0x4e28
// Size: 0xa2
function private function_f2d75983(var_900768bc) {
    foreach (var_3cf71079 in game.var_fc393bcd) {
        if (var_900768bc.index == var_3cf71079) {
            return var_900768bc.var_54a85e75;
        }
    }
    return e_target_1();
}

// Namespace potm/potm_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xfd21d57b, Offset: 0x4ed8
// Size: 0x12
function function_3ca7924f(var_900768bc) {
    return 0;
}

// Namespace potm/potm_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xea4237f7, Offset: 0x4ef8
// Size: 0x12
function e_target_1(var_900768bc) {
    return 1;
}

// Namespace potm/potm_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xa866eb21, Offset: 0x4f18
// Size: 0x22
function function_e6c9822f(var_900768bc) {
    return function_3ca7924f(var_900768bc);
}

// Namespace potm/potm_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x40e053a5, Offset: 0x4f48
// Size: 0xd0
function function_20422a1a(var_900768bc, var_81538b15) {
    multiplier = e_target_1();
    if (game.roundsplayed > 0) {
        var_a8f06888 = function_f2d75983(var_900768bc);
        multiplier = multiplier * var_a8f06888;
    }
    var_1ef31b3 = var_81538b15 function_2da4a527();
    multiplier = multiplier * var_1ef31b3;
    var_ecac7086 = var_81538b15 function_b83114d9();
    multiplier = multiplier * var_ecac7086;
    return multiplier;
}

// Namespace potm/potm_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x3265d8e5, Offset: 0x5020
// Size: 0x20
function function_5570c594(var_900768bc) {
    return var_900768bc.var_912b5565 * level.round_number;
}

// Namespace potm/potm_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xc885d8ad, Offset: 0x5048
// Size: 0x2a
function function_34576c1(var_900768bc, var_81538b15) {
    return e_target_1(var_900768bc);
}

// Namespace potm/potm_shared
// Params 1, eflags: 0x4
// Checksum 0x85a218b8, Offset: 0x5080
// Size: 0x354
function private function_e81fe19d(bookmark) {
    /#
        var_567b8be5 = "<unknown string>" + bookmark.bookmarkname + "<unknown string>" + bookmark.time;
        if (isdefined(bookmark.var_900768bc)) {
            var_567b8be5 = var_567b8be5 + "<unknown string>" + bookmark.var_900768bc.index + "<unknown string>" + bookmark.var_900768bc.id;
        }
        if (isdefined(bookmark.isfirstperson)) {
            var_567b8be5 = var_567b8be5 + "<unknown string>" + bookmark.isfirstperson;
        }
        if (isdefined(bookmark.var_81538b15)) {
            var_567b8be5 = var_567b8be5 + "<unknown string>" + getclientname(bookmark.var_81538b15);
        }
        if (isdefined(bookmark.var_f28fb772)) {
            var_567b8be5 = var_567b8be5 + "<unknown string>" + getclientname(bookmark.var_f28fb772);
        }
        if (isdefined(bookmark.scoreaddition)) {
            var_567b8be5 = var_567b8be5 + "<unknown string>" + bookmark.scoreaddition;
        }
        if (isdefined(bookmark.scoremultiplier)) {
            var_567b8be5 = var_567b8be5 + "<unknown string>" + bookmark.scoremultiplier;
        }
        if (isdefined(bookmark.scoreeventpriority)) {
            var_567b8be5 = var_567b8be5 + "<unknown string>" + bookmark.scoreeventpriority;
        }
        if (isdefined(bookmark.var_50d1e41a) && bookmark.var_50d1e41a.size > 0) {
            var_567b8be5 = var_567b8be5 + "<unknown string>";
            foreach (var_df1ff5a in bookmark.var_50d1e41a) {
                var_567b8be5 = var_567b8be5 + "<unknown string>" + var_df1ff5a;
            }
        }
        if (isdefined(bookmark.overrideentitycamera)) {
            var_567b8be5 = var_567b8be5 + "<unknown string>" + bookmark.overrideentitycamera;
        }
        if (isdefined(bookmark.eventdata.tableindex)) {
            var_567b8be5 = var_567b8be5 + "<unknown string>" + bookmark.eventdata.tableindex;
        }
        if (isdefined(bookmark.eventdata.var_96db1aff)) {
            var_567b8be5 = var_567b8be5 + "<unknown string>" + bookmark.eventdata.var_96db1aff;
        }
        println(var_567b8be5 + "<unknown string>");
    #/
}

// Namespace potm/potm_shared
// Params 10, eflags: 0x1 linked
// Checksum 0xfff6bec2, Offset: 0x53e0
// Size: 0x810
function function_5b1e9ed4(modulename, bookmarkname, time, var_81538b15, var_f28fb772, scoreeventpriority, einflictor, var_50d1e41a, overrideentitycamera, eventdata) {
    var_7491f0eb = 0;
    if (modulename == #"potm") {
        var_7491f0eb = 1;
    }
    if (isdefined(einflictor)) {
        inflictorenttype = einflictor getentitytype();
    } else {
        inflictorenttype = 0;
    }
    if (!isdefined(var_50d1e41a) || var_50d1e41a.size <= 0) {
        var_50d1e41a = [];
        array::add(var_50d1e41a, #"");
    }
    /#
        var_6f810a5 = "<unknown string>";
        foreach (var_df1ff5a in var_50d1e41a) {
            var_6f810a5 = var_6f810a5 + "<unknown string>" + var_df1ff5a;
        }
    #/
    var_900768bc = function_79c0d595(bookmarkname, inflictorenttype, var_50d1e41a);
    if (!isdefined(var_900768bc)) {
        /#
            println(function_9e72a96(modulename) + "<unknown string>" + bookmarkname + "<unknown string>" + inflictorenttype + "<unknown string>" + var_6f810a5 + "<unknown string>");
        #/
        return undefined;
    }
    if (var_7491f0eb && isdefined(var_81538b15) && isplayer(var_81538b15) && !isalive(var_81538b15)) {
        /#
            println(function_9e72a96(modulename) + "<unknown string>" + bookmarkname + "<unknown string>" + inflictorenttype + "<unknown string>" + var_6f810a5 + "<unknown string>" + var_81538b15 getentitynumber() + "<unknown string>");
        #/
        return undefined;
    }
    if (isdefined(level.infinalkillcam) && level.infinalkillcam) {
        /#
            println(function_9e72a96(modulename) + "<unknown string>" + bookmarkname + "<unknown string>" + inflictorenttype + "<unknown string>" + var_6f810a5 + "<unknown string>");
        #/
        return undefined;
    }
    bookmark = spawnstruct();
    bookmark.bookmarkname = bookmarkname;
    bookmark.time = time;
    bookmark.var_81538b15 = var_81538b15;
    if (isdefined(var_81538b15)) {
        bookmark.mainclientnum = var_81538b15 getentitynumber();
        if (isplayer(var_81538b15)) {
            bookmark.var_ea3fa3e = var_81538b15 getxuid();
        } else {
            bookmark.var_ea3fa3e = 0;
        }
    } else {
        bookmark.mainclientnum = -1;
        bookmark.var_ea3fa3e = 0;
    }
    if (isdefined(var_f28fb772)) {
        bookmark.var_f28fb772 = var_f28fb772;
        bookmark.otherclientnum = var_f28fb772 getentitynumber();
        if (isplayer(var_f28fb772)) {
            bookmark.var_6ae7938a = var_f28fb772 getxuid();
        } else {
            bookmark.var_6ae7938a = 0;
        }
    } else {
        bookmark.otherclientnum = -1;
        bookmark.var_6ae7938a = 0;
    }
    if (isdefined(einflictor)) {
        bookmark.inflictorentnum = einflictor getentitynumber();
        bookmark.inflictorenttype = inflictorenttype;
        if (isdefined(einflictor.birthtime)) {
            bookmark.var_5f0256c4 = einflictor.birthtime;
        } else {
            bookmark.var_5f0256c4 = 0;
        }
    } else {
        bookmark.inflictorentnum = -1;
        bookmark.inflictorenttype = inflictorenttype;
        bookmark.var_5f0256c4 = 0;
    }
    bookmark.var_50d1e41a = var_50d1e41a;
    if (isdefined(eventdata)) {
        bookmark.eventdata = eventdata;
    } else {
        bookmark.eventdata = {};
        bookmark.eventdata.tableindex = 0;
        bookmark.eventdata.var_96db1aff = #"";
    }
    if (isdefined(scoreeventpriority)) {
        bookmark.scoreeventpriority = scoreeventpriority;
    } else {
        bookmark.scoreeventpriority = 0;
    }
    if (var_7491f0eb) {
        bookmark.scoreaddition = [[ game.var_4afb166c ]](var_900768bc);
        bookmark.scoremultiplier = [[ game.var_2e431430 ]](var_900768bc, var_81538b15);
        if (var_900768bc.boostpriorityonly) {
            preparinginformation = function_4a28cb83(bookmark.mainclientnum);
            if (!isdefined(preparinginformation)) {
                /#
                    println("<unknown string>" + bookmark.bookmarkname + "<unknown string>");
                #/
                return undefined;
            } else {
                if (!isdefined(preparinginformation.currentevent) || !isdefined(preparinginformation.currentevent.infoindex)) {
                    /#
                        println("<unknown string>" + bookmark.bookmarkname + "<unknown string>");
                    #/
                    return undefined;
                }
                bookmark.isfirstperson = function_876f528(preparinginformation.currentevent.infoindex).isfirstperson;
            }
        } else {
            bookmark.isfirstperson = var_900768bc.isfirstperson;
            if (isdefined(overrideentitycamera) && overrideentitycamera == 1) {
                bookmark.isfirstperson = 1;
            }
        }
    }
    bookmark.var_900768bc = var_900768bc;
    if (var_7491f0eb) {
        /#
            function_e81fe19d(bookmark);
        #/
        function_b5433e55(bookmark);
    }
    return bookmark;
}

// Namespace potm/potm_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x7d50eed3, Offset: 0x5bf8
// Size: 0x80
function function_775b9ad1(weapon, meansofdeath) {
    var_50d1e41a = [];
    if (isdefined(weapon)) {
        array::add(var_50d1e41a, weapon.name);
    }
    if (isdefined(meansofdeath)) {
        array::add(var_50d1e41a, hash(meansofdeath));
    }
    return var_50d1e41a;
}

// Namespace potm/potm_shared
// Params e, eflags: 0x1 linked
// Checksum 0xa6a34323, Offset: 0x5c80
// Size: 0x30e
function function_5523a49a(bookmarkname, spectatorclientnum, var_1c66b97d, targetentity, killcam_entity_info, weapon, meansofdeath, deathtime, deathtimeoffset, offsettime, perks, killstreaks, attacker, einflictor) {
    if (!isenabled()) {
        return;
    }
    if (isdefined(einflictor)) {
        inflictorenttype = einflictor getentitytype();
    } else {
        inflictorenttype = -1;
    }
    var_50d1e41a = function_775b9ad1(weapon, meansofdeath);
    var_900768bc = function_79c0d595(bookmarkname, inflictorenttype, var_50d1e41a);
    if (!isdefined(var_900768bc)) {
        return;
    }
    var_4acb70d6 = function_4f69bbd(spectatorclientnum, var_1c66b97d, var_900768bc.isfirstperson, 0);
    if (!isdefined(var_4acb70d6)) {
        return;
    }
    var_4acb70d6.currentevent.killcamparams = {};
    var_4acb70d6.currentevent.killcamparams.spectatorclientnum = spectatorclientnum;
    var_4acb70d6.currentevent.killcamparams.var_1c66b97d = var_1c66b97d;
    var_4acb70d6.currentevent.killcamparams.targetentityindex = targetentity getentitynumber();
    var_4acb70d6.currentevent.killcamparams.killcam_entity_info = killcam_entity_info;
    var_4acb70d6.currentevent.killcamparams.weapon = weapon;
    var_4acb70d6.currentevent.killcamparams.meansofdeath = meansofdeath;
    var_4acb70d6.currentevent.killcamparams.deathtime = deathtime;
    var_4acb70d6.currentevent.killcamparams.deathtimeoffset = deathtimeoffset;
    var_4acb70d6.currentevent.killcamparams.offsettime = offsettime;
    var_4acb70d6.currentevent.killcamparams.perks = perks;
    var_4acb70d6.currentevent.killcamparams.killstreaks = killstreaks;
    var_4acb70d6.currentevent.killcamparams.attacker = attacker;
    var_4acb70d6.currentevent.killcamparams.inflictor = einflictor;
}

// Namespace potm/potm_shared
// Params 5, eflags: 0x1 linked
// Checksum 0x894eb9c9, Offset: 0x5f98
// Size: 0x184
function kill_bookmark(var_81538b15, var_f28fb772, einflictor, var_50d1e41a, overrideentitycamera) {
    if (!isenabled()) {
        return;
    }
    if (!game.var_659f084a && isbot(var_81538b15)) {
        return;
    }
    if (game.var_691bbcd2) {
        /#
            println("<unknown string>");
        #/
        return;
    }
    mainclientnum = var_81538b15 getentitynumber();
    if (!game.var_659f084a && mainclientnum >= level.players.size) {
        /#
            println("<unknown string>" + mainclientnum + "<unknown string>" + level.players.size + "<unknown string>");
        #/
        return;
    }
    bookmark = function_5b1e9ed4(game.var_8ea529d1, #"kill", gettime(), var_81538b15, var_f28fb772, 0, einflictor, var_50d1e41a, overrideentitycamera);
    function_47a69b74(bookmark);
}

// Namespace potm/potm_shared
// Params 6, eflags: 0x1 linked
// Checksum 0x9ca51b62, Offset: 0x6128
// Size: 0x19c
function function_66d09fea(bookmarkname, var_81538b15, var_f28fb772, einflictor, var_50d1e41a, overrideentitycamera) {
    if (!isenabled()) {
        return;
    }
    if (!game.var_659f084a && isbot(var_81538b15)) {
        return;
    }
    if (game.var_691bbcd2) {
        /#
            println(function_9e72a96(game.var_8ea529d1) + "<unknown string>");
        #/
        return;
    }
    mainclientnum = var_81538b15 getentitynumber();
    if (!game.var_659f084a && mainclientnum >= level.players.size) {
        /#
            println("<unknown string>" + mainclientnum + "<unknown string>" + level.players.size + "<unknown string>");
        #/
        return;
    }
    bookmark = function_5b1e9ed4(game.var_8ea529d1, bookmarkname, gettime(), var_81538b15, var_f28fb772, 0, einflictor, var_50d1e41a, overrideentitycamera);
    function_47a69b74(bookmark);
}

// Namespace potm/potm_shared
// Params 2, eflags: 0x0
// Checksum 0x49d4f21a, Offset: 0x62d0
// Size: 0x144
function function_651a5f4(var_81538b15, einflictor = var_81538b15) {
    if (!isenabled()) {
        return;
    }
    if (!game.var_659f084a && isbot(var_81538b15)) {
        return;
    }
    mainclientnum = var_81538b15 getentitynumber();
    if (!game.var_659f084a && mainclientnum >= level.players.size) {
        /#
            println("<unknown string>" + mainclientnum + "<unknown string>" + level.players.size + "<unknown string>");
        #/
        return;
    }
    bookmark = function_5b1e9ed4(game.var_8ea529d1, #"object_destroy", gettime(), var_81538b15, undefined, 0, einflictor);
    function_47a69b74(bookmark);
}

// Namespace potm/potm_shared
// Params 5, eflags: 0x1 linked
// Checksum 0x1c4425bb, Offset: 0x6420
// Size: 0xc4
function event_bookmark(bookmarkname, time, var_81538b15, scoreeventpriority, eventdata) {
    if (!isenabled()) {
        return;
    }
    if (!isdefined(var_81538b15)) {
        return;
    }
    if (!game.var_659f084a && isbot(var_81538b15)) {
        return;
    }
    bookmark = function_5b1e9ed4(game.var_8ea529d1, bookmarkname, time, var_81538b15, undefined, scoreeventpriority, undefined, undefined, 0, eventdata);
    function_47a69b74(bookmark);
}

// Namespace potm/potm_shared
// Params 6, eflags: 0x1 linked
// Checksum 0xd21c363d, Offset: 0x64f0
// Size: 0xbc
function function_d6b60141(event_name, client, label, score, combatefficiencyscore, eventindex) {
    if (!isenabled()) {
        return;
    }
    /#
    #/
    eventdata = {};
    eventdata.label = label;
    eventdata.score = score;
    eventdata.combatefficiencyscore = combatefficiencyscore;
    eventdata.eventindex = eventindex;
    event_bookmark(event_name, gettime(), client, 0, eventdata);
}

// Namespace potm/potm_shared
// Params 5, eflags: 0x1 linked
// Checksum 0xc0d16f01, Offset: 0x65b8
// Size: 0xbc
function bookmark(bookmarkname, time, var_81538b15, var_f28fb772, scoreeventpriority) {
    if (!isenabled()) {
        return;
    }
    if (!isdefined(var_81538b15)) {
        return;
    }
    if (!game.var_659f084a && isbot(var_81538b15)) {
        return;
    }
    bookmark = function_5b1e9ed4(game.var_8ea529d1, bookmarkname, time, var_81538b15, var_f28fb772, scoreeventpriority);
    function_47a69b74(bookmark);
}

// Namespace potm/potm_shared
// Params 3, eflags: 0x5 linked
// Checksum 0x2bde4917, Offset: 0x6680
// Size: 0x248
function private function_79c0d595(bookmarkname, etype, var_50d1e41a) {
    result = undefined;
    var_bee9d27f = 0;
    var_91d32f1 = 0;
    for (i = 0; i < game.highlightreelinfodefines.size; i++) {
        info = game.highlightreelinfodefines[i];
        if (info.bookmarkname == bookmarkname && (!info.var_339c3400 || isdefined(info.etype) && info.etype == etype)) {
            foreach (var_df1ff5a in var_50d1e41a) {
                if (info.var_4e86a573 == var_df1ff5a) {
                    if (info.var_38446242 == level.var_837aa533) {
                        return info;
                    } else if (info.var_38446242 == #"") {
                        result = info;
                        var_bee9d27f = 1;
                    }
                }
            }
            if (!var_bee9d27f) {
                if (info.var_4e86a573 == #"" && info.var_38446242 == level.var_837aa533) {
                    result = info;
                    var_91d32f1 = 1;
                } else if (!var_91d32f1 && info.var_4e86a573 == #"" && info.var_38446242 == #"") {
                    result = info;
                }
            }
        }
    }
    return result;
}

// Namespace potm/potm_shared
// Params 1, eflags: 0x5 linked
// Checksum 0xc5003cda, Offset: 0x68d0
// Size: 0xa0
function private function_876f528(infoindex) {
    /#
        assert(infoindex < game.highlightreelinfodefines.size);
    #/
    if (infoindex >= game.highlightreelinfodefines.size) {
        /#
            println("<unknown string>" + infoindex + "<unknown string>" + game.highlightreelinfodefines.size + "<unknown string>");
        #/
        return undefined;
    }
    return game.highlightreelinfodefines[infoindex];
}

// Namespace potm/potm_shared
// Params 2, eflags: 0x5 linked
// Checksum 0xd000479, Offset: 0x6978
// Size: 0x6e
function private function_e38a52f0(clientnum, bookmark) {
    if (bookmark.bookmarkname == #"player_revived") {
        return (bookmark.mainclientnum == clientnum || bookmark.otherclientnum == clientnum);
    } else {
        return (bookmark.mainclientnum == clientnum);
    }
}

// Namespace potm/potm_shared
// Params 3, eflags: 0x5 linked
// Checksum 0xafcf80ea, Offset: 0x69f0
// Size: 0xda
function private function_a8295237(bookmark, preparinginformation, bonussearchtime) {
    if (preparinginformation.currentevent.endtime < bookmark.time - bookmark.var_900768bc.secondsbefore + bonussearchtime) {
        return 0;
    }
    if (game.var_c7a2645f > 0 && bookmark.time + bookmark.var_900768bc.secondsafter - preparinginformation.currentevent.starttime > int(game.var_c7a2645f * 1000)) {
        return 0;
    }
    return 1;
}

// Namespace potm/potm_shared
// Params 2, eflags: 0x5 linked
// Checksum 0x9069a43a, Offset: 0x6ad8
// Size: 0xca
function private function_cbc0ec1c(bookmark, preparinginformation) {
    if (!isdefined(bookmark.var_81538b15)) {
        /#
            println("<unknown string>" + bookmark.bookmarkname + "<unknown string>");
        #/
        return;
    }
    if (isdefined(preparinginformation.currentevent.streamerhint)) {
        return;
    }
    preparinginformation.currentevent.var_c79756c4 = bookmark.var_81538b15.origin;
    preparinginformation.currentevent.var_ccfb7703 = bookmark.var_81538b15.angles;
}

// Namespace potm/potm_shared
// Params 2, eflags: 0x5 linked
// Checksum 0x3f369599, Offset: 0x6bb0
// Size: 0x204
function private function_d832ee94(preparinginformation, bookmark) {
    if (bookmark.bookmarkname != #"medal" && bookmark.bookmarkname != #"score_event") {
        return;
    }
    if (!isdefined(bookmark.var_81538b15)) {
        if (isdefined(bookmark.eventdata.var_96db1aff)) {
            /#
                println("<unknown string>" + bookmark.bookmarkname + "<unknown string>" + bookmark.eventdata.tableindex + "<unknown string>" + bookmark.eventdata.var_96db1aff + "<unknown string>");
            #/
        } else {
            /#
                println("<unknown string>" + bookmark.bookmarkname + "<unknown string>");
            #/
        }
        return;
    }
    if (!isdefined(preparinginformation.currentevent.var_b86d6c40)) {
        preparinginformation.currentevent.var_b86d6c40 = [];
    }
    var_e0aa3530 = {};
    var_e0aa3530.bookmarkname = bookmark.bookmarkname;
    var_e0aa3530.time = bookmark.time + 50;
    var_e0aa3530.player = bookmark.var_81538b15;
    var_e0aa3530.eventdata = bookmark.eventdata;
    array::push(preparinginformation.currentevent.var_b86d6c40, var_e0aa3530, preparinginformation.currentevent.var_b86d6c40.size);
}

// Namespace potm/potm_shared
// Params 2, eflags: 0x5 linked
// Checksum 0xc59fa0dc, Offset: 0x6dc0
// Size: 0x124
function private function_c03e8a9d(bookmark, preparinginformation) {
    if (!isdefined(preparinginformation.currentevent.var_ccda367c)) {
        preparinginformation.currentevent.var_ccda367c = [];
    }
    var_ccda367c = {};
    var_ccda367c.bookmarkname = bookmark.bookmarkname;
    var_ccda367c.time = bookmark.time;
    var_ccda367c.infoindex = bookmark.var_900768bc.index;
    var_ccda367c.inflictorentnum = bookmark.inflictorentnum;
    var_ccda367c.mainclientnum = bookmark.mainclientnum;
    var_ccda367c.otherclientnum = bookmark.otherclientnum;
    array::push(preparinginformation.currentevent.var_ccda367c, var_ccda367c, preparinginformation.currentevent.var_ccda367c.size);
}

// Namespace potm/potm_shared
// Params 2, eflags: 0x5 linked
// Checksum 0x5c0064bb, Offset: 0x6ef0
// Size: 0x110
function private function_a273a8ff(bookmark, var_e567d17) {
    if (var_e567d17 < 1) {
        var_4e28bc2b = bookmark.var_900768bc.priorityweightperevent;
    } else {
        var_4e28bc2b = bookmark.var_900768bc.prioritystackfactor + bookmark.var_900768bc.priorityweightperevent;
    }
    if (bookmark.var_900768bc.boostpriorityonly) {
        var_12058023 = var_4e28bc2b * bookmark.scoreeventpriority;
    } else {
        var_12058023 = 0;
        if (var_e567d17 >= 1) {
            var_12058023 = var_12058023 + var_e567d17 * var_4e28bc2b;
        } else {
            var_12058023 = var_12058023 + var_4e28bc2b;
        }
    }
    var_12058023 = var_12058023 + bookmark.scoreaddition;
    var_12058023 = var_12058023 * bookmark.scoremultiplier;
    return var_12058023;
}

// Namespace potm/potm_shared
// Params 2, eflags: 0x5 linked
// Checksum 0xaa946539, Offset: 0x7008
// Size: 0x544
function private function_1dd2e5ca(bookmark, preparinginformation) {
    if (preparinginformation.pendingupdate) {
        if (bookmark.var_900768bc.boostpriorityonly && function_e38a52f0(preparinginformation.clientnum, bookmark) && preparinginformation.currentevent.endtime >= bookmark.time - bookmark.var_900768bc.secondsbefore) {
            preparinginformation.currentevent.priority = preparinginformation.currentevent.priority + function_a273a8ff(bookmark, preparinginformation.var_e567d17);
            preparinginformation.updatetime = gettime();
            function_d832ee94(preparinginformation, bookmark);
        } else if (!bookmark.var_900768bc.boostpriorityonly && function_e38a52f0(preparinginformation.clientnum, bookmark)) {
            bonussearchtime = function_3aa16058(preparinginformation);
            if (function_a8295237(bookmark, preparinginformation, bonussearchtime)) {
                preparinginformation.currentevent.endtime = bookmark.time + bookmark.var_900768bc.secondsafter;
                preparinginformation.currentevent.priority = preparinginformation.currentevent.priority + function_a273a8ff(bookmark, preparinginformation.var_e567d17);
                preparinginformation.var_e567d17++;
                preparinginformation.updatetime = gettime();
                function_c03e8a9d(bookmark, preparinginformation);
            } else {
                clientnum = preparinginformation.clientnum;
                clientxuid = preparinginformation.clientxuid;
                function_9ad04689(preparinginformation);
                function_1cc3b6fd(preparinginformation);
                preparinginformation = function_929d9485(clientnum, clientxuid);
            }
        }
    }
    if (!preparinginformation.pendingupdate) {
        if (!bookmark.var_900768bc.boostpriorityonly && function_e38a52f0(preparinginformation.clientnum, bookmark)) {
            last_spawn_time = 0;
            if (isdefined(bookmark.var_81538b15) && isdefined(bookmark.var_81538b15.lastspawntime)) {
                last_spawn_time = bookmark.var_81538b15.lastspawntime;
            }
            preparinginformation.currentevent.starttime = int(max(last_spawn_time, bookmark.time - bookmark.var_900768bc.secondsbefore));
            preparinginformation.currentevent.endtime = bookmark.time + bookmark.var_900768bc.secondsafter;
            if (preparinginformation.currentevent.endtime <= preparinginformation.currentevent.starttime) {
                function_1cc3b6fd(preparinginformation);
                return;
            }
            preparinginformation.currentevent.priority = preparinginformation.currentevent.priority + function_a273a8ff(bookmark, preparinginformation.var_e567d17);
            preparinginformation.currentevent.infoindex = bookmark.var_900768bc.index;
            preparinginformation.currentevent.var_f130571c = bookmark.var_900768bc.id;
            preparinginformation.currentevent.var_1be950f5 = 1;
            preparinginformation.currentevent.killcamparams = bookmark.killcamparams;
            preparinginformation.var_e567d17 = 1;
            preparinginformation.pendingupdate = 1;
            preparinginformation.updatetime = gettime();
            function_c03e8a9d(bookmark, preparinginformation);
            function_cbc0ec1c(bookmark, preparinginformation);
        }
    }
}

// Namespace potm/potm_shared
// Params 2, eflags: 0x5 linked
// Checksum 0xd3593ef1, Offset: 0x7558
// Size: 0x59c
function private function_abd02279(bookmark, preparinginformation) {
    if (preparinginformation.pendingupdate) {
        if (bookmark.var_900768bc.boostpriorityonly && function_e38a52f0(preparinginformation.clientnum, bookmark) && preparinginformation.currentevent.endtime >= bookmark.time - bookmark.var_900768bc.secondsbefore) {
            preparinginformation.currentevent.priority = preparinginformation.currentevent.priority + function_a273a8ff(bookmark, preparinginformation.var_e567d17);
            preparinginformation.updatetime = gettime();
            function_d832ee94(preparinginformation, bookmark);
        } else if (!bookmark.var_900768bc.boostpriorityonly && function_e38a52f0(preparinginformation.clientnum, bookmark) && bookmark.otherclientnum != bookmark.mainclientnum) {
            inflictorentnum = -1;
            if (isdefined(preparinginformation.currentevent.killcamparams) && isdefined(preparinginformation.currentevent.killcamparams.inflictor)) {
                inflictorentnum = preparinginformation.currentevent.killcamparams.inflictor getentitynumber();
            }
            if (inflictorentnum == bookmark.inflictorentnum && abs(preparinginformation.currentevent.starttime + bookmark.var_900768bc.secondsbefore - bookmark.time) <= 500) {
                preparinginformation.var_e567d17++;
                preparinginformation.currentevent.priority = preparinginformation.currentevent.priority + function_a273a8ff(bookmark, preparinginformation.var_e567d17);
                preparinginformation.updatetime = gettime();
                function_c03e8a9d(bookmark, preparinginformation);
            } else {
                clientnum = preparinginformation.clientnum;
                clientxuid = preparinginformation.clientxuid;
                function_9ad04689(preparinginformation);
                function_1cc3b6fd(preparinginformation);
                preparinginformation = function_929d9485(clientnum, clientxuid);
            }
        }
    }
    if (!preparinginformation.pendingupdate) {
        if (!bookmark.var_900768bc.boostpriorityonly && function_e38a52f0(preparinginformation.clientnum, bookmark) && bookmark.otherclientnum != bookmark.mainclientnum) {
            last_spawn_time = 0;
            if (isdefined(bookmark.var_81538b15) && isdefined(bookmark.var_81538b15.lastspawntime)) {
                last_spawn_time = bookmark.var_81538b15.lastspawntime;
            }
            preparinginformation.currentevent.starttime = int(max(last_spawn_time, bookmark.time - bookmark.var_900768bc.secondsbefore));
            preparinginformation.currentevent.endtime = bookmark.time + bookmark.var_900768bc.secondsafter;
            preparinginformation.currentevent.killcamparams = bookmark.killcamparams;
            preparinginformation.currentevent.priority = preparinginformation.currentevent.priority + function_a273a8ff(bookmark, preparinginformation.var_e567d17);
            preparinginformation.currentevent.infoindex = bookmark.var_900768bc.index;
            preparinginformation.currentevent.var_f130571c = bookmark.var_900768bc.id;
            preparinginformation.currentevent.var_1be950f5 = 0;
            preparinginformation.var_e567d17 = 1;
            preparinginformation.pendingupdate = 1;
            preparinginformation.updatetime = gettime();
            function_c03e8a9d(bookmark, preparinginformation);
            function_cbc0ec1c(bookmark, preparinginformation);
        }
    }
}

// Namespace potm/potm_shared
// Params 2, eflags: 0x5 linked
// Checksum 0x177235b, Offset: 0x7b00
// Size: 0x124
function private function_13d710eb(bookmark, preparinginformation) {
    if (!preparinginformation.pendingupdate) {
        return;
    }
    if (bookmark.time < preparinginformation.currentevent.endtime) {
        preparinginformation.currentevent.endtime = bookmark.time;
        preparinginformation.currentevent.priority = preparinginformation.currentevent.priority - bookmark.var_900768bc.priorityweightperevent / 2;
    }
    if (preparinginformation.currentevent.endtime - preparinginformation.currentevent.starttime >= 1000) {
        clientnum = preparinginformation.clientnum;
        function_9ad04689(preparinginformation);
    }
    function_1cc3b6fd(preparinginformation);
}

// Namespace potm/potm_shared
// Params 1, eflags: 0x5 linked
// Checksum 0xd5247641, Offset: 0x7c30
// Size: 0x134
function private function_9ad04689(preparinginformation) {
    /#
        assert(level.var_e99fd3d1 == 0);
    #/
    if (!isdefined(preparinginformation.currentevent) || preparinginformation.currentevent.priority <= 0) {
        return;
    }
    if (isdefined(level.infinalkillcam) && level.infinalkillcam) {
        /#
            println("<unknown string>");
        #/
        return;
    }
    if (preparinginformation.currentevent.endtime > gettime()) {
        /#
            println("<unknown string>");
        #/
        preparinginformation.currentevent.endtime = gettime() - 100;
    }
    array::push(game.var_12ffe1e3, preparinginformation, game.var_12ffe1e3.size);
    function_b5633c73(preparinginformation);
}

// Namespace potm/potm_shared
// Params 2, eflags: 0x5 linked
// Checksum 0xa3f360d, Offset: 0x7d70
// Size: 0xb8
function private function_929d9485(clientnum, clientxuid) {
    preparinginformation = spawnstruct();
    preparinginformation.pendingupdate = 0;
    preparinginformation.clientnum = clientnum;
    preparinginformation.clientxuid = clientxuid;
    preparinginformation.var_e567d17 = 0;
    preparinginformation.currentevent = {};
    preparinginformation.currentevent.priority = 0;
    array::push(game.var_aafe322f, preparinginformation, game.var_aafe322f.size);
    return preparinginformation;
}

// Namespace potm/potm_shared
// Params 1, eflags: 0x5 linked
// Checksum 0x551d61e6, Offset: 0x7e30
// Size: 0x70
function private function_1cc3b6fd(preparinginformation) {
    for (i = 0; i < game.var_aafe322f.size; i++) {
        if (preparinginformation == game.var_aafe322f[i]) {
            array::pop(game.var_aafe322f, i, 0);
            return;
        }
    }
}

// Namespace potm/potm_shared
// Params 1, eflags: 0x5 linked
// Checksum 0xd43f30f8, Offset: 0x7ea8
// Size: 0xee
function private function_4a28cb83(clientnum) {
    index = undefined;
    for (i = 0; i < game.var_aafe322f.size; i++) {
        var_ad2d5156 = game.var_aafe322f[i];
        if (!var_ad2d5156.pendingupdate) {
            continue;
        }
        if (var_ad2d5156.clientnum != clientnum) {
            continue;
        }
        if (isdefined(index)) {
            if (var_ad2d5156.updatetime > game.var_aafe322f[index].updatetime) {
                index = i;
            }
        } else {
            index = i;
        }
    }
    if (isdefined(index)) {
        return game.var_aafe322f[index];
    } else {
        return undefined;
    }
}

// Namespace potm/potm_shared
// Params 4, eflags: 0x5 linked
// Checksum 0x873d5e87, Offset: 0x7fa0
// Size: 0x124
function private function_4f69bbd(clientnum, clientxuid, isfirstperson, b_add) {
    for (i = 0; i < game.var_aafe322f.size; i++) {
        var_ad2d5156 = game.var_aafe322f[i];
        if (!var_ad2d5156.pendingupdate) {
            continue;
        }
        if (var_ad2d5156.clientnum != clientnum) {
            continue;
        }
        if (isdefined(isfirstperson)) {
            if (isdefined(var_ad2d5156.currentevent.infoindex) && game.highlightreelinfodefines[var_ad2d5156.currentevent.infoindex].isfirstperson == isfirstperson) {
                return var_ad2d5156;
            } else {
                continue;
            }
        } else {
            return var_ad2d5156;
        }
    }
    if (b_add) {
        return function_929d9485(clientnum, clientxuid);
    } else {
        return undefined;
    }
}

// Namespace potm/potm_shared
// Params 1, eflags: 0x5 linked
// Checksum 0xc0df8c82, Offset: 0x80d0
// Size: 0x9a
function private function_3aa16058(preparinginformation) {
    bonussearchtime = 0;
    if (!preparinginformation.pendingupdate) {
        return bonussearchtime;
    }
    if (!preparinginformation.currentevent.var_1be950f5) {
        return 1;
    }
    bonussearchtime = min(preparinginformation.var_e567d17 * game.var_3a859f59, game.var_94fe2d81);
    return int(bonussearchtime * 1000);
}

// Namespace potm/potm_shared
// Params 1, eflags: 0x5 linked
// Checksum 0x4a56d609, Offset: 0x8178
// Size: 0x14e
function private function_bbbd20cc(var_fee35d3a) {
    var_3fea636b = [];
    for (i = 0; i < game.var_aafe322f.size; i++) {
        var_ad2d5156 = game.var_aafe322f[i];
        thresholdtime = function_3aa16058(var_ad2d5156) + game.var_b9a7e65f;
        if (var_fee35d3a || var_ad2d5156.pendingupdate && gettime() - var_ad2d5156.currentevent.endtime >= thresholdtime) {
            function_9ad04689(var_ad2d5156);
            array::push(var_3fea636b, i, var_3fea636b.size);
        }
    }
    for (j = var_3fea636b.size - 1; j >= 0; j--) {
        function_1cc3b6fd(game.var_aafe322f[var_3fea636b[j]]);
    }
}

// Namespace potm/potm_shared
// Params 1, eflags: 0x5 linked
// Checksum 0xb95ac93c, Offset: 0x82d0
// Size: 0x18c
function private function_47a69b74(bookmark) {
    if (!isdefined(bookmark)) {
        return;
    }
    if (bookmark.var_900768bc.var_9a63503d) {
        do {
            preparinginformation = function_4f69bbd(bookmark.otherclientnum, bookmark.var_6ae7938a, undefined, 0);
            if (!isdefined(preparinginformation)) {
                break;
            }
            function_13d710eb(bookmark, preparinginformation);
        } while(1);
    }
    if (bookmark.var_900768bc.boostpriorityonly) {
        preparinginformation = function_4a28cb83(bookmark.mainclientnum);
        if (!isdefined(preparinginformation)) {
            /#
                println("<unknown string>" + bookmark.bookmarkname + "<unknown string>");
            #/
            return;
        }
    } else {
        preparinginformation = function_4f69bbd(bookmark.mainclientnum, bookmark.var_ea3fa3e, bookmark.isfirstperson, 1);
    }
    if (bookmark.isfirstperson) {
        function_1dd2e5ca(bookmark, preparinginformation);
    } else {
        function_abd02279(bookmark, preparinginformation);
    }
}

// Namespace potm/potm_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xd4c7eecd, Offset: 0x8468
// Size: 0x8
function function_d34511e6() {
    return 1;
}

// Namespace potm/potm_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x651cd981, Offset: 0x8478
// Size: 0x6
function function_66bbf824() {
    return 0;
}

// Namespace potm/potm_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x1b0124b9, Offset: 0x8488
// Size: 0x6
function function_c65274ed() {
    return 0;
}

// Namespace potm/potm_shared
// Params 0, eflags: 0x4
// Checksum 0xa29de893, Offset: 0x8498
// Size: 0x8c
function private debuginit() {
    /#
        if (!isenabled()) {
            return;
        }
        setdvar(#"scr_potm_debug", 0);
        setdvar(#"scr_potm_debug_print", 0);
        setdvar(#"scr_potm_debug_event_num", 1);
    #/
}

// Namespace potm/potm_shared
// Params 1, eflags: 0x4
// Checksum 0x8a09fe77, Offset: 0x8530
// Size: 0x4b4
function private updatedebugmenudata(forceupdate) {
    /#
        self endon(#"disconnect");
        level endon(#"game_ended");
        if (!isdefined(level.potmdebugmenu)) {
            return;
        }
        hostplayer = util::gethostplayer();
        menu = level.potmdebugmenu;
        debugeventnum = getdvarint(#"scr_potm_debug_event_num", 0);
        oldestarchivetime = getearliestarchiveclientinfotime();
        hostplayer setluimenudata(menu, #"oldestarchivetime", oldestarchivetime);
        if (isdefined(level.potmdebugeventnum) && level.potmdebugeventnum == debugeventnum && !forceupdate) {
            return;
        }
        level.potmdebugeventnum = debugeventnum;
        infoindex = #"n/a";
        starttime = -1;
        endtime = -1;
        duration = -1;
        priority = -1;
        var_e567d17 = 0;
        var_1be0f2c3 = "<unknown string>";
        var_4775155a = "<unknown string>";
        if (debugeventnum - 1 < game.potmevents.size) {
            event = game.potmevents[debugeventnum - 1];
            infoindex = event.currentevent.infoindex;
            starttime = event.currentevent.starttime;
            endtime = event.currentevent.endtime;
            duration = endtime - starttime;
            priority = event.currentevent.priority;
            var_e567d17 = event.var_e567d17;
            var_1be0f2c3 = function_c7e98e25(event);
        }
        hostplayer setluimenudata(menu, #"count", game.potmevents.size);
        hostplayer setluimenudata(menu, #"eventnum", int(debugeventnum));
        hostplayer setluimenudata(menu, #"eventinfoindex", infoindex);
        hostplayer setluimenudata(menu, #"eventstarttime", int(starttime));
        hostplayer setluimenudata(menu, #"eventendtime", int(endtime));
        hostplayer setluimenudata(menu, #"eventduration", int(duration));
        hostplayer setluimenudata(menu, #"scoreeventpriority", int(priority));
        hostplayer setluimenudata(menu, #"hash_752b983964003a68", int(var_e567d17));
        hostplayer setluimenudata(menu, #"hash_5935b658727b020c", var_1be0f2c3);
        hostplayer setluimenudata(menu, #"hash_33d80b75d9c6d88d", var_4775155a);
    #/
}

// Namespace potm/potm_shared
// Params 0, eflags: 0x4
// Checksum 0x886e9e91, Offset: 0x89f0
// Size: 0xda
function private updatedebugmenustate() {
    /#
        player = util::gethostplayer();
        if (getdvarint(#"scr_potm_debug", 0) == 1) {
            if (!isdefined(level.potmdebugmenu) && isdefined(player)) {
                level.potmdebugmenu = player openluimenu("<unknown string>");
                return 1;
            }
        } else if (isdefined(level.potmdebugmenu)) {
            player closeluimenu(level.potmdebugmenu);
            level.potmdebugmenu = undefined;
        }
        return 0;
    #/
}

// Namespace potm/potm_shared
// Params 0, eflags: 0x0
// Checksum 0x9530c38c, Offset: 0x8ad8
// Size: 0x224
function debugupdate() {
    /#
        if (!isenabled()) {
            return;
        }
        result = updatedebugmenustate();
        updatedebugmenudata(result);
        if (getdvarint(#"scr_force_potm", 0) == 1) {
            level thread waitthennotifyplaypotm();
        }
        if (getdvarint(#"hash_2428eb9c3d05eee0", 0) == 1) {
            level thread waitthennotifyplaypotm();
        }
        if (getdvarint(#"hash_198be770b0735f93", 0) == 1) {
            foreach (player in level.players) {
                player.sessionstate = "<unknown string>";
                player.spectatorclient = -1;
                player.var_1c66b97d = 0;
                player.killcamentity = -1;
                player.archivetime = 0;
                player.psoffsettime = 0;
                player.spectatekillcam = 0;
                player stopfollowing();
                player val::reset(#"potm", "<unknown string>");
            }
            setdvar(#"hash_198be770b0735f93", 0);
        }
    #/
}

