#using scripts\core_common\system_shared;
#using scripts\wz_common\character_unlock_fixup;

#namespace character_unlock_ix_stanton_fixup;

// Namespace character_unlock_ix_stanton_fixup/character_unlock_ix_stanton_fixup
// Params 0, eflags: 0x2
// Checksum 0xf699f36d, Offset: 0x78
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"character_unlock_ix_stanton_fixup", &__init__, undefined, #"character_unlock_fixup" );
}

// Namespace character_unlock_ix_stanton_fixup/character_unlock_ix_stanton_fixup
// Params 0
// Checksum 0x51efcdae, Offset: 0xc8
// Size: 0x74
function __init__()
{
    character_unlock_fixup::register_character_unlock( #"ix_stanton_unlock", #"hash_8bb7d93747987a1", #"cu31_item", &function_d95e620c, #"hash_9eef158b72b6ff4", #"hash_9eef458b72b750d" );
}

// Namespace character_unlock_ix_stanton_fixup/character_unlock_ix_stanton_fixup
// Params 0
// Checksum 0x11ec2d43, Offset: 0x148
// Size: 0xb2
function function_d95e620c()
{
    var_a6df6d8d = ( isdefined( getgametypesetting( #"hash_50b1121aee76a7e4" ) ) ? getgametypesetting( #"hash_50b1121aee76a7e4" ) : 0 ) && ( isdefined( getgametypesetting( #"hash_1ec2d38a40e97c55" ) ) ? getgametypesetting( #"hash_1ec2d38a40e97c55" ) : 0 );
    return var_a6df6d8d;
}

