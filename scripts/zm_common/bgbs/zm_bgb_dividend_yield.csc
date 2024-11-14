#using scripts\zm_common\zm_bgb;
#using scripts\core_common\util_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\clientfield_shared;

#namespace zm_bgb_dividend_yield;

// Namespace zm_bgb_dividend_yield/zm_bgb_dividend_yield
// Params 0, eflags: 0x2
// Checksum 0xf21acac1, Offset: 0xf0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_dividend_yield", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_dividend_yield/zm_bgb_dividend_yield
// Params 0, eflags: 0x1 linked
// Checksum 0x7ebb8698, Offset: 0x140
// Size: 0x10a
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    clientfield::register("allplayers", "" + #"hash_11a25fb3db96fc2d", 1, 1, "int", &function_441dc042, 0, 0);
    clientfield::register("toplayer", "" + #"hash_31b61c511ced94d7", 1, 1, "int", &function_1e792793, 0, 1);
    bgb::register(#"zm_bgb_dividend_yield", "time");
    level.var_b28c30ba = [];
}

// Namespace zm_bgb_dividend_yield/zm_bgb_dividend_yield
// Params 7, eflags: 0x1 linked
// Checksum 0x2024bdf2, Offset: 0x258
// Size: 0x12c
function function_441dc042(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    e_local_player = function_5c10bd79(localclientnum);
    if (newval) {
        if (e_local_player != self) {
            if (!isdefined(self.var_4399fda6)) {
                self.var_4399fda6 = [];
            }
            if (isdefined(self.var_4399fda6[localclientnum])) {
                return;
            }
            self.var_4399fda6[localclientnum] = util::playfxontag(localclientnum, "zombie/fx_bgb_profit_3p", self, "j_spine4");
        }
        return;
    }
    if (isdefined(self.var_4399fda6) && isdefined(self.var_4399fda6[localclientnum])) {
        stopfx(localclientnum, self.var_4399fda6[localclientnum]);
        self.var_4399fda6[localclientnum] = undefined;
    }
}

// Namespace zm_bgb_dividend_yield/zm_bgb_dividend_yield
// Params 7, eflags: 0x1 linked
// Checksum 0xa9436c5a, Offset: 0x390
// Size: 0x104
function function_1e792793(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        if (isdefined(level.var_b28c30ba[localclientnum])) {
            deletefx(localclientnum, level.var_b28c30ba[localclientnum]);
        }
        level.var_b28c30ba[localclientnum] = playfxoncamera(localclientnum, "zombie/fx_bgb_profit_1p", (0, 0, 0), (1, 0, 0));
        return;
    }
    if (isdefined(level.var_b28c30ba[localclientnum])) {
        stopfx(localclientnum, level.var_b28c30ba[localclientnum]);
        level.var_b28c30ba[localclientnum] = undefined;
    }
}

