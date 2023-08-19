// Atian COD Tools GSC decompiler test
#include scripts/wz_common/character_unlock_fixup.csc;
#include scripts/core_common/system_shared.csc;

#namespace character_unlock_torque_fixup;

// Namespace character_unlock_torque_fixup/character_unlock_torque_fixup
// Params 0, eflags: 0x2
// Checksum 0x528290d8, Offset: 0x78
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_torque_fixup", &__init__, undefined, #"character_unlock_fixup");
}

// Namespace character_unlock_torque_fixup/character_unlock_torque_fixup
// Params 0, eflags: 0x1 linked
// Checksum 0x44e49629, Offset: 0xc8
// Size: 0x84
function __init__() {
    character_unlock_fixup::register_character_unlock(#"torque_unlock", #"hash_6999516e5e35a515", #"cu02_item", &function_d95e620c, #"hash_a9ec4883fd0293d", #"hash_3843c83850f09a08", #"hash_b47463756c6a60f");
}

// Namespace character_unlock_torque_fixup/character_unlock_torque_fixup
// Params 0, eflags: 0x1 linked
// Checksum 0x3fde8768, Offset: 0x158
// Size: 0xb2
function function_d95e620c() {
    var_fb9571a = (isdefined(getgametypesetting(#"hash_50b1121aee76a7e4")) ? getgametypesetting(#"hash_50b1121aee76a7e4") : 0) && (isdefined(getgametypesetting(#"hash_3d719d86f2f3f14d")) ? getgametypesetting(#"hash_3d719d86f2f3f14d") : 0);
    return var_fb9571a;
}

