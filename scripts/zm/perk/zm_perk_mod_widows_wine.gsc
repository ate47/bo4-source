// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_perks.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_perk_mod_widows_wine;

// Namespace zm_perk_mod_widows_wine/zm_perk_mod_widows_wine
// Params 0, eflags: 0x2
// Checksum 0x10084b51, Offset: 0x90
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_perk_mod_widows_wine", &__init__, undefined, undefined);
}

// Namespace zm_perk_mod_widows_wine/zm_perk_mod_widows_wine
// Params 0, eflags: 0x1 linked
// Checksum 0x671e82df, Offset: 0xd8
// Size: 0x14
function __init__() {
    enable_widows_wine_perk_for_level();
}

// Namespace zm_perk_mod_widows_wine/zm_perk_mod_widows_wine
// Params 0, eflags: 0x1 linked
// Checksum 0x10305236, Offset: 0xf8
// Size: 0x94
function enable_widows_wine_perk_for_level() {
    zm_perks::register_perk_mod_basic_info(#"specialty_mod_widowswine", "mod_widows_wine", #"perk_widows_wine", #"specialty_widowswine", 4500);
    zm_perks::register_perk_threads(#"specialty_mod_widowswine", &widows_wine_perk_activate, &widows_wine_perk_lost);
}

// Namespace zm_perk_mod_widows_wine/zm_perk_mod_widows_wine
// Params 0, eflags: 0x1 linked
// Checksum 0x37650e36, Offset: 0x198
// Size: 0x10
function widows_wine_perk_activate() {
    self.var_a33a5a37++;
}

// Namespace zm_perk_mod_widows_wine/zm_perk_mod_widows_wine
// Params 4, eflags: 0x1 linked
// Checksum 0x439b4043, Offset: 0x1b0
// Size: 0x36
function widows_wine_perk_lost(b_pause, str_perk, str_result, n_slot) {
    self notify(#"hash_4fa1f45a60444ddc");
}

