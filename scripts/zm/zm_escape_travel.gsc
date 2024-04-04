// Atian COD Tools GSC decompiler test
#using scripts\zm\zm_escape_util.gsc;
#using scripts\zm_common\trials\zm_trial_door_lockdown.gsc;
#using scripts\zm_common\util.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\ai\zm_ai_utility.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace zm_escape_travel;

// Namespace zm_escape_travel/zm_escape_travel
// Params 0, eflags: 0x1 linked
// Checksum 0x8575f0c7, Offset: 0x558
// Size: 0x784
function init_alcatraz_zipline() {
    level thread gondola_hostmigration();
    level.player_intersection_tracker_override = &zombie_alcatraz_player_intersection_tracker_override;
    level.var_fed9dc06 = 0;
    level flag::init("gondola_at_roof");
    level flag::init("gondola_at_docks");
    level flag::init("gondola_doors_moving");
    level flag::init("gondola_in_motion");
    level flag::init("gondola_initialized");
    e_gondola = getent("zipline_gondola", "targetname");
    e_gondola setmovingplatformenabled(1);
    e_gondola.takedamage = 0;
    level.e_gondola = e_gondola;
    e_gondola.location = "roof";
    e_gondola.destination = undefined;
    level.e_gondola.t_ride = getent("gondola_ride_trigger", "targetname");
    level.e_gondola.t_ride enablelinkto();
    level.e_gondola.t_ride linkto(e_gondola);
    var_57ba058f = getentarray("gondola_call_trigger", "targetname");
    foreach (trigger in var_57ba058f) {
        trigger sethintstring(#"hash_ebd3d1458a3b46e");
    }
    function_815e3997();
    a_gondola_doors = getentarray("gondola_doors", "targetname");
    foreach (mdl_door in a_gondola_doors) {
        mdl_door linkto(e_gondola);
        e_gondola establish_gondola_door_definition(mdl_door);
    }
    a_gondola_gates = getentarray("gondola_gates", "targetname");
    foreach (mdl_gate in a_gondola_gates) {
        mdl_gate linkto(e_gondola);
        e_gondola establish_gondola_gate_definition(mdl_gate);
    }
    a_gondola_landing_doors = getentarray("gondola_landing_doors", "targetname");
    foreach (mdl_door in a_gondola_landing_doors) {
        e_gondola establish_gondola_landing_door_definition(mdl_door);
    }
    a_gondola_landing_gates = getentarray("gondola_landing_gates", "targetname");
    foreach (mdl_gate in a_gondola_landing_gates) {
        e_gondola establish_gondola_landing_gate_definition(mdl_gate);
    }
    gondola_lights_red();
    level flag::wait_till("power_on1");
    level flag::set(#"hash_107c5504e3325022");
    var_ba1d5d90 = getentarray("gondola_powered_on", "script_string");
    foreach (var_751f2904 in var_ba1d5d90) {
        var_751f2904 notify(#"blast_attack");
    }
    level flag::set("gondola_at_roof");
    e_gondola gondola_doors_move("roof", 1);
    level flag::set("gondola_initialized");
    gondola_lights_green();
    e_gondola clientfield::set("" + #"gondola_light", 1);
    level.var_b9656485 = 0;
    level.var_cf10ac23 = 0;
    level.var_b5f05d46 = 0;
    var_9ce0aba1 = getentarray("gondola_move_trigger", "targetname");
    array::thread_all(var_9ce0aba1, &zipline_move_trigger_think);
    array::thread_all(var_57ba058f, &zipline_call_trigger_think);
}

// Namespace zm_escape_travel/zm_escape_travel
// Params 0, eflags: 0x1 linked
// Checksum 0x65ecf2db, Offset: 0xce8
// Size: 0x140
function function_815e3997() {
    var_9ce0aba1 = getentarray("gondola_move_trigger", "targetname");
    foreach (trigger in var_9ce0aba1) {
        if (zm_utility::is_standard()) {
            if (function_8b1a219a()) {
                trigger sethintstring(#"hash_23ae833352769f3a");
            } else {
                trigger sethintstring(#"hash_675cfe2c548c034e");
            }
        } else {
            trigger sethintstring(#"hash_c0173e448a7253f", 750);
        }
        trigger setinvisibletoall();
    }
}

// Namespace zm_escape_travel/zm_escape_travel
// Params 0, eflags: 0x1 linked
// Checksum 0x7dcc3f47, Offset: 0xe30
// Size: 0x304
function gondola_hostmigration() {
    level endon(#"end_game");
    self notify("68c71342bd0612a7");
    self endon("68c71342bd0612a7");
    while (true) {
        level waittill(#"host_migration_begin");
        a_players = getplayers();
        foreach (player in a_players) {
            player val::set("host_migration", "allowdeath", 0);
            player val::set("host_migration", "takedamage", 0);
        }
        level waittill(#"host_migration_end");
        wait(0.5);
        if (!(isdefined(level.e_gondola.is_moving) && level.e_gondola.is_moving)) {
            if (level.e_gondola.location == "roof") {
                var_cd3296d7 = getnode("nd_on_top_r", "targetname");
                if (isdefined(var_cd3296d7)) {
                    linktraversal(var_cd3296d7);
                }
            } else {
                var_fd05c6f4 = getnode("nd_on_bottom_r", "targetname");
                if (isdefined(var_fd05c6f4)) {
                    linktraversal(var_fd05c6f4);
                }
            }
        }
        function_815e3997();
        wait(1);
        player_escaped_gondola_failsafe();
        wait(5);
        a_players = getplayers();
        foreach (player in a_players) {
            player val::reset("host_migration", "allowdeath");
            player val::reset("host_migration", "takedamage");
        }
    }
}

// Namespace zm_escape_travel/zm_escape_travel
// Params 0, eflags: 0x0
// Checksum 0x151887a1, Offset: 0x1140
// Size: 0xe4
function link_player_to_gondola() {
    if (self function_9a8ab327() && isplayer(self)) {
        self endon(#"disconnect", #"death");
        e_origin = util::spawn_model("tag_origin", self.origin, self.angles);
        level.var_ee9168a2[level.var_ee9168a2.size] = e_origin;
        e_origin linkto(level.e_gondola);
        self playerlinkto(e_origin);
    }
}

// Namespace zm_escape_travel/zm_escape_travel
// Params 0, eflags: 0x1 linked
// Checksum 0xfbeaa0a9, Offset: 0x1230
// Size: 0xa0
function function_9a8ab327() {
    if (isplayer(self) || isactor(self)) {
        if (isdefined(level.e_gondola) && isdefined(level.e_gondola.t_ride) && self istouching(level.e_gondola.t_ride)) {
            return true;
        } else {
            return false;
        }
    }
    return false;
}

// Namespace zm_escape_travel/zm_escape_travel
// Params 1, eflags: 0x1 linked
// Checksum 0x8484122, Offset: 0x12d8
// Size: 0xf6
function zombie_alcatraz_player_intersection_tracker_override(other_player) {
    if (isdefined(self.afterlife_revived) && self.afterlife_revived || isdefined(other_player.afterlife_revived) && other_player.afterlife_revived) {
        return true;
    }
    if (isdefined(self.is_on_gondola) && self.is_on_gondola && isdefined(level.e_gondola.is_moving) && level.e_gondola.is_moving) {
        return true;
    }
    if (isdefined(other_player.is_on_gondola) && other_player.is_on_gondola && isdefined(level.e_gondola.is_moving) && level.e_gondola.is_moving) {
        return true;
    }
    return false;
}

// Namespace zm_escape_travel/zm_escape_travel
// Params 1, eflags: 0x1 linked
// Checksum 0xcf43fabc, Offset: 0x13d8
// Size: 0xda
function establish_gondola_door_definition(mdl_door) {
    mdl_door setmovingplatformenabled(1, 0);
    str_identifier = mdl_door.script_noteworthy;
    switch (str_identifier) {
    case #"roof left":
        self.door_roof_left = mdl_door;
        break;
    case #"roof right":
        self.door_roof_right = mdl_door;
        break;
    case #"docks left":
        self.door_docks_left = mdl_door;
        break;
    case #"docks right":
        self.door_docks_right = mdl_door;
        break;
    }
}

// Namespace zm_escape_travel/zm_escape_travel
// Params 1, eflags: 0x1 linked
// Checksum 0xd2e4b78a, Offset: 0x14c0
// Size: 0xda
function establish_gondola_gate_definition(mdl_gate) {
    mdl_gate setmovingplatformenabled(1, 0);
    str_identifier = mdl_gate.script_noteworthy;
    switch (str_identifier) {
    case #"roof left":
        self.gate_roof_left = mdl_gate;
        break;
    case #"roof right":
        self.gate_roof_right = mdl_gate;
        break;
    case #"docks left":
        self.gate_docks_left = mdl_gate;
        break;
    case #"docks right":
        self.gate_docks_right = mdl_gate;
        break;
    }
}

// Namespace zm_escape_travel/zm_escape_travel
// Params 1, eflags: 0x1 linked
// Checksum 0xebe0f0c5, Offset: 0x15a8
// Size: 0xba
function establish_gondola_landing_door_definition(mdl_door) {
    str_identifier = mdl_door.script_noteworthy;
    switch (str_identifier) {
    case #"roof left":
        self.landing_door_roof_left = mdl_door;
        break;
    case #"roof right":
        self.landing_door_roof_right = mdl_door;
        break;
    case #"docks left":
        self.landing_door_docks_left = mdl_door;
        break;
    case #"docks right":
        self.landing_door_docks_right = mdl_door;
        break;
    }
}

// Namespace zm_escape_travel/zm_escape_travel
// Params 1, eflags: 0x1 linked
// Checksum 0x5b06dd61, Offset: 0x1670
// Size: 0xba
function establish_gondola_landing_gate_definition(mdl_gate) {
    str_identifier = mdl_gate.script_noteworthy;
    switch (str_identifier) {
    case #"roof left":
        self.landing_gate_roof_left = mdl_gate;
        break;
    case #"roof right":
        self.landing_gate_roof_right = mdl_gate;
        break;
    case #"docks left":
        self.landing_gate_docks_left = mdl_gate;
        break;
    case #"docks right":
        self.landing_gate_docks_right = mdl_gate;
        break;
    }
}

// Namespace zm_escape_travel/zm_escape_travel
// Params 2, eflags: 0x1 linked
// Checksum 0x53216cb, Offset: 0x1738
// Size: 0x4c8
function gondola_doors_move(str_side, n_state) {
    if (str_side == "roof") {
        mdl_door_left = self.door_roof_left;
        var_d134f0d1 = self.gate_roof_left;
        mdl_door_right = self.door_roof_right;
        var_b82242be = self.gate_roof_right;
        var_b3c73561 = self.landing_door_roof_left;
        var_8bd1eeb0 = self.landing_gate_roof_left;
        var_1c80ffe2 = self.landing_door_roof_right;
        var_b0f06f50 = self.landing_gate_roof_right;
        n_side_modifier = 1;
    } else if (str_side == "docks") {
        mdl_door_left = self.door_docks_left;
        var_d134f0d1 = self.gate_docks_left;
        mdl_door_right = self.door_docks_right;
        var_b82242be = self.gate_docks_right;
        var_b3c73561 = self.landing_door_docks_left;
        var_8bd1eeb0 = self.landing_gate_docks_left;
        var_1c80ffe2 = self.landing_door_docks_right;
        var_b0f06f50 = self.landing_gate_docks_right;
        n_side_modifier = -1;
    }
    a_doors_and_gates = [];
    a_doors_and_gates[0] = mdl_door_left;
    a_doors_and_gates[1] = var_d134f0d1;
    a_doors_and_gates[2] = mdl_door_right;
    a_doors_and_gates[3] = var_b82242be;
    foreach (mdl_model in a_doors_and_gates) {
        mdl_model unlink();
    }
    if (n_state == 1) {
        mdl_door_left playsound(#"hash_717283b43ea8d0a4");
        gondola_gate_moves(n_state, n_side_modifier, var_d134f0d1, var_b82242be, var_8bd1eeb0, var_b0f06f50);
        gondola_gate_and_door_moves(n_state, n_side_modifier, var_d134f0d1, mdl_door_left, var_b82242be, mdl_door_right, var_8bd1eeb0, var_b3c73561, var_b0f06f50, var_1c80ffe2);
        if (n_side_modifier == 1) {
            var_cd3296d7 = getnode("nd_on_top_r", "targetname");
            if (isdefined(var_cd3296d7)) {
                linktraversal(var_cd3296d7);
            }
        } else {
            var_fd05c6f4 = getnode("nd_on_bottom_r", "targetname");
            if (isdefined(var_fd05c6f4)) {
                linktraversal(var_fd05c6f4);
            }
        }
    } else {
        if (n_side_modifier == 1) {
            var_cd3296d7 = getnode("nd_on_top_r", "targetname");
            if (isdefined(var_cd3296d7)) {
                unlinktraversal(var_cd3296d7);
            }
        } else {
            var_fd05c6f4 = getnode("nd_on_bottom_r", "targetname");
            if (isdefined(var_fd05c6f4)) {
                unlinktraversal(var_fd05c6f4);
            }
        }
        mdl_door_left playsound(#"hash_ac1fa6f62462ed8");
        gondola_gate_and_door_moves(n_state, n_side_modifier, var_d134f0d1, mdl_door_left, var_b82242be, mdl_door_right, var_8bd1eeb0, var_b3c73561, var_b0f06f50, var_1c80ffe2);
        gondola_gate_moves(n_state, n_side_modifier, var_d134f0d1, var_b82242be, var_8bd1eeb0, var_b0f06f50);
    }
    foreach (mdl_model in a_doors_and_gates) {
        mdl_model linkto(self);
    }
}

// Namespace zm_escape_travel/zm_escape_travel
// Params 6, eflags: 0x1 linked
// Checksum 0xcc30d53c, Offset: 0x1c08
// Size: 0x1bc
function gondola_gate_moves(n_state, n_side_modifier, var_d134f0d1, var_b82242be, var_8bd1eeb0, var_b0f06f50) {
    var_d134f0d1 moveto(var_d134f0d1.origin + (22.5 * n_side_modifier * n_state, 0, 0), 0.5, 0.05, 0.05);
    var_b82242be moveto(var_b82242be.origin + (22.5 * n_side_modifier * n_state * -1, 0, 0), 0.5, 0.05, 0.05);
    var_8bd1eeb0 moveto(var_8bd1eeb0.origin + (22.5 * n_side_modifier * n_state, 0, 0), 0.5, 0.05, 0.05);
    var_b0f06f50 moveto(var_b0f06f50.origin + (22.5 * n_side_modifier * n_state * -1, 0, 0), 0.5, 0.05, 0.05);
    var_b82242be waittill(#"movedone");
}

// Namespace zm_escape_travel/zm_escape_travel
// Params 10, eflags: 0x1 linked
// Checksum 0x92073941, Offset: 0x1dd0
// Size: 0x30c
function gondola_gate_and_door_moves(n_state, n_side_modifier, var_d134f0d1, mdl_door_left, var_b82242be, mdl_door_right, var_8bd1eeb0, var_b3c73561, var_b0f06f50, var_1c80ffe2) {
    mdl_door_left moveto(mdl_door_left.origin + (24 * n_side_modifier * n_state, 0, 0), 0.5, 0.05, 0.05);
    var_d134f0d1 moveto(var_d134f0d1.origin + (24 * n_side_modifier * n_state, 0, 0), 0.5, 0.05, 0.05);
    mdl_door_right moveto(mdl_door_right.origin + (24 * n_side_modifier * n_state * -1, 0, 0), 0.5, 0.05, 0.05);
    var_b82242be moveto(var_b82242be.origin + (24 * n_side_modifier * n_state * -1, 0, 0), 0.5, 0.05, 0.05);
    var_b3c73561 moveto(var_b3c73561.origin + (24 * n_side_modifier * n_state, 0, 0), 0.5, 0.05, 0.05);
    var_8bd1eeb0 moveto(var_8bd1eeb0.origin + (24 * n_side_modifier * n_state, 0, 0), 0.5, 0.05, 0.05);
    var_1c80ffe2 moveto(var_1c80ffe2.origin + (24 * n_side_modifier * n_state * -1, 0, 0), 0.5, 0.05, 0.05);
    var_b0f06f50 moveto(var_b0f06f50.origin + (24 * n_side_modifier * n_state * -1, 0, 0), 0.5, 0.05, 0.05);
    var_b82242be waittill(#"movedone");
}

// Namespace zm_escape_travel/zm_escape_travel
// Params 0, eflags: 0x1 linked
// Checksum 0xf7d50c3d, Offset: 0x20e8
// Size: 0x3ce
function zipline_move_trigger_think() {
    level endon("interrupt_gondola_move_trigger_" + self.script_string);
    self.cost = 750;
    self.in_use = 0;
    self.is_available = 1;
    self setcursorhint("HINT_NOICON");
    while (true) {
        level flag::wait_till("gondola_at_" + self.script_string);
        self setvisibletoall();
        s_result = self waittill(#"trigger");
        e_who = s_result.activator;
        b_forced = s_result.b_forced;
        level.var_105462b6 = e_who;
        level thread gondola_moving_vo();
        if (!(isdefined(b_forced) && b_forced) && e_who zm_utility::in_revive_trigger()) {
            continue;
        }
        if (!isdefined(self.is_available)) {
            continue;
        }
        if (zm_trial_door_lockdown::is_active()) {
            continue;
        }
        if (isdefined(b_forced) && b_forced || zm_utility::is_player_valid(e_who) && e_who zm_score::can_player_purchase(self.cost)) {
            if (!self.in_use) {
                self.in_use = 1;
                self.is_available = undefined;
                self setinvisibletoall();
                if (isdefined(e_who)) {
                    zm_utility::play_sound_at_pos("purchase", e_who.origin);
                    e_who zm_score::minus_to_player_score(self.cost);
                }
                if (self.script_string == "roof") {
                    level notify(#"interrupt_gondola_call_trigger_docks");
                    str_loc = "docks";
                } else if (self.script_string == "docks") {
                    level notify(#"interrupt_gondola_call_trigger_roof");
                    str_loc = "roof";
                }
                a_t_trig = getentarray("gondola_call_trigger", "targetname");
                foreach (trigger in a_t_trig) {
                    if (trigger.script_string == str_loc) {
                        t_opposite_call_trigger = trigger;
                        break;
                    }
                }
                move_gondola();
                t_opposite_call_trigger thread zipline_call_trigger_think();
                t_opposite_call_trigger playsound(#"zmb_trap_available");
                self.in_use = 0;
                self.is_available = 1;
            }
        }
    }
}

// Namespace zm_escape_travel/zm_escape_travel
// Params 0, eflags: 0x1 linked
// Checksum 0xf04e1415, Offset: 0x24c0
// Size: 0x43e
function zipline_call_trigger_think() {
    level endon("interrupt_gondola_call_trigger_" + self.script_string);
    self.cost = 0;
    self.in_use = 0;
    self.is_available = 1;
    self setcursorhint("HINT_NOICON");
    e_gondola = level.e_gondola;
    if (self.script_string == "roof") {
        str_gondola_loc = "docks";
    } else if (self.script_string == "docks") {
        str_gondola_loc = "roof";
    }
    while (true) {
        self sethintstring("");
        level flag::wait_till("gondola_at_" + str_gondola_loc);
        self notify(#"available");
        if (function_8b1a219a()) {
            self sethintstring(#"hash_23dad9a3f61cf052");
        } else {
            self sethintstring(#"hash_bbb24669638bc76");
        }
        s_result = self waittill(#"trigger");
        e_who = s_result.activator;
        b_forced = s_result.b_forced;
        level.var_105462b6 = e_who;
        if (!(isdefined(b_forced) && b_forced) && e_who zm_utility::in_revive_trigger()) {
            continue;
        }
        if (!isdefined(self.is_available)) {
            continue;
        }
        if (zm_trial_door_lockdown::is_active()) {
            continue;
        }
        if (isdefined(b_forced) && b_forced || zm_utility::is_player_valid(e_who)) {
            if (!self.in_use) {
                self.in_use = 1;
                if (self.script_string == "roof") {
                    level notify(#"interrupt_gondola_move_trigger_docks");
                    str_loc = "docks";
                } else if (self.script_string == "docks") {
                    level notify(#"interrupt_gondola_move_trigger_roof");
                    str_loc = "roof";
                }
                a_t_trig = getentarray("gondola_move_trigger", "targetname");
                foreach (trigger in a_t_trig) {
                    if (trigger.script_string == str_loc) {
                        t_opposite_move_trigger = trigger;
                        t_opposite_move_trigger setinvisibletoall();
                        break;
                    }
                }
                self playsound(#"zmb_trap_activate");
                move_gondola();
                t_opposite_move_trigger thread zipline_move_trigger_think();
                self.in_use = 0;
                self playsound(#"zmb_trap_available");
                self.is_available = 1;
            }
        }
    }
}

// Namespace zm_escape_travel/zm_escape_travel
// Params 1, eflags: 0x1 linked
// Checksum 0xac094cf6, Offset: 0x2908
// Size: 0xc8c
function move_gondola(b_suppress_doors_close = 0) {
    gondola_lights_red();
    a_t_call = getentarray("gondola_call_trigger", "targetname");
    foreach (trigger in a_t_call) {
        trigger sethintstring(#"hash_1923fe59e50dfb0e");
    }
    e_gondola = level.e_gondola;
    t_ride = level.e_gondola.t_ride;
    e_gondola.is_moving = 1;
    if (e_gondola.location == "roof") {
        var_d2f6931b = getvehiclenode("roof_gondola_start", "targetname");
        e_gondola.destination = "docks";
        level thread function_c64e4079();
    } else if (e_gondola.location == "docks") {
        var_d2f6931b = getvehiclenode("docks_gondola_start", "targetname");
        e_gondola.destination = "roof";
        level thread function_565994f0();
    }
    if (level flag::get("gondola_initialized")) {
        level flag::set("gondola_roof_to_dock");
        level flag::set("gondola_dock_to_roof");
        level flag::set("gondola_ride_zone_enabled");
        zm_zonemgr::enable_zone("zone_cellblock_west");
        zm_zonemgr::enable_zone("zone_broadway_floor_2");
        zm_zonemgr::enable_zone("zone_cellblock_west_barber");
        zm_zonemgr::enable_zone("zone_cellblock_west_warden");
        zm_zonemgr::enable_zone("zone_cellblock_east");
    }
    level flag::clear("gondola_at_" + e_gondola.location);
    a_players = getplayers();
    foreach (player in a_players) {
        if (player function_9a8ab327()) {
            zm_ai_utility::function_991333ce(player);
        }
    }
    if (!(isdefined(b_suppress_doors_close) && b_suppress_doors_close)) {
        level flag::set("gondola_doors_moving");
        e_gondola gondola_doors_move(e_gondola.location, -1);
    }
    level notify(#"gondola_moving");
    check_when_gondola_moves_if_groundent_is_undefined(e_gondola);
    level flag::clear("gondola_doors_moving");
    a_players = getplayers();
    foreach (player in a_players) {
        if (player function_9a8ab327()) {
            player clientfield::set_to_player("" + #"rumble_gondola", 1);
            player.is_on_gondola = 1;
        }
    }
    a_e_brutus = getaiarchetypearray(#"brutus");
    foreach (e_brutus in a_e_brutus) {
        if (e_brutus function_9a8ab327()) {
            e_brutus.var_db8b3627 = 1;
            e_brutus.var_eebea220 = 1;
            var_ea2a6729 = 1;
        }
    }
    if (isdefined(level.ai[#"axis"])) {
        foreach (e_enemy in level.ai[#"axis"]) {
            if (e_enemy function_9a8ab327()) {
                e_enemy.no_powerups = 1;
            }
        }
    }
    e_gondola thread create_gondola_poi();
    playsoundatposition(#"hash_7039f3801f51d75e", (878, 5659, 327));
    level util::clientnotify("gondola_cable_wheels");
    e_gondola playsound(#"zmb_gondola_start");
    e_gondola playloopsound(#"zmb_gondola_lp", 1);
    e_gondola thread gondola_physics_explosion(10);
    level flag::set("gondola_in_motion");
    e_gondola thread function_de1be51e();
    exploder::exploder("fxexp_gondola_moving");
    e_gondola vehicle::get_on_and_go_path(var_d2f6931b);
    e_gondola waittill(#"reached_end_node");
    level flag::clear("gondola_in_motion");
    exploder::stop_exploder("fxexp_gondola_moving");
    a_e_brutus = getaiarchetypearray(#"brutus");
    foreach (e_brutus in a_e_brutus) {
        if (e_brutus function_9a8ab327()) {
            e_brutus.var_db8b3627 = 0;
            e_brutus.var_eebea220 = undefined;
            var_c78c773f = 1;
        }
    }
    if (isdefined(var_ea2a6729) && var_ea2a6729 && isdefined(var_c78c773f) && var_c78c773f) {
        foreach (e_player in level.players) {
            if (isalive(e_player) && e_player function_9a8ab327()) {
                e_player notify(#"hash_7af72088379d7ac6");
            }
        }
    }
    e_gondola stoploopsound(0.5);
    level util::clientnotify("gondola_cable_wheels");
    e_gondola thread function_d8e07db3();
    e_gondola playsound(#"zmb_gondola_stop");
    playsoundatposition(#"hash_46431e99e4f9f9e6", (878, 5659, 327));
    player_escaped_gondola_failsafe();
    a_players = getplayers();
    foreach (player in a_players) {
        if (isdefined(player.is_on_gondola) && player.is_on_gondola) {
            player clientfield::set_to_player("" + #"rumble_gondola", 0);
            player.is_on_gondola = undefined;
        }
    }
    level flag::set("gondola_doors_moving");
    e_gondola gondola_doors_move(e_gondola.destination, 1);
    e_gondola.is_moving = 0;
    e_gondola thread tear_down_gondola_poi();
    level flag::clear("gondola_doors_moving");
    wait(1);
    if (e_gondola.location == "roof") {
        e_gondola.location = "docks";
        str_zone = "zone_dock_gondola";
    } else if (e_gondola.location == "docks") {
        e_gondola.location = "roof";
        str_zone = "zone_cellblock_west_gondola_dock";
    }
    level notify(#"gondola_arrived", str_zone);
    gondola_cooldown();
    level flag::set("gondola_at_" + e_gondola.location);
}

// Namespace zm_escape_travel/zm_escape_travel
// Params 0, eflags: 0x1 linked
// Checksum 0xa5489b2e, Offset: 0x35a0
// Size: 0x10c
function gondola_lights_red() {
    var_1d558ef4 = getentarray("gondola_state_light", "targetname");
    foreach (model in var_1d558ef4) {
        model setmodel(#"p8_zm_esc_gondola_frame_light_red");
        playsoundatposition(#"hash_6e8a64e3abaab719", model.origin);
        waitframe(1);
    }
    exploder::stop_exploder("fxexp_gondola_lights_green");
    exploder::exploder("fxexp_gondola_lights_red");
}

// Namespace zm_escape_travel/zm_escape_travel
// Params 0, eflags: 0x1 linked
// Checksum 0x75bd3d98, Offset: 0x36b8
// Size: 0xe4
function gondola_lights_green() {
    var_1d558ef4 = getentarray("gondola_state_light", "targetname");
    foreach (model in var_1d558ef4) {
        model setmodel(#"p8_zm_esc_gondola_frame_light_green");
        waitframe(1);
    }
    exploder::exploder("fxexp_gondola_lights_green");
    exploder::stop_exploder("fxexp_gondola_lights_red");
}

// Namespace zm_escape_travel/zm_escape_travel
// Params 0, eflags: 0x1 linked
// Checksum 0x7834461c, Offset: 0x37a8
// Size: 0x1a
function function_c64e4079() {
    wait(5);
    level.var_fed9dc06 = 1;
}

// Namespace zm_escape_travel/zm_escape_travel
// Params 0, eflags: 0x1 linked
// Checksum 0x6a9c7493, Offset: 0x37d0
// Size: 0x1a
function function_565994f0() {
    wait(5);
    level.var_fed9dc06 = 0;
}

// Namespace zm_escape_travel/zm_escape_travel
// Params 1, eflags: 0x1 linked
// Checksum 0xe11e50b8, Offset: 0x37f8
// Size: 0x11e
function check_when_gondola_moves_if_groundent_is_undefined(e_gondola) {
    wait(1);
    a_zombies = getaiteamarray(level.zombie_team);
    a_zombies = util::get_array_of_closest(e_gondola.origin, a_zombies);
    for (i = 0; i < a_zombies.size; i++) {
        if (distancesquared(e_gondola.origin, a_zombies[i].origin) < 90000) {
            ground_ent = a_zombies[i] getgroundent();
            if (!isdefined(ground_ent)) {
                a_zombies[i] dodamage(a_zombies[i].health + 1000, a_zombies[i].origin);
            }
        }
    }
}

// Namespace zm_escape_travel/zm_escape_travel
// Params 0, eflags: 0x1 linked
// Checksum 0xd82fd1a, Offset: 0x3920
// Size: 0x218
function create_gondola_poi() {
    a_players = getplayers();
    foreach (player in a_players) {
        if (!(isdefined(player.is_on_gondola) && player.is_on_gondola)) {
            return;
        }
    }
    s_poi = struct::get("gondola_poi_" + self.destination, "targetname");
    e_poi = spawn("script_origin", s_poi.origin);
    e_poi zm_utility::create_zombie_point_of_interest(1000, 30, 5000, 1);
    e_poi zm_utility::create_zombie_point_of_interest_attractor_positions(undefined, undefined, 128);
    self.poi = e_poi;
    a_ai_zombies = getaiteamarray(level.zombie_team);
    foreach (ai_zombie in a_ai_zombies) {
        if (ai_zombie istouching(level.e_gondola.t_ride)) {
            ai_zombie zm_utility::add_poi_to_ignore_list(e_poi);
        }
    }
}

// Namespace zm_escape_travel/zm_escape_travel
// Params 0, eflags: 0x1 linked
// Checksum 0xab8f0cd9, Offset: 0x3b40
// Size: 0x44
function tear_down_gondola_poi() {
    if (isdefined(self.poi)) {
        zm_utility::remove_poi_attractor(self.poi);
        self.poi delete();
    }
}

// Namespace zm_escape_travel/zm_escape_travel
// Params 0, eflags: 0x1 linked
// Checksum 0xd931ce8f, Offset: 0x3b90
// Size: 0xfc
function gondola_moving_vo() {
    if (isdefined(level.custom_gondola_moving_vo_func)) {
        self thread [[ level.custom_gondola_moving_vo_func ]]();
        return;
    }
    a_zombies = getaiteamarray(level.zombie_team);
    if (!level function_dc269d0d(a_zombies, level.e_gondola)) {
        if (isdefined(level.var_105462b6)) {
            if (level.var_b9656485 < 3) {
                level.var_105462b6 zm_audio::create_and_play_dialog(#"gondola", #"active", undefined);
                level.var_b9656485++;
            }
            level thread function_6a4544e();
        }
    }
}

// Namespace zm_escape_travel/zm_escape_travel
// Params 0, eflags: 0x1 linked
// Checksum 0x157a4633, Offset: 0x3c98
// Size: 0xb8
function array_players_on_gondola() {
    a_players_on_gondola = [];
    a_players = getplayers();
    foreach (player in a_players) {
        if (player function_9a8ab327()) {
            a_players_on_gondola[a_players_on_gondola.size] = player;
        }
    }
    return a_players_on_gondola;
}

// Namespace zm_escape_travel/zm_escape_travel
// Params 2, eflags: 0x1 linked
// Checksum 0x8268c8b3, Offset: 0x3d58
// Size: 0x58
function function_dc269d0d(a_zombies, e_gondola) {
    a_zombies = util::get_array_of_closest(e_gondola.origin, a_zombies, undefined, 1, 256);
    if (a_zombies.size > 0) {
        return 1;
    }
    return 0;
}

// Namespace zm_escape_travel/zm_escape_travel
// Params 0, eflags: 0x1 linked
// Checksum 0xf166c488, Offset: 0x3db8
// Size: 0xa4
function function_6a4544e() {
    wait(7);
    var_1b66809c = array_players_on_gondola();
    if (var_1b66809c.size == 1) {
        var_1b66809c[0] zm_audio::create_and_play_dialog(#"gondola", #"ride_solo", undefined, 1);
        return;
    }
    if (var_1b66809c.size > 1) {
        level zm_vo::play_banter("gondola_banter", undefined, var_1b66809c);
    }
}

// Namespace zm_escape_travel/zm_escape_travel
// Params 1, eflags: 0x1 linked
// Checksum 0xbef5a839, Offset: 0x3e68
// Size: 0x7a
function gondola_physics_explosion(n_move_time) {
    self endon(#"movedone");
    for (i = 0; i < 2; i++) {
        physicsexplosionsphere(self.origin, 1000, 0.1, 0.1);
        wait(n_move_time / 2);
    }
}

// Namespace zm_escape_travel/zm_escape_travel
// Params 0, eflags: 0x1 linked
// Checksum 0xadfb697b, Offset: 0x3ef0
// Size: 0x74
function function_d8e07db3() {
    self playloopsound(#"zmb_gondola_cooldown_lp", 1);
    wait(10);
    wait(2);
    self stoploopsound(0.5);
    self playsound(#"hash_5ecb872a9078d4bf");
}

// Namespace zm_escape_travel/zm_escape_travel
// Params 0, eflags: 0x1 linked
// Checksum 0x7c883754, Offset: 0x3f70
// Size: 0x4ee
function player_escaped_gondola_failsafe() {
    var_ed7230a5 = [];
    foreach (player in util::get_active_players()) {
        if (isalive(player) && isdefined(player.is_on_gondola) && player.is_on_gondola && !player function_9a8ab327()) {
            a_s_orgs = struct::get_array("gondola_dropped_parts_" + level.e_gondola.destination, "targetname");
            a_s_orgs = arraysortclosest(a_s_orgs, player.origin);
            foreach (s_pos in a_s_orgs) {
                if (!isinarray(var_ed7230a5, s_pos) && zm_utility::check_point_in_enabled_zone(s_pos.origin) && zm_utility::check_point_in_playable_area(s_pos.origin)) {
                    player thread function_da48c149(s_pos);
                    player.is_on_gondola = undefined;
                    if (!isdefined(var_ed7230a5)) {
                        var_ed7230a5 = [];
                    } else if (!isarray(var_ed7230a5)) {
                        var_ed7230a5 = array(var_ed7230a5);
                    }
                    var_ed7230a5[var_ed7230a5.size] = s_pos;
                    break;
                }
            }
        }
        if (!(isdefined(player zm_utility::in_playable_area()) && player zm_utility::in_playable_area())) {
            a_s_pos = struct::get_array("player_respawn_point", "targetname");
            a_s_pos = arraysortclosest(a_s_pos, player.origin);
            foreach (s_pos in a_s_pos) {
                a_s_points = struct::get_array(s_pos.target);
                a_s_points = arraysortclosest(a_s_points, player.origin);
                foreach (s_pos in a_s_points) {
                    if (!isinarray(var_ed7230a5, s_pos) && zm_utility::check_point_in_enabled_zone(s_pos.origin) && zm_utility::check_point_in_playable_area(s_pos.origin)) {
                        player thread function_da48c149(s_pos);
                        player.b_teleported = 1;
                        player.is_on_gondola = undefined;
                        if (!isdefined(var_ed7230a5)) {
                            var_ed7230a5 = [];
                        } else if (!isarray(var_ed7230a5)) {
                            var_ed7230a5 = array(var_ed7230a5);
                        }
                        var_ed7230a5[var_ed7230a5.size] = s_pos;
                        break;
                    }
                }
                if (isdefined(player.b_teleported) && player.b_teleported) {
                    player.b_teleported = undefined;
                    break;
                }
            }
        }
    }
}

// Namespace zm_escape_travel/zm_escape_travel
// Params 1, eflags: 0x5 linked
// Checksum 0xf55157ae, Offset: 0x4468
// Size: 0xd0
function private function_da48c149(s_pos) {
    var_75c89236 = 0;
    self dontinterpolate();
    self setorigin(s_pos.origin);
    do {
        wait(1);
        if (!(isdefined(self zm_utility::in_playable_area()) && self zm_utility::in_playable_area())) {
            self dontinterpolate();
            self setorigin(s_pos.origin);
        }
        var_75c89236++;
    } while (var_75c89236 < 5);
}

// Namespace zm_escape_travel/zm_escape_travel
// Params 0, eflags: 0x1 linked
// Checksum 0x4618227f, Offset: 0x4540
// Size: 0xcc
function gondola_cooldown() {
    a_t_call = getentarray("gondola_call_trigger", "targetname");
    foreach (trigger in a_t_call) {
        trigger sethintstring(#"hash_72dc5724ddfb88b5");
    }
    wait(10);
    gondola_lights_green();
}

// Namespace zm_escape_travel/zm_escape_travel
// Params 0, eflags: 0x5 linked
// Checksum 0x2aeeb0e7, Offset: 0x4618
// Size: 0x74
function private function_de1be51e() {
    var_55a82bb2 = struct::get("gondola_wires");
    var_55a82bb2 thread scene::play("Shot 2");
    self waittill(#"reached_end_node");
    var_55a82bb2 thread scene::play("Shot 1");
}

