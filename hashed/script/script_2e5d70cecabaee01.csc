#using scripts\mp_common\item_world_fixup;
#using scripts\wz_common\wz_common_fixup;

#namespace namespace_f75691cc;

// Namespace namespace_f75691cc/namespace_f75691cc
// Params 0, eflags: 0x2
// Checksum 0x512f6983, Offset: 0x78
// Size: 0x14
function autoexec __init__() {
    function_d8c2344b();
}

// Namespace namespace_f75691cc/namespace_f75691cc
// Params 0, eflags: 0x1 linked
// Checksum 0x1d9dcbc8, Offset: 0x98
// Size: 0x20c
function function_d8c2344b() {
    var_a12b4736 = &item_world_fixup::function_96ff7b88;
    var_d2223309 = &item_world_fixup::function_261ab7f5;
    var_b5014996 = &item_world_fixup::function_19089c75;
    var_87d0eef8 = &item_world_fixup::remove_item;
    var_74257310 = &item_world_fixup::add_item_replacement;
    var_f8a4c541 = &item_world_fixup::function_6991057;
    if (isdefined(getgametypesetting(#"wzenableflareguns")) && getgametypesetting(#"wzenableflareguns")) {
        item_world_fixup::function_e70fa91c(#"wz_escape_supply_stash_parent", #"wz_escape_supply_stash_parent_flare_guns", 1);
    }
    if (isdefined(getgametypesetting(#"hash_50b1121aee76a7e4")) && getgametypesetting(#"hash_50b1121aee76a7e4")) {
        wz_common_fixup::item_replacer(var_f8a4c541, undefined, #"cu08_list", #"cu08_list_escape");
        wz_common_fixup::item_replacer(var_f8a4c541, undefined, #"cu32_list", #"cu32_list_escape");
        wz_common_fixup::item_replacer(var_f8a4c541, undefined, #"cu33_list", #"cu33_list_escape");
    }
}

