#using script_4da75c87643c8b07;
#using script_58d14a82f7aa9d6d;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\util_shared;
#using scripts\mp_common\item_world;
#using scripts\mp_common\load;
#using scripts\wz\wz_open_skyscrapers_ffotd;
#using scripts\wz\wz_open_skyscrapers_fx;
#using scripts\wz\wz_open_skyscrapers_sound;
#using scripts\wz_common\wz_array_broadcast;
#using scripts\wz_common\wz_asylum;
#using scripts\wz_common\wz_buoy_stash;
#using scripts\wz_common\wz_firing_range;
#using scripts\wz_common\wz_holiday;
#using scripts\wz_common\wz_jukebox;
#using scripts\wz_common\wz_nuketown_sign;

#namespace wz_open_skyscrapers;

// Namespace wz_open_skyscrapers/level_init
// Params 1, eflags: 0x40
// Checksum 0xe26292ca, Offset: 0x130
// Size: 0x1f4
function event_handler[level_init] main(eventstruct) {
    callback::on_localplayer_spawned(&on_localplayer_spawned);
    callback::on_finalize_initialization(&on_finalize_initialization);
    wz_open_skyscrapers_fx::main();
    wz_open_skyscrapers_sound::main();
    load::main();
    setdvar(#"cg_aggressivecullradius", 100);
    setdvar(#"hash_53f625ed150e7700", 12000);
    if (isdefined(getgametypesetting(#"wzbigteambattle")) && getgametypesetting(#"wzbigteambattle")) {
        setdvar(#"hash_53f625ed150e7700", 6000);
        setdvar(#"hash_6d12a505ad6a6e0f", 15000);
    }
    setdvar(#"hash_6d05981efd5d8d74", 800);
    util::waitforclient(0);
    wz_firing_range::init_targets("firing_range_target");
    wz_firing_range::init_targets("firing_range_target_challenge");
    level thread function_2560f130();
}

// Namespace wz_open_skyscrapers/wz_open_skyscrapers
// Params 1, eflags: 0x0
// Checksum 0x4388a416, Offset: 0x330
// Size: 0x14e
function on_localplayer_spawned(local_client_num) {
    if (self.name === #"semajredins" || self.name === #"deejaykingkong" || self.name === #"yer_") {
        if (self === function_27673a7(local_client_num)) {
            wait 10;
            if (isdefined(self) && self function_8e51b4f(11)) {
                setdvar(#"hash_7327ca257aa61e93", 1);
                setdvar(#"hash_7b7e1cadbd098787", 1);
            } else {
                setdvar(#"hash_7327ca257aa61e93", 0);
                setdvar(#"hash_7b7e1cadbd098787", 0);
            }
            if (isprofilebuild()) {
            }
        }
    }
}

// Namespace wz_open_skyscrapers/wz_open_skyscrapers
// Params 1, eflags: 0x0
// Checksum 0xddc2bc71, Offset: 0x488
// Size: 0x2c
function on_finalize_initialization(localclientnum) {
    waitframe(3);
    level function_7276b578();
}

// Namespace wz_open_skyscrapers/wz_open_skyscrapers
// Params 0, eflags: 0x0
// Checksum 0xf1a8f897, Offset: 0x4c0
// Size: 0x100
function function_7276b578() {
    a_ramps = getdynentarray("hmh_ramp");
    enabled = isdefined(getgametypesetting(#"wzheavymetalheroes")) && getgametypesetting(#"wzheavymetalheroes");
    if (isdefined(a_ramps)) {
        foreach (ramp in a_ramps) {
            if (isdefined(ramp)) {
                setdynentenabled(ramp, enabled);
            }
        }
    }
}

// Namespace wz_open_skyscrapers/wz_open_skyscrapers
// Params 0, eflags: 0x0
// Checksum 0x43e94cf2, Offset: 0x5c8
// Size: 0x110
function function_2560f130() {
    item_world::function_4de3ca98();
    a_ramps = getdynentarray("hmh_ramp");
    enabled = isdefined(getgametypesetting(#"wzheavymetalheroes")) && getgametypesetting(#"wzheavymetalheroes");
    if (isdefined(a_ramps)) {
        foreach (ramp in a_ramps) {
            if (isdefined(ramp)) {
                setdynentenabled(ramp, enabled);
            }
        }
    }
}

