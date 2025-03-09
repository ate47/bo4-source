#using script_6c983b627f4a3d51;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;
#using scripts\zm_common\zm_vo;

#namespace namespace_c8efdadc;

// Namespace namespace_c8efdadc/namespace_c8efdadc
// Params 0, eflags: 0x0
// Checksum 0x11b30b3a, Offset: 0x148
// Size: 0x94
function init() {
    level flag::init("fl_oracle_unlocked");
    level.s_apollo_bowl = struct::get("s_apollo_bowl", "targetname");
    level thread function_29bff3c6();
    level thread function_407b2b88();
    level thread function_e71df7b6();
}

// Namespace namespace_c8efdadc/namespace_c8efdadc
// Params 0, eflags: 0x0
// Checksum 0xbbfda061, Offset: 0x1e8
// Size: 0x1fe
function function_29bff3c6() {
    level endon(#"game_ended");
    level flag::wait_till("all_players_connected");
    level flag::wait_till("power_on");
    level.var_d5ba7324 = util::spawn_model(#"tag_origin", level.s_apollo_bowl.origin, level.s_apollo_bowl.angles);
    waitframe(1);
    level.var_705db276 = 1;
    level.var_d5ba7324 clientfield::set("" + #"hash_74fc30de57a0657a", level.var_705db276);
    a_players = getplayers();
    level.var_6a1bdc96 = 16 * a_players.size;
    level.var_ba3adfd9 = [];
    level.var_ba3adfd9[0] = 0;
    level.var_ba3adfd9[1] = level.var_6a1bdc96 * 0.15;
    level.var_ba3adfd9[2] = level.var_6a1bdc96 * 0.35;
    level.var_ba3adfd9[3] = level.var_6a1bdc96 * 0.55;
    level.var_ba3adfd9[4] = level.var_6a1bdc96 * 0.75;
    level.var_ba3adfd9[5] = level.var_6a1bdc96 * 1;
    level.var_7faa1e46 = 0;
}

// Namespace namespace_c8efdadc/namespace_c8efdadc
// Params 2, eflags: 0x0
// Checksum 0x671b40d, Offset: 0x3f0
// Size: 0x1d0
function function_9c8540b4(e_player, n_amount) {
    e_player endon(#"death");
    if (level.var_705db276 >= 5) {
        return;
    }
    if (isdefined(n_amount)) {
        level.var_7faa1e46 += n_amount;
        if (level.var_7faa1e46 >= level.var_ba3adfd9[level.var_705db276]) {
            while (level.var_7faa1e46 >= level.var_ba3adfd9[level.var_705db276]) {
                level.var_705db276++;
                if (level.var_705db276 == 5) {
                    break;
                }
            }
            level.var_d5ba7324 clientfield::set("" + #"hash_74fc30de57a0657a", level.var_705db276);
        }
        if (level.var_705db276 == 5) {
            level flag::set("fl_oracle_unlocked");
            foreach (player in getplayers()) {
                player zm_vo::vo_say(#"hash_4c29e41ef47ad9b2", 0, 1, 9999, 1, 1, 1);
            }
        }
    }
}

// Namespace namespace_c8efdadc/namespace_c8efdadc
// Params 0, eflags: 0x0
// Checksum 0x52750269, Offset: 0x5c8
// Size: 0xe4
function function_e71df7b6() {
    level flag::wait_till("all_players_connected");
    scene::add_scene_func("aib_vign_cust_zm_red_orcl", &function_f4472adf, "idle");
    level thread scene::play("aib_vign_cust_zm_red_orcl", "unconscious");
    level flag::wait_till("power_on");
    scene::play("aib_vign_cust_zm_red_orcl", "awaken");
    level thread scene::play("aib_vign_cust_zm_red_orcl", "idle");
}

// Namespace namespace_c8efdadc/namespace_c8efdadc
// Params 1, eflags: 0x0
// Checksum 0xdedfea88, Offset: 0x6b8
// Size: 0xe2
function function_f4472adf(a_ents) {
    level.var_bb7822b7 = [];
    level.var_bb7822b7[0] = a_ents[#"prop 1"];
    level.var_bb7822b7[1] = a_ents[#"prop 2"];
    level.var_bb7822b7[2] = a_ents[#"prop 3"];
    level.var_bb7822b7[3] = a_ents[#"prop 4"];
    level.var_bb7822b7[4] = a_ents[#"prop 5"];
}

// Namespace namespace_c8efdadc/namespace_c8efdadc
// Params 1, eflags: 0x0
// Checksum 0x46b626e, Offset: 0x7a8
// Size: 0x168
function function_53bac096(b_hide) {
    if (isdefined(level.var_7652563c) && level.var_7652563c) {
        level thread scene::play("aib_vign_cust_zm_red_orcl", "idle");
        wait 0.2;
    }
    if (!isdefined(level.var_bb7822b7)) {
        return;
    }
    if (b_hide) {
        foreach (mdl in level.var_bb7822b7) {
            mdl ghost();
        }
        return;
    }
    foreach (mdl in level.var_bb7822b7) {
        mdl show();
    }
}

// Namespace namespace_c8efdadc/namespace_c8efdadc
// Params 0, eflags: 0x0
// Checksum 0x252f6581, Offset: 0x918
// Size: 0xb4
function function_407b2b88() {
    level endon(#"game_ended");
    level flag::wait_till("all_players_connected");
    level flag::wait_till("power_on");
    level.var_483180c5 = getent("coal_brazier_apollo", "targetname");
    level.var_483180c5 clientfield::set("" + #"rob_coals", 1);
}

