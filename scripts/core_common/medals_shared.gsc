// Atian COD Tools GSC decompiler test
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace medals;

// Namespace medals/medals_shared
// Params 0, eflags: 0x2
// Checksum 0x13585394, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"medals", &__init__, undefined, undefined);
}

// Namespace medals/medals_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xfc19d224, Offset: 0xc0
// Size: 0x24
function __init__() {
    callback::on_start_gametype(&init);
}

// Namespace medals/medals_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x5a27711b, Offset: 0xf0
// Size: 0x4c
function init() {
    level.medalinfo = [];
    level.medalcallbacks = [];
    level.numkills = 0;
    callback::on_connect(&on_player_connect);
}

// Namespace medals/medals_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xacce83cd, Offset: 0x148
// Size: 0xe
function on_player_connect() {
    self.lastkilledby = undefined;
}

// Namespace medals/medals_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xc32b12a9, Offset: 0x160
// Size: 0x2e
function setlastkilledby(attacker, inflictor) {
    self.lastkilledby = attacker;
    self.var_e78602fc = inflictor;
}

// Namespace medals/medals_shared
// Params 0, eflags: 0x0
// Checksum 0xb645bcf1, Offset: 0x198
// Size: 0x10
function offenseglobalcount() {
    level.globalteammedals++;
}

// Namespace medals/medals_shared
// Params 0, eflags: 0x0
// Checksum 0x9c4c51a8, Offset: 0x1b0
// Size: 0x10
function defenseglobalcount() {
    level.globalteammedals++;
}

// Namespace medals/player_medal
// Params 1, eflags: 0x40
// Checksum 0x18025088, Offset: 0x1c8
// Size: 0x7c
function event_handler[player_medal] codecallback_medal(eventstruct) {
    if (!function_8570168d()) {
        self luinotifyevent(#"medal_received", 1, eventstruct.medal_index);
        self function_b552ffa9(#"medal_received", 1, eventstruct.medal_index);
    }
}

// Namespace medals/medals_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x134a4fdf, Offset: 0x250
// Size: 0x7c
function function_8570168d() {
    /#
        if (getdvar(#"hash_49e94b7aefac4f49", 0)) {
            return 1;
        }
    #/
    if (sessionmodeismultiplayergame()) {
        mode = function_bea73b01();
        if (mode == 4) {
            return 1;
        }
    }
    return 0;
}

