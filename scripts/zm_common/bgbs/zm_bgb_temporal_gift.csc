#using scripts\zm_common\zm_bgb;
#using scripts\core_common\system_shared;

#namespace zm_bgb_temporal_gift;

// Namespace zm_bgb_temporal_gift/zm_bgb_temporal_gift
// Params 0, eflags: 0x2
// Checksum 0xd546a665, Offset: 0x80
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_temporal_gift", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_temporal_gift/zm_bgb_temporal_gift
// Params 0, eflags: 0x1 linked
// Checksum 0xad06fbac, Offset: 0xd0
// Size: 0x4c
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_temporal_gift", "time");
}

