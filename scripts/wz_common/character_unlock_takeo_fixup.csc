#using scripts\core_common\system_shared;
#using scripts\wz_common\character_unlock_fixup;

#namespace character_unlock_takeo_fixup;

// Namespace character_unlock_takeo_fixup/character_unlock_takeo_fixup
// Params 0, eflags: 0x2
// Checksum 0x9b9a3b22, Offset: 0x78
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_takeo_fixup", &__init__, undefined, #"character_unlock_fixup");
}

// Namespace character_unlock_takeo_fixup/character_unlock_takeo_fixup
// Params 0, eflags: 0x0
// Checksum 0xcb4c477c, Offset: 0xc8
// Size: 0x74
function __init__() {
    character_unlock_fixup::register_character_unlock(#"takeo_unlock", #"hash_36157750ed7c6584", #"cu18_item", &function_d95e620c, #"hash_56b5eb94fb75cbed", #"hash_56b5e894fb75c6d4");
}

// Namespace character_unlock_takeo_fixup/character_unlock_takeo_fixup
// Params 0, eflags: 0x0
// Checksum 0x2e263523, Offset: 0x148
// Size: 0x102
function function_d95e620c() {
    var_913db062 = (isdefined(getgametypesetting(#"hash_50b1121aee76a7e4")) ? getgametypesetting(#"hash_50b1121aee76a7e4") : 0) && (isdefined(getgametypesetting(#"hash_26186b4e5dc9bb6f")) ? getgametypesetting(#"hash_26186b4e5dc9bb6f") : 0) && (isdefined(getgametypesetting(#"hash_3778ec3bd924f17c")) ? getgametypesetting(#"hash_3778ec3bd924f17c") : 0);
    return var_913db062;
}

