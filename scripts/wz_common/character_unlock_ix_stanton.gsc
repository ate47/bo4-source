#using scripts\mp_common\teams\teams;
#using scripts\wz_common\character_unlock_fixup;
#using scripts\mp_common\gametypes\globallogic;
#using scripts\wz_common\character_unlock;
#using scripts\core_common\system_shared;
#using scripts\core_common\callbacks_shared;

#namespace character_unlock_ix_stanton;

// Namespace character_unlock_ix_stanton/character_unlock_ix_stanton
// Params 0, eflags: 0x2
// Checksum 0xc6bd971f, Offset: 0x98
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_ix_stanton", &__init__, undefined, #"character_unlock_ix_stanton_fixup");
}

// Namespace character_unlock_ix_stanton/character_unlock_ix_stanton
// Params 0, eflags: 0x0
// Checksum 0xbd4b4364, Offset: 0xe8
// Size: 0x34
function __init__() {
    character_unlock_fixup::function_90ee7a97(#"ix_stanton_unlock", &function_2613aeec);
}

// Namespace character_unlock_ix_stanton/character_unlock_ix_stanton
// Params 1, eflags: 0x0
// Checksum 0xccf13011, Offset: 0x128
// Size: 0xa4
function function_2613aeec(enabled) {
    if (enabled) {
        callback::add_callback(#"hash_48bcdfea6f43fecb", &function_1c4b5097);
        callback::add_callback(#"on_drop_inventory", &on_use_perk);
        callback::add_callback(#"on_team_eliminated", &function_4ac25840);
    }
}

// Namespace character_unlock_ix_stanton/character_unlock_ix_stanton
// Params 1, eflags: 0x0
// Checksum 0xed3aca5e, Offset: 0x1d8
// Size: 0xd4
function function_1c4b5097(item) {
    if (isdefined(item.itementry) && item.itementry.name === #"cu31_item") {
        var_c503939b = globallogic::function_e9e52d05();
        if (var_c503939b <= function_c816ea5b()) {
            if (self character_unlock::function_f0406288(#"ix_stanton_unlock")) {
                self character_unlock::function_c8beca5e(#"ix_stanton_unlock", #"hash_9eef458b72b750d", 1);
            }
        }
    }
}

// Namespace character_unlock_ix_stanton/character_unlock_ix_stanton
// Params 1, eflags: 0x0
// Checksum 0x3a9e516, Offset: 0x2b8
// Size: 0xc4
function on_use_perk(player) {
    if (!isplayer(player)) {
        return;
    }
    if (!player character_unlock::function_f0406288(#"ix_stanton_unlock")) {
        return;
    }
    if (!isdefined(player.var_e598921d)) {
        player.var_e598921d = 0;
    }
    player.var_e598921d++;
    if (player.var_e598921d == 5) {
        player character_unlock::function_c8beca5e(#"ix_stanton_unlock", #"hash_9eef158b72b6ff4", 1);
    }
}

// Namespace character_unlock_ix_stanton/character_unlock_ix_stanton
// Params 1, eflags: 0x0
// Checksum 0x6ea45e33, Offset: 0x388
// Size: 0x1e2
function function_4ac25840(dead_team) {
    if (isdefined(level.var_6a1f6a43) && level.var_6a1f6a43) {
        return;
    }
    var_c503939b = globallogic::function_e9e52d05();
    if (var_c503939b <= function_c816ea5b()) {
        foreach (team in level.teams) {
            if (teams::function_9dd75dad(team) && !teams::is_all_dead(team)) {
                players = getplayers(team);
                foreach (player in players) {
                    if (player character_unlock::function_f0406288(#"ix_stanton_unlock")) {
                        player character_unlock::function_c8beca5e(#"ix_stanton_unlock", #"hash_9eef458b72b750d", 1);
                    }
                }
            }
        }
        level.var_6a1f6a43 = 1;
    }
}

// Namespace character_unlock_ix_stanton/character_unlock_ix_stanton
// Params 0, eflags: 0x4
// Checksum 0x7d9db1db, Offset: 0x578
// Size: 0x80
function private function_c816ea5b() {
    maxteamplayers = isdefined(getgametypesetting(#"maxteamplayers")) ? getgametypesetting(#"maxteamplayers") : 1;
    switch (maxteamplayers) {
    case 1:
        return 30;
    case 2:
        return 15;
    case 4:
    default:
        return 8;
    case 5:
        return 8;
    }
}

