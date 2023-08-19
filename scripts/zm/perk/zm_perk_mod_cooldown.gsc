// Atian COD Tools GSC decompiler test
#include scripts/zm_common/zm_perks.gsc;
#include scripts/core_common/system_shared.gsc;

#namespace zm_perk_mod_cooldown;

// Namespace zm_perk_mod_cooldown/zm_perk_mod_cooldown
// Params 0, eflags: 0x2
// Checksum 0x35974477, Offset: 0x88
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_perk_mod_cooldown", &__init__, &__main__, undefined);
}

// Namespace zm_perk_mod_cooldown/zm_perk_mod_cooldown
// Params 0, eflags: 0x1 linked
// Checksum 0xbe4739e9, Offset: 0xd8
// Size: 0x14
function __init__() {
    function_7299c39e();
}

// Namespace zm_perk_mod_cooldown/zm_perk_mod_cooldown
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0xf8
// Size: 0x4
function __main__() {
    
}

// Namespace zm_perk_mod_cooldown/zm_perk_mod_cooldown
// Params 0, eflags: 0x1 linked
// Checksum 0xe37bdd93, Offset: 0x108
// Size: 0x94
function function_7299c39e() {
    zm_perks::register_perk_mod_basic_info(#"specialty_mod_cooldown", "mod_cooldown", #"perk_cooldown", #"specialty_cooldown", 3500);
    zm_perks::register_perk_threads(#"specialty_mod_cooldown", &function_8d51d9a8, &function_754453a);
}

// Namespace zm_perk_mod_cooldown/zm_perk_mod_cooldown
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x1a8
// Size: 0x4
function function_8d51d9a8() {
    
}

// Namespace zm_perk_mod_cooldown/zm_perk_mod_cooldown
// Params 4, eflags: 0x1 linked
// Checksum 0x868db04e, Offset: 0x1b8
// Size: 0x24
function function_754453a(b_pause, str_perk, str_result, n_slot) {
    
}

