// Atian COD Tools GSC decompiler test
#include scripts/zm_common/zm_weapons.csc;
#include scripts/zm_common/zm_wallbuy.csc;
#include scripts/zm_common/zm_utility.csc;
#include script_624a704d0f6bf28d;
#include scripts/zm_common/zm_pack_a_punch.csc;
#include scripts/zm_common/zm.csc;
#include scripts/zm_common/load.csc;
#include scripts/core_common/util_shared.csc;
#include scripts/core_common/clientfield_shared.csc;
#include scripts/core_common/callbacks_shared.csc;
#include scripts/core_common/struct.csc;

#namespace namespace_59d4913f;

// Namespace namespace_59d4913f/namespace_43e842d1
// Params 0, eflags: 0x1 linked
// Checksum 0xf416557e, Offset: 0x178
// Size: 0x542
function init() {
    clientfield::register("world", "" + #"hash_3b4f11e825b1f62b", 8000, 1, "int", &function_5980b4fd, 0, 0);
    clientfield::register("world", "" + #"hash_300ef0a8a2afdab9", 8000, 3, "int", &function_8b09185, 0, 0);
    clientfield::register("world", "" + #"hash_300eefa8a2afd906", 8000, 3, "int", &function_1a723508, 0, 0);
    clientfield::register("world", "" + #"hash_300eeea8a2afd753", 8000, 3, "int", &function_e34446ad, 0, 0);
    clientfield::register("world", "" + #"hash_300eeda8a2afd5a0", 8000, 3, "int", &function_f4fe6a21, 0, 0);
    clientfield::register("world", "" + #"hash_155407a9010f2b23", 8000, 1, "int", &function_1edcfaa9, 0, 0);
    clientfield::register("world", "" + #"hash_70b438bea0135fc8", 8000, 3, "int", &function_860933ea, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_693891d7b7f47419", 8000, 2, "int", &function_813aa911, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_c2169a9806df05e", 8000, 1, "int", &function_4a77ba1b, 0, 0);
    clientfield::register("vehicle", "" + #"hash_7a260c02e8c345c2", 8000, 1, "int", &function_6736abbe, 0, 0);
    clientfield::register("actor", "" + #"hash_7a260c02e8c345c2", 8000, 1, "int", &function_6736abbe, 0, 0);
    clientfield::register("world", "" + #"hash_5f0c4b68b2a6a75d", 16000, 1, "int", &function_36123d34, 0, 0);
    namespace_617a54f4::function_d8383812("ee_asf_altar", 1, #"a_skeet_fink_charge", 400, level._effect[#"pap_projectile"], level._effect[#"pap_projectile_end"], undefined, undefined, 1);
    level._effect[#"hash_1a9940efe1d3ed25"] = #"hash_4fc9f92d9016ecad";
    level._effect[#"hash_7cd0c2ae0222691"] = #"hash_4a2a2a8ca5ef4c74";
    level._effect[#"hash_c2169a9806df05e"] = #"hash_34d06e6d2aa00b39";
    level._effect[#"hash_7a260c02e8c345c2"] = #"hash_65d0a2cee07e8664";
}

// Namespace namespace_59d4913f/namespace_43e842d1
// Params 7, eflags: 0x1 linked
// Checksum 0xfd6dc107, Offset: 0x6c8
// Size: 0x4d6
function function_5980b4fd(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, wasdemojump) {
    level.var_5e01899a = [];
    level.var_a791c3be = [];
    level.var_97a6ac9f = [];
    for (i = 0; i < 4; i++) {
        level.var_a791c3be[i] = [];
        level.var_a791c3be[i][0] = findvolumedecalindexarray("a_skeet_fink_carvel_0" + i + "_air");
        level.var_a791c3be[i][1] = findvolumedecalindexarray("a_skeet_fink_carvel_0" + i + "_earth");
        level.var_a791c3be[i][2] = findvolumedecalindexarray("a_skeet_fink_carvel_0" + i + "_fire");
        level.var_a791c3be[i][3] = findvolumedecalindexarray("a_skeet_fink_carvel_0" + i + "_water");
        foreach (var_9d4544e1 in level.var_a791c3be[i]) {
            foreach (var_97af50b7 in var_9d4544e1) {
                if (isdefined(var_97af50b7)) {
                    hidevolumedecal(var_97af50b7);
                }
            }
        }
    }
    for (i = 0; i < 4; i++) {
        level.var_97a6ac9f[i] = [];
        level.var_97a6ac9f[i][0] = findvolumedecalindexarray("a_skeet_fink_step_2_carvel_0" + i + "_air");
        level.var_97a6ac9f[i][1] = findvolumedecalindexarray("a_skeet_fink_step_2_carvel_0" + i + "_earth");
        level.var_97a6ac9f[i][2] = findvolumedecalindexarray("a_skeet_fink_step_2_carvel_0" + i + "_fire");
        level.var_97a6ac9f[i][3] = findvolumedecalindexarray("a_skeet_fink_step_2_carvel_0" + i + "_water");
        level.var_97a6ac9f[i][4] = findvolumedecalindexarray("a_skeet_fink_step_2_carvel_0" + i + "_slash");
        foreach (var_9d4544e1 in level.var_97a6ac9f[i]) {
            foreach (var_97af50b7 in var_9d4544e1) {
                if (isdefined(var_97af50b7)) {
                    hidevolumedecal(var_97af50b7);
                }
            }
        }
    }
}

// Namespace namespace_59d4913f/namespace_43e842d1
// Params 7, eflags: 0x1 linked
// Checksum 0xd3f9fa2f, Offset: 0xba8
// Size: 0x21c
function function_8b09185(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, wasdemojump) {
    if (newval) {
        level.var_5e01899a[0] = newval - 1;
        if (isdefined(level.var_a791c3be) && isdefined(level.var_a791c3be[0])) {
            var_1a257ffa = level.var_a791c3be[0][newval - 1];
        }
        if (isdefined(var_1a257ffa) && isarray(var_1a257ffa)) {
            foreach (var_97af50b7 in var_1a257ffa) {
                if (isdefined(var_97af50b7)) {
                    unhidevolumedecal(var_97af50b7);
                }
            }
        }
    } else {
        foreach (var_9d4544e1 in level.var_a791c3be[0]) {
            foreach (var_97af50b7 in var_9d4544e1) {
                if (isdefined(var_97af50b7)) {
                    hidevolumedecal(var_97af50b7);
                }
            }
        }
    }
}

// Namespace namespace_59d4913f/namespace_43e842d1
// Params 7, eflags: 0x1 linked
// Checksum 0xa979a4f1, Offset: 0xdd0
// Size: 0x22c
function function_1a723508(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, wasdemojump) {
    if (newval) {
        level.var_5e01899a[1] = newval - 1;
        if (isdefined(level.var_a791c3be) && isdefined(level.var_a791c3be[1])) {
            var_1a257ffa = level.var_a791c3be[1][newval - 1];
        }
        if (isdefined(var_1a257ffa) && isarray(var_1a257ffa)) {
            foreach (var_97af50b7 in var_1a257ffa) {
                if (isdefined(var_97af50b7)) {
                    unhidevolumedecal(var_97af50b7);
                }
            }
        }
    } else {
        foreach (var_9d4544e1 in level.var_a791c3be[1]) {
            foreach (var_97af50b7 in var_9d4544e1) {
                if (isdefined(var_97af50b7)) {
                    hidevolumedecal(var_97af50b7);
                }
            }
        }
    }
}

// Namespace namespace_59d4913f/namespace_43e842d1
// Params 7, eflags: 0x1 linked
// Checksum 0xe869529d, Offset: 0x1008
// Size: 0x22c
function function_e34446ad(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, wasdemojump) {
    if (newval) {
        level.var_5e01899a[2] = newval - 1;
        if (isdefined(level.var_a791c3be) && isdefined(level.var_a791c3be[2])) {
            var_1a257ffa = level.var_a791c3be[2][newval - 1];
        }
        if (isdefined(var_1a257ffa) && isarray(var_1a257ffa)) {
            foreach (var_97af50b7 in var_1a257ffa) {
                if (isdefined(var_97af50b7)) {
                    unhidevolumedecal(var_97af50b7);
                }
            }
        }
    } else {
        foreach (var_9d4544e1 in level.var_a791c3be[2]) {
            foreach (var_97af50b7 in var_9d4544e1) {
                if (isdefined(var_97af50b7)) {
                    hidevolumedecal(var_97af50b7);
                }
            }
        }
    }
}

// Namespace namespace_59d4913f/namespace_43e842d1
// Params 7, eflags: 0x1 linked
// Checksum 0x635e2d3f, Offset: 0x1240
// Size: 0x22c
function function_f4fe6a21(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, wasdemojump) {
    if (newval) {
        level.var_5e01899a[3] = newval - 1;
        if (isdefined(level.var_a791c3be) && isdefined(level.var_a791c3be[3])) {
            var_1a257ffa = level.var_a791c3be[3][newval - 1];
        }
        if (isdefined(var_1a257ffa) && isarray(var_1a257ffa)) {
            foreach (var_97af50b7 in var_1a257ffa) {
                if (isdefined(var_97af50b7)) {
                    unhidevolumedecal(var_97af50b7);
                }
            }
        }
    } else {
        foreach (var_9d4544e1 in level.var_a791c3be[3]) {
            foreach (var_97af50b7 in var_9d4544e1) {
                if (isdefined(var_97af50b7)) {
                    hidevolumedecal(var_97af50b7);
                }
            }
        }
    }
}

// Namespace namespace_59d4913f/namespace_43e842d1
// Params 7, eflags: 0x1 linked
// Checksum 0xce6ec2d0, Offset: 0x1478
// Size: 0x21e
function function_1edcfaa9(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, wasdemojump) {
    if (!isdefined(level.var_97a6ac9f)) {
        return;
    }
    if (newval) {
        for (i = 0; i < level.var_97a6ac9f.size; i++) {
            foreach (var_97af50b7 in level.var_97a6ac9f[i][level.var_5e01899a[i]]) {
                if (isdefined(var_97af50b7)) {
                    unhidevolumedecal(var_97af50b7);
                }
            }
        }
    } else {
        for (i = 0; i < level.var_97a6ac9f.size; i++) {
            foreach (var_9d4544e1 in level.var_97a6ac9f[i]) {
                foreach (var_97af50b7 in var_9d4544e1) {
                    if (isdefined(var_97af50b7)) {
                        hidevolumedecal(var_97af50b7);
                    }
                }
            }
        }
    }
}

// Namespace namespace_59d4913f/namespace_43e842d1
// Params 7, eflags: 0x1 linked
// Checksum 0xe1f7471c, Offset: 0x16a0
// Size: 0xd8
function function_860933ea(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, wasdemojump) {
    if (newval) {
        foreach (var_89319027 in level.var_97a6ac9f[newval - 1][4]) {
            if (isdefined(var_89319027)) {
                unhidevolumedecal(var_89319027);
            }
        }
    }
}

// Namespace namespace_59d4913f/namespace_43e842d1
// Params 7, eflags: 0x1 linked
// Checksum 0x89997cc7, Offset: 0x1780
// Size: 0xfa
function function_813aa911(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, wasdemojump) {
    switch (newval) {
    case 1:
        util::playfxontag(localclientnum, level._effect[#"hash_1a9940efe1d3ed25"], self, "tag_origin");
        break;
    case 2:
        util::playfxontag(localclientnum, level._effect[#"hash_7cd0c2ae0222691"], self, "tag_origin");
        break;
    default:
        break;
    }
}

// Namespace namespace_59d4913f/namespace_43e842d1
// Params 7, eflags: 0x1 linked
// Checksum 0xd7941134, Offset: 0x1888
// Size: 0xb2
function function_4a77ba1b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, wasdemojump) {
    if (isdefined(self.var_2dd2a2dd)) {
        stopfx(localclientnum, self.var_2dd2a2dd);
        self.var_2dd2a2dd = undefined;
    }
    if (newval) {
        self.var_2dd2a2dd = util::playfxontag(localclientnum, level._effect[#"hash_c2169a9806df05e"], self, "tag_origin");
    }
}

// Namespace namespace_59d4913f/namespace_43e842d1
// Params 7, eflags: 0x1 linked
// Checksum 0xdc6a1626, Offset: 0x1948
// Size: 0x7c
function function_6736abbe(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, wasdemojump) {
    if (newval) {
        util::playfxontag(localclientnum, level._effect[#"hash_7a260c02e8c345c2"], self, "j_neck");
    }
}

// Namespace namespace_59d4913f/namespace_43e842d1
// Params 7, eflags: 0x1 linked
// Checksum 0x9d3c689f, Offset: 0x19d0
// Size: 0x8c
function function_36123d34(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, wasdemojump) {
    if (newval) {
        forcestreamxmodel(#"hash_1a8e66a7966f8086");
    } else {
        stopforcestreamingxmodel(#"hash_1a8e66a7966f8086");
    }
}

