#using scripts\core_common\system_shared;
#using scripts\core_common\ai_shared;

#namespace archetype_catalyst;

// Namespace archetype_catalyst/archetype_catalyst
// Params 0, eflags: 0x2
// Checksum 0x266e17b6, Offset: 0x88
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"catalyst", &__init__, undefined, undefined);
}

// Namespace archetype_catalyst/archetype_catalyst
// Params 0, eflags: 0x2
// Checksum 0x80f724d1, Offset: 0xd0
// Size: 0x4
function autoexec precache() {
    
}

// Namespace archetype_catalyst/archetype_catalyst
// Params 0, eflags: 0x1 linked
// Checksum 0x6da9f62, Offset: 0xe0
// Size: 0x34
function __init__() {
    ai::add_archetype_spawn_function(#"catalyst", &function_5608540a);
}

// Namespace archetype_catalyst/archetype_catalyst
// Params 1, eflags: 0x5 linked
// Checksum 0x25b5b0b, Offset: 0x120
// Size: 0x3c
function private function_5608540a(localclientnum) {
    self mapshaderconstant(localclientnum, 0, "scriptVector2", 1, 0, 0, 1);
}

