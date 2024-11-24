#using scripts\core_common\clientfield_shared;
#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_perks;
#using scripts\zm_common\zm_powerups;

#namespace zm_perk_mod_wolf_protector;

// Namespace zm_perk_mod_wolf_protector/zm_perk_mod_wolf_protector
// Params 0, eflags: 0x2
// Checksum 0x93289060, Offset: 0xd0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_perk_mod_wolf_protector", &__init__, undefined, undefined);
}

// Namespace zm_perk_mod_wolf_protector/zm_perk_mod_wolf_protector
// Params 0, eflags: 0x1 linked
// Checksum 0xd8424e4a, Offset: 0x118
// Size: 0x3c
function __init__() {
    if (getdvarint(#"hash_4e1190045ef3588b", 0)) {
        function_27473e44();
    }
}

// Namespace zm_perk_mod_wolf_protector/zm_perk_mod_wolf_protector
// Params 0, eflags: 0x1 linked
// Checksum 0x43e06b5e, Offset: 0x160
// Size: 0xec
function function_27473e44() {
    zm_perks::register_perk_clientfields(#"specialty_mod_wolf_protector", &client_field_func, &code_callback_func);
    zm_perks::register_perk_init_thread(#"specialty_mod_wolf_protector", &init);
    zm_perks::function_b60f4a9f(#"specialty_mod_wolf_protector", #"p8_zm_vapor_altar_icon_01_bloodwolf", "zombie/fx8_perk_altar_symbol_ambient_blood_wolf", #"zmperkswolfprotector");
    zm_powerups::include_zombie_powerup("wolf_bonus_points");
    zm_powerups::add_zombie_powerup("wolf_bonus_points");
}

// Namespace zm_perk_mod_wolf_protector/zm_perk_mod_wolf_protector
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x258
// Size: 0x4
function init() {
    
}

// Namespace zm_perk_mod_wolf_protector/zm_perk_mod_wolf_protector
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x268
// Size: 0x4
function client_field_func() {
    
}

// Namespace zm_perk_mod_wolf_protector/zm_perk_mod_wolf_protector
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x278
// Size: 0x4
function code_callback_func() {
    
}

