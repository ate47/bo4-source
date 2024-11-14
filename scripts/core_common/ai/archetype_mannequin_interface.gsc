#using scripts\core_common\ai\systems\ai_interface;

#namespace mannequininterface;

// Namespace mannequininterface/archetype_mannequin_interface
// Params 0, eflags: 0x1 linked
// Checksum 0xdb4dae60, Offset: 0x70
// Size: 0xdc
function registermannequininterfaceattributes() {
    ai::registermatchedinterface(#"mannequin", #"can_juke", 0, array(1, 0));
    ai::registermatchedinterface(#"mannequin", #"suicidal_behavior", 0, array(1, 0));
    ai::registermatchedinterface(#"mannequin", #"spark_behavior", 0, array(1, 0));
}

