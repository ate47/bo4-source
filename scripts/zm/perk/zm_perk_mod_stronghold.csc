#using scripts\zm_common\zm_perks;
#using scripts\core_common\system_shared;

#namespace zm_perk_mod_stronghold;

// Namespace zm_perk_mod_stronghold/zm_perk_mod_stronghold
// Params 0, eflags: 0x2
// Checksum 0xf5840c4c, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_perk_mod_stronghold", &__init__, undefined, undefined);
}

// Namespace zm_perk_mod_stronghold/zm_perk_mod_stronghold
// Params 0, eflags: 0x1 linked
// Checksum 0x71da80b7, Offset: 0xc0
// Size: 0x14
function __init__() {
    function_8afdc221();
}

// Namespace zm_perk_mod_stronghold/zm_perk_mod_stronghold
// Params 0, eflags: 0x1 linked
// Checksum 0xeb6c82d8, Offset: 0xe0
// Size: 0x74
function function_8afdc221() {
    zm_perks::register_perk_clientfields(#"specialty_mod_camper", &function_46f52747, &function_d2d66071);
    zm_perks::register_perk_init_thread(#"specialty_mod_camper", &function_e630abb2);
}

// Namespace zm_perk_mod_stronghold/zm_perk_mod_stronghold
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x160
// Size: 0x4
function function_e630abb2() {
    
}

// Namespace zm_perk_mod_stronghold/zm_perk_mod_stronghold
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x170
// Size: 0x4
function function_46f52747() {
    
}

// Namespace zm_perk_mod_stronghold/zm_perk_mod_stronghold
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x180
// Size: 0x4
function function_d2d66071() {
    
}

