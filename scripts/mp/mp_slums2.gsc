// Atian COD Tools GSC decompiler test
#include scripts/mp/mp_slums2_scripted.gsc;
#include scripts/mp/mp_slums2_sound.gsc;
#include scripts/mp/mp_slums2_fx.gsc;
#include scripts/mp_common/load.gsc;
#include scripts/core_common/compass.gsc;

#namespace mp_slums2;

// Namespace mp_slums2/level_init
// Params 1, eflags: 0x40
// Checksum 0x7a7a4887, Offset: 0xc0
// Size: 0x244
function event<level_init> main(eventstruct) {
    mp_slums2_fx::main();
    mp_slums2_sound::main();
    load::main();
    compass::setupminimap("");
    level.cleandepositpoints = array((0, -744, 560), (472, 1120, 592), (-770, 1340, 592), (-112, -2152, 464), (1153, -1578, 512));
    spawncollision("collision_clip_wall_64x64x10", "collider", (-615, -740.5, 561.5), (0, 285, -90));
    spawncollision("collision_clip_wall_64x64x10", "collider", (-592.5, -734.5, 561.5), (0, 285, -90));
    spawncollision("collision_clip_wall_64x64x10", "collider", (-612.5, -749.5, 561.5), (0, 285, -90));
    spawncollision("collision_clip_wall_64x64x10", "collider", (-590, -743.5, 561.5), (0, 285, -90));
    spawncollision("collision_clip_wall_64x64x10", "collider", (-610, -759, 561.5), (0, 285, -90));
    spawncollision("collision_clip_wall_64x64x10", "collider", (-587.5, -753, 561.5), (0, 285, -90));
}

// Namespace mp_slums2/mp_slums2
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0x310
// Size: 0x4
function precache() {
    
}

