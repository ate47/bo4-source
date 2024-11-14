#using scripts\zm\zm_lightning_chain;
#using scripts\zm_common\zm_bgb;
#using scripts\core_common\system_shared;

#namespace zm_bgb_pop_shocks;

// Namespace zm_bgb_pop_shocks/zm_bgb_pop_shocks
// Params 0, eflags: 0x2
// Checksum 0x6dc4807c, Offset: 0x88
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_pop_shocks", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_pop_shocks/zm_bgb_pop_shocks
// Params 0, eflags: 0x1 linked
// Checksum 0x69354249, Offset: 0xd8
// Size: 0x4c
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_pop_shocks", "event");
}

