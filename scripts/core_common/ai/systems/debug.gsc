#using scripts\core_common\system_shared;

#namespace as_debug;

/#

    // Namespace as_debug/debug
    // Params 0, eflags: 0x2
    // Checksum 0x29041158, Offset: 0x70
    // Size: 0x3c
    function autoexec __init__system__() {
        system::register(#"as_debug", &__init__, undefined, undefined);
    }

    // Namespace as_debug/debug
    // Params 0, eflags: 0x0
    // Checksum 0xe2ef0d5b, Offset: 0xb8
    // Size: 0x1c
    function __init__() {
        level thread debugdvars();
    }

    // Namespace as_debug/debug
    // Params 0, eflags: 0x0
    // Checksum 0x6b20ea56, Offset: 0xe0
    // Size: 0x56
    function debugdvars() {
        while (true) {
            if (getdvarint(#"debug_ai_clear_corpses", 0)) {
                delete_all_ai_corpses();
            }
            waitframe(1);
        }
    }

    // Namespace as_debug/debug
    // Params 0, eflags: 0x0
    // Checksum 0x5cbe5f58, Offset: 0x140
    // Size: 0x58
    function isdebugon() {
        return getdvarint(#"animdebug", 0) == 1 || isdefined(anim.debugent) && anim.debugent == self;
    }

    // Namespace as_debug/debug
    // Params 4, eflags: 0x0
    // Checksum 0x8ccaadf8, Offset: 0x1a0
    // Size: 0x6c
    function drawdebuglineinternal(frompoint, topoint, color, durationframes) {
        for (i = 0; i < durationframes; i++) {
            line(frompoint, topoint, color);
            waitframe(1);
        }
    }

    // Namespace as_debug/debug
    // Params 4, eflags: 0x0
    // Checksum 0x2f985c75, Offset: 0x218
    // Size: 0x5c
    function drawdebugline(frompoint, topoint, color, durationframes) {
        if (isdebugon()) {
            thread drawdebuglineinternal(frompoint, topoint, color, durationframes);
        }
    }

    // Namespace as_debug/debug
    // Params 4, eflags: 0x0
    // Checksum 0xcbcd2414, Offset: 0x280
    // Size: 0x74
    function debugline(frompoint, topoint, color, durationframes) {
        for (i = 0; i < durationframes * 20; i++) {
            line(frompoint, topoint, color);
            waitframe(1);
        }
    }

    // Namespace as_debug/debug
    // Params 4, eflags: 0x0
    // Checksum 0x6cfc9010, Offset: 0x300
    // Size: 0x144
    function drawdebugcross(atpoint, radius, color, durationframes) {
        atpoint_high = atpoint + (0, 0, radius);
        atpoint_low = atpoint + (0, 0, -1 * radius);
        atpoint_left = atpoint + (0, radius, 0);
        atpoint_right = atpoint + (0, -1 * radius, 0);
        atpoint_forward = atpoint + (radius, 0, 0);
        atpoint_back = atpoint + (-1 * radius, 0, 0);
        thread debugline(atpoint_high, atpoint_low, color, durationframes);
        thread debugline(atpoint_left, atpoint_right, color, durationframes);
        thread debugline(atpoint_forward, atpoint_back, color, durationframes);
    }

    // Namespace as_debug/debug
    // Params 0, eflags: 0x0
    // Checksum 0x59308914, Offset: 0x450
    // Size: 0xa6
    function updatedebuginfo() {
        self endon(#"death");
        self.debuginfo = spawnstruct();
        self.debuginfo.enabled = getdvarint(#"ai_debuganimscript", 0) > 0;
        debugclearstate();
        while (true) {
            waitframe(1);
            updatedebuginfointernal();
            waitframe(1);
        }
    }

    // Namespace as_debug/debug
    // Params 0, eflags: 0x0
    // Checksum 0xec3e3e1f, Offset: 0x500
    // Size: 0x116
    function updatedebuginfointernal() {
        if (isdefined(anim.debugent) && anim.debugent == self) {
            doinfo = 1;
            return;
        }
        doinfo = getdvarint(#"ai_debuganimscript", 0) > 0;
        if (doinfo) {
            ai_entnum = getdvarint(#"ai_debugentindex", 0);
            if (ai_entnum > -1 && ai_entnum != self getentitynumber()) {
                doinfo = 0;
            }
        }
        if (!self.debuginfo.enabled && doinfo) {
            self.debuginfo.shouldclearonanimscriptchange = 1;
        }
        self.debuginfo.enabled = doinfo;
    }

    // Namespace as_debug/debug
    // Params 4, eflags: 0x0
    // Checksum 0x13bb9fe2, Offset: 0x620
    // Size: 0x134
    function drawdebugenttext(text, ent, color, channel) {
        assert(isdefined(ent));
        if (!getdvarint(#"recorder_enablerec", 0)) {
            if (!isdefined(ent.debuganimscripttime) || gettime() > ent.debuganimscripttime) {
                ent.debuganimscriptlevel = 0;
                ent.debuganimscripttime = gettime();
            }
            indentlevel = vectorscale((0, 0, -10), ent.debuganimscriptlevel);
            print3d(self.origin + (0, 0, 70) + indentlevel, text, color);
            ent.debuganimscriptlevel++;
            return;
        }
        recordenttext(text, ent, color, channel);
    }

    // Namespace as_debug/debug
    // Params 2, eflags: 0x0
    // Checksum 0xec141201, Offset: 0x760
    // Size: 0x196
    function debugpushstate(statename, extrainfo) {
        if (!getdvarint(#"ai_debuganimscript", 0)) {
            return;
        }
        ai_entnum = getdvarint(#"ai_debugentindex", 0);
        if (ai_entnum > -1 && ai_entnum != self getentitynumber()) {
            return;
        }
        assert(isdefined(self.debuginfo.states));
        assert(isdefined(statename));
        state = spawnstruct();
        state.statename = statename;
        state.statelevel = self.debuginfo.statelevel;
        state.statetime = gettime();
        state.statevalid = 1;
        self.debuginfo.statelevel++;
        if (isdefined(extrainfo)) {
            state.extrainfo = extrainfo + "<dev string:x38>";
        }
        self.debuginfo.states[self.debuginfo.states.size] = state;
    }

    // Namespace as_debug/debug
    // Params 2, eflags: 0x0
    // Checksum 0xe46a451d, Offset: 0x900
    // Size: 0x2e6
    function debugaddstateinfo(statename, extrainfo) {
        if (!getdvarint(#"ai_debuganimscript", 0)) {
            return;
        }
        ai_entnum = getdvarint(#"ai_debugentindex", 0);
        if (ai_entnum > -1 && ai_entnum != self getentitynumber()) {
            return;
        }
        assert(isdefined(self.debuginfo.states));
        if (isdefined(statename)) {
            for (i = self.debuginfo.states.size - 1; i >= 0; i--) {
                assert(isdefined(self.debuginfo.states[i]));
                if (self.debuginfo.states[i].statename == statename) {
                    if (!isdefined(self.debuginfo.states[i].extrainfo)) {
                        self.debuginfo.states[i].extrainfo = "<dev string:x3c>";
                    }
                    self.debuginfo.states[i].extrainfo += extrainfo + "<dev string:x38>";
                    break;
                }
            }
            return;
        }
        if (self.debuginfo.states.size > 0) {
            lastindex = self.debuginfo.states.size - 1;
            assert(isdefined(self.debuginfo.states[lastindex]));
            if (!isdefined(self.debuginfo.states[lastindex].extrainfo)) {
                self.debuginfo.states[lastindex].extrainfo = "<dev string:x3c>";
            }
            self.debuginfo.states[lastindex].extrainfo += extrainfo + "<dev string:x38>";
        }
    }

    // Namespace as_debug/debug
    // Params 2, eflags: 0x0
    // Checksum 0x242b9dab, Offset: 0xbf0
    // Size: 0x342
    function debugpopstate(statename, exitreason) {
        if (!getdvarint(#"ai_debuganimscript", 0) || self.debuginfo.states.size <= 0) {
            return;
        }
        ai_entnum = getdvarint(#"ai_debugentindex", 0);
        if (!isdefined(self) || !isalive(self)) {
            return;
        }
        if (ai_entnum > -1 && ai_entnum != self getentitynumber()) {
            return;
        }
        assert(isdefined(self.debuginfo.states));
        if (isdefined(statename)) {
            for (i = 0; i < self.debuginfo.states.size; i++) {
                if (self.debuginfo.states[i].statename == statename && self.debuginfo.states[i].statevalid) {
                    self.debuginfo.states[i].statevalid = 0;
                    self.debuginfo.states[i].exitreason = exitreason;
                    self.debuginfo.statelevel = self.debuginfo.states[i].statelevel;
                    for (j = i + 1; j < self.debuginfo.states.size && self.debuginfo.states[j].statelevel > self.debuginfo.states[i].statelevel; j++) {
                        self.debuginfo.states[j].statevalid = 0;
                    }
                    break;
                }
            }
            return;
        }
        for (i = self.debuginfo.states.size - 1; i >= 0; i--) {
            if (self.debuginfo.states[i].statevalid) {
                self.debuginfo.states[i].statevalid = 0;
                self.debuginfo.states[i].exitreason = exitreason;
                self.debuginfo.statelevel--;
                break;
            }
        }
    }

    // Namespace as_debug/debug
    // Params 0, eflags: 0x0
    // Checksum 0x3d5017c7, Offset: 0xf40
    // Size: 0x3a
    function debugclearstate() {
        self.debuginfo.states = [];
        self.debuginfo.statelevel = 0;
        self.debuginfo.shouldclearonanimscriptchange = 0;
    }

    // Namespace as_debug/debug
    // Params 0, eflags: 0x0
    // Checksum 0xda0fbe1d, Offset: 0xf88
    // Size: 0x4a
    function debugshouldclearstate() {
        if (isdefined(self.debuginfo) && isdefined(self.debuginfo.shouldclearonanimscriptchange) && self.debuginfo.shouldclearonanimscriptchange) {
            return 1;
        }
        return 0;
    }

    // Namespace as_debug/debug
    // Params 0, eflags: 0x0
    // Checksum 0xe25257cf, Offset: 0xfe0
    // Size: 0x9a
    function debugcleanstatestack() {
        newarray = [];
        for (i = 0; i < self.debuginfo.states.size; i++) {
            if (self.debuginfo.states[i].statevalid) {
                newarray[newarray.size] = self.debuginfo.states[i];
            }
        }
        self.debuginfo.states = newarray;
    }

    // Namespace as_debug/debug
    // Params 1, eflags: 0x0
    // Checksum 0x14a25a30, Offset: 0x1088
    // Size: 0x5c
    function indent(depth) {
        indent = "<dev string:x3c>";
        for (i = 0; i < depth; i++) {
            indent += "<dev string:x38>";
        }
        return indent;
    }

    // Namespace as_debug/debug
    // Params 3, eflags: 0x0
    // Checksum 0xcc9e8ecf, Offset: 0x10f0
    // Size: 0xee
    function debugdrawweightedpoints(entity, points, weights) {
        lowestvalue = 0;
        highestvalue = 0;
        for (index = 0; index < points.size; index++) {
            if (weights[index] < lowestvalue) {
                lowestvalue = weights[index];
            }
            if (weights[index] > highestvalue) {
                highestvalue = weights[index];
            }
        }
        for (index = 0; index < points.size; index++) {
            debugdrawweightedpoint(entity, points[index], weights[index], lowestvalue, highestvalue);
        }
    }

    // Namespace as_debug/debug
    // Params 5, eflags: 0x0
    // Checksum 0x4010fe2c, Offset: 0x11e8
    // Size: 0x15c
    function debugdrawweightedpoint(entity, point, weight, lowestvalue, highestvalue) {
        deltavalue = highestvalue - lowestvalue;
        halfdeltavalue = deltavalue / 2;
        midvalue = lowestvalue + deltavalue / 2;
        if (halfdeltavalue == 0) {
            halfdeltavalue = 1;
        }
        if (weight <= midvalue) {
            redcolor = 1 - abs((weight - lowestvalue) / halfdeltavalue);
            recordcircle(point, 2, (redcolor, 0, 0), "<dev string:x3f>", entity);
            return;
        }
        greencolor = 1 - abs((highestvalue - weight) / halfdeltavalue);
        recordcircle(point, 2, (0, greencolor, 0), "<dev string:x3f>", entity);
    }

    // Namespace as_debug/debug
    // Params 0, eflags: 0x0
    // Checksum 0xd9dad718, Offset: 0x1350
    // Size: 0xd0
    function delete_all_ai_corpses() {
        setdvar(#"debug_ai_clear_corpses", 0);
        corpses = getcorpsearray();
        foreach (corpse in corpses) {
            if (isactorcorpse(corpse)) {
                corpse delete();
            }
        }
    }

#/
