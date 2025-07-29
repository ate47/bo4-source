#using scripts\core_common\ai\systems\ai_interface;
#using scripts\zm\archetype\archetype_zod_companion;

#namespace zodcompanioninterface;

// Namespace zodcompanioninterface/archetype_zod_companion_interface
// Params 0
// Checksum 0xe3a4e9bf, Offset: 0x78
// Size: 0x4c
function registerzodcompanioninterfaceattributes()
{
    ai::registermatchedinterface( #"zod_companion", #"sprint", 0, array( 1, 0 ) );
}

