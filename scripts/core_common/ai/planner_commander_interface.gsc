// Atian COD Tools GSC decompiler test
#include scripts/core_common/ai/planner_commander.gsc;
#include script_59f07c660e6710a5;

#namespace commanderinterface;

// Namespace commanderinterface/planner_commander_interface
// Params 0, eflags: 0x1 linked
// Checksum 0x3a2bfa2d, Offset: 0x78
// Size: 0x9c
function registercommanderinterfaceattributes() {
    ai::registerentityinterface(#"commander", #"commander_force_goal", undefined, &plannercommanderutility::setforcegoalattribute);
    ai::registermatchedinterface(#"commander", #"commander_golden_path", 1, array(1, 0), &plannercommanderutility::setgoldenpathattribute);
}

