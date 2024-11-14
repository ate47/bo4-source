#using scripts\wz_common\character_unlock_fixup;
#using scripts\core_common\system_shared;

#namespace character_unlock_bruno_fixup;

// Namespace character_unlock_bruno_fixup/character_unlock_bruno_fixup
// Params 0, eflags: 0x2
// Checksum 0x940414b, Offset: 0x78
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_bruno_fixup", &__init__, undefined, #"character_unlock_fixup");
}

// Namespace character_unlock_bruno_fixup/character_unlock_bruno_fixup
// Params 0, eflags: 0x0
// Checksum 0xc5398f02, Offset: 0xc8
// Size: 0x64
function __init__() {
    character_unlock_fixup::register_character_unlock(#"bruno_unlock", #"hash_4815f130a1c1d840", #"cu11_item", &function_d95e620c, #"hash_21c5510d64c20b71");
}

// Namespace character_unlock_bruno_fixup/character_unlock_bruno_fixup
// Params 0, eflags: 0x0
// Checksum 0x946ed4ba, Offset: 0x138
// Size: 0xb2
function function_d95e620c() {
    var_808a2a47 = (isdefined(getgametypesetting(#"hash_50b1121aee76a7e4")) ? getgametypesetting(#"hash_50b1121aee76a7e4") : 0) && (isdefined(getgametypesetting(#"hash_2dfb36064be05f03")) ? getgametypesetting(#"hash_2dfb36064be05f03") : 0);
    return var_808a2a47;
}

