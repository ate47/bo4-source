// Atian COD Tools GSC decompiler test
#using scripts\killstreaks\killstreaks_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\lui_shared.csc;
#using script_84f5590d2ac48f8;
#using scripts\core_common\player\player_role.csc;

#namespace ct_tutorial_skirmish;

// Namespace ct_tutorial_skirmish/ct_tutorial_skirmish
// Params 0, eflags: 0x1 linked
// Checksum 0x3842b028, Offset: 0xb0
// Size: 0x3c
function init() {
    full_screen_movie::register("full_screen_movie");
    callback::on_localplayer_spawned(&on_localplayer_spawned);
}

// Namespace ct_tutorial_skirmish/ct_tutorial_skirmish
// Params 0, eflags: 0x1 linked
// Checksum 0xcb5f3ece, Offset: 0xf8
// Size: 0x24
function on_localplayer_spawned() {
    e_player = self;
    e_player function_12a6f77e();
}

