// Atian COD Tools GSC decompiler test
#using scripts\mp_common\gametypes\globallogic_spawn.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\killcam_shared.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\gamestate.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace userspawnselection;

// Namespace userspawnselection/userspawnselection
// Params 0, eflags: 0x2
// Checksum 0x92663f12, Offset: 0x1c8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"userspawnselection", &__init__, undefined, undefined);
}

// Namespace userspawnselection/userspawnselection
// Params 0, eflags: 0x0
// Checksum 0x141db61d, Offset: 0x210
// Size: 0x1fc
function __init__() {
    if (!isdefined(level.spawnselect)) {
        level.spawnselect = spawnstruct();
    }
    level.spawnselect.vox_plr_1_revive_down_2 = [];
    level.spawnselect.lastchosenplayerspawns = [];
    level.spawnselectenabled = getgametypesetting(#"spawnselectenabled");
    level.usespawngroups = getgametypesetting(#"usespawngroups");
    level.spawngroups = [];
    level.next_spawn_group_index = 0;
    level.var_abb55703 = &function_a316ca82;
    level.registeravailablespawnbeacon = &registeravailablespawnbeacon;
    level.var_13edf38c = &removespawnbeacon;
    level.spawnselect_timelimit_ms = getdvarint(#"spawnselect_timelimit_ms", 10000);
    if (isspawnselectenabled()) {
        callback::on_start_gametype(&on_start_gametype);
        callback::on_disconnect(&on_player_disconnect);
        callback::on_spawned(&onplayerspawned);
        spawning::function_754c78a6(&function_259770ba);
        level.var_b8622956 = &filter_spawnpoints;
    }
    registerclientfields();
}

// Namespace userspawnselection/userspawnselection
// Params 1, eflags: 0x0
// Checksum 0x5d2825a3, Offset: 0x418
// Size: 0x94
function function_127864f2(player) {
    foreach (spawnbeacon in level.spawnselect.vox_plr_1_revive_down_2) {
        if (player == spawnbeacon.owner) {
            return true;
        }
    }
    return false;
}

// Namespace userspawnselection/userspawnselection
// Params 0, eflags: 0x0
// Checksum 0x5d542cf9, Offset: 0x4b8
// Size: 0x42
function function_93076e1d() {
    if (!isdefined(level.spawnselect)) {
        level.spawnselect = spawnstruct();
    }
    level.spawnselect.var_d302b268 = 1;
}

// Namespace userspawnselection/userspawnselection
// Params 1, eflags: 0x0
// Checksum 0x3de5d77e, Offset: 0x508
// Size: 0x3e
function function_a316ca82(player) {
    spawnbeacon = player function_b9573d36();
    if (isdefined(spawnbeacon)) {
        return true;
    }
    return false;
}

// Namespace userspawnselection/userspawnselection
// Params 0, eflags: 0x0
// Checksum 0xaadbb2d3, Offset: 0x550
// Size: 0x76
function onplayerspawned() {
    closespawnselect();
    if (!isdefined(level.spawnselect.lastchosenplayerspawns[self.clientid])) {
        return;
    }
    if (level.spawnselect.lastchosenplayerspawns[self.clientid] == -2) {
        level.spawnselect.lastchosenplayerspawns[self.clientid] = -1;
    }
}

// Namespace userspawnselection/userspawnselection
// Params 2, eflags: 0x0
// Checksum 0x1bc00038, Offset: 0x5d0
// Size: 0x62
function registeravailablespawnbeacon(spawnbeaconid, spawnbeacon) {
    assert(!isdefined(level.spawnselect.vox_plr_1_revive_down_2[spawnbeaconid]));
    level.spawnselect.vox_plr_1_revive_down_2[spawnbeaconid] = spawnbeacon;
}

// Namespace userspawnselection/userspawnselection
// Params 1, eflags: 0x0
// Checksum 0x380c41f5, Offset: 0x640
// Size: 0xac
function removespawnbeacon(spawnbeaconid) {
    if (!isdefined(spawnbeaconid) || !isdefined(level.spawnselect.vox_plr_1_revive_down_2[spawnbeaconid])) {
        return;
    }
    spawnbeacon = level.spawnselect.vox_plr_1_revive_down_2[spawnbeaconid];
    if (isdefined(spawnbeacon) && isdefined(spawnbeacon.spawnlist)) {
        clearspawnpoints(spawnbeacon.spawnlist);
    }
    level.spawnselect.vox_plr_1_revive_down_2[spawnbeaconid] = undefined;
}

// Namespace userspawnselection/userspawnselection
// Params 0, eflags: 0x0
// Checksum 0x5ec1bbf6, Offset: 0x6f8
// Size: 0xe
function isspawnselectenabled() {
    return level.spawnselectenabled;
}

// Namespace userspawnselection/userspawnselection
// Params 1, eflags: 0x0
// Checksum 0x2c492f49, Offset: 0x710
// Size: 0x1c
function getspawngroup(index) {
    return level.spawngroups[index];
}

// Namespace userspawnselection/userspawnselection
// Params 1, eflags: 0x0
// Checksum 0x6297ccda, Offset: 0x738
// Size: 0xac
function getspawngroupbyname(target) {
    retunrarr = [];
    foreach (spawngroup in level.spawngroups) {
        if (spawngroup.target == target) {
            array::add(retunrarr, spawngroup);
        }
    }
    return retunrarr;
}

// Namespace userspawnselection/userspawnselection
// Params 1, eflags: 0x0
// Checksum 0x31879d8a, Offset: 0x7f0
// Size: 0xac
function getspawngroupsforzone(zoneindex) {
    returnarray = [];
    foreach (spawngroup in level.spawngroups) {
        if (spawngroup.script_zoneindex == zoneindex) {
            array::add(returnarray, spawngroup);
        }
    }
    return returnarray;
}

// Namespace userspawnselection/userspawnselection
// Params 1, eflags: 0x0
// Checksum 0xbf5a4f9e, Offset: 0x8a8
// Size: 0xbc
function getspawngroupwithscriptnoteworthy(script_noteworthy) {
    returnarray = [];
    foreach (spawngroup in level.spawngroups) {
        if (isdefined(spawngroup.script_noteworthy) && spawngroup.script_noteworthy == script_noteworthy) {
            array::add(returnarray, spawngroup);
        }
    }
    return returnarray;
}

// Namespace userspawnselection/userspawnselection
// Params 1, eflags: 0x0
// Checksum 0xf117be9e, Offset: 0x970
// Size: 0x64
function changeusability(isusable) {
    usestatusmodel = getclientfieldprefix(self.uiindex) + "useStatus";
    self.ison = isusable;
    level clientfield::set_world_uimodel(usestatusmodel, isusable);
}

// Namespace userspawnselection/userspawnselection
// Params 1, eflags: 0x0
// Checksum 0x7d65d456, Offset: 0x9e0
// Size: 0x54
function changevisibility(isvisible) {
    visstatusmodel = getclientfieldprefix(self.uiindex) + "visStatus";
    level clientfield::set_world_uimodel(visstatusmodel, isvisible);
}

// Namespace userspawnselection/userspawnselection
// Params 1, eflags: 0x0
// Checksum 0x6e72c044, Offset: 0xa40
// Size: 0xa4
function changeteam(teamname) {
    teamclientfieldindex = getteamclientfieldvalue(teamname);
    teammodel = getclientfieldprefix(self.uiindex) + "team";
    level clientfield::set_world_uimodel(teammodel, teamclientfieldindex);
    enablespawnpointlist(self.spawnlist, util::getteammask(teamname));
}

// Namespace userspawnselection/userspawnselection
// Params 0, eflags: 0x0
// Checksum 0x9ccab1e1, Offset: 0xaf0
// Size: 0xa8
function setspawngroupsenabled() {
    if (!isdefined(level.spawngroups)) {
        return;
    }
    foreach (spawngroup in level.spawngroups) {
        spawngroup changeusability(1);
        spawngroup changevisibility(1);
    }
}

// Namespace userspawnselection/userspawnselection
// Params 1, eflags: 0x0
// Checksum 0x7c298788, Offset: 0xba0
// Size: 0x10
function canplayerusespawngroup(spawngroupindex) {
    return true;
}

// Namespace userspawnselection/userspawnselection
// Params 1, eflags: 0x0
// Checksum 0x35e4a40f, Offset: 0xbb8
// Size: 0x2a
function setspawngroupforplayer(selectedspawngroupindex) {
    level.spawnselect.lastchosenplayerspawns[self.clientid] = selectedspawngroupindex;
}

// Namespace userspawnselection/userspawnselection
// Params 0, eflags: 0x0
// Checksum 0x956ed024, Offset: 0xbf0
// Size: 0x180
function function_b9573d36() {
    player = self;
    if (level.spawnselectenabled !== 1 && level.var_6cd68fbe === 1) {
        return player.var_583f6cce;
    }
    if (isdefined(player.var_583f6cce) && strstartswith(level.gametype, "sd")) {
        return player.var_583f6cce;
    }
    if (!isdefined(level.spawnselect.lastchosenplayerspawns[player.clientid])) {
        return undefined;
    }
    spawbeaconid = level.spawnselect.lastchosenplayerspawns[player.clientid];
    if (spawbeaconid == -1 || spawbeaconid == -2) {
        return undefined;
    }
    if (!isdefined(level.spawnselect.vox_plr_1_revive_down_2[spawbeaconid])) {
        return undefined;
    }
    if (isdefined(level.spawnselect.vox_plr_1_revive_down_2[spawbeaconid].var_34d7dddd) && level.spawnselect.vox_plr_1_revive_down_2[spawbeaconid].var_34d7dddd) {
        return undefined;
    }
    return level.spawnselect.vox_plr_1_revive_down_2[spawbeaconid];
}

// Namespace userspawnselection/userspawnselection
// Params 0, eflags: 0x0
// Checksum 0x320f92bb, Offset: 0xd78
// Size: 0xb0
function fillspawnlists() {
    foreach (spawngroup in level.spawngroups) {
        spawngroup setupspawnlistforspawngroup(spawngroup.target, spawngroup.spawnlist, util::get_team_mapping(spawngroup.script_team));
    }
}

// Namespace userspawnselection/userspawnselection
// Params 0, eflags: 0x0
// Checksum 0xdc231ab9, Offset: 0xe30
// Size: 0x70
function clearcacheforplayer() {
    if (!isdefined(self) || !isdefined(self.clientid)) {
        return;
    }
    if (isdefined(level.spawnselect.lastchosenplayerspawns) && isdefined(level.spawnselect.lastchosenplayerspawns[self.clientid])) {
        level.spawnselect.lastchosenplayerspawns[self.clientid] = undefined;
    }
}

// Namespace userspawnselection/userspawnselection
// Params 0, eflags: 0x0
// Checksum 0x76cc352f, Offset: 0xea8
// Size: 0x16
function clearcacheforallplayers() {
    level.spawnselect.lastchosenplayerspawns = [];
}

// Namespace userspawnselection/userspawnselection
// Params 0, eflags: 0x0
// Checksum 0x903333eb, Offset: 0xec8
// Size: 0x9c
function getlastchosenspawngroupforplayer() {
    if (!isdefined(level.spawnselect.lastchosenplayerspawns[self.clientid])) {
        return undefined;
    }
    if (level.spawnselect.lastchosenplayerspawns[self.clientid] == -2) {
        return undefined;
    }
    lastchosenid = level.spawnselect.lastchosenplayerspawns[self.clientid];
    if (!isdefined(level.spawngroups[lastchosenid])) {
        return undefined;
    }
    return level.spawngroups[lastchosenid];
}

// Namespace userspawnselection/userspawnselection
// Params 0, eflags: 0x0
// Checksum 0xc11fc3db, Offset: 0xf70
// Size: 0x34
function onroundchange() {
    clearcacheforallplayers();
    supressspawnselectionmenuforallplayers();
    closespawnselectionmenuforallplayers();
}

// Namespace userspawnselection/userspawnselection
// Params 0, eflags: 0x0
// Checksum 0xa1d71373, Offset: 0xfb0
// Size: 0x36
function function_5cd68e00() {
    player = self;
    level.spawnselect.lastchosenplayerspawns[player.clientid] = -2;
}

// Namespace userspawnselection/userspawnselection
// Params 0, eflags: 0x0
// Checksum 0x9e291558, Offset: 0xff0
// Size: 0x12
function supressspawnselectionmenuforallplayers() {
    level.showspawnselectionmenu = [];
}

// Namespace userspawnselection/userspawnselection
// Params 0, eflags: 0x0
// Checksum 0x77029ba6, Offset: 0x1010
// Size: 0x164
function shouldshowspawnselectionmenu() {
    isbot = isbot(self);
    var_1367cd2a = (isdefined(level.spawnselect.lastchosenplayerspawns[self.clientid]) ? level.spawnselect.lastchosenplayerspawns[self.clientid] : -1) == -2;
    gameended = gamestate::is_game_over();
    nolives = level.numteamlives > 0 && game.lives[self.team] < 0;
    var_d302b268 = (isdefined(level.spawnselect.var_d302b268) ? level.spawnselect.var_d302b268 : 0) && function_127864f2(self);
    return !isbot && !var_1367cd2a && !level.infinalkillcam && !gameended && !nolives || var_d302b268;
}

// Namespace userspawnselection/userspawnselection
// Params 0, eflags: 0x0
// Checksum 0x3cc78e38, Offset: 0x1180
// Size: 0x1e
function activatespawnselectionmenu() {
    level.showspawnselectionmenu[self.clientid] = 1;
}

// Namespace userspawnselection/userspawnselection
// Params 0, eflags: 0x0
// Checksum 0x4ae89e93, Offset: 0x11a8
// Size: 0x80
function openspawnselect() {
    if (isdefined(level.var_582f7d48) && level.var_582f7d48) {
        while (isdefined(level.var_582f7d48) && level.var_582f7d48) {
            waitframe(1);
        }
    }
    self clientfield::set_player_uimodel("hudItems.showSpawnSelect", 1);
    level notify(#"hash_4c1be11f1e312a36");
}

// Namespace userspawnselection/userspawnselection
// Params 0, eflags: 0x0
// Checksum 0xa421c4f7, Offset: 0x1230
// Size: 0x38
function closespawnselect() {
    self clientfield::set_player_uimodel("hudItems.showSpawnSelect", 0);
    level notify(#"hash_48b4c5f856407d62");
}

// Namespace userspawnselection/userspawnselection
// Params 0, eflags: 0x0
// Checksum 0xca49b1a9, Offset: 0x1270
// Size: 0x28
function function_fed7687f() {
    return self clientfield::get_player_uimodel("hudItems.showSpawnSelect") == 1;
}

// Namespace userspawnselection/userspawnselection
// Params 0, eflags: 0x0
// Checksum 0xeff11d6e, Offset: 0x12a0
// Size: 0x90
function closespawnselectionmenuforallplayers() {
    players = getplayers();
    foreach (player in players) {
        player closespawnselect();
    }
}

// Namespace userspawnselection/userspawnselection
// Params 0, eflags: 0x0
// Checksum 0x76895681, Offset: 0x1338
// Size: 0x54
function function_b55c5868() {
    self endon(#"disconnect", #"end_respawn");
    self openspawnselect();
    self thread watchforselectiontimeout();
}

// Namespace userspawnselection/userspawnselection
// Params 0, eflags: 0x0
// Checksum 0x66e309ee, Offset: 0x1398
// Size: 0x184
function waitforspawnselection() {
    self endon(#"disconnect", #"end_respawn");
    while (true) {
        waitresult = self waittill(#"menuresponse");
        menu = waitresult.menu;
        response = waitresult.response;
        if (response == "SpawnRegionFocus") {
            waitframe(1);
            continue;
        }
        var_ff3ca6eb = 0;
        if (isdefined(level.var_2fa4efc2)) {
            var_ff3ca6eb = [[ level.var_2fa4efc2 ]](waitresult);
        }
        if (menu == "SpawnSelect" && !var_ff3ca6eb) {
            if (isplayer(self)) {
                self setspawngroupforplayer(waitresult.intpayload);
                if (!level.infinalkillcam) {
                    self killcam::function_875fc588();
                }
                self closespawnselect();
                self.var_eca4c67f = 0;
            }
            return;
        }
        waitframe(1);
    }
    self closespawnselect();
}

// Namespace userspawnselection/userspawnselection
// Params 0, eflags: 0x0
// Checksum 0xd68e5371, Offset: 0x1528
// Size: 0x84
function watchforselectiontimeout() {
    self endon(#"disconnect", #"end_respawn");
    self.spawnselect_start_time = gettime();
    while (true) {
        if (level.spawnselect_timelimit_ms - gettime() - self.spawnselect_start_time <= 0) {
            self luinotifyevent(#"force_spawn_selection");
            return;
        }
        wait(0.1);
    }
}

// Namespace userspawnselection/userspawnselection
// Params 0, eflags: 0x4
// Checksum 0xb7413c09, Offset: 0x15b8
// Size: 0x1c
function private on_player_disconnect() {
    self clearcacheforplayer();
}

// Namespace userspawnselection/userspawnselection
// Params 1, eflags: 0x0
// Checksum 0xf5963afe, Offset: 0x15e0
// Size: 0x206
function filter_spawnpoints(spawnpoints) {
    e_player = self;
    if (!isdefined(level.spawnselect.lastchosenplayerspawns[e_player.clientid])) {
        return undefined;
    }
    spawbeaconid = level.spawnselect.lastchosenplayerspawns[e_player.clientid];
    if (spawbeaconid == -1) {
        return undefined;
    }
    if (spawbeaconid == -2) {
        return undefined;
    }
    if (!isdefined(level.spawnselect.vox_plr_1_revive_down_2[spawbeaconid])) {
        /#
            print("<unknown string>");
        #/
        level.spawnselect.lastchosenplayerspawns[e_player.clientid] = -1;
        return undefined;
    }
    assert(e_player getteam() == level.spawnselect.vox_plr_1_revive_down_2[spawbeaconid].team);
    if (e_player getteam() != level.spawnselect.vox_plr_1_revive_down_2[spawbeaconid].team) {
        return undefined;
    }
    assert(isdefined(level.spawnselect.vox_plr_1_revive_down_2[spawbeaconid].spawns) && level.spawnselect.vox_plr_1_revive_down_2[spawbeaconid].spawns.size > 0);
    e_player.var_7007b746 = 1;
    return level.spawnselect.vox_plr_1_revive_down_2[spawbeaconid].spawns;
}

// Namespace userspawnselection/userspawnselection
// Params 1, eflags: 0x4
// Checksum 0x576bf9a, Offset: 0x17f0
// Size: 0x5a2
function private function_259770ba(e_player) {
    if (!isdefined(level.spawnselect.lastchosenplayerspawns[e_player.clientid]) || level.usestartspawns) {
        return undefined;
    }
    spawbeaconid = level.spawnselect.lastchosenplayerspawns[e_player.clientid];
    if (spawbeaconid == -1) {
        return undefined;
    }
    if (spawbeaconid == -2) {
        return undefined;
    }
    if (!isdefined(level.spawnselect.vox_plr_1_revive_down_2[spawbeaconid])) {
        /#
            print("<unknown string>");
        #/
        level.spawnselect.lastchosenplayerspawns[e_player.clientid] = -1;
        return undefined;
    }
    if (e_player getteam() != level.spawnselect.vox_plr_1_revive_down_2[spawbeaconid].team) {
        /#
            println("<unknown string>");
            println("<unknown string>" + spawbeaconid + "<unknown string>");
            println("<unknown string>" + e_player.team + "<unknown string>");
            for (index = 0; index < level.spawnselect.vox_plr_1_revive_down_2.size; index++) {
                if (!isdefined(level.spawnselect.vox_plr_1_revive_down_2[spawbeaconid])) {
                    continue;
                }
                println("<unknown string>" + index + "<unknown string>");
                println("<unknown string>" + level.spawnselect.vox_plr_1_revive_down_2[spawbeaconid].objectiveid + "<unknown string>");
                println("<unknown string>" + level.spawnselect.vox_plr_1_revive_down_2[spawbeaconid].team + "<unknown string>");
                if (isdefined(level.spawnselect.vox_plr_1_revive_down_2[spawbeaconid].owner.playername)) {
                    println("<unknown string>" + level.spawnselect.vox_plr_1_revive_down_2[spawbeaconid].owner.playername + "<unknown string>");
                }
                println("<unknown string>");
            }
            println("<unknown string>" + level.numgametypereservedobjectives + "<unknown string>");
            println("<unknown string>" + level.releasedobjectives.size + "<unknown string>");
            println("<unknown string>");
            foreach (objid in level.releasedobjectives) {
                println(objid + "<unknown string>");
            }
            println("<unknown string>");
            foreach (objid in level.spawnbeaconsettings.var_e7571ff1) {
                println(objid + "<unknown string>");
            }
            println("<unknown string>");
        #/
        assert(e_player.team == level.spawnselect.vox_plr_1_revive_down_2[spawbeaconid].team);
        return undefined;
    }
    assert(isdefined(level.spawnselect.vox_plr_1_revive_down_2[spawbeaconid].spawns) && level.spawnselect.vox_plr_1_revive_down_2[spawbeaconid].spawns.size > 0);
    return level.spawnselect.vox_plr_1_revive_down_2[spawbeaconid].spawnlist;
}

// Namespace userspawnselection/userspawnselection
// Params 1, eflags: 0x4
// Checksum 0xe4e28a86, Offset: 0x1da0
// Size: 0x20
function private getclientfieldprefix(id) {
    return "spawngroupStatus." + id + ".";
}

// Namespace userspawnselection/userspawnselection
// Params 0, eflags: 0x4
// Checksum 0x5731836d, Offset: 0x1dc8
// Size: 0x17c
function private registerclientfields() {
    for (index = 0; index < 20; index++) {
        basename = getclientfieldprefix(index);
        clientfield::register("worlduimodel", basename + "visStatus", 1, 1, "int");
        clientfield::register("worlduimodel", basename + "useStatus", 1, 1, "int");
        clientfield::register("worlduimodel", basename + "team", 1, 2, "int");
    }
    clientfield::register("clientuimodel", "hudItems.showSpawnSelect", 1, 1, "int");
    clientfield::register("clientuimodel", "hudItems.killcamActive", 1, 1, "int");
    clientfield::register("worlduimodel", "hideautospawnoption", 1, 1, "int");
}

// Namespace userspawnselection/userspawnselection
// Params 0, eflags: 0x0
// Checksum 0xc9a29857, Offset: 0x1f50
// Size: 0x2c
function waitandenablespawngroups() {
    util::wait_network_frame(1);
    setspawngroupsenabled();
}

// Namespace userspawnselection/userspawnselection
// Params 1, eflags: 0x0
// Checksum 0x92c3a32, Offset: 0x1f88
// Size: 0x2c
function function_4f78b01d(shoulddisable) {
    level clientfield::set_world_uimodel("hideautospawnoption", shoulddisable);
}

// Namespace userspawnselection/userspawnselection
// Params 0, eflags: 0x0
// Checksum 0x9190a893, Offset: 0x1fc0
// Size: 0x12e
function on_start_gametype() {
    spawngroups = getentarray("spawn_group_marker", "classname");
    if (!isdefined(spawngroups) || spawngroups.size == 0) {
        return;
    }
    if (level.usespawngroups) {
        spawngroupssorted = arraysort(spawngroups, (0, 0, 0), 1);
        foreach (spawngroup in spawngroupssorted) {
            if (!globallogic_spawn::function_d3d4ff67(spawngroup)) {
                continue;
            }
            setupspawngroup(spawngroup);
        }
    }
    waitandenablespawngroups();
    if (isspawnselectenabled()) {
    }
}

// Namespace userspawnselection/userspawnselection
// Params 3, eflags: 0x4
// Checksum 0x44168803, Offset: 0x20f8
// Size: 0x200
function private setupspawnlistforspawngroup(spawngroupkey, spawnlistname, team) {
    rawspawns = struct::get_array(spawngroupkey, "groupname");
    if (!isdefined(rawspawns)) {
        return;
    }
    self.spawns = [];
    var_38345be7 = 0;
    var_496cfe58 = 0;
    var_12de913c = 0;
    var_3cc38ddd = 0;
    foreach (spawn in rawspawns) {
        if (!globallogic_spawn::function_d3d4ff67(spawn)) {
            continue;
        }
        if (!isdefined(spawn.enabled)) {
            spawn.enabled = -1;
        }
        array::add(self.spawns, spawn);
        var_38345be7 = var_38345be7 + spawn.origin[0];
        var_496cfe58 = var_496cfe58 + spawn.origin[1];
        var_12de913c = var_12de913c + spawn.origin[2];
        var_3cc38ddd++;
    }
    var_b5d9fb3a = undefined;
    if (var_3cc38ddd > 0) {
        var_b5d9fb3a = (var_38345be7 / var_3cc38ddd, var_496cfe58 / var_3cc38ddd, var_12de913c / var_3cc38ddd);
    }
    addspawnpoints(team, self.spawns, spawnlistname);
    return var_b5d9fb3a;
}

// Namespace userspawnselection/userspawnselection
// Params 1, eflags: 0x4
// Checksum 0x5e33657a, Offset: 0x2300
// Size: 0x176
function private setupspawngroup(spawngroup) {
    spawngroup.objectiveid = gameobjects::get_next_obj_id();
    if (level.teambased && isdefined(game.switchedsides) && game.switchedsides) {
        spawngroup.team = util::getotherteam(spawngroup.script_team);
    } else {
        spawngroup.team = spawngroup.script_team;
    }
    var_b5d9fb3a = spawngroup setupspawnlistforspawngroup(spawngroup.target, spawngroup.spawnlist, spawngroup.team);
    objectivename = spawngroup.script_objective;
    objective_add(spawngroup.objectiveid, "active", var_b5d9fb3a, objectivename);
    objective_setteam(spawngroup.objectiveid, spawngroup.team);
    level.spawnselect.vox_plr_1_revive_down_2[spawngroup.objectiveid] = spawngroup;
    spawngroup.var_34d7dddd = 1;
}

// Namespace userspawnselection/userspawnselection
// Params 1, eflags: 0x0
// Checksum 0x41923b79, Offset: 0x2480
// Size: 0x98
function getteamclientfieldvalue(team) {
    if (!isdefined(team)) {
        return 0;
    }
    teamname = util::get_team_mapping(team);
    if (team == #"allies") {
        return 1;
    } else if (team == #"axis") {
        return 2;
    } else if (team == #"neutral") {
        return 3;
    }
    return 0;
}

