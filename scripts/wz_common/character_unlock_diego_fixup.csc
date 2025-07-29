#using scripts\core_common\system_shared;
#using scripts\wz_common\character_unlock_fixup;

#namespace character_unlock_diego_fixup;

// Namespace character_unlock_diego_fixup/character_unlock_diego_fixup
// Params 0, eflags: 0x2
// Checksum 0xd4532244, Offset: 0x78
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"character_unlock_diego_fixup", &__init__, undefined, #"character_unlock_fixup" );
}

// Namespace character_unlock_diego_fixup/character_unlock_diego_fixup
// Params 0
// Checksum 0x11a58de5, Offset: 0xc8
// Size: 0x64
function __init__()
{
    character_unlock_fixup::register_character_unlock( #"diego_unlock", #"hash_7fc15da2c5864d3c", #"cu12_item", &function_d95e620c, #"hash_7d0b41a17f2e9a9" );
}

// Namespace character_unlock_diego_fixup/character_unlock_diego_fixup
// Params 0
// Checksum 0x72ffaf4b, Offset: 0x138
// Size: 0xb2
function function_d95e620c()
{
    var_32ce41fd = ( isdefined( getgametypesetting( #"hash_50b1121aee76a7e4" ) ) ? getgametypesetting( #"hash_50b1121aee76a7e4" ) : 0 ) && ( isdefined( getgametypesetting( #"hash_7fc2867a4b8594bf" ) ) ? getgametypesetting( #"hash_7fc2867a4b8594bf" ) : 0 );
    return var_32ce41fd;
}

