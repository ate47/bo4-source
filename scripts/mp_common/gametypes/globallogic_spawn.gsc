// Atian COD Tools GSC decompiler test
#using scripts\mp_common\util.gsc;
#using scripts\mp_common\userspawnselection.gsc;
#using scripts\mp_common\callbacks.gsc;
#using scripts\mp_common\teams\teams.gsc;
#using scripts\mp_common\player\player_utils.gsc;
#using scripts\mp_common\player\player_monitor.gsc;
#using scripts\mp_common\player\player_loadout.gsc;
#using scripts\mp_common\player\player_killed.gsc;
#using scripts\mp_common\gametypes\hud_message.gsc;
#using scripts\mp_common\gametypes\hostmigration.gsc;
#using scripts\mp_common\gametypes\globallogic_utils.gsc;
#using scripts\mp_common\gametypes\globallogic_ui.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using scripts\mp_common\gametypes\globallogic_defaults.gsc;
#using scripts\mp_common\gametypes\globallogic_audio.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\mp_common\gametypes\battlechatter.gsc;
#using scripts\mp_common\draft.gsc;
#using scripts\mp_common\bots\mp_bot.gsc;
#using scripts\mp_common\armor.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\core_common\match_record.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\spectating.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\player\player_shared.gsc;
#using scripts\core_common\player\player_role.gsc;
#using scripts\core_common\player\player_loadout.gsc;
#using scripts\core_common\oob.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\hud_util_shared.gsc;
#using scripts\core_common\hud_message_shared.gsc;
#using scripts\core_common\hostmigration_shared.gsc;
#using scripts\core_common\gamestate.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace globallogic_spawn;

// Namespace globallogic_spawn/globallogic_spawn
// Params 0, eflags: 0x2
// Checksum 0xf9a5ea21, Offset: 0x350
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"globallogic_spawn", &__init__, undefined, undefined);
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 0, eflags: 0x0
// Checksum 0xc2b3c015, Offset: 0x398
// Size: 0x236
function __init__() {
    level.var_b3c4b7b7 = getgametypesetting(#"hash_4bf99a809542e4ea");
    level.requirespawnpointstoexistinlevel = 0;
    level.spawnsystem.var_3709dc53 = 0;
    spawning::add_default_spawnlist("auto_normal");
    level.spawnentitytypes = [];
    array::add(level.spawnentitytypes, {#team:"all", #entityname:"mp_t8_spawn_point"});
    if (level.gametype == #"dom") {
        array::add(level.spawnentitytypes, {#team:#"allies", #entityname:"mp_t8_spawn_point"});
        array::add(level.spawnentitytypes, {#team:#"axis", #entityname:"mp_t8_spawn_point"});
    }
    array::add(level.spawnentitytypes, {#team:#"allies", #entityname:"mp_t8_spawn_point_allies"});
    array::add(level.spawnentitytypes, {#team:#"axis", #entityname:"mp_t8_spawn_point_axis"});
    level.allspawnpoints = [];
    level.spawnpoints = [];
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 0, eflags: 0x0
// Checksum 0x6d1d595a, Offset: 0x5d8
// Size: 0xe
function getspawnentitytypes() {
    return level.spawnentitytypes;
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 0, eflags: 0x0
// Checksum 0xf12a6794, Offset: 0x5f0
// Size: 0xe
function getmpspawnpoints() {
    return level.allspawnpoints;
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 2, eflags: 0x0
// Checksum 0x525ef529, Offset: 0x608
// Size: 0x7cc
function function_82ca1565(spawnpoint, gametype) {
    switch (gametype) {
    case #"ffa":
        return (isdefined(spawnpoint.ffa) && spawnpoint.ffa);
    case #"sd":
        return (isdefined(spawnpoint.sd) && spawnpoint.sd);
    case #"ctf":
        return (isdefined(spawnpoint.ctf) && spawnpoint.ctf);
    case #"dom":
        return (isdefined(spawnpoint.domination) && spawnpoint.domination);
    case #"dem":
        return (isdefined(spawnpoint.demolition) && spawnpoint.demolition);
    case #"gg":
        return (isdefined(spawnpoint.gg) && spawnpoint.gg);
    case #"tdm":
        return (isdefined(spawnpoint.tdm) && spawnpoint.tdm);
    case #"infil":
        return (isdefined(spawnpoint.infiltration) && spawnpoint.infiltration);
    case #"control":
        return (isdefined(spawnpoint.control) && spawnpoint.control);
    case #"uplink":
        return (isdefined(spawnpoint.uplink) && spawnpoint.uplink);
    case #"kc":
        return (isdefined(spawnpoint.kc) && spawnpoint.kc);
    case #"koth":
        return (isdefined(spawnpoint.hardpoint) && spawnpoint.hardpoint);
    case #"frontline":
        return (isdefined(spawnpoint.frontline) && spawnpoint.frontline);
    case #"dom_flag_a":
        return (isdefined(spawnpoint.domination_flag_a) && spawnpoint.domination_flag_a);
    case #"dom_flag_b":
        return (isdefined(spawnpoint.domination_flag_b) && spawnpoint.domination_flag_b);
    case #"dom_flag_c":
        return (isdefined(spawnpoint.domination_flag_c) && spawnpoint.domination_flag_c);
    case #"hash_6056c310624d5afd":
        return (isdefined(spawnpoint.demolition_attacker_a) && spawnpoint.demolition_attacker_a);
    case #"hash_6056c010624d55e4":
        return (isdefined(spawnpoint.demolition_attacker_b) && spawnpoint.demolition_attacker_b);
    case #"hash_6ef2d89ce8ee9a32":
        return (isdefined(spawnpoint.demolition_remove_a) && spawnpoint.demolition_remove_a);
    case #"hash_6ef2d79ce8ee987f":
        return (isdefined(spawnpoint.demolition_remove_b) && spawnpoint.demolition_remove_b);
    case #"dem_overtime":
        return (isdefined(spawnpoint.demolition_overtime) && spawnpoint.demolition_overtime);
    case #"hash_7cb9d0a58715cebe":
        return (isdefined(spawnpoint.demolition_start_spawn) && spawnpoint.demolition_start_spawn);
    case #"hash_6d83e5f1bdefa7dd":
        return (isdefined(spawnpoint.demolition_defender_a) && spawnpoint.demolition_defender_a);
    case #"hash_6d83e2f1bdefa2c4":
        return (isdefined(spawnpoint.demolition_defender_b) && spawnpoint.demolition_defender_b);
    case #"control_attack_add_0":
        return (isdefined(spawnpoint.control_attack_add_a) && spawnpoint.control_attack_add_a);
    case #"control_attack_add_1":
        return (isdefined(spawnpoint.control_attack_add_b) && spawnpoint.control_attack_add_b);
    case #"control_attack_remove_0":
        return (isdefined(spawnpoint.control_attack_remove_a) && spawnpoint.control_attack_remove_a);
    case #"control_attack_remove_1":
        return (isdefined(spawnpoint.control_attack_remove_b) && spawnpoint.control_attack_remove_b);
    case #"control_defend_add_0":
        return (isdefined(spawnpoint.registerlast_mapshouldstun) && spawnpoint.registerlast_mapshouldstun);
    case #"control_defend_add_1":
        return (isdefined(spawnpoint.control_defend_add_b) && spawnpoint.control_defend_add_b);
    case #"control_defend_remove_0":
        return (isdefined(spawnpoint.control_defend_remove_a) && spawnpoint.control_defend_remove_a);
    case #"control_defend_remove_1":
        return (isdefined(spawnpoint.control_defend_remove_b) && spawnpoint.control_defend_remove_b);
    case #"ct":
        return (isdefined(spawnpoint.ct) && spawnpoint.ct);
    case #"escort":
        return (isdefined(spawnpoint.escort) && spawnpoint.escort);
    case #"bounty":
        return (isdefined(spawnpoint.bounty) && spawnpoint.bounty);
    default:
        assertmsg("<unknown string>" + gametype + "<unknown string>" + spawnpoint.origin[0] + "<unknown string>" + spawnpoint.origin[1] + "<unknown string>" + spawnpoint.origin[2]);
        break;
    }
    return false;
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 2, eflags: 0x0
// Checksum 0x83e9ca7f, Offset: 0xde0
// Size: 0x94
function addsupportedspawnpointtype(spawnpointtype, team) {
    if (!isdefined(level.supportedspawntypes)) {
        level.supportedspawntypes = [];
    }
    var_79942a82 = spawnstruct();
    var_79942a82.type = spawnpointtype;
    if (isdefined(team)) {
        var_79942a82.team = team;
    }
    array::add(level.supportedspawntypes, var_79942a82);
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 0, eflags: 0x0
// Checksum 0xb73c55b5, Offset: 0xe80
// Size: 0x1e
function function_c40af6fa() {
    level.supportedspawntypes = [];
    level.allspawnpoints = [];
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 1, eflags: 0x0
// Checksum 0xd05117af, Offset: 0xea8
// Size: 0xaa
function function_d3d4ff67(spawn) {
    foreach (var_a24ffdcc in level.supportedspawntypes) {
        supportedspawntype = var_a24ffdcc.type;
        if (function_82ca1565(spawn, supportedspawntype)) {
            return true;
        }
    }
    return false;
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 4, eflags: 0x0
// Checksum 0x1de0395, Offset: 0xf60
// Size: 0x244
function addspawnsforteamname(teamname, searchentity, &spawnarray, &startspawns) {
    rawspawns = struct::get_array(searchentity, "targetname");
    foreach (spawn in rawspawns) {
        array::add(level.allspawnpoints, spawn);
        spawn.team = teamname;
        foreach (var_a24ffdcc in level.supportedspawntypes) {
            supportedspawntype = var_a24ffdcc.type;
            if (!function_82ca1565(spawn, supportedspawntype)) {
                continue;
            }
            teamname = util::get_team_mapping(teamname);
            if (isdefined(var_a24ffdcc.team)) {
                if (teamname != var_a24ffdcc.team) {
                    continue;
                }
            }
            usespawnarray = isdefined(spawn._human_were) ? spawn._human_were : 0 ? startspawns : spawnarray;
            if (!isdefined(usespawnarray[teamname])) {
                usespawnarray[teamname] = [];
            }
            if (!isdefined(spawn.enabled)) {
                spawn.enabled = -1;
            }
            array::add(usespawnarray[teamname], spawn);
        }
    }
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 2, eflags: 0x0
// Checksum 0x66d1b2be, Offset: 0x11b0
// Size: 0x1c8
function function_d400d613(targetname, typesarray) {
    returnarray = [];
    rawspawns = struct::get_array(targetname, "targetname");
    foreach (spawn in rawspawns) {
        foreach (supportedspawntype in typesarray) {
            if (!function_82ca1565(spawn, supportedspawntype)) {
                continue;
            }
            if (!isdefined(returnarray[supportedspawntype])) {
                returnarray[supportedspawntype] = [];
            }
            if (!isdefined(returnarray[supportedspawntype])) {
                returnarray[supportedspawntype] = [];
            } else if (!isarray(returnarray[supportedspawntype])) {
                returnarray[supportedspawntype] = array(returnarray[supportedspawntype]);
            }
            returnarray[supportedspawntype][returnarray[supportedspawntype].size] = spawn;
        }
    }
    return returnarray;
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 0, eflags: 0x4
// Checksum 0xbc6dd3, Offset: 0x1380
// Size: 0x68a
function private function_68312709() {
    spawnstoadd = [];
    startspawns = [];
    foreach (spawnentitytype in level.spawnentitytypes) {
        addspawnsforteamname(spawnentitytype.team, spawnentitytype.entityname, spawnstoadd, startspawns);
    }
    spawnteams = getarraykeys(spawnstoadd);
    foreach (spawnteam in spawnteams) {
        if (spawnteam == "all") {
            if (sessionmodeiswarzonegame()) {
                addspawnpoints("free", spawnstoadd[spawnteam], "auto_normal");
                addspawnpoints(#"axis", spawnstoadd[spawnteam], "fallback");
                addspawnpoints(#"allies", spawnstoadd[spawnteam], "fallback");
                enablespawnpointlist("auto_normal", util::getteammask("free"));
                level.spawnpoints = arraycombine(level.spawnpoints, spawnstoadd[spawnteam], 0, 0);
            } else {
                foreach (team, _ in level.teams) {
                    addspawnpoints(team, spawnstoadd[spawnteam], "auto_normal");
                    level.spawnpoints = arraycombine(level.spawnpoints, spawnstoadd[spawnteam], 0, 0);
                    enablespawnpointlist("auto_normal", util::getteammask(team));
                }
            }
            continue;
        }
        teamforspawns = spawning::function_1bc642b7() ? util::getotherteam(spawnteam) : spawnteam;
        addspawnpoints(teamforspawns, spawnstoadd[spawnteam], "auto_normal");
        otherteam = util::getotherteam(teamforspawns);
        addspawnpoints(otherteam, spawnstoadd[spawnteam], "fallback");
        enablespawnpointlist("auto_normal", util::getteammask(teamforspawns));
        foreach (spawnpoint in spawnstoadd[spawnteam]) {
            array::add(level.spawnpoints, spawnpoint, 0);
        }
    }
    if (!isdefined(level.spawn_start)) {
        level.spawn_start = [];
    }
    var_d74bb7ad = getarraykeys(startspawns);
    foreach (spawnteam in var_d74bb7ad) {
        if (spawnteam == "all") {
            foreach (team, _ in level.teams) {
                if (!isdefined(level.spawn_start[team])) {
                    level.spawn_start[team] = [];
                }
                level.spawn_start[team] = arraycombine(level.spawn_start[team], startspawns[spawnteam], 0, 0);
            }
            continue;
        }
        teamforspawns = spawning::function_1bc642b7() ? util::getotherteam(spawnteam) : spawnteam;
        if (!isdefined(level.spawn_start[teamforspawns])) {
            level.spawn_start[teamforspawns] = [];
        }
        level.spawn_start[teamforspawns] = arraycombine(level.spawn_start[teamforspawns], startspawns[spawnteam], 0, 0);
    }
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 0, eflags: 0x0
// Checksum 0x47e42e74, Offset: 0x1a18
// Size: 0x382
function function_8acd9309() {
    spawnarray = [];
    startspawns = [];
    if (!isdefined(level.allspawnpoints)) {
        level.allspawnpoints = [];
    }
    foreach (spawnentitytype in level.spawnentitytypes) {
        rawspawns = struct::get_array(spawnentitytype.entityname, "targetname");
        foreach (spawn in rawspawns) {
            array::add(level.allspawnpoints, spawn);
            foreach (var_a24ffdcc in level.supportedspawntypes) {
                supportedspawntype = var_a24ffdcc.type;
                if (!function_82ca1565(spawn, supportedspawntype)) {
                    continue;
                }
                usespawnarray = isdefined(spawn._human_were) ? spawn._human_were : 0 ? startspawns : spawnarray;
                if (!isdefined(spawn.enabled)) {
                    spawn.enabled = -1;
                }
                array::add(usespawnarray, spawn);
            }
        }
    }
    addspawnpoints("free", spawnarray, "auto_normal");
    enablespawnpointlist("auto_normal", util::getteammask("free"));
    level.spawnpoints = arraycombine(level.spawnpoints, spawnarray, 0, 0);
    if (!isdefined(level.spawn_start)) {
        level.spawn_start = [];
    }
    if (!isdefined(level.spawn_start[#"free"])) {
        level.spawn_start[#"free"] = [];
    }
    level.spawn_start[#"free"] = arraycombine(level.spawn_start[#"free"], startspawns, 0, 0);
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 0, eflags: 0x0
// Checksum 0xf17171b8, Offset: 0x1da8
// Size: 0xfc
function addspawns() {
    clearspawnpoints("auto_normal");
    clearspawnpoints("fallback");
    if (level.teambased) {
        if (!isdefined(level.supportedspawntypes)) {
            println("<unknown string>");
            addsupportedspawnpointtype("tdm");
        }
        function_68312709();
    } else {
        function_8acd9309();
    }
    calculate_map_center();
    spawnpoint = spawning::get_random_intermission_point();
    setdemointermissionpoint(spawnpoint.origin, spawnpoint.angles);
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 0, eflags: 0x0
// Checksum 0xb49ebb05, Offset: 0x1eb0
// Size: 0x16c
function calculate_map_center() {
    if (!isdefined(level.mapcenter)) {
        spawn_points = level.spawnpoints;
        if (isdefined(spawn_points[0])) {
            level.spawnmins = spawn_points[0].origin;
            level.spawnmaxs = spawn_points[0].origin;
        } else {
            level.spawnmins = (0, 0, 0);
            level.spawnmaxs = (0, 0, 0);
        }
        for (index = 0; index < spawn_points.size; index++) {
            origin = spawn_points[index].origin;
            level.spawnmins = math::expand_mins(level.spawnmins, origin);
            level.spawnmaxs = math::expand_maxs(level.spawnmaxs, origin);
        }
        level.mapcenter = math::find_box_center(level.spawnmins, level.spawnmaxs);
        setmapcenter(level.mapcenter);
    }
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 1, eflags: 0x0
// Checksum 0x65121bf7, Offset: 0x2028
// Size: 0x244
function timeuntilspawn(includeteamkilldelay) {
    if (level.ingraceperiod && isdefined(self.hasspawned) && !self.hasspawned) {
        return 0;
    }
    respawndelay = 0;
    if (isdefined(self.hasspawned) && self.hasspawned) {
        result = self [[ level.onrespawndelay ]]();
        if (isdefined(result)) {
            respawndelay = result;
        } else {
            respawndelay = level.playerrespawndelay;
        }
        if (isdefined(level.playerincrementalrespawndelay) && isdefined(self.pers[#"spawns"])) {
            respawndelay = respawndelay + level.playerincrementalrespawndelay * self.pers[#"spawns"];
        }
        if (isdefined(self.suicide) && self.suicide && level.suicidespawndelay > 0) {
            respawndelay = respawndelay + level.suicidespawndelay;
        }
        if (isdefined(self.teamkilled) && self.teamkilled && level.teamkilledspawndelay > 0) {
            respawndelay = respawndelay + level.teamkilledspawndelay;
        }
        if (includeteamkilldelay && isdefined(self.teamkillpunish) && self.teamkillpunish) {
            respawndelay = respawndelay + player::function_821200bb();
        }
    }
    if (isdefined(level.deathcirclerespawn) && level.deathcirclerespawn) {
        return self function_ac5b273c(respawndelay);
    }
    wavebased = level.waverespawndelay > 0;
    if (wavebased) {
        return self timeuntilwavespawn(respawndelay);
    }
    if (isdefined(self.usedresurrect) && self.usedresurrect) {
        return 0;
    }
    return respawndelay;
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 0, eflags: 0x0
// Checksum 0xca6f5c04, Offset: 0x2278
// Size: 0xa8
function allteamshaveexisted() {
    foreach (team, _ in level.teams) {
        if (!teams::function_9dd75dad(team)) {
            return false;
        }
        if (level.everexisted[team] > gettime() + 1000) {
            return false;
        }
    }
    return true;
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 0, eflags: 0x0
// Checksum 0x2a9e60ad, Offset: 0x2328
// Size: 0x152
function function_38527849() {
    if (level.numlives || level.numteamlives) {
        if (level.numlives && !self.pers[#"lives"]) {
            return false;
        } else if (!level.numlives && level.numteamlives && game.lives[self.team] <= 0) {
            return false;
        } else {
            if (level.teambased) {
                gamehasstarted = allteamshaveexisted();
            } else {
                gamehasstarted = level.maxplayercount > 1 || !util::isoneround() && !util::isfirstround();
            }
            if (gamehasstarted && isdefined(level.var_60507c71) && level.var_60507c71) {
                if (!level.ingraceperiod && !self.hasspawned) {
                    return false;
                }
            }
        }
    }
    return true;
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 0, eflags: 0x0
// Checksum 0x4b91a67d, Offset: 0x2488
// Size: 0x112
function mayspawn() {
    if (isdefined(level.mayspawn) && !self [[ level.mayspawn ]]()) {
        return 0;
    }
    if (level.playerqueuedrespawn && !isdefined(self.allowqueuespawn) && !level.ingraceperiod && !level.usestartspawns) {
        return 0;
    }
    if (game.state == "playing" && level.var_c2cc011f && level.aliveplayers[self.team].size == 0) {
        return 0;
    }
    if (isdefined(level.var_75db41a7) && gettime() >= level.var_75db41a7) {
        return 0;
    }
    if (isdefined(self.iseliminated) && self.iseliminated) {
        return 0;
    }
    return function_38527849();
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 1, eflags: 0x0
// Checksum 0x8592bfb9, Offset: 0x25a8
// Size: 0x82
function function_ac5b273c(minimumwait) {
    earliestspawntime = gettime() + int(minimumwait * 1000);
    if (!isdefined(level.var_56baa802)) {
        return 0;
    }
    return max(float(level.var_56baa802 - gettime()) / 1000, 0);
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 1, eflags: 0x0
// Checksum 0x3f9893b8, Offset: 0x2638
// Size: 0x154
function timeuntilwavespawn(minimumwait) {
    earliestspawntime = gettime() + int(minimumwait * 1000);
    lastwavetime = level.lastwave[self.pers[#"team"]];
    wavedelay = int(level.wavedelay[self.pers[#"team"]] * 1000);
    if (wavedelay == 0) {
        return 0;
    }
    numwavespassedearliestspawntime = (earliestspawntime - lastwavetime) / wavedelay;
    numwaves = ceil(numwavespassedearliestspawntime);
    timeofspawn = lastwavetime + numwaves * wavedelay;
    if (isdefined(self.wavespawnindex)) {
        timeofspawn = timeofspawn + 50 * self.wavespawnindex;
    }
    return float(timeofspawn - gettime()) / 1000;
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 0, eflags: 0x0
// Checksum 0x7a0f7387, Offset: 0x2798
// Size: 0x46
function stoppoisoningandflareonspawn() {
    self endon(#"disconnect");
    self.inpoisonarea = 0;
    self.inburnarea = 0;
    self.inflarevisionarea = 0;
    self.ingroundnapalm = 0;
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 0, eflags: 0x0
// Checksum 0x47555e96, Offset: 0x27e8
// Size: 0x110
function spawnplayerprediction() {
    self endon(#"disconnect", #"end_respawn", #"game_ended", #"joined_spectators", #"spawned");
    plrs = teams::count_players();
    nolivesleft = level.numlives && !self.pers[#"lives"] || level.numteamlives && game.lives[self.team] > 0;
    if (nolivesleft) {
        return;
    }
    while (true) {
        wait(0.5);
        spawning::onspawnplayer(1);
    }
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 1, eflags: 0x0
// Checksum 0x59daf4ce, Offset: 0x2900
// Size: 0x1bc
function playmatchstartaudio(team) {
    self endon(#"disconnect");
    for (index = 0; index < 5; index++) {
        waitframe(1);
    }
    if (self.pers[#"playedgamemode"] !== 1) {
        if (level.hardcoremode) {
            if (globallogic_utils::function_308e3379()) {
                self globallogic_audio::leader_dialog_on_player(level.leaderdialog.var_d04b3734);
            } else {
                self globallogic_audio::leader_dialog_on_player(level.leaderdialog.starthcgamedialog);
            }
        } else if (globallogic_utils::function_308e3379()) {
            self globallogic_audio::leader_dialog_on_player(level.leaderdialog.var_f6fda321);
        } else {
            self globallogic_audio::leader_dialog_on_player(level.leaderdialog.startgamedialog);
        }
        self.pers[#"playedgamemode"] = 1;
    }
    if (team == game.attackers) {
        self globallogic_audio::leader_dialog_on_player(level.leaderdialog.offenseorderdialog);
        return;
    }
    self globallogic_audio::leader_dialog_on_player(level.leaderdialog.defenseorderdialog);
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 1, eflags: 0x0
// Checksum 0xdb2f2cee, Offset: 0x2ac8
// Size: 0x1fc
function doinitialspawnmessaging(params = undefined) {
    pixbeginevent(#"sound");
    if (sessionmodeismultiplayergame() && !(isdefined(self.var_b279086a) && self.var_b279086a)) {
        self show();
        self solid();
    }
    if (level.gametype !== "bounty") {
        if (isdefined(self.pers[#"music"].spawn) && self.pers[#"music"].spawn == 0) {
            if (game.roundsplayed == 0) {
                self thread globallogic_audio::set_music_on_player("spawnFull");
            } else {
                self thread globallogic_audio::set_music_on_player("spawnShort");
            }
            self.pers[#"music"].spawn = 1;
        }
    }
    if (level.splitscreen) {
        if (isdefined(level.playedstartingmusic)) {
            music = undefined;
        } else {
            level.playedstartingmusic = 1;
        }
    }
    self.playleaderdialog = 1;
    if (isdefined(level.leaderdialog)) {
        self thread playmatchstartaudio(self.pers[#"team"]);
    }
    pixendevent();
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 0, eflags: 0x0
// Checksum 0xcf1d9aad, Offset: 0x2cd0
// Size: 0xe
function resetattackersthisspawnlist() {
    self.attackersthisspawn = [];
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 0, eflags: 0x0
// Checksum 0xdee70e85, Offset: 0x2ce8
// Size: 0xc54
function spawnplayer() {
    pixbeginevent(#"spawnplayer_preuts");
    self endon(#"disconnect", #"joined_spectators");
    hadspawned = self.hasspawned;
    self player::spawn_player();
    if (globallogic_utils::getroundstartdelay()) {
        self thread globallogic_utils::applyroundstartdelay();
    }
    if (isdefined(self.spawnlightarmor) && self.spawnlightarmor > 0) {
        self thread armor::setlightarmor(self.spawnlightarmor);
    }
    self.nextkillstreakfree = undefined;
    self.deathmachinekills = 0;
    self resetattackersthisspawnlist();
    self.diedonvehicle = undefined;
    if (isdefined(self.wasaliveatmatchstart) && !self.wasaliveatmatchstart) {
        if (level.ingraceperiod || globallogic_utils::gettimepassed() < int(20 * 1000)) {
            self.wasaliveatmatchstart = 1;
        }
    }
    pixbeginevent(#"onspawnplayer");
    self [[ level.onspawnplayer ]](0);
    if (isdefined(level.playerspawnedcb)) {
        self [[ level.playerspawnedcb ]]();
    }
    pixendevent();
    pixendevent();
    level thread globallogic::updateteamstatus();
    pixbeginevent(#"spawnplayer_postuts");
    self val::nuke("disable_oob");
    self thread stoppoisoningandflareonspawn();
    self.sensorgrenadedata = undefined;
    self.var_342564dd = 0;
    self.var_6a9b15ba = undefined;
    self.var_ec59e88c = undefined;
    if (level.var_b3c4b7b7 === 1) {
        self player_role::clear();
        draft::assign_remaining_players(self);
    }
    role = self player_role::get();
    assert(!loadout::function_87bcb1b() || globallogic_utils::isvalidclass(self.curclass));
    assert(player_role::is_valid(role));
    self.pers[#"momentum_at_spawn_or_game_end"] = isdefined(self.pers[#"momentum"]) ? self.pers[#"momentum"] : 0;
    if (loadout::function_87bcb1b()) {
        self loadout::function_53b62db1(self.curclass);
    }
    self loadout::give_loadout(self.team, self.curclass);
    if (sessionmodeismultiplayergame() || sessionmodeiswarzonegame()) {
        specialist = function_b14806c6(role, currentsessionmode());
        if (isdefined(specialist)) {
            self function_6c3348ac(specialist);
        }
        var_be574bd8 = self getcharacterlootid();
        outfitindex = self getcharacteroutfit();
        gender = self getplayergendertype();
        warpaintoutfitindex = self getcharacterwarpaintoutfit();
        var_8fa79650 = self getcharacterwarpaintlootid();
        decallootid = self getcharacterdecallootid();
        var_b3d9cfaa = self function_11d0e790();
        var_f8e6b703 = self match_record::get_player_stat(#"hash_ec4aea1a8bbd82");
        if (isdefined(var_f8e6b703)) {
            self match_record::set_stat(#"lives", var_f8e6b703, #"character_gender", gender);
            self match_record::set_stat(#"lives", var_f8e6b703, #"character_decal_lootid", decallootid);
            self match_record::set_stat(#"lives", var_f8e6b703, #"character_outfit_lootid", var_be574bd8);
            self match_record::set_stat(#"lives", var_f8e6b703, #"character_warpaint_lootid", var_8fa79650);
            self match_record::set_stat(#"lives", var_f8e6b703, #"character_outfit", outfitindex);
            self match_record::set_stat(#"lives", var_f8e6b703, #"character_warpaint_outfit", warpaintoutfitindex);
            for (i = 0; i < var_b3d9cfaa.size; i++) {
                self match_record::set_stat(#"lives", var_f8e6b703, #"hash_20d6751cb2f9ca09", i, var_b3d9cfaa[i]);
            }
        }
    }
    if (level.inprematchperiod) {
        self val::set(#"spawn_player", "freezecontrols");
        self val::set(#"spawn_player", "disablegadgets");
        if (sessionmodeismultiplayergame()) {
            self ghost();
            self notsolid();
        }
        self callback::on_prematch_end(&doinitialspawnmessaging);
    } else {
        self val::reset(#"spawn_player", "freezecontrols");
        self val::reset(#"spawn_player", "disablegadgets");
        self enableweapons();
        if (!(isdefined(hadspawned) && hadspawned) && game.state == "playing") {
            self thread doinitialspawnmessaging();
        }
    }
    if (isdefined(level.scoreresetondeath) && level.scoreresetondeath) {
        self globallogic_score::resetplayermomentumonspawn();
    }
    self.deathtime = 0;
    self.pers[#"deathtime"] = 0;
    if (self hasperk(#"specialty_anteup")) {
        anteup_bonus = getdvarint(#"perk_killstreakanteupresetvalue", 0);
        if (self.pers[#"momentum_at_spawn_or_game_end"] < anteup_bonus) {
            globallogic_score::_setplayermomentum(self, anteup_bonus, 0);
        }
    }
    if (!isdefined(getdvar(#"scr_showperksonspawn"))) {
        setdvar(#"scr_showperksonspawn", 0);
    }
    if (level.hardcoremode) {
        setdvar(#"scr_showperksonspawn", 0);
    }
    /#
        if (getdvarint(#"scr_showperksonspawn", 0) == 1 && !gamestate::is_game_over()) {
            pixbeginevent(#"showperksonspawn");
            if (level.perksenabled == 1) {
                self hud::showperks();
            }
            pixendevent();
        }
    #/
    if (isdefined(self.pers[#"momentum"])) {
        self.momentum = self.pers[#"momentum"];
    }
    self callback::function_d8abfc3d(#"on_end_game", &on_end_game);
    self setsprintboost(0);
    pixendevent();
    waittillframeend();
    self notify(#"spawned_player");
    callback::callback(#"on_player_spawned");
    self thread player_monitor::monitor();
    /#
        print("<unknown string>" + self.origin[0] + "<unknown string>" + self.origin[1] + "<unknown string>" + self.origin[2] + "<unknown string>");
    #/
    setdvar(#"scr_selecting_location", "");
    if (gamestate::is_game_over()) {
        assert(!level.intermission);
        self player::freeze_player_for_round_end();
    }
    self util::set_lighting_state();
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 0, eflags: 0x0
// Checksum 0x250207f, Offset: 0x3948
// Size: 0x5e
function on_end_game() {
    self.pers[#"momentum_at_spawn_or_game_end"] = isdefined(self.pers[#"momentum"]) ? self.pers[#"momentum"] : 0;
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 2, eflags: 0x0
// Checksum 0x9b433e8d, Offset: 0x39b0
// Size: 0x4c
function spawnspectator(origin, angles) {
    self notify(#"spawned");
    self notify(#"end_respawn");
    in_spawnspectator(origin, angles);
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 2, eflags: 0x0
// Checksum 0xfe43b1e5, Offset: 0x3a08
// Size: 0x2c
function respawn_asspectator(origin, angles) {
    in_spawnspectator(origin, angles);
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 0, eflags: 0x0
// Checksum 0x3abde065, Offset: 0x3a40
// Size: 0x2ec
function function_3ee5119e() {
    if (self.pers[#"team"] != #"spectator" && level.spectatetype == 4 && self.spectatorteam == #"invalid") {
        team_players = getplayers(self.team);
        foreach (player in team_players) {
            if (player != self && isalive(player)) {
                self.spectatorteam = player.team;
                println("<unknown string>" + player.team + "<unknown string>" + self.name + "<unknown string>" + self.team + "<unknown string>" + player.name + "<unknown string>");
                return;
            }
        }
        foreach (player in team_players) {
            if (player != self && player.spectatorteam != #"invalid") {
                self.spectatorteam = player.spectatorteam;
                println("<unknown string>" + player.spectatorteam + "<unknown string>" + self.name + "<unknown string>" + self.team + "<unknown string>" + player.name + "<unknown string>");
                return;
            }
        }
        self.spectatorteam = self.team;
        println("<unknown string>" + self.spectatorteam + "<unknown string>" + self.name + "<unknown string>" + self.team + "<unknown string>");
    }
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 2, eflags: 0x0
// Checksum 0x565c6e13, Offset: 0x3d38
// Size: 0x1c4
function in_spawnspectator(origin, angles) {
    pixmarker("BEGIN: in_spawnSpectator");
    self player::set_spawn_variables();
    self.sessionstate = "spectator";
    self.killcamentity = -1;
    self.archivetime = 0;
    self.psoffsettime = 0;
    self.spectatekillcam = 0;
    self.friendlydamage = undefined;
    if (self.pers[#"team"] == #"spectator") {
        self.statusicon = "";
    } else {
        self.statusicon = "hud_status_dead";
    }
    if (level.spectatetype != 4 || self.pers[#"team"] == #"spectator") {
        self.spectatorclient = -1;
        spectating::set_permissions_for_machine();
    }
    function_3ee5119e();
    [[ level.onspawnspectator ]](origin, angles);
    if (level.teambased && !level.splitscreen) {
        self thread spectatorthirdpersonness();
    }
    level thread globallogic::updateteamstatus();
    pixmarker("END: in_spawnSpectator");
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 0, eflags: 0x0
// Checksum 0xb8b91414, Offset: 0x3f08
// Size: 0x5a
function spectatorthirdpersonness() {
    self endon(#"disconnect", #"spawned");
    self notify(#"spectator_thirdperson_thread");
    self endon(#"spectator_thirdperson_thread");
    self.spectatingthirdperson = 0;
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 1, eflags: 0x0
// Checksum 0x3b3047f9, Offset: 0x3f70
// Size: 0x150
function forcespawn(time) {
    self endon(#"death", #"disconnect", #"spawned");
    if (!isdefined(time)) {
        time = 60;
    }
    wait(time);
    if (isdefined(self.hasspawned) && self.hasspawned) {
        return;
    }
    if (self.pers[#"team"] == #"spectator") {
        return;
    }
    if (!globallogic_utils::isvalidclass(self.pers[#"class"])) {
        self.pers[#"class"] = "CLASS_CUSTOM1";
        self.curclass = self.pers[#"class"];
    }
    if (!function_8b1a219a()) {
        self globallogic_ui::closemenus();
    }
    self thread [[ level.spawnclient ]]();
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 0, eflags: 0x0
// Checksum 0xa2735df5, Offset: 0x40c8
// Size: 0x64
function kickifdontspawn() {
    /#
        if (getdvarint(#"scr_hostmigrationtest", 0) == 1) {
            return;
        }
    #/
    if (self ishost()) {
        return;
    }
    self kickifidontspawninternal();
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 0, eflags: 0x0
// Checksum 0x72cc8ec2, Offset: 0x4138
// Size: 0x29c
function kickifidontspawninternal() {
    self endon(#"death", #"disconnect", #"spawned");
    while (true) {
        if (!(isdefined(level.inprematchperiod) && level.inprematchperiod) && self isstreamerready()) {
            break;
        }
        wait(5);
    }
    waittime = 90;
    if (getdvarstring(#"scr_kick_time") != "") {
        waittime = getdvarfloat(#"scr_kick_time", 0);
    }
    mintime = 45;
    if (getdvarstring(#"scr_kick_mintime") != "") {
        mintime = getdvarfloat(#"scr_kick_mintime", 0);
    }
    starttime = gettime();
    kickwait(waittime);
    timepassed = float(gettime() - starttime) / 1000;
    if (timepassed < waittime - 0.1 && timepassed < mintime) {
        return;
    }
    if (isdefined(self.hasspawned) && self.hasspawned) {
        return;
    }
    if (sessionmodeisprivate()) {
        return;
    }
    if (self.pers[#"team"] == #"spectator") {
        return;
    }
    if (!mayspawn() && self.pers[#"time_played_total"] > 0) {
        return;
    }
    globallogic::gamehistoryplayerkicked();
    kick(self getentitynumber(), "EXE/PLAYERKICKED_NOTSPAWNED");
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 1, eflags: 0x0
// Checksum 0x88687a2, Offset: 0x43e0
// Size: 0x34
function kickwait(waittime) {
    level endon(#"game_ended");
    hostmigration::waitlongdurationwithhostmigrationpause(waittime);
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 0, eflags: 0x0
// Checksum 0x5e98e11d, Offset: 0x4420
// Size: 0x16c
function spawninterroundintermission() {
    self notify(#"spawned");
    self notify(#"end_respawn");
    self player::set_spawn_variables();
    self hud_message::clearlowermessage();
    self val::reset(#"spawn_player", "freezecontrols");
    self val::reset(#"spawn_player", "disablegadgets");
    self.sessionstate = "spectator";
    self.spectatorclient = -1;
    self.killcamentity = -1;
    self.archivetime = 0;
    self.psoffsettime = 0;
    self.spectatekillcam = 0;
    self.friendlydamage = undefined;
    self globallogic_defaults::default_onspawnintermission();
    self setorigin(self.origin);
    self setplayerangles(self.angles);
    self clientfield::set_to_player("player_dof_settings", 2);
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 2, eflags: 0x0
// Checksum 0xe67396c, Offset: 0x4598
// Size: 0x174
function spawnintermission(usedefaultcallback, endgame) {
    self notify(#"spawned");
    self notify(#"end_respawn");
    self endon(#"disconnect");
    self player::set_spawn_variables();
    self hud_message::clearlowermessage();
    self val::reset(#"spawn_player", "freezecontrols");
    self val::reset(#"spawn_player", "disablegadgets");
    self.sessionstate = "intermission";
    self.spectatorclient = -1;
    self.killcamentity = -1;
    self.archivetime = 0;
    self.psoffsettime = 0;
    self.spectatekillcam = 0;
    self.friendlydamage = undefined;
    if (isdefined(usedefaultcallback) && usedefaultcallback) {
        globallogic_defaults::default_onspawnintermission();
    } else {
        [[ level.onspawnintermission ]](endgame);
    }
    self clientfield::set_to_player("player_dof_settings", 2);
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 1, eflags: 0x0
// Checksum 0xcf9dfdd5, Offset: 0x4718
// Size: 0xc8
function spawnqueuedclientonteam(team) {
    player_to_spawn = undefined;
    for (i = 0; i < level.deadplayers[team].size; i++) {
        player = level.deadplayers[team][i];
        if (player.waitingtospawn) {
            continue;
        }
        player_to_spawn = player;
        break;
    }
    if (isdefined(player_to_spawn)) {
        player_to_spawn.allowqueuespawn = 1;
        player_to_spawn globallogic_ui::closemenus();
        player_to_spawn thread [[ level.spawnclient ]]();
    }
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 2, eflags: 0x0
// Checksum 0xe39e628e, Offset: 0x47e8
// Size: 0x130
function spawnqueuedclient(dead_player_team, killer) {
    if (!level.playerqueuedrespawn) {
        return;
    }
    util::waittillslowprocessallowed();
    spawn_team = undefined;
    if (isdefined(killer) && isdefined(killer.team) && isdefined(level.teams[killer.team])) {
        spawn_team = killer.team;
    }
    if (isdefined(spawn_team)) {
        spawnqueuedclientonteam(spawn_team);
        return;
    }
    foreach (team, _ in level.teams) {
        if (team == dead_player_team) {
            continue;
        }
        spawnqueuedclientonteam(team);
    }
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 0, eflags: 0x0
// Checksum 0x8bba0ed2, Offset: 0x4920
// Size: 0xc6
function allteamsnearscorelimit() {
    if (!level.teambased) {
        return false;
    }
    if (level.scorelimit <= 1) {
        return false;
    }
    foreach (team, _ in level.teams) {
        if (!(game.stat[#"teamscores"][team] >= level.scorelimit - 1)) {
            return false;
        }
    }
    return true;
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 0, eflags: 0x0
// Checksum 0x604a43d0, Offset: 0x49f0
// Size: 0x6e
function shouldshowrespawnmessage() {
    if (util::waslastround()) {
        return false;
    }
    if (util::isoneround()) {
        return false;
    }
    if (isdefined(level.livesdonotreset) && level.livesdonotreset) {
        return false;
    }
    if (allteamsnearscorelimit()) {
        return false;
    }
    return true;
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 0, eflags: 0x0
// Checksum 0x8f59740e, Offset: 0x4a68
// Size: 0x64
function default_spawnmessage() {
    if (util::getroundsplayed() + 1 < level.roundlimit) {
        hud_message::setlowermessage(game.strings[#"spawn_next_round"]);
        self thread globallogic_ui::removespawnmessageshortly(3);
    }
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 0, eflags: 0x0
// Checksum 0x1c27aa2e, Offset: 0x4ad8
// Size: 0x28
function showspawnmessage() {
    if (shouldshowrespawnmessage()) {
        self thread [[ level.spawnmessage ]]();
    }
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 1, eflags: 0x0
// Checksum 0xd280b453, Offset: 0x4b08
// Size: 0x1f4
function spawnclient(timealreadypassed) {
    pixbeginevent(#"spawnclient");
    assert(isdefined(self.team));
    assert(!loadout::function_87bcb1b() || globallogic_utils::isvalidclass(self.curclass));
    if (!self mayspawn() && !(isdefined(self.usedresurrect) && self.usedresurrect)) {
        currentorigin = self.origin;
        currentangles = self.angles;
        self showspawnmessage();
        self thread [[ level.spawnspectator ]](currentorigin + (0, 0, 60), currentangles);
        pixendevent();
        return;
    }
    if (isdefined(self.waitingtospawn) && self.waitingtospawn) {
        pixendevent();
        return;
    }
    self.waitingtospawn = 1;
    self.allowqueuespawn = undefined;
    if (!(isdefined(level.takelivesondeath) && level.takelivesondeath)) {
        game.lives[self.team]--;
    }
    self waitandspawnclient(timealreadypassed);
    if (isdefined(self)) {
        self.waitingtospawn = 0;
    }
    pixendevent();
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 1, eflags: 0x0
// Checksum 0xfd81883c, Offset: 0x4d08
// Size: 0x500
function waitandspawnclient(timealreadypassed) {
    self endon(#"disconnect", #"end_respawn");
    level endon(#"game_ended");
    if (!isdefined(timealreadypassed)) {
        timealreadypassed = 0;
    }
    spawnedasspectator = 0;
    if (isdefined(self.teamkillpunish) && self.teamkillpunish) {
        var_821200bb = player::function_821200bb();
        if (var_821200bb > timealreadypassed) {
            var_821200bb = var_821200bb - timealreadypassed;
            timealreadypassed = 0;
        } else {
            timealreadypassed = timealreadypassed - var_821200bb;
            var_821200bb = 0;
        }
        if (var_821200bb > 0) {
            hud_message::setlowermessage(#"hash_7d1a0e5bd191fce", var_821200bb);
            self thread respawn_asspectator(self.origin + (0, 0, 60), self.angles);
            spawnedasspectator = 1;
            wait(var_821200bb);
        }
        self.teamkillpunish = 0;
    }
    if (!isdefined(self.wavespawnindex) && isdefined(level.waveplayerspawnindex[self.team])) {
        self.wavespawnindex = level.waveplayerspawnindex[self.team];
        level.waveplayerspawnindex[self.team]++;
    }
    timeuntilspawn = timeuntilspawn(0);
    if (timeuntilspawn > timealreadypassed) {
        timeuntilspawn = timeuntilspawn - timealreadypassed;
        timealreadypassed = 0;
    } else {
        timealreadypassed = timealreadypassed - timeuntilspawn;
        timeuntilspawn = 0;
    }
    if (timeuntilspawn > 0) {
        if (!sessionmodeiswarzonegame()) {
            if (level.playerqueuedrespawn) {
                hud_message::setlowermessage(game.strings[#"you_will_spawn"], timeuntilspawn);
            } else {
                hud_message::setlowermessage(game.strings[#"waiting_to_spawn"], timeuntilspawn);
            }
        }
        if (!spawnedasspectator) {
            spawnorigin = self.origin + (0, 0, 60);
            spawnangles = self.angles;
            if (isdefined(level.useintermissionpointsonwavespawn) && [[ level.useintermissionpointsonwavespawn ]]() == 1) {
                spawnpoint = spawning::get_random_intermission_point();
                if (isdefined(spawnpoint)) {
                    spawnorigin = spawnpoint.origin;
                    spawnangles = spawnpoint.angles;
                }
            }
            self thread respawn_asspectator(spawnorigin, spawnangles);
        }
        spawnedasspectator = 1;
        if (!sessionmodeiswarzonegame()) {
            self function_6c23d45b(timeuntilspawn, "force_spawn");
        } else {
            self globallogic_utils::waitfortimeornotify(timeuntilspawn, "force_spawn");
        }
        self notify(#"stop_wait_safe_spawn_button");
    }
    wavebased = level.waverespawndelay > 0;
    if (!level.playerforcerespawn && self.hasspawned && !wavebased && !self.wantsafespawn && !level.playerqueuedrespawn) {
        hud_message::setlowermessage(game.strings[#"press_to_spawn"]);
        if (!spawnedasspectator) {
            self thread respawn_asspectator(self.origin + (0, 0, 60), self.angles);
        }
        spawnedasspectator = 1;
        self waitrespawnorsafespawnbutton();
    }
    self.waitingtospawn = 0;
    self hud_message::clearlowermessage();
    self.wavespawnindex = undefined;
    self.respawntimerstarttime = undefined;
    self.pers[#"spawns"]++;
    self thread [[ level.spawnplayer ]]();
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 2, eflags: 0x0
// Checksum 0x71ab88a7, Offset: 0x5210
// Size: 0xe2
function function_6c23d45b(time, notifyname) {
    timeleft = time;
    self endon(notifyname);
    while (timeleft > 0) {
        if (level.playerqueuedrespawn) {
            hud_message::setlowermessage(game.strings[#"you_will_spawn"], timeleft);
        } else {
            hud_message::setlowermessage(game.strings[#"waiting_to_spawn"], timeleft);
        }
        if (timeleft > 0 && timeleft < 1) {
            wait(timeleft);
        } else {
            wait(1);
        }
        timeleft = timeleft - 1;
    }
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 0, eflags: 0x0
// Checksum 0xb23bc270, Offset: 0x5300
// Size: 0x54
function waitrespawnorsafespawnbutton() {
    self endon(#"disconnect", #"end_respawn");
    while (true) {
        if (self usebuttonpressed()) {
            break;
        }
        waitframe(1);
    }
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 0, eflags: 0x0
// Checksum 0x7da53507, Offset: 0x5360
// Size: 0xb2
function waitinspawnqueue() {
    self endon(#"disconnect", #"end_respawn");
    if (!level.ingraceperiod && !level.usestartspawns) {
        currentorigin = self.origin;
        currentangles = self.angles;
        self thread [[ level.spawnspectator ]](currentorigin + (0, 0, 60), currentangles);
        self waittill(#"queue_respawn");
    }
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 1, eflags: 0x0
// Checksum 0x3342d02b, Offset: 0x5420
// Size: 0xdc
function setthirdperson(value) {
    if (!level.console) {
        return;
    }
    if (!isdefined(self.spectatingthirdperson) || value != self.spectatingthirdperson) {
        self.spectatingthirdperson = value;
        if (value) {
            self setclientthirdperson(1);
            self clientfield::set_to_player("player_dof_settings", 2);
        } else {
            self setclientthirdperson(0);
            self clientfield::set_to_player("player_dof_settings", 1);
        }
        self resetfov();
    }
}

// Namespace globallogic_spawn/globallogic_spawn
// Params 4, eflags: 0x0
// Checksum 0x29a3f2, Offset: 0x5508
// Size: 0x208
function function_6f7bedf0(origin, angles, team, gamemode) {
    if (gamemode != level.gametype) {
        return;
    }
    spawnpoint = spawnstruct();
    if (team == "axis") {
        spawnpoint.classname = "mp_t8_spawn_point_axis";
        spawnpoint.targetname = "mp_t8_spawn_point_axis";
    } else if (team == "allies") {
        spawnpoint.classname = "mp_t8_spawn_point_allies";
        spawnpoint.targetname = "mp_t8_spawn_point_allies";
    }
    spawnpoint.origin = origin;
    spawnpoint.angles = angles;
    spawnpoint._human_were = 1;
    spawnpoint.tdm = 1;
    spawnpoint.var_446998f8 = 1;
    if (!isdefined(level.spawn_start)) {
        level.spawn_start = [];
    }
    if (!isdefined(level.spawn_start[team])) {
        level.spawn_start[team] = [];
    }
    if (!isdefined(level.spawn_start[team])) {
        level.spawn_start[team] = [];
    } else if (!isarray(level.spawn_start[team])) {
        level.spawn_start[team] = array(level.spawn_start[team]);
    }
    level.spawn_start[team][level.spawn_start[team].size] = spawnpoint;
}

