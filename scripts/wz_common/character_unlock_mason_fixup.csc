// Atian COD Tools GSC decompiler test
#using scripts\wz_common\character_unlock_fixup.csc;
#using scripts\core_common\system_shared.csc;

#namespace character_unlock_mason_fixup;

// Namespace character_unlock_mason_fixup/character_unlock_mason_fixup
// Params 0, eflags: 0x2
// Checksum 0x102108bd, Offset: 0x78
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_mason_fixup", &__init__, undefined, #"character_unlock_fixup");
}

// Namespace character_unlock_mason_fixup/character_unlock_mason_fixup
// Params 0, eflags: 0x0
// Checksum 0x4ca7d546, Offset: 0xc8
// Size: 0x74
function __init__() {
    character_unlock_fixup::register_character_unlock(#"mason_unlock", #"hash_72350169be9133ae", #"cu19_item", &function_d95e620c, #"hash_7334970069e5e147", #"hash_7334980069e5e2fa");
}

// Namespace character_unlock_mason_fixup/character_unlock_mason_fixup
// Params 0, eflags: 0x0
// Checksum 0x1577602f, Offset: 0x148
// Size: 0x152
function function_d95e620c() {
    var_2fcdec4f = (isdefined(getgametypesetting(#"hash_50b1121aee76a7e4")) ? getgametypesetting(#"hash_50b1121aee76a7e4") : 0) && (isdefined(getgametypesetting(#"hash_20f3ff8fbb8d8295")) ? getgametypesetting(#"hash_20f3ff8fbb8d8295") : 0) && (isdefined(getgametypesetting(#"hash_3778ec3bd924f17c")) ? getgametypesetting(#"hash_3778ec3bd924f17c") : 0) && (isdefined(getgametypesetting(#"hash_24e281e778894ac9")) ? getgametypesetting(#"hash_24e281e778894ac9") : 0);
    return var_2fcdec4f;
}

