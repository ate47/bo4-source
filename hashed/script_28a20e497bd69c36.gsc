// Atian COD Tools GSC decompiler test
#include scripts/killstreaks/killstreaks_shared.csc;
#include scripts/core_common/util_shared.csc;
#include scripts/core_common/callbacks_shared.csc;
#include scripts/core_common/lui_shared.csc;
#include script_84f5590d2ac48f8;
#include scripts/core_common/player/player_role.csc;

#namespace namespace_9096c917;

// Namespace namespace_9096c917/namespace_9096c917
// Params 0, eflags: 0x1 linked
// Checksum 0x3842b028, Offset: 0xb0
// Size: 0x3c
function init() {
    full_screen_movie::register("full_screen_movie");
    callback::on_localplayer_spawned(&on_localplayer_spawned);
}

// Namespace namespace_9096c917/namespace_9096c917
// Params 0, eflags: 0x1 linked
// Checksum 0xcb5f3ece, Offset: 0xf8
// Size: 0x24
function on_localplayer_spawned() {
    e_player = self;
    e_player function_12a6f77e();
}
