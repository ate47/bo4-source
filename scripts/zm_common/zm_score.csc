#using scripts\core_common\clientfield_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_utility;

#namespace zm_score;

// Namespace zm_score/zm_score
// Params 0, eflags: 0x2
// Checksum 0xbf4b91a, Offset: 0x130
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_score", &__init__, undefined, undefined);
}

// Namespace zm_score/zm_score
// Params 0, eflags: 0x1 linked
// Checksum 0x239cdc73, Offset: 0x178
// Size: 0x16c
function __init__() {
    level.var_697c8943 = array(90, 80, 70, 60, 50, 40, 30, 20, 10);
    foreach (subdivision in level.var_697c8943) {
        score_cf_register_info("damage" + subdivision, 1, 7);
    }
    score_cf_register_info("death_head", 1, 3, undefined);
    score_cf_register_info("death_melee", 1, 3, undefined);
    score_cf_register_info("transform_kill", 1, 3, undefined);
    clientfield::register("clientuimodel", "hudItems.doublePointsActive", 1, 1, "int", undefined, 0, 0);
}

// Namespace zm_score/zm_score
// Params 4, eflags: 0x1 linked
// Checksum 0x4710d02b, Offset: 0x2f0
// Size: 0xa6
function score_cf_register_info(name, version, max_count, func_callback) {
    for (i = 0; i < 4; i++) {
        clientfield::register("worlduimodel", "PlayerList.client" + i + ".score_cf_" + name, version, getminbitcountfornum(max_count), "counter", func_callback, 0, 0);
    }
}

