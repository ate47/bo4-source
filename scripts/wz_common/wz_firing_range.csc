// Atian COD Tools GSC decompiler test
#using scripts\core_common\struct.csc;

#namespace wz_firing_range;

// Namespace wz_firing_range/wz_firing_range
// Params 1, eflags: 0x0
// Checksum 0xe585e823, Offset: 0x80
// Size: 0xb8
function init_targets(targetname) {
    targets = getdynentarray(targetname);
    foreach (target in targets) {
        if (target init_target()) {
            target thread follow_path();
        }
    }
}

// Namespace wz_firing_range/wz_firing_range
// Params 0, eflags: 0x4
// Checksum 0x72974d9a, Offset: 0x140
// Size: 0x152
function private init_target() {
    if (!isdefined(self.target)) {
        return false;
    }
    structs = [];
    totalms = 0;
    var_dc0e8c88 = struct::get(self.target, "targetname");
    struct = var_dc0e8c88;
    do {
        if (!isdefined(struct) || !isint(struct.script_int) || struct.script_int <= 0) {
            return false;
        }
        structs[structs.size] = struct;
        totalms = totalms + struct.script_int;
        struct = struct::get(struct.target, "targetname");
    } while (struct != var_dc0e8c88);
    /#
        assert(structs.size == 2);
    #/
    self.structs = structs;
    self.totalms = totalms;
    return true;
}

// Namespace wz_firing_range/wz_firing_range
// Params 2, eflags: 0x4
// Checksum 0x4baa7e07, Offset: 0x2a0
// Size: 0x94
function private function_5bab934a(struct, var_d1d733b4) {
    var_32c844bb = var_d1d733b4 - getservertime(0);
    if (var_32c844bb <= 0) {
        var_32c844bb = int(1 * 1000);
    }
    movetime = float(var_32c844bb) / 1000;
    return movetime;
}

// Namespace wz_firing_range/wz_firing_range
// Params 0, eflags: 0x4
// Checksum 0xa521a7ad, Offset: 0x340
// Size: 0x1e0
function private follow_path() {
    starttime = int(floor(getservertime(0) / self.totalms) * self.totalms + self.totalms);
    while (getservertime(0) < starttime) {
        waitframe(1);
    }
    endtime = starttime;
    while (true) {
        endtime = endtime + self.structs[0].script_int;
        movetime = function_5bab934a(self.structs[0], endtime);
        self function_49ed8678(self.structs[1].origin, movetime);
        wait(movetime);
        playsound(0, #"amb_target_stop", self.origin);
        endtime = endtime + self.structs[1].script_int;
        movetime = function_5bab934a(self.structs[1], endtime);
        self function_49ed8678(self.structs[0].origin, movetime);
        wait(movetime);
        playsound(0, #"amb_target_stop", self.origin);
    }
}

