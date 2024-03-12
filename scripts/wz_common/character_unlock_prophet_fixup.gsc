// Atian COD Tools GSC decompiler test
#using scripts\wz_common\character_unlock_fixup.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace character_unlock_prophet_fixup;

// Namespace character_unlock_prophet_fixup/character_unlock_prophet_fixup
// Params 0, eflags: 0x2
// Checksum 0x30c0325f, Offset: 0x78
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_prophet_fixup", &__init__, undefined, #"character_unlock_fixup");
}

// Namespace character_unlock_prophet_fixup/character_unlock_prophet_fixup
// Params 0, eflags: 0x0
// Checksum 0x4cb5fd44, Offset: 0xc8
// Size: 0x74
function __init__() {
    character_unlock_fixup::register_character_unlock(#"prophet_unlock", #"hash_62361c68e083d401", #"cu10_item", &function_d95e620c, #"hash_63b7bd67a959fc47", #"hash_63b7be67a959fdfa");
}

// Namespace character_unlock_prophet_fixup/character_unlock_prophet_fixup
// Params 0, eflags: 0x0
// Checksum 0x33a31fbe, Offset: 0x148
// Size: 0xb2
function function_d95e620c() {
    var_53490e75 = (isdefined(getgametypesetting(#"hash_50b1121aee76a7e4")) ? getgametypesetting(#"hash_50b1121aee76a7e4") : 0) && (isdefined(getgametypesetting(#"hash_7cf82cc41c0f0d5")) ? getgametypesetting(#"hash_7cf82cc41c0f0d5") : 0);
    return var_53490e75;
}

