// Atian COD Tools GSC decompiler test
#using scripts\core_common\filter_shared.csc;
#using scripts\core_common\vehicle_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\struct.csc;

#namespace dart_wz;

// Namespace dart_wz/dart_wz
// Params 0, eflags: 0x2
// Checksum 0x81c5885d, Offset: 0x148
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"dart_wz", &__init__, undefined, undefined);
}

// Namespace dart_wz/dart_wz
// Params 0, eflags: 0x1 linked
// Checksum 0x9c9fda0b, Offset: 0x190
// Size: 0xdc
function __init__() {
    clientfield::register("toplayer", "dart_wz_out_of_circle", 24000, 5, "int", &function_a94aaca4, 0, 0);
    clientfield::register("toplayer", "dart_wz_static_postfx", 24000, 1, "int", &function_2d1ff9c7, 0, 0);
    clientfield::register("vehicle", "dart_wz_timeout_beep", 24000, 1, "int", &timeout_beep, 0, 0);
}

// Namespace dart_wz/dart_wz
// Params 7, eflags: 0x1 linked
// Checksum 0x4ea6136d, Offset: 0x278
// Size: 0x7e
function function_a94aaca4(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 0) {
        if (isdefined(self.var_2d39c392) && self.var_2d39c392) {
            filter::disable_filter_vehicle_hijack_oor(self, 0);
            self.var_2d39c392 = undefined;
        }
    }
}

// Namespace dart_wz/dart_wz
// Params 7, eflags: 0x1 linked
// Checksum 0x22ce330b, Offset: 0x300
// Size: 0xc6
function function_2d1ff9c7(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self thread dart_static_postfx(localclientnum);
    } else {
        self notify(#"hash_16c59bda348653cd");
        if (isdefined(self.var_ed19a23) && self.var_ed19a23) {
            filter::disable_filter_vehicle_hijack_oor(self, 0);
            function_32a729d9(localclientnum, 0);
            self.var_ed19a23 = undefined;
        }
    }
}

// Namespace dart_wz/dart_wz
// Params 2, eflags: 0x5 linked
// Checksum 0x831ea2d6, Offset: 0x3d0
// Size: 0x6c
function private function_32a729d9(localclientnum, value) {
    model = getuimodel(getuimodelforcontroller(localclientnum), "vehicle.outOfRange");
    if (isdefined(model)) {
        setuimodelvalue(model, value);
    }
}

// Namespace dart_wz/dart_wz
// Params 1, eflags: 0x5 linked
// Checksum 0xedce0dd4, Offset: 0x448
// Size: 0x25e
function private dart_static_postfx(localclientnum) {
    self notify("3edfd3cf94760371");
    self endon("3edfd3cf94760371");
    self endon(#"death", #"exit_vehicle", #"hash_16c59bda348653cd");
    while (1) {
        vehicle = getplayervehicle(self);
        if (isdefined(vehicle)) {
            break;
        }
        waitframe(1);
    }
    vehicle endon(#"death");
    filter::init_filter_vehicle_hijack_oor(self);
    while (1) {
        var_e96a9222 = self clientfield::get_to_player("dart_wz_out_of_circle") / 31;
        var_2a1bc201 = distance(self.origin, vehicle.origin);
        if (1 && var_2a1bc201 < 7000 && var_e96a9222 <= 0) {
            if (isdefined(self.var_ed19a23) && self.var_ed19a23) {
                filter::disable_filter_vehicle_hijack_oor(self, 0);
                function_32a729d9(localclientnum, 0);
                self.var_ed19a23 = undefined;
            }
        } else {
            staticamount = mapfloat(7000, 8000, 0, 1, var_2a1bc201);
            staticamount = max(staticamount, var_e96a9222);
            if (!(isdefined(self.var_ed19a23) && self.var_ed19a23)) {
                filter::enable_filter_vehicle_hijack_oor(self, 0);
                function_32a729d9(localclientnum, 1);
                self.var_ed19a23 = 1;
            }
            filter::set_filter_vehicle_hijack_oor_amount(self, 0, staticamount);
        }
        waitframe(1);
    }
}

// Namespace dart_wz/dart_wz
// Params 7, eflags: 0x1 linked
// Checksum 0x427cfec3, Offset: 0x6b0
// Size: 0x182
function timeout_beep(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self notify(#"timeout_beep");
    if (!newval) {
        return;
    }
    self endon(#"death", #"exit_vehicle", #"timeout_beep");
    interval = 1;
    time = gettime();
    var_ff8d278a = time + 30000 - 4000;
    while (1) {
        var_91e09a3a = 1;
        driver = self getlocalclientdriver();
        if (isdefined(driver)) {
            self playsound(localclientnum, "veh_dart_timer_alert");
        }
        if (gettime() >= var_ff8d278a) {
            interval = 0.133;
        }
        util::server_wait(localclientnum, interval);
        interval = math::clamp(interval / 1.17, 0.1, 1);
    }
}

