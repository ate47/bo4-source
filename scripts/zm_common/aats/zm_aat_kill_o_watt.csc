#using scripts\zm_common\zm_utility;
#using scripts\zm\zm_lightning_chain;
#using scripts\core_common\util_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\aat_shared;

#namespace zm_aat_kill_o_watt;

// Namespace zm_aat_kill_o_watt/zm_aat_kill_o_watt
// Params 0, eflags: 0x2
// Checksum 0x33c99b1d, Offset: 0x198
// Size: 0x34
function autoexec __init__system__() {
    system::register("zm_aat_kill_o_watt", &__init__, undefined, undefined);
}

// Namespace zm_aat_kill_o_watt/zm_aat_kill_o_watt
// Params 0, eflags: 0x1 linked
// Checksum 0x91893aa4, Offset: 0x1d8
// Size: 0x194
function __init__() {
    if (!(isdefined(level.aat_in_use) && level.aat_in_use)) {
        return;
    }
    aat::register("zm_aat_kill_o_watt", #"hash_17fd44c733f7c66b", "t7_icon_zm_aat_dead_wire");
    clientfield::register("actor", "zm_aat_kill_o_watt" + "_explosion", 1, 1, "counter", &function_d2ca081b, 0, 0);
    clientfield::register("vehicle", "zm_aat_kill_o_watt" + "_explosion", 1, 1, "counter", &function_d2ca081b, 0, 0);
    clientfield::register("actor", "zm_aat_kill_o_watt" + "_zap", 1, 1, "int", &function_846837f, 0, 0);
    clientfield::register("vehicle", "zm_aat_kill_o_watt" + "_zap", 1, 1, "int", &function_846837f, 0, 0);
}

// Namespace zm_aat_kill_o_watt/zm_aat_kill_o_watt
// Params 7, eflags: 0x1 linked
// Checksum 0xd2afbccf, Offset: 0x378
// Size: 0x196
function function_846837f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        str_fx_tag = self zm_utility::function_467efa7b(1);
        if (!isdefined(str_fx_tag)) {
            str_fx_tag = "tag_origin";
        }
        self.var_548620a = util::playfxontag(localclientnum, "zm_weapons/fx8_aat_elec_torso", self, str_fx_tag);
        self.var_9fddda59 = util::playfxontag(localclientnum, "zm_weapons/fx8_aat_elec_eye", self, "j_eyeball_le");
        if (!isdefined(self.var_6a8124b)) {
            self.var_6a8124b = self playloopsound("zmb_aat_kilowatt_stunned_lp");
        }
        return;
    }
    if (isdefined(self.var_548620a)) {
        stopfx(localclientnum, self.var_548620a);
        self.var_548620a = undefined;
        stopfx(localclientnum, self.var_9fddda59);
        self.var_9fddda59 = undefined;
        if (isdefined(self.var_6a8124b)) {
            self stoploopsound(self.var_6a8124b);
            self.var_6a8124b = undefined;
        }
    }
}

// Namespace zm_aat_kill_o_watt/zm_aat_kill_o_watt
// Params 7, eflags: 0x1 linked
// Checksum 0xb925b715, Offset: 0x518
// Size: 0xd4
function function_d2ca081b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self)) {
        v_fx_origin = self gettagorigin(self zm_utility::function_467efa7b(1));
        if (!isdefined(v_fx_origin)) {
            v_fx_origin = self.origin;
        }
        playfx(localclientnum, "zm_weapons/fx8_aat_elec_exp", v_fx_origin);
        self playsound(localclientnum, #"zmb_aat_kilowatt_explode");
    }
}

