#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\system_shared;

#namespace visionset_mgr;

// Namespace visionset_mgr/visionset_mgr_shared
// Params 0, eflags: 0x2
// Checksum 0xd3799d1b, Offset: 0xe8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"visionset_mgr", &__init__, undefined, undefined);
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xe1e7670d, Offset: 0x130
// Size: 0xd4
function __init__() {
    level.vsmgr_initializing = 1;
    level.vsmgr_default_info_name = "__none";
    level.var_7506365 = [];
    level.vsmgr = [];
    level thread register_type("visionset");
    level thread register_type("overlay");
    callback::on_finalize_initialization(&finalize_clientfields);
    level thread monitor();
    callback::on_connect(&on_player_connect);
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 8, eflags: 0x1 linked
// Checksum 0xdc3fa, Offset: 0x210
// Size: 0x196
function register_info(type, name, version, priority, lerp_step_count, should_activate_per_player, lerp_thread, ref_count_lerp_thread) {
    assert(level.vsmgr_initializing, "<dev string:x38>");
    lower_name = tolower(name);
    validate_info(type, lower_name, priority);
    add_sorted_name_key(type, lower_name);
    add_sorted_priority_key(type, lower_name, priority);
    level.vsmgr[type].info[lower_name] = spawnstruct();
    level.vsmgr[type].info[lower_name] add_info(type, lower_name, version, priority, lerp_step_count, should_activate_per_player, lerp_thread, ref_count_lerp_thread);
    if (level.vsmgr[type].highest_version < version) {
        level.vsmgr[type].highest_version = version;
    }
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 6, eflags: 0x1 linked
// Checksum 0x8be1ec0f, Offset: 0x3b0
// Size: 0x18e
function activate(type, name, player, opt_param_1, opt_param_2, opt_param_3) {
    if (level.vsmgr[type].info[name].state.should_activate_per_player) {
        activate_per_player(type, name, player, opt_param_1, opt_param_2, opt_param_3);
        return;
    }
    state = level.vsmgr[type].info[name].state;
    if (state.ref_count_lerp_thread) {
        state.ref_count++;
        if (1 < state.ref_count) {
            return;
        }
    }
    if (isdefined(state.lerp_thread)) {
        state thread lerp_thread_wrapper(state.lerp_thread, opt_param_1, opt_param_2, opt_param_3);
        return;
    }
    players = getplayers();
    for (player_index = 0; player_index < players.size; player_index++) {
        state set_state_active(players[player_index], 1);
    }
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x8ab82388, Offset: 0x548
// Size: 0x138
function deactivate(type, name, player) {
    if (level.vsmgr[type].info[name].state.should_activate_per_player) {
        deactivate_per_player(type, name, player);
        return;
    }
    state = level.vsmgr[type].info[name].state;
    if (state.ref_count_lerp_thread) {
        state.ref_count--;
        if (0 < state.ref_count) {
            return;
        }
    }
    players = getplayers();
    for (player_index = 0; player_index < players.size; player_index++) {
        state set_state_inactive(players[player_index]);
    }
    state notify(#"visionset_mgr_deactivate_all");
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x60030716, Offset: 0x688
// Size: 0xa2
function set_state_active(player, lerp) {
    if (!isdefined(player)) {
        return;
    }
    player_entnum = player getentitynumber();
    if (!isdefined(self.players[player_entnum])) {
        return;
    }
    self.players[player_entnum].active = 1;
    self.players[player_entnum].lerp = lerp;
    level.var_7506365[player_entnum] = player;
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x55e5ad57, Offset: 0x738
// Size: 0x96
function set_state_inactive(player) {
    if (!isdefined(player)) {
        return;
    }
    player_entnum = player getentitynumber();
    if (!isdefined(self.players[player_entnum])) {
        return;
    }
    self.players[player_entnum].active = 0;
    self.players[player_entnum].lerp = 0;
    level.var_7506365[player_entnum] = player;
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 3, eflags: 0x0
// Checksum 0x9988ae37, Offset: 0x7d8
// Size: 0xa4
function timeout_lerp_thread(timeout, opt_param_2, opt_param_3) {
    players = getplayers();
    for (player_index = 0; player_index < players.size; player_index++) {
        self set_state_active(players[player_index], 1);
    }
    wait timeout;
    deactivate(self.type, self.name);
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 4, eflags: 0x0
// Checksum 0xb336f48b, Offset: 0x888
// Size: 0x6c
function timeout_lerp_thread_per_player(player, timeout, opt_param_2, opt_param_3) {
    self set_state_active(player, 1);
    wait timeout;
    deactivate_per_player(self.type, self.name, player);
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 2, eflags: 0x0
// Checksum 0x406c51ac, Offset: 0x900
// Size: 0x154
function duration_lerp_thread(duration, max_duration) {
    start_time = gettime();
    end_time = start_time + int(duration * 1000);
    if (isdefined(max_duration)) {
        start_time = end_time - int(max_duration * 1000);
    }
    while (true) {
        lerp = calc_remaining_duration_lerp(start_time, end_time);
        if (0 >= lerp) {
            break;
        }
        players = getplayers();
        for (player_index = 0; player_index < players.size; player_index++) {
            self set_state_active(players[player_index], lerp);
        }
        waitframe(1);
    }
    deactivate(self.type, self.name);
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 3, eflags: 0x0
// Checksum 0xfe29a1f0, Offset: 0xa60
// Size: 0x114
function duration_lerp_thread_per_player(player, duration, max_duration) {
    start_time = gettime();
    end_time = start_time + int(duration * 1000);
    if (isdefined(max_duration)) {
        start_time = end_time - int(max_duration * 1000);
    }
    while (true) {
        lerp = calc_remaining_duration_lerp(start_time, end_time);
        if (0 >= lerp) {
            break;
        }
        self set_state_active(player, lerp);
        waitframe(1);
    }
    deactivate_per_player(self.type, self.name, player);
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 2, eflags: 0x0
// Checksum 0x965174ee, Offset: 0xb80
// Size: 0xb6
function ramp_in_thread_per_player(player, duration) {
    start_time = gettime();
    end_time = start_time + int(duration * 1000);
    while (true) {
        lerp = calc_ramp_in_lerp(start_time, end_time);
        if (1 <= lerp) {
            break;
        }
        self set_state_active(player, lerp);
        waitframe(1);
    }
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x82b34222, Offset: 0xc40
// Size: 0x80
function ramp_in_out_thread_hold_func() {
    level endon(#"kill_ramp_in_out_thread_hold_func");
    while (true) {
        for (player_index = 0; player_index < level.players.size; player_index++) {
            self set_state_active(level.players[player_index], 1);
        }
        waitframe(1);
    }
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 3, eflags: 0x1 linked
// Checksum 0xf4f23084, Offset: 0xcc8
// Size: 0x24c
function ramp_in_out_thread(ramp_in, full_period, ramp_out) {
    start_time = gettime();
    end_time = start_time + int(ramp_in * 1000);
    while (true) {
        lerp = calc_ramp_in_lerp(start_time, end_time);
        if (1 <= lerp) {
            break;
        }
        players = getplayers();
        for (player_index = 0; player_index < players.size; player_index++) {
            self set_state_active(players[player_index], lerp);
        }
        waitframe(1);
    }
    self thread ramp_in_out_thread_hold_func();
    if (isfunctionptr(full_period)) {
        self [[ full_period ]]();
    } else {
        wait full_period;
    }
    level notify(#"kill_ramp_in_out_thread_hold_func");
    start_time = gettime();
    end_time = start_time + int(ramp_out * 1000);
    while (true) {
        lerp = calc_remaining_duration_lerp(start_time, end_time);
        if (0 >= lerp) {
            break;
        }
        players = getplayers();
        for (player_index = 0; player_index < players.size; player_index++) {
            self set_state_active(players[player_index], lerp);
        }
        waitframe(1);
    }
    deactivate(self.type, self.name);
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 4, eflags: 0x1 linked
// Checksum 0x465306b, Offset: 0xf20
// Size: 0x1c4
function ramp_in_out_thread_per_player_internal(player, ramp_in, full_period, ramp_out) {
    start_time = gettime();
    end_time = start_time + int(ramp_in * 1000);
    while (true) {
        lerp = calc_ramp_in_lerp(start_time, end_time);
        if (1 <= lerp) {
            break;
        }
        self set_state_active(player, lerp);
        waitframe(1);
    }
    self set_state_active(player, lerp);
    if (isfunctionptr(full_period)) {
        player [[ full_period ]]();
    } else {
        wait full_period;
    }
    start_time = gettime();
    end_time = start_time + int(ramp_out * 1000);
    while (true) {
        lerp = calc_remaining_duration_lerp(start_time, end_time);
        if (0 >= lerp) {
            break;
        }
        self set_state_active(player, lerp);
        waitframe(1);
    }
    deactivate_per_player(self.type, self.name, player);
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xc88f800, Offset: 0x10f0
// Size: 0x9c
function ramp_in_out_thread_watch_player_shutdown(player) {
    player notify(#"ramp_in_out_thread_watch_player_shutdown");
    player endon(#"ramp_in_out_thread_watch_player_shutdown", #"disconnect");
    player waittill(#"death");
    if (player isremotecontrolling() == 0) {
        deactivate_per_player(self.type, self.name, player);
    }
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 4, eflags: 0x1 linked
// Checksum 0x765da885, Offset: 0x1198
// Size: 0x6c
function ramp_in_out_thread_per_player_death_shutdown(player, ramp_in, full_period, ramp_out) {
    player endon(#"death");
    thread ramp_in_out_thread_watch_player_shutdown(player);
    ramp_in_out_thread_per_player_internal(player, ramp_in, full_period, ramp_out);
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 4, eflags: 0x1 linked
// Checksum 0xc0dd826f, Offset: 0x1210
// Size: 0x44
function ramp_in_out_thread_per_player(player, ramp_in, full_period, ramp_out) {
    ramp_in_out_thread_per_player_internal(player, ramp_in, full_period, ramp_out);
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x37f3c4c1, Offset: 0x1260
// Size: 0x154
function register_type(type) {
    level.vsmgr[type] = spawnstruct();
    level.vsmgr[type].type = type;
    level.vsmgr[type].in_use = 0;
    level.vsmgr[type].highest_version = 0;
    level.vsmgr[type].cf_slot_name = type + "_slot";
    level.vsmgr[type].cf_lerp_name = type + "_lerp";
    level.vsmgr[type].info = [];
    level.vsmgr[type].sorted_name_keys = [];
    level.vsmgr[type].sorted_prio_keys = [];
    register_info(type, level.vsmgr_default_info_name, 1, 0, 1, 0, undefined);
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x6b722888, Offset: 0x13c0
// Size: 0x8e
function finalize_clientfields() {
    foreach (v in level.vsmgr) {
        v thread finalize_type_clientfields();
    }
    level.vsmgr_initializing = 0;
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x6081ab67, Offset: 0x1458
// Size: 0x23c
function finalize_type_clientfields() {
    println("<dev string:xaf>" + self.type + "<dev string:xc1>");
    if (1 >= self.info.size) {
        return;
    }
    self.in_use = 1;
    self.cf_slot_bit_count = getminbitcountfornum(self.info.size - 1);
    self.cf_lerp_bit_count = self.info[self.sorted_name_keys[0]].lerp_bit_count;
    for (i = 0; i < self.sorted_name_keys.size; i++) {
        self.info[self.sorted_name_keys[i]].slot_index = i;
        if (self.info[self.sorted_name_keys[i]].lerp_bit_count > self.cf_lerp_bit_count) {
            self.cf_lerp_bit_count = self.info[self.sorted_name_keys[i]].lerp_bit_count;
        }
        println("<dev string:xdb>" + self.info[self.sorted_name_keys[i]].name + "<dev string:xe8>" + self.info[self.sorted_name_keys[i]].version + "<dev string:xf6>" + self.info[self.sorted_name_keys[i]].lerp_step_count + "<dev string:x10c>");
    }
    clientfield::register("toplayer", self.cf_slot_name, self.highest_version, self.cf_slot_bit_count, "int");
    if (1 < self.cf_lerp_bit_count) {
        clientfield::register("toplayer", self.cf_lerp_name, self.highest_version, self.cf_lerp_bit_count, "float");
    }
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 3, eflags: 0x1 linked
// Checksum 0xe3aa3d31, Offset: 0x16a0
// Size: 0x1e0
function validate_info(type, name, priority) {
    keys = getarraykeys(level.vsmgr);
    for (i = 0; i < keys.size; i++) {
        if (type == keys[i]) {
            break;
        }
    }
    assert(i < keys.size, "<dev string:x10f>" + type + "<dev string:x12a>");
    foreach (v in level.vsmgr[type].info) {
        assert(v.name != name, "<dev string:x138>" + type + "<dev string:x155>" + name + "<dev string:x161>");
        assert(v.priority != priority, "<dev string:x138>" + type + "<dev string:x184>" + priority + "<dev string:x194>" + name + "<dev string:x1ad>" + v.name + "<dev string:x1dd>");
    }
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x27e7e24e, Offset: 0x1888
// Size: 0x9c
function add_sorted_name_key(type, name) {
    for (i = 0; i < level.vsmgr[type].sorted_name_keys.size; i++) {
        if (name < level.vsmgr[type].sorted_name_keys[i]) {
            break;
        }
    }
    arrayinsert(level.vsmgr[type].sorted_name_keys, name, i);
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 3, eflags: 0x1 linked
// Checksum 0xb389820e, Offset: 0x1930
// Size: 0xc4
function add_sorted_priority_key(type, name, priority) {
    for (i = 0; i < level.vsmgr[type].sorted_prio_keys.size; i++) {
        if (priority > level.vsmgr[type].info[level.vsmgr[type].sorted_prio_keys[i]].priority) {
            break;
        }
    }
    arrayinsert(level.vsmgr[type].sorted_prio_keys, name, i);
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 8, eflags: 0x1 linked
// Checksum 0xa4cf9ff7, Offset: 0x1a00
// Size: 0x15a
function add_info(type, name, version, priority, lerp_step_count, should_activate_per_player, lerp_thread, ref_count_lerp_thread) {
    self.type = type;
    self.name = name;
    self.version = version;
    self.priority = priority;
    self.lerp_step_count = lerp_step_count;
    self.lerp_bit_count = getminbitcountfornum(lerp_step_count);
    if (!isdefined(ref_count_lerp_thread)) {
        ref_count_lerp_thread = 0;
    }
    self.state = spawnstruct();
    self.state.type = type;
    self.state.name = name;
    self.state.should_activate_per_player = should_activate_per_player;
    self.state.lerp_thread = lerp_thread;
    self.state.ref_count_lerp_thread = ref_count_lerp_thread;
    self.state.players = [];
    if (ref_count_lerp_thread && !should_activate_per_player) {
        self.state.ref_count = 0;
    }
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x1af86982, Offset: 0x1b68
// Size: 0x1c
function on_player_connect() {
    self player_setup();
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x88eb180b, Offset: 0x1b90
// Size: 0x238
function player_setup() {
    self.vsmgr_player_entnum = self getentitynumber();
    foreach (v in level.vsmgr) {
        if (!v.in_use) {
            continue;
        }
        for (name_index = 0; name_index < v.sorted_name_keys.size; name_index++) {
            name_key = v.sorted_name_keys[name_index];
            v.info[name_key].state.players[self.vsmgr_player_entnum] = spawnstruct();
            v.info[name_key].state.players[self.vsmgr_player_entnum].active = 0;
            v.info[name_key].state.players[self.vsmgr_player_entnum].lerp = 0;
            if (v.info[name_key].state.ref_count_lerp_thread && v.info[name_key].state.should_activate_per_player) {
                v.info[name_key].state.players[self.vsmgr_player_entnum].ref_count = 0;
            }
        }
        v.info[level.vsmgr_default_info_name].state set_state_active(self, 1);
    }
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x784236bd, Offset: 0x1dd0
// Size: 0x11c
function player_shutdown() {
    self.vsmgr_player_entnum = self getentitynumber();
    foreach (k, v in level.vsmgr) {
        if (!v.in_use) {
            continue;
        }
        foreach (name_key in v.sorted_name_keys) {
            deactivate_per_player(k, name_key, self);
        }
    }
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xdbdcf27a, Offset: 0x1ef8
// Size: 0x188
function monitor() {
    self notify("48907f6028d1eaca");
    self endon("48907f6028d1eaca");
    while (level.vsmgr_initializing) {
        waitframe(1);
    }
    while (true) {
        waitframe(1);
        waittillframeend();
        profilestart();
        foreach (player in level.var_7506365) {
            if (isdefined(player) && isplayer(player) && isalive(player)) {
                foreach (v in level.vsmgr) {
                    if (!v.in_use) {
                        continue;
                    }
                    update_clientfields(player, v);
                }
            }
        }
        level.var_7506365 = [];
        profilestop();
    }
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x83a128ec, Offset: 0x2088
// Size: 0xc2
function get_first_active_name(type_struct) {
    size = type_struct.sorted_prio_keys.size;
    for (prio_index = 0; prio_index < size; prio_index++) {
        prio_key = type_struct.sorted_prio_keys[prio_index];
        if (!isdefined(prio_key)) {
            continue;
        }
        if (isdefined(self.vsmgr_player_entnum) && type_struct.info[prio_key].state.players[self.vsmgr_player_entnum].active) {
            return prio_key;
        }
    }
    return level.vsmgr_default_info_name;
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x5b7b0d97, Offset: 0x2158
// Size: 0x10c
function update_clientfields(player, type_struct) {
    if (!isdefined(player)) {
        return;
    }
    name = player get_first_active_name(type_struct);
    player clientfield::set_to_player(type_struct.cf_slot_name, type_struct.info[name].slot_index);
    if (1 < type_struct.cf_lerp_bit_count) {
        if (!isdefined(player.vsmgr_player_entnum)) {
            player.vsmgr_player_entnum = player getentitynumber();
        }
        player clientfield::set_to_player(type_struct.cf_lerp_name, type_struct.info[name].state.players[player.vsmgr_player_entnum].lerp);
    }
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 4, eflags: 0x1 linked
// Checksum 0xa9df945, Offset: 0x2270
// Size: 0x60
function lerp_thread_wrapper(func, opt_param_1, opt_param_2, opt_param_3) {
    self notify(#"visionset_mgr_deactivate_all");
    self endon(#"visionset_mgr_deactivate_all");
    self [[ func ]](opt_param_1, opt_param_2, opt_param_3);
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 5, eflags: 0x1 linked
// Checksum 0xc005aa28, Offset: 0x22d8
// Size: 0xc6
function lerp_thread_per_player_wrapper(func, player, opt_param_1, opt_param_2, opt_param_3) {
    if (!isdefined(player)) {
        return;
    }
    player_entnum = player getentitynumber();
    self.players[player_entnum] notify(#"visionset_mgr_deactivate");
    self.players[player_entnum] endon(#"visionset_mgr_deactivate");
    player endon(#"disconnect");
    self [[ func ]](player, opt_param_1, opt_param_2, opt_param_3);
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 6, eflags: 0x1 linked
// Checksum 0x3d2825b1, Offset: 0x23a8
// Size: 0x134
function activate_per_player(type, name, player, opt_param_1, opt_param_2, opt_param_3) {
    if (!isdefined(player)) {
        return;
    }
    player_entnum = player getentitynumber();
    state = level.vsmgr[type].info[name].state;
    if (state.ref_count_lerp_thread) {
        state.players[player_entnum].ref_count++;
        if (1 < state.players[player_entnum].ref_count) {
            return;
        }
    }
    if (isdefined(state.lerp_thread)) {
        state thread lerp_thread_per_player_wrapper(state.lerp_thread, player, opt_param_1, opt_param_2, opt_param_3);
        return;
    }
    state set_state_active(player, 1);
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x6401c396, Offset: 0x24e8
// Size: 0x10e
function deactivate_per_player(type, name, player) {
    if (!isdefined(player)) {
        return;
    }
    player_entnum = player getentitynumber();
    state = level.vsmgr[type].info[name].state;
    if (state.players.size > 0) {
        if (state.ref_count_lerp_thread) {
            state.players[player_entnum].ref_count--;
            if (0 < state.players[player_entnum].ref_count) {
                return;
            }
        }
        state set_state_inactive(player);
        state.players[player_entnum] notify(#"visionset_mgr_deactivate");
    }
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x602ccc8b, Offset: 0x2600
// Size: 0x92
function calc_ramp_in_lerp(start_time, end_time) {
    if (0 >= end_time - start_time) {
        return 1;
    }
    now = gettime();
    frac = float(now - start_time) / float(end_time - start_time);
    return math::clamp(frac, 0, 1);
}

// Namespace visionset_mgr/visionset_mgr_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xb036ec0d, Offset: 0x26a0
// Size: 0x92
function calc_remaining_duration_lerp(start_time, end_time) {
    if (0 >= end_time - start_time) {
        return 0;
    }
    now = gettime();
    frac = float(end_time - now) / float(end_time - start_time);
    return math::clamp(frac, 0, 1);
}

