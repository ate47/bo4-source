// Atian COD Tools GSC decompiler test
#include scripts/abilities/ability_util.gsc;
#include scripts/abilities/ability_power.gsc;
#include scripts/abilities/ability_player.gsc;
#include scripts/abilities/ability_gadgets.gsc;
#include scripts/core_common/visionset_mgr_shared.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/flag_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;
#include scripts/core_common/bots/bot.gsc;
#include scripts/core_common/array_shared.gsc;
#include scripts/core_common/struct.gsc;

#namespace abilities;

// Namespace abilities/abilities
// Params 0, eflags: 0x2
// Checksum 0x666ac8ad, Offset: 0xd0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"abilities", &__init__, undefined, undefined);
}

// Namespace abilities/abilities
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x118
// Size: 0x4
function __init__() {
    
}

