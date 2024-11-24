#using scripts\core_common\system_shared;
#using scripts\wz_common\character_unlock_fixup;

#namespace character_unlock_firebreak_fixup;

// Namespace character_unlock_firebreak_fixup/character_unlock_firebreak_fixup
// Params 0, eflags: 0x2
// Checksum 0xd49c31b6, Offset: 0x78
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_firebreak_fixup", &__init__, undefined, #"character_unlock_fixup");
}

// Namespace character_unlock_firebreak_fixup/character_unlock_firebreak_fixup
// Params 0, eflags: 0x0
// Checksum 0x82779e21, Offset: 0xc8
// Size: 0x64
function __init__() {
    character_unlock_fixup::register_character_unlock(#"firebreak_unlock", #"hash_8596bc069593313", #"cu06_item", &function_d95e620c, #"hash_48b3b84fe88578f2");
}

// Namespace character_unlock_firebreak_fixup/character_unlock_firebreak_fixup
// Params 0, eflags: 0x0
// Checksum 0xd2d3506b, Offset: 0x138
// Size: 0xb2
function function_d95e620c() {
    var_711ddc0f = (isdefined(getgametypesetting(#"hash_50b1121aee76a7e4")) ? getgametypesetting(#"hash_50b1121aee76a7e4") : 0) && (isdefined(getgametypesetting(#"hash_75370c9c920502fc")) ? getgametypesetting(#"hash_75370c9c920502fc") : 0);
    return var_711ddc0f;
}

