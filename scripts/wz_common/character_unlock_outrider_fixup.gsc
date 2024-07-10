#using scripts\wz_common\character_unlock_fixup.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace character_unlock_outrider_fixup;

// Namespace character_unlock_outrider_fixup/character_unlock_outrider_fixup
// Params 0, eflags: 0x2
// Checksum 0x69514cba, Offset: 0x78
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_outrider_fixup", &__init__, undefined, #"character_unlock_fixup");
}

// Namespace character_unlock_outrider_fixup/character_unlock_outrider_fixup
// Params 0, eflags: 0x0
// Checksum 0xdf61fbc4, Offset: 0xc8
// Size: 0x64
function __init__() {
    character_unlock_fixup::register_character_unlock(#"outrider_unlock", #"hash_1dc888eecacf65d4", #"cu33_item", &function_d95e620c, #"hash_28966e441535b733");
}

// Namespace character_unlock_outrider_fixup/character_unlock_outrider_fixup
// Params 0, eflags: 0x0
// Checksum 0x58ec00e3, Offset: 0x138
// Size: 0xb2
function function_d95e620c() {
    var_f8bc8610 = (isdefined(getgametypesetting(#"hash_50b1121aee76a7e4")) ? getgametypesetting(#"hash_50b1121aee76a7e4") : 0) && (isdefined(getgametypesetting(#"hash_52d705a46da9e55f")) ? getgametypesetting(#"hash_52d705a46da9e55f") : 0);
    return var_f8bc8610;
}

