// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_perks.csc;
#using scripts\core_common\visionset_mgr_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;

#namespace zm_perk_staminup;

// Namespace zm_perk_staminup/zm_perk_staminup
// Params 0, eflags: 0x2
// Checksum 0x921667e, Offset: 0x130
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_perk_staminup", &__init__, undefined, undefined);
}

// Namespace zm_perk_staminup/zm_perk_staminup
// Params 0, eflags: 0x1 linked
// Checksum 0xbbdf4997, Offset: 0x178
// Size: 0x14
function __init__() {
    enable_staminup_perk_for_level();
}

// Namespace zm_perk_staminup/zm_perk_staminup
// Params 0, eflags: 0x1 linked
// Checksum 0xaf84dd13, Offset: 0x198
// Size: 0x104
function enable_staminup_perk_for_level() {
    zm_perks::register_perk_clientfields(#"specialty_staminup", &staminup_client_field_func, &staminup_callback_func);
    zm_perks::register_perk_effects(#"specialty_staminup", "marathon_light");
    zm_perks::register_perk_init_thread(#"specialty_staminup", &init_staminup);
    zm_perks::function_b60f4a9f(#"specialty_staminup", #"p8_zm_vapor_altar_icon_01_staminup", "zombie/fx8_perk_altar_symbol_ambient_staminup", #"zmperksstaminup");
    zm_perks::function_f3c80d73("zombie_perk_bottle_marathon", "zombie_perk_totem_staminup");
}

// Namespace zm_perk_staminup/zm_perk_staminup
// Params 0, eflags: 0x1 linked
// Checksum 0x3d37af16, Offset: 0x2a8
// Size: 0x4a
function init_staminup() {
    if (isdefined(level.enable_magic) && level.enable_magic) {
        level._effect[#"marathon_light"] = "zombie/fx_perk_stamin_up_zmb";
    }
}

// Namespace zm_perk_staminup/zm_perk_staminup
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x300
// Size: 0x4
function staminup_client_field_func() {
    
}

// Namespace zm_perk_staminup/zm_perk_staminup
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x310
// Size: 0x4
function staminup_callback_func() {
    
}

