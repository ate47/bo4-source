// Atian COD Tools GSC decompiler test
#include scripts/core_common/clientfield_shared.csc;
#include scripts/core_common/system_shared.csc;

#namespace zm_weap_tesla_sniper_t8;

// Namespace zm_weap_tesla_sniper_t8/zm_weap_tesla_sniper_t8
// Params 0, eflags: 0x2
// Checksum 0xf1b63f5a, Offset: 0x180
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"tesla_sniper", &__init__, undefined, undefined);
}

// Namespace zm_weap_tesla_sniper_t8/zm_weap_tesla_sniper_t8
// Params 0, eflags: 0x1 linked
// Checksum 0x2ebafa7b, Offset: 0x1c8
// Size: 0x134
function __init__() {
    level.w_tesla_sniper_t8 = getweapon(#"ww_tesla_sniper_t8");
    level.w_tesla_sniper_upgraded_t8 = getweapon(#"ww_tesla_sniper_upgraded_t8");
    level.var_490afdb9 = array(undefined, "zm_weapons/fx8_ww_tesla_sniper_bulb_d", "zm_weapons/fx8_ww_tesla_sniper_bulb_c", "zm_weapons/fx8_ww_tesla_sniper_bulb_b", "zm_weapons/fx8_ww_tesla_sniper_bulb_a");
    clientfield::register("toplayer", "" + #"hash_3aad9502fc3b54f2", 24000, 1, "int", &function_87dc06ae, 0, 0);
    clientfield::register("actor", "zm_weapons/fx8_ww_tesla_sniper_impact_lg", 24000, 1, "counter", &function_190ae9a1, 0, 0);
}

// Namespace zm_weap_tesla_sniper_t8/zm_weap_tesla_sniper_t8
// Params 7, eflags: 0x5 linked
// Checksum 0xed4242f, Offset: 0x308
// Size: 0xbc
function private function_190ae9a1(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    origin = self gettagorigin("j_spine4");
    if (isdefined(self) && newval && isdefined(origin)) {
        playfx(localclientnum, "zm_weapons/fx8_ww_tesla_sniper_impact_lg", self gettagorigin("j_spine4"));
    }
}

// Namespace zm_weap_tesla_sniper_t8/zm_weap_tesla_sniper_t8
// Params 7, eflags: 0x1 linked
// Checksum 0xcb9dfc58, Offset: 0x3d0
// Size: 0x8c
function function_87dc06ae(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval) {
        self thread function_2d6416dc(localclientnum);
    } else {
        self notify(#"hash_319d2bba47dac2c4");
        self function_a6907b54(localclientnum);
    }
}

// Namespace zm_weap_tesla_sniper_t8/zm_weap_tesla_sniper_t8
// Params 1, eflags: 0x1 linked
// Checksum 0xa6d379d8, Offset: 0x468
// Size: 0x242
function function_2d6416dc(localclientnum) {
    self endon(#"death", #"hash_319d2bba47dac2c4");
    w_current = getcurrentweapon(localclientnum);
    n_clip_size = w_current.clipsize;
    if (!isdefined(n_clip_size) || n_clip_size == 0) {
        if (w_current === level.w_tesla_sniper_upgraded_t8) {
            n_clip_size = 16;
        } else {
            n_clip_size = 8;
        }
    }
    if (!isdefined(self.var_7ad5becf)) {
        self.var_7ad5becf = [];
    }
    while (1) {
        wait(0.1);
        if (viewmodelhastag(localclientnum, "tag_flash")) {
            n_ammo = getweaponammoclip(localclientnum, w_current);
            var_b59ce28 = n_ammo / n_clip_size;
            var_7ec33855 = int(ceil(var_b59ce28 * 4));
            for (i = 1; i <= 4; i++) {
                if (i <= var_7ec33855 && !isdefined(self.var_7ad5becf[i])) {
                    self.var_7ad5becf[i] = playviewmodelfx(localclientnum, level.var_490afdb9[i], "tag_flash");
                }
                if (i > var_7ec33855 && isdefined(self.var_7ad5becf[i])) {
                    deletefx(localclientnum, self.var_7ad5becf[i], 1);
                    i = [];
                }
            }
        }
    }
}

// Namespace zm_weap_tesla_sniper_t8/zm_weap_tesla_sniper_t8
// Params 1, eflags: 0x1 linked
// Checksum 0x1eab2c20, Offset: 0x6b8
// Size: 0x7e
function function_a6907b54(localclientnum) {
    for (i = 1; i <= 4; i++) {
        if (isdefined(self.var_7ad5becf[i])) {
            deletefx(localclientnum, self.var_7ad5becf[i], 1);
            i = [];
        }
    }
}

