#using scripts\core_common\system_shared.csc;
#using script_40114edfb27a2dd9;

#namespace hud;

// Namespace hud/hud_shared
// Params 0, eflags: 0x2
// Checksum 0x1c8456e, Offset: 0x90
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hud", &__init__, undefined, undefined);
}

// Namespace hud/hud_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x2312e110, Offset: 0xd8
// Size: 0x1c
function __init__() {
    scavenger_icon::register("scavenger_pickup");
}

