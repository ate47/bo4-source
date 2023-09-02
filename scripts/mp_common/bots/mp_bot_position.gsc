// Atian COD Tools GSC decompiler test
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\bots\bot.gsc;
#using scripts\core_common\bots\bot_position.gsc;

#namespace mp_bot_position;

// Namespace mp_bot_position/mp_bot_position
// Params 0, eflags: 0x2
// Checksum 0xc8c6bc1, Offset: 0x80
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_65b58f40e5cccbce", &__init__, undefined, undefined);
}

// Namespace mp_bot_position/mp_bot_position
// Params 0, eflags: 0x1 linked
// Checksum 0x44f01833, Offset: 0xc8
// Size: 0x94
function __init__() {
    bot_position::function_e9e03d6f(#"hash_8d7d6c68a4e0ec3", &function_eef95251);
    bot_position::function_e9e03d6f(#"hash_15b1d6f5448dc185", &function_eecaf17c);
    bot_position::function_e9e03d6f(#"hash_27560b4cbc3c3443", &function_ff38b7b);
}

// Namespace mp_bot_position/mp_bot_position
// Params 2, eflags: 0x1 linked
// Checksum 0x4a5ddb5d, Offset: 0x168
// Size: 0x3a
function function_eef95251(params, tacbundle) {
    if (!isdefined(self.enemy)) {
        return 0;
    }
    return bot_position::function_d0cf287b(params, tacbundle);
}

// Namespace mp_bot_position/mp_bot_position
// Params 2, eflags: 0x1 linked
// Checksum 0x6abdfee6, Offset: 0x1b0
// Size: 0x3a
function function_eecaf17c(params, tacbundle) {
    if (isdefined(self.enemy)) {
        return 0;
    }
    return bot_position::function_d0cf287b(params, tacbundle);
}

// Namespace mp_bot_position/mp_bot_position
// Params 2, eflags: 0x1 linked
// Checksum 0x74478a7a, Offset: 0x1f8
// Size: 0x4aa
function function_ff38b7b(params, tacbundle) {
    if (!isarray(level.dogtags) || level.dogtags.size == 0) {
        return 0;
    }
    if (self bot::has_visible_enemy()) {
        return 0;
    }
    if (!isdefined(level.var_6679b27c)) {
        difficulty = getdvarint(#"bot_difficulty", 1);
        if (difficulty == 0) {
            level.var_6679b27c = 202500;
        } else if (difficulty == 1) {
            level.var_6679b27c = 360000;
        } else if (difficulty == 2) {
            level.var_6679b27c = 640000;
        } else if (difficulty == 3) {
            level.var_6679b27c = 1000000;
        }
    }
    var_ff07f341 = [];
    foreach (player in level.players) {
        if (isdefined(player) && isalive(player) && player != self && player.team == self.team) {
            if (!isdefined(var_ff07f341)) {
                var_ff07f341 = [];
            } else if (!isarray(var_ff07f341)) {
                var_ff07f341 = array(var_ff07f341);
            }
            var_ff07f341[var_ff07f341.size] = player;
        }
    }
    nearestdistsq = -1;
    var_117c149c = undefined;
    foreach (dogtag in level.dogtags) {
        if (!isdefined(dogtag.visuals[0]) || dogtag.visuals[0] ishidden()) {
            continue;
        }
        if (!ispointonnavmesh(dogtag.origin, self)) {
            continue;
        }
        var_6acc1296 = distancesquared(self.origin, dogtag.origin);
        if (var_6acc1296 > 65536) {
            var_3e398697 = 0;
            foreach (ally in var_ff07f341) {
                var_2c4028d8 = distancesquared(ally.origin, dogtag.origin);
                if (var_2c4028d8 <= 65536) {
                    var_3e398697 = 1;
                    break;
                }
            }
            jumpiffalse(var_3e398697) LOC_0000041a;
        } else if (nearestdistsq < 0 || var_6acc1296 < nearestdistsq) {
            nearestdistsq = var_6acc1296;
            var_117c149c = dogtag.origin;
        }
    }
    if (isdefined(var_117c149c) && nearestdistsq < level.var_6679b27c) {
        self bot_position::set_position(var_117c149c);
        self.bot.var_2ee077ff = gettime() + 500;
        return 1;
    }
    return 0;
}

