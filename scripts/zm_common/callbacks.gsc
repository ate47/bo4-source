// Atian COD Tools GSC decompiler test
#include scripts/core_common/bots/bot.gsc;
#include scripts/core_common/bots/bot_traversals.gsc;
#include scripts/zm_common/gametypes/hostmigration.gsc;
#include scripts/zm_common/gametypes/globallogic_scriptmover.gsc;
#include scripts/zm_common/gametypes/globallogic_player.gsc;
#include scripts/zm_common/gametypes/globallogic_actor.gsc;
#include scripts/zm_common/gametypes/globallogic.gsc;
#include scripts/core_common/globallogic/globallogic_vehicle.gsc;
#include scripts/weapons/deployable.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;
#include scripts/core_common/ai/systems/blackboard.gsc;
#include scripts/core_common/struct.gsc;

#namespace callback;

// Namespace callback/callbacks
// Params 0, eflags: 0x2
// Checksum 0xa3f17e44, Offset: 0xe0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"callback", &__init__, undefined, undefined);
}

// Namespace callback/callbacks
// Params 0, eflags: 0x1 linked
// Checksum 0x4998828d, Offset: 0x128
// Size: 0x1c
function __init__() {
    level thread setup_callbacks();
}

// Namespace callback/callbacks
// Params 0, eflags: 0x1 linked
// Checksum 0x4a0b0da6, Offset: 0x150
// Size: 0xf2
function setup_callbacks() {
    setdefaultcallbacks();
    level.idflags_noflag = 0;
    level.idflags_radius = 1;
    level.idflags_no_armor = 2;
    level.idflags_no_knockback = 4;
    level.idflags_penetration = 8;
    level.idflags_destructible_entity = 16;
    level.idflags_shield_explosive_impact = 32;
    level.idflags_shield_explosive_impact_huge = 64;
    level.idflags_shield_explosive_splash = 128;
    level.idflags_hurt_trigger_allow_laststand = 256;
    level.idflags_disable_ragdoll_skip = 512;
    level.idflags_no_team_protection = 8192;
    level.var_598c4d23 = 16384;
    level.var_681a9181 = 32768;
}

// Namespace callback/callbacks
// Params 0, eflags: 0x1 linked
// Checksum 0xd92281b5, Offset: 0x250
// Size: 0x19a
function setdefaultcallbacks() {
    level.callbackstartgametype = &globallogic::callback_startgametype;
    level.callbackplayerconnect = &globallogic_player::callback_playerconnect;
    level.callbackplayerdisconnect = &globallogic_player::callback_playerdisconnect;
    level.callbackplayermelee = &globallogic_player::callback_playermelee;
    level.callbackactorspawned = &globallogic_actor::callback_actorspawned;
    level.callbackactorcloned = &globallogic_actor::callback_actorcloned;
    level.var_6788bf11 = &globallogic_scriptmover::function_8c7ec52f;
    level.callbackvehiclespawned = &globallogic_vehicle::callback_vehiclespawned;
    level.callbackplayermigrated = &globallogic_player::callback_playermigrated;
    level.callbackhostmigration = &hostmigration::callback_hostmigration;
    level.callbackhostmigrationsave = &hostmigration::callback_hostmigrationsave;
    level.callbackprehostmigrationsave = &hostmigration::callback_prehostmigrationsave;
    level.callbackbotentereduseredge = &bot::callback_botentereduseredge;
    level.callbackbotcreateplayerbot = &bot::function_c6e29bdf;
    level.callbackbotshutdown = &bot::function_3d575aa3;
    level.var_69959686 = &deployable::function_209fda28;
    level._gametype_default = "zclassic";
}

// Namespace callback/callbacks
// Params 2, eflags: 0x0
// Checksum 0xd0c38d3d, Offset: 0x3f8
// Size: 0x3c
function function_6e6149a6(func, obj) {
    add_callback(#"hash_1eda827ff5e6895b", func, obj);
}

// Namespace callback/callbacks
// Params 2, eflags: 0x0
// Checksum 0x18105e8a, Offset: 0x440
// Size: 0x3c
function function_823e7181(func, obj) {
    remove_callback(#"hash_34edc1c4f45e5572", func, obj);
}

// Namespace callback/callbacks
// Params 2, eflags: 0x1 linked
// Checksum 0xc64c7c3e, Offset: 0x488
// Size: 0x3c
function function_4b58e5ab(func, obj) {
    add_callback(#"hash_210adcf09e99fba1", func, obj);
}

// Namespace callback/callbacks
// Params 2, eflags: 0x0
// Checksum 0x3135ad6f, Offset: 0x4d0
// Size: 0x3c
function function_66d5d485(func, obj) {
    remove_callback(#"hash_1863ba8e81df2a64", func, obj);
}

// Namespace callback/callbacks
// Params 2, eflags: 0x1 linked
// Checksum 0x688aa04f, Offset: 0x518
// Size: 0x3c
function function_74872db6(func, obj) {
    add_callback(#"hash_6df5348c2fb9a509", func, obj);
}

// Namespace callback/callbacks
// Params 2, eflags: 0x1 linked
// Checksum 0xa3b2ed01, Offset: 0x560
// Size: 0x3c
function function_50fdac80(func, obj) {
    remove_callback(#"hash_6df5348c2fb9a509", func, obj);
}

// Namespace callback/callbacks
// Params 2, eflags: 0x1 linked
// Checksum 0x2d53879d, Offset: 0x5a8
// Size: 0x3c
function on_round_end(func, obj) {
    add_callback(#"on_round_end", func, obj);
}

// Namespace callback/callbacks
// Params 2, eflags: 0x1 linked
// Checksum 0x1aea7de4, Offset: 0x5f0
// Size: 0x3c
function remove_on_round_end(func, obj) {
    remove_callback(#"on_round_end", func, obj);
}

// Namespace callback/callbacks
// Params 2, eflags: 0x0
// Checksum 0xf1baa418, Offset: 0x638
// Size: 0x3c
function function_b3c9adb7(func, obj) {
    add_callback(#"hash_7d40e25056b9275c", func, obj);
}

// Namespace callback/callbacks
// Params 2, eflags: 0x0
// Checksum 0x20226ee8, Offset: 0x680
// Size: 0x3c
function function_342b2f6(func, obj) {
    remove_callback(#"hash_7d40e25056b9275c", func, obj);
}

// Namespace callback/callbacks
// Params 2, eflags: 0x0
// Checksum 0x64d758d3, Offset: 0x6c8
// Size: 0x3c
function function_aebeafc0(func, obj) {
    add_callback(#"hash_790b67aca1bf8fc0", func, obj);
}

// Namespace callback/callbacks
// Params 2, eflags: 0x0
// Checksum 0xd51794d4, Offset: 0x710
// Size: 0x3c
function function_3e2ed898(func, obj) {
    remove_callback(#"hash_790b67aca1bf8fc0", func, obj);
}

