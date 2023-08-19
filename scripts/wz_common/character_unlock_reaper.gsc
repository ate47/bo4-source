// Atian COD Tools GSC decompiler test
#include scripts/core_common/player/player_stats.gsc;
#include scripts/wz_common/character_unlock_fixup.gsc;
#include scripts/wz_common/character_unlock.gsc;
#include scripts/mp_common/gametypes/globallogic.gsc;
#include scripts/mp_common/teams/teams.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;

#namespace character_unlock_reaper;

// Namespace character_unlock_reaper/character_unlock_reaper
// Params 0, eflags: 0x2
// Checksum 0x11bb061b, Offset: 0xa0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_reaper", &__init__, undefined, #"character_unlock_reaper_fixup");
}

// Namespace character_unlock_reaper/character_unlock_reaper
// Params 0, eflags: 0x1 linked
// Checksum 0x881a5ffa, Offset: 0xf0
// Size: 0x34
function __init__() {
    character_unlock_fixup::function_90ee7a97(#"reaper_unlock", &function_2613aeec);
}

// Namespace character_unlock_reaper/character_unlock_reaper
// Params 1, eflags: 0x1 linked
// Checksum 0x3dc87fb7, Offset: 0x130
// Size: 0xa4
function function_2613aeec(enabled) {
    if (enabled) {
        callback::add_callback(#"hash_22c795c5dddbfc97", &function_381c1e1d);
        callback::add_callback(#"hash_48bcdfea6f43fecb", &function_1c4b5097);
        callback::add_callback(#"on_team_eliminated", &function_4ac25840);
    }
}

// Namespace character_unlock_reaper/character_unlock_reaper
// Params 1, eflags: 0x1 linked
// Checksum 0x46830873, Offset: 0x1e0
// Size: 0x12c
function function_1c4b5097(item) {
    var_a6762160 = item.var_a6762160;
    if (var_a6762160.name === #"cu35_item") {
        if (self character_unlock::function_f0406288(#"reaper_unlock")) {
            if (self stats::get_stat_global(#"kills_early") >= 115) {
                self character_unlock::function_c8beca5e(#"reaper_unlock", #"hash_555c37b28c4a770c", 1);
            }
            var_c503939b = globallogic::function_e9e52d05();
            if (var_c503939b <= function_c816ea5b()) {
                self character_unlock::function_c8beca5e(#"reaper_unlock", #"hash_555c3ab28c4a7c25", 1);
            }
        }
    }
}

// Namespace character_unlock_reaper/character_unlock_reaper
// Params 0, eflags: 0x1 linked
// Checksum 0x992007be, Offset: 0x318
// Size: 0x84
function function_381c1e1d() {
    if (self character_unlock::function_f0406288(#"reaper_unlock")) {
        if (self stats::get_stat_global(#"kills_early") >= 115) {
            self character_unlock::function_c8beca5e(#"reaper_unlock", #"hash_555c37b28c4a770c", 1);
        }
    }
}

// Namespace character_unlock_reaper/character_unlock_reaper
// Params 1, eflags: 0x1 linked
// Checksum 0xafa2a3b3, Offset: 0x3a8
// Size: 0x1e2
function function_4ac25840(dead_team) {
    if (isdefined(level.var_dcd43b16) && level.var_dcd43b16) {
        return;
    }
    var_c503939b = globallogic::function_e9e52d05();
    if (var_c503939b <= function_c816ea5b()) {
        foreach (team in level.teams) {
            if (teams::function_9dd75dad(team) && !teams::is_all_dead(team)) {
                players = getplayers(team);
                foreach (player in players) {
                    if (player character_unlock::function_f0406288(#"reaper_unlock")) {
                        player character_unlock::function_c8beca5e(#"reaper_unlock", #"hash_555c3ab28c4a7c25", 1);
                    }
                }
            }
        }
        level.var_dcd43b16 = 1;
    }
}

// Namespace character_unlock_reaper/character_unlock_reaper
// Params 0, eflags: 0x5 linked
// Checksum 0x1a7209d4, Offset: 0x598
// Size: 0x80
function private function_c816ea5b() {
    maxteamplayers = isdefined(getgametypesetting(#"maxteamplayers")) ? getgametypesetting(#"maxteamplayers") : 1;
    switch (maxteamplayers) {
    case 1:
        return 5;
    case 2:
        return 3;
    case 4:
    default:
        return 2;
    case 5:
        return 2;
    }
}

