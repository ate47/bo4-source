#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\player\player_stats;
#using scripts\core_common\gamestate;

#namespace contracts;

// Namespace contracts/contracts_shared
// Params 0, eflags: 0x2
// Checksum 0x722c7da6, Offset: 0x98
// Size: 0x2c
function autoexec __init__system__() {
    system::register(#"contracts_shared", undefined, undefined, undefined);
}

// Namespace contracts/contracts_shared
// Params 0, eflags: 0x0
// Checksum 0x4e26401c, Offset: 0xd0
// Size: 0x3e
function init_player_contract_events() {
    if (!isdefined(level.player_contract_events)) {
        level.player_contract_events = [];
    }
    if (!isdefined(level.contract_ids)) {
        level.contract_ids = [];
    }
}

// Namespace contracts/contracts_shared
// Params 3, eflags: 0x0
// Checksum 0x84f1626b, Offset: 0x118
// Size: 0x106
function register_player_contract_event(event_name, event_func, max_param_count = 0) {
    if (!isdefined(level.player_contract_events[event_name])) {
        level.player_contract_events[event_name] = spawnstruct();
        level.player_contract_events[event_name].param_count = max_param_count;
        level.player_contract_events[event_name].events = [];
    }
    assert(max_param_count == level.player_contract_events[event_name].param_count);
    level.player_contract_events[event_name].events[level.player_contract_events[event_name].events.size] = event_func;
}

// Namespace contracts/contracts_shared
// Params 4, eflags: 0x0
// Checksum 0xadb05671, Offset: 0x228
// Size: 0x32a
function player_contract_event(event_name, param1 = undefined, param2 = undefined, param3 = undefined) {
    if (!isdefined(level.player_contract_events[event_name])) {
        return;
    }
    param_count = isdefined(level.player_contract_events[event_name].param_count) ? level.player_contract_events[event_name].param_count : 0;
    switch (param_count) {
    case 0:
    default:
        foreach (event_func in level.player_contract_events[event_name].events) {
            if (isdefined(event_func)) {
                self [[ event_func ]]();
            }
        }
        break;
    case 1:
        foreach (event_func in level.player_contract_events[event_name].events) {
            if (isdefined(event_func)) {
                self [[ event_func ]](param1);
            }
        }
        break;
    case 2:
        foreach (event_func in level.player_contract_events[event_name].events) {
            if (isdefined(event_func)) {
                self [[ event_func ]](param1, param2);
            }
        }
        break;
    case 3:
        foreach (event_func in level.player_contract_events[event_name].events) {
            if (isdefined(event_func)) {
                self [[ event_func ]](param1, param2, param3);
            }
        }
        break;
    }
}

// Namespace contracts/contracts_shared
// Params 2, eflags: 0x0
// Checksum 0xf6d94bf0, Offset: 0x560
// Size: 0x3a
function get_contract_stat(slot, stat_name) {
    return self stats::get_stat(#"contracts", slot, stat_name);
}

// Namespace contracts/contracts_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x5d7b97ad, Offset: 0x5a8
// Size: 0x22a
function function_d17bcd3c(slot) {
    player = self;
    var_5ceb23d0 = spawnstruct();
    var_5ceb23d0.var_38280f2f = #"hash_6a1133003efe7380";
    var_5ceb23d0.var_59cb904f = 0;
    var_5ceb23d0.var_c3e2bb05 = 0;
    var_38280f2f = player stats::function_ff8f4f17(#"loot_contracts", slot, #"contracthash");
    if (!getdvarint(#"hash_d233413e805fbd0", 0)) {
        var_38280f2f = hash(var_38280f2f);
    }
    if (var_38280f2f != #"") {
        var_5ceb23d0.var_38280f2f = var_38280f2f;
        var_5ceb23d0.target_value = player stats::function_ff8f4f17(#"loot_contracts", slot, #"target");
        var_5ceb23d0.var_59cb904f = player stats::function_ff8f4f17(#"loot_contracts", slot, #"progress");
        var_5ceb23d0.var_c3e2bb05 = player stats::function_ff8f4f17(#"loot_contracts", slot, #"contractgamemode");
        var_5ceb23d0.xp = player stats::function_ff8f4f17(#"loot_contracts", slot, #"xp");
        level.contract_ids[var_38280f2f] = player stats::function_ff8f4f17(#"loot_contracts", slot, #"contractid");
    }
    return var_5ceb23d0;
}

// Namespace contracts/contracts_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x7bf3b56d, Offset: 0x7e0
// Size: 0xf6
function function_de4ff5a(slot) {
    player = self;
    var_38280f2f = player stats::function_ff8f4f17(#"loot_contracts", slot, #"contracthash");
    if (!getdvarint(#"hash_d233413e805fbd0", 0)) {
        var_38280f2f = hash(var_38280f2f);
    }
    if (var_38280f2f != #"") {
        level.contract_ids[var_38280f2f] = player stats::function_ff8f4f17(#"loot_contracts", slot, #"contractid");
    }
}

// Namespace contracts/contracts_shared
// Params 2, eflags: 0x0
// Checksum 0x6a7f10cf, Offset: 0x8e0
// Size: 0x25e
function setup_player_contracts(max_contract_slots, var_1b3f5772) {
    player = self;
    if (isdefined(player.pers[#"contracts"])) {
        for (slot = 0; slot < max_contract_slots; slot++) {
            player function_de4ff5a(slot);
        }
        return;
    }
    if (isbot(player)) {
        return;
    }
    if (!isdefined(var_1b3f5772)) {
        var_1b3f5772 = &function_d17bcd3c;
    }
    if (!isdefined(player.pers[#"contracts"])) {
        player.pers[#"contracts"] = [];
    }
    player.pers[#"hash_5651f00c6c1790a4"] = self stats::get_stat_global(#"time_played_total");
    for (slot = 0; slot < max_contract_slots; slot++) {
        var_5ceb23d0 = player [[ var_1b3f5772 ]](slot);
        if (!isdefined(var_5ceb23d0)) {
            continue;
        }
        if (!isstruct(var_5ceb23d0)) {
            continue;
        }
        var_38280f2f = var_5ceb23d0.var_38280f2f;
        if (var_38280f2f == #"hash_6a1133003efe7380") {
            continue;
        }
        if (isdefined(level.var_c3e2bb05) && isdefined(var_5ceb23d0.var_c3e2bb05) && level.var_c3e2bb05 != var_5ceb23d0.var_c3e2bb05 && var_5ceb23d0.var_c3e2bb05 != 5) {
            continue;
        }
        var_5ceb23d0.var_38280f2f = undefined;
        var_5ceb23d0.var_c3e2bb05 = undefined;
        player.pers[#"contracts"][var_38280f2f] = var_5ceb23d0;
    }
}

// Namespace contracts/contracts_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x6a8fd87d, Offset: 0xb48
// Size: 0x84
function is_contract_active(var_38280f2f) {
    if (!isdefined(var_38280f2f)) {
        return false;
    }
    if (!isplayer(self)) {
        return false;
    }
    if (!isdefined(self.pers[#"contracts"])) {
        return false;
    }
    if (!isdefined(self.pers[#"contracts"][var_38280f2f])) {
        return false;
    }
    return true;
}

// Namespace contracts/contracts_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x75d277a5, Offset: 0xbd8
// Size: 0x58
function increment_contract(var_38280f2f, delta = 1) {
    if (self is_contract_active(var_38280f2f)) {
        self [[ level.var_79a93566 ]](var_38280f2f, delta);
    }
}

/#

    // Namespace contracts/contracts_shared
    // Params 1, eflags: 0x0
    // Checksum 0xf3a94782, Offset: 0xc38
    // Size: 0x10c
    function function_5e1c4d33(var_5ceb23d0) {
        player = self;
        if (isbot(player)) {
            return;
        }
        if (!isdefined(player.pers[#"contracts"])) {
            player.pers[#"contracts"] = [];
        }
        if (!isstruct(var_5ceb23d0)) {
            return;
        }
        var_38280f2f = var_5ceb23d0.var_38280f2f;
        if (var_38280f2f == #"hash_6a1133003efe7380") {
            player.pers[#"contracts"][var_38280f2f] = undefined;
            return;
        }
        var_5ceb23d0.var_38280f2f = undefined;
        player.pers[#"contracts"][var_38280f2f] = var_5ceb23d0;
    }

    // Namespace contracts/contracts_shared
    // Params 2, eflags: 0x0
    // Checksum 0x6436268d, Offset: 0xd50
    // Size: 0xec
    function function_e07e542b(var_1d89ece6, var_300afbc8) {
        level thread watch_contract_debug(var_300afbc8);
        function_a781ee84(var_1d89ece6);
        util::function_3f749abc(var_1d89ece6 + "<dev string:x38>", "<dev string:x56>");
        util::function_3f749abc(var_1d89ece6 + "<dev string:x76>", "<dev string:x98>");
        util::function_3f749abc(var_1d89ece6 + "<dev string:xbc>", "<dev string:xc7>");
        util::function_3f749abc(var_1d89ece6 + "<dev string:xe2>", "<dev string:xee>");
    }

    // Namespace contracts/contracts_shared
    // Params 1, eflags: 0x0
    // Checksum 0x1498e015, Offset: 0xe48
    // Size: 0x12c
    function function_a781ee84(var_1d89ece6) {
        var_78a6fb52 = var_1d89ece6 + "<dev string:x109>";
        var_c8d599b5 = "<dev string:x132>";
        util::function_3f749abc(var_78a6fb52 + "<dev string:x157>", var_c8d599b5 + 2);
        util::function_3f749abc(var_78a6fb52 + "<dev string:x15d>", var_c8d599b5 + 5);
        util::function_3f749abc(var_78a6fb52 + "<dev string:x163>", var_c8d599b5 + 10);
        util::function_3f749abc(var_78a6fb52 + "<dev string:x16a>", var_c8d599b5 + 100);
        util::function_3f749abc(var_78a6fb52 + "<dev string:x172>", var_c8d599b5 + 1000);
        util::function_3f749abc(var_78a6fb52 + "<dev string:x17b>", var_c8d599b5 + 0);
    }

    // Namespace contracts/contracts_shared
    // Params 1, eflags: 0x0
    // Checksum 0x19553d4, Offset: 0xf80
    // Size: 0x84
    function watch_contract_debug(var_300afbc8) {
        level notify(#"watch_contract_debug_singleton");
        level endon(#"watch_contract_debug_singleton", #"game_ended");
        while (true) {
            profilestart();
            function_33bab9aa();
            if (isdefined(var_300afbc8)) {
                [[ var_300afbc8 ]]();
            }
            profilestop();
            wait 0.5;
        }
    }

    // Namespace contracts/contracts_shared
    // Params 0, eflags: 0x0
    // Checksum 0xc6f5c5ed, Offset: 0x1010
    // Size: 0x554
    function function_33bab9aa() {
        if (getdvarint(#"hash_7c0db43f4c0bff69", 0) > 0) {
            if (isdefined(level.players)) {
                foreach (player in level.players) {
                    if (!isdefined(player)) {
                        continue;
                    }
                    if (isbot(player)) {
                        continue;
                    }
                    if (isdefined(player.pers) && isdefined(player.pers[#"contracts"])) {
                        player.pers[#"contracts"] = undefined;
                    }
                    iprintln("<dev string:x184>" + player.name);
                }
            }
            setdvar(#"hash_7c0db43f4c0bff69", 0);
        }
        if (getdvarint(#"hash_23bd356dbd92a9e2", 0) > 0) {
            if (isdefined(level.players)) {
                foreach (player in level.players) {
                    if (!isdefined(player)) {
                        continue;
                    }
                    if (isbot(player)) {
                        continue;
                    }
                    if (isdefined(player.pers) && isdefined(player.pers[#"contracts"])) {
                        player function_78083139();
                    }
                    iprintln("<dev string:x1ac>" + player.name);
                }
            }
            setdvar(#"hash_23bd356dbd92a9e2", 0);
        }
        if (getdvarstring(#"hash_4e7103a8bd2b97f6", "<dev string:x1d2>") != "<dev string:x1d2>") {
            if (isdefined(level.players)) {
                var_f029d0d7 = getdvarstring(#"hash_4e7103a8bd2b97f6", "<dev string:x1d2>");
                foreach (player in level.players) {
                    if (!isdefined(player)) {
                        continue;
                    }
                    if (isbot(player)) {
                        continue;
                    }
                    var_61525c00 = spawnstruct();
                    var_61525c00.var_38280f2f = hash(var_f029d0d7);
                    var_61525c00.target_value = 8;
                    var_61525c00.var_59cb904f = 0;
                    player function_5e1c4d33(var_61525c00);
                    iprintln("<dev string:x1d5>" + var_f029d0d7 + "<dev string:x1ec>" + player.name + "<dev string:x1f4>");
                }
            }
            setdvar(#"hash_4e7103a8bd2b97f6", "<dev string:x1d2>");
        }
        if (getdvarint(#"scr_contract_msg_front_end_only", 0) > 0) {
            iprintln("<dev string:x208>");
            setdvar(#"scr_contract_msg_front_end_only", 0);
        }
        if (getdvarint(#"scr_contract_msg_debug_on", 0) > 0) {
            iprintln("<dev string:x23a>");
            setdvar(#"scr_contract_msg_debug_on", 0);
        }
    }

#/

// Namespace contracts/contracts_shared
// Params 0, eflags: 0x0
// Checksum 0x6f48547b, Offset: 0x1570
// Size: 0x330
function function_d589391f() {
    wait 1;
    if (!isdefined(level.var_43a0c4a2)) {
        return;
    }
    if (!isdefined(level.var_959f44cf)) {
        return;
    }
    if (!isdefined(level.var_a89923e8)) {
        return;
    }
    if (!isdefined(level.var_107734a6)) {
        return;
    }
    if (getdvarint(#"contract_monitor_time_played_disabled", 0) > 0) {
        return;
    }
    if (!isdefined(level.var_e054dd5c)) {
        level.var_e054dd5c = 0;
    }
    level endon(#"game_ended");
    for (players = getplayers(); players.size == 0 || gamestate::is_state("pregame"); players = getplayers()) {
        wait 1;
    }
    while (true) {
        wait 0.1;
        players = getplayers();
        if (players.size == 0) {
            continue;
        }
        level.var_e054dd5c++;
        if (level.var_e054dd5c >= players.size) {
            level.var_e054dd5c = 0;
        }
        player = players[level.var_e054dd5c];
        if (!isdefined(player)) {
            continue;
        }
        if (player.var_8dd4afe6 === 1) {
            continue;
        }
        if (!isdefined(player.pers)) {
            continue;
        }
        if (!isdefined(player.pers[#"contracts"])) {
            continue;
        }
        if (!isdefined(player.var_8dd4afe6)) {
            var_8dd4afe6 = 1;
            var_eec87ecc = getarraykeys(player.pers[#"contracts"]);
            foreach (var_39dce575 in var_eec87ecc) {
                if ([[ level.var_43a0c4a2 ]](var_39dce575)) {
                    if ([[ level.var_107734a6 ]](var_39dce575)) {
                        var_8dd4afe6 = 0;
                    }
                    break;
                }
            }
            player.var_8dd4afe6 = var_8dd4afe6;
            if (player.var_8dd4afe6) {
                continue;
            }
        }
        var_1ef5a3ba = player [[ level.var_959f44cf ]]();
        player [[ level.var_a89923e8 ]](var_1ef5a3ba);
    }
}

// Namespace contracts/contracts_shared
// Params 0, eflags: 0x0
// Checksum 0x3fbf8f73, Offset: 0x18a8
// Size: 0x90
function function_d3fba20e() {
    players = getplayers();
    foreach (player in players) {
        player function_78083139();
    }
}

// Namespace contracts/contracts_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x9a1fb33d, Offset: 0x1940
// Size: 0x5e6
function function_78083139() {
    player = self;
    if (!isplayer(player)) {
        return;
    }
    if (isbot(player)) {
        return;
    }
    if (!isdefined(player.pers)) {
        return;
    }
    if (!isdefined(player.pers[#"contracts"])) {
        return;
    }
    foreach (var_38280f2f, var_5ceb23d0 in player.pers[#"contracts"]) {
        if (isdefined(var_5ceb23d0.current_value)) {
            delta = var_5ceb23d0.current_value - var_5ceb23d0.var_59cb904f;
        } else {
            delta = 0;
        }
        var_4b67585c = 0;
        var_2de8a050 = 0;
        if (!isdefined(var_5ceb23d0.var_1bd1ecbb)) {
            var_5ceb23d0.var_1bd1ecbb = 0;
        }
        if (!isdefined(var_5ceb23d0.var_c7d05ecd)) {
            var_5ceb23d0.var_c7d05ecd = 0;
        }
        if (isdefined(var_5ceb23d0.var_be5bf249)) {
            var_4b67585c = var_5ceb23d0.var_be5bf249 - var_5ceb23d0.var_1bd1ecbb;
            var_2de8a050 = var_5ceb23d0.var_be5bf249 - var_5ceb23d0.var_c7d05ecd;
        } else {
            if (sessionmodeiszombiesgame()) {
                var_ad6e6421 = player.pers[#"time_played_total"];
                var_5463bb33 = var_ad6e6421;
            } else {
                var_ad6e6421 = undefined;
                if (isdefined(level.var_f202fa67) && [[ level.var_f202fa67 ]](var_38280f2f)) {
                    if (isdefined(player.var_c619a827)) {
                        var_ad6e6421 = player.var_c619a827 - player.pers[#"hash_5651f00c6c1790a4"];
                    }
                } else if (!isdefined(level.var_e3551fe4) || ![[ level.var_e3551fe4 ]](var_38280f2f)) {
                    if (isdefined(player.var_56bd2c02)) {
                        var_ad6e6421 = player.var_56bd2c02 - player.pers[#"hash_5651f00c6c1790a4"];
                    }
                }
                time_played_total = player stats::get_stat_global(#"time_played_total");
                var_9d12108c = 0;
                if (isdefined(player) && isdefined(player.team) && isdefined(player.timeplayed) && isdefined(player.timeplayed[player.team])) {
                    var_9d12108c = player.timeplayed[player.team];
                }
                var_5463bb33 = time_played_total - player.pers[#"hash_5651f00c6c1790a4"] + var_9d12108c;
                if (!isdefined(var_ad6e6421)) {
                    var_ad6e6421 = var_5463bb33;
                }
            }
            var_4b67585c = var_ad6e6421 - var_5ceb23d0.var_1bd1ecbb;
            var_2de8a050 = var_5463bb33 - var_5ceb23d0.var_c7d05ecd;
        }
        if (delta <= 0 && var_4b67585c <= 0 && var_2de8a050 <= 0) {
            continue;
        }
        if (var_4b67585c < 0) {
            var_4b67585c = 0;
        }
        if (var_2de8a050 < 0) {
            var_2de8a050 = 0;
        }
        var_9224acc = 0;
        if (isdefined(var_5ceb23d0.current_value)) {
            if (var_5ceb23d0.current_value >= var_5ceb23d0.target_value) {
                var_9224acc = 1;
            }
        }
        /#
            if (getdvarint(#"scr_contract_debug", 0) > 0) {
                var_7b6acdb1 = var_9224acc ? "<dev string:x262>" : "<dev string:x1d2>";
                iprintln("<dev string:x272>" + function_9e72a96(var_38280f2f) + "<dev string:x280>" + delta + "<dev string:x28e>" + var_4b67585c + "<dev string:x2ae>" + var_2de8a050 + var_7b6acdb1);
            }
        #/
        flags = player function_507247e8(var_9224acc);
        function_d8c98325(var_38280f2f, delta, flags, var_4b67585c, var_2de8a050);
        if (isdefined(var_5ceb23d0.current_value)) {
            var_5ceb23d0.var_59cb904f = var_5ceb23d0.current_value;
        }
        var_5ceb23d0.var_1bd1ecbb += var_4b67585c;
        var_5ceb23d0.var_c7d05ecd += var_2de8a050;
    }
}

// Namespace contracts/contracts_shared
// Params 5, eflags: 0x1 linked
// Checksum 0xf34148a8, Offset: 0x1f30
// Size: 0xbc
function function_d8c98325(var_38280f2f, delta, flags, var_4b67585c, var_2de8a050) {
    player = self;
    if (var_38280f2f != #"") {
        var_ae857992 = getdvarint(#"hash_60d812bef0f782fb", 4);
        player function_cce105c8(var_38280f2f, 1, delta, 2, var_ae857992, 3, flags, 4, var_4b67585c, 5, var_2de8a050);
    }
}

// Namespace contracts/contracts_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xe6381d67, Offset: 0x1ff8
// Size: 0x16c
function function_507247e8(var_9224acc) {
    player = self;
    flags = 0;
    xpscale = player getxpscale();
    if (xpscale > 1) {
        flags |= 1;
    }
    lootxpscale = player function_c52bcf79();
    if (sessionmodeiszombiesgame()) {
        if (max(lootxpscale, float(getdvarint(#"hash_1624faaee3c04f09", 1))) > 1) {
            flags |= 2;
        }
    } else if (lootxpscale > 1) {
        flags |= 2;
    }
    if (var_9224acc) {
        flags |= 8;
    }
    if (getdvarint(#"lootcontracts_daily_tier_skip", 0) != 0) {
        flags |= 16;
    }
    return flags;
}

