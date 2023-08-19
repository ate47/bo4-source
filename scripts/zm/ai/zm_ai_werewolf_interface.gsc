// Atian COD Tools GSC decompiler test
#include script_59f07c660e6710a5;
#include scripts/zm/ai/zm_ai_werewolf.gsc;

#namespace zm_ai_werewolf_interface;

// Namespace zm_ai_werewolf_interface/zm_ai_werewolf_interface
// Params 0, eflags: 0x1 linked
// Checksum 0x1e64ecbc, Offset: 0x78
// Size: 0xb4
function registerwerewolfinterfaceattributes() {
    ai::registermatchedinterface(#"werewolf", #"patrol", 0, array(1, 0), &zm_ai_werewolf::function_2341cdf0);
    ai::registermatchedinterface(#"werewolf", #"summon_wolves", 0, array(1, 0), &zm_ai_werewolf::function_2c67c3e1);
}

