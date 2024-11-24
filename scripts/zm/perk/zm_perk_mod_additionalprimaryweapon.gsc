#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_perks;

#namespace zm_perk_mod_additionalprimaryweapon;

// Namespace zm_perk_mod_additionalprimaryweapon/zm_perk_mod_additionalprimaryweapon
// Params 0, eflags: 0x2
// Checksum 0x8b1639f4, Offset: 0x98
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_perk_mod_additionalprimaryweapon", &__init__, undefined, undefined);
}

// Namespace zm_perk_mod_additionalprimaryweapon/zm_perk_mod_additionalprimaryweapon
// Params 0, eflags: 0x1 linked
// Checksum 0xf2e3ff67, Offset: 0xe0
// Size: 0x14
function __init__() {
    enable_additional_primary_weapon_perk_for_level();
}

// Namespace zm_perk_mod_additionalprimaryweapon/zm_perk_mod_additionalprimaryweapon
// Params 0, eflags: 0x1 linked
// Checksum 0xe0bb9a1d, Offset: 0x100
// Size: 0xd4
function enable_additional_primary_weapon_perk_for_level() {
    zm_perks::register_perk_mod_basic_info(#"specialty_mod_additionalprimaryweapon", "mod_additionalprimaryweapon", #"perk_additional_primary_weapon", #"specialty_additionalprimaryweapon", 5000);
    zm_perks::register_perk_threads(#"specialty_mod_additionalprimaryweapon", &function_ffa39915, &function_8f205daa);
    zm_perks::function_2ae97a14(#"specialty_mod_additionalprimaryweapon", array(#"specialty_fastweaponswitch"));
}

// Namespace zm_perk_mod_additionalprimaryweapon/zm_perk_mod_additionalprimaryweapon
// Params 0, eflags: 0x1 linked
// Checksum 0x722454fc, Offset: 0x1e0
// Size: 0x12
function function_ffa39915() {
    self.var_dd1b11fe = 1;
}

// Namespace zm_perk_mod_additionalprimaryweapon/zm_perk_mod_additionalprimaryweapon
// Params 4, eflags: 0x1 linked
// Checksum 0xc957087a, Offset: 0x200
// Size: 0x24
function function_8f205daa(b_pause, str_perk, str_result, n_slot) {
    
}

// Namespace zm_perk_mod_additionalprimaryweapon/zm_perk_mod_additionalprimaryweapon
// Params 1, eflags: 0x1 linked
// Checksum 0xa4c8b117, Offset: 0x230
// Size: 0xe6
function function_69f490a(var_aecb3e98) {
    if (!isdefined(level.var_2bb81f4b)) {
        level.var_2bb81f4b = [];
    } else if (!isarray(level.var_2bb81f4b)) {
        level.var_2bb81f4b = array(level.var_2bb81f4b);
    }
    if (!isdefined(var_aecb3e98)) {
        var_aecb3e98 = [];
    } else if (!isarray(var_aecb3e98)) {
        var_aecb3e98 = array(var_aecb3e98);
    }
    level.var_2bb81f4b = arraycombine(level.var_2bb81f4b, var_aecb3e98, 0, 0);
}

// Namespace zm_perk_mod_additionalprimaryweapon/zm_perk_mod_additionalprimaryweapon
// Params 1, eflags: 0x1 linked
// Checksum 0x25021b16, Offset: 0x320
// Size: 0x94
function function_23c3c9db(weapon) {
    if (!isdefined(level.var_2bb81f4b)) {
        level.var_2bb81f4b = [];
    } else if (!isarray(level.var_2bb81f4b)) {
        level.var_2bb81f4b = array(level.var_2bb81f4b);
    }
    return !isinarray(level.var_2bb81f4b, weapon);
}

