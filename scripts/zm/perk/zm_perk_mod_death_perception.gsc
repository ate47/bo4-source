// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_perks.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_perk_mod_death_perception;

// Namespace zm_perk_mod_death_perception/zm_perk_mod_death_perception
// Params 0, eflags: 0x2
// Checksum 0x98ed9e2b, Offset: 0x90
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_perk_mod_death_perception", &__init__, &__main__, undefined);
}

// Namespace zm_perk_mod_death_perception/zm_perk_mod_death_perception
// Params 0, eflags: 0x1 linked
// Checksum 0xd33aa273, Offset: 0xe0
// Size: 0x14
function __init__() {
    function_bc420db4();
}

// Namespace zm_perk_mod_death_perception/zm_perk_mod_death_perception
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x100
// Size: 0x4
function __main__() {
    
}

// Namespace zm_perk_mod_death_perception/zm_perk_mod_death_perception
// Params 0, eflags: 0x1 linked
// Checksum 0x9987a196, Offset: 0x110
// Size: 0x94
function function_bc420db4() {
    zm_perks::register_perk_mod_basic_info(#"specialty_mod_awareness", "mod_death_perception", #"perk_death_perception", #"specialty_awareness", 3500);
    zm_perks::register_perk_threads(#"specialty_mod_awareness", &function_422ccf78, &function_f8f0703b);
}

// Namespace zm_perk_mod_death_perception/zm_perk_mod_death_perception
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x1b0
// Size: 0x4
function function_422ccf78() {
    
}

// Namespace zm_perk_mod_death_perception/zm_perk_mod_death_perception
// Params 4, eflags: 0x1 linked
// Checksum 0x3e7718ad, Offset: 0x1c0
// Size: 0x24
function function_f8f0703b(b_pause, str_perk, str_result, n_slot) {
    
}

