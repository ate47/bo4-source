#using scripts\zm_common\zm_perks.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace zm_perk_mystery;

// Namespace zm_perk_mystery/zm_perk_mystery
// Params 0, eflags: 0x2
// Checksum 0x348704cf, Offset: 0xb8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_perk_mystery", &__init__, undefined, undefined);
}

// Namespace zm_perk_mystery/zm_perk_mystery
// Params 0, eflags: 0x1 linked
// Checksum 0x7db1df93, Offset: 0x100
// Size: 0x14
function __init__() {
    function_27473e44();
}

// Namespace zm_perk_mystery/zm_perk_mystery
// Params 0, eflags: 0x1 linked
// Checksum 0x6439977b, Offset: 0x120
// Size: 0x8c
function function_27473e44() {
    zm_perks::register_perk_clientfields(#"specialty_mystery", &function_12161a30, &function_b10a7225);
    zm_perks::function_b60f4a9f(#"specialty_mystery", #"p8_zm_vapor_altar_icon_01_secretsauce", "zombie/fx8_perk_altar_symbol_ambient_secret_sauce", #"zmperkssecretsauce");
}

// Namespace zm_perk_mystery/zm_perk_mystery
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x1b8
// Size: 0x4
function function_12161a30() {
    
}

// Namespace zm_perk_mystery/zm_perk_mystery
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x1c8
// Size: 0x4
function function_b10a7225() {
    
}

