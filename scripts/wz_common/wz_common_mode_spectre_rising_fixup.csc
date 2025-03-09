#using scripts\mp_common\item_world_fixup;
#using scripts\wz_common\wz_common_fixup;

#namespace wz_common_mode_spectre_rising_fixup;

// Namespace wz_common_mode_spectre_rising_fixup/wz_common_mode_spectre_rising_fixup
// Params 0, eflags: 0x2
// Checksum 0x246364e3, Offset: 0x98
// Size: 0x14
function autoexec __init__() {
    function_63ad593a();
}

// Namespace wz_common_mode_spectre_rising_fixup/level_init
// Params 1, eflags: 0x40
// Checksum 0x99c531f1, Offset: 0xb8
// Size: 0x24
function event_handler[level_init] main(eventstruct) {
    level thread function_b9962a73();
}

// Namespace wz_common_mode_spectre_rising_fixup/wz_common_mode_spectre_rising_fixup
// Params 0, eflags: 0x0
// Checksum 0x67b2319a, Offset: 0xe8
// Size: 0xf8
function function_b9962a73() {
    if (isdefined(getgametypesetting(#"wzspectrerising")) && getgametypesetting(#"wzspectrerising")) {
        chests = getdynentarray("world_ammo_stash_blackjack");
        foreach (dynent in chests) {
            add_helico(dynent, #"hash_6a582b37e8f152b4");
        }
    }
}

// Namespace wz_common_mode_spectre_rising_fixup/wz_common_mode_spectre_rising_fixup
// Params 0, eflags: 0x0
// Checksum 0x60ca8795, Offset: 0x1e8
// Size: 0x1bc
function function_63ad593a() {
    var_a12b4736 = &item_world_fixup::function_96ff7b88;
    var_d2223309 = &item_world_fixup::function_261ab7f5;
    var_b5014996 = &item_world_fixup::function_19089c75;
    var_87d0eef8 = &item_world_fixup::remove_item;
    var_74257310 = &item_world_fixup::add_item_replacement;
    var_f8a4c541 = &item_world_fixup::function_6991057;
    var_edfbccd0 = &item_world_fixup::function_e70fa91c;
    if (isdefined(getgametypesetting(#"wzspectrerising")) && getgametypesetting(#"wzspectrerising")) {
        wz_common_fixup::item_replacer(var_b5014996, var_f8a4c541, #"blackjack_ammo_stash_parent_placeholder", #"spectre_rising_stash");
        if (isdefined(getgametypesetting(#"wzenablespectregrenade")) && getgametypesetting(#"wzenablespectregrenade")) {
            wz_common_fixup::item_replacer(var_d2223309, var_74257310, #"smoke_grenade_wz_item", #"spectre_grenade_wz_item");
        }
    }
}

