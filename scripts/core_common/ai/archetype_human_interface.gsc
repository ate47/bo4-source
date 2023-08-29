// Atian COD Tools GSC decompiler test
#include scripts/core_common/ai/systems/ai_interface.gsc;
#include scripts/core_common/ai/archetype_utility.gsc;
#include scripts/core_common/ai/archetype_human.gsc;

#namespace humaninterface;

// Namespace humaninterface/archetype_human_interface
// Params 0, eflags: 0x1 linked
// Checksum 0x29eea6ac, Offset: 0xd8
// Size: 0x60c
function registerhumaninterfaceattributes() {
    ai::registermatchedinterface(#"human", #"can_be_meleed", 1, array(1, 0), &aiutility::meleeattributescallback);
    ai::registermatchedinterface(#"human", #"can_melee", 1, array(1, 0), &aiutility::meleeattributescallback);
    ai::registermatchedinterface(#"human", #"can_initiateaivsaimelee", 1, array(1, 0));
    ai::registermatchedinterface(#"human", #"coveridleonly", 0, array(1, 0));
    ai::registermatchedinterface(#"human", #"cqb", 0, array(1, 0), &humansoldierserverutils::cqbattributecallback);
    ai::registermatchedinterface(#"human", #"forcetacticalwalk", 0, array(1, 0), &humansoldierserverutils::forcetacticalwalkcallback);
    ai::registermatchedinterface(#"human", #"move_mode", "normal", array("normal", "escort", "guard", "normal", "marching", "rambo", "rusher", "squadmember"), &humansoldierserverutils::movemodeattributecallback);
    ai::registermatchedinterface(#"human", #"useanimationoverride", 0, array(1, 0), &humansoldierserverutils::useanimationoverridecallback);
    ai::registermatchedinterface(#"human", #"sprint", 0, array(1, 0), &humansoldierserverutils::forcesprintcallback);
    ai::registermatchedinterface(#"human", #"patrol", 0, array(1, 0));
    ai::registermatchedinterface(#"human", #"disablearrivals", 0, array(1, 0), &aiutility::arrivalattributescallback);
    ai::registermatchedinterface(#"human", #"disablesprint", 0, array(1, 0), &humansoldierserverutils::disablesprintcallback);
    ai::registermatchedinterface(#"human", #"stealth", 0, array(1, 0));
    ai::registermatchedinterface(#"human", #"vignette_mode", "off", array("off", "slow", "fast"), &humansoldierserverutils::vignettemodecallback);
    ai::registermatchedinterface(#"human", #"usegrenades", 1, array(1, 0));
    ai::registermatchedinterface(#"human", #"usegrenadelauncher", 0, array(1, 0));
    ai::registermatchedinterface(#"human", #"uselightninggun", 0, array(1, 0));
    ai::registermatchedinterface(#"human", #"useannihilator", 0, array(1, 0));
}

