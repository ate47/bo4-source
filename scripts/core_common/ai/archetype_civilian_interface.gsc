#using scripts\core_common\ai\archetype_utility.gsc;
#using scripts\core_common\ai\archetype_civilian.gsc;
#using scripts\core_common\ai\systems\ai_interface.gsc;

#namespace civilianinterface;

// Namespace civilianinterface/archetype_civilian_interface
// Params 0, eflags: 0x1 linked
// Checksum 0x68503044, Offset: 0xa0
// Size: 0x1dc
function registercivilianinterfaceattributes() {
    ai::registermatchedinterface(#"civilian", #"disablearrivals", 0, array(1, 0), &aiutility::arrivalattributescallback);
    ai::registermatchedinterface(#"civilian", #"hash_78e762abc4fbf1de", "calm", array("calm", "panic", "riot", "run"));
    ai::registermatchedinterface(#"civilian", #"auto_escape", 1, array(1, 0));
    ai::registermatchedinterface(#"civilian", #"auto_wander", 1, array(1, 0));
    ai::registermatchedinterface(#"civilian", #"usegrenades", 1, array(1, 0));
    ai::registerentityinterface(#"civilian", #"follow", undefined, &archetypecivilian::function_49d80e54);
}

