#using scripts\core_common\clientfield_shared;
#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_perks;

#namespace zm_perk_mod_widows_wine;

// Namespace zm_perk_mod_widows_wine/zm_perk_mod_widows_wine
// Params 0, eflags: 0x2
// Checksum 0x8164ec46, Offset: 0x80
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_perk_mod_widows_wine", &__init__, undefined, undefined);
}

// Namespace zm_perk_mod_widows_wine/zm_perk_mod_widows_wine
// Params 0, eflags: 0x0
// Checksum 0x20ef3ec7, Offset: 0xc8
// Size: 0x74
function __init__() {
    zm_perks::register_perk_clientfields(#"specialty_mod_widowswine", &function_905840b3, &function_a3102f04);
    zm_perks::register_perk_init_thread(#"specialty_mod_widowswine", &function_eb36b57e);
}

// Namespace zm_perk_mod_widows_wine/zm_perk_mod_widows_wine
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0x148
// Size: 0x4
function function_eb36b57e() {
    
}

// Namespace zm_perk_mod_widows_wine/zm_perk_mod_widows_wine
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0x158
// Size: 0x4
function function_905840b3() {
    
}

// Namespace zm_perk_mod_widows_wine/zm_perk_mod_widows_wine
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0x168
// Size: 0x4
function function_a3102f04() {
    
}

