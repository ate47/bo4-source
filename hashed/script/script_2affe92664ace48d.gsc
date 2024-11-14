#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_score;
#using scripts\zm_common\zm_round_spawning;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\ai\zm_ai_utility;
#using scripts\zm_common\trials\zm_trial_add_special;
#using scripts\zm\ai\zm_ai_tiger;
#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\ai\archetype_tiger;
#using scripts\core_common\util_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\spawner_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\ai_shared;

#namespace zombie_tiger_util;

// Namespace zombie_tiger_util/ai_tiger_util
// Params 0, eflags: 0x2
// Checksum 0x3f99401f, Offset: 0x140
// Size: 0x54
function autoexec __init__system__() {
    system::register(#"zombie_tiger_util", &__init__, &__main__, #"zm_ai_tiger");
}

// Namespace zombie_tiger_util/ai_tiger_util
// Params 0, eflags: 0x1 linked
// Checksum 0x61f94a66, Offset: 0x1a0
// Size: 0xb4
function __init__() {
    level.var_4ead8122 = getentarray("zombie_tiger_spawner", "script_noteworthy");
    if (level.var_4ead8122.size == 0) {
        assertmsg("<dev string:x38>");
        return;
    }
    zm_round_spawning::register_archetype(#"tiger", &function_235d0eb6, &round_spawn, &spawn_single, 25);
}

// Namespace zombie_tiger_util/ai_tiger_util
// Params 0, eflags: 0x1 linked
// Checksum 0x8288f6f7, Offset: 0x260
// Size: 0x7c
function __main__() {
    zm_score::function_e5d6e6dd(#"tiger", level.var_4ead8122[0] ai::function_9139c839().var_7a715ab5);
    spawner::add_archetype_spawn_function(#"tiger", &function_fe4c8547);
}

// Namespace zombie_tiger_util/ai_tiger_util
// Params 0, eflags: 0x1 linked
// Checksum 0xe65fa07, Offset: 0x2e8
// Size: 0xac
function function_fe4c8547() {
    self thread function_94c9b195();
    var_1751372a = zm_ai_utility::function_8d44707e(0);
    var_1751372a *= isdefined(level.var_1eb98fb1) ? level.var_1eb98fb1 : 1;
    var_1751372a = int(var_1751372a);
    self.health = var_1751372a;
    self.maxhealth = var_1751372a;
    self zm_score::function_82732ced();
}

// Namespace zombie_tiger_util/ai_tiger_util
// Params 2, eflags: 0x1 linked
// Checksum 0x1c76925c, Offset: 0x3a0
// Size: 0x1e8
function spawn_single(b_force_spawn = 0, var_eb3a8721) {
    if (!b_force_spawn && !function_66cfd7d()) {
        return undefined;
    }
    players = getplayers();
    if (isdefined(var_eb3a8721)) {
        s_spawn_loc = var_eb3a8721;
    } else if (isdefined(level.var_fcde6b4)) {
        s_spawn_loc = [[ level.var_fcde6b4 ]]();
    } else if (level.zm_loc_types[#"tiger_location"].size > 0) {
        s_spawn_loc = array::random(level.zm_loc_types[#"tiger_location"]);
    }
    if (!isdefined(s_spawn_loc)) {
        return undefined;
    }
    ai = zombie_utility::spawn_zombie(level.var_4ead8122[0], "tiger");
    if (isdefined(ai)) {
        ai.script_string = s_spawn_loc.script_string;
        ai.find_flesh_struct_string = s_spawn_loc.find_flesh_struct_string;
        ai.check_point_in_enabled_zone = &zm_utility::check_point_in_playable_area;
        ai thread zombie_utility::round_spawn_failsafe();
        ai forceteleport(s_spawn_loc.origin, s_spawn_loc.angles);
        if (isdefined(level.tiger_on_spawned)) {
            ai thread [[ level.tiger_on_spawned ]](s_spawn_loc);
        }
    }
    return ai;
}

// Namespace zombie_tiger_util/ai_tiger_util
// Params 0, eflags: 0x1 linked
// Checksum 0x7bec0d6f, Offset: 0x590
// Size: 0x9a
function function_66cfd7d() {
    var_6ecc1639 = function_ba8172ca();
    var_b3c0e90e = function_cbfb0da4();
    if (var_6ecc1639 >= var_b3c0e90e || !level flag::get("spawn_zombies") || isdefined(level.var_5e45f817) && level.var_5e45f817) {
        return false;
    }
    return true;
}

// Namespace zombie_tiger_util/ai_tiger_util
// Params 0, eflags: 0x1 linked
// Checksum 0xa22240bc, Offset: 0x638
// Size: 0xf8
function function_cbfb0da4() {
    n_player_count = zm_utility::function_a2541519(getplayers().size);
    switch (n_player_count) {
    case 1:
        var_ed61bfaa = 3;
        break;
    case 2:
        var_ed61bfaa = 5;
        break;
    case 3:
        var_ed61bfaa = 7;
        break;
    default:
        var_ed61bfaa = 10;
        break;
    }
    if (zm_trial_add_special::is_active(#"tiger")) {
        var_ed61bfaa *= 4;
    }
    return var_ed61bfaa;
}

// Namespace zombie_tiger_util/ai_tiger_util
// Params 0, eflags: 0x1 linked
// Checksum 0x4779da8c, Offset: 0x738
// Size: 0xbc
function function_ba8172ca() {
    var_cf9c1780 = getaiarchetypearray(#"tiger");
    var_6ecc1639 = var_cf9c1780.size;
    foreach (ai_tiger in var_cf9c1780) {
        if (!isalive(ai_tiger)) {
            var_6ecc1639--;
        }
    }
    return var_6ecc1639;
}

// Namespace zombie_tiger_util/ai_tiger_util
// Params 0, eflags: 0x1 linked
// Checksum 0xcb62ab7e, Offset: 0x800
// Size: 0xd0
function function_ffa01525() {
    n_player_count = zm_utility::function_a2541519(level.players.size);
    switch (n_player_count) {
    case 1:
        n_default_wait = 1;
        break;
    case 2:
        n_default_wait = 0.75;
        break;
    case 3:
        n_default_wait = 0.5;
        break;
    default:
        n_default_wait = 0.25;
        break;
    }
    wait n_default_wait;
}

// Namespace zombie_tiger_util/ai_tiger_util
// Params 0, eflags: 0x1 linked
// Checksum 0x4fd8c79d, Offset: 0x8d8
// Size: 0x54
function function_94c9b195() {
    self endon(#"death");
    if (level flag::get("special_round")) {
        self ai::set_behavior_attribute("sprint", 1);
    }
}

// Namespace zombie_tiger_util/ai_tiger_util
// Params 1, eflags: 0x1 linked
// Checksum 0xa4da1771, Offset: 0x938
// Size: 0xc2
function function_235d0eb6(var_dbce0c44) {
    if (isdefined(level.var_5e45f817) && level.var_5e45f817) {
        return 0;
    }
    var_8cf00d40 = int(floor(var_dbce0c44 / 25));
    var_a1737466 = randomfloatrange(0.08, 0.12);
    return min(var_8cf00d40, int(level.zombie_total * var_a1737466));
}

// Namespace zombie_tiger_util/ai_tiger_util
// Params 0, eflags: 0x1 linked
// Checksum 0x4e3b861d, Offset: 0xa08
// Size: 0x3c
function round_spawn() {
    ai = spawn_single();
    if (isdefined(ai)) {
        level.zombie_total--;
        return true;
    }
    return false;
}

