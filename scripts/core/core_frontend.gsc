// Atian COD Tools GSC decompiler test
#using scripts\core\core_frontend_sound.gsc;
#using scripts\core\core_frontend_fx.gsc;

#namespace core_frontend;

// Namespace core_frontend/level_init
// Params 1, eflags: 0x40
// Checksum 0x431ff8d1, Offset: 0x78
// Size: 0x6a
function event_handler[level_init] main(eventstruct) {
    precache();
    setmapcenter((0, 0, 0));
    core_frontend_fx::main();
    core_frontend_sound::main();
    world.var_7407953c = undefined;
    world.var_8c7b4214 = undefined;
}

// Namespace core_frontend/core_frontend
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0xf0
// Size: 0x4
function precache() {
    
}

