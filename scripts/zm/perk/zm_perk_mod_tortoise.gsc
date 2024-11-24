#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_perks;

#namespace zm_perk_mod_tortoise;

// Namespace zm_perk_mod_tortoise/zm_perk_mod_tortoise
// Params 0, eflags: 0x2
// Checksum 0xfb9322e4, Offset: 0x88
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_perk_mod_tortoise", &__init__, &__main__, undefined);
}

// Namespace zm_perk_mod_tortoise/zm_perk_mod_tortoise
// Params 0, eflags: 0x1 linked
// Checksum 0xc8b6d221, Offset: 0xd8
// Size: 0x14
function __init__() {
    function_dfb8db6a();
}

// Namespace zm_perk_mod_tortoise/zm_perk_mod_tortoise
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0xf8
// Size: 0x4
function __main__() {
    
}

// Namespace zm_perk_mod_tortoise/zm_perk_mod_tortoise
// Params 0, eflags: 0x1 linked
// Checksum 0xe0601de2, Offset: 0x108
// Size: 0x94
function function_dfb8db6a() {
    zm_perks::register_perk_mod_basic_info(#"specialty_mod_shield", "mod_tortoise", #"perk_tortoise", #"specialty_shield", 3500);
    zm_perks::register_perk_threads(#"specialty_mod_shield", &function_f2b55850, &function_844bdb66);
}

// Namespace zm_perk_mod_tortoise/zm_perk_mod_tortoise
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x1a8
// Size: 0x4
function function_f2b55850() {
    
}

// Namespace zm_perk_mod_tortoise/zm_perk_mod_tortoise
// Params 4, eflags: 0x1 linked
// Checksum 0x88998a54, Offset: 0x1b8
// Size: 0x24
function function_844bdb66(b_pause, str_perk, str_result, n_slot) {
    
}

