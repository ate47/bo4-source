#using scripts\wz_common\character_unlock_fixup;
#using scripts\core_common\system_shared;

#namespace character_unlock_dempsey_fixup;

// Namespace character_unlock_dempsey_fixup/character_unlock_dempsey_fixup
// Params 0, eflags: 0x2
// Checksum 0xa3c17a3b, Offset: 0x78
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_dempsey_fixup", &__init__, undefined, #"character_unlock_fixup");
}

// Namespace character_unlock_dempsey_fixup/character_unlock_dempsey_fixup
// Params 0, eflags: 0x0
// Checksum 0x7f4b0b12, Offset: 0xc8
// Size: 0x64
function __init__() {
    character_unlock_fixup::register_character_unlock(#"dempsey_unlock", #"hash_23d5f8566508f9f5", #"cu15_item", &function_d95e620c, #"hash_557b228047615fb0");
}

// Namespace character_unlock_dempsey_fixup/character_unlock_dempsey_fixup
// Params 0, eflags: 0x0
// Checksum 0xc93f688c, Offset: 0x138
// Size: 0xb2
function function_d95e620c() {
    var_182a6f93 = (isdefined(getgametypesetting(#"hash_50b1121aee76a7e4")) ? getgametypesetting(#"hash_50b1121aee76a7e4") : 0) && (isdefined(getgametypesetting(#"hash_1d4c395693ce04fe")) ? getgametypesetting(#"hash_1d4c395693ce04fe") : 0);
    return var_182a6f93;
}

