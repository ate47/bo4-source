#using scripts\wz_common\character_unlock_fixup;
#using scripts\core_common\system_shared;

#namespace character_unlock_menendez_fixup;

// Namespace character_unlock_menendez_fixup/character_unlock_menendez_fixup
// Params 0, eflags: 0x2
// Checksum 0x5a98430b, Offset: 0x78
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_menendez_fixup", &__init__, undefined, #"character_unlock_fixup");
}

// Namespace character_unlock_menendez_fixup/character_unlock_menendez_fixup
// Params 0, eflags: 0x0
// Checksum 0x10cf8d28, Offset: 0xc8
// Size: 0x64
function __init__() {
    character_unlock_fixup::register_character_unlock(#"menendez_unlock", #"hash_77118b5dbb73e0b6", #"cu20_item", &function_d95e620c, #"hash_4bc3134998048aa7");
}

// Namespace character_unlock_menendez_fixup/character_unlock_menendez_fixup
// Params 0, eflags: 0x0
// Checksum 0x2ebbdffe, Offset: 0x138
// Size: 0xb2
function function_d95e620c() {
    var_e9462a7e = (isdefined(getgametypesetting(#"hash_50b1121aee76a7e4")) ? getgametypesetting(#"hash_50b1121aee76a7e4") : 0) && (isdefined(getgametypesetting(#"hash_1d50c09e8021ab1")) ? getgametypesetting(#"hash_1d50c09e8021ab1") : 0);
    return var_e9462a7e;
}

