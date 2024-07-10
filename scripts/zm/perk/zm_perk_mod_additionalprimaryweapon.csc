#using scripts\zm_common\zm_perks.csc;
#using scripts\core_common\visionset_mgr_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;

#namespace zm_perk_mod_additionalprimaryweapon;

// Namespace zm_perk_mod_additionalprimaryweapon/zm_perk_mod_additionalprimaryweapon
// Params 0, eflags: 0x2
// Checksum 0xda496598, Offset: 0x90
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_perk_mod_additionalprimaryweapon", &__init__, undefined, undefined);
}

// Namespace zm_perk_mod_additionalprimaryweapon/zm_perk_mod_additionalprimaryweapon
// Params 0, eflags: 0x1 linked
// Checksum 0x9c8b0d0c, Offset: 0xd8
// Size: 0x14
function __init__() {
    function_c0deb38d();
}

// Namespace zm_perk_mod_additionalprimaryweapon/zm_perk_mod_additionalprimaryweapon
// Params 0, eflags: 0x1 linked
// Checksum 0xae4fa091, Offset: 0xf8
// Size: 0x74
function function_c0deb38d() {
    zm_perks::register_perk_clientfields(#"specialty_mod_additionalprimaryweapon", &function_40cb6d31, &function_90e7d3be);
    zm_perks::register_perk_init_thread(#"specialty_mod_additionalprimaryweapon", &function_a850540);
}

// Namespace zm_perk_mod_additionalprimaryweapon/zm_perk_mod_additionalprimaryweapon
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x178
// Size: 0x4
function function_a850540() {
    
}

// Namespace zm_perk_mod_additionalprimaryweapon/zm_perk_mod_additionalprimaryweapon
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x188
// Size: 0x4
function function_40cb6d31() {
    
}

// Namespace zm_perk_mod_additionalprimaryweapon/zm_perk_mod_additionalprimaryweapon
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x198
// Size: 0x4
function function_90e7d3be() {
    
}

