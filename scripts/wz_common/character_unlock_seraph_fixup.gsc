#using scripts\core_common\system_shared;
#using scripts\mp_common\item_world_fixup;
#using scripts\wz_common\character_unlock_fixup;

#namespace character_unlock_seraph_fixup;

// Namespace character_unlock_seraph_fixup/character_unlock_seraph_fixup
// Params 0, eflags: 0x2
// Checksum 0x60495be2, Offset: 0x80
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"character_unlock_seraph_fixup", &__init__, undefined, #"character_unlock_fixup" );
}

// Namespace character_unlock_seraph_fixup/character_unlock_seraph_fixup
// Params 0, eflags: 0x2
// Checksum 0x7d80cc4e, Offset: 0xd0
// Size: 0x1c
function autoexec function_f031a77f()
{
    waitframe( 1 );
    function_f5a58e15();
}

// Namespace character_unlock_seraph_fixup/character_unlock_seraph_fixup
// Params 0
// Checksum 0xe221e5a3, Offset: 0xf8
// Size: 0x74
function __init__()
{
    character_unlock_fixup::register_character_unlock( #"seraph_unlock", #"hash_17c02481305f0e24", #"annihilator_wz_item", &function_d95e620c, #"hash_633d185cd2140f1a", #"hash_633d175cd2140d67" );
}

// Namespace character_unlock_seraph_fixup/character_unlock_seraph_fixup
// Params 0
// Checksum 0xfeb83a64, Offset: 0x178
// Size: 0x152
function function_d95e620c()
{
    var_e02cd092 = ( isdefined( getgametypesetting( #"hash_50b1121aee76a7e4" ) ) ? getgametypesetting( #"hash_50b1121aee76a7e4" ) : 0 ) && ( isdefined( getgametypesetting( #"hash_183bcc0f6737224a" ) ) ? getgametypesetting( #"hash_183bcc0f6737224a" ) : 0 ) && ( isdefined( getgametypesetting( #"hash_3778ec3bd924f17c" ) ) ? getgametypesetting( #"hash_3778ec3bd924f17c" ) : 0 ) && ( isdefined( getgametypesetting( #"hash_4a035e3775089f40" ) ) ? getgametypesetting( #"hash_4a035e3775089f40" ) : 0 );
    return var_e02cd092;
}

// Namespace character_unlock_seraph_fixup/character_unlock_seraph_fixup
// Params 0, eflags: 0x4
// Checksum 0xeeec17c2, Offset: 0x2d8
// Size: 0x54
function private function_f5a58e15()
{
    itementry = getscriptbundle( #"annihilator_wz_item" );
    
    if ( isdefined( itementry ) )
    {
        item_world_fixup::function_96ff7b88( #"annihilator_wz_item" );
    }
}

