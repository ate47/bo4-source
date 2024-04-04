// Atian COD Tools GSC decompiler test
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_escape_ffotd;

// Namespace zm_escape_ffotd/zm_escape_ffotd
// Params 0, eflags: 0x2
// Checksum 0x32d51b4b, Offset: 0xc8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_escape_ffotd", &__init__, &__main__, undefined);
}

// Namespace zm_escape_ffotd/zm_escape_ffotd
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x118
// Size: 0x4
function __init__() {
    
}

// Namespace zm_escape_ffotd/zm_escape_ffotd
// Params 0, eflags: 0x1 linked
// Checksum 0xadba1690, Offset: 0x128
// Size: 0xcc
function __main__() {
    spawncollision("collision_clip_ramp_256x24", "collider", (758, 6590, 495), (270, 0.2, 18.8));
    spawncollision("collision_clip_wall_256x256x10", "collider", (-1382.5, 5724, 177.5), (0, 11.6, 0));
    spawncollision("collision_clip_ramp_256x24", "collider", (376, 10144, 1568), (270, 270, 0));
}

