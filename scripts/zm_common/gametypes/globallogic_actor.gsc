// Atian COD Tools GSC decompiler test
#include scripts/zm_common/gametypes/globallogic_utils.gsc;
#include scripts/zm_common/gametypes/globallogic_player.gsc;
#include scripts/zm_common/bb.gsc;
#include scripts/core_common/globallogic/globallogic_player.gsc;
#include script_35598499769dbb3d;
#include script_41fe08c37d53a635;
#include scripts/core_common/spawner_shared.gsc;
#include scripts/core_common/challenges_shared.gsc;
#include scripts/core_common/struct.gsc;

#namespace globallogic_actor;

// Namespace globallogic_actor/globallogic_actor
// Params 1, eflags: 0x1 linked
// Checksum 0x49fb347c, Offset: 0xb0
// Size: 0x3c
function callback_actorspawned(spawner) {
    self thread spawner::spawn_think(spawner);
    bb::logaispawn(self, spawner);
}

// Namespace globallogic_actor/globallogic_actor
// Params 1, eflags: 0x1 linked
// Checksum 0x4180384f, Offset: 0xf8
// Size: 0x3c
function callback_actorcloned(original) {
    destructserverutils::copydestructstate(original, self);
    gibserverutils::copygibstate(original, self);
}

