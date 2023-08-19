// Atian COD Tools GSC decompiler test
#include scripts/zm_common/zm_utility.gsc;
#include scripts/core_common/struct.gsc;

#namespace zm_server_throttle;

// Namespace zm_server_throttle/zm_server_throttle
// Params 2, eflags: 0x1 linked
// Checksum 0xed168661, Offset: 0x78
// Size: 0x84
function server_choke_init(id, max) {
    if (!isdefined(level.zombie_server_choke_ids_max)) {
        level.zombie_server_choke_ids_max = [];
        level.zombie_server_choke_ids_count = [];
    }
    level.zombie_server_choke_ids_max[id] = max;
    level.zombie_server_choke_ids_count[id] = 0;
    level thread server_choke_thread(id);
}

// Namespace zm_server_throttle/zm_server_throttle
// Params 1, eflags: 0x1 linked
// Checksum 0xefe4b8eb, Offset: 0x108
// Size: 0x32
function server_choke_thread(id) {
    while (1) {
        waitframe(1);
        level.zombie_server_choke_ids_count[id] = 0;
    }
}

// Namespace zm_server_throttle/zm_server_throttle
// Params 1, eflags: 0x1 linked
// Checksum 0x16538c5a, Offset: 0x148
// Size: 0x2e
function server_choke_safe(id) {
    return level.zombie_server_choke_ids_count[id] < level.zombie_server_choke_ids_max[id];
}

// Namespace zm_server_throttle/zm_server_throttle
// Params 5, eflags: 0x1 linked
// Checksum 0xf8511a7, Offset: 0x180
// Size: 0xf8
function server_choke_action(id, choke_action, arg1, arg2, arg3) {
    /#
        assert(isdefined(level.zombie_server_choke_ids_max[id]), "<unknown string>" + id + "<unknown string>");
    #/
    while (!server_choke_safe(id)) {
        waitframe(1);
    }
    level.zombie_server_choke_ids_count[id]++;
    if (!isdefined(arg1)) {
        return [[ choke_action ]]();
    }
    if (!isdefined(arg2)) {
        return [[ choke_action ]](arg1);
    }
    if (!isdefined(arg3)) {
        return [[ choke_action ]](arg1, arg2);
    }
    return [[ choke_action ]](arg1, arg2, arg3);
}

// Namespace zm_server_throttle/zm_server_throttle
// Params 1, eflags: 0x0
// Checksum 0xa3c1605b, Offset: 0x280
// Size: 0x1c
function server_entity_valid(entity) {
    if (!isdefined(entity)) {
        return 0;
    }
    return 1;
}

// Namespace zm_server_throttle/zm_server_throttle
// Params 2, eflags: 0x1 linked
// Checksum 0xa043ad12, Offset: 0x2a8
// Size: 0x7c
function server_safe_init(id, max) {
    if (!isdefined(level.zombie_server_choke_ids_max) || !isdefined(level.zombie_server_choke_ids_max[id])) {
        server_choke_init(id, max);
    }
    /#
        assert(max == level.zombie_server_choke_ids_max[id]);
    #/
}

// Namespace zm_server_throttle/zm_server_throttle
// Params 1, eflags: 0x1 linked
// Checksum 0x7353cf1, Offset: 0x330
// Size: 0x22
function _server_safe_ground_trace(pos) {
    return zm_utility::groundpos(pos);
}

// Namespace zm_server_throttle/zm_server_throttle
// Params 3, eflags: 0x1 linked
// Checksum 0xc9034f98, Offset: 0x360
// Size: 0x52
function server_safe_ground_trace(id, max, origin) {
    server_safe_init(id, max);
    return server_choke_action(id, &_server_safe_ground_trace, origin);
}

// Namespace zm_server_throttle/zm_server_throttle
// Params 1, eflags: 0x1 linked
// Checksum 0x1e98323f, Offset: 0x3c0
// Size: 0x22
function _server_safe_ground_trace_ignore_water(pos) {
    return zm_utility::groundpos_ignore_water(pos);
}

// Namespace zm_server_throttle/zm_server_throttle
// Params 3, eflags: 0x0
// Checksum 0xbd04e07d, Offset: 0x3f0
// Size: 0x52
function server_safe_ground_trace_ignore_water(id, max, origin) {
    server_safe_init(id, max);
    return server_choke_action(id, &_server_safe_ground_trace_ignore_water, origin);
}

