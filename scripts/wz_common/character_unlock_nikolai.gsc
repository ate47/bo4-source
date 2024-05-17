// Atian COD Tools GSC decompiler test
#using scripts\wz_common\character_unlock_nikolai_fixup.gsc;
#using scripts\wz_common\character_unlock_fixup.gsc;
#using scripts\wz_common\character_unlock.gsc;
#using scripts\mp_common\teams\teams.gsc;
#using scripts\abilities\gadgets\gadget_cymbal_monkey.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace character_unlock_nikolai;

// Namespace character_unlock_nikolai/character_unlock_nikolai
// Params 0, eflags: 0x2
// Checksum 0x8416e1b, Offset: 0xd0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_nikolai", &__init__, undefined, #"character_unlock_nikolai_fixup");
}

// Namespace character_unlock_nikolai/character_unlock_nikolai
// Params 0, eflags: 0x0
// Checksum 0x8ab93690, Offset: 0x120
// Size: 0x34
function __init__() {
    character_unlock_fixup::function_90ee7a97(#"nikolai_unlock", &function_2613aeec);
}

// Namespace character_unlock_nikolai/character_unlock_nikolai
// Params 1, eflags: 0x0
// Checksum 0x3393bf68, Offset: 0x160
// Size: 0xd4
function function_2613aeec(enabled) {
    if (enabled) {
        callback::add_callback(#"hash_3c09ead7e9d8a968", &function_19a80b40);
        callback::add_callback(#"hash_6aa0232dd3c8376a", &function_8bf71bd6);
        callback::add_callback(#"hash_48bcdfea6f43fecb", &function_1c4b5097);
        callback::add_callback(#"on_team_eliminated", &function_4ac25840);
    }
}

// Namespace character_unlock_nikolai/character_unlock_nikolai
// Params 1, eflags: 0x0
// Checksum 0xb4ca0ec7, Offset: 0x240
// Size: 0x18c
function function_19a80b40(var_a0ffe134) {
    if (!isplayer(self) || !isdefined(var_a0ffe134)) {
        return;
    }
    if (!level character_unlock::function_b3681acb()) {
        return;
    }
    if (level.inprematchperiod) {
        return;
    }
    gate = getdynent(#"hash_3400914dff71459c");
    if (!isdefined(gate)) {
        return;
    }
    if (distancesquared(var_a0ffe134.origin, gate.origin) > 500 * 500) {
        return;
    }
    if (function_ffdbe8c2(gate) == 1) {
        return;
    }
    check_origin = gate.origin + rotatepoint((100, 25, 0), gate.angles);
    /#
    #/
    if (distancesquared(var_a0ffe134.origin, check_origin) > 150 * 150) {
        return;
    }
    var_a0ffe134 thread gadget_cymbal_monkey::function_b9934c1d();
}

// Namespace character_unlock_nikolai/character_unlock_nikolai
// Params 0, eflags: 0x0
// Checksum 0x749c1723, Offset: 0x3d8
// Size: 0x1e4
function function_8bf71bd6() {
    if (!isdefined(self) || !isdefined(self.var_38af96b9)) {
        return;
    }
    player = self.var_38af96b9.originalowner;
    if (!isplayer(player)) {
        return;
    }
    gate = getdynent(#"hash_3400914dff71459c");
    if (!isdefined(gate)) {
        return;
    }
    if (distancesquared(self.origin, gate.origin) > 500 * 500) {
        return;
    }
    if (function_ffdbe8c2(gate) == 1) {
        return;
    }
    check_origin = gate.origin + rotatepoint((100, 25, 0), gate.angles);
    /#
    #/
    if (distancesquared(self.origin, check_origin) > 150 * 150) {
        return;
    }
    traversal_start_node = getnode("gy_traversal_start", "targetname");
    if (isdefined(traversal_start_node)) {
        linktraversal(traversal_start_node);
    }
    player function_587e512e();
    function_e2a06860(gate, 1);
}

// Namespace character_unlock_nikolai/character_unlock_nikolai
// Params 1, eflags: 0x0
// Checksum 0x10f20f09, Offset: 0x5c8
// Size: 0xdc
function function_1c4b5097(item) {
    itementry = item.itementry;
    if (isdefined(itementry) && itementry.name === #"cu16_item") {
        var_c503939b = globallogic::function_e9e52d05();
        if (var_c503939b <= function_c816ea5b()) {
            if (self character_unlock::function_f0406288(#"nikolai_unlock")) {
                self character_unlock::function_c8beca5e(#"nikolai_unlock", #"hash_6a5c9e02cc60e87e", 1);
            }
        }
    }
}

// Namespace character_unlock_nikolai/character_unlock_nikolai
// Params 1, eflags: 0x0
// Checksum 0x10b8cb3d, Offset: 0x6b0
// Size: 0x1e2
function function_4ac25840(dead_team) {
    if (isdefined(level.var_cf7b9008) && level.var_cf7b9008) {
        return;
    }
    var_c503939b = globallogic::function_e9e52d05();
    if (var_c503939b <= function_c816ea5b()) {
        foreach (team in level.teams) {
            if (teams::function_9dd75dad(team) && !teams::is_all_dead(team)) {
                players = getplayers(team);
                foreach (player in players) {
                    if (player character_unlock::function_f0406288(#"nikolai_unlock")) {
                        player character_unlock::function_c8beca5e(#"nikolai_unlock", #"hash_6a5c9e02cc60e87e", 1);
                    }
                }
            }
        }
        level.var_cf7b9008 = 1;
    }
}

// Namespace character_unlock_nikolai/character_unlock_nikolai
// Params 0, eflags: 0x4
// Checksum 0x623e0ba, Offset: 0x8a0
// Size: 0xe0
function private function_587e512e() {
    self playsoundtoplayer(#"hash_1c4290ca92541819", self);
    self playsound(#"hash_8489803fbb0e650");
    foreach (player in getplayers(self.team)) {
        if (isdefined(player)) {
            player playsoundtoplayer(#"hash_41def4c864993224", player);
        }
    }
}

// Namespace character_unlock_nikolai/character_unlock_nikolai
// Params 0, eflags: 0x4
// Checksum 0xef8070e3, Offset: 0x988
// Size: 0x80
function private function_c816ea5b() {
    maxteamplayers = isdefined(getgametypesetting(#"maxteamplayers")) ? getgametypesetting(#"maxteamplayers") : 1;
    switch (maxteamplayers) {
    case 1:
        return 10;
    case 2:
        return 5;
    case 4:
    default:
        return 3;
    case 5:
        return 3;
    }
}

/#

    // Namespace character_unlock_nikolai/character_unlock_nikolai
    // Params 2, eflags: 0x0
    // Checksum 0x4f396fc2, Offset: 0xa70
    // Size: 0x7e
    function function_3fbc7157(origin, radius) {
        self notify("<unknown string>");
        self endon("<unknown string>");
        while (true) {
            circle(origin + (0, 0, 10), radius, (1, 0, 0), 0, 1, 1);
            waitframe(1);
        }
    }

#/
