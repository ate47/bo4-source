#using scripts\zm_common\zm_perks.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_perk_mod_zombshell;

// Namespace zm_perk_mod_zombshell/zm_perk_mod_zombshell
// Params 0, eflags: 0x2
// Checksum 0x38c6d459, Offset: 0x88
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_perk_mod_zombshell", &__init__, undefined, undefined);
}

// Namespace zm_perk_mod_zombshell/zm_perk_mod_zombshell
// Params 0, eflags: 0x1 linked
// Checksum 0x420143c, Offset: 0xd0
// Size: 0x14
function __init__() {
    enable_zombshell_perk_for_level();
}

// Namespace zm_perk_mod_zombshell/zm_perk_mod_zombshell
// Params 0, eflags: 0x1 linked
// Checksum 0x688c855b, Offset: 0xf0
// Size: 0x94
function enable_zombshell_perk_for_level() {
    zm_perks::register_perk_mod_basic_info(#"specialty_mod_zombshell", "mod_zombshell", #"perk_zombshell", #"specialty_zombshell", 5500);
    zm_perks::register_perk_threads(#"specialty_mod_zombshell", &function_58d94d9, &function_bf7ca4a7);
}

// Namespace zm_perk_mod_zombshell/zm_perk_mod_zombshell
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x190
// Size: 0x4
function function_58d94d9() {
    
}

// Namespace zm_perk_mod_zombshell/zm_perk_mod_zombshell
// Params 4, eflags: 0x1 linked
// Checksum 0x7e32b6be, Offset: 0x1a0
// Size: 0x24
function function_bf7ca4a7(b_pause, str_perk, str_result, n_slot) {
    
}

