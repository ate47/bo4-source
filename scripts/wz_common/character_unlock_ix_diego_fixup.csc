#using scripts\core_common\system_shared;
#using scripts\wz_common\character_unlock_fixup;

#namespace character_unlock_ix_diego_fixup;

// Namespace character_unlock_ix_diego_fixup/character_unlock_ix_diego_fixup
// Params 0, eflags: 0x2
// Checksum 0xd2f8f29b, Offset: 0x78
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"character_unlock_ix_diego_fixup", &__init__, undefined, #"character_unlock_fixup" );
}

// Namespace character_unlock_ix_diego_fixup/character_unlock_ix_diego_fixup
// Params 0
// Checksum 0xcae09206, Offset: 0xc8
// Size: 0x64
function __init__()
{
    character_unlock_fixup::register_character_unlock( #"ix_diego_unlock", #"hash_75365263415c16f2", #"cu29_item", &function_d95e620c, #"hash_374df23cda9c79ed" );
}

// Namespace character_unlock_ix_diego_fixup/character_unlock_ix_diego_fixup
// Params 0
// Checksum 0x22d6a816, Offset: 0x138
// Size: 0xb2
function function_d95e620c()
{
    var_fb6c1efd = ( isdefined( getgametypesetting( #"hash_50b1121aee76a7e4" ) ) ? getgametypesetting( #"hash_50b1121aee76a7e4" ) : 0 ) && ( isdefined( getgametypesetting( #"hash_ff653cbb1438270" ) ) ? getgametypesetting( #"hash_ff653cbb1438270" ) : 0 );
    return var_fb6c1efd;
}

