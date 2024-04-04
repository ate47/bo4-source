// Atian COD Tools GSC decompiler test
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace flagsys;

// Namespace flagsys/flagsys_shared
// Params 0, eflags: 0x2
// Checksum 0x256d21c, Offset: 0xa0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"flagsys", &__init__, undefined, undefined);
}

// Namespace flagsys/flagsys_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xed35aec, Offset: 0xe8
// Size: 0x1c
function __init__() {
    level thread update_flag_dvars();
}

// Namespace flagsys/flagsys_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xa9fc5d8d, Offset: 0x110
// Size: 0xd0
function update_flag_dvars() {
    while (true) {
        if (isdefined(level.flag_dvars)) {
            foreach (str_dvar in level.flag_dvars) {
                set_val(str_dvar, getdvarint(str_dvar, 0));
            }
        }
        wait(randomfloatrange(0.666667, 1.33333));
    }
}

// Namespace flagsys/flagsys_shared
// Params 1, eflags: 0x0
// Checksum 0xd280bae, Offset: 0x1e8
// Size: 0xb2
function init_dvar(str_dvar) {
    if (!isdefined(level.flag_dvars)) {
        level.flag_dvars = [];
    } else if (!isarray(level.flag_dvars)) {
        level.flag_dvars = array(level.flag_dvars);
    }
    if (!isinarray(level.flag_dvars, str_dvar)) {
        level.flag_dvars[level.flag_dvars.size] = str_dvar;
    }
}

// Namespace flagsys/flagsys_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x7b83d3b6, Offset: 0x2a8
// Size: 0x3e
function set(str_flag) {
    if (!isdefined(self.flag)) {
        self.flag = [];
    }
    self.flag[str_flag] = 1;
    self notify(str_flag);
}

// Namespace flagsys/flagsys_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xf0887d4c, Offset: 0x2f0
// Size: 0x6c
function increment(str_flag) {
    if (!isdefined(self.flag_count)) {
        self.flag_count = [];
    }
    if (!isdefined(self.flag_count[str_flag])) {
        self.flag_count[str_flag] = 0;
    }
    self.flag_count[str_flag]++;
    set(str_flag);
}

// Namespace flagsys/flagsys_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x3a1d7796, Offset: 0x368
// Size: 0x9c
function decrement(str_flag) {
    assert(isdefined(self.flag_count) && isdefined(self.flag_count[str_flag]) && self.flag_count[str_flag] > 0, "<unknown string>");
    self.flag_count[str_flag]--;
    if (self.flag_count[str_flag] == 0) {
        clear(str_flag);
    }
}

// Namespace flagsys/flagsys_shared
// Params 2, eflags: 0x0
// Checksum 0x33e273c4, Offset: 0x410
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
// Checksum 0x4411c3b1, Offset: 0x480
// Size: 0x64
function clear(str_flag) {
    if (isdefined(self) && isdefined(self.flag) && isdefined(self.flag[str_flag]) && self.flag[str_flag]) {
        self.flag[str_flag] = undefined;
        self notify(str_flag);
    }
}

// Namespace flagsys/flagsys_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x332772c8, Offset: 0x4f0
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
// Checksum 0xb8ed2adb, Offset: 0x568
// Size: 0x3c
function toggle(str_flag) {
    set_val(str_flag, !get(str_flag));
}

// Namespace flagsys/flagsys_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x13a93454, Offset: 0x5b0
// Size: 0x3c
function get(str_flag) {
    return isdefined(self.flag) && isdefined(self.flag[str_flag]) && self.flag[str_flag];
}

// Namespace flagsys/flagsys_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xa4d87f59, Offset: 0x5f8
// Size: 0x46
function wait_till(str_flag) {
    self endon(#"death");
    while (!get(str_flag)) {
        self waittill(str_flag);
    }
}

// Namespace flagsys/flagsys_shared
// Params 2, eflags: 0x0
// Checksum 0x31f7e990, Offset: 0x648
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
// Checksum 0x61355a1d, Offset: 0x6d8
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
// Checksum 0xb0b96f4d, Offset: 0x768
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
// Checksum 0x2a78f8e5, Offset: 0x7f8
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
// Checksum 0x1cca9027, Offset: 0x8a8
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
// Checksum 0x3f4725fb, Offset: 0x938
// Size: 0x46
function wait_till_clear(str_flag) {
    self endon(#"death");
    while (get(str_flag)) {
        self waittill(str_flag);
    }
}

// Namespace flagsys/flagsys_shared
// Params 2, eflags: 0x0
// Checksum 0xb94262e2, Offset: 0x988
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
// Checksum 0x2b79dcff, Offset: 0xa18
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
// Checksum 0x78efa4ad, Offset: 0xaa8
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
// Checksum 0xde17a66d, Offset: 0xb38
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
// Checksum 0xa506f601, Offset: 0xbf0
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
// Checksum 0x98be8961, Offset: 0xc80
// Size: 0x24
function delete(str_flag) {
    clear(str_flag);
}

// Namespace flagsys/flagsys_shared
// Params 0, eflags: 0x0
// Checksum 0x95c40981, Offset: 0xcb0
// Size: 0x34
function script_flag_wait() {
    if (isdefined(self.script_flag_wait)) {
        self wait_till(self.script_flag_wait);
        return true;
    }
    return false;
}

