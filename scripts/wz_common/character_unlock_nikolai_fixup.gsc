// Atian COD Tools GSC decompiler test
#include scripts/wz_common/character_unlock_fixup.gsc;
#include scripts/core_common/system_shared.gsc;

#namespace character_unlock_nikolai_fixup;

// Namespace character_unlock_nikolai_fixup/character_unlock_nikolai_fixup
// Params 0, eflags: 0x2
// Checksum 0x2e88a49d, Offset: 0x78
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_nikolai_fixup", &__init__, undefined, #"character_unlock_fixup");
}

// Namespace character_unlock_nikolai_fixup/character_unlock_nikolai_fixup
// Params 0, eflags: 0x1 linked
// Checksum 0x9800907a, Offset: 0xc8
// Size: 0x64
function __init__() {
    character_unlock_fixup::register_character_unlock(#"nikolai_unlock", #"hash_1d718be46a94371f", #"cu16_item", &function_d95e620c, #"hash_6a5c9e02cc60e87e");
}

// Namespace character_unlock_nikolai_fixup/character_unlock_nikolai_fixup
// Params 0, eflags: 0x1 linked
// Checksum 0x436e131b, Offset: 0x138
// Size: 0x102
function function_d95e620c() {
    var_bca69f36 = (isdefined(getgametypesetting(#"hash_50b1121aee76a7e4")) ? getgametypesetting(#"hash_50b1121aee76a7e4") : 0) && (isdefined(getgametypesetting(#"hash_2574d482086ec9d8")) ? getgametypesetting(#"hash_2574d482086ec9d8") : 0) && (isdefined(getgametypesetting(#"hash_3778ec3bd924f17c")) ? getgametypesetting(#"hash_3778ec3bd924f17c") : 0);
    return var_bca69f36;
}
