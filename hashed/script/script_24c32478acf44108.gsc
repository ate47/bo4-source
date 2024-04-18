// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_utility.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\ai\systems\gib.gsc;

#namespace namespace_9ff9f642;

// Namespace namespace_9ff9f642/namespace_9ff9f642
// Params 0, eflags: 0x2
// Checksum 0xe174c7b0, Offset: 0xb0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_308dff40d53a7287", &__init__, undefined, undefined);
}

// Namespace namespace_9ff9f642/namespace_9ff9f642
// Params 0, eflags: 0x1 linked
// Checksum 0x751e3aa2, Offset: 0xf8
// Size: 0x44
function __init__() {
    clientfield::register("actor", "" + #"hash_419c1c8da4dc53a9", 1, 1, "int");
}

// Namespace namespace_9ff9f642/namespace_9ff9f642
// Params 5, eflags: 0x1 linked
// Checksum 0x84bf40d4, Offset: 0x148
// Size: 0x1a4
function register_burn(str_type, n_dps, n_duration, var_f472bfc, var_5713c703) {
    if (!isdefined(level.var_981dd9cf)) {
        level.var_981dd9cf = [];
    } else if (!isarray(level.var_981dd9cf)) {
        level.var_981dd9cf = array(level.var_981dd9cf);
    }
    if (!isdefined(level.var_981dd9cf[#"burn"])) {
        level.var_981dd9cf[#"burn"] = [];
    } else if (!isarray(level.var_981dd9cf[#"burn"])) {
        level.var_981dd9cf[#"burn"] = array(level.var_981dd9cf[#"burn"]);
    }
    level.var_981dd9cf[#"burn"][str_type] = {#n_dps:n_dps, #n_duration:n_duration, #var_f472bfc:var_f472bfc, #var_5713c703:var_5713c703};
}

// Namespace namespace_9ff9f642/namespace_9ff9f642
// Params 4, eflags: 0x1 linked
// Checksum 0xf7e630, Offset: 0x2f8
// Size: 0x2d4
function burn(str_type, e_attacker, weapon, var_477abb8f) {
    if (isdefined(self.var_38255de6) && self.var_38255de6) {
        return;
    }
    if (!isdefined(level.var_981dd9cf) || !isdefined(level.var_981dd9cf[#"burn"]) || !isdefined(level.var_981dd9cf[#"burn"][str_type])) {
        assertmsg("<unknown string>" + str_type + "<unknown string>");
        return;
    }
    if (!isdefined(self.var_88421cc2)) {
        self.var_88421cc2 = [];
    } else if (!isarray(self.var_88421cc2)) {
        self.var_88421cc2 = array(self.var_88421cc2);
    }
    var_cfb3f538 = 0;
    if (!self.var_88421cc2.size) {
        var_cfb3f538 = 1;
    }
    s_burn = level.var_981dd9cf[#"burn"][str_type];
    if (!isdefined(self.var_88421cc2[str_type])) {
        self.var_88421cc2[str_type] = {#n_time_remaining:s_burn.n_duration, #e_owner:e_attacker, #weapon:weapon, #var_477abb8f:var_477abb8f};
    } else {
        if (self.var_88421cc2[str_type].n_time_remaining < s_burn.n_duration) {
            self.var_88421cc2[str_type].n_time_remaining = s_burn.n_duration;
        }
        if (isdefined(var_477abb8f)) {
            if (!isdefined(self.var_88421cc2[str_type].var_477abb8f) || self.var_88421cc2[str_type].var_477abb8f != var_477abb8f) {
                self.var_88421cc2[str_type].var_477abb8f = var_477abb8f;
            }
        } else if (isdefined(self.var_88421cc2[str_type].var_477abb8f)) {
            self.var_88421cc2[str_type].var_477abb8f = undefined;
        }
    }
    if (var_cfb3f538) {
        self thread function_8aefaae3(s_burn);
    }
}

// Namespace namespace_9ff9f642/namespace_9ff9f642
// Params 1, eflags: 0x5 linked
// Checksum 0x70a9a087, Offset: 0x5d8
// Size: 0x382
function private function_8aefaae3(s_burn) {
    level endon(#"end_game");
    self endoncallback(&function_fc2a294, #"death");
    if (isdefined(self.archetype)) {
        if (isdefined(s_burn.var_f472bfc)) {
            str_clientfield = s_burn.var_f472bfc;
        } else {
            str_clientfield = "" + #"hash_419c1c8da4dc53a9";
        }
        self clientfield::set(str_clientfield, 1);
        self.var_a2bceb12 = str_clientfield;
        if (isdefined(s_burn.var_5713c703)) {
            self.var_fa03f342 = s_burn.var_5713c703;
        }
    }
    while (true) {
        wait(1);
        n_total_damage = 0;
        var_25c61d06 = 0;
        var_2af3b934 = undefined;
        weapon = undefined;
        foreach (str_type, var_39d0f0a8 in self.var_88421cc2) {
            if (!isdefined(var_2af3b934)) {
                var_2af3b934 = var_39d0f0a8.e_owner;
            }
            if (!isdefined(weapon)) {
                weapon = var_39d0f0a8.weapon;
            }
            n_damage = 0;
            n_time_remaining = var_39d0f0a8.n_time_remaining;
            if (isdefined(var_39d0f0a8.var_477abb8f)) {
                n_dps = var_39d0f0a8.var_477abb8f;
            } else {
                n_dps = level.var_981dd9cf[#"burn"][str_type].n_dps;
            }
            if (n_time_remaining > 1) {
                var_39d0f0a8.n_time_remaining -= 1;
                n_damage = n_dps * 1;
            } else if (n_time_remaining > 0) {
                var_39d0f0a8.n_time_remaining = 0;
                n_damage = n_dps * n_time_remaining;
            }
            if (n_damage > var_25c61d06) {
                var_25c61d06 = n_damage;
                var_2af3b934 = var_39d0f0a8.e_owner;
                weapon = var_39d0f0a8.weapon;
            }
            n_total_damage += n_damage;
            if (var_39d0f0a8.n_time_remaining <= 0) {
                self.var_88421cc2[str_type] = undefined;
            }
        }
        arrayremovevalue(self.var_88421cc2, undefined, 1);
        if (n_total_damage) {
            self dodamage(n_total_damage, self.origin, var_2af3b934, undefined, "none", "MOD_BURNED", 0, weapon);
        }
        if (!self.var_88421cc2.size) {
            self function_fc2a294();
            return;
        }
    }
}

// Namespace namespace_9ff9f642/namespace_9ff9f642
// Params 0, eflags: 0x0
// Checksum 0xc38b3d11, Offset: 0x968
// Size: 0x12
function function_5e9ef773() {
    self.var_38255de6 = 1;
}

// Namespace namespace_9ff9f642/namespace_9ff9f642
// Params 1, eflags: 0x5 linked
// Checksum 0x9434bf47, Offset: 0x988
// Size: 0x72
function private function_fc2a294(var_c34665fc) {
    if (isdefined(self.archetype)) {
        if (isdefined(self.var_a2bceb12)) {
            self clientfield::set(self.var_a2bceb12, 0);
            self.var_a2bceb12 = undefined;
        }
        if (isdefined(self.var_fa03f342) && !isdefined(var_c34665fc)) {
            self.var_fa03f342 = undefined;
        }
    }
}

// Namespace namespace_9ff9f642/namespace_9ff9f642
// Params 0, eflags: 0x1 linked
// Checksum 0xf7499ae1, Offset: 0xa08
// Size: 0xee
function freeze() {
    if (!isactor(self)) {
        return;
    }
    if (!isalive(self)) {
        return;
    }
    if (isdefined(self.var_b030dabb)) {
        self.var_b030dabb.n_count++;
    } else {
        self.var_b030dabb = {#n_count:1, #b_ignore_cleanup:self.b_ignore_cleanup, #var_dbcf9b4b:self.is_inert};
    }
    self thread function_bf97ba95();
    self setentitypaused(1);
    self.b_ignore_cleanup = 1;
    self.is_inert = 1;
}

// Namespace namespace_9ff9f642/namespace_9ff9f642
// Params 0, eflags: 0x1 linked
// Checksum 0xcf08d412, Offset: 0xb00
// Size: 0xba
function unfreeze() {
    if (!isactor(self)) {
        return;
    }
    self notify(#"hash_55e2fa9139b08b3e");
    var_b030dabb = self.var_b030dabb;
    if (!isdefined(var_b030dabb)) {
        return;
    }
    var_b030dabb.n_count--;
    if (var_b030dabb.n_count == 0) {
        self setentitypaused(0);
        self.is_inert = var_b030dabb.var_dbcf9b4b;
        self.b_ignore_cleanup = var_b030dabb.b_ignore_cleanup;
        self.var_b030dabb = undefined;
    }
}

// Namespace namespace_9ff9f642/namespace_9ff9f642
// Params 0, eflags: 0x5 linked
// Checksum 0x5f527f8c, Offset: 0xbc8
// Size: 0x9c
function private function_bf97ba95() {
    self notify(#"hash_55e2fa9139b08b3e");
    self endon(#"hash_55e2fa9139b08b3e");
    self waittill(#"death");
    if (isdefined(self) && self ispaused()) {
        self setentitypaused(0);
        if (!self isragdoll()) {
            self startragdoll();
        }
    }
}

// Namespace namespace_9ff9f642/namespace_9ff9f642
// Params 4, eflags: 0x0
// Checksum 0x88437e65, Offset: 0xc70
// Size: 0x220
function function_865a83f8(zombie, target, predictedpos, var_95342913) {
    if (isdefined(zombie.knockdown) && zombie.knockdown || isdefined(zombie.pushed) && zombie.pushed) {
        return false;
    }
    if (gibserverutils::isgibbed(zombie, 384)) {
        return false;
    }
    checkpos = zombie.origin;
    if (!isactor(target)) {
        checkpos = zombie getcentroid();
        var_95342913 = 64;
    }
    var_caa95837 = var_95342913 * var_95342913;
    distsq = distancesquared(predictedpos, checkpos);
    if (distsq > var_caa95837) {
        return false;
    }
    origin = target.origin;
    facingvec = anglestoforward(target.angles);
    enemyvec = zombie.origin - origin;
    var_3e3c8075 = (enemyvec[0], enemyvec[1], 0);
    var_c2ee8451 = (facingvec[0], facingvec[1], 0);
    var_3e3c8075 = vectornormalize(var_3e3c8075);
    var_c2ee8451 = vectornormalize(var_c2ee8451);
    enemydot = vectordot(var_c2ee8451, var_3e3c8075);
    if (enemydot < 0) {
        return false;
    }
    return true;
}

// Namespace namespace_9ff9f642/namespace_9ff9f642
// Params 3, eflags: 0x1 linked
// Checksum 0x2846bda6, Offset: 0xe98
// Size: 0x184
function register_slowdown(str_type, n_rate, n_duration = -1) {
    if (!isdefined(level.var_981dd9cf)) {
        level.var_981dd9cf = [];
    } else if (!isarray(level.var_981dd9cf)) {
        level.var_981dd9cf = array(level.var_981dd9cf);
    }
    if (!isdefined(level.var_981dd9cf[#"slow"])) {
        level.var_981dd9cf[#"slow"] = [];
    } else if (!isarray(level.var_981dd9cf[#"slow"])) {
        level.var_981dd9cf[#"slow"] = array(level.var_981dd9cf[#"slow"]);
    }
    level.var_981dd9cf[#"slow"][str_type] = {#n_rate:n_rate, #n_duration:n_duration};
}

// Namespace namespace_9ff9f642/namespace_9ff9f642
// Params 2, eflags: 0x1 linked
// Checksum 0xa66e3c3e, Offset: 0x1028
// Size: 0x4a4
function slowdown(str_type, var_a47cf2b2) {
    if (isdefined(self.var_b736fc8b) && self.var_b736fc8b) {
        return;
    }
    if (isdefined(self.var_7b0667d9) && self.var_7b0667d9) {
        return;
    }
    self notify(#"starting_slowdown_ai");
    level endon(#"end_game");
    self endoncallback(&function_fe7a7d5b, #"starting_slowdown_ai", #"death");
    if (!isdefined(level.var_981dd9cf) || !isdefined(level.var_981dd9cf[#"slow"]) || !isdefined(level.var_981dd9cf[#"slow"][str_type])) {
        assertmsg("<unknown string>" + str_type + "<unknown string>");
        return;
    }
    if (!isdefined(self.a_n_slowdown_timeouts)) {
        self.a_n_slowdown_timeouts = [];
    } else if (!isarray(self.a_n_slowdown_timeouts)) {
        self.a_n_slowdown_timeouts = array(self.a_n_slowdown_timeouts);
    }
    s_slowdown = level.var_981dd9cf[#"slow"][str_type];
    n_time = gettime();
    n_timeout = n_time + int(s_slowdown.n_duration * 1000);
    if (!isdefined(self.a_n_slowdown_timeouts[str_type]) || self.a_n_slowdown_timeouts[str_type] < n_timeout) {
        self.a_n_slowdown_timeouts[str_type] = n_timeout;
    }
    for (n_slowdowns = self.a_n_slowdown_timeouts.size; n_slowdowns; n_slowdowns = self.a_n_slowdown_timeouts.size) {
        str_lowest_type = undefined;
        n_lowest_rate = 10;
        self function_e01e1ea1();
        foreach (str_index, n_slowdown_timeout in self.a_n_slowdown_timeouts) {
            if (str_index == str_type && isdefined(var_a47cf2b2)) {
                n_rate = var_a47cf2b2;
            } else {
                n_rate = level.var_981dd9cf[#"slow"][str_index].n_rate;
            }
            if (n_rate < n_lowest_rate) {
                str_lowest_type = str_index;
                n_lowest_rate = n_rate;
            }
        }
        if (isdefined(str_lowest_type)) {
            var_dc1625a7 = level.var_981dd9cf[#"slow"][str_lowest_type];
            var_e489fea = self.a_n_slowdown_timeouts[str_lowest_type];
            self asmsetanimationrate(n_lowest_rate);
            if (var_dc1625a7.n_duration == -1) {
                self waittill(#"hash_62a477d53a6bbad");
            } else {
                n_duration = var_e489fea - n_time;
                self waittilltimeout(float(n_duration) / 1000, #"hash_62a477d53a6bbad");
            }
            if (var_e489fea < gettime() && var_dc1625a7.n_duration != -1) {
                self.a_n_slowdown_timeouts[str_lowest_type] = undefined;
            }
        }
        self function_e01e1ea1();
    }
    self asmsetanimationrate(1);
}

// Namespace namespace_9ff9f642/namespace_9ff9f642
// Params 0, eflags: 0x5 linked
// Checksum 0x84dab9e3, Offset: 0x14d8
// Size: 0xf4
function private function_e01e1ea1() {
    n_time = gettime();
    foreach (str_index, n_slowdown_timeout in self.a_n_slowdown_timeouts) {
        if (level.var_981dd9cf[#"slow"][str_index].n_duration != -1 && n_slowdown_timeout <= n_time || n_slowdown_timeout == -1) {
            self.a_n_slowdown_timeouts[str_index] = undefined;
        }
    }
    arrayremovevalue(self.a_n_slowdown_timeouts, undefined, 1);
}

// Namespace namespace_9ff9f642/namespace_9ff9f642
// Params 0, eflags: 0x0
// Checksum 0x633204b0, Offset: 0x15d8
// Size: 0x12
function function_5d2b8af2() {
    self.var_7b0667d9 = 1;
}

// Namespace namespace_9ff9f642/namespace_9ff9f642
// Params 1, eflags: 0x1 linked
// Checksum 0x9716ba51, Offset: 0x15f8
// Size: 0x5e
function function_520f4da5(str_type) {
    if (isdefined(str_type) && isdefined(self.a_n_slowdown_timeouts) && isdefined(self.a_n_slowdown_timeouts[str_type])) {
        self.a_n_slowdown_timeouts[str_type] = -1;
    }
    self notify(#"hash_62a477d53a6bbad");
}

// Namespace namespace_9ff9f642/namespace_9ff9f642
// Params 1, eflags: 0x5 linked
// Checksum 0xa7d6f61f, Offset: 0x1660
// Size: 0x5c
function private function_fe7a7d5b(str_notify) {
    if (isalive(self) && hasasm(self)) {
        self asmsetanimationrate(1);
    }
}

