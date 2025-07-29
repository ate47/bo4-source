#using scripts\core_common\ai_shared;
#using scripts\core_common\system_shared;

#namespace zm_ai_utility;

// Namespace zm_ai_utility/zm_ai_utility
// Params 0, eflags: 0x2
// Checksum 0x2375df0, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zm_ai_utility", &__init__, undefined, undefined );
}

// Namespace zm_ai_utility/zm_ai_utility
// Params 0, eflags: 0x4
// Checksum 0x377dcecc, Offset: 0xc0
// Size: 0x24
function private __init__()
{
    ai::add_ai_spawn_function( &function_f3a051c6 );
}

// Namespace zm_ai_utility/zm_ai_utility
// Params 1, eflags: 0x4
// Checksum 0xfcbdab69, Offset: 0xf0
// Size: 0xc
function private function_f3a051c6( localclientnum )
{
    
}

