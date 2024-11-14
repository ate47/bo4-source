#using scripts\zm_common\zm_perks;
#using scripts\core_common\system_shared;
#using scripts\core_common\callbacks_shared;

#namespace zm_perk_mod_ethereal_razor;

// Namespace zm_perk_mod_ethereal_razor/zm_perk_mod_ethereal_razor
// Params 0, eflags: 0x2
// Checksum 0x295e85d9, Offset: 0x98
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_perk_mod_ethereal_razor", &__init__, undefined, undefined);
}

// Namespace zm_perk_mod_ethereal_razor/zm_perk_mod_ethereal_razor
// Params 0, eflags: 0x1 linked
// Checksum 0x45ebea44, Offset: 0xe0
// Size: 0x14
function __init__() {
    enable_ethereal_razor_perk_for_level();
}

// Namespace zm_perk_mod_ethereal_razor/zm_perk_mod_ethereal_razor
// Params 0, eflags: 0x1 linked
// Checksum 0xe62debf6, Offset: 0x100
// Size: 0x94
function enable_ethereal_razor_perk_for_level() {
    zm_perks::register_perk_mod_basic_info(#"specialty_mod_etherealrazor", "mod_ethereal_razor", #"perk_ethereal_razor", #"specialty_etherealrazor", 5500);
    zm_perks::register_perk_threads(#"specialty_mod_etherealrazor", &function_5b26f1e3, &function_98c3f271);
}

// Namespace zm_perk_mod_ethereal_razor/zm_perk_mod_ethereal_razor
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x1a0
// Size: 0x4
function function_5b26f1e3() {
    
}

// Namespace zm_perk_mod_ethereal_razor/zm_perk_mod_ethereal_razor
// Params 4, eflags: 0x1 linked
// Checksum 0x71902700, Offset: 0x1b0
// Size: 0x24
function function_98c3f271(b_pause, str_perk, str_result, n_slot) {
    
}

