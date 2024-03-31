// Atian COD Tools GSC decompiler test
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace character_banter;

// Namespace character_banter/character_banter
// Params 0, eflags: 0x2
// Checksum 0xf7cf5e0, Offset: 0x90
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"character_banter", &__init__, undefined, undefined);
}

// Namespace character_banter/character_banter
// Params 0, eflags: 0x0
// Checksum 0x397520a, Offset: 0xd8
// Size: 0x52
function __init__() {
    callback::on_joined_team(&on_joined_team);
    callback::on_disconnect(&on_player_disconnect);
    level.var_8dcd4dc8 = [];
}

// Namespace character_banter/character_banter
// Params 1, eflags: 0x0
// Checksum 0x40799cd3, Offset: 0x138
// Size: 0xc4
function on_joined_team(params) {
    if (!isdefined(level.var_8dcd4dc8)) {
        return;
    }
    players = level.var_8dcd4dc8[self.team];
    if (!isarray(players)) {
        if (!isdefined(players)) {
            level.var_8dcd4dc8[self.team] = array(self);
        }
        return;
    }
    arrayinsert(players, self, randomint(players.size + 1));
}

// Namespace character_banter/character_banter
// Params 0, eflags: 0x0
// Checksum 0x40f754d4, Offset: 0x208
// Size: 0x9c
function on_player_disconnect() {
    if (!isdefined(level.var_8dcd4dc8)) {
        return;
    }
    players = level.var_8dcd4dc8[self.team];
    if (getplayers(self.team).size <= 1) {
        level.var_8dcd4dc8[self.team] = [];
        return;
    }
    if (isarray(players)) {
        arrayremovevalue(players, self);
    }
}

// Namespace character_banter/character_banter
// Params 0, eflags: 0x0
// Checksum 0x76df9325, Offset: 0x2b0
// Size: 0x1aa
function start() {
    if (level.maxteamplayers < 2) {
        return;
    }
    level endon(#"stop_banter");
    globallogic::waitforplayers();
    lookup = function_bb3ec038();
    var_8dcd4dc8 = [];
    while (true) {
        foreach (team, players in level.var_8dcd4dc8) {
            if (isarray(players) && players.size > 1) {
                foreach (player in players) {
                    if (isdefined(player) && player function_4d9b2d83(players, lookup)) {
                        level.var_8dcd4dc8[team] = 1;
                        break;
                    }
                }
                waitframe(1);
            }
        }
        waitframe(1);
    }
}

// Namespace character_banter/character_banter
// Params 0, eflags: 0x0
// Checksum 0xc247d500, Offset: 0x468
// Size: 0x11c
function function_bb3ec038() {
    lookup = [];
    rowcount = tablelookuprowcount(#"hash_5ec1825aeab754a2");
    for (i = 0; i < rowcount; i++) {
        row = tablelookuprow(#"hash_5ec1825aeab754a2", i);
        player1 = row[0];
        player2 = row[1];
        if (!isdefined(lookup[player1])) {
            lookup[player1] = [];
        }
        banters = lookup[player1];
        if (!isdefined(banters[player2])) {
            banters[player2] = 0;
        }
        banters[player2]++;
    }
    return lookup;
}

// Namespace character_banter/character_banter
// Params 2, eflags: 0x0
// Checksum 0x4e92aa22, Offset: 0x590
// Size: 0x1d0
function function_4d9b2d83(players, lookup) {
    if (!self isonground()) {
        return false;
    }
    assetname = self getmpdialogname();
    if (!isdefined(assetname)) {
        return false;
    }
    banters = lookup[assetname];
    if (!isdefined(banters) || banters.size <= 0) {
        return false;
    }
    foreach (player in players) {
        if (!isdefined(player) || player == self || !player isonground() || distancesquared(self.origin, player.origin) > 1000000) {
            continue;
        }
        var_d8c635a4 = player getmpdialogname();
        if (!isdefined(var_d8c635a4)) {
            continue;
        }
        var_a9f3e2d4 = banters[player getmpdialogname()];
        if (isdefined(var_a9f3e2d4)) {
            self playsoundevent(1, undefined, player);
            return true;
        }
    }
    return false;
}

// Namespace character_banter/character_banter
// Params 0, eflags: 0x0
// Checksum 0xc15a21f2, Offset: 0x768
// Size: 0x42
function stop() {
    if (level.prematchperiod > 10) {
        wait(level.prematchperiod - 10);
    }
    level notify(#"stop_banter");
    level.var_8dcd4dc8 = undefined;
}

