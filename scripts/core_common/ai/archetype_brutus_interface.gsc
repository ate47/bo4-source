// Atian COD Tools GSC decompiler test
#include script_59f07c660e6710a5;
#include scripts/core_common/ai/archetype_brutus.gsc;

#namespace brutusinterface;

// Namespace brutusinterface/archetype_brutus_interface
// Params 0, eflags: 0x1 linked
// Checksum 0xb4ce821a, Offset: 0x78
// Size: 0xec
function registerbrutusinterfaceattributes() {
    ai::registermatchedinterface(#"brutus", #"can_ground_slam", 0, array(1, 0));
    ai::registermatchedinterface(#"brutus", #"scripted_mode", 0, array(1, 0), &archetypebrutus::function_f8aa76ea);
    ai::registermatchedinterface(#"brutus", #"patrol", 0, array(1, 0));
}
