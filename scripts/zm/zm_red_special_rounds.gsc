#using scripts\core_common\ai_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\math_shared;
#using scripts\zm_common\zm_powerups;
#using scripts\zm_common\zm_round_spawning;
#using scripts\zm_common\zm_utility;

#namespace zm_red_special_rounds;

// Namespace zm_red_special_rounds/zm_red_special_rounds
// Params 0, eflags: 0x1 linked
// Checksum 0x9b1c1c84, Offset: 0xa0
// Size: 0x27c
function init() {
    if (zm_utility::is_standard()) {
        return;
    }
    if (!isdefined(level.var_9ce0f2a5)) {
        level.var_9ce0f2a5 = 0;
    }
    if (!isdefined(level.var_9b1fafcf)) {
        level.var_9b1fafcf = 0;
    }
    if (!isdefined(level.var_4c6c91cf)) {
        level.var_4c6c91cf = 0;
    }
    level.var_95c10956 = &function_a0488ba8;
    level flag::init(#"flag_gegenees_set_intro");
    level flag::init(#"flag_skeleton_set_intro");
    zm_round_spawning::function_cc103b38(#"catalyst", 7);
    zm_round_spawning::function_cc103b38(#"blight_father", 14);
    zm_round_spawning::function_2876740e(#"catalyst", &function_2ffc8cca);
    zm_round_spawning::function_2876740e(#"blight_father", &function_ec882ff);
    zm_round_spawning::function_2876740e(#"gegenees", &function_57fd9735);
    zm_round_spawning::function_306ce518(#"blight_father", &function_fa00e485);
    zm_round_spawning::function_306ce518(#"gegenees", &function_c1a0ea97);
    level thread function_6957c745(#"skeleton", 8, #"flag_skeleton_set_intro");
    level thread function_6957c745(#"gegenees", 12, #"flag_gegenees_set_intro");
    level thread function_990c303a();
}

// Namespace zm_red_special_rounds/zm_red_special_rounds
// Params 1, eflags: 0x1 linked
// Checksum 0xa21bb2c9, Offset: 0x328
// Size: 0xca
function function_fa00e485(n_round_number) {
    level endon(#"end_game");
    while (true) {
        level waittill(#"hash_5d3012139f083ccb");
        if (zm_round_spawning::function_d0db51fc(#"blight_father") && !(isdefined(level.var_153e9058) && level.var_153e9058)) {
            if (isdefined(level.var_9ce0f2a5)) {
                level.var_9ce0f2a5 = level.round_number + randomintrangeinclusive(4, 6);
            }
        }
    }
}

// Namespace zm_red_special_rounds/zm_red_special_rounds
// Params 1, eflags: 0x1 linked
// Checksum 0x392a401f, Offset: 0x400
// Size: 0xca
function function_c1a0ea97(n_round_number) {
    level endon(#"end_game");
    while (true) {
        level waittill(#"hash_5d3012139f083ccb");
        if (zm_round_spawning::function_d0db51fc(#"gegenees") && !(isdefined(level.var_153e9058) && level.var_153e9058)) {
            if (isdefined(level.var_9ce0f2a5)) {
                level.var_9ce0f2a5 = level.round_number + randomintrangeinclusive(4, 6);
            }
        }
    }
}

// Namespace zm_red_special_rounds/zm_red_special_rounds
// Params 0, eflags: 0x1 linked
// Checksum 0x8cf4193d, Offset: 0x4d8
// Size: 0xce
function function_990c303a() {
    level endon(#"end_game");
    while (true) {
        level waittill(#"end_of_round");
        level.var_4c6c91cf = 0;
        if (level.players.size == 1) {
            level.var_9b1fafcf = 1;
            continue;
        }
        if (level.round_number <= 10) {
            level.var_9b1fafcf = 1;
            continue;
        }
        if (level.round_number <= 17) {
            level.var_9b1fafcf = 2;
            continue;
        }
        level.var_9b1fafcf = 3;
    }
}

// Namespace zm_red_special_rounds/zm_red_special_rounds
// Params 1, eflags: 0x1 linked
// Checksum 0x9a349d3c, Offset: 0x5b0
// Size: 0x2a
function function_2ffc8cca(n_max) {
    return int(n_max * 0.4);
}

// Namespace zm_red_special_rounds/zm_red_special_rounds
// Params 1, eflags: 0x1 linked
// Checksum 0xd48ee40d, Offset: 0x5e8
// Size: 0x140
function function_ec882ff(n_max) {
    if (isdefined(level.var_9ce0f2a5)) {
        if (level.round_number < level.var_9ce0f2a5) {
            return 0;
        }
    }
    if (randomint(100) > 25) {
        return 0;
    }
    if (level.players.size == 1) {
        var_1797c23a = 1;
    } else if (level.round_number <= 10) {
        var_1797c23a = 1;
    } else if (level.round_number <= 17) {
        var_1797c23a = 2;
    } else {
        var_1797c23a = 3;
    }
    var_2506688 = 1;
    n_num_to_spawn = randomintrangeinclusive(int(var_2506688), var_1797c23a);
    if (level.var_4c6c91cf < level.var_9b1fafcf) {
        level.var_4c6c91cf += n_num_to_spawn;
        return n_num_to_spawn;
    }
    return 0;
}

// Namespace zm_red_special_rounds/zm_red_special_rounds
// Params 1, eflags: 0x1 linked
// Checksum 0x5c2d1d21, Offset: 0x730
// Size: 0x120
function function_57fd9735(n_max) {
    if (isdefined(level.var_9ce0f2a5)) {
        if (level.round_number < level.var_9ce0f2a5) {
            return 0;
        }
    }
    if (level.players.size == 1) {
        var_1797c23a = 1;
    } else if (level.round_number <= 10) {
        var_1797c23a = 1;
    } else if (level.round_number <= 17) {
        var_1797c23a = 2;
    } else {
        var_1797c23a = 3;
    }
    var_2506688 = 1;
    n_num_to_spawn = randomintrangeinclusive(int(var_2506688), var_1797c23a);
    if (level.var_4c6c91cf < level.var_9b1fafcf) {
        level.var_4c6c91cf += n_num_to_spawn;
        return n_num_to_spawn;
    }
    return 0;
}

// Namespace zm_red_special_rounds/zm_red_special_rounds
// Params 3, eflags: 0x1 linked
// Checksum 0x855e5226, Offset: 0x858
// Size: 0x84
function function_6957c745(str_archetype, n_round, var_b2239dab) {
    if (isdefined(var_b2239dab)) {
        level thread function_36c1dcca(n_round, var_b2239dab);
        level flag::wait_till(var_b2239dab);
        n_round = level.round_number;
    }
    zm_round_spawning::function_376e51ef(str_archetype, n_round);
}

// Namespace zm_red_special_rounds/zm_red_special_rounds
// Params 2, eflags: 0x1 linked
// Checksum 0x8cb8a985, Offset: 0x8e8
// Size: 0x74
function function_36c1dcca(n_round, var_b2239dab) {
    level endon(#"end_game", var_b2239dab);
    while (level.round_number < n_round) {
        level waittill(#"end_of_round");
    }
    level flag::set(var_b2239dab);
}

// Namespace zm_red_special_rounds/zm_red_special_rounds
// Params 0, eflags: 0x1 linked
// Checksum 0x9eb93800, Offset: 0x968
// Size: 0x1a4
function function_a0488ba8() {
    a_e_zombies = getaiarray();
    var_a128313 = 0;
    foreach (e_zombie in a_e_zombies) {
        if (isalive(e_zombie) && isdefined(e_zombie.archetype) && isinarray(array(#"blight_father", #"brutus", #"gegenees"), e_zombie.archetype)) {
            var_a128313++;
        }
    }
    if (isarray(level.var_b175714d) && isdefined(level.var_b175714d[#"blight_father"]) && isdefined(level.var_b175714d[#"blight_father"].var_33e393a7)) {
        var_a128313 += level.var_b175714d[#"blight_father"].var_33e393a7;
    }
    return var_a128313;
}

