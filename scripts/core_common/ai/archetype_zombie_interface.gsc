// Atian COD Tools GSC decompiler test
#include script_59f07c660e6710a5;
#include scripts/core_common/ai/zombie.gsc;

#namespace zombieinterface;

// Namespace zombieinterface/archetype_zombie_interface
// Params 0, eflags: 0x1 linked
// Checksum 0x57f7b17, Offset: 0x88
// Size: 0x18c
function registerzombieinterfaceattributes() {
    ai::registermatchedinterface(#"zombie", #"can_juke", 0, array(1, 0));
    ai::registermatchedinterface(#"zombie", #"suicidal_behavior", 0, array(1, 0));
    ai::registermatchedinterface(#"zombie", #"spark_behavior", 0, array(1, 0));
    ai::registermatchedinterface(#"zombie", #"use_attackable", 0, array(1, 0));
    ai::registermatchedinterface(#"zombie", #"gravity", "normal", array("low", "normal"), &zombiebehavior::function_db26137a);
}
