// Atian COD Tools GSC decompiler test
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace platoons;

// Namespace platoons/platoons
// Params 0, eflags: 0x2
// Checksum 0xb42a983, Offset: 0x90
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"platoons", &__init__, undefined, undefined);
}

// Namespace platoons/platoons
// Params 0, eflags: 0x1 linked
// Checksum 0xb2e94a96, Offset: 0xd8
// Size: 0x15c
function __init__() {
    level.platoon = {#count:isdefined(getgametypesetting(#"platooncount")) ? getgametypesetting(#"platooncount") : 0, #assignment:isdefined(getgametypesetting(#"platoonassignment")) ? getgametypesetting(#"platoonassignment") : 0, #max_players:0};
    level.platoon.max_players = function_bb1ab64b();
    if (level.platoon.count) {
        level.platoon.max_players = level.platoon.max_players / level.platoon.count;
    }
    callback::on_start_gametype(&on_start_gametype);
}

// Namespace platoons/platoons
// Params 0, eflags: 0x1 linked
// Checksum 0xfeed0e9d, Offset: 0x240
// Size: 0x1a
function function_382a49e0() {
    return level.platoon.count > 0;
}

// Namespace platoons/platoons
// Params 0, eflags: 0x1 linked
// Checksum 0xd860f112, Offset: 0x268
// Size: 0x22
function function_bb1ab64b() {
    return getdvarint(#"com_maxclients", 0);
}

// Namespace platoons/platoons
// Params 0, eflags: 0x5 linked
// Checksum 0xc2a6e14d, Offset: 0x298
// Size: 0xcc
function private on_start_gametype() {
    level.platoons = [];
    for (var_aada11e0 = 1; var_aada11e0 <= level.platoon.count; var_aada11e0++) {
        platoon_name = "platoon_" + var_aada11e0;
        level.platoons[hash("platoon_" + var_aada11e0)] = {#name:platoon_name, #eliminated:0, #var_9dd75dad:0, #player_count:0};
    }
}

// Namespace platoons/platoons
// Params 2, eflags: 0x1 linked
// Checksum 0x165144c, Offset: 0x370
// Size: 0x2c
function function_334c4bec(team, platoon) {
    function_909b6ab(platoon, team);
}

// Namespace platoons/platoons
// Params 0, eflags: 0x1 linked
// Checksum 0xd9d09d66, Offset: 0x3a8
// Size: 0x11e
function function_596bfb16() {
    if (game.state != "playing") {
        return;
    }
    foreach (team, _ in level.teams) {
        if (game.everexisted[team]) {
            platoon = getteamplatoon(team);
            if (platoon != #"none" && platoon != #"invalid" && level.platoons[platoon].var_9dd75dad == 0) {
                level.platoons[platoon].var_9dd75dad = gettime();
            }
        }
    }
}

