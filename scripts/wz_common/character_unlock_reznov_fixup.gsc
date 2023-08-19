// Atian COD Tools GSC decompiler test
#include scripts/wz_common/character_unlock_fixup.gsc;
#include scripts/core_common/system_shared.gsc;

#namespace character_unlock_reznov_fixup;

// Namespace character_unlock_reznov_fixup/character_unlock_reznov_fixup
// Params 0, eflags: 0x2
// Checksum 0xe1096041, Offset: 0x78
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_reznov_fixup", &__init__, undefined, #"character_unlock_fixup");
}

// Namespace character_unlock_reznov_fixup/character_unlock_reznov_fixup
// Params 0, eflags: 0x1 linked
// Checksum 0x8d92d3b, Offset: 0xc8
// Size: 0x74
function __init__() {
    character_unlock_fixup::register_character_unlock(#"reznov_unlock", #"hash_44599132bf7320e8", #"cu21_item", &function_d95e620c, #"hash_1cd3eb5d2d22f647", #"hash_1cd3ec5d2d22f7fa");
}

// Namespace character_unlock_reznov_fixup/character_unlock_reznov_fixup
// Params 0, eflags: 0x1 linked
// Checksum 0x10359241, Offset: 0x148
// Size: 0xb2
function function_d95e620c() {
    var_a4904ac0 = (isdefined(getgametypesetting(#"hash_50b1121aee76a7e4")) ? getgametypesetting(#"hash_50b1121aee76a7e4") : 0) && (isdefined(getgametypesetting(#"hash_47242abeaa29479b")) ? getgametypesetting(#"hash_47242abeaa29479b") : 0);
    return var_a4904ac0;
}

