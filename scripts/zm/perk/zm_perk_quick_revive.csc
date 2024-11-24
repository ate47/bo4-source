#using scripts\core_common\clientfield_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\visionset_mgr_shared;
#using scripts\zm_common\zm_perks;

#namespace zm_perk_quick_revive;

// Namespace zm_perk_quick_revive/zm_perk_quick_revive
// Params 0, eflags: 0x2
// Checksum 0xfaa08f7f, Offset: 0x110
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_perk_quick_revive", &__init__, undefined, undefined);
}

// Namespace zm_perk_quick_revive/zm_perk_quick_revive
// Params 0, eflags: 0x1 linked
// Checksum 0x1ae57d2a, Offset: 0x158
// Size: 0x14
function __init__() {
    enable_quick_revive_perk_for_level();
}

// Namespace zm_perk_quick_revive/zm_perk_quick_revive
// Params 0, eflags: 0x1 linked
// Checksum 0x6d5bbe70, Offset: 0x178
// Size: 0x104
function enable_quick_revive_perk_for_level() {
    zm_perks::register_perk_clientfields(#"specialty_quickrevive", &quick_revive_client_field_func, &quick_revive_callback_func);
    zm_perks::register_perk_effects(#"specialty_quickrevive", "revive_light");
    zm_perks::register_perk_init_thread(#"specialty_quickrevive", &init_quick_revive);
    zm_perks::function_b60f4a9f(#"specialty_quickrevive", #"p8_zm_vapor_altar_icon_01_quickrevive", "zombie/fx8_perk_altar_symbol_ambient_quick_revive", #"zmperksquickrevive");
    zm_perks::function_f3c80d73("zombie_perk_bottle_revive", "zombie_perk_totem_quick_revive");
}

// Namespace zm_perk_quick_revive/zm_perk_quick_revive
// Params 0, eflags: 0x1 linked
// Checksum 0xa9e40152, Offset: 0x288
// Size: 0x52
function init_quick_revive() {
    if (isdefined(level.enable_magic) && level.enable_magic) {
        level._effect[#"revive_light"] = #"zombie/fx_perk_quick_revive_zmb";
    }
}

// Namespace zm_perk_quick_revive/zm_perk_quick_revive
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x2e8
// Size: 0x4
function quick_revive_client_field_func() {
    
}

// Namespace zm_perk_quick_revive/zm_perk_quick_revive
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x2f8
// Size: 0x4
function quick_revive_callback_func() {
    
}

