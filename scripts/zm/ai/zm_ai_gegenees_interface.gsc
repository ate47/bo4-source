// Atian COD Tools GSC decompiler test
#include scripts/core_common/ai/systems/ai_interface.gsc;
#include scripts/zm/ai/zm_ai_gegenees.gsc;

#namespace zm_ai_gegenees_interface;

// Namespace zm_ai_gegenees_interface/zm_ai_gegenees_interface
// Params 0, eflags: 0x1 linked
// Checksum 0xc0da991a, Offset: 0x78
// Size: 0x8c
function registergegeneesinterfaceattributes() {
    ai::registermatchedinterface(#"gegenees", #"run", 0, array(1, 0));
    ai::registernumericinterface(#"gegenees", #"damage_multiplier", 1, 0, 100);
}

