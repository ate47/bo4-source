#using scripts\core_common\clientfield_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\zm_bgb;
#using scripts\zm_common\zm_utility;

#namespace zm_bgb_burned_out;

// Namespace zm_bgb_burned_out/zm_bgb_burned_out
// Params 0, eflags: 0x2
// Checksum 0x13c58cb1, Offset: 0x1b8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_burned_out", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_burned_out/zm_bgb_burned_out
// Params 0, eflags: 0x0
// Checksum 0x603df02, Offset: 0x208
// Size: 0x222
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_burned_out", "event");
    clientfield::register("toplayer", "zm_bgb_burned_out" + "_1p" + "toplayer", 1, 1, "counter", &function_874dcef1, 0, 0);
    clientfield::register("allplayers", "zm_bgb_burned_out" + "_3p" + "_allplayers", 1, 1, "counter", &function_5b403c46, 0, 0);
    clientfield::register("actor", "zm_bgb_burned_out" + "_fire_torso" + "_actor", 1, 1, "counter", &function_908b00b2, 0, 0);
    clientfield::register("vehicle", "zm_bgb_burned_out" + "_fire_torso" + "_vehicle", 1, 1, "counter", &function_35616d2, 0, 0);
    level._effect["zm_bgb_burned_out" + "_1p"] = "zombie/fx_bgb_burned_out_1p_zmb";
    level._effect["zm_bgb_burned_out" + "_3p"] = "zombie/fx_bgb_burned_out_3p_zmb";
    level._effect["zm_bgb_burned_out" + "_fire_torso"] = "zombie/fx_bgb_burned_out_fire_torso_zmb";
}

// Namespace zm_bgb_burned_out/zm_bgb_burned_out
// Params 7, eflags: 0x0
// Checksum 0x2f4cd058, Offset: 0x438
// Size: 0x94
function function_874dcef1(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (self zm_utility::function_f8796df3(localclientnum)) {
        util::playfxontag(localclientnum, level._effect["zm_bgb_burned_out" + "_1p"], self, "tag_origin");
    }
}

// Namespace zm_bgb_burned_out/zm_bgb_burned_out
// Params 7, eflags: 0x0
// Checksum 0xba0368ba, Offset: 0x4d8
// Size: 0x94
function function_5b403c46(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (!self zm_utility::function_f8796df3(localclientnum)) {
        util::playfxontag(localclientnum, level._effect["zm_bgb_burned_out" + "_3p"], self, "tag_origin");
    }
}

// Namespace zm_bgb_burned_out/zm_bgb_burned_out
// Params 7, eflags: 0x0
// Checksum 0x7c84ec1e, Offset: 0x578
// Size: 0x10a
function function_908b00b2(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    var_54e59513 = "j_spinelower";
    if (isdefined(self gettagorigin(var_54e59513))) {
        var_54e59513 = "tag_origin";
    }
    util::playfxontag(localclientnum, level._effect["zm_bgb_burned_out" + "_fire_torso"], self, var_54e59513);
    if (!isdefined(self.var_de2c8500)) {
        self playsound(localclientnum, #"hash_4539c48ed56aa72b");
        self.var_de2c8500 = self playloopsound(#"hash_729fda7f41c1cb45");
    }
}

// Namespace zm_bgb_burned_out/zm_bgb_burned_out
// Params 7, eflags: 0x0
// Checksum 0xfecc54bd, Offset: 0x690
// Size: 0x10a
function function_35616d2(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    var_54e59513 = "tag_body";
    if (isdefined(self gettagorigin(var_54e59513))) {
        var_54e59513 = "tag_origin";
    }
    util::playfxontag(localclientnum, level._effect["zm_bgb_burned_out" + "_fire_torso"], self, var_54e59513);
    if (!isdefined(self.var_de2c8500)) {
        self playsound(localclientnum, #"hash_4539c48ed56aa72b");
        self.var_de2c8500 = self playloopsound(#"hash_729fda7f41c1cb45");
    }
}

