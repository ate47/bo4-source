// Atian COD Tools GSC decompiler test
#namespace blackboard;

// Namespace blackboard/namespace_d1ef8796
// Params 0, eflags: 0x2
// Checksum 0x3eedbe29, Offset: 0x68
// Size: 0x14
function autoexec main() {
    _initializeblackboard();
}

// Namespace blackboard/namespace_d1ef8796
// Params 0, eflags: 0x5 linked
// Checksum 0x2a488699, Offset: 0x88
// Size: 0x2c
function private _initializeblackboard() {
    level.var_7e0ff990 = [];
    level thread _updateevents();
}

// Namespace blackboard/namespace_d1ef8796
// Params 0, eflags: 0x5 linked
// Checksum 0x21557449, Offset: 0xc0
// Size: 0x1a4
function private _updateevents() {
    waittime = 1 * float(function_60d95f53()) / 1000;
    var_51f27050 = int(waittime * 1000);
    while (1) {
        foreach (eventname, events in level.var_7e0ff990) {
            var_190ce6ad = [];
            foreach (event in events) {
                event.var_7f7c7c3 = event.var_7f7c7c3 - var_51f27050;
                if (event.var_7f7c7c3 > 0) {
                    var_190ce6ad[var_190ce6ad.size] = event;
                }
            }
            level.var_7e0ff990[eventname] = var_190ce6ad;
        }
        wait(waittime);
    }
}

// Namespace blackboard/namespace_d1ef8796
// Params 3, eflags: 0x1 linked
// Checksum 0x7457276f, Offset: 0x270
// Size: 0x1b8
function addblackboardevent(eventname, data, var_b6dedcfe) {
    /#
        /#
            assert(isstring(eventname) || ishash(eventname), "<unknown string>");
        #/
        /#
            assert(isdefined(data), "<unknown string>");
        #/
        /#
            assert(isint(var_b6dedcfe) && var_b6dedcfe > 0, "<unknown string>");
        #/
    #/
    event = spawnstruct();
    event.data = data;
    event.timestamp = gettime();
    event.var_7f7c7c3 = var_b6dedcfe;
    if (!isdefined(level.var_7e0ff990[eventname])) {
        level.var_7e0ff990[eventname] = [];
    } else if (!isarray(level.var_7e0ff990[eventname])) {
        level.var_7e0ff990[eventname] = array(level.var_7e0ff990[eventname]);
    }
    level.var_7e0ff990[eventname][level.var_7e0ff990[eventname].size] = event;
}

// Namespace blackboard/namespace_d1ef8796
// Params 1, eflags: 0x1 linked
// Checksum 0xadbadb7e, Offset: 0x430
// Size: 0x34
function getblackboardevents(eventname) {
    if (isdefined(level.var_7e0ff990[eventname])) {
        return level.var_7e0ff990[eventname];
    }
    return [];
}

// Namespace blackboard/namespace_d1ef8796
// Params 1, eflags: 0x0
// Checksum 0x1d87200a, Offset: 0x470
// Size: 0x34
function removeblackboardevents(eventname) {
    if (isdefined(level.var_7e0ff990[eventname])) {
        eventname = [];
    }
}

