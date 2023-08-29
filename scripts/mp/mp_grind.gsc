// Atian COD Tools GSC decompiler test
#include scripts/core_common/util_shared.gsc;
#include scripts/mp_common/load.gsc;
#include scripts/core_common/compass.gsc;

#namespace mp_grind;

// Namespace mp_grind/level_init
// Params 1, eflags: 0x40
// Checksum 0x96fa02a4, Offset: 0x118
// Size: 0xc6
function event_handler[level_init] main(eventstruct) {
    load::main();
    level function_89088577();
    level spawnkilltrigger();
    compass::setupminimap("");
    level.cleandepositpoints = array((536, -668, 1212), (1820, -1052, 1192), (-1592, -16, 1272), (-1348, -1668, 1284), (1308, 140, 1192));
}

// Namespace mp_grind/mp_grind
// Params 0, eflags: 0x1 linked
// Checksum 0xa9d77fe, Offset: 0x1e8
// Size: 0x224
function function_89088577() {
    spawncollision("collision_clip_wall_128x128x10", "collider", (1179.08, -101.57, 1364), (270, 350.638, -25.7397));
    spawncollision("collision_clip_wall_128x128x10", "collider", (1196.05, -54, 1364), vectorscale((1, 0, 0), 270));
    spawncollision("collision_clip_wall_64x64x10", "collider", (1144, 16, 1364), vectorscale((1, 0, 0), 270));
    spawncollision("collision_clip_wall_64x64x10", "collider", (1213.5, 17, 1364), (270, 17.7027, 17.796));
    spawncollision("collision_clip_wall_64x64x10", "collider", (1177, 51, 1364), (270, 44.9, 13.8969));
    spawncollision("collision_clip_wall_64x64x10", "collider", (1159.5, 62.5, 1364), (270, 333.635, 93.5613));
    spawncollision("collision_clip_wall_32x32x10", "collider", (1128, 64, 1364), vectorscale((1, 0, 0), 270));
    spawncollision("collision_clip_wall_32x32x10", "collider", (1128, 88, 1364), vectorscale((1, 0, 0), 270));
}

// Namespace mp_grind/mp_grind
// Params 0, eflags: 0x1 linked
// Checksum 0x6238c494, Offset: 0x418
// Size: 0x9c
function spawnkilltrigger() {
    trigger = spawn("trigger_radius", (-1368, 3024, 1256), 0, 196, 128);
    trigger thread watchkilltrigger();
    trigger = spawn("trigger_radius", (-1320, 1528, 1488), 0, 96, 128);
    trigger thread watchkilltrigger();
}

// Namespace mp_grind/mp_grind
// Params 0, eflags: 0x1 linked
// Checksum 0xdf76cb91, Offset: 0x4c0
// Size: 0xa8
function watchkilltrigger() {
    level endon(#"game_ended");
    trigger = self;
    while (1) {
        waitresult = undefined;
        waitresult = trigger waittill(#"trigger");
        waitresult.activator dodamage(1000, trigger.origin + (0, 0, 0), trigger, trigger, "none", "MOD_SUICIDE", 0);
    }
}

