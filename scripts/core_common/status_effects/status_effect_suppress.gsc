#using scripts\core_common\callbacks_shared;
#using scripts\core_common\serverfield_shared;
#using scripts\core_common\status_effects\status_effect_util;
#using scripts\core_common\system_shared;

#namespace status_effect_suppress;

// Namespace status_effect_suppress/status_effect_suppress
// Params 0, eflags: 0x2
// Checksum 0xcc3d92e0, Offset: 0xb8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"status_effect_suppress", &__init__, undefined, undefined);
}

// Namespace status_effect_suppress/status_effect_suppress
// Params 0, eflags: 0x0
// Checksum 0xf1d684a7, Offset: 0x100
// Size: 0xc4
function __init__() {
    status_effect::register_status_effect_callback_apply(4, &suppress_apply);
    status_effect::function_5bae5120(4, &registersamanthas_bundle);
    status_effect::function_6f4eaf88(getstatuseffect("suppress"));
    serverfield::register("status_effect_suppress_field", 1, 5, "int", &function_aa232314);
    callback::on_spawned(&onplayerspawned);
}

// Namespace status_effect_suppress/status_effect_suppress
// Params 3, eflags: 0x0
// Checksum 0xce994c02, Offset: 0x1d0
// Size: 0x1c
function suppress_apply(var_756fda07, weapon, applicant) {
    
}

// Namespace status_effect_suppress/status_effect_suppress
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0x1f8
// Size: 0x4
function registersamanthas_bundle() {
    
}

// Namespace status_effect_suppress/status_effect_suppress
// Params 2, eflags: 0x4
// Checksum 0x13e065f1, Offset: 0x208
// Size: 0x2b6
function private function_aa232314(oldval, newval) {
    if (oldval != newval) {
        if (newval) {
            self.var_dc148218 = 1;
            if (newval > 1) {
                var_4d81e7b4 = newval - 2;
                foreach (player in level.players) {
                    if (!isdefined(player)) {
                        continue;
                    }
                    if (player getentitynumber() == var_4d81e7b4) {
                        self.var_ead9cdbf = player;
                        break;
                    }
                }
            }
            var_2deafbea = function_1115bceb(#"suppress");
            self.var_14407070 = {};
            if (isdefined(var_2deafbea.var_b86e9a5e)) {
                self playlocalsound(var_2deafbea.var_b86e9a5e);
            }
            if (isdefined(var_2deafbea.var_801118b0)) {
                self playloopsound(var_2deafbea.var_801118b0);
                self.var_14407070.var_801118b0 = var_2deafbea.var_801118b0;
            }
            if (isdefined(var_2deafbea.var_36c77790)) {
                self.var_14407070.var_36c77790 = var_2deafbea.var_36c77790;
            }
            return;
        }
        self.var_dc148218 = 0;
        self.var_ead9cdbf = undefined;
        if (isdefined(self.var_14407070) && isdefined(self.var_14407070.var_36c77790)) {
            if (isplayer(self)) {
                self playlocalsound(self.var_14407070.var_36c77790);
            }
        }
        if (isdefined(self.var_14407070) && isdefined(self.var_14407070.var_801118b0)) {
            if (isplayer(self)) {
                self stoploopsound(0.5);
            }
        }
        self.var_14407070 = undefined;
    }
}

// Namespace status_effect_suppress/status_effect_suppress
// Params 0, eflags: 0x4
// Checksum 0x9b99650a, Offset: 0x4c8
// Size: 0xe
function private onplayerspawned() {
    self.var_dc148218 = 0;
}

