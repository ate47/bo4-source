// Atian COD Tools GSC decompiler test
#include scripts/core_common/player/player_stats.gsc;
#include scripts/mp_common/item_world.gsc;
#include scripts/core_common/system_shared.gsc;

#namespace wz_array_broadcast;

// Namespace wz_array_broadcast/wz_array_broadcast
// Params 0, eflags: 0x2
// Checksum 0xd2b43ddb, Offset: 0xb0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"wz_array_broadcast", &__init__, undefined, undefined);
}

// Namespace wz_array_broadcast/wz_array_broadcast
// Params 0, eflags: 0x2
// Checksum 0x3a44239d, Offset: 0xf8
// Size: 0xae
function autoexec __init() {
    level.var_47f205b = (isdefined(getgametypesetting(#"hash_3778ec3bd924f17c")) ? getgametypesetting(#"hash_3778ec3bd924f17c") : 0) && (isdefined(getgametypesetting(#"hash_24e281e778894ac9")) ? getgametypesetting(#"hash_24e281e778894ac9") : 0);
}

// Namespace wz_array_broadcast/wz_array_broadcast
// Params 0, eflags: 0x1 linked
// Checksum 0x4406256f, Offset: 0x1b0
// Size: 0x1c
function __init__() {
    level thread function_2bbffff9();
}

// Namespace wz_array_broadcast/wz_array_broadcast
// Params 0, eflags: 0x1 linked
// Checksum 0x45e79379, Offset: 0x1d8
// Size: 0x1fa
function function_2bbffff9() {
    hidemiscmodels("array_tv_on");
    level.var_e46e7048 = 0;
    if (!level.var_47f205b) {
        var_8294540 = getdynentarray("array_broadcast");
        item_world::function_1b11e73c();
        foreach (var_2eb2cfa9 in var_8294540) {
            function_e2a06860(var_2eb2cfa9, 3);
        }
        item_world::function_4de3ca98();
        foreach (var_2eb2cfa9 in var_8294540) {
            function_e2a06860(var_2eb2cfa9, 3);
        }
    } else {
        var_8294540 = getdynentarray("array_broadcast");
        foreach (var_2eb2cfa9 in var_8294540) {
            var_2eb2cfa9.onuse = &function_1e224132;
        }
    }
}

// Namespace wz_array_broadcast/wz_array_broadcast
// Params 3, eflags: 0x1 linked
// Checksum 0x7adae510, Offset: 0x3e0
// Size: 0x6c
function function_1e224132(activator, laststate, state) {
    if (level.var_e46e7048 === 0 && isplayer(activator)) {
        activator stats::function_d40764f3(#"activation_count_broadcast", 1);
    }
}

// Namespace wz_array_broadcast/event_9673dc9a
// Params 1, eflags: 0x40
// Checksum 0xb8ab1ab3, Offset: 0x458
// Size: 0xb4
function event<event_9673dc9a> function_3981d015(eventstruct) {
    if (isdefined(level.var_47f205b) && !level.var_47f205b) {
        return;
    }
    if (eventstruct.ent.targetname === "array_broadcast") {
        if (eventstruct.state === 1 && !level.var_e46e7048) {
            level.var_e46e7048 = 1;
            showmiscmodels("array_tv_on");
            hidemiscmodels("array_tv_off");
        }
    }
}

