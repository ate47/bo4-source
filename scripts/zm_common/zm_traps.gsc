#using script_2f9a68261f6a17be;
#using script_301f64a4090c381a;
#using scripts\core_common\ai\zombie_death;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\laststand_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\trigger_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\visionset_mgr_shared;
#using scripts\zm_common\trials\zm_trial_disable_buys;
#using scripts\zm_common\util;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_bgb;
#using scripts\zm_common\zm_contracts;
#using scripts\zm_common\zm_customgame;
#using scripts\zm_common\zm_laststand;
#using scripts\zm_common\zm_net;
#using scripts\zm_common\zm_score;
#using scripts\zm_common\zm_stats;
#using scripts\zm_common\zm_utility;

#namespace zm_traps;

// Namespace zm_traps/zm_traps
// Params 0, eflags: 0x2
// Checksum 0x6ecdbd56, Offset: 0x3b8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_traps", &__init__, &__main__, undefined);
}

// Namespace zm_traps/zm_traps
// Params 0, eflags: 0x1 linked
// Checksum 0x9a67f62c, Offset: 0x408
// Size: 0x5c
function __init__() {
    level.trap_kills = 0;
    if (!isdefined(level._custom_traps)) {
        level._custom_traps = [];
    }
    level.burning_zombies = [];
    callback::on_finalize_initialization(&init);
}

// Namespace zm_traps/zm_traps
// Params 0, eflags: 0x1 linked
// Checksum 0xf3210b14, Offset: 0x470
// Size: 0x74
function init() {
    if (!zm_custom::function_901b751c(#"zmtrapsenabled")) {
        return;
    }
    traps = getentarray("zombie_trap", "targetname");
    array::thread_all(traps, &trap_init);
}

// Namespace zm_traps/zm_traps
// Params 0, eflags: 0x1 linked
// Checksum 0xfb4a90ed, Offset: 0x4f0
// Size: 0x74
function __main__() {
    if (!zm_custom::function_901b751c(#"zmtrapsenabled")) {
        return;
    }
    traps = getentarray("zombie_trap", "targetname");
    array::thread_all(traps, &trap_main);
}

// Namespace zm_traps/zm_traps
// Params 0, eflags: 0x1 linked
// Checksum 0xa2861bd6, Offset: 0x570
// Size: 0x6ec
function trap_init() {
    self flag::init("flag_active");
    self flag::init("flag_cooldown");
    self._trap_type = "";
    if (isdefined(self.script_noteworthy)) {
        self._trap_type = self.script_noteworthy;
        if (isdefined(level._custom_traps) && isdefined(level._custom_traps[self.script_noteworthy]) && isdefined(level._custom_traps[self.script_noteworthy].activate)) {
            self._trap_activate_func = level._custom_traps[self.script_noteworthy].activate;
        } else {
            switch (self.script_noteworthy) {
            case #"rotating":
                self._trap_activate_func = &trap_activate_rotating;
                break;
            case #"flipper":
                self._trap_activate_func = &trap_activate_flipper;
                break;
            default:
                self._trap_activate_func = &trap_activate_fire;
                break;
            }
        }
        if (isdefined(level._zombiemode_trap_use_funcs) && isdefined(level._zombiemode_trap_use_funcs[self._trap_type])) {
            self._trap_use_func = level._zombiemode_trap_use_funcs[self._trap_type];
        } else {
            self._trap_use_func = &trap_use_think;
        }
    }
    self trap_model_type_init();
    self._trap_use_trigs = [];
    self._trap_lights = [];
    self._trap_movers = [];
    self._trap_switches = [];
    components = getentarray(self.target, "targetname");
    for (i = 0; i < components.size; i++) {
        if (isdefined(components[i].script_noteworthy)) {
            switch (components[i].script_noteworthy) {
            case #"counter_1s":
                self.counter_1s = components[i];
                continue;
            case #"counter_10s":
                self.counter_10s = components[i];
                continue;
            case #"counter_100s":
                self.counter_100s = components[i];
                continue;
            case #"mover":
                self._trap_movers[self._trap_movers.size] = components[i];
                continue;
            case #"switch":
                self._trap_switches[self._trap_switches.size] = components[i];
                continue;
            case #"light":
                self._trap_lights[self._trap_lights.size] = components[i];
                continue;
            }
        }
        if (isdefined(components[i].script_string)) {
            switch (components[i].script_string) {
            case #"flipper1":
                self.flipper1 = components[i];
                continue;
            case #"flipper2":
                self.flipper2 = components[i];
                continue;
            case #"flipper1_radius_check":
                self.flipper1_radius_check = components[i];
                continue;
            case #"flipper2_radius_check":
                self.flipper2_radius_check = components[i];
                continue;
            case #"target1":
                self.target1 = components[i];
                continue;
            case #"target2":
                self.target2 = components[i];
                continue;
            case #"target3":
                self.target3 = components[i];
                continue;
            }
        }
        switch (components[i].classname) {
        case #"trigger_use_new":
        case #"trigger_use":
            self._trap_use_trigs[self._trap_use_trigs.size] = components[i];
            components[i]._trap = self;
            break;
        case #"script_model":
            if (components[i].model == self._trap_light_model_off) {
                self._trap_lights[self._trap_lights.size] = components[i];
            } else if (components[i].model == self._trap_switch_model) {
                self._trap_switches[self._trap_switches.size] = components[i];
            }
            break;
        }
    }
    self._trap_fx_structs = [];
    components = struct::get_array(self.target, "targetname");
    for (i = 0; i < components.size; i++) {
        if (isdefined(components[i].script_string) && components[i].script_string == "use_this_angle") {
            self.use_this_angle = components[i];
            continue;
        }
        self._trap_fx_structs[self._trap_fx_structs.size] = components[i];
    }
    if (!isdefined(self.zombie_cost)) {
        self.zombie_cost = 1000;
    }
    self._trap_in_use = 0;
    self thread trap_dialog();
}

// Namespace zm_traps/zm_traps
// Params 0, eflags: 0x1 linked
// Checksum 0xadbca405, Offset: 0xc68
// Size: 0x28e
function trap_main() {
    level flag::wait_till("start_zombie_round_logic");
    for (i = 0; i < self._trap_use_trigs.size; i++) {
        self._trap_use_trigs[i] setcursorhint("HINT_NOICON");
    }
    if (!isdefined(self.script_string) || "disable_wait_for_power" != self.script_string) {
        self trap_set_string(#"zombie/need_power");
        if (isdefined(self.script_int) && level flag::exists("power_on" + self.script_int)) {
            level flag::wait_till("power_on" + self.script_int);
        } else {
            level flag::wait_till("power_on");
        }
    }
    if (isdefined(self.script_flag_wait)) {
        self trap_set_string("");
        self triggerenable(0);
        self trap_lights_red();
        if (!level flag::exists(self.script_flag_wait)) {
            level flag::init(self.script_flag_wait);
        }
        level flag::wait_till(self.script_flag_wait);
        self triggerenable(1);
    }
    self.var_b3166dc1 = 1;
    self function_783f63e9();
    for (i = 0; i < self._trap_use_trigs.size; i++) {
        self._trap_use_trigs[i] thread [[ self._trap_use_func ]](self);
        self._trap_use_trigs[i] thread update_trigger_visibility();
    }
}

// Namespace zm_traps/zm_traps
// Params 1, eflags: 0x1 linked
// Checksum 0x59a2245b, Offset: 0xf00
// Size: 0x1cc
function function_783f63e9(var_1c9c3123 = 1) {
    if (zm_trial_disable_buys::is_active()) {
        self trap_set_string(#"hash_55d25caf8f7bbb2f");
        return;
    }
    if (isdefined(self.var_fc36786e) && self.var_fc36786e || isdefined(level.var_4f7df1ac) && level.var_4f7df1ac) {
        self trap_set_string(#"zombie/trap_locked");
        return;
    }
    if (zm_utility::is_standard() || namespace_b28d86fd::is_active()) {
        cheat_too_friendly_s_ = zm_utility::function_d6046228(#"hash_24a438482954901", #"hash_61d85c966dd9e83f");
        self trap_set_string(cheat_too_friendly_s_);
        if (var_1c9c3123) {
            self trap_lights_green();
        }
        return;
    }
    cheat_too_friendly_s_ = zm_utility::function_d6046228(#"hash_23c1c09e94181fdb", #"hash_6e8ef1b690e98e51");
    self trap_set_string(cheat_too_friendly_s_, self.zombie_cost);
    if (var_1c9c3123) {
        self trap_lights_green();
    }
}

// Namespace zm_traps/zm_traps
// Params 1, eflags: 0x1 linked
// Checksum 0xf88442bc, Offset: 0x10d8
// Size: 0x148
function trap_use_think(trap) {
    while (true) {
        waitresult = self waittill(#"trigger");
        e_player = waitresult.activator;
        if (!zm_utility::can_use(e_player)) {
            continue;
        }
        if (isdefined(self.var_fc36786e) && self.var_fc36786e || isdefined(level.var_4f7df1ac) && level.var_4f7df1ac || zm_trial_disable_buys::is_active()) {
            continue;
        }
        if (zm_utility::is_player_valid(e_player) && !trap._trap_in_use) {
            b_purchased = self trap_purchase(e_player, trap.zombie_cost);
            if (!b_purchased) {
                continue;
            }
            trap_activate(trap, e_player);
        }
    }
}

// Namespace zm_traps/zm_traps
// Params 2, eflags: 0x1 linked
// Checksum 0x2c9baa38, Offset: 0x1228
// Size: 0xb8
function trap_purchase(e_player, n_cost) {
    if (namespace_b28d86fd::is_active()) {
        return 1;
    }
    if (e_player zm_score::can_player_purchase(n_cost)) {
        e_player zm_score::minus_to_player_score(n_cost);
        return 1;
    }
    self playsound(#"zmb_trap_deny");
    e_player zm_audio::create_and_play_dialog(#"general", #"outofmoney");
    return 0;
}

// Namespace zm_traps/zm_traps
// Params 2, eflags: 0x1 linked
// Checksum 0xdee464, Offset: 0x12e8
// Size: 0x2c4
function trap_activate(trap, who) {
    trap.activated_by_player = who;
    trap._trap_in_use = 1;
    trap trap_set_string(#"zombie/trap_active");
    if (isdefined(who)) {
        zm_utility::play_sound_at_pos("purchase", who.origin);
        if (isdefined(trap._trap_type)) {
            who zm_audio::create_and_play_dialog(#"trap_activate", trap._trap_type);
        }
        level notify(#"trap_activated", {#trap_activator:who, #trap:trap});
    }
    if (isarray(trap._trap_switches) && trap._trap_switches.size) {
        trap thread trap_move_switches();
        trap waittill(#"switch_activated");
    }
    trap triggerenable(1);
    trap thread [[ trap._trap_activate_func ]]();
    trap waittill(#"trap_done");
    trap triggerenable(0);
    trap trap_set_string(#"zombie/trap_cooldown");
    /#
        if (getdvarint(#"zombie_cheat", 0) >= 1) {
            trap._trap_cooldown_time = 5;
        }
    #/
    n_cooldown = function_da13db45(trap._trap_cooldown_time, who);
    wait n_cooldown;
    playsoundatposition(#"zmb_trap_ready", trap.origin);
    if (isdefined(level.sndtrapfunc)) {
        level thread [[ level.sndtrapfunc ]](trap, 0);
    }
    trap notify(#"available");
    trap._trap_in_use = 0;
    trap function_783f63e9();
}

// Namespace zm_traps/zm_traps
// Params 0, eflags: 0x5 linked
// Checksum 0x51523eb6, Offset: 0x15b8
// Size: 0x11c
function private update_trigger_visibility() {
    self endon(#"death");
    while (true) {
        foreach (player in getplayers()) {
            if (distancesquared(player.origin, self.origin) < 16384) {
                if (player zm_utility::is_drinking()) {
                    self setinvisibletoplayer(player, 1);
                    continue;
                }
                self setinvisibletoplayer(player, 0);
            }
        }
        wait 0.25;
    }
}

// Namespace zm_traps/zm_traps
// Params 0, eflags: 0x1 linked
// Checksum 0xb0f02932, Offset: 0x16e0
// Size: 0x10e
function trap_lights_red() {
    if (isdefined(level._custom_traps[self._trap_type]) && isdefined(level._custom_traps[self._trap_type].var_75734507)) {
        self [[ level._custom_traps[self._trap_type].var_75734507 ]]();
        return;
    }
    for (i = 0; i < self._trap_lights.size; i++) {
        light = self._trap_lights[i];
        str_light_red = light.targetname + "_red";
        str_light_green = light.targetname + "_green";
        exploder::kill_exploder(str_light_green);
        exploder::exploder(str_light_red);
    }
}

// Namespace zm_traps/zm_traps
// Params 0, eflags: 0x1 linked
// Checksum 0x2d8e6288, Offset: 0x17f8
// Size: 0x136
function trap_lights_green() {
    if (isdefined(level._custom_traps) && isdefined(level._custom_traps[self._trap_type]) && isdefined(level._custom_traps[self._trap_type].var_53d35f37)) {
        self [[ level._custom_traps[self._trap_type].var_53d35f37 ]]();
        return;
    }
    for (i = 0; i < self._trap_lights.size; i++) {
        light = self._trap_lights[i];
        if (isdefined(light.var_1cc6f364)) {
            continue;
        }
        str_light_red = light.targetname + "_red";
        str_light_green = light.targetname + "_green";
        exploder::kill_exploder(str_light_red);
        exploder::exploder(str_light_green);
    }
}

// Namespace zm_traps/zm_traps
// Params 3, eflags: 0x1 linked
// Checksum 0x4a687746, Offset: 0x1938
// Size: 0xe6
function trap_set_string(string, param1, param2) {
    if (isdefined(self) && isdefined(self._trap_use_trigs)) {
        for (i = 0; i < self._trap_use_trigs.size; i++) {
            if (!isdefined(param1)) {
                self._trap_use_trigs[i] sethintstring(string);
                continue;
            }
            if (!isdefined(param2)) {
                self._trap_use_trigs[i] sethintstring(string, param1);
                continue;
            }
            self._trap_use_trigs[i] sethintstring(string, param1, param2);
        }
    }
}

// Namespace zm_traps/zm_traps
// Params 0, eflags: 0x1 linked
// Checksum 0x96b5c5a5, Offset: 0x1a28
// Size: 0x1fc
function trap_move_switches() {
    self trap_lights_red();
    for (i = 0; i < self._trap_switches.size; i++) {
        self._trap_switches[i] rotatepitch(180, 0.5);
        if (isdefined(self._trap_type) && self._trap_type == "fire") {
            self._trap_switches[i] playsound(#"evt_switch_flip_trap_fire");
            continue;
        }
        self._trap_switches[i] playsound(#"evt_switch_flip_trap");
    }
    self._trap_switches[0] waittill(#"rotatedone");
    self notify(#"switch_activated");
    self waittill(#"available");
    for (i = 0; i < self._trap_switches.size; i++) {
        self._trap_switches[i] rotatepitch(-180, 0.5);
    }
    self._trap_switches[0] waittill(#"rotatedone");
    if (!(isdefined(self.var_fc36786e) && self.var_fc36786e) && !(isdefined(level.var_4f7df1ac) && level.var_4f7df1ac)) {
        self trap_lights_green();
    }
}

// Namespace zm_traps/zm_traps
// Params 0, eflags: 0x1 linked
// Checksum 0xa2aca792, Offset: 0x1c30
// Size: 0xce
function trap_activate_fire() {
    self._trap_duration = 40;
    self._trap_cooldown_time = 60;
    fx_points = struct::get_array(self.target, "targetname");
    for (i = 0; i < fx_points.size; i++) {
        util::wait_network_frame();
        fx_points[i] thread trap_audio_fx(self);
    }
    self thread trap_damage();
    wait self._trap_duration;
    self notify(#"trap_done");
}

// Namespace zm_traps/zm_traps
// Params 0, eflags: 0x1 linked
// Checksum 0x5355520e, Offset: 0x1d08
// Size: 0x22e
function trap_activate_rotating() {
    self endon(#"trap_done");
    self._trap_duration = 30;
    self._trap_cooldown_time = 60;
    self thread trap_damage();
    self thread trig_update(self._trap_movers[0]);
    old_angles = self._trap_movers[0].angles;
    for (i = 0; i < self._trap_movers.size; i++) {
        self._trap_movers[i] rotateyaw(360, 5, 4.5);
    }
    wait 5;
    step = 1.5;
    for (t = 0; t < self._trap_duration; t += step) {
        for (i = 0; i < self._trap_movers.size; i++) {
            self._trap_movers[i] rotateyaw(360, step);
        }
        wait step;
    }
    for (i = 0; i < self._trap_movers.size; i++) {
        self._trap_movers[i] rotateyaw(360, 5, 0, 4.5);
    }
    wait 5;
    for (i = 0; i < self._trap_movers.size; i++) {
        self._trap_movers[i].angles = old_angles;
    }
    self notify(#"trap_done");
}

// Namespace zm_traps/zm_traps
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x1f40
// Size: 0x4
function trap_activate_flipper() {
    
}

// Namespace zm_traps/zm_traps
// Params 1, eflags: 0x1 linked
// Checksum 0x4870f455, Offset: 0x1f50
// Size: 0x11c
function trap_audio_fx(trap) {
    if (isdefined(level._custom_traps) && isdefined(level._custom_traps[trap.script_noteworthy]) && isdefined(level._custom_traps[trap.script_noteworthy].audio)) {
        self [[ level._custom_traps[trap.script_noteworthy].audio ]](trap);
        return;
    }
    sound_origin = undefined;
    trap waittilltimeout(trap._trap_duration, #"trap_done");
    if (isdefined(sound_origin)) {
        playsoundatposition(#"wpn_zmb_electrap_stop", sound_origin.origin);
        sound_origin stoploopsound();
        waitframe(1);
        sound_origin delete();
    }
}

// Namespace zm_traps/zm_traps
// Params 0, eflags: 0x1 linked
// Checksum 0xb01a6574, Offset: 0x2078
// Size: 0x38e
function trap_damage() {
    self endon(#"trap_done");
    while (true) {
        waitresult = self waittill(#"trigger");
        ent = waitresult.activator;
        if (isplayer(ent)) {
            if (self function_3f401e8d(ent)) {
                continue;
            }
            if (isdefined(level._custom_traps) && isdefined(level._custom_traps[self._trap_type]) && isdefined(level._custom_traps[self._trap_type].player_damage)) {
                ent thread [[ level._custom_traps[self._trap_type].player_damage ]](self);
            } else {
                switch (self._trap_type) {
                case #"rocket":
                    ent thread player_fire_damage();
                    break;
                case #"rotating":
                    if (ent getstance() == "stand") {
                        ent dodamage(50, ent.origin + (0, 0, 20));
                        ent setstance("crouch");
                    }
                    break;
                }
            }
            if (ent.health <= 1 && !(isdefined(ent.var_acc576f0) && ent.var_acc576f0)) {
                ent thread function_783361ed(self);
            }
            continue;
        }
        if (!isdefined(ent.marked_for_death)) {
            if (isdefined(level._custom_traps) && isdefined(level._custom_traps[self._trap_type]) && isdefined(level._custom_traps[self._trap_type].damage)) {
                ent thread [[ level._custom_traps[self._trap_type].damage ]](self);
                continue;
            }
            switch (self._trap_type) {
            case #"rocket":
                ent thread zombie_trap_death(self, 100);
                break;
            case #"rotating":
                ent thread zombie_trap_death(self, 200);
                break;
            case #"werewolfer":
                ent thread zombie_trap_death(self, 100);
                break;
            default:
                ent thread zombie_trap_death(self, randomint(100));
                break;
            }
        }
    }
}

// Namespace zm_traps/zm_traps
// Params 1, eflags: 0x1 linked
// Checksum 0xfead2b70, Offset: 0x2410
// Size: 0xaa
function function_783361ed(e_trap) {
    self endon(#"disconnect");
    self.var_acc576f0 = 1;
    level notify(#"trap_downed_player", {#e_victim:self, #e_trap:e_trap});
    while (isalive(self) && self laststand::player_is_in_laststand()) {
        waitframe(1);
    }
    self.var_acc576f0 = undefined;
}

// Namespace zm_traps/zm_traps
// Params 1, eflags: 0x1 linked
// Checksum 0x2f2c78e6, Offset: 0x24c8
// Size: 0x58
function trig_update(parent) {
    self endon(#"trap_done");
    start_angles = self.angles;
    while (true) {
        self.angles = parent.angles;
        waitframe(1);
    }
}

// Namespace zm_traps/zm_traps
// Params 1, eflags: 0x1 linked
// Checksum 0x6bc3b69c, Offset: 0x2528
// Size: 0x1a2
function player_elec_damage(trigger) {
    self endon(#"death", #"disconnect");
    if (!isdefined(level.elec_loop)) {
        level.elec_loop = 0;
    }
    if (!(isdefined(self.is_burning) && self.is_burning) && zm_utility::is_player_valid(self)) {
        self.is_burning = 1;
        shocktime = 2.5;
        if (isdefined(level.str_elec_damage_shellshock_override)) {
            str_elec_shellshock = level.str_elec_damage_shellshock_override;
        } else {
            str_elec_shellshock = "electrocution";
        }
        self shellshock(str_elec_shellshock, shocktime);
        self playrumbleonentity("damage_heavy");
        self playsound(#"hash_5af2a9d11f007b9");
        if (zm_utility::is_standard()) {
            self dodamage(50, self.origin, undefined, trigger);
        } else {
            self dodamage(150, self.origin, undefined, trigger);
        }
        wait 1;
        self.is_burning = undefined;
    }
}

// Namespace zm_traps/zm_traps
// Params 0, eflags: 0x1 linked
// Checksum 0xdda51b7e, Offset: 0x26d8
// Size: 0x196
function player_fire_damage() {
    self endon(#"death", #"disconnect");
    if (!(isdefined(self.is_burning) && self.is_burning) && !self laststand::player_is_in_laststand()) {
        self.is_burning = 1;
        if (isdefined(level.trap_fire_visionset_registered) && level.trap_fire_visionset_registered) {
            visionset_mgr::activate("overlay", "zm_trap_burn", self, 1.25, 1.25);
        } else {
            self setburn(1.25);
        }
        self notify(#"burned");
        if (!self hasperk(#"specialty_armorvest") || self.health - 100 < 1) {
            radiusdamage(self.origin, 10, self.health + 100, self.health + 100);
            self.is_burning = undefined;
            return;
        }
        self dodamage(50, self.origin);
        wait 0.1;
        self.is_burning = undefined;
    }
}

// Namespace zm_traps/zm_traps
// Params 2, eflags: 0x1 linked
// Checksum 0xdd4d9553, Offset: 0x2878
// Size: 0x4cc
function zombie_trap_death(e_trap, param) {
    self endon(#"death");
    self.marked_for_death = 1;
    switch (e_trap._trap_type) {
    case #"rocket":
        if (isdefined(self.animname) && self.animname != "zombie_dog") {
            if (param > 90 && level.burning_zombies.size < 6) {
                level.burning_zombies[level.burning_zombies.size] = self;
                self thread zombie_flame_watch();
                self playsound(#"zmb_ignite");
                self thread zombie_death::flame_death_fx();
                playfxontag(level._effect[#"character_fire_death_torso"], self, "J_SpineLower");
                wait randomfloat(1.25);
            } else {
                refs[0] = "guts";
                refs[1] = "right_arm";
                refs[2] = "left_arm";
                refs[3] = "right_leg";
                refs[4] = "left_leg";
                refs[5] = "no_legs";
                refs[6] = "head";
                self.a.gib_ref = refs[randomint(refs.size)];
                playsoundatposition(#"wpn_zmb_electrap_zap", self.origin);
                wait randomfloat(1.25);
                self playsound(#"wpn_zmb_electrap_zap");
            }
        }
        if (isdefined(self.var_5475b4ad)) {
            self [[ self.var_5475b4ad ]](e_trap);
        } else {
            level notify(#"trap_kill", {#e_victim:self, #e_trap:e_trap});
            self dodamage(self.health + 666, self.origin, e_trap);
        }
        break;
    case #"rotating":
    case #"centrifuge":
        ang = vectortoangles(e_trap.origin - self.origin);
        direction_vec = vectorscale(anglestoright(ang), param);
        if (isdefined(self.var_d89f2f98)) {
            self [[ self.var_d89f2f98 ]](e_trap);
        }
        level notify(#"trap_kill", {#e_victim:self, #e_trap:e_trap});
        self startragdoll();
        self launchragdoll(direction_vec);
        util::wait_network_frame();
        self.a.gib_ref = "head";
        self dodamage(self.health, self.origin, e_trap);
        break;
    }
    if (isdefined(e_trap.activated_by_player) && isplayer(e_trap.activated_by_player)) {
        e_trap.activated_by_player zm_stats::increment_challenge_stat(#"zombie_hunter_kill_trap");
        e_trap.activated_by_player contracts::increment_zm_contract(#"contract_zm_trap_kills");
    }
}

// Namespace zm_traps/zm_traps
// Params 0, eflags: 0x1 linked
// Checksum 0x36eff0be, Offset: 0x2d50
// Size: 0x54
function zombie_flame_watch() {
    self waittill(#"death");
    if (isdefined(self)) {
        self stoploopsound();
        arrayremovevalue(level.burning_zombies, self);
    }
}

// Namespace zm_traps/zm_traps
// Params 0, eflags: 0x0
// Checksum 0x3fb8e0e1, Offset: 0x2db0
// Size: 0x8c
function play_elec_vocals() {
    if (isdefined(self)) {
        org = self.origin;
        wait 0.15;
        playsoundatposition(#"zmb_elec_vocals", org);
        playsoundatposition(#"wpn_zmb_electrap_zap", org);
        playsoundatposition(#"zmb_exp_jib_zombie", org);
    }
}

// Namespace zm_traps/zm_traps
// Params 0, eflags: 0x1 linked
// Checksum 0x206048c6, Offset: 0x2e48
// Size: 0x324
function electroctute_death_fx() {
    self endon(#"death");
    if (isdefined(self.is_electrocuted) && self.is_electrocuted) {
        return;
    }
    self.is_electrocuted = 1;
    self thread electrocute_timeout();
    if (self.team == level.zombie_team) {
        level.bconfiretime = gettime();
        level.bconfireorg = self.origin;
    }
    if (isdefined(level._effect[#"elec_torso"])) {
        playfxontag(level._effect[#"elec_torso"], self, "J_SpineLower");
    }
    self playsound(#"zmb_elec_jib_zombie");
    wait 1;
    tagarray = [];
    tagarray[0] = "J_Elbow_LE";
    tagarray[1] = "J_Elbow_RI";
    tagarray[2] = "J_Knee_RI";
    tagarray[3] = "J_Knee_LE";
    tagarray = array::randomize(tagarray);
    if (isdefined(level._effect[#"elec_md"])) {
        playfxontag(level._effect[#"elec_md"], self, tagarray[0]);
    }
    self playsound(#"zmb_elec_jib_zombie");
    wait 1;
    self playsound(#"zmb_elec_jib_zombie");
    tagarray[0] = "J_Wrist_RI";
    tagarray[1] = "J_Wrist_LE";
    if (!isdefined(self.a.gib_ref) || self.a.gib_ref != "no_legs") {
        tagarray[2] = "J_Ankle_RI";
        tagarray[3] = "J_Ankle_LE";
    }
    tagarray = array::randomize(tagarray);
    if (isdefined(level._effect[#"elec_sm"])) {
        playfxontag(level._effect[#"elec_sm"], self, tagarray[0]);
        playfxontag(level._effect[#"elec_sm"], self, tagarray[1]);
    }
}

// Namespace zm_traps/zm_traps
// Params 0, eflags: 0x1 linked
// Checksum 0xe369b877, Offset: 0x3178
// Size: 0x96
function electrocute_timeout() {
    self endon(#"death");
    self playloopsound(#"amb_fire_manager_0");
    wait 12;
    self stoploopsound();
    if (isdefined(self) && isalive(self)) {
        self.is_electrocuted = 0;
        self notify(#"stop_flame_damage");
    }
}

// Namespace zm_traps/zm_traps
// Params 0, eflags: 0x1 linked
// Checksum 0xd1c1d2e5, Offset: 0x3218
// Size: 0x1a4
function trap_dialog() {
    self endon(#"warning_dialog");
    level endon(#"switch_flipped");
    timer = 0;
    while (true) {
        wait 0.5;
        players = getplayers();
        for (i = 0; i < players.size; i++) {
            if (!isdefined(players[i])) {
                continue;
            }
            dist = distancesquared(players[i].origin, self.origin);
            if (dist > 4900) {
                timer = 0;
                continue;
            }
            if (dist < 4900 && timer < 3) {
                wait 0.5;
                timer++;
            }
            if (!isdefined(players[i])) {
                continue;
            }
            if (dist < 4900 && timer == 3) {
                index = zm_utility::get_player_index(players[i]);
                plr = "plr_" + index + "_";
                wait 3;
                self notify(#"warning_dialog");
            }
        }
    }
}

// Namespace zm_traps/zm_traps
// Params 1, eflags: 0x0
// Checksum 0x2d2dccb5, Offset: 0x33c8
// Size: 0xa2
function get_trap_array(trap_type) {
    ents = getentarray("zombie_trap", "targetname");
    traps = [];
    for (i = 0; i < ents.size; i++) {
        if (ents[i].script_noteworthy == trap_type) {
            traps[traps.size] = ents[i];
        }
    }
    return traps;
}

// Namespace zm_traps/zm_traps
// Params 1, eflags: 0x1 linked
// Checksum 0xe26889a8, Offset: 0x3478
// Size: 0x174
function trap_disable(var_ccf895cc = #"zombie/trap_locked") {
    if (!(isdefined(self.var_b3166dc1) && self.var_b3166dc1)) {
        return;
    }
    cooldown = self._trap_cooldown_time;
    if (self._trap_in_use) {
        self notify(#"trap_done");
        self notify(#"trap_finished");
        self._trap_cooldown_time = 0.05;
        self waittill(#"available");
    }
    if (isarray(self._trap_use_trigs)) {
        foreach (t_trap in self._trap_use_trigs) {
            t_trap.var_fc36786e = 1;
        }
    }
    self trap_lights_red();
    self._trap_cooldown_time = cooldown;
    self trap_set_string(var_ccf895cc);
}

// Namespace zm_traps/zm_traps
// Params 2, eflags: 0x1 linked
// Checksum 0x8693f90d, Offset: 0x35f8
// Size: 0x144
function trap_enable(var_f9afc2b3 = #"hash_23c1c09e94181fdb", var_b8c50025 = #"hash_6e8ef1b690e98e51") {
    if (!(isdefined(self.var_b3166dc1) && self.var_b3166dc1)) {
        return;
    }
    if (isarray(self._trap_use_trigs)) {
        foreach (t_trap in self._trap_use_trigs) {
            t_trap.var_fc36786e = undefined;
        }
    }
    str_text = zm_utility::function_d6046228(var_f9afc2b3, var_b8c50025);
    self trap_set_string(str_text, self.zombie_cost);
    self trap_lights_green();
}

// Namespace zm_traps/zm_traps
// Params 1, eflags: 0x1 linked
// Checksum 0x8ff2715, Offset: 0x3748
// Size: 0xd6
function function_6966417b(var_ccf895cc = #"zombie/trap_locked") {
    a_t_traps = getentarray("zombie_trap", "targetname");
    foreach (t_trap in a_t_traps) {
        t_trap thread trap_disable(var_ccf895cc);
    }
    level.var_4f7df1ac = 1;
}

// Namespace zm_traps/zm_traps
// Params 2, eflags: 0x1 linked
// Checksum 0x8913546e, Offset: 0x3828
// Size: 0xf2
function function_9d0c9706(var_f9afc2b3 = #"hash_23c1c09e94181fdb", var_b8c50025 = #"hash_6e8ef1b690e98e51") {
    a_t_traps = getentarray("zombie_trap", "targetname");
    foreach (t_trap in a_t_traps) {
        t_trap thread trap_enable(var_f9afc2b3, var_b8c50025);
    }
    level.var_4f7df1ac = undefined;
}

// Namespace zm_traps/zm_traps
// Params 0, eflags: 0x1 linked
// Checksum 0x665f5053, Offset: 0x3928
// Size: 0xf2
function trap_model_type_init() {
    if (!isdefined(self.script_parameters)) {
        self.script_parameters = "default";
    }
    switch (self.script_parameters) {
    case #"pentagon_electric":
        self._trap_light_model_off = "zombie_trap_switch_light";
        self._trap_light_model_green = "zombie_trap_switch_light_on_green";
        self._trap_light_model_red = "zombie_trap_switch_light_on_red";
        self._trap_switch_model = "zombie_trap_switch_handle";
        break;
    case #"default":
    default:
        self._trap_light_model_off = "zombie_zapper_cagelight";
        self._trap_light_model_green = "zombie_zapper_cagelight";
        self._trap_light_model_red = "zombie_zapper_cagelight";
        self._trap_switch_model = "zombie_zapper_handle";
        break;
    }
}

// Namespace zm_traps/zm_traps
// Params 1, eflags: 0x1 linked
// Checksum 0x2fcfdb60, Offset: 0x3a28
// Size: 0x24c
function function_3f401e8d(e_player) {
    if (e_player hasperk(#"specialty_mod_phdflopper") || isdefined(self.var_efc76c5d) && self.var_efc76c5d || isdefined(e_player.var_c09a076a) && e_player.var_c09a076a) {
        if (e_player issliding()) {
            e_player thread function_a1812da9();
            return true;
        } else if (isdefined(e_player.var_9beb4442) && e_player.var_9beb4442 || isdefined(e_player.var_c09a076a) && e_player.var_c09a076a) {
            return true;
        }
    }
    if (e_player bgb::is_enabled(#"zm_bgb_anti_entrapment")) {
        if (!isdefined(e_player.var_410e7c36)) {
            e_player.var_410e7c36 = [];
        } else if (!isarray(e_player.var_410e7c36)) {
            e_player.var_410e7c36 = array(e_player.var_410e7c36);
        }
        if (!isinarray(e_player.var_410e7c36, self)) {
            if (!isdefined(e_player.var_410e7c36)) {
                e_player.var_410e7c36 = [];
            } else if (!isarray(e_player.var_410e7c36)) {
                e_player.var_410e7c36 = array(e_player.var_410e7c36);
            }
            e_player.var_410e7c36[e_player.var_410e7c36.size] = self;
            e_player zm_stats::increment_challenge_stat(#"hash_108042c8bd6693fb");
        }
        return true;
    }
    return false;
}

// Namespace zm_traps/zm_traps
// Params 0, eflags: 0x1 linked
// Checksum 0xef16b84d, Offset: 0x3c80
// Size: 0x5a
function function_a1812da9() {
    self notify(#"hash_337fc06844d7d1bb");
    self endon(#"disconnect", #"hash_337fc06844d7d1bb");
    self.var_9beb4442 = 1;
    wait 0.25;
    self.var_9beb4442 = undefined;
}

// Namespace zm_traps/zm_traps
// Params 0, eflags: 0x0
// Checksum 0x77367f32, Offset: 0x3ce8
// Size: 0x12
function function_19d61a68() {
    self.var_efc76c5d = 1;
}

// Namespace zm_traps/zm_traps
// Params 2, eflags: 0x1 linked
// Checksum 0xe0bcccf9, Offset: 0x3d08
// Size: 0x54
function function_da13db45(n_cooldown, e_player) {
    if (isdefined(e_player) && e_player hasperk(#"specialty_cooldown")) {
        n_cooldown *= 0.5;
    }
    return n_cooldown;
}

// Namespace zm_traps/zm_traps
// Params 1, eflags: 0x0
// Checksum 0xf5a3ffc9, Offset: 0x3d68
// Size: 0x1a
function is_trap_registered(a_registered_traps) {
    return isdefined(a_registered_traps[self.script_noteworthy]);
}

// Namespace zm_traps/zm_traps
// Params 3, eflags: 0x1 linked
// Checksum 0xf3a4c88e, Offset: 0x3d90
// Size: 0xce
function register_trap_basic_info(str_trap, func_activate, func_audio) {
    assert(isdefined(str_trap), "<dev string:x38>");
    assert(isdefined(func_activate), "<dev string:x78>");
    assert(isdefined(func_audio), "<dev string:xb9>");
    _register_undefined_trap(str_trap);
    level._custom_traps[str_trap].activate = func_activate;
    level._custom_traps[str_trap].audio = func_audio;
}

// Namespace zm_traps/zm_traps
// Params 1, eflags: 0x1 linked
// Checksum 0xe5ec6643, Offset: 0x3e68
// Size: 0x66
function _register_undefined_trap(str_trap) {
    if (!isdefined(level._custom_traps)) {
        level._custom_traps = [];
    }
    if (!isdefined(level._custom_traps[str_trap])) {
        level._custom_traps[str_trap] = spawnstruct();
    }
}

// Namespace zm_traps/zm_traps
// Params 3, eflags: 0x1 linked
// Checksum 0x624e856e, Offset: 0x3ed8
// Size: 0x8e
function register_trap_damage(str_trap, func_player_damage, func_damage) {
    assert(isdefined(str_trap), "<dev string:x38>");
    _register_undefined_trap(str_trap);
    level._custom_traps[str_trap].player_damage = func_player_damage;
    level._custom_traps[str_trap].damage = func_damage;
}

// Namespace zm_traps/zm_traps
// Params 3, eflags: 0x0
// Checksum 0xf26f7d7a, Offset: 0x3f70
// Size: 0x8e
function function_60d9e800(str_trap, var_75734507, var_53d35f37) {
    assert(isdefined(str_trap), "<dev string:x38>");
    _register_undefined_trap(str_trap);
    level._custom_traps[str_trap].var_75734507 = var_75734507;
    level._custom_traps[str_trap].var_53d35f37 = var_53d35f37;
}

