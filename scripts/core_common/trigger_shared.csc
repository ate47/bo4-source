// Atian COD Tools GSC decompiler test
#namespace trigger;

// Namespace trigger/trigger_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x46ebe4fd, Offset: 0x78
// Size: 0x11c
function function_521edc64(ent, on_enter_payload, on_exit_payload) {
    ent endon(#"death");
    if (!isdefined(self)) {
        return;
    }
    var_f911c758 = self getentitynumber();
    if (ent ent_already_in(var_f911c758)) {
        return;
    }
    add_to_ent(ent, var_f911c758);
    if (isdefined(on_enter_payload)) {
        [[ on_enter_payload ]](ent);
    }
    while (isdefined(ent) && isdefined(self) && ent istouching(self)) {
        waitframe(1);
    }
    if (isdefined(ent)) {
        if (isdefined(on_exit_payload)) {
            [[ on_exit_payload ]](ent);
        }
        remove_from_ent(ent, var_f911c758);
    }
}

// Namespace trigger/trigger_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x95b2cf1, Offset: 0x1a0
// Size: 0x4c
function ent_already_in(var_d35ff8d8) {
    if (!isdefined(self._triggers)) {
        return 0;
    }
    if (!isdefined(self._triggers[var_d35ff8d8])) {
        return 0;
    }
    if (!self._triggers[var_d35ff8d8]) {
        return 0;
    }
    return 1;
}

// Namespace trigger/trigger_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x6ae6433d, Offset: 0x1f8
// Size: 0x4a
function add_to_ent(ent, var_d35ff8d8) {
    if (!isdefined(ent._triggers)) {
        ent._triggers = [];
    }
    ent._triggers[var_d35ff8d8] = 1;
}

// Namespace trigger/trigger_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xf34b89c6, Offset: 0x250
// Size: 0x56
function remove_from_ent(ent, var_d35ff8d8) {
    if (!isdefined(ent._triggers)) {
        return;
    }
    if (!isdefined(ent._triggers[var_d35ff8d8])) {
        return;
    }
    ent._triggers[var_d35ff8d8] = 0;
}

// Namespace trigger/trigger_shared
// Params 2, eflags: 0x0
// Checksum 0x3629d895, Offset: 0x2b0
// Size: 0x4c
function death_monitor(ent, ender) {
    ent waittill(#"death");
    self endon(ender);
    self remove_from_ent(ent);
}

// Namespace trigger/trigger_shared
// Params 1, eflags: 0x0
// Checksum 0x5fa06046, Offset: 0x308
// Size: 0x7c
function trigger_wait(n_clientnum) {
    self endon(#"trigger");
    if (isdefined(self.targetname)) {
        trig = getent(n_clientnum, self.targetname, "target");
        if (isdefined(trig)) {
            trig waittill(#"trigger");
        }
    }
}
