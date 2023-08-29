// Atian COD Tools GSC decompiler test
#include scripts/core_common/ai/zombie_utility.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/zm_common/trials/zm_trial_crawlers_only.gsc;
#include scripts/zm_common/trials/zm_trial_use_magicbox.gsc;
#include script_444bc5b4fa0fe14f;
#include scripts/zm_common/trials/zm_trial_force_archetypes.gsc;
#include script_ddbbb750404a64b;
#include script_75f53105a210f2f7;
#include scripts/zm_common/trials/zm_trial_no_powerups.gsc;
#include script_3c775b8df460b415;
#include script_67da0c3654a906b6;
#include script_1d1e3c193b0a51d;
#include script_6ff72d27da99fb12;
#include scripts/zm_common/trials/zm_trial_friendly_fire.gsc;
#include scripts/zm_common/trials/zm_trial_no_ads.gsc;
#include script_30ba61ad5559c51d;
#include scripts/zm_common/trials/zm_trial_close_quarters.gsc;
#include scripts/zm_common/trials/zm_trial_disable_hud.gsc;
#include script_35d3717bf2cbee8f;
#include scripts/zm_common/trials/zm_trial_disable_buys.gsc;
#include script_698dd790cdc4965f;
#include scripts/zm_common/trials/zm_trial_disable_perks.gsc;
#include scripts/zm_common/trials/zm_trial_disable_bgbs.gsc;
#include script_112484f657ccd8b7;
#include script_6951ea86fdae9ae0;
#include scripts/zm_common/trials/zm_trial_random_teleport.gsc;
#include script_45993630a26b2d85;
#include scripts/zm_common/trials/zm_trial_timeout.gsc;
#include scripts/zm_common/trials/zm_trial_open_all_doors.gsc;
#include scripts/zm_common/trials/zm_trial_disable_regen.gsc;
#include script_3688d332e17e9ac1;
#include scripts/zm_common/trials/zm_trial_sprinters_only.gsc;
#include scripts/zm_common/trials/zm_trial_super_sprinters_only.gsc;
#include scripts/zm_common/zm_round_spawning.gsc;
#include scripts/zm_common/zm_trial.gsc;

#namespace namespace_698ca3bb;

// Namespace namespace_698ca3bb/namespace_698ca3bb
// Params 0, eflags: 0x6
// Checksum 0x52dca983, Offset: 0x1a0
// Size: 0x24
function autoexec private function_88c28903() {
    zm_round_spawning::function_54fee373(&function_6bf7d04f);
}

// Namespace namespace_698ca3bb/namespace_698ca3bb
// Params 1, eflags: 0x5 linked
// Checksum 0xaca45a51, Offset: 0x1d0
// Size: 0x71e
function private function_6bf7d04f(var_c766fbe6) {
    if (!zm_trial::is_trial_mode()) {
        return var_c766fbe6;
    }
    if (!isdefined(var_c766fbe6[#"blight_father"])) {
        var_c766fbe6[#"blight_father"] = 0;
    }
    if (!isdefined(var_c766fbe6[#"stoker"])) {
        var_c766fbe6[#"stoker"] = 0;
    }
    if (!isdefined(var_c766fbe6[#"catalyst"])) {
        var_c766fbe6[#"catalyst"] = 0;
    }
    /#
        assert(isdefined(level.var_6d87ac05));
    #/
    /#
        assert(isdefined(level.var_d77a6967));
    #/
    a_human_players = util::get_human_players(#"allies");
    player_count = a_human_players.size;
    if (level.round_number == 24) {
        /#
            assert(level.var_d77a6967.name == #"unhealthy");
        #/
        if (player_count == 1) {
            var_c766fbe6[#"blight_father"] = 2;
        } else {
            var_c766fbe6[#"blight_father"] = 4;
        }
    } else if (level.round_number == 28) {
        /#
            assert(level.var_d77a6967.name == #"hash_7aff6c8730240d5");
        #/
        var_c766fbe6[#"blight_father"] = max(var_c766fbe6[#"blight_father"], 1);
        var_c766fbe6[#"stoker"] = max(var_c766fbe6[#"stoker"], 1);
        var_c766fbe6[#"catalyst"] = max(var_c766fbe6[#"catalyst"], 1);
        var_c766fbe6[#"blight_father"] = int(ceil(var_c766fbe6[#"blight_father"] * 1.3));
        var_c766fbe6[#"stoker"] = int(ceil(var_c766fbe6[#"stoker"] * 1.3));
        var_c766fbe6[#"catalyst"] = int(ceil(var_c766fbe6[#"catalyst"] * 1.3));
    } else if (level.round_number == 30) {
        /#
            assert(level.var_d77a6967.name == #"hash_37f11d9a44a08099", "<unknown string>");
        #/
        if (getgametypesetting("zmTrialsVariant")) {
            level.var_43fb4347 = "walk";
            level.var_102b1301 = "run";
            var_84572f0c = 0;
            foreach (player in getplayers()) {
                if (isbot(player)) {
                    var_84572f0c++;
                }
            }
            if (var_84572f0c > 0) {
                level.zombie_total = int(level.zombie_total / var_84572f0c);
            }
            foreach (player in getplayers()) {
                player gadgetpowerset(level.var_a53a05b5, 100);
            }
            if (player_count == 1) {
                var_c766fbe6[#"blight_father"] = 1;
            } else {
                var_c766fbe6[#"blight_father"] = 2;
            }
        } else if (player_count == 1) {
            var_c766fbe6[#"blight_father"] = 3;
            var_c766fbe6[#"stoker"] = var_c766fbe6[#"stoker"] + 2;
            var_c766fbe6[#"catalyst"] = var_c766fbe6[#"catalyst"] + 8;
        } else {
            var_c766fbe6[#"blight_father"] = 8;
            var_c766fbe6[#"stoker"] = var_c766fbe6[#"stoker"] + 4;
            var_c766fbe6[#"catalyst"] = var_c766fbe6[#"catalyst"] + 16;
        }
    }
    return var_c766fbe6;
}

