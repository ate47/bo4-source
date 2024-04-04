// Atian COD Tools GSC decompiler test
#using scripts\core_common\system_shared.gsc;

#namespace wz_escape_ffotd_alt;

// Namespace wz_escape_ffotd_alt/wz_escape_alt_ffotd
// Params 0, eflags: 0x2
// Checksum 0xebec2a0c, Offset: 0xc8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"wz_escape_ffotd_alt", &__init__, &__main__, undefined);
}

// Namespace wz_escape_ffotd_alt/wz_escape_alt_ffotd
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x118
// Size: 0x4
function __init__() {
    
}

// Namespace wz_escape_ffotd_alt/wz_escape_alt_ffotd
// Params 0, eflags: 0x1 linked
// Checksum 0x73da96a8, Offset: 0x128
// Size: 0xec
function __main__() {
    col_origin = (6512, 5109, 874);
    var_a9430bbc = (0, 324, 0);
    hack_col = spawncollision("collision_clip_wall_256x256x10", "hack_collider", col_origin, var_a9430bbc);
    hack_col disconnectpaths(0, 0);
    hack_col notsolid();
    spawncollision("p8_col_rock_large_04", "collider", (-7044.5, -5855.5, 63.2374), (359.701, 349.702, 0.437607));
}

