#using scripts\core_common\ai\archetype_blight_father;
#using scripts\core_common\ai\systems\ai_interface;

#namespace blightfatherinterface;

// Namespace blightfatherinterface/archetype_blight_father_interface
// Params 0
// Checksum 0x73bf06e8, Offset: 0x88
// Size: 0x10c
function registerblightfatherinterfaceattributes()
{
    ai::registermatchedinterface( #"blight_father", #"tongue_grab_enabled", 1, array( 1, 0 ) );
    ai::registermatchedinterface( #"blight_father", #"lockdown_enabled", 1, array( 1, 0 ), &archetypeblightfather::function_b95978a7 );
    ai::registermatchedinterface( #"blight_father", #"gravity", "normal", array( "low", "normal" ), &archetypeblightfather::function_3e8300e9 );
}

