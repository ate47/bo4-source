#using scripts\core_common\array_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\system_shared;

#namespace zm_orange_lights;

// Namespace zm_orange_lights/zm_orange_lights
// Params 0, eflags: 0x2
// Checksum 0x603f80cf, Offset: 0x288
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_orange_lights", &__init__, undefined, undefined);
}

// Namespace zm_orange_lights/zm_orange_lights
// Params 0, eflags: 0x1 linked
// Checksum 0x31c3ec71, Offset: 0x2d0
// Size: 0x2e
function __init__() {
    init_clientfields();
    level.var_13a6af33 = &function_619bb271;
}

// Namespace zm_orange_lights/zm_orange_lights
// Params 0, eflags: 0x1 linked
// Checksum 0x1773ba7c, Offset: 0x308
// Size: 0x1b4
function init_clientfields() {
    clientfield::register("world", "ship_lights_control", 24000, 1, "int", &ship_lights_control, 0, 0);
    clientfield::register("world", "lighthouse_lights_control", 24000, 1, "int", &lighthouse_lights_control, 0, 0);
    clientfield::register("world", "facility_lights_control", 24000, 1, "int", &facility_lights_control, 0, 0);
    clientfield::register("world", "infusion_lights_hot", 24000, 1, "int", &infusion_lights_hot, 0, 0);
    clientfield::register("world", "infusion_lights_cold", 24000, 1, "int", &infusion_lights_cold, 0, 0);
    clientfield::register("world", "orange_deactivate_radiant_exploders_client", 24000, 1, "counter", &orange_deactivate_radiant_exploders_client, 0, 0);
}

// Namespace zm_orange_lights/zm_orange_lights
// Params 7, eflags: 0x1 linked
// Checksum 0x56af7c8f, Offset: 0x4c8
// Size: 0xbc
function ship_lights_control(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        exploder::exploder("fxexp_script_ship_power");
        exploder::exploder("fx_power_on2");
        return;
    }
    if (newval == 0) {
        exploder::stop_exploder("fxexp_script_ship_power");
        exploder::stop_exploder("fx_power_on2");
    }
}

// Namespace zm_orange_lights/zm_orange_lights
// Params 7, eflags: 0x1 linked
// Checksum 0xb984ed03, Offset: 0x590
// Size: 0xec
function lighthouse_lights_control(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        exploder::exploder("fxexp_script_lighthouse_interior_power");
        exploder::exploder("fxexp_script_docks_power");
        exploder::exploder("fx_power_on1");
        return;
    }
    if (newval == 0) {
        exploder::stop_exploder("fxexp_script_lighthouse_interior_power");
        exploder::exploder("fxexp_script_docks_power");
        exploder::stop_exploder("fx_power_on1");
    }
}

// Namespace zm_orange_lights/zm_orange_lights
// Params 7, eflags: 0x1 linked
// Checksum 0x13a987b0, Offset: 0x688
// Size: 0x11c
function facility_lights_control(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        exploder::exploder("fxexp_script_facility_power_on");
        exploder::exploder("fxexp_script_facility_power_on_fx");
        exploder::exploder("fxexp_script_infusion_default");
        exploder::exploder("fxexp_script_facility_power_off");
        return;
    }
    if (newval == 0) {
        exploder::stop_exploder("fxexp_script_facility_power_on");
        exploder::stop_exploder("fxexp_script_facility_power_on_fx");
        exploder::stop_exploder("fxexp_script_infusion_default");
        exploder::stop_exploder("fxexp_script_facility_power_off");
    }
}

// Namespace zm_orange_lights/zm_orange_lights
// Params 7, eflags: 0x1 linked
// Checksum 0xa65c3344, Offset: 0x7b0
// Size: 0xbc
function infusion_lights_hot(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        exploder::stop_exploder("fxexp_script_infusion_default");
        exploder::exploder("fxexp_script_infusion_hot");
        return;
    }
    if (newval == 0) {
        exploder::stop_exploder("fxexp_script_infusion_hot");
        exploder::exploder("fxexp_script_infusion_default");
    }
}

// Namespace zm_orange_lights/zm_orange_lights
// Params 7, eflags: 0x1 linked
// Checksum 0xa66367e5, Offset: 0x878
// Size: 0xbc
function infusion_lights_cold(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        exploder::stop_exploder("fxexp_script_infusion_default");
        exploder::exploder("fxexp_script_infusion_cold");
        return;
    }
    if (newval == 0) {
        exploder::stop_exploder("fxexp_script_infusion_cold");
        exploder::exploder("fxexp_script_infusion_default");
    }
}

// Namespace zm_orange_lights/zm_orange_lights
// Params 1, eflags: 0x5 linked
// Checksum 0xe962bb02, Offset: 0x940
// Size: 0x4c
function private function_619bb271(string) {
    if (!isdefined(level.var_989f7c7c)) {
        level.var_989f7c7c = [];
    }
    array::add(level.var_989f7c7c, string, 0);
}

// Namespace zm_orange_lights/zm_orange_lights
// Params 7, eflags: 0x1 linked
// Checksum 0x4b50b6bb, Offset: 0x998
// Size: 0xe2
function orange_deactivate_radiant_exploders_client(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        if (isdefined(level.var_989f7c7c)) {
            foreach (exploder_id in level.var_989f7c7c) {
                exploder::kill_exploder(exploder_id);
                wait 0.3;
            }
            level.var_989f7c7c = undefined;
        }
    }
}

