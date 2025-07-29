#using scripts\core_common\ai\systems\fx_character;
#using scripts\core_common\ai_shared;
#using scripts\core_common\system_shared;

#namespace archetype_blight_father;

// Namespace archetype_blight_father/archetype_blight_father
// Params 0, eflags: 0x2
// Checksum 0x90544acc, Offset: 0x90
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"blight_father", &__init__, undefined, undefined );
}

// Namespace archetype_blight_father/archetype_blight_father
// Params 0, eflags: 0x2
// Checksum 0xd566d73b, Offset: 0xd8
// Size: 0x34
function autoexec precache()
{
    ai::add_archetype_spawn_function( #"blight_father", &function_859ccb1e );
}

// Namespace archetype_blight_father/archetype_blight_father
// Params 0
// Checksum 0x80f724d1, Offset: 0x118
// Size: 0x4
function __init__()
{
    
}

// Namespace archetype_blight_father/archetype_blight_father
// Params 1, eflags: 0x4
// Checksum 0xf66a1535, Offset: 0x128
// Size: 0x5c
function private function_859ccb1e( localclientnum )
{
    fxclientutils::playfxbundle( localclientnum, self, self.fxdef );
    self mapshaderconstant( localclientnum, 0, "scriptVector2", 1, 0, 0, 1 );
}

