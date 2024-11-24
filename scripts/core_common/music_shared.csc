#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;

#namespace music;

// Namespace music/music_shared
// Params 0, eflags: 0x2
// Checksum 0xe55f10d0, Offset: 0x88
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"music", &__init__, undefined, undefined);
}

// Namespace music/music_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xd7a7a6ee, Offset: 0xd0
// Size: 0x64
function __init__() {
    level.activemusicstate = "";
    level.nextmusicstate = "";
    level.musicstates = [];
    util::register_system(#"musiccmd", &musiccmdhandler);
}

// Namespace music/music_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x6ecd3cf2, Offset: 0x140
// Size: 0x64
function musiccmdhandler(clientnum, state, oldstate) {
    if (state != "death") {
        level._lastmusicstate = state;
    }
    state = tolower(state);
    soundsetmusicstate(state);
}

