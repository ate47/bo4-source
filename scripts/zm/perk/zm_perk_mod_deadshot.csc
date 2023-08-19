// Atian COD Tools GSC decompiler test
#include scripts/zm_common/zm_perks.csc;
#include scripts/core_common/visionset_mgr_shared.csc;
#include scripts/core_common/util_shared.csc;
#include scripts/core_common/system_shared.csc;
#include scripts/core_common/clientfield_shared.csc;
#include scripts/core_common/struct.csc;

#namespace zm_perk_mod_deadshot;

// Namespace zm_perk_mod_deadshot/zm_perk_mod_deadshot
// Params 0, eflags: 0x2
// Checksum 0x33213f98, Offset: 0x98
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_perk_mod_deadshot", &__init__, undefined, undefined);
}

// Namespace zm_perk_mod_deadshot/zm_perk_mod_deadshot
// Params 0, eflags: 0x1 linked
// Checksum 0xcd04866a, Offset: 0xe0
// Size: 0x14
function __init__() {
    enable_mod_deadshot_perk_for_level();
}

// Namespace zm_perk_mod_deadshot/zm_perk_mod_deadshot
// Params 0, eflags: 0x1 linked
// Checksum 0x4ebed977, Offset: 0x100
// Size: 0x74
function enable_mod_deadshot_perk_for_level() {
    zm_perks::register_perk_clientfields(#"specialty_mod_deadshot", &function_7252aedc, &function_8357e1f3);
    zm_perks::register_perk_init_thread(#"specialty_mod_deadshot", &function_85402de1);
}

// Namespace zm_perk_mod_deadshot/zm_perk_mod_deadshot
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x180
// Size: 0x4
function function_85402de1() {
    
}

// Namespace zm_perk_mod_deadshot/zm_perk_mod_deadshot
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x190
// Size: 0x4
function function_7252aedc() {
    
}

// Namespace zm_perk_mod_deadshot/zm_perk_mod_deadshot
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x1a0
// Size: 0x4
function function_8357e1f3() {
    
}

