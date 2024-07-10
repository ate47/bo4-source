#using scripts\zm_common\zm_bgb.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_bgb_anti_entrapment;

// Namespace zm_bgb_anti_entrapment/zm_bgb_anti_entrapment
// Params 0, eflags: 0x2
// Checksum 0xaf773440, Offset: 0x88
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_bgb_anti_entrapment", &__init__, undefined, "bgb");
}

// Namespace zm_bgb_anti_entrapment/zm_bgb_anti_entrapment
// Params 0, eflags: 0x1 linked
// Checksum 0x7c0df641, Offset: 0xd0
// Size: 0x9c
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_anti_entrapment", "time", 30, &enable, &disable, undefined, undefined);
    bgb::function_1fee6b3(#"zm_bgb_anti_entrapment", 11);
}

// Namespace zm_bgb_anti_entrapment/zm_bgb_anti_entrapment
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x178
// Size: 0x4
function enable() {
    
}

// Namespace zm_bgb_anti_entrapment/zm_bgb_anti_entrapment
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x188
// Size: 0x4
function disable() {
    
}

