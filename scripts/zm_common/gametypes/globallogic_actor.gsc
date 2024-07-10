#using scripts\zm_common\gametypes\globallogic_utils.gsc;
#using scripts\zm_common\gametypes\globallogic_player.gsc;
#using scripts\zm_common\bb.gsc;
#using scripts\core_common\globallogic\globallogic_player.gsc;
#using scripts\core_common\ai\systems\gib.gsc;
#using scripts\core_common\ai\systems\destructible_character.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\struct.gsc;

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

