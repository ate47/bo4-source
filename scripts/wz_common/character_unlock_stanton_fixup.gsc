#using scripts\wz_common\character_unlock_fixup.gsc;
#using scripts\mp_common\item_world_fixup.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace character_unlock_stanton_fixup;

// Namespace character_unlock_stanton_fixup/character_unlock_stanton_fixup
// Params 0, eflags: 0x2
// Checksum 0x7f84c6f1, Offset: 0x80
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_stanton_fixup", &__init__, undefined, #"character_unlock_fixup");
}

// Namespace character_unlock_stanton_fixup/character_unlock_stanton_fixup
// Params 0, eflags: 0x0
// Checksum 0xe06f66f8, Offset: 0xd0
// Size: 0x64
function __init__() {
    character_unlock_fixup::register_character_unlock(#"stanton_unlock", #"hash_4f0c567012b33fd9", #"cu14_item", &function_d95e620c, #"hash_5495584ec5e9f348");
}

// Namespace character_unlock_stanton_fixup/character_unlock_stanton_fixup
// Params 0, eflags: 0x0
// Checksum 0xcab99194, Offset: 0x140
// Size: 0xb2
function function_d95e620c() {
    var_8d597b54 = (isdefined(getgametypesetting(#"hash_50b1121aee76a7e4")) ? getgametypesetting(#"hash_50b1121aee76a7e4") : 0) && (isdefined(getgametypesetting(#"hash_5ea56d63c68b4396")) ? getgametypesetting(#"hash_5ea56d63c68b4396") : 0);
    return var_8d597b54;
}

