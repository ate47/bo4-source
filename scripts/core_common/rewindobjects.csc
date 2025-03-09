#using scripts\core_common\system_shared;

#namespace rewindobjects;

// Namespace rewindobjects/rewindobjects
// Params 0, eflags: 0x2
// Checksum 0x2fe70a32, Offset: 0x98
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"rewindobjects", &__init__, undefined, undefined);
}

// Namespace rewindobjects/rewindobjects
// Params 0, eflags: 0x0
// Checksum 0x8a2d07f, Offset: 0xe0
// Size: 0x12
function __init__() {
    level.rewindwatcherarray = [];
}

// Namespace rewindobjects/rewindobjects
// Params 1, eflags: 0x0
// Checksum 0xed857efc, Offset: 0x100
// Size: 0x64
function initrewindobjectwatchers(localclientnum) {
    level.rewindwatcherarray[localclientnum] = [];
    createnapalmrewindwatcher(localclientnum);
    createairstrikerewindwatcher(localclientnum);
    level thread watchrewindableevents(localclientnum);
}

// Namespace rewindobjects/rewindobjects
// Params 1, eflags: 0x0
// Checksum 0xb25ee99, Offset: 0x170
// Size: 0x18c
function watchrewindableevents(localclientnum) {
    for (;;) {
        if (isdefined(level.rewindwatcherarray[localclientnum])) {
            rewindwatcherkeys = getarraykeys(level.rewindwatcherarray[localclientnum]);
            for (i = 0; i < rewindwatcherkeys.size; i++) {
                rewindwatcher = level.rewindwatcherarray[localclientnum][rewindwatcherkeys[i]];
                if (!isdefined(rewindwatcher)) {
                    continue;
                }
                if (!isdefined(rewindwatcher.event)) {
                    continue;
                }
                timekeys = getarraykeys(rewindwatcher.event);
                for (j = 0; j < timekeys.size; j++) {
                    timekey = timekeys[j];
                    if (rewindwatcher.event[timekey].inprogress == 1) {
                        continue;
                    }
                    if (getservertime(0) >= timekey) {
                        rewindwatcher thread startrewindableevent(localclientnum, timekey);
                    }
                }
            }
        }
        wait 0.1;
    }
}

// Namespace rewindobjects/rewindobjects
// Params 2, eflags: 0x0
// Checksum 0x936e1491, Offset: 0x308
// Size: 0x220
function startrewindableevent(localclientnum, timekey) {
    player = function_5c10bd79(localclientnum);
    level endon("demo_jump" + localclientnum);
    self.event[timekey].inprogress = 1;
    allfunctionsstarted = 0;
    while (allfunctionsstarted == 0) {
        allfunctionsstarted = 1;
        assert(isdefined(self.timedfunctions));
        timedfunctionkeys = getarraykeys(self.timedfunctions);
        for (i = 0; i < timedfunctionkeys.size; i++) {
            timedfunction = self.timedfunctions[timedfunctionkeys[i]];
            timedfunctionkey = timedfunctionkeys[i];
            if (self.event[timekey].timedfunction[timedfunctionkey] == 1) {
                continue;
            }
            starttime = timekey + int(timedfunction.starttimesec * 1000);
            if (starttime > getservertime(0)) {
                allfunctionsstarted = 0;
                continue;
            }
            self.event[timekey].timedfunction[timedfunctionkey] = 1;
            level thread [[ timedfunction.func ]](localclientnum, starttime, timedfunction.starttimesec, self.event[timekey].data);
        }
        wait 0.1;
    }
}

// Namespace rewindobjects/rewindobjects
// Params 1, eflags: 0x0
// Checksum 0xd1e74c52, Offset: 0x530
// Size: 0x44
function createnapalmrewindwatcher(localclientnum) {
    napalmrewindwatcher = createrewindwatcher(localclientnum, "napalm");
    timeincreasebetweenplanes = 0;
}

// Namespace rewindobjects/rewindobjects
// Params 1, eflags: 0x0
// Checksum 0x13c1e5f, Offset: 0x580
// Size: 0x36
function createairstrikerewindwatcher(localclientnum) {
    airstrikerewindwatcher = createrewindwatcher(localclientnum, "airstrike");
}

// Namespace rewindobjects/rewindobjects
// Params 2, eflags: 0x0
// Checksum 0xb489d281, Offset: 0x5c0
// Size: 0x100
function createrewindwatcher(localclientnum, name) {
    player = function_5c10bd79(localclientnum);
    if (!isdefined(level.rewindwatcherarray[localclientnum])) {
        level.rewindwatcherarray[localclientnum] = [];
    }
    rewindwatcher = getrewindwatcher(localclientnum, name);
    if (!isdefined(rewindwatcher)) {
        rewindwatcher = spawnstruct();
        level.rewindwatcherarray[localclientnum][level.rewindwatcherarray[localclientnum].size] = rewindwatcher;
    }
    rewindwatcher.name = name;
    rewindwatcher.event = [];
    rewindwatcher thread resetondemojump(localclientnum);
    return rewindwatcher;
}

// Namespace rewindobjects/rewindobjects
// Params 1, eflags: 0x0
// Checksum 0x41036766, Offset: 0x6c8
// Size: 0x176
function resetondemojump(localclientnum) {
    for (;;) {
        level waittill("demo_jump" + localclientnum);
        self.inprogress = 0;
        timedfunctionkeys = getarraykeys(self.timedfunctions);
        for (i = 0; i < timedfunctionkeys.size; i++) {
            self.timedfunctions[timedfunctionkeys[i]].inprogress = 0;
        }
        eventkeys = getarraykeys(self.event);
        for (i = 0; i < eventkeys.size; i++) {
            self.event[eventkeys[i]].inprogress = 0;
            timedfunctionkeys = getarraykeys(self.event[eventkeys[i]].timedfunction);
            for (index = 0; index < timedfunctionkeys.size; index++) {
                self.event[eventkeys[i]].timedfunction[timedfunctionkeys[index]] = 0;
            }
        }
    }
}

// Namespace rewindobjects/rewindobjects
// Params 3, eflags: 0x0
// Checksum 0xc48645dc, Offset: 0x848
// Size: 0xca
function addtimedfunction(name, func, relativestarttimeinsecs) {
    if (!isdefined(self.timedfunctions)) {
        self.timedfunctions = [];
    }
    assert(!isdefined(self.timedfunctions[name]));
    self.timedfunctions[name] = spawnstruct();
    self.timedfunctions[name].inprogress = 0;
    self.timedfunctions[name].func = func;
    self.timedfunctions[name].starttimesec = relativestarttimeinsecs;
}

// Namespace rewindobjects/rewindobjects
// Params 2, eflags: 0x0
// Checksum 0x39eb7fe5, Offset: 0x920
// Size: 0xa0
function getrewindwatcher(localclientnum, name) {
    if (!isdefined(level.rewindwatcherarray[localclientnum])) {
        return undefined;
    }
    for (watcher = 0; watcher < level.rewindwatcherarray[localclientnum].size; watcher++) {
        if (level.rewindwatcherarray[localclientnum][watcher].name == name) {
            return level.rewindwatcherarray[localclientnum][watcher];
        }
    }
    return undefined;
}

// Namespace rewindobjects/rewindobjects
// Params 2, eflags: 0x0
// Checksum 0xd5595d88, Offset: 0x9c8
// Size: 0x124
function addrewindableeventtowatcher(starttime, data) {
    if (isdefined(self.event[starttime])) {
        return;
    }
    self.event[starttime] = spawnstruct();
    self.event[starttime].data = data;
    self.event[starttime].inprogress = 0;
    if (isdefined(self.timedfunctions)) {
        timedfunctionkeys = getarraykeys(self.timedfunctions);
        self.event[starttime].timedfunction = [];
        for (i = 0; i < timedfunctionkeys.size; i++) {
            timedfunctionkey = timedfunctionkeys[i];
            self.event[starttime].timedfunction[timedfunctionkey] = 0;
        }
    }
}

// Namespace rewindobjects/rewindobjects
// Params 5, eflags: 0x0
// Checksum 0x9e58fbf6, Offset: 0xaf8
// Size: 0x14e
function servertimedmoveto(localclientnum, startpoint, endpoint, starttime, duration) {
    level endon("demo_jump" + localclientnum);
    timeelapsed = (getservertime(0) - starttime) * 0.001;
    assert(duration > 0);
    dojump = 1;
    if (timeelapsed < 0.02) {
        dojump = 0;
    }
    if (timeelapsed < duration) {
        movetime = duration - timeelapsed;
        if (dojump) {
            jumppoint = getpointonline(startpoint, endpoint, timeelapsed / duration);
            self.origin = jumppoint;
        }
        self moveto(endpoint, movetime, 0, 0);
        return 1;
    }
    self.origin = endpoint;
    return 0;
}

// Namespace rewindobjects/rewindobjects
// Params 6, eflags: 0x0
// Checksum 0x317489c, Offset: 0xc50
// Size: 0x10e
function servertimedrotateto(localclientnum, angles, starttime, duration, timein, timeout) {
    level endon("demo_jump" + localclientnum);
    timeelapsed = (getservertime(0) - starttime) * 0.001;
    if (!isdefined(timein)) {
        timein = 0;
    }
    if (!isdefined(timeout)) {
        timeout = 0;
    }
    assert(duration > 0);
    if (timeelapsed < duration) {
        rotatetime = duration - timeelapsed;
        self rotateto(angles, rotatetime, timein, timeout);
        return 1;
    }
    self.angles = angles;
    return 0;
}

// Namespace rewindobjects/rewindobjects
// Params 2, eflags: 0x0
// Checksum 0x81ddcdef, Offset: 0xd68
// Size: 0x38
function waitforservertime(localclientnum, timefromstart) {
    while (timefromstart > getservertime(0)) {
        waitframe(1);
    }
}

// Namespace rewindobjects/rewindobjects
// Params 2, eflags: 0x0
// Checksum 0x37921b70, Offset: 0xda8
// Size: 0x84
function removecliententonjump(clientent, localclientnum) {
    clientent endon(#"complete");
    player = function_5c10bd79(localclientnum);
    level waittill("demo_jump" + localclientnum);
    clientent notify(#"delete");
    clientent forcedelete();
}

// Namespace rewindobjects/rewindobjects
// Params 3, eflags: 0x0
// Checksum 0x9f5f57a9, Offset: 0xe38
// Size: 0xa0
function getpointonline(startpoint, endpoint, ratio) {
    nextpoint = (startpoint[0] + (endpoint[0] - startpoint[0]) * ratio, startpoint[1] + (endpoint[1] - startpoint[1]) * ratio, startpoint[2] + (endpoint[2] - startpoint[2]) * ratio);
    return nextpoint;
}

