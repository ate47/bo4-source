#using scripts\core_common\clientfaceanim_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flagsys_shared;
#using scripts\core_common\footsteps_shared;
#using scripts\core_common\fx_shared;
#using scripts\core_common\load_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\turret_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\vehicle_shared;
#using scripts\core_common\vehicles\driving_fx;
#using scripts\weapons\zm\weaponobjects;
#using scripts\zm_common\ambient;
#using scripts\zm_common\global_fx;
#using scripts\zm_common\zm;
#using scripts\zm_common\zm_aoe;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_customgame;
#using scripts\zm_common\zm_magicbox;
#using scripts\zm_common\zm_score;
#using scripts\zm_common\zm_traps;

#namespace load;

// Namespace load/load
// Params 3, eflags: 0x0
// Checksum 0xf5dae872, Offset: 0x140
// Size: 0x3a
function levelnotifyhandler(clientnum, state, oldstate) {
    if (state != "") {
        level notify(state, clientnum);
    }
}

// Namespace load/load
// Params 2, eflags: 0x0
// Checksum 0xac6c2fe9, Offset: 0x188
// Size: 0x14
function warnmissilelocking(localclientnum, set) {
    
}

// Namespace load/load
// Params 2, eflags: 0x0
// Checksum 0xe535a043, Offset: 0x1a8
// Size: 0x14
function warnmissilelocked(localclientnum, set) {
    
}

// Namespace load/load
// Params 2, eflags: 0x0
// Checksum 0x9796fe04, Offset: 0x1c8
// Size: 0x14
function warnmissilefired(localclientnum, set) {
    
}

// Namespace load/load
// Params 0, eflags: 0x0
// Checksum 0x2150d358, Offset: 0x1e8
// Size: 0x11c
function main() {
    assert(isdefined(level.first_frame), "<dev string:x38>");
    zm::init();
    level thread util::init_utility();
    util::register_system(#"levelnotify", &levelnotifyhandler);
    register_clientfields();
    level.createfx_disable_fx = getdvarint(#"disable_fx", 0) == 1;
    system::wait_till("all");
    level thread art_review();
    level flagsys::set(#"load_main_complete");
}

// Namespace load/load
// Params 0, eflags: 0x0
// Checksum 0xc6cf8ff9, Offset: 0x310
// Size: 0x4c
function register_clientfields() {
    clientfield::register("allplayers", "zmbLastStand", 1, 1, "int", &zm::laststand, 0, 1);
}

