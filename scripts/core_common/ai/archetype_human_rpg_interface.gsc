#using scripts\core_common\ai\systems\ai_interface;
#using scripts\core_common\ai\archetype_utility;

#namespace humanrpginterface;

// Namespace humanrpginterface/archetype_human_rpg_interface
// Params 0, eflags: 0x1 linked
// Checksum 0x1c2a586d, Offset: 0x78
// Size: 0x18c
function registerhumanrpginterfaceattributes() {
    ai::registermatchedinterface(#"human_rpg", #"can_be_meleed", 1, array(1, 0), &aiutility::meleeattributescallback);
    ai::registermatchedinterface(#"human_rpg", #"can_melee", 1, array(1, 0), &aiutility::meleeattributescallback);
    ai::registermatchedinterface(#"human_rpg", #"coveridleonly", 0, array(1, 0));
    ai::registermatchedinterface(#"human_rpg", #"sprint", 0, array(1, 0));
    ai::registermatchedinterface(#"human_rpg", #"patrol", 0, array(1, 0));
}

