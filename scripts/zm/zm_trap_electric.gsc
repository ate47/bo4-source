// Atian COD Tools GSC decompiler test
#using scripts\core_common\ai\zombie_death.gsc;
#using scripts\zm_common\zm_traps.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_contracts.gsc;
#using scripts\core_common\status_effects\status_effect_util.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_trap_electric;

// Namespace zm_trap_electric/zm_trap_electric
// Params 0, eflags: 0x2
// Checksum 0x953042d3, Offset: 0x178
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_trap_electric", &__init__, undefined, undefined);
}

// Namespace zm_trap_electric/zm_trap_electric
// Params 0, eflags: 0x1 linked
// Checksum 0xc920cdd, Offset: 0x1c0
// Size: 0x180
function __init__() {
    zm_traps::register_trap_basic_info("electric", &trap_activate_electric, &trap_audio);
    zm_traps::register_trap_damage("electric", &player_damage, &damage);
    if (!isdefined(level.vsmgr_prio_overlay_zm_trap_electrified)) {
        level.vsmgr_prio_overlay_zm_trap_electrified = 60;
    }
    clientfield::register("actor", "electrocute_ai_fx", 1, 1, "int");
    a_traps = struct::get_array("trap_electric", "targetname");
    foreach (trap in a_traps) {
        clientfield::register("world", trap.script_noteworthy, 1, 1, "int");
    }
}

// Namespace zm_trap_electric/zm_trap_electric
// Params 0, eflags: 0x1 linked
// Checksum 0x539e5a6b, Offset: 0x348
// Size: 0x184
function trap_activate_electric() {
    self._trap_duration = 40;
    self._trap_cooldown_time = 60;
    if (isdefined(level.sndtrapfunc)) {
        level thread [[ level.sndtrapfunc ]](self, 1);
    }
    self notify(#"trap_activate");
    level notify(#"trap_activate", self);
    level clientfield::set(self.target, 1);
    fx_points = struct::get_array(self.target, "targetname");
    for (i = 0; i < fx_points.size; i++) {
        util::wait_network_frame();
        fx_points[i] thread trap_audio(self);
    }
    self thread zm_traps::trap_damage();
    self waittilltimeout(self._trap_duration, #"trap_deactivate");
    self notify(#"trap_done");
    level clientfield::set(self.target, 0);
}

// Namespace zm_trap_electric/zm_trap_electric
// Params 1, eflags: 0x1 linked
// Checksum 0xb4e515ba, Offset: 0x4d8
// Size: 0x114
function trap_audio(trap) {
    sound_origin = spawn("script_origin", self.origin);
    sound_origin playsound(#"hash_1fb395621513432f");
    sound_origin playloopsound(#"hash_177d7a6df8ed0d7b");
    self thread play_electrical_sound(trap);
    trap waittilltimeout(trap._trap_duration, #"trap_done");
    if (isdefined(sound_origin)) {
        playsoundatposition(#"hash_3819c6cd06a27f15", sound_origin.origin);
        sound_origin stoploopsound();
        waitframe(1);
        sound_origin delete();
    }
}

// Namespace zm_trap_electric/zm_trap_electric
// Params 1, eflags: 0x1 linked
// Checksum 0xb7591ba1, Offset: 0x5f8
// Size: 0x78
function play_electrical_sound(trap) {
    trap endon(#"trap_done");
    while (1) {
        wait(randomfloatrange(0.1, 0.5));
        playsoundatposition(#"hash_6b9160d5f97e5ecb", self.origin);
    }
}

// Namespace zm_trap_electric/zm_trap_electric
// Params 1, eflags: 0x1 linked
// Checksum 0x3c953b78, Offset: 0x678
// Size: 0x84
function player_damage(trigger) {
    shock_status_effect = getstatuseffect(#"hash_19533caf858a9f3b");
    if (!(isdefined(self.b_no_trap_damage) && self.b_no_trap_damage)) {
        self thread zm_traps::player_elec_damage(trigger);
        status_effect::status_effect_apply(shock_status_effect, undefined, self, 0);
    }
}

// Namespace zm_trap_electric/zm_trap_electric
// Params 1, eflags: 0x1 linked
// Checksum 0xf8e84d31, Offset: 0x708
// Size: 0x474
function damage(trap) {
    if (isdefined(self.marked_for_death) && self.marked_for_death) {
        return;
    }
    self endon(#"death");
    self clientfield::set("electrocute_ai_fx", 1);
    n_param = randomint(100);
    self.marked_for_death = 1;
    if (isdefined(trap.activated_by_player) && isplayer(trap.activated_by_player)) {
        trap.activated_by_player zm_stats::increment_challenge_stat(#"zombie_hunter_kill_trap");
        trap.activated_by_player contracts::increment_zm_contract(#"contract_zm_trap_kills");
        if (isdefined(trap.activated_by_player.var_a8049e3d)) {
            trap.activated_by_player.var_a8049e3d++;
            trap.activated_by_player notify(#"zombie_zapped");
        }
    }
    if (!(self.archetype === #"zombie_dog") && isactor(self)) {
        if (n_param > 90 && level.burning_zombies.size < 6) {
            level.burning_zombies[level.burning_zombies.size] = self;
            self thread zm_traps::zombie_flame_watch();
            self playsound(#"hash_5183b687ad8d715a");
            self thread zombie_death::flame_death_fx();
            playfxontag(level._effect[#"character_fire_death_torso"], self, "J_SpineLower");
            wait(randomfloat(1.25));
        } else {
            refs[0] = "guts";
            refs[1] = "right_arm";
            refs[2] = "left_arm";
            refs[3] = "right_leg";
            refs[4] = "left_leg";
            refs[5] = "no_legs";
            refs[6] = "head";
            self.a.gib_ref = refs[randomint(refs.size)];
            playsoundatposition(#"hash_5183b687ad8d715a", self.origin);
            if (randomint(100) > 50) {
                self thread zm_traps::electroctute_death_fx();
            }
            bhtnactionstartevent(self, "electrocute");
            self notify(#"bhtn_action_notify", {#action:"electrocute"});
            wait(randomfloat(1.25));
            self playsound(#"hash_5183b687ad8d715a");
        }
    }
    if (isdefined(self.var_5475b4ad)) {
        self [[ self.var_5475b4ad ]](trap);
    } else {
        level notify(#"trap_kill", {#trap:trap, #victim:self});
        self dodamage(self.health + 666, self.origin, trap);
    }
}

