// Atian COD Tools GSC decompiler test
#include scripts/zm_common/zm_perks.csc;
#include scripts/core_common/system_shared.csc;

#namespace zm_perk_mod_electric_cherry;

// Namespace zm_perk_mod_electric_cherry/zm_perk_mod_electric_cherry
// Params 0, eflags: 0x2
// Checksum 0x4d999e2c, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_perk_mod_electric_cherry", &__init__, undefined, undefined);
}

// Namespace zm_perk_mod_electric_cherry/zm_perk_mod_electric_cherry
// Params 0, eflags: 0x1 linked
// Checksum 0x3c6dd8ff, Offset: 0xc0
// Size: 0x74
function __init__() {
    zm_perks::register_perk_clientfields(#"specialty_mod_electriccherry", &function_a58eb885, &function_aa41af78);
    zm_perks::register_perk_init_thread(#"specialty_mod_electriccherry", &function_5aa2ffe6);
}

// Namespace zm_perk_mod_electric_cherry/zm_perk_mod_electric_cherry
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x140
// Size: 0x4
function function_5aa2ffe6() {
    
}

// Namespace zm_perk_mod_electric_cherry/zm_perk_mod_electric_cherry
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x150
// Size: 0x4
function function_a58eb885() {
    
}

// Namespace zm_perk_mod_electric_cherry/zm_perk_mod_electric_cherry
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x160
// Size: 0x4
function function_aa41af78() {
    
}

