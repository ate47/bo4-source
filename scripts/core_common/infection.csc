// Atian COD Tools GSC decompiler test
#using scripts\core_common\system_shared.csc;

#namespace infection;

// Namespace infection/infection
// Params 0, eflags: 0x2
// Checksum 0x8583f4a6, Offset: 0x80
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"infection", &__init__, undefined, undefined);
}

// Namespace infection/infection
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0xc8
// Size: 0x4
function __init__() {
    
}

// Namespace infection/infection
// Params 0, eflags: 0x0
// Checksum 0x168d969c, Offset: 0xd8
// Size: 0x48
function function_74650d7() {
    if (isdefined(getgametypesetting("infectionMode")) && getgametypesetting("infectionMode")) {
        return 1;
    }
    return 0;
}

