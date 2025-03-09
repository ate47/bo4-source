#using scripts\core_common\system_shared;
#using scripts\wz_common\character_unlock_fixup;

#namespace character_unlock_mason_fixup;

// Namespace character_unlock_mason_fixup/character_unlock_mason_fixup
// Params 0, eflags: 0x2
// Checksum 0xf80be4a1, Offset: 0x78
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_mason_fixup", &__init__, undefined, #"character_unlock_fixup");
}

// Namespace character_unlock_mason_fixup/character_unlock_mason_fixup
// Params 0, eflags: 0x0
// Checksum 0x122ec45f, Offset: 0xc8
// Size: 0x74
function __init__() {
    character_unlock_fixup::register_character_unlock(#"mason_unlock", #"prt_wz_mason", #"cu19_item", &function_d95e620c, #"hash_7334970069e5e147", #"hash_7334980069e5e2fa");
}

// Namespace character_unlock_mason_fixup/character_unlock_mason_fixup
// Params 0, eflags: 0x0
// Checksum 0xb5ba2b5f, Offset: 0x148
// Size: 0x152
function function_d95e620c() {
    var_2fcdec4f = (isdefined(getgametypesetting(#"hash_50b1121aee76a7e4")) ? getgametypesetting(#"hash_50b1121aee76a7e4") : 0) && (isdefined(getgametypesetting(#"hash_20f3ff8fbb8d8295")) ? getgametypesetting(#"hash_20f3ff8fbb8d8295") : 0) && (isdefined(getgametypesetting(#"hash_3778ec3bd924f17c")) ? getgametypesetting(#"hash_3778ec3bd924f17c") : 0) && (isdefined(getgametypesetting(#"hash_24e281e778894ac9")) ? getgametypesetting(#"hash_24e281e778894ac9") : 0);
    return var_2fcdec4f;
}

