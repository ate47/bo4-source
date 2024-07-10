#using scripts\zm_common\zm_perks.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_perk_mod_dying_wish;

// Namespace zm_perk_mod_dying_wish/zm_perk_mod_dying_wish
// Params 0, eflags: 0x2
// Checksum 0xa75b5c5f, Offset: 0x90
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_perk_mod_dying_wish", &__init__, &__main__, undefined);
}

// Namespace zm_perk_mod_dying_wish/zm_perk_mod_dying_wish
// Params 0, eflags: 0x1 linked
// Checksum 0x31905e07, Offset: 0xe0
// Size: 0x14
function __init__() {
    function_7186a3aa();
}

// Namespace zm_perk_mod_dying_wish/zm_perk_mod_dying_wish
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x100
// Size: 0x4
function __main__() {
    
}

// Namespace zm_perk_mod_dying_wish/zm_perk_mod_dying_wish
// Params 0, eflags: 0x1 linked
// Checksum 0x9d0d1c45, Offset: 0x110
// Size: 0x94
function function_7186a3aa() {
    zm_perks::register_perk_mod_basic_info(#"specialty_mod_berserker", "mod_dying_wish", #"perk_dying_wish", #"specialty_berserker", 5000);
    zm_perks::register_perk_threads(#"specialty_mod_berserker", &function_fb91d1a, &function_63f21c1e);
}

// Namespace zm_perk_mod_dying_wish/zm_perk_mod_dying_wish
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x1b0
// Size: 0x4
function function_fb91d1a() {
    
}

// Namespace zm_perk_mod_dying_wish/zm_perk_mod_dying_wish
// Params 4, eflags: 0x1 linked
// Checksum 0x7de5da40, Offset: 0x1c0
// Size: 0x24
function function_63f21c1e(b_pause, str_perk, str_result, n_slot) {
    
}

