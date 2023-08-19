// Atian COD Tools GSC decompiler test
#include scripts/mp_common/item_world.gsc;
#include scripts/core_common/system_shared.gsc;

#namespace wz_stash_blackjack;

// Namespace wz_stash_blackjack/wz_blackjack_stash
// Params 0, eflags: 0x2
// Checksum 0xdbd9f54e, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"wz_stash_blackjack", &__init__, undefined, undefined);
}

// Namespace wz_stash_blackjack/wz_blackjack_stash
// Params 0, eflags: 0x1 linked
// Checksum 0x7ce66c71, Offset: 0xc0
// Size: 0xcc
function __init__() {
    level.blackjackstash = isdefined(getgametypesetting(#"wzlootlockers")) ? getgametypesetting(#"wzlootlockers") : 0;
    customgame = gamemodeismode(1) || gamemodeismode(7);
    if (customgame || !level.blackjackstash) {
        level thread function_e973becc();
    }
}

// Namespace wz_stash_blackjack/wz_blackjack_stash
// Params 0, eflags: 0x5 linked
// Checksum 0x673097ba, Offset: 0x198
// Size: 0xb0
function private function_e973becc() {
    item_world::function_4de3ca98();
    var_14957968 = getdynentarray(#"wz_stash_blackjack");
    foreach (var_2e01d28f in var_14957968) {
        item_world::function_160294c7(var_2e01d28f);
    }
}

