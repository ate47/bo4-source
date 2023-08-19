// Atian COD Tools GSC decompiler test
#include scripts/core_common/util_shared.csc;
#include scripts/core_common/exploder_shared.csc;
#include scripts/core_common/clientfield_shared.csc;

#namespace zm_red_trap_boiling_bath;

// Namespace zm_red_trap_boiling_bath/zm_red_trap_boiling_bath
// Params 0, eflags: 0x1 linked
// Checksum 0xa9c84429, Offset: 0xd8
// Size: 0x10a
function init() {
    clientfield::register("actor", "boiling_trap_death_fx", 16000, 1, "int", &boiling_trap_death_fx, 0, 0);
    level._effect[#"hash_74231fd5ca0777d5"] = #"hash_4a3e0ecc06d7f471";
    level._effect[#"hash_9264b27ed7a10ae"] = #"hash_326e8ad99fb9a4d2";
    level._effect[#"hash_6f73421e00853979"] = #"hash_26ef50e01d7e97e5";
    level._effect[#"hash_2d586022ea5a3e3e"] = #"hash_5591c8559d52363a";
}

// Namespace zm_red_trap_boiling_bath/zm_red_trap_boiling_bath
// Params 7, eflags: 0x1 linked
// Checksum 0xb5577b31, Offset: 0x1f0
// Size: 0x22e
function boiling_trap_death_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 1) {
        self.var_5f1a7000 = util::playfxontag(localclientnum, level._effect[#"hash_74231fd5ca0777d5"], self, "j_elbow_le");
        self.var_259cede3 = util::playfxontag(localclientnum, level._effect[#"hash_9264b27ed7a10ae"], self, "j_elbow_ri");
        self._enemy_orb_explosion = util::playfxontag(localclientnum, level._effect[#"hash_6f73421e00853979"], self, "j_head");
        self.var_895fc896 = util::playfxontag(localclientnum, level._effect[#"hash_2d586022ea5a3e3e"], self, "j_spine4");
    } else {
        if (isdefined(self.var_5f1a7000)) {
            stopfx(localclientnum, self.var_5f1a7000);
            self.var_5f1a7000 = undefined;
        }
        if (isdefined(self.var_259cede3)) {
            stopfx(localclientnum, self.var_259cede3);
            self.var_259cede3 = undefined;
        }
        if (isdefined(self._enemy_orb_explosion)) {
            stopfx(localclientnum, self._enemy_orb_explosion);
            self._enemy_orb_explosion = undefined;
        }
        if (isdefined(self.var_895fc896)) {
            stopfx(localclientnum, self.var_895fc896);
            self.var_895fc896 = undefined;
        }
    }
}

