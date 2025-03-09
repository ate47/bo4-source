#using scripts\core_common\callbacks_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;

#namespace music;

// Namespace music/music_shared
// Params 0, eflags: 0x2
// Checksum 0x45adbf53, Offset: 0xa8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"music", &__init__, undefined, undefined);
}

// Namespace music/music_shared
// Params 0, eflags: 0x0
// Checksum 0x5a38a709, Offset: 0xf0
// Size: 0x8c
function __init__() {
    level.musicstate = "";
    util::registerclientsys("musicCmd");
    if (sessionmodeiscampaigngame()) {
        callback::on_spawned(&on_player_spawned);
    }
    if (sessionmodeiswarzonegame()) {
        callback::on_connect(&function_cbeeecf);
    }
}

// Namespace music/music_shared
// Params 2, eflags: 0x0
// Checksum 0xb7838b21, Offset: 0x188
// Size: 0x8a
function setmusicstate(state, player) {
    if (isdefined(level.musicstate)) {
        if (isdefined(player)) {
            util::setclientsysstate("musicCmd", state, player);
            return;
        } else if (level.musicstate != state) {
            util::setclientsysstate("musicCmd", state);
        }
    }
    level.musicstate = state;
}

// Namespace music/music_shared
// Params 2, eflags: 0x0
// Checksum 0x1fdb8436, Offset: 0x220
// Size: 0xb8
function setmusicstatebyteam(state, str_teamname) {
    foreach (player in level.players) {
        if (isdefined(player.team) && player.team == str_teamname) {
            setmusicstate(state, player);
        }
    }
}

// Namespace music/music_shared
// Params 0, eflags: 0x0
// Checksum 0xd8c3facb, Offset: 0x2e0
// Size: 0x66
function on_player_spawned() {
    if (isdefined(level.musicstate)) {
        if (issubstr(level.musicstate, "_igc") || issubstr(level.musicstate, "igc_")) {
            return;
        }
        if (isdefined(self)) {
        }
    }
}

// Namespace music/music_shared
// Params 0, eflags: 0x0
// Checksum 0xc9bdcea6, Offset: 0x350
// Size: 0x24
function function_cbeeecf() {
    if (isdefined(self)) {
        setmusicstate("none", self);
    }
}

