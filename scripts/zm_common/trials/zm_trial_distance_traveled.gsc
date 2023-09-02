// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_trial_distance_traveled;

// Namespace zm_trial_distance_traveled/zm_trial_distance_traveled
// Params 0, eflags: 0x2
// Checksum 0x2befb5da, Offset: 0xa8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_trial_distance_traveled", &__init__, undefined, undefined);
}

// Namespace zm_trial_distance_traveled/zm_trial_distance_traveled
// Params 0, eflags: 0x0
// Checksum 0xa8e3f864, Offset: 0xf0
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"distance_traveled", &on_begin, &on_end);
}

// Namespace zm_trial_distance_traveled/zm_trial_distance_traveled
// Params 1, eflags: 0x4
// Checksum 0x7d34bc55, Offset: 0x158
// Size: 0x18e
function private on_begin(var_38282db8) {
    var_38282db8 = zm_trial::function_5769f26a(var_38282db8);
    foreach (player in getplayers()) {
        player thread function_ed4d5d4(var_38282db8);
    }
    level.var_4220f02a = array(getweapon(#"launcher_standard_t8"), getweapon(#"hash_138efe2bb30be63c"), getweapon(#"hash_138f012bb30beb55"), getweapon(#"hash_46ad37ce8122812e"), getweapon(#"hash_138f002bb30be9a2"), getweapon(#"hash_3a8348f19a7e7629"));
}

// Namespace zm_trial_distance_traveled/zm_trial_distance_traveled
// Params 1, eflags: 0x4
// Checksum 0x9fe3fef9, Offset: 0x2f0
// Size: 0x16
function private on_end(round_reset) {
    level.var_4220f02a = undefined;
}

// Namespace zm_trial_distance_traveled/zm_trial_distance_traveled
// Params 0, eflags: 0x0
// Checksum 0x78dbb6e7, Offset: 0x310
// Size: 0x32
function is_active() {
    challenge = zm_trial::function_a36e8c38(#"distance_traveled");
    return isdefined(challenge);
}

// Namespace zm_trial_distance_traveled/zm_trial_distance_traveled
// Params 1, eflags: 0x0
// Checksum 0x6e3f831a, Offset: 0x350
// Size: 0x248
function function_ed4d5d4(var_38282db8) {
    self endon(#"disconnect");
    level endon(#"hash_7646638df88a3656", #"end_game", #"hash_43a461e5c99d52a0");
    n_distance_traveled = 0;
    self zm_trial_util::function_2190356a(int(n_distance_traveled), 1);
    self zm_trial_util::function_c2cd0cba(var_38282db8);
    wait(12);
    var_31409e15 = self.origin;
    while (1) {
        var_abf38d09 = distance(self.origin, var_31409e15) * 0.0254;
        if (isalive(self)) {
            if (self function_e7985d50()) {
                while (self function_e7985d50()) {
                    var_31409e15 = self.origin;
                    waitframe(1);
                }
            } else {
                n_distance_traveled = n_distance_traveled + var_abf38d09;
            }
        }
        if (n_distance_traveled < var_38282db8) {
            self zm_trial_util::function_2190356a(int(n_distance_traveled), 1);
            self zm_trial_util::function_c2cd0cba(var_38282db8);
        } else {
            self zm_trial_util::function_2190356a(var_38282db8);
            self zm_trial_util::function_c2cd0cba(var_38282db8);
            zm_trial::fail(#"hash_1ab078fa9460e7c9", array(self));
            level notify(#"hash_43a461e5c99d52a0");
            return;
        }
        var_31409e15 = self.origin;
        waitframe(1);
    }
}

// Namespace zm_trial_distance_traveled/zm_trial_distance_traveled
// Params 0, eflags: 0x0
// Checksum 0x6b2d3a17, Offset: 0x5a0
// Size: 0x140
function function_e7985d50() {
    if (isdefined(self.var_16735873) && self.var_16735873 || self util::function_88c74107() || isdefined(self.var_ffe2c4d7) && self.var_ffe2c4d7 || isdefined(self.var_25c3de32) && self.var_25c3de32) {
        return 1;
    }
    w_weapon = self getcurrentweapon();
    w_weapon = zm_weapons::get_base_weapon(w_weapon);
    var_f77522bb = self getnormalizedmovement();
    if (isarray(level.var_4220f02a) && self isfiring() && isinarray(level.var_4220f02a, w_weapon) && var_f77522bb == (0, 0, 0)) {
        return 1;
    }
    return 0;
}

