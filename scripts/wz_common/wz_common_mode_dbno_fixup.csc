#using scripts\mp_common\item_world_fixup;
#using scripts\wz_common\wz_common_fixup;

#namespace wz_common_mode_dbno_fixup;

// Namespace wz_common_mode_dbno_fixup/wz_common_mode_dbno_fixup
// Params 0, eflags: 0x2
// Checksum 0xdb8abd8d, Offset: 0x78
// Size: 0x14
function autoexec __init__()
{
    function_22c36a1e();
}

// Namespace wz_common_mode_dbno_fixup/wz_common_mode_dbno_fixup
// Params 0
// Checksum 0x830e9eee, Offset: 0x98
// Size: 0x96
function function_22c36a1e()
{
    var_a12b4736 = &item_world_fixup::function_96ff7b88;
    var_d2223309 = &item_world_fixup::function_261ab7f5;
    var_b5014996 = &item_world_fixup::function_19089c75;
    var_87d0eef8 = &item_world_fixup::remove_item;
    var_74257310 = &item_world_fixup::add_item_replacement;
    var_f8a4c541 = &item_world_fixup::function_6991057;
}

