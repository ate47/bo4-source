// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_bgb.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_bgb_arsenal_accelerator;

// Namespace zm_bgb_arsenal_accelerator/zm_bgb_arsenal_accelerator
// Params 0, eflags: 0x2
// Checksum 0x4310a77e, Offset: 0x80
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_arsenal_accelerator", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_arsenal_accelerator/zm_bgb_arsenal_accelerator
// Params 0, eflags: 0x1 linked
// Checksum 0xd207de82, Offset: 0xd0
// Size: 0x9c
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_arsenal_accelerator", "time", 120, &enable, &disable, undefined);
    bgb::function_1fee6b3(#"zm_bgb_arsenal_accelerator", 23);
}

// Namespace zm_bgb_arsenal_accelerator/zm_bgb_arsenal_accelerator
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x178
// Size: 0x4
function enable() {
    
}

// Namespace zm_bgb_arsenal_accelerator/zm_bgb_arsenal_accelerator
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x188
// Size: 0x4
function disable() {
    
}

