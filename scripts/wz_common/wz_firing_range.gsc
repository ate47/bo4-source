// Atian COD Tools GSC decompiler test
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace wz_firing_range;

// Namespace wz_firing_range/wz_firing_range
// Params 1, eflags: 0x1 linked
// Checksum 0xb8f48ebe, Offset: 0x88
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
// Params 0, eflags: 0x5 linked
// Checksum 0x134ea81b, Offset: 0x148
// Size: 0x162
function private init_target() {
    self.hitindex = 1;
    if (!isdefined(self.target)) {
        return 0;
    }
    structs = [];
    var_3dc92b90 = 0;
    var_dc0e8c88 = struct::get(self.target, "targetname");
    struct = var_dc0e8c88;
    do {
        if (!isdefined(struct) || !isint(struct.script_int) || struct.script_int <= 0) {
            return 0;
        }
        structs[structs.size] = struct;
        var_3dc92b90 = var_3dc92b90 + struct.script_int;
        struct = struct::get(struct.target, "targetname");
    } while(struct != var_dc0e8c88);
    /#
        assert(structs.size == 2);
    #/
    self.structs = structs;
    self.var_3dc92b90 = var_3dc92b90;
    return 1;
}

// Namespace wz_firing_range/wz_firing_range
// Params 2, eflags: 0x5 linked
// Checksum 0xbc9b85e1, Offset: 0x2b8
// Size: 0x84
function private function_5bab934a(struct, var_d1d733b4) {
    var_32c844bb = var_d1d733b4 - gettime();
    if (var_32c844bb <= 0) {
        var_32c844bb = int(1 * 1000);
    }
    movetime = float(var_32c844bb) / 1000;
    return movetime;
}

// Namespace wz_firing_range/wz_firing_range
// Params 0, eflags: 0x5 linked
// Checksum 0x3a533aa, Offset: 0x348
// Size: 0x166
function private follow_path() {
    starttime = int(floor(gettime() / self.var_3dc92b90) * self.var_3dc92b90 + self.var_3dc92b90);
    while (gettime() < starttime) {
        waitframe(1);
    }
    endtime = starttime;
    while (1) {
        endtime = endtime + self.structs[0].script_int;
        movetime = function_5bab934a(self.structs[0], endtime);
        self function_49ed8678(self.structs[1].origin, movetime);
        wait(movetime);
        endtime = endtime + self.structs[1].script_int;
        movetime = function_5bab934a(self.structs[1], endtime);
        self function_49ed8678(self.structs[0].origin, movetime);
        wait(movetime);
    }
}

// Namespace wz_firing_range/event_cf200f34
// Params 1, eflags: 0x44
// Checksum 0xac4a61c7, Offset: 0x4b8
// Size: 0x1e6
function private event_handler[event_cf200f34] function_209450ae(eventstruct) {
    dynent = eventstruct.ent;
    if (!isdefined(dynent.hitindex)) {
        return;
    }
    dynent.health = 50;
    if (function_ffdbe8c2(dynent) != 0) {
        return;
    }
    angles = dynent.angles - vectorscale((0, 1, 0), 270);
    fwd = anglestoforward(angles);
    if (vectordot((0, 0, 0) - eventstruct.dir, fwd) <= 0) {
        return;
    }
    bundle = function_489009c1(dynent);
    if (isstruct(bundle) && isarray(bundle.dynentstates)) {
        var_daedea1b = bundle.dynentstates[dynent.hitindex];
        if (isdefined(var_daedea1b.stateanim)) {
            function_e2a06860(dynent, dynent.hitindex);
            animlength = getanimlength(var_daedea1b.stateanim);
            wait(animlength);
            function_e2a06860(dynent, 0);
            dynent.hitindex = 1 + dynent.hitindex % 2;
        }
    }
}

