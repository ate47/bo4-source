#using scripts\core_common\system_shared;
#using scripts\core_common\gameobjects_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\struct;

#namespace spawnlogic;

// Namespace spawnlogic/spawnlogic
// Params 0, eflags: 0x2
// Checksum 0x9fe8f208, Offset: 0xd8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"spawnlogic", &__init__, undefined, undefined);
}

// Namespace spawnlogic/spawnlogic
// Params 0, eflags: 0x1 linked
// Checksum 0x10eeb60e, Offset: 0x120
// Size: 0x24
function __init__() {
    callback::on_start_gametype(&main);
}

// Namespace spawnlogic/spawnlogic
// Params 0, eflags: 0x1 linked
// Checksum 0xbdde17f9, Offset: 0x150
// Size: 0x2e4
function main() {
    /#
        if (getdvarstring(#"scr_recordspawndata") == "<dev string:x38>") {
            setdvar(#"scr_recordspawndata", 0);
        }
        level.storespawndata = getdvarint(#"scr_recordspawndata", 0);
        if (getdvarstring(#"scr_killbots") == "<dev string:x38>") {
            setdvar(#"scr_killbots", 0);
        }
        if (getdvarstring(#"scr_killbottimer") == "<dev string:x38>") {
            setdvar(#"scr_killbottimer", 0.25);
        }
        thread loopbotspawns();
    #/
    level.spawnlogic_deaths = [];
    level.spawnlogic_spawnkills = [];
    level.players = [];
    level.grenades = [];
    level.pipebombs = [];
    level.spawnmins = (0, 0, 0);
    level.spawnmaxs = (0, 0, 0);
    level.spawnminsmaxsprimed = 0;
    if (isdefined(level.safespawns)) {
        for (i = 0; i < level.safespawns.size; i++) {
            level.safespawns[i] spawnpointinit();
        }
    }
    /#
        if (!isdefined(getdvar(#"scr_spawnpointdebug"))) {
            setdvar(#"scr_spawnpointdebug", 0);
        }
        if (getdvarint(#"scr_spawnpointdebug", 0) > 0) {
            thread showdeathsdebug();
            thread updatedeathinfodebug();
            thread profiledebug();
        }
        if (level.storespawndata) {
            thread allowspawndatareading();
        }
        thread watchspawnprofile();
        thread spawngraphcheck();
    #/
}

// Namespace spawnlogic/spawnlogic
// Params 2, eflags: 0x0
// Checksum 0xb972276, Offset: 0x440
// Size: 0x70
function findboxcenter(mins, maxs) {
    center = (0, 0, 0);
    center = maxs - mins;
    center = (center[0] / 2, center[1] / 2, center[2] / 2) + mins;
    return center;
}

// Namespace spawnlogic/spawnlogic
// Params 2, eflags: 0x1 linked
// Checksum 0x30fefead, Offset: 0x4b8
// Size: 0xc2
function expandmins(mins, point) {
    if (mins[0] > point[0]) {
        mins = (point[0], mins[1], mins[2]);
    }
    if (mins[1] > point[1]) {
        mins = (mins[0], point[1], mins[2]);
    }
    if (mins[2] > point[2]) {
        mins = (mins[0], mins[1], point[2]);
    }
    return mins;
}

// Namespace spawnlogic/spawnlogic
// Params 2, eflags: 0x1 linked
// Checksum 0xe2509490, Offset: 0x588
// Size: 0xc2
function expandmaxs(maxs, point) {
    if (maxs[0] < point[0]) {
        maxs = (point[0], maxs[1], maxs[2]);
    }
    if (maxs[1] < point[1]) {
        maxs = (maxs[0], point[1], maxs[2]);
    }
    if (maxs[2] < point[2]) {
        maxs = (maxs[0], maxs[1], point[2]);
    }
    return maxs;
}

// Namespace spawnlogic/spawnlogic
// Params 2, eflags: 0x1 linked
// Checksum 0xb29329d1, Offset: 0x658
// Size: 0x23c
function addspawnpointsinternal(team, spawnpointname) {
    oldspawnpoints = [];
    if (level.teamspawnpoints[team].size) {
        oldspawnpoints = level.teamspawnpoints[team];
    }
    level.teamspawnpoints[team] = getspawnpointarray(spawnpointname);
    if (!isdefined(level.spawnpoints)) {
        level.spawnpoints = [];
    }
    for (index = 0; index < level.teamspawnpoints[team].size; index++) {
        spawnpoint = level.teamspawnpoints[team][index];
        if (!isdefined(spawnpoint.inited)) {
            spawnpoint spawnpointinit();
            level.spawnpoints[level.spawnpoints.size] = spawnpoint;
        }
    }
    for (index = 0; index < oldspawnpoints.size; index++) {
        origin = oldspawnpoints[index].origin;
        level.spawnmins = expandmins(level.spawnmins, origin);
        level.spawnmaxs = expandmaxs(level.spawnmaxs, origin);
        level.teamspawnpoints[team][level.teamspawnpoints[team].size] = oldspawnpoints[index];
    }
    if (!level.teamspawnpoints[team].size) {
        println("<dev string:x3b>" + spawnpointname + "<dev string:x4a>");
        callback::abort_level();
        wait 1;
        return;
    }
}

// Namespace spawnlogic/spawnlogic
// Params 0, eflags: 0x1 linked
// Checksum 0x6cca9edb, Offset: 0x8a0
// Size: 0x96
function clearspawnpoints() {
    foreach (team, _ in level.teams) {
        level.teamspawnpoints[team] = [];
    }
    level.spawnpoints = [];
    level.unified_spawn_points = undefined;
}

// Namespace spawnlogic/spawnlogic
// Params 2, eflags: 0x1 linked
// Checksum 0xc182cb54, Offset: 0x940
// Size: 0x5c
function addspawnpoints(team, spawnpointname) {
    addspawnpointclassname(spawnpointname);
    addspawnpointteamclassname(team, spawnpointname);
    addspawnpointsinternal(team, spawnpointname);
}

// Namespace spawnlogic/spawnlogic
// Params 1, eflags: 0x0
// Checksum 0x626199d, Offset: 0x9a8
// Size: 0x7e
function rebuildspawnpoints(team) {
    level.teamspawnpoints[team] = [];
    for (index = 0; index < level.spawn_point_team_class_names[team].size; index++) {
        addspawnpointsinternal(team, level.spawn_point_team_class_names[team][index]);
    }
}

// Namespace spawnlogic/spawnlogic
// Params 1, eflags: 0x0
// Checksum 0xaa13fc53, Offset: 0xa30
// Size: 0x134
function placespawnpoints(spawnpointname) {
    addspawnpointclassname(spawnpointname);
    spawnpoints = getspawnpointarray(spawnpointname);
    /#
        if (!isdefined(level.extraspawnpointsused)) {
            level.extraspawnpointsused = [];
        }
    #/
    if (!spawnpoints.size) {
        println("<dev string:x69>" + spawnpointname + "<dev string:x4a>");
        callback::abort_level();
        wait 1;
        return;
    }
    for (index = 0; index < spawnpoints.size; index++) {
        spawnpoints[index] spawnpointinit();
        /#
            spawnpoints[index].fakeclassname = spawnpointname;
            level.extraspawnpointsused[level.extraspawnpointsused.size] = spawnpoints[index];
        #/
    }
}

// Namespace spawnlogic/spawnlogic
// Params 1, eflags: 0x0
// Checksum 0x33243e5e, Offset: 0xb70
// Size: 0xa6
function dropspawnpoints(spawnpointname) {
    spawnpoints = getspawnpointarray(spawnpointname);
    if (!spawnpoints.size) {
        println("<dev string:x69>" + spawnpointname + "<dev string:x4a>");
        return;
    }
    for (index = 0; index < spawnpoints.size; index++) {
        spawnpoints[index] placespawnpoint();
    }
}

// Namespace spawnlogic/spawnlogic
// Params 1, eflags: 0x1 linked
// Checksum 0x4e106bc5, Offset: 0xc20
// Size: 0x46
function addspawnpointclassname(spawnpointclassname) {
    if (!isdefined(level.spawn_point_class_names)) {
        level.spawn_point_class_names = [];
    }
    level.spawn_point_class_names[level.spawn_point_class_names.size] = spawnpointclassname;
}

// Namespace spawnlogic/spawnlogic
// Params 2, eflags: 0x1 linked
// Checksum 0x29b0cde6, Offset: 0xc70
// Size: 0x40
function addspawnpointteamclassname(team, spawnpointclassname) {
    level.spawn_point_team_class_names[team][level.spawn_point_team_class_names[team].size] = spawnpointclassname;
}

// Namespace spawnlogic/spawnlogic
// Params 1, eflags: 0x1 linked
// Checksum 0x32f5a21b, Offset: 0xcb8
// Size: 0xba
function getspawnpointarray(classname) {
    spawnpoints = getentarray(classname, "classname");
    if (!isdefined(level.extraspawnpoints) || !isdefined(level.extraspawnpoints[classname])) {
        return spawnpoints;
    }
    for (i = 0; i < level.extraspawnpoints[classname].size; i++) {
        spawnpoints[spawnpoints.size] = level.extraspawnpoints[classname][i];
    }
    return spawnpoints;
}

// Namespace spawnlogic/spawnlogic
// Params 0, eflags: 0x1 linked
// Checksum 0x23b0cd52, Offset: 0xd80
// Size: 0x126
function spawnpointinit() {
    spawnpoint = self;
    origin = spawnpoint.origin;
    if (!level.spawnminsmaxsprimed) {
        level.spawnmins = origin;
        level.spawnmaxs = origin;
        level.spawnminsmaxsprimed = 1;
    } else {
        level.spawnmins = expandmins(level.spawnmins, origin);
        level.spawnmaxs = expandmaxs(level.spawnmaxs, origin);
    }
    spawnpoint placespawnpoint();
    spawnpoint.forward = anglestoforward(spawnpoint.angles);
    spawnpoint.sighttracepoint = spawnpoint.origin + (0, 0, 50);
    spawnpoint.inited = 1;
}

// Namespace spawnlogic/spawnlogic
// Params 1, eflags: 0x1 linked
// Checksum 0x9607e1e8, Offset: 0xeb0
// Size: 0x1c
function getteamspawnpoints(team) {
    return level.teamspawnpoints[team];
}

// Namespace spawnlogic/spawnlogic
// Params 2, eflags: 0x1 linked
// Checksum 0x8a3b3816, Offset: 0xed8
// Size: 0x208
function getspawnpoint_final(spawnpoints, useweights) {
    bestspawnpoint = undefined;
    if (!isdefined(spawnpoints) || spawnpoints.size == 0) {
        return undefined;
    }
    if (!isdefined(useweights)) {
        useweights = 1;
    }
    if (useweights) {
        bestspawnpoint = getbestweightedspawnpoint(spawnpoints);
        thread spawnweightdebug(spawnpoints);
    } else {
        for (i = 0; i < spawnpoints.size; i++) {
            if (isdefined(self.lastspawnpoint) && self.lastspawnpoint == spawnpoints[i]) {
                continue;
            }
            if (positionwouldtelefrag(spawnpoints[i].origin)) {
                continue;
            }
            bestspawnpoint = spawnpoints[i];
            break;
        }
        if (!isdefined(bestspawnpoint)) {
            if (isdefined(self.lastspawnpoint) && !positionwouldtelefrag(self.lastspawnpoint.origin)) {
                for (i = 0; i < spawnpoints.size; i++) {
                    if (spawnpoints[i] == self.lastspawnpoint) {
                        bestspawnpoint = spawnpoints[i];
                        break;
                    }
                }
            }
        }
    }
    if (!isdefined(bestspawnpoint)) {
        if (useweights) {
            bestspawnpoint = spawnpoints[randomint(spawnpoints.size)];
        } else {
            bestspawnpoint = spawnpoints[0];
        }
    }
    self finalizespawnpointchoice(bestspawnpoint);
    /#
        self storespawndata(spawnpoints, useweights, bestspawnpoint);
    #/
    return bestspawnpoint;
}

// Namespace spawnlogic/spawnlogic
// Params 1, eflags: 0x1 linked
// Checksum 0x7414af1f, Offset: 0x10e8
// Size: 0x4e
function finalizespawnpointchoice(spawnpoint) {
    time = gettime();
    self.lastspawnpoint = spawnpoint;
    self.lastspawntime = time;
    spawnpoint.lastspawnedplayer = self;
    spawnpoint.lastspawntime = time;
}

// Namespace spawnlogic/spawnlogic
// Params 1, eflags: 0x1 linked
// Checksum 0x17c047d1, Offset: 0x1140
// Size: 0x27c
function getbestweightedspawnpoint(spawnpoints) {
    maxsighttracedspawnpoints = 3;
    for (trycount = 0; trycount <= maxsighttracedspawnpoints; trycount++) {
        bestspawnpoints = [];
        bestweight = undefined;
        bestspawnpoint = undefined;
        for (i = 0; i < spawnpoints.size; i++) {
            if (!isdefined(bestweight) || spawnpoints[i].weight > bestweight) {
                if (positionwouldtelefrag(spawnpoints[i].origin)) {
                    continue;
                }
                bestspawnpoints = [];
                bestspawnpoints[0] = spawnpoints[i];
                bestweight = spawnpoints[i].weight;
                continue;
            }
            if (spawnpoints[i].weight == bestweight) {
                if (positionwouldtelefrag(spawnpoints[i].origin)) {
                    continue;
                }
                bestspawnpoints[bestspawnpoints.size] = spawnpoints[i];
            }
        }
        if (bestspawnpoints.size == 0) {
            return undefined;
        }
        bestspawnpoint = bestspawnpoints[randomint(bestspawnpoints.size)];
        if (trycount == maxsighttracedspawnpoints) {
            return bestspawnpoint;
        }
        if (isdefined(bestspawnpoint.lastsighttracetime) && bestspawnpoint.lastsighttracetime == gettime()) {
            return bestspawnpoint;
        }
        if (!lastminutesighttraces(bestspawnpoint)) {
            return bestspawnpoint;
        }
        penalty = getlospenalty();
        /#
            if (level.storespawndata || level.debugspawning) {
                bestspawnpoint.spawndata[bestspawnpoint.spawndata.size] = "<dev string:x71>" + penalty;
            }
        #/
        bestspawnpoint.weight -= penalty;
        bestspawnpoint.lastsighttracetime = gettime();
    }
}

/#

    // Namespace spawnlogic/spawnlogic
    // Params 1, eflags: 0x0
    // Checksum 0xa1c2b69b, Offset: 0x13c8
    // Size: 0x156
    function checkbad(spawnpoint) {
        for (i = 0; i < level.players.size; i++) {
            player = level.players[i];
            if (!isalive(player) || player.sessionstate != "<dev string:x8e>") {
                continue;
            }
            if (level.teambased && player.team == self.team) {
                continue;
            }
            losexists = bullettracepassed(player.origin + (0, 0, 50), spawnpoint.sighttracepoint, 0, undefined);
            if (losexists) {
                thread badspawnline(spawnpoint.sighttracepoint, player.origin + (0, 0, 50), self.name, player.name);
            }
        }
    }

    // Namespace spawnlogic/spawnlogic
    // Params 4, eflags: 0x0
    // Checksum 0xcbf8d9aa, Offset: 0x1528
    // Size: 0xdc
    function badspawnline(start, end, name1, name2) {
        dist = distance(start, end);
        for (i = 0; i < 200; i++) {
            line(start, end, (1, 0, 0));
            print3d(start, "<dev string:x98>" + name1 + "<dev string:xa6>" + dist);
            print3d(end, name2);
            waitframe(1);
        }
    }

    // Namespace spawnlogic/spawnlogic
    // Params 3, eflags: 0x0
    // Checksum 0x7c24ffbd, Offset: 0x1610
    // Size: 0x82a
    function storespawndata(spawnpoints, useweights, bestspawnpoint) {
        if (!isdefined(level.storespawndata) || !level.storespawndata) {
            return;
        }
        level.storespawndata = getdvarint(#"scr_recordspawndata", 0);
        if (!level.storespawndata) {
            return;
        }
        if (!isdefined(level.spawnid)) {
            level.spawngameid = randomint(100);
            level.spawnid = 0;
        }
        if (bestspawnpoint.classname == "<dev string:xb2>") {
            return;
        }
        level.spawnid++;
        file = openfile("<dev string:xcb>", "<dev string:xdb>");
        fprintfields(file, level.spawngameid + "<dev string:xe4>" + level.spawnid + "<dev string:xe8>" + spawnpoints.size + "<dev string:xe8>" + self.name);
        for (i = 0; i < spawnpoints.size; i++) {
            str = vectostr(spawnpoints[i].origin) + "<dev string:xe8>";
            if (spawnpoints[i] == bestspawnpoint) {
                str += "<dev string:xec>";
            } else {
                str += "<dev string:xf1>";
            }
            if (!useweights) {
                str += "<dev string:xf1>";
            } else {
                str += spawnpoints[i].weight + "<dev string:xe8>";
            }
            if (!isdefined(spawnpoints[i].spawndata)) {
                spawnpoints[i].spawndata = [];
            }
            if (!isdefined(spawnpoints[i].sightchecks)) {
                spawnpoints[i].sightchecks = [];
            }
            str += spawnpoints[i].spawndata.size + "<dev string:xe8>";
            for (j = 0; j < spawnpoints[i].spawndata.size; j++) {
                str += spawnpoints[i].spawndata[j] + "<dev string:xe8>";
            }
            str += spawnpoints[i].sightchecks.size + "<dev string:xe8>";
            for (j = 0; j < spawnpoints[i].sightchecks.size; j++) {
                str += spawnpoints[i].sightchecks[j].penalty + "<dev string:xe8>" + vectostr(spawnpoints[i].origin) + "<dev string:xe8>";
            }
            fprintfields(file, str);
        }
        obj = spawnstruct();
        getallalliedandenemyplayers(obj);
        numallies = 0;
        numenemies = 0;
        str = "<dev string:x38>";
        for (i = 0; i < obj.allies.size; i++) {
            if (obj.allies[i] == self) {
                continue;
            }
            numallies++;
            str += vectostr(obj.allies[i].origin) + "<dev string:xe8>";
        }
        for (i = 0; i < obj.enemies.size; i++) {
            numenemies++;
            str += vectostr(obj.enemies[i].origin) + "<dev string:xe8>";
        }
        str = numallies + "<dev string:xe8>" + numenemies + "<dev string:xe8>" + str;
        fprintfields(file, str);
        otherdata = [];
        if (isdefined(level.bombguy)) {
            index = otherdata.size;
            otherdata[index] = spawnstruct();
            otherdata[index].origin = level.bombguy.origin + (0, 0, 20);
            otherdata[index].text = "<dev string:xf6>";
        } else if (isdefined(level.bombpos)) {
            index = otherdata.size;
            otherdata[index] = spawnstruct();
            otherdata[index].origin = level.bombpos;
            otherdata[index].text = "<dev string:x104>";
        }
        if (isdefined(level.flags)) {
            for (i = 0; i < level.flags.size; i++) {
                index = otherdata.size;
                otherdata[index] = spawnstruct();
                otherdata[index].origin = level.flags[i].origin;
                otherdata[index].text = level.flags[i].useobj gameobjects::get_owner_team() + "<dev string:x10b>";
            }
        }
        str = otherdata.size + "<dev string:xe8>";
        for (i = 0; i < otherdata.size; i++) {
            str += vectostr(otherdata[i].origin) + "<dev string:xe8>" + otherdata[i].text + "<dev string:xe8>";
        }
        fprintfields(file, str);
        closefile(file);
        thisspawnid = level.spawngameid + "<dev string:xe4>" + level.spawnid;
        if (isdefined(self.thisspawnid)) {
        }
        self.thisspawnid = thisspawnid;
    }

    // Namespace spawnlogic/spawnlogic
    // Params 2, eflags: 0x0
    // Checksum 0xfc86d278, Offset: 0x1e48
    // Size: 0xa64
    function readspawndata(desiredid, relativepos) {
        file = openfile("<dev string:xcb>", "<dev string:x113>");
        if (file < 0) {
            return;
        }
        oldspawndata = level.curspawndata;
        level.curspawndata = undefined;
        prev = undefined;
        prevthisplayer = undefined;
        lookingfornextthisplayer = 0;
        lookingfornext = 0;
        if (isdefined(relativepos) && !isdefined(oldspawndata)) {
            return;
        }
        while (true) {
            if (freadln(file) <= 0) {
                break;
            }
            data = spawnstruct();
            data.id = fgetarg(file, 0);
            numspawns = int(fgetarg(file, 1));
            if (numspawns > 256) {
                break;
            }
            data.playername = fgetarg(file, 2);
            data.spawnpoints = [];
            data.friends = [];
            data.enemies = [];
            data.otherdata = [];
            for (i = 0; i < numspawns; i++) {
                if (freadln(file) <= 0) {
                    break;
                }
                spawnpoint = spawnstruct();
                spawnpoint.origin = strtovec(fgetarg(file, 0));
                spawnpoint.winner = int(fgetarg(file, 1));
                spawnpoint.weight = int(fgetarg(file, 2));
                spawnpoint.data = [];
                spawnpoint.sightchecks = [];
                if (i == 0) {
                    data.minweight = spawnpoint.weight;
                    data.maxweight = spawnpoint.weight;
                } else {
                    if (spawnpoint.weight < data.minweight) {
                        data.minweight = spawnpoint.weight;
                    }
                    if (spawnpoint.weight > data.maxweight) {
                        data.maxweight = spawnpoint.weight;
                    }
                }
                argnum = 4;
                numdata = int(fgetarg(file, 3));
                if (numdata > 256) {
                    break;
                }
                for (j = 0; j < numdata; j++) {
                    spawnpoint.data[spawnpoint.data.size] = fgetarg(file, argnum);
                    argnum++;
                }
                numsightchecks = int(fgetarg(file, argnum));
                argnum++;
                if (numsightchecks > 256) {
                    break;
                }
                for (j = 0; j < numsightchecks; j++) {
                    index = spawnpoint.sightchecks.size;
                    spawnpoint.sightchecks[index] = spawnstruct();
                    spawnpoint.sightchecks[index].penalty = int(fgetarg(file, argnum));
                    argnum++;
                    spawnpoint.sightchecks[index].origin = strtovec(fgetarg(file, argnum));
                    argnum++;
                }
                data.spawnpoints[data.spawnpoints.size] = spawnpoint;
            }
            if (!isdefined(data.minweight)) {
                data.minweight = -1;
                data.maxweight = 0;
            }
            if (data.minweight == data.maxweight) {
                data.minweight -= 1;
            }
            if (freadln(file) <= 0) {
                break;
            }
            numfriends = int(fgetarg(file, 0));
            numenemies = int(fgetarg(file, 1));
            if (numfriends > 32 || numenemies > 32) {
                break;
            }
            argnum = 2;
            for (i = 0; i < numfriends; i++) {
                data.friends[data.friends.size] = strtovec(fgetarg(file, argnum));
                argnum++;
            }
            for (i = 0; i < numenemies; i++) {
                data.enemies[data.enemies.size] = strtovec(fgetarg(file, argnum));
                argnum++;
            }
            if (freadln(file) <= 0) {
                break;
            }
            numotherdata = int(fgetarg(file, 0));
            argnum = 1;
            for (i = 0; i < numotherdata; i++) {
                otherdata = spawnstruct();
                otherdata.origin = strtovec(fgetarg(file, argnum));
                argnum++;
                otherdata.text = fgetarg(file, argnum);
                argnum++;
                data.otherdata[data.otherdata.size] = otherdata;
            }
            if (isdefined(relativepos)) {
                if (relativepos == "<dev string:x11a>") {
                    if (data.id == oldspawndata.id) {
                        level.curspawndata = prevthisplayer;
                        break;
                    }
                } else if (relativepos == "<dev string:x12b>") {
                    if (data.id == oldspawndata.id) {
                        level.curspawndata = prev;
                        break;
                    }
                } else if (relativepos == "<dev string:x132>") {
                    if (lookingfornextthisplayer) {
                        level.curspawndata = data;
                        break;
                    } else if (data.id == oldspawndata.id) {
                        lookingfornextthisplayer = 1;
                    }
                } else if (relativepos == "<dev string:x143>") {
                    if (lookingfornext) {
                        level.curspawndata = data;
                        break;
                    } else if (data.id == oldspawndata.id) {
                        lookingfornext = 1;
                    }
                }
            } else if (data.id == desiredid) {
                level.curspawndata = data;
                break;
            }
            prev = data;
            if (isdefined(oldspawndata) && data.playername == oldspawndata.playername) {
                prevthisplayer = data;
            }
        }
        closefile(file);
    }

    // Namespace spawnlogic/spawnlogic
    // Params 0, eflags: 0x0
    // Checksum 0x6309902e, Offset: 0x28b8
    // Size: 0x468
    function drawspawndata() {
        level notify(#"drawing_spawn_data");
        level endon(#"drawing_spawn_data");
        textoffset = (0, 0, -12);
        while (true) {
            if (!isdefined(level.curspawndata)) {
                wait 0.5;
                continue;
            }
            for (i = 0; i < level.curspawndata.friends.size; i++) {
                print3d(level.curspawndata.friends[i], "<dev string:x14a>", (0.5, 1, 0.5), 1, 5);
            }
            for (i = 0; i < level.curspawndata.enemies.size; i++) {
                print3d(level.curspawndata.enemies[i], "<dev string:x14f>", (1, 0.5, 0.5), 1, 5);
            }
            for (i = 0; i < level.curspawndata.otherdata.size; i++) {
                print3d(level.curspawndata.otherdata[i].origin, level.curspawndata.otherdata[i].text, (0.5, 0.75, 1), 1, 2);
            }
            for (i = 0; i < level.curspawndata.spawnpoints.size; i++) {
                sp = level.curspawndata.spawnpoints[i];
                orig = sp.sighttracepoint;
                if (sp.winner) {
                    print3d(orig, level.curspawndata.playername + "<dev string:x154>", (0.5, 0.5, 1), 1, 2);
                    orig += textoffset;
                }
                amnt = (sp.weight - level.curspawndata.minweight) / (level.curspawndata.maxweight - level.curspawndata.minweight);
                print3d(orig, "<dev string:x164>" + sp.weight, (1 - amnt, amnt, 0.5));
                orig += textoffset;
                for (j = 0; j < sp.data.size; j++) {
                    print3d(orig, sp.data[j], (1, 1, 1));
                    orig += textoffset;
                }
                for (j = 0; j < sp.sightchecks.size; j++) {
                    print3d(orig, "<dev string:x16f>" + sp.sightchecks[j].penalty, (1, 0.5, 0.5));
                    orig += textoffset;
                }
            }
            waitframe(1);
        }
    }

    // Namespace spawnlogic/spawnlogic
    // Params 1, eflags: 0x0
    // Checksum 0xe541fcc9, Offset: 0x2d28
    // Size: 0x7e
    function vectostr(vec) {
        return int(vec[0]) + "<dev string:x180>" + int(vec[1]) + "<dev string:x180>" + int(vec[2]);
    }

    // Namespace spawnlogic/spawnlogic
    // Params 1, eflags: 0x0
    // Checksum 0xfc534211, Offset: 0x2db0
    // Size: 0x9e
    function strtovec(str) {
        parts = strtok(str, "<dev string:x180>");
        if (parts.size != 3) {
            return (0, 0, 0);
        }
        return (int(parts[0]), int(parts[1]), int(parts[2]));
    }

#/

// Namespace spawnlogic/spawnlogic
// Params 1, eflags: 0x1 linked
// Checksum 0x83a5c5bc, Offset: 0x2e58
// Size: 0xb2
function getspawnpoint_random(spawnpoints) {
    if (!isdefined(spawnpoints)) {
        return undefined;
    }
    for (i = 0; i < spawnpoints.size; i++) {
        j = randomint(spawnpoints.size);
        spawnpoint = spawnpoints[i];
        spawnpoints[i] = spawnpoints[j];
        spawnpoints[j] = spawnpoint;
    }
    return getspawnpoint_final(spawnpoints, 0);
}

// Namespace spawnlogic/spawnlogic
// Params 0, eflags: 0x1 linked
// Checksum 0x4e3eb564, Offset: 0x2f18
// Size: 0xda
function getallotherplayers() {
    aliveplayers = [];
    for (i = 0; i < level.players.size; i++) {
        if (!isdefined(level.players[i])) {
            continue;
        }
        player = level.players[i];
        if (player.sessionstate != "playing" || player == self) {
            continue;
        }
        if (isdefined(level.customalivecheck)) {
            if (![[ level.customalivecheck ]](player)) {
                continue;
            }
        }
        aliveplayers[aliveplayers.size] = player;
    }
    return aliveplayers;
}

// Namespace spawnlogic/spawnlogic
// Params 1, eflags: 0x1 linked
// Checksum 0xee2cdc88, Offset: 0x3000
// Size: 0x192
function getallalliedandenemyplayers(obj) {
    if (level.teambased) {
        assert(isdefined(level.teams[self.team]));
        obj.allies = [];
        obj.enemies = [];
        for (i = 0; i < level.players.size; i++) {
            if (!isdefined(level.players[i])) {
                continue;
            }
            player = level.players[i];
            if (player.sessionstate != "playing" || player == self) {
                continue;
            }
            if (isdefined(level.customalivecheck)) {
                if (![[ level.customalivecheck ]](player)) {
                    continue;
                }
            }
            if (player.team == self.team) {
                obj.allies[obj.allies.size] = player;
                continue;
            }
            obj.enemies[obj.enemies.size] = player;
        }
        return;
    }
    obj.allies = [];
    obj.enemies = level.activeplayers;
}

// Namespace spawnlogic/spawnlogic
// Params 1, eflags: 0x1 linked
// Checksum 0x86e4d778, Offset: 0x31a0
// Size: 0xb0
function initweights(spawnpoints) {
    for (i = 0; i < spawnpoints.size; i++) {
        spawnpoints[i].weight = 0;
    }
    /#
        if (level.storespawndata || level.debugspawning) {
            for (i = 0; i < spawnpoints.size; i++) {
                spawnpoints[i].spawndata = [];
                spawnpoints[i].sightchecks = [];
            }
        }
    #/
}

// Namespace spawnlogic/spawnlogic
// Params 1, eflags: 0x1 linked
// Checksum 0xe6de7d47, Offset: 0x3258
// Size: 0x26e
function spawnpointupdate_zm(spawnpoint) {
    foreach (team, _ in level.teams) {
        spawnpoint.distsum[team] = 0;
        spawnpoint.enemydistsum[team] = 0;
    }
    players = getplayers();
    spawnpoint.numplayersatlastupdate = players.size;
    foreach (player in players) {
        if (!isdefined(player)) {
            continue;
        }
        if (player.sessionstate != "playing") {
            continue;
        }
        if (isdefined(level.customalivecheck)) {
            if (![[ level.customalivecheck ]](player)) {
                continue;
            }
        }
        dist = distance(spawnpoint.origin, player.origin);
        spawnpoint.distsum[player.team] = spawnpoint.distsum[player.team] + dist;
        foreach (team, _ in level.teams) {
            if (team != player.team) {
                spawnpoint.enemydistsum[team] = spawnpoint.enemydistsum[team] + dist;
            }
        }
    }
}

// Namespace spawnlogic/spawnlogic
// Params 4, eflags: 0x1 linked
// Checksum 0x6f2c2f1d, Offset: 0x34d0
// Size: 0x4d0
function getspawnpoint_nearteam(spawnpoints, favoredspawnpoints, forceallydistanceweight, forceenemydistanceweight) {
    if (!isdefined(spawnpoints)) {
        return undefined;
    }
    /#
        if (getdvarint(#"scr_spawn_randomly", 0)) {
            return getspawnpoint_random(spawnpoints);
        }
    #/
    if (getdvarint(#"scr_spawnsimple", 0) > 0) {
        return getspawnpoint_random(spawnpoints);
    }
    spawnlogic_begin();
    k_favored_spawn_point_bonus = 25000;
    initweights(spawnpoints);
    obj = spawnstruct();
    getallalliedandenemyplayers(obj);
    numplayers = obj.allies.size + obj.enemies.size;
    allieddistanceweight = 2;
    if (isdefined(forceallydistanceweight)) {
        allieddistanceweight = forceallydistanceweight;
    }
    enemydistanceweight = 1;
    if (isdefined(forceenemydistanceweight)) {
        enemydistanceweight = forceenemydistanceweight;
    }
    myteam = self.team;
    for (i = 0; i < spawnpoints.size; i++) {
        spawnpoint = spawnpoints[i];
        spawnpointupdate_zm(spawnpoint);
        if (!isdefined(spawnpoint.numplayersatlastupdate)) {
            spawnpoint.numplayersatlastupdate = 0;
        }
        if (spawnpoint.numplayersatlastupdate > 0) {
            allydistsum = spawnpoint.distsum[myteam];
            enemydistsum = spawnpoint.enemydistsum[myteam];
            spawnpoint.weight = (enemydistanceweight * enemydistsum - allieddistanceweight * allydistsum) / spawnpoint.numplayersatlastupdate;
            /#
                if (level.storespawndata || level.debugspawning) {
                    spawnpoint.spawndata[spawnpoint.spawndata.size] = "<dev string:x184>" + int(spawnpoint.weight) + "<dev string:x194>" + enemydistanceweight + "<dev string:x19b>" + int(enemydistsum) + "<dev string:x19f>" + allieddistanceweight + "<dev string:x19b>" + int(allydistsum) + "<dev string:x1a5>" + spawnpoint.numplayersatlastupdate;
                }
            #/
            continue;
        }
        spawnpoint.weight = 0;
        /#
            if (level.storespawndata || level.debugspawning) {
                spawnpoint.spawndata[spawnpoint.spawndata.size] = "<dev string:x1ac>";
            }
        #/
    }
    if (isdefined(favoredspawnpoints)) {
        for (i = 0; i < favoredspawnpoints.size; i++) {
            if (isdefined(favoredspawnpoints[i].weight)) {
                favoredspawnpoints[i].weight = favoredspawnpoints[i].weight + k_favored_spawn_point_bonus;
                continue;
            }
            favoredspawnpoints[i].weight = k_favored_spawn_point_bonus;
        }
    }
    avoidsamespawn(spawnpoints);
    avoidspawnreuse(spawnpoints, 1);
    avoidweapondamage(spawnpoints);
    avoidvisibleenemies(spawnpoints, 1);
    result = getspawnpoint_final(spawnpoints);
    /#
        if (getdvarint(#"scr_spawn_showbad", 0)) {
            checkbad(result);
        }
    #/
    return result;
}

// Namespace spawnlogic/spawnlogic
// Params 1, eflags: 0x1 linked
// Checksum 0x56c26d3c, Offset: 0x39a8
// Size: 0x262
function getspawnpoint_dm(spawnpoints) {
    if (!isdefined(spawnpoints)) {
        return undefined;
    }
    spawnlogic_begin();
    initweights(spawnpoints);
    aliveplayers = getallotherplayers();
    idealdist = 1600;
    baddist = 1200;
    if (aliveplayers.size > 0) {
        for (i = 0; i < spawnpoints.size; i++) {
            totaldistfromideal = 0;
            nearbybadamount = 0;
            for (j = 0; j < aliveplayers.size; j++) {
                dist = distance(spawnpoints[i].origin, aliveplayers[j].origin);
                if (dist < baddist) {
                    nearbybadamount += (baddist - dist) / baddist;
                }
                distfromideal = abs(dist - idealdist);
                totaldistfromideal += distfromideal;
            }
            avgdistfromideal = totaldistfromideal / aliveplayers.size;
            welldistancedamount = (idealdist - avgdistfromideal) / idealdist;
            spawnpoints[i].weight = welldistancedamount - nearbybadamount * 2 + randomfloat(0.2);
        }
    }
    avoidsamespawn(spawnpoints);
    avoidspawnreuse(spawnpoints, 0);
    avoidweapondamage(spawnpoints);
    avoidvisibleenemies(spawnpoints, 0);
    return getspawnpoint_final(spawnpoints);
}

// Namespace spawnlogic/spawnlogic
// Params 5, eflags: 0x0
// Checksum 0xeb123fba, Offset: 0x3c18
// Size: 0x32a
function getspawnpoint_turned(spawnpoints, idealdist, baddist, idealdistteam, baddistteam) {
    if (!isdefined(spawnpoints)) {
        return undefined;
    }
    spawnlogic_begin();
    initweights(spawnpoints);
    aliveplayers = getallotherplayers();
    if (!isdefined(idealdist)) {
        idealdist = 1600;
    }
    if (!isdefined(idealdistteam)) {
        idealdistteam = 1200;
    }
    if (!isdefined(baddist)) {
        baddist = 1200;
    }
    if (!isdefined(baddistteam)) {
        baddistteam = 600;
    }
    myteam = self.team;
    if (aliveplayers.size > 0) {
        for (i = 0; i < spawnpoints.size; i++) {
            totaldistfromideal = 0;
            nearbybadamount = 0;
            for (j = 0; j < aliveplayers.size; j++) {
                dist = distance(spawnpoints[i].origin, aliveplayers[j].origin);
                distfromideal = 0;
                if (aliveplayers[j].team == myteam) {
                    if (dist < baddistteam) {
                        nearbybadamount += (baddistteam - dist) / baddistteam;
                    }
                    distfromideal = abs(dist - idealdistteam);
                } else {
                    if (dist < baddist) {
                        nearbybadamount += (baddist - dist) / baddist;
                    }
                    distfromideal = abs(dist - idealdist);
                }
                totaldistfromideal += distfromideal;
            }
            avgdistfromideal = totaldistfromideal / aliveplayers.size;
            welldistancedamount = (idealdist - avgdistfromideal) / idealdist;
            spawnpoints[i].weight = welldistancedamount - nearbybadamount * 2 + randomfloat(0.2);
        }
    }
    avoidsamespawn(spawnpoints);
    avoidspawnreuse(spawnpoints, 0);
    avoidweapondamage(spawnpoints);
    avoidvisibleenemies(spawnpoints, 0);
    return getspawnpoint_final(spawnpoints);
}

// Namespace spawnlogic/spawnlogic
// Params 0, eflags: 0x1 linked
// Checksum 0x85286e6f, Offset: 0x3f50
// Size: 0x6a
function spawnlogic_begin() {
    /#
        level.storespawndata = getdvarint(#"scr_recordspawndata", 0);
        level.debugspawning = getdvarint(#"scr_spawnpointdebug", 0) > 0;
    #/
}

/#

    // Namespace spawnlogic/spawnlogic
    // Params 0, eflags: 0x0
    // Checksum 0xacaca64c, Offset: 0x3fc8
    // Size: 0xbc
    function watchspawnprofile() {
        while (true) {
            while (true) {
                if (getdvarint(#"scr_spawnprofile", 0) > 0) {
                    break;
                }
                waitframe(1);
            }
            thread spawnprofile();
            while (true) {
                if (getdvarint(#"scr_spawnprofile", 0) <= 0) {
                    break;
                }
                waitframe(1);
            }
            level notify(#"stop_spawn_profile");
        }
    }

    // Namespace spawnlogic/spawnlogic
    // Params 0, eflags: 0x0
    // Checksum 0xe471b5d1, Offset: 0x4090
    // Size: 0x11e
    function spawnprofile() {
        level endon(#"stop_spawn_profile");
        while (true) {
            if (level.players.size > 0 && level.spawnpoints.size > 0) {
                playernum = randomint(level.players.size);
                player = level.players[playernum];
                attempt = 1;
                while (!isdefined(player) && attempt < level.players.size) {
                    playernum = (playernum + 1) % level.players.size;
                    attempt++;
                    player = level.players[playernum];
                }
                player getspawnpoint_nearteam(level.spawnpoints);
            }
            waitframe(1);
        }
    }

    // Namespace spawnlogic/spawnlogic
    // Params 0, eflags: 0x0
    // Checksum 0xbe079341, Offset: 0x41b8
    // Size: 0x5a
    function spawngraphcheck() {
        while (true) {
            if (getdvarint(#"scr_spawngraph", 0) < 1) {
                wait 3;
                continue;
            }
            thread spawngraph();
            return;
        }
    }

    // Namespace spawnlogic/spawnlogic
    // Params 0, eflags: 0x0
    // Checksum 0x58fbba8, Offset: 0x4220
    // Size: 0x5ee
    function spawngraph() {
        w = 20;
        h = 20;
        weightscale = 0.1;
        fakespawnpoints = [];
        corners = getentarray("<dev string:x1bd>", "<dev string:x1ce>");
        if (corners.size != 2) {
            println("<dev string:x1db>");
            return;
        }
        min = corners[0].origin;
        max = corners[0].origin;
        if (corners[1].origin[0] > max[0]) {
            max = (corners[1].origin[0], max[1], max[2]);
        } else {
            min = (corners[1].origin[0], min[1], min[2]);
        }
        if (corners[1].origin[1] > max[1]) {
            max = (max[0], corners[1].origin[1], max[2]);
        } else {
            min = (min[0], corners[1].origin[1], min[2]);
        }
        i = 0;
        for (y = 0; y < h; y++) {
            yamnt = y / (h - 1);
            for (x = 0; x < w; x++) {
                xamnt = x / (w - 1);
                fakespawnpoints[i] = spawnstruct();
                fakespawnpoints[i].origin = (min[0] * xamnt + max[0] * (1 - xamnt), min[1] * yamnt + max[1] * (1 - yamnt), min[2]);
                fakespawnpoints[i].angles = (0, 0, 0);
                fakespawnpoints[i].forward = anglestoforward(fakespawnpoints[i].angles);
                fakespawnpoints[i].sighttracepoint = fakespawnpoints[i].origin;
                i++;
            }
        }
        didweights = 0;
        while (true) {
            spawni = 0;
            numiters = 5;
            for (i = 0; i < numiters; i++) {
                if (!level.players.size || !isdefined(level.players[0].team) || level.players[0].team == "<dev string:x206>" || !isdefined(level.players[0].curclass)) {
                    break;
                }
                endspawni = spawni + fakespawnpoints.size / numiters;
                if (i == numiters - 1) {
                    endspawni = fakespawnpoints.size;
                }
                while (spawni < endspawni) {
                    spawnpointupdate(fakespawnpoints[spawni]);
                    spawni++;
                }
                if (didweights) {
                    level.players[0] drawspawngraph(fakespawnpoints, w, h, weightscale);
                }
                waitframe(1);
            }
            if (!level.players.size || !isdefined(level.players[0].team) || level.players[0].team == "<dev string:x206>" || !isdefined(level.players[0].curclass)) {
                wait 1;
                continue;
            }
            level.players[0] getspawnpoint_nearteam(fakespawnpoints);
            for (i = 0; i < fakespawnpoints.size; i++) {
                setupspawngraphpoint(fakespawnpoints[i], weightscale);
            }
            didweights = 1;
            level.players[0] drawspawngraph(fakespawnpoints, w, h, weightscale);
            waitframe(1);
        }
    }

    // Namespace spawnlogic/spawnlogic
    // Params 4, eflags: 0x0
    // Checksum 0xe8ee3d63, Offset: 0x4818
    // Size: 0x12e
    function drawspawngraph(fakespawnpoints, w, h, weightscale) {
        i = 0;
        for (y = 0; y < h; y++) {
            yamnt = y / (h - 1);
            for (x = 0; x < w; x++) {
                xamnt = x / (w - 1);
                if (y > 0) {
                    spawngraphline(fakespawnpoints[i], fakespawnpoints[i - w], weightscale);
                }
                if (x > 0) {
                    spawngraphline(fakespawnpoints[i], fakespawnpoints[i - 1], weightscale);
                }
                i++;
            }
        }
    }

    // Namespace spawnlogic/spawnlogic
    // Params 2, eflags: 0x0
    // Checksum 0x6c42cd2d, Offset: 0x4950
    // Size: 0x4e
    function setupspawngraphpoint(s1, weightscale) {
        s1.visible = 1;
        if (s1.weight < -1000 / weightscale) {
            s1.visible = 0;
        }
    }

    // Namespace spawnlogic/spawnlogic
    // Params 3, eflags: 0x0
    // Checksum 0xbad6927b, Offset: 0x49a8
    // Size: 0xd4
    function spawngraphline(s1, s2, weightscale) {
        if (!s1.visible || !s2.visible) {
            return;
        }
        p1 = s1.origin + (0, 0, s1.weight * weightscale + 100);
        p2 = s2.origin + (0, 0, s2.weight * weightscale + 100);
        line(p1, p2, (1, 1, 1));
    }

    // Namespace spawnlogic/spawnlogic
    // Params 0, eflags: 0x0
    // Checksum 0x60b86675, Offset: 0x4a88
    // Size: 0x37a
    function loopbotspawns() {
        while (true) {
            if (getdvarint(#"scr_killbots", 0) < 1) {
                wait 3;
                continue;
            }
            if (!isdefined(level.players)) {
                waitframe(1);
                continue;
            }
            bots = [];
            for (i = 0; i < level.players.size; i++) {
                if (!isdefined(level.players[i])) {
                    continue;
                }
                if (level.players[i].sessionstate == "<dev string:x8e>" && issubstr(level.players[i].name, "<dev string:x212>")) {
                    bots[bots.size] = level.players[i];
                }
            }
            if (bots.size > 0) {
                if (getdvarint(#"scr_killbots", 0) == 1) {
                    killer = bots[randomint(bots.size)];
                    victim = bots[randomint(bots.size)];
                    victim thread [[ level.callbackplayerdamage ]](killer, killer, 1000, 0, "<dev string:x218>", level.weaponnone, (0, 0, 0), (0, 0, 0), "<dev string:x22b>", 0, 0);
                } else {
                    numkills = getdvarint(#"scr_killbots", 0);
                    lastvictim = undefined;
                    for (index = 0; index < numkills; index++) {
                        killer = bots[randomint(bots.size)];
                        for (victim = bots[randomint(bots.size)]; isdefined(lastvictim) && victim == lastvictim; victim = bots[randomint(bots.size)]) {
                        }
                        victim thread [[ level.callbackplayerdamage ]](killer, killer, 1000, 0, "<dev string:x218>", level.weaponnone, (0, 0, 0), (0, 0, 0), "<dev string:x22b>", 0, 0);
                        lastvictim = victim;
                    }
                }
            }
            if (getdvarstring(#"scr_killbottimer") != "<dev string:x38>") {
                wait getdvarfloat(#"scr_killbottimer", 0);
                continue;
            }
            waitframe(1);
        }
    }

    // Namespace spawnlogic/spawnlogic
    // Params 0, eflags: 0x0
    // Checksum 0xc9b1ee6b, Offset: 0x4e10
    // Size: 0x1f8
    function allowspawndatareading() {
        setdvar(#"scr_showspawnid", "<dev string:x38>");
        prevval = getdvarstring(#"scr_showspawnid");
        prevrelval = getdvarstring(#"scr_spawnidcycle");
        readthistime = 0;
        while (true) {
            val = getdvarstring(#"scr_showspawnid");
            relval = undefined;
            if (!isdefined(val) || val == prevval) {
                relval = getdvarstring(#"scr_spawnidcycle");
                if (isdefined(relval) && relval != "<dev string:x38>") {
                    setdvar(#"scr_spawnidcycle", "<dev string:x38>");
                } else {
                    wait 0.5;
                    continue;
                }
            }
            prevval = val;
            readthistime = 0;
            readspawndata(val, relval);
            if (!isdefined(level.curspawndata)) {
                println("<dev string:x232>");
            } else {
                println("<dev string:x24b>" + level.curspawndata.id);
            }
            thread drawspawndata();
        }
    }

    // Namespace spawnlogic/spawnlogic
    // Params 0, eflags: 0x0
    // Checksum 0xd866f77b, Offset: 0x5010
    // Size: 0x472
    function showdeathsdebug() {
        while (true) {
            if (!getdvarint(#"scr_spawnpointdebug", 0)) {
                wait 3;
                continue;
            }
            time = gettime();
            for (i = 0; i < level.spawnlogic_deaths.size; i++) {
                if (isdefined(level.spawnlogic_deaths[i].los)) {
                    line(level.spawnlogic_deaths[i].org, level.spawnlogic_deaths[i].killorg, (1, 0, 0));
                } else {
                    line(level.spawnlogic_deaths[i].org, level.spawnlogic_deaths[i].killorg, (1, 1, 1));
                }
                killer = level.spawnlogic_deaths[i].killer;
                if (isdefined(killer) && isalive(killer)) {
                    line(level.spawnlogic_deaths[i].killorg, killer.origin, (0.4, 0.4, 0.8));
                }
            }
            for (p = 0; p < level.players.size; p++) {
                if (!isdefined(level.players[p])) {
                    continue;
                }
                if (isdefined(level.players[p].spawnlogic_killdist)) {
                    print3d(level.players[p].origin + (0, 0, 64), level.players[p].spawnlogic_killdist, (1, 1, 1));
                }
            }
            oldspawnkills = level.spawnlogic_spawnkills;
            level.spawnlogic_spawnkills = [];
            for (i = 0; i < oldspawnkills.size; i++) {
                spawnkill = oldspawnkills[i];
                if (spawnkill.var_47d2dfb) {
                    line(spawnkill.spawnpointorigin, spawnkill.dierorigin, (0.4, 0.5, 0.4));
                    line(spawnkill.dierorigin, spawnkill.killerorigin, (0, 1, 1));
                    print3d(spawnkill.dierorigin + (0, 0, 32), "<dev string:x25f>", (0, 1, 1));
                } else {
                    line(spawnkill.spawnpointorigin, spawnkill.killerorigin, (0.4, 0.5, 0.4));
                    line(spawnkill.killerorigin, spawnkill.dierorigin, (0, 1, 1));
                    print3d(spawnkill.dierorigin + (0, 0, 32), "<dev string:x26e>", (0, 1, 1));
                }
                if (time - spawnkill.time < 60000) {
                    level.spawnlogic_spawnkills[level.spawnlogic_spawnkills.size] = oldspawnkills[i];
                }
            }
            waitframe(1);
        }
    }

#/

// Namespace spawnlogic/spawnlogic
// Params 0, eflags: 0x0
// Checksum 0xca9f84c5, Offset: 0x5490
// Size: 0x56
function updatedeathinfodebug() {
    while (true) {
        if (!getdvarint(#"scr_spawnpointdebug", 0)) {
            wait 3;
            continue;
        }
        updatedeathinfo();
        wait 3;
    }
}

// Namespace spawnlogic/spawnlogic
// Params 1, eflags: 0x1 linked
// Checksum 0x3f48bc42, Offset: 0x54f0
// Size: 0x2e0
function spawnweightdebug(spawnpoints) {
    level notify(#"stop_spawn_weight_debug");
    level endon(#"stop_spawn_weight_debug");
    /#
        while (true) {
            if (!getdvarint(#"scr_spawnpointdebug", 0)) {
                wait 3;
                continue;
            }
            textoffset = (0, 0, -12);
            for (i = 0; i < spawnpoints.size; i++) {
                amnt = 1 * (1 - spawnpoints[i].weight / -100000);
                if (amnt < 0) {
                    amnt = 0;
                }
                if (amnt > 1) {
                    amnt = 1;
                }
                orig = spawnpoints[i].origin + (0, 0, 80);
                print3d(orig, int(spawnpoints[i].weight), (1, amnt, 0.5));
                orig += textoffset;
                if (isdefined(spawnpoints[i].spawndata)) {
                    for (j = 0; j < spawnpoints[i].spawndata.size; j++) {
                        print3d(orig, spawnpoints[i].spawndata[j], (0.5, 0.5, 0.5));
                        orig += textoffset;
                    }
                }
                if (isdefined(spawnpoints[i].sightchecks)) {
                    for (j = 0; j < spawnpoints[i].sightchecks.size; j++) {
                        if (spawnpoints[i].sightchecks[j].penalty == 0) {
                            continue;
                        }
                        print3d(orig, "<dev string:x27b>" + spawnpoints[i].sightchecks[j].penalty, (0.5, 0.5, 0.5));
                        orig += textoffset;
                    }
                }
            }
            waitframe(1);
        }
    #/
}

// Namespace spawnlogic/spawnlogic
// Params 0, eflags: 0x0
// Checksum 0x925754cd, Offset: 0x57d8
// Size: 0xee
function profiledebug() {
    while (true) {
        if (!getdvarint(#"scr_spawnpointprofile", 0)) {
            wait 3;
            continue;
        }
        for (i = 0; i < level.spawnpoints.size; i++) {
            level.spawnpoints[i].weight = randomint(10000);
        }
        if (level.players.size > 0) {
            level.players[randomint(level.players.size)] getspawnpoint_nearteam(level.spawnpoints);
        }
        waitframe(1);
    }
}

/#

    // Namespace spawnlogic/spawnlogic
    // Params 2, eflags: 0x0
    // Checksum 0xa5cdbdfe, Offset: 0x58d0
    // Size: 0xd2
    function debugnearbyplayers(players, origin) {
        if (!getdvarint(#"scr_spawnpointdebug", 0)) {
            return;
        }
        starttime = gettime();
        while (true) {
            for (i = 0; i < players.size; i++) {
                line(players[i].origin, origin, (0.5, 1, 0.5));
            }
            if (gettime() - starttime > 5000) {
                return;
            }
            waitframe(1);
        }
    }

#/

// Namespace spawnlogic/spawnlogic
// Params 2, eflags: 0x0
// Checksum 0xc24d4e92, Offset: 0x59b0
// Size: 0x14
function deathoccured(dier, killer) {
    
}

// Namespace spawnlogic/spawnlogic
// Params 1, eflags: 0x0
// Checksum 0xde1ca5c1, Offset: 0x59d0
// Size: 0x104
function checkforsimilardeaths(deathinfo) {
    for (i = 0; i < level.spawnlogic_deaths.size; i++) {
        if (level.spawnlogic_deaths[i].killer == deathinfo.killer) {
            dist = distance(level.spawnlogic_deaths[i].org, deathinfo.org);
            if (dist > 200) {
                continue;
            }
            dist = distance(level.spawnlogic_deaths[i].killorg, deathinfo.killorg);
            if (dist > 200) {
                continue;
            }
            level.spawnlogic_deaths[i].remove = 1;
        }
    }
}

// Namespace spawnlogic/spawnlogic
// Params 0, eflags: 0x1 linked
// Checksum 0xc1eb936e, Offset: 0x5ae0
// Size: 0x1d8
function updatedeathinfo() {
    time = gettime();
    for (i = 0; i < level.spawnlogic_deaths.size; i++) {
        deathinfo = level.spawnlogic_deaths[i];
        if (time - deathinfo.time > 90000 || !isdefined(deathinfo.killer) || !isalive(deathinfo.killer) || !isdefined(level.teams[deathinfo.killer.team]) || distance(deathinfo.killer.origin, deathinfo.killorg) > 400) {
            level.spawnlogic_deaths[i].remove = 1;
        }
    }
    oldarray = level.spawnlogic_deaths;
    level.spawnlogic_deaths = [];
    start = 0;
    if (oldarray.size - 1024 > 0) {
        start = oldarray.size - 1024;
    }
    for (i = start; i < oldarray.size; i++) {
        if (!isdefined(oldarray[i].remove)) {
            level.spawnlogic_deaths[level.spawnlogic_deaths.size] = oldarray[i];
        }
    }
}

// Namespace spawnlogic/spawnlogic
// Params 1, eflags: 0x1 linked
// Checksum 0xb5e06f3f, Offset: 0x5cc0
// Size: 0x1d2
function avoidweapondamage(spawnpoints) {
    if (!getdvarstring(#"scr_spawnpointnewlogic")) {
        return;
    }
    weapondamagepenalty = 100000;
    if (isdefined(getdvar(#"scr_spawnpointweaponpenalty"))) {
        weapondamagepenalty = getdvarfloat(#"scr_spawnpointweaponpenalty", 0);
    }
    mingrenadedistsquared = 62500;
    for (i = 0; i < spawnpoints.size; i++) {
        for (j = 0; j < level.grenades.size; j++) {
            if (!isdefined(level.grenades[j])) {
                continue;
            }
            if (distancesquared(spawnpoints[i].origin, level.grenades[j].origin) < mingrenadedistsquared) {
                spawnpoints[i].weight = spawnpoints[i].weight - weapondamagepenalty;
                /#
                    if (level.storespawndata || level.debugspawning) {
                        spawnpoints[i].spawndata[spawnpoints[i].spawndata.size] = "<dev string:x28f>" + int(weapondamagepenalty);
                    }
                #/
            }
        }
    }
}

// Namespace spawnlogic/spawnlogic
// Params 0, eflags: 0x0
// Checksum 0x232dd211, Offset: 0x5ea0
// Size: 0x80
function spawnperframeupdate() {
    spawnpointindex = 0;
    while (true) {
        waitframe(1);
        if (!isdefined(level.spawnpoints)) {
            return;
        }
        spawnpointindex = (spawnpointindex + 1) % level.spawnpoints.size;
        spawnpoint = level.spawnpoints[spawnpointindex];
        spawnpointupdate(spawnpoint);
    }
}

// Namespace spawnlogic/spawnlogic
// Params 2, eflags: 0x1 linked
// Checksum 0x104b2c58, Offset: 0x5f28
// Size: 0xae
function getnonteamsum(skip_team, sums) {
    value = 0;
    foreach (team, _ in level.teams) {
        if (team == skip_team) {
            continue;
        }
        value += sums[team];
    }
    return value;
}

// Namespace spawnlogic/spawnlogic
// Params 2, eflags: 0x1 linked
// Checksum 0x182808f6, Offset: 0x5fe0
// Size: 0xbe
function getnonteammindist(skip_team, mindists) {
    dist = 9999999;
    foreach (team, _ in level.teams) {
        if (team == skip_team) {
            continue;
        }
        if (dist > mindists[team]) {
            dist = mindists[team];
        }
    }
    return dist;
}

// Namespace spawnlogic/spawnlogic
// Params 1, eflags: 0x1 linked
// Checksum 0x6d8a7ff9, Offset: 0x60a8
// Size: 0x672
function spawnpointupdate(spawnpoint) {
    if (level.teambased) {
        sights = [];
        foreach (team, _ in level.teams) {
            spawnpoint.enemysights[team] = 0;
            sights[team] = 0;
            spawnpoint.nearbyplayers[team] = [];
        }
    } else {
        spawnpoint.enemysights = 0;
        spawnpoint.nearbyplayers[#"all"] = [];
    }
    spawnpointdir = spawnpoint.forward;
    debug = 0;
    /#
        debug = getdvarint(#"scr_spawnpointdebug", 0) > 0;
    #/
    mindist = [];
    distsum = [];
    if (!level.teambased) {
        mindist[#"all"] = 9999999;
    }
    foreach (team, _ in level.teams) {
        spawnpoint.distsum[team] = 0;
        spawnpoint.enemydistsum[team] = 0;
        spawnpoint.minenemydist[team] = 9999999;
        mindist[team] = 9999999;
    }
    spawnpoint.numplayersatlastupdate = 0;
    for (i = 0; i < level.players.size; i++) {
        player = level.players[i];
        if (player.sessionstate != "playing") {
            continue;
        }
        diff = player.origin - spawnpoint.origin;
        diff = (diff[0], diff[1], 0);
        dist = length(diff);
        team = "all";
        if (level.teambased) {
            team = player.team;
        }
        if (dist < 1024) {
            spawnpoint.nearbyplayers[team][spawnpoint.nearbyplayers[team].size] = player;
        }
        if (dist < mindist[team]) {
            mindist[team] = dist;
        }
        distsum[team] = distsum[team] + dist;
        spawnpoint.numplayersatlastupdate++;
        pdir = anglestoforward(player.angles);
        if (vectordot(spawnpointdir, diff) < 0 && vectordot(pdir, diff) > 0) {
            continue;
        }
        losexists = bullettracepassed(player.origin + (0, 0, 50), spawnpoint.sighttracepoint, 0, undefined);
        spawnpoint.lastsighttracetime = gettime();
        if (losexists) {
            if (level.teambased) {
                sights[player.team]++;
            } else {
                spawnpoint.enemysights++;
            }
            /#
                if (debug) {
                    line(player.origin + (0, 0, 50), spawnpoint.sighttracepoint, (0.5, 1, 0.5));
                }
            #/
        }
    }
    if (level.teambased) {
        foreach (team, _ in level.teams) {
            spawnpoint.enemysights[team] = getnonteamsum(team, sights);
            spawnpoint.minenemydist[team] = getnonteammindist(team, mindist);
            spawnpoint.distsum[team] = distsum[team];
            spawnpoint.enemydistsum[team] = getnonteamsum(team, distsum);
        }
        return;
    }
    spawnpoint.distsum[#"all"] = distsum[#"all"];
    spawnpoint.enemydistsum[#"all"] = distsum[#"all"];
    spawnpoint.minenemydist[#"all"] = mindist[#"all"];
}

// Namespace spawnlogic/spawnlogic
// Params 0, eflags: 0x1 linked
// Checksum 0xefaff606, Offset: 0x6728
// Size: 0x7a
function getlospenalty() {
    if (isdefined(getdvar(#"scr_spawnpointlospenalty")) && getdvarint(#"scr_spawnpointlospenalty", 0)) {
        return getdvarfloat(#"scr_spawnpointlospenalty", 0);
    }
    return 100000;
}

// Namespace spawnlogic/spawnlogic
// Params 1, eflags: 0x1 linked
// Checksum 0x4d8e3ab, Offset: 0x67b0
// Size: 0x29e
function lastminutesighttraces(spawnpoint) {
    if (!isdefined(spawnpoint.nearbyplayers)) {
        return false;
    }
    closest = undefined;
    closestdistsq = undefined;
    secondclosest = undefined;
    secondclosestdistsq = undefined;
    foreach (team in spawnpoint.nearbyplayers) {
        if (team == self.team) {
            continue;
        }
        for (i = 0; i < spawnpoint.nearbyplayers[team].size; i++) {
            player = spawnpoint.nearbyplayers[team][i];
            if (!isdefined(player)) {
                continue;
            }
            if (player.sessionstate != "playing") {
                continue;
            }
            if (player == self) {
                continue;
            }
            distsq = distancesquared(spawnpoint.origin, player.origin);
            if (!isdefined(closest) || distsq < closestdistsq) {
                secondclosest = closest;
                secondclosestdistsq = closestdistsq;
                closest = player;
                closestdistsq = distsq;
                continue;
            }
            if (!isdefined(secondclosest) || distsq < secondclosestdistsq) {
                secondclosest = player;
                secondclosestdistsq = distsq;
            }
        }
    }
    if (isdefined(closest)) {
        if (bullettracepassed(closest.origin + (0, 0, 50), spawnpoint.sighttracepoint, 0, undefined)) {
            return true;
        }
    }
    if (isdefined(secondclosest)) {
        if (bullettracepassed(secondclosest.origin + (0, 0, 50), spawnpoint.sighttracepoint, 0, undefined)) {
            return true;
        }
    }
    return false;
}

// Namespace spawnlogic/spawnlogic
// Params 2, eflags: 0x1 linked
// Checksum 0x1fcb01d, Offset: 0x6a58
// Size: 0x530
function avoidvisibleenemies(spawnpoints, teambased) {
    if (!getdvarint(#"scr_spawnpointnewlogic", 0)) {
        return;
    }
    lospenalty = getlospenalty();
    mindistteam = self.team;
    if (teambased) {
        for (i = 0; i < spawnpoints.size; i++) {
            if (!isdefined(spawnpoints[i].enemysights)) {
                continue;
            }
            penalty = lospenalty * spawnpoints[i].enemysights[self.team];
            spawnpoints[i].weight = spawnpoints[i].weight - penalty;
            /#
                if (level.storespawndata || level.debugspawning) {
                    index = spawnpoints[i].sightchecks.size;
                    spawnpoints[i].sightchecks[index] = spawnstruct();
                    spawnpoints[i].sightchecks[index].penalty = penalty;
                }
            #/
        }
    } else {
        for (i = 0; i < spawnpoints.size; i++) {
            if (!isdefined(spawnpoints[i].enemysights)) {
                continue;
            }
            penalty = lospenalty * spawnpoints[i].enemysights;
            spawnpoints[i].weight = spawnpoints[i].weight - penalty;
            /#
                if (level.storespawndata || level.debugspawning) {
                    index = spawnpoints[i].sightchecks.size;
                    spawnpoints[i].sightchecks[index] = spawnstruct();
                    spawnpoints[i].sightchecks[index].penalty = penalty;
                }
            #/
        }
        mindistteam = "all";
    }
    avoidweight = getdvarfloat(#"scr_spawn_enemyavoidweight", 0);
    if (avoidweight != 0) {
        nearbyenemyouterrange = getdvarfloat(#"scr_spawn_enemyavoiddist", 800);
        nearbyenemyouterrangesq = nearbyenemyouterrange * nearbyenemyouterrange;
        nearbyenemypenalty = 1500 * avoidweight;
        nearbyenemyminorpenalty = 800 * avoidweight;
        lastattackerorigin = (-99999, -99999, -99999);
        lastdeathpos = (-99999, -99999, -99999);
        if (isalive(self.lastattacker)) {
            lastattackerorigin = self.lastattacker.origin;
        }
        if (isdefined(self.lastdeathpos)) {
            lastdeathpos = self.lastdeathpos;
        }
        for (i = 0; i < spawnpoints.size; i++) {
            mindist = spawnpoints[i].minenemydist[mindistteam];
            if (mindist < nearbyenemyouterrange * 2) {
                penalty = nearbyenemyminorpenalty * (1 - mindist / nearbyenemyouterrange * 2);
                if (mindist < nearbyenemyouterrange) {
                    penalty += nearbyenemypenalty * (1 - mindist / nearbyenemyouterrange);
                }
                if (penalty > 0) {
                    spawnpoints[i].weight = spawnpoints[i].weight - penalty;
                    /#
                        if (level.storespawndata || level.debugspawning) {
                            spawnpoints[i].spawndata[spawnpoints[i].spawndata.size] = "<dev string:x2a5>" + int(spawnpoints[i].minenemydist[mindistteam]) + "<dev string:x2b9>" + int(penalty);
                        }
                    #/
                }
            }
        }
    }
}

// Namespace spawnlogic/spawnlogic
// Params 2, eflags: 0x1 linked
// Checksum 0x99dcca9e, Offset: 0x6f90
// Size: 0x258
function avoidspawnreuse(spawnpoints, teambased) {
    if (!getdvarint(#"scr_spawnpointnewlogic", 0)) {
        return;
    }
    time = gettime();
    maxtime = 10000;
    maxdistsq = 1048576;
    for (i = 0; i < spawnpoints.size; i++) {
        spawnpoint = spawnpoints[i];
        if (!isdefined(spawnpoint.lastspawnedplayer) || !isdefined(spawnpoint.lastspawntime) || !isalive(spawnpoint.lastspawnedplayer)) {
            continue;
        }
        if (spawnpoint.lastspawnedplayer == self) {
            continue;
        }
        if (teambased && spawnpoint.lastspawnedplayer.team == self.team) {
            continue;
        }
        timepassed = time - spawnpoint.lastspawntime;
        if (timepassed < maxtime) {
            distsq = distancesquared(spawnpoint.lastspawnedplayer.origin, spawnpoint.origin);
            if (distsq < maxdistsq) {
                worsen = 5000 * (1 - distsq / maxdistsq) * (1 - timepassed / maxtime);
                spawnpoint.weight -= worsen;
                /#
                    if (level.storespawndata || level.debugspawning) {
                        spawnpoint.spawndata[spawnpoint.spawndata.size] = "<dev string:x2c5>" + worsen;
                    }
                #/
            } else {
                spawnpoint.lastspawnedplayer = undefined;
            }
            continue;
        }
        spawnpoint.lastspawnedplayer = undefined;
    }
}

// Namespace spawnlogic/spawnlogic
// Params 1, eflags: 0x1 linked
// Checksum 0x1d05a179, Offset: 0x71f0
// Size: 0xf4
function avoidsamespawn(spawnpoints) {
    if (!getdvarint(#"scr_spawnpointnewlogic", 0)) {
        return;
    }
    if (!isdefined(self.lastspawnpoint)) {
        return;
    }
    for (i = 0; i < spawnpoints.size; i++) {
        if (spawnpoints[i] == self.lastspawnpoint) {
            spawnpoints[i].weight = spawnpoints[i].weight - 50000;
            /#
                if (level.storespawndata || level.debugspawning) {
                    spawnpoints[i].spawndata[spawnpoints[i].spawndata.size] = "<dev string:x2dc>";
                }
            #/
            break;
        }
    }
}

// Namespace spawnlogic/spawnlogic
// Params 0, eflags: 0x1 linked
// Checksum 0xe17a2f9f, Offset: 0x72f0
// Size: 0xa2
function getrandomintermissionpoint() {
    spawnpoints = getentarray("mp_global_intermission", "classname");
    if (!spawnpoints.size) {
        spawnpoints = getentarray("info_player_start", "classname");
    }
    assert(spawnpoints.size);
    spawnpoint = getspawnpoint_random(spawnpoints);
    return spawnpoint;
}

