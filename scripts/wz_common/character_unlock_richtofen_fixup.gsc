// Atian COD Tools GSC decompiler test
#include scripts/wz_common/character_unlock_fixup.gsc;
#include scripts/core_common/system_shared.gsc;

#namespace character_unlock_richtofen_fixup;

// Namespace character_unlock_richtofen_fixup/character_unlock_richtofen_fixup
// Params 0, eflags: 0x2
// Checksum 0x3866fed4, Offset: 0x78
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_richtofen_fixup", &__init__, undefined, #"character_unlock_fixup");
}

// Namespace character_unlock_richtofen_fixup/character_unlock_richtofen_fixup
// Params 0, eflags: 0x1 linked
// Checksum 0x2a4fe290, Offset: 0xc8
// Size: 0x64
function __init__() {
    character_unlock_fixup::register_character_unlock(#"richtofen_unlock", #"hash_66b69b90a30bcc88", #"cu17_item", &function_d95e620c, #"hash_418312990213bc41");
}

// Namespace character_unlock_richtofen_fixup/character_unlock_richtofen_fixup
// Params 0, eflags: 0x1 linked
// Checksum 0x13297e92, Offset: 0x138
// Size: 0x102
function function_d95e620c() {
    var_5d6be844 = (isdefined(getgametypesetting(#"hash_50b1121aee76a7e4")) ? getgametypesetting(#"hash_50b1121aee76a7e4") : 0) && (isdefined(getgametypesetting(#"hash_19667f3338ed6b1f")) ? getgametypesetting(#"hash_19667f3338ed6b1f") : 0) && (isdefined(getgametypesetting(#"hash_3778ec3bd924f17c")) ? getgametypesetting(#"hash_3778ec3bd924f17c") : 0);
    return var_5d6be844;
}

