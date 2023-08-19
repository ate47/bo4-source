// Atian COD Tools GSC decompiler test
#include scripts/wz_common/character_unlock_fixup.gsc;
#include scripts/core_common/system_shared.gsc;

#namespace character_unlock_spectre_fixup;

// Namespace character_unlock_spectre_fixup/character_unlock_spectre_fixup
// Params 0, eflags: 0x2
// Checksum 0x3d79fc4d, Offset: 0x78
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_spectre_fixup", &__init__, undefined, #"character_unlock_fixup");
}

// Namespace character_unlock_spectre_fixup/character_unlock_spectre_fixup
// Params 0, eflags: 0x1 linked
// Checksum 0xcd871972, Offset: 0xc8
// Size: 0x64
function __init__() {
    character_unlock_fixup::register_character_unlock(#"spectre_unlock", #"hash_1ee2659e8dff07d8", #"cu34_item", &function_d95e620c, #"hash_27023afb3f91aba5");
}

// Namespace character_unlock_spectre_fixup/character_unlock_spectre_fixup
// Params 0, eflags: 0x1 linked
// Checksum 0x271b2cb7, Offset: 0x138
// Size: 0xb2
function function_d95e620c() {
    var_4c72e3da = (isdefined(getgametypesetting(#"hash_50b1121aee76a7e4")) ? getgametypesetting(#"hash_50b1121aee76a7e4") : 0) && (isdefined(getgametypesetting(#"hash_6fe34e77ba14d86f")) ? getgametypesetting(#"hash_6fe34e77ba14d86f") : 0);
    return var_4c72e3da;
}

