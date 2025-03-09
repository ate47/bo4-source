#using scripts\core_common\flag_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\zm_bgb;
#using scripts\zm_common\zm_utility;

#namespace zm_bgb_shopping_free;

// Namespace zm_bgb_shopping_free/zm_bgb_shopping_free
// Params 0, eflags: 0x2
// Checksum 0x49d725aa, Offset: 0xa0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_shopping_free", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_shopping_free/zm_bgb_shopping_free
// Params 0, eflags: 0x0
// Checksum 0xbcc58e7f, Offset: 0xf0
// Size: 0x4c
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_shopping_free", "time");
}

