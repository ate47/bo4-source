// Atian COD Tools GSC decompiler test
#include scripts/core_common/clientfield_shared.gsc;
#include scripts/core_common/system_shared.gsc;

#namespace mission_utils;

// Namespace mission_utils/mission_shared
// Params 0, eflags: 0x2
// Checksum 0x73140705, Offset: 0xa0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"mission", &__init__, undefined, undefined);
}

// Namespace mission_utils/mission_shared
// Params 0, eflags: 0x0
// Checksum 0x88118a63, Offset: 0xe8
// Size: 0x34
function __init__() {
    clientfield::register("world", "mission_active_flags", 1, 8, "int");
}

// Namespace mission_utils/mission_shared
// Params 1, eflags: 0x0
// Checksum 0xf930ad24, Offset: 0x128
// Size: 0x84
function start(mission_index) {
    if (!isdefined(level.mission_active_flags)) {
        level.mission_active_flags = 0;
    }
    level.mission_active_flags = level.mission_active_flags | 1 << mission_index;
    clientfield::set("mission_active_flags", level.mission_active_flags);
    startmission(mission_index);
}

// Namespace mission_utils/mission_shared
// Params 1, eflags: 0x0
// Checksum 0x62d5b06b, Offset: 0x1b8
// Size: 0xec
function stop(mission_index) {
    if (!isdefined(level.mission_active_flags)) {
        level.mission_active_flags = 0;
        return;
    }
    if (!isdefined(mission_index)) {
        for (i = 0; i < 8; i++) {
            stop(i);
        }
        return;
    }
    if ((level.mission_active_flags & 1 << mission_index) != 0) {
        level.mission_active_flags = level.mission_active_flags & ~(1 << mission_index);
        clientfield::set("mission_active_flags", level.mission_active_flags);
        stopmission(mission_index);
    }
}

