// Atian COD Tools GSC decompiler test
#using scripts\wz_common\character_unlock_fixup.csc;
#using scripts\core_common\system_shared.csc;

#namespace character_unlock_ajax_fixup;

// Namespace character_unlock_ajax_fixup/character_unlock_ajax_fixup
// Params 0, eflags: 0x2
// Checksum 0xc871053b, Offset: 0x78
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_ajax_fixup", &__init__, undefined, #"character_unlock_fixup");
}

// Namespace character_unlock_ajax_fixup/character_unlock_ajax_fixup
// Params 0, eflags: 0x0
// Checksum 0xe519aaba, Offset: 0xc8
// Size: 0x64
function __init__() {
    character_unlock_fixup::register_character_unlock(#"ajax_unlock", #"hash_69bbe1ec48f79df5", #"cu01_item", &function_d95e620c, #"hash_6e5a10ffa958d875");
}

// Namespace character_unlock_ajax_fixup/character_unlock_ajax_fixup
// Params 0, eflags: 0x0
// Checksum 0xb02b0be0, Offset: 0x138
// Size: 0xb2
function function_d95e620c() {
    var_db4d099d = (isdefined(getgametypesetting(#"hash_50b1121aee76a7e4")) ? getgametypesetting(#"hash_50b1121aee76a7e4") : 0) && (isdefined(getgametypesetting(#"hash_d084b5063bb0c55")) ? getgametypesetting(#"hash_d084b5063bb0c55") : 0);
    return var_db4d099d;
}

