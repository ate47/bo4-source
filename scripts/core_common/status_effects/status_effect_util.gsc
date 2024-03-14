// Atian COD Tools GSC decompiler test
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\player\player_role.gsc;
#using scripts\core_common\globallogic\globallogic_score.gsc;
#using scripts\core_common\gestures.gsc;
#using scripts\core_common\damagefeedback_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace status_effect;

// Namespace status_effect/status_effect_util
// Params 1, eflags: 0x5 linked
// Checksum 0xcfad524e, Offset: 0xe8
// Size: 0x66
function private register_status_effect(status_effect_type) {
    if (!isdefined(level._status_effects)) {
        level._status_effects = [];
    }
    if (!isdefined(level._status_effects[status_effect_type])) {
        level._status_effects[status_effect_type] = spawnstruct();
    }
}

// Namespace status_effect/status_effect_util
// Params 1, eflags: 0x1 linked
// Checksum 0xc83d8710, Offset: 0x158
// Size: 0x92
function function_6f4eaf88(var_756fda07) {
    if (!isdefined(var_756fda07)) {
        /#
            println("<unknown string>");
        #/
        return;
    }
    if (!isdefined(var_756fda07.setype)) {
        var_756fda07.setype = 0;
    }
    register_status_effect(var_756fda07.setype);
    level.var_233471d2[var_756fda07.setype] = var_756fda07;
}

// Namespace status_effect/status_effect_util
// Params 2, eflags: 0x1 linked
// Checksum 0x48032c9e, Offset: 0x1f8
// Size: 0x52
function register_status_effect_callback_apply(status_effect, apply_func) {
    register_status_effect(status_effect);
    if (isdefined(apply_func)) {
        level._status_effects[status_effect].apply = apply_func;
    }
}

// Namespace status_effect/status_effect_util
// Params 0, eflags: 0x5 linked
// Checksum 0x2a9a145c, Offset: 0x258
// Size: 0x146
function private function_b24f18a1() {
    if (isdefined(self.owner)) {
        if (function_7d17822(self.setype)) {
            self.owner function_89ae38c1(self.namehash);
        }
        if (isdefined(self.var_36c77790)) {
            if (isplayer(self.owner)) {
                self.owner playlocalsound(self.var_36c77790);
            }
        }
        if (isdefined(self.var_801118b0)) {
            if (isplayer(self.owner)) {
                self.owner stoploopsound(0.5);
            }
        }
        self.owner function_14fdd7e2(self.var_4f6b79a4);
        self [[ level._status_effects[self.setype].var_a4c649a2 ]]();
        self.owner.var_121392a1[self.var_18d16a6b] = undefined;
        self notify(#"endstatuseffect");
    }
}

// Namespace status_effect/status_effect_util
// Params 2, eflags: 0x1 linked
// Checksum 0xb661c2b3, Offset: 0x3a8
// Size: 0xa2
function function_5bae5120(status_effect, end_func) {
    register_status_effect(status_effect);
    if (isdefined(end_func)) {
        level._status_effects[status_effect].end = &function_b24f18a1;
        level._status_effects[status_effect].var_a4c649a2 = end_func;
        level._status_effects[status_effect].death = level._status_effects[status_effect].end;
    }
}

// Namespace status_effect/status_effect_util
// Params 2, eflags: 0x0
// Checksum 0x7c3425de, Offset: 0x458
// Size: 0x52
function function_6d888241(status_effect, death_func) {
    register_status_effect(status_effect);
    if (isdefined(death_func)) {
        level._status_effects[status_effect].death = death_func;
    }
}

// Namespace status_effect/status_effect_util
// Params 3, eflags: 0x0
// Checksum 0x7c348f82, Offset: 0x4b8
// Size: 0x5c
function function_e2bff3ce(status_effect_type, weapon, applicant) {
    if (isdefined(level.var_233471d2[status_effect_type])) {
        self status_effect_apply(level.var_233471d2[status_effect_type], weapon, applicant);
    }
}

// Namespace status_effect/status_effect_util
// Params 3, eflags: 0x5 linked
// Checksum 0x966a1798, Offset: 0x520
// Size: 0x15a
function private function_91a9db75(sourcetype, setype, namehash) {
    if (!isdefined(self.var_121392a1)) {
        self.var_121392a1 = [];
    }
    if (!isdefined(self.var_121392a1[sourcetype])) {
        self.var_121392a1[sourcetype] = spawnstruct();
    }
    if (!isdefined(self.var_121392a1[sourcetype].duration)) {
        self.var_121392a1[sourcetype].duration = 0;
    }
    if (!isdefined(self.var_121392a1[sourcetype].endtime)) {
        self.var_121392a1[sourcetype].endtime = 0;
    }
    if (!isdefined(self.var_121392a1[sourcetype].owner)) {
        self.var_121392a1[sourcetype].owner = self;
    }
    self.var_121392a1[sourcetype].setype = setype;
    self.var_121392a1[sourcetype].namehash = namehash;
    self.var_121392a1[sourcetype].var_18d16a6b = sourcetype;
}

// Namespace status_effect/status_effect_util
// Params 7, eflags: 0x1 linked
// Checksum 0x9c6a35eb, Offset: 0x688
// Size: 0x83c
function status_effect_apply(var_756fda07, weapon, applicant, isadditive, var_ab5b905e, var_894859a2, location) {
    /#
        assert(isdefined(var_756fda07.setype));
    #/
    /#
        assert(isdefined(var_756fda07.var_18d16a6b));
    #/
    if (isdefined(self.registerpreparing_time_) && self.registerpreparing_time_) {
        return;
    }
    if (isdefined(var_894859a2)) {
        var_756fda07.var_77449e9 = var_756fda07.var_77449e9 * var_894859a2;
        if (isdefined(var_ab5b905e)) {
            var_ab5b905e = var_ab5b905e * var_894859a2;
        }
    }
    register_status_effect(var_756fda07.setype);
    var_f8f8abaa = 0;
    if (isdefined(applicant) && applicant != self && !self function_4aac137f(applicant, var_756fda07.var_18d16a6b)) {
        var_b7a9b136 = 1;
        if (isdefined(var_756fda07.var_2e4a8800)) {
            var_8725a10d = globallogic_score::function_3cbc4c6c(var_756fda07.var_2e4a8800);
        }
        if (isdefined(var_8725a10d) && isdefined(var_8725a10d.var_3e3b11a9)) {
            resistance = function_3c54ae98(var_756fda07.setype);
            if (var_8725a10d.var_3e3b11a9 < resistance) {
                var_b7a9b136 = 0;
            }
        }
        if (var_b7a9b136 && util::function_fbce7263(self.team, applicant.team)) {
            applicant thread globallogic_score::function_969ea48d(var_756fda07, weapon);
        }
        var_f8f8abaa = 1;
    }
    self function_91a9db75(var_756fda07.var_18d16a6b, var_756fda07.setype, var_756fda07.namehash);
    self function_52969ffe(var_756fda07);
    self callback::callback(#"on_status_effect", var_756fda07);
    var_275b5e13 = function_2ba2756c(var_756fda07.var_18d16a6b) > level.time;
    var_b0144580 = applicant === self;
    if (!isdefined(isadditive)) {
        isadditive = getdvarint(#"hash_6ce4aefbba354e2d", 0);
    }
    effect = self.var_121392a1[var_756fda07.var_18d16a6b];
    effect.var_4f6b79a4 = var_756fda07;
    if (isdefined(location)) {
        effect.location = location;
    } else if (isdefined(applicant)) {
        effect.location = applicant.origin;
    }
    effect handle_sounds(var_756fda07);
    var_4df0ea83 = 1;
    if (isdefined(var_756fda07.var_4df0ea83)) {
        var_4df0ea83 = var_756fda07.var_4df0ea83;
    }
    if (var_4df0ea83) {
        if (isadditive && var_756fda07.setype != 4) {
            effect function_57f33b96(var_756fda07, var_b0144580, var_ab5b905e, applicant, var_f8f8abaa, weapon);
        } else {
            effect update_duration(var_756fda07, var_b0144580, var_ab5b905e, applicant, var_f8f8abaa, weapon);
        }
    }
    maxduration = effect function_f9ca1b6a(var_756fda07);
    if (maxduration > 0 && self.var_121392a1[var_756fda07.var_18d16a6b].duration > maxduration) {
        self.var_121392a1[var_756fda07.var_18d16a6b].duration = maxduration;
    } else if (self.var_121392a1[var_756fda07.var_18d16a6b].duration > 65536 - 1) {
        self.var_121392a1[var_756fda07.var_18d16a6b].duration = 65536 - 1;
    }
    if (isdefined(weapon) && weapon.doesfiredamage) {
        if (isplayer(self)) {
            self clientfield::set("burn", 1);
        }
    }
    if (!var_275b5e13) {
        effect function_5d973c5f();
    }
    if (isdefined(level._status_effects[var_756fda07.setype].apply)) {
        effect.var_4b22e697 = applicant;
        effect.var_3d1ed4bd = weapon;
        effect thread [[ level._status_effects[var_756fda07.setype].apply ]](var_756fda07, weapon, applicant);
        thread function_86c0eb67(effect, "begin");
    }
    var_1d673e46 = !isplayer(self) || self function_6c32d092(#"talent_resistance") && !(isdefined(var_756fda07.var_857e12ae) && var_756fda07.var_857e12ae);
    if (!var_1d673e46 && !isdefined(effect.var_b5207a36)) {
        if (isdefined(var_756fda07.var_208fb7da)) {
            effect.var_b5207a36 = self gestures::function_c77349d4(var_756fda07.var_208fb7da);
        }
        if (!isdefined(effect.var_b5207a36)) {
            if (isdefined(var_756fda07.var_b5207a36)) {
                effect.var_b5207a36 = var_756fda07.var_b5207a36;
            }
        }
        if (isdefined(effect.var_b5207a36)) {
            self thread function_35d7925d(effect);
        }
    }
    if (function_7d17822(var_756fda07.setype)) {
        self thread function_47cad1aa(var_756fda07, isadditive);
    }
    if (isdefined(weapon) && isdefined(applicant) && applicant != self && isdefined(var_756fda07.var_3469b797) && var_756fda07.var_3469b797) {
        var_594a2d34 = isdefined(weapon) && isdefined(weapon.var_965cc0b3) && weapon.var_965cc0b3;
        applicant util::show_hit_marker(0, var_594a2d34);
    }
    if (isdefined(level._status_effects[var_756fda07.setype].end)) {
        effect thread wait_for_end();
    }
}

// Namespace status_effect/status_effect_util
// Params 1, eflags: 0x5 linked
// Checksum 0x91f0e46f, Offset: 0xed0
// Size: 0xbc
function private function_35d7925d(effect) {
    effect endon(#"endstatuseffect");
    self endon(#"death");
    while (isdefined(effect.var_b5207a36) && isalive(self)) {
        if (isdefined(level.var_d0ad09c5)) {
            self [[ level.var_d0ad09c5 ]](effect);
        }
        if (self gestures::play_gesture(effect.var_b5207a36, undefined, 0)) {
            return;
        }
        wait(0.5);
    }
}

// Namespace status_effect/status_effect_util
// Params 2, eflags: 0x5 linked
// Checksum 0xea5b0724, Offset: 0xf98
// Size: 0x10c
function private function_47cad1aa(var_756fda07, isadditive) {
    var_18d16a6b = var_756fda07.var_18d16a6b;
    setype = var_756fda07.setype;
    if (isdefined(self.var_121392a1[var_18d16a6b]) && isdefined(self.var_121392a1[var_18d16a6b].duration)) {
        if (setype != 4) {
            if (isplayer(self)) {
                /#
                    assert(!isfloat(self.var_121392a1[var_18d16a6b].duration), "<unknown string>");
                #/
                self applystatuseffect(var_756fda07.namehash, self.var_121392a1[var_18d16a6b].duration, isadditive);
            }
        }
    }
}

// Namespace status_effect/status_effect_util
// Params 1, eflags: 0x5 linked
// Checksum 0xf1440187, Offset: 0x10b0
// Size: 0x3c
function private function_89ae38c1(sename) {
    if (isplayer(self)) {
        self endstatuseffect(sename);
    }
}

// Namespace status_effect/status_effect_util
// Params 1, eflags: 0x5 linked
// Checksum 0xb92747e8, Offset: 0x10f8
// Size: 0x84
function private function_52969ffe(var_756fda07) {
    player = self;
    if (isdefined(var_756fda07.var_3edb6e25) && var_756fda07.var_3edb6e25 && isplayer(player)) {
        player disableoffhandspecial();
        player disableoffhandweapons();
    }
}

// Namespace status_effect/status_effect_util
// Params 1, eflags: 0x5 linked
// Checksum 0xaf448ef3, Offset: 0x1188
// Size: 0x84
function private function_14fdd7e2(var_756fda07) {
    player = self;
    if (isdefined(var_756fda07.var_3edb6e25) && var_756fda07.var_3edb6e25 && isplayer(player)) {
        player enableoffhandspecial();
        player enableoffhandweapons();
    }
}

// Namespace status_effect/status_effect_util
// Params 1, eflags: 0x5 linked
// Checksum 0x66ae9ad0, Offset: 0x1218
// Size: 0x17e
function private function_6bf7c434(status_effect_type) {
    if (isdefined(self.var_b5207a36)) {
        self.owner stopgestureviewmodel(self.var_b5207a36, 1, 0);
        self.var_b5207a36 = undefined;
    }
    if (isdefined(self.var_4b22e697)) {
        self.var_4b22e697 globallogic_score::allow_old_indexs(self.var_4f6b79a4);
    }
    if (isdefined(level._status_effects) && isdefined(level._status_effects[status_effect_type]) && isdefined(level._status_effects[status_effect_type].end)) {
        self thread [[ level._status_effects[status_effect_type].end ]]();
    }
    thread function_86c0eb67(self, "end");
    if (isdefined(self.var_3d1ed4bd) && isdefined(self.owner) && self.var_3d1ed4bd.doesfiredamage) {
        if (isplayer(self.owner)) {
            self.owner clientfield::set("burn", 0);
        }
    }
    self.var_4b22e697 = undefined;
    self notify(#"endstatuseffect");
}

// Namespace status_effect/status_effect_util
// Params 0, eflags: 0x5 linked
// Checksum 0x938724a7, Offset: 0x13a0
// Size: 0xb4
function private wait_for_end() {
    if (0 && self.setype == 6) {
        return;
    }
    self notify(#"endwaiter");
    self endon(#"endwaiter", #"endstatuseffect");
    self.owner endon(#"disconnect");
    while (self.endtime > level.time) {
        waitframe(1);
    }
    if (isdefined(self)) {
        self thread function_6bf7c434(self.setype);
    }
}

// Namespace status_effect/status_effect_util
// Params 2, eflags: 0x1 linked
// Checksum 0x166f6eca, Offset: 0x1460
// Size: 0x74
function function_408158ef(setype, var_18d16a6b) {
    if (isdefined(self.var_121392a1)) {
        if (isdefined(level._status_effects[setype].end)) {
            effect = self.var_121392a1[var_18d16a6b];
            if (isdefined(effect)) {
                effect function_6bf7c434(setype);
            }
        }
    }
}

// Namespace status_effect/status_effect_util
// Params 0, eflags: 0x1 linked
// Checksum 0xf7683c2b, Offset: 0x14e0
// Size: 0xb0
function function_6519f95f() {
    if (isdefined(self.var_121392a1)) {
        foreach (effect in self.var_121392a1) {
            if (isdefined(level._status_effects[effect.setype].end)) {
                effect function_6bf7c434(effect.setype);
            }
        }
    }
}

// Namespace status_effect/status_effect_util
// Params 1, eflags: 0x5 linked
// Checksum 0xb623a84a, Offset: 0x1598
// Size: 0x122
function private handle_sounds(var_756fda07) {
    endtime = self.endtime;
    if (isdefined(var_756fda07.var_b86e9a5e)) {
        if (level.time > endtime && isplayer(self.owner)) {
            self.owner playlocalsound(var_756fda07.var_b86e9a5e);
        }
    }
    if (isdefined(var_756fda07.var_801118b0)) {
        if (level.time > endtime && isplayer(self.owner)) {
            self.owner playloopsound(var_756fda07.var_801118b0);
        }
        self.var_801118b0 = var_756fda07.var_801118b0;
    }
    if (isdefined(var_756fda07.var_36c77790)) {
        self.var_36c77790 = var_756fda07.var_36c77790;
    }
}

// Namespace status_effect/status_effect_util
// Params 1, eflags: 0x0
// Checksum 0xe2f5e3e1, Offset: 0x16c8
// Size: 0x50
function status_effect_get_duration(var_eeb47fb8) {
    if (!isdefined(self.var_121392a1)) {
        self.var_121392a1 = [];
    }
    return isdefined(self.var_121392a1[var_eeb47fb8]) ? self.var_121392a1[var_eeb47fb8].duration : 0;
}

// Namespace status_effect/status_effect_util
// Params 1, eflags: 0x1 linked
// Checksum 0xf6148f14, Offset: 0x1720
// Size: 0x50
function function_2ba2756c(var_eeb47fb8) {
    if (!isdefined(self.var_121392a1)) {
        self.var_121392a1 = [];
    }
    return isdefined(self.var_121392a1[var_eeb47fb8]) ? self.var_121392a1[var_eeb47fb8].endtime : 0;
}

// Namespace status_effect/status_effect_util
// Params 1, eflags: 0x1 linked
// Checksum 0x320eb5bb, Offset: 0x1778
// Size: 0xd0
function function_7f14a56f(status_effect_type) {
    if (!isdefined(self.var_121392a1)) {
        self.var_121392a1 = [];
    }
    var_e2997f02 = 0;
    foreach (effect in self.var_121392a1) {
        if (effect.setype == 7) {
            var_e2997f02 = var_e2997f02 + effect.var_adb1692a * effect.var_5cf129b8 / 1000;
        }
    }
    return var_e2997f02;
}

// Namespace status_effect/status_effect_util
// Params 1, eflags: 0x1 linked
// Checksum 0x6c90c152, Offset: 0x1850
// Size: 0xa0
function function_4617032e(status_effect_type) {
    if (!isdefined(self.var_121392a1)) {
        self.var_121392a1 = [];
    }
    foreach (effect in self.var_121392a1) {
        if (effect.setype == status_effect_type) {
            return true;
        }
    }
    return false;
}

// Namespace status_effect/status_effect_util
// Params 1, eflags: 0x5 linked
// Checksum 0x3c26ec11, Offset: 0x18f8
// Size: 0x2a
function private function_40293e80(status_effect_type) {
    if (status_effect_type == 3) {
        return "flakjacket";
    }
    return "resistance";
}

// Namespace status_effect/status_effect_util
// Params 6, eflags: 0x5 linked
// Checksum 0x65202781, Offset: 0x1930
// Size: 0x316
function private update_duration(var_756fda07, var_b0144580, var_ab5b905e, applicant, var_f8f8abaa, weapon) {
    setype = var_756fda07.setype;
    resistance = self function_a6613b51(var_756fda07);
    var_fb887b00 = var_b0144580 ? self.owner function_37683813() : 1;
    if (var_b0144580 && isdefined(weapon) && isdefined(weapon.var_83b1dc1) && weapon.var_83b1dc1) {
        var_fb887b00 = 1;
    }
    if (getgametypesetting(#"competitivesettings") !== 1 || weapon !== getweapon("eq_concertina_wire")) {
        if (resistance > 0 && isdefined(applicant) && var_f8f8abaa && var_756fda07.var_42c00474 === 1 && !var_b0144580 && setype !== 0) {
            applicant damagefeedback::update(undefined, undefined, function_40293e80(setype));
        }
    }
    var_7a1fa72a = 0;
    if (isdefined(var_ab5b905e)) {
        var_7a1fa72a = var_ab5b905e;
    } else {
        var_7a1fa72a = var_756fda07.var_77449e9;
    }
    var_7a1fa72a = int(var_7a1fa72a * (1 - resistance) * var_fb887b00);
    var_2226e3f0 = self.endtime;
    time = level.time;
    maxduration = self function_f9ca1b6a(var_756fda07);
    if (isdefined(var_2226e3f0)) {
        var_b5051685 = var_2226e3f0 - time;
        if (var_b5051685 < var_7a1fa72a) {
            self.duration = var_7a1fa72a;
            if (maxduration && self.duration > maxduration) {
                self.duration = maxduration;
            }
            self.endtime = time + self.duration;
        }
        return;
    }
    self.duration = var_7a1fa72a;
    if (maxduration && self.duration > maxduration) {
        self.duration = maxduration;
    }
    self.endtime = time + self.duration;
}

// Namespace status_effect/status_effect_util
// Params 6, eflags: 0x5 linked
// Checksum 0xb5a7b7df, Offset: 0x1c50
// Size: 0x38a
function private function_57f33b96(var_756fda07, var_b0144580, var_ab5b905e, applicant, var_f8f8abaa, weapon) {
    setype = var_756fda07.setype;
    resistance = self function_a6613b51(var_756fda07);
    if (isdefined(var_756fda07.var_857e12ae) && var_756fda07.var_857e12ae) {
        resistance = 0;
    }
    var_fb887b00 = var_b0144580 ? self.owner function_37683813() : 1;
    if (var_b0144580 && isdefined(weapon) && isdefined(weapon.var_83b1dc1) && weapon.var_83b1dc1) {
        var_fb887b00 = 1;
    }
    if (getgametypesetting(#"competitivesettings") !== 1 || weapon !== getweapon("eq_concertina_wire")) {
        if (resistance > 0 && setype != 0 && setype != 3 && isdefined(applicant) && var_f8f8abaa && var_756fda07.var_42c00474 === 1 && !var_b0144580) {
            applicant damagefeedback::update(undefined, undefined, function_40293e80(setype), weapon, self.owner);
        }
    }
    var_7a1fa72a = 0;
    if (isdefined(var_ab5b905e)) {
        var_7a1fa72a = var_ab5b905e;
    } else {
        var_7a1fa72a = var_756fda07.var_77449e9;
    }
    var_7a1fa72a = int(var_7a1fa72a * (1 - resistance) * var_fb887b00);
    time = level.time;
    maxduration = self function_f9ca1b6a(var_756fda07);
    if (isdefined(self.duration)) {
        if (isdefined(self.endtime) && self.endtime > time) {
            if (maxduration && var_7a1fa72a > maxduration) {
                var_7a1fa72a = maxduration;
            }
            self.duration = self.duration + var_7a1fa72a;
            self.endtime = gettime() + var_7a1fa72a;
        } else {
            self.duration = var_7a1fa72a;
            if (maxduration && self.duration > maxduration) {
                self.duration = maxduration;
            }
            self.endtime = time + var_7a1fa72a;
        }
        return;
    }
    self.duration = var_7a1fa72a;
    if (maxduration && self.duration > maxduration) {
        self.duration = maxduration;
    }
    self.endtime = time + var_7a1fa72a;
}

// Namespace status_effect/status_effect_util
// Params 0, eflags: 0x5 linked
// Checksum 0xd79e06e9, Offset: 0x1fe8
// Size: 0x34
function private function_5d973c5f() {
    self thread function_72886b31();
    self thread function_150a8541();
}

// Namespace status_effect/status_effect_util
// Params 0, eflags: 0x1 linked
// Checksum 0x44f8eac3, Offset: 0x2028
// Size: 0x15e
function function_150a8541() {
    self notify(#"loadoutwatcher");
    self endon(#"loadoutwatcher", #"endstatuseffect");
    self.owner endon(#"death", #"disconnect");
    var_eff9d37f = self.owner function_3c54ae98(self.setype);
    while (true) {
        self.owner waittill(#"loadout_given");
        newres = self.owner function_3c54ae98(self.setype);
        currtime = level.time;
        if (newres != var_eff9d37f) {
            timeremaining = self.endtime - currtime;
            timeremaining = timeremaining * newres;
            self.endtime = int(currtime + timeremaining);
            self.duration = int(timeremaining);
        }
    }
}

// Namespace status_effect/status_effect_util
// Params 0, eflags: 0x1 linked
// Checksum 0x127bc81e, Offset: 0x2190
// Size: 0xc4
function function_72886b31() {
    self notify(#"deathwatcher");
    self endon(#"deathwatcher", #"endstatuseffect");
    self.owner waittill(#"death");
    if (isdefined(self.var_4b22e697)) {
        self.var_4b22e697 thread globallogic_score::function_fc47f2ff(self.var_4f6b79a4);
    }
    if (isdefined(self) && isdefined(level._status_effects[self.setype].death)) {
        self [[ level._status_effects[self.setype].death ]]();
    }
}

// Namespace status_effect/status_effect_util
// Params 1, eflags: 0x1 linked
// Checksum 0x7d86228e, Offset: 0x2260
// Size: 0x92
function function_3c54ae98(status_effect_type) {
    if (!isplayer(self)) {
        return 0;
    }
    if (sessionmodeiszombiesgame()) {
        if (!player_role::is_valid(self player_role::get())) {
            return 0;
        }
    }
    resistance = self getplayerresistance(status_effect_type);
    return resistance;
}

// Namespace status_effect/status_effect_util
// Params 0, eflags: 0x1 linked
// Checksum 0xefb4fff8, Offset: 0x2300
// Size: 0x4a
function function_37683813() {
    if (!isplayer(self)) {
        return 1;
    }
    scalar = self function_9049b079();
    return scalar;
}

// Namespace status_effect/status_effect_util
// Params 1, eflags: 0x5 linked
// Checksum 0xafb10b2c, Offset: 0x2358
// Size: 0x9e
function private function_a6613b51(var_756fda07) {
    effect = self;
    setype = var_756fda07.setype;
    resistance = effect.owner function_3c54ae98(setype);
    if (isdefined(var_756fda07.var_857e12ae) && var_756fda07.var_857e12ae) {
        resistance = 0;
    }
    if (setype == 7) {
        resistance = 0;
    }
    return resistance;
}

// Namespace status_effect/status_effect_util
// Params 1, eflags: 0x5 linked
// Checksum 0x48a7e771, Offset: 0x2400
// Size: 0x72
function private function_f9ca1b6a(var_756fda07) {
    effect = self;
    resistance = effect function_a6613b51(var_756fda07);
    maxduration = int(var_756fda07.var_ca171ecc * (1 - resistance));
    return maxduration;
}

// Namespace status_effect/status_effect_util
// Params 1, eflags: 0x5 linked
// Checksum 0xd29fb894, Offset: 0x2480
// Size: 0x16
function private function_7d17822(status_effect_type) {
    return status_effect_type < 9;
}

// Namespace status_effect/status_effect_util
// Params 1, eflags: 0x1 linked
// Checksum 0xe42684d2, Offset: 0x24a0
// Size: 0x1a
function function_7505baeb(var_5c980521) {
    level.var_90391bcc = var_5c980521;
}

// Namespace status_effect/status_effect_util
// Params 2, eflags: 0x1 linked
// Checksum 0x5a70fab1, Offset: 0x24c8
// Size: 0x3c
function function_86c0eb67(status_effect, var_3bc85d80) {
    if (!isdefined(level.var_90391bcc)) {
        return;
    }
    [[ level.var_90391bcc ]](status_effect, var_3bc85d80);
}

// Namespace status_effect/status_effect_util
// Params 2, eflags: 0x5 linked
// Checksum 0xea1255b9, Offset: 0x2510
// Size: 0xd0
function private function_4aac137f(var_19201a97, sourcetype) {
    gametime = level.time;
    endtime = function_2ba2756c(sourcetype);
    isactive = function_2ba2756c(sourcetype) > gametime;
    if (!isactive) {
        return false;
    }
    if (!isdefined(self.var_121392a1[sourcetype]) || !isdefined(self.var_121392a1[sourcetype].var_4b22e697) || !isdefined(var_19201a97)) {
        return false;
    }
    return self.var_121392a1[sourcetype].var_4b22e697 == var_19201a97;
}

