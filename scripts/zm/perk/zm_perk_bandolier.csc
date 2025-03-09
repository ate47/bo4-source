#using scripts\core_common\clientfield_shared;
#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_perks;

#namespace zm_perk_bandolier;

// Namespace zm_perk_bandolier/zm_perk_bandolier
// Params 0, eflags: 0x2
// Checksum 0xfcf3de23, Offset: 0x100
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_perk_bandolier", &__init__, undefined, undefined);
}

// Namespace zm_perk_bandolier/zm_perk_bandolier
// Params 0, eflags: 0x0
// Checksum 0xd222562a, Offset: 0x148
// Size: 0x34
function __init__() {
    function_27473e44();
    zm_perks::function_f3c80d73("zombie_perk_bottle_bandolier", "zombie_perk_totem_bandolier");
}

// Namespace zm_perk_bandolier/zm_perk_bandolier
// Params 0, eflags: 0x0
// Checksum 0x638eb393, Offset: 0x188
// Size: 0xe4
function function_27473e44() {
    zm_perks::register_perk_clientfields(#"specialty_extraammo", &function_12161a30, &function_b10a7225);
    zm_perks::register_perk_effects(#"specialty_extraammo", "sleight_light");
    zm_perks::register_perk_init_thread(#"specialty_extraammo", &init_perk);
    zm_perks::function_b60f4a9f(#"specialty_extraammo", #"p8_zm_vapor_altar_icon_01_bandolierbandit", "zombie/fx8_perk_altar_symbol_ambient_bandolier", #"zmperksbandolier");
}

// Namespace zm_perk_bandolier/zm_perk_bandolier
// Params 0, eflags: 0x0
// Checksum 0xbadb5247, Offset: 0x278
// Size: 0x24
function init_perk() {
    if (isdefined(level.enable_magic) && level.enable_magic) {
    }
}

// Namespace zm_perk_bandolier/zm_perk_bandolier
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0x2a8
// Size: 0x4
function function_12161a30() {
    
}

// Namespace zm_perk_bandolier/zm_perk_bandolier
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0x2b8
// Size: 0x4
function function_b10a7225() {
    
}

