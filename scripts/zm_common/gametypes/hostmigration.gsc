// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\hud_util_shared.gsc;
#using scripts\core_common\hud_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace hostmigration;

// Namespace hostmigration/hostmigration
// Params 0, eflags: 0x0
// Checksum 0x15e43ca5, Offset: 0x1d8
// Size: 0x134
function debug_script_structs() {
    /#
        if (isdefined(level.struct)) {
            println("<unknown string>" + level.struct.size);
            println("<unknown string>");
            for (i = 0; i < level.struct.size; i++) {
                struct = level.struct[i];
                if (isdefined(struct.targetname)) {
                    println("<unknown string>" + i + "<unknown string>" + struct.targetname);
                    continue;
                }
                println("<unknown string>" + i + "<unknown string>" + "<unknown string>");
            }
            return;
        }
        println("<unknown string>");
    #/
}

// Namespace hostmigration/hostmigration
// Params 0, eflags: 0x0
// Checksum 0x756d2497, Offset: 0x318
// Size: 0x9e
function updatetimerpausedness() {
    shouldbestopped = isdefined(level.hostmigrationtimer);
    if (!level.timerstopped && shouldbestopped) {
        level.timerstopped = 1;
        level.timerpausetime = gettime();
        return;
    }
    if (level.timerstopped && !shouldbestopped) {
        level.timerstopped = 0;
        level.discardtime = level.discardtime + gettime() - level.timerpausetime;
    }
}

// Namespace hostmigration/hostmigration
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x3c0
// Size: 0x4
function callback_hostmigrationsave() {
    
}

// Namespace hostmigration/hostmigration
// Params 0, eflags: 0x1 linked
// Checksum 0x15c46da8, Offset: 0x3d0
// Size: 0x176
function callback_prehostmigrationsave() {
    zm_utility::undo_link_changes();
    if (isdefined(level._hm_should_pause_spawning) && level._hm_should_pause_spawning) {
        level flag::set("spawn_zombies");
    }
    for (i = 0; i < level.players.size; i++) {
        level.players[i] val::set(#"host_migration", "takedamage", 0);
        level.players[i] stats::set_stat(#"afteractionreportstats", #"lobbypopup", #"summary");
        clientnum = level.players[i] getentitynumber();
        level.players[i] stats::set_stat(#"afteractionreportstats", #"clientnum", clientnum);
    }
}

// Namespace hostmigration/hostmigration
// Params 0, eflags: 0x0
// Checksum 0xc20193e4, Offset: 0x550
// Size: 0x12
function pausetimer() {
    level.migrationtimerpausetime = gettime();
}

// Namespace hostmigration/hostmigration
// Params 0, eflags: 0x0
// Checksum 0x5a98ba96, Offset: 0x570
// Size: 0x2a
function resumetimer() {
    level.discardtime = level.discardtime + gettime() - level.migrationtimerpausetime;
}

// Namespace hostmigration/hostmigration
// Params 0, eflags: 0x1 linked
// Checksum 0xfca06838, Offset: 0x5a8
// Size: 0x7e
function locktimer() {
    level endon(#"host_migration_begin", #"host_migration_end");
    for (;;) {
        currtime = gettime();
        waitframe(1);
        if (!level.timerstopped && isdefined(level.discardtime)) {
            level.discardtime = level.discardtime + gettime() - currtime;
        }
    }
}

// Namespace hostmigration/hostmigration
// Params 0, eflags: 0x1 linked
// Checksum 0x7c5a49bb, Offset: 0x630
// Size: 0x910
function callback_hostmigration() {
    zm_utility::redo_link_changes();
    setslowmotion(1, 1, 0);
    level.hostmigrationreturnedplayercount = 0;
    if (level.gameended) {
        /#
            println("<unknown string>" + gettime() + "<unknown string>");
        #/
        return;
    }
    sethostmigrationstatus(1);
    callback::function_daed27e8(#"on_host_migration_begin");
    level notify(#"host_migration_begin");
    for (i = 0; i < level.players.size; i++) {
        if (isdefined(level.hostmigration_link_entity_callback)) {
            if (!isdefined(level.players[i]._host_migration_link_entity)) {
                level.players[i]._host_migration_link_entity = level.players[i] [[ level.hostmigration_link_entity_callback ]]();
            }
        }
        level.players[i] thread hostmigrationtimerthink();
    }
    if (isdefined(level.hostmigration_ai_link_entity_callback)) {
        zombies = getaiteamarray(level.zombie_team);
        if (isdefined(zombies) && zombies.size > 0) {
            foreach (zombie in zombies) {
                if (!isdefined(zombie._host_migration_link_entity)) {
                    zombie._host_migration_link_entity = zombie [[ level.hostmigration_ai_link_entity_callback ]]();
                }
            }
        }
    } else {
        zombies = getaiteamarray(level.zombie_team);
        if (isdefined(zombies) && zombies.size > 0) {
            foreach (zombie in zombies) {
                zombie.no_powerups = 1;
                zombie.marked_for_recycle = 1;
                zombie.has_been_damaged_by_player = 0;
                zombie dodamage(zombie.health + 1000, zombie.origin, zombie);
            }
        }
    }
    if (level.inprematchperiod) {
        level waittill(#"prematch_over");
    }
    /#
        println("<unknown string>" + gettime());
    #/
    level.hostmigrationtimer = 1;
    thread locktimer();
    if (isdefined(level.b_host_migration_force_player_respawn) && level.b_host_migration_force_player_respawn) {
        foreach (player in level.players) {
            if (zm_utility::is_player_valid(player, 0, 0)) {
                player host_migration_respawn();
            }
        }
    }
    zombies = getaiteamarray(level.zombie_team);
    if (isdefined(zombies) && zombies.size > 0) {
        foreach (zombie in zombies) {
            if (isdefined(zombie._host_migration_link_entity)) {
                ent = spawn("script_origin", zombie.origin);
                ent.angles = zombie.angles;
                zombie linkto(ent);
                ent linkto(zombie._host_migration_link_entity, "tag_origin", zombie._host_migration_link_entity worldtolocalcoords(ent.origin), ent.angles + zombie._host_migration_link_entity.angles);
                zombie._host_migration_link_helper = ent;
                zombie linkto(zombie._host_migration_link_helper);
            }
        }
    }
    level endon(#"host_migration_begin");
    should_pause_spawning = level flag::get("spawn_zombies");
    if (should_pause_spawning) {
        level flag::clear("spawn_zombies");
    }
    hostmigrationwait();
    foreach (player in level.players) {
        player thread post_migration_invulnerability();
    }
    function_f7b6fbdb();
    zombies = getaiteamarray(level.zombie_team);
    if (isdefined(zombies) && zombies.size > 0) {
        foreach (zombie in zombies) {
            if (isdefined(zombie._host_migration_link_entity)) {
                zombie unlink();
                zombie._host_migration_link_helper delete();
                zombie._host_migration_link_helper = undefined;
                zombie._host_migration_link_entity = undefined;
            }
        }
    }
    if (should_pause_spawning) {
        level flag::set("spawn_zombies");
    }
    level.hostmigrationtimer = undefined;
    level._hm_should_pause_spawning = undefined;
    sethostmigrationstatus(0);
    /#
        println("<unknown string>" + gettime());
    #/
    level.host = util::gethostplayer();
    for (i = 0; i < level.players.size; i++) {
        clientnum = level.players[i] getentitynumber();
        level.players[i] stats::set_stat(#"afteractionreportstats", #"clientnum", clientnum);
    }
    callback::function_daed27e8(#"on_host_migration_end");
    level notify(#"host_migration_end");
}

// Namespace hostmigration/hostmigration
// Params 0, eflags: 0x0
// Checksum 0xe897a64e, Offset: 0xf48
// Size: 0x18
function post_migration_become_vulnerable() {
    self endon(#"disconnect");
}

// Namespace hostmigration/hostmigration
// Params 0, eflags: 0x1 linked
// Checksum 0xc8936578, Offset: 0xf68
// Size: 0x2c
function post_migration_invulnerability() {
    self thread val::set_for_time(3, "host_migration", "takedamage", 0);
}

// Namespace hostmigration/hostmigration
// Params 0, eflags: 0x1 linked
// Checksum 0xb2bbe292, Offset: 0xfa0
// Size: 0x100
function host_migration_respawn() {
    /#
        println("<unknown string>");
    #/
    new_origin = undefined;
    if (isdefined(level.var_5816975b)) {
        new_origin = [[ level.var_5816975b ]](self);
    }
    if (!isdefined(new_origin)) {
        new_origin = zm_player::check_for_valid_spawn_near_team(self, 1);
    }
    if (isdefined(new_origin)) {
        if (!isdefined(new_origin.angles)) {
            angles = (0, 0, 0);
        } else {
            angles = new_origin.angles;
        }
        self dontinterpolate();
        self setorigin(new_origin.origin);
        self setplayerangles(angles);
    }
    return true;
}

// Namespace hostmigration/hostmigration
// Params 1, eflags: 0x1 linked
// Checksum 0xd30bd06f, Offset: 0x10a8
// Size: 0x72
function matchstarttimerconsole_internal(counttime) {
    waittillframeend();
    level endon(#"match_start_timer_beginning");
    luinotifyevent(#"create_prematch_timer", 2, gettime() + int(counttime * 1000), 1);
    wait(counttime);
}

// Namespace hostmigration/hostmigration
// Params 2, eflags: 0x1 linked
// Checksum 0xfa0e453a, Offset: 0x1128
// Size: 0xac
function matchstarttimerconsole(type, duration) {
    level notify(#"match_start_timer_beginning");
    waitframe(1);
    counttime = int(duration);
    var_5654073f = counttime >= 2;
    if (var_5654073f) {
        matchstarttimerconsole_internal(counttime);
    }
    luinotifyevent(#"prematch_timer_ended", 1, var_5654073f);
}

// Namespace hostmigration/hostmigration
// Params 0, eflags: 0x1 linked
// Checksum 0x3c5194b6, Offset: 0x11e0
// Size: 0x92
function hostmigrationwait() {
    level endon(#"game_ended");
    if (level.hostmigrationreturnedplayercount < level.players.size * 2 / 3) {
        thread matchstarttimerconsole("waiting_for_teams", 20);
        hostmigrationwaitforplayers();
    }
    thread matchstarttimerconsole("match_starting_in", 9);
    wait(1);
}

// Namespace hostmigration/hostmigration
// Params 0, eflags: 0x1 linked
// Checksum 0xed0b9daa, Offset: 0x1280
// Size: 0x20
function hostmigrationwaitforplayers() {
    level endon(#"hostmigration_enoughplayers");
    wait(1);
}

// Namespace hostmigration/hostmigration
// Params 0, eflags: 0x1 linked
// Checksum 0x4bd116d8, Offset: 0x12a8
// Size: 0x1e4
function hostmigrationtimerthink_internal() {
    level endon(#"host_migration_begin", #"host_migration_end");
    self.hostmigrationcontrolsfrozen = 0;
    while (!isalive(self)) {
        self waittill(#"spawned");
    }
    if (isdefined(self._host_migration_link_entity)) {
        ent = spawn("script_origin", self.origin);
        ent.angles = self.angles;
        self linkto(ent);
        ent linkto(self._host_migration_link_entity, "tag_origin", self._host_migration_link_entity worldtolocalcoords(ent.origin), ent.angles + self._host_migration_link_entity.angles);
        self._host_migration_link_helper = ent;
        /#
            println("<unknown string>" + self._host_migration_link_entity.targetname);
        #/
    }
    self.hostmigrationcontrolsfrozen = 1;
    self val::set(#"host_migration", "freezecontrols");
    self val::set(#"host_migration", "disablegadgets");
    level waittill(#"host_migration_end");
}

// Namespace hostmigration/hostmigration
// Params 0, eflags: 0x1 linked
// Checksum 0x74c9bf52, Offset: 0x1498
// Size: 0x13e
function hostmigrationtimerthink() {
    self endon(#"disconnect");
    level endon(#"host_migration_begin");
    hostmigrationtimerthink_internal();
    if (self.hostmigrationcontrolsfrozen) {
        self val::reset(#"host_migration", "freezecontrols");
        self val::reset(#"host_migration", "disablegadgets");
        self.hostmigrationcontrolsfrozen = 0;
        /#
            println("<unknown string>");
        #/
    }
    if (isdefined(self._host_migration_link_entity)) {
        self unlink();
        self._host_migration_link_helper delete();
        self._host_migration_link_helper = undefined;
        if (isdefined(self._host_migration_link_entity._post_host_migration_thread)) {
            self thread [[ self._host_migration_link_entity._post_host_migration_thread ]](self._host_migration_link_entity);
        }
        self._host_migration_link_entity = undefined;
    }
}

// Namespace hostmigration/hostmigration
// Params 0, eflags: 0x1 linked
// Checksum 0xcc61f9a4, Offset: 0x15e0
// Size: 0x44
function waittillhostmigrationdone() {
    if (!isdefined(level.hostmigrationtimer)) {
        return 0;
    }
    starttime = gettime();
    level waittill(#"host_migration_end");
    return gettime() - starttime;
}

// Namespace hostmigration/hostmigration
// Params 1, eflags: 0x1 linked
// Checksum 0x5fb4840b, Offset: 0x1630
// Size: 0x38
function waittillhostmigrationstarts(duration) {
    if (isdefined(level.hostmigrationtimer)) {
        return;
    }
    level endon(#"host_migration_begin");
    wait(duration);
}

// Namespace hostmigration/hostmigration
// Params 1, eflags: 0x1 linked
// Checksum 0x83a3f6f3, Offset: 0x1670
// Size: 0x114
function waitlongdurationwithhostmigrationpause(duration) {
    if (duration == 0) {
        return;
    }
    /#
        assert(duration > 0);
    #/
    starttime = gettime();
    for (endtime = gettime() + duration * 1000; gettime() < endtime; endtime = endtime + timepassed) {
        waittillhostmigrationstarts((endtime - gettime()) / 1000);
        if (isdefined(level.hostmigrationtimer)) {
            timepassed = waittillhostmigrationdone();
        }
    }
    if (gettime() != endtime) {
        /#
            println("<unknown string>" + gettime() + "<unknown string>" + endtime);
        #/
    }
    waittillhostmigrationdone();
    return gettime() - starttime;
}

// Namespace hostmigration/hostmigration
// Params 1, eflags: 0x0
// Checksum 0xd72f2183, Offset: 0x1790
// Size: 0x16e
function waitlongdurationwithgameendtimeupdate(duration) {
    if (duration == 0) {
        return;
    }
    /#
        assert(duration > 0);
    #/
    starttime = gettime();
    endtime = gettime() + duration * 1000;
    while (gettime() < endtime) {
        waittillhostmigrationstarts((endtime - gettime()) / 1000);
        while (isdefined(level.hostmigrationtimer)) {
            endtime = endtime + 1000;
            setgameendtime(int(endtime));
            wait(1);
        }
    }
    /#
        if (gettime() != endtime) {
            println("<unknown string>" + gettime() + "<unknown string>" + endtime);
        }
    #/
    while (isdefined(level.hostmigrationtimer)) {
        endtime = endtime + 1000;
        setgameendtime(int(endtime));
        wait(1);
    }
    return gettime() - starttime;
}

// Namespace hostmigration/hostmigration
// Params 5, eflags: 0x1 linked
// Checksum 0xf21d7013, Offset: 0x1908
// Size: 0x288
function find_alternate_player_place(v_origin, min_radius, max_radius, max_height, ignore_targetted_nodes) {
    found_node = undefined;
    a_nodes = getnodesinradiussorted(v_origin, max_radius, min_radius, max_height, "pathnodes");
    if (isdefined(a_nodes) && a_nodes.size > 0) {
        a_player_volumes = getentarray("player_volume", "script_noteworthy");
        index = a_nodes.size - 1;
        for (i = index; i >= 0; i--) {
            n_node = a_nodes[i];
            if (ignore_targetted_nodes == 1) {
                if (isdefined(n_node.target)) {
                    continue;
                }
            }
            if (!positionwouldtelefrag(n_node.origin)) {
                if (zm_utility::check_point_in_enabled_zone(n_node.origin, 1, a_player_volumes)) {
                    v_start = (n_node.origin[0], n_node.origin[1], n_node.origin[2] + 30);
                    v_end = (n_node.origin[0], n_node.origin[1], n_node.origin[2] - 30);
                    trace = bullettrace(v_start, v_end, 0, undefined);
                    if (trace[#"fraction"] < 1) {
                        override_abort = 0;
                        if (isdefined(level._whoswho_reject_node_override_func)) {
                            override_abort = [[ level._whoswho_reject_node_override_func ]](v_origin, n_node);
                        }
                        if (!override_abort) {
                            found_node = n_node;
                            break;
                        }
                    }
                }
            }
        }
    }
    return found_node;
}

// Namespace hostmigration/hostmigration
// Params 0, eflags: 0x0
// Checksum 0xffbfa18e, Offset: 0x1b98
// Size: 0x344
function hostmigration_put_player_in_better_place() {
    spawnpoint = undefined;
    spawnpoint = find_alternate_player_place(self.origin, 50, 150, 64, 1);
    if (!isdefined(spawnpoint)) {
        spawnpoint = find_alternate_player_place(self.origin, 150, 400, 64, 1);
    }
    if (!isdefined(spawnpoint)) {
        spawnpoint = find_alternate_player_place(self.origin, 50, 400, 256, 0);
    }
    if (!isdefined(spawnpoint)) {
        spawnpoint = zm_player::check_for_valid_spawn_near_team(self, 1);
    }
    if (!isdefined(spawnpoint)) {
        match_string = "";
        location = level.scr_zm_map_start_location;
        if ((location == "default" || location == "") && isdefined(level.default_start_location)) {
            location = level.default_start_location;
        }
        match_string = level.scr_zm_ui_gametype + "_" + location;
        spawnpoints = [];
        structs = struct::get_array("initial_spawn", "script_noteworthy");
        if (isdefined(structs)) {
            foreach (struct in structs) {
                if (isdefined(struct.script_string)) {
                    tokens = strtok(struct.script_string, " ");
                    foreach (token in tokens) {
                        if (token == match_string) {
                            spawnpoints[spawnpoints.size] = struct;
                        }
                    }
                }
            }
        }
        if (!isdefined(spawnpoints) || spawnpoints.size == 0) {
            spawnpoints = struct::get_array("initial_spawn_points", "targetname");
        }
        /#
            assert(isdefined(spawnpoints), "<unknown string>");
        #/
        spawnpoint = zm_player::getfreespawnpoint(spawnpoints, self);
    }
    if (isdefined(spawnpoint)) {
        self setorigin(spawnpoint.origin);
    }
}

