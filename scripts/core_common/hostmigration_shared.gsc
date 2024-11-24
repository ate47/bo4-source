#using scripts\core_common\potm_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\values_shared;

#namespace hostmigration;

/#

    // Namespace hostmigration/hostmigration_shared
    // Params 0, eflags: 0x0
    // Checksum 0xa6692fb5, Offset: 0xf0
    // Size: 0x134
    function debug_script_structs() {
        if (isdefined(level.struct)) {
            println("<dev string:x38>" + level.struct.size);
            println("<dev string:x4b>");
            for (i = 0; i < level.struct.size; i++) {
                struct = level.struct[i];
                if (isdefined(struct.targetname)) {
                    println("<dev string:x4e>" + i + "<dev string:x54>" + struct.targetname);
                    continue;
                }
                println("<dev string:x4e>" + i + "<dev string:x54>" + "<dev string:x5a>");
            }
            return;
        }
        println("<dev string:x61>");
    }

#/

// Namespace hostmigration/hostmigration_shared
// Params 0, eflags: 0x0
// Checksum 0xd98f79a8, Offset: 0x230
// Size: 0xba
function updatetimerpausedness() {
    shouldbestopped = isdefined(level.hostmigrationtimer);
    if (!level.timerstopped && shouldbestopped) {
        level.timerstopped = 1;
        level.playabletimerstopped = 1;
        level.timerpausetime = gettime();
        return;
    }
    if (level.timerstopped && !shouldbestopped) {
        level.timerstopped = 0;
        level.playabletimerstopped = 0;
        level.discardtime += gettime() - level.timerpausetime;
    }
}

// Namespace hostmigration/hostmigration_shared
// Params 0, eflags: 0x0
// Checksum 0xb3f39624, Offset: 0x2f8
// Size: 0x12
function pausetimer() {
    level.migrationtimerpausetime = gettime();
}

// Namespace hostmigration/hostmigration_shared
// Params 0, eflags: 0x0
// Checksum 0x56e5439b, Offset: 0x318
// Size: 0x2a
function resumetimer() {
    level.discardtime += gettime() - level.migrationtimerpausetime;
}

// Namespace hostmigration/hostmigration_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x7d35bd0f, Offset: 0x350
// Size: 0x7e
function locktimer() {
    level endon(#"host_migration_begin", #"host_migration_end");
    for (;;) {
        currtime = gettime();
        waitframe(1);
        if (!level.timerstopped && isdefined(level.discardtime)) {
            level.discardtime += gettime() - currtime;
        }
    }
}

// Namespace hostmigration/hostmigration_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xb6197dac, Offset: 0x3d8
// Size: 0x72
function matchstarttimerconsole_internal(counttime) {
    waittillframeend();
    level endon(#"match_start_timer_beginning");
    luinotifyevent(#"create_prematch_timer", 2, gettime() + int(counttime * 1000), 1);
    wait counttime;
}

// Namespace hostmigration/hostmigration_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x963e25e, Offset: 0x458
// Size: 0xec
function matchstarttimerconsole(type, duration) {
    level notify(#"match_start_timer_beginning");
    waitframe(1);
    counttime = int(duration);
    if (isdefined(level.host_migration_activate_visionset_func)) {
        level thread [[ level.host_migration_activate_visionset_func ]]();
    }
    var_5654073f = counttime >= 2;
    if (var_5654073f) {
        matchstarttimerconsole_internal(counttime);
    }
    if (isdefined(level.host_migration_deactivate_visionset_func)) {
        level thread [[ level.host_migration_deactivate_visionset_func ]]();
    }
    luinotifyevent(#"prematch_timer_ended", 1, var_5654073f);
}

// Namespace hostmigration/hostmigration_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xd2b06b88, Offset: 0x550
// Size: 0xba
function hostmigrationwait() {
    level endon(#"game_ended");
    if (level.hostmigrationreturnedplayercount < level.players.size * 2 / 3) {
        thread matchstarttimerconsole("waiting_for_teams", 20);
        hostmigrationwaitforplayers();
    }
    potm::forceinit();
    level notify(#"host_migration_countdown_begin");
    thread matchstarttimerconsole("match_starting_in", 5);
    wait 5;
}

// Namespace hostmigration/hostmigration_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x5a9bbe20, Offset: 0x618
// Size: 0x44
function waittillhostmigrationcountdown() {
    level endon(#"host_migration_end");
    if (!isdefined(level.hostmigrationtimer)) {
        return;
    }
    level waittill(#"host_migration_countdown_begin");
}

// Namespace hostmigration/hostmigration_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x2cf2107c, Offset: 0x668
// Size: 0x20
function hostmigrationwaitforplayers() {
    level endon(#"hostmigration_enoughplayers");
    wait 15;
}

// Namespace hostmigration/hostmigration_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x1f043121, Offset: 0x690
// Size: 0xe4
function hostmigrationtimerthink_internal() {
    level endon(#"host_migration_begin", #"host_migration_end");
    self.hostmigrationcontrolsfrozen = 0;
    while (!isalive(self)) {
        self waittill(#"spawned");
    }
    self.hostmigrationcontrolsfrozen = 1;
    val::set(#"hostmigration", "freezecontrols", 1);
    val::set(#"hostmigration", "disablegadgets", 1);
    level waittill(#"host_migration_end");
}

// Namespace hostmigration/hostmigration_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xb681c5fd, Offset: 0x780
// Size: 0x94
function hostmigrationtimerthink() {
    self endon(#"disconnect");
    level endon(#"host_migration_begin");
    hostmigrationtimerthink_internal();
    if (self.hostmigrationcontrolsfrozen) {
        val::reset(#"hostmigration", "freezecontrols");
        val::reset(#"hostmigration", "disablegadgets");
    }
}

// Namespace hostmigration/hostmigration_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xafcd5979, Offset: 0x820
// Size: 0x44
function waittillhostmigrationdone() {
    if (!isdefined(level.hostmigrationtimer)) {
        return 0;
    }
    starttime = gettime();
    level waittill(#"host_migration_end");
    return gettime() - starttime;
}

// Namespace hostmigration/hostmigration_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x26acf0f7, Offset: 0x870
// Size: 0x38
function waittillhostmigrationstarts(duration) {
    if (isdefined(level.hostmigrationtimer)) {
        return;
    }
    level endon(#"host_migration_begin");
    wait duration;
}

// Namespace hostmigration/hostmigration_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x1018fa09, Offset: 0x8b0
// Size: 0x13c
function waitlongdurationwithhostmigrationpause(duration) {
    if (duration == 0) {
        return;
    }
    assert(duration > 0);
    starttime = gettime();
    for (endtime = gettime() + int(duration * 1000); gettime() < endtime; endtime += timepassed) {
        waittillhostmigrationstarts(float(endtime - gettime()) / 1000);
        if (isdefined(level.hostmigrationtimer)) {
            timepassed = waittillhostmigrationdone();
        }
    }
    /#
        if (gettime() != endtime) {
            println("<dev string:x7b>" + gettime() + "<dev string:x9a>" + endtime);
        }
    #/
    waittillhostmigrationdone();
    return gettime() - starttime;
}

// Namespace hostmigration/hostmigration_shared
// Params 1, eflags: 0x0
// Checksum 0x8c8595e8, Offset: 0x9f8
// Size: 0x15e
function waitlongdurationwithhostmigrationpauseemp(duration) {
    if (duration == 0) {
        return;
    }
    assert(duration > 0);
    starttime = gettime();
    empendtime = gettime() + int(duration * 1000);
    level.empendtime = empendtime;
    while (gettime() < empendtime) {
        waittillhostmigrationstarts(float(empendtime - gettime()) / 1000);
        if (isdefined(level.hostmigrationtimer)) {
            timepassed = waittillhostmigrationdone();
            if (isdefined(empendtime)) {
                empendtime += timepassed;
            }
        }
    }
    /#
        if (gettime() != empendtime) {
            println("<dev string:x7b>" + gettime() + "<dev string:xb5>" + empendtime);
        }
    #/
    waittillhostmigrationdone();
    level.empendtime = undefined;
    return gettime() - starttime;
}

// Namespace hostmigration/hostmigration_shared
// Params 1, eflags: 0x0
// Checksum 0x94ce32a4, Offset: 0xb60
// Size: 0x196
function waitlongdurationwithgameendtimeupdate(duration) {
    if (duration == 0) {
        return;
    }
    assert(duration > 0);
    starttime = gettime();
    endtime = gettime() + int(duration * 1000);
    while (gettime() < endtime) {
        waittillhostmigrationstarts(float(endtime - gettime()) / 1000);
        while (isdefined(level.hostmigrationtimer)) {
            endtime += 1000;
            setgameendtime(int(endtime));
            wait 1;
        }
    }
    /#
        if (gettime() != endtime) {
            println("<dev string:x7b>" + gettime() + "<dev string:x9a>" + endtime);
        }
    #/
    while (isdefined(level.hostmigrationtimer)) {
        endtime += 1000;
        setgameendtime(int(endtime));
        wait 1;
    }
    return gettime() - starttime;
}

// Namespace hostmigration/hostmigration_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x5134bc4e, Offset: 0xd00
// Size: 0xf0
function migrationawarewait(durationms) {
    waittillhostmigrationdone();
    endtime = gettime() + durationms;
    timeremaining = durationms;
    while (true) {
        event = level util::waittill_level_any_timeout(float(timeremaining) / 1000, self, "game_ended", "host_migration_begin");
        if (event != "host_migration_begin") {
            return;
        }
        timeremaining = endtime - gettime();
        if (timeremaining <= 0) {
            return;
        }
        endtime = gettime() + durationms;
        waittillhostmigrationdone();
    }
}

