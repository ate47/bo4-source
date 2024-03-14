// Atian COD Tools GSC decompiler test
#using scripts\core_common\vehicle_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\filter_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace recon_wz;

// Namespace recon_wz/recon_wz
// Params 0, eflags: 0x2
// Checksum 0xdb1a8669, Offset: 0xf0
// Size: 0x34
function autoexec __init__system__() {
    system::register("recon_wz", &__init__, undefined, undefined);
}

// Namespace recon_wz/recon_wz
// Params 0, eflags: 0x0
// Checksum 0xa19d1b41, Offset: 0x130
// Size: 0xbc
function __init__() {
    clientfield::register("toplayer", "recon_out_of_circle", 1, 5, "int", &function_a94aaca4, 0, 0);
    clientfield::register("toplayer", "recon_static_postfx", 1, 1, "int", &function_b53c3ad2, 0, 0);
    vehicle::add_vehicletype_callback("recon_wz", &_setup_);
}

// Namespace recon_wz/recon_wz
// Params 1, eflags: 0x0
// Checksum 0x117526f8, Offset: 0x1f8
// Size: 0x24
function _setup_(localclientnum) {
    self thread vehicle::boost_think(localclientnum);
}

// Namespace recon_wz/recon_wz
// Params 7, eflags: 0x0
// Checksum 0x6d06aad, Offset: 0x228
// Size: 0x7e
function function_a94aaca4(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 0) {
        if (isdefined(self.var_2d39c392) && self.var_2d39c392) {
            filter::disable_filter_vehicle_hijack_oor(self, 0);
            self.var_2d39c392 = undefined;
        }
    }
}

// Namespace recon_wz/recon_wz
// Params 7, eflags: 0x0
// Checksum 0xe0afb92e, Offset: 0x2b0
// Size: 0xae
function function_b53c3ad2(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self thread function_d765daa4(localclientnum);
        return;
    }
    self notify(#"hash_16c59bda348653cd");
    if (isdefined(self.var_2d39c392) && self.var_2d39c392) {
        filter::disable_filter_vehicle_hijack_oor(self, 0);
        self.var_2d39c392 = undefined;
    }
}

// Namespace recon_wz/recon_wz
// Params 1, eflags: 0x4
// Checksum 0x92e329f4, Offset: 0x368
// Size: 0x226
function private function_d765daa4(localclientnum) {
    self notify("214105bf7d36e37f");
    self endon("214105bf7d36e37f");
    self endon(#"death");
    self endon(#"exit_vehicle");
    self endon(#"hash_16c59bda348653cd");
    while (true) {
        vehicle = getplayervehicle(self);
        if (isdefined(vehicle)) {
            break;
        }
        waitframe(1);
    }
    vehicle endon(#"death");
    filter::init_filter_vehicle_hijack_oor(self);
    while (true) {
        var_e96a9222 = self clientfield::get_to_player("recon_out_of_circle") / 31;
        var_2a1bc201 = distance(self.origin, vehicle.origin);
        if (var_2a1bc201 < 7000 && var_e96a9222 <= 0) {
            if (isdefined(self.var_2d39c392) && self.var_2d39c392) {
                filter::disable_filter_vehicle_hijack_oor(self, 0);
                self.var_2d39c392 = undefined;
            }
        } else {
            staticamount = mapfloat(7000, 8000, 0, 1, var_2a1bc201);
            staticamount = max(staticamount, var_e96a9222);
            if (!(isdefined(self.var_2d39c392) && self.var_2d39c392)) {
                filter::enable_filter_vehicle_hijack_oor(self, 0);
                self.var_2d39c392 = 1;
            }
            filter::set_filter_vehicle_hijack_oor_amount(self, 0, staticamount);
        }
        waitframe(1);
    }
}

