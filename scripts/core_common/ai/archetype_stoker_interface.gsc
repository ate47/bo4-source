// Atian COD Tools GSC decompiler test
#include scripts/core_common/ai/archetype_stoker.gsc;
#include scripts/core_common/ai/systems/ai_interface.gsc;

#namespace stokerinterface;

// Namespace stokerinterface/archetype_stoker_interface
// Params 0, eflags: 0x1 linked
// Checksum 0x99c5edd9, Offset: 0x88
// Size: 0x6c
function registerstokerinterfaceattributes() {
    ai::registermatchedinterface(#"stoker", #"gravity", "normal", array("low", "normal"), &archetype_stoker::function_e4ef4e27);
}

