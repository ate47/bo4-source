// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_bgb.gsc;
#using scripts\zm_common\zm_armor.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;

#namespace zm_bgb_suit_up;

// Namespace zm_bgb_suit_up/zm_bgb_suit_up
// Params 0, eflags: 0x2
// Checksum 0x35dc4efd, Offset: 0xb0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_suit_up", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_suit_up/zm_bgb_suit_up
// Params 0, eflags: 0x1 linked
// Checksum 0xc29c8773, Offset: 0x100
// Size: 0x9c
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_suit_up", "activated", 1, undefined, undefined, &validation, &activation);
    zm_armor::register(#"hash_7bfec2f0ecb46104", 1);
}

// Namespace zm_bgb_suit_up/zm_bgb_suit_up
// Params 0, eflags: 0x1 linked
// Checksum 0x8d58e716, Offset: 0x1a8
// Size: 0x5e
function validation() {
    if (self zm_armor::get(#"hash_7bfec2f0ecb46104") == 100) {
        return 0;
    }
    return !(isdefined(self bgb::get_active()) && self bgb::get_active());
}

// Namespace zm_bgb_suit_up/zm_bgb_suit_up
// Params 0, eflags: 0x1 linked
// Checksum 0xce8a8d9, Offset: 0x210
// Size: 0x130
function activation() {
    foreach (player in getplayers()) {
        if (self === player || !player laststand::player_is_in_laststand() && isalive(player) && distance2dsquared(player.origin, self.origin) < 250000) {
            player zm_armor::remove(#"hash_7bfec2f0ecb46104", 1);
            player zm_armor::add(#"hash_7bfec2f0ecb46104", 100, 100);
        }
    }
}

