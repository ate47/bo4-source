// Atian COD Tools GSC decompiler test
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/struct.gsc;
#include scripts/core_common/clientfield_shared.gsc;

#namespace zm_orange_debris_buys;

// Namespace zm_orange_debris_buys/zm_orange_debris_buys
// Params 0, eflags: 0x2
// Checksum 0x88dbed92, Offset: 0xc0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_orange_debris_buys", &init, undefined, undefined);
}

// Namespace zm_orange_debris_buys/zm_orange_debris_buys
// Params 0, eflags: 0x1 linked
// Checksum 0xcf44dff5, Offset: 0x108
// Size: 0x5c
function init() {
    clientfield::register("zbarrier", "" + #"hash_7e15d8abc4d6c79a", 24000, 1, "int");
    level thread function_ffef72a();
}

// Namespace zm_orange_debris_buys/zm_orange_debris_buys
// Params 0, eflags: 0x1 linked
// Checksum 0x2e2fbab1, Offset: 0x170
// Size: 0xa0
function function_ffef72a() {
    var_98415589 = getentarray("zombie_debris", "targetname");
    foreach (trigger in var_98415589) {
        trigger thread function_31a1d10f();
    }
}

// Namespace zm_orange_debris_buys/zm_orange_debris_buys
// Params 0, eflags: 0x1 linked
// Checksum 0xc4456010, Offset: 0x218
// Size: 0x298
function function_31a1d10f() {
    self endon(#"death");
    var_6a20a57a = struct::get_array(self.target + "_struct", "targetname");
    if (isdefined(var_6a20a57a[0])) {
        if (!isdefined(self.a_e_zbarriers)) {
            self.a_e_zbarriers = [];
        } else if (!isarray(self.a_e_zbarriers)) {
            self.a_e_zbarriers = array(self.a_e_zbarriers);
        }
        var_1151d2f8 = getentarray(var_6a20a57a[0].target, "targetname");
        foreach (e_debris in var_1151d2f8) {
            if (e_debris iszbarrier()) {
                if (!isdefined(self.a_e_zbarriers)) {
                    self.a_e_zbarriers = [];
                } else if (!isarray(self.a_e_zbarriers)) {
                    self.a_e_zbarriers = array(self.a_e_zbarriers);
                }
                self.a_e_zbarriers[self.a_e_zbarriers.size] = e_debris;
            }
        }
        self waittill(#"kill_debris_prompt_thread");
        foreach (e_zbarrier in self.a_e_zbarriers) {
            e_zbarrier playsound(#"hash_717ab767ebc92682");
            e_zbarrier clientfield::set("" + #"hash_7e15d8abc4d6c79a", 1);
        }
    }
}

