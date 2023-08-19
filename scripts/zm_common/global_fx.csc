// Atian COD Tools GSC decompiler test
#include scripts/core_common/system_shared.csc;
#include scripts/core_common/struct.csc;

#namespace global_fx;

// Namespace global_fx/global_fx
// Params 0, eflags: 0x2
// Checksum 0x38452a4e, Offset: 0x78
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"global_fx", &__init__, &main, undefined);
}

// Namespace global_fx/global_fx
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0xc8
// Size: 0x4
function __init__() {
    
}

// Namespace global_fx/global_fx
// Params 0, eflags: 0x1 linked
// Checksum 0x1e500712, Offset: 0xd8
// Size: 0x14
function main() {
    check_for_wind_override();
}

// Namespace global_fx/global_fx
// Params 0, eflags: 0x1 linked
// Checksum 0xcd3a67c4, Offset: 0xf8
// Size: 0x28
function check_for_wind_override() {
    if (isdefined(level.custom_wind_callback)) {
        level thread [[ level.custom_wind_callback ]]();
    }
}

