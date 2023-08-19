// Atian COD Tools GSC decompiler test
#include scripts/core_common/util_shared.csc;
#include scripts/core_common/clientfield_shared.csc;
#include scripts/core_common/system_shared.csc;

#namespace zm_weap_ray_gun;

// Namespace zm_weap_ray_gun/zm_weap_ray_gun
// Params 0, eflags: 0x2
// Checksum 0x751e06c0, Offset: 0xf8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"ray_gun", &__init__, undefined, undefined);
}

// Namespace zm_weap_ray_gun/zm_weap_ray_gun
// Params 0, eflags: 0x1 linked
// Checksum 0xf5300071, Offset: 0x140
// Size: 0xd4
function __init__() {
    level._effect[#"hash_64dc4c79d9035fca"] = #"hash_73bf7604340dd645";
    level._effect[#"hash_41c6282937fa564d"] = #"zombie/fx_powerup_on_green_zmb";
    level._effect[#"hash_537eedf1dffba786"] = #"zombie/fx_powerup_grab_green_zmb";
    clientfield::register("actor", "raygun_disintegrate", 20000, 1, "counter", &function_2602ff58, 0, 0);
}

// Namespace zm_weap_ray_gun/zm_weap_ray_gun
// Params 7, eflags: 0x1 linked
// Checksum 0x1dfabd97, Offset: 0x220
// Size: 0x274
function function_2602ff58(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    self endon(#"death");
    self playrenderoverridebundle(#"hash_1d387211bf187bab");
    util::playfxontag(localclientnum, level._effect[#"hash_41c6282937fa564d"], self, "j_spinelower");
    wait(0.55);
    util::playfxontag(localclientnum, level._effect[#"hash_41c6282937fa564d"], self, "j_spinelower");
    util::playfxontag(localclientnum, level._effect[#"hash_537eedf1dffba786"], self, "j_spinelower");
    util::playfxontag(localclientnum, level._effect[#"hash_41c6282937fa564d"], self, "j_head");
    util::playfxontag(localclientnum, level._effect[#"hash_64dc4c79d9035fca"], self, "j_head");
    util::playfxontag(localclientnum, level._effect[#"hash_64dc4c79d9035fca"], self, "j_shoulder_le");
    util::playfxontag(localclientnum, level._effect[#"hash_64dc4c79d9035fca"], self, "j_elbow_le");
    util::playfxontag(localclientnum, level._effect[#"hash_64dc4c79d9035fca"], self, "j_hip_ri");
    util::playfxontag(localclientnum, level._effect[#"hash_64dc4c79d9035fca"], self, "j_knee_le");
}

