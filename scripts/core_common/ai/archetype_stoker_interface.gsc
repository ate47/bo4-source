#using scripts\core_common\ai\archetype_stoker;
#using scripts\core_common\ai\systems\ai_interface;

#namespace stokerinterface;

// Namespace stokerinterface/archetype_stoker_interface
// Params 0
// Checksum 0x99c5edd9, Offset: 0x88
// Size: 0x6c
function registerstokerinterfaceattributes()
{
    ai::registermatchedinterface( #"stoker", #"gravity", "normal", array( "low", "normal" ), &archetype_stoker::function_e4ef4e27 );
}

