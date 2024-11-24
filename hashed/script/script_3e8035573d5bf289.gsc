#using scripts\core_common\aat_shared;
#using scripts\core_common\ai\zombie_death;
#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\util;
#using scripts\zm_common\zm_bgb;
#using scripts\zm_common\zm_laststand;
#using scripts\zm_common\zm_powerups;
#using scripts\zm_common\zm_score;
#using scripts\zm_common\zm_utility;

#namespace namespace_e7b06f1b;

// Namespace namespace_e7b06f1b/namespace_e7b06f1b
// Params 0, eflags: 0x2
// Checksum 0xff163c2b, Offset: 0xd0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_6119ea2d427fdf8a", &__init__, undefined, undefined);
}

// Namespace namespace_e7b06f1b/namespace_e7b06f1b
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x118
// Size: 0x4
function __init__() {
    
}

// Namespace namespace_e7b06f1b/namespace_e7b06f1b
// Params 1, eflags: 0x0
// Checksum 0xcbe422b1, Offset: 0x128
// Size: 0x44
function function_f1d9de41(player) {
    player zm_utility::function_7a35b1d7(self.hint);
    level thread function_386c20ef(player);
}

// Namespace namespace_e7b06f1b/namespace_e7b06f1b
// Params 1, eflags: 0x1 linked
// Checksum 0xa9e5f9c9, Offset: 0x178
// Size: 0x74
function function_386c20ef(player) {
    if (isdefined(player.lives) && player.lives < 5) {
        player.lives++;
        return;
    }
    if (player zm_laststand::function_618fd37e() < 5) {
        player zm_laststand::function_3a00302e();
    }
}

