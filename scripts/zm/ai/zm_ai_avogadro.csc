// Atian COD Tools GSC decompiler test
#include scripts/core_common/ai/systems/fx_character.csc;
#include scripts/core_common/system_shared.csc;
#include scripts/core_common/clientfield_shared.csc;
#include scripts/core_common/ai_shared.csc;

#namespace zm_ai_avogadro;

// Namespace zm_ai_avogadro/zm_ai_avogadro
// Params 0, eflags: 0x2
// Checksum 0x3d64d8a, Offset: 0x88
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_ai_avogadro", &__init__, undefined, undefined);
}

// Namespace zm_ai_avogadro/zm_ai_avogadro
// Params 0, eflags: 0x1 linked
// Checksum 0xc7b010fd, Offset: 0xd0
// Size: 0x34
function __init__() {
    ai::add_archetype_spawn_function(#"avogadro", &function_1caf705e);
}

// Namespace zm_ai_avogadro/zm_ai_avogadro
// Params 1, eflags: 0x5 linked
// Checksum 0x66671a8a, Offset: 0x110
// Size: 0xc
function private function_1caf705e(localclientnum) {
    
}

