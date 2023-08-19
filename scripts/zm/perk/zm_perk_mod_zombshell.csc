// Atian COD Tools GSC decompiler test
#include scripts/zm_common/zm_perks.csc;
#include scripts/core_common/system_shared.csc;

#namespace zm_perk_mod_zombshell;

// Namespace zm_perk_mod_zombshell/zm_perk_mod_zombshell
// Params 0, eflags: 0x2
// Checksum 0xa0ad6e9b, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_perk_mod_zombshell", &__init__, undefined, undefined);
}

// Namespace zm_perk_mod_zombshell/zm_perk_mod_zombshell
// Params 0, eflags: 0x1 linked
// Checksum 0x6c6294f2, Offset: 0xc0
// Size: 0x74
function __init__() {
    zm_perks::register_perk_clientfields(#"specialty_mod_zombshell", &function_5eadb2fd, &function_fbae967f);
    zm_perks::register_perk_init_thread(#"specialty_mod_zombshell", &function_793d9032);
}

// Namespace zm_perk_mod_zombshell/zm_perk_mod_zombshell
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x140
// Size: 0x4
function function_793d9032() {
    
}

// Namespace zm_perk_mod_zombshell/zm_perk_mod_zombshell
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x150
// Size: 0x4
function function_5eadb2fd() {
    
}

// Namespace zm_perk_mod_zombshell/zm_perk_mod_zombshell
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x160
// Size: 0x4
function function_fbae967f() {
    
}

