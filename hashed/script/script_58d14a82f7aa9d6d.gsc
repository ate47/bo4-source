// Atian COD Tools GSC decompiler test
#using scripts\core_common\player\player_stats.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace namespace_21c59b5;

// Namespace namespace_21c59b5/namespace_21c59b5
// Params 0, eflags: 0x2
// Checksum 0xceeb07d1, Offset: 0xc8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_18ce058ad321248f", &__init__, undefined, undefined);
}

// Namespace namespace_21c59b5/namespace_21c59b5
// Params 0, eflags: 0x2
// Checksum 0xe6b5fdd6, Offset: 0x110
// Size: 0x1fe
function autoexec __init() {
    level.var_bf744846 = (isdefined(getgametypesetting(#"hash_3778ec3bd924f17c")) ? getgametypesetting(#"hash_3778ec3bd924f17c") : 0) && (isdefined(getgametypesetting(#"hash_7226479da761e69d")) ? getgametypesetting(#"hash_7226479da761e69d") : 0);
    level.var_69167fa4 = (isdefined(getgametypesetting(#"hash_3778ec3bd924f17c")) ? getgametypesetting(#"hash_3778ec3bd924f17c") : 0) && (isdefined(getgametypesetting(#"hash_68f4f3fd681ae3ea")) ? getgametypesetting(#"hash_68f4f3fd681ae3ea") : 0);
    level.var_30c7dc14 = (isdefined(getgametypesetting(#"hash_3778ec3bd924f17c")) ? getgametypesetting(#"hash_3778ec3bd924f17c") : 0) && (isdefined(getgametypesetting(#"hash_6c72667787a1fcc9")) ? getgametypesetting(#"hash_6c72667787a1fcc9") : 0);
}

// Namespace namespace_21c59b5/namespace_21c59b5
// Params 0, eflags: 0x1 linked
// Checksum 0xef7eeb7, Offset: 0x318
// Size: 0x3c
function __init__() {
    callback::on_localplayer_spawned(&on_local_player_spawned);
    level thread function_c13d6f7d();
}

// Namespace namespace_21c59b5/namespace_21c59b5
// Params 1, eflags: 0x1 linked
// Checksum 0xa8f2c21c, Offset: 0x360
// Size: 0x1b0
function on_local_player_spawned(localclientnum) {
    if (!isdefined(self)) {
        return;
    }
    player = self;
    var_ad0cc7c4 = isdefined(player stats::get_stat(localclientnum, "completedCTChallenges")) && player stats::get_stat(localclientnum, "completedCTChallenges");
    if (var_ad0cc7c4 && level.var_bf744846) {
        var_699f8485 = findstaticmodelindexarray("ct_challenge_complete");
        var_21034fe0 = findstaticmodelindexarray("no_challenge_complete");
        foreach (n_index in var_21034fe0) {
            hidestaticmodel(n_index);
        }
        foreach (n_index in var_699f8485) {
            unhidestaticmodel(n_index);
        }
    }
}

// Namespace namespace_21c59b5/namespace_21c59b5
// Params 0, eflags: 0x1 linked
// Checksum 0x9498c2be, Offset: 0x518
// Size: 0x1a0
function function_c13d6f7d() {
    var_699f8485 = findstaticmodelindexarray("ct_challenge_complete");
    var_21034fe0 = findstaticmodelindexarray("no_challenge_complete");
    if (level.var_bf744846) {
        foreach (n_index in var_699f8485) {
            hidestaticmodel(n_index);
        }
    } else {
        foreach (n_index in var_699f8485) {
            hidestaticmodel(n_index);
        }
        foreach (n_index in var_21034fe0) {
            hidestaticmodel(n_index);
        }
    }
}

