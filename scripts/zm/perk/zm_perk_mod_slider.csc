#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_perks;

#namespace zm_perk_mod_slider;

// Namespace zm_perk_mod_slider/zm_perk_mod_slider
// Params 0, eflags: 0x2
// Checksum 0xa5b41a2b, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_perk_mod_slider", &__init__, undefined, undefined);
}

// Namespace zm_perk_mod_slider/zm_perk_mod_slider
// Params 0, eflags: 0x0
// Checksum 0x1a06840f, Offset: 0xc0
// Size: 0x14
function __init__() {
    function_bf3cfde4();
}

// Namespace zm_perk_mod_slider/zm_perk_mod_slider
// Params 0, eflags: 0x0
// Checksum 0x8dba9a8e, Offset: 0xe0
// Size: 0x74
function function_bf3cfde4() {
    zm_perks::register_perk_clientfields(#"specialty_mod_phdflopper", &function_59383c4e, &function_613ff0da);
    zm_perks::register_perk_init_thread(#"specialty_mod_phdflopper", &function_58cb6bff);
}

// Namespace zm_perk_mod_slider/zm_perk_mod_slider
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0x160
// Size: 0x4
function function_58cb6bff() {
    
}

// Namespace zm_perk_mod_slider/zm_perk_mod_slider
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0x170
// Size: 0x4
function function_59383c4e() {
    
}

// Namespace zm_perk_mod_slider/zm_perk_mod_slider
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0x180
// Size: 0x4
function function_613ff0da() {
    
}

