#using scripts\core_common\clientfield_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\zm_utility;

#namespace zm_weap_ray_gun_mk2y;

// Namespace zm_weap_ray_gun_mk2y/zm_weap_ray_gun_mk2y
// Params 0, eflags: 0x2
// Checksum 0xaec9531d, Offset: 0xb0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"ray_gun_mk2y", &__init__, undefined, undefined);
}

// Namespace zm_weap_ray_gun_mk2y/zm_weap_ray_gun_mk2y
// Params 0, eflags: 0x0
// Checksum 0x61698a79, Offset: 0xf8
// Size: 0xb4
function __init__() {
    level._effect[#"hash_7772ff2676425bfb"] = #"hash_1993197e5796e1a3";
    level._effect[#"hash_776cf326763ddbe9"] = #"hash_198c2d7e5790e4f1";
    clientfield::register("allplayers", "" + #"ray_gun_mk2y_charged", 20000, 1, "int", &function_e1fdbb4b, 0, 0);
}

// Namespace zm_weap_ray_gun_mk2y/zm_weap_ray_gun_mk2y
// Params 7, eflags: 0x0
// Checksum 0xf6e1a6b6, Offset: 0x1b8
// Size: 0x112
function function_e1fdbb4b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self.var_92a2b5f2)) {
        killfx(localclientnum, self.var_92a2b5f2);
        self.var_92a2b5f2 = undefined;
    }
    if (newval == 1) {
        if (self zm_utility::function_f8796df3(localclientnum)) {
            self.var_92a2b5f2 = playviewmodelfx(localclientnum, level._effect[#"hash_7772ff2676425bfb"], "tag_flash");
            return;
        }
        self.var_92a2b5f2 = util::playfxontag(localclientnum, level._effect[#"hash_776cf326763ddbe9"], self, "tag_flash");
    }
}

