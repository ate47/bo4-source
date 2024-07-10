#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\struct.csc;

#namespace vehicle;

// Namespace vehicle/vehicleriders_shared
// Params 0, eflags: 0x2
// Checksum 0x7d0ce7d8, Offset: 0xf0
// Size: 0x14
function autoexec init() {
    function_d64f1d30();
}

// Namespace vehicle/vehicleriders_shared
// Params 0, eflags: 0x5 linked
// Checksum 0x13c27abc, Offset: 0x110
// Size: 0x280
function private function_d64f1d30() {
    a_registered_fields = [];
    foreach (bundle in struct::get_script_bundles("vehicleriders")) {
        foreach (object in bundle.objects) {
            if (isdefined(object.vehicleenteranim)) {
                array::add(a_registered_fields, object.position + "_enter", 0);
            }
            if (isdefined(object.vehicleexitanim)) {
                array::add(a_registered_fields, object.position + "_exit", 0);
            }
            if (isdefined(object.vehiclecloseanim)) {
                array::add(a_registered_fields, object.position + "_close", 0);
            }
            if (isdefined(object.vehicleriderdeathanim)) {
                array::add(a_registered_fields, object.position + "_death", 0);
            }
        }
    }
    foreach (str_clientfield in a_registered_fields) {
        clientfield::register("vehicle", str_clientfield, 1, 1, "counter", &play_vehicle_anim, 0, 0);
    }
}

// Namespace vehicle/vehicleriders_shared
// Params 7, eflags: 0x1 linked
// Checksum 0xb35f72d2, Offset: 0x398
// Size: 0x33c
function play_vehicle_anim(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    s_bundle = struct::get_script_bundle("vehicleriders", self.vehicleridersbundle);
    str_pos = "";
    str_action = "";
    if (strendswith(fieldname, "_enter")) {
        str_pos = getsubstr(fieldname, 0, fieldname.size - 6);
        str_action = "enter";
    } else if (strendswith(fieldname, "_exit")) {
        str_pos = getsubstr(fieldname, 0, fieldname.size - 5);
        str_action = "exit";
    } else if (strendswith(fieldname, "_close")) {
        str_pos = getsubstr(fieldname, 0, fieldname.size - 6);
        str_action = "close";
    } else if (strendswith(fieldname, "_death")) {
        str_pos = getsubstr(fieldname, 0, fieldname.size - 6);
        str_action = "death";
    }
    str_vh_anim = undefined;
    foreach (s_rider in s_bundle.objects) {
        if (s_rider.position == str_pos) {
            switch (str_action) {
            case #"enter":
                str_vh_anim = s_rider.vehicleenteranim;
                break;
            case #"exit":
                str_vh_anim = s_rider.vehicleexitanim;
                break;
            case #"close":
                str_vh_anim = s_rider.vehiclecloseanim;
                break;
            case #"death":
                str_vh_anim = s_rider.vehicleriderdeathanim;
                break;
            }
            break;
        }
    }
    if (isdefined(str_vh_anim)) {
        self setanimrestart(str_vh_anim);
    }
}

// Namespace vehicle/vehicleriders_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xd79dfb55, Offset: 0x6e0
// Size: 0x2a
function set_vehicleriders_bundle(str_bundlename) {
    self.vehicleriders = struct::get_script_bundle("vehicleriders", str_bundlename);
}

