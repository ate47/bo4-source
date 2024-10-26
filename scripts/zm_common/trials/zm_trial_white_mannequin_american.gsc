#using scripts\zm\zm_white_private_mannequin.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_trial_white_mannequin_american;

// Namespace zm_trial_white_mannequin_american/zm_trial_white_mannequin_american
// Params 0, eflags: 0x2
// Checksum 0xb1567b8e, Offset: 0x118
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_trial_white_mannequin_american", &__init__, undefined, undefined);
}

// Namespace zm_trial_white_mannequin_american/zm_trial_white_mannequin_american
// Params 0, eflags: 0x1 linked
// Checksum 0xdbddc67c, Offset: 0x160
// Size: 0x54
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge("mannequin_american", &on_begin, &on_end);
}

// Namespace zm_trial_white_mannequin_american/zm_trial_white_mannequin_american
// Params 0, eflags: 0x5 linked
// Checksum 0xa6055d74, Offset: 0x1c0
// Size: 0x228
function private on_begin() {
    var_a2c75164 = getent("mannequin_ally_door", "targetname");
    var_a2c75164 zm_white_private_mannequin::function_a51b6403(1);
    wait 1;
    level.var_1a612d42 = getplayers()[0];
    level.var_1a612d42.eligible_leader = 1;
    mannequin_ally_spawner = getent("mannequin_american_spawner", "targetname");
    if (isdefined(mannequin_ally_spawner)) {
        level.mannequin_ally = mannequin_ally_spawner spawnfromspawner();
        util::magic_bullet_shield(level.mannequin_ally);
        level.mannequin_ally.aioverridedamage = array(&function_26edbcdc);
        level thread function_7532e17c(level.mannequin_ally);
    }
    var_a2c75164 zm_white_private_mannequin::function_a51b6403(0);
    callback::function_33f0ddd3(&function_33f0ddd3);
    level zm_trial::function_25ee130(1);
    if (isdefined(level.mannequin_ally)) {
        foreach (player in getplayers()) {
            player thread function_545d53bf();
        }
    }
}

// Namespace zm_trial_white_mannequin_american/zm_trial_white_mannequin_american
// Params 1, eflags: 0x5 linked
// Checksum 0x20356e11, Offset: 0x3f0
// Size: 0x13c
function private on_end(round_reset) {
    callback::function_824d206(&function_33f0ddd3);
    level zm_trial::function_25ee130(0);
    foreach (player in getplayers()) {
        player thread zm_trial_util::function_dc0859e();
    }
    if (isdefined(level.mannequin_ally) && isalive(level.mannequin_ally)) {
        level.mannequin_ally notify(#"revive_terminated");
        util::stop_magic_bullet_shield(level.mannequin_ally);
        level.mannequin_ally kill();
    }
}

// Namespace zm_trial_white_mannequin_american/zm_trial_white_mannequin_american
// Params 12, eflags: 0x1 linked
// Checksum 0xb480260, Offset: 0x538
// Size: 0x66
function function_26edbcdc(inflictor, attacker, damage, flags, meansofdeath, weapon, point, dir, hitloc, offsettime, boneindex, modelindex) {
    return false;
}

// Namespace zm_trial_white_mannequin_american/zm_trial_white_mannequin_american
// Params 0, eflags: 0x5 linked
// Checksum 0xa7c8ce21, Offset: 0x5a8
// Size: 0x10e
function private function_545d53bf() {
    self endon(#"disconnect");
    level endon(#"hash_7646638df88a3656");
    var_407eb07 = 0;
    while (true) {
        var_972e1f84 = 0;
        dist = distancesquared(self.origin, level.mannequin_ally.origin);
        if (dist <= 40000) {
            var_972e1f84 = 1;
        }
        if (var_972e1f84 && var_407eb07) {
            self zm_trial_util::function_dc0859e();
            var_407eb07 = 0;
        } else if (!var_972e1f84 && !var_407eb07) {
            self zm_trial_util::function_bf710271();
            var_407eb07 = 1;
        }
        waitframe(1);
    }
}

// Namespace zm_trial_white_mannequin_american/zm_trial_white_mannequin_american
// Params 1, eflags: 0x5 linked
// Checksum 0x705ef076, Offset: 0x6c0
// Size: 0x124
function private function_33f0ddd3(s_event) {
    if (s_event.event === "give_weapon") {
        var_972e1f84 = 0;
        dist = distancesquared(self.origin, level.mannequin_ally.origin);
        if (dist <= 40000) {
            var_972e1f84 = 1;
        }
        if (!var_972e1f84 && !zm_loadout::function_2ff6913(s_event.weapon)) {
            self lockweapon(s_event.weapon, 1, 1);
            if (s_event.weapon.dualwieldweapon != level.weaponnone) {
                self lockweapon(s_event.weapon.dualwieldweapon, 1, 1);
            }
        }
    }
}

// Namespace zm_trial_white_mannequin_american/zm_trial_white_mannequin_american
// Params 1, eflags: 0x1 linked
// Checksum 0xb0b27d54, Offset: 0x7f0
// Size: 0x14c
function function_7532e17c(ai_mannequin) {
    level endon(#"end_game");
    obj_id = gameobjects::get_next_obj_id();
    if (!isdefined(self.a_n_objective_ids)) {
        self.a_n_objective_ids = [];
    } else if (!isarray(self.a_n_objective_ids)) {
        self.a_n_objective_ids = array(self.a_n_objective_ids);
    }
    self.a_n_objective_ids[self.a_n_objective_ids.size] = obj_id;
    objective_add(obj_id, "active", ai_mannequin, #"hash_423a75e2700a53ab");
    function_da7940a3(obj_id, 1);
    while (isdefined(ai_mannequin)) {
        waitframe(1);
    }
    objective_setinvisibletoall(obj_id);
    objective_delete(obj_id);
    gameobjects::release_obj_id(obj_id);
}

