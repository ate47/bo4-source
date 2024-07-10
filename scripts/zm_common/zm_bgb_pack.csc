#using scripts\zm_common\load.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\struct.csc;

#namespace bgb_pack;

// Namespace bgb_pack/zm_bgb_pack
// Params 0, eflags: 0x2
// Checksum 0x10419b8e, Offset: 0x138
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"bgb_pack", &__init__, &__main__, undefined);
}

// Namespace bgb_pack/zm_bgb_pack
// Params 0, eflags: 0x1 linked
// Checksum 0xb0cb3680, Offset: 0x188
// Size: 0x1c6
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    clientfield::register("clientuimodel", "zmhud.bgb_carousel.global_cooldown", 1, 5, "float", undefined, 0, 0);
    for (i = 0; i < 4; i++) {
        clientfield::register("clientuimodel", "zmhud.bgb_carousel." + i + ".state", 1, 2, "int", undefined, 0, 0);
        clientfield::register("clientuimodel", "zmhud.bgb_carousel." + i + ".gum_idx", 1, 7, "int", undefined, 0, 0);
        clientfield::register("clientuimodel", "zmhud.bgb_carousel." + i + ".cooldown_perc", 1, 5, "float", undefined, 0, 0);
        clientfield::register("clientuimodel", "zmhud.bgb_carousel." + i + ".lockdown", 1, 1, "float", undefined, 0, 0);
        clientfield::register("clientuimodel", "zmhud.bgb_carousel." + i + ".unavailable", 1, 1, "float", undefined, 0, 0);
    }
}

// Namespace bgb_pack/zm_bgb_pack
// Params 0, eflags: 0x5 linked
// Checksum 0xee02267f, Offset: 0x358
// Size: 0x26
function private __main__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
}

