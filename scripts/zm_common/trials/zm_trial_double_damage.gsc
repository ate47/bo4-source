#using scripts\zm_common\zm.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace zm_trial_double_damage;

// Namespace zm_trial_double_damage/zm_trial_double_damage
// Params 0, eflags: 0x2
// Checksum 0x9c7532d0, Offset: 0x98
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_trial_double_damage", &__init__, undefined, undefined);
}

// Namespace zm_trial_double_damage/zm_trial_double_damage
// Params 0, eflags: 0x0
// Checksum 0x1a56212d, Offset: 0xe0
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"double_damage", &on_begin, &on_end);
}

// Namespace zm_trial_double_damage/zm_trial_double_damage
// Params 0, eflags: 0x4
// Checksum 0xc2663ef1, Offset: 0x148
// Size: 0xa6
function private on_begin() {
    self.var_42fe565a = level.var_c739ead9;
    self.var_8271882d = level.var_4d7e8b66;
    self.var_ecdf7fbe = level.var_1bb1a2fb;
    self.var_103c25d7 = level.var_5db2341c;
    self.var_97881ccb = level.var_53c7ca1d;
    level.var_c739ead9 = 2;
    level.var_4d7e8b66 = 2;
    level.var_1bb1a2fb = 2;
    level.var_5db2341c = 2;
    level.var_53c7ca1d = 2;
}

// Namespace zm_trial_double_damage/zm_trial_double_damage
// Params 1, eflags: 0x4
// Checksum 0xa552d361, Offset: 0x1f8
// Size: 0x6e
function private on_end(round_reset) {
    level.var_c739ead9 = self.var_42fe565a;
    level.var_4d7e8b66 = self.var_8271882d;
    level.var_1bb1a2fb = self.var_ecdf7fbe;
    level.var_5db2341c = self.var_103c25d7;
    level.var_53c7ca1d = self.var_97881ccb;
}

// Namespace zm_trial_double_damage/zm_trial_double_damage
// Params 0, eflags: 0x0
// Checksum 0x2f9e6846, Offset: 0x270
// Size: 0x32
function is_active() {
    challenge = zm_trial::function_a36e8c38(#"double_damage");
    return isdefined(challenge);
}

