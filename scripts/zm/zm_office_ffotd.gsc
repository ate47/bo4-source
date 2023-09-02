// Atian COD Tools GSC decompiler test
#using scripts\core_common\system_shared.gsc;

#namespace zm_office_ffotd;

// Namespace zm_office_ffotd/zm_office_ffotd
// Params 0, eflags: 0x2
// Checksum 0x2657da81, Offset: 0xa0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_office_ffotd", &__init__, &__main__, undefined);
}

// Namespace zm_office_ffotd/zm_office_ffotd
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0xf0
// Size: 0x4
function __init__() {
    
}

// Namespace zm_office_ffotd/zm_office_ffotd
// Params 0, eflags: 0x1 linked
// Checksum 0x52d9118e, Offset: 0x100
// Size: 0xb4
function __main__() {
    spawncollision("collision_clip_wall_128x128x10", "collider", (-1683, 3653, -654), vectorscale((0, 1, 0), 357.6));
    spawncollision("collision_clip_wall_128x128x10", "collider", (-1519, 3594, -654), (0, 0, 0));
    spawncollision("collision_clip_wall_128x128x10", "collider", (-716, 4286, -654), vectorscale((0, 1, 0), 2));
}

