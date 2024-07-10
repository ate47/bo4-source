#using scripts\core_common\status_effects\status_effect_util.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace status_effect_blind;

// Namespace status_effect_blind/status_effect_blind
// Params 0, eflags: 0x2
// Checksum 0xa1320e63, Offset: 0xa8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"status_effect_blind", &__init__, undefined, undefined);
}

// Namespace status_effect_blind/status_effect_blind
// Params 0, eflags: 0x1 linked
// Checksum 0x694235fa, Offset: 0xf0
// Size: 0x6c
function __init__() {
    status_effect::register_status_effect_callback_apply(1, &blind_apply);
    status_effect::function_5bae5120(1, &function_8a261309);
    status_effect::function_6f4eaf88(getstatuseffect("blind"));
}

// Namespace status_effect_blind/status_effect_blind
// Params 3, eflags: 0x1 linked
// Checksum 0xda9a5e75, Offset: 0x168
// Size: 0x242
function blind_apply(var_756fda07, weapon, applicant) {
    self.owner.flashendtime = gettime() + var_756fda07.var_77449e9;
    self.owner.lastflashedby = applicant;
    if (self.owner == applicant) {
        return;
    }
    var_c94d654b = applicant getentitynumber();
    if (!isdefined(self.owner.var_b68518ab)) {
        self.owner.var_b68518ab = [];
    }
    blindarray = self.owner.var_b68518ab;
    if (!isdefined(blindarray[var_c94d654b])) {
        blindarray[var_c94d654b] = 0;
    }
    if (isdefined(blindarray[var_c94d654b]) && blindarray[var_c94d654b] + 3000 < gettime()) {
        if (isdefined(weapon) && weapon == getweapon(#"hash_3f62a872201cd1ce")) {
            if (isdefined(level.playgadgetsuccess)) {
                self.owner.var_ef9b6f0b = 1;
                level notify(#"hash_ac034f4f7553641");
                applicant.var_a467e27f = (isdefined(applicant.var_a467e27f) ? applicant.var_a467e27f : 0) + 1;
                if (isdefined(level.var_ac6052e9)) {
                    var_9194a036 = [[ level.var_ac6052e9 ]]("swatGrenadeSuccessLineCount", 0);
                }
                if (applicant.var_a467e27f == (isdefined(var_9194a036) ? var_9194a036 : 0)) {
                    applicant thread [[ level.playgadgetsuccess ]](getweapon(#"hash_3f62a872201cd1ce"), undefined, self.owner, undefined);
                }
            }
        }
        blindarray[var_c94d654b] = gettime();
    }
}

// Namespace status_effect_blind/status_effect_blind
// Params 0, eflags: 0x5 linked
// Checksum 0x2232af16, Offset: 0x3b8
// Size: 0x7e
function private function_8a261309() {
    if (isdefined(self.owner) && isdefined(self.owner.lastflashedby) && isdefined(self.owner.lastflashedby.var_a467e27f)) {
        self.owner.lastflashedby.var_a467e27f = 0;
    }
    if (isdefined(self.owner)) {
        self.owner.var_ef9b6f0b = 0;
    }
}

