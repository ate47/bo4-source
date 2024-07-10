#using scripts\core_common\system_shared.gsc;

#namespace zm_zodt8_ffotd;

// Namespace zm_zodt8_ffotd/zm_zodt8_ffotd
// Params 0, eflags: 0x2
// Checksum 0xc665204e, Offset: 0xa0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_zodt8_ffotd", &__init__, &__main__, undefined);
}

// Namespace zm_zodt8_ffotd/zm_zodt8_ffotd
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0xf0
// Size: 0x4
function __init__() {
    
}

// Namespace zm_zodt8_ffotd/zm_zodt8_ffotd
// Params 0, eflags: 0x1 linked
// Checksum 0x1c80630a, Offset: 0x100
// Size: 0x44
function __main__() {
    spawncollision("collision_clip_wall_128x128x10", "collider", (190, -3839, 1149), (0, 270, 0));
}

