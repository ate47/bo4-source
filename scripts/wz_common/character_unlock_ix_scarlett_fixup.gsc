#using scripts\core_common\system_shared;
#using scripts\wz_common\character_unlock_fixup;

#namespace character_unlock_ix_scarlett_fixup;

// Namespace character_unlock_ix_scarlett_fixup/character_unlock_ix_scarlett_fixup
// Params 0, eflags: 0x2
// Checksum 0x166e5636, Offset: 0x78
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_ix_scarlett_fixup", &__init__, undefined, #"character_unlock_fixup");
}

// Namespace character_unlock_ix_scarlett_fixup/character_unlock_ix_scarlett_fixup
// Params 0, eflags: 0x0
// Checksum 0x75091b7b, Offset: 0xc8
// Size: 0x64
function __init__() {
    character_unlock_fixup::register_character_unlock(#"ix_scarlett_unlock", #"prt_wz_scarlett_dlc0", #"cu30_item", &function_d95e620c, #"hash_74fceff1a255277d");
}

// Namespace character_unlock_ix_scarlett_fixup/character_unlock_ix_scarlett_fixup
// Params 0, eflags: 0x0
// Checksum 0xad241814, Offset: 0x138
// Size: 0xb2
function function_d95e620c() {
    var_d0df1180 = (isdefined(getgametypesetting(#"hash_50b1121aee76a7e4")) ? getgametypesetting(#"hash_50b1121aee76a7e4") : 0) && (isdefined(getgametypesetting(#"hash_2b0f9caa00363ee8")) ? getgametypesetting(#"hash_2b0f9caa00363ee8") : 0);
    return var_d0df1180;
}

