#using scripts\mp_common\item_world;
#using scripts\core_common\player\player_stats;

#namespace wz_jukebox;

// Namespace wz_jukebox/wz_jukebox
// Params 0, eflags: 0x2
// Checksum 0xc559f4c1, Offset: 0x90
// Size: 0xae
function autoexec __init() {
    level.var_8b13d130 = (isdefined(getgametypesetting(#"hash_3778ec3bd924f17c")) ? getgametypesetting(#"hash_3778ec3bd924f17c") : 0) && (isdefined(getgametypesetting(#"hash_6935c178012cf77e")) ? getgametypesetting(#"hash_6935c178012cf77e") : 0);
}

// Namespace wz_jukebox/level_init
// Params 1, eflags: 0x40
// Checksum 0xb9f6848b, Offset: 0x148
// Size: 0x24
function event_handler[level_init] main(eventstruct) {
    level thread function_2bf3c36e();
}

// Namespace wz_jukebox/wz_jukebox
// Params 0, eflags: 0x1 linked
// Checksum 0x8445301b, Offset: 0x178
// Size: 0x1a0
function function_2bf3c36e() {
    dynents = getdynentarray("dynent_jukebox");
    if (level.var_8b13d130) {
        foreach (dynent in dynents) {
            dynent.onuse = &function_1f3a1c47;
        }
        return;
    }
    waitframe(1);
    foreach (dynent in dynents) {
        setdynentenabled(dynent, 0);
    }
    item_world::function_4de3ca98();
    foreach (dynent in dynents) {
        setdynentenabled(dynent, 0);
    }
}

// Namespace wz_jukebox/wz_jukebox
// Params 3, eflags: 0x1 linked
// Checksum 0x4500372, Offset: 0x320
// Size: 0x64
function function_1f3a1c47(activator, laststate, state) {
    if (isdefined(activator)) {
        if (!level.inprematchperiod && laststate === 0) {
            activator stats::function_d40764f3(#"activation_count_jukebox", 1);
        }
    }
}

// Namespace wz_jukebox/event_9673dc9a
// Params 1, eflags: 0x40
// Checksum 0xeb1c1c77, Offset: 0x390
// Size: 0xec
function event_handler[event_9673dc9a] function_3981d015(eventstruct) {
    if (isdefined(level.var_8b13d130) && !level.var_8b13d130) {
        if (eventstruct.ent.targetname === "dynent_jukebox") {
            setdynentenabled(eventstruct.ent, 0);
        }
        return;
    }
    if (eventstruct.ent.targetname === "dynent_jukebox") {
        if (eventstruct.state == 1) {
            eventstruct.ent thread function_d143760c();
        }
        if (eventstruct.state == 3) {
            eventstruct.ent thread function_b55a0a4();
        }
    }
}

// Namespace wz_jukebox/wz_jukebox
// Params 0, eflags: 0x1 linked
// Checksum 0xf1d3a7e8, Offset: 0x488
// Size: 0x24
function function_d143760c() {
    wait 2;
    function_e2a06860(self, 2);
}

// Namespace wz_jukebox/wz_jukebox
// Params 0, eflags: 0x1 linked
// Checksum 0xa12f714f, Offset: 0x4b8
// Size: 0x24
function function_b55a0a4() {
    wait 2;
    function_e2a06860(self, 1);
}

