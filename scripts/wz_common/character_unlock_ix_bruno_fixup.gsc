#using scripts\wz_common\character_unlock_fixup;
#using scripts\core_common\system_shared;

#namespace character_unlock_ix_bruno_fixup;

// Namespace character_unlock_ix_bruno_fixup/character_unlock_ix_bruno_fixup
// Params 0, eflags: 0x2
// Checksum 0x45eef792, Offset: 0x78
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_ix_bruno_fixup", &__init__, undefined, #"character_unlock_fixup");
}

// Namespace character_unlock_ix_bruno_fixup/character_unlock_ix_bruno_fixup
// Params 0, eflags: 0x0
// Checksum 0x388594c6, Offset: 0xc8
// Size: 0x64
function __init__() {
    character_unlock_fixup::register_character_unlock(#"ix_bruno_unlock", #"hash_677a722d85cbd06", #"cu28_item", &function_d95e620c, #"hash_1493c49bbdfb17ad");
}

// Namespace character_unlock_ix_bruno_fixup/character_unlock_ix_bruno_fixup
// Params 0, eflags: 0x0
// Checksum 0x36458ade, Offset: 0x138
// Size: 0xb2
function function_d95e620c() {
    var_bda4e460 = (isdefined(getgametypesetting(#"hash_50b1121aee76a7e4")) ? getgametypesetting(#"hash_50b1121aee76a7e4") : 0) && (isdefined(getgametypesetting(#"hash_4547b7ecb49469f0")) ? getgametypesetting(#"hash_4547b7ecb49469f0") : 0);
    return var_bda4e460;
}

