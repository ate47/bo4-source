#using scripts\core_common\system_shared;
#using scripts\wz_common\character_unlock_fixup;

#namespace character_unlock_ajax_fixup;

// Namespace character_unlock_ajax_fixup/character_unlock_ajax_fixup
// Params 0, eflags: 0x2
// Checksum 0xdc777ba3, Offset: 0x78
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"character_unlock_ajax_fixup", &__init__, undefined, #"character_unlock_fixup" );
}

// Namespace character_unlock_ajax_fixup/character_unlock_ajax_fixup
// Params 0
// Checksum 0x3b1ad64f, Offset: 0xc8
// Size: 0x64
function __init__()
{
    character_unlock_fixup::register_character_unlock( #"ajax_unlock", #"hash_69bbe1ec48f79df5", #"cu01_item", &function_d95e620c, #"hash_6e5a10ffa958d875" );
}

// Namespace character_unlock_ajax_fixup/character_unlock_ajax_fixup
// Params 0
// Checksum 0xfc0284c0, Offset: 0x138
// Size: 0xb2
function function_d95e620c()
{
    var_db4d099d = ( isdefined( getgametypesetting( #"hash_50b1121aee76a7e4" ) ) ? getgametypesetting( #"hash_50b1121aee76a7e4" ) : 0 ) && ( isdefined( getgametypesetting( #"hash_d084b5063bb0c55" ) ) ? getgametypesetting( #"hash_d084b5063bb0c55" ) : 0 );
    return var_db4d099d;
}

