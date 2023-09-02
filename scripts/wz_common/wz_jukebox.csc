// Atian COD Tools GSC decompiler test
#using scripts\mp_common\item_world.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\array_shared.csc;

#namespace wz_jukebox;

// Namespace wz_jukebox/wz_jukebox
// Params 0, eflags: 0x2
// Checksum 0x6ab56bfd, Offset: 0x98
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"wz_jukebox", &__init__, undefined, undefined);
}

// Namespace wz_jukebox/wz_jukebox
// Params 0, eflags: 0x2
// Checksum 0x6cb4ee34, Offset: 0xe0
// Size: 0xae
function autoexec __init() {
    level.var_8b13d130 = (isdefined(getgametypesetting(#"hash_3778ec3bd924f17c")) ? getgametypesetting(#"hash_3778ec3bd924f17c") : 0) && (isdefined(getgametypesetting(#"hash_6935c178012cf77e")) ? getgametypesetting(#"hash_6935c178012cf77e") : 0);
}

// Namespace wz_jukebox/wz_jukebox
// Params 0, eflags: 0x1 linked
// Checksum 0xb7beb90f, Offset: 0x198
// Size: 0x1c
function __init__() {
    level thread function_2bf3c36e();
}

// Namespace wz_jukebox/wz_jukebox
// Params 0, eflags: 0x1 linked
// Checksum 0x796fd175, Offset: 0x1c0
// Size: 0x198
function function_2bf3c36e() {
    dynents = getdynentarray("dynent_jukebox");
    foreach (jukebox in dynents) {
        jukebox.var_91058d39 = [];
    }
    if (!level.var_8b13d130) {
        waitframe(1);
        foreach (dynent in dynents) {
            setdynentenabled(dynent, 0);
        }
        item_world::function_4de3ca98();
        foreach (dynent in dynents) {
            setdynentenabled(dynent, 0);
        }
    }
}

// Namespace wz_jukebox/event_9673dc9a
// Params 1, eflags: 0x40
// Checksum 0x556ccb10, Offset: 0x360
// Size: 0x104
function event_handler[event_9673dc9a] function_3981d015(eventstruct) {
    if (isdefined(level.var_8b13d130) && !level.var_8b13d130) {
        if (eventstruct.ent.targetname === "dynent_jukebox") {
            setdynentenabled(eventstruct.ent, 0);
        }
        return;
    }
    if (eventstruct.ent.targetname === "dynent_jukebox") {
        if (eventstruct.state == 0 || eventstruct.state == 3) {
            eventstruct.ent thread jukebox_off();
        } else if (eventstruct.state == 2) {
            eventstruct.ent thread jukebox_on();
        }
    }
}

// Namespace wz_jukebox/wz_jukebox
// Params 0, eflags: 0x1 linked
// Checksum 0x6f583a49, Offset: 0x470
// Size: 0x46
function jukebox_off() {
    self notify(#"jukebox_off");
    if (isdefined(self.var_14da73bd)) {
        stopsound(self.var_14da73bd);
        self.var_14da73bd = undefined;
    }
}

// Namespace wz_jukebox/wz_jukebox
// Params 0, eflags: 0x1 linked
// Checksum 0xebc5d27b, Offset: 0x4c0
// Size: 0x212
function jukebox_on() {
    self endon(#"jukebox_off");
    var_96748cfb = (self.origin[0] + 32, self.origin[1] - 16, self.origin[2] + 64);
    if (isdefined(self.var_14da73bd)) {
        stopsound(self.var_14da73bd);
        self.var_14da73bd = undefined;
        waitframe(1);
    }
    if (isdefined(self.var_91058d39) && self.var_91058d39.size > 0) {
        var_49ef982c = randomint(self.var_91058d39.size);
        song = self.var_91058d39[var_49ef982c];
        arrayremoveindex(self.var_91058d39, var_49ef982c);
    } else {
        var_91058d39 = array(#"hash_38b88ac8a1bb9bca", #"hash_38b88bc8a1bb9d7d", #"hash_38b888c8a1bb9864", #"hash_38b889c8a1bb9a17", #"hash_38b886c8a1bb94fe", #"hash_38b887c8a1bb96b1");
        self.var_91058d39 = array::randomize(var_91058d39);
        var_49ef982c = randomint(self.var_91058d39.size);
        song = self.var_91058d39[var_49ef982c];
        arrayremoveindex(self.var_91058d39, var_49ef982c);
    }
    self.var_14da73bd = playsound(0, song, var_96748cfb);
}

