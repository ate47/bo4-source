// Atian COD Tools GSC decompiler test
#using scripts\core_common\globallogic\globallogic_score.gsc;
#using scripts\abilities\ability_player.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\visionset_mgr_shared.gsc;
#using scripts\core_common\gestures.gsc;
#using scripts\core_common\flagsys_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace gadget_vision_pulse;

// Namespace gadget_vision_pulse/gadget_vision_pulse
// Params 0, eflags: 0x0
// Checksum 0x364a4479, Offset: 0x1b8
// Size: 0x22e
function init_shared() {
    level.var_2e3031be = getweapon(#"gadget_vision_pulse");
    ability_player::register_gadget_activation_callbacks(4, &gadget_vision_pulse_on, &gadget_vision_pulse_off);
    ability_player::register_gadget_flicker_callbacks(4, &gadget_vision_pulse_on_flicker);
    ability_player::register_gadget_is_inuse_callbacks(4, &gadget_vision_pulse_is_inuse);
    ability_player::register_gadget_is_flickering_callbacks(4, &gadget_vision_pulse_is_flickering);
    ability_player::function_92292af6(4, undefined, &deployed_off);
    callback::on_spawned(&gadget_vision_pulse_on_spawn);
    clientfield::register("toplayer", "vision_pulse_active", 1, 1, "int");
    clientfield::register("toplayer", "toggle_postfx", 1, 1, "int");
    if (!isdefined(level.vsmgr_prio_visionset_visionpulse)) {
        level.vsmgr_prio_visionset_visionpulse = 61;
    }
    visionset_mgr::register_info("visionset", "vision_pulse", 1, level.vsmgr_prio_visionset_visionpulse, 12, 1, &visionset_mgr::ramp_in_out_thread_per_player_death_shutdown, 0);
    globallogic_score::register_kill_callback(level.var_2e3031be, &is_pulsed);
    globallogic_score::function_86f90713(level.var_2e3031be, &is_pulsed);
    level.shutdown_vision_pulse = &shutdown_vision_pulse;
}

// Namespace gadget_vision_pulse/gadget_vision_pulse
// Params 2, eflags: 0x0
// Checksum 0xe35bf797, Offset: 0x3f0
// Size: 0x34
function deployed_off(slot, weapon) {
    self gadgetpowerset(slot, 0);
}

// Namespace gadget_vision_pulse/gadget_vision_pulse
// Params 5, eflags: 0x0
// Checksum 0xda6f2cbb, Offset: 0x430
// Size: 0x5a
function is_pulsed(attacker, victim, weapon, attackerweapon, meansofdeath) {
    return isdefined(attacker._pulse_ent) && isdefined(victim.ispulsed) && victim.ispulsed;
}

// Namespace gadget_vision_pulse/gadget_vision_pulse
// Params 1, eflags: 0x0
// Checksum 0x6d3f360, Offset: 0x498
// Size: 0x1a
function function_f5632baf(func) {
    level.var_fc3478b7 = func;
}

// Namespace gadget_vision_pulse/gadget_vision_pulse
// Params 1, eflags: 0x0
// Checksum 0x281ddb07, Offset: 0x4c0
// Size: 0x2a
function gadget_vision_pulse_is_inuse(slot) {
    return self flagsys::get(#"gadget_vision_pulse_on");
}

// Namespace gadget_vision_pulse/gadget_vision_pulse
// Params 1, eflags: 0x0
// Checksum 0xa3c15ee3, Offset: 0x4f8
// Size: 0x22
function gadget_vision_pulse_is_flickering(slot) {
    return self gadgetflickering(slot);
}

// Namespace gadget_vision_pulse/gadget_vision_pulse
// Params 2, eflags: 0x0
// Checksum 0x654c053b, Offset: 0x528
// Size: 0x2c
function gadget_vision_pulse_on_flicker(slot, weapon) {
    self thread gadget_vision_pulse_flicker(slot, weapon);
}

// Namespace gadget_vision_pulse/gadget_vision_pulse
// Params 0, eflags: 0x0
// Checksum 0x97c17712, Offset: 0x560
// Size: 0x54
function gadget_vision_pulse_on_spawn() {
    self.visionpulseactivatetime = 0;
    self.visionpulsearray = [];
    self.visionpulseorigin = undefined;
    self.visionpulseoriginarray = [];
    if (isdefined(self._pulse_ent)) {
        self._pulse_ent delete();
    }
}

// Namespace gadget_vision_pulse/gadget_vision_pulse
// Params 0, eflags: 0x0
// Checksum 0x7e85e4e, Offset: 0x5c0
// Size: 0x4c
function gadget_vision_pulse_ramp_hold_func() {
    self waittilltimeout(float(level.var_2e3031be.var_4d88a1ff) / 1000 - 0.35, #"ramp_out_visionset");
}

// Namespace gadget_vision_pulse/gadget_vision_pulse
// Params 2, eflags: 0x0
// Checksum 0xc2c8cdf3, Offset: 0x618
// Size: 0x13c
function gadget_vision_pulse_watch_death(slot, weapon) {
    self notify(#"vision_pulse_watch_death");
    self endon(#"vision_pulse_watch_death", #"disconnect");
    self waittill(#"death");
    self endon(#"shutdown_vision_pulse");
    if (isdefined(self._pulse_ent)) {
        self._pulse_ent delete();
        self ability_player::function_f2250880(weapon, 0);
    }
    slot = self gadgetgetslot(getweapon(#"gadget_vision_pulse"));
    self gadgetcharging(slot, 1);
    self flagsys::clear(#"gadget_vision_pulse_on");
    self globallogic_score::function_d3ca3608(#"hash_32591f4be1bf4f22");
}

// Namespace gadget_vision_pulse/gadget_vision_pulse
// Params 2, eflags: 0x0
// Checksum 0x1ba013cc, Offset: 0x760
// Size: 0xdc
function gadget_vision_pulse_watch_emp(slot, weapon) {
    self notify(#"vision_pulse_watch_emp");
    self endon(#"vision_pulse_watch_emp", #"disconnect", #"shutdown_vision_pulse");
    while (1) {
        if (self isempjammed()) {
            self notify(#"emp_vp_jammed");
            break;
        }
        waitframe(1);
    }
    if (isdefined(self._pulse_ent)) {
        self._pulse_ent delete();
    }
    self flagsys::clear(#"gadget_vision_pulse_on");
}

// Namespace gadget_vision_pulse/gadget_vision_pulse
// Params 0, eflags: 0x0
// Checksum 0x41df9623, Offset: 0x848
// Size: 0x12e
function function_46f384d5() {
    self notify(#"remote_control");
    self endon(#"remote_control", #"disconnect", #"death", #"shutdown_vision_pulse");
    while (1) {
        if (self isremotecontrolling() || self clientfield::get_to_player("remote_missile_screenfx") != 0) {
            self clientfield::set_to_player("toggle_postfx", 1);
            while (self isremotecontrolling() || self clientfield::get_to_player("remote_missile_screenfx") != 0) {
                waitframe(1);
            }
            self clientfield::set_to_player("toggle_postfx", 0);
        }
        waitframe(1);
    }
}

// Namespace gadget_vision_pulse/gadget_vision_pulse
// Params 2, eflags: 0x0
// Checksum 0xd7ecde3, Offset: 0x980
// Size: 0xf4
function gadget_vision_pulse_on(slot, weapon) {
    if (isdefined(self._pulse_ent)) {
        return;
    }
    self notify(#"vision_pulse_on");
    self flagsys::set(#"gadget_vision_pulse_on");
    self thread gadget_vision_pulse_start(slot, weapon);
    if (!(isdefined(level.var_e3049e92) && level.var_e3049e92)) {
        self thread function_46f384d5();
    }
    self thread gadget_vision_pulse_watch_death(slot, weapon);
    self thread gadget_vision_pulse_watch_emp(slot, weapon);
    self clientfield::set_to_player("vision_pulse_active", 1);
}

// Namespace gadget_vision_pulse/gadget_vision_pulse
// Params 2, eflags: 0x0
// Checksum 0xd273235, Offset: 0xa80
// Size: 0x1e
function gadget_vision_pulse_off(slot, weapon) {
    self.visionpulsekill = 0;
}

// Namespace gadget_vision_pulse/gadget_vision_pulse
// Params 2, eflags: 0x0
// Checksum 0x2c0b8575, Offset: 0xaa8
// Size: 0x3b4
function gadget_vision_pulse_start(slot, weapon) {
    self endon(#"disconnect", #"death", #"emp_vp_jammed", #"shutdown_vision_pulse", #"hash_7e581b90612825f4");
    wait(0.1);
    if (isdefined(self._pulse_ent)) {
        return;
    }
    self ability_player::function_c22f319e(weapon);
    self._pulse_ent = spawn("script_model", self.origin);
    self._pulse_ent setmodel(#"tag_origin");
    self gadgetsetentity(slot, self._pulse_ent);
    self gadgetsetactivatetime(slot, gettime());
    self set_gadget_vision_pulse_status("Activated");
    self.visionpulseactivatetime = gettime();
    enemyarray = level.players;
    visionpulsearray = arraysort(enemyarray, self._pulse_ent.origin, 1, undefined, weapon.gadget_pulse_max_range);
    self.var_1ad61d27 = weapon;
    self.visionpulseorigin = self._pulse_ent.origin;
    self.visionpulsearray = [];
    self.visionpulseoriginarray = [];
    spottedenemy = 0;
    self.visionpulsespottedenemy = [];
    self.visionpulsespottedenemytime = gettime();
    for (i = 0; i < visionpulsearray.size; i++) {
        self.visionpulsearray[self.visionpulsearray.size] = visionpulsearray[i];
        self.visionpulseoriginarray[self.visionpulseoriginarray.size] = visionpulsearray[i].origin;
        if (isalive(visionpulsearray[i]) && util::function_fbce7263(visionpulsearray[i].team, self.team)) {
            if (isdefined(level.var_fc3478b7)) {
                self [[ level.var_fc3478b7 ]](visionpulsearray[i]);
            }
            spottedenemy = 1;
            self.visionpulsespottedenemy[self.visionpulsespottedenemy.size] = visionpulsearray[i];
            visionpulsearray[i].lastvisionpulsedby = self;
            visionpulsearray[i].lastvisionpulsedtime = self.visionpulsespottedenemytime;
        }
    }
    if (isdefined(level.var_392ddea)) {
        self thread [[ level.var_392ddea ]]();
    }
    self thread function_19bef771(weapon);
    self wait_until_is_done(slot, self._gadgets_player[slot].gadget_pulse_duration);
    self shutdown_vision_pulse(spottedenemy, 0, weapon);
}

// Namespace gadget_vision_pulse/gadget_vision_pulse
// Params 3, eflags: 0x0
// Checksum 0x6772ed0d, Offset: 0xe68
// Size: 0x144
function shutdown_vision_pulse(spottedenemy, immediate, weapon) {
    self notify(#"vision_pulse_off");
    self.var_87b1ba00 = 0;
    if (!spottedenemy) {
        self playsoundtoplayer("gdt_vision_pulse_no_hits", self);
        self notify(#"ramp_out_visionset");
    }
    self set_gadget_vision_pulse_status("Done");
    self flagsys::clear(#"gadget_vision_pulse_on");
    self clientfield::set_to_player("vision_pulse_active", 0);
    self notify(#"remote_control");
    if (isdefined(self._pulse_ent)) {
        self._pulse_ent delete();
    }
    if (immediate) {
        self notify(#"hash_7e581b90612825f4");
        self ability_player::function_f2250880(weapon, 0);
    }
}

// Namespace gadget_vision_pulse/gadget_vision_pulse
// Params 1, eflags: 0x0
// Checksum 0xf6d9db9e, Offset: 0xfb8
// Size: 0x114
function function_19bef771(weapon) {
    self endon(#"death", #"shutdown_vision_pulse", #"hash_7e581b90612825f4");
    wait(float(weapon.var_4d88a1ff) / 1000);
    self disableoffhandweapons();
    self switchtooffhand(level.var_2e3031be);
    waitframe(1);
    self ability_player::function_f2250880(weapon, 0);
    played = 0;
    while (!played) {
        played = self gestures::function_b6cc48ed("ges_vision_pulse_deactivate", undefined, 1);
        waitframe(1);
    }
    self enableoffhandweapons();
}

// Namespace gadget_vision_pulse/gadget_vision_pulse
// Params 2, eflags: 0x0
// Checksum 0xfe4b58dd, Offset: 0x10d8
// Size: 0x84
function wait_until_is_done(slot, timepulse) {
    self endon(#"hash_7e581b90612825f4", #"shutdown_vision_pulse", #"death");
    wait(float(timepulse) / 1000);
    self globallogic_score::function_d3ca3608(#"hash_32591f4be1bf4f22");
}

// Namespace gadget_vision_pulse/gadget_vision_pulse
// Params 2, eflags: 0x0
// Checksum 0x6b513261, Offset: 0x1168
// Size: 0xec
function gadget_vision_pulse_flicker(slot, weapon) {
    self endon(#"disconnect");
    time = gettime();
    if (!self gadget_vision_pulse_is_inuse(slot)) {
        return;
    }
    eventtime = self._gadgets_player[slot].gadget_flickertime;
    self set_gadget_vision_pulse_status("^1" + "Flickering.", eventtime);
    while (1) {
        if (!self gadgetflickering(slot)) {
            set_gadget_vision_pulse_status("^2" + "Normal");
            return;
        }
        wait(0.25);
    }
}

// Namespace gadget_vision_pulse/gadget_vision_pulse
// Params 2, eflags: 0x0
// Checksum 0x52bfbed, Offset: 0x1260
// Size: 0x9c
function set_gadget_vision_pulse_status(status, time) {
    timestr = "";
    if (isdefined(time)) {
        timestr = "^3" + ", time: " + time;
    }
    if (getdvarint(#"scr_cpower_debug_prints", 0) > 0) {
        self iprintlnbold("Vision Pulse:" + status + timestr);
    }
}

