#using script_70ab01a7690ea256;
#using scripts\core_common\ai_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\postfx_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\zm_utility;

#namespace zm_weap_katana;

// Namespace zm_weap_katana/zm_weap_katana
// Params 0, eflags: 0x2
// Checksum 0x9eff8cac, Offset: 0x110
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_weap_katana", &__init__, undefined, undefined);
}

// Namespace zm_weap_katana/zm_weap_katana
// Params 0, eflags: 0x0
// Checksum 0x21e5b5ac, Offset: 0x158
// Size: 0x10c
function __init__() {
    clientfield::register("toplayer", "" + #"hero_katana_vigor_postfx", 1, 1, "counter", &function_d05553c6, 0, 0);
    clientfield::register("allplayers", "" + #"katana_rush_postfx", 1, 1, "int", &katana_rush_postfx, 0, 1);
    clientfield::register("allplayers", "" + #"katana_rush_sfx", 1, 1, "int", &katana_rush_sfx, 0, 1);
}

// Namespace zm_weap_katana/zm_weap_katana
// Params 7, eflags: 0x4
// Checksum 0x4078eb0b, Offset: 0x270
// Size: 0x8c
function private function_d05553c6(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump) {
    if (newvalue && !namespace_a6aea2c6::is_active(#"silent_film")) {
        self thread postfx::playpostfxbundle(#"hash_4e5b35f770492ddb");
    }
}

// Namespace zm_weap_katana/zm_weap_katana
// Params 7, eflags: 0x0
// Checksum 0xc6d651fb, Offset: 0x308
// Size: 0x3b0
function katana_rush_postfx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (!isdefined(self.var_d3d459f)) {
        self.var_d3d459f = [];
    }
    if (!isdefined(self.var_d3d459f[localclientnum])) {
        self.var_d3d459f[localclientnum] = [];
    }
    if (newval == 1) {
        if (self.weapon !== getweapon(#"hero_katana_t8_lv3")) {
            return;
        }
        if (self getlocalclientnumber() === localclientnum) {
            self thread postfx::playpostfxbundle(#"hash_34ce6f9f022458f8");
            self thread function_66752a96(localclientnum);
            a_e_players = getlocalplayers();
            foreach (e_player in a_e_players) {
                if (!e_player util::function_50ed1561(localclientnum)) {
                    e_player thread zm_utility::function_bb54a31f(localclientnum, #"hash_34ce6f9f022458f8", #"hash_49e404aa0d33e9ac");
                }
            }
        } else if (self hasdobj(localclientnum)) {
            self.var_d3d459f[localclientnum] = playtagfxset(localclientnum, "weapon_katana_smoke_3p", self);
        }
        return;
    }
    if (self getlocalclientnumber() === localclientnum) {
        self postfx::stoppostfxbundle(#"hash_34ce6f9f022458f8");
        self thread function_82ee4d9d(localclientnum);
        a_e_players = getlocalplayers();
        foreach (e_player in a_e_players) {
            if (!e_player util::function_50ed1561(localclientnum)) {
                e_player notify(#"hash_49e404aa0d33e9ac");
            }
        }
        return;
    }
    if (isdefined(self.var_d3d459f[localclientnum])) {
        foreach (fx in self.var_d3d459f[localclientnum]) {
            stopfx(localclientnum, fx);
        }
        self.var_d3d459f[localclientnum] = undefined;
    }
}

// Namespace zm_weap_katana/zm_weap_katana
// Params 1, eflags: 0x4
// Checksum 0x51c4d771, Offset: 0x6c0
// Size: 0xc8
function private function_66752a96(localclientnum) {
    ai::add_ai_spawn_function(&function_74541167);
    a_ai = getentarraybytype(localclientnum, 15);
    foreach (ai in a_ai) {
        ai thread function_74541167(localclientnum);
    }
}

// Namespace zm_weap_katana/zm_weap_katana
// Params 1, eflags: 0x4
// Checksum 0xd3124b15, Offset: 0x790
// Size: 0xa2
function private function_74541167(localclientnum) {
    if (!isdefined(self.var_1030ad00)) {
        self.var_1030ad00 = [];
    }
    if (!isdefined(self.var_1030ad00[localclientnum])) {
        self.var_1030ad00[localclientnum] = [];
    }
    if (!self.var_1030ad00[localclientnum].size && self hasdobj(localclientnum)) {
        self.var_1030ad00[localclientnum] = playtagfxset(localclientnum, "weapon_katana_zmb_smoke_3p", self);
    }
}

// Namespace zm_weap_katana/zm_weap_katana
// Params 1, eflags: 0x4
// Checksum 0x112398b7, Offset: 0x840
// Size: 0x164
function private function_82ee4d9d(localclientnum) {
    ai::function_932006d1(&function_74541167);
    a_ai = getentarraybytype(localclientnum, 15);
    foreach (ai in a_ai) {
        if (isdefined(ai.var_1030ad00) && isdefined(ai.var_1030ad00[localclientnum])) {
            foreach (fx in ai.var_1030ad00[localclientnum]) {
                killfx(localclientnum, fx);
            }
            ai.var_1030ad00[localclientnum] = undefined;
        }
    }
}

// Namespace zm_weap_katana/zm_weap_katana
// Params 7, eflags: 0x0
// Checksum 0x49367779, Offset: 0x9b0
// Size: 0x10e
function katana_rush_sfx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        if (!isdefined(self.var_7804a42c)) {
            self playsound(localclientnum, #"hash_74fd1bb2db3d91ee");
            self.var_7804a42c = self playloopsound(#"hash_4f7953dcf02e2ba7");
        }
        return;
    }
    if (isdefined(self.var_7804a42c)) {
        self playsound(localclientnum, #"hash_76e75d7b16257c11");
        self stoploopsound(self.var_7804a42c);
        self.var_7804a42c = undefined;
    }
}

