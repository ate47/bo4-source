#using scripts\zm\zm_towers_util.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_traps.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_round_logic.gsc;
#using scripts\zm_common\zm_contracts.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\ai\zombie_death.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_a5b1b1d7;

// Namespace namespace_a5b1b1d7/namespace_3c5019f6
// Params 0, eflags: 0x2
// Checksum 0xdf76dd1c, Offset: 0x1d8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"hash_55c1d88784016490", &__init__, &__main__, undefined);
}

// Namespace namespace_a5b1b1d7/namespace_3c5019f6
// Params 0, eflags: 0x1 linked
// Checksum 0x7df4cf45, Offset: 0x228
// Size: 0x3c
function __init__() {
    level thread function_286b5fa9();
    callback::on_finalize_initialization(&init);
}

// Namespace namespace_a5b1b1d7/namespace_3c5019f6
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x270
// Size: 0x4
function __main__() {
    
}

// Namespace namespace_a5b1b1d7/namespace_3c5019f6
// Params 0, eflags: 0x1 linked
// Checksum 0xcde21560, Offset: 0x280
// Size: 0x24
function init() {
    callback::on_connect(&function_96e29e5f);
}

// Namespace namespace_a5b1b1d7/namespace_3c5019f6
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x2b0
// Size: 0x4
function function_96e29e5f() {
    
}

// Namespace namespace_a5b1b1d7/namespace_3c5019f6
// Params 0, eflags: 0x1 linked
// Checksum 0x4503da3d, Offset: 0x2c0
// Size: 0x174
function function_286b5fa9() {
    level.var_6024289d = getentarray("trap_blade_pillar", "script_label");
    a_zombie_traps = getentarray("zombie_trap", "targetname");
    level.var_5f47f17d = array::filter(a_zombie_traps, 0, &function_f0f82833);
    foreach (var_dabb9a97 in level.var_5f47f17d) {
        var_dabb9a97 function_d8e7a5e6();
    }
    zm_traps::register_trap_basic_info("blade_pillar", &function_8fe2d903, &function_96f77ea4);
    zm_traps::register_trap_damage("blade_pillar", &player_damage, &damage);
}

// Namespace namespace_a5b1b1d7/namespace_3c5019f6
// Params 1, eflags: 0x1 linked
// Checksum 0x83b12ead, Offset: 0x440
// Size: 0x20
function function_f0f82833(e_ent) {
    return e_ent.script_noteworthy == "blade_pillar";
}

// Namespace namespace_a5b1b1d7/namespace_3c5019f6
// Params 0, eflags: 0x1 linked
// Checksum 0x6e8b8a54, Offset: 0x468
// Size: 0xbe
function function_d8e7a5e6() {
    self flag::init("activated");
    soul_whale = arraygetclosest(self.origin, level.var_6024289d);
    soul_whale flag::init("activated");
    self zm_traps::function_19d61a68();
    soul_whale.var_48698f89 = soul_whale.origin;
    soul_whale.var_ab34489f = soul_whale.angles;
    self.soul_whale = soul_whale;
}

// Namespace namespace_a5b1b1d7/namespace_3c5019f6
// Params 0, eflags: 0x1 linked
// Checksum 0xb769be1d, Offset: 0x530
// Size: 0x2f4
function function_8fe2d903() {
    self._trap_duration = 30;
    self._trap_cooldown_time = 60;
    if (isdefined(level.sndtrapfunc)) {
        level thread [[ level.sndtrapfunc ]](self, 1);
    }
    self notify(#"trap_activate");
    level notify(#"trap_activate", self);
    self.activated_by_player thread function_45a2294f(self.script_string);
    foreach (t_trap in level.var_5f47f17d) {
        if (t_trap.script_string === self.script_string) {
            var_deed061f = getentarray(t_trap.target, "targetname");
            mdl_trap = getent(var_deed061f[0].target, "targetname");
            mdl_trap scene::play("p8_fxanim_zm_towers_trap_blade_01_bundle", "Shot 1", mdl_trap);
            mdl_trap thread scene::play("p8_fxanim_zm_towers_trap_blade_01_bundle", "Shot 2", mdl_trap);
            t_trap thread zm_traps::trap_damage();
        }
    }
    self waittilltimeout(self._trap_duration, #"trap_deactivate");
    foreach (t_trap in level.var_5f47f17d) {
        if (t_trap.script_string === self.script_string) {
            var_deed061f = getentarray(t_trap.target, "targetname");
            mdl_trap = getent(var_deed061f[0].target, "targetname");
            mdl_trap thread scene::play("p8_fxanim_zm_towers_trap_blade_01_bundle", "Shot 3", mdl_trap);
            t_trap notify(#"trap_done");
        }
    }
}

// Namespace namespace_a5b1b1d7/namespace_3c5019f6
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x830
// Size: 0x4
function function_96f77ea4() {
    
}

// Namespace namespace_a5b1b1d7/namespace_3c5019f6
// Params 1, eflags: 0x1 linked
// Checksum 0x566d8889, Offset: 0x840
// Size: 0x1a0
function function_45a2294f(str_id) {
    foreach (e_pillar in level.var_6024289d) {
        if (e_pillar.script_string === str_id) {
            e_pillar thread activate_trap(self);
            level.var_a6b89158 = getent(e_pillar.target, "targetname");
            level.var_a6b89158 thread function_6f34f900();
        }
    }
    level notify(#"traps_activated", {#var_be3f58a:str_id});
    wait 30;
    level notify(#"traps_cooldown", {#var_be3f58a:str_id});
    n_cooldown = zm_traps::function_da13db45(60, self);
    wait n_cooldown;
    level notify(#"traps_available", {#var_be3f58a:str_id});
}

// Namespace namespace_a5b1b1d7/namespace_3c5019f6
// Params 0, eflags: 0x1 linked
// Checksum 0x702d94db, Offset: 0x9e8
// Size: 0xec
function function_6f34f900() {
    level endon(#"traps_cooldown");
    while (true) {
        s_info = self waittill(#"trigger");
        e_player = s_info.activator;
        if (!isplayer(e_player)) {
            continue;
        }
        if (!e_player issliding()) {
            continue;
        }
        var_82cc90a0 = e_player.health;
        wait 0.85;
        if (isdefined(e_player) && var_82cc90a0 == e_player.health) {
            e_player notify(#"hash_731c84be18ae9fa3");
        }
    }
}

// Namespace namespace_a5b1b1d7/namespace_3c5019f6
// Params 1, eflags: 0x1 linked
// Checksum 0xbb28f6e3, Offset: 0xae0
// Size: 0x62
function activate_trap(e_player) {
    if (!self flag::get("activated")) {
        self flag::set("activated");
        if (isdefined(e_player)) {
            self.activated_by_player = e_player;
        }
    }
}

// Namespace namespace_a5b1b1d7/namespace_3c5019f6
// Params 1, eflags: 0x1 linked
// Checksum 0x51597eed, Offset: 0xb50
// Size: 0x4e
function deactivate_trap(e_trap) {
    e_trap notify(#"trap_deactivate");
    self flag::clear("activated");
    self notify(#"deactivate");
}

// Namespace namespace_a5b1b1d7/namespace_3c5019f6
// Params 1, eflags: 0x1 linked
// Checksum 0x4f4ecc4d, Offset: 0xba8
// Size: 0x28c
function damage(e_trap) {
    if (!isalive(self) || self.archetype === #"tiger" || isvehicle(self)) {
        return;
    }
    if (self.var_6f84b820 === #"miniboss" || self.var_6f84b820 === #"heavy") {
        e_trap.soul_whale deactivate_trap(e_trap);
        if (isdefined(e_trap.activated_by_player)) {
            e_trap.activated_by_player notify(#"hash_74fc45698491be88");
        }
        return;
    }
    self.marked_for_death = 1;
    if (isdefined(e_trap.activated_by_player) && isplayer(e_trap.activated_by_player)) {
        e_trap.activated_by_player zm_stats::increment_challenge_stat(#"zombie_hunter_kill_trap");
        e_trap.activated_by_player contracts::increment_zm_contract(#"contract_zm_trap_kills");
    }
    v_away = self.origin - e_trap.origin;
    v_away = vectornormalize((v_away[0], v_away[1], 0)) * 64;
    v_dest = self.origin + v_away;
    level notify(#"trap_kill", {#e_victim:self, #e_trap:e_trap});
    self dodamage(self.health + 666, self.origin, e_trap);
    self thread function_373d49f(v_dest, 0.25, 0, 0.125);
    self thread zm_towers_util::function_ae1b4f5b(90, 75, 25);
}

// Namespace namespace_a5b1b1d7/namespace_3c5019f6
// Params 1, eflags: 0x1 linked
// Checksum 0xc8a62039, Offset: 0xe40
// Size: 0x12c
function player_damage(t_damage) {
    self endon(#"death");
    if (self getstance() == "stand" && !self issliding()) {
        n_damage = 50;
        if (zm_utility::is_standard()) {
            n_damage *= 0.5;
        }
        if (zm_utility::is_ee_enabled() && self flag::get(#"hash_6757075afacfc1b4")) {
            n_damage *= 0.5;
        }
        self dodamage(n_damage, self.origin, undefined, t_damage);
        wait 0.1;
        self.is_burning = undefined;
    }
    self setstance("crouch");
}

// Namespace namespace_a5b1b1d7/namespace_3c5019f6
// Params 4, eflags: 0x1 linked
// Checksum 0x3f866014, Offset: 0xf78
// Size: 0x16c
function function_373d49f(v_dest, n_time = 1, n_accel = 0, var_99997505 = 0) {
    if (isplayer(self)) {
        var_3fba37cd = util::spawn_model("tag_origin", self.origin, self.angles);
        self linkto(var_3fba37cd);
        var_3fba37cd moveto(v_dest, n_time, n_accel, var_99997505);
        var_3fba37cd waittill(#"movedone");
        var_3fba37cd delete();
        return;
    }
    v_direction = vectornormalize(v_dest);
    v_force = v_direction * 64;
    self startragdoll();
    self launchragdoll(v_force);
}

