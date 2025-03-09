#using scripts\core_common\system_shared;

#namespace zm_towers_ffotd;

// Namespace zm_towers_ffotd/zm_towers_ffotd
// Params 0, eflags: 0x2
// Checksum 0xcb75c93e, Offset: 0xa0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_towers_ffotd", &__init__, &__main__, undefined);
}

// Namespace zm_towers_ffotd/zm_towers_ffotd
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0xf0
// Size: 0x4
function __init__() {
    
}

// Namespace zm_towers_ffotd/zm_towers_ffotd
// Params 0, eflags: 0x0
// Checksum 0x9d9f7dfc, Offset: 0x100
// Size: 0x4e
function __main__() {
    var_bb230d1 = spawncollision("collision_bullet_wall_128x128x10", "collider", (940, 948, -216), (0, 45, 0));
}

