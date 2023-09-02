// Atian COD Tools GSC decompiler test
#using scripts\wz_common\character_unlock_fixup.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace character_unlock_reaper_fixup;

// Namespace character_unlock_reaper_fixup/character_unlock_reaper_fixup
// Params 0, eflags: 0x2
// Checksum 0xce5e9aa3, Offset: 0x78
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_reaper_fixup", &__init__, undefined, #"character_unlock_fixup");
}

// Namespace character_unlock_reaper_fixup/character_unlock_reaper_fixup
// Params 0, eflags: 0x1 linked
// Checksum 0xa7481883, Offset: 0xc8
// Size: 0x74
function __init__() {
    character_unlock_fixup::register_character_unlock(#"reaper_unlock", #"hash_76cce42bfc9866cd", #"cu35_item", &function_d95e620c, #"hash_555c37b28c4a770c", #"hash_555c3ab28c4a7c25");
}

// Namespace character_unlock_reaper_fixup/character_unlock_reaper_fixup
// Params 0, eflags: 0x1 linked
// Checksum 0x35dbc53e, Offset: 0x148
// Size: 0xb2
function function_d95e620c() {
    var_17805812 = (isdefined(getgametypesetting(#"hash_50b1121aee76a7e4")) ? getgametypesetting(#"hash_50b1121aee76a7e4") : 0) && (isdefined(getgametypesetting(#"hash_6b1ec01fa78af670")) ? getgametypesetting(#"hash_6b1ec01fa78af670") : 0);
    return var_17805812;
}

