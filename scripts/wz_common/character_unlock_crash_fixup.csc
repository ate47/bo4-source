// Atian COD Tools GSC decompiler test
#include scripts/wz_common/character_unlock_fixup.csc;
#include scripts/core_common/system_shared.csc;

#namespace character_unlock_crash_fixup;

// Namespace character_unlock_crash_fixup/character_unlock_crash_fixup
// Params 0, eflags: 0x2
// Checksum 0xdd7bfc45, Offset: 0x78
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_crash_fixup", &__init__, undefined, #"character_unlock_fixup");
}

// Namespace character_unlock_crash_fixup/character_unlock_crash_fixup
// Params 0, eflags: 0x1 linked
// Checksum 0xe907d8b2, Offset: 0xc8
// Size: 0x74
function __init__() {
    character_unlock_fixup::register_character_unlock(#"crash_unlock", #"hash_7a9842f6bec0e568", #"cu03_item", &function_d95e620c, #"hash_7ccc9c0240fd010e", #"hash_7ccc9b0240fcff5b");
}

// Namespace character_unlock_crash_fixup/character_unlock_crash_fixup
// Params 0, eflags: 0x1 linked
// Checksum 0x6a6a4267, Offset: 0x148
// Size: 0xb2
function function_d95e620c() {
    var_da8a21a0 = (isdefined(getgametypesetting(#"hash_50b1121aee76a7e4")) ? getgametypesetting(#"hash_50b1121aee76a7e4") : 0) && (isdefined(getgametypesetting(#"hash_4c66b817adba935c")) ? getgametypesetting(#"hash_4c66b817adba935c") : 0);
    return var_da8a21a0;
}
