// Atian COD Tools GSC decompiler test
#using scripts\wz_common\character_unlock_fixup.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace character_unlock_woods_fixup;

// Namespace character_unlock_woods_fixup/character_unlock_woods_fixup
// Params 0, eflags: 0x2
// Checksum 0xcf102294, Offset: 0x78
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_woods_fixup", &__init__, undefined, #"character_unlock_fixup");
}

// Namespace character_unlock_woods_fixup/character_unlock_woods_fixup
// Params 0, eflags: 0x0
// Checksum 0xbecf2f89, Offset: 0xc8
// Size: 0x74
function __init__() {
    character_unlock_fixup::register_character_unlock(#"woods_unlock", #"hash_3f01badbd66b2962", #"cu22_item", &function_d95e620c, #"hash_17a4baf5ec553be7", #"hash_17a4bbf5ec553d9a");
}

// Namespace character_unlock_woods_fixup/character_unlock_woods_fixup
// Params 0, eflags: 0x0
// Checksum 0xe18164aa, Offset: 0x148
// Size: 0xb2
function function_d95e620c() {
    var_fca3d7af = (isdefined(getgametypesetting(#"hash_50b1121aee76a7e4")) ? getgametypesetting(#"hash_50b1121aee76a7e4") : 0) && (isdefined(getgametypesetting(#"hash_265bdda9362c5a35")) ? getgametypesetting(#"hash_265bdda9362c5a35") : 0);
    return var_fca3d7af;
}

