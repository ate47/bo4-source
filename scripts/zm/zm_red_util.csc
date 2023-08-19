// Atian COD Tools GSC decompiler test
#include scripts/core_common/clientfield_shared.csc;
#include script_63fbdc46fe0ddab1;

#namespace zm_red_util;

// Namespace zm_red_util/zm_red_util
// Params 0, eflags: 0x1 linked
// Checksum 0x26c1e05c, Offset: 0xd0
// Size: 0x7e
function init() {
    clientfield::register("toplayer", "zm_red_timer", 16000, getminbitcountfornum(120), "int", &function_bb753058, 0, 1);
    level.var_d0d80ff8 = zm_red_challenges_hud::register("zm_red_challenges_hud");
}

// Namespace zm_red_util/zm_red_util
// Params 7, eflags: 0x5 linked
// Checksum 0xd528e481, Offset: 0x158
// Size: 0x124
function private function_bb753058(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (!function_65b9eb0f(localclientnum)) {
        timer_model = function_c8b7588d(localclientnum);
        end_time = undefined;
        if (!binitialsnap && newval == 0 && isdefined(level.var_79795e1)) {
            end_time = level.var_79795e1;
        } else {
            duration_msec = newval * 1000;
            level.var_79795e1 = getservertime(localclientnum, 1) + duration_msec;
            end_time = level.var_79795e1;
        }
        if (isdefined(end_time)) {
            setuimodelvalue(timer_model, end_time);
        }
    }
}

// Namespace zm_red_util/zm_red_util
// Params 1, eflags: 0x5 linked
// Checksum 0xabad58f4, Offset: 0x288
// Size: 0x4a
function private function_c8b7588d(localclientnum) {
    controller_model = getuimodelforcontroller(localclientnum);
    return createuimodel(controller_model, "ZMHud.zmRedChallengeTimer");
}

