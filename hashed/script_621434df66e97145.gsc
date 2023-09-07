// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_traps.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_contracts.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm\zm_white_util.gsc;
#using scripts\zm\zm_hms_util.gsc;
#using scripts\core_common\ai\systems\gib.gsc;
#using scripts\core_common\ai\zombie_death.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\visionset_mgr_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_87b5173f;

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 0, eflags: 0x1 linked
// Checksum 0xeb9f79dc, Offset: 0x428
// Size: 0x184
function preload() {
    clientfield::register("actor", "shower_trap_death_fx", 1, 1, "int");
    clientfield::register("scriptmover", "shower_trap_fx", 1, 1, "int");
    clientfield::register("toplayer", "player_shower_trap_post_fx", 18000, 1, "int");
    clientfield::register("toplayer", "player_fire_trap_post_fx", 18000, 1, "int");
    clientfield::register("scriptmover", "fire_trap_fx", 1, 1, "int");
    clientfield::register("actor", "spinning_trap_blood_fx", 1, 1, "int");
    clientfield::register("actor", "spinning_trap_eye_fx", 1, 1, "int");
    clientfield::register("toplayer", "rumble_spinning_trap", 1, 1, "int");
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 0, eflags: 0x1 linked
// Checksum 0x912bb3f1, Offset: 0x5b8
// Size: 0x7c
function init() {
    level thread init_weapons_locker();
    level thread function_33e9442f();
    level thread function_31c7123b();
    level thread function_d8a7606();
    level thread function_982029e3();
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 0, eflags: 0x1 linked
// Checksum 0x48194f49, Offset: 0x640
// Size: 0x30c
function init_weapons_locker() {
    level.s_weapons_locker = struct::get("s_weapons_locker", "targetname");
    level.s_weapons_locker.a_weapons = getentarray(level.s_weapons_locker.target, "targetname");
    foreach (weapon in level.s_weapons_locker.a_weapons) {
        weapon setinvisibletoall();
    }
    if (zm_utility::is_ee_enabled() || zm_utility::is_trials()) {
        foreach (e_player in getplayers()) {
            if (isdefined(e_player)) {
                e_player function_af613bbf(level.s_weapons_locker.a_weapons);
                e_player.var_5a5bf8e7 = 0;
            }
        }
    }
    callback::on_connect(&on_player_connect);
    level flag::wait_till(#"hash_25d9ccebd2bdecd9");
    e_door_l = getent("e_sarge_l", "targetname");
    e_door_r = getent("e_sarge_r", "targetname");
    e_door_l playsound(#"hash_75410a9cb6086f34");
    e_door_l rotateyaw(185, 0.85, 0.1, 0.1);
    e_door_r rotateyaw(-220, 1, 0.05, 0.05);
    level.s_weapons_locker zm_unitrigger::create(&function_9d485d13, 64);
    level.s_weapons_locker thread function_4ef09c7a();
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 0, eflags: 0x1 linked
// Checksum 0x7ddb91a3, Offset: 0x958
// Size: 0x1f4
function function_33e9442f() {
    level.s_ray_gun_case = struct::get("s_ray_gun_case", "targetname");
    level.s_ray_gun_case.var_1c12e292 = struct::get("rg_case", "targetname");
    level.s_ray_gun_case.var_1c12e292 scene::play("idle");
    level.s_ray_gun_case.e_ray_gun = getent(level.s_ray_gun_case.target, "targetname");
    level.s_ray_gun_case.e_ray_gun.w_pickup = level.a_w_ray_guns[3];
    if (zm_utility::is_ee_enabled()) {
        s_unitrigger = level.s_ray_gun_case.e_ray_gun zm_unitrigger::create(&zm_white_util::function_358da2a7);
        level.s_ray_gun_case.e_ray_gun.var_4f84520b = 0;
        level flag::wait_till(#"enable_countermeasure_5");
        level.s_ray_gun_case.var_1c12e292 scene::play("open");
        zm_unitrigger::unitrigger_force_per_player_triggers(s_unitrigger);
        level.s_ray_gun_case.e_ray_gun thread zm_white_util::function_d1ca61a7();
    } else {
        level.s_ray_gun_case.e_ray_gun hide();
    }
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 0, eflags: 0x1 linked
// Checksum 0xc1640e9b, Offset: 0xb58
// Size: 0x278
function function_31c7123b() {
    level.s_shower_trap = struct::get("s_shower_trap", "targetname");
    s_trap = level.s_shower_trap;
    s_trap._trap_type = "acid";
    s_trap.e_volume = getent(s_trap.target, "targetname");
    s_trap.e_volume._trap_type = "acid";
    s_trap.var_28ea1870 = struct::get_array(s_trap.target3, "targetname");
    s_trap.a_s_buttons = struct::get_array(s_trap.target2, "targetname");
    s_trap.a_e_lights = getentarray(s_trap.target4, "targetname");
    s_trap.a_s_panels = struct::get_array(s_trap.target5, "targetname");
    s_trap.var_6b64b967 = 0;
    s_trap.var_41ee2ddc = 1;
    level flag::wait_till("all_players_spawned");
    level flag::wait_till(#"hash_25d9cdebd2bdee8c");
    foreach (s_button in s_trap.a_s_buttons) {
        s_button.s_trap = s_trap;
        s_button zm_unitrigger::create(&function_67b12ae8, 64);
        s_button thread function_6c029b7();
        s_button thread function_79eec899();
    }
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 0, eflags: 0x1 linked
// Checksum 0x6b2eff5f, Offset: 0xdd8
// Size: 0x238
function function_6c029b7() {
    level endon(#"end_game");
    while (1) {
        s_waitresult = undefined;
        s_waitresult = self waittill(#"trigger_activated");
        e_who = s_waitresult.e_who;
        if (isdefined(level.var_4f7df1ac) && level.var_4f7df1ac) {
            continue;
        }
        if (isdefined(self.power_flag) && !level flag::get(self.power_flag)) {
            continue;
        }
        if (level.s_shower_trap.var_6b64b967 === 1) {
            continue;
        }
        if (level flag::get(#"hash_1478cafcd626c361") && !level flag::get(#"circuit_step_complete")) {
            continue;
        }
        if (zm_utility::is_player_valid(e_who) && level.s_shower_trap.var_41ee2ddc === 1) {
            b_purchased = self.s_trap.a_e_lights[0] zm_traps::trap_purchase(e_who, 1000);
            if (!b_purchased) {
                continue;
            }
            self notify(#"hash_41d1d9f238b43a7");
            self.e_activator = e_who;
            level.s_shower_trap.activated_by_player = e_who;
            if (!(isdefined(level.var_3c9cfd6f) && level.var_3c9cfd6f) && zm_audio::can_speak()) {
                e_who thread zm_audio::create_and_play_dialog(#"trap_generic", #"activate");
            }
        }
    }
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 0, eflags: 0x1 linked
// Checksum 0x89589ab1, Offset: 0x1018
// Size: 0x218
function function_79eec899() {
    level endon(#"end_game");
    function_91ecec97(level.s_shower_trap.a_e_lights, "p8_zm_off_trap_switch_light_green_on");
    function_eb59d9fe(level.s_shower_trap.a_s_panels);
    while (1) {
        self waittill(#"hash_41d1d9f238b43a7");
        function_91ecec97(level.s_shower_trap.a_e_lights, "p8_zm_off_trap_switch_light_red_on");
        level.s_shower_trap.var_6b64b967 = 1;
        e_who = self.e_activator;
        if (isdefined(e_who)) {
            zm_utility::play_sound_at_pos("purchase", e_who.origin);
            level notify(#"trap_activated", {#trap:self, #trap_activator:e_who});
        }
        level.s_shower_trap function_17b07f6c(e_who);
        level.s_shower_trap.var_6b64b967 = 0;
        level.s_shower_trap.var_41ee2ddc = 0;
        n_cooldown = zm_traps::function_da13db45(60, e_who);
        wait(n_cooldown);
        function_91ecec97(level.s_shower_trap.a_e_lights, "p8_zm_off_trap_switch_light_green_on");
        level.s_shower_trap.var_41ee2ddc = 1;
        playsoundatposition(#"zmb_trap_ready", self.origin);
    }
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 1, eflags: 0x1 linked
// Checksum 0x61900e80, Offset: 0x1238
// Size: 0xb4
function function_17b07f6c(e_player) {
    level endon(#"end_game");
    n_total_time = 0;
    self thread shower_trap_fx(1);
    while (n_total_time < 40) {
        self thread function_9c9d3bdc(e_player);
        self thread function_17f9c268();
        wait(0.1);
        n_total_time = n_total_time + 0.1;
    }
    self thread shower_trap_fx(0);
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 1, eflags: 0x1 linked
// Checksum 0x8ca8efae, Offset: 0x12f8
// Size: 0xd8
function function_9c9d3bdc(e_activator) {
    foreach (ai in getaiteamarray(level.zombie_team)) {
        if (isalive(ai) && ai istouching(self.e_volume)) {
            ai thread function_a77f3804(e_activator, self.e_volume);
        }
    }
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 2, eflags: 0x1 linked
// Checksum 0x3ad2c471, Offset: 0x13d8
// Size: 0x1cc
function function_a77f3804(e_activator, e_volume) {
    self endon(#"death");
    self.marked_for_death = 1;
    if (isdefined(level.s_shower_trap.activated_by_player) && isplayer(level.s_shower_trap.activated_by_player)) {
        level.s_shower_trap.activated_by_player zm_stats::increment_challenge_stat(#"zombie_hunter_kill_trap");
        level.s_shower_trap.activated_by_player contracts::increment_zm_contract(#"hash_1f11b620a6de486b");
    }
    self clientfield::set("shower_trap_death_fx", 1);
    level notify(#"hash_336bf8053ce21208", {#e_player:e_activator});
    wait(randomfloatrange(0.25, 0.5));
    if (isalive(self)) {
        self zombie_utility::gib_random_parts();
        self thread function_d55cc959();
        self.var_12745932 = 1;
        self dodamage(self.health + 1000, e_volume.origin, e_volume);
    }
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 1, eflags: 0x1 linked
// Checksum 0xa2943acb, Offset: 0x15b0
// Size: 0x170
function shower_trap_fx(var_9d9f02b4) {
    if (var_9d9f02b4) {
        foreach (var_9e659454 in self.var_28ea1870) {
            var_9e659454.mdl_fx = util::spawn_model("tag_origin", var_9e659454.origin, var_9e659454.angles);
            var_9e659454.mdl_fx clientfield::set("shower_trap_fx", 1);
        }
    } else {
        foreach (var_9e659454 in self.var_28ea1870) {
            var_9e659454.mdl_fx clientfield::set("shower_trap_fx", 0);
            waitframe(1);
            var_9e659454.mdl_fx delete();
        }
    }
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 0, eflags: 0x1 linked
// Checksum 0x56bdac6a, Offset: 0x1728
// Size: 0x34
function function_d55cc959() {
    wait(2);
    if (isdefined(self)) {
        self clientfield::set("shower_trap_death_fx", 0);
    }
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 0, eflags: 0x1 linked
// Checksum 0xdefc5c6b, Offset: 0x1768
// Size: 0xa0
function function_17f9c268() {
    foreach (e_player in getplayers()) {
        if (e_player istouching(self.e_volume)) {
            e_player thread function_b691c69(self);
        }
    }
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 1, eflags: 0x1 linked
// Checksum 0x46004080, Offset: 0x1810
// Size: 0x13c
function function_b691c69(s_trap) {
    self endon(#"death", #"disconnect");
    if (!isdefined(self.var_e613b44) || !self.var_e613b44) {
        self.var_e613b44 = 1;
        e_volume = s_trap.e_volume;
        self thread function_24c4375b();
        if (e_volume zm_traps::function_3f401e8d(self)) {
            return;
        }
        if (!self laststand::player_is_in_laststand()) {
            if (zm_utility::is_standard()) {
                self dodamage(50, self.origin, undefined, e_volume);
            } else {
                self dodamage(150, self.origin, undefined, e_volume);
            }
            self zm_audio::playerexert("cough");
        }
    }
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 0, eflags: 0x1 linked
// Checksum 0x94eff561, Offset: 0x1958
// Size: 0x9c
function function_24c4375b() {
    self endon(#"bled_out", #"disconnect");
    if (self clientfield::get_to_player("player_shower_trap_post_fx") === 1) {
        return;
    }
    self clientfield::set_to_player("player_shower_trap_post_fx", 1);
    wait(1);
    self.var_e613b44 = 0;
    self clientfield::set_to_player("player_shower_trap_post_fx", 0);
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 1, eflags: 0x0
// Checksum 0xd2e0a056, Offset: 0x1a00
// Size: 0x74
function function_13e49422(trap) {
    playsoundatposition(#"hash_4b93c2d674807e60", self.origin);
    self waittill(#"available");
    playsoundatposition(#"zmb_acid_trap_available", self.origin);
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 0, eflags: 0x1 linked
// Checksum 0x33bc82dc, Offset: 0x1a80
// Size: 0x290
function function_d8a7606() {
    level.s_fire_trap = struct::get("s_fire_trap", "targetname");
    s_trap = level.s_fire_trap;
    s_trap._trap_type = "fire";
    s_trap.e_volume = getent(s_trap.target, "targetname");
    s_trap.e_volume._trap_type = "fire";
    s_trap.var_28ea1870 = struct::get_array(s_trap.target3, "targetname");
    s_trap.a_s_buttons = struct::get_array(s_trap.target2, "targetname");
    s_trap.a_e_lights = getentarray(s_trap.target4, "targetname");
    s_trap.a_s_panels = struct::get_array(s_trap.target5, "targetname");
    s_trap.var_6b64b967 = 0;
    s_trap.var_41ee2ddc = 1;
    level flag::wait_till("all_players_spawned");
    level flag::wait_till(#"hash_25d9caebd2bde973");
    foreach (s_button in s_trap.a_s_buttons) {
        s_button.s_trap = s_trap;
        s_button zm_unitrigger::create(&function_67b12ae8, 64);
        s_button thread function_f24b1ecb();
        s_button thread function_64fa1b6a();
        s_button thread function_cbeb9a33();
    }
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 0, eflags: 0x1 linked
// Checksum 0x1a45ab14, Offset: 0x1d18
// Size: 0x238
function function_f24b1ecb() {
    level endon(#"end_game");
    while (1) {
        s_waitresult = undefined;
        s_waitresult = self waittill(#"trigger_activated");
        e_who = s_waitresult.e_who;
        if (isdefined(level.var_4f7df1ac) && level.var_4f7df1ac) {
            continue;
        }
        if (isdefined(self.power_flag) && !level flag::get(self.power_flag)) {
            continue;
        }
        if (level.s_fire_trap.var_6b64b967 === 1) {
            continue;
        }
        if (level flag::get(#"hash_1478cafcd626c361") && !level flag::get(#"circuit_step_complete")) {
            continue;
        }
        if (zm_utility::is_player_valid(e_who) && level.s_fire_trap.var_41ee2ddc === 1) {
            b_purchased = self.s_trap.a_e_lights[0] zm_traps::trap_purchase(e_who, 1000);
            if (!b_purchased) {
                continue;
            }
            self notify(#"fire_trap_activated");
            self.e_activator = e_who;
            level.s_fire_trap.activated_by_player = e_who;
            if (!(isdefined(level.var_3c9cfd6f) && level.var_3c9cfd6f) && zm_audio::can_speak()) {
                e_who thread zm_audio::create_and_play_dialog(#"trap_generic", #"activate");
            }
        }
    }
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 0, eflags: 0x1 linked
// Checksum 0x2c123174, Offset: 0x1f58
// Size: 0x218
function function_64fa1b6a() {
    level endon(#"end_game");
    function_91ecec97(level.s_fire_trap.a_e_lights, "p8_zm_off_trap_switch_light_green_on");
    function_eb59d9fe(level.s_fire_trap.a_s_panels);
    while (1) {
        self waittill(#"fire_trap_activated");
        function_91ecec97(level.s_fire_trap.a_e_lights, "p8_zm_off_trap_switch_light_red_on");
        level.s_fire_trap.var_6b64b967 = 1;
        e_who = self.e_activator;
        if (isdefined(e_who)) {
            zm_utility::play_sound_at_pos("purchase", e_who.origin);
            level notify(#"trap_activated", {#trap:self, #trap_activator:e_who});
        }
        level.s_fire_trap fire_trap_activate(e_who);
        level.s_fire_trap.var_6b64b967 = 0;
        level.s_fire_trap.var_41ee2ddc = 0;
        n_cooldown = zm_traps::function_da13db45(60, e_who);
        wait(n_cooldown);
        function_91ecec97(level.s_fire_trap.a_e_lights, "p8_zm_off_trap_switch_light_green_on");
        level.s_fire_trap.var_41ee2ddc = 1;
        playsoundatposition(#"zmb_trap_ready", self.origin);
    }
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 1, eflags: 0x1 linked
// Checksum 0xafbeaea2, Offset: 0x2178
// Size: 0xb4
function fire_trap_activate(e_player) {
    level endon(#"end_game");
    n_total_time = 0;
    self thread fire_trap_fx(1);
    while (n_total_time < 40) {
        self thread function_bd117af1(e_player);
        self thread function_956ddb52();
        wait(0.1);
        n_total_time = n_total_time + 0.1;
    }
    self thread fire_trap_fx(0);
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 1, eflags: 0x1 linked
// Checksum 0xb9bac840, Offset: 0x2238
// Size: 0xd8
function function_bd117af1(e_activator) {
    foreach (ai in getaiteamarray(level.zombie_team)) {
        if (isalive(ai) && ai istouching(self.e_volume)) {
            ai thread function_11e5b2ee(e_activator, self.e_volume);
        }
    }
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 2, eflags: 0x1 linked
// Checksum 0xeb2bf40, Offset: 0x2318
// Size: 0x334
function function_11e5b2ee(e_activator, e_volume) {
    self endon(#"death");
    self.marked_for_death = 1;
    if (isdefined(level.s_fire_trap.activated_by_player) && isplayer(level.s_fire_trap.activated_by_player)) {
        level.s_fire_trap.activated_by_player zm_stats::increment_challenge_stat(#"zombie_hunter_kill_trap");
        level.s_fire_trap.activated_by_player contracts::increment_zm_contract(#"hash_1f11b620a6de486b");
    }
    level notify(#"fire_trap_kill", {#e_player:e_activator});
    if (isdefined(self.animname) && self.animname != "zombie_dog") {
        if (level.burning_zombies.size < 6) {
            level.burning_zombies[level.burning_zombies.size] = self;
            self thread zm_traps::zombie_flame_watch();
            self playsound(#"zmb_ignite");
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
            playsoundatposition(#"wpn_zmb_electrap_zap", self.origin);
            wait(randomfloat(1.25));
            self playsound(#"wpn_zmb_electrap_zap");
        }
    }
    self.var_12745932 = 1;
    self dodamage(self.health + 666, self.origin, e_volume);
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 1, eflags: 0x1 linked
// Checksum 0x41976f3a, Offset: 0x2658
// Size: 0x170
function fire_trap_fx(var_9d9f02b4) {
    if (var_9d9f02b4) {
        foreach (var_9e659454 in self.var_28ea1870) {
            var_9e659454.mdl_fx = util::spawn_model("tag_origin", var_9e659454.origin, var_9e659454.angles);
            var_9e659454.mdl_fx clientfield::set("fire_trap_fx", 1);
        }
    } else {
        foreach (var_9e659454 in self.var_28ea1870) {
            var_9e659454.mdl_fx clientfield::set("fire_trap_fx", 0);
            waitframe(1);
            var_9e659454.mdl_fx delete();
        }
    }
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 0, eflags: 0x1 linked
// Checksum 0xd37d9049, Offset: 0x27d0
// Size: 0xa0
function function_956ddb52() {
    foreach (e_player in getplayers()) {
        if (e_player istouching(self.e_volume)) {
            e_player thread function_5c6fd230(self);
        }
    }
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 1, eflags: 0x1 linked
// Checksum 0xd207c110, Offset: 0x2878
// Size: 0x14e
function function_5c6fd230(s_trap) {
    self endon(#"death", #"disconnect");
    if (self zm_traps::function_3f401e8d(self)) {
        return;
    }
    if (!(isdefined(self.is_burning) && self.is_burning) && !self laststand::player_is_in_laststand()) {
        self.is_burning = 1;
        self thread function_867c70bf();
        if (isdefined(level.trap_fire_visionset_registered) && level.trap_fire_visionset_registered) {
            visionset_mgr::activate("overlay", "zm_trap_burn", self, 1.25, 1.25);
        } else {
            self setburn(1.25);
        }
        self notify(#"burned");
        self dodamage(50, self.origin);
        wait(0.2);
        self.is_burning = undefined;
    }
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 0, eflags: 0x1 linked
// Checksum 0x23e1b80f, Offset: 0x29d0
// Size: 0x8c
function function_867c70bf() {
    self endon(#"death");
    if (self clientfield::get_to_player("player_fire_trap_post_fx") === 1) {
        return;
    }
    self clientfield::set_to_player("player_fire_trap_post_fx", 1);
    wait(1.45);
    self.is_burning = undefined;
    self clientfield::set_to_player("player_fire_trap_post_fx", 0);
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 0, eflags: 0x1 linked
// Checksum 0xf85c33c5, Offset: 0x2a68
// Size: 0x2b8
function function_982029e3() {
    level.s_spinning_trap = struct::get("s_spinning_trap", "targetname");
    s_trap = level.s_spinning_trap;
    s_trap._trap_type = "rotating";
    s_trap.e_volume = getent(s_trap.target, "targetname");
    s_trap.e_volume._trap_type = "rotating";
    s_trap.a_s_buttons = struct::get_array(s_trap.target2, "targetname");
    s_trap.a_e_lights = getentarray(s_trap.target4, "targetname");
    s_trap.a_s_panels = struct::get_array(s_trap.target5, "targetname");
    s_trap.e_trap = struct::get(s_trap.target3, "targetname");
    s_trap.e_trap thread scene::play("idle");
    s_trap.var_6b64b967 = 0;
    s_trap.var_41ee2ddc = 1;
    level flag::wait_till("all_players_spawned");
    level flag::wait_till(#"hash_25d9cbebd2bdeb26");
    foreach (s_button in s_trap.a_s_buttons) {
        s_button.s_trap = s_trap;
        s_button zm_unitrigger::create(&function_67b12ae8, 64);
        s_button thread function_6facfabc();
        s_button thread function_7fffc105();
        s_button thread function_cbeb9a33();
    }
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 0, eflags: 0x1 linked
// Checksum 0x2978b14, Offset: 0x2d28
// Size: 0x238
function function_6facfabc() {
    level endon(#"end_game");
    while (1) {
        s_waitresult = undefined;
        s_waitresult = self waittill(#"trigger_activated");
        e_who = s_waitresult.e_who;
        if (isdefined(level.var_4f7df1ac) && level.var_4f7df1ac) {
            continue;
        }
        if (isdefined(self.power_flag) && !level flag::get(self.power_flag)) {
            continue;
        }
        if (level.s_spinning_trap.var_6b64b967 === 1) {
            continue;
        }
        if (level flag::get(#"hash_1478cafcd626c361") && !level flag::get(#"circuit_step_complete")) {
            continue;
        }
        if (zm_utility::is_player_valid(e_who) && level.s_spinning_trap.var_41ee2ddc === 1) {
            b_purchased = self.s_trap.a_e_lights[0] zm_traps::trap_purchase(e_who, 1000);
            if (!b_purchased) {
                continue;
            }
            self notify(#"hash_5a7f89c0b12d9f27");
            self.e_activator = e_who;
            level.s_spinning_trap.activated_by_player = e_who;
            if (!(isdefined(level.var_3c9cfd6f) && level.var_3c9cfd6f) && zm_audio::can_speak()) {
                e_who thread zm_audio::create_and_play_dialog(#"trap_generic", #"activate");
            }
        }
    }
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 0, eflags: 0x1 linked
// Checksum 0x33ed752f, Offset: 0x2f68
// Size: 0x250
function function_7fffc105() {
    level endon(#"end_game");
    function_91ecec97(level.s_spinning_trap.a_e_lights, "p8_zm_off_trap_switch_light_green_on");
    function_eb59d9fe(level.s_spinning_trap.a_s_panels);
    while (1) {
        self waittill(#"hash_5a7f89c0b12d9f27");
        function_91ecec97(level.s_spinning_trap.a_e_lights, "p8_zm_off_trap_switch_light_red_on");
        level.s_spinning_trap.var_6b64b967 = 1;
        e_who = self.e_activator;
        if (isdefined(e_who)) {
            zm_utility::play_sound_at_pos("purchase", e_who.origin);
            level notify(#"trap_activated", {#trap:self, #trap_activator:e_who});
        }
        level.s_spinning_trap.e_volume playsound(#"hash_345bf7f9d6f848b9");
        level.s_spinning_trap spinning_trap_activate(e_who);
        level.s_spinning_trap.var_6b64b967 = 0;
        level.s_spinning_trap.var_41ee2ddc = 0;
        n_cooldown = zm_traps::function_da13db45(60, e_who);
        wait(n_cooldown);
        function_91ecec97(level.s_spinning_trap.a_e_lights, "p8_zm_off_trap_switch_light_green_on");
        level.s_spinning_trap.var_41ee2ddc = 1;
        playsoundatposition(#"zmb_trap_ready", self.origin);
    }
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 1, eflags: 0x1 linked
// Checksum 0x7b81d395, Offset: 0x31c0
// Size: 0x1a4
function spinning_trap_activate(e_player) {
    level endon(#"end_game");
    n_total_time = 0;
    self.e_trap scene::play("intro");
    snd_ent = spawn("script_origin", level.s_spinning_trap.origin);
    snd_ent playloopsound(#"hash_57820fd1863bbf19");
    while (n_total_time < 40) {
        self thread function_74a809fd();
        self thread function_b45556a4(e_player);
        self thread function_fcac4b4e();
        wait(0.1);
        n_total_time = n_total_time + 0.1;
    }
    self notify(#"spinning_trap_complete");
    level.s_spinning_trap.e_volume playsound(#"hash_632248542476cd73");
    snd_ent stoploopsound();
    self.e_trap scene::play("outro");
    snd_ent delete();
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 0, eflags: 0x1 linked
// Checksum 0xee03b3bc, Offset: 0x3370
// Size: 0x48
function function_74a809fd() {
    self endon(#"spinning_trap_complete");
    while (1) {
        self.e_trap scene::play("loop");
    }
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 1, eflags: 0x1 linked
// Checksum 0x31c43636, Offset: 0x33c0
// Size: 0xd0
function function_b45556a4(e_activator) {
    foreach (ai in getaiteamarray(level.zombie_team)) {
        if (isalive(ai) && ai istouching(self.e_volume)) {
            ai thread function_7bd8cfde(e_activator, self);
        }
    }
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 2, eflags: 0x1 linked
// Checksum 0x3189e977, Offset: 0x3498
// Size: 0x464
function function_7bd8cfde(e_activator, s_trap) {
    self endon(#"death");
    if (isdefined(self.var_bd4627e1) && self.var_bd4627e1) {
        return;
    }
    if (isdefined(self.var_ad81ef15) && self.var_ad81ef15) {
        return;
    }
    self.var_ad81ef15 = 1;
    self.marked_for_death = 1;
    if (isdefined(s_trap.activated_by_player) && isplayer(s_trap.activated_by_player)) {
        s_trap.activated_by_player zm_stats::increment_challenge_stat(#"zombie_hunter_kill_trap");
        s_trap.activated_by_player contracts::increment_zm_contract(#"hash_1f11b620a6de486b");
    }
    level notify(#"hash_63be45d89436088", {#e_player:e_activator});
    if (isalive(self) && (!isdefined(self.var_bd4627e1) || !self.var_bd4627e1)) {
        self clientfield::set("spinning_trap_blood_fx", 1);
    }
    self playsound(#"hash_42c6cc2204b7fbbd");
    v_hook = s_trap.e_trap.scene_ents[#"prop 1"] gettagorigin("tag_fan_blade_A_2");
    n_dist = distance2d(self.origin, v_hook);
    if (!(isdefined(s_trap.var_705682df) && s_trap.var_705682df) && self.var_6f84b820 === #"basic" && n_dist <= 128 && self.team != #"allies") {
        self thread function_bcfd9acb(s_trap);
        a_e_players = util::get_array_of_closest(self.origin, getplayers());
    } else {
        if (isai(self) && !isvehicle(self)) {
            self thread a_a_arms();
        }
        if (self.var_6f84b820 === #"basic" && !isvehicle(self)) {
            if (randomint(100) < 20) {
                gibserverutils::annihilate(self);
            } else {
                self function_63e5e387(s_trap);
            }
            level notify(#"hash_148b3ce521088846", {#e_player:e_activator});
            self dodamage(self.health + 1000, self.origin, s_trap.e_volume);
        } else {
            level notify(#"hash_148b3ce521088846", {#e_player:e_activator});
            self dodamage(self.health + 1000, self.origin, s_trap.e_volume);
        }
    }
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 1, eflags: 0x1 linked
// Checksum 0xef708bdf, Offset: 0x3908
// Size: 0x3b6
function function_bcfd9acb(s_trap) {
    s_trap.var_705682df = 1;
    self.var_bd4627e1 = 1;
    self clientfield::set("spinning_trap_eye_fx", 1);
    var_e72c9959 = util::spawn_model("tag_origin", s_trap.e_trap.scene_ents[#"prop 1"] gettagorigin("tag_fan_blade_A_2"), s_trap.e_trap.scene_ents[#"prop 1"] gettagangles("tag_fan_blade_A_2"));
    var_e72c9959 linkto(s_trap.e_trap.scene_ents[#"prop 1"], "tag_fan_blade_A_2");
    self val::set("spinning_trap", "ignoreall", 1);
    self val::set("spinning_trap", "allowdeath", 0);
    self.b_ignore_cleanup = 1;
    self.health = 1;
    self notsolid();
    self setteam(util::get_enemy_team(self.team));
    self zombie_utility::makezombiecrawler(1);
    var_e72c9959 thread scene::init(#"hash_6a81729051de85ac", self);
    playsoundatposition(#"hash_42c6cc2204b7fbbd", self.origin);
    s_trap waittill(#"spinning_trap_complete");
    var_44342e79 = var_e72c9959 scene::function_8582657c(#"p8_fxanim_zm_esc_trap_fan_play", "Shot 2");
    var_e72c9959 scene::play(#"hash_6a81729051de85ac", self);
    if (isdefined(self)) {
        self val::reset("spinning_trap", "ignoreall");
        self val::reset("spinning_trap", "allowdeath");
        self.b_ignore_cleanup = 0;
        self solid();
        self setteam(level.zombie_team);
        self clientfield::set("spinning_trap_eye_fx", 0);
        self dodamage(self.health + 1000, self.origin);
    }
    var_e72c9959 unlink();
    var_e72c9959 delete();
    s_trap.var_705682df = undefined;
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 1, eflags: 0x1 linked
// Checksum 0x15fbe765, Offset: 0x3cc8
// Size: 0x15c
function function_63e5e387(s_trap) {
    n_lift_height = randomintrange(8, 64);
    v_away_from_source = vectornormalize(self.origin - s_trap.e_volume.origin);
    v_away_from_source = v_away_from_source * 128;
    v_away_from_source = (v_away_from_source[0], v_away_from_source[1], n_lift_height);
    a_trace = physicstraceex(self.origin + vectorscale((0, 0, 1), 32), self.origin + v_away_from_source, vectorscale((-1, -1, -1), 16), vectorscale((1, 1, 1), 16), self);
    self setplayercollision(0);
    self startragdoll();
    self launchragdoll(150 * anglestoup(self.angles) + (v_away_from_source[0], v_away_from_source[1], 0));
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 0, eflags: 0x1 linked
// Checksum 0xebd72fe3, Offset: 0x3e30
// Size: 0xa0
function function_fcac4b4e() {
    foreach (e_player in getplayers()) {
        if (e_player istouching(self.e_volume)) {
            e_player thread function_1259cbbb(self);
        }
    }
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 1, eflags: 0x1 linked
// Checksum 0x52e2fce6, Offset: 0x3ed8
// Size: 0x1b6
function function_1259cbbb(s_trap) {
    self endon(#"death", #"disconnect");
    if (!isdefined(self.var_c87b7253) || !self.var_c87b7253) {
        e_volume = s_trap.e_volume;
        if (e_volume zm_traps::function_3f401e8d(self)) {
            return;
        }
        if (!self laststand::player_is_in_laststand()) {
            if (zm_utility::is_standard()) {
                self dodamage(50, self.origin, undefined, e_volume);
            } else {
                self.var_c87b7253 = 1;
                if (self.health >= 200) {
                    self dodamage(50, self.origin, undefined, e_volume);
                    wait(0.75);
                    self.var_c87b7253 = 0;
                } else if (self.health >= 100) {
                    self dodamage(35, self.origin, undefined, e_volume);
                    wait(0.75);
                    self.var_c87b7253 = 0;
                } else {
                    self dodamage(15, self.origin, undefined, e_volume);
                    wait(0.75);
                    self.var_c87b7253 = 0;
                }
            }
        }
    }
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 0, eflags: 0x1 linked
// Checksum 0xe04bd3dd, Offset: 0x4098
// Size: 0x34
function a_a_arms() {
    wait(2);
    if (isdefined(self)) {
        self clientfield::set("spinning_trap_blood_fx", 0);
    }
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 1, eflags: 0x1 linked
// Checksum 0x70c65f1f, Offset: 0x40d8
// Size: 0x222
function function_af613bbf(a_weapons) {
    self endon(#"disconnect");
    self.var_45c57fa5 = array::random(a_weapons);
    switch (self.var_45c57fa5.script_string) {
    case #"tr":
        self.var_af561b1f = #"hash_4176883a68b00090";
        self.var_a794d091 = #"hash_2fa3f09f73bf523c";
        self.var_636a8bf7 = #"tr_longburst_t8_upgraded";
        self.var_45c57fa5 setinvisibletoplayer(self, 0);
        break;
    case #"lmg":
        self.var_af561b1f = #"hash_4e543dd90408cd76";
        self.var_a794d091 = #"hash_2e3938a646e43352";
        self.var_636a8bf7 = #"lmg_standard_t8_upgraded";
        self.var_45c57fa5 setinvisibletoplayer(self, 0);
        break;
    case #"ar":
        self.var_af561b1f = #"hash_6dd7b677c74ebba9";
        self.var_a794d091 = #"hash_24f2c78de733d877";
        self.var_636a8bf7 = #"ar_accurate_t8_upgraded";
        self.var_45c57fa5 setinvisibletoplayer(self, 0);
        break;
    case #"shotgun":
        self.var_af561b1f = #"hash_58eff35154ec1990";
        self.var_a794d091 = #"hash_670dd9efc63b2d3c";
        self.var_636a8bf7 = #"shotgun_pump_t8_upgraded";
        self.var_45c57fa5 setinvisibletoplayer(self, 0);
        break;
    }
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 1, eflags: 0x1 linked
// Checksum 0x52886cb, Offset: 0x4308
// Size: 0x8e
function function_9d485d13(e_player) {
    if (!e_player.var_5a5bf8e7) {
        str_hint = zm_utility::function_d6046228(e_player.var_af561b1f, e_player.var_a794d091);
        self sethintstring(str_hint);
        return 1;
    } else {
        self sethintstring("");
    }
    return 0;
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 0, eflags: 0x1 linked
// Checksum 0x160eb579, Offset: 0x43a0
// Size: 0x11c
function function_4ef09c7a() {
    self endon(#"hash_5cc6008e5cdc03de");
    while (1) {
        s_waitresult = undefined;
        s_waitresult = self waittill(#"trigger_activated");
        e_who = s_waitresult.e_who;
        if (!isdefined(e_who.var_5a5bf8e7) || e_who.var_5a5bf8e7) {
            continue;
        }
        if (isdefined(e_who.var_636a8bf7)) {
            var_498a708 = getweapon(e_who.var_636a8bf7);
        }
        e_who thread swap_weapon(var_498a708);
        e_who.var_45c57fa5 setinvisibletoplayer(e_who, 1);
        e_who.var_5a5bf8e7 = 1;
        e_who notify(#"hash_9e146af7233ec36");
    }
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 0, eflags: 0x1 linked
// Checksum 0x8f6003f1, Offset: 0x44c8
// Size: 0x36
function on_player_connect() {
    self function_af613bbf(level.s_weapons_locker.a_weapons);
    self.var_5a5bf8e7 = 0;
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 1, eflags: 0x1 linked
// Checksum 0x19b7972b, Offset: 0x4508
// Size: 0x2c2
function function_67b12ae8(e_player) {
    s_button = self.stub.related_parent;
    if (e_player zm_utility::is_drinking()) {
        self sethintstring("");
        return 0;
    } else if (s_button.s_trap.var_6b64b967 === 1) {
        self sethintstring(#"zombie/trap_active");
        return 1;
    } else if (isdefined(s_button.power_flag) && !level flag::get(s_button.power_flag)) {
        self sethintstring(#"zombie/need_power");
        return 1;
    } else if (level flag::get(#"hash_1478cafcd626c361") && !level flag::get(#"circuit_step_complete")) {
        self sethintstring(#"zombie/need_power");
        return 1;
    } else if (s_button.s_trap.var_41ee2ddc === 0) {
        self sethintstring(#"zombie/trap_cooldown");
        return 1;
    } else if (util::get_game_type() == "zstandard") {
        if (function_8b1a219a()) {
            self sethintstring(#"hash_61d85c966dd9e83f");
            return 1;
        } else {
            self sethintstring(#"hash_24a438482954901");
            return 1;
        }
    } else if (function_8b1a219a()) {
        self sethintstring(#"hash_6e8ef1b690e98e51", 1000);
        return 1;
    } else {
        self sethintstring(#"hash_23c1c09e94181fdb", 1000);
        return 1;
    }
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 1, eflags: 0x1 linked
// Checksum 0x31b6c705, Offset: 0x47d8
// Size: 0x88
function function_eb59d9fe(a_s_panels) {
    foreach (panel in a_s_panels) {
        panel thread scene::play("open");
    }
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 2, eflags: 0x1 linked
// Checksum 0x3ef039bf, Offset: 0x4868
// Size: 0x88
function function_91ecec97(a_e_lights, str_model) {
    foreach (light in a_e_lights) {
        light setmodel(str_model);
    }
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 1, eflags: 0x1 linked
// Checksum 0x71c9d480, Offset: 0x48f8
// Size: 0xec
function swap_weapon(var_498a708) {
    var_6822257f = self getweaponslist();
    foreach (w_gun in var_6822257f) {
        if (w_gun.rootweapon === var_498a708) {
            self zm_weapons::function_7c5dd4bd(w_gun);
            return;
        }
    }
    if (!self hasweapon(var_498a708, 1)) {
        self function_e2a25377(var_498a708);
    }
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 1, eflags: 0x1 linked
// Checksum 0x42bad078, Offset: 0x49f0
// Size: 0x84
function function_e2a25377(var_498a708) {
    if (self hasweapon(zm_weapons::get_base_weapon(var_498a708), 1)) {
        self takeweapon(zm_weapons::get_base_weapon(var_498a708), 1);
    }
    self zm_weapons::weapon_give(var_498a708, 1);
}

// Namespace namespace_87b5173f/namespace_87b5173f
// Params 0, eflags: 0x1 linked
// Checksum 0x754d1b6a, Offset: 0x4a80
// Size: 0x34
function function_cbeb9a33() {
    level waittill(#"insanity_mode_triggered");
    zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
}

