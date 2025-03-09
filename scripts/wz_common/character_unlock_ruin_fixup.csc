#using scripts\core_common\system_shared;
#using scripts\wz_common\character_unlock_fixup;

#namespace character_unlock_ruin_fixup;

// Namespace character_unlock_ruin_fixup/character_unlock_ruin_fixup
// Params 0, eflags: 0x2
// Checksum 0xdd9fd18f, Offset: 0x78
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_ruin_fixup", &__init__, undefined, #"character_unlock_fixup");
}

// Namespace character_unlock_ruin_fixup/character_unlock_ruin_fixup
// Params 0, eflags: 0x0
// Checksum 0x2ac85516, Offset: 0xc8
// Size: 0x64
function __init__() {
    character_unlock_fixup::register_character_unlock(#"ruin_unlock", #"prt_wz_mercenary", #"cu08_item", &function_d95e620c, #"hash_4e9ba934add76371");
}

// Namespace character_unlock_ruin_fixup/character_unlock_ruin_fixup
// Params 0, eflags: 0x0
// Checksum 0xe682f980, Offset: 0x138
// Size: 0xb2
function function_d95e620c() {
    var_e2bea9cf = (isdefined(getgametypesetting(#"hash_50b1121aee76a7e4")) ? getgametypesetting(#"hash_50b1121aee76a7e4") : 0) && (isdefined(getgametypesetting(#"hash_4f0a6d1e98cdbf81")) ? getgametypesetting(#"hash_4f0a6d1e98cdbf81") : 0);
    return var_e2bea9cf;
}

