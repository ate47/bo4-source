// Atian COD Tools GSC decompiler test
#namespace blackboard;

// Namespace blackboard/ai_blackboard
// Params 0, eflags: 0x2
// Checksum 0x3eedbe29, Offset: 0x68
// Size: 0x14
function autoexec main() {
    _initializeblackboard();
}

// Namespace blackboard/ai_blackboard
// Params 0, eflags: 0x5 linked
// Checksum 0x2a488699, Offset: 0x88
// Size: 0x2c
function private _initializeblackboard() {
    level.__ai_blackboard = [];
    level thread _updateevents();
}

// Namespace blackboard/ai_blackboard
// Params 0, eflags: 0x5 linked
// Checksum 0x21557449, Offset: 0xc0
// Size: 0x1a4
function private _updateevents() {
    waittime = 1 * float(function_60d95f53()) / 1000;
    updatemillis = int(waittime * 1000);
    while (true) {
        foreach (eventname, events in level.__ai_blackboard) {
            liveevents = [];
            foreach (event in events) {
                event.ttl = event.ttl - updatemillis;
                if (event.ttl > 0) {
                    liveevents[liveevents.size] = event;
                }
            }
            level.__ai_blackboard[eventname] = liveevents;
        }
        wait(waittime);
    }
}

// Namespace blackboard/ai_blackboard
// Params 3, eflags: 0x1 linked
// Checksum 0x7457276f, Offset: 0x270
// Size: 0x1b8
function addblackboardevent(eventname, data, timetoliveinmillis) {
    /#
        /#
            assert(isstring(eventname) || ishash(eventname), "<unknown string>");
        #/
        /#
            assert(isdefined(data), "<unknown string>");
        #/
        /#
            assert(isint(timetoliveinmillis) && timetoliveinmillis > 0, "<unknown string>");
        #/
    #/
    event = spawnstruct();
    event.data = data;
    event.timestamp = gettime();
    event.ttl = timetoliveinmillis;
    if (!isdefined(level.__ai_blackboard[eventname])) {
        level.__ai_blackboard[eventname] = [];
    } else if (!isarray(level.__ai_blackboard[eventname])) {
        level.__ai_blackboard[eventname] = array(level.__ai_blackboard[eventname]);
    }
    level.__ai_blackboard[eventname][level.__ai_blackboard[eventname].size] = event;
}

// Namespace blackboard/ai_blackboard
// Params 1, eflags: 0x1 linked
// Checksum 0xadbadb7e, Offset: 0x430
// Size: 0x34
function getblackboardevents(eventname) {
    if (isdefined(level.__ai_blackboard[eventname])) {
        return level.__ai_blackboard[eventname];
    }
    return [];
}

// Namespace blackboard/ai_blackboard
// Params 1, eflags: 0x0
// Checksum 0x1d87200a, Offset: 0x470
// Size: 0x34
function removeblackboardevents(eventname) {
    if (isdefined(level.__ai_blackboard[eventname])) {
        level.__ai_blackboard[eventname] = undefined;
    }
}

