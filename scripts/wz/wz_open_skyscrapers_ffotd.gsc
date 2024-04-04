// Atian COD Tools GSC decompiler test
#using scripts\core_common\system_shared.gsc;

#namespace wz_open_skyscrapers_ffotd;

// Namespace wz_open_skyscrapers_ffotd/wz_open_skyscrapers_ffotd
// Params 0, eflags: 0x2
// Checksum 0x93601b96, Offset: 0xa8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"wz_open_skyscrapers_ffotd", &__init__, &__main__, undefined);
}

// Namespace wz_open_skyscrapers_ffotd/wz_open_skyscrapers_ffotd
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0xf8
// Size: 0x4
function __init__() {
    
}

// Namespace wz_open_skyscrapers_ffotd/wz_open_skyscrapers_ffotd
// Params 0, eflags: 0x1 linked
// Checksum 0x1ee3704d, Offset: 0x108
// Size: 0x226
function __main__() {
    rock = spawn("script_model", (-25996.2, -47315.5, 2366.06));
    if (isdefined(rock)) {
        rock setmodel(#"hash_283f153de0d2b7ac");
        rock.angles = (0, 240, 27);
        rock setscale(2);
    }
    spawncollision("collision_clip_256x256x256", "collider", (-9496.5, 39312.5, 2256), (0, 338, 0));
    rock = spawn("script_model", (14653.5, -18402.3, 1475.66));
    if (isdefined(rock)) {
        rock setmodel(#"hash_5d5c82725edc89c8");
        rock.angles = (357, 353, -4);
    }
    rock = spawn("script_model", (-6948.21, -24164.6, 1068.76));
    if (isdefined(rock)) {
        rock setmodel(#"hash_5d5c82725edc89c8");
        rock.angles = (348, 343, -7);
    }
    rock = spawn("script_model", (-10016.2, -25676.7, 1039.73));
    if (isdefined(rock)) {
        rock setmodel(#"hash_5d5c82725edc89c8");
        rock.angles = (1, 328, -17);
    }
}

