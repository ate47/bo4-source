#using scripts\wz_common\character_unlock_fixup.csc;
#using scripts\core_common\system_shared.csc;

#namespace character_unlock_scarlett_fixup;

// Namespace character_unlock_scarlett_fixup/character_unlock_scarlett_fixup
// Params 0, eflags: 0x2
// Checksum 0x5bc42554, Offset: 0x78
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_scarlett_fixup", &__init__, undefined, #"character_unlock_fixup");
}

// Namespace character_unlock_scarlett_fixup/character_unlock_scarlett_fixup
// Params 0, eflags: 0x0
// Checksum 0x9df602cb, Offset: 0xc8
// Size: 0x64
function __init__() {
    character_unlock_fixup::register_character_unlock(#"scarlett_unlock", #"hash_6f105a897d64112", #"cu13_item", &function_d95e620c, #"hash_698918780b4406f1");
}

// Namespace character_unlock_scarlett_fixup/character_unlock_scarlett_fixup
// Params 0, eflags: 0x0
// Checksum 0xe40b51ab, Offset: 0x138
// Size: 0xb2
function function_d95e620c() {
    var_9a07aee8 = (isdefined(getgametypesetting(#"hash_50b1121aee76a7e4")) ? getgametypesetting(#"hash_50b1121aee76a7e4") : 0) && (isdefined(getgametypesetting(#"hash_7049c01d7ddf9b35")) ? getgametypesetting(#"hash_7049c01d7ddf9b35") : 0);
    return var_9a07aee8;
}

