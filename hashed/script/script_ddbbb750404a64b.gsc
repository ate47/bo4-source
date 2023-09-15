// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_287e05a2;

// Namespace namespace_287e05a2/namespace_287e05a2
// Params 0, eflags: 0x2
// Checksum 0xe13b5cd9, Offset: 0x90
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_73d9e3978f860555", &__init__, undefined, undefined);
}

// Namespace namespace_287e05a2/namespace_287e05a2
// Params 0, eflags: 0x1 linked
// Checksum 0xf5343f06, Offset: 0xd8
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"hash_69bf786a279d4ca6", &on_begin, &on_end);
}

// Namespace namespace_287e05a2/namespace_287e05a2
// Params 8, eflags: 0x5 linked
// Checksum 0xcf9c488c, Offset: 0x140
// Size: 0x248
function private on_begin(str_zone1, str_zone2, var_588808b1, var_91e2fb66, var_84245fe9, var_a7a5a6ef, var_11ec7b7b, var_cac66d30) {
    if (str_zone1 == #"hash_13aa327bb61b59de") {
        if (str_zone2 == #"zm_red_dark_side") {
            level.var_da1e5199 = array(#"zone_river_upper", #"zone_river_lower", #"zone_serpent_pass_upper", #"zone_serpent_pass_center", #"zone_serpent_pass_lower", #"zone_serpent_pass_bridge", #"zone_drakaina_arena", #"zone_cliff_tombs_upper", #"zone_cliff_tombs_forge", #"zone_cliff_tombs_center", #"zone_cliff_tombs_lower", #"zone_cliff_tombs_bridge", #"zone_ww_quest_death", #"zone_ww_quest_air");
        }
    } else {
        level.var_da1e5199 = array(str_zone1, str_zone2, var_588808b1, var_91e2fb66, var_84245fe9, var_a7a5a6ef, var_11ec7b7b, var_cac66d30);
        arrayremovevalue(level.var_da1e5199, undefined);
    }
    foreach (player in getplayers()) {
        player thread function_c465c67f();
    }
}

// Namespace namespace_287e05a2/namespace_287e05a2
// Params 1, eflags: 0x5 linked
// Checksum 0xa7c454c7, Offset: 0x390
// Size: 0x1a2
function private on_end(round_reset) {
    if (!round_reset) {
        var_696c3b4 = [];
        foreach (player in getplayers()) {
            if (!player.b_in_zone) {
                if (!isdefined(var_696c3b4)) {
                    var_696c3b4 = [];
                } else if (!isarray(var_696c3b4)) {
                    var_696c3b4 = array(var_696c3b4);
                }
                var_696c3b4[var_696c3b4.size] = player;
            }
        }
        if (var_696c3b4.size) {
            zm_trial::fail(#"hash_10a895033b20c705", var_696c3b4);
        }
    }
    foreach (player in getplayers()) {
        player.b_in_zone = undefined;
        player zm_trial_util::function_f3aacffb();
    }
    level.var_da1e5199 = undefined;
}

// Namespace namespace_287e05a2/namespace_287e05a2
// Params 0, eflags: 0x5 linked
// Checksum 0x565f8b76, Offset: 0x540
// Size: 0x110
function private function_c465c67f() {
    self endon(#"disconnect");
    level endon(#"hash_7646638df88a3656");
    self.b_in_zone = 0;
    self zm_trial_util::function_63060af4(0);
    while (1) {
        if (!self.b_in_zone && self zm_zonemgr::is_player_in_zone(level.var_da1e5199)) {
            self zm_trial_util::function_63060af4(1);
            self.b_in_zone = 1;
        } else if (self.b_in_zone && !self zm_zonemgr::is_player_in_zone(level.var_da1e5199)) {
            self zm_trial_util::function_63060af4(0);
            self.b_in_zone = 0;
        }
        waitframe(1);
    }
}

