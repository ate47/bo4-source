// Atian COD Tools GSC decompiler test
#include scripts/wz_common/character_unlock_fixup.gsc;
#include scripts/core_common/system_shared.gsc;

#namespace character_unlock_nomad_fixup;

// Namespace character_unlock_nomad_fixup/character_unlock_nomad_fixup
// Params 0, eflags: 0x2
// Checksum 0x1cda3c4, Offset: 0x78
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_nomad_fixup", &__init__, undefined, #"character_unlock_fixup");
}

// Namespace character_unlock_nomad_fixup/character_unlock_nomad_fixup
// Params 0, eflags: 0x1 linked
// Checksum 0x2e4e9dd2, Offset: 0xc8
// Size: 0x64
function __init__() {
    character_unlock_fixup::register_character_unlock(#"nomad_unlock", #"hash_4b77f84c47802222", #"cu07_item", &function_d95e620c, #"hash_7eb32c4c67ae13fe");
}

// Namespace character_unlock_nomad_fixup/character_unlock_nomad_fixup
// Params 0, eflags: 0x1 linked
// Checksum 0xf8ddc001, Offset: 0x138
// Size: 0xb2
function function_d95e620c() {
    var_1ff787de = (isdefined(getgametypesetting(#"hash_50b1121aee76a7e4")) ? getgametypesetting(#"hash_50b1121aee76a7e4") : 0) && (isdefined(getgametypesetting(#"hash_26843909f5fdef20")) ? getgametypesetting(#"hash_26843909f5fdef20") : 0);
    return var_1ff787de;
}

