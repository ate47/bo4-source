// Atian COD Tools GSC decompiler test
#include scripts/core_common/ai/systems/ai_interface.gsc;
#include scripts/core_common/ai/archetype_tiger.gsc;

#namespace tigerinterface;

// Namespace tigerinterface/archetype_tiger_interface
// Params 0, eflags: 0x1 linked
// Checksum 0xfef8fd4b, Offset: 0x88
// Size: 0xec
function registertigerinterfaceattributes() {
    ai::registermatchedinterface(#"tiger", #"gravity", "normal", array("low", "normal"), &tigerbehavior::function_c0b7f4ce);
    ai::registermatchedinterface(#"tiger", #"min_run_dist", 500);
    ai::registermatchedinterface(#"tiger", #"sprint", 0, array(1, 0));
}

