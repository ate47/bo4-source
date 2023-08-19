// Atian COD Tools GSC decompiler test
#include scripts/wz_common/character_unlock_fixup.gsc;
#include scripts/wz_common/character_unlock.gsc;
#include scripts/mp_common/teams/teams.gsc;
#include scripts/mp_common/item_world_fixup.gsc;
#include scripts/mp_common/gametypes/globallogic.gsc;
#include scripts/core_common/player/player_stats.gsc;
#include scripts/core_common/clientfield_shared.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;

#namespace character_unlock_mason;

// Namespace character_unlock_mason/character_unlock_mason
// Params 0, eflags: 0x2
// Checksum 0x1c210abd, Offset: 0xf0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_mason", &__init__, undefined, #"character_unlock_mason_fixup");
}

// Namespace character_unlock_mason/character_unlock_mason
// Params 0, eflags: 0x1 linked
// Checksum 0xa10b630e, Offset: 0x140
// Size: 0x94
function __init__() {
    clientfield::register("world", "array_broadcast", 1, 1, "int");
    clientfield::register("toplayer", "array_effects", 1, 1, "int");
    character_unlock_fixup::function_90ee7a97(#"mason_unlock", &function_2613aeec);
}

// Namespace character_unlock_mason/character_unlock_mason
// Params 1, eflags: 0x1 linked
// Checksum 0x976c483f, Offset: 0x1e0
// Size: 0x176
function function_2613aeec(enabled) {
    if (enabled) {
        callback::add_callback(#"hash_48bcdfea6f43fecb", &function_1c4b5097);
        callback::add_callback(#"on_team_eliminated", &function_4ac25840);
        if (isdefined(getgametypesetting(#"hash_17f17e92c2654659")) && getgametypesetting(#"hash_17f17e92c2654659")) {
            item_world_fixup::function_e70fa91c(#"hash_2e8c8c85b6034ab3", #"hash_d215d711186a8db", 1);
        } else {
            item_world_fixup::function_e70fa91c(#"supply_stash_parent_dlc1", #"hash_d215d711186a8db", 6);
        }
        dynent = getdynent(#"array_broadcast");
        if (isdefined(dynent)) {
            dynent.onuse = &function_1e224132;
        }
    }
}

// Namespace character_unlock_mason/character_unlock_mason
// Params 1, eflags: 0x1 linked
// Checksum 0x2676f52, Offset: 0x360
// Size: 0xdc
function function_1c4b5097(item) {
    var_a6762160 = item.var_a6762160;
    if (isdefined(var_a6762160) && var_a6762160.name === #"cu19_item") {
        var_c503939b = globallogic::function_e9e52d05();
        if (var_c503939b <= function_c816ea5b()) {
            if (self character_unlock::function_f0406288(#"mason_unlock")) {
                self character_unlock::function_c8beca5e(#"mason_unlock", #"hash_7334980069e5e2fa", 1);
            }
        }
    }
}

// Namespace character_unlock_mason/character_unlock_mason
// Params 3, eflags: 0x1 linked
// Checksum 0x260b0c8, Offset: 0x448
// Size: 0x15c
function function_1e224132(activator, laststate, state) {
    if (isplayer(activator) && !level.inprematchperiod) {
        characterassetname = getcharacterassetname(activator getcharacterbodytype(), currentsessionmode());
        if (activator character_unlock::function_f0406288(#"mason_unlock")) {
            level clientfield::set("array_broadcast", 1);
            activator clientfield::set_to_player("array_effects", 1);
            activator thread function_e3abcf2();
            activator character_unlock::function_c8beca5e(#"mason_unlock", #"hash_7334970069e5e147", 1);
        }
        activator stats::function_d40764f3(#"activation_count_broadcast", 1);
    }
}

// Namespace character_unlock_mason/character_unlock_mason
// Params 0, eflags: 0x1 linked
// Checksum 0xb8b512b, Offset: 0x5b0
// Size: 0xbc
function function_e3abcf2() {
    self endon(#"disconnect", #"game_ended");
    var_70f6f8c = 1;
    while (isplayer(self) && isalive(self) && var_70f6f8c) {
        var_70f6f8c = self character_unlock::function_f0406288(#"mason_unlock");
        waitframe(1);
    }
    self clientfield::set_to_player("array_effects", 0);
}

// Namespace character_unlock_mason/character_unlock_mason
// Params 1, eflags: 0x1 linked
// Checksum 0xacb09955, Offset: 0x678
// Size: 0x1e2
function function_4ac25840(dead_team) {
    if (isdefined(level.var_7733b33f) && level.var_7733b33f) {
        return;
    }
    var_c503939b = globallogic::function_e9e52d05();
    if (var_c503939b <= function_c816ea5b()) {
        foreach (team in level.teams) {
            if (teams::function_9dd75dad(team) && !teams::is_all_dead(team)) {
                players = getplayers(team);
                foreach (player in players) {
                    if (player character_unlock::function_f0406288(#"mason_unlock")) {
                        player character_unlock::function_c8beca5e(#"mason_unlock", #"hash_7334980069e5e2fa", 1);
                    }
                }
            }
        }
        level.var_7733b33f = 1;
    }
}

// Namespace character_unlock_mason/character_unlock_mason
// Params 0, eflags: 0x5 linked
// Checksum 0xac8f231e, Offset: 0x868
// Size: 0x80
function private function_c816ea5b() {
    maxteamplayers = isdefined(getgametypesetting(#"maxteamplayers")) ? getgametypesetting(#"maxteamplayers") : 1;
    switch (maxteamplayers) {
    case 1:
        return 15;
    case 2:
        return 8;
    case 4:
    default:
        return 4;
    case 5:
        return 4;
    }
}

