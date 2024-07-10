#using scripts\mp\mp_morocco_scripted.gsc;
#using scripts\mp\mp_morocco_sound.gsc;
#using scripts\mp\mp_morocco_fx.gsc;
#using scripts\mp_common\load.gsc;
#using scripts\mp_common\gametypes\globallogic_spawn.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\compass.gsc;

#namespace mp_morocco;

// Namespace mp_morocco/level_init
// Params 1, eflags: 0x40
// Checksum 0x6bacf5fc, Offset: 0x118
// Size: 0xdc
function event_handler[level_init] main(eventstruct) {
    load::main();
    compass::setupminimap("");
    level.cleandepositpoints = array((425, 1058, 136.5), (-1392, -592, 46.75), (1888, -520, 136), (1523, 1860, 136), (-672, 1592, 135));
    level spawnkilltrigger();
    level function_89088577();
    function_61f478ff();
}

// Namespace mp_morocco/mp_morocco
// Params 0, eflags: 0x1 linked
// Checksum 0x66ec3b6d, Offset: 0x200
// Size: 0x142
function function_61f478ff() {
    findpoint = (2532.35, 1640.41, 128.125);
    if (!level.teambased) {
        rawspawns = struct::get_array("mp_t8_spawn_point", "targetname");
        foreach (spawn in rawspawns) {
            if (!(isdefined(spawn._human_were) && spawn._human_were)) {
                continue;
            }
            distance = distancesquared(spawn.origin, findpoint);
            if (distance > 5) {
                continue;
            }
            spawn.origin = (3140.85, 913.91, 128.125);
            break;
        }
    }
}

// Namespace mp_morocco/mp_morocco
// Params 0, eflags: 0x1 linked
// Checksum 0xf68d4f18, Offset: 0x350
// Size: 0x34
function function_89088577() {
    spawncollision("collision_clip_128x128x128", "collider", (-128, -600, 728), (0, 0, 0));
}

// Namespace mp_morocco/mp_morocco
// Params 0, eflags: 0x1 linked
// Checksum 0xcca046df, Offset: 0x390
// Size: 0x1bc
function spawnkilltrigger() {
    trigger = spawn("trigger_radius", (2856, 600, 64), 0, 700, 32);
    trigger thread watchkilltrigger();
    trigger = spawn("trigger_radius", (2792, 1368, 64), 0, 700, 32);
    trigger thread watchkilltrigger();
    trigger = spawn("trigger_radius", (200, 1920, 64), 0, 300, 32);
    trigger thread watchkilltrigger();
    trigger = spawn("trigger_radius", (-224, 1992, 64), 0, 300, 32);
    trigger thread watchkilltrigger();
    trigger = spawn("trigger_radius", (-768, 1952, 64), 0, 360, 32);
    trigger thread watchkilltrigger();
    trigger = spawn("trigger_radius", (480, -1568, 96), 0, 32, 128);
    trigger thread watchkilltrigger();
}

// Namespace mp_morocco/mp_morocco
// Params 0, eflags: 0x1 linked
// Checksum 0x853b187c, Offset: 0x558
// Size: 0xa8
function watchkilltrigger() {
    level endon(#"game_ended");
    trigger = self;
    while (true) {
        waitresult = trigger waittill(#"trigger");
        waitresult.activator dodamage(1000, trigger.origin + (0, 0, 0), trigger, trigger, "none", "MOD_SUICIDE", 0);
    }
}

