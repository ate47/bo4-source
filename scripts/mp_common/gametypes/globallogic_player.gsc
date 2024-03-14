// Atian COD Tools GSC decompiler test
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;

#namespace globallogic_player;

// Namespace globallogic_player/globallogic_player
// Params 0, eflags: 0x2
// Checksum 0xe6b25151, Offset: 0x88
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"globallogic_player", &__init__, undefined, undefined);
}

// Namespace globallogic_player/globallogic_player
// Params 0, eflags: 0x0
// Checksum 0x3fca48ad, Offset: 0xd0
// Size: 0x3c
function __init__() {
    level.var_aadc08f8 = &function_4b7bb02c;
    callback::on_disconnect(&on_player_disconnect);
}

// Namespace globallogic_player/globallogic_player
// Params 1, eflags: 0x0
// Checksum 0x5f35817d, Offset: 0x118
// Size: 0x4e
function function_4b7bb02c(weapon) {
    if (!killstreaks::is_killstreak_weapon(weapon)) {
        return true;
    }
    if (killstreaks::is_killstreak_weapon_assist_allowed(weapon)) {
        return true;
    }
    return false;
}

// Namespace globallogic_player/globallogic_player
// Params 0, eflags: 0x0
// Checksum 0x64801f10, Offset: 0x170
// Size: 0x2c
function on_player_disconnect() {
    if (sessionmodeismultiplayergame()) {
        uploadstats();
    }
}

