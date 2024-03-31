// Atian COD Tools GSC decompiler test
#using scripts\core_common\system_shared.csc;
#using scripts\mp_common\item_world_fixup.csc;

#namespace wz_common_fixup;

// Namespace wz_common_fixup/wz_common_fixup
// Params 0, eflags: 0x2
// Checksum 0x571efb79, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"wz_common_fixup", &__init__, undefined, undefined);
}

// Namespace wz_common_fixup/wz_common_fixup
// Params 0, eflags: 0x2
// Checksum 0x8da7e28b, Offset: 0xc0
// Size: 0x14
function autoexec __init() {
    function_41453b43();
}

// Namespace wz_common_fixup/wz_common_fixup
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0xe0
// Size: 0x4
function __init__() {
    
}

// Namespace wz_common_fixup/wz_common_fixup
// Params 3, eflags: 0x0
// Checksum 0x479d5740, Offset: 0xf0
// Size: 0x52
function item_remover(func1, func2, param1) {
    if (!isdefined(param1)) {
        return;
    }
    if (isdefined(func1)) {
        [[ func1 ]](param1);
    }
    if (isdefined(func2)) {
        [[ func2 ]](param1);
    }
}

// Namespace wz_common_fixup/wz_common_fixup
// Params 4, eflags: 0x0
// Checksum 0xb4b91970, Offset: 0x150
// Size: 0x70
function item_replacer(func1, func2, list1, list2) {
    if (!isdefined(list1) || !isdefined(list2)) {
        return;
    }
    if (isdefined(func1)) {
        [[ func1 ]](list1, list2);
    }
    if (isdefined(func2)) {
        [[ func2 ]](list1, list2);
    }
}

// Namespace wz_common_fixup/wz_common_fixup
// Params 0, eflags: 0x0
// Checksum 0xdb66cd57, Offset: 0x1c8
// Size: 0x96
function function_41453b43() {
    var_a12b4736 = &item_world_fixup::function_96ff7b88;
    var_d2223309 = &item_world_fixup::function_261ab7f5;
    var_b5014996 = &item_world_fixup::function_19089c75;
    var_87d0eef8 = &item_world_fixup::remove_item;
    var_74257310 = &item_world_fixup::add_item_replacement;
    var_f8a4c541 = &item_world_fixup::function_6991057;
}

