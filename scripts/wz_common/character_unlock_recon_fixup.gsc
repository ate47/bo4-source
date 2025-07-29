#using scripts\core_common\system_shared;
#using scripts\wz_common\character_unlock_fixup;

#namespace character_unlock_recon_fixup;

// Namespace character_unlock_recon_fixup/character_unlock_recon_fixup
// Params 0, eflags: 0x2
// Checksum 0xdb4595a, Offset: 0x78
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"character_unlock_recon_fixup", &__init__, undefined, #"character_unlock_fixup" );
}

// Namespace character_unlock_recon_fixup/character_unlock_recon_fixup
// Params 0
// Checksum 0x99a96b86, Offset: 0xc8
// Size: 0x74
function __init__()
{
    character_unlock_fixup::register_character_unlock( #"recon_unlock", #"hash_78c357c8a5680d67", #"cu04_item", &function_d95e620c, #"hash_91d5ea7b26a8aca", #"hash_91d5da7b26a8917" );
}

// Namespace character_unlock_recon_fixup/character_unlock_recon_fixup
// Params 0
// Checksum 0xffa6b12a, Offset: 0x148
// Size: 0xb2
function function_d95e620c()
{
    var_4bbd2b8a = ( isdefined( getgametypesetting( #"hash_50b1121aee76a7e4" ) ) ? getgametypesetting( #"hash_50b1121aee76a7e4" ) : 0 ) && ( isdefined( getgametypesetting( #"hash_34ea44c91776e52c" ) ) ? getgametypesetting( #"hash_34ea44c91776e52c" ) : 0 );
    return var_4bbd2b8a;
}

