#using scripts\core_common\system_shared;

#namespace voice_events;

// Namespace voice_events/voice_events
// Params 0, eflags: 0x2
// Checksum 0xbedb2f77, Offset: 0x70
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"voice_events", &__init__, undefined, undefined);
}

// Namespace voice_events/voice_events
// Params 0, eflags: 0x1 linked
// Checksum 0x24302667, Offset: 0xb8
// Size: 0x2a
function __init__() {
    level.var_d5d1ddd5 = [];
    level.var_a95b39fd = [];
    level.var_fde3243f = [];
}

// Namespace voice_events/voice_events
// Params 2, eflags: 0x0
// Checksum 0x86a24483, Offset: 0xf0
// Size: 0xb8
function register_handler(event, handlerfunc) {
    assert(isdefined(event), "<dev string:x38>");
    assert(isfunctionptr(handlerfunc), "<dev string:x5c>");
    funcs = level.var_d5d1ddd5[event];
    if (!isdefined(funcs)) {
        funcs = [];
        level.var_d5d1ddd5[event] = funcs;
    }
    funcs[funcs.size] = handlerfunc;
}

// Namespace voice_events/voice_events
// Params 4, eflags: 0x0
// Checksum 0xda0726d8, Offset: 0x1b0
// Size: 0x1ae
function function_840acc1c(event, handlerfunc, priority = 0, var_c10e92a2 = undefined) {
    assert(isdefined(event), "<dev string:x38>");
    assert(isfunctionptr(handlerfunc), "<dev string:x5c>");
    assert(isint(priority) || isfloat(priority), "<dev string:x8f>");
    assert(!isdefined(var_c10e92a2) || isfunctionptr(var_c10e92a2), "<dev string:xab>");
    assert(!isdefined(level.var_a95b39fd[event]), "<dev string:xdf>" + event);
    handler = {#handlerfunc:handlerfunc, #priority:priority, #var_c10e92a2:var_c10e92a2};
    level.var_a95b39fd[event] = handler;
}

// Namespace voice_events/voice_events
// Params 1, eflags: 0x0
// Checksum 0x63f2fe38, Offset: 0x368
// Size: 0xc4
function create_queue(queuename) {
    assert(isdefined(queuename), "<dev string:x10b>");
    assert(!isdefined(level.var_fde3243f[queuename]), "<dev string:x150>" + queuename);
    if (!isdefined(queuename) || isdefined(level.var_fde3243f[queuename])) {
        return;
    }
    queue = [];
    level.var_fde3243f[queuename] = queue;
    level thread function_accf7a2e(queue);
}

// Namespace voice_events/voice_events
// Params 5, eflags: 0x0
// Checksum 0xfce1de89, Offset: 0x438
// Size: 0x28c
function queue_event(queuename, event, handlerfunc, priority = 0, params = undefined) {
    assert(isdefined(queuename), "<dev string:x186>");
    assert(isdefined(level.var_fde3243f[queuename]), "<dev string:x1ca>" + queuename);
    assert(isdefined(event), "<dev string:x1fc>");
    assert(isfunctionptr(handlerfunc), "<dev string:x23c>");
    assert(isint(priority) || isfloat(priority), "<dev string:x28b>");
    assert(!isdefined(params) || isstruct(params), "<dev string:x2c3>");
    queue = level.var_fde3243f[queuename];
    if (!isdefined(queue) || !isdefined(event) || !isfunctionptr(handlerfunc)) {
        return;
    }
    if (!isint(priority) && !isfloat(priority)) {
        return;
    }
    item = spawnstruct();
    item.context = self;
    item.time = gettime();
    item.event = event;
    item.priority = priority;
    item.handlerfunc = handlerfunc;
    item.params = params;
    queue_item(queue, item);
}

// Namespace voice_events/voice_events
// Params 2, eflags: 0x1 linked
// Checksum 0xfebf4d4b, Offset: 0x6d0
// Size: 0x230
function function_c710099c(event, params) {
    funcs = level.var_d5d1ddd5[event];
    if (isdefined(funcs)) {
        foreach (func in funcs) {
            self thread [[ func ]](event, params);
        }
    }
    handler = level.var_a95b39fd[event];
    if (!isdefined(handler)) {
        return;
    }
    var_c10e92a2 = handler.var_c10e92a2;
    foreach (name, queue in level.var_fde3243f) {
        item = spawnstruct();
        item.context = self;
        item.time = gettime();
        item.priority = handler.priority;
        item.event = event;
        item.handlerfunc = handler.handlerfunc;
        if (isstruct(params)) {
            item.params = structcopy(params);
        }
        if (!isdefined(var_c10e92a2) || self [[ var_c10e92a2 ]](name, queue, item)) {
            queue_item(queue, item);
        }
    }
}

// Namespace voice_events/voice_events
// Params 2, eflags: 0x5 linked
// Checksum 0x91382913, Offset: 0x908
// Size: 0x7c
function private queue_item(&queue, item) {
    for (i = 0; i < queue.size; i++) {
        if (queue[i].priority < item.priority) {
            break;
        }
    }
    arrayinsert(queue, item, i);
}

// Namespace voice_events/voice_events
// Params 1, eflags: 0x5 linked
// Checksum 0xb666aeea, Offset: 0x990
// Size: 0xba
function private function_accf7a2e(&queue) {
    level endon(#"game_ended");
    while (true) {
        while (queue.size > 0) {
            item = queue[0];
            arrayremoveindex(queue, 0);
            if (!isdefined(item.context)) {
                continue;
            }
            item.context [[ item.handlerfunc ]](item.event, item.params);
        }
        waitframe(1);
    }
}

