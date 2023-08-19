// Atian COD Tools GSC decompiler test
#include scripts/zm_common/zm_perks.csc;
#include scripts/core_common/system_shared.csc;

#namespace zm_perk_mod_death_perception;

// Namespace zm_perk_mod_death_perception/zm_perk_mod_death_perception
// Params 0, eflags: 0x2
// Checksum 0x90a8142a, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_perk_mod_death_perception", &__init__, undefined, undefined);
}

// Namespace zm_perk_mod_death_perception/zm_perk_mod_death_perception
// Params 0, eflags: 0x1 linked
// Checksum 0x5d994c7, Offset: 0xc0
// Size: 0x14
function __init__() {
    function_bc420db4();
}

// Namespace zm_perk_mod_death_perception/zm_perk_mod_death_perception
// Params 0, eflags: 0x1 linked
// Checksum 0xd33c21bb, Offset: 0xe0
// Size: 0x74
function function_bc420db4() {
    zm_perks::register_perk_clientfields(#"specialty_mod_awareness", &function_2d4709d2, &function_998aa3ea);
    zm_perks::register_perk_init_thread(#"specialty_mod_awareness", &function_6c6f6b97);
}

// Namespace zm_perk_mod_death_perception/zm_perk_mod_death_perception
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x160
// Size: 0x4
function function_6c6f6b97() {
    
}

// Namespace zm_perk_mod_death_perception/zm_perk_mod_death_perception
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x170
// Size: 0x4
function function_2d4709d2() {
    
}

// Namespace zm_perk_mod_death_perception/zm_perk_mod_death_perception
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x180
// Size: 0x4
function function_998aa3ea() {
    
}

