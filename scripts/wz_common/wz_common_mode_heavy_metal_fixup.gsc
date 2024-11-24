#using scripts\mp_common\item_world_fixup;
#using scripts\wz_common\wz_common_fixup;

#namespace wz_common_mode_heavy_metal_fixup;

// Namespace wz_common_mode_heavy_metal_fixup/wz_common_mode_heavy_metal_fixup
// Params 0, eflags: 0x2
// Checksum 0xba1ad430, Offset: 0x78
// Size: 0x14
function autoexec __init__() {
    function_95ba8fb7();
}

// Namespace wz_common_mode_heavy_metal_fixup/wz_common_mode_heavy_metal_fixup
// Params 0, eflags: 0x1 linked
// Checksum 0x7b75fb, Offset: 0x98
// Size: 0x724
function function_95ba8fb7() {
    var_a12b4736 = &item_world_fixup::function_96ff7b88;
    var_d2223309 = &item_world_fixup::function_261ab7f5;
    var_b5014996 = &item_world_fixup::function_19089c75;
    var_87d0eef8 = &item_world_fixup::remove_item;
    var_74257310 = &item_world_fixup::add_item_replacement;
    var_f8a4c541 = &item_world_fixup::function_6991057;
    if (isdefined(getgametypesetting(#"wzenableheavymetalvehicles")) && getgametypesetting(#"wzenableheavymetalvehicles")) {
    }
    if (isdefined(getgametypesetting(#"wzenableheavymetal")) && getgametypesetting(#"wzenableheavymetal")) {
        wz_common_fixup::item_remover(var_a12b4736, var_87d0eef8, #"armor_item_medium");
        wz_common_fixup::item_replacer(var_d2223309, var_74257310, #"armor_item_small", #"armor_item_large");
        wz_common_fixup::item_remover(var_a12b4736, var_87d0eef8, #"health_item_small");
        wz_common_fixup::item_remover(var_a12b4736, var_87d0eef8, #"hash_1b975e4c6ae8b190");
        wz_common_fixup::item_replacer(var_d2223309, var_74257310, #"health_item_medium", #"health_item_large");
        wz_common_fixup::item_replacer(var_d2223309, var_74257310, #"hash_5119794c0791738", #"hash_1bb3938ead724a68");
        wz_common_fixup::item_replacer(var_b5014996, var_f8a4c541, #"guns_ars_dlc1", #"heavymetal_guns");
        wz_common_fixup::item_replacer(var_b5014996, var_f8a4c541, #"guns_launchers_dlc1", #"heavymetal_guns");
        wz_common_fixup::item_replacer(var_b5014996, var_f8a4c541, #"guns_lmgs_dlc1", #"heavymetal_guns");
        wz_common_fixup::item_replacer(var_b5014996, var_f8a4c541, #"guns_pistols_dlc1", #"heavymetal_guns");
        wz_common_fixup::item_replacer(var_b5014996, var_f8a4c541, #"guns_shotguns_dlc1", #"heavymetal_guns");
        wz_common_fixup::item_replacer(var_b5014996, var_f8a4c541, #"guns_smgs_dlc1", #"heavymetal_guns");
        wz_common_fixup::item_replacer(var_b5014996, var_f8a4c541, #"guns_snipers_dlc1", #"heavymetal_guns");
        wz_common_fixup::item_replacer(var_b5014996, var_f8a4c541, #"guns_trs_dlc1", #"heavymetal_guns");
        wz_common_fixup::item_replacer(var_b5014996, var_f8a4c541, #"guns_zombie_dlc1", #"heavymetal_guns");
        wz_common_fixup::item_replacer(var_b5014996, var_f8a4c541, #"guns_gold_parent_dlc1", #"heavymetal_guns_gold");
        wz_common_fixup::item_replacer(var_d2223309, var_74257310, #"ammo_type_12ga_item", #"ammo_type_rocket_item");
        wz_common_fixup::item_replacer(var_d2223309, var_74257310, #"ammo_type_338_item", #"ammo_type_50cal_item");
        wz_common_fixup::item_replacer(var_d2223309, var_74257310, #"ammo_type_45_item", #"ammo_type_762_item");
        wz_common_fixup::item_replacer(var_d2223309, var_74257310, #"ammo_type_9mm_item", #"ammo_type_556_item");
        wz_common_fixup::item_replacer(var_d2223309, var_74257310, #"ammo_type_rocket_item", #"ammo_type_rocket_item");
        wz_common_fixup::item_replacer(var_f8a4c541, undefined, #"supply_stash_slot1_dlc1", #"supply_stash_slot1_heavymetal");
        wz_common_fixup::item_replacer(var_f8a4c541, undefined, #"supply_stash_slot2_dlc1", #"supply_stash_slot2_heavymetal");
        wz_common_fixup::item_replacer(var_f8a4c541, undefined, #"supply_stash_slot3_dlc1", #"supply_stash_slot3_heavymetal");
        wz_common_fixup::item_replacer(var_f8a4c541, undefined, #"supply_stash_slot4_dlc1", #"supply_stash_slot4_heavymetal");
        wz_common_fixup::item_replacer(var_f8a4c541, undefined, #"supply_stash_slot5_dlc1", #"supply_stash_slot5_heavymetal");
        wz_common_fixup::item_replacer(var_f8a4c541, undefined, #"supply_stash_operator_mod_weapons", #"heavymetal_guns_operator");
        wz_common_fixup::item_replacer(var_f8a4c541, undefined, #"supply_stash_gold_guns", #"heavymetal_guns_gold");
    }
}

