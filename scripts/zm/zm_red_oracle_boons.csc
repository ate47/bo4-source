// Atian COD Tools GSC decompiler test
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\postfx_shared.csc;

#namespace zm_red_oracle_boons;

// Namespace zm_red_oracle_boons/zm_red_oracle_boons
// Params 0, eflags: 0x2
// Checksum 0x93eafd04, Offset: 0xa8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_red_oracle_boons", &__init__, undefined, undefined);
}

// Namespace zm_red_oracle_boons/zm_red_oracle_boons
// Params 0, eflags: 0x1 linked
// Checksum 0x7013dc24, Offset: 0xf0
// Size: 0xd4
function __init__() {
    n_bits = getminbitcountfornum(4);
    clientfield::register("item", "" + #"hash_7e5c581ade235dfc", 16000, n_bits, "int", &function_c0d2e1a2, 0, 0);
    clientfield::register("toplayer", "" + #"hash_403e80cafccc207c", 16000, 1, "int", &function_e634058b, 0, 0);
}

// Namespace zm_red_oracle_boons/zm_red_oracle_boons
// Params 7, eflags: 0x1 linked
// Checksum 0x38d2623f, Offset: 0x1d0
// Size: 0xf8
function function_c0d2e1a2(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval > 0) {
        e_player = getentbynum(localclientnum, newval - 1);
        a_e_players = getlocalplayers();
        if (array::contains(a_e_players, e_player)) {
            self thread function_cd5f9803(localclientnum);
            self playrenderoverridebundle(#"hash_46a64e44ebfa3078");
        }
        return;
    }
    level notify(#"hash_5a7453176272efff");
}

// Namespace zm_red_oracle_boons/zm_red_oracle_boons
// Params 1, eflags: 0x5 linked
// Checksum 0x3e7d3119, Offset: 0x2d0
// Size: 0x5c
function private function_cd5f9803(localclientnum) {
    self waittill(#"hash_5a7453176272efff", #"death");
    if (isdefined(self)) {
        self stoprenderoverridebundle(#"hash_46a64e44ebfa3078");
    }
}

// Namespace zm_red_oracle_boons/zm_red_oracle_boons
// Params 7, eflags: 0x5 linked
// Checksum 0x8886a86c, Offset: 0x338
// Size: 0x8c
function private function_e634058b(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump) {
    if (newvalue) {
        self thread postfx::playpostfxbundle(#"hash_2b92b9e84c59cfe4");
        return;
    }
    self thread postfx::exitpostfxbundle(#"hash_2b92b9e84c59cfe4");
}

