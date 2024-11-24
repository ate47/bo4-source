#using scripts\core_common\ai\systems\fx_character;
#using scripts\core_common\ai_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;

#namespace wz_ai_avogadro;

// Namespace wz_ai_avogadro/wz_ai_avogadro
// Params 0, eflags: 0x2
// Checksum 0xcafd8a41, Offset: 0x90
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"wz_ai_avogadro", &__init__, undefined, undefined);
}

// Namespace wz_ai_avogadro/wz_ai_avogadro
// Params 0, eflags: 0x1 linked
// Checksum 0x2d6c20a2, Offset: 0xd8
// Size: 0x34
function __init__() {
    ai::add_archetype_spawn_function(#"avogadro", &function_1caf705e);
}

// Namespace wz_ai_avogadro/wz_ai_avogadro
// Params 1, eflags: 0x5 linked
// Checksum 0x228b01e3, Offset: 0x118
// Size: 0xc
function private function_1caf705e(localclientnum) {
    
}

