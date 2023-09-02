// Atian COD Tools GSC decompiler test
#using scripts\mp_common\gametypes\ct_utils.gsc;
#using scripts\mp_common\gametypes\ct_bots.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\flag_shared.gsc;

#namespace ct_gadgets;

// Namespace ct_gadgets/ct_gadgets
// Params 1, eflags: 0x0
// Checksum 0xdfeb399a, Offset: 0xe0
// Size: 0x76
function function_f2f3407(var_1c5778ef) {
    if (isdefined(level.var_43ac3b33) && level.var_43ac3b33) {
        return 0;
    }
    if (!isdefined(var_1c5778ef)) {
        return 0;
    }
    if (isdefined(level.var_e72728b8)) {
        if (isinarray(level.var_e72728b8, var_1c5778ef)) {
            return 0;
        }
    }
    return 1;
}

// Namespace ct_gadgets/ct_gadgets
// Params 0, eflags: 0x0
// Checksum 0x95097a6, Offset: 0x160
// Size: 0xbe
function function_761e1977() {
    if (isdefined(self._gadgets_player)) {
        for (i = 0; i < 3; i++) {
            gadget = self._gadgets_player[i];
            if (isdefined(gadget)) {
                var_bf05e9db = 1;
                if (isdefined(var_bf05e9db) && var_bf05e9db) {
                    if (!self util::gadget_is_in_use(i) && self gadgetcharging(i)) {
                        self thread function_be6376db(i);
                    }
                }
            }
        }
    }
}

// Namespace ct_gadgets/ct_gadgets
// Params 1, eflags: 0x0
// Checksum 0x1d67e598, Offset: 0x228
// Size: 0x76
function function_be6376db(n_slot) {
    self.var_bb7ec6ae[n_slot] = 1;
    gadget = self._gadgets_player[n_slot];
    self gadgetpowerset(n_slot, gadget.gadget_powermax);
    waitframe(1);
    self.var_bb7ec6ae[n_slot] = 0;
}

// Namespace ct_gadgets/ct_gadgets
// Params 0, eflags: 0x0
// Checksum 0x63408cc0, Offset: 0x2a8
// Size: 0x6c
function function_c33e69b9() {
    player = self;
    if (!isdefined(player.var_bb7ec6ae)) {
        player.var_bb7ec6ae = [];
    }
    for (i = 0; i < 3; i++) {
        player.var_bb7ec6ae[i] = 1;
    }
}

// Namespace ct_gadgets/ct_gadgets
// Params 0, eflags: 0x0
// Checksum 0x5caf5f43, Offset: 0x320
// Size: 0x6c
function function_b81240c1() {
    player = self;
    if (!isdefined(player.var_bb7ec6ae)) {
        player.var_bb7ec6ae = [];
    }
    for (i = 0; i < 3; i++) {
        player.var_bb7ec6ae[i] = 0;
    }
}

// Namespace ct_gadgets/ct_gadgets
// Params 1, eflags: 0x0
// Checksum 0xa43979c7, Offset: 0x398
// Size: 0x8c
function function_ac7d2bdd(n_time = 0.5) {
    level endon(#"hash_699329b4df616aed");
    for (i = 0; i < 3; i++) {
        if (isdefined(self._gadgets_player[i])) {
            self thread function_4d6c7d92(i, n_time);
        }
    }
    wait(n_time);
}

// Namespace ct_gadgets/ct_gadgets
// Params 2, eflags: 0x0
// Checksum 0x16f3184d, Offset: 0x430
// Size: 0x28c
function function_4d6c7d92(var_e8ee1cd1, n_time = 0) {
    level endon(#"combattraining_logic_finished");
    self endoncallback(&function_649b67d, #"death");
    if (!isdefined(self.var_5c519f98)) {
        self.var_5c519f98 = [];
    }
    gadget = self._gadgets_player[var_e8ee1cd1];
    if (isdefined(gadget) && !function_f2f3407(gadget.name)) {
        self gadgetpowerset(var_e8ee1cd1, 0);
    } else if (!(isdefined(self.var_5c519f98[var_e8ee1cd1]) && self.var_5c519f98[var_e8ee1cd1])) {
        self.var_5c519f98[var_e8ee1cd1] = 1;
        var_d5b8c6cf = self._gadgets_player[var_e8ee1cd1].gadget_powermax;
        n_steps = 10;
        var_128b4383 = 0.1;
        var_589ea782 = n_time ? var_d5b8c6cf * var_128b4383 / n_time : var_d5b8c6cf;
        n_power = 0;
        while (n_power < var_d5b8c6cf && function_f2f3407(gadget.name)) {
            n_power = self gadgetpowerget(var_e8ee1cd1) + var_589ea782;
            if (!isdefined(self.var_bb7ec6ae) || !(isdefined(self.var_bb7ec6ae[var_e8ee1cd1]) && self.var_bb7ec6ae[var_e8ee1cd1])) {
                self gadgetpowerset(var_e8ee1cd1, n_power);
            }
            wait(var_128b4383);
        }
        self.var_5c519f98[var_e8ee1cd1] = 0;
        if (!function_f2f3407(gadget.name)) {
            self gadgetpowerset(var_e8ee1cd1, 0);
        }
    }
}

// Namespace ct_gadgets/ct_gadgets
// Params 1, eflags: 0x0
// Checksum 0x9d40bd44, Offset: 0x6c8
// Size: 0x7c
function function_649b67d(_hash) {
    e_player = ct_utils::get_player();
    if (isdefined(e_player.var_5c519f98)) {
        for (i = 0; i < e_player.var_5c519f98.size; i++) {
            e_player.var_5c519f98[i] = 0;
        }
    }
}

// Namespace ct_gadgets/ct_gadgets
// Params 0, eflags: 0x0
// Checksum 0x46c787e7, Offset: 0x750
// Size: 0x6e
function function_d77271ae() {
    level endon(#"hash_699329b4df616aed");
    for (i = 0; i < 3; i++) {
        if (isdefined(self._gadgets_player[i])) {
            self gadgetpowerset(i, 0);
        }
    }
}

// Namespace ct_gadgets/ct_gadgets
// Params 1, eflags: 0x0
// Checksum 0xd7ee4d5f, Offset: 0x7c8
// Size: 0x32e
function function_b0762fa0(n_slot) {
    var_b4079089 = "gadget_autofill_power_think_end_" + n_slot;
    level endon(#"combattraining_logic_finished", var_b4079089);
    if (!isdefined(self.var_bb7ec6ae)) {
        self.var_bb7ec6ae = [];
    }
    while (1) {
        if (isdefined(self._gadgets_player)) {
            gadget = self._gadgets_player[n_slot];
            if (isdefined(gadget)) {
                var_bf05e9db = 1;
                n_power = self gadgetpowerget(n_slot);
                if (isdefined(self.var_bb7ec6ae[n_slot]) && self.var_bb7ec6ae[n_slot] || n_power >= gadget.gadget_powermax) {
                    var_bf05e9db = 0;
                }
                if (!function_f2f3407(gadget.name)) {
                    var_bf05e9db = 0;
                }
                if (isdefined(var_bf05e9db) && var_bf05e9db) {
                    var_90a2bef0 = self util::gadget_is_in_use(n_slot);
                    if (isdefined(level.var_d4668c34) && level.var_d4668c34) {
                        var_d1fbed1e = 1;
                        if (isdefined(self.var_bb7ec6ae[n_slot]) && self.var_bb7ec6ae[n_slot]) {
                            var_d1fbed1e = 0;
                        } else if (isdefined(level.var_fa24d775)) {
                            foreach (test_gadget in level.var_fa24d775) {
                                if (test_gadget == gadget.name) {
                                    var_d1fbed1e = 0;
                                    break;
                                }
                            }
                        }
                        if (isdefined(var_d1fbed1e) && var_d1fbed1e) {
                            self gadgetpowerset(n_slot, 100);
                        }
                    } else if (!var_90a2bef0) {
                        var_6624500e = isdefined(self.var_f3d589a1[n_slot]) ? self.var_f3d589a1[n_slot] : level.var_c8f47cbe;
                        self function_4d6c7d92(n_slot, var_6624500e);
                    }
                } else if (isdefined(level.var_e72728b8) && isinarray(level.var_e72728b8, gadget.name)) {
                    self gadgetpowerset(n_slot, 0);
                }
            }
        }
        waitframe(1);
    }
}

// Namespace ct_gadgets/ct_gadgets
// Params 0, eflags: 0x0
// Checksum 0xb5aed57a, Offset: 0xb00
// Size: 0xac
function function_19181566() {
    level endon(#"hash_699329b4df616aed");
    level flag::wait_till("desc_fillup_gadgets");
    self thread ct_utils::function_d836c124();
    if (!isdefined(self.var_f3d589a1)) {
        self.var_f3d589a1 = [];
    }
    self thread function_b0762fa0(0);
    self thread function_b0762fa0(1);
    self thread function_b0762fa0(2);
}

// Namespace ct_gadgets/ct_gadgets
// Params 2, eflags: 0x0
// Checksum 0x15848811, Offset: 0xbb8
// Size: 0xde
function function_4db6654a(n_slot, var_56cf67a9) {
    level endon(#"hash_699329b4df616aed");
    self endon(#"death");
    while (1) {
        if (isdefined(self._gadgets_player)) {
            gadget = self._gadgets_player[n_slot];
            if (isdefined(gadget) && function_f2f3407(gadget.name)) {
                var_9877bd4c = self gadgetpowerget(n_slot);
                if (var_9877bd4c < var_56cf67a9) {
                    self gadgetpowerset(n_slot, var_56cf67a9);
                }
            }
        }
        waitframe(1);
    }
}

// Namespace ct_gadgets/ct_gadgets
// Params 2, eflags: 0x0
// Checksum 0xd442d875, Offset: 0xca0
// Size: 0xce
function function_144e61da(n_slot, str_endon) {
    level endon(str_endon);
    while (1) {
        e_player = getplayers()[0];
        gadget = e_player._gadgets_player[n_slot];
        if (isalive(e_player) && isdefined(gadget) && function_f2f3407(gadget.name)) {
            e_player gadgetpowerset(n_slot, 100);
        }
        wait(1);
    }
}

// Namespace ct_gadgets/ct_gadgets
// Params 0, eflags: 0x0
// Checksum 0xfe45ca51, Offset: 0xd78
// Size: 0x72
function function_c3e3d15() {
    level endon(#"combattraining_logic_finished");
    while (1) {
        waitresult = undefined;
        waitresult = level waittill(#"hero_gadget_activated");
        waitresult.player.var_657a47ca = waitresult.weapon.name;
    }
}

// Namespace ct_gadgets/ct_gadgets
// Params 0, eflags: 0x0
// Checksum 0x196ce48c, Offset: 0xdf8
// Size: 0x62
function function_aedf2680() {
    e_player = getplayers()[0];
    e_player endon(#"death");
    e_player waittill(#"gadget_forced_off");
    e_player.var_c70a4cbc = 1;
}

// Namespace ct_gadgets/ct_gadgets
// Params 3, eflags: 0x0
// Checksum 0x7738a598, Offset: 0xe68
// Size: 0x94
function function_9dc27b4f(str_weapon, var_11665320, var_c8518532) {
    self endon(#"death");
    level.var_e72728b8 = var_11665320;
    function_952b1db2();
    waitframe(1);
    level.var_e72728b8 = var_c8518532;
    self switchtoweapon(getweapon(str_weapon), 1);
}

// Namespace ct_gadgets/ct_gadgets
// Params 0, eflags: 0x0
// Checksum 0x79c585a, Offset: 0xf08
// Size: 0x34
function function_952b1db2() {
    self endon(#"death");
    waitframe(1);
    self ct_bots::function_26d45f32(1);
}

// Namespace ct_gadgets/ct_gadgets
// Params 1, eflags: 0x0
// Checksum 0x4b5dcbd1, Offset: 0xf48
// Size: 0xf6
function function_1be7e4f(str_weapon) {
    self endon(#"death", #"hash_46d18c1394319d75");
    weapon = getweapon(str_weapon);
    var_333fa936 = self getweaponammoclipsize(weapon);
    while (1) {
        wpn_current = self getcurrentweapon();
        if (wpn_current == weapon) {
            n_ammo = self getweaponammoclip(wpn_current);
            if (n_ammo < var_333fa936) {
                self setweaponammoclip(wpn_current, var_333fa936);
            }
        }
        waitframe(1);
    }
}

// Namespace ct_gadgets/ct_gadgets
// Params 1, eflags: 0x0
// Checksum 0x48120d47, Offset: 0x1048
// Size: 0xa2
function function_350dd8ec(str_weapon) {
    level endon(#"combattraining_logic_finished");
    while (1) {
        e_player = getplayers()[0];
        if (isalive(e_player)) {
            wpn = e_player getcurrentweapon();
            if (wpn.name == str_weapon) {
                break;
            }
        }
        waitframe(1);
    }
}

// Namespace ct_gadgets/ct_gadgets
// Params 1, eflags: 0x0
// Checksum 0xf86a6a54, Offset: 0x10f8
// Size: 0x7c
function get_slot(str_weapon_name) {
    if (isdefined(self._gadgets_player)) {
        for (i = 0; i < 3; i++) {
            gadget = self._gadgets_player[i];
            if (isdefined(gadget) && gadget.name == str_weapon_name) {
                return i;
            }
        }
    }
    return 0;
}

// Namespace ct_gadgets/ct_gadgets
// Params 1, eflags: 0x0
// Checksum 0xd61038dd, Offset: 0x1180
// Size: 0x5c
function function_fb68ca34(n_delay) {
    e_player = getplayers()[0];
    wait(n_delay);
    e_player val::reset(#"spawn_player", "disablegadgets");
}

