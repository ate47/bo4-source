// Atian COD Tools GSC decompiler test
#include script_59f07c660e6710a5;
#include scripts/core_common/ai/archetype_utility.gsc;
#include scripts/core_common/ai/archetype_robot.gsc;

#namespace namespace_d0c98af;

// Namespace namespace_d0c98af/namespace_a6e9d331
// Params 0, eflags: 0x1 linked
// Checksum 0xab989be3, Offset: 0x170
// Size: 0x87c
function function_afffda42() {
    ai::registermatchedinterface(#"robot", #"can_melee", 1, array(1, 0), &aiutility::meleeattributescallback);
    ai::registermatchedinterface(#"robot", #"can_be_meleed", 1, array(1, 0), &aiutility::meleeattributescallback);
    ai::registermatchedinterface(#"robot", #"hash_3d48d019e749c788", 1, array(1, 0));
    ai::registermatchedinterface(#"robot", #"hash_79e9485fd07697b5", 1, array(1, 0));
    ai::registermatchedinterface(#"robot", #"can_gib", 1, array(1, 0));
    ai::registermatchedinterface(#"robot", #"can_initiateaivsaimelee", 1, array(1, 0));
    ai::registermatchedinterface(#"robot", #"disablesprint", 0, array(1, 0), &namespace_8234b281::disablesprintcallback);
    ai::registervectorinterface(#"robot", #"hash_4f670bf8cfc94239");
    ai::registermatchedinterface(#"robot", #"force_cover", 0, array(1, 0));
    ai::registermatchedinterface(#"robot", #"hash_41b3da5a06c9fa83", "normal", array("normal", "gib_legs", "remove_legs"), &namespace_8234b281::function_790b144e);
    ai::registermatchedinterface(#"robot", #"move_mode", "normal", array("escort", "guard", "normal", "marching", "rambo", "rusher", "squadmember"), &namespace_8234b281::function_a5976cc9);
    ai::registermatchedinterface(#"robot", #"phalanx", 0, array(1, 0), &aiutility::phalanxattributecallback);
    ai::registermatchedinterface(#"robot", #"phalanx_force_stance", "normal", array("normal", "stand", "crouch"));
    ai::registermatchedinterface(#"robot", #"hash_4ffb3cc79fdade65", 0, array(0, 1, 2, 3, 4), &namespace_8234b281::function_6bc4029a);
    ai::registermatchedinterface(#"robot", #"hash_24a2d6bc85e42df4", 0, array(1, 0), &namespace_8234b281::function_b292e047);
    ai::registermatchedinterface(#"robot", #"hash_623445a37d2d5577", 1, array(1, 0));
    ai::registermatchedinterface(#"robot", #"hash_15405dca5e5c2f5d", 1, array(1, 0));
    ai::registermatchedinterface(#"robot", #"rogue_control", "level_0", array("level_0", "level_1", "forced_level_1", "level_2", "forced_level_2", "level_3", "forced_level_3"), &namespace_8234b281::function_f05545e);
    ai::registervectorinterface(#"robot", #"rogue_control_force_goal", undefined, &namespace_8234b281::function_cc3df458);
    ai::registermatchedinterface(#"robot", #"hash_304e8f29d07e9687", "sprint", array("walk", "run", "sprint"), &namespace_8234b281::function_54f8cd56);
    ai::registermatchedinterface(#"robot", #"hash_6d31c97afcd81529", 0, array(1, 0));
    ai::registermatchedinterface(#"robot", #"shutdown", 0, array(1, 0));
    ai::registermatchedinterface(#"robot", #"sprint", 0, array(1, 0), &namespace_8234b281::forcesprintcallback);
    ai::registermatchedinterface(#"robot", #"hash_5f053c075038a0e2", 0, array(1, 0));
    ai::registermatchedinterface(#"robot", #"hash_5e7e117a56287a6", "normal", array("normal", "procedural"), &namespace_8234b281::function_94fa0836);
}

