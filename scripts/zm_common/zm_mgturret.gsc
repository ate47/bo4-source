// Atian COD Tools GSC decompiler test
#include scripts/core_common/struct.gsc;

#namespace zm_mgturret;

// Namespace zm_mgturret/zm_mgturret
// Params 0, eflags: 0x0
// Checksum 0xf08abd7c, Offset: 0x110
// Size: 0xd6
function main() {
    if (getdvarstring(#"mg42") == "") {
        setdvar(#"mgturret", "off");
    }
    level.magic_distance = 24;
    turretinfos = getentarray("turretInfo", "targetname");
    for (index = 0; index < turretinfos.size; index++) {
        turretinfos[index] delete();
    }
}

// Namespace zm_mgturret/zm_mgturret
// Params 1, eflags: 0x0
// Checksum 0x553be456, Offset: 0x1f0
// Size: 0x15e
function set_difficulty(difficulty) {
    init_turret_difficulty_settings();
    turrets = getentarray("misc_turret", "classname");
    for (index = 0; index < turrets.size; index++) {
        if (isdefined(turrets[index].var_54ca8ff)) {
            switch (turrets[index].var_54ca8ff) {
            case #"easy":
                difficulty = "easy";
                break;
            case #"medium":
                difficulty = "medium";
                break;
            case #"hard":
                difficulty = "hard";
                break;
            case #"fu":
                difficulty = "fu";
                break;
            default:
                continue;
            }
        }
        turret_set_difficulty(turrets[index], difficulty);
    }
}

// Namespace zm_mgturret/zm_mgturret
// Params 0, eflags: 0x0
// Checksum 0xeef5b2ab, Offset: 0x358
// Size: 0x444
function init_turret_difficulty_settings() {
    level.mgturretsettings[#"easy"][#"convergencetime"] = 2.5;
    level.mgturretsettings[#"easy"][#"suppressiontime"] = 3;
    level.mgturretsettings[#"easy"][#"accuracy"] = 0.38;
    level.mgturretsettings[#"easy"][#"aispread"] = 2;
    level.mgturretsettings[#"easy"][#"playerspread"] = 0.5;
    level.mgturretsettings[#"medium"][#"convergencetime"] = 1.5;
    level.mgturretsettings[#"medium"][#"suppressiontime"] = 3;
    level.mgturretsettings[#"medium"][#"accuracy"] = 0.38;
    level.mgturretsettings[#"medium"][#"aispread"] = 2;
    level.mgturretsettings[#"medium"][#"playerspread"] = 0.5;
    level.mgturretsettings[#"hard"][#"convergencetime"] = 0.8;
    level.mgturretsettings[#"hard"][#"suppressiontime"] = 3;
    level.mgturretsettings[#"hard"][#"accuracy"] = 0.38;
    level.mgturretsettings[#"hard"][#"aispread"] = 2;
    level.mgturretsettings[#"hard"][#"playerspread"] = 0.5;
    level.mgturretsettings[#"fu"][#"convergencetime"] = 0.4;
    level.mgturretsettings[#"fu"][#"suppressiontime"] = 3;
    level.mgturretsettings[#"fu"][#"accuracy"] = 0.38;
    level.mgturretsettings[#"fu"][#"aispread"] = 2;
    level.mgturretsettings[#"fu"][#"playerspread"] = 0.5;
}

// Namespace zm_mgturret/zm_mgturret
// Params 2, eflags: 0x0
// Checksum 0x297717d3, Offset: 0x7a8
// Size: 0xde
function turret_set_difficulty(turret, difficulty) {
    turret.convergencetime = level.mgturretsettings[difficulty][#"convergencetime"];
    turret.suppressiontime = level.mgturretsettings[difficulty][#"suppressiontime"];
    turret.accuracy = level.mgturretsettings[difficulty][#"accuracy"];
    turret.aispread = level.mgturretsettings[difficulty][#"aispread"];
    turret.playerspread = level.mgturretsettings[difficulty][#"playerspread"];
}

// Namespace zm_mgturret/zm_mgturret
// Params 1, eflags: 0x0
// Checksum 0xfae05604, Offset: 0x890
// Size: 0xd4
function turret_suppression_fire(targets) {
    self endon(#"death", #"stop_suppression_fire");
    if (!isdefined(self.suppresionfire)) {
        self.suppresionfire = 1;
    }
    for (;;) {
        for (;;) {
            while (self.suppresionfire) {
                self turretsettarget(0, targets[randomint(targets.size)]);
                wait(2 + randomfloat(2));
            }
            self turretcleartarget(0);
        LOC_000000ba:
            if (self.suppresionfire) {
                continue;
            };
            wait(1);
        }
    }
}

// Namespace zm_mgturret/zm_mgturret
// Params 1, eflags: 0x0
// Checksum 0xdb9094b9, Offset: 0x970
// Size: 0x76
function burst_fire_settings(setting) {
    if (setting == "delay") {
        return 0.2;
    } else if (setting == "delay_range") {
        return 0.5;
    } else if (setting == "burst") {
        return 0.5;
    } else if (setting == "burst_range") {
        return 4;
    }
}

// Namespace zm_mgturret/zm_mgturret
// Params 2, eflags: 0x0
// Checksum 0xd23a252a, Offset: 0x9f0
// Size: 0x1f2
function burst_fire(turret, manual_target) {
    turret endon(#"death", #"stopfiring");
    self endon(#"stop_using_built_in_burst_fire");
    if (isdefined(turret.script_delay_min)) {
        turret_delay = turret.script_delay_min;
    } else {
        turret_delay = burst_fire_settings("delay");
    }
    if (isdefined(turret.script_delay_max)) {
        turret_delay_range = turret.script_delay_max - turret_delay;
    } else {
        turret_delay_range = burst_fire_settings("delay_range");
    }
    if (isdefined(turret.script_burst_min)) {
        turret_burst = turret.script_burst_min;
    } else {
        turret_burst = burst_fire_settings("burst");
    }
    if (isdefined(turret.script_burst_max)) {
        turret_burst_range = turret.script_burst_max - turret_burst;
    } else {
        turret_burst_range = burst_fire_settings("burst_range");
    }
    while (1) {
        if (isdefined(manual_target)) {
            turret thread random_spread(manual_target);
        }
        turret do_shoot();
        wait(turret_burst + randomfloat(turret_burst_range));
        wait(turret_delay + randomfloat(turret_delay_range));
    }
}

// Namespace zm_mgturret/zm_mgturret
// Params 0, eflags: 0x0
// Checksum 0x6708cc4d, Offset: 0xbf0
// Size: 0x376
function burst_fire_unmanned() {
    self notify(#"stop_burst_fire_unmanned");
    self endon(#"stop_burst_fire_unmanned", #"death", #"remote_start");
    level endon(#"game_ended");
    if (isdefined(self.controlled) && self.controlled) {
        return;
    }
    if (isdefined(self.script_delay_min)) {
        turret_delay = self.script_delay_min;
    } else {
        turret_delay = burst_fire_settings("delay");
    }
    if (isdefined(self.script_delay_max)) {
        turret_delay_range = self.script_delay_max - turret_delay;
    } else {
        turret_delay_range = burst_fire_settings("delay_range");
    }
    if (isdefined(self.script_burst_min)) {
        turret_burst = self.script_burst_min;
    } else {
        turret_burst = burst_fire_settings("burst");
    }
    if (isdefined(self.script_burst_max)) {
        turret_burst_range = self.script_burst_max - turret_burst;
    } else {
        turret_burst_range = burst_fire_settings("burst_range");
    }
    pauseuntiltime = gettime();
    var_b6014cc8 = "start";
    self.script_shooting = 0;
    for (;;) {
        for (;;) {
            if (isdefined(self.manual_targets)) {
                self turretcleartarget(0);
                self turretsettarget(0, self.manual_targets[randomint(self.manual_targets.size)]);
            }
            duration = (pauseuntiltime - gettime()) * 0.001;
            if (duration <= 0) {
                if (var_b6014cc8 != "fire") {
                    var_b6014cc8 = "fire";
                    self playsound(#"mpl_turret_alert");
                    self thread do_shoot();
                    self.script_shooting = 1;
                }
                duration = turret_burst + randomfloat(turret_burst_range);
                self thread turret_timer(duration);
                self waittill(#"turretstatechange");
                self.script_shooting = 0;
                duration = turret_delay + randomfloat(turret_delay_range);
                pauseuntiltime = gettime() + int(duration * 1000);
                continue;
            }
            if (var_b6014cc8 != "aim") {
                var_b6014cc8 = "aim";
            }
            self thread turret_timer(duration);
        }
    }
}

// Namespace zm_mgturret/zm_mgturret
// Params 1, eflags: 0x0
// Checksum 0xb23c407a, Offset: 0xf70
// Size: 0x4c
function avoid_synchronization(time) {
    if (!isdefined(level._zm_mgturret_firing)) {
        level._zm_mgturret_firing = 0;
    }
    level._zm_mgturret_firing++;
    wait(time);
    level._zm_mgturret_firing--;
}

// Namespace zm_mgturret/zm_mgturret
// Params 0, eflags: 0x0
// Checksum 0x76aac91e, Offset: 0xfc8
// Size: 0x78
function do_shoot() {
    self endon(#"death", #"turretstatechange");
    for (;;) {
        for (;;) {
            while (isdefined(level._zm_mgturret_firing) && level._zm_mgturret_firing) {
                wait(0.1);
            }
            thread avoid_synchronization(0.1);
        }
    }
}

// Namespace zm_mgturret/zm_mgturret
// Params 1, eflags: 0x0
// Checksum 0xd457f5b8, Offset: 0x1048
// Size: 0x4e
function turret_timer(duration) {
    if (duration <= 0) {
        return;
    }
    self endon(#"turretstatechange");
    wait(duration);
    if (isdefined(self)) {
        self notify(#"turretstatechange");
    }
}

// Namespace zm_mgturret/zm_mgturret
// Params 1, eflags: 0x0
// Checksum 0x1e5bd388, Offset: 0x10a0
// Size: 0x150
function random_spread(ent) {
    self endon(#"death");
    self notify(#"hash_db4bcf6e900f466");
    self endon(#"hash_db4bcf6e900f466", #"stopfiring");
    self turretsettarget(0, ent);
    self.manual_target = ent;
    while (1) {
        if (isplayer(ent)) {
            ent.origin = self.manual_target getorigin();
        } else {
            ent.origin = self.manual_target.origin;
        }
        ent.origin = ent.origin + (20 - randomfloat(40), 20 - randomfloat(40), 20 - randomfloat(60));
        wait(0.2);
    }
}

