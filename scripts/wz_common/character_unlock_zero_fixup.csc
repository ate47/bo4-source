#using scripts\core_common\system_shared;
#using scripts\wz_common\character_unlock_fixup;

#namespace character_unlock_zero_fixup;

// Namespace character_unlock_zero_fixup/character_unlock_zero_fixup
// Params 0, eflags: 0x2
// Checksum 0x10033272, Offset: 0x78
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"character_unlock_zero_fixup", &__init__, undefined, #"character_unlock_fixup" );
}

// Namespace character_unlock_zero_fixup/character_unlock_zero_fixup
// Params 0
// Checksum 0xfb9710cb, Offset: 0xc8
// Size: 0x64
function __init__()
{
    character_unlock_fixup::register_character_unlock( #"zero_unlock", #"hash_303d7717027a0f92", #"cu32_item", &function_d95e620c, #"hash_178b421c5b67b4d5" );
}

// Namespace character_unlock_zero_fixup/character_unlock_zero_fixup
// Params 0
// Checksum 0x68c0a311, Offset: 0x138
// Size: 0xb2
function function_d95e620c()
{
    var_a703ffba = ( isdefined( getgametypesetting( #"hash_50b1121aee76a7e4" ) ) ? getgametypesetting( #"hash_50b1121aee76a7e4" ) : 0 ) && ( isdefined( getgametypesetting( #"hash_19c58d35b2ea8d15" ) ) ? getgametypesetting( #"hash_19c58d35b2ea8d15" ) : 0 );
    return var_a703ffba;
}

