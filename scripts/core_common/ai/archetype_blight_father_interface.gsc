// Atian COD Tools GSC decompiler test
#include scripts/core_common/ai/archetype_blight_father.gsc;
#include scripts/core_common/ai/systems/ai_interface.gsc;

#namespace blightfatherinterface;

// Namespace blightfatherinterface/archetype_blight_father_interface
// Params 0, eflags: 0x1 linked
// Checksum 0x23bdf114, Offset: 0x88
// Size: 0x10c
function registerblightfatherinterfaceattributes() {
    ai::registermatchedinterface(#"blight_father", #"tongue_grab_enabled", 1, array(1, 0));
    ai::registermatchedinterface(#"blight_father", #"lockdown_enabled", 1, array(1, 0), &archetypeblightfather::function_b95978a7);
    ai::registermatchedinterface(#"blight_father", #"gravity", "normal", array("low", "normal"), &archetypeblightfather::function_3e8300e9);
}

