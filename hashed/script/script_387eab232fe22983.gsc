#using script_ab862743b3070a;
#using scripts\zm_common\trials\zm_trial_special_enemy.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_round_spawning.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_transformation.gsc;
#using scripts\zm_common\ai\zm_ai_utility.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace zombie_werewolf_util;

// Namespace zombie_werewolf_util/ai_werewolf_util
// Params 0, eflags: 0x2
// Checksum 0x54860100, Offset: 0x180
// Size: 0x54
function autoexec __init__system__() {
    system::register(#"zombie_werewolf_util", &__init__, &__main__, #"zm_ai_werewolf");
}

// Namespace zombie_werewolf_util/ai_werewolf_util
// Params 0, eflags: 0x1 linked
// Checksum 0xb63c130d, Offset: 0x1e0
// Size: 0x1bc
function __init__() {
    level.a_sp_werewolf = getentarray("zombie_werewolf_spawner", "script_noteworthy");
    if (level.a_sp_werewolf.size == 0) {
        assertmsg("<dev string:x38>");
        return;
    }
    foreach (sp_werewolf in level.a_sp_werewolf) {
        sp_werewolf.is_enabled = 1;
        sp_werewolf.script_forcespawn = 1;
    }
    zm_score::function_e5d6e6dd(#"werewolf", 250);
    zm_round_spawning::register_archetype(#"werewolf", &function_45bed901, &round_spawn, &function_47a88a0c, 300);
    zm_round_spawning::function_306ce518(#"werewolf", &function_d7a8d5a8);
    zm_trial_special_enemy::function_95c1dd81(#"werewolf", &function_fb4cbb48);
}

// Namespace zombie_werewolf_util/ai_werewolf_util
// Params 0, eflags: 0x1 linked
// Checksum 0x5657a7b0, Offset: 0x3a8
// Size: 0x6c
function __main__() {
    zm_transform::function_cfca77a7(#"spawner_zm_werewolf", #"werewolf", &function_39212989, 1, undefined, undefined, "aib_vign_zm_mnsn_werewolf_pre_transform", "aib_vign_zm_mnsn_werewolf_post_transform", &function_5c0a0b26);
}

// Namespace zombie_werewolf_util/ai_werewolf_util
// Params 0, eflags: 0x5 linked
// Checksum 0x5f7684bd, Offset: 0x420
// Size: 0x1e
function private function_39212989() {
    if (!zm_ai_utility::function_db610082()) {
        return false;
    }
    return true;
}

// Namespace zombie_werewolf_util/ai_werewolf_util
// Params 2, eflags: 0x5 linked
// Checksum 0xe21a923b, Offset: 0x448
// Size: 0x14
function private function_5c0a0b26(zombie, var_167b5341) {
    
}

// Namespace zombie_werewolf_util/ai_werewolf_util
// Params 0, eflags: 0x1 linked
// Checksum 0xfef87e04, Offset: 0x468
// Size: 0xbc
function function_6268b69f() {
    var_47469148 = getaiarchetypearray(#"werewolf");
    var_492bcd12 = var_47469148.size;
    foreach (ai_werewolf in var_47469148) {
        if (!isalive(ai_werewolf)) {
            var_492bcd12--;
        }
    }
    return var_492bcd12;
}

// Namespace zombie_werewolf_util/ai_werewolf_util
// Params 0, eflags: 0x1 linked
// Checksum 0xc61e8b74, Offset: 0x530
// Size: 0xbc
function function_15d944aa() {
    var_492bcd12 = function_6268b69f();
    var_2bf29cda = function_1f269f0f();
    if (!(isdefined(level.var_76934955) && level.var_76934955) && (isdefined(level.var_fe2bb2ac) && level.var_fe2bb2ac || var_492bcd12 >= var_2bf29cda || !level flag::get("spawn_zombies"))) {
        return false;
    }
    return true;
}

// Namespace zombie_werewolf_util/ai_werewolf_util
// Params 0, eflags: 0x1 linked
// Checksum 0xb9352ef9, Offset: 0x5f8
// Size: 0x8a
function function_1f269f0f() {
    switch (getplayers().size) {
    case 1:
        return 1;
    case 2:
        return 2;
    case 3:
        return 2;
    case 4:
        return 3;
    }
}

// Namespace zombie_werewolf_util/ai_werewolf_util
// Params 0, eflags: 0x1 linked
// Checksum 0x80f3006e, Offset: 0x690
// Size: 0xb0
function function_cd674a85() {
    switch (getplayers().size) {
    case 1:
        n_default_wait = 2.25;
        break;
    case 2:
        n_default_wait = 1.75;
        break;
    case 3:
        n_default_wait = 1.25;
        break;
    default:
        n_default_wait = 0.75;
        break;
    }
    wait(n_default_wait);
}

// Namespace zombie_werewolf_util/ai_werewolf_util
// Params 0, eflags: 0x5 linked
// Checksum 0x30a276c6, Offset: 0x748
// Size: 0x2a
function private function_fb4cbb48() {
    ai_werewolf = function_47a88a0c(undefined, undefined, 1);
    return isdefined(ai_werewolf);
}

// Namespace zombie_werewolf_util/ai_werewolf_util
// Params 3, eflags: 0x1 linked
// Checksum 0x4f9dbfef, Offset: 0x780
// Size: 0xd8
function function_a7a6a96c(spawner, s_spot, n_round_number) {
    ai_werewolf = zombie_utility::spawn_zombie(level.a_sp_werewolf[0], "stoker", s_spot, n_round_number);
    if (isdefined(ai_werewolf)) {
        if (isdefined(s_spot.scriptbundlename)) {
            s_spot thread scene::play(s_spot.scriptbundlename, array(ai_werewolf));
        } else {
            ai_werewolf.check_point_in_enabled_zone = &zm_utility::check_point_in_playable_area;
            ai_werewolf thread zombie_utility::round_spawn_failsafe();
        }
    }
    return ai_werewolf;
}

// Namespace zombie_werewolf_util/ai_werewolf_util
// Params 0, eflags: 0x1 linked
// Checksum 0x13fbfe00, Offset: 0x860
// Size: 0x138
function get_favorite_enemy() {
    a_targets = getplayers();
    least_hunted = a_targets[0];
    for (i = 0; i < a_targets.size; i++) {
        if (!isdefined(a_targets[i].hunted_by)) {
            a_targets[i].hunted_by = 0;
        }
        if (!zm_utility::is_player_valid(a_targets[i])) {
            continue;
        }
        if (!zm_utility::is_player_valid(least_hunted)) {
            least_hunted = a_targets[i];
        }
        if (a_targets[i].hunted_by < least_hunted.hunted_by) {
            least_hunted = a_targets[i];
        }
    }
    if (!zm_utility::is_player_valid(least_hunted)) {
        return undefined;
    }
    least_hunted.hunted_by += 1;
    return least_hunted;
}

// Namespace zombie_werewolf_util/ai_werewolf_util
// Params 0, eflags: 0x1 linked
// Checksum 0x6554f926, Offset: 0x9a0
// Size: 0x3c
function round_spawn() {
    ai = function_47a88a0c();
    if (isdefined(ai)) {
        level.zombie_total--;
        return true;
    }
    return false;
}

// Namespace zombie_werewolf_util/ai_werewolf_util
// Params 5, eflags: 0x1 linked
// Checksum 0x3969a656, Offset: 0x9e8
// Size: 0x2fc
function function_47a88a0c(n_to_spawn = 1, var_1fafa3fc, b_force_spawn = 0, var_eb3a8721, n_round) {
    n_spawned = 0;
    while (n_spawned < n_to_spawn) {
        if (!b_force_spawn && !function_15d944aa()) {
            return n_spawned;
        }
        players = getplayers();
        var_46d2ec35 = get_favorite_enemy();
        if (isdefined(var_eb3a8721)) {
            s_spawn_loc = var_eb3a8721;
        } else if (isdefined(level.var_b106cd7a)) {
            s_spawn_loc = [[ level.var_b106cd7a ]]();
        } else if (level.zm_loc_types[#"werewolf_location"].size > 0) {
            s_spawn_loc = array::random(level.zm_loc_types[#"werewolf_location"]);
        }
        if (!isdefined(s_spawn_loc)) {
            return;
        }
        ai = function_a7a6a96c(level.a_sp_werewolf[0], s_spawn_loc, n_round);
        if (isdefined(ai)) {
            ai forceteleport(s_spawn_loc.origin, s_spawn_loc.angles);
            ai.script_string = s_spawn_loc.script_string;
            ai.find_flesh_struct_string = ai.script_string;
            if (isdefined(var_eb3a8721) || zm_utility::is_standard()) {
                ai.var_cf3ac201 = 0;
            } else {
                ai.var_cf3ac201 = 1;
            }
            if (isdefined(var_46d2ec35)) {
                ai.favoriteenemy = var_46d2ec35;
                ai.favoriteenemy.hunted_by++;
            }
            n_spawned++;
            if (isdefined(level.var_7e40409b)) {
                ai thread [[ level.var_7e40409b ]](s_spawn_loc);
            }
            if (isdefined(var_1fafa3fc)) {
                ai thread [[ var_1fafa3fc ]]();
            }
            ai playsound(#"hash_63299a75a97f9678");
            bhtnactionstartevent(ai, "spawn");
        }
        function_cd674a85();
    }
    return ai;
}

// Namespace zombie_werewolf_util/ai_werewolf_util
// Params 4, eflags: 0x1 linked
// Checksum 0x7050067e, Offset: 0xcf0
// Size: 0x184
function function_774f6e70(s_spawn_loc, var_58a8a3cb = 1, var_cda6f9a7 = undefined, var_d5e7e76d = undefined) {
    self endon(#"death", #"patrol_done");
    if (!(isdefined(self.var_cf3ac201) && self.var_cf3ac201)) {
        return;
    }
    if (isdefined(s_spawn_loc.target)) {
        s_patrol = zm_ai_utility::get_pathnode_path(getnode(s_spawn_loc.target, "targetname"));
        zm_ai_utility::start_patrol(self, s_patrol.path, s_patrol.loops, var_cda6f9a7, var_d5e7e76d);
        if (var_58a8a3cb) {
            for (n_timer = randomintrange(60, 90); n_timer > 0 && level.var_9427911d > 15; n_timer--) {
                wait(1);
            }
            zm_ai_utility::stop_patrol(self);
        }
    }
}

// Namespace zombie_werewolf_util/ai_werewolf_util
// Params 0, eflags: 0x0
// Checksum 0xca271b31, Offset: 0xe80
// Size: 0x1c
function function_7c14f53f() {
    zm_ai_utility::stop_patrol(self);
}

// Namespace zombie_werewolf_util/ai_werewolf_util
// Params 1, eflags: 0x1 linked
// Checksum 0x4dd4ced4, Offset: 0xea8
// Size: 0xe2
function function_d7a8d5a8(n_round_number) {
    level endon(#"end_game");
    if (!isdefined(level.var_d7b601b9)) {
        level.var_d7b601b9 = 0;
    }
    while (true) {
        level waittill(#"hash_5d3012139f083ccb");
        if (zm_round_spawning::function_d0db51fc(#"werewolf") && !(isdefined(level.var_153e9058) && level.var_153e9058)) {
            level.var_d7b601b9++;
            level.var_2c03ab22 = level.round_number + randomintrangeinclusive(3, 5);
        }
    }
}

// Namespace zombie_werewolf_util/ai_werewolf_util
// Params 1, eflags: 0x1 linked
// Checksum 0xe080d718, Offset: 0xf98
// Size: 0x222
function function_45bed901(var_dbce0c44) {
    var_8cf00d40 = int(floor(var_dbce0c44 / 300));
    if (isdefined(level.var_2c03ab22) && level.round_number < level.var_2c03ab22) {
        return 0;
    }
    var_2506688 = 1;
    var_1797c23a = 1;
    n_player_count = zm_utility::function_a2541519(level.players.size);
    if (n_player_count > 1) {
        switch (level.var_d7b601b9) {
        case 0:
            break;
        case 1:
            var_1797c23a = 2;
            break;
        case 2:
            var_1797c23a = 3;
            break;
        case 3:
            var_2506688 = 1;
            var_1797c23a = 3;
            break;
        case 4:
            var_2506688 = 2;
            var_1797c23a = 3;
            break;
        default:
            var_2506688 = 3;
            var_1797c23a = 3;
            break;
        }
    } else if (level.round_number >= 40) {
        var_1797c23a = 3;
    } else if (level.round_number >= 30) {
        var_1797c23a = 2;
    } else {
        var_1797c23a = 1;
    }
    return randomintrangeinclusive(var_2506688, int(min(var_8cf00d40, var_1797c23a)));
}

