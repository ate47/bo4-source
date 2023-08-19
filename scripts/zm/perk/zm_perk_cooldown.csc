// Atian COD Tools GSC decompiler test
#include scripts/zm_common/zm_perks.csc;
#include scripts/core_common/system_shared.csc;
#include scripts/core_common/clientfield_shared.csc;

#namespace zm_perk_cooldown;

// Namespace zm_perk_cooldown/zm_perk_cooldown
// Params 0, eflags: 0x2
// Checksum 0x7485c835, Offset: 0x100
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_perk_cooldown", &__init__, undefined, undefined);
}

// Namespace zm_perk_cooldown/zm_perk_cooldown
// Params 0, eflags: 0x1 linked
// Checksum 0x52ea86d0, Offset: 0x148
// Size: 0x14
function __init__() {
    enable_cooldown_perk_for_level();
}

// Namespace zm_perk_cooldown/zm_perk_cooldown
// Params 0, eflags: 0x1 linked
// Checksum 0xa94fdf03, Offset: 0x168
// Size: 0x104
function enable_cooldown_perk_for_level() {
    zm_perks::register_perk_clientfields(#"specialty_cooldown", &function_683242be, &function_20945b84);
    zm_perks::register_perk_effects(#"specialty_cooldown", "divetonuke_light");
    zm_perks::register_perk_init_thread(#"specialty_cooldown", &init_cooldown);
    zm_perks::function_b60f4a9f(#"specialty_cooldown", #"p8_zm_vapor_altar_icon_01_timeslip", "zombie/fx8_perk_altar_symbol_ambient_timeslip", #"zmperkscooldown");
    zm_perks::function_f3c80d73("zombie_perk_bottle_cooldown", "zombie_perk_totem_timeslip");
}

// Namespace zm_perk_cooldown/zm_perk_cooldown
// Params 0, eflags: 0x1 linked
// Checksum 0x6ea6ffb8, Offset: 0x278
// Size: 0x52
function init_cooldown() {
    if (isdefined(level.enable_magic) && level.enable_magic) {
        level._effect[#"divetonuke_light"] = #"hash_2225287695ddf9c9";
    }
}

// Namespace zm_perk_cooldown/zm_perk_cooldown
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x2d8
// Size: 0x4
function function_683242be() {
    
}

// Namespace zm_perk_cooldown/zm_perk_cooldown
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x2e8
// Size: 0x4
function function_20945b84() {
    
}

