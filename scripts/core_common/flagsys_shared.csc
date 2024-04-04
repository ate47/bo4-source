// Atian COD Tools GSC decompiler test
#using scripts\core_common\util_shared.csc;

#namespace flagsys;

// Namespace flagsys/flagsys_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xf2fca391, Offset: 0x98
// Size: 0x3e
function set(str_flag) {
    if (!isdefined(self.flag)) {
        self.flag = [];
    }
    self.flag[str_flag] = 1;
    self notify(str_flag);
}

// Namespace flagsys/flagsys_shared
// Params 2, eflags: 0x0
// Checksum 0x3201cf69, Offset: 0xe0
// Size: 0x64
function set_for_time(n_time, str_flag) {
    self notify("__flag::set_for_time__" + str_flag);
    self endon("__flag::set_for_time__" + str_flag);
    set(str_flag);
    wait(n_time);
    clear(str_flag);
}

// Namespace flagsys/flagsys_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xf22c6980, Offset: 0x150
// Size: 0x64
function clear(str_flag) {
    if (isdefined(self) && isdefined(self.flag) && isdefined(self.flag[str_flag]) && self.flag[str_flag]) {
        self.flag[str_flag] = undefined;
        self notify(str_flag);
    }
}

// Namespace flagsys/flagsys_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xe45cb388, Offset: 0x1c0
// Size: 0x6c
function set_val(str_flag, b_val) {
    assert(isdefined(b_val), "<unknown string>");
    if (b_val) {
        set(str_flag);
        return;
    }
    clear(str_flag);
}

// Namespace flagsys/flagsys_shared
// Params 1, eflags: 0x0
// Checksum 0x39409572, Offset: 0x238
// Size: 0x3c
function toggle(str_flag) {
    set_val(str_flag, !get(str_flag));
}

// Namespace flagsys/flagsys_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x3321ad21, Offset: 0x280
// Size: 0x3c
function get(str_flag) {
    return isdefined(self.flag) && isdefined(self.flag[str_flag]) && self.flag[str_flag];
}

// Namespace flagsys/flagsys_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x85ba0cab, Offset: 0x2c8
// Size: 0x46
function wait_till(str_flag) {
    self endon(#"death");
    while (!get(str_flag)) {
        self waittill(str_flag);
    }
}

// Namespace flagsys/flagsys_shared
// Params 2, eflags: 0x0
// Checksum 0xc2b42d7a, Offset: 0x318
// Size: 0x84
function wait_till_timeout(n_timeout, str_flag) {
    if (isdefined(n_timeout)) {
        __s = spawnstruct();
        __s endon(#"timeout");
        __s util::delay_notify(n_timeout, "timeout");
    }
    wait_till(str_flag);
}

// Namespace flagsys/flagsys_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xeccb8265, Offset: 0x3a8
// Size: 0x84
function wait_till_all(a_flags) {
    self endon(#"death");
    for (i = 0; i < a_flags.size; i++) {
        str_flag = a_flags[i];
        if (!get(str_flag)) {
            self waittill(str_flag);
            i = -1;
        }
    }
}

// Namespace flagsys/flagsys_shared
// Params 2, eflags: 0x0
// Checksum 0xf0687552, Offset: 0x438
// Size: 0x84
function wait_till_all_timeout(n_timeout, a_flags) {
    if (isdefined(n_timeout)) {
        __s = spawnstruct();
        __s endon(#"timeout");
        __s util::delay_notify(n_timeout, "timeout");
    }
    wait_till_all(a_flags);
}

// Namespace flagsys/flagsys_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x171f3f0c, Offset: 0x4c8
// Size: 0xa4
function wait_till_any(a_flags) {
    self endon(#"death");
    foreach (flag in a_flags) {
        if (get(flag)) {
            return flag;
        }
    }
    self waittill(a_flags);
}

// Namespace flagsys/flagsys_shared
// Params 2, eflags: 0x0
// Checksum 0xe38560c0, Offset: 0x578
// Size: 0x84
function wait_till_any_timeout(n_timeout, a_flags) {
    if (isdefined(n_timeout)) {
        __s = spawnstruct();
        __s endon(#"timeout");
        __s util::delay_notify(n_timeout, "timeout");
    }
    wait_till_any(a_flags);
}

// Namespace flagsys/flagsys_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xd9b64fca, Offset: 0x608
// Size: 0x46
function wait_till_clear(str_flag) {
    self endon(#"death");
    while (get(str_flag)) {
        self waittill(str_flag);
    }
}

// Namespace flagsys/flagsys_shared
// Params 2, eflags: 0x0
// Checksum 0x64ce8b3e, Offset: 0x658
// Size: 0x84
function wait_till_clear_timeout(n_timeout, str_flag) {
    if (isdefined(n_timeout)) {
        __s = spawnstruct();
        __s endon(#"timeout");
        __s util::delay_notify(n_timeout, "timeout");
    }
    wait_till_clear(str_flag);
}

// Namespace flagsys/flagsys_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xca317c70, Offset: 0x6e8
// Size: 0x84
function wait_till_clear_all(a_flags) {
    self endon(#"death");
    for (i = 0; i < a_flags.size; i++) {
        str_flag = a_flags[i];
        if (get(str_flag)) {
            self waittill(str_flag);
            i = -1;
        }
    }
}

// Namespace flagsys/flagsys_shared
// Params 2, eflags: 0x0
// Checksum 0x2959f759, Offset: 0x778
// Size: 0x84
function wait_till_clear_all_timeout(n_timeout, a_flags) {
    if (isdefined(n_timeout)) {
        __s = spawnstruct();
        __s endon(#"timeout");
        __s util::delay_notify(n_timeout, "timeout");
    }
    wait_till_clear_all(a_flags);
}

// Namespace flagsys/flagsys_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x33b500f7, Offset: 0x808
// Size: 0xb0
function wait_till_clear_any(a_flags) {
    self endon(#"death");
    while (true) {
        foreach (flag in a_flags) {
            if (!get(flag)) {
                return flag;
            }
        }
        self waittill(a_flags);
    }
}

// Namespace flagsys/flagsys_shared
// Params 2, eflags: 0x0
// Checksum 0x9c55a437, Offset: 0x8c0
// Size: 0x84
function wait_till_clear_any_timeout(n_timeout, a_flags) {
    if (isdefined(n_timeout)) {
        __s = spawnstruct();
        __s endon(#"timeout");
        __s util::delay_notify(n_timeout, "timeout");
    }
    wait_till_clear_any(a_flags);
}

// Namespace flagsys/flagsys_shared
// Params 1, eflags: 0x0
// Checksum 0xb58d2165, Offset: 0x950
// Size: 0x24
function delete(str_flag) {
    clear(str_flag);
}

