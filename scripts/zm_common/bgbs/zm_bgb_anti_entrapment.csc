#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_bgb;

#namespace zm_bgb_anti_entrapment;

// Namespace zm_bgb_anti_entrapment/zm_bgb_anti_entrapment
// Params 0, eflags: 0x2
// Checksum 0x2daa04bd, Offset: 0x80
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_anti_entrapment", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_anti_entrapment/zm_bgb_anti_entrapment
// Params 0, eflags: 0x0
// Checksum 0xb32af224, Offset: 0xd0
// Size: 0x4c
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_anti_entrapment", "time");
}

