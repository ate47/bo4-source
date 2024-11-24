#using scripts\core_common\ai\systems\ai_interface;
#using scripts\core_common\ai\zombie;

#namespace catalystinterface;

// Namespace catalystinterface/archetype_catalyst_interface
// Params 0, eflags: 0x1 linked
// Checksum 0x8ec5a080, Offset: 0x88
// Size: 0x6c
function registercatalystinterfaceattributes() {
    ai::registermatchedinterface(#"catalyst", #"gravity", "normal", array("low", "normal"), &zombiebehavior::zombiegravity);
}

