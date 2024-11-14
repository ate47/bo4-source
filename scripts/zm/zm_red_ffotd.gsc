#using scripts\core_common\system_shared;

#namespace zm_red_ffotd;

// Namespace zm_red_ffotd/zm_red_ffotd
// Params 0, eflags: 0x2
// Checksum 0x9409d69c, Offset: 0x1d0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_red_ffotd", &__init__, &__main__, undefined);
}

// Namespace zm_red_ffotd/zm_red_ffotd
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x220
// Size: 0x4
function __init__() {
    
}

// Namespace zm_red_ffotd/zm_red_ffotd
// Params 0, eflags: 0x1 linked
// Checksum 0xcb6226a7, Offset: 0x230
// Size: 0x1b4
function __main__() {
    spawncollision("collision_clip_128x128x128", "cliff_ruins_spawn_closet", (-3199, 7000, 508), (0, 245, 0));
    spawncollision("collision_clip_ramp_128x24", "collider", (21527.5, 21421, 900), (0, 126.3, 0));
    spawncollision("collision_clip_64x64x256", "amphitheater_statue_top_1", (-2080, 1553, 512), (0, 0, 0));
    spawncollision("collision_clip_64x64x256", "amphitheater_statue_top_2", (-1944.54, 1468.39, 512), (0, 347.199, 0));
    spawncollision("collision_clip_wall_512x512x10", "temple_terrace_column", (-328, -533, 291), (0, 280.2, 0));
    spawncollision("collision_clip_256x256x256", "apollo_temple_stairs", (-1228, -801, -64), (0, 10, 0));
    spawncollision("collision_clip_wall_128x128x10", "river_of_sorrows_murder_door", (-689, 5442, 1376), (0, 315, 0));
}

