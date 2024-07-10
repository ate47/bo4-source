#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\audio_shared.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\exploder_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace wz_array_broadcast;

// Namespace wz_array_broadcast/wz_array_broadcast
// Params 0, eflags: 0x2
// Checksum 0xad0aaf72, Offset: 0x130
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"wz_array_broadcast", &__init__, undefined, undefined);
}

// Namespace wz_array_broadcast/wz_array_broadcast
// Params 0, eflags: 0x2
// Checksum 0xe28b89f8, Offset: 0x178
// Size: 0xae
function autoexec __init() {
    level.var_47f205b = (isdefined(getgametypesetting(#"hash_3778ec3bd924f17c")) ? getgametypesetting(#"hash_3778ec3bd924f17c") : 0) && (isdefined(getgametypesetting(#"hash_24e281e778894ac9")) ? getgametypesetting(#"hash_24e281e778894ac9") : 0);
}

// Namespace wz_array_broadcast/wz_array_broadcast
// Params 0, eflags: 0x1 linked
// Checksum 0x49684fed, Offset: 0x230
// Size: 0x1e
function __init__() {
    level.var_15a926e9 = 0;
    level.var_c055f451 = 0;
}

// Namespace wz_array_broadcast/event_9673dc9a
// Params 1, eflags: 0x40
// Checksum 0xa08e70f8, Offset: 0x258
// Size: 0x2d4
function event_handler[event_9673dc9a] function_3981d015(eventstruct) {
    if (isdefined(level.var_47f205b) && !level.var_47f205b) {
        return;
    }
    if (eventstruct.ent.targetname === "array_broadcast") {
        if (eventstruct.state === 0) {
            eventstruct.ent thread broadcast_off();
            return;
        }
        if (eventstruct.state === 1 || eventstruct.state === 2) {
            waitframe(1);
            if (level clientfield::get("array_broadcast") == 1) {
                if (level.var_c055f451 == 1) {
                    if (level.var_15a926e9 == 0) {
                        level thread function_bf805b3d();
                    }
                } else if (level.var_15a926e9 == 0) {
                    level thread function_fb90d490();
                }
                return;
            }
            if (level.var_c055f451 == 0) {
                level.var_c055f451 = 1;
                exploder::exploder(#"fxexp_radar_activation");
                playsound(0, "evt_power_up", (4292, 18990, 6528));
                var_d7987998 = struct::get_array("amb_local_alarm", "targetname");
                foreach (struct in var_d7987998) {
                    struct thread function_72e8e600();
                    waitframe(1);
                }
                wait(20);
                playsound(0, "evt_broadcast_alarm", (4292, 18990, 6528));
                wait(2);
                playsound(0, "evt_broadcast_alarm", (4292, 18990, 6528));
                eventstruct.ent thread function_44e1ce2e(0);
            }
        }
    }
}

// Namespace wz_array_broadcast/wz_array_broadcast
// Params 0, eflags: 0x1 linked
// Checksum 0x5cc568e1, Offset: 0x538
// Size: 0x44
function function_bf805b3d() {
    level.var_15a926e9 = 1;
    while (level.var_c055f451 == 1) {
        waitframe(1);
    }
    level thread function_fb90d490();
}

// Namespace wz_array_broadcast/wz_array_broadcast
// Params 0, eflags: 0x1 linked
// Checksum 0x972c6195, Offset: 0x588
// Size: 0xc8
function function_fb90d490() {
    level.var_15a926e9 = 2;
    var_5be26843 = struct::get_array("array_emergency_broadcast", "targetname");
    foreach (struct in var_5be26843) {
        playsound(0, #"hash_6086b2f61672a07e", struct.origin);
    }
}

// Namespace wz_array_broadcast/wz_array_broadcast
// Params 0, eflags: 0x1 linked
// Checksum 0x7396dbd1, Offset: 0x658
// Size: 0x1a0
function broadcast_off() {
    self notify(#"broadcast_off");
    var_5be26843 = struct::get_array("array_emergency_broadcast", "targetname");
    foreach (struct in var_5be26843) {
        audio::stoploopat(#"hash_39c8dfc4efa25b26", struct.origin);
    }
    exploder::kill_exploder("fxexp_radar_activation");
    foreach (struct in var_5be26843) {
        struct notify(#"broadcast_off");
        audio::stoploopat(#"hash_39c8dfc4efa25b26", struct.origin);
        if (isdefined(struct.var_7a993bec)) {
            stopsound(struct.var_7a993bec);
        }
    }
}

// Namespace wz_array_broadcast/wz_array_broadcast
// Params 1, eflags: 0x1 linked
// Checksum 0x75794212, Offset: 0x800
// Size: 0x696
function function_44e1ce2e(var_ffe2b6da = 0) {
    var_5be26843 = struct::get_array("array_emergency_broadcast", "targetname");
    foreach (struct in var_5be26843) {
        if (var_ffe2b6da == 0) {
            audio::playloopat(#"hash_39c8dfc4efa25b26", struct.origin);
        }
    }
    wait(30);
    self endon(#"broadcast_off");
    var_5be26843 = struct::get_array("array_emergency_broadcast", "targetname");
    foreach (struct in var_5be26843) {
        audio::playloopat(#"hash_39c8dfc4efa25b26", struct.origin);
    }
    wait(3);
    if (isdefined(getgametypesetting(#"wzzombieapocalypse")) && getgametypesetting(#"wzzombieapocalypse")) {
        while (var_ffe2b6da < 8) {
            foreach (struct in var_5be26843) {
                if (var_ffe2b6da == 0) {
                    struct.var_7a993bec = playsound(0, #"hash_6ee08a10b9c18ba7", struct.origin);
                    continue;
                }
                sound_id = var_ffe2b6da - 1;
                sound_alias = #"hash_5ae0628f3d30469e" + sound_id;
                struct.var_7a993bec = playsound(0, sound_alias, struct.origin);
            }
            var_e668b651 = 0;
            while (!var_e668b651) {
                var_20d3ff69 = 0;
                foreach (struct in var_5be26843) {
                    if (isdefined(struct.var_7a993bec) && soundplaying(struct.var_7a993bec)) {
                        var_20d3ff69 = 1;
                        break;
                    }
                }
                if (!var_20d3ff69) {
                    var_e668b651 = 1;
                }
                wait(1);
            }
            wait(1);
            var_ffe2b6da++;
            struct.var_7a993bec = playsound(0, #"hash_6ee08a10b9c18ba7", struct.origin);
        }
    } else {
        while (var_ffe2b6da < 5) {
            foreach (struct in var_5be26843) {
                if (var_ffe2b6da == 0) {
                    struct.var_7a993bec = playsound(0, #"hash_6ee08a10b9c18ba7", struct.origin);
                    continue;
                }
                sound_id = var_ffe2b6da - 1;
                sound_alias = #"hash_59821865a3dff39c" + sound_id;
                struct.var_7a993bec = playsound(0, sound_alias, struct.origin);
            }
            var_e668b651 = 0;
            while (!var_e668b651) {
                var_20d3ff69 = 0;
                foreach (struct in var_5be26843) {
                    if (isdefined(struct.var_7a993bec) && soundplaying(struct.var_7a993bec)) {
                        var_20d3ff69 = 1;
                        break;
                    }
                }
                if (!var_20d3ff69) {
                    var_e668b651 = 1;
                }
                wait(1);
            }
            wait(1);
            var_ffe2b6da++;
            struct.var_7a993bec = playsound(0, #"hash_6ee08a10b9c18ba7", struct.origin);
        }
    }
    wait(10);
    foreach (struct in var_5be26843) {
        audio::stoploopat(#"hash_39c8dfc4efa25b26", struct.origin);
    }
    level.var_c055f451 = 2;
}

// Namespace wz_array_broadcast/wz_array_broadcast
// Params 0, eflags: 0x1 linked
// Checksum 0xedf69448, Offset: 0xea0
// Size: 0x74
function function_72e8e600() {
    for (loopcount = 0; loopcount < 10; loopcount++) {
        wait(randomintrange(1, 2));
        playsound(0, #"hash_7e2183e61d5335a8", self.origin);
        wait(3);
    }
}

