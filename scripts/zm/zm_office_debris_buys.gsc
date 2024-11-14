#using scripts\core_common\system_shared;
#using scripts\core_common\struct;
#using scripts\core_common\clientfield_shared;

#namespace zm_office_debris_buys;

// Namespace zm_office_debris_buys/zm_office_debris_buys
// Params 0, eflags: 0x2
// Checksum 0xa3e49e1a, Offset: 0xc0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_office_debris_buys", &init, undefined, undefined);
}

// Namespace zm_office_debris_buys/zm_office_debris_buys
// Params 0, eflags: 0x1 linked
// Checksum 0xa5d7faa8, Offset: 0x108
// Size: 0x5c
function init() {
    clientfield::register("zbarrier", "" + #"hash_7e15d8abc4d6c79a", 1, 1, "int");
    level thread function_ffef72a();
}

// Namespace zm_office_debris_buys/zm_office_debris_buys
// Params 0, eflags: 0x1 linked
// Checksum 0x229d5408, Offset: 0x170
// Size: 0xa0
function function_ffef72a() {
    var_98415589 = getentarray("zombie_debris", "targetname");
    foreach (trigger in var_98415589) {
        trigger thread function_31a1d10f();
    }
}

// Namespace zm_office_debris_buys/zm_office_debris_buys
// Params 0, eflags: 0x1 linked
// Checksum 0x8216e49d, Offset: 0x218
// Size: 0x288
function function_31a1d10f() {
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
            e_zbarrier playsound(#"hash_144408a3c1139f01");
            e_zbarrier clientfield::set("" + #"hash_7e15d8abc4d6c79a", 1);
        }
    }
}

