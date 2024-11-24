#using scripts\core_common\struct;
#using scripts\core_common\util_shared;

#namespace zm_net;

// Namespace zm_net/zm_net
// Params 2, eflags: 0x1 linked
// Checksum 0xac1e40a0, Offset: 0x78
// Size: 0x84
function network_choke_init(id, max) {
    if (!isdefined(level.zombie_network_choke_ids_max)) {
        level.zombie_network_choke_ids_max = [];
        level.zombie_network_choke_ids_count = [];
    }
    level.zombie_network_choke_ids_max[id] = max;
    level.zombie_network_choke_ids_count[id] = 0;
    level thread network_choke_thread(id);
}

// Namespace zm_net/zm_net
// Params 1, eflags: 0x1 linked
// Checksum 0xa7c6d8d6, Offset: 0x108
// Size: 0x4e
function network_choke_thread(id) {
    while (true) {
        util::wait_network_frame();
        util::wait_network_frame();
        level.zombie_network_choke_ids_count[id] = 0;
    }
}

// Namespace zm_net/zm_net
// Params 1, eflags: 0x1 linked
// Checksum 0x376a3780, Offset: 0x160
// Size: 0x2e
function network_choke_safe(id) {
    return level.zombie_network_choke_ids_count[id] < level.zombie_network_choke_ids_max[id];
}

// Namespace zm_net/zm_net
// Params 5, eflags: 0x1 linked
// Checksum 0xb02a7436, Offset: 0x198
// Size: 0xf8
function network_choke_action(id, choke_action, arg1, arg2, arg3) {
    assert(isdefined(level.zombie_network_choke_ids_max[id]), "<dev string:x38>" + id + "<dev string:x4a>");
    while (!network_choke_safe(id)) {
        waitframe(1);
    }
    level.zombie_network_choke_ids_count[id]++;
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

// Namespace zm_net/zm_net
// Params 1, eflags: 0x1 linked
// Checksum 0xfad6d142, Offset: 0x298
// Size: 0x1c
function network_entity_valid(entity) {
    if (!isdefined(entity)) {
        return false;
    }
    return true;
}

// Namespace zm_net/zm_net
// Params 2, eflags: 0x1 linked
// Checksum 0x320c97a, Offset: 0x2c0
// Size: 0x7c
function network_safe_init(id, max) {
    if (!isdefined(level.zombie_network_choke_ids_max) || !isdefined(level.zombie_network_choke_ids_max[id])) {
        network_choke_init(id, max);
    }
    assert(max == level.zombie_network_choke_ids_max[id]);
}

// Namespace zm_net/zm_net
// Params 2, eflags: 0x1 linked
// Checksum 0xb2d57fb4, Offset: 0x348
// Size: 0x2a
function _network_safe_spawn(classname, origin) {
    return spawn(classname, origin);
}

// Namespace zm_net/zm_net
// Params 4, eflags: 0x1 linked
// Checksum 0x25396b4d, Offset: 0x380
// Size: 0x62
function network_safe_spawn(id, max, classname, origin) {
    network_safe_init(id, max);
    return network_choke_action(id, &_network_safe_spawn, classname, origin);
}

// Namespace zm_net/zm_net
// Params 3, eflags: 0x1 linked
// Checksum 0xa45b85d3, Offset: 0x3f0
// Size: 0x54
function _network_safe_play_fx_on_tag(fx, entity, tag) {
    if (network_entity_valid(entity)) {
        playfxontag(fx, entity, tag);
    }
}

// Namespace zm_net/zm_net
// Params 5, eflags: 0x1 linked
// Checksum 0xa3c1f66b, Offset: 0x450
// Size: 0x6c
function network_safe_play_fx_on_tag(id, max, fx, entity, tag) {
    network_safe_init(id, max);
    network_choke_action(id, &_network_safe_play_fx_on_tag, fx, entity, tag);
}

