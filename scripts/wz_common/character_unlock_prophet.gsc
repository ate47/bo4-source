// Atian COD Tools GSC decompiler test
#using scripts\wz_common\character_unlock_fixup.gsc;
#using scripts\wz_common\character_unlock.gsc;
#using script_71e26f08f03b7a7a;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace character_unlock_prophet;

// Namespace character_unlock_prophet/character_unlock_prophet
// Params 0, eflags: 0x2
// Checksum 0x7bac539b, Offset: 0xb0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_prophet", &__init__, undefined, #"character_unlock_prophet_fixup");
}

// Namespace character_unlock_prophet/character_unlock_prophet
// Params 0, eflags: 0x0
// Checksum 0x5a266336, Offset: 0x100
// Size: 0x34
function __init__() {
    character_unlock_fixup::function_90ee7a97(#"prophet_unlock", &function_2613aeec);
}

// Namespace character_unlock_prophet/character_unlock_prophet
// Params 1, eflags: 0x0
// Checksum 0x4b2664b0, Offset: 0x140
// Size: 0xcc
function function_2613aeec(enabled) {
    if (enabled) {
        callback::add_callback(#"hash_48bcdfea6f43fecb", &function_1c4b5097);
        callback::add_callback(#"on_last_alive", &function_4ac25840);
        callback::add_callback(#"on_drop_item", &on_drop_item);
        character_unlock::function_d2294476(#"supply_drop_stash_cu10", 2, 3);
    }
}

// Namespace character_unlock_prophet/character_unlock_prophet
// Params 1, eflags: 0x0
// Checksum 0x22095c88, Offset: 0x218
// Size: 0x54
function function_1c4b5097(item) {
    var_a6762160 = item.var_a6762160;
    if (var_a6762160.name === #"cu10_item") {
        self thread function_798820a9(item);
    }
}

// Namespace character_unlock_prophet/character_unlock_prophet
// Params 1, eflags: 0x0
// Checksum 0x815d8e5, Offset: 0x278
// Size: 0xce
function on_drop_item(params) {
    if (!isplayer(self)) {
        return;
    }
    if (isdefined(params.item) && isdefined(params.item.var_a6762160)) {
        var_a6762160 = params.item.var_a6762160;
        if (var_a6762160.name === #"cu10_item" && !self character_unlock::function_f0406288(#"prophet_unlock")) {
            self notify(#"dropped_prophet_item");
        }
    }
}

// Namespace character_unlock_prophet/character_unlock_prophet
// Params 1, eflags: 0x0
// Checksum 0x6cf27334, Offset: 0x350
// Size: 0x17e
function function_798820a9(item) {
    self notify("3da3c6e1687182e2");
    self endon("3da3c6e1687182e2");
    self endon(#"hash_249a493b6d9b422c", #"dropped_prophet_item", #"hash_4518b55c281baa0c", #"death");
    if (!isplayer(self)) {
        return;
    }
    player = self;
    while (isdefined(player)) {
        if (isdefined(player.inventory) && isdefined(player.inventory.consumed)) {
            if ((isdefined(player.inventory.consumed.size) ? player.inventory.consumed.size : 0) >= 3) {
                player character_unlock::function_c8beca5e(#"prophet_unlock", #"hash_63b7bd67a959fc47", 1);
            } else {
                player character_unlock::function_c8beca5e(#"prophet_unlock", #"hash_63b7bd67a959fc47", 0);
            }
        }
        waitframe(1);
    }
}

// Namespace character_unlock_prophet/character_unlock_prophet
// Params 1, eflags: 0x0
// Checksum 0x1286263e, Offset: 0x4d8
// Size: 0x160
function function_4ac25840(params) {
    foreach (team in params.teams_alive) {
        players = getplayers(team);
        foreach (player in players) {
            if (player character_unlock::function_f0406288(#"prophet_unlock")) {
                player character_unlock::function_c8beca5e(#"prophet_unlock", #"hash_63b7be67a959fdfa", 1);
                player notify(#"hash_249a493b6d9b422c");
            }
        }
    }
}

