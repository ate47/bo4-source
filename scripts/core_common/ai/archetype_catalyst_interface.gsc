#using scripts\core_common\ai\systems\ai_interface;
#using scripts\core_common\ai\zombie;

#namespace catalystinterface;

// Namespace catalystinterface/archetype_catalyst_interface
// Params 0
// Checksum 0xaec20d17, Offset: 0x88
// Size: 0x6c
function registercatalystinterfaceattributes()
{
    ai::registermatchedinterface( #"catalyst", #"gravity", "normal", array( "low", "normal" ), &zombiebehavior::zombiegravity );
}

