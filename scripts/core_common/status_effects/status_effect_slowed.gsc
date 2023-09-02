// Atian COD Tools GSC decompiler test
#using scripts\core_common\status_effects\status_effect_util.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace status_effect_slowed;

// Namespace status_effect_slowed/status_effect_slowed
// Params 0, eflags: 0x2
// Checksum 0x71ce94b1, Offset: 0x88
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"status_effect_slowed", &__init__, undefined, undefined);
}

// Namespace status_effect_slowed/status_effect_slowed
// Params 0, eflags: 0x1 linked
// Checksum 0x712371f0, Offset: 0xd0
// Size: 0x6c
function __init__() {
    status_effect::register_status_effect_callback_apply(2, &slowed_apply);
    status_effect::function_5bae5120(2, &function_6fe78d40);
    status_effect::function_6f4eaf88(getstatuseffect("slowed"));
}

// Namespace status_effect_slowed/status_effect_slowed
// Params 3, eflags: 0x1 linked
// Checksum 0xe6f9bad5, Offset: 0x148
// Size: 0x9e
function slowed_apply(var_756fda07, weapon, applicant) {
    self.owner.var_a010bd8f = applicant;
    self.owner.var_9060b065 = weapon;
    if (self.owner == applicant) {
        return;
    }
    var_c94d654b = applicant getentitynumber();
    if (!isdefined(self.owner.var_a4332cab)) {
        self.owner.var_a4332cab = [];
    }
}

// Namespace status_effect_slowed/status_effect_slowed
// Params 0, eflags: 0x1 linked
// Checksum 0xe3af41b7, Offset: 0x1f0
// Size: 0x5e
function function_6fe78d40() {
    if (isdefined(self.owner) && isdefined(self.owner.var_a010bd8f) && isdefined(self.owner.var_a010bd8f.var_9d19aa30)) {
        self.owner.var_a010bd8f.var_9d19aa30 = 0;
    }
}

