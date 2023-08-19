// Atian COD Tools GSC decompiler test
#include scripts/core_common/system_shared.gsc;

#namespace as_debug;

// Namespace as_debug/debug
// Params 0, eflags: 0x2
// Checksum 0x29041158, Offset: 0x70
// Size: 0x3c
function autoexec __init__system__() {
    /#
        system::register(#"as_debug", &__init__, undefined, undefined);
    #/
}

// Namespace as_debug/debug
// Params 0, eflags: 0x0
// Checksum 0xe2ef0d5b, Offset: 0xb8
// Size: 0x1c
function __init__() {
    /#
        level thread debugdvars();
    #/
}

// Namespace as_debug/debug
// Params 0, eflags: 0x0
// Checksum 0x6b20ea56, Offset: 0xe0
// Size: 0x56
function debugdvars() {
    /#
        while (1) {
            if (getdvarint(#"debug_ai_clear_corpses", 0)) {
                delete_all_ai_corpses();
            }
            waitframe(1);
        }
    #/
}

// Namespace as_debug/debug
// Params 0, eflags: 0x0
// Checksum 0x5cbe5f58, Offset: 0x140
// Size: 0x58
function isdebugon() {
    /#
        return getdvarint(#"animdebug", 0) == 1 || isdefined(anim.var_43bd01a) && anim.var_43bd01a == self;
    #/
}

// Namespace as_debug/debug
// Params 4, eflags: 0x0
// Checksum 0x8ccaadf8, Offset: 0x1a0
// Size: 0x6c
function drawdebuglineinternal(frompoint, topoint, color, durationframes) {
    /#
        for (i = 0; i < durationframes; i++) {
            line(frompoint, topoint, color);
            waitframe(1);
        }
    #/
}

// Namespace as_debug/debug
// Params 4, eflags: 0x0
// Checksum 0x2f985c75, Offset: 0x218
// Size: 0x5c
function drawdebugline(frompoint, topoint, color, durationframes) {
    /#
        if (isdebugon()) {
            thread drawdebuglineinternal(frompoint, topoint, color, durationframes);
        }
    #/
}

// Namespace as_debug/debug
// Params 4, eflags: 0x0
// Checksum 0xcbcd2414, Offset: 0x280
// Size: 0x74
function debugline(frompoint, topoint, color, durationframes) {
    /#
        for (i = 0; i < durationframes * 20; i++) {
            line(frompoint, topoint, color);
            waitframe(1);
        }
    #/
}

// Namespace as_debug/debug
// Params 4, eflags: 0x0
// Checksum 0x6cfc9010, Offset: 0x300
// Size: 0x144
function drawdebugcross(atpoint, radius, color, durationframes) {
    /#
        atpoint_high = atpoint + (0, 0, radius);
        atpoint_low = atpoint + (0, 0, -1 * radius);
        atpoint_left = atpoint + (0, radius, 0);
        atpoint_right = atpoint + (0, -1 * radius, 0);
        atpoint_forward = atpoint + (radius, 0, 0);
        atpoint_back = atpoint + (-1 * radius, 0, 0);
        thread debugline(atpoint_high, atpoint_low, color, durationframes);
        thread debugline(atpoint_left, atpoint_right, color, durationframes);
        thread debugline(atpoint_forward, atpoint_back, color, durationframes);
    #/
}

// Namespace as_debug/debug
// Params 0, eflags: 0x0
// Checksum 0x59308914, Offset: 0x450
// Size: 0xa6
function updatedebuginfo() {
    /#
        self endon(#"death");
        self.debuginfo = spawnstruct();
        self.debuginfo.enabled = getdvarint(#"ai_debuganimscript", 0) > 0;
        debugclearstate();
        while (1) {
            waitframe(1);
            updatedebuginfointernal();
            waitframe(1);
        }
    #/
}

// Namespace as_debug/debug
// Params 0, eflags: 0x0
// Checksum 0xec3e3e1f, Offset: 0x500
// Size: 0x116
function updatedebuginfointernal() {
    /#
        if (isdefined(anim.var_43bd01a) && anim.var_43bd01a == self) {
            var_42f56fcb = 1;
        } else {
            var_42f56fcb = getdvarint(#"ai_debuganimscript", 0) > 0;
            if (var_42f56fcb) {
                var_9ac29367 = getdvarint(#"ai_debugentindex", 0);
                if (var_9ac29367 > -1 && var_9ac29367 != self getentitynumber()) {
                    var_42f56fcb = 0;
                }
            }
            if (!self.debuginfo.enabled && var_42f56fcb) {
                self.debuginfo.var_3d9450a5 = 1;
            }
            self.debuginfo.enabled = var_42f56fcb;
        }
    #/
}

// Namespace as_debug/debug
// Params 4, eflags: 0x0
// Checksum 0x13bb9fe2, Offset: 0x620
// Size: 0x134
function drawdebugenttext(text, ent, color, channel) {
    /#
        /#
            assert(isdefined(ent));
        #/
        if (!getdvarint(#"recorder_enablerec", 0)) {
            if (!isdefined(ent.var_97715acd) || gettime() > ent.var_97715acd) {
                ent.var_1594c4f = 0;
                ent.var_97715acd = gettime();
            }
            var_dbf79cdd = vectorscale(vectorscale((0, 0, -1), 10), ent.var_1594c4f);
            print3d(self.origin + vectorscale((0, 0, 1), 70) + var_dbf79cdd, text, color);
            ent.var_1594c4f++;
        } else {
            recordenttext(text, ent, color, channel);
        }
    #/
}

// Namespace as_debug/debug
// Params 2, eflags: 0x0
// Checksum 0xec141201, Offset: 0x760
// Size: 0x196
function debugpushstate(statename, var_baab7b74) {
    /#
        if (!getdvarint(#"ai_debuganimscript", 0)) {
            return;
        }
        var_9ac29367 = getdvarint(#"ai_debugentindex", 0);
        if (var_9ac29367 > -1 && var_9ac29367 != self getentitynumber()) {
            return;
        }
        /#
            assert(isdefined(self.debuginfo.states));
        #/
        /#
            assert(isdefined(statename));
        #/
        state = spawnstruct();
        state.statename = statename;
        state.var_43c1367f = self.debuginfo.var_43c1367f;
        state.var_d6c907b4 = gettime();
        state.var_81ff599e = 1;
        self.debuginfo.var_43c1367f++;
        if (isdefined(var_baab7b74)) {
            state.var_baab7b74 = var_baab7b74 + "<unknown string>";
        }
        self.debuginfo.states[self.debuginfo.states.size] = state;
    #/
}

// Namespace as_debug/debug
// Params 2, eflags: 0x0
// Checksum 0xe46a451d, Offset: 0x900
// Size: 0x2e6
function debugaddstateinfo(statename, var_baab7b74) {
    /#
        if (!getdvarint(#"ai_debuganimscript", 0)) {
            return;
        }
        var_9ac29367 = getdvarint(#"ai_debugentindex", 0);
        if (var_9ac29367 > -1 && var_9ac29367 != self getentitynumber()) {
            return;
        }
        /#
            assert(isdefined(self.debuginfo.states));
        #/
        if (isdefined(statename)) {
            for (i = self.debuginfo.states.size - 1; i >= 0; i--) {
                /#
                    assert(isdefined(self.debuginfo.states[i]));
                #/
                if (self.debuginfo.states[i].statename == statename) {
                    if (!isdefined(self.debuginfo.states[i].var_baab7b74)) {
                        self.debuginfo.states[i].var_baab7b74 = "<unknown string>";
                    }
                    self.debuginfo.states[i].var_baab7b74 = self.debuginfo.states[i].var_baab7b74 + var_baab7b74 + "<unknown string>";
                    break;
                }
            }
        } else if (self.debuginfo.states.size > 0) {
            var_2061e237 = self.debuginfo.states.size - 1;
            /#
                assert(isdefined(self.debuginfo.states[var_2061e237]));
            #/
            if (!isdefined(self.debuginfo.states[var_2061e237].var_baab7b74)) {
                self.debuginfo.states[var_2061e237].var_baab7b74 = "<unknown string>";
            }
            self.debuginfo.states[var_2061e237].var_baab7b74 = self.debuginfo.states[var_2061e237].var_baab7b74 + var_baab7b74 + "<unknown string>";
        }
    #/
}

// Namespace as_debug/debug
// Params 2, eflags: 0x0
// Checksum 0x242b9dab, Offset: 0xbf0
// Size: 0x342
function debugpopstate(statename, var_36fb59b3) {
    /#
        if (!getdvarint(#"ai_debuganimscript", 0) || self.debuginfo.states.size <= 0) {
            return;
        }
        var_9ac29367 = getdvarint(#"ai_debugentindex", 0);
        if (!isdefined(self) || !isalive(self)) {
            return;
        }
        if (var_9ac29367 > -1 && var_9ac29367 != self getentitynumber()) {
            return;
        }
        /#
            assert(isdefined(self.debuginfo.states));
        #/
        if (isdefined(statename)) {
            for (i = 0; i < self.debuginfo.states.size; i++) {
                if (self.debuginfo.states[i].statename == statename && self.debuginfo.states[i].var_81ff599e) {
                    self.debuginfo.states[i].var_81ff599e = 0;
                    self.debuginfo.states[i].var_36fb59b3 = var_36fb59b3;
                    self.debuginfo.var_43c1367f = self.debuginfo.states[i].var_43c1367f;
                    for (j = i + 1; j < self.debuginfo.states.size && self.debuginfo.states[j].var_43c1367f > self.debuginfo.states[i].var_43c1367f; j++) {
                        self.debuginfo.states[j].var_81ff599e = 0;
                    }
                    break;
                }
            }
        } else {
            for (i = self.debuginfo.states.size - 1; i >= 0; i--) {
                if (self.debuginfo.states[i].var_81ff599e) {
                    self.debuginfo.states[i].var_81ff599e = 0;
                    self.debuginfo.states[i].var_36fb59b3 = var_36fb59b3;
                    self.debuginfo.var_43c1367f--;
                    break;
                }
            }
        }
    #/
}

// Namespace as_debug/debug
// Params 0, eflags: 0x0
// Checksum 0x3d5017c7, Offset: 0xf40
// Size: 0x3a
function debugclearstate() {
    /#
        self.debuginfo.states = [];
        self.debuginfo.var_43c1367f = 0;
        self.debuginfo.var_3d9450a5 = 0;
    #/
}

// Namespace as_debug/debug
// Params 0, eflags: 0x0
// Checksum 0xda0fbe1d, Offset: 0xf88
// Size: 0x4a
function debugshouldclearstate() {
    /#
        if (isdefined(self.debuginfo) && isdefined(self.debuginfo.var_3d9450a5) && self.debuginfo.var_3d9450a5) {
            return 1;
        }
        return 0;
    #/
}

// Namespace as_debug/debug
// Params 0, eflags: 0x0
// Checksum 0xe25257cf, Offset: 0xfe0
// Size: 0x9a
function debugcleanstatestack() {
    /#
        newarray = [];
        for (i = 0; i < self.debuginfo.states.size; i++) {
            if (self.debuginfo.states[i].var_81ff599e) {
                newarray[newarray.size] = self.debuginfo.states[i];
            }
        }
        self.debuginfo.states = newarray;
    #/
}

// Namespace as_debug/debug
// Params 1, eflags: 0x0
// Checksum 0x14a25a30, Offset: 0x1088
// Size: 0x5c
function indent(depth) {
    /#
        indent = "<unknown string>";
        for (i = 0; i < depth; i++) {
            indent = indent + "<unknown string>";
        }
        return indent;
    #/
}

// Namespace as_debug/debug
// Params 3, eflags: 0x0
// Checksum 0xcc9e8ecf, Offset: 0x10f0
// Size: 0xee
function debugdrawweightedpoints(entity, points, weights) {
    /#
        var_1bb42b2b = 0;
        var_6433ca11 = 0;
        for (index = 0; index < points.size; index++) {
            if (weights[index] < var_1bb42b2b) {
                var_1bb42b2b = weights[index];
            }
            if (weights[index] > var_6433ca11) {
                var_6433ca11 = weights[index];
            }
        }
        for (index = 0; index < points.size; index++) {
            debugdrawweightedpoint(entity, points[index], weights[index], var_1bb42b2b, var_6433ca11);
        }
    #/
}

// Namespace as_debug/debug
// Params 5, eflags: 0x0
// Checksum 0x4010fe2c, Offset: 0x11e8
// Size: 0x15c
function debugdrawweightedpoint(entity, point, weight, var_1bb42b2b, var_6433ca11) {
    /#
        var_7c9d6d04 = var_6433ca11 - var_1bb42b2b;
        var_97d344be = var_7c9d6d04 / 2;
        var_3b910b24 = var_1bb42b2b + var_7c9d6d04 / 2;
        if (var_97d344be == 0) {
            var_97d344be = 1;
        }
        if (weight <= var_3b910b24) {
            var_9cac7e8d = 1 - abs((weight - var_1bb42b2b) / var_97d344be);
            recordcircle(point, 2, (var_9cac7e8d, 0, 0), "<unknown string>", entity);
        } else {
            var_71af081d = 1 - abs((var_6433ca11 - weight) / var_97d344be);
            recordcircle(point, 2, (0, var_71af081d, 0), "<unknown string>", entity);
        }
    #/
}

// Namespace as_debug/debug
// Params 0, eflags: 0x0
// Checksum 0xd9dad718, Offset: 0x1350
// Size: 0xd0
function delete_all_ai_corpses() {
    /#
        setdvar(#"debug_ai_clear_corpses", 0);
        corpses = getcorpsearray();
        foreach (corpse in corpses) {
            if (isactorcorpse(corpse)) {
                corpse delete();
            }
        }
    #/
}

