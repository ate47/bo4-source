// Atian COD Tools GSC decompiler test
#using scripts\mp_common\item_world.gsc;
#using scripts\wz_common\character_unlock_fixup.gsc;
#using scripts\wz_common\character_unlock.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace character_unlock_ruin;

// Namespace character_unlock_ruin/character_unlock_ruin
// Params 0, eflags: 0x2
// Checksum 0x849bf37c, Offset: 0xa0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_ruin", &__init__, undefined, #"character_unlock_ruin_fixup");
}

// Namespace character_unlock_ruin/character_unlock_ruin
// Params 0, eflags: 0x1 linked
// Checksum 0xac1ac890, Offset: 0xf0
// Size: 0x34
function __init__() {
    character_unlock_fixup::function_90ee7a97(#"ruin_unlock", &function_2613aeec);
}

// Namespace character_unlock_ruin/character_unlock_ruin
// Params 1, eflags: 0x1 linked
// Checksum 0x52df74c, Offset: 0x130
// Size: 0x4c
function function_2613aeec(enabled) {
    if (enabled) {
        callback::on_player_killed(&on_player_killed);
        level thread function_cb514c8b();
    }
}

// Namespace character_unlock_ruin/character_unlock_ruin
// Params 0, eflags: 0x1 linked
// Checksum 0xad249d5e, Offset: 0x188
// Size: 0x13a
function function_cb514c8b() {
    item_world::function_4de3ca98();
    var_885c7eef = function_91b29d2a(#"hash_527c48a52cb157d");
    if (!isdefined(var_885c7eef[0])) {
        return;
    }
    var_885c7eef = array::randomize(var_885c7eef);
    var_8a9122c8 = var_885c7eef[0];
    var_5901fe7f = 0;
    for (x = 1; x < var_885c7eef.size; x++) {
        if (isdefined(var_5901fe7f) && var_5901fe7f) {
            item_world::consume_item(var_885c7eef[x]);
        } else if (distance2d(var_885c7eef[x].origin, var_8a9122c8.origin) < 4000) {
            item_world::consume_item(var_885c7eef[x]);
        } else {
            var_5901fe7f = 1;
        }
    }
}

// Namespace character_unlock_ruin/character_unlock_ruin
// Params 0, eflags: 0x1 linked
// Checksum 0x5580879, Offset: 0x2d0
// Size: 0x154
function on_player_killed() {
    if (!isdefined(self.laststandparams)) {
        return;
    }
    attacker = self.laststandparams.attacker;
    if (!isplayer(attacker)) {
        return;
    }
    if (!attacker util::isenemyteam(self.team)) {
        return;
    }
    if (!attacker character_unlock::function_f0406288(#"ruin_unlock")) {
        return;
    }
    dist_to_target_sq = distancesquared(attacker.origin, self.origin);
    if (dist_to_target_sq > 196.85 * 196.85) {
        return;
    }
    if (!isdefined(attacker.var_faf1dae6)) {
        attacker.var_faf1dae6 = 0;
    }
    attacker.var_faf1dae6++;
    if (attacker.var_faf1dae6 == 1) {
        attacker character_unlock::function_c8beca5e(#"ruin_unlock", #"hash_4e9ba934add76371", 1);
    }
}

