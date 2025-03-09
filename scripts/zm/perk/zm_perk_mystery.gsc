#using scripts\core_common\clientfield_shared;
#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_perks;

#namespace zm_perk_mystery;

// Namespace zm_perk_mystery/zm_perk_mystery
// Params 0, eflags: 0x2
// Checksum 0xe9377090, Offset: 0xd0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_perk_mystery", &__init__, undefined, undefined);
}

// Namespace zm_perk_mystery/zm_perk_mystery
// Params 0, eflags: 0x0
// Checksum 0x34c97978, Offset: 0x118
// Size: 0x14
function __init__() {
    function_27473e44();
}

// Namespace zm_perk_mystery/zm_perk_mystery
// Params 0, eflags: 0x0
// Checksum 0x975f7cdf, Offset: 0x138
// Size: 0x16c
function function_27473e44() {
    if (function_8b1a219a()) {
        zm_perks::register_perk_basic_info(#"specialty_mystery", #"perk_mystery", 1500, #"hash_7db4db936bc2abe6", getweapon("zombie_perk_bottle_mystery"), getweapon("zombie_perk_vapor_juggernaut"), #"zmperkssecretsauce");
    } else {
        zm_perks::register_perk_basic_info(#"specialty_mystery", #"perk_mystery", 1500, #"zombie/perk_mystery", getweapon("zombie_perk_bottle_mystery"), getweapon("zombie_perk_vapor_juggernaut"), #"zmperkssecretsauce");
    }
    zm_perks::register_perk_mod_basic_info(#"hash_23c63c9a3acb397", "perk_mod_mystery", #"perk_mystery", #"specialty_mystery", 2500);
}

