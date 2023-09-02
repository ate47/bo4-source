// Atian COD Tools GSC decompiler test
#using scripts\mp_common\teams\teams.gsc;
#using scripts\mp_common\item_world_fixup.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\wz_common\character_unlock_fixup.gsc;
#using scripts\wz_common\character_unlock.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace character_unlock_crash;

// Namespace character_unlock_crash/character_unlock_crash
// Params 0, eflags: 0x2
// Checksum 0xb209b07b, Offset: 0xa0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_crash", &__init__, undefined, #"character_unlock_crash_fixup");
}

// Namespace character_unlock_crash/character_unlock_crash
// Params 0, eflags: 0x1 linked
// Checksum 0xf9691128, Offset: 0xf0
// Size: 0x34
function __init__() {
    character_unlock_fixup::function_90ee7a97(#"crash_unlock", &function_2613aeec);
}

// Namespace character_unlock_crash/character_unlock_crash
// Params 1, eflags: 0x1 linked
// Checksum 0xe718012d, Offset: 0x130
// Size: 0x19c
function function_2613aeec(enabled) {
    if (enabled) {
        callback::add_callback(#"hash_48bcdfea6f43fecb", &function_1c4b5097);
        callback::add_callback(#"on_drop_item", &on_drop_item);
        callback::add_callback(#"on_team_eliminated", &function_4ac25840);
        callback::on_item_pickup(&on_item_pickup);
        callback::on_item_use(&on_item_use);
        if (isdefined(getgametypesetting(#"hash_17f17e92c2654659")) && getgametypesetting(#"hash_17f17e92c2654659")) {
            item_world_fixup::function_e70fa91c(#"hash_34dde6670d802e92", #"hash_336749f373d0fbf7", 3);
        } else {
            item_world_fixup::function_e70fa91c(#"hash_34dde6670d802e92", #"hash_336749f373d0fbf7", 10);
        }
    }
}

// Namespace character_unlock_crash/character_unlock_crash
// Params 1, eflags: 0x1 linked
// Checksum 0x841bd559, Offset: 0x2d8
// Size: 0x15c
function function_1c4b5097(item) {
    var_a6762160 = item.var_a6762160;
    if (var_a6762160.name === #"cu03_item") {
        if (self character_unlock::function_f0406288(#"crash_unlock")) {
            var_4862d883 = self function_687146d();
            if (var_4862d883 >= 15) {
                self character_unlock::function_c8beca5e(#"crash_unlock", #"hash_7ccc9c0240fd010e", 1);
            }
            var_c503939b = globallogic::function_e9e52d05();
            if (var_c503939b <= function_c816ea5b()) {
                if (self character_unlock::function_f0406288(#"crash_unlock")) {
                    self character_unlock::function_c8beca5e(#"crash_unlock", #"hash_7ccc9b0240fcff5b", 1);
                }
            }
        }
    }
}

// Namespace character_unlock_crash/character_unlock_crash
// Params 1, eflags: 0x1 linked
// Checksum 0xadf214b7, Offset: 0x440
// Size: 0x124
function on_drop_item(params) {
    if (!isplayer(self)) {
        return;
    }
    var_a6762160 = params.item.var_a6762160;
    deathstash = params.item.deathstash;
    if (isdefined(deathstash) && deathstash) {
        return;
    }
    if (isdefined(var_a6762160) && var_a6762160.itemtype === #"health") {
        if (self character_unlock::function_f0406288(#"crash_unlock")) {
            var_4862d883 = self function_687146d();
            if (var_4862d883 < 15) {
                self character_unlock::function_c8beca5e(#"crash_unlock", #"hash_7ccc9c0240fd010e", 0);
            }
        }
    }
}

// Namespace character_unlock_crash/character_unlock_crash
// Params 1, eflags: 0x1 linked
// Checksum 0x41f669a3, Offset: 0x570
// Size: 0xdc
function on_item_pickup(params) {
    var_a6762160 = params.item.var_a6762160;
    if (isdefined(var_a6762160) && var_a6762160.itemtype === #"health") {
        if (self character_unlock::function_f0406288(#"crash_unlock")) {
            var_4862d883 = self function_687146d();
            if (var_4862d883 >= 15) {
                self character_unlock::function_c8beca5e(#"crash_unlock", #"hash_7ccc9c0240fd010e", 1);
            }
        }
    }
}

// Namespace character_unlock_crash/character_unlock_crash
// Params 1, eflags: 0x1 linked
// Checksum 0xd0260cca, Offset: 0x658
// Size: 0xd4
function on_item_use(params) {
    var_a6762160 = params.item.var_a6762160;
    if (isdefined(var_a6762160) && var_a6762160.itemtype === #"health") {
        if (self character_unlock::function_f0406288(#"crash_unlock")) {
            var_4862d883 = self function_687146d();
            if (var_4862d883 < 15) {
                self character_unlock::function_c8beca5e(#"crash_unlock", #"hash_7ccc9c0240fd010e", 0);
            }
        }
    }
}

// Namespace character_unlock_crash/character_unlock_crash
// Params 0, eflags: 0x5 linked
// Checksum 0x508ebb24, Offset: 0x738
// Size: 0xf0
function private function_687146d() {
    var_4862d883 = 0;
    if (isdefined(self.inventory) && isdefined(self.inventory.items)) {
        foreach (item in self.inventory.items) {
            if (isdefined(item.var_a6762160) && item.var_a6762160.itemtype === #"health") {
                var_4862d883 = var_4862d883 + item.count;
            }
        }
    }
    return var_4862d883;
}

// Namespace character_unlock_crash/character_unlock_crash
// Params 1, eflags: 0x1 linked
// Checksum 0x5d3ac5da, Offset: 0x830
// Size: 0x1e2
function function_4ac25840(dead_team) {
    if (isdefined(level.var_6d75024c) && level.var_6d75024c) {
        return;
    }
    var_c503939b = globallogic::function_e9e52d05();
    if (var_c503939b <= function_c816ea5b()) {
        foreach (team in level.teams) {
            if (teams::function_9dd75dad(team) && !teams::is_all_dead(team)) {
                players = getplayers(team);
                foreach (player in players) {
                    if (player character_unlock::function_f0406288(#"crash_unlock")) {
                        player character_unlock::function_c8beca5e(#"crash_unlock", #"hash_7ccc9b0240fcff5b", 1);
                    }
                }
            }
        }
        level.var_6d75024c = 1;
    }
}

// Namespace character_unlock_crash/character_unlock_crash
// Params 0, eflags: 0x5 linked
// Checksum 0x2be49eb0, Offset: 0xa20
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
        return 3;
    case 5:
        return 3;
    }
}

